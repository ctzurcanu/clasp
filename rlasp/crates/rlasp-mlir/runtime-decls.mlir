// Runtime function declarations for rlasp
// These are provided by the JIT runtime and linked at execution time

// ==============================================================================
// STACK OPERATIONS - Global evaluation stack (two-stack architecture)
// ==============================================================================
func.func private @stack_push_fixnum(i64)
func.func private @stack_push_pointer(i64)
func.func private @stack_push_nil()
func.func private @stack_pop_fixnum() -> i64
func.func private @stack_pop_pointer() -> i64
func.func private @stack_depth() -> i64
func.func private @stack_clear()

// ==============================================================================
// BOXING / UNBOXING - Convert between raw values and LispObject pointers
// ==============================================================================
func.func private @cc_box_fixnum(i64) -> i64
func.func private @cc_unbox_fixnum(i64) -> i64
func.func private @cc_box_float(f64) -> i64
func.func private @cc_box_single_float(f64) -> i64
func.func private @cc_single_float_to_bits(i64) -> i64
func.func private @cc_double_float_to_bits(i64) -> i64
func.func private @cc_unbox_float(i64) -> f64
func.func private @cc_box_character(i64) -> i64
func.func private @cc_unbox_character(i64) -> i64
func.func private @cc_char_name(i64) -> i64
func.func private @cc_name_char(i64) -> i64
func.func private @cc_parse_bignum(!llvm.ptr, i64) -> i64

// ==============================================================================
// LEGACY RUNTIME FUNCTIONS (will be migrated to stack-based)
// ==============================================================================

// Basic types
func.func private @cc_nil() -> i64
func.func private @cc_t() -> i64

// List operations
func.func private @cc_cons(i64, i64) -> i64
func.func private @cc_car(i64) -> i64
func.func private @cc_cdr(i64) -> i64
func.func private @cc_append(i64, i64) -> i64
func.func private @cc_copy_seq(i64) -> i64

// Arithmetic
func.func private @cc_add(i64, i64) -> i64
func.func private @cc_sub(i64, i64) -> i64
func.func private @cc_mul(i64, i64) -> i64
func.func private @cc_div(i64, i64) -> i64
func.func private @ratio(i64) -> i64
func.func private @complex(i64) -> i64
func.func private @cc_mod(i64, i64) -> i64
func.func private @cc_expt(i64, i64) -> i64
func.func private @cc_abs(i64) -> i64
func.func private @cc_sqrt(i64) -> i64
func.func private @cc_floor(i64) -> i64
func.func private @cc_floor_2(i64, i64) -> i64
func.func private @cc_ceiling(i64) -> i64
func.func private @cc_ceiling_2(i64, i64) -> i64
func.func private @cc_round(i64) -> i64
func.func private @cc_round_2(i64, i64) -> i64
func.func private @cc_random(i64) -> i64
func.func private @cc_truncate(i64) -> i64
func.func private @cc_truncate_2(i64, i64) -> i64
func.func private @cc_gcd(i64, i64) -> i64
func.func private @cc_lcm(i64, i64) -> i64
func.func private @cc_isqrt(i64) -> i64
func.func private @cc_signum(i64) -> i64
func.func private @cc_incf(i64) -> i64

// Predicates
func.func private @cc_evenp(i64) -> i64
func.func private @cc_oddp(i64) -> i64
func.func private @cc_lt(i64, i64) -> i64
func.func private @cc_gt(i64, i64) -> i64
func.func private @cc_eq(i64, i64) -> i64
func.func private @cc_null(i64) -> i64
func.func private @cc_truthiness(i64) -> i64
func.func private @cc_le(i64, i64) -> i64
func.func private @cc_ge(i64, i64) -> i64

