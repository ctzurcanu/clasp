//! Lexical tokens for the reader

use rlasp_runtime::FloatFormat;
use std::fmt;

/// A token in the input stream
#[derive(Debug, Clone, PartialEq)]
pub struct Token {
    pub kind: TokenKind,
    pub pos: usize,
}

/// Token kinds
#[derive(Debug, Clone, PartialEq)]
pub enum TokenKind {
    // Delimiters
    LeftParen,    // (
    RightParen,   // )
    LeftBracket,  // [
    RightBracket, // ]
    LeftBrace,    // {
    RightBrace,   // }

    // Atoms
    Integer(i64),
    Bignum(String), // String representation of large integer
    Float(f64, FloatFormat),
    Ratio(String, String),
    String(String),
    Character(char),
    Symbol(String),
    Keyword(String), // :keyword

    // Reader macros
    Quote,     // '
    Backquote, // `
    Comma,     // ,
    CommaAt,   // ,@
    Function,  // #'

    // Special prefixes
    HashLeftParen,    // #( - vector
    HashDot,          // #. - read-time eval
    HashPlus,         // #+ - feature conditional
    HashMinus,        // #- - feature conditional
    HashBackslash,    // #\ - character
    HashColon,        // #: - uninterned symbol
    HashStar(String), // #*<bits> - bit vector literal payload (0/1 chars)
    HashDigit(u8),    // #0-9 - array dimension or reader macro
    HashC,            // #C - complex number
    HashP,            // #P - pathname
    HashEquals(u8),   // #n= - label definition for circular references
    HashRef(u8),      // #n# - label reference for circular references
    HashTilde,        // #~ - custom pathname macro (clisp extension)
    HashUnderscore,   // #_ - comment out next form

    // Package markers
    DoubleColon, // ::
    SingleColon, // :

    // Special
    Dot, // . (for dotted pairs)
    Eof,
}

impl Token {
    pub fn new(kind: TokenKind, pos: usize) -> Self {
        Token { kind, pos }
    }

    pub fn is_eof(&self) -> bool {
        matches!(self.kind, TokenKind::Eof)
    }
}

impl fmt::Display for TokenKind {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            TokenKind::LeftParen => write!(f, "("),
            TokenKind::RightParen => write!(f, ")"),
            TokenKind::LeftBracket => write!(f, "["),
            TokenKind::RightBracket => write!(f, "]"),
            TokenKind::LeftBrace => write!(f, "{{"),
            TokenKind::RightBrace => write!(f, "}}"),
            TokenKind::Integer(n) => write!(f, "{}", n),
            TokenKind::Bignum(s) => write!(f, "{}", s),
            TokenKind::Float(n, _) => write!(f, "{}", n),
            TokenKind::Ratio(n, d) => write!(f, "{}/{}", n, d),
            TokenKind::String(s) => write!(f, "\"{}\"", s),
            TokenKind::Character(c) => write!(f, "#\\{}", c),
            TokenKind::Symbol(s) => write!(f, "{}", s),
            TokenKind::Keyword(s) => write!(f, ":{}", s),
            TokenKind::Quote => write!(f, "'"),
            TokenKind::Backquote => write!(f, "`"),
            TokenKind::Comma => write!(f, ","),
            TokenKind::CommaAt => write!(f, ",@"),
            TokenKind::Function => write!(f, "#'"),
            TokenKind::HashLeftParen => write!(f, "#("),
            TokenKind::HashDot => write!(f, "#."),
            TokenKind::HashPlus => write!(f, "#+"),
            TokenKind::HashMinus => write!(f, "#-"),
            TokenKind::HashBackslash => write!(f, "#\\"),
            TokenKind::HashColon => write!(f, "#:"),
            TokenKind::HashStar(bits) => write!(f, "#*{}", bits),
            TokenKind::HashDigit(n) => write!(f, "#{}", n),
            TokenKind::HashC => write!(f, "#C"),
            TokenKind::HashP => write!(f, "#P"),
            TokenKind::HashEquals(n) => write!(f, "#{}=", n),
            TokenKind::HashRef(n) => write!(f, "#{}#", n),
            TokenKind::HashTilde => write!(f, "#~"),
            TokenKind::HashUnderscore => write!(f, "#_"),
            TokenKind::DoubleColon => write!(f, "::"),
            TokenKind::SingleColon => write!(f, ":"),
            TokenKind::Dot => write!(f, "."),
            TokenKind::Eof => write!(f, "<EOF>"),
        }
    }
}
