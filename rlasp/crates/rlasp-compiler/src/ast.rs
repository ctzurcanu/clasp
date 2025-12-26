//! Abstract Syntax Tree for Common Lisp
//!
//! Represents all Common Lisp special forms and expressions

use rlasp_runtime::LispObject;

/// AST node representing a Lisp expression
#[derive(Debug, Clone, PartialEq)]
pub enum Ast {
    // Literals
    Constant(LispObject),
    
    // Variables
    Variable(String),
    
    // Special forms
    Quote(Box<Ast>),
    If {
        test: Box<Ast>,
        then: Box<Ast>,
        else_: Option<Box<Ast>>,
    },
    Progn(Vec<Ast>),
    Let {
        bindings: Vec<(String, Ast)>,
        body: Vec<Ast>,
    },
    LetStar {
        bindings: Vec<(String, Ast)>,
        body: Vec<Ast>,
    },
    Flet {
        functions: Vec<FunctionDef>,
        body: Vec<Ast>,
    },
    Labels {
        functions: Vec<FunctionDef>,
        body: Vec<Ast>,
    },
    Lambda {
        params: LambdaList,
        body: Vec<Ast>,
    },
    Setq {
        var: String,
        value: Box<Ast>,
    },
    Function(Box<Ast>),
    
    // Control flow
    Block {
        name: String,
        body: Vec<Ast>,
    },
    ReturnFrom {
        name: String,
        value: Option<Box<Ast>>,
    },
    Tagbody {
        tags: Vec<TagbodyForm>,
    },
    Go(String),
    
    // Exception handling
    Catch {
        tag: Box<Ast>,
        body: Vec<Ast>,
    },
    Throw {
        tag: Box<Ast>,
        value: Box<Ast>,
    },
    UnwindProtect {
        protected: Box<Ast>,
        cleanup: Vec<Ast>,
    },
    
    // Multiple values
    MultipleValueCall {
        function: Box<Ast>,
        args: Vec<Ast>,
    },
    MultipleValueProg1 {
        first: Box<Ast>,
        forms: Vec<Ast>,
    },
    
    // Function application
    Call {
        function: Box<Ast>,
        args: Vec<Ast>,
    },
    
    // Macros (during expansion)
    MacroCall {
        name: String,
        args: Vec<Ast>,
    },
}

/// Lambda list (function parameters)
#[derive(Debug, Clone, PartialEq)]
pub struct LambdaList {
    pub required: Vec<String>,
    pub optional: Vec<(String, Option<Ast>)>,  // (name, default-value)
    pub rest: Option<String>,
    pub key: Vec<(String, Option<Ast>)>,  // (name, default-value)
    pub allow_other_keys: bool,
}

impl LambdaList {
    pub fn new() -> Self {
        LambdaList {
            required: Vec::new(),
            optional: Vec::new(),
            rest: None,
            key: Vec::new(),
            allow_other_keys: false,
        }
    }
    
    pub fn simple(params: Vec<String>) -> Self {
        LambdaList {
            required: params,
            optional: Vec::new(),
            rest: None,
            key: Vec::new(),
            allow_other_keys: false,
        }
    }
}

impl Default for LambdaList {
    fn default() -> Self {
        Self::new()
    }
}

/// Function definition (for flet/labels)
#[derive(Debug, Clone, PartialEq)]
pub struct FunctionDef {
    pub name: String,
    pub params: LambdaList,
    pub body: Vec<Ast>,
}

/// Tagbody form (either a tag or an expression)
#[derive(Debug, Clone, PartialEq)]
pub enum TagbodyForm {
    Tag(String),
    Form(Ast),
}

impl Ast {
    /// Helper to extract symbol name from LispObject
    fn get_symbol_name(obj: LispObject) -> Option<String> {
        if !obj.is_general() {
            return None;
        }

        // Assume general objects are symbols for now
        // TODO: Add type checking when we have runtime type info
        let symbol_ptr = obj.as_general_ptr::<rlasp_runtime::Symbol>()?;
        let symbol = unsafe { &*symbol_ptr };
        Some(symbol.name().to_string())
    }

