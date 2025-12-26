use std::path::Path;

fn main() {
    // Only compile C++ files if they exist (Phase 1.4 - not implemented yet)

    // Compile the manually-written C++ test class shims
    if Path::new("test_class_shims.cpp").exists() {
        cc::Build::new()
            .cpp(true)
            .file("test_class_shims.cpp")
            .flag("-std=c++17")
            .compile("test_class_shims");

        println!("cargo:rerun-if-changed=test_class.hpp");
        println!("cargo:rerun-if-changed=test_class_shims.cpp");
    }

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

    // cxx bridge for high-performance Vector API (Phase 1.4)
    // Only compile if all required files exist
    if Path::new("src/ffi/cxx_bridge.rs").exists()
        && Path::new("src/ffi/cxx_bridge_impl.cpp").exists()
        && Path::new("include").exists()
        && Path::new("vector.hpp").exists() {
        cxx_build::bridge("src/ffi/cxx_bridge.rs")
            .file("src/ffi/cxx_bridge_impl.cpp")
            .flag("-std=c++17")
            .include(".")
            .include("include")
            .compile("vector_cxx");

        println!("cargo:rerun-if-changed=src/ffi/cxx_bridge.rs");
        println!("cargo:rerun-if-changed=include/vector_cxx.hpp");
    }
}
