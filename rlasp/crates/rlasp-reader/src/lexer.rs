//! Lexical analyzer (tokenizer) for Common Lisp

use crate::error::{ReaderError, ReaderResult};
use crate::token::{Token, TokenKind};
use rlasp_runtime::FloatFormat;

/// Lexer for tokenizing Common Lisp source
pub struct Lexer {
    input: Vec<char>,
    pos: usize,
    suppress_reader_errors: bool,
}

impl Lexer {
    /// Create a new lexer from a string
    pub fn new(input: &str) -> Self {
        Lexer {
            input: input.chars().collect(),
            pos: 0,
            suppress_reader_errors: false,
        }
    }

    /// Enable/disable permissive tokenization used for read-suppressed forms
    /// (e.g. skipped #+ / #- branches). Returns the previous state.
    pub fn set_reader_error_suppressed(&mut self, suppress: bool) -> bool {
        let previous = self.suppress_reader_errors;
        self.suppress_reader_errors = suppress;
        previous
    }

    /// Get the next token
    pub fn next_token(&mut self) -> ReaderResult<Token> {
        self.skip_whitespace_and_comments()?;

        if self.is_eof() {
            return Ok(Token::new(TokenKind::Eof, self.pos));
        }

        let start_pos = self.pos;
        let ch = self.current_char();

        match ch {
            '(' => {
                self.advance();
                Ok(Token::new(TokenKind::LeftParen, start_pos))
            }
            ')' => {
                self.advance();
                Ok(Token::new(TokenKind::RightParen, start_pos))
            }
            '[' => {
                self.advance();
                Ok(Token::new(TokenKind::LeftBracket, start_pos))
            }
            ']' => {
                self.advance();
                Ok(Token::new(TokenKind::RightBracket, start_pos))
            }
            '{' => {
                self.advance();
                Ok(Token::new(TokenKind::LeftBrace, start_pos))
            }
            '}' => {
                self.advance();
                Ok(Token::new(TokenKind::RightBrace, start_pos))
            }
            '\'' => {
                self.advance();
                Ok(Token::new(TokenKind::Quote, start_pos))
            }
            '`' => {
                self.advance();
                Ok(Token::new(TokenKind::Backquote, start_pos))
            }
            ',' => {
                self.advance();
                if self.current_char() == '@' {
                    self.advance();
                    Ok(Token::new(TokenKind::CommaAt, start_pos))
                } else {
                    Ok(Token::new(TokenKind::Comma, start_pos))
                }
            }
            '"' => self.read_string(start_pos),
            '|' => self.read_escaped_symbol(start_pos),
            '#' => self.read_sharp_macro(start_pos),
            ':' => {
                self.advance();
                if self.current_char() == ':' {
                    self.advance();
                    Ok(Token::new(TokenKind::DoubleColon, start_pos))
                } else if self.is_symbol_start(self.current_char()) || self.current_char() == '\\' {
                    // :keyword (possibly with escaped chars like :\.)
                    let name = self.read_symbol_name();
                    Ok(Token::new(TokenKind::Keyword(name), start_pos))
                } else {
                    Ok(Token::new(TokenKind::SingleColon, start_pos))
                }
            }
            '.' => {
                self.advance();
                // Check if it's a standalone dot (for dotted pairs)
                if !self.is_constituent_char(self.current_char()) {
                    Ok(Token::new(TokenKind::Dot, start_pos))
                } else {
                    // It's part of a symbol like .foo or a number like .5
                    self.pos = start_pos; // Reset
                    self.read_atom(start_pos)
                }
            }
            _ if ch.is_ascii_digit() || ch == '-' || ch == '+' => {
                self.read_number_or_symbol(start_pos)
            }
            '\\' => {
                // Single escape character — next char is part of symbol name (case-preserved)
                self.advance();
                let escaped = self.current_char();
                if escaped == '\0' {
                    return Err(ReaderError::UnexpectedEof);
                }
                self.advance();
                let mut name = String::new();
                name.push(escaped);
                // Continue reading symbol chars
                while self.pos < self.input.len() {
                    let c = self.current_char();
                    if c == '\\' {
                        self.advance();
                        let esc = self.current_char();
                        if esc != '\0' {
                            name.push(esc);
                            self.advance();
                        }
                    } else if self.is_constituent_char(c) {
                        name.push(c);
                        self.advance();
                    } else {
                        break;
                    }
                }
                Ok(Token::new(TokenKind::Symbol(name), start_pos))
            }
            _ if self.is_symbol_start(ch) => {
                let name = self.read_symbol_name();
                Ok(Token::new(TokenKind::Symbol(name), start_pos))
            }
            _ => Err(ReaderError::UnexpectedChar { ch, pos: start_pos }),
        }
    }

