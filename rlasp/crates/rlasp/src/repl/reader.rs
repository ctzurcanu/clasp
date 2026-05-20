/// Simple S-expression reader
///
/// Parses Lisp syntax into AST nodes
use crate::ir::{ASTNode, ConstantValue};

const READER_SKIP_MARKER: &str = "__RLASP_READER_SKIP__";

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
        loop {
            let form = self.read_raw()?;
            if Self::is_reader_skip_marker(&form) {
                continue;
            }
            return Ok(form);
        }
    }

    fn read_raw(&mut self) -> Result<ASTNode, ReadError> {
        self.skip_whitespace();

        if self.is_eof() {
            return Err(ReadError::UnexpectedEof);
        }

        let ch = self.peek();
        match ch {
            '(' => self.read_list(),
            '"' => self.read_string(),
            '\'' => self.read_quote(),
            '`' => self.read_backquote(),
            ',' => self.read_unquote(),
            ':' => {
                // Could be keyword or part of symbol (package::symbol)
                // Peek ahead to see if it's followed by another : or alphanumeric
                if self.pos + 1 < self.input.len() {
                    let next_ch = self.input[self.pos + 1];
                    if next_ch == ':' || next_ch.is_alphanumeric() {
                        // It's a keyword :foo or might be part of package::symbol
                        self.read_keyword()
                    } else {
                        // Standalone : - treat as keyword
                        self.read_keyword()
                    }
                } else {
                    self.read_keyword()
                }
            }
            '#' => self.read_sharp(),
            _ if ch.is_ascii_digit() => self.read_number(),
            _ if ch == '-'
                && self.pos + 1 < self.input.len()
                && self.input[self.pos + 1].is_ascii_digit() =>
            {
                // Negative number
                self.read_number()
            }
            _ if ch == '.'
                && self.pos + 1 < self.input.len()
                && self.input[self.pos + 1].is_ascii_digit() =>
            {
                // Float starting with decimal point (e.g., .5)
                self.read_number()
            }
            _ if ch.is_alphabetic() || "+-*/<>=!?&%".contains(ch) => self.read_symbol(),
            _ => Err(ReadError::UnexpectedChar(ch)),
        }
    }

    pub fn position(&self) -> usize {
        self.pos
    }

    fn read_list(&mut self) -> Result<ASTNode, ReadError> {
        self.consume('(')?;
        self.skip_whitespace();

        if self.peek() == ')' {
            self.advance();
            return Ok(ASTNode::nil()); // empty list is nil
        }

        let mut forms = Vec::new();
        let mut dotted_tail: Option<ASTNode> = None;

        while !self.is_eof() && self.peek() != ')' {
            // Check for dotted pair notation (. must be followed by whitespace or ))
            if self.peek() == '.' && self.pos + 1 < self.input.len() {
                let next_ch = self.input[self.pos + 1];
                if next_ch.is_whitespace() || next_ch == ')' {
                    // It's a dotted pair
                    self.advance();
                    self.skip_whitespace();
                    // Next form is the tail
                    dotted_tail = Some(self.read()?);
                    self.skip_whitespace();
                    break;
                }
            }

            let form = self.read_raw()?;
            if Self::is_reader_skip_marker(&form) {
                self.skip_whitespace();
                continue;
            }
            forms.push(form);
            self.skip_whitespace();
        }

        if self.peek() != ')' {
            return Err(ReadError::UnmatchedParen);
        }
        self.advance();

        // Handle dotted pairs
        if let Some(tail) = dotted_tail {
            if forms.len() == 1 {
                // (a . b) - simple dotted pair
                return Ok(ASTNode::DottedPair {
                    car: Box::new(forms[0].clone()),
                    cdr: Box::new(tail),
                });
            } else if !forms.is_empty() {
                // (a b c . d) - improper list
                // Build nested conses ending with tail instead of nil
                return Ok(ASTNode::DottedPair {
                    car: Box::new(forms[0].clone()),
                    cdr: Box::new(self.build_improper_list(&forms[1..], tail)),
                });
            }
        }

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

        // Handle floats starting with . (e.g., .5)
        if self.peek() == '.' {
            num_str.push('0'); // Prepend 0 for parsing
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
            // Try to parse as i64 first
            if let Ok(n) = num_str.parse::<i64>() {
                Ok(ASTNode::fixnum(n))
            } else {
                // Too large for i64, store as bignum
                // Validate it's a valid integer
                if num_str
                    .chars()
                    .all(|c| c.is_ascii_digit() || c == '-' || c == '+')
                {
                    Ok(ASTNode::Constant(crate::ir::ConstantValue::Bignum(num_str)))
                } else {
                    Err(ReadError::InvalidNumber(num_str))
                }
            }
        }
    }

    fn read_number_with_radix(&mut self, radix: u32) -> Result<ASTNode, ReadError> {
        let mut num_str = String::new();

        // Read digits valid for this radix
        while !self.is_eof() {
            let ch = self.peek();
            if ch.is_ascii_hexdigit() && ch.to_digit(radix).is_some() {
                num_str.push(ch);
                self.advance();
            } else if ch.is_alphanumeric() {
                // Invalid digit for this radix
                return Err(ReadError::InvalidNumber(format!(
                    "Invalid digit for radix {}: {}",
                    radix, ch
                )));
            } else {
                break;
            }
        }

        if num_str.is_empty() {
            return Err(ReadError::InvalidNumber("Empty number".to_string()));
        }

        i64::from_str_radix(&num_str, radix)
            .map(ASTNode::fixnum)
            .map_err(|_| ReadError::InvalidNumber(num_str))
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

    fn read_keyword(&mut self) -> Result<ASTNode, ReadError> {
        self.consume(':')?;
        let mut keyword = String::new();

        while !self.is_eof() && !self.is_delimiter(self.peek()) {
            keyword.push(self.peek());
            self.advance();
        }

        // Keywords are represented as symbols with : prefix
        Ok(ASTNode::variable(format!(":{}", keyword)))
    }

    fn read_backquote(&mut self) -> Result<ASTNode, ReadError> {
        self.consume('`')?;
        let form = self.read()?;
        Ok(ASTNode::Backquote(Box::new(form)))
    }

    fn read_unquote(&mut self) -> Result<ASTNode, ReadError> {
        self.consume(',')?;
        // Check for ,@ (unquote-splicing)
        if self.peek() == '@' {
            self.advance();
            let form = self.read()?;
            Ok(ASTNode::UnquoteSplicing(Box::new(form)))
        } else {
            // Just , (unquote)
            let form = self.read()?;
            Ok(ASTNode::Unquote(Box::new(form)))
        }
    }

    fn read_sharp(&mut self) -> Result<ASTNode, ReadError> {
        self.consume('#')?;
        let ch = self.peek();

        match ch {
            '\\' => {
                // Character literal #\a, #\newline, etc.
                self.advance();
                self.read_character()
            }
            '(' => {
                // Vector #(...)
                self.advance();
                self.read_vector()
            }
            '\'' => {
                // Function #'foo -> (function foo)
                self.advance();
                let form = self.read()?;
                Ok(ASTNode::Call {
                    function: Box::new(ASTNode::variable("function".to_string())),
                    args: vec![form],
                })
            }
            '+' => {
                // Reader conditional #+feature form
                // Include form if feature IS present in *features*
                self.advance();
                let feature = self.read()?; // Read feature expression
                let form = self.read_raw()?; // Read controlled form
                if self.feature_present(&feature) {
                    Ok(form)
                } else {
                    // Feature not present - suppress this object.
                    Ok(ASTNode::variable(READER_SKIP_MARKER.to_string()))
                }
            }
            '-' => {
                // Reader conditional #-feature form
                // Include form if feature is NOT present in *features*
                self.advance();
                let feature = self.read()?; // Read feature expression
                let form = self.read_raw()?; // Read controlled form
                if !self.feature_present(&feature) {
                    Ok(form)
                } else {
                    // Feature present - suppress this object.
                    Ok(ASTNode::variable(READER_SKIP_MARKER.to_string()))
                }
            }
            '|' => {
                // Block comment already handled in skip_whitespace
                // But if we get here, consume it
                self.advance();
                let mut depth = 1;
                while depth > 0 && !self.is_eof() {
                    if self.peek() == '#'
                        && self.pos + 1 < self.input.len()
                        && self.input[self.pos + 1] == '|'
                    {
                        depth += 1;
                        self.advance();
                        self.advance();
                    } else if self.peek() == '|'
                        && self.pos + 1 < self.input.len()
                        && self.input[self.pos + 1] == '#'
                    {
                        depth -= 1;
                        self.advance();
                        self.advance();
                    } else {
                        self.advance();
                    }
                }
                // Read next form after comment
                self.read()
            }
            ':' => {
                // Uninterned symbol #:symbol
                self.advance();
                // Read the symbol name
                let mut symbol = String::new();
                while !self.is_eof() && !self.is_delimiter(self.peek()) {
                    symbol.push(self.peek());
                    self.advance();
                }
                // Represent as a gensym-like symbol
                Ok(ASTNode::variable(format!("#:{}", symbol)))
            }
            'P' | 'p' => {
                // Pathname literal #P"pathname"
                self.advance();
                // Next should be a string
                if self.peek() == '"' {
                    let path_node = self.read_string()?;
                    // Wrap in a pathname constructor call
                    Ok(ASTNode::Call {
                        function: Box::new(ASTNode::variable("pathname".to_string())),
                        args: vec![path_node],
                    })
                } else {
                    Err(ReadError::UnexpectedChar(self.peek()))
                }
            }
            'x' | 'X' => {
                // Hexadecimal number #xABCD
                self.advance();
                self.read_number_with_radix(16)
            }
            'o' | 'O' => {
                // Octal number #o777
                self.advance();
                self.read_number_with_radix(8)
            }
            'b' | 'B' => {
                // Binary number #b1010
                self.advance();
                self.read_number_with_radix(2)
            }
            'C' | 'c' => {
                // Complex number literal #C(real imag)
                self.advance();
                if self.peek() != '(' {
                    return Err(ReadError::UnexpectedChar(self.peek()));
                }
                self.advance(); // consume '('
                self.skip_whitespace();
                let real_node = self.read()?;
                self.skip_whitespace();
                let imag_node = self.read()?;
                self.skip_whitespace();
                if self.peek() == ')' {
                    self.advance();
                } else {
                    return Err(ReadError::UnexpectedChar(self.peek()));
                }
                // Emit (complex real imag)
                Ok(ASTNode::Call {
                    function: Box::new(ASTNode::variable("complex".to_string())),
                    args: vec![real_node, imag_node],
                })
            }
            _ => Err(ReadError::UnexpectedChar(ch)),
        }
    }

    fn read_character(&mut self) -> Result<ASTNode, ReadError> {
        let mut name = String::new();

        // Read character name
        while !self.is_eof() && !self.is_delimiter(self.peek()) {
            name.push(self.peek());
            self.advance();
        }

        if name.is_empty() {
            return Err(ReadError::UnexpectedEof);
        }

        let ch = rlasp_runtime::parse_character_name(&name)
            .ok_or_else(|| ReadError::InvalidNumber(format!("Unknown character: {}", name)))?;

        Ok(ASTNode::Constant(ConstantValue::Character(ch)))
    }

    fn read_vector(&mut self) -> Result<ASTNode, ReadError> {
        // Read elements until )
        self.skip_whitespace();
        let mut elements = Vec::new();

        while !self.is_eof() && self.peek() != ')' {
            let form = self.read_raw()?;
            if Self::is_reader_skip_marker(&form) {
                self.skip_whitespace();
                continue;
            }
            elements.push(form);
            self.skip_whitespace();
        }

        if self.peek() != ')' {
            return Err(ReadError::UnmatchedParen);
        }
        self.advance();

        // Vector literal #(a b c) -> ASTNode::Vector([a, b, c])
        Ok(ASTNode::Vector(elements))
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

    fn build_improper_list(&self, forms: &[ASTNode], tail: ASTNode) -> ASTNode {
        if forms.is_empty() {
            tail
        } else {
            ASTNode::DottedPair {
                car: Box::new(forms[0].clone()),
                cdr: Box::new(self.build_improper_list(&forms[1..], tail)),
            }
        }
    }

    fn skip_whitespace(&mut self) {
        loop {
            // Skip whitespace
            while !self.is_eof() && self.peek().is_whitespace() {
                self.advance();
            }

            // Skip comments
            if self.peek() == ';' {
                // Line comment - skip until newline
                while !self.is_eof() && self.peek() != '\n' {
                    self.advance();
                }
                if self.peek() == '\n' {
                    self.advance();
                }
                continue;
            }

            // Block comment #|...|#
            if self.peek() == '#'
                && self.pos + 1 < self.input.len()
                && self.input[self.pos + 1] == '|'
            {
                self.advance(); // skip #
                self.advance(); // skip |
                let mut depth = 1;
                while depth > 0 && !self.is_eof() {
                    if self.peek() == '#'
                        && self.pos + 1 < self.input.len()
                        && self.input[self.pos + 1] == '|'
                    {
                        depth += 1;
                        self.advance();
                        self.advance();
                    } else if self.peek() == '|'
                        && self.pos + 1 < self.input.len()
                        && self.input[self.pos + 1] == '#'
                    {
                        depth -= 1;
                        self.advance();
                        self.advance();
                    } else {
                        self.advance();
                    }
                }
                continue;
            }

            break;
        }
    }

    /// Check if a feature is present in *features*
    /// Handles simple features (symbols) and compound features (and, or, not)
    fn feature_present(&self, feature: &ASTNode) -> bool {
        // Get the features list from the global state
        let features_list = super::eval::eval_symbol::get_features();
        self.check_feature(feature, &features_list)
    }

    /// Check if a feature expression matches the current features
    fn check_feature(&self, feature: &ASTNode, features: &super::eval::EvalResult) -> bool {
        use super::eval::EvalResult;

        match feature {
            // Simple feature - check if symbol is in *features*
            ASTNode::Variable(name) | ASTNode::Constant(ConstantValue::Symbol(name)) => {
                let feature_name = name.trim_start_matches(':').to_uppercase();
                self.feature_in_list(&feature_name, features)
            }
            // Compound feature expression: (and ...), (or ...), (not ...)
            ASTNode::Call { function, args } => {
                if let ASTNode::Variable(op) = function.as_ref() {
                    match op.to_lowercase().as_str() {
                        "and" => args.iter().all(|f| self.check_feature(f, features)),
                        "or" => args.iter().any(|f| self.check_feature(f, features)),
                        "not" => {
                            if args.len() == 1 {
                                !self.check_feature(&args[0], features)
                            } else {
                                false
                            }
                        }
                        _ => false,
                    }
                } else {
                    false
                }
            }
            _ => false,
        }
    }

    /// Check if a feature name is in the features list
    fn feature_in_list(&self, name: &str, features: &super::eval::EvalResult) -> bool {
        use super::eval::EvalResult;

        match features {
            EvalResult::Cons(car, cdr) => {
                let car_val = car.borrow();
                let matches = match &*car_val {
                    EvalResult::Symbol(s) => {
                        let feat_name = s.trim_start_matches(':').to_uppercase();
                        feat_name == name
                    }
                    _ => false,
                };
                if matches {
                    true
                } else {
                    self.feature_in_list(name, &cdr.borrow())
                }
            }
            EvalResult::Nil => false,
            _ => false,
        }
    }

    fn is_reader_skip_marker(form: &ASTNode) -> bool {
        matches!(form, ASTNode::Variable(name) if name == READER_SKIP_MARKER)
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
