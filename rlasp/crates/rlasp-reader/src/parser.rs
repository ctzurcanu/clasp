//! S-expression parser
//!
//! Parses tokens into LispObjects (s-expressions)

use crate::error::{ReaderError, ReaderResult};
use crate::lexer::Lexer;
use crate::token::{Token, TokenKind};
use rlasp_runtime::LispObject;

/// Parser for s-expressions
pub struct Parser {
    lexer: Lexer,
    current_token: Token,
}

impl Parser {
    /// Create a new parser from a string
    pub fn new(input: &str) -> ReaderResult<Self> {
        let mut lexer = Lexer::new(input);
        let current_token = lexer.next_token()?;
        Ok(Parser {
            lexer,
            current_token,
        })
    }

    /// Parse one s-expression
    pub fn read(&mut self) -> ReaderResult<LispObject> {
        self.read_expr()
    }

    fn read_expr(&mut self) -> ReaderResult<LispObject> {
        match &self.current_token.kind {
            TokenKind::Eof => Err(ReaderError::UnexpectedEof),

            TokenKind::LeftParen => self.read_list(),
            TokenKind::LeftBracket => self.read_bracket_list(),
            TokenKind::LeftBrace => self.read_brace_list(),

            TokenKind::Integer(n) => {
                let val = *n;
                self.advance()?;
                Ok(LispObject::fixnum(val))
            }

            TokenKind::Float(f) => {
                let val = *f;
                self.advance()?;
                // Create Float as a general object
                Ok(rlasp_runtime::Number::allocate_float(val))
            }

            TokenKind::Ratio(numerator, denominator) => {
                let num = *numerator;
                let denom = *denominator;
                self.advance()?;
                // Create Ratio as a tagged list: (ratio numerator denominator)
                let ratio_sym = rlasp_runtime::Symbol::allocate("ratio");
                Ok(rlasp_runtime::Cons::list(&[
                    ratio_sym,
                    LispObject::fixnum(num),
                    LispObject::fixnum(denom),
                ]))
            }

            TokenKind::String(s) => {
                let val = s.clone();
                self.advance()?;
                // Create string as symbol with special marker
                // TODO: Implement proper String type in runtime
                let marker = format!("\"{}\"", val);
                Ok(rlasp_runtime::Symbol::allocate(marker.as_str()))
            }

            TokenKind::Character(c) => {
                let val = *c;
                self.advance()?;
                Ok(LispObject::character(val))
            }

            TokenKind::Symbol(name) => {
                let name = name.clone();
                self.advance()?;
                Ok(rlasp_runtime::Symbol::allocate(name.as_str()))
            }

            TokenKind::Keyword(name) => {
                // Keywords are symbols in the KEYWORD package
                let keyword_name = format!(":{}", name);
                self.advance()?;
                Ok(rlasp_runtime::Symbol::allocate(keyword_name.as_str()))
            }

            TokenKind::Quote => {
                self.advance()?;
                let expr = self.read_expr()?;
                // (quote expr)
                let quote_sym = rlasp_runtime::Symbol::allocate("quote");
                let list = rlasp_runtime::Cons::list(&[quote_sym, expr]);
                Ok(list)
            }

            TokenKind::Backquote => {
                self.advance()?;
                let expr = self.read_expr()?;
                // (backquote expr)
                let backquote_sym = rlasp_runtime::Symbol::allocate("backquote");
                let list = rlasp_runtime::Cons::list(&[backquote_sym, expr]);
                Ok(list)
            }

            TokenKind::Comma => {
                self.advance()?;
                let expr = self.read_expr()?;
                // (unquote expr)
                let unquote_sym = rlasp_runtime::Symbol::allocate("unquote");
                let list = rlasp_runtime::Cons::list(&[unquote_sym, expr]);
                Ok(list)
            }

            TokenKind::CommaAt => {
                self.advance()?;
                let expr = self.read_expr()?;
                // (unquote-splicing expr)
                let unquote_splicing_sym = rlasp_runtime::Symbol::allocate("unquote-splicing");
                let list = rlasp_runtime::Cons::list(&[unquote_splicing_sym, expr]);
                Ok(list)
            }

            TokenKind::Function => {
                self.advance()?;
                let expr = self.read_expr()?;
                // (function expr)
                let function_sym = rlasp_runtime::Symbol::allocate("function");
                let list = rlasp_runtime::Cons::list(&[function_sym, expr]);
                Ok(list)
            }

            TokenKind::HashLeftParen => {
                self.read_vector()
            }

            TokenKind::HashC => {
                // Complex number: #C(real imaginary)
                self.advance()?; // skip #C
                // Expect a list (real imaginary)
                if !matches!(self.current_token.kind, TokenKind::LeftParen) {
                    return Err(ReaderError::InvalidSyntax {
                        msg: format!("#C must be followed by (real imaginary), found {}", self.current_token.kind),
                        pos: self.current_token.pos,
                    });
                }
                self.advance()?; // skip (

                // Read real part
                let real = self.read_expr()?;

                // Read imaginary part
                let imag = self.read_expr()?;

                // Expect closing paren
                if !matches!(self.current_token.kind, TokenKind::RightParen) {
                    return Err(ReaderError::ExpectedClosing {
                        expected: ')',
                        pos: self.current_token.pos,
                    });
                }
                self.advance()?; // skip )

                // Return as a tagged list: (complex real imag)
                let complex_sym = rlasp_runtime::Symbol::allocate("complex");
                Ok(rlasp_runtime::Cons::list(&[complex_sym, real, imag]))
            }

            TokenKind::HashPlus => {
                // Feature conditional: #+(feature) form
                // Include form only if feature is present
                // Since we don't have a feature system, assume features are absent
                // So skip the form and return nil
                self.advance()?; // skip #+
                let _ = self.read_expr()?; // skip feature expression
                let _ = self.read_expr()?; // skip the conditional form
                // Return nil since we're skipping this form
                Ok(LispObject::nil())
            }

            TokenKind::HashMinus => {
                // Negative feature conditional: #-(feature) form
                // Include form only if feature is absent
                // Since we don't have a feature system, assume features are absent
                // So include the form
                self.advance()?; // skip #-
                let _ = self.read_expr()?; // skip feature expression
                // Read and return the conditional form
                self.read_expr()
            }

            TokenKind::HashDot => {
                // Read-time eval: #.(form)
                // Evaluates form at read time and uses result as object
                // For parsing purposes, just read the form and return it
                // In a real implementation, this would eval the form
                self.advance()?; // skip #.
                self.read_expr() // Return the form itself
            }

            TokenKind::HashColon => {
                // Uninterned symbol: #:name
                // Creates a symbol that isn't interned in any package
                self.advance()?; // skip #:

                // Next token should be a symbol
                if let TokenKind::Symbol(name) = &self.current_token.kind {
                    let name = name.clone();
                    self.advance()?;
                    // For now, treat uninterned symbols like normal symbols
                    // In a full implementation, these would be gensyms or truly uninterned
                    Ok(rlasp_runtime::Symbol::allocate(name.as_str()))
                } else {
                    Err(ReaderError::InvalidSyntax {
                        msg: "#: must be followed by a symbol name".to_string(),
                        pos: self.current_token.pos,
                    })
                }
            }

            TokenKind::HashP => {
                // Pathname literal: #P"path" or #p"path"
                // Read the next expression (should be a string) and treat it as a pathname
                self.advance()?; // skip #P
                let path_expr = self.read_expr()?;
                // Return as a tagged list: (pathname "path")
                let pathname_sym = rlasp_runtime::Symbol::allocate("pathname");
                Ok(rlasp_runtime::Cons::list(&[pathname_sym, path_expr]))
            }

            TokenKind::HashTilde => {
                // Custom pathname macro #~
                // Similar to #P but might have different semantics
                self.advance()?; // skip #~
                let path_expr = self.read_expr()?;
                // Return as a tagged list: (pathname "path")
                let pathname_sym = rlasp_runtime::Symbol::allocate("pathname");
                Ok(rlasp_runtime::Cons::list(&[pathname_sym, path_expr]))
            }

            TokenKind::HashUnderscore => {
                // Comment out next form: #_ form
                // Read and discard the next expression, then return nil
                self.advance()?; // skip #_
                let _ = self.read_expr()?; // discard the form
                Ok(LispObject::nil())
            }

            TokenKind::HashStar => {
                // Bit vector: #*01101
                self.advance()?; // skip #*
                // Read the bit string (0s and 1s)
                if let TokenKind::Symbol(bits) = &self.current_token.kind {
                    let bits_str = bits.clone();
                    self.advance()?;
                    // Convert to vector of integers (0 and 1)
                    let mut elements = Vec::new();
                    for ch in bits_str.chars() {
                        match ch {
                            '0' => elements.push(LispObject::fixnum(0)),
                            '1' => elements.push(LispObject::fixnum(1)),
                            _ => return Err(ReaderError::InvalidSyntax {
                                msg: format!("Invalid bit vector: contains '{}'", ch),
                                pos: self.current_token.pos,
                            }),
                        }
                    }
                    // Return as (vector 0 1 0 1 ...)
                    let vector_sym = rlasp_runtime::Symbol::allocate("vector");
                    let mut all_elements = vec![vector_sym];
                    all_elements.extend(elements);
                    return Ok(rlasp_runtime::Cons::list(&all_elements));
                }
                // Empty bit vector #*
                let vector_sym = rlasp_runtime::Symbol::allocate("vector");
                Ok(rlasp_runtime::Cons::list(&[vector_sym]))
            }

            TokenKind::HashDigit(_dim) => {
                // Array notation: #2A(...) or #3A(...)
                // For now, skip dimension info and treat as vector
                self.advance()?; // skip #<digit>
                // Check for 'A' or 'a'
                if let TokenKind::Symbol(s) = &self.current_token.kind {
                    if s.eq_ignore_ascii_case("a") {
                        self.advance()?; // skip 'A'
                    }
                }
                // Read the array contents (expect a list)
                self.read_expr()
            }

            TokenKind::HashEquals(label) => {
                // Circular reference label definition: #n=expr
                // For now, just read the expression and ignore the label
                // A full implementation would store the expression with the label
                let label_num = *label;
                self.advance()?; // skip #n=
                let expr = self.read_expr()?;
                // Return as: (label-def n expr)
                let label_def_sym = rlasp_runtime::Symbol::allocate("label-def");
                Ok(rlasp_runtime::Cons::list(&[
                    label_def_sym,
                    LispObject::fixnum(label_num as i64),
                    expr,
                ]))
            }

            TokenKind::HashRef(label) => {
                // Circular reference: #n#
                // References a previously defined label
                // For now, return a symbolic reference
                let label_num = *label;
                self.advance()?; // skip #n#
                // Return as: (label-ref n)
                let label_ref_sym = rlasp_runtime::Symbol::allocate("label-ref");
                Ok(rlasp_runtime::Cons::list(&[
                    label_ref_sym,
                    LispObject::fixnum(label_num as i64),
                ]))
            }

            TokenKind::SingleColon => {
                // Bare single colon - treat as a symbol or skip it
                // This can occur in malformed code, but we want to be lenient
                self.advance()?;
                // Return a symbol representing the colon
                Ok(rlasp_runtime::Symbol::allocate(":"))
            }

            TokenKind::DoubleColon => {
                // Bare double colon - similar to single colon
                self.advance()?;
                Ok(rlasp_runtime::Symbol::allocate("::"))
            }

            TokenKind::RightParen => Err(ReaderError::UnmatchedClosing {
                ch: ')',
                pos: self.current_token.pos,
            }),

            TokenKind::RightBracket => Err(ReaderError::UnmatchedClosing {
                ch: ']',
                pos: self.current_token.pos,
            }),

            TokenKind::RightBrace => Err(ReaderError::UnmatchedClosing {
                ch: '}',
                pos: self.current_token.pos,
            }),

            _ => Err(ReaderError::InvalidSyntax {
                msg: format!("Unexpected token: {:?}", self.current_token.kind),
                pos: self.current_token.pos,
            }),
        }
    }

