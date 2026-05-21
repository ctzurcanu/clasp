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
      %57 = arith.constant 12 : i64
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
      %74 = arith.constant 3 : i64
      %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
      %76 = func.call @cc_nil_value() : () -> i64
      %77 = func.call @cc_intern(%75, %76) : (i64, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      %79 = func.call @cc_cons(%77, %78) : (i64, i64) -> i64
      %80 = func.call @cc_values_pack(%79) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %81 = llvm.mlir.addressof @str8 : !llvm.ptr
      %82 = arith.constant 17 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      %84 = llvm.mlir.addressof @str9 : !llvm.ptr
      %85 = arith.constant 3 : i64
      %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
      %87 = func.call @cc_intern(%83, %86) : (i64, i64) -> i64
      %88 = func.call @cc_nil_value() : () -> i64
      %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
      %90 = func.call @cc_values_pack(%89) : (i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %91 = llvm.mlir.addressof @str10 : !llvm.ptr
      %92 = arith.constant 5 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = llvm.mlir.addressof @str11 : !llvm.ptr
      %95 = arith.constant 11 : i64
      %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
      %97 = func.call @cc_intern(%93, %96) : (i64, i64) -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
      %100 = func.call @cc_values_pack(%99) : (i64) -> i64
      func.call @stack_push_pointer(%97) : (i64) -> ()
      %101 = llvm.mlir.addressof @str12 : !llvm.ptr
      %102 = arith.constant 15 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = llvm.mlir.addressof @str13 : !llvm.ptr
      %105 = arith.constant 3 : i64
      %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
      %107 = func.call @cc_intern(%103, %106) : (i64, i64) -> i64
      %108 = func.call @cc_nil_value() : () -> i64
      %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
      %110 = func.call @cc_values_pack(%109) : (i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      %111 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%111) : (i64) -> ()
      %112 = llvm.mlir.addressof @str14 : !llvm.ptr
      %113 = arith.constant 4 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = llvm.mlir.addressof @str15 : !llvm.ptr
      %116 = arith.constant 11 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = func.call @cc_intern(%114, %117) : (i64, i64) -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
      %121 = func.call @cc_values_pack(%120) : (i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      %122 = llvm.mlir.addressof @str16 : !llvm.ptr
      %123 = arith.constant 10 : i64
      %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
      %125 = llvm.mlir.addressof @str17 : !llvm.ptr
      %126 = arith.constant 11 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = func.call @cc_intern(%124, %127) : (i64, i64) -> i64
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_cons(%128, %129) : (i64, i64) -> i64
      %131 = func.call @cc_values_pack(%130) : (i64) -> i64
      func.call @stack_push_pointer(%128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %132 = func.call @stack_pop_pointer() : () -> i64
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = func.call @cc_cons(%133, %132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %135 = arith.addi %134, %__rlasp_stack_elide_zero_3 : i64
      %136 = func.call @stack_pop_pointer() : () -> i64
      %137 = func.call @cc_cons(%136, %135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %138 = arith.addi %137, %__rlasp_stack_elide_zero_4 : i64
      %139 = func.call @stack_pop_pointer() : () -> i64
      %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
      %141 = llvm.mlir.addressof @str18 : !llvm.ptr
      %142 = arith.constant 5 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      %144 = func.call @cc_nil_value() : () -> i64
      %145 = func.call @cc_intern(%143, %144) : (i64, i64) -> i64
      %146 = func.call @cc_nil_value() : () -> i64
      %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
      %148 = func.call @cc_values_pack(%147) : (i64) -> i64
      %149 = func.call @cc_cons(%145, %140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%149) : (i64) -> ()
      %150 = llvm.mlir.addressof @str19 : !llvm.ptr
      %151 = arith.constant 8 : i64
      %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
      %153 = llvm.mlir.addressof @str20 : !llvm.ptr
      %154 = arith.constant 7 : i64
      %155 = func.call @cc_make_string(%153, %154) : (!llvm.ptr, i64) -> i64
      %156 = func.call @cc_intern(%152, %155) : (i64, i64) -> i64
      %157 = func.call @cc_nil_value() : () -> i64
      %158 = func.call @cc_cons(%156, %157) : (i64, i64) -> i64
      %159 = func.call @cc_values_pack(%158) : (i64) -> i64
      func.call @stack_push_pointer(%156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @cc_cons(%161, %160) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %163 = arith.addi %162, %__rlasp_stack_elide_zero_5 : i64
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @cc_cons(%164, %163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %166 = arith.addi %165, %__rlasp_stack_elide_zero_6 : i64
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_cons(%167, %166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @cc_cons(%170, %169) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %172 = arith.addi %171, %__rlasp_stack_elide_zero_7 : i64
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @cc_cons(%173, %172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%174) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @cc_cons(%176, %175) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %178 = arith.addi %177, %__rlasp_stack_elide_zero_8 : i64
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @cc_cons(%179, %178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%180) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @cc_cons(%182, %181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %184 = arith.addi %183, %__rlasp_stack_elide_zero_9 : i64
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @cc_cons(%185, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %187 = func.call @stack_pop_pointer() : () -> i64
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_cons(%188, %187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %190 = arith.addi %189, %__rlasp_stack_elide_zero_10 : i64
      %191 = func.call @stack_pop_pointer() : () -> i64
      %192 = func.call @cc_cons(%191, %190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %193 = arith.addi %192, %__rlasp_stack_elide_zero_11 : i64
      %273 = arith.constant 261322017079297 : i64
      %274 = arith.constant 0 : i64
      %275 = func.call @cc_make_closure(%273, %274) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %276 = arith.addi %275, %__rlasp_stack_elide_zero_12 : i64
      %277 = llvm.mlir.addressof @str29 : !llvm.ptr
      %278 = arith.constant 1 : i64
      %279 = func.call @cc_make_string(%277, %278) : (!llvm.ptr, i64) -> i64
      %280 = func.call @cc_nil_value() : () -> i64
      %281 = func.call @cc_intern(%279, %280) : (i64, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_cons(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_values_pack(%283) : (i64) -> i64
      func.call @stack_push_pointer(%281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %285 = func.call @stack_pop_pointer() : () -> i64
      %286 = func.call @stack_pop_pointer() : () -> i64
      %287 = func.call @cc_cons(%286, %285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %288 = arith.addi %287, %__rlasp_stack_elide_zero_13 : i64
      %289 = llvm.mlir.addressof @str30 : !llvm.ptr
      %290 = arith.constant 11 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = llvm.mlir.addressof @str31 : !llvm.ptr
      %293 = arith.constant 7 : i64
      %294 = func.call @cc_make_string(%292, %293) : (!llvm.ptr, i64) -> i64
      %295 = func.call @cc_intern(%291, %294) : (i64, i64) -> i64
      %296 = func.call @cc_nil_value() : () -> i64
      %297 = func.call @cc_cons(%295, %296) : (i64, i64) -> i64
      %298 = func.call @cc_values_pack(%297) : (i64) -> i64
      %299 = func.call @cc_nil_value() : () -> i64
      %300 = llvm.mlir.addressof @str32 : !llvm.ptr
      %301 = arith.constant 4 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = llvm.mlir.addressof @str33 : !llvm.ptr
      %304 = arith.constant 7 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = func.call @cc_intern(%302, %305) : (i64, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_values_pack(%308) : (i64) -> i64
      %310 = llvm.mlir.addressof @str34 : !llvm.ptr
      %311 = arith.constant 6 : i64
      %312 = func.call @cc_make_string(%310, %311) : (!llvm.ptr, i64) -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_intern(%312, %313) : (i64, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_values_pack(%316) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %318 = arith.addi %314, %__rlasp_stack_elide_zero_14 : i64
      %319 = func.call @cc_nil_value() : () -> i64
      %320 = func.call @cc_errorp(%64) : (i64) -> i64
      %321 = arith.cmpi ne, %320, %319 : i64
      %322 = arith.cmpi eq, %319, %319 : i64
      %323 = arith.andi %321, %322 : i1
      %324 = scf.if %323 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %319 : i64
      }
      %325 = func.call @cc_errorp(%193) : (i64) -> i64
      %326 = arith.cmpi ne, %325, %319 : i64
      %327 = arith.cmpi eq, %324, %319 : i64
      %328 = arith.andi %326, %327 : i1
      %329 = scf.if %328 -> (i64) {
        scf.yield %193 : i64
      } else {
        scf.yield %324 : i64
      }
      %330 = func.call @cc_errorp(%276) : (i64) -> i64
      %331 = arith.cmpi ne, %330, %319 : i64
      %332 = arith.cmpi eq, %329, %319 : i64
      %333 = arith.andi %331, %332 : i1
      %334 = scf.if %333 -> (i64) {
        scf.yield %276 : i64
      } else {
        scf.yield %329 : i64
      }
      %335 = func.call @cc_errorp(%288) : (i64) -> i64
      %336 = arith.cmpi ne, %335, %319 : i64
      %337 = arith.cmpi eq, %334, %319 : i64
      %338 = arith.andi %336, %337 : i1
      %339 = scf.if %338 -> (i64) {
        scf.yield %288 : i64
      } else {
        scf.yield %334 : i64
      }
      %340 = func.call @cc_errorp(%295) : (i64) -> i64
      %341 = arith.cmpi ne, %340, %319 : i64
      %342 = arith.cmpi eq, %339, %319 : i64
      %343 = arith.andi %341, %342 : i1
      %344 = scf.if %343 -> (i64) {
        scf.yield %295 : i64
      } else {
        scf.yield %339 : i64
      }
      %345 = func.call @cc_errorp(%299) : (i64) -> i64
      %346 = arith.cmpi ne, %345, %319 : i64
      %347 = arith.cmpi eq, %344, %319 : i64
      %348 = arith.andi %346, %347 : i1
      %349 = scf.if %348 -> (i64) {
        scf.yield %299 : i64
      } else {
        scf.yield %344 : i64
      }
      %350 = func.call @cc_errorp(%306) : (i64) -> i64
      %351 = arith.cmpi ne, %350, %319 : i64
      %352 = arith.cmpi eq, %349, %319 : i64
      %353 = arith.andi %351, %352 : i1
      %354 = scf.if %353 -> (i64) {
        scf.yield %306 : i64
      } else {
        scf.yield %349 : i64
      }
      %355 = func.call @cc_errorp(%318) : (i64) -> i64
      %356 = arith.cmpi ne, %355, %319 : i64
      %357 = arith.cmpi eq, %354, %319 : i64
      %358 = arith.andi %356, %357 : i1
      %359 = scf.if %358 -> (i64) {
        scf.yield %318 : i64
      } else {
        scf.yield %354 : i64
      }
      %360 = arith.cmpi ne, %359, %319 : i64
      scf.if %360 {
        func.call @stack_push_pointer(%359) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%193) : (i64) -> ()
        func.call @stack_push_pointer(%276) : (i64) -> ()
        func.call @stack_push_pointer(%288) : (i64) -> ()
        func.call @stack_push_pointer(%295) : (i64) -> ()
        func.call @stack_push_pointer(%299) : (i64) -> ()
        func.call @stack_push_pointer(%306) : (i64) -> ()
        func.call @stack_push_pointer(%318) : (i64) -> ()
        %361 = llvm.mlir.addressof @str35 : !llvm.ptr
        %362 = func.call @cc_make_function_ref_const(%361) : (!llvm.ptr) -> i64
        %363 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%362, %363) : (i64, i64) -> ()
      }
      %364 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %364 : i64
    }
    %365 = func.call @cc_nil_value() : () -> i64
    %366 = func.call @cc_errorp(%55) : (i64) -> i64
    %367 = arith.cmpi ne, %366, %365 : i64
    %368 = scf.if %367 -> (i64) {
      scf.yield %55 : i64
    } else {
      %369 = llvm.mlir.addressof @str36 : !llvm.ptr
      %370 = arith.constant 24 : i64
      %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
      %372 = func.call @cc_nil_value() : () -> i64
      %373 = func.call @cc_intern(%371, %372) : (i64, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_values_pack(%375) : (i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %377 = arith.addi %373, %__rlasp_stack_elide_zero_15 : i64
      %378 = llvm.mlir.addressof @str37 : !llvm.ptr
      %379 = arith.constant 3 : i64
      %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_intern(%380, %381) : (i64, i64) -> i64
      %383 = func.call @cc_nil_value() : () -> i64
      %384 = func.call @cc_cons(%382, %383) : (i64, i64) -> i64
      %385 = func.call @cc_values_pack(%384) : (i64) -> i64
      func.call @stack_push_pointer(%382) : (i64) -> ()
      %386 = llvm.mlir.addressof @str38 : !llvm.ptr
      %387 = arith.constant 3 : i64
      %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_intern(%388, %389) : (i64, i64) -> i64
      %391 = func.call @cc_nil_value() : () -> i64
      %392 = func.call @cc_cons(%390, %391) : (i64, i64) -> i64
      %393 = func.call @cc_values_pack(%392) : (i64) -> i64
      func.call @stack_push_pointer(%390) : (i64) -> ()
      %394 = llvm.mlir.addressof @str39 : !llvm.ptr
      %395 = arith.constant 17 : i64
      %396 = func.call @cc_make_string(%394, %395) : (!llvm.ptr, i64) -> i64
      %397 = llvm.mlir.addressof @str40 : !llvm.ptr
      %398 = arith.constant 3 : i64
      %399 = func.call @cc_make_string(%397, %398) : (!llvm.ptr, i64) -> i64
      %400 = func.call @cc_intern(%396, %399) : (i64, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_cons(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_values_pack(%402) : (i64) -> i64
      func.call @stack_push_pointer(%400) : (i64) -> ()
      %404 = llvm.mlir.addressof @str41 : !llvm.ptr
      %405 = arith.constant 5 : i64
      %406 = func.call @cc_make_string(%404, %405) : (!llvm.ptr, i64) -> i64
      %407 = llvm.mlir.addressof @str42 : !llvm.ptr
      %408 = arith.constant 11 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      %410 = func.call @cc_intern(%406, %409) : (i64, i64) -> i64
      %411 = func.call @cc_nil_value() : () -> i64
      %412 = func.call @cc_cons(%410, %411) : (i64, i64) -> i64
      %413 = func.call @cc_values_pack(%412) : (i64) -> i64
      func.call @stack_push_pointer(%410) : (i64) -> ()
      %414 = llvm.mlir.addressof @str43 : !llvm.ptr
      %415 = arith.constant 15 : i64
      %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
      %417 = llvm.mlir.addressof @str44 : !llvm.ptr
      %418 = arith.constant 3 : i64
      %419 = func.call @cc_make_string(%417, %418) : (!llvm.ptr, i64) -> i64
      %420 = func.call @cc_intern(%416, %419) : (i64, i64) -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_cons(%420, %421) : (i64, i64) -> i64
      %423 = func.call @cc_values_pack(%422) : (i64) -> i64
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %424 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%424) : (i64) -> ()
      %425 = llvm.mlir.addressof @str45 : !llvm.ptr
      %426 = arith.constant 10 : i64
      %427 = func.call @cc_make_string(%425, %426) : (!llvm.ptr, i64) -> i64
      %428 = llvm.mlir.addressof @str46 : !llvm.ptr
      %429 = arith.constant 11 : i64
      %430 = func.call @cc_make_string(%428, %429) : (!llvm.ptr, i64) -> i64
      %431 = func.call @cc_intern(%427, %430) : (i64, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_cons(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_values_pack(%433) : (i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %435 = arith.addi %431, %__rlasp_stack_elide_zero_16 : i64
      %436 = func.call @stack_pop_pointer() : () -> i64
      %437 = func.call @cc_cons(%435, %436) : (i64, i64) -> i64
      %438 = llvm.mlir.addressof @str47 : !llvm.ptr
      %439 = arith.constant 5 : i64
      %440 = func.call @cc_make_string(%438, %439) : (!llvm.ptr, i64) -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_intern(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_nil_value() : () -> i64
      %444 = func.call @cc_cons(%442, %443) : (i64, i64) -> i64
      %445 = func.call @cc_values_pack(%444) : (i64) -> i64
      %446 = func.call @cc_cons(%442, %437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%446) : (i64) -> ()
      %447 = llvm.mlir.addressof @str48 : !llvm.ptr
      %448 = arith.constant 8 : i64
      %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
      %450 = llvm.mlir.addressof @str49 : !llvm.ptr
      %451 = arith.constant 7 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      %453 = func.call @cc_intern(%449, %452) : (i64, i64) -> i64
      %454 = func.call @cc_nil_value() : () -> i64
      %455 = func.call @cc_cons(%453, %454) : (i64, i64) -> i64
      %456 = func.call @cc_values_pack(%455) : (i64) -> i64
      func.call @stack_push_pointer(%453) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %457 = func.call @stack_pop_pointer() : () -> i64
      %458 = func.call @stack_pop_pointer() : () -> i64
      %459 = func.call @cc_cons(%458, %457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %460 = arith.addi %459, %__rlasp_stack_elide_zero_17 : i64
      %461 = func.call @stack_pop_pointer() : () -> i64
      %462 = func.call @cc_cons(%461, %460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %463 = arith.addi %462, %__rlasp_stack_elide_zero_18 : i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%464, %463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%467, %466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %469 = arith.addi %468, %__rlasp_stack_elide_zero_19 : i64
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%470, %469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %475 = arith.addi %474, %__rlasp_stack_elide_zero_20 : i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %481 = arith.addi %480, %__rlasp_stack_elide_zero_21 : i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %487 = arith.addi %486, %__rlasp_stack_elide_zero_22 : i64
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @cc_cons(%488, %487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %490 = arith.addi %489, %__rlasp_stack_elide_zero_23 : i64
      %554 = arith.constant 261322017079298 : i64
      %555 = arith.constant 0 : i64
      %556 = func.call @cc_make_closure(%554, %555) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %557 = arith.addi %556, %__rlasp_stack_elide_zero_24 : i64
      %558 = llvm.mlir.addressof @str56 : !llvm.ptr
      %559 = arith.constant 1 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      %561 = func.call @cc_nil_value() : () -> i64
      %562 = func.call @cc_intern(%560, %561) : (i64, i64) -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
      %565 = func.call @cc_values_pack(%564) : (i64) -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @cc_cons(%567, %566) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %569 = arith.addi %568, %__rlasp_stack_elide_zero_25 : i64
      %570 = llvm.mlir.addressof @str57 : !llvm.ptr
      %571 = arith.constant 11 : i64
      %572 = func.call @cc_make_string(%570, %571) : (!llvm.ptr, i64) -> i64
      %573 = llvm.mlir.addressof @str58 : !llvm.ptr
      %574 = arith.constant 7 : i64
      %575 = func.call @cc_make_string(%573, %574) : (!llvm.ptr, i64) -> i64
      %576 = func.call @cc_intern(%572, %575) : (i64, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_cons(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_values_pack(%578) : (i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = llvm.mlir.addressof @str59 : !llvm.ptr
      %582 = arith.constant 4 : i64
      %583 = func.call @cc_make_string(%581, %582) : (!llvm.ptr, i64) -> i64
      %584 = llvm.mlir.addressof @str60 : !llvm.ptr
      %585 = arith.constant 7 : i64
      %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
      %587 = func.call @cc_intern(%583, %586) : (i64, i64) -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
      %590 = func.call @cc_values_pack(%589) : (i64) -> i64
      %591 = llvm.mlir.addressof @str61 : !llvm.ptr
      %592 = arith.constant 6 : i64
      %593 = func.call @cc_make_string(%591, %592) : (!llvm.ptr, i64) -> i64
      %594 = func.call @cc_nil_value() : () -> i64
      %595 = func.call @cc_intern(%593, %594) : (i64, i64) -> i64
      %596 = func.call @cc_nil_value() : () -> i64
      %597 = func.call @cc_cons(%595, %596) : (i64, i64) -> i64
      %598 = func.call @cc_values_pack(%597) : (i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %599 = arith.addi %595, %__rlasp_stack_elide_zero_26 : i64
      %600 = func.call @cc_nil_value() : () -> i64
      %601 = func.call @cc_errorp(%377) : (i64) -> i64
      %602 = arith.cmpi ne, %601, %600 : i64
      %603 = arith.cmpi eq, %600, %600 : i64
      %604 = arith.andi %602, %603 : i1
      %605 = scf.if %604 -> (i64) {
        scf.yield %377 : i64
      } else {
        scf.yield %600 : i64
      }
      %606 = func.call @cc_errorp(%490) : (i64) -> i64
      %607 = arith.cmpi ne, %606, %600 : i64
      %608 = arith.cmpi eq, %605, %600 : i64
      %609 = arith.andi %607, %608 : i1
      %610 = scf.if %609 -> (i64) {
        scf.yield %490 : i64
      } else {
        scf.yield %605 : i64
      }
      %611 = func.call @cc_errorp(%557) : (i64) -> i64
      %612 = arith.cmpi ne, %611, %600 : i64
      %613 = arith.cmpi eq, %610, %600 : i64
      %614 = arith.andi %612, %613 : i1
      %615 = scf.if %614 -> (i64) {
        scf.yield %557 : i64
      } else {
        scf.yield %610 : i64
      }
      %616 = func.call @cc_errorp(%569) : (i64) -> i64
      %617 = arith.cmpi ne, %616, %600 : i64
      %618 = arith.cmpi eq, %615, %600 : i64
      %619 = arith.andi %617, %618 : i1
      %620 = scf.if %619 -> (i64) {
        scf.yield %569 : i64
      } else {
        scf.yield %615 : i64
      }
      %621 = func.call @cc_errorp(%576) : (i64) -> i64
      %622 = arith.cmpi ne, %621, %600 : i64
      %623 = arith.cmpi eq, %620, %600 : i64
      %624 = arith.andi %622, %623 : i1
      %625 = scf.if %624 -> (i64) {
        scf.yield %576 : i64
      } else {
        scf.yield %620 : i64
      }
      %626 = func.call @cc_errorp(%580) : (i64) -> i64
      %627 = arith.cmpi ne, %626, %600 : i64
      %628 = arith.cmpi eq, %625, %600 : i64
      %629 = arith.andi %627, %628 : i1
      %630 = scf.if %629 -> (i64) {
        scf.yield %580 : i64
      } else {
        scf.yield %625 : i64
      }
      %631 = func.call @cc_errorp(%587) : (i64) -> i64
      %632 = arith.cmpi ne, %631, %600 : i64
      %633 = arith.cmpi eq, %630, %600 : i64
      %634 = arith.andi %632, %633 : i1
      %635 = scf.if %634 -> (i64) {
        scf.yield %587 : i64
      } else {
        scf.yield %630 : i64
      }
      %636 = func.call @cc_errorp(%599) : (i64) -> i64
      %637 = arith.cmpi ne, %636, %600 : i64
      %638 = arith.cmpi eq, %635, %600 : i64
      %639 = arith.andi %637, %638 : i1
      %640 = scf.if %639 -> (i64) {
        scf.yield %599 : i64
      } else {
        scf.yield %635 : i64
      }
      %641 = arith.cmpi ne, %640, %600 : i64
      scf.if %641 {
        func.call @stack_push_pointer(%640) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%377) : (i64) -> ()
        func.call @stack_push_pointer(%490) : (i64) -> ()
        func.call @stack_push_pointer(%557) : (i64) -> ()
        func.call @stack_push_pointer(%569) : (i64) -> ()
        func.call @stack_push_pointer(%576) : (i64) -> ()
        func.call @stack_push_pointer(%580) : (i64) -> ()
        func.call @stack_push_pointer(%587) : (i64) -> ()
        func.call @stack_push_pointer(%599) : (i64) -> ()
        %642 = llvm.mlir.addressof @str62 : !llvm.ptr
        %643 = func.call @cc_make_function_ref_const(%642) : (!llvm.ptr) -> i64
        %644 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%643, %644) : (i64, i64) -> ()
      }
      %645 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %645 : i64
    }
    %646 = func.call @cc_nil_value() : () -> i64
    %647 = func.call @cc_errorp(%368) : (i64) -> i64
    %648 = arith.cmpi ne, %647, %646 : i64
    %649 = scf.if %648 -> (i64) {
      scf.yield %368 : i64
    } else {
      %650 = llvm.mlir.addressof @str63 : !llvm.ptr
      %651 = arith.constant 28 : i64
      %652 = func.call @cc_make_string(%650, %651) : (!llvm.ptr, i64) -> i64
      %653 = func.call @cc_nil_value() : () -> i64
      %654 = func.call @cc_intern(%652, %653) : (i64, i64) -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
      %657 = func.call @cc_values_pack(%656) : (i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %658 = arith.addi %654, %__rlasp_stack_elide_zero_27 : i64
      %659 = llvm.mlir.addressof @str64 : !llvm.ptr
      %660 = arith.constant 3 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_intern(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_nil_value() : () -> i64
      %665 = func.call @cc_cons(%663, %664) : (i64, i64) -> i64
      %666 = func.call @cc_values_pack(%665) : (i64) -> i64
      func.call @stack_push_pointer(%663) : (i64) -> ()
      %667 = llvm.mlir.addressof @str65 : !llvm.ptr
      %668 = arith.constant 3 : i64
      %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
      %670 = func.call @cc_nil_value() : () -> i64
      %671 = func.call @cc_intern(%669, %670) : (i64, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %675 = llvm.mlir.addressof @str66 : !llvm.ptr
      %676 = arith.constant 17 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = llvm.mlir.addressof @str67 : !llvm.ptr
      %679 = arith.constant 3 : i64
      %680 = func.call @cc_make_string(%678, %679) : (!llvm.ptr, i64) -> i64
      %681 = func.call @cc_intern(%677, %680) : (i64, i64) -> i64
      %682 = func.call @cc_nil_value() : () -> i64
      %683 = func.call @cc_cons(%681, %682) : (i64, i64) -> i64
      %684 = func.call @cc_values_pack(%683) : (i64) -> i64
      func.call @stack_push_pointer(%681) : (i64) -> ()
      %685 = llvm.mlir.addressof @str68 : !llvm.ptr
      %686 = arith.constant 5 : i64
      %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
      %688 = llvm.mlir.addressof @str69 : !llvm.ptr
      %689 = arith.constant 11 : i64
      %690 = func.call @cc_make_string(%688, %689) : (!llvm.ptr, i64) -> i64
      %691 = func.call @cc_intern(%687, %690) : (i64, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_cons(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_values_pack(%693) : (i64) -> i64
      func.call @stack_push_pointer(%691) : (i64) -> ()
      %695 = llvm.mlir.addressof @str70 : !llvm.ptr
      %696 = arith.constant 15 : i64
      %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
      %698 = llvm.mlir.addressof @str71 : !llvm.ptr
      %699 = arith.constant 3 : i64
      %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
      %701 = func.call @cc_intern(%697, %700) : (i64, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_cons(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_values_pack(%703) : (i64) -> i64
      func.call @stack_push_pointer(%701) : (i64) -> ()
      %705 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%705) : (i64) -> ()
      %706 = llvm.mlir.addressof @str72 : !llvm.ptr
      %707 = arith.constant 6 : i64
      %708 = func.call @cc_make_string(%706, %707) : (!llvm.ptr, i64) -> i64
      %709 = llvm.mlir.addressof @str73 : !llvm.ptr
      %710 = arith.constant 11 : i64
      %711 = func.call @cc_make_string(%709, %710) : (!llvm.ptr, i64) -> i64
      %712 = func.call @cc_intern(%708, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %716 = arith.addi %712, %__rlasp_stack_elide_zero_28 : i64
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @cc_cons(%716, %717) : (i64, i64) -> i64
      %719 = llvm.mlir.addressof @str74 : !llvm.ptr
      %720 = arith.constant 5 : i64
      %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_intern(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_nil_value() : () -> i64
      %725 = func.call @cc_cons(%723, %724) : (i64, i64) -> i64
      %726 = func.call @cc_values_pack(%725) : (i64) -> i64
      %727 = func.call @cc_cons(%723, %718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%727) : (i64) -> ()
      %728 = llvm.mlir.addressof @str75 : !llvm.ptr
      %729 = arith.constant 5 : i64
      %730 = func.call @cc_make_string(%728, %729) : (!llvm.ptr, i64) -> i64
      %731 = llvm.mlir.addressof @str76 : !llvm.ptr
      %732 = arith.constant 7 : i64
      %733 = func.call @cc_make_string(%731, %732) : (!llvm.ptr, i64) -> i64
      %734 = func.call @cc_intern(%730, %733) : (i64, i64) -> i64
      %735 = func.call @cc_nil_value() : () -> i64
      %736 = func.call @cc_cons(%734, %735) : (i64, i64) -> i64
      %737 = func.call @cc_values_pack(%736) : (i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @cc_cons(%739, %738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %741 = arith.addi %740, %__rlasp_stack_elide_zero_29 : i64
      %742 = func.call @stack_pop_pointer() : () -> i64
      %743 = func.call @cc_cons(%742, %741) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %744 = arith.addi %743, %__rlasp_stack_elide_zero_30 : i64
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @cc_cons(%745, %744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%746) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%748, %747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %750 = arith.addi %749, %__rlasp_stack_elide_zero_31 : i64
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_cons(%751, %750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%754, %753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %756 = arith.addi %755, %__rlasp_stack_elide_zero_32 : i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%757, %756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @cc_cons(%760, %759) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %762 = arith.addi %761, %__rlasp_stack_elide_zero_33 : i64
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @cc_cons(%763, %762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %765 = func.call @stack_pop_pointer() : () -> i64
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @cc_cons(%766, %765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %768 = arith.addi %767, %__rlasp_stack_elide_zero_34 : i64
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @cc_cons(%769, %768) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %771 = arith.addi %770, %__rlasp_stack_elide_zero_35 : i64
      %835 = arith.constant 261322017079299 : i64
      %836 = arith.constant 0 : i64
      %837 = func.call @cc_make_closure(%835, %836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %838 = arith.addi %837, %__rlasp_stack_elide_zero_36 : i64
      %839 = llvm.mlir.addressof @str83 : !llvm.ptr
      %840 = arith.constant 1 : i64
      %841 = func.call @cc_make_string(%839, %840) : (!llvm.ptr, i64) -> i64
      %842 = func.call @cc_nil_value() : () -> i64
      %843 = func.call @cc_intern(%841, %842) : (i64, i64) -> i64
      %844 = func.call @cc_nil_value() : () -> i64
      %845 = func.call @cc_cons(%843, %844) : (i64, i64) -> i64
      %846 = func.call @cc_values_pack(%845) : (i64) -> i64
      func.call @stack_push_pointer(%843) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = func.call @cc_cons(%848, %847) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %850 = arith.addi %849, %__rlasp_stack_elide_zero_37 : i64
      %851 = llvm.mlir.addressof @str84 : !llvm.ptr
      %852 = arith.constant 11 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = llvm.mlir.addressof @str85 : !llvm.ptr
      %855 = arith.constant 7 : i64
      %856 = func.call @cc_make_string(%854, %855) : (!llvm.ptr, i64) -> i64
      %857 = func.call @cc_intern(%853, %856) : (i64, i64) -> i64
      %858 = func.call @cc_nil_value() : () -> i64
      %859 = func.call @cc_cons(%857, %858) : (i64, i64) -> i64
      %860 = func.call @cc_values_pack(%859) : (i64) -> i64
      %861 = func.call @cc_nil_value() : () -> i64
      %862 = llvm.mlir.addressof @str86 : !llvm.ptr
      %863 = arith.constant 4 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = llvm.mlir.addressof @str87 : !llvm.ptr
      %866 = arith.constant 7 : i64
      %867 = func.call @cc_make_string(%865, %866) : (!llvm.ptr, i64) -> i64
      %868 = func.call @cc_intern(%864, %867) : (i64, i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_cons(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_values_pack(%870) : (i64) -> i64
      %872 = llvm.mlir.addressof @str88 : !llvm.ptr
      %873 = arith.constant 6 : i64
      %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
      %875 = func.call @cc_nil_value() : () -> i64
      %876 = func.call @cc_intern(%874, %875) : (i64, i64) -> i64
      %877 = func.call @cc_nil_value() : () -> i64
      %878 = func.call @cc_cons(%876, %877) : (i64, i64) -> i64
      %879 = func.call @cc_values_pack(%878) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %880 = arith.addi %876, %__rlasp_stack_elide_zero_38 : i64
      %881 = func.call @cc_nil_value() : () -> i64
      %882 = func.call @cc_errorp(%658) : (i64) -> i64
      %883 = arith.cmpi ne, %882, %881 : i64
      %884 = arith.cmpi eq, %881, %881 : i64
      %885 = arith.andi %883, %884 : i1
      %886 = scf.if %885 -> (i64) {
        scf.yield %658 : i64
      } else {
        scf.yield %881 : i64
      }
      %887 = func.call @cc_errorp(%771) : (i64) -> i64
      %888 = arith.cmpi ne, %887, %881 : i64
      %889 = arith.cmpi eq, %886, %881 : i64
      %890 = arith.andi %888, %889 : i1
      %891 = scf.if %890 -> (i64) {
        scf.yield %771 : i64
      } else {
        scf.yield %886 : i64
      }
      %892 = func.call @cc_errorp(%838) : (i64) -> i64
      %893 = arith.cmpi ne, %892, %881 : i64
      %894 = arith.cmpi eq, %891, %881 : i64
      %895 = arith.andi %893, %894 : i1
      %896 = scf.if %895 -> (i64) {
        scf.yield %838 : i64
      } else {
        scf.yield %891 : i64
      }
      %897 = func.call @cc_errorp(%850) : (i64) -> i64
      %898 = arith.cmpi ne, %897, %881 : i64
      %899 = arith.cmpi eq, %896, %881 : i64
      %900 = arith.andi %898, %899 : i1
      %901 = scf.if %900 -> (i64) {
        scf.yield %850 : i64
      } else {
        scf.yield %896 : i64
      }
      %902 = func.call @cc_errorp(%857) : (i64) -> i64
      %903 = arith.cmpi ne, %902, %881 : i64
      %904 = arith.cmpi eq, %901, %881 : i64
      %905 = arith.andi %903, %904 : i1
      %906 = scf.if %905 -> (i64) {
        scf.yield %857 : i64
      } else {
        scf.yield %901 : i64
      }
      %907 = func.call @cc_errorp(%861) : (i64) -> i64
      %908 = arith.cmpi ne, %907, %881 : i64
      %909 = arith.cmpi eq, %906, %881 : i64
      %910 = arith.andi %908, %909 : i1
      %911 = scf.if %910 -> (i64) {
        scf.yield %861 : i64
      } else {
        scf.yield %906 : i64
      }
      %912 = func.call @cc_errorp(%868) : (i64) -> i64
      %913 = arith.cmpi ne, %912, %881 : i64
      %914 = arith.cmpi eq, %911, %881 : i64
      %915 = arith.andi %913, %914 : i1
      %916 = scf.if %915 -> (i64) {
        scf.yield %868 : i64
      } else {
        scf.yield %911 : i64
      }
      %917 = func.call @cc_errorp(%880) : (i64) -> i64
      %918 = arith.cmpi ne, %917, %881 : i64
      %919 = arith.cmpi eq, %916, %881 : i64
      %920 = arith.andi %918, %919 : i1
      %921 = scf.if %920 -> (i64) {
        scf.yield %880 : i64
      } else {
        scf.yield %916 : i64
      }
      %922 = arith.cmpi ne, %921, %881 : i64
      scf.if %922 {
        func.call @stack_push_pointer(%921) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%658) : (i64) -> ()
        func.call @stack_push_pointer(%771) : (i64) -> ()
        func.call @stack_push_pointer(%838) : (i64) -> ()
        func.call @stack_push_pointer(%850) : (i64) -> ()
        func.call @stack_push_pointer(%857) : (i64) -> ()
        func.call @stack_push_pointer(%861) : (i64) -> ()
        func.call @stack_push_pointer(%868) : (i64) -> ()
        func.call @stack_push_pointer(%880) : (i64) -> ()
        %923 = llvm.mlir.addressof @str89 : !llvm.ptr
        %924 = func.call @cc_make_function_ref_const(%923) : (!llvm.ptr) -> i64
        %925 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%924, %925) : (i64, i64) -> ()
      }
      %926 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %926 : i64
    }
    %927 = func.call @cc_nil_value() : () -> i64
    %928 = func.call @cc_errorp(%649) : (i64) -> i64
    %929 = arith.cmpi ne, %928, %927 : i64
    %930 = scf.if %929 -> (i64) {
      scf.yield %649 : i64
    } else {
      %931 = llvm.mlir.addressof @str90 : !llvm.ptr
      %932 = arith.constant 28 : i64
      %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
      %934 = func.call @cc_nil_value() : () -> i64
      %935 = func.call @cc_intern(%933, %934) : (i64, i64) -> i64
      %936 = func.call @cc_nil_value() : () -> i64
      %937 = func.call @cc_cons(%935, %936) : (i64, i64) -> i64
      %938 = func.call @cc_values_pack(%937) : (i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %939 = arith.addi %935, %__rlasp_stack_elide_zero_39 : i64
      %940 = llvm.mlir.addressof @str91 : !llvm.ptr
      %941 = arith.constant 3 : i64
      %942 = func.call @cc_make_string(%940, %941) : (!llvm.ptr, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_intern(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_cons(%944, %945) : (i64, i64) -> i64
      %947 = func.call @cc_values_pack(%946) : (i64) -> i64
      func.call @stack_push_pointer(%944) : (i64) -> ()
      %948 = llvm.mlir.addressof @str92 : !llvm.ptr
      %949 = arith.constant 3 : i64
      %950 = func.call @cc_make_string(%948, %949) : (!llvm.ptr, i64) -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_intern(%950, %951) : (i64, i64) -> i64
      %953 = func.call @cc_nil_value() : () -> i64
      %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
      %955 = func.call @cc_values_pack(%954) : (i64) -> i64
      func.call @stack_push_pointer(%952) : (i64) -> ()
      %956 = llvm.mlir.addressof @str93 : !llvm.ptr
      %957 = arith.constant 17 : i64
      %958 = func.call @cc_make_string(%956, %957) : (!llvm.ptr, i64) -> i64
      %959 = llvm.mlir.addressof @str94 : !llvm.ptr
      %960 = arith.constant 3 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = func.call @cc_intern(%958, %961) : (i64, i64) -> i64
      %963 = func.call @cc_nil_value() : () -> i64
      %964 = func.call @cc_cons(%962, %963) : (i64, i64) -> i64
      %965 = func.call @cc_values_pack(%964) : (i64) -> i64
      func.call @stack_push_pointer(%962) : (i64) -> ()
      %966 = llvm.mlir.addressof @str95 : !llvm.ptr
      %967 = arith.constant 5 : i64
      %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
      %969 = llvm.mlir.addressof @str96 : !llvm.ptr
      %970 = arith.constant 11 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = func.call @cc_intern(%968, %971) : (i64, i64) -> i64
      %973 = func.call @cc_nil_value() : () -> i64
      %974 = func.call @cc_cons(%972, %973) : (i64, i64) -> i64
      %975 = func.call @cc_values_pack(%974) : (i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %976 = llvm.mlir.addressof @str97 : !llvm.ptr
      %977 = arith.constant 15 : i64
      %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
      %979 = llvm.mlir.addressof @str98 : !llvm.ptr
      %980 = arith.constant 3 : i64
      %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
      %982 = func.call @cc_intern(%978, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %986 = llvm.mlir.addressof @str99 : !llvm.ptr
      %987 = arith.constant 10 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = llvm.mlir.addressof @str100 : !llvm.ptr
      %990 = arith.constant 11 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_intern(%988, %991) : (i64, i64) -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_values_pack(%994) : (i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %996 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      %997 = llvm.mlir.addressof @str101 : !llvm.ptr
      %998 = arith.constant 6 : i64
      %999 = func.call @cc_make_string(%997, %998) : (!llvm.ptr, i64) -> i64
      %1000 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1001 = arith.constant 11 : i64
      %1002 = func.call @cc_make_string(%1000, %1001) : (!llvm.ptr, i64) -> i64
      %1003 = func.call @cc_intern(%999, %1002) : (i64, i64) -> i64
      %1004 = func.call @cc_nil_value() : () -> i64
      %1005 = func.call @cc_cons(%1003, %1004) : (i64, i64) -> i64
      %1006 = func.call @cc_values_pack(%1005) : (i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %1007 = arith.addi %1003, %__rlasp_stack_elide_zero_40 : i64
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_cons(%1007, %1008) : (i64, i64) -> i64
      %1010 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1011 = arith.constant 5 : i64
      %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
      %1013 = func.call @cc_nil_value() : () -> i64
      %1014 = func.call @cc_intern(%1012, %1013) : (i64, i64) -> i64
      %1015 = func.call @cc_nil_value() : () -> i64
      %1016 = func.call @cc_cons(%1014, %1015) : (i64, i64) -> i64
      %1017 = func.call @cc_values_pack(%1016) : (i64) -> i64
      %1018 = func.call @cc_cons(%1014, %1009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1019 = func.call @stack_pop_pointer() : () -> i64
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @cc_cons(%1020, %1019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %1022 = arith.addi %1021, %__rlasp_stack_elide_zero_41 : i64
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = func.call @cc_cons(%1023, %1022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1025 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @cc_cons(%1027, %1026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %1029 = arith.addi %1028, %__rlasp_stack_elide_zero_42 : i64
      %1030 = func.call @stack_pop_pointer() : () -> i64
      %1031 = func.call @cc_cons(%1030, %1029) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %1032 = arith.addi %1031, %__rlasp_stack_elide_zero_43 : i64
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = func.call @cc_cons(%1033, %1032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @cc_cons(%1036, %1035) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %1038 = arith.addi %1037, %__rlasp_stack_elide_zero_44 : i64
      %1039 = func.call @stack_pop_pointer() : () -> i64
      %1040 = func.call @cc_cons(%1039, %1038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1040) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = func.call @cc_cons(%1042, %1041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1044 = arith.addi %1043, %__rlasp_stack_elide_zero_45 : i64
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @cc_cons(%1045, %1044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @cc_cons(%1048, %1047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1050 = arith.addi %1049, %__rlasp_stack_elide_zero_46 : i64
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_cons(%1051, %1050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1052) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @stack_pop_pointer() : () -> i64
      %1055 = func.call @cc_cons(%1054, %1053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1056 = arith.addi %1055, %__rlasp_stack_elide_zero_47 : i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1057, %1056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1059 = arith.addi %1058, %__rlasp_stack_elide_zero_48 : i64
      %1125 = arith.constant 261322017079300 : i64
      %1126 = arith.constant 0 : i64
      %1127 = func.call @cc_make_closure(%1125, %1126) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1128 = arith.addi %1127, %__rlasp_stack_elide_zero_49 : i64
      %1129 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1130 = arith.constant 1 : i64
      %1131 = func.call @cc_make_string(%1129, %1130) : (!llvm.ptr, i64) -> i64
      %1132 = func.call @cc_nil_value() : () -> i64
      %1133 = func.call @cc_intern(%1131, %1132) : (i64, i64) -> i64
      %1134 = func.call @cc_nil_value() : () -> i64
      %1135 = func.call @cc_cons(%1133, %1134) : (i64, i64) -> i64
      %1136 = func.call @cc_values_pack(%1135) : (i64) -> i64
      func.call @stack_push_pointer(%1133) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @cc_cons(%1138, %1137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1140 = arith.addi %1139, %__rlasp_stack_elide_zero_50 : i64
      %1141 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1142 = arith.constant 11 : i64
      %1143 = func.call @cc_make_string(%1141, %1142) : (!llvm.ptr, i64) -> i64
      %1144 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1145 = arith.constant 7 : i64
      %1146 = func.call @cc_make_string(%1144, %1145) : (!llvm.ptr, i64) -> i64
      %1147 = func.call @cc_intern(%1143, %1146) : (i64, i64) -> i64
      %1148 = func.call @cc_nil_value() : () -> i64
      %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_values_pack(%1149) : (i64) -> i64
      %1151 = func.call @cc_nil_value() : () -> i64
      %1152 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1153 = arith.constant 4 : i64
      %1154 = func.call @cc_make_string(%1152, %1153) : (!llvm.ptr, i64) -> i64
      %1155 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1156 = arith.constant 7 : i64
      %1157 = func.call @cc_make_string(%1155, %1156) : (!llvm.ptr, i64) -> i64
      %1158 = func.call @cc_intern(%1154, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = func.call @cc_cons(%1158, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_values_pack(%1160) : (i64) -> i64
      %1162 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1163 = arith.constant 6 : i64
      %1164 = func.call @cc_make_string(%1162, %1163) : (!llvm.ptr, i64) -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_intern(%1164, %1165) : (i64, i64) -> i64
      %1167 = func.call @cc_nil_value() : () -> i64
      %1168 = func.call @cc_cons(%1166, %1167) : (i64, i64) -> i64
      %1169 = func.call @cc_values_pack(%1168) : (i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1170 = arith.addi %1166, %__rlasp_stack_elide_zero_51 : i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_errorp(%939) : (i64) -> i64
      %1173 = arith.cmpi ne, %1172, %1171 : i64
      %1174 = arith.cmpi eq, %1171, %1171 : i64
      %1175 = arith.andi %1173, %1174 : i1
      %1176 = scf.if %1175 -> (i64) {
        scf.yield %939 : i64
      } else {
        scf.yield %1171 : i64
      }
      %1177 = func.call @cc_errorp(%1059) : (i64) -> i64
      %1178 = arith.cmpi ne, %1177, %1171 : i64
      %1179 = arith.cmpi eq, %1176, %1171 : i64
      %1180 = arith.andi %1178, %1179 : i1
      %1181 = scf.if %1180 -> (i64) {
        scf.yield %1059 : i64
      } else {
        scf.yield %1176 : i64
      }
      %1182 = func.call @cc_errorp(%1128) : (i64) -> i64
      %1183 = arith.cmpi ne, %1182, %1171 : i64
      %1184 = arith.cmpi eq, %1181, %1171 : i64
      %1185 = arith.andi %1183, %1184 : i1
      %1186 = scf.if %1185 -> (i64) {
        scf.yield %1128 : i64
      } else {
        scf.yield %1181 : i64
      }
      %1187 = func.call @cc_errorp(%1140) : (i64) -> i64
      %1188 = arith.cmpi ne, %1187, %1171 : i64
      %1189 = arith.cmpi eq, %1186, %1171 : i64
      %1190 = arith.andi %1188, %1189 : i1
      %1191 = scf.if %1190 -> (i64) {
        scf.yield %1140 : i64
      } else {
        scf.yield %1186 : i64
      }
      %1192 = func.call @cc_errorp(%1147) : (i64) -> i64
      %1193 = arith.cmpi ne, %1192, %1171 : i64
      %1194 = arith.cmpi eq, %1191, %1171 : i64
      %1195 = arith.andi %1193, %1194 : i1
      %1196 = scf.if %1195 -> (i64) {
        scf.yield %1147 : i64
      } else {
        scf.yield %1191 : i64
      }
      %1197 = func.call @cc_errorp(%1151) : (i64) -> i64
      %1198 = arith.cmpi ne, %1197, %1171 : i64
      %1199 = arith.cmpi eq, %1196, %1171 : i64
      %1200 = arith.andi %1198, %1199 : i1
      %1201 = scf.if %1200 -> (i64) {
        scf.yield %1151 : i64
      } else {
        scf.yield %1196 : i64
      }
      %1202 = func.call @cc_errorp(%1158) : (i64) -> i64
      %1203 = arith.cmpi ne, %1202, %1171 : i64
      %1204 = arith.cmpi eq, %1201, %1171 : i64
      %1205 = arith.andi %1203, %1204 : i1
      %1206 = scf.if %1205 -> (i64) {
        scf.yield %1158 : i64
      } else {
        scf.yield %1201 : i64
      }
      %1207 = func.call @cc_errorp(%1170) : (i64) -> i64
      %1208 = arith.cmpi ne, %1207, %1171 : i64
      %1209 = arith.cmpi eq, %1206, %1171 : i64
      %1210 = arith.andi %1208, %1209 : i1
      %1211 = scf.if %1210 -> (i64) {
        scf.yield %1170 : i64
      } else {
        scf.yield %1206 : i64
      }
      %1212 = arith.cmpi ne, %1211, %1171 : i64
      scf.if %1212 {
        func.call @stack_push_pointer(%1211) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%939) : (i64) -> ()
        func.call @stack_push_pointer(%1059) : (i64) -> ()
        func.call @stack_push_pointer(%1128) : (i64) -> ()
        func.call @stack_push_pointer(%1140) : (i64) -> ()
        func.call @stack_push_pointer(%1147) : (i64) -> ()
        func.call @stack_push_pointer(%1151) : (i64) -> ()
        func.call @stack_push_pointer(%1158) : (i64) -> ()
        func.call @stack_push_pointer(%1170) : (i64) -> ()
        %1213 = llvm.mlir.addressof @str115 : !llvm.ptr
        %1214 = func.call @cc_make_function_ref_const(%1213) : (!llvm.ptr) -> i64
        %1215 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1214, %1215) : (i64, i64) -> ()
      }
      %1216 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1216 : i64
    }
    %1217 = func.call @cc_nil_value() : () -> i64
    %1218 = func.call @cc_errorp(%930) : (i64) -> i64
    %1219 = arith.cmpi ne, %1218, %1217 : i64
    %1220 = scf.if %1219 -> (i64) {
      scf.yield %930 : i64
    } else {
      %1221 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1222 = arith.constant 21 : i64
      %1223 = func.call @cc_make_string(%1221, %1222) : (!llvm.ptr, i64) -> i64
      %1224 = func.call @cc_nil_value() : () -> i64
      %1225 = func.call @cc_intern(%1223, %1224) : (i64, i64) -> i64
      %1226 = func.call @cc_nil_value() : () -> i64
      %1227 = func.call @cc_cons(%1225, %1226) : (i64, i64) -> i64
      %1228 = func.call @cc_values_pack(%1227) : (i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1229 = arith.addi %1225, %__rlasp_stack_elide_zero_52 : i64
      %1230 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1231 = arith.constant 3 : i64
      %1232 = func.call @cc_make_string(%1230, %1231) : (!llvm.ptr, i64) -> i64
      %1233 = func.call @cc_nil_value() : () -> i64
      %1234 = func.call @cc_intern(%1232, %1233) : (i64, i64) -> i64
      %1235 = func.call @cc_nil_value() : () -> i64
      %1236 = func.call @cc_cons(%1234, %1235) : (i64, i64) -> i64
      %1237 = func.call @cc_values_pack(%1236) : (i64) -> i64
      func.call @stack_push_pointer(%1234) : (i64) -> ()
      %1238 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1239 = arith.constant 3 : i64
      %1240 = func.call @cc_make_string(%1238, %1239) : (!llvm.ptr, i64) -> i64
      %1241 = func.call @cc_nil_value() : () -> i64
      %1242 = func.call @cc_intern(%1240, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_cons(%1242, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_values_pack(%1244) : (i64) -> i64
      func.call @stack_push_pointer(%1242) : (i64) -> ()
      %1246 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1247 = arith.constant 17 : i64
      %1248 = func.call @cc_make_string(%1246, %1247) : (!llvm.ptr, i64) -> i64
      %1249 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1250 = arith.constant 3 : i64
      %1251 = func.call @cc_make_string(%1249, %1250) : (!llvm.ptr, i64) -> i64
      %1252 = func.call @cc_intern(%1248, %1251) : (i64, i64) -> i64
      %1253 = func.call @cc_nil_value() : () -> i64
      %1254 = func.call @cc_cons(%1252, %1253) : (i64, i64) -> i64
      %1255 = func.call @cc_values_pack(%1254) : (i64) -> i64
      func.call @stack_push_pointer(%1252) : (i64) -> ()
      %1256 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1257 = arith.constant 5 : i64
      %1258 = func.call @cc_make_string(%1256, %1257) : (!llvm.ptr, i64) -> i64
      %1259 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1260 = arith.constant 11 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = func.call @cc_intern(%1258, %1261) : (i64, i64) -> i64
      %1263 = func.call @cc_nil_value() : () -> i64
      %1264 = func.call @cc_cons(%1262, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_values_pack(%1264) : (i64) -> i64
      func.call @stack_push_pointer(%1262) : (i64) -> ()
      %1266 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1267 = arith.constant 15 : i64
      %1268 = func.call @cc_make_string(%1266, %1267) : (!llvm.ptr, i64) -> i64
      %1269 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1270 = arith.constant 3 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = func.call @cc_intern(%1268, %1271) : (i64, i64) -> i64
      %1273 = func.call @cc_nil_value() : () -> i64
      %1274 = func.call @cc_cons(%1272, %1273) : (i64, i64) -> i64
      %1275 = func.call @cc_values_pack(%1274) : (i64) -> i64
      func.call @stack_push_pointer(%1272) : (i64) -> ()
      %1276 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1276) : (i64) -> ()
      %1277 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1278 = arith.constant 5 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1281 = arith.constant 11 : i64
      %1282 = func.call @cc_make_string(%1280, %1281) : (!llvm.ptr, i64) -> i64
      %1283 = func.call @cc_intern(%1279, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_nil_value() : () -> i64
      %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
      %1286 = func.call @cc_values_pack(%1285) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1287 = arith.addi %1283, %__rlasp_stack_elide_zero_53 : i64
      %1288 = func.call @stack_pop_pointer() : () -> i64
      %1289 = func.call @cc_cons(%1287, %1288) : (i64, i64) -> i64
      %1290 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1291 = arith.constant 5 : i64
      %1292 = func.call @cc_make_string(%1290, %1291) : (!llvm.ptr, i64) -> i64
      %1293 = func.call @cc_nil_value() : () -> i64
      %1294 = func.call @cc_intern(%1292, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_nil_value() : () -> i64
      %1296 = func.call @cc_cons(%1294, %1295) : (i64, i64) -> i64
      %1297 = func.call @cc_values_pack(%1296) : (i64) -> i64
      %1298 = func.call @cc_cons(%1294, %1289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      %1299 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1300 = arith.constant 8 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1303 = arith.constant 7 : i64
      %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
      %1305 = func.call @cc_intern(%1301, %1304) : (i64, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_cons(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_values_pack(%1307) : (i64) -> i64
      func.call @stack_push_pointer(%1305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1309 = func.call @stack_pop_pointer() : () -> i64
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @cc_cons(%1310, %1309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1312 = arith.addi %1311, %__rlasp_stack_elide_zero_54 : i64
      %1313 = func.call @stack_pop_pointer() : () -> i64
      %1314 = func.call @cc_cons(%1313, %1312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1315 = arith.addi %1314, %__rlasp_stack_elide_zero_55 : i64
      %1316 = func.call @stack_pop_pointer() : () -> i64
      %1317 = func.call @cc_cons(%1316, %1315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1318 = func.call @stack_pop_pointer() : () -> i64
      %1319 = func.call @stack_pop_pointer() : () -> i64
      %1320 = func.call @cc_cons(%1319, %1318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1321 = arith.addi %1320, %__rlasp_stack_elide_zero_56 : i64
      %1322 = func.call @stack_pop_pointer() : () -> i64
      %1323 = func.call @cc_cons(%1322, %1321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1323) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1324 = func.call @stack_pop_pointer() : () -> i64
      %1325 = func.call @stack_pop_pointer() : () -> i64
      %1326 = func.call @cc_cons(%1325, %1324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1327 = arith.addi %1326, %__rlasp_stack_elide_zero_57 : i64
      %1328 = func.call @stack_pop_pointer() : () -> i64
      %1329 = func.call @cc_cons(%1328, %1327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1330 = func.call @stack_pop_pointer() : () -> i64
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @cc_cons(%1331, %1330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1333 = arith.addi %1332, %__rlasp_stack_elide_zero_58 : i64
      %1334 = func.call @stack_pop_pointer() : () -> i64
      %1335 = func.call @cc_cons(%1334, %1333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1336 = func.call @stack_pop_pointer() : () -> i64
      %1337 = func.call @stack_pop_pointer() : () -> i64
      %1338 = func.call @cc_cons(%1337, %1336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1339 = arith.addi %1338, %__rlasp_stack_elide_zero_59 : i64
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = func.call @cc_cons(%1340, %1339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1342 = arith.addi %1341, %__rlasp_stack_elide_zero_60 : i64
      %1406 = arith.constant 261322017079301 : i64
      %1407 = arith.constant 0 : i64
      %1408 = func.call @cc_make_closure(%1406, %1407) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1409 = arith.addi %1408, %__rlasp_stack_elide_zero_61 : i64
      %1410 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1411 = arith.constant 1 : i64
      %1412 = func.call @cc_make_string(%1410, %1411) : (!llvm.ptr, i64) -> i64
      %1413 = func.call @cc_nil_value() : () -> i64
      %1414 = func.call @cc_intern(%1412, %1413) : (i64, i64) -> i64
      %1415 = func.call @cc_nil_value() : () -> i64
      %1416 = func.call @cc_cons(%1414, %1415) : (i64, i64) -> i64
      %1417 = func.call @cc_values_pack(%1416) : (i64) -> i64
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1418 = func.call @stack_pop_pointer() : () -> i64
      %1419 = func.call @stack_pop_pointer() : () -> i64
      %1420 = func.call @cc_cons(%1419, %1418) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1421 = arith.addi %1420, %__rlasp_stack_elide_zero_62 : i64
      %1422 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1423 = arith.constant 11 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      %1425 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1426 = arith.constant 7 : i64
      %1427 = func.call @cc_make_string(%1425, %1426) : (!llvm.ptr, i64) -> i64
      %1428 = func.call @cc_intern(%1424, %1427) : (i64, i64) -> i64
      %1429 = func.call @cc_nil_value() : () -> i64
      %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
      %1431 = func.call @cc_values_pack(%1430) : (i64) -> i64
      %1432 = func.call @cc_nil_value() : () -> i64
      %1433 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1434 = arith.constant 4 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %1436 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1437 = arith.constant 7 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = func.call @cc_intern(%1435, %1438) : (i64, i64) -> i64
      %1440 = func.call @cc_nil_value() : () -> i64
      %1441 = func.call @cc_cons(%1439, %1440) : (i64, i64) -> i64
      %1442 = func.call @cc_values_pack(%1441) : (i64) -> i64
      %1443 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1444 = arith.constant 6 : i64
      %1445 = func.call @cc_make_string(%1443, %1444) : (!llvm.ptr, i64) -> i64
      %1446 = func.call @cc_nil_value() : () -> i64
      %1447 = func.call @cc_intern(%1445, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1451 = arith.addi %1447, %__rlasp_stack_elide_zero_63 : i64
      %1452 = func.call @cc_nil_value() : () -> i64
      %1453 = func.call @cc_errorp(%1229) : (i64) -> i64
      %1454 = arith.cmpi ne, %1453, %1452 : i64
      %1455 = arith.cmpi eq, %1452, %1452 : i64
      %1456 = arith.andi %1454, %1455 : i1
      %1457 = scf.if %1456 -> (i64) {
        scf.yield %1229 : i64
      } else {
        scf.yield %1452 : i64
      }
      %1458 = func.call @cc_errorp(%1342) : (i64) -> i64
      %1459 = arith.cmpi ne, %1458, %1452 : i64
      %1460 = arith.cmpi eq, %1457, %1452 : i64
      %1461 = arith.andi %1459, %1460 : i1
      %1462 = scf.if %1461 -> (i64) {
        scf.yield %1342 : i64
      } else {
        scf.yield %1457 : i64
      }
      %1463 = func.call @cc_errorp(%1409) : (i64) -> i64
      %1464 = arith.cmpi ne, %1463, %1452 : i64
      %1465 = arith.cmpi eq, %1462, %1452 : i64
      %1466 = arith.andi %1464, %1465 : i1
      %1467 = scf.if %1466 -> (i64) {
        scf.yield %1409 : i64
      } else {
        scf.yield %1462 : i64
      }
      %1468 = func.call @cc_errorp(%1421) : (i64) -> i64
      %1469 = arith.cmpi ne, %1468, %1452 : i64
      %1470 = arith.cmpi eq, %1467, %1452 : i64
      %1471 = arith.andi %1469, %1470 : i1
      %1472 = scf.if %1471 -> (i64) {
        scf.yield %1421 : i64
      } else {
        scf.yield %1467 : i64
      }
      %1473 = func.call @cc_errorp(%1428) : (i64) -> i64
      %1474 = arith.cmpi ne, %1473, %1452 : i64
      %1475 = arith.cmpi eq, %1472, %1452 : i64
      %1476 = arith.andi %1474, %1475 : i1
      %1477 = scf.if %1476 -> (i64) {
        scf.yield %1428 : i64
      } else {
        scf.yield %1472 : i64
      }
      %1478 = func.call @cc_errorp(%1432) : (i64) -> i64
      %1479 = arith.cmpi ne, %1478, %1452 : i64
      %1480 = arith.cmpi eq, %1477, %1452 : i64
      %1481 = arith.andi %1479, %1480 : i1
      %1482 = scf.if %1481 -> (i64) {
        scf.yield %1432 : i64
      } else {
        scf.yield %1477 : i64
      }
      %1483 = func.call @cc_errorp(%1439) : (i64) -> i64
      %1484 = arith.cmpi ne, %1483, %1452 : i64
      %1485 = arith.cmpi eq, %1482, %1452 : i64
      %1486 = arith.andi %1484, %1485 : i1
      %1487 = scf.if %1486 -> (i64) {
        scf.yield %1439 : i64
      } else {
        scf.yield %1482 : i64
      }
      %1488 = func.call @cc_errorp(%1451) : (i64) -> i64
      %1489 = arith.cmpi ne, %1488, %1452 : i64
      %1490 = arith.cmpi eq, %1487, %1452 : i64
      %1491 = arith.andi %1489, %1490 : i1
      %1492 = scf.if %1491 -> (i64) {
        scf.yield %1451 : i64
      } else {
        scf.yield %1487 : i64
      }
      %1493 = arith.cmpi ne, %1492, %1452 : i64
      scf.if %1493 {
        func.call @stack_push_pointer(%1492) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1229) : (i64) -> ()
        func.call @stack_push_pointer(%1342) : (i64) -> ()
        func.call @stack_push_pointer(%1409) : (i64) -> ()
        func.call @stack_push_pointer(%1421) : (i64) -> ()
        func.call @stack_push_pointer(%1428) : (i64) -> ()
        func.call @stack_push_pointer(%1432) : (i64) -> ()
        func.call @stack_push_pointer(%1439) : (i64) -> ()
        func.call @stack_push_pointer(%1451) : (i64) -> ()
        %1494 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1495 = func.call @cc_make_function_ref_const(%1494) : (!llvm.ptr) -> i64
        %1496 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1495, %1496) : (i64, i64) -> ()
      }
      %1497 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1497 : i64
    }
    %1498 = func.call @cc_nil_value() : () -> i64
    %1499 = func.call @cc_errorp(%1220) : (i64) -> i64
    %1500 = arith.cmpi ne, %1499, %1498 : i64
    %1501 = scf.if %1500 -> (i64) {
      scf.yield %1220 : i64
    } else {
      %1502 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1503 = arith.constant 28 : i64
      %1504 = func.call @cc_make_string(%1502, %1503) : (!llvm.ptr, i64) -> i64
      %1505 = func.call @cc_nil_value() : () -> i64
      %1506 = func.call @cc_intern(%1504, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_nil_value() : () -> i64
      %1508 = func.call @cc_cons(%1506, %1507) : (i64, i64) -> i64
      %1509 = func.call @cc_values_pack(%1508) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1510 = arith.addi %1506, %__rlasp_stack_elide_zero_64 : i64
      %1511 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1512 = arith.constant 3 : i64
      %1513 = func.call @cc_make_string(%1511, %1512) : (!llvm.ptr, i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = func.call @cc_intern(%1513, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      %1519 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1520 = arith.constant 3 : i64
      %1521 = func.call @cc_make_string(%1519, %1520) : (!llvm.ptr, i64) -> i64
      %1522 = func.call @cc_nil_value() : () -> i64
      %1523 = func.call @cc_intern(%1521, %1522) : (i64, i64) -> i64
      %1524 = func.call @cc_nil_value() : () -> i64
      %1525 = func.call @cc_cons(%1523, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_values_pack(%1525) : (i64) -> i64
      func.call @stack_push_pointer(%1523) : (i64) -> ()
      %1527 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1528 = arith.constant 17 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1531 = arith.constant 3 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = func.call @cc_intern(%1529, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_cons(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_values_pack(%1535) : (i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      %1537 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1538 = arith.constant 5 : i64
      %1539 = func.call @cc_make_string(%1537, %1538) : (!llvm.ptr, i64) -> i64
      %1540 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1541 = arith.constant 11 : i64
      %1542 = func.call @cc_make_string(%1540, %1541) : (!llvm.ptr, i64) -> i64
      %1543 = func.call @cc_intern(%1539, %1542) : (i64, i64) -> i64
      %1544 = func.call @cc_nil_value() : () -> i64
      %1545 = func.call @cc_cons(%1543, %1544) : (i64, i64) -> i64
      %1546 = func.call @cc_values_pack(%1545) : (i64) -> i64
      func.call @stack_push_pointer(%1543) : (i64) -> ()
      %1547 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1548 = arith.constant 15 : i64
      %1549 = func.call @cc_make_string(%1547, %1548) : (!llvm.ptr, i64) -> i64
      %1550 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1551 = arith.constant 3 : i64
      %1552 = func.call @cc_make_string(%1550, %1551) : (!llvm.ptr, i64) -> i64
      %1553 = func.call @cc_intern(%1549, %1552) : (i64, i64) -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_cons(%1553, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_values_pack(%1555) : (i64) -> i64
      func.call @stack_push_pointer(%1553) : (i64) -> ()
      %1557 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1557) : (i64) -> ()
      %1558 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1559 = arith.constant 5 : i64
      %1560 = func.call @cc_make_string(%1558, %1559) : (!llvm.ptr, i64) -> i64
      %1561 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1562 = arith.constant 11 : i64
      %1563 = func.call @cc_make_string(%1561, %1562) : (!llvm.ptr, i64) -> i64
      %1564 = func.call @cc_intern(%1560, %1563) : (i64, i64) -> i64
      %1565 = func.call @cc_nil_value() : () -> i64
      %1566 = func.call @cc_cons(%1564, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_values_pack(%1566) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1568 = arith.addi %1564, %__rlasp_stack_elide_zero_65 : i64
      %1569 = func.call @stack_pop_pointer() : () -> i64
      %1570 = func.call @cc_cons(%1568, %1569) : (i64, i64) -> i64
      %1571 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1572 = arith.constant 5 : i64
      %1573 = func.call @cc_make_string(%1571, %1572) : (!llvm.ptr, i64) -> i64
      %1574 = func.call @cc_nil_value() : () -> i64
      %1575 = func.call @cc_intern(%1573, %1574) : (i64, i64) -> i64
      %1576 = func.call @cc_nil_value() : () -> i64
      %1577 = func.call @cc_cons(%1575, %1576) : (i64, i64) -> i64
      %1578 = func.call @cc_values_pack(%1577) : (i64) -> i64
      %1579 = func.call @cc_cons(%1575, %1570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1579) : (i64) -> ()
      %1580 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1581 = arith.constant 8 : i64
      %1582 = func.call @cc_make_string(%1580, %1581) : (!llvm.ptr, i64) -> i64
      %1583 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1584 = arith.constant 7 : i64
      %1585 = func.call @cc_make_string(%1583, %1584) : (!llvm.ptr, i64) -> i64
      %1586 = func.call @cc_intern(%1582, %1585) : (i64, i64) -> i64
      %1587 = func.call @cc_nil_value() : () -> i64
      %1588 = func.call @cc_cons(%1586, %1587) : (i64, i64) -> i64
      %1589 = func.call @cc_values_pack(%1588) : (i64) -> i64
      func.call @stack_push_pointer(%1586) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1590 = func.call @stack_pop_pointer() : () -> i64
      %1591 = func.call @stack_pop_pointer() : () -> i64
      %1592 = func.call @cc_cons(%1591, %1590) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1593 = arith.addi %1592, %__rlasp_stack_elide_zero_66 : i64
      %1594 = func.call @stack_pop_pointer() : () -> i64
      %1595 = func.call @cc_cons(%1594, %1593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1596 = arith.addi %1595, %__rlasp_stack_elide_zero_67 : i64
      %1597 = func.call @stack_pop_pointer() : () -> i64
      %1598 = func.call @cc_cons(%1597, %1596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1599 = func.call @stack_pop_pointer() : () -> i64
      %1600 = func.call @stack_pop_pointer() : () -> i64
      %1601 = func.call @cc_cons(%1600, %1599) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1602 = arith.addi %1601, %__rlasp_stack_elide_zero_68 : i64
      %1603 = func.call @stack_pop_pointer() : () -> i64
      %1604 = func.call @cc_cons(%1603, %1602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1605 = func.call @stack_pop_pointer() : () -> i64
      %1606 = func.call @stack_pop_pointer() : () -> i64
      %1607 = func.call @cc_cons(%1606, %1605) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1608 = arith.addi %1607, %__rlasp_stack_elide_zero_69 : i64
      %1609 = func.call @stack_pop_pointer() : () -> i64
      %1610 = func.call @cc_cons(%1609, %1608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1610) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1611 = func.call @stack_pop_pointer() : () -> i64
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = func.call @cc_cons(%1612, %1611) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1614 = arith.addi %1613, %__rlasp_stack_elide_zero_70 : i64
      %1615 = func.call @stack_pop_pointer() : () -> i64
      %1616 = func.call @cc_cons(%1615, %1614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1616) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1617 = func.call @stack_pop_pointer() : () -> i64
      %1618 = func.call @stack_pop_pointer() : () -> i64
      %1619 = func.call @cc_cons(%1618, %1617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1620 = arith.addi %1619, %__rlasp_stack_elide_zero_71 : i64
      %1621 = func.call @stack_pop_pointer() : () -> i64
      %1622 = func.call @cc_cons(%1621, %1620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1623 = arith.addi %1622, %__rlasp_stack_elide_zero_72 : i64
      %1687 = arith.constant 261322017079302 : i64
      %1688 = arith.constant 0 : i64
      %1689 = func.call @cc_make_closure(%1687, %1688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1690 = arith.addi %1689, %__rlasp_stack_elide_zero_73 : i64
      %1691 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1692 = arith.constant 1 : i64
      %1693 = func.call @cc_make_string(%1691, %1692) : (!llvm.ptr, i64) -> i64
      %1694 = func.call @cc_nil_value() : () -> i64
      %1695 = func.call @cc_intern(%1693, %1694) : (i64, i64) -> i64
      %1696 = func.call @cc_nil_value() : () -> i64
      %1697 = func.call @cc_cons(%1695, %1696) : (i64, i64) -> i64
      %1698 = func.call @cc_values_pack(%1697) : (i64) -> i64
      func.call @stack_push_pointer(%1695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @stack_pop_pointer() : () -> i64
      %1701 = func.call @cc_cons(%1700, %1699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1702 = arith.addi %1701, %__rlasp_stack_elide_zero_74 : i64
      %1703 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1704 = arith.constant 11 : i64
      %1705 = func.call @cc_make_string(%1703, %1704) : (!llvm.ptr, i64) -> i64
      %1706 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1707 = arith.constant 7 : i64
      %1708 = func.call @cc_make_string(%1706, %1707) : (!llvm.ptr, i64) -> i64
      %1709 = func.call @cc_intern(%1705, %1708) : (i64, i64) -> i64
      %1710 = func.call @cc_nil_value() : () -> i64
      %1711 = func.call @cc_cons(%1709, %1710) : (i64, i64) -> i64
      %1712 = func.call @cc_values_pack(%1711) : (i64) -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1715 = arith.constant 4 : i64
      %1716 = func.call @cc_make_string(%1714, %1715) : (!llvm.ptr, i64) -> i64
      %1717 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1718 = arith.constant 7 : i64
      %1719 = func.call @cc_make_string(%1717, %1718) : (!llvm.ptr, i64) -> i64
      %1720 = func.call @cc_intern(%1716, %1719) : (i64, i64) -> i64
      %1721 = func.call @cc_nil_value() : () -> i64
      %1722 = func.call @cc_cons(%1720, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_values_pack(%1722) : (i64) -> i64
      %1724 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1725 = arith.constant 6 : i64
      %1726 = func.call @cc_make_string(%1724, %1725) : (!llvm.ptr, i64) -> i64
      %1727 = func.call @cc_nil_value() : () -> i64
      %1728 = func.call @cc_intern(%1726, %1727) : (i64, i64) -> i64
      %1729 = func.call @cc_nil_value() : () -> i64
      %1730 = func.call @cc_cons(%1728, %1729) : (i64, i64) -> i64
      %1731 = func.call @cc_values_pack(%1730) : (i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1732 = arith.addi %1728, %__rlasp_stack_elide_zero_75 : i64
      %1733 = func.call @cc_nil_value() : () -> i64
      %1734 = func.call @cc_errorp(%1510) : (i64) -> i64
      %1735 = arith.cmpi ne, %1734, %1733 : i64
      %1736 = arith.cmpi eq, %1733, %1733 : i64
      %1737 = arith.andi %1735, %1736 : i1
      %1738 = scf.if %1737 -> (i64) {
        scf.yield %1510 : i64
      } else {
        scf.yield %1733 : i64
      }
      %1739 = func.call @cc_errorp(%1623) : (i64) -> i64
      %1740 = arith.cmpi ne, %1739, %1733 : i64
      %1741 = arith.cmpi eq, %1738, %1733 : i64
      %1742 = arith.andi %1740, %1741 : i1
      %1743 = scf.if %1742 -> (i64) {
        scf.yield %1623 : i64
      } else {
        scf.yield %1738 : i64
      }
      %1744 = func.call @cc_errorp(%1690) : (i64) -> i64
      %1745 = arith.cmpi ne, %1744, %1733 : i64
      %1746 = arith.cmpi eq, %1743, %1733 : i64
      %1747 = arith.andi %1745, %1746 : i1
      %1748 = scf.if %1747 -> (i64) {
        scf.yield %1690 : i64
      } else {
        scf.yield %1743 : i64
      }
      %1749 = func.call @cc_errorp(%1702) : (i64) -> i64
      %1750 = arith.cmpi ne, %1749, %1733 : i64
      %1751 = arith.cmpi eq, %1748, %1733 : i64
      %1752 = arith.andi %1750, %1751 : i1
      %1753 = scf.if %1752 -> (i64) {
        scf.yield %1702 : i64
      } else {
        scf.yield %1748 : i64
      }
      %1754 = func.call @cc_errorp(%1709) : (i64) -> i64
      %1755 = arith.cmpi ne, %1754, %1733 : i64
      %1756 = arith.cmpi eq, %1753, %1733 : i64
      %1757 = arith.andi %1755, %1756 : i1
      %1758 = scf.if %1757 -> (i64) {
        scf.yield %1709 : i64
      } else {
        scf.yield %1753 : i64
      }
      %1759 = func.call @cc_errorp(%1713) : (i64) -> i64
      %1760 = arith.cmpi ne, %1759, %1733 : i64
      %1761 = arith.cmpi eq, %1758, %1733 : i64
      %1762 = arith.andi %1760, %1761 : i1
      %1763 = scf.if %1762 -> (i64) {
        scf.yield %1713 : i64
      } else {
        scf.yield %1758 : i64
      }
      %1764 = func.call @cc_errorp(%1720) : (i64) -> i64
      %1765 = arith.cmpi ne, %1764, %1733 : i64
      %1766 = arith.cmpi eq, %1763, %1733 : i64
      %1767 = arith.andi %1765, %1766 : i1
      %1768 = scf.if %1767 -> (i64) {
        scf.yield %1720 : i64
      } else {
        scf.yield %1763 : i64
      }
      %1769 = func.call @cc_errorp(%1732) : (i64) -> i64
      %1770 = arith.cmpi ne, %1769, %1733 : i64
      %1771 = arith.cmpi eq, %1768, %1733 : i64
      %1772 = arith.andi %1770, %1771 : i1
      %1773 = scf.if %1772 -> (i64) {
        scf.yield %1732 : i64
      } else {
        scf.yield %1768 : i64
      }
      %1774 = arith.cmpi ne, %1773, %1733 : i64
      scf.if %1774 {
        func.call @stack_push_pointer(%1773) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1510) : (i64) -> ()
        func.call @stack_push_pointer(%1623) : (i64) -> ()
        func.call @stack_push_pointer(%1690) : (i64) -> ()
        func.call @stack_push_pointer(%1702) : (i64) -> ()
        func.call @stack_push_pointer(%1709) : (i64) -> ()
        func.call @stack_push_pointer(%1713) : (i64) -> ()
        func.call @stack_push_pointer(%1720) : (i64) -> ()
        func.call @stack_push_pointer(%1732) : (i64) -> ()
        %1775 = llvm.mlir.addressof @str169 : !llvm.ptr
        %1776 = func.call @cc_make_function_ref_const(%1775) : (!llvm.ptr) -> i64
        %1777 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1776, %1777) : (i64, i64) -> ()
      }
      %1778 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1778 : i64
    }
    %1779 = func.call @cc_nil_value() : () -> i64
    %1780 = func.call @cc_errorp(%1501) : (i64) -> i64
    %1781 = arith.cmpi ne, %1780, %1779 : i64
    %1782 = scf.if %1781 -> (i64) {
      scf.yield %1501 : i64
    } else {
      %1783 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1784 = arith.constant 32 : i64
      %1785 = func.call @cc_make_string(%1783, %1784) : (!llvm.ptr, i64) -> i64
      %1786 = func.call @cc_nil_value() : () -> i64
      %1787 = func.call @cc_intern(%1785, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_nil_value() : () -> i64
      %1789 = func.call @cc_cons(%1787, %1788) : (i64, i64) -> i64
      %1790 = func.call @cc_values_pack(%1789) : (i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1791 = arith.addi %1787, %__rlasp_stack_elide_zero_76 : i64
      %1792 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1793 = arith.constant 3 : i64
      %1794 = func.call @cc_make_string(%1792, %1793) : (!llvm.ptr, i64) -> i64
      %1795 = func.call @cc_nil_value() : () -> i64
      %1796 = func.call @cc_intern(%1794, %1795) : (i64, i64) -> i64
      %1797 = func.call @cc_nil_value() : () -> i64
      %1798 = func.call @cc_cons(%1796, %1797) : (i64, i64) -> i64
      %1799 = func.call @cc_values_pack(%1798) : (i64) -> i64
      func.call @stack_push_pointer(%1796) : (i64) -> ()
      %1800 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1801 = arith.constant 3 : i64
      %1802 = func.call @cc_make_string(%1800, %1801) : (!llvm.ptr, i64) -> i64
      %1803 = func.call @cc_nil_value() : () -> i64
      %1804 = func.call @cc_intern(%1802, %1803) : (i64, i64) -> i64
      %1805 = func.call @cc_nil_value() : () -> i64
      %1806 = func.call @cc_cons(%1804, %1805) : (i64, i64) -> i64
      %1807 = func.call @cc_values_pack(%1806) : (i64) -> i64
      func.call @stack_push_pointer(%1804) : (i64) -> ()
      %1808 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1809 = arith.constant 17 : i64
      %1810 = func.call @cc_make_string(%1808, %1809) : (!llvm.ptr, i64) -> i64
      %1811 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1812 = arith.constant 3 : i64
      %1813 = func.call @cc_make_string(%1811, %1812) : (!llvm.ptr, i64) -> i64
      %1814 = func.call @cc_intern(%1810, %1813) : (i64, i64) -> i64
      %1815 = func.call @cc_nil_value() : () -> i64
      %1816 = func.call @cc_cons(%1814, %1815) : (i64, i64) -> i64
      %1817 = func.call @cc_values_pack(%1816) : (i64) -> i64
      func.call @stack_push_pointer(%1814) : (i64) -> ()
      %1818 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1819 = arith.constant 5 : i64
      %1820 = func.call @cc_make_string(%1818, %1819) : (!llvm.ptr, i64) -> i64
      %1821 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1822 = arith.constant 11 : i64
      %1823 = func.call @cc_make_string(%1821, %1822) : (!llvm.ptr, i64) -> i64
      %1824 = func.call @cc_intern(%1820, %1823) : (i64, i64) -> i64
      %1825 = func.call @cc_nil_value() : () -> i64
      %1826 = func.call @cc_cons(%1824, %1825) : (i64, i64) -> i64
      %1827 = func.call @cc_values_pack(%1826) : (i64) -> i64
      func.call @stack_push_pointer(%1824) : (i64) -> ()
      %1828 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1829 = arith.constant 15 : i64
      %1830 = func.call @cc_make_string(%1828, %1829) : (!llvm.ptr, i64) -> i64
      %1831 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1832 = arith.constant 3 : i64
      %1833 = func.call @cc_make_string(%1831, %1832) : (!llvm.ptr, i64) -> i64
      %1834 = func.call @cc_intern(%1830, %1833) : (i64, i64) -> i64
      %1835 = func.call @cc_nil_value() : () -> i64
      %1836 = func.call @cc_cons(%1834, %1835) : (i64, i64) -> i64
      %1837 = func.call @cc_values_pack(%1836) : (i64) -> i64
      func.call @stack_push_pointer(%1834) : (i64) -> ()
      %1838 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1839 = arith.constant 8 : i64
      %1840 = func.call @cc_make_string(%1838, %1839) : (!llvm.ptr, i64) -> i64
      %1841 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1842 = arith.constant 11 : i64
      %1843 = func.call @cc_make_string(%1841, %1842) : (!llvm.ptr, i64) -> i64
      %1844 = func.call @cc_intern(%1840, %1843) : (i64, i64) -> i64
      %1845 = func.call @cc_nil_value() : () -> i64
      %1846 = func.call @cc_cons(%1844, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_values_pack(%1846) : (i64) -> i64
      func.call @stack_push_pointer(%1844) : (i64) -> ()
      %1848 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1849 = arith.constant 19 : i64
      %1850 = func.call @cc_make_string(%1848, %1849) : (!llvm.ptr, i64) -> i64
      %1851 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1852 = arith.constant 11 : i64
      %1853 = func.call @cc_make_string(%1851, %1852) : (!llvm.ptr, i64) -> i64
      %1854 = func.call @cc_intern(%1850, %1853) : (i64, i64) -> i64
      %1855 = func.call @cc_nil_value() : () -> i64
      %1856 = func.call @cc_cons(%1854, %1855) : (i64, i64) -> i64
      %1857 = func.call @cc_values_pack(%1856) : (i64) -> i64
      func.call @stack_push_pointer(%1854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1858 = func.call @stack_pop_pointer() : () -> i64
      %1859 = func.call @stack_pop_pointer() : () -> i64
      %1860 = func.call @cc_cons(%1859, %1858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1861 = arith.addi %1860, %__rlasp_stack_elide_zero_77 : i64
      %1862 = func.call @stack_pop_pointer() : () -> i64
      %1863 = func.call @cc_cons(%1862, %1861) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1863) : (i64) -> ()
      %1864 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1864) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = func.call @cc_cons(%1866, %1865) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1868 = arith.addi %1867, %__rlasp_stack_elide_zero_78 : i64
      %1869 = func.call @stack_pop_pointer() : () -> i64
      %1870 = func.call @cc_cons(%1869, %1868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1871 = arith.addi %1870, %__rlasp_stack_elide_zero_79 : i64
      %1872 = func.call @stack_pop_pointer() : () -> i64
      %1873 = func.call @cc_cons(%1872, %1871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1874 = func.call @stack_pop_pointer() : () -> i64
      %1875 = func.call @stack_pop_pointer() : () -> i64
      %1876 = func.call @cc_cons(%1875, %1874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1877 = arith.addi %1876, %__rlasp_stack_elide_zero_80 : i64
      %1878 = func.call @stack_pop_pointer() : () -> i64
      %1879 = func.call @cc_cons(%1878, %1877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1880 = func.call @stack_pop_pointer() : () -> i64
      %1881 = func.call @stack_pop_pointer() : () -> i64
      %1882 = func.call @cc_cons(%1881, %1880) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1883 = arith.addi %1882, %__rlasp_stack_elide_zero_81 : i64
      %1884 = func.call @stack_pop_pointer() : () -> i64
      %1885 = func.call @cc_cons(%1884, %1883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1885) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @stack_pop_pointer() : () -> i64
      %1888 = func.call @cc_cons(%1887, %1886) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1889 = arith.addi %1888, %__rlasp_stack_elide_zero_82 : i64
      %1890 = func.call @stack_pop_pointer() : () -> i64
      %1891 = func.call @cc_cons(%1890, %1889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1892 = func.call @stack_pop_pointer() : () -> i64
      %1893 = func.call @stack_pop_pointer() : () -> i64
      %1894 = func.call @cc_cons(%1893, %1892) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1895 = arith.addi %1894, %__rlasp_stack_elide_zero_83 : i64
      %1896 = func.call @stack_pop_pointer() : () -> i64
      %1897 = func.call @cc_cons(%1896, %1895) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1898 = arith.addi %1897, %__rlasp_stack_elide_zero_84 : i64
      %1945 = arith.constant 261322017079303 : i64
      %1946 = arith.constant 0 : i64
      %1947 = func.call @cc_make_closure(%1945, %1946) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1948 = arith.addi %1947, %__rlasp_stack_elide_zero_85 : i64
      %1949 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1950 = arith.constant 1 : i64
      %1951 = func.call @cc_make_string(%1949, %1950) : (!llvm.ptr, i64) -> i64
      %1952 = func.call @cc_nil_value() : () -> i64
      %1953 = func.call @cc_intern(%1951, %1952) : (i64, i64) -> i64
      %1954 = func.call @cc_nil_value() : () -> i64
      %1955 = func.call @cc_cons(%1953, %1954) : (i64, i64) -> i64
      %1956 = func.call @cc_values_pack(%1955) : (i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @stack_pop_pointer() : () -> i64
      %1959 = func.call @cc_cons(%1958, %1957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1960 = arith.addi %1959, %__rlasp_stack_elide_zero_86 : i64
      %1961 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1962 = arith.constant 11 : i64
      %1963 = func.call @cc_make_string(%1961, %1962) : (!llvm.ptr, i64) -> i64
      %1964 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1965 = arith.constant 7 : i64
      %1966 = func.call @cc_make_string(%1964, %1965) : (!llvm.ptr, i64) -> i64
      %1967 = func.call @cc_intern(%1963, %1966) : (i64, i64) -> i64
      %1968 = func.call @cc_nil_value() : () -> i64
      %1969 = func.call @cc_cons(%1967, %1968) : (i64, i64) -> i64
      %1970 = func.call @cc_values_pack(%1969) : (i64) -> i64
      %1971 = func.call @cc_nil_value() : () -> i64
      %1972 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1973 = arith.constant 4 : i64
      %1974 = func.call @cc_make_string(%1972, %1973) : (!llvm.ptr, i64) -> i64
      %1975 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1976 = arith.constant 7 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = func.call @cc_intern(%1974, %1977) : (i64, i64) -> i64
      %1979 = func.call @cc_nil_value() : () -> i64
      %1980 = func.call @cc_cons(%1978, %1979) : (i64, i64) -> i64
      %1981 = func.call @cc_values_pack(%1980) : (i64) -> i64
      %1982 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1983 = arith.constant 6 : i64
      %1984 = func.call @cc_make_string(%1982, %1983) : (!llvm.ptr, i64) -> i64
      %1985 = func.call @cc_nil_value() : () -> i64
      %1986 = func.call @cc_intern(%1984, %1985) : (i64, i64) -> i64
      %1987 = func.call @cc_nil_value() : () -> i64
      %1988 = func.call @cc_cons(%1986, %1987) : (i64, i64) -> i64
      %1989 = func.call @cc_values_pack(%1988) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1990 = arith.addi %1986, %__rlasp_stack_elide_zero_87 : i64
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_errorp(%1791) : (i64) -> i64
      %1993 = arith.cmpi ne, %1992, %1991 : i64
      %1994 = arith.cmpi eq, %1991, %1991 : i64
      %1995 = arith.andi %1993, %1994 : i1
      %1996 = scf.if %1995 -> (i64) {
        scf.yield %1791 : i64
      } else {
        scf.yield %1991 : i64
      }
      %1997 = func.call @cc_errorp(%1898) : (i64) -> i64
      %1998 = arith.cmpi ne, %1997, %1991 : i64
      %1999 = arith.cmpi eq, %1996, %1991 : i64
      %2000 = arith.andi %1998, %1999 : i1
      %2001 = scf.if %2000 -> (i64) {
        scf.yield %1898 : i64
      } else {
        scf.yield %1996 : i64
      }
      %2002 = func.call @cc_errorp(%1948) : (i64) -> i64
      %2003 = arith.cmpi ne, %2002, %1991 : i64
      %2004 = arith.cmpi eq, %2001, %1991 : i64
      %2005 = arith.andi %2003, %2004 : i1
      %2006 = scf.if %2005 -> (i64) {
        scf.yield %1948 : i64
      } else {
        scf.yield %2001 : i64
      }
      %2007 = func.call @cc_errorp(%1960) : (i64) -> i64
      %2008 = arith.cmpi ne, %2007, %1991 : i64
      %2009 = arith.cmpi eq, %2006, %1991 : i64
      %2010 = arith.andi %2008, %2009 : i1
      %2011 = scf.if %2010 -> (i64) {
        scf.yield %1960 : i64
      } else {
        scf.yield %2006 : i64
      }
      %2012 = func.call @cc_errorp(%1967) : (i64) -> i64
      %2013 = arith.cmpi ne, %2012, %1991 : i64
      %2014 = arith.cmpi eq, %2011, %1991 : i64
      %2015 = arith.andi %2013, %2014 : i1
      %2016 = scf.if %2015 -> (i64) {
        scf.yield %1967 : i64
      } else {
        scf.yield %2011 : i64
      }
      %2017 = func.call @cc_errorp(%1971) : (i64) -> i64
      %2018 = arith.cmpi ne, %2017, %1991 : i64
      %2019 = arith.cmpi eq, %2016, %1991 : i64
      %2020 = arith.andi %2018, %2019 : i1
      %2021 = scf.if %2020 -> (i64) {
        scf.yield %1971 : i64
      } else {
        scf.yield %2016 : i64
      }
      %2022 = func.call @cc_errorp(%1978) : (i64) -> i64
      %2023 = arith.cmpi ne, %2022, %1991 : i64
      %2024 = arith.cmpi eq, %2021, %1991 : i64
      %2025 = arith.andi %2023, %2024 : i1
      %2026 = scf.if %2025 -> (i64) {
        scf.yield %1978 : i64
      } else {
        scf.yield %2021 : i64
      }
      %2027 = func.call @cc_errorp(%1990) : (i64) -> i64
      %2028 = arith.cmpi ne, %2027, %1991 : i64
      %2029 = arith.cmpi eq, %2026, %1991 : i64
      %2030 = arith.andi %2028, %2029 : i1
      %2031 = scf.if %2030 -> (i64) {
        scf.yield %1990 : i64
      } else {
        scf.yield %2026 : i64
      }
      %2032 = arith.cmpi ne, %2031, %1991 : i64
      scf.if %2032 {
        func.call @stack_push_pointer(%2031) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1791) : (i64) -> ()
        func.call @stack_push_pointer(%1898) : (i64) -> ()
        func.call @stack_push_pointer(%1948) : (i64) -> ()
        func.call @stack_push_pointer(%1960) : (i64) -> ()
        func.call @stack_push_pointer(%1967) : (i64) -> ()
        func.call @stack_push_pointer(%1971) : (i64) -> ()
        func.call @stack_push_pointer(%1978) : (i64) -> ()
        func.call @stack_push_pointer(%1990) : (i64) -> ()
        %2033 = llvm.mlir.addressof @str192 : !llvm.ptr
        %2034 = func.call @cc_make_function_ref_const(%2033) : (!llvm.ptr) -> i64
        %2035 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2034, %2035) : (i64, i64) -> ()
      }
      %2036 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2036 : i64
    }
    %2037 = func.call @cc_nil_value() : () -> i64
    %2038 = func.call @cc_errorp(%1782) : (i64) -> i64
    %2039 = arith.cmpi ne, %2038, %2037 : i64
    %2040 = scf.if %2039 -> (i64) {
      scf.yield %1782 : i64
    } else {
      %2041 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2042 = arith.constant 20 : i64
      %2043 = func.call @cc_make_string(%2041, %2042) : (!llvm.ptr, i64) -> i64
      %2044 = func.call @cc_nil_value() : () -> i64
      %2045 = func.call @cc_intern(%2043, %2044) : (i64, i64) -> i64
      %2046 = func.call @cc_nil_value() : () -> i64
      %2047 = func.call @cc_cons(%2045, %2046) : (i64, i64) -> i64
      %2048 = func.call @cc_values_pack(%2047) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2049 = arith.addi %2045, %__rlasp_stack_elide_zero_88 : i64
      %2050 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2051 = arith.constant 3 : i64
      %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
      %2053 = func.call @cc_nil_value() : () -> i64
      %2054 = func.call @cc_intern(%2052, %2053) : (i64, i64) -> i64
      %2055 = func.call @cc_nil_value() : () -> i64
      %2056 = func.call @cc_cons(%2054, %2055) : (i64, i64) -> i64
      %2057 = func.call @cc_values_pack(%2056) : (i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      %2058 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2059 = arith.constant 3 : i64
      %2060 = func.call @cc_make_string(%2058, %2059) : (!llvm.ptr, i64) -> i64
      %2061 = func.call @cc_nil_value() : () -> i64
      %2062 = func.call @cc_intern(%2060, %2061) : (i64, i64) -> i64
      %2063 = func.call @cc_nil_value() : () -> i64
      %2064 = func.call @cc_cons(%2062, %2063) : (i64, i64) -> i64
      %2065 = func.call @cc_values_pack(%2064) : (i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2066 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2067 = arith.constant 17 : i64
      %2068 = func.call @cc_make_string(%2066, %2067) : (!llvm.ptr, i64) -> i64
      %2069 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2070 = arith.constant 3 : i64
      %2071 = func.call @cc_make_string(%2069, %2070) : (!llvm.ptr, i64) -> i64
      %2072 = func.call @cc_intern(%2068, %2071) : (i64, i64) -> i64
      %2073 = func.call @cc_nil_value() : () -> i64
      %2074 = func.call @cc_cons(%2072, %2073) : (i64, i64) -> i64
      %2075 = func.call @cc_values_pack(%2074) : (i64) -> i64
      func.call @stack_push_pointer(%2072) : (i64) -> ()
      %2076 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2077 = arith.constant 5 : i64
      %2078 = func.call @cc_make_string(%2076, %2077) : (!llvm.ptr, i64) -> i64
      %2079 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2080 = arith.constant 11 : i64
      %2081 = func.call @cc_make_string(%2079, %2080) : (!llvm.ptr, i64) -> i64
      %2082 = func.call @cc_intern(%2078, %2081) : (i64, i64) -> i64
      %2083 = func.call @cc_nil_value() : () -> i64
      %2084 = func.call @cc_cons(%2082, %2083) : (i64, i64) -> i64
      %2085 = func.call @cc_values_pack(%2084) : (i64) -> i64
      func.call @stack_push_pointer(%2082) : (i64) -> ()
      %2086 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2087 = arith.constant 15 : i64
      %2088 = func.call @cc_make_string(%2086, %2087) : (!llvm.ptr, i64) -> i64
      %2089 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2090 = arith.constant 3 : i64
      %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
      %2092 = func.call @cc_intern(%2088, %2091) : (i64, i64) -> i64
      %2093 = func.call @cc_nil_value() : () -> i64
      %2094 = func.call @cc_cons(%2092, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_values_pack(%2094) : (i64) -> i64
      func.call @stack_push_pointer(%2092) : (i64) -> ()
      %2096 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2097 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2098 = arith.constant 6 : i64
      %2099 = func.call @cc_make_string(%2097, %2098) : (!llvm.ptr, i64) -> i64
      %2100 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2101 = arith.constant 11 : i64
      %2102 = func.call @cc_make_string(%2100, %2101) : (!llvm.ptr, i64) -> i64
      %2103 = func.call @cc_intern(%2099, %2102) : (i64, i64) -> i64
      %2104 = func.call @cc_nil_value() : () -> i64
      %2105 = func.call @cc_cons(%2103, %2104) : (i64, i64) -> i64
      %2106 = func.call @cc_values_pack(%2105) : (i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2107 = arith.addi %2103, %__rlasp_stack_elide_zero_89 : i64
      %2108 = func.call @stack_pop_pointer() : () -> i64
      %2109 = func.call @cc_cons(%2107, %2108) : (i64, i64) -> i64
      %2110 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2111 = arith.constant 5 : i64
      %2112 = func.call @cc_make_string(%2110, %2111) : (!llvm.ptr, i64) -> i64
      %2113 = func.call @cc_nil_value() : () -> i64
      %2114 = func.call @cc_intern(%2112, %2113) : (i64, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_cons(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_values_pack(%2116) : (i64) -> i64
      %2118 = func.call @cc_cons(%2114, %2109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2118) : (i64) -> ()
      %2119 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2120 = arith.constant 4 : i64
      %2121 = func.call @cc_make_string(%2119, %2120) : (!llvm.ptr, i64) -> i64
      %2122 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2123 = arith.constant 7 : i64
      %2124 = func.call @cc_make_string(%2122, %2123) : (!llvm.ptr, i64) -> i64
      %2125 = func.call @cc_intern(%2121, %2124) : (i64, i64) -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
      %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
      func.call @stack_push_pointer(%2125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_cons(%2130, %2129) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2132 = arith.addi %2131, %__rlasp_stack_elide_zero_90 : i64
      %2133 = func.call @stack_pop_pointer() : () -> i64
      %2134 = func.call @cc_cons(%2133, %2132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2135 = arith.addi %2134, %__rlasp_stack_elide_zero_91 : i64
      %2136 = func.call @stack_pop_pointer() : () -> i64
      %2137 = func.call @cc_cons(%2136, %2135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2137) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2138 = func.call @stack_pop_pointer() : () -> i64
      %2139 = func.call @stack_pop_pointer() : () -> i64
      %2140 = func.call @cc_cons(%2139, %2138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2141 = arith.addi %2140, %__rlasp_stack_elide_zero_92 : i64
      %2142 = func.call @stack_pop_pointer() : () -> i64
      %2143 = func.call @cc_cons(%2142, %2141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2143) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2144 = func.call @stack_pop_pointer() : () -> i64
      %2145 = func.call @stack_pop_pointer() : () -> i64
      %2146 = func.call @cc_cons(%2145, %2144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2147 = arith.addi %2146, %__rlasp_stack_elide_zero_93 : i64
      %2148 = func.call @stack_pop_pointer() : () -> i64
      %2149 = func.call @cc_cons(%2148, %2147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2150 = func.call @stack_pop_pointer() : () -> i64
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @cc_cons(%2151, %2150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2153 = arith.addi %2152, %__rlasp_stack_elide_zero_94 : i64
      %2154 = func.call @stack_pop_pointer() : () -> i64
      %2155 = func.call @cc_cons(%2154, %2153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2156 = func.call @stack_pop_pointer() : () -> i64
      %2157 = func.call @stack_pop_pointer() : () -> i64
      %2158 = func.call @cc_cons(%2157, %2156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2159 = arith.addi %2158, %__rlasp_stack_elide_zero_95 : i64
      %2160 = func.call @stack_pop_pointer() : () -> i64
      %2161 = func.call @cc_cons(%2160, %2159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2162 = arith.addi %2161, %__rlasp_stack_elide_zero_96 : i64
      %2226 = arith.constant 261322017079304 : i64
      %2227 = arith.constant 0 : i64
      %2228 = func.call @cc_make_closure(%2226, %2227) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2229 = arith.addi %2228, %__rlasp_stack_elide_zero_97 : i64
      %2230 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2231 = arith.constant 1 : i64
      %2232 = func.call @cc_make_string(%2230, %2231) : (!llvm.ptr, i64) -> i64
      %2233 = func.call @cc_nil_value() : () -> i64
      %2234 = func.call @cc_intern(%2232, %2233) : (i64, i64) -> i64
      %2235 = func.call @cc_nil_value() : () -> i64
      %2236 = func.call @cc_cons(%2234, %2235) : (i64, i64) -> i64
      %2237 = func.call @cc_values_pack(%2236) : (i64) -> i64
      func.call @stack_push_pointer(%2234) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2238 = func.call @stack_pop_pointer() : () -> i64
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @cc_cons(%2239, %2238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2241 = arith.addi %2240, %__rlasp_stack_elide_zero_98 : i64
      %2242 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2243 = arith.constant 11 : i64
      %2244 = func.call @cc_make_string(%2242, %2243) : (!llvm.ptr, i64) -> i64
      %2245 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2246 = arith.constant 7 : i64
      %2247 = func.call @cc_make_string(%2245, %2246) : (!llvm.ptr, i64) -> i64
      %2248 = func.call @cc_intern(%2244, %2247) : (i64, i64) -> i64
      %2249 = func.call @cc_nil_value() : () -> i64
      %2250 = func.call @cc_cons(%2248, %2249) : (i64, i64) -> i64
      %2251 = func.call @cc_values_pack(%2250) : (i64) -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2254 = arith.constant 4 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      %2256 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2257 = arith.constant 7 : i64
      %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
      %2259 = func.call @cc_intern(%2255, %2258) : (i64, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_cons(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_values_pack(%2261) : (i64) -> i64
      %2263 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2264 = arith.constant 6 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = func.call @cc_nil_value() : () -> i64
      %2267 = func.call @cc_intern(%2265, %2266) : (i64, i64) -> i64
      %2268 = func.call @cc_nil_value() : () -> i64
      %2269 = func.call @cc_cons(%2267, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_values_pack(%2269) : (i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2271 = arith.addi %2267, %__rlasp_stack_elide_zero_99 : i64
      %2272 = func.call @cc_nil_value() : () -> i64
      %2273 = func.call @cc_errorp(%2049) : (i64) -> i64
      %2274 = arith.cmpi ne, %2273, %2272 : i64
      %2275 = arith.cmpi eq, %2272, %2272 : i64
      %2276 = arith.andi %2274, %2275 : i1
      %2277 = scf.if %2276 -> (i64) {
        scf.yield %2049 : i64
      } else {
        scf.yield %2272 : i64
      }
      %2278 = func.call @cc_errorp(%2162) : (i64) -> i64
      %2279 = arith.cmpi ne, %2278, %2272 : i64
      %2280 = arith.cmpi eq, %2277, %2272 : i64
      %2281 = arith.andi %2279, %2280 : i1
      %2282 = scf.if %2281 -> (i64) {
        scf.yield %2162 : i64
      } else {
        scf.yield %2277 : i64
      }
      %2283 = func.call @cc_errorp(%2229) : (i64) -> i64
      %2284 = arith.cmpi ne, %2283, %2272 : i64
      %2285 = arith.cmpi eq, %2282, %2272 : i64
      %2286 = arith.andi %2284, %2285 : i1
      %2287 = scf.if %2286 -> (i64) {
        scf.yield %2229 : i64
      } else {
        scf.yield %2282 : i64
      }
      %2288 = func.call @cc_errorp(%2241) : (i64) -> i64
      %2289 = arith.cmpi ne, %2288, %2272 : i64
      %2290 = arith.cmpi eq, %2287, %2272 : i64
      %2291 = arith.andi %2289, %2290 : i1
      %2292 = scf.if %2291 -> (i64) {
        scf.yield %2241 : i64
      } else {
        scf.yield %2287 : i64
      }
      %2293 = func.call @cc_errorp(%2248) : (i64) -> i64
      %2294 = arith.cmpi ne, %2293, %2272 : i64
      %2295 = arith.cmpi eq, %2292, %2272 : i64
      %2296 = arith.andi %2294, %2295 : i1
      %2297 = scf.if %2296 -> (i64) {
        scf.yield %2248 : i64
      } else {
        scf.yield %2292 : i64
      }
      %2298 = func.call @cc_errorp(%2252) : (i64) -> i64
      %2299 = arith.cmpi ne, %2298, %2272 : i64
      %2300 = arith.cmpi eq, %2297, %2272 : i64
      %2301 = arith.andi %2299, %2300 : i1
      %2302 = scf.if %2301 -> (i64) {
        scf.yield %2252 : i64
      } else {
        scf.yield %2297 : i64
      }
      %2303 = func.call @cc_errorp(%2259) : (i64) -> i64
      %2304 = arith.cmpi ne, %2303, %2272 : i64
      %2305 = arith.cmpi eq, %2302, %2272 : i64
      %2306 = arith.andi %2304, %2305 : i1
      %2307 = scf.if %2306 -> (i64) {
        scf.yield %2259 : i64
      } else {
        scf.yield %2302 : i64
      }
      %2308 = func.call @cc_errorp(%2271) : (i64) -> i64
      %2309 = arith.cmpi ne, %2308, %2272 : i64
      %2310 = arith.cmpi eq, %2307, %2272 : i64
      %2311 = arith.andi %2309, %2310 : i1
      %2312 = scf.if %2311 -> (i64) {
        scf.yield %2271 : i64
      } else {
        scf.yield %2307 : i64
      }
      %2313 = arith.cmpi ne, %2312, %2272 : i64
      scf.if %2313 {
        func.call @stack_push_pointer(%2312) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2049) : (i64) -> ()
        func.call @stack_push_pointer(%2162) : (i64) -> ()
        func.call @stack_push_pointer(%2229) : (i64) -> ()
        func.call @stack_push_pointer(%2241) : (i64) -> ()
        func.call @stack_push_pointer(%2248) : (i64) -> ()
        func.call @stack_push_pointer(%2252) : (i64) -> ()
        func.call @stack_push_pointer(%2259) : (i64) -> ()
        func.call @stack_push_pointer(%2271) : (i64) -> ()
        %2314 = llvm.mlir.addressof @str219 : !llvm.ptr
        %2315 = func.call @cc_make_function_ref_const(%2314) : (!llvm.ptr) -> i64
        %2316 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2315, %2316) : (i64, i64) -> ()
      }
      %2317 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2317 : i64
    }
    %2318 = func.call @cc_nil_value() : () -> i64
    %2319 = func.call @cc_errorp(%2040) : (i64) -> i64
    %2320 = arith.cmpi ne, %2319, %2318 : i64
    %2321 = scf.if %2320 -> (i64) {
      scf.yield %2040 : i64
    } else {
      %2322 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2323 = arith.constant 24 : i64
      %2324 = func.call @cc_make_string(%2322, %2323) : (!llvm.ptr, i64) -> i64
      %2325 = func.call @cc_nil_value() : () -> i64
      %2326 = func.call @cc_intern(%2324, %2325) : (i64, i64) -> i64
      %2327 = func.call @cc_nil_value() : () -> i64
      %2328 = func.call @cc_cons(%2326, %2327) : (i64, i64) -> i64
      %2329 = func.call @cc_values_pack(%2328) : (i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2330 = arith.addi %2326, %__rlasp_stack_elide_zero_100 : i64
      %2331 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2332 = arith.constant 3 : i64
      %2333 = func.call @cc_make_string(%2331, %2332) : (!llvm.ptr, i64) -> i64
      %2334 = func.call @cc_nil_value() : () -> i64
      %2335 = func.call @cc_intern(%2333, %2334) : (i64, i64) -> i64
      %2336 = func.call @cc_nil_value() : () -> i64
      %2337 = func.call @cc_cons(%2335, %2336) : (i64, i64) -> i64
      %2338 = func.call @cc_values_pack(%2337) : (i64) -> i64
      func.call @stack_push_pointer(%2335) : (i64) -> ()
      %2339 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2340 = arith.constant 3 : i64
      %2341 = func.call @cc_make_string(%2339, %2340) : (!llvm.ptr, i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_intern(%2341, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_nil_value() : () -> i64
      %2345 = func.call @cc_cons(%2343, %2344) : (i64, i64) -> i64
      %2346 = func.call @cc_values_pack(%2345) : (i64) -> i64
      func.call @stack_push_pointer(%2343) : (i64) -> ()
      %2347 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2348 = arith.constant 17 : i64
      %2349 = func.call @cc_make_string(%2347, %2348) : (!llvm.ptr, i64) -> i64
      %2350 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2351 = arith.constant 3 : i64
      %2352 = func.call @cc_make_string(%2350, %2351) : (!llvm.ptr, i64) -> i64
      %2353 = func.call @cc_intern(%2349, %2352) : (i64, i64) -> i64
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = func.call @cc_cons(%2353, %2354) : (i64, i64) -> i64
      %2356 = func.call @cc_values_pack(%2355) : (i64) -> i64
      func.call @stack_push_pointer(%2353) : (i64) -> ()
      %2357 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2358 = arith.constant 5 : i64
      %2359 = func.call @cc_make_string(%2357, %2358) : (!llvm.ptr, i64) -> i64
      %2360 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2361 = arith.constant 11 : i64
      %2362 = func.call @cc_make_string(%2360, %2361) : (!llvm.ptr, i64) -> i64
      %2363 = func.call @cc_intern(%2359, %2362) : (i64, i64) -> i64
      %2364 = func.call @cc_nil_value() : () -> i64
      %2365 = func.call @cc_cons(%2363, %2364) : (i64, i64) -> i64
      %2366 = func.call @cc_values_pack(%2365) : (i64) -> i64
      func.call @stack_push_pointer(%2363) : (i64) -> ()
      %2367 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2368 = arith.constant 15 : i64
      %2369 = func.call @cc_make_string(%2367, %2368) : (!llvm.ptr, i64) -> i64
      %2370 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2371 = arith.constant 3 : i64
      %2372 = func.call @cc_make_string(%2370, %2371) : (!llvm.ptr, i64) -> i64
      %2373 = func.call @cc_intern(%2369, %2372) : (i64, i64) -> i64
      %2374 = func.call @cc_nil_value() : () -> i64
      %2375 = func.call @cc_cons(%2373, %2374) : (i64, i64) -> i64
      %2376 = func.call @cc_values_pack(%2375) : (i64) -> i64
      func.call @stack_push_pointer(%2373) : (i64) -> ()
      %2377 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2377) : (i64) -> ()
      %2378 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2379 = arith.constant 14 : i64
      %2380 = func.call @cc_make_string(%2378, %2379) : (!llvm.ptr, i64) -> i64
      %2381 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2382 = arith.constant 11 : i64
      %2383 = func.call @cc_make_string(%2381, %2382) : (!llvm.ptr, i64) -> i64
      %2384 = func.call @cc_intern(%2380, %2383) : (i64, i64) -> i64
      %2385 = func.call @cc_nil_value() : () -> i64
      %2386 = func.call @cc_cons(%2384, %2385) : (i64, i64) -> i64
      %2387 = func.call @cc_values_pack(%2386) : (i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2388 = arith.addi %2384, %__rlasp_stack_elide_zero_101 : i64
      %2389 = func.call @stack_pop_pointer() : () -> i64
      %2390 = func.call @cc_cons(%2388, %2389) : (i64, i64) -> i64
      %2391 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2392 = arith.constant 5 : i64
      %2393 = func.call @cc_make_string(%2391, %2392) : (!llvm.ptr, i64) -> i64
      %2394 = func.call @cc_nil_value() : () -> i64
      %2395 = func.call @cc_intern(%2393, %2394) : (i64, i64) -> i64
      %2396 = func.call @cc_nil_value() : () -> i64
      %2397 = func.call @cc_cons(%2395, %2396) : (i64, i64) -> i64
      %2398 = func.call @cc_values_pack(%2397) : (i64) -> i64
      %2399 = func.call @cc_cons(%2395, %2390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2399) : (i64) -> ()
      %2400 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2401 = arith.constant 8 : i64
      %2402 = func.call @cc_make_string(%2400, %2401) : (!llvm.ptr, i64) -> i64
      %2403 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2404 = arith.constant 7 : i64
      %2405 = func.call @cc_make_string(%2403, %2404) : (!llvm.ptr, i64) -> i64
      %2406 = func.call @cc_intern(%2402, %2405) : (i64, i64) -> i64
      %2407 = func.call @cc_nil_value() : () -> i64
      %2408 = func.call @cc_cons(%2406, %2407) : (i64, i64) -> i64
      %2409 = func.call @cc_values_pack(%2408) : (i64) -> i64
      func.call @stack_push_pointer(%2406) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2410 = func.call @stack_pop_pointer() : () -> i64
      %2411 = func.call @stack_pop_pointer() : () -> i64
      %2412 = func.call @cc_cons(%2411, %2410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2413 = arith.addi %2412, %__rlasp_stack_elide_zero_102 : i64
      %2414 = func.call @stack_pop_pointer() : () -> i64
      %2415 = func.call @cc_cons(%2414, %2413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2416 = arith.addi %2415, %__rlasp_stack_elide_zero_103 : i64
      %2417 = func.call @stack_pop_pointer() : () -> i64
      %2418 = func.call @cc_cons(%2417, %2416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2419 = func.call @stack_pop_pointer() : () -> i64
      %2420 = func.call @stack_pop_pointer() : () -> i64
      %2421 = func.call @cc_cons(%2420, %2419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2422 = arith.addi %2421, %__rlasp_stack_elide_zero_104 : i64
      %2423 = func.call @stack_pop_pointer() : () -> i64
      %2424 = func.call @cc_cons(%2423, %2422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2425 = func.call @stack_pop_pointer() : () -> i64
      %2426 = func.call @stack_pop_pointer() : () -> i64
      %2427 = func.call @cc_cons(%2426, %2425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2428 = arith.addi %2427, %__rlasp_stack_elide_zero_105 : i64
      %2429 = func.call @stack_pop_pointer() : () -> i64
      %2430 = func.call @cc_cons(%2429, %2428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2431 = func.call @stack_pop_pointer() : () -> i64
      %2432 = func.call @stack_pop_pointer() : () -> i64
      %2433 = func.call @cc_cons(%2432, %2431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2434 = arith.addi %2433, %__rlasp_stack_elide_zero_106 : i64
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @cc_cons(%2435, %2434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2437 = func.call @stack_pop_pointer() : () -> i64
      %2438 = func.call @stack_pop_pointer() : () -> i64
      %2439 = func.call @cc_cons(%2438, %2437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2440 = arith.addi %2439, %__rlasp_stack_elide_zero_107 : i64
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @cc_cons(%2441, %2440) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2443 = arith.addi %2442, %__rlasp_stack_elide_zero_108 : i64
      %2507 = arith.constant 261322017079305 : i64
      %2508 = arith.constant 0 : i64
      %2509 = func.call @cc_make_closure(%2507, %2508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2510 = arith.addi %2509, %__rlasp_stack_elide_zero_109 : i64
      %2511 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2512 = arith.constant 1 : i64
      %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
      %2514 = func.call @cc_nil_value() : () -> i64
      %2515 = func.call @cc_intern(%2513, %2514) : (i64, i64) -> i64
      %2516 = func.call @cc_nil_value() : () -> i64
      %2517 = func.call @cc_cons(%2515, %2516) : (i64, i64) -> i64
      %2518 = func.call @cc_values_pack(%2517) : (i64) -> i64
      func.call @stack_push_pointer(%2515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2519 = func.call @stack_pop_pointer() : () -> i64
      %2520 = func.call @stack_pop_pointer() : () -> i64
      %2521 = func.call @cc_cons(%2520, %2519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2522 = arith.addi %2521, %__rlasp_stack_elide_zero_110 : i64
      %2523 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2524 = arith.constant 11 : i64
      %2525 = func.call @cc_make_string(%2523, %2524) : (!llvm.ptr, i64) -> i64
      %2526 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2527 = arith.constant 7 : i64
      %2528 = func.call @cc_make_string(%2526, %2527) : (!llvm.ptr, i64) -> i64
      %2529 = func.call @cc_intern(%2525, %2528) : (i64, i64) -> i64
      %2530 = func.call @cc_nil_value() : () -> i64
      %2531 = func.call @cc_cons(%2529, %2530) : (i64, i64) -> i64
      %2532 = func.call @cc_values_pack(%2531) : (i64) -> i64
      %2533 = func.call @cc_nil_value() : () -> i64
      %2534 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2535 = arith.constant 4 : i64
      %2536 = func.call @cc_make_string(%2534, %2535) : (!llvm.ptr, i64) -> i64
      %2537 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2538 = arith.constant 7 : i64
      %2539 = func.call @cc_make_string(%2537, %2538) : (!llvm.ptr, i64) -> i64
      %2540 = func.call @cc_intern(%2536, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_nil_value() : () -> i64
      %2542 = func.call @cc_cons(%2540, %2541) : (i64, i64) -> i64
      %2543 = func.call @cc_values_pack(%2542) : (i64) -> i64
      %2544 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2545 = arith.constant 6 : i64
      %2546 = func.call @cc_make_string(%2544, %2545) : (!llvm.ptr, i64) -> i64
      %2547 = func.call @cc_nil_value() : () -> i64
      %2548 = func.call @cc_intern(%2546, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_nil_value() : () -> i64
      %2550 = func.call @cc_cons(%2548, %2549) : (i64, i64) -> i64
      %2551 = func.call @cc_values_pack(%2550) : (i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2552 = arith.addi %2548, %__rlasp_stack_elide_zero_111 : i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = func.call @cc_errorp(%2330) : (i64) -> i64
      %2555 = arith.cmpi ne, %2554, %2553 : i64
      %2556 = arith.cmpi eq, %2553, %2553 : i64
      %2557 = arith.andi %2555, %2556 : i1
      %2558 = scf.if %2557 -> (i64) {
        scf.yield %2330 : i64
      } else {
        scf.yield %2553 : i64
      }
      %2559 = func.call @cc_errorp(%2443) : (i64) -> i64
      %2560 = arith.cmpi ne, %2559, %2553 : i64
      %2561 = arith.cmpi eq, %2558, %2553 : i64
      %2562 = arith.andi %2560, %2561 : i1
      %2563 = scf.if %2562 -> (i64) {
        scf.yield %2443 : i64
      } else {
        scf.yield %2558 : i64
      }
      %2564 = func.call @cc_errorp(%2510) : (i64) -> i64
      %2565 = arith.cmpi ne, %2564, %2553 : i64
      %2566 = arith.cmpi eq, %2563, %2553 : i64
      %2567 = arith.andi %2565, %2566 : i1
      %2568 = scf.if %2567 -> (i64) {
        scf.yield %2510 : i64
      } else {
        scf.yield %2563 : i64
      }
      %2569 = func.call @cc_errorp(%2522) : (i64) -> i64
      %2570 = arith.cmpi ne, %2569, %2553 : i64
      %2571 = arith.cmpi eq, %2568, %2553 : i64
      %2572 = arith.andi %2570, %2571 : i1
      %2573 = scf.if %2572 -> (i64) {
        scf.yield %2522 : i64
      } else {
        scf.yield %2568 : i64
      }
      %2574 = func.call @cc_errorp(%2529) : (i64) -> i64
      %2575 = arith.cmpi ne, %2574, %2553 : i64
      %2576 = arith.cmpi eq, %2573, %2553 : i64
      %2577 = arith.andi %2575, %2576 : i1
      %2578 = scf.if %2577 -> (i64) {
        scf.yield %2529 : i64
      } else {
        scf.yield %2573 : i64
      }
      %2579 = func.call @cc_errorp(%2533) : (i64) -> i64
      %2580 = arith.cmpi ne, %2579, %2553 : i64
      %2581 = arith.cmpi eq, %2578, %2553 : i64
      %2582 = arith.andi %2580, %2581 : i1
      %2583 = scf.if %2582 -> (i64) {
        scf.yield %2533 : i64
      } else {
        scf.yield %2578 : i64
      }
      %2584 = func.call @cc_errorp(%2540) : (i64) -> i64
      %2585 = arith.cmpi ne, %2584, %2553 : i64
      %2586 = arith.cmpi eq, %2583, %2553 : i64
      %2587 = arith.andi %2585, %2586 : i1
      %2588 = scf.if %2587 -> (i64) {
        scf.yield %2540 : i64
      } else {
        scf.yield %2583 : i64
      }
      %2589 = func.call @cc_errorp(%2552) : (i64) -> i64
      %2590 = arith.cmpi ne, %2589, %2553 : i64
      %2591 = arith.cmpi eq, %2588, %2553 : i64
      %2592 = arith.andi %2590, %2591 : i1
      %2593 = scf.if %2592 -> (i64) {
        scf.yield %2552 : i64
      } else {
        scf.yield %2588 : i64
      }
      %2594 = arith.cmpi ne, %2593, %2553 : i64
      scf.if %2594 {
        func.call @stack_push_pointer(%2593) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2330) : (i64) -> ()
        func.call @stack_push_pointer(%2443) : (i64) -> ()
        func.call @stack_push_pointer(%2510) : (i64) -> ()
        func.call @stack_push_pointer(%2522) : (i64) -> ()
        func.call @stack_push_pointer(%2529) : (i64) -> ()
        func.call @stack_push_pointer(%2533) : (i64) -> ()
        func.call @stack_push_pointer(%2540) : (i64) -> ()
        func.call @stack_push_pointer(%2552) : (i64) -> ()
        %2595 = llvm.mlir.addressof @str246 : !llvm.ptr
        %2596 = func.call @cc_make_function_ref_const(%2595) : (!llvm.ptr) -> i64
        %2597 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2596, %2597) : (i64, i64) -> ()
      }
      %2598 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2598 : i64
    }
    %2599 = func.call @cc_nil_value() : () -> i64
    %2600 = func.call @cc_errorp(%2321) : (i64) -> i64
    %2601 = arith.cmpi ne, %2600, %2599 : i64
    %2602 = scf.if %2601 -> (i64) {
      scf.yield %2321 : i64
    } else {
      %2603 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2604 = arith.constant 23 : i64
      %2605 = func.call @cc_make_string(%2603, %2604) : (!llvm.ptr, i64) -> i64
      %2606 = func.call @cc_nil_value() : () -> i64
      %2607 = func.call @cc_intern(%2605, %2606) : (i64, i64) -> i64
      %2608 = func.call @cc_nil_value() : () -> i64
      %2609 = func.call @cc_cons(%2607, %2608) : (i64, i64) -> i64
      %2610 = func.call @cc_values_pack(%2609) : (i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2611 = arith.addi %2607, %__rlasp_stack_elide_zero_112 : i64
      %2612 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2613 = arith.constant 3 : i64
      %2614 = func.call @cc_make_string(%2612, %2613) : (!llvm.ptr, i64) -> i64
      %2615 = func.call @cc_nil_value() : () -> i64
      %2616 = func.call @cc_intern(%2614, %2615) : (i64, i64) -> i64
      %2617 = func.call @cc_nil_value() : () -> i64
      %2618 = func.call @cc_cons(%2616, %2617) : (i64, i64) -> i64
      %2619 = func.call @cc_values_pack(%2618) : (i64) -> i64
      func.call @stack_push_pointer(%2616) : (i64) -> ()
      %2620 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2621 = arith.constant 3 : i64
      %2622 = func.call @cc_make_string(%2620, %2621) : (!llvm.ptr, i64) -> i64
      %2623 = func.call @cc_nil_value() : () -> i64
      %2624 = func.call @cc_intern(%2622, %2623) : (i64, i64) -> i64
      %2625 = func.call @cc_nil_value() : () -> i64
      %2626 = func.call @cc_cons(%2624, %2625) : (i64, i64) -> i64
      %2627 = func.call @cc_values_pack(%2626) : (i64) -> i64
      func.call @stack_push_pointer(%2624) : (i64) -> ()
      %2628 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2629 = arith.constant 4 : i64
      %2630 = func.call @cc_make_string(%2628, %2629) : (!llvm.ptr, i64) -> i64
      %2631 = func.call @cc_nil_value() : () -> i64
      %2632 = func.call @cc_intern(%2630, %2631) : (i64, i64) -> i64
      %2633 = func.call @cc_nil_value() : () -> i64
      %2634 = func.call @cc_cons(%2632, %2633) : (i64, i64) -> i64
      %2635 = func.call @cc_values_pack(%2634) : (i64) -> i64
      func.call @stack_push_pointer(%2632) : (i64) -> ()
      %2636 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2637 = arith.constant 6 : i64
      %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
      %2639 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2640 = arith.constant 11 : i64
      %2641 = func.call @cc_make_string(%2639, %2640) : (!llvm.ptr, i64) -> i64
      %2642 = func.call @cc_intern(%2638, %2641) : (i64, i64) -> i64
      %2643 = func.call @cc_nil_value() : () -> i64
      %2644 = func.call @cc_cons(%2642, %2643) : (i64, i64) -> i64
      %2645 = func.call @cc_values_pack(%2644) : (i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2646 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2647 = arith.constant 11 : i64
      %2648 = func.call @cc_make_string(%2646, %2647) : (!llvm.ptr, i64) -> i64
      %2649 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2650 = arith.constant 3 : i64
      %2651 = func.call @cc_make_string(%2649, %2650) : (!llvm.ptr, i64) -> i64
      %2652 = func.call @cc_intern(%2648, %2651) : (i64, i64) -> i64
      %2653 = func.call @cc_nil_value() : () -> i64
      %2654 = func.call @cc_cons(%2652, %2653) : (i64, i64) -> i64
      %2655 = func.call @cc_values_pack(%2654) : (i64) -> i64
      func.call @stack_push_pointer(%2652) : (i64) -> ()
      %2656 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2657 = arith.constant 7 : i64
      %2658 = func.call @cc_make_string(%2656, %2657) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2658) : (i64) -> ()
      %2659 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2660 = arith.constant 4 : i64
      %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
      %2662 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2663 = arith.constant 11 : i64
      %2664 = func.call @cc_make_string(%2662, %2663) : (!llvm.ptr, i64) -> i64
      %2665 = func.call @cc_intern(%2661, %2664) : (i64, i64) -> i64
      %2666 = func.call @cc_nil_value() : () -> i64
      %2667 = func.call @cc_cons(%2665, %2666) : (i64, i64) -> i64
      %2668 = func.call @cc_values_pack(%2667) : (i64) -> i64
      func.call @stack_push_pointer(%2665) : (i64) -> ()
      %2669 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2670 = arith.constant 2 : i64
      %2671 = func.call @cc_make_string(%2669, %2670) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2671) : (i64) -> ()
      %2672 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2673 = arith.constant 16 : i64
      %2674 = func.call @cc_make_string(%2672, %2673) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2675 = func.call @stack_pop_pointer() : () -> i64
      %2676 = func.call @stack_pop_pointer() : () -> i64
      %2677 = func.call @cc_cons(%2676, %2675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2678 = arith.addi %2677, %__rlasp_stack_elide_zero_113 : i64
      %2679 = func.call @stack_pop_pointer() : () -> i64
      %2680 = func.call @cc_cons(%2679, %2678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2681 = arith.addi %2680, %__rlasp_stack_elide_zero_114 : i64
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @cc_cons(%2682, %2681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2684 = func.call @stack_pop_pointer() : () -> i64
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @cc_cons(%2685, %2684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2687 = arith.addi %2686, %__rlasp_stack_elide_zero_115 : i64
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @cc_cons(%2688, %2687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2690 = arith.addi %2689, %__rlasp_stack_elide_zero_116 : i64
      %2691 = func.call @stack_pop_pointer() : () -> i64
      %2692 = func.call @cc_cons(%2691, %2690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2693 = func.call @stack_pop_pointer() : () -> i64
      %2694 = func.call @stack_pop_pointer() : () -> i64
      %2695 = func.call @cc_cons(%2694, %2693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2696 = arith.addi %2695, %__rlasp_stack_elide_zero_117 : i64
      %2697 = func.call @stack_pop_pointer() : () -> i64
      %2698 = func.call @cc_cons(%2697, %2696) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2698) : (i64) -> ()
      %2699 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2700 = arith.constant 6 : i64
      %2701 = func.call @cc_make_string(%2699, %2700) : (!llvm.ptr, i64) -> i64
      %2702 = func.call @cc_nil_value() : () -> i64
      %2703 = func.call @cc_intern(%2701, %2702) : (i64, i64) -> i64
      %2704 = func.call @cc_nil_value() : () -> i64
      %2705 = func.call @cc_cons(%2703, %2704) : (i64, i64) -> i64
      %2706 = func.call @cc_values_pack(%2705) : (i64) -> i64
      func.call @stack_push_pointer(%2703) : (i64) -> ()
      %2707 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2708 = arith.constant 9 : i64
      %2709 = func.call @cc_make_string(%2707, %2708) : (!llvm.ptr, i64) -> i64
      %2710 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2711 = arith.constant 11 : i64
      %2712 = func.call @cc_make_string(%2710, %2711) : (!llvm.ptr, i64) -> i64
      %2713 = func.call @cc_intern(%2709, %2712) : (i64, i64) -> i64
      %2714 = func.call @cc_nil_value() : () -> i64
      %2715 = func.call @cc_cons(%2713, %2714) : (i64, i64) -> i64
      %2716 = func.call @cc_values_pack(%2715) : (i64) -> i64
      func.call @stack_push_pointer(%2713) : (i64) -> ()
      %2717 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2718 = arith.constant 6 : i64
      %2719 = func.call @cc_make_string(%2717, %2718) : (!llvm.ptr, i64) -> i64
      %2720 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2721 = arith.constant 11 : i64
      %2722 = func.call @cc_make_string(%2720, %2721) : (!llvm.ptr, i64) -> i64
      %2723 = func.call @cc_intern(%2719, %2722) : (i64, i64) -> i64
      %2724 = func.call @cc_nil_value() : () -> i64
      %2725 = func.call @cc_cons(%2723, %2724) : (i64, i64) -> i64
      %2726 = func.call @cc_values_pack(%2725) : (i64) -> i64
      func.call @stack_push_pointer(%2723) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2727 = func.call @stack_pop_pointer() : () -> i64
      %2728 = func.call @stack_pop_pointer() : () -> i64
      %2729 = func.call @cc_cons(%2728, %2727) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2730 = arith.addi %2729, %__rlasp_stack_elide_zero_118 : i64
      %2731 = func.call @stack_pop_pointer() : () -> i64
      %2732 = func.call @cc_cons(%2731, %2730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2732) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2733 = func.call @stack_pop_pointer() : () -> i64
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @cc_cons(%2734, %2733) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2736 = arith.addi %2735, %__rlasp_stack_elide_zero_119 : i64
      %2737 = func.call @stack_pop_pointer() : () -> i64
      %2738 = func.call @cc_cons(%2737, %2736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2738) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2739 = func.call @stack_pop_pointer() : () -> i64
      %2740 = func.call @stack_pop_pointer() : () -> i64
      %2741 = func.call @cc_cons(%2740, %2739) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2742 = arith.addi %2741, %__rlasp_stack_elide_zero_120 : i64
      %2743 = func.call @stack_pop_pointer() : () -> i64
      %2744 = func.call @cc_cons(%2743, %2742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2744) : (i64) -> ()
      %2745 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2746 = arith.constant 5 : i64
      %2747 = func.call @cc_make_string(%2745, %2746) : (!llvm.ptr, i64) -> i64
      %2748 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2749 = arith.constant 11 : i64
      %2750 = func.call @cc_make_string(%2748, %2749) : (!llvm.ptr, i64) -> i64
      %2751 = func.call @cc_intern(%2747, %2750) : (i64, i64) -> i64
      %2752 = func.call @cc_nil_value() : () -> i64
      %2753 = func.call @cc_cons(%2751, %2752) : (i64, i64) -> i64
      %2754 = func.call @cc_values_pack(%2753) : (i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      %2755 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2756 = arith.constant 6 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2759 = arith.constant 11 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = func.call @cc_intern(%2757, %2760) : (i64, i64) -> i64
      %2762 = func.call @cc_nil_value() : () -> i64
      %2763 = func.call @cc_cons(%2761, %2762) : (i64, i64) -> i64
      %2764 = func.call @cc_values_pack(%2763) : (i64) -> i64
      func.call @stack_push_pointer(%2761) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2765 = func.call @stack_pop_pointer() : () -> i64
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @cc_cons(%2766, %2765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2768 = arith.addi %2767, %__rlasp_stack_elide_zero_121 : i64
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @cc_cons(%2769, %2768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2770) : (i64) -> ()
      %2771 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2772 = arith.constant 7 : i64
      %2773 = func.call @cc_make_string(%2771, %2772) : (!llvm.ptr, i64) -> i64
      %2774 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2775 = arith.constant 11 : i64
      %2776 = func.call @cc_make_string(%2774, %2775) : (!llvm.ptr, i64) -> i64
      %2777 = func.call @cc_intern(%2773, %2776) : (i64, i64) -> i64
      %2778 = func.call @cc_nil_value() : () -> i64
      %2779 = func.call @cc_cons(%2777, %2778) : (i64, i64) -> i64
      %2780 = func.call @cc_values_pack(%2779) : (i64) -> i64
      func.call @stack_push_pointer(%2777) : (i64) -> ()
      %2781 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2782 = arith.constant 6 : i64
      %2783 = func.call @cc_make_string(%2781, %2782) : (!llvm.ptr, i64) -> i64
      %2784 = func.call @cc_nil_value() : () -> i64
      %2785 = func.call @cc_intern(%2783, %2784) : (i64, i64) -> i64
      %2786 = func.call @cc_nil_value() : () -> i64
      %2787 = func.call @cc_cons(%2785, %2786) : (i64, i64) -> i64
      %2788 = func.call @cc_values_pack(%2787) : (i64) -> i64
      func.call @stack_push_pointer(%2785) : (i64) -> ()
      %2789 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2790 = arith.constant 11 : i64
      %2791 = func.call @cc_make_string(%2789, %2790) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2791) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2792 = func.call @stack_pop_pointer() : () -> i64
      %2793 = func.call @stack_pop_pointer() : () -> i64
      %2794 = func.call @cc_cons(%2793, %2792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2795 = arith.addi %2794, %__rlasp_stack_elide_zero_122 : i64
      %2796 = func.call @stack_pop_pointer() : () -> i64
      %2797 = func.call @cc_cons(%2796, %2795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2798 = arith.addi %2797, %__rlasp_stack_elide_zero_123 : i64
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @cc_cons(%2799, %2798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2800) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2801 = func.call @stack_pop_pointer() : () -> i64
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @cc_cons(%2802, %2801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2804 = arith.addi %2803, %__rlasp_stack_elide_zero_124 : i64
      %2805 = func.call @stack_pop_pointer() : () -> i64
      %2806 = func.call @cc_cons(%2805, %2804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2807 = arith.addi %2806, %__rlasp_stack_elide_zero_125 : i64
      %2808 = func.call @stack_pop_pointer() : () -> i64
      %2809 = func.call @cc_cons(%2808, %2807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2810 = arith.addi %2809, %__rlasp_stack_elide_zero_126 : i64
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2812 = func.call @cc_cons(%2811, %2810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @cc_cons(%2814, %2813) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2816 = arith.addi %2815, %__rlasp_stack_elide_zero_127 : i64
      %2817 = func.call @stack_pop_pointer() : () -> i64
      %2818 = func.call @cc_cons(%2817, %2816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2818) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2819 = func.call @stack_pop_pointer() : () -> i64
      %2820 = func.call @stack_pop_pointer() : () -> i64
      %2821 = func.call @cc_cons(%2820, %2819) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2822 = arith.addi %2821, %__rlasp_stack_elide_zero_128 : i64
      %2823 = func.call @stack_pop_pointer() : () -> i64
      %2824 = func.call @cc_cons(%2823, %2822) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2825 = arith.addi %2824, %__rlasp_stack_elide_zero_129 : i64
      %2930 = arith.constant 261322017079306 : i64
      %2931 = arith.constant 0 : i64
      %2932 = func.call @cc_make_closure(%2930, %2931) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2933 = arith.addi %2932, %__rlasp_stack_elide_zero_130 : i64
      %2934 = llvm.mlir.addressof @str280 : !llvm.ptr
      %2935 = arith.constant 1 : i64
      %2936 = func.call @cc_make_string(%2934, %2935) : (!llvm.ptr, i64) -> i64
      %2937 = func.call @cc_nil_value() : () -> i64
      %2938 = func.call @cc_intern(%2936, %2937) : (i64, i64) -> i64
      %2939 = func.call @cc_nil_value() : () -> i64
      %2940 = func.call @cc_cons(%2938, %2939) : (i64, i64) -> i64
      %2941 = func.call @cc_values_pack(%2940) : (i64) -> i64
      func.call @stack_push_pointer(%2938) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2942 = func.call @stack_pop_pointer() : () -> i64
      %2943 = func.call @stack_pop_pointer() : () -> i64
      %2944 = func.call @cc_cons(%2943, %2942) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2945 = arith.addi %2944, %__rlasp_stack_elide_zero_131 : i64
      %2946 = llvm.mlir.addressof @str281 : !llvm.ptr
      %2947 = arith.constant 11 : i64
      %2948 = func.call @cc_make_string(%2946, %2947) : (!llvm.ptr, i64) -> i64
      %2949 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2950 = arith.constant 7 : i64
      %2951 = func.call @cc_make_string(%2949, %2950) : (!llvm.ptr, i64) -> i64
      %2952 = func.call @cc_intern(%2948, %2951) : (i64, i64) -> i64
      %2953 = func.call @cc_nil_value() : () -> i64
      %2954 = func.call @cc_cons(%2952, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_values_pack(%2954) : (i64) -> i64
      %2956 = func.call @cc_nil_value() : () -> i64
      %2957 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2958 = arith.constant 4 : i64
      %2959 = func.call @cc_make_string(%2957, %2958) : (!llvm.ptr, i64) -> i64
      %2960 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2961 = arith.constant 7 : i64
      %2962 = func.call @cc_make_string(%2960, %2961) : (!llvm.ptr, i64) -> i64
      %2963 = func.call @cc_intern(%2959, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_nil_value() : () -> i64
      %2965 = func.call @cc_cons(%2963, %2964) : (i64, i64) -> i64
      %2966 = func.call @cc_values_pack(%2965) : (i64) -> i64
      %2967 = llvm.mlir.addressof @str285 : !llvm.ptr
      %2968 = arith.constant 6 : i64
      %2969 = func.call @cc_make_string(%2967, %2968) : (!llvm.ptr, i64) -> i64
      %2970 = func.call @cc_nil_value() : () -> i64
      %2971 = func.call @cc_intern(%2969, %2970) : (i64, i64) -> i64
      %2972 = func.call @cc_nil_value() : () -> i64
      %2973 = func.call @cc_cons(%2971, %2972) : (i64, i64) -> i64
      %2974 = func.call @cc_values_pack(%2973) : (i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2975 = arith.addi %2971, %__rlasp_stack_elide_zero_132 : i64
      %2976 = func.call @cc_nil_value() : () -> i64
      %2977 = func.call @cc_errorp(%2611) : (i64) -> i64
      %2978 = arith.cmpi ne, %2977, %2976 : i64
      %2979 = arith.cmpi eq, %2976, %2976 : i64
      %2980 = arith.andi %2978, %2979 : i1
      %2981 = scf.if %2980 -> (i64) {
        scf.yield %2611 : i64
      } else {
        scf.yield %2976 : i64
      }
      %2982 = func.call @cc_errorp(%2825) : (i64) -> i64
      %2983 = arith.cmpi ne, %2982, %2976 : i64
      %2984 = arith.cmpi eq, %2981, %2976 : i64
      %2985 = arith.andi %2983, %2984 : i1
      %2986 = scf.if %2985 -> (i64) {
        scf.yield %2825 : i64
      } else {
        scf.yield %2981 : i64
      }
      %2987 = func.call @cc_errorp(%2933) : (i64) -> i64
      %2988 = arith.cmpi ne, %2987, %2976 : i64
      %2989 = arith.cmpi eq, %2986, %2976 : i64
      %2990 = arith.andi %2988, %2989 : i1
      %2991 = scf.if %2990 -> (i64) {
        scf.yield %2933 : i64
      } else {
        scf.yield %2986 : i64
      }
      %2992 = func.call @cc_errorp(%2945) : (i64) -> i64
      %2993 = arith.cmpi ne, %2992, %2976 : i64
      %2994 = arith.cmpi eq, %2991, %2976 : i64
      %2995 = arith.andi %2993, %2994 : i1
      %2996 = scf.if %2995 -> (i64) {
        scf.yield %2945 : i64
      } else {
        scf.yield %2991 : i64
      }
      %2997 = func.call @cc_errorp(%2952) : (i64) -> i64
      %2998 = arith.cmpi ne, %2997, %2976 : i64
      %2999 = arith.cmpi eq, %2996, %2976 : i64
      %3000 = arith.andi %2998, %2999 : i1
      %3001 = scf.if %3000 -> (i64) {
        scf.yield %2952 : i64
      } else {
        scf.yield %2996 : i64
      }
      %3002 = func.call @cc_errorp(%2956) : (i64) -> i64
      %3003 = arith.cmpi ne, %3002, %2976 : i64
      %3004 = arith.cmpi eq, %3001, %2976 : i64
      %3005 = arith.andi %3003, %3004 : i1
      %3006 = scf.if %3005 -> (i64) {
        scf.yield %2956 : i64
      } else {
        scf.yield %3001 : i64
      }
      %3007 = func.call @cc_errorp(%2963) : (i64) -> i64
      %3008 = arith.cmpi ne, %3007, %2976 : i64
      %3009 = arith.cmpi eq, %3006, %2976 : i64
      %3010 = arith.andi %3008, %3009 : i1
      %3011 = scf.if %3010 -> (i64) {
        scf.yield %2963 : i64
      } else {
        scf.yield %3006 : i64
      }
      %3012 = func.call @cc_errorp(%2975) : (i64) -> i64
      %3013 = arith.cmpi ne, %3012, %2976 : i64
      %3014 = arith.cmpi eq, %3011, %2976 : i64
      %3015 = arith.andi %3013, %3014 : i1
      %3016 = scf.if %3015 -> (i64) {
        scf.yield %2975 : i64
      } else {
        scf.yield %3011 : i64
      }
      %3017 = arith.cmpi ne, %3016, %2976 : i64
      scf.if %3017 {
        func.call @stack_push_pointer(%3016) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2611) : (i64) -> ()
        func.call @stack_push_pointer(%2825) : (i64) -> ()
        func.call @stack_push_pointer(%2933) : (i64) -> ()
        func.call @stack_push_pointer(%2945) : (i64) -> ()
        func.call @stack_push_pointer(%2952) : (i64) -> ()
        func.call @stack_push_pointer(%2956) : (i64) -> ()
        func.call @stack_push_pointer(%2963) : (i64) -> ()
        func.call @stack_push_pointer(%2975) : (i64) -> ()
        %3018 = llvm.mlir.addressof @str286 : !llvm.ptr
        %3019 = func.call @cc_make_function_ref_const(%3018) : (!llvm.ptr) -> i64
        %3020 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3019, %3020) : (i64, i64) -> ()
      }
      %3021 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3021 : i64
    }
    %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
    %3022 = arith.addi %2602, %__rlasp_stack_elide_zero_133 : i64
    %3023 = func.call @cc_multiple_value_list(%3022) : (i64) -> i64
    %3024 = llvm.mlir.addressof @str287 : !llvm.ptr
    %3025 = arith.constant 38 : i64
    %3026 = func.call @cc_make_string(%3024, %3025) : (!llvm.ptr, i64) -> i64
    %3027 = func.call @cc_nil_value() : () -> i64
    %3028 = func.call @cc_intern(%3026, %3027) : (i64, i64) -> i64
    %3029 = func.call @cc_nil_value() : () -> i64
    %3030 = func.call @cc_cons(%3028, %3029) : (i64, i64) -> i64
    %3031 = func.call @cc_values_pack(%3030) : (i64) -> i64
    %3032 = func.call @cc_symbol_value(%3028) : (i64) -> i64
    %3033 = llvm.mlir.addressof @str288 : !llvm.ptr
    %3034 = arith.constant 40 : i64
    %3035 = func.call @cc_make_string(%3033, %3034) : (!llvm.ptr, i64) -> i64
    %3036 = func.call @cc_nil_value() : () -> i64
    %3037 = func.call @cc_intern(%3035, %3036) : (i64, i64) -> i64
    %3038 = func.call @cc_nil_value() : () -> i64
    %3039 = func.call @cc_cons(%3037, %3038) : (i64, i64) -> i64
    %3040 = func.call @cc_values_pack(%3039) : (i64) -> i64
    %3041 = func.call @cc_symbol_value(%3037) : (i64) -> i64
    %3042 = func.call @cc_nil_value() : () -> i64
    %3043 = arith.cmpi ne, %3032, %3042 : i64
    %3044 = scf.if %3043 -> (i64) {
      scf.yield %3041 : i64
    } else {
      scf.yield %3023 : i64
    }
    %3045 = func.call @cc_values_pack(%3044) : (i64) -> i64
    func.call @stack_push_pointer(%3045) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079297"() {
    %194 = func.call @cc_nil_value() : () -> i64
    %195 = func.call @cc_nil_value() : () -> i64
    %196 = func.call @cc_errorp(%194) : (i64) -> i64
    %197 = arith.cmpi ne, %196, %195 : i64
    %198 = scf.if %197 -> (i64) {
      scf.yield %194 : i64
    } else {
      %199 = llvm.mlir.addressof @str21 : !llvm.ptr
      %200 = arith.constant 4 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = llvm.mlir.addressof @str22 : !llvm.ptr
      %203 = arith.constant 11 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = func.call @cc_intern(%201, %204) : (i64, i64) -> i64
      %206 = func.call @cc_nil_value() : () -> i64
      %207 = func.call @cc_cons(%205, %206) : (i64, i64) -> i64
      %208 = func.call @cc_values_pack(%207) : (i64) -> i64
      func.call @stack_push_pointer(%205) : (i64) -> ()
      %209 = llvm.mlir.addressof @str23 : !llvm.ptr
      %210 = arith.constant 10 : i64
      %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
      %212 = llvm.mlir.addressof @str24 : !llvm.ptr
      %213 = arith.constant 11 : i64
      %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
      %215 = func.call @cc_intern(%211, %214) : (i64, i64) -> i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_cons(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_values_pack(%217) : (i64) -> i64
      func.call @stack_push_pointer(%215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %219 = func.call @stack_pop_pointer() : () -> i64
      %220 = func.call @stack_pop_pointer() : () -> i64
      %221 = func.call @cc_cons(%220, %219) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %222 = arith.addi %221, %__rlasp_stack_elide_zero_134 : i64
      %223 = func.call @stack_pop_pointer() : () -> i64
      %224 = func.call @cc_cons(%223, %222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %225 = arith.addi %224, %__rlasp_stack_elide_zero_135 : i64
      %226 = llvm.mlir.addressof @str25 : !llvm.ptr
      %227 = arith.constant 8 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = llvm.mlir.addressof @str26 : !llvm.ptr
      %230 = arith.constant 7 : i64
      %231 = func.call @cc_make_string(%229, %230) : (!llvm.ptr, i64) -> i64
      %232 = func.call @cc_intern(%228, %231) : (i64, i64) -> i64
      %233 = func.call @cc_nil_value() : () -> i64
      %234 = func.call @cc_cons(%232, %233) : (i64, i64) -> i64
      %235 = func.call @cc_values_pack(%234) : (i64) -> i64
      %236 = func.call @cc_nil_value() : () -> i64
      %237 = func.call @cc_errorp(%225) : (i64) -> i64
      %238 = arith.cmpi ne, %237, %236 : i64
      %239 = arith.cmpi eq, %236, %236 : i64
      %240 = arith.andi %238, %239 : i1
      %241 = scf.if %240 -> (i64) {
        scf.yield %225 : i64
      } else {
        scf.yield %236 : i64
      }
      %242 = func.call @cc_errorp(%232) : (i64) -> i64
      %243 = arith.cmpi ne, %242, %236 : i64
      %244 = arith.cmpi eq, %241, %236 : i64
      %245 = arith.andi %243, %244 : i1
      %246 = scf.if %245 -> (i64) {
        scf.yield %232 : i64
      } else {
        scf.yield %241 : i64
      }
      %247 = arith.cmpi ne, %246, %236 : i64
      scf.if %247 {
        func.call @stack_push_pointer(%246) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%225) : (i64) -> ()
        func.call @stack_push_pointer(%232) : (i64) -> ()
        %248 = llvm.mlir.addressof @str27 : !llvm.ptr
        %249 = func.call @cc_make_function_ref_const(%248) : (!llvm.ptr) -> i64
        %250 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%249, %250) : (i64, i64) -> ()
      }
      %251 = func.call @stack_pop_pointer() : () -> i64
      %252 = func.call @cc_car(%251) : (i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %253 = arith.addi %252, %__rlasp_stack_elide_zero_136 : i64
      %254 = func.call @cc_nil_value() : () -> i64
      %255 = func.call @cc_errorp(%253) : (i64) -> i64
      %256 = arith.cmpi ne, %255, %254 : i64
      %257 = arith.cmpi eq, %254, %254 : i64
      %258 = arith.andi %256, %257 : i1
      %259 = scf.if %258 -> (i64) {
        scf.yield %253 : i64
      } else {
        scf.yield %254 : i64
      }
      %260 = arith.cmpi ne, %259, %254 : i64
      scf.if %260 {
        func.call @stack_push_pointer(%259) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%253) : (i64) -> ()
        %261 = llvm.mlir.addressof @str28 : !llvm.ptr
        %262 = func.call @cc_make_function_ref_const(%261) : (!llvm.ptr) -> i64
        %263 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%262, %263) : (i64, i64) -> ()
      }
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = func.call @cc_nil_value() : () -> i64
      %266 = func.call @cc_cons(%264, %265) : (i64, i64) -> i64
      %267 = func.call @cc_not(%266) : (i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %268 = arith.addi %267, %__rlasp_stack_elide_zero_137 : i64
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
      %271 = func.call @cc_not(%270) : (i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %272 = arith.addi %271, %__rlasp_stack_elide_zero_138 : i64
      scf.yield %272 : i64
    }
    func.call @stack_push_pointer(%198) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079298"() {
    %491 = func.call @cc_nil_value() : () -> i64
    %492 = func.call @cc_nil_value() : () -> i64
    %493 = func.call @cc_errorp(%491) : (i64) -> i64
    %494 = arith.cmpi ne, %493, %492 : i64
    %495 = scf.if %494 -> (i64) {
      scf.yield %491 : i64
    } else {
      %496 = llvm.mlir.addressof @str50 : !llvm.ptr
      %497 = arith.constant 10 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = llvm.mlir.addressof @str51 : !llvm.ptr
      %500 = arith.constant 11 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = func.call @cc_intern(%498, %501) : (i64, i64) -> i64
      %503 = func.call @cc_nil_value() : () -> i64
      %504 = func.call @cc_cons(%502, %503) : (i64, i64) -> i64
      %505 = func.call @cc_values_pack(%504) : (i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %506 = arith.addi %502, %__rlasp_stack_elide_zero_139 : i64
      %507 = llvm.mlir.addressof @str52 : !llvm.ptr
      %508 = arith.constant 8 : i64
      %509 = func.call @cc_make_string(%507, %508) : (!llvm.ptr, i64) -> i64
      %510 = llvm.mlir.addressof @str53 : !llvm.ptr
      %511 = arith.constant 7 : i64
      %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
      %513 = func.call @cc_intern(%509, %512) : (i64, i64) -> i64
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = func.call @cc_cons(%513, %514) : (i64, i64) -> i64
      %516 = func.call @cc_values_pack(%515) : (i64) -> i64
      %517 = func.call @cc_nil_value() : () -> i64
      %518 = func.call @cc_errorp(%506) : (i64) -> i64
      %519 = arith.cmpi ne, %518, %517 : i64
      %520 = arith.cmpi eq, %517, %517 : i64
      %521 = arith.andi %519, %520 : i1
      %522 = scf.if %521 -> (i64) {
        scf.yield %506 : i64
      } else {
        scf.yield %517 : i64
      }
      %523 = func.call @cc_errorp(%513) : (i64) -> i64
      %524 = arith.cmpi ne, %523, %517 : i64
      %525 = arith.cmpi eq, %522, %517 : i64
      %526 = arith.andi %524, %525 : i1
      %527 = scf.if %526 -> (i64) {
        scf.yield %513 : i64
      } else {
        scf.yield %522 : i64
      }
      %528 = arith.cmpi ne, %527, %517 : i64
      scf.if %528 {
        func.call @stack_push_pointer(%527) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%506) : (i64) -> ()
        func.call @stack_push_pointer(%513) : (i64) -> ()
        %529 = llvm.mlir.addressof @str54 : !llvm.ptr
        %530 = func.call @cc_make_function_ref_const(%529) : (!llvm.ptr) -> i64
        %531 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%530, %531) : (i64, i64) -> ()
      }
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @cc_car(%532) : (i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %534 = arith.addi %533, %__rlasp_stack_elide_zero_140 : i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_errorp(%534) : (i64) -> i64
      %537 = arith.cmpi ne, %536, %535 : i64
      %538 = arith.cmpi eq, %535, %535 : i64
      %539 = arith.andi %537, %538 : i1
      %540 = scf.if %539 -> (i64) {
        scf.yield %534 : i64
      } else {
        scf.yield %535 : i64
      }
      %541 = arith.cmpi ne, %540, %535 : i64
      scf.if %541 {
        func.call @stack_push_pointer(%540) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%534) : (i64) -> ()
        %542 = llvm.mlir.addressof @str55 : !llvm.ptr
        %543 = func.call @cc_make_function_ref_const(%542) : (!llvm.ptr) -> i64
        %544 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%543, %544) : (i64, i64) -> ()
      }
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @cc_nil_value() : () -> i64
      %547 = func.call @cc_cons(%545, %546) : (i64, i64) -> i64
      %548 = func.call @cc_not(%547) : (i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %549 = arith.addi %548, %__rlasp_stack_elide_zero_141 : i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_not(%551) : (i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %553 = arith.addi %552, %__rlasp_stack_elide_zero_142 : i64
      scf.yield %553 : i64
    }
    func.call @stack_push_pointer(%495) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079299"() {
    %772 = func.call @cc_nil_value() : () -> i64
    %773 = func.call @cc_nil_value() : () -> i64
    %774 = func.call @cc_errorp(%772) : (i64) -> i64
    %775 = arith.cmpi ne, %774, %773 : i64
    %776 = scf.if %775 -> (i64) {
      scf.yield %772 : i64
    } else {
      %777 = llvm.mlir.addressof @str77 : !llvm.ptr
      %778 = arith.constant 6 : i64
      %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
      %780 = llvm.mlir.addressof @str78 : !llvm.ptr
      %781 = arith.constant 11 : i64
      %782 = func.call @cc_make_string(%780, %781) : (!llvm.ptr, i64) -> i64
      %783 = func.call @cc_intern(%779, %782) : (i64, i64) -> i64
      %784 = func.call @cc_nil_value() : () -> i64
      %785 = func.call @cc_cons(%783, %784) : (i64, i64) -> i64
      %786 = func.call @cc_values_pack(%785) : (i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %787 = arith.addi %783, %__rlasp_stack_elide_zero_143 : i64
      %788 = llvm.mlir.addressof @str79 : !llvm.ptr
      %789 = arith.constant 5 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str80 : !llvm.ptr
      %792 = arith.constant 7 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      %798 = func.call @cc_nil_value() : () -> i64
      %799 = func.call @cc_errorp(%787) : (i64) -> i64
      %800 = arith.cmpi ne, %799, %798 : i64
      %801 = arith.cmpi eq, %798, %798 : i64
      %802 = arith.andi %800, %801 : i1
      %803 = scf.if %802 -> (i64) {
        scf.yield %787 : i64
      } else {
        scf.yield %798 : i64
      }
      %804 = func.call @cc_errorp(%794) : (i64) -> i64
      %805 = arith.cmpi ne, %804, %798 : i64
      %806 = arith.cmpi eq, %803, %798 : i64
      %807 = arith.andi %805, %806 : i1
      %808 = scf.if %807 -> (i64) {
        scf.yield %794 : i64
      } else {
        scf.yield %803 : i64
      }
      %809 = arith.cmpi ne, %808, %798 : i64
      scf.if %809 {
        func.call @stack_push_pointer(%808) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%787) : (i64) -> ()
        func.call @stack_push_pointer(%794) : (i64) -> ()
        %810 = llvm.mlir.addressof @str81 : !llvm.ptr
        %811 = func.call @cc_make_function_ref_const(%810) : (!llvm.ptr) -> i64
        %812 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%811, %812) : (i64, i64) -> ()
      }
      %813 = func.call @stack_pop_pointer() : () -> i64
      %814 = func.call @cc_car(%813) : (i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %815 = arith.addi %814, %__rlasp_stack_elide_zero_144 : i64
      %816 = func.call @cc_nil_value() : () -> i64
      %817 = func.call @cc_errorp(%815) : (i64) -> i64
      %818 = arith.cmpi ne, %817, %816 : i64
      %819 = arith.cmpi eq, %816, %816 : i64
      %820 = arith.andi %818, %819 : i1
      %821 = scf.if %820 -> (i64) {
        scf.yield %815 : i64
      } else {
        scf.yield %816 : i64
      }
      %822 = arith.cmpi ne, %821, %816 : i64
      scf.if %822 {
        func.call @stack_push_pointer(%821) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%815) : (i64) -> ()
        %823 = llvm.mlir.addressof @str82 : !llvm.ptr
        %824 = func.call @cc_make_function_ref_const(%823) : (!llvm.ptr) -> i64
        %825 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%824, %825) : (i64, i64) -> ()
      }
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = func.call @cc_cons(%826, %827) : (i64, i64) -> i64
      %829 = func.call @cc_not(%828) : (i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %830 = arith.addi %829, %__rlasp_stack_elide_zero_145 : i64
      %831 = func.call @cc_nil_value() : () -> i64
      %832 = func.call @cc_cons(%830, %831) : (i64, i64) -> i64
      %833 = func.call @cc_not(%832) : (i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %834 = arith.addi %833, %__rlasp_stack_elide_zero_146 : i64
      scf.yield %834 : i64
    }
    func.call @stack_push_pointer(%776) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079300"() {
    %1060 = func.call @cc_nil_value() : () -> i64
    %1061 = func.call @cc_nil_value() : () -> i64
    %1062 = func.call @cc_errorp(%1060) : (i64) -> i64
    %1063 = arith.cmpi ne, %1062, %1061 : i64
    %1064 = scf.if %1063 -> (i64) {
      scf.yield %1060 : i64
    } else {
      %1065 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1066 = arith.constant 6 : i64
      %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
      %1068 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1069 = arith.constant 11 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = func.call @cc_intern(%1067, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_nil_value() : () -> i64
      %1073 = func.call @cc_cons(%1071, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_values_pack(%1073) : (i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %1075 = arith.addi %1071, %__rlasp_stack_elide_zero_147 : i64
      %1076 = func.call @cc_nil_value() : () -> i64
      %1077 = func.call @cc_errorp(%1075) : (i64) -> i64
      %1078 = arith.cmpi ne, %1077, %1076 : i64
      %1079 = arith.cmpi eq, %1076, %1076 : i64
      %1080 = arith.andi %1078, %1079 : i1
      %1081 = scf.if %1080 -> (i64) {
        scf.yield %1075 : i64
      } else {
        scf.yield %1076 : i64
      }
      %1082 = arith.cmpi ne, %1081, %1076 : i64
      scf.if %1082 {
        func.call @stack_push_pointer(%1081) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1075) : (i64) -> ()
        %1083 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1084 = func.call @cc_make_function_ref_const(%1083) : (!llvm.ptr) -> i64
        %1085 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1084, %1085) : (i64, i64) -> ()
      }
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = func.call @cc_t_value() : () -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_errorp(%1086) : (i64) -> i64
      %1090 = arith.cmpi ne, %1089, %1088 : i64
      %1091 = arith.cmpi eq, %1088, %1088 : i64
      %1092 = arith.andi %1090, %1091 : i1
      %1093 = scf.if %1092 -> (i64) {
        scf.yield %1086 : i64
      } else {
        scf.yield %1088 : i64
      }
      %1094 = func.call @cc_errorp(%1087) : (i64) -> i64
      %1095 = arith.cmpi ne, %1094, %1088 : i64
      %1096 = arith.cmpi eq, %1093, %1088 : i64
      %1097 = arith.andi %1095, %1096 : i1
      %1098 = scf.if %1097 -> (i64) {
        scf.yield %1087 : i64
      } else {
        scf.yield %1093 : i64
      }
      %1099 = arith.cmpi ne, %1098, %1088 : i64
      scf.if %1099 {
        func.call @stack_push_pointer(%1098) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1086) : (i64) -> ()
        func.call @stack_push_pointer(%1087) : (i64) -> ()
        %1100 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1101 = func.call @cc_make_function_ref_const(%1100) : (!llvm.ptr) -> i64
        %1102 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1101, %1102) : (i64, i64) -> ()
      }
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_car(%1103) : (i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %1105 = arith.addi %1104, %__rlasp_stack_elide_zero_148 : i64
      %1106 = func.call @cc_nil_value() : () -> i64
      %1107 = func.call @cc_errorp(%1105) : (i64) -> i64
      %1108 = arith.cmpi ne, %1107, %1106 : i64
      %1109 = arith.cmpi eq, %1106, %1106 : i64
      %1110 = arith.andi %1108, %1109 : i1
      %1111 = scf.if %1110 -> (i64) {
        scf.yield %1105 : i64
      } else {
        scf.yield %1106 : i64
      }
      %1112 = arith.cmpi ne, %1111, %1106 : i64
      scf.if %1112 {
        func.call @stack_push_pointer(%1111) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1105) : (i64) -> ()
        %1113 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1114 = func.call @cc_make_function_ref_const(%1113) : (!llvm.ptr) -> i64
        %1115 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1114, %1115) : (i64, i64) -> ()
      }
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = func.call @cc_cons(%1116, %1117) : (i64, i64) -> i64
      %1119 = func.call @cc_not(%1118) : (i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %1120 = arith.addi %1119, %__rlasp_stack_elide_zero_149 : i64
      %1121 = func.call @cc_nil_value() : () -> i64
      %1122 = func.call @cc_cons(%1120, %1121) : (i64, i64) -> i64
      %1123 = func.call @cc_not(%1122) : (i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %1124 = arith.addi %1123, %__rlasp_stack_elide_zero_150 : i64
      scf.yield %1124 : i64
    }
    func.call @stack_push_pointer(%1064) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079301"() {
    %1343 = func.call @cc_nil_value() : () -> i64
    %1344 = func.call @cc_nil_value() : () -> i64
    %1345 = func.call @cc_errorp(%1343) : (i64) -> i64
    %1346 = arith.cmpi ne, %1345, %1344 : i64
    %1347 = scf.if %1346 -> (i64) {
      scf.yield %1343 : i64
    } else {
      %1348 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1349 = arith.constant 5 : i64
      %1350 = func.call @cc_make_string(%1348, %1349) : (!llvm.ptr, i64) -> i64
      %1351 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1352 = arith.constant 11 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      %1354 = func.call @cc_intern(%1350, %1353) : (i64, i64) -> i64
      %1355 = func.call @cc_nil_value() : () -> i64
      %1356 = func.call @cc_cons(%1354, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_values_pack(%1356) : (i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %1358 = arith.addi %1354, %__rlasp_stack_elide_zero_151 : i64
      %1359 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1360 = arith.constant 8 : i64
      %1361 = func.call @cc_make_string(%1359, %1360) : (!llvm.ptr, i64) -> i64
      %1362 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1363 = arith.constant 7 : i64
      %1364 = func.call @cc_make_string(%1362, %1363) : (!llvm.ptr, i64) -> i64
      %1365 = func.call @cc_intern(%1361, %1364) : (i64, i64) -> i64
      %1366 = func.call @cc_nil_value() : () -> i64
      %1367 = func.call @cc_cons(%1365, %1366) : (i64, i64) -> i64
      %1368 = func.call @cc_values_pack(%1367) : (i64) -> i64
      %1369 = func.call @cc_nil_value() : () -> i64
      %1370 = func.call @cc_errorp(%1358) : (i64) -> i64
      %1371 = arith.cmpi ne, %1370, %1369 : i64
      %1372 = arith.cmpi eq, %1369, %1369 : i64
      %1373 = arith.andi %1371, %1372 : i1
      %1374 = scf.if %1373 -> (i64) {
        scf.yield %1358 : i64
      } else {
        scf.yield %1369 : i64
      }
      %1375 = func.call @cc_errorp(%1365) : (i64) -> i64
      %1376 = arith.cmpi ne, %1375, %1369 : i64
      %1377 = arith.cmpi eq, %1374, %1369 : i64
      %1378 = arith.andi %1376, %1377 : i1
      %1379 = scf.if %1378 -> (i64) {
        scf.yield %1365 : i64
      } else {
        scf.yield %1374 : i64
      }
      %1380 = arith.cmpi ne, %1379, %1369 : i64
      scf.if %1380 {
        func.call @stack_push_pointer(%1379) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1358) : (i64) -> ()
        func.call @stack_push_pointer(%1365) : (i64) -> ()
        %1381 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1382 = func.call @cc_make_function_ref_const(%1381) : (!llvm.ptr) -> i64
        %1383 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1382, %1383) : (i64, i64) -> ()
      }
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_car(%1384) : (i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %1386 = arith.addi %1385, %__rlasp_stack_elide_zero_152 : i64
      %1387 = func.call @cc_nil_value() : () -> i64
      %1388 = func.call @cc_errorp(%1386) : (i64) -> i64
      %1389 = arith.cmpi ne, %1388, %1387 : i64
      %1390 = arith.cmpi eq, %1387, %1387 : i64
      %1391 = arith.andi %1389, %1390 : i1
      %1392 = scf.if %1391 -> (i64) {
        scf.yield %1386 : i64
      } else {
        scf.yield %1387 : i64
      }
      %1393 = arith.cmpi ne, %1392, %1387 : i64
      scf.if %1393 {
        func.call @stack_push_pointer(%1392) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1386) : (i64) -> ()
        %1394 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1395 = func.call @cc_make_function_ref_const(%1394) : (!llvm.ptr) -> i64
        %1396 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1395, %1396) : (i64, i64) -> ()
      }
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @cc_nil_value() : () -> i64
      %1399 = func.call @cc_cons(%1397, %1398) : (i64, i64) -> i64
      %1400 = func.call @cc_not(%1399) : (i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %1401 = arith.addi %1400, %__rlasp_stack_elide_zero_153 : i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_cons(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_not(%1403) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %1405 = arith.addi %1404, %__rlasp_stack_elide_zero_154 : i64
      scf.yield %1405 : i64
    }
    func.call @stack_push_pointer(%1347) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079302"() {
    %1624 = func.call @cc_nil_value() : () -> i64
    %1625 = func.call @cc_nil_value() : () -> i64
    %1626 = func.call @cc_errorp(%1624) : (i64) -> i64
    %1627 = arith.cmpi ne, %1626, %1625 : i64
    %1628 = scf.if %1627 -> (i64) {
      scf.yield %1624 : i64
    } else {
      %1629 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1630 = arith.constant 5 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1633 = arith.constant 11 : i64
      %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = func.call @cc_intern(%1631, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_values_pack(%1637) : (i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %1639 = arith.addi %1635, %__rlasp_stack_elide_zero_155 : i64
      %1640 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1641 = arith.constant 8 : i64
      %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
      %1643 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1644 = arith.constant 7 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      %1646 = func.call @cc_intern(%1642, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_nil_value() : () -> i64
      %1648 = func.call @cc_cons(%1646, %1647) : (i64, i64) -> i64
      %1649 = func.call @cc_values_pack(%1648) : (i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_errorp(%1639) : (i64) -> i64
      %1652 = arith.cmpi ne, %1651, %1650 : i64
      %1653 = arith.cmpi eq, %1650, %1650 : i64
      %1654 = arith.andi %1652, %1653 : i1
      %1655 = scf.if %1654 -> (i64) {
        scf.yield %1639 : i64
      } else {
        scf.yield %1650 : i64
      }
      %1656 = func.call @cc_errorp(%1646) : (i64) -> i64
      %1657 = arith.cmpi ne, %1656, %1650 : i64
      %1658 = arith.cmpi eq, %1655, %1650 : i64
      %1659 = arith.andi %1657, %1658 : i1
      %1660 = scf.if %1659 -> (i64) {
        scf.yield %1646 : i64
      } else {
        scf.yield %1655 : i64
      }
      %1661 = arith.cmpi ne, %1660, %1650 : i64
      scf.if %1661 {
        func.call @stack_push_pointer(%1660) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1639) : (i64) -> ()
        func.call @stack_push_pointer(%1646) : (i64) -> ()
        %1662 = llvm.mlir.addressof @str161 : !llvm.ptr
        %1663 = func.call @cc_make_function_ref_const(%1662) : (!llvm.ptr) -> i64
        %1664 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1663, %1664) : (i64, i64) -> ()
      }
      %1665 = func.call @stack_pop_pointer() : () -> i64
      %1666 = func.call @cc_car(%1665) : (i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %1667 = arith.addi %1666, %__rlasp_stack_elide_zero_156 : i64
      %1668 = func.call @cc_nil_value() : () -> i64
      %1669 = func.call @cc_errorp(%1667) : (i64) -> i64
      %1670 = arith.cmpi ne, %1669, %1668 : i64
      %1671 = arith.cmpi eq, %1668, %1668 : i64
      %1672 = arith.andi %1670, %1671 : i1
      %1673 = scf.if %1672 -> (i64) {
        scf.yield %1667 : i64
      } else {
        scf.yield %1668 : i64
      }
      %1674 = arith.cmpi ne, %1673, %1668 : i64
      scf.if %1674 {
        func.call @stack_push_pointer(%1673) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1667) : (i64) -> ()
        %1675 = llvm.mlir.addressof @str162 : !llvm.ptr
        %1676 = func.call @cc_make_function_ref_const(%1675) : (!llvm.ptr) -> i64
        %1677 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1676, %1677) : (i64, i64) -> ()
      }
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_nil_value() : () -> i64
      %1680 = func.call @cc_cons(%1678, %1679) : (i64, i64) -> i64
      %1681 = func.call @cc_not(%1680) : (i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %1682 = arith.addi %1681, %__rlasp_stack_elide_zero_157 : i64
      %1683 = func.call @cc_nil_value() : () -> i64
      %1684 = func.call @cc_cons(%1682, %1683) : (i64, i64) -> i64
      %1685 = func.call @cc_not(%1684) : (i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %1686 = arith.addi %1685, %__rlasp_stack_elide_zero_158 : i64
      scf.yield %1686 : i64
    }
    func.call @stack_push_pointer(%1628) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079303"() {
    %1899 = func.call @cc_nil_value() : () -> i64
    %1900 = func.call @cc_nil_value() : () -> i64
    %1901 = func.call @cc_errorp(%1899) : (i64) -> i64
    %1902 = arith.cmpi ne, %1901, %1900 : i64
    %1903 = scf.if %1902 -> (i64) {
      scf.yield %1899 : i64
    } else {
      %1904 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1905 = func.call @cc_make_function_ref_const(%1904) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %1906 = arith.addi %1905, %__rlasp_stack_elide_zero_159 : i64
      %1907 = func.call @cc_t_value() : () -> i64
      %1908 = func.call @cc_nil_value() : () -> i64
      %1909 = func.call @cc_errorp(%1906) : (i64) -> i64
      %1910 = arith.cmpi ne, %1909, %1908 : i64
      %1911 = arith.cmpi eq, %1908, %1908 : i64
      %1912 = arith.andi %1910, %1911 : i1
      %1913 = scf.if %1912 -> (i64) {
        scf.yield %1906 : i64
      } else {
        scf.yield %1908 : i64
      }
      %1914 = func.call @cc_errorp(%1907) : (i64) -> i64
      %1915 = arith.cmpi ne, %1914, %1908 : i64
      %1916 = arith.cmpi eq, %1913, %1908 : i64
      %1917 = arith.andi %1915, %1916 : i1
      %1918 = scf.if %1917 -> (i64) {
        scf.yield %1907 : i64
      } else {
        scf.yield %1913 : i64
      }
      %1919 = arith.cmpi ne, %1918, %1908 : i64
      scf.if %1919 {
        func.call @stack_push_pointer(%1918) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1906) : (i64) -> ()
        func.call @stack_push_pointer(%1907) : (i64) -> ()
        %1920 = llvm.mlir.addressof @str184 : !llvm.ptr
        %1921 = func.call @cc_make_function_ref_const(%1920) : (!llvm.ptr) -> i64
        %1922 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1921, %1922) : (i64, i64) -> ()
      }
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @cc_car(%1923) : (i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %1925 = arith.addi %1924, %__rlasp_stack_elide_zero_160 : i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_errorp(%1925) : (i64) -> i64
      %1928 = arith.cmpi ne, %1927, %1926 : i64
      %1929 = arith.cmpi eq, %1926, %1926 : i64
      %1930 = arith.andi %1928, %1929 : i1
      %1931 = scf.if %1930 -> (i64) {
        scf.yield %1925 : i64
      } else {
        scf.yield %1926 : i64
      }
      %1932 = arith.cmpi ne, %1931, %1926 : i64
      scf.if %1932 {
        func.call @stack_push_pointer(%1931) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1925) : (i64) -> ()
        %1933 = llvm.mlir.addressof @str185 : !llvm.ptr
        %1934 = func.call @cc_make_function_ref_const(%1933) : (!llvm.ptr) -> i64
        %1935 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1934, %1935) : (i64, i64) -> ()
      }
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_nil_value() : () -> i64
      %1938 = func.call @cc_cons(%1936, %1937) : (i64, i64) -> i64
      %1939 = func.call @cc_not(%1938) : (i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %1940 = arith.addi %1939, %__rlasp_stack_elide_zero_161 : i64
      %1941 = func.call @cc_nil_value() : () -> i64
      %1942 = func.call @cc_cons(%1940, %1941) : (i64, i64) -> i64
      %1943 = func.call @cc_not(%1942) : (i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %1944 = arith.addi %1943, %__rlasp_stack_elide_zero_162 : i64
      scf.yield %1944 : i64
    }
    func.call @stack_push_pointer(%1903) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079304"() {
    %2163 = func.call @cc_nil_value() : () -> i64
    %2164 = func.call @cc_nil_value() : () -> i64
    %2165 = func.call @cc_errorp(%2163) : (i64) -> i64
    %2166 = arith.cmpi ne, %2165, %2164 : i64
    %2167 = scf.if %2166 -> (i64) {
      scf.yield %2163 : i64
    } else {
      %2168 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2169 = arith.constant 6 : i64
      %2170 = func.call @cc_make_string(%2168, %2169) : (!llvm.ptr, i64) -> i64
      %2171 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2172 = arith.constant 11 : i64
      %2173 = func.call @cc_make_string(%2171, %2172) : (!llvm.ptr, i64) -> i64
      %2174 = func.call @cc_intern(%2170, %2173) : (i64, i64) -> i64
      %2175 = func.call @cc_nil_value() : () -> i64
      %2176 = func.call @cc_cons(%2174, %2175) : (i64, i64) -> i64
      %2177 = func.call @cc_values_pack(%2176) : (i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %2178 = arith.addi %2174, %__rlasp_stack_elide_zero_163 : i64
      %2179 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2180 = arith.constant 4 : i64
      %2181 = func.call @cc_make_string(%2179, %2180) : (!llvm.ptr, i64) -> i64
      %2182 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2183 = arith.constant 7 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = func.call @cc_intern(%2181, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
      %2189 = func.call @cc_nil_value() : () -> i64
      %2190 = func.call @cc_errorp(%2178) : (i64) -> i64
      %2191 = arith.cmpi ne, %2190, %2189 : i64
      %2192 = arith.cmpi eq, %2189, %2189 : i64
      %2193 = arith.andi %2191, %2192 : i1
      %2194 = scf.if %2193 -> (i64) {
        scf.yield %2178 : i64
      } else {
        scf.yield %2189 : i64
      }
      %2195 = func.call @cc_errorp(%2185) : (i64) -> i64
      %2196 = arith.cmpi ne, %2195, %2189 : i64
      %2197 = arith.cmpi eq, %2194, %2189 : i64
      %2198 = arith.andi %2196, %2197 : i1
      %2199 = scf.if %2198 -> (i64) {
        scf.yield %2185 : i64
      } else {
        scf.yield %2194 : i64
      }
      %2200 = arith.cmpi ne, %2199, %2189 : i64
      scf.if %2200 {
        func.call @stack_push_pointer(%2199) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2178) : (i64) -> ()
        func.call @stack_push_pointer(%2185) : (i64) -> ()
        %2201 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2202 = func.call @cc_make_function_ref_const(%2201) : (!llvm.ptr) -> i64
        %2203 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2202, %2203) : (i64, i64) -> ()
      }
      %2204 = func.call @stack_pop_pointer() : () -> i64
      %2205 = func.call @cc_car(%2204) : (i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %2206 = arith.addi %2205, %__rlasp_stack_elide_zero_164 : i64
      %2207 = func.call @cc_nil_value() : () -> i64
      %2208 = func.call @cc_errorp(%2206) : (i64) -> i64
      %2209 = arith.cmpi ne, %2208, %2207 : i64
      %2210 = arith.cmpi eq, %2207, %2207 : i64
      %2211 = arith.andi %2209, %2210 : i1
      %2212 = scf.if %2211 -> (i64) {
        scf.yield %2206 : i64
      } else {
        scf.yield %2207 : i64
      }
      %2213 = arith.cmpi ne, %2212, %2207 : i64
      scf.if %2213 {
        func.call @stack_push_pointer(%2212) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2206) : (i64) -> ()
        %2214 = llvm.mlir.addressof @str212 : !llvm.ptr
        %2215 = func.call @cc_make_function_ref_const(%2214) : (!llvm.ptr) -> i64
        %2216 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2215, %2216) : (i64, i64) -> ()
      }
      %2217 = func.call @stack_pop_pointer() : () -> i64
      %2218 = func.call @cc_nil_value() : () -> i64
      %2219 = func.call @cc_cons(%2217, %2218) : (i64, i64) -> i64
      %2220 = func.call @cc_not(%2219) : (i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %2221 = arith.addi %2220, %__rlasp_stack_elide_zero_165 : i64
      %2222 = func.call @cc_nil_value() : () -> i64
      %2223 = func.call @cc_cons(%2221, %2222) : (i64, i64) -> i64
      %2224 = func.call @cc_not(%2223) : (i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %2225 = arith.addi %2224, %__rlasp_stack_elide_zero_166 : i64
      scf.yield %2225 : i64
    }
    func.call @stack_push_pointer(%2167) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079305"() {
    %2444 = func.call @cc_nil_value() : () -> i64
    %2445 = func.call @cc_nil_value() : () -> i64
    %2446 = func.call @cc_errorp(%2444) : (i64) -> i64
    %2447 = arith.cmpi ne, %2446, %2445 : i64
    %2448 = scf.if %2447 -> (i64) {
      scf.yield %2444 : i64
    } else {
      %2449 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2450 = arith.constant 14 : i64
      %2451 = func.call @cc_make_string(%2449, %2450) : (!llvm.ptr, i64) -> i64
      %2452 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2453 = arith.constant 11 : i64
      %2454 = func.call @cc_make_string(%2452, %2453) : (!llvm.ptr, i64) -> i64
      %2455 = func.call @cc_intern(%2451, %2454) : (i64, i64) -> i64
      %2456 = func.call @cc_nil_value() : () -> i64
      %2457 = func.call @cc_cons(%2455, %2456) : (i64, i64) -> i64
      %2458 = func.call @cc_values_pack(%2457) : (i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %2459 = arith.addi %2455, %__rlasp_stack_elide_zero_167 : i64
      %2460 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2461 = arith.constant 8 : i64
      %2462 = func.call @cc_make_string(%2460, %2461) : (!llvm.ptr, i64) -> i64
      %2463 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2464 = arith.constant 7 : i64
      %2465 = func.call @cc_make_string(%2463, %2464) : (!llvm.ptr, i64) -> i64
      %2466 = func.call @cc_intern(%2462, %2465) : (i64, i64) -> i64
      %2467 = func.call @cc_nil_value() : () -> i64
      %2468 = func.call @cc_cons(%2466, %2467) : (i64, i64) -> i64
      %2469 = func.call @cc_values_pack(%2468) : (i64) -> i64
      %2470 = func.call @cc_nil_value() : () -> i64
      %2471 = func.call @cc_errorp(%2459) : (i64) -> i64
      %2472 = arith.cmpi ne, %2471, %2470 : i64
      %2473 = arith.cmpi eq, %2470, %2470 : i64
      %2474 = arith.andi %2472, %2473 : i1
      %2475 = scf.if %2474 -> (i64) {
        scf.yield %2459 : i64
      } else {
        scf.yield %2470 : i64
      }
      %2476 = func.call @cc_errorp(%2466) : (i64) -> i64
      %2477 = arith.cmpi ne, %2476, %2470 : i64
      %2478 = arith.cmpi eq, %2475, %2470 : i64
      %2479 = arith.andi %2477, %2478 : i1
      %2480 = scf.if %2479 -> (i64) {
        scf.yield %2466 : i64
      } else {
        scf.yield %2475 : i64
      }
      %2481 = arith.cmpi ne, %2480, %2470 : i64
      scf.if %2481 {
        func.call @stack_push_pointer(%2480) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2459) : (i64) -> ()
        func.call @stack_push_pointer(%2466) : (i64) -> ()
        %2482 = llvm.mlir.addressof @str238 : !llvm.ptr
        %2483 = func.call @cc_make_function_ref_const(%2482) : (!llvm.ptr) -> i64
        %2484 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2483, %2484) : (i64, i64) -> ()
      }
      %2485 = func.call @stack_pop_pointer() : () -> i64
      %2486 = func.call @cc_car(%2485) : (i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %2487 = arith.addi %2486, %__rlasp_stack_elide_zero_168 : i64
      %2488 = func.call @cc_nil_value() : () -> i64
      %2489 = func.call @cc_errorp(%2487) : (i64) -> i64
      %2490 = arith.cmpi ne, %2489, %2488 : i64
      %2491 = arith.cmpi eq, %2488, %2488 : i64
      %2492 = arith.andi %2490, %2491 : i1
      %2493 = scf.if %2492 -> (i64) {
        scf.yield %2487 : i64
      } else {
        scf.yield %2488 : i64
      }
      %2494 = arith.cmpi ne, %2493, %2488 : i64
      scf.if %2494 {
        func.call @stack_push_pointer(%2493) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2487) : (i64) -> ()
        %2495 = llvm.mlir.addressof @str239 : !llvm.ptr
        %2496 = func.call @cc_make_function_ref_const(%2495) : (!llvm.ptr) -> i64
        %2497 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2496, %2497) : (i64, i64) -> ()
      }
      %2498 = func.call @stack_pop_pointer() : () -> i64
      %2499 = func.call @cc_nil_value() : () -> i64
      %2500 = func.call @cc_cons(%2498, %2499) : (i64, i64) -> i64
      %2501 = func.call @cc_not(%2500) : (i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %2502 = arith.addi %2501, %__rlasp_stack_elide_zero_169 : i64
      %2503 = func.call @cc_nil_value() : () -> i64
      %2504 = func.call @cc_cons(%2502, %2503) : (i64, i64) -> i64
      %2505 = func.call @cc_not(%2504) : (i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %2506 = arith.addi %2505, %__rlasp_stack_elide_zero_170 : i64
      scf.yield %2506 : i64
    }
    func.call @stack_push_pointer(%2448) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079306"() {
    %2826 = func.call @cc_nil_value() : () -> i64
    %2827 = func.call @cc_nil_value() : () -> i64
    %2828 = func.call @cc_errorp(%2826) : (i64) -> i64
    %2829 = arith.cmpi ne, %2828, %2827 : i64
    %2830 = scf.if %2829 -> (i64) {
      scf.yield %2826 : i64
    } else {
      %2831 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2832 = arith.constant 7 : i64
      %2833 = func.call @cc_make_string(%2831, %2832) : (!llvm.ptr, i64) -> i64
      %2834 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2835 = arith.constant 2 : i64
      %2836 = func.call @cc_make_string(%2834, %2835) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %2837 = arith.addi %2836, %__rlasp_stack_elide_zero_171 : i64
      %2838 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2839 = arith.constant 16 : i64
      %2840 = func.call @cc_make_string(%2838, %2839) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %2841 = arith.addi %2840, %__rlasp_stack_elide_zero_172 : i64
      %2842 = func.call @cc_nil_value() : () -> i64
      %2843 = func.call @cc_errorp(%2837) : (i64) -> i64
      %2844 = arith.cmpi ne, %2843, %2842 : i64
      %2845 = arith.cmpi eq, %2842, %2842 : i64
      %2846 = arith.andi %2844, %2845 : i1
      %2847 = scf.if %2846 -> (i64) {
        scf.yield %2837 : i64
      } else {
        scf.yield %2842 : i64
      }
      %2848 = func.call @cc_errorp(%2841) : (i64) -> i64
      %2849 = arith.cmpi ne, %2848, %2842 : i64
      %2850 = arith.cmpi eq, %2847, %2842 : i64
      %2851 = arith.andi %2849, %2850 : i1
      %2852 = scf.if %2851 -> (i64) {
        scf.yield %2841 : i64
      } else {
        scf.yield %2847 : i64
      }
      %2853 = arith.cmpi ne, %2852, %2842 : i64
      scf.if %2853 {
        func.call @stack_push_pointer(%2852) : (i64) -> ()
      } else {
        %2854 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2854) : (i64) -> ()
        %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
        %2855 = arith.addi %2841, %__rlasp_stack_elide_zero_173 : i64
        %2856 = func.call @stack_pop_pointer() : () -> i64
        %2857 = func.call @cc_cons(%2855, %2856) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2857) : (i64) -> ()
        %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
        %2858 = arith.addi %2837, %__rlasp_stack_elide_zero_174 : i64
        %2859 = func.call @stack_pop_pointer() : () -> i64
        %2860 = func.call @cc_cons(%2858, %2859) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2860) : (i64) -> ()
      }
      %2861 = func.call @stack_pop_pointer() : () -> i64
      %2862 = func.call @cc_nil_value() : () -> i64
      %2863 = func.call @cc_errorp(%2833) : (i64) -> i64
      %2864 = arith.cmpi ne, %2863, %2862 : i64
      %2865 = arith.cmpi eq, %2862, %2862 : i64
      %2866 = arith.andi %2864, %2865 : i1
      %2867 = scf.if %2866 -> (i64) {
        scf.yield %2833 : i64
      } else {
        scf.yield %2862 : i64
      }
      %2868 = func.call @cc_errorp(%2861) : (i64) -> i64
      %2869 = arith.cmpi ne, %2868, %2862 : i64
      %2870 = arith.cmpi eq, %2867, %2862 : i64
      %2871 = arith.andi %2869, %2870 : i1
      %2872 = scf.if %2871 -> (i64) {
        scf.yield %2861 : i64
      } else {
        scf.yield %2867 : i64
      }
      %2873 = arith.cmpi ne, %2872, %2862 : i64
      scf.if %2873 {
        func.call @stack_push_pointer(%2872) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2833) : (i64) -> ()
        func.call @stack_push_pointer(%2861) : (i64) -> ()
        %2874 = llvm.mlir.addressof @str276 : !llvm.ptr
        %2875 = func.call @cc_make_function_ref_const(%2874) : (!llvm.ptr) -> i64
        %2876 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2875, %2876) : (i64, i64) -> ()
      }
      %2877 = func.call @stack_pop_pointer() : () -> i64
      %2878 = func.call @cc_nil_value() : () -> i64
      %2879 = func.call @cc_errorp(%2877) : (i64) -> i64
      %2880 = arith.cmpi ne, %2879, %2878 : i64
      %2881 = arith.cmpi eq, %2878, %2878 : i64
      %2882 = arith.andi %2880, %2881 : i1
      %2883 = scf.if %2882 -> (i64) {
        scf.yield %2877 : i64
      } else {
        scf.yield %2878 : i64
      }
      %2884 = arith.cmpi ne, %2883, %2878 : i64
      scf.if %2884 {
        func.call @stack_push_pointer(%2883) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2877) : (i64) -> ()
        %2885 = llvm.mlir.addressof @str277 : !llvm.ptr
        %2886 = func.call @cc_make_function_ref_const(%2885) : (!llvm.ptr) -> i64
        %2887 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2886, %2887) : (i64, i64) -> ()
      }
      %2888 = func.call @stack_pop_pointer() : () -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = func.call @cc_nil_value() : () -> i64
      %2891 = func.call @cc_errorp(%2889) : (i64) -> i64
      %2892 = arith.cmpi ne, %2891, %2890 : i64
      %2893 = scf.if %2892 -> (i64) {
        scf.yield %2889 : i64
      } else {
        %2894 = func.call @cc_nil_value() : () -> i64
        %2895 = func.call @cc_errorp(%2877) : (i64) -> i64
        %2896 = arith.cmpi ne, %2895, %2894 : i64
        %2897 = arith.cmpi eq, %2894, %2894 : i64
        %2898 = arith.andi %2896, %2897 : i1
        %2899 = scf.if %2898 -> (i64) {
          scf.yield %2877 : i64
        } else {
          scf.yield %2894 : i64
        }
        %2900 = arith.cmpi ne, %2899, %2894 : i64
        scf.if %2900 {
          func.call @stack_push_pointer(%2899) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2877) : (i64) -> ()
          %2901 = llvm.mlir.addressof @str278 : !llvm.ptr
          %2902 = func.call @cc_make_function_ref_const(%2901) : (!llvm.ptr) -> i64
          %2903 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2902, %2903) : (i64, i64) -> ()
        }
        %2904 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2904 : i64
      }
      %2905 = func.call @cc_nil_value() : () -> i64
      %2906 = func.call @cc_errorp(%2893) : (i64) -> i64
      %2907 = arith.cmpi ne, %2906, %2905 : i64
      %2908 = scf.if %2907 -> (i64) {
        scf.yield %2893 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %2909 = llvm.mlir.addressof @str279 : !llvm.ptr
        %2910 = arith.constant 11 : i64
        %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
        %2912 = arith.addi %2911, %__rlasp_stack_elide_zero_175 : i64
        %2913 = func.call @stack_pop_pointer() : () -> i64
        %2914 = func.call @cc_cons(%2912, %2913) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2914) : (i64) -> ()
        %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
        %2915 = arith.addi %2888, %__rlasp_stack_elide_zero_176 : i64
        %2916 = func.call @stack_pop_pointer() : () -> i64
        %2917 = func.call @cc_cons(%2915, %2916) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
        %2918 = arith.addi %2917, %__rlasp_stack_elide_zero_177 : i64
        %2919 = func.call @cc_string_equal_full(%2918) : (i64) -> i64
        %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
        %2920 = arith.addi %2919, %__rlasp_stack_elide_zero_178 : i64
        scf.yield %2920 : i64
      }
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %2921 = arith.addi %2908, %__rlasp_stack_elide_zero_179 : i64
      %2922 = func.call @cc_nil_value() : () -> i64
      %2923 = func.call @cc_cons(%2921, %2922) : (i64, i64) -> i64
      %2924 = func.call @cc_not(%2923) : (i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %2925 = arith.addi %2924, %__rlasp_stack_elide_zero_180 : i64
      %2926 = func.call @cc_nil_value() : () -> i64
      %2927 = func.call @cc_cons(%2925, %2926) : (i64, i64) -> i64
      %2928 = func.call @cc_not(%2927) : (i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %2929 = arith.addi %2928, %__rlasp_stack_elide_zero_181 : i64
      scf.yield %2929 : i64
    }
    func.call @stack_push_pointer(%2830) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_261322017079296*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_261322017079296*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_261322017079296*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("CLIP-FAILURE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str9("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str10("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str13("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str28("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str29("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str30("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str36("SOURCE-LOCATION-FUNCTION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str37("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str38("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str39("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str40("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str41("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str44("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str45("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str55("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str56("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str57("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str59("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str63("SOURCE-LOCATION-CLASS-SYMBOL\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str64("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str65("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str66("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str67("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str68("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str71("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str72("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str75("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str82("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str83("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str84("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str90("SOURCE-LOCATION-CLASS-OBJECT\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str91("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str92("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str94("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str96("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str97("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str98("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str99("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str100("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str104("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str107("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str108("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str109("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str110("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str112("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str115("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str116("SOURCE-LOCATION-MACRO\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str117("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str118("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str119("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str120("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str121("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str124("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str125("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str128("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str129("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str130("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str135("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str136("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str137("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str143("SOURCE-LOCATION-SPECIAL-FROM\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str144("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str145("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str146("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str147("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str148("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str151("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str152("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str155("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str156("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str157("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str163("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str164("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str166("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str167("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str168("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str170("SOURCE-LOCATION-GENERIC-FUNCTION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str171("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str172("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str173("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str174("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str175("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str176("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str178("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str179("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str180("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str181("INITIALIZE-INSTANCE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("COMMON-LISP::INITIALIZE-INSTANCE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str184("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str185("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str186("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str187("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str192("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str193("SOURCE-LOCATION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str194("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str195("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str196("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str197("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str198("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str201("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str203("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str204("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str205("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str206("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str207("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str212("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str213("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str216("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str218("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str220("SOURCE-LOCATION-VARIABLE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str221("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str222("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str223("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str224("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str225("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str226("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str228("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str229("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str232("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str233("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str234("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str235("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str237("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str238("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str239("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str240("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str241("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str243("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str246("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str247("RUN-PROGRAM-HELLO-WORLD\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str248("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str249("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str250("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str251("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str252("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("RUN-PROGRAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str255("/bin/sh\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str256("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str257("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258("-c\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str259("echo hello world\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str260("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str261("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str264("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str265("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str266("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str267("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str268("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str269("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str270("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str272("hello world\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str273("/bin/sh\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str274("-c\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str275("echo hello world\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str276("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str277("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str278("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str279("hello world\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str281("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str283("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str286("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str287("*__MLIR_BLOCK_RETFLAG_261322017079296*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str288("*__MLIR_BLOCK_RETMVLIST_261322017079296*\00") : !llvm.array<41 x i8>
}
