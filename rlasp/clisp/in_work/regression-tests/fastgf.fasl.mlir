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
      %52 = llvm.mlir.addressof @method_name_149526501392385 : !llvm.ptr
      %53 = func.call @cc_make_lambda_ref_str(%52) : (!llvm.ptr) -> i64
      %54 = llvm.mlir.addressof @str7 : !llvm.ptr
      %55 = arith.constant 7 : i64
      %56 = func.call @cc_make_string(%54, %55) : (!llvm.ptr, i64) -> i64
      %57 = func.call @cc_nil_value() : () -> i64
      %58 = func.call @cc_intern(%56, %57) : (i64, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_values_pack(%60) : (i64) -> i64
      %62 = func.call @cc_nil() : () -> i64
      %63 = llvm.mlir.addressof @str8 : !llvm.ptr
      %64 = arith.constant 7 : i64
      %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
      %66 = llvm.mlir.addressof @str9 : !llvm.ptr
      %67 = arith.constant 11 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = func.call @cc_intern(%65, %68) : (i64, i64) -> i64
      %70 = func.call @cc_nil_value() : () -> i64
      %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
      %72 = func.call @cc_values_pack(%71) : (i64) -> i64
      %73 = func.call @cc_cons(%69, %62) : (i64, i64) -> i64
      %74 = arith.constant 1 : i64
      %75 = func.call @cc_box_fixnum(%74) : (i64) -> i64
      %76 = arith.constant 0 : i64
      %77 = func.call @cc_defmethod_qualified(%58, %73, %53, %75, %76) : (i64, i64, i64, i64, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %79 = llvm.mlir.addressof @str10 : !llvm.ptr
      %80 = arith.constant 7 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = llvm.mlir.addressof @str11 : !llvm.ptr
      %83 = arith.constant 7 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = func.call @cc_intern(%81, %84) : (i64, i64) -> i64
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = func.call @cc_cons(%85, %86) : (i64, i64) -> i64
      %88 = func.call @cc_values_pack(%87) : (i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %89 = arith.addi %85, %__rlasp_stack_elide_zero_0 : i64
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %92 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %93 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
      %94 = llvm.mlir.addressof @str12 : !llvm.ptr
      %95 = arith.constant 7 : i64
      %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
      %97 = llvm.mlir.addressof @str13 : !llvm.ptr
      %98 = arith.constant 11 : i64
      %99 = func.call @cc_make_string(%97, %98) : (!llvm.ptr, i64) -> i64
      %100 = func.call @cc_intern(%96, %99) : (i64, i64) -> i64
      %101 = func.call @cc_nil_value() : () -> i64
      %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
      %103 = func.call @cc_values_pack(%102) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %104 = arith.addi %100, %__rlasp_stack_elide_zero_1 : i64
      %105 = func.call @stack_pop_pointer() : () -> i64
      %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      %107 = llvm.mlir.addressof @str14 : !llvm.ptr
      %108 = arith.constant 1 : i64
      %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
      %110 = func.call @cc_nil_value() : () -> i64
      %111 = func.call @cc_intern(%109, %110) : (i64, i64) -> i64
      %112 = func.call @cc_nil_value() : () -> i64
      %113 = func.call @cc_cons(%111, %112) : (i64, i64) -> i64
      %114 = func.call @cc_values_pack(%113) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %115 = arith.addi %111, %__rlasp_stack_elide_zero_2 : i64
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @cc_cons(%115, %116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %118 = arith.addi %117, %__rlasp_stack_elide_zero_3 : i64
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %121 = arith.addi %120, %__rlasp_stack_elide_zero_4 : i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%123) : (i64) -> ()
      %124 = llvm.mlir.addressof @str15 : !llvm.ptr
      %125 = arith.constant 7 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = func.call @cc_nil_value() : () -> i64
      %128 = func.call @cc_intern(%126, %127) : (i64, i64) -> i64
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_cons(%128, %129) : (i64, i64) -> i64
      %131 = func.call @cc_values_pack(%130) : (i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %132 = arith.addi %128, %__rlasp_stack_elide_zero_5 : i64
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = func.call @cc_cons(%132, %133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%134) : (i64) -> ()
      %135 = llvm.mlir.addressof @str16 : !llvm.ptr
      %136 = arith.constant 9 : i64
      %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_intern(%137, %138) : (i64, i64) -> i64
      %140 = func.call @cc_nil_value() : () -> i64
      %141 = func.call @cc_cons(%139, %140) : (i64, i64) -> i64
      %142 = func.call @cc_values_pack(%141) : (i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %143 = arith.addi %139, %__rlasp_stack_elide_zero_6 : i64
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @cc_cons(%143, %144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %146 = arith.addi %145, %__rlasp_stack_elide_zero_7 : i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_eval(%148) : (i64) -> i64
      %150 = func.call @cc_multiple_value_list(%149) : (i64) -> i64
      %151 = func.call @cc_values_pack(%150) : (i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %152 = arith.addi %151, %__rlasp_stack_elide_zero_8 : i64
      scf.yield %152 : i64
    }
    %153 = func.call @cc_nil_value() : () -> i64
    %154 = func.call @cc_errorp(%40) : (i64) -> i64
    %155 = arith.cmpi ne, %154, %153 : i64
    %156 = scf.if %155 -> (i64) {
      scf.yield %40 : i64
    } else {
      %168 = llvm.mlir.addressof @method_name_149526501392386 : !llvm.ptr
      %169 = func.call @cc_make_lambda_ref_str(%168) : (!llvm.ptr) -> i64
      %170 = llvm.mlir.addressof @str20 : !llvm.ptr
      %171 = arith.constant 7 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = func.call @cc_nil_value() : () -> i64
      %174 = func.call @cc_intern(%172, %173) : (i64, i64) -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_cons(%174, %175) : (i64, i64) -> i64
      %177 = func.call @cc_values_pack(%176) : (i64) -> i64
      %178 = func.call @cc_nil() : () -> i64
      %179 = llvm.mlir.addressof @str21 : !llvm.ptr
      %180 = arith.constant 6 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = llvm.mlir.addressof @str22 : !llvm.ptr
      %183 = arith.constant 11 : i64
      %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
      %185 = func.call @cc_intern(%181, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      %189 = func.call @cc_cons(%185, %178) : (i64, i64) -> i64
      %190 = arith.constant 1 : i64
      %191 = func.call @cc_box_fixnum(%190) : (i64) -> i64
      %192 = arith.constant 0 : i64
      %193 = func.call @cc_defmethod_qualified(%174, %189, %169, %191, %192) : (i64, i64, i64, i64, i64) -> i64
      %194 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      %195 = llvm.mlir.addressof @str23 : !llvm.ptr
      %196 = arith.constant 6 : i64
      %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
      %198 = llvm.mlir.addressof @str24 : !llvm.ptr
      %199 = arith.constant 7 : i64
      %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
      %201 = func.call @cc_intern(%197, %200) : (i64, i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_values_pack(%203) : (i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %205 = arith.addi %201, %__rlasp_stack_elide_zero_9 : i64
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @cc_cons(%205, %206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%207) : (i64) -> ()
      %208 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %209 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %210 = llvm.mlir.addressof @str25 : !llvm.ptr
      %211 = arith.constant 6 : i64
      %212 = func.call @cc_make_string(%210, %211) : (!llvm.ptr, i64) -> i64
      %213 = llvm.mlir.addressof @str26 : !llvm.ptr
      %214 = arith.constant 11 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = func.call @cc_intern(%212, %215) : (i64, i64) -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_cons(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_values_pack(%218) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %220 = arith.addi %216, %__rlasp_stack_elide_zero_10 : i64
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @cc_cons(%220, %221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %223 = llvm.mlir.addressof @str27 : !llvm.ptr
      %224 = arith.constant 1 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %231 = arith.addi %227, %__rlasp_stack_elide_zero_11 : i64
      %232 = func.call @stack_pop_pointer() : () -> i64
      %233 = func.call @cc_cons(%231, %232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %234 = arith.addi %233, %__rlasp_stack_elide_zero_12 : i64
      %235 = func.call @stack_pop_pointer() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %237 = arith.addi %236, %__rlasp_stack_elide_zero_13 : i64
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @cc_cons(%237, %238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %240 = llvm.mlir.addressof @str28 : !llvm.ptr
      %241 = arith.constant 7 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = func.call @cc_intern(%242, %243) : (i64, i64) -> i64
      %245 = func.call @cc_nil_value() : () -> i64
      %246 = func.call @cc_cons(%244, %245) : (i64, i64) -> i64
      %247 = func.call @cc_values_pack(%246) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %248 = arith.addi %244, %__rlasp_stack_elide_zero_14 : i64
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @cc_cons(%248, %249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %251 = llvm.mlir.addressof @str29 : !llvm.ptr
      %252 = arith.constant 9 : i64
      %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
      %254 = func.call @cc_nil_value() : () -> i64
      %255 = func.call @cc_intern(%253, %254) : (i64, i64) -> i64
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_cons(%255, %256) : (i64, i64) -> i64
      %258 = func.call @cc_values_pack(%257) : (i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %259 = arith.addi %255, %__rlasp_stack_elide_zero_15 : i64
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %262 = arith.addi %261, %__rlasp_stack_elide_zero_16 : i64
      %263 = func.call @cc_nil_value() : () -> i64
      %264 = func.call @cc_cons(%262, %263) : (i64, i64) -> i64
      %265 = func.call @cc_eval(%264) : (i64) -> i64
      %266 = func.call @cc_multiple_value_list(%265) : (i64) -> i64
      %267 = func.call @cc_values_pack(%266) : (i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %268 = arith.addi %267, %__rlasp_stack_elide_zero_17 : i64
      scf.yield %268 : i64
    }
    %269 = func.call @cc_nil_value() : () -> i64
    %270 = func.call @cc_errorp(%156) : (i64) -> i64
    %271 = arith.cmpi ne, %270, %269 : i64
    %272 = scf.if %271 -> (i64) {
      scf.yield %156 : i64
    } else {
      %273 = llvm.mlir.addressof @str30 : !llvm.ptr
      %274 = arith.constant 16 : i64
      %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_intern(%275, %276) : (i64, i64) -> i64
      %278 = func.call @cc_nil_value() : () -> i64
      %279 = func.call @cc_cons(%277, %278) : (i64, i64) -> i64
      %280 = func.call @cc_values_pack(%279) : (i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %281 = arith.addi %277, %__rlasp_stack_elide_zero_18 : i64
      %282 = llvm.mlir.addressof @str31 : !llvm.ptr
      %283 = arith.constant 7 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_intern(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_nil_value() : () -> i64
      %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
      %289 = func.call @cc_values_pack(%288) : (i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %290 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @cc_cons(%292, %291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %294 = arith.addi %293, %__rlasp_stack_elide_zero_19 : i64
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @cc_cons(%295, %294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %297 = arith.addi %296, %__rlasp_stack_elide_zero_20 : i64
      %316 = arith.constant 149526501392387 : i64
      %317 = arith.constant 0 : i64
      %318 = func.call @cc_make_closure(%316, %317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %319 = arith.addi %318, %__rlasp_stack_elide_zero_21 : i64
      %320 = llvm.mlir.addressof @str33 : !llvm.ptr
      %321 = arith.constant 7 : i64
      %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
      %323 = llvm.mlir.addressof @str34 : !llvm.ptr
      %324 = arith.constant 7 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = func.call @cc_intern(%322, %325) : (i64, i64) -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_values_pack(%328) : (i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %330 = func.call @stack_pop_pointer() : () -> i64
      %331 = func.call @stack_pop_pointer() : () -> i64
      %332 = func.call @cc_cons(%331, %330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %333 = arith.addi %332, %__rlasp_stack_elide_zero_22 : i64
      %334 = llvm.mlir.addressof @str35 : !llvm.ptr
      %335 = arith.constant 11 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = llvm.mlir.addressof @str36 : !llvm.ptr
      %338 = arith.constant 7 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = func.call @cc_intern(%336, %339) : (i64, i64) -> i64
      %341 = func.call @cc_nil_value() : () -> i64
      %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
      %343 = func.call @cc_values_pack(%342) : (i64) -> i64
      %344 = func.call @cc_nil_value() : () -> i64
      %345 = llvm.mlir.addressof @str37 : !llvm.ptr
      %346 = arith.constant 4 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      %348 = llvm.mlir.addressof @str38 : !llvm.ptr
      %349 = arith.constant 7 : i64
      %350 = func.call @cc_make_string(%348, %349) : (!llvm.ptr, i64) -> i64
      %351 = func.call @cc_intern(%347, %350) : (i64, i64) -> i64
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
      %354 = func.call @cc_values_pack(%353) : (i64) -> i64
      %355 = llvm.mlir.addressof @str39 : !llvm.ptr
      %356 = arith.constant 6 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = func.call @cc_nil_value() : () -> i64
      %359 = func.call @cc_intern(%357, %358) : (i64, i64) -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
      %362 = func.call @cc_values_pack(%361) : (i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %363 = arith.addi %359, %__rlasp_stack_elide_zero_23 : i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_errorp(%281) : (i64) -> i64
      %366 = arith.cmpi ne, %365, %364 : i64
      %367 = arith.cmpi eq, %364, %364 : i64
      %368 = arith.andi %366, %367 : i1
      %369 = scf.if %368 -> (i64) {
        scf.yield %281 : i64
      } else {
        scf.yield %364 : i64
      }
      %370 = func.call @cc_errorp(%297) : (i64) -> i64
      %371 = arith.cmpi ne, %370, %364 : i64
      %372 = arith.cmpi eq, %369, %364 : i64
      %373 = arith.andi %371, %372 : i1
      %374 = scf.if %373 -> (i64) {
        scf.yield %297 : i64
      } else {
        scf.yield %369 : i64
      }
      %375 = func.call @cc_errorp(%319) : (i64) -> i64
      %376 = arith.cmpi ne, %375, %364 : i64
      %377 = arith.cmpi eq, %374, %364 : i64
      %378 = arith.andi %376, %377 : i1
      %379 = scf.if %378 -> (i64) {
        scf.yield %319 : i64
      } else {
        scf.yield %374 : i64
      }
      %380 = func.call @cc_errorp(%333) : (i64) -> i64
      %381 = arith.cmpi ne, %380, %364 : i64
      %382 = arith.cmpi eq, %379, %364 : i64
      %383 = arith.andi %381, %382 : i1
      %384 = scf.if %383 -> (i64) {
        scf.yield %333 : i64
      } else {
        scf.yield %379 : i64
      }
      %385 = func.call @cc_errorp(%340) : (i64) -> i64
      %386 = arith.cmpi ne, %385, %364 : i64
      %387 = arith.cmpi eq, %384, %364 : i64
      %388 = arith.andi %386, %387 : i1
      %389 = scf.if %388 -> (i64) {
        scf.yield %340 : i64
      } else {
        scf.yield %384 : i64
      }
      %390 = func.call @cc_errorp(%344) : (i64) -> i64
      %391 = arith.cmpi ne, %390, %364 : i64
      %392 = arith.cmpi eq, %389, %364 : i64
      %393 = arith.andi %391, %392 : i1
      %394 = scf.if %393 -> (i64) {
        scf.yield %344 : i64
      } else {
        scf.yield %389 : i64
      }
      %395 = func.call @cc_errorp(%351) : (i64) -> i64
      %396 = arith.cmpi ne, %395, %364 : i64
      %397 = arith.cmpi eq, %394, %364 : i64
      %398 = arith.andi %396, %397 : i1
      %399 = scf.if %398 -> (i64) {
        scf.yield %351 : i64
      } else {
        scf.yield %394 : i64
      }
      %400 = func.call @cc_errorp(%363) : (i64) -> i64
      %401 = arith.cmpi ne, %400, %364 : i64
      %402 = arith.cmpi eq, %399, %364 : i64
      %403 = arith.andi %401, %402 : i1
      %404 = scf.if %403 -> (i64) {
        scf.yield %363 : i64
      } else {
        scf.yield %399 : i64
      }
      %405 = arith.cmpi ne, %404, %364 : i64
      scf.if %405 {
        func.call @stack_push_pointer(%404) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%281) : (i64) -> ()
        func.call @stack_push_pointer(%297) : (i64) -> ()
        func.call @stack_push_pointer(%319) : (i64) -> ()
        func.call @stack_push_pointer(%333) : (i64) -> ()
        func.call @stack_push_pointer(%340) : (i64) -> ()
        func.call @stack_push_pointer(%344) : (i64) -> ()
        func.call @stack_push_pointer(%351) : (i64) -> ()
        func.call @stack_push_pointer(%363) : (i64) -> ()
        %406 = llvm.mlir.addressof @str40 : !llvm.ptr
        %407 = func.call @cc_make_function_ref_const(%406) : (!llvm.ptr) -> i64
        %408 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%407, %408) : (i64, i64) -> ()
      }
      %409 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %409 : i64
    }
    %410 = func.call @cc_nil_value() : () -> i64
    %411 = func.call @cc_errorp(%272) : (i64) -> i64
    %412 = arith.cmpi ne, %411, %410 : i64
    %413 = scf.if %412 -> (i64) {
      scf.yield %272 : i64
    } else {
      %414 = llvm.mlir.addressof @str41 : !llvm.ptr
      %415 = arith.constant 15 : i64
      %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
      %417 = func.call @cc_nil_value() : () -> i64
      %418 = func.call @cc_intern(%416, %417) : (i64, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_values_pack(%420) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %422 = arith.addi %418, %__rlasp_stack_elide_zero_24 : i64
      %423 = llvm.mlir.addressof @str42 : !llvm.ptr
      %424 = arith.constant 7 : i64
      %425 = func.call @cc_make_string(%423, %424) : (!llvm.ptr, i64) -> i64
      %426 = func.call @cc_nil_value() : () -> i64
      %427 = func.call @cc_intern(%425, %426) : (i64, i64) -> i64
      %428 = func.call @cc_nil_value() : () -> i64
      %429 = func.call @cc_cons(%427, %428) : (i64, i64) -> i64
      %430 = func.call @cc_values_pack(%429) : (i64) -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      %431 = llvm.mlir.addressof @str43 : !llvm.ptr
      %432 = arith.constant 7 : i64
      %433 = func.call @cc_make_string(%431, %432) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %434 = func.call @stack_pop_pointer() : () -> i64
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_cons(%435, %434) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %437 = arith.addi %436, %__rlasp_stack_elide_zero_25 : i64
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @cc_cons(%438, %437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %440 = arith.addi %439, %__rlasp_stack_elide_zero_26 : i64
      %460 = arith.constant 149526501392388 : i64
      %461 = arith.constant 0 : i64
      %462 = func.call @cc_make_closure(%460, %461) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %463 = arith.addi %462, %__rlasp_stack_elide_zero_27 : i64
      %464 = llvm.mlir.addressof @str46 : !llvm.ptr
      %465 = arith.constant 6 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = llvm.mlir.addressof @str47 : !llvm.ptr
      %468 = arith.constant 7 : i64
      %469 = func.call @cc_make_string(%467, %468) : (!llvm.ptr, i64) -> i64
      %470 = func.call @cc_intern(%466, %469) : (i64, i64) -> i64
      %471 = func.call @cc_nil_value() : () -> i64
      %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
      %473 = func.call @cc_values_pack(%472) : (i64) -> i64
      func.call @stack_push_pointer(%470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @cc_cons(%475, %474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %477 = arith.addi %476, %__rlasp_stack_elide_zero_28 : i64
      %478 = llvm.mlir.addressof @str48 : !llvm.ptr
      %479 = arith.constant 11 : i64
      %480 = func.call @cc_make_string(%478, %479) : (!llvm.ptr, i64) -> i64
      %481 = llvm.mlir.addressof @str49 : !llvm.ptr
      %482 = arith.constant 7 : i64
      %483 = func.call @cc_make_string(%481, %482) : (!llvm.ptr, i64) -> i64
      %484 = func.call @cc_intern(%480, %483) : (i64, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_cons(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_values_pack(%486) : (i64) -> i64
      %488 = func.call @cc_nil_value() : () -> i64
      %489 = llvm.mlir.addressof @str50 : !llvm.ptr
      %490 = arith.constant 4 : i64
      %491 = func.call @cc_make_string(%489, %490) : (!llvm.ptr, i64) -> i64
      %492 = llvm.mlir.addressof @str51 : !llvm.ptr
      %493 = arith.constant 7 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = func.call @cc_intern(%491, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      %499 = llvm.mlir.addressof @str52 : !llvm.ptr
      %500 = arith.constant 6 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = func.call @cc_nil_value() : () -> i64
      %503 = func.call @cc_intern(%501, %502) : (i64, i64) -> i64
      %504 = func.call @cc_nil_value() : () -> i64
      %505 = func.call @cc_cons(%503, %504) : (i64, i64) -> i64
      %506 = func.call @cc_values_pack(%505) : (i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %507 = arith.addi %503, %__rlasp_stack_elide_zero_29 : i64
      %508 = func.call @cc_nil_value() : () -> i64
      %509 = func.call @cc_errorp(%422) : (i64) -> i64
      %510 = arith.cmpi ne, %509, %508 : i64
      %511 = arith.cmpi eq, %508, %508 : i64
      %512 = arith.andi %510, %511 : i1
      %513 = scf.if %512 -> (i64) {
        scf.yield %422 : i64
      } else {
        scf.yield %508 : i64
      }
      %514 = func.call @cc_errorp(%440) : (i64) -> i64
      %515 = arith.cmpi ne, %514, %508 : i64
      %516 = arith.cmpi eq, %513, %508 : i64
      %517 = arith.andi %515, %516 : i1
      %518 = scf.if %517 -> (i64) {
        scf.yield %440 : i64
      } else {
        scf.yield %513 : i64
      }
      %519 = func.call @cc_errorp(%463) : (i64) -> i64
      %520 = arith.cmpi ne, %519, %508 : i64
      %521 = arith.cmpi eq, %518, %508 : i64
      %522 = arith.andi %520, %521 : i1
      %523 = scf.if %522 -> (i64) {
        scf.yield %463 : i64
      } else {
        scf.yield %518 : i64
      }
      %524 = func.call @cc_errorp(%477) : (i64) -> i64
      %525 = arith.cmpi ne, %524, %508 : i64
      %526 = arith.cmpi eq, %523, %508 : i64
      %527 = arith.andi %525, %526 : i1
      %528 = scf.if %527 -> (i64) {
        scf.yield %477 : i64
      } else {
        scf.yield %523 : i64
      }
      %529 = func.call @cc_errorp(%484) : (i64) -> i64
      %530 = arith.cmpi ne, %529, %508 : i64
      %531 = arith.cmpi eq, %528, %508 : i64
      %532 = arith.andi %530, %531 : i1
      %533 = scf.if %532 -> (i64) {
        scf.yield %484 : i64
      } else {
        scf.yield %528 : i64
      }
      %534 = func.call @cc_errorp(%488) : (i64) -> i64
      %535 = arith.cmpi ne, %534, %508 : i64
      %536 = arith.cmpi eq, %533, %508 : i64
      %537 = arith.andi %535, %536 : i1
      %538 = scf.if %537 -> (i64) {
        scf.yield %488 : i64
      } else {
        scf.yield %533 : i64
      }
      %539 = func.call @cc_errorp(%495) : (i64) -> i64
      %540 = arith.cmpi ne, %539, %508 : i64
      %541 = arith.cmpi eq, %538, %508 : i64
      %542 = arith.andi %540, %541 : i1
      %543 = scf.if %542 -> (i64) {
        scf.yield %495 : i64
      } else {
        scf.yield %538 : i64
      }
      %544 = func.call @cc_errorp(%507) : (i64) -> i64
      %545 = arith.cmpi ne, %544, %508 : i64
      %546 = arith.cmpi eq, %543, %508 : i64
      %547 = arith.andi %545, %546 : i1
      %548 = scf.if %547 -> (i64) {
        scf.yield %507 : i64
      } else {
        scf.yield %543 : i64
      }
      %549 = arith.cmpi ne, %548, %508 : i64
      scf.if %549 {
        func.call @stack_push_pointer(%548) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%422) : (i64) -> ()
        func.call @stack_push_pointer(%440) : (i64) -> ()
        func.call @stack_push_pointer(%463) : (i64) -> ()
        func.call @stack_push_pointer(%477) : (i64) -> ()
        func.call @stack_push_pointer(%484) : (i64) -> ()
        func.call @stack_push_pointer(%488) : (i64) -> ()
        func.call @stack_push_pointer(%495) : (i64) -> ()
        func.call @stack_push_pointer(%507) : (i64) -> ()
        %550 = llvm.mlir.addressof @str53 : !llvm.ptr
        %551 = func.call @cc_make_function_ref_const(%550) : (!llvm.ptr) -> i64
        %552 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%551, %552) : (i64, i64) -> ()
      }
      %553 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %553 : i64
    }
    %554 = func.call @cc_nil_value() : () -> i64
    %555 = func.call @cc_errorp(%413) : (i64) -> i64
    %556 = arith.cmpi ne, %555, %554 : i64
    %557 = scf.if %556 -> (i64) {
      scf.yield %413 : i64
    } else {
      %569 = llvm.mlir.addressof @method_name_149526501392389 : !llvm.ptr
      %570 = func.call @cc_make_lambda_ref_str(%569) : (!llvm.ptr) -> i64
      %571 = llvm.mlir.addressof @str57 : !llvm.ptr
      %572 = arith.constant 7 : i64
      %573 = func.call @cc_make_string(%571, %572) : (!llvm.ptr, i64) -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_intern(%573, %574) : (i64, i64) -> i64
      %576 = func.call @cc_nil_value() : () -> i64
      %577 = func.call @cc_cons(%575, %576) : (i64, i64) -> i64
      %578 = func.call @cc_values_pack(%577) : (i64) -> i64
      %579 = func.call @cc_nil() : () -> i64
      %580 = llvm.mlir.addressof @str58 : !llvm.ptr
      %581 = arith.constant 6 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = llvm.mlir.addressof @str59 : !llvm.ptr
      %584 = arith.constant 11 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_intern(%582, %585) : (i64, i64) -> i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = func.call @cc_cons(%586, %587) : (i64, i64) -> i64
      %589 = func.call @cc_values_pack(%588) : (i64) -> i64
      %590 = func.call @cc_cons(%586, %579) : (i64, i64) -> i64
      %591 = arith.constant 1 : i64
      %592 = func.call @cc_box_fixnum(%591) : (i64) -> i64
      %593 = arith.constant 0 : i64
      %594 = func.call @cc_defmethod_qualified(%575, %590, %570, %592, %593) : (i64, i64, i64, i64, i64) -> i64
      %595 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%595) : (i64) -> ()
      %596 = llvm.mlir.addressof @str60 : !llvm.ptr
      %597 = arith.constant 6 : i64
      %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
      %599 = llvm.mlir.addressof @str61 : !llvm.ptr
      %600 = arith.constant 7 : i64
      %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
      %602 = func.call @cc_intern(%598, %601) : (i64, i64) -> i64
      %603 = func.call @cc_nil_value() : () -> i64
      %604 = func.call @cc_cons(%602, %603) : (i64, i64) -> i64
      %605 = func.call @cc_values_pack(%604) : (i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %606 = arith.addi %602, %__rlasp_stack_elide_zero_30 : i64
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%608) : (i64) -> ()
      %609 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%609) : (i64) -> ()
      %610 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%610) : (i64) -> ()
      %611 = llvm.mlir.addressof @str62 : !llvm.ptr
      %612 = arith.constant 6 : i64
      %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
      %614 = llvm.mlir.addressof @str63 : !llvm.ptr
      %615 = arith.constant 11 : i64
      %616 = func.call @cc_make_string(%614, %615) : (!llvm.ptr, i64) -> i64
      %617 = func.call @cc_intern(%613, %616) : (i64, i64) -> i64
      %618 = func.call @cc_nil_value() : () -> i64
      %619 = func.call @cc_cons(%617, %618) : (i64, i64) -> i64
      %620 = func.call @cc_values_pack(%619) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %621 = arith.addi %617, %__rlasp_stack_elide_zero_31 : i64
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%623) : (i64) -> ()
      %624 = llvm.mlir.addressof @str64 : !llvm.ptr
      %625 = arith.constant 1 : i64
      %626 = func.call @cc_make_string(%624, %625) : (!llvm.ptr, i64) -> i64
      %627 = func.call @cc_nil_value() : () -> i64
      %628 = func.call @cc_intern(%626, %627) : (i64, i64) -> i64
      %629 = func.call @cc_nil_value() : () -> i64
      %630 = func.call @cc_cons(%628, %629) : (i64, i64) -> i64
      %631 = func.call @cc_values_pack(%630) : (i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %632 = arith.addi %628, %__rlasp_stack_elide_zero_32 : i64
      %633 = func.call @stack_pop_pointer() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %635 = arith.addi %634, %__rlasp_stack_elide_zero_33 : i64
      %636 = func.call @stack_pop_pointer() : () -> i64
      %637 = func.call @cc_cons(%635, %636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %638 = arith.addi %637, %__rlasp_stack_elide_zero_34 : i64
      %639 = func.call @stack_pop_pointer() : () -> i64
      %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%640) : (i64) -> ()
      %641 = llvm.mlir.addressof @str65 : !llvm.ptr
      %642 = arith.constant 7 : i64
      %643 = func.call @cc_make_string(%641, %642) : (!llvm.ptr, i64) -> i64
      %644 = func.call @cc_nil_value() : () -> i64
      %645 = func.call @cc_intern(%643, %644) : (i64, i64) -> i64
      %646 = func.call @cc_nil_value() : () -> i64
      %647 = func.call @cc_cons(%645, %646) : (i64, i64) -> i64
      %648 = func.call @cc_values_pack(%647) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %649 = arith.addi %645, %__rlasp_stack_elide_zero_35 : i64
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @cc_cons(%649, %650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %652 = llvm.mlir.addressof @str66 : !llvm.ptr
      %653 = arith.constant 9 : i64
      %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = func.call @cc_intern(%654, %655) : (i64, i64) -> i64
      %657 = func.call @cc_nil_value() : () -> i64
      %658 = func.call @cc_cons(%656, %657) : (i64, i64) -> i64
      %659 = func.call @cc_values_pack(%658) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %660 = arith.addi %656, %__rlasp_stack_elide_zero_36 : i64
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @cc_cons(%660, %661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %663 = arith.addi %662, %__rlasp_stack_elide_zero_37 : i64
      %664 = func.call @cc_nil_value() : () -> i64
      %665 = func.call @cc_cons(%663, %664) : (i64, i64) -> i64
      %666 = func.call @cc_eval(%665) : (i64) -> i64
      %667 = func.call @cc_multiple_value_list(%666) : (i64) -> i64
      %668 = func.call @cc_values_pack(%667) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %669 = arith.addi %668, %__rlasp_stack_elide_zero_38 : i64
      scf.yield %669 : i64
    }
    %670 = func.call @cc_nil_value() : () -> i64
    %671 = func.call @cc_errorp(%557) : (i64) -> i64
    %672 = arith.cmpi ne, %671, %670 : i64
    %673 = scf.if %672 -> (i64) {
      scf.yield %557 : i64
    } else {
      %674 = llvm.mlir.addressof @str67 : !llvm.ptr
      %675 = arith.constant 15 : i64
      %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = func.call @cc_intern(%676, %677) : (i64, i64) -> i64
      %679 = func.call @cc_nil_value() : () -> i64
      %680 = func.call @cc_cons(%678, %679) : (i64, i64) -> i64
      %681 = func.call @cc_values_pack(%680) : (i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %682 = arith.addi %678, %__rlasp_stack_elide_zero_39 : i64
      %683 = llvm.mlir.addressof @str68 : !llvm.ptr
      %684 = arith.constant 7 : i64
      %685 = func.call @cc_make_string(%683, %684) : (!llvm.ptr, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_intern(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_nil_value() : () -> i64
      %689 = func.call @cc_cons(%687, %688) : (i64, i64) -> i64
      %690 = func.call @cc_values_pack(%689) : (i64) -> i64
      func.call @stack_push_pointer(%687) : (i64) -> ()
      %691 = llvm.mlir.addressof @str69 : !llvm.ptr
      %692 = arith.constant 5 : i64
      %693 = func.call @cc_make_string(%691, %692) : (!llvm.ptr, i64) -> i64
      %694 = llvm.mlir.addressof @str70 : !llvm.ptr
      %695 = arith.constant 7 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      %697 = func.call @cc_intern(%693, %696) : (i64, i64) -> i64
      %698 = func.call @cc_nil_value() : () -> i64
      %699 = func.call @cc_cons(%697, %698) : (i64, i64) -> i64
      %700 = func.call @cc_values_pack(%699) : (i64) -> i64
      func.call @stack_push_pointer(%697) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %701 = func.call @stack_pop_pointer() : () -> i64
      %702 = func.call @stack_pop_pointer() : () -> i64
      %703 = func.call @cc_cons(%702, %701) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %704 = arith.addi %703, %__rlasp_stack_elide_zero_40 : i64
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @cc_cons(%705, %704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %707 = arith.addi %706, %__rlasp_stack_elide_zero_41 : i64
      %734 = arith.constant 149526501392390 : i64
      %735 = arith.constant 0 : i64
      %736 = func.call @cc_make_closure(%734, %735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %737 = arith.addi %736, %__rlasp_stack_elide_zero_42 : i64
      %738 = llvm.mlir.addressof @str74 : !llvm.ptr
      %739 = arith.constant 6 : i64
      %740 = func.call @cc_make_string(%738, %739) : (!llvm.ptr, i64) -> i64
      %741 = llvm.mlir.addressof @str75 : !llvm.ptr
      %742 = arith.constant 7 : i64
      %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
      %744 = func.call @cc_intern(%740, %743) : (i64, i64) -> i64
      %745 = func.call @cc_nil_value() : () -> i64
      %746 = func.call @cc_cons(%744, %745) : (i64, i64) -> i64
      %747 = func.call @cc_values_pack(%746) : (i64) -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %751 = arith.addi %750, %__rlasp_stack_elide_zero_43 : i64
      %752 = llvm.mlir.addressof @str76 : !llvm.ptr
      %753 = arith.constant 11 : i64
      %754 = func.call @cc_make_string(%752, %753) : (!llvm.ptr, i64) -> i64
      %755 = llvm.mlir.addressof @str77 : !llvm.ptr
      %756 = arith.constant 7 : i64
      %757 = func.call @cc_make_string(%755, %756) : (!llvm.ptr, i64) -> i64
      %758 = func.call @cc_intern(%754, %757) : (i64, i64) -> i64
      %759 = func.call @cc_nil_value() : () -> i64
      %760 = func.call @cc_cons(%758, %759) : (i64, i64) -> i64
      %761 = func.call @cc_values_pack(%760) : (i64) -> i64
      %762 = func.call @cc_nil_value() : () -> i64
      %763 = llvm.mlir.addressof @str78 : !llvm.ptr
      %764 = arith.constant 4 : i64
      %765 = func.call @cc_make_string(%763, %764) : (!llvm.ptr, i64) -> i64
      %766 = llvm.mlir.addressof @str79 : !llvm.ptr
      %767 = arith.constant 7 : i64
      %768 = func.call @cc_make_string(%766, %767) : (!llvm.ptr, i64) -> i64
      %769 = func.call @cc_intern(%765, %768) : (i64, i64) -> i64
      %770 = func.call @cc_nil_value() : () -> i64
      %771 = func.call @cc_cons(%769, %770) : (i64, i64) -> i64
      %772 = func.call @cc_values_pack(%771) : (i64) -> i64
      %773 = llvm.mlir.addressof @str80 : !llvm.ptr
      %774 = arith.constant 6 : i64
      %775 = func.call @cc_make_string(%773, %774) : (!llvm.ptr, i64) -> i64
      %776 = func.call @cc_nil_value() : () -> i64
      %777 = func.call @cc_intern(%775, %776) : (i64, i64) -> i64
      %778 = func.call @cc_nil_value() : () -> i64
      %779 = func.call @cc_cons(%777, %778) : (i64, i64) -> i64
      %780 = func.call @cc_values_pack(%779) : (i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %781 = arith.addi %777, %__rlasp_stack_elide_zero_44 : i64
      %782 = func.call @cc_nil_value() : () -> i64
      %783 = func.call @cc_errorp(%682) : (i64) -> i64
      %784 = arith.cmpi ne, %783, %782 : i64
      %785 = arith.cmpi eq, %782, %782 : i64
      %786 = arith.andi %784, %785 : i1
      %787 = scf.if %786 -> (i64) {
        scf.yield %682 : i64
      } else {
        scf.yield %782 : i64
      }
      %788 = func.call @cc_errorp(%707) : (i64) -> i64
      %789 = arith.cmpi ne, %788, %782 : i64
      %790 = arith.cmpi eq, %787, %782 : i64
      %791 = arith.andi %789, %790 : i1
      %792 = scf.if %791 -> (i64) {
        scf.yield %707 : i64
      } else {
        scf.yield %787 : i64
      }
      %793 = func.call @cc_errorp(%737) : (i64) -> i64
      %794 = arith.cmpi ne, %793, %782 : i64
      %795 = arith.cmpi eq, %792, %782 : i64
      %796 = arith.andi %794, %795 : i1
      %797 = scf.if %796 -> (i64) {
        scf.yield %737 : i64
      } else {
        scf.yield %792 : i64
      }
      %798 = func.call @cc_errorp(%751) : (i64) -> i64
      %799 = arith.cmpi ne, %798, %782 : i64
      %800 = arith.cmpi eq, %797, %782 : i64
      %801 = arith.andi %799, %800 : i1
      %802 = scf.if %801 -> (i64) {
        scf.yield %751 : i64
      } else {
        scf.yield %797 : i64
      }
      %803 = func.call @cc_errorp(%758) : (i64) -> i64
      %804 = arith.cmpi ne, %803, %782 : i64
      %805 = arith.cmpi eq, %802, %782 : i64
      %806 = arith.andi %804, %805 : i1
      %807 = scf.if %806 -> (i64) {
        scf.yield %758 : i64
      } else {
        scf.yield %802 : i64
      }
      %808 = func.call @cc_errorp(%762) : (i64) -> i64
      %809 = arith.cmpi ne, %808, %782 : i64
      %810 = arith.cmpi eq, %807, %782 : i64
      %811 = arith.andi %809, %810 : i1
      %812 = scf.if %811 -> (i64) {
        scf.yield %762 : i64
      } else {
        scf.yield %807 : i64
      }
      %813 = func.call @cc_errorp(%769) : (i64) -> i64
      %814 = arith.cmpi ne, %813, %782 : i64
      %815 = arith.cmpi eq, %812, %782 : i64
      %816 = arith.andi %814, %815 : i1
      %817 = scf.if %816 -> (i64) {
        scf.yield %769 : i64
      } else {
        scf.yield %812 : i64
      }
      %818 = func.call @cc_errorp(%781) : (i64) -> i64
      %819 = arith.cmpi ne, %818, %782 : i64
      %820 = arith.cmpi eq, %817, %782 : i64
      %821 = arith.andi %819, %820 : i1
      %822 = scf.if %821 -> (i64) {
        scf.yield %781 : i64
      } else {
        scf.yield %817 : i64
      }
      %823 = arith.cmpi ne, %822, %782 : i64
      scf.if %823 {
        func.call @stack_push_pointer(%822) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%682) : (i64) -> ()
        func.call @stack_push_pointer(%707) : (i64) -> ()
        func.call @stack_push_pointer(%737) : (i64) -> ()
        func.call @stack_push_pointer(%751) : (i64) -> ()
        func.call @stack_push_pointer(%758) : (i64) -> ()
        func.call @stack_push_pointer(%762) : (i64) -> ()
        func.call @stack_push_pointer(%769) : (i64) -> ()
        func.call @stack_push_pointer(%781) : (i64) -> ()
        %824 = llvm.mlir.addressof @str81 : !llvm.ptr
        %825 = func.call @cc_make_function_ref_const(%824) : (!llvm.ptr) -> i64
        %826 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%825, %826) : (i64, i64) -> ()
      }
      %827 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %827 : i64
    }
    %828 = func.call @cc_nil_value() : () -> i64
    %829 = func.call @cc_errorp(%673) : (i64) -> i64
    %830 = arith.cmpi ne, %829, %828 : i64
    %831 = scf.if %830 -> (i64) {
      scf.yield %673 : i64
    } else {
      %832 = llvm.mlir.addressof @str82 : !llvm.ptr
      %833 = arith.constant 29 : i64
      %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
      %835 = func.call @cc_nil_value() : () -> i64
      %836 = func.call @cc_intern(%834, %835) : (i64, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_values_pack(%838) : (i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %840 = arith.addi %836, %__rlasp_stack_elide_zero_45 : i64
      %841 = llvm.mlir.addressof @str83 : !llvm.ptr
      %842 = arith.constant 13 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = llvm.mlir.addressof @str84 : !llvm.ptr
      %845 = arith.constant 11 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = func.call @cc_intern(%843, %846) : (i64, i64) -> i64
      %848 = func.call @cc_nil_value() : () -> i64
      %849 = func.call @cc_cons(%847, %848) : (i64, i64) -> i64
      %850 = func.call @cc_values_pack(%849) : (i64) -> i64
      func.call @stack_push_pointer(%847) : (i64) -> ()
      %851 = llvm.mlir.addressof @str85 : !llvm.ptr
      %852 = arith.constant 6 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = func.call @cc_nil_value() : () -> i64
      %855 = func.call @cc_intern(%853, %854) : (i64, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_cons(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_values_pack(%857) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %859 = llvm.mlir.addressof @str86 : !llvm.ptr
      %860 = arith.constant 19 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = func.call @cc_nil_value() : () -> i64
      %863 = func.call @cc_intern(%861, %862) : (i64, i64) -> i64
      %864 = func.call @cc_nil_value() : () -> i64
      %865 = func.call @cc_cons(%863, %864) : (i64, i64) -> i64
      %866 = func.call @cc_values_pack(%865) : (i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      %867 = llvm.mlir.addressof @str87 : !llvm.ptr
      %868 = arith.constant 7 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = func.call @cc_nil_value() : () -> i64
      %871 = func.call @cc_intern(%869, %870) : (i64, i64) -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_cons(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_values_pack(%873) : (i64) -> i64
      func.call @stack_push_pointer(%871) : (i64) -> ()
      %875 = arith.constant 1.2000000476837158 : f64
      %876 = func.call @cc_box_single_float(%875) : (f64) -> i64
      func.call @stack_push_pointer(%876) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %877 = func.call @stack_pop_pointer() : () -> i64
      %878 = func.call @stack_pop_pointer() : () -> i64
      %879 = func.call @cc_cons(%878, %877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %880 = arith.addi %879, %__rlasp_stack_elide_zero_46 : i64
      %881 = func.call @stack_pop_pointer() : () -> i64
      %882 = func.call @cc_cons(%881, %880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @stack_pop_pointer() : () -> i64
      %885 = func.call @cc_cons(%884, %883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %886 = arith.addi %885, %__rlasp_stack_elide_zero_47 : i64
      %887 = func.call @stack_pop_pointer() : () -> i64
      %888 = func.call @cc_cons(%887, %886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%888) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_cons(%890, %889) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %892 = arith.addi %891, %__rlasp_stack_elide_zero_48 : i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %895 = arith.addi %894, %__rlasp_stack_elide_zero_49 : i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%896, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%899, %898) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %901 = arith.addi %900, %__rlasp_stack_elide_zero_50 : i64
      %902 = func.call @stack_pop_pointer() : () -> i64
      %903 = func.call @cc_cons(%902, %901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %904 = arith.addi %903, %__rlasp_stack_elide_zero_51 : i64
      %961 = arith.constant 149526501392391 : i64
      %962 = arith.constant 0 : i64
      %963 = func.call @cc_make_closure(%961, %962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %964 = arith.addi %963, %__rlasp_stack_elide_zero_52 : i64
      %965 = llvm.mlir.addressof @str89 : !llvm.ptr
      %966 = arith.constant 4 : i64
      %967 = func.call @cc_make_string(%965, %966) : (!llvm.ptr, i64) -> i64
      %968 = func.call @cc_nil_value() : () -> i64
      %969 = func.call @cc_intern(%967, %968) : (i64, i64) -> i64
      %970 = func.call @cc_nil_value() : () -> i64
      %971 = func.call @cc_cons(%969, %970) : (i64, i64) -> i64
      %972 = func.call @cc_values_pack(%971) : (i64) -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %973 = llvm.mlir.addressof @str90 : !llvm.ptr
      %974 = arith.constant 5 : i64
      %975 = func.call @cc_make_string(%973, %974) : (!llvm.ptr, i64) -> i64
      %976 = func.call @cc_nil_value() : () -> i64
      %977 = func.call @cc_intern(%975, %976) : (i64, i64) -> i64
      %978 = func.call @cc_nil_value() : () -> i64
      %979 = func.call @cc_cons(%977, %978) : (i64, i64) -> i64
      %980 = func.call @cc_values_pack(%979) : (i64) -> i64
      func.call @stack_push_pointer(%977) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @stack_pop_pointer() : () -> i64
      %983 = func.call @cc_cons(%982, %981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %984 = arith.addi %983, %__rlasp_stack_elide_zero_53 : i64
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @cc_cons(%985, %984) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %987 = arith.addi %986, %__rlasp_stack_elide_zero_54 : i64
      %988 = llvm.mlir.addressof @str91 : !llvm.ptr
      %989 = arith.constant 11 : i64
      %990 = func.call @cc_make_string(%988, %989) : (!llvm.ptr, i64) -> i64
      %991 = llvm.mlir.addressof @str92 : !llvm.ptr
      %992 = arith.constant 7 : i64
      %993 = func.call @cc_make_string(%991, %992) : (!llvm.ptr, i64) -> i64
      %994 = func.call @cc_intern(%990, %993) : (i64, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_cons(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_values_pack(%996) : (i64) -> i64
      %998 = llvm.mlir.addressof @str93 : !llvm.ptr
      %999 = arith.constant 24 : i64
      %1000 = func.call @cc_make_string(%998, %999) : (!llvm.ptr, i64) -> i64
      %1001 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1002 = arith.constant 4 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      %1004 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1005 = arith.constant 7 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = func.call @cc_intern(%1003, %1006) : (i64, i64) -> i64
      %1008 = func.call @cc_nil_value() : () -> i64
      %1009 = func.call @cc_cons(%1007, %1008) : (i64, i64) -> i64
      %1010 = func.call @cc_values_pack(%1009) : (i64) -> i64
      %1011 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1012 = arith.constant 5 : i64
      %1013 = func.call @cc_make_string(%1011, %1012) : (!llvm.ptr, i64) -> i64
      %1014 = func.call @cc_nil_value() : () -> i64
      %1015 = func.call @cc_intern(%1013, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1019 = arith.addi %1015, %__rlasp_stack_elide_zero_55 : i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_errorp(%840) : (i64) -> i64
      %1022 = arith.cmpi ne, %1021, %1020 : i64
      %1023 = arith.cmpi eq, %1020, %1020 : i64
      %1024 = arith.andi %1022, %1023 : i1
      %1025 = scf.if %1024 -> (i64) {
        scf.yield %840 : i64
      } else {
        scf.yield %1020 : i64
      }
      %1026 = func.call @cc_errorp(%904) : (i64) -> i64
      %1027 = arith.cmpi ne, %1026, %1020 : i64
      %1028 = arith.cmpi eq, %1025, %1020 : i64
      %1029 = arith.andi %1027, %1028 : i1
      %1030 = scf.if %1029 -> (i64) {
        scf.yield %904 : i64
      } else {
        scf.yield %1025 : i64
      }
      %1031 = func.call @cc_errorp(%964) : (i64) -> i64
      %1032 = arith.cmpi ne, %1031, %1020 : i64
      %1033 = arith.cmpi eq, %1030, %1020 : i64
      %1034 = arith.andi %1032, %1033 : i1
      %1035 = scf.if %1034 -> (i64) {
        scf.yield %964 : i64
      } else {
        scf.yield %1030 : i64
      }
      %1036 = func.call @cc_errorp(%987) : (i64) -> i64
      %1037 = arith.cmpi ne, %1036, %1020 : i64
      %1038 = arith.cmpi eq, %1035, %1020 : i64
      %1039 = arith.andi %1037, %1038 : i1
      %1040 = scf.if %1039 -> (i64) {
        scf.yield %987 : i64
      } else {
        scf.yield %1035 : i64
      }
      %1041 = func.call @cc_errorp(%994) : (i64) -> i64
      %1042 = arith.cmpi ne, %1041, %1020 : i64
      %1043 = arith.cmpi eq, %1040, %1020 : i64
      %1044 = arith.andi %1042, %1043 : i1
      %1045 = scf.if %1044 -> (i64) {
        scf.yield %994 : i64
      } else {
        scf.yield %1040 : i64
      }
      %1046 = func.call @cc_errorp(%1000) : (i64) -> i64
      %1047 = arith.cmpi ne, %1046, %1020 : i64
      %1048 = arith.cmpi eq, %1045, %1020 : i64
      %1049 = arith.andi %1047, %1048 : i1
      %1050 = scf.if %1049 -> (i64) {
        scf.yield %1000 : i64
      } else {
        scf.yield %1045 : i64
      }
      %1051 = func.call @cc_errorp(%1007) : (i64) -> i64
      %1052 = arith.cmpi ne, %1051, %1020 : i64
      %1053 = arith.cmpi eq, %1050, %1020 : i64
      %1054 = arith.andi %1052, %1053 : i1
      %1055 = scf.if %1054 -> (i64) {
        scf.yield %1007 : i64
      } else {
        scf.yield %1050 : i64
      }
      %1056 = func.call @cc_errorp(%1019) : (i64) -> i64
      %1057 = arith.cmpi ne, %1056, %1020 : i64
      %1058 = arith.cmpi eq, %1055, %1020 : i64
      %1059 = arith.andi %1057, %1058 : i1
      %1060 = scf.if %1059 -> (i64) {
        scf.yield %1019 : i64
      } else {
        scf.yield %1055 : i64
      }
      %1061 = arith.cmpi ne, %1060, %1020 : i64
      scf.if %1061 {
        func.call @stack_push_pointer(%1060) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%840) : (i64) -> ()
        func.call @stack_push_pointer(%904) : (i64) -> ()
        func.call @stack_push_pointer(%964) : (i64) -> ()
        func.call @stack_push_pointer(%987) : (i64) -> ()
        func.call @stack_push_pointer(%994) : (i64) -> ()
        func.call @stack_push_pointer(%1000) : (i64) -> ()
        func.call @stack_push_pointer(%1007) : (i64) -> ()
        func.call @stack_push_pointer(%1019) : (i64) -> ()
        %1062 = llvm.mlir.addressof @str97 : !llvm.ptr
        %1063 = func.call @cc_make_function_ref_const(%1062) : (!llvm.ptr) -> i64
        %1064 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1063, %1064) : (i64, i64) -> ()
      }
      %1065 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1065 : i64
    }
    %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
    %1066 = arith.addi %831, %__rlasp_stack_elide_zero_56 : i64
    %1067 = func.call @cc_multiple_value_list(%1066) : (i64) -> i64
    %1068 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1069 = arith.constant 38 : i64
    %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
    %1071 = func.call @cc_nil_value() : () -> i64
    %1072 = func.call @cc_intern(%1070, %1071) : (i64, i64) -> i64
    %1073 = func.call @cc_nil_value() : () -> i64
    %1074 = func.call @cc_cons(%1072, %1073) : (i64, i64) -> i64
    %1075 = func.call @cc_values_pack(%1074) : (i64) -> i64
    %1076 = func.call @cc_symbol_value(%1072) : (i64) -> i64
    %1077 = llvm.mlir.addressof @str99 : !llvm.ptr
    %1078 = arith.constant 40 : i64
    %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
    %1080 = func.call @cc_nil_value() : () -> i64
    %1081 = func.call @cc_intern(%1079, %1080) : (i64, i64) -> i64
    %1082 = func.call @cc_nil_value() : () -> i64
    %1083 = func.call @cc_cons(%1081, %1082) : (i64, i64) -> i64
    %1084 = func.call @cc_values_pack(%1083) : (i64) -> i64
    %1085 = func.call @cc_symbol_value(%1081) : (i64) -> i64
    %1086 = func.call @cc_nil_value() : () -> i64
    %1087 = arith.cmpi ne, %1076, %1086 : i64
    %1088 = scf.if %1087 -> (i64) {
      scf.yield %1085 : i64
    } else {
      scf.yield %1067 : i64
    }
    %1089 = func.call @cc_values_pack(%1088) : (i64) -> i64
    func.call @stack_push_pointer(%1089) : (i64) -> ()
    func.return
  }
  func.func @"fgf-foo_149526501392385_primary"() {
    %41 = func.call @stack_pop_pointer() : () -> i64
    %42 = llvm.mlir.addressof @str4 : !llvm.ptr
    %43 = arith.constant 7 : i64
    %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
    %45 = llvm.mlir.addressof @str5 : !llvm.ptr
    %46 = arith.constant 7 : i64
    %47 = func.call @cc_make_string(%45, %46) : (!llvm.ptr, i64) -> i64
    %48 = func.call @cc_intern(%44, %47) : (i64, i64) -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_cons(%48, %49) : (i64, i64) -> i64
    %51 = func.call @cc_values_pack(%50) : (i64) -> i64
    func.call @stack_push_pointer(%48) : (i64) -> ()
    func.return
  }
  func.func @"fgf-foo_149526501392386_primary"() {
    %157 = func.call @stack_pop_pointer() : () -> i64
    %158 = llvm.mlir.addressof @str17 : !llvm.ptr
    %159 = arith.constant 6 : i64
    %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
    %161 = llvm.mlir.addressof @str18 : !llvm.ptr
    %162 = arith.constant 7 : i64
    %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
    %164 = func.call @cc_intern(%160, %163) : (i64, i64) -> i64
    %165 = func.call @cc_nil_value() : () -> i64
    %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
    %167 = func.call @cc_values_pack(%166) : (i64) -> i64
    func.call @stack_push_pointer(%164) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392387"() {
    %298 = func.call @cc_nil_value() : () -> i64
    %299 = func.call @cc_nil_value() : () -> i64
    %300 = func.call @cc_errorp(%298) : (i64) -> i64
    %301 = arith.cmpi ne, %300, %299 : i64
    %302 = scf.if %301 -> (i64) {
      scf.yield %298 : i64
    } else {
      %303 = arith.constant 1 : i64
      %304 = func.call @cc_box_fixnum(%303) : (i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_errorp(%304) : (i64) -> i64
      %307 = arith.cmpi ne, %306, %305 : i64
      %308 = arith.cmpi eq, %305, %305 : i64
      %309 = arith.andi %307, %308 : i1
      %310 = scf.if %309 -> (i64) {
        scf.yield %304 : i64
      } else {
        scf.yield %305 : i64
      }
      %311 = arith.cmpi ne, %310, %305 : i64
      scf.if %311 {
        func.call @stack_push_pointer(%310) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%304) : (i64) -> ()
        %312 = llvm.mlir.addressof @str32 : !llvm.ptr
        %313 = func.call @cc_make_function_ref_const(%312) : (!llvm.ptr) -> i64
        %314 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%313, %314) : (i64, i64) -> ()
      }
      %315 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %315 : i64
    }
    func.call @stack_push_pointer(%302) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392388"() {
    %441 = func.call @cc_nil_value() : () -> i64
    %442 = func.call @cc_nil_value() : () -> i64
    %443 = func.call @cc_errorp(%441) : (i64) -> i64
    %444 = arith.cmpi ne, %443, %442 : i64
    %445 = scf.if %444 -> (i64) {
      scf.yield %441 : i64
    } else {
      %446 = llvm.mlir.addressof @str44 : !llvm.ptr
      %447 = arith.constant 7 : i64
      %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_errorp(%448) : (i64) -> i64
      %451 = arith.cmpi ne, %450, %449 : i64
      %452 = arith.cmpi eq, %449, %449 : i64
      %453 = arith.andi %451, %452 : i1
      %454 = scf.if %453 -> (i64) {
        scf.yield %448 : i64
      } else {
        scf.yield %449 : i64
      }
      %455 = arith.cmpi ne, %454, %449 : i64
      scf.if %455 {
        func.call @stack_push_pointer(%454) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%448) : (i64) -> ()
        %456 = llvm.mlir.addressof @str45 : !llvm.ptr
        %457 = func.call @cc_make_function_ref_const(%456) : (!llvm.ptr) -> i64
        %458 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%457, %458) : (i64, i64) -> ()
      }
      %459 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %459 : i64
    }
    func.call @stack_push_pointer(%445) : (i64) -> ()
    func.return
  }
  func.func @"fgf-foo_149526501392389_primary"() {
    %558 = func.call @stack_pop_pointer() : () -> i64
    %559 = llvm.mlir.addressof @str54 : !llvm.ptr
    %560 = arith.constant 6 : i64
    %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
    %562 = llvm.mlir.addressof @str55 : !llvm.ptr
    %563 = arith.constant 7 : i64
    %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
    %565 = func.call @cc_intern(%561, %564) : (i64, i64) -> i64
    %566 = func.call @cc_nil_value() : () -> i64
    %567 = func.call @cc_cons(%565, %566) : (i64, i64) -> i64
    %568 = func.call @cc_values_pack(%567) : (i64) -> i64
    func.call @stack_push_pointer(%565) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392390"() {
    %708 = func.call @cc_nil_value() : () -> i64
    %709 = func.call @cc_nil_value() : () -> i64
    %710 = func.call @cc_errorp(%708) : (i64) -> i64
    %711 = arith.cmpi ne, %710, %709 : i64
    %712 = scf.if %711 -> (i64) {
      scf.yield %708 : i64
    } else {
      %713 = llvm.mlir.addressof @str71 : !llvm.ptr
      %714 = arith.constant 5 : i64
      %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
      %716 = llvm.mlir.addressof @str72 : !llvm.ptr
      %717 = arith.constant 7 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_intern(%715, %718) : (i64, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_values_pack(%721) : (i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_errorp(%719) : (i64) -> i64
      %725 = arith.cmpi ne, %724, %723 : i64
      %726 = arith.cmpi eq, %723, %723 : i64
      %727 = arith.andi %725, %726 : i1
      %728 = scf.if %727 -> (i64) {
        scf.yield %719 : i64
      } else {
        scf.yield %723 : i64
      }
      %729 = arith.cmpi ne, %728, %723 : i64
      scf.if %729 {
        func.call @stack_push_pointer(%728) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%719) : (i64) -> ()
        %730 = llvm.mlir.addressof @str73 : !llvm.ptr
        %731 = func.call @cc_make_function_ref_const(%730) : (!llvm.ptr) -> i64
        %732 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%731, %732) : (i64, i64) -> ()
      }
      %733 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %733 : i64
    }
    func.call @stack_push_pointer(%712) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392391"() {
    %905 = func.call @cc_nil_value() : () -> i64
    %906 = func.call @cc_nil_value() : () -> i64
    %907 = func.call @cc_errorp(%905) : (i64) -> i64
    %908 = arith.cmpi ne, %907, %906 : i64
    %909 = scf.if %908 -> (i64) {
      scf.yield %905 : i64
    } else {
      %910 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %911 = func.call @cc_nil_value() : () -> i64
      %912 = func.call @cc_nil_value() : () -> i64
      %913 = func.call @cc_errorp(%911) : (i64) -> i64
      %914 = arith.cmpi ne, %913, %912 : i64
      %915 = scf.if %914 -> (i64) {
        scf.yield %911 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %916 = arith.constant 1.2000000476837158 : f64
        %917 = func.call @cc_box_single_float(%916) : (f64) -> i64
        %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
        %918 = arith.addi %917, %__rlasp_stack_elide_zero_57 : i64
        %919 = func.call @cc_nil_value() : () -> i64
        %920 = func.call @cc_errorp(%918) : (i64) -> i64
        %921 = arith.cmpi ne, %920, %919 : i64
        %922 = arith.cmpi eq, %919, %919 : i64
        %923 = arith.andi %921, %922 : i1
        %924 = scf.if %923 -> (i64) {
          scf.yield %918 : i64
        } else {
          scf.yield %919 : i64
        }
        %925 = arith.cmpi ne, %924, %919 : i64
        scf.if %925 {
          func.call @stack_push_pointer(%924) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%918) : (i64) -> ()
          %926 = llvm.mlir.addressof @str88 : !llvm.ptr
          %927 = func.call @cc_make_function_ref_const(%926) : (!llvm.ptr) -> i64
          %928 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%927, %928) : (i64, i64) -> ()
        }
        %929 = func.call @stack_pop_pointer() : () -> i64
        %930 = func.call @cc_errorp(%929) : (i64) -> i64
        %931 = func.call @cc_nil_value() : () -> i64
        %932 = arith.cmpi ne, %930, %931 : i64
        scf.if %932 {
          func.call @stack_push_pointer(%929) : (i64) -> ()
        } else {
          %933 = func.call @cc_multiple_value_list(%929) : (i64) -> i64
          func.call @stack_push_pointer(%933) : (i64) -> ()
        }
        %934 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %935 = func.call @stack_pop_pointer() : () -> i64
        %936 = func.call @cc_nil_value() : () -> i64
        %937 = func.call @cc_maybe_error_from_multiple_value_list(%934) : (i64) -> i64
        %938 = func.call @cc_errorp(%937) : (i64) -> i64
        %939 = arith.cmpi ne, %938, %936 : i64
        %940 = arith.cmpi eq, %936, %936 : i64
        %941 = arith.andi %939, %940 : i1
        %942 = scf.if %941 -> (i64) {
          scf.yield %937 : i64
        } else {
          scf.yield %936 : i64
        }
        %943 = arith.cmpi ne, %942, %936 : i64
        scf.if %943 {
          func.call @stack_push_pointer(%942) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %944 = func.call @stack_pop_pointer() : () -> i64
          %945 = func.call @cc_cons(%935, %944) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
          %946 = arith.addi %945, %__rlasp_stack_elide_zero_58 : i64
          %947 = func.call @cc_cons(%934, %946) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
          %948 = arith.addi %947, %__rlasp_stack_elide_zero_59 : i64
          %949 = func.call @cc_values_pack(%948) : (i64) -> i64
          func.call @stack_push_pointer(%949) : (i64) -> ()
        }
        %950 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %950 : i64
      }
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %951 = arith.addi %915, %__rlasp_stack_elide_zero_60 : i64
      %952 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %953 = func.call @cc_errorp(%951) : (i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = arith.cmpi ne, %953, %954 : i64
      scf.if %955 {
        %956 = func.call @cc_condition_value(%951) : (i64) -> i64
        %957 = func.call @cc_values2(%954, %956) : (i64, i64) -> i64
        func.call @stack_push_pointer(%957) : (i64) -> ()
      } else {
        %958 = func.call @cc_multiple_value_list(%951) : (i64) -> i64
        %959 = func.call @cc_values_pack(%958) : (i64) -> i64
        func.call @stack_push_pointer(%959) : (i64) -> ()
      }
      %960 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %960 : i64
    }
    func.call @stack_push_pointer(%909) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_149526501392384*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_149526501392384*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_149526501392384*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str5("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @method_name_149526501392385("fgf-foo_149526501392385_primary\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str7("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str15("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str17("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @method_name_149526501392386("fgf-foo_149526501392386_primary\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str20("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str30("DISPATCH-INTEGER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str31("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str37("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str41("DISPATCH-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("testing\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("testing\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str54("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @method_name_149526501392389("fgf-foo_149526501392389_primary\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str57("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str61("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str65("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str66("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str67("DISPATCH-SYMBOL\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str68("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("YADDA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("YADDA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str75("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str76("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str82("DISPATCH-NO-APPLICABLE-METHOD\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str83("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str84("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str86("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str87("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str90("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("This should not dispatch\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str94("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str95("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str97("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETFLAG_149526501392384*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETMVLIST_149526501392384*\00") : !llvm.array<41 x i8>
}
