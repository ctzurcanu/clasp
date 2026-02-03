/// eval_sequence.rs - Common Lisp sequence operations
/// Sequences include lists, vectors, and strings
use super::eval_types::EvalResult;
use super::eval_list::apply_function;
use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

pub fn call_sequence_builtin(
    name: &str,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    match name {
        // Sequence access
        "elt" => {
            // (elt sequence index)
            let index_opt = match args.get(1) {
                Some(EvalResult::Fixnum(idx)) if *idx >= 0 => Some(*idx as usize),
                Some(EvalResult::Float(idx)) if *idx >= 0.0 => Some(*idx as usize),
                _ => None,
            };

            match (args.get(0), index_opt) {
                (Some(seq), Some(index)) => {
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
            // Destructively modifies sequence1 by copying elements from sequence2
            if args.len() < 2 {
                return Err("replace requires at least 2 arguments".to_string());
            }

            let seq1 = &args[0];
            let seq2 = &args[1];

            // Parse keyword arguments
            let mut start1: usize = 0;
            let mut start2: usize = 0;
            let mut i = 2;
            while i + 1 < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    let key_lower = key.to_lowercase();
                    if let EvalResult::Fixnum(n) = &args[i + 1] {
                        match key_lower.as_str() {
                            ":start1" => start1 = *n as usize,
                            ":start2" => start2 = *n as usize,
                            _ => {}
                        }
                    }
                }
                i += 2;
            }

            match (seq1, seq2) {
                (EvalResult::String(s1), EvalResult::String(s2)) => {
                    let mut chars1: Vec<char> = s1.chars().collect();
                    let chars2: Vec<char> = s2.chars().skip(start2).collect();

                    for (i, c) in chars2.iter().enumerate() {
                        let dest_idx = start1 + i;
                        if dest_idx < chars1.len() {
                            chars1[dest_idx] = *c;
                        }
                    }

                    Ok(EvalResult::String(chars1.into_iter().collect()))
                }
                // For lists, we would need mutable access which is complex
                // For now, return the target sequence unchanged for list replace
                _ => Ok(seq1.clone())
            }
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

        "search" => {
            // (search seq1 seq2 &key from-end test start1 end1 start2 end2)
            // Returns position of seq1 in seq2, or NIL if not found
            if args.len() < 2 {
                return Err("search requires two sequences".to_string());
            }

            let seq1 = &args[0];
            let seq2 = &args[1];

            // Handle string search
            if let (EvalResult::String(s1), EvalResult::String(s2)) = (seq1, seq2) {
                if let Some(pos) = s2.find(s1.as_str()) {
                    return Ok(EvalResult::Fixnum(pos as i64));
                }
                return Ok(EvalResult::Nil);
            }

            // Handle list search (find seq1 as subsequence of seq2)
            // Convert seq1 to a vector for matching
            let mut needle: Vec<EvalResult> = Vec::new();
            let mut cur1 = seq1.clone();
            loop {
                match cur1 {
                    EvalResult::Cons(car, cdr) => {
                        needle.push(car.borrow().clone());
                        cur1 = cdr.borrow().clone();
                    }
                    EvalResult::Nil => break,
                    _ => break,
                }
            }

            if needle.is_empty() {
                return Ok(EvalResult::Fixnum(0));
            }

            // Helper to check if needle matches at position
            let matches_at = |start: &EvalResult| -> bool {
                let mut cur = start.clone();
                for needle_elem in &needle {
                    match cur {
                        EvalResult::Cons(mcar, mcdr) => {
                            if !values_equal(&mcar.borrow(), needle_elem) {
                                return false;
                            }
                            cur = mcdr.borrow().clone();
                        }
                        _ => return false,
                    }
                }
                true
            };

            // Search in seq2
            let mut pos = 0i64;
            let mut cur2 = seq2.clone();
            loop {
                let next = match &cur2 {
                    EvalResult::Cons(_, cdr) => Some(cdr.borrow().clone()),
                    _ => None,
                };

                if matches_at(&cur2) {
                    return Ok(EvalResult::Fixnum(pos));
                }

                match next {
                    Some(n) => {
                        cur2 = n;
                        pos += 1;
                    }
                    None => break,
                }
            }
            Ok(EvalResult::Nil)
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

        "sort" | "stable-sort" => {
            // (sort sequence predicate &key key)
            // (stable-sort sequence predicate &key key)
            if args.len() < 2 {
                return Err(format!("{} requires sequence and predicate", name));
            }
            let sequence = &args[0];
            let predicate = &args[1];

            // Convert sequence to vector for sorting
            let mut items: Vec<EvalResult> = match sequence {
                EvalResult::Cons(_, _) => {
                    let mut v = Vec::new();
                    let mut current = sequence.clone();
                    while let EvalResult::Cons(car, cdr) = current {
                        v.push(car.borrow().clone());
                        current = cdr.borrow().clone();
                    }
                    v
                }
                EvalResult::Array(arr) => arr.borrow().clone(),
                EvalResult::Nil => Vec::new(),
                _ => return Err("sort: sequence must be a list or vector".to_string()),
            };

            // Sort using the predicate
            // Note: This is a simplified sort that may not handle all edge cases
            items.sort_by(|a, b| {
                let result = apply_function(predicate, &[a.clone(), b.clone()], env);
                match result {
                    Ok(r) if is_truthy(&r) => std::cmp::Ordering::Less,
                    _ => std::cmp::Ordering::Greater,
                }
            });

            // Convert back to original type
            match sequence {
                EvalResult::Cons(_, _) | EvalResult::Nil => {
                    // Return as list
                    let mut result = EvalResult::Nil;
                    for item in items.into_iter().rev() {
                        result = EvalResult::Cons(
                            std::rc::Rc::new(std::cell::RefCell::new(item)),
                            std::rc::Rc::new(std::cell::RefCell::new(result)),
                        );
                    }
                    Ok(result)
                }
                EvalResult::Array(_) => {
                    Ok(EvalResult::Array(std::rc::Rc::new(std::cell::RefCell::new(items))))
                }
                _ => Ok(EvalResult::Nil),
            }
        }

        "merge" => {
            // (merge result-type sequence1 sequence2 predicate &key key)
            if args.len() < 4 {
                return Err("merge requires result-type, sequence1, sequence2, and predicate".to_string());
            }
            let _result_type = &args[0]; // We'll just return a list for now
            let seq1 = &args[1];
            let seq2 = &args[2];
            let predicate = &args[3];

            // Convert sequences to vectors
            let to_vec = |seq: &EvalResult| -> Vec<EvalResult> {
                match seq {
                    EvalResult::Cons(_, _) => {
                        let mut v = Vec::new();
                        let mut current = seq.clone();
                        while let EvalResult::Cons(car, cdr) = current {
                            v.push(car.borrow().clone());
                            current = cdr.borrow().clone();
                        }
                        v
                    }
                    EvalResult::Array(arr) => arr.borrow().clone(),
                    EvalResult::Nil => Vec::new(),
                    other => vec![other.clone()],
                }
            };

            let mut v1 = to_vec(seq1);
            let mut v2 = to_vec(seq2);
            let mut result = Vec::new();

            // Merge the two sorted sequences
            let mut i1 = 0;
            let mut i2 = 0;
            while i1 < v1.len() && i2 < v2.len() {
                let cmp = apply_function(predicate, &[v1[i1].clone(), v2[i2].clone()], env);
                match cmp {
                    Ok(r) if is_truthy(&r) => {
                        result.push(v1[i1].clone());
                        i1 += 1;
                    }
                    _ => {
                        result.push(v2[i2].clone());
                        i2 += 1;
                    }
                }
            }
            // Append remaining elements
            while i1 < v1.len() {
                result.push(v1[i1].clone());
                i1 += 1;
            }
            while i2 < v2.len() {
                result.push(v2[i2].clone());
                i2 += 1;
            }

            // Return as list
            let mut list_result = EvalResult::Nil;
            for item in result.into_iter().rev() {
                list_result = EvalResult::Cons(
                    std::rc::Rc::new(std::cell::RefCell::new(item)),
                    std::rc::Rc::new(std::cell::RefCell::new(list_result)),
                );
            }
            Ok(list_result)
        }

        "substitute" => {
            // (substitute newitem olditem sequence &key test test-not)
            let newitem = args.get(0).cloned().ok_or_else(|| "substitute requires newitem".to_string())?;
            let olditem = args.get(1).cloned().ok_or_else(|| "substitute requires olditem".to_string())?;
            let sequence = args.get(2).cloned().ok_or_else(|| "substitute requires sequence".to_string())?;

            let keyword_args = parse_keyword_args(&args[3..]);
            let test_fn = keyword_args.get("test");
            let test_not_fn = keyword_args.get("test-not");

            let mut matches = |item: &EvalResult| -> Result<bool, String> {
                if let Some(test) = test_fn {
                    let res = apply_function(test, &[item.clone(), olditem.clone()], env)?;
                    return Ok(is_truthy(&res));
                }
                if let Some(test_not) = test_not_fn {
                    let res = apply_function(test_not, &[item.clone(), olditem.clone()], env)?;
                    return Ok(!is_truthy(&res));
                }
                Ok(values_equal(item, &olditem))
            };

            match sequence {
                EvalResult::String(s) => {
                    let new_ch = match newitem {
                        EvalResult::Character(c) => c,
                        _ => return Err("substitute on strings requires character newitem".to_string()),
                    };
                    let mut result = String::new();
                    for ch in s.chars() {
                        let item = EvalResult::Character(ch);
                        if matches(&item)? {
                            result.push(new_ch);
                        } else {
                            result.push(ch);
                        }
                    }
                    Ok(EvalResult::String(result))
                }
                EvalResult::Cons(_, _) | EvalResult::Nil => {
                    // List substitution
                    let mut result = EvalResult::Nil;
                    let mut current = sequence;
                    let mut items = Vec::new();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                let item = car.borrow().clone();
                                let replaced = if matches(&item)? { newitem.clone() } else { item };
                                items.push(replaced);
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => return Err("substitute requires a proper list or string".to_string()),
                        }
                    }
                    for item in items.iter().rev() {
                        result = EvalResult::Cons(
                            Rc::new(RefCell::new(item.clone())),
                            Rc::new(RefCell::new(result)),
                        );
                    }
                    Ok(result)
                }
                _ => Err("substitute requires a sequence".to_string()),
            }
        }

        "substitute-if" => {
            // (substitute-if newitem predicate sequence)
            let newitem = args.get(0).cloned().ok_or_else(|| "substitute-if requires newitem".to_string())?;
            let predicate = args.get(1).cloned().ok_or_else(|| "substitute-if requires predicate".to_string())?;
            let sequence = args.get(2).cloned().ok_or_else(|| "substitute-if requires sequence".to_string())?;

            match sequence {
                EvalResult::String(s) => {
                    let new_ch = match newitem {
                        EvalResult::Character(c) => c,
                        _ => return Err("substitute-if on strings requires character newitem".to_string()),
                    };
                    let mut result = String::new();
                    for ch in s.chars() {
                        let pred_val = apply_function(&predicate, &[EvalResult::Character(ch)], env)?;
                        if is_truthy(&pred_val) {
                            result.push(new_ch);
                        } else {
                            result.push(ch);
                        }
                    }
                    Ok(EvalResult::String(result))
                }
                EvalResult::Cons(_, _) | EvalResult::Nil => {
                    let mut result = EvalResult::Nil;
                    let mut current = sequence;
                    let mut items = Vec::new();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                let item = car.borrow().clone();
                                let pred_val = apply_function(&predicate, &[item.clone()], env)?;
                                let replaced = if is_truthy(&pred_val) { newitem.clone() } else { item };
                                items.push(replaced);
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => return Err("substitute-if requires a proper list or string".to_string()),
                        }
                    }
                    for item in items.iter().rev() {
                        result = EvalResult::Cons(
                            Rc::new(RefCell::new(item.clone())),
                            Rc::new(RefCell::new(result)),
                        );
                    }
                    Ok(result)
                }
                _ => Err("substitute-if requires a sequence".to_string()),
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

fn parse_keyword_args(args: &[EvalResult]) -> HashMap<String, EvalResult> {
    let mut map = HashMap::new();
    let mut i = 0;
    while i + 1 < args.len() {
        if let EvalResult::Symbol(key) = &args[i] {
            if key.starts_with(':') {
                let name = key.trim_start_matches(':').to_string();
                map.insert(name, args[i + 1].clone());
                i += 2;
                continue;
            }
        }
        i += 1;
    }
    map
}

fn is_truthy(val: &EvalResult) -> bool {
    !matches!(val, EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false))
}
