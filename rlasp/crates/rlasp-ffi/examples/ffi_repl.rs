//! Lisp-style FFI REPL
//!
//! Run with: cargo run --example ffi_repl

use rlasp_ffi::{Library, ForeignFunction, ForeignSignature, ForeignType};
use rlasp_ffi::types::{FromLisp, ToLisp};
use rlasp_runtime::LispObject;
use std::collections::HashMap;
use std::io::{self, Write};

struct FFIRepl {
    libraries: HashMap<String, Library>,
    functions: HashMap<String, ForeignFunction>,
}

impl FFIRepl {
    fn new() -> Self {
        Self {
            libraries: HashMap::new(),
            functions: HashMap::new(),
        }
    }

    fn run(&mut self) {
        println!("rlasp FFI REPL - Lisp-style foreign function interface");
        println!("Type (help) for examples\n");

        loop {
            print!("* ");
            io::stdout().flush().unwrap();

            let mut input = String::new();
            io::stdin().read_line(&mut input).unwrap();
            let input = input.trim();

            if input.is_empty() {
                continue;
            }

            match self.eval_string(input) {
                Ok(result) => {
                    if !result.is_empty() {
                        println!("{}", result);
                    }
                }
                Err(e) => println!("Error: {}", e),
            }
        }
    }

    fn eval_string(&mut self, input: &str) -> Result<String, String> {
        let expr = self.parse(input)?;
        self.eval(&expr)
    }

    fn parse(&self, input: &str) -> Result<Expr, String> {
        let tokens = tokenize(input)?;
        parse_expr(&tokens, &mut 0)
    }

    fn eval(&mut self, expr: &Expr) -> Result<String, String> {
        match expr {
            Expr::Symbol(s) if s == "help" => Ok(self.help()),
            Expr::List(items) if !items.is_empty() => {
                match &items[0] {
                    Expr::Symbol(s) => match s.as_str() {
                        "quit" | "exit" => std::process::exit(0),
                        "help" => Ok(self.help()),
                        "load-library" => self.load_library(&items[1..]),
                        "defforeign" => self.defforeign(&items[1..]),
                        "list-libraries" => Ok(self.list_libraries()),
                        "list-functions" => Ok(self.list_functions()),
                        _ => self.call_function(s, &items[1..]),
                    }
                    _ => Err("Invalid form".to_string()),
                }
            }
            _ => Err("Expected list or symbol".to_string()),
        }
    }

    fn help(&self) -> String {
        r#"FFI REPL Commands:

(load-library "libm")              - Load dynamic library
(defforeign sqrt "sqrt" (double) double) - Define foreign function
(sqrt 16.0)                        - Call function
(list-libraries)                   - List loaded libraries
(list-functions)                   - List defined functions
(quit)                             - Exit

Types: int8 uint8 int16 uint16 int32 uint32 int64 uint64 float double void pointer

Example session:
  * (load-library "libm")
  * (defforeign sqrt "sqrt" (double) double)
  * (sqrt 16.0)
  => 4.0
  * (sqrt 2.0)
  => 1.4142135623730951"#.to_string()
    }

    fn load_library(&mut self, args: &[Expr]) -> Result<String, String> {
        if args.len() != 1 {
            return Err("Usage: (load-library \"name\")".to_string());
        }

        let name = match &args[0] {
            Expr::String(s) => s,
            _ => return Err("Library name must be a string".to_string()),
        };

        let lib = match name.as_str() {
            "libm" => Library::load_libm()?,
            _ => Library::load(name)?,
        };

        self.libraries.insert(name.clone(), lib);
        Ok(format!("; Loaded {}", name))
    }

    fn defforeign(&mut self, args: &[Expr]) -> Result<String, String> {
        // (defforeign name "symbol" (param-types...) return-type)
        if args.len() != 4 {
            return Err("Usage: (defforeign name \"symbol\" (param-types...) return-type)".to_string());
        }

        let name = match &args[0] {
            Expr::Symbol(s) => s.clone(),
            _ => return Err("Function name must be a symbol".to_string()),
        };

        let symbol = match &args[1] {
            Expr::String(s) => s.clone(),
            _ => return Err("Symbol must be a string".to_string()),
        };

        let param_types = match &args[2] {
            Expr::List(types) => {
                types.iter()
                    .map(|t| match t {
                        Expr::Symbol(s) => Self::parse_type(s),
                        _ => Err("Parameter type must be a symbol".to_string()),
                    })
                    .collect::<Result<Vec<_>, _>>()?
            }
            _ => return Err("Parameter types must be a list".to_string()),
        };

        let return_type = match &args[3] {
            Expr::Symbol(s) => Self::parse_type(s)?,
            _ => return Err("Return type must be a symbol".to_string()),
        };

        let signature = ForeignSignature {
            return_type,
            param_types,
        };

        // Find function in loaded libraries
        for (lib_name, lib) in &self.libraries {
            if let Ok(func) = lib.get_function(&symbol, signature.clone()) {
                self.functions.insert(name.clone(), func);
                return Ok(format!("; Defined {} -> {}::{}", name, lib_name, symbol));
            }
        }

        Err(format!("Symbol '{}' not found in any loaded library", symbol))
    }

