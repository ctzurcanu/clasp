/// Convert LispObject from rlasp-reader to ASTNode for evaluation

use crate::ir::{ASTNode, ConstantValue, SlotSpec};
use rlasp_runtime::{LispObject, RVector, header::{TypeHeader, ObjectType}};

pub fn lisp_to_ast(obj: LispObject) -> Result<ASTNode, String> {
    // Special case: raw value 0 is ambiguous - it could be fixnum(0) or nil()
    // The runtime uses the same representation for both.
    // We treat raw 0 as NIL (empty list) rather than the number 0.
    // To use the number 0, it must come from a different code path (e.g., arithmetic).
    if obj.is_nil() {
        return Ok(ASTNode::nil());
    }

    // Fixnum - but note that fixnum(0) is handled above as NIL
    if let Some(n) = obj.as_fixnum() {
        return Ok(ASTNode::fixnum(n));
    }

    // T (represented as fixnum 1 - already checked above)

    // General object - could be Symbol, Number, Vector, etc.
    if obj.is_general() {
        // Get pointer for type header checking
        if let Some(ptr) = obj.as_general_ptr::<u8>() {
            if !ptr.is_null() {
                // Check type header to determine actual type
                if let Some(obj_type) = unsafe { TypeHeader::from_ptr(ptr) } {
                    match obj_type {
                        ObjectType::Vector => {
                            let vector = unsafe { &*(ptr as *const RVector) };
                            let mut elements = Vec::new();
                            for elem in vector.as_slice() {
                                elements.push(lisp_to_ast(*elem)?);
                            }
                            return Ok(ASTNode::Vector(elements));
                        }
                        ObjectType::Symbol => {
                            let symbol = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                            let name = symbol.name();

                            // Check if it's a string disguised as a symbol (starts and ends with ")
                            if name.starts_with('"') && name.ends_with('"') {
                                let string_content = &name[1..name.len()-1];
                                return Ok(ASTNode::Constant(ConstantValue::String(string_content.to_string())));
                            }

                            // Special case: the symbol 'nil' should be treated as NIL constant
                            if name.to_lowercase() == "nil" {
                                return Ok(ASTNode::nil());
                            }

                            // Special case: the symbol 't' should be treated as T (true)
                            if name.to_lowercase() == "t" {
                                return Ok(ASTNode::Constant(ConstantValue::T));
                            }

                            return Ok(ASTNode::variable(name.to_string()));
                        }
                        ObjectType::Number => {
                            // Try Float first
                            if let Some(f) = obj.as_float() {
                                return Ok(ASTNode::float(f));
                            }
                            // Try Bignum
                            let num = unsafe { &*(ptr as *const rlasp_runtime::Number) };
                            if let Some(bignum) = num.as_bignum() {
                                return Ok(ASTNode::Constant(ConstantValue::Bignum(bignum.to_string())));
                            }
                        }
                        _ => {
                            // Other types - fall through to error
                        }
                    }
                }
            }
        }
    }

    // Cons (list)
    if obj.is_cons() {
        return cons_to_ast(obj);
    }

    // Character
    if obj.is_character() {
        if let Some(ch) = obj.as_character() {
            return Ok(ASTNode::Constant(ConstantValue::Character(ch)));
        }
    }

    // HashTable - convert to AST HashTable node
    let debug_str = format!("{:?}", obj);
    if debug_str.starts_with("HashTable") || debug_str.contains("HASH-TABLE") {
        // For now, return an empty hash table
        // TODO: extract actual entries if the runtime provides access
        return Ok(ASTNode::HashTable {
            entries: vec![],
        });
    }

    Err(format!("Cannot convert LispObject to AST: {:?}", obj))
}

