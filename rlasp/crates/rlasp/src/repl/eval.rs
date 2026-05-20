#[path = "eval_arithmetic.rs"]
mod eval_arithmetic;
#[path = "eval_control.rs"]
mod eval_control;
#[path = "eval_core.rs"]
mod eval_core;
#[path = "eval_list.rs"]
mod eval_list;
#[path = "eval_system.rs"]
mod eval_system;
/// Modular evaluator - main coordinator
///
/// This file coordinates the evaluation modules

// Module declarations with explicit paths
#[path = "eval_types.rs"]
mod eval_types;

// Common Lisp builtin modules
#[path = "eval_array.rs"]
pub mod eval_array;
#[path = "eval_char.rs"]
pub mod eval_char;
#[path = "eval_clos.rs"]
pub mod eval_clos;
#[path = "eval_conditions.rs"]
pub mod eval_conditions;
#[path = "eval_env.rs"]
pub mod eval_env;
#[path = "eval_io.rs"]
pub mod eval_io;
#[path = "eval_io2.rs"]
pub mod eval_io2;
#[path = "eval_io_syntax.rs"]
pub mod eval_io_syntax;
#[path = "eval_list2.rs"]
pub mod eval_list2;
#[path = "eval_loop.rs"]
pub mod eval_loop;
#[path = "eval_numeric.rs"]
pub mod eval_numeric;
#[path = "eval_package.rs"]
pub mod eval_package;
#[path = "eval_pathname.rs"]
pub mod eval_pathname;
#[path = "eval_readtable.rs"]
pub mod eval_readtable;
#[path = "eval_sequence.rs"]
pub mod eval_sequence;
#[path = "eval_string.rs"]
pub mod eval_string;
#[path = "eval_symbol.rs"]
pub mod eval_symbol;

// Re-export main types and functions
pub use eval_core::{
    ast_to_result, debug_global_function_binding_keys, eval, eval_with_persistent_env,
    expand_defstruct_to_ast, expand_macros, extract_params_with_defaults,
    global_function_binding_is_macro, is_allowed_extension_builtin, lookup_global_function_binding,
    macroexpand_all_to_ast, register_function_lambda_list_metadata,
    restore_global_function_bindings, snapshot_global_function_bindings,
    symbol_resolves_without_lexical_capture, sync_global_function_bindings_from_env,
    take_pending_mp_signal_condition,
};
pub use eval_list::apply_function;
pub use eval_system::{array_dims_for_bridge, register_array_dims_for_bridge};
pub use eval_system::{
    bridge_hash_key_eval, bridge_hash_key_string, bridge_hash_table_test_name,
    current_bridge_env_snapshot, pop_bridge_env_snapshot, push_bridge_env_snapshot,
    resolve_bridge_handle_value, update_bridge_env_snapshot,
};
pub use eval_system::{
    register_bridge_handle_value, register_raw_jit_object_handle, replace_raw_jit_object_handle,
    resolve_raw_jit_object_handle,
};
pub use eval_system::{result_to_ast, result_to_data_ast};
pub use eval_types::{
    get_dynamic_var, is_special_variable, next_instance_id, EvalResult, Instance,
};
