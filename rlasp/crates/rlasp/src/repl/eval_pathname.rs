/// eval_pathname.rs - Basic pathname and file operations
use super::eval_types::EvalResult;
use std::path::{Path, PathBuf};
use std::fs;
use std::rc::Rc;
use std::cell::RefCell;

fn symbol_base_name(sym: &str) -> &str {
    sym.rsplit(':').next().unwrap_or(sym)
}

fn sys_logical_root() -> PathBuf {
    if let Ok(root) = std::env::var("RLASP_SYS_ROOT") {
        let trimmed = root.trim();
        if !trimmed.is_empty() {
            return PathBuf::from(trimmed);
        }
    }

    if let Ok(exe) = std::env::current_exe() {
        // Typical dev layout: <repo>/target/{debug,release}/irlasp
        if let Some(target_dir) = exe.parent().and_then(|p| p.parent()) {
            if target_dir.file_name().and_then(|n| n.to_str()) == Some("target") {
                if let Some(repo_root) = target_dir.parent() {
                    // In this workspace irlasp lives under <clasp>/rlasp, while CLASP's
                    // implementation lisp sources live under <clasp>/src/lisp. Prefer that
                    // tree for SYS: so ASDF's implementation-source scan matches CLASP.
                    let candidate_roots = [
                        repo_root.join("src").join("lisp"),
                        repo_root
                            .parent()
                            .map(|p| p.join("src").join("lisp"))
                            .unwrap_or_else(|| PathBuf::from("__nonexistent__")),
                        repo_root.join("clisp").join("in_work").join("modules"),
                    ];
                    for candidate in candidate_roots {
                        if candidate.is_dir() {
                            return candidate;
                        }
                    }
                    return repo_root.to_path_buf();
                }
            }
        }
        if let Some(parent) = exe.parent() {
            return parent.to_path_buf();
        }
    }

    std::env::current_dir().unwrap_or_else(|_| PathBuf::from("."))
}

fn normalize_path_designator(path: &str) -> String {
    let lower = path.to_ascii_lowercase();
    if lower.starts_with("sys:") {
        let mut suffix = path[4..].replace(';', "/");
        while suffix.starts_with('/') {
            suffix.remove(0);
        }
        let mut base = sys_logical_root();
        if !suffix.is_empty() {
            base.push(suffix);
        }
        return base.to_string_lossy().to_string();
    }
    path.to_string()
}

/// Extract a pathname string from various Common Lisp pathname representations
fn extract_pathname_string(arg: &EvalResult) -> Option<String> {
    match arg {
        EvalResult::String(s) => Some(s.clone()),
        EvalResult::Symbol(s) => {
            // Handle symbols that might be pathnames (strip quotes if present)
            if s.starts_with("#P\"") && s.ends_with('"') {
                Some(normalize_path_designator(&s[3..s.len()-1]))
            } else if s.starts_with('"') && s.ends_with('"') {
                Some(normalize_path_designator(&s[1..s.len()-1]))
            } else {
                Some(normalize_path_designator(s))
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
                        return extract_pathname_string(&path_val).map(|s| normalize_path_designator(&s));
                    }
                }
            }
            None
        }
        _ => None,
    }
}

pub(super) fn is_pathname_object(arg: &EvalResult) -> bool {
    match arg {
        EvalResult::Cons(car, cdr) => {
            if let EvalResult::Symbol(sym) = &*car.borrow() {
                if !symbol_base_name(sym).eq_ignore_ascii_case("pathname") {
                    return false;
                }
                if let EvalResult::Cons(path_car, path_tail) = &*cdr.borrow() {
                    // Distinguish real tagged pathname objects from ordinary lists
                    // that happen to start with the symbol PATHNAME.
                    if !matches!(&*path_tail.borrow(), EvalResult::Nil) {
                        return false;
                    }
                    let path_val = path_car.borrow().clone();
                    extract_pathname_string(&path_val).is_some()
                } else {
                    false
                }
            } else {
                false
            }
        }
        EvalResult::Symbol(s) => s.starts_with("#P\"") && s.ends_with('"'),
        _ => false,
    }
}