fn cons_to_ast(obj: LispObject) -> Result<ASTNode, String> {
    if !obj.is_cons() {
        return Err("Not a cons".to_string());
    }

    let cons_ptr = obj.as_cons_ptr().ok_or("Invalid cons pointer")?;
    if cons_ptr.is_null() {
        return Err("Null cons pointer".to_string());
    }
    let cons = unsafe { &*cons_ptr };
    let car = cons.car();
    let cdr = cons.cdr();

    // Check for quote
    if car.is_general() && !car.is_number() {
        if let Some(symbol_ptr) = car.as_general_ptr::<rlasp_runtime::Symbol>() {
            if !symbol_ptr.is_null() {
                let symbol = unsafe { &*symbol_ptr };
                let name = symbol.name();

                if name == "quote" {
                    // (quote x) -> Quote(x)
                    // IMPORTANT: Convert quoted content as DATA, not as CODE
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let quoted = lisp_to_ast_as_data(cdr_cons.car())?;
                                return Ok(ASTNode::Quote(Box::new(quoted)));
                            }
                        }
                    }
                }

                if name == "backquote" || name == "quasiquote" {
                    // (backquote x) -> Backquote(x)
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let form = lisp_to_ast(cdr_cons.car())?;
                                return Ok(ASTNode::Backquote(Box::new(form)));
                            }
                        }
                    }
                }

                if name == "unquote" {
                    // (unquote x) -> Unquote(x)
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let form = lisp_to_ast(cdr_cons.car())?;
                                return Ok(ASTNode::Unquote(Box::new(form)));
                            }
                        }
                    }
                }

                if name == "unquote-splicing" {
                    // (unquote-splicing x) -> UnquoteSplicing(x)
                    if cdr.is_cons() {
                        if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                            if !cdr_ptr.is_null() {
                                let cdr_cons = unsafe { &*cdr_ptr };
                                let form = lisp_to_ast(cdr_cons.car())?;
                                return Ok(ASTNode::UnquoteSplicing(Box::new(form)));
                            }
                        }
                    }
                }
            }
        }
    }

    // Check for special forms
    if car.is_general() && !car.is_number() {
        if let Some(symbol_ptr) = car.as_general_ptr::<rlasp_runtime::Symbol>() {
            if !symbol_ptr.is_null() {
                let symbol = unsafe { &*symbol_ptr };
                let raw_name = symbol.name();

                // Normalize name by stripping common package prefixes (case-insensitive)
                let name_lower = raw_name.to_lowercase();
                let name = if name_lower.starts_with("cl:") || name_lower.starts_with("cl::") {
                    raw_name.splitn(2, ':').last().unwrap_or(raw_name).trim_start_matches(':')
                } else if name_lower.starts_with("common-lisp:") || name_lower.starts_with("common-lisp::") {
                    raw_name.splitn(2, ':').last().unwrap_or(raw_name).trim_start_matches(':')
                } else {
                    raw_name
                };

                match name {
                    "if" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("if requires at least 2 arguments".to_string());
                        }
                        return Ok(ASTNode::if_then_else(
                            args[0].clone(),
                            args[1].clone(),
                            args.get(2).cloned().unwrap_or(ASTNode::nil())
                        ));
                    }
                    "when" => {
                        // (when test body...) => (if test (progn body...) nil)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("when requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        return Ok(ASTNode::if_then_else(test, body, ASTNode::nil()));
                    }
                    "unless" => {
                        // (unless test body...) => (if (not test) (progn body...) nil)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("unless requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let negated_test = ASTNode::call(
                            ASTNode::variable("not"),
                            vec![test]
                        );
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        return Ok(ASTNode::if_then_else(negated_test, body, ASTNode::nil()));
                    }
                    "case" | "ecase" => {
                        // (case expr (key1 result1...) (key2 result2...) ...)
                        // => (let ((tmp expr)) (cond ((eql tmp key1) result1...) ...))
                        // Handle case clauses at raw LispObject level to avoid
                        // interpreting key lists as function calls
                        let raw_clauses = raw_cdr_to_vec(cdr.clone())?;
                        if raw_clauses.is_empty() {
                            return Err("case requires at least 1 argument (keyform)".to_string());
                        }

                        let keyform = lisp_to_ast(raw_clauses[0].clone())?;
                        let tmp_var = "__case_tmp".to_string();

                        // Build cond clauses from raw LispObjects
                        let mut cond_clauses = Vec::new();
                        for raw_clause in &raw_clauses[1..] {
                            if let Some(clause_cons) = raw_clause.as_cons_ptr() {
                                let clause_cons = unsafe { &*clause_cons };
                                let key_obj = clause_cons.car();
                                let body_cdr = clause_cons.cdr();

                                // Convert key to test expression
                                let test = case_key_to_test(&key_obj, &tmp_var)?;

                                // Convert body forms
                                let body_forms = raw_cdr_to_vec(body_cdr)?;
                                let body_asts: Result<Vec<_>, _> = body_forms.iter()
                                    .map(|o| lisp_to_ast(o.clone()))
                                    .collect();
                                let body_asts = body_asts?;

                                let result = if body_asts.len() == 1 {
                                    body_asts[0].clone()
                                } else if body_asts.is_empty() {
                                    ASTNode::nil()
                                } else {
                                    ASTNode::progn(body_asts)
                                };

                                cond_clauses.push((test, result));
                            }
                        }

                        // Build (let ((tmp keyform)) (cond ...))
                        let cond_node = ASTNode::Cond { clauses: cond_clauses };
                        return Ok(ASTNode::let_bindings(
                            vec![(tmp_var, keyform)],
                            vec![cond_node]
                        ));
                    }
                    "progn" => {
                        let exprs = cdr_to_vec(cdr)?;
                        return Ok(ASTNode::progn(exprs));
                    }
                    "block" => {
                        // (block name body...)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("block requires at least 1 argument (name)".to_string());
                        }
                        let name = if let ASTNode::Variable(n) = &args[0] {
                            Some(n.clone())
                        } else if let ASTNode::Constant(ConstantValue::Nil) = &args[0] {
                            None
                        } else {
                            return Err("block name must be a symbol or nil".to_string());
                        };
                        let body = if args.len() > 1 {
                            args[1..].to_vec()
                        } else {
                            vec![]
                        };
                        return Ok(ASTNode::Block { name, body });
                    }
                    "return-from" => {
                        // (return-from name value)
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("return-from requires at least 1 argument (block name)".to_string());
                        }
                        let block_name = if let ASTNode::Variable(n) = &args[0] {
                            Some(n.clone())
                        } else if let ASTNode::Constant(ConstantValue::Nil) = &args[0] {
                            None
                        } else {
                            return Err("return-from block name must be a symbol or nil".to_string());
                        };
                        let value = args.get(1).cloned().map(Box::new);
                        return Ok(ASTNode::ReturnFrom { block_name, value });
                    }
                    "return" => {
                        // (return value) => (return-from nil value)
                        let args = cdr_to_vec(cdr)?;
                        let value = args.get(0).cloned().map(Box::new);
                        return Ok(ASTNode::ReturnFrom { block_name: None, value });
                    }
                    "cond" => {
                        // Parse: (cond (test1 result1) (test2 result2) ...)
                        let raw_clauses = cdr_to_vec(cdr)?;
                        let mut clauses = Vec::new();

                        for clause_ast in raw_clauses {
                            // Each clause should be a list (test result)
                            match &clause_ast {
                                ASTNode::Call { function, args } => {
                                    // The test is the function, results are the args
                                    let test = (**function).clone();
                                    let result = if args.is_empty() {
                                        // (test) - result is test value itself
                                        test.clone()
                                    } else if args.len() == 1 {
                                        args[0].clone()
                                    } else {
                                        ASTNode::progn(args.clone())
                                    };
                                    clauses.push((test, result));
                                }
                                ASTNode::Quote(inner) => {
                                    // Quoted form as clause - unlikely but handle it
                                    // Treat quote as test, and its value as result
                                    clauses.push((clause_ast.clone(), clause_ast.clone()));
                                }
                                ASTNode::Constant(ConstantValue::Nil) => {
                                    // Empty clause () - skip
                                }
                                _ => {
                                    // For unsupported patterns, skip and continue
                                    // or treat the clause as (test) where result is test
                                    clauses.push((clause_ast.clone(), clause_ast.clone()));
                                }
                            }
                        }

                        return Ok(ASTNode::Cond { clauses });
                    }
                    "setq" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() || args.len() % 2 != 0 {
                            return Err("setq requires an even number of arguments (var value pairs)".to_string());
                        }
                        if args.len() == 2 {
                            // Simple case: (setq var val)
                            match &args[0] {
                                ASTNode::Variable(var) => {
                                    return Ok(ASTNode::setq(var.clone(), args[1].clone()));
                                }
                                ASTNode::Unquote(_) => {
                                    // Inside backquote - don't validate yet, just create a Call
                                    return Ok(ASTNode::Call {
                                        function: Box::new(ASTNode::variable("setq".to_string())),
                                        args: args,
                                    });
                                }
                                _ => return Err("setq variable must be a symbol".to_string()),
                            }
                        }
                        // Multiple pairs: (setq x 1 y 2 z 3) => (progn (setq x 1) (setq y 2) (setq z 3))
                        let mut setqs = Vec::new();
                        for i in (0..args.len()).step_by(2) {
                            match &args[i] {
                                ASTNode::Variable(var) => {
                                    setqs.push(ASTNode::setq(var.clone(), args[i + 1].clone()));
                                }
                                ASTNode::Unquote(_) => {
                                    // Inside backquote - create individual setq calls
                                    setqs.push(ASTNode::Call {
                                        function: Box::new(ASTNode::variable("setq".to_string())),
                                        args: vec![args[i].clone(), args[i + 1].clone()],
                                    });
                                }
                                _ => return Err("setq variable must be a symbol".to_string()),
                            }
                        }
                        return Ok(ASTNode::progn(setqs));
                    }
                    "lambda" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("lambda requires at least 1 argument".to_string());
                        }
                        let (params, defaults, supplied_p_vars) = extract_params_with_defaults(&args[0]);
                        let body = args[1..].to_vec();
                        return Ok(ASTNode::lambda_with_supplied_p(params, defaults, supplied_p_vars, body));
                    }
                    "dotimes" => {
                        // Parse: (dotimes (var count [result]) body...)
                        // First get the control list and body from raw cdr
                        let cdr_list = cdr_to_vec(cdr)?;
                        if cdr_list.len() < 2 {
                            return Err("dotimes requires control list and body".to_string());
                        }

                        // Extract control list as (var count [result])
                        // The control has been parsed by lisp_to_ast, need to extract elements
                        let (var, count_ast, result_ast) = match &cdr_list[0] {
                            // If it's already a Call, we can extract var from first arg
                            ASTNode::Call { function, args: control_args } if control_args.len() >= 1 => {
                                let var = if let ASTNode::Variable(v) = &**function {
                                    v.clone()
                                } else {
                                    return Err("dotimes var must be a symbol".to_string());
                                };
                                let count = control_args.get(0)
                                    .ok_or("dotimes missing count")?
                                    .clone();
                                let result = control_args.get(1).cloned();
                                (var, count, result)
                            }
                            _ => return Err("dotimes control must be a list (var count [result])".to_string()),
                        };

                        let body = cdr_list[1..].to_vec();
                        return Ok(ASTNode::Dotimes {
                            var,
                            count: Box::new(count_ast),
                            result: result_ast.map(Box::new),
                            body,
                        });
                    }
                    "dolist" => {
                        // Parse: (dolist (var list [result]) body...)
                        let cdr_list = cdr_to_vec(cdr)?;
                        if cdr_list.len() < 2 {
                            return Err("dolist requires control list and body".to_string());
                        }

                        // Extract control list as (var list [result])
                        let (var, list_ast, result_ast) = match &cdr_list[0] {
                            ASTNode::Call { function, args: control_args } if control_args.len() >= 1 => {
                                let var = if let ASTNode::Variable(v) = &**function {
                                    v.clone()
                                } else {
                                    return Err("dolist var must be a symbol".to_string());
                                };
                                let list = control_args.get(0)
                                    .ok_or("dolist missing list")?
                                    .clone();
                                let result = control_args.get(1).cloned();
                                (var, list, result)
                            }
                            _ => return Err("dolist control must be a list (var list [result])".to_string()),
                        };

                        let body = cdr_list[1..].to_vec();
                        return Ok(ASTNode::Dolist {
                            var,
                            list: Box::new(list_ast),
                            result: result_ast.map(Box::new),
                            body,
                        });
                    }
                    "loop" => {
                        // Parse loop forms with full Common Lisp syntax:
                        // (loop for var from start below limit [when/unless/if condition] collect/sum expr [else collect/sum expr])
                        let cdr_list = cdr_to_vec(cdr)?;

                        // Try to parse as simple for loop, fall back to Call if parsing fails
                        if let Some(loop_ast) = try_parse_simple_loop(&cdr_list) {
                            return Ok(loop_ast);
                        }
                        // Fall back to Call for complex/unsupported loop forms
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::Variable("loop".to_string())),
                            args: cdr_list,
                        });
                    }
                    "let" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("let requires at least 1 argument (bindings)".to_string());
                        }
                        // If bindings contain unquote (from backquote), keep as Call
                        if contains_unquote(&args[0]) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("let".to_string())),
                                args: args,
                            });
                        }
                        let bindings = extract_bindings(&args[0])?;
                        let body = if args.len() > 1 { args[1..].to_vec() } else { vec![] };
                        return Ok(ASTNode::Let { bindings, body });
                    }
                    "let*" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("let* requires at least 1 argument (bindings)".to_string());
                        }
                        // If bindings contain unquote (from backquote), keep as Call
                        if contains_unquote(&args[0]) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("let*".to_string())),
                                args: args,
                            });
                        }
                        let bindings = extract_bindings(&args[0])?;
                        let body = if args.len() > 1 { args[1..].to_vec() } else { vec![] };
                        return Ok(ASTNode::LetStar { bindings, body });
                    }
                    "symbol-macrolet" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("symbol-macrolet requires at least 1 argument (bindings)".to_string());
                        }
                        // Extract bindings: ((sym1 expansion1) (sym2 expansion2) ...)
                        let bindings = extract_bindings(&args[0])?;
                        let body = if args.len() > 1 { args[1..].to_vec() } else { vec![] };

                        // Expand symbol macros in the body
                        let expanded_body: Result<Vec<ASTNode>, String> = body.iter()
                            .map(|expr| expand_symbol_macros(expr, &bindings))
                            .collect();

                        // Return the expanded body as a progn
                        return Ok(ASTNode::Progn { exprs: expanded_body? });
                    }
                    // "macrolet" is handled in eval_core.rs to properly evaluate macro bodies
                    // (the compile-time approach here couldn't handle (list ...) or other evaluated forms)
                    // "defun", "defmacro", "defvar", "defparameter" - handled in eval_core.rs
                    // to preserve forms for macros. Fall through to generic Call handling.
                    "defstruct" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("defstruct requires at least a name".to_string());
                        }

                        // Parse struct name (can be symbol or (name options))
                        let struct_name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            ASTNode::Call { function, .. } => {
                                // (name options...) form - extract name
                                if let ASTNode::Variable(n) = &**function {
                                    n.clone()
                                } else {
                                    return Err("defstruct name must be a symbol".to_string());
                                }
                            }
                            _ => return Err("defstruct name must be a symbol or (name options)".to_string()),
                        };

                        // Parse slot definitions (skip docstring if present)
                        let mut slot_names = Vec::new();
                        let mut slot_defaults = Vec::new();

                        // Start at args[1], but skip if it's a docstring (Constant String)
                        let slots_start = if args.len() > 1 {
                            match &args[1] {
                                ASTNode::Constant(ConstantValue::String(_)) => 2,
                                _ => 1,
                            }
                        } else {
                            1
                        };

                        for slot_def in &args[slots_start..] {
                            match slot_def {
                                ASTNode::Variable(slot_name) => {
                                    slot_names.push(slot_name.clone());
                                    slot_defaults.push(ASTNode::nil());
                                }
                                ASTNode::Call { function, args: slot_args } => {
                                    // (slot-name default-value) form
                                    if let ASTNode::Variable(slot_name) = &**function {
                                        slot_names.push(slot_name.clone());
                                        if !slot_args.is_empty() {
                                            slot_defaults.push(slot_args[0].clone());
                                        } else {
                                            slot_defaults.push(ASTNode::nil());
                                        }
                                    } else {
                                        return Err("defstruct slot name must be a symbol".to_string());
                                    }
                                }
                                _ => return Err("defstruct slot must be a symbol or (name default)".to_string()),
                            }
                        }

                        // Generate functions
                        let mut forms = Vec::new();

                        // 1. Constructor: (defun make-STRUCT (&key slot1 slot2 ...) (make-hash-table ...))
                        let constructor_name = format!("make-{}", struct_name);

                        // Create constructor function
                        // (defun make-STRUCT (&key slots...) (progn (setq obj (make-hash-table)) ...))
                        let mut full_constructor_body = vec![
                            ASTNode::setq(
                                "obj",
                                ASTNode::Call {
                                    function: Box::new(ASTNode::Variable("make-hash-table".to_string())),
                                    args: vec![],
                                },
                            ),
                        ];

                        // Add slot initialization - use (or param default) to handle defaults
                        for (slot_name, default) in slot_names.iter().zip(slot_defaults.iter()) {
                            // Initialize slot with (or param-value default-value)
                            // This ensures defaults are used when keyword arg is not provided
                            let value_expr = if matches!(default, ASTNode::Constant(ConstantValue::Nil)) {
                                // If default is nil, just use the parameter
                                ASTNode::Variable(slot_name.clone())
                            } else {
                                // Use (or param default) to handle cases where param is not provided
                                ASTNode::Call {
                                    function: Box::new(ASTNode::Variable("or".to_string())),
                                    args: vec![
                                        ASTNode::Variable(slot_name.clone()),
                                        default.clone(),
                                    ],
                                }
                            };

                            full_constructor_body.push(ASTNode::Call {
                                function: Box::new(ASTNode::Variable("setf".to_string())),
                                args: vec![
                                    ASTNode::Call {
                                        function: Box::new(ASTNode::Variable("gethash".to_string())),
                                        args: vec![
                                            ASTNode::Quote(Box::new(ASTNode::Variable(slot_name.clone()))),
                                            ASTNode::Variable("obj".to_string()),
                                        ],
                                    },
                                    value_expr,
                                ],
                            });
                        }

                        full_constructor_body.push(ASTNode::Variable("obj".to_string()));

                        // Generate: (setq make-STRUCT (lambda (&key slots...) body))
                        let constructor_params = vec!["&key".to_string()]
                            .into_iter()
                            .chain(slot_names.iter().cloned())
                            .collect();
                        let constructor_lambda = ASTNode::lambda(constructor_params, full_constructor_body);
                        forms.push(ASTNode::setq(constructor_name, constructor_lambda));

                        // 2. Predicate: (setq STRUCT-p (lambda (obj) (hash-table-p obj)))
                        let predicate_lambda = ASTNode::lambda(
                            vec!["obj".to_string()],
                            vec![ASTNode::Call {
                                function: Box::new(ASTNode::Variable("hash-table-p".to_string())),
                                args: vec![ASTNode::Variable("obj".to_string())],
                            }],
                        );
                        forms.push(ASTNode::setq(format!("{}-p", struct_name), predicate_lambda));

                        // 3. Accessors: (setq STRUCT-SLOT (lambda (obj) (gethash 'slot obj)))
                        for slot_name in &slot_names {
                            let accessor_lambda = ASTNode::lambda(
                                vec!["obj".to_string()],
                                vec![ASTNode::Call {
                                    function: Box::new(ASTNode::Variable("gethash".to_string())),
                                    args: vec![
                                        ASTNode::Quote(Box::new(ASTNode::Variable(slot_name.clone()))),
                                        ASTNode::Variable("obj".to_string()),
                                    ],
                                }],
                            );
                            forms.push(ASTNode::setq(format!("{}-{}", struct_name, slot_name), accessor_lambda));
                        }

                        // 4. Copier: (setq copy-STRUCT (lambda (obj) (copy-hash-table obj)))
                        let copier_lambda = ASTNode::lambda(
                            vec!["obj".to_string()],
                            vec![ASTNode::Call {
                                function: Box::new(ASTNode::Variable("copy-hash-table".to_string())),
                                args: vec![ASTNode::Variable("obj".to_string())],
                            }],
                        );
                        forms.push(ASTNode::setq(format!("copy-{}", struct_name), copier_lambda));

                        // Return all forms wrapped in progn
                        return Ok(ASTNode::progn(forms));
                    }
                    "defclass" => {
                        // (defclass name (superclasses...) ((slot options...) ...) class-options...)
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("defclass requires at least name and superclasses".to_string());
                        }

                        // Parse class name
                        let class_name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            _ => return Err("defclass name must be a symbol".to_string()),
                        };

                        // Parse superclasses
                        let superclasses = match &args[1] {
                            ASTNode::Constant(ConstantValue::Nil) => vec![],
                            ASTNode::Call { function, args: supers } => {
                                let mut all_supers = vec![*function.clone()];
                                all_supers.extend(supers.clone());
                                all_supers.iter().filter_map(|s| {
                                    if let ASTNode::Variable(name) = s {
                                        Some(name.clone())
                                    } else {
                                        None
                                    }
                                }).collect()
                            }
                            _ => vec![],
                        };

                        // Parse slots (args[2] if it exists, otherwise empty)
                        let slots_def = if args.len() > 2 { &args[2] } else { &ASTNode::Constant(ConstantValue::Nil) };

                        let mut slot_specs = Vec::new();

                        match slots_def {
                            ASTNode::Constant(ConstantValue::Nil) => {
                                // No slots
                            }
                            ASTNode::Call { function, args: slot_list } => {
                                // Process all slots
                                let mut all_slots = vec![*function.clone()];
                                all_slots.extend(slot_list.clone());

                                for slot_def in all_slots {
                                    // Each slot is either a symbol or (slot-name options...)
                                    match slot_def {
                                        ASTNode::Variable(slot_name) => {
                                            // Simple slot
                                            slot_specs.push(SlotSpec {
                                                name: slot_name.clone(),
                                                initarg: None,
                                                initform: None,
                                                accessor: None,
                                                reader: None,
                                                writer: None,
                                            });
                                        }
                                        ASTNode::Call { function: slot_func, args: slot_options } => {
                                            let slot_name = match &*slot_func {
                                                ASTNode::Variable(name) => name.clone(),
                                                _ => continue,
                                            };

                                            // Parse slot options
                                            let mut initarg: Option<String> = None;
                                            let mut initform: Option<Box<ASTNode>> = None;
                                            let mut accessor: Option<String> = None;
                                            let mut reader: Option<String> = None;
                                            let mut writer: Option<String> = None;

                                            let mut i = 0;
                                            while i < slot_options.len() {
                                                if let ASTNode::Variable(option_name) = &slot_options[i] {
                                                    if option_name.starts_with(':') {
                                                        let option_key = option_name.as_str();
                                                        if i + 1 < slot_options.len() {
                                                            match option_key {
                                                                ":initarg" => {
                                                                    if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                        initarg = Some(val.clone());
                                                                    }
                                                                }
                                                                ":initform" => {
                                                                    initform = Some(Box::new(slot_options[i + 1].clone()));
                                                                }
                                                                ":accessor" => {
                                                                    if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                        accessor = Some(val.clone());
                                                                    }
                                                                }
                                                                ":reader" => {
                                                                    if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                        reader = Some(val.clone());
                                                                    }
                                                                }
                                                                ":writer" => {
                                                                    if let ASTNode::Variable(val) = &slot_options[i + 1] {
                                                                        writer = Some(val.clone());
                                                                    }
                                                                }
                                                                _ => {}
                                                            }
                                                            i += 2;
                                                        } else {
                                                            i += 1;
                                                        }
                                                    } else {
                                                        i += 1;
                                                    }
                                                } else {
                                                    i += 1;
                                                }
                                            }

                                            slot_specs.push(SlotSpec {
                                                name: slot_name,
                                                initarg,
                                                initform,
                                                accessor,
                                                reader,
                                                writer,
                                            });
                                        }
                                        _ => {}
                                    }
                                }
                            }
                            _ => {}
                        }

                        return Ok(ASTNode::Defclass {
                            name: class_name,
                            superclasses,
                            slots: slot_specs,
                        });
                    }
                    "defgeneric" => {
                        // (defgeneric name lambda-list [:argument-precedence-order ...] [:documentation ...])
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("defgeneric requires at least name and lambda-list".to_string());
                        }

                        // If any args contain unquote (from backquote), keep as Call
                        // This allows macro expansion to substitute values first
                        if args.iter().any(|a| contains_unquote(a)) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("defgeneric".to_string())),
                                args,
                            });
                        }

                        // Parse generic function name (can be symbol or (setf name))
                        let name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                            ASTNode::Call { function, args: setf_args } => {
                                // Handle (setf name) form
                                if let ASTNode::Variable(fn_name) = &**function {
                                    if fn_name.eq_ignore_ascii_case("setf") && !setf_args.is_empty() {
                                        if let ASTNode::Variable(setf_name) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else if let ASTNode::Constant(ConstantValue::Symbol(setf_name)) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else {
                                            return Err("defgeneric (setf name) requires a symbol name".to_string());
                                        }
                                    } else {
                                        return Err("defgeneric name must be a symbol or (setf name)".to_string());
                                    }
                                } else {
                                    return Err("defgeneric name must be a symbol or (setf name)".to_string());
                                }
                            }
                            _ => return Err(format!("defgeneric name must be a symbol, got {:?}", &args[0])),
                        };

                        // Parse lambda list
                        let lambda_list = match &args[1] {
                            ASTNode::Constant(ConstantValue::Nil) => vec![],
                            ASTNode::Call { function, args: params } => {
                                let mut all_params = vec![*function.clone()];
                                all_params.extend(params.clone());
                                all_params.iter().filter_map(|p| {
                                    if let ASTNode::Variable(name) = p {
                                        Some(name.clone())
                                    } else {
                                        None
                                    }
                                }).collect()
                            }
                            _ => vec![],
                        };

                        return Ok(ASTNode::Defgeneric {
                            name,
                            lambda_list,
                        });
                    }
                    "defmethod" => {
                        // (defmethod name [:qualifier] (specialized-lambda-list) body...)
                        let args = cdr_to_vec(cdr)?;
                        if args.len() < 2 {
                            return Err("defmethod requires at least name and specialized-lambda-list".to_string());
                        }

                        // If any args contain unquote (from backquote), keep as Call
                        // This allows macro expansion to substitute values first
                        if args.iter().any(|a| contains_unquote(a)) {
                            return Ok(ASTNode::Call {
                                function: Box::new(ASTNode::variable("defmethod".to_string())),
                                args,
                            });
                        }

                        // Parse method name (can be symbol or (setf name))
                        let generic_name = match &args[0] {
                            ASTNode::Variable(n) => n.clone(),
                            ASTNode::Constant(ConstantValue::Symbol(s)) => s.clone(),
                            ASTNode::Call { function, args: setf_args } => {
                                // Handle (setf name) form
                                if let ASTNode::Variable(fn_name) = &**function {
                                    if fn_name.eq_ignore_ascii_case("setf") && !setf_args.is_empty() {
                                        if let ASTNode::Variable(setf_name) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else if let ASTNode::Constant(ConstantValue::Symbol(setf_name)) = &setf_args[0] {
                                            format!("(setf {})", setf_name)
                                        } else {
                                            return Err("defmethod (setf name) requires a symbol name".to_string());
                                        }
                                    } else {
                                        return Err("defmethod name must be a symbol or (setf name)".to_string());
                                    }
                                } else {
                                    return Err("defmethod name must be a symbol or (setf name)".to_string());
                                }
                            }
                            _ => return Err(format!("defmethod name must be a symbol, got {:?}", &args[0])),
                        };

                        // Check for optional qualifier (:before, :after, :around)
                        let (qualifier, lambda_list_idx) = match &args[1] {
                            ASTNode::Variable(kw) if kw.starts_with(':') => {
                                // It's a qualifier
                                let q = kw.to_uppercase();
                                if q == ":BEFORE" || q == ":AFTER" || q == ":AROUND" {
                                    (Some(q), 2)
                                } else {
                                    (None, 1) // Not a recognized qualifier, treat as lambda-list
                                }
                            }
                            _ => (None, 1), // No qualifier
                        };

                        if args.len() <= lambda_list_idx {
                            return Err("defmethod requires specialized-lambda-list".to_string());
                        }

                        // Parse specialized lambda list
                        let (specializers, params) = match &args[lambda_list_idx] {
                            ASTNode::Constant(ConstantValue::Nil) => (vec![], vec![]),
                            ASTNode::Call { function, args: param_specs } => {
                                let mut all_param_specs = vec![*function.clone()];
                                all_param_specs.extend(param_specs.clone());

                                let mut spec_vec = Vec::new();
                                let mut param_vec = Vec::new();

                                for param_spec in all_param_specs {
                                    match param_spec {
                                        ASTNode::Variable(param_name) => {
                                            // Unspecialized parameter
                                            spec_vec.push("T".to_string());
                                            param_vec.push(param_name);
                                        }
                                        ASTNode::Call { function, args } => {
                                            // Specialized parameter: (param class-name)
                                            if let ASTNode::Variable(param_name) = &*function {
                                                param_vec.push(param_name.clone());
                                                if let Some(ASTNode::Variable(class_name)) = args.first() {
                                                    spec_vec.push(class_name.clone());
                                                } else {
                                                    spec_vec.push("T".to_string());
                                                }
                                            }
                                        }
                                        _ => {}
                                    }
                                }

                                (spec_vec, param_vec)
                            }
                            _ => (vec![], vec![]),
                        };

                        // Parse body
                        let body: Vec<ASTNode> = args[(lambda_list_idx + 1)..].to_vec();

                        return Ok(ASTNode::Defmethod {
                            generic_name,
                            qualifier,
                            specializers,
                            params,
                            body,
                        });
                    }
                    "define-condition" => {
                        // Pass through to eval_conditions::eval_define_condition
                        let args = cdr_to_vec(cdr)?;
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::Variable("define-condition".to_string())),
                            args,
                        });
                    }
                    // "declaim" - handled in eval_core.rs to preserve form for macros
                    "when" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("when requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        // Desugar to (if test (progn body...) nil)
                        return Ok(ASTNode::if_then_else(test, body, ASTNode::nil()));
                    }
                    "unless" => {
                        let args = cdr_to_vec(cdr)?;
                        if args.is_empty() {
                            return Err("unless requires at least 1 argument (test)".to_string());
                        }
                        let test = args[0].clone();
                        let body = if args.len() > 1 {
                            ASTNode::progn(args[1..].to_vec())
                        } else {
                            ASTNode::nil()
                        };
                        // Desugar to (if test nil (progn body...))
                        return Ok(ASTNode::if_then_else(test, ASTNode::nil(), body));
                    }
                    // cond is handled as a macro in expand_macros, not here
                    // This allows backquote/unquote-splicing to be expanded first
                    "cond" => {
                        // Just convert to a function call that will be handled later
                        let args = cdr_to_vec(cdr)?;
                        return Ok(ASTNode::Call {
                            function: Box::new(ASTNode::variable("cond".to_string())),
                            args,
                        });
                    }
                    _ => {}
                }
            }
        }
    }

    // Check if this is a dotted pair (car . cdr) where cdr is not a list
    if !cdr.is_nil() && !cdr.is_cons() {
        // This is a dotted pair: (car . cdr)
        let car_ast = lisp_to_ast(car)?;
        let cdr_ast = lisp_to_ast(cdr)?;
        return Ok(ASTNode::DottedPair {
            car: Box::new(car_ast),
            cdr: Box::new(cdr_ast),
        });
    }

    // Regular list - convert to Call
    let car_ast = lisp_to_ast(car)?;
    let args = cdr_to_vec(cdr)?;

    Ok(ASTNode::Call {
        function: Box::new(car_ast),
        args,
    })
}

