use super::cpp_ast::*;
use std::fmt::Write;

/// Generate C++ shim code from AST
pub fn generate_shims(class: &CppClass) -> String {
    let mut code = String::new();

    // Header
    writeln!(code, "// Auto-generated C++ shims for {}", class.name).unwrap();
    writeln!(code, "#include \"{}.hpp\"", class.name.to_lowercase()).unwrap();
    writeln!(code, "#include <cstring>").unwrap();
    writeln!(code, "").unwrap();
    writeln!(code, "extern \"C\" {{").unwrap();
    writeln!(code, "").unwrap();

    // Constructors
    for (i, ctor) in class.constructors.iter().enumerate() {
        let suffix = if i == 0 { "".to_string() } else { format!("_{}", i) };
        let func_name = format!("{}_new{}", class.name.to_lowercase(), suffix);

        write!(code, "void* {}(", func_name).unwrap();
        for (j, param) in ctor.params.iter().enumerate() {
            if j > 0 { write!(code, ", ").unwrap(); }
            write!(code, "{} {}", map_type(&param.type_name), param.name).unwrap();
        }
        writeln!(code, ") {{").unwrap();

        write!(code, "    return new {}(", class.name).unwrap();
        for (j, param) in ctor.params.iter().enumerate() {
            if j > 0 { write!(code, ", ").unwrap(); }
            write!(code, "{}", convert_param_call(&param.type_name, &param.name)).unwrap();
        }
        writeln!(code, ");").unwrap();
        writeln!(code, "}}").unwrap();
        writeln!(code, "").unwrap();
    }

    // Destructor
    if class.destructor {
        writeln!(code, "void {}_delete(void* ptr) {{", class.name.to_lowercase()).unwrap();
        writeln!(code, "    delete static_cast<{}*>(ptr);", class.name).unwrap();
        writeln!(code, "}}").unwrap();
        writeln!(code, "").unwrap();
    }

    // Methods
    for method in &class.methods {
        let func_name = format!("{}_{}", class.name.to_lowercase(), method.name);

        write!(code, "{} {}(", map_type(&method.return_type), func_name).unwrap();

        if !method.is_static {
            write!(code, "void* ptr").unwrap();
            if !method.params.is_empty() {
                write!(code, ", ").unwrap();
            }
        }

        for (j, param) in method.params.iter().enumerate() {
            if j > 0 { write!(code, ", ").unwrap(); }
            write!(code, "{} {}", map_type(&param.type_name), param.name).unwrap();
        }
        writeln!(code, ") {{").unwrap();

        if method.is_static {
            write!(code, "    ").unwrap();
            // Check if return by value
            if !method.return_type.contains("*") &&
               !method.return_type.contains("&") &&
               method.return_type != "void" &&
               !is_primitive(&method.return_type) {
                write!(code, "{} result = ", method.return_type).unwrap();
            } else if method.return_type != "void" {
                write!(code, "return ").unwrap();
            }
            write!(code, "{}::{}(", class.name, method.name).unwrap();
        } else {
            write!(code, "    ").unwrap();
            // Check if return by value
            if !method.return_type.contains("*") &&
               !method.return_type.contains("&") &&
               method.return_type != "void" &&
               !is_primitive(&method.return_type) {
                write!(code, "{} result = ", method.return_type).unwrap();
            } else if method.return_type != "void" {
                write!(code, "return ").unwrap();
            }
            write!(code, "static_cast<{}*>(ptr)->{}(", class.name, method.name).unwrap();
        }

        for (j, param) in method.params.iter().enumerate() {
            if j > 0 { write!(code, ", ").unwrap(); }
            write!(code, "{}", convert_param_call(&param.type_name, &param.name)).unwrap();
        }
        write!(code, ")").unwrap();

        // For methods that return objects by value, wrap in new
        if !method.return_type.contains("*") &&
           !method.return_type.contains("&") &&
           method.return_type != "void" &&
           !is_primitive(&method.return_type) {
            writeln!(code, ");").unwrap();
            writeln!(code, "    return new {}(result);", extract_type_name(&method.return_type)).unwrap();
        } else {
            writeln!(code, ");").unwrap();
        }
        writeln!(code, "}}").unwrap();
        writeln!(code, "").unwrap();
    }

    writeln!(code, "}} // extern \"C\"").unwrap();

    code
}

/// Map C++ types to C-compatible types
fn map_type(cpp_type: &str) -> String {
    match cpp_type {
        "int" => "int".to_string(),
        "void" => "void".to_string(),
        "bool" => "bool".to_string(),
        "float" => "float".to_string(),
        "double" => "double".to_string(),
        "std::string" | "const std::string&" => "const char*".to_string(),
        t if t.contains("*") => t.to_string(),
        t if t.contains("&") => "void*".to_string(),
        _ => "void*".to_string(),
    }
}

/// Generate conversion code for parameters when calling C++ methods
fn convert_param_call(cpp_type: &str, param_name: &str) -> String {
    match cpp_type {
        "std::string" | "const std::string&" => format!("std::string({})", param_name),
        t if t.contains("&") && !t.contains("const char") => {
            // Reference to object - dereference the pointer
            format!("*static_cast<{}*>({})", extract_type_name(t), param_name)
        }
        _ => param_name.to_string(),
    }
}

fn is_primitive(type_name: &str) -> bool {
    matches!(type_name, "int" | "float" | "double" | "bool" | "char" | "long" | "short" | "void")
}

fn extract_type_name(type_str: &str) -> String {
    type_str
        .replace("const", "")
        .replace("&", "")
        .replace("*", "")
        .trim()
        .to_string()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_simple_class() {
        let mut class = CppClass::new("Vector");

        class.add_constructor(
            CppConstructor::new()
                .param("x", "double")
                .param("y", "double")
        );

        class.add_method(
            CppMethod::new("length", "double").const_method()
        );

        class.add_method(
            CppMethod::new("add", "Vector")
                .param("other", "const Vector&")
                .const_method()
        );

        let code = generate_shims(&class);

        assert!(code.contains("void* vector_new(double x, double y)"));
        assert!(code.contains("void vector_delete(void* ptr)"));
        assert!(code.contains("double vector_length(void* ptr)"));
        assert!(code.contains("void* vector_add(void* ptr, void* other)"));
    }

    #[test]
    fn test_static_method() {
        let mut class = CppClass::new("Math");

        class.add_method(
            CppMethod::new("add", "int")
                .param("a", "int")
                .param("b", "int")
                .static_method()
        );

        let code = generate_shims(&class);

        assert!(code.contains("int math_add(int a, int b)"));
        assert!(code.contains("Math::add(a, b)"));
    }
}
