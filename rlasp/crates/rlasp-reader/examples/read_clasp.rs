//! Test reading actual Clasp source files

use rlasp_reader::{Reader, read_from_string};

fn main() {
    println!("=== rlasp Reader - Clasp Source Test ===\n");

    // Test 1: Simple expression
    println!("Test 1: Simple expression");
    let expr1 = read_from_string("(defun factorial (n) (if (<= n 1) 1 (* n (factorial (- n 1)))))").unwrap();
    println!("  Parsed: {}", expr1);
    println!("  ✓ Success!\n");

    // Test 2: Multiple expressions
    println!("Test 2: Multiple expressions");
    let code2 = "(+ 1 2) (* 3 4) (/ 10 2)";
    let mut reader2 = Reader::from_string(code2).unwrap();
    let exprs = reader2.read_all().unwrap();
    println!("  Read {} expressions:", exprs.len());
    for (i, expr) in exprs.iter().enumerate() {
        println!("    {}: {}", i + 1, expr);
    }
    println!("  ✓ Success!\n");

    // Test 3: Reader macros
    println!("Test 3: Reader macros");
    let expr3 = read_from_string("'(a b c)").unwrap();
    println!("  Quote: {}", expr3);
    let expr4 = read_from_string("#'factorial").unwrap();
    println!("  Function: {}", expr4);
    let expr5 = read_from_string("`(a ,b ,@c)").unwrap();
    println!("  Backquote: {}", expr5);
    println!("  ✓ Success!\n");

    // Test 4: Clasp kernel code snippet
    println!("Test 4: Clasp kernel snippet");
    let clasp_code = r#"
        (defun search-keyword (list key)
          (cond ((atom list) 'missing-keyword)
                ((atom (cdr list)) 'missing-keyword)
                ((eq (car list) key) (cadr list))
                (t (search-keyword (cddr list) key))))
    "#;
    let expr = read_from_string(clasp_code).unwrap();
    println!("  Parsed Clasp function:");
    println!("  {}", expr);
    println!("  ✓ Success!\n");

    // Test 5: Comments
    println!("Test 5: Comments");
    let code_with_comments = r#"
        ; This is a line comment
        (+ 1 2)  ; inline comment
        #| block
           comment |#
        (* 3 4)
    "#;
    let mut reader = Reader::from_string(code_with_comments).unwrap();
    let exprs = reader.read_all().unwrap();
    println!("  Read {} expressions (comments ignored):", exprs.len());
    for expr in exprs {
        println!("    {}", expr);
    }
    println!("  ✓ Success!\n");

    // Test 6: Keywords
    println!("Test 6: Keywords");
    let expr6 = read_from_string("(:key1 value1 :key2 value2)").unwrap();
    println!("  Keyword list: {}", expr6);
    println!("  ✓ Success!\n");

    // Test 7: Vectors
    println!("Test 7: Vectors");
    let expr7 = read_from_string("#(1 2 3 4 5)").unwrap();
    println!("  Vector: {}", expr7);
    println!("  ✓ Success!\n");

    // Test 8: Nested structures
    println!("Test 8: Nested structures");
    let expr8 = read_from_string("(defclass point () ((x :accessor point-x) (y :accessor point-y)))").unwrap();
    println!("  Defclass: {}", expr8);
    println!("  ✓ Success!\n");

    println!("=== All Tests Passed! ===");
    println!("The reader successfully parses Clasp-style Common Lisp code.");
}