fn extract_params(ast: &ASTNode) -> Vec<String> {
    let (params, _, _) = extract_params_with_defaults(ast);
    params
}

fn extract_params_with_defaults(ast: &ASTNode) -> (Vec<String>, std::collections::HashMap<String, ASTNode>, std::collections::HashMap<String, String>) {
    use std::collections::HashMap;
    let mut params = vec![];
    let mut defaults = HashMap::new();
    let mut supplied_p_vars = HashMap::new();

    match ast {
        ASTNode::Call { function, args } => {
            if let ASTNode::Variable(name) = &**function {
                // Preserve &optional and &key markers
                params.push(name.clone());
            }
            for arg in args {
                match arg {
                    ASTNode::Variable(name) => {
                        // Preserve &optional and &key markers as well as parameter names
                        params.push(name.clone());
                    }
                    // Handle keyword parameter with default value: (name default-expr)
                    // Or optional parameter with supplied-p: (name default-expr supplied-p-var)
                    ASTNode::Call { function: param_func, args: param_args } => {
                        if let ASTNode::Variable(param_name) = &**param_func {
                            params.push(param_name.clone());
                            // Store default value if provided
                            if !param_args.is_empty() {
                                defaults.insert(param_name.clone(), param_args[0].clone());
                            }
                            // If there's a supplied-p parameter (2nd element), track it (but DON'T add to params)
                            if param_args.len() > 1 {
                                if let ASTNode::Variable(supplied_p_name) = &param_args[1] {
                                    supplied_p_vars.insert(param_name.clone(), supplied_p_name.clone());
                                }
                            }
                        }
                    }
                    _ => {}
                }
            }
        }
        ASTNode::Variable(name) => {
            params.push(name.clone());
        }
        ASTNode::Constant(ConstantValue::Nil) => {}
        _ => {}
    }

    (params, defaults, supplied_p_vars)
}

