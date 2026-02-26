//! Full implementation of Common Lisp LOOP macro
//!
//! Supports:
//! - :with var [= val] - initialize variables
//! - :for var :in list - iterate over list
//! - :for (var1 . var2) :in list - destructuring iteration
//! - :for var :on list - iterate over successive cdrs
//! - :for (var1 var2) :on list - bind from successive cdrs
//! - :for var :from start :to/:below/:above end [:by step] - numeric iteration
//! - :when condition - conditional
//! - :unless condition - negative conditional
//! - :if condition - alias for :when
//! - :do body... - execute body for side effects
//! - :collect expr [:into var] - accumulate results
//! - :append expr [:into var] - append results
//! - :sum expr [:into var] - sum results
//! - :count expr [:into var] - count non-nil results
//! - :else :do body - alternative execution
//! - :finally body - cleanup/return
//! - :return expr - early return
//! - :while condition - continue while true
//! - :until condition - continue until true

use crate::ir::{ASTNode, ConstantValue};
use std::collections::HashMap;

/// Pattern for destructuring in :for clauses
#[derive(Debug)]
enum DestructurePattern {
    DottedPair(String, String),  // (a . b) - car and cdr vars
    List(Vec<String>),           // (a b c) - list of vars
}

/// Kind of symbols to iterate over in :being :the :symbols
#[derive(Debug, Clone, Copy)]
enum SymbolKind {
    AllSymbols,       // :symbols - all accessible symbols
    ExternalSymbols,  // :external-symbols - only external symbols
    PresentSymbols,   // :present-symbols - symbols directly in package
}

fn ensure_binding(bindings: &mut Vec<(String, ASTNode)>, name: &str, init: ASTNode) {
    if !bindings.iter().any(|(n, _)| n == name) {
        bindings.push((name.to_string(), init));
    }
}

fn rewrite_loop_return_calls(ast: &ASTNode, loop_name: &Option<String>) -> ASTNode {
    fn canonical_name(name: &str) -> String {
        name.rsplit(':')
            .next()
            .unwrap_or(name)
            .to_ascii_lowercase()
    }
    fn is_nil_designator(node: &ASTNode) -> bool {
        match node {
            ASTNode::Constant(ConstantValue::Nil) => true,
            ASTNode::Variable(v) => v.eq_ignore_ascii_case("nil"),
            _ => false,
        }
    }
    fn block_name_designator(node: &ASTNode) -> Option<String> {
        match node {
            ASTNode::Constant(ConstantValue::Nil) => Some("nil".to_string()),
            ASTNode::Variable(v) => Some(v.clone()),
            ASTNode::Constant(ConstantValue::Symbol(s)) => Some(s.clone()),
            _ => None,
        }
    }
    fn loop_return_form(value: ASTNode) -> ASTNode {
        ASTNode::progn(vec![
            ASTNode::setq(
                "__loop_return_values__",
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("multiple-value-list".to_string())),
                    args: vec![value],
                },
            ),
            ASTNode::setq(
                "__loop_return_value__",
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("first".to_string())),
                    args: vec![ASTNode::Variable("__loop_return_values__".to_string())],
                },
            ),
            ASTNode::setq("__loop_returned__", ASTNode::t()),
            ASTNode::setq("__loop_break__", ASTNode::t()),
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("values-list".to_string())),
                args: vec![ASTNode::Variable("__loop_return_values__".to_string())],
            },
        ])
    }
    fn matches_loop_block_name(name: &Option<String>, loop_name: &Option<String>) -> bool {
        match name {
            None => loop_name.is_none(),
            Some(n) => {
                if n.eq_ignore_ascii_case("nil") {
                    loop_name.is_none()
                } else if let Some(loop_n) = loop_name {
                    n.eq_ignore_ascii_case(loop_n)
                } else {
                    false
                }
            }
        }
    }

    match ast {
        ASTNode::Call { function, args } => {
            let callee_name = match function.as_ref() {
                ASTNode::Variable(name) => Some(name.as_str()),
                ASTNode::Constant(ConstantValue::Symbol(name)) => Some(name.as_str()),
                _ => None,
            };
            if let Some(name) = callee_name {
                let normalized = canonical_name(name);
                if normalized == "return" {
                    let value = args.get(0).map(|a| rewrite_loop_return_calls(a, loop_name)).unwrap_or_else(ASTNode::nil);
                    return loop_return_form(value);
                }
                if normalized == "return-from" {
                    let matches_target = args
                        .get(0)
                        .and_then(block_name_designator)
                        .map(|n| {
                            if n.eq_ignore_ascii_case("nil") {
                                loop_name.is_none()
                            } else if let Some(loop_n) = loop_name {
                                n.eq_ignore_ascii_case(loop_n)
                            } else {
                                false
                            }
                        })
                        .unwrap_or(false);
                    if matches_target {
                        let value = args.get(1).map(|a| rewrite_loop_return_calls(a, loop_name)).unwrap_or_else(ASTNode::nil);
                        return loop_return_form(value);
                    }
                }
                if normalized == "return-from"
                    && args.get(0).map_or(false, is_nil_designator)
                    && loop_name.is_none()
                {
                    let value = args.get(1).map(|a| rewrite_loop_return_calls(a, loop_name)).unwrap_or_else(ASTNode::nil);
                    return loop_return_form(value);
                }
            }
            ASTNode::Call {
                function: Box::new(rewrite_loop_return_calls(function, loop_name)),
                args: args.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
            }
        }
        ASTNode::If { test, then_branch, else_branch } => ASTNode::If {
            test: Box::new(rewrite_loop_return_calls(test, loop_name)),
            then_branch: Box::new(rewrite_loop_return_calls(then_branch, loop_name)),
            else_branch: Box::new(rewrite_loop_return_calls(else_branch, loop_name)),
        },
        ASTNode::Cond { clauses } => ASTNode::Cond {
            clauses: clauses
                .iter()
                .map(|(test, result)| {
                    (
                        rewrite_loop_return_calls(test, loop_name),
                        rewrite_loop_return_calls(result, loop_name),
                    )
                })
                .collect(),
        },
        ASTNode::Let { bindings, body } => ASTNode::Let {
            bindings: bindings
                .iter()
                .map(|(n, v)| (n.clone(), rewrite_loop_return_calls(v, loop_name)))
                .collect(),
            body: body.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::LetStar { bindings, body } => ASTNode::LetStar {
            bindings: bindings
                .iter()
                .map(|(n, v)| (n.clone(), rewrite_loop_return_calls(v, loop_name)))
                .collect(),
            body: body.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::Setq { var, value } => ASTNode::Setq {
            var: var.clone(),
            value: Box::new(rewrite_loop_return_calls(value, loop_name)),
        },
        ASTNode::ReturnFrom { block_name, value } => {
            if matches_loop_block_name(block_name, loop_name) {
                let val = value
                    .as_ref()
                    .map(|v| rewrite_loop_return_calls(v, loop_name))
                    .unwrap_or_else(ASTNode::nil);
                loop_return_form(val)
            } else {
                ASTNode::ReturnFrom {
                    block_name: block_name.clone(),
                    value: value.as_ref().map(|v| Box::new(rewrite_loop_return_calls(v, loop_name))),
                }
            }
        }
        ASTNode::Progn { exprs } => ASTNode::Progn {
            exprs: exprs.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::Dotimes { var, count, result, body } => ASTNode::Dotimes {
            var: var.clone(),
            count: Box::new(rewrite_loop_return_calls(count, loop_name)),
            result: result.as_ref().map(|r| Box::new(rewrite_loop_return_calls(r, loop_name))),
            body: body.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::Dolist { var, list, result, body } => ASTNode::Dolist {
            var: var.clone(),
            list: Box::new(rewrite_loop_return_calls(list, loop_name)),
            result: result.as_ref().map(|r| Box::new(rewrite_loop_return_calls(r, loop_name))),
            body: body.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::Loop { var, start, limit, when_condition, collect, sum, else_collect, else_sum } => ASTNode::Loop {
            var: var.clone(),
            start: start.as_ref().map(|s| Box::new(rewrite_loop_return_calls(s, loop_name))),
            limit: Box::new(rewrite_loop_return_calls(limit, loop_name)),
            when_condition: when_condition.as_ref().map(|c| Box::new(rewrite_loop_return_calls(c, loop_name))),
            collect: collect.as_ref().map(|c| Box::new(rewrite_loop_return_calls(c, loop_name))),
            sum: sum.as_ref().map(|s| Box::new(rewrite_loop_return_calls(s, loop_name))),
            else_collect: else_collect.as_ref().map(|c| Box::new(rewrite_loop_return_calls(c, loop_name))),
            else_sum: else_sum.as_ref().map(|s| Box::new(rewrite_loop_return_calls(s, loop_name))),
        },
        ASTNode::DottedPair { car, cdr } => ASTNode::DottedPair {
            car: Box::new(rewrite_loop_return_calls(car, loop_name)),
            cdr: Box::new(rewrite_loop_return_calls(cdr, loop_name)),
        },
        ASTNode::Backquote(inner) => ASTNode::Backquote(Box::new(rewrite_loop_return_calls(inner, loop_name))),
        ASTNode::Unquote(inner) => ASTNode::Unquote(Box::new(rewrite_loop_return_calls(inner, loop_name))),
        ASTNode::UnquoteSplicing(inner) => {
            ASTNode::UnquoteSplicing(Box::new(rewrite_loop_return_calls(inner, loop_name)))
        }
        ASTNode::CCall { function, args } => ASTNode::CCall {
            function: function.clone(),
            args: args.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::CppMethodCall { object, method, args } => ASTNode::CppMethodCall {
            object: Box::new(rewrite_loop_return_calls(object, loop_name)),
            method: method.clone(),
            args: args.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::HashTable { entries } => ASTNode::HashTable {
            entries: entries
                .iter()
                .map(|(k, v)| {
                    (
                        rewrite_loop_return_calls(k, loop_name),
                        rewrite_loop_return_calls(v, loop_name),
                    )
                })
                .collect(),
        },
        ASTNode::Vector(items) => {
            ASTNode::Vector(items.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect())
        }
        ASTNode::Defmethod { generic_name, qualifier, specializers, params, body } => ASTNode::Defmethod {
            generic_name: generic_name.clone(),
            qualifier: qualifier.clone(),
            specializers: specializers.clone(),
            params: params.clone(),
            body: body.iter().map(|a| rewrite_loop_return_calls(a, loop_name)).collect(),
        },
        ASTNode::Defclass { name, superclasses, slots } => ASTNode::Defclass {
            name: name.clone(),
            superclasses: superclasses.clone(),
            slots: slots.clone(),
        },
        ASTNode::Defgeneric { name, lambda_list } => ASTNode::Defgeneric {
            name: name.clone(),
            lambda_list: lambda_list.clone(),
        },
        // Preserve nested lexical control boundaries and quoted forms.
        ASTNode::Lambda { .. }
        | ASTNode::Macro { .. }
        | ASTNode::Block { .. }
        | ASTNode::Quote(_)
        | ASTNode::Constant(_)
        | ASTNode::Variable(_) => ast.clone(),
    }
}

fn contains_loop_return_state(nodes: &[ASTNode]) -> bool {
    fn walk(ast: &ASTNode) -> bool {
        match ast {
            ASTNode::Setq { var, value } => {
                if var == "__loop_returned__" || var == "__loop_break__" {
                    return true;
                }
                walk(value)
            }
            ASTNode::Call { function, args } => walk(function) || args.iter().any(walk),
            ASTNode::If { test, then_branch, else_branch } => {
                walk(test) || walk(then_branch) || walk(else_branch)
            }
            ASTNode::Cond { clauses } => clauses.iter().any(|(t, r)| walk(t) || walk(r)),
            ASTNode::Let { bindings, body } | ASTNode::LetStar { bindings, body } => {
                bindings.iter().any(|(_, v)| walk(v)) || body.iter().any(walk)
            }
            ASTNode::Progn { exprs } => exprs.iter().any(walk),
            ASTNode::Dotimes { count, result, body, .. } => {
                walk(count) || result.as_ref().map_or(false, |r| walk(r)) || body.iter().any(walk)
            }
            ASTNode::Dolist { list, result, body, .. } => {
                walk(list) || result.as_ref().map_or(false, |r| walk(r)) || body.iter().any(walk)
            }
            ASTNode::Loop { start, limit, when_condition, collect, sum, else_collect, else_sum, .. } => {
                start.as_ref().map_or(false, |s| walk(s))
                    || walk(limit)
                    || when_condition.as_ref().map_or(false, |c| walk(c))
                    || collect.as_ref().map_or(false, |c| walk(c))
                    || sum.as_ref().map_or(false, |s| walk(s))
                    || else_collect.as_ref().map_or(false, |c| walk(c))
                    || else_sum.as_ref().map_or(false, |s| walk(s))
            }
            ASTNode::ReturnFrom { value, .. } => value.as_ref().map_or(false, |v| walk(v)),
            ASTNode::Quote(_) | ASTNode::Lambda { .. } | ASTNode::Macro { .. } | ASTNode::Block { .. } => false,
            ASTNode::DottedPair { car, cdr } => walk(car) || walk(cdr),
            ASTNode::Backquote(inner) | ASTNode::Unquote(inner) | ASTNode::UnquoteSplicing(inner) => walk(inner),
            ASTNode::CCall { args, .. } => args.iter().any(walk),
            ASTNode::CppMethodCall { object, args, .. } => walk(object) || args.iter().any(walk),
            ASTNode::HashTable { entries } => entries.iter().any(|(k, v)| walk(k) || walk(v)),
            ASTNode::Vector(items) => items.iter().any(walk),
            ASTNode::Defmethod { body, .. } => body.iter().any(walk),
            ASTNode::Defclass { .. } | ASTNode::Defgeneric { .. } | ASTNode::Constant(_) | ASTNode::Variable(_) => false,
        }
    }
    nodes.iter().any(walk)
}

fn loop_list_type_guard(list_var: &str) -> ASTNode {
    // Signal TYPE-ERROR if LIST-VAR is neither NIL nor CONS.
    ASTNode::If {
        test: Box::new(ASTNode::Call {
            function: Box::new(ASTNode::Variable("and".to_string())),
            args: vec![
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("not".to_string())),
                    args: vec![ASTNode::Call {
                        function: Box::new(ASTNode::Variable("null".to_string())),
                        args: vec![ASTNode::Variable(list_var.to_string())],
                    }],
                },
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("not".to_string())),
                    args: vec![ASTNode::Call {
                        function: Box::new(ASTNode::Variable("consp".to_string())),
                        args: vec![ASTNode::Variable(list_var.to_string())],
                    }],
                },
            ],
        }),
        then_branch: Box::new(ASTNode::Call {
            // Exit the loop block immediately so later loop forms do not run after type failure.
            function: Box::new(ASTNode::Variable("return-from".to_string())),
            args: vec![
                ASTNode::nil(),
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("error".to_string())),
                    args: vec![ASTNode::Quote(Box::new(ASTNode::Variable("type-error".to_string())))],
                },
            ],
        }),
        else_branch: Box::new(ASTNode::nil()),
    }
}

