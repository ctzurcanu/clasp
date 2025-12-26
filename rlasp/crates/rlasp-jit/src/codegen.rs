//! LLVM IR code generation using inkwell

use inkwell::context::Context;
use inkwell::module::Module;
use inkwell::builder::Builder;
use inkwell::values::{FunctionValue, AnyValue};
use inkwell::types::IntType;

/// Code generator for LLVM IR
pub struct CodeGenerator<'ctx> {
    context: &'ctx Context,
    module: Module<'ctx>,
    builder: Builder<'ctx>,
}

impl<'ctx> CodeGenerator<'ctx> {
    /// Create a new code generator
    pub fn new(context: &'ctx Context, module_name: &str) -> Self {
        let module = context.create_module(module_name);
        let builder = context.create_builder();

        Self {
            context,
            module,
            builder,
        }
    }

    /// Get the LLVM context
    pub fn context(&self) -> &'ctx Context {
        self.context
    }

    /// Get the LLVM module
    pub fn module(&self) -> &Module<'ctx> {
        &self.module
    }

    /// Get the LLVM builder
    pub fn builder(&self) -> &Builder<'ctx> {
        &self.builder
    }

    /// Get LispObject type (usize/i64)
    pub fn lisp_object_type(&self) -> IntType<'ctx> {
        self.context.i64_type()
    }

    /// Consume the code generator and create a JIT engine
    pub fn into_jit_engine(self) -> Result<crate::JitEngine<'ctx>, String> {
        crate::JitEngine::new(self.module)
    }

    /// Declare intrinsic functions
    pub fn declare_intrinsics(&self) {
        let i64_type = self.context.i64_type();
        let f64_type = self.context.f64_type();
        let i32_type = self.context.i32_type();

        // cc_box_fixnum(i64) -> i64
        let box_fixnum_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_box_fixnum", box_fixnum_type, None);

        // cc_unbox_fixnum(i64) -> i64
        let unbox_fixnum_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_unbox_fixnum", unbox_fixnum_type, None);

        // cc_box_float(f64) -> i64
        let box_float_type = i64_type.fn_type(&[f64_type.into()], false);
        self.module.add_function("cc_box_float", box_float_type, None);

        // cc_unbox_float(i64) -> f64
        let unbox_float_type = f64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_unbox_float", unbox_float_type, None);

        // cc_cons(i64, i64) -> i64
        let cons_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_cons", cons_type, None);

        // cc_car(i64) -> i64
        let car_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_car", car_type, None);

        // cc_cdr(i64) -> i64
        let cdr_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_cdr", cdr_type, None);

        // cc_set_car(i64, i64) -> i64
        let set_car_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_set_car", set_car_type, None);

        // cc_set_cdr(i64, i64) -> i64
        let set_cdr_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_set_cdr", set_cdr_type, None);

        // cc_nil() -> i64
        let nil_type = i64_type.fn_type(&[], false);
        self.module.add_function("cc_nil", nil_type, None);

        // cc_t() -> i64
        let t_type = i64_type.fn_type(&[], false);
        self.module.add_function("cc_t", t_type, None);

        // cc_is_nil(i64) -> i32
        let is_nil_type = i32_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_is_nil", is_nil_type, None);

        // cc_is_fixnum(i64) -> i32
        let is_fixnum_type = i32_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_is_fixnum", is_fixnum_type, None);

        // cc_is_cons(i64) -> i32
        let is_cons_type = i32_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_is_cons", is_cons_type, None);

        // Arithmetic operations: cc_add(i64, i64) -> i64
        let arith_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_add", arith_type, None);
        self.module.add_function("cc_sub", arith_type, None);
        self.module.add_function("cc_mul", arith_type, None);
        self.module.add_function("cc_div", arith_type, None);
        self.module.add_function("cc_mod", arith_type, None);
        self.module.add_function("cc_expt", arith_type, None);

        // Math functions: cc_sqrt(i64) -> i64, cc_floor(i64) -> i64, etc.
        let sqrt_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_sqrt", sqrt_type, None);
        let floor_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_floor", floor_type, None);
        self.module.add_function("cc_ceiling", floor_type, None);
        self.module.add_function("cc_truncate", floor_type, None);
        let truncate_2_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_truncate_2", truncate_2_type, None);

        // List functions: cc_length(i64) -> i64, cc_append(i64, i64) -> i64, etc.
        let length_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_length", length_type, None);
        let append_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_append", append_type, None);
        let reverse_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_reverse", reverse_type, None);
        let copy_seq_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_copy_seq", copy_seq_type, None);
        let nth_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_nth", nth_type, None);

        // String functions: cc_make_string_repeat(i64, i64) -> i64
        let make_string_repeat_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_make_string_repeat", make_string_repeat_type, None);

        // cc_set_char(i64, i64, i64) -> i64
        let set_char_type = i64_type.fn_type(&[i64_type.into(), i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_set_char", set_char_type, None);

        // cc_string_equal(i64, i64) -> i64
        let string_equal_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_string_equal", string_equal_type, None);

        // Numeric predicates: cc_evenp(i64) -> i64, cc_oddp(i64) -> i64
        let pred_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_evenp", pred_type, None);
        self.module.add_function("cc_oddp", pred_type, None);

        // Logical operators: cc_not(i64) -> i64
        let not_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_not", not_type, None);

        // Comparison operations: cc_lt(i64, i64) -> i64
        self.module.add_function("cc_lt", arith_type, None);
        self.module.add_function("cc_gt", arith_type, None);
        self.module.add_function("cc_eq", arith_type, None);
        self.module.add_function("cc_le", arith_type, None);
        self.module.add_function("cc_ge", arith_type, None);

        // Time functions
        let time_type = i64_type.fn_type(&[], false);
        self.module.add_function("cc_get_internal_real_time", time_type, None);

        // Format: cc_format(i64, i64, i64) -> i64 (dest, control, args)
        let format_type = i64_type.fn_type(&[i64_type.into(), i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_format", format_type, None);

        // Hash tables
        let make_hash_table_type = i64_type.fn_type(&[], false);
        self.module.add_function("cc_make_hash_table", make_hash_table_type, None);
        let make_hash_table_full_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_make_hash_table_full", make_hash_table_full_type, None);
        let gethash_type = i64_type.fn_type(&[i64_type.into(), i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_gethash", gethash_type, None);
        let puthash_type = i64_type.fn_type(&[i64_type.into(), i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_puthash", puthash_type, None);
        let maphash_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_maphash", maphash_type, None);

        // CLOS
        let make_instance_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_make_instance", make_instance_type, None);
        let slot_value_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_slot_value", slot_value_type, None);
        let set_slot_value_type = i64_type.fn_type(&[i64_type.into(), i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_set_slot_value", set_slot_value_type, None);

        // System functions
        let system_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_system", system_type, None);
        self.module.add_function("cc_print", system_type, None);
        self.module.add_function("cc_echo", system_type, None);

        // Symbol creation
        let ptr_type = self.context.i8_type().ptr_type(inkwell::AddressSpace::default());
        let make_symbol_type = i64_type.fn_type(&[ptr_type.into(), i64_type.into()], false);
        self.module.add_function("cc_make_symbol", make_symbol_type, None);

        // CLI commands (no arguments)
        let no_arg_type = i64_type.fn_type(&[], false);
        self.module.add_function("cc_ls", no_arg_type, None);
        self.module.add_function("cc_pwd", no_arg_type, None);

        // String functions
        let ptr_type = self.context.i8_type().ptr_type(inkwell::AddressSpace::default());
        let make_string_type = i64_type.fn_type(&[ptr_type.into(), i64_type.into()], false);
        self.module.add_function("cc_make_string", make_string_type, None);

        let shell_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_shell", shell_type, None);

        // Command-line arguments
        let argc_type = i64_type.fn_type(&[], false);
        self.module.add_function("cc_argc", argc_type, None);

        let argv_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_argv", argv_type, None);

        // Function pointers for lambdas
        let box_fn_ptr_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_box_function_ptr", box_fn_ptr_type, None);

        let unbox_fn_ptr_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_unbox_function_ptr", unbox_fn_ptr_type, None);

        let is_fn_type = i32_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_is_function", is_fn_type, None);

        // Array functions
        let make_array_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_make_array", make_array_type, None);

        let make_array_with_contents_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_make_array_with_contents", make_array_with_contents_type, None);

        let aref_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_aref", aref_type, None);

        let set_aref_type = i64_type.fn_type(&[i64_type.into(), i64_type.into(), i64_type.into()], false);
        self.module.add_function("cc_set_aref", set_aref_type, None);

        // Math functions
        let round_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_round", round_type, None);

        // CLOS accessor functions
        let accessor_type = i64_type.fn_type(&[i64_type.into()], false);
        self.module.add_function("cc_accessor_x", accessor_type, None);
        self.module.add_function("cc_accessor_y", accessor_type, None);
    }

    /// Create a simple function that returns a fixnum
    pub fn compile_constant_fixnum(&self, name: &str, value: i64) -> FunctionValue<'ctx> {
        self.declare_intrinsics();

        let i64_type = self.context.i64_type();
        let fn_type = i64_type.fn_type(&[], false);
        let function = self.module.add_function(name, fn_type, None);

        let basic_block = self.context.append_basic_block(function, "entry");
        self.builder.position_at_end(basic_block);

        // Call cc_box_fixnum(value)
        let box_fixnum = self.module.get_function("cc_box_fixnum").unwrap();
        let val = i64_type.const_int(value as u64, true);
        let result = self.builder.call_fn(box_fixnum, &[val.into()], "boxed");

        self.builder.build_return(Some(&result.as_any_value_enum().into_int_value()));

        function
    }

    /// Compile a simple addition function: (+ a b)
    pub fn compile_add_fixnums(&self, name: &str) -> FunctionValue<'ctx> {
        self.declare_intrinsics();

        let i64_type = self.context.i64_type();

        // Function signature: (LispObject, LispObject) -> LispObject
        let fn_type = i64_type.fn_type(&[i64_type.into(), i64_type.into()], false);
        let function = self.module.add_function(name, fn_type, None);

        let a_param = function.get_nth_param(0).unwrap().into_int_value();
        let b_param = function.get_nth_param(1).unwrap().into_int_value();

        let basic_block = self.context.append_basic_block(function, "entry");
        self.builder.position_at_end(basic_block);

        // Unbox both parameters
        let unbox_fixnum = self.module.get_function("cc_unbox_fixnum").unwrap();
        let a_val = self.builder.call_fn(unbox_fixnum, &[a_param.into()], "a_val")
            .as_any_value_enum().into_int_value();
        let b_val = self.builder.call_fn(unbox_fixnum, &[b_param.into()], "b_val")
            .as_any_value_enum().into_int_value();

        // Add the values
        let sum = self.builder.build_int_add(a_val, b_val, "sum").unwrap();

        // Box the result
        let box_fixnum = self.module.get_function("cc_box_fixnum").unwrap();
        let result = self.builder.call_fn(box_fixnum, &[sum.into()], "result");

        self.builder.build_return(Some(&result.as_any_value_enum().into_int_value()));

        function
    }

    /// Print the LLVM IR for debugging
    pub fn print_ir(&self) {
        self.module.print_to_stderr();
    }

    /// Write WASM output to a file
    pub fn write_wasm_to_file(&self, path: &str) -> Result<(), String> {
        use inkwell::targets::{Target, InitializationConfig, TargetMachine, RelocMode, CodeModel, FileType};
        use inkwell::OptimizationLevel;

        Target::initialize_webassembly(&InitializationConfig::default());

        let triple = inkwell::targets::TargetTriple::create("wasm32-unknown-unknown");
        let target = Target::from_triple(&triple)
            .map_err(|e| format!("Failed to create target: {}", e))?;

        let target_machine = target
            .create_target_machine(
                &triple,
                "generic",
                "",
                OptimizationLevel::Default,
                RelocMode::Default,
                CodeModel::Default,
            )
            .ok_or_else(|| "Failed to create target machine".to_string())?;

        target_machine
            .write_to_file(&self.module, FileType::Object, path.as_ref())
            .map_err(|e| format!("Failed to write WASM: {}", e))
    }
}

// Helper trait to make calling functions easier
trait BuilderExt<'ctx> {
    fn call_fn(&self, function: FunctionValue<'ctx>, args: &[inkwell::values::BasicMetadataValueEnum<'ctx>], name: &str)
        -> inkwell::values::CallSiteValue<'ctx>;
}

impl<'ctx> BuilderExt<'ctx> for Builder<'ctx> {
    fn call_fn(&self, function: FunctionValue<'ctx>, args: &[inkwell::values::BasicMetadataValueEnum<'ctx>], name: &str)
        -> inkwell::values::CallSiteValue<'ctx> {
        self.build_call(function, args, name).unwrap()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_create_codegen() {
        let context = Context::create();
        let codegen = CodeGenerator::new(&context, "test_module");

        codegen.declare_intrinsics();

        // Verify intrinsics are declared
        assert!(codegen.module().get_function("cc_box_fixnum").is_some());
        assert!(codegen.module().get_function("cc_unbox_fixnum").is_some());
    }

    #[test]
    fn test_compile_constant() {
        let context = Context::create();
        let codegen = CodeGenerator::new(&context, "test_module");

        let func = codegen.compile_constant_fixnum("get_42", 42);

        // Verify function was created
        assert_eq!(func.get_name().to_str().unwrap(), "get_42");
    }

    #[test]
    fn test_compile_add() {
        let context = Context::create();
        let codegen = CodeGenerator::new(&context, "test_module");

        let func = codegen.compile_add_fixnums("add_two_numbers");

        // Verify function was created
        assert_eq!(func.get_name().to_str().unwrap(), "add_two_numbers");

        // Print IR for inspection
        codegen.print_ir();
    }
}