fn contains_unquote(ast: &ASTNode) -> bool {
    // Check for unquote/unquote-splicing OUTSIDE of backquotes.
    // Unquotes inside backquotes are expected and handled by expand_backquote,
    // so we don't recurse into Backquote nodes.
    match ast {
        ASTNode::Unquote(_) | ASTNode::UnquoteSplicing(_) => true,
        ASTNode::Call { function, args } => {
            contains_unquote(function) || args.iter().any(|arg| contains_unquote(arg))
        }
        ASTNode::Quote(inner) => contains_unquote(inner),
        ASTNode::Backquote(_) => false, // Don't recurse into backquotes - unquotes inside are expected
        ASTNode::If { test, then_branch, else_branch } => {
            contains_unquote(test) || contains_unquote(then_branch) || contains_unquote(else_branch)
        }
        ASTNode::Progn { exprs } => exprs.iter().any(|e| contains_unquote(e)),
        _ => false,
    }
}

fn extract_bindings(ast: &ASTNode) -> Result<Vec<(String, ASTNode)>, String> {
    match ast {
        // Empty bindings: ()
        ASTNode::Constant(ConstantValue::Nil) => Ok(vec![]),
        // Single binding or list of bindings
        ASTNode::Call { function, args } => {
            let mut bindings = vec![];

            // First binding from function position
            if let ASTNode::Call { function: var, args: val_args } = &**function {
                if let ASTNode::Variable(var_name) = &**var {
                    if val_args.len() == 1 {
                        bindings.push((var_name.clone(), val_args[0].clone()));
                    } else if val_args.is_empty() {
                        // (var) with no value defaults to nil
                        bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
                    } else {
                        // Multiple values - take first value, ignore rest (lenient parsing)
                        bindings.push((var_name.clone(), val_args[0].clone()));
                    }
                } else {
                    return Err("Binding variable must be a symbol".to_string());
                }
            } else if let ASTNode::Variable(var_name) = &**function {
                // Plain variable (no value), defaults to nil
                bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
            } else {
                // Unknown binding format - use generic name and bind to nil (lenient)
                bindings.push(("_genbind_".to_string(), ASTNode::Constant(ConstantValue::Nil)));
            }

            // Remaining bindings from args
            for arg in args {
                if let ASTNode::Call { function: var, args: val_args } = arg {
                    if let ASTNode::Variable(var_name) = &**var {
                        if val_args.len() == 1 {
                            bindings.push((var_name.clone(), val_args[0].clone()));
                        } else if val_args.is_empty() {
                            // (var) with no value defaults to nil
                            bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
                        } else {
                            // Multiple values - take first value, ignore rest (lenient parsing)
                            bindings.push((var_name.clone(), val_args[0].clone()));
                        }
                    } else {
                        return Err("Binding variable must be a symbol".to_string());
                    }
                } else if let ASTNode::Variable(var_name) = arg {
                    // Plain variable (no value), defaults to nil
                    bindings.push((var_name.clone(), ASTNode::Constant(ConstantValue::Nil)));
                } else {
                    // Unknown binding format - use generic name and bind to nil (lenient)
                    bindings.push(("_genbind_".to_string(), ASTNode::Constant(ConstantValue::Nil)));
                }
            }

            Ok(bindings)
        }
        _ => Err(format!("Invalid bindings format: {:?}", ast)),
    }
}