/// Parse and expand a loop form
pub fn expand_loop(args: &[ASTNode]) -> ASTNode {
    if args.is_empty() {
        // Infinite loop - (loop) with no body
        return ASTNode::nil();
    }

    // Check if this is a simple loop (no keywords, just body)
    let first_is_keyword = is_loop_keyword_any(&args[0]);
    if !first_is_keyword {
        // Simple loop: (loop body...) has an implicit NIL block so (return ...)
        // can exit with values. We still execute a single pass for now.
        return ASTNode::Call {
            function: Box::new(ASTNode::Variable("block".to_string())),
            args: vec![ASTNode::nil(), ASTNode::progn(args.to_vec())],
        };
    }

    // Parse loop clauses
    let mut parser = LoopParser::new(args);
    parser.parse();
    let expanded = parser.generate();
    if std::env::var("RLASP_TRACE_LOOP_EXPAND").is_ok() {
        eprintln!("[loop-expand] input={:?}", args);
        eprintln!("[loop-expand] output={:?}", expanded);
    }
    expanded
}

/// Check if a node is any loop keyword
fn is_loop_keyword_any(node: &ASTNode) -> bool {
    let kw = match node {
        ASTNode::Variable(kw) => Some(kw.as_str()),
        ASTNode::Constant(ConstantValue::Symbol(kw)) => Some(kw.as_str()),
        _ => None,
    };
    if let Some(kw) = kw {
        let kw_lower = kw.rsplit(':').next().unwrap_or(kw).trim_start_matches(':').to_lowercase();
        matches!(kw_lower.as_str(),
            "with" | ":with" |
            "for" | ":for" |
            "as" | ":as" |
            "and" | ":and" |
            "in" | ":in" |
            "on" | ":on" |
            "across" | ":across" |
            "of-type" | ":of-type" |
            "from" | ":from" |
            "downfrom" | ":downfrom" |
            "upfrom" | ":upfrom" |
            "downto" | ":downto" |
            "to" | ":to" |
            "below" | ":below" |
            "above" | ":above" |
            "by" | ":by" |
            "being" | ":being" |
            "the" | ":the" |
            "hash-keys" | ":hash-keys" |
            "hash-values" | ":hash-values" |
            "of" | ":of" |
            "do" | ":do" |
            "doing" | ":doing" |
            "collect" | ":collect" |
            "collecting" | ":collecting" |
            "append" | ":append" |
            "appending" | ":appending" |
            "nconc" | ":nconc" |
            "nconcing" | ":nconcing" |
            "sum" | ":sum" |
            "summing" | ":summing" |
            "count" | ":count" |
            "counting" | ":counting" |
            "maximize" | ":maximize" |
            "maximizing" | ":maximizing" |
            "minimize" | ":minimize" |
            "minimizing" | ":minimizing" |
            "into" | ":into" |
            "when" | ":when" |
            "if" | ":if" |
            "unless" | ":unless" |
            "else" | ":else" |
            "end" | ":end" |
            "while" | ":while" |
            "until" | ":until" |
            "repeat" | ":repeat" |
            "always" | ":always" |
            "never" | ":never" |
            "thereis" | ":thereis" |
            "finally" | ":finally" |
            "return" | ":return" |
            "initially" | ":initially" |
            "named" | ":named"
        )
    } else {
        false
    }
}

/// Check if a node matches a specific loop keyword
fn is_loop_keyword(node: &ASTNode, keyword: &str) -> bool {
    let kw = match node {
        ASTNode::Variable(kw) => Some(kw.as_str()),
        ASTNode::Constant(ConstantValue::Symbol(kw)) => Some(kw.as_str()),
        _ => None,
    };
    if let Some(kw) = kw {
        let kw_lower = kw.rsplit(':').next().unwrap_or(kw).trim_start_matches(':').to_lowercase();
        kw_lower == keyword
    } else {
        false
    }
}

#[derive(Debug, Clone)]
enum LoopClause {
    /// :with var [= init]
    With { var: String, init: Option<ASTNode> },

    /// :with (var1 var2 ...) = init - destructuring with
    WithDestructure { vars: Vec<String>, init: ASTNode },

    /// :for var :in list [:by step] - simple iteration
    ForIn { var: String, list: ASTNode, by: Option<ASTNode> },

    /// :for var :across sequence - iterate over sequence elements
    ForAcross { var: String, seq: ASTNode },

    /// :for (var1 . var2) :in list [:by step] - destructuring iteration
    ForInDestructure { car_var: String, cdr_var: String, list: ASTNode, by: Option<ASTNode> },

    /// :for var :on list [:by step] - iterate over successive cdrs
    ForOn { var: String, list: ASTNode, by: Option<ASTNode> },

    /// :for (var1 var2 ...) :on list [:by step] - bind vars from successive cdrs
    ForOnDestructure { vars: Vec<String>, list: ASTNode, by: Option<ASTNode> },

    /// :for var :from start :to end [:by step]
    ForFromTo { var: String, start: ASTNode, end: ASTNode, step: Option<ASTNode>, inclusive: bool, down: bool },

    /// :for var :below limit
    ForBelow { var: String, limit: ASTNode },

    /// :for var :being :the :hash-keys :of hash-table
    ForHashKeys { var: String, hash_table: ASTNode },

    /// :for var :being :the :hash-values :of hash-table
    ForHashValues { var: String, hash_table: ASTNode },

    /// :for var :being :the :symbols :in package
    ForSymbols { var: String, package: ASTNode, symbol_kind: SymbolKind },

    /// :for var = init [:then step] - per-iteration binding
    ForEquals { var: String, init: ASTNode, then_expr: Option<ASTNode> },

    /// :for (var1 var2 ...) = init [:then step] - destructuring per-iteration binding
    ForEqualsDestructure { vars: Vec<String>, init: ASTNode, then_expr: Option<ASTNode> },

    /// :when condition
    When { condition: ASTNode },

    /// :unless condition
    Unless { condition: ASTNode },

    /// :do body...
    Do { body: Vec<ASTNode> },

    /// :else :do body...
    Else { body: Vec<ASTNode> },

    /// :collect expr [:into var]
    Collect { expr: ASTNode, into: Option<String> },

    /// :append expr [:into var]
    Append { expr: ASTNode, into: Option<String> },

    /// :sum expr [:into var]
    Sum { expr: ASTNode, into: Option<String> },

    /// :count expr [:into var]
    Count { expr: ASTNode, into: Option<String> },

    /// :while condition
    While { condition: ASTNode },

    /// :until condition
    Until { condition: ASTNode },

    /// :finally body...
    Finally { body: Vec<ASTNode> },

    /// :return expr
    Return { expr: ASTNode },

    /// :end - close a conditional block
    End,

    /// :thereis expr - return first non-nil value
    Thereis { expr: ASTNode },

    /// :always expr - return T if all iterations are true
    Always { expr: ASTNode },

    /// :never expr - return T if no iterations are true
    Never { expr: ASTNode },

    /// :maximize expr [:into var]
    Maximize { expr: ASTNode, into: Option<String> },

    /// :minimize expr [:into var]
    Minimize { expr: ASTNode, into: Option<String> },

    /// :nconc expr [:into var]
    Nconc { expr: ASTNode, into: Option<String> },

    /// :repeat count - loop count times
    Repeat { count: ASTNode },

    /// :initially body - execute before loop
    Initially { body: Vec<ASTNode> },

    /// :named name - give the loop a name for return-from
    Named { name: String },
}