    /// Peek at the next token without consuming it
    pub fn peek_token(&mut self) -> ReaderResult<Token> {
        let saved_pos = self.pos;
        let token = self.next_token()?;
        self.pos = saved_pos;
        Ok(token)
    }

    /// Current character position in the input stream.
    pub fn position(&self) -> usize {
        self.pos
    }

    // Helper methods

    fn current_char(&self) -> char {
        if self.pos < self.input.len() {
            self.input[self.pos]
        } else {
            '\0'
        }
    }

    fn peek_char(&self, offset: usize) -> char {
        let pos = self.pos + offset;
        if pos < self.input.len() {
            self.input[pos]
        } else {
            '\0'
        }
    }

    fn advance(&mut self) {
        if self.pos < self.input.len() {
            self.pos += 1;
        }
    }

    fn is_eof(&self) -> bool {
        self.pos >= self.input.len()
    }

    fn skip_whitespace_and_comments(&mut self) -> ReaderResult<()> {
        loop {
            let ch = self.current_char();

            if ch.is_whitespace() {
                self.advance();
            } else if ch == ';' {
                // Line comment - skip until newline
                self.skip_line_comment();
            } else if ch == '#' && self.peek_char(1) == '|' {
                // Block comment #|...|#
                self.skip_block_comment()?;
            } else {
                break;
            }
        }
        Ok(())
    }

    fn skip_line_comment(&mut self) {
        while !self.is_eof() && self.current_char() != '\n' {
            self.advance();
        }
        if self.current_char() == '\n' {
            self.advance();
        }
    }

    fn skip_block_comment(&mut self) -> ReaderResult<()> {
        let start_pos = self.pos;
        self.advance(); // skip #
        self.advance(); // skip |

        let mut depth = 1;
        while depth > 0 && !self.is_eof() {
            if self.current_char() == '#' && self.peek_char(1) == '|' {
                depth += 1;
                self.advance();
                self.advance();
            } else if self.current_char() == '|' && self.peek_char(1) == '#' {
                depth -= 1;
                self.advance();
                self.advance();
            } else {
                self.advance();
            }
        }

        if depth > 0 {
            Err(ReaderError::UnterminatedComment { pos: start_pos })
        } else {
            Ok(())
        }
    }

    fn read_string(&mut self, start_pos: usize) -> ReaderResult<Token> {
        self.advance(); // skip opening "
        let mut result = String::new();

        while !self.is_eof() && self.current_char() != '"' {
            if self.current_char() == '\\' {
                self.advance();
                if self.is_eof() {
                    return Err(ReaderError::UnterminatedString { pos: start_pos });
                }
                // Handle escape sequences
                match self.current_char() {
                    'n' => result.push('\n'),
                    't' => result.push('\t'),
                    'r' => result.push('\r'),
                    '\\' => result.push('\\'),
                    '"' => result.push('"'),
                    c => result.push(c), // Unknown escape - keep as-is
                }
                self.advance();
            } else {
                result.push(self.current_char());
                self.advance();
            }
        }

        if self.is_eof() {
            Err(ReaderError::UnterminatedString { pos: start_pos })
        } else {
            self.advance(); // skip closing "
            Ok(Token::new(TokenKind::String(result), start_pos))
        }
    }

