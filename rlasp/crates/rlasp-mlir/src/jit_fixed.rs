/// Fixed JIT engine creation for MLIR modules
///
/// This properly maps intrinsics even when not all of them are present in the module

use inkwell::module::Module;
use rlasp_jit::JitEngine;
use inkwell::execution_engine::ExecutionEngine;
use inkwell::OptimizationLevel;
use anyhow::Result;

/// Create a JIT engine with proper intrinsic mapping
pub fn create_jit_engine_fixed<'ctx>(module: Module<'ctx>) -> Result<JitEngine<'ctx>, String> {
    let execution_engine = module
        .create_jit_execution_engine(OptimizationLevel::None)
        .map_err(|e| format!("Failed to create execution engine: {}", e))?;

    // Map each intrinsic individually
    map_intrinsics(&execution_engine, &module);

    // Create JitEngine by wrapping the execution engine
    // Since JitEngine::new consumes the module, we need to use unsafe to construct it directly
    Ok(unsafe { std::mem::transmute(execution_engine) })
}

fn map_intrinsics(execution_engine: &ExecutionEngine, module: &Module) {
    use rlasp_jit::intrinsics::*;
    use rlasp_jit::intrinsics_clos::*;

    // Map each intrinsic individually to avoid misalignment
    map_if_exists(execution_engine, module, "cc_box_fixnum", cc_box_fixnum as usize);
    map_if_exists(execution_engine, module, "cc_unbox_fixnum", cc_unbox_fixnum as usize);
    map_if_exists(execution_engine, module, "cc_box_float", cc_box_float as usize);
    map_if_exists(execution_engine, module, "cc_box_single_float", cc_box_single_float as usize);
    map_if_exists(execution_engine, module, "cc_unbox_float", cc_unbox_float as usize);
    map_if_exists(execution_engine, module, "cc_cons", cc_cons as usize);
    map_if_exists(execution_engine, module, "cc_car", cc_car as usize);
    map_if_exists(execution_engine, module, "cc_cdr", cc_cdr as usize);
    map_if_exists(execution_engine, module, "cc_nil", cc_nil as usize);
    map_if_exists(execution_engine, module, "cc_t", cc_t as usize);
    map_if_exists(execution_engine, module, "cc_is_nil", cc_is_nil as usize);
    map_if_exists(execution_engine, module, "cc_is_fixnum", cc_is_fixnum as usize);
    map_if_exists(execution_engine, module, "cc_is_cons", cc_is_cons as usize);
    map_if_exists(execution_engine, module, "cc_add", cc_add as usize);
    map_if_exists(execution_engine, module, "cc_sub", cc_sub as usize);
    map_if_exists(execution_engine, module, "cc_mul", cc_mul as usize);
    map_if_exists(execution_engine, module, "cc_div", cc_div as usize);
    map_if_exists(execution_engine, module, "cc_mod", cc_mod as usize);
    map_if_exists(execution_engine, module, "cc_expt", cc_expt as usize);
    map_if_exists(execution_engine, module, "cc_sqrt", cc_sqrt as usize);
    map_if_exists(execution_engine, module, "cc_floor", cc_floor as usize);
    map_if_exists(execution_engine, module, "cc_ceiling", cc_ceiling as usize);
    map_if_exists(execution_engine, module, "cc_truncate", cc_truncate as usize);
    map_if_exists(execution_engine, module, "cc_length", cc_length as usize);
    map_if_exists(execution_engine, module, "cc_append", cc_append as usize);
    map_if_exists(execution_engine, module, "cc_reverse", cc_reverse as usize);
    map_if_exists(execution_engine, module, "cc_nth", cc_nth as usize);
    map_if_exists(execution_engine, module, "cc_evenp", cc_evenp as usize);
    map_if_exists(execution_engine, module, "cc_oddp", cc_oddp as usize);
    map_if_exists(execution_engine, module, "cc_not", cc_not as usize);
    map_if_exists(execution_engine, module, "cc_lt", cc_lt as usize);
    map_if_exists(execution_engine, module, "cc_gt", cc_gt as usize);
    map_if_exists(execution_engine, module, "cc_eq", cc_eq as usize);
    map_if_exists(execution_engine, module, "cc_le", cc_le as usize);
    map_if_exists(execution_engine, module, "cc_ge", cc_ge as usize);
    map_if_exists(execution_engine, module, "cc_get_internal_real_time", cc_get_internal_real_time as usize);
    map_if_exists(execution_engine, module, "cc_format", cc_format as usize);
    map_if_exists(execution_engine, module, "cc_make_hash_table", cc_make_hash_table as usize);
    map_if_exists(execution_engine, module, "cc_make_hash_table_full", cc_make_hash_table_full as usize);
    map_if_exists(execution_engine, module, "cc_gethash", cc_gethash as usize);
    map_if_exists(execution_engine, module, "cc_puthash", cc_puthash as usize);
    map_if_exists(execution_engine, module, "cc_maphash", cc_maphash as usize);
    map_if_exists(execution_engine, module, "cc_make_instance", cc_make_instance as usize);
    map_if_exists(execution_engine, module, "cc_slot_value", cc_slot_value as usize);
    map_if_exists(execution_engine, module, "cc_set_slot_value", cc_set_slot_value as usize);
    map_if_exists(execution_engine, module, "cc_system", cc_system as usize);
    map_if_exists(execution_engine, module, "cc_print", cc_print as usize);
    map_if_exists(execution_engine, module, "cc_echo", cc_echo as usize);
    map_if_exists(execution_engine, module, "cc_make_symbol", cc_make_symbol as usize);
    map_if_exists(execution_engine, module, "cc_ls", cc_ls as usize);
    map_if_exists(execution_engine, module, "cc_pwd", cc_pwd as usize);
    map_if_exists(execution_engine, module, "cc_make_string", cc_make_string as usize);
    map_if_exists(execution_engine, module, "cc_shell", cc_shell as usize);
    map_if_exists(execution_engine, module, "cc_argc", cc_argc as usize);
    map_if_exists(execution_engine, module, "cc_argv", cc_argv as usize);
    map_if_exists(execution_engine, module, "cc_box_function_ptr", cc_box_function_ptr as usize);
    map_if_exists(execution_engine, module, "cc_unbox_function_ptr", cc_unbox_function_ptr as usize);
    map_if_exists(execution_engine, module, "cc_is_function", cc_is_function as usize);

    // Additional intrinsics that might be in MLIR-generated code
    map_if_exists(execution_engine, module, "cc_truthiness", cc_truthiness as usize);
    map_if_exists(execution_engine, module, "cc_arg", cc_arg as usize);
    map_if_exists(execution_engine, module, "cc_arg_present", cc_arg_present as usize);
    map_if_exists(execution_engine, module, "cc_null", cc_null as usize);
    map_if_exists(execution_engine, module, "cc_make_array_with_contents", cc_make_array_with_contents as usize);
    map_if_exists(execution_engine, module, "cc_set_aref", cc_set_aref as usize);
    map_if_exists(execution_engine, module, "cc_position_if_not", cc_position_if_not as usize);
    map_if_exists(execution_engine, module, "cc_position_if_not_full", cc_position_if_not_full as usize);
    map_if_exists(execution_engine, module, "cc_floor_2", cc_floor_2 as usize);
    map_if_exists(execution_engine, module, "cc_ceiling_2", cc_ceiling_2 as usize);
    map_if_exists(execution_engine, module, "cc_truncate_2", cc_truncate_2 as usize);
    map_if_exists(execution_engine, module, "cc_makunbound", cc_makunbound as usize);
    map_if_exists(execution_engine, module, "cc_progv_push", cc_progv_push as usize);
    map_if_exists(execution_engine, module, "cc_progv_pop", cc_progv_pop as usize);
    map_if_exists(
        execution_engine,
        module,
        "cc_valid_function_name_p",
        cc_valid_function_name_p as usize,
    );
    map_if_exists(
        execution_engine,
        module,
        "cc_function_block_name",
        cc_function_block_name as usize,
    );
}

fn map_if_exists(execution_engine: &ExecutionEngine, module: &Module, name: &str, addr: usize) {
    if let Some(func) = module.get_function(name) {
        execution_engine.add_global_mapping(&func, addr);
    }
}
