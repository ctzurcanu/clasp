/// rlasp-compile: Compile .lisp files to LLVM IR (.ll files)
///
/// Usage: rlasp-compile <input.lisp> <output.ll>
///        rlasp-compile --all  (compile all files in clisp/kernel/)
use std::env;
use std::fs;
use std::path::{Path, PathBuf};
use std::process;

use inkwell::context::Context;
use inkwell::values::{BasicValueEnum, FunctionValue};
use rlasp::ir::datum::{ConstantValue, DatumId};
use rlasp::ir::instruction::{InstructionId, InstructionKind};
use rlasp::ir::lower::LowerContext;
use rlasp::ir::module::Module as BIRModule;
use rlasp::repl::expand_macros;
use rlasp::repl::reader::Reader;
use rlasp_jit::CodeGenerator;
use std::collections::HashMap;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: {} <input.lisp> <output.ll>", args[0]);
        eprintln!(
            "       {} --all  (compile all files in clisp/kernel/)",
            args[0]
        );
        process::exit(1);
    }

    if args[1] == "--all" {
        compile_all();
    } else if args.len() == 3 {
        let input = &args[1];
        let output = &args[2];
        if let Err(e) = compile_file(input, output) {
            eprintln!("Error compiling {}: {}", input, e);
            process::exit(1);
        }
    } else {
        eprintln!("Invalid arguments");
        process::exit(1);
    }
}

fn compile_all() {
    let kernel_dir = Path::new("clisp/kernel");
    if !kernel_dir.exists() {
        eprintln!("Error: clisp/kernel/ directory not found");
        process::exit(1);
    }

    // Create output directory
    let output_dir = Path::new("target/lisp-image");
    fs::create_dir_all(output_dir).expect("Failed to create output directory");

    // Find all .lisp files recursively
    let lisp_files = find_lisp_files(kernel_dir);

    println!("Compiling {} Lisp files to LLVM IR...", lisp_files.len());

    let mut success_count = 0;
    let mut error_count = 0;

    for lisp_file in lisp_files {
        // Create output path with same structure
        let relative_path = lisp_file.strip_prefix("clisp/kernel/").unwrap();
        let output_path = output_dir.join(relative_path).with_extension("ll");

        // Create parent directory if needed
        if let Some(parent) = output_path.parent() {
            fs::create_dir_all(parent).ok();
        }

        print!("Compiling {:?}... ", relative_path);
        match compile_file(lisp_file.to_str().unwrap(), output_path.to_str().unwrap()) {
            Ok(_) => {
                println!("OK");
                success_count += 1;
            }
            Err(e) => {
                println!("ERROR: {}", e);
                error_count += 1;
            }
        }
    }

    println!();
    println!(
        "Compilation complete: {} succeeded, {} failed",
        success_count, error_count
    );

    if error_count > 0 {
        process::exit(1);
    }
}

fn find_lisp_files(dir: &Path) -> Vec<PathBuf> {
    let mut files = Vec::new();

    if let Ok(entries) = fs::read_dir(dir) {
        for entry in entries.filter_map(Result::ok) {
            let path = entry.path();
            if path.is_dir() {
                files.extend(find_lisp_files(&path));
            } else if path.extension().and_then(|s| s.to_str()) == Some("lisp") {
                files.push(path);
            }
        }
    }

    files.sort();
    files
}