struct LoopParser<'a> {
    args: &'a [ASTNode],
    pos: usize,
    clauses: Vec<LoopClause>,
}

impl<'a> LoopParser<'a> {
    fn new(args: &'a [ASTNode]) -> Self {
        Self {
            args,
            pos: 0,
            clauses: Vec::new(),
        }
    }

    fn current(&self) -> Option<&ASTNode> {
        self.args.get(self.pos)
    }

    fn advance(&mut self) -> Option<&ASTNode> {
        let node = self.args.get(self.pos);
        self.pos += 1;
        node
    }

    fn peek(&self, offset: usize) -> Option<&ASTNode> {
        self.args.get(self.pos + offset)
    }

    fn parse(&mut self) {
        while self.pos < self.args.len() {
            if let Some(clause) = self.parse_clause() {
                self.clauses.push(clause);
            } else {
                self.pos += 1; // Skip unknown
            }
        }
    }

    fn parse_clause(&mut self) -> Option<LoopClause> {
        let node = self.current()?;

        if is_loop_keyword(node, "with") {
            self.parse_with()
        } else if is_loop_keyword(node, "for") || is_loop_keyword(node, "as") || is_loop_keyword(node, "and") {
            self.parse_for()
        } else if is_loop_keyword(node, "when") || is_loop_keyword(node, "if") {
            self.parse_when()
        } else if is_loop_keyword(node, "unless") {
            self.parse_unless()
        } else if is_loop_keyword(node, "do") || is_loop_keyword(node, "doing") {
            self.parse_do()
        } else if is_loop_keyword(node, "else") {
            self.parse_else()
        } else if is_loop_keyword(node, "collect") || is_loop_keyword(node, "collecting") {
            self.parse_collect()
        } else if is_loop_keyword(node, "append") || is_loop_keyword(node, "appending") {
            self.parse_append()
        } else if is_loop_keyword(node, "sum") || is_loop_keyword(node, "summing") {
            self.parse_sum()
        } else if is_loop_keyword(node, "count") || is_loop_keyword(node, "counting") {
            self.parse_count()
        } else if is_loop_keyword(node, "while") {
            self.parse_while()
        } else if is_loop_keyword(node, "until") {
            self.parse_until()
        } else if is_loop_keyword(node, "finally") {
            self.parse_finally()
        } else if is_loop_keyword(node, "return") {
            self.parse_return()
        } else if is_loop_keyword(node, "end") {
            self.advance(); // consume :end
            Some(LoopClause::End)
        } else if is_loop_keyword(node, "thereis") {
            self.parse_thereis()
        } else if is_loop_keyword(node, "always") {
            self.parse_always()
        } else if is_loop_keyword(node, "never") {
            self.parse_never()
        } else if is_loop_keyword(node, "maximize") || is_loop_keyword(node, "maximizing") {
            self.parse_maximize()
        } else if is_loop_keyword(node, "minimize") || is_loop_keyword(node, "minimizing") {
            self.parse_minimize()
        } else if is_loop_keyword(node, "nconc") || is_loop_keyword(node, "nconcing") {
            self.parse_nconc()
        } else if is_loop_keyword(node, "repeat") {
            self.parse_repeat()
        } else if is_loop_keyword(node, "initially") {
            self.parse_initially()
        } else if is_loop_keyword(node, "named") {
            self.parse_named()
        } else {
            None
        }
    }

