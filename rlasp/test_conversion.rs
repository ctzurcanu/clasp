extern crate rlasp;

use rlasp::repl::lisp_to_ast;

fn main() {
    let obj = rlasp_reader::read_from_string("(+ 1 2)").unwrap();
    println!("Read object successfully");
    
    match lisp_to_ast::lisp_to_ast(obj) {
        Ok(ast) => {
            println!("Converted to AST successfully");
            println!("AST: {:?}", ast);
        }
        Err(e) => {
            println!("Error converting: {}", e);
        }
    }
}