// Type predicates
func.func private @cc_numberp(i64) -> i64
func.func private @cc_integerp(i64) -> i64
func.func private @cc_floatp(i64) -> i64
func.func private @cc_rationalp(i64) -> i64
func.func private @cc_complexp(i64) -> i64
func.func private @cc_realp(i64) -> i64
func.func private @cc_characterp(i64) -> i64
func.func private @cc_stringp(i64) -> i64
func.func private @cc_symbolp(i64) -> i64
func.func private @cc_keywordp(i64) -> i64
func.func private @cc_arrayp(i64) -> i64
func.func private @cc_vectorp(i64) -> i64
func.func private @cc_hash_table_p(i64) -> i64
func.func private @cc_pathnamep(i64) -> i64
func.func private @cc_streamp(i64) -> i64
func.func private @cc_packagep(i64) -> i64
func.func private @cc_typep(i64, i64) -> i64
func.func private @cc_errorp(i64) -> i64
func.func private @cc_make_runtime_error(i64) -> i64
func.func private @cc_condition_value(i64) -> i64
func.func private @cc_maybe_error_from_multiple_value_list(i64) -> i64
func.func private @cc_plusp(i64) -> i64
func.func private @cc_minusp(i64) -> i64
func.func private @cc_min(i64, i64) -> i64
func.func private @cc_max(i64, i64) -> i64
func.func private @cc_equal(i64, i64) -> i64
func.func private @cc_equalp(i64, i64) -> i64

// Rational and complex numbers
func.func private @cc_ratio(i64, i64) -> i64
func.func private @cc_numerator(i64) -> i64
func.func private @cc_denominator(i64) -> i64
func.func private @cc_complex(i64, i64) -> i64
func.func private @cc_realpart(i64) -> i64
func.func private @cc_imagpart(i64) -> i64
func.func private @cc_magnitude(i64) -> i64

// I/O
func.func private @cc_print(i64) -> i64
func.func private @cc_print_stack()
func.func private @cc_write_stack()
func.func private @cc_describe_stack()
func.func private @cc_function_lambda_list_stack()
func.func private @cc_source_location_stack()
func.func private @cc_source_location_p_stack()
func.func private @cc_write_sequence_stack()
func.func private @cc_stream_write_sequence_stack()
func.func private @cc_read_sequence_stack()
func.func private @cc_stream_read_sequence_stack()
func.func private @cc_format(i64, i64) -> i64
func.func private @cc_load(i64) -> i64
func.func private @cc_load_stack(i64) -> i64
func.func private @cc_compile_file_stack(i64) -> i64
func.func private @cc_make_string_output_stream() -> i64
func.func private @cc_get_output_stream_string(i64) -> i64
func.func private @cc_make_string_input_stream(i64) -> i64

// Arrays
func.func private @cc_make_array(i64) -> i64
func.func private @cc_make_array_with_contents(i64, i64) -> i64
func.func private @cc_make_array_with_initial_element(i64, i64) -> i64
func.func private @cc_make_array_stack()
func.func private @cc_aref(i64, i64) -> i64
func.func private @cc_aref_stack()
func.func private @cc_set_aref(i64, i64, i64) -> i64

// Vectors
func.func private @cc_make_vector(i64) -> i64
func.func private @cc_svref(i64, i64) -> i64
func.func private @cc_svset(i64, i64, i64) -> i64
func.func private @cc_vector_length(i64) -> i64

// Higher-order functions
func.func private @cc_some(i64, i64) -> i64
func.func private @cc_every(i64, i64) -> i64
func.func private @cc_every2(i64, i64, i64) -> i64
func.func private @cc_find_if(i64, i64) -> i64
func.func private @cc_find_if_not(i64, i64) -> i64
func.func private @cc_values_pack(i64) -> i64
func.func private @cc_multiple_value_list(i64) -> i64
func.func private @cc_clear_multiple_values() -> ()
func.func private @cc_remove_if(i64, i64) -> i64
func.func private @cc_remove_if_full(i64, i64, i64) -> i64
func.func private @cc_remove_if_not(i64, i64) -> i64
func.func private @cc_substitute_if(i64, i64, i64) -> i64
func.func private @cc_position_if(i64, i64) -> i64
func.func private @cc_position_if_not(i64, i64) -> i64
func.func private @cc_position_full(i64, i64, i64, i64, i64, i64, i64, i64) -> i64
func.func private @cc_position_if_full(i64, i64, i64, i64, i64, i64) -> i64
func.func private @cc_position_if_not_full(i64, i64, i64, i64, i64, i64) -> i64
func.func private @cc_sort(i64, i64) -> i64
func.func private @cc_sort_key(i64, i64, i64) -> i64
func.func private @cc_nconc(i64, i64) -> i64
func.func private @cc_acons(i64, i64, i64) -> i64
func.func private @cc_getf(i64, i64, i64) -> i64
func.func private @cc_remf_plist(i64, i64) -> i64
func.func private @cc_map_nil(i64, i64) -> i64
func.func private @cc_map(i64, i64, i64) -> i64
func.func private @cc_clrhash(i64) -> i64
func.func private @cc_set_difference(i64, i64) -> i64
func.func private @cc_substitute(i64, i64, i64) -> i64

