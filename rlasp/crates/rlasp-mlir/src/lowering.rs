/// MLIR → LLVM IR lowering
/// Converts generated MLIR text to LLVM IR that can be executed with ORC JIT

use anyhow::Result;
use std::collections::HashMap;
use std::process::Command;
use std::io::Write;

pub fn lower_mlir_to_llvm(mlir_text: &str) -> Result<String> {
    // First, use mlir-opt to lower all dialects to LLVM dialect
    let lowered_mlir = lower_to_llvm_dialect(mlir_text)?;

    // Then use mlir-translate to convert LLVM dialect to LLVM IR
    translate_llvm_dialect_to_ir(&lowered_mlir)
}

/// Merge user MLIR with runtime declarations into a complete module
fn merge_with_runtime_decls(mlir_text: &str) -> String {
    let runtime_decls = include_str!("../runtime-decls.mlir");
    let user_lines: Vec<&str> = mlir_text.lines().collect();
    let mut merged_mlir = String::from("module {\n");

    merged_mlir.push_str(runtime_decls);
    merged_mlir.push_str("\n");

    if user_lines.len() > 2 {
        for line in &user_lines[1..user_lines.len()-1] {
            merged_mlir.push_str(line.trim_start());
            merged_mlir.push('\n');
        }
    }
    merged_mlir.push_str("}\n");
    merged_mlir
}

/// Emit MLIR bytecode (.mlirbc) from MLIR text
pub fn emit_mlir_bytecode(mlir_text: &str, output_path: &str) -> Result<()> {
    let merged_mlir = merge_with_runtime_decls(mlir_text);

    let temp_dir = std::env::temp_dir();
    let input_path = temp_dir.join("mlirbc_input.mlir");
    std::fs::write(&input_path, &merged_mlir)?;

    let mlir_opt_paths = [
        "/opt/homebrew/opt/llvm/bin/mlir-opt",
        "/usr/local/opt/llvm/bin/mlir-opt",
        "mlir-opt",
    ];

    let mlir_opt = mlir_opt_paths.iter()
        .find(|p| std::path::Path::new(p).exists())
        .ok_or_else(|| anyhow::anyhow!("mlir-opt not found"))?;

    let output = Command::new(mlir_opt)
        .arg("--emit-bytecode")
        .arg("-o")
        .arg(output_path)
        .arg(input_path.to_str().unwrap())
        .output()?;

    if !output.status.success() {
        let stderr = String::from_utf8_lossy(&output.stderr);
        return Err(anyhow::anyhow!("mlir-opt --emit=bytecode failed: {}", stderr));
    }

    Ok(())
}

fn find_mlir_opt() -> Result<&'static str> {
    let mlir_opt_paths = [
        "/opt/homebrew/opt/llvm/bin/mlir-opt",
        "/usr/local/opt/llvm/bin/mlir-opt",
        "mlir-opt",
    ];
    mlir_opt_paths.iter()
        .find(|p| std::path::Path::new(p).exists())
        .copied()
        .ok_or_else(|| anyhow::anyhow!("mlir-opt not found. Install with: brew install llvm"))
}

fn find_mlir_translate() -> Result<&'static str> {
    let paths = [
        "/opt/homebrew/opt/llvm/bin/mlir-translate",
        "/usr/local/opt/llvm/bin/mlir-translate",
        "mlir-translate",
    ];
    paths.iter()
        .find(|p| std::path::Path::new(p).exists())
        .copied()
        .ok_or_else(|| anyhow::anyhow!("mlir-translate not found. Install with: brew install llvm"))
}

fn run_mlir_opt_lowering(input_path: &str) -> Result<String> {
    let mlir_opt = find_mlir_opt()?;
    let output = Command::new(mlir_opt)
        .arg("--convert-scf-to-cf")
        .arg("--convert-arith-to-llvm")
        .arg("--convert-index-to-llvm")
        .arg("--convert-func-to-llvm")
        .arg("--convert-cf-to-llvm")
        .arg("--reconcile-unrealized-casts")
        .arg(input_path)
        .output()?;

    if !output.status.success() {
        let stderr = String::from_utf8_lossy(&output.stderr);
        return Err(anyhow::anyhow!("mlir-opt failed: {}", stderr));
    }
    Ok(String::from_utf8(output.stdout)?)
}

