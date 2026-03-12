/// eval_array.rs - Common Lisp array and vector operations
use super::eval_system::{
    get_array_dims, get_array_displacement, get_array_fill_pointer, is_array_adjustable,
    register_array_dims_for_bridge, set_array_adjustable, set_array_displacement,
    set_array_fill_pointer,
};
use super::eval_types::EvalResult;
use std::cell::RefCell;
use std::rc::Rc;

fn as_usize(value: &EvalResult, name: &str) -> Result<usize, String> {
    match value {
        EvalResult::Fixnum(n) if *n >= 0 => Ok(*n as usize),
        EvalResult::Float(f) if *f >= 0.0 => Ok(*f as usize),
        EvalResult::Bool(n) => Ok(*n as usize),
        EvalResult::Boolean(n) => Ok(*n as usize),
        _ => Err(format!("{} must be a non-negative integer", name)),
    }
}

fn as_bool(value: &EvalResult) -> Result<bool, String> {
    match value {
        EvalResult::Nil => Ok(false),
        EvalResult::Bool(b) | EvalResult::Boolean(b) => Ok(*b),
        EvalResult::Symbol(s) => Ok(s.eq_ignore_ascii_case("t")),
        EvalResult::Fixnum(n) => Ok(*n != 0),
        EvalResult::Float(f) => Ok(*f != 0.0),
        _ => Err("Invalid boolean value".to_string()),
    }
}

fn parse_dims(value: &EvalResult) -> Result<Vec<usize>, String> {
    match value {
        EvalResult::Nil => Ok(Vec::new()),
        EvalResult::Fixnum(n) if *n >= 0 => Ok(vec![*n as usize]),
        EvalResult::Float(f) if *f >= 0.0 => Ok(vec![*f as usize]),
        EvalResult::Cons(_, _) => {
            let mut dims = Vec::new();
            let mut current = value.clone();
            while let EvalResult::Cons(car, cdr) = current {
                dims.push(as_usize(&car.borrow(), "dimension")?);
                current = cdr.borrow().clone();
            }
            if matches!(current, EvalResult::Nil) {
                Ok(dims)
            } else {
                Err("dimensions must be a proper list".to_string())
            }
        }
        _ => Err("make-array dimensions must be a non-negative integer or list".to_string()),
    }
}

fn flatten_contents(value: &EvalResult, out: &mut Vec<EvalResult>) {
    match value {
        EvalResult::Cons(car, cdr) => {
            flatten_contents(&car.borrow(), out);
            flatten_contents(&cdr.borrow(), out);
        }
        EvalResult::Array(arr) => {
            for elem in arr.borrow().iter() {
                out.push(elem.clone());
            }
        }
        EvalResult::String(s) => {
            out.extend(s.chars().map(EvalResult::Character));
        }
        EvalResult::Nil => {}
        other => out.push(other.clone()),
    }
}

fn bit_like(v: &EvalResult) -> bool {
    matches!(
        v,
        EvalResult::Fixnum(0)
            | EvalResult::Fixnum(1)
            | EvalResult::Bool(false)
            | EvalResult::Bool(true)
            | EvalResult::Boolean(false)
            | EvalResult::Boolean(true)
            | EvalResult::Nil
    )
}

fn build_int_list(values: &[usize]) -> EvalResult {
    let mut out = EvalResult::Nil;
    for n in values.iter().rev() {
        out = EvalResult::Cons(
            Rc::new(RefCell::new(EvalResult::Fixnum(*n as i64))),
            Rc::new(RefCell::new(out)),
        );
    }
    out
}