/// Expand symbol macros in an AST node
fn expand_symbol_macros(ast: &ASTNode, bindings: &[(String, ASTNode)]) -> Result<ASTNode, String> {
    match ast {
        // If it's a variable, check if it's a symbol macro
        ASTNode::Variable(name) => {
            for (sym, expansion) in bindings {
                if sym == name {
                    // Return a clone of the expansion
                    return Ok(expansion.clone());
                }
            }
            // Not a symbol macro, return as-is
            Ok(ast.clone())
        }
        // For calls, recursively expand in function and args
        ASTNode::Call { function, args } => {
            let expanded_func = expand_symbol_macros(function, bindings)?;
            let expanded_args: Result<Vec<ASTNode>, String> = args.iter()
                .map(|arg| expand_symbol_macros(arg, bindings))
                .collect();
            Ok(ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args?,
            })
        }
        // For other node types, recursively expand as needed
        ASTNode::If { test, then_branch, else_branch } => {
            Ok(ASTNode::If {
                test: Box::new(expand_symbol_macros(test, bindings)?),
                then_branch: Box::new(expand_symbol_macros(then_branch, bindings)?),
                else_branch: Box::new(expand_symbol_macros(else_branch, bindings)?),
            })
        }
        ASTNode::Let { bindings: let_bindings, body } => {
            // Don't expand symbols that are bound in this let
            let mut new_bindings = Vec::new();
            for (name, value) in let_bindings {
                new_bindings.push((name.clone(), expand_symbol_macros(value, bindings)?));
            }
            let expanded_body: Result<Vec<ASTNode>, String> = body.iter()
                .map(|expr| expand_symbol_macros(expr, bindings))
                .collect();
            Ok(ASTNode::Let {
                bindings: new_bindings,
                body: expanded_body?,
            })
        }
        ASTNode::Progn { exprs } => {
            let expanded: Result<Vec<ASTNode>, String> = exprs.iter()
                .map(|expr| expand_symbol_macros(expr, bindings))
                .collect();
            Ok(ASTNode::Progn { exprs: expanded? })
        }
        // For constants and other nodes, return as-is
        _ => Ok(ast.clone()),
    }
}