/// Lower an MLIR or MLIRBC file (with runtime decls already included) to LLVM IR
pub fn lower_mlir_file_to_llvm(file_path: &str) -> Result<String> {
    // The file already has runtime decls (bytecode was generated from merged MLIR)
    // For .mlir text files without runtime decls, caller should use lower_mlir_to_llvm instead
    let lowered_mlir = run_mlir_opt_lowering(file_path)?;
    translate_llvm_dialect_to_ir(&lowered_mlir)
}

fn lower_to_llvm_dialect(mlir_text: &str) -> Result<String> {
    let merged_mlir = merge_with_runtime_decls(mlir_text);

    let temp_dir = std::env::temp_dir();
    let input_path = temp_dir.join("scf_input.mlir");
    std::fs::write(&input_path, &merged_mlir)?;
    std::fs::write("/tmp/debug_scf.mlir", &merged_mlir)?;

    run_mlir_opt_lowering(input_path.to_str().unwrap())
}

fn translate_llvm_dialect_to_ir(llvm_dialect_mlir: &str) -> Result<String> {
    let temp_dir = std::env::temp_dir();
    let input_path = temp_dir.join("llvm_dialect.mlir");
    std::fs::write(&input_path, llvm_dialect_mlir)?;

    let mlir_translate = find_mlir_translate()?;

    // Run mlir-translate to convert LLVM dialect to LLVM IR
    let output = Command::new(mlir_translate)
        .arg("--mlir-to-llvmir")
        .arg(input_path.to_str().unwrap())
        .output()?;

    if !output.status.success() {
        let stderr = String::from_utf8_lossy(&output.stderr);
        return Err(anyhow::anyhow!("mlir-translate failed: {}", stderr));
    }

    // mlir-translate generates all necessary function declarations
    // from the function calls in the MLIR, so we don't need to add them manually
    Ok(String::from_utf8(output.stdout)?)
}

fn mlir_to_llvm_ir(mlir_text: &str) -> Result<String> {
    let mut llvm_output = String::new();

    // Add intrinsic declarations at the start
    llvm_output.push_str(get_intrinsic_declarations());
    llvm_output.push('\n');

    let mut in_function = false;
    let mut function_signature = String::new();
    let mut module_closed = false;

    for line in mlir_text.lines() {
        let trimmed = line.trim();

        // Skip module declaration
        if trimmed.starts_with("module") {
            continue;
        }

        // Skip module closing brace (should be last line)
        if trimmed == "}" && !in_function {
            module_closed = true;
            continue;
        }

        // Handle function declaration
        if trimmed.starts_with("func.func @") {
            in_function = true;
            // Convert: func.func @name(%arg: i64) -> i64 {
            // To:      define i64 @name(i64 %arg) {
            let llvm_func = convert_function_signature(trimmed)?;
            llvm_output.push_str(&llvm_func);
            llvm_output.push('\n');
            llvm_output.push_str("entry:\n");  // Add entry block label
            continue;
        }

        // Handle function end
        if trimmed == "}" && in_function {
            llvm_output.push_str("}\n\n");  // Extra newline between functions
            in_function = false;
            continue;
        }

        if in_function {
            // Convert MLIR operations to LLVM IR
            let llvm_inst = convert_instruction(trimmed)?;
            llvm_output.push_str("  ");
            llvm_output.push_str(&llvm_inst);
            llvm_output.push('\n');
        }
    }

    Ok(llvm_output)
}

fn convert_function_signature(mlir_sig: &str) -> Result<String> {
    // func.func @name(%arg: i64) -> i64 {
    //  → define i64 @name(i64 %arg) {

    let sig = mlir_sig.trim_end_matches('{').trim();
    let parts: Vec<&str> = sig.split("->").collect();

    if parts.len() != 2 {
        anyhow::bail!("Invalid function signature: {}", mlir_sig);
    }

    let ret_type = parts[1].trim();
    let func_part = parts[0].trim();

    // Extract function name and parameters
    if let Some(paren_start) = func_part.find('(') {
        let name_part = &func_part[..paren_start];
        let name = name_part.trim_start_matches("func.func").trim();

        let params_part = &func_part[paren_start..];
        let params = convert_parameters(params_part)?;

        Ok(format!("define {} {}({}) {{", ret_type, name, params))
    } else {
        anyhow::bail!("No parameters found in signature: {}", mlir_sig);
    }
}

