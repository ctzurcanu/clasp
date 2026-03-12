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
        // Gray stream entry points are used by the regression suites and should
        // compile through the same builtin lowering paths as their CL sequence
        // counterparts.
        set.insert("stream-read-sequence".to_string());
        set.insert("stream-write-sequence".to_string());
        // Predicate helpers that must resolve as CL function designators in
        // runtime-evaluated compiled lambdas, even if the SBCL externals list
        // omits them.
        set.insert("arrayp".to_string());
        set.insert("vectorp".to_string());
        set.insert("functionp".to_string());
        set.insert("packagep".to_string());
        set.insert("pathnamep".to_string());
        set.insert("streamp".to_string());
        set.insert("errorp".to_string());
        set.insert("hash-table-p".to_string());
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
