/// eval_sequence.rs - Common Lisp sequence operations
/// Sequences include lists, vectors, and strings
use super::eval_types::EvalResult;
use std::rc::Rc;
use std::cell::RefCell;

pub fn call_sequence_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        // Sequence access
        "elt" => {
            // (elt sequence index)
            match (args.get(0), args.get(1)) {
                (Some(seq), Some(EvalResult::Float(idx))) if *idx >= 0.0 => {
                    let index = *idx as usize;
                    match seq {
                        EvalResult::String(s) => {
                            s.chars().nth(index)
                                .map(EvalResult::Character)
                                .ok_or_else(|| "Index out of bounds".to_string())
                        }
                        EvalResult::Cons(_, _) => {
                            // Navigate list
                            let mut current = seq.clone();
                            for _ in 0..index {
                                match current {
                                    EvalResult::Cons(_, cdr) => {
                                        current = cdr.borrow().clone();
                                    }
                                    _ => return Err("Index out of bounds".to_string()),
                                }
                            }
                            match current {
                                EvalResult::Cons(car, _) => Ok(car.borrow().clone()),
                                _ => Err("Index out of bounds".to_string()),
                            }
                        }
                        _ => Err("elt requires a sequence".to_string()),
                    }
                }
                _ => Err("elt requires a sequence and non-negative index".to_string()),
            }
        }

        "copy-seq" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
                Some(EvalResult::Cons(car, cdr)) => {
                    Ok(EvalResult::Cons(
                        Rc::new(RefCell::new(car.borrow().clone())),
                        Rc::new(RefCell::new(cdr.borrow().clone()))
                    ))
                }
                Some(EvalResult::Nil) => Ok(EvalResult::Nil),
                _ => Err("copy-seq requires a sequence".to_string()),
            }
        }

        "reverse" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    Ok(EvalResult::String(s.chars().rev().collect()))
                }
                Some(seq) => {
                    // Reverse a list
                    let mut result = EvalResult::Nil;
                    let mut current = seq.clone();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(car.borrow().clone())),
                                    Rc::new(RefCell::new(result))
                                );
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => return Err("reverse requires a proper list".to_string()),
                        }
                    }
                    Ok(result)
                }
                _ => Err("reverse requires a sequence".to_string()),
            }
        }

        "concatenate" => {
            // (concatenate result-type &rest sequences)
            // For simplicity, only handle string concatenation for now
            if args.is_empty() {
                return Err("concatenate requires a result-type".to_string());
            }

            let mut result = String::new();
            for arg in &args[1..] {
                match arg {
                    EvalResult::String(s) => result.push_str(s),
                    EvalResult::Character(c) => result.push(*c),
                    _ => {}
                }
            }
            Ok(EvalResult::String(result))
        }

        "fill" => {
            // (fill sequence item &key start end)
            // For simplicity, fill entire sequence
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::String(_)), Some(EvalResult::Character(ch))) => {
                    // Can't really modify string in place, return error
                    Err("fill on string not supported (strings are immutable)".to_string())
                }
                _ => Err("fill not fully implemented".to_string()),
            }
        }

        "replace" => {
            // (replace sequence1 sequence2 &key start1 end1 start2 end2)
            Err("replace not implemented yet".to_string())
        }

        "remove" => {
            // (remove item sequence &key test)
            if args.len() < 2 {
                return Err("remove requires item and sequence".to_string());
            }

            let item = &args[0];
            let seq = &args[1];

            match seq {
                EvalResult::Cons(_, _) => {
                    // Remove from list
                    let mut result = Vec::new();
                    let mut current = seq.clone();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                let elem = car.borrow().clone();
                                // Simple equality test
                                if !values_equal(&elem, item) {
                                    result.push(elem);
                                }
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => break,
                        }
                    }

                    // Build result list
                    let mut list_result = EvalResult::Nil;
                    for item in result.iter().rev() {
                        list_result = EvalResult::Cons(
                            Rc::new(RefCell::new(item.clone())),
                            Rc::new(RefCell::new(list_result))
                        );
                    }
                    Ok(list_result)
                }
                EvalResult::Nil => Ok(EvalResult::Nil),
                _ => Err("remove: sequence must be a list".to_string()),
            }
        }

        "find" => {
            // (find item sequence &key test)
            if args.len() < 2 {
                return Err("find requires item and sequence".to_string());
            }

            let item = &args[0];
            let seq = &args[1];

            match seq {
                EvalResult::Cons(_, _) => {
                    let mut current = seq.clone();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                let elem = car.borrow().clone();
                                if values_equal(&elem, item) {
                                    return Ok(elem);
                                }
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => break,
                        }
                    }
                    Ok(EvalResult::Nil)
                }
                EvalResult::Nil => Ok(EvalResult::Nil),
                _ => Err("find: sequence must be a list".to_string()),
            }
        }

        "position" => {
            // (position item sequence &key test)
            if args.len() < 2 {
                return Err("position requires item and sequence".to_string());
            }

            let item = &args[0];
            let seq = &args[1];

            match seq {
                EvalResult::Cons(_, _) => {
                    let mut current = seq.clone();
                    let mut index = 0;
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                let elem = car.borrow().clone();
                                if values_equal(&elem, item) {
                                    return Ok(EvalResult::Fixnum(index));
                                }
                                index += 1;
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => break,
                        }
                    }
                    Ok(EvalResult::Nil)
                }
                EvalResult::Nil => Ok(EvalResult::Nil),
                _ => Err("position: sequence must be a list".to_string()),
            }
        }

        "remove-if" => {
            // (remove-if predicate sequence)
            Err("remove-if not implemented yet - needs function calling".to_string())
        }

        "remove-if-not" => {
            // (remove-if-not predicate sequence)
            Err("remove-if-not not implemented yet - needs function calling".to_string())
        }

        "find-if" => {
            // (find-if predicate sequence)
            Err("find-if not implemented yet - needs function calling".to_string())
        }

        "find-if-not" => {
            // (find-if-not predicate sequence)
            Err("find-if-not not implemented yet - needs function calling".to_string())
        }

        "position-if" => {
            // (position-if predicate sequence)
            Err("position-if not implemented yet - needs function calling".to_string())
        }

        "position-if-not" => {
            // (position-if-not predicate sequence)
            Err("position-if-not not implemented yet - needs function calling".to_string())
        }

        "count-if" => {
            // (count-if predicate sequence)
            Err("count-if not implemented yet - needs function calling".to_string())
        }

        "count-if-not" => {
            // (count-if-not predicate sequence)
            Err("count-if-not not implemented yet - needs function calling".to_string())
        }

        "map" => {
            // (map result-type function &rest sequences)
            Err("map not implemented yet - needs function calling".to_string())
        }

        "reduce" => {
            // (reduce function sequence &key from-end start end initial-value)
            if args.len() < 2 {
                return Err("reduce requires at least 2 arguments".to_string());
            }

            let func = &args[0];
            let seq = &args[1];

            // Convert sequence to list of values
            let mut values = Vec::new();
            let mut current = seq.clone();
            loop {
                match current {
                    EvalResult::Cons(car, cdr) => {
                        values.push(car.borrow().clone());
                        current = cdr.borrow().clone();
                    }
                    EvalResult::Nil => break,
                    _ => return Err("reduce requires a sequence".to_string()),
                }
            }

            if values.is_empty() {
                return Ok(EvalResult::Fixnum(0));
            }

            // Start with first value
            let mut acc = values[0].clone();

            // Apply function to accumulator and each remaining value
            for val in values.iter().skip(1) {
                // Handle common arithmetic operations
                acc = match func {
                    EvalResult::Symbol(name) => {
                        match name.as_str() {
                            "+" => {
                                // Add accumulator and value
                                match (&acc, val) {
                                    (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a + b),
                                    (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a + b),
                                    (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(*a as f64 + b),
                                    (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a + *b as f64),
                                    _ => return Err("reduce + requires numeric values".to_string()),
                                }
                            }
                            "*" => {
                                // Multiply accumulator and value
                                match (&acc, val) {
                                    (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => EvalResult::Fixnum(a * b),
                                    (EvalResult::Float(a), EvalResult::Float(b)) => EvalResult::Float(a * b),
                                    (EvalResult::Fixnum(a), EvalResult::Float(b)) => EvalResult::Float(*a as f64 * b),
                                    (EvalResult::Float(a), EvalResult::Fixnum(b)) => EvalResult::Float(a * *b as f64),
                                    _ => return Err("reduce * requires numeric values".to_string()),
                                }
                            }
                            _ => return Err(format!("reduce with function {} not implemented yet", name)),
                        }
                    }
                    _ => return Err("reduce requires a function symbol as first argument".to_string()),
                };
            }

            Ok(acc)
        }

        "every" => {
            // (every predicate &rest sequences)
            Err("every not implemented yet - needs function calling".to_string())
        }

        "some" => {
            // (some predicate &rest sequences)
            Err("some not implemented yet - needs function calling".to_string())
        }

        "notevery" => {
            // (notevery predicate &rest sequences)
            Err("notevery not implemented yet - needs function calling".to_string())
        }

        "notany" => {
            // (notany predicate &rest sequences)
            Err("notany not implemented yet - needs function calling".to_string())
        }

        "sort" => {
            // (sort sequence predicate)
            Err("sort not implemented yet - needs function calling".to_string())
        }

        "stable-sort" => {
            // (stable-sort sequence predicate)
            Err("stable-sort not implemented yet - needs function calling".to_string())
        }

        "merge" => {
            // (merge result-type sequence1 sequence2 predicate)
            Err("merge not implemented yet - needs function calling".to_string())
        }

        "substitute" => {
            // (substitute newitem olditem sequence &key test)
            match (args.get(0), args.get(1), args.get(2)) {
                (Some(new), Some(old), Some(EvalResult::String(s))) => {
                    // Simple string substitution
                    if let (EvalResult::Character(new_ch), EvalResult::Character(old_ch)) = (new, old) {
                        Ok(EvalResult::String(
                            s.replace(*old_ch, &new_ch.to_string())
                        ))
                    } else {
                        Err("substitute on strings requires characters".to_string())
                    }
                }
                _ => Err("substitute not fully implemented".to_string()),
            }
        }

        "nsubstitute" => {
            // Destructive version of substitute
            Err("nsubstitute not implemented yet".to_string())
        }

        _ => Err(format!("Unknown sequence builtin: {}", name)),
    }
}

// Helper function to compare values for equality
fn values_equal(a: &EvalResult, b: &EvalResult) -> bool {
    match (a, b) {
        (EvalResult::Fixnum(x), EvalResult::Fixnum(y)) => x == y,
        (EvalResult::Float(x), EvalResult::Float(y)) => (x - y).abs() < f64::EPSILON,
        (EvalResult::Fixnum(x), EvalResult::Float(y)) => (*x as f64 - y).abs() < f64::EPSILON,
        (EvalResult::Float(x), EvalResult::Fixnum(y)) => (x - *y as f64).abs() < f64::EPSILON,
        (EvalResult::Bool(x), EvalResult::Bool(y)) => x == y,
        (EvalResult::Boolean(x), EvalResult::Boolean(y)) => x == y,
        (EvalResult::String(x), EvalResult::String(y)) => x == y,
        (EvalResult::Symbol(x), EvalResult::Symbol(y)) => x == y,
        (EvalResult::Character(x), EvalResult::Character(y)) => x == y,
        (EvalResult::Nil, EvalResult::Nil) => true,
        _ => false,
    }
}
