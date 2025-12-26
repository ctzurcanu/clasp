/// Simple S-expression reader
///
/// Parses Lisp syntax into AST nodes

use crate::ir::{ASTNode, ConstantValue};

/// Read error
#[derive(Debug)]
pub enum ReadError {
    UnexpectedEof,
    UnexpectedChar(char),
    InvalidNumber(String),
    UnmatchedParen,
}

impl std::fmt::Display for ReadError {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            ReadError::UnexpectedEof => write!(f, "Unexpected end of input"),
            ReadError::UnexpectedChar(c) => write!(f, "Unexpected character: {}", c),
            ReadError::InvalidNumber(s) => write!(f, "Invalid number: {}", s),
            ReadError::UnmatchedParen => write!(f, "Unmatched parenthesis"),
        }
    }
}

/// Simple reader for S-expressions
pub struct Reader {
    input: Vec<char>,
    pos: usize,
}

impl Reader {
    pub fn new(input: &str) -> Self {
        Self {
            input: input.chars().collect(),
            pos: 0,
        }
    }

    /// Read one form
    pub fn read(&mut self) -> Result<ASTNode, ReadError> {
        self.skip_whitespace();

        if self.is_eof() {
            return Err(ReadError::UnexpectedEof);
        }

        let ch = self.peek();
        match ch {
            '(' => self.read_list(),
            '"' => self.read_string(),
            '\'' => self.read_quote(),
            _ if ch.is_ascii_digit() => self.read_number(),
            _ if ch == '-' && self.pos + 1 < self.input.len() && self.input[self.pos + 1].is_ascii_digit() => {
                // Negative number
                self.read_number()
            }
            _ if ch.is_alphabetic() || "+-*/<>=!?".contains(ch) => self.read_symbol(),
            _ => Err(ReadError::UnexpectedChar(ch)),
        }
    }

    fn read_list(&mut self) -> Result<ASTNode, ReadError> {
        self.consume('(')?;
        self.skip_whitespace();

        if self.peek() == ')' {
            self.advance();
            return Ok(ASTNode::nil()); // empty list is nil
        }

        let mut forms = Vec::new();
        while !self.is_eof() && self.peek() != ')' {
            forms.push(self.read()?);
            self.skip_whitespace();
        }

        if self.peek() != ')' {
            return Err(ReadError::UnmatchedParen);
        }
        self.advance();

        // Convert list to AST
        if forms.is_empty() {
            return Ok(ASTNode::nil());
        }

        // Check for special forms
        if let Some(first) = forms.first() {
            if let ASTNode::Variable(name) = first {
                match name.as_str() {
                    "if" => return self.parse_if(&forms[1..]),
                    "lambda" => return self.parse_lambda(&forms[1..]),
                    "let" | "let*" => return self.parse_let(&forms[1..]),
                    "setq" => return self.parse_setq(&forms[1..]),
                    "define" => return self.parse_define(&forms[1..]),
                    "progn" => return Ok(ASTNode::progn(forms[1..].to_vec())),
                    "cond" => return self.parse_cond(&forms[1..]),
                    "quote" => {
                        if forms.len() == 2 {
                            return Ok(ASTNode::Quote(Box::new(forms[1].clone())));
                        }
                    }
                    _ => {}
                }
            }
        }

        // Regular function call
        Ok(ASTNode::Call {
            function: Box::new(forms[0].clone()),
            args: forms[1..].to_vec(),
        })
    }

    fn read_string(&mut self) -> Result<ASTNode, ReadError> {
        self.consume('"')?;
        let mut s = String::new();

        while !self.is_eof() && self.peek() != '"' {
            s.push(self.peek());
            self.advance();
        }

        if self.peek() != '"' {
            return Err(ReadError::UnexpectedEof);
        }
        self.advance();

        Ok(ASTNode::Constant(ConstantValue::String(s)))
    }

    fn read_quote(&mut self) -> Result<ASTNode, ReadError> {
        self.consume('\'')?;
        let form = self.read()?;
        Ok(ASTNode::Quote(Box::new(form)))
    }

    fn read_number(&mut self) -> Result<ASTNode, ReadError> {
        let mut num_str = String::new();

        if self.peek() == '-' {
            num_str.push('-');
            self.advance();
        }

        while !self.is_eof() && (self.peek().is_ascii_digit() || self.peek() == '.') {
            num_str.push(self.peek());
            self.advance();
        }

        if num_str.contains('.') {
            num_str
                .parse::<f64>()
                .map(ASTNode::float)
                .map_err(|_| ReadError::InvalidNumber(num_str))
        } else {
            num_str
                .parse::<i64>()
                .map(ASTNode::fixnum)
                .map_err(|_| ReadError::InvalidNumber(num_str))
        }
    }

