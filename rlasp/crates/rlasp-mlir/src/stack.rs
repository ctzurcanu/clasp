/// Stack-based calling convention helpers for MLIR generation
///
/// All functions use signature: func.func @name(%stack: !llvm.ptr, %sp: i64) -> i64
/// - %stack = pointer to global stack array (base)
/// - %sp = stack pointer (index of next free slot)
/// - Returns new %sp value
///
/// Arguments are passed on stack, results left on stack

use anyhow::Result;

pub struct StackCodegen {
    /// Current stack pointer index (SSA value name)
    pub sp_ssa: String,
    /// Stack base pointer (SSA value name)
    pub stack_ssa: String,
}

impl StackCodegen {
    pub fn new(stack_ssa: String, sp_ssa: String) -> Self {
        Self { sp_ssa, stack_ssa }
    }

    /// Generate code to push a value onto stack
    /// Returns new sp SSA value
    pub fn gen_push(&self, value_ssa: &str, sp_ssa: &str, fresh_id: &mut usize) -> (String, String) {
        let mut code = String::new();

        // Get pointer to stack[sp]
        let ptr_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = llvm.getelementptr inbounds {}, ptr {}, i64 {}\n",
            ptr_ssa, "i64", self.stack_ssa, sp_ssa));

        // Store value
        code.push_str(&format!("    llvm.store {}, ptr {}\n", value_ssa, ptr_ssa));

        // Increment sp
        let one_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = arith.constant 1 : i64\n", one_ssa));

        let new_sp = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = arith.addi {}, {} : i64\n", new_sp, sp_ssa, one_ssa));

        (code, new_sp)
    }

    /// Generate code to pop a value from stack
    /// Returns (code, value_ssa, new_sp_ssa)
    pub fn gen_pop(&self, sp_ssa: &str, fresh_id: &mut usize) -> (String, String, String) {
        let mut code = String::new();

        // Decrement sp
        let one_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = arith.constant 1 : i64\n", one_ssa));

        let new_sp = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = arith.subi {}, {} : i64\n", new_sp, sp_ssa, one_ssa));

        // Get pointer to stack[new_sp]
        let ptr_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = llvm.getelementptr inbounds {}, ptr {}, i64 {}\n",
            ptr_ssa, "i64", self.stack_ssa, new_sp));

        // Load value
        let value_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = llvm.load {} : ptr -> i64\n", value_ssa, ptr_ssa));

        (code, value_ssa, new_sp)
    }

    /// Generate code to peek at stack[sp - offset] without popping
    pub fn gen_peek(&self, sp_ssa: &str, offset: i64, fresh_id: &mut usize) -> (String, String) {
        let mut code = String::new();

        // Calculate index = sp - offset
        let offset_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = arith.constant {} : i64\n", offset_ssa, offset));

        let idx_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = arith.subi {}, {} : i64\n", idx_ssa, sp_ssa, offset_ssa));

        // Get pointer to stack[idx]
        let ptr_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = llvm.getelementptr inbounds {}, ptr {}, i64 {}\n",
            ptr_ssa, "i64", self.stack_ssa, idx_ssa));

        // Load value
        let value_ssa = format!("%{}", fresh_id);
        *fresh_id += 1;
        code.push_str(&format!("    {} = llvm.load {} : ptr -> i64\n", value_ssa, ptr_ssa));

        (code, value_ssa)
    }
}