/// Try to parse a simple loop form (for var [from start] below/to/upto/downto/above limit collect/sum expr)
/// Returns None if the loop form doesn't match our supported patterns
fn try_parse_simple_loop(cdr_list: &[ASTNode]) -> Option<ASTNode> {
    // Must have at least 4 elements: for var below limit collect/sum expr
    if cdr_list.len() < 4 {
        return None;
    }

    // Must start with "for"
    let first = match &cdr_list[0] {
        ASTNode::Variable(s) if s == "for" => s,
        _ => return None,
    };

    // Get var
    let var = match &cdr_list[1] {
        ASTNode::Variable(v) => v.clone(),
        _ => return None,
    };

    // Parse "from start below/to/upto/downto/above limit" or "below/to/... limit"
    let mut idx = 2;
    let start = if let ASTNode::Variable(s) = &cdr_list[idx] {
        if s == "from" {
            idx += 1;
            if idx >= cdr_list.len() {
                return None;
            }
            let start_val = cdr_list[idx].clone();
            idx += 1;
            Some(Box::new(start_val))
        } else {
            None
        }
    } else {
        None
    };

    // Check for limit keyword (below, to, upto, downto, above)
    if idx >= cdr_list.len() {
        return None;
    }
    let limit_keyword = match &cdr_list[idx] {
        ASTNode::Variable(s) if s == "below" || s == "to" || s == "upto" || s == "downto" || s == "above" => s.clone(),
        _ => return None,
    };
    idx += 1;

    // Get limit
    if idx >= cdr_list.len() {
        return None;
    }
    let limit = Box::new(cdr_list[idx].clone());
    idx += 1;

    // Check for optional "when", "unless", or "if" condition
    let when_condition = if idx < cdr_list.len() {
        if let ASTNode::Variable(s) = &cdr_list[idx] {
            if s == "when" || s == "if" || s == "unless" {
                idx += 1;
                if idx >= cdr_list.len() {
                    return None;
                }
                let cond = cdr_list[idx].clone();
                idx += 1;
                // Wrap unless in a not
                if s == "unless" {
                    Some(Box::new(ASTNode::Call {
                        function: Box::new(ASTNode::Variable("not".to_string())),
                        args: vec![cond],
                    }))
                } else {
                    Some(Box::new(cond))
                }
            } else {
                None
            }
        } else {
            None
        }
    } else {
        None
    };

    // Check for "collect" or "sum"
    if idx >= cdr_list.len() {
        return None;
    }
    let (collect, sum) = if let ASTNode::Variable(s) = &cdr_list[idx] {
        idx += 1;
        if s == "collect" {
            if idx >= cdr_list.len() {
                return None;
            }
            (Some(Box::new(cdr_list[idx].clone())), None)
        } else if s == "sum" {
            if idx >= cdr_list.len() {
                return None;
            }
            (None, Some(Box::new(cdr_list[idx].clone())))
        } else {
            return None;
        }
    } else {
        return None;
    };
    idx += 1;

    // Check for optional "else" clause
    let (else_collect, else_sum) = if idx < cdr_list.len() {
        if let ASTNode::Variable(s) = &cdr_list[idx] {
            if s == "else" {
                idx += 1;
                if idx >= cdr_list.len() {
                    return None;
                }
                if let ASTNode::Variable(action) = &cdr_list[idx] {
                    idx += 1;
                    if action == "collect" {
                        if idx >= cdr_list.len() {
                            return None;
                        }
                        (Some(Box::new(cdr_list[idx].clone())), None)
                    } else if action == "sum" {
                        if idx >= cdr_list.len() {
                            return None;
                        }
                        (None, Some(Box::new(cdr_list[idx].clone())))
                    } else {
                        return None;
                    }
                } else {
                    return None;
                }
            } else {
                (None, None)
            }
        } else {
            (None, None)
        }
    } else {
        (None, None)
    };

    Some(ASTNode::Loop {
        var,
        start,
        limit,
        when_condition,
        collect,
        sum,
        else_collect,
        else_sum,
    })
}

/// Convert LispObject to AST treating it as DATA (not code)
/// This is used for quoted forms where special forms should NOT be interpreted
/// e.g., '(defun foo) should become a list, not a function definition
fn lisp_to_ast_as_data(obj: LispObject) -> Result<ASTNode, String> {
    if obj.is_nil() {
        return Ok(ASTNode::nil());
    }

    if let Some(n) = obj.as_fixnum() {
        return Ok(ASTNode::fixnum(n));
    }

    if obj.is_character() {
        if let Some(ch) = obj.as_character() {
            return Ok(ASTNode::Constant(ConstantValue::Character(ch)));
        }
    }

    if obj.is_general() {
        // Use TypeHeader to determine exact type before casting
        if let Some(ptr) = obj.as_general_ptr::<u8>() {
            if !ptr.is_null() {
                if let Some(obj_type) = unsafe { rlasp_runtime::header::TypeHeader::from_ptr(ptr) } {
                    match obj_type {
                        rlasp_runtime::header::ObjectType::Vector => {
                            let vector = unsafe { &*(ptr as *const rlasp_runtime::RVector) };
                            let mut elements = Vec::new();
                            for elem in vector.as_slice() {
                                elements.push(lisp_to_ast_as_data(*elem)?);
                            }
                            return Ok(ASTNode::Vector(elements));
                        }
                        rlasp_runtime::header::ObjectType::Symbol => {
                            let symbol = unsafe { &*(ptr as *const rlasp_runtime::Symbol) };
                            let name = symbol.name();
                            // Strings are currently encoded by the reader as symbols with quotes.
                            // Preserve them as string constants even in quoted/data context.
                            if name.starts_with('"') && name.ends_with('"') && name.len() >= 2 {
                                let string_content = &name[1..name.len() - 1];
                                return Ok(ASTNode::Constant(ConstantValue::String(string_content.to_string())));
                            }
                            // Don't check for T here - T in quoted context is just a symbol
                            return Ok(ASTNode::Variable(name.to_string()));
                        }
                        rlasp_runtime::header::ObjectType::Number => {
                            if let Some(f) = obj.as_float() {
                                return Ok(ASTNode::float(f));
                            }
                        }
                        rlasp_runtime::header::ObjectType::String => {
                            // Handle string
                            let str_ptr = ptr as *const rlasp_runtime::RString;
                            let s = unsafe { (*str_ptr).as_str() };
                            return Ok(ASTNode::Constant(crate::ir::ConstantValue::String(s.to_string())));
                        }
                        _ => {} // Fall through to other checks
                    }
                }
            }
        }
    }

    if obj.is_cons() {
        // Convert list as data - recursively convert elements
        let cons_ptr = obj.as_cons_ptr().ok_or("Invalid cons")?;
        if cons_ptr.is_null() {
            return Ok(ASTNode::nil());
        }
        let cons = unsafe { &*cons_ptr };
        let car_obj = cons.car();
        let cdr = cons.cdr();

        // Check for unquote/unquote-splicing - these must be preserved even in quoted context
        // because they may be inside a backquote
        if car_obj.is_general() && !car_obj.is_number() {
            if let Some(symbol_ptr) = car_obj.as_general_ptr::<rlasp_runtime::Symbol>() {
                if !symbol_ptr.is_null() {
                    let symbol = unsafe { &*symbol_ptr };
                    let name = symbol.name();

                    if name == "unquote" {
                        // (unquote x) -> Unquote(x)
                        // IMPORTANT: Use lisp_to_ast (not lisp_to_ast_as_data) because
                        // the unquoted form is CODE that will be evaluated
                        if cdr.is_cons() {
                            if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                                if !cdr_ptr.is_null() {
                                    let cdr_cons = unsafe { &*cdr_ptr };
                                    let form = lisp_to_ast(cdr_cons.car())?;
                                    return Ok(ASTNode::Unquote(Box::new(form)));
                                }
                            }
                        }
                    }

                    if name == "unquote-splicing" {
                        // (unquote-splicing x) -> UnquoteSplicing(x)
                        // IMPORTANT: Use lisp_to_ast (not lisp_to_ast_as_data) because
                        // the unquoted form is CODE that will be evaluated
                        if cdr.is_cons() {
                            if let Some(cdr_ptr) = cdr.as_cons_ptr() {
                                if !cdr_ptr.is_null() {
                                    let cdr_cons = unsafe { &*cdr_ptr };
                                    let form = lisp_to_ast(cdr_cons.car())?;
                                    return Ok(ASTNode::UnquoteSplicing(Box::new(form)));
                                }
                            }
                        }
                    }
                }
            }
        }

        // For quoted data, we represent lists as Call nodes where the first element
        // is the function and rest are args. When ast_to_result processes this,
        // it will create a proper cons list (a . (b . (c . nil))).
        let car = lisp_to_ast_as_data(car_obj)?;

        if cdr.is_nil() {
            // Single-element list (a) -> Call { function: a, args: [] }
            return Ok(ASTNode::Call {
                function: Box::new(car),
                args: vec![],
            });
        } else if cdr.is_cons() {
            // Multi-element list (a b c) -> Call { function: a, args: [b, c] }
            let mut args = Vec::new();
            let mut current = cdr;
            while current.is_cons() {
                let cdr_ptr = current.as_cons_ptr().ok_or("Invalid cons")?;
                let cdr_cons = unsafe { &*cdr_ptr };
                args.push(lisp_to_ast_as_data(cdr_cons.car())?);
                current = cdr_cons.cdr();
            }
            if !current.is_nil() {
                // Dotted pair at end - use DottedPair representation
                // Actually, we need to handle this differently for improper lists
                // For now, just add the final element to args (this may need refinement)
                args.push(lisp_to_ast_as_data(current)?);
            }
            return Ok(ASTNode::Call {
                function: Box::new(car),
                args,
            });
        } else {
            // Dotted pair
            return Ok(ASTNode::DottedPair {
                car: Box::new(car),
                cdr: Box::new(lisp_to_ast_as_data(cdr)?),
            });
        }
    }

    // Fallback - treat as nil
    Ok(ASTNode::nil())
}