// Lists
func.func private @cc_make_list(i64) -> i64
func.func private @cc_reverse(i64) -> i64
func.func private @cc_length(i64) -> i64
func.func private @cc_nth(i64, i64) -> i64
func.func private @cc_nthcdr(i64, i64) -> i64
func.func private @cc_last(i64) -> i64
func.func private @cc_butlast(i64) -> i64
func.func private @cc_cas_car(i64, i64, i64) -> i64
func.func private @cc_cas_cdr(i64, i64, i64) -> i64
func.func private @cc_is_cons(i64) -> i32
func.func private @cc_nil_value() -> i64
func.func private @cc_t_value() -> i64
func.func private @cc_register_function_lambda_list_metadata_raw(i64, i64) -> i64
func.func private @cc_runtime_debug_stack_push_name(i64)
func.func private @cc_runtime_debug_stack_push_call(i64, i64)
func.func private @cc_runtime_debug_stack_pop_name()
func.func private @cc_debug_current_stack(i64) -> i64

// Hash tables
func.func private @cc_make_hash_table() -> i64
func.func private @cc_make_hash_table_stack()
func.func private @cc_gethash(i64, i64, i64) -> i64
func.func private @cc_puthash(i64, i64, i64) -> i64
func.func private @cc_maphash_stack(i64, i64)
func.func private @cc_hash_table_keys(i64) -> i64
func.func private @cc_hash_table_values(i64) -> i64
func.func private @cc_hash_table_weakness(i64) -> i64

// Strings
func.func private @cc_make_string(!llvm.ptr, i64) -> i64
func.func private @cc_make_string_repeat(i64, i64) -> i64
func.func private @cc_string_equal(i64, i64) -> i64
func.func private @cc_string_equal_full(i64) -> i64
func.func private @cc_set_char(i64, i64, i64) -> i64
func.func private @cc_char_eq(i64, i64) -> i64
func.func private @cc_char_ne(i64, i64) -> i64
func.func private @cc_char_lt(i64, i64) -> i64
func.func private @cc_char_gt(i64, i64) -> i64
func.func private @cc_char_le(i64, i64) -> i64
func.func private @cc_char_ge(i64, i64) -> i64
func.func private @cc_char_equal(i64, i64) -> i64
func.func private @cc_char_not_equal(i64, i64) -> i64
func.func private @cc_char_lessp(i64, i64) -> i64
func.func private @cc_char_greaterp(i64, i64) -> i64
func.func private @cc_char_not_lessp(i64, i64) -> i64
func.func private @cc_char_not_greaterp(i64, i64) -> i64
func.func private @cc_string_upcase(i64) -> i64
func.func private @cc_string_downcase(i64) -> i64
func.func private @cc_string_capitalize(i64) -> i64
func.func private @cc_string(i64) -> i64

