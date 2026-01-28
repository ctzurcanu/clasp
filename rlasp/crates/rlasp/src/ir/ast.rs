/// AST - Abstract Syntax Tree for Lisp expressions
///
/// Simple AST that will be lowered to BIR

use super::datum::ConstantValue;

/// AST node
#[derive(Debug, Clone)]
pub enum ASTNode {
    // === Literals ===
    Constant(ConstantValue),

    // === Variables ===
    /// Variable reference
    Variable(String),

    // === Function application ===
    /// Function call: (fn arg1 arg2 ...)
    Call {
        function: Box<ASTNode>,
        args: Vec<ASTNode>,
    },

    // === Special forms ===
    /// If: (if test then else)
    If {
        test: Box<ASTNode>,
        then_branch: Box<ASTNode>,
        else_branch: Box<ASTNode>,
    },

    /// Cond: (cond (test1 result1) (test2 result2) ...)
    Cond {
        clauses: Vec<(ASTNode, ASTNode)>,  // (test, result) pairs
    },

    /// Lambda: (lambda (args) body)
    Lambda {
        params: Vec<String>,
        defaults: std::collections::HashMap<String, ASTNode>,  // Default values for params
        supplied_p_vars: std::collections::HashMap<String, String>,  // Maps param -> supplied-p var
        body: Vec<ASTNode>,
    },

    /// Macro: user-defined macro
    Macro {
        params: Box<ASTNode>,
        body: Vec<ASTNode>,
    },

    /// Let: (let ((var val) ...) body)
    Let {
        bindings: Vec<(String, ASTNode)>,
        body: Vec<ASTNode>,
    },

    /// Dotimes: (dotimes (var count [result]) body)
    Dotimes {
        var: String,
        count: Box<ASTNode>,
        result: Option<Box<ASTNode>>,
        body: Vec<ASTNode>,
    },

    /// Dolist: (dolist (var list [result]) body)
    Dolist {
        var: String,
        list: Box<ASTNode>,
        result: Option<Box<ASTNode>>,
        body: Vec<ASTNode>,
    },

    /// Loop: loop macro with iteration and accumulation
    /// Supports: (loop for var from start below limit [when condition] sum/collect expr [else sum/collect expr])
    Loop {
        var: String,
        start: Option<Box<ASTNode>>,      // from value
        limit: Box<ASTNode>,               // below value
        when_condition: Option<Box<ASTNode>>, // when/unless/if condition
        collect: Option<Box<ASTNode>>,     // collect expression
        sum: Option<Box<ASTNode>>,         // sum expression
        else_collect: Option<Box<ASTNode>>, // else collect expression
        else_sum: Option<Box<ASTNode>>,    // else sum expression
    },

    /// Let*: (let* ((var val) ...) body)
    LetStar {
        bindings: Vec<(String, ASTNode)>,
        body: Vec<ASTNode>,
    },

    /// Setq: (setq var val)
    Setq {
        var: String,
        value: Box<ASTNode>,
    },

    /// Progn: (progn expr1 expr2 ...)
    Progn {
        exprs: Vec<ASTNode>,
    },

    /// Block: (block name body...)
    Block {
        name: Option<String>,
        body: Vec<ASTNode>,
    },

    /// Return-from: (return-from block-name value)
    ReturnFrom {
        block_name: Option<String>,
        value: Option<Box<ASTNode>>,
    },

    /// Quote: (quote form)
    Quote(Box<ASTNode>),

    /// Dotted pair: (car . cdr) - used for quoted dotted pairs
    DottedPair {
        car: Box<ASTNode>,
        cdr: Box<ASTNode>,
    },

    /// Backquote/Quasiquote: `form
    Backquote(Box<ASTNode>),

    /// Unquote: ,form (inside backquote)
    Unquote(Box<ASTNode>),

    /// Unquote-splicing: ,@form (inside backquote)
    UnquoteSplicing(Box<ASTNode>),

    // === FFI nodes ===
    /// C function call (from our FFI)
    CCall {
        function: String,
        args: Vec<ASTNode>,
    },

    /// C++ method call
    CppMethodCall {
        object: Box<ASTNode>,
        method: String,
        args: Vec<ASTNode>,
    },

    /// Hash table: stores key-value pairs
    HashTable {
        entries: Vec<(ASTNode, ASTNode)>,
    },

    /// Vector: #(elem1 elem2 ...)
    Vector(Vec<ASTNode>),

    // === CLOS (Common Lisp Object System) ===
    /// Define a class: (defclass name (superclasses...) (slots...) options...)
    Defclass {
        name: String,
        superclasses: Vec<String>,
        slots: Vec<SlotSpec>,
    },

    /// Define a generic function: (defgeneric name lambda-list)
    Defgeneric {
        name: String,
        lambda_list: Vec<String>,
    },

    /// Define a method: (defmethod name [:qualifier] (specialized-lambda-list) body...)
    Defmethod {
        generic_name: String,
        qualifier: Option<String>,  // :before, :after, :around, or None for primary
        specializers: Vec<String>,  // Class names or T for unspecialized
        params: Vec<String>,  // Parameter names
        body: Vec<ASTNode>,
    },
}

