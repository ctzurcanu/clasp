fn main() {
    // Link to Boehm GC when feature is enabled
    #[cfg(feature = "boehm-gc")]
    {
        // Try pkg-config first
        if let Ok(lib) = pkg_config::probe_library("bdw-gc") {
            for path in lib.link_paths {
                println!("cargo:rustc-link-search=native={}", path.display());
            }
        } else {
            // Fallback to Homebrew location on macOS
            #[cfg(target_os = "macos")]
            {
                println!("cargo:rustc-link-search=native=/opt/homebrew/opt/bdw-gc/lib");
                println!("cargo:rustc-link-search=native=/usr/local/opt/bdw-gc/lib");
            }

            // Common Linux locations
            #[cfg(target_os = "linux")]
            {
                println!("cargo:rustc-link-search=native=/usr/lib");
                println!("cargo:rustc-link-search=native=/usr/local/lib");
            }
        }

        println!("cargo:rustc-link-lib=gc");
    }
}