fn cdr_to_vec(mut cdr: LispObject) -> Result<Vec<ASTNode>, String> {
    let mut result = Vec::new();

    while cdr.is_cons() {
        let cons_ptr = cdr.as_cons_ptr().ok_or("Invalid cons pointer")?;
        if cons_ptr.is_null() {
            return Err("Null cons pointer in cdr_to_vec".to_string());
        }
        let cons = unsafe { &*cons_ptr };
        result.push(lisp_to_ast(cons.car())?);
        cdr = cons.cdr();
    }

    // Handle dotted pair
    if !cdr.is_nil() {
        // For now, just append the dotted tail as the last element
        // This flattens (a b . c) to [a, b, c]
        result.push(lisp_to_ast(cdr)?);
    }

    Ok(result)
}

/// Get raw LispObjects from a cons list without converting to AST
/// Used for handling forms like case where keys should be treated as data
fn raw_cdr_to_vec(mut cdr: LispObject) -> Result<Vec<LispObject>, String> {
    let mut result = Vec::new();

    while cdr.is_cons() {
        let cons_ptr = cdr.as_cons_ptr().ok_or("Invalid cons pointer")?;
        if cons_ptr.is_null() {
            return Err("Null cons pointer in raw_cdr_to_vec".to_string());
        }
        let cons = unsafe { &*cons_ptr };
        result.push(cons.car());
        cdr = cons.cdr();
    }

    Ok(result)
}

/// Convert a case key (which can be a symbol, list of symbols, T, or OTHERWISE) to a test expression
fn case_key_to_test(key_obj: &LispObject, tmp_var: &str) -> Result<ASTNode, String> {
    // Check if it's a symbol
    if let Some(sym_ptr) = key_obj.as_general_ptr::<rlasp_runtime::Symbol>() {
        let sym = unsafe { &*sym_ptr };
        let name = sym.name().to_uppercase();
        if name == "T" || name == "OTHERWISE" {
            // Default case - always matches
            return Ok(ASTNode::t());
        } else {
            // Single key - (eql tmp 'key)
            return Ok(ASTNode::call(
                ASTNode::variable("eql"),
                vec![
                    ASTNode::variable(tmp_var),
                    ASTNode::Quote(Box::new(ASTNode::variable(&name)))
                ]
            ));
        }
    }

    // Check if it's a list of keys
    if key_obj.is_cons() {
        let cons_ptr = key_obj.as_cons_ptr().ok_or("Invalid cons")?;
        let cons = unsafe { &*cons_ptr };
        let first_key = cons.car();
        // Get the rest of the keys from the cdr
        let keys = raw_cdr_to_vec(cons.cdr())?;

        // Build (or (eql tmp 'key1) (eql tmp 'key2) ...)
        let mut tests = Vec::new();

        // First key
        if let Some(sym_ptr) = first_key.as_general_ptr::<rlasp_runtime::Symbol>() {
            let sym = unsafe { &*sym_ptr };
            let name = sym.name().to_uppercase();
            tests.push(ASTNode::call(
                ASTNode::variable("eql"),
                vec![
                    ASTNode::variable(tmp_var),
                    ASTNode::Quote(Box::new(ASTNode::variable(&name)))
                ]
            ));
        }

        // Rest of keys
        for key in &keys {
            if let Some(sym_ptr) = key.as_general_ptr::<rlasp_runtime::Symbol>() {
                let sym = unsafe { &*sym_ptr };
                let name = sym.name().to_uppercase();
                tests.push(ASTNode::call(
                    ASTNode::variable("eql"),
                    vec![
                        ASTNode::variable(tmp_var),
                        ASTNode::Quote(Box::new(ASTNode::variable(&name)))
                    ]
                ));
            }
        }

        if tests.is_empty() {
            return Ok(ASTNode::nil());
        } else if tests.len() == 1 {
            return Ok(tests.into_iter().next().unwrap());
        } else {
            // (or test1 test2 ...)
            return Ok(ASTNode::Call {
                function: Box::new(ASTNode::variable("or")),
                args: tests,
            });
        }
    }

    // Unknown key type - just return nil (won't match)
    Ok(ASTNode::nil())
}

/// Extract macrolet bindings: ((name (params...) body...) ...)
fn extract_macrolet_bindings(ast: &ASTNode) -> Result<Vec<(String, Vec<String>, ASTNode)>, String> {
    match ast {
        ASTNode::Constant(ConstantValue::Nil) => Ok(vec![]),
        ASTNode::Call { function, args } => {
            let mut bindings = vec![];

            // Process first binding
            if let ASTNode::Call { function: name_node, args: def_parts } = &**function {
                if let ASTNode::Variable(name) = &**name_node {
                    if def_parts.len() >= 2 {
                        let params = extract_params(&def_parts[0]);
                        let body = if def_parts.len() > 2 {
                            ASTNode::Progn { exprs: def_parts[1..].to_vec() }
                        } else {
                            def_parts[1].clone()
                        };
                        bindings.push((name.clone(), params, body));
                    }
                }
            }

            // Process remaining bindings
            for arg in args {
                if let ASTNode::Call { function: name_node, args: def_parts } = arg {
                    if let ASTNode::Variable(name) = &**name_node {
                        if def_parts.len() >= 2 {
                            let params = extract_params(&def_parts[0]);
                            let body = if def_parts.len() > 2 {
                                ASTNode::Progn { exprs: def_parts[1..].to_vec() }
                            } else {
                                def_parts[1].clone()
                            };
                            bindings.push((name.clone(), params, body));
                        }
                    }
                }
            }

            Ok(bindings)
        }
        _ => Err("Invalid macrolet bindings".to_string()),
    }
}

/// Substitute parameters in a backquoted form
fn substitute_in_ast(ast: &ASTNode, substitutions: &std::collections::HashMap<String, ASTNode>) -> ASTNode {
    match ast {
        ASTNode::Variable(name) => {
            substitutions.get(name).cloned().unwrap_or_else(|| ast.clone())
        }
        ASTNode::Unquote(inner) => {
            // In unquote, we evaluate the substitution
            ASTNode::Unquote(Box::new(substitute_in_ast(inner, substitutions)))
        }
        ASTNode::UnquoteSplicing(inner) => {
            ASTNode::UnquoteSplicing(Box::new(substitute_in_ast(inner, substitutions)))
        }
        ASTNode::Backquote(inner) => {
            ASTNode::Backquote(Box::new(substitute_in_ast(inner, substitutions)))
        }
        ASTNode::Call { function, args } => {
            ASTNode::Call {
                function: Box::new(substitute_in_ast(function, substitutions)),
                args: args.iter().map(|a| substitute_in_ast(a, substitutions)).collect(),
            }
        }
        ASTNode::If { test, then_branch, else_branch } => {
            ASTNode::If {
                test: Box::new(substitute_in_ast(test, substitutions)),
                then_branch: Box::new(substitute_in_ast(then_branch, substitutions)),
                else_branch: Box::new(substitute_in_ast(else_branch, substitutions)),
            }
        }
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(|e| substitute_in_ast(e, substitutions)).collect(),
            }
        }
        ASTNode::Quote(inner) => {
            // Don't substitute inside quotes
            ASTNode::Quote(inner.clone())
        }
        _ => ast.clone(),
    }
}

/// Expand a macrolet call by substituting parameters and expanding backquote
fn expand_macrolet_call(
    macro_params: &[String],
    macro_body: &ASTNode,
    call_args: &[ASTNode],
) -> Result<ASTNode, String> {
    let substitutions = bind_macro_params(macro_params, call_args)?;

    // Substitute parameters in the macro body
    let substituted = substitute_in_ast(macro_body, &substitutions);

    // Expand backquote if present
    Ok(expand_backquote_ast(&substituted))
}