    /// Convert LispObject to AST
    pub fn from_lisp(obj: LispObject) -> Result<Self, String> {
        // Immediate values
        if obj.is_fixnum() {
            return Ok(Ast::Constant(obj));
        }

        if obj.is_character() {
            return Ok(Ast::Constant(obj));
        }

        if obj.is_nil() {
            return Ok(Ast::Constant(obj));
        }

        // Symbols are variables
        if obj.is_general() {
            let name = Self::get_symbol_name(obj)
                .ok_or_else(|| "Cannot extract symbol name".to_string())?;
            return Ok(Ast::Variable(name));
        }
        
        // Lists - could be special forms or function calls
        if obj.is_cons() {
            let cons_ptr = obj.as_cons_ptr().unwrap();
            let cons = unsafe { &*cons_ptr };
            let car = cons.car();

            // Check if car is a symbol (special form or function name)
            if car.is_general() {
                let name = Self::get_symbol_name(car)
                    .ok_or_else(|| "Cannot extract operator name".to_string())?;

                // Handle special forms
                match name.as_str() {
                    "quote" => {
                        let args = Self::list_to_vec(cons.cdr())?;
                        if args.len() != 1 {
                            return Err("quote requires exactly 1 argument".to_string());
                        }
                        return Ok(Ast::Quote(Box::new(Ast::Constant(args[0]))));
                    }
                    "if" => {
                        let args = Self::list_to_vec(cons.cdr())?;
                        if args.len() < 2 || args.len() > 3 {
                            return Err("if requires 2 or 3 arguments".to_string());
                        }
                        return Ok(Ast::If {
                            test: Box::new(Self::from_lisp(args[0])?),
                            then: Box::new(Self::from_lisp(args[1])?),
                            else_: if args.len() == 3 {
                                Some(Box::new(Self::from_lisp(args[2])?))
                            } else {
                                None
                            },
                        });
                    }
                    "progn" => {
                        let args = Self::list_to_vec(cons.cdr())?;
                        let forms: Result<Vec<_>, _> = args.iter()
                            .map(|&a| Self::from_lisp(a))
                            .collect();
                        return Ok(Ast::Progn(forms?));
                    }
                    _ => {
                        // Function call
                        let args = Self::list_to_vec(cons.cdr())?;
                        let arg_asts: Result<Vec<_>, _> = args.iter()
                            .map(|&a| Self::from_lisp(a))
                            .collect();
                        return Ok(Ast::Call {
                            function: Box::new(Ast::Variable(name)),
                            args: arg_asts?,
                        });
                    }
                }
            }
        }
        
        Err(format!("Cannot convert to AST: {}", obj))
    }
    
    /// Helper to convert a Lisp list to a Vec of LispObjects
    fn list_to_vec(obj: LispObject) -> Result<Vec<LispObject>, String> {
        if obj.is_nil() {
            return Ok(Vec::new());
        }
        
        if let Some(cons_ptr) = obj.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            if let Some(vec) = cons.to_vec() {
                return Ok(vec);
            }
        }
        
        Err("Not a proper list".to_string())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rlasp_reader::read_from_string;
    
    #[test]
    fn test_constant() {
        let obj = read_from_string("42").unwrap();
        let ast = Ast::from_lisp(obj).unwrap();
        assert!(matches!(ast, Ast::Constant(_)));
    }
    
    #[test]
    fn test_variable() {
        let obj = read_from_string("x").unwrap();
        let ast = Ast::from_lisp(obj).unwrap();
        assert!(matches!(ast, Ast::Variable(_)));
    }
    
    #[test]
    fn test_quote() {
        let obj = read_from_string("(quote x)").unwrap();
        let ast = Ast::from_lisp(obj).unwrap();
        assert!(matches!(ast, Ast::Quote(_)));
    }
    
    #[test]
    fn test_if() {
        let obj = read_from_string("(if t 1 2)").unwrap();
        let ast = Ast::from_lisp(obj).unwrap();
        assert!(matches!(ast, Ast::If { .. }));
    }
    
    #[test]
    fn test_progn() {
        let obj = read_from_string("(progn 1 2 3)").unwrap();
        let ast = Ast::from_lisp(obj).unwrap();
        if let Ast::Progn(forms) = ast {
            assert_eq!(forms.len(), 3);
        } else {
            panic!("Expected Progn");
        }
    }
    
    #[test]
    fn test_call() {
        let obj = read_from_string("(+ 1 2)").unwrap();
        let ast = Ast::from_lisp(obj).unwrap();
        if let Ast::Call { function, args } = ast {
            assert!(matches!(*function, Ast::Variable(_)));
            assert_eq!(args.len(), 2);
        } else {
            panic!("Expected Call");
        }
    }
}
