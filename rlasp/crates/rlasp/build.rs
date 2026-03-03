use std::path::{Path, PathBuf};

fn main() {
    let manifest_dir = PathBuf::from(std::env::var("CARGO_MANIFEST_DIR").unwrap_or_else(|_| ".".to_string()));
    let workspace_root = manifest_dir
        .parent()
        .and_then(|p| p.parent())
        .map(Path::to_path_buf)
        .unwrap_or_else(|| manifest_dir.clone());

    // Prefer crate-local shim sources, then fall back to workspace-root sources.
    let test_class_shims = if manifest_dir.join("test_class_shims.cpp").exists() {
        manifest_dir.join("test_class_shims.cpp")
    } else {
        workspace_root.join("test_class_shims.cpp")
    };
    let test_class_header = if manifest_dir.join("test_class.hpp").exists() {
        manifest_dir.join("test_class.hpp")
    } else {
        workspace_root.join("test_class.hpp")
    };

    if test_class_shims.exists() && test_class_header.exists() {
        cc::Build::new()
            .cpp(true)
            .file(&test_class_shims)
            .include(test_class_header.parent().unwrap_or(&workspace_root))
            .flag("-std=c++17")
            .compile("test_class_shims");

        println!("cargo:rerun-if-changed={}", test_class_header.display());
        println!("cargo:rerun-if-changed={}", test_class_shims.display());
    }

    let vector_shims = if manifest_dir.join("generated/vector_shims.cpp").exists() {
        manifest_dir.join("generated/vector_shims.cpp")
    } else {
        workspace_root.join("generated/vector_shims.cpp")
    };
    let vector_header = if manifest_dir.join("vector.hpp").exists() {
        manifest_dir.join("vector.hpp")
    } else {
        workspace_root.join("vector.hpp")
    };

    if vector_shims.exists() && vector_header.exists() {
        cc::Build::new()
            .cpp(true)
            .file(&vector_shims)
            .include(vector_header.parent().unwrap_or(&workspace_root))
            .flag("-std=c++17")
            .compile("vector_shims");

        println!("cargo:rerun-if-changed={}", vector_header.display());
        println!("cargo:rerun-if-changed={}", vector_shims.display());
    }

    // cxx bridge for high-performance Vector API (Phase 1.4)
    // Only compile if all required files exist
    if manifest_dir.join("src/ffi/cxx_bridge.rs").exists()
        && manifest_dir.join("src/ffi/cxx_bridge_impl.cpp").exists()
        && manifest_dir.join("include").exists()
        && vector_header.exists() {
        cxx_build::bridge("src/ffi/cxx_bridge.rs")
            .file("src/ffi/cxx_bridge_impl.cpp")
            .flag("-std=c++17")
            .include(vector_header.parent().unwrap_or(&workspace_root))
            .include(manifest_dir.join("include"))
            .compile("vector_cxx");

        println!("cargo:rerun-if-changed=src/ffi/cxx_bridge.rs");
        println!(
            "cargo:rerun-if-changed={}",
            manifest_dir.join("include/vector_cxx.hpp").display()
        );
    }
}
