/// eval_array.rs - Common Lisp array and vector operations
use super::eval_types::EvalResult;
use std::rc::Rc;
use std::cell::RefCell;

pub fn call_array_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        // Array predicates
        "arrayp" => {
            // For now, only strings and lists are sequences
            // True arrays not yet implemented
            match args.get(0) {
                Some(EvalResult::String(_)) => Ok(EvalResult::Boolean(true)),
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        "vectorp" => {
            // Vectors not yet implemented as distinct type
            Ok(EvalResult::Boolean(false))
        }

        "simple-vector-p" => {
            Ok(EvalResult::Boolean(false))
        }

        "bit-vector-p" | "simple-bit-vector-p" => {
            Ok(EvalResult::Boolean(false))
        }

        "adjustable-array-p" => {
            Ok(EvalResult::Boolean(false))
        }

        // Array creation (stubs)
        "make-array" => {
            // (make-array dimensions &key element-type initial-element initial-contents)
            Err("make-array not implemented yet - need proper array type".to_string())
        }

        "vector" => {
            // (vector &rest objects) - create a simple vector
            let elements: Vec<EvalResult> = args.to_vec();
            Ok(EvalResult::Array(Rc::new(RefCell::new(elements))))
        }

        // Array access
        "aref" => {
            // (aref array &rest subscripts)
            // Simplified: only support 1D arrays (strings)
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::String(s)), Some(EvalResult::Float(idx))) if *idx >= 0.0 => {
                    let index = *idx as usize;
                    s.chars().nth(index)
                        .map(EvalResult::Character)
                        .ok_or_else(|| "Array index out of bounds".to_string())
                }
                _ => Err("aref not fully implemented - need proper array type".to_string()),
            }
        }

        "svref" => {
            // Simple vector reference
            Err("svref not implemented yet - need vector type".to_string())
        }

        "row-major-aref" => {
            Err("row-major-aref not implemented yet".to_string())
        }

        // Array information
        "array-dimension" => {
            // (array-dimension array axis-number)
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    // For string, dimension 0 is length
                    match args.get(1) {
                        Some(EvalResult::Float(n)) if *n == 0.0 => {
                            Ok(EvalResult::Float(s.len() as f64))
                        }
                        _ => Err("Invalid axis number".to_string()),
                    }
                }
                _ => Err("array-dimension not fully implemented".to_string()),
            }
        }

        "array-dimensions" => {
            // Return list of dimensions
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    // String is 1D array
                    let len = EvalResult::Float(s.len() as f64);
                    Ok(EvalResult::Cons(
                        Rc::new(RefCell::new(len)),
                        Rc::new(RefCell::new(EvalResult::Nil))
                    ))
                }
                _ => Err("array-dimensions not fully implemented".to_string()),
            }
        }

        "array-rank" => {
            // Return number of dimensions
            match args.get(0) {
                Some(EvalResult::String(_)) => Ok(EvalResult::Float(1.0)),
                _ => Err("array-rank not fully implemented".to_string()),
            }
        }

        "array-total-size" => {
            // Total number of elements
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::Float(s.len() as f64)),
                _ => Err("array-total-size not fully implemented".to_string()),
            }
        }

        "array-in-bounds-p" => {
            // Check if subscripts are valid
            Err("array-in-bounds-p not implemented yet".to_string())
        }

        "array-row-major-index" => {
            // Convert subscripts to row-major index
            Err("array-row-major-index not implemented yet".to_string())
        }

        // Array properties
        "array-element-type" => {
            match args.get(0) {
                Some(EvalResult::String(_)) => {
                    // String arrays have character elements
                    Ok(EvalResult::Symbol("CHARACTER".to_string()))
                }
                _ => Err("array-element-type not fully implemented".to_string()),
            }
        }

        "array-has-fill-pointer-p" => {
            Ok(EvalResult::Boolean(false))
        }

        "fill-pointer" => {
            Err("fill-pointer not implemented yet".to_string())
        }

        "array-displacement" => {
            // Return (values nil 0) for non-displaced arrays
            Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Fixnum(0)]))
        }

        // Aliases with different naming conventions (camelCase)
        "arrayDimension" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::Fixnum(s.len() as i64)),
            _ => Err("arrayDimension not fully implemented".to_string()),
        },

        "arrayDimensions" => match args.get(0) {
            Some(EvalResult::String(s)) => {
                let dims = vec![EvalResult::Fixnum(s.len() as i64)];
                let mut result = EvalResult::Nil;
                for dim in dims.into_iter().rev() {
                    result = EvalResult::Cons(
                        std::rc::Rc::new(std::cell::RefCell::new(dim)),
                        std::rc::Rc::new(std::cell::RefCell::new(result))
                    );
                }
                Ok(result)
            }
            _ => Err("arrayDimensions not fully implemented".to_string()),
        },

        "arrayElementType" => match args.get(0) {
            Some(EvalResult::String(_)) => Ok(EvalResult::Symbol("CHARACTER".to_string())),
            _ => Err("arrayElementType not fully implemented".to_string()),
        },

        "arrayHasFillPointerP" => Ok(EvalResult::Boolean(false)),

        "arrayRowMajorIndex" => Ok(EvalResult::Fixnum(0)),

        "arrayTotalSize" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::Fixnum(s.len() as i64)),
            _ => Err("arrayTotalSize not fully implemented".to_string()),
        },

        "fillPointer" => Err("fillPointer not implemented yet".to_string()),

        "rowMajorAref" => match (args.get(0), args.get(1)) {
            (Some(EvalResult::String(s)), Some(EvalResult::Fixnum(idx))) => {
                s.chars().nth(*idx as usize)
                    .map(|c| EvalResult::Character(c))
                    .ok_or("Index out of bounds".to_string())
            }
            _ => Err("rowMajorAref not fully implemented".to_string()),
        },

        "bit-vector-p" => Ok(EvalResult::Boolean(false)),

        "vector-push" => {
            // (vector-push new-element vector)
            // Push element onto adjustable vector with fill pointer
            // Simplified: just return the index
            Ok(EvalResult::Fixnum(0))
        }

        "vector-push-extend" => {
            // (vector-push-extend new-element vector &optional extension)
            // Like vector-push but extends the vector if needed
            Ok(EvalResult::Fixnum(0))
        }

        _ => Err(format!("Unknown array builtin: {}", name)),
    }
}