fn convert_parameters(mlir_params: &str) -> Result<String> {
    // (%arg: i64) → i64 %arg
    // (%arg0: i64, %arg1: i64) → i64 %arg0, i64 %arg1

    let inner = mlir_params.trim_start_matches('(').trim_end_matches(')');
    if inner.is_empty() {
        return Ok(String::new());
    }

    let params: Vec<String> = inner
        .split(',')
        .map(|p| {
            let parts: Vec<&str> = p.trim().split(':').collect();
            if parts.len() == 2 {
                format!("{} {}", parts[1].trim(), parts[0].trim())
            } else {
                p.to_string()
            }
        })
        .collect();

    Ok(params.join(", "))
}

fn convert_instruction(mlir_inst: &str) -> Result<String> {
    // %0 = arith.constant 1 : i64  →  %0 = add i64 0, 1
    // %1 = arith.addi %0, %1 : i64  →  %1 = add i64 %0, %1
    // %2 = func.call @f(%0) : (i64) -> i64  →  %2 = call i64 @f(i64 %0)
    // func.return %0 : i64  →  ret i64 %0

    if mlir_inst.starts_with("func.return") {
        // func.return %0 : i64  →  ret i64 %0
        let parts: Vec<&str> = mlir_inst.split_whitespace().collect();
        if parts.len() >= 2 {
            let val = parts[1];
            let typ = parts.get(3).unwrap_or(&"i64");
            return Ok(format!("ret {} {}", typ, val));
        }
    }

    if mlir_inst.contains("arith.constant") {
        // %0 = arith.constant 42 : i64  →  %0 = call i64 @cc_box_fixnum(i64 42)
        // %0 = arith.constant 1.25 : f64  →  %0 = call i64 @cc_box_float(double 1.25)
        let parts: Vec<&str> = mlir_inst.split('=').collect();
        if parts.len() == 2 {
            let lhs = parts[0].trim();
            let rhs_parts: Vec<&str> = parts[1].split_whitespace().collect();
            if rhs_parts.len() >= 4 {
                let value = rhs_parts[1];
                let typ = rhs_parts[3];  // The type after ':'
                if typ == "f64" {
                    return Ok(format!("{} = call i64 @cc_box_float(double {})", lhs, value));
                } else {
                    return Ok(format!("{} = call i64 @cc_box_fixnum(i64 {})", lhs, value));
                }
            }
        }
    }

    if mlir_inst.contains("arith.bitcast") {
        // Skip bitcast instructions for now - they're handled by the constant case above
        return Ok(String::new());  // Return empty string to skip this instruction
    }

    if mlir_inst.contains("arith.addi") {
        // %1 = arith.addi %0, %1 : i64  →  %1 = call i64 @cc_add(i64 %0, i64 %1)
        let parts: Vec<&str> = mlir_inst.split('=').collect();
        if parts.len() == 2 {
            let lhs = parts[0].trim();
            let rhs = parts[1].trim();
            let ops: Vec<&str> = rhs.split_whitespace().collect();
            if ops.len() >= 4 {
                let op1 = ops[1].trim_end_matches(',');
                let op2 = ops[2];
                return Ok(format!("{} = call i64 @cc_add(i64 {}, i64 {})", lhs, op1, op2));
            }
        }
    }

    if mlir_inst.contains("arith.subi") {
        // %1 = arith.subi %0, %1 : i64  →  %1 = call i64 @cc_sub(i64 %0, i64 %1)
        let parts: Vec<&str> = mlir_inst.split('=').collect();
        if parts.len() == 2 {
            let lhs = parts[0].trim();
            let rhs = parts[1].trim();
            let ops: Vec<&str> = rhs.split_whitespace().collect();
            if ops.len() >= 4 {
                let op1 = ops[1].trim_end_matches(',');
                let op2 = ops[2];
                return Ok(format!("{} = call i64 @cc_sub(i64 {}, i64 {})", lhs, op1, op2));
            }
        }
    }

    if mlir_inst.contains("func.call") {
        // %2 = func.call @f(%0) : (i64) -> i64  →  %2 = call i64 @f(i64 %0)
        let parts: Vec<&str> = mlir_inst.split('=').collect();
        if parts.len() == 2 {
            let lhs = parts[0].trim();
            let rhs = parts[1].trim();

            // Extract function name and arguments
            if let Some(paren_start) = rhs.find('(') {
                if let Some(paren_end) = rhs.find(')') {
                    let func_part = &rhs[..paren_start];
                    let func_name = func_part.split_whitespace().last().unwrap_or("");

                    let args_part = &rhs[paren_start + 1..paren_end];
                    let args: Vec<&str> = if args_part.is_empty() {
                        vec![]
                    } else {
                        args_part.split(',').map(|s| s.trim()).collect()
                    };

                    let llvm_args = args
                        .iter()
                        .map(|arg| format!("i64 {}", arg))
                        .collect::<Vec<_>>()
                        .join(", ");

                    return Ok(format!("{} = call i64 {}({})", lhs, func_name, llvm_args));
                }
            }
        }
    }

    // Default: return as-is (might not be valid LLVM)
    Ok(mlir_inst.to_string())
}

