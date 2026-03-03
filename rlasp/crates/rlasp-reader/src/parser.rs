//! S-expression parser
//!
//! Parses tokens into LispObjects (s-expressions)

use crate::error::{ReaderError, ReaderResult};
use crate::lexer::Lexer;
use crate::token::{Token, TokenKind};
use rlasp_runtime::{LispObject, RVector, Symbol};
use std::collections::HashMap;
use malachite::Integer;
use malachite::num::conversion::traits::{ConvertibleFrom, ExactFrom};

/// Sentinel symbol for skipped feature conditionals
/// read_list and read_all filter this out
pub const FEATURE_SKIP_MARKER: &str = "#<FEATURE-SKIP>";

/// Check if a LispObject is the feature skip marker
pub fn is_skip_marker(obj: &LispObject) -> bool {
    if let Some(sym_ptr) = obj.as_general_ptr::<Symbol>() {
        unsafe { (*sym_ptr).name() == FEATURE_SKIP_MARKER }
    } else {
        false
    }
}

/// Default features available in rlasp
const DEFAULT_FEATURES: &[&str] = &[
    "RLASP",
    "CLASP",
    "COMMON-LISP",
    "ANSI-CL",
    "IEEE-FLOATING-POINT",
    "UNICODE",
    "UNIX",
    "DARWIN",
    "OS-UNIX",
    "OS-MACOSX",
];

/// Check if a feature is present
fn feature_present(feature: &str) -> bool {
    let feature_upper = feature.to_uppercase();
    DEFAULT_FEATURES.iter().any(|f| f.eq_ignore_ascii_case(&feature_upper))
}

/// Evaluate a feature expression
/// Supports: symbol, (and ...), (or ...), (not ...)
fn evaluate_feature_expr(expr: LispObject) -> bool {
    // Symbol - check if feature is present
    if let Some(sym_ptr) = expr.as_general_ptr::<Symbol>() {
        let sym = unsafe { &*sym_ptr };
        return feature_present(sym.name());
    }

    // List - check for (and ...), (or ...), (not ...)
    if let Some(cons_ptr) = expr.as_cons_ptr() {
        let cons = unsafe { &*cons_ptr };
        let car = cons.car();

        // Get operator name
        if let Some(op_ptr) = car.as_general_ptr::<Symbol>() {
            let op = unsafe { &*op_ptr };
            let op_name = op.name().to_uppercase();

            match op_name.as_str() {
                "AND" => {
                    // All sub-expressions must be true
                    let mut current = cons.cdr();
                    while let Some(c) = current.as_cons_ptr() {
                        let c = unsafe { &*c };
                        if !evaluate_feature_expr(c.car()) {
                            return false;
                        }
                        current = c.cdr();
                    }
                    return true;
                }
                "OR" => {
                    // Any sub-expression must be true
                    let mut current = cons.cdr();
                    while let Some(c) = current.as_cons_ptr() {
                        let c = unsafe { &*c };
                        if evaluate_feature_expr(c.car()) {
                            return true;
                        }
                        current = c.cdr();
                    }
                    return false;
                }
                "NOT" => {
                    // Negate the sub-expression
                    let cdr = cons.cdr();
                    if let Some(c) = cdr.as_cons_ptr() {
                        let c = unsafe { &*c };
                        return !evaluate_feature_expr(c.car());
                    }
                    return true; // (not) with no arg is true
                }
                _ => {}
            }
        }
    }

    // Unknown expression type - treat as false
    false
}

/// Parser for s-expressions
pub struct Parser {
    lexer: Lexer,
    current_token: Token,
    /// End position of the last consumed token before skipping trailing whitespace/comments.
    last_token_end_pos: usize,
    /// Label map for circular references (#n= / #n#)
    label_map: HashMap<u8, LispObject>,
}

impl Parser {
    const MAX_FIXNUM: i64 = (1_i64 << 61) - 1;
    const MIN_FIXNUM: i64 = -(1_i64 << 61);

    fn integer_to_lisp_object(value: Integer) -> LispObject {
        if i64::convertible_from(&value) {
            let n = i64::exact_from(&value);
            if n >= Self::MIN_FIXNUM && n <= Self::MAX_FIXNUM {
                return LispObject::fixnum(n);
            }
        }
        rlasp_runtime::Number::allocate_bignum(value)
    }

    /// Create a new parser from a string
    pub fn new(input: &str) -> ReaderResult<Self> {
        let mut lexer = Lexer::new(input);
        let current_token = lexer.next_token()?;
        Ok(Parser {
            lexer,
            current_token,
            last_token_end_pos: 0,
            label_map: HashMap::new(),
        })
    }

    /// Parse one s-expression
    pub fn read(&mut self) -> ReaderResult<LispObject> {
        // Keep intermediate parser vectors/slices stable while constructing one form.
        // They live in Rust-managed memory, which Boehm does not trace as roots.
        let _gc_pause = rlasp_runtime::gc::GcPauseGuard::new();
        self.read_expr()
    }

