/// eval_pathname.rs - Basic pathname and file operations
use super::eval_types::EvalResult;
use std::path::{Path, PathBuf};
use std::fs;
use std::rc::Rc;
use std::cell::RefCell;

fn symbol_base_name(sym: &str) -> &str {
    sym.rsplit(':').next().unwrap_or(sym)
}

/// Extract a pathname string from various Common Lisp pathname representations
fn extract_pathname_string(arg: &EvalResult) -> Option<String> {
    match arg {
        EvalResult::String(s) => Some(s.clone()),
        EvalResult::Symbol(s) => {
            // Handle symbols that might be pathnames (strip quotes if present)
            if s.starts_with("#P\"") && s.ends_with('"') {
                Some(s[3..s.len()-1].to_string())
            } else if s.starts_with('"') && s.ends_with('"') {
                Some(s[1..s.len()-1].to_string())
            } else {
                Some(s.clone())
            }
        }
        EvalResult::Nil => {
            // NIL is a valid pathname in CL meaning "no pathname"
            // Return None to indicate this case (caller should handle appropriately)
            None
        }
        EvalResult::Cons(car, cdr) => {
            // Handle pathname structures like (pathname "...")
            let car_val = car.borrow();
            if let EvalResult::Symbol(sym) = &*car_val {
                if symbol_base_name(sym).eq_ignore_ascii_case("pathname") {
                    let cdr_val = cdr.borrow();
                    if let EvalResult::Cons(path_car, _) = &*cdr_val {
                        let path_val = path_car.borrow();
                        return extract_pathname_string(&path_val);
                    }
                }
            }
            None
        }
        _ => None,
    }
}

fn is_pathname_object(arg: &EvalResult) -> bool {
    match arg {
        EvalResult::Cons(car, cdr) => {
            if let EvalResult::Symbol(sym) = &*car.borrow() {
                symbol_base_name(sym).eq_ignore_ascii_case("pathname")
                    && matches!(&*cdr.borrow(), EvalResult::Cons(_, _))
            } else {
                false
            }
        }
        EvalResult::Symbol(s) => s.starts_with("#P\"") && s.ends_with('"'),
        _ => false,
    }
}

fn make_pathname_object_from_string(path: &str) -> EvalResult {
    EvalResult::Cons(
        Rc::new(RefCell::new(EvalResult::Symbol("pathname".to_string()))),
        Rc::new(RefCell::new(EvalResult::Cons(
            Rc::new(RefCell::new(EvalResult::String(path.to_string()))),
            Rc::new(RefCell::new(EvalResult::Nil)),
        ))),
    )
}

fn list_to_vec(list: &EvalResult) -> Option<Vec<EvalResult>> {
    let mut items = Vec::new();
    let mut current = list.clone();
    loop {
        match current {
            EvalResult::Nil => return Some(items),
            EvalResult::Cons(car, cdr) => {
                items.push(car.borrow().clone());
                current = cdr.borrow().clone();
            }
            _ => return None,
        }
    }
}

fn directory_list_to_string(dir: &EvalResult) -> Option<String> {
    let items = list_to_vec(dir)?;
    if items.is_empty() {
        return Some(String::new());
    }

    let mut is_absolute = false;
    let mut parts: Vec<String> = Vec::new();

    for (idx, item) in items.iter().enumerate() {
        let item_str = match item {
            EvalResult::String(s) => s.clone(),
            EvalResult::Symbol(s) => s.clone(),
            EvalResult::Character(c) => c.to_string(),
            _ => return None,
        };

        if idx == 0 {
            if item_str.eq_ignore_ascii_case(":absolute") {
                is_absolute = true;
                continue;
            }
            if item_str.eq_ignore_ascii_case(":relative") {
                continue;
            }
            if item_str.eq_ignore_ascii_case(":back") {
                parts.push("..".to_string());
                continue;
            }
        }

        let trimmed = item_str.trim_matches('/');
        if !trimmed.is_empty() {
            parts.push(trimmed.to_string());
        }
    }

    let mut path = String::new();
    if is_absolute {
        path.push('/');
    }
    path.push_str(&parts.join("/"));
    Some(path)
}

