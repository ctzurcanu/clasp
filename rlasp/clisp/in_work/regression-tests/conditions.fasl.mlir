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
      %57 = arith.constant 8 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 7 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      %68 = llvm.mlir.addressof @str7 : !llvm.ptr
      %69 = arith.constant 11 : i64
      %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
      %71 = func.call @cc_intern(%67, %70) : (i64, i64) -> i64
      %72 = func.call @cc_nil_value() : () -> i64
      %73 = func.call @cc_cons(%71, %72) : (i64, i64) -> i64
      %74 = func.call @cc_values_pack(%73) : (i64) -> i64
      func.call @stack_push_pointer(%71) : (i64) -> ()
      %75 = llvm.mlir.addressof @str8 : !llvm.ptr
      %76 = arith.constant 7 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = llvm.mlir.addressof @str9 : !llvm.ptr
      %79 = arith.constant 11 : i64
      %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
      %81 = func.call @cc_intern(%77, %80) : (i64, i64) -> i64
      %82 = func.call @cc_nil_value() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      %84 = func.call @cc_values_pack(%83) : (i64) -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      %85 = llvm.mlir.addressof @str10 : !llvm.ptr
      %86 = arith.constant 8 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = llvm.mlir.addressof @str11 : !llvm.ptr
      %89 = arith.constant 11 : i64
      %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
      %91 = func.call @cc_intern(%87, %90) : (i64, i64) -> i64
      %92 = func.call @cc_nil_value() : () -> i64
      %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
      %94 = func.call @cc_values_pack(%93) : (i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %95 = llvm.mlir.addressof @str12 : !llvm.ptr
      %96 = arith.constant 6 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = llvm.mlir.addressof @str13 : !llvm.ptr
      %99 = arith.constant 11 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = func.call @cc_intern(%97, %100) : (i64, i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_cons(%101, %102) : (i64, i64) -> i64
      %104 = func.call @cc_values_pack(%103) : (i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      %105 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %106 = func.call @stack_pop_pointer() : () -> i64
      %107 = func.call @stack_pop_pointer() : () -> i64
      %108 = func.call @cc_cons(%107, %106) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %109 = arith.addi %108, %__rlasp_stack_elide_zero_3 : i64
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @cc_cons(%110, %109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @cc_cons(%113, %112) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %115 = arith.addi %114, %__rlasp_stack_elide_zero_4 : i64
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @cc_cons(%116, %115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @cc_cons(%119, %118) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %121 = arith.addi %120, %__rlasp_stack_elide_zero_5 : i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%122, %121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%123) : (i64) -> ()
      %124 = llvm.mlir.addressof @str14 : !llvm.ptr
      %125 = arith.constant 12 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = llvm.mlir.addressof @str15 : !llvm.ptr
      %128 = arith.constant 11 : i64
      %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
      %130 = func.call @cc_intern(%126, %129) : (i64, i64) -> i64
      %131 = func.call @cc_nil_value() : () -> i64
      %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
      %133 = func.call @cc_values_pack(%132) : (i64) -> i64
      func.call @stack_push_pointer(%130) : (i64) -> ()
      %134 = llvm.mlir.addressof @str16 : !llvm.ptr
      %135 = arith.constant 12 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = llvm.mlir.addressof @str17 : !llvm.ptr
      %138 = arith.constant 11 : i64
      %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
      %140 = func.call @cc_intern(%136, %139) : (i64, i64) -> i64
      %141 = func.call @cc_nil_value() : () -> i64
      %142 = func.call @cc_cons(%140, %141) : (i64, i64) -> i64
      %143 = func.call @cc_values_pack(%142) : (i64) -> i64
      func.call @stack_push_pointer(%140) : (i64) -> ()
      %144 = llvm.mlir.addressof @str18 : !llvm.ptr
      %145 = arith.constant 8 : i64
      %146 = func.call @cc_make_string(%144, %145) : (!llvm.ptr, i64) -> i64
      %147 = llvm.mlir.addressof @str19 : !llvm.ptr
      %148 = arith.constant 11 : i64
      %149 = func.call @cc_make_string(%147, %148) : (!llvm.ptr, i64) -> i64
      %150 = func.call @cc_intern(%146, %149) : (i64, i64) -> i64
      %151 = func.call @cc_nil_value() : () -> i64
      %152 = func.call @cc_cons(%150, %151) : (i64, i64) -> i64
      %153 = func.call @cc_values_pack(%152) : (i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      %154 = llvm.mlir.addressof @str20 : !llvm.ptr
      %155 = arith.constant 8 : i64
      %156 = func.call @cc_make_string(%154, %155) : (!llvm.ptr, i64) -> i64
      %157 = llvm.mlir.addressof @str21 : !llvm.ptr
      %158 = arith.constant 11 : i64
      %159 = func.call @cc_make_string(%157, %158) : (!llvm.ptr, i64) -> i64
      %160 = func.call @cc_intern(%156, %159) : (i64, i64) -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_cons(%160, %161) : (i64, i64) -> i64
      %163 = func.call @cc_values_pack(%162) : (i64) -> i64
      func.call @stack_push_pointer(%160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_cons(%165, %164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %167 = arith.addi %166, %__rlasp_stack_elide_zero_6 : i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_cons(%171, %170) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %173 = arith.addi %172, %__rlasp_stack_elide_zero_7 : i64
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_cons(%174, %173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @cc_cons(%177, %176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %179 = llvm.mlir.addressof @str22 : !llvm.ptr
      %180 = arith.constant 5 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = func.call @cc_nil_value() : () -> i64
      %183 = func.call @cc_intern(%181, %182) : (i64, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_values_pack(%185) : (i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      %187 = llvm.mlir.addressof @str23 : !llvm.ptr
      %188 = arith.constant 6 : i64
      %189 = func.call @cc_make_string(%187, %188) : (!llvm.ptr, i64) -> i64
      %190 = llvm.mlir.addressof @str24 : !llvm.ptr
      %191 = arith.constant 11 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = func.call @cc_intern(%189, %192) : (i64, i64) -> i64
      %194 = func.call @cc_nil_value() : () -> i64
      %195 = func.call @cc_cons(%193, %194) : (i64, i64) -> i64
      %196 = func.call @cc_values_pack(%195) : (i64) -> i64
      func.call @stack_push_pointer(%193) : (i64) -> ()
      %197 = llvm.mlir.addressof @str25 : !llvm.ptr
      %198 = arith.constant 4 : i64
      %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%199) : (i64) -> ()
      %200 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %201 = llvm.mlir.addressof @str26 : !llvm.ptr
      %202 = arith.constant 12 : i64
      %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
      %204 = llvm.mlir.addressof @str27 : !llvm.ptr
      %205 = arith.constant 11 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_intern(%203, %206) : (i64, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_values_pack(%209) : (i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %211 = arith.addi %207, %__rlasp_stack_elide_zero_8 : i64
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
      %214 = llvm.mlir.addressof @str28 : !llvm.ptr
      %215 = arith.constant 5 : i64
      %216 = func.call @cc_make_string(%214, %215) : (!llvm.ptr, i64) -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_intern(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_nil_value() : () -> i64
      %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      %222 = func.call @cc_cons(%218, %213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %223 = func.call @stack_pop_pointer() : () -> i64
      %224 = func.call @stack_pop_pointer() : () -> i64
      %225 = func.call @cc_cons(%224, %223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %226 = arith.addi %225, %__rlasp_stack_elide_zero_9 : i64
      %227 = func.call @stack_pop_pointer() : () -> i64
      %228 = func.call @cc_cons(%227, %226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %229 = arith.addi %228, %__rlasp_stack_elide_zero_10 : i64
      %230 = func.call @stack_pop_pointer() : () -> i64
      %231 = func.call @cc_cons(%230, %229) : (i64, i64) -> i64
      func.call @stack_push_pointer(%231) : (i64) -> ()
      %232 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%232) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @cc_cons(%234, %233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %236 = arith.addi %235, %__rlasp_stack_elide_zero_11 : i64
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_cons(%237, %236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %239 = arith.addi %238, %__rlasp_stack_elide_zero_12 : i64
      %240 = func.call @stack_pop_pointer() : () -> i64
      %241 = func.call @cc_cons(%240, %239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @stack_pop_pointer() : () -> i64
      %244 = func.call @cc_cons(%243, %242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %245 = arith.addi %244, %__rlasp_stack_elide_zero_13 : i64
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = func.call @cc_cons(%246, %245) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %248 = arith.addi %247, %__rlasp_stack_elide_zero_14 : i64
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @cc_cons(%249, %248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %251 = func.call @stack_pop_pointer() : () -> i64
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = func.call @cc_cons(%252, %251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %254 = arith.addi %253, %__rlasp_stack_elide_zero_15 : i64
      %255 = func.call @stack_pop_pointer() : () -> i64
      %256 = func.call @cc_cons(%255, %254) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %257 = arith.addi %256, %__rlasp_stack_elide_zero_16 : i64
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = func.call @cc_cons(%258, %257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %260 = arith.addi %259, %__rlasp_stack_elide_zero_17 : i64
      %344 = arith.constant 105993685958657 : i64
      %345 = arith.constant 0 : i64
      %346 = func.call @cc_make_closure(%344, %345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %347 = arith.addi %346, %__rlasp_stack_elide_zero_18 : i64
      %348 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @stack_pop_pointer() : () -> i64
      %351 = func.call @cc_cons(%350, %349) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %352 = arith.addi %351, %__rlasp_stack_elide_zero_19 : i64
      %353 = llvm.mlir.addressof @str36 : !llvm.ptr
      %354 = arith.constant 11 : i64
      %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
      %356 = llvm.mlir.addressof @str37 : !llvm.ptr
      %357 = arith.constant 7 : i64
      %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
      %359 = func.call @cc_intern(%355, %358) : (i64, i64) -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
      %362 = func.call @cc_values_pack(%361) : (i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = llvm.mlir.addressof @str38 : !llvm.ptr
      %365 = arith.constant 4 : i64
      %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
      %367 = llvm.mlir.addressof @str39 : !llvm.ptr
      %368 = arith.constant 7 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = func.call @cc_intern(%366, %369) : (i64, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_cons(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_values_pack(%372) : (i64) -> i64
      %374 = llvm.mlir.addressof @str40 : !llvm.ptr
      %375 = arith.constant 6 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_intern(%376, %377) : (i64, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_values_pack(%380) : (i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %382 = arith.addi %378, %__rlasp_stack_elide_zero_20 : i64
      %383 = func.call @cc_nil_value() : () -> i64
      %384 = func.call @cc_errorp(%64) : (i64) -> i64
      %385 = arith.cmpi ne, %384, %383 : i64
      %386 = arith.cmpi eq, %383, %383 : i64
      %387 = arith.andi %385, %386 : i1
      %388 = scf.if %387 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %383 : i64
      }
      %389 = func.call @cc_errorp(%260) : (i64) -> i64
      %390 = arith.cmpi ne, %389, %383 : i64
      %391 = arith.cmpi eq, %388, %383 : i64
      %392 = arith.andi %390, %391 : i1
      %393 = scf.if %392 -> (i64) {
        scf.yield %260 : i64
      } else {
        scf.yield %388 : i64
      }
      %394 = func.call @cc_errorp(%347) : (i64) -> i64
      %395 = arith.cmpi ne, %394, %383 : i64
      %396 = arith.cmpi eq, %393, %383 : i64
      %397 = arith.andi %395, %396 : i1
      %398 = scf.if %397 -> (i64) {
        scf.yield %347 : i64
      } else {
        scf.yield %393 : i64
      }
      %399 = func.call @cc_errorp(%352) : (i64) -> i64
      %400 = arith.cmpi ne, %399, %383 : i64
      %401 = arith.cmpi eq, %398, %383 : i64
      %402 = arith.andi %400, %401 : i1
      %403 = scf.if %402 -> (i64) {
        scf.yield %352 : i64
      } else {
        scf.yield %398 : i64
      }
      %404 = func.call @cc_errorp(%359) : (i64) -> i64
      %405 = arith.cmpi ne, %404, %383 : i64
      %406 = arith.cmpi eq, %403, %383 : i64
      %407 = arith.andi %405, %406 : i1
      %408 = scf.if %407 -> (i64) {
        scf.yield %359 : i64
      } else {
        scf.yield %403 : i64
      }
      %409 = func.call @cc_errorp(%363) : (i64) -> i64
      %410 = arith.cmpi ne, %409, %383 : i64
      %411 = arith.cmpi eq, %408, %383 : i64
      %412 = arith.andi %410, %411 : i1
      %413 = scf.if %412 -> (i64) {
        scf.yield %363 : i64
      } else {
        scf.yield %408 : i64
      }
      %414 = func.call @cc_errorp(%370) : (i64) -> i64
      %415 = arith.cmpi ne, %414, %383 : i64
      %416 = arith.cmpi eq, %413, %383 : i64
      %417 = arith.andi %415, %416 : i1
      %418 = scf.if %417 -> (i64) {
        scf.yield %370 : i64
      } else {
        scf.yield %413 : i64
      }
      %419 = func.call @cc_errorp(%382) : (i64) -> i64
      %420 = arith.cmpi ne, %419, %383 : i64
      %421 = arith.cmpi eq, %418, %383 : i64
      %422 = arith.andi %420, %421 : i1
      %423 = scf.if %422 -> (i64) {
        scf.yield %382 : i64
      } else {
        scf.yield %418 : i64
      }
      %424 = arith.cmpi ne, %423, %383 : i64
      scf.if %424 {
        func.call @stack_push_pointer(%423) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%260) : (i64) -> ()
        func.call @stack_push_pointer(%347) : (i64) -> ()
        func.call @stack_push_pointer(%352) : (i64) -> ()
        func.call @stack_push_pointer(%359) : (i64) -> ()
        func.call @stack_push_pointer(%363) : (i64) -> ()
        func.call @stack_push_pointer(%370) : (i64) -> ()
        func.call @stack_push_pointer(%382) : (i64) -> ()
        %425 = llvm.mlir.addressof @str41 : !llvm.ptr
        %426 = func.call @cc_make_function_ref_const(%425) : (!llvm.ptr) -> i64
        %427 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%426, %427) : (i64, i64) -> ()
      }
      %428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %428 : i64
    }
    %429 = func.call @cc_nil_value() : () -> i64
    %430 = func.call @cc_errorp(%55) : (i64) -> i64
    %431 = arith.cmpi ne, %430, %429 : i64
    %432 = scf.if %431 -> (i64) {
      scf.yield %55 : i64
    } else {
      %433 = llvm.mlir.addressof @str42 : !llvm.ptr
      %434 = arith.constant 22 : i64
      %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_intern(%435, %436) : (i64, i64) -> i64
      %438 = func.call @cc_nil_value() : () -> i64
      %439 = func.call @cc_cons(%437, %438) : (i64, i64) -> i64
      %440 = func.call @cc_values_pack(%439) : (i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %441 = arith.addi %437, %__rlasp_stack_elide_zero_21 : i64
      %442 = llvm.mlir.addressof @str43 : !llvm.ptr
      %443 = arith.constant 13 : i64
      %444 = func.call @cc_make_string(%442, %443) : (!llvm.ptr, i64) -> i64
      %445 = llvm.mlir.addressof @str44 : !llvm.ptr
      %446 = arith.constant 11 : i64
      %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
      %448 = func.call @cc_intern(%444, %447) : (i64, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_cons(%448, %449) : (i64, i64) -> i64
      %451 = func.call @cc_values_pack(%450) : (i64) -> i64
      func.call @stack_push_pointer(%448) : (i64) -> ()
      %452 = llvm.mlir.addressof @str45 : !llvm.ptr
      %453 = arith.constant 6 : i64
      %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
      %455 = func.call @cc_nil_value() : () -> i64
      %456 = func.call @cc_intern(%454, %455) : (i64, i64) -> i64
      %457 = func.call @cc_nil_value() : () -> i64
      %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
      %459 = func.call @cc_values_pack(%458) : (i64) -> i64
      func.call @stack_push_pointer(%456) : (i64) -> ()
      %460 = llvm.mlir.addressof @str46 : !llvm.ptr
      %461 = arith.constant 19 : i64
      %462 = func.call @cc_make_string(%460, %461) : (!llvm.ptr, i64) -> i64
      %463 = func.call @cc_nil_value() : () -> i64
      %464 = func.call @cc_intern(%462, %463) : (i64, i64) -> i64
      %465 = func.call @cc_nil_value() : () -> i64
      %466 = func.call @cc_cons(%464, %465) : (i64, i64) -> i64
      %467 = func.call @cc_values_pack(%466) : (i64) -> i64
      func.call @stack_push_pointer(%464) : (i64) -> ()
      %468 = llvm.mlir.addressof @str47 : !llvm.ptr
      %469 = arith.constant 19 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = llvm.mlir.addressof @str48 : !llvm.ptr
      %472 = arith.constant 11 : i64
      %473 = func.call @cc_make_string(%471, %472) : (!llvm.ptr, i64) -> i64
      %474 = func.call @cc_intern(%470, %473) : (i64, i64) -> i64
      %475 = func.call @cc_nil_value() : () -> i64
      %476 = func.call @cc_cons(%474, %475) : (i64, i64) -> i64
      %477 = func.call @cc_values_pack(%476) : (i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      %478 = llvm.mlir.addressof @str49 : !llvm.ptr
      %479 = arith.constant 14 : i64
      %480 = func.call @cc_make_string(%478, %479) : (!llvm.ptr, i64) -> i64
      %481 = llvm.mlir.addressof @str50 : !llvm.ptr
      %482 = arith.constant 11 : i64
      %483 = func.call @cc_make_string(%481, %482) : (!llvm.ptr, i64) -> i64
      %484 = func.call @cc_intern(%480, %483) : (i64, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_cons(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_values_pack(%486) : (i64) -> i64
      func.call @stack_push_pointer(%484) : (i64) -> ()
      %488 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %489 = llvm.mlir.addressof @str51 : !llvm.ptr
      %490 = arith.constant 10 : i64
      %491 = func.call @cc_make_string(%489, %490) : (!llvm.ptr, i64) -> i64
      %492 = llvm.mlir.addressof @str52 : !llvm.ptr
      %493 = arith.constant 11 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = func.call @cc_intern(%491, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %499 = arith.addi %495, %__rlasp_stack_elide_zero_22 : i64
      %500 = func.call @stack_pop_pointer() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = llvm.mlir.addressof @str53 : !llvm.ptr
      %503 = arith.constant 5 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = func.call @cc_nil_value() : () -> i64
      %506 = func.call @cc_intern(%504, %505) : (i64, i64) -> i64
      %507 = func.call @cc_nil_value() : () -> i64
      %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
      %509 = func.call @cc_values_pack(%508) : (i64) -> i64
      %510 = func.call @cc_cons(%506, %501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @stack_pop_pointer() : () -> i64
      %513 = func.call @cc_cons(%512, %511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %514 = arith.addi %513, %__rlasp_stack_elide_zero_23 : i64
      %515 = func.call @stack_pop_pointer() : () -> i64
      %516 = func.call @cc_cons(%515, %514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%516) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %517 = func.call @stack_pop_pointer() : () -> i64
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = func.call @cc_cons(%518, %517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %520 = arith.addi %519, %__rlasp_stack_elide_zero_24 : i64
      %521 = func.call @stack_pop_pointer() : () -> i64
      %522 = func.call @cc_cons(%521, %520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @cc_cons(%524, %523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %526 = arith.addi %525, %__rlasp_stack_elide_zero_25 : i64
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @cc_cons(%527, %526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @stack_pop_pointer() : () -> i64
      %531 = func.call @cc_cons(%530, %529) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %532 = arith.addi %531, %__rlasp_stack_elide_zero_26 : i64
      %533 = func.call @stack_pop_pointer() : () -> i64
      %534 = func.call @cc_cons(%533, %532) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %535 = arith.addi %534, %__rlasp_stack_elide_zero_27 : i64
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = func.call @cc_cons(%536, %535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_cons(%539, %538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %541 = arith.addi %540, %__rlasp_stack_elide_zero_28 : i64
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @cc_cons(%542, %541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %544 = arith.addi %543, %__rlasp_stack_elide_zero_29 : i64
      %619 = arith.constant 105993685958658 : i64
      %620 = arith.constant 0 : i64
      %621 = func.call @cc_make_closure(%619, %620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %622 = arith.addi %621, %__rlasp_stack_elide_zero_30 : i64
      %623 = llvm.mlir.addressof @str58 : !llvm.ptr
      %624 = arith.constant 4 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = func.call @cc_nil_value() : () -> i64
      %627 = func.call @cc_intern(%625, %626) : (i64, i64) -> i64
      %628 = func.call @cc_nil_value() : () -> i64
      %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
      %630 = func.call @cc_values_pack(%629) : (i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      %631 = llvm.mlir.addressof @str59 : !llvm.ptr
      %632 = arith.constant 12 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = llvm.mlir.addressof @str60 : !llvm.ptr
      %635 = arith.constant 11 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_intern(%633, %636) : (i64, i64) -> i64
      %638 = func.call @cc_nil_value() : () -> i64
      %639 = func.call @cc_cons(%637, %638) : (i64, i64) -> i64
      %640 = func.call @cc_values_pack(%639) : (i64) -> i64
      func.call @stack_push_pointer(%637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %641 = func.call @stack_pop_pointer() : () -> i64
      %642 = func.call @stack_pop_pointer() : () -> i64
      %643 = func.call @cc_cons(%642, %641) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %644 = arith.addi %643, %__rlasp_stack_elide_zero_31 : i64
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = func.call @cc_cons(%645, %644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %647 = arith.addi %646, %__rlasp_stack_elide_zero_32 : i64
      %648 = llvm.mlir.addressof @str61 : !llvm.ptr
      %649 = arith.constant 11 : i64
      %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
      %651 = llvm.mlir.addressof @str62 : !llvm.ptr
      %652 = arith.constant 7 : i64
      %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
      %654 = func.call @cc_intern(%650, %653) : (i64, i64) -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
      %657 = func.call @cc_values_pack(%656) : (i64) -> i64
      %658 = func.call @cc_nil_value() : () -> i64
      %659 = llvm.mlir.addressof @str63 : !llvm.ptr
      %660 = arith.constant 4 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = llvm.mlir.addressof @str64 : !llvm.ptr
      %663 = arith.constant 7 : i64
      %664 = func.call @cc_make_string(%662, %663) : (!llvm.ptr, i64) -> i64
      %665 = func.call @cc_intern(%661, %664) : (i64, i64) -> i64
      %666 = func.call @cc_nil_value() : () -> i64
      %667 = func.call @cc_cons(%665, %666) : (i64, i64) -> i64
      %668 = func.call @cc_values_pack(%667) : (i64) -> i64
      %669 = llvm.mlir.addressof @str65 : !llvm.ptr
      %670 = arith.constant 5 : i64
      %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_intern(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_nil_value() : () -> i64
      %675 = func.call @cc_cons(%673, %674) : (i64, i64) -> i64
      %676 = func.call @cc_values_pack(%675) : (i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %677 = arith.addi %673, %__rlasp_stack_elide_zero_33 : i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_errorp(%441) : (i64) -> i64
      %680 = arith.cmpi ne, %679, %678 : i64
      %681 = arith.cmpi eq, %678, %678 : i64
      %682 = arith.andi %680, %681 : i1
      %683 = scf.if %682 -> (i64) {
        scf.yield %441 : i64
      } else {
        scf.yield %678 : i64
      }
      %684 = func.call @cc_errorp(%544) : (i64) -> i64
      %685 = arith.cmpi ne, %684, %678 : i64
      %686 = arith.cmpi eq, %683, %678 : i64
      %687 = arith.andi %685, %686 : i1
      %688 = scf.if %687 -> (i64) {
        scf.yield %544 : i64
      } else {
        scf.yield %683 : i64
      }
      %689 = func.call @cc_errorp(%622) : (i64) -> i64
      %690 = arith.cmpi ne, %689, %678 : i64
      %691 = arith.cmpi eq, %688, %678 : i64
      %692 = arith.andi %690, %691 : i1
      %693 = scf.if %692 -> (i64) {
        scf.yield %622 : i64
      } else {
        scf.yield %688 : i64
      }
      %694 = func.call @cc_errorp(%647) : (i64) -> i64
      %695 = arith.cmpi ne, %694, %678 : i64
      %696 = arith.cmpi eq, %693, %678 : i64
      %697 = arith.andi %695, %696 : i1
      %698 = scf.if %697 -> (i64) {
        scf.yield %647 : i64
      } else {
        scf.yield %693 : i64
      }
      %699 = func.call @cc_errorp(%654) : (i64) -> i64
      %700 = arith.cmpi ne, %699, %678 : i64
      %701 = arith.cmpi eq, %698, %678 : i64
      %702 = arith.andi %700, %701 : i1
      %703 = scf.if %702 -> (i64) {
        scf.yield %654 : i64
      } else {
        scf.yield %698 : i64
      }
      %704 = func.call @cc_errorp(%658) : (i64) -> i64
      %705 = arith.cmpi ne, %704, %678 : i64
      %706 = arith.cmpi eq, %703, %678 : i64
      %707 = arith.andi %705, %706 : i1
      %708 = scf.if %707 -> (i64) {
        scf.yield %658 : i64
      } else {
        scf.yield %703 : i64
      }
      %709 = func.call @cc_errorp(%665) : (i64) -> i64
      %710 = arith.cmpi ne, %709, %678 : i64
      %711 = arith.cmpi eq, %708, %678 : i64
      %712 = arith.andi %710, %711 : i1
      %713 = scf.if %712 -> (i64) {
        scf.yield %665 : i64
      } else {
        scf.yield %708 : i64
      }
      %714 = func.call @cc_errorp(%677) : (i64) -> i64
      %715 = arith.cmpi ne, %714, %678 : i64
      %716 = arith.cmpi eq, %713, %678 : i64
      %717 = arith.andi %715, %716 : i1
      %718 = scf.if %717 -> (i64) {
        scf.yield %677 : i64
      } else {
        scf.yield %713 : i64
      }
      %719 = arith.cmpi ne, %718, %678 : i64
      scf.if %719 {
        func.call @stack_push_pointer(%718) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%441) : (i64) -> ()
        func.call @stack_push_pointer(%544) : (i64) -> ()
        func.call @stack_push_pointer(%622) : (i64) -> ()
        func.call @stack_push_pointer(%647) : (i64) -> ()
        func.call @stack_push_pointer(%654) : (i64) -> ()
        func.call @stack_push_pointer(%658) : (i64) -> ()
        func.call @stack_push_pointer(%665) : (i64) -> ()
        func.call @stack_push_pointer(%677) : (i64) -> ()
        %720 = llvm.mlir.addressof @str66 : !llvm.ptr
        %721 = func.call @cc_make_function_ref_const(%720) : (!llvm.ptr) -> i64
        %722 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%721, %722) : (i64, i64) -> ()
      }
      %723 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %723 : i64
    }
    %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
    %724 = arith.addi %432, %__rlasp_stack_elide_zero_34 : i64
    %725 = func.call @cc_multiple_value_list(%724) : (i64) -> i64
    %726 = llvm.mlir.addressof @str67 : !llvm.ptr
    %727 = arith.constant 38 : i64
    %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
    %729 = func.call @cc_nil_value() : () -> i64
    %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
    %731 = func.call @cc_nil_value() : () -> i64
    %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
    %733 = func.call @cc_values_pack(%732) : (i64) -> i64
    %734 = func.call @cc_symbol_value(%730) : (i64) -> i64
    %735 = llvm.mlir.addressof @str68 : !llvm.ptr
    %736 = arith.constant 40 : i64
    %737 = func.call @cc_make_string(%735, %736) : (!llvm.ptr, i64) -> i64
    %738 = func.call @cc_nil_value() : () -> i64
    %739 = func.call @cc_intern(%737, %738) : (i64, i64) -> i64
    %740 = func.call @cc_nil_value() : () -> i64
    %741 = func.call @cc_cons(%739, %740) : (i64, i64) -> i64
    %742 = func.call @cc_values_pack(%741) : (i64) -> i64
    %743 = func.call @cc_symbol_value(%739) : (i64) -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = arith.cmpi ne, %734, %744 : i64
    %746 = scf.if %745 -> (i64) {
      scf.yield %743 : i64
    } else {
      scf.yield %725 : i64
    }
    %747 = func.call @cc_values_pack(%746) : (i64) -> i64
    func.call @stack_push_pointer(%747) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_105993685958657"() {
    %261 = func.call @cc_nil_value() : () -> i64
    %262 = func.call @cc_nil_value() : () -> i64
    %263 = func.call @cc_errorp(%261) : (i64) -> i64
    %264 = arith.cmpi ne, %263, %262 : i64
    %265 = scf.if %264 -> (i64) {
      scf.yield %261 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_errorp(%266) : (i64) -> i64
      %269 = arith.cmpi ne, %268, %267 : i64
      %270 = scf.if %269 -> (i64) {
        scf.yield %266 : i64
      } else {
        %271 = func.call @cc_nil_value() : () -> i64
        %272 = llvm.mlir.addressof @str29 : !llvm.ptr
        %273 = arith.constant 12 : i64
        %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
        %275 = llvm.mlir.addressof @str30 : !llvm.ptr
        %276 = arith.constant 11 : i64
        %277 = func.call @cc_make_string(%275, %276) : (!llvm.ptr, i64) -> i64
        %278 = func.call @cc_intern(%274, %277) : (i64, i64) -> i64
        %279 = func.call @cc_nil_value() : () -> i64
        %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
        %281 = func.call @cc_values_pack(%280) : (i64) -> i64
        %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
        %282 = arith.addi %278, %__rlasp_stack_elide_zero_35 : i64
        %283 = llvm.mlir.addressof @str31 : !llvm.ptr
        %284 = func.call @cc_make_function_ref_const(%283) : (!llvm.ptr) -> i64
        %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
        %285 = arith.addi %284, %__rlasp_stack_elide_zero_36 : i64
        %286 = func.call @cc_cons(%282, %285) : (i64, i64) -> i64
        %287 = func.call @cc_cons(%286, %271) : (i64, i64) -> i64
        %288 = func.call @cc_push_handler_frame(%287) : (i64) -> i64
        %289 = func.call @cc_errorp(%288) : (i64) -> i64
        %290 = func.call @cc_nil_value() : () -> i64
        %291 = arith.cmpi ne, %289, %290 : i64
        %292 = scf.if %291 -> (i64) {
          scf.yield %288 : i64
        } else {
          %293 = func.call @cc_nil_value() : () -> i64
          %294 = func.call @cc_nil_value() : () -> i64
          %295 = func.call @cc_errorp(%293) : (i64) -> i64
          %296 = arith.cmpi ne, %295, %294 : i64
          %297 = scf.if %296 -> (i64) {
            scf.yield %293 : i64
          } else {
            %298 = func.call @cc_nil_value() : () -> i64
            %299 = func.call @cc_nil_value() : () -> i64
            %300 = func.call @cc_errorp(%298) : (i64) -> i64
            %301 = arith.cmpi ne, %300, %299 : i64
            %302 = scf.if %301 -> (i64) {
              scf.yield %298 : i64
            } else {
              %303 = llvm.mlir.addressof @str32 : !llvm.ptr
              %304 = arith.constant 4 : i64
              %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
              %306 = llvm.mlir.addressof @str33 : !llvm.ptr
              %307 = arith.constant 12 : i64
              %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
              %309 = llvm.mlir.addressof @str34 : !llvm.ptr
              %310 = arith.constant 11 : i64
              %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
              %312 = func.call @cc_intern(%308, %311) : (i64, i64) -> i64
              %313 = func.call @cc_nil_value() : () -> i64
              %314 = func.call @cc_cons(%312, %313) : (i64, i64) -> i64
              %315 = func.call @cc_values_pack(%314) : (i64) -> i64
              %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
              %316 = arith.addi %312, %__rlasp_stack_elide_zero_37 : i64
              %317 = func.call @cc_nil_value() : () -> i64
              %318 = func.call @cc_errorp(%305) : (i64) -> i64
              %319 = arith.cmpi ne, %318, %317 : i64
              %320 = arith.cmpi eq, %317, %317 : i64
              %321 = arith.andi %319, %320 : i1
              %322 = scf.if %321 -> (i64) {
                scf.yield %305 : i64
              } else {
                scf.yield %317 : i64
              }
              %323 = func.call @cc_errorp(%316) : (i64) -> i64
              %324 = arith.cmpi ne, %323, %317 : i64
              %325 = arith.cmpi eq, %322, %317 : i64
              %326 = arith.andi %324, %325 : i1
              %327 = scf.if %326 -> (i64) {
                scf.yield %316 : i64
              } else {
                scf.yield %322 : i64
              }
              %328 = arith.cmpi ne, %327, %317 : i64
              scf.if %328 {
                func.call @stack_push_pointer(%327) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%305) : (i64) -> ()
                func.call @stack_push_pointer(%316) : (i64) -> ()
                %329 = llvm.mlir.addressof @str35 : !llvm.ptr
                %330 = func.call @cc_make_function_ref_const(%329) : (!llvm.ptr) -> i64
                %331 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%330, %331) : (i64, i64) -> ()
              }
              %332 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %332 : i64
            }
            %333 = func.call @cc_nil_value() : () -> i64
            %334 = func.call @cc_errorp(%302) : (i64) -> i64
            %335 = arith.cmpi ne, %334, %333 : i64
            %336 = scf.if %335 -> (i64) {
              scf.yield %302 : i64
            } else {
              %337 = arith.constant 10 : i64
              func.call @stack_push_fixnum(%337) : (i64) -> ()
              %338 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %338 : i64
            }
            %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
            %339 = arith.addi %336, %__rlasp_stack_elide_zero_38 : i64
            scf.yield %339 : i64
          }
          %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
          %340 = arith.addi %297, %__rlasp_stack_elide_zero_39 : i64
          %341 = func.call @cc_pop_handler_frame() : () -> i64
          scf.yield %340 : i64
        }
        %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
        %342 = arith.addi %292, %__rlasp_stack_elide_zero_40 : i64
        scf.yield %342 : i64
      }
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %343 = arith.addi %270, %__rlasp_stack_elide_zero_41 : i64
      scf.yield %343 : i64
    }
    func.call @stack_push_pointer(%265) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_105993685958658"() {
    %545 = func.call @cc_nil_value() : () -> i64
    %546 = func.call @cc_nil_value() : () -> i64
    %547 = func.call @cc_errorp(%545) : (i64) -> i64
    %548 = arith.cmpi ne, %547, %546 : i64
    %549 = scf.if %548 -> (i64) {
      scf.yield %545 : i64
    } else {
      %550 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_nil_value() : () -> i64
      %553 = func.call @cc_errorp(%551) : (i64) -> i64
      %554 = arith.cmpi ne, %553, %552 : i64
      %555 = scf.if %554 -> (i64) {
        scf.yield %551 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %556 = llvm.mlir.addressof @str54 : !llvm.ptr
        %557 = arith.constant 10 : i64
        %558 = func.call @cc_make_string(%556, %557) : (!llvm.ptr, i64) -> i64
        %559 = llvm.mlir.addressof @str55 : !llvm.ptr
        %560 = arith.constant 11 : i64
        %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
        %562 = func.call @cc_intern(%558, %561) : (i64, i64) -> i64
        %563 = func.call @cc_nil_value() : () -> i64
        %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
        %565 = func.call @cc_values_pack(%564) : (i64) -> i64
        %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
        %566 = arith.addi %562, %__rlasp_stack_elide_zero_42 : i64
        %567 = func.call @cc_nil_value() : () -> i64
        %568 = func.call @cc_errorp(%566) : (i64) -> i64
        %569 = arith.cmpi ne, %568, %567 : i64
        %570 = arith.cmpi eq, %567, %567 : i64
        %571 = arith.andi %569, %570 : i1
        %572 = scf.if %571 -> (i64) {
          scf.yield %566 : i64
        } else {
          scf.yield %567 : i64
        }
        %573 = arith.cmpi ne, %572, %567 : i64
        scf.if %573 {
          func.call @stack_push_pointer(%572) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%566) : (i64) -> ()
          %574 = llvm.mlir.addressof @str56 : !llvm.ptr
          %575 = func.call @cc_make_function_ref_const(%574) : (!llvm.ptr) -> i64
          %576 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%575, %576) : (i64, i64) -> ()
        }
        %577 = func.call @stack_pop_pointer() : () -> i64
        %578 = llvm.mlir.addressof @str57 : !llvm.ptr
        %579 = arith.constant 8 : i64
        %580 = func.call @cc_make_string(%578, %579) : (!llvm.ptr, i64) -> i64
        %581 = func.call @cc_nil_value() : () -> i64
        %582 = func.call @cc_intern(%580, %581) : (i64, i64) -> i64
        %583 = func.call @cc_nil_value() : () -> i64
        %584 = func.call @cc_cons(%582, %583) : (i64, i64) -> i64
        %585 = func.call @cc_values_pack(%584) : (i64) -> i64
        %586 = func.call @cc_slot_value(%577, %582) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
        %587 = arith.addi %586, %__rlasp_stack_elide_zero_43 : i64
        %588 = func.call @cc_errorp(%587) : (i64) -> i64
        %589 = func.call @cc_nil_value() : () -> i64
        %590 = arith.cmpi ne, %588, %589 : i64
        scf.if %590 {
          func.call @stack_push_pointer(%587) : (i64) -> ()
        } else {
          %591 = func.call @cc_multiple_value_list(%587) : (i64) -> i64
          func.call @stack_push_pointer(%591) : (i64) -> ()
        }
        %592 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %593 = func.call @stack_pop_pointer() : () -> i64
        %594 = func.call @cc_nil_value() : () -> i64
        %595 = func.call @cc_maybe_error_from_multiple_value_list(%592) : (i64) -> i64
        %596 = func.call @cc_errorp(%595) : (i64) -> i64
        %597 = arith.cmpi ne, %596, %594 : i64
        %598 = arith.cmpi eq, %594, %594 : i64
        %599 = arith.andi %597, %598 : i1
        %600 = scf.if %599 -> (i64) {
          scf.yield %595 : i64
        } else {
          scf.yield %594 : i64
        }
        %601 = arith.cmpi ne, %600, %594 : i64
        scf.if %601 {
          func.call @stack_push_pointer(%600) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %602 = func.call @stack_pop_pointer() : () -> i64
          %603 = func.call @cc_cons(%593, %602) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
          %604 = arith.addi %603, %__rlasp_stack_elide_zero_44 : i64
          %605 = func.call @cc_cons(%592, %604) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
          %606 = arith.addi %605, %__rlasp_stack_elide_zero_45 : i64
          %607 = func.call @cc_values_pack(%606) : (i64) -> i64
          func.call @stack_push_pointer(%607) : (i64) -> ()
        }
        %608 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %608 : i64
      }
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %609 = arith.addi %555, %__rlasp_stack_elide_zero_46 : i64
      %610 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %611 = func.call @cc_errorp(%609) : (i64) -> i64
      %612 = func.call @cc_nil_value() : () -> i64
      %613 = arith.cmpi ne, %611, %612 : i64
      scf.if %613 {
        %614 = func.call @cc_condition_value(%609) : (i64) -> i64
        %615 = func.call @cc_values2(%612, %614) : (i64, i64) -> i64
        func.call @stack_push_pointer(%615) : (i64) -> ()
      } else {
        %616 = func.call @cc_multiple_value_list(%609) : (i64) -> i64
        %617 = func.call @cc_values_pack(%616) : (i64) -> i64
        func.call @stack_push_pointer(%617) : (i64) -> ()
      }
      %618 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %618 : i64
    }
    func.call @stack_push_pointer(%549) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_105993685958656*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_105993685958656*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_105993685958656*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("CERROR.6\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str6("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("HANDLER-BIND\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("CONTINUE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str23("CERROR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("Wooo\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP::CONTINUE\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str32("Wooo\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("CERROR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str41("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str42("CONDITION-SLOT-UNBOUND\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str43("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str44("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str47("FILE-ERROR-PATHNAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("MAKE-CONDITION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str54("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("MAKE-CONDITION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str57("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_105993685958656*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETMVLIST_105993685958656*\00") : !llvm.array<41 x i8>
}
