/// eval_env.rs - Common Lisp environment and time functions
use super::eval_types::EvalResult;
use std::time::{SystemTime, UNIX_EPOCH, Instant};
use std::sync::OnceLock;
use std::rc::Rc;
use std::cell::RefCell;

pub fn call_env_builtin(name: &str, args: &[EvalResult]) -> Result<EvalResult, String> {
    match name {
        "sleep" => {
            match args.get(0) {
                Some(EvalResult::Fixnum(n)) if *n >= 0 => {
                    std::thread::sleep(std::time::Duration::from_secs(*n as u64));
                    Ok(EvalResult::Nil)
                }
                Some(EvalResult::Float(n)) if *n >= 0.0 => {
                    let secs = n.floor() as u64;
                    let nanos = ((n - n.floor()) * 1_000_000_000.0) as u32;
                    std::thread::sleep(std::time::Duration::new(secs, nanos));
                    Ok(EvalResult::Nil)
                }
                _ => Err("sleep requires a non-negative number".to_string()),
            }
        }

        "get-universal-time" => {
            // Universal time in Common Lisp: seconds since 1900-01-01 00:00:00 UTC
            // Unix time: seconds since 1970-01-01 00:00:00 UTC
            // Difference: 2,208,988,800 seconds (70 years)
            const UNIX_TO_UNIVERSAL_TIME: u64 = 2_208_988_800;

            match SystemTime::now().duration_since(UNIX_EPOCH) {
                Ok(duration) => {
                    let unix_time = duration.as_secs();
                    let universal_time = unix_time + UNIX_TO_UNIVERSAL_TIME;
                    Ok(EvalResult::Fixnum(universal_time as i64))
                }
                Err(_) => Err("Failed to get system time".to_string()),
            }
        }

        "get-internal-real-time" => {
            // Internal time in implementation-defined units (we use nanoseconds for high resolution)
            static START_TIME: OnceLock<Instant> = OnceLock::new();
            let start = START_TIME.get_or_init(|| Instant::now());
            let elapsed = start.elapsed();
            Ok(EvalResult::Fixnum(elapsed.as_nanos() as i64))
        }

        "get-internal-run-time" => {
            // Process CPU time (we approximate with real time for now)
            match SystemTime::now().duration_since(UNIX_EPOCH) {
                Ok(duration) => {
                    Ok(EvalResult::Fixnum(duration.as_millis() as i64))
                }
                Err(_) => Err("Failed to get system time".to_string()),
            }
        }

        "lisp-implementation-type" => {
            Ok(EvalResult::String("rlasp".to_string()))
        }

        "lisp-implementation-version" => {
            Ok(EvalResult::String("0.1.0".to_string()))
        }

        "machine-type" => {
            Ok(EvalResult::String(std::env::consts::ARCH.to_string()))
        }

        "machine-version" => {
            Ok(EvalResult::String("unknown".to_string()))
        }

        "machine-instance" => {
            Ok(EvalResult::String("localhost".to_string()))
        }

        "software-type" => {
            Ok(EvalResult::String(std::env::consts::OS.to_string()))
        }

        "software-version" => {
            Ok(EvalResult::String("unknown".to_string()))
        }

        "short-site-name" | "long-site-name" => {
            Ok(EvalResult::String("unknown".to_string()))
        }

        "user-homedir-pathname" => {
            match std::env::var("HOME").or_else(|_| std::env::var("USERPROFILE")) {
                Ok(mut home) => {
                    if !home.ends_with('/') {
                        home.push('/');
                    }
                    Ok(EvalResult::Cons(
                        Rc::new(RefCell::new(EvalResult::Symbol("pathname".to_string()))),
                        Rc::new(RefCell::new(EvalResult::Cons(
                            Rc::new(RefCell::new(EvalResult::String(home))),
                            Rc::new(RefCell::new(EvalResult::Nil)),
                        ))),
                    ))
                }
                Err(_) => Ok(EvalResult::Nil),
            }
        }

        _ => Err(format!("Unknown environment builtin: {}", name)),
    }
}