    fn parse_with(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :with

        // Check for destructuring pattern (var1 var2 ...)
        if let Some(next) = self.current() {
            if let ASTNode::Call { function, args } = next {
                if let ASTNode::Variable(first_var) = function.as_ref() {
                    let mut vars = vec![first_var.clone()];
                    let mut all_vars = true;
                    for arg in args {
                        if let ASTNode::Variable(v) = arg {
                            vars.push(v.clone());
                        } else {
                            all_vars = false;
                            break;
                        }
                    }
                    if all_vars && !vars.is_empty() {
                        self.advance(); // consume the pattern
                        // Expect = init
                        if let Some(ASTNode::Variable(eq)) = self.current() {
                            if eq == "=" {
                                self.advance(); // consume =
                                let init = self.advance()?.clone();
                                return Some(LoopClause::WithDestructure { vars, init });
                            }
                        }
                        // No = means nil init for each
                        return Some(LoopClause::WithDestructure { vars, init: ASTNode::nil() });
                    }
                }
            }
        }

        let var = match self.advance()? {
            ASTNode::Variable(v) => v.clone(),
            _ => return None,
        };

        // Check for = init
        let init = if let Some(node) = self.current() {
            if let ASTNode::Variable(v) = node {
                if v == "=" {
                    self.advance(); // consume =
                    Some(self.advance()?.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::With { var, init })
    }

    fn parse_for(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :for

        // Check for destructuring patterns:
        // - (var1 . var2) - DottedPair for :in
        // - (var1 var2 ...) - Call/list for :on
        let destructure_info = if let Some(next) = self.current() {
            match next {
                ASTNode::DottedPair { car, cdr } => {
                    // Dotted pair: (var1 . var2)
                    if let ASTNode::Variable(car_var) = car.as_ref() {
                        if let ASTNode::Variable(cdr_var) = cdr.as_ref() {
                            Some(DestructurePattern::DottedPair(car_var.clone(), cdr_var.clone()))
                        } else {
                            None
                        }
                    } else {
                        None
                    }
                }
                ASTNode::Call { function, args } => {
                    // List pattern: (var1 var2 ...)
                    // The "function" is the first variable
                    if let ASTNode::Variable(first_var) = function.as_ref() {
                        let mut vars = vec![first_var.clone()];
                        let mut all_vars = true;
                        for arg in args {
                            if let ASTNode::Variable(v) = arg {
                                vars.push(v.clone());
                            } else {
                                all_vars = false;
                                break;
                            }
                        }
                        if all_vars && !vars.is_empty() {
                            Some(DestructurePattern::List(vars))
                        } else {
                            None
                        }
                    } else {
                        None
                    }
                }
                _ => None
            }
        } else {
            None
        };

        if let Some(pattern) = destructure_info {
            self.advance(); // consume the pattern

            if let Some(kw) = self.current() {
                match pattern {
                    DestructurePattern::DottedPair(car_var, cdr_var) => {
                        // Dotted pair works with :in
                        if is_loop_keyword(kw, "in") {
                            self.advance(); // consume :in
                            let list = self.advance()?.clone();
                            let by = self.parse_optional_by();
                            return Some(LoopClause::ForInDestructure {
                                car_var,
                                cdr_var,
                                list,
                                by,
                            });
                        }
                    }
                    DestructurePattern::List(vars) => {
                        // List pattern works with :on
                        if is_loop_keyword(kw, "on") {
                            self.advance(); // consume :on
                            let list = self.advance()?.clone();
                            let by = self.parse_optional_by();
                            return Some(LoopClause::ForOnDestructure {
                                vars,
                                list,
                                by,
                            });
                        }
                        // List pattern can also work with :in (bind from each element)
                        if is_loop_keyword(kw, "in") {
                            self.advance(); // consume :in
                            let list = self.advance()?.clone();
                            let by = self.parse_optional_by();
                            // For :in with list pattern, destructure each list element
                            return Some(LoopClause::ForOnDestructure {
                                vars,
                                list,
                                by,
                            });
                        }
                        // List pattern with = (destructuring per-iteration binding)
                        if let ASTNode::Variable(eq) = kw {
                            if eq == "=" {
                                self.advance(); // consume =
                                let init = self.advance()?.clone();
                                let mut then_expr = None;
                                if let Some(next_kw) = self.current() {
                                    if is_loop_keyword(next_kw, "then") {
                                        self.advance(); // consume :then
                                        then_expr = Some(self.advance()?.clone());
                                    }
                                }
                                return Some(LoopClause::ForEqualsDestructure {
                                    vars,
                                    init,
                                    then_expr,
                                });
                            }
                        }
                    }
                }
            }
        }

        // Simple variable
        let var = match self.advance()? {
            ASTNode::Variable(v) => v.clone(),
            _ => return None,
        };

        // Handle OF-TYPE type-spec (just skip the type declaration)
        if let Some(kw) = self.current() {
            if is_loop_keyword(kw, "of-type") {
                self.advance(); // consume of-type
                self.advance(); // consume type-spec (symbol or list)
            }
        }

        // Check what kind of for clause
        let keyword = self.current()?;

        // Check for = (binding form)
        if let ASTNode::Variable(kw) = keyword {
            if kw == "=" {
                self.advance(); // consume =
                let init = self.advance()?.clone();
                let mut then_expr = None;
                if let Some(next_kw) = self.current() {
                    if is_loop_keyword(next_kw, "then") {
                        self.advance(); // consume :then
                        then_expr = Some(self.advance()?.clone());
                    }
                }
                return Some(LoopClause::ForEquals { var, init, then_expr });
            }
        }

        if is_loop_keyword(keyword, "in") {
            self.advance(); // consume :in
            let list = self.advance()?.clone();
            let by = self.parse_optional_by();
            Some(LoopClause::ForIn { var, list, by })
        } else if is_loop_keyword(keyword, "across") {
            self.advance(); // consume :across
            let seq = self.advance()?.clone();
            Some(LoopClause::ForAcross { var, seq })
        } else if is_loop_keyword(keyword, "on") {
            self.advance(); // consume :on
            let list = self.advance()?.clone();
            let by = self.parse_optional_by();
            Some(LoopClause::ForOn { var, list, by })
        } else if is_loop_keyword(keyword, "from") {
            self.advance(); // consume :from
            let start = self.advance()?.clone();

            // Look for :to, :below, :above, :downto
            let mut end = ASTNode::nil();
            let mut inclusive = true;
            let mut step = None;
            let mut down = false;

            while let Some(kw) = self.current() {
                if is_loop_keyword(kw, "to") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = true;
                } else if is_loop_keyword(kw, "downto") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = true;
                    down = true;
                } else if is_loop_keyword(kw, "below") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = false;
                } else if is_loop_keyword(kw, "above") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = false;
                    down = true;
                } else if is_loop_keyword(kw, "by") {
                    self.advance();
                    step = Some(self.advance()?.clone());
                } else {
                    break;
                }
            }

            // For downward iteration, negate the step
            if down {
                let neg_step = step.unwrap_or_else(|| ASTNode::Constant(ConstantValue::Fixnum(1)));
                let actual_step = ASTNode::Call {
                    function: Box::new(ASTNode::Variable("-".to_string())),
                    args: vec![neg_step],
                };
                Some(LoopClause::ForFromTo { var, start, end, step: Some(actual_step), inclusive, down: true })
            } else {
                Some(LoopClause::ForFromTo { var, start, end, step, inclusive, down: false })
            }
        } else if is_loop_keyword(keyword, "downfrom") {
            self.advance(); // consume :downfrom
            let start = self.advance()?.clone();
            let mut end = ASTNode::nil();
            let mut inclusive = true;
            let mut step = None;

            while let Some(kw) = self.current() {
                if is_loop_keyword(kw, "to") || is_loop_keyword(kw, "downto") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = true;
                } else if is_loop_keyword(kw, "above") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = false;
                } else if is_loop_keyword(kw, "by") {
                    self.advance();
                    step = Some(self.advance()?.clone());
                } else {
                    break;
                }
            }

            // For downfrom, step is negative
            let neg_step = step.unwrap_or_else(|| ASTNode::Constant(ConstantValue::Fixnum(1)));
            let actual_step = ASTNode::Call {
                function: Box::new(ASTNode::Variable("-".to_string())),
                args: vec![neg_step],
            };

            Some(LoopClause::ForFromTo { var, start, end, step: Some(actual_step), inclusive, down: true })
        } else if is_loop_keyword(keyword, "upfrom") {
            self.advance(); // consume :upfrom
            let start = self.advance()?.clone();
            let mut end = ASTNode::nil();
            let mut inclusive = true;
            let mut step = None;

            while let Some(kw) = self.current() {
                if is_loop_keyword(kw, "to") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = true;
                } else if is_loop_keyword(kw, "below") {
                    self.advance();
                    end = self.advance()?.clone();
                    inclusive = false;
                } else if is_loop_keyword(kw, "by") {
                    self.advance();
                    step = Some(self.advance()?.clone());
                } else {
                    break;
                }
            }

            Some(LoopClause::ForFromTo { var, start, end, step, inclusive, down: false })
        } else if is_loop_keyword(keyword, "below") {
            self.advance(); // consume :below
            let limit = self.advance()?.clone();
            Some(LoopClause::ForBelow { var, limit })
        } else if is_loop_keyword(keyword, "being") {
            // :for var :being :the :hash-keys/:hash-values/:symbols/:external-symbols/:present-symbols
            self.advance(); // consume :being

            // Expect :the (optional in some implementations, but we'll allow it)
            if let Some(kw) = self.current() {
                if is_loop_keyword(kw, "the") {
                    self.advance(); // consume :the
                }
            }

            // Expect the iteration type keyword
            if let Some(kw) = self.current() {
                if is_loop_keyword(kw, "hash-keys") {
                    self.advance(); // consume :hash-keys

                    // Expect :of (or :in)
                    if let Some(kw2) = self.current() {
                        if is_loop_keyword(kw2, "of") || is_loop_keyword(kw2, "in") {
                            self.advance(); // consume :of/:in
                        }
                    }

                    let hash_table = self.advance()?.clone();
                    Some(LoopClause::ForHashKeys { var, hash_table })
                } else if is_loop_keyword(kw, "hash-values") {
                    self.advance(); // consume :hash-values

                    // Expect :of (or :in)
                    if let Some(kw2) = self.current() {
                        if is_loop_keyword(kw2, "of") || is_loop_keyword(kw2, "in") {
                            self.advance(); // consume :of/:in
                        }
                    }

                    let hash_table = self.advance()?.clone();
                    Some(LoopClause::ForHashValues { var, hash_table })
                } else if is_loop_keyword(kw, "symbols") {
                    self.advance(); // consume :symbols

                    // Expect :of (or :in)
                    if let Some(kw2) = self.current() {
                        if is_loop_keyword(kw2, "of") || is_loop_keyword(kw2, "in") {
                            self.advance(); // consume :of/:in
                        }
                    }

                    let package = self.advance()?.clone();
                    Some(LoopClause::ForSymbols { var, package, symbol_kind: SymbolKind::AllSymbols })
                } else if is_loop_keyword(kw, "external-symbols") {
                    self.advance(); // consume :external-symbols

                    // Expect :of (or :in)
                    if let Some(kw2) = self.current() {
                        if is_loop_keyword(kw2, "of") || is_loop_keyword(kw2, "in") {
                            self.advance(); // consume :of/:in
                        }
                    }

                    let package = self.advance()?.clone();
                    Some(LoopClause::ForSymbols { var, package, symbol_kind: SymbolKind::ExternalSymbols })
                } else if is_loop_keyword(kw, "present-symbols") {
                    self.advance(); // consume :present-symbols

                    // Expect :of (or :in)
                    if let Some(kw2) = self.current() {
                        if is_loop_keyword(kw2, "of") || is_loop_keyword(kw2, "in") {
                            self.advance(); // consume :of/:in
                        }
                    }

                    let package = self.advance()?.clone();
                    Some(LoopClause::ForSymbols { var, package, symbol_kind: SymbolKind::PresentSymbols })
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        }
    }

    fn parse_optional_by(&mut self) -> Option<ASTNode> {
        if let Some(node) = self.current() {
            if is_loop_keyword(node, "by") {
                self.advance(); // consume :by
                return self.advance().cloned();
            }
        }
        None
    }

    fn parse_when(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :when/:if
        let condition = self.advance()?.clone();
        Some(LoopClause::When { condition })
    }

    fn parse_unless(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :unless
        let condition = self.advance()?.clone();
        Some(LoopClause::Unless { condition })
    }

    fn parse_do(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :do
        let mut body = Vec::new();

        // Collect body expressions until we hit another keyword
        while let Some(node) = self.current() {
            if is_loop_keyword_any(node) {
                break;
            }
            body.push(self.advance()?.clone());
        }

        Some(LoopClause::Do { body })
    }

    fn parse_else(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :else

        // :else can be followed by :do (for body), :when/:if/:unless (for else-if), or other clauses
        // If followed by :do, consume the body
        let mut body = Vec::new();
        if let Some(node) = self.current() {
            if is_loop_keyword(node, "do") {
                self.advance(); // consume :do
                while let Some(node) = self.current() {
                    if is_loop_keyword_any(node) {
                        break;
                    }
                    body.push(self.advance()?.clone());
                }
            }
            // If not :do, just return empty Else - the next clause will be parsed normally
            // and the build_body function will handle nesting it in the else branch
        }

        Some(LoopClause::Else { body })
    }

    fn parse_collect(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :collect
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance(); // consume :into
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Collect { expr, into })
    }

    fn parse_append(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :append
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance();
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Append { expr, into })
    }

    fn parse_sum(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :sum
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance();
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Sum { expr, into })
    }

    fn parse_count(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :count
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance();
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Count { expr, into })
    }

    fn parse_while(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :while
        let condition = self.advance()?.clone();
        Some(LoopClause::While { condition })
    }

    fn parse_until(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :until
        let condition = self.advance()?.clone();
        Some(LoopClause::Until { condition })
    }

    fn parse_finally(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :finally
        let mut body = Vec::new();

        // Collect expressions for FINALLY body until the next loop keyword.
        // Common Lisp LOOP allows additional clauses after FINALLY.
        while let Some(node) = self.current() {
            if is_loop_keyword_any(node) {
                // FINALLY commonly uses (return ...), but our loop token stream can
                // surface that as bare RETURN + expression instead of a single call node.
                if is_loop_keyword(node, "return") {
                    self.advance(); // consume RETURN
                    let expr = self.advance().cloned().unwrap_or_else(ASTNode::nil);
                    body.push(ASTNode::Call {
                        function: Box::new(ASTNode::Variable("return".to_string())),
                        args: vec![expr],
                    });
                    continue;
                }
                break;
            }
            body.push(self.advance()?.clone());
        }

        Some(LoopClause::Finally { body })
    }

    fn parse_return(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :return
        let expr = self.advance()?.clone();
        Some(LoopClause::Return { expr })
    }

    fn parse_thereis(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :thereis
        let expr = self.advance()?.clone();
        Some(LoopClause::Thereis { expr })
    }

    fn parse_always(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :always
        let expr = self.advance()?.clone();
        Some(LoopClause::Always { expr })
    }

    fn parse_never(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :never
        let expr = self.advance()?.clone();
        Some(LoopClause::Never { expr })
    }

    fn parse_maximize(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :maximize
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance(); // consume :into
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Maximize { expr, into })
    }

    fn parse_minimize(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :minimize
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance(); // consume :into
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Minimize { expr, into })
    }

    fn parse_nconc(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :nconc
        let expr = self.advance()?.clone();

        let into = if let Some(node) = self.current() {
            if is_loop_keyword(node, "into") {
                self.advance(); // consume :into
                if let ASTNode::Variable(v) = self.advance()? {
                    Some(v.clone())
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        Some(LoopClause::Nconc { expr, into })
    }

    fn parse_repeat(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :repeat
        let count = self.advance()?.clone();
        Some(LoopClause::Repeat { count })
    }

    fn parse_initially(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :initially
        let mut body = Vec::new();

        // Collect body expressions until we hit another keyword
        while let Some(node) = self.current() {
            if is_loop_keyword_any(node) {
                if is_loop_keyword(node, "return") {
                    self.advance(); // consume RETURN
                    let expr = self.advance().cloned().unwrap_or_else(ASTNode::nil);
                    body.push(ASTNode::Call {
                        function: Box::new(ASTNode::Variable("return".to_string())),
                        args: vec![expr],
                    });
                    continue;
                }
                break;
            }
            body.push(self.advance()?.clone());
        }

        Some(LoopClause::Initially { body })
    }

    fn parse_named(&mut self) -> Option<LoopClause> {
        self.advance(); // consume :named
        let name = match self.advance()? {
            ASTNode::Variable(v) => v.clone(),
            _ => return None,
        };
        Some(LoopClause::Named { name })
    }

    /// Generate the loop expansion
    fn generate(&self) -> ASTNode {
        use std::collections::HashSet;

        // Collect all bindings
        let mut bindings: Vec<(String, ASTNode)> = Vec::new();
        let mut collect_var: Option<String> = None;  // Default collect var (no :into)
        let mut sum_var: Option<String> = None;      // Default sum var (no :into)
        let mut count_var: Option<String> = None;    // Default count var (no :into)
        let mut all_list_vars: HashSet<String> = HashSet::new();  // All :into vars for list ops
        let mut all_sum_vars: HashSet<String> = HashSet::new();   // All :into vars for sum ops
        let mut all_count_vars: HashSet<String> = HashSet::new(); // All :into vars for count ops
        let mut needs_sequential_bindings = false;
        // Multiple parallel :in iterators are allowed (e.g. FOR x IN ... FOR y IN ...).
        // Tuple: (loop var, hidden list var, optional :by step function)
        let mut in_iters: Vec<(String, String, Option<ASTNode>)> = Vec::new();
        let mut iter_list: Option<ASTNode> = None;
        let mut iter_step: Option<ASTNode> = None;
        let mut across_iter: Option<(String, ASTNode)> = None;
        let mut destructure: Option<(String, String)> = None;
        let mut on_iter: Option<(String, ASTNode, Option<ASTNode>)> = None; // Simple :on iteration
        let mut on_destructure: Option<(Vec<String>, ASTNode, Option<ASTNode>)> = None; // :on with list pattern
        // (var, start, end, step, inclusive, down)
        let mut numeric_iters: Vec<(String, ASTNode, ASTNode, Option<ASTNode>, bool, bool)> = Vec::new();
        let mut hash_iter: Option<(String, ASTNode, bool)> = None; // (var, hash-table, is_keys)
        let mut symbol_iter: Option<(String, ASTNode, SymbolKind)> = None; // (var, package, kind)
        let mut for_equals_clauses: Vec<(String, ASTNode, Option<ASTNode>)> = Vec::new(); // :for var = init [:then step]
        let mut finally_body: Option<Vec<ASTNode>> = None;
        let mut initially_body: Option<Vec<ASTNode>> = None;
        let mut loop_name: Option<String> = None;
        let mut repeat_count: Option<ASTNode> = None;
        let mut max_var: Option<String> = None;
        let mut min_var: Option<String> = None;
        let mut all_max_vars: HashSet<String> = HashSet::new();
        let mut all_min_vars: HashSet<String> = HashSet::new();
        let mut has_thereis = false;
        let mut has_always = false;
        let mut has_never = false;
        let mut while_conditions: Vec<ASTNode> = Vec::new();  // :while conditions
        let mut needs_break_var = false; // Needed for ordered :while/:until handling
        let mut has_loop_return = false;
        let mut numeric_last_vars: Vec<(String, String)> = Vec::new();

        // First pass: collect all variable initializations and iteration info
        for clause in &self.clauses {
            match clause {
                LoopClause::With { var, init } => {
                    bindings.push((var.clone(), init.clone().unwrap_or_else(ASTNode::nil)));
                }
                LoopClause::WithDestructure { vars, init } => {
                    // WITH (a b) = expr → bind __loop_with_tmp__ = expr, a = (nth 0 tmp), b = (nth 1 tmp)
                    needs_sequential_bindings = true;
                    let tmp_var = format!("__loop_with_tmp_{}__", bindings.len());
                    bindings.push((tmp_var.clone(), init.clone()));
                    for (i, v) in vars.iter().enumerate() {
                        bindings.push((v.clone(), ASTNode::Call {
                            function: Box::new(ASTNode::Variable("nth".to_string())),
                            args: vec![
                                ASTNode::Constant(ConstantValue::Fixnum(i as i64)),
                                ASTNode::Variable(tmp_var.clone()),
                            ],
                        }));
                    }
                }
                LoopClause::ForIn { var, list, by } => {
                    ensure_binding(&mut bindings, var, ASTNode::nil());
                    let list_var = format!("__loop_list_{}__", in_iters.len());
                    bindings.push((list_var.clone(), list.clone()));
                    in_iters.push((var.clone(), list_var, by.clone()));
                }
                LoopClause::ForAcross { var, seq } => {
                    across_iter = Some((var.clone(), seq.clone()));
                    ensure_binding(&mut bindings, var, ASTNode::nil());
                    bindings.push(("__loop_across_seq__".to_string(), seq.clone()));
                    bindings.push(("__loop_across_i__".to_string(), ASTNode::Constant(ConstantValue::Fixnum(0))));
                }
                LoopClause::ForInDestructure { car_var, cdr_var, list, by } => {
                    destructure = Some((car_var.clone(), cdr_var.clone()));
                    iter_list = Some(list.clone());
                    iter_step = by.clone();
                    ensure_binding(&mut bindings, car_var, ASTNode::nil());
                    ensure_binding(&mut bindings, cdr_var, ASTNode::nil());
                    bindings.push(("__loop_list__".to_string(), list.clone()));
                }
                LoopClause::ForOn { var, list, by } => {
                    on_iter = Some((var.clone(), list.clone(), by.clone()));
                    ensure_binding(&mut bindings, var, ASTNode::nil());
                    bindings.push(("__loop_list__".to_string(), list.clone()));
                }
                LoopClause::ForOnDestructure { vars, list, by } => {
                    on_destructure = Some((vars.clone(), list.clone(), by.clone()));
                    for var in vars {
                        ensure_binding(&mut bindings, var, ASTNode::nil());
                    }
                    bindings.push(("__loop_list__".to_string(), list.clone()));
                }
                LoopClause::ForHashKeys { var, hash_table } => {
                    hash_iter = Some((var.clone(), hash_table.clone(), true));
                    ensure_binding(&mut bindings, var, ASTNode::nil());
                    // We'll use __loop_hash_keys__ to store the list of keys
                    bindings.push(("__loop_hash_keys__".to_string(), ASTNode::nil()));
                }
                LoopClause::ForHashValues { var, hash_table } => {
                    hash_iter = Some((var.clone(), hash_table.clone(), false));
                    ensure_binding(&mut bindings, var, ASTNode::nil());
                    // We'll use __loop_hash_values__ to store the list of values
                    bindings.push(("__loop_hash_values__".to_string(), ASTNode::nil()));
                }
                LoopClause::ForSymbols { var, package, symbol_kind } => {
                    symbol_iter = Some((var.clone(), package.clone(), *symbol_kind));
                    ensure_binding(&mut bindings, var, ASTNode::nil());
                    // We'll use __loop_symbols__ to store the list of symbols
                    bindings.push(("__loop_symbols__".to_string(), ASTNode::nil()));
                }
                LoopClause::ForEquals { var, init, then_expr } => {
                    // Bind var without evaluating init yet to avoid referencing other loop vars too early.
                    bindings.push((var.clone(), ASTNode::nil()));
                    for_equals_clauses.push((var.clone(), init.clone(), then_expr.clone()));
                }
                LoopClause::ForEqualsDestructure { vars, init, then_expr } => {
                    // Use a temp var and destructure with nth
                    let tmp_var = format!("__loop_destr_{}__", bindings.len());
                    bindings.push((tmp_var.clone(), ASTNode::nil()));
                    for v in vars.iter() {
                        bindings.push((v.clone(), ASTNode::nil()));
                    }
                    // Store as a special for_equals: set tmp_var = init, then destructure
                    for_equals_clauses.push((tmp_var.clone(), init.clone(), then_expr.clone()));
                    // Add destructuring assignments that happen after tmp is set
                    for (i, v) in vars.iter().enumerate() {
                        for_equals_clauses.push((v.clone(), ASTNode::Call {
                            function: Box::new(ASTNode::Variable("nth".to_string())),
                            args: vec![
                                ASTNode::Constant(ConstantValue::Fixnum(i as i64)),
                                ASTNode::Variable(tmp_var.clone()),
                            ],
                        }, None));
                    }
                }
                LoopClause::ForBelow { var, limit } => {
                    numeric_iters.push((var.clone(), ASTNode::Constant(ConstantValue::Fixnum(0)), limit.clone(), None, false, false));
                    bindings.push((var.clone(), ASTNode::Constant(ConstantValue::Fixnum(0))));
                    let last_var = format!("__loop_last_num_{}__", numeric_last_vars.len());
                    bindings.push((last_var.clone(), ASTNode::nil()));
                    numeric_last_vars.push((var.clone(), last_var));
                }
                LoopClause::ForFromTo { var, start, end, step, inclusive, down } => {
                    numeric_iters.push((var.clone(), start.clone(), end.clone(), step.clone(), *inclusive, *down));
                    bindings.push((var.clone(), start.clone()));
                    let last_var = format!("__loop_last_num_{}__", numeric_last_vars.len());
                    bindings.push((last_var.clone(), ASTNode::nil()));
                    numeric_last_vars.push((var.clone(), last_var));
                }
                LoopClause::Collect { into, .. } | LoopClause::Append { into, .. } | LoopClause::Nconc { into, .. } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_result__".to_string());
                    if !all_list_vars.contains(&var) {
                        all_list_vars.insert(var.clone());
                        bindings.push((var.clone(), ASTNode::nil()));
                    }
                    if collect_var.is_none() && into.is_none() {
                        collect_var = Some(var);
                    }
                }
                LoopClause::Sum { into, .. } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_sum__".to_string());
                    if !all_sum_vars.contains(&var) {
                        all_sum_vars.insert(var.clone());
                        bindings.push((var.clone(), ASTNode::Constant(ConstantValue::Fixnum(0))));
                    }
                    if sum_var.is_none() && into.is_none() {
                        sum_var = Some(var);
                    }
                }
                LoopClause::Count { into, .. } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_count__".to_string());
                    if !all_count_vars.contains(&var) {
                        all_count_vars.insert(var.clone());
                        bindings.push((var.clone(), ASTNode::Constant(ConstantValue::Fixnum(0))));
                    }
                    if count_var.is_none() && into.is_none() {
                        count_var = Some(var);
                    }
                }
                LoopClause::Maximize { into, .. } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_max__".to_string());
                    if !all_max_vars.contains(&var) {
                        all_max_vars.insert(var.clone());
                        bindings.push((var.clone(), ASTNode::nil())); // nil initially
                    }
                    if max_var.is_none() && into.is_none() {
                        max_var = Some(var);
                    }
                }
                LoopClause::Minimize { into, .. } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_min__".to_string());
                    if !all_min_vars.contains(&var) {
                        all_min_vars.insert(var.clone());
                        bindings.push((var.clone(), ASTNode::nil())); // nil initially
                    }
                    if min_var.is_none() && into.is_none() {
                        min_var = Some(var);
                    }
                }
                LoopClause::Repeat { count } => {
                    repeat_count = Some(count.clone());
                    bindings.push(("__loop_repeat_count__".to_string(), count.clone()));
                    bindings.push(("__loop_repeat_i__".to_string(), ASTNode::Constant(ConstantValue::Fixnum(0))));
                }
                LoopClause::Initially { body } => {
                    initially_body = Some(body.clone());
                }
                LoopClause::Named { name } => {
                    loop_name = Some(name.clone());
                }
                LoopClause::Thereis { .. } => {
                    has_thereis = true;
                }
                LoopClause::Always { .. } => {
                    has_always = true;
                    // Initialize __loop_always__ to T
                    bindings.push(("__loop_always__".to_string(), ASTNode::t()));
                }
                LoopClause::Never { .. } => {
                    has_never = true;
                    // Initialize __loop_never__ to T
                    bindings.push(("__loop_never__".to_string(), ASTNode::t()));
                }
                LoopClause::Finally { body } => {
                    finally_body = Some(body.clone());
                }
                LoopClause::While { condition } => {
                    needs_break_var = true;
                    while_conditions.push(condition.clone());
                }
                LoopClause::Until { .. } => {
                    needs_break_var = true;
                }
                LoopClause::Return { .. } => {
                    needs_break_var = true;
                    has_loop_return = true;
                }
                _ => {}
            }
        }

        // Build the loop body
        let mut body = self.build_body(&collect_var, &sum_var, &count_var, &destructure, &loop_name);
        if contains_loop_return_state(&body) {
            needs_break_var = true;
            has_loop_return = true;
        }
        if needs_break_var {
            ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
        }
        if has_loop_return {
            ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
            ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
            ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
        }
        if !numeric_last_vars.is_empty() {
            ensure_binding(&mut bindings, "__loop_any_iter__", ASTNode::nil());
        }

        let mut for_equals_pre_iter: Vec<ASTNode> = Vec::new();
        let mut for_equals_post_iter: Vec<ASTNode> = Vec::new();
        let mut has_for_equals_then = false;
        for (var, init, then_expr) in &for_equals_clauses {
            let init_rewritten = rewrite_loop_return_calls(init, &loop_name);
            if contains_loop_return_state(std::slice::from_ref(&init_rewritten)) {
                needs_break_var = true;
                has_loop_return = true;
                ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
            }
            if let Some(step_expr) = then_expr {
                let step_rewritten = rewrite_loop_return_calls(step_expr, &loop_name);
                if contains_loop_return_state(std::slice::from_ref(&step_rewritten)) {
                    needs_break_var = true;
                    has_loop_return = true;
                    ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                }
                has_for_equals_then = true;
                for_equals_pre_iter.push(ASTNode::If {
                    test: Box::new(ASTNode::Variable("__loop_first__".to_string())),
                    then_branch: Box::new(ASTNode::setq(var.clone(), init_rewritten)),
                    else_branch: Box::new(ASTNode::nil()),
                });
                for_equals_post_iter.push(ASTNode::setq(var.clone(), step_rewritten));
            } else {
                for_equals_pre_iter.push(ASTNode::setq(var.clone(), init_rewritten));
            }
        }
        if has_for_equals_then {
            ensure_binding(&mut bindings, "__loop_first__", ASTNode::t());
            for_equals_post_iter.push(ASTNode::setq("__loop_first__", ASTNode::nil()));
        }
        if !for_equals_pre_iter.is_empty() || !for_equals_post_iter.is_empty() {
            let mut new_body = Vec::new();
            new_body.extend(for_equals_pre_iter);
            new_body.extend(body);
            if needs_break_var {
                for step in for_equals_post_iter {
                    new_body.push(ASTNode::If {
                        test: Box::new(ASTNode::Variable("__loop_break__".to_string())),
                        then_branch: Box::new(ASTNode::nil()),
                        else_branch: Box::new(step),
                    });
                }
            } else {
                new_body.extend(for_equals_post_iter);
            }
            body = new_body;
        }

        // Build the full loop structure
        let mut loop_code = if !numeric_iters.is_empty() {
            // Numeric iteration - support multiple iterators
            // Build termination condition from iterators that have an end value
            // All iterators get step expressions
            let mut while_body = Vec::new();

            // Support mixed iteration like:
            //   (loop for i from 0 and n in list ...)
            // by binding list vars before body and advancing the list each iteration.
            if iter_list.is_some() || !in_iters.is_empty() {
                if iter_list.is_some() {
                    while_body.push(loop_list_type_guard("__loop_list__"));
                }
                for (_var, list_var, _) in &in_iters {
                    while_body.push(loop_list_type_guard(list_var));
                }
                if let Some((car_var, cdr_var)) = &destructure {
                    while_body.push(ASTNode::setq(
                        car_var.clone(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("caar".to_string())),
                            args: vec![ASTNode::Variable("__loop_list__".to_string())],
                        },
                    ));
                    while_body.push(ASTNode::setq(
                        cdr_var.clone(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("cdar".to_string())),
                            args: vec![ASTNode::Variable("__loop_list__".to_string())],
                        },
                    ));
                } else {
                    for (var, list_var, _) in &in_iters {
                        while_body.push(ASTNode::setq(
                            var.clone(),
                            ASTNode::Call {
                                function: Box::new(ASTNode::Variable("car".to_string())),
                                args: vec![ASTNode::Variable(list_var.clone())],
                            },
                        ));
                    }
                }
            }
            if !numeric_last_vars.is_empty() {
                while_body.push(ASTNode::setq("__loop_any_iter__".to_string(), ASTNode::t()));
                for (var, last_var) in &numeric_last_vars {
                    while_body.push(ASTNode::setq(last_var.clone(), ASTNode::Variable(var.clone())));
                }
            }

            while_body.extend(body);

            // Add step expressions for ALL numeric iterators
            for (var, _start, _end, step, _inclusive, _down) in numeric_iters.iter().rev() {
                let step_expr = step.clone().unwrap_or_else(|| ASTNode::Constant(ConstantValue::Fixnum(1)));
                while_body.push(ASTNode::setq(
                    var.clone(),
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("+".to_string())),
                        args: vec![ASTNode::Variable(var.clone()), step_expr],
                    }
                ));
            }

            if iter_list.is_some() {
                let next_list = if let Some(step) = &iter_step {
                    let rewritten = rewrite_loop_return_calls(step, &loop_name);
                    if contains_loop_return_state(std::slice::from_ref(&rewritten)) {
                        needs_break_var = true;
                        has_loop_return = true;
                        ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                        rewritten
                    } else {
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("funcall".to_string())),
                            args: vec![rewritten, ASTNode::Variable("__loop_list__".to_string())],
                        }
                    }
                } else {
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("cdr".to_string())),
                        args: vec![ASTNode::Variable("__loop_list__".to_string())],
                    }
                };
                while_body.push(ASTNode::setq(
                    "__loop_list__".to_string(),
                    next_list,
                ));
            }
            for (_var, list_var, by) in in_iters.iter().rev() {
                let next_list = if let Some(step) = by {
                    let rewritten = rewrite_loop_return_calls(step, &loop_name);
                    if contains_loop_return_state(std::slice::from_ref(&rewritten)) {
                        needs_break_var = true;
                        has_loop_return = true;
                        ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                        rewritten
                    } else {
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("funcall".to_string())),
                            args: vec![rewritten, ASTNode::Variable(list_var.clone())],
                        }
                    }
                } else {
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("cdr".to_string())),
                        args: vec![ASTNode::Variable(list_var.clone())],
                    }
                };
                while_body.push(ASTNode::setq(list_var.clone(), next_list));
            }

            // Build termination condition: AND of all iterators that have an end value
            let mut conditions = Vec::new();
            for (var, _start, end, _step, inclusive, down) in &numeric_iters {
                // Skip iterators with no end (nil end means no bound)
                if matches!(end, ASTNode::Constant(ConstantValue::Nil)) {
                    continue;
                }
                let cmp_op = if *down {
                    if *inclusive { ">=" } else { ">" }
                } else {
                    if *inclusive { "<=" } else { "<" }
                };
                conditions.push(ASTNode::Call {
                    function: Box::new(ASTNode::Variable(cmp_op.to_string())),
                    args: vec![ASTNode::Variable(var.clone()), end.clone()],
                });
            }

            if iter_list.is_some() {
                conditions.push(ASTNode::Variable("__loop_list__".to_string()));
            }
            for (_var, list_var, _) in &in_iters {
                conditions.push(ASTNode::Variable(list_var.clone()));
            }

            let condition = if conditions.is_empty() {
                // No end bounds at all - need some other termination
                ASTNode::Variable("t".to_string())
            } else if conditions.len() == 1 {
                conditions.remove(0)
            } else {
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("and".to_string())),
                    args: conditions,
                }
            };

            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: std::iter::once(condition).chain(while_body).collect(),
            }
        } else if let Some((vars, _list, on_by)) = &on_destructure {
            // :on iteration with list destructuring
            // For (type next) :on list:
            //   type = (nth 0 __loop_list__)  -- first element
            //   next = (nth 1 __loop_list__) -- second element (NIL if not present)
            // Iterates over successive cdrs of list
            // Using nth because it returns NIL for out-of-bounds access
            let mut iter_body = Vec::new();
            iter_body.push(loop_list_type_guard("__loop_list__"));
            for (i, var) in vars.iter().enumerate() {
                iter_body.push(ASTNode::setq(var.clone(), ASTNode::Call {
                    function: Box::new(ASTNode::Variable("nth".to_string())),
                    args: vec![
                        ASTNode::Constant(ConstantValue::Fixnum(i as i64)),
                        ASTNode::Variable("__loop_list__".to_string()),
                    ],
                }));
            }

            iter_body.extend(body.clone());
            let inner_body = ASTNode::progn(iter_body);
            let next_list = if let Some(step) = on_by {
                let rewritten = rewrite_loop_return_calls(step, &loop_name);
                if contains_loop_return_state(std::slice::from_ref(&rewritten)) {
                    needs_break_var = true;
                    has_loop_return = true;
                    ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                    rewritten
                } else {
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("funcall".to_string())),
                        args: vec![rewritten, ASTNode::Variable("__loop_list__".to_string())],
                    }
                }
            } else {
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("cdr".to_string())),
                    args: vec![ASTNode::Variable("__loop_list__".to_string())],
                }
            };

            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: vec![
                    ASTNode::Variable("__loop_list__".to_string()),
                    inner_body,
                    ASTNode::setq(
                        "__loop_list__".to_string(),
                        next_list
                    ),
                ],
            }
        } else if let Some((var, _list, on_by)) = &on_iter {
            // Simple :on iteration
            // var = __loop_list__ (the current tail)
            let mut iter_body = Vec::new();
            iter_body.push(loop_list_type_guard("__loop_list__"));
            iter_body.push(ASTNode::setq(var.clone(), ASTNode::Variable("__loop_list__".to_string())));
            iter_body.extend(body.clone());
            let inner_body = ASTNode::progn(iter_body);
            let next_list = if let Some(step) = on_by {
                let rewritten = rewrite_loop_return_calls(step, &loop_name);
                if contains_loop_return_state(std::slice::from_ref(&rewritten)) {
                    needs_break_var = true;
                    has_loop_return = true;
                    ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                    ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                    rewritten
                } else {
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("funcall".to_string())),
                        args: vec![rewritten, ASTNode::Variable("__loop_list__".to_string())],
                    }
                }
            } else {
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("cdr".to_string())),
                    args: vec![ASTNode::Variable("__loop_list__".to_string())],
                }
            };

            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: vec![
                    ASTNode::Variable("__loop_list__".to_string()),
                    inner_body,
                    ASTNode::setq(
                        "__loop_list__".to_string(),
                        next_list
                    ),
                ],
            }
        } else if let Some((var, _seq)) = &across_iter {
            // :across iteration over sequence elements
            let mut iter_body = Vec::new();
            iter_body.push(ASTNode::setq(
                var.clone(),
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("elt".to_string())),
                    args: vec![
                        ASTNode::Variable("__loop_across_seq__".to_string()),
                        ASTNode::Variable("__loop_across_i__".to_string()),
                    ],
                },
            ));
            iter_body.extend(body.clone());
            let inner_body = ASTNode::progn(iter_body);

            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: vec![
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("<".to_string())),
                        args: vec![
                            ASTNode::Variable("__loop_across_i__".to_string()),
                            ASTNode::Call {
                                function: Box::new(ASTNode::Variable("length".to_string())),
                                args: vec![ASTNode::Variable("__loop_across_seq__".to_string())],
                            },
                        ],
                    },
                    inner_body,
                    ASTNode::setq(
                        "__loop_across_i__".to_string(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("+".to_string())),
                            args: vec![
                                ASTNode::Variable("__loop_across_i__".to_string()),
                                ASTNode::Constant(ConstantValue::Fixnum(1)),
                            ],
                        }
                    ),
                ],
            }
        } else if iter_list.is_some() || !in_iters.is_empty() {
            // List iteration with :in
            let mut iter_body = Vec::new();
            if iter_list.is_some() {
                iter_body.push(loop_list_type_guard("__loop_list__"));
            }
            for (_var, list_var, _) in &in_iters {
                iter_body.push(loop_list_type_guard(list_var));
            }
            if let Some((car_var, cdr_var)) = &destructure {
                // Destructuring: (setq car_var (caar __loop_list__)) (setq cdr_var (cdar __loop_list__))
                iter_body.push(ASTNode::setq(
                    car_var.clone(),
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("caar".to_string())),
                        args: vec![ASTNode::Variable("__loop_list__".to_string())],
                    },
                ));
                iter_body.push(ASTNode::setq(
                    cdr_var.clone(),
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("cdar".to_string())),
                        args: vec![ASTNode::Variable("__loop_list__".to_string())],
                    },
                ));
            } else {
                for (var, list_var, _) in &in_iters {
                    iter_body.push(ASTNode::setq(
                        var.clone(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("car".to_string())),
                            args: vec![ASTNode::Variable(list_var.clone())],
                        },
                    ));
                }
            }
            iter_body.extend(body.clone());
            let inner_body = ASTNode::progn(iter_body);
            let mut step_forms: Vec<ASTNode> = Vec::new();
            if iter_list.is_some() {
                let next_list = if let Some(step) = &iter_step {
                    let rewritten = rewrite_loop_return_calls(step, &loop_name);
                    if contains_loop_return_state(std::slice::from_ref(&rewritten)) {
                        needs_break_var = true;
                        has_loop_return = true;
                        ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                        rewritten
                    } else {
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("funcall".to_string())),
                            args: vec![rewritten, ASTNode::Variable("__loop_list__".to_string())],
                        }
                    }
                } else {
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("cdr".to_string())),
                        args: vec![ASTNode::Variable("__loop_list__".to_string())],
                    }
                };
                step_forms.push(ASTNode::setq("__loop_list__".to_string(), next_list));
            }
            for (_var, list_var, by) in in_iters.iter().rev() {
                let next_list = if let Some(step) = by {
                    let rewritten = rewrite_loop_return_calls(step, &loop_name);
                    if contains_loop_return_state(std::slice::from_ref(&rewritten)) {
                        needs_break_var = true;
                        has_loop_return = true;
                        ensure_binding(&mut bindings, "__loop_break__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_returned__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_value__", ASTNode::nil());
                        ensure_binding(&mut bindings, "__loop_return_values__", ASTNode::nil());
                        rewritten
                    } else {
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("funcall".to_string())),
                            args: vec![rewritten, ASTNode::Variable(list_var.clone())],
                        }
                    }
                } else {
                    ASTNode::Call {
                        function: Box::new(ASTNode::Variable("cdr".to_string())),
                        args: vec![ASTNode::Variable(list_var.clone())],
                    }
                };
                step_forms.push(ASTNode::setq(list_var.clone(), next_list));
            }

            let mut conditions = Vec::new();
            if iter_list.is_some() {
                conditions.push(ASTNode::Variable("__loop_list__".to_string()));
            }
            for (_var, list_var, _) in &in_iters {
                conditions.push(ASTNode::Variable(list_var.clone()));
            }
            let while_condition = if conditions.len() == 1 {
                conditions.remove(0)
            } else {
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("and".to_string())),
                    args: conditions,
                }
            };

            let mut while_args = vec![while_condition, inner_body];
            while_args.extend(step_forms);
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: while_args,
            }
        } else if let Some((var, hash_table, is_keys)) = &hash_iter {
            // Hash table iteration
            // First, get the list of keys or values using hash-table-keys/hash-table-values
            let list_var = if *is_keys {
                "__loop_hash_keys__"
            } else {
                "__loop_hash_values__"
            };
            let getter_fn = if *is_keys {
                "hash-table-keys"
            } else {
                "hash-table-values"
            };

            // Build: (let ((__loop_hash_keys__ (hash-table-keys ht)))
            //          (while __loop_hash_keys__
            //            (let ((var (car __loop_hash_keys__))) body)
            //            (setq __loop_hash_keys__ (cdr __loop_hash_keys__))))
            let mut iter_body = Vec::new();
            iter_body.push(ASTNode::setq(
                var.clone(),
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("car".to_string())),
                    args: vec![ASTNode::Variable(list_var.to_string())],
                },
            ));
            iter_body.extend(body.clone());
            let inner_body = ASTNode::progn(iter_body);

            let while_loop = ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: vec![
                    ASTNode::Variable(list_var.to_string()),
                    inner_body,
                    ASTNode::setq(
                        list_var.to_string(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("cdr".to_string())),
                            args: vec![ASTNode::Variable(list_var.to_string())],
                        }
                    ),
                ],
            };

            // Wrap in let that initializes the keys/values list
            ASTNode::let_bindings(
                vec![(list_var.to_string(), ASTNode::Call {
                    function: Box::new(ASTNode::Variable(getter_fn.to_string())),
                    args: vec![hash_table.clone()],
                })],
                vec![while_loop]
            )
        } else if let Some((var, package, symbol_kind)) = &symbol_iter {
            // Package symbol iteration
            // Get the appropriate symbol list function based on kind
            let getter_fn = match symbol_kind {
                SymbolKind::AllSymbols => "package-symbols",
                SymbolKind::ExternalSymbols => "package-external-symbols",
                SymbolKind::PresentSymbols => "package-present-symbols",
            };

            let mut iter_body = Vec::new();
            iter_body.push(ASTNode::setq(
                var.clone(),
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("car".to_string())),
                    args: vec![ASTNode::Variable("__loop_symbols__".to_string())],
                },
            ));
            iter_body.extend(body.clone());
            let inner_body = ASTNode::progn(iter_body);

            let while_loop = ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: vec![
                    ASTNode::Variable("__loop_symbols__".to_string()),
                    inner_body,
                    ASTNode::setq(
                        "__loop_symbols__".to_string(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("cdr".to_string())),
                            args: vec![ASTNode::Variable("__loop_symbols__".to_string())],
                        }
                    ),
                ],
            };

            // Wrap in let that initializes the symbols list
            ASTNode::let_bindings(
                vec![("__loop_symbols__".to_string(), ASTNode::Call {
                    function: Box::new(ASTNode::Variable(getter_fn.to_string())),
                    args: vec![package.clone()],
                })],
                vec![while_loop]
            )
        } else if repeat_count.is_some() {
            // Repeat iteration: (while (< __loop_repeat_i__ __loop_repeat_count__) body (incf __loop_repeat_i__))
            let mut while_body = body;
            while_body.push(ASTNode::setq(
                "__loop_repeat_i__".to_string(),
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("+".to_string())),
                    args: vec![
                        ASTNode::Variable("__loop_repeat_i__".to_string()),
                        ASTNode::Constant(ConstantValue::Fixnum(1)),
                    ],
                }
            ));

            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: std::iter::once(ASTNode::Call {
                    function: Box::new(ASTNode::Variable("<".to_string())),
                    args: vec![
                        ASTNode::Variable("__loop_repeat_i__".to_string()),
                        ASTNode::Variable("__loop_repeat_count__".to_string()),
                    ],
                }).chain(while_body).collect(),
            }
        } else if !for_equals_clauses.is_empty() {
            // Infinite loop driven only by :for var = init [:then step]
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: std::iter::once(ASTNode::t())
                    .chain(body.into_iter())
                    .collect(),
            }
        } else if !while_conditions.is_empty() {
            // Loop driven by :while condition(s)
            // Combine multiple :while conditions with AND
            let combined_condition = if while_conditions.len() == 1 {
                while_conditions.into_iter().next().unwrap()
            } else {
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("and".to_string())),
                    args: while_conditions,
                }
            };
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("sys::while".to_string())),
                args: std::iter::once(combined_condition)
                    .chain(body.into_iter())
                    .collect(),
            }
        } else {
            // No iteration - just execute body once (or not at all)
            ASTNode::progn(body)
        };

        // For :while/:until in clause order, use a break flag that can be set from body.
        if needs_break_var {
            if let ASTNode::Call { function, args } = &mut loop_code {
                if let ASTNode::Variable(name) = function.as_ref() {
                    if name == "sys::while" && !args.is_empty() {
                        let base_condition = args[0].clone();
                        args[0] = ASTNode::Call {
                            function: Box::new(ASTNode::Variable("and".to_string())),
                            args: vec![
                                ASTNode::Call {
                                    function: Box::new(ASTNode::Variable("not".to_string())),
                                    args: vec![ASTNode::Variable("__loop_break__".to_string())],
                                },
                                base_condition,
                            ],
                        };
                    }
                }
            }
        }

        // Add finally and return value
        let mut full_body: Vec<ASTNode> = Vec::new();
        if let Some(initially) = initially_body {
            full_body.extend(initially);
        }
        full_body.push(loop_code);
        if !numeric_last_vars.is_empty() {
            let mut restore_body = Vec::new();
            for (var, last_var) in &numeric_last_vars {
                restore_body.push(ASTNode::setq(var.clone(), ASTNode::Variable(last_var.clone())));
            }
            full_body.push(ASTNode::If {
                test: Box::new(ASTNode::Variable("__loop_any_iter__".to_string())),
                then_branch: Box::new(ASTNode::progn(restore_body)),
                else_branch: Box::new(ASTNode::nil()),
            });
        }

        let normal_exit_result = if let Some(finally) = finally_body {
            ASTNode::progn(finally)
        } else {
            // Default return value
            if let Some(var) = &collect_var {
                ASTNode::Call {
                    function: Box::new(ASTNode::Variable("nreverse".to_string())),
                    args: vec![ASTNode::Variable(var.clone())],
                }
            } else if let Some(var) = &sum_var {
                ASTNode::Variable(var.clone())
            } else if let Some(var) = &count_var {
                ASTNode::Variable(var.clone())
            } else if let Some(var) = &max_var {
                ASTNode::Variable(var.clone())
            } else if let Some(var) = &min_var {
                ASTNode::Variable(var.clone())
            } else if has_always || has_never {
                // :always and :never return T if they complete without returning nil
                ASTNode::t()
            } else {
                ASTNode::nil()
            }
        };

        if has_loop_return {
            full_body.push(ASTNode::If {
                test: Box::new(ASTNode::Variable("__loop_returned__".to_string())),
                then_branch: Box::new(ASTNode::Call {
                    function: Box::new(ASTNode::Variable("values-list".to_string())),
                    args: vec![ASTNode::Variable("__loop_return_values__".to_string())],
                }),
                else_branch: Box::new(normal_exit_result),
            });
        } else {
            full_body.push(normal_exit_result);
        }

        // Wrap in block for return (use loop_name if given, else nil)
        let block_name = if let Some(ref name) = loop_name {
            ASTNode::Variable(name.clone())
        } else {
            ASTNode::nil()
        };
        let block_body = ASTNode::Call {
            function: Box::new(ASTNode::Variable("block".to_string())),
            args: std::iter::once(block_name).chain(full_body).collect(),
        };

        // Wrap in let with bindings
        if bindings.is_empty() {
            block_body
        } else if needs_sequential_bindings {
            ASTNode::LetStar {
                bindings,
                body: vec![block_body],
            }
        } else {
            ASTNode::let_bindings(bindings, vec![block_body])
        }
    }

    fn build_body(
        &self,
        collect_var: &Option<String>,
        sum_var: &Option<String>,
        count_var: &Option<String>,
        _destructure: &Option<(String, String)>,
        loop_name: &Option<String>,
    ) -> Vec<ASTNode> {
        let mut body = Vec::new();

        // Use a stack to handle nested conditionals
        // Each entry: (condition, then_body, else_body, in_else)
        let mut cond_stack: Vec<(ASTNode, Vec<ASTNode>, Vec<ASTNode>, bool)> = Vec::new();

        // Helper to add an expression to the current context
        let add_expr = |body: &mut Vec<ASTNode>, cond_stack: &mut Vec<(ASTNode, Vec<ASTNode>, Vec<ASTNode>, bool)>, expr: ASTNode| {
            if let Some((_, ref mut then_body, ref mut else_body, in_else)) = cond_stack.last_mut() {
                if *in_else {
                    else_body.push(expr);
                } else {
                    then_body.push(expr);
                }
            } else {
                body.push(expr);
            }
        };

        for clause in &self.clauses {
            match clause {
                LoopClause::When { condition: cond } | LoopClause::Unless { condition: cond } => {
                    let cond = cond.clone();
                    let cond = if matches!(clause, LoopClause::Unless { .. }) {
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("not".to_string())),
                            args: vec![cond],
                        }
                    } else {
                        cond
                    };
                    // Push a new conditional onto the stack
                    cond_stack.push((cond, Vec::new(), Vec::new(), false));
                }
                LoopClause::Do { body: do_body } => {
                    for expr in do_body.clone() {
                        add_expr(&mut body, &mut cond_stack, expr);
                    }
                }
                LoopClause::Else { body: else_do } => {
                    // Switch to else branch of current conditional
                    if let Some((_, _, ref mut else_body, ref mut in_else)) = cond_stack.last_mut() {
                        *in_else = true;
                        else_body.extend(else_do.clone());
                    }
                }
                LoopClause::End => {
                    // Pop the innermost conditional and add it to parent or body
                    if let Some((cond, then_body, else_body, _)) = cond_stack.pop() {
                        let if_expr = if else_body.is_empty() {
                            ASTNode::If {
                                test: Box::new(cond),
                                then_branch: Box::new(ASTNode::progn(then_body)),
                                else_branch: Box::new(ASTNode::nil()),
                            }
                        } else {
                            ASTNode::If {
                                test: Box::new(cond),
                                then_branch: Box::new(ASTNode::progn(then_body)),
                                else_branch: Box::new(ASTNode::progn(else_body)),
                            }
                        };
                        add_expr(&mut body, &mut cond_stack, if_expr);
                    }
                }
                LoopClause::Collect { expr, into } => {
                    // Use specific :into var if provided, else use default collect var
                    let var = into.clone().unwrap_or_else(||
                        collect_var.clone().unwrap_or_else(|| "__loop_result__".to_string())
                    );
                    let push_expr = ASTNode::Call {
                        function: Box::new(ASTNode::Variable("push".to_string())),
                        args: vec![expr.clone(), ASTNode::Variable(var)],
                    };
                    add_expr(&mut body, &mut cond_stack, push_expr);
                }
                LoopClause::Append { expr, into } => {
                    // Use specific :into var if provided, else use default collect var
                    let var = into.clone().unwrap_or_else(||
                        collect_var.clone().unwrap_or_else(|| "__loop_result__".to_string())
                    );
                    // (setq var (append var expr))
                    let append_expr = ASTNode::setq(
                        var.clone(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("append".to_string())),
                            args: vec![ASTNode::Variable(var), expr.clone()],
                        }
                    );
                    add_expr(&mut body, &mut cond_stack, append_expr);
                }
                LoopClause::Sum { expr, into } => {
                    // Use specific :into var if provided, else use default sum var
                    let var = into.clone().unwrap_or_else(||
                        sum_var.clone().unwrap_or_else(|| "__loop_sum__".to_string())
                    );
                    let add_e = ASTNode::setq(
                        var.clone(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("+".to_string())),
                            args: vec![ASTNode::Variable(var), expr.clone()],
                        }
                    );
                    add_expr(&mut body, &mut cond_stack, add_e);
                }
                LoopClause::Count { expr, into } => {
                    // Use specific :into var if provided, else use default count var
                    let var = into.clone().unwrap_or_else(||
                        count_var.clone().unwrap_or_else(|| "__loop_count__".to_string())
                    );
                    // (when expr (incf var))
                    let incf_expr = ASTNode::If {
                        test: Box::new(expr.clone()),
                        then_branch: Box::new(ASTNode::setq(
                            var.clone(),
                            ASTNode::Call {
                                function: Box::new(ASTNode::Variable("+".to_string())),
                                args: vec![
                                    ASTNode::Variable(var),
                                    ASTNode::Constant(ConstantValue::Fixnum(1)),
                                ],
                            }
                        )),
                        else_branch: Box::new(ASTNode::nil()),
                    };
                    add_expr(&mut body, &mut cond_stack, incf_expr);
                }
                LoopClause::Return { expr } => {
                    // Encode LOOP RETURN as loop-state updates so all backends can
                    // implement it without non-local control-flow support.
                    let return_expr = ASTNode::progn(vec![
                        ASTNode::setq(
                            "__loop_return_values__".to_string(),
                            ASTNode::Call {
                                function: Box::new(ASTNode::Variable("multiple-value-list".to_string())),
                                args: vec![expr.clone()],
                            },
                        ),
                        ASTNode::setq(
                            "__loop_return_value__".to_string(),
                            ASTNode::Call {
                                function: Box::new(ASTNode::Variable("first".to_string())),
                                args: vec![ASTNode::Variable("__loop_return_values__".to_string())],
                            },
                        ),
                        ASTNode::setq("__loop_returned__".to_string(), ASTNode::t()),
                        ASTNode::setq("__loop_break__".to_string(), ASTNode::t()),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("values-list".to_string())),
                            args: vec![ASTNode::Variable("__loop_return_values__".to_string())],
                        },
                    ]);
                    add_expr(&mut body, &mut cond_stack, return_expr);
                }
                LoopClause::Nconc { expr, into } => {
                    // Use specific :into var if provided, else use default collect var
                    let var = into.clone().unwrap_or_else(||
                        collect_var.clone().unwrap_or_else(|| "__loop_result__".to_string())
                    );
                    // (setq var (nconc var expr))
                    let nconc_expr = ASTNode::setq(
                        var.clone(),
                        ASTNode::Call {
                            function: Box::new(ASTNode::Variable("nconc".to_string())),
                            args: vec![ASTNode::Variable(var), expr.clone()],
                        }
                    );
                    add_expr(&mut body, &mut cond_stack, nconc_expr);
                }
                LoopClause::Maximize { expr, into } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_max__".to_string());
                    // (when (or (null var) (> expr var)) (setq var expr))
                    let max_expr = ASTNode::Let {
                        bindings: vec![("__loop_val__".to_string(), expr.clone())],
                        body: vec![ASTNode::If {
                            test: Box::new(ASTNode::Call {
                                function: Box::new(ASTNode::Variable("or".to_string())),
                                args: vec![
                                    ASTNode::Call {
                                        function: Box::new(ASTNode::Variable("null".to_string())),
                                        args: vec![ASTNode::Variable(var.clone())],
                                    },
                                    ASTNode::Call {
                                        function: Box::new(ASTNode::Variable(">".to_string())),
                                        args: vec![
                                            ASTNode::Variable("__loop_val__".to_string()),
                                            ASTNode::Variable(var.clone()),
                                        ],
                                    },
                                ],
                            }),
                            then_branch: Box::new(ASTNode::setq(var, ASTNode::Variable("__loop_val__".to_string()))),
                            else_branch: Box::new(ASTNode::nil()),
                        }],
                    };
                    add_expr(&mut body, &mut cond_stack, max_expr);
                }
                LoopClause::Minimize { expr, into } => {
                    let var = into.clone().unwrap_or_else(|| "__loop_min__".to_string());
                    // (when (or (null var) (< expr var)) (setq var expr))
                    let min_expr = ASTNode::Let {
                        bindings: vec![("__loop_val__".to_string(), expr.clone())],
                        body: vec![ASTNode::If {
                            test: Box::new(ASTNode::Call {
                                function: Box::new(ASTNode::Variable("or".to_string())),
                                args: vec![
                                    ASTNode::Call {
                                        function: Box::new(ASTNode::Variable("null".to_string())),
                                        args: vec![ASTNode::Variable(var.clone())],
                                    },
                                    ASTNode::Call {
                                        function: Box::new(ASTNode::Variable("<".to_string())),
                                        args: vec![
                                            ASTNode::Variable("__loop_val__".to_string()),
                                            ASTNode::Variable(var.clone()),
                                        ],
                                    },
                                ],
                            }),
                            then_branch: Box::new(ASTNode::setq(var, ASTNode::Variable("__loop_val__".to_string()))),
                            else_branch: Box::new(ASTNode::nil()),
                        }],
                    };
                    add_expr(&mut body, &mut cond_stack, min_expr);
                }
                LoopClause::Thereis { expr } => {
                    // (let ((val expr)) (when val (return val)))
                    let thereis_expr = ASTNode::Let {
                        bindings: vec![("__loop_thereis__".to_string(), expr.clone())],
                        body: vec![ASTNode::If {
                            test: Box::new(ASTNode::Variable("__loop_thereis__".to_string())),
                            then_branch: Box::new(ASTNode::Call {
                                function: Box::new(ASTNode::Variable("return".to_string())),
                                args: vec![ASTNode::Variable("__loop_thereis__".to_string())],
                            }),
                            else_branch: Box::new(ASTNode::nil()),
                        }],
                    };
                    add_expr(&mut body, &mut cond_stack, thereis_expr);
                }
                LoopClause::Until { condition } => {
                    // UNTIL exits the loop when condition becomes true.
                    let until_expr = ASTNode::If {
                        test: Box::new(condition.clone()),
                        then_branch: Box::new(ASTNode::setq(
                            "__loop_break__".to_string(),
                            ASTNode::t(),
                        )),
                        else_branch: Box::new(ASTNode::nil()),
                    };
                    add_expr(&mut body, &mut cond_stack, until_expr);
                }
                LoopClause::While { condition } => {
                    // WHILE exits the loop when condition becomes false.
                    let while_expr = ASTNode::If {
                        test: Box::new(condition.clone()),
                        then_branch: Box::new(ASTNode::nil()),
                        else_branch: Box::new(ASTNode::setq(
                            "__loop_break__".to_string(),
                            ASTNode::t(),
                        )),
                    };
                    add_expr(&mut body, &mut cond_stack, while_expr);
                }
                LoopClause::Always { expr } => {
                    // (unless expr (return nil))
                    let always_expr = ASTNode::If {
                        test: Box::new(expr.clone()),
                        then_branch: Box::new(ASTNode::nil()),
                        else_branch: Box::new(ASTNode::Call {
                            function: Box::new(ASTNode::Variable("return".to_string())),
                            args: vec![ASTNode::nil()],
                        }),
                    };
                    add_expr(&mut body, &mut cond_stack, always_expr);
                }
                LoopClause::Never { expr } => {
                    // (when expr (return nil))
                    let never_expr = ASTNode::If {
                        test: Box::new(expr.clone()),
                        then_branch: Box::new(ASTNode::Call {
                            function: Box::new(ASTNode::Variable("return".to_string())),
                            args: vec![ASTNode::nil()],
                        }),
                        else_branch: Box::new(ASTNode::nil()),
                    };
                    add_expr(&mut body, &mut cond_stack, never_expr);
                }
                _ => {}
            }
        }

        // Close any remaining conditionals
        while let Some((cond, then_body, else_body, _)) = cond_stack.pop() {
            let if_expr = if else_body.is_empty() {
                ASTNode::If {
                    test: Box::new(cond),
                    then_branch: Box::new(ASTNode::progn(then_body)),
                    else_branch: Box::new(ASTNode::nil()),
                }
            } else {
                ASTNode::If {
                    test: Box::new(cond),
                    then_branch: Box::new(ASTNode::progn(then_body)),
                    else_branch: Box::new(ASTNode::progn(else_body)),
                }
            };
            if let Some((_, ref mut parent_then, ref mut parent_else, in_else)) = cond_stack.last_mut() {
                if *in_else {
                    parent_else.push(if_expr);
                } else {
                    parent_then.push(if_expr);
                }
            } else {
                body.push(if_expr);
            }
        }

        body
            .into_iter()
            .map(|expr| rewrite_loop_return_calls(&expr, loop_name))
            .collect()
    }
}
