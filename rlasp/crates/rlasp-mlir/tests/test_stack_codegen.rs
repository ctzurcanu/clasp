/// Test for stack-based MLIR code generator

use rlasp_mlir::lib_stack::StackMLIRCodegen;
use rlasp::ir::{ASTNode, ConstantValue};

#[test]
fn test_simple_addition() {
    let mut codegen = StackMLIRCodegen::new("test_add");

    // Create (+ 5 3) expression
    let expr = ASTNode::Call {
        function: Box::new(ASTNode::Variable("+".to_string())),
        args: vec![
            ASTNode::Constant(ConstantValue::Fixnum(5)),
            ASTNode::Constant(ConstantValue::Fixnum(3)),
        ],
    };

    // Compile the expression
    codegen.compile_expr(&expr).unwrap();

    // Get the output
    let output = codegen.finalize();

    // Verify it contains stack operations
    assert!(output.contains("stack_push_fixnum"));
    assert!(output.contains("stack_pop_fixnum"));
    assert!(output.contains("arith.addi"));

    println!("Generated MLIR:\n{}", output);
}

#[test]
fn test_comparison() {
    let mut codegen = StackMLIRCodegen::new("test_cmp");

    // Create (< 5 10) expression
    let expr = ASTNode::Call {
        function: Box::new(ASTNode::Variable("<".to_string())),
        args: vec![
            ASTNode::Constant(ConstantValue::Fixnum(5)),
            ASTNode::Constant(ConstantValue::Fixnum(10)),
        ],
    };

    codegen.compile_expr(&expr).unwrap();
    let output = codegen.finalize();

    assert!(output.contains("arith.cmpi slt"));
    assert!(output.contains("stack_push_pointer"));

    println!("Generated MLIR:\n{}", output);
}

#[test]
fn test_if_expression() {
    let mut codegen = StackMLIRCodegen::new("test_if");

    // Create (if (< 5 10) 1 0) expression
    let expr = ASTNode::If {
        test: Box::new(ASTNode::Call {
            function: Box::new(ASTNode::Variable("<".to_string())),
            args: vec![
                ASTNode::Constant(ConstantValue::Fixnum(5)),
                ASTNode::Constant(ConstantValue::Fixnum(10)),
            ],
        }),
        then_branch: Box::new(ASTNode::Constant(ConstantValue::Fixnum(1))),
        else_branch: Box::new(ASTNode::Constant(ConstantValue::Fixnum(0))),
    };

    codegen.compile_expr(&expr).unwrap();
    let output = codegen.finalize();

    assert!(output.contains("scf.if"));
    assert!(output.contains("} else {"));

    println!("Generated MLIR:\n{}", output);
}

#[test]
fn test_list_operations() {
    let mut codegen = StackMLIRCodegen::new("test_list");

    // Create (cons 1 2) expression
    let expr = ASTNode::Call {
        function: Box::new(ASTNode::Variable("cons".to_string())),
        args: vec![
            ASTNode::Constant(ConstantValue::Fixnum(1)),
            ASTNode::Constant(ConstantValue::Fixnum(2)),
        ],
    };

    codegen.compile_expr(&expr).unwrap();
    let output = codegen.finalize();

    assert!(output.contains("cc_cons"));

    println!("Generated MLIR:\n{}", output);
}
