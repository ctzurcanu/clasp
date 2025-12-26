/// Example: Generate shims for a Vector class
use rlasp::*;
use std::fs;

fn main() {
    // Define Vector class
    let mut class = CppClass::new("Vector");

    class.add_constructor(
        CppConstructor::new()
            .param("x", "double")
            .param("y", "double")
    );

    class.add_method(
        CppMethod::new("getX", "double").const_method()
    );

    class.add_method(
        CppMethod::new("getY", "double").const_method()
    );

    class.add_method(
        CppMethod::new("setX", "void")
            .param("x", "double")
    );

    class.add_method(
        CppMethod::new("setY", "void")
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

    // Generate and save shims
    let shim_code = generate_shims(&class);
    fs::write("generated/vector_shims.cpp", &shim_code)
        .expect("Failed to write shims");

    println!("Generated shims for Vector class:");
    println!("{}", shim_code);
}