    fn read_symbol(&mut self) -> Result<ASTNode, ReadError> {
        let mut symbol = String::new();

        while !self.is_eof() && !self.is_delimiter(self.peek()) {
            symbol.push(self.peek());
            self.advance();
        }

        // Check for special symbols
        match symbol.as_str() {
            "nil" => Ok(ASTNode::nil()),
            "t" => Ok(ASTNode::t()),
            _ => Ok(ASTNode::variable(symbol)),
        }
    }

    // Special form parsers
    fn parse_if(&self, forms: &[ASTNode]) -> Result<ASTNode, ReadError> {
        if forms.len() < 2 {
            return Err(ReadError::UnexpectedEof);
        }

        let test = forms[0].clone();
        let then_branch = forms[1].clone();
        let else_branch = forms.get(2).cloned().unwrap_or(ASTNode::nil());

        Ok(ASTNode::if_then_else(test, then_branch, else_branch))
    }

    fn parse_lambda(&self, forms: &[ASTNode]) -> Result<ASTNode, ReadError> {
        if forms.len() < 2 {
            return Err(ReadError::UnexpectedEof);
        }

        // Extract parameters from first form (should be a list of symbols)
        let params = self.extract_param_list(&forms[0])?;
        let body = forms[1..].to_vec();

        Ok(ASTNode::lambda(params, body))
    }

    fn extract_param_list(&self, node: &ASTNode) -> Result<Vec<String>, ReadError> {
        match node {
            ASTNode::Call { function, args } => {
                // List of parameters: (x y z) is parsed as Call{function: x, args: [y, z]}
                let mut params = vec![];

                // First parameter from function position
                if let ASTNode::Variable(name) = &**function {
                    params.push(name.clone());
                } else {
                    return Err(ReadError::UnexpectedEof);
                }

                // Remaining parameters from args
                for arg in args {
                    if let ASTNode::Variable(name) = arg {
                        params.push(name.clone());
                    } else {
                        return Err(ReadError::UnexpectedEof);
                    }
                }

                Ok(params)
            }
            ASTNode::Variable(name) => {
                // Single parameter: (lambda x body)
                Ok(vec![name.clone()])
            }
            ASTNode::Constant(ConstantValue::Nil) => {
                // Empty parameter list: (lambda () body)
                Ok(vec![])
            }
            _ => Err(ReadError::UnexpectedEof),
        }
    }

    fn parse_let(&self, forms: &[ASTNode]) -> Result<ASTNode, ReadError> {
        if forms.len() < 2 {
            return Err(ReadError::UnexpectedEof);
        }

        // Parse bindings: ((var1 val1) (var2 val2) ...)
        let bindings = self.extract_bindings(&forms[0])?;
        let body = forms[1..].to_vec();

        Ok(ASTNode::let_bindings(bindings, body))
    }

    fn extract_bindings(&self, node: &ASTNode) -> Result<Vec<(String, ASTNode)>, ReadError> {
        match node {
            ASTNode::Call { function, args } => {
                // List of bindings: ((var val) ...) is parsed as Call
                let mut bindings = vec![];

                // First binding from function position
                let first_binding = self.extract_single_binding(function)?;
                bindings.push(first_binding);

                // Remaining bindings from args
                for arg in args {
                    bindings.push(self.extract_single_binding(arg)?);
                }

                Ok(bindings)
            }
            ASTNode::Constant(ConstantValue::Nil) => {
                // Empty bindings: (let () body)
                Ok(vec![])
            }
            _ => Err(ReadError::UnexpectedEof),
        }
    }

    fn extract_single_binding(&self, node: &ASTNode) -> Result<(String, ASTNode), ReadError> {
        match node {
            ASTNode::Call { function, args } => {
                // Single binding: (var val)
                if let ASTNode::Variable(var) = &**function {
                    if args.len() == 1 {
                        Ok((var.clone(), args[0].clone()))
                    } else {
                        Err(ReadError::UnexpectedEof)
                    }
                } else {
                    Err(ReadError::UnexpectedEof)
                }
            }
            _ => Err(ReadError::UnexpectedEof),
        }
    }

    fn parse_setq(&self, forms: &[ASTNode]) -> Result<ASTNode, ReadError> {
        if forms.len() < 2 {
            return Err(ReadError::UnexpectedEof);
        }

        if let ASTNode::Variable(var) = &forms[0] {
            Ok(ASTNode::setq(var.clone(), forms[1].clone()))
        } else {
            Err(ReadError::UnexpectedEof)
        }
    }

