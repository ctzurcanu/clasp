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
  func.func @"__main"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 6 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = func.call @cc_nil_value() : () -> i64
    %9 = llvm.mlir.addressof @str1 : !llvm.ptr
    %10 = arith.constant 38 : i64
    %11 = func.call @cc_make_string(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_nil_value() : () -> i64
    %13 = func.call @cc_intern(%11, %12) : (i64, i64) -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = func.call @cc_cons(%13, %14) : (i64, i64) -> i64
    %16 = func.call @cc_values_pack(%15) : (i64) -> i64
    %17 = func.call @cc_set_symbol_value(%13, %8) : (i64, i64) -> i64
    %18 = llvm.mlir.addressof @str2 : !llvm.ptr
    %19 = arith.constant 39 : i64
    %20 = func.call @cc_make_string(%18, %19) : (!llvm.ptr, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_intern(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_nil_value() : () -> i64
    %24 = func.call @cc_cons(%22, %23) : (i64, i64) -> i64
    %25 = func.call @cc_values_pack(%24) : (i64) -> i64
    %26 = func.call @cc_set_symbol_value(%22, %8) : (i64, i64) -> i64
    %27 = llvm.mlir.addressof @str3 : !llvm.ptr
    %28 = arith.constant 40 : i64
    %29 = func.call @cc_make_string(%27, %28) : (!llvm.ptr, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_intern(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_cons(%31, %32) : (i64, i64) -> i64
    %34 = func.call @cc_values_pack(%33) : (i64) -> i64
    %35 = func.call @cc_set_symbol_value(%31, %8) : (i64, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_errorp(%36) : (i64) -> i64
    %39 = arith.cmpi ne, %38, %37 : i64
    %40 = scf.if %39 -> (i64) {
      scf.yield %36 : i64
    } else {
      %41 = llvm.mlir.addressof @str4 : !llvm.ptr
      %42 = arith.constant 11 : i64
      %43 = func.call @cc_make_string(%41, %42) : (!llvm.ptr, i64) -> i64
      %44 = func.call @cc_nil_value() : () -> i64
      %45 = func.call @cc_intern(%43, %44) : (i64, i64) -> i64
      %46 = func.call @cc_nil_value() : () -> i64
      %47 = func.call @cc_cons(%45, %46) : (i64, i64) -> i64
      %48 = func.call @cc_values_pack(%47) : (i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %49 = arith.addi %45, %__rlasp_stack_elide_zero_0 : i64
      %50 = func.call @cc_in_package(%49) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %51 = arith.addi %50, %__rlasp_stack_elide_zero_1 : i64
      scf.yield %51 : i64
    }
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_errorp(%40) : (i64) -> i64
    %54 = arith.cmpi ne, %53, %52 : i64
    %55 = scf.if %54 -> (i64) {
      scf.yield %40 : i64
    } else {
      %56 = llvm.mlir.addressof @str5 : !llvm.ptr
      %57 = arith.constant 13 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 3 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_intern(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_nil_value() : () -> i64
      %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
      %72 = func.call @cc_values_pack(%71) : (i64) -> i64
      func.call @stack_push_pointer(%69) : (i64) -> ()
      %73 = llvm.mlir.addressof @str7 : !llvm.ptr
      %74 = arith.constant 1 : i64
      %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
      %76 = func.call @cc_nil_value() : () -> i64
      %77 = func.call @cc_intern(%75, %76) : (i64, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      %79 = func.call @cc_cons(%77, %78) : (i64, i64) -> i64
      %80 = func.call @cc_values_pack(%79) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %81 = llvm.mlir.addressof @str8 : !llvm.ptr
      %82 = arith.constant 7 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      %84 = llvm.mlir.addressof @str9 : !llvm.ptr
      %85 = arith.constant 11 : i64
      %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
      %87 = func.call @cc_intern(%83, %86) : (i64, i64) -> i64
      %88 = func.call @cc_nil_value() : () -> i64
      %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
      %90 = func.call @cc_values_pack(%89) : (i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %91 = llvm.mlir.addressof @str10 : !llvm.ptr
      %92 = arith.constant 11 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = llvm.mlir.addressof @str11 : !llvm.ptr
      %95 = arith.constant 3 : i64
      %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
      %97 = func.call @cc_intern(%93, %96) : (i64, i64) -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
      %100 = func.call @cc_values_pack(%99) : (i64) -> i64
      func.call @stack_push_pointer(%97) : (i64) -> ()
      %101 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      %102 = llvm.mlir.addressof @str12 : !llvm.ptr
      %103 = arith.constant 6 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = llvm.mlir.addressof @str13 : !llvm.ptr
      %106 = arith.constant 11 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = func.call @cc_intern(%104, %107) : (i64, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_values_pack(%110) : (i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      %112 = llvm.mlir.addressof @str14 : !llvm.ptr
      %113 = arith.constant 1 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = func.call @cc_nil_value() : () -> i64
      %116 = func.call @cc_intern(%114, %115) : (i64, i64) -> i64
      %117 = func.call @cc_nil_value() : () -> i64
      %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
      %119 = func.call @cc_values_pack(%118) : (i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @cc_cons(%121, %120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%122) : (i64) -> ()
      %123 = llvm.mlir.addressof @str15 : !llvm.ptr
      %124 = arith.constant 6 : i64
      %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
      %126 = llvm.mlir.addressof @str16 : !llvm.ptr
      %127 = arith.constant 11 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = func.call @cc_intern(%125, %128) : (i64, i64) -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
      %132 = func.call @cc_values_pack(%131) : (i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %133 = llvm.mlir.addressof @str17 : !llvm.ptr
      %134 = arith.constant 1 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_intern(%135, %136) : (i64, i64) -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
      %140 = func.call @cc_values_pack(%139) : (i64) -> i64
      func.call @stack_push_pointer(%137) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %141 = func.call @stack_pop_pointer() : () -> i64
      %142 = func.call @stack_pop_pointer() : () -> i64
      %143 = func.call @cc_cons(%142, %141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %144 = arith.addi %143, %__rlasp_stack_elide_zero_3 : i64
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_cons(%145, %144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %147 = arith.addi %146, %__rlasp_stack_elide_zero_4 : i64
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @cc_cons(%148, %147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %150 = func.call @stack_pop_pointer() : () -> i64
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @cc_cons(%151, %150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %153 = arith.addi %152, %__rlasp_stack_elide_zero_5 : i64
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @cc_cons(%154, %153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %156 = arith.addi %155, %__rlasp_stack_elide_zero_6 : i64
      %157 = func.call @stack_pop_pointer() : () -> i64
      %158 = func.call @cc_cons(%157, %156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %159 = arith.addi %158, %__rlasp_stack_elide_zero_7 : i64
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = llvm.mlir.addressof @str18 : !llvm.ptr
      %163 = arith.constant 5 : i64
      %164 = func.call @cc_make_string(%162, %163) : (!llvm.ptr, i64) -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      %166 = func.call @cc_intern(%164, %165) : (i64, i64) -> i64
      %167 = func.call @cc_nil_value() : () -> i64
      %168 = func.call @cc_cons(%166, %167) : (i64, i64) -> i64
      %169 = func.call @cc_values_pack(%168) : (i64) -> i64
      %170 = func.call @cc_cons(%166, %161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%170) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @stack_pop_pointer() : () -> i64
      %173 = func.call @cc_cons(%172, %171) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %174 = arith.addi %173, %__rlasp_stack_elide_zero_8 : i64
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @cc_cons(%175, %174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %177 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %178 = func.call @stack_pop_pointer() : () -> i64
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @cc_cons(%179, %178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %181 = arith.addi %180, %__rlasp_stack_elide_zero_9 : i64
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @cc_cons(%182, %181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %184 = arith.addi %183, %__rlasp_stack_elide_zero_10 : i64
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @cc_cons(%185, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %187 = func.call @stack_pop_pointer() : () -> i64
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_cons(%188, %187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %190 = arith.addi %189, %__rlasp_stack_elide_zero_11 : i64
      %191 = func.call @stack_pop_pointer() : () -> i64
      %192 = func.call @cc_cons(%191, %190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %193 = func.call @stack_pop_pointer() : () -> i64
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = func.call @cc_cons(%194, %193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %196 = llvm.mlir.addressof @str19 : !llvm.ptr
      %197 = arith.constant 19 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = llvm.mlir.addressof @str20 : !llvm.ptr
      %200 = arith.constant 11 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = func.call @cc_intern(%198, %201) : (i64, i64) -> i64
      %203 = func.call @cc_nil_value() : () -> i64
      %204 = func.call @cc_cons(%202, %203) : (i64, i64) -> i64
      %205 = func.call @cc_values_pack(%204) : (i64) -> i64
      func.call @stack_push_pointer(%202) : (i64) -> ()
      %206 = llvm.mlir.addressof @str21 : !llvm.ptr
      %207 = arith.constant 2 : i64
      %208 = func.call @cc_make_string(%206, %207) : (!llvm.ptr, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_intern(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_nil_value() : () -> i64
      %212 = func.call @cc_cons(%210, %211) : (i64, i64) -> i64
      %213 = func.call @cc_values_pack(%212) : (i64) -> i64
      func.call @stack_push_pointer(%210) : (i64) -> ()
      %214 = llvm.mlir.addressof @str22 : !llvm.ptr
      %215 = arith.constant 9 : i64
      %216 = func.call @cc_make_string(%214, %215) : (!llvm.ptr, i64) -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_intern(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_nil_value() : () -> i64
      %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      func.call @stack_push_pointer(%218) : (i64) -> ()
      %222 = llvm.mlir.addressof @str23 : !llvm.ptr
      %223 = arith.constant 8 : i64
      %224 = func.call @cc_make_string(%222, %223) : (!llvm.ptr, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = func.call @cc_intern(%224, %225) : (i64, i64) -> i64
      %227 = func.call @cc_nil_value() : () -> i64
      %228 = func.call @cc_cons(%226, %227) : (i64, i64) -> i64
      %229 = func.call @cc_values_pack(%228) : (i64) -> i64
      func.call @stack_push_pointer(%226) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %230 = func.call @stack_pop_pointer() : () -> i64
      %231 = func.call @stack_pop_pointer() : () -> i64
      %232 = func.call @cc_cons(%231, %230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %233 = arith.addi %232, %__rlasp_stack_elide_zero_12 : i64
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @cc_cons(%234, %233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %236 = arith.addi %235, %__rlasp_stack_elide_zero_13 : i64
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_cons(%237, %236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %239 = llvm.mlir.addressof @str24 : !llvm.ptr
      %240 = arith.constant 7 : i64
      %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
      %242 = llvm.mlir.addressof @str25 : !llvm.ptr
      %243 = arith.constant 11 : i64
      %244 = func.call @cc_make_string(%242, %243) : (!llvm.ptr, i64) -> i64
      %245 = func.call @cc_intern(%241, %244) : (i64, i64) -> i64
      %246 = func.call @cc_nil_value() : () -> i64
      %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
      %248 = func.call @cc_values_pack(%247) : (i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %249 = llvm.mlir.addressof @str26 : !llvm.ptr
      %250 = arith.constant 1 : i64
      %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
      %252 = func.call @cc_nil_value() : () -> i64
      %253 = func.call @cc_intern(%251, %252) : (i64, i64) -> i64
      %254 = func.call @cc_nil_value() : () -> i64
      %255 = func.call @cc_cons(%253, %254) : (i64, i64) -> i64
      %256 = func.call @cc_values_pack(%255) : (i64) -> i64
      func.call @stack_push_pointer(%253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = func.call @cc_cons(%258, %257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %260 = arith.addi %259, %__rlasp_stack_elide_zero_14 : i64
      %261 = func.call @stack_pop_pointer() : () -> i64
      %262 = func.call @cc_cons(%261, %260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %263 = arith.addi %262, %__rlasp_stack_elide_zero_15 : i64
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = func.call @cc_cons(%264, %263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%265) : (i64) -> ()
      %266 = llvm.mlir.addressof @str27 : !llvm.ptr
      %267 = arith.constant 6 : i64
      %268 = func.call @cc_make_string(%266, %267) : (!llvm.ptr, i64) -> i64
      %269 = llvm.mlir.addressof @str28 : !llvm.ptr
      %270 = arith.constant 11 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      %272 = func.call @cc_intern(%268, %271) : (i64, i64) -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_cons(%272, %273) : (i64, i64) -> i64
      %275 = func.call @cc_values_pack(%274) : (i64) -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      %276 = llvm.mlir.addressof @str29 : !llvm.ptr
      %277 = arith.constant 7 : i64
      %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
      %279 = llvm.mlir.addressof @str30 : !llvm.ptr
      %280 = arith.constant 11 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_intern(%278, %281) : (i64, i64) -> i64
      %283 = func.call @cc_nil_value() : () -> i64
      %284 = func.call @cc_cons(%282, %283) : (i64, i64) -> i64
      %285 = func.call @cc_values_pack(%284) : (i64) -> i64
      func.call @stack_push_pointer(%282) : (i64) -> ()
      %286 = llvm.mlir.addressof @str31 : !llvm.ptr
      %287 = arith.constant 1 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      %289 = func.call @cc_nil_value() : () -> i64
      %290 = func.call @cc_intern(%288, %289) : (i64, i64) -> i64
      %291 = func.call @cc_nil_value() : () -> i64
      %292 = func.call @cc_cons(%290, %291) : (i64, i64) -> i64
      %293 = func.call @cc_values_pack(%292) : (i64) -> i64
      func.call @stack_push_pointer(%290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @cc_cons(%295, %294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %297 = arith.addi %296, %__rlasp_stack_elide_zero_16 : i64
      %298 = func.call @stack_pop_pointer() : () -> i64
      %299 = func.call @cc_cons(%298, %297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %300 = llvm.mlir.addressof @str32 : !llvm.ptr
      %301 = arith.constant 7 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = llvm.mlir.addressof @str33 : !llvm.ptr
      %304 = arith.constant 11 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = func.call @cc_intern(%302, %305) : (i64, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_values_pack(%308) : (i64) -> i64
      func.call @stack_push_pointer(%306) : (i64) -> ()
      %310 = llvm.mlir.addressof @str34 : !llvm.ptr
      %311 = arith.constant 2 : i64
      %312 = func.call @cc_make_string(%310, %311) : (!llvm.ptr, i64) -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_intern(%312, %313) : (i64, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_values_pack(%316) : (i64) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @stack_pop_pointer() : () -> i64
      %320 = func.call @cc_cons(%319, %318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %321 = arith.addi %320, %__rlasp_stack_elide_zero_17 : i64
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @cc_cons(%322, %321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%323) : (i64) -> ()
      %324 = llvm.mlir.addressof @str35 : !llvm.ptr
      %325 = arith.constant 9 : i64
      %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_intern(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_cons(%328, %329) : (i64, i64) -> i64
      %331 = func.call @cc_values_pack(%330) : (i64) -> i64
      func.call @stack_push_pointer(%328) : (i64) -> ()
      %332 = llvm.mlir.addressof @str36 : !llvm.ptr
      %333 = arith.constant 8 : i64
      %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
      %335 = func.call @cc_nil_value() : () -> i64
      %336 = func.call @cc_intern(%334, %335) : (i64, i64) -> i64
      %337 = func.call @cc_nil_value() : () -> i64
      %338 = func.call @cc_cons(%336, %337) : (i64, i64) -> i64
      %339 = func.call @cc_values_pack(%338) : (i64) -> i64
      func.call @stack_push_pointer(%336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @cc_cons(%341, %340) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %343 = arith.addi %342, %__rlasp_stack_elide_zero_18 : i64
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = func.call @cc_cons(%344, %343) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %346 = arith.addi %345, %__rlasp_stack_elide_zero_19 : i64
      %347 = func.call @stack_pop_pointer() : () -> i64
      %348 = func.call @cc_cons(%347, %346) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %349 = arith.addi %348, %__rlasp_stack_elide_zero_20 : i64
      %350 = func.call @stack_pop_pointer() : () -> i64
      %351 = func.call @cc_cons(%350, %349) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %352 = arith.addi %351, %__rlasp_stack_elide_zero_21 : i64
      %353 = func.call @stack_pop_pointer() : () -> i64
      %354 = func.call @cc_cons(%353, %352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%354) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @stack_pop_pointer() : () -> i64
      %357 = func.call @cc_cons(%356, %355) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %358 = arith.addi %357, %__rlasp_stack_elide_zero_22 : i64
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = func.call @cc_cons(%359, %358) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %361 = arith.addi %360, %__rlasp_stack_elide_zero_23 : i64
      %362 = func.call @stack_pop_pointer() : () -> i64
      %363 = func.call @cc_cons(%362, %361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %364 = arith.addi %363, %__rlasp_stack_elide_zero_24 : i64
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @cc_cons(%365, %364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%366) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @cc_cons(%368, %367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %370 = arith.addi %369, %__rlasp_stack_elide_zero_25 : i64
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @cc_cons(%371, %370) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %373 = arith.addi %372, %__rlasp_stack_elide_zero_26 : i64
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @cc_cons(%374, %373) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %376 = arith.addi %375, %__rlasp_stack_elide_zero_27 : i64
      %457 = llvm.mlir.addressof @str38 : !llvm.ptr
      %458 = arith.constant 31 : i64
      %459 = func.call @cc_make_symbol(%457, %458) : (!llvm.ptr, i64) -> i64
      %460 = func.call @cc_persistent_root_value(%459) : (i64) -> i64
      func.call @stack_push_pointer(%460) : (i64) -> ()
      %461 = llvm.mlir.addressof @str39 : !llvm.ptr
      %462 = arith.constant 37 : i64
      %463 = func.call @cc_make_symbol(%461, %462) : (!llvm.ptr, i64) -> i64
      %464 = func.call @cc_persistent_root_value(%463) : (i64) -> i64
      func.call @stack_push_pointer(%464) : (i64) -> ()
      %465 = llvm.mlir.addressof @str40 : !llvm.ptr
      %466 = arith.constant 38 : i64
      %467 = func.call @cc_make_symbol(%465, %466) : (!llvm.ptr, i64) -> i64
      %468 = func.call @cc_persistent_root_value(%467) : (i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %469 = arith.constant 275462358040577 : i64
      %470 = arith.constant 3 : i64
      %471 = func.call @cc_make_closure(%469, %470) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %472 = arith.addi %471, %__rlasp_stack_elide_zero_28 : i64
      %473 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%473) : (i64) -> ()
      %474 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %478 = arith.addi %477, %__rlasp_stack_elide_zero_29 : i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %481 = arith.addi %480, %__rlasp_stack_elide_zero_30 : i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %484 = arith.addi %483, %__rlasp_stack_elide_zero_31 : i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %487 = arith.addi %486, %__rlasp_stack_elide_zero_32 : i64
      %488 = llvm.mlir.addressof @str41 : !llvm.ptr
      %489 = arith.constant 11 : i64
      %490 = func.call @cc_make_string(%488, %489) : (!llvm.ptr, i64) -> i64
      %491 = llvm.mlir.addressof @str42 : !llvm.ptr
      %492 = arith.constant 7 : i64
      %493 = func.call @cc_make_string(%491, %492) : (!llvm.ptr, i64) -> i64
      %494 = func.call @cc_intern(%490, %493) : (i64, i64) -> i64
      %495 = func.call @cc_nil_value() : () -> i64
      %496 = func.call @cc_cons(%494, %495) : (i64, i64) -> i64
      %497 = func.call @cc_values_pack(%496) : (i64) -> i64
      %498 = func.call @cc_nil_value() : () -> i64
      %499 = llvm.mlir.addressof @str43 : !llvm.ptr
      %500 = arith.constant 4 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = llvm.mlir.addressof @str44 : !llvm.ptr
      %503 = arith.constant 7 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = func.call @cc_intern(%501, %504) : (i64, i64) -> i64
      %506 = func.call @cc_nil_value() : () -> i64
      %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
      %508 = func.call @cc_values_pack(%507) : (i64) -> i64
      %509 = llvm.mlir.addressof @str45 : !llvm.ptr
      %510 = arith.constant 6 : i64
      %511 = func.call @cc_make_string(%509, %510) : (!llvm.ptr, i64) -> i64
      %512 = func.call @cc_nil_value() : () -> i64
      %513 = func.call @cc_intern(%511, %512) : (i64, i64) -> i64
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = func.call @cc_cons(%513, %514) : (i64, i64) -> i64
      %516 = func.call @cc_values_pack(%515) : (i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %517 = arith.addi %513, %__rlasp_stack_elide_zero_33 : i64
      %518 = func.call @cc_nil_value() : () -> i64
      %519 = func.call @cc_errorp(%64) : (i64) -> i64
      %520 = arith.cmpi ne, %519, %518 : i64
      %521 = arith.cmpi eq, %518, %518 : i64
      %522 = arith.andi %520, %521 : i1
      %523 = scf.if %522 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %518 : i64
      }
      %524 = func.call @cc_errorp(%376) : (i64) -> i64
      %525 = arith.cmpi ne, %524, %518 : i64
      %526 = arith.cmpi eq, %523, %518 : i64
      %527 = arith.andi %525, %526 : i1
      %528 = scf.if %527 -> (i64) {
        scf.yield %376 : i64
      } else {
        scf.yield %523 : i64
      }
      %529 = func.call @cc_errorp(%472) : (i64) -> i64
      %530 = arith.cmpi ne, %529, %518 : i64
      %531 = arith.cmpi eq, %528, %518 : i64
      %532 = arith.andi %530, %531 : i1
      %533 = scf.if %532 -> (i64) {
        scf.yield %472 : i64
      } else {
        scf.yield %528 : i64
      }
      %534 = func.call @cc_errorp(%487) : (i64) -> i64
      %535 = arith.cmpi ne, %534, %518 : i64
      %536 = arith.cmpi eq, %533, %518 : i64
      %537 = arith.andi %535, %536 : i1
      %538 = scf.if %537 -> (i64) {
        scf.yield %487 : i64
      } else {
        scf.yield %533 : i64
      }
      %539 = func.call @cc_errorp(%494) : (i64) -> i64
      %540 = arith.cmpi ne, %539, %518 : i64
      %541 = arith.cmpi eq, %538, %518 : i64
      %542 = arith.andi %540, %541 : i1
      %543 = scf.if %542 -> (i64) {
        scf.yield %494 : i64
      } else {
        scf.yield %538 : i64
      }
      %544 = func.call @cc_errorp(%498) : (i64) -> i64
      %545 = arith.cmpi ne, %544, %518 : i64
      %546 = arith.cmpi eq, %543, %518 : i64
      %547 = arith.andi %545, %546 : i1
      %548 = scf.if %547 -> (i64) {
        scf.yield %498 : i64
      } else {
        scf.yield %543 : i64
      }
      %549 = func.call @cc_errorp(%505) : (i64) -> i64
      %550 = arith.cmpi ne, %549, %518 : i64
      %551 = arith.cmpi eq, %548, %518 : i64
      %552 = arith.andi %550, %551 : i1
      %553 = scf.if %552 -> (i64) {
        scf.yield %505 : i64
      } else {
        scf.yield %548 : i64
      }
      %554 = func.call @cc_errorp(%517) : (i64) -> i64
      %555 = arith.cmpi ne, %554, %518 : i64
      %556 = arith.cmpi eq, %553, %518 : i64
      %557 = arith.andi %555, %556 : i1
      %558 = scf.if %557 -> (i64) {
        scf.yield %517 : i64
      } else {
        scf.yield %553 : i64
      }
      %559 = arith.cmpi ne, %558, %518 : i64
      scf.if %559 {
        func.call @stack_push_pointer(%558) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%376) : (i64) -> ()
        func.call @stack_push_pointer(%472) : (i64) -> ()
        func.call @stack_push_pointer(%487) : (i64) -> ()
        func.call @stack_push_pointer(%494) : (i64) -> ()
        func.call @stack_push_pointer(%498) : (i64) -> ()
        func.call @stack_push_pointer(%505) : (i64) -> ()
        func.call @stack_push_pointer(%517) : (i64) -> ()
        %560 = llvm.mlir.addressof @str46 : !llvm.ptr
        %561 = func.call @cc_make_function_ref_const(%560) : (!llvm.ptr) -> i64
        %562 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%561, %562) : (i64, i64) -> ()
      }
      %563 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %563 : i64
    }
    %564 = func.call @cc_nil_value() : () -> i64
    %565 = func.call @cc_errorp(%55) : (i64) -> i64
    %566 = arith.cmpi ne, %565, %564 : i64
    %567 = scf.if %566 -> (i64) {
      scf.yield %55 : i64
    } else {
      %568 = llvm.mlir.addressof @str47 : !llvm.ptr
      %569 = arith.constant 13 : i64
      %570 = func.call @cc_make_string(%568, %569) : (!llvm.ptr, i64) -> i64
      %571 = func.call @cc_nil_value() : () -> i64
      %572 = func.call @cc_intern(%570, %571) : (i64, i64) -> i64
      %573 = func.call @cc_nil_value() : () -> i64
      %574 = func.call @cc_cons(%572, %573) : (i64, i64) -> i64
      %575 = func.call @cc_values_pack(%574) : (i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %576 = arith.addi %572, %__rlasp_stack_elide_zero_34 : i64
      %577 = llvm.mlir.addressof @str48 : !llvm.ptr
      %578 = arith.constant 19 : i64
      %579 = func.call @cc_make_string(%577, %578) : (!llvm.ptr, i64) -> i64
      %580 = llvm.mlir.addressof @str49 : !llvm.ptr
      %581 = arith.constant 11 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = func.call @cc_intern(%579, %582) : (i64, i64) -> i64
      %584 = func.call @cc_nil_value() : () -> i64
      %585 = func.call @cc_cons(%583, %584) : (i64, i64) -> i64
      %586 = func.call @cc_values_pack(%585) : (i64) -> i64
      func.call @stack_push_pointer(%583) : (i64) -> ()
      %587 = llvm.mlir.addressof @str50 : !llvm.ptr
      %588 = arith.constant 4 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = llvm.mlir.addressof @str51 : !llvm.ptr
      %591 = arith.constant 11 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = func.call @cc_intern(%589, %592) : (i64, i64) -> i64
      %594 = func.call @cc_nil_value() : () -> i64
      %595 = func.call @cc_cons(%593, %594) : (i64, i64) -> i64
      %596 = func.call @cc_values_pack(%595) : (i64) -> i64
      func.call @stack_push_pointer(%593) : (i64) -> ()
      %597 = llvm.mlir.addressof @str52 : !llvm.ptr
      %598 = arith.constant 5 : i64
      %599 = func.call @cc_make_string(%597, %598) : (!llvm.ptr, i64) -> i64
      %600 = llvm.mlir.addressof @str53 : !llvm.ptr
      %601 = arith.constant 11 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = func.call @cc_intern(%599, %602) : (i64, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_cons(%603, %604) : (i64, i64) -> i64
      %606 = func.call @cc_values_pack(%605) : (i64) -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @stack_pop_pointer() : () -> i64
      %609 = func.call @cc_cons(%608, %607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %610 = arith.addi %609, %__rlasp_stack_elide_zero_35 : i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = llvm.mlir.addressof @str54 : !llvm.ptr
      %614 = arith.constant 7 : i64
      %615 = func.call @cc_make_string(%613, %614) : (!llvm.ptr, i64) -> i64
      %616 = llvm.mlir.addressof @str55 : !llvm.ptr
      %617 = arith.constant 11 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = func.call @cc_intern(%615, %618) : (i64, i64) -> i64
      %620 = func.call @cc_nil_value() : () -> i64
      %621 = func.call @cc_cons(%619, %620) : (i64, i64) -> i64
      %622 = func.call @cc_values_pack(%621) : (i64) -> i64
      func.call @stack_push_pointer(%619) : (i64) -> ()
      %623 = llvm.mlir.addressof @str56 : !llvm.ptr
      %624 = arith.constant 11 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = llvm.mlir.addressof @str57 : !llvm.ptr
      %627 = arith.constant 3 : i64
      %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
      %629 = func.call @cc_intern(%625, %628) : (i64, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_values_pack(%631) : (i64) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      %633 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
      %634 = llvm.mlir.addressof @str58 : !llvm.ptr
      %635 = arith.constant 6 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = llvm.mlir.addressof @str59 : !llvm.ptr
      %638 = arith.constant 11 : i64
      %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
      %640 = func.call @cc_intern(%636, %639) : (i64, i64) -> i64
      %641 = func.call @cc_nil_value() : () -> i64
      %642 = func.call @cc_cons(%640, %641) : (i64, i64) -> i64
      %643 = func.call @cc_values_pack(%642) : (i64) -> i64
      func.call @stack_push_pointer(%640) : (i64) -> ()
      %644 = llvm.mlir.addressof @str60 : !llvm.ptr
      %645 = arith.constant 1 : i64
      %646 = func.call @cc_make_string(%644, %645) : (!llvm.ptr, i64) -> i64
      %647 = func.call @cc_nil_value() : () -> i64
      %648 = func.call @cc_intern(%646, %647) : (i64, i64) -> i64
      %649 = func.call @cc_nil_value() : () -> i64
      %650 = func.call @cc_cons(%648, %649) : (i64, i64) -> i64
      %651 = func.call @cc_values_pack(%650) : (i64) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %652 = func.call @stack_pop_pointer() : () -> i64
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = func.call @cc_cons(%653, %652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      %655 = llvm.mlir.addressof @str61 : !llvm.ptr
      %656 = arith.constant 6 : i64
      %657 = func.call @cc_make_string(%655, %656) : (!llvm.ptr, i64) -> i64
      %658 = llvm.mlir.addressof @str62 : !llvm.ptr
      %659 = arith.constant 11 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = func.call @cc_intern(%657, %660) : (i64, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_values_pack(%663) : (i64) -> i64
      func.call @stack_push_pointer(%661) : (i64) -> ()
      %665 = llvm.mlir.addressof @str63 : !llvm.ptr
      %666 = arith.constant 6 : i64
      %667 = func.call @cc_make_string(%665, %666) : (!llvm.ptr, i64) -> i64
      %668 = llvm.mlir.addressof @str64 : !llvm.ptr
      %669 = arith.constant 11 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = func.call @cc_intern(%667, %670) : (i64, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %675 = llvm.mlir.addressof @str65 : !llvm.ptr
      %676 = arith.constant 1 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_intern(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @stack_pop_pointer() : () -> i64
      %685 = func.call @cc_cons(%684, %683) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %686 = arith.addi %685, %__rlasp_stack_elide_zero_36 : i64
      %687 = func.call @stack_pop_pointer() : () -> i64
      %688 = func.call @cc_cons(%687, %686) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %689 = arith.addi %688, %__rlasp_stack_elide_zero_37 : i64
      %690 = func.call @stack_pop_pointer() : () -> i64
      %691 = func.call @cc_cons(%690, %689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%691) : (i64) -> ()
      %692 = llvm.mlir.addressof @str66 : !llvm.ptr
      %693 = arith.constant 6 : i64
      %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
      %695 = llvm.mlir.addressof @str67 : !llvm.ptr
      %696 = arith.constant 11 : i64
      %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
      %698 = func.call @cc_intern(%694, %697) : (i64, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_values_pack(%700) : (i64) -> i64
      func.call @stack_push_pointer(%698) : (i64) -> ()
      %702 = llvm.mlir.addressof @str68 : !llvm.ptr
      %703 = arith.constant 1 : i64
      %704 = func.call @cc_make_string(%702, %703) : (!llvm.ptr, i64) -> i64
      %705 = func.call @cc_nil_value() : () -> i64
      %706 = func.call @cc_intern(%704, %705) : (i64, i64) -> i64
      %707 = func.call @cc_nil_value() : () -> i64
      %708 = func.call @cc_cons(%706, %707) : (i64, i64) -> i64
      %709 = func.call @cc_values_pack(%708) : (i64) -> i64
      func.call @stack_push_pointer(%706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = llvm.mlir.addressof @str69 : !llvm.ptr
      %714 = arith.constant 4 : i64
      %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
      %716 = llvm.mlir.addressof @str70 : !llvm.ptr
      %717 = arith.constant 11 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_intern(%715, %718) : (i64, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_values_pack(%721) : (i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      %723 = llvm.mlir.addressof @str71 : !llvm.ptr
      %724 = arith.constant 1 : i64
      %725 = func.call @cc_make_string(%723, %724) : (!llvm.ptr, i64) -> i64
      %726 = func.call @cc_nil_value() : () -> i64
      %727 = func.call @cc_intern(%725, %726) : (i64, i64) -> i64
      %728 = func.call @cc_nil_value() : () -> i64
      %729 = func.call @cc_cons(%727, %728) : (i64, i64) -> i64
      %730 = func.call @cc_values_pack(%729) : (i64) -> i64
      func.call @stack_push_pointer(%727) : (i64) -> ()
      %731 = llvm.mlir.addressof @str72 : !llvm.ptr
      %732 = arith.constant 1 : i64
      %733 = func.call @cc_make_string(%731, %732) : (!llvm.ptr, i64) -> i64
      %734 = func.call @cc_nil_value() : () -> i64
      %735 = func.call @cc_intern(%733, %734) : (i64, i64) -> i64
      %736 = func.call @cc_nil_value() : () -> i64
      %737 = func.call @cc_cons(%735, %736) : (i64, i64) -> i64
      %738 = func.call @cc_values_pack(%737) : (i64) -> i64
      func.call @stack_push_pointer(%735) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @cc_cons(%740, %739) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %742 = arith.addi %741, %__rlasp_stack_elide_zero_38 : i64
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @cc_cons(%743, %742) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %745 = arith.addi %744, %__rlasp_stack_elide_zero_39 : i64
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @cc_cons(%746, %745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %751 = arith.addi %750, %__rlasp_stack_elide_zero_40 : i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %754 = arith.addi %753, %__rlasp_stack_elide_zero_41 : i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @cc_cons(%758, %757) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %760 = arith.addi %759, %__rlasp_stack_elide_zero_42 : i64
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_cons(%761, %760) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %763 = arith.addi %762, %__rlasp_stack_elide_zero_43 : i64
      %764 = func.call @stack_pop_pointer() : () -> i64
      %765 = func.call @cc_cons(%764, %763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @cc_cons(%767, %766) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %769 = arith.addi %768, %__rlasp_stack_elide_zero_44 : i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%770, %769) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %772 = arith.addi %771, %__rlasp_stack_elide_zero_45 : i64
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_cons(%773, %772) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %775 = arith.addi %774, %__rlasp_stack_elide_zero_46 : i64
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @cc_cons(%775, %776) : (i64, i64) -> i64
      %778 = llvm.mlir.addressof @str73 : !llvm.ptr
      %779 = arith.constant 5 : i64
      %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_intern(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_cons(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_values_pack(%784) : (i64) -> i64
      %786 = func.call @cc_cons(%782, %777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %790 = arith.addi %789, %__rlasp_stack_elide_zero_47 : i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %793 = arith.constant 237 : i64
      func.call @stack_push_fixnum(%793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @stack_pop_pointer() : () -> i64
      %796 = func.call @cc_cons(%795, %794) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %797 = arith.addi %796, %__rlasp_stack_elide_zero_48 : i64
      %798 = func.call @stack_pop_pointer() : () -> i64
      %799 = func.call @cc_cons(%798, %797) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %800 = arith.addi %799, %__rlasp_stack_elide_zero_49 : i64
      %801 = func.call @stack_pop_pointer() : () -> i64
      %802 = func.call @cc_cons(%801, %800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%802) : (i64) -> ()
      %803 = llvm.mlir.addressof @str74 : !llvm.ptr
      %804 = arith.constant 19 : i64
      %805 = func.call @cc_make_string(%803, %804) : (!llvm.ptr, i64) -> i64
      %806 = llvm.mlir.addressof @str75 : !llvm.ptr
      %807 = arith.constant 11 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = func.call @cc_intern(%805, %808) : (i64, i64) -> i64
      %810 = func.call @cc_nil_value() : () -> i64
      %811 = func.call @cc_cons(%809, %810) : (i64, i64) -> i64
      %812 = func.call @cc_values_pack(%811) : (i64) -> i64
      func.call @stack_push_pointer(%809) : (i64) -> ()
      %813 = llvm.mlir.addressof @str76 : !llvm.ptr
      %814 = arith.constant 5 : i64
      %815 = func.call @cc_make_string(%813, %814) : (!llvm.ptr, i64) -> i64
      %816 = func.call @cc_nil_value() : () -> i64
      %817 = func.call @cc_intern(%815, %816) : (i64, i64) -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_cons(%817, %818) : (i64, i64) -> i64
      %820 = func.call @cc_values_pack(%819) : (i64) -> i64
      func.call @stack_push_pointer(%817) : (i64) -> ()
      %821 = llvm.mlir.addressof @str77 : !llvm.ptr
      %822 = arith.constant 9 : i64
      %823 = func.call @cc_make_string(%821, %822) : (!llvm.ptr, i64) -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_intern(%823, %824) : (i64, i64) -> i64
      %826 = func.call @cc_nil_value() : () -> i64
      %827 = func.call @cc_cons(%825, %826) : (i64, i64) -> i64
      %828 = func.call @cc_values_pack(%827) : (i64) -> i64
      func.call @stack_push_pointer(%825) : (i64) -> ()
      %829 = llvm.mlir.addressof @str78 : !llvm.ptr
      %830 = arith.constant 8 : i64
      %831 = func.call @cc_make_string(%829, %830) : (!llvm.ptr, i64) -> i64
      %832 = func.call @cc_nil_value() : () -> i64
      %833 = func.call @cc_intern(%831, %832) : (i64, i64) -> i64
      %834 = func.call @cc_nil_value() : () -> i64
      %835 = func.call @cc_cons(%833, %834) : (i64, i64) -> i64
      %836 = func.call @cc_values_pack(%835) : (i64) -> i64
      func.call @stack_push_pointer(%833) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @cc_cons(%838, %837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %840 = arith.addi %839, %__rlasp_stack_elide_zero_50 : i64
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @cc_cons(%841, %840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %843 = arith.addi %842, %__rlasp_stack_elide_zero_51 : i64
      %844 = func.call @stack_pop_pointer() : () -> i64
      %845 = func.call @cc_cons(%844, %843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      %846 = llvm.mlir.addressof @str79 : !llvm.ptr
      %847 = arith.constant 7 : i64
      %848 = func.call @cc_make_string(%846, %847) : (!llvm.ptr, i64) -> i64
      %849 = llvm.mlir.addressof @str80 : !llvm.ptr
      %850 = arith.constant 11 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = func.call @cc_intern(%848, %851) : (i64, i64) -> i64
      %853 = func.call @cc_nil_value() : () -> i64
      %854 = func.call @cc_cons(%852, %853) : (i64, i64) -> i64
      %855 = func.call @cc_values_pack(%854) : (i64) -> i64
      func.call @stack_push_pointer(%852) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %856 = llvm.mlir.addressof @str81 : !llvm.ptr
      %857 = arith.constant 4 : i64
      %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
      %859 = llvm.mlir.addressof @str82 : !llvm.ptr
      %860 = arith.constant 11 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = func.call @cc_intern(%858, %861) : (i64, i64) -> i64
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = func.call @cc_cons(%862, %863) : (i64, i64) -> i64
      %865 = func.call @cc_values_pack(%864) : (i64) -> i64
      func.call @stack_push_pointer(%862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = func.call @stack_pop_pointer() : () -> i64
      %868 = func.call @cc_cons(%867, %866) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %869 = arith.addi %868, %__rlasp_stack_elide_zero_52 : i64
      %870 = func.call @stack_pop_pointer() : () -> i64
      %871 = func.call @cc_cons(%870, %869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %872 = arith.addi %871, %__rlasp_stack_elide_zero_53 : i64
      %873 = func.call @stack_pop_pointer() : () -> i64
      %874 = func.call @cc_cons(%873, %872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %875 = llvm.mlir.addressof @str83 : !llvm.ptr
      %876 = arith.constant 19 : i64
      %877 = func.call @cc_make_string(%875, %876) : (!llvm.ptr, i64) -> i64
      %878 = llvm.mlir.addressof @str84 : !llvm.ptr
      %879 = arith.constant 11 : i64
      %880 = func.call @cc_make_string(%878, %879) : (!llvm.ptr, i64) -> i64
      %881 = func.call @cc_intern(%877, %880) : (i64, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_cons(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_values_pack(%883) : (i64) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      %885 = llvm.mlir.addressof @str85 : !llvm.ptr
      %886 = arith.constant 6 : i64
      %887 = func.call @cc_make_string(%885, %886) : (!llvm.ptr, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_intern(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_nil_value() : () -> i64
      %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
      %892 = func.call @cc_values_pack(%891) : (i64) -> i64
      func.call @stack_push_pointer(%889) : (i64) -> ()
      %893 = llvm.mlir.addressof @str86 : !llvm.ptr
      %894 = arith.constant 9 : i64
      %895 = func.call @cc_make_string(%893, %894) : (!llvm.ptr, i64) -> i64
      %896 = func.call @cc_nil_value() : () -> i64
      %897 = func.call @cc_intern(%895, %896) : (i64, i64) -> i64
      %898 = func.call @cc_nil_value() : () -> i64
      %899 = func.call @cc_cons(%897, %898) : (i64, i64) -> i64
      %900 = func.call @cc_values_pack(%899) : (i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      %901 = llvm.mlir.addressof @str87 : !llvm.ptr
      %902 = arith.constant 8 : i64
      %903 = func.call @cc_make_string(%901, %902) : (!llvm.ptr, i64) -> i64
      %904 = func.call @cc_nil_value() : () -> i64
      %905 = func.call @cc_intern(%903, %904) : (i64, i64) -> i64
      %906 = func.call @cc_nil_value() : () -> i64
      %907 = func.call @cc_cons(%905, %906) : (i64, i64) -> i64
      %908 = func.call @cc_values_pack(%907) : (i64) -> i64
      func.call @stack_push_pointer(%905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %909 = func.call @stack_pop_pointer() : () -> i64
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @cc_cons(%910, %909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %912 = arith.addi %911, %__rlasp_stack_elide_zero_54 : i64
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @cc_cons(%913, %912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %915 = arith.addi %914, %__rlasp_stack_elide_zero_55 : i64
      %916 = func.call @stack_pop_pointer() : () -> i64
      %917 = func.call @cc_cons(%916, %915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%917) : (i64) -> ()
      %918 = llvm.mlir.addressof @str88 : !llvm.ptr
      %919 = arith.constant 7 : i64
      %920 = func.call @cc_make_string(%918, %919) : (!llvm.ptr, i64) -> i64
      %921 = llvm.mlir.addressof @str89 : !llvm.ptr
      %922 = arith.constant 11 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = func.call @cc_intern(%920, %923) : (i64, i64) -> i64
      %925 = func.call @cc_nil_value() : () -> i64
      %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
      %927 = func.call @cc_values_pack(%926) : (i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %928 = llvm.mlir.addressof @str90 : !llvm.ptr
      %929 = arith.constant 5 : i64
      %930 = func.call @cc_make_string(%928, %929) : (!llvm.ptr, i64) -> i64
      %931 = llvm.mlir.addressof @str91 : !llvm.ptr
      %932 = arith.constant 11 : i64
      %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
      %934 = func.call @cc_intern(%930, %933) : (i64, i64) -> i64
      %935 = func.call @cc_nil_value() : () -> i64
      %936 = func.call @cc_cons(%934, %935) : (i64, i64) -> i64
      %937 = func.call @cc_values_pack(%936) : (i64) -> i64
      func.call @stack_push_pointer(%934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @stack_pop_pointer() : () -> i64
      %940 = func.call @cc_cons(%939, %938) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %941 = arith.addi %940, %__rlasp_stack_elide_zero_56 : i64
      %942 = func.call @stack_pop_pointer() : () -> i64
      %943 = func.call @cc_cons(%942, %941) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %944 = arith.addi %943, %__rlasp_stack_elide_zero_57 : i64
      %945 = func.call @stack_pop_pointer() : () -> i64
      %946 = func.call @cc_cons(%945, %944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%946) : (i64) -> ()
      %947 = llvm.mlir.addressof @str92 : !llvm.ptr
      %948 = arith.constant 6 : i64
      %949 = func.call @cc_make_string(%947, %948) : (!llvm.ptr, i64) -> i64
      %950 = llvm.mlir.addressof @str93 : !llvm.ptr
      %951 = arith.constant 11 : i64
      %952 = func.call @cc_make_string(%950, %951) : (!llvm.ptr, i64) -> i64
      %953 = func.call @cc_intern(%949, %952) : (i64, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_cons(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_values_pack(%955) : (i64) -> i64
      func.call @stack_push_pointer(%953) : (i64) -> ()
      %957 = llvm.mlir.addressof @str94 : !llvm.ptr
      %958 = arith.constant 7 : i64
      %959 = func.call @cc_make_string(%957, %958) : (!llvm.ptr, i64) -> i64
      %960 = llvm.mlir.addressof @str95 : !llvm.ptr
      %961 = arith.constant 11 : i64
      %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
      %963 = func.call @cc_intern(%959, %962) : (i64, i64) -> i64
      %964 = func.call @cc_nil_value() : () -> i64
      %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
      %966 = func.call @cc_values_pack(%965) : (i64) -> i64
      func.call @stack_push_pointer(%963) : (i64) -> ()
      %967 = llvm.mlir.addressof @str96 : !llvm.ptr
      %968 = arith.constant 4 : i64
      %969 = func.call @cc_make_string(%967, %968) : (!llvm.ptr, i64) -> i64
      %970 = llvm.mlir.addressof @str97 : !llvm.ptr
      %971 = arith.constant 11 : i64
      %972 = func.call @cc_make_string(%970, %971) : (!llvm.ptr, i64) -> i64
      %973 = func.call @cc_intern(%969, %972) : (i64, i64) -> i64
      %974 = func.call @cc_nil_value() : () -> i64
      %975 = func.call @cc_cons(%973, %974) : (i64, i64) -> i64
      %976 = func.call @cc_values_pack(%975) : (i64) -> i64
      func.call @stack_push_pointer(%973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %977 = func.call @stack_pop_pointer() : () -> i64
      %978 = func.call @stack_pop_pointer() : () -> i64
      %979 = func.call @cc_cons(%978, %977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %980 = arith.addi %979, %__rlasp_stack_elide_zero_58 : i64
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @cc_cons(%981, %980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %983 = llvm.mlir.addressof @str98 : !llvm.ptr
      %984 = arith.constant 7 : i64
      %985 = func.call @cc_make_string(%983, %984) : (!llvm.ptr, i64) -> i64
      %986 = llvm.mlir.addressof @str99 : !llvm.ptr
      %987 = arith.constant 11 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = func.call @cc_intern(%985, %988) : (i64, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_cons(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_values_pack(%991) : (i64) -> i64
      func.call @stack_push_pointer(%989) : (i64) -> ()
      %993 = llvm.mlir.addressof @str100 : !llvm.ptr
      %994 = arith.constant 5 : i64
      %995 = func.call @cc_make_string(%993, %994) : (!llvm.ptr, i64) -> i64
      %996 = llvm.mlir.addressof @str101 : !llvm.ptr
      %997 = arith.constant 11 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = func.call @cc_intern(%995, %998) : (i64, i64) -> i64
      %1000 = func.call @cc_nil_value() : () -> i64
      %1001 = func.call @cc_cons(%999, %1000) : (i64, i64) -> i64
      %1002 = func.call @cc_values_pack(%1001) : (i64) -> i64
      func.call @stack_push_pointer(%999) : (i64) -> ()
      %1003 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @cc_cons(%1005, %1004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1007 = arith.addi %1006, %__rlasp_stack_elide_zero_59 : i64
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_cons(%1008, %1007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1010 = arith.addi %1009, %__rlasp_stack_elide_zero_60 : i64
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @cc_cons(%1011, %1010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1012) : (i64) -> ()
      %1013 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1014 = arith.constant 7 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1017 = arith.constant 11 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = func.call @cc_intern(%1015, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      func.call @stack_push_pointer(%1019) : (i64) -> ()
      %1023 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1024 = arith.constant 5 : i64
      %1025 = func.call @cc_make_string(%1023, %1024) : (!llvm.ptr, i64) -> i64
      %1026 = func.call @cc_nil_value() : () -> i64
      %1027 = func.call @cc_intern(%1025, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_nil_value() : () -> i64
      %1029 = func.call @cc_cons(%1027, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_values_pack(%1029) : (i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_cons(%1032, %1031) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1034 = arith.addi %1033, %__rlasp_stack_elide_zero_61 : i64
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @cc_cons(%1035, %1034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      %1037 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1038 = arith.constant 7 : i64
      %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
      %1040 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1041 = arith.constant 11 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = func.call @cc_intern(%1039, %1042) : (i64, i64) -> i64
      %1044 = func.call @cc_nil_value() : () -> i64
      %1045 = func.call @cc_cons(%1043, %1044) : (i64, i64) -> i64
      %1046 = func.call @cc_values_pack(%1045) : (i64) -> i64
      func.call @stack_push_pointer(%1043) : (i64) -> ()
      %1047 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1048 = arith.constant 6 : i64
      %1049 = func.call @cc_make_string(%1047, %1048) : (!llvm.ptr, i64) -> i64
      %1050 = func.call @cc_nil_value() : () -> i64
      %1051 = func.call @cc_intern(%1049, %1050) : (i64, i64) -> i64
      %1052 = func.call @cc_nil_value() : () -> i64
      %1053 = func.call @cc_cons(%1051, %1052) : (i64, i64) -> i64
      %1054 = func.call @cc_values_pack(%1053) : (i64) -> i64
      func.call @stack_push_pointer(%1051) : (i64) -> ()
      %1055 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1055) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1057, %1056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1059 = arith.addi %1058, %__rlasp_stack_elide_zero_62 : i64
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @cc_cons(%1060, %1059) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1062 = arith.addi %1061, %__rlasp_stack_elide_zero_63 : i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1065 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1066 = arith.constant 7 : i64
      %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
      %1068 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1069 = arith.constant 11 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = func.call @cc_intern(%1067, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_nil_value() : () -> i64
      %1073 = func.call @cc_cons(%1071, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_values_pack(%1073) : (i64) -> i64
      func.call @stack_push_pointer(%1071) : (i64) -> ()
      %1075 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1076 = arith.constant 4 : i64
      %1077 = func.call @cc_make_string(%1075, %1076) : (!llvm.ptr, i64) -> i64
      %1078 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1079 = arith.constant 11 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = func.call @cc_intern(%1077, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_cons(%1081, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_values_pack(%1083) : (i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = func.call @cc_cons(%1086, %1085) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1088 = arith.addi %1087, %__rlasp_stack_elide_zero_64 : i64
      %1089 = func.call @stack_pop_pointer() : () -> i64
      %1090 = func.call @cc_cons(%1089, %1088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1090) : (i64) -> ()
      %1091 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1092 = arith.constant 9 : i64
      %1093 = func.call @cc_make_string(%1091, %1092) : (!llvm.ptr, i64) -> i64
      %1094 = func.call @cc_nil_value() : () -> i64
      %1095 = func.call @cc_intern(%1093, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_cons(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_values_pack(%1097) : (i64) -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      %1099 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1100 = arith.constant 8 : i64
      %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = func.call @cc_nil_value() : () -> i64
      %1103 = func.call @cc_intern(%1101, %1102) : (i64, i64) -> i64
      %1104 = func.call @cc_nil_value() : () -> i64
      %1105 = func.call @cc_cons(%1103, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_values_pack(%1105) : (i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1107 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1108 = arith.constant 9 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      %1110 = func.call @cc_nil_value() : () -> i64
      %1111 = func.call @cc_intern(%1109, %1110) : (i64, i64) -> i64
      %1112 = func.call @cc_nil_value() : () -> i64
      %1113 = func.call @cc_cons(%1111, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_values_pack(%1113) : (i64) -> i64
      func.call @stack_push_pointer(%1111) : (i64) -> ()
      %1115 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1116 = arith.constant 8 : i64
      %1117 = func.call @cc_make_string(%1115, %1116) : (!llvm.ptr, i64) -> i64
      %1118 = func.call @cc_nil_value() : () -> i64
      %1119 = func.call @cc_intern(%1117, %1118) : (i64, i64) -> i64
      %1120 = func.call @cc_nil_value() : () -> i64
      %1121 = func.call @cc_cons(%1119, %1120) : (i64, i64) -> i64
      %1122 = func.call @cc_values_pack(%1121) : (i64) -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1123 = func.call @stack_pop_pointer() : () -> i64
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @cc_cons(%1124, %1123) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1126 = arith.addi %1125, %__rlasp_stack_elide_zero_65 : i64
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_cons(%1127, %1126) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1129 = arith.addi %1128, %__rlasp_stack_elide_zero_66 : i64
      %1130 = func.call @stack_pop_pointer() : () -> i64
      %1131 = func.call @cc_cons(%1130, %1129) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1132 = arith.addi %1131, %__rlasp_stack_elide_zero_67 : i64
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @cc_cons(%1133, %1132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1135 = arith.addi %1134, %__rlasp_stack_elide_zero_68 : i64
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @cc_cons(%1136, %1135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1138 = arith.addi %1137, %__rlasp_stack_elide_zero_69 : i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1141 = arith.addi %1140, %__rlasp_stack_elide_zero_70 : i64
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @cc_cons(%1142, %1141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1144 = arith.addi %1143, %__rlasp_stack_elide_zero_71 : i64
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @cc_cons(%1145, %1144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1147 = arith.addi %1146, %__rlasp_stack_elide_zero_72 : i64
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @cc_cons(%1148, %1147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1150 = arith.addi %1149, %__rlasp_stack_elide_zero_73 : i64
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @cc_cons(%1151, %1150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1154, %1153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1156 = arith.addi %1155, %__rlasp_stack_elide_zero_74 : i64
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @cc_cons(%1157, %1156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1159 = arith.addi %1158, %__rlasp_stack_elide_zero_75 : i64
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @cc_cons(%1160, %1159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1162 = arith.addi %1161, %__rlasp_stack_elide_zero_76 : i64
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @cc_cons(%1163, %1162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1165 = func.call @stack_pop_pointer() : () -> i64
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @cc_cons(%1166, %1165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1168 = arith.addi %1167, %__rlasp_stack_elide_zero_77 : i64
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @cc_cons(%1169, %1168) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1171 = arith.addi %1170, %__rlasp_stack_elide_zero_78 : i64
      %1172 = func.call @stack_pop_pointer() : () -> i64
      %1173 = func.call @cc_cons(%1172, %1171) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1174 = arith.addi %1173, %__rlasp_stack_elide_zero_79 : i64
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @cc_cons(%1175, %1174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1176) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1177 = func.call @stack_pop_pointer() : () -> i64
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @cc_cons(%1178, %1177) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1180 = arith.addi %1179, %__rlasp_stack_elide_zero_80 : i64
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_cons(%1181, %1180) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1183 = arith.addi %1182, %__rlasp_stack_elide_zero_81 : i64
      %1184 = func.call @stack_pop_pointer() : () -> i64
      %1185 = func.call @cc_cons(%1184, %1183) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1186 = arith.addi %1185, %__rlasp_stack_elide_zero_82 : i64
      %1187 = func.call @stack_pop_pointer() : () -> i64
      %1188 = func.call @cc_cons(%1187, %1186) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1189 = arith.addi %1188, %__rlasp_stack_elide_zero_83 : i64
      %1334 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1335 = arith.constant 34 : i64
      %1336 = func.call @cc_make_symbol(%1334, %1335) : (!llvm.ptr, i64) -> i64
      %1337 = func.call @cc_persistent_root_value(%1336) : (i64) -> i64
      func.call @stack_push_pointer(%1337) : (i64) -> ()
      %1338 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1339 = arith.constant 35 : i64
      %1340 = func.call @cc_make_symbol(%1338, %1339) : (!llvm.ptr, i64) -> i64
      %1341 = func.call @cc_persistent_root_value(%1340) : (i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      %1342 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1343 = arith.constant 37 : i64
      %1344 = func.call @cc_make_symbol(%1342, %1343) : (!llvm.ptr, i64) -> i64
      %1345 = func.call @cc_persistent_root_value(%1344) : (i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1346 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1347 = arith.constant 38 : i64
      %1348 = func.call @cc_make_symbol(%1346, %1347) : (!llvm.ptr, i64) -> i64
      %1349 = func.call @cc_persistent_root_value(%1348) : (i64) -> i64
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      %1350 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1351 = arith.constant 37 : i64
      %1352 = func.call @cc_make_symbol(%1350, %1351) : (!llvm.ptr, i64) -> i64
      %1353 = func.call @cc_persistent_root_value(%1352) : (i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1354 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1355 = arith.constant 38 : i64
      %1356 = func.call @cc_make_symbol(%1354, %1355) : (!llvm.ptr, i64) -> i64
      %1357 = func.call @cc_persistent_root_value(%1356) : (i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1358 = arith.constant 275462358040584 : i64
      %1359 = arith.constant 6 : i64
      %1360 = func.call @cc_make_closure(%1358, %1359) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1361 = arith.addi %1360, %__rlasp_stack_elide_zero_84 : i64
      %1362 = arith.constant 237 : i64
      func.call @stack_push_fixnum(%1362) : (i64) -> ()
      %1363 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1363) : (i64) -> ()
      %1364 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1364) : (i64) -> ()
      %1365 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1365) : (i64) -> ()
      %1366 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1366) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @stack_pop_pointer() : () -> i64
      %1369 = func.call @cc_cons(%1368, %1367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1370 = arith.addi %1369, %__rlasp_stack_elide_zero_85 : i64
      %1371 = func.call @stack_pop_pointer() : () -> i64
      %1372 = func.call @cc_cons(%1371, %1370) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1373 = arith.addi %1372, %__rlasp_stack_elide_zero_86 : i64
      %1374 = func.call @stack_pop_pointer() : () -> i64
      %1375 = func.call @cc_cons(%1374, %1373) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1376 = arith.addi %1375, %__rlasp_stack_elide_zero_87 : i64
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @cc_cons(%1377, %1376) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1379 = arith.addi %1378, %__rlasp_stack_elide_zero_88 : i64
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @cc_cons(%1380, %1379) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1382 = arith.addi %1381, %__rlasp_stack_elide_zero_89 : i64
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @cc_cons(%1383, %1382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1385 = arith.addi %1384, %__rlasp_stack_elide_zero_90 : i64
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @cc_cons(%1386, %1385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1388 = arith.addi %1387, %__rlasp_stack_elide_zero_91 : i64
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @cc_cons(%1389, %1388) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1391 = arith.addi %1390, %__rlasp_stack_elide_zero_92 : i64
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @cc_cons(%1392, %1391) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1394 = arith.addi %1393, %__rlasp_stack_elide_zero_93 : i64
      %1395 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1396 = arith.constant 11 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1399 = arith.constant 7 : i64
      %1400 = func.call @cc_make_string(%1398, %1399) : (!llvm.ptr, i64) -> i64
      %1401 = func.call @cc_intern(%1397, %1400) : (i64, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_cons(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_values_pack(%1403) : (i64) -> i64
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1407 = arith.constant 4 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1410 = arith.constant 7 : i64
      %1411 = func.call @cc_make_string(%1409, %1410) : (!llvm.ptr, i64) -> i64
      %1412 = func.call @cc_intern(%1408, %1411) : (i64, i64) -> i64
      %1413 = func.call @cc_nil_value() : () -> i64
      %1414 = func.call @cc_cons(%1412, %1413) : (i64, i64) -> i64
      %1415 = func.call @cc_values_pack(%1414) : (i64) -> i64
      %1416 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1417 = arith.constant 6 : i64
      %1418 = func.call @cc_make_string(%1416, %1417) : (!llvm.ptr, i64) -> i64
      %1419 = func.call @cc_nil_value() : () -> i64
      %1420 = func.call @cc_intern(%1418, %1419) : (i64, i64) -> i64
      %1421 = func.call @cc_nil_value() : () -> i64
      %1422 = func.call @cc_cons(%1420, %1421) : (i64, i64) -> i64
      %1423 = func.call @cc_values_pack(%1422) : (i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1424 = arith.addi %1420, %__rlasp_stack_elide_zero_94 : i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_errorp(%576) : (i64) -> i64
      %1427 = arith.cmpi ne, %1426, %1425 : i64
      %1428 = arith.cmpi eq, %1425, %1425 : i64
      %1429 = arith.andi %1427, %1428 : i1
      %1430 = scf.if %1429 -> (i64) {
        scf.yield %576 : i64
      } else {
        scf.yield %1425 : i64
      }
      %1431 = func.call @cc_errorp(%1189) : (i64) -> i64
      %1432 = arith.cmpi ne, %1431, %1425 : i64
      %1433 = arith.cmpi eq, %1430, %1425 : i64
      %1434 = arith.andi %1432, %1433 : i1
      %1435 = scf.if %1434 -> (i64) {
        scf.yield %1189 : i64
      } else {
        scf.yield %1430 : i64
      }
      %1436 = func.call @cc_errorp(%1361) : (i64) -> i64
      %1437 = arith.cmpi ne, %1436, %1425 : i64
      %1438 = arith.cmpi eq, %1435, %1425 : i64
      %1439 = arith.andi %1437, %1438 : i1
      %1440 = scf.if %1439 -> (i64) {
        scf.yield %1361 : i64
      } else {
        scf.yield %1435 : i64
      }
      %1441 = func.call @cc_errorp(%1394) : (i64) -> i64
      %1442 = arith.cmpi ne, %1441, %1425 : i64
      %1443 = arith.cmpi eq, %1440, %1425 : i64
      %1444 = arith.andi %1442, %1443 : i1
      %1445 = scf.if %1444 -> (i64) {
        scf.yield %1394 : i64
      } else {
        scf.yield %1440 : i64
      }
      %1446 = func.call @cc_errorp(%1401) : (i64) -> i64
      %1447 = arith.cmpi ne, %1446, %1425 : i64
      %1448 = arith.cmpi eq, %1445, %1425 : i64
      %1449 = arith.andi %1447, %1448 : i1
      %1450 = scf.if %1449 -> (i64) {
        scf.yield %1401 : i64
      } else {
        scf.yield %1445 : i64
      }
      %1451 = func.call @cc_errorp(%1405) : (i64) -> i64
      %1452 = arith.cmpi ne, %1451, %1425 : i64
      %1453 = arith.cmpi eq, %1450, %1425 : i64
      %1454 = arith.andi %1452, %1453 : i1
      %1455 = scf.if %1454 -> (i64) {
        scf.yield %1405 : i64
      } else {
        scf.yield %1450 : i64
      }
      %1456 = func.call @cc_errorp(%1412) : (i64) -> i64
      %1457 = arith.cmpi ne, %1456, %1425 : i64
      %1458 = arith.cmpi eq, %1455, %1425 : i64
      %1459 = arith.andi %1457, %1458 : i1
      %1460 = scf.if %1459 -> (i64) {
        scf.yield %1412 : i64
      } else {
        scf.yield %1455 : i64
      }
      %1461 = func.call @cc_errorp(%1424) : (i64) -> i64
      %1462 = arith.cmpi ne, %1461, %1425 : i64
      %1463 = arith.cmpi eq, %1460, %1425 : i64
      %1464 = arith.andi %1462, %1463 : i1
      %1465 = scf.if %1464 -> (i64) {
        scf.yield %1424 : i64
      } else {
        scf.yield %1460 : i64
      }
      %1466 = arith.cmpi ne, %1465, %1425 : i64
      scf.if %1466 {
        func.call @stack_push_pointer(%1465) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%576) : (i64) -> ()
        func.call @stack_push_pointer(%1189) : (i64) -> ()
        func.call @stack_push_pointer(%1361) : (i64) -> ()
        func.call @stack_push_pointer(%1394) : (i64) -> ()
        func.call @stack_push_pointer(%1401) : (i64) -> ()
        func.call @stack_push_pointer(%1405) : (i64) -> ()
        func.call @stack_push_pointer(%1412) : (i64) -> ()
        func.call @stack_push_pointer(%1424) : (i64) -> ()
        %1467 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1468 = func.call @cc_make_function_ref_const(%1467) : (!llvm.ptr) -> i64
        %1469 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1468, %1469) : (i64, i64) -> ()
      }
      %1470 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1470 : i64
    }
    %1471 = func.call @cc_nil_value() : () -> i64
    %1472 = func.call @cc_errorp(%567) : (i64) -> i64
    %1473 = arith.cmpi ne, %1472, %1471 : i64
    %1474 = scf.if %1473 -> (i64) {
      scf.yield %567 : i64
    } else {
      %1475 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1476 = arith.constant 13 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = func.call @cc_nil_value() : () -> i64
      %1479 = func.call @cc_intern(%1477, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_cons(%1479, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_values_pack(%1481) : (i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1483 = arith.addi %1479, %__rlasp_stack_elide_zero_95 : i64
      %1484 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1485 = arith.constant 3 : i64
      %1486 = func.call @cc_make_string(%1484, %1485) : (!llvm.ptr, i64) -> i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_intern(%1486, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_nil_value() : () -> i64
      %1490 = func.call @cc_cons(%1488, %1489) : (i64, i64) -> i64
      %1491 = func.call @cc_values_pack(%1490) : (i64) -> i64
      func.call @stack_push_pointer(%1488) : (i64) -> ()
      %1492 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1493 = arith.constant 1 : i64
      %1494 = func.call @cc_make_string(%1492, %1493) : (!llvm.ptr, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_intern(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_nil_value() : () -> i64
      %1498 = func.call @cc_cons(%1496, %1497) : (i64, i64) -> i64
      %1499 = func.call @cc_values_pack(%1498) : (i64) -> i64
      func.call @stack_push_pointer(%1496) : (i64) -> ()
      %1500 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1501 = arith.constant 7 : i64
      %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
      %1503 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1504 = arith.constant 11 : i64
      %1505 = func.call @cc_make_string(%1503, %1504) : (!llvm.ptr, i64) -> i64
      %1506 = func.call @cc_intern(%1502, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_nil_value() : () -> i64
      %1508 = func.call @cc_cons(%1506, %1507) : (i64, i64) -> i64
      %1509 = func.call @cc_values_pack(%1508) : (i64) -> i64
      func.call @stack_push_pointer(%1506) : (i64) -> ()
      %1510 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1511 = arith.constant 11 : i64
      %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
      %1513 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1514 = arith.constant 3 : i64
      %1515 = func.call @cc_make_string(%1513, %1514) : (!llvm.ptr, i64) -> i64
      %1516 = func.call @cc_intern(%1512, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_values_pack(%1518) : (i64) -> i64
      func.call @stack_push_pointer(%1516) : (i64) -> ()
      %1520 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1520) : (i64) -> ()
      %1521 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1522 = arith.constant 6 : i64
      %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
      %1524 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1525 = arith.constant 11 : i64
      %1526 = func.call @cc_make_string(%1524, %1525) : (!llvm.ptr, i64) -> i64
      %1527 = func.call @cc_intern(%1523, %1526) : (i64, i64) -> i64
      %1528 = func.call @cc_nil_value() : () -> i64
      %1529 = func.call @cc_cons(%1527, %1528) : (i64, i64) -> i64
      %1530 = func.call @cc_values_pack(%1529) : (i64) -> i64
      func.call @stack_push_pointer(%1527) : (i64) -> ()
      %1531 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1532 = arith.constant 1 : i64
      %1533 = func.call @cc_make_string(%1531, %1532) : (!llvm.ptr, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_intern(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_nil_value() : () -> i64
      %1537 = func.call @cc_cons(%1535, %1536) : (i64, i64) -> i64
      %1538 = func.call @cc_values_pack(%1537) : (i64) -> i64
      func.call @stack_push_pointer(%1535) : (i64) -> ()
      %1539 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1540 = arith.constant 1 : i64
      %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
      %1542 = func.call @cc_nil_value() : () -> i64
      %1543 = func.call @cc_intern(%1541, %1542) : (i64, i64) -> i64
      %1544 = func.call @cc_nil_value() : () -> i64
      %1545 = func.call @cc_cons(%1543, %1544) : (i64, i64) -> i64
      %1546 = func.call @cc_values_pack(%1545) : (i64) -> i64
      func.call @stack_push_pointer(%1543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1547 = func.call @stack_pop_pointer() : () -> i64
      %1548 = func.call @stack_pop_pointer() : () -> i64
      %1549 = func.call @cc_cons(%1548, %1547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1550 = arith.addi %1549, %__rlasp_stack_elide_zero_96 : i64
      %1551 = func.call @stack_pop_pointer() : () -> i64
      %1552 = func.call @cc_cons(%1551, %1550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1552) : (i64) -> ()
      %1553 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1554 = arith.constant 6 : i64
      %1555 = func.call @cc_make_string(%1553, %1554) : (!llvm.ptr, i64) -> i64
      %1556 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1557 = arith.constant 11 : i64
      %1558 = func.call @cc_make_string(%1556, %1557) : (!llvm.ptr, i64) -> i64
      %1559 = func.call @cc_intern(%1555, %1558) : (i64, i64) -> i64
      %1560 = func.call @cc_nil_value() : () -> i64
      %1561 = func.call @cc_cons(%1559, %1560) : (i64, i64) -> i64
      %1562 = func.call @cc_values_pack(%1561) : (i64) -> i64
      func.call @stack_push_pointer(%1559) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1563 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1564 = arith.constant 4 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1567 = arith.constant 11 : i64
      %1568 = func.call @cc_make_string(%1566, %1567) : (!llvm.ptr, i64) -> i64
      %1569 = func.call @cc_intern(%1565, %1568) : (i64, i64) -> i64
      %1570 = func.call @cc_nil_value() : () -> i64
      %1571 = func.call @cc_cons(%1569, %1570) : (i64, i64) -> i64
      %1572 = func.call @cc_values_pack(%1571) : (i64) -> i64
      func.call @stack_push_pointer(%1569) : (i64) -> ()
      %1573 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1574 = arith.constant 1 : i64
      %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
      %1576 = func.call @cc_nil_value() : () -> i64
      %1577 = func.call @cc_intern(%1575, %1576) : (i64, i64) -> i64
      %1578 = func.call @cc_nil_value() : () -> i64
      %1579 = func.call @cc_cons(%1577, %1578) : (i64, i64) -> i64
      %1580 = func.call @cc_values_pack(%1579) : (i64) -> i64
      func.call @stack_push_pointer(%1577) : (i64) -> ()
      %1581 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1582 = arith.constant 1 : i64
      %1583 = func.call @cc_make_string(%1581, %1582) : (!llvm.ptr, i64) -> i64
      %1584 = func.call @cc_nil_value() : () -> i64
      %1585 = func.call @cc_intern(%1583, %1584) : (i64, i64) -> i64
      %1586 = func.call @cc_nil_value() : () -> i64
      %1587 = func.call @cc_cons(%1585, %1586) : (i64, i64) -> i64
      %1588 = func.call @cc_values_pack(%1587) : (i64) -> i64
      func.call @stack_push_pointer(%1585) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1589 = func.call @stack_pop_pointer() : () -> i64
      %1590 = func.call @stack_pop_pointer() : () -> i64
      %1591 = func.call @cc_cons(%1590, %1589) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1592 = arith.addi %1591, %__rlasp_stack_elide_zero_97 : i64
      %1593 = func.call @stack_pop_pointer() : () -> i64
      %1594 = func.call @cc_cons(%1593, %1592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1595 = arith.addi %1594, %__rlasp_stack_elide_zero_98 : i64
      %1596 = func.call @stack_pop_pointer() : () -> i64
      %1597 = func.call @cc_cons(%1596, %1595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1598 = func.call @stack_pop_pointer() : () -> i64
      %1599 = func.call @stack_pop_pointer() : () -> i64
      %1600 = func.call @cc_cons(%1599, %1598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %1601 = arith.addi %1600, %__rlasp_stack_elide_zero_99 : i64
      %1602 = func.call @stack_pop_pointer() : () -> i64
      %1603 = func.call @cc_cons(%1602, %1601) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %1604 = arith.addi %1603, %__rlasp_stack_elide_zero_100 : i64
      %1605 = func.call @stack_pop_pointer() : () -> i64
      %1606 = func.call @cc_cons(%1605, %1604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1607 = func.call @stack_pop_pointer() : () -> i64
      %1608 = func.call @stack_pop_pointer() : () -> i64
      %1609 = func.call @cc_cons(%1608, %1607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %1610 = arith.addi %1609, %__rlasp_stack_elide_zero_101 : i64
      %1611 = func.call @stack_pop_pointer() : () -> i64
      %1612 = func.call @cc_cons(%1611, %1610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %1613 = arith.addi %1612, %__rlasp_stack_elide_zero_102 : i64
      %1614 = func.call @stack_pop_pointer() : () -> i64
      %1615 = func.call @cc_cons(%1614, %1613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %1616 = arith.addi %1615, %__rlasp_stack_elide_zero_103 : i64
      %1617 = func.call @stack_pop_pointer() : () -> i64
      %1618 = func.call @cc_cons(%1616, %1617) : (i64, i64) -> i64
      %1619 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1620 = arith.constant 5 : i64
      %1621 = func.call @cc_make_string(%1619, %1620) : (!llvm.ptr, i64) -> i64
      %1622 = func.call @cc_nil_value() : () -> i64
      %1623 = func.call @cc_intern(%1621, %1622) : (i64, i64) -> i64
      %1624 = func.call @cc_nil_value() : () -> i64
      %1625 = func.call @cc_cons(%1623, %1624) : (i64, i64) -> i64
      %1626 = func.call @cc_values_pack(%1625) : (i64) -> i64
      %1627 = func.call @cc_cons(%1623, %1618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1628 = func.call @stack_pop_pointer() : () -> i64
      %1629 = func.call @stack_pop_pointer() : () -> i64
      %1630 = func.call @cc_cons(%1629, %1628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %1631 = arith.addi %1630, %__rlasp_stack_elide_zero_104 : i64
      %1632 = func.call @stack_pop_pointer() : () -> i64
      %1633 = func.call @cc_cons(%1632, %1631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1633) : (i64) -> ()
      %1634 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1634) : (i64) -> ()
      %1635 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%1635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1636 = func.call @stack_pop_pointer() : () -> i64
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = func.call @cc_cons(%1637, %1636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %1639 = arith.addi %1638, %__rlasp_stack_elide_zero_105 : i64
      %1640 = func.call @stack_pop_pointer() : () -> i64
      %1641 = func.call @cc_cons(%1640, %1639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %1642 = arith.addi %1641, %__rlasp_stack_elide_zero_106 : i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %1645 = arith.addi %1644, %__rlasp_stack_elide_zero_107 : i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1646, %1645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1647) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1648 = func.call @stack_pop_pointer() : () -> i64
      %1649 = func.call @stack_pop_pointer() : () -> i64
      %1650 = func.call @cc_cons(%1649, %1648) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %1651 = arith.addi %1650, %__rlasp_stack_elide_zero_108 : i64
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @cc_cons(%1652, %1651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1653) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @stack_pop_pointer() : () -> i64
      %1656 = func.call @cc_cons(%1655, %1654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      %1657 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1658 = arith.constant 4 : i64
      %1659 = func.call @cc_make_string(%1657, %1658) : (!llvm.ptr, i64) -> i64
      %1660 = func.call @cc_nil_value() : () -> i64
      %1661 = func.call @cc_intern(%1659, %1660) : (i64, i64) -> i64
      %1662 = func.call @cc_nil_value() : () -> i64
      %1663 = func.call @cc_cons(%1661, %1662) : (i64, i64) -> i64
      %1664 = func.call @cc_values_pack(%1663) : (i64) -> i64
      func.call @stack_push_pointer(%1661) : (i64) -> ()
      %1665 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1666 = arith.constant 6 : i64
      %1667 = func.call @cc_make_string(%1665, %1666) : (!llvm.ptr, i64) -> i64
      %1668 = func.call @cc_nil_value() : () -> i64
      %1669 = func.call @cc_intern(%1667, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_nil_value() : () -> i64
      %1671 = func.call @cc_cons(%1669, %1670) : (i64, i64) -> i64
      %1672 = func.call @cc_values_pack(%1671) : (i64) -> i64
      func.call @stack_push_pointer(%1669) : (i64) -> ()
      %1673 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%1673) : (i64) -> ()
      %1674 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1675 = arith.constant 7 : i64
      %1676 = func.call @cc_make_string(%1674, %1675) : (!llvm.ptr, i64) -> i64
      %1677 = func.call @cc_nil_value() : () -> i64
      %1678 = func.call @cc_intern(%1676, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_nil_value() : () -> i64
      %1680 = func.call @cc_cons(%1678, %1679) : (i64, i64) -> i64
      %1681 = func.call @cc_values_pack(%1680) : (i64) -> i64
      func.call @stack_push_pointer(%1678) : (i64) -> ()
      %1682 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1683 = arith.constant 19 : i64
      %1684 = func.call @cc_make_string(%1682, %1683) : (!llvm.ptr, i64) -> i64
      %1685 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1686 = arith.constant 11 : i64
      %1687 = func.call @cc_make_string(%1685, %1686) : (!llvm.ptr, i64) -> i64
      %1688 = func.call @cc_intern(%1684, %1687) : (i64, i64) -> i64
      %1689 = func.call @cc_nil_value() : () -> i64
      %1690 = func.call @cc_cons(%1688, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_values_pack(%1690) : (i64) -> i64
      func.call @stack_push_pointer(%1688) : (i64) -> ()
      %1692 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1693 = arith.constant 1 : i64
      %1694 = func.call @cc_make_string(%1692, %1693) : (!llvm.ptr, i64) -> i64
      %1695 = func.call @cc_nil_value() : () -> i64
      %1696 = func.call @cc_intern(%1694, %1695) : (i64, i64) -> i64
      %1697 = func.call @cc_nil_value() : () -> i64
      %1698 = func.call @cc_cons(%1696, %1697) : (i64, i64) -> i64
      %1699 = func.call @cc_values_pack(%1698) : (i64) -> i64
      func.call @stack_push_pointer(%1696) : (i64) -> ()
      %1700 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1701 = arith.constant 9 : i64
      %1702 = func.call @cc_make_string(%1700, %1701) : (!llvm.ptr, i64) -> i64
      %1703 = func.call @cc_nil_value() : () -> i64
      %1704 = func.call @cc_intern(%1702, %1703) : (i64, i64) -> i64
      %1705 = func.call @cc_nil_value() : () -> i64
      %1706 = func.call @cc_cons(%1704, %1705) : (i64, i64) -> i64
      %1707 = func.call @cc_values_pack(%1706) : (i64) -> i64
      func.call @stack_push_pointer(%1704) : (i64) -> ()
      %1708 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1709 = arith.constant 8 : i64
      %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_intern(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_cons(%1712, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_values_pack(%1714) : (i64) -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = func.call @stack_pop_pointer() : () -> i64
      %1718 = func.call @cc_cons(%1717, %1716) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %1719 = arith.addi %1718, %__rlasp_stack_elide_zero_109 : i64
      %1720 = func.call @stack_pop_pointer() : () -> i64
      %1721 = func.call @cc_cons(%1720, %1719) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %1722 = arith.addi %1721, %__rlasp_stack_elide_zero_110 : i64
      %1723 = func.call @stack_pop_pointer() : () -> i64
      %1724 = func.call @cc_cons(%1723, %1722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1724) : (i64) -> ()
      %1725 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1726 = arith.constant 7 : i64
      %1727 = func.call @cc_make_string(%1725, %1726) : (!llvm.ptr, i64) -> i64
      %1728 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1729 = arith.constant 11 : i64
      %1730 = func.call @cc_make_string(%1728, %1729) : (!llvm.ptr, i64) -> i64
      %1731 = func.call @cc_intern(%1727, %1730) : (i64, i64) -> i64
      %1732 = func.call @cc_nil_value() : () -> i64
      %1733 = func.call @cc_cons(%1731, %1732) : (i64, i64) -> i64
      %1734 = func.call @cc_values_pack(%1733) : (i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1735 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1736 = arith.constant 1 : i64
      %1737 = func.call @cc_make_string(%1735, %1736) : (!llvm.ptr, i64) -> i64
      %1738 = func.call @cc_nil_value() : () -> i64
      %1739 = func.call @cc_intern(%1737, %1738) : (i64, i64) -> i64
      %1740 = func.call @cc_nil_value() : () -> i64
      %1741 = func.call @cc_cons(%1739, %1740) : (i64, i64) -> i64
      %1742 = func.call @cc_values_pack(%1741) : (i64) -> i64
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1743 = func.call @stack_pop_pointer() : () -> i64
      %1744 = func.call @stack_pop_pointer() : () -> i64
      %1745 = func.call @cc_cons(%1744, %1743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %1746 = arith.addi %1745, %__rlasp_stack_elide_zero_111 : i64
      %1747 = func.call @stack_pop_pointer() : () -> i64
      %1748 = func.call @cc_cons(%1747, %1746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %1749 = arith.addi %1748, %__rlasp_stack_elide_zero_112 : i64
      %1750 = func.call @stack_pop_pointer() : () -> i64
      %1751 = func.call @cc_cons(%1750, %1749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      %1752 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1753 = arith.constant 2 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      %1755 = func.call @cc_nil_value() : () -> i64
      %1756 = func.call @cc_intern(%1754, %1755) : (i64, i64) -> i64
      %1757 = func.call @cc_nil_value() : () -> i64
      %1758 = func.call @cc_cons(%1756, %1757) : (i64, i64) -> i64
      %1759 = func.call @cc_values_pack(%1758) : (i64) -> i64
      func.call @stack_push_pointer(%1756) : (i64) -> ()
      %1760 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1761 = arith.constant 2 : i64
      %1762 = func.call @cc_make_string(%1760, %1761) : (!llvm.ptr, i64) -> i64
      %1763 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1764 = arith.constant 11 : i64
      %1765 = func.call @cc_make_string(%1763, %1764) : (!llvm.ptr, i64) -> i64
      %1766 = func.call @cc_intern(%1762, %1765) : (i64, i64) -> i64
      %1767 = func.call @cc_nil_value() : () -> i64
      %1768 = func.call @cc_cons(%1766, %1767) : (i64, i64) -> i64
      %1769 = func.call @cc_values_pack(%1768) : (i64) -> i64
      func.call @stack_push_pointer(%1766) : (i64) -> ()
      %1770 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1771 = arith.constant 9 : i64
      %1772 = func.call @cc_make_string(%1770, %1771) : (!llvm.ptr, i64) -> i64
      %1773 = func.call @cc_nil_value() : () -> i64
      %1774 = func.call @cc_intern(%1772, %1773) : (i64, i64) -> i64
      %1775 = func.call @cc_nil_value() : () -> i64
      %1776 = func.call @cc_cons(%1774, %1775) : (i64, i64) -> i64
      %1777 = func.call @cc_values_pack(%1776) : (i64) -> i64
      func.call @stack_push_pointer(%1774) : (i64) -> ()
      %1778 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1779 = arith.constant 8 : i64
      %1780 = func.call @cc_make_string(%1778, %1779) : (!llvm.ptr, i64) -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_intern(%1780, %1781) : (i64, i64) -> i64
      %1783 = func.call @cc_nil_value() : () -> i64
      %1784 = func.call @cc_cons(%1782, %1783) : (i64, i64) -> i64
      %1785 = func.call @cc_values_pack(%1784) : (i64) -> i64
      func.call @stack_push_pointer(%1782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @cc_cons(%1787, %1786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %1789 = arith.addi %1788, %__rlasp_stack_elide_zero_113 : i64
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @cc_cons(%1790, %1789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %1792 = arith.addi %1791, %__rlasp_stack_elide_zero_114 : i64
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = func.call @cc_cons(%1793, %1792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1794) : (i64) -> ()
      %1795 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1796 = arith.constant 11 : i64
      %1797 = func.call @cc_make_string(%1795, %1796) : (!llvm.ptr, i64) -> i64
      %1798 = func.call @cc_nil_value() : () -> i64
      %1799 = func.call @cc_intern(%1797, %1798) : (i64, i64) -> i64
      %1800 = func.call @cc_nil_value() : () -> i64
      %1801 = func.call @cc_cons(%1799, %1800) : (i64, i64) -> i64
      %1802 = func.call @cc_values_pack(%1801) : (i64) -> i64
      func.call @stack_push_pointer(%1799) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1803 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1804 = arith.constant 6 : i64
      %1805 = func.call @cc_make_string(%1803, %1804) : (!llvm.ptr, i64) -> i64
      %1806 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1807 = arith.constant 11 : i64
      %1808 = func.call @cc_make_string(%1806, %1807) : (!llvm.ptr, i64) -> i64
      %1809 = func.call @cc_intern(%1805, %1808) : (i64, i64) -> i64
      %1810 = func.call @cc_nil_value() : () -> i64
      %1811 = func.call @cc_cons(%1809, %1810) : (i64, i64) -> i64
      %1812 = func.call @cc_values_pack(%1811) : (i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      %1813 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1814 = arith.constant 9 : i64
      %1815 = func.call @cc_make_string(%1813, %1814) : (!llvm.ptr, i64) -> i64
      %1816 = func.call @cc_nil_value() : () -> i64
      %1817 = func.call @cc_intern(%1815, %1816) : (i64, i64) -> i64
      %1818 = func.call @cc_nil_value() : () -> i64
      %1819 = func.call @cc_cons(%1817, %1818) : (i64, i64) -> i64
      %1820 = func.call @cc_values_pack(%1819) : (i64) -> i64
      func.call @stack_push_pointer(%1817) : (i64) -> ()
      %1821 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1822 = arith.constant 8 : i64
      %1823 = func.call @cc_make_string(%1821, %1822) : (!llvm.ptr, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_intern(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_cons(%1825, %1826) : (i64, i64) -> i64
      %1828 = func.call @cc_values_pack(%1827) : (i64) -> i64
      func.call @stack_push_pointer(%1825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @cc_cons(%1830, %1829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %1832 = arith.addi %1831, %__rlasp_stack_elide_zero_115 : i64
      %1833 = func.call @stack_pop_pointer() : () -> i64
      %1834 = func.call @cc_cons(%1833, %1832) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %1835 = arith.addi %1834, %__rlasp_stack_elide_zero_116 : i64
      %1836 = func.call @stack_pop_pointer() : () -> i64
      %1837 = func.call @cc_cons(%1836, %1835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @stack_pop_pointer() : () -> i64
      %1840 = func.call @cc_cons(%1839, %1838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %1841 = arith.addi %1840, %__rlasp_stack_elide_zero_117 : i64
      %1842 = func.call @stack_pop_pointer() : () -> i64
      %1843 = func.call @cc_cons(%1842, %1841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %1844 = arith.addi %1843, %__rlasp_stack_elide_zero_118 : i64
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @cc_cons(%1845, %1844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      %1847 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1848 = arith.constant 7 : i64
      %1849 = func.call @cc_make_string(%1847, %1848) : (!llvm.ptr, i64) -> i64
      %1850 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1851 = arith.constant 11 : i64
      %1852 = func.call @cc_make_string(%1850, %1851) : (!llvm.ptr, i64) -> i64
      %1853 = func.call @cc_intern(%1849, %1852) : (i64, i64) -> i64
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_cons(%1853, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_values_pack(%1855) : (i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      %1857 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1858 = arith.constant 1 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = func.call @cc_nil_value() : () -> i64
      %1861 = func.call @cc_intern(%1859, %1860) : (i64, i64) -> i64
      %1862 = func.call @cc_nil_value() : () -> i64
      %1863 = func.call @cc_cons(%1861, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_values_pack(%1863) : (i64) -> i64
      func.call @stack_push_pointer(%1861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = func.call @cc_cons(%1866, %1865) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %1868 = arith.addi %1867, %__rlasp_stack_elide_zero_119 : i64
      %1869 = func.call @stack_pop_pointer() : () -> i64
      %1870 = func.call @cc_cons(%1869, %1868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1871 = func.call @stack_pop_pointer() : () -> i64
      %1872 = func.call @stack_pop_pointer() : () -> i64
      %1873 = func.call @cc_cons(%1872, %1871) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %1874 = arith.addi %1873, %__rlasp_stack_elide_zero_120 : i64
      %1875 = func.call @stack_pop_pointer() : () -> i64
      %1876 = func.call @cc_cons(%1875, %1874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %1877 = arith.addi %1876, %__rlasp_stack_elide_zero_121 : i64
      %1878 = func.call @stack_pop_pointer() : () -> i64
      %1879 = func.call @cc_cons(%1878, %1877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %1880 = arith.addi %1879, %__rlasp_stack_elide_zero_122 : i64
      %1881 = func.call @stack_pop_pointer() : () -> i64
      %1882 = func.call @cc_cons(%1881, %1880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1883 = func.call @stack_pop_pointer() : () -> i64
      %1884 = func.call @stack_pop_pointer() : () -> i64
      %1885 = func.call @cc_cons(%1884, %1883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %1886 = arith.addi %1885, %__rlasp_stack_elide_zero_123 : i64
      %1887 = func.call @stack_pop_pointer() : () -> i64
      %1888 = func.call @cc_cons(%1887, %1886) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %1889 = arith.addi %1888, %__rlasp_stack_elide_zero_124 : i64
      %1890 = func.call @stack_pop_pointer() : () -> i64
      %1891 = func.call @cc_cons(%1890, %1889) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %1892 = arith.addi %1891, %__rlasp_stack_elide_zero_125 : i64
      %1893 = func.call @stack_pop_pointer() : () -> i64
      %1894 = func.call @cc_cons(%1893, %1892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1894) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1895 = func.call @stack_pop_pointer() : () -> i64
      %1896 = func.call @stack_pop_pointer() : () -> i64
      %1897 = func.call @cc_cons(%1896, %1895) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %1898 = arith.addi %1897, %__rlasp_stack_elide_zero_126 : i64
      %1899 = func.call @stack_pop_pointer() : () -> i64
      %1900 = func.call @cc_cons(%1899, %1898) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %1901 = arith.addi %1900, %__rlasp_stack_elide_zero_127 : i64
      %1902 = func.call @stack_pop_pointer() : () -> i64
      %1903 = func.call @cc_cons(%1902, %1901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %1904 = arith.addi %1903, %__rlasp_stack_elide_zero_128 : i64
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @cc_cons(%1905, %1904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %1907 = arith.addi %1906, %__rlasp_stack_elide_zero_129 : i64
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @cc_cons(%1908, %1907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1910 = func.call @stack_pop_pointer() : () -> i64
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @cc_cons(%1911, %1910) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %1913 = arith.addi %1912, %__rlasp_stack_elide_zero_130 : i64
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @cc_cons(%1914, %1913) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %1916 = arith.addi %1915, %__rlasp_stack_elide_zero_131 : i64
      %1917 = func.call @stack_pop_pointer() : () -> i64
      %1918 = func.call @cc_cons(%1917, %1916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %1919 = arith.addi %1918, %__rlasp_stack_elide_zero_132 : i64
      %2277 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2278 = arith.constant 30 : i64
      %2279 = func.call @cc_make_symbol(%2277, %2278) : (!llvm.ptr, i64) -> i64
      %2280 = func.call @cc_persistent_root_value(%2279) : (i64) -> i64
      func.call @stack_push_pointer(%2280) : (i64) -> ()
      %2281 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2282 = arith.constant 37 : i64
      %2283 = func.call @cc_make_symbol(%2281, %2282) : (!llvm.ptr, i64) -> i64
      %2284 = func.call @cc_persistent_root_value(%2283) : (i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      %2285 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2286 = arith.constant 38 : i64
      %2287 = func.call @cc_make_symbol(%2285, %2286) : (!llvm.ptr, i64) -> i64
      %2288 = func.call @cc_persistent_root_value(%2287) : (i64) -> i64
      func.call @stack_push_pointer(%2288) : (i64) -> ()
      %2289 = arith.constant 275462358040595 : i64
      %2290 = arith.constant 3 : i64
      %2291 = func.call @cc_make_closure(%2289, %2290) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2292 = arith.addi %2291, %__rlasp_stack_elide_zero_133 : i64
      %2293 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2293) : (i64) -> ()
      %2294 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2294) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2295 = func.call @stack_pop_pointer() : () -> i64
      %2296 = func.call @stack_pop_pointer() : () -> i64
      %2297 = func.call @cc_cons(%2296, %2295) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2298 = arith.addi %2297, %__rlasp_stack_elide_zero_134 : i64
      %2299 = func.call @stack_pop_pointer() : () -> i64
      %2300 = func.call @cc_cons(%2299, %2298) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2300) : (i64) -> ()
      %2301 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2301) : (i64) -> ()
      %2302 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @cc_cons(%2304, %2303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2306 = arith.addi %2305, %__rlasp_stack_elide_zero_135 : i64
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @cc_cons(%2307, %2306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      %2309 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2309) : (i64) -> ()
      %2310 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2311 = func.call @stack_pop_pointer() : () -> i64
      %2312 = func.call @stack_pop_pointer() : () -> i64
      %2313 = func.call @cc_cons(%2312, %2311) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2314 = arith.addi %2313, %__rlasp_stack_elide_zero_136 : i64
      %2315 = func.call @stack_pop_pointer() : () -> i64
      %2316 = func.call @cc_cons(%2315, %2314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2316) : (i64) -> ()
      %2317 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2317) : (i64) -> ()
      %2318 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2318) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2319 = func.call @stack_pop_pointer() : () -> i64
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @cc_cons(%2320, %2319) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2322 = arith.addi %2321, %__rlasp_stack_elide_zero_137 : i64
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @cc_cons(%2323, %2322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2324) : (i64) -> ()
      %2325 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2325) : (i64) -> ()
      %2326 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @stack_pop_pointer() : () -> i64
      %2329 = func.call @cc_cons(%2328, %2327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2330 = arith.addi %2329, %__rlasp_stack_elide_zero_138 : i64
      %2331 = func.call @stack_pop_pointer() : () -> i64
      %2332 = func.call @cc_cons(%2331, %2330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2332) : (i64) -> ()
      %2333 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2333) : (i64) -> ()
      %2334 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2334) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2335 = func.call @stack_pop_pointer() : () -> i64
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @cc_cons(%2336, %2335) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2338 = arith.addi %2337, %__rlasp_stack_elide_zero_139 : i64
      %2339 = func.call @stack_pop_pointer() : () -> i64
      %2340 = func.call @cc_cons(%2339, %2338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2340) : (i64) -> ()
      %2341 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2341) : (i64) -> ()
      %2342 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2343 = func.call @stack_pop_pointer() : () -> i64
      %2344 = func.call @stack_pop_pointer() : () -> i64
      %2345 = func.call @cc_cons(%2344, %2343) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2346 = arith.addi %2345, %__rlasp_stack_elide_zero_140 : i64
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @cc_cons(%2347, %2346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2349 = func.call @stack_pop_pointer() : () -> i64
      %2350 = func.call @stack_pop_pointer() : () -> i64
      %2351 = func.call @cc_cons(%2350, %2349) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2352 = arith.addi %2351, %__rlasp_stack_elide_zero_141 : i64
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @cc_cons(%2353, %2352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2355 = arith.addi %2354, %__rlasp_stack_elide_zero_142 : i64
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @cc_cons(%2356, %2355) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2358 = arith.addi %2357, %__rlasp_stack_elide_zero_143 : i64
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @cc_cons(%2359, %2358) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2361 = arith.addi %2360, %__rlasp_stack_elide_zero_144 : i64
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = func.call @cc_cons(%2362, %2361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2364 = arith.addi %2363, %__rlasp_stack_elide_zero_145 : i64
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @cc_cons(%2365, %2364) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2367 = arith.addi %2366, %__rlasp_stack_elide_zero_146 : i64
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @cc_cons(%2368, %2367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2370 = func.call @stack_pop_pointer() : () -> i64
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @cc_cons(%2371, %2370) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2373 = arith.addi %2372, %__rlasp_stack_elide_zero_147 : i64
      %2374 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2375 = arith.constant 11 : i64
      %2376 = func.call @cc_make_string(%2374, %2375) : (!llvm.ptr, i64) -> i64
      %2377 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2378 = arith.constant 7 : i64
      %2379 = func.call @cc_make_string(%2377, %2378) : (!llvm.ptr, i64) -> i64
      %2380 = func.call @cc_intern(%2376, %2379) : (i64, i64) -> i64
      %2381 = func.call @cc_nil_value() : () -> i64
      %2382 = func.call @cc_cons(%2380, %2381) : (i64, i64) -> i64
      %2383 = func.call @cc_values_pack(%2382) : (i64) -> i64
      %2384 = func.call @cc_nil_value() : () -> i64
      %2385 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2386 = arith.constant 4 : i64
      %2387 = func.call @cc_make_string(%2385, %2386) : (!llvm.ptr, i64) -> i64
      %2388 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2389 = arith.constant 7 : i64
      %2390 = func.call @cc_make_string(%2388, %2389) : (!llvm.ptr, i64) -> i64
      %2391 = func.call @cc_intern(%2387, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_nil_value() : () -> i64
      %2393 = func.call @cc_cons(%2391, %2392) : (i64, i64) -> i64
      %2394 = func.call @cc_values_pack(%2393) : (i64) -> i64
      %2395 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2396 = arith.constant 6 : i64
      %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
      %2398 = func.call @cc_nil_value() : () -> i64
      %2399 = func.call @cc_intern(%2397, %2398) : (i64, i64) -> i64
      %2400 = func.call @cc_nil_value() : () -> i64
      %2401 = func.call @cc_cons(%2399, %2400) : (i64, i64) -> i64
      %2402 = func.call @cc_values_pack(%2401) : (i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2403 = arith.addi %2399, %__rlasp_stack_elide_zero_148 : i64
      %2404 = func.call @cc_nil_value() : () -> i64
      %2405 = func.call @cc_errorp(%1483) : (i64) -> i64
      %2406 = arith.cmpi ne, %2405, %2404 : i64
      %2407 = arith.cmpi eq, %2404, %2404 : i64
      %2408 = arith.andi %2406, %2407 : i1
      %2409 = scf.if %2408 -> (i64) {
        scf.yield %1483 : i64
      } else {
        scf.yield %2404 : i64
      }
      %2410 = func.call @cc_errorp(%1919) : (i64) -> i64
      %2411 = arith.cmpi ne, %2410, %2404 : i64
      %2412 = arith.cmpi eq, %2409, %2404 : i64
      %2413 = arith.andi %2411, %2412 : i1
      %2414 = scf.if %2413 -> (i64) {
        scf.yield %1919 : i64
      } else {
        scf.yield %2409 : i64
      }
      %2415 = func.call @cc_errorp(%2292) : (i64) -> i64
      %2416 = arith.cmpi ne, %2415, %2404 : i64
      %2417 = arith.cmpi eq, %2414, %2404 : i64
      %2418 = arith.andi %2416, %2417 : i1
      %2419 = scf.if %2418 -> (i64) {
        scf.yield %2292 : i64
      } else {
        scf.yield %2414 : i64
      }
      %2420 = func.call @cc_errorp(%2373) : (i64) -> i64
      %2421 = arith.cmpi ne, %2420, %2404 : i64
      %2422 = arith.cmpi eq, %2419, %2404 : i64
      %2423 = arith.andi %2421, %2422 : i1
      %2424 = scf.if %2423 -> (i64) {
        scf.yield %2373 : i64
      } else {
        scf.yield %2419 : i64
      }
      %2425 = func.call @cc_errorp(%2380) : (i64) -> i64
      %2426 = arith.cmpi ne, %2425, %2404 : i64
      %2427 = arith.cmpi eq, %2424, %2404 : i64
      %2428 = arith.andi %2426, %2427 : i1
      %2429 = scf.if %2428 -> (i64) {
        scf.yield %2380 : i64
      } else {
        scf.yield %2424 : i64
      }
      %2430 = func.call @cc_errorp(%2384) : (i64) -> i64
      %2431 = arith.cmpi ne, %2430, %2404 : i64
      %2432 = arith.cmpi eq, %2429, %2404 : i64
      %2433 = arith.andi %2431, %2432 : i1
      %2434 = scf.if %2433 -> (i64) {
        scf.yield %2384 : i64
      } else {
        scf.yield %2429 : i64
      }
      %2435 = func.call @cc_errorp(%2391) : (i64) -> i64
      %2436 = arith.cmpi ne, %2435, %2404 : i64
      %2437 = arith.cmpi eq, %2434, %2404 : i64
      %2438 = arith.andi %2436, %2437 : i1
      %2439 = scf.if %2438 -> (i64) {
        scf.yield %2391 : i64
      } else {
        scf.yield %2434 : i64
      }
      %2440 = func.call @cc_errorp(%2403) : (i64) -> i64
      %2441 = arith.cmpi ne, %2440, %2404 : i64
      %2442 = arith.cmpi eq, %2439, %2404 : i64
      %2443 = arith.andi %2441, %2442 : i1
      %2444 = scf.if %2443 -> (i64) {
        scf.yield %2403 : i64
      } else {
        scf.yield %2439 : i64
      }
      %2445 = arith.cmpi ne, %2444, %2404 : i64
      scf.if %2445 {
        func.call @stack_push_pointer(%2444) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1483) : (i64) -> ()
        func.call @stack_push_pointer(%1919) : (i64) -> ()
        func.call @stack_push_pointer(%2292) : (i64) -> ()
        func.call @stack_push_pointer(%2373) : (i64) -> ()
        func.call @stack_push_pointer(%2380) : (i64) -> ()
        func.call @stack_push_pointer(%2384) : (i64) -> ()
        func.call @stack_push_pointer(%2391) : (i64) -> ()
        func.call @stack_push_pointer(%2403) : (i64) -> ()
        %2446 = llvm.mlir.addressof @str189 : !llvm.ptr
        %2447 = func.call @cc_make_function_ref_const(%2446) : (!llvm.ptr) -> i64
        %2448 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2447, %2448) : (i64, i64) -> ()
      }
      %2449 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2449 : i64
    }
    %2450 = func.call @cc_nil_value() : () -> i64
    %2451 = func.call @cc_errorp(%1474) : (i64) -> i64
    %2452 = arith.cmpi ne, %2451, %2450 : i64
    %2453 = scf.if %2452 -> (i64) {
      scf.yield %1474 : i64
    } else {
      %2454 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2455 = arith.constant 13 : i64
      %2456 = func.call @cc_make_string(%2454, %2455) : (!llvm.ptr, i64) -> i64
      %2457 = func.call @cc_nil_value() : () -> i64
      %2458 = func.call @cc_intern(%2456, %2457) : (i64, i64) -> i64
      %2459 = func.call @cc_nil_value() : () -> i64
      %2460 = func.call @cc_cons(%2458, %2459) : (i64, i64) -> i64
      %2461 = func.call @cc_values_pack(%2460) : (i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %2462 = arith.addi %2458, %__rlasp_stack_elide_zero_149 : i64
      %2463 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2464 = arith.constant 3 : i64
      %2465 = func.call @cc_make_string(%2463, %2464) : (!llvm.ptr, i64) -> i64
      %2466 = func.call @cc_nil_value() : () -> i64
      %2467 = func.call @cc_intern(%2465, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_cons(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_values_pack(%2469) : (i64) -> i64
      func.call @stack_push_pointer(%2467) : (i64) -> ()
      %2471 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2472 = arith.constant 1 : i64
      %2473 = func.call @cc_make_string(%2471, %2472) : (!llvm.ptr, i64) -> i64
      %2474 = func.call @cc_nil_value() : () -> i64
      %2475 = func.call @cc_intern(%2473, %2474) : (i64, i64) -> i64
      %2476 = func.call @cc_nil_value() : () -> i64
      %2477 = func.call @cc_cons(%2475, %2476) : (i64, i64) -> i64
      %2478 = func.call @cc_values_pack(%2477) : (i64) -> i64
      func.call @stack_push_pointer(%2475) : (i64) -> ()
      %2479 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2480 = arith.constant 7 : i64
      %2481 = func.call @cc_make_string(%2479, %2480) : (!llvm.ptr, i64) -> i64
      %2482 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2483 = arith.constant 11 : i64
      %2484 = func.call @cc_make_string(%2482, %2483) : (!llvm.ptr, i64) -> i64
      %2485 = func.call @cc_intern(%2481, %2484) : (i64, i64) -> i64
      %2486 = func.call @cc_nil_value() : () -> i64
      %2487 = func.call @cc_cons(%2485, %2486) : (i64, i64) -> i64
      %2488 = func.call @cc_values_pack(%2487) : (i64) -> i64
      func.call @stack_push_pointer(%2485) : (i64) -> ()
      %2489 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2490 = arith.constant 11 : i64
      %2491 = func.call @cc_make_string(%2489, %2490) : (!llvm.ptr, i64) -> i64
      %2492 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2493 = arith.constant 3 : i64
      %2494 = func.call @cc_make_string(%2492, %2493) : (!llvm.ptr, i64) -> i64
      %2495 = func.call @cc_intern(%2491, %2494) : (i64, i64) -> i64
      %2496 = func.call @cc_nil_value() : () -> i64
      %2497 = func.call @cc_cons(%2495, %2496) : (i64, i64) -> i64
      %2498 = func.call @cc_values_pack(%2497) : (i64) -> i64
      func.call @stack_push_pointer(%2495) : (i64) -> ()
      %2499 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2499) : (i64) -> ()
      %2500 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2501 = arith.constant 6 : i64
      %2502 = func.call @cc_make_string(%2500, %2501) : (!llvm.ptr, i64) -> i64
      %2503 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2504 = arith.constant 11 : i64
      %2505 = func.call @cc_make_string(%2503, %2504) : (!llvm.ptr, i64) -> i64
      %2506 = func.call @cc_intern(%2502, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_nil_value() : () -> i64
      %2508 = func.call @cc_cons(%2506, %2507) : (i64, i64) -> i64
      %2509 = func.call @cc_values_pack(%2508) : (i64) -> i64
      func.call @stack_push_pointer(%2506) : (i64) -> ()
      %2510 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2511 = arith.constant 1 : i64
      %2512 = func.call @cc_make_string(%2510, %2511) : (!llvm.ptr, i64) -> i64
      %2513 = func.call @cc_nil_value() : () -> i64
      %2514 = func.call @cc_intern(%2512, %2513) : (i64, i64) -> i64
      %2515 = func.call @cc_nil_value() : () -> i64
      %2516 = func.call @cc_cons(%2514, %2515) : (i64, i64) -> i64
      %2517 = func.call @cc_values_pack(%2516) : (i64) -> i64
      func.call @stack_push_pointer(%2514) : (i64) -> ()
      %2518 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2519 = arith.constant 1 : i64
      %2520 = func.call @cc_make_string(%2518, %2519) : (!llvm.ptr, i64) -> i64
      %2521 = func.call @cc_nil_value() : () -> i64
      %2522 = func.call @cc_intern(%2520, %2521) : (i64, i64) -> i64
      %2523 = func.call @cc_nil_value() : () -> i64
      %2524 = func.call @cc_cons(%2522, %2523) : (i64, i64) -> i64
      %2525 = func.call @cc_values_pack(%2524) : (i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2526 = func.call @stack_pop_pointer() : () -> i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2527, %2526) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %2529 = arith.addi %2528, %__rlasp_stack_elide_zero_150 : i64
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @cc_cons(%2530, %2529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      %2532 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2533 = arith.constant 6 : i64
      %2534 = func.call @cc_make_string(%2532, %2533) : (!llvm.ptr, i64) -> i64
      %2535 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2536 = arith.constant 11 : i64
      %2537 = func.call @cc_make_string(%2535, %2536) : (!llvm.ptr, i64) -> i64
      %2538 = func.call @cc_intern(%2534, %2537) : (i64, i64) -> i64
      %2539 = func.call @cc_nil_value() : () -> i64
      %2540 = func.call @cc_cons(%2538, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_values_pack(%2540) : (i64) -> i64
      func.call @stack_push_pointer(%2538) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2542 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2543 = arith.constant 2 : i64
      %2544 = func.call @cc_make_string(%2542, %2543) : (!llvm.ptr, i64) -> i64
      %2545 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2546 = arith.constant 11 : i64
      %2547 = func.call @cc_make_string(%2545, %2546) : (!llvm.ptr, i64) -> i64
      %2548 = func.call @cc_intern(%2544, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_nil_value() : () -> i64
      %2550 = func.call @cc_cons(%2548, %2549) : (i64, i64) -> i64
      %2551 = func.call @cc_values_pack(%2550) : (i64) -> i64
      func.call @stack_push_pointer(%2548) : (i64) -> ()
      %2552 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2553 = arith.constant 1 : i64
      %2554 = func.call @cc_make_string(%2552, %2553) : (!llvm.ptr, i64) -> i64
      %2555 = func.call @cc_nil_value() : () -> i64
      %2556 = func.call @cc_intern(%2554, %2555) : (i64, i64) -> i64
      %2557 = func.call @cc_nil_value() : () -> i64
      %2558 = func.call @cc_cons(%2556, %2557) : (i64, i64) -> i64
      %2559 = func.call @cc_values_pack(%2558) : (i64) -> i64
      func.call @stack_push_pointer(%2556) : (i64) -> ()
      %2560 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2561 = arith.constant 1 : i64
      %2562 = func.call @cc_make_string(%2560, %2561) : (!llvm.ptr, i64) -> i64
      %2563 = func.call @cc_nil_value() : () -> i64
      %2564 = func.call @cc_intern(%2562, %2563) : (i64, i64) -> i64
      %2565 = func.call @cc_nil_value() : () -> i64
      %2566 = func.call @cc_cons(%2564, %2565) : (i64, i64) -> i64
      %2567 = func.call @cc_values_pack(%2566) : (i64) -> i64
      func.call @stack_push_pointer(%2564) : (i64) -> ()
      %2568 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2569 = arith.constant 1 : i64
      %2570 = func.call @cc_make_string(%2568, %2569) : (!llvm.ptr, i64) -> i64
      %2571 = func.call @cc_nil_value() : () -> i64
      %2572 = func.call @cc_intern(%2570, %2571) : (i64, i64) -> i64
      %2573 = func.call @cc_nil_value() : () -> i64
      %2574 = func.call @cc_cons(%2572, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_values_pack(%2574) : (i64) -> i64
      func.call @stack_push_pointer(%2572) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2576 = func.call @stack_pop_pointer() : () -> i64
      %2577 = func.call @stack_pop_pointer() : () -> i64
      %2578 = func.call @cc_cons(%2577, %2576) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %2579 = arith.addi %2578, %__rlasp_stack_elide_zero_151 : i64
      %2580 = func.call @stack_pop_pointer() : () -> i64
      %2581 = func.call @cc_cons(%2580, %2579) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %2582 = arith.addi %2581, %__rlasp_stack_elide_zero_152 : i64
      %2583 = func.call @stack_pop_pointer() : () -> i64
      %2584 = func.call @cc_cons(%2583, %2582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %2585 = arith.addi %2584, %__rlasp_stack_elide_zero_153 : i64
      %2586 = func.call @stack_pop_pointer() : () -> i64
      %2587 = func.call @cc_cons(%2586, %2585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2588 = func.call @stack_pop_pointer() : () -> i64
      %2589 = func.call @stack_pop_pointer() : () -> i64
      %2590 = func.call @cc_cons(%2589, %2588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %2591 = arith.addi %2590, %__rlasp_stack_elide_zero_154 : i64
      %2592 = func.call @stack_pop_pointer() : () -> i64
      %2593 = func.call @cc_cons(%2592, %2591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %2594 = arith.addi %2593, %__rlasp_stack_elide_zero_155 : i64
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @cc_cons(%2595, %2594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2596) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2597 = func.call @stack_pop_pointer() : () -> i64
      %2598 = func.call @stack_pop_pointer() : () -> i64
      %2599 = func.call @cc_cons(%2598, %2597) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %2600 = arith.addi %2599, %__rlasp_stack_elide_zero_156 : i64
      %2601 = func.call @stack_pop_pointer() : () -> i64
      %2602 = func.call @cc_cons(%2601, %2600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %2603 = arith.addi %2602, %__rlasp_stack_elide_zero_157 : i64
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @cc_cons(%2604, %2603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %2606 = arith.addi %2605, %__rlasp_stack_elide_zero_158 : i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_cons(%2606, %2607) : (i64, i64) -> i64
      %2609 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2610 = arith.constant 5 : i64
      %2611 = func.call @cc_make_string(%2609, %2610) : (!llvm.ptr, i64) -> i64
      %2612 = func.call @cc_nil_value() : () -> i64
      %2613 = func.call @cc_intern(%2611, %2612) : (i64, i64) -> i64
      %2614 = func.call @cc_nil_value() : () -> i64
      %2615 = func.call @cc_cons(%2613, %2614) : (i64, i64) -> i64
      %2616 = func.call @cc_values_pack(%2615) : (i64) -> i64
      %2617 = func.call @cc_cons(%2613, %2608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @stack_pop_pointer() : () -> i64
      %2620 = func.call @cc_cons(%2619, %2618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %2621 = arith.addi %2620, %__rlasp_stack_elide_zero_159 : i64
      %2622 = func.call @stack_pop_pointer() : () -> i64
      %2623 = func.call @cc_cons(%2622, %2621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2623) : (i64) -> ()
      %2624 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2624) : (i64) -> ()
      %2625 = arith.constant 19 : i64
      func.call @stack_push_fixnum(%2625) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = func.call @cc_cons(%2627, %2626) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %2629 = arith.addi %2628, %__rlasp_stack_elide_zero_160 : i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2630, %2629) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %2632 = arith.addi %2631, %__rlasp_stack_elide_zero_161 : i64
      %2633 = func.call @stack_pop_pointer() : () -> i64
      %2634 = func.call @cc_cons(%2633, %2632) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %2635 = arith.addi %2634, %__rlasp_stack_elide_zero_162 : i64
      %2636 = func.call @stack_pop_pointer() : () -> i64
      %2637 = func.call @cc_cons(%2636, %2635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @stack_pop_pointer() : () -> i64
      %2640 = func.call @cc_cons(%2639, %2638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %2641 = arith.addi %2640, %__rlasp_stack_elide_zero_163 : i64
      %2642 = func.call @stack_pop_pointer() : () -> i64
      %2643 = func.call @cc_cons(%2642, %2641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @stack_pop_pointer() : () -> i64
      %2646 = func.call @cc_cons(%2645, %2644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2646) : (i64) -> ()
      %2647 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2648 = arith.constant 19 : i64
      %2649 = func.call @cc_make_string(%2647, %2648) : (!llvm.ptr, i64) -> i64
      %2650 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2651 = arith.constant 11 : i64
      %2652 = func.call @cc_make_string(%2650, %2651) : (!llvm.ptr, i64) -> i64
      %2653 = func.call @cc_intern(%2649, %2652) : (i64, i64) -> i64
      %2654 = func.call @cc_nil_value() : () -> i64
      %2655 = func.call @cc_cons(%2653, %2654) : (i64, i64) -> i64
      %2656 = func.call @cc_values_pack(%2655) : (i64) -> i64
      func.call @stack_push_pointer(%2653) : (i64) -> ()
      %2657 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2658 = arith.constant 1 : i64
      %2659 = func.call @cc_make_string(%2657, %2658) : (!llvm.ptr, i64) -> i64
      %2660 = func.call @cc_nil_value() : () -> i64
      %2661 = func.call @cc_intern(%2659, %2660) : (i64, i64) -> i64
      %2662 = func.call @cc_nil_value() : () -> i64
      %2663 = func.call @cc_cons(%2661, %2662) : (i64, i64) -> i64
      %2664 = func.call @cc_values_pack(%2663) : (i64) -> i64
      func.call @stack_push_pointer(%2661) : (i64) -> ()
      %2665 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2666 = arith.constant 8 : i64
      %2667 = func.call @cc_make_string(%2665, %2666) : (!llvm.ptr, i64) -> i64
      %2668 = func.call @cc_nil_value() : () -> i64
      %2669 = func.call @cc_intern(%2667, %2668) : (i64, i64) -> i64
      %2670 = func.call @cc_nil_value() : () -> i64
      %2671 = func.call @cc_cons(%2669, %2670) : (i64, i64) -> i64
      %2672 = func.call @cc_values_pack(%2671) : (i64) -> i64
      func.call @stack_push_pointer(%2669) : (i64) -> ()
      %2673 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2674 = arith.constant 8 : i64
      %2675 = func.call @cc_make_string(%2673, %2674) : (!llvm.ptr, i64) -> i64
      %2676 = func.call @cc_nil_value() : () -> i64
      %2677 = func.call @cc_intern(%2675, %2676) : (i64, i64) -> i64
      %2678 = func.call @cc_nil_value() : () -> i64
      %2679 = func.call @cc_cons(%2677, %2678) : (i64, i64) -> i64
      %2680 = func.call @cc_values_pack(%2679) : (i64) -> i64
      func.call @stack_push_pointer(%2677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2681 = func.call @stack_pop_pointer() : () -> i64
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @cc_cons(%2682, %2681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %2684 = arith.addi %2683, %__rlasp_stack_elide_zero_164 : i64
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @cc_cons(%2685, %2684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %2687 = arith.addi %2686, %__rlasp_stack_elide_zero_165 : i64
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @cc_cons(%2688, %2687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2689) : (i64) -> ()
      %2690 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2691 = arith.constant 7 : i64
      %2692 = func.call @cc_make_string(%2690, %2691) : (!llvm.ptr, i64) -> i64
      %2693 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2694 = arith.constant 11 : i64
      %2695 = func.call @cc_make_string(%2693, %2694) : (!llvm.ptr, i64) -> i64
      %2696 = func.call @cc_intern(%2692, %2695) : (i64, i64) -> i64
      %2697 = func.call @cc_nil_value() : () -> i64
      %2698 = func.call @cc_cons(%2696, %2697) : (i64, i64) -> i64
      %2699 = func.call @cc_values_pack(%2698) : (i64) -> i64
      func.call @stack_push_pointer(%2696) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2700 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2701 = arith.constant 1 : i64
      %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
      %2703 = func.call @cc_nil_value() : () -> i64
      %2704 = func.call @cc_intern(%2702, %2703) : (i64, i64) -> i64
      %2705 = func.call @cc_nil_value() : () -> i64
      %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
      %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
      func.call @stack_push_pointer(%2704) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2708 = func.call @stack_pop_pointer() : () -> i64
      %2709 = func.call @stack_pop_pointer() : () -> i64
      %2710 = func.call @cc_cons(%2709, %2708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %2711 = arith.addi %2710, %__rlasp_stack_elide_zero_166 : i64
      %2712 = func.call @stack_pop_pointer() : () -> i64
      %2713 = func.call @cc_cons(%2712, %2711) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %2714 = arith.addi %2713, %__rlasp_stack_elide_zero_167 : i64
      %2715 = func.call @stack_pop_pointer() : () -> i64
      %2716 = func.call @cc_cons(%2715, %2714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2716) : (i64) -> ()
      %2717 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2718 = arith.constant 6 : i64
      %2719 = func.call @cc_make_string(%2717, %2718) : (!llvm.ptr, i64) -> i64
      %2720 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2721 = arith.constant 11 : i64
      %2722 = func.call @cc_make_string(%2720, %2721) : (!llvm.ptr, i64) -> i64
      %2723 = func.call @cc_intern(%2719, %2722) : (i64, i64) -> i64
      %2724 = func.call @cc_nil_value() : () -> i64
      %2725 = func.call @cc_cons(%2723, %2724) : (i64, i64) -> i64
      %2726 = func.call @cc_values_pack(%2725) : (i64) -> i64
      func.call @stack_push_pointer(%2723) : (i64) -> ()
      %2727 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2728 = arith.constant 7 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2731 = arith.constant 11 : i64
      %2732 = func.call @cc_make_string(%2730, %2731) : (!llvm.ptr, i64) -> i64
      %2733 = func.call @cc_intern(%2729, %2732) : (i64, i64) -> i64
      %2734 = func.call @cc_nil_value() : () -> i64
      %2735 = func.call @cc_cons(%2733, %2734) : (i64, i64) -> i64
      %2736 = func.call @cc_values_pack(%2735) : (i64) -> i64
      func.call @stack_push_pointer(%2733) : (i64) -> ()
      %2737 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2738 = arith.constant 1 : i64
      %2739 = func.call @cc_make_string(%2737, %2738) : (!llvm.ptr, i64) -> i64
      %2740 = func.call @cc_nil_value() : () -> i64
      %2741 = func.call @cc_intern(%2739, %2740) : (i64, i64) -> i64
      %2742 = func.call @cc_nil_value() : () -> i64
      %2743 = func.call @cc_cons(%2741, %2742) : (i64, i64) -> i64
      %2744 = func.call @cc_values_pack(%2743) : (i64) -> i64
      func.call @stack_push_pointer(%2741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2745 = func.call @stack_pop_pointer() : () -> i64
      %2746 = func.call @stack_pop_pointer() : () -> i64
      %2747 = func.call @cc_cons(%2746, %2745) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %2748 = arith.addi %2747, %__rlasp_stack_elide_zero_168 : i64
      %2749 = func.call @stack_pop_pointer() : () -> i64
      %2750 = func.call @cc_cons(%2749, %2748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2750) : (i64) -> ()
      %2751 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2752 = arith.constant 8 : i64
      %2753 = func.call @cc_make_string(%2751, %2752) : (!llvm.ptr, i64) -> i64
      %2754 = func.call @cc_nil_value() : () -> i64
      %2755 = func.call @cc_intern(%2753, %2754) : (i64, i64) -> i64
      %2756 = func.call @cc_nil_value() : () -> i64
      %2757 = func.call @cc_cons(%2755, %2756) : (i64, i64) -> i64
      %2758 = func.call @cc_values_pack(%2757) : (i64) -> i64
      func.call @stack_push_pointer(%2755) : (i64) -> ()
      %2759 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2760 = arith.constant 8 : i64
      %2761 = func.call @cc_make_string(%2759, %2760) : (!llvm.ptr, i64) -> i64
      %2762 = func.call @cc_nil_value() : () -> i64
      %2763 = func.call @cc_intern(%2761, %2762) : (i64, i64) -> i64
      %2764 = func.call @cc_nil_value() : () -> i64
      %2765 = func.call @cc_cons(%2763, %2764) : (i64, i64) -> i64
      %2766 = func.call @cc_values_pack(%2765) : (i64) -> i64
      func.call @stack_push_pointer(%2763) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @stack_pop_pointer() : () -> i64
      %2769 = func.call @cc_cons(%2768, %2767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %2770 = arith.addi %2769, %__rlasp_stack_elide_zero_169 : i64
      %2771 = func.call @stack_pop_pointer() : () -> i64
      %2772 = func.call @cc_cons(%2771, %2770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %2773 = arith.addi %2772, %__rlasp_stack_elide_zero_170 : i64
      %2774 = func.call @stack_pop_pointer() : () -> i64
      %2775 = func.call @cc_cons(%2774, %2773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %2776 = arith.addi %2775, %__rlasp_stack_elide_zero_171 : i64
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = func.call @cc_cons(%2777, %2776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2779 = func.call @stack_pop_pointer() : () -> i64
      %2780 = func.call @stack_pop_pointer() : () -> i64
      %2781 = func.call @cc_cons(%2780, %2779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %2782 = arith.addi %2781, %__rlasp_stack_elide_zero_172 : i64
      %2783 = func.call @stack_pop_pointer() : () -> i64
      %2784 = func.call @cc_cons(%2783, %2782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %2785 = arith.addi %2784, %__rlasp_stack_elide_zero_173 : i64
      %2786 = func.call @stack_pop_pointer() : () -> i64
      %2787 = func.call @cc_cons(%2786, %2785) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %2788 = arith.addi %2787, %__rlasp_stack_elide_zero_174 : i64
      %2789 = func.call @stack_pop_pointer() : () -> i64
      %2790 = func.call @cc_cons(%2789, %2788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2790) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2791 = func.call @stack_pop_pointer() : () -> i64
      %2792 = func.call @stack_pop_pointer() : () -> i64
      %2793 = func.call @cc_cons(%2792, %2791) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %2794 = arith.addi %2793, %__rlasp_stack_elide_zero_175 : i64
      %2795 = func.call @stack_pop_pointer() : () -> i64
      %2796 = func.call @cc_cons(%2795, %2794) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %2797 = arith.addi %2796, %__rlasp_stack_elide_zero_176 : i64
      %2798 = func.call @stack_pop_pointer() : () -> i64
      %2799 = func.call @cc_cons(%2798, %2797) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %2800 = arith.addi %2799, %__rlasp_stack_elide_zero_177 : i64
      %2889 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2890 = arith.constant 30 : i64
      %2891 = func.call @cc_make_symbol(%2889, %2890) : (!llvm.ptr, i64) -> i64
      %2892 = func.call @cc_persistent_root_value(%2891) : (i64) -> i64
      func.call @stack_push_pointer(%2892) : (i64) -> ()
      %2893 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2894 = arith.constant 37 : i64
      %2895 = func.call @cc_make_symbol(%2893, %2894) : (!llvm.ptr, i64) -> i64
      %2896 = func.call @cc_persistent_root_value(%2895) : (i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      %2897 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2898 = arith.constant 37 : i64
      %2899 = func.call @cc_make_symbol(%2897, %2898) : (!llvm.ptr, i64) -> i64
      %2900 = func.call @cc_persistent_root_value(%2899) : (i64) -> i64
      func.call @stack_push_pointer(%2900) : (i64) -> ()
      %2901 = arith.constant 275462358040604 : i64
      %2902 = arith.constant 3 : i64
      %2903 = func.call @cc_make_closure(%2901, %2902) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %2904 = arith.addi %2903, %__rlasp_stack_elide_zero_178 : i64
      %2905 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2906 = func.call @stack_pop_pointer() : () -> i64
      %2907 = func.call @stack_pop_pointer() : () -> i64
      %2908 = func.call @cc_cons(%2907, %2906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %2909 = arith.addi %2908, %__rlasp_stack_elide_zero_179 : i64
      %2910 = func.call @stack_pop_pointer() : () -> i64
      %2911 = func.call @cc_cons(%2910, %2909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %2912 = arith.addi %2911, %__rlasp_stack_elide_zero_180 : i64
      %2913 = func.call @stack_pop_pointer() : () -> i64
      %2914 = func.call @cc_cons(%2913, %2912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %2915 = arith.addi %2914, %__rlasp_stack_elide_zero_181 : i64
      %2916 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2917 = arith.constant 11 : i64
      %2918 = func.call @cc_make_string(%2916, %2917) : (!llvm.ptr, i64) -> i64
      %2919 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2920 = arith.constant 7 : i64
      %2921 = func.call @cc_make_string(%2919, %2920) : (!llvm.ptr, i64) -> i64
      %2922 = func.call @cc_intern(%2918, %2921) : (i64, i64) -> i64
      %2923 = func.call @cc_nil_value() : () -> i64
      %2924 = func.call @cc_cons(%2922, %2923) : (i64, i64) -> i64
      %2925 = func.call @cc_values_pack(%2924) : (i64) -> i64
      %2926 = func.call @cc_nil_value() : () -> i64
      %2927 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2928 = arith.constant 4 : i64
      %2929 = func.call @cc_make_string(%2927, %2928) : (!llvm.ptr, i64) -> i64
      %2930 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2931 = arith.constant 7 : i64
      %2932 = func.call @cc_make_string(%2930, %2931) : (!llvm.ptr, i64) -> i64
      %2933 = func.call @cc_intern(%2929, %2932) : (i64, i64) -> i64
      %2934 = func.call @cc_nil_value() : () -> i64
      %2935 = func.call @cc_cons(%2933, %2934) : (i64, i64) -> i64
      %2936 = func.call @cc_values_pack(%2935) : (i64) -> i64
      %2937 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2938 = arith.constant 6 : i64
      %2939 = func.call @cc_make_string(%2937, %2938) : (!llvm.ptr, i64) -> i64
      %2940 = func.call @cc_nil_value() : () -> i64
      %2941 = func.call @cc_intern(%2939, %2940) : (i64, i64) -> i64
      %2942 = func.call @cc_nil_value() : () -> i64
      %2943 = func.call @cc_cons(%2941, %2942) : (i64, i64) -> i64
      %2944 = func.call @cc_values_pack(%2943) : (i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %2945 = arith.addi %2941, %__rlasp_stack_elide_zero_182 : i64
      %2946 = func.call @cc_nil_value() : () -> i64
      %2947 = func.call @cc_errorp(%2462) : (i64) -> i64
      %2948 = arith.cmpi ne, %2947, %2946 : i64
      %2949 = arith.cmpi eq, %2946, %2946 : i64
      %2950 = arith.andi %2948, %2949 : i1
      %2951 = scf.if %2950 -> (i64) {
        scf.yield %2462 : i64
      } else {
        scf.yield %2946 : i64
      }
      %2952 = func.call @cc_errorp(%2800) : (i64) -> i64
      %2953 = arith.cmpi ne, %2952, %2946 : i64
      %2954 = arith.cmpi eq, %2951, %2946 : i64
      %2955 = arith.andi %2953, %2954 : i1
      %2956 = scf.if %2955 -> (i64) {
        scf.yield %2800 : i64
      } else {
        scf.yield %2951 : i64
      }
      %2957 = func.call @cc_errorp(%2904) : (i64) -> i64
      %2958 = arith.cmpi ne, %2957, %2946 : i64
      %2959 = arith.cmpi eq, %2956, %2946 : i64
      %2960 = arith.andi %2958, %2959 : i1
      %2961 = scf.if %2960 -> (i64) {
        scf.yield %2904 : i64
      } else {
        scf.yield %2956 : i64
      }
      %2962 = func.call @cc_errorp(%2915) : (i64) -> i64
      %2963 = arith.cmpi ne, %2962, %2946 : i64
      %2964 = arith.cmpi eq, %2961, %2946 : i64
      %2965 = arith.andi %2963, %2964 : i1
      %2966 = scf.if %2965 -> (i64) {
        scf.yield %2915 : i64
      } else {
        scf.yield %2961 : i64
      }
      %2967 = func.call @cc_errorp(%2922) : (i64) -> i64
      %2968 = arith.cmpi ne, %2967, %2946 : i64
      %2969 = arith.cmpi eq, %2966, %2946 : i64
      %2970 = arith.andi %2968, %2969 : i1
      %2971 = scf.if %2970 -> (i64) {
        scf.yield %2922 : i64
      } else {
        scf.yield %2966 : i64
      }
      %2972 = func.call @cc_errorp(%2926) : (i64) -> i64
      %2973 = arith.cmpi ne, %2972, %2946 : i64
      %2974 = arith.cmpi eq, %2971, %2946 : i64
      %2975 = arith.andi %2973, %2974 : i1
      %2976 = scf.if %2975 -> (i64) {
        scf.yield %2926 : i64
      } else {
        scf.yield %2971 : i64
      }
      %2977 = func.call @cc_errorp(%2933) : (i64) -> i64
      %2978 = arith.cmpi ne, %2977, %2946 : i64
      %2979 = arith.cmpi eq, %2976, %2946 : i64
      %2980 = arith.andi %2978, %2979 : i1
      %2981 = scf.if %2980 -> (i64) {
        scf.yield %2933 : i64
      } else {
        scf.yield %2976 : i64
      }
      %2982 = func.call @cc_errorp(%2945) : (i64) -> i64
      %2983 = arith.cmpi ne, %2982, %2946 : i64
      %2984 = arith.cmpi eq, %2981, %2946 : i64
      %2985 = arith.andi %2983, %2984 : i1
      %2986 = scf.if %2985 -> (i64) {
        scf.yield %2945 : i64
      } else {
        scf.yield %2981 : i64
      }
      %2987 = arith.cmpi ne, %2986, %2946 : i64
      scf.if %2987 {
        func.call @stack_push_pointer(%2986) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2462) : (i64) -> ()
        func.call @stack_push_pointer(%2800) : (i64) -> ()
        func.call @stack_push_pointer(%2904) : (i64) -> ()
        func.call @stack_push_pointer(%2915) : (i64) -> ()
        func.call @stack_push_pointer(%2922) : (i64) -> ()
        func.call @stack_push_pointer(%2926) : (i64) -> ()
        func.call @stack_push_pointer(%2933) : (i64) -> ()
        func.call @stack_push_pointer(%2945) : (i64) -> ()
        %2988 = llvm.mlir.addressof @str234 : !llvm.ptr
        %2989 = func.call @cc_make_function_ref_const(%2988) : (!llvm.ptr) -> i64
        %2990 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2989, %2990) : (i64, i64) -> ()
      }
      %2991 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2991 : i64
    }
    %2992 = func.call @cc_nil_value() : () -> i64
    %2993 = func.call @cc_errorp(%2453) : (i64) -> i64
    %2994 = arith.cmpi ne, %2993, %2992 : i64
    %2995 = scf.if %2994 -> (i64) {
      scf.yield %2453 : i64
    } else {
      %2996 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2997 = arith.constant 9 : i64
      %2998 = func.call @cc_make_string(%2996, %2997) : (!llvm.ptr, i64) -> i64
      %2999 = func.call @cc_nil_value() : () -> i64
      %3000 = func.call @cc_intern(%2998, %2999) : (i64, i64) -> i64
      %3001 = func.call @cc_nil_value() : () -> i64
      %3002 = func.call @cc_cons(%3000, %3001) : (i64, i64) -> i64
      %3003 = func.call @cc_values_pack(%3002) : (i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3004 = arith.addi %3000, %__rlasp_stack_elide_zero_183 : i64
      %3005 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3006 = arith.constant 19 : i64
      %3007 = func.call @cc_make_string(%3005, %3006) : (!llvm.ptr, i64) -> i64
      %3008 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3009 = arith.constant 11 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = func.call @cc_intern(%3007, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_nil_value() : () -> i64
      %3013 = func.call @cc_cons(%3011, %3012) : (i64, i64) -> i64
      %3014 = func.call @cc_values_pack(%3013) : (i64) -> i64
      func.call @stack_push_pointer(%3011) : (i64) -> ()
      %3015 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3016 = arith.constant 1 : i64
      %3017 = func.call @cc_make_string(%3015, %3016) : (!llvm.ptr, i64) -> i64
      %3018 = func.call @cc_nil_value() : () -> i64
      %3019 = func.call @cc_intern(%3017, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_nil_value() : () -> i64
      %3021 = func.call @cc_cons(%3019, %3020) : (i64, i64) -> i64
      %3022 = func.call @cc_values_pack(%3021) : (i64) -> i64
      func.call @stack_push_pointer(%3019) : (i64) -> ()
      %3023 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3024 = arith.constant 9 : i64
      %3025 = func.call @cc_make_string(%3023, %3024) : (!llvm.ptr, i64) -> i64
      %3026 = func.call @cc_nil_value() : () -> i64
      %3027 = func.call @cc_intern(%3025, %3026) : (i64, i64) -> i64
      %3028 = func.call @cc_nil_value() : () -> i64
      %3029 = func.call @cc_cons(%3027, %3028) : (i64, i64) -> i64
      %3030 = func.call @cc_values_pack(%3029) : (i64) -> i64
      func.call @stack_push_pointer(%3027) : (i64) -> ()
      %3031 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3032 = arith.constant 8 : i64
      %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
      %3034 = func.call @cc_nil_value() : () -> i64
      %3035 = func.call @cc_intern(%3033, %3034) : (i64, i64) -> i64
      %3036 = func.call @cc_nil_value() : () -> i64
      %3037 = func.call @cc_cons(%3035, %3036) : (i64, i64) -> i64
      %3038 = func.call @cc_values_pack(%3037) : (i64) -> i64
      func.call @stack_push_pointer(%3035) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3039 = func.call @stack_pop_pointer() : () -> i64
      %3040 = func.call @stack_pop_pointer() : () -> i64
      %3041 = func.call @cc_cons(%3040, %3039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3042 = arith.addi %3041, %__rlasp_stack_elide_zero_184 : i64
      %3043 = func.call @stack_pop_pointer() : () -> i64
      %3044 = func.call @cc_cons(%3043, %3042) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3045 = arith.addi %3044, %__rlasp_stack_elide_zero_185 : i64
      %3046 = func.call @stack_pop_pointer() : () -> i64
      %3047 = func.call @cc_cons(%3046, %3045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3047) : (i64) -> ()
      %3048 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3049 = arith.constant 7 : i64
      %3050 = func.call @cc_make_string(%3048, %3049) : (!llvm.ptr, i64) -> i64
      %3051 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3052 = arith.constant 11 : i64
      %3053 = func.call @cc_make_string(%3051, %3052) : (!llvm.ptr, i64) -> i64
      %3054 = func.call @cc_intern(%3050, %3053) : (i64, i64) -> i64
      %3055 = func.call @cc_nil_value() : () -> i64
      %3056 = func.call @cc_cons(%3054, %3055) : (i64, i64) -> i64
      %3057 = func.call @cc_values_pack(%3056) : (i64) -> i64
      func.call @stack_push_pointer(%3054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3058 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3059 = arith.constant 11 : i64
      %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
      %3061 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3062 = arith.constant 3 : i64
      %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
      %3064 = func.call @cc_intern(%3060, %3063) : (i64, i64) -> i64
      %3065 = func.call @cc_nil_value() : () -> i64
      %3066 = func.call @cc_cons(%3064, %3065) : (i64, i64) -> i64
      %3067 = func.call @cc_values_pack(%3066) : (i64) -> i64
      func.call @stack_push_pointer(%3064) : (i64) -> ()
      %3068 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3068) : (i64) -> ()
      %3069 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3070 = arith.constant 6 : i64
      %3071 = func.call @cc_make_string(%3069, %3070) : (!llvm.ptr, i64) -> i64
      %3072 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3073 = arith.constant 11 : i64
      %3074 = func.call @cc_make_string(%3072, %3073) : (!llvm.ptr, i64) -> i64
      %3075 = func.call @cc_intern(%3071, %3074) : (i64, i64) -> i64
      %3076 = func.call @cc_nil_value() : () -> i64
      %3077 = func.call @cc_cons(%3075, %3076) : (i64, i64) -> i64
      %3078 = func.call @cc_values_pack(%3077) : (i64) -> i64
      func.call @stack_push_pointer(%3075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3079 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3080 = arith.constant 15 : i64
      %3081 = func.call @cc_make_string(%3079, %3080) : (!llvm.ptr, i64) -> i64
      %3082 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3083 = arith.constant 11 : i64
      %3084 = func.call @cc_make_string(%3082, %3083) : (!llvm.ptr, i64) -> i64
      %3085 = func.call @cc_intern(%3081, %3084) : (i64, i64) -> i64
      %3086 = func.call @cc_nil_value() : () -> i64
      %3087 = func.call @cc_cons(%3085, %3086) : (i64, i64) -> i64
      %3088 = func.call @cc_values_pack(%3087) : (i64) -> i64
      func.call @stack_push_pointer(%3085) : (i64) -> ()
      %3089 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3090 = arith.constant 1 : i64
      %3091 = func.call @cc_make_string(%3089, %3090) : (!llvm.ptr, i64) -> i64
      %3092 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3093 = arith.constant 11 : i64
      %3094 = func.call @cc_make_string(%3092, %3093) : (!llvm.ptr, i64) -> i64
      %3095 = func.call @cc_intern(%3091, %3094) : (i64, i64) -> i64
      %3096 = func.call @cc_nil_value() : () -> i64
      %3097 = func.call @cc_cons(%3095, %3096) : (i64, i64) -> i64
      %3098 = func.call @cc_values_pack(%3097) : (i64) -> i64
      func.call @stack_push_pointer(%3095) : (i64) -> ()
      %3099 = arith.constant 189 : i64
      func.call @stack_push_fixnum(%3099) : (i64) -> ()
      %3100 = arith.constant 911 : i64
      func.call @stack_push_fixnum(%3100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3101 = func.call @stack_pop_pointer() : () -> i64
      %3102 = func.call @stack_pop_pointer() : () -> i64
      %3103 = func.call @cc_cons(%3102, %3101) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3104 = arith.addi %3103, %__rlasp_stack_elide_zero_186 : i64
      %3105 = func.call @stack_pop_pointer() : () -> i64
      %3106 = func.call @cc_cons(%3105, %3104) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3107 = arith.addi %3106, %__rlasp_stack_elide_zero_187 : i64
      %3108 = func.call @stack_pop_pointer() : () -> i64
      %3109 = func.call @cc_cons(%3108, %3107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3109) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3110 = func.call @stack_pop_pointer() : () -> i64
      %3111 = func.call @stack_pop_pointer() : () -> i64
      %3112 = func.call @cc_cons(%3111, %3110) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3113 = arith.addi %3112, %__rlasp_stack_elide_zero_188 : i64
      %3114 = func.call @stack_pop_pointer() : () -> i64
      %3115 = func.call @cc_cons(%3114, %3113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @stack_pop_pointer() : () -> i64
      %3118 = func.call @cc_cons(%3117, %3116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3119 = arith.addi %3118, %__rlasp_stack_elide_zero_189 : i64
      %3120 = func.call @stack_pop_pointer() : () -> i64
      %3121 = func.call @cc_cons(%3120, %3119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3122 = arith.addi %3121, %__rlasp_stack_elide_zero_190 : i64
      %3123 = func.call @stack_pop_pointer() : () -> i64
      %3124 = func.call @cc_cons(%3123, %3122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3125 = arith.addi %3124, %__rlasp_stack_elide_zero_191 : i64
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = func.call @cc_cons(%3125, %3126) : (i64, i64) -> i64
      %3128 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3129 = arith.constant 5 : i64
      %3130 = func.call @cc_make_string(%3128, %3129) : (!llvm.ptr, i64) -> i64
      %3131 = func.call @cc_nil_value() : () -> i64
      %3132 = func.call @cc_intern(%3130, %3131) : (i64, i64) -> i64
      %3133 = func.call @cc_nil_value() : () -> i64
      %3134 = func.call @cc_cons(%3132, %3133) : (i64, i64) -> i64
      %3135 = func.call @cc_values_pack(%3134) : (i64) -> i64
      %3136 = func.call @cc_cons(%3132, %3127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3136) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = func.call @stack_pop_pointer() : () -> i64
      %3139 = func.call @cc_cons(%3138, %3137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3140 = arith.addi %3139, %__rlasp_stack_elide_zero_192 : i64
      %3141 = func.call @stack_pop_pointer() : () -> i64
      %3142 = func.call @cc_cons(%3141, %3140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3142) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @stack_pop_pointer() : () -> i64
      %3145 = func.call @cc_cons(%3144, %3143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3146 = arith.addi %3145, %__rlasp_stack_elide_zero_193 : i64
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @cc_cons(%3147, %3146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3149 = arith.addi %3148, %__rlasp_stack_elide_zero_194 : i64
      %3150 = func.call @stack_pop_pointer() : () -> i64
      %3151 = func.call @cc_cons(%3150, %3149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      %3152 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3153 = arith.constant 6 : i64
      %3154 = func.call @cc_make_string(%3152, %3153) : (!llvm.ptr, i64) -> i64
      %3155 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3156 = arith.constant 11 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = func.call @cc_intern(%3154, %3157) : (i64, i64) -> i64
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = func.call @cc_cons(%3158, %3159) : (i64, i64) -> i64
      %3161 = func.call @cc_values_pack(%3160) : (i64) -> i64
      func.call @stack_push_pointer(%3158) : (i64) -> ()
      %3162 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3163 = arith.constant 7 : i64
      %3164 = func.call @cc_make_string(%3162, %3163) : (!llvm.ptr, i64) -> i64
      %3165 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3166 = arith.constant 11 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = func.call @cc_intern(%3164, %3167) : (i64, i64) -> i64
      %3169 = func.call @cc_nil_value() : () -> i64
      %3170 = func.call @cc_cons(%3168, %3169) : (i64, i64) -> i64
      %3171 = func.call @cc_values_pack(%3170) : (i64) -> i64
      func.call @stack_push_pointer(%3168) : (i64) -> ()
      %3172 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3173 = arith.constant 1 : i64
      %3174 = func.call @cc_make_string(%3172, %3173) : (!llvm.ptr, i64) -> i64
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_intern(%3174, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_nil_value() : () -> i64
      %3178 = func.call @cc_cons(%3176, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_values_pack(%3178) : (i64) -> i64
      func.call @stack_push_pointer(%3176) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3180 = func.call @stack_pop_pointer() : () -> i64
      %3181 = func.call @stack_pop_pointer() : () -> i64
      %3182 = func.call @cc_cons(%3181, %3180) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %3183 = arith.addi %3182, %__rlasp_stack_elide_zero_195 : i64
      %3184 = func.call @stack_pop_pointer() : () -> i64
      %3185 = func.call @cc_cons(%3184, %3183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3185) : (i64) -> ()
      %3186 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3187 = arith.constant 9 : i64
      %3188 = func.call @cc_make_string(%3186, %3187) : (!llvm.ptr, i64) -> i64
      %3189 = func.call @cc_nil_value() : () -> i64
      %3190 = func.call @cc_intern(%3188, %3189) : (i64, i64) -> i64
      %3191 = func.call @cc_nil_value() : () -> i64
      %3192 = func.call @cc_cons(%3190, %3191) : (i64, i64) -> i64
      %3193 = func.call @cc_values_pack(%3192) : (i64) -> i64
      func.call @stack_push_pointer(%3190) : (i64) -> ()
      %3194 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3195 = arith.constant 8 : i64
      %3196 = func.call @cc_make_string(%3194, %3195) : (!llvm.ptr, i64) -> i64
      %3197 = func.call @cc_nil_value() : () -> i64
      %3198 = func.call @cc_intern(%3196, %3197) : (i64, i64) -> i64
      %3199 = func.call @cc_nil_value() : () -> i64
      %3200 = func.call @cc_cons(%3198, %3199) : (i64, i64) -> i64
      %3201 = func.call @cc_values_pack(%3200) : (i64) -> i64
      func.call @stack_push_pointer(%3198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3202 = func.call @stack_pop_pointer() : () -> i64
      %3203 = func.call @stack_pop_pointer() : () -> i64
      %3204 = func.call @cc_cons(%3203, %3202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %3205 = arith.addi %3204, %__rlasp_stack_elide_zero_196 : i64
      %3206 = func.call @stack_pop_pointer() : () -> i64
      %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %3208 = arith.addi %3207, %__rlasp_stack_elide_zero_197 : i64
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @cc_cons(%3209, %3208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %3211 = arith.addi %3210, %__rlasp_stack_elide_zero_198 : i64
      %3212 = func.call @stack_pop_pointer() : () -> i64
      %3213 = func.call @cc_cons(%3212, %3211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3213) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @cc_cons(%3215, %3214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %3217 = arith.addi %3216, %__rlasp_stack_elide_zero_199 : i64
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @cc_cons(%3218, %3217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %3220 = arith.addi %3219, %__rlasp_stack_elide_zero_200 : i64
      %3221 = func.call @stack_pop_pointer() : () -> i64
      %3222 = func.call @cc_cons(%3221, %3220) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %3223 = arith.addi %3222, %__rlasp_stack_elide_zero_201 : i64
      %3224 = func.call @stack_pop_pointer() : () -> i64
      %3225 = func.call @cc_cons(%3224, %3223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %3226 = arith.addi %3225, %__rlasp_stack_elide_zero_202 : i64
      %3316 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3317 = arith.constant 30 : i64
      %3318 = func.call @cc_make_symbol(%3316, %3317) : (!llvm.ptr, i64) -> i64
      %3319 = func.call @cc_persistent_root_value(%3318) : (i64) -> i64
      func.call @stack_push_pointer(%3319) : (i64) -> ()
      %3320 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3321 = arith.constant 37 : i64
      %3322 = func.call @cc_make_symbol(%3320, %3321) : (!llvm.ptr, i64) -> i64
      %3323 = func.call @cc_persistent_root_value(%3322) : (i64) -> i64
      func.call @stack_push_pointer(%3323) : (i64) -> ()
      %3324 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3325 = arith.constant 38 : i64
      %3326 = func.call @cc_make_symbol(%3324, %3325) : (!llvm.ptr, i64) -> i64
      %3327 = func.call @cc_persistent_root_value(%3326) : (i64) -> i64
      func.call @stack_push_pointer(%3327) : (i64) -> ()
      %3328 = arith.constant 275462358040612 : i64
      %3329 = arith.constant 3 : i64
      %3330 = func.call @cc_make_closure(%3328, %3329) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %3331 = arith.addi %3330, %__rlasp_stack_elide_zero_203 : i64
      %3332 = arith.constant 1100 : i64
      func.call @stack_push_fixnum(%3332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3333 = func.call @stack_pop_pointer() : () -> i64
      %3334 = func.call @stack_pop_pointer() : () -> i64
      %3335 = func.call @cc_cons(%3334, %3333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %3336 = arith.addi %3335, %__rlasp_stack_elide_zero_204 : i64
      %3337 = func.call @stack_pop_pointer() : () -> i64
      %3338 = func.call @cc_cons(%3337, %3336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %3339 = arith.addi %3338, %__rlasp_stack_elide_zero_205 : i64
      %3340 = func.call @stack_pop_pointer() : () -> i64
      %3341 = func.call @cc_cons(%3340, %3339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %3342 = arith.addi %3341, %__rlasp_stack_elide_zero_206 : i64
      %3343 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3344 = arith.constant 11 : i64
      %3345 = func.call @cc_make_string(%3343, %3344) : (!llvm.ptr, i64) -> i64
      %3346 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3347 = arith.constant 7 : i64
      %3348 = func.call @cc_make_string(%3346, %3347) : (!llvm.ptr, i64) -> i64
      %3349 = func.call @cc_intern(%3345, %3348) : (i64, i64) -> i64
      %3350 = func.call @cc_nil_value() : () -> i64
      %3351 = func.call @cc_cons(%3349, %3350) : (i64, i64) -> i64
      %3352 = func.call @cc_values_pack(%3351) : (i64) -> i64
      %3353 = func.call @cc_nil_value() : () -> i64
      %3354 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3355 = arith.constant 4 : i64
      %3356 = func.call @cc_make_string(%3354, %3355) : (!llvm.ptr, i64) -> i64
      %3357 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3358 = arith.constant 7 : i64
      %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
      %3360 = func.call @cc_intern(%3356, %3359) : (i64, i64) -> i64
      %3361 = func.call @cc_nil_value() : () -> i64
      %3362 = func.call @cc_cons(%3360, %3361) : (i64, i64) -> i64
      %3363 = func.call @cc_values_pack(%3362) : (i64) -> i64
      %3364 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3365 = arith.constant 6 : i64
      %3366 = func.call @cc_make_string(%3364, %3365) : (!llvm.ptr, i64) -> i64
      %3367 = func.call @cc_nil_value() : () -> i64
      %3368 = func.call @cc_intern(%3366, %3367) : (i64, i64) -> i64
      %3369 = func.call @cc_nil_value() : () -> i64
      %3370 = func.call @cc_cons(%3368, %3369) : (i64, i64) -> i64
      %3371 = func.call @cc_values_pack(%3370) : (i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %3372 = arith.addi %3368, %__rlasp_stack_elide_zero_207 : i64
      %3373 = func.call @cc_nil_value() : () -> i64
      %3374 = func.call @cc_errorp(%3004) : (i64) -> i64
      %3375 = arith.cmpi ne, %3374, %3373 : i64
      %3376 = arith.cmpi eq, %3373, %3373 : i64
      %3377 = arith.andi %3375, %3376 : i1
      %3378 = scf.if %3377 -> (i64) {
        scf.yield %3004 : i64
      } else {
        scf.yield %3373 : i64
      }
      %3379 = func.call @cc_errorp(%3226) : (i64) -> i64
      %3380 = arith.cmpi ne, %3379, %3373 : i64
      %3381 = arith.cmpi eq, %3378, %3373 : i64
      %3382 = arith.andi %3380, %3381 : i1
      %3383 = scf.if %3382 -> (i64) {
        scf.yield %3226 : i64
      } else {
        scf.yield %3378 : i64
      }
      %3384 = func.call @cc_errorp(%3331) : (i64) -> i64
      %3385 = arith.cmpi ne, %3384, %3373 : i64
      %3386 = arith.cmpi eq, %3383, %3373 : i64
      %3387 = arith.andi %3385, %3386 : i1
      %3388 = scf.if %3387 -> (i64) {
        scf.yield %3331 : i64
      } else {
        scf.yield %3383 : i64
      }
      %3389 = func.call @cc_errorp(%3342) : (i64) -> i64
      %3390 = arith.cmpi ne, %3389, %3373 : i64
      %3391 = arith.cmpi eq, %3388, %3373 : i64
      %3392 = arith.andi %3390, %3391 : i1
      %3393 = scf.if %3392 -> (i64) {
        scf.yield %3342 : i64
      } else {
        scf.yield %3388 : i64
      }
      %3394 = func.call @cc_errorp(%3349) : (i64) -> i64
      %3395 = arith.cmpi ne, %3394, %3373 : i64
      %3396 = arith.cmpi eq, %3393, %3373 : i64
      %3397 = arith.andi %3395, %3396 : i1
      %3398 = scf.if %3397 -> (i64) {
        scf.yield %3349 : i64
      } else {
        scf.yield %3393 : i64
      }
      %3399 = func.call @cc_errorp(%3353) : (i64) -> i64
      %3400 = arith.cmpi ne, %3399, %3373 : i64
      %3401 = arith.cmpi eq, %3398, %3373 : i64
      %3402 = arith.andi %3400, %3401 : i1
      %3403 = scf.if %3402 -> (i64) {
        scf.yield %3353 : i64
      } else {
        scf.yield %3398 : i64
      }
      %3404 = func.call @cc_errorp(%3360) : (i64) -> i64
      %3405 = arith.cmpi ne, %3404, %3373 : i64
      %3406 = arith.cmpi eq, %3403, %3373 : i64
      %3407 = arith.andi %3405, %3406 : i1
      %3408 = scf.if %3407 -> (i64) {
        scf.yield %3360 : i64
      } else {
        scf.yield %3403 : i64
      }
      %3409 = func.call @cc_errorp(%3372) : (i64) -> i64
      %3410 = arith.cmpi ne, %3409, %3373 : i64
      %3411 = arith.cmpi eq, %3408, %3373 : i64
      %3412 = arith.andi %3410, %3411 : i1
      %3413 = scf.if %3412 -> (i64) {
        scf.yield %3372 : i64
      } else {
        scf.yield %3408 : i64
      }
      %3414 = arith.cmpi ne, %3413, %3373 : i64
      scf.if %3414 {
        func.call @stack_push_pointer(%3413) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3004) : (i64) -> ()
        func.call @stack_push_pointer(%3226) : (i64) -> ()
        func.call @stack_push_pointer(%3331) : (i64) -> ()
        func.call @stack_push_pointer(%3342) : (i64) -> ()
        func.call @stack_push_pointer(%3349) : (i64) -> ()
        func.call @stack_push_pointer(%3353) : (i64) -> ()
        func.call @stack_push_pointer(%3360) : (i64) -> ()
        func.call @stack_push_pointer(%3372) : (i64) -> ()
        %3415 = llvm.mlir.addressof @str268 : !llvm.ptr
        %3416 = func.call @cc_make_function_ref_const(%3415) : (!llvm.ptr) -> i64
        %3417 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3416, %3417) : (i64, i64) -> ()
      }
      %3418 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3418 : i64
    }
    %3419 = func.call @cc_nil_value() : () -> i64
    %3420 = func.call @cc_errorp(%2995) : (i64) -> i64
    %3421 = arith.cmpi ne, %3420, %3419 : i64
    %3422 = scf.if %3421 -> (i64) {
      scf.yield %2995 : i64
    } else {
      %3423 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3424 = arith.constant 18 : i64
      %3425 = func.call @cc_make_string(%3423, %3424) : (!llvm.ptr, i64) -> i64
      %3426 = func.call @cc_nil_value() : () -> i64
      %3427 = func.call @cc_intern(%3425, %3426) : (i64, i64) -> i64
      %3428 = func.call @cc_nil_value() : () -> i64
      %3429 = func.call @cc_cons(%3427, %3428) : (i64, i64) -> i64
      %3430 = func.call @cc_values_pack(%3429) : (i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %3431 = arith.addi %3427, %__rlasp_stack_elide_zero_208 : i64
      %3432 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3433 = arith.constant 19 : i64
      %3434 = func.call @cc_make_string(%3432, %3433) : (!llvm.ptr, i64) -> i64
      %3435 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3436 = arith.constant 11 : i64
      %3437 = func.call @cc_make_string(%3435, %3436) : (!llvm.ptr, i64) -> i64
      %3438 = func.call @cc_intern(%3434, %3437) : (i64, i64) -> i64
      %3439 = func.call @cc_nil_value() : () -> i64
      %3440 = func.call @cc_cons(%3438, %3439) : (i64, i64) -> i64
      %3441 = func.call @cc_values_pack(%3440) : (i64) -> i64
      func.call @stack_push_pointer(%3438) : (i64) -> ()
      %3442 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3443 = arith.constant 1 : i64
      %3444 = func.call @cc_make_string(%3442, %3443) : (!llvm.ptr, i64) -> i64
      %3445 = func.call @cc_nil_value() : () -> i64
      %3446 = func.call @cc_intern(%3444, %3445) : (i64, i64) -> i64
      %3447 = func.call @cc_nil_value() : () -> i64
      %3448 = func.call @cc_cons(%3446, %3447) : (i64, i64) -> i64
      %3449 = func.call @cc_values_pack(%3448) : (i64) -> i64
      func.call @stack_push_pointer(%3446) : (i64) -> ()
      %3450 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3451 = arith.constant 9 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = func.call @cc_nil_value() : () -> i64
      %3454 = func.call @cc_intern(%3452, %3453) : (i64, i64) -> i64
      %3455 = func.call @cc_nil_value() : () -> i64
      %3456 = func.call @cc_cons(%3454, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_values_pack(%3456) : (i64) -> i64
      func.call @stack_push_pointer(%3454) : (i64) -> ()
      %3458 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3459 = arith.constant 8 : i64
      %3460 = func.call @cc_make_string(%3458, %3459) : (!llvm.ptr, i64) -> i64
      %3461 = func.call @cc_nil_value() : () -> i64
      %3462 = func.call @cc_intern(%3460, %3461) : (i64, i64) -> i64
      %3463 = func.call @cc_nil_value() : () -> i64
      %3464 = func.call @cc_cons(%3462, %3463) : (i64, i64) -> i64
      %3465 = func.call @cc_values_pack(%3464) : (i64) -> i64
      func.call @stack_push_pointer(%3462) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3466 = func.call @stack_pop_pointer() : () -> i64
      %3467 = func.call @stack_pop_pointer() : () -> i64
      %3468 = func.call @cc_cons(%3467, %3466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %3469 = arith.addi %3468, %__rlasp_stack_elide_zero_209 : i64
      %3470 = func.call @stack_pop_pointer() : () -> i64
      %3471 = func.call @cc_cons(%3470, %3469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %3472 = arith.addi %3471, %__rlasp_stack_elide_zero_210 : i64
      %3473 = func.call @stack_pop_pointer() : () -> i64
      %3474 = func.call @cc_cons(%3473, %3472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3474) : (i64) -> ()
      %3475 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3476 = arith.constant 7 : i64
      %3477 = func.call @cc_make_string(%3475, %3476) : (!llvm.ptr, i64) -> i64
      %3478 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3479 = arith.constant 11 : i64
      %3480 = func.call @cc_make_string(%3478, %3479) : (!llvm.ptr, i64) -> i64
      %3481 = func.call @cc_intern(%3477, %3480) : (i64, i64) -> i64
      %3482 = func.call @cc_nil_value() : () -> i64
      %3483 = func.call @cc_cons(%3481, %3482) : (i64, i64) -> i64
      %3484 = func.call @cc_values_pack(%3483) : (i64) -> i64
      func.call @stack_push_pointer(%3481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3485 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3486 = arith.constant 11 : i64
      %3487 = func.call @cc_make_string(%3485, %3486) : (!llvm.ptr, i64) -> i64
      %3488 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3489 = arith.constant 3 : i64
      %3490 = func.call @cc_make_string(%3488, %3489) : (!llvm.ptr, i64) -> i64
      %3491 = func.call @cc_intern(%3487, %3490) : (i64, i64) -> i64
      %3492 = func.call @cc_nil_value() : () -> i64
      %3493 = func.call @cc_cons(%3491, %3492) : (i64, i64) -> i64
      %3494 = func.call @cc_values_pack(%3493) : (i64) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      %3495 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3495) : (i64) -> ()
      %3496 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3497 = arith.constant 6 : i64
      %3498 = func.call @cc_make_string(%3496, %3497) : (!llvm.ptr, i64) -> i64
      %3499 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3500 = arith.constant 11 : i64
      %3501 = func.call @cc_make_string(%3499, %3500) : (!llvm.ptr, i64) -> i64
      %3502 = func.call @cc_intern(%3498, %3501) : (i64, i64) -> i64
      %3503 = func.call @cc_nil_value() : () -> i64
      %3504 = func.call @cc_cons(%3502, %3503) : (i64, i64) -> i64
      %3505 = func.call @cc_values_pack(%3504) : (i64) -> i64
      func.call @stack_push_pointer(%3502) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3506 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3507 = arith.constant 15 : i64
      %3508 = func.call @cc_make_string(%3506, %3507) : (!llvm.ptr, i64) -> i64
      %3509 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3510 = arith.constant 11 : i64
      %3511 = func.call @cc_make_string(%3509, %3510) : (!llvm.ptr, i64) -> i64
      %3512 = func.call @cc_intern(%3508, %3511) : (i64, i64) -> i64
      %3513 = func.call @cc_nil_value() : () -> i64
      %3514 = func.call @cc_cons(%3512, %3513) : (i64, i64) -> i64
      %3515 = func.call @cc_values_pack(%3514) : (i64) -> i64
      func.call @stack_push_pointer(%3512) : (i64) -> ()
      %3516 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3517 = arith.constant 1 : i64
      %3518 = func.call @cc_make_string(%3516, %3517) : (!llvm.ptr, i64) -> i64
      %3519 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3520 = arith.constant 11 : i64
      %3521 = func.call @cc_make_string(%3519, %3520) : (!llvm.ptr, i64) -> i64
      %3522 = func.call @cc_intern(%3518, %3521) : (i64, i64) -> i64
      %3523 = func.call @cc_nil_value() : () -> i64
      %3524 = func.call @cc_cons(%3522, %3523) : (i64, i64) -> i64
      %3525 = func.call @cc_values_pack(%3524) : (i64) -> i64
      func.call @stack_push_pointer(%3522) : (i64) -> ()
      %3526 = arith.constant 189 : i64
      func.call @stack_push_fixnum(%3526) : (i64) -> ()
      %3527 = arith.constant 911 : i64
      func.call @stack_push_fixnum(%3527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3528 = func.call @stack_pop_pointer() : () -> i64
      %3529 = func.call @stack_pop_pointer() : () -> i64
      %3530 = func.call @cc_cons(%3529, %3528) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %3531 = arith.addi %3530, %__rlasp_stack_elide_zero_211 : i64
      %3532 = func.call @stack_pop_pointer() : () -> i64
      %3533 = func.call @cc_cons(%3532, %3531) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %3534 = arith.addi %3533, %__rlasp_stack_elide_zero_212 : i64
      %3535 = func.call @stack_pop_pointer() : () -> i64
      %3536 = func.call @cc_cons(%3535, %3534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3536) : (i64) -> ()
      %3537 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3538 = arith.constant 1 : i64
      %3539 = func.call @cc_make_string(%3537, %3538) : (!llvm.ptr, i64) -> i64
      %3540 = func.call @cc_nil_value() : () -> i64
      %3541 = func.call @cc_intern(%3539, %3540) : (i64, i64) -> i64
      %3542 = func.call @cc_nil_value() : () -> i64
      %3543 = func.call @cc_cons(%3541, %3542) : (i64, i64) -> i64
      %3544 = func.call @cc_values_pack(%3543) : (i64) -> i64
      func.call @stack_push_pointer(%3541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3545 = func.call @stack_pop_pointer() : () -> i64
      %3546 = func.call @stack_pop_pointer() : () -> i64
      %3547 = func.call @cc_cons(%3546, %3545) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %3548 = arith.addi %3547, %__rlasp_stack_elide_zero_213 : i64
      %3549 = func.call @stack_pop_pointer() : () -> i64
      %3550 = func.call @cc_cons(%3549, %3548) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %3551 = arith.addi %3550, %__rlasp_stack_elide_zero_214 : i64
      %3552 = func.call @stack_pop_pointer() : () -> i64
      %3553 = func.call @cc_cons(%3552, %3551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3553) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3554 = func.call @stack_pop_pointer() : () -> i64
      %3555 = func.call @stack_pop_pointer() : () -> i64
      %3556 = func.call @cc_cons(%3555, %3554) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %3557 = arith.addi %3556, %__rlasp_stack_elide_zero_215 : i64
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = func.call @cc_cons(%3558, %3557) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %3560 = arith.addi %3559, %__rlasp_stack_elide_zero_216 : i64
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @cc_cons(%3561, %3560) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %3563 = arith.addi %3562, %__rlasp_stack_elide_zero_217 : i64
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3565 = func.call @cc_cons(%3563, %3564) : (i64, i64) -> i64
      %3566 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3567 = arith.constant 5 : i64
      %3568 = func.call @cc_make_string(%3566, %3567) : (!llvm.ptr, i64) -> i64
      %3569 = func.call @cc_nil_value() : () -> i64
      %3570 = func.call @cc_intern(%3568, %3569) : (i64, i64) -> i64
      %3571 = func.call @cc_nil_value() : () -> i64
      %3572 = func.call @cc_cons(%3570, %3571) : (i64, i64) -> i64
      %3573 = func.call @cc_values_pack(%3572) : (i64) -> i64
      %3574 = func.call @cc_cons(%3570, %3565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3574) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3575 = func.call @stack_pop_pointer() : () -> i64
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @cc_cons(%3576, %3575) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %3578 = arith.addi %3577, %__rlasp_stack_elide_zero_218 : i64
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @cc_cons(%3579, %3578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3580) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3581 = func.call @stack_pop_pointer() : () -> i64
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @cc_cons(%3582, %3581) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %3584 = arith.addi %3583, %__rlasp_stack_elide_zero_219 : i64
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = func.call @cc_cons(%3585, %3584) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %3587 = arith.addi %3586, %__rlasp_stack_elide_zero_220 : i64
      %3588 = func.call @stack_pop_pointer() : () -> i64
      %3589 = func.call @cc_cons(%3588, %3587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3589) : (i64) -> ()
      %3590 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3591 = arith.constant 6 : i64
      %3592 = func.call @cc_make_string(%3590, %3591) : (!llvm.ptr, i64) -> i64
      %3593 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3594 = arith.constant 11 : i64
      %3595 = func.call @cc_make_string(%3593, %3594) : (!llvm.ptr, i64) -> i64
      %3596 = func.call @cc_intern(%3592, %3595) : (i64, i64) -> i64
      %3597 = func.call @cc_nil_value() : () -> i64
      %3598 = func.call @cc_cons(%3596, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_values_pack(%3598) : (i64) -> i64
      func.call @stack_push_pointer(%3596) : (i64) -> ()
      %3600 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3601 = arith.constant 7 : i64
      %3602 = func.call @cc_make_string(%3600, %3601) : (!llvm.ptr, i64) -> i64
      %3603 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3604 = arith.constant 11 : i64
      %3605 = func.call @cc_make_string(%3603, %3604) : (!llvm.ptr, i64) -> i64
      %3606 = func.call @cc_intern(%3602, %3605) : (i64, i64) -> i64
      %3607 = func.call @cc_nil_value() : () -> i64
      %3608 = func.call @cc_cons(%3606, %3607) : (i64, i64) -> i64
      %3609 = func.call @cc_values_pack(%3608) : (i64) -> i64
      func.call @stack_push_pointer(%3606) : (i64) -> ()
      %3610 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3611 = arith.constant 1 : i64
      %3612 = func.call @cc_make_string(%3610, %3611) : (!llvm.ptr, i64) -> i64
      %3613 = func.call @cc_nil_value() : () -> i64
      %3614 = func.call @cc_intern(%3612, %3613) : (i64, i64) -> i64
      %3615 = func.call @cc_nil_value() : () -> i64
      %3616 = func.call @cc_cons(%3614, %3615) : (i64, i64) -> i64
      %3617 = func.call @cc_values_pack(%3616) : (i64) -> i64
      func.call @stack_push_pointer(%3614) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @stack_pop_pointer() : () -> i64
      %3620 = func.call @cc_cons(%3619, %3618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %3621 = arith.addi %3620, %__rlasp_stack_elide_zero_221 : i64
      %3622 = func.call @stack_pop_pointer() : () -> i64
      %3623 = func.call @cc_cons(%3622, %3621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3623) : (i64) -> ()
      %3624 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3625 = arith.constant 9 : i64
      %3626 = func.call @cc_make_string(%3624, %3625) : (!llvm.ptr, i64) -> i64
      %3627 = func.call @cc_nil_value() : () -> i64
      %3628 = func.call @cc_intern(%3626, %3627) : (i64, i64) -> i64
      %3629 = func.call @cc_nil_value() : () -> i64
      %3630 = func.call @cc_cons(%3628, %3629) : (i64, i64) -> i64
      %3631 = func.call @cc_values_pack(%3630) : (i64) -> i64
      func.call @stack_push_pointer(%3628) : (i64) -> ()
      %3632 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3633 = arith.constant 8 : i64
      %3634 = func.call @cc_make_string(%3632, %3633) : (!llvm.ptr, i64) -> i64
      %3635 = func.call @cc_nil_value() : () -> i64
      %3636 = func.call @cc_intern(%3634, %3635) : (i64, i64) -> i64
      %3637 = func.call @cc_nil_value() : () -> i64
      %3638 = func.call @cc_cons(%3636, %3637) : (i64, i64) -> i64
      %3639 = func.call @cc_values_pack(%3638) : (i64) -> i64
      func.call @stack_push_pointer(%3636) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3640 = func.call @stack_pop_pointer() : () -> i64
      %3641 = func.call @stack_pop_pointer() : () -> i64
      %3642 = func.call @cc_cons(%3641, %3640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %3643 = arith.addi %3642, %__rlasp_stack_elide_zero_222 : i64
      %3644 = func.call @stack_pop_pointer() : () -> i64
      %3645 = func.call @cc_cons(%3644, %3643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %3646 = arith.addi %3645, %__rlasp_stack_elide_zero_223 : i64
      %3647 = func.call @stack_pop_pointer() : () -> i64
      %3648 = func.call @cc_cons(%3647, %3646) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %3649 = arith.addi %3648, %__rlasp_stack_elide_zero_224 : i64
      %3650 = func.call @stack_pop_pointer() : () -> i64
      %3651 = func.call @cc_cons(%3650, %3649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3651) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3652 = func.call @stack_pop_pointer() : () -> i64
      %3653 = func.call @stack_pop_pointer() : () -> i64
      %3654 = func.call @cc_cons(%3653, %3652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %3655 = arith.addi %3654, %__rlasp_stack_elide_zero_225 : i64
      %3656 = func.call @stack_pop_pointer() : () -> i64
      %3657 = func.call @cc_cons(%3656, %3655) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %3658 = arith.addi %3657, %__rlasp_stack_elide_zero_226 : i64
      %3659 = func.call @stack_pop_pointer() : () -> i64
      %3660 = func.call @cc_cons(%3659, %3658) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %3661 = arith.addi %3660, %__rlasp_stack_elide_zero_227 : i64
      %3662 = func.call @stack_pop_pointer() : () -> i64
      %3663 = func.call @cc_cons(%3662, %3661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %3664 = arith.addi %3663, %__rlasp_stack_elide_zero_228 : i64
      %3754 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3755 = arith.constant 30 : i64
      %3756 = func.call @cc_make_symbol(%3754, %3755) : (!llvm.ptr, i64) -> i64
      %3757 = func.call @cc_persistent_root_value(%3756) : (i64) -> i64
      func.call @stack_push_pointer(%3757) : (i64) -> ()
      %3758 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3759 = arith.constant 37 : i64
      %3760 = func.call @cc_make_symbol(%3758, %3759) : (!llvm.ptr, i64) -> i64
      %3761 = func.call @cc_persistent_root_value(%3760) : (i64) -> i64
      func.call @stack_push_pointer(%3761) : (i64) -> ()
      %3762 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3763 = arith.constant 38 : i64
      %3764 = func.call @cc_make_symbol(%3762, %3763) : (!llvm.ptr, i64) -> i64
      %3765 = func.call @cc_persistent_root_value(%3764) : (i64) -> i64
      func.call @stack_push_pointer(%3765) : (i64) -> ()
      %3766 = arith.constant 275462358040617 : i64
      %3767 = arith.constant 3 : i64
      %3768 = func.call @cc_make_closure(%3766, %3767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %3769 = arith.addi %3768, %__rlasp_stack_elide_zero_229 : i64
      %3770 = arith.constant 1100 : i64
      func.call @stack_push_fixnum(%3770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3771 = func.call @stack_pop_pointer() : () -> i64
      %3772 = func.call @stack_pop_pointer() : () -> i64
      %3773 = func.call @cc_cons(%3772, %3771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %3774 = arith.addi %3773, %__rlasp_stack_elide_zero_230 : i64
      %3775 = func.call @stack_pop_pointer() : () -> i64
      %3776 = func.call @cc_cons(%3775, %3774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %3777 = arith.addi %3776, %__rlasp_stack_elide_zero_231 : i64
      %3778 = func.call @stack_pop_pointer() : () -> i64
      %3779 = func.call @cc_cons(%3778, %3777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %3780 = arith.addi %3779, %__rlasp_stack_elide_zero_232 : i64
      %3781 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3782 = arith.constant 11 : i64
      %3783 = func.call @cc_make_string(%3781, %3782) : (!llvm.ptr, i64) -> i64
      %3784 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3785 = arith.constant 7 : i64
      %3786 = func.call @cc_make_string(%3784, %3785) : (!llvm.ptr, i64) -> i64
      %3787 = func.call @cc_intern(%3783, %3786) : (i64, i64) -> i64
      %3788 = func.call @cc_nil_value() : () -> i64
      %3789 = func.call @cc_cons(%3787, %3788) : (i64, i64) -> i64
      %3790 = func.call @cc_values_pack(%3789) : (i64) -> i64
      %3791 = func.call @cc_nil_value() : () -> i64
      %3792 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3793 = arith.constant 4 : i64
      %3794 = func.call @cc_make_string(%3792, %3793) : (!llvm.ptr, i64) -> i64
      %3795 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3796 = arith.constant 7 : i64
      %3797 = func.call @cc_make_string(%3795, %3796) : (!llvm.ptr, i64) -> i64
      %3798 = func.call @cc_intern(%3794, %3797) : (i64, i64) -> i64
      %3799 = func.call @cc_nil_value() : () -> i64
      %3800 = func.call @cc_cons(%3798, %3799) : (i64, i64) -> i64
      %3801 = func.call @cc_values_pack(%3800) : (i64) -> i64
      %3802 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3803 = arith.constant 6 : i64
      %3804 = func.call @cc_make_string(%3802, %3803) : (!llvm.ptr, i64) -> i64
      %3805 = func.call @cc_nil_value() : () -> i64
      %3806 = func.call @cc_intern(%3804, %3805) : (i64, i64) -> i64
      %3807 = func.call @cc_nil_value() : () -> i64
      %3808 = func.call @cc_cons(%3806, %3807) : (i64, i64) -> i64
      %3809 = func.call @cc_values_pack(%3808) : (i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %3810 = arith.addi %3806, %__rlasp_stack_elide_zero_233 : i64
      %3811 = func.call @cc_nil_value() : () -> i64
      %3812 = func.call @cc_errorp(%3431) : (i64) -> i64
      %3813 = arith.cmpi ne, %3812, %3811 : i64
      %3814 = arith.cmpi eq, %3811, %3811 : i64
      %3815 = arith.andi %3813, %3814 : i1
      %3816 = scf.if %3815 -> (i64) {
        scf.yield %3431 : i64
      } else {
        scf.yield %3811 : i64
      }
      %3817 = func.call @cc_errorp(%3664) : (i64) -> i64
      %3818 = arith.cmpi ne, %3817, %3811 : i64
      %3819 = arith.cmpi eq, %3816, %3811 : i64
      %3820 = arith.andi %3818, %3819 : i1
      %3821 = scf.if %3820 -> (i64) {
        scf.yield %3664 : i64
      } else {
        scf.yield %3816 : i64
      }
      %3822 = func.call @cc_errorp(%3769) : (i64) -> i64
      %3823 = arith.cmpi ne, %3822, %3811 : i64
      %3824 = arith.cmpi eq, %3821, %3811 : i64
      %3825 = arith.andi %3823, %3824 : i1
      %3826 = scf.if %3825 -> (i64) {
        scf.yield %3769 : i64
      } else {
        scf.yield %3821 : i64
      }
      %3827 = func.call @cc_errorp(%3780) : (i64) -> i64
      %3828 = arith.cmpi ne, %3827, %3811 : i64
      %3829 = arith.cmpi eq, %3826, %3811 : i64
      %3830 = arith.andi %3828, %3829 : i1
      %3831 = scf.if %3830 -> (i64) {
        scf.yield %3780 : i64
      } else {
        scf.yield %3826 : i64
      }
      %3832 = func.call @cc_errorp(%3787) : (i64) -> i64
      %3833 = arith.cmpi ne, %3832, %3811 : i64
      %3834 = arith.cmpi eq, %3831, %3811 : i64
      %3835 = arith.andi %3833, %3834 : i1
      %3836 = scf.if %3835 -> (i64) {
        scf.yield %3787 : i64
      } else {
        scf.yield %3831 : i64
      }
      %3837 = func.call @cc_errorp(%3791) : (i64) -> i64
      %3838 = arith.cmpi ne, %3837, %3811 : i64
      %3839 = arith.cmpi eq, %3836, %3811 : i64
      %3840 = arith.andi %3838, %3839 : i1
      %3841 = scf.if %3840 -> (i64) {
        scf.yield %3791 : i64
      } else {
        scf.yield %3836 : i64
      }
      %3842 = func.call @cc_errorp(%3798) : (i64) -> i64
      %3843 = arith.cmpi ne, %3842, %3811 : i64
      %3844 = arith.cmpi eq, %3841, %3811 : i64
      %3845 = arith.andi %3843, %3844 : i1
      %3846 = scf.if %3845 -> (i64) {
        scf.yield %3798 : i64
      } else {
        scf.yield %3841 : i64
      }
      %3847 = func.call @cc_errorp(%3810) : (i64) -> i64
      %3848 = arith.cmpi ne, %3847, %3811 : i64
      %3849 = arith.cmpi eq, %3846, %3811 : i64
      %3850 = arith.andi %3848, %3849 : i1
      %3851 = scf.if %3850 -> (i64) {
        scf.yield %3810 : i64
      } else {
        scf.yield %3846 : i64
      }
      %3852 = arith.cmpi ne, %3851, %3811 : i64
      scf.if %3852 {
        func.call @stack_push_pointer(%3851) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3431) : (i64) -> ()
        func.call @stack_push_pointer(%3664) : (i64) -> ()
        func.call @stack_push_pointer(%3769) : (i64) -> ()
        func.call @stack_push_pointer(%3780) : (i64) -> ()
        func.call @stack_push_pointer(%3787) : (i64) -> ()
        func.call @stack_push_pointer(%3791) : (i64) -> ()
        func.call @stack_push_pointer(%3798) : (i64) -> ()
        func.call @stack_push_pointer(%3810) : (i64) -> ()
        %3853 = llvm.mlir.addressof @str303 : !llvm.ptr
        %3854 = func.call @cc_make_function_ref_const(%3853) : (!llvm.ptr) -> i64
        %3855 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3854, %3855) : (i64, i64) -> ()
      }
      %3856 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3856 : i64
    }
    %3857 = func.call @cc_nil_value() : () -> i64
    %3858 = func.call @cc_errorp(%3422) : (i64) -> i64
    %3859 = arith.cmpi ne, %3858, %3857 : i64
    %3860 = scf.if %3859 -> (i64) {
      scf.yield %3422 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %3861 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3862 = func.call @stack_pop_pointer() : () -> i64
      %3863 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3864 = arith.constant 10 : i64
      %3865 = func.call @cc_make_string(%3863, %3864) : (!llvm.ptr, i64) -> i64
      %3866 = func.call @cc_nil_value() : () -> i64
      %3867 = func.call @cc_intern(%3865, %3866) : (i64, i64) -> i64
      %3868 = func.call @cc_nil_value() : () -> i64
      %3869 = func.call @cc_cons(%3867, %3868) : (i64, i64) -> i64
      %3870 = func.call @cc_values_pack(%3869) : (i64) -> i64
      %3871 = func.call @cc_defclass(%3867, %3861, %3862) : (i64, i64, i64) -> i64
      %3872 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3872) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3873 = func.call @stack_pop_pointer() : () -> i64
      %3874 = func.call @stack_pop_pointer() : () -> i64
      %3875 = func.call @cc_cons(%3873, %3874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3875) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3876 = func.call @stack_pop_pointer() : () -> i64
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @cc_cons(%3876, %3877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3878) : (i64) -> ()
      %3879 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3880 = arith.constant 10 : i64
      %3881 = func.call @cc_make_string(%3879, %3880) : (!llvm.ptr, i64) -> i64
      %3882 = func.call @cc_nil_value() : () -> i64
      %3883 = func.call @cc_intern(%3881, %3882) : (i64, i64) -> i64
      %3884 = func.call @cc_nil_value() : () -> i64
      %3885 = func.call @cc_cons(%3883, %3884) : (i64, i64) -> i64
      %3886 = func.call @cc_values_pack(%3885) : (i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %3887 = arith.addi %3883, %__rlasp_stack_elide_zero_234 : i64
      %3888 = func.call @stack_pop_pointer() : () -> i64
      %3889 = func.call @cc_cons(%3887, %3888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3889) : (i64) -> ()
      %3890 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3891 = arith.constant 8 : i64
      %3892 = func.call @cc_make_string(%3890, %3891) : (!llvm.ptr, i64) -> i64
      %3893 = func.call @cc_nil_value() : () -> i64
      %3894 = func.call @cc_intern(%3892, %3893) : (i64, i64) -> i64
      %3895 = func.call @cc_nil_value() : () -> i64
      %3896 = func.call @cc_cons(%3894, %3895) : (i64, i64) -> i64
      %3897 = func.call @cc_values_pack(%3896) : (i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %3898 = arith.addi %3894, %__rlasp_stack_elide_zero_235 : i64
      %3899 = func.call @stack_pop_pointer() : () -> i64
      %3900 = func.call @cc_cons(%3898, %3899) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %3901 = arith.addi %3900, %__rlasp_stack_elide_zero_236 : i64
      %3902 = func.call @cc_nil_value() : () -> i64
      %3903 = func.call @cc_cons(%3901, %3902) : (i64, i64) -> i64
      %3904 = func.call @cc_eval(%3903) : (i64) -> i64
      %3905 = func.call @cc_multiple_value_list(%3904) : (i64) -> i64
      %3906 = func.call @cc_values_pack(%3905) : (i64) -> i64
      func.call @stack_push_pointer(%3906) : (i64) -> ()
      %3907 = func.call @stack_depth() : () -> i64
      %3908 = arith.constant 0 : i64
      %3909 = arith.cmpi sgt, %3907, %3908 : i64
      scf.if %3909 {
        %3910 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %3911 = arith.addi %3867, %__rlasp_stack_elide_zero_237 : i64
      scf.yield %3911 : i64
    }
    %3912 = func.call @cc_nil_value() : () -> i64
    %3913 = func.call @cc_errorp(%3860) : (i64) -> i64
    %3914 = arith.cmpi ne, %3913, %3912 : i64
    %3915 = scf.if %3914 -> (i64) {
      scf.yield %3860 : i64
    } else {
      %3916 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3917 = arith.constant 9 : i64
      %3918 = func.call @cc_make_string(%3916, %3917) : (!llvm.ptr, i64) -> i64
      %3919 = func.call @cc_nil_value() : () -> i64
      %3920 = func.call @cc_intern(%3918, %3919) : (i64, i64) -> i64
      %3921 = func.call @cc_nil_value() : () -> i64
      %3922 = func.call @cc_cons(%3920, %3921) : (i64, i64) -> i64
      %3923 = func.call @cc_values_pack(%3922) : (i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %3924 = arith.addi %3920, %__rlasp_stack_elide_zero_238 : i64
      %3925 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3926 = arith.constant 19 : i64
      %3927 = func.call @cc_make_string(%3925, %3926) : (!llvm.ptr, i64) -> i64
      %3928 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3929 = arith.constant 11 : i64
      %3930 = func.call @cc_make_string(%3928, %3929) : (!llvm.ptr, i64) -> i64
      %3931 = func.call @cc_intern(%3927, %3930) : (i64, i64) -> i64
      %3932 = func.call @cc_nil_value() : () -> i64
      %3933 = func.call @cc_cons(%3931, %3932) : (i64, i64) -> i64
      %3934 = func.call @cc_values_pack(%3933) : (i64) -> i64
      func.call @stack_push_pointer(%3931) : (i64) -> ()
      %3935 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3936 = arith.constant 1 : i64
      %3937 = func.call @cc_make_string(%3935, %3936) : (!llvm.ptr, i64) -> i64
      %3938 = func.call @cc_nil_value() : () -> i64
      %3939 = func.call @cc_intern(%3937, %3938) : (i64, i64) -> i64
      %3940 = func.call @cc_nil_value() : () -> i64
      %3941 = func.call @cc_cons(%3939, %3940) : (i64, i64) -> i64
      %3942 = func.call @cc_values_pack(%3941) : (i64) -> i64
      func.call @stack_push_pointer(%3939) : (i64) -> ()
      %3943 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3944 = arith.constant 9 : i64
      %3945 = func.call @cc_make_string(%3943, %3944) : (!llvm.ptr, i64) -> i64
      %3946 = func.call @cc_nil_value() : () -> i64
      %3947 = func.call @cc_intern(%3945, %3946) : (i64, i64) -> i64
      %3948 = func.call @cc_nil_value() : () -> i64
      %3949 = func.call @cc_cons(%3947, %3948) : (i64, i64) -> i64
      %3950 = func.call @cc_values_pack(%3949) : (i64) -> i64
      func.call @stack_push_pointer(%3947) : (i64) -> ()
      %3951 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3952 = arith.constant 8 : i64
      %3953 = func.call @cc_make_string(%3951, %3952) : (!llvm.ptr, i64) -> i64
      %3954 = func.call @cc_nil_value() : () -> i64
      %3955 = func.call @cc_intern(%3953, %3954) : (i64, i64) -> i64
      %3956 = func.call @cc_nil_value() : () -> i64
      %3957 = func.call @cc_cons(%3955, %3956) : (i64, i64) -> i64
      %3958 = func.call @cc_values_pack(%3957) : (i64) -> i64
      func.call @stack_push_pointer(%3955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3959 = func.call @stack_pop_pointer() : () -> i64
      %3960 = func.call @stack_pop_pointer() : () -> i64
      %3961 = func.call @cc_cons(%3960, %3959) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %3962 = arith.addi %3961, %__rlasp_stack_elide_zero_239 : i64
      %3963 = func.call @stack_pop_pointer() : () -> i64
      %3964 = func.call @cc_cons(%3963, %3962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %3965 = arith.addi %3964, %__rlasp_stack_elide_zero_240 : i64
      %3966 = func.call @stack_pop_pointer() : () -> i64
      %3967 = func.call @cc_cons(%3966, %3965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3967) : (i64) -> ()
      %3968 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3969 = arith.constant 7 : i64
      %3970 = func.call @cc_make_string(%3968, %3969) : (!llvm.ptr, i64) -> i64
      %3971 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3972 = arith.constant 11 : i64
      %3973 = func.call @cc_make_string(%3971, %3972) : (!llvm.ptr, i64) -> i64
      %3974 = func.call @cc_intern(%3970, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_nil_value() : () -> i64
      %3976 = func.call @cc_cons(%3974, %3975) : (i64, i64) -> i64
      %3977 = func.call @cc_values_pack(%3976) : (i64) -> i64
      func.call @stack_push_pointer(%3974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3978 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3979 = arith.constant 11 : i64
      %3980 = func.call @cc_make_string(%3978, %3979) : (!llvm.ptr, i64) -> i64
      %3981 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3982 = arith.constant 3 : i64
      %3983 = func.call @cc_make_string(%3981, %3982) : (!llvm.ptr, i64) -> i64
      %3984 = func.call @cc_intern(%3980, %3983) : (i64, i64) -> i64
      %3985 = func.call @cc_nil_value() : () -> i64
      %3986 = func.call @cc_cons(%3984, %3985) : (i64, i64) -> i64
      %3987 = func.call @cc_values_pack(%3986) : (i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      %3988 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3988) : (i64) -> ()
      %3989 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3990 = arith.constant 6 : i64
      %3991 = func.call @cc_make_string(%3989, %3990) : (!llvm.ptr, i64) -> i64
      %3992 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3993 = arith.constant 11 : i64
      %3994 = func.call @cc_make_string(%3992, %3993) : (!llvm.ptr, i64) -> i64
      %3995 = func.call @cc_intern(%3991, %3994) : (i64, i64) -> i64
      %3996 = func.call @cc_nil_value() : () -> i64
      %3997 = func.call @cc_cons(%3995, %3996) : (i64, i64) -> i64
      %3998 = func.call @cc_values_pack(%3997) : (i64) -> i64
      func.call @stack_push_pointer(%3995) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3999 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4000 = arith.constant 15 : i64
      %4001 = func.call @cc_make_string(%3999, %4000) : (!llvm.ptr, i64) -> i64
      %4002 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4003 = arith.constant 11 : i64
      %4004 = func.call @cc_make_string(%4002, %4003) : (!llvm.ptr, i64) -> i64
      %4005 = func.call @cc_intern(%4001, %4004) : (i64, i64) -> i64
      %4006 = func.call @cc_nil_value() : () -> i64
      %4007 = func.call @cc_cons(%4005, %4006) : (i64, i64) -> i64
      %4008 = func.call @cc_values_pack(%4007) : (i64) -> i64
      func.call @stack_push_pointer(%4005) : (i64) -> ()
      %4009 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4010 = arith.constant 13 : i64
      %4011 = func.call @cc_make_string(%4009, %4010) : (!llvm.ptr, i64) -> i64
      %4012 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4013 = arith.constant 11 : i64
      %4014 = func.call @cc_make_string(%4012, %4013) : (!llvm.ptr, i64) -> i64
      %4015 = func.call @cc_intern(%4011, %4014) : (i64, i64) -> i64
      %4016 = func.call @cc_nil_value() : () -> i64
      %4017 = func.call @cc_cons(%4015, %4016) : (i64, i64) -> i64
      %4018 = func.call @cc_values_pack(%4017) : (i64) -> i64
      func.call @stack_push_pointer(%4015) : (i64) -> ()
      %4019 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4019) : (i64) -> ()
      %4020 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4021 = arith.constant 10 : i64
      %4022 = func.call @cc_make_string(%4020, %4021) : (!llvm.ptr, i64) -> i64
      %4023 = func.call @cc_nil_value() : () -> i64
      %4024 = func.call @cc_intern(%4022, %4023) : (i64, i64) -> i64
      %4025 = func.call @cc_nil_value() : () -> i64
      %4026 = func.call @cc_cons(%4024, %4025) : (i64, i64) -> i64
      %4027 = func.call @cc_values_pack(%4026) : (i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %4028 = arith.addi %4024, %__rlasp_stack_elide_zero_241 : i64
      %4029 = func.call @stack_pop_pointer() : () -> i64
      %4030 = func.call @cc_cons(%4028, %4029) : (i64, i64) -> i64
      %4031 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4032 = arith.constant 5 : i64
      %4033 = func.call @cc_make_string(%4031, %4032) : (!llvm.ptr, i64) -> i64
      %4034 = func.call @cc_nil_value() : () -> i64
      %4035 = func.call @cc_intern(%4033, %4034) : (i64, i64) -> i64
      %4036 = func.call @cc_nil_value() : () -> i64
      %4037 = func.call @cc_cons(%4035, %4036) : (i64, i64) -> i64
      %4038 = func.call @cc_values_pack(%4037) : (i64) -> i64
      %4039 = func.call @cc_cons(%4035, %4030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4040 = func.call @stack_pop_pointer() : () -> i64
      %4041 = func.call @stack_pop_pointer() : () -> i64
      %4042 = func.call @cc_cons(%4041, %4040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %4043 = arith.addi %4042, %__rlasp_stack_elide_zero_242 : i64
      %4044 = func.call @stack_pop_pointer() : () -> i64
      %4045 = func.call @cc_cons(%4044, %4043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4046 = func.call @stack_pop_pointer() : () -> i64
      %4047 = func.call @stack_pop_pointer() : () -> i64
      %4048 = func.call @cc_cons(%4047, %4046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %4049 = arith.addi %4048, %__rlasp_stack_elide_zero_243 : i64
      %4050 = func.call @stack_pop_pointer() : () -> i64
      %4051 = func.call @cc_cons(%4050, %4049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4051) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4052 = func.call @stack_pop_pointer() : () -> i64
      %4053 = func.call @stack_pop_pointer() : () -> i64
      %4054 = func.call @cc_cons(%4053, %4052) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %4055 = arith.addi %4054, %__rlasp_stack_elide_zero_244 : i64
      %4056 = func.call @stack_pop_pointer() : () -> i64
      %4057 = func.call @cc_cons(%4056, %4055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %4058 = arith.addi %4057, %__rlasp_stack_elide_zero_245 : i64
      %4059 = func.call @stack_pop_pointer() : () -> i64
      %4060 = func.call @cc_cons(%4059, %4058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %4061 = arith.addi %4060, %__rlasp_stack_elide_zero_246 : i64
      %4062 = func.call @stack_pop_pointer() : () -> i64
      %4063 = func.call @cc_cons(%4061, %4062) : (i64, i64) -> i64
      %4064 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4065 = arith.constant 5 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = func.call @cc_nil_value() : () -> i64
      %4068 = func.call @cc_intern(%4066, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_nil_value() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_values_pack(%4070) : (i64) -> i64
      %4072 = func.call @cc_cons(%4068, %4063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4072) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4073 = func.call @stack_pop_pointer() : () -> i64
      %4074 = func.call @stack_pop_pointer() : () -> i64
      %4075 = func.call @cc_cons(%4074, %4073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %4076 = arith.addi %4075, %__rlasp_stack_elide_zero_247 : i64
      %4077 = func.call @stack_pop_pointer() : () -> i64
      %4078 = func.call @cc_cons(%4077, %4076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4079 = func.call @stack_pop_pointer() : () -> i64
      %4080 = func.call @stack_pop_pointer() : () -> i64
      %4081 = func.call @cc_cons(%4080, %4079) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %4082 = arith.addi %4081, %__rlasp_stack_elide_zero_248 : i64
      %4083 = func.call @stack_pop_pointer() : () -> i64
      %4084 = func.call @cc_cons(%4083, %4082) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %4085 = arith.addi %4084, %__rlasp_stack_elide_zero_249 : i64
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @cc_cons(%4086, %4085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4087) : (i64) -> ()
      %4088 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4089 = arith.constant 6 : i64
      %4090 = func.call @cc_make_string(%4088, %4089) : (!llvm.ptr, i64) -> i64
      %4091 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4092 = arith.constant 11 : i64
      %4093 = func.call @cc_make_string(%4091, %4092) : (!llvm.ptr, i64) -> i64
      %4094 = func.call @cc_intern(%4090, %4093) : (i64, i64) -> i64
      %4095 = func.call @cc_nil_value() : () -> i64
      %4096 = func.call @cc_cons(%4094, %4095) : (i64, i64) -> i64
      %4097 = func.call @cc_values_pack(%4096) : (i64) -> i64
      func.call @stack_push_pointer(%4094) : (i64) -> ()
      %4098 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4099 = arith.constant 10 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4102 = arith.constant 11 : i64
      %4103 = func.call @cc_make_string(%4101, %4102) : (!llvm.ptr, i64) -> i64
      %4104 = func.call @cc_intern(%4100, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_cons(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_values_pack(%4106) : (i64) -> i64
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4108 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4109 = arith.constant 8 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4112 = arith.constant 11 : i64
      %4113 = func.call @cc_make_string(%4111, %4112) : (!llvm.ptr, i64) -> i64
      %4114 = func.call @cc_intern(%4110, %4113) : (i64, i64) -> i64
      %4115 = func.call @cc_nil_value() : () -> i64
      %4116 = func.call @cc_cons(%4114, %4115) : (i64, i64) -> i64
      %4117 = func.call @cc_values_pack(%4116) : (i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4118 = llvm.mlir.addressof @str332 : !llvm.ptr
      %4119 = arith.constant 7 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4122 = arith.constant 11 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_intern(%4120, %4123) : (i64, i64) -> i64
      %4125 = func.call @cc_nil_value() : () -> i64
      %4126 = func.call @cc_cons(%4124, %4125) : (i64, i64) -> i64
      %4127 = func.call @cc_values_pack(%4126) : (i64) -> i64
      func.call @stack_push_pointer(%4124) : (i64) -> ()
      %4128 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4129 = arith.constant 1 : i64
      %4130 = func.call @cc_make_string(%4128, %4129) : (!llvm.ptr, i64) -> i64
      %4131 = func.call @cc_nil_value() : () -> i64
      %4132 = func.call @cc_intern(%4130, %4131) : (i64, i64) -> i64
      %4133 = func.call @cc_nil_value() : () -> i64
      %4134 = func.call @cc_cons(%4132, %4133) : (i64, i64) -> i64
      %4135 = func.call @cc_values_pack(%4134) : (i64) -> i64
      func.call @stack_push_pointer(%4132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = func.call @stack_pop_pointer() : () -> i64
      %4138 = func.call @cc_cons(%4137, %4136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %4139 = arith.addi %4138, %__rlasp_stack_elide_zero_250 : i64
      %4140 = func.call @stack_pop_pointer() : () -> i64
      %4141 = func.call @cc_cons(%4140, %4139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4142 = func.call @stack_pop_pointer() : () -> i64
      %4143 = func.call @stack_pop_pointer() : () -> i64
      %4144 = func.call @cc_cons(%4143, %4142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %4145 = arith.addi %4144, %__rlasp_stack_elide_zero_251 : i64
      %4146 = func.call @stack_pop_pointer() : () -> i64
      %4147 = func.call @cc_cons(%4146, %4145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4148 = func.call @stack_pop_pointer() : () -> i64
      %4149 = func.call @stack_pop_pointer() : () -> i64
      %4150 = func.call @cc_cons(%4149, %4148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %4151 = arith.addi %4150, %__rlasp_stack_elide_zero_252 : i64
      %4152 = func.call @stack_pop_pointer() : () -> i64
      %4153 = func.call @cc_cons(%4152, %4151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4153) : (i64) -> ()
      %4154 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4155 = arith.constant 9 : i64
      %4156 = func.call @cc_make_string(%4154, %4155) : (!llvm.ptr, i64) -> i64
      %4157 = func.call @cc_nil_value() : () -> i64
      %4158 = func.call @cc_intern(%4156, %4157) : (i64, i64) -> i64
      %4159 = func.call @cc_nil_value() : () -> i64
      %4160 = func.call @cc_cons(%4158, %4159) : (i64, i64) -> i64
      %4161 = func.call @cc_values_pack(%4160) : (i64) -> i64
      func.call @stack_push_pointer(%4158) : (i64) -> ()
      %4162 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4163 = arith.constant 8 : i64
      %4164 = func.call @cc_make_string(%4162, %4163) : (!llvm.ptr, i64) -> i64
      %4165 = func.call @cc_nil_value() : () -> i64
      %4166 = func.call @cc_intern(%4164, %4165) : (i64, i64) -> i64
      %4167 = func.call @cc_nil_value() : () -> i64
      %4168 = func.call @cc_cons(%4166, %4167) : (i64, i64) -> i64
      %4169 = func.call @cc_values_pack(%4168) : (i64) -> i64
      func.call @stack_push_pointer(%4166) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4170 = func.call @stack_pop_pointer() : () -> i64
      %4171 = func.call @stack_pop_pointer() : () -> i64
      %4172 = func.call @cc_cons(%4171, %4170) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %4173 = arith.addi %4172, %__rlasp_stack_elide_zero_253 : i64
      %4174 = func.call @stack_pop_pointer() : () -> i64
      %4175 = func.call @cc_cons(%4174, %4173) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %4176 = arith.addi %4175, %__rlasp_stack_elide_zero_254 : i64
      %4177 = func.call @stack_pop_pointer() : () -> i64
      %4178 = func.call @cc_cons(%4177, %4176) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %4179 = arith.addi %4178, %__rlasp_stack_elide_zero_255 : i64
      %4180 = func.call @stack_pop_pointer() : () -> i64
      %4181 = func.call @cc_cons(%4180, %4179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4181) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4182 = func.call @stack_pop_pointer() : () -> i64
      %4183 = func.call @stack_pop_pointer() : () -> i64
      %4184 = func.call @cc_cons(%4183, %4182) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %4185 = arith.addi %4184, %__rlasp_stack_elide_zero_256 : i64
      %4186 = func.call @stack_pop_pointer() : () -> i64
      %4187 = func.call @cc_cons(%4186, %4185) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %4188 = arith.addi %4187, %__rlasp_stack_elide_zero_257 : i64
      %4189 = func.call @stack_pop_pointer() : () -> i64
      %4190 = func.call @cc_cons(%4189, %4188) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %4191 = arith.addi %4190, %__rlasp_stack_elide_zero_258 : i64
      %4192 = func.call @stack_pop_pointer() : () -> i64
      %4193 = func.call @cc_cons(%4192, %4191) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %4194 = arith.addi %4193, %__rlasp_stack_elide_zero_259 : i64
      %4270 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4271 = arith.constant 30 : i64
      %4272 = func.call @cc_make_symbol(%4270, %4271) : (!llvm.ptr, i64) -> i64
      %4273 = func.call @cc_persistent_root_value(%4272) : (i64) -> i64
      func.call @stack_push_pointer(%4273) : (i64) -> ()
      %4274 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4275 = arith.constant 37 : i64
      %4276 = func.call @cc_make_symbol(%4274, %4275) : (!llvm.ptr, i64) -> i64
      %4277 = func.call @cc_persistent_root_value(%4276) : (i64) -> i64
      func.call @stack_push_pointer(%4277) : (i64) -> ()
      %4278 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4279 = arith.constant 38 : i64
      %4280 = func.call @cc_make_symbol(%4278, %4279) : (!llvm.ptr, i64) -> i64
      %4281 = func.call @cc_persistent_root_value(%4280) : (i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4282 = arith.constant 275462358040622 : i64
      %4283 = arith.constant 3 : i64
      %4284 = func.call @cc_make_closure(%4282, %4283) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %4285 = arith.addi %4284, %__rlasp_stack_elide_zero_260 : i64
      %4286 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4287 = arith.constant 10 : i64
      %4288 = func.call @cc_make_string(%4286, %4287) : (!llvm.ptr, i64) -> i64
      %4289 = func.call @cc_nil_value() : () -> i64
      %4290 = func.call @cc_intern(%4288, %4289) : (i64, i64) -> i64
      %4291 = func.call @cc_nil_value() : () -> i64
      %4292 = func.call @cc_cons(%4290, %4291) : (i64, i64) -> i64
      %4293 = func.call @cc_values_pack(%4292) : (i64) -> i64
      func.call @stack_push_pointer(%4290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4294 = func.call @stack_pop_pointer() : () -> i64
      %4295 = func.call @stack_pop_pointer() : () -> i64
      %4296 = func.call @cc_cons(%4295, %4294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %4297 = arith.addi %4296, %__rlasp_stack_elide_zero_261 : i64
      %4298 = func.call @stack_pop_pointer() : () -> i64
      %4299 = func.call @cc_cons(%4298, %4297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %4300 = arith.addi %4299, %__rlasp_stack_elide_zero_262 : i64
      %4301 = func.call @stack_pop_pointer() : () -> i64
      %4302 = func.call @cc_cons(%4301, %4300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %4303 = arith.addi %4302, %__rlasp_stack_elide_zero_263 : i64
      %4304 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4305 = arith.constant 11 : i64
      %4306 = func.call @cc_make_string(%4304, %4305) : (!llvm.ptr, i64) -> i64
      %4307 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4308 = arith.constant 7 : i64
      %4309 = func.call @cc_make_string(%4307, %4308) : (!llvm.ptr, i64) -> i64
      %4310 = func.call @cc_intern(%4306, %4309) : (i64, i64) -> i64
      %4311 = func.call @cc_nil_value() : () -> i64
      %4312 = func.call @cc_cons(%4310, %4311) : (i64, i64) -> i64
      %4313 = func.call @cc_values_pack(%4312) : (i64) -> i64
      %4314 = func.call @cc_nil_value() : () -> i64
      %4315 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4316 = arith.constant 4 : i64
      %4317 = func.call @cc_make_string(%4315, %4316) : (!llvm.ptr, i64) -> i64
      %4318 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4319 = arith.constant 7 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = func.call @cc_intern(%4317, %4320) : (i64, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_cons(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_values_pack(%4323) : (i64) -> i64
      %4325 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4326 = arith.constant 6 : i64
      %4327 = func.call @cc_make_string(%4325, %4326) : (!llvm.ptr, i64) -> i64
      %4328 = func.call @cc_nil_value() : () -> i64
      %4329 = func.call @cc_intern(%4327, %4328) : (i64, i64) -> i64
      %4330 = func.call @cc_nil_value() : () -> i64
      %4331 = func.call @cc_cons(%4329, %4330) : (i64, i64) -> i64
      %4332 = func.call @cc_values_pack(%4331) : (i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %4333 = arith.addi %4329, %__rlasp_stack_elide_zero_264 : i64
      %4334 = func.call @cc_nil_value() : () -> i64
      %4335 = func.call @cc_errorp(%3924) : (i64) -> i64
      %4336 = arith.cmpi ne, %4335, %4334 : i64
      %4337 = arith.cmpi eq, %4334, %4334 : i64
      %4338 = arith.andi %4336, %4337 : i1
      %4339 = scf.if %4338 -> (i64) {
        scf.yield %3924 : i64
      } else {
        scf.yield %4334 : i64
      }
      %4340 = func.call @cc_errorp(%4194) : (i64) -> i64
      %4341 = arith.cmpi ne, %4340, %4334 : i64
      %4342 = arith.cmpi eq, %4339, %4334 : i64
      %4343 = arith.andi %4341, %4342 : i1
      %4344 = scf.if %4343 -> (i64) {
        scf.yield %4194 : i64
      } else {
        scf.yield %4339 : i64
      }
      %4345 = func.call @cc_errorp(%4285) : (i64) -> i64
      %4346 = arith.cmpi ne, %4345, %4334 : i64
      %4347 = arith.cmpi eq, %4344, %4334 : i64
      %4348 = arith.andi %4346, %4347 : i1
      %4349 = scf.if %4348 -> (i64) {
        scf.yield %4285 : i64
      } else {
        scf.yield %4344 : i64
      }
      %4350 = func.call @cc_errorp(%4303) : (i64) -> i64
      %4351 = arith.cmpi ne, %4350, %4334 : i64
      %4352 = arith.cmpi eq, %4349, %4334 : i64
      %4353 = arith.andi %4351, %4352 : i1
      %4354 = scf.if %4353 -> (i64) {
        scf.yield %4303 : i64
      } else {
        scf.yield %4349 : i64
      }
      %4355 = func.call @cc_errorp(%4310) : (i64) -> i64
      %4356 = arith.cmpi ne, %4355, %4334 : i64
      %4357 = arith.cmpi eq, %4354, %4334 : i64
      %4358 = arith.andi %4356, %4357 : i1
      %4359 = scf.if %4358 -> (i64) {
        scf.yield %4310 : i64
      } else {
        scf.yield %4354 : i64
      }
      %4360 = func.call @cc_errorp(%4314) : (i64) -> i64
      %4361 = arith.cmpi ne, %4360, %4334 : i64
      %4362 = arith.cmpi eq, %4359, %4334 : i64
      %4363 = arith.andi %4361, %4362 : i1
      %4364 = scf.if %4363 -> (i64) {
        scf.yield %4314 : i64
      } else {
        scf.yield %4359 : i64
      }
      %4365 = func.call @cc_errorp(%4321) : (i64) -> i64
      %4366 = arith.cmpi ne, %4365, %4334 : i64
      %4367 = arith.cmpi eq, %4364, %4334 : i64
      %4368 = arith.andi %4366, %4367 : i1
      %4369 = scf.if %4368 -> (i64) {
        scf.yield %4321 : i64
      } else {
        scf.yield %4364 : i64
      }
      %4370 = func.call @cc_errorp(%4333) : (i64) -> i64
      %4371 = arith.cmpi ne, %4370, %4334 : i64
      %4372 = arith.cmpi eq, %4369, %4334 : i64
      %4373 = arith.andi %4371, %4372 : i1
      %4374 = scf.if %4373 -> (i64) {
        scf.yield %4333 : i64
      } else {
        scf.yield %4369 : i64
      }
      %4375 = arith.cmpi ne, %4374, %4334 : i64
      scf.if %4375 {
        func.call @stack_push_pointer(%4374) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3924) : (i64) -> ()
        func.call @stack_push_pointer(%4194) : (i64) -> ()
        func.call @stack_push_pointer(%4285) : (i64) -> ()
        func.call @stack_push_pointer(%4303) : (i64) -> ()
        func.call @stack_push_pointer(%4310) : (i64) -> ()
        func.call @stack_push_pointer(%4314) : (i64) -> ()
        func.call @stack_push_pointer(%4321) : (i64) -> ()
        func.call @stack_push_pointer(%4333) : (i64) -> ()
        %4376 = llvm.mlir.addressof @str348 : !llvm.ptr
        %4377 = func.call @cc_make_function_ref_const(%4376) : (!llvm.ptr) -> i64
        %4378 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4377, %4378) : (i64, i64) -> ()
      }
      %4379 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4379 : i64
    }
    %4380 = func.call @cc_nil_value() : () -> i64
    %4381 = func.call @cc_errorp(%3915) : (i64) -> i64
    %4382 = arith.cmpi ne, %4381, %4380 : i64
    %4383 = scf.if %4382 -> (i64) {
      scf.yield %3915 : i64
    } else {
      %4384 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4385 = arith.constant 18 : i64
      %4386 = func.call @cc_make_string(%4384, %4385) : (!llvm.ptr, i64) -> i64
      %4387 = func.call @cc_nil_value() : () -> i64
      %4388 = func.call @cc_intern(%4386, %4387) : (i64, i64) -> i64
      %4389 = func.call @cc_nil_value() : () -> i64
      %4390 = func.call @cc_cons(%4388, %4389) : (i64, i64) -> i64
      %4391 = func.call @cc_values_pack(%4390) : (i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %4392 = arith.addi %4388, %__rlasp_stack_elide_zero_265 : i64
      %4393 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4394 = arith.constant 19 : i64
      %4395 = func.call @cc_make_string(%4393, %4394) : (!llvm.ptr, i64) -> i64
      %4396 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4397 = arith.constant 11 : i64
      %4398 = func.call @cc_make_string(%4396, %4397) : (!llvm.ptr, i64) -> i64
      %4399 = func.call @cc_intern(%4395, %4398) : (i64, i64) -> i64
      %4400 = func.call @cc_nil_value() : () -> i64
      %4401 = func.call @cc_cons(%4399, %4400) : (i64, i64) -> i64
      %4402 = func.call @cc_values_pack(%4401) : (i64) -> i64
      func.call @stack_push_pointer(%4399) : (i64) -> ()
      %4403 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4404 = arith.constant 1 : i64
      %4405 = func.call @cc_make_string(%4403, %4404) : (!llvm.ptr, i64) -> i64
      %4406 = func.call @cc_nil_value() : () -> i64
      %4407 = func.call @cc_intern(%4405, %4406) : (i64, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_cons(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_values_pack(%4409) : (i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4411 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4412 = arith.constant 9 : i64
      %4413 = func.call @cc_make_string(%4411, %4412) : (!llvm.ptr, i64) -> i64
      %4414 = func.call @cc_nil_value() : () -> i64
      %4415 = func.call @cc_intern(%4413, %4414) : (i64, i64) -> i64
      %4416 = func.call @cc_nil_value() : () -> i64
      %4417 = func.call @cc_cons(%4415, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_values_pack(%4417) : (i64) -> i64
      func.call @stack_push_pointer(%4415) : (i64) -> ()
      %4419 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4420 = arith.constant 8 : i64
      %4421 = func.call @cc_make_string(%4419, %4420) : (!llvm.ptr, i64) -> i64
      %4422 = func.call @cc_nil_value() : () -> i64
      %4423 = func.call @cc_intern(%4421, %4422) : (i64, i64) -> i64
      %4424 = func.call @cc_nil_value() : () -> i64
      %4425 = func.call @cc_cons(%4423, %4424) : (i64, i64) -> i64
      %4426 = func.call @cc_values_pack(%4425) : (i64) -> i64
      func.call @stack_push_pointer(%4423) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4427 = func.call @stack_pop_pointer() : () -> i64
      %4428 = func.call @stack_pop_pointer() : () -> i64
      %4429 = func.call @cc_cons(%4428, %4427) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %4430 = arith.addi %4429, %__rlasp_stack_elide_zero_266 : i64
      %4431 = func.call @stack_pop_pointer() : () -> i64
      %4432 = func.call @cc_cons(%4431, %4430) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %4433 = arith.addi %4432, %__rlasp_stack_elide_zero_267 : i64
      %4434 = func.call @stack_pop_pointer() : () -> i64
      %4435 = func.call @cc_cons(%4434, %4433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4435) : (i64) -> ()
      %4436 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4437 = arith.constant 7 : i64
      %4438 = func.call @cc_make_string(%4436, %4437) : (!llvm.ptr, i64) -> i64
      %4439 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4440 = arith.constant 11 : i64
      %4441 = func.call @cc_make_string(%4439, %4440) : (!llvm.ptr, i64) -> i64
      %4442 = func.call @cc_intern(%4438, %4441) : (i64, i64) -> i64
      %4443 = func.call @cc_nil_value() : () -> i64
      %4444 = func.call @cc_cons(%4442, %4443) : (i64, i64) -> i64
      %4445 = func.call @cc_values_pack(%4444) : (i64) -> i64
      func.call @stack_push_pointer(%4442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4446 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4447 = arith.constant 11 : i64
      %4448 = func.call @cc_make_string(%4446, %4447) : (!llvm.ptr, i64) -> i64
      %4449 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4450 = arith.constant 3 : i64
      %4451 = func.call @cc_make_string(%4449, %4450) : (!llvm.ptr, i64) -> i64
      %4452 = func.call @cc_intern(%4448, %4451) : (i64, i64) -> i64
      %4453 = func.call @cc_nil_value() : () -> i64
      %4454 = func.call @cc_cons(%4452, %4453) : (i64, i64) -> i64
      %4455 = func.call @cc_values_pack(%4454) : (i64) -> i64
      func.call @stack_push_pointer(%4452) : (i64) -> ()
      %4456 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4456) : (i64) -> ()
      %4457 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4458 = arith.constant 6 : i64
      %4459 = func.call @cc_make_string(%4457, %4458) : (!llvm.ptr, i64) -> i64
      %4460 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4461 = arith.constant 11 : i64
      %4462 = func.call @cc_make_string(%4460, %4461) : (!llvm.ptr, i64) -> i64
      %4463 = func.call @cc_intern(%4459, %4462) : (i64, i64) -> i64
      %4464 = func.call @cc_nil_value() : () -> i64
      %4465 = func.call @cc_cons(%4463, %4464) : (i64, i64) -> i64
      %4466 = func.call @cc_values_pack(%4465) : (i64) -> i64
      func.call @stack_push_pointer(%4463) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4467 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4468 = arith.constant 15 : i64
      %4469 = func.call @cc_make_string(%4467, %4468) : (!llvm.ptr, i64) -> i64
      %4470 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4471 = arith.constant 11 : i64
      %4472 = func.call @cc_make_string(%4470, %4471) : (!llvm.ptr, i64) -> i64
      %4473 = func.call @cc_intern(%4469, %4472) : (i64, i64) -> i64
      %4474 = func.call @cc_nil_value() : () -> i64
      %4475 = func.call @cc_cons(%4473, %4474) : (i64, i64) -> i64
      %4476 = func.call @cc_values_pack(%4475) : (i64) -> i64
      func.call @stack_push_pointer(%4473) : (i64) -> ()
      %4477 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4478 = arith.constant 13 : i64
      %4479 = func.call @cc_make_string(%4477, %4478) : (!llvm.ptr, i64) -> i64
      %4480 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4481 = arith.constant 11 : i64
      %4482 = func.call @cc_make_string(%4480, %4481) : (!llvm.ptr, i64) -> i64
      %4483 = func.call @cc_intern(%4479, %4482) : (i64, i64) -> i64
      %4484 = func.call @cc_nil_value() : () -> i64
      %4485 = func.call @cc_cons(%4483, %4484) : (i64, i64) -> i64
      %4486 = func.call @cc_values_pack(%4485) : (i64) -> i64
      func.call @stack_push_pointer(%4483) : (i64) -> ()
      %4487 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4487) : (i64) -> ()
      %4488 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4489 = arith.constant 10 : i64
      %4490 = func.call @cc_make_string(%4488, %4489) : (!llvm.ptr, i64) -> i64
      %4491 = func.call @cc_nil_value() : () -> i64
      %4492 = func.call @cc_intern(%4490, %4491) : (i64, i64) -> i64
      %4493 = func.call @cc_nil_value() : () -> i64
      %4494 = func.call @cc_cons(%4492, %4493) : (i64, i64) -> i64
      %4495 = func.call @cc_values_pack(%4494) : (i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %4496 = arith.addi %4492, %__rlasp_stack_elide_zero_268 : i64
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @cc_cons(%4496, %4497) : (i64, i64) -> i64
      %4499 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4500 = arith.constant 5 : i64
      %4501 = func.call @cc_make_string(%4499, %4500) : (!llvm.ptr, i64) -> i64
      %4502 = func.call @cc_nil_value() : () -> i64
      %4503 = func.call @cc_intern(%4501, %4502) : (i64, i64) -> i64
      %4504 = func.call @cc_nil_value() : () -> i64
      %4505 = func.call @cc_cons(%4503, %4504) : (i64, i64) -> i64
      %4506 = func.call @cc_values_pack(%4505) : (i64) -> i64
      %4507 = func.call @cc_cons(%4503, %4498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4507) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4508 = func.call @stack_pop_pointer() : () -> i64
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @cc_cons(%4509, %4508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %4511 = arith.addi %4510, %__rlasp_stack_elide_zero_269 : i64
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @cc_cons(%4512, %4511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4513) : (i64) -> ()
      %4514 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4515 = arith.constant 1 : i64
      %4516 = func.call @cc_make_string(%4514, %4515) : (!llvm.ptr, i64) -> i64
      %4517 = func.call @cc_nil_value() : () -> i64
      %4518 = func.call @cc_intern(%4516, %4517) : (i64, i64) -> i64
      %4519 = func.call @cc_nil_value() : () -> i64
      %4520 = func.call @cc_cons(%4518, %4519) : (i64, i64) -> i64
      %4521 = func.call @cc_values_pack(%4520) : (i64) -> i64
      func.call @stack_push_pointer(%4518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4522 = func.call @stack_pop_pointer() : () -> i64
      %4523 = func.call @stack_pop_pointer() : () -> i64
      %4524 = func.call @cc_cons(%4523, %4522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %4525 = arith.addi %4524, %__rlasp_stack_elide_zero_270 : i64
      %4526 = func.call @stack_pop_pointer() : () -> i64
      %4527 = func.call @cc_cons(%4526, %4525) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %4528 = arith.addi %4527, %__rlasp_stack_elide_zero_271 : i64
      %4529 = func.call @stack_pop_pointer() : () -> i64
      %4530 = func.call @cc_cons(%4529, %4528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4530) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4531 = func.call @stack_pop_pointer() : () -> i64
      %4532 = func.call @stack_pop_pointer() : () -> i64
      %4533 = func.call @cc_cons(%4532, %4531) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %4534 = arith.addi %4533, %__rlasp_stack_elide_zero_272 : i64
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = func.call @cc_cons(%4535, %4534) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %4537 = arith.addi %4536, %__rlasp_stack_elide_zero_273 : i64
      %4538 = func.call @stack_pop_pointer() : () -> i64
      %4539 = func.call @cc_cons(%4538, %4537) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %4540 = arith.addi %4539, %__rlasp_stack_elide_zero_274 : i64
      %4541 = func.call @stack_pop_pointer() : () -> i64
      %4542 = func.call @cc_cons(%4540, %4541) : (i64, i64) -> i64
      %4543 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4544 = arith.constant 5 : i64
      %4545 = func.call @cc_make_string(%4543, %4544) : (!llvm.ptr, i64) -> i64
      %4546 = func.call @cc_nil_value() : () -> i64
      %4547 = func.call @cc_intern(%4545, %4546) : (i64, i64) -> i64
      %4548 = func.call @cc_nil_value() : () -> i64
      %4549 = func.call @cc_cons(%4547, %4548) : (i64, i64) -> i64
      %4550 = func.call @cc_values_pack(%4549) : (i64) -> i64
      %4551 = func.call @cc_cons(%4547, %4542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4551) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4552 = func.call @stack_pop_pointer() : () -> i64
      %4553 = func.call @stack_pop_pointer() : () -> i64
      %4554 = func.call @cc_cons(%4553, %4552) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %4555 = arith.addi %4554, %__rlasp_stack_elide_zero_275 : i64
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = func.call @cc_cons(%4556, %4555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4557) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4558 = func.call @stack_pop_pointer() : () -> i64
      %4559 = func.call @stack_pop_pointer() : () -> i64
      %4560 = func.call @cc_cons(%4559, %4558) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %4561 = arith.addi %4560, %__rlasp_stack_elide_zero_276 : i64
      %4562 = func.call @stack_pop_pointer() : () -> i64
      %4563 = func.call @cc_cons(%4562, %4561) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %4564 = arith.addi %4563, %__rlasp_stack_elide_zero_277 : i64
      %4565 = func.call @stack_pop_pointer() : () -> i64
      %4566 = func.call @cc_cons(%4565, %4564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4566) : (i64) -> ()
      %4567 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4568 = arith.constant 6 : i64
      %4569 = func.call @cc_make_string(%4567, %4568) : (!llvm.ptr, i64) -> i64
      %4570 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4571 = arith.constant 11 : i64
      %4572 = func.call @cc_make_string(%4570, %4571) : (!llvm.ptr, i64) -> i64
      %4573 = func.call @cc_intern(%4569, %4572) : (i64, i64) -> i64
      %4574 = func.call @cc_nil_value() : () -> i64
      %4575 = func.call @cc_cons(%4573, %4574) : (i64, i64) -> i64
      %4576 = func.call @cc_values_pack(%4575) : (i64) -> i64
      func.call @stack_push_pointer(%4573) : (i64) -> ()
      %4577 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4578 = arith.constant 10 : i64
      %4579 = func.call @cc_make_string(%4577, %4578) : (!llvm.ptr, i64) -> i64
      %4580 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4581 = arith.constant 11 : i64
      %4582 = func.call @cc_make_string(%4580, %4581) : (!llvm.ptr, i64) -> i64
      %4583 = func.call @cc_intern(%4579, %4582) : (i64, i64) -> i64
      %4584 = func.call @cc_nil_value() : () -> i64
      %4585 = func.call @cc_cons(%4583, %4584) : (i64, i64) -> i64
      %4586 = func.call @cc_values_pack(%4585) : (i64) -> i64
      func.call @stack_push_pointer(%4583) : (i64) -> ()
      %4587 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4588 = arith.constant 8 : i64
      %4589 = func.call @cc_make_string(%4587, %4588) : (!llvm.ptr, i64) -> i64
      %4590 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4591 = arith.constant 11 : i64
      %4592 = func.call @cc_make_string(%4590, %4591) : (!llvm.ptr, i64) -> i64
      %4593 = func.call @cc_intern(%4589, %4592) : (i64, i64) -> i64
      %4594 = func.call @cc_nil_value() : () -> i64
      %4595 = func.call @cc_cons(%4593, %4594) : (i64, i64) -> i64
      %4596 = func.call @cc_values_pack(%4595) : (i64) -> i64
      func.call @stack_push_pointer(%4593) : (i64) -> ()
      %4597 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4598 = arith.constant 7 : i64
      %4599 = func.call @cc_make_string(%4597, %4598) : (!llvm.ptr, i64) -> i64
      %4600 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4601 = arith.constant 11 : i64
      %4602 = func.call @cc_make_string(%4600, %4601) : (!llvm.ptr, i64) -> i64
      %4603 = func.call @cc_intern(%4599, %4602) : (i64, i64) -> i64
      %4604 = func.call @cc_nil_value() : () -> i64
      %4605 = func.call @cc_cons(%4603, %4604) : (i64, i64) -> i64
      %4606 = func.call @cc_values_pack(%4605) : (i64) -> i64
      func.call @stack_push_pointer(%4603) : (i64) -> ()
      %4607 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4608 = arith.constant 1 : i64
      %4609 = func.call @cc_make_string(%4607, %4608) : (!llvm.ptr, i64) -> i64
      %4610 = func.call @cc_nil_value() : () -> i64
      %4611 = func.call @cc_intern(%4609, %4610) : (i64, i64) -> i64
      %4612 = func.call @cc_nil_value() : () -> i64
      %4613 = func.call @cc_cons(%4611, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_values_pack(%4613) : (i64) -> i64
      func.call @stack_push_pointer(%4611) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4615 = func.call @stack_pop_pointer() : () -> i64
      %4616 = func.call @stack_pop_pointer() : () -> i64
      %4617 = func.call @cc_cons(%4616, %4615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %4618 = arith.addi %4617, %__rlasp_stack_elide_zero_278 : i64
      %4619 = func.call @stack_pop_pointer() : () -> i64
      %4620 = func.call @cc_cons(%4619, %4618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4620) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4621 = func.call @stack_pop_pointer() : () -> i64
      %4622 = func.call @stack_pop_pointer() : () -> i64
      %4623 = func.call @cc_cons(%4622, %4621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %4624 = arith.addi %4623, %__rlasp_stack_elide_zero_279 : i64
      %4625 = func.call @stack_pop_pointer() : () -> i64
      %4626 = func.call @cc_cons(%4625, %4624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4627 = func.call @stack_pop_pointer() : () -> i64
      %4628 = func.call @stack_pop_pointer() : () -> i64
      %4629 = func.call @cc_cons(%4628, %4627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %4630 = arith.addi %4629, %__rlasp_stack_elide_zero_280 : i64
      %4631 = func.call @stack_pop_pointer() : () -> i64
      %4632 = func.call @cc_cons(%4631, %4630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4632) : (i64) -> ()
      %4633 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4634 = arith.constant 9 : i64
      %4635 = func.call @cc_make_string(%4633, %4634) : (!llvm.ptr, i64) -> i64
      %4636 = func.call @cc_nil_value() : () -> i64
      %4637 = func.call @cc_intern(%4635, %4636) : (i64, i64) -> i64
      %4638 = func.call @cc_nil_value() : () -> i64
      %4639 = func.call @cc_cons(%4637, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_values_pack(%4639) : (i64) -> i64
      func.call @stack_push_pointer(%4637) : (i64) -> ()
      %4641 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4642 = arith.constant 8 : i64
      %4643 = func.call @cc_make_string(%4641, %4642) : (!llvm.ptr, i64) -> i64
      %4644 = func.call @cc_nil_value() : () -> i64
      %4645 = func.call @cc_intern(%4643, %4644) : (i64, i64) -> i64
      %4646 = func.call @cc_nil_value() : () -> i64
      %4647 = func.call @cc_cons(%4645, %4646) : (i64, i64) -> i64
      %4648 = func.call @cc_values_pack(%4647) : (i64) -> i64
      func.call @stack_push_pointer(%4645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4649 = func.call @stack_pop_pointer() : () -> i64
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @cc_cons(%4650, %4649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %4652 = arith.addi %4651, %__rlasp_stack_elide_zero_281 : i64
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @cc_cons(%4653, %4652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %4655 = arith.addi %4654, %__rlasp_stack_elide_zero_282 : i64
      %4656 = func.call @stack_pop_pointer() : () -> i64
      %4657 = func.call @cc_cons(%4656, %4655) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %4658 = arith.addi %4657, %__rlasp_stack_elide_zero_283 : i64
      %4659 = func.call @stack_pop_pointer() : () -> i64
      %4660 = func.call @cc_cons(%4659, %4658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4660) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4661 = func.call @stack_pop_pointer() : () -> i64
      %4662 = func.call @stack_pop_pointer() : () -> i64
      %4663 = func.call @cc_cons(%4662, %4661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %4664 = arith.addi %4663, %__rlasp_stack_elide_zero_284 : i64
      %4665 = func.call @stack_pop_pointer() : () -> i64
      %4666 = func.call @cc_cons(%4665, %4664) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %4667 = arith.addi %4666, %__rlasp_stack_elide_zero_285 : i64
      %4668 = func.call @stack_pop_pointer() : () -> i64
      %4669 = func.call @cc_cons(%4668, %4667) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %4670 = arith.addi %4669, %__rlasp_stack_elide_zero_286 : i64
      %4671 = func.call @stack_pop_pointer() : () -> i64
      %4672 = func.call @cc_cons(%4671, %4670) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %4673 = arith.addi %4672, %__rlasp_stack_elide_zero_287 : i64
      %4749 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4750 = arith.constant 30 : i64
      %4751 = func.call @cc_make_symbol(%4749, %4750) : (!llvm.ptr, i64) -> i64
      %4752 = func.call @cc_persistent_root_value(%4751) : (i64) -> i64
      func.call @stack_push_pointer(%4752) : (i64) -> ()
      %4753 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4754 = arith.constant 37 : i64
      %4755 = func.call @cc_make_symbol(%4753, %4754) : (!llvm.ptr, i64) -> i64
      %4756 = func.call @cc_persistent_root_value(%4755) : (i64) -> i64
      func.call @stack_push_pointer(%4756) : (i64) -> ()
      %4757 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4758 = arith.constant 38 : i64
      %4759 = func.call @cc_make_symbol(%4757, %4758) : (!llvm.ptr, i64) -> i64
      %4760 = func.call @cc_persistent_root_value(%4759) : (i64) -> i64
      func.call @stack_push_pointer(%4760) : (i64) -> ()
      %4761 = arith.constant 275462358040627 : i64
      %4762 = arith.constant 3 : i64
      %4763 = func.call @cc_make_closure(%4761, %4762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %4764 = arith.addi %4763, %__rlasp_stack_elide_zero_288 : i64
      %4765 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4766 = arith.constant 10 : i64
      %4767 = func.call @cc_make_string(%4765, %4766) : (!llvm.ptr, i64) -> i64
      %4768 = func.call @cc_nil_value() : () -> i64
      %4769 = func.call @cc_intern(%4767, %4768) : (i64, i64) -> i64
      %4770 = func.call @cc_nil_value() : () -> i64
      %4771 = func.call @cc_cons(%4769, %4770) : (i64, i64) -> i64
      %4772 = func.call @cc_values_pack(%4771) : (i64) -> i64
      func.call @stack_push_pointer(%4769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4773 = func.call @stack_pop_pointer() : () -> i64
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = func.call @cc_cons(%4774, %4773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %4776 = arith.addi %4775, %__rlasp_stack_elide_zero_289 : i64
      %4777 = func.call @stack_pop_pointer() : () -> i64
      %4778 = func.call @cc_cons(%4777, %4776) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %4779 = arith.addi %4778, %__rlasp_stack_elide_zero_290 : i64
      %4780 = func.call @stack_pop_pointer() : () -> i64
      %4781 = func.call @cc_cons(%4780, %4779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %4782 = arith.addi %4781, %__rlasp_stack_elide_zero_291 : i64
      %4783 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4784 = arith.constant 11 : i64
      %4785 = func.call @cc_make_string(%4783, %4784) : (!llvm.ptr, i64) -> i64
      %4786 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4787 = arith.constant 7 : i64
      %4788 = func.call @cc_make_string(%4786, %4787) : (!llvm.ptr, i64) -> i64
      %4789 = func.call @cc_intern(%4785, %4788) : (i64, i64) -> i64
      %4790 = func.call @cc_nil_value() : () -> i64
      %4791 = func.call @cc_cons(%4789, %4790) : (i64, i64) -> i64
      %4792 = func.call @cc_values_pack(%4791) : (i64) -> i64
      %4793 = func.call @cc_nil_value() : () -> i64
      %4794 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4795 = arith.constant 4 : i64
      %4796 = func.call @cc_make_string(%4794, %4795) : (!llvm.ptr, i64) -> i64
      %4797 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4798 = arith.constant 7 : i64
      %4799 = func.call @cc_make_string(%4797, %4798) : (!llvm.ptr, i64) -> i64
      %4800 = func.call @cc_intern(%4796, %4799) : (i64, i64) -> i64
      %4801 = func.call @cc_nil_value() : () -> i64
      %4802 = func.call @cc_cons(%4800, %4801) : (i64, i64) -> i64
      %4803 = func.call @cc_values_pack(%4802) : (i64) -> i64
      %4804 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4805 = arith.constant 6 : i64
      %4806 = func.call @cc_make_string(%4804, %4805) : (!llvm.ptr, i64) -> i64
      %4807 = func.call @cc_nil_value() : () -> i64
      %4808 = func.call @cc_intern(%4806, %4807) : (i64, i64) -> i64
      %4809 = func.call @cc_nil_value() : () -> i64
      %4810 = func.call @cc_cons(%4808, %4809) : (i64, i64) -> i64
      %4811 = func.call @cc_values_pack(%4810) : (i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %4812 = arith.addi %4808, %__rlasp_stack_elide_zero_292 : i64
      %4813 = func.call @cc_nil_value() : () -> i64
      %4814 = func.call @cc_errorp(%4392) : (i64) -> i64
      %4815 = arith.cmpi ne, %4814, %4813 : i64
      %4816 = arith.cmpi eq, %4813, %4813 : i64
      %4817 = arith.andi %4815, %4816 : i1
      %4818 = scf.if %4817 -> (i64) {
        scf.yield %4392 : i64
      } else {
        scf.yield %4813 : i64
      }
      %4819 = func.call @cc_errorp(%4673) : (i64) -> i64
      %4820 = arith.cmpi ne, %4819, %4813 : i64
      %4821 = arith.cmpi eq, %4818, %4813 : i64
      %4822 = arith.andi %4820, %4821 : i1
      %4823 = scf.if %4822 -> (i64) {
        scf.yield %4673 : i64
      } else {
        scf.yield %4818 : i64
      }
      %4824 = func.call @cc_errorp(%4764) : (i64) -> i64
      %4825 = arith.cmpi ne, %4824, %4813 : i64
      %4826 = arith.cmpi eq, %4823, %4813 : i64
      %4827 = arith.andi %4825, %4826 : i1
      %4828 = scf.if %4827 -> (i64) {
        scf.yield %4764 : i64
      } else {
        scf.yield %4823 : i64
      }
      %4829 = func.call @cc_errorp(%4782) : (i64) -> i64
      %4830 = arith.cmpi ne, %4829, %4813 : i64
      %4831 = arith.cmpi eq, %4828, %4813 : i64
      %4832 = arith.andi %4830, %4831 : i1
      %4833 = scf.if %4832 -> (i64) {
        scf.yield %4782 : i64
      } else {
        scf.yield %4828 : i64
      }
      %4834 = func.call @cc_errorp(%4789) : (i64) -> i64
      %4835 = arith.cmpi ne, %4834, %4813 : i64
      %4836 = arith.cmpi eq, %4833, %4813 : i64
      %4837 = arith.andi %4835, %4836 : i1
      %4838 = scf.if %4837 -> (i64) {
        scf.yield %4789 : i64
      } else {
        scf.yield %4833 : i64
      }
      %4839 = func.call @cc_errorp(%4793) : (i64) -> i64
      %4840 = arith.cmpi ne, %4839, %4813 : i64
      %4841 = arith.cmpi eq, %4838, %4813 : i64
      %4842 = arith.andi %4840, %4841 : i1
      %4843 = scf.if %4842 -> (i64) {
        scf.yield %4793 : i64
      } else {
        scf.yield %4838 : i64
      }
      %4844 = func.call @cc_errorp(%4800) : (i64) -> i64
      %4845 = arith.cmpi ne, %4844, %4813 : i64
      %4846 = arith.cmpi eq, %4843, %4813 : i64
      %4847 = arith.andi %4845, %4846 : i1
      %4848 = scf.if %4847 -> (i64) {
        scf.yield %4800 : i64
      } else {
        scf.yield %4843 : i64
      }
      %4849 = func.call @cc_errorp(%4812) : (i64) -> i64
      %4850 = arith.cmpi ne, %4849, %4813 : i64
      %4851 = arith.cmpi eq, %4848, %4813 : i64
      %4852 = arith.andi %4850, %4851 : i1
      %4853 = scf.if %4852 -> (i64) {
        scf.yield %4812 : i64
      } else {
        scf.yield %4848 : i64
      }
      %4854 = arith.cmpi ne, %4853, %4813 : i64
      scf.if %4854 {
        func.call @stack_push_pointer(%4853) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4392) : (i64) -> ()
        func.call @stack_push_pointer(%4673) : (i64) -> ()
        func.call @stack_push_pointer(%4764) : (i64) -> ()
        func.call @stack_push_pointer(%4782) : (i64) -> ()
        func.call @stack_push_pointer(%4789) : (i64) -> ()
        func.call @stack_push_pointer(%4793) : (i64) -> ()
        func.call @stack_push_pointer(%4800) : (i64) -> ()
        func.call @stack_push_pointer(%4812) : (i64) -> ()
        %4855 = llvm.mlir.addressof @str391 : !llvm.ptr
        %4856 = func.call @cc_make_function_ref_const(%4855) : (!llvm.ptr) -> i64
        %4857 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4856, %4857) : (i64, i64) -> ()
      }
      %4858 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4858 : i64
    }
    %4859 = func.call @cc_nil_value() : () -> i64
    %4860 = func.call @cc_errorp(%4383) : (i64) -> i64
    %4861 = arith.cmpi ne, %4860, %4859 : i64
    %4862 = scf.if %4861 -> (i64) {
      scf.yield %4383 : i64
    } else {
      %4863 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4864 = arith.constant 9 : i64
      %4865 = func.call @cc_make_string(%4863, %4864) : (!llvm.ptr, i64) -> i64
      %4866 = func.call @cc_nil_value() : () -> i64
      %4867 = func.call @cc_intern(%4865, %4866) : (i64, i64) -> i64
      %4868 = func.call @cc_nil_value() : () -> i64
      %4869 = func.call @cc_cons(%4867, %4868) : (i64, i64) -> i64
      %4870 = func.call @cc_values_pack(%4869) : (i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %4871 = arith.addi %4867, %__rlasp_stack_elide_zero_293 : i64
      %4872 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4873 = arith.constant 3 : i64
      %4874 = func.call @cc_make_string(%4872, %4873) : (!llvm.ptr, i64) -> i64
      %4875 = func.call @cc_nil_value() : () -> i64
      %4876 = func.call @cc_intern(%4874, %4875) : (i64, i64) -> i64
      %4877 = func.call @cc_nil_value() : () -> i64
      %4878 = func.call @cc_cons(%4876, %4877) : (i64, i64) -> i64
      %4879 = func.call @cc_values_pack(%4878) : (i64) -> i64
      func.call @stack_push_pointer(%4876) : (i64) -> ()
      %4880 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4881 = arith.constant 1 : i64
      %4882 = func.call @cc_make_string(%4880, %4881) : (!llvm.ptr, i64) -> i64
      %4883 = func.call @cc_nil_value() : () -> i64
      %4884 = func.call @cc_intern(%4882, %4883) : (i64, i64) -> i64
      %4885 = func.call @cc_nil_value() : () -> i64
      %4886 = func.call @cc_cons(%4884, %4885) : (i64, i64) -> i64
      %4887 = func.call @cc_values_pack(%4886) : (i64) -> i64
      func.call @stack_push_pointer(%4884) : (i64) -> ()
      %4888 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4889 = arith.constant 11 : i64
      %4890 = func.call @cc_make_string(%4888, %4889) : (!llvm.ptr, i64) -> i64
      %4891 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4892 = arith.constant 3 : i64
      %4893 = func.call @cc_make_string(%4891, %4892) : (!llvm.ptr, i64) -> i64
      %4894 = func.call @cc_intern(%4890, %4893) : (i64, i64) -> i64
      %4895 = func.call @cc_nil_value() : () -> i64
      %4896 = func.call @cc_cons(%4894, %4895) : (i64, i64) -> i64
      %4897 = func.call @cc_values_pack(%4896) : (i64) -> i64
      func.call @stack_push_pointer(%4894) : (i64) -> ()
      %4898 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4898) : (i64) -> ()
      %4899 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4900 = arith.constant 6 : i64
      %4901 = func.call @cc_make_string(%4899, %4900) : (!llvm.ptr, i64) -> i64
      %4902 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4903 = arith.constant 11 : i64
      %4904 = func.call @cc_make_string(%4902, %4903) : (!llvm.ptr, i64) -> i64
      %4905 = func.call @cc_intern(%4901, %4904) : (i64, i64) -> i64
      %4906 = func.call @cc_nil_value() : () -> i64
      %4907 = func.call @cc_cons(%4905, %4906) : (i64, i64) -> i64
      %4908 = func.call @cc_values_pack(%4907) : (i64) -> i64
      func.call @stack_push_pointer(%4905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4909 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4910 = arith.constant 4 : i64
      %4911 = func.call @cc_make_string(%4909, %4910) : (!llvm.ptr, i64) -> i64
      %4912 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4913 = arith.constant 11 : i64
      %4914 = func.call @cc_make_string(%4912, %4913) : (!llvm.ptr, i64) -> i64
      %4915 = func.call @cc_intern(%4911, %4914) : (i64, i64) -> i64
      %4916 = func.call @cc_nil_value() : () -> i64
      %4917 = func.call @cc_cons(%4915, %4916) : (i64, i64) -> i64
      %4918 = func.call @cc_values_pack(%4917) : (i64) -> i64
      func.call @stack_push_pointer(%4915) : (i64) -> ()
      %4919 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4920 = arith.constant 3 : i64
      %4921 = func.call @cc_make_string(%4919, %4920) : (!llvm.ptr, i64) -> i64
      %4922 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4923 = arith.constant 11 : i64
      %4924 = func.call @cc_make_string(%4922, %4923) : (!llvm.ptr, i64) -> i64
      %4925 = func.call @cc_intern(%4921, %4924) : (i64, i64) -> i64
      %4926 = func.call @cc_nil_value() : () -> i64
      %4927 = func.call @cc_cons(%4925, %4926) : (i64, i64) -> i64
      %4928 = func.call @cc_values_pack(%4927) : (i64) -> i64
      func.call @stack_push_pointer(%4925) : (i64) -> ()
      %4929 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4930 = arith.constant 15 : i64
      %4931 = func.call @cc_make_string(%4929, %4930) : (!llvm.ptr, i64) -> i64
      %4932 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4933 = arith.constant 11 : i64
      %4934 = func.call @cc_make_string(%4932, %4933) : (!llvm.ptr, i64) -> i64
      %4935 = func.call @cc_intern(%4931, %4934) : (i64, i64) -> i64
      %4936 = func.call @cc_nil_value() : () -> i64
      %4937 = func.call @cc_cons(%4935, %4936) : (i64, i64) -> i64
      %4938 = func.call @cc_values_pack(%4937) : (i64) -> i64
      func.call @stack_push_pointer(%4935) : (i64) -> ()
      %4939 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4940 = arith.constant 4 : i64
      %4941 = func.call @cc_make_string(%4939, %4940) : (!llvm.ptr, i64) -> i64
      %4942 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4943 = arith.constant 11 : i64
      %4944 = func.call @cc_make_string(%4942, %4943) : (!llvm.ptr, i64) -> i64
      %4945 = func.call @cc_intern(%4941, %4944) : (i64, i64) -> i64
      %4946 = func.call @cc_nil_value() : () -> i64
      %4947 = func.call @cc_cons(%4945, %4946) : (i64, i64) -> i64
      %4948 = func.call @cc_values_pack(%4947) : (i64) -> i64
      func.call @stack_push_pointer(%4945) : (i64) -> ()
      %4949 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4950 = func.call @stack_pop_pointer() : () -> i64
      %4951 = func.call @stack_pop_pointer() : () -> i64
      %4952 = func.call @cc_cons(%4951, %4950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %4953 = arith.addi %4952, %__rlasp_stack_elide_zero_294 : i64
      %4954 = func.call @stack_pop_pointer() : () -> i64
      %4955 = func.call @cc_cons(%4954, %4953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4956 = func.call @stack_pop_pointer() : () -> i64
      %4957 = func.call @stack_pop_pointer() : () -> i64
      %4958 = func.call @cc_cons(%4957, %4956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %4959 = arith.addi %4958, %__rlasp_stack_elide_zero_295 : i64
      %4960 = func.call @stack_pop_pointer() : () -> i64
      %4961 = func.call @cc_cons(%4960, %4959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4962 = func.call @stack_pop_pointer() : () -> i64
      %4963 = func.call @stack_pop_pointer() : () -> i64
      %4964 = func.call @cc_cons(%4963, %4962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %4965 = arith.addi %4964, %__rlasp_stack_elide_zero_296 : i64
      %4966 = func.call @stack_pop_pointer() : () -> i64
      %4967 = func.call @cc_cons(%4966, %4965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4968 = func.call @stack_pop_pointer() : () -> i64
      %4969 = func.call @stack_pop_pointer() : () -> i64
      %4970 = func.call @cc_cons(%4969, %4968) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %4971 = arith.addi %4970, %__rlasp_stack_elide_zero_297 : i64
      %4972 = func.call @stack_pop_pointer() : () -> i64
      %4973 = func.call @cc_cons(%4972, %4971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4974 = func.call @stack_pop_pointer() : () -> i64
      %4975 = func.call @stack_pop_pointer() : () -> i64
      %4976 = func.call @cc_cons(%4975, %4974) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %4977 = arith.addi %4976, %__rlasp_stack_elide_zero_298 : i64
      %4978 = func.call @stack_pop_pointer() : () -> i64
      %4979 = func.call @cc_cons(%4978, %4977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %4980 = arith.addi %4979, %__rlasp_stack_elide_zero_299 : i64
      %4981 = func.call @stack_pop_pointer() : () -> i64
      %4982 = func.call @cc_cons(%4981, %4980) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %4983 = arith.addi %4982, %__rlasp_stack_elide_zero_300 : i64
      %4984 = func.call @stack_pop_pointer() : () -> i64
      %4985 = func.call @cc_cons(%4983, %4984) : (i64, i64) -> i64
      %4986 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4987 = arith.constant 5 : i64
      %4988 = func.call @cc_make_string(%4986, %4987) : (!llvm.ptr, i64) -> i64
      %4989 = func.call @cc_nil_value() : () -> i64
      %4990 = func.call @cc_intern(%4988, %4989) : (i64, i64) -> i64
      %4991 = func.call @cc_nil_value() : () -> i64
      %4992 = func.call @cc_cons(%4990, %4991) : (i64, i64) -> i64
      %4993 = func.call @cc_values_pack(%4992) : (i64) -> i64
      %4994 = func.call @cc_cons(%4990, %4985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4995 = func.call @stack_pop_pointer() : () -> i64
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @cc_cons(%4996, %4995) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %4998 = arith.addi %4997, %__rlasp_stack_elide_zero_301 : i64
      %4999 = func.call @stack_pop_pointer() : () -> i64
      %5000 = func.call @cc_cons(%4999, %4998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5001 = func.call @stack_pop_pointer() : () -> i64
      %5002 = func.call @stack_pop_pointer() : () -> i64
      %5003 = func.call @cc_cons(%5002, %5001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %5004 = arith.addi %5003, %__rlasp_stack_elide_zero_302 : i64
      %5005 = func.call @stack_pop_pointer() : () -> i64
      %5006 = func.call @cc_cons(%5005, %5004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5006) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5007 = func.call @stack_pop_pointer() : () -> i64
      %5008 = func.call @stack_pop_pointer() : () -> i64
      %5009 = func.call @cc_cons(%5008, %5007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5009) : (i64) -> ()
      %5010 = llvm.mlir.addressof @str408 : !llvm.ptr
      %5011 = arith.constant 7 : i64
      %5012 = func.call @cc_make_string(%5010, %5011) : (!llvm.ptr, i64) -> i64
      %5013 = llvm.mlir.addressof @str409 : !llvm.ptr
      %5014 = arith.constant 11 : i64
      %5015 = func.call @cc_make_string(%5013, %5014) : (!llvm.ptr, i64) -> i64
      %5016 = func.call @cc_intern(%5012, %5015) : (i64, i64) -> i64
      %5017 = func.call @cc_nil_value() : () -> i64
      %5018 = func.call @cc_cons(%5016, %5017) : (i64, i64) -> i64
      %5019 = func.call @cc_values_pack(%5018) : (i64) -> i64
      func.call @stack_push_pointer(%5016) : (i64) -> ()
      %5020 = llvm.mlir.addressof @str410 : !llvm.ptr
      %5021 = arith.constant 1 : i64
      %5022 = func.call @cc_make_string(%5020, %5021) : (!llvm.ptr, i64) -> i64
      %5023 = func.call @cc_nil_value() : () -> i64
      %5024 = func.call @cc_intern(%5022, %5023) : (i64, i64) -> i64
      %5025 = func.call @cc_nil_value() : () -> i64
      %5026 = func.call @cc_cons(%5024, %5025) : (i64, i64) -> i64
      %5027 = func.call @cc_values_pack(%5026) : (i64) -> i64
      func.call @stack_push_pointer(%5024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5028 = func.call @stack_pop_pointer() : () -> i64
      %5029 = func.call @stack_pop_pointer() : () -> i64
      %5030 = func.call @cc_cons(%5029, %5028) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %5031 = arith.addi %5030, %__rlasp_stack_elide_zero_303 : i64
      %5032 = func.call @stack_pop_pointer() : () -> i64
      %5033 = func.call @cc_cons(%5032, %5031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5033) : (i64) -> ()
      %5034 = llvm.mlir.addressof @str411 : !llvm.ptr
      %5035 = arith.constant 7 : i64
      %5036 = func.call @cc_make_string(%5034, %5035) : (!llvm.ptr, i64) -> i64
      %5037 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5038 = arith.constant 11 : i64
      %5039 = func.call @cc_make_string(%5037, %5038) : (!llvm.ptr, i64) -> i64
      %5040 = func.call @cc_intern(%5036, %5039) : (i64, i64) -> i64
      %5041 = func.call @cc_nil_value() : () -> i64
      %5042 = func.call @cc_cons(%5040, %5041) : (i64, i64) -> i64
      %5043 = func.call @cc_values_pack(%5042) : (i64) -> i64
      func.call @stack_push_pointer(%5040) : (i64) -> ()
      %5044 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5045 = arith.constant 1 : i64
      %5046 = func.call @cc_make_string(%5044, %5045) : (!llvm.ptr, i64) -> i64
      %5047 = func.call @cc_nil_value() : () -> i64
      %5048 = func.call @cc_intern(%5046, %5047) : (i64, i64) -> i64
      %5049 = func.call @cc_nil_value() : () -> i64
      %5050 = func.call @cc_cons(%5048, %5049) : (i64, i64) -> i64
      %5051 = func.call @cc_values_pack(%5050) : (i64) -> i64
      func.call @stack_push_pointer(%5048) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @stack_pop_pointer() : () -> i64
      %5054 = func.call @cc_cons(%5053, %5052) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %5055 = arith.addi %5054, %__rlasp_stack_elide_zero_304 : i64
      %5056 = func.call @stack_pop_pointer() : () -> i64
      %5057 = func.call @cc_cons(%5056, %5055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5057) : (i64) -> ()
      %5058 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5059 = arith.constant 19 : i64
      %5060 = func.call @cc_make_string(%5058, %5059) : (!llvm.ptr, i64) -> i64
      %5061 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5062 = arith.constant 11 : i64
      %5063 = func.call @cc_make_string(%5061, %5062) : (!llvm.ptr, i64) -> i64
      %5064 = func.call @cc_intern(%5060, %5063) : (i64, i64) -> i64
      %5065 = func.call @cc_nil_value() : () -> i64
      %5066 = func.call @cc_cons(%5064, %5065) : (i64, i64) -> i64
      %5067 = func.call @cc_values_pack(%5066) : (i64) -> i64
      func.call @stack_push_pointer(%5064) : (i64) -> ()
      %5068 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5069 = arith.constant 1 : i64
      %5070 = func.call @cc_make_string(%5068, %5069) : (!llvm.ptr, i64) -> i64
      %5071 = func.call @cc_nil_value() : () -> i64
      %5072 = func.call @cc_intern(%5070, %5071) : (i64, i64) -> i64
      %5073 = func.call @cc_nil_value() : () -> i64
      %5074 = func.call @cc_cons(%5072, %5073) : (i64, i64) -> i64
      %5075 = func.call @cc_values_pack(%5074) : (i64) -> i64
      func.call @stack_push_pointer(%5072) : (i64) -> ()
      %5076 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5077 = arith.constant 9 : i64
      %5078 = func.call @cc_make_string(%5076, %5077) : (!llvm.ptr, i64) -> i64
      %5079 = func.call @cc_nil_value() : () -> i64
      %5080 = func.call @cc_intern(%5078, %5079) : (i64, i64) -> i64
      %5081 = func.call @cc_nil_value() : () -> i64
      %5082 = func.call @cc_cons(%5080, %5081) : (i64, i64) -> i64
      %5083 = func.call @cc_values_pack(%5082) : (i64) -> i64
      func.call @stack_push_pointer(%5080) : (i64) -> ()
      %5084 = llvm.mlir.addressof @str418 : !llvm.ptr
      %5085 = arith.constant 8 : i64
      %5086 = func.call @cc_make_string(%5084, %5085) : (!llvm.ptr, i64) -> i64
      %5087 = func.call @cc_nil_value() : () -> i64
      %5088 = func.call @cc_intern(%5086, %5087) : (i64, i64) -> i64
      %5089 = func.call @cc_nil_value() : () -> i64
      %5090 = func.call @cc_cons(%5088, %5089) : (i64, i64) -> i64
      %5091 = func.call @cc_values_pack(%5090) : (i64) -> i64
      func.call @stack_push_pointer(%5088) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5092 = func.call @stack_pop_pointer() : () -> i64
      %5093 = func.call @stack_pop_pointer() : () -> i64
      %5094 = func.call @cc_cons(%5093, %5092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %5095 = arith.addi %5094, %__rlasp_stack_elide_zero_305 : i64
      %5096 = func.call @stack_pop_pointer() : () -> i64
      %5097 = func.call @cc_cons(%5096, %5095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %5098 = arith.addi %5097, %__rlasp_stack_elide_zero_306 : i64
      %5099 = func.call @stack_pop_pointer() : () -> i64
      %5100 = func.call @cc_cons(%5099, %5098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5100) : (i64) -> ()
      %5101 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5102 = arith.constant 7 : i64
      %5103 = func.call @cc_make_string(%5101, %5102) : (!llvm.ptr, i64) -> i64
      %5104 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5105 = arith.constant 11 : i64
      %5106 = func.call @cc_make_string(%5104, %5105) : (!llvm.ptr, i64) -> i64
      %5107 = func.call @cc_intern(%5103, %5106) : (i64, i64) -> i64
      %5108 = func.call @cc_nil_value() : () -> i64
      %5109 = func.call @cc_cons(%5107, %5108) : (i64, i64) -> i64
      %5110 = func.call @cc_values_pack(%5109) : (i64) -> i64
      func.call @stack_push_pointer(%5107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5111 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5112 = arith.constant 1 : i64
      %5113 = func.call @cc_make_string(%5111, %5112) : (!llvm.ptr, i64) -> i64
      %5114 = func.call @cc_nil_value() : () -> i64
      %5115 = func.call @cc_intern(%5113, %5114) : (i64, i64) -> i64
      %5116 = func.call @cc_nil_value() : () -> i64
      %5117 = func.call @cc_cons(%5115, %5116) : (i64, i64) -> i64
      %5118 = func.call @cc_values_pack(%5117) : (i64) -> i64
      func.call @stack_push_pointer(%5115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5119 = func.call @stack_pop_pointer() : () -> i64
      %5120 = func.call @stack_pop_pointer() : () -> i64
      %5121 = func.call @cc_cons(%5120, %5119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %5122 = arith.addi %5121, %__rlasp_stack_elide_zero_307 : i64
      %5123 = func.call @stack_pop_pointer() : () -> i64
      %5124 = func.call @cc_cons(%5123, %5122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %5125 = arith.addi %5124, %__rlasp_stack_elide_zero_308 : i64
      %5126 = func.call @stack_pop_pointer() : () -> i64
      %5127 = func.call @cc_cons(%5126, %5125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5127) : (i64) -> ()
      %5128 = llvm.mlir.addressof @str422 : !llvm.ptr
      %5129 = arith.constant 6 : i64
      %5130 = func.call @cc_make_string(%5128, %5129) : (!llvm.ptr, i64) -> i64
      %5131 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5132 = arith.constant 11 : i64
      %5133 = func.call @cc_make_string(%5131, %5132) : (!llvm.ptr, i64) -> i64
      %5134 = func.call @cc_intern(%5130, %5133) : (i64, i64) -> i64
      %5135 = func.call @cc_nil_value() : () -> i64
      %5136 = func.call @cc_cons(%5134, %5135) : (i64, i64) -> i64
      %5137 = func.call @cc_values_pack(%5136) : (i64) -> i64
      func.call @stack_push_pointer(%5134) : (i64) -> ()
      %5138 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5139 = arith.constant 7 : i64
      %5140 = func.call @cc_make_string(%5138, %5139) : (!llvm.ptr, i64) -> i64
      %5141 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5142 = arith.constant 11 : i64
      %5143 = func.call @cc_make_string(%5141, %5142) : (!llvm.ptr, i64) -> i64
      %5144 = func.call @cc_intern(%5140, %5143) : (i64, i64) -> i64
      %5145 = func.call @cc_nil_value() : () -> i64
      %5146 = func.call @cc_cons(%5144, %5145) : (i64, i64) -> i64
      %5147 = func.call @cc_values_pack(%5146) : (i64) -> i64
      func.call @stack_push_pointer(%5144) : (i64) -> ()
      %5148 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5149 = arith.constant 1 : i64
      %5150 = func.call @cc_make_string(%5148, %5149) : (!llvm.ptr, i64) -> i64
      %5151 = func.call @cc_nil_value() : () -> i64
      %5152 = func.call @cc_intern(%5150, %5151) : (i64, i64) -> i64
      %5153 = func.call @cc_nil_value() : () -> i64
      %5154 = func.call @cc_cons(%5152, %5153) : (i64, i64) -> i64
      %5155 = func.call @cc_values_pack(%5154) : (i64) -> i64
      func.call @stack_push_pointer(%5152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5156 = func.call @stack_pop_pointer() : () -> i64
      %5157 = func.call @stack_pop_pointer() : () -> i64
      %5158 = func.call @cc_cons(%5157, %5156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %5159 = arith.addi %5158, %__rlasp_stack_elide_zero_309 : i64
      %5160 = func.call @stack_pop_pointer() : () -> i64
      %5161 = func.call @cc_cons(%5160, %5159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5161) : (i64) -> ()
      %5162 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5163 = arith.constant 9 : i64
      %5164 = func.call @cc_make_string(%5162, %5163) : (!llvm.ptr, i64) -> i64
      %5165 = func.call @cc_nil_value() : () -> i64
      %5166 = func.call @cc_intern(%5164, %5165) : (i64, i64) -> i64
      %5167 = func.call @cc_nil_value() : () -> i64
      %5168 = func.call @cc_cons(%5166, %5167) : (i64, i64) -> i64
      %5169 = func.call @cc_values_pack(%5168) : (i64) -> i64
      func.call @stack_push_pointer(%5166) : (i64) -> ()
      %5170 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5171 = arith.constant 8 : i64
      %5172 = func.call @cc_make_string(%5170, %5171) : (!llvm.ptr, i64) -> i64
      %5173 = func.call @cc_nil_value() : () -> i64
      %5174 = func.call @cc_intern(%5172, %5173) : (i64, i64) -> i64
      %5175 = func.call @cc_nil_value() : () -> i64
      %5176 = func.call @cc_cons(%5174, %5175) : (i64, i64) -> i64
      %5177 = func.call @cc_values_pack(%5176) : (i64) -> i64
      func.call @stack_push_pointer(%5174) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5178 = func.call @stack_pop_pointer() : () -> i64
      %5179 = func.call @stack_pop_pointer() : () -> i64
      %5180 = func.call @cc_cons(%5179, %5178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %5181 = arith.addi %5180, %__rlasp_stack_elide_zero_310 : i64
      %5182 = func.call @stack_pop_pointer() : () -> i64
      %5183 = func.call @cc_cons(%5182, %5181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %5184 = arith.addi %5183, %__rlasp_stack_elide_zero_311 : i64
      %5185 = func.call @stack_pop_pointer() : () -> i64
      %5186 = func.call @cc_cons(%5185, %5184) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %5187 = arith.addi %5186, %__rlasp_stack_elide_zero_312 : i64
      %5188 = func.call @stack_pop_pointer() : () -> i64
      %5189 = func.call @cc_cons(%5188, %5187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5190 = func.call @stack_pop_pointer() : () -> i64
      %5191 = func.call @stack_pop_pointer() : () -> i64
      %5192 = func.call @cc_cons(%5191, %5190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %5193 = arith.addi %5192, %__rlasp_stack_elide_zero_313 : i64
      %5194 = func.call @stack_pop_pointer() : () -> i64
      %5195 = func.call @cc_cons(%5194, %5193) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %5196 = arith.addi %5195, %__rlasp_stack_elide_zero_314 : i64
      %5197 = func.call @stack_pop_pointer() : () -> i64
      %5198 = func.call @cc_cons(%5197, %5196) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %5199 = arith.addi %5198, %__rlasp_stack_elide_zero_315 : i64
      %5200 = func.call @stack_pop_pointer() : () -> i64
      %5201 = func.call @cc_cons(%5200, %5199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5201) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5202 = func.call @stack_pop_pointer() : () -> i64
      %5203 = func.call @stack_pop_pointer() : () -> i64
      %5204 = func.call @cc_cons(%5203, %5202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %5205 = arith.addi %5204, %__rlasp_stack_elide_zero_316 : i64
      %5206 = func.call @stack_pop_pointer() : () -> i64
      %5207 = func.call @cc_cons(%5206, %5205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %5208 = arith.addi %5207, %__rlasp_stack_elide_zero_317 : i64
      %5209 = func.call @stack_pop_pointer() : () -> i64
      %5210 = func.call @cc_cons(%5209, %5208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %5211 = arith.addi %5210, %__rlasp_stack_elide_zero_318 : i64
      %5212 = func.call @stack_pop_pointer() : () -> i64
      %5213 = func.call @cc_cons(%5212, %5211) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %5214 = arith.addi %5213, %__rlasp_stack_elide_zero_319 : i64
      %5215 = func.call @stack_pop_pointer() : () -> i64
      %5216 = func.call @cc_cons(%5215, %5214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %5217 = arith.addi %5216, %__rlasp_stack_elide_zero_320 : i64
      %5370 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5371 = arith.constant 30 : i64
      %5372 = func.call @cc_make_symbol(%5370, %5371) : (!llvm.ptr, i64) -> i64
      %5373 = func.call @cc_persistent_root_value(%5372) : (i64) -> i64
      func.call @stack_push_pointer(%5373) : (i64) -> ()
      %5374 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5375 = arith.constant 37 : i64
      %5376 = func.call @cc_make_symbol(%5374, %5375) : (!llvm.ptr, i64) -> i64
      %5377 = func.call @cc_persistent_root_value(%5376) : (i64) -> i64
      func.call @stack_push_pointer(%5377) : (i64) -> ()
      %5378 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5379 = arith.constant 38 : i64
      %5380 = func.call @cc_make_symbol(%5378, %5379) : (!llvm.ptr, i64) -> i64
      %5381 = func.call @cc_persistent_root_value(%5380) : (i64) -> i64
      func.call @stack_push_pointer(%5381) : (i64) -> ()
      %5382 = arith.constant 275462358040632 : i64
      %5383 = arith.constant 3 : i64
      %5384 = func.call @cc_make_closure(%5382, %5383) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %5385 = arith.addi %5384, %__rlasp_stack_elide_zero_321 : i64
      %5386 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5387 = func.call @stack_pop_pointer() : () -> i64
      %5388 = func.call @stack_pop_pointer() : () -> i64
      %5389 = func.call @cc_cons(%5388, %5387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %5390 = arith.addi %5389, %__rlasp_stack_elide_zero_322 : i64
      %5391 = func.call @stack_pop_pointer() : () -> i64
      %5392 = func.call @cc_cons(%5391, %5390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %5393 = arith.addi %5392, %__rlasp_stack_elide_zero_323 : i64
      %5394 = func.call @stack_pop_pointer() : () -> i64
      %5395 = func.call @cc_cons(%5394, %5393) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %5396 = arith.addi %5395, %__rlasp_stack_elide_zero_324 : i64
      %5397 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5398 = arith.constant 11 : i64
      %5399 = func.call @cc_make_string(%5397, %5398) : (!llvm.ptr, i64) -> i64
      %5400 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5401 = arith.constant 7 : i64
      %5402 = func.call @cc_make_string(%5400, %5401) : (!llvm.ptr, i64) -> i64
      %5403 = func.call @cc_intern(%5399, %5402) : (i64, i64) -> i64
      %5404 = func.call @cc_nil_value() : () -> i64
      %5405 = func.call @cc_cons(%5403, %5404) : (i64, i64) -> i64
      %5406 = func.call @cc_values_pack(%5405) : (i64) -> i64
      %5407 = func.call @cc_nil_value() : () -> i64
      %5408 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5409 = arith.constant 4 : i64
      %5410 = func.call @cc_make_string(%5408, %5409) : (!llvm.ptr, i64) -> i64
      %5411 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5412 = arith.constant 7 : i64
      %5413 = func.call @cc_make_string(%5411, %5412) : (!llvm.ptr, i64) -> i64
      %5414 = func.call @cc_intern(%5410, %5413) : (i64, i64) -> i64
      %5415 = func.call @cc_nil_value() : () -> i64
      %5416 = func.call @cc_cons(%5414, %5415) : (i64, i64) -> i64
      %5417 = func.call @cc_values_pack(%5416) : (i64) -> i64
      %5418 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5419 = arith.constant 6 : i64
      %5420 = func.call @cc_make_string(%5418, %5419) : (!llvm.ptr, i64) -> i64
      %5421 = func.call @cc_nil_value() : () -> i64
      %5422 = func.call @cc_intern(%5420, %5421) : (i64, i64) -> i64
      %5423 = func.call @cc_nil_value() : () -> i64
      %5424 = func.call @cc_cons(%5422, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_values_pack(%5424) : (i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %5426 = arith.addi %5422, %__rlasp_stack_elide_zero_325 : i64
      %5427 = func.call @cc_nil_value() : () -> i64
      %5428 = func.call @cc_errorp(%4871) : (i64) -> i64
      %5429 = arith.cmpi ne, %5428, %5427 : i64
      %5430 = arith.cmpi eq, %5427, %5427 : i64
      %5431 = arith.andi %5429, %5430 : i1
      %5432 = scf.if %5431 -> (i64) {
        scf.yield %4871 : i64
      } else {
        scf.yield %5427 : i64
      }
      %5433 = func.call @cc_errorp(%5217) : (i64) -> i64
      %5434 = arith.cmpi ne, %5433, %5427 : i64
      %5435 = arith.cmpi eq, %5432, %5427 : i64
      %5436 = arith.andi %5434, %5435 : i1
      %5437 = scf.if %5436 -> (i64) {
        scf.yield %5217 : i64
      } else {
        scf.yield %5432 : i64
      }
      %5438 = func.call @cc_errorp(%5385) : (i64) -> i64
      %5439 = arith.cmpi ne, %5438, %5427 : i64
      %5440 = arith.cmpi eq, %5437, %5427 : i64
      %5441 = arith.andi %5439, %5440 : i1
      %5442 = scf.if %5441 -> (i64) {
        scf.yield %5385 : i64
      } else {
        scf.yield %5437 : i64
      }
      %5443 = func.call @cc_errorp(%5396) : (i64) -> i64
      %5444 = arith.cmpi ne, %5443, %5427 : i64
      %5445 = arith.cmpi eq, %5442, %5427 : i64
      %5446 = arith.andi %5444, %5445 : i1
      %5447 = scf.if %5446 -> (i64) {
        scf.yield %5396 : i64
      } else {
        scf.yield %5442 : i64
      }
      %5448 = func.call @cc_errorp(%5403) : (i64) -> i64
      %5449 = arith.cmpi ne, %5448, %5427 : i64
      %5450 = arith.cmpi eq, %5447, %5427 : i64
      %5451 = arith.andi %5449, %5450 : i1
      %5452 = scf.if %5451 -> (i64) {
        scf.yield %5403 : i64
      } else {
        scf.yield %5447 : i64
      }
      %5453 = func.call @cc_errorp(%5407) : (i64) -> i64
      %5454 = arith.cmpi ne, %5453, %5427 : i64
      %5455 = arith.cmpi eq, %5452, %5427 : i64
      %5456 = arith.andi %5454, %5455 : i1
      %5457 = scf.if %5456 -> (i64) {
        scf.yield %5407 : i64
      } else {
        scf.yield %5452 : i64
      }
      %5458 = func.call @cc_errorp(%5414) : (i64) -> i64
      %5459 = arith.cmpi ne, %5458, %5427 : i64
      %5460 = arith.cmpi eq, %5457, %5427 : i64
      %5461 = arith.andi %5459, %5460 : i1
      %5462 = scf.if %5461 -> (i64) {
        scf.yield %5414 : i64
      } else {
        scf.yield %5457 : i64
      }
      %5463 = func.call @cc_errorp(%5426) : (i64) -> i64
      %5464 = arith.cmpi ne, %5463, %5427 : i64
      %5465 = arith.cmpi eq, %5462, %5427 : i64
      %5466 = arith.andi %5464, %5465 : i1
      %5467 = scf.if %5466 -> (i64) {
        scf.yield %5426 : i64
      } else {
        scf.yield %5462 : i64
      }
      %5468 = arith.cmpi ne, %5467, %5427 : i64
      scf.if %5468 {
        func.call @stack_push_pointer(%5467) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4871) : (i64) -> ()
        func.call @stack_push_pointer(%5217) : (i64) -> ()
        func.call @stack_push_pointer(%5385) : (i64) -> ()
        func.call @stack_push_pointer(%5396) : (i64) -> ()
        func.call @stack_push_pointer(%5403) : (i64) -> ()
        func.call @stack_push_pointer(%5407) : (i64) -> ()
        func.call @stack_push_pointer(%5414) : (i64) -> ()
        func.call @stack_push_pointer(%5426) : (i64) -> ()
        %5469 = llvm.mlir.addressof @str439 : !llvm.ptr
        %5470 = func.call @cc_make_function_ref_const(%5469) : (!llvm.ptr) -> i64
        %5471 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5470, %5471) : (i64, i64) -> ()
      }
      %5472 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5472 : i64
    }
    %5473 = func.call @cc_nil_value() : () -> i64
    %5474 = func.call @cc_errorp(%4862) : (i64) -> i64
    %5475 = arith.cmpi ne, %5474, %5473 : i64
    %5476 = scf.if %5475 -> (i64) {
      scf.yield %4862 : i64
    } else {
      %5477 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5478 = arith.constant 9 : i64
      %5479 = func.call @cc_make_string(%5477, %5478) : (!llvm.ptr, i64) -> i64
      %5480 = func.call @cc_nil_value() : () -> i64
      %5481 = func.call @cc_intern(%5479, %5480) : (i64, i64) -> i64
      %5482 = func.call @cc_nil_value() : () -> i64
      %5483 = func.call @cc_cons(%5481, %5482) : (i64, i64) -> i64
      %5484 = func.call @cc_values_pack(%5483) : (i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %5485 = arith.addi %5481, %__rlasp_stack_elide_zero_326 : i64
      %5486 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5487 = arith.constant 4 : i64
      %5488 = func.call @cc_make_string(%5486, %5487) : (!llvm.ptr, i64) -> i64
      %5489 = func.call @cc_nil_value() : () -> i64
      %5490 = func.call @cc_intern(%5488, %5489) : (i64, i64) -> i64
      %5491 = func.call @cc_nil_value() : () -> i64
      %5492 = func.call @cc_cons(%5490, %5491) : (i64, i64) -> i64
      %5493 = func.call @cc_values_pack(%5492) : (i64) -> i64
      func.call @stack_push_pointer(%5490) : (i64) -> ()
      %5494 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5495 = arith.constant 1 : i64
      %5496 = func.call @cc_make_string(%5494, %5495) : (!llvm.ptr, i64) -> i64
      %5497 = func.call @cc_nil_value() : () -> i64
      %5498 = func.call @cc_intern(%5496, %5497) : (i64, i64) -> i64
      %5499 = func.call @cc_nil_value() : () -> i64
      %5500 = func.call @cc_cons(%5498, %5499) : (i64, i64) -> i64
      %5501 = func.call @cc_values_pack(%5500) : (i64) -> i64
      func.call @stack_push_pointer(%5498) : (i64) -> ()
      %5502 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5503 = arith.constant 11 : i64
      %5504 = func.call @cc_make_string(%5502, %5503) : (!llvm.ptr, i64) -> i64
      %5505 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5506 = arith.constant 3 : i64
      %5507 = func.call @cc_make_string(%5505, %5506) : (!llvm.ptr, i64) -> i64
      %5508 = func.call @cc_intern(%5504, %5507) : (i64, i64) -> i64
      %5509 = func.call @cc_nil_value() : () -> i64
      %5510 = func.call @cc_cons(%5508, %5509) : (i64, i64) -> i64
      %5511 = func.call @cc_values_pack(%5510) : (i64) -> i64
      func.call @stack_push_pointer(%5508) : (i64) -> ()
      %5512 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5512) : (i64) -> ()
      %5513 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5514 = arith.constant 6 : i64
      %5515 = func.call @cc_make_string(%5513, %5514) : (!llvm.ptr, i64) -> i64
      %5516 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5517 = arith.constant 11 : i64
      %5518 = func.call @cc_make_string(%5516, %5517) : (!llvm.ptr, i64) -> i64
      %5519 = func.call @cc_intern(%5515, %5518) : (i64, i64) -> i64
      %5520 = func.call @cc_nil_value() : () -> i64
      %5521 = func.call @cc_cons(%5519, %5520) : (i64, i64) -> i64
      %5522 = func.call @cc_values_pack(%5521) : (i64) -> i64
      func.call @stack_push_pointer(%5519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5523 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5524 = arith.constant 4 : i64
      %5525 = func.call @cc_make_string(%5523, %5524) : (!llvm.ptr, i64) -> i64
      %5526 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5527 = arith.constant 11 : i64
      %5528 = func.call @cc_make_string(%5526, %5527) : (!llvm.ptr, i64) -> i64
      %5529 = func.call @cc_intern(%5525, %5528) : (i64, i64) -> i64
      %5530 = func.call @cc_nil_value() : () -> i64
      %5531 = func.call @cc_cons(%5529, %5530) : (i64, i64) -> i64
      %5532 = func.call @cc_values_pack(%5531) : (i64) -> i64
      func.call @stack_push_pointer(%5529) : (i64) -> ()
      %5533 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5534 = arith.constant 3 : i64
      %5535 = func.call @cc_make_string(%5533, %5534) : (!llvm.ptr, i64) -> i64
      %5536 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5537 = arith.constant 11 : i64
      %5538 = func.call @cc_make_string(%5536, %5537) : (!llvm.ptr, i64) -> i64
      %5539 = func.call @cc_intern(%5535, %5538) : (i64, i64) -> i64
      %5540 = func.call @cc_nil_value() : () -> i64
      %5541 = func.call @cc_cons(%5539, %5540) : (i64, i64) -> i64
      %5542 = func.call @cc_values_pack(%5541) : (i64) -> i64
      func.call @stack_push_pointer(%5539) : (i64) -> ()
      %5543 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5544 = arith.constant 15 : i64
      %5545 = func.call @cc_make_string(%5543, %5544) : (!llvm.ptr, i64) -> i64
      %5546 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5547 = arith.constant 11 : i64
      %5548 = func.call @cc_make_string(%5546, %5547) : (!llvm.ptr, i64) -> i64
      %5549 = func.call @cc_intern(%5545, %5548) : (i64, i64) -> i64
      %5550 = func.call @cc_nil_value() : () -> i64
      %5551 = func.call @cc_cons(%5549, %5550) : (i64, i64) -> i64
      %5552 = func.call @cc_values_pack(%5551) : (i64) -> i64
      func.call @stack_push_pointer(%5549) : (i64) -> ()
      %5553 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5554 = arith.constant 4 : i64
      %5555 = func.call @cc_make_string(%5553, %5554) : (!llvm.ptr, i64) -> i64
      %5556 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5557 = arith.constant 11 : i64
      %5558 = func.call @cc_make_string(%5556, %5557) : (!llvm.ptr, i64) -> i64
      %5559 = func.call @cc_intern(%5555, %5558) : (i64, i64) -> i64
      %5560 = func.call @cc_nil_value() : () -> i64
      %5561 = func.call @cc_cons(%5559, %5560) : (i64, i64) -> i64
      %5562 = func.call @cc_values_pack(%5561) : (i64) -> i64
      func.call @stack_push_pointer(%5559) : (i64) -> ()
      %5563 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%5563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5564 = func.call @stack_pop_pointer() : () -> i64
      %5565 = func.call @stack_pop_pointer() : () -> i64
      %5566 = func.call @cc_cons(%5565, %5564) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %5567 = arith.addi %5566, %__rlasp_stack_elide_zero_327 : i64
      %5568 = func.call @stack_pop_pointer() : () -> i64
      %5569 = func.call @cc_cons(%5568, %5567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5569) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5570 = func.call @stack_pop_pointer() : () -> i64
      %5571 = func.call @stack_pop_pointer() : () -> i64
      %5572 = func.call @cc_cons(%5571, %5570) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %5573 = arith.addi %5572, %__rlasp_stack_elide_zero_328 : i64
      %5574 = func.call @stack_pop_pointer() : () -> i64
      %5575 = func.call @cc_cons(%5574, %5573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5575) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5576 = func.call @stack_pop_pointer() : () -> i64
      %5577 = func.call @stack_pop_pointer() : () -> i64
      %5578 = func.call @cc_cons(%5577, %5576) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %5579 = arith.addi %5578, %__rlasp_stack_elide_zero_329 : i64
      %5580 = func.call @stack_pop_pointer() : () -> i64
      %5581 = func.call @cc_cons(%5580, %5579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5582 = func.call @stack_pop_pointer() : () -> i64
      %5583 = func.call @stack_pop_pointer() : () -> i64
      %5584 = func.call @cc_cons(%5583, %5582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %5585 = arith.addi %5584, %__rlasp_stack_elide_zero_330 : i64
      %5586 = func.call @stack_pop_pointer() : () -> i64
      %5587 = func.call @cc_cons(%5586, %5585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5588 = func.call @stack_pop_pointer() : () -> i64
      %5589 = func.call @stack_pop_pointer() : () -> i64
      %5590 = func.call @cc_cons(%5589, %5588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %5591 = arith.addi %5590, %__rlasp_stack_elide_zero_331 : i64
      %5592 = func.call @stack_pop_pointer() : () -> i64
      %5593 = func.call @cc_cons(%5592, %5591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %5594 = arith.addi %5593, %__rlasp_stack_elide_zero_332 : i64
      %5595 = func.call @stack_pop_pointer() : () -> i64
      %5596 = func.call @cc_cons(%5595, %5594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %5597 = arith.addi %5596, %__rlasp_stack_elide_zero_333 : i64
      %5598 = func.call @stack_pop_pointer() : () -> i64
      %5599 = func.call @cc_cons(%5597, %5598) : (i64, i64) -> i64
      %5600 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5601 = arith.constant 5 : i64
      %5602 = func.call @cc_make_string(%5600, %5601) : (!llvm.ptr, i64) -> i64
      %5603 = func.call @cc_nil_value() : () -> i64
      %5604 = func.call @cc_intern(%5602, %5603) : (i64, i64) -> i64
      %5605 = func.call @cc_nil_value() : () -> i64
      %5606 = func.call @cc_cons(%5604, %5605) : (i64, i64) -> i64
      %5607 = func.call @cc_values_pack(%5606) : (i64) -> i64
      %5608 = func.call @cc_cons(%5604, %5599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5608) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5609 = func.call @stack_pop_pointer() : () -> i64
      %5610 = func.call @stack_pop_pointer() : () -> i64
      %5611 = func.call @cc_cons(%5610, %5609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %5612 = arith.addi %5611, %__rlasp_stack_elide_zero_334 : i64
      %5613 = func.call @stack_pop_pointer() : () -> i64
      %5614 = func.call @cc_cons(%5613, %5612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5614) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5615 = func.call @stack_pop_pointer() : () -> i64
      %5616 = func.call @stack_pop_pointer() : () -> i64
      %5617 = func.call @cc_cons(%5616, %5615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %5618 = arith.addi %5617, %__rlasp_stack_elide_zero_335 : i64
      %5619 = func.call @stack_pop_pointer() : () -> i64
      %5620 = func.call @cc_cons(%5619, %5618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5620) : (i64) -> ()
      %5621 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5622 = arith.constant 2 : i64
      %5623 = func.call @cc_make_string(%5621, %5622) : (!llvm.ptr, i64) -> i64
      %5624 = func.call @cc_nil_value() : () -> i64
      %5625 = func.call @cc_intern(%5623, %5624) : (i64, i64) -> i64
      %5626 = func.call @cc_nil_value() : () -> i64
      %5627 = func.call @cc_cons(%5625, %5626) : (i64, i64) -> i64
      %5628 = func.call @cc_values_pack(%5627) : (i64) -> i64
      func.call @stack_push_pointer(%5625) : (i64) -> ()
      %5629 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5630 = arith.constant 7 : i64
      %5631 = func.call @cc_make_string(%5629, %5630) : (!llvm.ptr, i64) -> i64
      %5632 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5633 = arith.constant 11 : i64
      %5634 = func.call @cc_make_string(%5632, %5633) : (!llvm.ptr, i64) -> i64
      %5635 = func.call @cc_intern(%5631, %5634) : (i64, i64) -> i64
      %5636 = func.call @cc_nil_value() : () -> i64
      %5637 = func.call @cc_cons(%5635, %5636) : (i64, i64) -> i64
      %5638 = func.call @cc_values_pack(%5637) : (i64) -> i64
      func.call @stack_push_pointer(%5635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5639 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5640 = arith.constant 1 : i64
      %5641 = func.call @cc_make_string(%5639, %5640) : (!llvm.ptr, i64) -> i64
      %5642 = func.call @cc_nil_value() : () -> i64
      %5643 = func.call @cc_intern(%5641, %5642) : (i64, i64) -> i64
      %5644 = func.call @cc_nil_value() : () -> i64
      %5645 = func.call @cc_cons(%5643, %5644) : (i64, i64) -> i64
      %5646 = func.call @cc_values_pack(%5645) : (i64) -> i64
      func.call @stack_push_pointer(%5643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5647 = func.call @stack_pop_pointer() : () -> i64
      %5648 = func.call @stack_pop_pointer() : () -> i64
      %5649 = func.call @cc_cons(%5648, %5647) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %5650 = arith.addi %5649, %__rlasp_stack_elide_zero_336 : i64
      %5651 = func.call @stack_pop_pointer() : () -> i64
      %5652 = func.call @cc_cons(%5651, %5650) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %5653 = arith.addi %5652, %__rlasp_stack_elide_zero_337 : i64
      %5654 = func.call @stack_pop_pointer() : () -> i64
      %5655 = func.call @cc_cons(%5654, %5653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5655) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5656 = func.call @stack_pop_pointer() : () -> i64
      %5657 = func.call @stack_pop_pointer() : () -> i64
      %5658 = func.call @cc_cons(%5657, %5656) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %5659 = arith.addi %5658, %__rlasp_stack_elide_zero_338 : i64
      %5660 = func.call @stack_pop_pointer() : () -> i64
      %5661 = func.call @cc_cons(%5660, %5659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5661) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5662 = func.call @stack_pop_pointer() : () -> i64
      %5663 = func.call @stack_pop_pointer() : () -> i64
      %5664 = func.call @cc_cons(%5663, %5662) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %5665 = arith.addi %5664, %__rlasp_stack_elide_zero_339 : i64
      %5666 = func.call @stack_pop_pointer() : () -> i64
      %5667 = func.call @cc_cons(%5666, %5665) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5667) : (i64) -> ()
      %5668 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5669 = arith.constant 7 : i64
      %5670 = func.call @cc_make_string(%5668, %5669) : (!llvm.ptr, i64) -> i64
      %5671 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5672 = arith.constant 11 : i64
      %5673 = func.call @cc_make_string(%5671, %5672) : (!llvm.ptr, i64) -> i64
      %5674 = func.call @cc_intern(%5670, %5673) : (i64, i64) -> i64
      %5675 = func.call @cc_nil_value() : () -> i64
      %5676 = func.call @cc_cons(%5674, %5675) : (i64, i64) -> i64
      %5677 = func.call @cc_values_pack(%5676) : (i64) -> i64
      func.call @stack_push_pointer(%5674) : (i64) -> ()
      %5678 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5679 = arith.constant 2 : i64
      %5680 = func.call @cc_make_string(%5678, %5679) : (!llvm.ptr, i64) -> i64
      %5681 = func.call @cc_nil_value() : () -> i64
      %5682 = func.call @cc_intern(%5680, %5681) : (i64, i64) -> i64
      %5683 = func.call @cc_nil_value() : () -> i64
      %5684 = func.call @cc_cons(%5682, %5683) : (i64, i64) -> i64
      %5685 = func.call @cc_values_pack(%5684) : (i64) -> i64
      func.call @stack_push_pointer(%5682) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5686 = func.call @stack_pop_pointer() : () -> i64
      %5687 = func.call @stack_pop_pointer() : () -> i64
      %5688 = func.call @cc_cons(%5687, %5686) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %5689 = arith.addi %5688, %__rlasp_stack_elide_zero_340 : i64
      %5690 = func.call @stack_pop_pointer() : () -> i64
      %5691 = func.call @cc_cons(%5690, %5689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5691) : (i64) -> ()
      %5692 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5693 = arith.constant 7 : i64
      %5694 = func.call @cc_make_string(%5692, %5693) : (!llvm.ptr, i64) -> i64
      %5695 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5696 = arith.constant 11 : i64
      %5697 = func.call @cc_make_string(%5695, %5696) : (!llvm.ptr, i64) -> i64
      %5698 = func.call @cc_intern(%5694, %5697) : (i64, i64) -> i64
      %5699 = func.call @cc_nil_value() : () -> i64
      %5700 = func.call @cc_cons(%5698, %5699) : (i64, i64) -> i64
      %5701 = func.call @cc_values_pack(%5700) : (i64) -> i64
      func.call @stack_push_pointer(%5698) : (i64) -> ()
      %5702 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5703 = arith.constant 2 : i64
      %5704 = func.call @cc_make_string(%5702, %5703) : (!llvm.ptr, i64) -> i64
      %5705 = func.call @cc_nil_value() : () -> i64
      %5706 = func.call @cc_intern(%5704, %5705) : (i64, i64) -> i64
      %5707 = func.call @cc_nil_value() : () -> i64
      %5708 = func.call @cc_cons(%5706, %5707) : (i64, i64) -> i64
      %5709 = func.call @cc_values_pack(%5708) : (i64) -> i64
      func.call @stack_push_pointer(%5706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5710 = func.call @stack_pop_pointer() : () -> i64
      %5711 = func.call @stack_pop_pointer() : () -> i64
      %5712 = func.call @cc_cons(%5711, %5710) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %5713 = arith.addi %5712, %__rlasp_stack_elide_zero_341 : i64
      %5714 = func.call @stack_pop_pointer() : () -> i64
      %5715 = func.call @cc_cons(%5714, %5713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5715) : (i64) -> ()
      %5716 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5717 = arith.constant 7 : i64
      %5718 = func.call @cc_make_string(%5716, %5717) : (!llvm.ptr, i64) -> i64
      %5719 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5720 = arith.constant 11 : i64
      %5721 = func.call @cc_make_string(%5719, %5720) : (!llvm.ptr, i64) -> i64
      %5722 = func.call @cc_intern(%5718, %5721) : (i64, i64) -> i64
      %5723 = func.call @cc_nil_value() : () -> i64
      %5724 = func.call @cc_cons(%5722, %5723) : (i64, i64) -> i64
      %5725 = func.call @cc_values_pack(%5724) : (i64) -> i64
      func.call @stack_push_pointer(%5722) : (i64) -> ()
      %5726 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5727 = arith.constant 2 : i64
      %5728 = func.call @cc_make_string(%5726, %5727) : (!llvm.ptr, i64) -> i64
      %5729 = func.call @cc_nil_value() : () -> i64
      %5730 = func.call @cc_intern(%5728, %5729) : (i64, i64) -> i64
      %5731 = func.call @cc_nil_value() : () -> i64
      %5732 = func.call @cc_cons(%5730, %5731) : (i64, i64) -> i64
      %5733 = func.call @cc_values_pack(%5732) : (i64) -> i64
      func.call @stack_push_pointer(%5730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5734 = func.call @stack_pop_pointer() : () -> i64
      %5735 = func.call @stack_pop_pointer() : () -> i64
      %5736 = func.call @cc_cons(%5735, %5734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %5737 = arith.addi %5736, %__rlasp_stack_elide_zero_342 : i64
      %5738 = func.call @stack_pop_pointer() : () -> i64
      %5739 = func.call @cc_cons(%5738, %5737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5740 = func.call @stack_pop_pointer() : () -> i64
      %5741 = func.call @stack_pop_pointer() : () -> i64
      %5742 = func.call @cc_cons(%5741, %5740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %5743 = arith.addi %5742, %__rlasp_stack_elide_zero_343 : i64
      %5744 = func.call @stack_pop_pointer() : () -> i64
      %5745 = func.call @cc_cons(%5744, %5743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %5746 = arith.addi %5745, %__rlasp_stack_elide_zero_344 : i64
      %5747 = func.call @stack_pop_pointer() : () -> i64
      %5748 = func.call @cc_cons(%5747, %5746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %5749 = arith.addi %5748, %__rlasp_stack_elide_zero_345 : i64
      %5750 = func.call @stack_pop_pointer() : () -> i64
      %5751 = func.call @cc_cons(%5750, %5749) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %5752 = arith.addi %5751, %__rlasp_stack_elide_zero_346 : i64
      %5753 = func.call @stack_pop_pointer() : () -> i64
      %5754 = func.call @cc_cons(%5753, %5752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %5755 = arith.addi %5754, %__rlasp_stack_elide_zero_347 : i64
      %5884 = arith.constant 275462358040637 : i64
      %5885 = arith.constant 0 : i64
      %5886 = func.call @cc_make_closure(%5884, %5885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %5887 = arith.addi %5886, %__rlasp_stack_elide_zero_348 : i64
      %5888 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5888) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5889 = func.call @stack_pop_pointer() : () -> i64
      %5890 = func.call @stack_pop_pointer() : () -> i64
      %5891 = func.call @cc_cons(%5890, %5889) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %5892 = arith.addi %5891, %__rlasp_stack_elide_zero_349 : i64
      %5893 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5894 = arith.constant 11 : i64
      %5895 = func.call @cc_make_string(%5893, %5894) : (!llvm.ptr, i64) -> i64
      %5896 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5897 = arith.constant 7 : i64
      %5898 = func.call @cc_make_string(%5896, %5897) : (!llvm.ptr, i64) -> i64
      %5899 = func.call @cc_intern(%5895, %5898) : (i64, i64) -> i64
      %5900 = func.call @cc_nil_value() : () -> i64
      %5901 = func.call @cc_cons(%5899, %5900) : (i64, i64) -> i64
      %5902 = func.call @cc_values_pack(%5901) : (i64) -> i64
      %5903 = func.call @cc_nil_value() : () -> i64
      %5904 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5905 = arith.constant 4 : i64
      %5906 = func.call @cc_make_string(%5904, %5905) : (!llvm.ptr, i64) -> i64
      %5907 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5908 = arith.constant 7 : i64
      %5909 = func.call @cc_make_string(%5907, %5908) : (!llvm.ptr, i64) -> i64
      %5910 = func.call @cc_intern(%5906, %5909) : (i64, i64) -> i64
      %5911 = func.call @cc_nil_value() : () -> i64
      %5912 = func.call @cc_cons(%5910, %5911) : (i64, i64) -> i64
      %5913 = func.call @cc_values_pack(%5912) : (i64) -> i64
      %5914 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5915 = arith.constant 6 : i64
      %5916 = func.call @cc_make_string(%5914, %5915) : (!llvm.ptr, i64) -> i64
      %5917 = func.call @cc_nil_value() : () -> i64
      %5918 = func.call @cc_intern(%5916, %5917) : (i64, i64) -> i64
      %5919 = func.call @cc_nil_value() : () -> i64
      %5920 = func.call @cc_cons(%5918, %5919) : (i64, i64) -> i64
      %5921 = func.call @cc_values_pack(%5920) : (i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %5922 = arith.addi %5918, %__rlasp_stack_elide_zero_350 : i64
      %5923 = func.call @cc_nil_value() : () -> i64
      %5924 = func.call @cc_errorp(%5485) : (i64) -> i64
      %5925 = arith.cmpi ne, %5924, %5923 : i64
      %5926 = arith.cmpi eq, %5923, %5923 : i64
      %5927 = arith.andi %5925, %5926 : i1
      %5928 = scf.if %5927 -> (i64) {
        scf.yield %5485 : i64
      } else {
        scf.yield %5923 : i64
      }
      %5929 = func.call @cc_errorp(%5755) : (i64) -> i64
      %5930 = arith.cmpi ne, %5929, %5923 : i64
      %5931 = arith.cmpi eq, %5928, %5923 : i64
      %5932 = arith.andi %5930, %5931 : i1
      %5933 = scf.if %5932 -> (i64) {
        scf.yield %5755 : i64
      } else {
        scf.yield %5928 : i64
      }
      %5934 = func.call @cc_errorp(%5887) : (i64) -> i64
      %5935 = arith.cmpi ne, %5934, %5923 : i64
      %5936 = arith.cmpi eq, %5933, %5923 : i64
      %5937 = arith.andi %5935, %5936 : i1
      %5938 = scf.if %5937 -> (i64) {
        scf.yield %5887 : i64
      } else {
        scf.yield %5933 : i64
      }
      %5939 = func.call @cc_errorp(%5892) : (i64) -> i64
      %5940 = arith.cmpi ne, %5939, %5923 : i64
      %5941 = arith.cmpi eq, %5938, %5923 : i64
      %5942 = arith.andi %5940, %5941 : i1
      %5943 = scf.if %5942 -> (i64) {
        scf.yield %5892 : i64
      } else {
        scf.yield %5938 : i64
      }
      %5944 = func.call @cc_errorp(%5899) : (i64) -> i64
      %5945 = arith.cmpi ne, %5944, %5923 : i64
      %5946 = arith.cmpi eq, %5943, %5923 : i64
      %5947 = arith.andi %5945, %5946 : i1
      %5948 = scf.if %5947 -> (i64) {
        scf.yield %5899 : i64
      } else {
        scf.yield %5943 : i64
      }
      %5949 = func.call @cc_errorp(%5903) : (i64) -> i64
      %5950 = arith.cmpi ne, %5949, %5923 : i64
      %5951 = arith.cmpi eq, %5948, %5923 : i64
      %5952 = arith.andi %5950, %5951 : i1
      %5953 = scf.if %5952 -> (i64) {
        scf.yield %5903 : i64
      } else {
        scf.yield %5948 : i64
      }
      %5954 = func.call @cc_errorp(%5910) : (i64) -> i64
      %5955 = arith.cmpi ne, %5954, %5923 : i64
      %5956 = arith.cmpi eq, %5953, %5923 : i64
      %5957 = arith.andi %5955, %5956 : i1
      %5958 = scf.if %5957 -> (i64) {
        scf.yield %5910 : i64
      } else {
        scf.yield %5953 : i64
      }
      %5959 = func.call @cc_errorp(%5922) : (i64) -> i64
      %5960 = arith.cmpi ne, %5959, %5923 : i64
      %5961 = arith.cmpi eq, %5958, %5923 : i64
      %5962 = arith.andi %5960, %5961 : i1
      %5963 = scf.if %5962 -> (i64) {
        scf.yield %5922 : i64
      } else {
        scf.yield %5958 : i64
      }
      %5964 = arith.cmpi ne, %5963, %5923 : i64
      scf.if %5964 {
        func.call @stack_push_pointer(%5963) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5485) : (i64) -> ()
        func.call @stack_push_pointer(%5755) : (i64) -> ()
        func.call @stack_push_pointer(%5887) : (i64) -> ()
        func.call @stack_push_pointer(%5892) : (i64) -> ()
        func.call @stack_push_pointer(%5899) : (i64) -> ()
        func.call @stack_push_pointer(%5903) : (i64) -> ()
        func.call @stack_push_pointer(%5910) : (i64) -> ()
        func.call @stack_push_pointer(%5922) : (i64) -> ()
        %5965 = llvm.mlir.addressof @str476 : !llvm.ptr
        %5966 = func.call @cc_make_function_ref_const(%5965) : (!llvm.ptr) -> i64
        %5967 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5966, %5967) : (i64, i64) -> ()
      }
      %5968 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5968 : i64
    }
    %5969 = func.call @cc_nil_value() : () -> i64
    %5970 = func.call @cc_errorp(%5476) : (i64) -> i64
    %5971 = arith.cmpi ne, %5970, %5969 : i64
    %5972 = scf.if %5971 -> (i64) {
      scf.yield %5476 : i64
    } else {
      %5973 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5974 = arith.constant 9 : i64
      %5975 = func.call @cc_make_string(%5973, %5974) : (!llvm.ptr, i64) -> i64
      %5976 = func.call @cc_nil_value() : () -> i64
      %5977 = func.call @cc_intern(%5975, %5976) : (i64, i64) -> i64
      %5978 = func.call @cc_nil_value() : () -> i64
      %5979 = func.call @cc_cons(%5977, %5978) : (i64, i64) -> i64
      %5980 = func.call @cc_values_pack(%5979) : (i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %5981 = arith.addi %5977, %__rlasp_stack_elide_zero_351 : i64
      %5982 = llvm.mlir.addressof @str478 : !llvm.ptr
      %5983 = arith.constant 3 : i64
      %5984 = func.call @cc_make_string(%5982, %5983) : (!llvm.ptr, i64) -> i64
      %5985 = func.call @cc_nil_value() : () -> i64
      %5986 = func.call @cc_intern(%5984, %5985) : (i64, i64) -> i64
      %5987 = func.call @cc_nil_value() : () -> i64
      %5988 = func.call @cc_cons(%5986, %5987) : (i64, i64) -> i64
      %5989 = func.call @cc_values_pack(%5988) : (i64) -> i64
      func.call @stack_push_pointer(%5986) : (i64) -> ()
      %5990 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5991 = arith.constant 1 : i64
      %5992 = func.call @cc_make_string(%5990, %5991) : (!llvm.ptr, i64) -> i64
      %5993 = func.call @cc_nil_value() : () -> i64
      %5994 = func.call @cc_intern(%5992, %5993) : (i64, i64) -> i64
      %5995 = func.call @cc_nil_value() : () -> i64
      %5996 = func.call @cc_cons(%5994, %5995) : (i64, i64) -> i64
      %5997 = func.call @cc_values_pack(%5996) : (i64) -> i64
      func.call @stack_push_pointer(%5994) : (i64) -> ()
      %5998 = llvm.mlir.addressof @str480 : !llvm.ptr
      %5999 = arith.constant 11 : i64
      %6000 = func.call @cc_make_string(%5998, %5999) : (!llvm.ptr, i64) -> i64
      %6001 = llvm.mlir.addressof @str481 : !llvm.ptr
      %6002 = arith.constant 3 : i64
      %6003 = func.call @cc_make_string(%6001, %6002) : (!llvm.ptr, i64) -> i64
      %6004 = func.call @cc_intern(%6000, %6003) : (i64, i64) -> i64
      %6005 = func.call @cc_nil_value() : () -> i64
      %6006 = func.call @cc_cons(%6004, %6005) : (i64, i64) -> i64
      %6007 = func.call @cc_values_pack(%6006) : (i64) -> i64
      func.call @stack_push_pointer(%6004) : (i64) -> ()
      %6008 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6008) : (i64) -> ()
      %6009 = llvm.mlir.addressof @str482 : !llvm.ptr
      %6010 = arith.constant 6 : i64
      %6011 = func.call @cc_make_string(%6009, %6010) : (!llvm.ptr, i64) -> i64
      %6012 = llvm.mlir.addressof @str483 : !llvm.ptr
      %6013 = arith.constant 11 : i64
      %6014 = func.call @cc_make_string(%6012, %6013) : (!llvm.ptr, i64) -> i64
      %6015 = func.call @cc_intern(%6011, %6014) : (i64, i64) -> i64
      %6016 = func.call @cc_nil_value() : () -> i64
      %6017 = func.call @cc_cons(%6015, %6016) : (i64, i64) -> i64
      %6018 = func.call @cc_values_pack(%6017) : (i64) -> i64
      func.call @stack_push_pointer(%6015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6019 = llvm.mlir.addressof @str484 : !llvm.ptr
      %6020 = arith.constant 4 : i64
      %6021 = func.call @cc_make_string(%6019, %6020) : (!llvm.ptr, i64) -> i64
      %6022 = llvm.mlir.addressof @str485 : !llvm.ptr
      %6023 = arith.constant 11 : i64
      %6024 = func.call @cc_make_string(%6022, %6023) : (!llvm.ptr, i64) -> i64
      %6025 = func.call @cc_intern(%6021, %6024) : (i64, i64) -> i64
      %6026 = func.call @cc_nil_value() : () -> i64
      %6027 = func.call @cc_cons(%6025, %6026) : (i64, i64) -> i64
      %6028 = func.call @cc_values_pack(%6027) : (i64) -> i64
      func.call @stack_push_pointer(%6025) : (i64) -> ()
      %6029 = llvm.mlir.addressof @str486 : !llvm.ptr
      %6030 = arith.constant 3 : i64
      %6031 = func.call @cc_make_string(%6029, %6030) : (!llvm.ptr, i64) -> i64
      %6032 = llvm.mlir.addressof @str487 : !llvm.ptr
      %6033 = arith.constant 11 : i64
      %6034 = func.call @cc_make_string(%6032, %6033) : (!llvm.ptr, i64) -> i64
      %6035 = func.call @cc_intern(%6031, %6034) : (i64, i64) -> i64
      %6036 = func.call @cc_nil_value() : () -> i64
      %6037 = func.call @cc_cons(%6035, %6036) : (i64, i64) -> i64
      %6038 = func.call @cc_values_pack(%6037) : (i64) -> i64
      func.call @stack_push_pointer(%6035) : (i64) -> ()
      %6039 = llvm.mlir.addressof @str488 : !llvm.ptr
      %6040 = arith.constant 15 : i64
      %6041 = func.call @cc_make_string(%6039, %6040) : (!llvm.ptr, i64) -> i64
      %6042 = llvm.mlir.addressof @str489 : !llvm.ptr
      %6043 = arith.constant 11 : i64
      %6044 = func.call @cc_make_string(%6042, %6043) : (!llvm.ptr, i64) -> i64
      %6045 = func.call @cc_intern(%6041, %6044) : (i64, i64) -> i64
      %6046 = func.call @cc_nil_value() : () -> i64
      %6047 = func.call @cc_cons(%6045, %6046) : (i64, i64) -> i64
      %6048 = func.call @cc_values_pack(%6047) : (i64) -> i64
      func.call @stack_push_pointer(%6045) : (i64) -> ()
      %6049 = llvm.mlir.addressof @str490 : !llvm.ptr
      %6050 = arith.constant 4 : i64
      %6051 = func.call @cc_make_string(%6049, %6050) : (!llvm.ptr, i64) -> i64
      %6052 = llvm.mlir.addressof @str491 : !llvm.ptr
      %6053 = arith.constant 11 : i64
      %6054 = func.call @cc_make_string(%6052, %6053) : (!llvm.ptr, i64) -> i64
      %6055 = func.call @cc_intern(%6051, %6054) : (i64, i64) -> i64
      %6056 = func.call @cc_nil_value() : () -> i64
      %6057 = func.call @cc_cons(%6055, %6056) : (i64, i64) -> i64
      %6058 = func.call @cc_values_pack(%6057) : (i64) -> i64
      func.call @stack_push_pointer(%6055) : (i64) -> ()
      %6059 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6059) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6060 = func.call @stack_pop_pointer() : () -> i64
      %6061 = func.call @stack_pop_pointer() : () -> i64
      %6062 = func.call @cc_cons(%6061, %6060) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %6063 = arith.addi %6062, %__rlasp_stack_elide_zero_352 : i64
      %6064 = func.call @stack_pop_pointer() : () -> i64
      %6065 = func.call @cc_cons(%6064, %6063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6065) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6066 = func.call @stack_pop_pointer() : () -> i64
      %6067 = func.call @stack_pop_pointer() : () -> i64
      %6068 = func.call @cc_cons(%6067, %6066) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %6069 = arith.addi %6068, %__rlasp_stack_elide_zero_353 : i64
      %6070 = func.call @stack_pop_pointer() : () -> i64
      %6071 = func.call @cc_cons(%6070, %6069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6071) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6072 = func.call @stack_pop_pointer() : () -> i64
      %6073 = func.call @stack_pop_pointer() : () -> i64
      %6074 = func.call @cc_cons(%6073, %6072) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %6075 = arith.addi %6074, %__rlasp_stack_elide_zero_354 : i64
      %6076 = func.call @stack_pop_pointer() : () -> i64
      %6077 = func.call @cc_cons(%6076, %6075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6077) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6078 = func.call @stack_pop_pointer() : () -> i64
      %6079 = func.call @stack_pop_pointer() : () -> i64
      %6080 = func.call @cc_cons(%6079, %6078) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %6081 = arith.addi %6080, %__rlasp_stack_elide_zero_355 : i64
      %6082 = func.call @stack_pop_pointer() : () -> i64
      %6083 = func.call @cc_cons(%6082, %6081) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6084 = func.call @stack_pop_pointer() : () -> i64
      %6085 = func.call @stack_pop_pointer() : () -> i64
      %6086 = func.call @cc_cons(%6085, %6084) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %6087 = arith.addi %6086, %__rlasp_stack_elide_zero_356 : i64
      %6088 = func.call @stack_pop_pointer() : () -> i64
      %6089 = func.call @cc_cons(%6088, %6087) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %6090 = arith.addi %6089, %__rlasp_stack_elide_zero_357 : i64
      %6091 = func.call @stack_pop_pointer() : () -> i64
      %6092 = func.call @cc_cons(%6091, %6090) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %6093 = arith.addi %6092, %__rlasp_stack_elide_zero_358 : i64
      %6094 = func.call @stack_pop_pointer() : () -> i64
      %6095 = func.call @cc_cons(%6093, %6094) : (i64, i64) -> i64
      %6096 = llvm.mlir.addressof @str492 : !llvm.ptr
      %6097 = arith.constant 5 : i64
      %6098 = func.call @cc_make_string(%6096, %6097) : (!llvm.ptr, i64) -> i64
      %6099 = func.call @cc_nil_value() : () -> i64
      %6100 = func.call @cc_intern(%6098, %6099) : (i64, i64) -> i64
      %6101 = func.call @cc_nil_value() : () -> i64
      %6102 = func.call @cc_cons(%6100, %6101) : (i64, i64) -> i64
      %6103 = func.call @cc_values_pack(%6102) : (i64) -> i64
      %6104 = func.call @cc_cons(%6100, %6095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6105 = func.call @stack_pop_pointer() : () -> i64
      %6106 = func.call @stack_pop_pointer() : () -> i64
      %6107 = func.call @cc_cons(%6106, %6105) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %6108 = arith.addi %6107, %__rlasp_stack_elide_zero_359 : i64
      %6109 = func.call @stack_pop_pointer() : () -> i64
      %6110 = func.call @cc_cons(%6109, %6108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6111 = func.call @stack_pop_pointer() : () -> i64
      %6112 = func.call @stack_pop_pointer() : () -> i64
      %6113 = func.call @cc_cons(%6112, %6111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %6114 = arith.addi %6113, %__rlasp_stack_elide_zero_360 : i64
      %6115 = func.call @stack_pop_pointer() : () -> i64
      %6116 = func.call @cc_cons(%6115, %6114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6117 = func.call @stack_pop_pointer() : () -> i64
      %6118 = func.call @stack_pop_pointer() : () -> i64
      %6119 = func.call @cc_cons(%6118, %6117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6119) : (i64) -> ()
      %6120 = llvm.mlir.addressof @str493 : !llvm.ptr
      %6121 = arith.constant 19 : i64
      %6122 = func.call @cc_make_string(%6120, %6121) : (!llvm.ptr, i64) -> i64
      %6123 = llvm.mlir.addressof @str494 : !llvm.ptr
      %6124 = arith.constant 11 : i64
      %6125 = func.call @cc_make_string(%6123, %6124) : (!llvm.ptr, i64) -> i64
      %6126 = func.call @cc_intern(%6122, %6125) : (i64, i64) -> i64
      %6127 = func.call @cc_nil_value() : () -> i64
      %6128 = func.call @cc_cons(%6126, %6127) : (i64, i64) -> i64
      %6129 = func.call @cc_values_pack(%6128) : (i64) -> i64
      func.call @stack_push_pointer(%6126) : (i64) -> ()
      %6130 = llvm.mlir.addressof @str495 : !llvm.ptr
      %6131 = arith.constant 2 : i64
      %6132 = func.call @cc_make_string(%6130, %6131) : (!llvm.ptr, i64) -> i64
      %6133 = func.call @cc_nil_value() : () -> i64
      %6134 = func.call @cc_intern(%6132, %6133) : (i64, i64) -> i64
      %6135 = func.call @cc_nil_value() : () -> i64
      %6136 = func.call @cc_cons(%6134, %6135) : (i64, i64) -> i64
      %6137 = func.call @cc_values_pack(%6136) : (i64) -> i64
      func.call @stack_push_pointer(%6134) : (i64) -> ()
      %6138 = llvm.mlir.addressof @str496 : !llvm.ptr
      %6139 = arith.constant 9 : i64
      %6140 = func.call @cc_make_string(%6138, %6139) : (!llvm.ptr, i64) -> i64
      %6141 = func.call @cc_nil_value() : () -> i64
      %6142 = func.call @cc_intern(%6140, %6141) : (i64, i64) -> i64
      %6143 = func.call @cc_nil_value() : () -> i64
      %6144 = func.call @cc_cons(%6142, %6143) : (i64, i64) -> i64
      %6145 = func.call @cc_values_pack(%6144) : (i64) -> i64
      func.call @stack_push_pointer(%6142) : (i64) -> ()
      %6146 = llvm.mlir.addressof @str497 : !llvm.ptr
      %6147 = arith.constant 8 : i64
      %6148 = func.call @cc_make_string(%6146, %6147) : (!llvm.ptr, i64) -> i64
      %6149 = func.call @cc_nil_value() : () -> i64
      %6150 = func.call @cc_intern(%6148, %6149) : (i64, i64) -> i64
      %6151 = func.call @cc_nil_value() : () -> i64
      %6152 = func.call @cc_cons(%6150, %6151) : (i64, i64) -> i64
      %6153 = func.call @cc_values_pack(%6152) : (i64) -> i64
      func.call @stack_push_pointer(%6150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6154 = func.call @stack_pop_pointer() : () -> i64
      %6155 = func.call @stack_pop_pointer() : () -> i64
      %6156 = func.call @cc_cons(%6155, %6154) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %6157 = arith.addi %6156, %__rlasp_stack_elide_zero_361 : i64
      %6158 = func.call @stack_pop_pointer() : () -> i64
      %6159 = func.call @cc_cons(%6158, %6157) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %6160 = arith.addi %6159, %__rlasp_stack_elide_zero_362 : i64
      %6161 = func.call @stack_pop_pointer() : () -> i64
      %6162 = func.call @cc_cons(%6161, %6160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6162) : (i64) -> ()
      %6163 = llvm.mlir.addressof @str498 : !llvm.ptr
      %6164 = arith.constant 7 : i64
      %6165 = func.call @cc_make_string(%6163, %6164) : (!llvm.ptr, i64) -> i64
      %6166 = llvm.mlir.addressof @str499 : !llvm.ptr
      %6167 = arith.constant 11 : i64
      %6168 = func.call @cc_make_string(%6166, %6167) : (!llvm.ptr, i64) -> i64
      %6169 = func.call @cc_intern(%6165, %6168) : (i64, i64) -> i64
      %6170 = func.call @cc_nil_value() : () -> i64
      %6171 = func.call @cc_cons(%6169, %6170) : (i64, i64) -> i64
      %6172 = func.call @cc_values_pack(%6171) : (i64) -> i64
      func.call @stack_push_pointer(%6169) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6173 = llvm.mlir.addressof @str500 : !llvm.ptr
      %6174 = arith.constant 1 : i64
      %6175 = func.call @cc_make_string(%6173, %6174) : (!llvm.ptr, i64) -> i64
      %6176 = func.call @cc_nil_value() : () -> i64
      %6177 = func.call @cc_intern(%6175, %6176) : (i64, i64) -> i64
      %6178 = func.call @cc_nil_value() : () -> i64
      %6179 = func.call @cc_cons(%6177, %6178) : (i64, i64) -> i64
      %6180 = func.call @cc_values_pack(%6179) : (i64) -> i64
      func.call @stack_push_pointer(%6177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6181 = func.call @stack_pop_pointer() : () -> i64
      %6182 = func.call @stack_pop_pointer() : () -> i64
      %6183 = func.call @cc_cons(%6182, %6181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %6184 = arith.addi %6183, %__rlasp_stack_elide_zero_363 : i64
      %6185 = func.call @stack_pop_pointer() : () -> i64
      %6186 = func.call @cc_cons(%6185, %6184) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %6187 = arith.addi %6186, %__rlasp_stack_elide_zero_364 : i64
      %6188 = func.call @stack_pop_pointer() : () -> i64
      %6189 = func.call @cc_cons(%6188, %6187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6189) : (i64) -> ()
      %6190 = llvm.mlir.addressof @str501 : !llvm.ptr
      %6191 = arith.constant 7 : i64
      %6192 = func.call @cc_make_string(%6190, %6191) : (!llvm.ptr, i64) -> i64
      %6193 = llvm.mlir.addressof @str502 : !llvm.ptr
      %6194 = arith.constant 11 : i64
      %6195 = func.call @cc_make_string(%6193, %6194) : (!llvm.ptr, i64) -> i64
      %6196 = func.call @cc_intern(%6192, %6195) : (i64, i64) -> i64
      %6197 = func.call @cc_nil_value() : () -> i64
      %6198 = func.call @cc_cons(%6196, %6197) : (i64, i64) -> i64
      %6199 = func.call @cc_values_pack(%6198) : (i64) -> i64
      func.call @stack_push_pointer(%6196) : (i64) -> ()
      %6200 = llvm.mlir.addressof @str503 : !llvm.ptr
      %6201 = arith.constant 2 : i64
      %6202 = func.call @cc_make_string(%6200, %6201) : (!llvm.ptr, i64) -> i64
      %6203 = func.call @cc_nil_value() : () -> i64
      %6204 = func.call @cc_intern(%6202, %6203) : (i64, i64) -> i64
      %6205 = func.call @cc_nil_value() : () -> i64
      %6206 = func.call @cc_cons(%6204, %6205) : (i64, i64) -> i64
      %6207 = func.call @cc_values_pack(%6206) : (i64) -> i64
      func.call @stack_push_pointer(%6204) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6208 = func.call @stack_pop_pointer() : () -> i64
      %6209 = func.call @stack_pop_pointer() : () -> i64
      %6210 = func.call @cc_cons(%6209, %6208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %6211 = arith.addi %6210, %__rlasp_stack_elide_zero_365 : i64
      %6212 = func.call @stack_pop_pointer() : () -> i64
      %6213 = func.call @cc_cons(%6212, %6211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6213) : (i64) -> ()
      %6214 = llvm.mlir.addressof @str504 : !llvm.ptr
      %6215 = arith.constant 7 : i64
      %6216 = func.call @cc_make_string(%6214, %6215) : (!llvm.ptr, i64) -> i64
      %6217 = llvm.mlir.addressof @str505 : !llvm.ptr
      %6218 = arith.constant 11 : i64
      %6219 = func.call @cc_make_string(%6217, %6218) : (!llvm.ptr, i64) -> i64
      %6220 = func.call @cc_intern(%6216, %6219) : (i64, i64) -> i64
      %6221 = func.call @cc_nil_value() : () -> i64
      %6222 = func.call @cc_cons(%6220, %6221) : (i64, i64) -> i64
      %6223 = func.call @cc_values_pack(%6222) : (i64) -> i64
      func.call @stack_push_pointer(%6220) : (i64) -> ()
      %6224 = llvm.mlir.addressof @str506 : !llvm.ptr
      %6225 = arith.constant 2 : i64
      %6226 = func.call @cc_make_string(%6224, %6225) : (!llvm.ptr, i64) -> i64
      %6227 = func.call @cc_nil_value() : () -> i64
      %6228 = func.call @cc_intern(%6226, %6227) : (i64, i64) -> i64
      %6229 = func.call @cc_nil_value() : () -> i64
      %6230 = func.call @cc_cons(%6228, %6229) : (i64, i64) -> i64
      %6231 = func.call @cc_values_pack(%6230) : (i64) -> i64
      func.call @stack_push_pointer(%6228) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6232 = func.call @stack_pop_pointer() : () -> i64
      %6233 = func.call @stack_pop_pointer() : () -> i64
      %6234 = func.call @cc_cons(%6233, %6232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %6235 = arith.addi %6234, %__rlasp_stack_elide_zero_366 : i64
      %6236 = func.call @stack_pop_pointer() : () -> i64
      %6237 = func.call @cc_cons(%6236, %6235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6237) : (i64) -> ()
      %6238 = llvm.mlir.addressof @str507 : !llvm.ptr
      %6239 = arith.constant 6 : i64
      %6240 = func.call @cc_make_string(%6238, %6239) : (!llvm.ptr, i64) -> i64
      %6241 = llvm.mlir.addressof @str508 : !llvm.ptr
      %6242 = arith.constant 11 : i64
      %6243 = func.call @cc_make_string(%6241, %6242) : (!llvm.ptr, i64) -> i64
      %6244 = func.call @cc_intern(%6240, %6243) : (i64, i64) -> i64
      %6245 = func.call @cc_nil_value() : () -> i64
      %6246 = func.call @cc_cons(%6244, %6245) : (i64, i64) -> i64
      %6247 = func.call @cc_values_pack(%6246) : (i64) -> i64
      func.call @stack_push_pointer(%6244) : (i64) -> ()
      %6248 = llvm.mlir.addressof @str509 : !llvm.ptr
      %6249 = arith.constant 7 : i64
      %6250 = func.call @cc_make_string(%6248, %6249) : (!llvm.ptr, i64) -> i64
      %6251 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6252 = arith.constant 11 : i64
      %6253 = func.call @cc_make_string(%6251, %6252) : (!llvm.ptr, i64) -> i64
      %6254 = func.call @cc_intern(%6250, %6253) : (i64, i64) -> i64
      %6255 = func.call @cc_nil_value() : () -> i64
      %6256 = func.call @cc_cons(%6254, %6255) : (i64, i64) -> i64
      %6257 = func.call @cc_values_pack(%6256) : (i64) -> i64
      func.call @stack_push_pointer(%6254) : (i64) -> ()
      %6258 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6259 = arith.constant 1 : i64
      %6260 = func.call @cc_make_string(%6258, %6259) : (!llvm.ptr, i64) -> i64
      %6261 = func.call @cc_nil_value() : () -> i64
      %6262 = func.call @cc_intern(%6260, %6261) : (i64, i64) -> i64
      %6263 = func.call @cc_nil_value() : () -> i64
      %6264 = func.call @cc_cons(%6262, %6263) : (i64, i64) -> i64
      %6265 = func.call @cc_values_pack(%6264) : (i64) -> i64
      func.call @stack_push_pointer(%6262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6266 = func.call @stack_pop_pointer() : () -> i64
      %6267 = func.call @stack_pop_pointer() : () -> i64
      %6268 = func.call @cc_cons(%6267, %6266) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %6269 = arith.addi %6268, %__rlasp_stack_elide_zero_367 : i64
      %6270 = func.call @stack_pop_pointer() : () -> i64
      %6271 = func.call @cc_cons(%6270, %6269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6271) : (i64) -> ()
      %6272 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6273 = arith.constant 9 : i64
      %6274 = func.call @cc_make_string(%6272, %6273) : (!llvm.ptr, i64) -> i64
      %6275 = func.call @cc_nil_value() : () -> i64
      %6276 = func.call @cc_intern(%6274, %6275) : (i64, i64) -> i64
      %6277 = func.call @cc_nil_value() : () -> i64
      %6278 = func.call @cc_cons(%6276, %6277) : (i64, i64) -> i64
      %6279 = func.call @cc_values_pack(%6278) : (i64) -> i64
      func.call @stack_push_pointer(%6276) : (i64) -> ()
      %6280 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6281 = arith.constant 8 : i64
      %6282 = func.call @cc_make_string(%6280, %6281) : (!llvm.ptr, i64) -> i64
      %6283 = func.call @cc_nil_value() : () -> i64
      %6284 = func.call @cc_intern(%6282, %6283) : (i64, i64) -> i64
      %6285 = func.call @cc_nil_value() : () -> i64
      %6286 = func.call @cc_cons(%6284, %6285) : (i64, i64) -> i64
      %6287 = func.call @cc_values_pack(%6286) : (i64) -> i64
      func.call @stack_push_pointer(%6284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6288 = func.call @stack_pop_pointer() : () -> i64
      %6289 = func.call @stack_pop_pointer() : () -> i64
      %6290 = func.call @cc_cons(%6289, %6288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %6291 = arith.addi %6290, %__rlasp_stack_elide_zero_368 : i64
      %6292 = func.call @stack_pop_pointer() : () -> i64
      %6293 = func.call @cc_cons(%6292, %6291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %6294 = arith.addi %6293, %__rlasp_stack_elide_zero_369 : i64
      %6295 = func.call @stack_pop_pointer() : () -> i64
      %6296 = func.call @cc_cons(%6295, %6294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %6297 = arith.addi %6296, %__rlasp_stack_elide_zero_370 : i64
      %6298 = func.call @stack_pop_pointer() : () -> i64
      %6299 = func.call @cc_cons(%6298, %6297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6300 = func.call @stack_pop_pointer() : () -> i64
      %6301 = func.call @stack_pop_pointer() : () -> i64
      %6302 = func.call @cc_cons(%6301, %6300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %6303 = arith.addi %6302, %__rlasp_stack_elide_zero_371 : i64
      %6304 = func.call @stack_pop_pointer() : () -> i64
      %6305 = func.call @cc_cons(%6304, %6303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %6306 = arith.addi %6305, %__rlasp_stack_elide_zero_372 : i64
      %6307 = func.call @stack_pop_pointer() : () -> i64
      %6308 = func.call @cc_cons(%6307, %6306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %6309 = arith.addi %6308, %__rlasp_stack_elide_zero_373 : i64
      %6310 = func.call @stack_pop_pointer() : () -> i64
      %6311 = func.call @cc_cons(%6310, %6309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %6312 = arith.addi %6311, %__rlasp_stack_elide_zero_374 : i64
      %6313 = func.call @stack_pop_pointer() : () -> i64
      %6314 = func.call @cc_cons(%6313, %6312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %6315 = arith.addi %6314, %__rlasp_stack_elide_zero_375 : i64
      %6316 = func.call @stack_pop_pointer() : () -> i64
      %6317 = func.call @cc_cons(%6316, %6315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6318 = func.call @stack_pop_pointer() : () -> i64
      %6319 = func.call @stack_pop_pointer() : () -> i64
      %6320 = func.call @cc_cons(%6319, %6318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %6321 = arith.addi %6320, %__rlasp_stack_elide_zero_376 : i64
      %6322 = func.call @stack_pop_pointer() : () -> i64
      %6323 = func.call @cc_cons(%6322, %6321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %6324 = arith.addi %6323, %__rlasp_stack_elide_zero_377 : i64
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @cc_cons(%6325, %6324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %6327 = arith.addi %6326, %__rlasp_stack_elide_zero_378 : i64
      %6478 = llvm.mlir.addressof @str516 : !llvm.ptr
      %6479 = arith.constant 31 : i64
      %6480 = func.call @cc_make_symbol(%6478, %6479) : (!llvm.ptr, i64) -> i64
      %6481 = func.call @cc_persistent_root_value(%6480) : (i64) -> i64
      func.call @stack_push_pointer(%6481) : (i64) -> ()
      %6482 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6483 = arith.constant 37 : i64
      %6484 = func.call @cc_make_symbol(%6482, %6483) : (!llvm.ptr, i64) -> i64
      %6485 = func.call @cc_persistent_root_value(%6484) : (i64) -> i64
      func.call @stack_push_pointer(%6485) : (i64) -> ()
      %6486 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6487 = arith.constant 38 : i64
      %6488 = func.call @cc_make_symbol(%6486, %6487) : (!llvm.ptr, i64) -> i64
      %6489 = func.call @cc_persistent_root_value(%6488) : (i64) -> i64
      func.call @stack_push_pointer(%6489) : (i64) -> ()
      %6490 = arith.constant 275462358040639 : i64
      %6491 = arith.constant 3 : i64
      %6492 = func.call @cc_make_closure(%6490, %6491) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %6493 = arith.addi %6492, %__rlasp_stack_elide_zero_379 : i64
      %6494 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6494) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6495 = func.call @stack_pop_pointer() : () -> i64
      %6496 = func.call @stack_pop_pointer() : () -> i64
      %6497 = func.call @cc_cons(%6496, %6495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %6498 = arith.addi %6497, %__rlasp_stack_elide_zero_380 : i64
      %6499 = func.call @stack_pop_pointer() : () -> i64
      %6500 = func.call @cc_cons(%6499, %6498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
      %6501 = arith.addi %6500, %__rlasp_stack_elide_zero_381 : i64
      %6502 = func.call @stack_pop_pointer() : () -> i64
      %6503 = func.call @cc_cons(%6502, %6501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
      %6504 = arith.addi %6503, %__rlasp_stack_elide_zero_382 : i64
      %6505 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6506 = arith.constant 11 : i64
      %6507 = func.call @cc_make_string(%6505, %6506) : (!llvm.ptr, i64) -> i64
      %6508 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6509 = arith.constant 7 : i64
      %6510 = func.call @cc_make_string(%6508, %6509) : (!llvm.ptr, i64) -> i64
      %6511 = func.call @cc_intern(%6507, %6510) : (i64, i64) -> i64
      %6512 = func.call @cc_nil_value() : () -> i64
      %6513 = func.call @cc_cons(%6511, %6512) : (i64, i64) -> i64
      %6514 = func.call @cc_values_pack(%6513) : (i64) -> i64
      %6515 = func.call @cc_nil_value() : () -> i64
      %6516 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6517 = arith.constant 4 : i64
      %6518 = func.call @cc_make_string(%6516, %6517) : (!llvm.ptr, i64) -> i64
      %6519 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6520 = arith.constant 7 : i64
      %6521 = func.call @cc_make_string(%6519, %6520) : (!llvm.ptr, i64) -> i64
      %6522 = func.call @cc_intern(%6518, %6521) : (i64, i64) -> i64
      %6523 = func.call @cc_nil_value() : () -> i64
      %6524 = func.call @cc_cons(%6522, %6523) : (i64, i64) -> i64
      %6525 = func.call @cc_values_pack(%6524) : (i64) -> i64
      %6526 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6527 = arith.constant 6 : i64
      %6528 = func.call @cc_make_string(%6526, %6527) : (!llvm.ptr, i64) -> i64
      %6529 = func.call @cc_nil_value() : () -> i64
      %6530 = func.call @cc_intern(%6528, %6529) : (i64, i64) -> i64
      %6531 = func.call @cc_nil_value() : () -> i64
      %6532 = func.call @cc_cons(%6530, %6531) : (i64, i64) -> i64
      %6533 = func.call @cc_values_pack(%6532) : (i64) -> i64
      %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
      %6534 = arith.addi %6530, %__rlasp_stack_elide_zero_383 : i64
      %6535 = func.call @cc_nil_value() : () -> i64
      %6536 = func.call @cc_errorp(%5981) : (i64) -> i64
      %6537 = arith.cmpi ne, %6536, %6535 : i64
      %6538 = arith.cmpi eq, %6535, %6535 : i64
      %6539 = arith.andi %6537, %6538 : i1
      %6540 = scf.if %6539 -> (i64) {
        scf.yield %5981 : i64
      } else {
        scf.yield %6535 : i64
      }
      %6541 = func.call @cc_errorp(%6327) : (i64) -> i64
      %6542 = arith.cmpi ne, %6541, %6535 : i64
      %6543 = arith.cmpi eq, %6540, %6535 : i64
      %6544 = arith.andi %6542, %6543 : i1
      %6545 = scf.if %6544 -> (i64) {
        scf.yield %6327 : i64
      } else {
        scf.yield %6540 : i64
      }
      %6546 = func.call @cc_errorp(%6493) : (i64) -> i64
      %6547 = arith.cmpi ne, %6546, %6535 : i64
      %6548 = arith.cmpi eq, %6545, %6535 : i64
      %6549 = arith.andi %6547, %6548 : i1
      %6550 = scf.if %6549 -> (i64) {
        scf.yield %6493 : i64
      } else {
        scf.yield %6545 : i64
      }
      %6551 = func.call @cc_errorp(%6504) : (i64) -> i64
      %6552 = arith.cmpi ne, %6551, %6535 : i64
      %6553 = arith.cmpi eq, %6550, %6535 : i64
      %6554 = arith.andi %6552, %6553 : i1
      %6555 = scf.if %6554 -> (i64) {
        scf.yield %6504 : i64
      } else {
        scf.yield %6550 : i64
      }
      %6556 = func.call @cc_errorp(%6511) : (i64) -> i64
      %6557 = arith.cmpi ne, %6556, %6535 : i64
      %6558 = arith.cmpi eq, %6555, %6535 : i64
      %6559 = arith.andi %6557, %6558 : i1
      %6560 = scf.if %6559 -> (i64) {
        scf.yield %6511 : i64
      } else {
        scf.yield %6555 : i64
      }
      %6561 = func.call @cc_errorp(%6515) : (i64) -> i64
      %6562 = arith.cmpi ne, %6561, %6535 : i64
      %6563 = arith.cmpi eq, %6560, %6535 : i64
      %6564 = arith.andi %6562, %6563 : i1
      %6565 = scf.if %6564 -> (i64) {
        scf.yield %6515 : i64
      } else {
        scf.yield %6560 : i64
      }
      %6566 = func.call @cc_errorp(%6522) : (i64) -> i64
      %6567 = arith.cmpi ne, %6566, %6535 : i64
      %6568 = arith.cmpi eq, %6565, %6535 : i64
      %6569 = arith.andi %6567, %6568 : i1
      %6570 = scf.if %6569 -> (i64) {
        scf.yield %6522 : i64
      } else {
        scf.yield %6565 : i64
      }
      %6571 = func.call @cc_errorp(%6534) : (i64) -> i64
      %6572 = arith.cmpi ne, %6571, %6535 : i64
      %6573 = arith.cmpi eq, %6570, %6535 : i64
      %6574 = arith.andi %6572, %6573 : i1
      %6575 = scf.if %6574 -> (i64) {
        scf.yield %6534 : i64
      } else {
        scf.yield %6570 : i64
      }
      %6576 = arith.cmpi ne, %6575, %6535 : i64
      scf.if %6576 {
        func.call @stack_push_pointer(%6575) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5981) : (i64) -> ()
        func.call @stack_push_pointer(%6327) : (i64) -> ()
        func.call @stack_push_pointer(%6493) : (i64) -> ()
        func.call @stack_push_pointer(%6504) : (i64) -> ()
        func.call @stack_push_pointer(%6511) : (i64) -> ()
        func.call @stack_push_pointer(%6515) : (i64) -> ()
        func.call @stack_push_pointer(%6522) : (i64) -> ()
        func.call @stack_push_pointer(%6534) : (i64) -> ()
        %6577 = llvm.mlir.addressof @str524 : !llvm.ptr
        %6578 = func.call @cc_make_function_ref_const(%6577) : (!llvm.ptr) -> i64
        %6579 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6578, %6579) : (i64, i64) -> ()
      }
      %6580 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6580 : i64
    }
    %6581 = func.call @cc_nil_value() : () -> i64
    %6582 = func.call @cc_errorp(%5972) : (i64) -> i64
    %6583 = arith.cmpi ne, %6582, %6581 : i64
    %6584 = scf.if %6583 -> (i64) {
      scf.yield %5972 : i64
    } else {
      %6585 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6586 = arith.constant 10 : i64
      %6587 = func.call @cc_make_string(%6585, %6586) : (!llvm.ptr, i64) -> i64
      %6588 = func.call @cc_nil_value() : () -> i64
      %6589 = func.call @cc_intern(%6587, %6588) : (i64, i64) -> i64
      %6590 = func.call @cc_nil_value() : () -> i64
      %6591 = func.call @cc_cons(%6589, %6590) : (i64, i64) -> i64
      %6592 = func.call @cc_values_pack(%6591) : (i64) -> i64
      %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
      %6593 = arith.addi %6589, %__rlasp_stack_elide_zero_384 : i64
      %6594 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6595 = arith.constant 3 : i64
      %6596 = func.call @cc_make_string(%6594, %6595) : (!llvm.ptr, i64) -> i64
      %6597 = func.call @cc_nil_value() : () -> i64
      %6598 = func.call @cc_intern(%6596, %6597) : (i64, i64) -> i64
      %6599 = func.call @cc_nil_value() : () -> i64
      %6600 = func.call @cc_cons(%6598, %6599) : (i64, i64) -> i64
      %6601 = func.call @cc_values_pack(%6600) : (i64) -> i64
      func.call @stack_push_pointer(%6598) : (i64) -> ()
      %6602 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6603 = arith.constant 1 : i64
      %6604 = func.call @cc_make_string(%6602, %6603) : (!llvm.ptr, i64) -> i64
      %6605 = func.call @cc_nil_value() : () -> i64
      %6606 = func.call @cc_intern(%6604, %6605) : (i64, i64) -> i64
      %6607 = func.call @cc_nil_value() : () -> i64
      %6608 = func.call @cc_cons(%6606, %6607) : (i64, i64) -> i64
      %6609 = func.call @cc_values_pack(%6608) : (i64) -> i64
      func.call @stack_push_pointer(%6606) : (i64) -> ()
      %6610 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6611 = arith.constant 11 : i64
      %6612 = func.call @cc_make_string(%6610, %6611) : (!llvm.ptr, i64) -> i64
      %6613 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6614 = arith.constant 3 : i64
      %6615 = func.call @cc_make_string(%6613, %6614) : (!llvm.ptr, i64) -> i64
      %6616 = func.call @cc_intern(%6612, %6615) : (i64, i64) -> i64
      %6617 = func.call @cc_nil_value() : () -> i64
      %6618 = func.call @cc_cons(%6616, %6617) : (i64, i64) -> i64
      %6619 = func.call @cc_values_pack(%6618) : (i64) -> i64
      func.call @stack_push_pointer(%6616) : (i64) -> ()
      %6620 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6620) : (i64) -> ()
      %6621 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6622 = arith.constant 6 : i64
      %6623 = func.call @cc_make_string(%6621, %6622) : (!llvm.ptr, i64) -> i64
      %6624 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6625 = arith.constant 11 : i64
      %6626 = func.call @cc_make_string(%6624, %6625) : (!llvm.ptr, i64) -> i64
      %6627 = func.call @cc_intern(%6623, %6626) : (i64, i64) -> i64
      %6628 = func.call @cc_nil_value() : () -> i64
      %6629 = func.call @cc_cons(%6627, %6628) : (i64, i64) -> i64
      %6630 = func.call @cc_values_pack(%6629) : (i64) -> i64
      func.call @stack_push_pointer(%6627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6631 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6632 = arith.constant 3 : i64
      %6633 = func.call @cc_make_string(%6631, %6632) : (!llvm.ptr, i64) -> i64
      %6634 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6635 = arith.constant 11 : i64
      %6636 = func.call @cc_make_string(%6634, %6635) : (!llvm.ptr, i64) -> i64
      %6637 = func.call @cc_intern(%6633, %6636) : (i64, i64) -> i64
      %6638 = func.call @cc_nil_value() : () -> i64
      %6639 = func.call @cc_cons(%6637, %6638) : (i64, i64) -> i64
      %6640 = func.call @cc_values_pack(%6639) : (i64) -> i64
      func.call @stack_push_pointer(%6637) : (i64) -> ()
      %6641 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6642 = arith.constant 2 : i64
      %6643 = func.call @cc_make_string(%6641, %6642) : (!llvm.ptr, i64) -> i64
      %6644 = func.call @cc_nil_value() : () -> i64
      %6645 = func.call @cc_intern(%6643, %6644) : (i64, i64) -> i64
      %6646 = func.call @cc_nil_value() : () -> i64
      %6647 = func.call @cc_cons(%6645, %6646) : (i64, i64) -> i64
      %6648 = func.call @cc_values_pack(%6647) : (i64) -> i64
      func.call @stack_push_pointer(%6645) : (i64) -> ()
      %6649 = llvm.mlir.addressof @str535 : !llvm.ptr
      %6650 = arith.constant 3 : i64
      %6651 = func.call @cc_make_string(%6649, %6650) : (!llvm.ptr, i64) -> i64
      %6652 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6653 = arith.constant 11 : i64
      %6654 = func.call @cc_make_string(%6652, %6653) : (!llvm.ptr, i64) -> i64
      %6655 = func.call @cc_intern(%6651, %6654) : (i64, i64) -> i64
      %6656 = func.call @cc_nil_value() : () -> i64
      %6657 = func.call @cc_cons(%6655, %6656) : (i64, i64) -> i64
      %6658 = func.call @cc_values_pack(%6657) : (i64) -> i64
      func.call @stack_push_pointer(%6655) : (i64) -> ()
      %6659 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6660 = arith.constant 1 : i64
      %6661 = func.call @cc_make_string(%6659, %6660) : (!llvm.ptr, i64) -> i64
      %6662 = func.call @cc_nil_value() : () -> i64
      %6663 = func.call @cc_intern(%6661, %6662) : (i64, i64) -> i64
      %6664 = func.call @cc_nil_value() : () -> i64
      %6665 = func.call @cc_cons(%6663, %6664) : (i64, i64) -> i64
      %6666 = func.call @cc_values_pack(%6665) : (i64) -> i64
      func.call @stack_push_pointer(%6663) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6667 = func.call @stack_pop_pointer() : () -> i64
      %6668 = func.call @stack_pop_pointer() : () -> i64
      %6669 = func.call @cc_cons(%6668, %6667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6669) : (i64) -> ()
      %6670 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6671 = arith.constant 4 : i64
      %6672 = func.call @cc_make_string(%6670, %6671) : (!llvm.ptr, i64) -> i64
      %6673 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6674 = arith.constant 11 : i64
      %6675 = func.call @cc_make_string(%6673, %6674) : (!llvm.ptr, i64) -> i64
      %6676 = func.call @cc_intern(%6672, %6675) : (i64, i64) -> i64
      %6677 = func.call @cc_nil_value() : () -> i64
      %6678 = func.call @cc_cons(%6676, %6677) : (i64, i64) -> i64
      %6679 = func.call @cc_values_pack(%6678) : (i64) -> i64
      func.call @stack_push_pointer(%6676) : (i64) -> ()
      %6680 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6681 = arith.constant 1 : i64
      %6682 = func.call @cc_make_string(%6680, %6681) : (!llvm.ptr, i64) -> i64
      %6683 = func.call @cc_nil_value() : () -> i64
      %6684 = func.call @cc_intern(%6682, %6683) : (i64, i64) -> i64
      %6685 = func.call @cc_nil_value() : () -> i64
      %6686 = func.call @cc_cons(%6684, %6685) : (i64, i64) -> i64
      %6687 = func.call @cc_values_pack(%6686) : (i64) -> i64
      func.call @stack_push_pointer(%6684) : (i64) -> ()
      %6688 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6689 = arith.constant 1 : i64
      %6690 = func.call @cc_make_string(%6688, %6689) : (!llvm.ptr, i64) -> i64
      %6691 = func.call @cc_nil_value() : () -> i64
      %6692 = func.call @cc_intern(%6690, %6691) : (i64, i64) -> i64
      %6693 = func.call @cc_nil_value() : () -> i64
      %6694 = func.call @cc_cons(%6692, %6693) : (i64, i64) -> i64
      %6695 = func.call @cc_values_pack(%6694) : (i64) -> i64
      func.call @stack_push_pointer(%6692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6696 = func.call @stack_pop_pointer() : () -> i64
      %6697 = func.call @stack_pop_pointer() : () -> i64
      %6698 = func.call @cc_cons(%6697, %6696) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6698) : (i64) -> ()
      %6699 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6700 = arith.constant 3 : i64
      %6701 = func.call @cc_make_string(%6699, %6700) : (!llvm.ptr, i64) -> i64
      %6702 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6703 = arith.constant 11 : i64
      %6704 = func.call @cc_make_string(%6702, %6703) : (!llvm.ptr, i64) -> i64
      %6705 = func.call @cc_intern(%6701, %6704) : (i64, i64) -> i64
      %6706 = func.call @cc_nil_value() : () -> i64
      %6707 = func.call @cc_cons(%6705, %6706) : (i64, i64) -> i64
      %6708 = func.call @cc_values_pack(%6707) : (i64) -> i64
      func.call @stack_push_pointer(%6705) : (i64) -> ()
      %6709 = llvm.mlir.addressof @str544 : !llvm.ptr
      %6710 = arith.constant 1 : i64
      %6711 = func.call @cc_make_string(%6709, %6710) : (!llvm.ptr, i64) -> i64
      %6712 = func.call @cc_nil_value() : () -> i64
      %6713 = func.call @cc_intern(%6711, %6712) : (i64, i64) -> i64
      %6714 = func.call @cc_nil_value() : () -> i64
      %6715 = func.call @cc_cons(%6713, %6714) : (i64, i64) -> i64
      %6716 = func.call @cc_values_pack(%6715) : (i64) -> i64
      func.call @stack_push_pointer(%6713) : (i64) -> ()
      %6717 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6718 = arith.constant 1 : i64
      %6719 = func.call @cc_make_string(%6717, %6718) : (!llvm.ptr, i64) -> i64
      %6720 = func.call @cc_nil_value() : () -> i64
      %6721 = func.call @cc_intern(%6719, %6720) : (i64, i64) -> i64
      %6722 = func.call @cc_nil_value() : () -> i64
      %6723 = func.call @cc_cons(%6721, %6722) : (i64, i64) -> i64
      %6724 = func.call @cc_values_pack(%6723) : (i64) -> i64
      func.call @stack_push_pointer(%6721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6725 = func.call @stack_pop_pointer() : () -> i64
      %6726 = func.call @stack_pop_pointer() : () -> i64
      %6727 = func.call @cc_cons(%6726, %6725) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
      %6728 = arith.addi %6727, %__rlasp_stack_elide_zero_385 : i64
      %6729 = func.call @stack_pop_pointer() : () -> i64
      %6730 = func.call @cc_cons(%6729, %6728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
      %6731 = arith.addi %6730, %__rlasp_stack_elide_zero_386 : i64
      %6732 = func.call @stack_pop_pointer() : () -> i64
      %6733 = func.call @cc_cons(%6732, %6731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6734 = func.call @stack_pop_pointer() : () -> i64
      %6735 = func.call @stack_pop_pointer() : () -> i64
      %6736 = func.call @cc_cons(%6735, %6734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
      %6737 = arith.addi %6736, %__rlasp_stack_elide_zero_387 : i64
      %6738 = func.call @stack_pop_pointer() : () -> i64
      %6739 = func.call @cc_cons(%6738, %6737) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %6740 = arith.addi %6739, %__rlasp_stack_elide_zero_388 : i64
      %6741 = func.call @stack_pop_pointer() : () -> i64
      %6742 = func.call @cc_cons(%6741, %6740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6743 = func.call @stack_pop_pointer() : () -> i64
      %6744 = func.call @stack_pop_pointer() : () -> i64
      %6745 = func.call @cc_cons(%6744, %6743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6745) : (i64) -> ()
      %6746 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6747 = arith.constant 8 : i64
      %6748 = func.call @cc_make_string(%6746, %6747) : (!llvm.ptr, i64) -> i64
      %6749 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6750 = arith.constant 11 : i64
      %6751 = func.call @cc_make_string(%6749, %6750) : (!llvm.ptr, i64) -> i64
      %6752 = func.call @cc_intern(%6748, %6751) : (i64, i64) -> i64
      %6753 = func.call @cc_nil_value() : () -> i64
      %6754 = func.call @cc_cons(%6752, %6753) : (i64, i64) -> i64
      %6755 = func.call @cc_values_pack(%6754) : (i64) -> i64
      func.call @stack_push_pointer(%6752) : (i64) -> ()
      %6756 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6757 = arith.constant 1 : i64
      %6758 = func.call @cc_make_string(%6756, %6757) : (!llvm.ptr, i64) -> i64
      %6759 = func.call @cc_nil_value() : () -> i64
      %6760 = func.call @cc_intern(%6758, %6759) : (i64, i64) -> i64
      %6761 = func.call @cc_nil_value() : () -> i64
      %6762 = func.call @cc_cons(%6760, %6761) : (i64, i64) -> i64
      %6763 = func.call @cc_values_pack(%6762) : (i64) -> i64
      func.call @stack_push_pointer(%6760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6764 = func.call @stack_pop_pointer() : () -> i64
      %6765 = func.call @stack_pop_pointer() : () -> i64
      %6766 = func.call @cc_cons(%6765, %6764) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
      %6767 = arith.addi %6766, %__rlasp_stack_elide_zero_389 : i64
      %6768 = func.call @stack_pop_pointer() : () -> i64
      %6769 = func.call @cc_cons(%6768, %6767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6770 = func.call @stack_pop_pointer() : () -> i64
      %6771 = func.call @stack_pop_pointer() : () -> i64
      %6772 = func.call @cc_cons(%6771, %6770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
      %6773 = arith.addi %6772, %__rlasp_stack_elide_zero_390 : i64
      %6774 = func.call @stack_pop_pointer() : () -> i64
      %6775 = func.call @cc_cons(%6774, %6773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
      %6776 = arith.addi %6775, %__rlasp_stack_elide_zero_391 : i64
      %6777 = func.call @stack_pop_pointer() : () -> i64
      %6778 = func.call @cc_cons(%6777, %6776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6779 = func.call @stack_pop_pointer() : () -> i64
      %6780 = func.call @stack_pop_pointer() : () -> i64
      %6781 = func.call @cc_cons(%6780, %6779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
      %6782 = arith.addi %6781, %__rlasp_stack_elide_zero_392 : i64
      %6783 = func.call @stack_pop_pointer() : () -> i64
      %6784 = func.call @cc_cons(%6783, %6782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
      %6785 = arith.addi %6784, %__rlasp_stack_elide_zero_393 : i64
      %6786 = func.call @stack_pop_pointer() : () -> i64
      %6787 = func.call @cc_cons(%6786, %6785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6788 = func.call @stack_pop_pointer() : () -> i64
      %6789 = func.call @stack_pop_pointer() : () -> i64
      %6790 = func.call @cc_cons(%6789, %6788) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
      %6791 = arith.addi %6790, %__rlasp_stack_elide_zero_394 : i64
      %6792 = func.call @stack_pop_pointer() : () -> i64
      %6793 = func.call @cc_cons(%6792, %6791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6794 = func.call @stack_pop_pointer() : () -> i64
      %6795 = func.call @stack_pop_pointer() : () -> i64
      %6796 = func.call @cc_cons(%6795, %6794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6796) : (i64) -> ()
      %6797 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6798 = arith.constant 2 : i64
      %6799 = func.call @cc_make_string(%6797, %6798) : (!llvm.ptr, i64) -> i64
      %6800 = func.call @cc_nil_value() : () -> i64
      %6801 = func.call @cc_intern(%6799, %6800) : (i64, i64) -> i64
      %6802 = func.call @cc_nil_value() : () -> i64
      %6803 = func.call @cc_cons(%6801, %6802) : (i64, i64) -> i64
      %6804 = func.call @cc_values_pack(%6803) : (i64) -> i64
      func.call @stack_push_pointer(%6801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6805 = func.call @stack_pop_pointer() : () -> i64
      %6806 = func.call @stack_pop_pointer() : () -> i64
      %6807 = func.call @cc_cons(%6806, %6805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %6808 = arith.addi %6807, %__rlasp_stack_elide_zero_395 : i64
      %6809 = func.call @stack_pop_pointer() : () -> i64
      %6810 = func.call @cc_cons(%6809, %6808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
      %6811 = arith.addi %6810, %__rlasp_stack_elide_zero_396 : i64
      %6812 = func.call @stack_pop_pointer() : () -> i64
      %6813 = func.call @cc_cons(%6812, %6811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6814 = func.call @stack_pop_pointer() : () -> i64
      %6815 = func.call @stack_pop_pointer() : () -> i64
      %6816 = func.call @cc_cons(%6815, %6814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
      %6817 = arith.addi %6816, %__rlasp_stack_elide_zero_397 : i64
      %6818 = func.call @stack_pop_pointer() : () -> i64
      %6819 = func.call @cc_cons(%6818, %6817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
      %6820 = arith.addi %6819, %__rlasp_stack_elide_zero_398 : i64
      %6821 = func.call @stack_pop_pointer() : () -> i64
      %6822 = func.call @cc_cons(%6821, %6820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
      %6823 = arith.addi %6822, %__rlasp_stack_elide_zero_399 : i64
      %6824 = func.call @stack_pop_pointer() : () -> i64
      %6825 = func.call @cc_cons(%6823, %6824) : (i64, i64) -> i64
      %6826 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6827 = arith.constant 5 : i64
      %6828 = func.call @cc_make_string(%6826, %6827) : (!llvm.ptr, i64) -> i64
      %6829 = func.call @cc_nil_value() : () -> i64
      %6830 = func.call @cc_intern(%6828, %6829) : (i64, i64) -> i64
      %6831 = func.call @cc_nil_value() : () -> i64
      %6832 = func.call @cc_cons(%6830, %6831) : (i64, i64) -> i64
      %6833 = func.call @cc_values_pack(%6832) : (i64) -> i64
      %6834 = func.call @cc_cons(%6830, %6825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6834) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6835 = func.call @stack_pop_pointer() : () -> i64
      %6836 = func.call @stack_pop_pointer() : () -> i64
      %6837 = func.call @cc_cons(%6836, %6835) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
      %6838 = arith.addi %6837, %__rlasp_stack_elide_zero_400 : i64
      %6839 = func.call @stack_pop_pointer() : () -> i64
      %6840 = func.call @cc_cons(%6839, %6838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6840) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6841 = func.call @stack_pop_pointer() : () -> i64
      %6842 = func.call @stack_pop_pointer() : () -> i64
      %6843 = func.call @cc_cons(%6842, %6841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
      %6844 = arith.addi %6843, %__rlasp_stack_elide_zero_401 : i64
      %6845 = func.call @stack_pop_pointer() : () -> i64
      %6846 = func.call @cc_cons(%6845, %6844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6846) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6847 = func.call @stack_pop_pointer() : () -> i64
      %6848 = func.call @stack_pop_pointer() : () -> i64
      %6849 = func.call @cc_cons(%6848, %6847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6849) : (i64) -> ()
      %6850 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6851 = arith.constant 19 : i64
      %6852 = func.call @cc_make_string(%6850, %6851) : (!llvm.ptr, i64) -> i64
      %6853 = llvm.mlir.addressof @str552 : !llvm.ptr
      %6854 = arith.constant 11 : i64
      %6855 = func.call @cc_make_string(%6853, %6854) : (!llvm.ptr, i64) -> i64
      %6856 = func.call @cc_intern(%6852, %6855) : (i64, i64) -> i64
      %6857 = func.call @cc_nil_value() : () -> i64
      %6858 = func.call @cc_cons(%6856, %6857) : (i64, i64) -> i64
      %6859 = func.call @cc_values_pack(%6858) : (i64) -> i64
      func.call @stack_push_pointer(%6856) : (i64) -> ()
      %6860 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6861 = arith.constant 2 : i64
      %6862 = func.call @cc_make_string(%6860, %6861) : (!llvm.ptr, i64) -> i64
      %6863 = func.call @cc_nil_value() : () -> i64
      %6864 = func.call @cc_intern(%6862, %6863) : (i64, i64) -> i64
      %6865 = func.call @cc_nil_value() : () -> i64
      %6866 = func.call @cc_cons(%6864, %6865) : (i64, i64) -> i64
      %6867 = func.call @cc_values_pack(%6866) : (i64) -> i64
      func.call @stack_push_pointer(%6864) : (i64) -> ()
      %6868 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6869 = arith.constant 9 : i64
      %6870 = func.call @cc_make_string(%6868, %6869) : (!llvm.ptr, i64) -> i64
      %6871 = func.call @cc_nil_value() : () -> i64
      %6872 = func.call @cc_intern(%6870, %6871) : (i64, i64) -> i64
      %6873 = func.call @cc_nil_value() : () -> i64
      %6874 = func.call @cc_cons(%6872, %6873) : (i64, i64) -> i64
      %6875 = func.call @cc_values_pack(%6874) : (i64) -> i64
      func.call @stack_push_pointer(%6872) : (i64) -> ()
      %6876 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6877 = arith.constant 8 : i64
      %6878 = func.call @cc_make_string(%6876, %6877) : (!llvm.ptr, i64) -> i64
      %6879 = func.call @cc_nil_value() : () -> i64
      %6880 = func.call @cc_intern(%6878, %6879) : (i64, i64) -> i64
      %6881 = func.call @cc_nil_value() : () -> i64
      %6882 = func.call @cc_cons(%6880, %6881) : (i64, i64) -> i64
      %6883 = func.call @cc_values_pack(%6882) : (i64) -> i64
      func.call @stack_push_pointer(%6880) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6884 = func.call @stack_pop_pointer() : () -> i64
      %6885 = func.call @stack_pop_pointer() : () -> i64
      %6886 = func.call @cc_cons(%6885, %6884) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
      %6887 = arith.addi %6886, %__rlasp_stack_elide_zero_402 : i64
      %6888 = func.call @stack_pop_pointer() : () -> i64
      %6889 = func.call @cc_cons(%6888, %6887) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
      %6890 = arith.addi %6889, %__rlasp_stack_elide_zero_403 : i64
      %6891 = func.call @stack_pop_pointer() : () -> i64
      %6892 = func.call @cc_cons(%6891, %6890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6892) : (i64) -> ()
      %6893 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6894 = arith.constant 7 : i64
      %6895 = func.call @cc_make_string(%6893, %6894) : (!llvm.ptr, i64) -> i64
      %6896 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6897 = arith.constant 11 : i64
      %6898 = func.call @cc_make_string(%6896, %6897) : (!llvm.ptr, i64) -> i64
      %6899 = func.call @cc_intern(%6895, %6898) : (i64, i64) -> i64
      %6900 = func.call @cc_nil_value() : () -> i64
      %6901 = func.call @cc_cons(%6899, %6900) : (i64, i64) -> i64
      %6902 = func.call @cc_values_pack(%6901) : (i64) -> i64
      func.call @stack_push_pointer(%6899) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6903 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6904 = arith.constant 1 : i64
      %6905 = func.call @cc_make_string(%6903, %6904) : (!llvm.ptr, i64) -> i64
      %6906 = func.call @cc_nil_value() : () -> i64
      %6907 = func.call @cc_intern(%6905, %6906) : (i64, i64) -> i64
      %6908 = func.call @cc_nil_value() : () -> i64
      %6909 = func.call @cc_cons(%6907, %6908) : (i64, i64) -> i64
      %6910 = func.call @cc_values_pack(%6909) : (i64) -> i64
      func.call @stack_push_pointer(%6907) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6911 = func.call @stack_pop_pointer() : () -> i64
      %6912 = func.call @stack_pop_pointer() : () -> i64
      %6913 = func.call @cc_cons(%6912, %6911) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
      %6914 = arith.addi %6913, %__rlasp_stack_elide_zero_404 : i64
      %6915 = func.call @stack_pop_pointer() : () -> i64
      %6916 = func.call @cc_cons(%6915, %6914) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
      %6917 = arith.addi %6916, %__rlasp_stack_elide_zero_405 : i64
      %6918 = func.call @stack_pop_pointer() : () -> i64
      %6919 = func.call @cc_cons(%6918, %6917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6919) : (i64) -> ()
      %6920 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6921 = arith.constant 7 : i64
      %6922 = func.call @cc_make_string(%6920, %6921) : (!llvm.ptr, i64) -> i64
      %6923 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6924 = arith.constant 11 : i64
      %6925 = func.call @cc_make_string(%6923, %6924) : (!llvm.ptr, i64) -> i64
      %6926 = func.call @cc_intern(%6922, %6925) : (i64, i64) -> i64
      %6927 = func.call @cc_nil_value() : () -> i64
      %6928 = func.call @cc_cons(%6926, %6927) : (i64, i64) -> i64
      %6929 = func.call @cc_values_pack(%6928) : (i64) -> i64
      func.call @stack_push_pointer(%6926) : (i64) -> ()
      %6930 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6931 = arith.constant 6 : i64
      %6932 = func.call @cc_make_string(%6930, %6931) : (!llvm.ptr, i64) -> i64
      %6933 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6934 = arith.constant 11 : i64
      %6935 = func.call @cc_make_string(%6933, %6934) : (!llvm.ptr, i64) -> i64
      %6936 = func.call @cc_intern(%6932, %6935) : (i64, i64) -> i64
      %6937 = func.call @cc_nil_value() : () -> i64
      %6938 = func.call @cc_cons(%6936, %6937) : (i64, i64) -> i64
      %6939 = func.call @cc_values_pack(%6938) : (i64) -> i64
      func.call @stack_push_pointer(%6936) : (i64) -> ()
      %6940 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6941 = arith.constant 2 : i64
      %6942 = func.call @cc_make_string(%6940, %6941) : (!llvm.ptr, i64) -> i64
      %6943 = func.call @cc_nil_value() : () -> i64
      %6944 = func.call @cc_intern(%6942, %6943) : (i64, i64) -> i64
      %6945 = func.call @cc_nil_value() : () -> i64
      %6946 = func.call @cc_cons(%6944, %6945) : (i64, i64) -> i64
      %6947 = func.call @cc_values_pack(%6946) : (i64) -> i64
      func.call @stack_push_pointer(%6944) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6948 = func.call @stack_pop_pointer() : () -> i64
      %6949 = func.call @stack_pop_pointer() : () -> i64
      %6950 = func.call @cc_cons(%6949, %6948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
      %6951 = arith.addi %6950, %__rlasp_stack_elide_zero_406 : i64
      %6952 = func.call @stack_pop_pointer() : () -> i64
      %6953 = func.call @cc_cons(%6952, %6951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6954 = func.call @stack_pop_pointer() : () -> i64
      %6955 = func.call @stack_pop_pointer() : () -> i64
      %6956 = func.call @cc_cons(%6955, %6954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
      %6957 = arith.addi %6956, %__rlasp_stack_elide_zero_407 : i64
      %6958 = func.call @stack_pop_pointer() : () -> i64
      %6959 = func.call @cc_cons(%6958, %6957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6959) : (i64) -> ()
      %6960 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6961 = arith.constant 6 : i64
      %6962 = func.call @cc_make_string(%6960, %6961) : (!llvm.ptr, i64) -> i64
      %6963 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6964 = arith.constant 11 : i64
      %6965 = func.call @cc_make_string(%6963, %6964) : (!llvm.ptr, i64) -> i64
      %6966 = func.call @cc_intern(%6962, %6965) : (i64, i64) -> i64
      %6967 = func.call @cc_nil_value() : () -> i64
      %6968 = func.call @cc_cons(%6966, %6967) : (i64, i64) -> i64
      %6969 = func.call @cc_values_pack(%6968) : (i64) -> i64
      func.call @stack_push_pointer(%6966) : (i64) -> ()
      %6970 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6971 = arith.constant 9 : i64
      %6972 = func.call @cc_make_string(%6970, %6971) : (!llvm.ptr, i64) -> i64
      %6973 = func.call @cc_nil_value() : () -> i64
      %6974 = func.call @cc_intern(%6972, %6973) : (i64, i64) -> i64
      %6975 = func.call @cc_nil_value() : () -> i64
      %6976 = func.call @cc_cons(%6974, %6975) : (i64, i64) -> i64
      %6977 = func.call @cc_values_pack(%6976) : (i64) -> i64
      func.call @stack_push_pointer(%6974) : (i64) -> ()
      %6978 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6979 = arith.constant 8 : i64
      %6980 = func.call @cc_make_string(%6978, %6979) : (!llvm.ptr, i64) -> i64
      %6981 = func.call @cc_nil_value() : () -> i64
      %6982 = func.call @cc_intern(%6980, %6981) : (i64, i64) -> i64
      %6983 = func.call @cc_nil_value() : () -> i64
      %6984 = func.call @cc_cons(%6982, %6983) : (i64, i64) -> i64
      %6985 = func.call @cc_values_pack(%6984) : (i64) -> i64
      func.call @stack_push_pointer(%6982) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6986 = func.call @stack_pop_pointer() : () -> i64
      %6987 = func.call @stack_pop_pointer() : () -> i64
      %6988 = func.call @cc_cons(%6987, %6986) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
      %6989 = arith.addi %6988, %__rlasp_stack_elide_zero_408 : i64
      %6990 = func.call @stack_pop_pointer() : () -> i64
      %6991 = func.call @cc_cons(%6990, %6989) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
      %6992 = arith.addi %6991, %__rlasp_stack_elide_zero_409 : i64
      %6993 = func.call @stack_pop_pointer() : () -> i64
      %6994 = func.call @cc_cons(%6993, %6992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6995 = func.call @stack_pop_pointer() : () -> i64
      %6996 = func.call @stack_pop_pointer() : () -> i64
      %6997 = func.call @cc_cons(%6996, %6995) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
      %6998 = arith.addi %6997, %__rlasp_stack_elide_zero_410 : i64
      %6999 = func.call @stack_pop_pointer() : () -> i64
      %7000 = func.call @cc_cons(%6999, %6998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
      %7001 = arith.addi %7000, %__rlasp_stack_elide_zero_411 : i64
      %7002 = func.call @stack_pop_pointer() : () -> i64
      %7003 = func.call @cc_cons(%7002, %7001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
      %7004 = arith.addi %7003, %__rlasp_stack_elide_zero_412 : i64
      %7005 = func.call @stack_pop_pointer() : () -> i64
      %7006 = func.call @cc_cons(%7005, %7004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
      %7007 = arith.addi %7006, %__rlasp_stack_elide_zero_413 : i64
      %7008 = func.call @stack_pop_pointer() : () -> i64
      %7009 = func.call @cc_cons(%7008, %7007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7010 = func.call @stack_pop_pointer() : () -> i64
      %7011 = func.call @stack_pop_pointer() : () -> i64
      %7012 = func.call @cc_cons(%7011, %7010) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
      %7013 = arith.addi %7012, %__rlasp_stack_elide_zero_414 : i64
      %7014 = func.call @stack_pop_pointer() : () -> i64
      %7015 = func.call @cc_cons(%7014, %7013) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
      %7016 = arith.addi %7015, %__rlasp_stack_elide_zero_415 : i64
      %7017 = func.call @stack_pop_pointer() : () -> i64
      %7018 = func.call @cc_cons(%7017, %7016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
      %7019 = arith.addi %7018, %__rlasp_stack_elide_zero_416 : i64
      %7119 = llvm.mlir.addressof @str572 : !llvm.ptr
      %7120 = arith.constant 31 : i64
      %7121 = func.call @cc_make_symbol(%7119, %7120) : (!llvm.ptr, i64) -> i64
      %7122 = func.call @cc_persistent_root_value(%7121) : (i64) -> i64
      func.call @stack_push_pointer(%7122) : (i64) -> ()
      %7123 = llvm.mlir.addressof @str573 : !llvm.ptr
      %7124 = arith.constant 37 : i64
      %7125 = func.call @cc_make_symbol(%7123, %7124) : (!llvm.ptr, i64) -> i64
      %7126 = func.call @cc_persistent_root_value(%7125) : (i64) -> i64
      func.call @stack_push_pointer(%7126) : (i64) -> ()
      %7127 = llvm.mlir.addressof @str574 : !llvm.ptr
      %7128 = arith.constant 38 : i64
      %7129 = func.call @cc_make_symbol(%7127, %7128) : (!llvm.ptr, i64) -> i64
      %7130 = func.call @cc_persistent_root_value(%7129) : (i64) -> i64
      func.call @stack_push_pointer(%7130) : (i64) -> ()
      %7131 = arith.constant 275462358040644 : i64
      %7132 = arith.constant 3 : i64
      %7133 = func.call @cc_make_closure(%7131, %7132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
      %7134 = arith.addi %7133, %__rlasp_stack_elide_zero_417 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7135 = func.call @stack_pop_pointer() : () -> i64
      %7136 = func.call @stack_pop_pointer() : () -> i64
      %7137 = func.call @cc_cons(%7136, %7135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %7138 = arith.addi %7137, %__rlasp_stack_elide_zero_418 : i64
      %7139 = func.call @stack_pop_pointer() : () -> i64
      %7140 = func.call @cc_cons(%7139, %7138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
      %7141 = arith.addi %7140, %__rlasp_stack_elide_zero_419 : i64
      %7142 = llvm.mlir.addressof @str575 : !llvm.ptr
      %7143 = arith.constant 11 : i64
      %7144 = func.call @cc_make_string(%7142, %7143) : (!llvm.ptr, i64) -> i64
      %7145 = llvm.mlir.addressof @str576 : !llvm.ptr
      %7146 = arith.constant 7 : i64
      %7147 = func.call @cc_make_string(%7145, %7146) : (!llvm.ptr, i64) -> i64
      %7148 = func.call @cc_intern(%7144, %7147) : (i64, i64) -> i64
      %7149 = func.call @cc_nil_value() : () -> i64
      %7150 = func.call @cc_cons(%7148, %7149) : (i64, i64) -> i64
      %7151 = func.call @cc_values_pack(%7150) : (i64) -> i64
      %7152 = func.call @cc_nil_value() : () -> i64
      %7153 = llvm.mlir.addressof @str577 : !llvm.ptr
      %7154 = arith.constant 4 : i64
      %7155 = func.call @cc_make_string(%7153, %7154) : (!llvm.ptr, i64) -> i64
      %7156 = llvm.mlir.addressof @str578 : !llvm.ptr
      %7157 = arith.constant 7 : i64
      %7158 = func.call @cc_make_string(%7156, %7157) : (!llvm.ptr, i64) -> i64
      %7159 = func.call @cc_intern(%7155, %7158) : (i64, i64) -> i64
      %7160 = func.call @cc_nil_value() : () -> i64
      %7161 = func.call @cc_cons(%7159, %7160) : (i64, i64) -> i64
      %7162 = func.call @cc_values_pack(%7161) : (i64) -> i64
      %7163 = llvm.mlir.addressof @str579 : !llvm.ptr
      %7164 = arith.constant 6 : i64
      %7165 = func.call @cc_make_string(%7163, %7164) : (!llvm.ptr, i64) -> i64
      %7166 = func.call @cc_nil_value() : () -> i64
      %7167 = func.call @cc_intern(%7165, %7166) : (i64, i64) -> i64
      %7168 = func.call @cc_nil_value() : () -> i64
      %7169 = func.call @cc_cons(%7167, %7168) : (i64, i64) -> i64
      %7170 = func.call @cc_values_pack(%7169) : (i64) -> i64
      %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
      %7171 = arith.addi %7167, %__rlasp_stack_elide_zero_420 : i64
      %7172 = func.call @cc_nil_value() : () -> i64
      %7173 = func.call @cc_errorp(%6593) : (i64) -> i64
      %7174 = arith.cmpi ne, %7173, %7172 : i64
      %7175 = arith.cmpi eq, %7172, %7172 : i64
      %7176 = arith.andi %7174, %7175 : i1
      %7177 = scf.if %7176 -> (i64) {
        scf.yield %6593 : i64
      } else {
        scf.yield %7172 : i64
      }
      %7178 = func.call @cc_errorp(%7019) : (i64) -> i64
      %7179 = arith.cmpi ne, %7178, %7172 : i64
      %7180 = arith.cmpi eq, %7177, %7172 : i64
      %7181 = arith.andi %7179, %7180 : i1
      %7182 = scf.if %7181 -> (i64) {
        scf.yield %7019 : i64
      } else {
        scf.yield %7177 : i64
      }
      %7183 = func.call @cc_errorp(%7134) : (i64) -> i64
      %7184 = arith.cmpi ne, %7183, %7172 : i64
      %7185 = arith.cmpi eq, %7182, %7172 : i64
      %7186 = arith.andi %7184, %7185 : i1
      %7187 = scf.if %7186 -> (i64) {
        scf.yield %7134 : i64
      } else {
        scf.yield %7182 : i64
      }
      %7188 = func.call @cc_errorp(%7141) : (i64) -> i64
      %7189 = arith.cmpi ne, %7188, %7172 : i64
      %7190 = arith.cmpi eq, %7187, %7172 : i64
      %7191 = arith.andi %7189, %7190 : i1
      %7192 = scf.if %7191 -> (i64) {
        scf.yield %7141 : i64
      } else {
        scf.yield %7187 : i64
      }
      %7193 = func.call @cc_errorp(%7148) : (i64) -> i64
      %7194 = arith.cmpi ne, %7193, %7172 : i64
      %7195 = arith.cmpi eq, %7192, %7172 : i64
      %7196 = arith.andi %7194, %7195 : i1
      %7197 = scf.if %7196 -> (i64) {
        scf.yield %7148 : i64
      } else {
        scf.yield %7192 : i64
      }
      %7198 = func.call @cc_errorp(%7152) : (i64) -> i64
      %7199 = arith.cmpi ne, %7198, %7172 : i64
      %7200 = arith.cmpi eq, %7197, %7172 : i64
      %7201 = arith.andi %7199, %7200 : i1
      %7202 = scf.if %7201 -> (i64) {
        scf.yield %7152 : i64
      } else {
        scf.yield %7197 : i64
      }
      %7203 = func.call @cc_errorp(%7159) : (i64) -> i64
      %7204 = arith.cmpi ne, %7203, %7172 : i64
      %7205 = arith.cmpi eq, %7202, %7172 : i64
      %7206 = arith.andi %7204, %7205 : i1
      %7207 = scf.if %7206 -> (i64) {
        scf.yield %7159 : i64
      } else {
        scf.yield %7202 : i64
      }
      %7208 = func.call @cc_errorp(%7171) : (i64) -> i64
      %7209 = arith.cmpi ne, %7208, %7172 : i64
      %7210 = arith.cmpi eq, %7207, %7172 : i64
      %7211 = arith.andi %7209, %7210 : i1
      %7212 = scf.if %7211 -> (i64) {
        scf.yield %7171 : i64
      } else {
        scf.yield %7207 : i64
      }
      %7213 = arith.cmpi ne, %7212, %7172 : i64
      scf.if %7213 {
        func.call @stack_push_pointer(%7212) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6593) : (i64) -> ()
        func.call @stack_push_pointer(%7019) : (i64) -> ()
        func.call @stack_push_pointer(%7134) : (i64) -> ()
        func.call @stack_push_pointer(%7141) : (i64) -> ()
        func.call @stack_push_pointer(%7148) : (i64) -> ()
        func.call @stack_push_pointer(%7152) : (i64) -> ()
        func.call @stack_push_pointer(%7159) : (i64) -> ()
        func.call @stack_push_pointer(%7171) : (i64) -> ()
        %7214 = llvm.mlir.addressof @str580 : !llvm.ptr
        %7215 = func.call @cc_make_function_ref_const(%7214) : (!llvm.ptr) -> i64
        %7216 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7215, %7216) : (i64, i64) -> ()
      }
      %7217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7217 : i64
    }
    %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
    %7218 = arith.addi %6584, %__rlasp_stack_elide_zero_421 : i64
    %7219 = func.call @cc_multiple_value_list(%7218) : (i64) -> i64
    %7220 = llvm.mlir.addressof @str581 : !llvm.ptr
    %7221 = arith.constant 38 : i64
    %7222 = func.call @cc_make_string(%7220, %7221) : (!llvm.ptr, i64) -> i64
    %7223 = func.call @cc_nil_value() : () -> i64
    %7224 = func.call @cc_intern(%7222, %7223) : (i64, i64) -> i64
    %7225 = func.call @cc_nil_value() : () -> i64
    %7226 = func.call @cc_cons(%7224, %7225) : (i64, i64) -> i64
    %7227 = func.call @cc_values_pack(%7226) : (i64) -> i64
    %7228 = func.call @cc_symbol_value(%7224) : (i64) -> i64
    %7229 = llvm.mlir.addressof @str582 : !llvm.ptr
    %7230 = arith.constant 40 : i64
    %7231 = func.call @cc_make_string(%7229, %7230) : (!llvm.ptr, i64) -> i64
    %7232 = func.call @cc_nil_value() : () -> i64
    %7233 = func.call @cc_intern(%7231, %7232) : (i64, i64) -> i64
    %7234 = func.call @cc_nil_value() : () -> i64
    %7235 = func.call @cc_cons(%7233, %7234) : (i64, i64) -> i64
    %7236 = func.call @cc_values_pack(%7235) : (i64) -> i64
    %7237 = func.call @cc_symbol_value(%7233) : (i64) -> i64
    %7238 = func.call @cc_nil_value() : () -> i64
    %7239 = arith.cmpi ne, %7228, %7238 : i64
    %7240 = scf.if %7239 -> (i64) {
      scf.yield %7237 : i64
    } else {
      scf.yield %7219 : i64
    }
    %7241 = func.call @cc_values_pack(%7240) : (i64) -> i64
    func.call @stack_push_pointer(%7241) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040579"() {
    %392 = func.call @stack_pop_pointer() : () -> i64
    %393 = func.call @cc_nil_value() : () -> i64
    %394 = func.call @cc_nil_value() : () -> i64
    %395 = func.call @cc_errorp(%393) : (i64) -> i64
    %396 = arith.cmpi ne, %395, %394 : i64
    %397 = scf.if %396 -> (i64) {
      scf.yield %393 : i64
    } else {
      %398 = func.call @cc_symbol_value(%392) : (i64) -> i64
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %399 = arith.addi %398, %__rlasp_stack_elide_zero_422 : i64
      scf.yield %399 : i64
    }
    func.call @stack_push_pointer(%397) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040578"() {
    %386 = func.call @stack_pop_pointer() : () -> i64
    %387 = func.call @cc_nil_value() : () -> i64
    %388 = func.call @cc_nil_value() : () -> i64
    %389 = func.call @cc_errorp(%387) : (i64) -> i64
    %390 = arith.cmpi ne, %389, %388 : i64
    %391 = scf.if %390 -> (i64) {
      scf.yield %387 : i64
    } else {
      %400 = llvm.mlir.addressof @str37 : !llvm.ptr
      %401 = arith.constant 30 : i64
      %402 = func.call @cc_make_symbol(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = func.call @cc_persistent_root_value(%402) : (i64) -> i64
      %404 = func.call @cc_set_symbol_value(%403, %386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %405 = arith.constant 275462358040579 : i64
      %406 = arith.constant 1 : i64
      %407 = func.call @cc_make_closure(%405, %406) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %408 = arith.addi %407, %__rlasp_stack_elide_zero_423 : i64
      scf.yield %408 : i64
    }
    func.call @stack_push_pointer(%391) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040577"() {
    %377 = func.call @stack_pop_pointer() : () -> i64
    %378 = func.call @stack_pop_pointer() : () -> i64
    %379 = func.call @stack_pop_pointer() : () -> i64
    %380 = func.call @cc_nil_value() : () -> i64
    %381 = func.call @cc_nil_value() : () -> i64
    %382 = func.call @cc_errorp(%380) : (i64) -> i64
    %383 = arith.cmpi ne, %382, %381 : i64
    %384 = scf.if %383 -> (i64) {
      scf.yield %380 : i64
    } else {
      %385 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%385) : (i64) -> ()
      %409 = arith.constant 275462358040578 : i64
      %410 = arith.constant 0 : i64
      %411 = func.call @cc_make_closure(%409, %410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %412 = arith.addi %411, %__rlasp_stack_elide_zero_424 : i64
      %413 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%412, %413) : (i64, i64) -> ()
      %414 = func.call @stack_pop_pointer() : () -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_nil_value() : () -> i64
      %417 = func.call @cc_errorp(%415) : (i64) -> i64
      %418 = arith.cmpi ne, %417, %416 : i64
      %419 = scf.if %418 -> (i64) {
        scf.yield %415 : i64
      } else {
        %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
        %420 = arith.addi %414, %__rlasp_stack_elide_zero_425 : i64
        %421 = func.call @cc_nil_value() : () -> i64
        %422 = func.call @cc_cons(%421, %421) : (i64, i64) -> i64
        %423 = func.call @cc_cons(%421, %422) : (i64, i64) -> i64
        %424 = func.call @cc_cons(%420, %423) : (i64, i64) -> i64
        %425 = func.call @cc_values_pack(%424) : (i64) -> i64
        %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
        %426 = arith.addi %425, %__rlasp_stack_elide_zero_426 : i64
        %427 = func.call @cc_multiple_value_list(%426) : (i64) -> i64
        %428 = arith.constant 0 : i64
        %429 = func.call @cc_box_fixnum(%428) : (i64) -> i64
        %430 = func.call @cc_nth(%429, %427) : (i64, i64) -> i64
        %431 = arith.constant 1 : i64
        %432 = func.call @cc_box_fixnum(%431) : (i64) -> i64
        %433 = func.call @cc_nth(%432, %427) : (i64, i64) -> i64
        %434 = arith.constant 2 : i64
        %435 = func.call @cc_box_fixnum(%434) : (i64) -> i64
        %436 = func.call @cc_nth(%435, %427) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
        %437 = arith.addi %414, %__rlasp_stack_elide_zero_427 : i64
        %438 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%437, %438) : (i64, i64) -> ()
        %439 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
        %440 = arith.addi %430, %__rlasp_stack_elide_zero_428 : i64
        %441 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%440, %441) : (i64, i64) -> ()
        %442 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
        %443 = arith.addi %433, %__rlasp_stack_elide_zero_429 : i64
        %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
        %444 = arith.addi %436, %__rlasp_stack_elide_zero_430 : i64
        func.call @stack_push_nil() : () -> ()
        %445 = func.call @stack_pop_pointer() : () -> i64
        %446 = func.call @cc_cons(%444, %445) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
        %447 = arith.addi %446, %__rlasp_stack_elide_zero_431 : i64
        %448 = func.call @cc_cons(%443, %447) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
        %449 = arith.addi %448, %__rlasp_stack_elide_zero_432 : i64
        %450 = func.call @cc_cons(%442, %449) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
        %451 = arith.addi %450, %__rlasp_stack_elide_zero_433 : i64
        %452 = func.call @cc_cons(%439, %451) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
        %453 = arith.addi %452, %__rlasp_stack_elide_zero_434 : i64
        %454 = func.call @cc_values_pack(%453) : (i64) -> i64
        %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
        %455 = arith.addi %454, %__rlasp_stack_elide_zero_435 : i64
        scf.yield %455 : i64
      }
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %456 = arith.addi %419, %__rlasp_stack_elide_zero_436 : i64
      scf.yield %456 : i64
    }
    func.call @stack_push_pointer(%384) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040586"() {
    %1208 = func.call @stack_pop_pointer() : () -> i64
    %1209 = func.call @cc_nil_value() : () -> i64
    %1210 = func.call @cc_nil_value() : () -> i64
    %1211 = func.call @cc_errorp(%1209) : (i64) -> i64
    %1212 = arith.cmpi ne, %1211, %1210 : i64
    %1213 = scf.if %1212 -> (i64) {
      scf.yield %1209 : i64
    } else {
      %1214 = func.call @cc_symbol_value(%1208) : (i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %1215 = arith.addi %1214, %__rlasp_stack_elide_zero_437 : i64
      scf.yield %1215 : i64
    }
    func.call @stack_push_pointer(%1213) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040588"() {
    %1225 = func.call @stack_pop_pointer() : () -> i64
    %1226 = func.call @stack_pop_pointer() : () -> i64
    %1227 = func.call @cc_nil_value() : () -> i64
    %1228 = func.call @cc_nil_value() : () -> i64
    %1229 = func.call @cc_errorp(%1227) : (i64) -> i64
    %1230 = arith.cmpi ne, %1229, %1228 : i64
    %1231 = scf.if %1230 -> (i64) {
      scf.yield %1227 : i64
    } else {
      %1232 = func.call @cc_set_symbol_value(%1226, %1225) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %1233 = arith.addi %1225, %__rlasp_stack_elide_zero_438 : i64
      scf.yield %1233 : i64
    }
    func.call @stack_push_pointer(%1231) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040585"() {
    %1202 = func.call @stack_pop_pointer() : () -> i64
    %1203 = func.call @cc_nil_value() : () -> i64
    %1204 = func.call @cc_nil_value() : () -> i64
    %1205 = func.call @cc_errorp(%1203) : (i64) -> i64
    %1206 = arith.cmpi ne, %1205, %1204 : i64
    %1207:2 = scf.if %1206 -> (i64, i64) {
      scf.yield %1203, %1202 : i64, i64
    } else {
      %1216 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1217 = arith.constant 30 : i64
      %1218 = func.call @cc_make_symbol(%1216, %1217) : (!llvm.ptr, i64) -> i64
      %1219 = func.call @cc_persistent_root_value(%1218) : (i64) -> i64
      %1220 = func.call @cc_set_symbol_value(%1219, %1202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1219) : (i64) -> ()
      %1221 = arith.constant 275462358040586 : i64
      %1222 = arith.constant 1 : i64
      %1223 = func.call @cc_make_closure(%1221, %1222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %1224 = arith.addi %1223, %__rlasp_stack_elide_zero_439 : i64
      func.call @stack_push_pointer(%1219) : (i64) -> ()
      %1234 = arith.constant 275462358040588 : i64
      %1235 = arith.constant 1 : i64
      %1236 = func.call @cc_make_closure(%1234, %1235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %1237 = arith.addi %1236, %__rlasp_stack_elide_zero_440 : i64
      func.call @stack_push_nil() : () -> ()
      %1238 = func.call @stack_pop_pointer() : () -> i64
      %1239 = func.call @cc_cons(%1237, %1238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %1240 = arith.addi %1239, %__rlasp_stack_elide_zero_441 : i64
      %1241 = func.call @cc_cons(%1224, %1240) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %1242 = arith.addi %1241, %__rlasp_stack_elide_zero_442 : i64
      %1243 = func.call @cc_values_pack(%1242) : (i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %1244 = arith.addi %1243, %__rlasp_stack_elide_zero_443 : i64
      scf.yield %1244, %1202 : i64, i64
    }
    func.call @stack_push_pointer(%1207#0) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040584"() {
    %1190 = func.call @stack_pop_pointer() : () -> i64
    %1191 = func.call @stack_pop_pointer() : () -> i64
    %1192 = func.call @stack_pop_pointer() : () -> i64
    %1193 = func.call @stack_pop_pointer() : () -> i64
    %1194 = func.call @stack_pop_pointer() : () -> i64
    %1195 = func.call @stack_pop_pointer() : () -> i64
    %1196 = func.call @cc_nil_value() : () -> i64
    %1197 = func.call @cc_nil_value() : () -> i64
    %1198 = func.call @cc_errorp(%1196) : (i64) -> i64
    %1199 = arith.cmpi ne, %1198, %1197 : i64
    %1200 = scf.if %1199 -> (i64) {
      scf.yield %1196 : i64
    } else {
      %1201 = arith.constant 237 : i64
      func.call @stack_push_fixnum(%1201) : (i64) -> ()
      %1245 = arith.constant 275462358040585 : i64
      %1246 = arith.constant 0 : i64
      %1247 = func.call @cc_make_closure(%1245, %1246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %1248 = arith.addi %1247, %__rlasp_stack_elide_zero_444 : i64
      %1249 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1248, %1249) : (i64, i64) -> ()
      %1250 = func.call @stack_pop_pointer() : () -> i64
      %1251 = func.call @cc_multiple_value_list(%1250) : (i64) -> i64
      %1252 = arith.constant 0 : i64
      %1253 = func.call @cc_box_fixnum(%1252) : (i64) -> i64
      %1254 = func.call @cc_nth(%1253, %1251) : (i64, i64) -> i64
      %1255 = arith.constant 1 : i64
      %1256 = func.call @cc_box_fixnum(%1255) : (i64) -> i64
      %1257 = func.call @cc_nth(%1256, %1251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %1258 = arith.addi %1254, %__rlasp_stack_elide_zero_445 : i64
      %1259 = func.call @cc_nil_value() : () -> i64
      %1260 = func.call @cc_cons(%1259, %1259) : (i64, i64) -> i64
      %1261 = func.call @cc_cons(%1259, %1260) : (i64, i64) -> i64
      %1262 = func.call @cc_cons(%1258, %1261) : (i64, i64) -> i64
      %1263 = func.call @cc_values_pack(%1262) : (i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %1264 = arith.addi %1263, %__rlasp_stack_elide_zero_446 : i64
      %1265 = func.call @cc_multiple_value_list(%1264) : (i64) -> i64
      %1266 = arith.constant 0 : i64
      %1267 = func.call @cc_box_fixnum(%1266) : (i64) -> i64
      %1268 = func.call @cc_nth(%1267, %1265) : (i64, i64) -> i64
      %1269 = arith.constant 1 : i64
      %1270 = func.call @cc_box_fixnum(%1269) : (i64) -> i64
      %1271 = func.call @cc_nth(%1270, %1265) : (i64, i64) -> i64
      %1272 = arith.constant 2 : i64
      %1273 = func.call @cc_box_fixnum(%1272) : (i64) -> i64
      %1274 = func.call @cc_nth(%1273, %1265) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %1275 = arith.addi %1257, %__rlasp_stack_elide_zero_447 : i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_cons(%1276, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_cons(%1276, %1277) : (i64, i64) -> i64
      %1279 = func.call @cc_cons(%1275, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_values_pack(%1279) : (i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %1281 = arith.addi %1280, %__rlasp_stack_elide_zero_448 : i64
      %1282 = func.call @cc_multiple_value_list(%1281) : (i64) -> i64
      %1283 = arith.constant 0 : i64
      %1284 = func.call @cc_box_fixnum(%1283) : (i64) -> i64
      %1285 = func.call @cc_nth(%1284, %1282) : (i64, i64) -> i64
      %1286 = arith.constant 1 : i64
      %1287 = func.call @cc_box_fixnum(%1286) : (i64) -> i64
      %1288 = func.call @cc_nth(%1287, %1282) : (i64, i64) -> i64
      %1289 = arith.constant 2 : i64
      %1290 = func.call @cc_box_fixnum(%1289) : (i64) -> i64
      %1291 = func.call @cc_nth(%1290, %1282) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %1292 = arith.addi %1254, %__rlasp_stack_elide_zero_449 : i64
      %1293 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%1292, %1293) : (i64, i64) -> ()
      %1294 = func.call @stack_pop_pointer() : () -> i64
      %1295 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1295) : (i64) -> ()
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %1296 = arith.addi %1257, %__rlasp_stack_elide_zero_450 : i64
      %1297 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1296, %1297) : (i64, i64) -> ()
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %1299 = arith.addi %1268, %__rlasp_stack_elide_zero_451 : i64
      %1300 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%1299, %1300) : (i64, i64) -> ()
      %1301 = func.call @stack_pop_pointer() : () -> i64
      %1302 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1302) : (i64) -> ()
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %1303 = arith.addi %1285, %__rlasp_stack_elide_zero_452 : i64
      %1304 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1303, %1304) : (i64, i64) -> ()
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %1306 = arith.addi %1254, %__rlasp_stack_elide_zero_453 : i64
      %1307 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%1306, %1307) : (i64, i64) -> ()
      %1308 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %1309 = arith.addi %1271, %__rlasp_stack_elide_zero_454 : i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %1310 = arith.addi %1274, %__rlasp_stack_elide_zero_455 : i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %1311 = arith.addi %1288, %__rlasp_stack_elide_zero_456 : i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %1312 = arith.addi %1291, %__rlasp_stack_elide_zero_457 : i64
      func.call @stack_push_nil() : () -> ()
      %1313 = func.call @stack_pop_pointer() : () -> i64
      %1314 = func.call @cc_cons(%1312, %1313) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %1315 = arith.addi %1314, %__rlasp_stack_elide_zero_458 : i64
      %1316 = func.call @cc_cons(%1311, %1315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
      %1317 = arith.addi %1316, %__rlasp_stack_elide_zero_459 : i64
      %1318 = func.call @cc_cons(%1310, %1317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %1319 = arith.addi %1318, %__rlasp_stack_elide_zero_460 : i64
      %1320 = func.call @cc_cons(%1309, %1319) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %1321 = arith.addi %1320, %__rlasp_stack_elide_zero_461 : i64
      %1322 = func.call @cc_cons(%1308, %1321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
      %1323 = arith.addi %1322, %__rlasp_stack_elide_zero_462 : i64
      %1324 = func.call @cc_cons(%1305, %1323) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
      %1325 = arith.addi %1324, %__rlasp_stack_elide_zero_463 : i64
      %1326 = func.call @cc_cons(%1301, %1325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %1327 = arith.addi %1326, %__rlasp_stack_elide_zero_464 : i64
      %1328 = func.call @cc_cons(%1298, %1327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
      %1329 = arith.addi %1328, %__rlasp_stack_elide_zero_465 : i64
      %1330 = func.call @cc_cons(%1294, %1329) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
      %1331 = arith.addi %1330, %__rlasp_stack_elide_zero_466 : i64
      %1332 = func.call @cc_values_pack(%1331) : (i64) -> i64
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %1333 = arith.addi %1332, %__rlasp_stack_elide_zero_467 : i64
      scf.yield %1333 : i64
    }
    func.call @stack_push_pointer(%1200) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040597"() {
    %1937 = func.call @stack_pop_pointer() : () -> i64
    %1938 = func.call @stack_pop_pointer() : () -> i64
    %1939 = func.call @cc_nil_value() : () -> i64
    %1940 = func.call @cc_nil_value() : () -> i64
    %1941 = func.call @cc_errorp(%1939) : (i64) -> i64
    %1942 = arith.cmpi ne, %1941, %1940 : i64
    %1943 = scf.if %1942 -> (i64) {
      scf.yield %1939 : i64
    } else {
      %1944 = func.call @cc_symbol_value(%1938) : (i64) -> i64
      %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
      %1945 = arith.addi %1944, %__rlasp_stack_elide_zero_468 : i64
      %1946 = func.call @cc_symbol_value(%1937) : (i64) -> i64
      %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
      %1947 = arith.addi %1946, %__rlasp_stack_elide_zero_469 : i64
      %1948 = func.call @cc_nil_value() : () -> i64
      %1949 = func.call @cc_errorp(%1945) : (i64) -> i64
      %1950 = arith.cmpi ne, %1949, %1948 : i64
      %1951 = arith.cmpi eq, %1948, %1948 : i64
      %1952 = arith.andi %1950, %1951 : i1
      %1953 = scf.if %1952 -> (i64) {
        scf.yield %1945 : i64
      } else {
        scf.yield %1948 : i64
      }
      %1954 = func.call @cc_errorp(%1947) : (i64) -> i64
      %1955 = arith.cmpi ne, %1954, %1948 : i64
      %1956 = arith.cmpi eq, %1953, %1948 : i64
      %1957 = arith.andi %1955, %1956 : i1
      %1958 = scf.if %1957 -> (i64) {
        scf.yield %1947 : i64
      } else {
        scf.yield %1953 : i64
      }
      %1959 = arith.cmpi ne, %1958, %1948 : i64
      scf.if %1959 {
        func.call @stack_push_pointer(%1958) : (i64) -> ()
      } else {
        %1960 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1960) : (i64) -> ()
        %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
        %1961 = arith.addi %1947, %__rlasp_stack_elide_zero_470 : i64
        %1962 = func.call @stack_pop_pointer() : () -> i64
        %1963 = func.call @cc_cons(%1961, %1962) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1963) : (i64) -> ()
        %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
        %1964 = arith.addi %1945, %__rlasp_stack_elide_zero_471 : i64
        %1965 = func.call @stack_pop_pointer() : () -> i64
        %1966 = func.call @cc_cons(%1964, %1965) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1966) : (i64) -> ()
      }
      %1967 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1967 : i64
    }
    func.call @stack_push_pointer(%1943) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040596"() {
    %1930 = func.call @stack_pop_pointer() : () -> i64
    %1931 = func.call @stack_pop_pointer() : () -> i64
    %1932 = func.call @cc_nil_value() : () -> i64
    %1933 = func.call @cc_nil_value() : () -> i64
    %1934 = func.call @cc_errorp(%1932) : (i64) -> i64
    %1935 = arith.cmpi ne, %1934, %1933 : i64
    %1936 = scf.if %1935 -> (i64) {
      scf.yield %1932 : i64
    } else {
      %1968 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1969 = arith.constant 30 : i64
      %1970 = func.call @cc_make_symbol(%1968, %1969) : (!llvm.ptr, i64) -> i64
      %1971 = func.call @cc_persistent_root_value(%1970) : (i64) -> i64
      %1972 = func.call @cc_set_symbol_value(%1971, %1931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1971) : (i64) -> ()
      %1973 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1974 = arith.constant 30 : i64
      %1975 = func.call @cc_make_symbol(%1973, %1974) : (!llvm.ptr, i64) -> i64
      %1976 = func.call @cc_persistent_root_value(%1975) : (i64) -> i64
      %1977 = func.call @cc_set_symbol_value(%1976, %1930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1976) : (i64) -> ()
      %1978 = arith.constant 275462358040597 : i64
      %1979 = arith.constant 2 : i64
      %1980 = func.call @cc_make_closure(%1978, %1979) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
      %1981 = arith.addi %1980, %__rlasp_stack_elide_zero_472 : i64
      scf.yield %1981 : i64
    }
    func.call @stack_push_pointer(%1936) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040595"() {
    %1920 = func.call @stack_pop_pointer() : () -> i64
    %1921 = func.call @stack_pop_pointer() : () -> i64
    %1922 = func.call @stack_pop_pointer() : () -> i64
    %1923 = func.call @cc_nil_value() : () -> i64
    %1924 = func.call @cc_nil_value() : () -> i64
    %1925 = func.call @cc_errorp(%1923) : (i64) -> i64
    %1926 = arith.cmpi ne, %1925, %1924 : i64
    %1927 = scf.if %1926 -> (i64) {
      scf.yield %1923 : i64
    } else {
      %1928 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1928) : (i64) -> ()
      %1929 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%1929) : (i64) -> ()
      %1982 = arith.constant 275462358040596 : i64
      %1983 = arith.constant 0 : i64
      %1984 = func.call @cc_make_closure(%1982, %1983) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %1985 = arith.addi %1984, %__rlasp_stack_elide_zero_473 : i64
      %1986 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%1985, %1986) : (i64, i64) -> ()
      %1987 = func.call @stack_pop_pointer() : () -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_nil_value() : () -> i64
      %1990 = func.call @cc_errorp(%1988) : (i64) -> i64
      %1991 = arith.cmpi ne, %1990, %1989 : i64
      %1992 = scf.if %1991 -> (i64) {
        scf.yield %1988 : i64
      } else {
        %1993 = arith.constant 7 : i64
        %1994 = func.call @cc_box_fixnum(%1993) : (i64) -> i64
        %1995 = arith.constant 0 : i64
        %1996 = func.call @cc_box_fixnum(%1995) : (i64) -> i64
        %1997 = func.call @cc_nil_value() : () -> i64
        %1998 = func.call @cc_nil_value() : () -> i64
        %1999 = func.call @cc_nil_value() : () -> i64
        %2000 = func.call @cc_nil_value() : () -> i64
        %2001 = func.call @cc_nil_value() : () -> i64
        %2002 = func.call @cc_nil_value() : () -> i64
        %2003 = func.call @cc_nil_value() : () -> i64
        %2004 = func.call @cc_errorp(%2002) : (i64) -> i64
        %2005 = arith.cmpi ne, %2004, %2003 : i64
        %2006 = scf.if %2005 -> (i64) {
          scf.yield %2002 : i64
        } else {
          %2007 = func.call @cc_nil_value() : () -> i64
          %2008 = llvm.mlir.addressof @str173 : !llvm.ptr
          %2009 = arith.constant 38 : i64
          %2010 = func.call @cc_make_string(%2008, %2009) : (!llvm.ptr, i64) -> i64
          %2011 = func.call @cc_nil_value() : () -> i64
          %2012 = func.call @cc_intern(%2010, %2011) : (i64, i64) -> i64
          %2013 = func.call @cc_nil_value() : () -> i64
          %2014 = func.call @cc_cons(%2012, %2013) : (i64, i64) -> i64
          %2015 = func.call @cc_values_pack(%2014) : (i64) -> i64
          %2016 = func.call @cc_set_symbol_value(%2012, %2007) : (i64, i64) -> i64
          %2017 = llvm.mlir.addressof @str174 : !llvm.ptr
          %2018 = arith.constant 39 : i64
          %2019 = func.call @cc_make_string(%2017, %2018) : (!llvm.ptr, i64) -> i64
          %2020 = func.call @cc_nil_value() : () -> i64
          %2021 = func.call @cc_intern(%2019, %2020) : (i64, i64) -> i64
          %2022 = func.call @cc_nil_value() : () -> i64
          %2023 = func.call @cc_cons(%2021, %2022) : (i64, i64) -> i64
          %2024 = func.call @cc_values_pack(%2023) : (i64) -> i64
          %2025 = func.call @cc_set_symbol_value(%2021, %2007) : (i64, i64) -> i64
          %2026 = llvm.mlir.addressof @str175 : !llvm.ptr
          %2027 = arith.constant 40 : i64
          %2028 = func.call @cc_make_string(%2026, %2027) : (!llvm.ptr, i64) -> i64
          %2029 = func.call @cc_nil_value() : () -> i64
          %2030 = func.call @cc_intern(%2028, %2029) : (i64, i64) -> i64
          %2031 = func.call @cc_nil_value() : () -> i64
          %2032 = func.call @cc_cons(%2030, %2031) : (i64, i64) -> i64
          %2033 = func.call @cc_values_pack(%2032) : (i64) -> i64
          %2034 = func.call @cc_set_symbol_value(%2030, %2007) : (i64, i64) -> i64
          %2035:6 = scf.while (%arg0 = %1997, %arg1 = %2001, %arg2 = %2000, %arg3 = %1999, %arg4 = %1998, %arg5 = %1996) : (i64, i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64, i64) {
            %2036 = func.call @cc_nil_value() : () -> i64
            %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
            %2037 = arith.addi %arg4, %__rlasp_stack_elide_zero_474 : i64
            %2038 = func.call @cc_nil_value() : () -> i64
            %2039 = func.call @cc_cons(%2037, %2038) : (i64, i64) -> i64
            %2040 = func.call @cc_not(%2039) : (i64) -> i64
            %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
            %2041 = arith.addi %2040, %__rlasp_stack_elide_zero_475 : i64
            %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
            %2042 = arith.addi %arg5, %__rlasp_stack_elide_zero_476 : i64
            %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
            %2043 = arith.addi %1994, %__rlasp_stack_elide_zero_477 : i64
            %2044 = arith.constant 1 : i1
            %2046 = arith.constant 3 : i64
            %2045 = arith.andi %2042, %2046 : i64
            %2047 = arith.constant 0 : i64
            %2048 = arith.cmpi eq, %2045, %2047 : i64
            %2050 = arith.constant 3 : i64
            %2049 = arith.andi %2043, %2050 : i64
            %2051 = arith.constant 0 : i64
            %2052 = arith.cmpi eq, %2049, %2051 : i64
            %2053 = arith.andi %2048, %2052 : i1
            %2054 = scf.if %2053 -> (i1) {
              %2055 = arith.constant 2 : i64
              %2056 = arith.shrsi %2042, %2055 : i64
              %2057 = arith.constant 2 : i64
              %2058 = arith.shrsi %2043, %2057 : i64
              %2059 = arith.cmpi slt, %2056, %2058 : i64
              scf.yield %2059 : i1
            } else {
              %2060 = func.call @cc_lt(%2042, %2043) : (i64, i64) -> i64
              %2061 = func.call @cc_nil_value() : () -> i64
              %2062 = arith.cmpi ne, %2060, %2061 : i64
              scf.yield %2062 : i1
            }
            %2063 = arith.andi %2044, %2054 : i1
            %2064 = func.call @cc_nil_value() : () -> i64
            %2065 = func.call @cc_t_value() : () -> i64
            %2066 = scf.if %2063 -> (i64) {
              scf.yield %2065 : i64
            } else {
              scf.yield %2064 : i64
            }
            %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
            %2067 = arith.addi %2066, %__rlasp_stack_elide_zero_478 : i64
            %2068 = func.call @cc_cons(%2067, %2036) : (i64, i64) -> i64
            %2069 = func.call @cc_cons(%2041, %2068) : (i64, i64) -> i64
            %2070 = func.call @cc_and(%2069) : (i64) -> i64
            %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
            %2071 = arith.addi %2070, %__rlasp_stack_elide_zero_479 : i64
            %2072 = func.call @cc_nil_value() : () -> i64
            %2073 = arith.cmpi ne, %2071, %2072 : i64
            %2074 = func.call @cc_nil_value() : () -> i64
            %2075 = llvm.mlir.addressof @str176 : !llvm.ptr
            %2076 = arith.constant 38 : i64
            %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
            %2078 = func.call @cc_nil_value() : () -> i64
            %2079 = func.call @cc_intern(%2077, %2078) : (i64, i64) -> i64
            %2080 = func.call @cc_nil_value() : () -> i64
            %2081 = func.call @cc_cons(%2079, %2080) : (i64, i64) -> i64
            %2082 = func.call @cc_values_pack(%2081) : (i64) -> i64
            %2083 = func.call @cc_symbol_value(%2079) : (i64) -> i64
            %2084 = arith.cmpi ne, %2083, %2074 : i64
            %2085 = llvm.mlir.addressof @str177 : !llvm.ptr
            %2086 = arith.constant 38 : i64
            %2087 = func.call @cc_make_string(%2085, %2086) : (!llvm.ptr, i64) -> i64
            %2088 = func.call @cc_nil_value() : () -> i64
            %2089 = func.call @cc_intern(%2087, %2088) : (i64, i64) -> i64
            %2090 = func.call @cc_nil_value() : () -> i64
            %2091 = func.call @cc_cons(%2089, %2090) : (i64, i64) -> i64
            %2092 = func.call @cc_values_pack(%2091) : (i64) -> i64
            %2093 = func.call @cc_symbol_value(%2089) : (i64) -> i64
            %2094 = arith.cmpi ne, %2093, %2074 : i64
            %2095 = arith.ori %2084, %2094 : i1
            %2096 = arith.constant 0 : i1
            %2097 = arith.cmpi eq, %2095, %2096 : i1
            %2098 = arith.andi %2073, %2097 : i1
            scf.condition(%2098) %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 : i64, i64, i64, i64, i64, i64
          } do {
            ^bb0(%2099: i64, %2100: i64, %2101: i64, %2102: i64, %2103: i64, %2104: i64):
            func.call @stack_push_pointer(%2099) : (i64) -> ()
            %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
            %2105 = arith.addi %1987, %__rlasp_stack_elide_zero_480 : i64
            %2106 = func.call @cc_nil_value() : () -> i64
            %2107 = func.call @cc_cons(%2106, %2106) : (i64, i64) -> i64
            %2108 = func.call @cc_cons(%2106, %2107) : (i64, i64) -> i64
            %2109 = func.call @cc_cons(%2105, %2108) : (i64, i64) -> i64
            %2110 = func.call @cc_values_pack(%2109) : (i64) -> i64
            %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
            %2111 = arith.addi %2110, %__rlasp_stack_elide_zero_481 : i64
            %2112 = func.call @cc_multiple_value_list(%2111) : (i64) -> i64
            %2113 = arith.constant 0 : i64
            %2114 = func.call @cc_box_fixnum(%2113) : (i64) -> i64
            %2115 = func.call @cc_nth(%2114, %2112) : (i64, i64) -> i64
            %2116 = arith.constant 1 : i64
            %2117 = func.call @cc_box_fixnum(%2116) : (i64) -> i64
            %2118 = func.call @cc_nth(%2117, %2112) : (i64, i64) -> i64
            %2119 = arith.constant 2 : i64
            %2120 = func.call @cc_box_fixnum(%2119) : (i64) -> i64
            %2121 = func.call @cc_nth(%2120, %2112) : (i64, i64) -> i64
            %2122 = func.call @cc_nil_value() : () -> i64
            %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
            %2123 = arith.addi %2118, %__rlasp_stack_elide_zero_482 : i64
            %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
            %2124 = arith.addi %2121, %__rlasp_stack_elide_zero_483 : i64
            %2125 = func.call @cc_cons(%2124, %2122) : (i64, i64) -> i64
            %2126 = func.call @cc_cons(%2123, %2125) : (i64, i64) -> i64
            %2127 = func.call @cc_or(%2126) : (i64) -> i64
            %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
            %2128 = arith.addi %2127, %__rlasp_stack_elide_zero_484 : i64
            %2129 = func.call @cc_nil_value() : () -> i64
            %2130 = arith.cmpi ne, %2128, %2129 : i64
            %2131:5 = scf.if %2130 -> (i64, i64, i64, i64, i64) {
              %2132 = func.call @cc_nil_value() : () -> i64
              %2133 = func.call @cc_nil_value() : () -> i64
              %2134 = func.call @cc_errorp(%2132) : (i64) -> i64
              %2135 = arith.cmpi ne, %2134, %2133 : i64
              %2136:5 = scf.if %2135 -> (i64, i64, i64, i64, i64) {
                scf.yield %2132, %2103, %2101, %2100, %2102 : i64, i64, i64, i64, i64
              } else {
                func.call @cc_clear_multiple_values() : () -> ()
                %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
                %2137 = arith.addi %2118, %__rlasp_stack_elide_zero_485 : i64
                %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
                %2138 = arith.addi %2121, %__rlasp_stack_elide_zero_486 : i64
                func.call @stack_push_nil() : () -> ()
                %2139 = func.call @stack_pop_pointer() : () -> i64
                %2140 = func.call @cc_cons(%2138, %2139) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
                %2141 = arith.addi %2140, %__rlasp_stack_elide_zero_487 : i64
                %2142 = func.call @cc_cons(%2137, %2141) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
                %2143 = arith.addi %2142, %__rlasp_stack_elide_zero_488 : i64
                %2144 = func.call @cc_values_pack(%2143) : (i64) -> i64
                %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
                %2145 = arith.addi %2144, %__rlasp_stack_elide_zero_489 : i64
                %2146 = func.call @cc_errorp(%2145) : (i64) -> i64
                %2147 = func.call @cc_nil_value() : () -> i64
                %2148 = arith.cmpi ne, %2146, %2147 : i64
                scf.if %2148 {
                  func.call @stack_push_pointer(%2145) : (i64) -> ()
                } else {
                  %2149 = func.call @cc_multiple_value_list(%2145) : (i64) -> i64
                  func.call @stack_push_pointer(%2149) : (i64) -> ()
                }
                %2150 = func.call @stack_pop_pointer() : () -> i64
                %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
                %2151 = arith.addi %2150, %__rlasp_stack_elide_zero_490 : i64
                scf.yield %2151, %2103, %2101, %2150, %2102 : i64, i64, i64, i64, i64
              }
              %2152 = func.call @cc_nil_value() : () -> i64
              %2153 = func.call @cc_errorp(%2136#0) : (i64) -> i64
              %2154 = arith.cmpi ne, %2153, %2152 : i64
              %2155:5 = scf.if %2154 -> (i64, i64, i64, i64, i64) {
                scf.yield %2136#0, %2136#1, %2136#2, %2136#3, %2136#4 : i64, i64, i64, i64, i64
              } else {
                %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
                %2156 = arith.addi %2136#3, %__rlasp_stack_elide_zero_491 : i64
                %2157 = func.call @cc_car(%2156) : (i64) -> i64
                %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
                %2158 = arith.addi %2157, %__rlasp_stack_elide_zero_492 : i64
                %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
                %2159 = arith.addi %2158, %__rlasp_stack_elide_zero_493 : i64
                scf.yield %2159, %2136#1, %2158, %2136#3, %2136#4 : i64, i64, i64, i64, i64
              }
              %2160 = func.call @cc_nil_value() : () -> i64
              %2161 = func.call @cc_errorp(%2155#0) : (i64) -> i64
              %2162 = arith.cmpi ne, %2161, %2160 : i64
              %2163:5 = scf.if %2162 -> (i64, i64, i64, i64, i64) {
                scf.yield %2155#0, %2155#1, %2155#2, %2155#3, %2155#4 : i64, i64, i64, i64, i64
              } else {
                %2164 = func.call @cc_t_value() : () -> i64
                %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
                %2165 = arith.addi %2164, %__rlasp_stack_elide_zero_494 : i64
                scf.yield %2165, %2155#1, %2155#2, %2155#3, %2164 : i64, i64, i64, i64, i64
              }
              %2166 = func.call @cc_nil_value() : () -> i64
              %2167 = func.call @cc_errorp(%2163#0) : (i64) -> i64
              %2168 = arith.cmpi ne, %2167, %2166 : i64
              %2169:5 = scf.if %2168 -> (i64, i64, i64, i64, i64) {
                scf.yield %2163#0, %2163#1, %2163#2, %2163#3, %2163#4 : i64, i64, i64, i64, i64
              } else {
                %2170 = func.call @cc_t_value() : () -> i64
                %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
                %2171 = arith.addi %2170, %__rlasp_stack_elide_zero_495 : i64
                scf.yield %2171, %2170, %2163#2, %2163#3, %2163#4 : i64, i64, i64, i64, i64
              }
              %2172 = func.call @cc_nil_value() : () -> i64
              %2173 = func.call @cc_errorp(%2169#0) : (i64) -> i64
              %2174 = arith.cmpi ne, %2173, %2172 : i64
              %2175:5 = scf.if %2174 -> (i64, i64, i64, i64, i64) {
                scf.yield %2169#0, %2169#1, %2169#2, %2169#3, %2169#4 : i64, i64, i64, i64, i64
              } else {
                %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
                %2176 = arith.addi %2169#3, %__rlasp_stack_elide_zero_496 : i64
                %2177 = func.call @cc_values_pack(%2176) : (i64) -> i64
                %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
                %2178 = arith.addi %2177, %__rlasp_stack_elide_zero_497 : i64
                scf.yield %2178, %2169#1, %2169#2, %2169#3, %2169#4 : i64, i64, i64, i64, i64
              }
              %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
              %2179 = arith.addi %2175#0, %__rlasp_stack_elide_zero_498 : i64
              scf.yield %2179, %2175#1, %2175#4, %2175#2, %2175#3 : i64, i64, i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
              %2180 = arith.addi %2115, %__rlasp_stack_elide_zero_499 : i64
              %2181 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%2180, %2181) : (i64, i64) -> ()
              %2182 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2182, %2103, %2102, %2101, %2100 : i64, i64, i64, i64, i64
            }
            %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
            %2183 = arith.addi %2131#0, %__rlasp_stack_elide_zero_500 : i64
            %2184 = func.call @cc_nil_value() : () -> i64
            %2185 = func.call @cc_errorp(%2183) : (i64) -> i64
            %2186 = arith.cmpi ne, %2185, %2184 : i64
            %2187 = arith.cmpi eq, %2184, %2184 : i64
            %2188 = arith.andi %2186, %2187 : i1
            %2189 = scf.if %2188 -> (i64) {
              scf.yield %2183 : i64
            } else {
              scf.yield %2184 : i64
            }
            %2190 = arith.cmpi ne, %2189, %2184 : i64
            scf.if %2190 {
              func.call @stack_push_pointer(%2189) : (i64) -> ()
            } else {
              %2191 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%2191) : (i64) -> ()
              %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
              %2192 = arith.addi %2183, %__rlasp_stack_elide_zero_501 : i64
              %2193 = func.call @stack_pop_pointer() : () -> i64
              %2194 = func.call @cc_cons(%2192, %2193) : (i64, i64) -> i64
              func.call @stack_push_pointer(%2194) : (i64) -> ()
            }
            %2195 = func.call @stack_pop_pointer() : () -> i64
            %2196 = func.call @stack_pop_pointer() : () -> i64
            %2197 = func.call @cc_append(%2196, %2195) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
            %2198 = arith.addi %2197, %__rlasp_stack_elide_zero_502 : i64
            func.call @stack_push_pointer(%2198) : (i64) -> ()
            %2199 = func.call @stack_depth() : () -> i64
            %2200 = arith.constant 0 : i64
            %2201 = arith.cmpi sgt, %2199, %2200 : i64
            scf.if %2201 {
              %2202 = func.call @stack_pop_pointer() : () -> i64
            }
            %2203 = arith.constant 1 : i64
            %2204 = func.call @cc_box_fixnum(%2203) : (i64) -> i64
            %2206 = arith.constant 3 : i64
            %2205 = arith.andi %2104, %2206 : i64
            %2207 = arith.constant 0 : i64
            %2208 = arith.cmpi eq, %2205, %2207 : i64
            %2210 = arith.constant 3 : i64
            %2209 = arith.andi %2204, %2210 : i64
            %2211 = arith.constant 0 : i64
            %2212 = arith.cmpi eq, %2209, %2211 : i64
            %2213 = arith.andi %2208, %2212 : i1
            %2214 = scf.if %2213 -> (i64) {
              %2215 = arith.constant 2 : i64
              %2216 = arith.shrsi %2104, %2215 : i64
              %2217 = arith.constant 2 : i64
              %2218 = arith.shrsi %2204, %2217 : i64
              %2219 = arith.addi %2216, %2218 : i64
              %2220 = arith.constant -2305843009213693952 : i64
              %2221 = arith.constant 2305843009213693951 : i64
              %2222 = arith.cmpi sge, %2219, %2220 : i64
              %2223 = arith.cmpi sle, %2219, %2221 : i64
              %2224 = arith.andi %2222, %2223 : i1
              %2225 = scf.if %2224 -> (i64) {
                %2226 = arith.constant 2 : i64
                %2227 = arith.shli %2219, %2226 : i64
                scf.yield %2227 : i64
              } else {
                %2228 = func.call @cc_add(%2104, %2204) : (i64, i64) -> i64
                scf.yield %2228 : i64
              }
              scf.yield %2225 : i64
            } else {
              %2229 = func.call @cc_add(%2104, %2204) : (i64, i64) -> i64
              scf.yield %2229 : i64
            }
            %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
            %2230 = arith.addi %2214, %__rlasp_stack_elide_zero_503 : i64
            func.call @stack_push_pointer(%2230) : (i64) -> ()
            %2231 = func.call @stack_depth() : () -> i64
            %2232 = arith.constant 0 : i64
            %2233 = arith.cmpi sgt, %2231, %2232 : i64
            scf.if %2233 {
              %2234 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2198, %2100, %2101, %2102, %2103, %2230 : i64, i64, i64, i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %2235 = func.call @stack_pop_pointer() : () -> i64
          %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
          %2236 = arith.addi %2035#3, %__rlasp_stack_elide_zero_504 : i64
          %2237 = func.call @cc_nil_value() : () -> i64
          %2238 = arith.cmpi ne, %2236, %2237 : i64
          scf.if %2238 {
            %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
            %2239 = arith.addi %2035#1, %__rlasp_stack_elide_zero_505 : i64
            %2240 = func.call @cc_values_pack(%2239) : (i64) -> i64
            func.call @stack_push_pointer(%2240) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2035#0) : (i64) -> ()
          }
          %2241 = func.call @stack_pop_pointer() : () -> i64
          %2242 = func.call @cc_multiple_value_list(%2241) : (i64) -> i64
          %2243 = llvm.mlir.addressof @str178 : !llvm.ptr
          %2244 = arith.constant 38 : i64
          %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
          %2246 = func.call @cc_nil_value() : () -> i64
          %2247 = func.call @cc_intern(%2245, %2246) : (i64, i64) -> i64
          %2248 = func.call @cc_nil_value() : () -> i64
          %2249 = func.call @cc_cons(%2247, %2248) : (i64, i64) -> i64
          %2250 = func.call @cc_values_pack(%2249) : (i64) -> i64
          %2251 = func.call @cc_symbol_value(%2247) : (i64) -> i64
          %2252 = llvm.mlir.addressof @str179 : !llvm.ptr
          %2253 = arith.constant 39 : i64
          %2254 = func.call @cc_make_string(%2252, %2253) : (!llvm.ptr, i64) -> i64
          %2255 = func.call @cc_nil_value() : () -> i64
          %2256 = func.call @cc_intern(%2254, %2255) : (i64, i64) -> i64
          %2257 = func.call @cc_nil_value() : () -> i64
          %2258 = func.call @cc_cons(%2256, %2257) : (i64, i64) -> i64
          %2259 = func.call @cc_values_pack(%2258) : (i64) -> i64
          %2260 = func.call @cc_symbol_value(%2256) : (i64) -> i64
          %2261 = llvm.mlir.addressof @str180 : !llvm.ptr
          %2262 = arith.constant 40 : i64
          %2263 = func.call @cc_make_string(%2261, %2262) : (!llvm.ptr, i64) -> i64
          %2264 = func.call @cc_nil_value() : () -> i64
          %2265 = func.call @cc_intern(%2263, %2264) : (i64, i64) -> i64
          %2266 = func.call @cc_nil_value() : () -> i64
          %2267 = func.call @cc_cons(%2265, %2266) : (i64, i64) -> i64
          %2268 = func.call @cc_values_pack(%2267) : (i64) -> i64
          %2269 = func.call @cc_symbol_value(%2265) : (i64) -> i64
          %2270 = func.call @cc_nil_value() : () -> i64
          %2271 = arith.cmpi ne, %2251, %2270 : i64
          %2272 = scf.if %2271 -> (i64) {
            scf.yield %2269 : i64
          } else {
            scf.yield %2242 : i64
          }
          %2273 = func.call @cc_values_pack(%2272) : (i64) -> i64
          %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
          %2274 = arith.addi %2273, %__rlasp_stack_elide_zero_506 : i64
          scf.yield %2274 : i64
        }
        %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
        %2275 = arith.addi %2006, %__rlasp_stack_elide_zero_507 : i64
        scf.yield %2275 : i64
      }
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %2276 = arith.addi %1992, %__rlasp_stack_elide_zero_508 : i64
      scf.yield %2276 : i64
    }
    func.call @stack_push_pointer(%1927) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040606"() {
    %2818 = func.call @stack_pop_pointer() : () -> i64
    %2819 = func.call @stack_pop_pointer() : () -> i64
    %2820 = func.call @cc_nil_value() : () -> i64
    %2821 = func.call @cc_nil_value() : () -> i64
    %2822 = func.call @cc_errorp(%2820) : (i64) -> i64
    %2823 = arith.cmpi ne, %2822, %2821 : i64
    %2824 = scf.if %2823 -> (i64) {
      scf.yield %2820 : i64
    } else {
      %2825 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %2826 = arith.addi %2825, %__rlasp_stack_elide_zero_509 : i64
      %2827 = func.call @cc_nil_value() : () -> i64
      %2828 = arith.cmpi ne, %2826, %2827 : i64
      scf.if %2828 {
        %2829 = func.call @cc_symbol_value(%2819) : (i64) -> i64
        func.call @stack_push_pointer(%2829) : (i64) -> ()
      } else {
        %2830 = func.call @cc_symbol_value(%2818) : (i64) -> i64
        func.call @stack_push_pointer(%2830) : (i64) -> ()
      }
      %2831 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2831 : i64
    }
    func.call @stack_push_pointer(%2824) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040605"() {
    %2811 = func.call @stack_pop_pointer() : () -> i64
    %2812 = func.call @stack_pop_pointer() : () -> i64
    %2813 = func.call @cc_nil_value() : () -> i64
    %2814 = func.call @cc_nil_value() : () -> i64
    %2815 = func.call @cc_errorp(%2813) : (i64) -> i64
    %2816 = arith.cmpi ne, %2815, %2814 : i64
    %2817 = scf.if %2816 -> (i64) {
      scf.yield %2813 : i64
    } else {
      %2832 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2833 = arith.constant 30 : i64
      %2834 = func.call @cc_make_symbol(%2832, %2833) : (!llvm.ptr, i64) -> i64
      %2835 = func.call @cc_persistent_root_value(%2834) : (i64) -> i64
      %2836 = func.call @cc_set_symbol_value(%2835, %2812) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2837 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2838 = arith.constant 30 : i64
      %2839 = func.call @cc_make_symbol(%2837, %2838) : (!llvm.ptr, i64) -> i64
      %2840 = func.call @cc_persistent_root_value(%2839) : (i64) -> i64
      %2841 = func.call @cc_set_symbol_value(%2840, %2811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2840) : (i64) -> ()
      %2842 = arith.constant 275462358040606 : i64
      %2843 = arith.constant 2 : i64
      %2844 = func.call @cc_make_closure(%2842, %2843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %2845 = arith.addi %2844, %__rlasp_stack_elide_zero_510 : i64
      scf.yield %2845 : i64
    }
    func.call @stack_push_pointer(%2817) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040604"() {
    %2801 = func.call @stack_pop_pointer() : () -> i64
    %2802 = func.call @stack_pop_pointer() : () -> i64
    %2803 = func.call @stack_pop_pointer() : () -> i64
    %2804 = func.call @cc_nil_value() : () -> i64
    %2805 = func.call @cc_nil_value() : () -> i64
    %2806 = func.call @cc_errorp(%2804) : (i64) -> i64
    %2807 = arith.cmpi ne, %2806, %2805 : i64
    %2808 = scf.if %2807 -> (i64) {
      scf.yield %2804 : i64
    } else {
      %2809 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2809) : (i64) -> ()
      %2810 = arith.constant 19 : i64
      func.call @stack_push_fixnum(%2810) : (i64) -> ()
      %2846 = arith.constant 275462358040605 : i64
      %2847 = arith.constant 0 : i64
      %2848 = func.call @cc_make_closure(%2846, %2847) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %2849 = arith.addi %2848, %__rlasp_stack_elide_zero_511 : i64
      %2850 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%2849, %2850) : (i64, i64) -> ()
      %2851 = func.call @stack_pop_pointer() : () -> i64
      %2852 = func.call @cc_nil_value() : () -> i64
      %2853 = func.call @cc_nil_value() : () -> i64
      %2854 = func.call @cc_errorp(%2852) : (i64) -> i64
      %2855 = arith.cmpi ne, %2854, %2853 : i64
      %2856 = scf.if %2855 -> (i64) {
        scf.yield %2852 : i64
      } else {
        %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
        %2857 = arith.addi %2851, %__rlasp_stack_elide_zero_512 : i64
        %2858 = func.call @cc_nil_value() : () -> i64
        %2859 = func.call @cc_cons(%2858, %2858) : (i64, i64) -> i64
        %2860 = func.call @cc_cons(%2858, %2859) : (i64, i64) -> i64
        %2861 = func.call @cc_cons(%2857, %2860) : (i64, i64) -> i64
        %2862 = func.call @cc_values_pack(%2861) : (i64) -> i64
        %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
        %2863 = arith.addi %2862, %__rlasp_stack_elide_zero_513 : i64
        %2864 = func.call @cc_multiple_value_list(%2863) : (i64) -> i64
        %2865 = arith.constant 0 : i64
        %2866 = func.call @cc_box_fixnum(%2865) : (i64) -> i64
        %2867 = func.call @cc_nth(%2866, %2864) : (i64, i64) -> i64
        %2868 = arith.constant 1 : i64
        %2869 = func.call @cc_box_fixnum(%2868) : (i64) -> i64
        %2870 = func.call @cc_nth(%2869, %2864) : (i64, i64) -> i64
        %2871 = arith.constant 2 : i64
        %2872 = func.call @cc_box_fixnum(%2871) : (i64) -> i64
        %2873 = func.call @cc_nth(%2872, %2864) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
        %2874 = arith.addi %2867, %__rlasp_stack_elide_zero_514 : i64
        %2875 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%2874, %2875) : (i64, i64) -> ()
        %2876 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
        %2877 = arith.addi %2870, %__rlasp_stack_elide_zero_515 : i64
        %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
        %2878 = arith.addi %2873, %__rlasp_stack_elide_zero_516 : i64
        func.call @stack_push_nil() : () -> ()
        %2879 = func.call @stack_pop_pointer() : () -> i64
        %2880 = func.call @cc_cons(%2878, %2879) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
        %2881 = arith.addi %2880, %__rlasp_stack_elide_zero_517 : i64
        %2882 = func.call @cc_cons(%2877, %2881) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
        %2883 = arith.addi %2882, %__rlasp_stack_elide_zero_518 : i64
        %2884 = func.call @cc_cons(%2876, %2883) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
        %2885 = arith.addi %2884, %__rlasp_stack_elide_zero_519 : i64
        %2886 = func.call @cc_values_pack(%2885) : (i64) -> i64
        %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
        %2887 = arith.addi %2886, %__rlasp_stack_elide_zero_520 : i64
        scf.yield %2887 : i64
      }
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %2888 = arith.addi %2856, %__rlasp_stack_elide_zero_521 : i64
      scf.yield %2888 : i64
    }
    func.call @stack_push_pointer(%2808) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040613"() {
    %3235 = func.call @cc_nil_value() : () -> i64
    %3236 = func.call @cc_nil_value() : () -> i64
    %3237 = func.call @cc_errorp(%3235) : (i64) -> i64
    %3238 = arith.cmpi ne, %3237, %3236 : i64
    %3239 = scf.if %3238 -> (i64) {
      scf.yield %3235 : i64
    } else {
      %3240 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3241 = arith.constant 45 : i64
      %3242 = func.call @cc_make_symbol(%3240, %3241) : (!llvm.ptr, i64) -> i64
      %3243 = func.call @cc_persistent_root_value(%3242) : (i64) -> i64
      %3244 = func.call @cc_symbol_value(%3243) : (i64) -> i64
      %3245 = func.call @cc_errorp(%3244) : (i64) -> i64
      %3246 = func.call @cc_nil_value() : () -> i64
      %3247 = arith.cmpi ne, %3245, %3246 : i64
      %3248 = scf.if %3247 -> (i64) {
        %3249 = arith.constant 189 : i64
        %3250 = func.call @cc_box_fixnum(%3249) : (i64) -> i64
        %3251 = arith.constant 911 : i64
        %3252 = func.call @cc_box_fixnum(%3251) : (i64) -> i64
        %3254 = arith.constant 3 : i64
        %3253 = arith.andi %3250, %3254 : i64
        %3255 = arith.constant 0 : i64
        %3256 = arith.cmpi eq, %3253, %3255 : i64
        %3258 = arith.constant 3 : i64
        %3257 = arith.andi %3252, %3258 : i64
        %3259 = arith.constant 0 : i64
        %3260 = arith.cmpi eq, %3257, %3259 : i64
        %3261 = arith.andi %3256, %3260 : i1
        %3262 = scf.if %3261 -> (i64) {
          %3263 = arith.constant 2 : i64
          %3264 = arith.shrsi %3250, %3263 : i64
          %3265 = arith.constant 2 : i64
          %3266 = arith.shrsi %3252, %3265 : i64
          %3267 = arith.addi %3264, %3266 : i64
          %3268 = arith.constant -2305843009213693952 : i64
          %3269 = arith.constant 2305843009213693951 : i64
          %3270 = arith.cmpi sge, %3267, %3268 : i64
          %3271 = arith.cmpi sle, %3267, %3269 : i64
          %3272 = arith.andi %3270, %3271 : i1
          %3273 = scf.if %3272 -> (i64) {
            %3274 = arith.constant 2 : i64
            %3275 = arith.shli %3267, %3274 : i64
            scf.yield %3275 : i64
          } else {
            %3276 = func.call @cc_add(%3250, %3252) : (i64, i64) -> i64
            scf.yield %3276 : i64
          }
          scf.yield %3273 : i64
        } else {
          %3277 = func.call @cc_add(%3250, %3252) : (i64, i64) -> i64
          scf.yield %3277 : i64
        }
        %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
        %3278 = arith.addi %3262, %__rlasp_stack_elide_zero_522 : i64
        %3279 = func.call @cc_persistent_root_value(%3278) : (i64) -> i64
        %3280 = func.call @cc_set_symbol_value(%3243, %3279) : (i64, i64) -> i64
        scf.yield %3279 : i64
      } else {
        scf.yield %3244 : i64
      }
      %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
      %3281 = arith.addi %3248, %__rlasp_stack_elide_zero_523 : i64
      scf.yield %3281 : i64
    }
    func.call @stack_push_pointer(%3239) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040612"() {
    %3227 = func.call @stack_pop_pointer() : () -> i64
    %3228 = func.call @stack_pop_pointer() : () -> i64
    %3229 = func.call @stack_pop_pointer() : () -> i64
    %3230 = func.call @cc_nil_value() : () -> i64
    %3231 = func.call @cc_nil_value() : () -> i64
    %3232 = func.call @cc_errorp(%3230) : (i64) -> i64
    %3233 = arith.cmpi ne, %3232, %3231 : i64
    %3234 = scf.if %3233 -> (i64) {
      scf.yield %3230 : i64
    } else {
      %3282 = arith.constant 275462358040613 : i64
      %3283 = arith.constant 0 : i64
      %3284 = func.call @cc_make_closure(%3282, %3283) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
      %3285 = arith.addi %3284, %__rlasp_stack_elide_zero_524 : i64
      %3286 = func.call @cc_nil_value() : () -> i64
      %3287 = func.call @cc_cons(%3286, %3286) : (i64, i64) -> i64
      %3288 = func.call @cc_cons(%3286, %3287) : (i64, i64) -> i64
      %3289 = func.call @cc_cons(%3285, %3288) : (i64, i64) -> i64
      %3290 = func.call @cc_values_pack(%3289) : (i64) -> i64
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %3291 = arith.addi %3290, %__rlasp_stack_elide_zero_525 : i64
      %3292 = func.call @cc_multiple_value_list(%3291) : (i64) -> i64
      %3293 = arith.constant 0 : i64
      %3294 = func.call @cc_box_fixnum(%3293) : (i64) -> i64
      %3295 = func.call @cc_nth(%3294, %3292) : (i64, i64) -> i64
      %3296 = arith.constant 1 : i64
      %3297 = func.call @cc_box_fixnum(%3296) : (i64) -> i64
      %3298 = func.call @cc_nth(%3297, %3292) : (i64, i64) -> i64
      %3299 = arith.constant 2 : i64
      %3300 = func.call @cc_box_fixnum(%3299) : (i64) -> i64
      %3301 = func.call @cc_nth(%3300, %3292) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
      %3302 = arith.addi %3295, %__rlasp_stack_elide_zero_526 : i64
      %3303 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%3302, %3303) : (i64, i64) -> ()
      %3304 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
      %3305 = arith.addi %3298, %__rlasp_stack_elide_zero_527 : i64
      %__rlasp_stack_elide_zero_528 = arith.constant 0 : i64
      %3306 = arith.addi %3301, %__rlasp_stack_elide_zero_528 : i64
      func.call @stack_push_nil() : () -> ()
      %3307 = func.call @stack_pop_pointer() : () -> i64
      %3308 = func.call @cc_cons(%3306, %3307) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_529 = arith.constant 0 : i64
      %3309 = arith.addi %3308, %__rlasp_stack_elide_zero_529 : i64
      %3310 = func.call @cc_cons(%3305, %3309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_530 = arith.constant 0 : i64
      %3311 = arith.addi %3310, %__rlasp_stack_elide_zero_530 : i64
      %3312 = func.call @cc_cons(%3304, %3311) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_531 = arith.constant 0 : i64
      %3313 = arith.addi %3312, %__rlasp_stack_elide_zero_531 : i64
      %3314 = func.call @cc_values_pack(%3313) : (i64) -> i64
      %__rlasp_stack_elide_zero_532 = arith.constant 0 : i64
      %3315 = arith.addi %3314, %__rlasp_stack_elide_zero_532 : i64
      scf.yield %3315 : i64
    }
    func.call @stack_push_pointer(%3234) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040618"() {
    %3673 = func.call @cc_nil_value() : () -> i64
    %3674 = func.call @cc_nil_value() : () -> i64
    %3675 = func.call @cc_errorp(%3673) : (i64) -> i64
    %3676 = arith.cmpi ne, %3675, %3674 : i64
    %3677 = scf.if %3676 -> (i64) {
      scf.yield %3673 : i64
    } else {
      %3678 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3679 = arith.constant 45 : i64
      %3680 = func.call @cc_make_symbol(%3678, %3679) : (!llvm.ptr, i64) -> i64
      %3681 = func.call @cc_persistent_root_value(%3680) : (i64) -> i64
      %3682 = func.call @cc_symbol_value(%3681) : (i64) -> i64
      %3683 = func.call @cc_errorp(%3682) : (i64) -> i64
      %3684 = func.call @cc_nil_value() : () -> i64
      %3685 = arith.cmpi ne, %3683, %3684 : i64
      %3686 = scf.if %3685 -> (i64) {
        %3687 = arith.constant 189 : i64
        %3688 = func.call @cc_box_fixnum(%3687) : (i64) -> i64
        %3689 = arith.constant 911 : i64
        %3690 = func.call @cc_box_fixnum(%3689) : (i64) -> i64
        %3692 = arith.constant 3 : i64
        %3691 = arith.andi %3688, %3692 : i64
        %3693 = arith.constant 0 : i64
        %3694 = arith.cmpi eq, %3691, %3693 : i64
        %3696 = arith.constant 3 : i64
        %3695 = arith.andi %3690, %3696 : i64
        %3697 = arith.constant 0 : i64
        %3698 = arith.cmpi eq, %3695, %3697 : i64
        %3699 = arith.andi %3694, %3698 : i1
        %3700 = scf.if %3699 -> (i64) {
          %3701 = arith.constant 2 : i64
          %3702 = arith.shrsi %3688, %3701 : i64
          %3703 = arith.constant 2 : i64
          %3704 = arith.shrsi %3690, %3703 : i64
          %3705 = arith.addi %3702, %3704 : i64
          %3706 = arith.constant -2305843009213693952 : i64
          %3707 = arith.constant 2305843009213693951 : i64
          %3708 = arith.cmpi sge, %3705, %3706 : i64
          %3709 = arith.cmpi sle, %3705, %3707 : i64
          %3710 = arith.andi %3708, %3709 : i1
          %3711 = scf.if %3710 -> (i64) {
            %3712 = arith.constant 2 : i64
            %3713 = arith.shli %3705, %3712 : i64
            scf.yield %3713 : i64
          } else {
            %3714 = func.call @cc_add(%3688, %3690) : (i64, i64) -> i64
            scf.yield %3714 : i64
          }
          scf.yield %3711 : i64
        } else {
          %3715 = func.call @cc_add(%3688, %3690) : (i64, i64) -> i64
          scf.yield %3715 : i64
        }
        %__rlasp_stack_elide_zero_533 = arith.constant 0 : i64
        %3716 = arith.addi %3700, %__rlasp_stack_elide_zero_533 : i64
        %3717 = func.call @cc_persistent_root_value(%3716) : (i64) -> i64
        %3718 = func.call @cc_set_symbol_value(%3681, %3717) : (i64, i64) -> i64
        scf.yield %3717 : i64
      } else {
        scf.yield %3682 : i64
      }
      %__rlasp_stack_elide_zero_534 = arith.constant 0 : i64
      %3719 = arith.addi %3686, %__rlasp_stack_elide_zero_534 : i64
      scf.yield %3719 : i64
    }
    func.call @stack_push_pointer(%3677) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040617"() {
    %3665 = func.call @stack_pop_pointer() : () -> i64
    %3666 = func.call @stack_pop_pointer() : () -> i64
    %3667 = func.call @stack_pop_pointer() : () -> i64
    %3668 = func.call @cc_nil_value() : () -> i64
    %3669 = func.call @cc_nil_value() : () -> i64
    %3670 = func.call @cc_errorp(%3668) : (i64) -> i64
    %3671 = arith.cmpi ne, %3670, %3669 : i64
    %3672 = scf.if %3671 -> (i64) {
      scf.yield %3668 : i64
    } else {
      %3720 = arith.constant 275462358040618 : i64
      %3721 = arith.constant 0 : i64
      %3722 = func.call @cc_make_closure(%3720, %3721) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_535 = arith.constant 0 : i64
      %3723 = arith.addi %3722, %__rlasp_stack_elide_zero_535 : i64
      %3724 = func.call @cc_nil_value() : () -> i64
      %3725 = func.call @cc_cons(%3724, %3724) : (i64, i64) -> i64
      %3726 = func.call @cc_cons(%3724, %3725) : (i64, i64) -> i64
      %3727 = func.call @cc_cons(%3723, %3726) : (i64, i64) -> i64
      %3728 = func.call @cc_values_pack(%3727) : (i64) -> i64
      %__rlasp_stack_elide_zero_536 = arith.constant 0 : i64
      %3729 = arith.addi %3728, %__rlasp_stack_elide_zero_536 : i64
      %3730 = func.call @cc_multiple_value_list(%3729) : (i64) -> i64
      %3731 = arith.constant 0 : i64
      %3732 = func.call @cc_box_fixnum(%3731) : (i64) -> i64
      %3733 = func.call @cc_nth(%3732, %3730) : (i64, i64) -> i64
      %3734 = arith.constant 1 : i64
      %3735 = func.call @cc_box_fixnum(%3734) : (i64) -> i64
      %3736 = func.call @cc_nth(%3735, %3730) : (i64, i64) -> i64
      %3737 = arith.constant 2 : i64
      %3738 = func.call @cc_box_fixnum(%3737) : (i64) -> i64
      %3739 = func.call @cc_nth(%3738, %3730) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_537 = arith.constant 0 : i64
      %3740 = arith.addi %3733, %__rlasp_stack_elide_zero_537 : i64
      %3741 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%3740, %3741) : (i64, i64) -> ()
      %3742 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_538 = arith.constant 0 : i64
      %3743 = arith.addi %3736, %__rlasp_stack_elide_zero_538 : i64
      %__rlasp_stack_elide_zero_539 = arith.constant 0 : i64
      %3744 = arith.addi %3739, %__rlasp_stack_elide_zero_539 : i64
      func.call @stack_push_nil() : () -> ()
      %3745 = func.call @stack_pop_pointer() : () -> i64
      %3746 = func.call @cc_cons(%3744, %3745) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_540 = arith.constant 0 : i64
      %3747 = arith.addi %3746, %__rlasp_stack_elide_zero_540 : i64
      %3748 = func.call @cc_cons(%3743, %3747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_541 = arith.constant 0 : i64
      %3749 = arith.addi %3748, %__rlasp_stack_elide_zero_541 : i64
      %3750 = func.call @cc_cons(%3742, %3749) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_542 = arith.constant 0 : i64
      %3751 = arith.addi %3750, %__rlasp_stack_elide_zero_542 : i64
      %3752 = func.call @cc_values_pack(%3751) : (i64) -> i64
      %__rlasp_stack_elide_zero_543 = arith.constant 0 : i64
      %3753 = arith.addi %3752, %__rlasp_stack_elide_zero_543 : i64
      scf.yield %3753 : i64
    }
    func.call @stack_push_pointer(%3672) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040623"() {
    %4203 = func.call @cc_nil_value() : () -> i64
    %4204 = func.call @cc_nil_value() : () -> i64
    %4205 = func.call @cc_errorp(%4203) : (i64) -> i64
    %4206 = arith.cmpi ne, %4205, %4204 : i64
    %4207 = scf.if %4206 -> (i64) {
      scf.yield %4203 : i64
    } else {
      %4208 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4209 = arith.constant 45 : i64
      %4210 = func.call @cc_make_symbol(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_persistent_root_value(%4210) : (i64) -> i64
      %4212 = func.call @cc_symbol_value(%4211) : (i64) -> i64
      %4213 = func.call @cc_errorp(%4212) : (i64) -> i64
      %4214 = func.call @cc_nil_value() : () -> i64
      %4215 = arith.cmpi ne, %4213, %4214 : i64
      %4216 = scf.if %4215 -> (i64) {
        %4217 = func.call @cc_nil_value() : () -> i64
        %4218 = llvm.mlir.addressof @str338 : !llvm.ptr
        %4219 = arith.constant 10 : i64
        %4220 = func.call @cc_make_string(%4218, %4219) : (!llvm.ptr, i64) -> i64
        %4221 = func.call @cc_nil_value() : () -> i64
        %4222 = func.call @cc_intern(%4220, %4221) : (i64, i64) -> i64
        %4223 = func.call @cc_nil_value() : () -> i64
        %4224 = func.call @cc_cons(%4222, %4223) : (i64, i64) -> i64
        %4225 = func.call @cc_values_pack(%4224) : (i64) -> i64
        %__rlasp_stack_elide_zero_544 = arith.constant 0 : i64
        %4226 = arith.addi %4222, %__rlasp_stack_elide_zero_544 : i64
        %4227 = func.call @cc_make_instance(%4226, %4217) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_545 = arith.constant 0 : i64
        %4228 = arith.addi %4227, %__rlasp_stack_elide_zero_545 : i64
        %4229 = func.call @cc_persistent_root_value(%4228) : (i64) -> i64
        %4230 = func.call @cc_set_symbol_value(%4211, %4229) : (i64, i64) -> i64
        scf.yield %4229 : i64
      } else {
        scf.yield %4212 : i64
      }
      %__rlasp_stack_elide_zero_546 = arith.constant 0 : i64
      %4231 = arith.addi %4216, %__rlasp_stack_elide_zero_546 : i64
      scf.yield %4231 : i64
    }
    func.call @stack_push_pointer(%4207) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040622"() {
    %4195 = func.call @stack_pop_pointer() : () -> i64
    %4196 = func.call @stack_pop_pointer() : () -> i64
    %4197 = func.call @stack_pop_pointer() : () -> i64
    %4198 = func.call @cc_nil_value() : () -> i64
    %4199 = func.call @cc_nil_value() : () -> i64
    %4200 = func.call @cc_errorp(%4198) : (i64) -> i64
    %4201 = arith.cmpi ne, %4200, %4199 : i64
    %4202 = scf.if %4201 -> (i64) {
      scf.yield %4198 : i64
    } else {
      %4232 = arith.constant 275462358040623 : i64
      %4233 = arith.constant 0 : i64
      %4234 = func.call @cc_make_closure(%4232, %4233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_547 = arith.constant 0 : i64
      %4235 = arith.addi %4234, %__rlasp_stack_elide_zero_547 : i64
      %4236 = func.call @cc_nil_value() : () -> i64
      %4237 = func.call @cc_cons(%4236, %4236) : (i64, i64) -> i64
      %4238 = func.call @cc_cons(%4236, %4237) : (i64, i64) -> i64
      %4239 = func.call @cc_cons(%4235, %4238) : (i64, i64) -> i64
      %4240 = func.call @cc_values_pack(%4239) : (i64) -> i64
      %__rlasp_stack_elide_zero_548 = arith.constant 0 : i64
      %4241 = arith.addi %4240, %__rlasp_stack_elide_zero_548 : i64
      %4242 = func.call @cc_multiple_value_list(%4241) : (i64) -> i64
      %4243 = arith.constant 0 : i64
      %4244 = func.call @cc_box_fixnum(%4243) : (i64) -> i64
      %4245 = func.call @cc_nth(%4244, %4242) : (i64, i64) -> i64
      %4246 = arith.constant 1 : i64
      %4247 = func.call @cc_box_fixnum(%4246) : (i64) -> i64
      %4248 = func.call @cc_nth(%4247, %4242) : (i64, i64) -> i64
      %4249 = arith.constant 2 : i64
      %4250 = func.call @cc_box_fixnum(%4249) : (i64) -> i64
      %4251 = func.call @cc_nth(%4250, %4242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_549 = arith.constant 0 : i64
      %4252 = arith.addi %4245, %__rlasp_stack_elide_zero_549 : i64
      %4253 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%4252, %4253) : (i64, i64) -> ()
      %4254 = func.call @stack_pop_pointer() : () -> i64
      %4255 = func.call @cc_class_of(%4254) : (i64) -> i64
      %__rlasp_stack_elide_zero_550 = arith.constant 0 : i64
      %4256 = arith.addi %4255, %__rlasp_stack_elide_zero_550 : i64
      %4257 = func.call @cc_class_name(%4256) : (i64) -> i64
      %__rlasp_stack_elide_zero_551 = arith.constant 0 : i64
      %4258 = arith.addi %4257, %__rlasp_stack_elide_zero_551 : i64
      %__rlasp_stack_elide_zero_552 = arith.constant 0 : i64
      %4259 = arith.addi %4248, %__rlasp_stack_elide_zero_552 : i64
      %__rlasp_stack_elide_zero_553 = arith.constant 0 : i64
      %4260 = arith.addi %4251, %__rlasp_stack_elide_zero_553 : i64
      func.call @stack_push_nil() : () -> ()
      %4261 = func.call @stack_pop_pointer() : () -> i64
      %4262 = func.call @cc_cons(%4260, %4261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_554 = arith.constant 0 : i64
      %4263 = arith.addi %4262, %__rlasp_stack_elide_zero_554 : i64
      %4264 = func.call @cc_cons(%4259, %4263) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_555 = arith.constant 0 : i64
      %4265 = arith.addi %4264, %__rlasp_stack_elide_zero_555 : i64
      %4266 = func.call @cc_cons(%4258, %4265) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_556 = arith.constant 0 : i64
      %4267 = arith.addi %4266, %__rlasp_stack_elide_zero_556 : i64
      %4268 = func.call @cc_values_pack(%4267) : (i64) -> i64
      %__rlasp_stack_elide_zero_557 = arith.constant 0 : i64
      %4269 = arith.addi %4268, %__rlasp_stack_elide_zero_557 : i64
      scf.yield %4269 : i64
    }
    func.call @stack_push_pointer(%4202) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040628"() {
    %4682 = func.call @cc_nil_value() : () -> i64
    %4683 = func.call @cc_nil_value() : () -> i64
    %4684 = func.call @cc_errorp(%4682) : (i64) -> i64
    %4685 = arith.cmpi ne, %4684, %4683 : i64
    %4686 = scf.if %4685 -> (i64) {
      scf.yield %4682 : i64
    } else {
      %4687 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4688 = arith.constant 45 : i64
      %4689 = func.call @cc_make_symbol(%4687, %4688) : (!llvm.ptr, i64) -> i64
      %4690 = func.call @cc_persistent_root_value(%4689) : (i64) -> i64
      %4691 = func.call @cc_symbol_value(%4690) : (i64) -> i64
      %4692 = func.call @cc_errorp(%4691) : (i64) -> i64
      %4693 = func.call @cc_nil_value() : () -> i64
      %4694 = arith.cmpi ne, %4692, %4693 : i64
      %4695 = scf.if %4694 -> (i64) {
        %4696 = func.call @cc_nil_value() : () -> i64
        %4697 = llvm.mlir.addressof @str381 : !llvm.ptr
        %4698 = arith.constant 10 : i64
        %4699 = func.call @cc_make_string(%4697, %4698) : (!llvm.ptr, i64) -> i64
        %4700 = func.call @cc_nil_value() : () -> i64
        %4701 = func.call @cc_intern(%4699, %4700) : (i64, i64) -> i64
        %4702 = func.call @cc_nil_value() : () -> i64
        %4703 = func.call @cc_cons(%4701, %4702) : (i64, i64) -> i64
        %4704 = func.call @cc_values_pack(%4703) : (i64) -> i64
        %__rlasp_stack_elide_zero_558 = arith.constant 0 : i64
        %4705 = arith.addi %4701, %__rlasp_stack_elide_zero_558 : i64
        %4706 = func.call @cc_make_instance(%4705, %4696) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_559 = arith.constant 0 : i64
        %4707 = arith.addi %4706, %__rlasp_stack_elide_zero_559 : i64
        %4708 = func.call @cc_persistent_root_value(%4707) : (i64) -> i64
        %4709 = func.call @cc_set_symbol_value(%4690, %4708) : (i64, i64) -> i64
        scf.yield %4708 : i64
      } else {
        scf.yield %4691 : i64
      }
      %__rlasp_stack_elide_zero_560 = arith.constant 0 : i64
      %4710 = arith.addi %4695, %__rlasp_stack_elide_zero_560 : i64
      scf.yield %4710 : i64
    }
    func.call @stack_push_pointer(%4686) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040627"() {
    %4674 = func.call @stack_pop_pointer() : () -> i64
    %4675 = func.call @stack_pop_pointer() : () -> i64
    %4676 = func.call @stack_pop_pointer() : () -> i64
    %4677 = func.call @cc_nil_value() : () -> i64
    %4678 = func.call @cc_nil_value() : () -> i64
    %4679 = func.call @cc_errorp(%4677) : (i64) -> i64
    %4680 = arith.cmpi ne, %4679, %4678 : i64
    %4681 = scf.if %4680 -> (i64) {
      scf.yield %4677 : i64
    } else {
      %4711 = arith.constant 275462358040628 : i64
      %4712 = arith.constant 0 : i64
      %4713 = func.call @cc_make_closure(%4711, %4712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_561 = arith.constant 0 : i64
      %4714 = arith.addi %4713, %__rlasp_stack_elide_zero_561 : i64
      %4715 = func.call @cc_nil_value() : () -> i64
      %4716 = func.call @cc_cons(%4715, %4715) : (i64, i64) -> i64
      %4717 = func.call @cc_cons(%4715, %4716) : (i64, i64) -> i64
      %4718 = func.call @cc_cons(%4714, %4717) : (i64, i64) -> i64
      %4719 = func.call @cc_values_pack(%4718) : (i64) -> i64
      %__rlasp_stack_elide_zero_562 = arith.constant 0 : i64
      %4720 = arith.addi %4719, %__rlasp_stack_elide_zero_562 : i64
      %4721 = func.call @cc_multiple_value_list(%4720) : (i64) -> i64
      %4722 = arith.constant 0 : i64
      %4723 = func.call @cc_box_fixnum(%4722) : (i64) -> i64
      %4724 = func.call @cc_nth(%4723, %4721) : (i64, i64) -> i64
      %4725 = arith.constant 1 : i64
      %4726 = func.call @cc_box_fixnum(%4725) : (i64) -> i64
      %4727 = func.call @cc_nth(%4726, %4721) : (i64, i64) -> i64
      %4728 = arith.constant 2 : i64
      %4729 = func.call @cc_box_fixnum(%4728) : (i64) -> i64
      %4730 = func.call @cc_nth(%4729, %4721) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_563 = arith.constant 0 : i64
      %4731 = arith.addi %4724, %__rlasp_stack_elide_zero_563 : i64
      %4732 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%4731, %4732) : (i64, i64) -> ()
      %4733 = func.call @stack_pop_pointer() : () -> i64
      %4734 = func.call @cc_class_of(%4733) : (i64) -> i64
      %__rlasp_stack_elide_zero_564 = arith.constant 0 : i64
      %4735 = arith.addi %4734, %__rlasp_stack_elide_zero_564 : i64
      %4736 = func.call @cc_class_name(%4735) : (i64) -> i64
      %__rlasp_stack_elide_zero_565 = arith.constant 0 : i64
      %4737 = arith.addi %4736, %__rlasp_stack_elide_zero_565 : i64
      %__rlasp_stack_elide_zero_566 = arith.constant 0 : i64
      %4738 = arith.addi %4727, %__rlasp_stack_elide_zero_566 : i64
      %__rlasp_stack_elide_zero_567 = arith.constant 0 : i64
      %4739 = arith.addi %4730, %__rlasp_stack_elide_zero_567 : i64
      func.call @stack_push_nil() : () -> ()
      %4740 = func.call @stack_pop_pointer() : () -> i64
      %4741 = func.call @cc_cons(%4739, %4740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_568 = arith.constant 0 : i64
      %4742 = arith.addi %4741, %__rlasp_stack_elide_zero_568 : i64
      %4743 = func.call @cc_cons(%4738, %4742) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_569 = arith.constant 0 : i64
      %4744 = arith.addi %4743, %__rlasp_stack_elide_zero_569 : i64
      %4745 = func.call @cc_cons(%4737, %4744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_570 = arith.constant 0 : i64
      %4746 = arith.addi %4745, %__rlasp_stack_elide_zero_570 : i64
      %4747 = func.call @cc_values_pack(%4746) : (i64) -> i64
      %__rlasp_stack_elide_zero_571 = arith.constant 0 : i64
      %4748 = arith.addi %4747, %__rlasp_stack_elide_zero_571 : i64
      scf.yield %4748 : i64
    }
    func.call @stack_push_pointer(%4681) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040633"() {
    %5226 = func.call @cc_nil_value() : () -> i64
    %5227 = func.call @cc_nil_value() : () -> i64
    %5228 = func.call @cc_errorp(%5226) : (i64) -> i64
    %5229 = arith.cmpi ne, %5228, %5227 : i64
    %5230 = scf.if %5229 -> (i64) {
      scf.yield %5226 : i64
    } else {
      %5231 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5232 = arith.constant 45 : i64
      %5233 = func.call @cc_make_symbol(%5231, %5232) : (!llvm.ptr, i64) -> i64
      %5234 = func.call @cc_persistent_root_value(%5233) : (i64) -> i64
      %5235 = func.call @cc_symbol_value(%5234) : (i64) -> i64
      %5236 = func.call @cc_errorp(%5235) : (i64) -> i64
      %5237 = func.call @cc_nil_value() : () -> i64
      %5238 = arith.cmpi ne, %5236, %5237 : i64
      %5239 = scf.if %5238 -> (i64) {
        %5240 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5240) : (i64) -> ()
        %5241 = func.call @stack_pop_pointer() : () -> i64
        %5242 = func.call @cc_nil_value() : () -> i64
        %5243 = func.call @cc_errorp(%5241) : (i64) -> i64
        %5244 = arith.cmpi ne, %5243, %5242 : i64
        %5245 = arith.cmpi eq, %5242, %5242 : i64
        %5246 = arith.andi %5244, %5245 : i1
        %5247 = scf.if %5246 -> (i64) {
          scf.yield %5241 : i64
        } else {
          scf.yield %5242 : i64
        }
        %5248 = arith.cmpi ne, %5247, %5242 : i64
        scf.if %5248 {
          func.call @stack_push_pointer(%5247) : (i64) -> ()
        } else {
          %5249 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5249) : (i64) -> ()
          %__rlasp_stack_elide_zero_572 = arith.constant 0 : i64
          %5250 = arith.addi %5241, %__rlasp_stack_elide_zero_572 : i64
          %5251 = func.call @stack_pop_pointer() : () -> i64
          %5252 = func.call @cc_cons(%5250, %5251) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5252) : (i64) -> ()
        }
        %5253 = func.call @stack_pop_pointer() : () -> i64
        %5254 = func.call @cc_persistent_root_value(%5253) : (i64) -> i64
        %5255 = func.call @cc_set_symbol_value(%5234, %5254) : (i64, i64) -> i64
        scf.yield %5254 : i64
      } else {
        scf.yield %5235 : i64
      }
      %__rlasp_stack_elide_zero_573 = arith.constant 0 : i64
      %5256 = arith.addi %5239, %__rlasp_stack_elide_zero_573 : i64
      %5257 = func.call @cc_car(%5256) : (i64) -> i64
      %__rlasp_stack_elide_zero_574 = arith.constant 0 : i64
      %5258 = arith.addi %5257, %__rlasp_stack_elide_zero_574 : i64
      %5259 = arith.constant 1 : i64
      %5260 = func.call @cc_box_fixnum(%5259) : (i64) -> i64
      %__rlasp_stack_elide_zero_575 = arith.constant 0 : i64
      %5261 = arith.addi %5260, %__rlasp_stack_elide_zero_575 : i64
      %5263 = arith.constant 3 : i64
      %5262 = arith.andi %5258, %5263 : i64
      %5264 = arith.constant 0 : i64
      %5265 = arith.cmpi eq, %5262, %5264 : i64
      %5267 = arith.constant 3 : i64
      %5266 = arith.andi %5261, %5267 : i64
      %5268 = arith.constant 0 : i64
      %5269 = arith.cmpi eq, %5266, %5268 : i64
      %5270 = arith.andi %5265, %5269 : i1
      %5271 = scf.if %5270 -> (i64) {
        %5272 = arith.constant 2 : i64
        %5273 = arith.shrsi %5258, %5272 : i64
        %5274 = arith.constant 2 : i64
        %5275 = arith.shrsi %5261, %5274 : i64
        %5276 = arith.addi %5273, %5275 : i64
        %5277 = arith.constant -2305843009213693952 : i64
        %5278 = arith.constant 2305843009213693951 : i64
        %5279 = arith.cmpi sge, %5276, %5277 : i64
        %5280 = arith.cmpi sle, %5276, %5278 : i64
        %5281 = arith.andi %5279, %5280 : i1
        %5282 = scf.if %5281 -> (i64) {
          %5283 = arith.constant 2 : i64
          %5284 = arith.shli %5276, %5283 : i64
          scf.yield %5284 : i64
        } else {
          %5285 = func.call @cc_add(%5258, %5261) : (i64, i64) -> i64
          scf.yield %5285 : i64
        }
        scf.yield %5282 : i64
      } else {
        %5286 = func.call @cc_add(%5258, %5261) : (i64, i64) -> i64
        scf.yield %5286 : i64
      }
      %5287 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5288 = arith.constant 45 : i64
      %5289 = func.call @cc_make_symbol(%5287, %5288) : (!llvm.ptr, i64) -> i64
      %5290 = func.call @cc_persistent_root_value(%5289) : (i64) -> i64
      %5291 = func.call @cc_symbol_value(%5290) : (i64) -> i64
      %5292 = func.call @cc_errorp(%5291) : (i64) -> i64
      %5293 = func.call @cc_nil_value() : () -> i64
      %5294 = arith.cmpi ne, %5292, %5293 : i64
      %5295 = scf.if %5294 -> (i64) {
        %5296 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5296) : (i64) -> ()
        %5297 = func.call @stack_pop_pointer() : () -> i64
        %5298 = func.call @cc_nil_value() : () -> i64
        %5299 = func.call @cc_errorp(%5297) : (i64) -> i64
        %5300 = arith.cmpi ne, %5299, %5298 : i64
        %5301 = arith.cmpi eq, %5298, %5298 : i64
        %5302 = arith.andi %5300, %5301 : i1
        %5303 = scf.if %5302 -> (i64) {
          scf.yield %5297 : i64
        } else {
          scf.yield %5298 : i64
        }
        %5304 = arith.cmpi ne, %5303, %5298 : i64
        scf.if %5304 {
          func.call @stack_push_pointer(%5303) : (i64) -> ()
        } else {
          %5305 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5305) : (i64) -> ()
          %__rlasp_stack_elide_zero_576 = arith.constant 0 : i64
          %5306 = arith.addi %5297, %__rlasp_stack_elide_zero_576 : i64
          %5307 = func.call @stack_pop_pointer() : () -> i64
          %5308 = func.call @cc_cons(%5306, %5307) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5308) : (i64) -> ()
        }
        %5309 = func.call @stack_pop_pointer() : () -> i64
        %5310 = func.call @cc_persistent_root_value(%5309) : (i64) -> i64
        %5311 = func.call @cc_set_symbol_value(%5290, %5310) : (i64, i64) -> i64
        scf.yield %5310 : i64
      } else {
        scf.yield %5291 : i64
      }
      %__rlasp_stack_elide_zero_577 = arith.constant 0 : i64
      %5312 = arith.addi %5295, %__rlasp_stack_elide_zero_577 : i64
      %5313 = func.call @cc_set_car(%5312, %5271) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_578 = arith.constant 0 : i64
      %5314 = arith.addi %5313, %__rlasp_stack_elide_zero_578 : i64
      scf.yield %5314 : i64
    }
    func.call @stack_push_pointer(%5230) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040632"() {
    %5218 = func.call @stack_pop_pointer() : () -> i64
    %5219 = func.call @stack_pop_pointer() : () -> i64
    %5220 = func.call @stack_pop_pointer() : () -> i64
    %5221 = func.call @cc_nil_value() : () -> i64
    %5222 = func.call @cc_nil_value() : () -> i64
    %5223 = func.call @cc_errorp(%5221) : (i64) -> i64
    %5224 = arith.cmpi ne, %5223, %5222 : i64
    %5225 = scf.if %5224 -> (i64) {
      scf.yield %5221 : i64
    } else {
      %5315 = arith.constant 275462358040633 : i64
      %5316 = arith.constant 0 : i64
      %5317 = func.call @cc_make_closure(%5315, %5316) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_579 = arith.constant 0 : i64
      %5318 = arith.addi %5317, %__rlasp_stack_elide_zero_579 : i64
      %5319 = func.call @cc_nil_value() : () -> i64
      %5320 = func.call @cc_nil_value() : () -> i64
      %5321 = func.call @cc_errorp(%5319) : (i64) -> i64
      %5322 = arith.cmpi ne, %5321, %5320 : i64
      %5323 = scf.if %5322 -> (i64) {
        scf.yield %5319 : i64
      } else {
        %__rlasp_stack_elide_zero_580 = arith.constant 0 : i64
        %5324 = arith.addi %5318, %__rlasp_stack_elide_zero_580 : i64
        %5325 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5324, %5325) : (i64, i64) -> ()
        %5326 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5326 : i64
      }
      %5327 = func.call @cc_nil_value() : () -> i64
      %5328 = func.call @cc_errorp(%5323) : (i64) -> i64
      %5329 = arith.cmpi ne, %5328, %5327 : i64
      %5330 = scf.if %5329 -> (i64) {
        scf.yield %5323 : i64
      } else {
        %__rlasp_stack_elide_zero_581 = arith.constant 0 : i64
        %5331 = arith.addi %5318, %__rlasp_stack_elide_zero_581 : i64
        %5332 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5331, %5332) : (i64, i64) -> ()
        %5333 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5333 : i64
      }
      %5334 = func.call @cc_nil_value() : () -> i64
      %5335 = func.call @cc_errorp(%5330) : (i64) -> i64
      %5336 = arith.cmpi ne, %5335, %5334 : i64
      %5337 = scf.if %5336 -> (i64) {
        scf.yield %5330 : i64
      } else {
        %__rlasp_stack_elide_zero_582 = arith.constant 0 : i64
        %5338 = arith.addi %5318, %__rlasp_stack_elide_zero_582 : i64
        %5339 = func.call @cc_nil_value() : () -> i64
        %5340 = func.call @cc_cons(%5339, %5339) : (i64, i64) -> i64
        %5341 = func.call @cc_cons(%5339, %5340) : (i64, i64) -> i64
        %5342 = func.call @cc_cons(%5338, %5341) : (i64, i64) -> i64
        %5343 = func.call @cc_values_pack(%5342) : (i64) -> i64
        %__rlasp_stack_elide_zero_583 = arith.constant 0 : i64
        %5344 = arith.addi %5343, %__rlasp_stack_elide_zero_583 : i64
        %5345 = func.call @cc_multiple_value_list(%5344) : (i64) -> i64
        %5346 = arith.constant 0 : i64
        %5347 = func.call @cc_box_fixnum(%5346) : (i64) -> i64
        %5348 = func.call @cc_nth(%5347, %5345) : (i64, i64) -> i64
        %5349 = arith.constant 1 : i64
        %5350 = func.call @cc_box_fixnum(%5349) : (i64) -> i64
        %5351 = func.call @cc_nth(%5350, %5345) : (i64, i64) -> i64
        %5352 = arith.constant 2 : i64
        %5353 = func.call @cc_box_fixnum(%5352) : (i64) -> i64
        %5354 = func.call @cc_nth(%5353, %5345) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_584 = arith.constant 0 : i64
        %5355 = arith.addi %5348, %__rlasp_stack_elide_zero_584 : i64
        %5356 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5355, %5356) : (i64, i64) -> ()
        %5357 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_585 = arith.constant 0 : i64
        %5358 = arith.addi %5351, %__rlasp_stack_elide_zero_585 : i64
        %__rlasp_stack_elide_zero_586 = arith.constant 0 : i64
        %5359 = arith.addi %5354, %__rlasp_stack_elide_zero_586 : i64
        func.call @stack_push_nil() : () -> ()
        %5360 = func.call @stack_pop_pointer() : () -> i64
        %5361 = func.call @cc_cons(%5359, %5360) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_587 = arith.constant 0 : i64
        %5362 = arith.addi %5361, %__rlasp_stack_elide_zero_587 : i64
        %5363 = func.call @cc_cons(%5358, %5362) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_588 = arith.constant 0 : i64
        %5364 = arith.addi %5363, %__rlasp_stack_elide_zero_588 : i64
        %5365 = func.call @cc_cons(%5357, %5364) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_589 = arith.constant 0 : i64
        %5366 = arith.addi %5365, %__rlasp_stack_elide_zero_589 : i64
        %5367 = func.call @cc_values_pack(%5366) : (i64) -> i64
        %__rlasp_stack_elide_zero_590 = arith.constant 0 : i64
        %5368 = arith.addi %5367, %__rlasp_stack_elide_zero_590 : i64
        scf.yield %5368 : i64
      }
      %__rlasp_stack_elide_zero_591 = arith.constant 0 : i64
      %5369 = arith.addi %5337, %__rlasp_stack_elide_zero_591 : i64
      scf.yield %5369 : i64
    }
    func.call @stack_push_pointer(%5225) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040638"() {
    %5761 = func.call @cc_nil_value() : () -> i64
    %5762 = func.call @cc_nil_value() : () -> i64
    %5763 = func.call @cc_errorp(%5761) : (i64) -> i64
    %5764 = arith.cmpi ne, %5763, %5762 : i64
    %5765 = scf.if %5764 -> (i64) {
      scf.yield %5761 : i64
    } else {
      %5766 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5767 = arith.constant 45 : i64
      %5768 = func.call @cc_make_symbol(%5766, %5767) : (!llvm.ptr, i64) -> i64
      %5769 = func.call @cc_persistent_root_value(%5768) : (i64) -> i64
      %5770 = func.call @cc_symbol_value(%5769) : (i64) -> i64
      %5771 = func.call @cc_errorp(%5770) : (i64) -> i64
      %5772 = func.call @cc_nil_value() : () -> i64
      %5773 = arith.cmpi ne, %5771, %5772 : i64
      %5774 = scf.if %5773 -> (i64) {
        %5775 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5775) : (i64) -> ()
        %5776 = func.call @stack_pop_pointer() : () -> i64
        %5777 = func.call @cc_nil_value() : () -> i64
        %5778 = func.call @cc_errorp(%5776) : (i64) -> i64
        %5779 = arith.cmpi ne, %5778, %5777 : i64
        %5780 = arith.cmpi eq, %5777, %5777 : i64
        %5781 = arith.andi %5779, %5780 : i1
        %5782 = scf.if %5781 -> (i64) {
          scf.yield %5776 : i64
        } else {
          scf.yield %5777 : i64
        }
        %5783 = arith.cmpi ne, %5782, %5777 : i64
        scf.if %5783 {
          func.call @stack_push_pointer(%5782) : (i64) -> ()
        } else {
          %5784 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5784) : (i64) -> ()
          %__rlasp_stack_elide_zero_592 = arith.constant 0 : i64
          %5785 = arith.addi %5776, %__rlasp_stack_elide_zero_592 : i64
          %5786 = func.call @stack_pop_pointer() : () -> i64
          %5787 = func.call @cc_cons(%5785, %5786) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5787) : (i64) -> ()
        }
        %5788 = func.call @stack_pop_pointer() : () -> i64
        %5789 = func.call @cc_persistent_root_value(%5788) : (i64) -> i64
        %5790 = func.call @cc_set_symbol_value(%5769, %5789) : (i64, i64) -> i64
        scf.yield %5789 : i64
      } else {
        scf.yield %5770 : i64
      }
      %__rlasp_stack_elide_zero_593 = arith.constant 0 : i64
      %5791 = arith.addi %5774, %__rlasp_stack_elide_zero_593 : i64
      %5792 = func.call @cc_car(%5791) : (i64) -> i64
      %__rlasp_stack_elide_zero_594 = arith.constant 0 : i64
      %5793 = arith.addi %5792, %__rlasp_stack_elide_zero_594 : i64
      %5794 = arith.constant 1 : i64
      %5795 = func.call @cc_box_fixnum(%5794) : (i64) -> i64
      %__rlasp_stack_elide_zero_595 = arith.constant 0 : i64
      %5796 = arith.addi %5795, %__rlasp_stack_elide_zero_595 : i64
      %5798 = arith.constant 3 : i64
      %5797 = arith.andi %5793, %5798 : i64
      %5799 = arith.constant 0 : i64
      %5800 = arith.cmpi eq, %5797, %5799 : i64
      %5802 = arith.constant 3 : i64
      %5801 = arith.andi %5796, %5802 : i64
      %5803 = arith.constant 0 : i64
      %5804 = arith.cmpi eq, %5801, %5803 : i64
      %5805 = arith.andi %5800, %5804 : i1
      %5806 = scf.if %5805 -> (i64) {
        %5807 = arith.constant 2 : i64
        %5808 = arith.shrsi %5793, %5807 : i64
        %5809 = arith.constant 2 : i64
        %5810 = arith.shrsi %5796, %5809 : i64
        %5811 = arith.addi %5808, %5810 : i64
        %5812 = arith.constant -2305843009213693952 : i64
        %5813 = arith.constant 2305843009213693951 : i64
        %5814 = arith.cmpi sge, %5811, %5812 : i64
        %5815 = arith.cmpi sle, %5811, %5813 : i64
        %5816 = arith.andi %5814, %5815 : i1
        %5817 = scf.if %5816 -> (i64) {
          %5818 = arith.constant 2 : i64
          %5819 = arith.shli %5811, %5818 : i64
          scf.yield %5819 : i64
        } else {
          %5820 = func.call @cc_add(%5793, %5796) : (i64, i64) -> i64
          scf.yield %5820 : i64
        }
        scf.yield %5817 : i64
      } else {
        %5821 = func.call @cc_add(%5793, %5796) : (i64, i64) -> i64
        scf.yield %5821 : i64
      }
      %5822 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5823 = arith.constant 45 : i64
      %5824 = func.call @cc_make_symbol(%5822, %5823) : (!llvm.ptr, i64) -> i64
      %5825 = func.call @cc_persistent_root_value(%5824) : (i64) -> i64
      %5826 = func.call @cc_symbol_value(%5825) : (i64) -> i64
      %5827 = func.call @cc_errorp(%5826) : (i64) -> i64
      %5828 = func.call @cc_nil_value() : () -> i64
      %5829 = arith.cmpi ne, %5827, %5828 : i64
      %5830 = scf.if %5829 -> (i64) {
        %5831 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5831) : (i64) -> ()
        %5832 = func.call @stack_pop_pointer() : () -> i64
        %5833 = func.call @cc_nil_value() : () -> i64
        %5834 = func.call @cc_errorp(%5832) : (i64) -> i64
        %5835 = arith.cmpi ne, %5834, %5833 : i64
        %5836 = arith.cmpi eq, %5833, %5833 : i64
        %5837 = arith.andi %5835, %5836 : i1
        %5838 = scf.if %5837 -> (i64) {
          scf.yield %5832 : i64
        } else {
          scf.yield %5833 : i64
        }
        %5839 = arith.cmpi ne, %5838, %5833 : i64
        scf.if %5839 {
          func.call @stack_push_pointer(%5838) : (i64) -> ()
        } else {
          %5840 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5840) : (i64) -> ()
          %__rlasp_stack_elide_zero_596 = arith.constant 0 : i64
          %5841 = arith.addi %5832, %__rlasp_stack_elide_zero_596 : i64
          %5842 = func.call @stack_pop_pointer() : () -> i64
          %5843 = func.call @cc_cons(%5841, %5842) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5843) : (i64) -> ()
        }
        %5844 = func.call @stack_pop_pointer() : () -> i64
        %5845 = func.call @cc_persistent_root_value(%5844) : (i64) -> i64
        %5846 = func.call @cc_set_symbol_value(%5825, %5845) : (i64, i64) -> i64
        scf.yield %5845 : i64
      } else {
        scf.yield %5826 : i64
      }
      %__rlasp_stack_elide_zero_597 = arith.constant 0 : i64
      %5847 = arith.addi %5830, %__rlasp_stack_elide_zero_597 : i64
      %5848 = func.call @cc_set_car(%5847, %5806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_598 = arith.constant 0 : i64
      %5849 = arith.addi %5848, %__rlasp_stack_elide_zero_598 : i64
      scf.yield %5849 : i64
    }
    func.call @stack_push_pointer(%5765) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040637"() {
    %5756 = func.call @cc_nil_value() : () -> i64
    %5757 = func.call @cc_nil_value() : () -> i64
    %5758 = func.call @cc_errorp(%5756) : (i64) -> i64
    %5759 = arith.cmpi ne, %5758, %5757 : i64
    %5760 = scf.if %5759 -> (i64) {
      scf.yield %5756 : i64
    } else {
      %5850 = arith.constant 275462358040638 : i64
      %5851 = arith.constant 0 : i64
      %5852 = func.call @cc_make_closure(%5850, %5851) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_599 = arith.constant 0 : i64
      %5853 = arith.addi %5852, %__rlasp_stack_elide_zero_599 : i64
      %__rlasp_stack_elide_zero_600 = arith.constant 0 : i64
      %5854 = arith.addi %5853, %__rlasp_stack_elide_zero_600 : i64
      %5855 = func.call @cc_nil_value() : () -> i64
      %5856 = func.call @cc_cons(%5855, %5855) : (i64, i64) -> i64
      %5857 = func.call @cc_cons(%5855, %5856) : (i64, i64) -> i64
      %5858 = func.call @cc_cons(%5854, %5857) : (i64, i64) -> i64
      %5859 = func.call @cc_values_pack(%5858) : (i64) -> i64
      %__rlasp_stack_elide_zero_601 = arith.constant 0 : i64
      %5860 = arith.addi %5859, %__rlasp_stack_elide_zero_601 : i64
      %5861 = func.call @cc_nil_value() : () -> i64
      %5862 = func.call @cc_nil_value() : () -> i64
      %5863 = func.call @cc_errorp(%5861) : (i64) -> i64
      %5864 = arith.cmpi ne, %5863, %5862 : i64
      %5865 = scf.if %5864 -> (i64) {
        scf.yield %5861 : i64
      } else {
        %__rlasp_stack_elide_zero_602 = arith.constant 0 : i64
        %5866 = arith.addi %5860, %__rlasp_stack_elide_zero_602 : i64
        %5867 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5866, %5867) : (i64, i64) -> ()
        %5868 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5868 : i64
      }
      %5869 = func.call @cc_nil_value() : () -> i64
      %5870 = func.call @cc_errorp(%5865) : (i64) -> i64
      %5871 = arith.cmpi ne, %5870, %5869 : i64
      %5872 = scf.if %5871 -> (i64) {
        scf.yield %5865 : i64
      } else {
        %__rlasp_stack_elide_zero_603 = arith.constant 0 : i64
        %5873 = arith.addi %5860, %__rlasp_stack_elide_zero_603 : i64
        %5874 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5873, %5874) : (i64, i64) -> ()
        %5875 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5875 : i64
      }
      %5876 = func.call @cc_nil_value() : () -> i64
      %5877 = func.call @cc_errorp(%5872) : (i64) -> i64
      %5878 = arith.cmpi ne, %5877, %5876 : i64
      %5879 = scf.if %5878 -> (i64) {
        scf.yield %5872 : i64
      } else {
        %__rlasp_stack_elide_zero_604 = arith.constant 0 : i64
        %5880 = arith.addi %5860, %__rlasp_stack_elide_zero_604 : i64
        %5881 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5880, %5881) : (i64, i64) -> ()
        %5882 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5882 : i64
      }
      %__rlasp_stack_elide_zero_605 = arith.constant 0 : i64
      %5883 = arith.addi %5879, %__rlasp_stack_elide_zero_605 : i64
      scf.yield %5883 : i64
    }
    func.call @stack_push_pointer(%5760) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040640"() {
    %6336 = func.call @cc_nil_value() : () -> i64
    %6337 = func.call @cc_nil_value() : () -> i64
    %6338 = func.call @cc_errorp(%6336) : (i64) -> i64
    %6339 = arith.cmpi ne, %6338, %6337 : i64
    %6340 = scf.if %6339 -> (i64) {
      scf.yield %6336 : i64
    } else {
      %6341 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6342 = arith.constant 45 : i64
      %6343 = func.call @cc_make_symbol(%6341, %6342) : (!llvm.ptr, i64) -> i64
      %6344 = func.call @cc_persistent_root_value(%6343) : (i64) -> i64
      %6345 = func.call @cc_symbol_value(%6344) : (i64) -> i64
      %6346 = func.call @cc_errorp(%6345) : (i64) -> i64
      %6347 = func.call @cc_nil_value() : () -> i64
      %6348 = arith.cmpi ne, %6346, %6347 : i64
      %6349 = scf.if %6348 -> (i64) {
        %6350 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%6350) : (i64) -> ()
        %6351 = func.call @stack_pop_pointer() : () -> i64
        %6352 = func.call @cc_nil_value() : () -> i64
        %6353 = func.call @cc_errorp(%6351) : (i64) -> i64
        %6354 = arith.cmpi ne, %6353, %6352 : i64
        %6355 = arith.cmpi eq, %6352, %6352 : i64
        %6356 = arith.andi %6354, %6355 : i1
        %6357 = scf.if %6356 -> (i64) {
          scf.yield %6351 : i64
        } else {
          scf.yield %6352 : i64
        }
        %6358 = arith.cmpi ne, %6357, %6352 : i64
        scf.if %6358 {
          func.call @stack_push_pointer(%6357) : (i64) -> ()
        } else {
          %6359 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%6359) : (i64) -> ()
          %__rlasp_stack_elide_zero_606 = arith.constant 0 : i64
          %6360 = arith.addi %6351, %__rlasp_stack_elide_zero_606 : i64
          %6361 = func.call @stack_pop_pointer() : () -> i64
          %6362 = func.call @cc_cons(%6360, %6361) : (i64, i64) -> i64
          func.call @stack_push_pointer(%6362) : (i64) -> ()
        }
        %6363 = func.call @stack_pop_pointer() : () -> i64
        %6364 = func.call @cc_persistent_root_value(%6363) : (i64) -> i64
        %6365 = func.call @cc_set_symbol_value(%6344, %6364) : (i64, i64) -> i64
        scf.yield %6364 : i64
      } else {
        scf.yield %6345 : i64
      }
      %__rlasp_stack_elide_zero_607 = arith.constant 0 : i64
      %6366 = arith.addi %6349, %__rlasp_stack_elide_zero_607 : i64
      %6367 = func.call @cc_car(%6366) : (i64) -> i64
      %__rlasp_stack_elide_zero_608 = arith.constant 0 : i64
      %6368 = arith.addi %6367, %__rlasp_stack_elide_zero_608 : i64
      %6369 = arith.constant 1 : i64
      %6370 = func.call @cc_box_fixnum(%6369) : (i64) -> i64
      %__rlasp_stack_elide_zero_609 = arith.constant 0 : i64
      %6371 = arith.addi %6370, %__rlasp_stack_elide_zero_609 : i64
      %6373 = arith.constant 3 : i64
      %6372 = arith.andi %6368, %6373 : i64
      %6374 = arith.constant 0 : i64
      %6375 = arith.cmpi eq, %6372, %6374 : i64
      %6377 = arith.constant 3 : i64
      %6376 = arith.andi %6371, %6377 : i64
      %6378 = arith.constant 0 : i64
      %6379 = arith.cmpi eq, %6376, %6378 : i64
      %6380 = arith.andi %6375, %6379 : i1
      %6381 = scf.if %6380 -> (i64) {
        %6382 = arith.constant 2 : i64
        %6383 = arith.shrsi %6368, %6382 : i64
        %6384 = arith.constant 2 : i64
        %6385 = arith.shrsi %6371, %6384 : i64
        %6386 = arith.addi %6383, %6385 : i64
        %6387 = arith.constant -2305843009213693952 : i64
        %6388 = arith.constant 2305843009213693951 : i64
        %6389 = arith.cmpi sge, %6386, %6387 : i64
        %6390 = arith.cmpi sle, %6386, %6388 : i64
        %6391 = arith.andi %6389, %6390 : i1
        %6392 = scf.if %6391 -> (i64) {
          %6393 = arith.constant 2 : i64
          %6394 = arith.shli %6386, %6393 : i64
          scf.yield %6394 : i64
        } else {
          %6395 = func.call @cc_add(%6368, %6371) : (i64, i64) -> i64
          scf.yield %6395 : i64
        }
        scf.yield %6392 : i64
      } else {
        %6396 = func.call @cc_add(%6368, %6371) : (i64, i64) -> i64
        scf.yield %6396 : i64
      }
      %6397 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6398 = arith.constant 45 : i64
      %6399 = func.call @cc_make_symbol(%6397, %6398) : (!llvm.ptr, i64) -> i64
      %6400 = func.call @cc_persistent_root_value(%6399) : (i64) -> i64
      %6401 = func.call @cc_symbol_value(%6400) : (i64) -> i64
      %6402 = func.call @cc_errorp(%6401) : (i64) -> i64
      %6403 = func.call @cc_nil_value() : () -> i64
      %6404 = arith.cmpi ne, %6402, %6403 : i64
      %6405 = scf.if %6404 -> (i64) {
        %6406 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%6406) : (i64) -> ()
        %6407 = func.call @stack_pop_pointer() : () -> i64
        %6408 = func.call @cc_nil_value() : () -> i64
        %6409 = func.call @cc_errorp(%6407) : (i64) -> i64
        %6410 = arith.cmpi ne, %6409, %6408 : i64
        %6411 = arith.cmpi eq, %6408, %6408 : i64
        %6412 = arith.andi %6410, %6411 : i1
        %6413 = scf.if %6412 -> (i64) {
          scf.yield %6407 : i64
        } else {
          scf.yield %6408 : i64
        }
        %6414 = arith.cmpi ne, %6413, %6408 : i64
        scf.if %6414 {
          func.call @stack_push_pointer(%6413) : (i64) -> ()
        } else {
          %6415 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%6415) : (i64) -> ()
          %__rlasp_stack_elide_zero_610 = arith.constant 0 : i64
          %6416 = arith.addi %6407, %__rlasp_stack_elide_zero_610 : i64
          %6417 = func.call @stack_pop_pointer() : () -> i64
          %6418 = func.call @cc_cons(%6416, %6417) : (i64, i64) -> i64
          func.call @stack_push_pointer(%6418) : (i64) -> ()
        }
        %6419 = func.call @stack_pop_pointer() : () -> i64
        %6420 = func.call @cc_persistent_root_value(%6419) : (i64) -> i64
        %6421 = func.call @cc_set_symbol_value(%6400, %6420) : (i64, i64) -> i64
        scf.yield %6420 : i64
      } else {
        scf.yield %6401 : i64
      }
      %__rlasp_stack_elide_zero_611 = arith.constant 0 : i64
      %6422 = arith.addi %6405, %__rlasp_stack_elide_zero_611 : i64
      %6423 = func.call @cc_set_car(%6422, %6381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_612 = arith.constant 0 : i64
      %6424 = arith.addi %6423, %__rlasp_stack_elide_zero_612 : i64
      scf.yield %6424 : i64
    }
    func.call @stack_push_pointer(%6340) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040639"() {
    %6328 = func.call @stack_pop_pointer() : () -> i64
    %6329 = func.call @stack_pop_pointer() : () -> i64
    %6330 = func.call @stack_pop_pointer() : () -> i64
    %6331 = func.call @cc_nil_value() : () -> i64
    %6332 = func.call @cc_nil_value() : () -> i64
    %6333 = func.call @cc_errorp(%6331) : (i64) -> i64
    %6334 = arith.cmpi ne, %6333, %6332 : i64
    %6335 = scf.if %6334 -> (i64) {
      scf.yield %6331 : i64
    } else {
      %6425 = arith.constant 275462358040640 : i64
      %6426 = arith.constant 0 : i64
      %6427 = func.call @cc_make_closure(%6425, %6426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_613 = arith.constant 0 : i64
      %6428 = arith.addi %6427, %__rlasp_stack_elide_zero_613 : i64
      %6429 = func.call @cc_nil_value() : () -> i64
      %6430 = func.call @cc_nil_value() : () -> i64
      %6431 = func.call @cc_errorp(%6429) : (i64) -> i64
      %6432 = arith.cmpi ne, %6431, %6430 : i64
      %6433 = scf.if %6432 -> (i64) {
        scf.yield %6429 : i64
      } else {
        %__rlasp_stack_elide_zero_614 = arith.constant 0 : i64
        %6434 = arith.addi %6428, %__rlasp_stack_elide_zero_614 : i64
        %6435 = func.call @cc_nil_value() : () -> i64
        %6436 = func.call @cc_cons(%6435, %6435) : (i64, i64) -> i64
        %6437 = func.call @cc_cons(%6435, %6436) : (i64, i64) -> i64
        %6438 = func.call @cc_cons(%6434, %6437) : (i64, i64) -> i64
        %6439 = func.call @cc_values_pack(%6438) : (i64) -> i64
        %__rlasp_stack_elide_zero_615 = arith.constant 0 : i64
        %6440 = arith.addi %6439, %__rlasp_stack_elide_zero_615 : i64
        %6441 = func.call @cc_multiple_value_list(%6440) : (i64) -> i64
        %6442 = arith.constant 0 : i64
        %6443 = func.call @cc_box_fixnum(%6442) : (i64) -> i64
        %6444 = func.call @cc_nth(%6443, %6441) : (i64, i64) -> i64
        %6445 = arith.constant 1 : i64
        %6446 = func.call @cc_box_fixnum(%6445) : (i64) -> i64
        %6447 = func.call @cc_nth(%6446, %6441) : (i64, i64) -> i64
        %6448 = arith.constant 2 : i64
        %6449 = func.call @cc_box_fixnum(%6448) : (i64) -> i64
        %6450 = func.call @cc_nth(%6449, %6441) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_616 = arith.constant 0 : i64
        %6451 = arith.addi %6444, %__rlasp_stack_elide_zero_616 : i64
        %6452 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6451, %6452) : (i64, i64) -> ()
        %6453 = func.call @stack_depth() : () -> i64
        %6454 = arith.constant 0 : i64
        %6455 = arith.cmpi sgt, %6453, %6454 : i64
        scf.if %6455 {
          %6456 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_617 = arith.constant 0 : i64
        %6457 = arith.addi %6444, %__rlasp_stack_elide_zero_617 : i64
        %6458 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6457, %6458) : (i64, i64) -> ()
        %6459 = func.call @stack_depth() : () -> i64
        %6460 = arith.constant 0 : i64
        %6461 = arith.cmpi sgt, %6459, %6460 : i64
        scf.if %6461 {
          %6462 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_618 = arith.constant 0 : i64
        %6463 = arith.addi %6428, %__rlasp_stack_elide_zero_618 : i64
        %6464 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6463, %6464) : (i64, i64) -> ()
        %6465 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_619 = arith.constant 0 : i64
        %6466 = arith.addi %6447, %__rlasp_stack_elide_zero_619 : i64
        %__rlasp_stack_elide_zero_620 = arith.constant 0 : i64
        %6467 = arith.addi %6450, %__rlasp_stack_elide_zero_620 : i64
        func.call @stack_push_nil() : () -> ()
        %6468 = func.call @stack_pop_pointer() : () -> i64
        %6469 = func.call @cc_cons(%6467, %6468) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_621 = arith.constant 0 : i64
        %6470 = arith.addi %6469, %__rlasp_stack_elide_zero_621 : i64
        %6471 = func.call @cc_cons(%6466, %6470) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_622 = arith.constant 0 : i64
        %6472 = arith.addi %6471, %__rlasp_stack_elide_zero_622 : i64
        %6473 = func.call @cc_cons(%6465, %6472) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_623 = arith.constant 0 : i64
        %6474 = arith.addi %6473, %__rlasp_stack_elide_zero_623 : i64
        %6475 = func.call @cc_values_pack(%6474) : (i64) -> i64
        %__rlasp_stack_elide_zero_624 = arith.constant 0 : i64
        %6476 = arith.addi %6475, %__rlasp_stack_elide_zero_624 : i64
        scf.yield %6476 : i64
      }
      %__rlasp_stack_elide_zero_625 = arith.constant 0 : i64
      %6477 = arith.addi %6433, %__rlasp_stack_elide_zero_625 : i64
      scf.yield %6477 : i64
    }
    func.call @stack_push_pointer(%6335) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040647"() {
    %7042 = func.call @stack_pop_pointer() : () -> i64
    %7043 = func.call @stack_pop_pointer() : () -> i64
    %7044 = func.call @cc_symbol_value(%7043) : (i64) -> i64
    func.call @stack_push_pointer(%7044) : (i64) -> ()
    %__rlasp_stack_elide_zero_626 = arith.constant 0 : i64
    %7045 = arith.addi %7042, %__rlasp_stack_elide_zero_626 : i64
    %7046 = func.call @stack_pop_pointer() : () -> i64
    %7047 = func.call @cc_eq(%7046, %7045) : (i64, i64) -> i64
    func.call @stack_push_pointer(%7047) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040645"() {
    %7028 = func.call @stack_pop_pointer() : () -> i64
    %7029 = func.call @stack_pop_pointer() : () -> i64
    %7030 = func.call @stack_pop_pointer() : () -> i64
    %7031 = func.call @cc_nil_value() : () -> i64
    %7032 = func.call @cc_nil_value() : () -> i64
    %7033 = func.call @cc_errorp(%7031) : (i64) -> i64
    %7034 = arith.cmpi ne, %7033, %7032 : i64
    %7035 = scf.if %7034 -> (i64) {
      scf.yield %7031 : i64
    } else {
      %7036 = func.call @cc_nil_value() : () -> i64
      %7037 = func.call @cc_nil_value() : () -> i64
      %7038 = func.call @cc_nil_value() : () -> i64
      %7039 = func.call @cc_errorp(%7037) : (i64) -> i64
      %7040 = arith.cmpi ne, %7039, %7038 : i64
      %7041 = scf.if %7040 -> (i64) {
        scf.yield %7037 : i64
      } else {
        func.call @stack_push_pointer(%7028) : (i64) -> ()
        %7048 = arith.constant 275462358040647 : i64
        %7049 = arith.constant 1 : i64
        %7050 = func.call @cc_make_closure(%7048, %7049) : (i64, i64) -> i64
        %7051 = llvm.mlir.addressof @str568 : !llvm.ptr
        %7052 = arith.constant 1 : i64
        %7053 = func.call @cc_bind_function_object_const(%7051, %7052, %7050) : (!llvm.ptr, i64, i64) -> i64
        %__rlasp_stack_elide_zero_627 = arith.constant 0 : i64
        %7054 = arith.addi %7050, %__rlasp_stack_elide_zero_627 : i64
        %7055 = func.call @cc_multiple_value_list(%7054) : (i64) -> i64
        %7056 = func.call @cc_symbol_value(%7028) : (i64) -> i64
        %7057 = func.call @cc_values_pack(%7055) : (i64) -> i64
        %__rlasp_stack_elide_zero_628 = arith.constant 0 : i64
        %7058 = arith.addi %7057, %__rlasp_stack_elide_zero_628 : i64
        scf.yield %7058 : i64
      }
      %__rlasp_stack_elide_zero_629 = arith.constant 0 : i64
      %7059 = arith.addi %7041, %__rlasp_stack_elide_zero_629 : i64
      %7060 = func.call @cc_nil_value() : () -> i64
      %7061 = func.call @cc_nil_value() : () -> i64
      %7062 = func.call @cc_errorp(%7060) : (i64) -> i64
      %7063 = arith.cmpi ne, %7062, %7061 : i64
      %7064 = scf.if %7063 -> (i64) {
        scf.yield %7060 : i64
      } else {
        %__rlasp_stack_elide_zero_630 = arith.constant 0 : i64
        %7065 = arith.addi %7059, %__rlasp_stack_elide_zero_630 : i64
        scf.yield %7065 : i64
      }
      %__rlasp_stack_elide_zero_631 = arith.constant 0 : i64
      %7066 = arith.addi %7064, %__rlasp_stack_elide_zero_631 : i64
      scf.yield %7066 : i64
    }
    func.call @stack_push_pointer(%7035) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040644"() {
    %7020 = func.call @stack_pop_pointer() : () -> i64
    %7021 = func.call @stack_pop_pointer() : () -> i64
    %7022 = func.call @stack_pop_pointer() : () -> i64
    %7023 = func.call @cc_nil_value() : () -> i64
    %7024 = func.call @cc_nil_value() : () -> i64
    %7025 = func.call @cc_errorp(%7023) : (i64) -> i64
    %7026 = arith.cmpi ne, %7025, %7024 : i64
    %7027 = scf.if %7026 -> (i64) {
      scf.yield %7023 : i64
    } else {
      %7067 = llvm.mlir.addressof @str569 : !llvm.ptr
      %7068 = arith.constant 30 : i64
      %7069 = func.call @cc_make_symbol(%7067, %7068) : (!llvm.ptr, i64) -> i64
      %7070 = func.call @cc_persistent_root_value(%7069) : (i64) -> i64
      func.call @stack_push_pointer(%7070) : (i64) -> ()
      %7071 = llvm.mlir.addressof @str570 : !llvm.ptr
      %7072 = arith.constant 31 : i64
      %7073 = func.call @cc_make_symbol(%7071, %7072) : (!llvm.ptr, i64) -> i64
      %7074 = func.call @cc_persistent_root_value(%7073) : (i64) -> i64
      func.call @stack_push_pointer(%7074) : (i64) -> ()
      %7075 = llvm.mlir.addressof @str571 : !llvm.ptr
      %7076 = arith.constant 30 : i64
      %7077 = func.call @cc_make_symbol(%7075, %7076) : (!llvm.ptr, i64) -> i64
      %7078 = func.call @cc_persistent_root_value(%7077) : (i64) -> i64
      func.call @stack_push_pointer(%7078) : (i64) -> ()
      %7079 = arith.constant 275462358040645 : i64
      %7080 = arith.constant 3 : i64
      %7081 = func.call @cc_make_closure(%7079, %7080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_632 = arith.constant 0 : i64
      %7082 = arith.addi %7081, %__rlasp_stack_elide_zero_632 : i64
      %7083 = func.call @cc_nil_value() : () -> i64
      %7084 = func.call @cc_nil_value() : () -> i64
      %7085 = func.call @cc_errorp(%7083) : (i64) -> i64
      %7086 = arith.cmpi ne, %7085, %7084 : i64
      %7087 = scf.if %7086 -> (i64) {
        scf.yield %7083 : i64
      } else {
        %__rlasp_stack_elide_zero_633 = arith.constant 0 : i64
        %7088 = arith.addi %7082, %__rlasp_stack_elide_zero_633 : i64
        %7089 = func.call @cc_nil_value() : () -> i64
        %7090 = func.call @cc_cons(%7089, %7089) : (i64, i64) -> i64
        %7091 = func.call @cc_cons(%7089, %7090) : (i64, i64) -> i64
        %7092 = func.call @cc_cons(%7088, %7091) : (i64, i64) -> i64
        %7093 = func.call @cc_values_pack(%7092) : (i64) -> i64
        %__rlasp_stack_elide_zero_634 = arith.constant 0 : i64
        %7094 = arith.addi %7093, %__rlasp_stack_elide_zero_634 : i64
        %7095 = func.call @cc_multiple_value_list(%7094) : (i64) -> i64
        %7096 = arith.constant 0 : i64
        %7097 = func.call @cc_box_fixnum(%7096) : (i64) -> i64
        %7098 = func.call @cc_nth(%7097, %7095) : (i64, i64) -> i64
        %7099 = arith.constant 1 : i64
        %7100 = func.call @cc_box_fixnum(%7099) : (i64) -> i64
        %7101 = func.call @cc_nth(%7100, %7095) : (i64, i64) -> i64
        %7102 = arith.constant 2 : i64
        %7103 = func.call @cc_box_fixnum(%7102) : (i64) -> i64
        %7104 = func.call @cc_nth(%7103, %7095) : (i64, i64) -> i64
        func.call @stack_push_nil() : () -> ()
        %7105 = func.call @stack_depth() : () -> i64
        %7106 = arith.constant 0 : i64
        %7107 = arith.cmpi sgt, %7105, %7106 : i64
        scf.if %7107 {
          %7108 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_635 = arith.constant 0 : i64
        %7109 = arith.addi %7101, %__rlasp_stack_elide_zero_635 : i64
        %__rlasp_stack_elide_zero_636 = arith.constant 0 : i64
        %7110 = arith.addi %7104, %__rlasp_stack_elide_zero_636 : i64
        func.call @stack_push_nil() : () -> ()
        %7111 = func.call @stack_pop_pointer() : () -> i64
        %7112 = func.call @cc_cons(%7110, %7111) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_637 = arith.constant 0 : i64
        %7113 = arith.addi %7112, %__rlasp_stack_elide_zero_637 : i64
        %7114 = func.call @cc_cons(%7109, %7113) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_638 = arith.constant 0 : i64
        %7115 = arith.addi %7114, %__rlasp_stack_elide_zero_638 : i64
        %7116 = func.call @cc_values_pack(%7115) : (i64) -> i64
        %__rlasp_stack_elide_zero_639 = arith.constant 0 : i64
        %7117 = arith.addi %7116, %__rlasp_stack_elide_zero_639 : i64
        scf.yield %7117 : i64
      }
      %__rlasp_stack_elide_zero_640 = arith.constant 0 : i64
      %7118 = arith.addi %7087, %__rlasp_stack_elide_zero_640 : i64
      scf.yield %7118 : i64
    }
    func.call @stack_push_pointer(%7027) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_275462358040576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_275462358040576*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_275462358040576*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("BTB.CLOSURE-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str8("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str12("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str15("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str18("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str22("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str23("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str24("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str27("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str32("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str35("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str36("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str37("#:%%DYN-CELL-275462358040580-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str38("#:%%DYN-CELL-275462358040581-CC\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str39("#:%%DYN-CELL-275462358040582-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str40("#:%%DYN-CELL-275462358040583-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str41("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str47("BTB.CLOSURE-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str48("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str49("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str58("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str61("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str66("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str69("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str72("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str73("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("CREAD\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("RWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str78("RFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str79("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("CWRITE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str86("WWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str87("WFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str88("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("CREAD\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str105("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("CWRITE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("RWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str113("RFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str114("WWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str115("WFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str116("#:%%DYN-CELL-275462358040587-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str117("#:%%DYN-CELL-275462358040589-CREAD\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str118("#:%%DYN-CELL-275462358040590-CWRITE\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str119("#:%%DYN-CELL-275462358040591-RFAILURE\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str120("#:%%DYN-CELL-275462358040592-RWARNINGS\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str121("#:%%DYN-CELL-275462358040593-WFAILURE\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str122("#:%%DYN-CELL-275462358040594-WWARNINGS\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str123("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str125("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str127("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str128("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str129("BTB.CLOSURE-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str130("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str131("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str132("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str136("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str139("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str140("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str145("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str146("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str147("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str148("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str149("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str153("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str154("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str155("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str158("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str159("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str160("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str162("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str163("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str167("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str168("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("#:%%DYN-CELL-275462358040598-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str172("#:%%DYN-CELL-275462358040599-Y\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETFLAG_275462358040600*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str174("*__MLIR_BLOCK_RETVALUE_275462358040600*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str175("*__MLIR_BLOCK_RETMVLIST_275462358040600*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str176("*__MLIR_BLOCK_RETFLAG_275462358040576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str177("*__MLIR_BLOCK_RETFLAG_275462358040600*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str178("*__MLIR_BLOCK_RETFLAG_275462358040600*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETVALUE_275462358040600*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETMVLIST_275462358040600*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str181("#:%%DYN-CELL-275462358040601-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str182("#:%%DYN-CELL-275462358040602-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str183("#:%%DYN-CELL-275462358040603-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str184("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str189("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str190("BTB.CLOSURE-4\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str191("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str192("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str193("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str194("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str197("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str200("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str201("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str202("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str203("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str204("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str207("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str208("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str210("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str211("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str212("WARNINGP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str213("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str214("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str217("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str222("WARNINGP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str223("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str224("#:%%DYN-CELL-275462358040607-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str225("#:%%DYN-CELL-275462358040608-Y\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str226("#:%%DYN-CELL-275462358040609-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str227("#:%%DYN-CELL-275462358040610-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str228("#:%%DYN-CELL-275462358040611-WARNINGP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str229("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str231("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str233("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str234("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str235("BTB.LTV-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str236("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str237("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str239("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str240("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str241("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str242("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str243("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str245("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str252("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str257("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str258("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str259("COMMON-LISP-USER::%RLASP-LTV-B594FC1B77DCDBCF\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str260("#:%%DYN-CELL-275462358040614-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str261("#:%%DYN-CELL-275462358040615-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str262("#:%%DYN-CELL-275462358040616-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str263("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str268("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str269("BTB.LTV-1-READONLY\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str270("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str273("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str274("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str275("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str276("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str277("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str279("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str282("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str286("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str287("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str292("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str293("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str294("COMMON-LISP-USER::%RLASP-LTV-8824618E96D583A8\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str295("#:%%DYN-CELL-275462358040619-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str296("#:%%DYN-CELL-275462358040620-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str297("#:%%DYN-CELL-275462358040621-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str298("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str299("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str300("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str301("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str302("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str303("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str304("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str305("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str306("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str307("BTB.LTV-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str308("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str309("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str311("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str312("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str313("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str317("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str318("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str322("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str324("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str325("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str326("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("CLASS-NAME\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("CLASS-OF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str335("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str336("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str337("COMMON-LISP-USER::%RLASP-LTV-E088A40DDF617401\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str338("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str339("#:%%DYN-CELL-275462358040624-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str340("#:%%DYN-CELL-275462358040625-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str341("#:%%DYN-CELL-275462358040626-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str342("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str343("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str345("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str346("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str347("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str348("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str349("BTB.LTV-2-READONLY\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str350("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str351("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str352("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str353("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str354("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str355("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str357("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str359("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str360("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str362("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str363("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str366("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str367("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str368("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str369("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str370("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str371("CLASS-NAME\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str372("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str373("CLASS-OF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str374("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str376("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str377("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str378("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str379("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str380("COMMON-LISP-USER::%RLASP-LTV-CCDA58184C259777\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str381("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str382("#:%%DYN-CELL-275462358040629-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str383("#:%%DYN-CELL-275462358040630-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str384("#:%%DYN-CELL-275462358040631-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str385("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str386("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str389("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str390("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str391("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str392("BTB.LTV-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str393("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str394("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str395("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str396("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str397("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str398("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str399("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str400("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str401("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str404("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str406("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str408("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str409("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str410("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str411("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str412("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str413("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str414("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str415("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str417("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str418("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str419("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str422("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str427("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str428("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP-USER::%RLASP-LTV-1AE5A0B414B278B1\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str430("COMMON-LISP-USER::%RLASP-LTV-1AE5A0B414B278B1\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str431("#:%%DYN-CELL-275462358040634-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str432("#:%%DYN-CELL-275462358040635-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str433("#:%%DYN-CELL-275462358040636-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str434("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str436("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str437("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str438("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str439("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str440("BTB.LTV-4\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str441("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str442("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str443("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str445("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str446("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str447("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str448("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str449("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str450("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str451("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str452("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str453("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str456("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str457("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str458("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str459("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str460("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str461("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str462("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str463("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str464("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str466("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP-USER::%RLASP-LTV-B82DDC19DAE96225\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str470("COMMON-LISP-USER::%RLASP-LTV-B82DDC19DAE96225\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str471("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str473("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str474("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str475("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str476("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str477("BTB.LTV-5\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str478("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str479("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str480("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str482("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str483("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str485("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str487("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str489("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str490("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str491("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str492("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str493("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str494("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str495("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str496("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str497("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str498("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str499("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str501("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str502("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str503("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str504("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str505("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str506("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str507("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str508("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str509("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str510("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str511("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str512("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str513("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str514("COMMON-LISP-USER::%RLASP-LTV-2DA3CD2D6B312812\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str515("COMMON-LISP-USER::%RLASP-LTV-2DA3CD2D6B312812\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str516("#:%%DYN-CELL-275462358040641-CC\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str517("#:%%DYN-CELL-275462358040642-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str518("#:%%DYN-CELL-275462358040643-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str519("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str520("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str521("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str522("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str523("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str524("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str525("BTB.MISC-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str526("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str527("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str528("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str529("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str530("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str531("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str532("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("EF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str535("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str536("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("R\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str538("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str539("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str541("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str542("EQL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("R\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str545("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str546("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str549("EF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str550("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str551("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str552("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str553("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str554("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str555("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str556("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str557("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str558("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str559("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str560("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str561("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str564("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str565("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str566("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str567("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str568("f\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str569("#:%%DYN-CELL-275462358040648-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str570("#:%%DYN-CELL-275462358040649-EF\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str571("#:%%DYN-CELL-275462358040650-R\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str572("#:%%DYN-CELL-275462358040651-CC\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str573("#:%%DYN-CELL-275462358040652-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str574("#:%%DYN-CELL-275462358040653-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str575("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str577("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str578("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str579("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str580("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str581("*__MLIR_BLOCK_RETFLAG_275462358040576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str582("*__MLIR_BLOCK_RETMVLIST_275462358040576*\00") : !llvm.array<41 x i8>
}
