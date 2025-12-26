/// eval_pathname.rs - Basic pathname and file operations
use super::eval_types::EvalResult;
use std::path::{Path, PathBuf};
use std::fs;

pub fn call_pathname_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "pathname" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
                Some(other) => Ok(other.clone()),
                None => Err("pathname requires an argument".to_string()),
            }
        }

        "pathnamep" => {
            Ok(EvalResult::Boolean(matches!(args.get(0), Some(EvalResult::String(_)))))
        }

        "make-pathname" => {
            // Extract keyword arguments
            let mut name = String::new();
            let mut type_ext = String::new();
            let mut directory = String::new();

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
                            ":directory" | ":defaults" => {
                                if let EvalResult::Symbol(s) | EvalResult::String(s) = &args[i + 1] {
                                    directory = if s.starts_with('"') && s.ends_with('"') {
                                        s[1..s.len()-1].to_string()
                                    } else {
                                        s.clone()
                                    };
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

            Ok(EvalResult::String(path))
        }

        "pathname-name" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let path = Path::new(s);
                    Ok(EvalResult::String(
                        path.file_stem()
                            .and_then(|s| s.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                _ => Err("pathname-name requires a pathname".to_string()),
            }
        }

        "pathname-type" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let path = Path::new(s);
                    Ok(EvalResult::String(
                        path.extension()
                            .and_then(|s| s.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                _ => Err("pathname-type requires a pathname".to_string()),
            }
        }

        "pathname-directory" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let path = Path::new(s);
                    Ok(EvalResult::String(
                        path.parent()
                            .and_then(|p| p.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                _ => Err("pathname-directory requires a pathname".to_string()),
            }
        }

        "pathname-host" | "pathname-device" | "pathname-version" => {
            Ok(EvalResult::Nil)
        }

        "namestring" | "file-namestring" | "directory-namestring" | "host-namestring" | "enough-namestring" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
                _ => Ok(EvalResult::String("".to_string())),
            }
        }

        "parse-namestring" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => Ok(EvalResult::String(s.clone())),
                _ => Err("parse-namestring requires a string".to_string()),
            }
        }

        "merge-pathnames" => {
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::String(path1)), Some(EvalResult::String(path2))) => {
                    let p1 = PathBuf::from(path1);
                    let p2 = PathBuf::from(path2);
                    if p1.is_absolute() {
                        Ok(EvalResult::String(path1.clone()))
                    } else {
                        Ok(EvalResult::String(p2.join(p1).to_string_lossy().to_string()))
                    }
                }
                (Some(EvalResult::String(s)), _) => Ok(EvalResult::String(s.clone())),
                _ => Err("merge-pathnames requires pathname arguments".to_string()),
            }
        }

        "truename" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    match fs::canonicalize(s) {
                        Ok(path) => Ok(EvalResult::String(path.to_string_lossy().to_string())),
                        Err(_) => Err(format!("File does not exist: {}", s)),
                    }
                }
                _ => Err("truename requires a pathname".to_string()),
            }
        }

        "probe-file" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    if Path::new(s).exists() {
                        Ok(EvalResult::String(s.clone()))
                    } else {
                        Ok(EvalResult::Nil)
                    }
                }
                _ => Ok(EvalResult::Nil),
            }
        }

        "file-length" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    match fs::metadata(s) {
                        Ok(meta) => Ok(EvalResult::Fixnum(meta.len() as i64)),
                        Err(_) => Err(format!("Cannot get file length: {}", s)),
                    }
                }
                _ => Err("file-length requires a file stream or pathname".to_string()),
            }
        }

        "file-position" => {
            Ok(EvalResult::Fixnum(0))
        }

        "file-write-date" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    match fs::metadata(s) {
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
                _ => Ok(EvalResult::Nil),
            }
        }

        "file-author" => {
            Ok(EvalResult::String("unknown".to_string()))
        }

        "delete-file" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    match fs::remove_file(s) {
                        Ok(_) => Ok(EvalResult::Boolean(true)),
                        Err(e) => Err(format!("Cannot delete file: {}", e)),
                    }
                }
                _ => Err("delete-file requires a pathname".to_string()),
            }
        }

        "rename-file" => {
            match (args.get(0), args.get(1)) {
                (Some(EvalResult::String(old)), Some(EvalResult::String(new))) => {
                    match fs::rename(old, new) {
                        Ok(_) => Ok(EvalResult::String(new.clone())),
                        Err(e) => Err(format!("Cannot rename file: {}", e)),
                    }
                }
                _ => Err("rename-file requires two pathnames".to_string()),
            }
        }

        "directory" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    match fs::read_dir(s) {
                        Ok(entries) => {
                            let mut result = EvalResult::Nil;
                            for entry in entries.flatten() {
                                let path_str = entry.path().to_string_lossy().to_string();
                                result = EvalResult::Cons(
                                    std::rc::Rc::new(std::cell::RefCell::new(
                                        EvalResult::String(path_str)
                                    )),
                                    std::rc::Rc::new(std::cell::RefCell::new(result))
                                );
                            }
                            Ok(result)
                        }
                        Err(_) => Ok(EvalResult::Nil),
                    }
                }
                _ => Ok(EvalResult::Nil),
            }
        }

        "ensure-directories-exist" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let path = Path::new(s);
                    let dir = if path.extension().is_some() {
                        path.parent().unwrap_or(path)
                    } else {
                        path
                    };
                    match fs::create_dir_all(dir) {
                        Ok(_) => Ok(EvalResult::String(s.clone())),
                        Err(e) => Err(format!("Cannot create directories: {}", e)),
                    }
                }
                _ => Err("ensure-directories-exist requires a pathname".to_string()),
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

            match &args[0] {
                EvalResult::Cons(car, cdr) => {
                    // Pathname object like (pathname "sys:")
                    use std::rc::Rc;
                    use std::cell::RefCell;

                    let car_val = car.borrow();
                    if let EvalResult::Symbol(sym) = &*car_val {
                        if sym == "pathname" {
                            let cdr_val = cdr.borrow();
                            if let EvalResult::Cons(path_car, _) = &*cdr_val {
                                let path_val = path_car.borrow();
                                if let EvalResult::Symbol(path) = &*path_val {
                                    let path_str = if path.starts_with('"') && path.ends_with('"') {
                                        &path[1..path.len()-1]
                                    } else {
                                        path.as_str()
                                    };

                                    // Handle logical pathname translations
                                    let physical_path = if path_str.starts_with("sys:") || path_str == "sys:" {
                                        // Map sys: to current directory for now
                                        // In a real implementation, this would be configurable
                                        ".".to_string()
                                    } else {
                                        path_str.to_string()
                                    };

                                    // Return as pathname object
                                    return Ok(EvalResult::Cons(
                                        Rc::new(RefCell::new(EvalResult::Symbol("pathname".to_string()))),
                                        Rc::new(RefCell::new(EvalResult::Cons(
                                            Rc::new(RefCell::new(EvalResult::Symbol(format!("\"{}\"", physical_path)))),
                                            Rc::new(RefCell::new(EvalResult::Nil))
                                        )))
                                    ));
                                }
                            }
                        }
                    }
                }
                EvalResult::Symbol(s) => {
                    // Direct symbol/string
                    let path_str = if s.starts_with('"') && s.ends_with('"') {
                        &s[1..s.len()-1]
                    } else {
                        s.as_str()
                    };

                    let physical_path = if path_str.starts_with("sys:") || path_str == "sys:" {
                        ".".to_string()
                    } else {
                        path_str.to_string()
                    };

                    return Ok(EvalResult::Symbol(format!("\"{}\"", physical_path)));
                }
                _ => {}
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
            match args.get(0) {
                Some(EvalResult::String(_)) => Ok(EvalResult::Nil),
                _ => Err("pathname-device requires a pathname".to_string()),
            }
        }

        "pathname-host" => {
            match args.get(0) {
                Some(EvalResult::String(_)) => Ok(EvalResult::Nil),
                _ => Err("pathname-host requires a pathname".to_string()),
            }
        }

        "directory-namestring" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let path = Path::new(s);
                    Ok(EvalResult::String(
                        path.parent()
                            .and_then(|p| p.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                _ => Err("directory-namestring requires a pathname".to_string()),
            }
        }

        "file-namestring" => {
            match args.get(0) {
                Some(EvalResult::String(s)) => {
                    let path = Path::new(s);
                    Ok(EvalResult::String(
                        path.file_name()
                            .and_then(|n| n.to_str())
                            .unwrap_or("")
                            .to_string()
                    ))
                }
                _ => Err("file-namestring requires a pathname".to_string()),
            }
        }

        "host-namestring" => {
            match args.get(0) {
                Some(EvalResult::String(_)) => Ok(EvalResult::String("".to_string())),
                _ => Err("host-namestring requires a pathname".to_string()),
            }
        }

        _ => Err(format!("Unknown pathname builtin: {}", name)),
    }
}
