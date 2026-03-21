/// Modular evaluator - main coordinator
///
/// This file coordinates the evaluation modules

// Module declarations with explicit paths
#[path = "eval_types.rs"]
mod eval_types;
#[path = "eval_arithmetic.rs"]
mod eval_arithmetic;
#[path = "eval_list.rs"]
mod eval_list;
#[path = "eval_control.rs"]
mod eval_control;
#[path = "eval_system.rs"]
mod eval_system;
#[path = "eval_core.rs"]
mod eval_core;

// Common Lisp builtin modules
#[path = "eval_numeric.rs"]
pub mod eval_numeric;
#[path = "eval_char.rs"]
pub mod eval_char;
#[path = "eval_string.rs"]
pub mod eval_string;
#[path = "eval_sequence.rs"]
pub mod eval_sequence;
#[path = "eval_io.rs"]
pub mod eval_io;
#[path = "eval_array.rs"]
pub mod eval_array;
#[path = "eval_package.rs"]
pub mod eval_package;
#[path = "eval_list2.rs"]
pub mod eval_list2;
#[path = "eval_symbol.rs"]
pub mod eval_symbol;
#[path = "eval_env.rs"]
pub mod eval_env;
#[path = "eval_pathname.rs"]
pub mod eval_pathname;
#[path = "eval_io2.rs"]
pub mod eval_io2;
#[path = "eval_readtable.rs"]
pub mod eval_readtable;
#[path = "eval_clos.rs"]
pub mod eval_clos;
#[path = "eval_io_syntax.rs"]
pub mod eval_io_syntax;
#[path = "eval_loop.rs"]
pub mod eval_loop;
#[path = "eval_conditions.rs"]
pub mod eval_conditions;

// Re-export main types and functions
pub use eval_types::{EvalResult, Instance, next_instance_id};
pub use eval_core::{
    eval,
    eval_with_persistent_env,
    expand_macros,
    macroexpand_all_to_ast,
    extract_params_with_defaults,
    register_function_lambda_list_metadata,
    symbol_resolves_without_lexical_capture,
    take_pending_mp_signal_condition,
};
pub use eval_list::apply_function;
pub use eval_system::{result_to_ast, result_to_data_ast};
pub use eval_system::{array_dims_for_bridge, register_array_dims_for_bridge};
pub use eval_system::register_raw_jit_object_handle;
pub use eval_system::{
    current_bridge_env_snapshot,
    pop_bridge_env_snapshot,
    push_bridge_env_snapshot,
    update_bridge_env_snapshot,
};