pub(super) fn make_pathname_object_from_string(path: &str) -> EvalResult {
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

fn pathname_component_to_string(item: &EvalResult) -> Option<String> {
    match item {
        EvalResult::String(s) => Some(s.clone()),
        EvalResult::Symbol(s) => {
            let marker = s.trim_start_matches(':');
            if marker.eq_ignore_ascii_case("wild") {
                Some("*".to_string())
            } else if marker.eq_ignore_ascii_case("wild-inferiors") {
                Some("**".to_string())
            } else if marker.eq_ignore_ascii_case("unspecific") {
                Some(String::new())
            } else {
                Some(s.clone())
            }
        }
        EvalResult::Character(c) => Some(c.to_string()),
        EvalResult::Nil => Some(String::new()),
        _ => None,
    }
}

fn directory_list_to_string_with_mode(dir: &EvalResult) -> Option<(String, bool)> {
    let items = list_to_vec(dir)?;
    if items.is_empty() {
        return Some((String::new(), true));
    }

    let mut is_absolute = false;
    let mut parts: Vec<String> = Vec::new();

    for (idx, item) in items.iter().enumerate() {
        let item_str = pathname_component_to_string(item)?;

        let marker = item_str.trim_start_matches(':');
        if marker.eq_ignore_ascii_case("absolute") {
            if idx == 0 {
                is_absolute = true;
            }
            continue;
        }
        if marker.eq_ignore_ascii_case("relative") {
            continue;
        }
        if marker.eq_ignore_ascii_case("back") {
            parts.push("..".to_string());
            continue;
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
    Some((path, !is_absolute))
}

fn directory_list_to_string(dir: &EvalResult) -> Option<String> {
    directory_list_to_string_with_mode(dir).map(|(path, _is_relative)| path)
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

fn contains_wildcard_component(path: &str) -> bool {
    path.contains('*') || path.contains('?')
}

fn wildcard_match_component(pattern: &str, text: &str) -> bool {
    // Common Lisp implementations commonly use *.* as the portable
    // "all entries in directory" wildcard, including subdirectories.
    if pattern == "*.*" || pattern == "*" {
        return true;
    }

    let pattern: Vec<char> = pattern.chars().collect();
    let text: Vec<char> = text.chars().collect();
    let mut dp = vec![vec![false; text.len() + 1]; pattern.len() + 1];
    dp[0][0] = true;

    for i in 1..=pattern.len() {
        if pattern[i - 1] == '*' {
            dp[i][0] = dp[i - 1][0];
        }
    }

    for i in 1..=pattern.len() {
        for j in 1..=text.len() {
            dp[i][j] = match pattern[i - 1] {
                '*' => dp[i - 1][j] || dp[i][j - 1],
                '?' => dp[i - 1][j - 1],
                c => dp[i - 1][j - 1] && c == text[j - 1],
            };
        }
    }

    dp[pattern.len()][text.len()]
}

fn wildcard_captures_for_component(pattern: &str, text: &str) -> Option<Vec<String>> {
    fn rec(
        pattern: &[char],
        text: &[char],
        pi: usize,
        ti: usize,
        captures: &mut Vec<String>,
    ) -> bool {
        if pi == pattern.len() {
            return ti == text.len();
        }

        match pattern[pi] {
            '*' => {
                for end in ti..=text.len() {
                    captures.push(text[ti..end].iter().collect());
                    if rec(pattern, text, pi + 1, end, captures) {
                        return true;
                    }
                    captures.pop();
                }
                false
            }
            '?' => {
                if ti >= text.len() {
                    return false;
                }
                captures.push(text[ti..ti + 1].iter().collect());
                let matched = rec(pattern, text, pi + 1, ti + 1, captures);
                if !matched {
                    captures.pop();
                }
                matched
            }
            literal => {
                if ti >= text.len() || text[ti] != literal {
                    return false;
                }
                rec(pattern, text, pi + 1, ti + 1, captures)
            }
        }
    }

    let pattern_chars: Vec<char> = pattern.chars().collect();
    let text_chars: Vec<char> = text.chars().collect();
    let mut captures = Vec::new();
    if rec(&pattern_chars, &text_chars, 0, 0, &mut captures) {
        Some(captures)
    } else {
        None
    }
}

fn split_path_parts(path: &str) -> (bool, bool, Vec<String>) {
    let normalized = normalize_path_designator(path);
    let is_absolute = normalized.starts_with('/');
    let is_directory = normalized.ends_with('/') && normalized != "/";
    let trimmed = normalized.trim_matches('/');
    let parts = if trimmed.is_empty() {
        Vec::new()
    } else {
        trimmed.split('/').map(|part| part.to_string()).collect()
    };
    (is_absolute, is_directory, parts)
}

fn pathname_captures_from_pattern(path: &str, pattern: &str) -> Option<Vec<String>> {
    fn rec(
        pattern_parts: &[String],
        path_parts: &[String],
        pi: usize,
        ti: usize,
        captures: &mut Vec<String>,
    ) -> bool {
        if pi == pattern_parts.len() {
            return ti == path_parts.len();
        }

        let pattern_part = &pattern_parts[pi];
        if pattern_part == "**" {
            for end in ti..=path_parts.len() {
                captures.push(path_parts[ti..end].join("/"));
                if rec(pattern_parts, path_parts, pi + 1, end, captures) {
                    return true;
                }
                captures.pop();
            }
            return false;
        }

        if ti >= path_parts.len() {
            return false;
        }

        let Some(component_captures) =
            wildcard_captures_for_component(pattern_part, &path_parts[ti])
        else {
            return false;
        };

        let original_len = captures.len();
        captures.extend(component_captures);
        if rec(pattern_parts, path_parts, pi + 1, ti + 1, captures) {
            return true;
        }
        captures.truncate(original_len);
        false
    }

    let (path_abs, path_dir, path_parts) = split_path_parts(path);
    let (pattern_abs, pattern_dir, pattern_parts) = split_path_parts(pattern);
    if path_abs != pattern_abs {
        return None;
    }
    if pattern_dir && !path_dir {
        return None;
    }

    let mut captures = Vec::new();
    if rec(&pattern_parts, &path_parts, 0, 0, &mut captures) {
        Some(captures)
    } else {
        None
    }
}

fn apply_captures_to_path_pattern(pattern: &str, captures: &[String]) -> String {
    let (is_absolute, is_directory, parts) = split_path_parts(pattern);
    let mut capture_index = 0usize;
    let mut out_parts = Vec::new();

    for part in parts {
        if part == "**" {
            let capture = captures.get(capture_index).cloned().unwrap_or_default();
            capture_index += 1;
            if !capture.is_empty() {
                out_parts.push(capture);
            }
            continue;
        }

        let mut rebuilt = String::new();
        for ch in part.chars() {
            if ch == '*' || ch == '?' {
                rebuilt.push_str(captures.get(capture_index).map(|s| s.as_str()).unwrap_or(""));
                capture_index += 1;
            } else {
                rebuilt.push(ch);
            }
        }
        out_parts.push(rebuilt);
    }

    let mut result = if is_absolute { "/".to_string() } else { String::new() };
    result.push_str(&out_parts.join("/"));
    if is_directory && !result.ends_with('/') {
        result.push('/');
    }
    result
}

fn pathname_string_for_entry(path: &Path, is_dir: bool) -> String {
    let mut s = path.to_string_lossy().to_string();
    if is_dir && !s.ends_with('/') {
        s.push('/');
    }
    s
}

fn split_glob_base_and_patterns(path: &str) -> (PathBuf, Vec<String>) {
    let is_absolute = path.starts_with('/');
    let trimmed = path.trim_matches('/');
    let parts: Vec<String> = if trimmed.is_empty() {
        Vec::new()
    } else {
        trimmed.split('/').map(|part| part.to_string()).collect()
    };

    let mut base = if is_absolute {
        PathBuf::from("/")
    } else {
        PathBuf::from(".")
    };
    let mut idx = 0usize;
    while idx < parts.len() && !contains_wildcard_component(&parts[idx]) {
        base.push(&parts[idx]);
        idx += 1;
    }

    (base, parts[idx..].to_vec())
}

fn collect_glob_matches(
    base: &Path,
    patterns: &[String],
    directory_only_pattern: bool,
    entries: &mut Vec<String>,
) {
    if patterns.is_empty() {
        if let Ok(metadata) = fs::metadata(base) {
            if !directory_only_pattern || metadata.is_dir() {
                entries.push(pathname_string_for_entry(base, metadata.is_dir()));
            }
        }
        return;
    }

    let pattern = &patterns[0];

    // :wild-inferiors => recursively match zero or more directory components.
    if pattern == "**" {
        collect_glob_matches(base, &patterns[1..], directory_only_pattern, entries);
        if let Ok(read_dir) = fs::read_dir(base) {
            for entry in read_dir.flatten() {
                if let Ok(metadata) = entry.metadata() {
                    if metadata.is_dir() {
                        collect_glob_matches(&entry.path(), patterns, directory_only_pattern, entries);
                    }
                }
            }
        }
        return;
    }

    let read_dir = match fs::read_dir(base) {
        Ok(read_dir) => read_dir,
        Err(_) => return,
    };

    for entry in read_dir.flatten() {
        let Some(name) = entry.file_name().to_str().map(|s| s.to_string()) else {
            continue;
        };
        if !wildcard_match_component(pattern, &name) {
            continue;
        }
        let Ok(metadata) = entry.metadata() else {
            continue;
        };
        if patterns.len() == 1 {
            if directory_only_pattern && !metadata.is_dir() {
                continue;
            }
            entries.push(pathname_string_for_entry(&entry.path(), metadata.is_dir()));
        } else if metadata.is_dir() {
            collect_glob_matches(&entry.path(), &patterns[1..], directory_only_pattern, entries);
        }
    }
}

fn directory_entries_for_designator(path: &str) -> Result<Vec<String>, String> {
    let has_wildcards = contains_wildcard_component(path);
    let mut entries = Vec::new();

    if !has_wildcards {
        match fs::read_dir(path) {
            Ok(read_dir) => {
                for entry in read_dir.flatten() {
                    if let Ok(metadata) = entry.metadata() {
                        entries.push(pathname_string_for_entry(&entry.path(), metadata.is_dir()));
                    }
                }
                entries.sort();
                return Ok(entries);
            }
            Err(_) => return Ok(Vec::new()),
        }
    }

    let directory_only_pattern = path.ends_with('/') || path.ends_with(std::path::MAIN_SEPARATOR);
    let candidate_path = if directory_only_pattern {
        path.trim_end_matches(&['/', '\\'][..])
    } else {
        path
    };
    let (base, patterns) = split_glob_base_and_patterns(candidate_path);
    if patterns.is_empty() {
        if let Ok(metadata) = fs::metadata(&base) {
            if !directory_only_pattern || metadata.is_dir() {
                entries.push(pathname_string_for_entry(&base, metadata.is_dir()));
            }
        }
    } else {
        collect_glob_matches(&base, &patterns, directory_only_pattern, &mut entries);
    }

    entries.sort();
    entries.dedup();
    Ok(entries)
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
            // Extract keyword arguments. Keep "not provided" distinct from
            // "provided as empty/NIL" so we can inherit from :defaults.
            let mut name: Option<String> = None;
            let mut type_ext: Option<String> = None;
            let mut directory: Option<String> = None;
            let mut defaults_path: Option<String> = None;

            let mut i = 0;
            while i < args.len() {
                if let EvalResult::Symbol(key) = &args[i] {
                    if i + 1 < args.len() {
                        let key_norm = {
                            let base = key.rsplit(':').next().unwrap_or(key.as_str());
                            if base.starts_with(':') {
                                base.to_ascii_lowercase()
                            } else {
                                format!(":{}", base.to_ascii_lowercase())
                            }
                        };
                        let mut consumed = true;
                        match key_norm.as_str() {
                            ":name" => {
                                match &args[i + 1] {
                                    EvalResult::Symbol(s) | EvalResult::String(s) if s.starts_with('"') && s.ends_with('"') => {
                                        name = Some(s[1..s.len()-1].to_string());
                                    }
                                    value => {
                                        if let Some(component) = pathname_component_to_string(value) {
                                            name = Some(component);
                                        }
                                    }
                                }
                            }
                            ":type" => {
                                match &args[i + 1] {
                                    EvalResult::Symbol(s) | EvalResult::String(s) if s.starts_with('"') && s.ends_with('"') => {
                                        type_ext = Some(s[1..s.len()-1].to_string());
                                    }
                                    value => {
                                        if let Some(component) = pathname_component_to_string(value) {
                                            type_ext = Some(component);
                                        }
                                    }
                                }
                            }
                            ":directory" => {
                                match &args[i + 1] {
                                    EvalResult::Symbol(s) | EvalResult::String(s) if s.starts_with('"') && s.ends_with('"') => {
                                        directory = Some(s[1..s.len()-1].to_string());
                                    }
                                    value if !matches!(value, EvalResult::Cons(_, _)) => {
                                        if let Some(component) = pathname_component_to_string(value) {
                                            directory = Some(component);
                                        }
                                    }
                                    EvalResult::Cons(_, _) => {
                                        if let Some((dir_str, _is_relative)) =
                                            directory_list_to_string_with_mode(&args[i + 1])
                                        {
                                            directory = Some(dir_str);
                                        }
                                    }
                                    EvalResult::Nil => {
                                        directory = Some(String::new());
                                    }
                                    _ => {}
                                }
                            }
                            ":defaults" => {
                                if let Some(path) = extract_pathname_string(&args[i + 1]) {
                                    defaults_path = Some(path);
                                }
                            }
                            _ => consumed = false,
                        }
                        if consumed {
                            i += 2;
                            continue;
                        }
                    }
                }
                i += 1;
            }

            let mut default_dir = String::new();
            let mut default_name = String::new();
            let mut default_type = String::new();
            if let Some(defaults) = defaults_path {
                let defaults_path = Path::new(&defaults);
                if defaults.ends_with('/') || defaults_path.is_dir() {
                    default_dir = defaults.trim_end_matches('/').to_string();
                } else {
                    if let Some(parent) = defaults_path.parent().and_then(|p| p.to_str()) {
                        default_dir = parent.to_string();
                    }
                    if let Some(stem) = defaults_path.file_stem().and_then(|s| s.to_str()) {
                        default_name = stem.to_string();
                    }
                    if let Some(ext) = defaults_path.extension().and_then(|s| s.to_str()) {
                        default_type = ext.to_string();
                    }
                }
            }

            // If :directory is explicitly provided, keep it as provided.
            // CL make-pathname does not force merging explicit relative
            // directory components with :defaults at construction time.
            let directory = if let Some(dir) = directory { dir } else { default_dir };
            let name = name.unwrap_or(default_name);
            let type_ext = type_ext.unwrap_or(default_type);

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

        "namestring" | "host-namestring" | "enough-namestring" => {
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
                    let has_filename = |p: &str| -> bool {
                        if p.is_empty() {
                            return false;
                        }
                        if p.ends_with('/') || p.ends_with(';') || p.ends_with(':') {
                            return false;
                        }
                        // If the path currently exists as a directory, treat it as a directory
                        // even without a trailing slash.
                        if Path::new(p).is_dir() {
                            return false;
                        }
                        true
                    };
                    if Path::new(&p1).is_absolute() {
                        return Ok(make_pathname_object_from_string(&p1));
                    }

                    let base_dir = if has_filename(&p2) {
                        Path::new(&p2)
                            .parent()
                            .map(|p| p.to_path_buf())
                            .unwrap_or_default()
                    } else {
                        PathBuf::from(&p2)
                    };
                    let mut merged_path = if p1.is_empty() {
                        base_dir
                    } else {
                        base_dir.join(&p1)
                    };

                    let mut merged = merged_path.to_string_lossy().to_string();
                    if !has_filename(&p1) && !merged.ends_with('/') {
                        merged.push('/');
                    }

                    Ok(make_pathname_object_from_string(&merged))
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
                    let normalized = normalize_path_designator(&s);
                    match fs::canonicalize(&normalized) {
                        Ok(path) => Ok(make_pathname_object_from_string(&path.to_string_lossy().to_string())),
                        Err(_) => Ok(make_pathname_object_from_string(&normalized)),
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
                    match directory_entries_for_designator(&s) {
                        Ok(entries) => {
                            let mut result = EvalResult::Nil;
                            for entry in entries.into_iter().rev() {
                                result = EvalResult::Cons(
                                    Rc::new(RefCell::new(make_pathname_object_from_string(&entry))),
                                    Rc::new(RefCell::new(result))
                                );
                            }
                            Ok(result)
                        }
                        Err(err) => Err(err),
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

        "wild-pathname-p" => {
            let is_wild = args
                .get(0)
                .and_then(extract_pathname_string)
                .map(|s| contains_wildcard_component(&s))
                .unwrap_or(false);
            Ok(EvalResult::Boolean(is_wild))
        }

        "pathname-match-p" => {
            let path = args.get(0).and_then(extract_pathname_string);
            let pattern = args.get(1).and_then(extract_pathname_string);
            let matches = match (path, pattern) {
                (Some(path), Some(pattern)) => pathname_captures_from_pattern(&path, &pattern).is_some(),
                _ => false,
            };
            Ok(EvalResult::Boolean(matches))
        }

        "translate-pathname" => {
            let source = args.get(0).and_then(extract_pathname_string);
            let from = args.get(1).and_then(extract_pathname_string);
            let to = args.get(2).and_then(extract_pathname_string);
            match (source, from, to) {
                (Some(source), Some(from), Some(to)) => {
                    let captures = pathname_captures_from_pattern(&source, &from)
                        .ok_or_else(|| format!("translate-pathname: source {} does not match {}", source, from))?;
                    Ok(make_pathname_object_from_string(
                        &apply_captures_to_path_pattern(&to, &captures),
                    ))
                }
                _ => Err("translate-pathname requires source, from-wildcard, and to-wildcard pathnames".to_string()),
            }
        }

        "translate-logical-pathname" => {
            // Translate logical pathnames to physical pathnames
            if args.is_empty() {
                return Ok(EvalResult::Nil);
            }

            if let Some(path_str) = args.get(0).and_then(extract_pathname_string) {
                let physical_path = normalize_path_designator(&path_str).replace(';', "/");
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