    fn read_list(&mut self) -> ReaderResult<LispObject> {
        self.advance()?; // skip (

        let mut elements = Vec::new();
        let mut dot_seen = false;
        let mut dotted_tail = None;

        while !matches!(self.current_token.kind, TokenKind::RightParen | TokenKind::Eof) {
            if matches!(self.current_token.kind, TokenKind::Dot) {
                if elements.is_empty() {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Dot cannot appear at start of list".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                if dot_seen {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Multiple dots in list".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                dot_seen = true;
                self.advance()?;

                dotted_tail = Some(self.read_expr()?);
                break;
            }

            elements.push(self.read_expr()?);
        }

        if !matches!(self.current_token.kind, TokenKind::RightParen) {
            return Err(ReaderError::ExpectedClosing {
                expected: ')',
                pos: self.current_token.pos,
            });
        }

        self.advance()?; // skip )

        // Build the list
        if dot_seen {
            // Dotted list: (a b . c) => (cons a (cons b c))
            if let Some(tail) = dotted_tail {
                Ok(rlasp_runtime::Cons::build_dotted_list(&elements, tail))
            } else {
                Err(ReaderError::InvalidSyntax {
                    msg: "Dot must be followed by an expression".to_string(),
                    pos: self.current_token.pos,
                })
            }
        } else {
            // Regular list
            if elements.is_empty() {
                Ok(LispObject::nil())
            } else {
                Ok(rlasp_runtime::Cons::list(&elements))
            }
        }
    }

    fn read_bracket_list(&mut self) -> ReaderResult<LispObject> {
        self.advance()?; // skip [

        let mut elements = Vec::new();
        let mut dot_seen = false;
        let mut dotted_tail = None;

        while !matches!(self.current_token.kind, TokenKind::RightBracket | TokenKind::Eof) {
            if matches!(self.current_token.kind, TokenKind::Dot) {
                if elements.is_empty() {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Dot cannot appear at start of list".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                if dot_seen {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Multiple dots in list".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                dot_seen = true;
                self.advance()?;

                dotted_tail = Some(self.read_expr()?);
                break;
            }

            elements.push(self.read_expr()?);
        }

        if !matches!(self.current_token.kind, TokenKind::RightBracket) {
            return Err(ReaderError::ExpectedClosing {
                expected: ']',
                pos: self.current_token.pos,
            });
        }

        self.advance()?; // skip ]

        // Build the list
        if dot_seen {
            // Dotted list: [a b . c] => (cons a (cons b c))
            if let Some(tail) = dotted_tail {
                Ok(rlasp_runtime::Cons::build_dotted_list(&elements, tail))
            } else {
                Err(ReaderError::InvalidSyntax {
                    msg: "Dot must be followed by an expression".to_string(),
                    pos: self.current_token.pos,
                })
            }
        } else {
            // Regular list
            if elements.is_empty() {
                Ok(LispObject::nil())
            } else {
                Ok(rlasp_runtime::Cons::list(&elements))
            }
        }
    }

    fn read_brace_list(&mut self) -> ReaderResult<LispObject> {
        self.advance()?; // skip {

        let mut elements = Vec::new();
        let mut dot_seen = false;
        let mut dotted_tail = None;

        while !matches!(self.current_token.kind, TokenKind::RightBrace | TokenKind::Eof) {
            if matches!(self.current_token.kind, TokenKind::Dot) {
                if elements.is_empty() {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Dot cannot appear at start of list".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                if dot_seen {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Multiple dots in list".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                dot_seen = true;
                self.advance()?;

                dotted_tail = Some(self.read_expr()?);
                break;
            }

            elements.push(self.read_expr()?);
        }

        if !matches!(self.current_token.kind, TokenKind::RightBrace) {
            return Err(ReaderError::ExpectedClosing {
                expected: '}',
                pos: self.current_token.pos,
            });
        }

        self.advance()?; // skip }

        // Build the list
        if dot_seen {
            // Dotted list: {a b . c} => (cons a (cons b c))
            if let Some(tail) = dotted_tail {
                Ok(rlasp_runtime::Cons::build_dotted_list(&elements, tail))
            } else {
                Err(ReaderError::InvalidSyntax {
                    msg: "Dot must be followed by an expression".to_string(),
                    pos: self.current_token.pos,
                })
            }
        } else {
            // Regular list
            if elements.is_empty() {
                Ok(LispObject::nil())
            } else {
                Ok(rlasp_runtime::Cons::list(&elements))
            }
        }
    }

    fn read_vector(&mut self) -> ReaderResult<LispObject> {
        self.advance()?; // skip #(

        let mut elements = Vec::new();

        while !matches!(self.current_token.kind, TokenKind::RightParen | TokenKind::Eof) {
            elements.push(self.read_expr()?);
        }

        if !matches!(self.current_token.kind, TokenKind::RightParen) {
            return Err(ReaderError::ExpectedClosing {
                expected: ')',
                pos: self.current_token.pos,
            });
        }

        self.advance()?; // skip )

        // For now, represent vectors as lists with a 'vector tag
        // TODO: Implement proper vector type
        let vector_sym = rlasp_runtime::Symbol::allocate("vector");
        let mut all_elements = vec![vector_sym];
        all_elements.extend(elements);
        Ok(rlasp_runtime::Cons::list(&all_elements))
    }

    fn advance(&mut self) -> ReaderResult<()> {
        self.current_token = self.lexer.next_token()?;
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_atom() {
        let mut parser = Parser::new("42").unwrap();
        let expr = parser.read().unwrap();
        assert_eq!(expr.as_fixnum(), Some(42));
    }

    #[test]
    fn test_parse_symbol() {
        let mut parser = Parser::new("foo").unwrap();
        let expr = parser.read().unwrap();
        // TODO: Add is_symbol() method
        assert!(expr.is_general());
    }

    #[test]
    fn test_parse_list() {
        let mut parser = Parser::new("(1 2 3)").unwrap();
        let expr = parser.read().unwrap();
        assert!(expr.is_cons());

        // Verify it's a proper list of length 3
        let list = expr.as_cons_ptr().unwrap();
        let len = unsafe { (*list).length() };
        assert_eq!(len, Some(3));
    }

    #[test]
    fn test_parse_nested_list() {
        let mut parser = Parser::new("(a (b c) d)").unwrap();
        let expr = parser.read().unwrap();
        assert!(expr.is_cons());
    }

    #[test]
    fn test_parse_quote() {
        let mut parser = Parser::new("'x").unwrap();
        let expr = parser.read().unwrap();
        // Should be (quote x)
        assert!(expr.is_cons());
        let list = expr.as_cons_ptr().unwrap();
        let car = unsafe { (*list).car() };
        // TODO: Add is_symbol() method
        assert!(car.is_general());
    }

    #[test]
    fn test_parse_empty_list() {
        let mut parser = Parser::new("()").unwrap();
        let expr = parser.read().unwrap();
        assert!(expr.is_nil());
    }

    #[test]
    fn test_parse_dotted_pair() {
        let mut parser = Parser::new("(a . b)").unwrap();
        let expr = parser.read().unwrap();
        assert!(expr.is_cons());
    }
}
