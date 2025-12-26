use std::path::Path;

fn main() {
    // Compile the manually-written C++ test class shims
    cc::Build::new()
        .cpp(true)
        .file("test_class_shims.cpp")
        .flag("-std=c++17")
        .compile("test_class_shims");

    println!("cargo:rerun-if-changed=test_class.hpp");
    println!("cargo:rerun-if-changed=test_class_shims.cpp");

    // Compile auto-generated shims if they exist
    if Path::new("generated/vector_shims.cpp").exists() {
        cc::Build::new()
            .cpp(true)
            .file("generated/vector_shims.cpp")
            .include(".")  // Add current directory to include path
            .flag("-std=c++17")
            .compile("vector_shims");

        println!("cargo:rerun-if-changed=vector.hpp");
        println!("cargo:rerun-if-changed=generated/vector_shims.cpp");
    }

    // cxx bridge for high-performance Vector API
    cxx_build::bridge("src/ffi/cxx_bridge.rs")
        .file("src/ffi/cxx_bridge_impl.cpp")
        .flag("-std=c++17")
        .include(".")
        .include("include")
        .compile("vector_cxx");

    println!("cargo:rerun-if-changed=src/ffi/cxx_bridge.rs");
    println!("cargo:rerun-if-changed=include/vector_cxx.hpp");
}