    /// Parse one s-expression and return both read positions:
    /// 1) before trailing whitespace/comments are skipped
    /// 2) after trailing whitespace/comments are skipped (start of next token)
    pub fn read_with_positions(&mut self) -> ReaderResult<(LispObject, usize, usize)> {
        // Keep intermediate parser vectors/slices stable while constructing one form.
        let _gc_pause = rlasp_runtime::gc::GcPauseGuard::new();
        let obj = self.read_expr()?;
        Ok((obj, self.last_token_end_pos, self.current_token.pos))
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
                if val >= Self::MIN_FIXNUM && val <= Self::MAX_FIXNUM {
                    Ok(LispObject::fixnum(val))
                } else {
                    Ok(rlasp_runtime::Number::allocate_bignum(Integer::from(val)))
                }
            }

            TokenKind::Bignum(s) => {
                let bignum_str = s.clone();
                self.advance()?;
                // Parse the bignum string
                if let Ok(bignum) = bignum_str.parse::<Integer>() {
                    Ok(Self::integer_to_lisp_object(bignum))
                } else {
                    Err(ReaderError::InvalidSyntax {
                        msg: format!("Invalid bignum: {}", bignum_str),
                        pos: self.current_token.pos,
                    })
                }
            }

            TokenKind::Float(f, format) => {
                let val = *f;
                let fmt = *format;
                self.advance()?;
                // Create float with preserved reader format.
                Ok(rlasp_runtime::Number::allocate_float_with_format(val, fmt))
            }

            TokenKind::Ratio(numerator, denominator) => {
                let numerator_str = numerator.clone();
                let denominator_str = denominator.clone();
                self.advance()?;
                let num = numerator_str.parse::<Integer>().map_err(|_| ReaderError::InvalidSyntax {
                    msg: format!("Invalid ratio numerator: {}", numerator_str),
                    pos: self.current_token.pos,
                })?;
                let denom = denominator_str.parse::<Integer>().map_err(|_| ReaderError::InvalidSyntax {
                    msg: format!("Invalid ratio denominator: {}", denominator_str),
                    pos: self.current_token.pos,
                })?;
                if denom == Integer::from(0) {
                    return Err(ReaderError::InvalidSyntax {
                        msg: "Ratio denominator cannot be zero".to_string(),
                        pos: self.current_token.pos,
                    });
                }
                Ok(rlasp_runtime::Number::allocate_ratio(
                    malachite::Rational::from_integers(num, denom),
                ))
            }

            TokenKind::String(s) => {
                let val = s.clone();
                self.advance()?;
                // For now, represent strings as symbols with quote markers
                // TODO: Use RString::allocate(val) once evaluator handles RString
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

                let to_f64 = |obj: LispObject| -> Option<f64> {
                    if let Some(n) = obj.as_fixnum() {
                        return Some(n as f64);
                    }
                    if let Some(f) = obj.as_float() {
                        return Some(f);
                    }
                    if !obj.is_number() {
                        return None;
                    }
                    let ptr = obj.as_general_ptr::<rlasp_runtime::Number>()?;
                    if ptr.is_null() {
                        return None;
                    }
                    match &unsafe { &*ptr }.value {
                        rlasp_runtime::NumberValue::Float(f) => Some(*f),
                        rlasp_runtime::NumberValue::Bignum(b) => b.to_string().parse::<f64>().ok(),
                        rlasp_runtime::NumberValue::Ratio(r) => {
                            let mut num_s = r.numerator_ref().to_string();
                            if *r < malachite::Rational::from(0) {
                                num_s = format!("-{}", num_s);
                            }
                            let den_s = r.denominator_ref().to_string();
                            let num = num_s.parse::<f64>().ok()?;
                            let den = den_s.parse::<f64>().ok()?;
                            if den == 0.0 {
                                None
                            } else {
                                Some(num / den)
                            }
                        }
                        rlasp_runtime::NumberValue::Complex(c) => {
                            if c.im == 0.0 { Some(c.re) } else { None }
                        }
                    }
                };

                let real_f = to_f64(real).ok_or_else(|| ReaderError::InvalidSyntax {
                    msg: "#C real part must be a real number".to_string(),
                    pos: self.current_token.pos,
                })?;
                let imag_f = to_f64(imag).ok_or_else(|| ReaderError::InvalidSyntax {
                    msg: "#C imaginary part must be a real number".to_string(),
                    pos: self.current_token.pos,
                })?;
                Ok(rlasp_runtime::Number::allocate_complex(num_complex::Complex::new(real_f, imag_f)))
            }

            TokenKind::HashPlus => {
                // Feature conditional: #+(feature) form
                // Include form only if feature is present
                self.advance()?; // skip #+
                let feature_expr = self.read_expr()?; // read feature expression
                let form = self.read_expr()?; // read the conditional form

                if evaluate_feature_expr(feature_expr) {
                    Ok(form) // Feature present - include the form
                } else {
                    // Feature absent: discard exactly one following form and return a
                    // marker for the caller to filter. Do not recursively read again
                    // here, otherwise one read() can consume multiple top-level forms.
                    Ok(Symbol::allocate(FEATURE_SKIP_MARKER))
                }
            }

