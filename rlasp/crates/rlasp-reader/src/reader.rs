//! Main reader interface

use crate::error::ReaderResult;
use crate::parser::Parser;
use rlasp_runtime::LispObject;

/// High-level reader for Common Lisp source
pub struct Reader {
    parser: Parser,
}

impl Reader {
    /// Create a reader from a string
    pub fn from_string(input: &str) -> ReaderResult<Self> {
        let parser = Parser::new(input)?;
        Ok(Reader { parser })
    }

    /// Read one s-expression
    pub fn read(&mut self) -> ReaderResult<LispObject> {
        self.parser.read()
    }

    /// Read all s-expressions from the input
    pub fn read_all(&mut self) -> ReaderResult<Vec<LispObject>> {
        let mut exprs = Vec::new();
        loop {
            match self.read() {
                Ok(expr) => exprs.push(expr),
                Err(crate::error::ReaderError::UnexpectedEof) => break,
                Err(e) => return Err(e),
            }
        }
        Ok(exprs)
    }
}

/// Convenience function to read a single s-expression from a string
pub fn read_from_string(input: &str) -> ReaderResult<LispObject> {
    let mut reader = Reader::from_string(input)?;
    reader.read()
}

/// Convenience function to read all s-expressions from a string
pub fn read_all_from_string(input: &str) -> ReaderResult<Vec<LispObject>> {
    let mut reader = Reader::from_string(input)?;
    reader.read_all()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_read_from_string() {
        let expr = read_from_string("(+ 1 2)").unwrap();
        assert!(expr.is_cons());
    }

    #[test]
    fn test_read_all() {
        let exprs = read_all_from_string("1 2 3").unwrap();
        assert_eq!(exprs.len(), 3);
        assert_eq!(exprs[0].as_fixnum(), Some(1));
        assert_eq!(exprs[1].as_fixnum(), Some(2));
        assert_eq!(exprs[2].as_fixnum(), Some(3));
    }

    #[test]
    fn test_read_complex_expr() {
        let expr = read_from_string("(defun factorial (n) (if (<= n 1) 1 (* n (factorial (- n 1)))))").unwrap();
        assert!(expr.is_cons());
    }
}
