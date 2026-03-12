//! Common Lisp character name parsing helpers shared by reader/runtime paths.

#[inline]
fn parse_u_name(upper: &str) -> Option<char> {
    let hex = if let Some(rest) = upper.strip_prefix("U+") {
        rest
    } else if let Some(rest) = upper.strip_prefix('U') {
        rest
    } else {
        return None;
    };
    if hex.is_empty() {
        return None;
    }
    u32::from_str_radix(hex, 16).ok().and_then(char::from_u32)
}

#[inline]
fn canonical_name(name: &str) -> String {
    let mut out = String::with_capacity(name.len());
    let mut last_sep = false;
    for ch in name.chars() {
        if ch.is_ascii_alphanumeric() {
            out.push(ch.to_ascii_uppercase());
            last_sep = false;
        } else if !last_sep {
            out.push('_');
            last_sep = true;
        }
    }
    while out.ends_with('_') {
        out.pop();
    }
    out
}

/// Parse CL character names used by reader syntax (`#\NAME`) and `name-char`.
///
/// Supports:
/// - CL standard names (`Space`, `Newline`, `Tab`, ...)
/// - ASCII control aliases (`NUL`, `SOH`, ..., `US`, `DEL`)
/// - Selected Unicode names used by regression suites
/// - Hex forms like `U80`, `U+80`, `U0400`
pub fn parse_character_name(name: &str) -> Option<char> {
    let raw = if name.starts_with(':') && name.len() > 1 {
        &name[1..]
    } else {
        name
    };
    if raw.is_empty() {
        return None;
    }

    if raw.chars().count() == 1 {
        return raw.chars().next();
    }

    let upper = raw.to_ascii_uppercase();
    let canon = canonical_name(&upper);

    if let Some(ch) = parse_u_name(&upper) {
        return Some(ch);
    }
    if let Some(ch) = parse_u_name(&canon) {
        return Some(ch);
    }

    // Latin letter and digit Unicode-style names used by Clasp compatibility tables.
    if let Some(suffix) = canon.strip_prefix("LATIN_CAPITAL_LETTER_") {
        if suffix.len() == 1 {
            let c = suffix.as_bytes()[0];
            if c.is_ascii_uppercase() {
                return Some(c as char);
            }
        }
    }
    if let Some(suffix) = canon.strip_prefix("LATIN_SMALL_LETTER_") {
        if suffix.len() == 1 {
            let c = suffix.as_bytes()[0];
            if c.is_ascii_uppercase() {
                return Some((c as char).to_ascii_lowercase());
            }
        }
    }
    if let Some(suffix) = canon.strip_prefix("DIGIT_") {
        let digit = match suffix {
            "ZERO" => Some('0'),
            "ONE" => Some('1'),
            "TWO" => Some('2'),
            "THREE" => Some('3'),
            "FOUR" => Some('4'),
            "FIVE" => Some('5'),
            "SIX" => Some('6'),
            "SEVEN" => Some('7'),
            "EIGHT" => Some('8'),
            "NINE" => Some('9'),
            _ => None,
        };
        if digit.is_some() {
            return digit;
        }
    }

    match canon.as_str() {
        // Standard/semi-standard names.
        "SPACE" => Some(' '),
        "NEWLINE" | "LINEFEED" | "LF" => Some('\n'),
        "TAB" | "HT" => Some('\t'),
        "RETURN" | "CR" => Some('\r'),
        "BACKSPACE" | "BS" => Some('\u{0008}'),
        "PAGE" | "FORMFEED" | "FF" => Some('\u{000C}'),
        "RUBOUT" | "DELETE" | "DEL" => Some('\u{007F}'),
        "NULL" | "NUL" | "NIL" => Some('\u{0000}'),
        "BELL" | "BEL" => Some('\u{0007}'),
        "ESCAPE" | "ESC" => Some('\u{001B}'),
        "NO_BREAK_SPACE" => Some('\u{00A0}'),
        "OGHAM_SPACE_MARK" => Some('\u{1680}'),
        "EN_QUAD" => Some('\u{2000}'),
        "EM_QUAD" => Some('\u{2001}'),
        "EN_SPACE" => Some('\u{2002}'),
        "EM_SPACE" => Some('\u{2003}'),
        "THREE_PER_EM_SPACE" => Some('\u{2004}'),
        "FOUR_PER_EM_SPACE" => Some('\u{2005}'),
        "SIX_PER_EM_SPACE" => Some('\u{2006}'),
        "FIGURE_SPACE" => Some('\u{2007}'),
        "PUNCTUATION_SPACE" => Some('\u{2008}'),
        "THIN_SPACE" => Some('\u{2009}'),
        "HAIR_SPACE" => Some('\u{200A}'),
        "NARROW_NO_BREAK_SPACE" => Some('\u{202F}'),
        "MEDIUM_MATHEMATICAL_SPACE" => Some('\u{205F}'),
        "IDEOGRAPHIC_SPACE" => Some('\u{3000}'),
        "TRADE_MARK_SIGN" => Some('\u{2122}'),

        // C0 control aliases.
        "SOH" => Some('\u{0001}'),
        "STX" => Some('\u{0002}'),
        "ETX" => Some('\u{0003}'),
        "EOT" => Some('\u{0004}'),
        "ENQ" => Some('\u{0005}'),
        "ACK" => Some('\u{0006}'),
        "VT" => Some('\u{000B}'),
        "SO" => Some('\u{000E}'),
        "SI" => Some('\u{000F}'),
        "DLE" => Some('\u{0010}'),
        "DC1" => Some('\u{0011}'),
        "DC2" => Some('\u{0012}'),
        "DC3" => Some('\u{0013}'),
        "DC4" => Some('\u{0014}'),
        "NAK" => Some('\u{0015}'),
        "SYN" => Some('\u{0016}'),
        "ETB" => Some('\u{0017}'),
        "CAN" => Some('\u{0018}'),
        "EM" => Some('\u{0019}'),
        "SUB" => Some('\u{001A}'),
        "FS" => Some('\u{001C}'),
        "GS" => Some('\u{001D}'),
        "RS" => Some('\u{001E}'),
        "US" => Some('\u{001F}'),
        "SP" => Some('\u{0020}'),

        // ASCII punctuation names from Clasp's additional mapping table.
        "EXCLAMATION_MARK" => Some('!'),
        "QUOTATION_MARK" => Some('"'),
        "NUMBER_SIGN" => Some('#'),
        "DOLLAR_SIGN" => Some('$'),
        "PERCENT_SIGN" => Some('%'),
        "AMPERSAND" => Some('&'),
        "APOSTROPHE" => Some('\''),
        "LEFT_PARENTHESIS" => Some('('),
        "RIGHT_PARENTHESIS" => Some(')'),
        "ASTERISK" => Some('*'),
        "PLUS_SIGN" => Some('+'),
        "COMMA" => Some(','),
        "HYPHEN_MINUS" => Some('-'),
        "FULL_STOP" => Some('.'),
        "SOLIDUS" => Some('/'),
        "COLON" => Some(':'),
        "SEMICOLON" => Some(';'),
        "LESS_THAN_SIGN" => Some('<'),
        "EQUALS_SIGN" => Some('='),
        "GREATER_THAN_SIGN" => Some('>'),
        "QUESTION_MARK" => Some('?'),
        "COMMERCIAL_AT" => Some('@'),
        "LEFT_SQUARE_BRACKET" => Some('['),
        "REVERSE_SOLIDUS" => Some('\\'),
        "RIGHT_SQUARE_BRACKET" => Some(']'),
        "CIRCUMFLEX_ACCENT" => Some('^'),
        "LOW_LINE" => Some('_'),
        "GRAVE_ACCENT" => Some('`'),
        "LEFT_CURLY_BRACKET" => Some('{'),
        "VERTICAL_LINE" => Some('|'),
        "RIGHT_CURLY_BRACKET" => Some('}'),
        "TILDE" => Some('~'),

        // Unicode names referenced by regression tests.
        "CYRILLIC_CAPITAL_LETTER_IE_WITH_GRAVE" => char::from_u32(0x0400),
        "CYRILLIC_SMALL_LETTER_IE_WITH_GRAVE" => char::from_u32(0x0450),

        _ => None,
    }
}
