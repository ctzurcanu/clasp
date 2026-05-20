use super::datum::Datum;
use super::iblock::IBlockId;
use super::instruction::{Instruction, InstructionKind};
/// Code generation - LLVM IR and WASM targets
///
/// This module provides the framework for generating executable code from BIR.
/// Two backends:
/// - LLVM backend (via inkwell) - native code
/// - WASM backend (via wasmtime) - WebAssembly
///
/// Currently provides stubs and documentation for implementation when
/// LLVM dependencies are available.
use super::module::Module;
use std::collections::HashMap;

/// Code generation target
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Target {
    /// Native code via LLVM
    Native,
    /// WebAssembly
    Wasm,
}

/// Codegen context
pub struct CodegenContext {
    pub target: Target,
    // Future: LLVM context, module, builder
    // pub llvm_context: Context,
    // pub llvm_module: Module,
    // pub llvm_builder: Builder,
}

impl CodegenContext {
    pub fn new(target: Target) -> Self {
        Self { target }
    }

    /// Generate code for entire module
    pub fn codegen_module(&mut self, _module: &Module) -> Result<CompiledModule, String> {
        match self.target {
            Target::Native => self.codegen_native(_module),
            Target::Wasm => self.codegen_wasm(_module),
        }
    }

    /// Generate native code via LLVM
    fn codegen_native(&mut self, _module: &Module) -> Result<CompiledModule, String> {
        // Future implementation with inkwell:
        //
        // 1. Create LLVM module and context
        // let context = Context::create();
        // let module = context.create_module("rlasp");
        // let builder = context.create_builder();
        //
        // 2. Generate types
        // - LispObject* (i8*)
        // - Function types (LispObject* (*)(LispObject**, i64))
        //
        // 3. Generate intrinsics
        // - cc_unbox_fixnum
        // - cc_box_fixnum
        // - cc_car, cc_cdr, cc_cons
        //
        // 4. For each function in IR:
        //    a. Create LLVM function with Clasp calling convention
        //    b. Create basic blocks for each IBlock
        //    c. Generate phi nodes
        //    d. Generate instructions
        //    e. Link blocks with terminators
        //
        // 5. Optimize with LLVM passes
        // - mem2reg (SSA promotion)
        // - instcombine
        // - simplifycfg
        //
        // 6. Compile to object code
        // let target_machine = Target::initialize_native(...);
        // module.write_to_file("output.o", FileType::Object);
        //
        // 7. Return compiled module with function pointers

        Err("LLVM codegen not yet implemented (waiting for inkwell)".to_string())
    }

    /// Generate WebAssembly
    fn codegen_wasm(&mut self, _module: &Module) -> Result<CompiledModule, String> {
        // Future implementation with wasmtime:
        //
        // 1. Create WASM module
        // let mut module = Module::new();
        //
        // 2. Define types
        // - (func (param i32 i32) (result i32))
        //
        // 3. Generate functions
        // - For each function in IR, emit WASM instructions
        //
        // 4. Compile with wasmtime
        // let engine = Engine::default();
        // let module = Module::new(&engine, wasm_bytes)?;
        //
        // 5. Return compiled module

        Err("WASM codegen not yet implemented".to_string())
    }

    /// Generate code for single instruction (helper for future impl)
    #[allow(dead_code)]
    fn codegen_instruction(&mut self, _inst: &Instruction) {
        // Match on instruction kind and generate appropriate code
        // This will be used by both LLVM and WASM backends
    }
}

/// Compiled module ready for execution
pub struct CompiledModule {
    /// Target architecture
    pub target: Target,
    /// Entry point function pointer (for native)
    pub entry_point: Option<usize>,
    /// Compiled code (for inspection/serialization)
    pub code: Vec<u8>,
}

/// LLVM calling convention for Clasp/rlasp
///
/// Functions use this convention:
/// - Args: &[*const LispObject]
/// - Return: (*const LispObject, i64) for multiple values
///
/// Arity-specific entry points:
/// - 0-7 args: fixed entry point
/// - 8+ args: variadic entry point
#[derive(Debug, Clone)]
pub struct LispCallingConvention {
    /// Fixed-arity entry points (0-7 args)
    pub fixed_entries: [Option<String>; 8],
    /// Variadic entry point (8+ args)
    pub variadic_entry: Option<String>,
}

impl LispCallingConvention {
    pub fn new() -> Self {
        Self {
            fixed_entries: Default::default(),
            variadic_entry: None,
        }
    }
}

impl Default for LispCallingConvention {
    fn default() -> Self {
        Self::new()
    }
}

/// LLVM intrinsics (Clasp-style)
///
/// These are the runtime functions that compiled code calls.
/// They handle boxing/unboxing and primitive operations.
pub struct Intrinsics {
    /// Intrinsic function names
    pub functions: HashMap<String, String>,
}