// Sequence operations
func.func private @cc_find(i64, i64) -> i64
func.func private @cc_find_full(i64, i64, i64, i64, i64, i64, i64, i64) -> i64
func.func private @cc_position(i64, i64) -> i64
func.func private @cc_remove(i64, i64) -> i64
func.func private @cc_subseq(i64, i64, i64) -> i64
func.func private @cc_count(i64, i64) -> i64
func.func private @cc_member(i64, i64) -> i64
func.func private @cc_pushnew(i64, i64, i64, i64, i64) -> i64
func.func private @cc_assoc(i64, i64) -> i64
func.func private @cc_assoc_if(i64, i64) -> i64
func.func private @cc_assoc_if_not(i64, i64) -> i64
func.func private @cc_search(i64, i64) -> i64
func.func private @cc_elt(i64, i64) -> i64
func.func private @cc_set_elt(i64, i64, i64) -> i64
func.func private @cc_concatenate(i64, i64) -> i64
func.func private @cc_remove_duplicates(i64) -> i64
func.func private @cc_remhash(i64, i64) -> i64

// Symbols
func.func private @cc_make_symbol(!llvm.ptr, i64) -> i64
func.func private @cc_make_function_ref_const(!llvm.ptr) -> i64
func.func private @cc_symbol_value(i64) -> i64
func.func private @cc_set_symbol_value(i64, i64) -> i64
func.func private @cc_persistent_root_value(i64) -> i64
func.func private @cc_defconstant(i64, i64) -> i64
func.func private @cc_get_symbol_property(i64, i64) -> i64
func.func private @cc_set_symbol_property(i64, i64, i64) -> i64
func.func private @cc_set_symbol_plist(i64, i64) -> i64
func.func private @cc_gensym(i64) -> i64
func.func private @cc_gentemp(i64, i64) -> i64
func.func private @cc_symbol_name(i64) -> i64
func.func private @cc_symbol_function(i64) -> i64
func.func private @cc_symbol_package(i64) -> i64
func.func private @cc_symbol_plist(i64) -> i64
func.func private @cc_get_property(i64, i64, i64) -> i64
func.func private @cc_remprop(i64, i64) -> i64
func.func private @cc_makunbound(i64) -> i64
func.func private @cc_make_symbol_from_name(i64) -> i64
func.func private @cc_copy_symbol(i64, i64) -> i64
func.func private @cc_intern(i64, i64) -> i64
func.func private @cc_find_symbol(i64, i64) -> i64
func.func private @cc_find_package(i64) -> i64
func.func private @cc_in_package(i64) -> i64
func.func private @cc_package_name(i64) -> i64
func.func private @cc_package_nicknames(i64) -> i64
func.func private @cc_package_use_list(i64) -> i64
func.func private @cc_package_used_by_list(i64) -> i64
func.func private @cc_package_shadowing_symbols(i64) -> i64
func.func private @cc_package_external_symbols(i64) -> i64
func.func private @cc_package_all_symbols(i64) -> i64
func.func private @cc_all_symbols() -> i64
func.func private @cc_use_package(i64, i64) -> i64
func.func private @cc_unuse_package(i64, i64) -> i64
func.func private @cc_export(i64, i64) -> i64
func.func private @cc_unexport(i64, i64) -> i64
func.func private @cc_import(i64, i64) -> i64
func.func private @cc_shadow(i64, i64) -> i64
func.func private @cc_shadowing_import(i64, i64) -> i64
func.func private @cc_unintern(i64, i64) -> i64
func.func private @cc_delete_package(i64) -> i64
func.func private @cc_rename_package(i64, i64, i64) -> i64
func.func private @cc_list_all_packages() -> i64

// Reduction
func.func private @cc_reduce(i64, i64) -> i64
func.func private @cc_reduce_stack(i64, i64) -> i64

// Mapping
func.func private @cc_mapcar_stack(i64, i64) -> i64
func.func private @cc_mapc_stack(i64, i64) -> i64

// Loop
func.func private @cc_loop_collect(i64, i64, i64, i64) -> i64
func.func private @cc_build_range(i64, i64, i64) -> i64

