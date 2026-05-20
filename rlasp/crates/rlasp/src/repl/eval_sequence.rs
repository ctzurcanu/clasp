use super::eval_list::apply_function;
/// eval_sequence.rs - Common Lisp sequence operations
/// Sequences include lists, vectors, and strings
use super::eval_system::get_array_fill_pointer;
use super::eval_types::EvalResult;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

pub fn call_sequence_builtin(
    name: &str,
    args: &[EvalResult],
    env: &mut HashMap<String, EvalResult>,
) -> Result<EvalResult, String> {
    fn is_function_designator(v: &EvalResult) -> bool {
        matches!(
            v,
            EvalResult::Lambda { .. }
                | EvalResult::BuiltinFunction(_)
                | EvalResult::GenericFunction(_)
                | EvalResult::ForeignFunction(_)
                | EvalResult::Symbol(_)
        )
    }

    fn is_sequence_value(v: &EvalResult) -> bool {
        matches!(
            v,
            EvalResult::Nil | EvalResult::Cons(_, _) | EvalResult::Array(_) | EvalResult::String(_)
        )
    }

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
                        EvalResult::String(s) => s
                            .chars()
                            .nth(index)
                            .map(EvalResult::Character)
                            .ok_or_else(|| "TYPE-ERROR".to_string()),
                        EvalResult::Array(arr) => {
                            let cells = arr.borrow();
                            let active_len = get_array_fill_pointer(arr).unwrap_or(cells.len());
                            if index >= active_len {
                                Err("TYPE-ERROR".to_string())
                            } else {
                                cells
                                    .get(index)
                                    .cloned()
                                    .ok_or_else(|| "TYPE-ERROR".to_string())
                            }
                        }
                        EvalResult::Cons(_, _) => {
                            // Navigate list
                            let mut current = seq.clone();
                            for _ in 0..index {
                                match current {
                                    EvalResult::Cons(_, cdr) => {
                                        current = cdr.borrow().clone();
                                    }
                                    _ => return Err("TYPE-ERROR".to_string()),
                                }
                            }
                            match current {
                                EvalResult::Cons(car, _) => Ok(car.borrow().clone()),
                                _ => Err("TYPE-ERROR".to_string()),
                            }
                        }
                        _ => {
                            if std::env::var("RLASP_DEBUG_ELT_TYPE").is_ok() {
                                let mut interesting: Vec<(String, String)> = env
                                    .iter()
                                    .filter(|(k, _)| {
                                        k.eq_ignore_ascii_case("fun")
                                            || k.eq_ignore_ascii_case("thunk")
                                            || k.eq_ignore_ascii_case("object")
                                            || k.eq_ignore_ascii_case("at")
                                            || k.eq_ignore_ascii_case("accessor")
                                    })
                                    .map(|(k, v)| (k.clone(), format!("{:?}", v)))
                                    .collect();
                                interesting.sort_by(|a, b| a.0.cmp(&b.0));
                                eprintln!(
                                    "[elt-type-error] seq={:?} index={} locals={:?} stack=[{}]",
                                    seq,
                                    index,
                                    interesting,
                                    super::eval_core::debug_call_stack_summary()
                                );
                            }
                            Err("TYPE-ERROR".to_string())
                        }
                    }
                }
                _ => Err("TYPE-ERROR".to_string()),
            }
        }

        "copy-seq" => match args.get(0) {
            Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
            Some(EvalResult::Array(arr)) => {
                let new_arr = Rc::new(RefCell::new(arr.borrow().clone()));
                super::eval_system::register_array_dims_for_bridge(
                    &new_arr,
                    super::eval_system::array_dims_for_bridge(arr),
                );
                super::eval_system::set_array_fill_pointer(&new_arr, get_array_fill_pointer(arr));
                super::eval_system::set_array_adjustable(
                    &new_arr,
                    super::eval_system::is_array_adjustable(arr),
                );
                if let Some((displaced_to, displaced_offset)) =
                    super::eval_system::get_array_displacement(arr)
                {
                    super::eval_system::set_array_displacement(
                        &new_arr,
                        Some(displaced_to),
                        displaced_offset,
                    );
                }
                Ok(EvalResult::Array(new_arr))
            }
            Some(EvalResult::Cons(_, _)) => {
                let mut items = Vec::new();
                let mut current = args[0].clone();
                loop {
                    match current {
                        EvalResult::Nil => break,
                        EvalResult::Cons(car, cdr) => {
                            items.push(car.borrow().clone());
                            current = cdr.borrow().clone();
                        }
                        _ => return Err("TYPE-ERROR".to_string()),
                    }
                }

                let mut result = EvalResult::Nil;
                for item in items.into_iter().rev() {
                    result = EvalResult::Cons(
                        Rc::new(RefCell::new(item)),
                        Rc::new(RefCell::new(result)),
                    );
                }
                Ok(result)
            }
            Some(EvalResult::Nil) => Ok(EvalResult::Nil),
            _ => Err("TYPE-ERROR".to_string()),
        },

        "reverse" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::String(s.chars().rev().collect())),
                Some(seq) => {
                    // Reverse a list
                    let mut result = EvalResult::Nil;
                    let mut current = seq.clone();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(car.borrow().clone())),
                                    Rc::new(RefCell::new(result)),
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
            if args.len() < 2 {
                return Err("fill requires at least sequence and item".to_string());
            }

            let sequence = args[0].clone();
            let item = args[1].clone();

            let normalize_key = |raw: &str| -> String {
                raw.rsplit(':')
                    .next()
                    .unwrap_or(raw)
                    .trim_start_matches(':')
                    .to_ascii_lowercase()
            };
            let parse_index = |val: &EvalResult, _key: &str| -> Result<usize, String> {
                match val {
                    EvalResult::Fixnum(n) if *n >= 0 => Ok(*n as usize),
                    EvalResult::Float(f) if *f >= 0.0 => Ok(*f as usize),
                    _ => Err("TYPE-ERROR".to_string()),
                }
            };

            let mut start = 0usize;
            let mut end: Option<usize> = None;
            let mut i = 2usize;
            while i + 1 < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    let key = normalize_key(key);
                    match key.as_str() {
                        "start" => start = parse_index(&args[i + 1], "start")?,
                        "end" => end = Some(parse_index(&args[i + 1], "end")?),
                        _ => {}
                    }
                }
                i += 2;
            }

            match sequence {
                EvalResult::String(mut s) => {
                    let mut chars: Vec<char> = s.chars().collect();
                    let len = chars.len();
                    let end_idx = end.unwrap_or(len);
                    if start > len || end_idx > len {
                        return Err("TYPE-ERROR".to_string());
                    }
                    if start > end_idx {
                        return Err("PROGRAM-ERROR".to_string());
                    }
                    let fill_char = match item {
                        EvalResult::Character(c) => c,
                        EvalResult::String(ref one) if one.chars().count() == 1 => {
                            one.chars().next().unwrap()
                        }
                        _ => return Err("TYPE-ERROR".to_string()),
                    };
                    for idx in start..end_idx {
                        chars[idx] = fill_char;
                    }
                    s = chars.into_iter().collect();
                    Ok(EvalResult::String(s))
                }
                EvalResult::Array(arr) => {
                    let mut cells = arr.borrow_mut();
                    let len = cells.len();
                    let end_idx = end.unwrap_or(len);
                    if start > len || end_idx > len {
                        return Err("TYPE-ERROR".to_string());
                    }
                    if start > end_idx {
                        return Err("PROGRAM-ERROR".to_string());
                    }

                    let is_bit_vector = !cells.is_empty()
                        && cells.iter().all(|elem| {
                            matches!(
                                elem,
                                EvalResult::Fixnum(0)
                                    | EvalResult::Fixnum(1)
                                    | EvalResult::Bool(true)
                                    | EvalResult::Bool(false)
                                    | EvalResult::Boolean(true)
                                    | EvalResult::Boolean(false)
                                    | EvalResult::Nil
                            )
                        });

                    let fill_item = if is_bit_vector {
                        match item {
                            EvalResult::Fixnum(0) => EvalResult::Fixnum(0),
                            EvalResult::Fixnum(1) => EvalResult::Fixnum(1),
                            EvalResult::Bool(b) | EvalResult::Boolean(b) => {
                                EvalResult::Fixnum(if b { 1 } else { 0 })
                            }
                            EvalResult::Nil => EvalResult::Fixnum(0),
                            _ => return Err("TYPE-ERROR".to_string()),
                        }
                    } else {
                        item
                    };

                    for idx in start..end_idx {
                        cells[idx] = fill_item.clone();
                    }
                    drop(cells);
                    Ok(EvalResult::Array(arr))
                }
                EvalResult::Cons(_, _) | EvalResult::Nil => {
                    let mut cells: Vec<Rc<RefCell<EvalResult>>> = Vec::new();
                    let mut current = sequence.clone();
                    loop {
                        match current {
                            EvalResult::Nil => break,
                            EvalResult::Cons(car, cdr) => {
                                cells.push(car.clone());
                                current = cdr.borrow().clone();
                            }
                            _ => return Err("TYPE-ERROR".to_string()),
                        }
                    }

                    let len = cells.len();
                    let end_idx = end.unwrap_or(len);
                    if start > len || end_idx > len {
                        return Err("TYPE-ERROR".to_string());
                    }
                    if start > end_idx {
                        return Err("TYPE-ERROR".to_string());
                    }
                    for idx in start..end_idx {
                        *cells[idx].borrow_mut() = item.clone();
                    }
                    Ok(sequence)
                }
                _ => Err("TYPE-ERROR".to_string()),
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
                _ => Ok(seq1.clone()),
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
                            Rc::new(RefCell::new(list_result)),
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
                EvalResult::String(s) => {
                    let needle = match item {
                        EvalResult::Character(c) => Some(*c),
                        EvalResult::String(text) if text.chars().count() == 1 => {
                            text.chars().next()
                        }
                        _ => None,
                    };
                    if let Some(needle) = needle {
                        for ch in s.chars() {
                            if ch == needle {
                                return Ok(EvalResult::Character(ch));
                            }
                        }
                        return Ok(EvalResult::Nil);
                    }
                    Ok(EvalResult::Nil)
                }
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
                            _ => return Err("TYPE-ERROR".to_string()),
                        }
                    }
                    Ok(EvalResult::Nil)
                }
                EvalResult::Nil => Ok(EvalResult::Nil),
                _ => Err("TYPE-ERROR".to_string()),
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
                EvalResult::String(s) => {
                    let needle = match item {
                        EvalResult::Character(c) => Some(*c),
                        EvalResult::String(text) if text.chars().count() == 1 => {
                            text.chars().next()
                        }
                        _ => None,
                    };
                    if let Some(needle) = needle {
                        for (index, ch) in s.chars().enumerate() {
                            if ch == needle {
                                return Ok(EvalResult::Fixnum(index as i64));
                            }
                        }
                        return Ok(EvalResult::Nil);
                    }
                    Ok(EvalResult::Nil)
                }
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
                _ => Err("position: sequence must be a list or string".to_string()),
            }
        }

        "search" => {
            // (search seq1 seq2 &key from-end test test-not key start1 end1 start2 end2)
            if args.len() < 2 {
                return Err("search requires two sequences".to_string());
            }

            let normalize_key = |raw: &str| -> String {
                raw.rsplit(':')
                    .next()
                    .unwrap_or(raw)
                    .trim_start_matches(':')
                    .to_ascii_lowercase()
            };
            let parse_index = |value: &EvalResult, name: &str| -> Result<Option<usize>, String> {
                match value {
                    EvalResult::Nil => Ok(None),
                    EvalResult::Fixnum(n) if *n >= 0 => Ok(Some(*n as usize)),
                    EvalResult::Float(f) if *f >= 0.0 => Ok(Some(*f as usize)),
                    _ => Err(format!(
                        "search: {} must be a non-negative integer or NIL",
                        name
                    )),
                }
            };
            let collect_sequence = |seq: &EvalResult| -> Result<Vec<EvalResult>, String> {
                match seq {
                    EvalResult::Nil => Ok(Vec::new()),
                    EvalResult::Cons(_, _) => {
                        let mut out = Vec::new();
                        let mut current = seq.clone();
                        loop {
                            match current {
                                EvalResult::Nil => break,
                                EvalResult::Cons(car, cdr) => {
                                    out.push(car.borrow().clone());
                                    current = cdr.borrow().clone();
                                }
                                _ => {
                                    return Err(
                                        "search: sequence must be a proper list, string, or array"
                                            .to_string(),
                                    )
                                }
                            }
                        }
                        Ok(out)
                    }
                    EvalResult::String(s) => Ok(s.chars().map(EvalResult::Character).collect()),
                    EvalResult::Array(arr) => Ok(arr.borrow().clone()),
                    _ => {
                        Err("search: sequence must be a proper list, string, or array".to_string())
                    }
                }
            };

            let mut from_end = false;
            let mut start1: usize = 0;
            let mut end1: Option<usize> = None;
            let mut start2: usize = 0;
            let mut end2: Option<usize> = None;
            let mut key_fn: Option<EvalResult> = None;
            let mut test_fn: Option<EvalResult> = None;
            let mut negate_test = false;

            let mut i = 2;
            while i + 1 < args.len() {
                let Some(key) = (match &args[i] {
                    EvalResult::Symbol(s) | EvalResult::String(s) => Some(normalize_key(s)),
                    _ => None,
                }) else {
                    i += 1;
                    continue;
                };
                let value = args[i + 1].clone();
                match key.as_str() {
                    "from-end" => from_end = is_truthy(&value),
                    "start1" => start1 = parse_index(&value, "start1")?.unwrap_or(0),
                    "end1" => end1 = parse_index(&value, "end1")?,
                    "start2" => start2 = parse_index(&value, "start2")?.unwrap_or(0),
                    "end2" => end2 = parse_index(&value, "end2")?,
                    "key" => key_fn = Some(value),
                    "test" => {
                        test_fn = Some(value);
                        negate_test = false;
                    }
                    "test-not" => {
                        test_fn = Some(value);
                        negate_test = true;
                    }
                    _ => {}
                }
                i += 2;
            }

            let needle_all = collect_sequence(&args[0])?;
            let haystack_all = collect_sequence(&args[1])?;

            let needle_end = end1.unwrap_or(needle_all.len()).min(needle_all.len());
            let haystack_end = end2.unwrap_or(haystack_all.len()).min(haystack_all.len());
            if start1 > needle_end || start2 > haystack_end {
                return Ok(EvalResult::Nil);
            }

            let needle = needle_all[start1..needle_end].to_vec();
            let haystack = haystack_all[start2..haystack_end].to_vec();

            if needle.is_empty() {
                let pos = if from_end { haystack_end } else { start2 };
                return Ok(EvalResult::Fixnum(pos as i64));
            }
            if needle.len() > haystack.len() {
                return Ok(EvalResult::Nil);
            }

            let mut matches_at = |pos: usize| -> Result<bool, String> {
                for idx in 0..needle.len() {
                    let needle_elem = if let Some(ref key) = key_fn {
                        super::eval_types::primary_value(
                            super::eval_system::call_function_with_values(
                                key.clone(),
                                &[needle[idx].clone()],
                                env,
                            )?,
                        )
                    } else {
                        needle[idx].clone()
                    };
                    let haystack_elem = if let Some(ref key) = key_fn {
                        super::eval_types::primary_value(
                            super::eval_system::call_function_with_values(
                                key.clone(),
                                &[haystack[pos + idx].clone()],
                                env,
                            )?,
                        )
                    } else {
                        haystack[pos + idx].clone()
                    };

                    let mut matches = if let Some(ref test) = test_fn {
                        let result = super::eval_system::call_function_with_values(
                            test.clone(),
                            &[needle_elem.clone(), haystack_elem.clone()],
                            env,
                        )?;
                        is_truthy(&super::eval_types::primary_value(result))
                    } else {
                        values_equal(&needle_elem, &haystack_elem)
                    };
                    if negate_test {
                        matches = !matches;
                    }
                    if !matches {
                        return Ok(false);
                    }
                }
                Ok(true)
            };

            if from_end {
                for pos in (0..=(haystack.len() - needle.len())).rev() {
                    if matches_at(pos)? {
                        return Ok(EvalResult::Fixnum((start2 + pos) as i64));
                    }
                }
            } else {
                for pos in 0..=(haystack.len() - needle.len()) {
                    if matches_at(pos)? {
                        return Ok(EvalResult::Fixnum((start2 + pos) as i64));
                    }
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
            if args.len() < 2 {
                return Err("count-if requires predicate and sequence".to_string());
            }
            let (predicate, seq) =
                if is_sequence_value(&args[0]) && is_function_designator(&args[1]) {
                    // Some MLIR call paths can supply evaluated args in swapped order.
                    // Normalize to CL order here.
                    (&args[1], &args[0])
                } else {
                    (&args[0], &args[1])
                };

            let items: Vec<EvalResult> = match seq {
                EvalResult::Nil => Vec::new(),
                EvalResult::Cons(_, _) => {
                    let mut out = Vec::new();
                    let mut cur = seq.clone();
                    loop {
                        match cur {
                            EvalResult::Nil => break,
                            EvalResult::Cons(car, cdr) => {
                                out.push(car.borrow().clone());
                                cur = cdr.borrow().clone();
                            }
                            _ => return Err("count-if requires a proper sequence".to_string()),
                        }
                    }
                    out
                }
                EvalResult::Array(arr) => arr.borrow().clone(),
                EvalResult::String(s) => s.chars().map(EvalResult::Character).collect(),
                _ => return Err("count-if requires a sequence".to_string()),
            };

            let mut count = 0i64;
            for item in items {
                let result = apply_function(predicate, &[item], env)?;
                if !matches!(result, EvalResult::Nil) {
                    count += 1;
                }
            }
            Ok(EvalResult::Fixnum(count))
        }

        "count-if-not" => {
            // (count-if-not predicate sequence)
            if args.len() < 2 {
                return Err("count-if-not requires predicate and sequence".to_string());
            }
            let (predicate, seq) =
                if is_sequence_value(&args[0]) && is_function_designator(&args[1]) {
                    // Some MLIR call paths can supply evaluated args in swapped order.
                    // Normalize to CL order here.
                    (&args[1], &args[0])
                } else {
                    (&args[0], &args[1])
                };

            let items: Vec<EvalResult> = match seq {
                EvalResult::Nil => Vec::new(),
                EvalResult::Cons(_, _) => {
                    let mut out = Vec::new();
                    let mut cur = seq.clone();
                    loop {
                        match cur {
                            EvalResult::Nil => break,
                            EvalResult::Cons(car, cdr) => {
                                out.push(car.borrow().clone());
                                cur = cdr.borrow().clone();
                            }
                            _ => return Err("count-if-not requires a proper sequence".to_string()),
                        }
                    }
                    out
                }
                EvalResult::Array(arr) => arr.borrow().clone(),
                EvalResult::String(s) => s.chars().map(EvalResult::Character).collect(),
                _ => return Err("count-if-not requires a sequence".to_string()),
            };

            let mut count = 0i64;
            for item in items {
                let result = apply_function(predicate, &[item], env)?;
                if matches!(result, EvalResult::Nil) {
                    count += 1;
                }
            }
            Ok(EvalResult::Fixnum(count))
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
                                    (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
                                        EvalResult::Fixnum(a + b)
                                    }
                                    (EvalResult::Float(a), EvalResult::Float(b)) => {
                                        EvalResult::Float(a + b)
                                    }
                                    (EvalResult::Fixnum(a), EvalResult::Float(b)) => {
                                        EvalResult::Float(*a as f64 + b)
                                    }
                                    (EvalResult::Float(a), EvalResult::Fixnum(b)) => {
                                        EvalResult::Float(a + *b as f64)
                                    }
                                    _ => return Err("reduce + requires numeric values".to_string()),
                                }
                            }
                            "*" => {
                                // Multiply accumulator and value
                                match (&acc, val) {
                                    (EvalResult::Fixnum(a), EvalResult::Fixnum(b)) => {
                                        EvalResult::Fixnum(a * b)
                                    }
                                    (EvalResult::Float(a), EvalResult::Float(b)) => {
                                        EvalResult::Float(a * b)
                                    }
                                    (EvalResult::Fixnum(a), EvalResult::Float(b)) => {
                                        EvalResult::Float(*a as f64 * b)
                                    }
                                    (EvalResult::Float(a), EvalResult::Fixnum(b)) => {
                                        EvalResult::Float(a * *b as f64)
                                    }
                                    _ => return Err("reduce * requires numeric values".to_string()),
                                }
                            }
                            _ => {
                                return Err(format!(
                                    "reduce with function {} not implemented yet",
                                    name
                                ))
                            }
                        }
                    }
                    _ => {
                        return Err(
                            "reduce requires a function symbol as first argument".to_string()
                        )
                    }
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
                    if !matches!(current, EvalResult::Nil) {
                        return Err("TYPE-ERROR".to_string());
                    }
                    v
                }
                EvalResult::Array(arr) => arr.borrow().clone(),
                EvalResult::Nil => Vec::new(),
                _ => return Err("TYPE-ERROR".to_string()),
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
                EvalResult::Array(_) => Ok(EvalResult::Array(std::rc::Rc::new(
                    std::cell::RefCell::new(items),
                ))),
                _ => Ok(EvalResult::Nil),
            }
        }

        "merge" => {
            // (merge result-type sequence1 sequence2 predicate &key key)
            if args.len() < 4 {
                return Err(
                    "merge requires result-type, sequence1, sequence2, and predicate".to_string(),
                );
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
            let newitem = args
                .get(0)
                .cloned()
                .ok_or_else(|| "substitute requires newitem".to_string())?;
            let olditem = args
                .get(1)
                .cloned()
                .ok_or_else(|| "substitute requires olditem".to_string())?;
            let sequence = args
                .get(2)
                .cloned()
                .ok_or_else(|| "substitute requires sequence".to_string())?;

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
                        _ => {
                            return Err(
                                "substitute on strings requires character newitem".to_string()
                            )
                        }
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
                                let replaced = if matches(&item)? {
                                    newitem.clone()
                                } else {
                                    item
                                };
                                items.push(replaced);
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => {
                                return Err(
                                    "substitute requires a proper list or string".to_string()
                                )
                            }
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
            let newitem = args
                .get(0)
                .cloned()
                .ok_or_else(|| "substitute-if requires newitem".to_string())?;
            let predicate = args
                .get(1)
                .cloned()
                .ok_or_else(|| "substitute-if requires predicate".to_string())?;
            let sequence = args
                .get(2)
                .cloned()
                .ok_or_else(|| "substitute-if requires sequence".to_string())?;

            match sequence {
                EvalResult::String(s) => {
                    let new_ch = match newitem {
                        EvalResult::Character(c) => c,
                        _ => {
                            return Err(
                                "substitute-if on strings requires character newitem".to_string()
                            )
                        }
                    };
                    let mut result = String::new();
                    for ch in s.chars() {
                        let pred_val =
                            apply_function(&predicate, &[EvalResult::Character(ch)], env)?;
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
                                let replaced = if is_truthy(&pred_val) {
                                    newitem.clone()
                                } else {
                                    item
                                };
                                items.push(replaced);
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => {
                                return Err(
                                    "substitute-if requires a proper list or string".to_string()
                                )
                            }
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
    !matches!(
        val,
        EvalResult::Nil | EvalResult::Bool(false) | EvalResult::Boolean(false)
    )
}
