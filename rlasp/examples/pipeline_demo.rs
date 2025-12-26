/// End-to-end pipeline demonstration
///
/// Shows the complete flow:
/// AST → IR → Optimization → Interpretation/Codegen

use rlasp::ir::*;

fn main() {
    println!("rlasp Pipeline Demo");
    println!("===================\n");

    // 1. Create AST
    println!("1. Creating AST for: (+ (* 3 4) 2)");
    let ast = ASTNode::call(
        ASTNode::variable("+"),
        vec![
            ASTNode::call(
                ASTNode::variable("*"),
                vec![ASTNode::fixnum(3), ASTNode::fixnum(4)],
            ),
            ASTNode::fixnum(2),
        ],
    );
    println!("   AST created\n");

    // 2. Lower to IR
    println!("2. Lowering AST to BIR (Basic IR)");
    let mut ctx = LowerContext::new();

    // Set up function context
    let func_id = ctx.module.make_function(Some("test".to_string()));
    let func = ctx.module.get_function(func_id).unwrap();
    let entry = func.entry;
    ctx.current_function = Some(func_id);
    ctx.current_block = Some(entry);

    // Add operators to environment
    let add_fn = ctx.module.make_constant(ConstantValue::Symbol("+".to_string()));
    let mul_fn = ctx.module.make_constant(ConstantValue::Symbol("*".to_string()));
    ctx.env.insert("+".to_string(), add_fn);
    ctx.env.insert("*".to_string(), mul_fn);

    let result = ctx.lower_ast(&ast).unwrap();
    println!("   IR generated:");
    println!("   - {} datums", ctx.module.datums.len());
    println!("   - {} instructions", ctx.module.instructions.len());
    println!("   - {} blocks\n", ctx.module.blocks.len());

    // Add return instruction
    let ret_inst = ctx.module.make_instruction(
        InstructionKind::Return,
        vec![result],
        vec![],
    );
    if let Some(current_block) = ctx.current_block {
        ctx.module.get_block_mut(current_block).unwrap().end = Some(ret_inst);
    }

    // 3. Run optimization passes
    println!("3. Running optimization passes");
    let pass_manager = PassManager::standard();
    pass_manager.run(&mut ctx.module);
    println!("   Optimizations complete:");
    println!("   - Dead code elimination");
    println!("   - Constant folding");
    println!("   - Copy propagation\n");

    // 4. Interpret the IR
    println!("4. Interpreting IR (without JIT)");
    let mut interp = Interpreter::new(ctx.module);
    match interp.execute_function(func_id, vec![]) {
        Ok(value) => {
            println!("   Result: {:?}", value);
            if let Value::Object(obj) = value {
                if obj.is_nil() {
                    println!("   Note: Function calls not yet fully implemented");
                    println!("         Result is NIL (placeholder)");
                }
            }
        }
        Err(e) => println!("   Error: {}", e),
    }
    println!();

    // 5. Future: Codegen
    println!("5. Code generation (future)");
    let mut codegen_ctx = CodegenContext::new(Target::Native);
    match codegen_ctx.codegen_module(&Module::new()) {
        Ok(_) => println!("   Native code generated"),
        Err(e) => println!("   Status: {}", e),
    }
    println!();

    println!("Pipeline complete!");
    println!("\nNext steps:");
    println!("  - Add LLVM backend (when inkwell dependencies ready)");
    println!("  - Add WASM target");
    println!("  - Implement full function calling");
    println!("  - Add more optimization passes");
}