// Introspection
func.func private @cc_fboundp(i64) -> i64
func.func private @cc_fdefinition(i64) -> i64
func.func private @cc_fmakunbound(i64) -> i64
func.func private @cc_boundp(i64) -> i64
func.func private @cc_functionp(i64) -> i64
func.func private @cc_valid_function_name_p(i64) -> i64
func.func private @cc_function_block_name(i64) -> i64
func.func private @cc_progv_push(i64, i64) -> i64
func.func private @cc_progv_pop(i64) -> i64
func.func private @cc_push_float_trap_mask(i64) -> i64
func.func private @cc_restore_float_trap_mask(i64) -> i64

// Evaluation
func.func private @cc_read_from_string(i64) -> i64
func.func private @cc_eval(i64) -> i64
func.func private @cc_compile(i64) -> i64

// CLOS - Object System
func.func private @cc_defclass(i64, i64, i64) -> i64
func.func private @cc_defclass_with_metaclass(i64, i64, i64, i64) -> i64
func.func private @cc_defgeneric(i64, i64) -> i64
func.func private @cc_defmethod(i64, i64, i64, i64) -> i64
func.func private @cc_make_instance(i64, i64) -> i64
func.func private @cc_change_class(i64, i64) -> i64
func.func private @cc_slot_value(i64, i64) -> i64
func.func private @cc_set_slot_value(i64, i64, i64) -> i64
func.func private @cc_call_generic(i64, i64) -> i64
func.func private @cc_get_class_def(i64) -> i64
func.func private @cc_defmethod_qualified(i64, i64, i64, i64, i64) -> i64
func.func private @cc_call_next_method() -> i64
func.func private @cc_call_next_method_with_args(i64) -> i64
func.func private @cc_next_method_p() -> i64

// CLOS - MOP Introspection
func.func private @cc_find_class(i64) -> i64
func.func private @cc_class_of(i64) -> i64
func.func private @cc_type_of(i64) -> i64
func.func private @cc_class_name(i64) -> i64
func.func private @cc_class_slots(i64) -> i64
func.func private @cc_class_direct_slots(i64) -> i64
func.func private @cc_class_direct_superclasses(i64) -> i64
func.func private @cc_class_precedence_list(i64) -> i64
func.func private @cc_subtypep(i64, i64) -> i64

// Mutation
func.func private @cc_set_car(i64, i64) -> i64
func.func private @cc_set_cdr(i64, i64) -> i64

// Uniform calling convention support
func.func private @cc_arg(i64, i64) -> i64
func.func private @cc_arg_present(i64, i64) -> i64
func.func private @cc_validate_keyword_args(i64, i64, i64) -> i64
func.func private @cc_collect_args(i64) -> i64
func.func private @cc_collect_rest_args(i64, i64) -> i64
func.func private @cc_collect_bad_char_reader_roundtrips() -> i64
func.func private @cc_collect_bad_char_name_roundtrips() -> i64
func.func private @cc_if(i64, i64, i64) -> i64

// Function objects
func.func private @cc_make_lambda_ref_str(!llvm.ptr) -> i64
func.func private @cc_make_lambda_ref_id(i64) -> i64
func.func private @cc_make_closure(i64, i64) -> i64
func.func private @cc_bind_function_object_const(!llvm.ptr, i64, i64) -> i64
func.func private @cc_funcall(i64, i64) -> i64
func.func private @cc_funcall_stack(i64, i64)
func.func private @cc_tailcall_stack(i64, i64)
func.func private @cc_apply(i64, i64) -> i64

// Control flow
func.func private @cc_dotimes(i64) -> i64
func.func private @cc_dolist(i64, i64) -> i64

// FFI (Foreign Function Interface)
func.func private @cc_ccall(i64, i64) -> i64
func.func private @cc_cpp_method_call(i64, i64, i64) -> i64

// Logical operators
func.func private @cc_and(i64) -> i64
func.func private @cc_or(i64) -> i64
func.func private @cc_not(i64) -> i64

// Time/system functions
func.func private @cc_get_internal_real_time() -> i64
func.func private @cc_get_universal_time(i64) -> i64

// System interaction
func.func private @cc_shell(i64) -> i64

// MLIR file loading
func.func private @cc_load_mlir(i64) -> i64

// Package registration
func.func private @cc_register_package(i64) -> i64