fn list_pathname_designator_to_string(arg: &EvalResult) -> Option<String> {
    let items = list_to_vec(arg)?;
    if items.is_empty() {
        return Some(String::new());
    }

    let mut result: Option<String> = None;
    for item in items {
        let part = match &item {
            EvalResult::Symbol(s) if s.starts_with(':') => Some(s.trim_start_matches(':').to_string()),
            _ => extract_pathname_string(&item).or_else(|| list_pathname_designator_to_string(&item)),
        };

        let part = part?;
        result = Some(match result {
            Some(current) => PathBuf::from(current).join(part).to_string_lossy().to_string(),
            None => part,
        });
    }

    result
}

pub fn call_pathname_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "pathname" => {
            match args.get(0) {
                Some(EvalResult::Nil) => Ok(EvalResult::Nil),
                Some(arg) if is_pathname_object(arg) => Ok(arg.clone()),
                Some(arg) => {
                    if let Some(path) = extract_pathname_string(arg) {
                        Ok(make_pathname_object_from_string(&path))
                    } else if let Some(path) = list_pathname_designator_to_string(arg) {
                        Ok(make_pathname_object_from_string(&path))
                    } else {
                        Err(format!("pathname requires a pathname designator, got {:?}", arg))
                    }
                }
                None => Err("pathname requires an argument".to_string()),
            }
        }

        "pathnamep" => {
            Ok(EvalResult::Boolean(
                args.get(0).map(|a| is_pathname_object(a)).unwrap_or(false)
            ))
        }

        "make-pathname" => {
            // Extract keyword arguments
            let mut name = String::new();
            let mut type_ext = String::new();
            let mut directory = String::new();
            let mut defaults_path: Option<String> = None;

            let mut i = 0;
            while i < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    if key.starts_with(':') && i + 1 < args.len() {
                        match key.as_str() {
                            ":name" => {
                                if let EvalResult::Symbol(s) | EvalResult::String(s) = &args[i + 1] {
                                    name = if s.starts_with('"') && s.ends_with('"') {
                                        s[1..s.len()-1].to_string()
                                    } else {
                                        s.clone()
                                    };
                                }
                            }
                            ":type" => {
                                if let EvalResult::Symbol(s) | EvalResult::String(s) = &args[i + 1] {
                                    type_ext = if s.starts_with('"') && s.ends_with('"') {
                                        s[1..s.len()-1].to_string()
                                    } else {
                                        s.clone()
                                    };
                                }
                            }
                            ":directory" => {
                                match &args[i + 1] {
                                    EvalResult::Symbol(s) | EvalResult::String(s) => {
                                        directory = if s.starts_with('"') && s.ends_with('"') {
                                            s[1..s.len()-1].to_string()
                                        } else {
                                            s.clone()
                                        };
                                    }
                                    EvalResult::Cons(_, _) => {
                                        if let Some(dir_str) = directory_list_to_string(&args[i + 1]) {
                                            directory = dir_str;
                                        }
                                    }
                                    _ => {}
                                }
                            }
                            ":defaults" => {
                                if let Some(path) = extract_pathname_string(&args[i + 1]) {
                                    defaults_path = Some(path);
                                }
                            }
                            _ => {}
                        }
                        i += 2;
                    } else {
                        i += 1;
                    }
                } else {
                    i += 1;
                }
            }

            if directory.is_empty() {
                if let Some(defaults) = defaults_path {
                    let mut dir = defaults.clone();
                    if dir.ends_with('/') {
                        dir = dir.trim_end_matches('/').to_string();
                    } else if let Some(parent) = Path::new(&dir).parent().and_then(|p| p.to_str()) {
                        dir = parent.to_string();
                    }
                    directory = dir;
                }
            }

            // Construct pathname
            let mut path = directory;
            if !path.is_empty() && !path.ends_with('/') {
                path.push('/');
            }
            path.push_str(&name);
            if !type_ext.is_empty() {
                path.push('.');
                path.push_str(&type_ext);
            }
            if name.is_empty() && type_ext.is_empty() && !path.is_empty() && !path.ends_with('/') {
                path.push('/');
            }

            Ok(make_pathname_object_from_string(&path))
        }

        "pathname-name" => {
            match args.get(0) {
                Some(EvalResult::Nil) => Ok(EvalResult::Nil), // NIL pathname -> NIL name
                Some(arg) => {
                    match extract_pathname_string(arg) {
                        Some(s) => {
                            if s.ends_with('/') {
                                return Ok(EvalResult::Nil);
                            }
                            let path = Path::new(&s);
                            Ok(EvalResult::String(
                                path.file_stem()
                                    .and_then(|s| s.to_str())
                                    .unwrap_or("")
                                    .to_string()
                            ))
                        }
                        None => Err("pathname-name requires a pathname".to_string()),
                    }
                }
                None => Err("pathname-name requires an argument".to_string()),
            }
        }

        "pathname-type" => {
            match args.get(0) {
                Some(EvalResult::Nil) => return Ok(EvalResult::Nil), // NIL pathname -> NIL type
                _ => {}
            }
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    if s.ends_with('/') {
                        return Ok(EvalResult::Nil);
                    }
                    let path = Path::new(&s);
                    Ok(EvalResult::String(
                        path.extension()
                            .and_then(|s| s.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                None => Err("pathname-type requires a pathname".to_string()),
            }
        }

        "pathname-directory" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    let is_absolute = s.starts_with('/');
                    let dir_path = if s.ends_with('/') {
                        s.trim_end_matches('/').to_string()
                    } else {
                        Path::new(&s)
                            .parent()
                            .and_then(|p| p.to_str())
                            .unwrap_or("")
                            .to_string()
                    };

                    if dir_path.is_empty() {
                        return Ok(EvalResult::Nil);
                    }

                    let mut items = Vec::new();
                    if is_absolute {
                        items.push(EvalResult::Symbol(":absolute".to_string()));
                    } else {
                        items.push(EvalResult::Symbol(":relative".to_string()));
                    }

                    for part in dir_path.split('/').filter(|p| !p.is_empty()) {
                        items.push(EvalResult::String(part.to_string()));
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
                None => Err("pathname-directory requires a pathname".to_string()),
            }
        }

        "pathname-host" | "pathname-device" | "pathname-version" => {
            Ok(EvalResult::Nil)
        }

        "namestring" | "file-namestring" | "directory-namestring" | "host-namestring" | "enough-namestring" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => Ok(EvalResult::String(s)),
                None => Ok(EvalResult::String("".to_string())),
            }
        }

        "parse-namestring" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => Ok(make_pathname_object_from_string(&s)),
                None => Err("parse-namestring requires a string".to_string()),
            }
        }

        "merge-pathnames" => {
            let path1 = args.get(0).and_then(extract_pathname_string);
            let path2 = args.get(1).and_then(extract_pathname_string);
            match (path1, path2) {
                (Some(p1), Some(p2)) => {
                    let p1_buf = PathBuf::from(&p1);
                    let p2_buf = PathBuf::from(&p2);
                    if p1_buf.is_absolute() {
                        Ok(make_pathname_object_from_string(&p1))
                    } else {
                        Ok(make_pathname_object_from_string(
                            &p2_buf.join(p1_buf).to_string_lossy().to_string(),
                        ))
                    }
                }
                (Some(p1), None) => Ok(make_pathname_object_from_string(&p1)),
                _ => Err("merge-pathnames requires pathname arguments".to_string()),
            }
        }

        "truename" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    match fs::canonicalize(&s) {
                        Ok(path) => Ok(make_pathname_object_from_string(&path.to_string_lossy().to_string())),
                        Err(_) => Err(format!("File does not exist: {}", s)),
                    }
                }
                None => Err("truename requires a pathname".to_string()),
            }
        }
        "resolve-symlinks" | "truenamize" => {
            match args.get(0).and_then(|arg| {
                extract_pathname_string(arg).or_else(|| list_pathname_designator_to_string(arg))
            }) {
                Some(s) => {
                    match fs::canonicalize(&s) {
                        Ok(path) => Ok(make_pathname_object_from_string(&path.to_string_lossy().to_string())),
                        Err(_) => Ok(make_pathname_object_from_string(&s)),
                    }
                }
                None => Err(format!("{} requires a pathname", name)),
            }
        }

        "probe-file" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    if Path::new(&s).exists() {
                        Ok(make_pathname_object_from_string(&s))
                    } else {
                        Ok(EvalResult::Nil)
                    }
                }
                None => Ok(EvalResult::Nil),
            }
        }

        "file-length" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    match fs::metadata(&s) {
                        Ok(meta) => Ok(EvalResult::Fixnum(meta.len() as i64)),
                        Err(_) => Err(format!("Cannot get file length: {}", s)),
                    }
                }
                None => Err("file-length requires a file stream or pathname".to_string()),
            }
        }

        "file-position" => {
            Ok(EvalResult::Fixnum(0))
        }

        "file-write-date" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    match fs::metadata(&s) {
                        Ok(meta) => {
                            if let Ok(modified) = meta.modified() {
                                if let Ok(duration) = modified.duration_since(std::time::UNIX_EPOCH) {
                                    Ok(EvalResult::Fixnum(duration.as_secs() as i64))
                                } else {
                                    Ok(EvalResult::Fixnum(0))
                                }
                            } else {
                                Ok(EvalResult::Fixnum(0))
                            }
                        }
                        Err(_) => Ok(EvalResult::Nil),
                    }
                }
                None => Ok(EvalResult::Nil),
            }
        }

        "file-author" => {
            Ok(EvalResult::String("unknown".to_string()))
        }

        "delete-file" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    match fs::remove_file(&s) {
                        Ok(_) => Ok(EvalResult::Boolean(true)),
                        Err(e) => Err(format!("Cannot delete file: {}", e)),
                    }
                }
                None => Err("delete-file requires a pathname".to_string()),
            }
        }

        "rename-file" => {
            let old = args.get(0).and_then(extract_pathname_string);
            let new = args.get(1).and_then(extract_pathname_string);
            match (old, new) {
                (Some(old), Some(new)) => {
                    match fs::rename(&old, &new) {
                        Ok(_) => Ok(make_pathname_object_from_string(&new)),
                        Err(e) => Err(format!("Cannot rename file: {}", e)),
                    }
                }
                _ => Err("rename-file requires two pathnames".to_string()),
            }
        }

        "directory" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    match fs::read_dir(&s) {
                        Ok(entries) => {
                            let mut result = EvalResult::Nil;
                            for entry in entries.flatten() {
                                let path_str = entry.path().to_string_lossy().to_string();
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(make_pathname_object_from_string(&path_str))),
                                    Rc::new(RefCell::new(result))
                                );
                            }
                            Ok(result)
                        }
                        Err(_) => Ok(EvalResult::Nil),
                    }
                }
                None => Ok(EvalResult::Nil),
            }
        }

        "ensure-directories-exist" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    let path = Path::new(&s);
                    let dir = if path.extension().is_some() {
                        path.parent().unwrap_or(path)
                    } else {
                        path
                    };
                    match fs::create_dir_all(dir) {
                        Ok(_) => Ok(make_pathname_object_from_string(&s)),
                        Err(e) => Err(format!("Cannot create directories: {}", e)),
                    }
                }
                None => Err("ensure-directories-exist requires a pathname".to_string()),
            }
        }

        "wild-pathname-p" | "pathname-match-p" | "translate-pathname" => {
            Ok(EvalResult::Nil)
        }

        "translate-logical-pathname" => {
            // Translate logical pathnames to physical pathnames
            if args.is_empty() {
                return Ok(EvalResult::Nil);
            }

            if let Some(path_str) = args.get(0).and_then(extract_pathname_string) {
                let physical_path = if path_str.starts_with("sys:") || path_str == "sys:" {
                    ".".to_string()
                } else {
                    path_str
                };
                return Ok(make_pathname_object_from_string(&physical_path));
            }

            Ok(EvalResult::Nil)
        }

        "logical-pathname" | "logical-pathname-translations" => {
            Ok(EvalResult::Nil)
        }

        "setf-logical-pathname-translations" => {
            // setf form for logical pathname translations
            Ok(EvalResult::Boolean(true))
        }

        "pathname-device" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(_) => Ok(EvalResult::Nil),
                None => Err("pathname-device requires a pathname".to_string()),
            }
        }

        "pathname-host" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(_) => Ok(EvalResult::Nil),
                None => Err("pathname-host requires a pathname".to_string()),
            }
        }

        "directory-namestring" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    let path = Path::new(&s);
                    Ok(EvalResult::String(
                        path.parent()
                            .and_then(|p| p.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                None => Err("directory-namestring requires a pathname".to_string()),
            }
        }

        "file-namestring" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(s) => {
                    let path = Path::new(&s);
                    Ok(EvalResult::String(
                        path.file_name()
                            .and_then(|n| n.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                None => Err("file-namestring requires a pathname".to_string()),
            }
        }

        "host-namestring" => {
            match args.get(0).and_then(extract_pathname_string) {
                Some(_) => Ok(EvalResult::String("".to_string())),
                None => Err("host-namestring requires a pathname".to_string()),
            }
        }

        _ => Err(format!("Unknown pathname builtin: {}", name)),
    }
}