/// Slot specification for defclass
#[derive(Debug, Clone)]
pub struct SlotSpec {
    pub name: String,
    pub initarg: Option<String>,
    pub initform: Option<Box<ASTNode>>,
    pub accessor: Option<String>,
    pub reader: Option<String>,
    pub writer: Option<String>,
}

impl ASTNode {
    /// Check if this is a constant
    pub fn is_constant(&self) -> bool {
        matches!(self, ASTNode::Constant(_))
    }

    /// Check if this is a variable reference
    pub fn is_variable(&self) -> bool {
        matches!(self, ASTNode::Variable(_))
    }

    /// Get constant value if this is a constant
    pub fn as_constant(&self) -> Option<&ConstantValue> {
        match self {
            ASTNode::Constant(c) => Some(c),
            _ => None,
        }
    }
}

// Helper constructors
impl ASTNode {
    pub fn fixnum(n: i64) -> Self {
        ASTNode::Constant(ConstantValue::Fixnum(n))
    }

    pub fn float(f: f64) -> Self {
        ASTNode::Constant(ConstantValue::Float(f))
    }

    pub fn character(c: char) -> Self {
        ASTNode::Constant(ConstantValue::Character(c))
    }

    pub fn nil() -> Self {
        ASTNode::Constant(ConstantValue::Nil)
    }

    pub fn t() -> Self {
        ASTNode::Constant(ConstantValue::T)
    }

    pub fn variable(name: impl Into<String>) -> Self {
        ASTNode::Variable(name.into())
    }

    pub fn call(function: ASTNode, args: Vec<ASTNode>) -> Self {
        ASTNode::Call {
            function: Box::new(function),
            args,
        }
    }

    pub fn lambda(params: Vec<String>, body: Vec<ASTNode>) -> Self {
        ASTNode::Lambda {
            params,
            defaults: std::collections::HashMap::new(),
            supplied_p_vars: std::collections::HashMap::new(),
            body,
        }
    }

    pub fn lambda_with_defaults(params: Vec<String>, defaults: std::collections::HashMap<String, ASTNode>, body: Vec<ASTNode>) -> Self {
        ASTNode::Lambda {
            params,
            defaults,
            supplied_p_vars: std::collections::HashMap::new(),
            body,
        }
    }

    pub fn lambda_with_supplied_p(params: Vec<String>, defaults: std::collections::HashMap<String, ASTNode>, supplied_p_vars: std::collections::HashMap<String, String>, body: Vec<ASTNode>) -> Self {
        ASTNode::Lambda {
            params,
            defaults,
            supplied_p_vars,
            body,
        }
    }

    pub fn if_then_else(test: ASTNode, then_branch: ASTNode, else_branch: ASTNode) -> Self {
        ASTNode::If {
            test: Box::new(test),
            then_branch: Box::new(then_branch),
            else_branch: Box::new(else_branch),
        }
    }

    pub fn let_bindings(bindings: Vec<(String, ASTNode)>, body: Vec<ASTNode>) -> Self {
        ASTNode::Let { bindings, body }
    }

    pub fn setq(var: impl Into<String>, value: ASTNode) -> Self {
        ASTNode::Setq {
            var: var.into(),
            value: Box::new(value),
        }
    }

    pub fn progn(exprs: Vec<ASTNode>) -> Self {
        ASTNode::Progn { exprs }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_constant_creation() {
        let ast = ASTNode::fixnum(42);
        assert!(ast.is_constant());
        assert_eq!(ast.as_constant(), Some(&ConstantValue::Fixnum(42)));
    }

    #[test]
    fn test_variable() {
        let ast = ASTNode::variable("x");
        assert!(ast.is_variable());
    }

    #[test]
    fn test_call() {
        let add = ASTNode::variable("+");
        let args = vec![ASTNode::fixnum(1), ASTNode::fixnum(2)];
        let call = ASTNode::call(add, args);

        match call {
            ASTNode::Call { function, args } => {
                assert!(function.is_variable());
                assert_eq!(args.len(), 2);
            }
            _ => panic!("Expected Call node"),
        }
    }

    #[test]
    fn test_if() {
        let test = ASTNode::variable("x");
        let then_branch = ASTNode::fixnum(1);
        let else_branch = ASTNode::fixnum(2);
        let if_node = ASTNode::if_then_else(test, then_branch, else_branch);

        match if_node {
            ASTNode::If { test, then_branch, else_branch } => {
                assert!(test.is_variable());
                assert!(then_branch.is_constant());
                assert!(else_branch.is_constant());
            }
            _ => panic!("Expected If node"),
        }
    }

    #[test]
    fn test_lambda() {
        let params = vec!["x".to_string(), "y".to_string()];
        let body = vec![ASTNode::variable("x")];
        let lambda = ASTNode::lambda(params.clone(), body);

        match lambda {
            ASTNode::Lambda { params: p, body } => {
                assert_eq!(p, params);
                assert_eq!(body.len(), 1);
            }
            _ => panic!("Expected Lambda node"),
        }
    }
}
