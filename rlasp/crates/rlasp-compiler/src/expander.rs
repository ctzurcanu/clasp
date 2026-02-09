//! Macro expansion engine

use crate::error::{CompilerError, CompilerResult};
use crate::macros::MacroTable;
use rlasp_runtime::LispObject;

/// Macro expander
pub struct Expander {
    macro_table: MacroTable,
}

impl Expander {
    /// Helper to extract symbol name from LispObject
    fn get_symbol_name(obj: LispObject) -> Option<String> {
        if !obj.is_general() {
            return None;
        }

        // Check if it's a number (using discriminant heuristic)
        if obj.is_number() {
            return None;
        }

        // MUST check type header before casting to Symbol
        // Other general objects (Vector, etc.) would crash if cast to Symbol
        let ptr = obj.as_general_ptr::<u8>()?;
        if ptr.is_null() {
            return None;
        }
        let obj_type = unsafe { rlasp_runtime::header::TypeHeader::from_ptr(ptr) }?;
        if !matches!(obj_type, rlasp_runtime::header::ObjectType::Symbol) {
            return None;
        }

        let symbol_ptr = obj.as_general_ptr::<rlasp_runtime::Symbol>()?;
        if symbol_ptr.is_null() {
            return None;
        }
        let symbol = unsafe { &*symbol_ptr };
        Some(symbol.name().to_string())
    }

    /// Create a new expander with bootstrapped macros
    pub fn new() -> Self {
        let macro_table = MacroTable::new();
        macro_table.bootstrap();
        Expander { macro_table }
    }

    /// Create an expander with a custom macro table
    pub fn with_macro_table(macro_table: MacroTable) -> Self {
        Expander { macro_table }
    }

    /// Expand macros once (macroexpand-1)
    pub fn macroexpand_1(&self, expr: LispObject) -> CompilerResult<(LispObject, bool)> {
        // Not a cons => not a macro call
        if !expr.is_cons() {
            return Ok((expr, false));
        }
        
        let cons_ptr = expr.as_cons_ptr().unwrap();
        let cons = unsafe { &*cons_ptr };
        let car = cons.car();

        // Check if car is a symbol that names a macro
        if car.is_general() {
            if let Some(name) = Self::get_symbol_name(car) {
                if let Some(macro_def) = self.macro_table.get_macro(&name) {
                // Extract arguments
                let args_list = cons.cdr();
                let args = if let Some(args_cons) = args_list.as_cons_ptr() {
                    let args_ref = unsafe { &*args_cons };
                    args_ref.to_vec().unwrap_or_default()
                } else if args_list.is_nil() {
                    Vec::new()
                } else {
                    return Err(CompilerError::InvalidSyntax {
                        form: name,
                        msg: "Invalid argument list".to_string(),
                    });
                };
                
                // Call the macro expander
                let expanded = (macro_def.expander)(&args)
                    .map_err(|e| CompilerError::MacroExpansionError { msg: e })?;

                return Ok((expanded, true));
                }
            }
        }
        
        // Not a macro call
        Ok((expr, false))
    }
    
    /// Fully expand macros (macroexpand)
    pub fn macroexpand(&self, mut expr: LispObject) -> CompilerResult<LispObject> {
        loop {
            let (expanded, changed) = self.macroexpand_1(expr)?;
            if !changed {
                return Ok(expanded);
            }
            expr = expanded;
        }
    }
    
    /// Walk an expression and expand all macros recursively
    pub fn expand_all(&self, expr: LispObject) -> CompilerResult<LispObject> {
        // First expand the top level
        let expr = self.macroexpand(expr)?;
        
        // If it's not a list, we're done
        if !expr.is_cons() {
            return Ok(expr);
        }
        
        let cons_ptr = expr.as_cons_ptr().unwrap();
        let cons = unsafe { &*cons_ptr };
        let car = cons.car();
        
        // Check if it's a special form that we should not expand into
        if car.is_general() {
            if let Some(name) = Self::get_symbol_name(car) {
                match name.as_str() {
                    // Quote - don't expand the argument
                    "quote" => return Ok(expr),

                    // For other special forms, recursively expand arguments
                    _ => {
                        // Recursively expand all elements in the list
                        let elements = cons.to_vec().unwrap_or_default();
                        let mut expanded_elements = Vec::new();

                        // Keep the operator (car) as-is
                        expanded_elements.push(elements[0]);

                        // Expand the rest
                        for elem in &elements[1..] {
                            expanded_elements.push(self.expand_all(*elem)?);
                        }

                        return Ok(rlasp_runtime::Cons::list(&expanded_elements));
                    }
                }
            }
        }
        
        // Regular function call - expand all elements
        let elements = cons.to_vec().unwrap_or_default();
        let expanded: Result<Vec<_>, _> = elements.iter()
            .map(|&e| self.expand_all(e))
            .collect();
        
        Ok(rlasp_runtime::Cons::list(&expanded?))
    }
    
    /// Get the macro table
    pub fn macro_table(&self) -> &MacroTable {
        &self.macro_table
    }
}

impl Default for Expander {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rlasp_reader::read_from_string;
    
    #[test]
    fn test_macroexpand_1_and() {
        let expander = Expander::new();
        
        let expr = read_from_string("(and x y z)").unwrap();
        let (expanded, changed) = expander.macroexpand_1(expr).unwrap();
        
        assert!(changed);
        assert!(expanded.is_cons());
        // Should expand to (if x (and y z) nil)
    }
    
    #[test]
    fn test_macroexpand_and() {
        let expander = Expander::new();
        
        let expr = read_from_string("(and x y)").unwrap();
        let expanded = expander.macroexpand(expr).unwrap();
        
        assert!(expanded.is_cons());
        // Should fully expand to (if x y nil)
    }
    
    #[test]
    fn test_expand_when() {
        let expander = Expander::new();
        
        let expr = read_from_string("(when t (+ 1 2))").unwrap();
        let expanded = expander.macroexpand(expr).unwrap();
        
        assert!(expanded.is_cons());
        // Should expand to (if t (+ 1 2))
    }
    
    #[test]
    fn test_no_expansion() {
        let expander = Expander::new();
        
        let expr = read_from_string("(+ 1 2)").unwrap();
        let (expanded, changed) = expander.macroexpand_1(expr).unwrap();
        
        assert!(!changed);
        assert_eq!(expanded, expr);
    }
    
    #[test]
    fn test_expand_all_nested() {
        let expander = Expander::new();
        
        let expr = read_from_string("(when t (when nil 42))").unwrap();
        let expanded = expander.expand_all(expr).unwrap();
        
        assert!(expanded.is_cons());
        // Both when forms should be expanded to if
    }
}
