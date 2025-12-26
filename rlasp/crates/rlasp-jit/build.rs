fn main() {
    println!("cargo:rustc-link-lib=dylib=LLVM");
    println!("cargo:rustc-link-search=native=/opt/homebrew/opt/llvm/lib");
}