            TokenKind::HashMinus => {
                // Negative feature conditional: #-(feature) form
                // Include form only if feature is absent
                self.advance()?; // skip #-
                let feature_expr = self.read_expr()?; // read feature expression
                let form = self.read_expr()?; // read the conditional form

                if !evaluate_feature_expr(feature_expr) {
                    Ok(form) // Feature absent - include the form
                } else {
                    // Feature present: discard exactly one following form and return a
                    // marker for the caller to filter. Do not recursively read again
                    // here, otherwise one read() can consume multiple top-level forms.
                    Ok(Symbol::allocate(FEATURE_SKIP_MARKER))
                }
            }

            TokenKind::HashDot => {
                // Read-time eval: #.(form)
                // Evaluates form at read time and uses result as object
                // Wrap in internal marker (sys::read-time-eval form) for processing during AST conversion
                self.advance()?; // skip #.
                let form = self.read_expr()?;
                let rte_sym = rlasp_runtime::Symbol::allocate("sys::read-time-eval");
                Ok(rlasp_runtime::Cons::list(&[rte_sym, form]))
            }

            TokenKind::HashColon => {
                // Uninterned symbol: #:name
                // Creates a symbol that isn't interned in any package
                self.advance()?; // skip #:

                // Next token should be a symbol
                if let TokenKind::Symbol(name) = &self.current_token.kind {
                    let name = name.clone();
                    self.advance()?;
                    Ok(Symbol::allocate_uninterned(name.as_str()))
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

            TokenKind::HashStar(bits_str) => {
                // Bit vector: #*01101 (payload already lexed to preserve leading zeros)
                let bits_str = bits_str.clone();
                self.advance()?;
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
                Ok(RVector::allocate(elements))
            }

            TokenKind::HashDigit(dim) => {
                // Array notation: #2A(...) or #3A(...)
                // Convert nested list payload into nested vectors.
                let array_rank = *dim as usize;
                self.advance()?; // skip #<digit>
                // Check for 'A' or 'a'
                if let TokenKind::Symbol(s) = &self.current_token.kind {
                    if s.eq_ignore_ascii_case("a") {
                        self.advance()?; // skip 'A'
                    }
                }
                // Read the array contents (expect a list)
                let payload = self.read_expr()?;
                if array_rank == 0 {
                    Ok(payload)
                } else {
                    self.array_literal_to_vector(payload, array_rank)
                }
            }

            TokenKind::HashEquals(label) => {
                // Circular reference label definition: #n=expr
                // Store the expression with the label for later reference
                let label_num = *label;
                self.advance()?; // skip #n=
                let expr = self.read_expr()?;
                // Store in label map for later #n# references
                self.label_map.insert(label_num, expr);
                Ok(expr)
            }

            TokenKind::HashRef(label) => {
                // Circular reference: #n#
                // References a previously defined label
                let label_num = *label;
                self.advance()?; // skip #n#
                // Look up in label map
                if let Some(&expr) = self.label_map.get(&label_num) {
                    Ok(expr)
                } else {
                    Err(ReaderError::InvalidSyntax {
                        msg: format!("Undefined label reference #{}#", label_num),
                        pos: self.current_token.pos,
                    })
                }
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

            let elem = self.read_expr()?;
            // Filter out feature conditional skip markers
            if !is_skip_marker(&elem) {
                elements.push(elem);
            }
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
            let elem = self.read_expr()?;
            // Filter out feature conditional skip markers
            if !is_skip_marker(&elem) {
                elements.push(elem);
            }
        }

        if !matches!(self.current_token.kind, TokenKind::RightParen) {
            return Err(ReaderError::ExpectedClosing {
                expected: ')',
                pos: self.current_token.pos,
            });
        }

        self.advance()?; // skip )

        Ok(RVector::allocate(elements))
    }

    fn array_literal_to_vector(&self, obj: LispObject, depth: usize) -> ReaderResult<LispObject> {
        if depth == 0 {
            return Ok(obj);
        }
        if obj.is_nil() {
            return Ok(RVector::allocate(Vec::new()));
        }
        if !obj.is_cons() {
            return Ok(obj);
        }

        let mut elements = Vec::new();
        let mut current = obj;
        while let Some(cons_ptr) = current.as_cons_ptr() {
            let cons = unsafe { &*cons_ptr };
            let raw_elem = cons.car();
            let elem = if depth > 1 {
                self.array_literal_to_vector(raw_elem, depth - 1)?
            } else {
                raw_elem
            };
            elements.push(elem);
            current = cons.cdr();
        }

        if !current.is_nil() {
            return Err(ReaderError::InvalidSyntax {
                msg: "Array literal must be a proper list".to_string(),
                pos: self.current_token.pos,
            });
        }

        Ok(RVector::allocate(elements))
    }

    fn advance(&mut self) -> ReaderResult<()> {
        self.last_token_end_pos = self.lexer.position();
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