    fn call_function(&mut self, name: &str, args: &[Expr]) -> Result<String, String> {
        let func = self.functions.get(name)
            .ok_or_else(|| format!("Undefined function: {}", name))?;

        let lisp_args: Result<Vec<_>, _> = args.iter()
            .map(|e| Self::expr_to_lisp(e))
            .collect();
        let lisp_args = lisp_args?;

        let result = func.call(&lisp_args)
            .map_err(|e| format!("Call failed: {:?}", e))?;

        Ok(format!("=> {}", Self::lisp_to_string(result)))
    }

    fn list_libraries(&self) -> String {
        let mut result = String::from("; Loaded libraries:\n");
        for name in self.libraries.keys() {
            result.push_str(&format!(";   {}\n", name));
        }
        result
    }

    fn list_functions(&self) -> String {
        let mut result = String::from("; Defined functions:\n");
        for name in self.functions.keys() {
            result.push_str(&format!(";   {}\n", name));
        }
        result
    }

    fn parse_type(s: &str) -> Result<ForeignType, String> {
        match s {
            "void" => Ok(ForeignType::Void),
            "int8" => Ok(ForeignType::Int8),
            "uint8" => Ok(ForeignType::UInt8),
            "int16" => Ok(ForeignType::Int16),
            "uint16" => Ok(ForeignType::UInt16),
            "int32" => Ok(ForeignType::Int32),
            "uint32" => Ok(ForeignType::UInt32),
            "int64" => Ok(ForeignType::Int64),
            "uint64" => Ok(ForeignType::UInt64),
            "float" => Ok(ForeignType::Float),
            "double" => Ok(ForeignType::Double),
            "pointer" => Ok(ForeignType::Pointer),
            _ => Err(format!("Unknown type: {}", s)),
        }
    }

    fn expr_to_lisp(expr: &Expr) -> Result<LispObject, String> {
        match expr {
            Expr::Number(n) => {
                if n.contains('.') {
                    let f: f64 = n.parse()
                        .map_err(|_| format!("Invalid float: {}", n))?;
                    Ok(f.to_lisp())
                } else {
                    let i: i32 = n.parse()
                        .map_err(|_| format!("Invalid integer: {}", n))?;
                    Ok(i.to_lisp())
                }
            }
            _ => Err(format!("Cannot convert to Lisp value: {:?}", expr)),
        }
    }

    fn lisp_to_string(obj: LispObject) -> String {
        if let Some(n) = obj.as_fixnum() {
            n.to_string()
        } else if let Some(f) = obj.as_float() {
            f.to_string()
        } else if obj.is_nil() {
            "NIL".to_string()
        } else {
            format!("{:?}", obj)
        }
    }
}

// Simple S-expression parser
#[derive(Debug, Clone)]
enum Expr {
    Symbol(String),
    String(String),
    Number(String),
    List(Vec<Expr>),
}

fn tokenize(input: &str) -> Result<Vec<String>, String> {
    let mut tokens = Vec::new();
    let mut current = String::new();
    let mut in_string = false;
    let mut chars = input.chars().peekable();

    while let Some(c) = chars.next() {
        if in_string {
            current.push(c);
            if c == '"' && current.len() > 1 {
                tokens.push(current.clone());
                current.clear();
                in_string = false;
            }
        } else {
            match c {
                '(' | ')' => {
                    if !current.is_empty() {
                        tokens.push(current.clone());
                        current.clear();
                    }
                    tokens.push(c.to_string());
                }
                '"' => {
                    if !current.is_empty() {
                        tokens.push(current.clone());
                        current.clear();
                    }
                    current.push(c);
                    in_string = true;
                }
                c if c.is_whitespace() => {
                    if !current.is_empty() {
                        tokens.push(current.clone());
                        current.clear();
                    }
                }
                _ => current.push(c),
            }
        }
    }

    if !current.is_empty() {
        tokens.push(current);
    }

    Ok(tokens)
}

fn parse_expr(tokens: &[String], pos: &mut usize) -> Result<Expr, String> {
    if *pos >= tokens.len() {
        return Err("Unexpected end of input".to_string());
    }

    let token = &tokens[*pos];
    *pos += 1;

    match token.as_str() {
        "(" => {
            let mut list = Vec::new();
            while *pos < tokens.len() && tokens[*pos] != ")" {
                list.push(parse_expr(tokens, pos)?);
            }
            if *pos >= tokens.len() {
                return Err("Unmatched '('".to_string());
            }
            *pos += 1; // skip ')'
            Ok(Expr::List(list))
        }
        ")" => Err("Unexpected ')'".to_string()),
        s if s.starts_with('"') => {
            let content = s.trim_matches('"');
            Ok(Expr::String(content.to_string()))
        }
        s if s.chars().next().unwrap().is_numeric() || s.starts_with('-') => {
            Ok(Expr::Number(s.to_string()))
        }
        s => Ok(Expr::Symbol(s.to_string())),
    }
}

fn main() {
    let mut repl = FFIRepl::new();
    repl.run();
}