    fn read_escaped_symbol(&mut self, start_pos: usize) -> ReaderResult<Token> {
        self.advance(); // skip opening |
        let mut result = String::new();

        while !self.is_eof() && self.current_char() != '|' {
            if self.current_char() == '\\' {
                // Escape sequence in escaped symbol
                self.advance();
                if self.is_eof() {
                    return Err(ReaderError::UnterminatedString { pos: start_pos });
                }
                // In escaped symbols, backslash escapes the next character
                result.push(self.current_char());
                self.advance();
            } else {
                result.push(self.current_char());
                self.advance();
            }
        }

        if self.is_eof() {
            Err(ReaderError::UnterminatedString { pos: start_pos })
        } else {
            self.advance(); // skip closing |
            Ok(Token::new(TokenKind::Symbol(result), start_pos))
        }
    }

    fn read_sharp_macro(&mut self, start_pos: usize) -> ReaderResult<Token> {
        self.advance(); // skip #
        let ch = self.current_char();

        match ch {
            '\'' => {
                self.advance();
                Ok(Token::new(TokenKind::Function, start_pos))
            }
            '(' => {
                self.advance();
                Ok(Token::new(TokenKind::HashLeftParen, start_pos))
            }
            '\\' => {
                self.advance();
                self.read_character(start_pos)
            }
            '.' => {
                self.advance();
                Ok(Token::new(TokenKind::HashDot, start_pos))
            }
            '+' => {
                self.advance();
                Ok(Token::new(TokenKind::HashPlus, start_pos))
            }
            '-' => {
                self.advance();
                Ok(Token::new(TokenKind::HashMinus, start_pos))
            }
            ':' => {
                self.advance();
                Ok(Token::new(TokenKind::HashColon, start_pos))
            }
            '*' => {
                self.advance();
                // Consume raw bit payload directly so leading zeros are preserved.
                let mut bits = String::new();
                while matches!(self.current_char(), '0' | '1') {
                    bits.push(self.current_char());
                    self.advance();
                }
                Ok(Token::new(TokenKind::HashStar(bits), start_pos))
            }
            c if c.is_ascii_digit() => {
                // Read all consecutive digits
                let mut digits = String::new();
                while self.current_char().is_ascii_digit() {
                    digits.push(self.current_char());
                    self.advance();
                }

                let next_ch = self.current_char();

                // Check what follows the digits
                if next_ch == '=' {
                    // Label definition: #n=
                    let label = digits.parse::<u8>().unwrap_or(0);
                    self.advance();
                    Ok(Token::new(TokenKind::HashEquals(label), start_pos))
                } else if next_ch == '#' {
                    // Label reference: #n#
                    let label = digits.parse::<u8>().unwrap_or(0);
                    self.advance();
                    Ok(Token::new(TokenKind::HashRef(label), start_pos))
                } else if next_ch == 'r' || next_ch == 'R' {
                    // Radix notation: #<radix>r<number>
                    self.advance(); // skip r/R
                    let radix = digits.parse::<u32>().unwrap_or(10);
                    if radix < 2 || radix > 36 {
                        return Err(ReaderError::InvalidSyntax {
                            msg: format!("Invalid radix: {}", radix),
                            pos: start_pos,
                        });
                    }
                    // Read the number in the specified radix
                    let num_text = self.read_atom_text();

                    // Check if it's a ratio (contains /)
                    if let Some(slash_pos) = num_text.find('/') {
                        let num_str = &num_text[..slash_pos];
                        let den_str = &num_text[slash_pos + 1..];
                        if let (Ok(num), Ok(den)) = (
                            i64::from_str_radix(num_str, radix),
                            i64::from_str_radix(den_str, radix),
                        ) {
                            if den != 0 {
                                return Ok(Token::new(
                                    TokenKind::Ratio(num.to_string(), den.to_string()),
                                    start_pos,
                                ));
                            }
                        }
                        return Err(ReaderError::InvalidSyntax {
                            msg: format!("Invalid ratio in base {}: {}", radix, num_text),
                            pos: start_pos,
                        });
                    }

                    // Otherwise it's an integer
                    if let Ok(val) = i64::from_str_radix(&num_text, radix) {
                        Ok(Token::new(TokenKind::Integer(val), start_pos))
                    } else {
                        Err(ReaderError::InvalidSyntax {
                            msg: format!("Invalid number in base {}: {}", radix, num_text),
                            pos: start_pos,
                        })
                    }
                } else if next_ch == '*' {
                    // #<n>* reads a bit-vector of length n. The parser only
                    // needs the raw payload; length validation is handled by
                    // consumers that care about CL's fill semantics.
                    self.advance();
                    let mut bits = String::new();
                    while matches!(self.current_char(), '0' | '1') {
                        bits.push(self.current_char());
                        self.advance();
                    }
                    Ok(Token::new(TokenKind::HashStar(bits), start_pos))
                } else if next_ch == 'A' || next_ch == 'a' {
                    // Array notation: #<dimension>A(...)
                    // For now, just return HashDigit and let parser handle it
                    let digit = digits.parse::<u8>().unwrap_or(0);
                    Ok(Token::new(TokenKind::HashDigit(digit), start_pos))
                } else {
                    // Just a digit (for other reader macros or array dimensions)
                    let digit = digits.parse::<u8>().unwrap_or(0);
                    Ok(Token::new(TokenKind::HashDigit(digit), start_pos))
                }
            }
            'x' | 'X' => {
                // Hexadecimal: #xNN
                self.advance();
                let num_text = self.read_atom_text();
                if let Some(slash_pos) = num_text.find('/') {
                    let num_str = &num_text[..slash_pos];
                    let den_str = &num_text[slash_pos + 1..];
                    if let (Ok(num), Ok(den)) = (
                        i64::from_str_radix(num_str, 16),
                        i64::from_str_radix(den_str, 16),
                    ) {
                        if den != 0 {
                            return Ok(Token::new(
                                TokenKind::Ratio(num.to_string(), den.to_string()),
                                start_pos,
                            ));
                        }
                    }
                    return Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid hexadecimal ratio: {}", num_text),
                        pos: start_pos,
                    });
                }
                // Try parsing as i64 first, then as u64 and convert
                if let Ok(val) = i64::from_str_radix(&num_text, 16) {
                    Ok(Token::new(TokenKind::Integer(val), start_pos))
                } else if let Ok(val) = u64::from_str_radix(&num_text, 16) {
                    // Convert u64 to i64 (will wrap for large values)
                    Ok(Token::new(TokenKind::Integer(val as i64), start_pos))
                } else {
                    Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid hexadecimal number: {}", num_text),
                        pos: start_pos,
                    })
                }
            }
            'o' | 'O' => {
                // Octal: #oNN
                self.advance();
                let num_text = self.read_atom_text();
                if let Some(slash_pos) = num_text.find('/') {
                    let num_str = &num_text[..slash_pos];
                    let den_str = &num_text[slash_pos + 1..];
                    if let (Ok(num), Ok(den)) = (
                        i64::from_str_radix(num_str, 8),
                        i64::from_str_radix(den_str, 8),
                    ) {
                        if den != 0 {
                            return Ok(Token::new(
                                TokenKind::Ratio(num.to_string(), den.to_string()),
                                start_pos,
                            ));
                        }
                    }
                    return Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid octal ratio: {}", num_text),
                        pos: start_pos,
                    });
                }
                if let Ok(val) = i64::from_str_radix(&num_text, 8) {
                    Ok(Token::new(TokenKind::Integer(val), start_pos))
                } else {
                    Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid octal number: {}", num_text),
                        pos: start_pos,
                    })
                }
            }
            'b' | 'B' => {
                // Binary: #bNN
                self.advance();
                let num_text = self.read_atom_text();

                // Check if it's a ratio (contains /)
                if let Some(slash_pos) = num_text.find('/') {
                    let num_str = &num_text[..slash_pos];
                    let den_str = &num_text[slash_pos + 1..];
                    if let (Ok(num), Ok(den)) = (
                        i64::from_str_radix(num_str, 2),
                        i64::from_str_radix(den_str, 2),
                    ) {
                        if den != 0 {
                            return Ok(Token::new(
                                TokenKind::Ratio(num.to_string(), den.to_string()),
                                start_pos,
                            ));
                        }
                    }
                    return Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid binary ratio: {}", num_text),
                        pos: start_pos,
                    });
                }

                if let Ok(val) = i64::from_str_radix(&num_text, 2) {
                    Ok(Token::new(TokenKind::Integer(val), start_pos))
                } else {
                    Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid binary number: {}", num_text),
                        pos: start_pos,
                    })
                }
            }
            'C' | 'c' => {
                self.advance();
                Ok(Token::new(TokenKind::HashC, start_pos))
            }
            'P' | 'p' => {
                self.advance();
                Ok(Token::new(TokenKind::HashP, start_pos))
            }
            '~' => {
                self.advance();
                Ok(Token::new(TokenKind::HashTilde, start_pos))
            }
            '@' => {
                self.advance();
                Ok(Token::new(TokenKind::HashTilde, start_pos)) // Treat #@ same as #~
            }
            '!' => {
                // Shebang line - skip the rest of the line and return next token
                self.skip_line_comment();
                self.next_token()
            }
            '_' => {
                // Comment out next form (#_ form) - just skip the marker and let parser handle it
                self.advance();
                Ok(Token::new(TokenKind::HashUnderscore, start_pos))
            }
            '$' => {
                // Implementation-specific reader macro - skip it and read the next thing
                self.advance();
                // Skip this reader macro by returning next token
                self.next_token()
            }
            'l' | 'L' => {
                // Could be a long float like #l or implementation-specific
                // Try to read it as a symbol and let higher level handle it
                self.advance();
                // Read the rest as an atom
                let text = self.read_atom_text();
                Ok(Token::new(
                    TokenKind::Symbol(format!("l{}", text)),
                    start_pos,
                ))
            }
            _ => Err(ReaderError::InvalidReaderMacro { ch, pos: start_pos }),
        }
    }

    fn read_character(&mut self, start_pos: usize) -> ReaderResult<Token> {
        let mut name = String::new();

        // Read character name (constituent chars only)
        while self.is_constituent_char(self.current_char()) {
            name.push(self.current_char());
            self.advance();
        }

        // If name is empty, it means we have a special character like #\( or #\)
        // Take the next single character as-is
        if name.is_empty() {
            let ch = self.current_char();
            if ch == '\0' {
                if self.suppress_reader_errors {
                    return Ok(Token::new(TokenKind::Character('\0'), start_pos));
                }
                return Err(ReaderError::InvalidCharacter {
                    text: String::new(),
                    pos: start_pos,
                });
            }
            self.advance();
            return Ok(Token::new(TokenKind::Character(ch), start_pos));
        }

        if let Some(ch) = rlasp_runtime::parse_character_name(&name) {
            Ok(Token::new(TokenKind::Character(ch), start_pos))
        } else if self.suppress_reader_errors {
            Ok(Token::new(TokenKind::Character('\0'), start_pos))
        } else {
            Err(ReaderError::InvalidCharacter {
                text: name,
                pos: start_pos,
            })
        }
    }

    fn read_number_or_symbol(&mut self, start_pos: usize) -> ReaderResult<Token> {
        let text = self.read_atom_text();
        let raw_token_contains_escape = self.input[start_pos..self.pos].iter().any(|c| *c == '\\');

        if !raw_token_contains_escape && text.chars().count() > 1 && text.chars().all(|c| c == '.')
        {
            return Err(ReaderError::InvalidSyntax {
                msg: "A token consisting only of dots is not valid Common Lisp syntax".to_string(),
                pos: start_pos,
            });
        }

        // Try to parse as number
        // First check if it looks like an integer (all digits, possibly with leading sign)
        // IMPORTANT: Sign must be at the START, not at the end (1- and 1+ are CL functions, not numbers)
        let looks_like_int = {
            let chars: Vec<char> = text.chars().collect();
            if chars.is_empty() {
                false
            } else {
                // Check if first char is a sign
                let digit_start = if chars[0] == '-' || chars[0] == '+' {
                    1
                } else {
                    0
                };
                // Rest must be all digits and non-empty
                let rest = &chars[digit_start..];
                !rest.is_empty() && rest.iter().all(|c| c.is_ascii_digit())
            }
        };

        if looks_like_int {
            // Try parsing as i64, but also check if it's actually valid
            if let Ok(n) = text.parse::<i64>() {
                // Check if the number round-trips correctly (to detect overflow)
                if n.to_string() == text {
                    return Ok(Token::new(TokenKind::Integer(n), start_pos));
                } else {
                    // Overflow detected - the parsed value doesn't match the input
                    return Ok(Token::new(TokenKind::Bignum(text), start_pos));
                }
            } else {
                // Parse failed completely - must be too large
                return Ok(Token::new(TokenKind::Bignum(text), start_pos));
            }
        }

        // Common Lisp float notation:
        // - exponent markers: e/f/s (single-style), d/l (double-style)
        // - examples: 1.0e3, 1.0d0, .5, -2.5
        let valid_exp = |exp: &str| -> bool {
            if exp.is_empty() {
                return false;
            }
            let mut chars = exp.chars();
            let first = chars.next().unwrap();
            if first == '+' || first == '-' {
                let rest: String = chars.collect();
                !rest.is_empty() && rest.chars().all(|c| c.is_ascii_digit())
            } else {
                first.is_ascii_digit() && chars.all(|c| c.is_ascii_digit())
            }
        };

        let mut parsed_float: Option<(f64, FloatFormat)> = None;
        if let Some((idx, marker)) = text.char_indices().skip(1).find(|(_, c)| {
            matches!(
                *c,
                'd' | 'D' | 'e' | 'E' | 'f' | 'F' | 'l' | 'L' | 's' | 'S'
            )
        }) {
            let (mantissa, marker_and_exp) = text.split_at(idx);
            let exp_part = &marker_and_exp[1..];
            if !mantissa.is_empty() && valid_exp(exp_part) {
                let normalized = format!("{}e{}", mantissa, exp_part);
                parsed_float = match marker.to_ascii_lowercase() {
                    // CL defaults E/F/S to single-float semantics.
                    'e' | 'f' | 's' => normalized
                        .parse::<f32>()
                        .ok()
                        .map(|v| (v as f64, FloatFormat::Single)),
                    // D/L are double-float semantics.
                    'd' | 'l' => normalized
                        .parse::<f64>()
                        .ok()
                        .map(|v| (v, FloatFormat::Double)),
                    _ => None,
                };
            }
        }

        if parsed_float.is_none() && text.contains('.') {
            let default_single = std::env::var("RLASP_READ_DEFAULT_FLOAT_SINGLE")
                .map(|v| {
                    let t = v.trim().to_ascii_lowercase();
                    !(t.is_empty() || t == "0" || t == "false" || t == "no" || t == "off")
                })
                .unwrap_or_else(|_| rlasp_runtime::io_syntax::current_read_default_float_single());
            if default_single {
                parsed_float = text
                    .parse::<f32>()
                    .ok()
                    .map(|v| (v as f64, FloatFormat::Single));
            } else {
                parsed_float = text.parse::<f64>().ok().map(|v| (v, FloatFormat::Double));
            }
        }

        if let Some((f, format)) = parsed_float {
            return Ok(Token::new(TokenKind::Float(f, format), start_pos));
        }

        let current_read_base = || -> u32 {
            match rlasp_runtime::io_syntax::get_io_syntax_var("*read-base*") {
                Some(rlasp_runtime::io_syntax::IoSyntaxValue::Fixnum(n))
                    if (2..=36).contains(&n) =>
                {
                    n as u32
                }
                _ => 10,
            }
        };
        let parse_signed_integer_radix = |raw: &str, base: u32| -> Option<malachite::Integer> {
            let (negative, digits) = if let Some(rest) = raw.strip_prefix('-') {
                (true, rest)
            } else if let Some(rest) = raw.strip_prefix('+') {
                (false, rest)
            } else {
                (false, raw)
            };
            if digits.is_empty() {
                return None;
            }
            let mut value = malachite::Integer::from(0);
            for ch in digits.chars() {
                let digit = ch.to_digit(base)?;
                value = value * malachite::Integer::from(base) + malachite::Integer::from(digit);
            }
            if negative {
                Some(-value)
            } else {
                Some(value)
            }
        };

        // Check for ratio (e.g., 3/4). Plain ratios respect the active *READ-BASE*.
        if let Some(slash_pos) = text.find('/') {
            let num_str = &text[..slash_pos];
            let den_str = &text[slash_pos + 1..];
            let read_base = current_read_base();
            if let (Some(num), Some(den)) = (
                parse_signed_integer_radix(num_str, read_base),
                parse_signed_integer_radix(den_str, read_base),
            ) {
                if den != malachite::Integer::from(0) {
                    return Ok(Token::new(
                        TokenKind::Ratio(num.to_string(), den.to_string()),
                        start_pos,
                    ));
                }
            }
        }

        // It's a symbol
        Ok(Token::new(TokenKind::Symbol(text), start_pos))
    }

    fn read_atom(&mut self, start_pos: usize) -> ReaderResult<Token> {
        // Use the same logic as read_number_or_symbol to handle .5 style floats
        self.read_number_or_symbol(start_pos)
    }

    fn read_atom_text(&mut self) -> String {
        let mut result = String::new();
        while self.is_constituent_char(self.current_char()) || self.current_char() == '\\' {
            if self.current_char() == '\\' {
                // Escape the next character
                self.advance();
                if !self.is_eof() {
                    result.push(self.current_char());
                    self.advance();
                }
            } else {
                result.push(self.current_char());
                self.advance();
            }
        }

        // Handle package-qualified symbols: package:symbol or package::symbol
        if self.current_char() == ':' && !result.is_empty() {
            result.push(':');
            self.advance();

            // Check for double colon
            if self.current_char() == ':' {
                result.push(':');
                self.advance();
            }

            // Read the symbol name after the colon(s)
            while self.is_constituent_char(self.current_char()) || self.current_char() == '\\' {
                if self.current_char() == '\\' {
                    // Escape the next character
                    self.advance();
                    if !self.is_eof() {
                        result.push(self.current_char());
                        self.advance();
                    }
                } else {
                    result.push(self.current_char());
                    self.advance();
                }
            }
        }

        result
    }

    fn read_symbol_name(&mut self) -> String {
        let mut result = String::new();
        while self.is_constituent_char(self.current_char()) || self.current_char() == '\\' {
            if self.current_char() == '\\' {
                // Escape the next character - preserve it as-is
                self.advance();
                if !self.is_eof() {
                    result.push(self.current_char());
                    self.advance();
                }
            } else {
                // Normalize to lowercase to match Common Lisp convention
                // (CL readers normally convert to uppercase, but we use lowercase for compatibility)
                result.push(
                    self.current_char()
                        .to_lowercase()
                        .next()
                        .unwrap_or(self.current_char()),
                );
                self.advance();
            }
        }

        // Handle package-qualified symbols: package:symbol or package::symbol
        if self.current_char() == ':' {
            result.push(':');
            self.advance();

            // Check for double colon
            if self.current_char() == ':' {
                result.push(':');
                self.advance();
            }

            // Read the symbol name after the colon(s)
            while self.is_constituent_char(self.current_char()) || self.current_char() == '\\' {
                if self.current_char() == '\\' {
                    // Escape the next character - preserve it as-is
                    self.advance();
                    if !self.is_eof() {
                        result.push(self.current_char());
                        self.advance();
                    }
                } else {
                    result.push(
                        self.current_char()
                            .to_lowercase()
                            .next()
                            .unwrap_or(self.current_char()),
                    );
                    self.advance();
                }
            }
        }

        result
    }

    fn is_symbol_start(&self, ch: char) -> bool {
        ch.is_alphabetic() || "!$%&*+-./:<=>?@^_~".contains(ch)
    }

    fn is_constituent_char(&self, ch: char) -> bool {
        !ch.is_whitespace()
            && ch != '('
            && ch != ')'
            && ch != '['
            && ch != ']'
            && ch != '{'
            && ch != '}'
            && ch != '"'
            && ch != '\''
            && ch != '`'
            && ch != ','
            && ch != ';'
            && (ch != '\0' || !self.is_eof())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simple_tokens() {
        let mut lexer = Lexer::new("( ) [ ]");
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::LeftParen);
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::RightParen);
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::LeftBracket);
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::RightBracket);
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Eof);
    }

    #[test]
    fn test_numbers() {
        let mut lexer = Lexer::new("42 -17 3.14 -2.5 3/4");
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Integer(42));
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Integer(-17));
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Float(3.14, FloatFormat::Double)
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Float(-2.5, FloatFormat::Double)
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Ratio("3".to_string(), "4".to_string())
        );
    }

    #[test]
    fn test_symbols() {
        let mut lexer = Lexer::new("foo bar-baz +");
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("foo".to_string())
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("bar-baz".to_string())
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("+".to_string())
        );
    }

    #[test]
    fn test_strings() {
        let mut lexer = Lexer::new(r#""hello" "world\n""#);
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::String("hello".to_string())
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::String("world\n".to_string())
        );
    }

    #[test]
    fn test_keywords() {
        let mut lexer = Lexer::new(":foo :bar-baz");
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Keyword("foo".to_string())
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Keyword("bar-baz".to_string())
        );
    }

    #[test]
    fn test_reader_macros() {
        let mut lexer = Lexer::new("'x `x ,x ,@x #'foo");
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Quote);
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("x".to_string())
        );
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Backquote);
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("x".to_string())
        );
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Comma);
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("x".to_string())
        );
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::CommaAt);
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("x".to_string())
        );
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Function);
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("foo".to_string())
        );
    }

    #[test]
    fn test_characters() {
        let mut lexer = Lexer::new(r"#\a #\newline #\space");
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Character('a'));
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Character('\n'));
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Character(' '));
    }

    #[test]
    fn test_comments() {
        let mut lexer = Lexer::new("; comment\nfoo #| block |# bar");
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("foo".to_string())
        );
        assert_eq!(
            lexer.next_token().unwrap().kind,
            TokenKind::Symbol("bar".to_string())
        );
    }

    #[test]
    fn test_vectors() {
        let mut lexer = Lexer::new("#(1 2 3)");
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::HashLeftParen);
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Integer(1));
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Integer(2));
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::Integer(3));
        assert_eq!(lexer.next_token().unwrap().kind, TokenKind::RightParen);
    }
}
