//! Macro definition storage and lookup

use rlasp_runtime::LispObject;
use dashmap::DashMap;
use std::sync::Arc;

/// A macro expander function
pub type MacroExpander = Arc<dyn Fn(&[LispObject]) -> Result<LispObject, String> + Send + Sync>;

/// Macro definition
#[derive(Clone)]
pub struct MacroDef {
    pub name: String,
    pub expander: MacroExpander,
}

/// Thread-safe macro table
pub struct MacroTable {
    macros: DashMap<String, MacroDef>,
}

impl MacroTable {
    /// Create a new macro table
    pub fn new() -> Self {
        MacroTable {
            macros: DashMap::new(),
        }
    }
    
    /// Define a macro
    pub fn define_macro(&self, name: impl Into<String>, expander: MacroExpander) {
        let name = name.into();
        self.macros.insert(name.clone(), MacroDef {
            name: name.clone(),
            expander,
        });
    }
    
    /// Look up a macro
    pub fn get_macro(&self, name: &str) -> Option<MacroDef> {
        self.macros.get(name).map(|entry| entry.value().clone())
    }
    
    /// Check if a name is a macro
    pub fn is_macro(&self, name: &str) -> bool {
        self.macros.contains_key(name)
    }
    
    /// Bootstrap core macros
    pub fn bootstrap(&self) {
        // Define core macros
        
        // defun - (defun name (params) body...) => (setq name (lambda (params) body...))
        self.define_macro("defun", Arc::new(|args| {
            if args.len() < 3 {
                return Err("defun requires at least 3 arguments: name, params, body".to_string());
            }
            
            let name = args[0];
            let params = args[1];
            let body = &args[2..];
            
            // Build (setq name (lambda params body...))
            use rlasp_runtime::{Symbol, Cons};
            
            let setq_sym = Symbol::allocate("setq");
            let lambda_sym = Symbol::allocate("lambda");
            
            // Build lambda expression
            let mut lambda_parts = vec![lambda_sym, params];
            lambda_parts.extend_from_slice(body);
            let lambda_expr = Cons::list(&lambda_parts);
            
            // Build setq expression
            let result = Cons::list(&[setq_sym, name, lambda_expr]);
            Ok(result)
        }));
        
        // and - (and) => t, (and x) => x, (and x y) => (if x y nil)
        self.define_macro("and", Arc::new(|args| {
            use rlasp_runtime::{Symbol, Cons, LispObject};
            
            match args.len() {
                0 => Ok(Symbol::allocate("t")),  // (and) => t
                1 => Ok(args[0]),  // (and x) => x
                _ => {
                    // (and x y z...) => (if x (and y z...) nil)
                    let if_sym = Symbol::allocate("if");
                    let and_sym = Symbol::allocate("and");
                    
                    let rest = &args[1..];
                    let rest_and = if rest.len() == 1 {
                        rest[0]
                    } else {
                        let mut and_parts = vec![and_sym];
                        and_parts.extend_from_slice(rest);
                        Cons::list(&and_parts)
                    };
                    
                    let result = Cons::list(&[if_sym, args[0], rest_and, LispObject::nil()]);
                    Ok(result)
                }
            }
        }));
        
        // or - (or) => nil, (or x) => x, (or x y) => (if x x y)
        self.define_macro("or", Arc::new(|args| {
            use rlasp_runtime::{Symbol, Cons, LispObject};
            
            match args.len() {
                0 => Ok(LispObject::nil()),  // (or) => nil
                1 => Ok(args[0]),  // (or x) => x
                _ => {
                    // (or x y z...) => (if x x (or y z...))
                    let if_sym = Symbol::allocate("if");
                    let or_sym = Symbol::allocate("or");
                    
                    let rest = &args[1..];
                    let rest_or = if rest.len() == 1 {
                        rest[0]
                    } else {
                        let mut or_parts = vec![or_sym];
                        or_parts.extend_from_slice(rest);
                        Cons::list(&or_parts)
                    };
                    
                    let result = Cons::list(&[if_sym, args[0], args[0], rest_or]);
                    Ok(result)
                }
            }
        }));
        
        // when - (when test body...) => (if test (progn body...))
        self.define_macro("when", Arc::new(|args| {
            if args.is_empty() {
                return Err("when requires at least 1 argument".to_string());
            }
            
            use rlasp_runtime::{Symbol, Cons};
            
            let if_sym = Symbol::allocate("if");
            let progn_sym = Symbol::allocate("progn");
            
            let test = args[0];
            let body = &args[1..];
            
            let progn_expr = if body.len() == 1 {
                body[0]
            } else {
                let mut progn_parts = vec![progn_sym];
                progn_parts.extend_from_slice(body);
                Cons::list(&progn_parts)
            };
            
            let result = Cons::list(&[if_sym, test, progn_expr]);
            Ok(result)
        }));
        
        // unless - (unless test body...) => (if test nil (progn body...))
        self.define_macro("unless", Arc::new(|args| {
            if args.is_empty() {
                return Err("unless requires at least 1 argument".to_string());
            }
            
            use rlasp_runtime::{Symbol, Cons, LispObject};
            
            let if_sym = Symbol::allocate("if");
            let progn_sym = Symbol::allocate("progn");
            
            let test = args[0];
            let body = &args[1..];
            
            let progn_expr = if body.len() == 1 {
                body[0]
            } else {
                let mut progn_parts = vec![progn_sym];
                progn_parts.extend_from_slice(body);
                Cons::list(&progn_parts)
            };
            
            let result = Cons::list(&[if_sym, test, LispObject::nil(), progn_expr]);
            Ok(result)
        }));

        // cond - (cond (test1 result1) (test2 result2) ...) => nested ifs
        self.define_macro("cond", Arc::new(|args| {
            use rlasp_runtime::{Symbol, Cons, LispObject};

            if args.is_empty() {
                return Ok(LispObject::nil());
            }

            // Process clauses from last to first to build nested ifs
            let mut result = LispObject::nil();

            for clause in args.iter().rev() {
                if !clause.is_cons() {
                    return Err("cond clauses must be lists".to_string());
                }

                let clause_cons = unsafe { &*clause.as_cons_ptr().unwrap() };
                let test = clause_cons.car();
                let body = clause_cons.cdr();

                // Extract body expressions
                let body_expr = if body.is_nil() {
                    LispObject::nil()
                } else if body.is_cons() {
                    let body_cons = unsafe { &*body.as_cons_ptr().unwrap() };
                    let first_body = body_cons.car();
                    let rest_body = body_cons.cdr();

                    if rest_body.is_nil() {
                        // Single expression
                        first_body
                    } else {
                        // Multiple expressions - wrap in progn
                        let progn_sym = Symbol::allocate("progn");
                        let body_list = unsafe { &*body.as_cons_ptr().unwrap() };
                        let body_vec = body_list.to_vec().unwrap_or_default();
                        let mut progn_parts = vec![progn_sym];
                        progn_parts.extend(body_vec);
                        Cons::list(&progn_parts)
                    }
                } else {
                    return Err("Invalid cond clause body".to_string());
                };

                // Build (if test body_expr previous_result)
                let if_sym = Symbol::allocate("if");
                result = Cons::list(&[if_sym, test, body_expr, result]);
            }

            Ok(result)
        }));
    }
}

