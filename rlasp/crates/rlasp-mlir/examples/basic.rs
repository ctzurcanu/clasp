use rlasp_mlir::MLIRCodegen;
use rlasp::ir::{ASTNode, ConstantValue};

fn main() {
    let mut codegen = MLIRCodegen::new("test_module");

    // (defun add-one (x) (+ x 1))
    println!("=== Example 1: Simple addition ===");
    let body1 = ASTNode::Call {
        function: Box::new(ASTNode::Variable("+".to_string())),
        args: vec![
            ASTNode::Variable("x".to_string()),
            ASTNode::Constant(ConstantValue::Fixnum(1)),
        ],
    };

    codegen.compile_function("add_one", &["x".to_string()], &body1).unwrap();

    // (defun factorial (n) (if (< n 2) 1 (* n (factorial (- n 1)))))
    // For now, just a simple version
    println!("\n=== Example 2: Subtraction ===");
    let body2 = ASTNode::Call {
        function: Box::new(ASTNode::Variable("-".to_string())),
        args: vec![
            ASTNode::Variable("n".to_string()),
            ASTNode::Constant(ConstantValue::Fixnum(1)),
        ],
    };

    codegen.compile_function("decrement", &["n".to_string()], &body2).unwrap();

    let mlir = codegen.finalize();
    println!("\n=== Generated MLIR ===");
    println!("{}", mlir);
}