fn get_intrinsic_declarations() -> &'static str {
    r#"declare i64 @cc_box_fixnum(i64)
declare i64 @cc_unbox_fixnum(i64)
declare i64 @cc_box_float(double)
declare double @cc_unbox_float(i64)
declare i64 @cc_parse_bignum(ptr, i64)
declare i64 @cc_cons(i64, i64)
declare i64 @cc_car(i64)
declare i64 @cc_cdr(i64)
declare i64 @cc_nil()
declare i64 @cc_t()
declare i64 @cc_add(i64, i64)
declare i64 @cc_sub(i64, i64)
declare i64 @cc_mul(i64, i64)
declare i64 @cc_div(i64, i64)
declare i64 @cc_mod(i64, i64)
declare i64 @cc_expt(i64, i64)
declare i64 @cc_sqrt(i64)
declare i64 @cc_round(i64)
declare i64 @cc_truncate(i64)
declare i64 @cc_truncate_2(i64, i64)
declare i64 @cc_evenp(i64)
declare i64 @cc_oddp(i64)
declare i64 @cc_lt(i64, i64)
declare i64 @cc_gt(i64, i64)
declare i64 @cc_eq(i64, i64)
declare i64 @cc_append(i64, i64)
declare i64 @cc_print(i64)
declare i64 @cc_if(i64, i64, i64)
declare i64 @cc_funcall(...)
declare i64 @cc_boundp(i64)
declare i64 @cc_fboundp(i64)
declare i64 @cc_make_array(...)
declare i64 @cc_set_aref(i64, i64, i64)
declare i64 @cc_make_hash_table()
declare i64 @cc_gethash(i64, i64)
declare i64 @cc_puthash(i64, i64, i64)
declare i64 @cc_make_string_repeat(i64, i64)
declare i64 @cc_string_equal(i64, i64)
declare i64 @cc_set_char(i64, i64, i64)
declare i64 @cc_copy_seq(i64)
declare i64 @cc_incf(i64, i64)
declare i64 @cc_numerator(i64)
declare i64 @cc_denominator(i64)
declare i64 @cc_realpart(i64)
declare i64 @cc_imagpart(i64)
declare i64 @cc_format(...)
declare i64 @cc_read_from_string(i64)
declare i64 @cc_eval(i64)
declare i64 @cc_make_instance(...)
declare i64 @cc_make_lambda()
declare i64 @cc_dotimes(i64, i64, i64)
declare i64 @cc_compile(i64, i64)
declare i64 @cc_complex(i64, i64)
declare i64 @cc_ratio(i64, i64)
declare i64 @cc_get_internal_real_time()
declare i64 @list(...)
declare i64 @twice(i64)
declare i64 @make-instance(...)
declare i64 @magnitude(i64)
declare i64 @compile(i64, i64)
declare i64 @complex(i64, i64)
declare i64 @ratio(i64, i64)
declare i64 @get-internal-real-time()
declare i64 @macrolet(...)
declare i64 @m(...)
declare i64 @x(...)
"#
}
