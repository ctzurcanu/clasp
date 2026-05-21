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
      %57 = arith.constant 22 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 6 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_intern(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_nil_value() : () -> i64
      %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
      %72 = func.call @cc_values_pack(%71) : (i64) -> i64
      func.call @stack_push_pointer(%69) : (i64) -> ()
      %73 = arith.constant 36 : i64
      %74 = func.call @cc_box_character(%73) : (i64) -> i64
      func.call @stack_push_pointer(%74) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %75 = func.call @stack_pop_pointer() : () -> i64
      %76 = func.call @stack_pop_pointer() : () -> i64
      %77 = func.call @cc_cons(%76, %75) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %78 = arith.addi %77, %__rlasp_stack_elide_zero_3 : i64
      %79 = func.call @stack_pop_pointer() : () -> i64
      %80 = func.call @cc_cons(%79, %78) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %81 = arith.addi %80, %__rlasp_stack_elide_zero_4 : i64
      %95 = arith.constant 209815645192193 : i64
      %96 = arith.constant 0 : i64
      %97 = func.call @cc_make_closure(%95, %96) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %98 = arith.addi %97, %__rlasp_stack_elide_zero_5 : i64
      %99 = llvm.mlir.addressof @str7 : !llvm.ptr
      %100 = arith.constant 13 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      %102 = llvm.mlir.addressof @str8 : !llvm.ptr
      %103 = arith.constant 11 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = func.call @cc_intern(%101, %104) : (i64, i64) -> i64
      %106 = func.call @cc_nil_value() : () -> i64
      %107 = func.call @cc_cons(%105, %106) : (i64, i64) -> i64
      %108 = func.call @cc_values_pack(%107) : (i64) -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @cc_cons(%110, %109) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %112 = arith.addi %111, %__rlasp_stack_elide_zero_6 : i64
      %113 = llvm.mlir.addressof @str9 : !llvm.ptr
      %114 = arith.constant 11 : i64
      %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
      %116 = llvm.mlir.addressof @str10 : !llvm.ptr
      %117 = arith.constant 7 : i64
      %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
      %119 = func.call @cc_intern(%115, %118) : (i64, i64) -> i64
      %120 = func.call @cc_nil_value() : () -> i64
      %121 = func.call @cc_cons(%119, %120) : (i64, i64) -> i64
      %122 = func.call @cc_values_pack(%121) : (i64) -> i64
      %123 = func.call @cc_nil_value() : () -> i64
      %124 = llvm.mlir.addressof @str11 : !llvm.ptr
      %125 = arith.constant 4 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = llvm.mlir.addressof @str12 : !llvm.ptr
      %128 = arith.constant 7 : i64
      %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
      %130 = func.call @cc_intern(%126, %129) : (i64, i64) -> i64
      %131 = func.call @cc_nil_value() : () -> i64
      %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
      %133 = func.call @cc_values_pack(%132) : (i64) -> i64
      %134 = llvm.mlir.addressof @str13 : !llvm.ptr
      %135 = arith.constant 5 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_intern(%136, %137) : (i64, i64) -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
      %141 = func.call @cc_values_pack(%140) : (i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %142 = arith.addi %138, %__rlasp_stack_elide_zero_7 : i64
      %143 = func.call @cc_nil_value() : () -> i64
      %144 = func.call @cc_errorp(%64) : (i64) -> i64
      %145 = arith.cmpi ne, %144, %143 : i64
      %146 = arith.cmpi eq, %143, %143 : i64
      %147 = arith.andi %145, %146 : i1
      %148 = scf.if %147 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %143 : i64
      }
      %149 = func.call @cc_errorp(%81) : (i64) -> i64
      %150 = arith.cmpi ne, %149, %143 : i64
      %151 = arith.cmpi eq, %148, %143 : i64
      %152 = arith.andi %150, %151 : i1
      %153 = scf.if %152 -> (i64) {
        scf.yield %81 : i64
      } else {
        scf.yield %148 : i64
      }
      %154 = func.call @cc_errorp(%98) : (i64) -> i64
      %155 = arith.cmpi ne, %154, %143 : i64
      %156 = arith.cmpi eq, %153, %143 : i64
      %157 = arith.andi %155, %156 : i1
      %158 = scf.if %157 -> (i64) {
        scf.yield %98 : i64
      } else {
        scf.yield %153 : i64
      }
      %159 = func.call @cc_errorp(%112) : (i64) -> i64
      %160 = arith.cmpi ne, %159, %143 : i64
      %161 = arith.cmpi eq, %158, %143 : i64
      %162 = arith.andi %160, %161 : i1
      %163 = scf.if %162 -> (i64) {
        scf.yield %112 : i64
      } else {
        scf.yield %158 : i64
      }
      %164 = func.call @cc_errorp(%119) : (i64) -> i64
      %165 = arith.cmpi ne, %164, %143 : i64
      %166 = arith.cmpi eq, %163, %143 : i64
      %167 = arith.andi %165, %166 : i1
      %168 = scf.if %167 -> (i64) {
        scf.yield %119 : i64
      } else {
        scf.yield %163 : i64
      }
      %169 = func.call @cc_errorp(%123) : (i64) -> i64
      %170 = arith.cmpi ne, %169, %143 : i64
      %171 = arith.cmpi eq, %168, %143 : i64
      %172 = arith.andi %170, %171 : i1
      %173 = scf.if %172 -> (i64) {
        scf.yield %123 : i64
      } else {
        scf.yield %168 : i64
      }
      %174 = func.call @cc_errorp(%130) : (i64) -> i64
      %175 = arith.cmpi ne, %174, %143 : i64
      %176 = arith.cmpi eq, %173, %143 : i64
      %177 = arith.andi %175, %176 : i1
      %178 = scf.if %177 -> (i64) {
        scf.yield %130 : i64
      } else {
        scf.yield %173 : i64
      }
      %179 = func.call @cc_errorp(%142) : (i64) -> i64
      %180 = arith.cmpi ne, %179, %143 : i64
      %181 = arith.cmpi eq, %178, %143 : i64
      %182 = arith.andi %180, %181 : i1
      %183 = scf.if %182 -> (i64) {
        scf.yield %142 : i64
      } else {
        scf.yield %178 : i64
      }
      %184 = arith.cmpi ne, %183, %143 : i64
      scf.if %184 {
        func.call @stack_push_pointer(%183) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%81) : (i64) -> ()
        func.call @stack_push_pointer(%98) : (i64) -> ()
        func.call @stack_push_pointer(%112) : (i64) -> ()
        func.call @stack_push_pointer(%119) : (i64) -> ()
        func.call @stack_push_pointer(%123) : (i64) -> ()
        func.call @stack_push_pointer(%130) : (i64) -> ()
        func.call @stack_push_pointer(%142) : (i64) -> ()
        %185 = llvm.mlir.addressof @str14 : !llvm.ptr
        %186 = func.call @cc_make_function_ref_const(%185) : (!llvm.ptr) -> i64
        %187 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%186, %187) : (i64, i64) -> ()
      }
      %188 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %188 : i64
    }
    %189 = func.call @cc_nil_value() : () -> i64
    %190 = func.call @cc_errorp(%55) : (i64) -> i64
    %191 = arith.cmpi ne, %190, %189 : i64
    %192 = scf.if %191 -> (i64) {
      scf.yield %55 : i64
    } else {
      %193 = llvm.mlir.addressof @str15 : !llvm.ptr
      %194 = arith.constant 11 : i64
      %195 = func.call @cc_make_string(%193, %194) : (!llvm.ptr, i64) -> i64
      %196 = func.call @cc_nil_value() : () -> i64
      %197 = func.call @cc_intern(%195, %196) : (i64, i64) -> i64
      %198 = func.call @cc_nil_value() : () -> i64
      %199 = func.call @cc_cons(%197, %198) : (i64, i64) -> i64
      %200 = func.call @cc_values_pack(%199) : (i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %201 = arith.addi %197, %__rlasp_stack_elide_zero_8 : i64
      %202 = llvm.mlir.addressof @str16 : !llvm.ptr
      %203 = arith.constant 13 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = llvm.mlir.addressof @str17 : !llvm.ptr
      %206 = arith.constant 11 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %212 = llvm.mlir.addressof @str18 : !llvm.ptr
      %213 = arith.constant 6 : i64
      %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
      %215 = func.call @cc_nil_value() : () -> i64
      %216 = func.call @cc_intern(%214, %215) : (i64, i64) -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_cons(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_values_pack(%218) : (i64) -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      %220 = llvm.mlir.addressof @str19 : !llvm.ptr
      %221 = arith.constant 19 : i64
      %222 = func.call @cc_make_string(%220, %221) : (!llvm.ptr, i64) -> i64
      %223 = func.call @cc_nil_value() : () -> i64
      %224 = func.call @cc_intern(%222, %223) : (i64, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = func.call @cc_cons(%224, %225) : (i64, i64) -> i64
      %227 = func.call @cc_values_pack(%226) : (i64) -> i64
      func.call @stack_push_pointer(%224) : (i64) -> ()
      %228 = llvm.mlir.addressof @str20 : !llvm.ptr
      %229 = arith.constant 5 : i64
      %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
      %231 = llvm.mlir.addressof @str21 : !llvm.ptr
      %232 = arith.constant 11 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_intern(%230, %233) : (i64, i64) -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %237 = func.call @cc_values_pack(%236) : (i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = func.call @cc_cons(%239, %238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%240) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %241 = func.call @stack_pop_pointer() : () -> i64
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_cons(%242, %241) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %244 = arith.addi %243, %__rlasp_stack_elide_zero_9 : i64
      %245 = func.call @stack_pop_pointer() : () -> i64
      %246 = func.call @cc_cons(%245, %244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = func.call @cc_cons(%248, %247) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %250 = arith.addi %249, %__rlasp_stack_elide_zero_10 : i64
      %251 = func.call @stack_pop_pointer() : () -> i64
      %252 = func.call @cc_cons(%251, %250) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %253 = arith.addi %252, %__rlasp_stack_elide_zero_11 : i64
      %254 = func.call @stack_pop_pointer() : () -> i64
      %255 = func.call @cc_cons(%254, %253) : (i64, i64) -> i64
      func.call @stack_push_pointer(%255) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @cc_cons(%257, %256) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %259 = arith.addi %258, %__rlasp_stack_elide_zero_12 : i64
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @cc_cons(%260, %259) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %262 = arith.addi %261, %__rlasp_stack_elide_zero_13 : i64
      %311 = arith.constant 209815645192194 : i64
      %312 = arith.constant 0 : i64
      %313 = func.call @cc_make_closure(%311, %312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %314 = arith.addi %313, %__rlasp_stack_elide_zero_14 : i64
      %315 = llvm.mlir.addressof @str23 : !llvm.ptr
      %316 = arith.constant 4 : i64
      %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
      %318 = func.call @cc_nil_value() : () -> i64
      %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %323 = llvm.mlir.addressof @str24 : !llvm.ptr
      %324 = arith.constant 13 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = llvm.mlir.addressof @str25 : !llvm.ptr
      %327 = arith.constant 11 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_intern(%325, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %333 = func.call @stack_pop_pointer() : () -> i64
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = func.call @cc_cons(%334, %333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %336 = arith.addi %335, %__rlasp_stack_elide_zero_15 : i64
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @cc_cons(%337, %336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %339 = arith.addi %338, %__rlasp_stack_elide_zero_16 : i64
      %340 = llvm.mlir.addressof @str26 : !llvm.ptr
      %341 = arith.constant 11 : i64
      %342 = func.call @cc_make_string(%340, %341) : (!llvm.ptr, i64) -> i64
      %343 = llvm.mlir.addressof @str27 : !llvm.ptr
      %344 = arith.constant 7 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = func.call @cc_intern(%342, %345) : (i64, i64) -> i64
      %347 = func.call @cc_nil_value() : () -> i64
      %348 = func.call @cc_cons(%346, %347) : (i64, i64) -> i64
      %349 = func.call @cc_values_pack(%348) : (i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = llvm.mlir.addressof @str28 : !llvm.ptr
      %352 = arith.constant 4 : i64
      %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
      %354 = llvm.mlir.addressof @str29 : !llvm.ptr
      %355 = arith.constant 7 : i64
      %356 = func.call @cc_make_string(%354, %355) : (!llvm.ptr, i64) -> i64
      %357 = func.call @cc_intern(%353, %356) : (i64, i64) -> i64
      %358 = func.call @cc_nil_value() : () -> i64
      %359 = func.call @cc_cons(%357, %358) : (i64, i64) -> i64
      %360 = func.call @cc_values_pack(%359) : (i64) -> i64
      %361 = llvm.mlir.addressof @str30 : !llvm.ptr
      %362 = arith.constant 5 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_intern(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_cons(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_values_pack(%367) : (i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %369 = arith.addi %365, %__rlasp_stack_elide_zero_17 : i64
      %370 = func.call @cc_nil_value() : () -> i64
      %371 = func.call @cc_errorp(%201) : (i64) -> i64
      %372 = arith.cmpi ne, %371, %370 : i64
      %373 = arith.cmpi eq, %370, %370 : i64
      %374 = arith.andi %372, %373 : i1
      %375 = scf.if %374 -> (i64) {
        scf.yield %201 : i64
      } else {
        scf.yield %370 : i64
      }
      %376 = func.call @cc_errorp(%262) : (i64) -> i64
      %377 = arith.cmpi ne, %376, %370 : i64
      %378 = arith.cmpi eq, %375, %370 : i64
      %379 = arith.andi %377, %378 : i1
      %380 = scf.if %379 -> (i64) {
        scf.yield %262 : i64
      } else {
        scf.yield %375 : i64
      }
      %381 = func.call @cc_errorp(%314) : (i64) -> i64
      %382 = arith.cmpi ne, %381, %370 : i64
      %383 = arith.cmpi eq, %380, %370 : i64
      %384 = arith.andi %382, %383 : i1
      %385 = scf.if %384 -> (i64) {
        scf.yield %314 : i64
      } else {
        scf.yield %380 : i64
      }
      %386 = func.call @cc_errorp(%339) : (i64) -> i64
      %387 = arith.cmpi ne, %386, %370 : i64
      %388 = arith.cmpi eq, %385, %370 : i64
      %389 = arith.andi %387, %388 : i1
      %390 = scf.if %389 -> (i64) {
        scf.yield %339 : i64
      } else {
        scf.yield %385 : i64
      }
      %391 = func.call @cc_errorp(%346) : (i64) -> i64
      %392 = arith.cmpi ne, %391, %370 : i64
      %393 = arith.cmpi eq, %390, %370 : i64
      %394 = arith.andi %392, %393 : i1
      %395 = scf.if %394 -> (i64) {
        scf.yield %346 : i64
      } else {
        scf.yield %390 : i64
      }
      %396 = func.call @cc_errorp(%350) : (i64) -> i64
      %397 = arith.cmpi ne, %396, %370 : i64
      %398 = arith.cmpi eq, %395, %370 : i64
      %399 = arith.andi %397, %398 : i1
      %400 = scf.if %399 -> (i64) {
        scf.yield %350 : i64
      } else {
        scf.yield %395 : i64
      }
      %401 = func.call @cc_errorp(%357) : (i64) -> i64
      %402 = arith.cmpi ne, %401, %370 : i64
      %403 = arith.cmpi eq, %400, %370 : i64
      %404 = arith.andi %402, %403 : i1
      %405 = scf.if %404 -> (i64) {
        scf.yield %357 : i64
      } else {
        scf.yield %400 : i64
      }
      %406 = func.call @cc_errorp(%369) : (i64) -> i64
      %407 = arith.cmpi ne, %406, %370 : i64
      %408 = arith.cmpi eq, %405, %370 : i64
      %409 = arith.andi %407, %408 : i1
      %410 = scf.if %409 -> (i64) {
        scf.yield %369 : i64
      } else {
        scf.yield %405 : i64
      }
      %411 = arith.cmpi ne, %410, %370 : i64
      scf.if %411 {
        func.call @stack_push_pointer(%410) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%201) : (i64) -> ()
        func.call @stack_push_pointer(%262) : (i64) -> ()
        func.call @stack_push_pointer(%314) : (i64) -> ()
        func.call @stack_push_pointer(%339) : (i64) -> ()
        func.call @stack_push_pointer(%346) : (i64) -> ()
        func.call @stack_push_pointer(%350) : (i64) -> ()
        func.call @stack_push_pointer(%357) : (i64) -> ()
        func.call @stack_push_pointer(%369) : (i64) -> ()
        %412 = llvm.mlir.addressof @str31 : !llvm.ptr
        %413 = func.call @cc_make_function_ref_const(%412) : (!llvm.ptr) -> i64
        %414 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%413, %414) : (i64, i64) -> ()
      }
      %415 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %415 : i64
    }
    %416 = func.call @cc_nil_value() : () -> i64
    %417 = func.call @cc_errorp(%192) : (i64) -> i64
    %418 = arith.cmpi ne, %417, %416 : i64
    %419 = scf.if %418 -> (i64) {
      scf.yield %192 : i64
    } else {
      %420 = llvm.mlir.addressof @str32 : !llvm.ptr
      %421 = arith.constant 11 : i64
      %422 = func.call @cc_make_string(%420, %421) : (!llvm.ptr, i64) -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_intern(%422, %423) : (i64, i64) -> i64
      %425 = func.call @cc_nil_value() : () -> i64
      %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
      %427 = func.call @cc_values_pack(%426) : (i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %428 = arith.addi %424, %__rlasp_stack_elide_zero_18 : i64
      %429 = llvm.mlir.addressof @str33 : !llvm.ptr
      %430 = arith.constant 13 : i64
      %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
      %432 = llvm.mlir.addressof @str34 : !llvm.ptr
      %433 = arith.constant 11 : i64
      %434 = func.call @cc_make_string(%432, %433) : (!llvm.ptr, i64) -> i64
      %435 = func.call @cc_intern(%431, %434) : (i64, i64) -> i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_cons(%435, %436) : (i64, i64) -> i64
      %438 = func.call @cc_values_pack(%437) : (i64) -> i64
      func.call @stack_push_pointer(%435) : (i64) -> ()
      %439 = llvm.mlir.addressof @str35 : !llvm.ptr
      %440 = arith.constant 6 : i64
      %441 = func.call @cc_make_string(%439, %440) : (!llvm.ptr, i64) -> i64
      %442 = func.call @cc_nil_value() : () -> i64
      %443 = func.call @cc_intern(%441, %442) : (i64, i64) -> i64
      %444 = func.call @cc_nil_value() : () -> i64
      %445 = func.call @cc_cons(%443, %444) : (i64, i64) -> i64
      %446 = func.call @cc_values_pack(%445) : (i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      %447 = llvm.mlir.addressof @str36 : !llvm.ptr
      %448 = arith.constant 19 : i64
      %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_intern(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_nil_value() : () -> i64
      %453 = func.call @cc_cons(%451, %452) : (i64, i64) -> i64
      %454 = func.call @cc_values_pack(%453) : (i64) -> i64
      func.call @stack_push_pointer(%451) : (i64) -> ()
      %455 = llvm.mlir.addressof @str37 : !llvm.ptr
      %456 = arith.constant 6 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = llvm.mlir.addressof @str38 : !llvm.ptr
      %459 = arith.constant 11 : i64
      %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
      %461 = func.call @cc_intern(%457, %460) : (i64, i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
      %464 = func.call @cc_values_pack(%463) : (i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @cc_cons(%466, %465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %468 = func.call @stack_pop_pointer() : () -> i64
      %469 = func.call @stack_pop_pointer() : () -> i64
      %470 = func.call @cc_cons(%469, %468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %471 = arith.addi %470, %__rlasp_stack_elide_zero_19 : i64
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @cc_cons(%472, %471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%473) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @cc_cons(%475, %474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %477 = arith.addi %476, %__rlasp_stack_elide_zero_20 : i64
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @cc_cons(%478, %477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %480 = arith.addi %479, %__rlasp_stack_elide_zero_21 : i64
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @cc_cons(%481, %480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @cc_cons(%484, %483) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %486 = arith.addi %485, %__rlasp_stack_elide_zero_22 : i64
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @cc_cons(%487, %486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %489 = arith.addi %488, %__rlasp_stack_elide_zero_23 : i64
      %538 = arith.constant 209815645192195 : i64
      %539 = arith.constant 0 : i64
      %540 = func.call @cc_make_closure(%538, %539) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %541 = arith.addi %540, %__rlasp_stack_elide_zero_24 : i64
      %542 = llvm.mlir.addressof @str40 : !llvm.ptr
      %543 = arith.constant 4 : i64
      %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
      %545 = func.call @cc_nil_value() : () -> i64
      %546 = func.call @cc_intern(%544, %545) : (i64, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_cons(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_values_pack(%548) : (i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      %550 = llvm.mlir.addressof @str41 : !llvm.ptr
      %551 = arith.constant 13 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      %553 = llvm.mlir.addressof @str42 : !llvm.ptr
      %554 = arith.constant 11 : i64
      %555 = func.call @cc_make_string(%553, %554) : (!llvm.ptr, i64) -> i64
      %556 = func.call @cc_intern(%552, %555) : (i64, i64) -> i64
      %557 = func.call @cc_nil_value() : () -> i64
      %558 = func.call @cc_cons(%556, %557) : (i64, i64) -> i64
      %559 = func.call @cc_values_pack(%558) : (i64) -> i64
      func.call @stack_push_pointer(%556) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @cc_cons(%561, %560) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %563 = arith.addi %562, %__rlasp_stack_elide_zero_25 : i64
      %564 = func.call @stack_pop_pointer() : () -> i64
      %565 = func.call @cc_cons(%564, %563) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %566 = arith.addi %565, %__rlasp_stack_elide_zero_26 : i64
      %567 = llvm.mlir.addressof @str43 : !llvm.ptr
      %568 = arith.constant 11 : i64
      %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
      %570 = llvm.mlir.addressof @str44 : !llvm.ptr
      %571 = arith.constant 7 : i64
      %572 = func.call @cc_make_string(%570, %571) : (!llvm.ptr, i64) -> i64
      %573 = func.call @cc_intern(%569, %572) : (i64, i64) -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_cons(%573, %574) : (i64, i64) -> i64
      %576 = func.call @cc_values_pack(%575) : (i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = llvm.mlir.addressof @str45 : !llvm.ptr
      %579 = arith.constant 4 : i64
      %580 = func.call @cc_make_string(%578, %579) : (!llvm.ptr, i64) -> i64
      %581 = llvm.mlir.addressof @str46 : !llvm.ptr
      %582 = arith.constant 7 : i64
      %583 = func.call @cc_make_string(%581, %582) : (!llvm.ptr, i64) -> i64
      %584 = func.call @cc_intern(%580, %583) : (i64, i64) -> i64
      %585 = func.call @cc_nil_value() : () -> i64
      %586 = func.call @cc_cons(%584, %585) : (i64, i64) -> i64
      %587 = func.call @cc_values_pack(%586) : (i64) -> i64
      %588 = llvm.mlir.addressof @str47 : !llvm.ptr
      %589 = arith.constant 5 : i64
      %590 = func.call @cc_make_string(%588, %589) : (!llvm.ptr, i64) -> i64
      %591 = func.call @cc_nil_value() : () -> i64
      %592 = func.call @cc_intern(%590, %591) : (i64, i64) -> i64
      %593 = func.call @cc_nil_value() : () -> i64
      %594 = func.call @cc_cons(%592, %593) : (i64, i64) -> i64
      %595 = func.call @cc_values_pack(%594) : (i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %596 = arith.addi %592, %__rlasp_stack_elide_zero_27 : i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_errorp(%428) : (i64) -> i64
      %599 = arith.cmpi ne, %598, %597 : i64
      %600 = arith.cmpi eq, %597, %597 : i64
      %601 = arith.andi %599, %600 : i1
      %602 = scf.if %601 -> (i64) {
        scf.yield %428 : i64
      } else {
        scf.yield %597 : i64
      }
      %603 = func.call @cc_errorp(%489) : (i64) -> i64
      %604 = arith.cmpi ne, %603, %597 : i64
      %605 = arith.cmpi eq, %602, %597 : i64
      %606 = arith.andi %604, %605 : i1
      %607 = scf.if %606 -> (i64) {
        scf.yield %489 : i64
      } else {
        scf.yield %602 : i64
      }
      %608 = func.call @cc_errorp(%541) : (i64) -> i64
      %609 = arith.cmpi ne, %608, %597 : i64
      %610 = arith.cmpi eq, %607, %597 : i64
      %611 = arith.andi %609, %610 : i1
      %612 = scf.if %611 -> (i64) {
        scf.yield %541 : i64
      } else {
        scf.yield %607 : i64
      }
      %613 = func.call @cc_errorp(%566) : (i64) -> i64
      %614 = arith.cmpi ne, %613, %597 : i64
      %615 = arith.cmpi eq, %612, %597 : i64
      %616 = arith.andi %614, %615 : i1
      %617 = scf.if %616 -> (i64) {
        scf.yield %566 : i64
      } else {
        scf.yield %612 : i64
      }
      %618 = func.call @cc_errorp(%573) : (i64) -> i64
      %619 = arith.cmpi ne, %618, %597 : i64
      %620 = arith.cmpi eq, %617, %597 : i64
      %621 = arith.andi %619, %620 : i1
      %622 = scf.if %621 -> (i64) {
        scf.yield %573 : i64
      } else {
        scf.yield %617 : i64
      }
      %623 = func.call @cc_errorp(%577) : (i64) -> i64
      %624 = arith.cmpi ne, %623, %597 : i64
      %625 = arith.cmpi eq, %622, %597 : i64
      %626 = arith.andi %624, %625 : i1
      %627 = scf.if %626 -> (i64) {
        scf.yield %577 : i64
      } else {
        scf.yield %622 : i64
      }
      %628 = func.call @cc_errorp(%584) : (i64) -> i64
      %629 = arith.cmpi ne, %628, %597 : i64
      %630 = arith.cmpi eq, %627, %597 : i64
      %631 = arith.andi %629, %630 : i1
      %632 = scf.if %631 -> (i64) {
        scf.yield %584 : i64
      } else {
        scf.yield %627 : i64
      }
      %633 = func.call @cc_errorp(%596) : (i64) -> i64
      %634 = arith.cmpi ne, %633, %597 : i64
      %635 = arith.cmpi eq, %632, %597 : i64
      %636 = arith.andi %634, %635 : i1
      %637 = scf.if %636 -> (i64) {
        scf.yield %596 : i64
      } else {
        scf.yield %632 : i64
      }
      %638 = arith.cmpi ne, %637, %597 : i64
      scf.if %638 {
        func.call @stack_push_pointer(%637) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%428) : (i64) -> ()
        func.call @stack_push_pointer(%489) : (i64) -> ()
        func.call @stack_push_pointer(%541) : (i64) -> ()
        func.call @stack_push_pointer(%566) : (i64) -> ()
        func.call @stack_push_pointer(%573) : (i64) -> ()
        func.call @stack_push_pointer(%577) : (i64) -> ()
        func.call @stack_push_pointer(%584) : (i64) -> ()
        func.call @stack_push_pointer(%596) : (i64) -> ()
        %639 = llvm.mlir.addressof @str48 : !llvm.ptr
        %640 = func.call @cc_make_function_ref_const(%639) : (!llvm.ptr) -> i64
        %641 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%640, %641) : (i64, i64) -> ()
      }
      %642 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %642 : i64
    }
    %643 = func.call @cc_nil_value() : () -> i64
    %644 = func.call @cc_errorp(%419) : (i64) -> i64
    %645 = arith.cmpi ne, %644, %643 : i64
    %646 = scf.if %645 -> (i64) {
      scf.yield %419 : i64
    } else {
      %647 = llvm.mlir.addressof @str49 : !llvm.ptr
      %648 = arith.constant 11 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_nil_value() : () -> i64
      %651 = func.call @cc_intern(%649, %650) : (i64, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_values_pack(%653) : (i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %655 = arith.addi %651, %__rlasp_stack_elide_zero_28 : i64
      %656 = llvm.mlir.addressof @str50 : !llvm.ptr
      %657 = arith.constant 13 : i64
      %658 = func.call @cc_make_string(%656, %657) : (!llvm.ptr, i64) -> i64
      %659 = llvm.mlir.addressof @str51 : !llvm.ptr
      %660 = arith.constant 11 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = func.call @cc_intern(%658, %661) : (i64, i64) -> i64
      %663 = func.call @cc_nil_value() : () -> i64
      %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
      %665 = func.call @cc_values_pack(%664) : (i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %666 = llvm.mlir.addressof @str52 : !llvm.ptr
      %667 = arith.constant 6 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = func.call @cc_nil_value() : () -> i64
      %670 = func.call @cc_intern(%668, %669) : (i64, i64) -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
      %673 = func.call @cc_values_pack(%672) : (i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %674 = llvm.mlir.addressof @str53 : !llvm.ptr
      %675 = arith.constant 19 : i64
      %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = func.call @cc_intern(%676, %677) : (i64, i64) -> i64
      %679 = func.call @cc_nil_value() : () -> i64
      %680 = func.call @cc_cons(%678, %679) : (i64, i64) -> i64
      %681 = func.call @cc_values_pack(%680) : (i64) -> i64
      func.call @stack_push_pointer(%678) : (i64) -> ()
      %682 = llvm.mlir.addressof @str54 : !llvm.ptr
      %683 = arith.constant 5 : i64
      %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
      %685 = llvm.mlir.addressof @str55 : !llvm.ptr
      %686 = arith.constant 11 : i64
      %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
      %688 = func.call @cc_intern(%684, %687) : (i64, i64) -> i64
      %689 = func.call @cc_nil_value() : () -> i64
      %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
      %691 = func.call @cc_values_pack(%690) : (i64) -> i64
      func.call @stack_push_pointer(%688) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %692 = func.call @stack_pop_pointer() : () -> i64
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @cc_cons(%693, %692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = func.call @stack_pop_pointer() : () -> i64
      %697 = func.call @cc_cons(%696, %695) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %698 = arith.addi %697, %__rlasp_stack_elide_zero_29 : i64
      %699 = func.call @stack_pop_pointer() : () -> i64
      %700 = func.call @cc_cons(%699, %698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%700) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %701 = func.call @stack_pop_pointer() : () -> i64
      %702 = func.call @stack_pop_pointer() : () -> i64
      %703 = func.call @cc_cons(%702, %701) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %704 = arith.addi %703, %__rlasp_stack_elide_zero_30 : i64
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @cc_cons(%705, %704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %707 = arith.addi %706, %__rlasp_stack_elide_zero_31 : i64
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_cons(%708, %707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %713 = arith.addi %712, %__rlasp_stack_elide_zero_32 : i64
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @cc_cons(%714, %713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %716 = arith.addi %715, %__rlasp_stack_elide_zero_33 : i64
      %765 = arith.constant 209815645192196 : i64
      %766 = arith.constant 0 : i64
      %767 = func.call @cc_make_closure(%765, %766) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %768 = arith.addi %767, %__rlasp_stack_elide_zero_34 : i64
      %769 = llvm.mlir.addressof @str57 : !llvm.ptr
      %770 = arith.constant 4 : i64
      %771 = func.call @cc_make_string(%769, %770) : (!llvm.ptr, i64) -> i64
      %772 = func.call @cc_nil_value() : () -> i64
      %773 = func.call @cc_intern(%771, %772) : (i64, i64) -> i64
      %774 = func.call @cc_nil_value() : () -> i64
      %775 = func.call @cc_cons(%773, %774) : (i64, i64) -> i64
      %776 = func.call @cc_values_pack(%775) : (i64) -> i64
      func.call @stack_push_pointer(%773) : (i64) -> ()
      %777 = llvm.mlir.addressof @str58 : !llvm.ptr
      %778 = arith.constant 13 : i64
      %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
      %780 = llvm.mlir.addressof @str59 : !llvm.ptr
      %781 = arith.constant 11 : i64
      %782 = func.call @cc_make_string(%780, %781) : (!llvm.ptr, i64) -> i64
      %783 = func.call @cc_intern(%779, %782) : (i64, i64) -> i64
      %784 = func.call @cc_nil_value() : () -> i64
      %785 = func.call @cc_cons(%783, %784) : (i64, i64) -> i64
      %786 = func.call @cc_values_pack(%785) : (i64) -> i64
      func.call @stack_push_pointer(%783) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %790 = arith.addi %789, %__rlasp_stack_elide_zero_35 : i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %793 = arith.addi %792, %__rlasp_stack_elide_zero_36 : i64
      %794 = llvm.mlir.addressof @str60 : !llvm.ptr
      %795 = arith.constant 11 : i64
      %796 = func.call @cc_make_string(%794, %795) : (!llvm.ptr, i64) -> i64
      %797 = llvm.mlir.addressof @str61 : !llvm.ptr
      %798 = arith.constant 7 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = func.call @cc_intern(%796, %799) : (i64, i64) -> i64
      %801 = func.call @cc_nil_value() : () -> i64
      %802 = func.call @cc_cons(%800, %801) : (i64, i64) -> i64
      %803 = func.call @cc_values_pack(%802) : (i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = llvm.mlir.addressof @str62 : !llvm.ptr
      %806 = arith.constant 4 : i64
      %807 = func.call @cc_make_string(%805, %806) : (!llvm.ptr, i64) -> i64
      %808 = llvm.mlir.addressof @str63 : !llvm.ptr
      %809 = arith.constant 7 : i64
      %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
      %811 = func.call @cc_intern(%807, %810) : (i64, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_values_pack(%813) : (i64) -> i64
      %815 = llvm.mlir.addressof @str64 : !llvm.ptr
      %816 = arith.constant 5 : i64
      %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_intern(%817, %818) : (i64, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
      %822 = func.call @cc_values_pack(%821) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %823 = arith.addi %819, %__rlasp_stack_elide_zero_37 : i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_errorp(%655) : (i64) -> i64
      %826 = arith.cmpi ne, %825, %824 : i64
      %827 = arith.cmpi eq, %824, %824 : i64
      %828 = arith.andi %826, %827 : i1
      %829 = scf.if %828 -> (i64) {
        scf.yield %655 : i64
      } else {
        scf.yield %824 : i64
      }
      %830 = func.call @cc_errorp(%716) : (i64) -> i64
      %831 = arith.cmpi ne, %830, %824 : i64
      %832 = arith.cmpi eq, %829, %824 : i64
      %833 = arith.andi %831, %832 : i1
      %834 = scf.if %833 -> (i64) {
        scf.yield %716 : i64
      } else {
        scf.yield %829 : i64
      }
      %835 = func.call @cc_errorp(%768) : (i64) -> i64
      %836 = arith.cmpi ne, %835, %824 : i64
      %837 = arith.cmpi eq, %834, %824 : i64
      %838 = arith.andi %836, %837 : i1
      %839 = scf.if %838 -> (i64) {
        scf.yield %768 : i64
      } else {
        scf.yield %834 : i64
      }
      %840 = func.call @cc_errorp(%793) : (i64) -> i64
      %841 = arith.cmpi ne, %840, %824 : i64
      %842 = arith.cmpi eq, %839, %824 : i64
      %843 = arith.andi %841, %842 : i1
      %844 = scf.if %843 -> (i64) {
        scf.yield %793 : i64
      } else {
        scf.yield %839 : i64
      }
      %845 = func.call @cc_errorp(%800) : (i64) -> i64
      %846 = arith.cmpi ne, %845, %824 : i64
      %847 = arith.cmpi eq, %844, %824 : i64
      %848 = arith.andi %846, %847 : i1
      %849 = scf.if %848 -> (i64) {
        scf.yield %800 : i64
      } else {
        scf.yield %844 : i64
      }
      %850 = func.call @cc_errorp(%804) : (i64) -> i64
      %851 = arith.cmpi ne, %850, %824 : i64
      %852 = arith.cmpi eq, %849, %824 : i64
      %853 = arith.andi %851, %852 : i1
      %854 = scf.if %853 -> (i64) {
        scf.yield %804 : i64
      } else {
        scf.yield %849 : i64
      }
      %855 = func.call @cc_errorp(%811) : (i64) -> i64
      %856 = arith.cmpi ne, %855, %824 : i64
      %857 = arith.cmpi eq, %854, %824 : i64
      %858 = arith.andi %856, %857 : i1
      %859 = scf.if %858 -> (i64) {
        scf.yield %811 : i64
      } else {
        scf.yield %854 : i64
      }
      %860 = func.call @cc_errorp(%823) : (i64) -> i64
      %861 = arith.cmpi ne, %860, %824 : i64
      %862 = arith.cmpi eq, %859, %824 : i64
      %863 = arith.andi %861, %862 : i1
      %864 = scf.if %863 -> (i64) {
        scf.yield %823 : i64
      } else {
        scf.yield %859 : i64
      }
      %865 = arith.cmpi ne, %864, %824 : i64
      scf.if %865 {
        func.call @stack_push_pointer(%864) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%655) : (i64) -> ()
        func.call @stack_push_pointer(%716) : (i64) -> ()
        func.call @stack_push_pointer(%768) : (i64) -> ()
        func.call @stack_push_pointer(%793) : (i64) -> ()
        func.call @stack_push_pointer(%800) : (i64) -> ()
        func.call @stack_push_pointer(%804) : (i64) -> ()
        func.call @stack_push_pointer(%811) : (i64) -> ()
        func.call @stack_push_pointer(%823) : (i64) -> ()
        %866 = llvm.mlir.addressof @str65 : !llvm.ptr
        %867 = func.call @cc_make_function_ref_const(%866) : (!llvm.ptr) -> i64
        %868 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%867, %868) : (i64, i64) -> ()
      }
      %869 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %869 : i64
    }
    %870 = func.call @cc_nil_value() : () -> i64
    %871 = func.call @cc_errorp(%646) : (i64) -> i64
    %872 = arith.cmpi ne, %871, %870 : i64
    %873 = scf.if %872 -> (i64) {
      scf.yield %646 : i64
    } else {
      %874 = llvm.mlir.addressof @str66 : !llvm.ptr
      %875 = arith.constant 11 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = func.call @cc_nil_value() : () -> i64
      %878 = func.call @cc_intern(%876, %877) : (i64, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_values_pack(%880) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %882 = arith.addi %878, %__rlasp_stack_elide_zero_38 : i64
      %883 = llvm.mlir.addressof @str67 : !llvm.ptr
      %884 = arith.constant 13 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = llvm.mlir.addressof @str68 : !llvm.ptr
      %887 = arith.constant 11 : i64
      %888 = func.call @cc_make_string(%886, %887) : (!llvm.ptr, i64) -> i64
      %889 = func.call @cc_intern(%885, %888) : (i64, i64) -> i64
      %890 = func.call @cc_nil_value() : () -> i64
      %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
      %892 = func.call @cc_values_pack(%891) : (i64) -> i64
      func.call @stack_push_pointer(%889) : (i64) -> ()
      %893 = llvm.mlir.addressof @str69 : !llvm.ptr
      %894 = arith.constant 6 : i64
      %895 = func.call @cc_make_string(%893, %894) : (!llvm.ptr, i64) -> i64
      %896 = func.call @cc_nil_value() : () -> i64
      %897 = func.call @cc_intern(%895, %896) : (i64, i64) -> i64
      %898 = func.call @cc_nil_value() : () -> i64
      %899 = func.call @cc_cons(%897, %898) : (i64, i64) -> i64
      %900 = func.call @cc_values_pack(%899) : (i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      %901 = llvm.mlir.addressof @str70 : !llvm.ptr
      %902 = arith.constant 19 : i64
      %903 = func.call @cc_make_string(%901, %902) : (!llvm.ptr, i64) -> i64
      %904 = func.call @cc_nil_value() : () -> i64
      %905 = func.call @cc_intern(%903, %904) : (i64, i64) -> i64
      %906 = func.call @cc_nil_value() : () -> i64
      %907 = func.call @cc_cons(%905, %906) : (i64, i64) -> i64
      %908 = func.call @cc_values_pack(%907) : (i64) -> i64
      func.call @stack_push_pointer(%905) : (i64) -> ()
      %909 = llvm.mlir.addressof @str71 : !llvm.ptr
      %910 = arith.constant 5 : i64
      %911 = func.call @cc_make_string(%909, %910) : (!llvm.ptr, i64) -> i64
      %912 = llvm.mlir.addressof @str72 : !llvm.ptr
      %913 = arith.constant 11 : i64
      %914 = func.call @cc_make_string(%912, %913) : (!llvm.ptr, i64) -> i64
      %915 = func.call @cc_intern(%911, %914) : (i64, i64) -> i64
      %916 = func.call @cc_nil_value() : () -> i64
      %917 = func.call @cc_cons(%915, %916) : (i64, i64) -> i64
      %918 = func.call @cc_values_pack(%917) : (i64) -> i64
      func.call @stack_push_pointer(%915) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %919 = func.call @stack_pop_pointer() : () -> i64
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @cc_cons(%920, %919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%921) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %922 = func.call @stack_pop_pointer() : () -> i64
      %923 = func.call @stack_pop_pointer() : () -> i64
      %924 = func.call @cc_cons(%923, %922) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %925 = arith.addi %924, %__rlasp_stack_elide_zero_39 : i64
      %926 = func.call @stack_pop_pointer() : () -> i64
      %927 = func.call @cc_cons(%926, %925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%927) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %928 = func.call @stack_pop_pointer() : () -> i64
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = func.call @cc_cons(%929, %928) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %931 = arith.addi %930, %__rlasp_stack_elide_zero_40 : i64
      %932 = func.call @stack_pop_pointer() : () -> i64
      %933 = func.call @cc_cons(%932, %931) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %934 = arith.addi %933, %__rlasp_stack_elide_zero_41 : i64
      %935 = func.call @stack_pop_pointer() : () -> i64
      %936 = func.call @cc_cons(%935, %934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %937 = func.call @stack_pop_pointer() : () -> i64
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @cc_cons(%938, %937) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %940 = arith.addi %939, %__rlasp_stack_elide_zero_42 : i64
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = func.call @cc_cons(%941, %940) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %943 = arith.addi %942, %__rlasp_stack_elide_zero_43 : i64
      %992 = arith.constant 209815645192197 : i64
      %993 = arith.constant 0 : i64
      %994 = func.call @cc_make_closure(%992, %993) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %995 = arith.addi %994, %__rlasp_stack_elide_zero_44 : i64
      %996 = llvm.mlir.addressof @str74 : !llvm.ptr
      %997 = arith.constant 4 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = func.call @cc_nil_value() : () -> i64
      %1000 = func.call @cc_intern(%998, %999) : (i64, i64) -> i64
      %1001 = func.call @cc_nil_value() : () -> i64
      %1002 = func.call @cc_cons(%1000, %1001) : (i64, i64) -> i64
      %1003 = func.call @cc_values_pack(%1002) : (i64) -> i64
      func.call @stack_push_pointer(%1000) : (i64) -> ()
      %1004 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1005 = arith.constant 13 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = llvm.mlir.addressof @str76 : !llvm.ptr
      %1008 = arith.constant 11 : i64
      %1009 = func.call @cc_make_string(%1007, %1008) : (!llvm.ptr, i64) -> i64
      %1010 = func.call @cc_intern(%1006, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_nil_value() : () -> i64
      %1012 = func.call @cc_cons(%1010, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_values_pack(%1012) : (i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @stack_pop_pointer() : () -> i64
      %1016 = func.call @cc_cons(%1015, %1014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1017 = arith.addi %1016, %__rlasp_stack_elide_zero_45 : i64
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = func.call @cc_cons(%1018, %1017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1020 = arith.addi %1019, %__rlasp_stack_elide_zero_46 : i64
      %1021 = llvm.mlir.addressof @str77 : !llvm.ptr
      %1022 = arith.constant 11 : i64
      %1023 = func.call @cc_make_string(%1021, %1022) : (!llvm.ptr, i64) -> i64
      %1024 = llvm.mlir.addressof @str78 : !llvm.ptr
      %1025 = arith.constant 7 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = func.call @cc_intern(%1023, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_nil_value() : () -> i64
      %1029 = func.call @cc_cons(%1027, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_values_pack(%1029) : (i64) -> i64
      %1031 = func.call @cc_nil_value() : () -> i64
      %1032 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1033 = arith.constant 4 : i64
      %1034 = func.call @cc_make_string(%1032, %1033) : (!llvm.ptr, i64) -> i64
      %1035 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1036 = arith.constant 7 : i64
      %1037 = func.call @cc_make_string(%1035, %1036) : (!llvm.ptr, i64) -> i64
      %1038 = func.call @cc_intern(%1034, %1037) : (i64, i64) -> i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_cons(%1038, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_values_pack(%1040) : (i64) -> i64
      %1042 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1043 = arith.constant 5 : i64
      %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
      %1045 = func.call @cc_nil_value() : () -> i64
      %1046 = func.call @cc_intern(%1044, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1050 = arith.addi %1046, %__rlasp_stack_elide_zero_47 : i64
      %1051 = func.call @cc_nil_value() : () -> i64
      %1052 = func.call @cc_errorp(%882) : (i64) -> i64
      %1053 = arith.cmpi ne, %1052, %1051 : i64
      %1054 = arith.cmpi eq, %1051, %1051 : i64
      %1055 = arith.andi %1053, %1054 : i1
      %1056 = scf.if %1055 -> (i64) {
        scf.yield %882 : i64
      } else {
        scf.yield %1051 : i64
      }
      %1057 = func.call @cc_errorp(%943) : (i64) -> i64
      %1058 = arith.cmpi ne, %1057, %1051 : i64
      %1059 = arith.cmpi eq, %1056, %1051 : i64
      %1060 = arith.andi %1058, %1059 : i1
      %1061 = scf.if %1060 -> (i64) {
        scf.yield %943 : i64
      } else {
        scf.yield %1056 : i64
      }
      %1062 = func.call @cc_errorp(%995) : (i64) -> i64
      %1063 = arith.cmpi ne, %1062, %1051 : i64
      %1064 = arith.cmpi eq, %1061, %1051 : i64
      %1065 = arith.andi %1063, %1064 : i1
      %1066 = scf.if %1065 -> (i64) {
        scf.yield %995 : i64
      } else {
        scf.yield %1061 : i64
      }
      %1067 = func.call @cc_errorp(%1020) : (i64) -> i64
      %1068 = arith.cmpi ne, %1067, %1051 : i64
      %1069 = arith.cmpi eq, %1066, %1051 : i64
      %1070 = arith.andi %1068, %1069 : i1
      %1071 = scf.if %1070 -> (i64) {
        scf.yield %1020 : i64
      } else {
        scf.yield %1066 : i64
      }
      %1072 = func.call @cc_errorp(%1027) : (i64) -> i64
      %1073 = arith.cmpi ne, %1072, %1051 : i64
      %1074 = arith.cmpi eq, %1071, %1051 : i64
      %1075 = arith.andi %1073, %1074 : i1
      %1076 = scf.if %1075 -> (i64) {
        scf.yield %1027 : i64
      } else {
        scf.yield %1071 : i64
      }
      %1077 = func.call @cc_errorp(%1031) : (i64) -> i64
      %1078 = arith.cmpi ne, %1077, %1051 : i64
      %1079 = arith.cmpi eq, %1076, %1051 : i64
      %1080 = arith.andi %1078, %1079 : i1
      %1081 = scf.if %1080 -> (i64) {
        scf.yield %1031 : i64
      } else {
        scf.yield %1076 : i64
      }
      %1082 = func.call @cc_errorp(%1038) : (i64) -> i64
      %1083 = arith.cmpi ne, %1082, %1051 : i64
      %1084 = arith.cmpi eq, %1081, %1051 : i64
      %1085 = arith.andi %1083, %1084 : i1
      %1086 = scf.if %1085 -> (i64) {
        scf.yield %1038 : i64
      } else {
        scf.yield %1081 : i64
      }
      %1087 = func.call @cc_errorp(%1050) : (i64) -> i64
      %1088 = arith.cmpi ne, %1087, %1051 : i64
      %1089 = arith.cmpi eq, %1086, %1051 : i64
      %1090 = arith.andi %1088, %1089 : i1
      %1091 = scf.if %1090 -> (i64) {
        scf.yield %1050 : i64
      } else {
        scf.yield %1086 : i64
      }
      %1092 = arith.cmpi ne, %1091, %1051 : i64
      scf.if %1092 {
        func.call @stack_push_pointer(%1091) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%882) : (i64) -> ()
        func.call @stack_push_pointer(%943) : (i64) -> ()
        func.call @stack_push_pointer(%995) : (i64) -> ()
        func.call @stack_push_pointer(%1020) : (i64) -> ()
        func.call @stack_push_pointer(%1027) : (i64) -> ()
        func.call @stack_push_pointer(%1031) : (i64) -> ()
        func.call @stack_push_pointer(%1038) : (i64) -> ()
        func.call @stack_push_pointer(%1050) : (i64) -> ()
        %1093 = llvm.mlir.addressof @str82 : !llvm.ptr
        %1094 = func.call @cc_make_function_ref_const(%1093) : (!llvm.ptr) -> i64
        %1095 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1094, %1095) : (i64, i64) -> ()
      }
      %1096 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1096 : i64
    }
    %1097 = func.call @cc_nil_value() : () -> i64
    %1098 = func.call @cc_errorp(%873) : (i64) -> i64
    %1099 = arith.cmpi ne, %1098, %1097 : i64
    %1100 = scf.if %1099 -> (i64) {
      scf.yield %873 : i64
    } else {
      %1101 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1102 = arith.constant 11 : i64
      %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
      %1104 = func.call @cc_nil_value() : () -> i64
      %1105 = func.call @cc_intern(%1103, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_nil_value() : () -> i64
      %1107 = func.call @cc_cons(%1105, %1106) : (i64, i64) -> i64
      %1108 = func.call @cc_values_pack(%1107) : (i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1109 = arith.addi %1105, %__rlasp_stack_elide_zero_48 : i64
      %1110 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1111 = arith.constant 13 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1114 = arith.constant 11 : i64
      %1115 = func.call @cc_make_string(%1113, %1114) : (!llvm.ptr, i64) -> i64
      %1116 = func.call @cc_intern(%1112, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = func.call @cc_cons(%1116, %1117) : (i64, i64) -> i64
      %1119 = func.call @cc_values_pack(%1118) : (i64) -> i64
      func.call @stack_push_pointer(%1116) : (i64) -> ()
      %1120 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1121 = arith.constant 6 : i64
      %1122 = func.call @cc_make_string(%1120, %1121) : (!llvm.ptr, i64) -> i64
      %1123 = func.call @cc_nil_value() : () -> i64
      %1124 = func.call @cc_intern(%1122, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_cons(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_values_pack(%1126) : (i64) -> i64
      func.call @stack_push_pointer(%1124) : (i64) -> ()
      %1128 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1129 = arith.constant 19 : i64
      %1130 = func.call @cc_make_string(%1128, %1129) : (!llvm.ptr, i64) -> i64
      %1131 = func.call @cc_nil_value() : () -> i64
      %1132 = func.call @cc_intern(%1130, %1131) : (i64, i64) -> i64
      %1133 = func.call @cc_nil_value() : () -> i64
      %1134 = func.call @cc_cons(%1132, %1133) : (i64, i64) -> i64
      %1135 = func.call @cc_values_pack(%1134) : (i64) -> i64
      func.call @stack_push_pointer(%1132) : (i64) -> ()
      %1136 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1137 = arith.constant 6 : i64
      %1138 = func.call @cc_make_string(%1136, %1137) : (!llvm.ptr, i64) -> i64
      %1139 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1140 = arith.constant 11 : i64
      %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
      %1142 = func.call @cc_intern(%1138, %1141) : (i64, i64) -> i64
      %1143 = func.call @cc_nil_value() : () -> i64
      %1144 = func.call @cc_cons(%1142, %1143) : (i64, i64) -> i64
      %1145 = func.call @cc_values_pack(%1144) : (i64) -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @cc_cons(%1147, %1146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @cc_cons(%1150, %1149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1152 = arith.addi %1151, %__rlasp_stack_elide_zero_49 : i64
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @cc_cons(%1153, %1152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1154) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @cc_cons(%1156, %1155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1158 = arith.addi %1157, %__rlasp_stack_elide_zero_50 : i64
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @cc_cons(%1159, %1158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1161 = arith.addi %1160, %__rlasp_stack_elide_zero_51 : i64
      %1162 = func.call @stack_pop_pointer() : () -> i64
      %1163 = func.call @cc_cons(%1162, %1161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1163) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1164 = func.call @stack_pop_pointer() : () -> i64
      %1165 = func.call @stack_pop_pointer() : () -> i64
      %1166 = func.call @cc_cons(%1165, %1164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1167 = arith.addi %1166, %__rlasp_stack_elide_zero_52 : i64
      %1168 = func.call @stack_pop_pointer() : () -> i64
      %1169 = func.call @cc_cons(%1168, %1167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1170 = arith.addi %1169, %__rlasp_stack_elide_zero_53 : i64
      %1219 = arith.constant 209815645192198 : i64
      %1220 = arith.constant 0 : i64
      %1221 = func.call @cc_make_closure(%1219, %1220) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1222 = arith.addi %1221, %__rlasp_stack_elide_zero_54 : i64
      %1223 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1224 = arith.constant 4 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = func.call @cc_nil_value() : () -> i64
      %1227 = func.call @cc_intern(%1225, %1226) : (i64, i64) -> i64
      %1228 = func.call @cc_nil_value() : () -> i64
      %1229 = func.call @cc_cons(%1227, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_values_pack(%1229) : (i64) -> i64
      func.call @stack_push_pointer(%1227) : (i64) -> ()
      %1231 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1232 = arith.constant 13 : i64
      %1233 = func.call @cc_make_string(%1231, %1232) : (!llvm.ptr, i64) -> i64
      %1234 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1235 = arith.constant 11 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = func.call @cc_intern(%1233, %1236) : (i64, i64) -> i64
      %1238 = func.call @cc_nil_value() : () -> i64
      %1239 = func.call @cc_cons(%1237, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_values_pack(%1239) : (i64) -> i64
      func.call @stack_push_pointer(%1237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = func.call @cc_cons(%1242, %1241) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1244 = arith.addi %1243, %__rlasp_stack_elide_zero_55 : i64
      %1245 = func.call @stack_pop_pointer() : () -> i64
      %1246 = func.call @cc_cons(%1245, %1244) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1247 = arith.addi %1246, %__rlasp_stack_elide_zero_56 : i64
      %1248 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1249 = arith.constant 11 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1252 = arith.constant 7 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_intern(%1250, %1253) : (i64, i64) -> i64
      %1255 = func.call @cc_nil_value() : () -> i64
      %1256 = func.call @cc_cons(%1254, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_values_pack(%1256) : (i64) -> i64
      %1258 = func.call @cc_nil_value() : () -> i64
      %1259 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1260 = arith.constant 4 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1263 = arith.constant 7 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = func.call @cc_intern(%1261, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_nil_value() : () -> i64
      %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
      %1268 = func.call @cc_values_pack(%1267) : (i64) -> i64
      %1269 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1270 = arith.constant 5 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = func.call @cc_nil_value() : () -> i64
      %1273 = func.call @cc_intern(%1271, %1272) : (i64, i64) -> i64
      %1274 = func.call @cc_nil_value() : () -> i64
      %1275 = func.call @cc_cons(%1273, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_values_pack(%1275) : (i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1277 = arith.addi %1273, %__rlasp_stack_elide_zero_57 : i64
      %1278 = func.call @cc_nil_value() : () -> i64
      %1279 = func.call @cc_errorp(%1109) : (i64) -> i64
      %1280 = arith.cmpi ne, %1279, %1278 : i64
      %1281 = arith.cmpi eq, %1278, %1278 : i64
      %1282 = arith.andi %1280, %1281 : i1
      %1283 = scf.if %1282 -> (i64) {
        scf.yield %1109 : i64
      } else {
        scf.yield %1278 : i64
      }
      %1284 = func.call @cc_errorp(%1170) : (i64) -> i64
      %1285 = arith.cmpi ne, %1284, %1278 : i64
      %1286 = arith.cmpi eq, %1283, %1278 : i64
      %1287 = arith.andi %1285, %1286 : i1
      %1288 = scf.if %1287 -> (i64) {
        scf.yield %1170 : i64
      } else {
        scf.yield %1283 : i64
      }
      %1289 = func.call @cc_errorp(%1222) : (i64) -> i64
      %1290 = arith.cmpi ne, %1289, %1278 : i64
      %1291 = arith.cmpi eq, %1288, %1278 : i64
      %1292 = arith.andi %1290, %1291 : i1
      %1293 = scf.if %1292 -> (i64) {
        scf.yield %1222 : i64
      } else {
        scf.yield %1288 : i64
      }
      %1294 = func.call @cc_errorp(%1247) : (i64) -> i64
      %1295 = arith.cmpi ne, %1294, %1278 : i64
      %1296 = arith.cmpi eq, %1293, %1278 : i64
      %1297 = arith.andi %1295, %1296 : i1
      %1298 = scf.if %1297 -> (i64) {
        scf.yield %1247 : i64
      } else {
        scf.yield %1293 : i64
      }
      %1299 = func.call @cc_errorp(%1254) : (i64) -> i64
      %1300 = arith.cmpi ne, %1299, %1278 : i64
      %1301 = arith.cmpi eq, %1298, %1278 : i64
      %1302 = arith.andi %1300, %1301 : i1
      %1303 = scf.if %1302 -> (i64) {
        scf.yield %1254 : i64
      } else {
        scf.yield %1298 : i64
      }
      %1304 = func.call @cc_errorp(%1258) : (i64) -> i64
      %1305 = arith.cmpi ne, %1304, %1278 : i64
      %1306 = arith.cmpi eq, %1303, %1278 : i64
      %1307 = arith.andi %1305, %1306 : i1
      %1308 = scf.if %1307 -> (i64) {
        scf.yield %1258 : i64
      } else {
        scf.yield %1303 : i64
      }
      %1309 = func.call @cc_errorp(%1265) : (i64) -> i64
      %1310 = arith.cmpi ne, %1309, %1278 : i64
      %1311 = arith.cmpi eq, %1308, %1278 : i64
      %1312 = arith.andi %1310, %1311 : i1
      %1313 = scf.if %1312 -> (i64) {
        scf.yield %1265 : i64
      } else {
        scf.yield %1308 : i64
      }
      %1314 = func.call @cc_errorp(%1277) : (i64) -> i64
      %1315 = arith.cmpi ne, %1314, %1278 : i64
      %1316 = arith.cmpi eq, %1313, %1278 : i64
      %1317 = arith.andi %1315, %1316 : i1
      %1318 = scf.if %1317 -> (i64) {
        scf.yield %1277 : i64
      } else {
        scf.yield %1313 : i64
      }
      %1319 = arith.cmpi ne, %1318, %1278 : i64
      scf.if %1319 {
        func.call @stack_push_pointer(%1318) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1109) : (i64) -> ()
        func.call @stack_push_pointer(%1170) : (i64) -> ()
        func.call @stack_push_pointer(%1222) : (i64) -> ()
        func.call @stack_push_pointer(%1247) : (i64) -> ()
        func.call @stack_push_pointer(%1254) : (i64) -> ()
        func.call @stack_push_pointer(%1258) : (i64) -> ()
        func.call @stack_push_pointer(%1265) : (i64) -> ()
        func.call @stack_push_pointer(%1277) : (i64) -> ()
        %1320 = llvm.mlir.addressof @str99 : !llvm.ptr
        %1321 = func.call @cc_make_function_ref_const(%1320) : (!llvm.ptr) -> i64
        %1322 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1321, %1322) : (i64, i64) -> ()
      }
      %1323 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1323 : i64
    }
    %1324 = func.call @cc_nil_value() : () -> i64
    %1325 = func.call @cc_errorp(%1100) : (i64) -> i64
    %1326 = arith.cmpi ne, %1325, %1324 : i64
    %1327 = scf.if %1326 -> (i64) {
      scf.yield %1100 : i64
    } else {
      %1328 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1329 = arith.constant 11 : i64
      %1330 = func.call @cc_make_string(%1328, %1329) : (!llvm.ptr, i64) -> i64
      %1331 = func.call @cc_nil_value() : () -> i64
      %1332 = func.call @cc_intern(%1330, %1331) : (i64, i64) -> i64
      %1333 = func.call @cc_nil_value() : () -> i64
      %1334 = func.call @cc_cons(%1332, %1333) : (i64, i64) -> i64
      %1335 = func.call @cc_values_pack(%1334) : (i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1336 = arith.addi %1332, %__rlasp_stack_elide_zero_58 : i64
      %1337 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1338 = arith.constant 13 : i64
      %1339 = func.call @cc_make_string(%1337, %1338) : (!llvm.ptr, i64) -> i64
      %1340 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1341 = arith.constant 11 : i64
      %1342 = func.call @cc_make_string(%1340, %1341) : (!llvm.ptr, i64) -> i64
      %1343 = func.call @cc_intern(%1339, %1342) : (i64, i64) -> i64
      %1344 = func.call @cc_nil_value() : () -> i64
      %1345 = func.call @cc_cons(%1343, %1344) : (i64, i64) -> i64
      %1346 = func.call @cc_values_pack(%1345) : (i64) -> i64
      func.call @stack_push_pointer(%1343) : (i64) -> ()
      %1347 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1348 = arith.constant 6 : i64
      %1349 = func.call @cc_make_string(%1347, %1348) : (!llvm.ptr, i64) -> i64
      %1350 = func.call @cc_nil_value() : () -> i64
      %1351 = func.call @cc_intern(%1349, %1350) : (i64, i64) -> i64
      %1352 = func.call @cc_nil_value() : () -> i64
      %1353 = func.call @cc_cons(%1351, %1352) : (i64, i64) -> i64
      %1354 = func.call @cc_values_pack(%1353) : (i64) -> i64
      func.call @stack_push_pointer(%1351) : (i64) -> ()
      %1355 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1356 = arith.constant 19 : i64
      %1357 = func.call @cc_make_string(%1355, %1356) : (!llvm.ptr, i64) -> i64
      %1358 = func.call @cc_nil_value() : () -> i64
      %1359 = func.call @cc_intern(%1357, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_cons(%1359, %1360) : (i64, i64) -> i64
      %1362 = func.call @cc_values_pack(%1361) : (i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      %1363 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1364 = arith.constant 6 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      %1366 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1367 = arith.constant 11 : i64
      %1368 = func.call @cc_make_string(%1366, %1367) : (!llvm.ptr, i64) -> i64
      %1369 = func.call @cc_intern(%1365, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_nil_value() : () -> i64
      %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
      %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
      func.call @stack_push_pointer(%1369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1373 = func.call @stack_pop_pointer() : () -> i64
      %1374 = func.call @stack_pop_pointer() : () -> i64
      %1375 = func.call @cc_cons(%1374, %1373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @cc_cons(%1377, %1376) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1379 = arith.addi %1378, %__rlasp_stack_elide_zero_59 : i64
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @cc_cons(%1380, %1379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @cc_cons(%1383, %1382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1385 = arith.addi %1384, %__rlasp_stack_elide_zero_60 : i64
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @cc_cons(%1386, %1385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1388 = arith.addi %1387, %__rlasp_stack_elide_zero_61 : i64
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @cc_cons(%1389, %1388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1390) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @cc_cons(%1392, %1391) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1394 = arith.addi %1393, %__rlasp_stack_elide_zero_62 : i64
      %1395 = func.call @stack_pop_pointer() : () -> i64
      %1396 = func.call @cc_cons(%1395, %1394) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1397 = arith.addi %1396, %__rlasp_stack_elide_zero_63 : i64
      %1446 = arith.constant 209815645192199 : i64
      %1447 = arith.constant 0 : i64
      %1448 = func.call @cc_make_closure(%1446, %1447) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1449 = arith.addi %1448, %__rlasp_stack_elide_zero_64 : i64
      %1450 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1451 = arith.constant 4 : i64
      %1452 = func.call @cc_make_string(%1450, %1451) : (!llvm.ptr, i64) -> i64
      %1453 = func.call @cc_nil_value() : () -> i64
      %1454 = func.call @cc_intern(%1452, %1453) : (i64, i64) -> i64
      %1455 = func.call @cc_nil_value() : () -> i64
      %1456 = func.call @cc_cons(%1454, %1455) : (i64, i64) -> i64
      %1457 = func.call @cc_values_pack(%1456) : (i64) -> i64
      func.call @stack_push_pointer(%1454) : (i64) -> ()
      %1458 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1459 = arith.constant 13 : i64
      %1460 = func.call @cc_make_string(%1458, %1459) : (!llvm.ptr, i64) -> i64
      %1461 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1462 = arith.constant 11 : i64
      %1463 = func.call @cc_make_string(%1461, %1462) : (!llvm.ptr, i64) -> i64
      %1464 = func.call @cc_intern(%1460, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_nil_value() : () -> i64
      %1466 = func.call @cc_cons(%1464, %1465) : (i64, i64) -> i64
      %1467 = func.call @cc_values_pack(%1466) : (i64) -> i64
      func.call @stack_push_pointer(%1464) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1468 = func.call @stack_pop_pointer() : () -> i64
      %1469 = func.call @stack_pop_pointer() : () -> i64
      %1470 = func.call @cc_cons(%1469, %1468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1471 = arith.addi %1470, %__rlasp_stack_elide_zero_65 : i64
      %1472 = func.call @stack_pop_pointer() : () -> i64
      %1473 = func.call @cc_cons(%1472, %1471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1474 = arith.addi %1473, %__rlasp_stack_elide_zero_66 : i64
      %1475 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1476 = arith.constant 11 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1479 = arith.constant 7 : i64
      %1480 = func.call @cc_make_string(%1478, %1479) : (!llvm.ptr, i64) -> i64
      %1481 = func.call @cc_intern(%1477, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_nil_value() : () -> i64
      %1483 = func.call @cc_cons(%1481, %1482) : (i64, i64) -> i64
      %1484 = func.call @cc_values_pack(%1483) : (i64) -> i64
      %1485 = func.call @cc_nil_value() : () -> i64
      %1486 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1487 = arith.constant 4 : i64
      %1488 = func.call @cc_make_string(%1486, %1487) : (!llvm.ptr, i64) -> i64
      %1489 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1490 = arith.constant 7 : i64
      %1491 = func.call @cc_make_string(%1489, %1490) : (!llvm.ptr, i64) -> i64
      %1492 = func.call @cc_intern(%1488, %1491) : (i64, i64) -> i64
      %1493 = func.call @cc_nil_value() : () -> i64
      %1494 = func.call @cc_cons(%1492, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_values_pack(%1494) : (i64) -> i64
      %1496 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1497 = arith.constant 5 : i64
      %1498 = func.call @cc_make_string(%1496, %1497) : (!llvm.ptr, i64) -> i64
      %1499 = func.call @cc_nil_value() : () -> i64
      %1500 = func.call @cc_intern(%1498, %1499) : (i64, i64) -> i64
      %1501 = func.call @cc_nil_value() : () -> i64
      %1502 = func.call @cc_cons(%1500, %1501) : (i64, i64) -> i64
      %1503 = func.call @cc_values_pack(%1502) : (i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1504 = arith.addi %1500, %__rlasp_stack_elide_zero_67 : i64
      %1505 = func.call @cc_nil_value() : () -> i64
      %1506 = func.call @cc_errorp(%1336) : (i64) -> i64
      %1507 = arith.cmpi ne, %1506, %1505 : i64
      %1508 = arith.cmpi eq, %1505, %1505 : i64
      %1509 = arith.andi %1507, %1508 : i1
      %1510 = scf.if %1509 -> (i64) {
        scf.yield %1336 : i64
      } else {
        scf.yield %1505 : i64
      }
      %1511 = func.call @cc_errorp(%1397) : (i64) -> i64
      %1512 = arith.cmpi ne, %1511, %1505 : i64
      %1513 = arith.cmpi eq, %1510, %1505 : i64
      %1514 = arith.andi %1512, %1513 : i1
      %1515 = scf.if %1514 -> (i64) {
        scf.yield %1397 : i64
      } else {
        scf.yield %1510 : i64
      }
      %1516 = func.call @cc_errorp(%1449) : (i64) -> i64
      %1517 = arith.cmpi ne, %1516, %1505 : i64
      %1518 = arith.cmpi eq, %1515, %1505 : i64
      %1519 = arith.andi %1517, %1518 : i1
      %1520 = scf.if %1519 -> (i64) {
        scf.yield %1449 : i64
      } else {
        scf.yield %1515 : i64
      }
      %1521 = func.call @cc_errorp(%1474) : (i64) -> i64
      %1522 = arith.cmpi ne, %1521, %1505 : i64
      %1523 = arith.cmpi eq, %1520, %1505 : i64
      %1524 = arith.andi %1522, %1523 : i1
      %1525 = scf.if %1524 -> (i64) {
        scf.yield %1474 : i64
      } else {
        scf.yield %1520 : i64
      }
      %1526 = func.call @cc_errorp(%1481) : (i64) -> i64
      %1527 = arith.cmpi ne, %1526, %1505 : i64
      %1528 = arith.cmpi eq, %1525, %1505 : i64
      %1529 = arith.andi %1527, %1528 : i1
      %1530 = scf.if %1529 -> (i64) {
        scf.yield %1481 : i64
      } else {
        scf.yield %1525 : i64
      }
      %1531 = func.call @cc_errorp(%1485) : (i64) -> i64
      %1532 = arith.cmpi ne, %1531, %1505 : i64
      %1533 = arith.cmpi eq, %1530, %1505 : i64
      %1534 = arith.andi %1532, %1533 : i1
      %1535 = scf.if %1534 -> (i64) {
        scf.yield %1485 : i64
      } else {
        scf.yield %1530 : i64
      }
      %1536 = func.call @cc_errorp(%1492) : (i64) -> i64
      %1537 = arith.cmpi ne, %1536, %1505 : i64
      %1538 = arith.cmpi eq, %1535, %1505 : i64
      %1539 = arith.andi %1537, %1538 : i1
      %1540 = scf.if %1539 -> (i64) {
        scf.yield %1492 : i64
      } else {
        scf.yield %1535 : i64
      }
      %1541 = func.call @cc_errorp(%1504) : (i64) -> i64
      %1542 = arith.cmpi ne, %1541, %1505 : i64
      %1543 = arith.cmpi eq, %1540, %1505 : i64
      %1544 = arith.andi %1542, %1543 : i1
      %1545 = scf.if %1544 -> (i64) {
        scf.yield %1504 : i64
      } else {
        scf.yield %1540 : i64
      }
      %1546 = arith.cmpi ne, %1545, %1505 : i64
      scf.if %1546 {
        func.call @stack_push_pointer(%1545) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1336) : (i64) -> ()
        func.call @stack_push_pointer(%1397) : (i64) -> ()
        func.call @stack_push_pointer(%1449) : (i64) -> ()
        func.call @stack_push_pointer(%1474) : (i64) -> ()
        func.call @stack_push_pointer(%1481) : (i64) -> ()
        func.call @stack_push_pointer(%1485) : (i64) -> ()
        func.call @stack_push_pointer(%1492) : (i64) -> ()
        func.call @stack_push_pointer(%1504) : (i64) -> ()
        %1547 = llvm.mlir.addressof @str116 : !llvm.ptr
        %1548 = func.call @cc_make_function_ref_const(%1547) : (!llvm.ptr) -> i64
        %1549 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1548, %1549) : (i64, i64) -> ()
      }
      %1550 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1550 : i64
    }
    %1551 = func.call @cc_nil_value() : () -> i64
    %1552 = func.call @cc_errorp(%1327) : (i64) -> i64
    %1553 = arith.cmpi ne, %1552, %1551 : i64
    %1554 = scf.if %1553 -> (i64) {
      scf.yield %1327 : i64
    } else {
      %1555 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1556 = arith.constant 11 : i64
      %1557 = func.call @cc_make_string(%1555, %1556) : (!llvm.ptr, i64) -> i64
      %1558 = func.call @cc_nil_value() : () -> i64
      %1559 = func.call @cc_intern(%1557, %1558) : (i64, i64) -> i64
      %1560 = func.call @cc_nil_value() : () -> i64
      %1561 = func.call @cc_cons(%1559, %1560) : (i64, i64) -> i64
      %1562 = func.call @cc_values_pack(%1561) : (i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1563 = arith.addi %1559, %__rlasp_stack_elide_zero_68 : i64
      %1564 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1565 = arith.constant 13 : i64
      %1566 = func.call @cc_make_string(%1564, %1565) : (!llvm.ptr, i64) -> i64
      %1567 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1568 = arith.constant 11 : i64
      %1569 = func.call @cc_make_string(%1567, %1568) : (!llvm.ptr, i64) -> i64
      %1570 = func.call @cc_intern(%1566, %1569) : (i64, i64) -> i64
      %1571 = func.call @cc_nil_value() : () -> i64
      %1572 = func.call @cc_cons(%1570, %1571) : (i64, i64) -> i64
      %1573 = func.call @cc_values_pack(%1572) : (i64) -> i64
      func.call @stack_push_pointer(%1570) : (i64) -> ()
      %1574 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1575 = arith.constant 6 : i64
      %1576 = func.call @cc_make_string(%1574, %1575) : (!llvm.ptr, i64) -> i64
      %1577 = func.call @cc_nil_value() : () -> i64
      %1578 = func.call @cc_intern(%1576, %1577) : (i64, i64) -> i64
      %1579 = func.call @cc_nil_value() : () -> i64
      %1580 = func.call @cc_cons(%1578, %1579) : (i64, i64) -> i64
      %1581 = func.call @cc_values_pack(%1580) : (i64) -> i64
      func.call @stack_push_pointer(%1578) : (i64) -> ()
      %1582 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1583 = arith.constant 19 : i64
      %1584 = func.call @cc_make_string(%1582, %1583) : (!llvm.ptr, i64) -> i64
      %1585 = func.call @cc_nil_value() : () -> i64
      %1586 = func.call @cc_intern(%1584, %1585) : (i64, i64) -> i64
      %1587 = func.call @cc_nil_value() : () -> i64
      %1588 = func.call @cc_cons(%1586, %1587) : (i64, i64) -> i64
      %1589 = func.call @cc_values_pack(%1588) : (i64) -> i64
      func.call @stack_push_pointer(%1586) : (i64) -> ()
      %1590 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1591 = arith.constant 10 : i64
      %1592 = func.call @cc_make_string(%1590, %1591) : (!llvm.ptr, i64) -> i64
      %1593 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1594 = arith.constant 11 : i64
      %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
      %1596 = func.call @cc_intern(%1592, %1595) : (i64, i64) -> i64
      %1597 = func.call @cc_nil_value() : () -> i64
      %1598 = func.call @cc_cons(%1596, %1597) : (i64, i64) -> i64
      %1599 = func.call @cc_values_pack(%1598) : (i64) -> i64
      func.call @stack_push_pointer(%1596) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1600 = func.call @stack_pop_pointer() : () -> i64
      %1601 = func.call @stack_pop_pointer() : () -> i64
      %1602 = func.call @cc_cons(%1601, %1600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1603 = func.call @stack_pop_pointer() : () -> i64
      %1604 = func.call @stack_pop_pointer() : () -> i64
      %1605 = func.call @cc_cons(%1604, %1603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1606 = arith.addi %1605, %__rlasp_stack_elide_zero_69 : i64
      %1607 = func.call @stack_pop_pointer() : () -> i64
      %1608 = func.call @cc_cons(%1607, %1606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1609 = func.call @stack_pop_pointer() : () -> i64
      %1610 = func.call @stack_pop_pointer() : () -> i64
      %1611 = func.call @cc_cons(%1610, %1609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1612 = arith.addi %1611, %__rlasp_stack_elide_zero_70 : i64
      %1613 = func.call @stack_pop_pointer() : () -> i64
      %1614 = func.call @cc_cons(%1613, %1612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1615 = arith.addi %1614, %__rlasp_stack_elide_zero_71 : i64
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @cc_cons(%1616, %1615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1618 = func.call @stack_pop_pointer() : () -> i64
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @cc_cons(%1619, %1618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1621 = arith.addi %1620, %__rlasp_stack_elide_zero_72 : i64
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @cc_cons(%1622, %1621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1624 = arith.addi %1623, %__rlasp_stack_elide_zero_73 : i64
      %1673 = arith.constant 209815645192200 : i64
      %1674 = arith.constant 0 : i64
      %1675 = func.call @cc_make_closure(%1673, %1674) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1676 = arith.addi %1675, %__rlasp_stack_elide_zero_74 : i64
      %1677 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1678 = arith.constant 4 : i64
      %1679 = func.call @cc_make_string(%1677, %1678) : (!llvm.ptr, i64) -> i64
      %1680 = func.call @cc_nil_value() : () -> i64
      %1681 = func.call @cc_intern(%1679, %1680) : (i64, i64) -> i64
      %1682 = func.call @cc_nil_value() : () -> i64
      %1683 = func.call @cc_cons(%1681, %1682) : (i64, i64) -> i64
      %1684 = func.call @cc_values_pack(%1683) : (i64) -> i64
      func.call @stack_push_pointer(%1681) : (i64) -> ()
      %1685 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1686 = arith.constant 13 : i64
      %1687 = func.call @cc_make_string(%1685, %1686) : (!llvm.ptr, i64) -> i64
      %1688 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1689 = arith.constant 11 : i64
      %1690 = func.call @cc_make_string(%1688, %1689) : (!llvm.ptr, i64) -> i64
      %1691 = func.call @cc_intern(%1687, %1690) : (i64, i64) -> i64
      %1692 = func.call @cc_nil_value() : () -> i64
      %1693 = func.call @cc_cons(%1691, %1692) : (i64, i64) -> i64
      %1694 = func.call @cc_values_pack(%1693) : (i64) -> i64
      func.call @stack_push_pointer(%1691) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @cc_cons(%1696, %1695) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1698 = arith.addi %1697, %__rlasp_stack_elide_zero_75 : i64
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_cons(%1699, %1698) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1701 = arith.addi %1700, %__rlasp_stack_elide_zero_76 : i64
      %1702 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1703 = arith.constant 11 : i64
      %1704 = func.call @cc_make_string(%1702, %1703) : (!llvm.ptr, i64) -> i64
      %1705 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1706 = arith.constant 7 : i64
      %1707 = func.call @cc_make_string(%1705, %1706) : (!llvm.ptr, i64) -> i64
      %1708 = func.call @cc_intern(%1704, %1707) : (i64, i64) -> i64
      %1709 = func.call @cc_nil_value() : () -> i64
      %1710 = func.call @cc_cons(%1708, %1709) : (i64, i64) -> i64
      %1711 = func.call @cc_values_pack(%1710) : (i64) -> i64
      %1712 = func.call @cc_nil_value() : () -> i64
      %1713 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1714 = arith.constant 4 : i64
      %1715 = func.call @cc_make_string(%1713, %1714) : (!llvm.ptr, i64) -> i64
      %1716 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1717 = arith.constant 7 : i64
      %1718 = func.call @cc_make_string(%1716, %1717) : (!llvm.ptr, i64) -> i64
      %1719 = func.call @cc_intern(%1715, %1718) : (i64, i64) -> i64
      %1720 = func.call @cc_nil_value() : () -> i64
      %1721 = func.call @cc_cons(%1719, %1720) : (i64, i64) -> i64
      %1722 = func.call @cc_values_pack(%1721) : (i64) -> i64
      %1723 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1724 = arith.constant 5 : i64
      %1725 = func.call @cc_make_string(%1723, %1724) : (!llvm.ptr, i64) -> i64
      %1726 = func.call @cc_nil_value() : () -> i64
      %1727 = func.call @cc_intern(%1725, %1726) : (i64, i64) -> i64
      %1728 = func.call @cc_nil_value() : () -> i64
      %1729 = func.call @cc_cons(%1727, %1728) : (i64, i64) -> i64
      %1730 = func.call @cc_values_pack(%1729) : (i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1731 = arith.addi %1727, %__rlasp_stack_elide_zero_77 : i64
      %1732 = func.call @cc_nil_value() : () -> i64
      %1733 = func.call @cc_errorp(%1563) : (i64) -> i64
      %1734 = arith.cmpi ne, %1733, %1732 : i64
      %1735 = arith.cmpi eq, %1732, %1732 : i64
      %1736 = arith.andi %1734, %1735 : i1
      %1737 = scf.if %1736 -> (i64) {
        scf.yield %1563 : i64
      } else {
        scf.yield %1732 : i64
      }
      %1738 = func.call @cc_errorp(%1624) : (i64) -> i64
      %1739 = arith.cmpi ne, %1738, %1732 : i64
      %1740 = arith.cmpi eq, %1737, %1732 : i64
      %1741 = arith.andi %1739, %1740 : i1
      %1742 = scf.if %1741 -> (i64) {
        scf.yield %1624 : i64
      } else {
        scf.yield %1737 : i64
      }
      %1743 = func.call @cc_errorp(%1676) : (i64) -> i64
      %1744 = arith.cmpi ne, %1743, %1732 : i64
      %1745 = arith.cmpi eq, %1742, %1732 : i64
      %1746 = arith.andi %1744, %1745 : i1
      %1747 = scf.if %1746 -> (i64) {
        scf.yield %1676 : i64
      } else {
        scf.yield %1742 : i64
      }
      %1748 = func.call @cc_errorp(%1701) : (i64) -> i64
      %1749 = arith.cmpi ne, %1748, %1732 : i64
      %1750 = arith.cmpi eq, %1747, %1732 : i64
      %1751 = arith.andi %1749, %1750 : i1
      %1752 = scf.if %1751 -> (i64) {
        scf.yield %1701 : i64
      } else {
        scf.yield %1747 : i64
      }
      %1753 = func.call @cc_errorp(%1708) : (i64) -> i64
      %1754 = arith.cmpi ne, %1753, %1732 : i64
      %1755 = arith.cmpi eq, %1752, %1732 : i64
      %1756 = arith.andi %1754, %1755 : i1
      %1757 = scf.if %1756 -> (i64) {
        scf.yield %1708 : i64
      } else {
        scf.yield %1752 : i64
      }
      %1758 = func.call @cc_errorp(%1712) : (i64) -> i64
      %1759 = arith.cmpi ne, %1758, %1732 : i64
      %1760 = arith.cmpi eq, %1757, %1732 : i64
      %1761 = arith.andi %1759, %1760 : i1
      %1762 = scf.if %1761 -> (i64) {
        scf.yield %1712 : i64
      } else {
        scf.yield %1757 : i64
      }
      %1763 = func.call @cc_errorp(%1719) : (i64) -> i64
      %1764 = arith.cmpi ne, %1763, %1732 : i64
      %1765 = arith.cmpi eq, %1762, %1732 : i64
      %1766 = arith.andi %1764, %1765 : i1
      %1767 = scf.if %1766 -> (i64) {
        scf.yield %1719 : i64
      } else {
        scf.yield %1762 : i64
      }
      %1768 = func.call @cc_errorp(%1731) : (i64) -> i64
      %1769 = arith.cmpi ne, %1768, %1732 : i64
      %1770 = arith.cmpi eq, %1767, %1732 : i64
      %1771 = arith.andi %1769, %1770 : i1
      %1772 = scf.if %1771 -> (i64) {
        scf.yield %1731 : i64
      } else {
        scf.yield %1767 : i64
      }
      %1773 = arith.cmpi ne, %1772, %1732 : i64
      scf.if %1773 {
        func.call @stack_push_pointer(%1772) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1563) : (i64) -> ()
        func.call @stack_push_pointer(%1624) : (i64) -> ()
        func.call @stack_push_pointer(%1676) : (i64) -> ()
        func.call @stack_push_pointer(%1701) : (i64) -> ()
        func.call @stack_push_pointer(%1708) : (i64) -> ()
        func.call @stack_push_pointer(%1712) : (i64) -> ()
        func.call @stack_push_pointer(%1719) : (i64) -> ()
        func.call @stack_push_pointer(%1731) : (i64) -> ()
        %1774 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1775 = func.call @cc_make_function_ref_const(%1774) : (!llvm.ptr) -> i64
        %1776 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1775, %1776) : (i64, i64) -> ()
      }
      %1777 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1777 : i64
    }
    %1778 = func.call @cc_nil_value() : () -> i64
    %1779 = func.call @cc_errorp(%1554) : (i64) -> i64
    %1780 = arith.cmpi ne, %1779, %1778 : i64
    %1781 = scf.if %1780 -> (i64) {
      scf.yield %1554 : i64
    } else {
      %1782 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1783 = arith.constant 11 : i64
      %1784 = func.call @cc_make_string(%1782, %1783) : (!llvm.ptr, i64) -> i64
      %1785 = func.call @cc_nil_value() : () -> i64
      %1786 = func.call @cc_intern(%1784, %1785) : (i64, i64) -> i64
      %1787 = func.call @cc_nil_value() : () -> i64
      %1788 = func.call @cc_cons(%1786, %1787) : (i64, i64) -> i64
      %1789 = func.call @cc_values_pack(%1788) : (i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1790 = arith.addi %1786, %__rlasp_stack_elide_zero_78 : i64
      %1791 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1792 = arith.constant 13 : i64
      %1793 = func.call @cc_make_string(%1791, %1792) : (!llvm.ptr, i64) -> i64
      %1794 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1795 = arith.constant 11 : i64
      %1796 = func.call @cc_make_string(%1794, %1795) : (!llvm.ptr, i64) -> i64
      %1797 = func.call @cc_intern(%1793, %1796) : (i64, i64) -> i64
      %1798 = func.call @cc_nil_value() : () -> i64
      %1799 = func.call @cc_cons(%1797, %1798) : (i64, i64) -> i64
      %1800 = func.call @cc_values_pack(%1799) : (i64) -> i64
      func.call @stack_push_pointer(%1797) : (i64) -> ()
      %1801 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1802 = arith.constant 6 : i64
      %1803 = func.call @cc_make_string(%1801, %1802) : (!llvm.ptr, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_intern(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = func.call @cc_cons(%1805, %1806) : (i64, i64) -> i64
      %1808 = func.call @cc_values_pack(%1807) : (i64) -> i64
      func.call @stack_push_pointer(%1805) : (i64) -> ()
      %1809 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1810 = arith.constant 19 : i64
      %1811 = func.call @cc_make_string(%1809, %1810) : (!llvm.ptr, i64) -> i64
      %1812 = func.call @cc_nil_value() : () -> i64
      %1813 = func.call @cc_intern(%1811, %1812) : (i64, i64) -> i64
      %1814 = func.call @cc_nil_value() : () -> i64
      %1815 = func.call @cc_cons(%1813, %1814) : (i64, i64) -> i64
      %1816 = func.call @cc_values_pack(%1815) : (i64) -> i64
      func.call @stack_push_pointer(%1813) : (i64) -> ()
      %1817 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1818 = arith.constant 13 : i64
      %1819 = func.call @cc_make_string(%1817, %1818) : (!llvm.ptr, i64) -> i64
      %1820 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1821 = arith.constant 11 : i64
      %1822 = func.call @cc_make_string(%1820, %1821) : (!llvm.ptr, i64) -> i64
      %1823 = func.call @cc_intern(%1819, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_cons(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_values_pack(%1825) : (i64) -> i64
      func.call @stack_push_pointer(%1823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1827 = func.call @stack_pop_pointer() : () -> i64
      %1828 = func.call @stack_pop_pointer() : () -> i64
      %1829 = func.call @cc_cons(%1828, %1827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1829) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @stack_pop_pointer() : () -> i64
      %1832 = func.call @cc_cons(%1831, %1830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1833 = arith.addi %1832, %__rlasp_stack_elide_zero_79 : i64
      %1834 = func.call @stack_pop_pointer() : () -> i64
      %1835 = func.call @cc_cons(%1834, %1833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1835) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1836 = func.call @stack_pop_pointer() : () -> i64
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @cc_cons(%1837, %1836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1839 = arith.addi %1838, %__rlasp_stack_elide_zero_80 : i64
      %1840 = func.call @stack_pop_pointer() : () -> i64
      %1841 = func.call @cc_cons(%1840, %1839) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1842 = arith.addi %1841, %__rlasp_stack_elide_zero_81 : i64
      %1843 = func.call @stack_pop_pointer() : () -> i64
      %1844 = func.call @cc_cons(%1843, %1842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1844) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @stack_pop_pointer() : () -> i64
      %1847 = func.call @cc_cons(%1846, %1845) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1848 = arith.addi %1847, %__rlasp_stack_elide_zero_82 : i64
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @cc_cons(%1849, %1848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1851 = arith.addi %1850, %__rlasp_stack_elide_zero_83 : i64
      %1900 = arith.constant 209815645192201 : i64
      %1901 = arith.constant 0 : i64
      %1902 = func.call @cc_make_closure(%1900, %1901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1903 = arith.addi %1902, %__rlasp_stack_elide_zero_84 : i64
      %1904 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1905 = arith.constant 4 : i64
      %1906 = func.call @cc_make_string(%1904, %1905) : (!llvm.ptr, i64) -> i64
      %1907 = func.call @cc_nil_value() : () -> i64
      %1908 = func.call @cc_intern(%1906, %1907) : (i64, i64) -> i64
      %1909 = func.call @cc_nil_value() : () -> i64
      %1910 = func.call @cc_cons(%1908, %1909) : (i64, i64) -> i64
      %1911 = func.call @cc_values_pack(%1910) : (i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1912 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1913 = arith.constant 13 : i64
      %1914 = func.call @cc_make_string(%1912, %1913) : (!llvm.ptr, i64) -> i64
      %1915 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1916 = arith.constant 11 : i64
      %1917 = func.call @cc_make_string(%1915, %1916) : (!llvm.ptr, i64) -> i64
      %1918 = func.call @cc_intern(%1914, %1917) : (i64, i64) -> i64
      %1919 = func.call @cc_nil_value() : () -> i64
      %1920 = func.call @cc_cons(%1918, %1919) : (i64, i64) -> i64
      %1921 = func.call @cc_values_pack(%1920) : (i64) -> i64
      func.call @stack_push_pointer(%1918) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1922 = func.call @stack_pop_pointer() : () -> i64
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @cc_cons(%1923, %1922) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1925 = arith.addi %1924, %__rlasp_stack_elide_zero_85 : i64
      %1926 = func.call @stack_pop_pointer() : () -> i64
      %1927 = func.call @cc_cons(%1926, %1925) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1928 = arith.addi %1927, %__rlasp_stack_elide_zero_86 : i64
      %1929 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1930 = arith.constant 11 : i64
      %1931 = func.call @cc_make_string(%1929, %1930) : (!llvm.ptr, i64) -> i64
      %1932 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1933 = arith.constant 7 : i64
      %1934 = func.call @cc_make_string(%1932, %1933) : (!llvm.ptr, i64) -> i64
      %1935 = func.call @cc_intern(%1931, %1934) : (i64, i64) -> i64
      %1936 = func.call @cc_nil_value() : () -> i64
      %1937 = func.call @cc_cons(%1935, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_values_pack(%1937) : (i64) -> i64
      %1939 = func.call @cc_nil_value() : () -> i64
      %1940 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1941 = arith.constant 4 : i64
      %1942 = func.call @cc_make_string(%1940, %1941) : (!llvm.ptr, i64) -> i64
      %1943 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1944 = arith.constant 7 : i64
      %1945 = func.call @cc_make_string(%1943, %1944) : (!llvm.ptr, i64) -> i64
      %1946 = func.call @cc_intern(%1942, %1945) : (i64, i64) -> i64
      %1947 = func.call @cc_nil_value() : () -> i64
      %1948 = func.call @cc_cons(%1946, %1947) : (i64, i64) -> i64
      %1949 = func.call @cc_values_pack(%1948) : (i64) -> i64
      %1950 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1951 = arith.constant 5 : i64
      %1952 = func.call @cc_make_string(%1950, %1951) : (!llvm.ptr, i64) -> i64
      %1953 = func.call @cc_nil_value() : () -> i64
      %1954 = func.call @cc_intern(%1952, %1953) : (i64, i64) -> i64
      %1955 = func.call @cc_nil_value() : () -> i64
      %1956 = func.call @cc_cons(%1954, %1955) : (i64, i64) -> i64
      %1957 = func.call @cc_values_pack(%1956) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1958 = arith.addi %1954, %__rlasp_stack_elide_zero_87 : i64
      %1959 = func.call @cc_nil_value() : () -> i64
      %1960 = func.call @cc_errorp(%1790) : (i64) -> i64
      %1961 = arith.cmpi ne, %1960, %1959 : i64
      %1962 = arith.cmpi eq, %1959, %1959 : i64
      %1963 = arith.andi %1961, %1962 : i1
      %1964 = scf.if %1963 -> (i64) {
        scf.yield %1790 : i64
      } else {
        scf.yield %1959 : i64
      }
      %1965 = func.call @cc_errorp(%1851) : (i64) -> i64
      %1966 = arith.cmpi ne, %1965, %1959 : i64
      %1967 = arith.cmpi eq, %1964, %1959 : i64
      %1968 = arith.andi %1966, %1967 : i1
      %1969 = scf.if %1968 -> (i64) {
        scf.yield %1851 : i64
      } else {
        scf.yield %1964 : i64
      }
      %1970 = func.call @cc_errorp(%1903) : (i64) -> i64
      %1971 = arith.cmpi ne, %1970, %1959 : i64
      %1972 = arith.cmpi eq, %1969, %1959 : i64
      %1973 = arith.andi %1971, %1972 : i1
      %1974 = scf.if %1973 -> (i64) {
        scf.yield %1903 : i64
      } else {
        scf.yield %1969 : i64
      }
      %1975 = func.call @cc_errorp(%1928) : (i64) -> i64
      %1976 = arith.cmpi ne, %1975, %1959 : i64
      %1977 = arith.cmpi eq, %1974, %1959 : i64
      %1978 = arith.andi %1976, %1977 : i1
      %1979 = scf.if %1978 -> (i64) {
        scf.yield %1928 : i64
      } else {
        scf.yield %1974 : i64
      }
      %1980 = func.call @cc_errorp(%1935) : (i64) -> i64
      %1981 = arith.cmpi ne, %1980, %1959 : i64
      %1982 = arith.cmpi eq, %1979, %1959 : i64
      %1983 = arith.andi %1981, %1982 : i1
      %1984 = scf.if %1983 -> (i64) {
        scf.yield %1935 : i64
      } else {
        scf.yield %1979 : i64
      }
      %1985 = func.call @cc_errorp(%1939) : (i64) -> i64
      %1986 = arith.cmpi ne, %1985, %1959 : i64
      %1987 = arith.cmpi eq, %1984, %1959 : i64
      %1988 = arith.andi %1986, %1987 : i1
      %1989 = scf.if %1988 -> (i64) {
        scf.yield %1939 : i64
      } else {
        scf.yield %1984 : i64
      }
      %1990 = func.call @cc_errorp(%1946) : (i64) -> i64
      %1991 = arith.cmpi ne, %1990, %1959 : i64
      %1992 = arith.cmpi eq, %1989, %1959 : i64
      %1993 = arith.andi %1991, %1992 : i1
      %1994 = scf.if %1993 -> (i64) {
        scf.yield %1946 : i64
      } else {
        scf.yield %1989 : i64
      }
      %1995 = func.call @cc_errorp(%1958) : (i64) -> i64
      %1996 = arith.cmpi ne, %1995, %1959 : i64
      %1997 = arith.cmpi eq, %1994, %1959 : i64
      %1998 = arith.andi %1996, %1997 : i1
      %1999 = scf.if %1998 -> (i64) {
        scf.yield %1958 : i64
      } else {
        scf.yield %1994 : i64
      }
      %2000 = arith.cmpi ne, %1999, %1959 : i64
      scf.if %2000 {
        func.call @stack_push_pointer(%1999) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1790) : (i64) -> ()
        func.call @stack_push_pointer(%1851) : (i64) -> ()
        func.call @stack_push_pointer(%1903) : (i64) -> ()
        func.call @stack_push_pointer(%1928) : (i64) -> ()
        func.call @stack_push_pointer(%1935) : (i64) -> ()
        func.call @stack_push_pointer(%1939) : (i64) -> ()
        func.call @stack_push_pointer(%1946) : (i64) -> ()
        func.call @stack_push_pointer(%1958) : (i64) -> ()
        %2001 = llvm.mlir.addressof @str150 : !llvm.ptr
        %2002 = func.call @cc_make_function_ref_const(%2001) : (!llvm.ptr) -> i64
        %2003 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2002, %2003) : (i64, i64) -> ()
      }
      %2004 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2004 : i64
    }
    %2005 = func.call @cc_nil_value() : () -> i64
    %2006 = func.call @cc_errorp(%1781) : (i64) -> i64
    %2007 = arith.cmpi ne, %2006, %2005 : i64
    %2008 = scf.if %2007 -> (i64) {
      scf.yield %1781 : i64
    } else {
      %2009 = llvm.mlir.addressof @str151 : !llvm.ptr
      %2010 = arith.constant 11 : i64
      %2011 = func.call @cc_make_string(%2009, %2010) : (!llvm.ptr, i64) -> i64
      %2012 = func.call @cc_nil_value() : () -> i64
      %2013 = func.call @cc_intern(%2011, %2012) : (i64, i64) -> i64
      %2014 = func.call @cc_nil_value() : () -> i64
      %2015 = func.call @cc_cons(%2013, %2014) : (i64, i64) -> i64
      %2016 = func.call @cc_values_pack(%2015) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2017 = arith.addi %2013, %__rlasp_stack_elide_zero_88 : i64
      %2018 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2019 = arith.constant 13 : i64
      %2020 = func.call @cc_make_string(%2018, %2019) : (!llvm.ptr, i64) -> i64
      %2021 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2022 = arith.constant 11 : i64
      %2023 = func.call @cc_make_string(%2021, %2022) : (!llvm.ptr, i64) -> i64
      %2024 = func.call @cc_intern(%2020, %2023) : (i64, i64) -> i64
      %2025 = func.call @cc_nil_value() : () -> i64
      %2026 = func.call @cc_cons(%2024, %2025) : (i64, i64) -> i64
      %2027 = func.call @cc_values_pack(%2026) : (i64) -> i64
      func.call @stack_push_pointer(%2024) : (i64) -> ()
      %2028 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2029 = arith.constant 6 : i64
      %2030 = func.call @cc_make_string(%2028, %2029) : (!llvm.ptr, i64) -> i64
      %2031 = func.call @cc_nil_value() : () -> i64
      %2032 = func.call @cc_intern(%2030, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = func.call @cc_cons(%2032, %2033) : (i64, i64) -> i64
      %2035 = func.call @cc_values_pack(%2034) : (i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      %2036 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2037 = arith.constant 19 : i64
      %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
      %2039 = func.call @cc_nil_value() : () -> i64
      %2040 = func.call @cc_intern(%2038, %2039) : (i64, i64) -> i64
      %2041 = func.call @cc_nil_value() : () -> i64
      %2042 = func.call @cc_cons(%2040, %2041) : (i64, i64) -> i64
      %2043 = func.call @cc_values_pack(%2042) : (i64) -> i64
      func.call @stack_push_pointer(%2040) : (i64) -> ()
      %2044 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2045 = arith.constant 10 : i64
      %2046 = func.call @cc_make_string(%2044, %2045) : (!llvm.ptr, i64) -> i64
      %2047 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2048 = arith.constant 11 : i64
      %2049 = func.call @cc_make_string(%2047, %2048) : (!llvm.ptr, i64) -> i64
      %2050 = func.call @cc_intern(%2046, %2049) : (i64, i64) -> i64
      %2051 = func.call @cc_nil_value() : () -> i64
      %2052 = func.call @cc_cons(%2050, %2051) : (i64, i64) -> i64
      %2053 = func.call @cc_values_pack(%2052) : (i64) -> i64
      func.call @stack_push_pointer(%2050) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2054 = func.call @stack_pop_pointer() : () -> i64
      %2055 = func.call @stack_pop_pointer() : () -> i64
      %2056 = func.call @cc_cons(%2055, %2054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2057 = func.call @stack_pop_pointer() : () -> i64
      %2058 = func.call @stack_pop_pointer() : () -> i64
      %2059 = func.call @cc_cons(%2058, %2057) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2060 = arith.addi %2059, %__rlasp_stack_elide_zero_89 : i64
      %2061 = func.call @stack_pop_pointer() : () -> i64
      %2062 = func.call @cc_cons(%2061, %2060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2063 = func.call @stack_pop_pointer() : () -> i64
      %2064 = func.call @stack_pop_pointer() : () -> i64
      %2065 = func.call @cc_cons(%2064, %2063) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2066 = arith.addi %2065, %__rlasp_stack_elide_zero_90 : i64
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @cc_cons(%2067, %2066) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2069 = arith.addi %2068, %__rlasp_stack_elide_zero_91 : i64
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @cc_cons(%2070, %2069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2071) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2072 = func.call @stack_pop_pointer() : () -> i64
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @cc_cons(%2073, %2072) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2075 = arith.addi %2074, %__rlasp_stack_elide_zero_92 : i64
      %2076 = func.call @stack_pop_pointer() : () -> i64
      %2077 = func.call @cc_cons(%2076, %2075) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2078 = arith.addi %2077, %__rlasp_stack_elide_zero_93 : i64
      %2127 = arith.constant 209815645192202 : i64
      %2128 = arith.constant 0 : i64
      %2129 = func.call @cc_make_closure(%2127, %2128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2130 = arith.addi %2129, %__rlasp_stack_elide_zero_94 : i64
      %2131 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2132 = arith.constant 4 : i64
      %2133 = func.call @cc_make_string(%2131, %2132) : (!llvm.ptr, i64) -> i64
      %2134 = func.call @cc_nil_value() : () -> i64
      %2135 = func.call @cc_intern(%2133, %2134) : (i64, i64) -> i64
      %2136 = func.call @cc_nil_value() : () -> i64
      %2137 = func.call @cc_cons(%2135, %2136) : (i64, i64) -> i64
      %2138 = func.call @cc_values_pack(%2137) : (i64) -> i64
      func.call @stack_push_pointer(%2135) : (i64) -> ()
      %2139 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2140 = arith.constant 13 : i64
      %2141 = func.call @cc_make_string(%2139, %2140) : (!llvm.ptr, i64) -> i64
      %2142 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2143 = arith.constant 11 : i64
      %2144 = func.call @cc_make_string(%2142, %2143) : (!llvm.ptr, i64) -> i64
      %2145 = func.call @cc_intern(%2141, %2144) : (i64, i64) -> i64
      %2146 = func.call @cc_nil_value() : () -> i64
      %2147 = func.call @cc_cons(%2145, %2146) : (i64, i64) -> i64
      %2148 = func.call @cc_values_pack(%2147) : (i64) -> i64
      func.call @stack_push_pointer(%2145) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2149 = func.call @stack_pop_pointer() : () -> i64
      %2150 = func.call @stack_pop_pointer() : () -> i64
      %2151 = func.call @cc_cons(%2150, %2149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2152 = arith.addi %2151, %__rlasp_stack_elide_zero_95 : i64
      %2153 = func.call @stack_pop_pointer() : () -> i64
      %2154 = func.call @cc_cons(%2153, %2152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2155 = arith.addi %2154, %__rlasp_stack_elide_zero_96 : i64
      %2156 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2157 = arith.constant 11 : i64
      %2158 = func.call @cc_make_string(%2156, %2157) : (!llvm.ptr, i64) -> i64
      %2159 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2160 = arith.constant 7 : i64
      %2161 = func.call @cc_make_string(%2159, %2160) : (!llvm.ptr, i64) -> i64
      %2162 = func.call @cc_intern(%2158, %2161) : (i64, i64) -> i64
      %2163 = func.call @cc_nil_value() : () -> i64
      %2164 = func.call @cc_cons(%2162, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_values_pack(%2164) : (i64) -> i64
      %2166 = func.call @cc_nil_value() : () -> i64
      %2167 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2168 = arith.constant 4 : i64
      %2169 = func.call @cc_make_string(%2167, %2168) : (!llvm.ptr, i64) -> i64
      %2170 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2171 = arith.constant 7 : i64
      %2172 = func.call @cc_make_string(%2170, %2171) : (!llvm.ptr, i64) -> i64
      %2173 = func.call @cc_intern(%2169, %2172) : (i64, i64) -> i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = func.call @cc_cons(%2173, %2174) : (i64, i64) -> i64
      %2176 = func.call @cc_values_pack(%2175) : (i64) -> i64
      %2177 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2178 = arith.constant 5 : i64
      %2179 = func.call @cc_make_string(%2177, %2178) : (!llvm.ptr, i64) -> i64
      %2180 = func.call @cc_nil_value() : () -> i64
      %2181 = func.call @cc_intern(%2179, %2180) : (i64, i64) -> i64
      %2182 = func.call @cc_nil_value() : () -> i64
      %2183 = func.call @cc_cons(%2181, %2182) : (i64, i64) -> i64
      %2184 = func.call @cc_values_pack(%2183) : (i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2185 = arith.addi %2181, %__rlasp_stack_elide_zero_97 : i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_errorp(%2017) : (i64) -> i64
      %2188 = arith.cmpi ne, %2187, %2186 : i64
      %2189 = arith.cmpi eq, %2186, %2186 : i64
      %2190 = arith.andi %2188, %2189 : i1
      %2191 = scf.if %2190 -> (i64) {
        scf.yield %2017 : i64
      } else {
        scf.yield %2186 : i64
      }
      %2192 = func.call @cc_errorp(%2078) : (i64) -> i64
      %2193 = arith.cmpi ne, %2192, %2186 : i64
      %2194 = arith.cmpi eq, %2191, %2186 : i64
      %2195 = arith.andi %2193, %2194 : i1
      %2196 = scf.if %2195 -> (i64) {
        scf.yield %2078 : i64
      } else {
        scf.yield %2191 : i64
      }
      %2197 = func.call @cc_errorp(%2130) : (i64) -> i64
      %2198 = arith.cmpi ne, %2197, %2186 : i64
      %2199 = arith.cmpi eq, %2196, %2186 : i64
      %2200 = arith.andi %2198, %2199 : i1
      %2201 = scf.if %2200 -> (i64) {
        scf.yield %2130 : i64
      } else {
        scf.yield %2196 : i64
      }
      %2202 = func.call @cc_errorp(%2155) : (i64) -> i64
      %2203 = arith.cmpi ne, %2202, %2186 : i64
      %2204 = arith.cmpi eq, %2201, %2186 : i64
      %2205 = arith.andi %2203, %2204 : i1
      %2206 = scf.if %2205 -> (i64) {
        scf.yield %2155 : i64
      } else {
        scf.yield %2201 : i64
      }
      %2207 = func.call @cc_errorp(%2162) : (i64) -> i64
      %2208 = arith.cmpi ne, %2207, %2186 : i64
      %2209 = arith.cmpi eq, %2206, %2186 : i64
      %2210 = arith.andi %2208, %2209 : i1
      %2211 = scf.if %2210 -> (i64) {
        scf.yield %2162 : i64
      } else {
        scf.yield %2206 : i64
      }
      %2212 = func.call @cc_errorp(%2166) : (i64) -> i64
      %2213 = arith.cmpi ne, %2212, %2186 : i64
      %2214 = arith.cmpi eq, %2211, %2186 : i64
      %2215 = arith.andi %2213, %2214 : i1
      %2216 = scf.if %2215 -> (i64) {
        scf.yield %2166 : i64
      } else {
        scf.yield %2211 : i64
      }
      %2217 = func.call @cc_errorp(%2173) : (i64) -> i64
      %2218 = arith.cmpi ne, %2217, %2186 : i64
      %2219 = arith.cmpi eq, %2216, %2186 : i64
      %2220 = arith.andi %2218, %2219 : i1
      %2221 = scf.if %2220 -> (i64) {
        scf.yield %2173 : i64
      } else {
        scf.yield %2216 : i64
      }
      %2222 = func.call @cc_errorp(%2185) : (i64) -> i64
      %2223 = arith.cmpi ne, %2222, %2186 : i64
      %2224 = arith.cmpi eq, %2221, %2186 : i64
      %2225 = arith.andi %2223, %2224 : i1
      %2226 = scf.if %2225 -> (i64) {
        scf.yield %2185 : i64
      } else {
        scf.yield %2221 : i64
      }
      %2227 = arith.cmpi ne, %2226, %2186 : i64
      scf.if %2227 {
        func.call @stack_push_pointer(%2226) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2017) : (i64) -> ()
        func.call @stack_push_pointer(%2078) : (i64) -> ()
        func.call @stack_push_pointer(%2130) : (i64) -> ()
        func.call @stack_push_pointer(%2155) : (i64) -> ()
        func.call @stack_push_pointer(%2162) : (i64) -> ()
        func.call @stack_push_pointer(%2166) : (i64) -> ()
        func.call @stack_push_pointer(%2173) : (i64) -> ()
        func.call @stack_push_pointer(%2185) : (i64) -> ()
        %2228 = llvm.mlir.addressof @str167 : !llvm.ptr
        %2229 = func.call @cc_make_function_ref_const(%2228) : (!llvm.ptr) -> i64
        %2230 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2229, %2230) : (i64, i64) -> ()
      }
      %2231 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2231 : i64
    }
    %2232 = func.call @cc_nil_value() : () -> i64
    %2233 = func.call @cc_errorp(%2008) : (i64) -> i64
    %2234 = arith.cmpi ne, %2233, %2232 : i64
    %2235 = scf.if %2234 -> (i64) {
      scf.yield %2008 : i64
    } else {
      %2236 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2237 = arith.constant 11 : i64
      %2238 = func.call @cc_make_string(%2236, %2237) : (!llvm.ptr, i64) -> i64
      %2239 = func.call @cc_nil_value() : () -> i64
      %2240 = func.call @cc_intern(%2238, %2239) : (i64, i64) -> i64
      %2241 = func.call @cc_nil_value() : () -> i64
      %2242 = func.call @cc_cons(%2240, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_values_pack(%2242) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2244 = arith.addi %2240, %__rlasp_stack_elide_zero_98 : i64
      %2245 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2246 = arith.constant 13 : i64
      %2247 = func.call @cc_make_string(%2245, %2246) : (!llvm.ptr, i64) -> i64
      %2248 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2249 = arith.constant 11 : i64
      %2250 = func.call @cc_make_string(%2248, %2249) : (!llvm.ptr, i64) -> i64
      %2251 = func.call @cc_intern(%2247, %2250) : (i64, i64) -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_cons(%2251, %2252) : (i64, i64) -> i64
      %2254 = func.call @cc_values_pack(%2253) : (i64) -> i64
      func.call @stack_push_pointer(%2251) : (i64) -> ()
      %2255 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2256 = arith.constant 6 : i64
      %2257 = func.call @cc_make_string(%2255, %2256) : (!llvm.ptr, i64) -> i64
      %2258 = func.call @cc_nil_value() : () -> i64
      %2259 = func.call @cc_intern(%2257, %2258) : (i64, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_cons(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_values_pack(%2261) : (i64) -> i64
      func.call @stack_push_pointer(%2259) : (i64) -> ()
      %2263 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2264 = arith.constant 19 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = func.call @cc_nil_value() : () -> i64
      %2267 = func.call @cc_intern(%2265, %2266) : (i64, i64) -> i64
      %2268 = func.call @cc_nil_value() : () -> i64
      %2269 = func.call @cc_cons(%2267, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_values_pack(%2269) : (i64) -> i64
      func.call @stack_push_pointer(%2267) : (i64) -> ()
      %2271 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2272 = arith.constant 14 : i64
      %2273 = func.call @cc_make_string(%2271, %2272) : (!llvm.ptr, i64) -> i64
      %2274 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2275 = arith.constant 11 : i64
      %2276 = func.call @cc_make_string(%2274, %2275) : (!llvm.ptr, i64) -> i64
      %2277 = func.call @cc_intern(%2273, %2276) : (i64, i64) -> i64
      %2278 = func.call @cc_nil_value() : () -> i64
      %2279 = func.call @cc_cons(%2277, %2278) : (i64, i64) -> i64
      %2280 = func.call @cc_values_pack(%2279) : (i64) -> i64
      func.call @stack_push_pointer(%2277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2281 = func.call @stack_pop_pointer() : () -> i64
      %2282 = func.call @stack_pop_pointer() : () -> i64
      %2283 = func.call @cc_cons(%2282, %2281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2283) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2284 = func.call @stack_pop_pointer() : () -> i64
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @cc_cons(%2285, %2284) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2287 = arith.addi %2286, %__rlasp_stack_elide_zero_99 : i64
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @cc_cons(%2288, %2287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2290 = func.call @stack_pop_pointer() : () -> i64
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @cc_cons(%2291, %2290) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2293 = arith.addi %2292, %__rlasp_stack_elide_zero_100 : i64
      %2294 = func.call @stack_pop_pointer() : () -> i64
      %2295 = func.call @cc_cons(%2294, %2293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2296 = arith.addi %2295, %__rlasp_stack_elide_zero_101 : i64
      %2297 = func.call @stack_pop_pointer() : () -> i64
      %2298 = func.call @cc_cons(%2297, %2296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2299 = func.call @stack_pop_pointer() : () -> i64
      %2300 = func.call @stack_pop_pointer() : () -> i64
      %2301 = func.call @cc_cons(%2300, %2299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2302 = arith.addi %2301, %__rlasp_stack_elide_zero_102 : i64
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2304 = func.call @cc_cons(%2303, %2302) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2305 = arith.addi %2304, %__rlasp_stack_elide_zero_103 : i64
      %2354 = arith.constant 209815645192203 : i64
      %2355 = arith.constant 0 : i64
      %2356 = func.call @cc_make_closure(%2354, %2355) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2357 = arith.addi %2356, %__rlasp_stack_elide_zero_104 : i64
      %2358 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2359 = arith.constant 4 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      %2361 = func.call @cc_nil_value() : () -> i64
      %2362 = func.call @cc_intern(%2360, %2361) : (i64, i64) -> i64
      %2363 = func.call @cc_nil_value() : () -> i64
      %2364 = func.call @cc_cons(%2362, %2363) : (i64, i64) -> i64
      %2365 = func.call @cc_values_pack(%2364) : (i64) -> i64
      func.call @stack_push_pointer(%2362) : (i64) -> ()
      %2366 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2367 = arith.constant 13 : i64
      %2368 = func.call @cc_make_string(%2366, %2367) : (!llvm.ptr, i64) -> i64
      %2369 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2370 = arith.constant 11 : i64
      %2371 = func.call @cc_make_string(%2369, %2370) : (!llvm.ptr, i64) -> i64
      %2372 = func.call @cc_intern(%2368, %2371) : (i64, i64) -> i64
      %2373 = func.call @cc_nil_value() : () -> i64
      %2374 = func.call @cc_cons(%2372, %2373) : (i64, i64) -> i64
      %2375 = func.call @cc_values_pack(%2374) : (i64) -> i64
      func.call @stack_push_pointer(%2372) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2376 = func.call @stack_pop_pointer() : () -> i64
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = func.call @cc_cons(%2377, %2376) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2379 = arith.addi %2378, %__rlasp_stack_elide_zero_105 : i64
      %2380 = func.call @stack_pop_pointer() : () -> i64
      %2381 = func.call @cc_cons(%2380, %2379) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2382 = arith.addi %2381, %__rlasp_stack_elide_zero_106 : i64
      %2383 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2384 = arith.constant 11 : i64
      %2385 = func.call @cc_make_string(%2383, %2384) : (!llvm.ptr, i64) -> i64
      %2386 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2387 = arith.constant 7 : i64
      %2388 = func.call @cc_make_string(%2386, %2387) : (!llvm.ptr, i64) -> i64
      %2389 = func.call @cc_intern(%2385, %2388) : (i64, i64) -> i64
      %2390 = func.call @cc_nil_value() : () -> i64
      %2391 = func.call @cc_cons(%2389, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_values_pack(%2391) : (i64) -> i64
      %2393 = func.call @cc_nil_value() : () -> i64
      %2394 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2395 = arith.constant 4 : i64
      %2396 = func.call @cc_make_string(%2394, %2395) : (!llvm.ptr, i64) -> i64
      %2397 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2398 = arith.constant 7 : i64
      %2399 = func.call @cc_make_string(%2397, %2398) : (!llvm.ptr, i64) -> i64
      %2400 = func.call @cc_intern(%2396, %2399) : (i64, i64) -> i64
      %2401 = func.call @cc_nil_value() : () -> i64
      %2402 = func.call @cc_cons(%2400, %2401) : (i64, i64) -> i64
      %2403 = func.call @cc_values_pack(%2402) : (i64) -> i64
      %2404 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2405 = arith.constant 5 : i64
      %2406 = func.call @cc_make_string(%2404, %2405) : (!llvm.ptr, i64) -> i64
      %2407 = func.call @cc_nil_value() : () -> i64
      %2408 = func.call @cc_intern(%2406, %2407) : (i64, i64) -> i64
      %2409 = func.call @cc_nil_value() : () -> i64
      %2410 = func.call @cc_cons(%2408, %2409) : (i64, i64) -> i64
      %2411 = func.call @cc_values_pack(%2410) : (i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2412 = arith.addi %2408, %__rlasp_stack_elide_zero_107 : i64
      %2413 = func.call @cc_nil_value() : () -> i64
      %2414 = func.call @cc_errorp(%2244) : (i64) -> i64
      %2415 = arith.cmpi ne, %2414, %2413 : i64
      %2416 = arith.cmpi eq, %2413, %2413 : i64
      %2417 = arith.andi %2415, %2416 : i1
      %2418 = scf.if %2417 -> (i64) {
        scf.yield %2244 : i64
      } else {
        scf.yield %2413 : i64
      }
      %2419 = func.call @cc_errorp(%2305) : (i64) -> i64
      %2420 = arith.cmpi ne, %2419, %2413 : i64
      %2421 = arith.cmpi eq, %2418, %2413 : i64
      %2422 = arith.andi %2420, %2421 : i1
      %2423 = scf.if %2422 -> (i64) {
        scf.yield %2305 : i64
      } else {
        scf.yield %2418 : i64
      }
      %2424 = func.call @cc_errorp(%2357) : (i64) -> i64
      %2425 = arith.cmpi ne, %2424, %2413 : i64
      %2426 = arith.cmpi eq, %2423, %2413 : i64
      %2427 = arith.andi %2425, %2426 : i1
      %2428 = scf.if %2427 -> (i64) {
        scf.yield %2357 : i64
      } else {
        scf.yield %2423 : i64
      }
      %2429 = func.call @cc_errorp(%2382) : (i64) -> i64
      %2430 = arith.cmpi ne, %2429, %2413 : i64
      %2431 = arith.cmpi eq, %2428, %2413 : i64
      %2432 = arith.andi %2430, %2431 : i1
      %2433 = scf.if %2432 -> (i64) {
        scf.yield %2382 : i64
      } else {
        scf.yield %2428 : i64
      }
      %2434 = func.call @cc_errorp(%2389) : (i64) -> i64
      %2435 = arith.cmpi ne, %2434, %2413 : i64
      %2436 = arith.cmpi eq, %2433, %2413 : i64
      %2437 = arith.andi %2435, %2436 : i1
      %2438 = scf.if %2437 -> (i64) {
        scf.yield %2389 : i64
      } else {
        scf.yield %2433 : i64
      }
      %2439 = func.call @cc_errorp(%2393) : (i64) -> i64
      %2440 = arith.cmpi ne, %2439, %2413 : i64
      %2441 = arith.cmpi eq, %2438, %2413 : i64
      %2442 = arith.andi %2440, %2441 : i1
      %2443 = scf.if %2442 -> (i64) {
        scf.yield %2393 : i64
      } else {
        scf.yield %2438 : i64
      }
      %2444 = func.call @cc_errorp(%2400) : (i64) -> i64
      %2445 = arith.cmpi ne, %2444, %2413 : i64
      %2446 = arith.cmpi eq, %2443, %2413 : i64
      %2447 = arith.andi %2445, %2446 : i1
      %2448 = scf.if %2447 -> (i64) {
        scf.yield %2400 : i64
      } else {
        scf.yield %2443 : i64
      }
      %2449 = func.call @cc_errorp(%2412) : (i64) -> i64
      %2450 = arith.cmpi ne, %2449, %2413 : i64
      %2451 = arith.cmpi eq, %2448, %2413 : i64
      %2452 = arith.andi %2450, %2451 : i1
      %2453 = scf.if %2452 -> (i64) {
        scf.yield %2412 : i64
      } else {
        scf.yield %2448 : i64
      }
      %2454 = arith.cmpi ne, %2453, %2413 : i64
      scf.if %2454 {
        func.call @stack_push_pointer(%2453) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2244) : (i64) -> ()
        func.call @stack_push_pointer(%2305) : (i64) -> ()
        func.call @stack_push_pointer(%2357) : (i64) -> ()
        func.call @stack_push_pointer(%2382) : (i64) -> ()
        func.call @stack_push_pointer(%2389) : (i64) -> ()
        func.call @stack_push_pointer(%2393) : (i64) -> ()
        func.call @stack_push_pointer(%2400) : (i64) -> ()
        func.call @stack_push_pointer(%2412) : (i64) -> ()
        %2455 = llvm.mlir.addressof @str184 : !llvm.ptr
        %2456 = func.call @cc_make_function_ref_const(%2455) : (!llvm.ptr) -> i64
        %2457 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2456, %2457) : (i64, i64) -> ()
      }
      %2458 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2458 : i64
    }
    %2459 = func.call @cc_nil_value() : () -> i64
    %2460 = func.call @cc_errorp(%2235) : (i64) -> i64
    %2461 = arith.cmpi ne, %2460, %2459 : i64
    %2462 = scf.if %2461 -> (i64) {
      scf.yield %2235 : i64
    } else {
      %2463 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2464 = arith.constant 12 : i64
      %2465 = func.call @cc_make_string(%2463, %2464) : (!llvm.ptr, i64) -> i64
      %2466 = func.call @cc_nil_value() : () -> i64
      %2467 = func.call @cc_intern(%2465, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_cons(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_values_pack(%2469) : (i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2471 = arith.addi %2467, %__rlasp_stack_elide_zero_108 : i64
      %2472 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2473 = arith.constant 13 : i64
      %2474 = func.call @cc_make_string(%2472, %2473) : (!llvm.ptr, i64) -> i64
      %2475 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2476 = arith.constant 11 : i64
      %2477 = func.call @cc_make_string(%2475, %2476) : (!llvm.ptr, i64) -> i64
      %2478 = func.call @cc_intern(%2474, %2477) : (i64, i64) -> i64
      %2479 = func.call @cc_nil_value() : () -> i64
      %2480 = func.call @cc_cons(%2478, %2479) : (i64, i64) -> i64
      %2481 = func.call @cc_values_pack(%2480) : (i64) -> i64
      func.call @stack_push_pointer(%2478) : (i64) -> ()
      %2482 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2483 = arith.constant 6 : i64
      %2484 = func.call @cc_make_string(%2482, %2483) : (!llvm.ptr, i64) -> i64
      %2485 = func.call @cc_nil_value() : () -> i64
      %2486 = func.call @cc_intern(%2484, %2485) : (i64, i64) -> i64
      %2487 = func.call @cc_nil_value() : () -> i64
      %2488 = func.call @cc_cons(%2486, %2487) : (i64, i64) -> i64
      %2489 = func.call @cc_values_pack(%2488) : (i64) -> i64
      func.call @stack_push_pointer(%2486) : (i64) -> ()
      %2490 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2491 = arith.constant 19 : i64
      %2492 = func.call @cc_make_string(%2490, %2491) : (!llvm.ptr, i64) -> i64
      %2493 = func.call @cc_nil_value() : () -> i64
      %2494 = func.call @cc_intern(%2492, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_nil_value() : () -> i64
      %2496 = func.call @cc_cons(%2494, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_values_pack(%2496) : (i64) -> i64
      func.call @stack_push_pointer(%2494) : (i64) -> ()
      %2498 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2499 = arith.constant 17 : i64
      %2500 = func.call @cc_make_string(%2498, %2499) : (!llvm.ptr, i64) -> i64
      %2501 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2502 = arith.constant 11 : i64
      %2503 = func.call @cc_make_string(%2501, %2502) : (!llvm.ptr, i64) -> i64
      %2504 = func.call @cc_intern(%2500, %2503) : (i64, i64) -> i64
      %2505 = func.call @cc_nil_value() : () -> i64
      %2506 = func.call @cc_cons(%2504, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_values_pack(%2506) : (i64) -> i64
      func.call @stack_push_pointer(%2504) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2508 = func.call @stack_pop_pointer() : () -> i64
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_cons(%2509, %2508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2511 = func.call @stack_pop_pointer() : () -> i64
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @cc_cons(%2512, %2511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2514 = arith.addi %2513, %__rlasp_stack_elide_zero_109 : i64
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @cc_cons(%2515, %2514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2516) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2517 = func.call @stack_pop_pointer() : () -> i64
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @cc_cons(%2518, %2517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2520 = arith.addi %2519, %__rlasp_stack_elide_zero_110 : i64
      %2521 = func.call @stack_pop_pointer() : () -> i64
      %2522 = func.call @cc_cons(%2521, %2520) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2523 = arith.addi %2522, %__rlasp_stack_elide_zero_111 : i64
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2525 = func.call @cc_cons(%2524, %2523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2525) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2526 = func.call @stack_pop_pointer() : () -> i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2527, %2526) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2529 = arith.addi %2528, %__rlasp_stack_elide_zero_112 : i64
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @cc_cons(%2530, %2529) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2532 = arith.addi %2531, %__rlasp_stack_elide_zero_113 : i64
      %2581 = arith.constant 209815645192204 : i64
      %2582 = arith.constant 0 : i64
      %2583 = func.call @cc_make_closure(%2581, %2582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2584 = arith.addi %2583, %__rlasp_stack_elide_zero_114 : i64
      %2585 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2586 = arith.constant 4 : i64
      %2587 = func.call @cc_make_string(%2585, %2586) : (!llvm.ptr, i64) -> i64
      %2588 = func.call @cc_nil_value() : () -> i64
      %2589 = func.call @cc_intern(%2587, %2588) : (i64, i64) -> i64
      %2590 = func.call @cc_nil_value() : () -> i64
      %2591 = func.call @cc_cons(%2589, %2590) : (i64, i64) -> i64
      %2592 = func.call @cc_values_pack(%2591) : (i64) -> i64
      func.call @stack_push_pointer(%2589) : (i64) -> ()
      %2593 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2594 = arith.constant 13 : i64
      %2595 = func.call @cc_make_string(%2593, %2594) : (!llvm.ptr, i64) -> i64
      %2596 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2597 = arith.constant 11 : i64
      %2598 = func.call @cc_make_string(%2596, %2597) : (!llvm.ptr, i64) -> i64
      %2599 = func.call @cc_intern(%2595, %2598) : (i64, i64) -> i64
      %2600 = func.call @cc_nil_value() : () -> i64
      %2601 = func.call @cc_cons(%2599, %2600) : (i64, i64) -> i64
      %2602 = func.call @cc_values_pack(%2601) : (i64) -> i64
      func.call @stack_push_pointer(%2599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @cc_cons(%2604, %2603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2606 = arith.addi %2605, %__rlasp_stack_elide_zero_115 : i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_cons(%2607, %2606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2609 = arith.addi %2608, %__rlasp_stack_elide_zero_116 : i64
      %2610 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2611 = arith.constant 11 : i64
      %2612 = func.call @cc_make_string(%2610, %2611) : (!llvm.ptr, i64) -> i64
      %2613 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2614 = arith.constant 7 : i64
      %2615 = func.call @cc_make_string(%2613, %2614) : (!llvm.ptr, i64) -> i64
      %2616 = func.call @cc_intern(%2612, %2615) : (i64, i64) -> i64
      %2617 = func.call @cc_nil_value() : () -> i64
      %2618 = func.call @cc_cons(%2616, %2617) : (i64, i64) -> i64
      %2619 = func.call @cc_values_pack(%2618) : (i64) -> i64
      %2620 = func.call @cc_nil_value() : () -> i64
      %2621 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2622 = arith.constant 4 : i64
      %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
      %2624 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2625 = arith.constant 7 : i64
      %2626 = func.call @cc_make_string(%2624, %2625) : (!llvm.ptr, i64) -> i64
      %2627 = func.call @cc_intern(%2623, %2626) : (i64, i64) -> i64
      %2628 = func.call @cc_nil_value() : () -> i64
      %2629 = func.call @cc_cons(%2627, %2628) : (i64, i64) -> i64
      %2630 = func.call @cc_values_pack(%2629) : (i64) -> i64
      %2631 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2632 = arith.constant 5 : i64
      %2633 = func.call @cc_make_string(%2631, %2632) : (!llvm.ptr, i64) -> i64
      %2634 = func.call @cc_nil_value() : () -> i64
      %2635 = func.call @cc_intern(%2633, %2634) : (i64, i64) -> i64
      %2636 = func.call @cc_nil_value() : () -> i64
      %2637 = func.call @cc_cons(%2635, %2636) : (i64, i64) -> i64
      %2638 = func.call @cc_values_pack(%2637) : (i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2639 = arith.addi %2635, %__rlasp_stack_elide_zero_117 : i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_errorp(%2471) : (i64) -> i64
      %2642 = arith.cmpi ne, %2641, %2640 : i64
      %2643 = arith.cmpi eq, %2640, %2640 : i64
      %2644 = arith.andi %2642, %2643 : i1
      %2645 = scf.if %2644 -> (i64) {
        scf.yield %2471 : i64
      } else {
        scf.yield %2640 : i64
      }
      %2646 = func.call @cc_errorp(%2532) : (i64) -> i64
      %2647 = arith.cmpi ne, %2646, %2640 : i64
      %2648 = arith.cmpi eq, %2645, %2640 : i64
      %2649 = arith.andi %2647, %2648 : i1
      %2650 = scf.if %2649 -> (i64) {
        scf.yield %2532 : i64
      } else {
        scf.yield %2645 : i64
      }
      %2651 = func.call @cc_errorp(%2584) : (i64) -> i64
      %2652 = arith.cmpi ne, %2651, %2640 : i64
      %2653 = arith.cmpi eq, %2650, %2640 : i64
      %2654 = arith.andi %2652, %2653 : i1
      %2655 = scf.if %2654 -> (i64) {
        scf.yield %2584 : i64
      } else {
        scf.yield %2650 : i64
      }
      %2656 = func.call @cc_errorp(%2609) : (i64) -> i64
      %2657 = arith.cmpi ne, %2656, %2640 : i64
      %2658 = arith.cmpi eq, %2655, %2640 : i64
      %2659 = arith.andi %2657, %2658 : i1
      %2660 = scf.if %2659 -> (i64) {
        scf.yield %2609 : i64
      } else {
        scf.yield %2655 : i64
      }
      %2661 = func.call @cc_errorp(%2616) : (i64) -> i64
      %2662 = arith.cmpi ne, %2661, %2640 : i64
      %2663 = arith.cmpi eq, %2660, %2640 : i64
      %2664 = arith.andi %2662, %2663 : i1
      %2665 = scf.if %2664 -> (i64) {
        scf.yield %2616 : i64
      } else {
        scf.yield %2660 : i64
      }
      %2666 = func.call @cc_errorp(%2620) : (i64) -> i64
      %2667 = arith.cmpi ne, %2666, %2640 : i64
      %2668 = arith.cmpi eq, %2665, %2640 : i64
      %2669 = arith.andi %2667, %2668 : i1
      %2670 = scf.if %2669 -> (i64) {
        scf.yield %2620 : i64
      } else {
        scf.yield %2665 : i64
      }
      %2671 = func.call @cc_errorp(%2627) : (i64) -> i64
      %2672 = arith.cmpi ne, %2671, %2640 : i64
      %2673 = arith.cmpi eq, %2670, %2640 : i64
      %2674 = arith.andi %2672, %2673 : i1
      %2675 = scf.if %2674 -> (i64) {
        scf.yield %2627 : i64
      } else {
        scf.yield %2670 : i64
      }
      %2676 = func.call @cc_errorp(%2639) : (i64) -> i64
      %2677 = arith.cmpi ne, %2676, %2640 : i64
      %2678 = arith.cmpi eq, %2675, %2640 : i64
      %2679 = arith.andi %2677, %2678 : i1
      %2680 = scf.if %2679 -> (i64) {
        scf.yield %2639 : i64
      } else {
        scf.yield %2675 : i64
      }
      %2681 = arith.cmpi ne, %2680, %2640 : i64
      scf.if %2681 {
        func.call @stack_push_pointer(%2680) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2471) : (i64) -> ()
        func.call @stack_push_pointer(%2532) : (i64) -> ()
        func.call @stack_push_pointer(%2584) : (i64) -> ()
        func.call @stack_push_pointer(%2609) : (i64) -> ()
        func.call @stack_push_pointer(%2616) : (i64) -> ()
        func.call @stack_push_pointer(%2620) : (i64) -> ()
        func.call @stack_push_pointer(%2627) : (i64) -> ()
        func.call @stack_push_pointer(%2639) : (i64) -> ()
        %2682 = llvm.mlir.addressof @str201 : !llvm.ptr
        %2683 = func.call @cc_make_function_ref_const(%2682) : (!llvm.ptr) -> i64
        %2684 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2683, %2684) : (i64, i64) -> ()
      }
      %2685 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2685 : i64
    }
    %2686 = func.call @cc_nil_value() : () -> i64
    %2687 = func.call @cc_errorp(%2462) : (i64) -> i64
    %2688 = arith.cmpi ne, %2687, %2686 : i64
    %2689 = scf.if %2688 -> (i64) {
      scf.yield %2462 : i64
    } else {
      %2690 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2691 = arith.constant 12 : i64
      %2692 = func.call @cc_make_string(%2690, %2691) : (!llvm.ptr, i64) -> i64
      %2693 = func.call @cc_nil_value() : () -> i64
      %2694 = func.call @cc_intern(%2692, %2693) : (i64, i64) -> i64
      %2695 = func.call @cc_nil_value() : () -> i64
      %2696 = func.call @cc_cons(%2694, %2695) : (i64, i64) -> i64
      %2697 = func.call @cc_values_pack(%2696) : (i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2698 = arith.addi %2694, %__rlasp_stack_elide_zero_118 : i64
      %2699 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2700 = arith.constant 13 : i64
      %2701 = func.call @cc_make_string(%2699, %2700) : (!llvm.ptr, i64) -> i64
      %2702 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2703 = arith.constant 11 : i64
      %2704 = func.call @cc_make_string(%2702, %2703) : (!llvm.ptr, i64) -> i64
      %2705 = func.call @cc_intern(%2701, %2704) : (i64, i64) -> i64
      %2706 = func.call @cc_nil_value() : () -> i64
      %2707 = func.call @cc_cons(%2705, %2706) : (i64, i64) -> i64
      %2708 = func.call @cc_values_pack(%2707) : (i64) -> i64
      func.call @stack_push_pointer(%2705) : (i64) -> ()
      %2709 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2710 = arith.constant 6 : i64
      %2711 = func.call @cc_make_string(%2709, %2710) : (!llvm.ptr, i64) -> i64
      %2712 = func.call @cc_nil_value() : () -> i64
      %2713 = func.call @cc_intern(%2711, %2712) : (i64, i64) -> i64
      %2714 = func.call @cc_nil_value() : () -> i64
      %2715 = func.call @cc_cons(%2713, %2714) : (i64, i64) -> i64
      %2716 = func.call @cc_values_pack(%2715) : (i64) -> i64
      func.call @stack_push_pointer(%2713) : (i64) -> ()
      %2717 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2718 = arith.constant 19 : i64
      %2719 = func.call @cc_make_string(%2717, %2718) : (!llvm.ptr, i64) -> i64
      %2720 = func.call @cc_nil_value() : () -> i64
      %2721 = func.call @cc_intern(%2719, %2720) : (i64, i64) -> i64
      %2722 = func.call @cc_nil_value() : () -> i64
      %2723 = func.call @cc_cons(%2721, %2722) : (i64, i64) -> i64
      %2724 = func.call @cc_values_pack(%2723) : (i64) -> i64
      func.call @stack_push_pointer(%2721) : (i64) -> ()
      %2725 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2726 = arith.constant 14 : i64
      %2727 = func.call @cc_make_string(%2725, %2726) : (!llvm.ptr, i64) -> i64
      %2728 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2729 = arith.constant 11 : i64
      %2730 = func.call @cc_make_string(%2728, %2729) : (!llvm.ptr, i64) -> i64
      %2731 = func.call @cc_intern(%2727, %2730) : (i64, i64) -> i64
      %2732 = func.call @cc_nil_value() : () -> i64
      %2733 = func.call @cc_cons(%2731, %2732) : (i64, i64) -> i64
      %2734 = func.call @cc_values_pack(%2733) : (i64) -> i64
      func.call @stack_push_pointer(%2731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @stack_pop_pointer() : () -> i64
      %2737 = func.call @cc_cons(%2736, %2735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2737) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @stack_pop_pointer() : () -> i64
      %2740 = func.call @cc_cons(%2739, %2738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2741 = arith.addi %2740, %__rlasp_stack_elide_zero_119 : i64
      %2742 = func.call @stack_pop_pointer() : () -> i64
      %2743 = func.call @cc_cons(%2742, %2741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2743) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2744 = func.call @stack_pop_pointer() : () -> i64
      %2745 = func.call @stack_pop_pointer() : () -> i64
      %2746 = func.call @cc_cons(%2745, %2744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2747 = arith.addi %2746, %__rlasp_stack_elide_zero_120 : i64
      %2748 = func.call @stack_pop_pointer() : () -> i64
      %2749 = func.call @cc_cons(%2748, %2747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2750 = arith.addi %2749, %__rlasp_stack_elide_zero_121 : i64
      %2751 = func.call @stack_pop_pointer() : () -> i64
      %2752 = func.call @cc_cons(%2751, %2750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @stack_pop_pointer() : () -> i64
      %2755 = func.call @cc_cons(%2754, %2753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2756 = arith.addi %2755, %__rlasp_stack_elide_zero_122 : i64
      %2757 = func.call @stack_pop_pointer() : () -> i64
      %2758 = func.call @cc_cons(%2757, %2756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2759 = arith.addi %2758, %__rlasp_stack_elide_zero_123 : i64
      %2808 = arith.constant 209815645192205 : i64
      %2809 = arith.constant 0 : i64
      %2810 = func.call @cc_make_closure(%2808, %2809) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2811 = arith.addi %2810, %__rlasp_stack_elide_zero_124 : i64
      %2812 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2813 = arith.constant 4 : i64
      %2814 = func.call @cc_make_string(%2812, %2813) : (!llvm.ptr, i64) -> i64
      %2815 = func.call @cc_nil_value() : () -> i64
      %2816 = func.call @cc_intern(%2814, %2815) : (i64, i64) -> i64
      %2817 = func.call @cc_nil_value() : () -> i64
      %2818 = func.call @cc_cons(%2816, %2817) : (i64, i64) -> i64
      %2819 = func.call @cc_values_pack(%2818) : (i64) -> i64
      func.call @stack_push_pointer(%2816) : (i64) -> ()
      %2820 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2821 = arith.constant 13 : i64
      %2822 = func.call @cc_make_string(%2820, %2821) : (!llvm.ptr, i64) -> i64
      %2823 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2824 = arith.constant 11 : i64
      %2825 = func.call @cc_make_string(%2823, %2824) : (!llvm.ptr, i64) -> i64
      %2826 = func.call @cc_intern(%2822, %2825) : (i64, i64) -> i64
      %2827 = func.call @cc_nil_value() : () -> i64
      %2828 = func.call @cc_cons(%2826, %2827) : (i64, i64) -> i64
      %2829 = func.call @cc_values_pack(%2828) : (i64) -> i64
      func.call @stack_push_pointer(%2826) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2830 = func.call @stack_pop_pointer() : () -> i64
      %2831 = func.call @stack_pop_pointer() : () -> i64
      %2832 = func.call @cc_cons(%2831, %2830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2833 = arith.addi %2832, %__rlasp_stack_elide_zero_125 : i64
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @cc_cons(%2834, %2833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2836 = arith.addi %2835, %__rlasp_stack_elide_zero_126 : i64
      %2837 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2838 = arith.constant 11 : i64
      %2839 = func.call @cc_make_string(%2837, %2838) : (!llvm.ptr, i64) -> i64
      %2840 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2841 = arith.constant 7 : i64
      %2842 = func.call @cc_make_string(%2840, %2841) : (!llvm.ptr, i64) -> i64
      %2843 = func.call @cc_intern(%2839, %2842) : (i64, i64) -> i64
      %2844 = func.call @cc_nil_value() : () -> i64
      %2845 = func.call @cc_cons(%2843, %2844) : (i64, i64) -> i64
      %2846 = func.call @cc_values_pack(%2845) : (i64) -> i64
      %2847 = func.call @cc_nil_value() : () -> i64
      %2848 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2849 = arith.constant 4 : i64
      %2850 = func.call @cc_make_string(%2848, %2849) : (!llvm.ptr, i64) -> i64
      %2851 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2852 = arith.constant 7 : i64
      %2853 = func.call @cc_make_string(%2851, %2852) : (!llvm.ptr, i64) -> i64
      %2854 = func.call @cc_intern(%2850, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_nil_value() : () -> i64
      %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
      %2857 = func.call @cc_values_pack(%2856) : (i64) -> i64
      %2858 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2859 = arith.constant 5 : i64
      %2860 = func.call @cc_make_string(%2858, %2859) : (!llvm.ptr, i64) -> i64
      %2861 = func.call @cc_nil_value() : () -> i64
      %2862 = func.call @cc_intern(%2860, %2861) : (i64, i64) -> i64
      %2863 = func.call @cc_nil_value() : () -> i64
      %2864 = func.call @cc_cons(%2862, %2863) : (i64, i64) -> i64
      %2865 = func.call @cc_values_pack(%2864) : (i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2866 = arith.addi %2862, %__rlasp_stack_elide_zero_127 : i64
      %2867 = func.call @cc_nil_value() : () -> i64
      %2868 = func.call @cc_errorp(%2698) : (i64) -> i64
      %2869 = arith.cmpi ne, %2868, %2867 : i64
      %2870 = arith.cmpi eq, %2867, %2867 : i64
      %2871 = arith.andi %2869, %2870 : i1
      %2872 = scf.if %2871 -> (i64) {
        scf.yield %2698 : i64
      } else {
        scf.yield %2867 : i64
      }
      %2873 = func.call @cc_errorp(%2759) : (i64) -> i64
      %2874 = arith.cmpi ne, %2873, %2867 : i64
      %2875 = arith.cmpi eq, %2872, %2867 : i64
      %2876 = arith.andi %2874, %2875 : i1
      %2877 = scf.if %2876 -> (i64) {
        scf.yield %2759 : i64
      } else {
        scf.yield %2872 : i64
      }
      %2878 = func.call @cc_errorp(%2811) : (i64) -> i64
      %2879 = arith.cmpi ne, %2878, %2867 : i64
      %2880 = arith.cmpi eq, %2877, %2867 : i64
      %2881 = arith.andi %2879, %2880 : i1
      %2882 = scf.if %2881 -> (i64) {
        scf.yield %2811 : i64
      } else {
        scf.yield %2877 : i64
      }
      %2883 = func.call @cc_errorp(%2836) : (i64) -> i64
      %2884 = arith.cmpi ne, %2883, %2867 : i64
      %2885 = arith.cmpi eq, %2882, %2867 : i64
      %2886 = arith.andi %2884, %2885 : i1
      %2887 = scf.if %2886 -> (i64) {
        scf.yield %2836 : i64
      } else {
        scf.yield %2882 : i64
      }
      %2888 = func.call @cc_errorp(%2843) : (i64) -> i64
      %2889 = arith.cmpi ne, %2888, %2867 : i64
      %2890 = arith.cmpi eq, %2887, %2867 : i64
      %2891 = arith.andi %2889, %2890 : i1
      %2892 = scf.if %2891 -> (i64) {
        scf.yield %2843 : i64
      } else {
        scf.yield %2887 : i64
      }
      %2893 = func.call @cc_errorp(%2847) : (i64) -> i64
      %2894 = arith.cmpi ne, %2893, %2867 : i64
      %2895 = arith.cmpi eq, %2892, %2867 : i64
      %2896 = arith.andi %2894, %2895 : i1
      %2897 = scf.if %2896 -> (i64) {
        scf.yield %2847 : i64
      } else {
        scf.yield %2892 : i64
      }
      %2898 = func.call @cc_errorp(%2854) : (i64) -> i64
      %2899 = arith.cmpi ne, %2898, %2867 : i64
      %2900 = arith.cmpi eq, %2897, %2867 : i64
      %2901 = arith.andi %2899, %2900 : i1
      %2902 = scf.if %2901 -> (i64) {
        scf.yield %2854 : i64
      } else {
        scf.yield %2897 : i64
      }
      %2903 = func.call @cc_errorp(%2866) : (i64) -> i64
      %2904 = arith.cmpi ne, %2903, %2867 : i64
      %2905 = arith.cmpi eq, %2902, %2867 : i64
      %2906 = arith.andi %2904, %2905 : i1
      %2907 = scf.if %2906 -> (i64) {
        scf.yield %2866 : i64
      } else {
        scf.yield %2902 : i64
      }
      %2908 = arith.cmpi ne, %2907, %2867 : i64
      scf.if %2908 {
        func.call @stack_push_pointer(%2907) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2698) : (i64) -> ()
        func.call @stack_push_pointer(%2759) : (i64) -> ()
        func.call @stack_push_pointer(%2811) : (i64) -> ()
        func.call @stack_push_pointer(%2836) : (i64) -> ()
        func.call @stack_push_pointer(%2843) : (i64) -> ()
        func.call @stack_push_pointer(%2847) : (i64) -> ()
        func.call @stack_push_pointer(%2854) : (i64) -> ()
        func.call @stack_push_pointer(%2866) : (i64) -> ()
        %2909 = llvm.mlir.addressof @str218 : !llvm.ptr
        %2910 = func.call @cc_make_function_ref_const(%2909) : (!llvm.ptr) -> i64
        %2911 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2910, %2911) : (i64, i64) -> ()
      }
      %2912 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2912 : i64
    }
    %2913 = func.call @cc_nil_value() : () -> i64
    %2914 = func.call @cc_errorp(%2689) : (i64) -> i64
    %2915 = arith.cmpi ne, %2914, %2913 : i64
    %2916 = scf.if %2915 -> (i64) {
      scf.yield %2689 : i64
    } else {
      %2917 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2918 = arith.constant 12 : i64
      %2919 = func.call @cc_make_string(%2917, %2918) : (!llvm.ptr, i64) -> i64
      %2920 = func.call @cc_nil_value() : () -> i64
      %2921 = func.call @cc_intern(%2919, %2920) : (i64, i64) -> i64
      %2922 = func.call @cc_nil_value() : () -> i64
      %2923 = func.call @cc_cons(%2921, %2922) : (i64, i64) -> i64
      %2924 = func.call @cc_values_pack(%2923) : (i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2925 = arith.addi %2921, %__rlasp_stack_elide_zero_128 : i64
      %2926 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2927 = arith.constant 13 : i64
      %2928 = func.call @cc_make_string(%2926, %2927) : (!llvm.ptr, i64) -> i64
      %2929 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2930 = arith.constant 11 : i64
      %2931 = func.call @cc_make_string(%2929, %2930) : (!llvm.ptr, i64) -> i64
      %2932 = func.call @cc_intern(%2928, %2931) : (i64, i64) -> i64
      %2933 = func.call @cc_nil_value() : () -> i64
      %2934 = func.call @cc_cons(%2932, %2933) : (i64, i64) -> i64
      %2935 = func.call @cc_values_pack(%2934) : (i64) -> i64
      func.call @stack_push_pointer(%2932) : (i64) -> ()
      %2936 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2937 = arith.constant 6 : i64
      %2938 = func.call @cc_make_string(%2936, %2937) : (!llvm.ptr, i64) -> i64
      %2939 = func.call @cc_nil_value() : () -> i64
      %2940 = func.call @cc_intern(%2938, %2939) : (i64, i64) -> i64
      %2941 = func.call @cc_nil_value() : () -> i64
      %2942 = func.call @cc_cons(%2940, %2941) : (i64, i64) -> i64
      %2943 = func.call @cc_values_pack(%2942) : (i64) -> i64
      func.call @stack_push_pointer(%2940) : (i64) -> ()
      %2944 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2945 = arith.constant 19 : i64
      %2946 = func.call @cc_make_string(%2944, %2945) : (!llvm.ptr, i64) -> i64
      %2947 = func.call @cc_nil_value() : () -> i64
      %2948 = func.call @cc_intern(%2946, %2947) : (i64, i64) -> i64
      %2949 = func.call @cc_nil_value() : () -> i64
      %2950 = func.call @cc_cons(%2948, %2949) : (i64, i64) -> i64
      %2951 = func.call @cc_values_pack(%2950) : (i64) -> i64
      func.call @stack_push_pointer(%2948) : (i64) -> ()
      %2952 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2953 = arith.constant 5 : i64
      %2954 = func.call @cc_make_string(%2952, %2953) : (!llvm.ptr, i64) -> i64
      %2955 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2956 = arith.constant 11 : i64
      %2957 = func.call @cc_make_string(%2955, %2956) : (!llvm.ptr, i64) -> i64
      %2958 = func.call @cc_intern(%2954, %2957) : (i64, i64) -> i64
      %2959 = func.call @cc_nil_value() : () -> i64
      %2960 = func.call @cc_cons(%2958, %2959) : (i64, i64) -> i64
      %2961 = func.call @cc_values_pack(%2960) : (i64) -> i64
      func.call @stack_push_pointer(%2958) : (i64) -> ()
      %2962 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2963 = arith.constant 15 : i64
      %2964 = func.call @cc_make_string(%2962, %2963) : (!llvm.ptr, i64) -> i64
      %2965 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2966 = arith.constant 11 : i64
      %2967 = func.call @cc_make_string(%2965, %2966) : (!llvm.ptr, i64) -> i64
      %2968 = func.call @cc_intern(%2964, %2967) : (i64, i64) -> i64
      %2969 = func.call @cc_nil_value() : () -> i64
      %2970 = func.call @cc_cons(%2968, %2969) : (i64, i64) -> i64
      %2971 = func.call @cc_values_pack(%2970) : (i64) -> i64
      func.call @stack_push_pointer(%2968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2972 = func.call @stack_pop_pointer() : () -> i64
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @cc_cons(%2973, %2972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = func.call @cc_cons(%2976, %2975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2978 = arith.addi %2977, %__rlasp_stack_elide_zero_129 : i64
      %2979 = func.call @stack_pop_pointer() : () -> i64
      %2980 = func.call @cc_cons(%2979, %2978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2981 = func.call @stack_pop_pointer() : () -> i64
      %2982 = func.call @stack_pop_pointer() : () -> i64
      %2983 = func.call @cc_cons(%2982, %2981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2984 = arith.addi %2983, %__rlasp_stack_elide_zero_130 : i64
      %2985 = func.call @stack_pop_pointer() : () -> i64
      %2986 = func.call @cc_cons(%2985, %2984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2986) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2987 = func.call @stack_pop_pointer() : () -> i64
      %2988 = func.call @stack_pop_pointer() : () -> i64
      %2989 = func.call @cc_cons(%2988, %2987) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2990 = arith.addi %2989, %__rlasp_stack_elide_zero_131 : i64
      %2991 = func.call @stack_pop_pointer() : () -> i64
      %2992 = func.call @cc_cons(%2991, %2990) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2993 = arith.addi %2992, %__rlasp_stack_elide_zero_132 : i64
      %2994 = func.call @stack_pop_pointer() : () -> i64
      %2995 = func.call @cc_cons(%2994, %2993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2995) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2996 = func.call @stack_pop_pointer() : () -> i64
      %2997 = func.call @stack_pop_pointer() : () -> i64
      %2998 = func.call @cc_cons(%2997, %2996) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2999 = arith.addi %2998, %__rlasp_stack_elide_zero_133 : i64
      %3000 = func.call @stack_pop_pointer() : () -> i64
      %3001 = func.call @cc_cons(%3000, %2999) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %3002 = arith.addi %3001, %__rlasp_stack_elide_zero_134 : i64
      %3059 = arith.constant 209815645192206 : i64
      %3060 = arith.constant 0 : i64
      %3061 = func.call @cc_make_closure(%3059, %3060) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %3062 = arith.addi %3061, %__rlasp_stack_elide_zero_135 : i64
      %3063 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3064 = arith.constant 4 : i64
      %3065 = func.call @cc_make_string(%3063, %3064) : (!llvm.ptr, i64) -> i64
      %3066 = func.call @cc_nil_value() : () -> i64
      %3067 = func.call @cc_intern(%3065, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_nil_value() : () -> i64
      %3069 = func.call @cc_cons(%3067, %3068) : (i64, i64) -> i64
      %3070 = func.call @cc_values_pack(%3069) : (i64) -> i64
      func.call @stack_push_pointer(%3067) : (i64) -> ()
      %3071 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3072 = arith.constant 10 : i64
      %3073 = func.call @cc_make_string(%3071, %3072) : (!llvm.ptr, i64) -> i64
      %3074 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3075 = arith.constant 11 : i64
      %3076 = func.call @cc_make_string(%3074, %3075) : (!llvm.ptr, i64) -> i64
      %3077 = func.call @cc_intern(%3073, %3076) : (i64, i64) -> i64
      %3078 = func.call @cc_nil_value() : () -> i64
      %3079 = func.call @cc_cons(%3077, %3078) : (i64, i64) -> i64
      %3080 = func.call @cc_values_pack(%3079) : (i64) -> i64
      func.call @stack_push_pointer(%3077) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3081 = func.call @stack_pop_pointer() : () -> i64
      %3082 = func.call @stack_pop_pointer() : () -> i64
      %3083 = func.call @cc_cons(%3082, %3081) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %3084 = arith.addi %3083, %__rlasp_stack_elide_zero_136 : i64
      %3085 = func.call @stack_pop_pointer() : () -> i64
      %3086 = func.call @cc_cons(%3085, %3084) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %3087 = arith.addi %3086, %__rlasp_stack_elide_zero_137 : i64
      %3088 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3089 = arith.constant 11 : i64
      %3090 = func.call @cc_make_string(%3088, %3089) : (!llvm.ptr, i64) -> i64
      %3091 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3092 = arith.constant 7 : i64
      %3093 = func.call @cc_make_string(%3091, %3092) : (!llvm.ptr, i64) -> i64
      %3094 = func.call @cc_intern(%3090, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_nil_value() : () -> i64
      %3096 = func.call @cc_cons(%3094, %3095) : (i64, i64) -> i64
      %3097 = func.call @cc_values_pack(%3096) : (i64) -> i64
      %3098 = func.call @cc_nil_value() : () -> i64
      %3099 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3100 = arith.constant 4 : i64
      %3101 = func.call @cc_make_string(%3099, %3100) : (!llvm.ptr, i64) -> i64
      %3102 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3103 = arith.constant 7 : i64
      %3104 = func.call @cc_make_string(%3102, %3103) : (!llvm.ptr, i64) -> i64
      %3105 = func.call @cc_intern(%3101, %3104) : (i64, i64) -> i64
      %3106 = func.call @cc_nil_value() : () -> i64
      %3107 = func.call @cc_cons(%3105, %3106) : (i64, i64) -> i64
      %3108 = func.call @cc_values_pack(%3107) : (i64) -> i64
      %3109 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3110 = arith.constant 5 : i64
      %3111 = func.call @cc_make_string(%3109, %3110) : (!llvm.ptr, i64) -> i64
      %3112 = func.call @cc_nil_value() : () -> i64
      %3113 = func.call @cc_intern(%3111, %3112) : (i64, i64) -> i64
      %3114 = func.call @cc_nil_value() : () -> i64
      %3115 = func.call @cc_cons(%3113, %3114) : (i64, i64) -> i64
      %3116 = func.call @cc_values_pack(%3115) : (i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %3117 = arith.addi %3113, %__rlasp_stack_elide_zero_138 : i64
      %3118 = func.call @cc_nil_value() : () -> i64
      %3119 = func.call @cc_errorp(%2925) : (i64) -> i64
      %3120 = arith.cmpi ne, %3119, %3118 : i64
      %3121 = arith.cmpi eq, %3118, %3118 : i64
      %3122 = arith.andi %3120, %3121 : i1
      %3123 = scf.if %3122 -> (i64) {
        scf.yield %2925 : i64
      } else {
        scf.yield %3118 : i64
      }
      %3124 = func.call @cc_errorp(%3002) : (i64) -> i64
      %3125 = arith.cmpi ne, %3124, %3118 : i64
      %3126 = arith.cmpi eq, %3123, %3118 : i64
      %3127 = arith.andi %3125, %3126 : i1
      %3128 = scf.if %3127 -> (i64) {
        scf.yield %3002 : i64
      } else {
        scf.yield %3123 : i64
      }
      %3129 = func.call @cc_errorp(%3062) : (i64) -> i64
      %3130 = arith.cmpi ne, %3129, %3118 : i64
      %3131 = arith.cmpi eq, %3128, %3118 : i64
      %3132 = arith.andi %3130, %3131 : i1
      %3133 = scf.if %3132 -> (i64) {
        scf.yield %3062 : i64
      } else {
        scf.yield %3128 : i64
      }
      %3134 = func.call @cc_errorp(%3087) : (i64) -> i64
      %3135 = arith.cmpi ne, %3134, %3118 : i64
      %3136 = arith.cmpi eq, %3133, %3118 : i64
      %3137 = arith.andi %3135, %3136 : i1
      %3138 = scf.if %3137 -> (i64) {
        scf.yield %3087 : i64
      } else {
        scf.yield %3133 : i64
      }
      %3139 = func.call @cc_errorp(%3094) : (i64) -> i64
      %3140 = arith.cmpi ne, %3139, %3118 : i64
      %3141 = arith.cmpi eq, %3138, %3118 : i64
      %3142 = arith.andi %3140, %3141 : i1
      %3143 = scf.if %3142 -> (i64) {
        scf.yield %3094 : i64
      } else {
        scf.yield %3138 : i64
      }
      %3144 = func.call @cc_errorp(%3098) : (i64) -> i64
      %3145 = arith.cmpi ne, %3144, %3118 : i64
      %3146 = arith.cmpi eq, %3143, %3118 : i64
      %3147 = arith.andi %3145, %3146 : i1
      %3148 = scf.if %3147 -> (i64) {
        scf.yield %3098 : i64
      } else {
        scf.yield %3143 : i64
      }
      %3149 = func.call @cc_errorp(%3105) : (i64) -> i64
      %3150 = arith.cmpi ne, %3149, %3118 : i64
      %3151 = arith.cmpi eq, %3148, %3118 : i64
      %3152 = arith.andi %3150, %3151 : i1
      %3153 = scf.if %3152 -> (i64) {
        scf.yield %3105 : i64
      } else {
        scf.yield %3148 : i64
      }
      %3154 = func.call @cc_errorp(%3117) : (i64) -> i64
      %3155 = arith.cmpi ne, %3154, %3118 : i64
      %3156 = arith.cmpi eq, %3153, %3118 : i64
      %3157 = arith.andi %3155, %3156 : i1
      %3158 = scf.if %3157 -> (i64) {
        scf.yield %3117 : i64
      } else {
        scf.yield %3153 : i64
      }
      %3159 = arith.cmpi ne, %3158, %3118 : i64
      scf.if %3159 {
        func.call @stack_push_pointer(%3158) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2925) : (i64) -> ()
        func.call @stack_push_pointer(%3002) : (i64) -> ()
        func.call @stack_push_pointer(%3062) : (i64) -> ()
        func.call @stack_push_pointer(%3087) : (i64) -> ()
        func.call @stack_push_pointer(%3094) : (i64) -> ()
        func.call @stack_push_pointer(%3098) : (i64) -> ()
        func.call @stack_push_pointer(%3105) : (i64) -> ()
        func.call @stack_push_pointer(%3117) : (i64) -> ()
        %3160 = llvm.mlir.addressof @str237 : !llvm.ptr
        %3161 = func.call @cc_make_function_ref_const(%3160) : (!llvm.ptr) -> i64
        %3162 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3161, %3162) : (i64, i64) -> ()
      }
      %3163 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3163 : i64
    }
    %3164 = func.call @cc_nil_value() : () -> i64
    %3165 = func.call @cc_errorp(%2916) : (i64) -> i64
    %3166 = arith.cmpi ne, %3165, %3164 : i64
    %3167 = scf.if %3166 -> (i64) {
      scf.yield %2916 : i64
    } else {
      %3168 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3169 = arith.constant 12 : i64
      %3170 = func.call @cc_make_string(%3168, %3169) : (!llvm.ptr, i64) -> i64
      %3171 = func.call @cc_nil_value() : () -> i64
      %3172 = func.call @cc_intern(%3170, %3171) : (i64, i64) -> i64
      %3173 = func.call @cc_nil_value() : () -> i64
      %3174 = func.call @cc_cons(%3172, %3173) : (i64, i64) -> i64
      %3175 = func.call @cc_values_pack(%3174) : (i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %3176 = arith.addi %3172, %__rlasp_stack_elide_zero_139 : i64
      %3177 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3178 = arith.constant 13 : i64
      %3179 = func.call @cc_make_string(%3177, %3178) : (!llvm.ptr, i64) -> i64
      %3180 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3181 = arith.constant 11 : i64
      %3182 = func.call @cc_make_string(%3180, %3181) : (!llvm.ptr, i64) -> i64
      %3183 = func.call @cc_intern(%3179, %3182) : (i64, i64) -> i64
      %3184 = func.call @cc_nil_value() : () -> i64
      %3185 = func.call @cc_cons(%3183, %3184) : (i64, i64) -> i64
      %3186 = func.call @cc_values_pack(%3185) : (i64) -> i64
      func.call @stack_push_pointer(%3183) : (i64) -> ()
      %3187 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3188 = arith.constant 6 : i64
      %3189 = func.call @cc_make_string(%3187, %3188) : (!llvm.ptr, i64) -> i64
      %3190 = func.call @cc_nil_value() : () -> i64
      %3191 = func.call @cc_intern(%3189, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_nil_value() : () -> i64
      %3193 = func.call @cc_cons(%3191, %3192) : (i64, i64) -> i64
      %3194 = func.call @cc_values_pack(%3193) : (i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      %3195 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3196 = arith.constant 19 : i64
      %3197 = func.call @cc_make_string(%3195, %3196) : (!llvm.ptr, i64) -> i64
      %3198 = func.call @cc_nil_value() : () -> i64
      %3199 = func.call @cc_intern(%3197, %3198) : (i64, i64) -> i64
      %3200 = func.call @cc_nil_value() : () -> i64
      %3201 = func.call @cc_cons(%3199, %3200) : (i64, i64) -> i64
      %3202 = func.call @cc_values_pack(%3201) : (i64) -> i64
      func.call @stack_push_pointer(%3199) : (i64) -> ()
      %3203 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3204 = arith.constant 6 : i64
      %3205 = func.call @cc_make_string(%3203, %3204) : (!llvm.ptr, i64) -> i64
      %3206 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3207 = arith.constant 11 : i64
      %3208 = func.call @cc_make_string(%3206, %3207) : (!llvm.ptr, i64) -> i64
      %3209 = func.call @cc_intern(%3205, %3208) : (i64, i64) -> i64
      %3210 = func.call @cc_nil_value() : () -> i64
      %3211 = func.call @cc_cons(%3209, %3210) : (i64, i64) -> i64
      %3212 = func.call @cc_values_pack(%3211) : (i64) -> i64
      func.call @stack_push_pointer(%3209) : (i64) -> ()
      %3213 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3214 = arith.constant 15 : i64
      %3215 = func.call @cc_make_string(%3213, %3214) : (!llvm.ptr, i64) -> i64
      %3216 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3217 = arith.constant 11 : i64
      %3218 = func.call @cc_make_string(%3216, %3217) : (!llvm.ptr, i64) -> i64
      %3219 = func.call @cc_intern(%3215, %3218) : (i64, i64) -> i64
      %3220 = func.call @cc_nil_value() : () -> i64
      %3221 = func.call @cc_cons(%3219, %3220) : (i64, i64) -> i64
      %3222 = func.call @cc_values_pack(%3221) : (i64) -> i64
      func.call @stack_push_pointer(%3219) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @stack_pop_pointer() : () -> i64
      %3225 = func.call @cc_cons(%3224, %3223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3225) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = func.call @stack_pop_pointer() : () -> i64
      %3228 = func.call @cc_cons(%3227, %3226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3229 = arith.addi %3228, %__rlasp_stack_elide_zero_140 : i64
      %3230 = func.call @stack_pop_pointer() : () -> i64
      %3231 = func.call @cc_cons(%3230, %3229) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3231) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3232 = func.call @stack_pop_pointer() : () -> i64
      %3233 = func.call @stack_pop_pointer() : () -> i64
      %3234 = func.call @cc_cons(%3233, %3232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3235 = arith.addi %3234, %__rlasp_stack_elide_zero_141 : i64
      %3236 = func.call @stack_pop_pointer() : () -> i64
      %3237 = func.call @cc_cons(%3236, %3235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3238 = func.call @stack_pop_pointer() : () -> i64
      %3239 = func.call @stack_pop_pointer() : () -> i64
      %3240 = func.call @cc_cons(%3239, %3238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3241 = arith.addi %3240, %__rlasp_stack_elide_zero_142 : i64
      %3242 = func.call @stack_pop_pointer() : () -> i64
      %3243 = func.call @cc_cons(%3242, %3241) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3244 = arith.addi %3243, %__rlasp_stack_elide_zero_143 : i64
      %3245 = func.call @stack_pop_pointer() : () -> i64
      %3246 = func.call @cc_cons(%3245, %3244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3246) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3247 = func.call @stack_pop_pointer() : () -> i64
      %3248 = func.call @stack_pop_pointer() : () -> i64
      %3249 = func.call @cc_cons(%3248, %3247) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3250 = arith.addi %3249, %__rlasp_stack_elide_zero_144 : i64
      %3251 = func.call @stack_pop_pointer() : () -> i64
      %3252 = func.call @cc_cons(%3251, %3250) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3253 = arith.addi %3252, %__rlasp_stack_elide_zero_145 : i64
      %3310 = arith.constant 209815645192207 : i64
      %3311 = arith.constant 0 : i64
      %3312 = func.call @cc_make_closure(%3310, %3311) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3313 = arith.addi %3312, %__rlasp_stack_elide_zero_146 : i64
      %3314 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3315 = arith.constant 4 : i64
      %3316 = func.call @cc_make_string(%3314, %3315) : (!llvm.ptr, i64) -> i64
      %3317 = func.call @cc_nil_value() : () -> i64
      %3318 = func.call @cc_intern(%3316, %3317) : (i64, i64) -> i64
      %3319 = func.call @cc_nil_value() : () -> i64
      %3320 = func.call @cc_cons(%3318, %3319) : (i64, i64) -> i64
      %3321 = func.call @cc_values_pack(%3320) : (i64) -> i64
      func.call @stack_push_pointer(%3318) : (i64) -> ()
      %3322 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3323 = arith.constant 10 : i64
      %3324 = func.call @cc_make_string(%3322, %3323) : (!llvm.ptr, i64) -> i64
      %3325 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3326 = arith.constant 11 : i64
      %3327 = func.call @cc_make_string(%3325, %3326) : (!llvm.ptr, i64) -> i64
      %3328 = func.call @cc_intern(%3324, %3327) : (i64, i64) -> i64
      %3329 = func.call @cc_nil_value() : () -> i64
      %3330 = func.call @cc_cons(%3328, %3329) : (i64, i64) -> i64
      %3331 = func.call @cc_values_pack(%3330) : (i64) -> i64
      func.call @stack_push_pointer(%3328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3332 = func.call @stack_pop_pointer() : () -> i64
      %3333 = func.call @stack_pop_pointer() : () -> i64
      %3334 = func.call @cc_cons(%3333, %3332) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3335 = arith.addi %3334, %__rlasp_stack_elide_zero_147 : i64
      %3336 = func.call @stack_pop_pointer() : () -> i64
      %3337 = func.call @cc_cons(%3336, %3335) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3338 = arith.addi %3337, %__rlasp_stack_elide_zero_148 : i64
      %3339 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3340 = arith.constant 11 : i64
      %3341 = func.call @cc_make_string(%3339, %3340) : (!llvm.ptr, i64) -> i64
      %3342 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3343 = arith.constant 7 : i64
      %3344 = func.call @cc_make_string(%3342, %3343) : (!llvm.ptr, i64) -> i64
      %3345 = func.call @cc_intern(%3341, %3344) : (i64, i64) -> i64
      %3346 = func.call @cc_nil_value() : () -> i64
      %3347 = func.call @cc_cons(%3345, %3346) : (i64, i64) -> i64
      %3348 = func.call @cc_values_pack(%3347) : (i64) -> i64
      %3349 = func.call @cc_nil_value() : () -> i64
      %3350 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3351 = arith.constant 4 : i64
      %3352 = func.call @cc_make_string(%3350, %3351) : (!llvm.ptr, i64) -> i64
      %3353 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3354 = arith.constant 7 : i64
      %3355 = func.call @cc_make_string(%3353, %3354) : (!llvm.ptr, i64) -> i64
      %3356 = func.call @cc_intern(%3352, %3355) : (i64, i64) -> i64
      %3357 = func.call @cc_nil_value() : () -> i64
      %3358 = func.call @cc_cons(%3356, %3357) : (i64, i64) -> i64
      %3359 = func.call @cc_values_pack(%3358) : (i64) -> i64
      %3360 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3361 = arith.constant 5 : i64
      %3362 = func.call @cc_make_string(%3360, %3361) : (!llvm.ptr, i64) -> i64
      %3363 = func.call @cc_nil_value() : () -> i64
      %3364 = func.call @cc_intern(%3362, %3363) : (i64, i64) -> i64
      %3365 = func.call @cc_nil_value() : () -> i64
      %3366 = func.call @cc_cons(%3364, %3365) : (i64, i64) -> i64
      %3367 = func.call @cc_values_pack(%3366) : (i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3368 = arith.addi %3364, %__rlasp_stack_elide_zero_149 : i64
      %3369 = func.call @cc_nil_value() : () -> i64
      %3370 = func.call @cc_errorp(%3176) : (i64) -> i64
      %3371 = arith.cmpi ne, %3370, %3369 : i64
      %3372 = arith.cmpi eq, %3369, %3369 : i64
      %3373 = arith.andi %3371, %3372 : i1
      %3374 = scf.if %3373 -> (i64) {
        scf.yield %3176 : i64
      } else {
        scf.yield %3369 : i64
      }
      %3375 = func.call @cc_errorp(%3253) : (i64) -> i64
      %3376 = arith.cmpi ne, %3375, %3369 : i64
      %3377 = arith.cmpi eq, %3374, %3369 : i64
      %3378 = arith.andi %3376, %3377 : i1
      %3379 = scf.if %3378 -> (i64) {
        scf.yield %3253 : i64
      } else {
        scf.yield %3374 : i64
      }
      %3380 = func.call @cc_errorp(%3313) : (i64) -> i64
      %3381 = arith.cmpi ne, %3380, %3369 : i64
      %3382 = arith.cmpi eq, %3379, %3369 : i64
      %3383 = arith.andi %3381, %3382 : i1
      %3384 = scf.if %3383 -> (i64) {
        scf.yield %3313 : i64
      } else {
        scf.yield %3379 : i64
      }
      %3385 = func.call @cc_errorp(%3338) : (i64) -> i64
      %3386 = arith.cmpi ne, %3385, %3369 : i64
      %3387 = arith.cmpi eq, %3384, %3369 : i64
      %3388 = arith.andi %3386, %3387 : i1
      %3389 = scf.if %3388 -> (i64) {
        scf.yield %3338 : i64
      } else {
        scf.yield %3384 : i64
      }
      %3390 = func.call @cc_errorp(%3345) : (i64) -> i64
      %3391 = arith.cmpi ne, %3390, %3369 : i64
      %3392 = arith.cmpi eq, %3389, %3369 : i64
      %3393 = arith.andi %3391, %3392 : i1
      %3394 = scf.if %3393 -> (i64) {
        scf.yield %3345 : i64
      } else {
        scf.yield %3389 : i64
      }
      %3395 = func.call @cc_errorp(%3349) : (i64) -> i64
      %3396 = arith.cmpi ne, %3395, %3369 : i64
      %3397 = arith.cmpi eq, %3394, %3369 : i64
      %3398 = arith.andi %3396, %3397 : i1
      %3399 = scf.if %3398 -> (i64) {
        scf.yield %3349 : i64
      } else {
        scf.yield %3394 : i64
      }
      %3400 = func.call @cc_errorp(%3356) : (i64) -> i64
      %3401 = arith.cmpi ne, %3400, %3369 : i64
      %3402 = arith.cmpi eq, %3399, %3369 : i64
      %3403 = arith.andi %3401, %3402 : i1
      %3404 = scf.if %3403 -> (i64) {
        scf.yield %3356 : i64
      } else {
        scf.yield %3399 : i64
      }
      %3405 = func.call @cc_errorp(%3368) : (i64) -> i64
      %3406 = arith.cmpi ne, %3405, %3369 : i64
      %3407 = arith.cmpi eq, %3404, %3369 : i64
      %3408 = arith.andi %3406, %3407 : i1
      %3409 = scf.if %3408 -> (i64) {
        scf.yield %3368 : i64
      } else {
        scf.yield %3404 : i64
      }
      %3410 = arith.cmpi ne, %3409, %3369 : i64
      scf.if %3410 {
        func.call @stack_push_pointer(%3409) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3176) : (i64) -> ()
        func.call @stack_push_pointer(%3253) : (i64) -> ()
        func.call @stack_push_pointer(%3313) : (i64) -> ()
        func.call @stack_push_pointer(%3338) : (i64) -> ()
        func.call @stack_push_pointer(%3345) : (i64) -> ()
        func.call @stack_push_pointer(%3349) : (i64) -> ()
        func.call @stack_push_pointer(%3356) : (i64) -> ()
        func.call @stack_push_pointer(%3368) : (i64) -> ()
        %3411 = llvm.mlir.addressof @str256 : !llvm.ptr
        %3412 = func.call @cc_make_function_ref_const(%3411) : (!llvm.ptr) -> i64
        %3413 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3412, %3413) : (i64, i64) -> ()
      }
      %3414 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3414 : i64
    }
    %3415 = func.call @cc_nil_value() : () -> i64
    %3416 = func.call @cc_errorp(%3167) : (i64) -> i64
    %3417 = arith.cmpi ne, %3416, %3415 : i64
    %3418 = scf.if %3417 -> (i64) {
      scf.yield %3167 : i64
    } else {
      %3419 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3420 = arith.constant 12 : i64
      %3421 = func.call @cc_make_string(%3419, %3420) : (!llvm.ptr, i64) -> i64
      %3422 = func.call @cc_nil_value() : () -> i64
      %3423 = func.call @cc_intern(%3421, %3422) : (i64, i64) -> i64
      %3424 = func.call @cc_nil_value() : () -> i64
      %3425 = func.call @cc_cons(%3423, %3424) : (i64, i64) -> i64
      %3426 = func.call @cc_values_pack(%3425) : (i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3427 = arith.addi %3423, %__rlasp_stack_elide_zero_150 : i64
      %3428 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3429 = arith.constant 13 : i64
      %3430 = func.call @cc_make_string(%3428, %3429) : (!llvm.ptr, i64) -> i64
      %3431 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3432 = arith.constant 11 : i64
      %3433 = func.call @cc_make_string(%3431, %3432) : (!llvm.ptr, i64) -> i64
      %3434 = func.call @cc_intern(%3430, %3433) : (i64, i64) -> i64
      %3435 = func.call @cc_nil_value() : () -> i64
      %3436 = func.call @cc_cons(%3434, %3435) : (i64, i64) -> i64
      %3437 = func.call @cc_values_pack(%3436) : (i64) -> i64
      func.call @stack_push_pointer(%3434) : (i64) -> ()
      %3438 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3439 = arith.constant 6 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = func.call @cc_intern(%3440, %3441) : (i64, i64) -> i64
      %3443 = func.call @cc_nil_value() : () -> i64
      %3444 = func.call @cc_cons(%3442, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_values_pack(%3444) : (i64) -> i64
      func.call @stack_push_pointer(%3442) : (i64) -> ()
      %3446 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3447 = arith.constant 19 : i64
      %3448 = func.call @cc_make_string(%3446, %3447) : (!llvm.ptr, i64) -> i64
      %3449 = func.call @cc_nil_value() : () -> i64
      %3450 = func.call @cc_intern(%3448, %3449) : (i64, i64) -> i64
      %3451 = func.call @cc_nil_value() : () -> i64
      %3452 = func.call @cc_cons(%3450, %3451) : (i64, i64) -> i64
      %3453 = func.call @cc_values_pack(%3452) : (i64) -> i64
      func.call @stack_push_pointer(%3450) : (i64) -> ()
      %3454 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3455 = arith.constant 5 : i64
      %3456 = func.call @cc_make_string(%3454, %3455) : (!llvm.ptr, i64) -> i64
      %3457 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3458 = arith.constant 11 : i64
      %3459 = func.call @cc_make_string(%3457, %3458) : (!llvm.ptr, i64) -> i64
      %3460 = func.call @cc_intern(%3456, %3459) : (i64, i64) -> i64
      %3461 = func.call @cc_nil_value() : () -> i64
      %3462 = func.call @cc_cons(%3460, %3461) : (i64, i64) -> i64
      %3463 = func.call @cc_values_pack(%3462) : (i64) -> i64
      func.call @stack_push_pointer(%3460) : (i64) -> ()
      %3464 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3465 = arith.constant 15 : i64
      %3466 = func.call @cc_make_string(%3464, %3465) : (!llvm.ptr, i64) -> i64
      %3467 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3468 = arith.constant 11 : i64
      %3469 = func.call @cc_make_string(%3467, %3468) : (!llvm.ptr, i64) -> i64
      %3470 = func.call @cc_intern(%3466, %3469) : (i64, i64) -> i64
      %3471 = func.call @cc_nil_value() : () -> i64
      %3472 = func.call @cc_cons(%3470, %3471) : (i64, i64) -> i64
      %3473 = func.call @cc_values_pack(%3472) : (i64) -> i64
      func.call @stack_push_pointer(%3470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3474 = func.call @stack_pop_pointer() : () -> i64
      %3475 = func.call @stack_pop_pointer() : () -> i64
      %3476 = func.call @cc_cons(%3475, %3474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3477 = func.call @stack_pop_pointer() : () -> i64
      %3478 = func.call @stack_pop_pointer() : () -> i64
      %3479 = func.call @cc_cons(%3478, %3477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3480 = arith.addi %3479, %__rlasp_stack_elide_zero_151 : i64
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @cc_cons(%3481, %3480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3483 = func.call @stack_pop_pointer() : () -> i64
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @cc_cons(%3484, %3483) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3486 = arith.addi %3485, %__rlasp_stack_elide_zero_152 : i64
      %3487 = func.call @stack_pop_pointer() : () -> i64
      %3488 = func.call @cc_cons(%3487, %3486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3489 = func.call @stack_pop_pointer() : () -> i64
      %3490 = func.call @stack_pop_pointer() : () -> i64
      %3491 = func.call @cc_cons(%3490, %3489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3492 = arith.addi %3491, %__rlasp_stack_elide_zero_153 : i64
      %3493 = func.call @stack_pop_pointer() : () -> i64
      %3494 = func.call @cc_cons(%3493, %3492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3495 = arith.addi %3494, %__rlasp_stack_elide_zero_154 : i64
      %3496 = func.call @stack_pop_pointer() : () -> i64
      %3497 = func.call @cc_cons(%3496, %3495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3497) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3498 = func.call @stack_pop_pointer() : () -> i64
      %3499 = func.call @stack_pop_pointer() : () -> i64
      %3500 = func.call @cc_cons(%3499, %3498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3501 = arith.addi %3500, %__rlasp_stack_elide_zero_155 : i64
      %3502 = func.call @stack_pop_pointer() : () -> i64
      %3503 = func.call @cc_cons(%3502, %3501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3504 = arith.addi %3503, %__rlasp_stack_elide_zero_156 : i64
      %3561 = arith.constant 209815645192208 : i64
      %3562 = arith.constant 0 : i64
      %3563 = func.call @cc_make_closure(%3561, %3562) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3564 = arith.addi %3563, %__rlasp_stack_elide_zero_157 : i64
      %3565 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3566 = arith.constant 4 : i64
      %3567 = func.call @cc_make_string(%3565, %3566) : (!llvm.ptr, i64) -> i64
      %3568 = func.call @cc_nil_value() : () -> i64
      %3569 = func.call @cc_intern(%3567, %3568) : (i64, i64) -> i64
      %3570 = func.call @cc_nil_value() : () -> i64
      %3571 = func.call @cc_cons(%3569, %3570) : (i64, i64) -> i64
      %3572 = func.call @cc_values_pack(%3571) : (i64) -> i64
      func.call @stack_push_pointer(%3569) : (i64) -> ()
      %3573 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3574 = arith.constant 10 : i64
      %3575 = func.call @cc_make_string(%3573, %3574) : (!llvm.ptr, i64) -> i64
      %3576 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3577 = arith.constant 11 : i64
      %3578 = func.call @cc_make_string(%3576, %3577) : (!llvm.ptr, i64) -> i64
      %3579 = func.call @cc_intern(%3575, %3578) : (i64, i64) -> i64
      %3580 = func.call @cc_nil_value() : () -> i64
      %3581 = func.call @cc_cons(%3579, %3580) : (i64, i64) -> i64
      %3582 = func.call @cc_values_pack(%3581) : (i64) -> i64
      func.call @stack_push_pointer(%3579) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @stack_pop_pointer() : () -> i64
      %3585 = func.call @cc_cons(%3584, %3583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3586 = arith.addi %3585, %__rlasp_stack_elide_zero_158 : i64
      %3587 = func.call @stack_pop_pointer() : () -> i64
      %3588 = func.call @cc_cons(%3587, %3586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3589 = arith.addi %3588, %__rlasp_stack_elide_zero_159 : i64
      %3590 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3591 = arith.constant 11 : i64
      %3592 = func.call @cc_make_string(%3590, %3591) : (!llvm.ptr, i64) -> i64
      %3593 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3594 = arith.constant 7 : i64
      %3595 = func.call @cc_make_string(%3593, %3594) : (!llvm.ptr, i64) -> i64
      %3596 = func.call @cc_intern(%3592, %3595) : (i64, i64) -> i64
      %3597 = func.call @cc_nil_value() : () -> i64
      %3598 = func.call @cc_cons(%3596, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_values_pack(%3598) : (i64) -> i64
      %3600 = func.call @cc_nil_value() : () -> i64
      %3601 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3602 = arith.constant 4 : i64
      %3603 = func.call @cc_make_string(%3601, %3602) : (!llvm.ptr, i64) -> i64
      %3604 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3605 = arith.constant 7 : i64
      %3606 = func.call @cc_make_string(%3604, %3605) : (!llvm.ptr, i64) -> i64
      %3607 = func.call @cc_intern(%3603, %3606) : (i64, i64) -> i64
      %3608 = func.call @cc_nil_value() : () -> i64
      %3609 = func.call @cc_cons(%3607, %3608) : (i64, i64) -> i64
      %3610 = func.call @cc_values_pack(%3609) : (i64) -> i64
      %3611 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3612 = arith.constant 5 : i64
      %3613 = func.call @cc_make_string(%3611, %3612) : (!llvm.ptr, i64) -> i64
      %3614 = func.call @cc_nil_value() : () -> i64
      %3615 = func.call @cc_intern(%3613, %3614) : (i64, i64) -> i64
      %3616 = func.call @cc_nil_value() : () -> i64
      %3617 = func.call @cc_cons(%3615, %3616) : (i64, i64) -> i64
      %3618 = func.call @cc_values_pack(%3617) : (i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3619 = arith.addi %3615, %__rlasp_stack_elide_zero_160 : i64
      %3620 = func.call @cc_nil_value() : () -> i64
      %3621 = func.call @cc_errorp(%3427) : (i64) -> i64
      %3622 = arith.cmpi ne, %3621, %3620 : i64
      %3623 = arith.cmpi eq, %3620, %3620 : i64
      %3624 = arith.andi %3622, %3623 : i1
      %3625 = scf.if %3624 -> (i64) {
        scf.yield %3427 : i64
      } else {
        scf.yield %3620 : i64
      }
      %3626 = func.call @cc_errorp(%3504) : (i64) -> i64
      %3627 = arith.cmpi ne, %3626, %3620 : i64
      %3628 = arith.cmpi eq, %3625, %3620 : i64
      %3629 = arith.andi %3627, %3628 : i1
      %3630 = scf.if %3629 -> (i64) {
        scf.yield %3504 : i64
      } else {
        scf.yield %3625 : i64
      }
      %3631 = func.call @cc_errorp(%3564) : (i64) -> i64
      %3632 = arith.cmpi ne, %3631, %3620 : i64
      %3633 = arith.cmpi eq, %3630, %3620 : i64
      %3634 = arith.andi %3632, %3633 : i1
      %3635 = scf.if %3634 -> (i64) {
        scf.yield %3564 : i64
      } else {
        scf.yield %3630 : i64
      }
      %3636 = func.call @cc_errorp(%3589) : (i64) -> i64
      %3637 = arith.cmpi ne, %3636, %3620 : i64
      %3638 = arith.cmpi eq, %3635, %3620 : i64
      %3639 = arith.andi %3637, %3638 : i1
      %3640 = scf.if %3639 -> (i64) {
        scf.yield %3589 : i64
      } else {
        scf.yield %3635 : i64
      }
      %3641 = func.call @cc_errorp(%3596) : (i64) -> i64
      %3642 = arith.cmpi ne, %3641, %3620 : i64
      %3643 = arith.cmpi eq, %3640, %3620 : i64
      %3644 = arith.andi %3642, %3643 : i1
      %3645 = scf.if %3644 -> (i64) {
        scf.yield %3596 : i64
      } else {
        scf.yield %3640 : i64
      }
      %3646 = func.call @cc_errorp(%3600) : (i64) -> i64
      %3647 = arith.cmpi ne, %3646, %3620 : i64
      %3648 = arith.cmpi eq, %3645, %3620 : i64
      %3649 = arith.andi %3647, %3648 : i1
      %3650 = scf.if %3649 -> (i64) {
        scf.yield %3600 : i64
      } else {
        scf.yield %3645 : i64
      }
      %3651 = func.call @cc_errorp(%3607) : (i64) -> i64
      %3652 = arith.cmpi ne, %3651, %3620 : i64
      %3653 = arith.cmpi eq, %3650, %3620 : i64
      %3654 = arith.andi %3652, %3653 : i1
      %3655 = scf.if %3654 -> (i64) {
        scf.yield %3607 : i64
      } else {
        scf.yield %3650 : i64
      }
      %3656 = func.call @cc_errorp(%3619) : (i64) -> i64
      %3657 = arith.cmpi ne, %3656, %3620 : i64
      %3658 = arith.cmpi eq, %3655, %3620 : i64
      %3659 = arith.andi %3657, %3658 : i1
      %3660 = scf.if %3659 -> (i64) {
        scf.yield %3619 : i64
      } else {
        scf.yield %3655 : i64
      }
      %3661 = arith.cmpi ne, %3660, %3620 : i64
      scf.if %3661 {
        func.call @stack_push_pointer(%3660) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3427) : (i64) -> ()
        func.call @stack_push_pointer(%3504) : (i64) -> ()
        func.call @stack_push_pointer(%3564) : (i64) -> ()
        func.call @stack_push_pointer(%3589) : (i64) -> ()
        func.call @stack_push_pointer(%3596) : (i64) -> ()
        func.call @stack_push_pointer(%3600) : (i64) -> ()
        func.call @stack_push_pointer(%3607) : (i64) -> ()
        func.call @stack_push_pointer(%3619) : (i64) -> ()
        %3662 = llvm.mlir.addressof @str275 : !llvm.ptr
        %3663 = func.call @cc_make_function_ref_const(%3662) : (!llvm.ptr) -> i64
        %3664 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3663, %3664) : (i64, i64) -> ()
      }
      %3665 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3665 : i64
    }
    %3666 = func.call @cc_nil_value() : () -> i64
    %3667 = func.call @cc_errorp(%3418) : (i64) -> i64
    %3668 = arith.cmpi ne, %3667, %3666 : i64
    %3669 = scf.if %3668 -> (i64) {
      scf.yield %3418 : i64
    } else {
      %3670 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3671 = arith.constant 12 : i64
      %3672 = func.call @cc_make_string(%3670, %3671) : (!llvm.ptr, i64) -> i64
      %3673 = func.call @cc_nil_value() : () -> i64
      %3674 = func.call @cc_intern(%3672, %3673) : (i64, i64) -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_cons(%3674, %3675) : (i64, i64) -> i64
      %3677 = func.call @cc_values_pack(%3676) : (i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3678 = arith.addi %3674, %__rlasp_stack_elide_zero_161 : i64
      %3679 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3680 = arith.constant 13 : i64
      %3681 = func.call @cc_make_string(%3679, %3680) : (!llvm.ptr, i64) -> i64
      %3682 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3683 = arith.constant 11 : i64
      %3684 = func.call @cc_make_string(%3682, %3683) : (!llvm.ptr, i64) -> i64
      %3685 = func.call @cc_intern(%3681, %3684) : (i64, i64) -> i64
      %3686 = func.call @cc_nil_value() : () -> i64
      %3687 = func.call @cc_cons(%3685, %3686) : (i64, i64) -> i64
      %3688 = func.call @cc_values_pack(%3687) : (i64) -> i64
      func.call @stack_push_pointer(%3685) : (i64) -> ()
      %3689 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3690 = arith.constant 6 : i64
      %3691 = func.call @cc_make_string(%3689, %3690) : (!llvm.ptr, i64) -> i64
      %3692 = func.call @cc_nil_value() : () -> i64
      %3693 = func.call @cc_intern(%3691, %3692) : (i64, i64) -> i64
      %3694 = func.call @cc_nil_value() : () -> i64
      %3695 = func.call @cc_cons(%3693, %3694) : (i64, i64) -> i64
      %3696 = func.call @cc_values_pack(%3695) : (i64) -> i64
      func.call @stack_push_pointer(%3693) : (i64) -> ()
      %3697 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3698 = arith.constant 19 : i64
      %3699 = func.call @cc_make_string(%3697, %3698) : (!llvm.ptr, i64) -> i64
      %3700 = func.call @cc_nil_value() : () -> i64
      %3701 = func.call @cc_intern(%3699, %3700) : (i64, i64) -> i64
      %3702 = func.call @cc_nil_value() : () -> i64
      %3703 = func.call @cc_cons(%3701, %3702) : (i64, i64) -> i64
      %3704 = func.call @cc_values_pack(%3703) : (i64) -> i64
      func.call @stack_push_pointer(%3701) : (i64) -> ()
      %3705 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3706 = arith.constant 5 : i64
      %3707 = func.call @cc_make_string(%3705, %3706) : (!llvm.ptr, i64) -> i64
      %3708 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3709 = arith.constant 11 : i64
      %3710 = func.call @cc_make_string(%3708, %3709) : (!llvm.ptr, i64) -> i64
      %3711 = func.call @cc_intern(%3707, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_nil_value() : () -> i64
      %3713 = func.call @cc_cons(%3711, %3712) : (i64, i64) -> i64
      %3714 = func.call @cc_values_pack(%3713) : (i64) -> i64
      func.call @stack_push_pointer(%3711) : (i64) -> ()
      %3715 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3716 = arith.constant 15 : i64
      %3717 = func.call @cc_make_string(%3715, %3716) : (!llvm.ptr, i64) -> i64
      %3718 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3719 = arith.constant 11 : i64
      %3720 = func.call @cc_make_string(%3718, %3719) : (!llvm.ptr, i64) -> i64
      %3721 = func.call @cc_intern(%3717, %3720) : (i64, i64) -> i64
      %3722 = func.call @cc_nil_value() : () -> i64
      %3723 = func.call @cc_cons(%3721, %3722) : (i64, i64) -> i64
      %3724 = func.call @cc_values_pack(%3723) : (i64) -> i64
      func.call @stack_push_pointer(%3721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3725 = func.call @stack_pop_pointer() : () -> i64
      %3726 = func.call @stack_pop_pointer() : () -> i64
      %3727 = func.call @cc_cons(%3726, %3725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3728 = func.call @stack_pop_pointer() : () -> i64
      %3729 = func.call @stack_pop_pointer() : () -> i64
      %3730 = func.call @cc_cons(%3729, %3728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3731 = arith.addi %3730, %__rlasp_stack_elide_zero_162 : i64
      %3732 = func.call @stack_pop_pointer() : () -> i64
      %3733 = func.call @cc_cons(%3732, %3731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = func.call @stack_pop_pointer() : () -> i64
      %3736 = func.call @cc_cons(%3735, %3734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3737 = arith.addi %3736, %__rlasp_stack_elide_zero_163 : i64
      %3738 = func.call @stack_pop_pointer() : () -> i64
      %3739 = func.call @cc_cons(%3738, %3737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3740 = func.call @stack_pop_pointer() : () -> i64
      %3741 = func.call @stack_pop_pointer() : () -> i64
      %3742 = func.call @cc_cons(%3741, %3740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3743 = arith.addi %3742, %__rlasp_stack_elide_zero_164 : i64
      %3744 = func.call @stack_pop_pointer() : () -> i64
      %3745 = func.call @cc_cons(%3744, %3743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3746 = arith.addi %3745, %__rlasp_stack_elide_zero_165 : i64
      %3747 = func.call @stack_pop_pointer() : () -> i64
      %3748 = func.call @cc_cons(%3747, %3746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3748) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3749 = func.call @stack_pop_pointer() : () -> i64
      %3750 = func.call @stack_pop_pointer() : () -> i64
      %3751 = func.call @cc_cons(%3750, %3749) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3752 = arith.addi %3751, %__rlasp_stack_elide_zero_166 : i64
      %3753 = func.call @stack_pop_pointer() : () -> i64
      %3754 = func.call @cc_cons(%3753, %3752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3755 = arith.addi %3754, %__rlasp_stack_elide_zero_167 : i64
      %3812 = arith.constant 209815645192209 : i64
      %3813 = arith.constant 0 : i64
      %3814 = func.call @cc_make_closure(%3812, %3813) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3815 = arith.addi %3814, %__rlasp_stack_elide_zero_168 : i64
      %3816 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3817 = arith.constant 4 : i64
      %3818 = func.call @cc_make_string(%3816, %3817) : (!llvm.ptr, i64) -> i64
      %3819 = func.call @cc_nil_value() : () -> i64
      %3820 = func.call @cc_intern(%3818, %3819) : (i64, i64) -> i64
      %3821 = func.call @cc_nil_value() : () -> i64
      %3822 = func.call @cc_cons(%3820, %3821) : (i64, i64) -> i64
      %3823 = func.call @cc_values_pack(%3822) : (i64) -> i64
      func.call @stack_push_pointer(%3820) : (i64) -> ()
      %3824 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3825 = arith.constant 10 : i64
      %3826 = func.call @cc_make_string(%3824, %3825) : (!llvm.ptr, i64) -> i64
      %3827 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3828 = arith.constant 11 : i64
      %3829 = func.call @cc_make_string(%3827, %3828) : (!llvm.ptr, i64) -> i64
      %3830 = func.call @cc_intern(%3826, %3829) : (i64, i64) -> i64
      %3831 = func.call @cc_nil_value() : () -> i64
      %3832 = func.call @cc_cons(%3830, %3831) : (i64, i64) -> i64
      %3833 = func.call @cc_values_pack(%3832) : (i64) -> i64
      func.call @stack_push_pointer(%3830) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3834 = func.call @stack_pop_pointer() : () -> i64
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @cc_cons(%3835, %3834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3837 = arith.addi %3836, %__rlasp_stack_elide_zero_169 : i64
      %3838 = func.call @stack_pop_pointer() : () -> i64
      %3839 = func.call @cc_cons(%3838, %3837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3840 = arith.addi %3839, %__rlasp_stack_elide_zero_170 : i64
      %3841 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3842 = arith.constant 11 : i64
      %3843 = func.call @cc_make_string(%3841, %3842) : (!llvm.ptr, i64) -> i64
      %3844 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3845 = arith.constant 7 : i64
      %3846 = func.call @cc_make_string(%3844, %3845) : (!llvm.ptr, i64) -> i64
      %3847 = func.call @cc_intern(%3843, %3846) : (i64, i64) -> i64
      %3848 = func.call @cc_nil_value() : () -> i64
      %3849 = func.call @cc_cons(%3847, %3848) : (i64, i64) -> i64
      %3850 = func.call @cc_values_pack(%3849) : (i64) -> i64
      %3851 = func.call @cc_nil_value() : () -> i64
      %3852 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3853 = arith.constant 4 : i64
      %3854 = func.call @cc_make_string(%3852, %3853) : (!llvm.ptr, i64) -> i64
      %3855 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3856 = arith.constant 7 : i64
      %3857 = func.call @cc_make_string(%3855, %3856) : (!llvm.ptr, i64) -> i64
      %3858 = func.call @cc_intern(%3854, %3857) : (i64, i64) -> i64
      %3859 = func.call @cc_nil_value() : () -> i64
      %3860 = func.call @cc_cons(%3858, %3859) : (i64, i64) -> i64
      %3861 = func.call @cc_values_pack(%3860) : (i64) -> i64
      %3862 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3863 = arith.constant 5 : i64
      %3864 = func.call @cc_make_string(%3862, %3863) : (!llvm.ptr, i64) -> i64
      %3865 = func.call @cc_nil_value() : () -> i64
      %3866 = func.call @cc_intern(%3864, %3865) : (i64, i64) -> i64
      %3867 = func.call @cc_nil_value() : () -> i64
      %3868 = func.call @cc_cons(%3866, %3867) : (i64, i64) -> i64
      %3869 = func.call @cc_values_pack(%3868) : (i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3870 = arith.addi %3866, %__rlasp_stack_elide_zero_171 : i64
      %3871 = func.call @cc_nil_value() : () -> i64
      %3872 = func.call @cc_errorp(%3678) : (i64) -> i64
      %3873 = arith.cmpi ne, %3872, %3871 : i64
      %3874 = arith.cmpi eq, %3871, %3871 : i64
      %3875 = arith.andi %3873, %3874 : i1
      %3876 = scf.if %3875 -> (i64) {
        scf.yield %3678 : i64
      } else {
        scf.yield %3871 : i64
      }
      %3877 = func.call @cc_errorp(%3755) : (i64) -> i64
      %3878 = arith.cmpi ne, %3877, %3871 : i64
      %3879 = arith.cmpi eq, %3876, %3871 : i64
      %3880 = arith.andi %3878, %3879 : i1
      %3881 = scf.if %3880 -> (i64) {
        scf.yield %3755 : i64
      } else {
        scf.yield %3876 : i64
      }
      %3882 = func.call @cc_errorp(%3815) : (i64) -> i64
      %3883 = arith.cmpi ne, %3882, %3871 : i64
      %3884 = arith.cmpi eq, %3881, %3871 : i64
      %3885 = arith.andi %3883, %3884 : i1
      %3886 = scf.if %3885 -> (i64) {
        scf.yield %3815 : i64
      } else {
        scf.yield %3881 : i64
      }
      %3887 = func.call @cc_errorp(%3840) : (i64) -> i64
      %3888 = arith.cmpi ne, %3887, %3871 : i64
      %3889 = arith.cmpi eq, %3886, %3871 : i64
      %3890 = arith.andi %3888, %3889 : i1
      %3891 = scf.if %3890 -> (i64) {
        scf.yield %3840 : i64
      } else {
        scf.yield %3886 : i64
      }
      %3892 = func.call @cc_errorp(%3847) : (i64) -> i64
      %3893 = arith.cmpi ne, %3892, %3871 : i64
      %3894 = arith.cmpi eq, %3891, %3871 : i64
      %3895 = arith.andi %3893, %3894 : i1
      %3896 = scf.if %3895 -> (i64) {
        scf.yield %3847 : i64
      } else {
        scf.yield %3891 : i64
      }
      %3897 = func.call @cc_errorp(%3851) : (i64) -> i64
      %3898 = arith.cmpi ne, %3897, %3871 : i64
      %3899 = arith.cmpi eq, %3896, %3871 : i64
      %3900 = arith.andi %3898, %3899 : i1
      %3901 = scf.if %3900 -> (i64) {
        scf.yield %3851 : i64
      } else {
        scf.yield %3896 : i64
      }
      %3902 = func.call @cc_errorp(%3858) : (i64) -> i64
      %3903 = arith.cmpi ne, %3902, %3871 : i64
      %3904 = arith.cmpi eq, %3901, %3871 : i64
      %3905 = arith.andi %3903, %3904 : i1
      %3906 = scf.if %3905 -> (i64) {
        scf.yield %3858 : i64
      } else {
        scf.yield %3901 : i64
      }
      %3907 = func.call @cc_errorp(%3870) : (i64) -> i64
      %3908 = arith.cmpi ne, %3907, %3871 : i64
      %3909 = arith.cmpi eq, %3906, %3871 : i64
      %3910 = arith.andi %3908, %3909 : i1
      %3911 = scf.if %3910 -> (i64) {
        scf.yield %3870 : i64
      } else {
        scf.yield %3906 : i64
      }
      %3912 = arith.cmpi ne, %3911, %3871 : i64
      scf.if %3912 {
        func.call @stack_push_pointer(%3911) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3678) : (i64) -> ()
        func.call @stack_push_pointer(%3755) : (i64) -> ()
        func.call @stack_push_pointer(%3815) : (i64) -> ()
        func.call @stack_push_pointer(%3840) : (i64) -> ()
        func.call @stack_push_pointer(%3847) : (i64) -> ()
        func.call @stack_push_pointer(%3851) : (i64) -> ()
        func.call @stack_push_pointer(%3858) : (i64) -> ()
        func.call @stack_push_pointer(%3870) : (i64) -> ()
        %3913 = llvm.mlir.addressof @str294 : !llvm.ptr
        %3914 = func.call @cc_make_function_ref_const(%3913) : (!llvm.ptr) -> i64
        %3915 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3914, %3915) : (i64, i64) -> ()
      }
      %3916 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3916 : i64
    }
    %3917 = func.call @cc_nil_value() : () -> i64
    %3918 = func.call @cc_errorp(%3669) : (i64) -> i64
    %3919 = arith.cmpi ne, %3918, %3917 : i64
    %3920 = scf.if %3919 -> (i64) {
      scf.yield %3669 : i64
    } else {
      %3921 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3922 = arith.constant 12 : i64
      %3923 = func.call @cc_make_string(%3921, %3922) : (!llvm.ptr, i64) -> i64
      %3924 = func.call @cc_nil_value() : () -> i64
      %3925 = func.call @cc_intern(%3923, %3924) : (i64, i64) -> i64
      %3926 = func.call @cc_nil_value() : () -> i64
      %3927 = func.call @cc_cons(%3925, %3926) : (i64, i64) -> i64
      %3928 = func.call @cc_values_pack(%3927) : (i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3929 = arith.addi %3925, %__rlasp_stack_elide_zero_172 : i64
      %3930 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3931 = arith.constant 13 : i64
      %3932 = func.call @cc_make_string(%3930, %3931) : (!llvm.ptr, i64) -> i64
      %3933 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3934 = arith.constant 11 : i64
      %3935 = func.call @cc_make_string(%3933, %3934) : (!llvm.ptr, i64) -> i64
      %3936 = func.call @cc_intern(%3932, %3935) : (i64, i64) -> i64
      %3937 = func.call @cc_nil_value() : () -> i64
      %3938 = func.call @cc_cons(%3936, %3937) : (i64, i64) -> i64
      %3939 = func.call @cc_values_pack(%3938) : (i64) -> i64
      func.call @stack_push_pointer(%3936) : (i64) -> ()
      %3940 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3941 = arith.constant 6 : i64
      %3942 = func.call @cc_make_string(%3940, %3941) : (!llvm.ptr, i64) -> i64
      %3943 = func.call @cc_nil_value() : () -> i64
      %3944 = func.call @cc_intern(%3942, %3943) : (i64, i64) -> i64
      %3945 = func.call @cc_nil_value() : () -> i64
      %3946 = func.call @cc_cons(%3944, %3945) : (i64, i64) -> i64
      %3947 = func.call @cc_values_pack(%3946) : (i64) -> i64
      func.call @stack_push_pointer(%3944) : (i64) -> ()
      %3948 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3949 = arith.constant 19 : i64
      %3950 = func.call @cc_make_string(%3948, %3949) : (!llvm.ptr, i64) -> i64
      %3951 = func.call @cc_nil_value() : () -> i64
      %3952 = func.call @cc_intern(%3950, %3951) : (i64, i64) -> i64
      %3953 = func.call @cc_nil_value() : () -> i64
      %3954 = func.call @cc_cons(%3952, %3953) : (i64, i64) -> i64
      %3955 = func.call @cc_values_pack(%3954) : (i64) -> i64
      func.call @stack_push_pointer(%3952) : (i64) -> ()
      %3956 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3957 = arith.constant 6 : i64
      %3958 = func.call @cc_make_string(%3956, %3957) : (!llvm.ptr, i64) -> i64
      %3959 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3960 = arith.constant 11 : i64
      %3961 = func.call @cc_make_string(%3959, %3960) : (!llvm.ptr, i64) -> i64
      %3962 = func.call @cc_intern(%3958, %3961) : (i64, i64) -> i64
      %3963 = func.call @cc_nil_value() : () -> i64
      %3964 = func.call @cc_cons(%3962, %3963) : (i64, i64) -> i64
      %3965 = func.call @cc_values_pack(%3964) : (i64) -> i64
      func.call @stack_push_pointer(%3962) : (i64) -> ()
      %3966 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3967 = arith.constant 15 : i64
      %3968 = func.call @cc_make_string(%3966, %3967) : (!llvm.ptr, i64) -> i64
      %3969 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3970 = arith.constant 11 : i64
      %3971 = func.call @cc_make_string(%3969, %3970) : (!llvm.ptr, i64) -> i64
      %3972 = func.call @cc_intern(%3968, %3971) : (i64, i64) -> i64
      %3973 = func.call @cc_nil_value() : () -> i64
      %3974 = func.call @cc_cons(%3972, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_values_pack(%3974) : (i64) -> i64
      func.call @stack_push_pointer(%3972) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3976 = func.call @stack_pop_pointer() : () -> i64
      %3977 = func.call @stack_pop_pointer() : () -> i64
      %3978 = func.call @cc_cons(%3977, %3976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3978) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3979 = func.call @stack_pop_pointer() : () -> i64
      %3980 = func.call @stack_pop_pointer() : () -> i64
      %3981 = func.call @cc_cons(%3980, %3979) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3982 = arith.addi %3981, %__rlasp_stack_elide_zero_173 : i64
      %3983 = func.call @stack_pop_pointer() : () -> i64
      %3984 = func.call @cc_cons(%3983, %3982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3985 = func.call @stack_pop_pointer() : () -> i64
      %3986 = func.call @stack_pop_pointer() : () -> i64
      %3987 = func.call @cc_cons(%3986, %3985) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3988 = arith.addi %3987, %__rlasp_stack_elide_zero_174 : i64
      %3989 = func.call @stack_pop_pointer() : () -> i64
      %3990 = func.call @cc_cons(%3989, %3988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3990) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3991 = func.call @stack_pop_pointer() : () -> i64
      %3992 = func.call @stack_pop_pointer() : () -> i64
      %3993 = func.call @cc_cons(%3992, %3991) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3994 = arith.addi %3993, %__rlasp_stack_elide_zero_175 : i64
      %3995 = func.call @stack_pop_pointer() : () -> i64
      %3996 = func.call @cc_cons(%3995, %3994) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3997 = arith.addi %3996, %__rlasp_stack_elide_zero_176 : i64
      %3998 = func.call @stack_pop_pointer() : () -> i64
      %3999 = func.call @cc_cons(%3998, %3997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3999) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4000 = func.call @stack_pop_pointer() : () -> i64
      %4001 = func.call @stack_pop_pointer() : () -> i64
      %4002 = func.call @cc_cons(%4001, %4000) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %4003 = arith.addi %4002, %__rlasp_stack_elide_zero_177 : i64
      %4004 = func.call @stack_pop_pointer() : () -> i64
      %4005 = func.call @cc_cons(%4004, %4003) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %4006 = arith.addi %4005, %__rlasp_stack_elide_zero_178 : i64
      %4063 = arith.constant 209815645192210 : i64
      %4064 = arith.constant 0 : i64
      %4065 = func.call @cc_make_closure(%4063, %4064) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %4066 = arith.addi %4065, %__rlasp_stack_elide_zero_179 : i64
      %4067 = llvm.mlir.addressof @str305 : !llvm.ptr
      %4068 = arith.constant 4 : i64
      %4069 = func.call @cc_make_string(%4067, %4068) : (!llvm.ptr, i64) -> i64
      %4070 = func.call @cc_nil_value() : () -> i64
      %4071 = func.call @cc_intern(%4069, %4070) : (i64, i64) -> i64
      %4072 = func.call @cc_nil_value() : () -> i64
      %4073 = func.call @cc_cons(%4071, %4072) : (i64, i64) -> i64
      %4074 = func.call @cc_values_pack(%4073) : (i64) -> i64
      func.call @stack_push_pointer(%4071) : (i64) -> ()
      %4075 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4076 = arith.constant 10 : i64
      %4077 = func.call @cc_make_string(%4075, %4076) : (!llvm.ptr, i64) -> i64
      %4078 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4079 = arith.constant 11 : i64
      %4080 = func.call @cc_make_string(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_intern(%4077, %4080) : (i64, i64) -> i64
      %4082 = func.call @cc_nil_value() : () -> i64
      %4083 = func.call @cc_cons(%4081, %4082) : (i64, i64) -> i64
      %4084 = func.call @cc_values_pack(%4083) : (i64) -> i64
      func.call @stack_push_pointer(%4081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4085 = func.call @stack_pop_pointer() : () -> i64
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @cc_cons(%4086, %4085) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %4088 = arith.addi %4087, %__rlasp_stack_elide_zero_180 : i64
      %4089 = func.call @stack_pop_pointer() : () -> i64
      %4090 = func.call @cc_cons(%4089, %4088) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %4091 = arith.addi %4090, %__rlasp_stack_elide_zero_181 : i64
      %4092 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4093 = arith.constant 11 : i64
      %4094 = func.call @cc_make_string(%4092, %4093) : (!llvm.ptr, i64) -> i64
      %4095 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4096 = arith.constant 7 : i64
      %4097 = func.call @cc_make_string(%4095, %4096) : (!llvm.ptr, i64) -> i64
      %4098 = func.call @cc_intern(%4094, %4097) : (i64, i64) -> i64
      %4099 = func.call @cc_nil_value() : () -> i64
      %4100 = func.call @cc_cons(%4098, %4099) : (i64, i64) -> i64
      %4101 = func.call @cc_values_pack(%4100) : (i64) -> i64
      %4102 = func.call @cc_nil_value() : () -> i64
      %4103 = llvm.mlir.addressof @str310 : !llvm.ptr
      %4104 = arith.constant 4 : i64
      %4105 = func.call @cc_make_string(%4103, %4104) : (!llvm.ptr, i64) -> i64
      %4106 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4107 = arith.constant 7 : i64
      %4108 = func.call @cc_make_string(%4106, %4107) : (!llvm.ptr, i64) -> i64
      %4109 = func.call @cc_intern(%4105, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_cons(%4109, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_values_pack(%4111) : (i64) -> i64
      %4113 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4114 = arith.constant 5 : i64
      %4115 = func.call @cc_make_string(%4113, %4114) : (!llvm.ptr, i64) -> i64
      %4116 = func.call @cc_nil_value() : () -> i64
      %4117 = func.call @cc_intern(%4115, %4116) : (i64, i64) -> i64
      %4118 = func.call @cc_nil_value() : () -> i64
      %4119 = func.call @cc_cons(%4117, %4118) : (i64, i64) -> i64
      %4120 = func.call @cc_values_pack(%4119) : (i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %4121 = arith.addi %4117, %__rlasp_stack_elide_zero_182 : i64
      %4122 = func.call @cc_nil_value() : () -> i64
      %4123 = func.call @cc_errorp(%3929) : (i64) -> i64
      %4124 = arith.cmpi ne, %4123, %4122 : i64
      %4125 = arith.cmpi eq, %4122, %4122 : i64
      %4126 = arith.andi %4124, %4125 : i1
      %4127 = scf.if %4126 -> (i64) {
        scf.yield %3929 : i64
      } else {
        scf.yield %4122 : i64
      }
      %4128 = func.call @cc_errorp(%4006) : (i64) -> i64
      %4129 = arith.cmpi ne, %4128, %4122 : i64
      %4130 = arith.cmpi eq, %4127, %4122 : i64
      %4131 = arith.andi %4129, %4130 : i1
      %4132 = scf.if %4131 -> (i64) {
        scf.yield %4006 : i64
      } else {
        scf.yield %4127 : i64
      }
      %4133 = func.call @cc_errorp(%4066) : (i64) -> i64
      %4134 = arith.cmpi ne, %4133, %4122 : i64
      %4135 = arith.cmpi eq, %4132, %4122 : i64
      %4136 = arith.andi %4134, %4135 : i1
      %4137 = scf.if %4136 -> (i64) {
        scf.yield %4066 : i64
      } else {
        scf.yield %4132 : i64
      }
      %4138 = func.call @cc_errorp(%4091) : (i64) -> i64
      %4139 = arith.cmpi ne, %4138, %4122 : i64
      %4140 = arith.cmpi eq, %4137, %4122 : i64
      %4141 = arith.andi %4139, %4140 : i1
      %4142 = scf.if %4141 -> (i64) {
        scf.yield %4091 : i64
      } else {
        scf.yield %4137 : i64
      }
      %4143 = func.call @cc_errorp(%4098) : (i64) -> i64
      %4144 = arith.cmpi ne, %4143, %4122 : i64
      %4145 = arith.cmpi eq, %4142, %4122 : i64
      %4146 = arith.andi %4144, %4145 : i1
      %4147 = scf.if %4146 -> (i64) {
        scf.yield %4098 : i64
      } else {
        scf.yield %4142 : i64
      }
      %4148 = func.call @cc_errorp(%4102) : (i64) -> i64
      %4149 = arith.cmpi ne, %4148, %4122 : i64
      %4150 = arith.cmpi eq, %4147, %4122 : i64
      %4151 = arith.andi %4149, %4150 : i1
      %4152 = scf.if %4151 -> (i64) {
        scf.yield %4102 : i64
      } else {
        scf.yield %4147 : i64
      }
      %4153 = func.call @cc_errorp(%4109) : (i64) -> i64
      %4154 = arith.cmpi ne, %4153, %4122 : i64
      %4155 = arith.cmpi eq, %4152, %4122 : i64
      %4156 = arith.andi %4154, %4155 : i1
      %4157 = scf.if %4156 -> (i64) {
        scf.yield %4109 : i64
      } else {
        scf.yield %4152 : i64
      }
      %4158 = func.call @cc_errorp(%4121) : (i64) -> i64
      %4159 = arith.cmpi ne, %4158, %4122 : i64
      %4160 = arith.cmpi eq, %4157, %4122 : i64
      %4161 = arith.andi %4159, %4160 : i1
      %4162 = scf.if %4161 -> (i64) {
        scf.yield %4121 : i64
      } else {
        scf.yield %4157 : i64
      }
      %4163 = arith.cmpi ne, %4162, %4122 : i64
      scf.if %4163 {
        func.call @stack_push_pointer(%4162) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3929) : (i64) -> ()
        func.call @stack_push_pointer(%4006) : (i64) -> ()
        func.call @stack_push_pointer(%4066) : (i64) -> ()
        func.call @stack_push_pointer(%4091) : (i64) -> ()
        func.call @stack_push_pointer(%4098) : (i64) -> ()
        func.call @stack_push_pointer(%4102) : (i64) -> ()
        func.call @stack_push_pointer(%4109) : (i64) -> ()
        func.call @stack_push_pointer(%4121) : (i64) -> ()
        %4164 = llvm.mlir.addressof @str313 : !llvm.ptr
        %4165 = func.call @cc_make_function_ref_const(%4164) : (!llvm.ptr) -> i64
        %4166 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4165, %4166) : (i64, i64) -> ()
      }
      %4167 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4167 : i64
    }
    %4168 = func.call @cc_nil_value() : () -> i64
    %4169 = func.call @cc_errorp(%3920) : (i64) -> i64
    %4170 = arith.cmpi ne, %4169, %4168 : i64
    %4171 = scf.if %4170 -> (i64) {
      scf.yield %3920 : i64
    } else {
      %4172 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4173 = arith.constant 12 : i64
      %4174 = func.call @cc_make_string(%4172, %4173) : (!llvm.ptr, i64) -> i64
      %4175 = func.call @cc_nil_value() : () -> i64
      %4176 = func.call @cc_intern(%4174, %4175) : (i64, i64) -> i64
      %4177 = func.call @cc_nil_value() : () -> i64
      %4178 = func.call @cc_cons(%4176, %4177) : (i64, i64) -> i64
      %4179 = func.call @cc_values_pack(%4178) : (i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %4180 = arith.addi %4176, %__rlasp_stack_elide_zero_183 : i64
      %4181 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4182 = arith.constant 13 : i64
      %4183 = func.call @cc_make_string(%4181, %4182) : (!llvm.ptr, i64) -> i64
      %4184 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4185 = arith.constant 11 : i64
      %4186 = func.call @cc_make_string(%4184, %4185) : (!llvm.ptr, i64) -> i64
      %4187 = func.call @cc_intern(%4183, %4186) : (i64, i64) -> i64
      %4188 = func.call @cc_nil_value() : () -> i64
      %4189 = func.call @cc_cons(%4187, %4188) : (i64, i64) -> i64
      %4190 = func.call @cc_values_pack(%4189) : (i64) -> i64
      func.call @stack_push_pointer(%4187) : (i64) -> ()
      %4191 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4192 = arith.constant 6 : i64
      %4193 = func.call @cc_make_string(%4191, %4192) : (!llvm.ptr, i64) -> i64
      %4194 = func.call @cc_nil_value() : () -> i64
      %4195 = func.call @cc_intern(%4193, %4194) : (i64, i64) -> i64
      %4196 = func.call @cc_nil_value() : () -> i64
      %4197 = func.call @cc_cons(%4195, %4196) : (i64, i64) -> i64
      %4198 = func.call @cc_values_pack(%4197) : (i64) -> i64
      func.call @stack_push_pointer(%4195) : (i64) -> ()
      %4199 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4200 = arith.constant 19 : i64
      %4201 = func.call @cc_make_string(%4199, %4200) : (!llvm.ptr, i64) -> i64
      %4202 = func.call @cc_nil_value() : () -> i64
      %4203 = func.call @cc_intern(%4201, %4202) : (i64, i64) -> i64
      %4204 = func.call @cc_nil_value() : () -> i64
      %4205 = func.call @cc_cons(%4203, %4204) : (i64, i64) -> i64
      %4206 = func.call @cc_values_pack(%4205) : (i64) -> i64
      func.call @stack_push_pointer(%4203) : (i64) -> ()
      %4207 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4208 = arith.constant 6 : i64
      %4209 = func.call @cc_make_string(%4207, %4208) : (!llvm.ptr, i64) -> i64
      %4210 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4211 = arith.constant 11 : i64
      %4212 = func.call @cc_make_string(%4210, %4211) : (!llvm.ptr, i64) -> i64
      %4213 = func.call @cc_intern(%4209, %4212) : (i64, i64) -> i64
      %4214 = func.call @cc_nil_value() : () -> i64
      %4215 = func.call @cc_cons(%4213, %4214) : (i64, i64) -> i64
      %4216 = func.call @cc_values_pack(%4215) : (i64) -> i64
      func.call @stack_push_pointer(%4213) : (i64) -> ()
      %4217 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4218 = arith.constant 15 : i64
      %4219 = func.call @cc_make_string(%4217, %4218) : (!llvm.ptr, i64) -> i64
      %4220 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4221 = arith.constant 11 : i64
      %4222 = func.call @cc_make_string(%4220, %4221) : (!llvm.ptr, i64) -> i64
      %4223 = func.call @cc_intern(%4219, %4222) : (i64, i64) -> i64
      %4224 = func.call @cc_nil_value() : () -> i64
      %4225 = func.call @cc_cons(%4223, %4224) : (i64, i64) -> i64
      %4226 = func.call @cc_values_pack(%4225) : (i64) -> i64
      func.call @stack_push_pointer(%4223) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4227 = func.call @stack_pop_pointer() : () -> i64
      %4228 = func.call @stack_pop_pointer() : () -> i64
      %4229 = func.call @cc_cons(%4228, %4227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4230 = func.call @stack_pop_pointer() : () -> i64
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = func.call @cc_cons(%4231, %4230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %4233 = arith.addi %4232, %__rlasp_stack_elide_zero_184 : i64
      %4234 = func.call @stack_pop_pointer() : () -> i64
      %4235 = func.call @cc_cons(%4234, %4233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4235) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4236 = func.call @stack_pop_pointer() : () -> i64
      %4237 = func.call @stack_pop_pointer() : () -> i64
      %4238 = func.call @cc_cons(%4237, %4236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %4239 = arith.addi %4238, %__rlasp_stack_elide_zero_185 : i64
      %4240 = func.call @stack_pop_pointer() : () -> i64
      %4241 = func.call @cc_cons(%4240, %4239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4241) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4242 = func.call @stack_pop_pointer() : () -> i64
      %4243 = func.call @stack_pop_pointer() : () -> i64
      %4244 = func.call @cc_cons(%4243, %4242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %4245 = arith.addi %4244, %__rlasp_stack_elide_zero_186 : i64
      %4246 = func.call @stack_pop_pointer() : () -> i64
      %4247 = func.call @cc_cons(%4246, %4245) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %4248 = arith.addi %4247, %__rlasp_stack_elide_zero_187 : i64
      %4249 = func.call @stack_pop_pointer() : () -> i64
      %4250 = func.call @cc_cons(%4249, %4248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4250) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4251 = func.call @stack_pop_pointer() : () -> i64
      %4252 = func.call @stack_pop_pointer() : () -> i64
      %4253 = func.call @cc_cons(%4252, %4251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %4254 = arith.addi %4253, %__rlasp_stack_elide_zero_188 : i64
      %4255 = func.call @stack_pop_pointer() : () -> i64
      %4256 = func.call @cc_cons(%4255, %4254) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %4257 = arith.addi %4256, %__rlasp_stack_elide_zero_189 : i64
      %4314 = arith.constant 209815645192211 : i64
      %4315 = arith.constant 0 : i64
      %4316 = func.call @cc_make_closure(%4314, %4315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %4317 = arith.addi %4316, %__rlasp_stack_elide_zero_190 : i64
      %4318 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4319 = arith.constant 4 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = func.call @cc_nil_value() : () -> i64
      %4322 = func.call @cc_intern(%4320, %4321) : (i64, i64) -> i64
      %4323 = func.call @cc_nil_value() : () -> i64
      %4324 = func.call @cc_cons(%4322, %4323) : (i64, i64) -> i64
      %4325 = func.call @cc_values_pack(%4324) : (i64) -> i64
      func.call @stack_push_pointer(%4322) : (i64) -> ()
      %4326 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4327 = arith.constant 10 : i64
      %4328 = func.call @cc_make_string(%4326, %4327) : (!llvm.ptr, i64) -> i64
      %4329 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4330 = arith.constant 11 : i64
      %4331 = func.call @cc_make_string(%4329, %4330) : (!llvm.ptr, i64) -> i64
      %4332 = func.call @cc_intern(%4328, %4331) : (i64, i64) -> i64
      %4333 = func.call @cc_nil_value() : () -> i64
      %4334 = func.call @cc_cons(%4332, %4333) : (i64, i64) -> i64
      %4335 = func.call @cc_values_pack(%4334) : (i64) -> i64
      func.call @stack_push_pointer(%4332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4336 = func.call @stack_pop_pointer() : () -> i64
      %4337 = func.call @stack_pop_pointer() : () -> i64
      %4338 = func.call @cc_cons(%4337, %4336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %4339 = arith.addi %4338, %__rlasp_stack_elide_zero_191 : i64
      %4340 = func.call @stack_pop_pointer() : () -> i64
      %4341 = func.call @cc_cons(%4340, %4339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %4342 = arith.addi %4341, %__rlasp_stack_elide_zero_192 : i64
      %4343 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4344 = arith.constant 11 : i64
      %4345 = func.call @cc_make_string(%4343, %4344) : (!llvm.ptr, i64) -> i64
      %4346 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4347 = arith.constant 7 : i64
      %4348 = func.call @cc_make_string(%4346, %4347) : (!llvm.ptr, i64) -> i64
      %4349 = func.call @cc_intern(%4345, %4348) : (i64, i64) -> i64
      %4350 = func.call @cc_nil_value() : () -> i64
      %4351 = func.call @cc_cons(%4349, %4350) : (i64, i64) -> i64
      %4352 = func.call @cc_values_pack(%4351) : (i64) -> i64
      %4353 = func.call @cc_nil_value() : () -> i64
      %4354 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4355 = arith.constant 4 : i64
      %4356 = func.call @cc_make_string(%4354, %4355) : (!llvm.ptr, i64) -> i64
      %4357 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4358 = arith.constant 7 : i64
      %4359 = func.call @cc_make_string(%4357, %4358) : (!llvm.ptr, i64) -> i64
      %4360 = func.call @cc_intern(%4356, %4359) : (i64, i64) -> i64
      %4361 = func.call @cc_nil_value() : () -> i64
      %4362 = func.call @cc_cons(%4360, %4361) : (i64, i64) -> i64
      %4363 = func.call @cc_values_pack(%4362) : (i64) -> i64
      %4364 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4365 = arith.constant 5 : i64
      %4366 = func.call @cc_make_string(%4364, %4365) : (!llvm.ptr, i64) -> i64
      %4367 = func.call @cc_nil_value() : () -> i64
      %4368 = func.call @cc_intern(%4366, %4367) : (i64, i64) -> i64
      %4369 = func.call @cc_nil_value() : () -> i64
      %4370 = func.call @cc_cons(%4368, %4369) : (i64, i64) -> i64
      %4371 = func.call @cc_values_pack(%4370) : (i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %4372 = arith.addi %4368, %__rlasp_stack_elide_zero_193 : i64
      %4373 = func.call @cc_nil_value() : () -> i64
      %4374 = func.call @cc_errorp(%4180) : (i64) -> i64
      %4375 = arith.cmpi ne, %4374, %4373 : i64
      %4376 = arith.cmpi eq, %4373, %4373 : i64
      %4377 = arith.andi %4375, %4376 : i1
      %4378 = scf.if %4377 -> (i64) {
        scf.yield %4180 : i64
      } else {
        scf.yield %4373 : i64
      }
      %4379 = func.call @cc_errorp(%4257) : (i64) -> i64
      %4380 = arith.cmpi ne, %4379, %4373 : i64
      %4381 = arith.cmpi eq, %4378, %4373 : i64
      %4382 = arith.andi %4380, %4381 : i1
      %4383 = scf.if %4382 -> (i64) {
        scf.yield %4257 : i64
      } else {
        scf.yield %4378 : i64
      }
      %4384 = func.call @cc_errorp(%4317) : (i64) -> i64
      %4385 = arith.cmpi ne, %4384, %4373 : i64
      %4386 = arith.cmpi eq, %4383, %4373 : i64
      %4387 = arith.andi %4385, %4386 : i1
      %4388 = scf.if %4387 -> (i64) {
        scf.yield %4317 : i64
      } else {
        scf.yield %4383 : i64
      }
      %4389 = func.call @cc_errorp(%4342) : (i64) -> i64
      %4390 = arith.cmpi ne, %4389, %4373 : i64
      %4391 = arith.cmpi eq, %4388, %4373 : i64
      %4392 = arith.andi %4390, %4391 : i1
      %4393 = scf.if %4392 -> (i64) {
        scf.yield %4342 : i64
      } else {
        scf.yield %4388 : i64
      }
      %4394 = func.call @cc_errorp(%4349) : (i64) -> i64
      %4395 = arith.cmpi ne, %4394, %4373 : i64
      %4396 = arith.cmpi eq, %4393, %4373 : i64
      %4397 = arith.andi %4395, %4396 : i1
      %4398 = scf.if %4397 -> (i64) {
        scf.yield %4349 : i64
      } else {
        scf.yield %4393 : i64
      }
      %4399 = func.call @cc_errorp(%4353) : (i64) -> i64
      %4400 = arith.cmpi ne, %4399, %4373 : i64
      %4401 = arith.cmpi eq, %4398, %4373 : i64
      %4402 = arith.andi %4400, %4401 : i1
      %4403 = scf.if %4402 -> (i64) {
        scf.yield %4353 : i64
      } else {
        scf.yield %4398 : i64
      }
      %4404 = func.call @cc_errorp(%4360) : (i64) -> i64
      %4405 = arith.cmpi ne, %4404, %4373 : i64
      %4406 = arith.cmpi eq, %4403, %4373 : i64
      %4407 = arith.andi %4405, %4406 : i1
      %4408 = scf.if %4407 -> (i64) {
        scf.yield %4360 : i64
      } else {
        scf.yield %4403 : i64
      }
      %4409 = func.call @cc_errorp(%4372) : (i64) -> i64
      %4410 = arith.cmpi ne, %4409, %4373 : i64
      %4411 = arith.cmpi eq, %4408, %4373 : i64
      %4412 = arith.andi %4410, %4411 : i1
      %4413 = scf.if %4412 -> (i64) {
        scf.yield %4372 : i64
      } else {
        scf.yield %4408 : i64
      }
      %4414 = arith.cmpi ne, %4413, %4373 : i64
      scf.if %4414 {
        func.call @stack_push_pointer(%4413) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4180) : (i64) -> ()
        func.call @stack_push_pointer(%4257) : (i64) -> ()
        func.call @stack_push_pointer(%4317) : (i64) -> ()
        func.call @stack_push_pointer(%4342) : (i64) -> ()
        func.call @stack_push_pointer(%4349) : (i64) -> ()
        func.call @stack_push_pointer(%4353) : (i64) -> ()
        func.call @stack_push_pointer(%4360) : (i64) -> ()
        func.call @stack_push_pointer(%4372) : (i64) -> ()
        %4415 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4416 = func.call @cc_make_function_ref_const(%4415) : (!llvm.ptr) -> i64
        %4417 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4416, %4417) : (i64, i64) -> ()
      }
      %4418 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4418 : i64
    }
    %4419 = func.call @cc_nil_value() : () -> i64
    %4420 = func.call @cc_errorp(%4171) : (i64) -> i64
    %4421 = arith.cmpi ne, %4420, %4419 : i64
    %4422 = scf.if %4421 -> (i64) {
      scf.yield %4171 : i64
    } else {
      %4423 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4424 = arith.constant 12 : i64
      %4425 = func.call @cc_make_string(%4423, %4424) : (!llvm.ptr, i64) -> i64
      %4426 = func.call @cc_nil_value() : () -> i64
      %4427 = func.call @cc_intern(%4425, %4426) : (i64, i64) -> i64
      %4428 = func.call @cc_nil_value() : () -> i64
      %4429 = func.call @cc_cons(%4427, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_values_pack(%4429) : (i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %4431 = arith.addi %4427, %__rlasp_stack_elide_zero_194 : i64
      %4432 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4433 = arith.constant 13 : i64
      %4434 = func.call @cc_make_string(%4432, %4433) : (!llvm.ptr, i64) -> i64
      %4435 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4436 = arith.constant 11 : i64
      %4437 = func.call @cc_make_string(%4435, %4436) : (!llvm.ptr, i64) -> i64
      %4438 = func.call @cc_intern(%4434, %4437) : (i64, i64) -> i64
      %4439 = func.call @cc_nil_value() : () -> i64
      %4440 = func.call @cc_cons(%4438, %4439) : (i64, i64) -> i64
      %4441 = func.call @cc_values_pack(%4440) : (i64) -> i64
      func.call @stack_push_pointer(%4438) : (i64) -> ()
      %4442 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4443 = arith.constant 6 : i64
      %4444 = func.call @cc_make_string(%4442, %4443) : (!llvm.ptr, i64) -> i64
      %4445 = func.call @cc_nil_value() : () -> i64
      %4446 = func.call @cc_intern(%4444, %4445) : (i64, i64) -> i64
      %4447 = func.call @cc_nil_value() : () -> i64
      %4448 = func.call @cc_cons(%4446, %4447) : (i64, i64) -> i64
      %4449 = func.call @cc_values_pack(%4448) : (i64) -> i64
      func.call @stack_push_pointer(%4446) : (i64) -> ()
      %4450 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4451 = arith.constant 19 : i64
      %4452 = func.call @cc_make_string(%4450, %4451) : (!llvm.ptr, i64) -> i64
      %4453 = func.call @cc_nil_value() : () -> i64
      %4454 = func.call @cc_intern(%4452, %4453) : (i64, i64) -> i64
      %4455 = func.call @cc_nil_value() : () -> i64
      %4456 = func.call @cc_cons(%4454, %4455) : (i64, i64) -> i64
      %4457 = func.call @cc_values_pack(%4456) : (i64) -> i64
      func.call @stack_push_pointer(%4454) : (i64) -> ()
      %4458 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4459 = arith.constant 10 : i64
      %4460 = func.call @cc_make_string(%4458, %4459) : (!llvm.ptr, i64) -> i64
      %4461 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4462 = arith.constant 11 : i64
      %4463 = func.call @cc_make_string(%4461, %4462) : (!llvm.ptr, i64) -> i64
      %4464 = func.call @cc_intern(%4460, %4463) : (i64, i64) -> i64
      %4465 = func.call @cc_nil_value() : () -> i64
      %4466 = func.call @cc_cons(%4464, %4465) : (i64, i64) -> i64
      %4467 = func.call @cc_values_pack(%4466) : (i64) -> i64
      func.call @stack_push_pointer(%4464) : (i64) -> ()
      %4468 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4469 = arith.constant 15 : i64
      %4470 = func.call @cc_make_string(%4468, %4469) : (!llvm.ptr, i64) -> i64
      %4471 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4472 = arith.constant 11 : i64
      %4473 = func.call @cc_make_string(%4471, %4472) : (!llvm.ptr, i64) -> i64
      %4474 = func.call @cc_intern(%4470, %4473) : (i64, i64) -> i64
      %4475 = func.call @cc_nil_value() : () -> i64
      %4476 = func.call @cc_cons(%4474, %4475) : (i64, i64) -> i64
      %4477 = func.call @cc_values_pack(%4476) : (i64) -> i64
      func.call @stack_push_pointer(%4474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4478 = func.call @stack_pop_pointer() : () -> i64
      %4479 = func.call @stack_pop_pointer() : () -> i64
      %4480 = func.call @cc_cons(%4479, %4478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4480) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4481 = func.call @stack_pop_pointer() : () -> i64
      %4482 = func.call @stack_pop_pointer() : () -> i64
      %4483 = func.call @cc_cons(%4482, %4481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4484 = arith.addi %4483, %__rlasp_stack_elide_zero_195 : i64
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @cc_cons(%4485, %4484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4487 = func.call @stack_pop_pointer() : () -> i64
      %4488 = func.call @stack_pop_pointer() : () -> i64
      %4489 = func.call @cc_cons(%4488, %4487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %4490 = arith.addi %4489, %__rlasp_stack_elide_zero_196 : i64
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @cc_cons(%4491, %4490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = func.call @stack_pop_pointer() : () -> i64
      %4495 = func.call @cc_cons(%4494, %4493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %4496 = arith.addi %4495, %__rlasp_stack_elide_zero_197 : i64
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @cc_cons(%4497, %4496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4499 = arith.addi %4498, %__rlasp_stack_elide_zero_198 : i64
      %4500 = func.call @stack_pop_pointer() : () -> i64
      %4501 = func.call @cc_cons(%4500, %4499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = func.call @stack_pop_pointer() : () -> i64
      %4504 = func.call @cc_cons(%4503, %4502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4505 = arith.addi %4504, %__rlasp_stack_elide_zero_199 : i64
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @cc_cons(%4506, %4505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4508 = arith.addi %4507, %__rlasp_stack_elide_zero_200 : i64
      %4565 = arith.constant 209815645192212 : i64
      %4566 = arith.constant 0 : i64
      %4567 = func.call @cc_make_closure(%4565, %4566) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4568 = arith.addi %4567, %__rlasp_stack_elide_zero_201 : i64
      %4569 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4570 = arith.constant 4 : i64
      %4571 = func.call @cc_make_string(%4569, %4570) : (!llvm.ptr, i64) -> i64
      %4572 = func.call @cc_nil_value() : () -> i64
      %4573 = func.call @cc_intern(%4571, %4572) : (i64, i64) -> i64
      %4574 = func.call @cc_nil_value() : () -> i64
      %4575 = func.call @cc_cons(%4573, %4574) : (i64, i64) -> i64
      %4576 = func.call @cc_values_pack(%4575) : (i64) -> i64
      func.call @stack_push_pointer(%4573) : (i64) -> ()
      %4577 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4578 = arith.constant 10 : i64
      %4579 = func.call @cc_make_string(%4577, %4578) : (!llvm.ptr, i64) -> i64
      %4580 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4581 = arith.constant 11 : i64
      %4582 = func.call @cc_make_string(%4580, %4581) : (!llvm.ptr, i64) -> i64
      %4583 = func.call @cc_intern(%4579, %4582) : (i64, i64) -> i64
      %4584 = func.call @cc_nil_value() : () -> i64
      %4585 = func.call @cc_cons(%4583, %4584) : (i64, i64) -> i64
      %4586 = func.call @cc_values_pack(%4585) : (i64) -> i64
      func.call @stack_push_pointer(%4583) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4587 = func.call @stack_pop_pointer() : () -> i64
      %4588 = func.call @stack_pop_pointer() : () -> i64
      %4589 = func.call @cc_cons(%4588, %4587) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4590 = arith.addi %4589, %__rlasp_stack_elide_zero_202 : i64
      %4591 = func.call @stack_pop_pointer() : () -> i64
      %4592 = func.call @cc_cons(%4591, %4590) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4593 = arith.addi %4592, %__rlasp_stack_elide_zero_203 : i64
      %4594 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4595 = arith.constant 11 : i64
      %4596 = func.call @cc_make_string(%4594, %4595) : (!llvm.ptr, i64) -> i64
      %4597 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4598 = arith.constant 7 : i64
      %4599 = func.call @cc_make_string(%4597, %4598) : (!llvm.ptr, i64) -> i64
      %4600 = func.call @cc_intern(%4596, %4599) : (i64, i64) -> i64
      %4601 = func.call @cc_nil_value() : () -> i64
      %4602 = func.call @cc_cons(%4600, %4601) : (i64, i64) -> i64
      %4603 = func.call @cc_values_pack(%4602) : (i64) -> i64
      %4604 = func.call @cc_nil_value() : () -> i64
      %4605 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4606 = arith.constant 4 : i64
      %4607 = func.call @cc_make_string(%4605, %4606) : (!llvm.ptr, i64) -> i64
      %4608 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4609 = arith.constant 7 : i64
      %4610 = func.call @cc_make_string(%4608, %4609) : (!llvm.ptr, i64) -> i64
      %4611 = func.call @cc_intern(%4607, %4610) : (i64, i64) -> i64
      %4612 = func.call @cc_nil_value() : () -> i64
      %4613 = func.call @cc_cons(%4611, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_values_pack(%4613) : (i64) -> i64
      %4615 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4616 = arith.constant 5 : i64
      %4617 = func.call @cc_make_string(%4615, %4616) : (!llvm.ptr, i64) -> i64
      %4618 = func.call @cc_nil_value() : () -> i64
      %4619 = func.call @cc_intern(%4617, %4618) : (i64, i64) -> i64
      %4620 = func.call @cc_nil_value() : () -> i64
      %4621 = func.call @cc_cons(%4619, %4620) : (i64, i64) -> i64
      %4622 = func.call @cc_values_pack(%4621) : (i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4623 = arith.addi %4619, %__rlasp_stack_elide_zero_204 : i64
      %4624 = func.call @cc_nil_value() : () -> i64
      %4625 = func.call @cc_errorp(%4431) : (i64) -> i64
      %4626 = arith.cmpi ne, %4625, %4624 : i64
      %4627 = arith.cmpi eq, %4624, %4624 : i64
      %4628 = arith.andi %4626, %4627 : i1
      %4629 = scf.if %4628 -> (i64) {
        scf.yield %4431 : i64
      } else {
        scf.yield %4624 : i64
      }
      %4630 = func.call @cc_errorp(%4508) : (i64) -> i64
      %4631 = arith.cmpi ne, %4630, %4624 : i64
      %4632 = arith.cmpi eq, %4629, %4624 : i64
      %4633 = arith.andi %4631, %4632 : i1
      %4634 = scf.if %4633 -> (i64) {
        scf.yield %4508 : i64
      } else {
        scf.yield %4629 : i64
      }
      %4635 = func.call @cc_errorp(%4568) : (i64) -> i64
      %4636 = arith.cmpi ne, %4635, %4624 : i64
      %4637 = arith.cmpi eq, %4634, %4624 : i64
      %4638 = arith.andi %4636, %4637 : i1
      %4639 = scf.if %4638 -> (i64) {
        scf.yield %4568 : i64
      } else {
        scf.yield %4634 : i64
      }
      %4640 = func.call @cc_errorp(%4593) : (i64) -> i64
      %4641 = arith.cmpi ne, %4640, %4624 : i64
      %4642 = arith.cmpi eq, %4639, %4624 : i64
      %4643 = arith.andi %4641, %4642 : i1
      %4644 = scf.if %4643 -> (i64) {
        scf.yield %4593 : i64
      } else {
        scf.yield %4639 : i64
      }
      %4645 = func.call @cc_errorp(%4600) : (i64) -> i64
      %4646 = arith.cmpi ne, %4645, %4624 : i64
      %4647 = arith.cmpi eq, %4644, %4624 : i64
      %4648 = arith.andi %4646, %4647 : i1
      %4649 = scf.if %4648 -> (i64) {
        scf.yield %4600 : i64
      } else {
        scf.yield %4644 : i64
      }
      %4650 = func.call @cc_errorp(%4604) : (i64) -> i64
      %4651 = arith.cmpi ne, %4650, %4624 : i64
      %4652 = arith.cmpi eq, %4649, %4624 : i64
      %4653 = arith.andi %4651, %4652 : i1
      %4654 = scf.if %4653 -> (i64) {
        scf.yield %4604 : i64
      } else {
        scf.yield %4649 : i64
      }
      %4655 = func.call @cc_errorp(%4611) : (i64) -> i64
      %4656 = arith.cmpi ne, %4655, %4624 : i64
      %4657 = arith.cmpi eq, %4654, %4624 : i64
      %4658 = arith.andi %4656, %4657 : i1
      %4659 = scf.if %4658 -> (i64) {
        scf.yield %4611 : i64
      } else {
        scf.yield %4654 : i64
      }
      %4660 = func.call @cc_errorp(%4623) : (i64) -> i64
      %4661 = arith.cmpi ne, %4660, %4624 : i64
      %4662 = arith.cmpi eq, %4659, %4624 : i64
      %4663 = arith.andi %4661, %4662 : i1
      %4664 = scf.if %4663 -> (i64) {
        scf.yield %4623 : i64
      } else {
        scf.yield %4659 : i64
      }
      %4665 = arith.cmpi ne, %4664, %4624 : i64
      scf.if %4665 {
        func.call @stack_push_pointer(%4664) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4431) : (i64) -> ()
        func.call @stack_push_pointer(%4508) : (i64) -> ()
        func.call @stack_push_pointer(%4568) : (i64) -> ()
        func.call @stack_push_pointer(%4593) : (i64) -> ()
        func.call @stack_push_pointer(%4600) : (i64) -> ()
        func.call @stack_push_pointer(%4604) : (i64) -> ()
        func.call @stack_push_pointer(%4611) : (i64) -> ()
        func.call @stack_push_pointer(%4623) : (i64) -> ()
        %4666 = llvm.mlir.addressof @str351 : !llvm.ptr
        %4667 = func.call @cc_make_function_ref_const(%4666) : (!llvm.ptr) -> i64
        %4668 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4667, %4668) : (i64, i64) -> ()
      }
      %4669 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4669 : i64
    }
    %4670 = func.call @cc_nil_value() : () -> i64
    %4671 = func.call @cc_errorp(%4422) : (i64) -> i64
    %4672 = arith.cmpi ne, %4671, %4670 : i64
    %4673 = scf.if %4672 -> (i64) {
      scf.yield %4422 : i64
    } else {
      %4674 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4675 = arith.constant 12 : i64
      %4676 = func.call @cc_make_string(%4674, %4675) : (!llvm.ptr, i64) -> i64
      %4677 = func.call @cc_nil_value() : () -> i64
      %4678 = func.call @cc_intern(%4676, %4677) : (i64, i64) -> i64
      %4679 = func.call @cc_nil_value() : () -> i64
      %4680 = func.call @cc_cons(%4678, %4679) : (i64, i64) -> i64
      %4681 = func.call @cc_values_pack(%4680) : (i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4682 = arith.addi %4678, %__rlasp_stack_elide_zero_205 : i64
      %4683 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4684 = arith.constant 13 : i64
      %4685 = func.call @cc_make_string(%4683, %4684) : (!llvm.ptr, i64) -> i64
      %4686 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4687 = arith.constant 11 : i64
      %4688 = func.call @cc_make_string(%4686, %4687) : (!llvm.ptr, i64) -> i64
      %4689 = func.call @cc_intern(%4685, %4688) : (i64, i64) -> i64
      %4690 = func.call @cc_nil_value() : () -> i64
      %4691 = func.call @cc_cons(%4689, %4690) : (i64, i64) -> i64
      %4692 = func.call @cc_values_pack(%4691) : (i64) -> i64
      func.call @stack_push_pointer(%4689) : (i64) -> ()
      %4693 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4694 = arith.constant 6 : i64
      %4695 = func.call @cc_make_string(%4693, %4694) : (!llvm.ptr, i64) -> i64
      %4696 = func.call @cc_nil_value() : () -> i64
      %4697 = func.call @cc_intern(%4695, %4696) : (i64, i64) -> i64
      %4698 = func.call @cc_nil_value() : () -> i64
      %4699 = func.call @cc_cons(%4697, %4698) : (i64, i64) -> i64
      %4700 = func.call @cc_values_pack(%4699) : (i64) -> i64
      func.call @stack_push_pointer(%4697) : (i64) -> ()
      %4701 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4702 = arith.constant 19 : i64
      %4703 = func.call @cc_make_string(%4701, %4702) : (!llvm.ptr, i64) -> i64
      %4704 = func.call @cc_nil_value() : () -> i64
      %4705 = func.call @cc_intern(%4703, %4704) : (i64, i64) -> i64
      %4706 = func.call @cc_nil_value() : () -> i64
      %4707 = func.call @cc_cons(%4705, %4706) : (i64, i64) -> i64
      %4708 = func.call @cc_values_pack(%4707) : (i64) -> i64
      func.call @stack_push_pointer(%4705) : (i64) -> ()
      %4709 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4710 = arith.constant 13 : i64
      %4711 = func.call @cc_make_string(%4709, %4710) : (!llvm.ptr, i64) -> i64
      %4712 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4713 = arith.constant 11 : i64
      %4714 = func.call @cc_make_string(%4712, %4713) : (!llvm.ptr, i64) -> i64
      %4715 = func.call @cc_intern(%4711, %4714) : (i64, i64) -> i64
      %4716 = func.call @cc_nil_value() : () -> i64
      %4717 = func.call @cc_cons(%4715, %4716) : (i64, i64) -> i64
      %4718 = func.call @cc_values_pack(%4717) : (i64) -> i64
      func.call @stack_push_pointer(%4715) : (i64) -> ()
      %4719 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4720 = arith.constant 15 : i64
      %4721 = func.call @cc_make_string(%4719, %4720) : (!llvm.ptr, i64) -> i64
      %4722 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4723 = arith.constant 11 : i64
      %4724 = func.call @cc_make_string(%4722, %4723) : (!llvm.ptr, i64) -> i64
      %4725 = func.call @cc_intern(%4721, %4724) : (i64, i64) -> i64
      %4726 = func.call @cc_nil_value() : () -> i64
      %4727 = func.call @cc_cons(%4725, %4726) : (i64, i64) -> i64
      %4728 = func.call @cc_values_pack(%4727) : (i64) -> i64
      func.call @stack_push_pointer(%4725) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4729 = func.call @stack_pop_pointer() : () -> i64
      %4730 = func.call @stack_pop_pointer() : () -> i64
      %4731 = func.call @cc_cons(%4730, %4729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4732 = func.call @stack_pop_pointer() : () -> i64
      %4733 = func.call @stack_pop_pointer() : () -> i64
      %4734 = func.call @cc_cons(%4733, %4732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4735 = arith.addi %4734, %__rlasp_stack_elide_zero_206 : i64
      %4736 = func.call @stack_pop_pointer() : () -> i64
      %4737 = func.call @cc_cons(%4736, %4735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4737) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4738 = func.call @stack_pop_pointer() : () -> i64
      %4739 = func.call @stack_pop_pointer() : () -> i64
      %4740 = func.call @cc_cons(%4739, %4738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4741 = arith.addi %4740, %__rlasp_stack_elide_zero_207 : i64
      %4742 = func.call @stack_pop_pointer() : () -> i64
      %4743 = func.call @cc_cons(%4742, %4741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4743) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4744 = func.call @stack_pop_pointer() : () -> i64
      %4745 = func.call @stack_pop_pointer() : () -> i64
      %4746 = func.call @cc_cons(%4745, %4744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4747 = arith.addi %4746, %__rlasp_stack_elide_zero_208 : i64
      %4748 = func.call @stack_pop_pointer() : () -> i64
      %4749 = func.call @cc_cons(%4748, %4747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4750 = arith.addi %4749, %__rlasp_stack_elide_zero_209 : i64
      %4751 = func.call @stack_pop_pointer() : () -> i64
      %4752 = func.call @cc_cons(%4751, %4750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4753 = func.call @stack_pop_pointer() : () -> i64
      %4754 = func.call @stack_pop_pointer() : () -> i64
      %4755 = func.call @cc_cons(%4754, %4753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4756 = arith.addi %4755, %__rlasp_stack_elide_zero_210 : i64
      %4757 = func.call @stack_pop_pointer() : () -> i64
      %4758 = func.call @cc_cons(%4757, %4756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4759 = arith.addi %4758, %__rlasp_stack_elide_zero_211 : i64
      %4816 = arith.constant 209815645192213 : i64
      %4817 = arith.constant 0 : i64
      %4818 = func.call @cc_make_closure(%4816, %4817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4819 = arith.addi %4818, %__rlasp_stack_elide_zero_212 : i64
      %4820 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4821 = arith.constant 4 : i64
      %4822 = func.call @cc_make_string(%4820, %4821) : (!llvm.ptr, i64) -> i64
      %4823 = func.call @cc_nil_value() : () -> i64
      %4824 = func.call @cc_intern(%4822, %4823) : (i64, i64) -> i64
      %4825 = func.call @cc_nil_value() : () -> i64
      %4826 = func.call @cc_cons(%4824, %4825) : (i64, i64) -> i64
      %4827 = func.call @cc_values_pack(%4826) : (i64) -> i64
      func.call @stack_push_pointer(%4824) : (i64) -> ()
      %4828 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4829 = arith.constant 10 : i64
      %4830 = func.call @cc_make_string(%4828, %4829) : (!llvm.ptr, i64) -> i64
      %4831 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4832 = arith.constant 11 : i64
      %4833 = func.call @cc_make_string(%4831, %4832) : (!llvm.ptr, i64) -> i64
      %4834 = func.call @cc_intern(%4830, %4833) : (i64, i64) -> i64
      %4835 = func.call @cc_nil_value() : () -> i64
      %4836 = func.call @cc_cons(%4834, %4835) : (i64, i64) -> i64
      %4837 = func.call @cc_values_pack(%4836) : (i64) -> i64
      func.call @stack_push_pointer(%4834) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4838 = func.call @stack_pop_pointer() : () -> i64
      %4839 = func.call @stack_pop_pointer() : () -> i64
      %4840 = func.call @cc_cons(%4839, %4838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4841 = arith.addi %4840, %__rlasp_stack_elide_zero_213 : i64
      %4842 = func.call @stack_pop_pointer() : () -> i64
      %4843 = func.call @cc_cons(%4842, %4841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4844 = arith.addi %4843, %__rlasp_stack_elide_zero_214 : i64
      %4845 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4846 = arith.constant 11 : i64
      %4847 = func.call @cc_make_string(%4845, %4846) : (!llvm.ptr, i64) -> i64
      %4848 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4849 = arith.constant 7 : i64
      %4850 = func.call @cc_make_string(%4848, %4849) : (!llvm.ptr, i64) -> i64
      %4851 = func.call @cc_intern(%4847, %4850) : (i64, i64) -> i64
      %4852 = func.call @cc_nil_value() : () -> i64
      %4853 = func.call @cc_cons(%4851, %4852) : (i64, i64) -> i64
      %4854 = func.call @cc_values_pack(%4853) : (i64) -> i64
      %4855 = func.call @cc_nil_value() : () -> i64
      %4856 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4857 = arith.constant 4 : i64
      %4858 = func.call @cc_make_string(%4856, %4857) : (!llvm.ptr, i64) -> i64
      %4859 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4860 = arith.constant 7 : i64
      %4861 = func.call @cc_make_string(%4859, %4860) : (!llvm.ptr, i64) -> i64
      %4862 = func.call @cc_intern(%4858, %4861) : (i64, i64) -> i64
      %4863 = func.call @cc_nil_value() : () -> i64
      %4864 = func.call @cc_cons(%4862, %4863) : (i64, i64) -> i64
      %4865 = func.call @cc_values_pack(%4864) : (i64) -> i64
      %4866 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4867 = arith.constant 5 : i64
      %4868 = func.call @cc_make_string(%4866, %4867) : (!llvm.ptr, i64) -> i64
      %4869 = func.call @cc_nil_value() : () -> i64
      %4870 = func.call @cc_intern(%4868, %4869) : (i64, i64) -> i64
      %4871 = func.call @cc_nil_value() : () -> i64
      %4872 = func.call @cc_cons(%4870, %4871) : (i64, i64) -> i64
      %4873 = func.call @cc_values_pack(%4872) : (i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4874 = arith.addi %4870, %__rlasp_stack_elide_zero_215 : i64
      %4875 = func.call @cc_nil_value() : () -> i64
      %4876 = func.call @cc_errorp(%4682) : (i64) -> i64
      %4877 = arith.cmpi ne, %4876, %4875 : i64
      %4878 = arith.cmpi eq, %4875, %4875 : i64
      %4879 = arith.andi %4877, %4878 : i1
      %4880 = scf.if %4879 -> (i64) {
        scf.yield %4682 : i64
      } else {
        scf.yield %4875 : i64
      }
      %4881 = func.call @cc_errorp(%4759) : (i64) -> i64
      %4882 = arith.cmpi ne, %4881, %4875 : i64
      %4883 = arith.cmpi eq, %4880, %4875 : i64
      %4884 = arith.andi %4882, %4883 : i1
      %4885 = scf.if %4884 -> (i64) {
        scf.yield %4759 : i64
      } else {
        scf.yield %4880 : i64
      }
      %4886 = func.call @cc_errorp(%4819) : (i64) -> i64
      %4887 = arith.cmpi ne, %4886, %4875 : i64
      %4888 = arith.cmpi eq, %4885, %4875 : i64
      %4889 = arith.andi %4887, %4888 : i1
      %4890 = scf.if %4889 -> (i64) {
        scf.yield %4819 : i64
      } else {
        scf.yield %4885 : i64
      }
      %4891 = func.call @cc_errorp(%4844) : (i64) -> i64
      %4892 = arith.cmpi ne, %4891, %4875 : i64
      %4893 = arith.cmpi eq, %4890, %4875 : i64
      %4894 = arith.andi %4892, %4893 : i1
      %4895 = scf.if %4894 -> (i64) {
        scf.yield %4844 : i64
      } else {
        scf.yield %4890 : i64
      }
      %4896 = func.call @cc_errorp(%4851) : (i64) -> i64
      %4897 = arith.cmpi ne, %4896, %4875 : i64
      %4898 = arith.cmpi eq, %4895, %4875 : i64
      %4899 = arith.andi %4897, %4898 : i1
      %4900 = scf.if %4899 -> (i64) {
        scf.yield %4851 : i64
      } else {
        scf.yield %4895 : i64
      }
      %4901 = func.call @cc_errorp(%4855) : (i64) -> i64
      %4902 = arith.cmpi ne, %4901, %4875 : i64
      %4903 = arith.cmpi eq, %4900, %4875 : i64
      %4904 = arith.andi %4902, %4903 : i1
      %4905 = scf.if %4904 -> (i64) {
        scf.yield %4855 : i64
      } else {
        scf.yield %4900 : i64
      }
      %4906 = func.call @cc_errorp(%4862) : (i64) -> i64
      %4907 = arith.cmpi ne, %4906, %4875 : i64
      %4908 = arith.cmpi eq, %4905, %4875 : i64
      %4909 = arith.andi %4907, %4908 : i1
      %4910 = scf.if %4909 -> (i64) {
        scf.yield %4862 : i64
      } else {
        scf.yield %4905 : i64
      }
      %4911 = func.call @cc_errorp(%4874) : (i64) -> i64
      %4912 = arith.cmpi ne, %4911, %4875 : i64
      %4913 = arith.cmpi eq, %4910, %4875 : i64
      %4914 = arith.andi %4912, %4913 : i1
      %4915 = scf.if %4914 -> (i64) {
        scf.yield %4874 : i64
      } else {
        scf.yield %4910 : i64
      }
      %4916 = arith.cmpi ne, %4915, %4875 : i64
      scf.if %4916 {
        func.call @stack_push_pointer(%4915) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4682) : (i64) -> ()
        func.call @stack_push_pointer(%4759) : (i64) -> ()
        func.call @stack_push_pointer(%4819) : (i64) -> ()
        func.call @stack_push_pointer(%4844) : (i64) -> ()
        func.call @stack_push_pointer(%4851) : (i64) -> ()
        func.call @stack_push_pointer(%4855) : (i64) -> ()
        func.call @stack_push_pointer(%4862) : (i64) -> ()
        func.call @stack_push_pointer(%4874) : (i64) -> ()
        %4917 = llvm.mlir.addressof @str370 : !llvm.ptr
        %4918 = func.call @cc_make_function_ref_const(%4917) : (!llvm.ptr) -> i64
        %4919 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4918, %4919) : (i64, i64) -> ()
      }
      %4920 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4920 : i64
    }
    %4921 = func.call @cc_nil_value() : () -> i64
    %4922 = func.call @cc_errorp(%4673) : (i64) -> i64
    %4923 = arith.cmpi ne, %4922, %4921 : i64
    %4924 = scf.if %4923 -> (i64) {
      scf.yield %4673 : i64
    } else {
      %4925 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4926 = arith.constant 12 : i64
      %4927 = func.call @cc_make_string(%4925, %4926) : (!llvm.ptr, i64) -> i64
      %4928 = func.call @cc_nil_value() : () -> i64
      %4929 = func.call @cc_intern(%4927, %4928) : (i64, i64) -> i64
      %4930 = func.call @cc_nil_value() : () -> i64
      %4931 = func.call @cc_cons(%4929, %4930) : (i64, i64) -> i64
      %4932 = func.call @cc_values_pack(%4931) : (i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4933 = arith.addi %4929, %__rlasp_stack_elide_zero_216 : i64
      %4934 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4935 = arith.constant 13 : i64
      %4936 = func.call @cc_make_string(%4934, %4935) : (!llvm.ptr, i64) -> i64
      %4937 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4938 = arith.constant 11 : i64
      %4939 = func.call @cc_make_string(%4937, %4938) : (!llvm.ptr, i64) -> i64
      %4940 = func.call @cc_intern(%4936, %4939) : (i64, i64) -> i64
      %4941 = func.call @cc_nil_value() : () -> i64
      %4942 = func.call @cc_cons(%4940, %4941) : (i64, i64) -> i64
      %4943 = func.call @cc_values_pack(%4942) : (i64) -> i64
      func.call @stack_push_pointer(%4940) : (i64) -> ()
      %4944 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4945 = arith.constant 6 : i64
      %4946 = func.call @cc_make_string(%4944, %4945) : (!llvm.ptr, i64) -> i64
      %4947 = func.call @cc_nil_value() : () -> i64
      %4948 = func.call @cc_intern(%4946, %4947) : (i64, i64) -> i64
      %4949 = func.call @cc_nil_value() : () -> i64
      %4950 = func.call @cc_cons(%4948, %4949) : (i64, i64) -> i64
      %4951 = func.call @cc_values_pack(%4950) : (i64) -> i64
      func.call @stack_push_pointer(%4948) : (i64) -> ()
      %4952 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4953 = arith.constant 19 : i64
      %4954 = func.call @cc_make_string(%4952, %4953) : (!llvm.ptr, i64) -> i64
      %4955 = func.call @cc_nil_value() : () -> i64
      %4956 = func.call @cc_intern(%4954, %4955) : (i64, i64) -> i64
      %4957 = func.call @cc_nil_value() : () -> i64
      %4958 = func.call @cc_cons(%4956, %4957) : (i64, i64) -> i64
      %4959 = func.call @cc_values_pack(%4958) : (i64) -> i64
      func.call @stack_push_pointer(%4956) : (i64) -> ()
      %4960 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4961 = arith.constant 10 : i64
      %4962 = func.call @cc_make_string(%4960, %4961) : (!llvm.ptr, i64) -> i64
      %4963 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4964 = arith.constant 11 : i64
      %4965 = func.call @cc_make_string(%4963, %4964) : (!llvm.ptr, i64) -> i64
      %4966 = func.call @cc_intern(%4962, %4965) : (i64, i64) -> i64
      %4967 = func.call @cc_nil_value() : () -> i64
      %4968 = func.call @cc_cons(%4966, %4967) : (i64, i64) -> i64
      %4969 = func.call @cc_values_pack(%4968) : (i64) -> i64
      func.call @stack_push_pointer(%4966) : (i64) -> ()
      %4970 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4971 = arith.constant 15 : i64
      %4972 = func.call @cc_make_string(%4970, %4971) : (!llvm.ptr, i64) -> i64
      %4973 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4974 = arith.constant 11 : i64
      %4975 = func.call @cc_make_string(%4973, %4974) : (!llvm.ptr, i64) -> i64
      %4976 = func.call @cc_intern(%4972, %4975) : (i64, i64) -> i64
      %4977 = func.call @cc_nil_value() : () -> i64
      %4978 = func.call @cc_cons(%4976, %4977) : (i64, i64) -> i64
      %4979 = func.call @cc_values_pack(%4978) : (i64) -> i64
      func.call @stack_push_pointer(%4976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4980 = func.call @stack_pop_pointer() : () -> i64
      %4981 = func.call @stack_pop_pointer() : () -> i64
      %4982 = func.call @cc_cons(%4981, %4980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4982) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4983 = func.call @stack_pop_pointer() : () -> i64
      %4984 = func.call @stack_pop_pointer() : () -> i64
      %4985 = func.call @cc_cons(%4984, %4983) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4986 = arith.addi %4985, %__rlasp_stack_elide_zero_217 : i64
      %4987 = func.call @stack_pop_pointer() : () -> i64
      %4988 = func.call @cc_cons(%4987, %4986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4988) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4989 = func.call @stack_pop_pointer() : () -> i64
      %4990 = func.call @stack_pop_pointer() : () -> i64
      %4991 = func.call @cc_cons(%4990, %4989) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4992 = arith.addi %4991, %__rlasp_stack_elide_zero_218 : i64
      %4993 = func.call @stack_pop_pointer() : () -> i64
      %4994 = func.call @cc_cons(%4993, %4992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4995 = func.call @stack_pop_pointer() : () -> i64
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @cc_cons(%4996, %4995) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4998 = arith.addi %4997, %__rlasp_stack_elide_zero_219 : i64
      %4999 = func.call @stack_pop_pointer() : () -> i64
      %5000 = func.call @cc_cons(%4999, %4998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %5001 = arith.addi %5000, %__rlasp_stack_elide_zero_220 : i64
      %5002 = func.call @stack_pop_pointer() : () -> i64
      %5003 = func.call @cc_cons(%5002, %5001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5004 = func.call @stack_pop_pointer() : () -> i64
      %5005 = func.call @stack_pop_pointer() : () -> i64
      %5006 = func.call @cc_cons(%5005, %5004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %5007 = arith.addi %5006, %__rlasp_stack_elide_zero_221 : i64
      %5008 = func.call @stack_pop_pointer() : () -> i64
      %5009 = func.call @cc_cons(%5008, %5007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %5010 = arith.addi %5009, %__rlasp_stack_elide_zero_222 : i64
      %5067 = arith.constant 209815645192214 : i64
      %5068 = arith.constant 0 : i64
      %5069 = func.call @cc_make_closure(%5067, %5068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %5070 = arith.addi %5069, %__rlasp_stack_elide_zero_223 : i64
      %5071 = llvm.mlir.addressof @str381 : !llvm.ptr
      %5072 = arith.constant 4 : i64
      %5073 = func.call @cc_make_string(%5071, %5072) : (!llvm.ptr, i64) -> i64
      %5074 = func.call @cc_nil_value() : () -> i64
      %5075 = func.call @cc_intern(%5073, %5074) : (i64, i64) -> i64
      %5076 = func.call @cc_nil_value() : () -> i64
      %5077 = func.call @cc_cons(%5075, %5076) : (i64, i64) -> i64
      %5078 = func.call @cc_values_pack(%5077) : (i64) -> i64
      func.call @stack_push_pointer(%5075) : (i64) -> ()
      %5079 = llvm.mlir.addressof @str382 : !llvm.ptr
      %5080 = arith.constant 10 : i64
      %5081 = func.call @cc_make_string(%5079, %5080) : (!llvm.ptr, i64) -> i64
      %5082 = llvm.mlir.addressof @str383 : !llvm.ptr
      %5083 = arith.constant 11 : i64
      %5084 = func.call @cc_make_string(%5082, %5083) : (!llvm.ptr, i64) -> i64
      %5085 = func.call @cc_intern(%5081, %5084) : (i64, i64) -> i64
      %5086 = func.call @cc_nil_value() : () -> i64
      %5087 = func.call @cc_cons(%5085, %5086) : (i64, i64) -> i64
      %5088 = func.call @cc_values_pack(%5087) : (i64) -> i64
      func.call @stack_push_pointer(%5085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5089 = func.call @stack_pop_pointer() : () -> i64
      %5090 = func.call @stack_pop_pointer() : () -> i64
      %5091 = func.call @cc_cons(%5090, %5089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %5092 = arith.addi %5091, %__rlasp_stack_elide_zero_224 : i64
      %5093 = func.call @stack_pop_pointer() : () -> i64
      %5094 = func.call @cc_cons(%5093, %5092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %5095 = arith.addi %5094, %__rlasp_stack_elide_zero_225 : i64
      %5096 = llvm.mlir.addressof @str384 : !llvm.ptr
      %5097 = arith.constant 11 : i64
      %5098 = func.call @cc_make_string(%5096, %5097) : (!llvm.ptr, i64) -> i64
      %5099 = llvm.mlir.addressof @str385 : !llvm.ptr
      %5100 = arith.constant 7 : i64
      %5101 = func.call @cc_make_string(%5099, %5100) : (!llvm.ptr, i64) -> i64
      %5102 = func.call @cc_intern(%5098, %5101) : (i64, i64) -> i64
      %5103 = func.call @cc_nil_value() : () -> i64
      %5104 = func.call @cc_cons(%5102, %5103) : (i64, i64) -> i64
      %5105 = func.call @cc_values_pack(%5104) : (i64) -> i64
      %5106 = func.call @cc_nil_value() : () -> i64
      %5107 = llvm.mlir.addressof @str386 : !llvm.ptr
      %5108 = arith.constant 4 : i64
      %5109 = func.call @cc_make_string(%5107, %5108) : (!llvm.ptr, i64) -> i64
      %5110 = llvm.mlir.addressof @str387 : !llvm.ptr
      %5111 = arith.constant 7 : i64
      %5112 = func.call @cc_make_string(%5110, %5111) : (!llvm.ptr, i64) -> i64
      %5113 = func.call @cc_intern(%5109, %5112) : (i64, i64) -> i64
      %5114 = func.call @cc_nil_value() : () -> i64
      %5115 = func.call @cc_cons(%5113, %5114) : (i64, i64) -> i64
      %5116 = func.call @cc_values_pack(%5115) : (i64) -> i64
      %5117 = llvm.mlir.addressof @str388 : !llvm.ptr
      %5118 = arith.constant 5 : i64
      %5119 = func.call @cc_make_string(%5117, %5118) : (!llvm.ptr, i64) -> i64
      %5120 = func.call @cc_nil_value() : () -> i64
      %5121 = func.call @cc_intern(%5119, %5120) : (i64, i64) -> i64
      %5122 = func.call @cc_nil_value() : () -> i64
      %5123 = func.call @cc_cons(%5121, %5122) : (i64, i64) -> i64
      %5124 = func.call @cc_values_pack(%5123) : (i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %5125 = arith.addi %5121, %__rlasp_stack_elide_zero_226 : i64
      %5126 = func.call @cc_nil_value() : () -> i64
      %5127 = func.call @cc_errorp(%4933) : (i64) -> i64
      %5128 = arith.cmpi ne, %5127, %5126 : i64
      %5129 = arith.cmpi eq, %5126, %5126 : i64
      %5130 = arith.andi %5128, %5129 : i1
      %5131 = scf.if %5130 -> (i64) {
        scf.yield %4933 : i64
      } else {
        scf.yield %5126 : i64
      }
      %5132 = func.call @cc_errorp(%5010) : (i64) -> i64
      %5133 = arith.cmpi ne, %5132, %5126 : i64
      %5134 = arith.cmpi eq, %5131, %5126 : i64
      %5135 = arith.andi %5133, %5134 : i1
      %5136 = scf.if %5135 -> (i64) {
        scf.yield %5010 : i64
      } else {
        scf.yield %5131 : i64
      }
      %5137 = func.call @cc_errorp(%5070) : (i64) -> i64
      %5138 = arith.cmpi ne, %5137, %5126 : i64
      %5139 = arith.cmpi eq, %5136, %5126 : i64
      %5140 = arith.andi %5138, %5139 : i1
      %5141 = scf.if %5140 -> (i64) {
        scf.yield %5070 : i64
      } else {
        scf.yield %5136 : i64
      }
      %5142 = func.call @cc_errorp(%5095) : (i64) -> i64
      %5143 = arith.cmpi ne, %5142, %5126 : i64
      %5144 = arith.cmpi eq, %5141, %5126 : i64
      %5145 = arith.andi %5143, %5144 : i1
      %5146 = scf.if %5145 -> (i64) {
        scf.yield %5095 : i64
      } else {
        scf.yield %5141 : i64
      }
      %5147 = func.call @cc_errorp(%5102) : (i64) -> i64
      %5148 = arith.cmpi ne, %5147, %5126 : i64
      %5149 = arith.cmpi eq, %5146, %5126 : i64
      %5150 = arith.andi %5148, %5149 : i1
      %5151 = scf.if %5150 -> (i64) {
        scf.yield %5102 : i64
      } else {
        scf.yield %5146 : i64
      }
      %5152 = func.call @cc_errorp(%5106) : (i64) -> i64
      %5153 = arith.cmpi ne, %5152, %5126 : i64
      %5154 = arith.cmpi eq, %5151, %5126 : i64
      %5155 = arith.andi %5153, %5154 : i1
      %5156 = scf.if %5155 -> (i64) {
        scf.yield %5106 : i64
      } else {
        scf.yield %5151 : i64
      }
      %5157 = func.call @cc_errorp(%5113) : (i64) -> i64
      %5158 = arith.cmpi ne, %5157, %5126 : i64
      %5159 = arith.cmpi eq, %5156, %5126 : i64
      %5160 = arith.andi %5158, %5159 : i1
      %5161 = scf.if %5160 -> (i64) {
        scf.yield %5113 : i64
      } else {
        scf.yield %5156 : i64
      }
      %5162 = func.call @cc_errorp(%5125) : (i64) -> i64
      %5163 = arith.cmpi ne, %5162, %5126 : i64
      %5164 = arith.cmpi eq, %5161, %5126 : i64
      %5165 = arith.andi %5163, %5164 : i1
      %5166 = scf.if %5165 -> (i64) {
        scf.yield %5125 : i64
      } else {
        scf.yield %5161 : i64
      }
      %5167 = arith.cmpi ne, %5166, %5126 : i64
      scf.if %5167 {
        func.call @stack_push_pointer(%5166) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4933) : (i64) -> ()
        func.call @stack_push_pointer(%5010) : (i64) -> ()
        func.call @stack_push_pointer(%5070) : (i64) -> ()
        func.call @stack_push_pointer(%5095) : (i64) -> ()
        func.call @stack_push_pointer(%5102) : (i64) -> ()
        func.call @stack_push_pointer(%5106) : (i64) -> ()
        func.call @stack_push_pointer(%5113) : (i64) -> ()
        func.call @stack_push_pointer(%5125) : (i64) -> ()
        %5168 = llvm.mlir.addressof @str389 : !llvm.ptr
        %5169 = func.call @cc_make_function_ref_const(%5168) : (!llvm.ptr) -> i64
        %5170 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5169, %5170) : (i64, i64) -> ()
      }
      %5171 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5171 : i64
    }
    %5172 = func.call @cc_nil_value() : () -> i64
    %5173 = func.call @cc_errorp(%4924) : (i64) -> i64
    %5174 = arith.cmpi ne, %5173, %5172 : i64
    %5175 = scf.if %5174 -> (i64) {
      scf.yield %4924 : i64
    } else {
      %5176 = llvm.mlir.addressof @str390 : !llvm.ptr
      %5177 = arith.constant 12 : i64
      %5178 = func.call @cc_make_string(%5176, %5177) : (!llvm.ptr, i64) -> i64
      %5179 = func.call @cc_nil_value() : () -> i64
      %5180 = func.call @cc_intern(%5178, %5179) : (i64, i64) -> i64
      %5181 = func.call @cc_nil_value() : () -> i64
      %5182 = func.call @cc_cons(%5180, %5181) : (i64, i64) -> i64
      %5183 = func.call @cc_values_pack(%5182) : (i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %5184 = arith.addi %5180, %__rlasp_stack_elide_zero_227 : i64
      %5185 = llvm.mlir.addressof @str391 : !llvm.ptr
      %5186 = arith.constant 13 : i64
      %5187 = func.call @cc_make_string(%5185, %5186) : (!llvm.ptr, i64) -> i64
      %5188 = llvm.mlir.addressof @str392 : !llvm.ptr
      %5189 = arith.constant 11 : i64
      %5190 = func.call @cc_make_string(%5188, %5189) : (!llvm.ptr, i64) -> i64
      %5191 = func.call @cc_intern(%5187, %5190) : (i64, i64) -> i64
      %5192 = func.call @cc_nil_value() : () -> i64
      %5193 = func.call @cc_cons(%5191, %5192) : (i64, i64) -> i64
      %5194 = func.call @cc_values_pack(%5193) : (i64) -> i64
      func.call @stack_push_pointer(%5191) : (i64) -> ()
      %5195 = llvm.mlir.addressof @str393 : !llvm.ptr
      %5196 = arith.constant 6 : i64
      %5197 = func.call @cc_make_string(%5195, %5196) : (!llvm.ptr, i64) -> i64
      %5198 = func.call @cc_nil_value() : () -> i64
      %5199 = func.call @cc_intern(%5197, %5198) : (i64, i64) -> i64
      %5200 = func.call @cc_nil_value() : () -> i64
      %5201 = func.call @cc_cons(%5199, %5200) : (i64, i64) -> i64
      %5202 = func.call @cc_values_pack(%5201) : (i64) -> i64
      func.call @stack_push_pointer(%5199) : (i64) -> ()
      %5203 = llvm.mlir.addressof @str394 : !llvm.ptr
      %5204 = arith.constant 19 : i64
      %5205 = func.call @cc_make_string(%5203, %5204) : (!llvm.ptr, i64) -> i64
      %5206 = func.call @cc_nil_value() : () -> i64
      %5207 = func.call @cc_intern(%5205, %5206) : (i64, i64) -> i64
      %5208 = func.call @cc_nil_value() : () -> i64
      %5209 = func.call @cc_cons(%5207, %5208) : (i64, i64) -> i64
      %5210 = func.call @cc_values_pack(%5209) : (i64) -> i64
      func.call @stack_push_pointer(%5207) : (i64) -> ()
      %5211 = llvm.mlir.addressof @str395 : !llvm.ptr
      %5212 = arith.constant 14 : i64
      %5213 = func.call @cc_make_string(%5211, %5212) : (!llvm.ptr, i64) -> i64
      %5214 = llvm.mlir.addressof @str396 : !llvm.ptr
      %5215 = arith.constant 11 : i64
      %5216 = func.call @cc_make_string(%5214, %5215) : (!llvm.ptr, i64) -> i64
      %5217 = func.call @cc_intern(%5213, %5216) : (i64, i64) -> i64
      %5218 = func.call @cc_nil_value() : () -> i64
      %5219 = func.call @cc_cons(%5217, %5218) : (i64, i64) -> i64
      %5220 = func.call @cc_values_pack(%5219) : (i64) -> i64
      func.call @stack_push_pointer(%5217) : (i64) -> ()
      %5221 = llvm.mlir.addressof @str397 : !llvm.ptr
      %5222 = arith.constant 15 : i64
      %5223 = func.call @cc_make_string(%5221, %5222) : (!llvm.ptr, i64) -> i64
      %5224 = llvm.mlir.addressof @str398 : !llvm.ptr
      %5225 = arith.constant 11 : i64
      %5226 = func.call @cc_make_string(%5224, %5225) : (!llvm.ptr, i64) -> i64
      %5227 = func.call @cc_intern(%5223, %5226) : (i64, i64) -> i64
      %5228 = func.call @cc_nil_value() : () -> i64
      %5229 = func.call @cc_cons(%5227, %5228) : (i64, i64) -> i64
      %5230 = func.call @cc_values_pack(%5229) : (i64) -> i64
      func.call @stack_push_pointer(%5227) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5231 = func.call @stack_pop_pointer() : () -> i64
      %5232 = func.call @stack_pop_pointer() : () -> i64
      %5233 = func.call @cc_cons(%5232, %5231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5233) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5234 = func.call @stack_pop_pointer() : () -> i64
      %5235 = func.call @stack_pop_pointer() : () -> i64
      %5236 = func.call @cc_cons(%5235, %5234) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %5237 = arith.addi %5236, %__rlasp_stack_elide_zero_228 : i64
      %5238 = func.call @stack_pop_pointer() : () -> i64
      %5239 = func.call @cc_cons(%5238, %5237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5239) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5240 = func.call @stack_pop_pointer() : () -> i64
      %5241 = func.call @stack_pop_pointer() : () -> i64
      %5242 = func.call @cc_cons(%5241, %5240) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %5243 = arith.addi %5242, %__rlasp_stack_elide_zero_229 : i64
      %5244 = func.call @stack_pop_pointer() : () -> i64
      %5245 = func.call @cc_cons(%5244, %5243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5246 = func.call @stack_pop_pointer() : () -> i64
      %5247 = func.call @stack_pop_pointer() : () -> i64
      %5248 = func.call @cc_cons(%5247, %5246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %5249 = arith.addi %5248, %__rlasp_stack_elide_zero_230 : i64
      %5250 = func.call @stack_pop_pointer() : () -> i64
      %5251 = func.call @cc_cons(%5250, %5249) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %5252 = arith.addi %5251, %__rlasp_stack_elide_zero_231 : i64
      %5253 = func.call @stack_pop_pointer() : () -> i64
      %5254 = func.call @cc_cons(%5253, %5252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5254) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5255 = func.call @stack_pop_pointer() : () -> i64
      %5256 = func.call @stack_pop_pointer() : () -> i64
      %5257 = func.call @cc_cons(%5256, %5255) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %5258 = arith.addi %5257, %__rlasp_stack_elide_zero_232 : i64
      %5259 = func.call @stack_pop_pointer() : () -> i64
      %5260 = func.call @cc_cons(%5259, %5258) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %5261 = arith.addi %5260, %__rlasp_stack_elide_zero_233 : i64
      %5318 = arith.constant 209815645192215 : i64
      %5319 = arith.constant 0 : i64
      %5320 = func.call @cc_make_closure(%5318, %5319) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %5321 = arith.addi %5320, %__rlasp_stack_elide_zero_234 : i64
      %5322 = llvm.mlir.addressof @str400 : !llvm.ptr
      %5323 = arith.constant 4 : i64
      %5324 = func.call @cc_make_string(%5322, %5323) : (!llvm.ptr, i64) -> i64
      %5325 = func.call @cc_nil_value() : () -> i64
      %5326 = func.call @cc_intern(%5324, %5325) : (i64, i64) -> i64
      %5327 = func.call @cc_nil_value() : () -> i64
      %5328 = func.call @cc_cons(%5326, %5327) : (i64, i64) -> i64
      %5329 = func.call @cc_values_pack(%5328) : (i64) -> i64
      func.call @stack_push_pointer(%5326) : (i64) -> ()
      %5330 = llvm.mlir.addressof @str401 : !llvm.ptr
      %5331 = arith.constant 10 : i64
      %5332 = func.call @cc_make_string(%5330, %5331) : (!llvm.ptr, i64) -> i64
      %5333 = llvm.mlir.addressof @str402 : !llvm.ptr
      %5334 = arith.constant 11 : i64
      %5335 = func.call @cc_make_string(%5333, %5334) : (!llvm.ptr, i64) -> i64
      %5336 = func.call @cc_intern(%5332, %5335) : (i64, i64) -> i64
      %5337 = func.call @cc_nil_value() : () -> i64
      %5338 = func.call @cc_cons(%5336, %5337) : (i64, i64) -> i64
      %5339 = func.call @cc_values_pack(%5338) : (i64) -> i64
      func.call @stack_push_pointer(%5336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5340 = func.call @stack_pop_pointer() : () -> i64
      %5341 = func.call @stack_pop_pointer() : () -> i64
      %5342 = func.call @cc_cons(%5341, %5340) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %5343 = arith.addi %5342, %__rlasp_stack_elide_zero_235 : i64
      %5344 = func.call @stack_pop_pointer() : () -> i64
      %5345 = func.call @cc_cons(%5344, %5343) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %5346 = arith.addi %5345, %__rlasp_stack_elide_zero_236 : i64
      %5347 = llvm.mlir.addressof @str403 : !llvm.ptr
      %5348 = arith.constant 11 : i64
      %5349 = func.call @cc_make_string(%5347, %5348) : (!llvm.ptr, i64) -> i64
      %5350 = llvm.mlir.addressof @str404 : !llvm.ptr
      %5351 = arith.constant 7 : i64
      %5352 = func.call @cc_make_string(%5350, %5351) : (!llvm.ptr, i64) -> i64
      %5353 = func.call @cc_intern(%5349, %5352) : (i64, i64) -> i64
      %5354 = func.call @cc_nil_value() : () -> i64
      %5355 = func.call @cc_cons(%5353, %5354) : (i64, i64) -> i64
      %5356 = func.call @cc_values_pack(%5355) : (i64) -> i64
      %5357 = func.call @cc_nil_value() : () -> i64
      %5358 = llvm.mlir.addressof @str405 : !llvm.ptr
      %5359 = arith.constant 4 : i64
      %5360 = func.call @cc_make_string(%5358, %5359) : (!llvm.ptr, i64) -> i64
      %5361 = llvm.mlir.addressof @str406 : !llvm.ptr
      %5362 = arith.constant 7 : i64
      %5363 = func.call @cc_make_string(%5361, %5362) : (!llvm.ptr, i64) -> i64
      %5364 = func.call @cc_intern(%5360, %5363) : (i64, i64) -> i64
      %5365 = func.call @cc_nil_value() : () -> i64
      %5366 = func.call @cc_cons(%5364, %5365) : (i64, i64) -> i64
      %5367 = func.call @cc_values_pack(%5366) : (i64) -> i64
      %5368 = llvm.mlir.addressof @str407 : !llvm.ptr
      %5369 = arith.constant 5 : i64
      %5370 = func.call @cc_make_string(%5368, %5369) : (!llvm.ptr, i64) -> i64
      %5371 = func.call @cc_nil_value() : () -> i64
      %5372 = func.call @cc_intern(%5370, %5371) : (i64, i64) -> i64
      %5373 = func.call @cc_nil_value() : () -> i64
      %5374 = func.call @cc_cons(%5372, %5373) : (i64, i64) -> i64
      %5375 = func.call @cc_values_pack(%5374) : (i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %5376 = arith.addi %5372, %__rlasp_stack_elide_zero_237 : i64
      %5377 = func.call @cc_nil_value() : () -> i64
      %5378 = func.call @cc_errorp(%5184) : (i64) -> i64
      %5379 = arith.cmpi ne, %5378, %5377 : i64
      %5380 = arith.cmpi eq, %5377, %5377 : i64
      %5381 = arith.andi %5379, %5380 : i1
      %5382 = scf.if %5381 -> (i64) {
        scf.yield %5184 : i64
      } else {
        scf.yield %5377 : i64
      }
      %5383 = func.call @cc_errorp(%5261) : (i64) -> i64
      %5384 = arith.cmpi ne, %5383, %5377 : i64
      %5385 = arith.cmpi eq, %5382, %5377 : i64
      %5386 = arith.andi %5384, %5385 : i1
      %5387 = scf.if %5386 -> (i64) {
        scf.yield %5261 : i64
      } else {
        scf.yield %5382 : i64
      }
      %5388 = func.call @cc_errorp(%5321) : (i64) -> i64
      %5389 = arith.cmpi ne, %5388, %5377 : i64
      %5390 = arith.cmpi eq, %5387, %5377 : i64
      %5391 = arith.andi %5389, %5390 : i1
      %5392 = scf.if %5391 -> (i64) {
        scf.yield %5321 : i64
      } else {
        scf.yield %5387 : i64
      }
      %5393 = func.call @cc_errorp(%5346) : (i64) -> i64
      %5394 = arith.cmpi ne, %5393, %5377 : i64
      %5395 = arith.cmpi eq, %5392, %5377 : i64
      %5396 = arith.andi %5394, %5395 : i1
      %5397 = scf.if %5396 -> (i64) {
        scf.yield %5346 : i64
      } else {
        scf.yield %5392 : i64
      }
      %5398 = func.call @cc_errorp(%5353) : (i64) -> i64
      %5399 = arith.cmpi ne, %5398, %5377 : i64
      %5400 = arith.cmpi eq, %5397, %5377 : i64
      %5401 = arith.andi %5399, %5400 : i1
      %5402 = scf.if %5401 -> (i64) {
        scf.yield %5353 : i64
      } else {
        scf.yield %5397 : i64
      }
      %5403 = func.call @cc_errorp(%5357) : (i64) -> i64
      %5404 = arith.cmpi ne, %5403, %5377 : i64
      %5405 = arith.cmpi eq, %5402, %5377 : i64
      %5406 = arith.andi %5404, %5405 : i1
      %5407 = scf.if %5406 -> (i64) {
        scf.yield %5357 : i64
      } else {
        scf.yield %5402 : i64
      }
      %5408 = func.call @cc_errorp(%5364) : (i64) -> i64
      %5409 = arith.cmpi ne, %5408, %5377 : i64
      %5410 = arith.cmpi eq, %5407, %5377 : i64
      %5411 = arith.andi %5409, %5410 : i1
      %5412 = scf.if %5411 -> (i64) {
        scf.yield %5364 : i64
      } else {
        scf.yield %5407 : i64
      }
      %5413 = func.call @cc_errorp(%5376) : (i64) -> i64
      %5414 = arith.cmpi ne, %5413, %5377 : i64
      %5415 = arith.cmpi eq, %5412, %5377 : i64
      %5416 = arith.andi %5414, %5415 : i1
      %5417 = scf.if %5416 -> (i64) {
        scf.yield %5376 : i64
      } else {
        scf.yield %5412 : i64
      }
      %5418 = arith.cmpi ne, %5417, %5377 : i64
      scf.if %5418 {
        func.call @stack_push_pointer(%5417) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5184) : (i64) -> ()
        func.call @stack_push_pointer(%5261) : (i64) -> ()
        func.call @stack_push_pointer(%5321) : (i64) -> ()
        func.call @stack_push_pointer(%5346) : (i64) -> ()
        func.call @stack_push_pointer(%5353) : (i64) -> ()
        func.call @stack_push_pointer(%5357) : (i64) -> ()
        func.call @stack_push_pointer(%5364) : (i64) -> ()
        func.call @stack_push_pointer(%5376) : (i64) -> ()
        %5419 = llvm.mlir.addressof @str408 : !llvm.ptr
        %5420 = func.call @cc_make_function_ref_const(%5419) : (!llvm.ptr) -> i64
        %5421 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5420, %5421) : (i64, i64) -> ()
      }
      %5422 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5422 : i64
    }
    %5423 = func.call @cc_nil_value() : () -> i64
    %5424 = func.call @cc_errorp(%5175) : (i64) -> i64
    %5425 = arith.cmpi ne, %5424, %5423 : i64
    %5426 = scf.if %5425 -> (i64) {
      scf.yield %5175 : i64
    } else {
      %5427 = llvm.mlir.addressof @str409 : !llvm.ptr
      %5428 = arith.constant 13 : i64
      %5429 = func.call @cc_make_string(%5427, %5428) : (!llvm.ptr, i64) -> i64
      %5430 = func.call @cc_nil_value() : () -> i64
      %5431 = func.call @cc_intern(%5429, %5430) : (i64, i64) -> i64
      %5432 = func.call @cc_nil_value() : () -> i64
      %5433 = func.call @cc_cons(%5431, %5432) : (i64, i64) -> i64
      %5434 = func.call @cc_values_pack(%5433) : (i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %5435 = arith.addi %5431, %__rlasp_stack_elide_zero_238 : i64
      %5436 = llvm.mlir.addressof @str410 : !llvm.ptr
      %5437 = arith.constant 13 : i64
      %5438 = func.call @cc_make_string(%5436, %5437) : (!llvm.ptr, i64) -> i64
      %5439 = llvm.mlir.addressof @str411 : !llvm.ptr
      %5440 = arith.constant 11 : i64
      %5441 = func.call @cc_make_string(%5439, %5440) : (!llvm.ptr, i64) -> i64
      %5442 = func.call @cc_intern(%5438, %5441) : (i64, i64) -> i64
      %5443 = func.call @cc_nil_value() : () -> i64
      %5444 = func.call @cc_cons(%5442, %5443) : (i64, i64) -> i64
      %5445 = func.call @cc_values_pack(%5444) : (i64) -> i64
      func.call @stack_push_pointer(%5442) : (i64) -> ()
      %5446 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5447 = arith.constant 6 : i64
      %5448 = func.call @cc_make_string(%5446, %5447) : (!llvm.ptr, i64) -> i64
      %5449 = func.call @cc_nil_value() : () -> i64
      %5450 = func.call @cc_intern(%5448, %5449) : (i64, i64) -> i64
      %5451 = func.call @cc_nil_value() : () -> i64
      %5452 = func.call @cc_cons(%5450, %5451) : (i64, i64) -> i64
      %5453 = func.call @cc_values_pack(%5452) : (i64) -> i64
      func.call @stack_push_pointer(%5450) : (i64) -> ()
      %5454 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5455 = arith.constant 19 : i64
      %5456 = func.call @cc_make_string(%5454, %5455) : (!llvm.ptr, i64) -> i64
      %5457 = func.call @cc_nil_value() : () -> i64
      %5458 = func.call @cc_intern(%5456, %5457) : (i64, i64) -> i64
      %5459 = func.call @cc_nil_value() : () -> i64
      %5460 = func.call @cc_cons(%5458, %5459) : (i64, i64) -> i64
      %5461 = func.call @cc_values_pack(%5460) : (i64) -> i64
      func.call @stack_push_pointer(%5458) : (i64) -> ()
      %5462 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5463 = arith.constant 17 : i64
      %5464 = func.call @cc_make_string(%5462, %5463) : (!llvm.ptr, i64) -> i64
      %5465 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5466 = arith.constant 11 : i64
      %5467 = func.call @cc_make_string(%5465, %5466) : (!llvm.ptr, i64) -> i64
      %5468 = func.call @cc_intern(%5464, %5467) : (i64, i64) -> i64
      %5469 = func.call @cc_nil_value() : () -> i64
      %5470 = func.call @cc_cons(%5468, %5469) : (i64, i64) -> i64
      %5471 = func.call @cc_values_pack(%5470) : (i64) -> i64
      func.call @stack_push_pointer(%5468) : (i64) -> ()
      %5472 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5473 = arith.constant 15 : i64
      %5474 = func.call @cc_make_string(%5472, %5473) : (!llvm.ptr, i64) -> i64
      %5475 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5476 = arith.constant 11 : i64
      %5477 = func.call @cc_make_string(%5475, %5476) : (!llvm.ptr, i64) -> i64
      %5478 = func.call @cc_intern(%5474, %5477) : (i64, i64) -> i64
      %5479 = func.call @cc_nil_value() : () -> i64
      %5480 = func.call @cc_cons(%5478, %5479) : (i64, i64) -> i64
      %5481 = func.call @cc_values_pack(%5480) : (i64) -> i64
      func.call @stack_push_pointer(%5478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5482 = func.call @stack_pop_pointer() : () -> i64
      %5483 = func.call @stack_pop_pointer() : () -> i64
      %5484 = func.call @cc_cons(%5483, %5482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5484) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5485 = func.call @stack_pop_pointer() : () -> i64
      %5486 = func.call @stack_pop_pointer() : () -> i64
      %5487 = func.call @cc_cons(%5486, %5485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %5488 = arith.addi %5487, %__rlasp_stack_elide_zero_239 : i64
      %5489 = func.call @stack_pop_pointer() : () -> i64
      %5490 = func.call @cc_cons(%5489, %5488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5490) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5491 = func.call @stack_pop_pointer() : () -> i64
      %5492 = func.call @stack_pop_pointer() : () -> i64
      %5493 = func.call @cc_cons(%5492, %5491) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %5494 = arith.addi %5493, %__rlasp_stack_elide_zero_240 : i64
      %5495 = func.call @stack_pop_pointer() : () -> i64
      %5496 = func.call @cc_cons(%5495, %5494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5496) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5497 = func.call @stack_pop_pointer() : () -> i64
      %5498 = func.call @stack_pop_pointer() : () -> i64
      %5499 = func.call @cc_cons(%5498, %5497) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %5500 = arith.addi %5499, %__rlasp_stack_elide_zero_241 : i64
      %5501 = func.call @stack_pop_pointer() : () -> i64
      %5502 = func.call @cc_cons(%5501, %5500) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %5503 = arith.addi %5502, %__rlasp_stack_elide_zero_242 : i64
      %5504 = func.call @stack_pop_pointer() : () -> i64
      %5505 = func.call @cc_cons(%5504, %5503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5505) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5506 = func.call @stack_pop_pointer() : () -> i64
      %5507 = func.call @stack_pop_pointer() : () -> i64
      %5508 = func.call @cc_cons(%5507, %5506) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %5509 = arith.addi %5508, %__rlasp_stack_elide_zero_243 : i64
      %5510 = func.call @stack_pop_pointer() : () -> i64
      %5511 = func.call @cc_cons(%5510, %5509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %5512 = arith.addi %5511, %__rlasp_stack_elide_zero_244 : i64
      %5569 = arith.constant 209815645192216 : i64
      %5570 = arith.constant 0 : i64
      %5571 = func.call @cc_make_closure(%5569, %5570) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %5572 = arith.addi %5571, %__rlasp_stack_elide_zero_245 : i64
      %5573 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5574 = arith.constant 4 : i64
      %5575 = func.call @cc_make_string(%5573, %5574) : (!llvm.ptr, i64) -> i64
      %5576 = func.call @cc_nil_value() : () -> i64
      %5577 = func.call @cc_intern(%5575, %5576) : (i64, i64) -> i64
      %5578 = func.call @cc_nil_value() : () -> i64
      %5579 = func.call @cc_cons(%5577, %5578) : (i64, i64) -> i64
      %5580 = func.call @cc_values_pack(%5579) : (i64) -> i64
      func.call @stack_push_pointer(%5577) : (i64) -> ()
      %5581 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5582 = arith.constant 10 : i64
      %5583 = func.call @cc_make_string(%5581, %5582) : (!llvm.ptr, i64) -> i64
      %5584 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5585 = arith.constant 11 : i64
      %5586 = func.call @cc_make_string(%5584, %5585) : (!llvm.ptr, i64) -> i64
      %5587 = func.call @cc_intern(%5583, %5586) : (i64, i64) -> i64
      %5588 = func.call @cc_nil_value() : () -> i64
      %5589 = func.call @cc_cons(%5587, %5588) : (i64, i64) -> i64
      %5590 = func.call @cc_values_pack(%5589) : (i64) -> i64
      func.call @stack_push_pointer(%5587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5591 = func.call @stack_pop_pointer() : () -> i64
      %5592 = func.call @stack_pop_pointer() : () -> i64
      %5593 = func.call @cc_cons(%5592, %5591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %5594 = arith.addi %5593, %__rlasp_stack_elide_zero_246 : i64
      %5595 = func.call @stack_pop_pointer() : () -> i64
      %5596 = func.call @cc_cons(%5595, %5594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %5597 = arith.addi %5596, %__rlasp_stack_elide_zero_247 : i64
      %5598 = llvm.mlir.addressof @str422 : !llvm.ptr
      %5599 = arith.constant 11 : i64
      %5600 = func.call @cc_make_string(%5598, %5599) : (!llvm.ptr, i64) -> i64
      %5601 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5602 = arith.constant 7 : i64
      %5603 = func.call @cc_make_string(%5601, %5602) : (!llvm.ptr, i64) -> i64
      %5604 = func.call @cc_intern(%5600, %5603) : (i64, i64) -> i64
      %5605 = func.call @cc_nil_value() : () -> i64
      %5606 = func.call @cc_cons(%5604, %5605) : (i64, i64) -> i64
      %5607 = func.call @cc_values_pack(%5606) : (i64) -> i64
      %5608 = func.call @cc_nil_value() : () -> i64
      %5609 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5610 = arith.constant 4 : i64
      %5611 = func.call @cc_make_string(%5609, %5610) : (!llvm.ptr, i64) -> i64
      %5612 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5613 = arith.constant 7 : i64
      %5614 = func.call @cc_make_string(%5612, %5613) : (!llvm.ptr, i64) -> i64
      %5615 = func.call @cc_intern(%5611, %5614) : (i64, i64) -> i64
      %5616 = func.call @cc_nil_value() : () -> i64
      %5617 = func.call @cc_cons(%5615, %5616) : (i64, i64) -> i64
      %5618 = func.call @cc_values_pack(%5617) : (i64) -> i64
      %5619 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5620 = arith.constant 5 : i64
      %5621 = func.call @cc_make_string(%5619, %5620) : (!llvm.ptr, i64) -> i64
      %5622 = func.call @cc_nil_value() : () -> i64
      %5623 = func.call @cc_intern(%5621, %5622) : (i64, i64) -> i64
      %5624 = func.call @cc_nil_value() : () -> i64
      %5625 = func.call @cc_cons(%5623, %5624) : (i64, i64) -> i64
      %5626 = func.call @cc_values_pack(%5625) : (i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %5627 = arith.addi %5623, %__rlasp_stack_elide_zero_248 : i64
      %5628 = func.call @cc_nil_value() : () -> i64
      %5629 = func.call @cc_errorp(%5435) : (i64) -> i64
      %5630 = arith.cmpi ne, %5629, %5628 : i64
      %5631 = arith.cmpi eq, %5628, %5628 : i64
      %5632 = arith.andi %5630, %5631 : i1
      %5633 = scf.if %5632 -> (i64) {
        scf.yield %5435 : i64
      } else {
        scf.yield %5628 : i64
      }
      %5634 = func.call @cc_errorp(%5512) : (i64) -> i64
      %5635 = arith.cmpi ne, %5634, %5628 : i64
      %5636 = arith.cmpi eq, %5633, %5628 : i64
      %5637 = arith.andi %5635, %5636 : i1
      %5638 = scf.if %5637 -> (i64) {
        scf.yield %5512 : i64
      } else {
        scf.yield %5633 : i64
      }
      %5639 = func.call @cc_errorp(%5572) : (i64) -> i64
      %5640 = arith.cmpi ne, %5639, %5628 : i64
      %5641 = arith.cmpi eq, %5638, %5628 : i64
      %5642 = arith.andi %5640, %5641 : i1
      %5643 = scf.if %5642 -> (i64) {
        scf.yield %5572 : i64
      } else {
        scf.yield %5638 : i64
      }
      %5644 = func.call @cc_errorp(%5597) : (i64) -> i64
      %5645 = arith.cmpi ne, %5644, %5628 : i64
      %5646 = arith.cmpi eq, %5643, %5628 : i64
      %5647 = arith.andi %5645, %5646 : i1
      %5648 = scf.if %5647 -> (i64) {
        scf.yield %5597 : i64
      } else {
        scf.yield %5643 : i64
      }
      %5649 = func.call @cc_errorp(%5604) : (i64) -> i64
      %5650 = arith.cmpi ne, %5649, %5628 : i64
      %5651 = arith.cmpi eq, %5648, %5628 : i64
      %5652 = arith.andi %5650, %5651 : i1
      %5653 = scf.if %5652 -> (i64) {
        scf.yield %5604 : i64
      } else {
        scf.yield %5648 : i64
      }
      %5654 = func.call @cc_errorp(%5608) : (i64) -> i64
      %5655 = arith.cmpi ne, %5654, %5628 : i64
      %5656 = arith.cmpi eq, %5653, %5628 : i64
      %5657 = arith.andi %5655, %5656 : i1
      %5658 = scf.if %5657 -> (i64) {
        scf.yield %5608 : i64
      } else {
        scf.yield %5653 : i64
      }
      %5659 = func.call @cc_errorp(%5615) : (i64) -> i64
      %5660 = arith.cmpi ne, %5659, %5628 : i64
      %5661 = arith.cmpi eq, %5658, %5628 : i64
      %5662 = arith.andi %5660, %5661 : i1
      %5663 = scf.if %5662 -> (i64) {
        scf.yield %5615 : i64
      } else {
        scf.yield %5658 : i64
      }
      %5664 = func.call @cc_errorp(%5627) : (i64) -> i64
      %5665 = arith.cmpi ne, %5664, %5628 : i64
      %5666 = arith.cmpi eq, %5663, %5628 : i64
      %5667 = arith.andi %5665, %5666 : i1
      %5668 = scf.if %5667 -> (i64) {
        scf.yield %5627 : i64
      } else {
        scf.yield %5663 : i64
      }
      %5669 = arith.cmpi ne, %5668, %5628 : i64
      scf.if %5669 {
        func.call @stack_push_pointer(%5668) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5435) : (i64) -> ()
        func.call @stack_push_pointer(%5512) : (i64) -> ()
        func.call @stack_push_pointer(%5572) : (i64) -> ()
        func.call @stack_push_pointer(%5597) : (i64) -> ()
        func.call @stack_push_pointer(%5604) : (i64) -> ()
        func.call @stack_push_pointer(%5608) : (i64) -> ()
        func.call @stack_push_pointer(%5615) : (i64) -> ()
        func.call @stack_push_pointer(%5627) : (i64) -> ()
        %5670 = llvm.mlir.addressof @str427 : !llvm.ptr
        %5671 = func.call @cc_make_function_ref_const(%5670) : (!llvm.ptr) -> i64
        %5672 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5671, %5672) : (i64, i64) -> ()
      }
      %5673 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5673 : i64
    }
    %5674 = func.call @cc_nil_value() : () -> i64
    %5675 = func.call @cc_errorp(%5426) : (i64) -> i64
    %5676 = arith.cmpi ne, %5675, %5674 : i64
    %5677 = scf.if %5676 -> (i64) {
      scf.yield %5426 : i64
    } else {
      %5678 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5679 = arith.constant 13 : i64
      %5680 = func.call @cc_make_string(%5678, %5679) : (!llvm.ptr, i64) -> i64
      %5681 = func.call @cc_nil_value() : () -> i64
      %5682 = func.call @cc_intern(%5680, %5681) : (i64, i64) -> i64
      %5683 = func.call @cc_nil_value() : () -> i64
      %5684 = func.call @cc_cons(%5682, %5683) : (i64, i64) -> i64
      %5685 = func.call @cc_values_pack(%5684) : (i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %5686 = arith.addi %5682, %__rlasp_stack_elide_zero_249 : i64
      %5687 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5688 = arith.constant 13 : i64
      %5689 = func.call @cc_make_string(%5687, %5688) : (!llvm.ptr, i64) -> i64
      %5690 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5691 = arith.constant 11 : i64
      %5692 = func.call @cc_make_string(%5690, %5691) : (!llvm.ptr, i64) -> i64
      %5693 = func.call @cc_intern(%5689, %5692) : (i64, i64) -> i64
      %5694 = func.call @cc_nil_value() : () -> i64
      %5695 = func.call @cc_cons(%5693, %5694) : (i64, i64) -> i64
      %5696 = func.call @cc_values_pack(%5695) : (i64) -> i64
      func.call @stack_push_pointer(%5693) : (i64) -> ()
      %5697 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5698 = arith.constant 6 : i64
      %5699 = func.call @cc_make_string(%5697, %5698) : (!llvm.ptr, i64) -> i64
      %5700 = func.call @cc_nil_value() : () -> i64
      %5701 = func.call @cc_intern(%5699, %5700) : (i64, i64) -> i64
      %5702 = func.call @cc_nil_value() : () -> i64
      %5703 = func.call @cc_cons(%5701, %5702) : (i64, i64) -> i64
      %5704 = func.call @cc_values_pack(%5703) : (i64) -> i64
      func.call @stack_push_pointer(%5701) : (i64) -> ()
      %5705 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5706 = arith.constant 19 : i64
      %5707 = func.call @cc_make_string(%5705, %5706) : (!llvm.ptr, i64) -> i64
      %5708 = func.call @cc_nil_value() : () -> i64
      %5709 = func.call @cc_intern(%5707, %5708) : (i64, i64) -> i64
      %5710 = func.call @cc_nil_value() : () -> i64
      %5711 = func.call @cc_cons(%5709, %5710) : (i64, i64) -> i64
      %5712 = func.call @cc_values_pack(%5711) : (i64) -> i64
      func.call @stack_push_pointer(%5709) : (i64) -> ()
      %5713 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5714 = arith.constant 14 : i64
      %5715 = func.call @cc_make_string(%5713, %5714) : (!llvm.ptr, i64) -> i64
      %5716 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5717 = arith.constant 11 : i64
      %5718 = func.call @cc_make_string(%5716, %5717) : (!llvm.ptr, i64) -> i64
      %5719 = func.call @cc_intern(%5715, %5718) : (i64, i64) -> i64
      %5720 = func.call @cc_nil_value() : () -> i64
      %5721 = func.call @cc_cons(%5719, %5720) : (i64, i64) -> i64
      %5722 = func.call @cc_values_pack(%5721) : (i64) -> i64
      func.call @stack_push_pointer(%5719) : (i64) -> ()
      %5723 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5724 = arith.constant 15 : i64
      %5725 = func.call @cc_make_string(%5723, %5724) : (!llvm.ptr, i64) -> i64
      %5726 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5727 = arith.constant 11 : i64
      %5728 = func.call @cc_make_string(%5726, %5727) : (!llvm.ptr, i64) -> i64
      %5729 = func.call @cc_intern(%5725, %5728) : (i64, i64) -> i64
      %5730 = func.call @cc_nil_value() : () -> i64
      %5731 = func.call @cc_cons(%5729, %5730) : (i64, i64) -> i64
      %5732 = func.call @cc_values_pack(%5731) : (i64) -> i64
      func.call @stack_push_pointer(%5729) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5733 = func.call @stack_pop_pointer() : () -> i64
      %5734 = func.call @stack_pop_pointer() : () -> i64
      %5735 = func.call @cc_cons(%5734, %5733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5735) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5736 = func.call @stack_pop_pointer() : () -> i64
      %5737 = func.call @stack_pop_pointer() : () -> i64
      %5738 = func.call @cc_cons(%5737, %5736) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %5739 = arith.addi %5738, %__rlasp_stack_elide_zero_250 : i64
      %5740 = func.call @stack_pop_pointer() : () -> i64
      %5741 = func.call @cc_cons(%5740, %5739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5742 = func.call @stack_pop_pointer() : () -> i64
      %5743 = func.call @stack_pop_pointer() : () -> i64
      %5744 = func.call @cc_cons(%5743, %5742) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %5745 = arith.addi %5744, %__rlasp_stack_elide_zero_251 : i64
      %5746 = func.call @stack_pop_pointer() : () -> i64
      %5747 = func.call @cc_cons(%5746, %5745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5747) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5748 = func.call @stack_pop_pointer() : () -> i64
      %5749 = func.call @stack_pop_pointer() : () -> i64
      %5750 = func.call @cc_cons(%5749, %5748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %5751 = arith.addi %5750, %__rlasp_stack_elide_zero_252 : i64
      %5752 = func.call @stack_pop_pointer() : () -> i64
      %5753 = func.call @cc_cons(%5752, %5751) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %5754 = arith.addi %5753, %__rlasp_stack_elide_zero_253 : i64
      %5755 = func.call @stack_pop_pointer() : () -> i64
      %5756 = func.call @cc_cons(%5755, %5754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5757 = func.call @stack_pop_pointer() : () -> i64
      %5758 = func.call @stack_pop_pointer() : () -> i64
      %5759 = func.call @cc_cons(%5758, %5757) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %5760 = arith.addi %5759, %__rlasp_stack_elide_zero_254 : i64
      %5761 = func.call @stack_pop_pointer() : () -> i64
      %5762 = func.call @cc_cons(%5761, %5760) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %5763 = arith.addi %5762, %__rlasp_stack_elide_zero_255 : i64
      %5820 = arith.constant 209815645192217 : i64
      %5821 = arith.constant 0 : i64
      %5822 = func.call @cc_make_closure(%5820, %5821) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %5823 = arith.addi %5822, %__rlasp_stack_elide_zero_256 : i64
      %5824 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5825 = arith.constant 4 : i64
      %5826 = func.call @cc_make_string(%5824, %5825) : (!llvm.ptr, i64) -> i64
      %5827 = func.call @cc_nil_value() : () -> i64
      %5828 = func.call @cc_intern(%5826, %5827) : (i64, i64) -> i64
      %5829 = func.call @cc_nil_value() : () -> i64
      %5830 = func.call @cc_cons(%5828, %5829) : (i64, i64) -> i64
      %5831 = func.call @cc_values_pack(%5830) : (i64) -> i64
      func.call @stack_push_pointer(%5828) : (i64) -> ()
      %5832 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5833 = arith.constant 10 : i64
      %5834 = func.call @cc_make_string(%5832, %5833) : (!llvm.ptr, i64) -> i64
      %5835 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5836 = arith.constant 11 : i64
      %5837 = func.call @cc_make_string(%5835, %5836) : (!llvm.ptr, i64) -> i64
      %5838 = func.call @cc_intern(%5834, %5837) : (i64, i64) -> i64
      %5839 = func.call @cc_nil_value() : () -> i64
      %5840 = func.call @cc_cons(%5838, %5839) : (i64, i64) -> i64
      %5841 = func.call @cc_values_pack(%5840) : (i64) -> i64
      func.call @stack_push_pointer(%5838) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5842 = func.call @stack_pop_pointer() : () -> i64
      %5843 = func.call @stack_pop_pointer() : () -> i64
      %5844 = func.call @cc_cons(%5843, %5842) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %5845 = arith.addi %5844, %__rlasp_stack_elide_zero_257 : i64
      %5846 = func.call @stack_pop_pointer() : () -> i64
      %5847 = func.call @cc_cons(%5846, %5845) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %5848 = arith.addi %5847, %__rlasp_stack_elide_zero_258 : i64
      %5849 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5850 = arith.constant 11 : i64
      %5851 = func.call @cc_make_string(%5849, %5850) : (!llvm.ptr, i64) -> i64
      %5852 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5853 = arith.constant 7 : i64
      %5854 = func.call @cc_make_string(%5852, %5853) : (!llvm.ptr, i64) -> i64
      %5855 = func.call @cc_intern(%5851, %5854) : (i64, i64) -> i64
      %5856 = func.call @cc_nil_value() : () -> i64
      %5857 = func.call @cc_cons(%5855, %5856) : (i64, i64) -> i64
      %5858 = func.call @cc_values_pack(%5857) : (i64) -> i64
      %5859 = func.call @cc_nil_value() : () -> i64
      %5860 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5861 = arith.constant 4 : i64
      %5862 = func.call @cc_make_string(%5860, %5861) : (!llvm.ptr, i64) -> i64
      %5863 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5864 = arith.constant 7 : i64
      %5865 = func.call @cc_make_string(%5863, %5864) : (!llvm.ptr, i64) -> i64
      %5866 = func.call @cc_intern(%5862, %5865) : (i64, i64) -> i64
      %5867 = func.call @cc_nil_value() : () -> i64
      %5868 = func.call @cc_cons(%5866, %5867) : (i64, i64) -> i64
      %5869 = func.call @cc_values_pack(%5868) : (i64) -> i64
      %5870 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5871 = arith.constant 5 : i64
      %5872 = func.call @cc_make_string(%5870, %5871) : (!llvm.ptr, i64) -> i64
      %5873 = func.call @cc_nil_value() : () -> i64
      %5874 = func.call @cc_intern(%5872, %5873) : (i64, i64) -> i64
      %5875 = func.call @cc_nil_value() : () -> i64
      %5876 = func.call @cc_cons(%5874, %5875) : (i64, i64) -> i64
      %5877 = func.call @cc_values_pack(%5876) : (i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %5878 = arith.addi %5874, %__rlasp_stack_elide_zero_259 : i64
      %5879 = func.call @cc_nil_value() : () -> i64
      %5880 = func.call @cc_errorp(%5686) : (i64) -> i64
      %5881 = arith.cmpi ne, %5880, %5879 : i64
      %5882 = arith.cmpi eq, %5879, %5879 : i64
      %5883 = arith.andi %5881, %5882 : i1
      %5884 = scf.if %5883 -> (i64) {
        scf.yield %5686 : i64
      } else {
        scf.yield %5879 : i64
      }
      %5885 = func.call @cc_errorp(%5763) : (i64) -> i64
      %5886 = arith.cmpi ne, %5885, %5879 : i64
      %5887 = arith.cmpi eq, %5884, %5879 : i64
      %5888 = arith.andi %5886, %5887 : i1
      %5889 = scf.if %5888 -> (i64) {
        scf.yield %5763 : i64
      } else {
        scf.yield %5884 : i64
      }
      %5890 = func.call @cc_errorp(%5823) : (i64) -> i64
      %5891 = arith.cmpi ne, %5890, %5879 : i64
      %5892 = arith.cmpi eq, %5889, %5879 : i64
      %5893 = arith.andi %5891, %5892 : i1
      %5894 = scf.if %5893 -> (i64) {
        scf.yield %5823 : i64
      } else {
        scf.yield %5889 : i64
      }
      %5895 = func.call @cc_errorp(%5848) : (i64) -> i64
      %5896 = arith.cmpi ne, %5895, %5879 : i64
      %5897 = arith.cmpi eq, %5894, %5879 : i64
      %5898 = arith.andi %5896, %5897 : i1
      %5899 = scf.if %5898 -> (i64) {
        scf.yield %5848 : i64
      } else {
        scf.yield %5894 : i64
      }
      %5900 = func.call @cc_errorp(%5855) : (i64) -> i64
      %5901 = arith.cmpi ne, %5900, %5879 : i64
      %5902 = arith.cmpi eq, %5899, %5879 : i64
      %5903 = arith.andi %5901, %5902 : i1
      %5904 = scf.if %5903 -> (i64) {
        scf.yield %5855 : i64
      } else {
        scf.yield %5899 : i64
      }
      %5905 = func.call @cc_errorp(%5859) : (i64) -> i64
      %5906 = arith.cmpi ne, %5905, %5879 : i64
      %5907 = arith.cmpi eq, %5904, %5879 : i64
      %5908 = arith.andi %5906, %5907 : i1
      %5909 = scf.if %5908 -> (i64) {
        scf.yield %5859 : i64
      } else {
        scf.yield %5904 : i64
      }
      %5910 = func.call @cc_errorp(%5866) : (i64) -> i64
      %5911 = arith.cmpi ne, %5910, %5879 : i64
      %5912 = arith.cmpi eq, %5909, %5879 : i64
      %5913 = arith.andi %5911, %5912 : i1
      %5914 = scf.if %5913 -> (i64) {
        scf.yield %5866 : i64
      } else {
        scf.yield %5909 : i64
      }
      %5915 = func.call @cc_errorp(%5878) : (i64) -> i64
      %5916 = arith.cmpi ne, %5915, %5879 : i64
      %5917 = arith.cmpi eq, %5914, %5879 : i64
      %5918 = arith.andi %5916, %5917 : i1
      %5919 = scf.if %5918 -> (i64) {
        scf.yield %5878 : i64
      } else {
        scf.yield %5914 : i64
      }
      %5920 = arith.cmpi ne, %5919, %5879 : i64
      scf.if %5920 {
        func.call @stack_push_pointer(%5919) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5686) : (i64) -> ()
        func.call @stack_push_pointer(%5763) : (i64) -> ()
        func.call @stack_push_pointer(%5823) : (i64) -> ()
        func.call @stack_push_pointer(%5848) : (i64) -> ()
        func.call @stack_push_pointer(%5855) : (i64) -> ()
        func.call @stack_push_pointer(%5859) : (i64) -> ()
        func.call @stack_push_pointer(%5866) : (i64) -> ()
        func.call @stack_push_pointer(%5878) : (i64) -> ()
        %5921 = llvm.mlir.addressof @str446 : !llvm.ptr
        %5922 = func.call @cc_make_function_ref_const(%5921) : (!llvm.ptr) -> i64
        %5923 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5922, %5923) : (i64, i64) -> ()
      }
      %5924 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5924 : i64
    }
    %5925 = func.call @cc_nil_value() : () -> i64
    %5926 = func.call @cc_errorp(%5677) : (i64) -> i64
    %5927 = arith.cmpi ne, %5926, %5925 : i64
    %5928 = scf.if %5927 -> (i64) {
      scf.yield %5677 : i64
    } else {
      %5929 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5930 = arith.constant 12 : i64
      %5931 = func.call @cc_make_string(%5929, %5930) : (!llvm.ptr, i64) -> i64
      %5932 = func.call @cc_nil_value() : () -> i64
      %5933 = func.call @cc_intern(%5931, %5932) : (i64, i64) -> i64
      %5934 = func.call @cc_nil_value() : () -> i64
      %5935 = func.call @cc_cons(%5933, %5934) : (i64, i64) -> i64
      %5936 = func.call @cc_values_pack(%5935) : (i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %5937 = arith.addi %5933, %__rlasp_stack_elide_zero_260 : i64
      %5938 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5939 = arith.constant 9 : i64
      %5940 = func.call @cc_make_string(%5938, %5939) : (!llvm.ptr, i64) -> i64
      %5941 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5942 = arith.constant 11 : i64
      %5943 = func.call @cc_make_string(%5941, %5942) : (!llvm.ptr, i64) -> i64
      %5944 = func.call @cc_intern(%5940, %5943) : (i64, i64) -> i64
      %5945 = func.call @cc_nil_value() : () -> i64
      %5946 = func.call @cc_cons(%5944, %5945) : (i64, i64) -> i64
      %5947 = func.call @cc_values_pack(%5946) : (i64) -> i64
      func.call @stack_push_pointer(%5944) : (i64) -> ()
      %5948 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5949 = arith.constant 9 : i64
      %5950 = func.call @cc_make_string(%5948, %5949) : (!llvm.ptr, i64) -> i64
      %5951 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5952 = arith.constant 11 : i64
      %5953 = func.call @cc_make_string(%5951, %5952) : (!llvm.ptr, i64) -> i64
      %5954 = func.call @cc_intern(%5950, %5953) : (i64, i64) -> i64
      %5955 = func.call @cc_nil_value() : () -> i64
      %5956 = func.call @cc_cons(%5954, %5955) : (i64, i64) -> i64
      %5957 = func.call @cc_values_pack(%5956) : (i64) -> i64
      func.call @stack_push_pointer(%5954) : (i64) -> ()
      %5958 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5959 = arith.constant 9 : i64
      %5960 = func.call @cc_make_string(%5958, %5959) : (!llvm.ptr, i64) -> i64
      %5961 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5962 = arith.constant 11 : i64
      %5963 = func.call @cc_make_string(%5961, %5962) : (!llvm.ptr, i64) -> i64
      %5964 = func.call @cc_intern(%5960, %5963) : (i64, i64) -> i64
      %5965 = func.call @cc_nil_value() : () -> i64
      %5966 = func.call @cc_cons(%5964, %5965) : (i64, i64) -> i64
      %5967 = func.call @cc_values_pack(%5966) : (i64) -> i64
      func.call @stack_push_pointer(%5964) : (i64) -> ()
      %5968 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%5968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5969 = func.call @stack_pop_pointer() : () -> i64
      %5970 = func.call @stack_pop_pointer() : () -> i64
      %5971 = func.call @cc_cons(%5970, %5969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %5972 = arith.addi %5971, %__rlasp_stack_elide_zero_261 : i64
      %5973 = func.call @stack_pop_pointer() : () -> i64
      %5974 = func.call @cc_cons(%5973, %5972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5975 = func.call @stack_pop_pointer() : () -> i64
      %5976 = func.call @stack_pop_pointer() : () -> i64
      %5977 = func.call @cc_cons(%5976, %5975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %5978 = arith.addi %5977, %__rlasp_stack_elide_zero_262 : i64
      %5979 = func.call @stack_pop_pointer() : () -> i64
      %5980 = func.call @cc_cons(%5979, %5978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5980) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5981 = func.call @stack_pop_pointer() : () -> i64
      %5982 = func.call @stack_pop_pointer() : () -> i64
      %5983 = func.call @cc_cons(%5982, %5981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %5984 = arith.addi %5983, %__rlasp_stack_elide_zero_263 : i64
      %5985 = func.call @stack_pop_pointer() : () -> i64
      %5986 = func.call @cc_cons(%5985, %5984) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %5987 = arith.addi %5986, %__rlasp_stack_elide_zero_264 : i64
      %6002 = arith.constant 209815645192218 : i64
      %6003 = arith.constant 0 : i64
      %6004 = func.call @cc_make_closure(%6002, %6003) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %6005 = arith.addi %6004, %__rlasp_stack_elide_zero_265 : i64
      %6006 = arith.constant 13 : i64
      %6007 = func.call @cc_box_character(%6006) : (i64) -> i64
      func.call @stack_push_pointer(%6007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6008 = func.call @stack_pop_pointer() : () -> i64
      %6009 = func.call @stack_pop_pointer() : () -> i64
      %6010 = func.call @cc_cons(%6009, %6008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %6011 = arith.addi %6010, %__rlasp_stack_elide_zero_266 : i64
      %6012 = llvm.mlir.addressof @str454 : !llvm.ptr
      %6013 = arith.constant 11 : i64
      %6014 = func.call @cc_make_string(%6012, %6013) : (!llvm.ptr, i64) -> i64
      %6015 = llvm.mlir.addressof @str455 : !llvm.ptr
      %6016 = arith.constant 7 : i64
      %6017 = func.call @cc_make_string(%6015, %6016) : (!llvm.ptr, i64) -> i64
      %6018 = func.call @cc_intern(%6014, %6017) : (i64, i64) -> i64
      %6019 = func.call @cc_nil_value() : () -> i64
      %6020 = func.call @cc_cons(%6018, %6019) : (i64, i64) -> i64
      %6021 = func.call @cc_values_pack(%6020) : (i64) -> i64
      %6022 = func.call @cc_nil_value() : () -> i64
      %6023 = llvm.mlir.addressof @str456 : !llvm.ptr
      %6024 = arith.constant 4 : i64
      %6025 = func.call @cc_make_string(%6023, %6024) : (!llvm.ptr, i64) -> i64
      %6026 = llvm.mlir.addressof @str457 : !llvm.ptr
      %6027 = arith.constant 7 : i64
      %6028 = func.call @cc_make_string(%6026, %6027) : (!llvm.ptr, i64) -> i64
      %6029 = func.call @cc_intern(%6025, %6028) : (i64, i64) -> i64
      %6030 = func.call @cc_nil_value() : () -> i64
      %6031 = func.call @cc_cons(%6029, %6030) : (i64, i64) -> i64
      %6032 = func.call @cc_values_pack(%6031) : (i64) -> i64
      %6033 = llvm.mlir.addressof @str458 : !llvm.ptr
      %6034 = arith.constant 6 : i64
      %6035 = func.call @cc_make_string(%6033, %6034) : (!llvm.ptr, i64) -> i64
      %6036 = func.call @cc_nil_value() : () -> i64
      %6037 = func.call @cc_intern(%6035, %6036) : (i64, i64) -> i64
      %6038 = func.call @cc_nil_value() : () -> i64
      %6039 = func.call @cc_cons(%6037, %6038) : (i64, i64) -> i64
      %6040 = func.call @cc_values_pack(%6039) : (i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %6041 = arith.addi %6037, %__rlasp_stack_elide_zero_267 : i64
      %6042 = func.call @cc_nil_value() : () -> i64
      %6043 = func.call @cc_errorp(%5937) : (i64) -> i64
      %6044 = arith.cmpi ne, %6043, %6042 : i64
      %6045 = arith.cmpi eq, %6042, %6042 : i64
      %6046 = arith.andi %6044, %6045 : i1
      %6047 = scf.if %6046 -> (i64) {
        scf.yield %5937 : i64
      } else {
        scf.yield %6042 : i64
      }
      %6048 = func.call @cc_errorp(%5987) : (i64) -> i64
      %6049 = arith.cmpi ne, %6048, %6042 : i64
      %6050 = arith.cmpi eq, %6047, %6042 : i64
      %6051 = arith.andi %6049, %6050 : i1
      %6052 = scf.if %6051 -> (i64) {
        scf.yield %5987 : i64
      } else {
        scf.yield %6047 : i64
      }
      %6053 = func.call @cc_errorp(%6005) : (i64) -> i64
      %6054 = arith.cmpi ne, %6053, %6042 : i64
      %6055 = arith.cmpi eq, %6052, %6042 : i64
      %6056 = arith.andi %6054, %6055 : i1
      %6057 = scf.if %6056 -> (i64) {
        scf.yield %6005 : i64
      } else {
        scf.yield %6052 : i64
      }
      %6058 = func.call @cc_errorp(%6011) : (i64) -> i64
      %6059 = arith.cmpi ne, %6058, %6042 : i64
      %6060 = arith.cmpi eq, %6057, %6042 : i64
      %6061 = arith.andi %6059, %6060 : i1
      %6062 = scf.if %6061 -> (i64) {
        scf.yield %6011 : i64
      } else {
        scf.yield %6057 : i64
      }
      %6063 = func.call @cc_errorp(%6018) : (i64) -> i64
      %6064 = arith.cmpi ne, %6063, %6042 : i64
      %6065 = arith.cmpi eq, %6062, %6042 : i64
      %6066 = arith.andi %6064, %6065 : i1
      %6067 = scf.if %6066 -> (i64) {
        scf.yield %6018 : i64
      } else {
        scf.yield %6062 : i64
      }
      %6068 = func.call @cc_errorp(%6022) : (i64) -> i64
      %6069 = arith.cmpi ne, %6068, %6042 : i64
      %6070 = arith.cmpi eq, %6067, %6042 : i64
      %6071 = arith.andi %6069, %6070 : i1
      %6072 = scf.if %6071 -> (i64) {
        scf.yield %6022 : i64
      } else {
        scf.yield %6067 : i64
      }
      %6073 = func.call @cc_errorp(%6029) : (i64) -> i64
      %6074 = arith.cmpi ne, %6073, %6042 : i64
      %6075 = arith.cmpi eq, %6072, %6042 : i64
      %6076 = arith.andi %6074, %6075 : i1
      %6077 = scf.if %6076 -> (i64) {
        scf.yield %6029 : i64
      } else {
        scf.yield %6072 : i64
      }
      %6078 = func.call @cc_errorp(%6041) : (i64) -> i64
      %6079 = arith.cmpi ne, %6078, %6042 : i64
      %6080 = arith.cmpi eq, %6077, %6042 : i64
      %6081 = arith.andi %6079, %6080 : i1
      %6082 = scf.if %6081 -> (i64) {
        scf.yield %6041 : i64
      } else {
        scf.yield %6077 : i64
      }
      %6083 = arith.cmpi ne, %6082, %6042 : i64
      scf.if %6083 {
        func.call @stack_push_pointer(%6082) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5937) : (i64) -> ()
        func.call @stack_push_pointer(%5987) : (i64) -> ()
        func.call @stack_push_pointer(%6005) : (i64) -> ()
        func.call @stack_push_pointer(%6011) : (i64) -> ()
        func.call @stack_push_pointer(%6018) : (i64) -> ()
        func.call @stack_push_pointer(%6022) : (i64) -> ()
        func.call @stack_push_pointer(%6029) : (i64) -> ()
        func.call @stack_push_pointer(%6041) : (i64) -> ()
        %6084 = llvm.mlir.addressof @str459 : !llvm.ptr
        %6085 = func.call @cc_make_function_ref_const(%6084) : (!llvm.ptr) -> i64
        %6086 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6085, %6086) : (i64, i64) -> ()
      }
      %6087 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6087 : i64
    }
    %6088 = func.call @cc_nil_value() : () -> i64
    %6089 = func.call @cc_errorp(%5928) : (i64) -> i64
    %6090 = arith.cmpi ne, %6089, %6088 : i64
    %6091 = scf.if %6090 -> (i64) {
      scf.yield %5928 : i64
    } else {
      %6092 = llvm.mlir.addressof @str460 : !llvm.ptr
      %6093 = arith.constant 13 : i64
      %6094 = func.call @cc_make_string(%6092, %6093) : (!llvm.ptr, i64) -> i64
      %6095 = func.call @cc_nil_value() : () -> i64
      %6096 = func.call @cc_intern(%6094, %6095) : (i64, i64) -> i64
      %6097 = func.call @cc_nil_value() : () -> i64
      %6098 = func.call @cc_cons(%6096, %6097) : (i64, i64) -> i64
      %6099 = func.call @cc_values_pack(%6098) : (i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %6100 = arith.addi %6096, %__rlasp_stack_elide_zero_268 : i64
      %6101 = llvm.mlir.addressof @str461 : !llvm.ptr
      %6102 = arith.constant 9 : i64
      %6103 = func.call @cc_make_string(%6101, %6102) : (!llvm.ptr, i64) -> i64
      %6104 = llvm.mlir.addressof @str462 : !llvm.ptr
      %6105 = arith.constant 11 : i64
      %6106 = func.call @cc_make_string(%6104, %6105) : (!llvm.ptr, i64) -> i64
      %6107 = func.call @cc_intern(%6103, %6106) : (i64, i64) -> i64
      %6108 = func.call @cc_nil_value() : () -> i64
      %6109 = func.call @cc_cons(%6107, %6108) : (i64, i64) -> i64
      %6110 = func.call @cc_values_pack(%6109) : (i64) -> i64
      func.call @stack_push_pointer(%6107) : (i64) -> ()
      %6111 = llvm.mlir.addressof @str463 : !llvm.ptr
      %6112 = arith.constant 9 : i64
      %6113 = func.call @cc_make_string(%6111, %6112) : (!llvm.ptr, i64) -> i64
      %6114 = llvm.mlir.addressof @str464 : !llvm.ptr
      %6115 = arith.constant 11 : i64
      %6116 = func.call @cc_make_string(%6114, %6115) : (!llvm.ptr, i64) -> i64
      %6117 = func.call @cc_intern(%6113, %6116) : (i64, i64) -> i64
      %6118 = func.call @cc_nil_value() : () -> i64
      %6119 = func.call @cc_cons(%6117, %6118) : (i64, i64) -> i64
      %6120 = func.call @cc_values_pack(%6119) : (i64) -> i64
      func.call @stack_push_pointer(%6117) : (i64) -> ()
      %6121 = llvm.mlir.addressof @str465 : !llvm.ptr
      %6122 = arith.constant 9 : i64
      %6123 = func.call @cc_make_string(%6121, %6122) : (!llvm.ptr, i64) -> i64
      %6124 = llvm.mlir.addressof @str466 : !llvm.ptr
      %6125 = arith.constant 11 : i64
      %6126 = func.call @cc_make_string(%6124, %6125) : (!llvm.ptr, i64) -> i64
      %6127 = func.call @cc_intern(%6123, %6126) : (i64, i64) -> i64
      %6128 = func.call @cc_nil_value() : () -> i64
      %6129 = func.call @cc_cons(%6127, %6128) : (i64, i64) -> i64
      %6130 = func.call @cc_values_pack(%6129) : (i64) -> i64
      func.call @stack_push_pointer(%6127) : (i64) -> ()
      %6131 = arith.constant 128 : i64
      func.call @stack_push_fixnum(%6131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6132 = func.call @stack_pop_pointer() : () -> i64
      %6133 = func.call @stack_pop_pointer() : () -> i64
      %6134 = func.call @cc_cons(%6133, %6132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %6135 = arith.addi %6134, %__rlasp_stack_elide_zero_269 : i64
      %6136 = func.call @stack_pop_pointer() : () -> i64
      %6137 = func.call @cc_cons(%6136, %6135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6137) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6138 = func.call @stack_pop_pointer() : () -> i64
      %6139 = func.call @stack_pop_pointer() : () -> i64
      %6140 = func.call @cc_cons(%6139, %6138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %6141 = arith.addi %6140, %__rlasp_stack_elide_zero_270 : i64
      %6142 = func.call @stack_pop_pointer() : () -> i64
      %6143 = func.call @cc_cons(%6142, %6141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6143) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6144 = func.call @stack_pop_pointer() : () -> i64
      %6145 = func.call @stack_pop_pointer() : () -> i64
      %6146 = func.call @cc_cons(%6145, %6144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %6147 = arith.addi %6146, %__rlasp_stack_elide_zero_271 : i64
      %6148 = func.call @stack_pop_pointer() : () -> i64
      %6149 = func.call @cc_cons(%6148, %6147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %6150 = arith.addi %6149, %__rlasp_stack_elide_zero_272 : i64
      %6165 = arith.constant 209815645192219 : i64
      %6166 = arith.constant 0 : i64
      %6167 = func.call @cc_make_closure(%6165, %6166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %6168 = arith.addi %6167, %__rlasp_stack_elide_zero_273 : i64
      %6169 = arith.constant 128 : i64
      %6170 = func.call @cc_box_character(%6169) : (i64) -> i64
      func.call @stack_push_pointer(%6170) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6171 = func.call @stack_pop_pointer() : () -> i64
      %6172 = func.call @stack_pop_pointer() : () -> i64
      %6173 = func.call @cc_cons(%6172, %6171) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %6174 = arith.addi %6173, %__rlasp_stack_elide_zero_274 : i64
      %6175 = llvm.mlir.addressof @str467 : !llvm.ptr
      %6176 = arith.constant 11 : i64
      %6177 = func.call @cc_make_string(%6175, %6176) : (!llvm.ptr, i64) -> i64
      %6178 = llvm.mlir.addressof @str468 : !llvm.ptr
      %6179 = arith.constant 7 : i64
      %6180 = func.call @cc_make_string(%6178, %6179) : (!llvm.ptr, i64) -> i64
      %6181 = func.call @cc_intern(%6177, %6180) : (i64, i64) -> i64
      %6182 = func.call @cc_nil_value() : () -> i64
      %6183 = func.call @cc_cons(%6181, %6182) : (i64, i64) -> i64
      %6184 = func.call @cc_values_pack(%6183) : (i64) -> i64
      %6185 = func.call @cc_nil_value() : () -> i64
      %6186 = llvm.mlir.addressof @str469 : !llvm.ptr
      %6187 = arith.constant 4 : i64
      %6188 = func.call @cc_make_string(%6186, %6187) : (!llvm.ptr, i64) -> i64
      %6189 = llvm.mlir.addressof @str470 : !llvm.ptr
      %6190 = arith.constant 7 : i64
      %6191 = func.call @cc_make_string(%6189, %6190) : (!llvm.ptr, i64) -> i64
      %6192 = func.call @cc_intern(%6188, %6191) : (i64, i64) -> i64
      %6193 = func.call @cc_nil_value() : () -> i64
      %6194 = func.call @cc_cons(%6192, %6193) : (i64, i64) -> i64
      %6195 = func.call @cc_values_pack(%6194) : (i64) -> i64
      %6196 = llvm.mlir.addressof @str471 : !llvm.ptr
      %6197 = arith.constant 6 : i64
      %6198 = func.call @cc_make_string(%6196, %6197) : (!llvm.ptr, i64) -> i64
      %6199 = func.call @cc_nil_value() : () -> i64
      %6200 = func.call @cc_intern(%6198, %6199) : (i64, i64) -> i64
      %6201 = func.call @cc_nil_value() : () -> i64
      %6202 = func.call @cc_cons(%6200, %6201) : (i64, i64) -> i64
      %6203 = func.call @cc_values_pack(%6202) : (i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %6204 = arith.addi %6200, %__rlasp_stack_elide_zero_275 : i64
      %6205 = func.call @cc_nil_value() : () -> i64
      %6206 = func.call @cc_errorp(%6100) : (i64) -> i64
      %6207 = arith.cmpi ne, %6206, %6205 : i64
      %6208 = arith.cmpi eq, %6205, %6205 : i64
      %6209 = arith.andi %6207, %6208 : i1
      %6210 = scf.if %6209 -> (i64) {
        scf.yield %6100 : i64
      } else {
        scf.yield %6205 : i64
      }
      %6211 = func.call @cc_errorp(%6150) : (i64) -> i64
      %6212 = arith.cmpi ne, %6211, %6205 : i64
      %6213 = arith.cmpi eq, %6210, %6205 : i64
      %6214 = arith.andi %6212, %6213 : i1
      %6215 = scf.if %6214 -> (i64) {
        scf.yield %6150 : i64
      } else {
        scf.yield %6210 : i64
      }
      %6216 = func.call @cc_errorp(%6168) : (i64) -> i64
      %6217 = arith.cmpi ne, %6216, %6205 : i64
      %6218 = arith.cmpi eq, %6215, %6205 : i64
      %6219 = arith.andi %6217, %6218 : i1
      %6220 = scf.if %6219 -> (i64) {
        scf.yield %6168 : i64
      } else {
        scf.yield %6215 : i64
      }
      %6221 = func.call @cc_errorp(%6174) : (i64) -> i64
      %6222 = arith.cmpi ne, %6221, %6205 : i64
      %6223 = arith.cmpi eq, %6220, %6205 : i64
      %6224 = arith.andi %6222, %6223 : i1
      %6225 = scf.if %6224 -> (i64) {
        scf.yield %6174 : i64
      } else {
        scf.yield %6220 : i64
      }
      %6226 = func.call @cc_errorp(%6181) : (i64) -> i64
      %6227 = arith.cmpi ne, %6226, %6205 : i64
      %6228 = arith.cmpi eq, %6225, %6205 : i64
      %6229 = arith.andi %6227, %6228 : i1
      %6230 = scf.if %6229 -> (i64) {
        scf.yield %6181 : i64
      } else {
        scf.yield %6225 : i64
      }
      %6231 = func.call @cc_errorp(%6185) : (i64) -> i64
      %6232 = arith.cmpi ne, %6231, %6205 : i64
      %6233 = arith.cmpi eq, %6230, %6205 : i64
      %6234 = arith.andi %6232, %6233 : i1
      %6235 = scf.if %6234 -> (i64) {
        scf.yield %6185 : i64
      } else {
        scf.yield %6230 : i64
      }
      %6236 = func.call @cc_errorp(%6192) : (i64) -> i64
      %6237 = arith.cmpi ne, %6236, %6205 : i64
      %6238 = arith.cmpi eq, %6235, %6205 : i64
      %6239 = arith.andi %6237, %6238 : i1
      %6240 = scf.if %6239 -> (i64) {
        scf.yield %6192 : i64
      } else {
        scf.yield %6235 : i64
      }
      %6241 = func.call @cc_errorp(%6204) : (i64) -> i64
      %6242 = arith.cmpi ne, %6241, %6205 : i64
      %6243 = arith.cmpi eq, %6240, %6205 : i64
      %6244 = arith.andi %6242, %6243 : i1
      %6245 = scf.if %6244 -> (i64) {
        scf.yield %6204 : i64
      } else {
        scf.yield %6240 : i64
      }
      %6246 = arith.cmpi ne, %6245, %6205 : i64
      scf.if %6246 {
        func.call @stack_push_pointer(%6245) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6100) : (i64) -> ()
        func.call @stack_push_pointer(%6150) : (i64) -> ()
        func.call @stack_push_pointer(%6168) : (i64) -> ()
        func.call @stack_push_pointer(%6174) : (i64) -> ()
        func.call @stack_push_pointer(%6181) : (i64) -> ()
        func.call @stack_push_pointer(%6185) : (i64) -> ()
        func.call @stack_push_pointer(%6192) : (i64) -> ()
        func.call @stack_push_pointer(%6204) : (i64) -> ()
        %6247 = llvm.mlir.addressof @str472 : !llvm.ptr
        %6248 = func.call @cc_make_function_ref_const(%6247) : (!llvm.ptr) -> i64
        %6249 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6248, %6249) : (i64, i64) -> ()
      }
      %6250 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6250 : i64
    }
    %6251 = func.call @cc_nil_value() : () -> i64
    %6252 = func.call @cc_errorp(%6091) : (i64) -> i64
    %6253 = arith.cmpi ne, %6252, %6251 : i64
    %6254 = scf.if %6253 -> (i64) {
      scf.yield %6091 : i64
    } else {
      %6255 = llvm.mlir.addressof @str473 : !llvm.ptr
      %6256 = arith.constant 12 : i64
      %6257 = func.call @cc_make_string(%6255, %6256) : (!llvm.ptr, i64) -> i64
      %6258 = func.call @cc_nil_value() : () -> i64
      %6259 = func.call @cc_intern(%6257, %6258) : (i64, i64) -> i64
      %6260 = func.call @cc_nil_value() : () -> i64
      %6261 = func.call @cc_cons(%6259, %6260) : (i64, i64) -> i64
      %6262 = func.call @cc_values_pack(%6261) : (i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %6263 = arith.addi %6259, %__rlasp_stack_elide_zero_276 : i64
      %6264 = llvm.mlir.addressof @str474 : !llvm.ptr
      %6265 = arith.constant 6 : i64
      %6266 = func.call @cc_make_string(%6264, %6265) : (!llvm.ptr, i64) -> i64
      %6267 = func.call @cc_nil_value() : () -> i64
      %6268 = func.call @cc_intern(%6266, %6267) : (i64, i64) -> i64
      %6269 = func.call @cc_nil_value() : () -> i64
      %6270 = func.call @cc_cons(%6268, %6269) : (i64, i64) -> i64
      %6271 = func.call @cc_values_pack(%6270) : (i64) -> i64
      func.call @stack_push_pointer(%6268) : (i64) -> ()
      %6272 = llvm.mlir.addressof @str475 : !llvm.ptr
      %6273 = arith.constant 9 : i64
      %6274 = func.call @cc_make_string(%6272, %6273) : (!llvm.ptr, i64) -> i64
      %6275 = llvm.mlir.addressof @str476 : !llvm.ptr
      %6276 = arith.constant 11 : i64
      %6277 = func.call @cc_make_string(%6275, %6276) : (!llvm.ptr, i64) -> i64
      %6278 = func.call @cc_intern(%6274, %6277) : (i64, i64) -> i64
      %6279 = func.call @cc_nil_value() : () -> i64
      %6280 = func.call @cc_cons(%6278, %6279) : (i64, i64) -> i64
      %6281 = func.call @cc_values_pack(%6280) : (i64) -> i64
      func.call @stack_push_pointer(%6278) : (i64) -> ()
      %6282 = llvm.mlir.addressof @str477 : !llvm.ptr
      %6283 = arith.constant 9 : i64
      %6284 = func.call @cc_make_string(%6282, %6283) : (!llvm.ptr, i64) -> i64
      %6285 = llvm.mlir.addressof @str478 : !llvm.ptr
      %6286 = arith.constant 11 : i64
      %6287 = func.call @cc_make_string(%6285, %6286) : (!llvm.ptr, i64) -> i64
      %6288 = func.call @cc_intern(%6284, %6287) : (i64, i64) -> i64
      %6289 = func.call @cc_nil_value() : () -> i64
      %6290 = func.call @cc_cons(%6288, %6289) : (i64, i64) -> i64
      %6291 = func.call @cc_values_pack(%6290) : (i64) -> i64
      func.call @stack_push_pointer(%6288) : (i64) -> ()
      %6292 = llvm.mlir.addressof @str479 : !llvm.ptr
      %6293 = arith.constant 9 : i64
      %6294 = func.call @cc_make_string(%6292, %6293) : (!llvm.ptr, i64) -> i64
      %6295 = llvm.mlir.addressof @str480 : !llvm.ptr
      %6296 = arith.constant 11 : i64
      %6297 = func.call @cc_make_string(%6295, %6296) : (!llvm.ptr, i64) -> i64
      %6298 = func.call @cc_intern(%6294, %6297) : (i64, i64) -> i64
      %6299 = func.call @cc_nil_value() : () -> i64
      %6300 = func.call @cc_cons(%6298, %6299) : (i64, i64) -> i64
      %6301 = func.call @cc_values_pack(%6300) : (i64) -> i64
      func.call @stack_push_pointer(%6298) : (i64) -> ()
      %6302 = arith.constant 255 : i64
      func.call @stack_push_fixnum(%6302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6303 = func.call @stack_pop_pointer() : () -> i64
      %6304 = func.call @stack_pop_pointer() : () -> i64
      %6305 = func.call @cc_cons(%6304, %6303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %6306 = arith.addi %6305, %__rlasp_stack_elide_zero_277 : i64
      %6307 = func.call @stack_pop_pointer() : () -> i64
      %6308 = func.call @cc_cons(%6307, %6306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6308) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6309 = func.call @stack_pop_pointer() : () -> i64
      %6310 = func.call @stack_pop_pointer() : () -> i64
      %6311 = func.call @cc_cons(%6310, %6309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %6312 = arith.addi %6311, %__rlasp_stack_elide_zero_278 : i64
      %6313 = func.call @stack_pop_pointer() : () -> i64
      %6314 = func.call @cc_cons(%6313, %6312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6315 = func.call @stack_pop_pointer() : () -> i64
      %6316 = func.call @stack_pop_pointer() : () -> i64
      %6317 = func.call @cc_cons(%6316, %6315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %6318 = arith.addi %6317, %__rlasp_stack_elide_zero_279 : i64
      %6319 = func.call @stack_pop_pointer() : () -> i64
      %6320 = func.call @cc_cons(%6319, %6318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6320) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6321 = func.call @stack_pop_pointer() : () -> i64
      %6322 = func.call @stack_pop_pointer() : () -> i64
      %6323 = func.call @cc_cons(%6322, %6321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %6324 = arith.addi %6323, %__rlasp_stack_elide_zero_280 : i64
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @cc_cons(%6325, %6324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %6327 = arith.addi %6326, %__rlasp_stack_elide_zero_281 : i64
      %6347 = arith.constant 209815645192220 : i64
      %6348 = arith.constant 0 : i64
      %6349 = func.call @cc_make_closure(%6347, %6348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %6350 = arith.addi %6349, %__rlasp_stack_elide_zero_282 : i64
      %6351 = llvm.mlir.addressof @str481 : !llvm.ptr
      %6352 = arith.constant 9 : i64
      %6353 = func.call @cc_make_string(%6351, %6352) : (!llvm.ptr, i64) -> i64
      %6354 = llvm.mlir.addressof @str482 : !llvm.ptr
      %6355 = arith.constant 11 : i64
      %6356 = func.call @cc_make_string(%6354, %6355) : (!llvm.ptr, i64) -> i64
      %6357 = func.call @cc_intern(%6353, %6356) : (i64, i64) -> i64
      %6358 = func.call @cc_nil_value() : () -> i64
      %6359 = func.call @cc_cons(%6357, %6358) : (i64, i64) -> i64
      %6360 = func.call @cc_values_pack(%6359) : (i64) -> i64
      func.call @stack_push_pointer(%6357) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6361 = func.call @stack_pop_pointer() : () -> i64
      %6362 = func.call @stack_pop_pointer() : () -> i64
      %6363 = func.call @cc_cons(%6362, %6361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %6364 = arith.addi %6363, %__rlasp_stack_elide_zero_283 : i64
      %6365 = llvm.mlir.addressof @str483 : !llvm.ptr
      %6366 = arith.constant 11 : i64
      %6367 = func.call @cc_make_string(%6365, %6366) : (!llvm.ptr, i64) -> i64
      %6368 = llvm.mlir.addressof @str484 : !llvm.ptr
      %6369 = arith.constant 7 : i64
      %6370 = func.call @cc_make_string(%6368, %6369) : (!llvm.ptr, i64) -> i64
      %6371 = func.call @cc_intern(%6367, %6370) : (i64, i64) -> i64
      %6372 = func.call @cc_nil_value() : () -> i64
      %6373 = func.call @cc_cons(%6371, %6372) : (i64, i64) -> i64
      %6374 = func.call @cc_values_pack(%6373) : (i64) -> i64
      %6375 = func.call @cc_nil_value() : () -> i64
      %6376 = llvm.mlir.addressof @str485 : !llvm.ptr
      %6377 = arith.constant 4 : i64
      %6378 = func.call @cc_make_string(%6376, %6377) : (!llvm.ptr, i64) -> i64
      %6379 = llvm.mlir.addressof @str486 : !llvm.ptr
      %6380 = arith.constant 7 : i64
      %6381 = func.call @cc_make_string(%6379, %6380) : (!llvm.ptr, i64) -> i64
      %6382 = func.call @cc_intern(%6378, %6381) : (i64, i64) -> i64
      %6383 = func.call @cc_nil_value() : () -> i64
      %6384 = func.call @cc_cons(%6382, %6383) : (i64, i64) -> i64
      %6385 = func.call @cc_values_pack(%6384) : (i64) -> i64
      %6386 = llvm.mlir.addressof @str487 : !llvm.ptr
      %6387 = arith.constant 5 : i64
      %6388 = func.call @cc_make_string(%6386, %6387) : (!llvm.ptr, i64) -> i64
      %6389 = func.call @cc_nil_value() : () -> i64
      %6390 = func.call @cc_intern(%6388, %6389) : (i64, i64) -> i64
      %6391 = func.call @cc_nil_value() : () -> i64
      %6392 = func.call @cc_cons(%6390, %6391) : (i64, i64) -> i64
      %6393 = func.call @cc_values_pack(%6392) : (i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %6394 = arith.addi %6390, %__rlasp_stack_elide_zero_284 : i64
      %6395 = func.call @cc_nil_value() : () -> i64
      %6396 = func.call @cc_errorp(%6263) : (i64) -> i64
      %6397 = arith.cmpi ne, %6396, %6395 : i64
      %6398 = arith.cmpi eq, %6395, %6395 : i64
      %6399 = arith.andi %6397, %6398 : i1
      %6400 = scf.if %6399 -> (i64) {
        scf.yield %6263 : i64
      } else {
        scf.yield %6395 : i64
      }
      %6401 = func.call @cc_errorp(%6327) : (i64) -> i64
      %6402 = arith.cmpi ne, %6401, %6395 : i64
      %6403 = arith.cmpi eq, %6400, %6395 : i64
      %6404 = arith.andi %6402, %6403 : i1
      %6405 = scf.if %6404 -> (i64) {
        scf.yield %6327 : i64
      } else {
        scf.yield %6400 : i64
      }
      %6406 = func.call @cc_errorp(%6350) : (i64) -> i64
      %6407 = arith.cmpi ne, %6406, %6395 : i64
      %6408 = arith.cmpi eq, %6405, %6395 : i64
      %6409 = arith.andi %6407, %6408 : i1
      %6410 = scf.if %6409 -> (i64) {
        scf.yield %6350 : i64
      } else {
        scf.yield %6405 : i64
      }
      %6411 = func.call @cc_errorp(%6364) : (i64) -> i64
      %6412 = arith.cmpi ne, %6411, %6395 : i64
      %6413 = arith.cmpi eq, %6410, %6395 : i64
      %6414 = arith.andi %6412, %6413 : i1
      %6415 = scf.if %6414 -> (i64) {
        scf.yield %6364 : i64
      } else {
        scf.yield %6410 : i64
      }
      %6416 = func.call @cc_errorp(%6371) : (i64) -> i64
      %6417 = arith.cmpi ne, %6416, %6395 : i64
      %6418 = arith.cmpi eq, %6415, %6395 : i64
      %6419 = arith.andi %6417, %6418 : i1
      %6420 = scf.if %6419 -> (i64) {
        scf.yield %6371 : i64
      } else {
        scf.yield %6415 : i64
      }
      %6421 = func.call @cc_errorp(%6375) : (i64) -> i64
      %6422 = arith.cmpi ne, %6421, %6395 : i64
      %6423 = arith.cmpi eq, %6420, %6395 : i64
      %6424 = arith.andi %6422, %6423 : i1
      %6425 = scf.if %6424 -> (i64) {
        scf.yield %6375 : i64
      } else {
        scf.yield %6420 : i64
      }
      %6426 = func.call @cc_errorp(%6382) : (i64) -> i64
      %6427 = arith.cmpi ne, %6426, %6395 : i64
      %6428 = arith.cmpi eq, %6425, %6395 : i64
      %6429 = arith.andi %6427, %6428 : i1
      %6430 = scf.if %6429 -> (i64) {
        scf.yield %6382 : i64
      } else {
        scf.yield %6425 : i64
      }
      %6431 = func.call @cc_errorp(%6394) : (i64) -> i64
      %6432 = arith.cmpi ne, %6431, %6395 : i64
      %6433 = arith.cmpi eq, %6430, %6395 : i64
      %6434 = arith.andi %6432, %6433 : i1
      %6435 = scf.if %6434 -> (i64) {
        scf.yield %6394 : i64
      } else {
        scf.yield %6430 : i64
      }
      %6436 = arith.cmpi ne, %6435, %6395 : i64
      scf.if %6436 {
        func.call @stack_push_pointer(%6435) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6263) : (i64) -> ()
        func.call @stack_push_pointer(%6327) : (i64) -> ()
        func.call @stack_push_pointer(%6350) : (i64) -> ()
        func.call @stack_push_pointer(%6364) : (i64) -> ()
        func.call @stack_push_pointer(%6371) : (i64) -> ()
        func.call @stack_push_pointer(%6375) : (i64) -> ()
        func.call @stack_push_pointer(%6382) : (i64) -> ()
        func.call @stack_push_pointer(%6394) : (i64) -> ()
        %6437 = llvm.mlir.addressof @str488 : !llvm.ptr
        %6438 = func.call @cc_make_function_ref_const(%6437) : (!llvm.ptr) -> i64
        %6439 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6438, %6439) : (i64, i64) -> ()
      }
      %6440 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6440 : i64
    }
    %6441 = func.call @cc_nil_value() : () -> i64
    %6442 = func.call @cc_errorp(%6254) : (i64) -> i64
    %6443 = arith.cmpi ne, %6442, %6441 : i64
    %6444 = scf.if %6443 -> (i64) {
      scf.yield %6254 : i64
    } else {
      %6445 = llvm.mlir.addressof @str489 : !llvm.ptr
      %6446 = arith.constant 12 : i64
      %6447 = func.call @cc_make_string(%6445, %6446) : (!llvm.ptr, i64) -> i64
      %6448 = func.call @cc_nil_value() : () -> i64
      %6449 = func.call @cc_intern(%6447, %6448) : (i64, i64) -> i64
      %6450 = func.call @cc_nil_value() : () -> i64
      %6451 = func.call @cc_cons(%6449, %6450) : (i64, i64) -> i64
      %6452 = func.call @cc_values_pack(%6451) : (i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %6453 = arith.addi %6449, %__rlasp_stack_elide_zero_285 : i64
      %6454 = llvm.mlir.addressof @str490 : !llvm.ptr
      %6455 = arith.constant 6 : i64
      %6456 = func.call @cc_make_string(%6454, %6455) : (!llvm.ptr, i64) -> i64
      %6457 = func.call @cc_nil_value() : () -> i64
      %6458 = func.call @cc_intern(%6456, %6457) : (i64, i64) -> i64
      %6459 = func.call @cc_nil_value() : () -> i64
      %6460 = func.call @cc_cons(%6458, %6459) : (i64, i64) -> i64
      %6461 = func.call @cc_values_pack(%6460) : (i64) -> i64
      func.call @stack_push_pointer(%6458) : (i64) -> ()
      %6462 = llvm.mlir.addressof @str491 : !llvm.ptr
      %6463 = arith.constant 9 : i64
      %6464 = func.call @cc_make_string(%6462, %6463) : (!llvm.ptr, i64) -> i64
      %6465 = llvm.mlir.addressof @str492 : !llvm.ptr
      %6466 = arith.constant 11 : i64
      %6467 = func.call @cc_make_string(%6465, %6466) : (!llvm.ptr, i64) -> i64
      %6468 = func.call @cc_intern(%6464, %6467) : (i64, i64) -> i64
      %6469 = func.call @cc_nil_value() : () -> i64
      %6470 = func.call @cc_cons(%6468, %6469) : (i64, i64) -> i64
      %6471 = func.call @cc_values_pack(%6470) : (i64) -> i64
      func.call @stack_push_pointer(%6468) : (i64) -> ()
      %6472 = llvm.mlir.addressof @str493 : !llvm.ptr
      %6473 = arith.constant 9 : i64
      %6474 = func.call @cc_make_string(%6472, %6473) : (!llvm.ptr, i64) -> i64
      %6475 = llvm.mlir.addressof @str494 : !llvm.ptr
      %6476 = arith.constant 11 : i64
      %6477 = func.call @cc_make_string(%6475, %6476) : (!llvm.ptr, i64) -> i64
      %6478 = func.call @cc_intern(%6474, %6477) : (i64, i64) -> i64
      %6479 = func.call @cc_nil_value() : () -> i64
      %6480 = func.call @cc_cons(%6478, %6479) : (i64, i64) -> i64
      %6481 = func.call @cc_values_pack(%6480) : (i64) -> i64
      func.call @stack_push_pointer(%6478) : (i64) -> ()
      %6482 = llvm.mlir.addressof @str495 : !llvm.ptr
      %6483 = arith.constant 9 : i64
      %6484 = func.call @cc_make_string(%6482, %6483) : (!llvm.ptr, i64) -> i64
      %6485 = llvm.mlir.addressof @str496 : !llvm.ptr
      %6486 = arith.constant 11 : i64
      %6487 = func.call @cc_make_string(%6485, %6486) : (!llvm.ptr, i64) -> i64
      %6488 = func.call @cc_intern(%6484, %6487) : (i64, i64) -> i64
      %6489 = func.call @cc_nil_value() : () -> i64
      %6490 = func.call @cc_cons(%6488, %6489) : (i64, i64) -> i64
      %6491 = func.call @cc_values_pack(%6490) : (i64) -> i64
      func.call @stack_push_pointer(%6488) : (i64) -> ()
      %6492 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%6492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6493 = func.call @stack_pop_pointer() : () -> i64
      %6494 = func.call @stack_pop_pointer() : () -> i64
      %6495 = func.call @cc_cons(%6494, %6493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %6496 = arith.addi %6495, %__rlasp_stack_elide_zero_286 : i64
      %6497 = func.call @stack_pop_pointer() : () -> i64
      %6498 = func.call @cc_cons(%6497, %6496) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6498) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6499 = func.call @stack_pop_pointer() : () -> i64
      %6500 = func.call @stack_pop_pointer() : () -> i64
      %6501 = func.call @cc_cons(%6500, %6499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %6502 = arith.addi %6501, %__rlasp_stack_elide_zero_287 : i64
      %6503 = func.call @stack_pop_pointer() : () -> i64
      %6504 = func.call @cc_cons(%6503, %6502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6504) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6505 = func.call @stack_pop_pointer() : () -> i64
      %6506 = func.call @stack_pop_pointer() : () -> i64
      %6507 = func.call @cc_cons(%6506, %6505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %6508 = arith.addi %6507, %__rlasp_stack_elide_zero_288 : i64
      %6509 = func.call @stack_pop_pointer() : () -> i64
      %6510 = func.call @cc_cons(%6509, %6508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6511 = func.call @stack_pop_pointer() : () -> i64
      %6512 = func.call @stack_pop_pointer() : () -> i64
      %6513 = func.call @cc_cons(%6512, %6511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %6514 = arith.addi %6513, %__rlasp_stack_elide_zero_289 : i64
      %6515 = func.call @stack_pop_pointer() : () -> i64
      %6516 = func.call @cc_cons(%6515, %6514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %6517 = arith.addi %6516, %__rlasp_stack_elide_zero_290 : i64
      %6537 = arith.constant 209815645192221 : i64
      %6538 = arith.constant 0 : i64
      %6539 = func.call @cc_make_closure(%6537, %6538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %6540 = arith.addi %6539, %__rlasp_stack_elide_zero_291 : i64
      %6541 = llvm.mlir.addressof @str497 : !llvm.ptr
      %6542 = arith.constant 9 : i64
      %6543 = func.call @cc_make_string(%6541, %6542) : (!llvm.ptr, i64) -> i64
      %6544 = llvm.mlir.addressof @str498 : !llvm.ptr
      %6545 = arith.constant 11 : i64
      %6546 = func.call @cc_make_string(%6544, %6545) : (!llvm.ptr, i64) -> i64
      %6547 = func.call @cc_intern(%6543, %6546) : (i64, i64) -> i64
      %6548 = func.call @cc_nil_value() : () -> i64
      %6549 = func.call @cc_cons(%6547, %6548) : (i64, i64) -> i64
      %6550 = func.call @cc_values_pack(%6549) : (i64) -> i64
      func.call @stack_push_pointer(%6547) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6551 = func.call @stack_pop_pointer() : () -> i64
      %6552 = func.call @stack_pop_pointer() : () -> i64
      %6553 = func.call @cc_cons(%6552, %6551) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %6554 = arith.addi %6553, %__rlasp_stack_elide_zero_292 : i64
      %6555 = llvm.mlir.addressof @str499 : !llvm.ptr
      %6556 = arith.constant 11 : i64
      %6557 = func.call @cc_make_string(%6555, %6556) : (!llvm.ptr, i64) -> i64
      %6558 = llvm.mlir.addressof @str500 : !llvm.ptr
      %6559 = arith.constant 7 : i64
      %6560 = func.call @cc_make_string(%6558, %6559) : (!llvm.ptr, i64) -> i64
      %6561 = func.call @cc_intern(%6557, %6560) : (i64, i64) -> i64
      %6562 = func.call @cc_nil_value() : () -> i64
      %6563 = func.call @cc_cons(%6561, %6562) : (i64, i64) -> i64
      %6564 = func.call @cc_values_pack(%6563) : (i64) -> i64
      %6565 = func.call @cc_nil_value() : () -> i64
      %6566 = llvm.mlir.addressof @str501 : !llvm.ptr
      %6567 = arith.constant 4 : i64
      %6568 = func.call @cc_make_string(%6566, %6567) : (!llvm.ptr, i64) -> i64
      %6569 = llvm.mlir.addressof @str502 : !llvm.ptr
      %6570 = arith.constant 7 : i64
      %6571 = func.call @cc_make_string(%6569, %6570) : (!llvm.ptr, i64) -> i64
      %6572 = func.call @cc_intern(%6568, %6571) : (i64, i64) -> i64
      %6573 = func.call @cc_nil_value() : () -> i64
      %6574 = func.call @cc_cons(%6572, %6573) : (i64, i64) -> i64
      %6575 = func.call @cc_values_pack(%6574) : (i64) -> i64
      %6576 = llvm.mlir.addressof @str503 : !llvm.ptr
      %6577 = arith.constant 5 : i64
      %6578 = func.call @cc_make_string(%6576, %6577) : (!llvm.ptr, i64) -> i64
      %6579 = func.call @cc_nil_value() : () -> i64
      %6580 = func.call @cc_intern(%6578, %6579) : (i64, i64) -> i64
      %6581 = func.call @cc_nil_value() : () -> i64
      %6582 = func.call @cc_cons(%6580, %6581) : (i64, i64) -> i64
      %6583 = func.call @cc_values_pack(%6582) : (i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %6584 = arith.addi %6580, %__rlasp_stack_elide_zero_293 : i64
      %6585 = func.call @cc_nil_value() : () -> i64
      %6586 = func.call @cc_errorp(%6453) : (i64) -> i64
      %6587 = arith.cmpi ne, %6586, %6585 : i64
      %6588 = arith.cmpi eq, %6585, %6585 : i64
      %6589 = arith.andi %6587, %6588 : i1
      %6590 = scf.if %6589 -> (i64) {
        scf.yield %6453 : i64
      } else {
        scf.yield %6585 : i64
      }
      %6591 = func.call @cc_errorp(%6517) : (i64) -> i64
      %6592 = arith.cmpi ne, %6591, %6585 : i64
      %6593 = arith.cmpi eq, %6590, %6585 : i64
      %6594 = arith.andi %6592, %6593 : i1
      %6595 = scf.if %6594 -> (i64) {
        scf.yield %6517 : i64
      } else {
        scf.yield %6590 : i64
      }
      %6596 = func.call @cc_errorp(%6540) : (i64) -> i64
      %6597 = arith.cmpi ne, %6596, %6585 : i64
      %6598 = arith.cmpi eq, %6595, %6585 : i64
      %6599 = arith.andi %6597, %6598 : i1
      %6600 = scf.if %6599 -> (i64) {
        scf.yield %6540 : i64
      } else {
        scf.yield %6595 : i64
      }
      %6601 = func.call @cc_errorp(%6554) : (i64) -> i64
      %6602 = arith.cmpi ne, %6601, %6585 : i64
      %6603 = arith.cmpi eq, %6600, %6585 : i64
      %6604 = arith.andi %6602, %6603 : i1
      %6605 = scf.if %6604 -> (i64) {
        scf.yield %6554 : i64
      } else {
        scf.yield %6600 : i64
      }
      %6606 = func.call @cc_errorp(%6561) : (i64) -> i64
      %6607 = arith.cmpi ne, %6606, %6585 : i64
      %6608 = arith.cmpi eq, %6605, %6585 : i64
      %6609 = arith.andi %6607, %6608 : i1
      %6610 = scf.if %6609 -> (i64) {
        scf.yield %6561 : i64
      } else {
        scf.yield %6605 : i64
      }
      %6611 = func.call @cc_errorp(%6565) : (i64) -> i64
      %6612 = arith.cmpi ne, %6611, %6585 : i64
      %6613 = arith.cmpi eq, %6610, %6585 : i64
      %6614 = arith.andi %6612, %6613 : i1
      %6615 = scf.if %6614 -> (i64) {
        scf.yield %6565 : i64
      } else {
        scf.yield %6610 : i64
      }
      %6616 = func.call @cc_errorp(%6572) : (i64) -> i64
      %6617 = arith.cmpi ne, %6616, %6585 : i64
      %6618 = arith.cmpi eq, %6615, %6585 : i64
      %6619 = arith.andi %6617, %6618 : i1
      %6620 = scf.if %6619 -> (i64) {
        scf.yield %6572 : i64
      } else {
        scf.yield %6615 : i64
      }
      %6621 = func.call @cc_errorp(%6584) : (i64) -> i64
      %6622 = arith.cmpi ne, %6621, %6585 : i64
      %6623 = arith.cmpi eq, %6620, %6585 : i64
      %6624 = arith.andi %6622, %6623 : i1
      %6625 = scf.if %6624 -> (i64) {
        scf.yield %6584 : i64
      } else {
        scf.yield %6620 : i64
      }
      %6626 = arith.cmpi ne, %6625, %6585 : i64
      scf.if %6626 {
        func.call @stack_push_pointer(%6625) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6453) : (i64) -> ()
        func.call @stack_push_pointer(%6517) : (i64) -> ()
        func.call @stack_push_pointer(%6540) : (i64) -> ()
        func.call @stack_push_pointer(%6554) : (i64) -> ()
        func.call @stack_push_pointer(%6561) : (i64) -> ()
        func.call @stack_push_pointer(%6565) : (i64) -> ()
        func.call @stack_push_pointer(%6572) : (i64) -> ()
        func.call @stack_push_pointer(%6584) : (i64) -> ()
        %6627 = llvm.mlir.addressof @str504 : !llvm.ptr
        %6628 = func.call @cc_make_function_ref_const(%6627) : (!llvm.ptr) -> i64
        %6629 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6628, %6629) : (i64, i64) -> ()
      }
      %6630 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6630 : i64
    }
    %6631 = func.call @cc_nil_value() : () -> i64
    %6632 = func.call @cc_errorp(%6444) : (i64) -> i64
    %6633 = arith.cmpi ne, %6632, %6631 : i64
    %6634 = scf.if %6633 -> (i64) {
      scf.yield %6444 : i64
    } else {
      %6635 = llvm.mlir.addressof @str505 : !llvm.ptr
      %6636 = arith.constant 12 : i64
      %6637 = func.call @cc_make_string(%6635, %6636) : (!llvm.ptr, i64) -> i64
      %6638 = func.call @cc_nil_value() : () -> i64
      %6639 = func.call @cc_intern(%6637, %6638) : (i64, i64) -> i64
      %6640 = func.call @cc_nil_value() : () -> i64
      %6641 = func.call @cc_cons(%6639, %6640) : (i64, i64) -> i64
      %6642 = func.call @cc_values_pack(%6641) : (i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %6643 = arith.addi %6639, %__rlasp_stack_elide_zero_294 : i64
      %6644 = llvm.mlir.addressof @str506 : !llvm.ptr
      %6645 = arith.constant 4 : i64
      %6646 = func.call @cc_make_string(%6644, %6645) : (!llvm.ptr, i64) -> i64
      %6647 = func.call @cc_nil_value() : () -> i64
      %6648 = func.call @cc_intern(%6646, %6647) : (i64, i64) -> i64
      %6649 = func.call @cc_nil_value() : () -> i64
      %6650 = func.call @cc_cons(%6648, %6649) : (i64, i64) -> i64
      %6651 = func.call @cc_values_pack(%6650) : (i64) -> i64
      func.call @stack_push_pointer(%6648) : (i64) -> ()
      %6652 = llvm.mlir.addressof @str507 : !llvm.ptr
      %6653 = arith.constant 1 : i64
      %6654 = func.call @cc_make_string(%6652, %6653) : (!llvm.ptr, i64) -> i64
      %6655 = func.call @cc_nil_value() : () -> i64
      %6656 = func.call @cc_intern(%6654, %6655) : (i64, i64) -> i64
      %6657 = func.call @cc_nil_value() : () -> i64
      %6658 = func.call @cc_cons(%6656, %6657) : (i64, i64) -> i64
      %6659 = func.call @cc_values_pack(%6658) : (i64) -> i64
      func.call @stack_push_pointer(%6656) : (i64) -> ()
      %6660 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6660) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6661 = func.call @stack_pop_pointer() : () -> i64
      %6662 = func.call @stack_pop_pointer() : () -> i64
      %6663 = func.call @cc_cons(%6662, %6661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %6664 = arith.addi %6663, %__rlasp_stack_elide_zero_295 : i64
      %6665 = func.call @stack_pop_pointer() : () -> i64
      %6666 = func.call @cc_cons(%6665, %6664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6666) : (i64) -> ()
      %6667 = llvm.mlir.addressof @str508 : !llvm.ptr
      %6668 = arith.constant 19 : i64
      %6669 = func.call @cc_make_string(%6667, %6668) : (!llvm.ptr, i64) -> i64
      %6670 = func.call @cc_nil_value() : () -> i64
      %6671 = func.call @cc_intern(%6669, %6670) : (i64, i64) -> i64
      %6672 = func.call @cc_nil_value() : () -> i64
      %6673 = func.call @cc_cons(%6671, %6672) : (i64, i64) -> i64
      %6674 = func.call @cc_values_pack(%6673) : (i64) -> i64
      func.call @stack_push_pointer(%6671) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6675 = func.call @stack_pop_pointer() : () -> i64
      %6676 = func.call @stack_pop_pointer() : () -> i64
      %6677 = func.call @cc_cons(%6676, %6675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %6678 = arith.addi %6677, %__rlasp_stack_elide_zero_296 : i64
      %6679 = func.call @stack_pop_pointer() : () -> i64
      %6680 = func.call @cc_cons(%6679, %6678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6680) : (i64) -> ()
      %6681 = llvm.mlir.addressof @str509 : !llvm.ptr
      %6682 = arith.constant 1 : i64
      %6683 = func.call @cc_make_string(%6681, %6682) : (!llvm.ptr, i64) -> i64
      %6684 = func.call @cc_nil_value() : () -> i64
      %6685 = func.call @cc_intern(%6683, %6684) : (i64, i64) -> i64
      %6686 = func.call @cc_nil_value() : () -> i64
      %6687 = func.call @cc_cons(%6685, %6686) : (i64, i64) -> i64
      %6688 = func.call @cc_values_pack(%6687) : (i64) -> i64
      func.call @stack_push_pointer(%6685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6689 = func.call @stack_pop_pointer() : () -> i64
      %6690 = func.call @stack_pop_pointer() : () -> i64
      %6691 = func.call @cc_cons(%6690, %6689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %6692 = arith.addi %6691, %__rlasp_stack_elide_zero_297 : i64
      %6693 = func.call @stack_pop_pointer() : () -> i64
      %6694 = func.call @cc_cons(%6693, %6692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6694) : (i64) -> ()
      %6695 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6696 = arith.constant 15 : i64
      %6697 = func.call @cc_make_string(%6695, %6696) : (!llvm.ptr, i64) -> i64
      %6698 = func.call @cc_nil_value() : () -> i64
      %6699 = func.call @cc_intern(%6697, %6698) : (i64, i64) -> i64
      %6700 = func.call @cc_nil_value() : () -> i64
      %6701 = func.call @cc_cons(%6699, %6700) : (i64, i64) -> i64
      %6702 = func.call @cc_values_pack(%6701) : (i64) -> i64
      func.call @stack_push_pointer(%6699) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6703 = func.call @stack_pop_pointer() : () -> i64
      %6704 = func.call @stack_pop_pointer() : () -> i64
      %6705 = func.call @cc_cons(%6704, %6703) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %6706 = arith.addi %6705, %__rlasp_stack_elide_zero_298 : i64
      %6707 = func.call @stack_pop_pointer() : () -> i64
      %6708 = func.call @cc_cons(%6707, %6706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6708) : (i64) -> ()
      %6709 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6710 = arith.constant 17 : i64
      %6711 = func.call @cc_make_string(%6709, %6710) : (!llvm.ptr, i64) -> i64
      %6712 = func.call @cc_nil_value() : () -> i64
      %6713 = func.call @cc_intern(%6711, %6712) : (i64, i64) -> i64
      %6714 = func.call @cc_nil_value() : () -> i64
      %6715 = func.call @cc_cons(%6713, %6714) : (i64, i64) -> i64
      %6716 = func.call @cc_values_pack(%6715) : (i64) -> i64
      func.call @stack_push_pointer(%6713) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6717 = func.call @stack_pop_pointer() : () -> i64
      %6718 = func.call @stack_pop_pointer() : () -> i64
      %6719 = func.call @cc_cons(%6718, %6717) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %6720 = arith.addi %6719, %__rlasp_stack_elide_zero_299 : i64
      %6721 = func.call @stack_pop_pointer() : () -> i64
      %6722 = func.call @cc_cons(%6721, %6720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6723 = func.call @stack_pop_pointer() : () -> i64
      %6724 = func.call @stack_pop_pointer() : () -> i64
      %6725 = func.call @cc_cons(%6724, %6723) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %6726 = arith.addi %6725, %__rlasp_stack_elide_zero_300 : i64
      %6727 = func.call @stack_pop_pointer() : () -> i64
      %6728 = func.call @cc_cons(%6727, %6726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %6729 = arith.addi %6728, %__rlasp_stack_elide_zero_301 : i64
      %6730 = func.call @stack_pop_pointer() : () -> i64
      %6731 = func.call @cc_cons(%6730, %6729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %6732 = arith.addi %6731, %__rlasp_stack_elide_zero_302 : i64
      %6733 = func.call @stack_pop_pointer() : () -> i64
      %6734 = func.call @cc_cons(%6733, %6732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %6735 = arith.addi %6734, %__rlasp_stack_elide_zero_303 : i64
      %6736 = func.call @stack_pop_pointer() : () -> i64
      %6737 = func.call @cc_cons(%6736, %6735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6737) : (i64) -> ()
      %6738 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6739 = arith.constant 5 : i64
      %6740 = func.call @cc_make_string(%6738, %6739) : (!llvm.ptr, i64) -> i64
      %6741 = func.call @cc_nil_value() : () -> i64
      %6742 = func.call @cc_intern(%6740, %6741) : (i64, i64) -> i64
      %6743 = func.call @cc_nil_value() : () -> i64
      %6744 = func.call @cc_cons(%6742, %6743) : (i64, i64) -> i64
      %6745 = func.call @cc_values_pack(%6744) : (i64) -> i64
      func.call @stack_push_pointer(%6742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6746 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6747 = arith.constant 5 : i64
      %6748 = func.call @cc_make_string(%6746, %6747) : (!llvm.ptr, i64) -> i64
      %6749 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6750 = arith.constant 3 : i64
      %6751 = func.call @cc_make_string(%6749, %6750) : (!llvm.ptr, i64) -> i64
      %6752 = func.call @cc_intern(%6748, %6751) : (i64, i64) -> i64
      %6753 = func.call @cc_nil_value() : () -> i64
      %6754 = func.call @cc_cons(%6752, %6753) : (i64, i64) -> i64
      %6755 = func.call @cc_values_pack(%6754) : (i64) -> i64
      func.call @stack_push_pointer(%6752) : (i64) -> ()
      %6756 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6757 = arith.constant 1 : i64
      %6758 = func.call @cc_make_string(%6756, %6757) : (!llvm.ptr, i64) -> i64
      %6759 = func.call @cc_nil_value() : () -> i64
      %6760 = func.call @cc_intern(%6758, %6759) : (i64, i64) -> i64
      %6761 = func.call @cc_nil_value() : () -> i64
      %6762 = func.call @cc_cons(%6760, %6761) : (i64, i64) -> i64
      %6763 = func.call @cc_values_pack(%6762) : (i64) -> i64
      func.call @stack_push_pointer(%6760) : (i64) -> ()
      %6764 = llvm.mlir.addressof @str516 : !llvm.ptr
      %6765 = arith.constant 1 : i64
      %6766 = func.call @cc_make_string(%6764, %6765) : (!llvm.ptr, i64) -> i64
      %6767 = func.call @cc_nil_value() : () -> i64
      %6768 = func.call @cc_intern(%6766, %6767) : (i64, i64) -> i64
      %6769 = func.call @cc_nil_value() : () -> i64
      %6770 = func.call @cc_cons(%6768, %6769) : (i64, i64) -> i64
      %6771 = func.call @cc_values_pack(%6770) : (i64) -> i64
      func.call @stack_push_pointer(%6768) : (i64) -> ()
      %6772 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6773 = arith.constant 3 : i64
      %6774 = func.call @cc_make_string(%6772, %6773) : (!llvm.ptr, i64) -> i64
      %6775 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6776 = arith.constant 11 : i64
      %6777 = func.call @cc_make_string(%6775, %6776) : (!llvm.ptr, i64) -> i64
      %6778 = func.call @cc_intern(%6774, %6777) : (i64, i64) -> i64
      %6779 = func.call @cc_nil_value() : () -> i64
      %6780 = func.call @cc_cons(%6778, %6779) : (i64, i64) -> i64
      %6781 = func.call @cc_values_pack(%6780) : (i64) -> i64
      func.call @stack_push_pointer(%6778) : (i64) -> ()
      %6782 = arith.constant 65536 : i64
      func.call @stack_push_fixnum(%6782) : (i64) -> ()
      %6783 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6784 = arith.constant 15 : i64
      %6785 = func.call @cc_make_string(%6783, %6784) : (!llvm.ptr, i64) -> i64
      %6786 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6787 = arith.constant 11 : i64
      %6788 = func.call @cc_make_string(%6786, %6787) : (!llvm.ptr, i64) -> i64
      %6789 = func.call @cc_intern(%6785, %6788) : (i64, i64) -> i64
      %6790 = func.call @cc_nil_value() : () -> i64
      %6791 = func.call @cc_cons(%6789, %6790) : (i64, i64) -> i64
      %6792 = func.call @cc_values_pack(%6791) : (i64) -> i64
      func.call @stack_push_pointer(%6789) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6793 = func.call @stack_pop_pointer() : () -> i64
      %6794 = func.call @stack_pop_pointer() : () -> i64
      %6795 = func.call @cc_cons(%6794, %6793) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %6796 = arith.addi %6795, %__rlasp_stack_elide_zero_304 : i64
      %6797 = func.call @stack_pop_pointer() : () -> i64
      %6798 = func.call @cc_cons(%6797, %6796) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %6799 = arith.addi %6798, %__rlasp_stack_elide_zero_305 : i64
      %6800 = func.call @stack_pop_pointer() : () -> i64
      %6801 = func.call @cc_cons(%6800, %6799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6802 = func.call @stack_pop_pointer() : () -> i64
      %6803 = func.call @stack_pop_pointer() : () -> i64
      %6804 = func.call @cc_cons(%6803, %6802) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %6805 = arith.addi %6804, %__rlasp_stack_elide_zero_306 : i64
      %6806 = func.call @stack_pop_pointer() : () -> i64
      %6807 = func.call @cc_cons(%6806, %6805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %6808 = arith.addi %6807, %__rlasp_stack_elide_zero_307 : i64
      %6809 = func.call @stack_pop_pointer() : () -> i64
      %6810 = func.call @cc_cons(%6809, %6808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6810) : (i64) -> ()
      %6811 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6812 = arith.constant 4 : i64
      %6813 = func.call @cc_make_string(%6811, %6812) : (!llvm.ptr, i64) -> i64
      %6814 = func.call @cc_nil_value() : () -> i64
      %6815 = func.call @cc_intern(%6813, %6814) : (i64, i64) -> i64
      %6816 = func.call @cc_nil_value() : () -> i64
      %6817 = func.call @cc_cons(%6815, %6816) : (i64, i64) -> i64
      %6818 = func.call @cc_values_pack(%6817) : (i64) -> i64
      func.call @stack_push_pointer(%6815) : (i64) -> ()
      %6819 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6820 = arith.constant 17 : i64
      %6821 = func.call @cc_make_string(%6819, %6820) : (!llvm.ptr, i64) -> i64
      %6822 = func.call @cc_nil_value() : () -> i64
      %6823 = func.call @cc_intern(%6821, %6822) : (i64, i64) -> i64
      %6824 = func.call @cc_nil_value() : () -> i64
      %6825 = func.call @cc_cons(%6823, %6824) : (i64, i64) -> i64
      %6826 = func.call @cc_values_pack(%6825) : (i64) -> i64
      func.call @stack_push_pointer(%6823) : (i64) -> ()
      %6827 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%6827) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6828 = func.call @stack_pop_pointer() : () -> i64
      %6829 = func.call @stack_pop_pointer() : () -> i64
      %6830 = func.call @cc_cons(%6829, %6828) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %6831 = arith.addi %6830, %__rlasp_stack_elide_zero_308 : i64
      %6832 = func.call @stack_pop_pointer() : () -> i64
      %6833 = func.call @cc_cons(%6832, %6831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %6834 = arith.addi %6833, %__rlasp_stack_elide_zero_309 : i64
      %6835 = func.call @stack_pop_pointer() : () -> i64
      %6836 = func.call @cc_cons(%6835, %6834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6836) : (i64) -> ()
      %6837 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6838 = arith.constant 4 : i64
      %6839 = func.call @cc_make_string(%6837, %6838) : (!llvm.ptr, i64) -> i64
      %6840 = func.call @cc_nil_value() : () -> i64
      %6841 = func.call @cc_intern(%6839, %6840) : (i64, i64) -> i64
      %6842 = func.call @cc_nil_value() : () -> i64
      %6843 = func.call @cc_cons(%6841, %6842) : (i64, i64) -> i64
      %6844 = func.call @cc_values_pack(%6843) : (i64) -> i64
      func.call @stack_push_pointer(%6841) : (i64) -> ()
      %6845 = llvm.mlir.addressof @str524 : !llvm.ptr
      %6846 = arith.constant 19 : i64
      %6847 = func.call @cc_make_string(%6845, %6846) : (!llvm.ptr, i64) -> i64
      %6848 = func.call @cc_nil_value() : () -> i64
      %6849 = func.call @cc_intern(%6847, %6848) : (i64, i64) -> i64
      %6850 = func.call @cc_nil_value() : () -> i64
      %6851 = func.call @cc_cons(%6849, %6850) : (i64, i64) -> i64
      %6852 = func.call @cc_values_pack(%6851) : (i64) -> i64
      func.call @stack_push_pointer(%6849) : (i64) -> ()
      %6853 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6854 = arith.constant 1 : i64
      %6855 = func.call @cc_make_string(%6853, %6854) : (!llvm.ptr, i64) -> i64
      %6856 = func.call @cc_nil_value() : () -> i64
      %6857 = func.call @cc_intern(%6855, %6856) : (i64, i64) -> i64
      %6858 = func.call @cc_nil_value() : () -> i64
      %6859 = func.call @cc_cons(%6857, %6858) : (i64, i64) -> i64
      %6860 = func.call @cc_values_pack(%6859) : (i64) -> i64
      func.call @stack_push_pointer(%6857) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6861 = func.call @stack_pop_pointer() : () -> i64
      %6862 = func.call @stack_pop_pointer() : () -> i64
      %6863 = func.call @cc_cons(%6862, %6861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %6864 = arith.addi %6863, %__rlasp_stack_elide_zero_310 : i64
      %6865 = func.call @stack_pop_pointer() : () -> i64
      %6866 = func.call @cc_cons(%6865, %6864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %6867 = arith.addi %6866, %__rlasp_stack_elide_zero_311 : i64
      %6868 = func.call @stack_pop_pointer() : () -> i64
      %6869 = func.call @cc_cons(%6868, %6867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6869) : (i64) -> ()
      %6870 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6871 = arith.constant 4 : i64
      %6872 = func.call @cc_make_string(%6870, %6871) : (!llvm.ptr, i64) -> i64
      %6873 = func.call @cc_nil_value() : () -> i64
      %6874 = func.call @cc_intern(%6872, %6873) : (i64, i64) -> i64
      %6875 = func.call @cc_nil_value() : () -> i64
      %6876 = func.call @cc_cons(%6874, %6875) : (i64, i64) -> i64
      %6877 = func.call @cc_values_pack(%6876) : (i64) -> i64
      func.call @stack_push_pointer(%6874) : (i64) -> ()
      %6878 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6879 = arith.constant 1 : i64
      %6880 = func.call @cc_make_string(%6878, %6879) : (!llvm.ptr, i64) -> i64
      %6881 = func.call @cc_nil_value() : () -> i64
      %6882 = func.call @cc_intern(%6880, %6881) : (i64, i64) -> i64
      %6883 = func.call @cc_nil_value() : () -> i64
      %6884 = func.call @cc_cons(%6882, %6883) : (i64, i64) -> i64
      %6885 = func.call @cc_values_pack(%6884) : (i64) -> i64
      func.call @stack_push_pointer(%6882) : (i64) -> ()
      %6886 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6887 = arith.constant 9 : i64
      %6888 = func.call @cc_make_string(%6886, %6887) : (!llvm.ptr, i64) -> i64
      %6889 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6890 = arith.constant 11 : i64
      %6891 = func.call @cc_make_string(%6889, %6890) : (!llvm.ptr, i64) -> i64
      %6892 = func.call @cc_intern(%6888, %6891) : (i64, i64) -> i64
      %6893 = func.call @cc_nil_value() : () -> i64
      %6894 = func.call @cc_cons(%6892, %6893) : (i64, i64) -> i64
      %6895 = func.call @cc_values_pack(%6894) : (i64) -> i64
      func.call @stack_push_pointer(%6892) : (i64) -> ()
      %6896 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6897 = arith.constant 1 : i64
      %6898 = func.call @cc_make_string(%6896, %6897) : (!llvm.ptr, i64) -> i64
      %6899 = func.call @cc_nil_value() : () -> i64
      %6900 = func.call @cc_intern(%6898, %6899) : (i64, i64) -> i64
      %6901 = func.call @cc_nil_value() : () -> i64
      %6902 = func.call @cc_cons(%6900, %6901) : (i64, i64) -> i64
      %6903 = func.call @cc_values_pack(%6902) : (i64) -> i64
      func.call @stack_push_pointer(%6900) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6904 = func.call @stack_pop_pointer() : () -> i64
      %6905 = func.call @stack_pop_pointer() : () -> i64
      %6906 = func.call @cc_cons(%6905, %6904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %6907 = arith.addi %6906, %__rlasp_stack_elide_zero_312 : i64
      %6908 = func.call @stack_pop_pointer() : () -> i64
      %6909 = func.call @cc_cons(%6908, %6907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6910 = func.call @stack_pop_pointer() : () -> i64
      %6911 = func.call @stack_pop_pointer() : () -> i64
      %6912 = func.call @cc_cons(%6911, %6910) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %6913 = arith.addi %6912, %__rlasp_stack_elide_zero_313 : i64
      %6914 = func.call @stack_pop_pointer() : () -> i64
      %6915 = func.call @cc_cons(%6914, %6913) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %6916 = arith.addi %6915, %__rlasp_stack_elide_zero_314 : i64
      %6917 = func.call @stack_pop_pointer() : () -> i64
      %6918 = func.call @cc_cons(%6917, %6916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6918) : (i64) -> ()
      %6919 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6920 = arith.constant 2 : i64
      %6921 = func.call @cc_make_string(%6919, %6920) : (!llvm.ptr, i64) -> i64
      %6922 = func.call @cc_nil_value() : () -> i64
      %6923 = func.call @cc_intern(%6921, %6922) : (i64, i64) -> i64
      %6924 = func.call @cc_nil_value() : () -> i64
      %6925 = func.call @cc_cons(%6923, %6924) : (i64, i64) -> i64
      %6926 = func.call @cc_values_pack(%6925) : (i64) -> i64
      func.call @stack_push_pointer(%6923) : (i64) -> ()
      %6927 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6928 = arith.constant 3 : i64
      %6929 = func.call @cc_make_string(%6927, %6928) : (!llvm.ptr, i64) -> i64
      %6930 = func.call @cc_nil_value() : () -> i64
      %6931 = func.call @cc_intern(%6929, %6930) : (i64, i64) -> i64
      %6932 = func.call @cc_nil_value() : () -> i64
      %6933 = func.call @cc_cons(%6931, %6932) : (i64, i64) -> i64
      %6934 = func.call @cc_values_pack(%6933) : (i64) -> i64
      func.call @stack_push_pointer(%6931) : (i64) -> ()
      %6935 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6936 = arith.constant 2 : i64
      %6937 = func.call @cc_make_string(%6935, %6936) : (!llvm.ptr, i64) -> i64
      %6938 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6939 = arith.constant 11 : i64
      %6940 = func.call @cc_make_string(%6938, %6939) : (!llvm.ptr, i64) -> i64
      %6941 = func.call @cc_intern(%6937, %6940) : (i64, i64) -> i64
      %6942 = func.call @cc_nil_value() : () -> i64
      %6943 = func.call @cc_cons(%6941, %6942) : (i64, i64) -> i64
      %6944 = func.call @cc_values_pack(%6943) : (i64) -> i64
      func.call @stack_push_pointer(%6941) : (i64) -> ()
      %6945 = llvm.mlir.addressof @str535 : !llvm.ptr
      %6946 = arith.constant 3 : i64
      %6947 = func.call @cc_make_string(%6945, %6946) : (!llvm.ptr, i64) -> i64
      %6948 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6949 = arith.constant 11 : i64
      %6950 = func.call @cc_make_string(%6948, %6949) : (!llvm.ptr, i64) -> i64
      %6951 = func.call @cc_intern(%6947, %6950) : (i64, i64) -> i64
      %6952 = func.call @cc_nil_value() : () -> i64
      %6953 = func.call @cc_cons(%6951, %6952) : (i64, i64) -> i64
      %6954 = func.call @cc_values_pack(%6953) : (i64) -> i64
      func.call @stack_push_pointer(%6951) : (i64) -> ()
      %6955 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6956 = arith.constant 10 : i64
      %6957 = func.call @cc_make_string(%6955, %6956) : (!llvm.ptr, i64) -> i64
      %6958 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6959 = arith.constant 11 : i64
      %6960 = func.call @cc_make_string(%6958, %6959) : (!llvm.ptr, i64) -> i64
      %6961 = func.call @cc_intern(%6957, %6960) : (i64, i64) -> i64
      %6962 = func.call @cc_nil_value() : () -> i64
      %6963 = func.call @cc_cons(%6961, %6962) : (i64, i64) -> i64
      %6964 = func.call @cc_values_pack(%6963) : (i64) -> i64
      func.call @stack_push_pointer(%6961) : (i64) -> ()
      %6965 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6966 = arith.constant 1 : i64
      %6967 = func.call @cc_make_string(%6965, %6966) : (!llvm.ptr, i64) -> i64
      %6968 = func.call @cc_nil_value() : () -> i64
      %6969 = func.call @cc_intern(%6967, %6968) : (i64, i64) -> i64
      %6970 = func.call @cc_nil_value() : () -> i64
      %6971 = func.call @cc_cons(%6969, %6970) : (i64, i64) -> i64
      %6972 = func.call @cc_values_pack(%6971) : (i64) -> i64
      func.call @stack_push_pointer(%6969) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6973 = func.call @stack_pop_pointer() : () -> i64
      %6974 = func.call @stack_pop_pointer() : () -> i64
      %6975 = func.call @cc_cons(%6974, %6973) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %6976 = arith.addi %6975, %__rlasp_stack_elide_zero_315 : i64
      %6977 = func.call @stack_pop_pointer() : () -> i64
      %6978 = func.call @cc_cons(%6977, %6976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6978) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6979 = func.call @stack_pop_pointer() : () -> i64
      %6980 = func.call @stack_pop_pointer() : () -> i64
      %6981 = func.call @cc_cons(%6980, %6979) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %6982 = arith.addi %6981, %__rlasp_stack_elide_zero_316 : i64
      %6983 = func.call @stack_pop_pointer() : () -> i64
      %6984 = func.call @cc_cons(%6983, %6982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6984) : (i64) -> ()
      %6985 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6986 = arith.constant 2 : i64
      %6987 = func.call @cc_make_string(%6985, %6986) : (!llvm.ptr, i64) -> i64
      %6988 = func.call @cc_nil_value() : () -> i64
      %6989 = func.call @cc_intern(%6987, %6988) : (i64, i64) -> i64
      %6990 = func.call @cc_nil_value() : () -> i64
      %6991 = func.call @cc_cons(%6989, %6990) : (i64, i64) -> i64
      %6992 = func.call @cc_values_pack(%6991) : (i64) -> i64
      func.call @stack_push_pointer(%6989) : (i64) -> ()
      %6993 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6994 = arith.constant 11 : i64
      %6995 = func.call @cc_make_string(%6993, %6994) : (!llvm.ptr, i64) -> i64
      %6996 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6997 = arith.constant 11 : i64
      %6998 = func.call @cc_make_string(%6996, %6997) : (!llvm.ptr, i64) -> i64
      %6999 = func.call @cc_intern(%6995, %6998) : (i64, i64) -> i64
      %7000 = func.call @cc_nil_value() : () -> i64
      %7001 = func.call @cc_cons(%6999, %7000) : (i64, i64) -> i64
      %7002 = func.call @cc_values_pack(%7001) : (i64) -> i64
      func.call @stack_push_pointer(%6999) : (i64) -> ()
      %7003 = llvm.mlir.addressof @str543 : !llvm.ptr
      %7004 = arith.constant 1 : i64
      %7005 = func.call @cc_make_string(%7003, %7004) : (!llvm.ptr, i64) -> i64
      %7006 = func.call @cc_nil_value() : () -> i64
      %7007 = func.call @cc_intern(%7005, %7006) : (i64, i64) -> i64
      %7008 = func.call @cc_nil_value() : () -> i64
      %7009 = func.call @cc_cons(%7007, %7008) : (i64, i64) -> i64
      %7010 = func.call @cc_values_pack(%7009) : (i64) -> i64
      func.call @stack_push_pointer(%7007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7011 = func.call @stack_pop_pointer() : () -> i64
      %7012 = func.call @stack_pop_pointer() : () -> i64
      %7013 = func.call @cc_cons(%7012, %7011) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %7014 = arith.addi %7013, %__rlasp_stack_elide_zero_317 : i64
      %7015 = func.call @stack_pop_pointer() : () -> i64
      %7016 = func.call @cc_cons(%7015, %7014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7016) : (i64) -> ()
      %7017 = llvm.mlir.addressof @str544 : !llvm.ptr
      %7018 = arith.constant 3 : i64
      %7019 = func.call @cc_make_string(%7017, %7018) : (!llvm.ptr, i64) -> i64
      %7020 = llvm.mlir.addressof @str545 : !llvm.ptr
      %7021 = arith.constant 11 : i64
      %7022 = func.call @cc_make_string(%7020, %7021) : (!llvm.ptr, i64) -> i64
      %7023 = func.call @cc_intern(%7019, %7022) : (i64, i64) -> i64
      %7024 = func.call @cc_nil_value() : () -> i64
      %7025 = func.call @cc_cons(%7023, %7024) : (i64, i64) -> i64
      %7026 = func.call @cc_values_pack(%7025) : (i64) -> i64
      func.call @stack_push_pointer(%7023) : (i64) -> ()
      %7027 = llvm.mlir.addressof @str546 : !llvm.ptr
      %7028 = arith.constant 14 : i64
      %7029 = func.call @cc_make_string(%7027, %7028) : (!llvm.ptr, i64) -> i64
      %7030 = llvm.mlir.addressof @str547 : !llvm.ptr
      %7031 = arith.constant 11 : i64
      %7032 = func.call @cc_make_string(%7030, %7031) : (!llvm.ptr, i64) -> i64
      %7033 = func.call @cc_intern(%7029, %7032) : (i64, i64) -> i64
      %7034 = func.call @cc_nil_value() : () -> i64
      %7035 = func.call @cc_cons(%7033, %7034) : (i64, i64) -> i64
      %7036 = func.call @cc_values_pack(%7035) : (i64) -> i64
      func.call @stack_push_pointer(%7033) : (i64) -> ()
      %7037 = llvm.mlir.addressof @str548 : !llvm.ptr
      %7038 = arith.constant 1 : i64
      %7039 = func.call @cc_make_string(%7037, %7038) : (!llvm.ptr, i64) -> i64
      %7040 = func.call @cc_nil_value() : () -> i64
      %7041 = func.call @cc_intern(%7039, %7040) : (i64, i64) -> i64
      %7042 = func.call @cc_nil_value() : () -> i64
      %7043 = func.call @cc_cons(%7041, %7042) : (i64, i64) -> i64
      %7044 = func.call @cc_values_pack(%7043) : (i64) -> i64
      func.call @stack_push_pointer(%7041) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7045 = func.call @stack_pop_pointer() : () -> i64
      %7046 = func.call @stack_pop_pointer() : () -> i64
      %7047 = func.call @cc_cons(%7046, %7045) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %7048 = arith.addi %7047, %__rlasp_stack_elide_zero_318 : i64
      %7049 = func.call @stack_pop_pointer() : () -> i64
      %7050 = func.call @cc_cons(%7049, %7048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7050) : (i64) -> ()
      %7051 = llvm.mlir.addressof @str549 : !llvm.ptr
      %7052 = arith.constant 2 : i64
      %7053 = func.call @cc_make_string(%7051, %7052) : (!llvm.ptr, i64) -> i64
      %7054 = llvm.mlir.addressof @str550 : !llvm.ptr
      %7055 = arith.constant 11 : i64
      %7056 = func.call @cc_make_string(%7054, %7055) : (!llvm.ptr, i64) -> i64
      %7057 = func.call @cc_intern(%7053, %7056) : (i64, i64) -> i64
      %7058 = func.call @cc_nil_value() : () -> i64
      %7059 = func.call @cc_cons(%7057, %7058) : (i64, i64) -> i64
      %7060 = func.call @cc_values_pack(%7059) : (i64) -> i64
      func.call @stack_push_pointer(%7057) : (i64) -> ()
      %7061 = llvm.mlir.addressof @str551 : !llvm.ptr
      %7062 = arith.constant 12 : i64
      %7063 = func.call @cc_make_string(%7061, %7062) : (!llvm.ptr, i64) -> i64
      %7064 = llvm.mlir.addressof @str552 : !llvm.ptr
      %7065 = arith.constant 11 : i64
      %7066 = func.call @cc_make_string(%7064, %7065) : (!llvm.ptr, i64) -> i64
      %7067 = func.call @cc_intern(%7063, %7066) : (i64, i64) -> i64
      %7068 = func.call @cc_nil_value() : () -> i64
      %7069 = func.call @cc_cons(%7067, %7068) : (i64, i64) -> i64
      %7070 = func.call @cc_values_pack(%7069) : (i64) -> i64
      func.call @stack_push_pointer(%7067) : (i64) -> ()
      %7071 = llvm.mlir.addressof @str553 : !llvm.ptr
      %7072 = arith.constant 1 : i64
      %7073 = func.call @cc_make_string(%7071, %7072) : (!llvm.ptr, i64) -> i64
      %7074 = func.call @cc_nil_value() : () -> i64
      %7075 = func.call @cc_intern(%7073, %7074) : (i64, i64) -> i64
      %7076 = func.call @cc_nil_value() : () -> i64
      %7077 = func.call @cc_cons(%7075, %7076) : (i64, i64) -> i64
      %7078 = func.call @cc_values_pack(%7077) : (i64) -> i64
      func.call @stack_push_pointer(%7075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7079 = func.call @stack_pop_pointer() : () -> i64
      %7080 = func.call @stack_pop_pointer() : () -> i64
      %7081 = func.call @cc_cons(%7080, %7079) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %7082 = arith.addi %7081, %__rlasp_stack_elide_zero_319 : i64
      %7083 = func.call @stack_pop_pointer() : () -> i64
      %7084 = func.call @cc_cons(%7083, %7082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7084) : (i64) -> ()
      %7085 = llvm.mlir.addressof @str554 : !llvm.ptr
      %7086 = arith.constant 12 : i64
      %7087 = func.call @cc_make_string(%7085, %7086) : (!llvm.ptr, i64) -> i64
      %7088 = llvm.mlir.addressof @str555 : !llvm.ptr
      %7089 = arith.constant 11 : i64
      %7090 = func.call @cc_make_string(%7088, %7089) : (!llvm.ptr, i64) -> i64
      %7091 = func.call @cc_intern(%7087, %7090) : (i64, i64) -> i64
      %7092 = func.call @cc_nil_value() : () -> i64
      %7093 = func.call @cc_cons(%7091, %7092) : (i64, i64) -> i64
      %7094 = func.call @cc_values_pack(%7093) : (i64) -> i64
      func.call @stack_push_pointer(%7091) : (i64) -> ()
      %7095 = llvm.mlir.addressof @str556 : !llvm.ptr
      %7096 = arith.constant 1 : i64
      %7097 = func.call @cc_make_string(%7095, %7096) : (!llvm.ptr, i64) -> i64
      %7098 = func.call @cc_nil_value() : () -> i64
      %7099 = func.call @cc_intern(%7097, %7098) : (i64, i64) -> i64
      %7100 = func.call @cc_nil_value() : () -> i64
      %7101 = func.call @cc_cons(%7099, %7100) : (i64, i64) -> i64
      %7102 = func.call @cc_values_pack(%7101) : (i64) -> i64
      func.call @stack_push_pointer(%7099) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7103 = func.call @stack_pop_pointer() : () -> i64
      %7104 = func.call @stack_pop_pointer() : () -> i64
      %7105 = func.call @cc_cons(%7104, %7103) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %7106 = arith.addi %7105, %__rlasp_stack_elide_zero_320 : i64
      %7107 = func.call @stack_pop_pointer() : () -> i64
      %7108 = func.call @cc_cons(%7107, %7106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7109 = func.call @stack_pop_pointer() : () -> i64
      %7110 = func.call @stack_pop_pointer() : () -> i64
      %7111 = func.call @cc_cons(%7110, %7109) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %7112 = arith.addi %7111, %__rlasp_stack_elide_zero_321 : i64
      %7113 = func.call @stack_pop_pointer() : () -> i64
      %7114 = func.call @cc_cons(%7113, %7112) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %7115 = arith.addi %7114, %__rlasp_stack_elide_zero_322 : i64
      %7116 = func.call @stack_pop_pointer() : () -> i64
      %7117 = func.call @cc_cons(%7116, %7115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7118 = func.call @stack_pop_pointer() : () -> i64
      %7119 = func.call @stack_pop_pointer() : () -> i64
      %7120 = func.call @cc_cons(%7119, %7118) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %7121 = arith.addi %7120, %__rlasp_stack_elide_zero_323 : i64
      %7122 = func.call @stack_pop_pointer() : () -> i64
      %7123 = func.call @cc_cons(%7122, %7121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %7124 = arith.addi %7123, %__rlasp_stack_elide_zero_324 : i64
      %7125 = func.call @stack_pop_pointer() : () -> i64
      %7126 = func.call @cc_cons(%7125, %7124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7126) : (i64) -> ()
      %7127 = llvm.mlir.addressof @str557 : !llvm.ptr
      %7128 = arith.constant 3 : i64
      %7129 = func.call @cc_make_string(%7127, %7128) : (!llvm.ptr, i64) -> i64
      %7130 = llvm.mlir.addressof @str558 : !llvm.ptr
      %7131 = arith.constant 11 : i64
      %7132 = func.call @cc_make_string(%7130, %7131) : (!llvm.ptr, i64) -> i64
      %7133 = func.call @cc_intern(%7129, %7132) : (i64, i64) -> i64
      %7134 = func.call @cc_nil_value() : () -> i64
      %7135 = func.call @cc_cons(%7133, %7134) : (i64, i64) -> i64
      %7136 = func.call @cc_values_pack(%7135) : (i64) -> i64
      func.call @stack_push_pointer(%7133) : (i64) -> ()
      %7137 = llvm.mlir.addressof @str559 : !llvm.ptr
      %7138 = arith.constant 2 : i64
      %7139 = func.call @cc_make_string(%7137, %7138) : (!llvm.ptr, i64) -> i64
      %7140 = llvm.mlir.addressof @str560 : !llvm.ptr
      %7141 = arith.constant 11 : i64
      %7142 = func.call @cc_make_string(%7140, %7141) : (!llvm.ptr, i64) -> i64
      %7143 = func.call @cc_intern(%7139, %7142) : (i64, i64) -> i64
      %7144 = func.call @cc_nil_value() : () -> i64
      %7145 = func.call @cc_cons(%7143, %7144) : (i64, i64) -> i64
      %7146 = func.call @cc_values_pack(%7145) : (i64) -> i64
      func.call @stack_push_pointer(%7143) : (i64) -> ()
      %7147 = llvm.mlir.addressof @str561 : !llvm.ptr
      %7148 = arith.constant 12 : i64
      %7149 = func.call @cc_make_string(%7147, %7148) : (!llvm.ptr, i64) -> i64
      %7150 = llvm.mlir.addressof @str562 : !llvm.ptr
      %7151 = arith.constant 11 : i64
      %7152 = func.call @cc_make_string(%7150, %7151) : (!llvm.ptr, i64) -> i64
      %7153 = func.call @cc_intern(%7149, %7152) : (i64, i64) -> i64
      %7154 = func.call @cc_nil_value() : () -> i64
      %7155 = func.call @cc_cons(%7153, %7154) : (i64, i64) -> i64
      %7156 = func.call @cc_values_pack(%7155) : (i64) -> i64
      func.call @stack_push_pointer(%7153) : (i64) -> ()
      %7157 = llvm.mlir.addressof @str563 : !llvm.ptr
      %7158 = arith.constant 1 : i64
      %7159 = func.call @cc_make_string(%7157, %7158) : (!llvm.ptr, i64) -> i64
      %7160 = func.call @cc_nil_value() : () -> i64
      %7161 = func.call @cc_intern(%7159, %7160) : (i64, i64) -> i64
      %7162 = func.call @cc_nil_value() : () -> i64
      %7163 = func.call @cc_cons(%7161, %7162) : (i64, i64) -> i64
      %7164 = func.call @cc_values_pack(%7163) : (i64) -> i64
      func.call @stack_push_pointer(%7161) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7165 = func.call @stack_pop_pointer() : () -> i64
      %7166 = func.call @stack_pop_pointer() : () -> i64
      %7167 = func.call @cc_cons(%7166, %7165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %7168 = arith.addi %7167, %__rlasp_stack_elide_zero_325 : i64
      %7169 = func.call @stack_pop_pointer() : () -> i64
      %7170 = func.call @cc_cons(%7169, %7168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7170) : (i64) -> ()
      %7171 = llvm.mlir.addressof @str564 : !llvm.ptr
      %7172 = arith.constant 12 : i64
      %7173 = func.call @cc_make_string(%7171, %7172) : (!llvm.ptr, i64) -> i64
      %7174 = llvm.mlir.addressof @str565 : !llvm.ptr
      %7175 = arith.constant 11 : i64
      %7176 = func.call @cc_make_string(%7174, %7175) : (!llvm.ptr, i64) -> i64
      %7177 = func.call @cc_intern(%7173, %7176) : (i64, i64) -> i64
      %7178 = func.call @cc_nil_value() : () -> i64
      %7179 = func.call @cc_cons(%7177, %7178) : (i64, i64) -> i64
      %7180 = func.call @cc_values_pack(%7179) : (i64) -> i64
      func.call @stack_push_pointer(%7177) : (i64) -> ()
      %7181 = llvm.mlir.addressof @str566 : !llvm.ptr
      %7182 = arith.constant 1 : i64
      %7183 = func.call @cc_make_string(%7181, %7182) : (!llvm.ptr, i64) -> i64
      %7184 = func.call @cc_nil_value() : () -> i64
      %7185 = func.call @cc_intern(%7183, %7184) : (i64, i64) -> i64
      %7186 = func.call @cc_nil_value() : () -> i64
      %7187 = func.call @cc_cons(%7185, %7186) : (i64, i64) -> i64
      %7188 = func.call @cc_values_pack(%7187) : (i64) -> i64
      func.call @stack_push_pointer(%7185) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7189 = func.call @stack_pop_pointer() : () -> i64
      %7190 = func.call @stack_pop_pointer() : () -> i64
      %7191 = func.call @cc_cons(%7190, %7189) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %7192 = arith.addi %7191, %__rlasp_stack_elide_zero_326 : i64
      %7193 = func.call @stack_pop_pointer() : () -> i64
      %7194 = func.call @cc_cons(%7193, %7192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7195 = func.call @stack_pop_pointer() : () -> i64
      %7196 = func.call @stack_pop_pointer() : () -> i64
      %7197 = func.call @cc_cons(%7196, %7195) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %7198 = arith.addi %7197, %__rlasp_stack_elide_zero_327 : i64
      %7199 = func.call @stack_pop_pointer() : () -> i64
      %7200 = func.call @cc_cons(%7199, %7198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %7201 = arith.addi %7200, %__rlasp_stack_elide_zero_328 : i64
      %7202 = func.call @stack_pop_pointer() : () -> i64
      %7203 = func.call @cc_cons(%7202, %7201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7204 = func.call @stack_pop_pointer() : () -> i64
      %7205 = func.call @stack_pop_pointer() : () -> i64
      %7206 = func.call @cc_cons(%7205, %7204) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %7207 = arith.addi %7206, %__rlasp_stack_elide_zero_329 : i64
      %7208 = func.call @stack_pop_pointer() : () -> i64
      %7209 = func.call @cc_cons(%7208, %7207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7210 = func.call @stack_pop_pointer() : () -> i64
      %7211 = func.call @stack_pop_pointer() : () -> i64
      %7212 = func.call @cc_cons(%7211, %7210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %7213 = arith.addi %7212, %__rlasp_stack_elide_zero_330 : i64
      %7214 = func.call @stack_pop_pointer() : () -> i64
      %7215 = func.call @cc_cons(%7214, %7213) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %7216 = arith.addi %7215, %__rlasp_stack_elide_zero_331 : i64
      %7217 = func.call @stack_pop_pointer() : () -> i64
      %7218 = func.call @cc_cons(%7217, %7216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %7219 = arith.addi %7218, %__rlasp_stack_elide_zero_332 : i64
      %7220 = func.call @stack_pop_pointer() : () -> i64
      %7221 = func.call @cc_cons(%7220, %7219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7221) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7222 = func.call @stack_pop_pointer() : () -> i64
      %7223 = func.call @stack_pop_pointer() : () -> i64
      %7224 = func.call @cc_cons(%7223, %7222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %7225 = arith.addi %7224, %__rlasp_stack_elide_zero_333 : i64
      %7226 = func.call @stack_pop_pointer() : () -> i64
      %7227 = func.call @cc_cons(%7226, %7225) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %7228 = arith.addi %7227, %__rlasp_stack_elide_zero_334 : i64
      %7229 = func.call @stack_pop_pointer() : () -> i64
      %7230 = func.call @cc_cons(%7229, %7228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7230) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7231 = func.call @stack_pop_pointer() : () -> i64
      %7232 = func.call @stack_pop_pointer() : () -> i64
      %7233 = func.call @cc_cons(%7232, %7231) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %7234 = arith.addi %7233, %__rlasp_stack_elide_zero_335 : i64
      %7235 = func.call @stack_pop_pointer() : () -> i64
      %7236 = func.call @cc_cons(%7235, %7234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7236) : (i64) -> ()
      %7237 = llvm.mlir.addressof @str567 : !llvm.ptr
      %7238 = arith.constant 5 : i64
      %7239 = func.call @cc_make_string(%7237, %7238) : (!llvm.ptr, i64) -> i64
      %7240 = func.call @cc_nil_value() : () -> i64
      %7241 = func.call @cc_intern(%7239, %7240) : (i64, i64) -> i64
      %7242 = func.call @cc_nil_value() : () -> i64
      %7243 = func.call @cc_cons(%7241, %7242) : (i64, i64) -> i64
      %7244 = func.call @cc_values_pack(%7243) : (i64) -> i64
      func.call @stack_push_pointer(%7241) : (i64) -> ()
      %7245 = llvm.mlir.addressof @str568 : !llvm.ptr
      %7246 = arith.constant 4 : i64
      %7247 = func.call @cc_make_string(%7245, %7246) : (!llvm.ptr, i64) -> i64
      %7248 = func.call @cc_nil_value() : () -> i64
      %7249 = func.call @cc_intern(%7247, %7248) : (i64, i64) -> i64
      %7250 = func.call @cc_nil_value() : () -> i64
      %7251 = func.call @cc_cons(%7249, %7250) : (i64, i64) -> i64
      %7252 = func.call @cc_values_pack(%7251) : (i64) -> i64
      func.call @stack_push_pointer(%7249) : (i64) -> ()
      %7253 = llvm.mlir.addressof @str569 : !llvm.ptr
      %7254 = arith.constant 15 : i64
      %7255 = func.call @cc_make_string(%7253, %7254) : (!llvm.ptr, i64) -> i64
      %7256 = func.call @cc_nil_value() : () -> i64
      %7257 = func.call @cc_intern(%7255, %7256) : (i64, i64) -> i64
      %7258 = func.call @cc_nil_value() : () -> i64
      %7259 = func.call @cc_cons(%7257, %7258) : (i64, i64) -> i64
      %7260 = func.call @cc_values_pack(%7259) : (i64) -> i64
      func.call @stack_push_pointer(%7257) : (i64) -> ()
      %7261 = llvm.mlir.addressof @str570 : !llvm.ptr
      %7262 = arith.constant 6 : i64
      %7263 = func.call @cc_make_string(%7261, %7262) : (!llvm.ptr, i64) -> i64
      %7264 = func.call @cc_nil_value() : () -> i64
      %7265 = func.call @cc_intern(%7263, %7264) : (i64, i64) -> i64
      %7266 = func.call @cc_nil_value() : () -> i64
      %7267 = func.call @cc_cons(%7265, %7266) : (i64, i64) -> i64
      %7268 = func.call @cc_values_pack(%7267) : (i64) -> i64
      func.call @stack_push_pointer(%7265) : (i64) -> ()
      %7269 = llvm.mlir.addressof @str571 : !llvm.ptr
      %7270 = arith.constant 15 : i64
      %7271 = func.call @cc_make_string(%7269, %7270) : (!llvm.ptr, i64) -> i64
      %7272 = func.call @cc_nil_value() : () -> i64
      %7273 = func.call @cc_intern(%7271, %7272) : (i64, i64) -> i64
      %7274 = func.call @cc_nil_value() : () -> i64
      %7275 = func.call @cc_cons(%7273, %7274) : (i64, i64) -> i64
      %7276 = func.call @cc_values_pack(%7275) : (i64) -> i64
      func.call @stack_push_pointer(%7273) : (i64) -> ()
      %7277 = llvm.mlir.addressof @str572 : !llvm.ptr
      %7278 = arith.constant 4 : i64
      %7279 = func.call @cc_make_string(%7277, %7278) : (!llvm.ptr, i64) -> i64
      %7280 = func.call @cc_nil_value() : () -> i64
      %7281 = func.call @cc_intern(%7279, %7280) : (i64, i64) -> i64
      %7282 = func.call @cc_nil_value() : () -> i64
      %7283 = func.call @cc_cons(%7281, %7282) : (i64, i64) -> i64
      %7284 = func.call @cc_values_pack(%7283) : (i64) -> i64
      func.call @stack_push_pointer(%7281) : (i64) -> ()
      %7285 = llvm.mlir.addressof @str573 : !llvm.ptr
      %7286 = arith.constant 9 : i64
      %7287 = func.call @cc_make_string(%7285, %7286) : (!llvm.ptr, i64) -> i64
      %7288 = llvm.mlir.addressof @str574 : !llvm.ptr
      %7289 = arith.constant 11 : i64
      %7290 = func.call @cc_make_string(%7288, %7289) : (!llvm.ptr, i64) -> i64
      %7291 = func.call @cc_intern(%7287, %7290) : (i64, i64) -> i64
      %7292 = func.call @cc_nil_value() : () -> i64
      %7293 = func.call @cc_cons(%7291, %7292) : (i64, i64) -> i64
      %7294 = func.call @cc_values_pack(%7293) : (i64) -> i64
      func.call @stack_push_pointer(%7291) : (i64) -> ()
      %7295 = llvm.mlir.addressof @str575 : !llvm.ptr
      %7296 = arith.constant 1 : i64
      %7297 = func.call @cc_make_string(%7295, %7296) : (!llvm.ptr, i64) -> i64
      %7298 = func.call @cc_nil_value() : () -> i64
      %7299 = func.call @cc_intern(%7297, %7298) : (i64, i64) -> i64
      %7300 = func.call @cc_nil_value() : () -> i64
      %7301 = func.call @cc_cons(%7299, %7300) : (i64, i64) -> i64
      %7302 = func.call @cc_values_pack(%7301) : (i64) -> i64
      func.call @stack_push_pointer(%7299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7303 = func.call @stack_pop_pointer() : () -> i64
      %7304 = func.call @stack_pop_pointer() : () -> i64
      %7305 = func.call @cc_cons(%7304, %7303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %7306 = arith.addi %7305, %__rlasp_stack_elide_zero_336 : i64
      %7307 = func.call @stack_pop_pointer() : () -> i64
      %7308 = func.call @cc_cons(%7307, %7306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7308) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7309 = func.call @stack_pop_pointer() : () -> i64
      %7310 = func.call @stack_pop_pointer() : () -> i64
      %7311 = func.call @cc_cons(%7310, %7309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %7312 = arith.addi %7311, %__rlasp_stack_elide_zero_337 : i64
      %7313 = func.call @stack_pop_pointer() : () -> i64
      %7314 = func.call @cc_cons(%7313, %7312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7315 = func.call @stack_pop_pointer() : () -> i64
      %7316 = func.call @stack_pop_pointer() : () -> i64
      %7317 = func.call @cc_cons(%7316, %7315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %7318 = arith.addi %7317, %__rlasp_stack_elide_zero_338 : i64
      %7319 = func.call @stack_pop_pointer() : () -> i64
      %7320 = func.call @cc_cons(%7319, %7318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %7321 = arith.addi %7320, %__rlasp_stack_elide_zero_339 : i64
      %7322 = func.call @stack_pop_pointer() : () -> i64
      %7323 = func.call @cc_cons(%7322, %7321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7323) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7324 = func.call @stack_pop_pointer() : () -> i64
      %7325 = func.call @stack_pop_pointer() : () -> i64
      %7326 = func.call @cc_cons(%7325, %7324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %7327 = arith.addi %7326, %__rlasp_stack_elide_zero_340 : i64
      %7328 = func.call @stack_pop_pointer() : () -> i64
      %7329 = func.call @cc_cons(%7328, %7327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %7330 = arith.addi %7329, %__rlasp_stack_elide_zero_341 : i64
      %7331 = func.call @stack_pop_pointer() : () -> i64
      %7332 = func.call @cc_cons(%7331, %7330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7333 = func.call @stack_pop_pointer() : () -> i64
      %7334 = func.call @stack_pop_pointer() : () -> i64
      %7335 = func.call @cc_cons(%7334, %7333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %7336 = arith.addi %7335, %__rlasp_stack_elide_zero_342 : i64
      %7337 = func.call @stack_pop_pointer() : () -> i64
      %7338 = func.call @cc_cons(%7337, %7336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7338) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7339 = func.call @stack_pop_pointer() : () -> i64
      %7340 = func.call @stack_pop_pointer() : () -> i64
      %7341 = func.call @cc_cons(%7340, %7339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %7342 = arith.addi %7341, %__rlasp_stack_elide_zero_343 : i64
      %7343 = func.call @stack_pop_pointer() : () -> i64
      %7344 = func.call @cc_cons(%7343, %7342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %7345 = arith.addi %7344, %__rlasp_stack_elide_zero_344 : i64
      %7346 = func.call @stack_pop_pointer() : () -> i64
      %7347 = func.call @cc_cons(%7346, %7345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %7348 = arith.addi %7347, %__rlasp_stack_elide_zero_345 : i64
      %7349 = func.call @stack_pop_pointer() : () -> i64
      %7350 = func.call @cc_cons(%7349, %7348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7350) : (i64) -> ()
      %7351 = llvm.mlir.addressof @str576 : !llvm.ptr
      %7352 = arith.constant 4 : i64
      %7353 = func.call @cc_make_string(%7351, %7352) : (!llvm.ptr, i64) -> i64
      %7354 = func.call @cc_nil_value() : () -> i64
      %7355 = func.call @cc_intern(%7353, %7354) : (i64, i64) -> i64
      %7356 = func.call @cc_nil_value() : () -> i64
      %7357 = func.call @cc_cons(%7355, %7356) : (i64, i64) -> i64
      %7358 = func.call @cc_values_pack(%7357) : (i64) -> i64
      func.call @stack_push_pointer(%7355) : (i64) -> ()
      %7359 = llvm.mlir.addressof @str577 : !llvm.ptr
      %7360 = arith.constant 1 : i64
      %7361 = func.call @cc_make_string(%7359, %7360) : (!llvm.ptr, i64) -> i64
      %7362 = func.call @cc_nil_value() : () -> i64
      %7363 = func.call @cc_intern(%7361, %7362) : (i64, i64) -> i64
      %7364 = func.call @cc_nil_value() : () -> i64
      %7365 = func.call @cc_cons(%7363, %7364) : (i64, i64) -> i64
      %7366 = func.call @cc_values_pack(%7365) : (i64) -> i64
      func.call @stack_push_pointer(%7363) : (i64) -> ()
      %7367 = llvm.mlir.addressof @str578 : !llvm.ptr
      %7368 = arith.constant 1 : i64
      %7369 = func.call @cc_make_string(%7367, %7368) : (!llvm.ptr, i64) -> i64
      %7370 = func.call @cc_nil_value() : () -> i64
      %7371 = func.call @cc_intern(%7369, %7370) : (i64, i64) -> i64
      %7372 = func.call @cc_nil_value() : () -> i64
      %7373 = func.call @cc_cons(%7371, %7372) : (i64, i64) -> i64
      %7374 = func.call @cc_values_pack(%7373) : (i64) -> i64
      func.call @stack_push_pointer(%7371) : (i64) -> ()
      %7375 = llvm.mlir.addressof @str579 : !llvm.ptr
      %7376 = arith.constant 1 : i64
      %7377 = func.call @cc_make_string(%7375, %7376) : (!llvm.ptr, i64) -> i64
      %7378 = func.call @cc_nil_value() : () -> i64
      %7379 = func.call @cc_intern(%7377, %7378) : (i64, i64) -> i64
      %7380 = func.call @cc_nil_value() : () -> i64
      %7381 = func.call @cc_cons(%7379, %7380) : (i64, i64) -> i64
      %7382 = func.call @cc_values_pack(%7381) : (i64) -> i64
      func.call @stack_push_pointer(%7379) : (i64) -> ()
      %7383 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%7383) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7384 = func.call @stack_pop_pointer() : () -> i64
      %7385 = func.call @stack_pop_pointer() : () -> i64
      %7386 = func.call @cc_cons(%7385, %7384) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %7387 = arith.addi %7386, %__rlasp_stack_elide_zero_346 : i64
      %7388 = func.call @stack_pop_pointer() : () -> i64
      %7389 = func.call @cc_cons(%7388, %7387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %7390 = arith.addi %7389, %__rlasp_stack_elide_zero_347 : i64
      %7391 = func.call @stack_pop_pointer() : () -> i64
      %7392 = func.call @cc_cons(%7391, %7390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7392) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7393 = func.call @stack_pop_pointer() : () -> i64
      %7394 = func.call @stack_pop_pointer() : () -> i64
      %7395 = func.call @cc_cons(%7394, %7393) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %7396 = arith.addi %7395, %__rlasp_stack_elide_zero_348 : i64
      %7397 = func.call @stack_pop_pointer() : () -> i64
      %7398 = func.call @cc_cons(%7397, %7396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %7399 = arith.addi %7398, %__rlasp_stack_elide_zero_349 : i64
      %7400 = func.call @stack_pop_pointer() : () -> i64
      %7401 = func.call @cc_cons(%7400, %7399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7402 = func.call @stack_pop_pointer() : () -> i64
      %7403 = func.call @stack_pop_pointer() : () -> i64
      %7404 = func.call @cc_cons(%7403, %7402) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %7405 = arith.addi %7404, %__rlasp_stack_elide_zero_350 : i64
      %7406 = func.call @stack_pop_pointer() : () -> i64
      %7407 = func.call @cc_cons(%7406, %7405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %7408 = arith.addi %7407, %__rlasp_stack_elide_zero_351 : i64
      %7409 = func.call @stack_pop_pointer() : () -> i64
      %7410 = func.call @cc_cons(%7409, %7408) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %7411 = arith.addi %7410, %__rlasp_stack_elide_zero_352 : i64
      %7412 = func.call @stack_pop_pointer() : () -> i64
      %7413 = func.call @cc_cons(%7412, %7411) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %7414 = arith.addi %7413, %__rlasp_stack_elide_zero_353 : i64
      %7415 = func.call @stack_pop_pointer() : () -> i64
      %7416 = func.call @cc_cons(%7415, %7414) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %7417 = arith.addi %7416, %__rlasp_stack_elide_zero_354 : i64
      %7418 = func.call @stack_pop_pointer() : () -> i64
      %7419 = func.call @cc_cons(%7418, %7417) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %7420 = arith.addi %7419, %__rlasp_stack_elide_zero_355 : i64
      %7421 = func.call @stack_pop_pointer() : () -> i64
      %7422 = func.call @cc_cons(%7421, %7420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7422) : (i64) -> ()
      %7423 = llvm.mlir.addressof @str580 : !llvm.ptr
      %7424 = arith.constant 2 : i64
      %7425 = func.call @cc_make_string(%7423, %7424) : (!llvm.ptr, i64) -> i64
      %7426 = func.call @cc_nil_value() : () -> i64
      %7427 = func.call @cc_intern(%7425, %7426) : (i64, i64) -> i64
      %7428 = func.call @cc_nil_value() : () -> i64
      %7429 = func.call @cc_cons(%7427, %7428) : (i64, i64) -> i64
      %7430 = func.call @cc_values_pack(%7429) : (i64) -> i64
      func.call @stack_push_pointer(%7427) : (i64) -> ()
      %7431 = llvm.mlir.addressof @str581 : !llvm.ptr
      %7432 = arith.constant 17 : i64
      %7433 = func.call @cc_make_string(%7431, %7432) : (!llvm.ptr, i64) -> i64
      %7434 = func.call @cc_nil_value() : () -> i64
      %7435 = func.call @cc_intern(%7433, %7434) : (i64, i64) -> i64
      %7436 = func.call @cc_nil_value() : () -> i64
      %7437 = func.call @cc_cons(%7435, %7436) : (i64, i64) -> i64
      %7438 = func.call @cc_values_pack(%7437) : (i64) -> i64
      func.call @stack_push_pointer(%7435) : (i64) -> ()
      %7439 = llvm.mlir.addressof @str582 : !llvm.ptr
      %7440 = arith.constant 5 : i64
      %7441 = func.call @cc_make_string(%7439, %7440) : (!llvm.ptr, i64) -> i64
      %7442 = func.call @cc_nil_value() : () -> i64
      %7443 = func.call @cc_intern(%7441, %7442) : (i64, i64) -> i64
      %7444 = func.call @cc_nil_value() : () -> i64
      %7445 = func.call @cc_cons(%7443, %7444) : (i64, i64) -> i64
      %7446 = func.call @cc_values_pack(%7445) : (i64) -> i64
      func.call @stack_push_pointer(%7443) : (i64) -> ()
      %7447 = llvm.mlir.addressof @str583 : !llvm.ptr
      %7448 = arith.constant 4 : i64
      %7449 = func.call @cc_make_string(%7447, %7448) : (!llvm.ptr, i64) -> i64
      %7450 = func.call @cc_nil_value() : () -> i64
      %7451 = func.call @cc_intern(%7449, %7450) : (i64, i64) -> i64
      %7452 = func.call @cc_nil_value() : () -> i64
      %7453 = func.call @cc_cons(%7451, %7452) : (i64, i64) -> i64
      %7454 = func.call @cc_values_pack(%7453) : (i64) -> i64
      func.call @stack_push_pointer(%7451) : (i64) -> ()
      %7455 = llvm.mlir.addressof @str584 : !llvm.ptr
      %7456 = arith.constant 1 : i64
      %7457 = func.call @cc_make_string(%7455, %7456) : (!llvm.ptr, i64) -> i64
      %7458 = func.call @cc_nil_value() : () -> i64
      %7459 = func.call @cc_intern(%7457, %7458) : (i64, i64) -> i64
      %7460 = func.call @cc_nil_value() : () -> i64
      %7461 = func.call @cc_cons(%7459, %7460) : (i64, i64) -> i64
      %7462 = func.call @cc_values_pack(%7461) : (i64) -> i64
      func.call @stack_push_pointer(%7459) : (i64) -> ()
      %7463 = llvm.mlir.addressof @str585 : !llvm.ptr
      %7464 = arith.constant 19 : i64
      %7465 = func.call @cc_make_string(%7463, %7464) : (!llvm.ptr, i64) -> i64
      %7466 = func.call @cc_nil_value() : () -> i64
      %7467 = func.call @cc_intern(%7465, %7466) : (i64, i64) -> i64
      %7468 = func.call @cc_nil_value() : () -> i64
      %7469 = func.call @cc_cons(%7467, %7468) : (i64, i64) -> i64
      %7470 = func.call @cc_values_pack(%7469) : (i64) -> i64
      func.call @stack_push_pointer(%7467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7471 = func.call @stack_pop_pointer() : () -> i64
      %7472 = func.call @stack_pop_pointer() : () -> i64
      %7473 = func.call @cc_cons(%7472, %7471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %7474 = arith.addi %7473, %__rlasp_stack_elide_zero_356 : i64
      %7475 = func.call @stack_pop_pointer() : () -> i64
      %7476 = func.call @cc_cons(%7475, %7474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %7477 = arith.addi %7476, %__rlasp_stack_elide_zero_357 : i64
      %7478 = func.call @stack_pop_pointer() : () -> i64
      %7479 = func.call @cc_cons(%7478, %7477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7479) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7480 = func.call @stack_pop_pointer() : () -> i64
      %7481 = func.call @stack_pop_pointer() : () -> i64
      %7482 = func.call @cc_cons(%7481, %7480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %7483 = arith.addi %7482, %__rlasp_stack_elide_zero_358 : i64
      %7484 = func.call @stack_pop_pointer() : () -> i64
      %7485 = func.call @cc_cons(%7484, %7483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7486 = func.call @stack_pop_pointer() : () -> i64
      %7487 = func.call @stack_pop_pointer() : () -> i64
      %7488 = func.call @cc_cons(%7487, %7486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %7489 = arith.addi %7488, %__rlasp_stack_elide_zero_359 : i64
      %7490 = func.call @stack_pop_pointer() : () -> i64
      %7491 = func.call @cc_cons(%7490, %7489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %7492 = arith.addi %7491, %__rlasp_stack_elide_zero_360 : i64
      %7493 = func.call @stack_pop_pointer() : () -> i64
      %7494 = func.call @cc_cons(%7493, %7492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %7495 = arith.addi %7494, %__rlasp_stack_elide_zero_361 : i64
      %7496 = func.call @stack_pop_pointer() : () -> i64
      %7497 = func.call @cc_cons(%7496, %7495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7497) : (i64) -> ()
      %7498 = llvm.mlir.addressof @str586 : !llvm.ptr
      %7499 = arith.constant 15 : i64
      %7500 = func.call @cc_make_string(%7498, %7499) : (!llvm.ptr, i64) -> i64
      %7501 = func.call @cc_nil_value() : () -> i64
      %7502 = func.call @cc_intern(%7500, %7501) : (i64, i64) -> i64
      %7503 = func.call @cc_nil_value() : () -> i64
      %7504 = func.call @cc_cons(%7502, %7503) : (i64, i64) -> i64
      %7505 = func.call @cc_values_pack(%7504) : (i64) -> i64
      func.call @stack_push_pointer(%7502) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7506 = func.call @stack_pop_pointer() : () -> i64
      %7507 = func.call @stack_pop_pointer() : () -> i64
      %7508 = func.call @cc_cons(%7507, %7506) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %7509 = arith.addi %7508, %__rlasp_stack_elide_zero_362 : i64
      %7510 = func.call @stack_pop_pointer() : () -> i64
      %7511 = func.call @cc_cons(%7510, %7509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %7512 = arith.addi %7511, %__rlasp_stack_elide_zero_363 : i64
      %7513 = func.call @stack_pop_pointer() : () -> i64
      %7514 = func.call @cc_cons(%7513, %7512) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %7515 = arith.addi %7514, %__rlasp_stack_elide_zero_364 : i64
      %7516 = func.call @stack_pop_pointer() : () -> i64
      %7517 = func.call @cc_cons(%7516, %7515) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %7518 = arith.addi %7517, %__rlasp_stack_elide_zero_365 : i64
      %7519 = func.call @stack_pop_pointer() : () -> i64
      %7520 = func.call @cc_cons(%7519, %7518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7521 = func.call @stack_pop_pointer() : () -> i64
      %7522 = func.call @stack_pop_pointer() : () -> i64
      %7523 = func.call @cc_cons(%7522, %7521) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %7524 = arith.addi %7523, %__rlasp_stack_elide_zero_366 : i64
      %7525 = func.call @stack_pop_pointer() : () -> i64
      %7526 = func.call @cc_cons(%7525, %7524) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %7527 = arith.addi %7526, %__rlasp_stack_elide_zero_367 : i64
      %7528 = func.call @stack_pop_pointer() : () -> i64
      %7529 = func.call @cc_cons(%7528, %7527) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %7530 = arith.addi %7529, %__rlasp_stack_elide_zero_368 : i64
      %7895 = arith.constant 209815645192222 : i64
      %7896 = arith.constant 0 : i64
      %7897 = func.call @cc_make_closure(%7895, %7896) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %7898 = arith.addi %7897, %__rlasp_stack_elide_zero_369 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7899 = func.call @stack_pop_pointer() : () -> i64
      %7900 = func.call @stack_pop_pointer() : () -> i64
      %7901 = func.call @cc_cons(%7900, %7899) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %7902 = arith.addi %7901, %__rlasp_stack_elide_zero_370 : i64
      %7903 = llvm.mlir.addressof @str604 : !llvm.ptr
      %7904 = arith.constant 11 : i64
      %7905 = func.call @cc_make_string(%7903, %7904) : (!llvm.ptr, i64) -> i64
      %7906 = llvm.mlir.addressof @str605 : !llvm.ptr
      %7907 = arith.constant 7 : i64
      %7908 = func.call @cc_make_string(%7906, %7907) : (!llvm.ptr, i64) -> i64
      %7909 = func.call @cc_intern(%7905, %7908) : (i64, i64) -> i64
      %7910 = func.call @cc_nil_value() : () -> i64
      %7911 = func.call @cc_cons(%7909, %7910) : (i64, i64) -> i64
      %7912 = func.call @cc_values_pack(%7911) : (i64) -> i64
      %7913 = func.call @cc_nil_value() : () -> i64
      %7914 = llvm.mlir.addressof @str606 : !llvm.ptr
      %7915 = arith.constant 4 : i64
      %7916 = func.call @cc_make_string(%7914, %7915) : (!llvm.ptr, i64) -> i64
      %7917 = llvm.mlir.addressof @str607 : !llvm.ptr
      %7918 = arith.constant 7 : i64
      %7919 = func.call @cc_make_string(%7917, %7918) : (!llvm.ptr, i64) -> i64
      %7920 = func.call @cc_intern(%7916, %7919) : (i64, i64) -> i64
      %7921 = func.call @cc_nil_value() : () -> i64
      %7922 = func.call @cc_cons(%7920, %7921) : (i64, i64) -> i64
      %7923 = func.call @cc_values_pack(%7922) : (i64) -> i64
      %7924 = llvm.mlir.addressof @str608 : !llvm.ptr
      %7925 = arith.constant 6 : i64
      %7926 = func.call @cc_make_string(%7924, %7925) : (!llvm.ptr, i64) -> i64
      %7927 = func.call @cc_nil_value() : () -> i64
      %7928 = func.call @cc_intern(%7926, %7927) : (i64, i64) -> i64
      %7929 = func.call @cc_nil_value() : () -> i64
      %7930 = func.call @cc_cons(%7928, %7929) : (i64, i64) -> i64
      %7931 = func.call @cc_values_pack(%7930) : (i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %7932 = arith.addi %7928, %__rlasp_stack_elide_zero_371 : i64
      %7933 = func.call @cc_nil_value() : () -> i64
      %7934 = func.call @cc_errorp(%6643) : (i64) -> i64
      %7935 = arith.cmpi ne, %7934, %7933 : i64
      %7936 = arith.cmpi eq, %7933, %7933 : i64
      %7937 = arith.andi %7935, %7936 : i1
      %7938 = scf.if %7937 -> (i64) {
        scf.yield %6643 : i64
      } else {
        scf.yield %7933 : i64
      }
      %7939 = func.call @cc_errorp(%7530) : (i64) -> i64
      %7940 = arith.cmpi ne, %7939, %7933 : i64
      %7941 = arith.cmpi eq, %7938, %7933 : i64
      %7942 = arith.andi %7940, %7941 : i1
      %7943 = scf.if %7942 -> (i64) {
        scf.yield %7530 : i64
      } else {
        scf.yield %7938 : i64
      }
      %7944 = func.call @cc_errorp(%7898) : (i64) -> i64
      %7945 = arith.cmpi ne, %7944, %7933 : i64
      %7946 = arith.cmpi eq, %7943, %7933 : i64
      %7947 = arith.andi %7945, %7946 : i1
      %7948 = scf.if %7947 -> (i64) {
        scf.yield %7898 : i64
      } else {
        scf.yield %7943 : i64
      }
      %7949 = func.call @cc_errorp(%7902) : (i64) -> i64
      %7950 = arith.cmpi ne, %7949, %7933 : i64
      %7951 = arith.cmpi eq, %7948, %7933 : i64
      %7952 = arith.andi %7950, %7951 : i1
      %7953 = scf.if %7952 -> (i64) {
        scf.yield %7902 : i64
      } else {
        scf.yield %7948 : i64
      }
      %7954 = func.call @cc_errorp(%7909) : (i64) -> i64
      %7955 = arith.cmpi ne, %7954, %7933 : i64
      %7956 = arith.cmpi eq, %7953, %7933 : i64
      %7957 = arith.andi %7955, %7956 : i1
      %7958 = scf.if %7957 -> (i64) {
        scf.yield %7909 : i64
      } else {
        scf.yield %7953 : i64
      }
      %7959 = func.call @cc_errorp(%7913) : (i64) -> i64
      %7960 = arith.cmpi ne, %7959, %7933 : i64
      %7961 = arith.cmpi eq, %7958, %7933 : i64
      %7962 = arith.andi %7960, %7961 : i1
      %7963 = scf.if %7962 -> (i64) {
        scf.yield %7913 : i64
      } else {
        scf.yield %7958 : i64
      }
      %7964 = func.call @cc_errorp(%7920) : (i64) -> i64
      %7965 = arith.cmpi ne, %7964, %7933 : i64
      %7966 = arith.cmpi eq, %7963, %7933 : i64
      %7967 = arith.andi %7965, %7966 : i1
      %7968 = scf.if %7967 -> (i64) {
        scf.yield %7920 : i64
      } else {
        scf.yield %7963 : i64
      }
      %7969 = func.call @cc_errorp(%7932) : (i64) -> i64
      %7970 = arith.cmpi ne, %7969, %7933 : i64
      %7971 = arith.cmpi eq, %7968, %7933 : i64
      %7972 = arith.andi %7970, %7971 : i1
      %7973 = scf.if %7972 -> (i64) {
        scf.yield %7932 : i64
      } else {
        scf.yield %7968 : i64
      }
      %7974 = arith.cmpi ne, %7973, %7933 : i64
      scf.if %7974 {
        func.call @stack_push_pointer(%7973) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6643) : (i64) -> ()
        func.call @stack_push_pointer(%7530) : (i64) -> ()
        func.call @stack_push_pointer(%7898) : (i64) -> ()
        func.call @stack_push_pointer(%7902) : (i64) -> ()
        func.call @stack_push_pointer(%7909) : (i64) -> ()
        func.call @stack_push_pointer(%7913) : (i64) -> ()
        func.call @stack_push_pointer(%7920) : (i64) -> ()
        func.call @stack_push_pointer(%7932) : (i64) -> ()
        %7975 = llvm.mlir.addressof @str609 : !llvm.ptr
        %7976 = func.call @cc_make_function_ref_const(%7975) : (!llvm.ptr) -> i64
        %7977 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7976, %7977) : (i64, i64) -> ()
      }
      %7978 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7978 : i64
    }
    %7979 = func.call @cc_nil_value() : () -> i64
    %7980 = func.call @cc_errorp(%6634) : (i64) -> i64
    %7981 = arith.cmpi ne, %7980, %7979 : i64
    %7982 = scf.if %7981 -> (i64) {
      scf.yield %6634 : i64
    } else {
      %7983 = llvm.mlir.addressof @str610 : !llvm.ptr
      %7984 = arith.constant 12 : i64
      %7985 = func.call @cc_make_string(%7983, %7984) : (!llvm.ptr, i64) -> i64
      %7986 = func.call @cc_nil_value() : () -> i64
      %7987 = func.call @cc_intern(%7985, %7986) : (i64, i64) -> i64
      %7988 = func.call @cc_nil_value() : () -> i64
      %7989 = func.call @cc_cons(%7987, %7988) : (i64, i64) -> i64
      %7990 = func.call @cc_values_pack(%7989) : (i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %7991 = arith.addi %7987, %__rlasp_stack_elide_zero_372 : i64
      %7992 = llvm.mlir.addressof @str611 : !llvm.ptr
      %7993 = arith.constant 3 : i64
      %7994 = func.call @cc_make_string(%7992, %7993) : (!llvm.ptr, i64) -> i64
      %7995 = func.call @cc_nil_value() : () -> i64
      %7996 = func.call @cc_intern(%7994, %7995) : (i64, i64) -> i64
      %7997 = func.call @cc_nil_value() : () -> i64
      %7998 = func.call @cc_cons(%7996, %7997) : (i64, i64) -> i64
      %7999 = func.call @cc_values_pack(%7998) : (i64) -> i64
      func.call @stack_push_pointer(%7996) : (i64) -> ()
      %8000 = llvm.mlir.addressof @str612 : !llvm.ptr
      %8001 = arith.constant 5 : i64
      %8002 = func.call @cc_make_string(%8000, %8001) : (!llvm.ptr, i64) -> i64
      %8003 = func.call @cc_nil_value() : () -> i64
      %8004 = func.call @cc_intern(%8002, %8003) : (i64, i64) -> i64
      %8005 = func.call @cc_nil_value() : () -> i64
      %8006 = func.call @cc_cons(%8004, %8005) : (i64, i64) -> i64
      %8007 = func.call @cc_values_pack(%8006) : (i64) -> i64
      func.call @stack_push_pointer(%8004) : (i64) -> ()
      %8008 = llvm.mlir.addressof @str613 : !llvm.ptr
      %8009 = arith.constant 6 : i64
      %8010 = func.call @cc_make_string(%8008, %8009) : (!llvm.ptr, i64) -> i64
      %8011 = llvm.mlir.addressof @str614 : !llvm.ptr
      %8012 = arith.constant 11 : i64
      %8013 = func.call @cc_make_string(%8011, %8012) : (!llvm.ptr, i64) -> i64
      %8014 = func.call @cc_intern(%8010, %8013) : (i64, i64) -> i64
      %8015 = func.call @cc_nil_value() : () -> i64
      %8016 = func.call @cc_cons(%8014, %8015) : (i64, i64) -> i64
      %8017 = func.call @cc_values_pack(%8016) : (i64) -> i64
      func.call @stack_push_pointer(%8014) : (i64) -> ()
      %8018 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8018) : (i64) -> ()
      %8019 = llvm.mlir.addressof @str615 : !llvm.ptr
      %8020 = arith.constant 7 : i64
      %8021 = func.call @cc_make_string(%8019, %8020) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8021) : (i64) -> ()
      %8022 = llvm.mlir.addressof @str616 : !llvm.ptr
      %8023 = arith.constant 5 : i64
      %8024 = func.call @cc_make_string(%8022, %8023) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8024) : (i64) -> ()
      %8025 = llvm.mlir.addressof @str617 : !llvm.ptr
      %8026 = arith.constant 6 : i64
      %8027 = func.call @cc_make_string(%8025, %8026) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8027) : (i64) -> ()
      %8028 = llvm.mlir.addressof @str618 : !llvm.ptr
      %8029 = arith.constant 4 : i64
      %8030 = func.call @cc_make_string(%8028, %8029) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8030) : (i64) -> ()
      %8031 = llvm.mlir.addressof @str619 : !llvm.ptr
      %8032 = arith.constant 3 : i64
      %8033 = func.call @cc_make_string(%8031, %8032) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8033) : (i64) -> ()
      %8034 = llvm.mlir.addressof @str620 : !llvm.ptr
      %8035 = arith.constant 9 : i64
      %8036 = func.call @cc_make_string(%8034, %8035) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8036) : (i64) -> ()
      %8037 = llvm.mlir.addressof @str621 : !llvm.ptr
      %8038 = arith.constant 6 : i64
      %8039 = func.call @cc_make_string(%8037, %8038) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8039) : (i64) -> ()
      %8040 = llvm.mlir.addressof @str622 : !llvm.ptr
      %8041 = arith.constant 8 : i64
      %8042 = func.call @cc_make_string(%8040, %8041) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8042) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8043 = func.call @stack_pop_pointer() : () -> i64
      %8044 = func.call @stack_pop_pointer() : () -> i64
      %8045 = func.call @cc_cons(%8044, %8043) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %8046 = arith.addi %8045, %__rlasp_stack_elide_zero_373 : i64
      %8047 = func.call @stack_pop_pointer() : () -> i64
      %8048 = func.call @cc_cons(%8047, %8046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %8049 = arith.addi %8048, %__rlasp_stack_elide_zero_374 : i64
      %8050 = func.call @stack_pop_pointer() : () -> i64
      %8051 = func.call @cc_cons(%8050, %8049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %8052 = arith.addi %8051, %__rlasp_stack_elide_zero_375 : i64
      %8053 = func.call @stack_pop_pointer() : () -> i64
      %8054 = func.call @cc_cons(%8053, %8052) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %8055 = arith.addi %8054, %__rlasp_stack_elide_zero_376 : i64
      %8056 = func.call @stack_pop_pointer() : () -> i64
      %8057 = func.call @cc_cons(%8056, %8055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %8058 = arith.addi %8057, %__rlasp_stack_elide_zero_377 : i64
      %8059 = func.call @stack_pop_pointer() : () -> i64
      %8060 = func.call @cc_cons(%8059, %8058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %8061 = arith.addi %8060, %__rlasp_stack_elide_zero_378 : i64
      %8062 = func.call @stack_pop_pointer() : () -> i64
      %8063 = func.call @cc_cons(%8062, %8061) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %8064 = arith.addi %8063, %__rlasp_stack_elide_zero_379 : i64
      %8065 = func.call @stack_pop_pointer() : () -> i64
      %8066 = func.call @cc_cons(%8065, %8064) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %8067 = arith.addi %8066, %__rlasp_stack_elide_zero_380 : i64
      %8068 = func.call @stack_pop_pointer() : () -> i64
      %8069 = func.call @cc_cons(%8067, %8068) : (i64, i64) -> i64
      %8070 = llvm.mlir.addressof @str623 : !llvm.ptr
      %8071 = arith.constant 5 : i64
      %8072 = func.call @cc_make_string(%8070, %8071) : (!llvm.ptr, i64) -> i64
      %8073 = func.call @cc_nil_value() : () -> i64
      %8074 = func.call @cc_intern(%8072, %8073) : (i64, i64) -> i64
      %8075 = func.call @cc_nil_value() : () -> i64
      %8076 = func.call @cc_cons(%8074, %8075) : (i64, i64) -> i64
      %8077 = func.call @cc_values_pack(%8076) : (i64) -> i64
      %8078 = func.call @cc_cons(%8074, %8069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8078) : (i64) -> ()
      %8079 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8079) : (i64) -> ()
      %8080 = llvm.mlir.addressof @str624 : !llvm.ptr
      %8081 = arith.constant 4 : i64
      %8082 = func.call @cc_make_string(%8080, %8081) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8082) : (i64) -> ()
      %8083 = llvm.mlir.addressof @str625 : !llvm.ptr
      %8084 = arith.constant 3 : i64
      %8085 = func.call @cc_make_string(%8083, %8084) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8085) : (i64) -> ()
      %8086 = llvm.mlir.addressof @str626 : !llvm.ptr
      %8087 = arith.constant 4 : i64
      %8088 = func.call @cc_make_string(%8086, %8087) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8088) : (i64) -> ()
      %8089 = llvm.mlir.addressof @str627 : !llvm.ptr
      %8090 = arith.constant 16 : i64
      %8091 = func.call @cc_make_string(%8089, %8090) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8091) : (i64) -> ()
      %8092 = llvm.mlir.addressof @str628 : !llvm.ptr
      %8093 = arith.constant 14 : i64
      %8094 = func.call @cc_make_string(%8092, %8093) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8094) : (i64) -> ()
      %8095 = llvm.mlir.addressof @str629 : !llvm.ptr
      %8096 = arith.constant 9 : i64
      %8097 = func.call @cc_make_string(%8095, %8096) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8097) : (i64) -> ()
      %8098 = llvm.mlir.addressof @str630 : !llvm.ptr
      %8099 = arith.constant 5 : i64
      %8100 = func.call @cc_make_string(%8098, %8099) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8100) : (i64) -> ()
      %8101 = llvm.mlir.addressof @str631 : !llvm.ptr
      %8102 = arith.constant 10 : i64
      %8103 = func.call @cc_make_string(%8101, %8102) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8103) : (i64) -> ()
      %8104 = llvm.mlir.addressof @str632 : !llvm.ptr
      %8105 = arith.constant 5 : i64
      %8106 = func.call @cc_make_string(%8104, %8105) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8106) : (i64) -> ()
      %8107 = llvm.mlir.addressof @str633 : !llvm.ptr
      %8108 = arith.constant 13 : i64
      %8109 = func.call @cc_make_string(%8107, %8108) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8109) : (i64) -> ()
      %8110 = llvm.mlir.addressof @str634 : !llvm.ptr
      %8111 = arith.constant 22 : i64
      %8112 = func.call @cc_make_string(%8110, %8111) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8112) : (i64) -> ()
      %8113 = llvm.mlir.addressof @str635 : !llvm.ptr
      %8114 = arith.constant 20 : i64
      %8115 = func.call @cc_make_string(%8113, %8114) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8115) : (i64) -> ()
      %8116 = llvm.mlir.addressof @str636 : !llvm.ptr
      %8117 = arith.constant 18 : i64
      %8118 = func.call @cc_make_string(%8116, %8117) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8118) : (i64) -> ()
      %8119 = llvm.mlir.addressof @str637 : !llvm.ptr
      %8120 = arith.constant 5 : i64
      %8121 = func.call @cc_make_string(%8119, %8120) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8121) : (i64) -> ()
      %8122 = llvm.mlir.addressof @str638 : !llvm.ptr
      %8123 = arith.constant 3 : i64
      %8124 = func.call @cc_make_string(%8122, %8123) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8124) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8125 = func.call @stack_pop_pointer() : () -> i64
      %8126 = func.call @stack_pop_pointer() : () -> i64
      %8127 = func.call @cc_cons(%8126, %8125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
      %8128 = arith.addi %8127, %__rlasp_stack_elide_zero_381 : i64
      %8129 = func.call @stack_pop_pointer() : () -> i64
      %8130 = func.call @cc_cons(%8129, %8128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
      %8131 = arith.addi %8130, %__rlasp_stack_elide_zero_382 : i64
      %8132 = func.call @stack_pop_pointer() : () -> i64
      %8133 = func.call @cc_cons(%8132, %8131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
      %8134 = arith.addi %8133, %__rlasp_stack_elide_zero_383 : i64
      %8135 = func.call @stack_pop_pointer() : () -> i64
      %8136 = func.call @cc_cons(%8135, %8134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
      %8137 = arith.addi %8136, %__rlasp_stack_elide_zero_384 : i64
      %8138 = func.call @stack_pop_pointer() : () -> i64
      %8139 = func.call @cc_cons(%8138, %8137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
      %8140 = arith.addi %8139, %__rlasp_stack_elide_zero_385 : i64
      %8141 = func.call @stack_pop_pointer() : () -> i64
      %8142 = func.call @cc_cons(%8141, %8140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
      %8143 = arith.addi %8142, %__rlasp_stack_elide_zero_386 : i64
      %8144 = func.call @stack_pop_pointer() : () -> i64
      %8145 = func.call @cc_cons(%8144, %8143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
      %8146 = arith.addi %8145, %__rlasp_stack_elide_zero_387 : i64
      %8147 = func.call @stack_pop_pointer() : () -> i64
      %8148 = func.call @cc_cons(%8147, %8146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %8149 = arith.addi %8148, %__rlasp_stack_elide_zero_388 : i64
      %8150 = func.call @stack_pop_pointer() : () -> i64
      %8151 = func.call @cc_cons(%8150, %8149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
      %8152 = arith.addi %8151, %__rlasp_stack_elide_zero_389 : i64
      %8153 = func.call @stack_pop_pointer() : () -> i64
      %8154 = func.call @cc_cons(%8153, %8152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
      %8155 = arith.addi %8154, %__rlasp_stack_elide_zero_390 : i64
      %8156 = func.call @stack_pop_pointer() : () -> i64
      %8157 = func.call @cc_cons(%8156, %8155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
      %8158 = arith.addi %8157, %__rlasp_stack_elide_zero_391 : i64
      %8159 = func.call @stack_pop_pointer() : () -> i64
      %8160 = func.call @cc_cons(%8159, %8158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
      %8161 = arith.addi %8160, %__rlasp_stack_elide_zero_392 : i64
      %8162 = func.call @stack_pop_pointer() : () -> i64
      %8163 = func.call @cc_cons(%8162, %8161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
      %8164 = arith.addi %8163, %__rlasp_stack_elide_zero_393 : i64
      %8165 = func.call @stack_pop_pointer() : () -> i64
      %8166 = func.call @cc_cons(%8165, %8164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
      %8167 = arith.addi %8166, %__rlasp_stack_elide_zero_394 : i64
      %8168 = func.call @stack_pop_pointer() : () -> i64
      %8169 = func.call @cc_cons(%8168, %8167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %8170 = arith.addi %8169, %__rlasp_stack_elide_zero_395 : i64
      %8171 = func.call @stack_pop_pointer() : () -> i64
      %8172 = func.call @cc_cons(%8170, %8171) : (i64, i64) -> i64
      %8173 = llvm.mlir.addressof @str639 : !llvm.ptr
      %8174 = arith.constant 5 : i64
      %8175 = func.call @cc_make_string(%8173, %8174) : (!llvm.ptr, i64) -> i64
      %8176 = func.call @cc_nil_value() : () -> i64
      %8177 = func.call @cc_intern(%8175, %8176) : (i64, i64) -> i64
      %8178 = func.call @cc_nil_value() : () -> i64
      %8179 = func.call @cc_cons(%8177, %8178) : (i64, i64) -> i64
      %8180 = func.call @cc_values_pack(%8179) : (i64) -> i64
      %8181 = func.call @cc_cons(%8177, %8172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8181) : (i64) -> ()
      %8182 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8182) : (i64) -> ()
      %8183 = llvm.mlir.addressof @str640 : !llvm.ptr
      %8184 = arith.constant 3 : i64
      %8185 = func.call @cc_make_string(%8183, %8184) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8185) : (i64) -> ()
      %8186 = llvm.mlir.addressof @str641 : !llvm.ptr
      %8187 = arith.constant 3 : i64
      %8188 = func.call @cc_make_string(%8186, %8187) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8188) : (i64) -> ()
      %8189 = llvm.mlir.addressof @str642 : !llvm.ptr
      %8190 = arith.constant 3 : i64
      %8191 = func.call @cc_make_string(%8189, %8190) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8191) : (i64) -> ()
      %8192 = llvm.mlir.addressof @str643 : !llvm.ptr
      %8193 = arith.constant 3 : i64
      %8194 = func.call @cc_make_string(%8192, %8193) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8194) : (i64) -> ()
      %8195 = llvm.mlir.addressof @str644 : !llvm.ptr
      %8196 = arith.constant 3 : i64
      %8197 = func.call @cc_make_string(%8195, %8196) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8197) : (i64) -> ()
      %8198 = llvm.mlir.addressof @str645 : !llvm.ptr
      %8199 = arith.constant 3 : i64
      %8200 = func.call @cc_make_string(%8198, %8199) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8200) : (i64) -> ()
      %8201 = llvm.mlir.addressof @str646 : !llvm.ptr
      %8202 = arith.constant 3 : i64
      %8203 = func.call @cc_make_string(%8201, %8202) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8203) : (i64) -> ()
      %8204 = llvm.mlir.addressof @str647 : !llvm.ptr
      %8205 = arith.constant 3 : i64
      %8206 = func.call @cc_make_string(%8204, %8205) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8206) : (i64) -> ()
      %8207 = llvm.mlir.addressof @str648 : !llvm.ptr
      %8208 = arith.constant 3 : i64
      %8209 = func.call @cc_make_string(%8207, %8208) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8209) : (i64) -> ()
      %8210 = llvm.mlir.addressof @str649 : !llvm.ptr
      %8211 = arith.constant 3 : i64
      %8212 = func.call @cc_make_string(%8210, %8211) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8212) : (i64) -> ()
      %8213 = llvm.mlir.addressof @str650 : !llvm.ptr
      %8214 = arith.constant 3 : i64
      %8215 = func.call @cc_make_string(%8213, %8214) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8215) : (i64) -> ()
      %8216 = llvm.mlir.addressof @str651 : !llvm.ptr
      %8217 = arith.constant 3 : i64
      %8218 = func.call @cc_make_string(%8216, %8217) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8218) : (i64) -> ()
      %8219 = llvm.mlir.addressof @str652 : !llvm.ptr
      %8220 = arith.constant 3 : i64
      %8221 = func.call @cc_make_string(%8219, %8220) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8221) : (i64) -> ()
      %8222 = llvm.mlir.addressof @str653 : !llvm.ptr
      %8223 = arith.constant 3 : i64
      %8224 = func.call @cc_make_string(%8222, %8223) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8224) : (i64) -> ()
      %8225 = llvm.mlir.addressof @str654 : !llvm.ptr
      %8226 = arith.constant 3 : i64
      %8227 = func.call @cc_make_string(%8225, %8226) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8227) : (i64) -> ()
      %8228 = llvm.mlir.addressof @str655 : !llvm.ptr
      %8229 = arith.constant 3 : i64
      %8230 = func.call @cc_make_string(%8228, %8229) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8230) : (i64) -> ()
      %8231 = llvm.mlir.addressof @str656 : !llvm.ptr
      %8232 = arith.constant 3 : i64
      %8233 = func.call @cc_make_string(%8231, %8232) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8233) : (i64) -> ()
      %8234 = llvm.mlir.addressof @str657 : !llvm.ptr
      %8235 = arith.constant 3 : i64
      %8236 = func.call @cc_make_string(%8234, %8235) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8236) : (i64) -> ()
      %8237 = llvm.mlir.addressof @str658 : !llvm.ptr
      %8238 = arith.constant 3 : i64
      %8239 = func.call @cc_make_string(%8237, %8238) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8239) : (i64) -> ()
      %8240 = llvm.mlir.addressof @str659 : !llvm.ptr
      %8241 = arith.constant 3 : i64
      %8242 = func.call @cc_make_string(%8240, %8241) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8242) : (i64) -> ()
      %8243 = llvm.mlir.addressof @str660 : !llvm.ptr
      %8244 = arith.constant 3 : i64
      %8245 = func.call @cc_make_string(%8243, %8244) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8245) : (i64) -> ()
      %8246 = llvm.mlir.addressof @str661 : !llvm.ptr
      %8247 = arith.constant 3 : i64
      %8248 = func.call @cc_make_string(%8246, %8247) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8248) : (i64) -> ()
      %8249 = llvm.mlir.addressof @str662 : !llvm.ptr
      %8250 = arith.constant 3 : i64
      %8251 = func.call @cc_make_string(%8249, %8250) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8251) : (i64) -> ()
      %8252 = llvm.mlir.addressof @str663 : !llvm.ptr
      %8253 = arith.constant 3 : i64
      %8254 = func.call @cc_make_string(%8252, %8253) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8254) : (i64) -> ()
      %8255 = llvm.mlir.addressof @str664 : !llvm.ptr
      %8256 = arith.constant 3 : i64
      %8257 = func.call @cc_make_string(%8255, %8256) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8257) : (i64) -> ()
      %8258 = llvm.mlir.addressof @str665 : !llvm.ptr
      %8259 = arith.constant 3 : i64
      %8260 = func.call @cc_make_string(%8258, %8259) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8260) : (i64) -> ()
      %8261 = llvm.mlir.addressof @str666 : !llvm.ptr
      %8262 = arith.constant 3 : i64
      %8263 = func.call @cc_make_string(%8261, %8262) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8263) : (i64) -> ()
      %8264 = llvm.mlir.addressof @str667 : !llvm.ptr
      %8265 = arith.constant 3 : i64
      %8266 = func.call @cc_make_string(%8264, %8265) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8266) : (i64) -> ()
      %8267 = llvm.mlir.addressof @str668 : !llvm.ptr
      %8268 = arith.constant 3 : i64
      %8269 = func.call @cc_make_string(%8267, %8268) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8269) : (i64) -> ()
      %8270 = llvm.mlir.addressof @str669 : !llvm.ptr
      %8271 = arith.constant 3 : i64
      %8272 = func.call @cc_make_string(%8270, %8271) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8272) : (i64) -> ()
      %8273 = llvm.mlir.addressof @str670 : !llvm.ptr
      %8274 = arith.constant 3 : i64
      %8275 = func.call @cc_make_string(%8273, %8274) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8275) : (i64) -> ()
      %8276 = llvm.mlir.addressof @str671 : !llvm.ptr
      %8277 = arith.constant 3 : i64
      %8278 = func.call @cc_make_string(%8276, %8277) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8279 = func.call @stack_pop_pointer() : () -> i64
      %8280 = func.call @stack_pop_pointer() : () -> i64
      %8281 = func.call @cc_cons(%8280, %8279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
      %8282 = arith.addi %8281, %__rlasp_stack_elide_zero_396 : i64
      %8283 = func.call @stack_pop_pointer() : () -> i64
      %8284 = func.call @cc_cons(%8283, %8282) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
      %8285 = arith.addi %8284, %__rlasp_stack_elide_zero_397 : i64
      %8286 = func.call @stack_pop_pointer() : () -> i64
      %8287 = func.call @cc_cons(%8286, %8285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
      %8288 = arith.addi %8287, %__rlasp_stack_elide_zero_398 : i64
      %8289 = func.call @stack_pop_pointer() : () -> i64
      %8290 = func.call @cc_cons(%8289, %8288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
      %8291 = arith.addi %8290, %__rlasp_stack_elide_zero_399 : i64
      %8292 = func.call @stack_pop_pointer() : () -> i64
      %8293 = func.call @cc_cons(%8292, %8291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
      %8294 = arith.addi %8293, %__rlasp_stack_elide_zero_400 : i64
      %8295 = func.call @stack_pop_pointer() : () -> i64
      %8296 = func.call @cc_cons(%8295, %8294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
      %8297 = arith.addi %8296, %__rlasp_stack_elide_zero_401 : i64
      %8298 = func.call @stack_pop_pointer() : () -> i64
      %8299 = func.call @cc_cons(%8298, %8297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
      %8300 = arith.addi %8299, %__rlasp_stack_elide_zero_402 : i64
      %8301 = func.call @stack_pop_pointer() : () -> i64
      %8302 = func.call @cc_cons(%8301, %8300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
      %8303 = arith.addi %8302, %__rlasp_stack_elide_zero_403 : i64
      %8304 = func.call @stack_pop_pointer() : () -> i64
      %8305 = func.call @cc_cons(%8304, %8303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
      %8306 = arith.addi %8305, %__rlasp_stack_elide_zero_404 : i64
      %8307 = func.call @stack_pop_pointer() : () -> i64
      %8308 = func.call @cc_cons(%8307, %8306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
      %8309 = arith.addi %8308, %__rlasp_stack_elide_zero_405 : i64
      %8310 = func.call @stack_pop_pointer() : () -> i64
      %8311 = func.call @cc_cons(%8310, %8309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
      %8312 = arith.addi %8311, %__rlasp_stack_elide_zero_406 : i64
      %8313 = func.call @stack_pop_pointer() : () -> i64
      %8314 = func.call @cc_cons(%8313, %8312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
      %8315 = arith.addi %8314, %__rlasp_stack_elide_zero_407 : i64
      %8316 = func.call @stack_pop_pointer() : () -> i64
      %8317 = func.call @cc_cons(%8316, %8315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
      %8318 = arith.addi %8317, %__rlasp_stack_elide_zero_408 : i64
      %8319 = func.call @stack_pop_pointer() : () -> i64
      %8320 = func.call @cc_cons(%8319, %8318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
      %8321 = arith.addi %8320, %__rlasp_stack_elide_zero_409 : i64
      %8322 = func.call @stack_pop_pointer() : () -> i64
      %8323 = func.call @cc_cons(%8322, %8321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
      %8324 = arith.addi %8323, %__rlasp_stack_elide_zero_410 : i64
      %8325 = func.call @stack_pop_pointer() : () -> i64
      %8326 = func.call @cc_cons(%8325, %8324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
      %8327 = arith.addi %8326, %__rlasp_stack_elide_zero_411 : i64
      %8328 = func.call @stack_pop_pointer() : () -> i64
      %8329 = func.call @cc_cons(%8328, %8327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
      %8330 = arith.addi %8329, %__rlasp_stack_elide_zero_412 : i64
      %8331 = func.call @stack_pop_pointer() : () -> i64
      %8332 = func.call @cc_cons(%8331, %8330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
      %8333 = arith.addi %8332, %__rlasp_stack_elide_zero_413 : i64
      %8334 = func.call @stack_pop_pointer() : () -> i64
      %8335 = func.call @cc_cons(%8334, %8333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
      %8336 = arith.addi %8335, %__rlasp_stack_elide_zero_414 : i64
      %8337 = func.call @stack_pop_pointer() : () -> i64
      %8338 = func.call @cc_cons(%8337, %8336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
      %8339 = arith.addi %8338, %__rlasp_stack_elide_zero_415 : i64
      %8340 = func.call @stack_pop_pointer() : () -> i64
      %8341 = func.call @cc_cons(%8340, %8339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
      %8342 = arith.addi %8341, %__rlasp_stack_elide_zero_416 : i64
      %8343 = func.call @stack_pop_pointer() : () -> i64
      %8344 = func.call @cc_cons(%8343, %8342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
      %8345 = arith.addi %8344, %__rlasp_stack_elide_zero_417 : i64
      %8346 = func.call @stack_pop_pointer() : () -> i64
      %8347 = func.call @cc_cons(%8346, %8345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %8348 = arith.addi %8347, %__rlasp_stack_elide_zero_418 : i64
      %8349 = func.call @stack_pop_pointer() : () -> i64
      %8350 = func.call @cc_cons(%8349, %8348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
      %8351 = arith.addi %8350, %__rlasp_stack_elide_zero_419 : i64
      %8352 = func.call @stack_pop_pointer() : () -> i64
      %8353 = func.call @cc_cons(%8352, %8351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
      %8354 = arith.addi %8353, %__rlasp_stack_elide_zero_420 : i64
      %8355 = func.call @stack_pop_pointer() : () -> i64
      %8356 = func.call @cc_cons(%8355, %8354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
      %8357 = arith.addi %8356, %__rlasp_stack_elide_zero_421 : i64
      %8358 = func.call @stack_pop_pointer() : () -> i64
      %8359 = func.call @cc_cons(%8358, %8357) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %8360 = arith.addi %8359, %__rlasp_stack_elide_zero_422 : i64
      %8361 = func.call @stack_pop_pointer() : () -> i64
      %8362 = func.call @cc_cons(%8361, %8360) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %8363 = arith.addi %8362, %__rlasp_stack_elide_zero_423 : i64
      %8364 = func.call @stack_pop_pointer() : () -> i64
      %8365 = func.call @cc_cons(%8364, %8363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %8366 = arith.addi %8365, %__rlasp_stack_elide_zero_424 : i64
      %8367 = func.call @stack_pop_pointer() : () -> i64
      %8368 = func.call @cc_cons(%8367, %8366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
      %8369 = arith.addi %8368, %__rlasp_stack_elide_zero_425 : i64
      %8370 = func.call @stack_pop_pointer() : () -> i64
      %8371 = func.call @cc_cons(%8370, %8369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
      %8372 = arith.addi %8371, %__rlasp_stack_elide_zero_426 : i64
      %8373 = func.call @stack_pop_pointer() : () -> i64
      %8374 = func.call @cc_cons(%8373, %8372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
      %8375 = arith.addi %8374, %__rlasp_stack_elide_zero_427 : i64
      %8376 = func.call @stack_pop_pointer() : () -> i64
      %8377 = func.call @cc_cons(%8375, %8376) : (i64, i64) -> i64
      %8378 = llvm.mlir.addressof @str672 : !llvm.ptr
      %8379 = arith.constant 5 : i64
      %8380 = func.call @cc_make_string(%8378, %8379) : (!llvm.ptr, i64) -> i64
      %8381 = func.call @cc_nil_value() : () -> i64
      %8382 = func.call @cc_intern(%8380, %8381) : (i64, i64) -> i64
      %8383 = func.call @cc_nil_value() : () -> i64
      %8384 = func.call @cc_cons(%8382, %8383) : (i64, i64) -> i64
      %8385 = func.call @cc_values_pack(%8384) : (i64) -> i64
      %8386 = func.call @cc_cons(%8382, %8377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8387 = func.call @stack_pop_pointer() : () -> i64
      %8388 = func.call @stack_pop_pointer() : () -> i64
      %8389 = func.call @cc_cons(%8388, %8387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
      %8390 = arith.addi %8389, %__rlasp_stack_elide_zero_428 : i64
      %8391 = func.call @stack_pop_pointer() : () -> i64
      %8392 = func.call @cc_cons(%8391, %8390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
      %8393 = arith.addi %8392, %__rlasp_stack_elide_zero_429 : i64
      %8394 = func.call @stack_pop_pointer() : () -> i64
      %8395 = func.call @cc_cons(%8394, %8393) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
      %8396 = arith.addi %8395, %__rlasp_stack_elide_zero_430 : i64
      %8397 = func.call @stack_pop_pointer() : () -> i64
      %8398 = func.call @cc_cons(%8397, %8396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8398) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8399 = func.call @stack_pop_pointer() : () -> i64
      %8400 = func.call @stack_pop_pointer() : () -> i64
      %8401 = func.call @cc_cons(%8400, %8399) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
      %8402 = arith.addi %8401, %__rlasp_stack_elide_zero_431 : i64
      %8403 = func.call @stack_pop_pointer() : () -> i64
      %8404 = func.call @cc_cons(%8403, %8402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8404) : (i64) -> ()
      %8405 = llvm.mlir.addressof @str673 : !llvm.ptr
      %8406 = arith.constant 6 : i64
      %8407 = func.call @cc_make_string(%8405, %8406) : (!llvm.ptr, i64) -> i64
      %8408 = func.call @cc_nil_value() : () -> i64
      %8409 = func.call @cc_intern(%8407, %8408) : (i64, i64) -> i64
      %8410 = func.call @cc_nil_value() : () -> i64
      %8411 = func.call @cc_cons(%8409, %8410) : (i64, i64) -> i64
      %8412 = func.call @cc_values_pack(%8411) : (i64) -> i64
      func.call @stack_push_pointer(%8409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8413 = func.call @stack_pop_pointer() : () -> i64
      %8414 = func.call @stack_pop_pointer() : () -> i64
      %8415 = func.call @cc_cons(%8414, %8413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
      %8416 = arith.addi %8415, %__rlasp_stack_elide_zero_432 : i64
      %8417 = func.call @stack_pop_pointer() : () -> i64
      %8418 = func.call @cc_cons(%8417, %8416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8419 = func.call @stack_pop_pointer() : () -> i64
      %8420 = func.call @stack_pop_pointer() : () -> i64
      %8421 = func.call @cc_cons(%8420, %8419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
      %8422 = arith.addi %8421, %__rlasp_stack_elide_zero_433 : i64
      %8423 = func.call @stack_pop_pointer() : () -> i64
      %8424 = func.call @cc_cons(%8423, %8422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8424) : (i64) -> ()
      %8425 = llvm.mlir.addressof @str674 : !llvm.ptr
      %8426 = arith.constant 6 : i64
      %8427 = func.call @cc_make_string(%8425, %8426) : (!llvm.ptr, i64) -> i64
      %8428 = func.call @cc_nil_value() : () -> i64
      %8429 = func.call @cc_intern(%8427, %8428) : (i64, i64) -> i64
      %8430 = func.call @cc_nil_value() : () -> i64
      %8431 = func.call @cc_cons(%8429, %8430) : (i64, i64) -> i64
      %8432 = func.call @cc_values_pack(%8431) : (i64) -> i64
      func.call @stack_push_pointer(%8429) : (i64) -> ()
      %8433 = llvm.mlir.addressof @str675 : !llvm.ptr
      %8434 = arith.constant 4 : i64
      %8435 = func.call @cc_make_string(%8433, %8434) : (!llvm.ptr, i64) -> i64
      %8436 = func.call @cc_nil_value() : () -> i64
      %8437 = func.call @cc_intern(%8435, %8436) : (i64, i64) -> i64
      %8438 = func.call @cc_nil_value() : () -> i64
      %8439 = func.call @cc_cons(%8437, %8438) : (i64, i64) -> i64
      %8440 = func.call @cc_values_pack(%8439) : (i64) -> i64
      func.call @stack_push_pointer(%8437) : (i64) -> ()
      %8441 = llvm.mlir.addressof @str676 : !llvm.ptr
      %8442 = arith.constant 5 : i64
      %8443 = func.call @cc_make_string(%8441, %8442) : (!llvm.ptr, i64) -> i64
      %8444 = func.call @cc_nil_value() : () -> i64
      %8445 = func.call @cc_intern(%8443, %8444) : (i64, i64) -> i64
      %8446 = func.call @cc_nil_value() : () -> i64
      %8447 = func.call @cc_cons(%8445, %8446) : (i64, i64) -> i64
      %8448 = func.call @cc_values_pack(%8447) : (i64) -> i64
      func.call @stack_push_pointer(%8445) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8449 = func.call @stack_pop_pointer() : () -> i64
      %8450 = func.call @stack_pop_pointer() : () -> i64
      %8451 = func.call @cc_cons(%8450, %8449) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
      %8452 = arith.addi %8451, %__rlasp_stack_elide_zero_434 : i64
      %8453 = func.call @stack_pop_pointer() : () -> i64
      %8454 = func.call @cc_cons(%8453, %8452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8454) : (i64) -> ()
      %8455 = llvm.mlir.addressof @str677 : !llvm.ptr
      %8456 = arith.constant 2 : i64
      %8457 = func.call @cc_make_string(%8455, %8456) : (!llvm.ptr, i64) -> i64
      %8458 = func.call @cc_nil_value() : () -> i64
      %8459 = func.call @cc_intern(%8457, %8458) : (i64, i64) -> i64
      %8460 = func.call @cc_nil_value() : () -> i64
      %8461 = func.call @cc_cons(%8459, %8460) : (i64, i64) -> i64
      %8462 = func.call @cc_values_pack(%8461) : (i64) -> i64
      func.call @stack_push_pointer(%8459) : (i64) -> ()
      %8463 = llvm.mlir.addressof @str678 : !llvm.ptr
      %8464 = arith.constant 3 : i64
      %8465 = func.call @cc_make_string(%8463, %8464) : (!llvm.ptr, i64) -> i64
      %8466 = func.call @cc_nil_value() : () -> i64
      %8467 = func.call @cc_intern(%8465, %8466) : (i64, i64) -> i64
      %8468 = func.call @cc_nil_value() : () -> i64
      %8469 = func.call @cc_cons(%8467, %8468) : (i64, i64) -> i64
      %8470 = func.call @cc_values_pack(%8469) : (i64) -> i64
      func.call @stack_push_pointer(%8467) : (i64) -> ()
      %8471 = llvm.mlir.addressof @str679 : !llvm.ptr
      %8472 = arith.constant 9 : i64
      %8473 = func.call @cc_make_string(%8471, %8472) : (!llvm.ptr, i64) -> i64
      %8474 = llvm.mlir.addressof @str680 : !llvm.ptr
      %8475 = arith.constant 11 : i64
      %8476 = func.call @cc_make_string(%8474, %8475) : (!llvm.ptr, i64) -> i64
      %8477 = func.call @cc_intern(%8473, %8476) : (i64, i64) -> i64
      %8478 = func.call @cc_nil_value() : () -> i64
      %8479 = func.call @cc_cons(%8477, %8478) : (i64, i64) -> i64
      %8480 = func.call @cc_values_pack(%8479) : (i64) -> i64
      func.call @stack_push_pointer(%8477) : (i64) -> ()
      %8481 = llvm.mlir.addressof @str681 : !llvm.ptr
      %8482 = arith.constant 4 : i64
      %8483 = func.call @cc_make_string(%8481, %8482) : (!llvm.ptr, i64) -> i64
      %8484 = func.call @cc_nil_value() : () -> i64
      %8485 = func.call @cc_intern(%8483, %8484) : (i64, i64) -> i64
      %8486 = func.call @cc_nil_value() : () -> i64
      %8487 = func.call @cc_cons(%8485, %8486) : (i64, i64) -> i64
      %8488 = func.call @cc_values_pack(%8487) : (i64) -> i64
      func.call @stack_push_pointer(%8485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8489 = func.call @stack_pop_pointer() : () -> i64
      %8490 = func.call @stack_pop_pointer() : () -> i64
      %8491 = func.call @cc_cons(%8490, %8489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
      %8492 = arith.addi %8491, %__rlasp_stack_elide_zero_435 : i64
      %8493 = func.call @stack_pop_pointer() : () -> i64
      %8494 = func.call @cc_cons(%8493, %8492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8494) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8495 = func.call @stack_pop_pointer() : () -> i64
      %8496 = func.call @stack_pop_pointer() : () -> i64
      %8497 = func.call @cc_cons(%8496, %8495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %8498 = arith.addi %8497, %__rlasp_stack_elide_zero_436 : i64
      %8499 = func.call @stack_pop_pointer() : () -> i64
      %8500 = func.call @cc_cons(%8499, %8498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8500) : (i64) -> ()
      %8501 = llvm.mlir.addressof @str682 : !llvm.ptr
      %8502 = arith.constant 5 : i64
      %8503 = func.call @cc_make_string(%8501, %8502) : (!llvm.ptr, i64) -> i64
      %8504 = func.call @cc_nil_value() : () -> i64
      %8505 = func.call @cc_intern(%8503, %8504) : (i64, i64) -> i64
      %8506 = func.call @cc_nil_value() : () -> i64
      %8507 = func.call @cc_cons(%8505, %8506) : (i64, i64) -> i64
      %8508 = func.call @cc_values_pack(%8507) : (i64) -> i64
      func.call @stack_push_pointer(%8505) : (i64) -> ()
      %8509 = llvm.mlir.addressof @str683 : !llvm.ptr
      %8510 = arith.constant 4 : i64
      %8511 = func.call @cc_make_string(%8509, %8510) : (!llvm.ptr, i64) -> i64
      %8512 = llvm.mlir.addressof @str684 : !llvm.ptr
      %8513 = arith.constant 11 : i64
      %8514 = func.call @cc_make_string(%8512, %8513) : (!llvm.ptr, i64) -> i64
      %8515 = func.call @cc_intern(%8511, %8514) : (i64, i64) -> i64
      %8516 = func.call @cc_nil_value() : () -> i64
      %8517 = func.call @cc_cons(%8515, %8516) : (i64, i64) -> i64
      %8518 = func.call @cc_values_pack(%8517) : (i64) -> i64
      func.call @stack_push_pointer(%8515) : (i64) -> ()
      %8519 = llvm.mlir.addressof @str685 : !llvm.ptr
      %8520 = arith.constant 4 : i64
      %8521 = func.call @cc_make_string(%8519, %8520) : (!llvm.ptr, i64) -> i64
      %8522 = func.call @cc_nil_value() : () -> i64
      %8523 = func.call @cc_intern(%8521, %8522) : (i64, i64) -> i64
      %8524 = func.call @cc_nil_value() : () -> i64
      %8525 = func.call @cc_cons(%8523, %8524) : (i64, i64) -> i64
      %8526 = func.call @cc_values_pack(%8525) : (i64) -> i64
      func.call @stack_push_pointer(%8523) : (i64) -> ()
      %8527 = llvm.mlir.addressof @str686 : !llvm.ptr
      %8528 = arith.constant 6 : i64
      %8529 = func.call @cc_make_string(%8527, %8528) : (!llvm.ptr, i64) -> i64
      %8530 = func.call @cc_nil_value() : () -> i64
      %8531 = func.call @cc_intern(%8529, %8530) : (i64, i64) -> i64
      %8532 = func.call @cc_nil_value() : () -> i64
      %8533 = func.call @cc_cons(%8531, %8532) : (i64, i64) -> i64
      %8534 = func.call @cc_values_pack(%8533) : (i64) -> i64
      func.call @stack_push_pointer(%8531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8535 = func.call @stack_pop_pointer() : () -> i64
      %8536 = func.call @stack_pop_pointer() : () -> i64
      %8537 = func.call @cc_cons(%8536, %8535) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %8538 = arith.addi %8537, %__rlasp_stack_elide_zero_437 : i64
      %8539 = func.call @stack_pop_pointer() : () -> i64
      %8540 = func.call @cc_cons(%8539, %8538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %8541 = arith.addi %8540, %__rlasp_stack_elide_zero_438 : i64
      %8542 = func.call @stack_pop_pointer() : () -> i64
      %8543 = func.call @cc_cons(%8542, %8541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8544 = func.call @stack_pop_pointer() : () -> i64
      %8545 = func.call @stack_pop_pointer() : () -> i64
      %8546 = func.call @cc_cons(%8545, %8544) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %8547 = arith.addi %8546, %__rlasp_stack_elide_zero_439 : i64
      %8548 = func.call @stack_pop_pointer() : () -> i64
      %8549 = func.call @cc_cons(%8548, %8547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8550 = func.call @stack_pop_pointer() : () -> i64
      %8551 = func.call @stack_pop_pointer() : () -> i64
      %8552 = func.call @cc_cons(%8551, %8550) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %8553 = arith.addi %8552, %__rlasp_stack_elide_zero_440 : i64
      %8554 = func.call @stack_pop_pointer() : () -> i64
      %8555 = func.call @cc_cons(%8554, %8553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %8556 = arith.addi %8555, %__rlasp_stack_elide_zero_441 : i64
      %8557 = func.call @stack_pop_pointer() : () -> i64
      %8558 = func.call @cc_cons(%8557, %8556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %8559 = arith.addi %8558, %__rlasp_stack_elide_zero_442 : i64
      %8560 = func.call @stack_pop_pointer() : () -> i64
      %8561 = func.call @cc_cons(%8560, %8559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8562 = func.call @stack_pop_pointer() : () -> i64
      %8563 = func.call @stack_pop_pointer() : () -> i64
      %8564 = func.call @cc_cons(%8563, %8562) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %8565 = arith.addi %8564, %__rlasp_stack_elide_zero_443 : i64
      %8566 = func.call @stack_pop_pointer() : () -> i64
      %8567 = func.call @cc_cons(%8566, %8565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %8568 = arith.addi %8567, %__rlasp_stack_elide_zero_444 : i64
      %8569 = func.call @stack_pop_pointer() : () -> i64
      %8570 = func.call @cc_cons(%8569, %8568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8570) : (i64) -> ()
      %8571 = llvm.mlir.addressof @str687 : !llvm.ptr
      %8572 = arith.constant 6 : i64
      %8573 = func.call @cc_make_string(%8571, %8572) : (!llvm.ptr, i64) -> i64
      %8574 = func.call @cc_nil_value() : () -> i64
      %8575 = func.call @cc_intern(%8573, %8574) : (i64, i64) -> i64
      %8576 = func.call @cc_nil_value() : () -> i64
      %8577 = func.call @cc_cons(%8575, %8576) : (i64, i64) -> i64
      %8578 = func.call @cc_values_pack(%8577) : (i64) -> i64
      func.call @stack_push_pointer(%8575) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8579 = func.call @stack_pop_pointer() : () -> i64
      %8580 = func.call @stack_pop_pointer() : () -> i64
      %8581 = func.call @cc_cons(%8580, %8579) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %8582 = arith.addi %8581, %__rlasp_stack_elide_zero_445 : i64
      %8583 = func.call @stack_pop_pointer() : () -> i64
      %8584 = func.call @cc_cons(%8583, %8582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %8585 = arith.addi %8584, %__rlasp_stack_elide_zero_446 : i64
      %8586 = func.call @stack_pop_pointer() : () -> i64
      %8587 = func.call @cc_cons(%8586, %8585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %8588 = arith.addi %8587, %__rlasp_stack_elide_zero_447 : i64
      %8589 = func.call @stack_pop_pointer() : () -> i64
      %8590 = func.call @cc_cons(%8589, %8588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %8591 = arith.addi %8590, %__rlasp_stack_elide_zero_448 : i64
      %8980 = arith.constant 209815645192224 : i64
      %8981 = arith.constant 0 : i64
      %8982 = func.call @cc_make_closure(%8980, %8981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %8983 = arith.addi %8982, %__rlasp_stack_elide_zero_449 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8984 = func.call @stack_pop_pointer() : () -> i64
      %8985 = func.call @stack_pop_pointer() : () -> i64
      %8986 = func.call @cc_cons(%8985, %8984) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %8987 = arith.addi %8986, %__rlasp_stack_elide_zero_450 : i64
      %8988 = llvm.mlir.addressof @str743 : !llvm.ptr
      %8989 = arith.constant 11 : i64
      %8990 = func.call @cc_make_string(%8988, %8989) : (!llvm.ptr, i64) -> i64
      %8991 = llvm.mlir.addressof @str744 : !llvm.ptr
      %8992 = arith.constant 7 : i64
      %8993 = func.call @cc_make_string(%8991, %8992) : (!llvm.ptr, i64) -> i64
      %8994 = func.call @cc_intern(%8990, %8993) : (i64, i64) -> i64
      %8995 = func.call @cc_nil_value() : () -> i64
      %8996 = func.call @cc_cons(%8994, %8995) : (i64, i64) -> i64
      %8997 = func.call @cc_values_pack(%8996) : (i64) -> i64
      %8998 = func.call @cc_nil_value() : () -> i64
      %8999 = llvm.mlir.addressof @str745 : !llvm.ptr
      %9000 = arith.constant 4 : i64
      %9001 = func.call @cc_make_string(%8999, %9000) : (!llvm.ptr, i64) -> i64
      %9002 = llvm.mlir.addressof @str746 : !llvm.ptr
      %9003 = arith.constant 7 : i64
      %9004 = func.call @cc_make_string(%9002, %9003) : (!llvm.ptr, i64) -> i64
      %9005 = func.call @cc_intern(%9001, %9004) : (i64, i64) -> i64
      %9006 = func.call @cc_nil_value() : () -> i64
      %9007 = func.call @cc_cons(%9005, %9006) : (i64, i64) -> i64
      %9008 = func.call @cc_values_pack(%9007) : (i64) -> i64
      %9009 = llvm.mlir.addressof @str747 : !llvm.ptr
      %9010 = arith.constant 6 : i64
      %9011 = func.call @cc_make_string(%9009, %9010) : (!llvm.ptr, i64) -> i64
      %9012 = func.call @cc_nil_value() : () -> i64
      %9013 = func.call @cc_intern(%9011, %9012) : (i64, i64) -> i64
      %9014 = func.call @cc_nil_value() : () -> i64
      %9015 = func.call @cc_cons(%9013, %9014) : (i64, i64) -> i64
      %9016 = func.call @cc_values_pack(%9015) : (i64) -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %9017 = arith.addi %9013, %__rlasp_stack_elide_zero_451 : i64
      %9018 = func.call @cc_nil_value() : () -> i64
      %9019 = func.call @cc_errorp(%7991) : (i64) -> i64
      %9020 = arith.cmpi ne, %9019, %9018 : i64
      %9021 = arith.cmpi eq, %9018, %9018 : i64
      %9022 = arith.andi %9020, %9021 : i1
      %9023 = scf.if %9022 -> (i64) {
        scf.yield %7991 : i64
      } else {
        scf.yield %9018 : i64
      }
      %9024 = func.call @cc_errorp(%8591) : (i64) -> i64
      %9025 = arith.cmpi ne, %9024, %9018 : i64
      %9026 = arith.cmpi eq, %9023, %9018 : i64
      %9027 = arith.andi %9025, %9026 : i1
      %9028 = scf.if %9027 -> (i64) {
        scf.yield %8591 : i64
      } else {
        scf.yield %9023 : i64
      }
      %9029 = func.call @cc_errorp(%8983) : (i64) -> i64
      %9030 = arith.cmpi ne, %9029, %9018 : i64
      %9031 = arith.cmpi eq, %9028, %9018 : i64
      %9032 = arith.andi %9030, %9031 : i1
      %9033 = scf.if %9032 -> (i64) {
        scf.yield %8983 : i64
      } else {
        scf.yield %9028 : i64
      }
      %9034 = func.call @cc_errorp(%8987) : (i64) -> i64
      %9035 = arith.cmpi ne, %9034, %9018 : i64
      %9036 = arith.cmpi eq, %9033, %9018 : i64
      %9037 = arith.andi %9035, %9036 : i1
      %9038 = scf.if %9037 -> (i64) {
        scf.yield %8987 : i64
      } else {
        scf.yield %9033 : i64
      }
      %9039 = func.call @cc_errorp(%8994) : (i64) -> i64
      %9040 = arith.cmpi ne, %9039, %9018 : i64
      %9041 = arith.cmpi eq, %9038, %9018 : i64
      %9042 = arith.andi %9040, %9041 : i1
      %9043 = scf.if %9042 -> (i64) {
        scf.yield %8994 : i64
      } else {
        scf.yield %9038 : i64
      }
      %9044 = func.call @cc_errorp(%8998) : (i64) -> i64
      %9045 = arith.cmpi ne, %9044, %9018 : i64
      %9046 = arith.cmpi eq, %9043, %9018 : i64
      %9047 = arith.andi %9045, %9046 : i1
      %9048 = scf.if %9047 -> (i64) {
        scf.yield %8998 : i64
      } else {
        scf.yield %9043 : i64
      }
      %9049 = func.call @cc_errorp(%9005) : (i64) -> i64
      %9050 = arith.cmpi ne, %9049, %9018 : i64
      %9051 = arith.cmpi eq, %9048, %9018 : i64
      %9052 = arith.andi %9050, %9051 : i1
      %9053 = scf.if %9052 -> (i64) {
        scf.yield %9005 : i64
      } else {
        scf.yield %9048 : i64
      }
      %9054 = func.call @cc_errorp(%9017) : (i64) -> i64
      %9055 = arith.cmpi ne, %9054, %9018 : i64
      %9056 = arith.cmpi eq, %9053, %9018 : i64
      %9057 = arith.andi %9055, %9056 : i1
      %9058 = scf.if %9057 -> (i64) {
        scf.yield %9017 : i64
      } else {
        scf.yield %9053 : i64
      }
      %9059 = arith.cmpi ne, %9058, %9018 : i64
      scf.if %9059 {
        func.call @stack_push_pointer(%9058) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7991) : (i64) -> ()
        func.call @stack_push_pointer(%8591) : (i64) -> ()
        func.call @stack_push_pointer(%8983) : (i64) -> ()
        func.call @stack_push_pointer(%8987) : (i64) -> ()
        func.call @stack_push_pointer(%8994) : (i64) -> ()
        func.call @stack_push_pointer(%8998) : (i64) -> ()
        func.call @stack_push_pointer(%9005) : (i64) -> ()
        func.call @stack_push_pointer(%9017) : (i64) -> ()
        %9060 = llvm.mlir.addressof @str748 : !llvm.ptr
        %9061 = func.call @cc_make_function_ref_const(%9060) : (!llvm.ptr) -> i64
        %9062 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9061, %9062) : (i64, i64) -> ()
      }
      %9063 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9063 : i64
    }
    %9064 = func.call @cc_nil_value() : () -> i64
    %9065 = func.call @cc_errorp(%7982) : (i64) -> i64
    %9066 = arith.cmpi ne, %9065, %9064 : i64
    %9067 = scf.if %9066 -> (i64) {
      scf.yield %7982 : i64
    } else {
      %9068 = llvm.mlir.addressof @str749 : !llvm.ptr
      %9069 = arith.constant 12 : i64
      %9070 = func.call @cc_make_string(%9068, %9069) : (!llvm.ptr, i64) -> i64
      %9071 = func.call @cc_nil_value() : () -> i64
      %9072 = func.call @cc_intern(%9070, %9071) : (i64, i64) -> i64
      %9073 = func.call @cc_nil_value() : () -> i64
      %9074 = func.call @cc_cons(%9072, %9073) : (i64, i64) -> i64
      %9075 = func.call @cc_values_pack(%9074) : (i64) -> i64
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %9076 = arith.addi %9072, %__rlasp_stack_elide_zero_452 : i64
      %9077 = llvm.mlir.addressof @str750 : !llvm.ptr
      %9078 = arith.constant 3 : i64
      %9079 = func.call @cc_make_string(%9077, %9078) : (!llvm.ptr, i64) -> i64
      %9080 = func.call @cc_nil_value() : () -> i64
      %9081 = func.call @cc_intern(%9079, %9080) : (i64, i64) -> i64
      %9082 = func.call @cc_nil_value() : () -> i64
      %9083 = func.call @cc_cons(%9081, %9082) : (i64, i64) -> i64
      %9084 = func.call @cc_values_pack(%9083) : (i64) -> i64
      func.call @stack_push_pointer(%9081) : (i64) -> ()
      %9085 = llvm.mlir.addressof @str751 : !llvm.ptr
      %9086 = arith.constant 3 : i64
      %9087 = func.call @cc_make_string(%9085, %9086) : (!llvm.ptr, i64) -> i64
      %9088 = func.call @cc_nil_value() : () -> i64
      %9089 = func.call @cc_intern(%9087, %9088) : (i64, i64) -> i64
      %9090 = func.call @cc_nil_value() : () -> i64
      %9091 = func.call @cc_cons(%9089, %9090) : (i64, i64) -> i64
      %9092 = func.call @cc_values_pack(%9091) : (i64) -> i64
      func.call @stack_push_pointer(%9089) : (i64) -> ()
      %9093 = llvm.mlir.addressof @str752 : !llvm.ptr
      %9094 = arith.constant 6 : i64
      %9095 = func.call @cc_make_string(%9093, %9094) : (!llvm.ptr, i64) -> i64
      %9096 = llvm.mlir.addressof @str753 : !llvm.ptr
      %9097 = arith.constant 11 : i64
      %9098 = func.call @cc_make_string(%9096, %9097) : (!llvm.ptr, i64) -> i64
      %9099 = func.call @cc_intern(%9095, %9098) : (i64, i64) -> i64
      %9100 = func.call @cc_nil_value() : () -> i64
      %9101 = func.call @cc_cons(%9099, %9100) : (i64, i64) -> i64
      %9102 = func.call @cc_values_pack(%9101) : (i64) -> i64
      func.call @stack_push_pointer(%9099) : (i64) -> ()
      %9103 = arith.constant 97 : i64
      %9104 = func.call @cc_box_character(%9103) : (i64) -> i64
      func.call @stack_push_pointer(%9104) : (i64) -> ()
      %9105 = arith.constant 98 : i64
      %9106 = func.call @cc_box_character(%9105) : (i64) -> i64
      func.call @stack_push_pointer(%9106) : (i64) -> ()
      %9107 = arith.constant 99 : i64
      %9108 = func.call @cc_box_character(%9107) : (i64) -> i64
      func.call @stack_push_pointer(%9108) : (i64) -> ()
      %9109 = arith.constant 100 : i64
      %9110 = func.call @cc_box_character(%9109) : (i64) -> i64
      func.call @stack_push_pointer(%9110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9111 = func.call @stack_pop_pointer() : () -> i64
      %9112 = func.call @stack_pop_pointer() : () -> i64
      %9113 = func.call @cc_cons(%9112, %9111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %9114 = arith.addi %9113, %__rlasp_stack_elide_zero_453 : i64
      %9115 = func.call @stack_pop_pointer() : () -> i64
      %9116 = func.call @cc_cons(%9115, %9114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %9117 = arith.addi %9116, %__rlasp_stack_elide_zero_454 : i64
      %9118 = func.call @stack_pop_pointer() : () -> i64
      %9119 = func.call @cc_cons(%9118, %9117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %9120 = arith.addi %9119, %__rlasp_stack_elide_zero_455 : i64
      %9121 = func.call @stack_pop_pointer() : () -> i64
      %9122 = func.call @cc_cons(%9121, %9120) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %9123 = arith.addi %9122, %__rlasp_stack_elide_zero_456 : i64
      %9124 = func.call @stack_pop_pointer() : () -> i64
      %9125 = func.call @cc_cons(%9124, %9123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9126 = func.call @stack_pop_pointer() : () -> i64
      %9127 = func.call @stack_pop_pointer() : () -> i64
      %9128 = func.call @cc_cons(%9127, %9126) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %9129 = arith.addi %9128, %__rlasp_stack_elide_zero_457 : i64
      %9130 = func.call @stack_pop_pointer() : () -> i64
      %9131 = func.call @cc_cons(%9130, %9129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9132 = func.call @stack_pop_pointer() : () -> i64
      %9133 = func.call @stack_pop_pointer() : () -> i64
      %9134 = func.call @cc_cons(%9133, %9132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %9135 = arith.addi %9134, %__rlasp_stack_elide_zero_458 : i64
      %9136 = func.call @stack_pop_pointer() : () -> i64
      %9137 = func.call @cc_cons(%9136, %9135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
      %9138 = arith.addi %9137, %__rlasp_stack_elide_zero_459 : i64
      %9186 = arith.constant 209815645192225 : i64
      %9187 = arith.constant 0 : i64
      %9188 = func.call @cc_make_closure(%9186, %9187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %9189 = arith.addi %9188, %__rlasp_stack_elide_zero_460 : i64
      %9190 = llvm.mlir.addressof @str755 : !llvm.ptr
      %9191 = arith.constant 1 : i64
      %9192 = func.call @cc_make_string(%9190, %9191) : (!llvm.ptr, i64) -> i64
      %9193 = func.call @cc_nil_value() : () -> i64
      %9194 = func.call @cc_intern(%9192, %9193) : (i64, i64) -> i64
      %9195 = func.call @cc_nil_value() : () -> i64
      %9196 = func.call @cc_cons(%9194, %9195) : (i64, i64) -> i64
      %9197 = func.call @cc_values_pack(%9196) : (i64) -> i64
      func.call @stack_push_pointer(%9194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9198 = func.call @stack_pop_pointer() : () -> i64
      %9199 = func.call @stack_pop_pointer() : () -> i64
      %9200 = func.call @cc_cons(%9199, %9198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %9201 = arith.addi %9200, %__rlasp_stack_elide_zero_461 : i64
      %9202 = llvm.mlir.addressof @str756 : !llvm.ptr
      %9203 = arith.constant 11 : i64
      %9204 = func.call @cc_make_string(%9202, %9203) : (!llvm.ptr, i64) -> i64
      %9205 = llvm.mlir.addressof @str757 : !llvm.ptr
      %9206 = arith.constant 7 : i64
      %9207 = func.call @cc_make_string(%9205, %9206) : (!llvm.ptr, i64) -> i64
      %9208 = func.call @cc_intern(%9204, %9207) : (i64, i64) -> i64
      %9209 = func.call @cc_nil_value() : () -> i64
      %9210 = func.call @cc_cons(%9208, %9209) : (i64, i64) -> i64
      %9211 = func.call @cc_values_pack(%9210) : (i64) -> i64
      %9212 = func.call @cc_nil_value() : () -> i64
      %9213 = llvm.mlir.addressof @str758 : !llvm.ptr
      %9214 = arith.constant 4 : i64
      %9215 = func.call @cc_make_string(%9213, %9214) : (!llvm.ptr, i64) -> i64
      %9216 = llvm.mlir.addressof @str759 : !llvm.ptr
      %9217 = arith.constant 7 : i64
      %9218 = func.call @cc_make_string(%9216, %9217) : (!llvm.ptr, i64) -> i64
      %9219 = func.call @cc_intern(%9215, %9218) : (i64, i64) -> i64
      %9220 = func.call @cc_nil_value() : () -> i64
      %9221 = func.call @cc_cons(%9219, %9220) : (i64, i64) -> i64
      %9222 = func.call @cc_values_pack(%9221) : (i64) -> i64
      %9223 = llvm.mlir.addressof @str760 : !llvm.ptr
      %9224 = arith.constant 6 : i64
      %9225 = func.call @cc_make_string(%9223, %9224) : (!llvm.ptr, i64) -> i64
      %9226 = func.call @cc_nil_value() : () -> i64
      %9227 = func.call @cc_intern(%9225, %9226) : (i64, i64) -> i64
      %9228 = func.call @cc_nil_value() : () -> i64
      %9229 = func.call @cc_cons(%9227, %9228) : (i64, i64) -> i64
      %9230 = func.call @cc_values_pack(%9229) : (i64) -> i64
      %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
      %9231 = arith.addi %9227, %__rlasp_stack_elide_zero_462 : i64
      %9232 = func.call @cc_nil_value() : () -> i64
      %9233 = func.call @cc_errorp(%9076) : (i64) -> i64
      %9234 = arith.cmpi ne, %9233, %9232 : i64
      %9235 = arith.cmpi eq, %9232, %9232 : i64
      %9236 = arith.andi %9234, %9235 : i1
      %9237 = scf.if %9236 -> (i64) {
        scf.yield %9076 : i64
      } else {
        scf.yield %9232 : i64
      }
      %9238 = func.call @cc_errorp(%9138) : (i64) -> i64
      %9239 = arith.cmpi ne, %9238, %9232 : i64
      %9240 = arith.cmpi eq, %9237, %9232 : i64
      %9241 = arith.andi %9239, %9240 : i1
      %9242 = scf.if %9241 -> (i64) {
        scf.yield %9138 : i64
      } else {
        scf.yield %9237 : i64
      }
      %9243 = func.call @cc_errorp(%9189) : (i64) -> i64
      %9244 = arith.cmpi ne, %9243, %9232 : i64
      %9245 = arith.cmpi eq, %9242, %9232 : i64
      %9246 = arith.andi %9244, %9245 : i1
      %9247 = scf.if %9246 -> (i64) {
        scf.yield %9189 : i64
      } else {
        scf.yield %9242 : i64
      }
      %9248 = func.call @cc_errorp(%9201) : (i64) -> i64
      %9249 = arith.cmpi ne, %9248, %9232 : i64
      %9250 = arith.cmpi eq, %9247, %9232 : i64
      %9251 = arith.andi %9249, %9250 : i1
      %9252 = scf.if %9251 -> (i64) {
        scf.yield %9201 : i64
      } else {
        scf.yield %9247 : i64
      }
      %9253 = func.call @cc_errorp(%9208) : (i64) -> i64
      %9254 = arith.cmpi ne, %9253, %9232 : i64
      %9255 = arith.cmpi eq, %9252, %9232 : i64
      %9256 = arith.andi %9254, %9255 : i1
      %9257 = scf.if %9256 -> (i64) {
        scf.yield %9208 : i64
      } else {
        scf.yield %9252 : i64
      }
      %9258 = func.call @cc_errorp(%9212) : (i64) -> i64
      %9259 = arith.cmpi ne, %9258, %9232 : i64
      %9260 = arith.cmpi eq, %9257, %9232 : i64
      %9261 = arith.andi %9259, %9260 : i1
      %9262 = scf.if %9261 -> (i64) {
        scf.yield %9212 : i64
      } else {
        scf.yield %9257 : i64
      }
      %9263 = func.call @cc_errorp(%9219) : (i64) -> i64
      %9264 = arith.cmpi ne, %9263, %9232 : i64
      %9265 = arith.cmpi eq, %9262, %9232 : i64
      %9266 = arith.andi %9264, %9265 : i1
      %9267 = scf.if %9266 -> (i64) {
        scf.yield %9219 : i64
      } else {
        scf.yield %9262 : i64
      }
      %9268 = func.call @cc_errorp(%9231) : (i64) -> i64
      %9269 = arith.cmpi ne, %9268, %9232 : i64
      %9270 = arith.cmpi eq, %9267, %9232 : i64
      %9271 = arith.andi %9269, %9270 : i1
      %9272 = scf.if %9271 -> (i64) {
        scf.yield %9231 : i64
      } else {
        scf.yield %9267 : i64
      }
      %9273 = arith.cmpi ne, %9272, %9232 : i64
      scf.if %9273 {
        func.call @stack_push_pointer(%9272) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9076) : (i64) -> ()
        func.call @stack_push_pointer(%9138) : (i64) -> ()
        func.call @stack_push_pointer(%9189) : (i64) -> ()
        func.call @stack_push_pointer(%9201) : (i64) -> ()
        func.call @stack_push_pointer(%9208) : (i64) -> ()
        func.call @stack_push_pointer(%9212) : (i64) -> ()
        func.call @stack_push_pointer(%9219) : (i64) -> ()
        func.call @stack_push_pointer(%9231) : (i64) -> ()
        %9274 = llvm.mlir.addressof @str761 : !llvm.ptr
        %9275 = func.call @cc_make_function_ref_const(%9274) : (!llvm.ptr) -> i64
        %9276 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9275, %9276) : (i64, i64) -> ()
      }
      %9277 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9277 : i64
    }
    %9278 = func.call @cc_nil_value() : () -> i64
    %9279 = func.call @cc_errorp(%9067) : (i64) -> i64
    %9280 = arith.cmpi ne, %9279, %9278 : i64
    %9281 = scf.if %9280 -> (i64) {
      scf.yield %9067 : i64
    } else {
      %9282 = llvm.mlir.addressof @str762 : !llvm.ptr
      %9283 = arith.constant 12 : i64
      %9284 = func.call @cc_make_string(%9282, %9283) : (!llvm.ptr, i64) -> i64
      %9285 = func.call @cc_nil_value() : () -> i64
      %9286 = func.call @cc_intern(%9284, %9285) : (i64, i64) -> i64
      %9287 = func.call @cc_nil_value() : () -> i64
      %9288 = func.call @cc_cons(%9286, %9287) : (i64, i64) -> i64
      %9289 = func.call @cc_values_pack(%9288) : (i64) -> i64
      %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
      %9290 = arith.addi %9286, %__rlasp_stack_elide_zero_463 : i64
      %9291 = llvm.mlir.addressof @str763 : !llvm.ptr
      %9292 = arith.constant 3 : i64
      %9293 = func.call @cc_make_string(%9291, %9292) : (!llvm.ptr, i64) -> i64
      %9294 = func.call @cc_nil_value() : () -> i64
      %9295 = func.call @cc_intern(%9293, %9294) : (i64, i64) -> i64
      %9296 = func.call @cc_nil_value() : () -> i64
      %9297 = func.call @cc_cons(%9295, %9296) : (i64, i64) -> i64
      %9298 = func.call @cc_values_pack(%9297) : (i64) -> i64
      func.call @stack_push_pointer(%9295) : (i64) -> ()
      %9299 = llvm.mlir.addressof @str764 : !llvm.ptr
      %9300 = arith.constant 3 : i64
      %9301 = func.call @cc_make_string(%9299, %9300) : (!llvm.ptr, i64) -> i64
      %9302 = func.call @cc_nil_value() : () -> i64
      %9303 = func.call @cc_intern(%9301, %9302) : (i64, i64) -> i64
      %9304 = func.call @cc_nil_value() : () -> i64
      %9305 = func.call @cc_cons(%9303, %9304) : (i64, i64) -> i64
      %9306 = func.call @cc_values_pack(%9305) : (i64) -> i64
      func.call @stack_push_pointer(%9303) : (i64) -> ()
      %9307 = llvm.mlir.addressof @str765 : !llvm.ptr
      %9308 = arith.constant 3 : i64
      %9309 = func.call @cc_make_string(%9307, %9308) : (!llvm.ptr, i64) -> i64
      %9310 = func.call @cc_nil_value() : () -> i64
      %9311 = func.call @cc_intern(%9309, %9310) : (i64, i64) -> i64
      %9312 = func.call @cc_nil_value() : () -> i64
      %9313 = func.call @cc_cons(%9311, %9312) : (i64, i64) -> i64
      %9314 = func.call @cc_values_pack(%9313) : (i64) -> i64
      func.call @stack_push_pointer(%9311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9315 = llvm.mlir.addressof @str766 : !llvm.ptr
      %9316 = arith.constant 6 : i64
      %9317 = func.call @cc_make_string(%9315, %9316) : (!llvm.ptr, i64) -> i64
      %9318 = llvm.mlir.addressof @str767 : !llvm.ptr
      %9319 = arith.constant 11 : i64
      %9320 = func.call @cc_make_string(%9318, %9319) : (!llvm.ptr, i64) -> i64
      %9321 = func.call @cc_intern(%9317, %9320) : (i64, i64) -> i64
      %9322 = func.call @cc_nil_value() : () -> i64
      %9323 = func.call @cc_cons(%9321, %9322) : (i64, i64) -> i64
      %9324 = func.call @cc_values_pack(%9323) : (i64) -> i64
      func.call @stack_push_pointer(%9321) : (i64) -> ()
      %9325 = arith.constant 97 : i64
      %9326 = func.call @cc_box_character(%9325) : (i64) -> i64
      func.call @stack_push_pointer(%9326) : (i64) -> ()
      %9327 = arith.constant 98 : i64
      %9328 = func.call @cc_box_character(%9327) : (i64) -> i64
      func.call @stack_push_pointer(%9328) : (i64) -> ()
      %9329 = arith.constant 99 : i64
      %9330 = func.call @cc_box_character(%9329) : (i64) -> i64
      func.call @stack_push_pointer(%9330) : (i64) -> ()
      %9331 = arith.constant 100 : i64
      %9332 = func.call @cc_box_character(%9331) : (i64) -> i64
      func.call @stack_push_pointer(%9332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9333 = func.call @stack_pop_pointer() : () -> i64
      %9334 = func.call @stack_pop_pointer() : () -> i64
      %9335 = func.call @cc_cons(%9334, %9333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %9336 = arith.addi %9335, %__rlasp_stack_elide_zero_464 : i64
      %9337 = func.call @stack_pop_pointer() : () -> i64
      %9338 = func.call @cc_cons(%9337, %9336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
      %9339 = arith.addi %9338, %__rlasp_stack_elide_zero_465 : i64
      %9340 = func.call @stack_pop_pointer() : () -> i64
      %9341 = func.call @cc_cons(%9340, %9339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
      %9342 = arith.addi %9341, %__rlasp_stack_elide_zero_466 : i64
      %9343 = func.call @stack_pop_pointer() : () -> i64
      %9344 = func.call @cc_cons(%9343, %9342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %9345 = arith.addi %9344, %__rlasp_stack_elide_zero_467 : i64
      %9346 = func.call @stack_pop_pointer() : () -> i64
      %9347 = func.call @cc_cons(%9346, %9345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9348 = func.call @stack_pop_pointer() : () -> i64
      %9349 = func.call @stack_pop_pointer() : () -> i64
      %9350 = func.call @cc_cons(%9349, %9348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
      %9351 = arith.addi %9350, %__rlasp_stack_elide_zero_468 : i64
      %9352 = func.call @stack_pop_pointer() : () -> i64
      %9353 = func.call @cc_cons(%9352, %9351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
      %9354 = arith.addi %9353, %__rlasp_stack_elide_zero_469 : i64
      %9355 = func.call @stack_pop_pointer() : () -> i64
      %9356 = func.call @cc_cons(%9355, %9354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9356) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9357 = func.call @stack_pop_pointer() : () -> i64
      %9358 = func.call @stack_pop_pointer() : () -> i64
      %9359 = func.call @cc_cons(%9358, %9357) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
      %9360 = arith.addi %9359, %__rlasp_stack_elide_zero_470 : i64
      %9361 = func.call @stack_pop_pointer() : () -> i64
      %9362 = func.call @cc_cons(%9361, %9360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9363 = func.call @stack_pop_pointer() : () -> i64
      %9364 = func.call @stack_pop_pointer() : () -> i64
      %9365 = func.call @cc_cons(%9364, %9363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
      %9366 = arith.addi %9365, %__rlasp_stack_elide_zero_471 : i64
      %9367 = func.call @stack_pop_pointer() : () -> i64
      %9368 = func.call @cc_cons(%9367, %9366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
      %9369 = arith.addi %9368, %__rlasp_stack_elide_zero_472 : i64
      %9423 = arith.constant 209815645192226 : i64
      %9424 = arith.constant 0 : i64
      %9425 = func.call @cc_make_closure(%9423, %9424) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %9426 = arith.addi %9425, %__rlasp_stack_elide_zero_473 : i64
      %9427 = llvm.mlir.addressof @str769 : !llvm.ptr
      %9428 = arith.constant 1 : i64
      %9429 = func.call @cc_make_string(%9427, %9428) : (!llvm.ptr, i64) -> i64
      %9430 = func.call @cc_nil_value() : () -> i64
      %9431 = func.call @cc_intern(%9429, %9430) : (i64, i64) -> i64
      %9432 = func.call @cc_nil_value() : () -> i64
      %9433 = func.call @cc_cons(%9431, %9432) : (i64, i64) -> i64
      %9434 = func.call @cc_values_pack(%9433) : (i64) -> i64
      func.call @stack_push_pointer(%9431) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9435 = func.call @stack_pop_pointer() : () -> i64
      %9436 = func.call @stack_pop_pointer() : () -> i64
      %9437 = func.call @cc_cons(%9436, %9435) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
      %9438 = arith.addi %9437, %__rlasp_stack_elide_zero_474 : i64
      %9439 = llvm.mlir.addressof @str770 : !llvm.ptr
      %9440 = arith.constant 11 : i64
      %9441 = func.call @cc_make_string(%9439, %9440) : (!llvm.ptr, i64) -> i64
      %9442 = llvm.mlir.addressof @str771 : !llvm.ptr
      %9443 = arith.constant 7 : i64
      %9444 = func.call @cc_make_string(%9442, %9443) : (!llvm.ptr, i64) -> i64
      %9445 = func.call @cc_intern(%9441, %9444) : (i64, i64) -> i64
      %9446 = func.call @cc_nil_value() : () -> i64
      %9447 = func.call @cc_cons(%9445, %9446) : (i64, i64) -> i64
      %9448 = func.call @cc_values_pack(%9447) : (i64) -> i64
      %9449 = func.call @cc_nil_value() : () -> i64
      %9450 = llvm.mlir.addressof @str772 : !llvm.ptr
      %9451 = arith.constant 4 : i64
      %9452 = func.call @cc_make_string(%9450, %9451) : (!llvm.ptr, i64) -> i64
      %9453 = llvm.mlir.addressof @str773 : !llvm.ptr
      %9454 = arith.constant 7 : i64
      %9455 = func.call @cc_make_string(%9453, %9454) : (!llvm.ptr, i64) -> i64
      %9456 = func.call @cc_intern(%9452, %9455) : (i64, i64) -> i64
      %9457 = func.call @cc_nil_value() : () -> i64
      %9458 = func.call @cc_cons(%9456, %9457) : (i64, i64) -> i64
      %9459 = func.call @cc_values_pack(%9458) : (i64) -> i64
      %9460 = llvm.mlir.addressof @str774 : !llvm.ptr
      %9461 = arith.constant 6 : i64
      %9462 = func.call @cc_make_string(%9460, %9461) : (!llvm.ptr, i64) -> i64
      %9463 = func.call @cc_nil_value() : () -> i64
      %9464 = func.call @cc_intern(%9462, %9463) : (i64, i64) -> i64
      %9465 = func.call @cc_nil_value() : () -> i64
      %9466 = func.call @cc_cons(%9464, %9465) : (i64, i64) -> i64
      %9467 = func.call @cc_values_pack(%9466) : (i64) -> i64
      %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
      %9468 = arith.addi %9464, %__rlasp_stack_elide_zero_475 : i64
      %9469 = func.call @cc_nil_value() : () -> i64
      %9470 = func.call @cc_errorp(%9290) : (i64) -> i64
      %9471 = arith.cmpi ne, %9470, %9469 : i64
      %9472 = arith.cmpi eq, %9469, %9469 : i64
      %9473 = arith.andi %9471, %9472 : i1
      %9474 = scf.if %9473 -> (i64) {
        scf.yield %9290 : i64
      } else {
        scf.yield %9469 : i64
      }
      %9475 = func.call @cc_errorp(%9369) : (i64) -> i64
      %9476 = arith.cmpi ne, %9475, %9469 : i64
      %9477 = arith.cmpi eq, %9474, %9469 : i64
      %9478 = arith.andi %9476, %9477 : i1
      %9479 = scf.if %9478 -> (i64) {
        scf.yield %9369 : i64
      } else {
        scf.yield %9474 : i64
      }
      %9480 = func.call @cc_errorp(%9426) : (i64) -> i64
      %9481 = arith.cmpi ne, %9480, %9469 : i64
      %9482 = arith.cmpi eq, %9479, %9469 : i64
      %9483 = arith.andi %9481, %9482 : i1
      %9484 = scf.if %9483 -> (i64) {
        scf.yield %9426 : i64
      } else {
        scf.yield %9479 : i64
      }
      %9485 = func.call @cc_errorp(%9438) : (i64) -> i64
      %9486 = arith.cmpi ne, %9485, %9469 : i64
      %9487 = arith.cmpi eq, %9484, %9469 : i64
      %9488 = arith.andi %9486, %9487 : i1
      %9489 = scf.if %9488 -> (i64) {
        scf.yield %9438 : i64
      } else {
        scf.yield %9484 : i64
      }
      %9490 = func.call @cc_errorp(%9445) : (i64) -> i64
      %9491 = arith.cmpi ne, %9490, %9469 : i64
      %9492 = arith.cmpi eq, %9489, %9469 : i64
      %9493 = arith.andi %9491, %9492 : i1
      %9494 = scf.if %9493 -> (i64) {
        scf.yield %9445 : i64
      } else {
        scf.yield %9489 : i64
      }
      %9495 = func.call @cc_errorp(%9449) : (i64) -> i64
      %9496 = arith.cmpi ne, %9495, %9469 : i64
      %9497 = arith.cmpi eq, %9494, %9469 : i64
      %9498 = arith.andi %9496, %9497 : i1
      %9499 = scf.if %9498 -> (i64) {
        scf.yield %9449 : i64
      } else {
        scf.yield %9494 : i64
      }
      %9500 = func.call @cc_errorp(%9456) : (i64) -> i64
      %9501 = arith.cmpi ne, %9500, %9469 : i64
      %9502 = arith.cmpi eq, %9499, %9469 : i64
      %9503 = arith.andi %9501, %9502 : i1
      %9504 = scf.if %9503 -> (i64) {
        scf.yield %9456 : i64
      } else {
        scf.yield %9499 : i64
      }
      %9505 = func.call @cc_errorp(%9468) : (i64) -> i64
      %9506 = arith.cmpi ne, %9505, %9469 : i64
      %9507 = arith.cmpi eq, %9504, %9469 : i64
      %9508 = arith.andi %9506, %9507 : i1
      %9509 = scf.if %9508 -> (i64) {
        scf.yield %9468 : i64
      } else {
        scf.yield %9504 : i64
      }
      %9510 = arith.cmpi ne, %9509, %9469 : i64
      scf.if %9510 {
        func.call @stack_push_pointer(%9509) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9290) : (i64) -> ()
        func.call @stack_push_pointer(%9369) : (i64) -> ()
        func.call @stack_push_pointer(%9426) : (i64) -> ()
        func.call @stack_push_pointer(%9438) : (i64) -> ()
        func.call @stack_push_pointer(%9445) : (i64) -> ()
        func.call @stack_push_pointer(%9449) : (i64) -> ()
        func.call @stack_push_pointer(%9456) : (i64) -> ()
        func.call @stack_push_pointer(%9468) : (i64) -> ()
        %9511 = llvm.mlir.addressof @str775 : !llvm.ptr
        %9512 = func.call @cc_make_function_ref_const(%9511) : (!llvm.ptr) -> i64
        %9513 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9512, %9513) : (i64, i64) -> ()
      }
      %9514 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9514 : i64
    }
    %9515 = func.call @cc_nil_value() : () -> i64
    %9516 = func.call @cc_errorp(%9281) : (i64) -> i64
    %9517 = arith.cmpi ne, %9516, %9515 : i64
    %9518 = scf.if %9517 -> (i64) {
      scf.yield %9281 : i64
    } else {
      %9519 = llvm.mlir.addressof @str776 : !llvm.ptr
      %9520 = arith.constant 12 : i64
      %9521 = func.call @cc_make_string(%9519, %9520) : (!llvm.ptr, i64) -> i64
      %9522 = func.call @cc_nil_value() : () -> i64
      %9523 = func.call @cc_intern(%9521, %9522) : (i64, i64) -> i64
      %9524 = func.call @cc_nil_value() : () -> i64
      %9525 = func.call @cc_cons(%9523, %9524) : (i64, i64) -> i64
      %9526 = func.call @cc_values_pack(%9525) : (i64) -> i64
      %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
      %9527 = arith.addi %9523, %__rlasp_stack_elide_zero_476 : i64
      %9528 = llvm.mlir.addressof @str777 : !llvm.ptr
      %9529 = arith.constant 3 : i64
      %9530 = func.call @cc_make_string(%9528, %9529) : (!llvm.ptr, i64) -> i64
      %9531 = func.call @cc_nil_value() : () -> i64
      %9532 = func.call @cc_intern(%9530, %9531) : (i64, i64) -> i64
      %9533 = func.call @cc_nil_value() : () -> i64
      %9534 = func.call @cc_cons(%9532, %9533) : (i64, i64) -> i64
      %9535 = func.call @cc_values_pack(%9534) : (i64) -> i64
      func.call @stack_push_pointer(%9532) : (i64) -> ()
      %9536 = llvm.mlir.addressof @str778 : !llvm.ptr
      %9537 = arith.constant 3 : i64
      %9538 = func.call @cc_make_string(%9536, %9537) : (!llvm.ptr, i64) -> i64
      %9539 = func.call @cc_nil_value() : () -> i64
      %9540 = func.call @cc_intern(%9538, %9539) : (i64, i64) -> i64
      %9541 = func.call @cc_nil_value() : () -> i64
      %9542 = func.call @cc_cons(%9540, %9541) : (i64, i64) -> i64
      %9543 = func.call @cc_values_pack(%9542) : (i64) -> i64
      func.call @stack_push_pointer(%9540) : (i64) -> ()
      %9544 = llvm.mlir.addressof @str779 : !llvm.ptr
      %9545 = arith.constant 3 : i64
      %9546 = func.call @cc_make_string(%9544, %9545) : (!llvm.ptr, i64) -> i64
      %9547 = llvm.mlir.addressof @str780 : !llvm.ptr
      %9548 = arith.constant 11 : i64
      %9549 = func.call @cc_make_string(%9547, %9548) : (!llvm.ptr, i64) -> i64
      %9550 = func.call @cc_intern(%9546, %9549) : (i64, i64) -> i64
      %9551 = func.call @cc_nil_value() : () -> i64
      %9552 = func.call @cc_cons(%9550, %9551) : (i64, i64) -> i64
      %9553 = func.call @cc_values_pack(%9552) : (i64) -> i64
      func.call @stack_push_pointer(%9550) : (i64) -> ()
      %9554 = arith.constant 127 : i64
      %9555 = func.call @cc_box_character(%9554) : (i64) -> i64
      func.call @stack_push_pointer(%9555) : (i64) -> ()
      %9556 = arith.constant 127 : i64
      %9557 = func.call @cc_box_character(%9556) : (i64) -> i64
      func.call @stack_push_pointer(%9557) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9558 = func.call @stack_pop_pointer() : () -> i64
      %9559 = func.call @stack_pop_pointer() : () -> i64
      %9560 = func.call @cc_cons(%9559, %9558) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
      %9561 = arith.addi %9560, %__rlasp_stack_elide_zero_477 : i64
      %9562 = func.call @stack_pop_pointer() : () -> i64
      %9563 = func.call @cc_cons(%9562, %9561) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
      %9564 = arith.addi %9563, %__rlasp_stack_elide_zero_478 : i64
      %9565 = func.call @stack_pop_pointer() : () -> i64
      %9566 = func.call @cc_cons(%9565, %9564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9566) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9567 = func.call @stack_pop_pointer() : () -> i64
      %9568 = func.call @stack_pop_pointer() : () -> i64
      %9569 = func.call @cc_cons(%9568, %9567) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
      %9570 = arith.addi %9569, %__rlasp_stack_elide_zero_479 : i64
      %9571 = func.call @stack_pop_pointer() : () -> i64
      %9572 = func.call @cc_cons(%9571, %9570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9572) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9573 = func.call @stack_pop_pointer() : () -> i64
      %9574 = func.call @stack_pop_pointer() : () -> i64
      %9575 = func.call @cc_cons(%9574, %9573) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
      %9576 = arith.addi %9575, %__rlasp_stack_elide_zero_480 : i64
      %9577 = func.call @stack_pop_pointer() : () -> i64
      %9578 = func.call @cc_cons(%9577, %9576) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
      %9579 = arith.addi %9578, %__rlasp_stack_elide_zero_481 : i64
      %9601 = arith.constant 209815645192227 : i64
      %9602 = arith.constant 0 : i64
      %9603 = func.call @cc_make_closure(%9601, %9602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
      %9604 = arith.addi %9603, %__rlasp_stack_elide_zero_482 : i64
      %9605 = llvm.mlir.addressof @str781 : !llvm.ptr
      %9606 = arith.constant 1 : i64
      %9607 = func.call @cc_make_string(%9605, %9606) : (!llvm.ptr, i64) -> i64
      %9608 = func.call @cc_nil_value() : () -> i64
      %9609 = func.call @cc_intern(%9607, %9608) : (i64, i64) -> i64
      %9610 = func.call @cc_nil_value() : () -> i64
      %9611 = func.call @cc_cons(%9609, %9610) : (i64, i64) -> i64
      %9612 = func.call @cc_values_pack(%9611) : (i64) -> i64
      func.call @stack_push_pointer(%9609) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9613 = func.call @stack_pop_pointer() : () -> i64
      %9614 = func.call @stack_pop_pointer() : () -> i64
      %9615 = func.call @cc_cons(%9614, %9613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
      %9616 = arith.addi %9615, %__rlasp_stack_elide_zero_483 : i64
      %9617 = llvm.mlir.addressof @str782 : !llvm.ptr
      %9618 = arith.constant 11 : i64
      %9619 = func.call @cc_make_string(%9617, %9618) : (!llvm.ptr, i64) -> i64
      %9620 = llvm.mlir.addressof @str783 : !llvm.ptr
      %9621 = arith.constant 7 : i64
      %9622 = func.call @cc_make_string(%9620, %9621) : (!llvm.ptr, i64) -> i64
      %9623 = func.call @cc_intern(%9619, %9622) : (i64, i64) -> i64
      %9624 = func.call @cc_nil_value() : () -> i64
      %9625 = func.call @cc_cons(%9623, %9624) : (i64, i64) -> i64
      %9626 = func.call @cc_values_pack(%9625) : (i64) -> i64
      %9627 = func.call @cc_nil_value() : () -> i64
      %9628 = llvm.mlir.addressof @str784 : !llvm.ptr
      %9629 = arith.constant 4 : i64
      %9630 = func.call @cc_make_string(%9628, %9629) : (!llvm.ptr, i64) -> i64
      %9631 = llvm.mlir.addressof @str785 : !llvm.ptr
      %9632 = arith.constant 7 : i64
      %9633 = func.call @cc_make_string(%9631, %9632) : (!llvm.ptr, i64) -> i64
      %9634 = func.call @cc_intern(%9630, %9633) : (i64, i64) -> i64
      %9635 = func.call @cc_nil_value() : () -> i64
      %9636 = func.call @cc_cons(%9634, %9635) : (i64, i64) -> i64
      %9637 = func.call @cc_values_pack(%9636) : (i64) -> i64
      %9638 = llvm.mlir.addressof @str786 : !llvm.ptr
      %9639 = arith.constant 6 : i64
      %9640 = func.call @cc_make_string(%9638, %9639) : (!llvm.ptr, i64) -> i64
      %9641 = func.call @cc_nil_value() : () -> i64
      %9642 = func.call @cc_intern(%9640, %9641) : (i64, i64) -> i64
      %9643 = func.call @cc_nil_value() : () -> i64
      %9644 = func.call @cc_cons(%9642, %9643) : (i64, i64) -> i64
      %9645 = func.call @cc_values_pack(%9644) : (i64) -> i64
      %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
      %9646 = arith.addi %9642, %__rlasp_stack_elide_zero_484 : i64
      %9647 = func.call @cc_nil_value() : () -> i64
      %9648 = func.call @cc_errorp(%9527) : (i64) -> i64
      %9649 = arith.cmpi ne, %9648, %9647 : i64
      %9650 = arith.cmpi eq, %9647, %9647 : i64
      %9651 = arith.andi %9649, %9650 : i1
      %9652 = scf.if %9651 -> (i64) {
        scf.yield %9527 : i64
      } else {
        scf.yield %9647 : i64
      }
      %9653 = func.call @cc_errorp(%9579) : (i64) -> i64
      %9654 = arith.cmpi ne, %9653, %9647 : i64
      %9655 = arith.cmpi eq, %9652, %9647 : i64
      %9656 = arith.andi %9654, %9655 : i1
      %9657 = scf.if %9656 -> (i64) {
        scf.yield %9579 : i64
      } else {
        scf.yield %9652 : i64
      }
      %9658 = func.call @cc_errorp(%9604) : (i64) -> i64
      %9659 = arith.cmpi ne, %9658, %9647 : i64
      %9660 = arith.cmpi eq, %9657, %9647 : i64
      %9661 = arith.andi %9659, %9660 : i1
      %9662 = scf.if %9661 -> (i64) {
        scf.yield %9604 : i64
      } else {
        scf.yield %9657 : i64
      }
      %9663 = func.call @cc_errorp(%9616) : (i64) -> i64
      %9664 = arith.cmpi ne, %9663, %9647 : i64
      %9665 = arith.cmpi eq, %9662, %9647 : i64
      %9666 = arith.andi %9664, %9665 : i1
      %9667 = scf.if %9666 -> (i64) {
        scf.yield %9616 : i64
      } else {
        scf.yield %9662 : i64
      }
      %9668 = func.call @cc_errorp(%9623) : (i64) -> i64
      %9669 = arith.cmpi ne, %9668, %9647 : i64
      %9670 = arith.cmpi eq, %9667, %9647 : i64
      %9671 = arith.andi %9669, %9670 : i1
      %9672 = scf.if %9671 -> (i64) {
        scf.yield %9623 : i64
      } else {
        scf.yield %9667 : i64
      }
      %9673 = func.call @cc_errorp(%9627) : (i64) -> i64
      %9674 = arith.cmpi ne, %9673, %9647 : i64
      %9675 = arith.cmpi eq, %9672, %9647 : i64
      %9676 = arith.andi %9674, %9675 : i1
      %9677 = scf.if %9676 -> (i64) {
        scf.yield %9627 : i64
      } else {
        scf.yield %9672 : i64
      }
      %9678 = func.call @cc_errorp(%9634) : (i64) -> i64
      %9679 = arith.cmpi ne, %9678, %9647 : i64
      %9680 = arith.cmpi eq, %9677, %9647 : i64
      %9681 = arith.andi %9679, %9680 : i1
      %9682 = scf.if %9681 -> (i64) {
        scf.yield %9634 : i64
      } else {
        scf.yield %9677 : i64
      }
      %9683 = func.call @cc_errorp(%9646) : (i64) -> i64
      %9684 = arith.cmpi ne, %9683, %9647 : i64
      %9685 = arith.cmpi eq, %9682, %9647 : i64
      %9686 = arith.andi %9684, %9685 : i1
      %9687 = scf.if %9686 -> (i64) {
        scf.yield %9646 : i64
      } else {
        scf.yield %9682 : i64
      }
      %9688 = arith.cmpi ne, %9687, %9647 : i64
      scf.if %9688 {
        func.call @stack_push_pointer(%9687) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9527) : (i64) -> ()
        func.call @stack_push_pointer(%9579) : (i64) -> ()
        func.call @stack_push_pointer(%9604) : (i64) -> ()
        func.call @stack_push_pointer(%9616) : (i64) -> ()
        func.call @stack_push_pointer(%9623) : (i64) -> ()
        func.call @stack_push_pointer(%9627) : (i64) -> ()
        func.call @stack_push_pointer(%9634) : (i64) -> ()
        func.call @stack_push_pointer(%9646) : (i64) -> ()
        %9689 = llvm.mlir.addressof @str787 : !llvm.ptr
        %9690 = func.call @cc_make_function_ref_const(%9689) : (!llvm.ptr) -> i64
        %9691 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9690, %9691) : (i64, i64) -> ()
      }
      %9692 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9692 : i64
    }
    %9693 = func.call @cc_nil_value() : () -> i64
    %9694 = func.call @cc_errorp(%9518) : (i64) -> i64
    %9695 = arith.cmpi ne, %9694, %9693 : i64
    %9696 = scf.if %9695 -> (i64) {
      scf.yield %9518 : i64
    } else {
      %9697 = llvm.mlir.addressof @str788 : !llvm.ptr
      %9698 = arith.constant 12 : i64
      %9699 = func.call @cc_make_string(%9697, %9698) : (!llvm.ptr, i64) -> i64
      %9700 = func.call @cc_nil_value() : () -> i64
      %9701 = func.call @cc_intern(%9699, %9700) : (i64, i64) -> i64
      %9702 = func.call @cc_nil_value() : () -> i64
      %9703 = func.call @cc_cons(%9701, %9702) : (i64, i64) -> i64
      %9704 = func.call @cc_values_pack(%9703) : (i64) -> i64
      %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
      %9705 = arith.addi %9701, %__rlasp_stack_elide_zero_485 : i64
      %9706 = llvm.mlir.addressof @str789 : !llvm.ptr
      %9707 = arith.constant 3 : i64
      %9708 = func.call @cc_make_string(%9706, %9707) : (!llvm.ptr, i64) -> i64
      %9709 = func.call @cc_nil_value() : () -> i64
      %9710 = func.call @cc_intern(%9708, %9709) : (i64, i64) -> i64
      %9711 = func.call @cc_nil_value() : () -> i64
      %9712 = func.call @cc_cons(%9710, %9711) : (i64, i64) -> i64
      %9713 = func.call @cc_values_pack(%9712) : (i64) -> i64
      func.call @stack_push_pointer(%9710) : (i64) -> ()
      %9714 = llvm.mlir.addressof @str790 : !llvm.ptr
      %9715 = arith.constant 3 : i64
      %9716 = func.call @cc_make_string(%9714, %9715) : (!llvm.ptr, i64) -> i64
      %9717 = func.call @cc_nil_value() : () -> i64
      %9718 = func.call @cc_intern(%9716, %9717) : (i64, i64) -> i64
      %9719 = func.call @cc_nil_value() : () -> i64
      %9720 = func.call @cc_cons(%9718, %9719) : (i64, i64) -> i64
      %9721 = func.call @cc_values_pack(%9720) : (i64) -> i64
      func.call @stack_push_pointer(%9718) : (i64) -> ()
      %9722 = llvm.mlir.addressof @str791 : !llvm.ptr
      %9723 = arith.constant 4 : i64
      %9724 = func.call @cc_make_string(%9722, %9723) : (!llvm.ptr, i64) -> i64
      %9725 = llvm.mlir.addressof @str792 : !llvm.ptr
      %9726 = arith.constant 11 : i64
      %9727 = func.call @cc_make_string(%9725, %9726) : (!llvm.ptr, i64) -> i64
      %9728 = func.call @cc_intern(%9724, %9727) : (i64, i64) -> i64
      %9729 = func.call @cc_nil_value() : () -> i64
      %9730 = func.call @cc_cons(%9728, %9729) : (i64, i64) -> i64
      %9731 = func.call @cc_values_pack(%9730) : (i64) -> i64
      func.call @stack_push_pointer(%9728) : (i64) -> ()
      %9732 = arith.constant 0 : i64
      %9733 = func.call @cc_box_character(%9732) : (i64) -> i64
      func.call @stack_push_pointer(%9733) : (i64) -> ()
      %9734 = arith.constant 1 : i64
      %9735 = func.call @cc_box_character(%9734) : (i64) -> i64
      func.call @stack_push_pointer(%9735) : (i64) -> ()
      %9736 = arith.constant 2 : i64
      %9737 = func.call @cc_box_character(%9736) : (i64) -> i64
      func.call @stack_push_pointer(%9737) : (i64) -> ()
      %9738 = arith.constant 3 : i64
      %9739 = func.call @cc_box_character(%9738) : (i64) -> i64
      func.call @stack_push_pointer(%9739) : (i64) -> ()
      %9740 = arith.constant 4 : i64
      %9741 = func.call @cc_box_character(%9740) : (i64) -> i64
      func.call @stack_push_pointer(%9741) : (i64) -> ()
      %9742 = arith.constant 5 : i64
      %9743 = func.call @cc_box_character(%9742) : (i64) -> i64
      func.call @stack_push_pointer(%9743) : (i64) -> ()
      %9744 = arith.constant 6 : i64
      %9745 = func.call @cc_box_character(%9744) : (i64) -> i64
      func.call @stack_push_pointer(%9745) : (i64) -> ()
      %9746 = arith.constant 7 : i64
      %9747 = func.call @cc_box_character(%9746) : (i64) -> i64
      func.call @stack_push_pointer(%9747) : (i64) -> ()
      %9748 = arith.constant 8 : i64
      %9749 = func.call @cc_box_character(%9748) : (i64) -> i64
      func.call @stack_push_pointer(%9749) : (i64) -> ()
      %9750 = arith.constant 9 : i64
      %9751 = func.call @cc_box_character(%9750) : (i64) -> i64
      func.call @stack_push_pointer(%9751) : (i64) -> ()
      %9752 = arith.constant 10 : i64
      %9753 = func.call @cc_box_character(%9752) : (i64) -> i64
      func.call @stack_push_pointer(%9753) : (i64) -> ()
      %9754 = arith.constant 11 : i64
      %9755 = func.call @cc_box_character(%9754) : (i64) -> i64
      func.call @stack_push_pointer(%9755) : (i64) -> ()
      %9756 = arith.constant 12 : i64
      %9757 = func.call @cc_box_character(%9756) : (i64) -> i64
      func.call @stack_push_pointer(%9757) : (i64) -> ()
      %9758 = arith.constant 13 : i64
      %9759 = func.call @cc_box_character(%9758) : (i64) -> i64
      func.call @stack_push_pointer(%9759) : (i64) -> ()
      %9760 = arith.constant 14 : i64
      %9761 = func.call @cc_box_character(%9760) : (i64) -> i64
      func.call @stack_push_pointer(%9761) : (i64) -> ()
      %9762 = arith.constant 15 : i64
      %9763 = func.call @cc_box_character(%9762) : (i64) -> i64
      func.call @stack_push_pointer(%9763) : (i64) -> ()
      %9764 = arith.constant 16 : i64
      %9765 = func.call @cc_box_character(%9764) : (i64) -> i64
      func.call @stack_push_pointer(%9765) : (i64) -> ()
      %9766 = arith.constant 17 : i64
      %9767 = func.call @cc_box_character(%9766) : (i64) -> i64
      func.call @stack_push_pointer(%9767) : (i64) -> ()
      %9768 = arith.constant 18 : i64
      %9769 = func.call @cc_box_character(%9768) : (i64) -> i64
      func.call @stack_push_pointer(%9769) : (i64) -> ()
      %9770 = arith.constant 19 : i64
      %9771 = func.call @cc_box_character(%9770) : (i64) -> i64
      func.call @stack_push_pointer(%9771) : (i64) -> ()
      %9772 = arith.constant 20 : i64
      %9773 = func.call @cc_box_character(%9772) : (i64) -> i64
      func.call @stack_push_pointer(%9773) : (i64) -> ()
      %9774 = arith.constant 21 : i64
      %9775 = func.call @cc_box_character(%9774) : (i64) -> i64
      func.call @stack_push_pointer(%9775) : (i64) -> ()
      %9776 = arith.constant 22 : i64
      %9777 = func.call @cc_box_character(%9776) : (i64) -> i64
      func.call @stack_push_pointer(%9777) : (i64) -> ()
      %9778 = arith.constant 23 : i64
      %9779 = func.call @cc_box_character(%9778) : (i64) -> i64
      func.call @stack_push_pointer(%9779) : (i64) -> ()
      %9780 = arith.constant 24 : i64
      %9781 = func.call @cc_box_character(%9780) : (i64) -> i64
      func.call @stack_push_pointer(%9781) : (i64) -> ()
      %9782 = arith.constant 25 : i64
      %9783 = func.call @cc_box_character(%9782) : (i64) -> i64
      func.call @stack_push_pointer(%9783) : (i64) -> ()
      %9784 = arith.constant 26 : i64
      %9785 = func.call @cc_box_character(%9784) : (i64) -> i64
      func.call @stack_push_pointer(%9785) : (i64) -> ()
      %9786 = arith.constant 27 : i64
      %9787 = func.call @cc_box_character(%9786) : (i64) -> i64
      func.call @stack_push_pointer(%9787) : (i64) -> ()
      %9788 = arith.constant 28 : i64
      %9789 = func.call @cc_box_character(%9788) : (i64) -> i64
      func.call @stack_push_pointer(%9789) : (i64) -> ()
      %9790 = arith.constant 29 : i64
      %9791 = func.call @cc_box_character(%9790) : (i64) -> i64
      func.call @stack_push_pointer(%9791) : (i64) -> ()
      %9792 = arith.constant 30 : i64
      %9793 = func.call @cc_box_character(%9792) : (i64) -> i64
      func.call @stack_push_pointer(%9793) : (i64) -> ()
      %9794 = arith.constant 31 : i64
      %9795 = func.call @cc_box_character(%9794) : (i64) -> i64
      func.call @stack_push_pointer(%9795) : (i64) -> ()
      %9796 = arith.constant 32 : i64
      %9797 = func.call @cc_box_character(%9796) : (i64) -> i64
      func.call @stack_push_pointer(%9797) : (i64) -> ()
      %9798 = arith.constant 127 : i64
      %9799 = func.call @cc_box_character(%9798) : (i64) -> i64
      func.call @stack_push_pointer(%9799) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9800 = func.call @stack_pop_pointer() : () -> i64
      %9801 = func.call @stack_pop_pointer() : () -> i64
      %9802 = func.call @cc_cons(%9801, %9800) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
      %9803 = arith.addi %9802, %__rlasp_stack_elide_zero_486 : i64
      %9804 = func.call @stack_pop_pointer() : () -> i64
      %9805 = func.call @cc_cons(%9804, %9803) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
      %9806 = arith.addi %9805, %__rlasp_stack_elide_zero_487 : i64
      %9807 = func.call @stack_pop_pointer() : () -> i64
      %9808 = func.call @cc_cons(%9807, %9806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
      %9809 = arith.addi %9808, %__rlasp_stack_elide_zero_488 : i64
      %9810 = func.call @stack_pop_pointer() : () -> i64
      %9811 = func.call @cc_cons(%9810, %9809) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
      %9812 = arith.addi %9811, %__rlasp_stack_elide_zero_489 : i64
      %9813 = func.call @stack_pop_pointer() : () -> i64
      %9814 = func.call @cc_cons(%9813, %9812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
      %9815 = arith.addi %9814, %__rlasp_stack_elide_zero_490 : i64
      %9816 = func.call @stack_pop_pointer() : () -> i64
      %9817 = func.call @cc_cons(%9816, %9815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
      %9818 = arith.addi %9817, %__rlasp_stack_elide_zero_491 : i64
      %9819 = func.call @stack_pop_pointer() : () -> i64
      %9820 = func.call @cc_cons(%9819, %9818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
      %9821 = arith.addi %9820, %__rlasp_stack_elide_zero_492 : i64
      %9822 = func.call @stack_pop_pointer() : () -> i64
      %9823 = func.call @cc_cons(%9822, %9821) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
      %9824 = arith.addi %9823, %__rlasp_stack_elide_zero_493 : i64
      %9825 = func.call @stack_pop_pointer() : () -> i64
      %9826 = func.call @cc_cons(%9825, %9824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
      %9827 = arith.addi %9826, %__rlasp_stack_elide_zero_494 : i64
      %9828 = func.call @stack_pop_pointer() : () -> i64
      %9829 = func.call @cc_cons(%9828, %9827) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
      %9830 = arith.addi %9829, %__rlasp_stack_elide_zero_495 : i64
      %9831 = func.call @stack_pop_pointer() : () -> i64
      %9832 = func.call @cc_cons(%9831, %9830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
      %9833 = arith.addi %9832, %__rlasp_stack_elide_zero_496 : i64
      %9834 = func.call @stack_pop_pointer() : () -> i64
      %9835 = func.call @cc_cons(%9834, %9833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
      %9836 = arith.addi %9835, %__rlasp_stack_elide_zero_497 : i64
      %9837 = func.call @stack_pop_pointer() : () -> i64
      %9838 = func.call @cc_cons(%9837, %9836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
      %9839 = arith.addi %9838, %__rlasp_stack_elide_zero_498 : i64
      %9840 = func.call @stack_pop_pointer() : () -> i64
      %9841 = func.call @cc_cons(%9840, %9839) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
      %9842 = arith.addi %9841, %__rlasp_stack_elide_zero_499 : i64
      %9843 = func.call @stack_pop_pointer() : () -> i64
      %9844 = func.call @cc_cons(%9843, %9842) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
      %9845 = arith.addi %9844, %__rlasp_stack_elide_zero_500 : i64
      %9846 = func.call @stack_pop_pointer() : () -> i64
      %9847 = func.call @cc_cons(%9846, %9845) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
      %9848 = arith.addi %9847, %__rlasp_stack_elide_zero_501 : i64
      %9849 = func.call @stack_pop_pointer() : () -> i64
      %9850 = func.call @cc_cons(%9849, %9848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
      %9851 = arith.addi %9850, %__rlasp_stack_elide_zero_502 : i64
      %9852 = func.call @stack_pop_pointer() : () -> i64
      %9853 = func.call @cc_cons(%9852, %9851) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
      %9854 = arith.addi %9853, %__rlasp_stack_elide_zero_503 : i64
      %9855 = func.call @stack_pop_pointer() : () -> i64
      %9856 = func.call @cc_cons(%9855, %9854) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
      %9857 = arith.addi %9856, %__rlasp_stack_elide_zero_504 : i64
      %9858 = func.call @stack_pop_pointer() : () -> i64
      %9859 = func.call @cc_cons(%9858, %9857) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
      %9860 = arith.addi %9859, %__rlasp_stack_elide_zero_505 : i64
      %9861 = func.call @stack_pop_pointer() : () -> i64
      %9862 = func.call @cc_cons(%9861, %9860) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
      %9863 = arith.addi %9862, %__rlasp_stack_elide_zero_506 : i64
      %9864 = func.call @stack_pop_pointer() : () -> i64
      %9865 = func.call @cc_cons(%9864, %9863) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
      %9866 = arith.addi %9865, %__rlasp_stack_elide_zero_507 : i64
      %9867 = func.call @stack_pop_pointer() : () -> i64
      %9868 = func.call @cc_cons(%9867, %9866) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %9869 = arith.addi %9868, %__rlasp_stack_elide_zero_508 : i64
      %9870 = func.call @stack_pop_pointer() : () -> i64
      %9871 = func.call @cc_cons(%9870, %9869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %9872 = arith.addi %9871, %__rlasp_stack_elide_zero_509 : i64
      %9873 = func.call @stack_pop_pointer() : () -> i64
      %9874 = func.call @cc_cons(%9873, %9872) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %9875 = arith.addi %9874, %__rlasp_stack_elide_zero_510 : i64
      %9876 = func.call @stack_pop_pointer() : () -> i64
      %9877 = func.call @cc_cons(%9876, %9875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %9878 = arith.addi %9877, %__rlasp_stack_elide_zero_511 : i64
      %9879 = func.call @stack_pop_pointer() : () -> i64
      %9880 = func.call @cc_cons(%9879, %9878) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
      %9881 = arith.addi %9880, %__rlasp_stack_elide_zero_512 : i64
      %9882 = func.call @stack_pop_pointer() : () -> i64
      %9883 = func.call @cc_cons(%9882, %9881) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
      %9884 = arith.addi %9883, %__rlasp_stack_elide_zero_513 : i64
      %9885 = func.call @stack_pop_pointer() : () -> i64
      %9886 = func.call @cc_cons(%9885, %9884) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
      %9887 = arith.addi %9886, %__rlasp_stack_elide_zero_514 : i64
      %9888 = func.call @stack_pop_pointer() : () -> i64
      %9889 = func.call @cc_cons(%9888, %9887) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
      %9890 = arith.addi %9889, %__rlasp_stack_elide_zero_515 : i64
      %9891 = func.call @stack_pop_pointer() : () -> i64
      %9892 = func.call @cc_cons(%9891, %9890) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
      %9893 = arith.addi %9892, %__rlasp_stack_elide_zero_516 : i64
      %9894 = func.call @stack_pop_pointer() : () -> i64
      %9895 = func.call @cc_cons(%9894, %9893) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
      %9896 = arith.addi %9895, %__rlasp_stack_elide_zero_517 : i64
      %9897 = func.call @stack_pop_pointer() : () -> i64
      %9898 = func.call @cc_cons(%9897, %9896) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
      %9899 = arith.addi %9898, %__rlasp_stack_elide_zero_518 : i64
      %9900 = func.call @stack_pop_pointer() : () -> i64
      %9901 = func.call @cc_cons(%9900, %9899) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
      %9902 = arith.addi %9901, %__rlasp_stack_elide_zero_519 : i64
      %9903 = func.call @stack_pop_pointer() : () -> i64
      %9904 = func.call @cc_cons(%9903, %9902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9904) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9905 = func.call @stack_pop_pointer() : () -> i64
      %9906 = func.call @stack_pop_pointer() : () -> i64
      %9907 = func.call @cc_cons(%9906, %9905) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
      %9908 = arith.addi %9907, %__rlasp_stack_elide_zero_520 : i64
      %9909 = func.call @stack_pop_pointer() : () -> i64
      %9910 = func.call @cc_cons(%9909, %9908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9911 = func.call @stack_pop_pointer() : () -> i64
      %9912 = func.call @stack_pop_pointer() : () -> i64
      %9913 = func.call @cc_cons(%9912, %9911) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %9914 = arith.addi %9913, %__rlasp_stack_elide_zero_521 : i64
      %9915 = func.call @stack_pop_pointer() : () -> i64
      %9916 = func.call @cc_cons(%9915, %9914) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
      %9917 = arith.addi %9916, %__rlasp_stack_elide_zero_522 : i64
      %10309 = arith.constant 209815645192228 : i64
      %10310 = arith.constant 0 : i64
      %10311 = func.call @cc_make_closure(%10309, %10310) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
      %10312 = arith.addi %10311, %__rlasp_stack_elide_zero_523 : i64
      %10313 = llvm.mlir.addressof @str793 : !llvm.ptr
      %10314 = arith.constant 1 : i64
      %10315 = func.call @cc_make_string(%10313, %10314) : (!llvm.ptr, i64) -> i64
      %10316 = func.call @cc_nil_value() : () -> i64
      %10317 = func.call @cc_intern(%10315, %10316) : (i64, i64) -> i64
      %10318 = func.call @cc_nil_value() : () -> i64
      %10319 = func.call @cc_cons(%10317, %10318) : (i64, i64) -> i64
      %10320 = func.call @cc_values_pack(%10319) : (i64) -> i64
      func.call @stack_push_pointer(%10317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10321 = func.call @stack_pop_pointer() : () -> i64
      %10322 = func.call @stack_pop_pointer() : () -> i64
      %10323 = func.call @cc_cons(%10322, %10321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
      %10324 = arith.addi %10323, %__rlasp_stack_elide_zero_524 : i64
      %10325 = llvm.mlir.addressof @str794 : !llvm.ptr
      %10326 = arith.constant 11 : i64
      %10327 = func.call @cc_make_string(%10325, %10326) : (!llvm.ptr, i64) -> i64
      %10328 = llvm.mlir.addressof @str795 : !llvm.ptr
      %10329 = arith.constant 7 : i64
      %10330 = func.call @cc_make_string(%10328, %10329) : (!llvm.ptr, i64) -> i64
      %10331 = func.call @cc_intern(%10327, %10330) : (i64, i64) -> i64
      %10332 = func.call @cc_nil_value() : () -> i64
      %10333 = func.call @cc_cons(%10331, %10332) : (i64, i64) -> i64
      %10334 = func.call @cc_values_pack(%10333) : (i64) -> i64
      %10335 = func.call @cc_nil_value() : () -> i64
      %10336 = llvm.mlir.addressof @str796 : !llvm.ptr
      %10337 = arith.constant 4 : i64
      %10338 = func.call @cc_make_string(%10336, %10337) : (!llvm.ptr, i64) -> i64
      %10339 = llvm.mlir.addressof @str797 : !llvm.ptr
      %10340 = arith.constant 7 : i64
      %10341 = func.call @cc_make_string(%10339, %10340) : (!llvm.ptr, i64) -> i64
      %10342 = func.call @cc_intern(%10338, %10341) : (i64, i64) -> i64
      %10343 = func.call @cc_nil_value() : () -> i64
      %10344 = func.call @cc_cons(%10342, %10343) : (i64, i64) -> i64
      %10345 = func.call @cc_values_pack(%10344) : (i64) -> i64
      %10346 = llvm.mlir.addressof @str798 : !llvm.ptr
      %10347 = arith.constant 6 : i64
      %10348 = func.call @cc_make_string(%10346, %10347) : (!llvm.ptr, i64) -> i64
      %10349 = func.call @cc_nil_value() : () -> i64
      %10350 = func.call @cc_intern(%10348, %10349) : (i64, i64) -> i64
      %10351 = func.call @cc_nil_value() : () -> i64
      %10352 = func.call @cc_cons(%10350, %10351) : (i64, i64) -> i64
      %10353 = func.call @cc_values_pack(%10352) : (i64) -> i64
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %10354 = arith.addi %10350, %__rlasp_stack_elide_zero_525 : i64
      %10355 = func.call @cc_nil_value() : () -> i64
      %10356 = func.call @cc_errorp(%9705) : (i64) -> i64
      %10357 = arith.cmpi ne, %10356, %10355 : i64
      %10358 = arith.cmpi eq, %10355, %10355 : i64
      %10359 = arith.andi %10357, %10358 : i1
      %10360 = scf.if %10359 -> (i64) {
        scf.yield %9705 : i64
      } else {
        scf.yield %10355 : i64
      }
      %10361 = func.call @cc_errorp(%9917) : (i64) -> i64
      %10362 = arith.cmpi ne, %10361, %10355 : i64
      %10363 = arith.cmpi eq, %10360, %10355 : i64
      %10364 = arith.andi %10362, %10363 : i1
      %10365 = scf.if %10364 -> (i64) {
        scf.yield %9917 : i64
      } else {
        scf.yield %10360 : i64
      }
      %10366 = func.call @cc_errorp(%10312) : (i64) -> i64
      %10367 = arith.cmpi ne, %10366, %10355 : i64
      %10368 = arith.cmpi eq, %10365, %10355 : i64
      %10369 = arith.andi %10367, %10368 : i1
      %10370 = scf.if %10369 -> (i64) {
        scf.yield %10312 : i64
      } else {
        scf.yield %10365 : i64
      }
      %10371 = func.call @cc_errorp(%10324) : (i64) -> i64
      %10372 = arith.cmpi ne, %10371, %10355 : i64
      %10373 = arith.cmpi eq, %10370, %10355 : i64
      %10374 = arith.andi %10372, %10373 : i1
      %10375 = scf.if %10374 -> (i64) {
        scf.yield %10324 : i64
      } else {
        scf.yield %10370 : i64
      }
      %10376 = func.call @cc_errorp(%10331) : (i64) -> i64
      %10377 = arith.cmpi ne, %10376, %10355 : i64
      %10378 = arith.cmpi eq, %10375, %10355 : i64
      %10379 = arith.andi %10377, %10378 : i1
      %10380 = scf.if %10379 -> (i64) {
        scf.yield %10331 : i64
      } else {
        scf.yield %10375 : i64
      }
      %10381 = func.call @cc_errorp(%10335) : (i64) -> i64
      %10382 = arith.cmpi ne, %10381, %10355 : i64
      %10383 = arith.cmpi eq, %10380, %10355 : i64
      %10384 = arith.andi %10382, %10383 : i1
      %10385 = scf.if %10384 -> (i64) {
        scf.yield %10335 : i64
      } else {
        scf.yield %10380 : i64
      }
      %10386 = func.call @cc_errorp(%10342) : (i64) -> i64
      %10387 = arith.cmpi ne, %10386, %10355 : i64
      %10388 = arith.cmpi eq, %10385, %10355 : i64
      %10389 = arith.andi %10387, %10388 : i1
      %10390 = scf.if %10389 -> (i64) {
        scf.yield %10342 : i64
      } else {
        scf.yield %10385 : i64
      }
      %10391 = func.call @cc_errorp(%10354) : (i64) -> i64
      %10392 = arith.cmpi ne, %10391, %10355 : i64
      %10393 = arith.cmpi eq, %10390, %10355 : i64
      %10394 = arith.andi %10392, %10393 : i1
      %10395 = scf.if %10394 -> (i64) {
        scf.yield %10354 : i64
      } else {
        scf.yield %10390 : i64
      }
      %10396 = arith.cmpi ne, %10395, %10355 : i64
      scf.if %10396 {
        func.call @stack_push_pointer(%10395) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9705) : (i64) -> ()
        func.call @stack_push_pointer(%9917) : (i64) -> ()
        func.call @stack_push_pointer(%10312) : (i64) -> ()
        func.call @stack_push_pointer(%10324) : (i64) -> ()
        func.call @stack_push_pointer(%10331) : (i64) -> ()
        func.call @stack_push_pointer(%10335) : (i64) -> ()
        func.call @stack_push_pointer(%10342) : (i64) -> ()
        func.call @stack_push_pointer(%10354) : (i64) -> ()
        %10397 = llvm.mlir.addressof @str799 : !llvm.ptr
        %10398 = func.call @cc_make_function_ref_const(%10397) : (!llvm.ptr) -> i64
        %10399 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10398, %10399) : (i64, i64) -> ()
      }
      %10400 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10400 : i64
    }
    %10401 = func.call @cc_nil_value() : () -> i64
    %10402 = func.call @cc_errorp(%9696) : (i64) -> i64
    %10403 = arith.cmpi ne, %10402, %10401 : i64
    %10404 = scf.if %10403 -> (i64) {
      scf.yield %9696 : i64
    } else {
      %10405 = llvm.mlir.addressof @str800 : !llvm.ptr
      %10406 = arith.constant 24 : i64
      %10407 = func.call @cc_make_string(%10405, %10406) : (!llvm.ptr, i64) -> i64
      %10408 = func.call @cc_nil_value() : () -> i64
      %10409 = func.call @cc_intern(%10407, %10408) : (i64, i64) -> i64
      %10410 = func.call @cc_nil_value() : () -> i64
      %10411 = func.call @cc_cons(%10409, %10410) : (i64, i64) -> i64
      %10412 = func.call @cc_values_pack(%10411) : (i64) -> i64
      %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
      %10413 = arith.addi %10409, %__rlasp_stack_elide_zero_526 : i64
      %10414 = llvm.mlir.addressof @str801 : !llvm.ptr
      %10415 = arith.constant 3 : i64
      %10416 = func.call @cc_make_string(%10414, %10415) : (!llvm.ptr, i64) -> i64
      %10417 = func.call @cc_nil_value() : () -> i64
      %10418 = func.call @cc_intern(%10416, %10417) : (i64, i64) -> i64
      %10419 = func.call @cc_nil_value() : () -> i64
      %10420 = func.call @cc_cons(%10418, %10419) : (i64, i64) -> i64
      %10421 = func.call @cc_values_pack(%10420) : (i64) -> i64
      func.call @stack_push_pointer(%10418) : (i64) -> ()
      %10422 = llvm.mlir.addressof @str802 : !llvm.ptr
      %10423 = arith.constant 3 : i64
      %10424 = func.call @cc_make_string(%10422, %10423) : (!llvm.ptr, i64) -> i64
      %10425 = func.call @cc_nil_value() : () -> i64
      %10426 = func.call @cc_intern(%10424, %10425) : (i64, i64) -> i64
      %10427 = func.call @cc_nil_value() : () -> i64
      %10428 = func.call @cc_cons(%10426, %10427) : (i64, i64) -> i64
      %10429 = func.call @cc_values_pack(%10428) : (i64) -> i64
      func.call @stack_push_pointer(%10426) : (i64) -> ()
      %10430 = llvm.mlir.addressof @str803 : !llvm.ptr
      %10431 = arith.constant 4 : i64
      %10432 = func.call @cc_make_string(%10430, %10431) : (!llvm.ptr, i64) -> i64
      %10433 = llvm.mlir.addressof @str804 : !llvm.ptr
      %10434 = arith.constant 11 : i64
      %10435 = func.call @cc_make_string(%10433, %10434) : (!llvm.ptr, i64) -> i64
      %10436 = func.call @cc_intern(%10432, %10435) : (i64, i64) -> i64
      %10437 = func.call @cc_nil_value() : () -> i64
      %10438 = func.call @cc_cons(%10436, %10437) : (i64, i64) -> i64
      %10439 = func.call @cc_values_pack(%10438) : (i64) -> i64
      func.call @stack_push_pointer(%10436) : (i64) -> ()
      %10440 = arith.constant 8 : i64
      %10441 = func.call @cc_box_character(%10440) : (i64) -> i64
      func.call @stack_push_pointer(%10441) : (i64) -> ()
      %10442 = arith.constant 9 : i64
      %10443 = func.call @cc_box_character(%10442) : (i64) -> i64
      func.call @stack_push_pointer(%10443) : (i64) -> ()
      %10444 = arith.constant 10 : i64
      %10445 = func.call @cc_box_character(%10444) : (i64) -> i64
      func.call @stack_push_pointer(%10445) : (i64) -> ()
      %10446 = arith.constant 10 : i64
      %10447 = func.call @cc_box_character(%10446) : (i64) -> i64
      func.call @stack_push_pointer(%10447) : (i64) -> ()
      %10448 = arith.constant 12 : i64
      %10449 = func.call @cc_box_character(%10448) : (i64) -> i64
      func.call @stack_push_pointer(%10449) : (i64) -> ()
      %10450 = arith.constant 13 : i64
      %10451 = func.call @cc_box_character(%10450) : (i64) -> i64
      func.call @stack_push_pointer(%10451) : (i64) -> ()
      %10452 = arith.constant 32 : i64
      %10453 = func.call @cc_box_character(%10452) : (i64) -> i64
      func.call @stack_push_pointer(%10453) : (i64) -> ()
      %10454 = arith.constant 8 : i64
      %10455 = func.call @cc_box_character(%10454) : (i64) -> i64
      func.call @stack_push_pointer(%10455) : (i64) -> ()
      %10456 = arith.constant 9 : i64
      %10457 = func.call @cc_box_character(%10456) : (i64) -> i64
      func.call @stack_push_pointer(%10457) : (i64) -> ()
      %10458 = arith.constant 10 : i64
      %10459 = func.call @cc_box_character(%10458) : (i64) -> i64
      func.call @stack_push_pointer(%10459) : (i64) -> ()
      %10460 = arith.constant 10 : i64
      %10461 = func.call @cc_box_character(%10460) : (i64) -> i64
      func.call @stack_push_pointer(%10461) : (i64) -> ()
      %10462 = arith.constant 12 : i64
      %10463 = func.call @cc_box_character(%10462) : (i64) -> i64
      func.call @stack_push_pointer(%10463) : (i64) -> ()
      %10464 = arith.constant 13 : i64
      %10465 = func.call @cc_box_character(%10464) : (i64) -> i64
      func.call @stack_push_pointer(%10465) : (i64) -> ()
      %10466 = arith.constant 32 : i64
      %10467 = func.call @cc_box_character(%10466) : (i64) -> i64
      func.call @stack_push_pointer(%10467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10468 = func.call @stack_pop_pointer() : () -> i64
      %10469 = func.call @stack_pop_pointer() : () -> i64
      %10470 = func.call @cc_cons(%10469, %10468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
      %10471 = arith.addi %10470, %__rlasp_stack_elide_zero_527 : i64
      %10472 = func.call @stack_pop_pointer() : () -> i64
      %10473 = func.call @cc_cons(%10472, %10471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_528 = arith.constant 0 : i64
      %10474 = arith.addi %10473, %__rlasp_stack_elide_zero_528 : i64
      %10475 = func.call @stack_pop_pointer() : () -> i64
      %10476 = func.call @cc_cons(%10475, %10474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_529 = arith.constant 0 : i64
      %10477 = arith.addi %10476, %__rlasp_stack_elide_zero_529 : i64
      %10478 = func.call @stack_pop_pointer() : () -> i64
      %10479 = func.call @cc_cons(%10478, %10477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_530 = arith.constant 0 : i64
      %10480 = arith.addi %10479, %__rlasp_stack_elide_zero_530 : i64
      %10481 = func.call @stack_pop_pointer() : () -> i64
      %10482 = func.call @cc_cons(%10481, %10480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_531 = arith.constant 0 : i64
      %10483 = arith.addi %10482, %__rlasp_stack_elide_zero_531 : i64
      %10484 = func.call @stack_pop_pointer() : () -> i64
      %10485 = func.call @cc_cons(%10484, %10483) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_532 = arith.constant 0 : i64
      %10486 = arith.addi %10485, %__rlasp_stack_elide_zero_532 : i64
      %10487 = func.call @stack_pop_pointer() : () -> i64
      %10488 = func.call @cc_cons(%10487, %10486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_533 = arith.constant 0 : i64
      %10489 = arith.addi %10488, %__rlasp_stack_elide_zero_533 : i64
      %10490 = func.call @stack_pop_pointer() : () -> i64
      %10491 = func.call @cc_cons(%10490, %10489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_534 = arith.constant 0 : i64
      %10492 = arith.addi %10491, %__rlasp_stack_elide_zero_534 : i64
      %10493 = func.call @stack_pop_pointer() : () -> i64
      %10494 = func.call @cc_cons(%10493, %10492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_535 = arith.constant 0 : i64
      %10495 = arith.addi %10494, %__rlasp_stack_elide_zero_535 : i64
      %10496 = func.call @stack_pop_pointer() : () -> i64
      %10497 = func.call @cc_cons(%10496, %10495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_536 = arith.constant 0 : i64
      %10498 = arith.addi %10497, %__rlasp_stack_elide_zero_536 : i64
      %10499 = func.call @stack_pop_pointer() : () -> i64
      %10500 = func.call @cc_cons(%10499, %10498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_537 = arith.constant 0 : i64
      %10501 = arith.addi %10500, %__rlasp_stack_elide_zero_537 : i64
      %10502 = func.call @stack_pop_pointer() : () -> i64
      %10503 = func.call @cc_cons(%10502, %10501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_538 = arith.constant 0 : i64
      %10504 = arith.addi %10503, %__rlasp_stack_elide_zero_538 : i64
      %10505 = func.call @stack_pop_pointer() : () -> i64
      %10506 = func.call @cc_cons(%10505, %10504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_539 = arith.constant 0 : i64
      %10507 = arith.addi %10506, %__rlasp_stack_elide_zero_539 : i64
      %10508 = func.call @stack_pop_pointer() : () -> i64
      %10509 = func.call @cc_cons(%10508, %10507) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_540 = arith.constant 0 : i64
      %10510 = arith.addi %10509, %__rlasp_stack_elide_zero_540 : i64
      %10511 = func.call @stack_pop_pointer() : () -> i64
      %10512 = func.call @cc_cons(%10511, %10510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10512) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10513 = func.call @stack_pop_pointer() : () -> i64
      %10514 = func.call @stack_pop_pointer() : () -> i64
      %10515 = func.call @cc_cons(%10514, %10513) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_541 = arith.constant 0 : i64
      %10516 = arith.addi %10515, %__rlasp_stack_elide_zero_541 : i64
      %10517 = func.call @stack_pop_pointer() : () -> i64
      %10518 = func.call @cc_cons(%10517, %10516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10519 = func.call @stack_pop_pointer() : () -> i64
      %10520 = func.call @stack_pop_pointer() : () -> i64
      %10521 = func.call @cc_cons(%10520, %10519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_542 = arith.constant 0 : i64
      %10522 = arith.addi %10521, %__rlasp_stack_elide_zero_542 : i64
      %10523 = func.call @stack_pop_pointer() : () -> i64
      %10524 = func.call @cc_cons(%10523, %10522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_543 = arith.constant 0 : i64
      %10525 = arith.addi %10524, %__rlasp_stack_elide_zero_543 : i64
      %10697 = arith.constant 209815645192229 : i64
      %10698 = arith.constant 0 : i64
      %10699 = func.call @cc_make_closure(%10697, %10698) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_544 = arith.constant 0 : i64
      %10700 = arith.addi %10699, %__rlasp_stack_elide_zero_544 : i64
      %10701 = llvm.mlir.addressof @str805 : !llvm.ptr
      %10702 = arith.constant 1 : i64
      %10703 = func.call @cc_make_string(%10701, %10702) : (!llvm.ptr, i64) -> i64
      %10704 = func.call @cc_nil_value() : () -> i64
      %10705 = func.call @cc_intern(%10703, %10704) : (i64, i64) -> i64
      %10706 = func.call @cc_nil_value() : () -> i64
      %10707 = func.call @cc_cons(%10705, %10706) : (i64, i64) -> i64
      %10708 = func.call @cc_values_pack(%10707) : (i64) -> i64
      func.call @stack_push_pointer(%10705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10709 = func.call @stack_pop_pointer() : () -> i64
      %10710 = func.call @stack_pop_pointer() : () -> i64
      %10711 = func.call @cc_cons(%10710, %10709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_545 = arith.constant 0 : i64
      %10712 = arith.addi %10711, %__rlasp_stack_elide_zero_545 : i64
      %10713 = llvm.mlir.addressof @str806 : !llvm.ptr
      %10714 = arith.constant 11 : i64
      %10715 = func.call @cc_make_string(%10713, %10714) : (!llvm.ptr, i64) -> i64
      %10716 = llvm.mlir.addressof @str807 : !llvm.ptr
      %10717 = arith.constant 7 : i64
      %10718 = func.call @cc_make_string(%10716, %10717) : (!llvm.ptr, i64) -> i64
      %10719 = func.call @cc_intern(%10715, %10718) : (i64, i64) -> i64
      %10720 = func.call @cc_nil_value() : () -> i64
      %10721 = func.call @cc_cons(%10719, %10720) : (i64, i64) -> i64
      %10722 = func.call @cc_values_pack(%10721) : (i64) -> i64
      %10723 = func.call @cc_nil_value() : () -> i64
      %10724 = llvm.mlir.addressof @str808 : !llvm.ptr
      %10725 = arith.constant 4 : i64
      %10726 = func.call @cc_make_string(%10724, %10725) : (!llvm.ptr, i64) -> i64
      %10727 = llvm.mlir.addressof @str809 : !llvm.ptr
      %10728 = arith.constant 7 : i64
      %10729 = func.call @cc_make_string(%10727, %10728) : (!llvm.ptr, i64) -> i64
      %10730 = func.call @cc_intern(%10726, %10729) : (i64, i64) -> i64
      %10731 = func.call @cc_nil_value() : () -> i64
      %10732 = func.call @cc_cons(%10730, %10731) : (i64, i64) -> i64
      %10733 = func.call @cc_values_pack(%10732) : (i64) -> i64
      %10734 = llvm.mlir.addressof @str810 : !llvm.ptr
      %10735 = arith.constant 6 : i64
      %10736 = func.call @cc_make_string(%10734, %10735) : (!llvm.ptr, i64) -> i64
      %10737 = func.call @cc_nil_value() : () -> i64
      %10738 = func.call @cc_intern(%10736, %10737) : (i64, i64) -> i64
      %10739 = func.call @cc_nil_value() : () -> i64
      %10740 = func.call @cc_cons(%10738, %10739) : (i64, i64) -> i64
      %10741 = func.call @cc_values_pack(%10740) : (i64) -> i64
      %__rlasp_stack_elide_zero_546 = arith.constant 0 : i64
      %10742 = arith.addi %10738, %__rlasp_stack_elide_zero_546 : i64
      %10743 = func.call @cc_nil_value() : () -> i64
      %10744 = func.call @cc_errorp(%10413) : (i64) -> i64
      %10745 = arith.cmpi ne, %10744, %10743 : i64
      %10746 = arith.cmpi eq, %10743, %10743 : i64
      %10747 = arith.andi %10745, %10746 : i1
      %10748 = scf.if %10747 -> (i64) {
        scf.yield %10413 : i64
      } else {
        scf.yield %10743 : i64
      }
      %10749 = func.call @cc_errorp(%10525) : (i64) -> i64
      %10750 = arith.cmpi ne, %10749, %10743 : i64
      %10751 = arith.cmpi eq, %10748, %10743 : i64
      %10752 = arith.andi %10750, %10751 : i1
      %10753 = scf.if %10752 -> (i64) {
        scf.yield %10525 : i64
      } else {
        scf.yield %10748 : i64
      }
      %10754 = func.call @cc_errorp(%10700) : (i64) -> i64
      %10755 = arith.cmpi ne, %10754, %10743 : i64
      %10756 = arith.cmpi eq, %10753, %10743 : i64
      %10757 = arith.andi %10755, %10756 : i1
      %10758 = scf.if %10757 -> (i64) {
        scf.yield %10700 : i64
      } else {
        scf.yield %10753 : i64
      }
      %10759 = func.call @cc_errorp(%10712) : (i64) -> i64
      %10760 = arith.cmpi ne, %10759, %10743 : i64
      %10761 = arith.cmpi eq, %10758, %10743 : i64
      %10762 = arith.andi %10760, %10761 : i1
      %10763 = scf.if %10762 -> (i64) {
        scf.yield %10712 : i64
      } else {
        scf.yield %10758 : i64
      }
      %10764 = func.call @cc_errorp(%10719) : (i64) -> i64
      %10765 = arith.cmpi ne, %10764, %10743 : i64
      %10766 = arith.cmpi eq, %10763, %10743 : i64
      %10767 = arith.andi %10765, %10766 : i1
      %10768 = scf.if %10767 -> (i64) {
        scf.yield %10719 : i64
      } else {
        scf.yield %10763 : i64
      }
      %10769 = func.call @cc_errorp(%10723) : (i64) -> i64
      %10770 = arith.cmpi ne, %10769, %10743 : i64
      %10771 = arith.cmpi eq, %10768, %10743 : i64
      %10772 = arith.andi %10770, %10771 : i1
      %10773 = scf.if %10772 -> (i64) {
        scf.yield %10723 : i64
      } else {
        scf.yield %10768 : i64
      }
      %10774 = func.call @cc_errorp(%10730) : (i64) -> i64
      %10775 = arith.cmpi ne, %10774, %10743 : i64
      %10776 = arith.cmpi eq, %10773, %10743 : i64
      %10777 = arith.andi %10775, %10776 : i1
      %10778 = scf.if %10777 -> (i64) {
        scf.yield %10730 : i64
      } else {
        scf.yield %10773 : i64
      }
      %10779 = func.call @cc_errorp(%10742) : (i64) -> i64
      %10780 = arith.cmpi ne, %10779, %10743 : i64
      %10781 = arith.cmpi eq, %10778, %10743 : i64
      %10782 = arith.andi %10780, %10781 : i1
      %10783 = scf.if %10782 -> (i64) {
        scf.yield %10742 : i64
      } else {
        scf.yield %10778 : i64
      }
      %10784 = arith.cmpi ne, %10783, %10743 : i64
      scf.if %10784 {
        func.call @stack_push_pointer(%10783) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10413) : (i64) -> ()
        func.call @stack_push_pointer(%10525) : (i64) -> ()
        func.call @stack_push_pointer(%10700) : (i64) -> ()
        func.call @stack_push_pointer(%10712) : (i64) -> ()
        func.call @stack_push_pointer(%10719) : (i64) -> ()
        func.call @stack_push_pointer(%10723) : (i64) -> ()
        func.call @stack_push_pointer(%10730) : (i64) -> ()
        func.call @stack_push_pointer(%10742) : (i64) -> ()
        %10785 = llvm.mlir.addressof @str811 : !llvm.ptr
        %10786 = func.call @cc_make_function_ref_const(%10785) : (!llvm.ptr) -> i64
        %10787 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10786, %10787) : (i64, i64) -> ()
      }
      %10788 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10788 : i64
    }
    %10789 = func.call @cc_nil_value() : () -> i64
    %10790 = func.call @cc_errorp(%10404) : (i64) -> i64
    %10791 = arith.cmpi ne, %10790, %10789 : i64
    %10792 = scf.if %10791 -> (i64) {
      scf.yield %10404 : i64
    } else {
      %10793 = llvm.mlir.addressof @str812 : !llvm.ptr
      %10794 = arith.constant 28 : i64
      %10795 = func.call @cc_make_string(%10793, %10794) : (!llvm.ptr, i64) -> i64
      %10796 = func.call @cc_nil_value() : () -> i64
      %10797 = func.call @cc_intern(%10795, %10796) : (i64, i64) -> i64
      %10798 = func.call @cc_nil_value() : () -> i64
      %10799 = func.call @cc_cons(%10797, %10798) : (i64, i64) -> i64
      %10800 = func.call @cc_values_pack(%10799) : (i64) -> i64
      %__rlasp_stack_elide_zero_547 = arith.constant 0 : i64
      %10801 = arith.addi %10797, %__rlasp_stack_elide_zero_547 : i64
      %10802 = llvm.mlir.addressof @str813 : !llvm.ptr
      %10803 = arith.constant 3 : i64
      %10804 = func.call @cc_make_string(%10802, %10803) : (!llvm.ptr, i64) -> i64
      %10805 = func.call @cc_nil_value() : () -> i64
      %10806 = func.call @cc_intern(%10804, %10805) : (i64, i64) -> i64
      %10807 = func.call @cc_nil_value() : () -> i64
      %10808 = func.call @cc_cons(%10806, %10807) : (i64, i64) -> i64
      %10809 = func.call @cc_values_pack(%10808) : (i64) -> i64
      func.call @stack_push_pointer(%10806) : (i64) -> ()
      %10810 = llvm.mlir.addressof @str814 : !llvm.ptr
      %10811 = arith.constant 3 : i64
      %10812 = func.call @cc_make_string(%10810, %10811) : (!llvm.ptr, i64) -> i64
      %10813 = func.call @cc_nil_value() : () -> i64
      %10814 = func.call @cc_intern(%10812, %10813) : (i64, i64) -> i64
      %10815 = func.call @cc_nil_value() : () -> i64
      %10816 = func.call @cc_cons(%10814, %10815) : (i64, i64) -> i64
      %10817 = func.call @cc_values_pack(%10816) : (i64) -> i64
      func.call @stack_push_pointer(%10814) : (i64) -> ()
      %10818 = llvm.mlir.addressof @str815 : !llvm.ptr
      %10819 = arith.constant 4 : i64
      %10820 = func.call @cc_make_string(%10818, %10819) : (!llvm.ptr, i64) -> i64
      %10821 = llvm.mlir.addressof @str816 : !llvm.ptr
      %10822 = arith.constant 11 : i64
      %10823 = func.call @cc_make_string(%10821, %10822) : (!llvm.ptr, i64) -> i64
      %10824 = func.call @cc_intern(%10820, %10823) : (i64, i64) -> i64
      %10825 = func.call @cc_nil_value() : () -> i64
      %10826 = func.call @cc_cons(%10824, %10825) : (i64, i64) -> i64
      %10827 = func.call @cc_values_pack(%10826) : (i64) -> i64
      func.call @stack_push_pointer(%10824) : (i64) -> ()
      %10828 = arith.constant 0 : i64
      %10829 = func.call @cc_box_character(%10828) : (i64) -> i64
      func.call @stack_push_pointer(%10829) : (i64) -> ()
      %10830 = arith.constant 7 : i64
      %10831 = func.call @cc_box_character(%10830) : (i64) -> i64
      func.call @stack_push_pointer(%10831) : (i64) -> ()
      %10832 = arith.constant 27 : i64
      %10833 = func.call @cc_box_character(%10832) : (i64) -> i64
      func.call @stack_push_pointer(%10833) : (i64) -> ()
      %10834 = arith.constant 127 : i64
      %10835 = func.call @cc_box_character(%10834) : (i64) -> i64
      func.call @stack_push_pointer(%10835) : (i64) -> ()
      %10836 = arith.constant 0 : i64
      %10837 = func.call @cc_box_character(%10836) : (i64) -> i64
      func.call @stack_push_pointer(%10837) : (i64) -> ()
      %10838 = arith.constant 7 : i64
      %10839 = func.call @cc_box_character(%10838) : (i64) -> i64
      func.call @stack_push_pointer(%10839) : (i64) -> ()
      %10840 = arith.constant 27 : i64
      %10841 = func.call @cc_box_character(%10840) : (i64) -> i64
      func.call @stack_push_pointer(%10841) : (i64) -> ()
      %10842 = arith.constant 127 : i64
      %10843 = func.call @cc_box_character(%10842) : (i64) -> i64
      func.call @stack_push_pointer(%10843) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10844 = func.call @stack_pop_pointer() : () -> i64
      %10845 = func.call @stack_pop_pointer() : () -> i64
      %10846 = func.call @cc_cons(%10845, %10844) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_548 = arith.constant 0 : i64
      %10847 = arith.addi %10846, %__rlasp_stack_elide_zero_548 : i64
      %10848 = func.call @stack_pop_pointer() : () -> i64
      %10849 = func.call @cc_cons(%10848, %10847) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_549 = arith.constant 0 : i64
      %10850 = arith.addi %10849, %__rlasp_stack_elide_zero_549 : i64
      %10851 = func.call @stack_pop_pointer() : () -> i64
      %10852 = func.call @cc_cons(%10851, %10850) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_550 = arith.constant 0 : i64
      %10853 = arith.addi %10852, %__rlasp_stack_elide_zero_550 : i64
      %10854 = func.call @stack_pop_pointer() : () -> i64
      %10855 = func.call @cc_cons(%10854, %10853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_551 = arith.constant 0 : i64
      %10856 = arith.addi %10855, %__rlasp_stack_elide_zero_551 : i64
      %10857 = func.call @stack_pop_pointer() : () -> i64
      %10858 = func.call @cc_cons(%10857, %10856) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_552 = arith.constant 0 : i64
      %10859 = arith.addi %10858, %__rlasp_stack_elide_zero_552 : i64
      %10860 = func.call @stack_pop_pointer() : () -> i64
      %10861 = func.call @cc_cons(%10860, %10859) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_553 = arith.constant 0 : i64
      %10862 = arith.addi %10861, %__rlasp_stack_elide_zero_553 : i64
      %10863 = func.call @stack_pop_pointer() : () -> i64
      %10864 = func.call @cc_cons(%10863, %10862) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_554 = arith.constant 0 : i64
      %10865 = arith.addi %10864, %__rlasp_stack_elide_zero_554 : i64
      %10866 = func.call @stack_pop_pointer() : () -> i64
      %10867 = func.call @cc_cons(%10866, %10865) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_555 = arith.constant 0 : i64
      %10868 = arith.addi %10867, %__rlasp_stack_elide_zero_555 : i64
      %10869 = func.call @stack_pop_pointer() : () -> i64
      %10870 = func.call @cc_cons(%10869, %10868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10871 = func.call @stack_pop_pointer() : () -> i64
      %10872 = func.call @stack_pop_pointer() : () -> i64
      %10873 = func.call @cc_cons(%10872, %10871) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_556 = arith.constant 0 : i64
      %10874 = arith.addi %10873, %__rlasp_stack_elide_zero_556 : i64
      %10875 = func.call @stack_pop_pointer() : () -> i64
      %10876 = func.call @cc_cons(%10875, %10874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10876) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10877 = func.call @stack_pop_pointer() : () -> i64
      %10878 = func.call @stack_pop_pointer() : () -> i64
      %10879 = func.call @cc_cons(%10878, %10877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_557 = arith.constant 0 : i64
      %10880 = arith.addi %10879, %__rlasp_stack_elide_zero_557 : i64
      %10881 = func.call @stack_pop_pointer() : () -> i64
      %10882 = func.call @cc_cons(%10881, %10880) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_558 = arith.constant 0 : i64
      %10883 = arith.addi %10882, %__rlasp_stack_elide_zero_558 : i64
      %10989 = arith.constant 209815645192230 : i64
      %10990 = arith.constant 0 : i64
      %10991 = func.call @cc_make_closure(%10989, %10990) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_559 = arith.constant 0 : i64
      %10992 = arith.addi %10991, %__rlasp_stack_elide_zero_559 : i64
      %10993 = llvm.mlir.addressof @str817 : !llvm.ptr
      %10994 = arith.constant 1 : i64
      %10995 = func.call @cc_make_string(%10993, %10994) : (!llvm.ptr, i64) -> i64
      %10996 = func.call @cc_nil_value() : () -> i64
      %10997 = func.call @cc_intern(%10995, %10996) : (i64, i64) -> i64
      %10998 = func.call @cc_nil_value() : () -> i64
      %10999 = func.call @cc_cons(%10997, %10998) : (i64, i64) -> i64
      %11000 = func.call @cc_values_pack(%10999) : (i64) -> i64
      func.call @stack_push_pointer(%10997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11001 = func.call @stack_pop_pointer() : () -> i64
      %11002 = func.call @stack_pop_pointer() : () -> i64
      %11003 = func.call @cc_cons(%11002, %11001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_560 = arith.constant 0 : i64
      %11004 = arith.addi %11003, %__rlasp_stack_elide_zero_560 : i64
      %11005 = llvm.mlir.addressof @str818 : !llvm.ptr
      %11006 = arith.constant 11 : i64
      %11007 = func.call @cc_make_string(%11005, %11006) : (!llvm.ptr, i64) -> i64
      %11008 = llvm.mlir.addressof @str819 : !llvm.ptr
      %11009 = arith.constant 7 : i64
      %11010 = func.call @cc_make_string(%11008, %11009) : (!llvm.ptr, i64) -> i64
      %11011 = func.call @cc_intern(%11007, %11010) : (i64, i64) -> i64
      %11012 = func.call @cc_nil_value() : () -> i64
      %11013 = func.call @cc_cons(%11011, %11012) : (i64, i64) -> i64
      %11014 = func.call @cc_values_pack(%11013) : (i64) -> i64
      %11015 = func.call @cc_nil_value() : () -> i64
      %11016 = llvm.mlir.addressof @str820 : !llvm.ptr
      %11017 = arith.constant 4 : i64
      %11018 = func.call @cc_make_string(%11016, %11017) : (!llvm.ptr, i64) -> i64
      %11019 = llvm.mlir.addressof @str821 : !llvm.ptr
      %11020 = arith.constant 7 : i64
      %11021 = func.call @cc_make_string(%11019, %11020) : (!llvm.ptr, i64) -> i64
      %11022 = func.call @cc_intern(%11018, %11021) : (i64, i64) -> i64
      %11023 = func.call @cc_nil_value() : () -> i64
      %11024 = func.call @cc_cons(%11022, %11023) : (i64, i64) -> i64
      %11025 = func.call @cc_values_pack(%11024) : (i64) -> i64
      %11026 = llvm.mlir.addressof @str822 : !llvm.ptr
      %11027 = arith.constant 6 : i64
      %11028 = func.call @cc_make_string(%11026, %11027) : (!llvm.ptr, i64) -> i64
      %11029 = func.call @cc_nil_value() : () -> i64
      %11030 = func.call @cc_intern(%11028, %11029) : (i64, i64) -> i64
      %11031 = func.call @cc_nil_value() : () -> i64
      %11032 = func.call @cc_cons(%11030, %11031) : (i64, i64) -> i64
      %11033 = func.call @cc_values_pack(%11032) : (i64) -> i64
      %__rlasp_stack_elide_zero_561 = arith.constant 0 : i64
      %11034 = arith.addi %11030, %__rlasp_stack_elide_zero_561 : i64
      %11035 = func.call @cc_nil_value() : () -> i64
      %11036 = func.call @cc_errorp(%10801) : (i64) -> i64
      %11037 = arith.cmpi ne, %11036, %11035 : i64
      %11038 = arith.cmpi eq, %11035, %11035 : i64
      %11039 = arith.andi %11037, %11038 : i1
      %11040 = scf.if %11039 -> (i64) {
        scf.yield %10801 : i64
      } else {
        scf.yield %11035 : i64
      }
      %11041 = func.call @cc_errorp(%10883) : (i64) -> i64
      %11042 = arith.cmpi ne, %11041, %11035 : i64
      %11043 = arith.cmpi eq, %11040, %11035 : i64
      %11044 = arith.andi %11042, %11043 : i1
      %11045 = scf.if %11044 -> (i64) {
        scf.yield %10883 : i64
      } else {
        scf.yield %11040 : i64
      }
      %11046 = func.call @cc_errorp(%10992) : (i64) -> i64
      %11047 = arith.cmpi ne, %11046, %11035 : i64
      %11048 = arith.cmpi eq, %11045, %11035 : i64
      %11049 = arith.andi %11047, %11048 : i1
      %11050 = scf.if %11049 -> (i64) {
        scf.yield %10992 : i64
      } else {
        scf.yield %11045 : i64
      }
      %11051 = func.call @cc_errorp(%11004) : (i64) -> i64
      %11052 = arith.cmpi ne, %11051, %11035 : i64
      %11053 = arith.cmpi eq, %11050, %11035 : i64
      %11054 = arith.andi %11052, %11053 : i1
      %11055 = scf.if %11054 -> (i64) {
        scf.yield %11004 : i64
      } else {
        scf.yield %11050 : i64
      }
      %11056 = func.call @cc_errorp(%11011) : (i64) -> i64
      %11057 = arith.cmpi ne, %11056, %11035 : i64
      %11058 = arith.cmpi eq, %11055, %11035 : i64
      %11059 = arith.andi %11057, %11058 : i1
      %11060 = scf.if %11059 -> (i64) {
        scf.yield %11011 : i64
      } else {
        scf.yield %11055 : i64
      }
      %11061 = func.call @cc_errorp(%11015) : (i64) -> i64
      %11062 = arith.cmpi ne, %11061, %11035 : i64
      %11063 = arith.cmpi eq, %11060, %11035 : i64
      %11064 = arith.andi %11062, %11063 : i1
      %11065 = scf.if %11064 -> (i64) {
        scf.yield %11015 : i64
      } else {
        scf.yield %11060 : i64
      }
      %11066 = func.call @cc_errorp(%11022) : (i64) -> i64
      %11067 = arith.cmpi ne, %11066, %11035 : i64
      %11068 = arith.cmpi eq, %11065, %11035 : i64
      %11069 = arith.andi %11067, %11068 : i1
      %11070 = scf.if %11069 -> (i64) {
        scf.yield %11022 : i64
      } else {
        scf.yield %11065 : i64
      }
      %11071 = func.call @cc_errorp(%11034) : (i64) -> i64
      %11072 = arith.cmpi ne, %11071, %11035 : i64
      %11073 = arith.cmpi eq, %11070, %11035 : i64
      %11074 = arith.andi %11072, %11073 : i1
      %11075 = scf.if %11074 -> (i64) {
        scf.yield %11034 : i64
      } else {
        scf.yield %11070 : i64
      }
      %11076 = arith.cmpi ne, %11075, %11035 : i64
      scf.if %11076 {
        func.call @stack_push_pointer(%11075) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10801) : (i64) -> ()
        func.call @stack_push_pointer(%10883) : (i64) -> ()
        func.call @stack_push_pointer(%10992) : (i64) -> ()
        func.call @stack_push_pointer(%11004) : (i64) -> ()
        func.call @stack_push_pointer(%11011) : (i64) -> ()
        func.call @stack_push_pointer(%11015) : (i64) -> ()
        func.call @stack_push_pointer(%11022) : (i64) -> ()
        func.call @stack_push_pointer(%11034) : (i64) -> ()
        %11077 = llvm.mlir.addressof @str823 : !llvm.ptr
        %11078 = func.call @cc_make_function_ref_const(%11077) : (!llvm.ptr) -> i64
        %11079 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11078, %11079) : (i64, i64) -> ()
      }
      %11080 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11080 : i64
    }
    %__rlasp_stack_elide_zero_562 = arith.constant 0 : i64
    %11081 = arith.addi %10792, %__rlasp_stack_elide_zero_562 : i64
    %11082 = func.call @cc_multiple_value_list(%11081) : (i64) -> i64
    %11083 = llvm.mlir.addressof @str824 : !llvm.ptr
    %11084 = arith.constant 38 : i64
    %11085 = func.call @cc_make_string(%11083, %11084) : (!llvm.ptr, i64) -> i64
    %11086 = func.call @cc_nil_value() : () -> i64
    %11087 = func.call @cc_intern(%11085, %11086) : (i64, i64) -> i64
    %11088 = func.call @cc_nil_value() : () -> i64
    %11089 = func.call @cc_cons(%11087, %11088) : (i64, i64) -> i64
    %11090 = func.call @cc_values_pack(%11089) : (i64) -> i64
    %11091 = func.call @cc_symbol_value(%11087) : (i64) -> i64
    %11092 = llvm.mlir.addressof @str825 : !llvm.ptr
    %11093 = arith.constant 40 : i64
    %11094 = func.call @cc_make_string(%11092, %11093) : (!llvm.ptr, i64) -> i64
    %11095 = func.call @cc_nil_value() : () -> i64
    %11096 = func.call @cc_intern(%11094, %11095) : (i64, i64) -> i64
    %11097 = func.call @cc_nil_value() : () -> i64
    %11098 = func.call @cc_cons(%11096, %11097) : (i64, i64) -> i64
    %11099 = func.call @cc_values_pack(%11098) : (i64) -> i64
    %11100 = func.call @cc_symbol_value(%11096) : (i64) -> i64
    %11101 = func.call @cc_nil_value() : () -> i64
    %11102 = arith.cmpi ne, %11091, %11101 : i64
    %11103 = scf.if %11102 -> (i64) {
      scf.yield %11100 : i64
    } else {
      scf.yield %11082 : i64
    }
    %11104 = func.call @cc_values_pack(%11103) : (i64) -> i64
    func.call @stack_push_pointer(%11104) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192193"() {
    %82 = func.call @cc_nil_value() : () -> i64
    %83 = func.call @cc_nil_value() : () -> i64
    %84 = func.call @cc_errorp(%82) : (i64) -> i64
    %85 = arith.cmpi ne, %84, %83 : i64
    %86 = scf.if %85 -> (i64) {
      scf.yield %82 : i64
    } else {
      %87 = arith.constant 36 : i64
      %88 = func.call @cc_box_character(%87) : (i64) -> i64
      %__rlasp_stack_elide_zero_563 = arith.constant 0 : i64
      %89 = arith.addi %88, %__rlasp_stack_elide_zero_563 : i64
      func.call @stack_push_nil() : () -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_564 = arith.constant 0 : i64
      %92 = arith.addi %91, %__rlasp_stack_elide_zero_564 : i64
      %93 = func.call @cc_values_pack(%92) : (i64) -> i64
      %__rlasp_stack_elide_zero_565 = arith.constant 0 : i64
      %94 = arith.addi %93, %__rlasp_stack_elide_zero_565 : i64
      scf.yield %94 : i64
    }
    func.call @stack_push_pointer(%86) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192194"() {
    %263 = func.call @cc_nil_value() : () -> i64
    %264 = func.call @cc_nil_value() : () -> i64
    %265 = func.call @cc_errorp(%263) : (i64) -> i64
    %266 = arith.cmpi ne, %265, %264 : i64
    %267 = scf.if %266 -> (i64) {
      scf.yield %263 : i64
    } else {
      %268 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_nil_value() : () -> i64
      %271 = func.call @cc_errorp(%269) : (i64) -> i64
      %272 = arith.cmpi ne, %271, %270 : i64
      %273 = scf.if %272 -> (i64) {
        scf.yield %269 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %274 = func.call @cc_nil_value() : () -> i64
        %275 = arith.cmpi ne, %274, %274 : i64
        scf.if %275 {
          func.call @stack_push_pointer(%274) : (i64) -> ()
        } else {
          %276 = llvm.mlir.addressof @str22 : !llvm.ptr
          %277 = func.call @cc_make_function_ref_const(%276) : (!llvm.ptr) -> i64
          %278 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%277, %278) : (i64, i64) -> ()
        }
        %279 = func.call @stack_pop_pointer() : () -> i64
        %280 = func.call @cc_errorp(%279) : (i64) -> i64
        %281 = func.call @cc_nil_value() : () -> i64
        %282 = arith.cmpi ne, %280, %281 : i64
        scf.if %282 {
          func.call @stack_push_pointer(%279) : (i64) -> ()
        } else {
          %283 = func.call @cc_multiple_value_list(%279) : (i64) -> i64
          func.call @stack_push_pointer(%283) : (i64) -> ()
        }
        %284 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %285 = func.call @stack_pop_pointer() : () -> i64
        %286 = func.call @cc_nil_value() : () -> i64
        %287 = func.call @cc_maybe_error_from_multiple_value_list(%284) : (i64) -> i64
        %288 = func.call @cc_errorp(%287) : (i64) -> i64
        %289 = arith.cmpi ne, %288, %286 : i64
        %290 = arith.cmpi eq, %286, %286 : i64
        %291 = arith.andi %289, %290 : i1
        %292 = scf.if %291 -> (i64) {
          scf.yield %287 : i64
        } else {
          scf.yield %286 : i64
        }
        %293 = arith.cmpi ne, %292, %286 : i64
        scf.if %293 {
          func.call @stack_push_pointer(%292) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %294 = func.call @stack_pop_pointer() : () -> i64
          %295 = func.call @cc_cons(%285, %294) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_566 = arith.constant 0 : i64
          %296 = arith.addi %295, %__rlasp_stack_elide_zero_566 : i64
          %297 = func.call @cc_cons(%284, %296) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_567 = arith.constant 0 : i64
          %298 = arith.addi %297, %__rlasp_stack_elide_zero_567 : i64
          %299 = func.call @cc_values_pack(%298) : (i64) -> i64
          func.call @stack_push_pointer(%299) : (i64) -> ()
        }
        %300 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %300 : i64
      }
      %__rlasp_stack_elide_zero_568 = arith.constant 0 : i64
      %301 = arith.addi %273, %__rlasp_stack_elide_zero_568 : i64
      %302 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %303 = func.call @cc_errorp(%301) : (i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = arith.cmpi ne, %303, %304 : i64
      scf.if %305 {
        %306 = func.call @cc_condition_value(%301) : (i64) -> i64
        %307 = func.call @cc_values2(%304, %306) : (i64, i64) -> i64
        func.call @stack_push_pointer(%307) : (i64) -> ()
      } else {
        %308 = func.call @cc_multiple_value_list(%301) : (i64) -> i64
        %309 = func.call @cc_values_pack(%308) : (i64) -> i64
        func.call @stack_push_pointer(%309) : (i64) -> ()
      }
      %310 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %310 : i64
    }
    func.call @stack_push_pointer(%267) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192195"() {
    %490 = func.call @cc_nil_value() : () -> i64
    %491 = func.call @cc_nil_value() : () -> i64
    %492 = func.call @cc_errorp(%490) : (i64) -> i64
    %493 = arith.cmpi ne, %492, %491 : i64
    %494 = scf.if %493 -> (i64) {
      scf.yield %490 : i64
    } else {
      %495 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_nil_value() : () -> i64
      %498 = func.call @cc_errorp(%496) : (i64) -> i64
      %499 = arith.cmpi ne, %498, %497 : i64
      %500 = scf.if %499 -> (i64) {
        scf.yield %496 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %501 = func.call @cc_nil_value() : () -> i64
        %502 = arith.cmpi ne, %501, %501 : i64
        scf.if %502 {
          func.call @stack_push_pointer(%501) : (i64) -> ()
        } else {
          %503 = llvm.mlir.addressof @str39 : !llvm.ptr
          %504 = func.call @cc_make_function_ref_const(%503) : (!llvm.ptr) -> i64
          %505 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%504, %505) : (i64, i64) -> ()
        }
        %506 = func.call @stack_pop_pointer() : () -> i64
        %507 = func.call @cc_errorp(%506) : (i64) -> i64
        %508 = func.call @cc_nil_value() : () -> i64
        %509 = arith.cmpi ne, %507, %508 : i64
        scf.if %509 {
          func.call @stack_push_pointer(%506) : (i64) -> ()
        } else {
          %510 = func.call @cc_multiple_value_list(%506) : (i64) -> i64
          func.call @stack_push_pointer(%510) : (i64) -> ()
        }
        %511 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %512 = func.call @stack_pop_pointer() : () -> i64
        %513 = func.call @cc_nil_value() : () -> i64
        %514 = func.call @cc_maybe_error_from_multiple_value_list(%511) : (i64) -> i64
        %515 = func.call @cc_errorp(%514) : (i64) -> i64
        %516 = arith.cmpi ne, %515, %513 : i64
        %517 = arith.cmpi eq, %513, %513 : i64
        %518 = arith.andi %516, %517 : i1
        %519 = scf.if %518 -> (i64) {
          scf.yield %514 : i64
        } else {
          scf.yield %513 : i64
        }
        %520 = arith.cmpi ne, %519, %513 : i64
        scf.if %520 {
          func.call @stack_push_pointer(%519) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %521 = func.call @stack_pop_pointer() : () -> i64
          %522 = func.call @cc_cons(%512, %521) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_569 = arith.constant 0 : i64
          %523 = arith.addi %522, %__rlasp_stack_elide_zero_569 : i64
          %524 = func.call @cc_cons(%511, %523) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_570 = arith.constant 0 : i64
          %525 = arith.addi %524, %__rlasp_stack_elide_zero_570 : i64
          %526 = func.call @cc_values_pack(%525) : (i64) -> i64
          func.call @stack_push_pointer(%526) : (i64) -> ()
        }
        %527 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %527 : i64
      }
      %__rlasp_stack_elide_zero_571 = arith.constant 0 : i64
      %528 = arith.addi %500, %__rlasp_stack_elide_zero_571 : i64
      %529 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %530 = func.call @cc_errorp(%528) : (i64) -> i64
      %531 = func.call @cc_nil_value() : () -> i64
      %532 = arith.cmpi ne, %530, %531 : i64
      scf.if %532 {
        %533 = func.call @cc_condition_value(%528) : (i64) -> i64
        %534 = func.call @cc_values2(%531, %533) : (i64, i64) -> i64
        func.call @stack_push_pointer(%534) : (i64) -> ()
      } else {
        %535 = func.call @cc_multiple_value_list(%528) : (i64) -> i64
        %536 = func.call @cc_values_pack(%535) : (i64) -> i64
        func.call @stack_push_pointer(%536) : (i64) -> ()
      }
      %537 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %537 : i64
    }
    func.call @stack_push_pointer(%494) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192196"() {
    %717 = func.call @cc_nil_value() : () -> i64
    %718 = func.call @cc_nil_value() : () -> i64
    %719 = func.call @cc_errorp(%717) : (i64) -> i64
    %720 = arith.cmpi ne, %719, %718 : i64
    %721 = scf.if %720 -> (i64) {
      scf.yield %717 : i64
    } else {
      %722 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_nil_value() : () -> i64
      %725 = func.call @cc_errorp(%723) : (i64) -> i64
      %726 = arith.cmpi ne, %725, %724 : i64
      %727 = scf.if %726 -> (i64) {
        scf.yield %723 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %728 = func.call @cc_nil_value() : () -> i64
        %729 = arith.cmpi ne, %728, %728 : i64
        scf.if %729 {
          func.call @stack_push_pointer(%728) : (i64) -> ()
        } else {
          %730 = llvm.mlir.addressof @str56 : !llvm.ptr
          %731 = func.call @cc_make_function_ref_const(%730) : (!llvm.ptr) -> i64
          %732 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%731, %732) : (i64, i64) -> ()
        }
        %733 = func.call @stack_pop_pointer() : () -> i64
        %734 = func.call @cc_errorp(%733) : (i64) -> i64
        %735 = func.call @cc_nil_value() : () -> i64
        %736 = arith.cmpi ne, %734, %735 : i64
        scf.if %736 {
          func.call @stack_push_pointer(%733) : (i64) -> ()
        } else {
          %737 = func.call @cc_multiple_value_list(%733) : (i64) -> i64
          func.call @stack_push_pointer(%737) : (i64) -> ()
        }
        %738 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %739 = func.call @stack_pop_pointer() : () -> i64
        %740 = func.call @cc_nil_value() : () -> i64
        %741 = func.call @cc_maybe_error_from_multiple_value_list(%738) : (i64) -> i64
        %742 = func.call @cc_errorp(%741) : (i64) -> i64
        %743 = arith.cmpi ne, %742, %740 : i64
        %744 = arith.cmpi eq, %740, %740 : i64
        %745 = arith.andi %743, %744 : i1
        %746 = scf.if %745 -> (i64) {
          scf.yield %741 : i64
        } else {
          scf.yield %740 : i64
        }
        %747 = arith.cmpi ne, %746, %740 : i64
        scf.if %747 {
          func.call @stack_push_pointer(%746) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %748 = func.call @stack_pop_pointer() : () -> i64
          %749 = func.call @cc_cons(%739, %748) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_572 = arith.constant 0 : i64
          %750 = arith.addi %749, %__rlasp_stack_elide_zero_572 : i64
          %751 = func.call @cc_cons(%738, %750) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_573 = arith.constant 0 : i64
          %752 = arith.addi %751, %__rlasp_stack_elide_zero_573 : i64
          %753 = func.call @cc_values_pack(%752) : (i64) -> i64
          func.call @stack_push_pointer(%753) : (i64) -> ()
        }
        %754 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %754 : i64
      }
      %__rlasp_stack_elide_zero_574 = arith.constant 0 : i64
      %755 = arith.addi %727, %__rlasp_stack_elide_zero_574 : i64
      %756 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %757 = func.call @cc_errorp(%755) : (i64) -> i64
      %758 = func.call @cc_nil_value() : () -> i64
      %759 = arith.cmpi ne, %757, %758 : i64
      scf.if %759 {
        %760 = func.call @cc_condition_value(%755) : (i64) -> i64
        %761 = func.call @cc_values2(%758, %760) : (i64, i64) -> i64
        func.call @stack_push_pointer(%761) : (i64) -> ()
      } else {
        %762 = func.call @cc_multiple_value_list(%755) : (i64) -> i64
        %763 = func.call @cc_values_pack(%762) : (i64) -> i64
        func.call @stack_push_pointer(%763) : (i64) -> ()
      }
      %764 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %764 : i64
    }
    func.call @stack_push_pointer(%721) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192197"() {
    %944 = func.call @cc_nil_value() : () -> i64
    %945 = func.call @cc_nil_value() : () -> i64
    %946 = func.call @cc_errorp(%944) : (i64) -> i64
    %947 = arith.cmpi ne, %946, %945 : i64
    %948 = scf.if %947 -> (i64) {
      scf.yield %944 : i64
    } else {
      %949 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %950 = func.call @cc_nil_value() : () -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_errorp(%950) : (i64) -> i64
      %953 = arith.cmpi ne, %952, %951 : i64
      %954 = scf.if %953 -> (i64) {
        scf.yield %950 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %955 = func.call @cc_nil_value() : () -> i64
        %956 = arith.cmpi ne, %955, %955 : i64
        scf.if %956 {
          func.call @stack_push_pointer(%955) : (i64) -> ()
        } else {
          %957 = llvm.mlir.addressof @str73 : !llvm.ptr
          %958 = func.call @cc_make_function_ref_const(%957) : (!llvm.ptr) -> i64
          %959 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%958, %959) : (i64, i64) -> ()
        }
        %960 = func.call @stack_pop_pointer() : () -> i64
        %961 = func.call @cc_errorp(%960) : (i64) -> i64
        %962 = func.call @cc_nil_value() : () -> i64
        %963 = arith.cmpi ne, %961, %962 : i64
        scf.if %963 {
          func.call @stack_push_pointer(%960) : (i64) -> ()
        } else {
          %964 = func.call @cc_multiple_value_list(%960) : (i64) -> i64
          func.call @stack_push_pointer(%964) : (i64) -> ()
        }
        %965 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %966 = func.call @stack_pop_pointer() : () -> i64
        %967 = func.call @cc_nil_value() : () -> i64
        %968 = func.call @cc_maybe_error_from_multiple_value_list(%965) : (i64) -> i64
        %969 = func.call @cc_errorp(%968) : (i64) -> i64
        %970 = arith.cmpi ne, %969, %967 : i64
        %971 = arith.cmpi eq, %967, %967 : i64
        %972 = arith.andi %970, %971 : i1
        %973 = scf.if %972 -> (i64) {
          scf.yield %968 : i64
        } else {
          scf.yield %967 : i64
        }
        %974 = arith.cmpi ne, %973, %967 : i64
        scf.if %974 {
          func.call @stack_push_pointer(%973) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %975 = func.call @stack_pop_pointer() : () -> i64
          %976 = func.call @cc_cons(%966, %975) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_575 = arith.constant 0 : i64
          %977 = arith.addi %976, %__rlasp_stack_elide_zero_575 : i64
          %978 = func.call @cc_cons(%965, %977) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_576 = arith.constant 0 : i64
          %979 = arith.addi %978, %__rlasp_stack_elide_zero_576 : i64
          %980 = func.call @cc_values_pack(%979) : (i64) -> i64
          func.call @stack_push_pointer(%980) : (i64) -> ()
        }
        %981 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %981 : i64
      }
      %__rlasp_stack_elide_zero_577 = arith.constant 0 : i64
      %982 = arith.addi %954, %__rlasp_stack_elide_zero_577 : i64
      %983 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %984 = func.call @cc_errorp(%982) : (i64) -> i64
      %985 = func.call @cc_nil_value() : () -> i64
      %986 = arith.cmpi ne, %984, %985 : i64
      scf.if %986 {
        %987 = func.call @cc_condition_value(%982) : (i64) -> i64
        %988 = func.call @cc_values2(%985, %987) : (i64, i64) -> i64
        func.call @stack_push_pointer(%988) : (i64) -> ()
      } else {
        %989 = func.call @cc_multiple_value_list(%982) : (i64) -> i64
        %990 = func.call @cc_values_pack(%989) : (i64) -> i64
        func.call @stack_push_pointer(%990) : (i64) -> ()
      }
      %991 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %991 : i64
    }
    func.call @stack_push_pointer(%948) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192198"() {
    %1171 = func.call @cc_nil_value() : () -> i64
    %1172 = func.call @cc_nil_value() : () -> i64
    %1173 = func.call @cc_errorp(%1171) : (i64) -> i64
    %1174 = arith.cmpi ne, %1173, %1172 : i64
    %1175 = scf.if %1174 -> (i64) {
      scf.yield %1171 : i64
    } else {
      %1176 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1177 = func.call @cc_nil_value() : () -> i64
      %1178 = func.call @cc_nil_value() : () -> i64
      %1179 = func.call @cc_errorp(%1177) : (i64) -> i64
      %1180 = arith.cmpi ne, %1179, %1178 : i64
      %1181 = scf.if %1180 -> (i64) {
        scf.yield %1177 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1182 = func.call @cc_nil_value() : () -> i64
        %1183 = arith.cmpi ne, %1182, %1182 : i64
        scf.if %1183 {
          func.call @stack_push_pointer(%1182) : (i64) -> ()
        } else {
          %1184 = llvm.mlir.addressof @str90 : !llvm.ptr
          %1185 = func.call @cc_make_function_ref_const(%1184) : (!llvm.ptr) -> i64
          %1186 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1185, %1186) : (i64, i64) -> ()
        }
        %1187 = func.call @stack_pop_pointer() : () -> i64
        %1188 = func.call @cc_errorp(%1187) : (i64) -> i64
        %1189 = func.call @cc_nil_value() : () -> i64
        %1190 = arith.cmpi ne, %1188, %1189 : i64
        scf.if %1190 {
          func.call @stack_push_pointer(%1187) : (i64) -> ()
        } else {
          %1191 = func.call @cc_multiple_value_list(%1187) : (i64) -> i64
          func.call @stack_push_pointer(%1191) : (i64) -> ()
        }
        %1192 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1193 = func.call @stack_pop_pointer() : () -> i64
        %1194 = func.call @cc_nil_value() : () -> i64
        %1195 = func.call @cc_maybe_error_from_multiple_value_list(%1192) : (i64) -> i64
        %1196 = func.call @cc_errorp(%1195) : (i64) -> i64
        %1197 = arith.cmpi ne, %1196, %1194 : i64
        %1198 = arith.cmpi eq, %1194, %1194 : i64
        %1199 = arith.andi %1197, %1198 : i1
        %1200 = scf.if %1199 -> (i64) {
          scf.yield %1195 : i64
        } else {
          scf.yield %1194 : i64
        }
        %1201 = arith.cmpi ne, %1200, %1194 : i64
        scf.if %1201 {
          func.call @stack_push_pointer(%1200) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1202 = func.call @stack_pop_pointer() : () -> i64
          %1203 = func.call @cc_cons(%1193, %1202) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_578 = arith.constant 0 : i64
          %1204 = arith.addi %1203, %__rlasp_stack_elide_zero_578 : i64
          %1205 = func.call @cc_cons(%1192, %1204) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_579 = arith.constant 0 : i64
          %1206 = arith.addi %1205, %__rlasp_stack_elide_zero_579 : i64
          %1207 = func.call @cc_values_pack(%1206) : (i64) -> i64
          func.call @stack_push_pointer(%1207) : (i64) -> ()
        }
        %1208 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1208 : i64
      }
      %__rlasp_stack_elide_zero_580 = arith.constant 0 : i64
      %1209 = arith.addi %1181, %__rlasp_stack_elide_zero_580 : i64
      %1210 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1211 = func.call @cc_errorp(%1209) : (i64) -> i64
      %1212 = func.call @cc_nil_value() : () -> i64
      %1213 = arith.cmpi ne, %1211, %1212 : i64
      scf.if %1213 {
        %1214 = func.call @cc_condition_value(%1209) : (i64) -> i64
        %1215 = func.call @cc_values2(%1212, %1214) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1215) : (i64) -> ()
      } else {
        %1216 = func.call @cc_multiple_value_list(%1209) : (i64) -> i64
        %1217 = func.call @cc_values_pack(%1216) : (i64) -> i64
        func.call @stack_push_pointer(%1217) : (i64) -> ()
      }
      %1218 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1218 : i64
    }
    func.call @stack_push_pointer(%1175) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192199"() {
    %1398 = func.call @cc_nil_value() : () -> i64
    %1399 = func.call @cc_nil_value() : () -> i64
    %1400 = func.call @cc_errorp(%1398) : (i64) -> i64
    %1401 = arith.cmpi ne, %1400, %1399 : i64
    %1402 = scf.if %1401 -> (i64) {
      scf.yield %1398 : i64
    } else {
      %1403 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1404 = func.call @cc_nil_value() : () -> i64
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = func.call @cc_errorp(%1404) : (i64) -> i64
      %1407 = arith.cmpi ne, %1406, %1405 : i64
      %1408 = scf.if %1407 -> (i64) {
        scf.yield %1404 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1409 = func.call @cc_nil_value() : () -> i64
        %1410 = arith.cmpi ne, %1409, %1409 : i64
        scf.if %1410 {
          func.call @stack_push_pointer(%1409) : (i64) -> ()
        } else {
          %1411 = llvm.mlir.addressof @str107 : !llvm.ptr
          %1412 = func.call @cc_make_function_ref_const(%1411) : (!llvm.ptr) -> i64
          %1413 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1412, %1413) : (i64, i64) -> ()
        }
        %1414 = func.call @stack_pop_pointer() : () -> i64
        %1415 = func.call @cc_errorp(%1414) : (i64) -> i64
        %1416 = func.call @cc_nil_value() : () -> i64
        %1417 = arith.cmpi ne, %1415, %1416 : i64
        scf.if %1417 {
          func.call @stack_push_pointer(%1414) : (i64) -> ()
        } else {
          %1418 = func.call @cc_multiple_value_list(%1414) : (i64) -> i64
          func.call @stack_push_pointer(%1418) : (i64) -> ()
        }
        %1419 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1420 = func.call @stack_pop_pointer() : () -> i64
        %1421 = func.call @cc_nil_value() : () -> i64
        %1422 = func.call @cc_maybe_error_from_multiple_value_list(%1419) : (i64) -> i64
        %1423 = func.call @cc_errorp(%1422) : (i64) -> i64
        %1424 = arith.cmpi ne, %1423, %1421 : i64
        %1425 = arith.cmpi eq, %1421, %1421 : i64
        %1426 = arith.andi %1424, %1425 : i1
        %1427 = scf.if %1426 -> (i64) {
          scf.yield %1422 : i64
        } else {
          scf.yield %1421 : i64
        }
        %1428 = arith.cmpi ne, %1427, %1421 : i64
        scf.if %1428 {
          func.call @stack_push_pointer(%1427) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1429 = func.call @stack_pop_pointer() : () -> i64
          %1430 = func.call @cc_cons(%1420, %1429) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_581 = arith.constant 0 : i64
          %1431 = arith.addi %1430, %__rlasp_stack_elide_zero_581 : i64
          %1432 = func.call @cc_cons(%1419, %1431) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_582 = arith.constant 0 : i64
          %1433 = arith.addi %1432, %__rlasp_stack_elide_zero_582 : i64
          %1434 = func.call @cc_values_pack(%1433) : (i64) -> i64
          func.call @stack_push_pointer(%1434) : (i64) -> ()
        }
        %1435 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1435 : i64
      }
      %__rlasp_stack_elide_zero_583 = arith.constant 0 : i64
      %1436 = arith.addi %1408, %__rlasp_stack_elide_zero_583 : i64
      %1437 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1438 = func.call @cc_errorp(%1436) : (i64) -> i64
      %1439 = func.call @cc_nil_value() : () -> i64
      %1440 = arith.cmpi ne, %1438, %1439 : i64
      scf.if %1440 {
        %1441 = func.call @cc_condition_value(%1436) : (i64) -> i64
        %1442 = func.call @cc_values2(%1439, %1441) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1442) : (i64) -> ()
      } else {
        %1443 = func.call @cc_multiple_value_list(%1436) : (i64) -> i64
        %1444 = func.call @cc_values_pack(%1443) : (i64) -> i64
        func.call @stack_push_pointer(%1444) : (i64) -> ()
      }
      %1445 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1445 : i64
    }
    func.call @stack_push_pointer(%1402) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192200"() {
    %1625 = func.call @cc_nil_value() : () -> i64
    %1626 = func.call @cc_nil_value() : () -> i64
    %1627 = func.call @cc_errorp(%1625) : (i64) -> i64
    %1628 = arith.cmpi ne, %1627, %1626 : i64
    %1629 = scf.if %1628 -> (i64) {
      scf.yield %1625 : i64
    } else {
      %1630 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1631 = func.call @cc_nil_value() : () -> i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_errorp(%1631) : (i64) -> i64
      %1634 = arith.cmpi ne, %1633, %1632 : i64
      %1635 = scf.if %1634 -> (i64) {
        scf.yield %1631 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1636 = func.call @cc_nil_value() : () -> i64
        %1637 = arith.cmpi ne, %1636, %1636 : i64
        scf.if %1637 {
          func.call @stack_push_pointer(%1636) : (i64) -> ()
        } else {
          %1638 = llvm.mlir.addressof @str124 : !llvm.ptr
          %1639 = func.call @cc_make_function_ref_const(%1638) : (!llvm.ptr) -> i64
          %1640 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1639, %1640) : (i64, i64) -> ()
        }
        %1641 = func.call @stack_pop_pointer() : () -> i64
        %1642 = func.call @cc_errorp(%1641) : (i64) -> i64
        %1643 = func.call @cc_nil_value() : () -> i64
        %1644 = arith.cmpi ne, %1642, %1643 : i64
        scf.if %1644 {
          func.call @stack_push_pointer(%1641) : (i64) -> ()
        } else {
          %1645 = func.call @cc_multiple_value_list(%1641) : (i64) -> i64
          func.call @stack_push_pointer(%1645) : (i64) -> ()
        }
        %1646 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1647 = func.call @stack_pop_pointer() : () -> i64
        %1648 = func.call @cc_nil_value() : () -> i64
        %1649 = func.call @cc_maybe_error_from_multiple_value_list(%1646) : (i64) -> i64
        %1650 = func.call @cc_errorp(%1649) : (i64) -> i64
        %1651 = arith.cmpi ne, %1650, %1648 : i64
        %1652 = arith.cmpi eq, %1648, %1648 : i64
        %1653 = arith.andi %1651, %1652 : i1
        %1654 = scf.if %1653 -> (i64) {
          scf.yield %1649 : i64
        } else {
          scf.yield %1648 : i64
        }
        %1655 = arith.cmpi ne, %1654, %1648 : i64
        scf.if %1655 {
          func.call @stack_push_pointer(%1654) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1656 = func.call @stack_pop_pointer() : () -> i64
          %1657 = func.call @cc_cons(%1647, %1656) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_584 = arith.constant 0 : i64
          %1658 = arith.addi %1657, %__rlasp_stack_elide_zero_584 : i64
          %1659 = func.call @cc_cons(%1646, %1658) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_585 = arith.constant 0 : i64
          %1660 = arith.addi %1659, %__rlasp_stack_elide_zero_585 : i64
          %1661 = func.call @cc_values_pack(%1660) : (i64) -> i64
          func.call @stack_push_pointer(%1661) : (i64) -> ()
        }
        %1662 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1662 : i64
      }
      %__rlasp_stack_elide_zero_586 = arith.constant 0 : i64
      %1663 = arith.addi %1635, %__rlasp_stack_elide_zero_586 : i64
      %1664 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1665 = func.call @cc_errorp(%1663) : (i64) -> i64
      %1666 = func.call @cc_nil_value() : () -> i64
      %1667 = arith.cmpi ne, %1665, %1666 : i64
      scf.if %1667 {
        %1668 = func.call @cc_condition_value(%1663) : (i64) -> i64
        %1669 = func.call @cc_values2(%1666, %1668) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1669) : (i64) -> ()
      } else {
        %1670 = func.call @cc_multiple_value_list(%1663) : (i64) -> i64
        %1671 = func.call @cc_values_pack(%1670) : (i64) -> i64
        func.call @stack_push_pointer(%1671) : (i64) -> ()
      }
      %1672 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1672 : i64
    }
    func.call @stack_push_pointer(%1629) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192201"() {
    %1852 = func.call @cc_nil_value() : () -> i64
    %1853 = func.call @cc_nil_value() : () -> i64
    %1854 = func.call @cc_errorp(%1852) : (i64) -> i64
    %1855 = arith.cmpi ne, %1854, %1853 : i64
    %1856 = scf.if %1855 -> (i64) {
      scf.yield %1852 : i64
    } else {
      %1857 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1858 = func.call @cc_nil_value() : () -> i64
      %1859 = func.call @cc_nil_value() : () -> i64
      %1860 = func.call @cc_errorp(%1858) : (i64) -> i64
      %1861 = arith.cmpi ne, %1860, %1859 : i64
      %1862 = scf.if %1861 -> (i64) {
        scf.yield %1858 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1863 = func.call @cc_nil_value() : () -> i64
        %1864 = arith.cmpi ne, %1863, %1863 : i64
        scf.if %1864 {
          func.call @stack_push_pointer(%1863) : (i64) -> ()
        } else {
          %1865 = llvm.mlir.addressof @str141 : !llvm.ptr
          %1866 = func.call @cc_make_function_ref_const(%1865) : (!llvm.ptr) -> i64
          %1867 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1866, %1867) : (i64, i64) -> ()
        }
        %1868 = func.call @stack_pop_pointer() : () -> i64
        %1869 = func.call @cc_errorp(%1868) : (i64) -> i64
        %1870 = func.call @cc_nil_value() : () -> i64
        %1871 = arith.cmpi ne, %1869, %1870 : i64
        scf.if %1871 {
          func.call @stack_push_pointer(%1868) : (i64) -> ()
        } else {
          %1872 = func.call @cc_multiple_value_list(%1868) : (i64) -> i64
          func.call @stack_push_pointer(%1872) : (i64) -> ()
        }
        %1873 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1874 = func.call @stack_pop_pointer() : () -> i64
        %1875 = func.call @cc_nil_value() : () -> i64
        %1876 = func.call @cc_maybe_error_from_multiple_value_list(%1873) : (i64) -> i64
        %1877 = func.call @cc_errorp(%1876) : (i64) -> i64
        %1878 = arith.cmpi ne, %1877, %1875 : i64
        %1879 = arith.cmpi eq, %1875, %1875 : i64
        %1880 = arith.andi %1878, %1879 : i1
        %1881 = scf.if %1880 -> (i64) {
          scf.yield %1876 : i64
        } else {
          scf.yield %1875 : i64
        }
        %1882 = arith.cmpi ne, %1881, %1875 : i64
        scf.if %1882 {
          func.call @stack_push_pointer(%1881) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1883 = func.call @stack_pop_pointer() : () -> i64
          %1884 = func.call @cc_cons(%1874, %1883) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_587 = arith.constant 0 : i64
          %1885 = arith.addi %1884, %__rlasp_stack_elide_zero_587 : i64
          %1886 = func.call @cc_cons(%1873, %1885) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_588 = arith.constant 0 : i64
          %1887 = arith.addi %1886, %__rlasp_stack_elide_zero_588 : i64
          %1888 = func.call @cc_values_pack(%1887) : (i64) -> i64
          func.call @stack_push_pointer(%1888) : (i64) -> ()
        }
        %1889 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1889 : i64
      }
      %__rlasp_stack_elide_zero_589 = arith.constant 0 : i64
      %1890 = arith.addi %1862, %__rlasp_stack_elide_zero_589 : i64
      %1891 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1892 = func.call @cc_errorp(%1890) : (i64) -> i64
      %1893 = func.call @cc_nil_value() : () -> i64
      %1894 = arith.cmpi ne, %1892, %1893 : i64
      scf.if %1894 {
        %1895 = func.call @cc_condition_value(%1890) : (i64) -> i64
        %1896 = func.call @cc_values2(%1893, %1895) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1896) : (i64) -> ()
      } else {
        %1897 = func.call @cc_multiple_value_list(%1890) : (i64) -> i64
        %1898 = func.call @cc_values_pack(%1897) : (i64) -> i64
        func.call @stack_push_pointer(%1898) : (i64) -> ()
      }
      %1899 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1899 : i64
    }
    func.call @stack_push_pointer(%1856) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192202"() {
    %2079 = func.call @cc_nil_value() : () -> i64
    %2080 = func.call @cc_nil_value() : () -> i64
    %2081 = func.call @cc_errorp(%2079) : (i64) -> i64
    %2082 = arith.cmpi ne, %2081, %2080 : i64
    %2083 = scf.if %2082 -> (i64) {
      scf.yield %2079 : i64
    } else {
      %2084 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2085 = func.call @cc_nil_value() : () -> i64
      %2086 = func.call @cc_nil_value() : () -> i64
      %2087 = func.call @cc_errorp(%2085) : (i64) -> i64
      %2088 = arith.cmpi ne, %2087, %2086 : i64
      %2089 = scf.if %2088 -> (i64) {
        scf.yield %2085 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2090 = func.call @cc_nil_value() : () -> i64
        %2091 = arith.cmpi ne, %2090, %2090 : i64
        scf.if %2091 {
          func.call @stack_push_pointer(%2090) : (i64) -> ()
        } else {
          %2092 = llvm.mlir.addressof @str158 : !llvm.ptr
          %2093 = func.call @cc_make_function_ref_const(%2092) : (!llvm.ptr) -> i64
          %2094 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2093, %2094) : (i64, i64) -> ()
        }
        %2095 = func.call @stack_pop_pointer() : () -> i64
        %2096 = func.call @cc_errorp(%2095) : (i64) -> i64
        %2097 = func.call @cc_nil_value() : () -> i64
        %2098 = arith.cmpi ne, %2096, %2097 : i64
        scf.if %2098 {
          func.call @stack_push_pointer(%2095) : (i64) -> ()
        } else {
          %2099 = func.call @cc_multiple_value_list(%2095) : (i64) -> i64
          func.call @stack_push_pointer(%2099) : (i64) -> ()
        }
        %2100 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2101 = func.call @stack_pop_pointer() : () -> i64
        %2102 = func.call @cc_nil_value() : () -> i64
        %2103 = func.call @cc_maybe_error_from_multiple_value_list(%2100) : (i64) -> i64
        %2104 = func.call @cc_errorp(%2103) : (i64) -> i64
        %2105 = arith.cmpi ne, %2104, %2102 : i64
        %2106 = arith.cmpi eq, %2102, %2102 : i64
        %2107 = arith.andi %2105, %2106 : i1
        %2108 = scf.if %2107 -> (i64) {
          scf.yield %2103 : i64
        } else {
          scf.yield %2102 : i64
        }
        %2109 = arith.cmpi ne, %2108, %2102 : i64
        scf.if %2109 {
          func.call @stack_push_pointer(%2108) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2110 = func.call @stack_pop_pointer() : () -> i64
          %2111 = func.call @cc_cons(%2101, %2110) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_590 = arith.constant 0 : i64
          %2112 = arith.addi %2111, %__rlasp_stack_elide_zero_590 : i64
          %2113 = func.call @cc_cons(%2100, %2112) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_591 = arith.constant 0 : i64
          %2114 = arith.addi %2113, %__rlasp_stack_elide_zero_591 : i64
          %2115 = func.call @cc_values_pack(%2114) : (i64) -> i64
          func.call @stack_push_pointer(%2115) : (i64) -> ()
        }
        %2116 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2116 : i64
      }
      %__rlasp_stack_elide_zero_592 = arith.constant 0 : i64
      %2117 = arith.addi %2089, %__rlasp_stack_elide_zero_592 : i64
      %2118 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2119 = func.call @cc_errorp(%2117) : (i64) -> i64
      %2120 = func.call @cc_nil_value() : () -> i64
      %2121 = arith.cmpi ne, %2119, %2120 : i64
      scf.if %2121 {
        %2122 = func.call @cc_condition_value(%2117) : (i64) -> i64
        %2123 = func.call @cc_values2(%2120, %2122) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2123) : (i64) -> ()
      } else {
        %2124 = func.call @cc_multiple_value_list(%2117) : (i64) -> i64
        %2125 = func.call @cc_values_pack(%2124) : (i64) -> i64
        func.call @stack_push_pointer(%2125) : (i64) -> ()
      }
      %2126 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2126 : i64
    }
    func.call @stack_push_pointer(%2083) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192203"() {
    %2306 = func.call @cc_nil_value() : () -> i64
    %2307 = func.call @cc_nil_value() : () -> i64
    %2308 = func.call @cc_errorp(%2306) : (i64) -> i64
    %2309 = arith.cmpi ne, %2308, %2307 : i64
    %2310 = scf.if %2309 -> (i64) {
      scf.yield %2306 : i64
    } else {
      %2311 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2312 = func.call @cc_nil_value() : () -> i64
      %2313 = func.call @cc_nil_value() : () -> i64
      %2314 = func.call @cc_errorp(%2312) : (i64) -> i64
      %2315 = arith.cmpi ne, %2314, %2313 : i64
      %2316 = scf.if %2315 -> (i64) {
        scf.yield %2312 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2317 = func.call @cc_nil_value() : () -> i64
        %2318 = arith.cmpi ne, %2317, %2317 : i64
        scf.if %2318 {
          func.call @stack_push_pointer(%2317) : (i64) -> ()
        } else {
          %2319 = llvm.mlir.addressof @str175 : !llvm.ptr
          %2320 = func.call @cc_make_function_ref_const(%2319) : (!llvm.ptr) -> i64
          %2321 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2320, %2321) : (i64, i64) -> ()
        }
        %2322 = func.call @stack_pop_pointer() : () -> i64
        %2323 = func.call @cc_errorp(%2322) : (i64) -> i64
        %2324 = func.call @cc_nil_value() : () -> i64
        %2325 = arith.cmpi ne, %2323, %2324 : i64
        scf.if %2325 {
          func.call @stack_push_pointer(%2322) : (i64) -> ()
        } else {
          %2326 = func.call @cc_multiple_value_list(%2322) : (i64) -> i64
          func.call @stack_push_pointer(%2326) : (i64) -> ()
        }
        %2327 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2328 = func.call @stack_pop_pointer() : () -> i64
        %2329 = func.call @cc_nil_value() : () -> i64
        %2330 = func.call @cc_maybe_error_from_multiple_value_list(%2327) : (i64) -> i64
        %2331 = func.call @cc_errorp(%2330) : (i64) -> i64
        %2332 = arith.cmpi ne, %2331, %2329 : i64
        %2333 = arith.cmpi eq, %2329, %2329 : i64
        %2334 = arith.andi %2332, %2333 : i1
        %2335 = scf.if %2334 -> (i64) {
          scf.yield %2330 : i64
        } else {
          scf.yield %2329 : i64
        }
        %2336 = arith.cmpi ne, %2335, %2329 : i64
        scf.if %2336 {
          func.call @stack_push_pointer(%2335) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2337 = func.call @stack_pop_pointer() : () -> i64
          %2338 = func.call @cc_cons(%2328, %2337) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_593 = arith.constant 0 : i64
          %2339 = arith.addi %2338, %__rlasp_stack_elide_zero_593 : i64
          %2340 = func.call @cc_cons(%2327, %2339) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_594 = arith.constant 0 : i64
          %2341 = arith.addi %2340, %__rlasp_stack_elide_zero_594 : i64
          %2342 = func.call @cc_values_pack(%2341) : (i64) -> i64
          func.call @stack_push_pointer(%2342) : (i64) -> ()
        }
        %2343 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2343 : i64
      }
      %__rlasp_stack_elide_zero_595 = arith.constant 0 : i64
      %2344 = arith.addi %2316, %__rlasp_stack_elide_zero_595 : i64
      %2345 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2346 = func.call @cc_errorp(%2344) : (i64) -> i64
      %2347 = func.call @cc_nil_value() : () -> i64
      %2348 = arith.cmpi ne, %2346, %2347 : i64
      scf.if %2348 {
        %2349 = func.call @cc_condition_value(%2344) : (i64) -> i64
        %2350 = func.call @cc_values2(%2347, %2349) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2350) : (i64) -> ()
      } else {
        %2351 = func.call @cc_multiple_value_list(%2344) : (i64) -> i64
        %2352 = func.call @cc_values_pack(%2351) : (i64) -> i64
        func.call @stack_push_pointer(%2352) : (i64) -> ()
      }
      %2353 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2353 : i64
    }
    func.call @stack_push_pointer(%2310) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192204"() {
    %2533 = func.call @cc_nil_value() : () -> i64
    %2534 = func.call @cc_nil_value() : () -> i64
    %2535 = func.call @cc_errorp(%2533) : (i64) -> i64
    %2536 = arith.cmpi ne, %2535, %2534 : i64
    %2537 = scf.if %2536 -> (i64) {
      scf.yield %2533 : i64
    } else {
      %2538 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2539 = func.call @cc_nil_value() : () -> i64
      %2540 = func.call @cc_nil_value() : () -> i64
      %2541 = func.call @cc_errorp(%2539) : (i64) -> i64
      %2542 = arith.cmpi ne, %2541, %2540 : i64
      %2543 = scf.if %2542 -> (i64) {
        scf.yield %2539 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2544 = func.call @cc_nil_value() : () -> i64
        %2545 = arith.cmpi ne, %2544, %2544 : i64
        scf.if %2545 {
          func.call @stack_push_pointer(%2544) : (i64) -> ()
        } else {
          %2546 = llvm.mlir.addressof @str192 : !llvm.ptr
          %2547 = func.call @cc_make_function_ref_const(%2546) : (!llvm.ptr) -> i64
          %2548 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2547, %2548) : (i64, i64) -> ()
        }
        %2549 = func.call @stack_pop_pointer() : () -> i64
        %2550 = func.call @cc_errorp(%2549) : (i64) -> i64
        %2551 = func.call @cc_nil_value() : () -> i64
        %2552 = arith.cmpi ne, %2550, %2551 : i64
        scf.if %2552 {
          func.call @stack_push_pointer(%2549) : (i64) -> ()
        } else {
          %2553 = func.call @cc_multiple_value_list(%2549) : (i64) -> i64
          func.call @stack_push_pointer(%2553) : (i64) -> ()
        }
        %2554 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2555 = func.call @stack_pop_pointer() : () -> i64
        %2556 = func.call @cc_nil_value() : () -> i64
        %2557 = func.call @cc_maybe_error_from_multiple_value_list(%2554) : (i64) -> i64
        %2558 = func.call @cc_errorp(%2557) : (i64) -> i64
        %2559 = arith.cmpi ne, %2558, %2556 : i64
        %2560 = arith.cmpi eq, %2556, %2556 : i64
        %2561 = arith.andi %2559, %2560 : i1
        %2562 = scf.if %2561 -> (i64) {
          scf.yield %2557 : i64
        } else {
          scf.yield %2556 : i64
        }
        %2563 = arith.cmpi ne, %2562, %2556 : i64
        scf.if %2563 {
          func.call @stack_push_pointer(%2562) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2564 = func.call @stack_pop_pointer() : () -> i64
          %2565 = func.call @cc_cons(%2555, %2564) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_596 = arith.constant 0 : i64
          %2566 = arith.addi %2565, %__rlasp_stack_elide_zero_596 : i64
          %2567 = func.call @cc_cons(%2554, %2566) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_597 = arith.constant 0 : i64
          %2568 = arith.addi %2567, %__rlasp_stack_elide_zero_597 : i64
          %2569 = func.call @cc_values_pack(%2568) : (i64) -> i64
          func.call @stack_push_pointer(%2569) : (i64) -> ()
        }
        %2570 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2570 : i64
      }
      %__rlasp_stack_elide_zero_598 = arith.constant 0 : i64
      %2571 = arith.addi %2543, %__rlasp_stack_elide_zero_598 : i64
      %2572 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2573 = func.call @cc_errorp(%2571) : (i64) -> i64
      %2574 = func.call @cc_nil_value() : () -> i64
      %2575 = arith.cmpi ne, %2573, %2574 : i64
      scf.if %2575 {
        %2576 = func.call @cc_condition_value(%2571) : (i64) -> i64
        %2577 = func.call @cc_values2(%2574, %2576) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2577) : (i64) -> ()
      } else {
        %2578 = func.call @cc_multiple_value_list(%2571) : (i64) -> i64
        %2579 = func.call @cc_values_pack(%2578) : (i64) -> i64
        func.call @stack_push_pointer(%2579) : (i64) -> ()
      }
      %2580 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2580 : i64
    }
    func.call @stack_push_pointer(%2537) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192205"() {
    %2760 = func.call @cc_nil_value() : () -> i64
    %2761 = func.call @cc_nil_value() : () -> i64
    %2762 = func.call @cc_errorp(%2760) : (i64) -> i64
    %2763 = arith.cmpi ne, %2762, %2761 : i64
    %2764 = scf.if %2763 -> (i64) {
      scf.yield %2760 : i64
    } else {
      %2765 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2766 = func.call @cc_nil_value() : () -> i64
      %2767 = func.call @cc_nil_value() : () -> i64
      %2768 = func.call @cc_errorp(%2766) : (i64) -> i64
      %2769 = arith.cmpi ne, %2768, %2767 : i64
      %2770 = scf.if %2769 -> (i64) {
        scf.yield %2766 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2771 = func.call @cc_nil_value() : () -> i64
        %2772 = arith.cmpi ne, %2771, %2771 : i64
        scf.if %2772 {
          func.call @stack_push_pointer(%2771) : (i64) -> ()
        } else {
          %2773 = llvm.mlir.addressof @str209 : !llvm.ptr
          %2774 = func.call @cc_make_function_ref_const(%2773) : (!llvm.ptr) -> i64
          %2775 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2774, %2775) : (i64, i64) -> ()
        }
        %2776 = func.call @stack_pop_pointer() : () -> i64
        %2777 = func.call @cc_errorp(%2776) : (i64) -> i64
        %2778 = func.call @cc_nil_value() : () -> i64
        %2779 = arith.cmpi ne, %2777, %2778 : i64
        scf.if %2779 {
          func.call @stack_push_pointer(%2776) : (i64) -> ()
        } else {
          %2780 = func.call @cc_multiple_value_list(%2776) : (i64) -> i64
          func.call @stack_push_pointer(%2780) : (i64) -> ()
        }
        %2781 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2782 = func.call @stack_pop_pointer() : () -> i64
        %2783 = func.call @cc_nil_value() : () -> i64
        %2784 = func.call @cc_maybe_error_from_multiple_value_list(%2781) : (i64) -> i64
        %2785 = func.call @cc_errorp(%2784) : (i64) -> i64
        %2786 = arith.cmpi ne, %2785, %2783 : i64
        %2787 = arith.cmpi eq, %2783, %2783 : i64
        %2788 = arith.andi %2786, %2787 : i1
        %2789 = scf.if %2788 -> (i64) {
          scf.yield %2784 : i64
        } else {
          scf.yield %2783 : i64
        }
        %2790 = arith.cmpi ne, %2789, %2783 : i64
        scf.if %2790 {
          func.call @stack_push_pointer(%2789) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2791 = func.call @stack_pop_pointer() : () -> i64
          %2792 = func.call @cc_cons(%2782, %2791) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_599 = arith.constant 0 : i64
          %2793 = arith.addi %2792, %__rlasp_stack_elide_zero_599 : i64
          %2794 = func.call @cc_cons(%2781, %2793) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_600 = arith.constant 0 : i64
          %2795 = arith.addi %2794, %__rlasp_stack_elide_zero_600 : i64
          %2796 = func.call @cc_values_pack(%2795) : (i64) -> i64
          func.call @stack_push_pointer(%2796) : (i64) -> ()
        }
        %2797 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2797 : i64
      }
      %__rlasp_stack_elide_zero_601 = arith.constant 0 : i64
      %2798 = arith.addi %2770, %__rlasp_stack_elide_zero_601 : i64
      %2799 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2800 = func.call @cc_errorp(%2798) : (i64) -> i64
      %2801 = func.call @cc_nil_value() : () -> i64
      %2802 = arith.cmpi ne, %2800, %2801 : i64
      scf.if %2802 {
        %2803 = func.call @cc_condition_value(%2798) : (i64) -> i64
        %2804 = func.call @cc_values2(%2801, %2803) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2804) : (i64) -> ()
      } else {
        %2805 = func.call @cc_multiple_value_list(%2798) : (i64) -> i64
        %2806 = func.call @cc_values_pack(%2805) : (i64) -> i64
        func.call @stack_push_pointer(%2806) : (i64) -> ()
      }
      %2807 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2807 : i64
    }
    func.call @stack_push_pointer(%2764) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192206"() {
    %3003 = func.call @cc_nil_value() : () -> i64
    %3004 = func.call @cc_nil_value() : () -> i64
    %3005 = func.call @cc_errorp(%3003) : (i64) -> i64
    %3006 = arith.cmpi ne, %3005, %3004 : i64
    %3007 = scf.if %3006 -> (i64) {
      scf.yield %3003 : i64
    } else {
      %3008 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3009 = func.call @cc_nil_value() : () -> i64
      %3010 = func.call @cc_nil_value() : () -> i64
      %3011 = func.call @cc_errorp(%3009) : (i64) -> i64
      %3012 = arith.cmpi ne, %3011, %3010 : i64
      %3013 = scf.if %3012 -> (i64) {
        scf.yield %3009 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3014 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3014) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3015 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_602 = arith.constant 0 : i64
        %3016 = arith.addi %3015, %__rlasp_stack_elide_zero_602 : i64
        %3017 = func.call @cc_nil_value() : () -> i64
        %3018 = func.call @cc_errorp(%3016) : (i64) -> i64
        %3019 = arith.cmpi ne, %3018, %3017 : i64
        %3020 = arith.cmpi eq, %3017, %3017 : i64
        %3021 = arith.andi %3019, %3020 : i1
        %3022 = scf.if %3021 -> (i64) {
          scf.yield %3016 : i64
        } else {
          scf.yield %3017 : i64
        }
        %3023 = arith.cmpi ne, %3022, %3017 : i64
        scf.if %3023 {
          func.call @stack_push_pointer(%3022) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3016) : (i64) -> ()
          %3024 = llvm.mlir.addressof @str228 : !llvm.ptr
          %3025 = func.call @cc_make_function_ref_const(%3024) : (!llvm.ptr) -> i64
          %3026 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3025, %3026) : (i64, i64) -> ()
        }
        %3027 = func.call @stack_pop_pointer() : () -> i64
        %3028 = func.call @cc_errorp(%3027) : (i64) -> i64
        %3029 = func.call @cc_nil_value() : () -> i64
        %3030 = arith.cmpi ne, %3028, %3029 : i64
        scf.if %3030 {
          func.call @stack_push_pointer(%3027) : (i64) -> ()
        } else {
          %3031 = func.call @cc_multiple_value_list(%3027) : (i64) -> i64
          func.call @stack_push_pointer(%3031) : (i64) -> ()
        }
        %3032 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3033 = func.call @stack_pop_pointer() : () -> i64
        %3034 = func.call @cc_nil_value() : () -> i64
        %3035 = func.call @cc_maybe_error_from_multiple_value_list(%3032) : (i64) -> i64
        %3036 = func.call @cc_errorp(%3035) : (i64) -> i64
        %3037 = arith.cmpi ne, %3036, %3034 : i64
        %3038 = arith.cmpi eq, %3034, %3034 : i64
        %3039 = arith.andi %3037, %3038 : i1
        %3040 = scf.if %3039 -> (i64) {
          scf.yield %3035 : i64
        } else {
          scf.yield %3034 : i64
        }
        %3041 = arith.cmpi ne, %3040, %3034 : i64
        scf.if %3041 {
          func.call @stack_push_pointer(%3040) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3042 = func.call @stack_pop_pointer() : () -> i64
          %3043 = func.call @cc_cons(%3033, %3042) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_603 = arith.constant 0 : i64
          %3044 = arith.addi %3043, %__rlasp_stack_elide_zero_603 : i64
          %3045 = func.call @cc_cons(%3032, %3044) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_604 = arith.constant 0 : i64
          %3046 = arith.addi %3045, %__rlasp_stack_elide_zero_604 : i64
          %3047 = func.call @cc_values_pack(%3046) : (i64) -> i64
          func.call @stack_push_pointer(%3047) : (i64) -> ()
        }
        %3048 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3048 : i64
      }
      %__rlasp_stack_elide_zero_605 = arith.constant 0 : i64
      %3049 = arith.addi %3013, %__rlasp_stack_elide_zero_605 : i64
      %3050 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3051 = func.call @cc_errorp(%3049) : (i64) -> i64
      %3052 = func.call @cc_nil_value() : () -> i64
      %3053 = arith.cmpi ne, %3051, %3052 : i64
      scf.if %3053 {
        %3054 = func.call @cc_condition_value(%3049) : (i64) -> i64
        %3055 = func.call @cc_values2(%3052, %3054) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3055) : (i64) -> ()
      } else {
        %3056 = func.call @cc_multiple_value_list(%3049) : (i64) -> i64
        %3057 = func.call @cc_values_pack(%3056) : (i64) -> i64
        func.call @stack_push_pointer(%3057) : (i64) -> ()
      }
      %3058 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3058 : i64
    }
    func.call @stack_push_pointer(%3007) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192207"() {
    %3254 = func.call @cc_nil_value() : () -> i64
    %3255 = func.call @cc_nil_value() : () -> i64
    %3256 = func.call @cc_errorp(%3254) : (i64) -> i64
    %3257 = arith.cmpi ne, %3256, %3255 : i64
    %3258 = scf.if %3257 -> (i64) {
      scf.yield %3254 : i64
    } else {
      %3259 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3260 = func.call @cc_nil_value() : () -> i64
      %3261 = func.call @cc_nil_value() : () -> i64
      %3262 = func.call @cc_errorp(%3260) : (i64) -> i64
      %3263 = arith.cmpi ne, %3262, %3261 : i64
      %3264 = scf.if %3263 -> (i64) {
        scf.yield %3260 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3265 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3265) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3266 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_606 = arith.constant 0 : i64
        %3267 = arith.addi %3266, %__rlasp_stack_elide_zero_606 : i64
        %3268 = func.call @cc_nil_value() : () -> i64
        %3269 = func.call @cc_errorp(%3267) : (i64) -> i64
        %3270 = arith.cmpi ne, %3269, %3268 : i64
        %3271 = arith.cmpi eq, %3268, %3268 : i64
        %3272 = arith.andi %3270, %3271 : i1
        %3273 = scf.if %3272 -> (i64) {
          scf.yield %3267 : i64
        } else {
          scf.yield %3268 : i64
        }
        %3274 = arith.cmpi ne, %3273, %3268 : i64
        scf.if %3274 {
          func.call @stack_push_pointer(%3273) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3267) : (i64) -> ()
          %3275 = llvm.mlir.addressof @str247 : !llvm.ptr
          %3276 = func.call @cc_make_function_ref_const(%3275) : (!llvm.ptr) -> i64
          %3277 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3276, %3277) : (i64, i64) -> ()
        }
        %3278 = func.call @stack_pop_pointer() : () -> i64
        %3279 = func.call @cc_errorp(%3278) : (i64) -> i64
        %3280 = func.call @cc_nil_value() : () -> i64
        %3281 = arith.cmpi ne, %3279, %3280 : i64
        scf.if %3281 {
          func.call @stack_push_pointer(%3278) : (i64) -> ()
        } else {
          %3282 = func.call @cc_multiple_value_list(%3278) : (i64) -> i64
          func.call @stack_push_pointer(%3282) : (i64) -> ()
        }
        %3283 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3284 = func.call @stack_pop_pointer() : () -> i64
        %3285 = func.call @cc_nil_value() : () -> i64
        %3286 = func.call @cc_maybe_error_from_multiple_value_list(%3283) : (i64) -> i64
        %3287 = func.call @cc_errorp(%3286) : (i64) -> i64
        %3288 = arith.cmpi ne, %3287, %3285 : i64
        %3289 = arith.cmpi eq, %3285, %3285 : i64
        %3290 = arith.andi %3288, %3289 : i1
        %3291 = scf.if %3290 -> (i64) {
          scf.yield %3286 : i64
        } else {
          scf.yield %3285 : i64
        }
        %3292 = arith.cmpi ne, %3291, %3285 : i64
        scf.if %3292 {
          func.call @stack_push_pointer(%3291) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3293 = func.call @stack_pop_pointer() : () -> i64
          %3294 = func.call @cc_cons(%3284, %3293) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_607 = arith.constant 0 : i64
          %3295 = arith.addi %3294, %__rlasp_stack_elide_zero_607 : i64
          %3296 = func.call @cc_cons(%3283, %3295) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_608 = arith.constant 0 : i64
          %3297 = arith.addi %3296, %__rlasp_stack_elide_zero_608 : i64
          %3298 = func.call @cc_values_pack(%3297) : (i64) -> i64
          func.call @stack_push_pointer(%3298) : (i64) -> ()
        }
        %3299 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3299 : i64
      }
      %__rlasp_stack_elide_zero_609 = arith.constant 0 : i64
      %3300 = arith.addi %3264, %__rlasp_stack_elide_zero_609 : i64
      %3301 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3302 = func.call @cc_errorp(%3300) : (i64) -> i64
      %3303 = func.call @cc_nil_value() : () -> i64
      %3304 = arith.cmpi ne, %3302, %3303 : i64
      scf.if %3304 {
        %3305 = func.call @cc_condition_value(%3300) : (i64) -> i64
        %3306 = func.call @cc_values2(%3303, %3305) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3306) : (i64) -> ()
      } else {
        %3307 = func.call @cc_multiple_value_list(%3300) : (i64) -> i64
        %3308 = func.call @cc_values_pack(%3307) : (i64) -> i64
        func.call @stack_push_pointer(%3308) : (i64) -> ()
      }
      %3309 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3309 : i64
    }
    func.call @stack_push_pointer(%3258) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192208"() {
    %3505 = func.call @cc_nil_value() : () -> i64
    %3506 = func.call @cc_nil_value() : () -> i64
    %3507 = func.call @cc_errorp(%3505) : (i64) -> i64
    %3508 = arith.cmpi ne, %3507, %3506 : i64
    %3509 = scf.if %3508 -> (i64) {
      scf.yield %3505 : i64
    } else {
      %3510 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3511 = func.call @cc_nil_value() : () -> i64
      %3512 = func.call @cc_nil_value() : () -> i64
      %3513 = func.call @cc_errorp(%3511) : (i64) -> i64
      %3514 = arith.cmpi ne, %3513, %3512 : i64
      %3515 = scf.if %3514 -> (i64) {
        scf.yield %3511 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3516 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3516) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3517 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_610 = arith.constant 0 : i64
        %3518 = arith.addi %3517, %__rlasp_stack_elide_zero_610 : i64
        %3519 = func.call @cc_nil_value() : () -> i64
        %3520 = func.call @cc_errorp(%3518) : (i64) -> i64
        %3521 = arith.cmpi ne, %3520, %3519 : i64
        %3522 = arith.cmpi eq, %3519, %3519 : i64
        %3523 = arith.andi %3521, %3522 : i1
        %3524 = scf.if %3523 -> (i64) {
          scf.yield %3518 : i64
        } else {
          scf.yield %3519 : i64
        }
        %3525 = arith.cmpi ne, %3524, %3519 : i64
        scf.if %3525 {
          func.call @stack_push_pointer(%3524) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3518) : (i64) -> ()
          %3526 = llvm.mlir.addressof @str266 : !llvm.ptr
          %3527 = func.call @cc_make_function_ref_const(%3526) : (!llvm.ptr) -> i64
          %3528 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3527, %3528) : (i64, i64) -> ()
        }
        %3529 = func.call @stack_pop_pointer() : () -> i64
        %3530 = func.call @cc_errorp(%3529) : (i64) -> i64
        %3531 = func.call @cc_nil_value() : () -> i64
        %3532 = arith.cmpi ne, %3530, %3531 : i64
        scf.if %3532 {
          func.call @stack_push_pointer(%3529) : (i64) -> ()
        } else {
          %3533 = func.call @cc_multiple_value_list(%3529) : (i64) -> i64
          func.call @stack_push_pointer(%3533) : (i64) -> ()
        }
        %3534 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3535 = func.call @stack_pop_pointer() : () -> i64
        %3536 = func.call @cc_nil_value() : () -> i64
        %3537 = func.call @cc_maybe_error_from_multiple_value_list(%3534) : (i64) -> i64
        %3538 = func.call @cc_errorp(%3537) : (i64) -> i64
        %3539 = arith.cmpi ne, %3538, %3536 : i64
        %3540 = arith.cmpi eq, %3536, %3536 : i64
        %3541 = arith.andi %3539, %3540 : i1
        %3542 = scf.if %3541 -> (i64) {
          scf.yield %3537 : i64
        } else {
          scf.yield %3536 : i64
        }
        %3543 = arith.cmpi ne, %3542, %3536 : i64
        scf.if %3543 {
          func.call @stack_push_pointer(%3542) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3544 = func.call @stack_pop_pointer() : () -> i64
          %3545 = func.call @cc_cons(%3535, %3544) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_611 = arith.constant 0 : i64
          %3546 = arith.addi %3545, %__rlasp_stack_elide_zero_611 : i64
          %3547 = func.call @cc_cons(%3534, %3546) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_612 = arith.constant 0 : i64
          %3548 = arith.addi %3547, %__rlasp_stack_elide_zero_612 : i64
          %3549 = func.call @cc_values_pack(%3548) : (i64) -> i64
          func.call @stack_push_pointer(%3549) : (i64) -> ()
        }
        %3550 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3550 : i64
      }
      %__rlasp_stack_elide_zero_613 = arith.constant 0 : i64
      %3551 = arith.addi %3515, %__rlasp_stack_elide_zero_613 : i64
      %3552 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3553 = func.call @cc_errorp(%3551) : (i64) -> i64
      %3554 = func.call @cc_nil_value() : () -> i64
      %3555 = arith.cmpi ne, %3553, %3554 : i64
      scf.if %3555 {
        %3556 = func.call @cc_condition_value(%3551) : (i64) -> i64
        %3557 = func.call @cc_values2(%3554, %3556) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3557) : (i64) -> ()
      } else {
        %3558 = func.call @cc_multiple_value_list(%3551) : (i64) -> i64
        %3559 = func.call @cc_values_pack(%3558) : (i64) -> i64
        func.call @stack_push_pointer(%3559) : (i64) -> ()
      }
      %3560 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3560 : i64
    }
    func.call @stack_push_pointer(%3509) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192209"() {
    %3756 = func.call @cc_nil_value() : () -> i64
    %3757 = func.call @cc_nil_value() : () -> i64
    %3758 = func.call @cc_errorp(%3756) : (i64) -> i64
    %3759 = arith.cmpi ne, %3758, %3757 : i64
    %3760 = scf.if %3759 -> (i64) {
      scf.yield %3756 : i64
    } else {
      %3761 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3762 = func.call @cc_nil_value() : () -> i64
      %3763 = func.call @cc_nil_value() : () -> i64
      %3764 = func.call @cc_errorp(%3762) : (i64) -> i64
      %3765 = arith.cmpi ne, %3764, %3763 : i64
      %3766 = scf.if %3765 -> (i64) {
        scf.yield %3762 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3767 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3767) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3768 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_614 = arith.constant 0 : i64
        %3769 = arith.addi %3768, %__rlasp_stack_elide_zero_614 : i64
        %3770 = func.call @cc_nil_value() : () -> i64
        %3771 = func.call @cc_errorp(%3769) : (i64) -> i64
        %3772 = arith.cmpi ne, %3771, %3770 : i64
        %3773 = arith.cmpi eq, %3770, %3770 : i64
        %3774 = arith.andi %3772, %3773 : i1
        %3775 = scf.if %3774 -> (i64) {
          scf.yield %3769 : i64
        } else {
          scf.yield %3770 : i64
        }
        %3776 = arith.cmpi ne, %3775, %3770 : i64
        scf.if %3776 {
          func.call @stack_push_pointer(%3775) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3769) : (i64) -> ()
          %3777 = llvm.mlir.addressof @str285 : !llvm.ptr
          %3778 = func.call @cc_make_function_ref_const(%3777) : (!llvm.ptr) -> i64
          %3779 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3778, %3779) : (i64, i64) -> ()
        }
        %3780 = func.call @stack_pop_pointer() : () -> i64
        %3781 = func.call @cc_errorp(%3780) : (i64) -> i64
        %3782 = func.call @cc_nil_value() : () -> i64
        %3783 = arith.cmpi ne, %3781, %3782 : i64
        scf.if %3783 {
          func.call @stack_push_pointer(%3780) : (i64) -> ()
        } else {
          %3784 = func.call @cc_multiple_value_list(%3780) : (i64) -> i64
          func.call @stack_push_pointer(%3784) : (i64) -> ()
        }
        %3785 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3786 = func.call @stack_pop_pointer() : () -> i64
        %3787 = func.call @cc_nil_value() : () -> i64
        %3788 = func.call @cc_maybe_error_from_multiple_value_list(%3785) : (i64) -> i64
        %3789 = func.call @cc_errorp(%3788) : (i64) -> i64
        %3790 = arith.cmpi ne, %3789, %3787 : i64
        %3791 = arith.cmpi eq, %3787, %3787 : i64
        %3792 = arith.andi %3790, %3791 : i1
        %3793 = scf.if %3792 -> (i64) {
          scf.yield %3788 : i64
        } else {
          scf.yield %3787 : i64
        }
        %3794 = arith.cmpi ne, %3793, %3787 : i64
        scf.if %3794 {
          func.call @stack_push_pointer(%3793) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3795 = func.call @stack_pop_pointer() : () -> i64
          %3796 = func.call @cc_cons(%3786, %3795) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_615 = arith.constant 0 : i64
          %3797 = arith.addi %3796, %__rlasp_stack_elide_zero_615 : i64
          %3798 = func.call @cc_cons(%3785, %3797) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_616 = arith.constant 0 : i64
          %3799 = arith.addi %3798, %__rlasp_stack_elide_zero_616 : i64
          %3800 = func.call @cc_values_pack(%3799) : (i64) -> i64
          func.call @stack_push_pointer(%3800) : (i64) -> ()
        }
        %3801 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3801 : i64
      }
      %__rlasp_stack_elide_zero_617 = arith.constant 0 : i64
      %3802 = arith.addi %3766, %__rlasp_stack_elide_zero_617 : i64
      %3803 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3804 = func.call @cc_errorp(%3802) : (i64) -> i64
      %3805 = func.call @cc_nil_value() : () -> i64
      %3806 = arith.cmpi ne, %3804, %3805 : i64
      scf.if %3806 {
        %3807 = func.call @cc_condition_value(%3802) : (i64) -> i64
        %3808 = func.call @cc_values2(%3805, %3807) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3808) : (i64) -> ()
      } else {
        %3809 = func.call @cc_multiple_value_list(%3802) : (i64) -> i64
        %3810 = func.call @cc_values_pack(%3809) : (i64) -> i64
        func.call @stack_push_pointer(%3810) : (i64) -> ()
      }
      %3811 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3811 : i64
    }
    func.call @stack_push_pointer(%3760) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192210"() {
    %4007 = func.call @cc_nil_value() : () -> i64
    %4008 = func.call @cc_nil_value() : () -> i64
    %4009 = func.call @cc_errorp(%4007) : (i64) -> i64
    %4010 = arith.cmpi ne, %4009, %4008 : i64
    %4011 = scf.if %4010 -> (i64) {
      scf.yield %4007 : i64
    } else {
      %4012 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4013 = func.call @cc_nil_value() : () -> i64
      %4014 = func.call @cc_nil_value() : () -> i64
      %4015 = func.call @cc_errorp(%4013) : (i64) -> i64
      %4016 = arith.cmpi ne, %4015, %4014 : i64
      %4017 = scf.if %4016 -> (i64) {
        scf.yield %4013 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4018 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4018) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4019 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_618 = arith.constant 0 : i64
        %4020 = arith.addi %4019, %__rlasp_stack_elide_zero_618 : i64
        %4021 = func.call @cc_nil_value() : () -> i64
        %4022 = func.call @cc_errorp(%4020) : (i64) -> i64
        %4023 = arith.cmpi ne, %4022, %4021 : i64
        %4024 = arith.cmpi eq, %4021, %4021 : i64
        %4025 = arith.andi %4023, %4024 : i1
        %4026 = scf.if %4025 -> (i64) {
          scf.yield %4020 : i64
        } else {
          scf.yield %4021 : i64
        }
        %4027 = arith.cmpi ne, %4026, %4021 : i64
        scf.if %4027 {
          func.call @stack_push_pointer(%4026) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4020) : (i64) -> ()
          %4028 = llvm.mlir.addressof @str304 : !llvm.ptr
          %4029 = func.call @cc_make_function_ref_const(%4028) : (!llvm.ptr) -> i64
          %4030 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4029, %4030) : (i64, i64) -> ()
        }
        %4031 = func.call @stack_pop_pointer() : () -> i64
        %4032 = func.call @cc_errorp(%4031) : (i64) -> i64
        %4033 = func.call @cc_nil_value() : () -> i64
        %4034 = arith.cmpi ne, %4032, %4033 : i64
        scf.if %4034 {
          func.call @stack_push_pointer(%4031) : (i64) -> ()
        } else {
          %4035 = func.call @cc_multiple_value_list(%4031) : (i64) -> i64
          func.call @stack_push_pointer(%4035) : (i64) -> ()
        }
        %4036 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4037 = func.call @stack_pop_pointer() : () -> i64
        %4038 = func.call @cc_nil_value() : () -> i64
        %4039 = func.call @cc_maybe_error_from_multiple_value_list(%4036) : (i64) -> i64
        %4040 = func.call @cc_errorp(%4039) : (i64) -> i64
        %4041 = arith.cmpi ne, %4040, %4038 : i64
        %4042 = arith.cmpi eq, %4038, %4038 : i64
        %4043 = arith.andi %4041, %4042 : i1
        %4044 = scf.if %4043 -> (i64) {
          scf.yield %4039 : i64
        } else {
          scf.yield %4038 : i64
        }
        %4045 = arith.cmpi ne, %4044, %4038 : i64
        scf.if %4045 {
          func.call @stack_push_pointer(%4044) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4046 = func.call @stack_pop_pointer() : () -> i64
          %4047 = func.call @cc_cons(%4037, %4046) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_619 = arith.constant 0 : i64
          %4048 = arith.addi %4047, %__rlasp_stack_elide_zero_619 : i64
          %4049 = func.call @cc_cons(%4036, %4048) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_620 = arith.constant 0 : i64
          %4050 = arith.addi %4049, %__rlasp_stack_elide_zero_620 : i64
          %4051 = func.call @cc_values_pack(%4050) : (i64) -> i64
          func.call @stack_push_pointer(%4051) : (i64) -> ()
        }
        %4052 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4052 : i64
      }
      %__rlasp_stack_elide_zero_621 = arith.constant 0 : i64
      %4053 = arith.addi %4017, %__rlasp_stack_elide_zero_621 : i64
      %4054 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4055 = func.call @cc_errorp(%4053) : (i64) -> i64
      %4056 = func.call @cc_nil_value() : () -> i64
      %4057 = arith.cmpi ne, %4055, %4056 : i64
      scf.if %4057 {
        %4058 = func.call @cc_condition_value(%4053) : (i64) -> i64
        %4059 = func.call @cc_values2(%4056, %4058) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4059) : (i64) -> ()
      } else {
        %4060 = func.call @cc_multiple_value_list(%4053) : (i64) -> i64
        %4061 = func.call @cc_values_pack(%4060) : (i64) -> i64
        func.call @stack_push_pointer(%4061) : (i64) -> ()
      }
      %4062 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4062 : i64
    }
    func.call @stack_push_pointer(%4011) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192211"() {
    %4258 = func.call @cc_nil_value() : () -> i64
    %4259 = func.call @cc_nil_value() : () -> i64
    %4260 = func.call @cc_errorp(%4258) : (i64) -> i64
    %4261 = arith.cmpi ne, %4260, %4259 : i64
    %4262 = scf.if %4261 -> (i64) {
      scf.yield %4258 : i64
    } else {
      %4263 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4264 = func.call @cc_nil_value() : () -> i64
      %4265 = func.call @cc_nil_value() : () -> i64
      %4266 = func.call @cc_errorp(%4264) : (i64) -> i64
      %4267 = arith.cmpi ne, %4266, %4265 : i64
      %4268 = scf.if %4267 -> (i64) {
        scf.yield %4264 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4269 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4269) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4270 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_622 = arith.constant 0 : i64
        %4271 = arith.addi %4270, %__rlasp_stack_elide_zero_622 : i64
        %4272 = func.call @cc_nil_value() : () -> i64
        %4273 = func.call @cc_errorp(%4271) : (i64) -> i64
        %4274 = arith.cmpi ne, %4273, %4272 : i64
        %4275 = arith.cmpi eq, %4272, %4272 : i64
        %4276 = arith.andi %4274, %4275 : i1
        %4277 = scf.if %4276 -> (i64) {
          scf.yield %4271 : i64
        } else {
          scf.yield %4272 : i64
        }
        %4278 = arith.cmpi ne, %4277, %4272 : i64
        scf.if %4278 {
          func.call @stack_push_pointer(%4277) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4271) : (i64) -> ()
          %4279 = llvm.mlir.addressof @str323 : !llvm.ptr
          %4280 = func.call @cc_make_function_ref_const(%4279) : (!llvm.ptr) -> i64
          %4281 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4280, %4281) : (i64, i64) -> ()
        }
        %4282 = func.call @stack_pop_pointer() : () -> i64
        %4283 = func.call @cc_errorp(%4282) : (i64) -> i64
        %4284 = func.call @cc_nil_value() : () -> i64
        %4285 = arith.cmpi ne, %4283, %4284 : i64
        scf.if %4285 {
          func.call @stack_push_pointer(%4282) : (i64) -> ()
        } else {
          %4286 = func.call @cc_multiple_value_list(%4282) : (i64) -> i64
          func.call @stack_push_pointer(%4286) : (i64) -> ()
        }
        %4287 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4288 = func.call @stack_pop_pointer() : () -> i64
        %4289 = func.call @cc_nil_value() : () -> i64
        %4290 = func.call @cc_maybe_error_from_multiple_value_list(%4287) : (i64) -> i64
        %4291 = func.call @cc_errorp(%4290) : (i64) -> i64
        %4292 = arith.cmpi ne, %4291, %4289 : i64
        %4293 = arith.cmpi eq, %4289, %4289 : i64
        %4294 = arith.andi %4292, %4293 : i1
        %4295 = scf.if %4294 -> (i64) {
          scf.yield %4290 : i64
        } else {
          scf.yield %4289 : i64
        }
        %4296 = arith.cmpi ne, %4295, %4289 : i64
        scf.if %4296 {
          func.call @stack_push_pointer(%4295) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4297 = func.call @stack_pop_pointer() : () -> i64
          %4298 = func.call @cc_cons(%4288, %4297) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_623 = arith.constant 0 : i64
          %4299 = arith.addi %4298, %__rlasp_stack_elide_zero_623 : i64
          %4300 = func.call @cc_cons(%4287, %4299) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_624 = arith.constant 0 : i64
          %4301 = arith.addi %4300, %__rlasp_stack_elide_zero_624 : i64
          %4302 = func.call @cc_values_pack(%4301) : (i64) -> i64
          func.call @stack_push_pointer(%4302) : (i64) -> ()
        }
        %4303 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4303 : i64
      }
      %__rlasp_stack_elide_zero_625 = arith.constant 0 : i64
      %4304 = arith.addi %4268, %__rlasp_stack_elide_zero_625 : i64
      %4305 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4306 = func.call @cc_errorp(%4304) : (i64) -> i64
      %4307 = func.call @cc_nil_value() : () -> i64
      %4308 = arith.cmpi ne, %4306, %4307 : i64
      scf.if %4308 {
        %4309 = func.call @cc_condition_value(%4304) : (i64) -> i64
        %4310 = func.call @cc_values2(%4307, %4309) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4310) : (i64) -> ()
      } else {
        %4311 = func.call @cc_multiple_value_list(%4304) : (i64) -> i64
        %4312 = func.call @cc_values_pack(%4311) : (i64) -> i64
        func.call @stack_push_pointer(%4312) : (i64) -> ()
      }
      %4313 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4313 : i64
    }
    func.call @stack_push_pointer(%4262) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192212"() {
    %4509 = func.call @cc_nil_value() : () -> i64
    %4510 = func.call @cc_nil_value() : () -> i64
    %4511 = func.call @cc_errorp(%4509) : (i64) -> i64
    %4512 = arith.cmpi ne, %4511, %4510 : i64
    %4513 = scf.if %4512 -> (i64) {
      scf.yield %4509 : i64
    } else {
      %4514 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4515 = func.call @cc_nil_value() : () -> i64
      %4516 = func.call @cc_nil_value() : () -> i64
      %4517 = func.call @cc_errorp(%4515) : (i64) -> i64
      %4518 = arith.cmpi ne, %4517, %4516 : i64
      %4519 = scf.if %4518 -> (i64) {
        scf.yield %4515 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4520 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4520) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4521 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_626 = arith.constant 0 : i64
        %4522 = arith.addi %4521, %__rlasp_stack_elide_zero_626 : i64
        %4523 = func.call @cc_nil_value() : () -> i64
        %4524 = func.call @cc_errorp(%4522) : (i64) -> i64
        %4525 = arith.cmpi ne, %4524, %4523 : i64
        %4526 = arith.cmpi eq, %4523, %4523 : i64
        %4527 = arith.andi %4525, %4526 : i1
        %4528 = scf.if %4527 -> (i64) {
          scf.yield %4522 : i64
        } else {
          scf.yield %4523 : i64
        }
        %4529 = arith.cmpi ne, %4528, %4523 : i64
        scf.if %4529 {
          func.call @stack_push_pointer(%4528) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4522) : (i64) -> ()
          %4530 = llvm.mlir.addressof @str342 : !llvm.ptr
          %4531 = func.call @cc_make_function_ref_const(%4530) : (!llvm.ptr) -> i64
          %4532 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4531, %4532) : (i64, i64) -> ()
        }
        %4533 = func.call @stack_pop_pointer() : () -> i64
        %4534 = func.call @cc_errorp(%4533) : (i64) -> i64
        %4535 = func.call @cc_nil_value() : () -> i64
        %4536 = arith.cmpi ne, %4534, %4535 : i64
        scf.if %4536 {
          func.call @stack_push_pointer(%4533) : (i64) -> ()
        } else {
          %4537 = func.call @cc_multiple_value_list(%4533) : (i64) -> i64
          func.call @stack_push_pointer(%4537) : (i64) -> ()
        }
        %4538 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4539 = func.call @stack_pop_pointer() : () -> i64
        %4540 = func.call @cc_nil_value() : () -> i64
        %4541 = func.call @cc_maybe_error_from_multiple_value_list(%4538) : (i64) -> i64
        %4542 = func.call @cc_errorp(%4541) : (i64) -> i64
        %4543 = arith.cmpi ne, %4542, %4540 : i64
        %4544 = arith.cmpi eq, %4540, %4540 : i64
        %4545 = arith.andi %4543, %4544 : i1
        %4546 = scf.if %4545 -> (i64) {
          scf.yield %4541 : i64
        } else {
          scf.yield %4540 : i64
        }
        %4547 = arith.cmpi ne, %4546, %4540 : i64
        scf.if %4547 {
          func.call @stack_push_pointer(%4546) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4548 = func.call @stack_pop_pointer() : () -> i64
          %4549 = func.call @cc_cons(%4539, %4548) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_627 = arith.constant 0 : i64
          %4550 = arith.addi %4549, %__rlasp_stack_elide_zero_627 : i64
          %4551 = func.call @cc_cons(%4538, %4550) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_628 = arith.constant 0 : i64
          %4552 = arith.addi %4551, %__rlasp_stack_elide_zero_628 : i64
          %4553 = func.call @cc_values_pack(%4552) : (i64) -> i64
          func.call @stack_push_pointer(%4553) : (i64) -> ()
        }
        %4554 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4554 : i64
      }
      %__rlasp_stack_elide_zero_629 = arith.constant 0 : i64
      %4555 = arith.addi %4519, %__rlasp_stack_elide_zero_629 : i64
      %4556 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4557 = func.call @cc_errorp(%4555) : (i64) -> i64
      %4558 = func.call @cc_nil_value() : () -> i64
      %4559 = arith.cmpi ne, %4557, %4558 : i64
      scf.if %4559 {
        %4560 = func.call @cc_condition_value(%4555) : (i64) -> i64
        %4561 = func.call @cc_values2(%4558, %4560) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4561) : (i64) -> ()
      } else {
        %4562 = func.call @cc_multiple_value_list(%4555) : (i64) -> i64
        %4563 = func.call @cc_values_pack(%4562) : (i64) -> i64
        func.call @stack_push_pointer(%4563) : (i64) -> ()
      }
      %4564 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4564 : i64
    }
    func.call @stack_push_pointer(%4513) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192213"() {
    %4760 = func.call @cc_nil_value() : () -> i64
    %4761 = func.call @cc_nil_value() : () -> i64
    %4762 = func.call @cc_errorp(%4760) : (i64) -> i64
    %4763 = arith.cmpi ne, %4762, %4761 : i64
    %4764 = scf.if %4763 -> (i64) {
      scf.yield %4760 : i64
    } else {
      %4765 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4766 = func.call @cc_nil_value() : () -> i64
      %4767 = func.call @cc_nil_value() : () -> i64
      %4768 = func.call @cc_errorp(%4766) : (i64) -> i64
      %4769 = arith.cmpi ne, %4768, %4767 : i64
      %4770 = scf.if %4769 -> (i64) {
        scf.yield %4766 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4771 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4771) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4772 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_630 = arith.constant 0 : i64
        %4773 = arith.addi %4772, %__rlasp_stack_elide_zero_630 : i64
        %4774 = func.call @cc_nil_value() : () -> i64
        %4775 = func.call @cc_errorp(%4773) : (i64) -> i64
        %4776 = arith.cmpi ne, %4775, %4774 : i64
        %4777 = arith.cmpi eq, %4774, %4774 : i64
        %4778 = arith.andi %4776, %4777 : i1
        %4779 = scf.if %4778 -> (i64) {
          scf.yield %4773 : i64
        } else {
          scf.yield %4774 : i64
        }
        %4780 = arith.cmpi ne, %4779, %4774 : i64
        scf.if %4780 {
          func.call @stack_push_pointer(%4779) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4773) : (i64) -> ()
          %4781 = llvm.mlir.addressof @str361 : !llvm.ptr
          %4782 = func.call @cc_make_function_ref_const(%4781) : (!llvm.ptr) -> i64
          %4783 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4782, %4783) : (i64, i64) -> ()
        }
        %4784 = func.call @stack_pop_pointer() : () -> i64
        %4785 = func.call @cc_errorp(%4784) : (i64) -> i64
        %4786 = func.call @cc_nil_value() : () -> i64
        %4787 = arith.cmpi ne, %4785, %4786 : i64
        scf.if %4787 {
          func.call @stack_push_pointer(%4784) : (i64) -> ()
        } else {
          %4788 = func.call @cc_multiple_value_list(%4784) : (i64) -> i64
          func.call @stack_push_pointer(%4788) : (i64) -> ()
        }
        %4789 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4790 = func.call @stack_pop_pointer() : () -> i64
        %4791 = func.call @cc_nil_value() : () -> i64
        %4792 = func.call @cc_maybe_error_from_multiple_value_list(%4789) : (i64) -> i64
        %4793 = func.call @cc_errorp(%4792) : (i64) -> i64
        %4794 = arith.cmpi ne, %4793, %4791 : i64
        %4795 = arith.cmpi eq, %4791, %4791 : i64
        %4796 = arith.andi %4794, %4795 : i1
        %4797 = scf.if %4796 -> (i64) {
          scf.yield %4792 : i64
        } else {
          scf.yield %4791 : i64
        }
        %4798 = arith.cmpi ne, %4797, %4791 : i64
        scf.if %4798 {
          func.call @stack_push_pointer(%4797) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4799 = func.call @stack_pop_pointer() : () -> i64
          %4800 = func.call @cc_cons(%4790, %4799) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_631 = arith.constant 0 : i64
          %4801 = arith.addi %4800, %__rlasp_stack_elide_zero_631 : i64
          %4802 = func.call @cc_cons(%4789, %4801) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_632 = arith.constant 0 : i64
          %4803 = arith.addi %4802, %__rlasp_stack_elide_zero_632 : i64
          %4804 = func.call @cc_values_pack(%4803) : (i64) -> i64
          func.call @stack_push_pointer(%4804) : (i64) -> ()
        }
        %4805 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4805 : i64
      }
      %__rlasp_stack_elide_zero_633 = arith.constant 0 : i64
      %4806 = arith.addi %4770, %__rlasp_stack_elide_zero_633 : i64
      %4807 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4808 = func.call @cc_errorp(%4806) : (i64) -> i64
      %4809 = func.call @cc_nil_value() : () -> i64
      %4810 = arith.cmpi ne, %4808, %4809 : i64
      scf.if %4810 {
        %4811 = func.call @cc_condition_value(%4806) : (i64) -> i64
        %4812 = func.call @cc_values2(%4809, %4811) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4812) : (i64) -> ()
      } else {
        %4813 = func.call @cc_multiple_value_list(%4806) : (i64) -> i64
        %4814 = func.call @cc_values_pack(%4813) : (i64) -> i64
        func.call @stack_push_pointer(%4814) : (i64) -> ()
      }
      %4815 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4815 : i64
    }
    func.call @stack_push_pointer(%4764) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192214"() {
    %5011 = func.call @cc_nil_value() : () -> i64
    %5012 = func.call @cc_nil_value() : () -> i64
    %5013 = func.call @cc_errorp(%5011) : (i64) -> i64
    %5014 = arith.cmpi ne, %5013, %5012 : i64
    %5015 = scf.if %5014 -> (i64) {
      scf.yield %5011 : i64
    } else {
      %5016 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5017 = func.call @cc_nil_value() : () -> i64
      %5018 = func.call @cc_nil_value() : () -> i64
      %5019 = func.call @cc_errorp(%5017) : (i64) -> i64
      %5020 = arith.cmpi ne, %5019, %5018 : i64
      %5021 = scf.if %5020 -> (i64) {
        scf.yield %5017 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5022 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5022) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5023 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_634 = arith.constant 0 : i64
        %5024 = arith.addi %5023, %__rlasp_stack_elide_zero_634 : i64
        %5025 = func.call @cc_nil_value() : () -> i64
        %5026 = func.call @cc_errorp(%5024) : (i64) -> i64
        %5027 = arith.cmpi ne, %5026, %5025 : i64
        %5028 = arith.cmpi eq, %5025, %5025 : i64
        %5029 = arith.andi %5027, %5028 : i1
        %5030 = scf.if %5029 -> (i64) {
          scf.yield %5024 : i64
        } else {
          scf.yield %5025 : i64
        }
        %5031 = arith.cmpi ne, %5030, %5025 : i64
        scf.if %5031 {
          func.call @stack_push_pointer(%5030) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5024) : (i64) -> ()
          %5032 = llvm.mlir.addressof @str380 : !llvm.ptr
          %5033 = func.call @cc_make_function_ref_const(%5032) : (!llvm.ptr) -> i64
          %5034 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5033, %5034) : (i64, i64) -> ()
        }
        %5035 = func.call @stack_pop_pointer() : () -> i64
        %5036 = func.call @cc_errorp(%5035) : (i64) -> i64
        %5037 = func.call @cc_nil_value() : () -> i64
        %5038 = arith.cmpi ne, %5036, %5037 : i64
        scf.if %5038 {
          func.call @stack_push_pointer(%5035) : (i64) -> ()
        } else {
          %5039 = func.call @cc_multiple_value_list(%5035) : (i64) -> i64
          func.call @stack_push_pointer(%5039) : (i64) -> ()
        }
        %5040 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5041 = func.call @stack_pop_pointer() : () -> i64
        %5042 = func.call @cc_nil_value() : () -> i64
        %5043 = func.call @cc_maybe_error_from_multiple_value_list(%5040) : (i64) -> i64
        %5044 = func.call @cc_errorp(%5043) : (i64) -> i64
        %5045 = arith.cmpi ne, %5044, %5042 : i64
        %5046 = arith.cmpi eq, %5042, %5042 : i64
        %5047 = arith.andi %5045, %5046 : i1
        %5048 = scf.if %5047 -> (i64) {
          scf.yield %5043 : i64
        } else {
          scf.yield %5042 : i64
        }
        %5049 = arith.cmpi ne, %5048, %5042 : i64
        scf.if %5049 {
          func.call @stack_push_pointer(%5048) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5050 = func.call @stack_pop_pointer() : () -> i64
          %5051 = func.call @cc_cons(%5041, %5050) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_635 = arith.constant 0 : i64
          %5052 = arith.addi %5051, %__rlasp_stack_elide_zero_635 : i64
          %5053 = func.call @cc_cons(%5040, %5052) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_636 = arith.constant 0 : i64
          %5054 = arith.addi %5053, %__rlasp_stack_elide_zero_636 : i64
          %5055 = func.call @cc_values_pack(%5054) : (i64) -> i64
          func.call @stack_push_pointer(%5055) : (i64) -> ()
        }
        %5056 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5056 : i64
      }
      %__rlasp_stack_elide_zero_637 = arith.constant 0 : i64
      %5057 = arith.addi %5021, %__rlasp_stack_elide_zero_637 : i64
      %5058 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5059 = func.call @cc_errorp(%5057) : (i64) -> i64
      %5060 = func.call @cc_nil_value() : () -> i64
      %5061 = arith.cmpi ne, %5059, %5060 : i64
      scf.if %5061 {
        %5062 = func.call @cc_condition_value(%5057) : (i64) -> i64
        %5063 = func.call @cc_values2(%5060, %5062) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5063) : (i64) -> ()
      } else {
        %5064 = func.call @cc_multiple_value_list(%5057) : (i64) -> i64
        %5065 = func.call @cc_values_pack(%5064) : (i64) -> i64
        func.call @stack_push_pointer(%5065) : (i64) -> ()
      }
      %5066 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5066 : i64
    }
    func.call @stack_push_pointer(%5015) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192215"() {
    %5262 = func.call @cc_nil_value() : () -> i64
    %5263 = func.call @cc_nil_value() : () -> i64
    %5264 = func.call @cc_errorp(%5262) : (i64) -> i64
    %5265 = arith.cmpi ne, %5264, %5263 : i64
    %5266 = scf.if %5265 -> (i64) {
      scf.yield %5262 : i64
    } else {
      %5267 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5268 = func.call @cc_nil_value() : () -> i64
      %5269 = func.call @cc_nil_value() : () -> i64
      %5270 = func.call @cc_errorp(%5268) : (i64) -> i64
      %5271 = arith.cmpi ne, %5270, %5269 : i64
      %5272 = scf.if %5271 -> (i64) {
        scf.yield %5268 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5273 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5273) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5274 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_638 = arith.constant 0 : i64
        %5275 = arith.addi %5274, %__rlasp_stack_elide_zero_638 : i64
        %5276 = func.call @cc_nil_value() : () -> i64
        %5277 = func.call @cc_errorp(%5275) : (i64) -> i64
        %5278 = arith.cmpi ne, %5277, %5276 : i64
        %5279 = arith.cmpi eq, %5276, %5276 : i64
        %5280 = arith.andi %5278, %5279 : i1
        %5281 = scf.if %5280 -> (i64) {
          scf.yield %5275 : i64
        } else {
          scf.yield %5276 : i64
        }
        %5282 = arith.cmpi ne, %5281, %5276 : i64
        scf.if %5282 {
          func.call @stack_push_pointer(%5281) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5275) : (i64) -> ()
          %5283 = llvm.mlir.addressof @str399 : !llvm.ptr
          %5284 = func.call @cc_make_function_ref_const(%5283) : (!llvm.ptr) -> i64
          %5285 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5284, %5285) : (i64, i64) -> ()
        }
        %5286 = func.call @stack_pop_pointer() : () -> i64
        %5287 = func.call @cc_errorp(%5286) : (i64) -> i64
        %5288 = func.call @cc_nil_value() : () -> i64
        %5289 = arith.cmpi ne, %5287, %5288 : i64
        scf.if %5289 {
          func.call @stack_push_pointer(%5286) : (i64) -> ()
        } else {
          %5290 = func.call @cc_multiple_value_list(%5286) : (i64) -> i64
          func.call @stack_push_pointer(%5290) : (i64) -> ()
        }
        %5291 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5292 = func.call @stack_pop_pointer() : () -> i64
        %5293 = func.call @cc_nil_value() : () -> i64
        %5294 = func.call @cc_maybe_error_from_multiple_value_list(%5291) : (i64) -> i64
        %5295 = func.call @cc_errorp(%5294) : (i64) -> i64
        %5296 = arith.cmpi ne, %5295, %5293 : i64
        %5297 = arith.cmpi eq, %5293, %5293 : i64
        %5298 = arith.andi %5296, %5297 : i1
        %5299 = scf.if %5298 -> (i64) {
          scf.yield %5294 : i64
        } else {
          scf.yield %5293 : i64
        }
        %5300 = arith.cmpi ne, %5299, %5293 : i64
        scf.if %5300 {
          func.call @stack_push_pointer(%5299) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5301 = func.call @stack_pop_pointer() : () -> i64
          %5302 = func.call @cc_cons(%5292, %5301) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_639 = arith.constant 0 : i64
          %5303 = arith.addi %5302, %__rlasp_stack_elide_zero_639 : i64
          %5304 = func.call @cc_cons(%5291, %5303) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_640 = arith.constant 0 : i64
          %5305 = arith.addi %5304, %__rlasp_stack_elide_zero_640 : i64
          %5306 = func.call @cc_values_pack(%5305) : (i64) -> i64
          func.call @stack_push_pointer(%5306) : (i64) -> ()
        }
        %5307 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5307 : i64
      }
      %__rlasp_stack_elide_zero_641 = arith.constant 0 : i64
      %5308 = arith.addi %5272, %__rlasp_stack_elide_zero_641 : i64
      %5309 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5310 = func.call @cc_errorp(%5308) : (i64) -> i64
      %5311 = func.call @cc_nil_value() : () -> i64
      %5312 = arith.cmpi ne, %5310, %5311 : i64
      scf.if %5312 {
        %5313 = func.call @cc_condition_value(%5308) : (i64) -> i64
        %5314 = func.call @cc_values2(%5311, %5313) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5314) : (i64) -> ()
      } else {
        %5315 = func.call @cc_multiple_value_list(%5308) : (i64) -> i64
        %5316 = func.call @cc_values_pack(%5315) : (i64) -> i64
        func.call @stack_push_pointer(%5316) : (i64) -> ()
      }
      %5317 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5317 : i64
    }
    func.call @stack_push_pointer(%5266) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192216"() {
    %5513 = func.call @cc_nil_value() : () -> i64
    %5514 = func.call @cc_nil_value() : () -> i64
    %5515 = func.call @cc_errorp(%5513) : (i64) -> i64
    %5516 = arith.cmpi ne, %5515, %5514 : i64
    %5517 = scf.if %5516 -> (i64) {
      scf.yield %5513 : i64
    } else {
      %5518 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5519 = func.call @cc_nil_value() : () -> i64
      %5520 = func.call @cc_nil_value() : () -> i64
      %5521 = func.call @cc_errorp(%5519) : (i64) -> i64
      %5522 = arith.cmpi ne, %5521, %5520 : i64
      %5523 = scf.if %5522 -> (i64) {
        scf.yield %5519 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5524 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5524) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5525 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_642 = arith.constant 0 : i64
        %5526 = arith.addi %5525, %__rlasp_stack_elide_zero_642 : i64
        %5527 = func.call @cc_nil_value() : () -> i64
        %5528 = func.call @cc_errorp(%5526) : (i64) -> i64
        %5529 = arith.cmpi ne, %5528, %5527 : i64
        %5530 = arith.cmpi eq, %5527, %5527 : i64
        %5531 = arith.andi %5529, %5530 : i1
        %5532 = scf.if %5531 -> (i64) {
          scf.yield %5526 : i64
        } else {
          scf.yield %5527 : i64
        }
        %5533 = arith.cmpi ne, %5532, %5527 : i64
        scf.if %5533 {
          func.call @stack_push_pointer(%5532) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5526) : (i64) -> ()
          %5534 = llvm.mlir.addressof @str418 : !llvm.ptr
          %5535 = func.call @cc_make_function_ref_const(%5534) : (!llvm.ptr) -> i64
          %5536 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5535, %5536) : (i64, i64) -> ()
        }
        %5537 = func.call @stack_pop_pointer() : () -> i64
        %5538 = func.call @cc_errorp(%5537) : (i64) -> i64
        %5539 = func.call @cc_nil_value() : () -> i64
        %5540 = arith.cmpi ne, %5538, %5539 : i64
        scf.if %5540 {
          func.call @stack_push_pointer(%5537) : (i64) -> ()
        } else {
          %5541 = func.call @cc_multiple_value_list(%5537) : (i64) -> i64
          func.call @stack_push_pointer(%5541) : (i64) -> ()
        }
        %5542 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5543 = func.call @stack_pop_pointer() : () -> i64
        %5544 = func.call @cc_nil_value() : () -> i64
        %5545 = func.call @cc_maybe_error_from_multiple_value_list(%5542) : (i64) -> i64
        %5546 = func.call @cc_errorp(%5545) : (i64) -> i64
        %5547 = arith.cmpi ne, %5546, %5544 : i64
        %5548 = arith.cmpi eq, %5544, %5544 : i64
        %5549 = arith.andi %5547, %5548 : i1
        %5550 = scf.if %5549 -> (i64) {
          scf.yield %5545 : i64
        } else {
          scf.yield %5544 : i64
        }
        %5551 = arith.cmpi ne, %5550, %5544 : i64
        scf.if %5551 {
          func.call @stack_push_pointer(%5550) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5552 = func.call @stack_pop_pointer() : () -> i64
          %5553 = func.call @cc_cons(%5543, %5552) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_643 = arith.constant 0 : i64
          %5554 = arith.addi %5553, %__rlasp_stack_elide_zero_643 : i64
          %5555 = func.call @cc_cons(%5542, %5554) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_644 = arith.constant 0 : i64
          %5556 = arith.addi %5555, %__rlasp_stack_elide_zero_644 : i64
          %5557 = func.call @cc_values_pack(%5556) : (i64) -> i64
          func.call @stack_push_pointer(%5557) : (i64) -> ()
        }
        %5558 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5558 : i64
      }
      %__rlasp_stack_elide_zero_645 = arith.constant 0 : i64
      %5559 = arith.addi %5523, %__rlasp_stack_elide_zero_645 : i64
      %5560 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5561 = func.call @cc_errorp(%5559) : (i64) -> i64
      %5562 = func.call @cc_nil_value() : () -> i64
      %5563 = arith.cmpi ne, %5561, %5562 : i64
      scf.if %5563 {
        %5564 = func.call @cc_condition_value(%5559) : (i64) -> i64
        %5565 = func.call @cc_values2(%5562, %5564) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5565) : (i64) -> ()
      } else {
        %5566 = func.call @cc_multiple_value_list(%5559) : (i64) -> i64
        %5567 = func.call @cc_values_pack(%5566) : (i64) -> i64
        func.call @stack_push_pointer(%5567) : (i64) -> ()
      }
      %5568 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5568 : i64
    }
    func.call @stack_push_pointer(%5517) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192217"() {
    %5764 = func.call @cc_nil_value() : () -> i64
    %5765 = func.call @cc_nil_value() : () -> i64
    %5766 = func.call @cc_errorp(%5764) : (i64) -> i64
    %5767 = arith.cmpi ne, %5766, %5765 : i64
    %5768 = scf.if %5767 -> (i64) {
      scf.yield %5764 : i64
    } else {
      %5769 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5770 = func.call @cc_nil_value() : () -> i64
      %5771 = func.call @cc_nil_value() : () -> i64
      %5772 = func.call @cc_errorp(%5770) : (i64) -> i64
      %5773 = arith.cmpi ne, %5772, %5771 : i64
      %5774 = scf.if %5773 -> (i64) {
        scf.yield %5770 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5775 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5775) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5776 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_646 = arith.constant 0 : i64
        %5777 = arith.addi %5776, %__rlasp_stack_elide_zero_646 : i64
        %5778 = func.call @cc_nil_value() : () -> i64
        %5779 = func.call @cc_errorp(%5777) : (i64) -> i64
        %5780 = arith.cmpi ne, %5779, %5778 : i64
        %5781 = arith.cmpi eq, %5778, %5778 : i64
        %5782 = arith.andi %5780, %5781 : i1
        %5783 = scf.if %5782 -> (i64) {
          scf.yield %5777 : i64
        } else {
          scf.yield %5778 : i64
        }
        %5784 = arith.cmpi ne, %5783, %5778 : i64
        scf.if %5784 {
          func.call @stack_push_pointer(%5783) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5777) : (i64) -> ()
          %5785 = llvm.mlir.addressof @str437 : !llvm.ptr
          %5786 = func.call @cc_make_function_ref_const(%5785) : (!llvm.ptr) -> i64
          %5787 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5786, %5787) : (i64, i64) -> ()
        }
        %5788 = func.call @stack_pop_pointer() : () -> i64
        %5789 = func.call @cc_errorp(%5788) : (i64) -> i64
        %5790 = func.call @cc_nil_value() : () -> i64
        %5791 = arith.cmpi ne, %5789, %5790 : i64
        scf.if %5791 {
          func.call @stack_push_pointer(%5788) : (i64) -> ()
        } else {
          %5792 = func.call @cc_multiple_value_list(%5788) : (i64) -> i64
          func.call @stack_push_pointer(%5792) : (i64) -> ()
        }
        %5793 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5794 = func.call @stack_pop_pointer() : () -> i64
        %5795 = func.call @cc_nil_value() : () -> i64
        %5796 = func.call @cc_maybe_error_from_multiple_value_list(%5793) : (i64) -> i64
        %5797 = func.call @cc_errorp(%5796) : (i64) -> i64
        %5798 = arith.cmpi ne, %5797, %5795 : i64
        %5799 = arith.cmpi eq, %5795, %5795 : i64
        %5800 = arith.andi %5798, %5799 : i1
        %5801 = scf.if %5800 -> (i64) {
          scf.yield %5796 : i64
        } else {
          scf.yield %5795 : i64
        }
        %5802 = arith.cmpi ne, %5801, %5795 : i64
        scf.if %5802 {
          func.call @stack_push_pointer(%5801) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5803 = func.call @stack_pop_pointer() : () -> i64
          %5804 = func.call @cc_cons(%5794, %5803) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_647 = arith.constant 0 : i64
          %5805 = arith.addi %5804, %__rlasp_stack_elide_zero_647 : i64
          %5806 = func.call @cc_cons(%5793, %5805) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_648 = arith.constant 0 : i64
          %5807 = arith.addi %5806, %__rlasp_stack_elide_zero_648 : i64
          %5808 = func.call @cc_values_pack(%5807) : (i64) -> i64
          func.call @stack_push_pointer(%5808) : (i64) -> ()
        }
        %5809 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5809 : i64
      }
      %__rlasp_stack_elide_zero_649 = arith.constant 0 : i64
      %5810 = arith.addi %5774, %__rlasp_stack_elide_zero_649 : i64
      %5811 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5812 = func.call @cc_errorp(%5810) : (i64) -> i64
      %5813 = func.call @cc_nil_value() : () -> i64
      %5814 = arith.cmpi ne, %5812, %5813 : i64
      scf.if %5814 {
        %5815 = func.call @cc_condition_value(%5810) : (i64) -> i64
        %5816 = func.call @cc_values2(%5813, %5815) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5816) : (i64) -> ()
      } else {
        %5817 = func.call @cc_multiple_value_list(%5810) : (i64) -> i64
        %5818 = func.call @cc_values_pack(%5817) : (i64) -> i64
        func.call @stack_push_pointer(%5818) : (i64) -> ()
      }
      %5819 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5819 : i64
    }
    func.call @stack_push_pointer(%5768) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192218"() {
    %5988 = func.call @cc_nil_value() : () -> i64
    %5989 = func.call @cc_nil_value() : () -> i64
    %5990 = func.call @cc_errorp(%5988) : (i64) -> i64
    %5991 = arith.cmpi ne, %5990, %5989 : i64
    %5992 = scf.if %5991 -> (i64) {
      scf.yield %5988 : i64
    } else {
      %5993 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%5993) : (i64) -> ()
      %5994 = func.call @stack_pop_pointer() : () -> i64
      %5995 = func.call @cc_unbox_fixnum(%5994) : (i64) -> i64
      %5996 = func.call @cc_box_character(%5995) : (i64) -> i64
      %__rlasp_stack_elide_zero_650 = arith.constant 0 : i64
      %5997 = arith.addi %5996, %__rlasp_stack_elide_zero_650 : i64
      %5998 = func.call @cc_char_name(%5997) : (i64) -> i64
      %__rlasp_stack_elide_zero_651 = arith.constant 0 : i64
      %5999 = arith.addi %5998, %__rlasp_stack_elide_zero_651 : i64
      %6000 = func.call @cc_name_char(%5999) : (i64) -> i64
      %__rlasp_stack_elide_zero_652 = arith.constant 0 : i64
      %6001 = arith.addi %6000, %__rlasp_stack_elide_zero_652 : i64
      scf.yield %6001 : i64
    }
    func.call @stack_push_pointer(%5992) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192219"() {
    %6151 = func.call @cc_nil_value() : () -> i64
    %6152 = func.call @cc_nil_value() : () -> i64
    %6153 = func.call @cc_errorp(%6151) : (i64) -> i64
    %6154 = arith.cmpi ne, %6153, %6152 : i64
    %6155 = scf.if %6154 -> (i64) {
      scf.yield %6151 : i64
    } else {
      %6156 = arith.constant 128 : i64
      func.call @stack_push_fixnum(%6156) : (i64) -> ()
      %6157 = func.call @stack_pop_pointer() : () -> i64
      %6158 = func.call @cc_unbox_fixnum(%6157) : (i64) -> i64
      %6159 = func.call @cc_box_character(%6158) : (i64) -> i64
      %__rlasp_stack_elide_zero_653 = arith.constant 0 : i64
      %6160 = arith.addi %6159, %__rlasp_stack_elide_zero_653 : i64
      %6161 = func.call @cc_char_name(%6160) : (i64) -> i64
      %__rlasp_stack_elide_zero_654 = arith.constant 0 : i64
      %6162 = arith.addi %6161, %__rlasp_stack_elide_zero_654 : i64
      %6163 = func.call @cc_name_char(%6162) : (i64) -> i64
      %__rlasp_stack_elide_zero_655 = arith.constant 0 : i64
      %6164 = arith.addi %6163, %__rlasp_stack_elide_zero_655 : i64
      scf.yield %6164 : i64
    }
    func.call @stack_push_pointer(%6155) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192220"() {
    %6328 = func.call @cc_nil_value() : () -> i64
    %6329 = func.call @cc_nil_value() : () -> i64
    %6330 = func.call @cc_errorp(%6328) : (i64) -> i64
    %6331 = arith.cmpi ne, %6330, %6329 : i64
    %6332 = scf.if %6331 -> (i64) {
      scf.yield %6328 : i64
    } else {
      %6333 = arith.constant 255 : i64
      func.call @stack_push_fixnum(%6333) : (i64) -> ()
      %6334 = func.call @stack_pop_pointer() : () -> i64
      %6335 = func.call @cc_unbox_fixnum(%6334) : (i64) -> i64
      %6336 = func.call @cc_box_character(%6335) : (i64) -> i64
      %__rlasp_stack_elide_zero_656 = arith.constant 0 : i64
      %6337 = arith.addi %6336, %__rlasp_stack_elide_zero_656 : i64
      %6338 = func.call @cc_char_name(%6337) : (i64) -> i64
      %__rlasp_stack_elide_zero_657 = arith.constant 0 : i64
      %6339 = arith.addi %6338, %__rlasp_stack_elide_zero_657 : i64
      %6340 = func.call @cc_name_char(%6339) : (i64) -> i64
      %__rlasp_stack_elide_zero_658 = arith.constant 0 : i64
      %6341 = arith.addi %6340, %__rlasp_stack_elide_zero_658 : i64
      func.call @stack_push_nil() : () -> ()
      %6342 = func.call @stack_pop_pointer() : () -> i64
      %6343 = func.call @cc_cons(%6341, %6342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_659 = arith.constant 0 : i64
      %6344 = arith.addi %6343, %__rlasp_stack_elide_zero_659 : i64
      %6345 = func.call @cc_values_pack(%6344) : (i64) -> i64
      %__rlasp_stack_elide_zero_660 = arith.constant 0 : i64
      %6346 = arith.addi %6345, %__rlasp_stack_elide_zero_660 : i64
      scf.yield %6346 : i64
    }
    func.call @stack_push_pointer(%6332) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192221"() {
    %6518 = func.call @cc_nil_value() : () -> i64
    %6519 = func.call @cc_nil_value() : () -> i64
    %6520 = func.call @cc_errorp(%6518) : (i64) -> i64
    %6521 = arith.cmpi ne, %6520, %6519 : i64
    %6522 = scf.if %6521 -> (i64) {
      scf.yield %6518 : i64
    } else {
      %6523 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%6523) : (i64) -> ()
      %6524 = func.call @stack_pop_pointer() : () -> i64
      %6525 = func.call @cc_unbox_fixnum(%6524) : (i64) -> i64
      %6526 = func.call @cc_box_character(%6525) : (i64) -> i64
      %__rlasp_stack_elide_zero_661 = arith.constant 0 : i64
      %6527 = arith.addi %6526, %__rlasp_stack_elide_zero_661 : i64
      %6528 = func.call @cc_char_name(%6527) : (i64) -> i64
      %__rlasp_stack_elide_zero_662 = arith.constant 0 : i64
      %6529 = arith.addi %6528, %__rlasp_stack_elide_zero_662 : i64
      %6530 = func.call @cc_name_char(%6529) : (i64) -> i64
      %__rlasp_stack_elide_zero_663 = arith.constant 0 : i64
      %6531 = arith.addi %6530, %__rlasp_stack_elide_zero_663 : i64
      func.call @stack_push_nil() : () -> ()
      %6532 = func.call @stack_pop_pointer() : () -> i64
      %6533 = func.call @cc_cons(%6531, %6532) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_664 = arith.constant 0 : i64
      %6534 = arith.addi %6533, %__rlasp_stack_elide_zero_664 : i64
      %6535 = func.call @cc_values_pack(%6534) : (i64) -> i64
      %__rlasp_stack_elide_zero_665 = arith.constant 0 : i64
      %6536 = arith.addi %6535, %__rlasp_stack_elide_zero_665 : i64
      scf.yield %6536 : i64
    }
    func.call @stack_push_pointer(%6522) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192222"() {
    %7531 = func.call @cc_nil_value() : () -> i64
    %7532 = func.call @cc_nil_value() : () -> i64
    %7533 = func.call @cc_errorp(%7531) : (i64) -> i64
    %7534 = arith.cmpi ne, %7533, %7532 : i64
    %7535 = scf.if %7534 -> (i64) {
      scf.yield %7531 : i64
    } else {
      %7536 = arith.constant 0 : i64
      %7537 = func.call @cc_box_fixnum(%7536) : (i64) -> i64
      %7538 = func.call @cc_nil_value() : () -> i64
      %7539 = func.call @cc_nil_value() : () -> i64
      %7540 = func.call @cc_nil_value() : () -> i64
      %7541 = func.call @cc_nil_value() : () -> i64
      %7542 = func.call @cc_nil_value() : () -> i64
      %7543 = func.call @cc_nil_value() : () -> i64
      %7544 = func.call @cc_errorp(%7542) : (i64) -> i64
      %7545 = arith.cmpi ne, %7544, %7543 : i64
      %7546:6 = scf.if %7545 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %7542, %7541, %7538, %7540, %7537, %7539 : i64, i64, i64, i64, i64, i64
      } else {
        %7547 = func.call @cc_nil_value() : () -> i64
        %7548 = llvm.mlir.addressof @str587 : !llvm.ptr
        %7549 = arith.constant 38 : i64
        %7550 = func.call @cc_make_string(%7548, %7549) : (!llvm.ptr, i64) -> i64
        %7551 = func.call @cc_nil_value() : () -> i64
        %7552 = func.call @cc_intern(%7550, %7551) : (i64, i64) -> i64
        %7553 = func.call @cc_nil_value() : () -> i64
        %7554 = func.call @cc_cons(%7552, %7553) : (i64, i64) -> i64
        %7555 = func.call @cc_values_pack(%7554) : (i64) -> i64
        %7556 = func.call @cc_set_symbol_value(%7552, %7547) : (i64, i64) -> i64
        %7557 = llvm.mlir.addressof @str588 : !llvm.ptr
        %7558 = arith.constant 39 : i64
        %7559 = func.call @cc_make_string(%7557, %7558) : (!llvm.ptr, i64) -> i64
        %7560 = func.call @cc_nil_value() : () -> i64
        %7561 = func.call @cc_intern(%7559, %7560) : (i64, i64) -> i64
        %7562 = func.call @cc_nil_value() : () -> i64
        %7563 = func.call @cc_cons(%7561, %7562) : (i64, i64) -> i64
        %7564 = func.call @cc_values_pack(%7563) : (i64) -> i64
        %7565 = func.call @cc_set_symbol_value(%7561, %7547) : (i64, i64) -> i64
        %7566 = llvm.mlir.addressof @str589 : !llvm.ptr
        %7567 = arith.constant 40 : i64
        %7568 = func.call @cc_make_string(%7566, %7567) : (!llvm.ptr, i64) -> i64
        %7569 = func.call @cc_nil_value() : () -> i64
        %7570 = func.call @cc_intern(%7568, %7569) : (i64, i64) -> i64
        %7571 = func.call @cc_nil_value() : () -> i64
        %7572 = func.call @cc_cons(%7570, %7571) : (i64, i64) -> i64
        %7573 = func.call @cc_values_pack(%7572) : (i64) -> i64
        %7574 = func.call @cc_set_symbol_value(%7570, %7547) : (i64, i64) -> i64
        %7575:5 = scf.while (%arg0 = %7541, %arg1 = %7538, %arg2 = %7539, %arg3 = %7540, %arg4 = %7537) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_666 = arith.constant 0 : i64
          %7576 = arith.addi %arg4, %__rlasp_stack_elide_zero_666 : i64
          %7577 = arith.constant 65536 : i64
          %7578 = func.call @cc_box_fixnum(%7577) : (i64) -> i64
          %7579 = llvm.mlir.addressof @str590 : !llvm.ptr
          %7580 = arith.constant 15 : i64
          %7581 = func.call @cc_make_string(%7579, %7580) : (!llvm.ptr, i64) -> i64
          %7582 = llvm.mlir.addressof @str591 : !llvm.ptr
          %7583 = arith.constant 11 : i64
          %7584 = func.call @cc_make_string(%7582, %7583) : (!llvm.ptr, i64) -> i64
          %7585 = func.call @cc_intern(%7581, %7584) : (i64, i64) -> i64
          %7586 = func.call @cc_nil_value() : () -> i64
          %7587 = func.call @cc_cons(%7585, %7586) : (i64, i64) -> i64
          %7588 = func.call @cc_values_pack(%7587) : (i64) -> i64
          %7589 = func.call @cc_symbol_value(%7585) : (i64) -> i64
          %7590 = func.call @cc_nil_value() : () -> i64
          %7591 = func.call @cc_errorp(%7578) : (i64) -> i64
          %7592 = arith.cmpi ne, %7591, %7590 : i64
          %7593 = arith.cmpi eq, %7590, %7590 : i64
          %7594 = arith.andi %7592, %7593 : i1
          %7595 = scf.if %7594 -> (i64) {
            scf.yield %7578 : i64
          } else {
            scf.yield %7590 : i64
          }
          %7596 = func.call @cc_errorp(%7589) : (i64) -> i64
          %7597 = arith.cmpi ne, %7596, %7590 : i64
          %7598 = arith.cmpi eq, %7595, %7590 : i64
          %7599 = arith.andi %7597, %7598 : i1
          %7600 = scf.if %7599 -> (i64) {
            scf.yield %7589 : i64
          } else {
            scf.yield %7595 : i64
          }
          %7601 = arith.cmpi ne, %7600, %7590 : i64
          scf.if %7601 {
            func.call @stack_push_pointer(%7600) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%7578) : (i64) -> ()
            func.call @stack_push_pointer(%7589) : (i64) -> ()
            %7602 = llvm.mlir.addressof @str592 : !llvm.ptr
            %7603 = func.call @cc_make_function_ref_const(%7602) : (!llvm.ptr) -> i64
            %7604 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%7603, %7604) : (i64, i64) -> ()
          }
          %7605 = func.call @stack_pop_pointer() : () -> i64
          %7606 = arith.constant 1 : i1
          %7608 = arith.constant 3 : i64
          %7607 = arith.andi %7576, %7608 : i64
          %7609 = arith.constant 0 : i64
          %7610 = arith.cmpi eq, %7607, %7609 : i64
          %7612 = arith.constant 3 : i64
          %7611 = arith.andi %7605, %7612 : i64
          %7613 = arith.constant 0 : i64
          %7614 = arith.cmpi eq, %7611, %7613 : i64
          %7615 = arith.andi %7610, %7614 : i1
          %7616 = scf.if %7615 -> (i1) {
            %7617 = arith.constant 2 : i64
            %7618 = arith.shrsi %7576, %7617 : i64
            %7619 = arith.constant 2 : i64
            %7620 = arith.shrsi %7605, %7619 : i64
            %7621 = arith.cmpi slt, %7618, %7620 : i64
            scf.yield %7621 : i1
          } else {
            %7622 = func.call @cc_lt(%7576, %7605) : (i64, i64) -> i64
            %7623 = func.call @cc_nil_value() : () -> i64
            %7624 = arith.cmpi ne, %7622, %7623 : i64
            scf.yield %7624 : i1
          }
          %7625 = arith.andi %7606, %7616 : i1
          %7626 = func.call @cc_nil_value() : () -> i64
          %7627 = func.call @cc_t_value() : () -> i64
          %7628 = scf.if %7625 -> (i64) {
            scf.yield %7627 : i64
          } else {
            scf.yield %7626 : i64
          }
          %__rlasp_stack_elide_zero_667 = arith.constant 0 : i64
          %7629 = arith.addi %7628, %__rlasp_stack_elide_zero_667 : i64
          %7630 = func.call @cc_nil_value() : () -> i64
          %7631 = arith.cmpi ne, %7629, %7630 : i64
          %7632 = func.call @cc_nil_value() : () -> i64
          %7633 = llvm.mlir.addressof @str593 : !llvm.ptr
          %7634 = arith.constant 38 : i64
          %7635 = func.call @cc_make_string(%7633, %7634) : (!llvm.ptr, i64) -> i64
          %7636 = func.call @cc_nil_value() : () -> i64
          %7637 = func.call @cc_intern(%7635, %7636) : (i64, i64) -> i64
          %7638 = func.call @cc_nil_value() : () -> i64
          %7639 = func.call @cc_cons(%7637, %7638) : (i64, i64) -> i64
          %7640 = func.call @cc_values_pack(%7639) : (i64) -> i64
          %7641 = func.call @cc_symbol_value(%7637) : (i64) -> i64
          %7642 = arith.cmpi ne, %7641, %7632 : i64
          %7643 = llvm.mlir.addressof @str594 : !llvm.ptr
          %7644 = arith.constant 38 : i64
          %7645 = func.call @cc_make_string(%7643, %7644) : (!llvm.ptr, i64) -> i64
          %7646 = func.call @cc_nil_value() : () -> i64
          %7647 = func.call @cc_intern(%7645, %7646) : (i64, i64) -> i64
          %7648 = func.call @cc_nil_value() : () -> i64
          %7649 = func.call @cc_cons(%7647, %7648) : (i64, i64) -> i64
          %7650 = func.call @cc_values_pack(%7649) : (i64) -> i64
          %7651 = func.call @cc_symbol_value(%7647) : (i64) -> i64
          %7652 = arith.cmpi ne, %7651, %7632 : i64
          %7653 = arith.ori %7642, %7652 : i1
          %7654 = arith.constant 0 : i1
          %7655 = arith.cmpi eq, %7653, %7654 : i1
          %7656 = arith.andi %7631, %7655 : i1
          scf.condition(%7656) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%7657: i64, %7658: i64, %7659: i64, %7660: i64, %7661: i64):
          %7662 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%7662) : (i64) -> ()
          %7663 = func.call @stack_depth() : () -> i64
          %7664 = arith.constant 0 : i64
          %7665 = arith.cmpi sgt, %7663, %7664 : i64
          scf.if %7665 {
            %7666 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%7661) : (i64) -> ()
          %7667 = func.call @stack_depth() : () -> i64
          %7668 = arith.constant 0 : i64
          %7669 = arith.cmpi sgt, %7667, %7668 : i64
          scf.if %7669 {
            %7670 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_668 = arith.constant 0 : i64
          %7671 = arith.addi %7661, %__rlasp_stack_elide_zero_668 : i64
          %7672 = func.call @cc_unbox_fixnum(%7671) : (i64) -> i64
          %7673 = func.call @cc_box_character(%7672) : (i64) -> i64
          %__rlasp_stack_elide_zero_669 = arith.constant 0 : i64
          %7674 = arith.addi %7673, %__rlasp_stack_elide_zero_669 : i64
          func.call @stack_push_pointer(%7674) : (i64) -> ()
          %7675 = func.call @stack_depth() : () -> i64
          %7676 = arith.constant 0 : i64
          %7677 = arith.cmpi sgt, %7675, %7676 : i64
          scf.if %7677 {
            %7678 = func.call @stack_pop_pointer() : () -> i64
          }
          %7679 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_670 = arith.constant 0 : i64
          %7680 = arith.addi %7674, %__rlasp_stack_elide_zero_670 : i64
          %7681 = func.call @cc_characterp(%7680) : (i64) -> i64
          %__rlasp_stack_elide_zero_671 = arith.constant 0 : i64
          %7682 = arith.addi %7681, %__rlasp_stack_elide_zero_671 : i64
          %7683 = func.call @cc_nil_value() : () -> i64
          %7684 = func.call @cc_cons(%7682, %7683) : (i64, i64) -> i64
          %7685 = func.call @cc_not(%7684) : (i64) -> i64
          %__rlasp_stack_elide_zero_672 = arith.constant 0 : i64
          %7686 = arith.addi %7685, %__rlasp_stack_elide_zero_672 : i64
          %7687 = func.call @cc_nil_value() : () -> i64
          %7688 = func.call @cc_errorp(%7674) : (i64) -> i64
          %7689 = arith.cmpi ne, %7688, %7687 : i64
          %7690 = arith.cmpi eq, %7687, %7687 : i64
          %7691 = arith.andi %7689, %7690 : i1
          %7692 = scf.if %7691 -> (i64) {
            scf.yield %7674 : i64
          } else {
            scf.yield %7687 : i64
          }
          %7693 = arith.cmpi ne, %7692, %7687 : i64
          scf.if %7693 {
            func.call @stack_push_pointer(%7692) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%7674) : (i64) -> ()
            %7694 = llvm.mlir.addressof @str595 : !llvm.ptr
            %7695 = func.call @cc_make_function_ref_const(%7694) : (!llvm.ptr) -> i64
            %7696 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%7695, %7696) : (i64, i64) -> ()
          }
          %7697 = func.call @stack_pop_pointer() : () -> i64
          %7698 = func.call @cc_nil_value() : () -> i64
          %7699 = arith.cmpi ne, %7697, %7698 : i64
          scf.if %7699 {
            %7700 = func.call @cc_nil_value() : () -> i64
            %7701 = func.call @cc_nil_value() : () -> i64
            %7702 = func.call @cc_errorp(%7674) : (i64) -> i64
            %7703 = arith.cmpi ne, %7702, %7701 : i64
            %7704 = arith.cmpi eq, %7701, %7701 : i64
            %7705 = arith.andi %7703, %7704 : i1
            %7706 = scf.if %7705 -> (i64) {
              scf.yield %7674 : i64
            } else {
              scf.yield %7701 : i64
            }
            %7707 = arith.cmpi ne, %7706, %7701 : i64
            scf.if %7707 {
              func.call @stack_push_pointer(%7706) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7674) : (i64) -> ()
              %7708 = llvm.mlir.addressof @str596 : !llvm.ptr
              %7709 = func.call @cc_make_function_ref_const(%7708) : (!llvm.ptr) -> i64
              %7710 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7709, %7710) : (i64, i64) -> ()
            }
            %7711 = func.call @stack_pop_pointer() : () -> i64
            %7712 = func.call @cc_nil_value() : () -> i64
            %7713 = func.call @cc_nil_value() : () -> i64
            %7714 = func.call @cc_errorp(%7674) : (i64) -> i64
            %7715 = arith.cmpi ne, %7714, %7713 : i64
            %7716 = arith.cmpi eq, %7713, %7713 : i64
            %7717 = arith.andi %7715, %7716 : i1
            %7718 = scf.if %7717 -> (i64) {
              scf.yield %7674 : i64
            } else {
              scf.yield %7713 : i64
            }
            %7719 = arith.cmpi ne, %7718, %7713 : i64
            scf.if %7719 {
              func.call @stack_push_pointer(%7718) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7674) : (i64) -> ()
              %7720 = llvm.mlir.addressof @str597 : !llvm.ptr
              %7721 = func.call @cc_make_function_ref_const(%7720) : (!llvm.ptr) -> i64
              %7722 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7721, %7722) : (i64, i64) -> ()
            }
            %7723 = func.call @stack_pop_pointer() : () -> i64
            %7724 = func.call @cc_nil_value() : () -> i64
            %7725 = func.call @cc_errorp(%7674) : (i64) -> i64
            %7726 = arith.cmpi ne, %7725, %7724 : i64
            %7727 = arith.cmpi eq, %7724, %7724 : i64
            %7728 = arith.andi %7726, %7727 : i1
            %7729 = scf.if %7728 -> (i64) {
              scf.yield %7674 : i64
            } else {
              scf.yield %7724 : i64
            }
            %7730 = arith.cmpi ne, %7729, %7724 : i64
            scf.if %7730 {
              func.call @stack_push_pointer(%7729) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7674) : (i64) -> ()
              %7731 = llvm.mlir.addressof @str598 : !llvm.ptr
              %7732 = func.call @cc_make_function_ref_const(%7731) : (!llvm.ptr) -> i64
              %7733 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7732, %7733) : (i64, i64) -> ()
            }
            %7734 = func.call @stack_pop_pointer() : () -> i64
            %7735 = func.call @cc_cons(%7734, %7712) : (i64, i64) -> i64
            %7736 = func.call @cc_cons(%7723, %7735) : (i64, i64) -> i64
            %7737 = func.call @cc_or(%7736) : (i64) -> i64
            %__rlasp_stack_elide_zero_673 = arith.constant 0 : i64
            %7738 = arith.addi %7737, %__rlasp_stack_elide_zero_673 : i64
            %7739 = func.call @cc_cons(%7738, %7700) : (i64, i64) -> i64
            %7740 = func.call @cc_cons(%7711, %7739) : (i64, i64) -> i64
            %7741 = func.call @cc_and(%7740) : (i64) -> i64
            func.call @stack_push_pointer(%7741) : (i64) -> ()
          } else {
            %7742 = func.call @cc_nil_value() : () -> i64
            %7743 = func.call @cc_nil_value() : () -> i64
            %7744 = func.call @cc_errorp(%7674) : (i64) -> i64
            %7745 = arith.cmpi ne, %7744, %7743 : i64
            %7746 = arith.cmpi eq, %7743, %7743 : i64
            %7747 = arith.andi %7745, %7746 : i1
            %7748 = scf.if %7747 -> (i64) {
              scf.yield %7674 : i64
            } else {
              scf.yield %7743 : i64
            }
            %7749 = arith.cmpi ne, %7748, %7743 : i64
            scf.if %7749 {
              func.call @stack_push_pointer(%7748) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7674) : (i64) -> ()
              %7750 = llvm.mlir.addressof @str599 : !llvm.ptr
              %7751 = func.call @cc_make_function_ref_const(%7750) : (!llvm.ptr) -> i64
              %7752 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7751, %7752) : (i64, i64) -> ()
            }
            %7753 = func.call @stack_pop_pointer() : () -> i64
            %7754 = func.call @cc_nil_value() : () -> i64
            %7755 = func.call @cc_errorp(%7674) : (i64) -> i64
            %7756 = arith.cmpi ne, %7755, %7754 : i64
            %7757 = arith.cmpi eq, %7754, %7754 : i64
            %7758 = arith.andi %7756, %7757 : i1
            %7759 = scf.if %7758 -> (i64) {
              scf.yield %7674 : i64
            } else {
              scf.yield %7754 : i64
            }
            %7760 = arith.cmpi ne, %7759, %7754 : i64
            scf.if %7760 {
              func.call @stack_push_pointer(%7759) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7674) : (i64) -> ()
              %7761 = llvm.mlir.addressof @str600 : !llvm.ptr
              %7762 = func.call @cc_make_function_ref_const(%7761) : (!llvm.ptr) -> i64
              %7763 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7762, %7763) : (i64, i64) -> ()
            }
            %7764 = func.call @stack_pop_pointer() : () -> i64
            %7765 = func.call @cc_cons(%7764, %7742) : (i64, i64) -> i64
            %7766 = func.call @cc_cons(%7753, %7765) : (i64, i64) -> i64
            %7767 = func.call @cc_or(%7766) : (i64) -> i64
            %__rlasp_stack_elide_zero_674 = arith.constant 0 : i64
            %7768 = arith.addi %7767, %__rlasp_stack_elide_zero_674 : i64
            %7769 = func.call @cc_nil_value() : () -> i64
            %7770 = func.call @cc_cons(%7768, %7769) : (i64, i64) -> i64
            %7771 = func.call @cc_not(%7770) : (i64) -> i64
            func.call @stack_push_pointer(%7771) : (i64) -> ()
          }
          %7772 = func.call @stack_pop_pointer() : () -> i64
          %7773 = func.call @cc_cons(%7772, %7679) : (i64, i64) -> i64
          %7774 = func.call @cc_cons(%7686, %7773) : (i64, i64) -> i64
          %7775 = func.call @cc_or(%7774) : (i64) -> i64
          %__rlasp_stack_elide_zero_675 = arith.constant 0 : i64
          %7776 = arith.addi %7775, %__rlasp_stack_elide_zero_675 : i64
          %7777 = func.call @cc_nil_value() : () -> i64
          %7778 = func.call @cc_cons(%7776, %7777) : (i64, i64) -> i64
          %7779 = func.call @cc_not(%7778) : (i64) -> i64
          %__rlasp_stack_elide_zero_676 = arith.constant 0 : i64
          %7780 = arith.addi %7779, %__rlasp_stack_elide_zero_676 : i64
          %7781 = func.call @cc_nil_value() : () -> i64
          %7782 = arith.cmpi ne, %7780, %7781 : i64
          %7783:2 = scf.if %7782 -> (i64, i64) {
            %7784 = func.call @cc_nil_value() : () -> i64
            %7785 = func.call @cc_nil_value() : () -> i64
            %7786 = func.call @cc_errorp(%7784) : (i64) -> i64
            %7787 = arith.cmpi ne, %7786, %7785 : i64
            %7788:2 = scf.if %7787 -> (i64, i64) {
              scf.yield %7784, %7660 : i64, i64
            } else {
              func.call @stack_push_pointer(%7660) : (i64) -> ()
              %__rlasp_stack_elide_zero_677 = arith.constant 0 : i64
              %7789 = arith.addi %7674, %__rlasp_stack_elide_zero_677 : i64
              %7790 = func.call @cc_char_name(%7789) : (i64) -> i64
              %__rlasp_stack_elide_zero_678 = arith.constant 0 : i64
              %7791 = arith.addi %7790, %__rlasp_stack_elide_zero_678 : i64
              %7792 = func.call @cc_nil_value() : () -> i64
              %7793 = func.call @cc_errorp(%7791) : (i64) -> i64
              %7794 = arith.cmpi ne, %7793, %7792 : i64
              %7795 = arith.cmpi eq, %7792, %7792 : i64
              %7796 = arith.andi %7794, %7795 : i1
              %7797 = scf.if %7796 -> (i64) {
                scf.yield %7791 : i64
              } else {
                scf.yield %7792 : i64
              }
              %7798 = arith.cmpi ne, %7797, %7792 : i64
              scf.if %7798 {
                func.call @stack_push_pointer(%7797) : (i64) -> ()
              } else {
                %7799 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%7799) : (i64) -> ()
                %__rlasp_stack_elide_zero_679 = arith.constant 0 : i64
                %7800 = arith.addi %7791, %__rlasp_stack_elide_zero_679 : i64
                %7801 = func.call @stack_pop_pointer() : () -> i64
                %7802 = func.call @cc_cons(%7800, %7801) : (i64, i64) -> i64
                func.call @stack_push_pointer(%7802) : (i64) -> ()
              }
              %7803 = func.call @stack_pop_pointer() : () -> i64
              %7804 = func.call @stack_pop_pointer() : () -> i64
              %7805 = func.call @cc_append(%7804, %7803) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_680 = arith.constant 0 : i64
              %7806 = arith.addi %7805, %__rlasp_stack_elide_zero_680 : i64
              %__rlasp_stack_elide_zero_681 = arith.constant 0 : i64
              %7807 = arith.addi %7806, %__rlasp_stack_elide_zero_681 : i64
              scf.yield %7807, %7806 : i64, i64
            }
            %__rlasp_stack_elide_zero_682 = arith.constant 0 : i64
            %7808 = arith.addi %7788#0, %__rlasp_stack_elide_zero_682 : i64
            scf.yield %7808, %7788#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %7809 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %7809, %7660 : i64, i64
          }
          func.call @stack_push_pointer(%7783#0) : (i64) -> ()
          %7810 = func.call @stack_depth() : () -> i64
          %7811 = arith.constant 0 : i64
          %7812 = arith.cmpi sgt, %7810, %7811 : i64
          scf.if %7812 {
            %7813 = func.call @stack_pop_pointer() : () -> i64
          }
          %7814 = arith.constant 1 : i64
          %7815 = func.call @cc_box_fixnum(%7814) : (i64) -> i64
          %7817 = arith.constant 3 : i64
          %7816 = arith.andi %7661, %7817 : i64
          %7818 = arith.constant 0 : i64
          %7819 = arith.cmpi eq, %7816, %7818 : i64
          %7821 = arith.constant 3 : i64
          %7820 = arith.andi %7815, %7821 : i64
          %7822 = arith.constant 0 : i64
          %7823 = arith.cmpi eq, %7820, %7822 : i64
          %7824 = arith.andi %7819, %7823 : i1
          %7825 = scf.if %7824 -> (i64) {
            %7826 = arith.constant 2 : i64
            %7827 = arith.shrsi %7661, %7826 : i64
            %7828 = arith.constant 2 : i64
            %7829 = arith.shrsi %7815, %7828 : i64
            %7830 = arith.addi %7827, %7829 : i64
            %7831 = arith.constant -2305843009213693952 : i64
            %7832 = arith.constant 2305843009213693951 : i64
            %7833 = arith.cmpi sge, %7830, %7831 : i64
            %7834 = arith.cmpi sle, %7830, %7832 : i64
            %7835 = arith.andi %7833, %7834 : i1
            %7836 = scf.if %7835 -> (i64) {
              %7837 = arith.constant 2 : i64
              %7838 = arith.shli %7830, %7837 : i64
              scf.yield %7838 : i64
            } else {
              %7839 = func.call @cc_add(%7661, %7815) : (i64, i64) -> i64
              scf.yield %7839 : i64
            }
            scf.yield %7836 : i64
          } else {
            %7840 = func.call @cc_add(%7661, %7815) : (i64, i64) -> i64
            scf.yield %7840 : i64
          }
          %__rlasp_stack_elide_zero_683 = arith.constant 0 : i64
          %7841 = arith.addi %7825, %__rlasp_stack_elide_zero_683 : i64
          func.call @stack_push_pointer(%7841) : (i64) -> ()
          %7842 = func.call @stack_depth() : () -> i64
          %7843 = arith.constant 0 : i64
          %7844 = arith.cmpi sgt, %7842, %7843 : i64
          scf.if %7844 {
            %7845 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %7662, %7661, %7674, %7783#1, %7841 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %7846 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_684 = arith.constant 0 : i64
        %7847 = arith.addi %7575#0, %__rlasp_stack_elide_zero_684 : i64
        %7848 = func.call @cc_nil_value() : () -> i64
        %7849 = arith.cmpi ne, %7847, %7848 : i64
        %7850:2 = scf.if %7849 -> (i64, i64) {
          %7851 = func.call @cc_nil_value() : () -> i64
          %7852 = func.call @cc_nil_value() : () -> i64
          %7853 = func.call @cc_errorp(%7851) : (i64) -> i64
          %7854 = arith.cmpi ne, %7853, %7852 : i64
          %7855:2 = scf.if %7854 -> (i64, i64) {
            scf.yield %7851, %7575#4 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_685 = arith.constant 0 : i64
            %7856 = arith.addi %7575#1, %__rlasp_stack_elide_zero_685 : i64
            scf.yield %7856, %7575#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_686 = arith.constant 0 : i64
          %7857 = arith.addi %7855#0, %__rlasp_stack_elide_zero_686 : i64
          scf.yield %7857, %7855#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %7858 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %7858, %7575#4 : i64, i64
        }
        %__rlasp_stack_elide_zero_687 = arith.constant 0 : i64
        %7859 = arith.addi %7850#0, %__rlasp_stack_elide_zero_687 : i64
        %__rlasp_stack_elide_zero_688 = arith.constant 0 : i64
        %7860 = arith.addi %7575#3, %__rlasp_stack_elide_zero_688 : i64
        %7861 = func.call @cc_multiple_value_list(%7860) : (i64) -> i64
        %7862 = llvm.mlir.addressof @str601 : !llvm.ptr
        %7863 = arith.constant 38 : i64
        %7864 = func.call @cc_make_string(%7862, %7863) : (!llvm.ptr, i64) -> i64
        %7865 = func.call @cc_nil_value() : () -> i64
        %7866 = func.call @cc_intern(%7864, %7865) : (i64, i64) -> i64
        %7867 = func.call @cc_nil_value() : () -> i64
        %7868 = func.call @cc_cons(%7866, %7867) : (i64, i64) -> i64
        %7869 = func.call @cc_values_pack(%7868) : (i64) -> i64
        %7870 = func.call @cc_symbol_value(%7866) : (i64) -> i64
        %7871 = llvm.mlir.addressof @str602 : !llvm.ptr
        %7872 = arith.constant 39 : i64
        %7873 = func.call @cc_make_string(%7871, %7872) : (!llvm.ptr, i64) -> i64
        %7874 = func.call @cc_nil_value() : () -> i64
        %7875 = func.call @cc_intern(%7873, %7874) : (i64, i64) -> i64
        %7876 = func.call @cc_nil_value() : () -> i64
        %7877 = func.call @cc_cons(%7875, %7876) : (i64, i64) -> i64
        %7878 = func.call @cc_values_pack(%7877) : (i64) -> i64
        %7879 = func.call @cc_symbol_value(%7875) : (i64) -> i64
        %7880 = llvm.mlir.addressof @str603 : !llvm.ptr
        %7881 = arith.constant 40 : i64
        %7882 = func.call @cc_make_string(%7880, %7881) : (!llvm.ptr, i64) -> i64
        %7883 = func.call @cc_nil_value() : () -> i64
        %7884 = func.call @cc_intern(%7882, %7883) : (i64, i64) -> i64
        %7885 = func.call @cc_nil_value() : () -> i64
        %7886 = func.call @cc_cons(%7884, %7885) : (i64, i64) -> i64
        %7887 = func.call @cc_values_pack(%7886) : (i64) -> i64
        %7888 = func.call @cc_symbol_value(%7884) : (i64) -> i64
        %7889 = func.call @cc_nil_value() : () -> i64
        %7890 = arith.cmpi ne, %7870, %7889 : i64
        %7891 = scf.if %7890 -> (i64) {
          scf.yield %7888 : i64
        } else {
          scf.yield %7861 : i64
        }
        %7892 = func.call @cc_values_pack(%7891) : (i64) -> i64
        %__rlasp_stack_elide_zero_689 = arith.constant 0 : i64
        %7893 = arith.addi %7892, %__rlasp_stack_elide_zero_689 : i64
        scf.yield %7893, %7575#0, %7575#1, %7575#3, %7850#1, %7575#2 : i64, i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_690 = arith.constant 0 : i64
      %7894 = arith.addi %7546#0, %__rlasp_stack_elide_zero_690 : i64
      scf.yield %7894 : i64
    }
    func.call @stack_push_pointer(%7535) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192224"() {
    %8592 = func.call @cc_nil_value() : () -> i64
    %8593 = func.call @cc_nil_value() : () -> i64
    %8594 = func.call @cc_errorp(%8592) : (i64) -> i64
    %8595 = arith.cmpi ne, %8594, %8593 : i64
    %8596 = scf.if %8595 -> (i64) {
      scf.yield %8592 : i64
    } else {
      %8597 = llvm.mlir.addressof @str688 : !llvm.ptr
      %8598 = arith.constant 7 : i64
      %8599 = func.call @cc_make_string(%8597, %8598) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8599) : (i64) -> ()
      %8600 = llvm.mlir.addressof @str689 : !llvm.ptr
      %8601 = arith.constant 5 : i64
      %8602 = func.call @cc_make_string(%8600, %8601) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8602) : (i64) -> ()
      %8603 = llvm.mlir.addressof @str690 : !llvm.ptr
      %8604 = arith.constant 6 : i64
      %8605 = func.call @cc_make_string(%8603, %8604) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8605) : (i64) -> ()
      %8606 = llvm.mlir.addressof @str691 : !llvm.ptr
      %8607 = arith.constant 4 : i64
      %8608 = func.call @cc_make_string(%8606, %8607) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8608) : (i64) -> ()
      %8609 = llvm.mlir.addressof @str692 : !llvm.ptr
      %8610 = arith.constant 3 : i64
      %8611 = func.call @cc_make_string(%8609, %8610) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8611) : (i64) -> ()
      %8612 = llvm.mlir.addressof @str693 : !llvm.ptr
      %8613 = arith.constant 9 : i64
      %8614 = func.call @cc_make_string(%8612, %8613) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8614) : (i64) -> ()
      %8615 = llvm.mlir.addressof @str694 : !llvm.ptr
      %8616 = arith.constant 6 : i64
      %8617 = func.call @cc_make_string(%8615, %8616) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8617) : (i64) -> ()
      %8618 = llvm.mlir.addressof @str695 : !llvm.ptr
      %8619 = arith.constant 8 : i64
      %8620 = func.call @cc_make_string(%8618, %8619) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8620) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8621 = func.call @stack_pop_pointer() : () -> i64
      %8622 = func.call @stack_pop_pointer() : () -> i64
      %8623 = func.call @cc_cons(%8622, %8621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_691 = arith.constant 0 : i64
      %8624 = arith.addi %8623, %__rlasp_stack_elide_zero_691 : i64
      %8625 = func.call @stack_pop_pointer() : () -> i64
      %8626 = func.call @cc_cons(%8625, %8624) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_692 = arith.constant 0 : i64
      %8627 = arith.addi %8626, %__rlasp_stack_elide_zero_692 : i64
      %8628 = func.call @stack_pop_pointer() : () -> i64
      %8629 = func.call @cc_cons(%8628, %8627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_693 = arith.constant 0 : i64
      %8630 = arith.addi %8629, %__rlasp_stack_elide_zero_693 : i64
      %8631 = func.call @stack_pop_pointer() : () -> i64
      %8632 = func.call @cc_cons(%8631, %8630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_694 = arith.constant 0 : i64
      %8633 = arith.addi %8632, %__rlasp_stack_elide_zero_694 : i64
      %8634 = func.call @stack_pop_pointer() : () -> i64
      %8635 = func.call @cc_cons(%8634, %8633) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_695 = arith.constant 0 : i64
      %8636 = arith.addi %8635, %__rlasp_stack_elide_zero_695 : i64
      %8637 = func.call @stack_pop_pointer() : () -> i64
      %8638 = func.call @cc_cons(%8637, %8636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_696 = arith.constant 0 : i64
      %8639 = arith.addi %8638, %__rlasp_stack_elide_zero_696 : i64
      %8640 = func.call @stack_pop_pointer() : () -> i64
      %8641 = func.call @cc_cons(%8640, %8639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_697 = arith.constant 0 : i64
      %8642 = arith.addi %8641, %__rlasp_stack_elide_zero_697 : i64
      %8643 = func.call @stack_pop_pointer() : () -> i64
      %8644 = func.call @cc_cons(%8643, %8642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8644) : (i64) -> ()
      %8645 = llvm.mlir.addressof @str696 : !llvm.ptr
      %8646 = arith.constant 4 : i64
      %8647 = func.call @cc_make_string(%8645, %8646) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8647) : (i64) -> ()
      %8648 = llvm.mlir.addressof @str697 : !llvm.ptr
      %8649 = arith.constant 3 : i64
      %8650 = func.call @cc_make_string(%8648, %8649) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8650) : (i64) -> ()
      %8651 = llvm.mlir.addressof @str698 : !llvm.ptr
      %8652 = arith.constant 4 : i64
      %8653 = func.call @cc_make_string(%8651, %8652) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8653) : (i64) -> ()
      %8654 = llvm.mlir.addressof @str699 : !llvm.ptr
      %8655 = arith.constant 16 : i64
      %8656 = func.call @cc_make_string(%8654, %8655) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8656) : (i64) -> ()
      %8657 = llvm.mlir.addressof @str700 : !llvm.ptr
      %8658 = arith.constant 14 : i64
      %8659 = func.call @cc_make_string(%8657, %8658) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8659) : (i64) -> ()
      %8660 = llvm.mlir.addressof @str701 : !llvm.ptr
      %8661 = arith.constant 9 : i64
      %8662 = func.call @cc_make_string(%8660, %8661) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8662) : (i64) -> ()
      %8663 = llvm.mlir.addressof @str702 : !llvm.ptr
      %8664 = arith.constant 5 : i64
      %8665 = func.call @cc_make_string(%8663, %8664) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8665) : (i64) -> ()
      %8666 = llvm.mlir.addressof @str703 : !llvm.ptr
      %8667 = arith.constant 10 : i64
      %8668 = func.call @cc_make_string(%8666, %8667) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8668) : (i64) -> ()
      %8669 = llvm.mlir.addressof @str704 : !llvm.ptr
      %8670 = arith.constant 5 : i64
      %8671 = func.call @cc_make_string(%8669, %8670) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8671) : (i64) -> ()
      %8672 = llvm.mlir.addressof @str705 : !llvm.ptr
      %8673 = arith.constant 13 : i64
      %8674 = func.call @cc_make_string(%8672, %8673) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8674) : (i64) -> ()
      %8675 = llvm.mlir.addressof @str706 : !llvm.ptr
      %8676 = arith.constant 22 : i64
      %8677 = func.call @cc_make_string(%8675, %8676) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8677) : (i64) -> ()
      %8678 = llvm.mlir.addressof @str707 : !llvm.ptr
      %8679 = arith.constant 20 : i64
      %8680 = func.call @cc_make_string(%8678, %8679) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8680) : (i64) -> ()
      %8681 = llvm.mlir.addressof @str708 : !llvm.ptr
      %8682 = arith.constant 18 : i64
      %8683 = func.call @cc_make_string(%8681, %8682) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8683) : (i64) -> ()
      %8684 = llvm.mlir.addressof @str709 : !llvm.ptr
      %8685 = arith.constant 5 : i64
      %8686 = func.call @cc_make_string(%8684, %8685) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8686) : (i64) -> ()
      %8687 = llvm.mlir.addressof @str710 : !llvm.ptr
      %8688 = arith.constant 3 : i64
      %8689 = func.call @cc_make_string(%8687, %8688) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8689) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8690 = func.call @stack_pop_pointer() : () -> i64
      %8691 = func.call @stack_pop_pointer() : () -> i64
      %8692 = func.call @cc_cons(%8691, %8690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_698 = arith.constant 0 : i64
      %8693 = arith.addi %8692, %__rlasp_stack_elide_zero_698 : i64
      %8694 = func.call @stack_pop_pointer() : () -> i64
      %8695 = func.call @cc_cons(%8694, %8693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_699 = arith.constant 0 : i64
      %8696 = arith.addi %8695, %__rlasp_stack_elide_zero_699 : i64
      %8697 = func.call @stack_pop_pointer() : () -> i64
      %8698 = func.call @cc_cons(%8697, %8696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_700 = arith.constant 0 : i64
      %8699 = arith.addi %8698, %__rlasp_stack_elide_zero_700 : i64
      %8700 = func.call @stack_pop_pointer() : () -> i64
      %8701 = func.call @cc_cons(%8700, %8699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_701 = arith.constant 0 : i64
      %8702 = arith.addi %8701, %__rlasp_stack_elide_zero_701 : i64
      %8703 = func.call @stack_pop_pointer() : () -> i64
      %8704 = func.call @cc_cons(%8703, %8702) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_702 = arith.constant 0 : i64
      %8705 = arith.addi %8704, %__rlasp_stack_elide_zero_702 : i64
      %8706 = func.call @stack_pop_pointer() : () -> i64
      %8707 = func.call @cc_cons(%8706, %8705) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_703 = arith.constant 0 : i64
      %8708 = arith.addi %8707, %__rlasp_stack_elide_zero_703 : i64
      %8709 = func.call @stack_pop_pointer() : () -> i64
      %8710 = func.call @cc_cons(%8709, %8708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_704 = arith.constant 0 : i64
      %8711 = arith.addi %8710, %__rlasp_stack_elide_zero_704 : i64
      %8712 = func.call @stack_pop_pointer() : () -> i64
      %8713 = func.call @cc_cons(%8712, %8711) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_705 = arith.constant 0 : i64
      %8714 = arith.addi %8713, %__rlasp_stack_elide_zero_705 : i64
      %8715 = func.call @stack_pop_pointer() : () -> i64
      %8716 = func.call @cc_cons(%8715, %8714) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_706 = arith.constant 0 : i64
      %8717 = arith.addi %8716, %__rlasp_stack_elide_zero_706 : i64
      %8718 = func.call @stack_pop_pointer() : () -> i64
      %8719 = func.call @cc_cons(%8718, %8717) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_707 = arith.constant 0 : i64
      %8720 = arith.addi %8719, %__rlasp_stack_elide_zero_707 : i64
      %8721 = func.call @stack_pop_pointer() : () -> i64
      %8722 = func.call @cc_cons(%8721, %8720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_708 = arith.constant 0 : i64
      %8723 = arith.addi %8722, %__rlasp_stack_elide_zero_708 : i64
      %8724 = func.call @stack_pop_pointer() : () -> i64
      %8725 = func.call @cc_cons(%8724, %8723) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_709 = arith.constant 0 : i64
      %8726 = arith.addi %8725, %__rlasp_stack_elide_zero_709 : i64
      %8727 = func.call @stack_pop_pointer() : () -> i64
      %8728 = func.call @cc_cons(%8727, %8726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_710 = arith.constant 0 : i64
      %8729 = arith.addi %8728, %__rlasp_stack_elide_zero_710 : i64
      %8730 = func.call @stack_pop_pointer() : () -> i64
      %8731 = func.call @cc_cons(%8730, %8729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_711 = arith.constant 0 : i64
      %8732 = arith.addi %8731, %__rlasp_stack_elide_zero_711 : i64
      %8733 = func.call @stack_pop_pointer() : () -> i64
      %8734 = func.call @cc_cons(%8733, %8732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_712 = arith.constant 0 : i64
      %8735 = arith.addi %8734, %__rlasp_stack_elide_zero_712 : i64
      %8736 = func.call @stack_pop_pointer() : () -> i64
      %8737 = func.call @cc_append(%8736, %8735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8737) : (i64) -> ()
      %8738 = llvm.mlir.addressof @str711 : !llvm.ptr
      %8739 = arith.constant 3 : i64
      %8740 = func.call @cc_make_string(%8738, %8739) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8740) : (i64) -> ()
      %8741 = llvm.mlir.addressof @str712 : !llvm.ptr
      %8742 = arith.constant 3 : i64
      %8743 = func.call @cc_make_string(%8741, %8742) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8743) : (i64) -> ()
      %8744 = llvm.mlir.addressof @str713 : !llvm.ptr
      %8745 = arith.constant 3 : i64
      %8746 = func.call @cc_make_string(%8744, %8745) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8746) : (i64) -> ()
      %8747 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8748 = arith.constant 3 : i64
      %8749 = func.call @cc_make_string(%8747, %8748) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8749) : (i64) -> ()
      %8750 = llvm.mlir.addressof @str715 : !llvm.ptr
      %8751 = arith.constant 3 : i64
      %8752 = func.call @cc_make_string(%8750, %8751) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8752) : (i64) -> ()
      %8753 = llvm.mlir.addressof @str716 : !llvm.ptr
      %8754 = arith.constant 3 : i64
      %8755 = func.call @cc_make_string(%8753, %8754) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8755) : (i64) -> ()
      %8756 = llvm.mlir.addressof @str717 : !llvm.ptr
      %8757 = arith.constant 3 : i64
      %8758 = func.call @cc_make_string(%8756, %8757) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8758) : (i64) -> ()
      %8759 = llvm.mlir.addressof @str718 : !llvm.ptr
      %8760 = arith.constant 3 : i64
      %8761 = func.call @cc_make_string(%8759, %8760) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8761) : (i64) -> ()
      %8762 = llvm.mlir.addressof @str719 : !llvm.ptr
      %8763 = arith.constant 3 : i64
      %8764 = func.call @cc_make_string(%8762, %8763) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8764) : (i64) -> ()
      %8765 = llvm.mlir.addressof @str720 : !llvm.ptr
      %8766 = arith.constant 3 : i64
      %8767 = func.call @cc_make_string(%8765, %8766) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8767) : (i64) -> ()
      %8768 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8769 = arith.constant 3 : i64
      %8770 = func.call @cc_make_string(%8768, %8769) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8770) : (i64) -> ()
      %8771 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8772 = arith.constant 3 : i64
      %8773 = func.call @cc_make_string(%8771, %8772) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8773) : (i64) -> ()
      %8774 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8775 = arith.constant 3 : i64
      %8776 = func.call @cc_make_string(%8774, %8775) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8776) : (i64) -> ()
      %8777 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8778 = arith.constant 3 : i64
      %8779 = func.call @cc_make_string(%8777, %8778) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8779) : (i64) -> ()
      %8780 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8781 = arith.constant 3 : i64
      %8782 = func.call @cc_make_string(%8780, %8781) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8782) : (i64) -> ()
      %8783 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8784 = arith.constant 3 : i64
      %8785 = func.call @cc_make_string(%8783, %8784) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8785) : (i64) -> ()
      %8786 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8787 = arith.constant 3 : i64
      %8788 = func.call @cc_make_string(%8786, %8787) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8788) : (i64) -> ()
      %8789 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8790 = arith.constant 3 : i64
      %8791 = func.call @cc_make_string(%8789, %8790) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8791) : (i64) -> ()
      %8792 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8793 = arith.constant 3 : i64
      %8794 = func.call @cc_make_string(%8792, %8793) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8794) : (i64) -> ()
      %8795 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8796 = arith.constant 3 : i64
      %8797 = func.call @cc_make_string(%8795, %8796) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8797) : (i64) -> ()
      %8798 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8799 = arith.constant 3 : i64
      %8800 = func.call @cc_make_string(%8798, %8799) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8800) : (i64) -> ()
      %8801 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8802 = arith.constant 3 : i64
      %8803 = func.call @cc_make_string(%8801, %8802) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8803) : (i64) -> ()
      %8804 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8805 = arith.constant 3 : i64
      %8806 = func.call @cc_make_string(%8804, %8805) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8806) : (i64) -> ()
      %8807 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8808 = arith.constant 3 : i64
      %8809 = func.call @cc_make_string(%8807, %8808) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8809) : (i64) -> ()
      %8810 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8811 = arith.constant 3 : i64
      %8812 = func.call @cc_make_string(%8810, %8811) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8812) : (i64) -> ()
      %8813 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8814 = arith.constant 3 : i64
      %8815 = func.call @cc_make_string(%8813, %8814) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8815) : (i64) -> ()
      %8816 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8817 = arith.constant 3 : i64
      %8818 = func.call @cc_make_string(%8816, %8817) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8818) : (i64) -> ()
      %8819 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8820 = arith.constant 3 : i64
      %8821 = func.call @cc_make_string(%8819, %8820) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8821) : (i64) -> ()
      %8822 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8823 = arith.constant 3 : i64
      %8824 = func.call @cc_make_string(%8822, %8823) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8824) : (i64) -> ()
      %8825 = llvm.mlir.addressof @str740 : !llvm.ptr
      %8826 = arith.constant 3 : i64
      %8827 = func.call @cc_make_string(%8825, %8826) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8827) : (i64) -> ()
      %8828 = llvm.mlir.addressof @str741 : !llvm.ptr
      %8829 = arith.constant 3 : i64
      %8830 = func.call @cc_make_string(%8828, %8829) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8830) : (i64) -> ()
      %8831 = llvm.mlir.addressof @str742 : !llvm.ptr
      %8832 = arith.constant 3 : i64
      %8833 = func.call @cc_make_string(%8831, %8832) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8833) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8834 = func.call @stack_pop_pointer() : () -> i64
      %8835 = func.call @stack_pop_pointer() : () -> i64
      %8836 = func.call @cc_cons(%8835, %8834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_713 = arith.constant 0 : i64
      %8837 = arith.addi %8836, %__rlasp_stack_elide_zero_713 : i64
      %8838 = func.call @stack_pop_pointer() : () -> i64
      %8839 = func.call @cc_cons(%8838, %8837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_714 = arith.constant 0 : i64
      %8840 = arith.addi %8839, %__rlasp_stack_elide_zero_714 : i64
      %8841 = func.call @stack_pop_pointer() : () -> i64
      %8842 = func.call @cc_cons(%8841, %8840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_715 = arith.constant 0 : i64
      %8843 = arith.addi %8842, %__rlasp_stack_elide_zero_715 : i64
      %8844 = func.call @stack_pop_pointer() : () -> i64
      %8845 = func.call @cc_cons(%8844, %8843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_716 = arith.constant 0 : i64
      %8846 = arith.addi %8845, %__rlasp_stack_elide_zero_716 : i64
      %8847 = func.call @stack_pop_pointer() : () -> i64
      %8848 = func.call @cc_cons(%8847, %8846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_717 = arith.constant 0 : i64
      %8849 = arith.addi %8848, %__rlasp_stack_elide_zero_717 : i64
      %8850 = func.call @stack_pop_pointer() : () -> i64
      %8851 = func.call @cc_cons(%8850, %8849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_718 = arith.constant 0 : i64
      %8852 = arith.addi %8851, %__rlasp_stack_elide_zero_718 : i64
      %8853 = func.call @stack_pop_pointer() : () -> i64
      %8854 = func.call @cc_cons(%8853, %8852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_719 = arith.constant 0 : i64
      %8855 = arith.addi %8854, %__rlasp_stack_elide_zero_719 : i64
      %8856 = func.call @stack_pop_pointer() : () -> i64
      %8857 = func.call @cc_cons(%8856, %8855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_720 = arith.constant 0 : i64
      %8858 = arith.addi %8857, %__rlasp_stack_elide_zero_720 : i64
      %8859 = func.call @stack_pop_pointer() : () -> i64
      %8860 = func.call @cc_cons(%8859, %8858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_721 = arith.constant 0 : i64
      %8861 = arith.addi %8860, %__rlasp_stack_elide_zero_721 : i64
      %8862 = func.call @stack_pop_pointer() : () -> i64
      %8863 = func.call @cc_cons(%8862, %8861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_722 = arith.constant 0 : i64
      %8864 = arith.addi %8863, %__rlasp_stack_elide_zero_722 : i64
      %8865 = func.call @stack_pop_pointer() : () -> i64
      %8866 = func.call @cc_cons(%8865, %8864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_723 = arith.constant 0 : i64
      %8867 = arith.addi %8866, %__rlasp_stack_elide_zero_723 : i64
      %8868 = func.call @stack_pop_pointer() : () -> i64
      %8869 = func.call @cc_cons(%8868, %8867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_724 = arith.constant 0 : i64
      %8870 = arith.addi %8869, %__rlasp_stack_elide_zero_724 : i64
      %8871 = func.call @stack_pop_pointer() : () -> i64
      %8872 = func.call @cc_cons(%8871, %8870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_725 = arith.constant 0 : i64
      %8873 = arith.addi %8872, %__rlasp_stack_elide_zero_725 : i64
      %8874 = func.call @stack_pop_pointer() : () -> i64
      %8875 = func.call @cc_cons(%8874, %8873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_726 = arith.constant 0 : i64
      %8876 = arith.addi %8875, %__rlasp_stack_elide_zero_726 : i64
      %8877 = func.call @stack_pop_pointer() : () -> i64
      %8878 = func.call @cc_cons(%8877, %8876) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_727 = arith.constant 0 : i64
      %8879 = arith.addi %8878, %__rlasp_stack_elide_zero_727 : i64
      %8880 = func.call @stack_pop_pointer() : () -> i64
      %8881 = func.call @cc_cons(%8880, %8879) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_728 = arith.constant 0 : i64
      %8882 = arith.addi %8881, %__rlasp_stack_elide_zero_728 : i64
      %8883 = func.call @stack_pop_pointer() : () -> i64
      %8884 = func.call @cc_cons(%8883, %8882) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_729 = arith.constant 0 : i64
      %8885 = arith.addi %8884, %__rlasp_stack_elide_zero_729 : i64
      %8886 = func.call @stack_pop_pointer() : () -> i64
      %8887 = func.call @cc_cons(%8886, %8885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_730 = arith.constant 0 : i64
      %8888 = arith.addi %8887, %__rlasp_stack_elide_zero_730 : i64
      %8889 = func.call @stack_pop_pointer() : () -> i64
      %8890 = func.call @cc_cons(%8889, %8888) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_731 = arith.constant 0 : i64
      %8891 = arith.addi %8890, %__rlasp_stack_elide_zero_731 : i64
      %8892 = func.call @stack_pop_pointer() : () -> i64
      %8893 = func.call @cc_cons(%8892, %8891) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_732 = arith.constant 0 : i64
      %8894 = arith.addi %8893, %__rlasp_stack_elide_zero_732 : i64
      %8895 = func.call @stack_pop_pointer() : () -> i64
      %8896 = func.call @cc_cons(%8895, %8894) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_733 = arith.constant 0 : i64
      %8897 = arith.addi %8896, %__rlasp_stack_elide_zero_733 : i64
      %8898 = func.call @stack_pop_pointer() : () -> i64
      %8899 = func.call @cc_cons(%8898, %8897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_734 = arith.constant 0 : i64
      %8900 = arith.addi %8899, %__rlasp_stack_elide_zero_734 : i64
      %8901 = func.call @stack_pop_pointer() : () -> i64
      %8902 = func.call @cc_cons(%8901, %8900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_735 = arith.constant 0 : i64
      %8903 = arith.addi %8902, %__rlasp_stack_elide_zero_735 : i64
      %8904 = func.call @stack_pop_pointer() : () -> i64
      %8905 = func.call @cc_cons(%8904, %8903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_736 = arith.constant 0 : i64
      %8906 = arith.addi %8905, %__rlasp_stack_elide_zero_736 : i64
      %8907 = func.call @stack_pop_pointer() : () -> i64
      %8908 = func.call @cc_cons(%8907, %8906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_737 = arith.constant 0 : i64
      %8909 = arith.addi %8908, %__rlasp_stack_elide_zero_737 : i64
      %8910 = func.call @stack_pop_pointer() : () -> i64
      %8911 = func.call @cc_cons(%8910, %8909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_738 = arith.constant 0 : i64
      %8912 = arith.addi %8911, %__rlasp_stack_elide_zero_738 : i64
      %8913 = func.call @stack_pop_pointer() : () -> i64
      %8914 = func.call @cc_cons(%8913, %8912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_739 = arith.constant 0 : i64
      %8915 = arith.addi %8914, %__rlasp_stack_elide_zero_739 : i64
      %8916 = func.call @stack_pop_pointer() : () -> i64
      %8917 = func.call @cc_cons(%8916, %8915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_740 = arith.constant 0 : i64
      %8918 = arith.addi %8917, %__rlasp_stack_elide_zero_740 : i64
      %8919 = func.call @stack_pop_pointer() : () -> i64
      %8920 = func.call @cc_cons(%8919, %8918) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_741 = arith.constant 0 : i64
      %8921 = arith.addi %8920, %__rlasp_stack_elide_zero_741 : i64
      %8922 = func.call @stack_pop_pointer() : () -> i64
      %8923 = func.call @cc_cons(%8922, %8921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_742 = arith.constant 0 : i64
      %8924 = arith.addi %8923, %__rlasp_stack_elide_zero_742 : i64
      %8925 = func.call @stack_pop_pointer() : () -> i64
      %8926 = func.call @cc_cons(%8925, %8924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_743 = arith.constant 0 : i64
      %8927 = arith.addi %8926, %__rlasp_stack_elide_zero_743 : i64
      %8928 = func.call @stack_pop_pointer() : () -> i64
      %8929 = func.call @cc_cons(%8928, %8927) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_744 = arith.constant 0 : i64
      %8930 = arith.addi %8929, %__rlasp_stack_elide_zero_744 : i64
      %8931 = func.call @stack_pop_pointer() : () -> i64
      %8932 = func.call @cc_append(%8931, %8930) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_745 = arith.constant 0 : i64
      %8933 = arith.addi %8932, %__rlasp_stack_elide_zero_745 : i64
      %8934 = func.call @cc_nil_value() : () -> i64
      %8935 = func.call @cc_nil_value() : () -> i64
      %8936 = func.call @cc_nil_value() : () -> i64
      %8937 = func.call @cc_errorp(%8935) : (i64) -> i64
      %8938 = arith.cmpi ne, %8937, %8936 : i64
      %8939:2 = scf.if %8938 -> (i64, i64) {
        scf.yield %8935, %8934 : i64, i64
      } else {
        %__rlasp_stack_elide_zero_746 = arith.constant 0 : i64
        %8940 = arith.addi %8933, %__rlasp_stack_elide_zero_746 : i64
        %8941:2 = scf.while (%arg0 = %8940, %arg1 = %8934) : (i64, i64) -> (i64, i64) {
          %8942 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %8943 = arith.constant 0 : i32
          %8944 = arith.cmpi ne, %8942, %8943 : i32
          scf.condition(%8944) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%8945: i64, %8946: i64):
          %8947 = func.call @cc_car(%8945) : (i64) -> i64
          %__rlasp_stack_elide_zero_747 = arith.constant 0 : i64
          %8948 = arith.addi %8947, %__rlasp_stack_elide_zero_747 : i64
          %8949 = func.call @cc_name_char(%8948) : (i64) -> i64
          %__rlasp_stack_elide_zero_748 = arith.constant 0 : i64
          %8950 = arith.addi %8949, %__rlasp_stack_elide_zero_748 : i64
          %8951 = func.call @cc_nil_value() : () -> i64
          %8952 = func.call @cc_cons(%8950, %8951) : (i64, i64) -> i64
          %8953 = func.call @cc_not(%8952) : (i64) -> i64
          %__rlasp_stack_elide_zero_749 = arith.constant 0 : i64
          %8954 = arith.addi %8953, %__rlasp_stack_elide_zero_749 : i64
          %8955 = func.call @cc_nil_value() : () -> i64
          %8956 = arith.cmpi ne, %8954, %8955 : i64
          %8957:2 = scf.if %8956 -> (i64, i64) {
            %8958 = func.call @cc_nil_value() : () -> i64
            %8959 = func.call @cc_nil_value() : () -> i64
            %8960 = func.call @cc_errorp(%8958) : (i64) -> i64
            %8961 = arith.cmpi ne, %8960, %8959 : i64
            %8962:2 = scf.if %8961 -> (i64, i64) {
              scf.yield %8958, %8946 : i64, i64
            } else {
              %__rlasp_stack_elide_zero_750 = arith.constant 0 : i64
              %8963 = arith.addi %8947, %__rlasp_stack_elide_zero_750 : i64
              %8964 = func.call @cc_cons(%8963, %8946) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_751 = arith.constant 0 : i64
              %8965 = arith.addi %8964, %__rlasp_stack_elide_zero_751 : i64
              scf.yield %8965, %8964 : i64, i64
            }
            %__rlasp_stack_elide_zero_752 = arith.constant 0 : i64
            %8966 = arith.addi %8962#0, %__rlasp_stack_elide_zero_752 : i64
            scf.yield %8966, %8962#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %8967 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %8967, %8946 : i64, i64
          }
          func.call @stack_push_pointer(%8957#0) : (i64) -> ()
          %8968 = func.call @stack_depth() : () -> i64
          %8969 = arith.constant 0 : i64
          %8970 = arith.cmpi sgt, %8968, %8969 : i64
          scf.if %8970 {
            %8971 = func.call @stack_pop_pointer() : () -> i64
          }
          %8972 = func.call @cc_cdr(%8945) : (i64) -> i64
          scf.yield %8972, %8957#1 : i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %8973 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8973, %8941#1 : i64, i64
      }
      %8974 = func.call @cc_nil_value() : () -> i64
      %8975 = func.call @cc_errorp(%8939#0) : (i64) -> i64
      %8976 = arith.cmpi ne, %8975, %8974 : i64
      %8977:2 = scf.if %8976 -> (i64, i64) {
        scf.yield %8939#0, %8939#1 : i64, i64
      } else {
        %__rlasp_stack_elide_zero_753 = arith.constant 0 : i64
        %8978 = arith.addi %8939#1, %__rlasp_stack_elide_zero_753 : i64
        scf.yield %8978, %8939#1 : i64, i64
      }
      %__rlasp_stack_elide_zero_754 = arith.constant 0 : i64
      %8979 = arith.addi %8977#0, %__rlasp_stack_elide_zero_754 : i64
      scf.yield %8979 : i64
    }
    func.call @stack_push_pointer(%8596) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192225"() {
    %9139 = func.call @cc_nil_value() : () -> i64
    %9140 = func.call @cc_nil_value() : () -> i64
    %9141 = func.call @cc_errorp(%9139) : (i64) -> i64
    %9142 = arith.cmpi ne, %9141, %9140 : i64
    %9143 = scf.if %9142 -> (i64) {
      scf.yield %9139 : i64
    } else {
      %9144 = arith.constant 97 : i64
      %9145 = func.call @cc_box_character(%9144) : (i64) -> i64
      %9146 = arith.constant 98 : i64
      %9147 = func.call @cc_box_character(%9146) : (i64) -> i64
      %9148 = arith.constant 99 : i64
      %9149 = func.call @cc_box_character(%9148) : (i64) -> i64
      %9150 = arith.constant 100 : i64
      %9151 = func.call @cc_box_character(%9150) : (i64) -> i64
      %9152 = func.call @cc_nil_value() : () -> i64
      %9153 = func.call @cc_errorp(%9145) : (i64) -> i64
      %9154 = arith.cmpi ne, %9153, %9152 : i64
      %9155 = arith.cmpi eq, %9152, %9152 : i64
      %9156 = arith.andi %9154, %9155 : i1
      %9157 = scf.if %9156 -> (i64) {
        scf.yield %9145 : i64
      } else {
        scf.yield %9152 : i64
      }
      %9158 = func.call @cc_errorp(%9147) : (i64) -> i64
      %9159 = arith.cmpi ne, %9158, %9152 : i64
      %9160 = arith.cmpi eq, %9157, %9152 : i64
      %9161 = arith.andi %9159, %9160 : i1
      %9162 = scf.if %9161 -> (i64) {
        scf.yield %9147 : i64
      } else {
        scf.yield %9157 : i64
      }
      %9163 = func.call @cc_errorp(%9149) : (i64) -> i64
      %9164 = arith.cmpi ne, %9163, %9152 : i64
      %9165 = arith.cmpi eq, %9162, %9152 : i64
      %9166 = arith.andi %9164, %9165 : i1
      %9167 = scf.if %9166 -> (i64) {
        scf.yield %9149 : i64
      } else {
        scf.yield %9162 : i64
      }
      %9168 = func.call @cc_errorp(%9151) : (i64) -> i64
      %9169 = arith.cmpi ne, %9168, %9152 : i64
      %9170 = arith.cmpi eq, %9167, %9152 : i64
      %9171 = arith.andi %9169, %9170 : i1
      %9172 = scf.if %9171 -> (i64) {
        scf.yield %9151 : i64
      } else {
        scf.yield %9167 : i64
      }
      %9173 = arith.cmpi ne, %9172, %9152 : i64
      scf.if %9173 {
        func.call @stack_push_pointer(%9172) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9145) : (i64) -> ()
        func.call @stack_push_pointer(%9147) : (i64) -> ()
        func.call @stack_push_pointer(%9149) : (i64) -> ()
        func.call @stack_push_pointer(%9151) : (i64) -> ()
        %9174 = llvm.mlir.addressof @str754 : !llvm.ptr
        %9175 = func.call @cc_make_function_ref_const(%9174) : (!llvm.ptr) -> i64
        %9176 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%9175, %9176) : (i64, i64) -> ()
      }
      %9177 = func.call @stack_pop_pointer() : () -> i64
      %9178 = func.call @cc_nil_value() : () -> i64
      %9179 = func.call @cc_cons(%9177, %9178) : (i64, i64) -> i64
      %9180 = func.call @cc_not(%9179) : (i64) -> i64
      %__rlasp_stack_elide_zero_755 = arith.constant 0 : i64
      %9181 = arith.addi %9180, %__rlasp_stack_elide_zero_755 : i64
      %9182 = func.call @cc_nil_value() : () -> i64
      %9183 = func.call @cc_cons(%9181, %9182) : (i64, i64) -> i64
      %9184 = func.call @cc_not(%9183) : (i64) -> i64
      %__rlasp_stack_elide_zero_756 = arith.constant 0 : i64
      %9185 = arith.addi %9184, %__rlasp_stack_elide_zero_756 : i64
      scf.yield %9185 : i64
    }
    func.call @stack_push_pointer(%9143) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192226"() {
    %9370 = func.call @cc_nil_value() : () -> i64
    %9371 = func.call @cc_nil_value() : () -> i64
    %9372 = func.call @cc_errorp(%9370) : (i64) -> i64
    %9373 = arith.cmpi ne, %9372, %9371 : i64
    %9374 = scf.if %9373 -> (i64) {
      scf.yield %9370 : i64
    } else {
      %9375 = func.call @cc_nil_value() : () -> i64
      %9376 = func.call @cc_nil_value() : () -> i64
      %9377 = func.call @cc_errorp(%9375) : (i64) -> i64
      %9378 = arith.cmpi ne, %9377, %9376 : i64
      %9379 = scf.if %9378 -> (i64) {
        scf.yield %9375 : i64
      } else {
        %9380 = arith.constant 97 : i64
        %9381 = func.call @cc_box_character(%9380) : (i64) -> i64
        %9382 = arith.constant 98 : i64
        %9383 = func.call @cc_box_character(%9382) : (i64) -> i64
        %9384 = arith.constant 99 : i64
        %9385 = func.call @cc_box_character(%9384) : (i64) -> i64
        %9386 = arith.constant 100 : i64
        %9387 = func.call @cc_box_character(%9386) : (i64) -> i64
        %9388 = func.call @cc_nil_value() : () -> i64
        %9389 = func.call @cc_errorp(%9381) : (i64) -> i64
        %9390 = arith.cmpi ne, %9389, %9388 : i64
        %9391 = arith.cmpi eq, %9388, %9388 : i64
        %9392 = arith.andi %9390, %9391 : i1
        %9393 = scf.if %9392 -> (i64) {
          scf.yield %9381 : i64
        } else {
          scf.yield %9388 : i64
        }
        %9394 = func.call @cc_errorp(%9383) : (i64) -> i64
        %9395 = arith.cmpi ne, %9394, %9388 : i64
        %9396 = arith.cmpi eq, %9393, %9388 : i64
        %9397 = arith.andi %9395, %9396 : i1
        %9398 = scf.if %9397 -> (i64) {
          scf.yield %9383 : i64
        } else {
          scf.yield %9393 : i64
        }
        %9399 = func.call @cc_errorp(%9385) : (i64) -> i64
        %9400 = arith.cmpi ne, %9399, %9388 : i64
        %9401 = arith.cmpi eq, %9398, %9388 : i64
        %9402 = arith.andi %9400, %9401 : i1
        %9403 = scf.if %9402 -> (i64) {
          scf.yield %9385 : i64
        } else {
          scf.yield %9398 : i64
        }
        %9404 = func.call @cc_errorp(%9387) : (i64) -> i64
        %9405 = arith.cmpi ne, %9404, %9388 : i64
        %9406 = arith.cmpi eq, %9403, %9388 : i64
        %9407 = arith.andi %9405, %9406 : i1
        %9408 = scf.if %9407 -> (i64) {
          scf.yield %9387 : i64
        } else {
          scf.yield %9403 : i64
        }
        %9409 = arith.cmpi ne, %9408, %9388 : i64
        scf.if %9409 {
          func.call @stack_push_pointer(%9408) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9381) : (i64) -> ()
          func.call @stack_push_pointer(%9383) : (i64) -> ()
          func.call @stack_push_pointer(%9385) : (i64) -> ()
          func.call @stack_push_pointer(%9387) : (i64) -> ()
          %9410 = llvm.mlir.addressof @str768 : !llvm.ptr
          %9411 = func.call @cc_make_function_ref_const(%9410) : (!llvm.ptr) -> i64
          %9412 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%9411, %9412) : (i64, i64) -> ()
        }
        %9413 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9413 : i64
      }
      %__rlasp_stack_elide_zero_757 = arith.constant 0 : i64
      %9414 = arith.addi %9379, %__rlasp_stack_elide_zero_757 : i64
      %9415 = func.call @cc_nil_value() : () -> i64
      %9416 = func.call @cc_cons(%9414, %9415) : (i64, i64) -> i64
      %9417 = func.call @cc_not(%9416) : (i64) -> i64
      %__rlasp_stack_elide_zero_758 = arith.constant 0 : i64
      %9418 = arith.addi %9417, %__rlasp_stack_elide_zero_758 : i64
      %9419 = func.call @cc_nil_value() : () -> i64
      %9420 = func.call @cc_cons(%9418, %9419) : (i64, i64) -> i64
      %9421 = func.call @cc_not(%9420) : (i64) -> i64
      %__rlasp_stack_elide_zero_759 = arith.constant 0 : i64
      %9422 = arith.addi %9421, %__rlasp_stack_elide_zero_759 : i64
      scf.yield %9422 : i64
    }
    func.call @stack_push_pointer(%9374) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192227"() {
    %9580 = func.call @cc_nil_value() : () -> i64
    %9581 = func.call @cc_nil_value() : () -> i64
    %9582 = func.call @cc_errorp(%9580) : (i64) -> i64
    %9583 = arith.cmpi ne, %9582, %9581 : i64
    %9584 = scf.if %9583 -> (i64) {
      scf.yield %9580 : i64
    } else {
      %9585 = arith.constant 127 : i64
      %9586 = func.call @cc_box_character(%9585) : (i64) -> i64
      func.call @stack_push_pointer(%9586) : (i64) -> ()
      %9587 = arith.constant 127 : i64
      %9588 = func.call @cc_box_character(%9587) : (i64) -> i64
      %__rlasp_stack_elide_zero_760 = arith.constant 0 : i64
      %9589 = arith.addi %9588, %__rlasp_stack_elide_zero_760 : i64
      %9590 = func.call @stack_pop_pointer() : () -> i64
      %9591 = func.call @cc_eq(%9590, %9589) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_761 = arith.constant 0 : i64
      %9592 = arith.addi %9591, %__rlasp_stack_elide_zero_761 : i64
      %9593 = func.call @cc_nil_value() : () -> i64
      %9594 = func.call @cc_cons(%9592, %9593) : (i64, i64) -> i64
      %9595 = func.call @cc_not(%9594) : (i64) -> i64
      %__rlasp_stack_elide_zero_762 = arith.constant 0 : i64
      %9596 = arith.addi %9595, %__rlasp_stack_elide_zero_762 : i64
      %9597 = func.call @cc_nil_value() : () -> i64
      %9598 = func.call @cc_cons(%9596, %9597) : (i64, i64) -> i64
      %9599 = func.call @cc_not(%9598) : (i64) -> i64
      %__rlasp_stack_elide_zero_763 = arith.constant 0 : i64
      %9600 = arith.addi %9599, %__rlasp_stack_elide_zero_763 : i64
      scf.yield %9600 : i64
    }
    func.call @stack_push_pointer(%9584) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192228"() {
    %9918 = func.call @cc_nil_value() : () -> i64
    %9919 = func.call @cc_nil_value() : () -> i64
    %9920 = func.call @cc_errorp(%9918) : (i64) -> i64
    %9921 = arith.cmpi ne, %9920, %9919 : i64
    %9922 = scf.if %9921 -> (i64) {
      scf.yield %9918 : i64
    } else {
      %9923 = arith.constant 0 : i64
      %9924 = func.call @cc_box_character(%9923) : (i64) -> i64
      %__rlasp_stack_elide_zero_764 = arith.constant 0 : i64
      %9925 = arith.addi %9924, %__rlasp_stack_elide_zero_764 : i64
      %9926 = arith.constant 1 : i64
      %9927 = func.call @cc_box_character(%9926) : (i64) -> i64
      %__rlasp_stack_elide_zero_765 = arith.constant 0 : i64
      %9928 = arith.addi %9927, %__rlasp_stack_elide_zero_765 : i64
      %9929 = arith.constant 2 : i64
      %9930 = func.call @cc_box_character(%9929) : (i64) -> i64
      %__rlasp_stack_elide_zero_766 = arith.constant 0 : i64
      %9931 = arith.addi %9930, %__rlasp_stack_elide_zero_766 : i64
      %9932 = arith.constant 3 : i64
      %9933 = func.call @cc_box_character(%9932) : (i64) -> i64
      %__rlasp_stack_elide_zero_767 = arith.constant 0 : i64
      %9934 = arith.addi %9933, %__rlasp_stack_elide_zero_767 : i64
      %9935 = arith.constant 4 : i64
      %9936 = func.call @cc_box_character(%9935) : (i64) -> i64
      %__rlasp_stack_elide_zero_768 = arith.constant 0 : i64
      %9937 = arith.addi %9936, %__rlasp_stack_elide_zero_768 : i64
      %9938 = arith.constant 5 : i64
      %9939 = func.call @cc_box_character(%9938) : (i64) -> i64
      %__rlasp_stack_elide_zero_769 = arith.constant 0 : i64
      %9940 = arith.addi %9939, %__rlasp_stack_elide_zero_769 : i64
      %9941 = arith.constant 6 : i64
      %9942 = func.call @cc_box_character(%9941) : (i64) -> i64
      %__rlasp_stack_elide_zero_770 = arith.constant 0 : i64
      %9943 = arith.addi %9942, %__rlasp_stack_elide_zero_770 : i64
      %9944 = arith.constant 7 : i64
      %9945 = func.call @cc_box_character(%9944) : (i64) -> i64
      %__rlasp_stack_elide_zero_771 = arith.constant 0 : i64
      %9946 = arith.addi %9945, %__rlasp_stack_elide_zero_771 : i64
      %9947 = arith.constant 8 : i64
      %9948 = func.call @cc_box_character(%9947) : (i64) -> i64
      %__rlasp_stack_elide_zero_772 = arith.constant 0 : i64
      %9949 = arith.addi %9948, %__rlasp_stack_elide_zero_772 : i64
      %9950 = arith.constant 9 : i64
      %9951 = func.call @cc_box_character(%9950) : (i64) -> i64
      %__rlasp_stack_elide_zero_773 = arith.constant 0 : i64
      %9952 = arith.addi %9951, %__rlasp_stack_elide_zero_773 : i64
      %9953 = arith.constant 10 : i64
      %9954 = func.call @cc_box_character(%9953) : (i64) -> i64
      %__rlasp_stack_elide_zero_774 = arith.constant 0 : i64
      %9955 = arith.addi %9954, %__rlasp_stack_elide_zero_774 : i64
      %9956 = arith.constant 11 : i64
      %9957 = func.call @cc_box_character(%9956) : (i64) -> i64
      %__rlasp_stack_elide_zero_775 = arith.constant 0 : i64
      %9958 = arith.addi %9957, %__rlasp_stack_elide_zero_775 : i64
      %9959 = arith.constant 12 : i64
      %9960 = func.call @cc_box_character(%9959) : (i64) -> i64
      %__rlasp_stack_elide_zero_776 = arith.constant 0 : i64
      %9961 = arith.addi %9960, %__rlasp_stack_elide_zero_776 : i64
      %9962 = arith.constant 13 : i64
      %9963 = func.call @cc_box_character(%9962) : (i64) -> i64
      %__rlasp_stack_elide_zero_777 = arith.constant 0 : i64
      %9964 = arith.addi %9963, %__rlasp_stack_elide_zero_777 : i64
      %9965 = arith.constant 14 : i64
      %9966 = func.call @cc_box_character(%9965) : (i64) -> i64
      %__rlasp_stack_elide_zero_778 = arith.constant 0 : i64
      %9967 = arith.addi %9966, %__rlasp_stack_elide_zero_778 : i64
      %9968 = arith.constant 15 : i64
      %9969 = func.call @cc_box_character(%9968) : (i64) -> i64
      %__rlasp_stack_elide_zero_779 = arith.constant 0 : i64
      %9970 = arith.addi %9969, %__rlasp_stack_elide_zero_779 : i64
      %9971 = arith.constant 16 : i64
      %9972 = func.call @cc_box_character(%9971) : (i64) -> i64
      %__rlasp_stack_elide_zero_780 = arith.constant 0 : i64
      %9973 = arith.addi %9972, %__rlasp_stack_elide_zero_780 : i64
      %9974 = arith.constant 17 : i64
      %9975 = func.call @cc_box_character(%9974) : (i64) -> i64
      %__rlasp_stack_elide_zero_781 = arith.constant 0 : i64
      %9976 = arith.addi %9975, %__rlasp_stack_elide_zero_781 : i64
      %9977 = arith.constant 18 : i64
      %9978 = func.call @cc_box_character(%9977) : (i64) -> i64
      %__rlasp_stack_elide_zero_782 = arith.constant 0 : i64
      %9979 = arith.addi %9978, %__rlasp_stack_elide_zero_782 : i64
      %9980 = arith.constant 19 : i64
      %9981 = func.call @cc_box_character(%9980) : (i64) -> i64
      %__rlasp_stack_elide_zero_783 = arith.constant 0 : i64
      %9982 = arith.addi %9981, %__rlasp_stack_elide_zero_783 : i64
      %9983 = arith.constant 20 : i64
      %9984 = func.call @cc_box_character(%9983) : (i64) -> i64
      %__rlasp_stack_elide_zero_784 = arith.constant 0 : i64
      %9985 = arith.addi %9984, %__rlasp_stack_elide_zero_784 : i64
      %9986 = arith.constant 21 : i64
      %9987 = func.call @cc_box_character(%9986) : (i64) -> i64
      %__rlasp_stack_elide_zero_785 = arith.constant 0 : i64
      %9988 = arith.addi %9987, %__rlasp_stack_elide_zero_785 : i64
      %9989 = arith.constant 22 : i64
      %9990 = func.call @cc_box_character(%9989) : (i64) -> i64
      %__rlasp_stack_elide_zero_786 = arith.constant 0 : i64
      %9991 = arith.addi %9990, %__rlasp_stack_elide_zero_786 : i64
      %9992 = arith.constant 23 : i64
      %9993 = func.call @cc_box_character(%9992) : (i64) -> i64
      %__rlasp_stack_elide_zero_787 = arith.constant 0 : i64
      %9994 = arith.addi %9993, %__rlasp_stack_elide_zero_787 : i64
      %9995 = arith.constant 24 : i64
      %9996 = func.call @cc_box_character(%9995) : (i64) -> i64
      %__rlasp_stack_elide_zero_788 = arith.constant 0 : i64
      %9997 = arith.addi %9996, %__rlasp_stack_elide_zero_788 : i64
      %9998 = arith.constant 25 : i64
      %9999 = func.call @cc_box_character(%9998) : (i64) -> i64
      %__rlasp_stack_elide_zero_789 = arith.constant 0 : i64
      %10000 = arith.addi %9999, %__rlasp_stack_elide_zero_789 : i64
      %10001 = arith.constant 26 : i64
      %10002 = func.call @cc_box_character(%10001) : (i64) -> i64
      %__rlasp_stack_elide_zero_790 = arith.constant 0 : i64
      %10003 = arith.addi %10002, %__rlasp_stack_elide_zero_790 : i64
      %10004 = arith.constant 27 : i64
      %10005 = func.call @cc_box_character(%10004) : (i64) -> i64
      %__rlasp_stack_elide_zero_791 = arith.constant 0 : i64
      %10006 = arith.addi %10005, %__rlasp_stack_elide_zero_791 : i64
      %10007 = arith.constant 28 : i64
      %10008 = func.call @cc_box_character(%10007) : (i64) -> i64
      %__rlasp_stack_elide_zero_792 = arith.constant 0 : i64
      %10009 = arith.addi %10008, %__rlasp_stack_elide_zero_792 : i64
      %10010 = arith.constant 29 : i64
      %10011 = func.call @cc_box_character(%10010) : (i64) -> i64
      %__rlasp_stack_elide_zero_793 = arith.constant 0 : i64
      %10012 = arith.addi %10011, %__rlasp_stack_elide_zero_793 : i64
      %10013 = arith.constant 30 : i64
      %10014 = func.call @cc_box_character(%10013) : (i64) -> i64
      %__rlasp_stack_elide_zero_794 = arith.constant 0 : i64
      %10015 = arith.addi %10014, %__rlasp_stack_elide_zero_794 : i64
      %10016 = arith.constant 31 : i64
      %10017 = func.call @cc_box_character(%10016) : (i64) -> i64
      %__rlasp_stack_elide_zero_795 = arith.constant 0 : i64
      %10018 = arith.addi %10017, %__rlasp_stack_elide_zero_795 : i64
      %10019 = arith.constant 32 : i64
      %10020 = func.call @cc_box_character(%10019) : (i64) -> i64
      %__rlasp_stack_elide_zero_796 = arith.constant 0 : i64
      %10021 = arith.addi %10020, %__rlasp_stack_elide_zero_796 : i64
      %10022 = arith.constant 127 : i64
      %10023 = func.call @cc_box_character(%10022) : (i64) -> i64
      %__rlasp_stack_elide_zero_797 = arith.constant 0 : i64
      %10024 = arith.addi %10023, %__rlasp_stack_elide_zero_797 : i64
      %10025 = func.call @cc_nil_value() : () -> i64
      %10026 = func.call @cc_errorp(%9925) : (i64) -> i64
      %10027 = arith.cmpi ne, %10026, %10025 : i64
      %10028 = arith.cmpi eq, %10025, %10025 : i64
      %10029 = arith.andi %10027, %10028 : i1
      %10030 = scf.if %10029 -> (i64) {
        scf.yield %9925 : i64
      } else {
        scf.yield %10025 : i64
      }
      %10031 = func.call @cc_errorp(%9928) : (i64) -> i64
      %10032 = arith.cmpi ne, %10031, %10025 : i64
      %10033 = arith.cmpi eq, %10030, %10025 : i64
      %10034 = arith.andi %10032, %10033 : i1
      %10035 = scf.if %10034 -> (i64) {
        scf.yield %9928 : i64
      } else {
        scf.yield %10030 : i64
      }
      %10036 = func.call @cc_errorp(%9931) : (i64) -> i64
      %10037 = arith.cmpi ne, %10036, %10025 : i64
      %10038 = arith.cmpi eq, %10035, %10025 : i64
      %10039 = arith.andi %10037, %10038 : i1
      %10040 = scf.if %10039 -> (i64) {
        scf.yield %9931 : i64
      } else {
        scf.yield %10035 : i64
      }
      %10041 = func.call @cc_errorp(%9934) : (i64) -> i64
      %10042 = arith.cmpi ne, %10041, %10025 : i64
      %10043 = arith.cmpi eq, %10040, %10025 : i64
      %10044 = arith.andi %10042, %10043 : i1
      %10045 = scf.if %10044 -> (i64) {
        scf.yield %9934 : i64
      } else {
        scf.yield %10040 : i64
      }
      %10046 = func.call @cc_errorp(%9937) : (i64) -> i64
      %10047 = arith.cmpi ne, %10046, %10025 : i64
      %10048 = arith.cmpi eq, %10045, %10025 : i64
      %10049 = arith.andi %10047, %10048 : i1
      %10050 = scf.if %10049 -> (i64) {
        scf.yield %9937 : i64
      } else {
        scf.yield %10045 : i64
      }
      %10051 = func.call @cc_errorp(%9940) : (i64) -> i64
      %10052 = arith.cmpi ne, %10051, %10025 : i64
      %10053 = arith.cmpi eq, %10050, %10025 : i64
      %10054 = arith.andi %10052, %10053 : i1
      %10055 = scf.if %10054 -> (i64) {
        scf.yield %9940 : i64
      } else {
        scf.yield %10050 : i64
      }
      %10056 = func.call @cc_errorp(%9943) : (i64) -> i64
      %10057 = arith.cmpi ne, %10056, %10025 : i64
      %10058 = arith.cmpi eq, %10055, %10025 : i64
      %10059 = arith.andi %10057, %10058 : i1
      %10060 = scf.if %10059 -> (i64) {
        scf.yield %9943 : i64
      } else {
        scf.yield %10055 : i64
      }
      %10061 = func.call @cc_errorp(%9946) : (i64) -> i64
      %10062 = arith.cmpi ne, %10061, %10025 : i64
      %10063 = arith.cmpi eq, %10060, %10025 : i64
      %10064 = arith.andi %10062, %10063 : i1
      %10065 = scf.if %10064 -> (i64) {
        scf.yield %9946 : i64
      } else {
        scf.yield %10060 : i64
      }
      %10066 = func.call @cc_errorp(%9949) : (i64) -> i64
      %10067 = arith.cmpi ne, %10066, %10025 : i64
      %10068 = arith.cmpi eq, %10065, %10025 : i64
      %10069 = arith.andi %10067, %10068 : i1
      %10070 = scf.if %10069 -> (i64) {
        scf.yield %9949 : i64
      } else {
        scf.yield %10065 : i64
      }
      %10071 = func.call @cc_errorp(%9952) : (i64) -> i64
      %10072 = arith.cmpi ne, %10071, %10025 : i64
      %10073 = arith.cmpi eq, %10070, %10025 : i64
      %10074 = arith.andi %10072, %10073 : i1
      %10075 = scf.if %10074 -> (i64) {
        scf.yield %9952 : i64
      } else {
        scf.yield %10070 : i64
      }
      %10076 = func.call @cc_errorp(%9955) : (i64) -> i64
      %10077 = arith.cmpi ne, %10076, %10025 : i64
      %10078 = arith.cmpi eq, %10075, %10025 : i64
      %10079 = arith.andi %10077, %10078 : i1
      %10080 = scf.if %10079 -> (i64) {
        scf.yield %9955 : i64
      } else {
        scf.yield %10075 : i64
      }
      %10081 = func.call @cc_errorp(%9958) : (i64) -> i64
      %10082 = arith.cmpi ne, %10081, %10025 : i64
      %10083 = arith.cmpi eq, %10080, %10025 : i64
      %10084 = arith.andi %10082, %10083 : i1
      %10085 = scf.if %10084 -> (i64) {
        scf.yield %9958 : i64
      } else {
        scf.yield %10080 : i64
      }
      %10086 = func.call @cc_errorp(%9961) : (i64) -> i64
      %10087 = arith.cmpi ne, %10086, %10025 : i64
      %10088 = arith.cmpi eq, %10085, %10025 : i64
      %10089 = arith.andi %10087, %10088 : i1
      %10090 = scf.if %10089 -> (i64) {
        scf.yield %9961 : i64
      } else {
        scf.yield %10085 : i64
      }
      %10091 = func.call @cc_errorp(%9964) : (i64) -> i64
      %10092 = arith.cmpi ne, %10091, %10025 : i64
      %10093 = arith.cmpi eq, %10090, %10025 : i64
      %10094 = arith.andi %10092, %10093 : i1
      %10095 = scf.if %10094 -> (i64) {
        scf.yield %9964 : i64
      } else {
        scf.yield %10090 : i64
      }
      %10096 = func.call @cc_errorp(%9967) : (i64) -> i64
      %10097 = arith.cmpi ne, %10096, %10025 : i64
      %10098 = arith.cmpi eq, %10095, %10025 : i64
      %10099 = arith.andi %10097, %10098 : i1
      %10100 = scf.if %10099 -> (i64) {
        scf.yield %9967 : i64
      } else {
        scf.yield %10095 : i64
      }
      %10101 = func.call @cc_errorp(%9970) : (i64) -> i64
      %10102 = arith.cmpi ne, %10101, %10025 : i64
      %10103 = arith.cmpi eq, %10100, %10025 : i64
      %10104 = arith.andi %10102, %10103 : i1
      %10105 = scf.if %10104 -> (i64) {
        scf.yield %9970 : i64
      } else {
        scf.yield %10100 : i64
      }
      %10106 = func.call @cc_errorp(%9973) : (i64) -> i64
      %10107 = arith.cmpi ne, %10106, %10025 : i64
      %10108 = arith.cmpi eq, %10105, %10025 : i64
      %10109 = arith.andi %10107, %10108 : i1
      %10110 = scf.if %10109 -> (i64) {
        scf.yield %9973 : i64
      } else {
        scf.yield %10105 : i64
      }
      %10111 = func.call @cc_errorp(%9976) : (i64) -> i64
      %10112 = arith.cmpi ne, %10111, %10025 : i64
      %10113 = arith.cmpi eq, %10110, %10025 : i64
      %10114 = arith.andi %10112, %10113 : i1
      %10115 = scf.if %10114 -> (i64) {
        scf.yield %9976 : i64
      } else {
        scf.yield %10110 : i64
      }
      %10116 = func.call @cc_errorp(%9979) : (i64) -> i64
      %10117 = arith.cmpi ne, %10116, %10025 : i64
      %10118 = arith.cmpi eq, %10115, %10025 : i64
      %10119 = arith.andi %10117, %10118 : i1
      %10120 = scf.if %10119 -> (i64) {
        scf.yield %9979 : i64
      } else {
        scf.yield %10115 : i64
      }
      %10121 = func.call @cc_errorp(%9982) : (i64) -> i64
      %10122 = arith.cmpi ne, %10121, %10025 : i64
      %10123 = arith.cmpi eq, %10120, %10025 : i64
      %10124 = arith.andi %10122, %10123 : i1
      %10125 = scf.if %10124 -> (i64) {
        scf.yield %9982 : i64
      } else {
        scf.yield %10120 : i64
      }
      %10126 = func.call @cc_errorp(%9985) : (i64) -> i64
      %10127 = arith.cmpi ne, %10126, %10025 : i64
      %10128 = arith.cmpi eq, %10125, %10025 : i64
      %10129 = arith.andi %10127, %10128 : i1
      %10130 = scf.if %10129 -> (i64) {
        scf.yield %9985 : i64
      } else {
        scf.yield %10125 : i64
      }
      %10131 = func.call @cc_errorp(%9988) : (i64) -> i64
      %10132 = arith.cmpi ne, %10131, %10025 : i64
      %10133 = arith.cmpi eq, %10130, %10025 : i64
      %10134 = arith.andi %10132, %10133 : i1
      %10135 = scf.if %10134 -> (i64) {
        scf.yield %9988 : i64
      } else {
        scf.yield %10130 : i64
      }
      %10136 = func.call @cc_errorp(%9991) : (i64) -> i64
      %10137 = arith.cmpi ne, %10136, %10025 : i64
      %10138 = arith.cmpi eq, %10135, %10025 : i64
      %10139 = arith.andi %10137, %10138 : i1
      %10140 = scf.if %10139 -> (i64) {
        scf.yield %9991 : i64
      } else {
        scf.yield %10135 : i64
      }
      %10141 = func.call @cc_errorp(%9994) : (i64) -> i64
      %10142 = arith.cmpi ne, %10141, %10025 : i64
      %10143 = arith.cmpi eq, %10140, %10025 : i64
      %10144 = arith.andi %10142, %10143 : i1
      %10145 = scf.if %10144 -> (i64) {
        scf.yield %9994 : i64
      } else {
        scf.yield %10140 : i64
      }
      %10146 = func.call @cc_errorp(%9997) : (i64) -> i64
      %10147 = arith.cmpi ne, %10146, %10025 : i64
      %10148 = arith.cmpi eq, %10145, %10025 : i64
      %10149 = arith.andi %10147, %10148 : i1
      %10150 = scf.if %10149 -> (i64) {
        scf.yield %9997 : i64
      } else {
        scf.yield %10145 : i64
      }
      %10151 = func.call @cc_errorp(%10000) : (i64) -> i64
      %10152 = arith.cmpi ne, %10151, %10025 : i64
      %10153 = arith.cmpi eq, %10150, %10025 : i64
      %10154 = arith.andi %10152, %10153 : i1
      %10155 = scf.if %10154 -> (i64) {
        scf.yield %10000 : i64
      } else {
        scf.yield %10150 : i64
      }
      %10156 = func.call @cc_errorp(%10003) : (i64) -> i64
      %10157 = arith.cmpi ne, %10156, %10025 : i64
      %10158 = arith.cmpi eq, %10155, %10025 : i64
      %10159 = arith.andi %10157, %10158 : i1
      %10160 = scf.if %10159 -> (i64) {
        scf.yield %10003 : i64
      } else {
        scf.yield %10155 : i64
      }
      %10161 = func.call @cc_errorp(%10006) : (i64) -> i64
      %10162 = arith.cmpi ne, %10161, %10025 : i64
      %10163 = arith.cmpi eq, %10160, %10025 : i64
      %10164 = arith.andi %10162, %10163 : i1
      %10165 = scf.if %10164 -> (i64) {
        scf.yield %10006 : i64
      } else {
        scf.yield %10160 : i64
      }
      %10166 = func.call @cc_errorp(%10009) : (i64) -> i64
      %10167 = arith.cmpi ne, %10166, %10025 : i64
      %10168 = arith.cmpi eq, %10165, %10025 : i64
      %10169 = arith.andi %10167, %10168 : i1
      %10170 = scf.if %10169 -> (i64) {
        scf.yield %10009 : i64
      } else {
        scf.yield %10165 : i64
      }
      %10171 = func.call @cc_errorp(%10012) : (i64) -> i64
      %10172 = arith.cmpi ne, %10171, %10025 : i64
      %10173 = arith.cmpi eq, %10170, %10025 : i64
      %10174 = arith.andi %10172, %10173 : i1
      %10175 = scf.if %10174 -> (i64) {
        scf.yield %10012 : i64
      } else {
        scf.yield %10170 : i64
      }
      %10176 = func.call @cc_errorp(%10015) : (i64) -> i64
      %10177 = arith.cmpi ne, %10176, %10025 : i64
      %10178 = arith.cmpi eq, %10175, %10025 : i64
      %10179 = arith.andi %10177, %10178 : i1
      %10180 = scf.if %10179 -> (i64) {
        scf.yield %10015 : i64
      } else {
        scf.yield %10175 : i64
      }
      %10181 = func.call @cc_errorp(%10018) : (i64) -> i64
      %10182 = arith.cmpi ne, %10181, %10025 : i64
      %10183 = arith.cmpi eq, %10180, %10025 : i64
      %10184 = arith.andi %10182, %10183 : i1
      %10185 = scf.if %10184 -> (i64) {
        scf.yield %10018 : i64
      } else {
        scf.yield %10180 : i64
      }
      %10186 = func.call @cc_errorp(%10021) : (i64) -> i64
      %10187 = arith.cmpi ne, %10186, %10025 : i64
      %10188 = arith.cmpi eq, %10185, %10025 : i64
      %10189 = arith.andi %10187, %10188 : i1
      %10190 = scf.if %10189 -> (i64) {
        scf.yield %10021 : i64
      } else {
        scf.yield %10185 : i64
      }
      %10191 = func.call @cc_errorp(%10024) : (i64) -> i64
      %10192 = arith.cmpi ne, %10191, %10025 : i64
      %10193 = arith.cmpi eq, %10190, %10025 : i64
      %10194 = arith.andi %10192, %10193 : i1
      %10195 = scf.if %10194 -> (i64) {
        scf.yield %10024 : i64
      } else {
        scf.yield %10190 : i64
      }
      %10196 = arith.cmpi ne, %10195, %10025 : i64
      scf.if %10196 {
        func.call @stack_push_pointer(%10195) : (i64) -> ()
      } else {
        %10197 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%10197) : (i64) -> ()
        %__rlasp_stack_elide_zero_798 = arith.constant 0 : i64
        %10198 = arith.addi %10024, %__rlasp_stack_elide_zero_798 : i64
        %10199 = func.call @stack_pop_pointer() : () -> i64
        %10200 = func.call @cc_cons(%10198, %10199) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10200) : (i64) -> ()
        %__rlasp_stack_elide_zero_799 = arith.constant 0 : i64
        %10201 = arith.addi %10021, %__rlasp_stack_elide_zero_799 : i64
        %10202 = func.call @stack_pop_pointer() : () -> i64
        %10203 = func.call @cc_cons(%10201, %10202) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10203) : (i64) -> ()
        %__rlasp_stack_elide_zero_800 = arith.constant 0 : i64
        %10204 = arith.addi %10018, %__rlasp_stack_elide_zero_800 : i64
        %10205 = func.call @stack_pop_pointer() : () -> i64
        %10206 = func.call @cc_cons(%10204, %10205) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10206) : (i64) -> ()
        %__rlasp_stack_elide_zero_801 = arith.constant 0 : i64
        %10207 = arith.addi %10015, %__rlasp_stack_elide_zero_801 : i64
        %10208 = func.call @stack_pop_pointer() : () -> i64
        %10209 = func.call @cc_cons(%10207, %10208) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10209) : (i64) -> ()
        %__rlasp_stack_elide_zero_802 = arith.constant 0 : i64
        %10210 = arith.addi %10012, %__rlasp_stack_elide_zero_802 : i64
        %10211 = func.call @stack_pop_pointer() : () -> i64
        %10212 = func.call @cc_cons(%10210, %10211) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10212) : (i64) -> ()
        %__rlasp_stack_elide_zero_803 = arith.constant 0 : i64
        %10213 = arith.addi %10009, %__rlasp_stack_elide_zero_803 : i64
        %10214 = func.call @stack_pop_pointer() : () -> i64
        %10215 = func.call @cc_cons(%10213, %10214) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10215) : (i64) -> ()
        %__rlasp_stack_elide_zero_804 = arith.constant 0 : i64
        %10216 = arith.addi %10006, %__rlasp_stack_elide_zero_804 : i64
        %10217 = func.call @stack_pop_pointer() : () -> i64
        %10218 = func.call @cc_cons(%10216, %10217) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10218) : (i64) -> ()
        %__rlasp_stack_elide_zero_805 = arith.constant 0 : i64
        %10219 = arith.addi %10003, %__rlasp_stack_elide_zero_805 : i64
        %10220 = func.call @stack_pop_pointer() : () -> i64
        %10221 = func.call @cc_cons(%10219, %10220) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10221) : (i64) -> ()
        %__rlasp_stack_elide_zero_806 = arith.constant 0 : i64
        %10222 = arith.addi %10000, %__rlasp_stack_elide_zero_806 : i64
        %10223 = func.call @stack_pop_pointer() : () -> i64
        %10224 = func.call @cc_cons(%10222, %10223) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10224) : (i64) -> ()
        %__rlasp_stack_elide_zero_807 = arith.constant 0 : i64
        %10225 = arith.addi %9997, %__rlasp_stack_elide_zero_807 : i64
        %10226 = func.call @stack_pop_pointer() : () -> i64
        %10227 = func.call @cc_cons(%10225, %10226) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10227) : (i64) -> ()
        %__rlasp_stack_elide_zero_808 = arith.constant 0 : i64
        %10228 = arith.addi %9994, %__rlasp_stack_elide_zero_808 : i64
        %10229 = func.call @stack_pop_pointer() : () -> i64
        %10230 = func.call @cc_cons(%10228, %10229) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10230) : (i64) -> ()
        %__rlasp_stack_elide_zero_809 = arith.constant 0 : i64
        %10231 = arith.addi %9991, %__rlasp_stack_elide_zero_809 : i64
        %10232 = func.call @stack_pop_pointer() : () -> i64
        %10233 = func.call @cc_cons(%10231, %10232) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10233) : (i64) -> ()
        %__rlasp_stack_elide_zero_810 = arith.constant 0 : i64
        %10234 = arith.addi %9988, %__rlasp_stack_elide_zero_810 : i64
        %10235 = func.call @stack_pop_pointer() : () -> i64
        %10236 = func.call @cc_cons(%10234, %10235) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10236) : (i64) -> ()
        %__rlasp_stack_elide_zero_811 = arith.constant 0 : i64
        %10237 = arith.addi %9985, %__rlasp_stack_elide_zero_811 : i64
        %10238 = func.call @stack_pop_pointer() : () -> i64
        %10239 = func.call @cc_cons(%10237, %10238) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10239) : (i64) -> ()
        %__rlasp_stack_elide_zero_812 = arith.constant 0 : i64
        %10240 = arith.addi %9982, %__rlasp_stack_elide_zero_812 : i64
        %10241 = func.call @stack_pop_pointer() : () -> i64
        %10242 = func.call @cc_cons(%10240, %10241) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10242) : (i64) -> ()
        %__rlasp_stack_elide_zero_813 = arith.constant 0 : i64
        %10243 = arith.addi %9979, %__rlasp_stack_elide_zero_813 : i64
        %10244 = func.call @stack_pop_pointer() : () -> i64
        %10245 = func.call @cc_cons(%10243, %10244) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10245) : (i64) -> ()
        %__rlasp_stack_elide_zero_814 = arith.constant 0 : i64
        %10246 = arith.addi %9976, %__rlasp_stack_elide_zero_814 : i64
        %10247 = func.call @stack_pop_pointer() : () -> i64
        %10248 = func.call @cc_cons(%10246, %10247) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10248) : (i64) -> ()
        %__rlasp_stack_elide_zero_815 = arith.constant 0 : i64
        %10249 = arith.addi %9973, %__rlasp_stack_elide_zero_815 : i64
        %10250 = func.call @stack_pop_pointer() : () -> i64
        %10251 = func.call @cc_cons(%10249, %10250) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10251) : (i64) -> ()
        %__rlasp_stack_elide_zero_816 = arith.constant 0 : i64
        %10252 = arith.addi %9970, %__rlasp_stack_elide_zero_816 : i64
        %10253 = func.call @stack_pop_pointer() : () -> i64
        %10254 = func.call @cc_cons(%10252, %10253) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10254) : (i64) -> ()
        %__rlasp_stack_elide_zero_817 = arith.constant 0 : i64
        %10255 = arith.addi %9967, %__rlasp_stack_elide_zero_817 : i64
        %10256 = func.call @stack_pop_pointer() : () -> i64
        %10257 = func.call @cc_cons(%10255, %10256) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10257) : (i64) -> ()
        %__rlasp_stack_elide_zero_818 = arith.constant 0 : i64
        %10258 = arith.addi %9964, %__rlasp_stack_elide_zero_818 : i64
        %10259 = func.call @stack_pop_pointer() : () -> i64
        %10260 = func.call @cc_cons(%10258, %10259) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10260) : (i64) -> ()
        %__rlasp_stack_elide_zero_819 = arith.constant 0 : i64
        %10261 = arith.addi %9961, %__rlasp_stack_elide_zero_819 : i64
        %10262 = func.call @stack_pop_pointer() : () -> i64
        %10263 = func.call @cc_cons(%10261, %10262) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10263) : (i64) -> ()
        %__rlasp_stack_elide_zero_820 = arith.constant 0 : i64
        %10264 = arith.addi %9958, %__rlasp_stack_elide_zero_820 : i64
        %10265 = func.call @stack_pop_pointer() : () -> i64
        %10266 = func.call @cc_cons(%10264, %10265) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10266) : (i64) -> ()
        %__rlasp_stack_elide_zero_821 = arith.constant 0 : i64
        %10267 = arith.addi %9955, %__rlasp_stack_elide_zero_821 : i64
        %10268 = func.call @stack_pop_pointer() : () -> i64
        %10269 = func.call @cc_cons(%10267, %10268) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10269) : (i64) -> ()
        %__rlasp_stack_elide_zero_822 = arith.constant 0 : i64
        %10270 = arith.addi %9952, %__rlasp_stack_elide_zero_822 : i64
        %10271 = func.call @stack_pop_pointer() : () -> i64
        %10272 = func.call @cc_cons(%10270, %10271) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10272) : (i64) -> ()
        %__rlasp_stack_elide_zero_823 = arith.constant 0 : i64
        %10273 = arith.addi %9949, %__rlasp_stack_elide_zero_823 : i64
        %10274 = func.call @stack_pop_pointer() : () -> i64
        %10275 = func.call @cc_cons(%10273, %10274) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10275) : (i64) -> ()
        %__rlasp_stack_elide_zero_824 = arith.constant 0 : i64
        %10276 = arith.addi %9946, %__rlasp_stack_elide_zero_824 : i64
        %10277 = func.call @stack_pop_pointer() : () -> i64
        %10278 = func.call @cc_cons(%10276, %10277) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10278) : (i64) -> ()
        %__rlasp_stack_elide_zero_825 = arith.constant 0 : i64
        %10279 = arith.addi %9943, %__rlasp_stack_elide_zero_825 : i64
        %10280 = func.call @stack_pop_pointer() : () -> i64
        %10281 = func.call @cc_cons(%10279, %10280) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10281) : (i64) -> ()
        %__rlasp_stack_elide_zero_826 = arith.constant 0 : i64
        %10282 = arith.addi %9940, %__rlasp_stack_elide_zero_826 : i64
        %10283 = func.call @stack_pop_pointer() : () -> i64
        %10284 = func.call @cc_cons(%10282, %10283) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10284) : (i64) -> ()
        %__rlasp_stack_elide_zero_827 = arith.constant 0 : i64
        %10285 = arith.addi %9937, %__rlasp_stack_elide_zero_827 : i64
        %10286 = func.call @stack_pop_pointer() : () -> i64
        %10287 = func.call @cc_cons(%10285, %10286) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10287) : (i64) -> ()
        %__rlasp_stack_elide_zero_828 = arith.constant 0 : i64
        %10288 = arith.addi %9934, %__rlasp_stack_elide_zero_828 : i64
        %10289 = func.call @stack_pop_pointer() : () -> i64
        %10290 = func.call @cc_cons(%10288, %10289) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10290) : (i64) -> ()
        %__rlasp_stack_elide_zero_829 = arith.constant 0 : i64
        %10291 = arith.addi %9931, %__rlasp_stack_elide_zero_829 : i64
        %10292 = func.call @stack_pop_pointer() : () -> i64
        %10293 = func.call @cc_cons(%10291, %10292) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10293) : (i64) -> ()
        %__rlasp_stack_elide_zero_830 = arith.constant 0 : i64
        %10294 = arith.addi %9928, %__rlasp_stack_elide_zero_830 : i64
        %10295 = func.call @stack_pop_pointer() : () -> i64
        %10296 = func.call @cc_cons(%10294, %10295) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10296) : (i64) -> ()
        %__rlasp_stack_elide_zero_831 = arith.constant 0 : i64
        %10297 = arith.addi %9925, %__rlasp_stack_elide_zero_831 : i64
        %10298 = func.call @stack_pop_pointer() : () -> i64
        %10299 = func.call @cc_cons(%10297, %10298) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10299) : (i64) -> ()
      }
      %10300 = func.call @stack_pop_pointer() : () -> i64
      %10301 = func.call @cc_nil_value() : () -> i64
      %10302 = func.call @cc_cons(%10300, %10301) : (i64, i64) -> i64
      %10303 = func.call @cc_not(%10302) : (i64) -> i64
      %__rlasp_stack_elide_zero_832 = arith.constant 0 : i64
      %10304 = arith.addi %10303, %__rlasp_stack_elide_zero_832 : i64
      %10305 = func.call @cc_nil_value() : () -> i64
      %10306 = func.call @cc_cons(%10304, %10305) : (i64, i64) -> i64
      %10307 = func.call @cc_not(%10306) : (i64) -> i64
      %__rlasp_stack_elide_zero_833 = arith.constant 0 : i64
      %10308 = arith.addi %10307, %__rlasp_stack_elide_zero_833 : i64
      scf.yield %10308 : i64
    }
    func.call @stack_push_pointer(%9922) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192229"() {
    %10526 = func.call @cc_nil_value() : () -> i64
    %10527 = func.call @cc_nil_value() : () -> i64
    %10528 = func.call @cc_errorp(%10526) : (i64) -> i64
    %10529 = arith.cmpi ne, %10528, %10527 : i64
    %10530 = scf.if %10529 -> (i64) {
      scf.yield %10526 : i64
    } else {
      %10531 = arith.constant 8 : i64
      %10532 = func.call @cc_box_character(%10531) : (i64) -> i64
      %__rlasp_stack_elide_zero_834 = arith.constant 0 : i64
      %10533 = arith.addi %10532, %__rlasp_stack_elide_zero_834 : i64
      %10534 = arith.constant 9 : i64
      %10535 = func.call @cc_box_character(%10534) : (i64) -> i64
      %__rlasp_stack_elide_zero_835 = arith.constant 0 : i64
      %10536 = arith.addi %10535, %__rlasp_stack_elide_zero_835 : i64
      %10537 = arith.constant 10 : i64
      %10538 = func.call @cc_box_character(%10537) : (i64) -> i64
      %__rlasp_stack_elide_zero_836 = arith.constant 0 : i64
      %10539 = arith.addi %10538, %__rlasp_stack_elide_zero_836 : i64
      %10540 = arith.constant 10 : i64
      %10541 = func.call @cc_box_character(%10540) : (i64) -> i64
      %__rlasp_stack_elide_zero_837 = arith.constant 0 : i64
      %10542 = arith.addi %10541, %__rlasp_stack_elide_zero_837 : i64
      %10543 = arith.constant 12 : i64
      %10544 = func.call @cc_box_character(%10543) : (i64) -> i64
      %__rlasp_stack_elide_zero_838 = arith.constant 0 : i64
      %10545 = arith.addi %10544, %__rlasp_stack_elide_zero_838 : i64
      %10546 = arith.constant 13 : i64
      %10547 = func.call @cc_box_character(%10546) : (i64) -> i64
      %__rlasp_stack_elide_zero_839 = arith.constant 0 : i64
      %10548 = arith.addi %10547, %__rlasp_stack_elide_zero_839 : i64
      %10549 = arith.constant 32 : i64
      %10550 = func.call @cc_box_character(%10549) : (i64) -> i64
      %__rlasp_stack_elide_zero_840 = arith.constant 0 : i64
      %10551 = arith.addi %10550, %__rlasp_stack_elide_zero_840 : i64
      %10552 = arith.constant 8 : i64
      %10553 = func.call @cc_box_character(%10552) : (i64) -> i64
      %__rlasp_stack_elide_zero_841 = arith.constant 0 : i64
      %10554 = arith.addi %10553, %__rlasp_stack_elide_zero_841 : i64
      %10555 = arith.constant 9 : i64
      %10556 = func.call @cc_box_character(%10555) : (i64) -> i64
      %__rlasp_stack_elide_zero_842 = arith.constant 0 : i64
      %10557 = arith.addi %10556, %__rlasp_stack_elide_zero_842 : i64
      %10558 = arith.constant 10 : i64
      %10559 = func.call @cc_box_character(%10558) : (i64) -> i64
      %__rlasp_stack_elide_zero_843 = arith.constant 0 : i64
      %10560 = arith.addi %10559, %__rlasp_stack_elide_zero_843 : i64
      %10561 = arith.constant 10 : i64
      %10562 = func.call @cc_box_character(%10561) : (i64) -> i64
      %__rlasp_stack_elide_zero_844 = arith.constant 0 : i64
      %10563 = arith.addi %10562, %__rlasp_stack_elide_zero_844 : i64
      %10564 = arith.constant 12 : i64
      %10565 = func.call @cc_box_character(%10564) : (i64) -> i64
      %__rlasp_stack_elide_zero_845 = arith.constant 0 : i64
      %10566 = arith.addi %10565, %__rlasp_stack_elide_zero_845 : i64
      %10567 = arith.constant 13 : i64
      %10568 = func.call @cc_box_character(%10567) : (i64) -> i64
      %__rlasp_stack_elide_zero_846 = arith.constant 0 : i64
      %10569 = arith.addi %10568, %__rlasp_stack_elide_zero_846 : i64
      %10570 = arith.constant 32 : i64
      %10571 = func.call @cc_box_character(%10570) : (i64) -> i64
      %__rlasp_stack_elide_zero_847 = arith.constant 0 : i64
      %10572 = arith.addi %10571, %__rlasp_stack_elide_zero_847 : i64
      %10573 = func.call @cc_nil_value() : () -> i64
      %10574 = func.call @cc_errorp(%10533) : (i64) -> i64
      %10575 = arith.cmpi ne, %10574, %10573 : i64
      %10576 = arith.cmpi eq, %10573, %10573 : i64
      %10577 = arith.andi %10575, %10576 : i1
      %10578 = scf.if %10577 -> (i64) {
        scf.yield %10533 : i64
      } else {
        scf.yield %10573 : i64
      }
      %10579 = func.call @cc_errorp(%10536) : (i64) -> i64
      %10580 = arith.cmpi ne, %10579, %10573 : i64
      %10581 = arith.cmpi eq, %10578, %10573 : i64
      %10582 = arith.andi %10580, %10581 : i1
      %10583 = scf.if %10582 -> (i64) {
        scf.yield %10536 : i64
      } else {
        scf.yield %10578 : i64
      }
      %10584 = func.call @cc_errorp(%10539) : (i64) -> i64
      %10585 = arith.cmpi ne, %10584, %10573 : i64
      %10586 = arith.cmpi eq, %10583, %10573 : i64
      %10587 = arith.andi %10585, %10586 : i1
      %10588 = scf.if %10587 -> (i64) {
        scf.yield %10539 : i64
      } else {
        scf.yield %10583 : i64
      }
      %10589 = func.call @cc_errorp(%10542) : (i64) -> i64
      %10590 = arith.cmpi ne, %10589, %10573 : i64
      %10591 = arith.cmpi eq, %10588, %10573 : i64
      %10592 = arith.andi %10590, %10591 : i1
      %10593 = scf.if %10592 -> (i64) {
        scf.yield %10542 : i64
      } else {
        scf.yield %10588 : i64
      }
      %10594 = func.call @cc_errorp(%10545) : (i64) -> i64
      %10595 = arith.cmpi ne, %10594, %10573 : i64
      %10596 = arith.cmpi eq, %10593, %10573 : i64
      %10597 = arith.andi %10595, %10596 : i1
      %10598 = scf.if %10597 -> (i64) {
        scf.yield %10545 : i64
      } else {
        scf.yield %10593 : i64
      }
      %10599 = func.call @cc_errorp(%10548) : (i64) -> i64
      %10600 = arith.cmpi ne, %10599, %10573 : i64
      %10601 = arith.cmpi eq, %10598, %10573 : i64
      %10602 = arith.andi %10600, %10601 : i1
      %10603 = scf.if %10602 -> (i64) {
        scf.yield %10548 : i64
      } else {
        scf.yield %10598 : i64
      }
      %10604 = func.call @cc_errorp(%10551) : (i64) -> i64
      %10605 = arith.cmpi ne, %10604, %10573 : i64
      %10606 = arith.cmpi eq, %10603, %10573 : i64
      %10607 = arith.andi %10605, %10606 : i1
      %10608 = scf.if %10607 -> (i64) {
        scf.yield %10551 : i64
      } else {
        scf.yield %10603 : i64
      }
      %10609 = func.call @cc_errorp(%10554) : (i64) -> i64
      %10610 = arith.cmpi ne, %10609, %10573 : i64
      %10611 = arith.cmpi eq, %10608, %10573 : i64
      %10612 = arith.andi %10610, %10611 : i1
      %10613 = scf.if %10612 -> (i64) {
        scf.yield %10554 : i64
      } else {
        scf.yield %10608 : i64
      }
      %10614 = func.call @cc_errorp(%10557) : (i64) -> i64
      %10615 = arith.cmpi ne, %10614, %10573 : i64
      %10616 = arith.cmpi eq, %10613, %10573 : i64
      %10617 = arith.andi %10615, %10616 : i1
      %10618 = scf.if %10617 -> (i64) {
        scf.yield %10557 : i64
      } else {
        scf.yield %10613 : i64
      }
      %10619 = func.call @cc_errorp(%10560) : (i64) -> i64
      %10620 = arith.cmpi ne, %10619, %10573 : i64
      %10621 = arith.cmpi eq, %10618, %10573 : i64
      %10622 = arith.andi %10620, %10621 : i1
      %10623 = scf.if %10622 -> (i64) {
        scf.yield %10560 : i64
      } else {
        scf.yield %10618 : i64
      }
      %10624 = func.call @cc_errorp(%10563) : (i64) -> i64
      %10625 = arith.cmpi ne, %10624, %10573 : i64
      %10626 = arith.cmpi eq, %10623, %10573 : i64
      %10627 = arith.andi %10625, %10626 : i1
      %10628 = scf.if %10627 -> (i64) {
        scf.yield %10563 : i64
      } else {
        scf.yield %10623 : i64
      }
      %10629 = func.call @cc_errorp(%10566) : (i64) -> i64
      %10630 = arith.cmpi ne, %10629, %10573 : i64
      %10631 = arith.cmpi eq, %10628, %10573 : i64
      %10632 = arith.andi %10630, %10631 : i1
      %10633 = scf.if %10632 -> (i64) {
        scf.yield %10566 : i64
      } else {
        scf.yield %10628 : i64
      }
      %10634 = func.call @cc_errorp(%10569) : (i64) -> i64
      %10635 = arith.cmpi ne, %10634, %10573 : i64
      %10636 = arith.cmpi eq, %10633, %10573 : i64
      %10637 = arith.andi %10635, %10636 : i1
      %10638 = scf.if %10637 -> (i64) {
        scf.yield %10569 : i64
      } else {
        scf.yield %10633 : i64
      }
      %10639 = func.call @cc_errorp(%10572) : (i64) -> i64
      %10640 = arith.cmpi ne, %10639, %10573 : i64
      %10641 = arith.cmpi eq, %10638, %10573 : i64
      %10642 = arith.andi %10640, %10641 : i1
      %10643 = scf.if %10642 -> (i64) {
        scf.yield %10572 : i64
      } else {
        scf.yield %10638 : i64
      }
      %10644 = arith.cmpi ne, %10643, %10573 : i64
      scf.if %10644 {
        func.call @stack_push_pointer(%10643) : (i64) -> ()
      } else {
        %10645 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%10645) : (i64) -> ()
        %__rlasp_stack_elide_zero_848 = arith.constant 0 : i64
        %10646 = arith.addi %10572, %__rlasp_stack_elide_zero_848 : i64
        %10647 = func.call @stack_pop_pointer() : () -> i64
        %10648 = func.call @cc_cons(%10646, %10647) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10648) : (i64) -> ()
        %__rlasp_stack_elide_zero_849 = arith.constant 0 : i64
        %10649 = arith.addi %10569, %__rlasp_stack_elide_zero_849 : i64
        %10650 = func.call @stack_pop_pointer() : () -> i64
        %10651 = func.call @cc_cons(%10649, %10650) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10651) : (i64) -> ()
        %__rlasp_stack_elide_zero_850 = arith.constant 0 : i64
        %10652 = arith.addi %10566, %__rlasp_stack_elide_zero_850 : i64
        %10653 = func.call @stack_pop_pointer() : () -> i64
        %10654 = func.call @cc_cons(%10652, %10653) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10654) : (i64) -> ()
        %__rlasp_stack_elide_zero_851 = arith.constant 0 : i64
        %10655 = arith.addi %10563, %__rlasp_stack_elide_zero_851 : i64
        %10656 = func.call @stack_pop_pointer() : () -> i64
        %10657 = func.call @cc_cons(%10655, %10656) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10657) : (i64) -> ()
        %__rlasp_stack_elide_zero_852 = arith.constant 0 : i64
        %10658 = arith.addi %10560, %__rlasp_stack_elide_zero_852 : i64
        %10659 = func.call @stack_pop_pointer() : () -> i64
        %10660 = func.call @cc_cons(%10658, %10659) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10660) : (i64) -> ()
        %__rlasp_stack_elide_zero_853 = arith.constant 0 : i64
        %10661 = arith.addi %10557, %__rlasp_stack_elide_zero_853 : i64
        %10662 = func.call @stack_pop_pointer() : () -> i64
        %10663 = func.call @cc_cons(%10661, %10662) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10663) : (i64) -> ()
        %__rlasp_stack_elide_zero_854 = arith.constant 0 : i64
        %10664 = arith.addi %10554, %__rlasp_stack_elide_zero_854 : i64
        %10665 = func.call @stack_pop_pointer() : () -> i64
        %10666 = func.call @cc_cons(%10664, %10665) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10666) : (i64) -> ()
        %__rlasp_stack_elide_zero_855 = arith.constant 0 : i64
        %10667 = arith.addi %10551, %__rlasp_stack_elide_zero_855 : i64
        %10668 = func.call @stack_pop_pointer() : () -> i64
        %10669 = func.call @cc_cons(%10667, %10668) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10669) : (i64) -> ()
        %__rlasp_stack_elide_zero_856 = arith.constant 0 : i64
        %10670 = arith.addi %10548, %__rlasp_stack_elide_zero_856 : i64
        %10671 = func.call @stack_pop_pointer() : () -> i64
        %10672 = func.call @cc_cons(%10670, %10671) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10672) : (i64) -> ()
        %__rlasp_stack_elide_zero_857 = arith.constant 0 : i64
        %10673 = arith.addi %10545, %__rlasp_stack_elide_zero_857 : i64
        %10674 = func.call @stack_pop_pointer() : () -> i64
        %10675 = func.call @cc_cons(%10673, %10674) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10675) : (i64) -> ()
        %__rlasp_stack_elide_zero_858 = arith.constant 0 : i64
        %10676 = arith.addi %10542, %__rlasp_stack_elide_zero_858 : i64
        %10677 = func.call @stack_pop_pointer() : () -> i64
        %10678 = func.call @cc_cons(%10676, %10677) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10678) : (i64) -> ()
        %__rlasp_stack_elide_zero_859 = arith.constant 0 : i64
        %10679 = arith.addi %10539, %__rlasp_stack_elide_zero_859 : i64
        %10680 = func.call @stack_pop_pointer() : () -> i64
        %10681 = func.call @cc_cons(%10679, %10680) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10681) : (i64) -> ()
        %__rlasp_stack_elide_zero_860 = arith.constant 0 : i64
        %10682 = arith.addi %10536, %__rlasp_stack_elide_zero_860 : i64
        %10683 = func.call @stack_pop_pointer() : () -> i64
        %10684 = func.call @cc_cons(%10682, %10683) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10684) : (i64) -> ()
        %__rlasp_stack_elide_zero_861 = arith.constant 0 : i64
        %10685 = arith.addi %10533, %__rlasp_stack_elide_zero_861 : i64
        %10686 = func.call @stack_pop_pointer() : () -> i64
        %10687 = func.call @cc_cons(%10685, %10686) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10687) : (i64) -> ()
      }
      %10688 = func.call @stack_pop_pointer() : () -> i64
      %10689 = func.call @cc_nil_value() : () -> i64
      %10690 = func.call @cc_cons(%10688, %10689) : (i64, i64) -> i64
      %10691 = func.call @cc_not(%10690) : (i64) -> i64
      %__rlasp_stack_elide_zero_862 = arith.constant 0 : i64
      %10692 = arith.addi %10691, %__rlasp_stack_elide_zero_862 : i64
      %10693 = func.call @cc_nil_value() : () -> i64
      %10694 = func.call @cc_cons(%10692, %10693) : (i64, i64) -> i64
      %10695 = func.call @cc_not(%10694) : (i64) -> i64
      %__rlasp_stack_elide_zero_863 = arith.constant 0 : i64
      %10696 = arith.addi %10695, %__rlasp_stack_elide_zero_863 : i64
      scf.yield %10696 : i64
    }
    func.call @stack_push_pointer(%10530) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192230"() {
    %10884 = func.call @cc_nil_value() : () -> i64
    %10885 = func.call @cc_nil_value() : () -> i64
    %10886 = func.call @cc_errorp(%10884) : (i64) -> i64
    %10887 = arith.cmpi ne, %10886, %10885 : i64
    %10888 = scf.if %10887 -> (i64) {
      scf.yield %10884 : i64
    } else {
      %10889 = arith.constant 0 : i64
      %10890 = func.call @cc_box_character(%10889) : (i64) -> i64
      %__rlasp_stack_elide_zero_864 = arith.constant 0 : i64
      %10891 = arith.addi %10890, %__rlasp_stack_elide_zero_864 : i64
      %10892 = arith.constant 7 : i64
      %10893 = func.call @cc_box_character(%10892) : (i64) -> i64
      %__rlasp_stack_elide_zero_865 = arith.constant 0 : i64
      %10894 = arith.addi %10893, %__rlasp_stack_elide_zero_865 : i64
      %10895 = arith.constant 27 : i64
      %10896 = func.call @cc_box_character(%10895) : (i64) -> i64
      %__rlasp_stack_elide_zero_866 = arith.constant 0 : i64
      %10897 = arith.addi %10896, %__rlasp_stack_elide_zero_866 : i64
      %10898 = arith.constant 127 : i64
      %10899 = func.call @cc_box_character(%10898) : (i64) -> i64
      %__rlasp_stack_elide_zero_867 = arith.constant 0 : i64
      %10900 = arith.addi %10899, %__rlasp_stack_elide_zero_867 : i64
      %10901 = arith.constant 0 : i64
      %10902 = func.call @cc_box_character(%10901) : (i64) -> i64
      %__rlasp_stack_elide_zero_868 = arith.constant 0 : i64
      %10903 = arith.addi %10902, %__rlasp_stack_elide_zero_868 : i64
      %10904 = arith.constant 7 : i64
      %10905 = func.call @cc_box_character(%10904) : (i64) -> i64
      %__rlasp_stack_elide_zero_869 = arith.constant 0 : i64
      %10906 = arith.addi %10905, %__rlasp_stack_elide_zero_869 : i64
      %10907 = arith.constant 27 : i64
      %10908 = func.call @cc_box_character(%10907) : (i64) -> i64
      %__rlasp_stack_elide_zero_870 = arith.constant 0 : i64
      %10909 = arith.addi %10908, %__rlasp_stack_elide_zero_870 : i64
      %10910 = arith.constant 127 : i64
      %10911 = func.call @cc_box_character(%10910) : (i64) -> i64
      %__rlasp_stack_elide_zero_871 = arith.constant 0 : i64
      %10912 = arith.addi %10911, %__rlasp_stack_elide_zero_871 : i64
      %10913 = func.call @cc_nil_value() : () -> i64
      %10914 = func.call @cc_errorp(%10891) : (i64) -> i64
      %10915 = arith.cmpi ne, %10914, %10913 : i64
      %10916 = arith.cmpi eq, %10913, %10913 : i64
      %10917 = arith.andi %10915, %10916 : i1
      %10918 = scf.if %10917 -> (i64) {
        scf.yield %10891 : i64
      } else {
        scf.yield %10913 : i64
      }
      %10919 = func.call @cc_errorp(%10894) : (i64) -> i64
      %10920 = arith.cmpi ne, %10919, %10913 : i64
      %10921 = arith.cmpi eq, %10918, %10913 : i64
      %10922 = arith.andi %10920, %10921 : i1
      %10923 = scf.if %10922 -> (i64) {
        scf.yield %10894 : i64
      } else {
        scf.yield %10918 : i64
      }
      %10924 = func.call @cc_errorp(%10897) : (i64) -> i64
      %10925 = arith.cmpi ne, %10924, %10913 : i64
      %10926 = arith.cmpi eq, %10923, %10913 : i64
      %10927 = arith.andi %10925, %10926 : i1
      %10928 = scf.if %10927 -> (i64) {
        scf.yield %10897 : i64
      } else {
        scf.yield %10923 : i64
      }
      %10929 = func.call @cc_errorp(%10900) : (i64) -> i64
      %10930 = arith.cmpi ne, %10929, %10913 : i64
      %10931 = arith.cmpi eq, %10928, %10913 : i64
      %10932 = arith.andi %10930, %10931 : i1
      %10933 = scf.if %10932 -> (i64) {
        scf.yield %10900 : i64
      } else {
        scf.yield %10928 : i64
      }
      %10934 = func.call @cc_errorp(%10903) : (i64) -> i64
      %10935 = arith.cmpi ne, %10934, %10913 : i64
      %10936 = arith.cmpi eq, %10933, %10913 : i64
      %10937 = arith.andi %10935, %10936 : i1
      %10938 = scf.if %10937 -> (i64) {
        scf.yield %10903 : i64
      } else {
        scf.yield %10933 : i64
      }
      %10939 = func.call @cc_errorp(%10906) : (i64) -> i64
      %10940 = arith.cmpi ne, %10939, %10913 : i64
      %10941 = arith.cmpi eq, %10938, %10913 : i64
      %10942 = arith.andi %10940, %10941 : i1
      %10943 = scf.if %10942 -> (i64) {
        scf.yield %10906 : i64
      } else {
        scf.yield %10938 : i64
      }
      %10944 = func.call @cc_errorp(%10909) : (i64) -> i64
      %10945 = arith.cmpi ne, %10944, %10913 : i64
      %10946 = arith.cmpi eq, %10943, %10913 : i64
      %10947 = arith.andi %10945, %10946 : i1
      %10948 = scf.if %10947 -> (i64) {
        scf.yield %10909 : i64
      } else {
        scf.yield %10943 : i64
      }
      %10949 = func.call @cc_errorp(%10912) : (i64) -> i64
      %10950 = arith.cmpi ne, %10949, %10913 : i64
      %10951 = arith.cmpi eq, %10948, %10913 : i64
      %10952 = arith.andi %10950, %10951 : i1
      %10953 = scf.if %10952 -> (i64) {
        scf.yield %10912 : i64
      } else {
        scf.yield %10948 : i64
      }
      %10954 = arith.cmpi ne, %10953, %10913 : i64
      scf.if %10954 {
        func.call @stack_push_pointer(%10953) : (i64) -> ()
      } else {
        %10955 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%10955) : (i64) -> ()
        %__rlasp_stack_elide_zero_872 = arith.constant 0 : i64
        %10956 = arith.addi %10912, %__rlasp_stack_elide_zero_872 : i64
        %10957 = func.call @stack_pop_pointer() : () -> i64
        %10958 = func.call @cc_cons(%10956, %10957) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10958) : (i64) -> ()
        %__rlasp_stack_elide_zero_873 = arith.constant 0 : i64
        %10959 = arith.addi %10909, %__rlasp_stack_elide_zero_873 : i64
        %10960 = func.call @stack_pop_pointer() : () -> i64
        %10961 = func.call @cc_cons(%10959, %10960) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10961) : (i64) -> ()
        %__rlasp_stack_elide_zero_874 = arith.constant 0 : i64
        %10962 = arith.addi %10906, %__rlasp_stack_elide_zero_874 : i64
        %10963 = func.call @stack_pop_pointer() : () -> i64
        %10964 = func.call @cc_cons(%10962, %10963) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10964) : (i64) -> ()
        %__rlasp_stack_elide_zero_875 = arith.constant 0 : i64
        %10965 = arith.addi %10903, %__rlasp_stack_elide_zero_875 : i64
        %10966 = func.call @stack_pop_pointer() : () -> i64
        %10967 = func.call @cc_cons(%10965, %10966) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10967) : (i64) -> ()
        %__rlasp_stack_elide_zero_876 = arith.constant 0 : i64
        %10968 = arith.addi %10900, %__rlasp_stack_elide_zero_876 : i64
        %10969 = func.call @stack_pop_pointer() : () -> i64
        %10970 = func.call @cc_cons(%10968, %10969) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10970) : (i64) -> ()
        %__rlasp_stack_elide_zero_877 = arith.constant 0 : i64
        %10971 = arith.addi %10897, %__rlasp_stack_elide_zero_877 : i64
        %10972 = func.call @stack_pop_pointer() : () -> i64
        %10973 = func.call @cc_cons(%10971, %10972) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10973) : (i64) -> ()
        %__rlasp_stack_elide_zero_878 = arith.constant 0 : i64
        %10974 = arith.addi %10894, %__rlasp_stack_elide_zero_878 : i64
        %10975 = func.call @stack_pop_pointer() : () -> i64
        %10976 = func.call @cc_cons(%10974, %10975) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10976) : (i64) -> ()
        %__rlasp_stack_elide_zero_879 = arith.constant 0 : i64
        %10977 = arith.addi %10891, %__rlasp_stack_elide_zero_879 : i64
        %10978 = func.call @stack_pop_pointer() : () -> i64
        %10979 = func.call @cc_cons(%10977, %10978) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10979) : (i64) -> ()
      }
      %10980 = func.call @stack_pop_pointer() : () -> i64
      %10981 = func.call @cc_nil_value() : () -> i64
      %10982 = func.call @cc_cons(%10980, %10981) : (i64, i64) -> i64
      %10983 = func.call @cc_not(%10982) : (i64) -> i64
      %__rlasp_stack_elide_zero_880 = arith.constant 0 : i64
      %10984 = arith.addi %10983, %__rlasp_stack_elide_zero_880 : i64
      %10985 = func.call @cc_nil_value() : () -> i64
      %10986 = func.call @cc_cons(%10984, %10985) : (i64, i64) -> i64
      %10987 = func.call @cc_not(%10986) : (i64) -> i64
      %__rlasp_stack_elide_zero_881 = arith.constant 0 : i64
      %10988 = arith.addi %10987, %__rlasp_stack_elide_zero_881 : i64
      scf.yield %10988 : i64
    }
    func.call @stack_push_pointer(%10888) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_209815645192192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_209815645192192*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_209815645192192*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("TEST-STANDARD-CHAR-P-$\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str6("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str7("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str14("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str15("TEST-CHAR-0\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str17("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str20("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str23("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str32("TEST-CHAR-1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str37("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str41("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str49("TEST-CHAR-2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str51("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str54("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str63("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str64("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str65("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str66("TEST-CHAR-3\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str68("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str70("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str71("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str75("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str76("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str79("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str83("TEST-CHAR-4\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str85("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str88("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str91("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str99("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str100("TEST-CHAR-5\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str102("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str104("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str105("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str114("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str116("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str117("TEST-CHAR-6\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str119("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str121("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str122("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str125("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str130("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str134("TEST-CHAR-7\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str136("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str137("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str138("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str139("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str142("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str143("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str147("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str148("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str149("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str150("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str151("TEST-CHAR-8\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str153("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str155("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str156("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str157("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str158("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str159("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str161("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str162("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str165("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str166("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str167("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str168("TEST-CHAR-9\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str170("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str172("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str173("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str176("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str182("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str183("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str184("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str185("TEST-CHAR-10\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str186("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str187("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str189("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str190("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str193("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str194("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str198("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str199("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str200("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str201("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str202("TEST-CHAR-11\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str203("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str204("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str206("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str207("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str210("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str211("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str212("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str216("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str217("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str218("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str219("TEST-CHAR-0A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str220("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str221("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str223("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str224("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str229("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str230("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str234("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str236("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str237("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str238("TEST-CHAR-1A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str239("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str240("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str242("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str243("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str244("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str245("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str248("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str249("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str253("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str255("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str256("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str257("TEST-CHAR-2A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str258("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str259("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str261("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str262("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str263("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str265("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str266("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str267("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str268("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str272("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str273("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str274("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str275("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str276("TEST-CHAR-3A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str277("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str278("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str281("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str282("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str287("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str290("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str292("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str293("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str294("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str295("TEST-CHAR-4A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str296("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str300("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str301("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str303("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str304("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str305("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str306("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str307("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str308("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str310("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str314("TEST-CHAR-5A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str315("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str316("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str318("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str319("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str322("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str324("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str325("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str326("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str327("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str329("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str330("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str331("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str332("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str333("TEST-CHAR-6A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str334("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str335("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str337("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str338("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str339("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str340("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str343("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str344("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str345("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str346("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str348("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str349("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str350("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str351("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str352("TEST-CHAR-7A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str353("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str354("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str355("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str356("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str357("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str358("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str359("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str360("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str362("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str363("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str366("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str367("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str368("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str369("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str370("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str371("TEST-CHAR-8A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str372("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str373("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str374("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str375("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str376("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str377("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str378("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str379("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str380("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str381("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str382("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str386("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str387("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str389("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str390("TEST-CHAR-9A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str391("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str392("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str393("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str394("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str395("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str396("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str397("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str398("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str399("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str400("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str401("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str404("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str405("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str406("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str407("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str408("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str409("TEST-CHAR-10A\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str410("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str411("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str412("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str413("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str414("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str415("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str417("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str418("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str419("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str420("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str421("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str422("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str423("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str424("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str425("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str426("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str427("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str428("TEST-CHAR-11A\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str429("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str430("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str431("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str432("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str433("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str434("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str436("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str438("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str439("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str440("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str443("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str444("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str445("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str446("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str447("TEST-CHAR-12\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str448("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str451("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str452("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str456("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str457("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str458("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str459("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str460("TEST-CHAR-12A\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str461("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str462("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str463("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str464("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str469("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str470("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str471("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str472("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str473("TEST-CHAR-13\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str474("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str475("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str476("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str477("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str478("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str479("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str480("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str482("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str483("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str485("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str486("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str487("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str488("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str489("TEST-CHAR-14\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str490("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str491("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str492("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str493("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str494("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str495("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str496("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str497("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str498("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str499("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str501("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str502("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str503("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str504("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str505("TEST-CHAR-15\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str506("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str507("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str508("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str509("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str510("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str511("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str512("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str513("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str514("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str515("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str516("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str517("MIN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str518("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str519("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str520("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str522("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str523("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str524("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str525("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str526("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str527("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str528("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str529("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str530("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str531("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str532("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str534("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str535("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str536("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("CHARACTERP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str538("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str539("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str540("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str541("BOTH-CASE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str542("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str543("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str544("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("GRAPHIC-CHAR-P\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str549("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str550("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str551("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str552("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str553("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str554("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str555("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str556("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str557("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str558("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str559("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str560("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str561("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str564("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str565("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str566("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str567("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str568("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str569("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str570("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str571("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str572("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str573("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str574("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str575("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str576("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str577("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str578("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str579("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str580("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str581("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str582("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str583("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str584("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str585("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str586("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str587("*__MLIR_BLOCK_RETFLAG_209815645192223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str588("*__MLIR_BLOCK_RETVALUE_209815645192223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str589("*__MLIR_BLOCK_RETMVLIST_209815645192223*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str590("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str591("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("MIN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str593("*__MLIR_BLOCK_RETFLAG_209815645192192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str594("*__MLIR_BLOCK_RETFLAG_209815645192223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str595("BOTH-CASE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str596("GRAPHIC-CHAR-P\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str597("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str598("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str599("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str600("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str601("*__MLIR_BLOCK_RETFLAG_209815645192223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str602("*__MLIR_BLOCK_RETVALUE_209815645192223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str603("*__MLIR_BLOCK_RETMVLIST_209815645192223*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str604("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str605("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str606("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str607("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str608("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str609("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str610("TEST-CHAR-16\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str611("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str612("NAMES\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str613("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str614("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str615("NEWLINE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str616("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str617("RUBOUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str618("PAGE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str619("TAB\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str620("BACKSPACE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str621("RETURN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str622("LINEFEED\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str623("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str624("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str625("NUL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str626("BELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str627("EXCLAMATION_MARK\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str628("QUOTATION_MARK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str629("AMPERSAND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str630("COMMA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str631("DIGIT_ZERO\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str632("COLON\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str633("COMMERCIAL_AT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str634("LATIN_CAPITAL_LETTER_A\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str635("LATIN_SMALL_LETTER_X\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str636("LEFT_CURLY_BRACKET\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str637("TILDE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str638("DEL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str639("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str640("U80\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str641("U81\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str642("U82\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str643("U83\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str644("U84\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str645("U85\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str646("U86\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str647("U87\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str648("U88\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str649("U89\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str650("U8A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str651("U8B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str652("U8C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str653("U8D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str654("U8E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str655("U8F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str656("U90\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str657("U91\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str658("U92\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str659("U93\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str660("U94\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str661("U95\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str662("U96\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str663("U97\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str664("U98\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str665("U99\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str666("U9A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str667("U9B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str668("U9C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str669("U9D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str670("U9E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str671("U9F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str672("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str673("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str674("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str675("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str676("NAMES\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str677("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str678("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str679("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str680("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str681("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str682("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str683("PUSH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str684("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str685("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str686("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str687("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str688("NEWLINE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str689("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str690("RUBOUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str691("PAGE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str692("TAB\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str693("BACKSPACE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str694("RETURN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str695("LINEFEED\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str696("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str697("NUL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str698("BELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str699("EXCLAMATION_MARK\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str700("QUOTATION_MARK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str701("AMPERSAND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str702("COMMA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str703("DIGIT_ZERO\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str704("COLON\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str705("COMMERCIAL_AT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str706("LATIN_CAPITAL_LETTER_A\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str707("LATIN_SMALL_LETTER_X\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str708("LEFT_CURLY_BRACKET\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str709("TILDE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str710("DEL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str711("U80\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str712("U81\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str713("U82\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str714("U83\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str715("U84\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str716("U85\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str717("U86\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str718("U87\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str719("U88\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str720("U89\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str721("U8A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str722("U8B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str723("U8C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str724("U8D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str725("U8E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str726("U8F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str727("U90\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str728("U91\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str729("U92\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str730("U93\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str731("U94\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str732("U95\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str733("U96\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str734("U97\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str735("U98\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str736("U99\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str737("U9A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str738("U9B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str739("U9C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str740("U9D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str741("U9E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str742("U9F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str743("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str744("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str745("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str746("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str747("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str748("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str749("TEST-CHAR-17\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str750("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str751("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str752("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str753("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str754("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str755("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str756("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str757("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str758("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str759("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str760("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str761("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str762("TEST-CHAR-18\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str763("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str764("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str765("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str766("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str767("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str768("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str769("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str770("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str771("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str772("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str773("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str774("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str775("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str776("TEST-CHAR-19\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str777("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str778("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str779("EQL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str780("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str781("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str782("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str783("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str784("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str785("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str786("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str787("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str788("TEST-CHAR-C0\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str789("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str790("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str791("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str792("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str793("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str794("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str795("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str796("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str797("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str798("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str799("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str800("TEST-CHAR-STANDARD-NAMES\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str801("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str802("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str803("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str804("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str805("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str806("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str807("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str808("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str809("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str810("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str811("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str812("TEST-CHAR-SEMISTANDARD-NAMES\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str813("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str814("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str815("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str816("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str817("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str818("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str819("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str820("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str821("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str822("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str823("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str824("*__MLIR_BLOCK_RETFLAG_209815645192192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str825("*__MLIR_BLOCK_RETMVLIST_209815645192192*\00") : !llvm.array<41 x i8>
}