    fn parse_define(&self, forms: &[ASTNode]) -> Result<ASTNode, ReadError> {
        if forms.is_empty() {
            return Err(ReadError::UnexpectedEof);
        }

        // Check if it's a function definition: (define (name params...) body...)
        if let ASTNode::Call { function, args } = &forms[0] {
            // Extract function name and parameters
            if let ASTNode::Variable(name) = &**function {
                // Build parameter list from args
                let mut params = vec![];
                for arg in args {
                    if let ASTNode::Variable(param) = arg {
                        params.push(param.clone());
                    } else {
                        return Err(ReadError::UnexpectedEof);
                    }
                }

                // Body is everything after the parameter list
                if forms.len() < 2 {
                    return Err(ReadError::UnexpectedEof);
                }
                let body = forms[1..].to_vec();

                // Desugar to (setq name (lambda (params...) body...))
                let lambda = ASTNode::lambda(params, body);
                return Ok(ASTNode::setq(name.clone(), lambda));
            }
        }

        // Simple variable definition: (define var value)
        if forms.len() < 2 {
            return Err(ReadError::UnexpectedEof);
        }

        if let ASTNode::Variable(var) = &forms[0] {
            Ok(ASTNode::setq(var.clone(), forms[1].clone()))
        } else {
            Err(ReadError::UnexpectedEof)
        }
    }

    fn parse_cond(&self, forms: &[ASTNode]) -> Result<ASTNode, ReadError> {
        // (cond (test1 result1) (test2 result2) ... (else default))
        // Desugar to nested ifs
        if forms.is_empty() {
            return Ok(ASTNode::nil());
        }

        let mut result = ASTNode::nil();

        // Process clauses in reverse order
        for clause in forms.iter().rev() {
            match clause {
                ASTNode::Call { function, args } => {
                    // Each clause is (test result...)
                    let test = &**function;
                    let body = if args.is_empty() {
                        // (test) with no body returns test value
                        test.clone()
                    } else if args.len() == 1 {
                        args[0].clone()
                    } else {
                        ASTNode::progn(args.clone())
                    };

                    result = ASTNode::if_then_else(test.clone(), body, result);
                }
                _ => return Err(ReadError::UnexpectedEof),
            }
        }

        Ok(result)
    }

    // Utilities
    fn peek(&self) -> char {
        if self.is_eof() {
            '\0'
        } else {
            self.input[self.pos]
        }
    }

    fn advance(&mut self) {
        if !self.is_eof() {
            self.pos += 1;
        }
    }

    fn consume(&mut self, expected: char) -> Result<(), ReadError> {
        if self.peek() == expected {
            self.advance();
            Ok(())
        } else {
            Err(ReadError::UnexpectedChar(self.peek()))
        }
    }

    fn is_eof(&self) -> bool {
        self.pos >= self.input.len()
    }

    fn is_delimiter(&self, ch: char) -> bool {
        ch.is_whitespace() || "()\"'".contains(ch)
    }

    fn skip_whitespace(&mut self) {
        while !self.is_eof() && self.peek().is_whitespace() {
            self.advance();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_read_number() {
        let mut reader = Reader::new("42");
        let ast = reader.read().unwrap();
        assert!(ast.is_constant());
        assert_eq!(ast.as_constant(), Some(&ConstantValue::Fixnum(42)));
    }

    #[test]
    fn test_read_symbol() {
        let mut reader = Reader::new("foo");
        let ast = reader.read().unwrap();
        assert!(ast.is_variable());
    }

    #[test]
    fn test_read_list() {
        let mut reader = Reader::new("(+ 1 2)");
        let ast = reader.read().unwrap();
        match ast {
            ASTNode::Call { function, args } => {
                assert!(function.is_variable());
                assert_eq!(args.len(), 2);
            }
            _ => panic!("Expected call"),
        }
    }

    #[test]
    fn test_read_nested() {
        let mut reader = Reader::new("(+ (* 3 4) 2)");
        let ast = reader.read().unwrap();
        match ast {
            ASTNode::Call { function, args } => {
                assert!(function.is_variable());
                assert_eq!(args.len(), 2);
                // First arg should be another call
                assert!(matches!(&args[0], ASTNode::Call { .. }));
            }
            _ => panic!("Expected call"),
        }
    }

    #[test]
    fn test_read_if() {
        let mut reader = Reader::new("(if t 1 2)");
        let ast = reader.read().unwrap();
        match ast {
            ASTNode::If { .. } => {}
            _ => panic!("Expected if"),
        }
    }
}