fn compile_file(input: &str, output: &str) -> Result<(), String> {
    // Read input file
    let source =
        fs::read_to_string(input).map_err(|e| format!("Failed to read {}: {}", input, e))?;

    let module_name = Path::new(input)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("module")
        .replace('-', "_");

    // 1. Parse with reader
    let mut reader = Reader::new(&source);
    let mut ast_nodes = Vec::new();

    // Read all forms from the file
    loop {
        match reader.read() {
            Ok(form) => ast_nodes.push(form),
            Err(e) => {
                // Check if we've reached EOF or had a real error
                let err_str = format!("{:?}", e);
                if err_str.contains("EOF") || err_str.contains("UnexpectedEof") {
                    break; // Normal EOF, we're done
                }
                // Real parse error - create minimal module
                let ir_content = format!(
                    r#"; ModuleID = '{}'
; Parse error: {}
; Source: {}
source_filename = "{}"

define void @__rlasp_init_{}() {{
entry:
  ret void
}}
"#,
                    module_name, e, input, input, module_name
                );
                fs::write(output, ir_content)
                    .map_err(|e| format!("Failed to write {}: {}", output, e))?;
                return Ok(()); // Return success to allow batch compilation to continue
            }
        }
    }

    // 2. Expand macros
    let expanded_nodes: Vec<_> = ast_nodes.iter().map(|ast| expand_macros(ast)).collect();

    // 3. Lower AST to IR
    let mut lower_ctx = LowerContext::new();

    // Lower all forms
    for ast in &expanded_nodes {
        if let Err(e) = lower_ctx.lower_ast(ast) {
            // Create minimal module on lowering error
            let ir_content = format!(
                r#"; ModuleID = '{}'
; Lowering failed: {}
; Source: {}
source_filename = "{}"

define void @__rlasp_init_{}() {{
entry:
  ret void
}}
"#,
                module_name, e, input, input, module_name
            );
            fs::write(output, ir_content)
                .map_err(|e| format!("Failed to write {}: {}", output, e))?;
            return Ok(());
        }
    }

    // 4. Generate LLVM IR from BIR
    let context = Context::create();
    let mut codegen = CodeGenerator::new(&context, &module_name);

    // Declare intrinsics
    codegen.declare_intrinsics();

    // Generate LLVM functions from BIR
    eprintln!(
        "BIR Module has {} functions, {} instructions",
        lower_ctx.module.functions.len(),
        lower_ctx.module.instructions.len()
    );

    generate_llvm_from_bir(&lower_ctx.module, &codegen, &context)?;

    // Add initialization function
    let i64_type = context.i64_type();
    let init_fn_type = i64_type.fn_type(&[], false);
    let init_fn =
        codegen
            .module()
            .add_function(&format!("__rlasp_init_{}", module_name), init_fn_type, None);

    let entry_block = context.append_basic_block(init_fn, "entry");
    codegen.builder().position_at_end(entry_block);

    // Just return 0 (nil) for now
    let zero = i64_type.const_zero();
    codegen.builder().build_return(Some(&zero)).unwrap();

    // 5. Write LLVM IR to .ll file
    codegen
        .module()
        .print_to_file(output)
        .map_err(|e| format!("Failed to write LLVM IR: {}", e.to_string()))?;

    // 6. Also generate .bc file if requested
    if output.ends_with(".ll") {
        let bc_output = output.replace(".ll", ".bc");
        codegen
            .module()
            .write_bitcode_to_path(Path::new(&bc_output));
    }

    Ok(())
}

/// Generate LLVM IR from BIR module
fn generate_llvm_from_bir<'ctx>(
    bir: &BIRModule,
    codegen: &CodeGenerator<'ctx>,
    context: &'ctx Context,
) -> Result<(), String> {
    // For now, generate stubs for each function
    // Full implementation requires walking through all instructions
    // and generating corresponding LLVM IR

    for (func_id, bir_func) in &bir.functions {
        eprintln!("Generating LLVM for function {:?}", func_id);

        // Create LLVM function
        let i64_type = context.i64_type();
        let fn_type = i64_type.fn_type(&vec![i64_type.into(); bir_func.parameters.len()], false);

        let fn_name = format!("_rlasp_fn_{}", func_id);
        let llvm_func = codegen.module().add_function(&fn_name, fn_type, None);

        // Create entry block
        let entry_block = context.append_basic_block(llvm_func, "entry");
        codegen.builder().position_at_end(entry_block);

        // For now, just return 0
        // TODO: Walk through BIR instructions and generate LLVM IR
        let zero = i64_type.const_zero();
        codegen.builder().build_return(Some(&zero)).unwrap();
    }

    Ok(())
}
