/// eval_list2.rs - Additional Common Lisp list operations
use super::eval_types::EvalResult;
use std::cell::RefCell;
use std::rc::Rc;

pub fn call_list2_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "copy-list" => {
            // Shallow copy of a list
            match args.get(0) {
                Some(EvalResult::Nil) => Ok(EvalResult::Nil),
                Some(EvalResult::Cons(car, cdr)) => {
                    fn copy_list_recursive(lst: &EvalResult) -> EvalResult {
                        match lst {
                            EvalResult::Cons(car, cdr) => EvalResult::Cons(
                                Rc::clone(car),
                                Rc::new(RefCell::new(copy_list_recursive(&cdr.borrow()))),
                            ),
                            other => other.clone(),
                        }
                    }
                    Ok(copy_list_recursive(&EvalResult::Cons(
                        Rc::clone(car),
                        Rc::clone(cdr),
                    )))
                }
                _ => Err("copy-list requires a list".to_string()),
            }
        }

        "copy-tree" => {
            // Deep copy of a tree structure
            match args.get(0) {
                Some(arg) => {
                    fn copy_tree_recursive(tree: &EvalResult) -> EvalResult {
                        match tree {
                            EvalResult::Cons(car, cdr) => EvalResult::Cons(
                                Rc::new(RefCell::new(copy_tree_recursive(&car.borrow()))),
                                Rc::new(RefCell::new(copy_tree_recursive(&cdr.borrow()))),
                            ),
                            other => other.clone(),
                        }
                    }
                    Ok(copy_tree_recursive(arg))
                }
                _ => Err("copy-tree requires an argument".to_string()),
            }
        }

        "nconc" => {
            // Destructively concatenate lists
            if args.is_empty() {
                return Ok(EvalResult::Nil);
            }

            // Find first non-nil list
            let mut result = EvalResult::Nil;
            let mut result_tail: Option<Rc<RefCell<EvalResult>>> = None;

            for arg in args {
                match arg {
                    EvalResult::Nil => continue,
                    EvalResult::Cons(_, _) => {
                        if matches!(result, EvalResult::Nil) {
                            result = arg.clone();
                            // Find tail of this list
                            let mut current = arg.clone();
                            loop {
                                match current {
                                    EvalResult::Cons(_, cdr) => {
                                        let cdr_val = cdr.borrow().clone();
                                        if matches!(cdr_val, EvalResult::Nil) {
                                            result_tail = Some(Rc::clone(&cdr));
                                            break;
                                        }
                                        current = cdr_val;
                                    }
                                    _ => break,
                                }
                            }
                        } else if let Some(ref tail) = result_tail {
                            *tail.borrow_mut() = arg.clone();
                            // Find new tail
                            let mut current = arg.clone();
                            loop {
                                match current {
                                    EvalResult::Cons(_, cdr) => {
                                        let cdr_val = cdr.borrow().clone();
                                        if matches!(cdr_val, EvalResult::Nil) {
                                            result_tail = Some(Rc::clone(&cdr));
                                            break;
                                        }
                                        current = cdr_val;
                                    }
                                    _ => break,
                                }
                            }
                        }
                    }
                    _ => return Err("nconc requires lists".to_string()),
                }
            }
            Ok(result)
        }

        "nthcdr" => {
            // (nthcdr n list) - cdr n times
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::Fixnum(n)), Some(list)) if *n >= 0 => {
                    let mut result = list.clone();
                    for _ in 0..*n {
                        match result {
                            EvalResult::Cons(_, cdr) => {
                                result = cdr.borrow().clone();
                            }
                            _ => return Ok(EvalResult::Nil),
                        }
                    }
                    Ok(result)
                }
                (Some(EvalResult::Float(n)), Some(list)) if *n >= 0.0 => {
                    let n = *n as i64;
                    let mut result = list.clone();
                    for _ in 0..n {
                        match result {
                            EvalResult::Cons(_, cdr) => {
                                result = cdr.borrow().clone();
                            }
                            _ => return Ok(EvalResult::Nil),
                        }
                    }
                    Ok(result)
                }
                (Some(EvalResult::Bignum(b)), Some(_)) if *b >= malachite::Integer::from(0) => {
                    // Bignum index is always past the end of any list
                    Ok(EvalResult::Nil)
                }
                _ => Err("TYPE-ERROR".to_string()),
            }
        }

        "revappend" => {
            // (revappend list1 list2) - reverse list1 and append list2
            match (args.get(0), args.get(1)) {
                (Some(list1), Some(list2)) => {
                    // Reverse list1
                    let mut reversed = EvalResult::Nil;
                    let mut current = list1.clone();
                    loop {
                        match current {
                            EvalResult::Cons(car, cdr) => {
                                reversed = EvalResult::Cons(
                                    Rc::clone(&car),
                                    Rc::new(RefCell::new(reversed)),
                                );
                                current = cdr.borrow().clone();
                            }
                            EvalResult::Nil => break,
                            _ => return Err("revappend requires lists".to_string()),
                        }
                    }

                    // Append list2
                    if matches!(reversed, EvalResult::Nil) {
                        Ok(list2.clone())
                    } else {
                        // Find tail of reversed and set it to list2
                        let result = reversed.clone();
                        let mut current = reversed;
                        loop {
                            match current {
                                EvalResult::Cons(_, cdr) => {
                                    let cdr_val = cdr.borrow().clone();
                                    if matches!(cdr_val, EvalResult::Nil) {
                                        *cdr.borrow_mut() = list2.clone();
                                        break;
                                    }
                                    current = cdr_val;
                                }
                                _ => break,
                            }
                        }
                        Ok(result)
                    }
                }
                _ => Err("revappend requires 2 lists".to_string()),
            }
        }

        "mapc" | "mapcan" | "mapcon" | "mapl" | "maplist" => {
            // These require function call support - stub for now
            Err(format!(
                "{} not fully implemented yet - requires function call integration",
                name
            ))
        }

        "listSTAR" | "list*" => {
            // (list* 1 2 3 '(4 5)) => (1 2 3 4 5)
            // Last argument becomes the final cdr
            if args.is_empty() {
                return Err("list* requires at least 1 argument".to_string());
            }
            if args.len() == 1 {
                return Ok(args[0].clone());
            }

            let mut result = args[args.len() - 1].clone();
            for arg in args[..args.len() - 1].iter().rev() {
                result = EvalResult::Cons(
                    Rc::new(RefCell::new(arg.clone())),
                    Rc::new(RefCell::new(result)),
                );
            }
            Ok(result)
        }

        "make-list" => {
            // (make-list n &key initial-element)
            match args.get(0) {
                Some(EvalResult::Fixnum(n)) if *n >= 0 => {
                    let elem = args.get(1).cloned().unwrap_or(EvalResult::Nil);
                    let mut result = EvalResult::Nil;
                    for _ in 0..*n {
                        result = EvalResult::Cons(
                            Rc::new(RefCell::new(elem.clone())),
                            Rc::new(RefCell::new(result)),
                        );
                    }
                    Ok(result)
                }
                _ => Err("TYPE-ERROR".to_string()),
            }
        }

        "nbutlast" => {
            // Remove last n elements destructively
            match (args.get(0), args.get(1)) {
                (Some(list), Some(EvalResult::Fixnum(n))) if *n > 0 => {
                    // Count list length
                    let mut len = 0;
                    let mut current = list.clone();
                    loop {
                        match current {
                            EvalResult::Cons(_, cdr) => {
                                len += 1;
                                current = cdr.borrow().clone();
                            }
                            _ => break,
                        }
                    }

                    let keep = len - n;
                    if keep <= 0 {
                        return Ok(EvalResult::Nil);
                    }

                    // Find element at position keep-1 and set its cdr to nil
                    let mut current = list.clone();
                    for i in 0..keep - 1 {
                        match current {
                            EvalResult::Cons(_, cdr) => {
                                current = cdr.borrow().clone();
                            }
                            _ => return Ok(EvalResult::Nil),
                        }
                    }

                    match current {
                        EvalResult::Cons(_, cdr) => {
                            *cdr.borrow_mut() = EvalResult::Nil;
                            Ok(list.clone())
                        }
                        _ => Ok(EvalResult::Nil),
                    }
                }
                (Some(_), Some(EvalResult::Fixnum(_))) => Err("TYPE-ERROR".to_string()),
                (Some(list), None) => {
                    // Default is to remove 1 element
                    // Count list length
                    let mut len = 0;
                    let mut current = list.clone();
                    loop {
                        match current {
                            EvalResult::Cons(_, cdr) => {
                                len += 1;
                                current = cdr.borrow().clone();
                            }
                            _ => break,
                        }
                    }

                    if len <= 1 {
                        return Ok(EvalResult::Nil);
                    }

                    // Find element at position len-2 and set its cdr to nil
                    let mut current = list.clone();
                    for _ in 0..len - 2 {
                        match current {
                            EvalResult::Cons(_, cdr) => {
                                current = cdr.borrow().clone();
                            }
                            _ => return Ok(EvalResult::Nil),
                        }
                    }

                    match current {
                        EvalResult::Cons(_, cdr) => {
                            *cdr.borrow_mut() = EvalResult::Nil;
                            Ok(list.clone())
                        }
                        _ => Ok(EvalResult::Nil),
                    }
                }
                (Some(_), Some(EvalResult::Bignum(b))) => {
                    if b < &malachite::Integer::from(0) {
                        Err("TYPE-ERROR".to_string())
                    } else {
                        Ok(EvalResult::Nil)
                    }
                }
                _ => Err("TYPE-ERROR".to_string()),
            }
        }

        _ => Err(format!("Unknown list2 builtin: {}", name)),
    }
}
