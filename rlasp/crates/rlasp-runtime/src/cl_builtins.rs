use lazy_static::lazy_static;
use std::collections::HashSet;

lazy_static! {
    static ref CL_BUILTINS: HashSet<String> = {
        let mut set = HashSet::new();
        let data = include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../tools/sbcl-common-lisp-externals.txt"
        ));
        for line in data.lines() {
            let name = line.trim();
            if name.is_empty() {
                continue;
            }
            set.insert(name.to_ascii_lowercase());
        }
        set
    };
}

#[inline]
pub fn is_cl_builtin(name: &str) -> bool {
    if name.as_bytes().iter().any(|b| b.is_ascii_uppercase()) {
        let lower = name.to_ascii_lowercase();
        CL_BUILTINS.contains(lower.as_str())
    } else {
        CL_BUILTINS.contains(name)
    }
}