impl Intrinsics {
    pub fn new() -> Self {
        let mut functions = HashMap::new();

        // Boxing/unboxing
        functions.insert("box_fixnum".to_string(), "cc_box_fixnum".to_string());
        functions.insert("unbox_fixnum".to_string(), "cc_unbox_fixnum".to_string());
        functions.insert("box_float".to_string(), "cc_box_double_float".to_string());
        functions.insert(
            "unbox_float".to_string(),
            "cc_unbox_double_float".to_string(),
        );

        // Cons operations
        functions.insert("car".to_string(), "cc_car".to_string());
        functions.insert("cdr".to_string(), "cc_cdr".to_string());
        functions.insert("cons".to_string(), "cc_cons".to_string());

        // Type tests
        functions.insert("fixnump".to_string(), "cc_fixnump".to_string());
        functions.insert("consp".to_string(), "cc_consp".to_string());

        // Arithmetic (when not inlined)
        functions.insert("add".to_string(), "cc_add".to_string());
        functions.insert("sub".to_string(), "cc_sub".to_string());
        functions.insert("mul".to_string(), "cc_mul".to_string());
        functions.insert("div".to_string(), "cc_div".to_string());

        Self { functions }
    }
}

impl Default for Intrinsics {
    fn default() -> Self {
        Self::new()
    }
}

/// Block lowering helper
///
/// Maps IR blocks to LLVM basic blocks
#[derive(Debug)]
pub struct BlockMap {
    /// IR block ID → LLVM block name/reference
    pub blocks: HashMap<IBlockId, String>,
}

impl BlockMap {
    pub fn new() -> Self {
        Self {
            blocks: HashMap::new(),
        }
    }

    pub fn register_block(&mut self, ir_block: IBlockId, llvm_block: String) {
        self.blocks.insert(ir_block, llvm_block);
    }

    pub fn get_block(&self, ir_block: IBlockId) -> Option<&str> {
        self.blocks.get(&ir_block).map(|s| s.as_str())
    }
}

impl Default for BlockMap {
    fn default() -> Self {
        Self::new()
    }
}

/// Instruction lowering patterns
///
/// Documents how each IR instruction maps to LLVM
pub fn instruction_lowering_guide() -> &'static str {
    r#"
IR Instruction → LLVM Mapping
================================

Constants:
  ConstRef { fixnum } → i64 constant, then box_fixnum(i64)
  ConstRef { float } → f64 constant, then box_float(f64)
  ConstRef { nil } → global NIL constant

Variables:
  ReadVar → load from alloca
  WriteVar → store to alloca

Arithmetic (when inlined):
  Add { inputs: [a, b] } →
    %1 = unbox_fixnum(a)
    %2 = unbox_fixnum(b)
    %3 = add i64 %1, %2
    %4 = box_fixnum(%3)

  (Fallback: call cc_add(a, b))

Control flow:
  If { true_target, false_target } →
    %is_nil = icmp eq LispObject* %test, @NIL
    br i1 %is_nil, label %false_target, label %true_target

  Jump { target } →
    br label %target

  Return { value } →
    ret { LispObject*, i64 } { %value, 1 }

Phi:
  Phi { inputs } →
    phi LispObject* [ %val1, %block1 ], [ %val2, %block2 ]

Calls:
  Call { callee, args } →
    %fn_ptr = extract_function_ptr(%callee)
    %result = call LispObject* %fn_ptr(LispObject** %args, i64 %nargs)

Type tests (inlined):
  TypeTest { Fixnump } →
    %tag = and i64 %obj, 3
    %is_fixnum = icmp eq i64 %tag, 0

  TypeTest { Consp } →
    %tag = and i64 %obj, 3
    %is_cons = icmp eq i64 %tag, 1
"#
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_codegen_context_creation() {
        let ctx = CodegenContext::new(Target::Native);
        assert_eq!(ctx.target, Target::Native);
    }

    #[test]
    fn test_calling_convention() {
        let cc = LispCallingConvention::new();
        assert_eq!(cc.fixed_entries.len(), 8);
    }

    #[test]
    fn test_intrinsics() {
        let intrinsics = Intrinsics::new();
        assert!(intrinsics.functions.contains_key("box_fixnum"));
        assert!(intrinsics.functions.contains_key("car"));
        assert!(intrinsics.functions.contains_key("add"));
    }

    #[test]
    fn test_block_map() {
        let mut map = BlockMap::new();
        let block_id = IBlockId(1);
        map.register_block(block_id, "bb_1".to_string());

        assert_eq!(map.get_block(block_id), Some("bb_1"));
    }

    #[test]
    fn test_lowering_guide() {
        let guide = instruction_lowering_guide();
        assert!(guide.contains("Constants:"));
        assert!(guide.contains("Control flow:"));
    }
}
