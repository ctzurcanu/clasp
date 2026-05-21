module {
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
  func.func private @cc_bits_to_single_float(i64) -> i64
  func.func private @cc_bits_to_double_float(i64) -> i64
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
  func.func private @cc_aref_raw_index(i64, i64) -> i64
  func.func private @cc_aref_raw_index_eq_fixnum(i64, i64, i64) -> i64
  func.func private @cc_aref_stack()
  func.func private @cc_set_aref(i64, i64, i64) -> i64
  func.func private @cc_set_aref_raw_index(i64, i64, i64) -> i64
  
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
  func.func private @cc_push_restart_frame(i64) -> i64
  func.func private @cc_pop_restart_frame() -> i64
  func.func private @cc_push_handler_frame(i64) -> i64
  func.func private @cc_pop_handler_frame() -> i64
  func.func private @cc_push_ignore_errors_trap() -> i64
  func.func private @cc_pop_ignore_errors_trap() -> i64
  func.func private @cc_values2(i64, i64) -> i64
  func.func private @cc_make_random_state(i64) -> i64
  func.func private @cc_restore_symbol_value(i64, i64) -> i64
  func.func private @cc_find_restart(i64) -> i64
  func.func private @cc_restart_invocation_matches(i64, i64) -> i64
  func.func private @cc_restart_invocation_args(i64) -> i64
  func.func private @cc_compute_restarts() -> i64
  func.func private @cc_read_from_string_stack()
  func.func private @cc_register_class_slot_value(i64, i64, i64) -> i64
  func.func private @cc_register_function_frame_language_raw(i64, i64) -> i64
  func.func @"%FN%foo"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 3 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = func.call @cc_nil_value() : () -> i64
    %9 = llvm.mlir.addressof @str1 : !llvm.ptr
    %10 = arith.constant 37 : i64
    %11 = func.call @cc_make_string(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_nil_value() : () -> i64
    %13 = func.call @cc_intern(%11, %12) : (i64, i64) -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = func.call @cc_cons(%13, %14) : (i64, i64) -> i64
    %16 = func.call @cc_values_pack(%15) : (i64) -> i64
    %17 = func.call @cc_set_symbol_value(%13, %8) : (i64, i64) -> i64
    %18 = llvm.mlir.addressof @str2 : !llvm.ptr
    %19 = arith.constant 38 : i64
    %20 = func.call @cc_make_string(%18, %19) : (!llvm.ptr, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_intern(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_nil_value() : () -> i64
    %24 = func.call @cc_cons(%22, %23) : (i64, i64) -> i64
    %25 = func.call @cc_values_pack(%24) : (i64) -> i64
    %26 = func.call @cc_set_symbol_value(%22, %8) : (i64, i64) -> i64
    %27 = llvm.mlir.addressof @str3 : !llvm.ptr
    %28 = arith.constant 39 : i64
    %29 = func.call @cc_make_string(%27, %28) : (!llvm.ptr, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_intern(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_cons(%31, %32) : (i64, i64) -> i64
    %34 = func.call @cc_values_pack(%33) : (i64) -> i64
    %35 = func.call @cc_set_symbol_value(%31, %8) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %36 = func.call @stack_pop_pointer() : () -> i64
    %37 = func.call @cc_multiple_value_list(%36) : (i64) -> i64
    %38 = llvm.mlir.addressof @str4 : !llvm.ptr
    %39 = arith.constant 37 : i64
    %40 = func.call @cc_make_string(%38, %39) : (!llvm.ptr, i64) -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = func.call @cc_intern(%40, %41) : (i64, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_cons(%42, %43) : (i64, i64) -> i64
    %45 = func.call @cc_values_pack(%44) : (i64) -> i64
    %46 = func.call @cc_symbol_value(%42) : (i64) -> i64
    %47 = llvm.mlir.addressof @str5 : !llvm.ptr
    %48 = arith.constant 39 : i64
    %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_intern(%49, %50) : (i64, i64) -> i64
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_cons(%51, %52) : (i64, i64) -> i64
    %54 = func.call @cc_values_pack(%53) : (i64) -> i64
    %55 = func.call @cc_symbol_value(%51) : (i64) -> i64
    %56 = func.call @cc_nil_value() : () -> i64
    %57 = arith.cmpi ne, %46, %56 : i64
    %58 = scf.if %57 -> (i64) {
      scf.yield %55 : i64
    } else {
      scf.yield %37 : i64
    }
    %59 = func.call @cc_values_pack(%58) : (i64) -> i64
    func.call @stack_push_pointer(%59) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bar"() {
    %60 = llvm.mlir.addressof @str6 : !llvm.ptr
    %61 = arith.constant 3 : i64
    %62 = func.call @cc_make_string(%60, %61) : (!llvm.ptr, i64) -> i64
    %63 = func.call @cc_nil_value() : () -> i64
    %64 = func.call @cc_intern(%62, %63) : (i64, i64) -> i64
    %65 = func.call @cc_nil_value() : () -> i64
    %66 = func.call @cc_cons(%64, %65) : (i64, i64) -> i64
    %67 = func.call @cc_values_pack(%66) : (i64) -> i64
    %68 = func.call @cc_nil_value() : () -> i64
    %69 = llvm.mlir.addressof @str7 : !llvm.ptr
    %70 = arith.constant 37 : i64
    %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
    %72 = func.call @cc_nil_value() : () -> i64
    %73 = func.call @cc_intern(%71, %72) : (i64, i64) -> i64
    %74 = func.call @cc_nil_value() : () -> i64
    %75 = func.call @cc_cons(%73, %74) : (i64, i64) -> i64
    %76 = func.call @cc_values_pack(%75) : (i64) -> i64
    %77 = func.call @cc_set_symbol_value(%73, %68) : (i64, i64) -> i64
    %78 = llvm.mlir.addressof @str8 : !llvm.ptr
    %79 = arith.constant 38 : i64
    %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
    %81 = func.call @cc_nil_value() : () -> i64
    %82 = func.call @cc_intern(%80, %81) : (i64, i64) -> i64
    %83 = func.call @cc_nil_value() : () -> i64
    %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
    %85 = func.call @cc_values_pack(%84) : (i64) -> i64
    %86 = func.call @cc_set_symbol_value(%82, %68) : (i64, i64) -> i64
    %87 = llvm.mlir.addressof @str9 : !llvm.ptr
    %88 = arith.constant 39 : i64
    %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_intern(%89, %90) : (i64, i64) -> i64
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
    %94 = func.call @cc_values_pack(%93) : (i64) -> i64
    %95 = func.call @cc_set_symbol_value(%91, %68) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %96 = func.call @stack_pop_pointer() : () -> i64
    %97 = func.call @cc_multiple_value_list(%96) : (i64) -> i64
    %98 = llvm.mlir.addressof @str10 : !llvm.ptr
    %99 = arith.constant 37 : i64
    %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_intern(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
    %105 = func.call @cc_values_pack(%104) : (i64) -> i64
    %106 = func.call @cc_symbol_value(%102) : (i64) -> i64
    %107 = llvm.mlir.addressof @str11 : !llvm.ptr
    %108 = arith.constant 39 : i64
    %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
    %110 = func.call @cc_nil_value() : () -> i64
    %111 = func.call @cc_intern(%109, %110) : (i64, i64) -> i64
    %112 = func.call @cc_nil_value() : () -> i64
    %113 = func.call @cc_cons(%111, %112) : (i64, i64) -> i64
    %114 = func.call @cc_values_pack(%113) : (i64) -> i64
    %115 = func.call @cc_symbol_value(%111) : (i64) -> i64
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = arith.cmpi ne, %106, %116 : i64
    %118 = scf.if %117 -> (i64) {
      scf.yield %115 : i64
    } else {
      scf.yield %97 : i64
    }
    %119 = func.call @cc_values_pack(%118) : (i64) -> i64
    func.call @stack_push_pointer(%119) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %120 = llvm.mlir.addressof @str12 : !llvm.ptr
    %121 = arith.constant 6 : i64
    %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
    %123 = func.call @cc_nil_value() : () -> i64
    %124 = func.call @cc_intern(%122, %123) : (i64, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_values_pack(%126) : (i64) -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = llvm.mlir.addressof @str13 : !llvm.ptr
    %130 = arith.constant 37 : i64
    %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
    %132 = func.call @cc_nil_value() : () -> i64
    %133 = func.call @cc_intern(%131, %132) : (i64, i64) -> i64
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
    %136 = func.call @cc_values_pack(%135) : (i64) -> i64
    %137 = func.call @cc_set_symbol_value(%133, %128) : (i64, i64) -> i64
    %138 = llvm.mlir.addressof @str14 : !llvm.ptr
    %139 = arith.constant 38 : i64
    %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
    %141 = func.call @cc_nil_value() : () -> i64
    %142 = func.call @cc_intern(%140, %141) : (i64, i64) -> i64
    %143 = func.call @cc_nil_value() : () -> i64
    %144 = func.call @cc_cons(%142, %143) : (i64, i64) -> i64
    %145 = func.call @cc_values_pack(%144) : (i64) -> i64
    %146 = func.call @cc_set_symbol_value(%142, %128) : (i64, i64) -> i64
    %147 = llvm.mlir.addressof @str15 : !llvm.ptr
    %148 = arith.constant 39 : i64
    %149 = func.call @cc_make_string(%147, %148) : (!llvm.ptr, i64) -> i64
    %150 = func.call @cc_nil_value() : () -> i64
    %151 = func.call @cc_intern(%149, %150) : (i64, i64) -> i64
    %152 = func.call @cc_nil_value() : () -> i64
    %153 = func.call @cc_cons(%151, %152) : (i64, i64) -> i64
    %154 = func.call @cc_values_pack(%153) : (i64) -> i64
    %155 = func.call @cc_set_symbol_value(%151, %128) : (i64, i64) -> i64
    %156 = func.call @cc_nil_value() : () -> i64
    %157 = func.call @cc_nil_value() : () -> i64
    %158 = func.call @cc_errorp(%156) : (i64) -> i64
    %159 = arith.cmpi ne, %158, %157 : i64
    %160 = scf.if %159 -> (i64) {
      scf.yield %156 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %161 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163 = llvm.mlir.addressof @str16 : !llvm.ptr
      %164 = arith.constant 3 : i64
      %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_intern(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_nil_value() : () -> i64
      %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
      %170 = func.call @cc_values_pack(%169) : (i64) -> i64
      %171 = func.call @cc_defclass(%167, %161, %162) : (i64, i64, i64) -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%172) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %179 = llvm.mlir.addressof @str17 : !llvm.ptr
      %180 = arith.constant 3 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = func.call @cc_nil_value() : () -> i64
      %183 = func.call @cc_intern(%181, %182) : (i64, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_values_pack(%185) : (i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %187 = arith.addi %183, %__rlasp_stack_elide_zero_0 : i64
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_cons(%187, %188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%189) : (i64) -> ()
      %190 = llvm.mlir.addressof @str18 : !llvm.ptr
      %191 = arith.constant 8 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = func.call @cc_nil_value() : () -> i64
      %194 = func.call @cc_intern(%192, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %198 = arith.addi %194, %__rlasp_stack_elide_zero_1 : i64
      %199 = func.call @stack_pop_pointer() : () -> i64
      %200 = func.call @cc_cons(%198, %199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %201 = arith.addi %200, %__rlasp_stack_elide_zero_2 : i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_eval(%203) : (i64) -> i64
      %205 = func.call @cc_multiple_value_list(%204) : (i64) -> i64
      %206 = func.call @cc_values_pack(%205) : (i64) -> i64
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %207 = func.call @stack_depth() : () -> i64
      %208 = arith.constant 0 : i64
      %209 = arith.cmpi sgt, %207, %208 : i64
      scf.if %209 {
        %210 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %211 = arith.addi %167, %__rlasp_stack_elide_zero_3 : i64
      %212 = func.call @cc_nil_value() : () -> i64
      %213 = func.call @cc_errorp(%211) : (i64) -> i64
      %214 = arith.cmpi ne, %213, %212 : i64
      %215 = scf.if %214 -> (i64) {
        scf.yield %211 : i64
      } else {
        %287 = llvm.mlir.addressof @str26 : !llvm.ptr
        %288 = func.call @cc_make_function_ref_const(%287) : (!llvm.ptr) -> i64
        %289 = llvm.mlir.addressof @str27 : !llvm.ptr
        %290 = arith.constant 8 : i64
        %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
        %292 = func.call @cc_nil_value() : () -> i64
        %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
        %294 = func.call @cc_nil_value() : () -> i64
        %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
        %296 = func.call @cc_values_pack(%295) : (i64) -> i64
        %297 = func.call @cc_set_symbol_value(%293, %288) : (i64, i64) -> i64
        %298 = llvm.mlir.addressof @str28 : !llvm.ptr
        %299 = arith.constant 8 : i64
        %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
        %301 = func.call @cc_nil_value() : () -> i64
        %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
        %303 = func.call @cc_nil_value() : () -> i64
        %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
        %305 = func.call @cc_values_pack(%304) : (i64) -> i64
        %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
        %306 = arith.addi %302, %__rlasp_stack_elide_zero_4 : i64
        scf.yield %306 : i64
      }
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_errorp(%215) : (i64) -> i64
      %309 = arith.cmpi ne, %308, %307 : i64
      %310 = scf.if %309 -> (i64) {
        scf.yield %215 : i64
      } else {
        %371 = llvm.mlir.addressof @method_name_47888533028868 : !llvm.ptr
        %372 = func.call @cc_make_lambda_ref_str(%371) : (!llvm.ptr) -> i64
        %373 = llvm.mlir.addressof @str35 : !llvm.ptr
        %374 = arith.constant 14 : i64
        %375 = func.call @cc_make_string(%373, %374) : (!llvm.ptr, i64) -> i64
        %376 = llvm.mlir.addressof @str36 : !llvm.ptr
        %377 = arith.constant 11 : i64
        %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
        %379 = func.call @cc_intern(%375, %378) : (i64, i64) -> i64
        %380 = func.call @cc_nil_value() : () -> i64
        %381 = func.call @cc_cons(%379, %380) : (i64, i64) -> i64
        %382 = func.call @cc_values_pack(%381) : (i64) -> i64
        %383 = func.call @cc_nil() : () -> i64
        %384 = llvm.mlir.addressof @str37 : !llvm.ptr
        %385 = arith.constant 1 : i64
        %386 = func.call @cc_make_string(%384, %385) : (!llvm.ptr, i64) -> i64
        %387 = func.call @cc_nil_value() : () -> i64
        %388 = func.call @cc_intern(%386, %387) : (i64, i64) -> i64
        %389 = func.call @cc_nil_value() : () -> i64
        %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
        %391 = func.call @cc_values_pack(%390) : (i64) -> i64
        %392 = func.call @cc_cons(%388, %383) : (i64, i64) -> i64
        %393 = llvm.mlir.addressof @str38 : !llvm.ptr
        %394 = arith.constant 1 : i64
        %395 = func.call @cc_make_string(%393, %394) : (!llvm.ptr, i64) -> i64
        %396 = func.call @cc_nil_value() : () -> i64
        %397 = func.call @cc_intern(%395, %396) : (i64, i64) -> i64
        %398 = func.call @cc_nil_value() : () -> i64
        %399 = func.call @cc_cons(%397, %398) : (i64, i64) -> i64
        %400 = func.call @cc_values_pack(%399) : (i64) -> i64
        %401 = func.call @cc_cons(%397, %392) : (i64, i64) -> i64
        %402 = llvm.mlir.addressof @str39 : !llvm.ptr
        %403 = arith.constant 3 : i64
        %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
        %405 = func.call @cc_nil_value() : () -> i64
        %406 = func.call @cc_intern(%404, %405) : (i64, i64) -> i64
        %407 = func.call @cc_nil_value() : () -> i64
        %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
        %409 = func.call @cc_values_pack(%408) : (i64) -> i64
        %410 = func.call @cc_cons(%406, %401) : (i64, i64) -> i64
        %411 = arith.constant 3 : i64
        %412 = func.call @cc_box_fixnum(%411) : (i64) -> i64
        %413 = arith.constant 0 : i64
        %414 = func.call @cc_defmethod_qualified(%379, %410, %372, %412, %413) : (i64, i64, i64, i64, i64) -> i64
        %415 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%415) : (i64) -> ()
        %416 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%416) : (i64) -> ()
        %417 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%417) : (i64) -> ()
        %418 = llvm.mlir.addressof @str40 : !llvm.ptr
        %419 = arith.constant 3 : i64
        %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
        %421 = llvm.mlir.addressof @str41 : !llvm.ptr
        %422 = arith.constant 11 : i64
        %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
        %424 = func.call @cc_intern(%420, %423) : (i64, i64) -> i64
        %425 = func.call @cc_nil_value() : () -> i64
        %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
        %427 = func.call @cc_values_pack(%426) : (i64) -> i64
        func.call @stack_push_pointer(%424) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %428 = func.call @stack_pop_pointer() : () -> i64
        %429 = func.call @stack_pop_pointer() : () -> i64
        %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
        %431 = arith.addi %430, %__rlasp_stack_elide_zero_5 : i64
        %432 = func.call @stack_pop_pointer() : () -> i64
        %433 = func.call @cc_cons(%432, %431) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
        %434 = arith.addi %433, %__rlasp_stack_elide_zero_6 : i64
        %435 = func.call @stack_pop_pointer() : () -> i64
        %436 = func.call @cc_cons(%434, %435) : (i64, i64) -> i64
        %437 = llvm.mlir.addressof @str42 : !llvm.ptr
        %438 = arith.constant 5 : i64
        %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
        %440 = func.call @cc_nil_value() : () -> i64
        %441 = func.call @cc_intern(%439, %440) : (i64, i64) -> i64
        %442 = func.call @cc_nil_value() : () -> i64
        %443 = func.call @cc_cons(%441, %442) : (i64, i64) -> i64
        %444 = func.call @cc_values_pack(%443) : (i64) -> i64
        %445 = func.call @cc_cons(%441, %436) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
        %446 = arith.addi %445, %__rlasp_stack_elide_zero_7 : i64
        %447 = func.call @stack_pop_pointer() : () -> i64
        %448 = func.call @cc_cons(%446, %447) : (i64, i64) -> i64
        func.call @stack_push_pointer(%448) : (i64) -> ()
        %449 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%449) : (i64) -> ()
        %450 = llvm.mlir.addressof @str43 : !llvm.ptr
        %451 = arith.constant 3 : i64
        %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
        %453 = llvm.mlir.addressof @str44 : !llvm.ptr
        %454 = arith.constant 11 : i64
        %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
        %456 = func.call @cc_intern(%452, %455) : (i64, i64) -> i64
        %457 = func.call @cc_nil_value() : () -> i64
        %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
        %459 = func.call @cc_values_pack(%458) : (i64) -> i64
        func.call @stack_push_pointer(%456) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %460 = llvm.mlir.addressof @str45 : !llvm.ptr
        %461 = arith.constant 8 : i64
        %462 = func.call @cc_make_string(%460, %461) : (!llvm.ptr, i64) -> i64
        %463 = func.call @cc_nil_value() : () -> i64
        %464 = func.call @cc_intern(%462, %463) : (i64, i64) -> i64
        %465 = func.call @cc_nil_value() : () -> i64
        %466 = func.call @cc_cons(%464, %465) : (i64, i64) -> i64
        %467 = func.call @cc_values_pack(%466) : (i64) -> i64
        func.call @stack_push_pointer(%464) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %468 = func.call @stack_pop_pointer() : () -> i64
        %469 = func.call @stack_pop_pointer() : () -> i64
        %470 = func.call @cc_cons(%469, %468) : (i64, i64) -> i64
        func.call @stack_push_pointer(%470) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %471 = func.call @stack_pop_pointer() : () -> i64
        %472 = func.call @stack_pop_pointer() : () -> i64
        %473 = func.call @cc_cons(%472, %471) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
        %474 = arith.addi %473, %__rlasp_stack_elide_zero_8 : i64
        %475 = func.call @stack_pop_pointer() : () -> i64
        %476 = func.call @cc_cons(%475, %474) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
        %477 = arith.addi %476, %__rlasp_stack_elide_zero_9 : i64
        %478 = func.call @stack_pop_pointer() : () -> i64
        %479 = func.call @cc_cons(%478, %477) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
        %480 = arith.addi %479, %__rlasp_stack_elide_zero_10 : i64
        %481 = func.call @stack_pop_pointer() : () -> i64
        %482 = func.call @cc_cons(%480, %481) : (i64, i64) -> i64
        %483 = llvm.mlir.addressof @str46 : !llvm.ptr
        %484 = arith.constant 5 : i64
        %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
        %486 = func.call @cc_nil_value() : () -> i64
        %487 = func.call @cc_intern(%485, %486) : (i64, i64) -> i64
        %488 = func.call @cc_nil_value() : () -> i64
        %489 = func.call @cc_cons(%487, %488) : (i64, i64) -> i64
        %490 = func.call @cc_values_pack(%489) : (i64) -> i64
        %491 = func.call @cc_cons(%487, %482) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
        %492 = arith.addi %491, %__rlasp_stack_elide_zero_11 : i64
        %493 = func.call @stack_pop_pointer() : () -> i64
        %494 = func.call @cc_cons(%492, %493) : (i64, i64) -> i64
        func.call @stack_push_pointer(%494) : (i64) -> ()
        %495 = llvm.mlir.addressof @str47 : !llvm.ptr
        %496 = arith.constant 6 : i64
        %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
        %498 = func.call @cc_nil_value() : () -> i64
        %499 = func.call @cc_intern(%497, %498) : (i64, i64) -> i64
        %500 = func.call @cc_nil_value() : () -> i64
        %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
        %502 = func.call @cc_values_pack(%501) : (i64) -> i64
        %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
        %503 = arith.addi %499, %__rlasp_stack_elide_zero_12 : i64
        %504 = func.call @stack_pop_pointer() : () -> i64
        %505 = func.call @cc_cons(%503, %504) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
        %506 = arith.addi %505, %__rlasp_stack_elide_zero_13 : i64
        %507 = func.call @stack_pop_pointer() : () -> i64
        %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
        func.call @stack_push_pointer(%508) : (i64) -> ()
        %509 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%509) : (i64) -> ()
        %510 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%510) : (i64) -> ()
        %511 = llvm.mlir.addressof @str48 : !llvm.ptr
        %512 = arith.constant 3 : i64
        %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
        %514 = func.call @cc_nil_value() : () -> i64
        %515 = func.call @cc_intern(%513, %514) : (i64, i64) -> i64
        %516 = func.call @cc_nil_value() : () -> i64
        %517 = func.call @cc_cons(%515, %516) : (i64, i64) -> i64
        %518 = func.call @cc_values_pack(%517) : (i64) -> i64
        %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
        %519 = arith.addi %515, %__rlasp_stack_elide_zero_14 : i64
        %520 = func.call @stack_pop_pointer() : () -> i64
        %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
        func.call @stack_push_pointer(%521) : (i64) -> ()
        %522 = llvm.mlir.addressof @str49 : !llvm.ptr
        %523 = arith.constant 6 : i64
        %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
        %525 = llvm.mlir.addressof @str50 : !llvm.ptr
        %526 = arith.constant 11 : i64
        %527 = func.call @cc_make_string(%525, %526) : (!llvm.ptr, i64) -> i64
        %528 = func.call @cc_intern(%524, %527) : (i64, i64) -> i64
        %529 = func.call @cc_nil_value() : () -> i64
        %530 = func.call @cc_cons(%528, %529) : (i64, i64) -> i64
        %531 = func.call @cc_values_pack(%530) : (i64) -> i64
        %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
        %532 = arith.addi %528, %__rlasp_stack_elide_zero_15 : i64
        %533 = func.call @stack_pop_pointer() : () -> i64
        %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
        %535 = arith.addi %534, %__rlasp_stack_elide_zero_16 : i64
        %536 = func.call @stack_pop_pointer() : () -> i64
        %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
        func.call @stack_push_pointer(%537) : (i64) -> ()
        %538 = llvm.mlir.addressof @str51 : !llvm.ptr
        %539 = arith.constant 7 : i64
        %540 = func.call @cc_make_string(%538, %539) : (!llvm.ptr, i64) -> i64
        %541 = llvm.mlir.addressof @str52 : !llvm.ptr
        %542 = arith.constant 11 : i64
        %543 = func.call @cc_make_string(%541, %542) : (!llvm.ptr, i64) -> i64
        %544 = func.call @cc_intern(%540, %543) : (i64, i64) -> i64
        %545 = func.call @cc_nil_value() : () -> i64
        %546 = func.call @cc_cons(%544, %545) : (i64, i64) -> i64
        %547 = func.call @cc_values_pack(%546) : (i64) -> i64
        %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
        %548 = arith.addi %544, %__rlasp_stack_elide_zero_17 : i64
        %549 = func.call @stack_pop_pointer() : () -> i64
        %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
        %551 = arith.addi %550, %__rlasp_stack_elide_zero_18 : i64
        %552 = func.call @stack_pop_pointer() : () -> i64
        %553 = func.call @cc_cons(%551, %552) : (i64, i64) -> i64
        func.call @stack_push_pointer(%553) : (i64) -> ()
        %554 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%554) : (i64) -> ()
        %555 = llvm.mlir.addressof @str53 : !llvm.ptr
        %556 = arith.constant 3 : i64
        %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
        %558 = func.call @cc_nil_value() : () -> i64
        %559 = func.call @cc_intern(%557, %558) : (i64, i64) -> i64
        %560 = func.call @cc_nil_value() : () -> i64
        %561 = func.call @cc_cons(%559, %560) : (i64, i64) -> i64
        %562 = func.call @cc_values_pack(%561) : (i64) -> i64
        %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
        %563 = arith.addi %559, %__rlasp_stack_elide_zero_19 : i64
        %564 = func.call @stack_pop_pointer() : () -> i64
        %565 = func.call @cc_cons(%563, %564) : (i64, i64) -> i64
        func.call @stack_push_pointer(%565) : (i64) -> ()
        %566 = llvm.mlir.addressof @str54 : !llvm.ptr
        %567 = arith.constant 9 : i64
        %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
        %569 = llvm.mlir.addressof @str55 : !llvm.ptr
        %570 = arith.constant 11 : i64
        %571 = func.call @cc_make_string(%569, %570) : (!llvm.ptr, i64) -> i64
        %572 = func.call @cc_intern(%568, %571) : (i64, i64) -> i64
        %573 = func.call @cc_nil_value() : () -> i64
        %574 = func.call @cc_cons(%572, %573) : (i64, i64) -> i64
        %575 = func.call @cc_values_pack(%574) : (i64) -> i64
        %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
        %576 = arith.addi %572, %__rlasp_stack_elide_zero_20 : i64
        %577 = func.call @stack_pop_pointer() : () -> i64
        %578 = func.call @cc_cons(%576, %577) : (i64, i64) -> i64
        func.call @stack_push_pointer(%578) : (i64) -> ()
        %579 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%579) : (i64) -> ()
        %580 = llvm.mlir.addressof @str56 : !llvm.ptr
        %581 = arith.constant 3 : i64
        %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
        %583 = func.call @cc_nil_value() : () -> i64
        %584 = func.call @cc_intern(%582, %583) : (i64, i64) -> i64
        %585 = func.call @cc_nil_value() : () -> i64
        %586 = func.call @cc_cons(%584, %585) : (i64, i64) -> i64
        %587 = func.call @cc_values_pack(%586) : (i64) -> i64
        %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
        %588 = arith.addi %584, %__rlasp_stack_elide_zero_21 : i64
        %589 = func.call @stack_pop_pointer() : () -> i64
        %590 = func.call @cc_cons(%588, %589) : (i64, i64) -> i64
        func.call @stack_push_pointer(%590) : (i64) -> ()
        %591 = llvm.mlir.addressof @str57 : !llvm.ptr
        %592 = arith.constant 1 : i64
        %593 = func.call @cc_make_string(%591, %592) : (!llvm.ptr, i64) -> i64
        %594 = func.call @cc_nil_value() : () -> i64
        %595 = func.call @cc_intern(%593, %594) : (i64, i64) -> i64
        %596 = func.call @cc_nil_value() : () -> i64
        %597 = func.call @cc_cons(%595, %596) : (i64, i64) -> i64
        %598 = func.call @cc_values_pack(%597) : (i64) -> i64
        %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
        %599 = arith.addi %595, %__rlasp_stack_elide_zero_22 : i64
        %600 = func.call @stack_pop_pointer() : () -> i64
        %601 = func.call @cc_cons(%599, %600) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
        %602 = arith.addi %601, %__rlasp_stack_elide_zero_23 : i64
        %603 = func.call @stack_pop_pointer() : () -> i64
        %604 = func.call @cc_cons(%602, %603) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
        %605 = arith.addi %604, %__rlasp_stack_elide_zero_24 : i64
        %606 = func.call @stack_pop_pointer() : () -> i64
        %607 = func.call @cc_cons(%605, %606) : (i64, i64) -> i64
        func.call @stack_push_pointer(%607) : (i64) -> ()
        %608 = llvm.mlir.addressof @str58 : !llvm.ptr
        %609 = arith.constant 14 : i64
        %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
        %611 = llvm.mlir.addressof @str59 : !llvm.ptr
        %612 = arith.constant 11 : i64
        %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
        %614 = func.call @cc_intern(%610, %613) : (i64, i64) -> i64
        %615 = func.call @cc_nil_value() : () -> i64
        %616 = func.call @cc_cons(%614, %615) : (i64, i64) -> i64
        %617 = func.call @cc_values_pack(%616) : (i64) -> i64
        %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
        %618 = arith.addi %614, %__rlasp_stack_elide_zero_25 : i64
        %619 = func.call @stack_pop_pointer() : () -> i64
        %620 = func.call @cc_cons(%618, %619) : (i64, i64) -> i64
        func.call @stack_push_pointer(%620) : (i64) -> ()
        %621 = llvm.mlir.addressof @str60 : !llvm.ptr
        %622 = arith.constant 9 : i64
        %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
        %624 = func.call @cc_nil_value() : () -> i64
        %625 = func.call @cc_intern(%623, %624) : (i64, i64) -> i64
        %626 = func.call @cc_nil_value() : () -> i64
        %627 = func.call @cc_cons(%625, %626) : (i64, i64) -> i64
        %628 = func.call @cc_values_pack(%627) : (i64) -> i64
        %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
        %629 = arith.addi %625, %__rlasp_stack_elide_zero_26 : i64
        %630 = func.call @stack_pop_pointer() : () -> i64
        %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
        %632 = arith.addi %631, %__rlasp_stack_elide_zero_27 : i64
        %633 = func.call @cc_nil_value() : () -> i64
        %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
        %635 = func.call @cc_eval(%634) : (i64) -> i64
        %636 = func.call @cc_multiple_value_list(%635) : (i64) -> i64
        %637 = func.call @cc_values_pack(%636) : (i64) -> i64
        %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
        %638 = arith.addi %637, %__rlasp_stack_elide_zero_28 : i64
        scf.yield %638 : i64
      }
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %639 = arith.addi %310, %__rlasp_stack_elide_zero_29 : i64
      scf.yield %639 : i64
    }
    %640 = func.call @cc_nil_value() : () -> i64
    %641 = func.call @cc_errorp(%160) : (i64) -> i64
    %642 = arith.cmpi ne, %641, %640 : i64
    %643 = scf.if %642 -> (i64) {
      scf.yield %160 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %644 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = llvm.mlir.addressof @str61 : !llvm.ptr
      %647 = arith.constant 3 : i64
      %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
      %649 = func.call @cc_nil_value() : () -> i64
      %650 = func.call @cc_intern(%648, %649) : (i64, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_values_pack(%652) : (i64) -> i64
      %654 = func.call @cc_defclass(%650, %644, %645) : (i64, i64, i64) -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%655) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = func.call @cc_cons(%656, %657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%658) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @stack_pop_pointer() : () -> i64
      %661 = func.call @cc_cons(%659, %660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%661) : (i64) -> ()
      %662 = llvm.mlir.addressof @str62 : !llvm.ptr
      %663 = arith.constant 3 : i64
      %664 = func.call @cc_make_string(%662, %663) : (!llvm.ptr, i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = func.call @cc_intern(%664, %665) : (i64, i64) -> i64
      %667 = func.call @cc_nil_value() : () -> i64
      %668 = func.call @cc_cons(%666, %667) : (i64, i64) -> i64
      %669 = func.call @cc_values_pack(%668) : (i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %670 = arith.addi %666, %__rlasp_stack_elide_zero_30 : i64
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %673 = llvm.mlir.addressof @str63 : !llvm.ptr
      %674 = arith.constant 8 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_intern(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_values_pack(%679) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %681 = arith.addi %677, %__rlasp_stack_elide_zero_31 : i64
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @cc_cons(%681, %682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %684 = arith.addi %683, %__rlasp_stack_elide_zero_32 : i64
      %685 = func.call @cc_nil_value() : () -> i64
      %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
      %687 = func.call @cc_eval(%686) : (i64) -> i64
      %688 = func.call @cc_multiple_value_list(%687) : (i64) -> i64
      %689 = func.call @cc_values_pack(%688) : (i64) -> i64
      func.call @stack_push_pointer(%689) : (i64) -> ()
      %690 = func.call @stack_depth() : () -> i64
      %691 = arith.constant 0 : i64
      %692 = arith.cmpi sgt, %690, %691 : i64
      scf.if %692 {
        %693 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %694 = arith.addi %650, %__rlasp_stack_elide_zero_33 : i64
      %695 = func.call @cc_nil_value() : () -> i64
      %696 = func.call @cc_errorp(%694) : (i64) -> i64
      %697 = arith.cmpi ne, %696, %695 : i64
      %698 = scf.if %697 -> (i64) {
        scf.yield %694 : i64
      } else {
        %770 = llvm.mlir.addressof @str71 : !llvm.ptr
        %771 = func.call @cc_make_function_ref_const(%770) : (!llvm.ptr) -> i64
        %772 = llvm.mlir.addressof @str72 : !llvm.ptr
        %773 = arith.constant 8 : i64
        %774 = func.call @cc_make_string(%772, %773) : (!llvm.ptr, i64) -> i64
        %775 = func.call @cc_nil_value() : () -> i64
        %776 = func.call @cc_intern(%774, %775) : (i64, i64) -> i64
        %777 = func.call @cc_nil_value() : () -> i64
        %778 = func.call @cc_cons(%776, %777) : (i64, i64) -> i64
        %779 = func.call @cc_values_pack(%778) : (i64) -> i64
        %780 = func.call @cc_set_symbol_value(%776, %771) : (i64, i64) -> i64
        %781 = llvm.mlir.addressof @str73 : !llvm.ptr
        %782 = arith.constant 8 : i64
        %783 = func.call @cc_make_string(%781, %782) : (!llvm.ptr, i64) -> i64
        %784 = func.call @cc_nil_value() : () -> i64
        %785 = func.call @cc_intern(%783, %784) : (i64, i64) -> i64
        %786 = func.call @cc_nil_value() : () -> i64
        %787 = func.call @cc_cons(%785, %786) : (i64, i64) -> i64
        %788 = func.call @cc_values_pack(%787) : (i64) -> i64
        %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
        %789 = arith.addi %785, %__rlasp_stack_elide_zero_34 : i64
        scf.yield %789 : i64
      }
      %790 = func.call @cc_nil_value() : () -> i64
      %791 = func.call @cc_errorp(%698) : (i64) -> i64
      %792 = arith.cmpi ne, %791, %790 : i64
      %793 = scf.if %792 -> (i64) {
        scf.yield %698 : i64
      } else {
        %830 = llvm.mlir.addressof @method_name_47888533028870 : !llvm.ptr
        %831 = func.call @cc_make_lambda_ref_str(%830) : (!llvm.ptr) -> i64
        %832 = llvm.mlir.addressof @str78 : !llvm.ptr
        %833 = arith.constant 14 : i64
        %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
        %835 = llvm.mlir.addressof @str79 : !llvm.ptr
        %836 = arith.constant 11 : i64
        %837 = func.call @cc_make_string(%835, %836) : (!llvm.ptr, i64) -> i64
        %838 = func.call @cc_intern(%834, %837) : (i64, i64) -> i64
        %839 = func.call @cc_nil_value() : () -> i64
        %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
        %841 = func.call @cc_values_pack(%840) : (i64) -> i64
        %842 = func.call @cc_nil() : () -> i64
        %843 = llvm.mlir.addressof @str80 : !llvm.ptr
        %844 = arith.constant 1 : i64
        %845 = func.call @cc_make_string(%843, %844) : (!llvm.ptr, i64) -> i64
        %846 = func.call @cc_nil_value() : () -> i64
        %847 = func.call @cc_intern(%845, %846) : (i64, i64) -> i64
        %848 = func.call @cc_nil_value() : () -> i64
        %849 = func.call @cc_cons(%847, %848) : (i64, i64) -> i64
        %850 = func.call @cc_values_pack(%849) : (i64) -> i64
        %851 = func.call @cc_cons(%847, %842) : (i64, i64) -> i64
        %852 = llvm.mlir.addressof @str81 : !llvm.ptr
        %853 = arith.constant 1 : i64
        %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
        %855 = func.call @cc_nil_value() : () -> i64
        %856 = func.call @cc_intern(%854, %855) : (i64, i64) -> i64
        %857 = func.call @cc_nil_value() : () -> i64
        %858 = func.call @cc_cons(%856, %857) : (i64, i64) -> i64
        %859 = func.call @cc_values_pack(%858) : (i64) -> i64
        %860 = func.call @cc_cons(%856, %851) : (i64, i64) -> i64
        %861 = llvm.mlir.addressof @str82 : !llvm.ptr
        %862 = arith.constant 3 : i64
        %863 = func.call @cc_make_string(%861, %862) : (!llvm.ptr, i64) -> i64
        %864 = func.call @cc_nil_value() : () -> i64
        %865 = func.call @cc_intern(%863, %864) : (i64, i64) -> i64
        %866 = func.call @cc_nil_value() : () -> i64
        %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
        %868 = func.call @cc_values_pack(%867) : (i64) -> i64
        %869 = func.call @cc_cons(%865, %860) : (i64, i64) -> i64
        %870 = arith.constant 3 : i64
        %871 = func.call @cc_box_fixnum(%870) : (i64) -> i64
        %872 = arith.constant 0 : i64
        %873 = func.call @cc_defmethod_qualified(%838, %869, %831, %871, %872) : (i64, i64, i64, i64, i64) -> i64
        %874 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%874) : (i64) -> ()
        %875 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%875) : (i64) -> ()
        %876 = llvm.mlir.addressof @str83 : !llvm.ptr
        %877 = arith.constant 3 : i64
        %878 = func.call @cc_make_string(%876, %877) : (!llvm.ptr, i64) -> i64
        %879 = llvm.mlir.addressof @str84 : !llvm.ptr
        %880 = arith.constant 11 : i64
        %881 = func.call @cc_make_string(%879, %880) : (!llvm.ptr, i64) -> i64
        %882 = func.call @cc_intern(%878, %881) : (i64, i64) -> i64
        %883 = func.call @cc_nil_value() : () -> i64
        %884 = func.call @cc_cons(%882, %883) : (i64, i64) -> i64
        %885 = func.call @cc_values_pack(%884) : (i64) -> i64
        func.call @stack_push_pointer(%882) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %886 = llvm.mlir.addressof @str85 : !llvm.ptr
        %887 = arith.constant 8 : i64
        %888 = func.call @cc_make_string(%886, %887) : (!llvm.ptr, i64) -> i64
        %889 = func.call @cc_nil_value() : () -> i64
        %890 = func.call @cc_intern(%888, %889) : (i64, i64) -> i64
        %891 = func.call @cc_nil_value() : () -> i64
        %892 = func.call @cc_cons(%890, %891) : (i64, i64) -> i64
        %893 = func.call @cc_values_pack(%892) : (i64) -> i64
        func.call @stack_push_pointer(%890) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %894 = func.call @stack_pop_pointer() : () -> i64
        %895 = func.call @stack_pop_pointer() : () -> i64
        %896 = func.call @cc_cons(%895, %894) : (i64, i64) -> i64
        func.call @stack_push_pointer(%896) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %897 = func.call @stack_pop_pointer() : () -> i64
        %898 = func.call @stack_pop_pointer() : () -> i64
        %899 = func.call @cc_cons(%898, %897) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
        %900 = arith.addi %899, %__rlasp_stack_elide_zero_35 : i64
        %901 = func.call @stack_pop_pointer() : () -> i64
        %902 = func.call @cc_cons(%901, %900) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
        %903 = arith.addi %902, %__rlasp_stack_elide_zero_36 : i64
        %904 = func.call @stack_pop_pointer() : () -> i64
        %905 = func.call @cc_cons(%904, %903) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
        %906 = arith.addi %905, %__rlasp_stack_elide_zero_37 : i64
        %907 = func.call @stack_pop_pointer() : () -> i64
        %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
        %909 = llvm.mlir.addressof @str86 : !llvm.ptr
        %910 = arith.constant 5 : i64
        %911 = func.call @cc_make_string(%909, %910) : (!llvm.ptr, i64) -> i64
        %912 = func.call @cc_nil_value() : () -> i64
        %913 = func.call @cc_intern(%911, %912) : (i64, i64) -> i64
        %914 = func.call @cc_nil_value() : () -> i64
        %915 = func.call @cc_cons(%913, %914) : (i64, i64) -> i64
        %916 = func.call @cc_values_pack(%915) : (i64) -> i64
        %917 = func.call @cc_cons(%913, %908) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
        %918 = arith.addi %917, %__rlasp_stack_elide_zero_38 : i64
        %919 = func.call @stack_pop_pointer() : () -> i64
        %920 = func.call @cc_cons(%918, %919) : (i64, i64) -> i64
        func.call @stack_push_pointer(%920) : (i64) -> ()
        %921 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%921) : (i64) -> ()
        %922 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%922) : (i64) -> ()
        %923 = llvm.mlir.addressof @str87 : !llvm.ptr
        %924 = arith.constant 3 : i64
        %925 = func.call @cc_make_string(%923, %924) : (!llvm.ptr, i64) -> i64
        %926 = func.call @cc_nil_value() : () -> i64
        %927 = func.call @cc_intern(%925, %926) : (i64, i64) -> i64
        %928 = func.call @cc_nil_value() : () -> i64
        %929 = func.call @cc_cons(%927, %928) : (i64, i64) -> i64
        %930 = func.call @cc_values_pack(%929) : (i64) -> i64
        %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
        %931 = arith.addi %927, %__rlasp_stack_elide_zero_39 : i64
        %932 = func.call @stack_pop_pointer() : () -> i64
        %933 = func.call @cc_cons(%931, %932) : (i64, i64) -> i64
        func.call @stack_push_pointer(%933) : (i64) -> ()
        %934 = llvm.mlir.addressof @str88 : !llvm.ptr
        %935 = arith.constant 6 : i64
        %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
        %937 = llvm.mlir.addressof @str89 : !llvm.ptr
        %938 = arith.constant 11 : i64
        %939 = func.call @cc_make_string(%937, %938) : (!llvm.ptr, i64) -> i64
        %940 = func.call @cc_intern(%936, %939) : (i64, i64) -> i64
        %941 = func.call @cc_nil_value() : () -> i64
        %942 = func.call @cc_cons(%940, %941) : (i64, i64) -> i64
        %943 = func.call @cc_values_pack(%942) : (i64) -> i64
        %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
        %944 = arith.addi %940, %__rlasp_stack_elide_zero_40 : i64
        %945 = func.call @stack_pop_pointer() : () -> i64
        %946 = func.call @cc_cons(%944, %945) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
        %947 = arith.addi %946, %__rlasp_stack_elide_zero_41 : i64
        %948 = func.call @stack_pop_pointer() : () -> i64
        %949 = func.call @cc_cons(%947, %948) : (i64, i64) -> i64
        func.call @stack_push_pointer(%949) : (i64) -> ()
        %950 = llvm.mlir.addressof @str90 : !llvm.ptr
        %951 = arith.constant 7 : i64
        %952 = func.call @cc_make_string(%950, %951) : (!llvm.ptr, i64) -> i64
        %953 = llvm.mlir.addressof @str91 : !llvm.ptr
        %954 = arith.constant 11 : i64
        %955 = func.call @cc_make_string(%953, %954) : (!llvm.ptr, i64) -> i64
        %956 = func.call @cc_intern(%952, %955) : (i64, i64) -> i64
        %957 = func.call @cc_nil_value() : () -> i64
        %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
        %959 = func.call @cc_values_pack(%958) : (i64) -> i64
        %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
        %960 = arith.addi %956, %__rlasp_stack_elide_zero_42 : i64
        %961 = func.call @stack_pop_pointer() : () -> i64
        %962 = func.call @cc_cons(%960, %961) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
        %963 = arith.addi %962, %__rlasp_stack_elide_zero_43 : i64
        %964 = func.call @stack_pop_pointer() : () -> i64
        %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
        func.call @stack_push_pointer(%965) : (i64) -> ()
        %966 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%966) : (i64) -> ()
        %967 = llvm.mlir.addressof @str92 : !llvm.ptr
        %968 = arith.constant 3 : i64
        %969 = func.call @cc_make_string(%967, %968) : (!llvm.ptr, i64) -> i64
        %970 = func.call @cc_nil_value() : () -> i64
        %971 = func.call @cc_intern(%969, %970) : (i64, i64) -> i64
        %972 = func.call @cc_nil_value() : () -> i64
        %973 = func.call @cc_cons(%971, %972) : (i64, i64) -> i64
        %974 = func.call @cc_values_pack(%973) : (i64) -> i64
        %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
        %975 = arith.addi %971, %__rlasp_stack_elide_zero_44 : i64
        %976 = func.call @stack_pop_pointer() : () -> i64
        %977 = func.call @cc_cons(%975, %976) : (i64, i64) -> i64
        func.call @stack_push_pointer(%977) : (i64) -> ()
        %978 = llvm.mlir.addressof @str93 : !llvm.ptr
        %979 = arith.constant 9 : i64
        %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
        %981 = llvm.mlir.addressof @str94 : !llvm.ptr
        %982 = arith.constant 11 : i64
        %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
        %984 = func.call @cc_intern(%980, %983) : (i64, i64) -> i64
        %985 = func.call @cc_nil_value() : () -> i64
        %986 = func.call @cc_cons(%984, %985) : (i64, i64) -> i64
        %987 = func.call @cc_values_pack(%986) : (i64) -> i64
        %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
        %988 = arith.addi %984, %__rlasp_stack_elide_zero_45 : i64
        %989 = func.call @stack_pop_pointer() : () -> i64
        %990 = func.call @cc_cons(%988, %989) : (i64, i64) -> i64
        func.call @stack_push_pointer(%990) : (i64) -> ()
        %991 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%991) : (i64) -> ()
        %992 = llvm.mlir.addressof @str95 : !llvm.ptr
        %993 = arith.constant 3 : i64
        %994 = func.call @cc_make_string(%992, %993) : (!llvm.ptr, i64) -> i64
        %995 = func.call @cc_nil_value() : () -> i64
        %996 = func.call @cc_intern(%994, %995) : (i64, i64) -> i64
        %997 = func.call @cc_nil_value() : () -> i64
        %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
        %999 = func.call @cc_values_pack(%998) : (i64) -> i64
        %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
        %1000 = arith.addi %996, %__rlasp_stack_elide_zero_46 : i64
        %1001 = func.call @stack_pop_pointer() : () -> i64
        %1002 = func.call @cc_cons(%1000, %1001) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1002) : (i64) -> ()
        %1003 = llvm.mlir.addressof @str96 : !llvm.ptr
        %1004 = arith.constant 1 : i64
        %1005 = func.call @cc_make_string(%1003, %1004) : (!llvm.ptr, i64) -> i64
        %1006 = func.call @cc_nil_value() : () -> i64
        %1007 = func.call @cc_intern(%1005, %1006) : (i64, i64) -> i64
        %1008 = func.call @cc_nil_value() : () -> i64
        %1009 = func.call @cc_cons(%1007, %1008) : (i64, i64) -> i64
        %1010 = func.call @cc_values_pack(%1009) : (i64) -> i64
        %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
        %1011 = arith.addi %1007, %__rlasp_stack_elide_zero_47 : i64
        %1012 = func.call @stack_pop_pointer() : () -> i64
        %1013 = func.call @cc_cons(%1011, %1012) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
        %1014 = arith.addi %1013, %__rlasp_stack_elide_zero_48 : i64
        %1015 = func.call @stack_pop_pointer() : () -> i64
        %1016 = func.call @cc_cons(%1014, %1015) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
        %1017 = arith.addi %1016, %__rlasp_stack_elide_zero_49 : i64
        %1018 = func.call @stack_pop_pointer() : () -> i64
        %1019 = func.call @cc_cons(%1017, %1018) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1019) : (i64) -> ()
        %1020 = llvm.mlir.addressof @str97 : !llvm.ptr
        %1021 = arith.constant 14 : i64
        %1022 = func.call @cc_make_string(%1020, %1021) : (!llvm.ptr, i64) -> i64
        %1023 = llvm.mlir.addressof @str98 : !llvm.ptr
        %1024 = arith.constant 11 : i64
        %1025 = func.call @cc_make_string(%1023, %1024) : (!llvm.ptr, i64) -> i64
        %1026 = func.call @cc_intern(%1022, %1025) : (i64, i64) -> i64
        %1027 = func.call @cc_nil_value() : () -> i64
        %1028 = func.call @cc_cons(%1026, %1027) : (i64, i64) -> i64
        %1029 = func.call @cc_values_pack(%1028) : (i64) -> i64
        %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
        %1030 = arith.addi %1026, %__rlasp_stack_elide_zero_50 : i64
        %1031 = func.call @stack_pop_pointer() : () -> i64
        %1032 = func.call @cc_cons(%1030, %1031) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1032) : (i64) -> ()
        %1033 = llvm.mlir.addressof @str99 : !llvm.ptr
        %1034 = arith.constant 9 : i64
        %1035 = func.call @cc_make_string(%1033, %1034) : (!llvm.ptr, i64) -> i64
        %1036 = func.call @cc_nil_value() : () -> i64
        %1037 = func.call @cc_intern(%1035, %1036) : (i64, i64) -> i64
        %1038 = func.call @cc_nil_value() : () -> i64
        %1039 = func.call @cc_cons(%1037, %1038) : (i64, i64) -> i64
        %1040 = func.call @cc_values_pack(%1039) : (i64) -> i64
        %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
        %1041 = arith.addi %1037, %__rlasp_stack_elide_zero_51 : i64
        %1042 = func.call @stack_pop_pointer() : () -> i64
        %1043 = func.call @cc_cons(%1041, %1042) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
        %1044 = arith.addi %1043, %__rlasp_stack_elide_zero_52 : i64
        %1045 = func.call @cc_nil_value() : () -> i64
        %1046 = func.call @cc_cons(%1044, %1045) : (i64, i64) -> i64
        %1047 = func.call @cc_eval(%1046) : (i64) -> i64
        %1048 = func.call @cc_multiple_value_list(%1047) : (i64) -> i64
        %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
        %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
        %1050 = arith.addi %1049, %__rlasp_stack_elide_zero_53 : i64
        scf.yield %1050 : i64
      }
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1051 = arith.addi %793, %__rlasp_stack_elide_zero_54 : i64
      scf.yield %1051 : i64
    }
    %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
    %1052 = arith.addi %643, %__rlasp_stack_elide_zero_55 : i64
    %1053 = func.call @cc_multiple_value_list(%1052) : (i64) -> i64
    %1054 = llvm.mlir.addressof @str100 : !llvm.ptr
    %1055 = arith.constant 37 : i64
    %1056 = func.call @cc_make_string(%1054, %1055) : (!llvm.ptr, i64) -> i64
    %1057 = func.call @cc_nil_value() : () -> i64
    %1058 = func.call @cc_intern(%1056, %1057) : (i64, i64) -> i64
    %1059 = func.call @cc_nil_value() : () -> i64
    %1060 = func.call @cc_cons(%1058, %1059) : (i64, i64) -> i64
    %1061 = func.call @cc_values_pack(%1060) : (i64) -> i64
    %1062 = func.call @cc_symbol_value(%1058) : (i64) -> i64
    %1063 = llvm.mlir.addressof @str101 : !llvm.ptr
    %1064 = arith.constant 39 : i64
    %1065 = func.call @cc_make_string(%1063, %1064) : (!llvm.ptr, i64) -> i64
    %1066 = func.call @cc_nil_value() : () -> i64
    %1067 = func.call @cc_intern(%1065, %1066) : (i64, i64) -> i64
    %1068 = func.call @cc_nil_value() : () -> i64
    %1069 = func.call @cc_cons(%1067, %1068) : (i64, i64) -> i64
    %1070 = func.call @cc_values_pack(%1069) : (i64) -> i64
    %1071 = func.call @cc_symbol_value(%1067) : (i64) -> i64
    %1072 = func.call @cc_nil_value() : () -> i64
    %1073 = arith.cmpi ne, %1062, %1072 : i64
    %1074 = scf.if %1073 -> (i64) {
      scf.yield %1071 : i64
    } else {
      scf.yield %1053 : i64
    }
    %1075 = func.call @cc_values_pack(%1074) : (i64) -> i64
    func.call @stack_push_pointer(%1075) : (i64) -> ()
    func.return
  }
  func.func @"%FN%make-foo"() {
    %216 = llvm.mlir.addressof @str19 : !llvm.ptr
    %217 = arith.constant 8 : i64
    %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_intern(%218, %219) : (i64, i64) -> i64
    %221 = func.call @cc_nil_value() : () -> i64
    %222 = func.call @cc_cons(%220, %221) : (i64, i64) -> i64
    %223 = func.call @cc_values_pack(%222) : (i64) -> i64
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = llvm.mlir.addressof @str20 : !llvm.ptr
    %226 = arith.constant 37 : i64
    %227 = func.call @cc_make_string(%225, %226) : (!llvm.ptr, i64) -> i64
    %228 = func.call @cc_nil_value() : () -> i64
    %229 = func.call @cc_intern(%227, %228) : (i64, i64) -> i64
    %230 = func.call @cc_nil_value() : () -> i64
    %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
    %232 = func.call @cc_values_pack(%231) : (i64) -> i64
    %233 = func.call @cc_set_symbol_value(%229, %224) : (i64, i64) -> i64
    %234 = llvm.mlir.addressof @str21 : !llvm.ptr
    %235 = arith.constant 38 : i64
    %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
    %237 = func.call @cc_nil_value() : () -> i64
    %238 = func.call @cc_intern(%236, %237) : (i64, i64) -> i64
    %239 = func.call @cc_nil_value() : () -> i64
    %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
    %241 = func.call @cc_values_pack(%240) : (i64) -> i64
    %242 = func.call @cc_set_symbol_value(%238, %224) : (i64, i64) -> i64
    %243 = llvm.mlir.addressof @str22 : !llvm.ptr
    %244 = arith.constant 39 : i64
    %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
    %246 = func.call @cc_nil_value() : () -> i64
    %247 = func.call @cc_intern(%245, %246) : (i64, i64) -> i64
    %248 = func.call @cc_nil_value() : () -> i64
    %249 = func.call @cc_cons(%247, %248) : (i64, i64) -> i64
    %250 = func.call @cc_values_pack(%249) : (i64) -> i64
    %251 = func.call @cc_set_symbol_value(%247, %224) : (i64, i64) -> i64
    %252 = func.call @cc_nil_value() : () -> i64
    %253 = llvm.mlir.addressof @str23 : !llvm.ptr
    %254 = arith.constant 3 : i64
    %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
    %256 = func.call @cc_nil_value() : () -> i64
    %257 = func.call @cc_intern(%255, %256) : (i64, i64) -> i64
    %258 = func.call @cc_nil_value() : () -> i64
    %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
    %260 = func.call @cc_values_pack(%259) : (i64) -> i64
    %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
    %261 = arith.addi %257, %__rlasp_stack_elide_zero_56 : i64
    %262 = func.call @cc_make_instance(%261, %252) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
    %263 = arith.addi %262, %__rlasp_stack_elide_zero_57 : i64
    %264 = func.call @cc_multiple_value_list(%263) : (i64) -> i64
    %265 = llvm.mlir.addressof @str24 : !llvm.ptr
    %266 = arith.constant 37 : i64
    %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
    %268 = func.call @cc_nil_value() : () -> i64
    %269 = func.call @cc_intern(%267, %268) : (i64, i64) -> i64
    %270 = func.call @cc_nil_value() : () -> i64
    %271 = func.call @cc_cons(%269, %270) : (i64, i64) -> i64
    %272 = func.call @cc_values_pack(%271) : (i64) -> i64
    %273 = func.call @cc_symbol_value(%269) : (i64) -> i64
    %274 = llvm.mlir.addressof @str25 : !llvm.ptr
    %275 = arith.constant 39 : i64
    %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
    %277 = func.call @cc_nil_value() : () -> i64
    %278 = func.call @cc_intern(%276, %277) : (i64, i64) -> i64
    %279 = func.call @cc_nil_value() : () -> i64
    %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
    %281 = func.call @cc_values_pack(%280) : (i64) -> i64
    %282 = func.call @cc_symbol_value(%278) : (i64) -> i64
    %283 = func.call @cc_nil_value() : () -> i64
    %284 = arith.cmpi ne, %273, %283 : i64
    %285 = scf.if %284 -> (i64) {
      scf.yield %282 : i64
    } else {
      scf.yield %264 : i64
    }
    %286 = func.call @cc_values_pack(%285) : (i64) -> i64
    func.call @stack_push_pointer(%286) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:MAKE-LOAD-FORM_47888533028868_primary"() {
    %311 = func.call @stack_pop_pointer() : () -> i64
    %312 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %313 = func.call @stack_depth() : () -> i64
    %314 = arith.constant 0 : i64
    %315 = arith.cmpi sgt, %313, %314 : i64
    scf.if %315 {
      %316 = func.call @stack_pop_pointer() : () -> i64
    }
    %317 = llvm.mlir.addressof @str29 : !llvm.ptr
    %318 = arith.constant 3 : i64
    %319 = func.call @cc_make_string(%317, %318) : (!llvm.ptr, i64) -> i64
    %320 = llvm.mlir.addressof @str30 : !llvm.ptr
    %321 = arith.constant 11 : i64
    %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
    %323 = func.call @cc_intern(%319, %322) : (i64, i64) -> i64
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
    %326 = func.call @cc_values_pack(%325) : (i64) -> i64
    func.call @stack_push_pointer(%323) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %327 = llvm.mlir.addressof @str31 : !llvm.ptr
    %328 = arith.constant 8 : i64
    %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
    %330 = func.call @cc_nil_value() : () -> i64
    %331 = func.call @cc_intern(%329, %330) : (i64, i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
    %334 = func.call @cc_values_pack(%333) : (i64) -> i64
    func.call @stack_push_pointer(%331) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %335 = func.call @stack_pop_pointer() : () -> i64
    %336 = func.call @stack_pop_pointer() : () -> i64
    %337 = func.call @cc_cons(%336, %335) : (i64, i64) -> i64
    func.call @stack_push_pointer(%337) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %338 = func.call @stack_pop_pointer() : () -> i64
    %339 = func.call @stack_pop_pointer() : () -> i64
    %340 = func.call @cc_cons(%339, %338) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
    %341 = arith.addi %340, %__rlasp_stack_elide_zero_58 : i64
    %342 = func.call @stack_pop_pointer() : () -> i64
    %343 = func.call @cc_cons(%342, %341) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
    %344 = arith.addi %343, %__rlasp_stack_elide_zero_59 : i64
    %345 = func.call @stack_pop_pointer() : () -> i64
    %346 = func.call @cc_cons(%345, %344) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
    %347 = arith.addi %346, %__rlasp_stack_elide_zero_60 : i64
    %348 = llvm.mlir.addressof @str32 : !llvm.ptr
    %349 = arith.constant 3 : i64
    %350 = func.call @cc_make_string(%348, %349) : (!llvm.ptr, i64) -> i64
    %351 = llvm.mlir.addressof @str33 : !llvm.ptr
    %352 = arith.constant 11 : i64
    %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
    %354 = func.call @cc_intern(%350, %353) : (i64, i64) -> i64
    %355 = func.call @cc_nil_value() : () -> i64
    %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
    %357 = func.call @cc_values_pack(%356) : (i64) -> i64
    func.call @stack_push_pointer(%354) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    func.call @stack_push_nil() : () -> ()
    %358 = func.call @stack_pop_pointer() : () -> i64
    %359 = func.call @stack_pop_pointer() : () -> i64
    %360 = func.call @cc_cons(%359, %358) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
    %361 = arith.addi %360, %__rlasp_stack_elide_zero_61 : i64
    %362 = func.call @stack_pop_pointer() : () -> i64
    %363 = func.call @cc_cons(%362, %361) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
    %364 = arith.addi %363, %__rlasp_stack_elide_zero_62 : i64
    func.call @stack_push_nil() : () -> ()
    %365 = func.call @stack_pop_pointer() : () -> i64
    %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
    %367 = arith.addi %366, %__rlasp_stack_elide_zero_63 : i64
    %368 = func.call @cc_cons(%347, %367) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
    %369 = arith.addi %368, %__rlasp_stack_elide_zero_64 : i64
    %370 = func.call @cc_values_pack(%369) : (i64) -> i64
    func.call @stack_push_pointer(%370) : (i64) -> ()
    func.return
  }
  func.func @"%FN%make-bar"() {
    %699 = llvm.mlir.addressof @str64 : !llvm.ptr
    %700 = arith.constant 8 : i64
    %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
    %702 = func.call @cc_nil_value() : () -> i64
    %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
    %704 = func.call @cc_nil_value() : () -> i64
    %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
    %706 = func.call @cc_values_pack(%705) : (i64) -> i64
    %707 = func.call @cc_nil_value() : () -> i64
    %708 = llvm.mlir.addressof @str65 : !llvm.ptr
    %709 = arith.constant 37 : i64
    %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
    %711 = func.call @cc_nil_value() : () -> i64
    %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
    %713 = func.call @cc_nil_value() : () -> i64
    %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
    %715 = func.call @cc_values_pack(%714) : (i64) -> i64
    %716 = func.call @cc_set_symbol_value(%712, %707) : (i64, i64) -> i64
    %717 = llvm.mlir.addressof @str66 : !llvm.ptr
    %718 = arith.constant 38 : i64
    %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
    %720 = func.call @cc_nil_value() : () -> i64
    %721 = func.call @cc_intern(%719, %720) : (i64, i64) -> i64
    %722 = func.call @cc_nil_value() : () -> i64
    %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
    %724 = func.call @cc_values_pack(%723) : (i64) -> i64
    %725 = func.call @cc_set_symbol_value(%721, %707) : (i64, i64) -> i64
    %726 = llvm.mlir.addressof @str67 : !llvm.ptr
    %727 = arith.constant 39 : i64
    %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
    %729 = func.call @cc_nil_value() : () -> i64
    %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
    %731 = func.call @cc_nil_value() : () -> i64
    %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
    %733 = func.call @cc_values_pack(%732) : (i64) -> i64
    %734 = func.call @cc_set_symbol_value(%730, %707) : (i64, i64) -> i64
    %735 = func.call @cc_nil_value() : () -> i64
    %736 = llvm.mlir.addressof @str68 : !llvm.ptr
    %737 = arith.constant 3 : i64
    %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
    %739 = func.call @cc_nil_value() : () -> i64
    %740 = func.call @cc_intern(%738, %739) : (i64, i64) -> i64
    %741 = func.call @cc_nil_value() : () -> i64
    %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
    %743 = func.call @cc_values_pack(%742) : (i64) -> i64
    %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
    %744 = arith.addi %740, %__rlasp_stack_elide_zero_65 : i64
    %745 = func.call @cc_make_instance(%744, %735) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
    %746 = arith.addi %745, %__rlasp_stack_elide_zero_66 : i64
    %747 = func.call @cc_multiple_value_list(%746) : (i64) -> i64
    %748 = llvm.mlir.addressof @str69 : !llvm.ptr
    %749 = arith.constant 37 : i64
    %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
    %751 = func.call @cc_nil_value() : () -> i64
    %752 = func.call @cc_intern(%750, %751) : (i64, i64) -> i64
    %753 = func.call @cc_nil_value() : () -> i64
    %754 = func.call @cc_cons(%752, %753) : (i64, i64) -> i64
    %755 = func.call @cc_values_pack(%754) : (i64) -> i64
    %756 = func.call @cc_symbol_value(%752) : (i64) -> i64
    %757 = llvm.mlir.addressof @str70 : !llvm.ptr
    %758 = arith.constant 39 : i64
    %759 = func.call @cc_make_string(%757, %758) : (!llvm.ptr, i64) -> i64
    %760 = func.call @cc_nil_value() : () -> i64
    %761 = func.call @cc_intern(%759, %760) : (i64, i64) -> i64
    %762 = func.call @cc_nil_value() : () -> i64
    %763 = func.call @cc_cons(%761, %762) : (i64, i64) -> i64
    %764 = func.call @cc_values_pack(%763) : (i64) -> i64
    %765 = func.call @cc_symbol_value(%761) : (i64) -> i64
    %766 = func.call @cc_nil_value() : () -> i64
    %767 = arith.cmpi ne, %756, %766 : i64
    %768 = scf.if %767 -> (i64) {
      scf.yield %765 : i64
    } else {
      scf.yield %747 : i64
    }
    %769 = func.call @cc_values_pack(%768) : (i64) -> i64
    func.call @stack_push_pointer(%769) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:MAKE-LOAD-FORM_47888533028870_primary"() {
    %794 = func.call @stack_pop_pointer() : () -> i64
    %795 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %796 = func.call @stack_depth() : () -> i64
    %797 = arith.constant 0 : i64
    %798 = arith.cmpi sgt, %796, %797 : i64
    scf.if %798 {
      %799 = func.call @stack_pop_pointer() : () -> i64
    }
    %800 = llvm.mlir.addressof @str74 : !llvm.ptr
    %801 = arith.constant 3 : i64
    %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
    %803 = llvm.mlir.addressof @str75 : !llvm.ptr
    %804 = arith.constant 11 : i64
    %805 = func.call @cc_make_string(%803, %804) : (!llvm.ptr, i64) -> i64
    %806 = func.call @cc_intern(%802, %805) : (i64, i64) -> i64
    %807 = func.call @cc_nil_value() : () -> i64
    %808 = func.call @cc_cons(%806, %807) : (i64, i64) -> i64
    %809 = func.call @cc_values_pack(%808) : (i64) -> i64
    func.call @stack_push_pointer(%806) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %810 = llvm.mlir.addressof @str76 : !llvm.ptr
    %811 = arith.constant 8 : i64
    %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
    %813 = func.call @cc_nil_value() : () -> i64
    %814 = func.call @cc_intern(%812, %813) : (i64, i64) -> i64
    %815 = func.call @cc_nil_value() : () -> i64
    %816 = func.call @cc_cons(%814, %815) : (i64, i64) -> i64
    %817 = func.call @cc_values_pack(%816) : (i64) -> i64
    func.call @stack_push_pointer(%814) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %818 = func.call @stack_pop_pointer() : () -> i64
    %819 = func.call @stack_pop_pointer() : () -> i64
    %820 = func.call @cc_cons(%819, %818) : (i64, i64) -> i64
    func.call @stack_push_pointer(%820) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %821 = func.call @stack_pop_pointer() : () -> i64
    %822 = func.call @stack_pop_pointer() : () -> i64
    %823 = func.call @cc_cons(%822, %821) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
    %824 = arith.addi %823, %__rlasp_stack_elide_zero_67 : i64
    %825 = func.call @stack_pop_pointer() : () -> i64
    %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
    %827 = arith.addi %826, %__rlasp_stack_elide_zero_68 : i64
    %828 = func.call @stack_pop_pointer() : () -> i64
    %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
    func.call @stack_push_pointer(%829) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_47888533028864*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_47888533028864*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_47888533028864*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETFLAG_47888533028864*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETMVLIST_47888533028864*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str6("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_47888533028865*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_47888533028865*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_47888533028865*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_47888533028865*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETMVLIST_47888533028865*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_47888533028866*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETVALUE_47888533028866*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_47888533028866*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str16("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str17("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str18("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str19("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_47888533028867*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETVALUE_47888533028867*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_47888533028867*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str23("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_47888533028867*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETMVLIST_47888533028867*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str26("%FN%make-foo\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str27("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str28("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str29("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str32("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @method_name_47888533028868("COMMON-LISP:MAKE-LOAD-FORM_47888533028868_primary\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str35("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str38("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str39("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str40("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str43("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str46("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str47("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str48("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str49("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str54("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("O\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str58("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str61("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str63("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str64("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETFLAG_47888533028869*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETVALUE_47888533028869*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETMVLIST_47888533028869*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str68("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETFLAG_47888533028869*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETMVLIST_47888533028869*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str71("%FN%make-bar\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str72("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str73("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str74("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @method_name_47888533028870("COMMON-LISP:MAKE-LOAD-FORM_47888533028870_primary\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str78("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str81("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str82("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str83("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str86("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str88("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str96("O\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str97("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str100("*__MLIR_BLOCK_RETFLAG_47888533028866*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str101("*__MLIR_BLOCK_RETMVLIST_47888533028866*\00") : !llvm.array<40 x i8>
}