pub fn call_array_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        // Array predicates
        "arrayp" => Ok(EvalResult::Boolean(matches!(
            args.get(0),
            Some(EvalResult::Array(_)) | Some(EvalResult::String(_))
        ))),

        "vectorp" => {
            let rank = match args.get(0) {
                Some(EvalResult::Array(arr)) => get_array_dims(arr).len(),
                Some(EvalResult::String(_)) => 1,
                _ => return Ok(EvalResult::Boolean(false)),
            };
            Ok(EvalResult::Boolean(rank == 1))
        }

        "simple-vector-p" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => {
                    let dims = get_array_dims(arr);
                    let fp = get_array_fill_pointer(arr);
                    let adjustable = is_array_adjustable(arr);
                    let displaced = get_array_displacement(arr).is_some();
                    Ok(EvalResult::Boolean(dims.len() == 1 && fp.is_none() && !adjustable && !displaced))
                }
                Some(EvalResult::String(_)) => Ok(EvalResult::Boolean(false)),
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        "bit-vector-p" | "simple-bit-vector-p" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => {
                    let dims = get_array_dims(arr);
                    if dims.len() != 1 {
                        return Ok(EvalResult::Boolean(false));
                    }
                    if name == "simple-bit-vector-p" {
                        let fp = get_array_fill_pointer(arr).is_some();
                        let displaced = get_array_displacement(arr).is_some();
                        let adjustable = is_array_adjustable(arr);
                        if fp || displaced || adjustable {
                            return Ok(EvalResult::Boolean(false));
                        }
                    }
                    let values = arr.borrow();
                    Ok(EvalResult::Boolean(values.iter().all(bit_like)))
                }
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        "adjustable-array-p" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => Ok(EvalResult::Boolean(is_array_adjustable(arr))),
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        // Array creation
        "make-array" => {
            if args.is_empty() {
                return Err("make-array requires at least 1 argument".to_string());
            }
            if args.len() % 2 == 0 {
                // First arg is dimensions; remaining pairs are keyword arguments.
                // If even, one keyword is missing its value.
                return Err("make-array requires even keyword argument count".to_string());
            }

            let dims = parse_dims(&args[0])?;
            let size: usize = dims.iter().copied().product();

            let mut initial_element = EvalResult::Nil;
            let mut initial_contents: Option<EvalResult> = None;
            let mut displaced_to: Option<EvalResult> = None;
            let mut displaced_offset: usize = 0;
            let mut adjustable = false;
            let mut fill_pointer: Option<usize> = None;

            let mut i = 1usize;
            while i + 1 < args.len() {
                let key = match &args[i] {
                    EvalResult::Symbol(s) => s.rsplit(':').next().unwrap_or(s).trim_start_matches(':').to_ascii_lowercase(),
                    _ => return Err("make-array expects keyword names".to_string()),
                };
                let value = args[i + 1].clone();
                match key.as_str() {
                    "initial-element" => initial_element = value,
                    "initial-contents" => initial_contents = Some(value),
                    "displaced-to" => displaced_to = Some(value),
                    "displaced-index-offset" => {
                        displaced_offset = as_usize(&value, "displaced-index-offset")?;
                    }
                    "adjustable" => {
                        adjustable = as_bool(&value)?;
                    }
                    "fill-pointer" => {
                        fill_pointer = match value {
                            EvalResult::Nil
                            | EvalResult::Bool(false)
                            | EvalResult::Boolean(false) => None,
                            EvalResult::Bool(true)
                            | EvalResult::Boolean(true) => Some(size),
                            EvalResult::Symbol(s) if s.eq_ignore_ascii_case("t") => Some(size),
                            _ => Some(as_usize(&value, "fill-pointer")?),
                        };
                    }
                    _ => {}
                }
                i += 2;
            }

            if let Some(fp) = fill_pointer {
                if dims.len() != 1 {
                    return Err("make-array :fill-pointer only valid for 1-D arrays".to_string());
                }
                if fp > size {
                    return Err("make-array :fill-pointer out of range".to_string());
                }
            }

            let storage = if let Some(displaced) = displaced_to.as_ref() {
                let source: Vec<EvalResult> = match displaced {
                    EvalResult::Array(a) => a.borrow().clone(),
                    EvalResult::String(s) => s.chars().map(EvalResult::Character).collect(),
                    EvalResult::Cons(_, _) => {
                        let mut flat = Vec::new();
                        flatten_contents(displaced, &mut flat);
                        flat
                    }
                    _ => return Err("make-array :displaced-to requires an array, string, or list".to_string()),
                };
                let mut out = Vec::with_capacity(size);
                for idx in 0..size {
                    out.push(source.get(displaced_offset + idx).cloned().unwrap_or(EvalResult::Nil));
                }
                out
            } else if let Some(contents) = initial_contents {
                let mut flat = Vec::new();
                flatten_contents(&contents, &mut flat);
                if flat.len() > size {
                    flat.truncate(size);
                } else if flat.len() < size {
                    flat.resize(size, EvalResult::Nil);
                }
                flat
            } else {
                vec![initial_element; size]
            };

            let array = Rc::new(RefCell::new(storage));
            register_array_dims_for_bridge(&array, dims);
            set_array_adjustable(&array, adjustable);
            set_array_fill_pointer(&array, fill_pointer);
            set_array_displacement(&array, displaced_to, displaced_offset);
            Ok(EvalResult::Array(array))
        }

        "vector" => {
            let array = Rc::new(RefCell::new(args.to_vec()));
            register_array_dims_for_bridge(&array, vec![array.borrow().len()]);
            set_array_adjustable(&array, false);
            set_array_displacement(&array, None, 0);
            set_array_fill_pointer(&array, None);
            Ok(EvalResult::Array(array))
        }

        // Array access
        "aref" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => {
                    let dims = get_array_dims(arr);
                    let values = arr.borrow();
                    if dims.is_empty() {
                        if args.len() != 1 {
                            return Err("aref on scalar array takes no subscripts".to_string());
                        }
                        return values
                            .get(0)
                            .cloned()
                            .ok_or_else(|| "aref out of bounds".to_string());
                    }
                    if args.len() != dims.len() + 1 {
                        return Err("aref wrong number of subscripts".to_string());
                    }
                    let mut linear = 0usize;
                    for (axis, dim) in dims.iter().enumerate() {
                        let index = as_usize(
                            args.get(axis + 1)
                                .ok_or("aref requires subscript for each dimension")?,
                            "index",
                        )?;
                        if index >= *dim {
                            return Err("aref index out of bounds".to_string());
                        }
                        linear = linear.saturating_mul(*dim).saturating_add(index);
                    }
                    values
                        .get(linear)
                        .cloned()
                        .ok_or_else(|| "aref index out of bounds".to_string())
                }
                Some(EvalResult::String(s)) => {
                    if args.len() != 2 {
                        return Err("aref on string requires one index".to_string());
                    }
                    let idx = as_usize(args.get(1).ok_or("aref requires index")?, "index")?;
                    s.chars()
                        .nth(idx)
                        .map(EvalResult::Character)
                        .ok_or_else(|| "aref index out of bounds".to_string())
                }
                _ => Err("aref requires an array".to_string()),
            }
        }

        "svref" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => {
                    let dims = get_array_dims(arr);
                    if dims.len() != 1 {
                        return Err("svref requires a vector".to_string());
                    }
                    let index = as_usize(args.get(1).ok_or("svref requires index")?, "index")?;
                    arr.borrow()
                        .get(index)
                        .cloned()
                        .ok_or_else(|| "svref index out of bounds".to_string())
                }
                Some(EvalResult::String(s)) => {
                    let index = as_usize(args.get(1).ok_or("svref requires index")?, "index")?;
                    s.chars()
                        .nth(index)
                        .map(EvalResult::Character)
                        .ok_or_else(|| "svref index out of bounds".to_string())
                }
                _ => Err("svref requires a vector".to_string()),
            }
        }

        "row-major-aref" => {
            if args.len() != 2 {
                return Err("row-major-aref requires array and index".to_string());
            }
            let idx = as_usize(args.get(1).ok_or("row-major-aref requires index")?, "index")?;
            match args.get(0) {
                Some(EvalResult::Array(arr)) => arr.borrow().get(idx).cloned().ok_or_else(|| "row-major-aref out of bounds".to_string()),
                Some(EvalResult::String(s)) => s.chars().nth(idx).map(EvalResult::Character).ok_or_else(|| "row-major-aref out of bounds".to_string()),
                _ => Err("row-major-aref requires an array".to_string()),
            }
        }

        // Array info
        "array-dimension" => {
            if args.len() != 2 {
                return Err("array-dimension requires 2 args".to_string());
            }
            let axis = as_usize(args.get(1).ok_or("array-dimension requires axis")?, "axis-number")?;
            match args.get(0) {
                Some(EvalResult::Array(arr)) => get_array_dims(arr)
                    .get(axis)
                    .map(|d| EvalResult::Fixnum(*d as i64))
                    .ok_or_else(|| "array-dimension axis out of range".to_string()),
                Some(EvalResult::String(s)) => {
                    if axis == 0 {
                        Ok(EvalResult::Fixnum(s.chars().count() as i64))
                    } else {
                        Err("array-dimension axis out of range".to_string())
                    }
                }
                _ => Err("array-dimension requires an array".to_string()),
            }
        }

        "array-dimensions" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => Ok(build_int_list(&get_array_dims(arr))),
                Some(EvalResult::String(s)) => Ok(build_int_list(&[s.chars().count()])),
                _ => Err("array-dimensions requires an array".to_string()),
            }
        }

        "array-rank" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => Ok(EvalResult::Fixnum(get_array_dims(arr).len() as i64)),
                Some(EvalResult::String(_)) => Ok(EvalResult::Fixnum(1)),
                _ => Err("array-rank requires an array".to_string()),
            }
        }

        "array-total-size" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => Ok(EvalResult::Fixnum(arr.borrow().len() as i64)),
                Some(EvalResult::String(s)) => Ok(EvalResult::Fixnum(s.chars().count() as i64)),
                _ => Err("array-total-size requires an array".to_string()),
            }
        }

        "array-in-bounds-p" => {
            if args.is_empty() {
                return Err("array-in-bounds-p requires at least an array".to_string());
            }
            let (kind, dims) = match args.get(0) {
                Some(EvalResult::Array(arr)) => ("array", get_array_dims(arr)),
                Some(EvalResult::String(s)) => ("string", vec![s.chars().count()]),
                _ => return Err("array-in-bounds-p requires an array".to_string()),
            };

            if kind == "string" && args.len() != 2 {
                return Ok(EvalResult::Boolean(false));
            }
            if dims.is_empty() {
                return Ok(EvalResult::Boolean(args.len() == 1));
            }
            if args.len() != dims.len() + 1 {
                return Ok(EvalResult::Boolean(false));
            }
            for (i, dim) in dims.iter().enumerate() {
                let index = as_usize(
                    args.get(i + 1).ok_or("array-in-bounds-p requires subscript")?,
                    "subscript",
                )?;
                if index >= *dim {
                    return Ok(EvalResult::Boolean(false));
                }
            }
            Ok(EvalResult::Boolean(true))
        }

        "array-row-major-index" => {
            if args.len() < 2 {
                return Err("array-row-major-index requires an array and subscripts".to_string());
            }
            let dims = match args.get(0) {
                Some(EvalResult::Array(arr)) => get_array_dims(arr),
                Some(EvalResult::String(s)) => vec![s.chars().count()],
                _ => return Err("array-row-major-index requires an array".to_string()),
            };
            if dims.is_empty() {
                if args.len() == 1 {
                    return Ok(EvalResult::Fixnum(0));
                }
                return Err("array-row-major-index requires no subscripts for rank-0 arrays".to_string());
            }
            if args.len() != dims.len() + 1 {
                return Err("array-row-major-index requires one index per dimension".to_string());
            }
            let mut index = 0usize;
            for (i, dim) in dims.iter().enumerate() {
                let sub = as_usize(
                    args.get(i + 1).ok_or("array-row-major-index requires subscript")?,
                    "subscript",
                )?;
                if sub >= *dim {
                    return Err("array-row-major-index subscript out of bounds".to_string());
                }
                index = index.saturating_mul(*dim).saturating_add(sub);
            }
            Ok(EvalResult::Fixnum(index as i64))
        }

        // Array properties
        "array-element-type" => {
            match args.get(0) {
                Some(EvalResult::String(_)) => Ok(EvalResult::Symbol("CHARACTER".to_string())),
                Some(EvalResult::Array(_)) => Ok(EvalResult::Symbol("T".to_string())),
                _ => Err("array-element-type requires an array".to_string()),
            }
        }

        "array-has-fill-pointer-p" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => Ok(EvalResult::Boolean(get_array_fill_pointer(arr).is_some())),
                _ => Ok(EvalResult::Boolean(false)),
            }
        }

        "fill-pointer" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => get_array_fill_pointer(arr)
                    .map(|fp| EvalResult::Fixnum(fp as i64))
                    .ok_or_else(|| "fill-pointer only for vector with fill pointer".to_string()),
                _ => Err("fill-pointer requires a vector".to_string()),
            }
        }

        "array-displacement" => {
            match args.get(0) {
                Some(EvalResult::Array(arr)) => {
                    if let Some((displaced, offset)) = get_array_displacement(arr) {
                        Ok(EvalResult::MultipleValues(vec![
                            displaced,
                            EvalResult::Fixnum(offset as i64),
                        ]))
                    } else {
                        Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Fixnum(0)]))
                    }
                }
                _ => Ok(EvalResult::MultipleValues(vec![EvalResult::Nil, EvalResult::Fixnum(0)])),
            }
        }

        // Aliases with different naming conventions (camelCase)
        "arrayDimension" => match args.get(0) {
            Some(EvalResult::Array(arr)) => Ok(EvalResult::Fixnum(get_array_dims(arr).len() as i64)),
            Some(EvalResult::String(s)) => Ok(EvalResult::Fixnum(s.chars().count() as i64)),
            _ => Err("arrayDimension requires an array".to_string()),
        },

        "arrayDimensions" => match args.get(0) {
            Some(EvalResult::Array(arr)) => Ok(build_int_list(&get_array_dims(arr))),
            Some(EvalResult::String(s)) => Ok(build_int_list(&[s.chars().count()])),
            _ => Err("arrayDimensions requires an array".to_string()),
        },

        "arrayElementType" => match args.get(0) {
            Some(EvalResult::String(_)) => Ok(EvalResult::Symbol("CHARACTER".to_string())),
            Some(EvalResult::Array(_)) => Ok(EvalResult::Symbol("T".to_string())),
            _ => Err("arrayElementType requires an array".to_string()),
        },

        "arrayHasFillPointerP" => match args.get(0) {
            Some(EvalResult::Array(arr)) => Ok(EvalResult::Boolean(get_array_fill_pointer(arr).is_some())),
            _ => Ok(EvalResult::Boolean(false)),
        },

        "arrayRowMajorIndex" => {
            if args.len() < 2 {
                return Err("arrayRowMajorIndex requires array and subscripts".to_string());
            }
            let dims = match args.get(0) {
                Some(EvalResult::Array(arr)) => get_array_dims(arr),
                Some(EvalResult::String(s)) => vec![s.chars().count()],
                _ => return Err("arrayRowMajorIndex requires an array".to_string()),
            };
            if dims.is_empty() {
                if args.len() == 1 {
                    return Ok(EvalResult::Fixnum(0));
                }
                return Err("arrayRowMajorIndex requires no subscripts for rank-0 arrays".to_string());
            }
            if args.len() != dims.len() + 1 {
                return Err("arrayRowMajorIndex requires one index per dimension".to_string());
            }
            let mut index = 0usize;
            for (i, dim) in dims.iter().enumerate() {
                let sub = as_usize(
                    args.get(i + 1).ok_or("arrayRowMajorIndex requires subscript")?,
                    "subscript",
                )?;
                if sub >= *dim {
                    return Err("arrayRowMajorIndex subscript out of bounds".to_string());
                }
                index = index.saturating_mul(*dim).saturating_add(sub);
            }
            Ok(EvalResult::Fixnum(index as i64))
        },

        "arrayTotalSize" => match args.get(0) {
            Some(EvalResult::Array(arr)) => Ok(EvalResult::Fixnum(arr.borrow().len() as i64)),
            Some(EvalResult::String(s)) => Ok(EvalResult::Fixnum(s.chars().count() as i64)),
            _ => Err("arrayTotalSize requires an array".to_string()),
        },

        "fillPointer" => match args.get(0) {
            Some(EvalResult::Array(arr)) => get_array_fill_pointer(arr)
                .map(|v| EvalResult::Fixnum(v as i64))
                .ok_or_else(|| "fillPointer only for vectors with fill pointers".to_string()),
            _ => Err("fillPointer requires a vector".to_string()),
        },

        "rowMajorAref" => {
            if args.len() != 2 {
                return Err("rowMajorAref requires array and index".to_string());
            }
            let idx = as_usize(args.get(1).ok_or("rowMajorAref requires index")?, "index")?;
            match args.get(0) {
                Some(EvalResult::Array(arr)) => arr.borrow().get(idx).cloned().ok_or_else(|| "rowMajorAref out of bounds".to_string()),
                Some(EvalResult::String(s)) => s.chars().nth(idx).map(EvalResult::Character).ok_or_else(|| "rowMajorAref out of bounds".to_string()),
                _ => Err("rowMajorAref requires an array".to_string()),
            }
        }

        "vector-push" => {
            if args.len() != 2 {
                return Err("vector-push requires element and vector".to_string());
            }
            let vector = match &args[1] {
                EvalResult::Array(arr) => arr,
                _ => return Err("vector-push requires a vector".to_string()),
            };
            let fp = get_array_fill_pointer(vector).ok_or_else(|| "vector-push requires a vector with fill pointer".to_string())?;
            let mut cells = vector.borrow_mut();
            if fp >= cells.len() {
                return Ok(EvalResult::Nil);
            }
            cells[fp] = args[0].clone();
            set_array_fill_pointer(vector, Some(fp + 1));
            Ok(EvalResult::Fixnum(fp as i64))
        }

        "vector-push-extend" => {
            if args.len() < 2 {
                return Err("vector-push-extend requires element and vector".to_string());
            }
            let vector = match &args[1] {
                EvalResult::Array(arr) => arr,
                _ => return Err("vector-push-extend requires a vector".to_string()),
            };
            let fp = get_array_fill_pointer(vector)
                .ok_or_else(|| "vector-push-extend requires a vector with fill pointer".to_string())?;
            let extension = args.get(2).map(|v| as_usize(v, "extension-size").unwrap_or(1)).unwrap_or(1);
            if extension == 0 {
                return Err("vector-push-extend extension size must be positive".to_string());
            }
            let mut cells = vector.borrow_mut();
            if fp < cells.len() {
                cells[fp] = args[0].clone();
                set_array_fill_pointer(vector, Some(fp + 1));
                return Ok(EvalResult::Fixnum(fp as i64));
            }
            if is_array_adjustable(vector) {
                let old_len = cells.len();
                cells.resize(old_len + extension, EvalResult::Nil);
                set_array_fill_pointer(vector, Some(fp + 1));
                cells[fp] = args[0].clone();
                let mut dims = get_array_dims(vector);
                if !dims.is_empty() {
                    if let Some(last) = dims.last_mut() {
                        *last += extension;
                    }
                } else {
                    dims.push(1);
                }
                register_array_dims_for_bridge(vector, dims);
                return Ok(EvalResult::Fixnum(fp as i64));
            }
            Ok(EvalResult::Nil)
        }

        _ => Err(format!("Unknown array builtin: {}", name)),
    }
}
