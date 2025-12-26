/// Demonstration of stack-based MLIR code generation
///
/// This example shows how the new stack-based calling convention works
/// compared to the old tagged i64 approach.

use rlasp_mlir::lib_stack::StackMLIRCodegen;
use rlasp::ir::{ASTNode, ConstantValue};

fn main() {
    println!("=== Stack-Based MLIR Code Generation Demo ===\n");

    demo_arithmetic();
    demo_comparison();
    demo_control_flow();
    demo_list_operations();
}

fn demo_arithmetic() {
    println!("--- Arithmetic Example: (+ (* 5 3) (- 10 2)) ---");

    let mut codegen = StackMLIRCodegen::new("arithmetic_demo");

    // Build AST for: (+ (* 5 3) (- 10 2))
    // Which should equal: 15 + 8 = 23
    let expr = ASTNode::Call {
        function: Box::new(ASTNode::Variable("+".to_string())),
        args: vec![
            // (* 5 3)
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("*".to_string())),
                args: vec![
                    ASTNode::Constant(ConstantValue::Fixnum(5)),
                    ASTNode::Constant(ConstantValue::Fixnum(3)),
                ],
            },
            // (- 10 2)
            ASTNode::Call {
                function: Box::new(ASTNode::Variable("-".to_string())),
                args: vec![
                    ASTNode::Constant(ConstantValue::Fixnum(10)),
                    ASTNode::Constant(ConstantValue::Fixnum(2)),
                ],
            },
        ],
    };

    codegen.compile_expr(&expr).unwrap();
    let mlir = codegen.finalize();

    println!("{}\n", mlir);
    println!("Note: All values flow through the stack, no SSA value returns\n");
}

fn demo_comparison() {
    println!("--- Comparison Example: (< 5 10) ---");

    let mut codegen = StackMLIRCodegen::new("comparison_demo");

    let expr = ASTNode::Call {
        function: Box::new(ASTNode::Variable("<".to_string())),
        args: vec![
            ASTNode::Constant(ConstantValue::Fixnum(5)),
            ASTNode::Constant(ConstantValue::Fixnum(10)),
        ],
    };

    codegen.compile_expr(&expr).unwrap();
    let mlir = codegen.finalize();

    println!("{}\n", mlir);
}

fn demo_control_flow() {
    println!("--- Control Flow Example: (if (< x 10) (* x 2) (/ x 2)) ---");

    let mut codegen = StackMLIRCodegen::new("control_flow_demo");

    // Build AST for: (if (< x 10) (* x 2) (/ x 2))
    // Using concrete values: (if (< 5 10) (* 5 2) (/ 5 2))
    let x = 5;

    let expr = ASTNode::If {
        test: Box::new(ASTNode::Call {
            function: Box::new(ASTNode::Variable("<".to_string())),
            args: vec![
                ASTNode::Constant(ConstantValue::Fixnum(x)),
                ASTNode::Constant(ConstantValue::Fixnum(10)),
            ],
        }),
        then_branch: Box::new(ASTNode::Call {
            function: Box::new(ASTNode::Variable("*".to_string())),
            args: vec![
                ASTNode::Constant(ConstantValue::Fixnum(x)),
                ASTNode::Constant(ConstantValue::Fixnum(2)),
            ],
        }),
        else_branch: Box::new(ASTNode::Call {
            function: Box::new(ASTNode::Variable("/".to_string())),
            args: vec![
                ASTNode::Constant(ConstantValue::Fixnum(x)),
                ASTNode::Constant(ConstantValue::Fixnum(2)),
            ],
        }),
    };

    codegen.compile_expr(&expr).unwrap();
    let mlir = codegen.finalize();

    println!("{}\n", mlir);
    println!("Note: Both branches push results to stack, scf.if doesn't return values\n");
}

fn demo_list_operations() {
    println!("--- List Operations Example: (list 1 2 3) ---");

    let mut codegen = StackMLIRCodegen::new("list_demo");

    let expr = ASTNode::Call {
        function: Box::new(ASTNode::Variable("list".to_string())),
        args: vec![
            ASTNode::Constant(ConstantValue::Fixnum(1)),
            ASTNode::Constant(ConstantValue::Fixnum(2)),
            ASTNode::Constant(ConstantValue::Fixnum(3)),
        ],
    };

    codegen.compile_expr(&expr).unwrap();
    let mlir = codegen.finalize();

    println!("{}\n", mlir);
    println!("Note: List is built from right to left using cons, result on stack\n");
}