/// Parse macro lambda list and bind arguments to parameters
/// Handles &optional, &rest, &body, &key, &allow-other-keys, &whole, &environment
fn bind_macro_params(
    macro_params: &[String],
    call_args: &[ASTNode],
) -> Result<std::collections::HashMap<String, ASTNode>, String> {
    let mut substitutions = std::collections::HashMap::new();
    let mut arg_idx = 0;
    let mut param_idx = 0;

    // Possible states: Required, Optional, Rest, Key
    #[derive(PartialEq, Clone, Copy)]
    enum ParamState {
        Required,
        Optional,
        Rest,
        Key,
    }
    let mut state = ParamState::Required;
    #[allow(unused_variables)]
    let mut seen_whole = false;
    #[allow(unused_variables)]
    let mut allow_other_keys = false;

    while param_idx < macro_params.len() {
        let param = &macro_params[param_idx];

        match param.as_str() {
            "&whole" => {
                // &whole var binds the entire macro call form as a list
                param_idx += 1;
                if param_idx >= macro_params.len() {
                    return Err("&whole requires a parameter name".to_string());
                }
                let whole_name = &macro_params[param_idx];
                // Create a list from all the call args
                let whole_list = args_to_list_ast(call_args);
                substitutions.insert(whole_name.clone(), whole_list);
                seen_whole = true;
                param_idx += 1;
            }
            "&environment" => {
                // &environment var binds the macro expansion environment
                param_idx += 1;
                if param_idx >= macro_params.len() {
                    return Err("&environment requires a parameter name".to_string());
                }
                let env_name = &macro_params[param_idx];
                // For now, bind to nil (we don't have a real environment object)
                substitutions.insert(env_name.clone(), ASTNode::nil());
                param_idx += 1;
            }
            "&optional" => {
                state = ParamState::Optional;
                param_idx += 1;
            }
            "&rest" | "&body" => {
                state = ParamState::Rest;
                param_idx += 1;
                if param_idx >= macro_params.len() {
                    return Err(format!("{} requires a parameter name", param));
                }
                let rest_name = &macro_params[param_idx];
                // Bind remaining args as a list
                let rest_args = if arg_idx < call_args.len() {
                    args_to_list_ast(&call_args[arg_idx..])
                } else {
                    ASTNode::nil()
                };
                substitutions.insert(rest_name.clone(), rest_args);
                arg_idx = call_args.len(); // Consume all remaining args
                param_idx += 1;
            }
            "&key" => {
                state = ParamState::Key;
                param_idx += 1;
            }
            "&allow-other-keys" => {
                allow_other_keys = true;
                param_idx += 1;
            }
            "&aux" => {
                // &aux introduces auxiliary variables, not bound from args
                // Skip all remaining params (they're aux bindings)
                break;
            }
            _ => {
                match state {
                    ParamState::Required => {
                        if arg_idx < call_args.len() {
                            substitutions.insert(param.clone(), call_args[arg_idx].clone());
                            arg_idx += 1;
                        } else {
                            // Missing required arg - bind to nil to be lenient
                            substitutions.insert(param.clone(), ASTNode::nil());
                        }
                        param_idx += 1;
                    }
                    ParamState::Optional => {
                        if arg_idx < call_args.len() {
                            substitutions.insert(param.clone(), call_args[arg_idx].clone());
                            arg_idx += 1;
                        } else {
                            substitutions.insert(param.clone(), ASTNode::nil());
                        }
                        param_idx += 1;
                    }
                    ParamState::Rest => {
                        // Should not reach here - rest param consumed all args above
                        param_idx += 1;
                    }
                    ParamState::Key => {
                        // Look for :param-name in remaining args
                        let key_name = format!(":{}", param.to_uppercase());
                        let key_name_lower = format!(":{}", param);
                        let mut found = false;
                        let mut i = arg_idx;
                        while i + 1 < call_args.len() {
                            if let ASTNode::Variable(k) = &call_args[i] {
                                if k == &key_name || k == &key_name_lower || k.to_uppercase() == key_name {
                                    substitutions.insert(param.clone(), call_args[i + 1].clone());
                                    found = true;
                                    break;
                                }
                            }
                            i += 2;
                        }
                        if !found {
                            substitutions.insert(param.clone(), ASTNode::nil());
                        }
                        param_idx += 1;
                    }
                }
            }
        }
    }

    Ok(substitutions)
}

/// Convert a slice of ASTNodes to a list AST representation for macro parameter binding
/// The result is a list structure that can be used directly in the macro body
fn args_to_list_ast(args: &[ASTNode]) -> ASTNode {
    if args.is_empty() {
        ASTNode::nil()
    } else {
        // Build a list call: (list 'arg1 'arg2 ...)
        // Each arg is quoted so it's treated as data, not code
        let mut quoted_args = Vec::new();
        for arg in args {
            quoted_args.push(ASTNode::Quote(Box::new(arg.clone())));
        }
        ASTNode::Call {
            function: Box::new(ASTNode::Variable("list".to_string())),
            args: quoted_args,
        }
    }
}

/// Expand backquote at compile time (simplified version)
fn expand_backquote_ast(ast: &ASTNode) -> ASTNode {
    match ast {
        ASTNode::Backquote(inner) => expand_backquote_inner(inner),
        ASTNode::Progn { exprs } => {
            ASTNode::Progn {
                exprs: exprs.iter().map(expand_backquote_ast).collect(),
            }
        }
        _ => ast.clone(),
    }
}

fn expand_backquote_inner(ast: &ASTNode) -> ASTNode {
    match ast {
        ASTNode::Unquote(inner) => {
            // Unquote just returns the inner value
            (**inner).clone()
        }
        ASTNode::Call { function, args } => {
            // Check if any args have unquote-splicing
            let mut expanded_args = Vec::new();
            for arg in args {
                match arg {
                    ASTNode::UnquoteSplicing(_) => {
                        // For now, just treat as unquote
                        expanded_args.push(expand_backquote_inner(arg));
                    }
                    ASTNode::Unquote(inner) => {
                        expanded_args.push((**inner).clone());
                    }
                    _ => {
                        expanded_args.push(expand_backquote_inner(arg));
                    }
                }
            }

            let expanded_func = match &**function {
                ASTNode::Unquote(inner) => (**inner).clone(),
                _ => expand_backquote_inner(function),
            };

            ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args,
            }
        }
        _ => ast.clone(),
    }
}

/// Recursively expand macrolet calls in an AST
fn expand_macrolet_in_ast(
    ast: &ASTNode,
    macros: &[(String, Vec<String>, ASTNode)],
) -> Result<ASTNode, String> {
    match ast {
        ASTNode::Call { function, args } => {
            // Check if this is a macro call
            if let ASTNode::Variable(name) = &**function {
                for (macro_name, params, body) in macros {
                    if macro_name == name {
                        // Expand this macro call
                        return expand_macrolet_call(params, body, args);
                    }
                }
            }

            // Not a macro call, recursively expand in function and args
            let expanded_func = expand_macrolet_in_ast(function, macros)?;
            let expanded_args: Result<Vec<ASTNode>, String> = args.iter()
                .map(|a| expand_macrolet_in_ast(a, macros))
                .collect();
            Ok(ASTNode::Call {
                function: Box::new(expanded_func),
                args: expanded_args?,
            })
        }
        ASTNode::If { test, then_branch, else_branch } => {
            Ok(ASTNode::If {
                test: Box::new(expand_macrolet_in_ast(test, macros)?),
                then_branch: Box::new(expand_macrolet_in_ast(then_branch, macros)?),
                else_branch: Box::new(expand_macrolet_in_ast(else_branch, macros)?),
            })
        }
        ASTNode::Progn { exprs } => {
            let expanded: Result<Vec<ASTNode>, String> = exprs.iter()
                .map(|e| expand_macrolet_in_ast(e, macros))
                .collect();
            Ok(ASTNode::Progn { exprs: expanded? })
        }
        ASTNode::Let { bindings, body } => {
            let expanded_bindings: Result<Vec<(String, ASTNode)>, String> = bindings.iter()
                .map(|(name, val)| Ok((name.clone(), expand_macrolet_in_ast(val, macros)?)))
                .collect();
            let expanded_body: Result<Vec<ASTNode>, String> = body.iter()
                .map(|e| expand_macrolet_in_ast(e, macros))
                .collect();
            Ok(ASTNode::Let {
                bindings: expanded_bindings?,
                body: expanded_body?,
            })
        }
        _ => Ok(ast.clone()),
    }
}
