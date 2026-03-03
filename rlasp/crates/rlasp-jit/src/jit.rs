//! JIT execution engine

use inkwell::execution_engine::{ExecutionEngine, JitFunction};
use inkwell::module::Module;
use inkwell::OptimizationLevel;
use inkwell::values::FunctionValue;

/// JIT engine for executing compiled code
pub struct JitEngine<'ctx> {
    execution_engine: ExecutionEngine<'ctx>,
}

impl<'ctx> JitEngine<'ctx> {
    /// Create a new JIT engine from a module
    pub fn new(mut module: Module<'ctx>) -> Result<Self, String> {
        // Get intrinsic function values before the module is consumed
        let intrinsic_names = [
            "cc_box_fixnum", "cc_unbox_fixnum", "cc_box_float", "cc_box_single_float", "cc_unbox_float",
            "cc_cons", "cc_car", "cc_cdr", "cc_nil", "cc_t",
            "cc_is_nil", "cc_is_fixnum", "cc_is_cons",
            "cc_add", "cc_sub", "cc_mul", "cc_div", "cc_mod", "cc_expt", "cc_sqrt",
            "cc_floor", "cc_ceiling", "cc_truncate",
            "cc_length", "cc_append", "cc_reverse", "cc_nth",
            "cc_evenp", "cc_oddp", "cc_not",
            "cc_lt", "cc_gt", "cc_eq", "cc_le", "cc_ge",
            "cc_get_internal_real_time",
            "cc_format",
            "cc_make_hash_table", "cc_make_hash_table_full", "cc_gethash", "cc_puthash", "cc_maphash",
            "cc_make_vector", "cc_svset", "cc_svref", "cc_vector_length",
            "cc_make_instance", "cc_slot_value", "cc_set_slot_value",
            "cc_system", "cc_print", "cc_echo",
            "cc_make_symbol",
            "cc_ls", "cc_pwd",
            "cc_make_string", "cc_shell",
            "cc_argc", "cc_argv",
            "cc_box_function_ptr", "cc_unbox_function_ptr", "cc_is_function",
            // IO syntax intrinsics for with-standard-io-syntax
            "cc_save_io_syntax_state", "cc_restore_io_syntax_state", "cc_set_standard_io_syntax",
            "cc_get_io_syntax_var", "cc_set_io_syntax_var", "cc_is_io_syntax_var",
        ];
        let intrinsics: Vec<FunctionValue> = intrinsic_names
            .iter()
            .filter_map(|name| module.get_function(name))
            .collect();

        let execution_engine = module
            .create_jit_execution_engine(OptimizationLevel::None)
            .map_err(|e| format!("Failed to create execution engine: {}", e))?;

        // Map intrinsic functions to their implementations
        use crate::intrinsics::*;
        use crate::intrinsics_clos::*;
        use rlasp_runtime::io_syntax::{
            cc_save_io_syntax_state, cc_restore_io_syntax_state, cc_set_standard_io_syntax,
            cc_get_io_syntax_var, cc_set_io_syntax_var, cc_is_io_syntax_var,
        };
        let addrs: &[usize] = &[
            cc_box_fixnum as usize, cc_unbox_fixnum as usize,
            cc_box_float as usize, cc_box_single_float as usize, cc_unbox_float as usize,
            cc_cons as usize, cc_car as usize, cc_cdr as usize,
            cc_nil as usize, cc_t as usize,
            cc_is_nil as usize, cc_is_fixnum as usize, cc_is_cons as usize,
            cc_add as usize, cc_sub as usize, cc_mul as usize, cc_div as usize, cc_mod as usize, cc_expt as usize, cc_sqrt as usize,
            cc_floor as usize, cc_ceiling as usize, cc_truncate as usize,
            cc_length as usize, cc_append as usize, cc_reverse as usize, cc_nth as usize,
            cc_evenp as usize, cc_oddp as usize, cc_not as usize,
            cc_lt as usize, cc_gt as usize, cc_eq as usize, cc_le as usize, cc_ge as usize,
            cc_get_internal_real_time as usize,
            cc_format as usize,
            cc_make_hash_table as usize, cc_make_hash_table_full as usize, cc_gethash as usize, cc_puthash as usize, cc_maphash as usize,
            cc_make_vector as usize, cc_svset as usize, cc_svref as usize, cc_vector_length as usize,
            cc_make_instance as usize, cc_slot_value as usize, cc_set_slot_value as usize,
            cc_system as usize, cc_print as usize, cc_echo as usize,
            cc_make_symbol as usize,
            cc_ls as usize, cc_pwd as usize,
            cc_make_string as usize, cc_shell as usize,
            cc_argc as usize, cc_argv as usize,
            cc_box_function_ptr as usize, cc_unbox_function_ptr as usize, cc_is_function as usize,
            // IO syntax intrinsics
            cc_save_io_syntax_state as usize, cc_restore_io_syntax_state as usize, cc_set_standard_io_syntax as usize,
            cc_get_io_syntax_var as usize, cc_set_io_syntax_var as usize, cc_is_io_syntax_var as usize,
        ];

        for (func, &addr) in intrinsics.iter().zip(addrs.iter()) {
            execution_engine.add_global_mapping(func, addr);
        }

        Ok(Self { execution_engine })
    }

    /// Get a compiled function by name (no arguments, returns LispObject)
    pub unsafe fn get_function_0(&self, name: &str) -> Result<JitFunction<unsafe extern "C" fn() -> usize>, String> {
        self.execution_engine
            .get_function(name)
            .map_err(|e| format!("Function '{}' not found: {}", name, e))
    }

    /// Get a compiled function with 2 arguments
    pub unsafe fn get_function_2(&self, name: &str) -> Result<JitFunction<unsafe extern "C" fn(usize, usize) -> usize>, String> {
        self.execution_engine
            .get_function(name)
            .map_err(|e| format!("Function '{}' not found: {}", name, e))
    }

    /// Get the execution engine for custom function signatures
    pub fn execution_engine(&self) -> &ExecutionEngine<'ctx> {
        &self.execution_engine
    }

}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::CodeGenerator;

    #[test]
    fn test_jit_constant() {
        use inkwell::context::Context;

        let context = Context::create();
        let codegen = CodeGenerator::new(&context, "test");

        // Compile a function that returns 42
        codegen.compile_constant_fixnum("get_42", 42);

        // Create JIT engine by consuming the codegen (intrinsics registered automatically)
        let jit = codegen.into_jit_engine().unwrap();

        // Execute the function
        unsafe {
            let func = jit.get_function_0("get_42").unwrap();
            let result = func.call();

            // Unbox the result to verify
            let unboxed = crate::intrinsics::cc_unbox_fixnum(result);
            assert_eq!(unboxed, 42);
        }
    }

    #[test]
    fn test_jit_add() {
        use inkwell::context::Context;
        use rlasp_ffi::types::ToLisp;

        let context = Context::create();
        let codegen = CodeGenerator::new(&context, "test");

        // Compile an addition function
        codegen.compile_add_fixnums("add");

        // Create JIT engine by consuming the codegen (intrinsics registered automatically)
        let jit = codegen.into_jit_engine().unwrap();

        // Execute the function with arguments 5 and 7
        unsafe {
            let func = jit.get_function_2("add").unwrap();
            let a = 5i64.to_lisp().raw();
            let b = 7i64.to_lisp().raw();
            let result = func.call(a, b);

            // Unbox the result
            let unboxed = crate::intrinsics::cc_unbox_fixnum(result);
            assert_eq!(unboxed, 12);
        }
    }
}
