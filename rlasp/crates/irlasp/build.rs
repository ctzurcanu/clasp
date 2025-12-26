fn main() {
    // Tell cargo to link against librlasp
    // The library will be found in target/release when built
    println!("cargo:rustc-link-lib=dylib=rlasp");

    // Add the target/release directory to the library search path
    let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
    let workspace_dir = std::path::Path::new(&manifest_dir)
        .parent()
        .unwrap()
        .parent()
        .unwrap();
        let profile = std::env::var("PROFILE").unwrap();
    let lib_dir = workspace_dir.join("target").join(profile);

    println!("cargo:rustc-link-search=native={}", lib_dir.display());

    // Also set rpath so the binary can find the library at runtime
    #[cfg(target_os = "macos")]
    println!("cargo:rustc-link-arg=-Wl,-rpath,@executable_path");

    #[cfg(target_os = "linux")]
    println!("cargo:rustc-link-arg=-Wl,-rpath,$ORIGIN");
}