impl Default for MacroTable {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rlasp_reader::read_from_string;
    
    #[test]
    fn test_defun_macro() {
        let table = MacroTable::new();
        table.bootstrap();
        
        // Test defun expansion
        let expr = read_from_string("(defun factorial (n) (* n (factorial (- n 1))))").unwrap();
        
        // Extract macro arguments
        if let Some(cons_ptr) = expr.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let args_list = cons.cdr();
            if let Some(args_cons) = args_list.as_cons_ptr() {
                let args = unsafe { &*args_cons }.to_vec().unwrap();
                
                let macro_def = table.get_macro("defun").unwrap();
                let expanded = (macro_def.expander)(&args).unwrap();
                
                // Should expand to (setq factorial (lambda (n) ...))
                assert!(expanded.is_cons());
            }
        }
    }
    
    #[test]
    fn test_and_macro() {
        let table = MacroTable::new();
        table.bootstrap();
        
        let macro_def = table.get_macro("and").unwrap();
        
        // (and) => t
        let result = (macro_def.expander)(&[]).unwrap();
        assert!(result.is_general());  // t is a symbol
        
        // (and x) => x
        let x = read_from_string("x").unwrap();
        let result = (macro_def.expander)(&[x]).unwrap();
        assert_eq!(result, x);
    }
    
    #[test]
    fn test_when_macro() {
        let table = MacroTable::new();
        table.bootstrap();
        
        let test_expr = read_from_string("t").unwrap();
        let body_expr = read_from_string("42").unwrap();
        
        let macro_def = table.get_macro("when").unwrap();
        let expanded = (macro_def.expander)(&[test_expr, body_expr]).unwrap();
        
        // Should expand to (if t 42)
        assert!(expanded.is_cons());
    }
}
