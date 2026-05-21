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
      %66 = arith.constant 3 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_intern(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_nil_value() : () -> i64
      %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
      %72 = func.call @cc_values_pack(%71) : (i64) -> i64
      func.call @stack_push_pointer(%69) : (i64) -> ()
      %73 = llvm.mlir.addressof @str7 : !llvm.ptr
      %74 = arith.constant 4 : i64
      %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
      %76 = func.call @cc_nil_value() : () -> i64
      %77 = func.call @cc_intern(%75, %76) : (i64, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      %79 = func.call @cc_cons(%77, %78) : (i64, i64) -> i64
      %80 = func.call @cc_values_pack(%79) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %81 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @stack_pop_pointer() : () -> i64
      %84 = func.call @cc_cons(%83, %82) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %85 = arith.addi %84, %__rlasp_stack_elide_zero_3 : i64
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = func.call @cc_cons(%86, %85) : (i64, i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = func.call @cc_cons(%89, %88) : (i64, i64) -> i64
      func.call @stack_push_pointer(%90) : (i64) -> ()
      %91 = llvm.mlir.addressof @str8 : !llvm.ptr
      %92 = arith.constant 20 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = func.call @cc_nil_value() : () -> i64
      %95 = func.call @cc_intern(%93, %94) : (i64, i64) -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
      %98 = func.call @cc_values_pack(%97) : (i64) -> i64
      func.call @stack_push_pointer(%95) : (i64) -> ()
      %99 = llvm.mlir.addressof @str9 : !llvm.ptr
      %100 = arith.constant 27 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_intern(%101, %102) : (i64, i64) -> i64
      %104 = func.call @cc_nil_value() : () -> i64
      %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
      %106 = func.call @cc_values_pack(%105) : (i64) -> i64
      func.call @stack_push_pointer(%103) : (i64) -> ()
      %107 = llvm.mlir.addressof @str10 : !llvm.ptr
      %108 = arith.constant 4 : i64
      %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
      %110 = llvm.mlir.addressof @str11 : !llvm.ptr
      %111 = arith.constant 11 : i64
      %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
      %113 = func.call @cc_intern(%109, %112) : (i64, i64) -> i64
      %114 = func.call @cc_nil_value() : () -> i64
      %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
      %116 = func.call @cc_values_pack(%115) : (i64) -> i64
      func.call @stack_push_pointer(%113) : (i64) -> ()
      %117 = llvm.mlir.addressof @str12 : !llvm.ptr
      %118 = arith.constant 4 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      %120 = func.call @cc_nil_value() : () -> i64
      %121 = func.call @cc_intern(%119, %120) : (i64, i64) -> i64
      %122 = func.call @cc_nil_value() : () -> i64
      %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
      %124 = func.call @cc_values_pack(%123) : (i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @stack_pop_pointer() : () -> i64
      %127 = func.call @cc_cons(%126, %125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %128 = arith.addi %127, %__rlasp_stack_elide_zero_4 : i64
      %129 = func.call @stack_pop_pointer() : () -> i64
      %130 = func.call @cc_cons(%129, %128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %131 = arith.addi %130, %__rlasp_stack_elide_zero_5 : i64
      %132 = func.call @stack_pop_pointer() : () -> i64
      %133 = func.call @cc_cons(%132, %131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%133) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = func.call @stack_pop_pointer() : () -> i64
      %136 = func.call @cc_cons(%135, %134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %137 = arith.addi %136, %__rlasp_stack_elide_zero_6 : i64
      %138 = func.call @stack_pop_pointer() : () -> i64
      %139 = func.call @cc_cons(%138, %137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%139) : (i64) -> ()
      %140 = llvm.mlir.addressof @str13 : !llvm.ptr
      %141 = arith.constant 14 : i64
      %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
      %143 = llvm.mlir.addressof @str14 : !llvm.ptr
      %144 = arith.constant 2 : i64
      %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
      %146 = func.call @cc_intern(%142, %145) : (i64, i64) -> i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_values_pack(%148) : (i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %150 = llvm.mlir.addressof @str15 : !llvm.ptr
      %151 = arith.constant 27 : i64
      %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
      %153 = func.call @cc_nil_value() : () -> i64
      %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
      %157 = func.call @cc_values_pack(%156) : (i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %158 = func.call @stack_pop_pointer() : () -> i64
      %159 = func.call @stack_pop_pointer() : () -> i64
      %160 = func.call @cc_cons(%159, %158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %161 = arith.addi %160, %__rlasp_stack_elide_zero_7 : i64
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163 = func.call @cc_cons(%162, %161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%163) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_cons(%165, %164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %167 = arith.addi %166, %__rlasp_stack_elide_zero_8 : i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %170 = arith.addi %169, %__rlasp_stack_elide_zero_9 : i64
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_cons(%171, %170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%172) : (i64) -> ()
      %173 = llvm.mlir.addressof @str16 : !llvm.ptr
      %174 = arith.constant 4 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_intern(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_nil_value() : () -> i64
      %179 = func.call @cc_cons(%177, %178) : (i64, i64) -> i64
      %180 = func.call @cc_values_pack(%179) : (i64) -> i64
      func.call @stack_push_pointer(%177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @cc_cons(%182, %181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %184 = arith.addi %183, %__rlasp_stack_elide_zero_10 : i64
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @cc_cons(%185, %184) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %187 = arith.addi %186, %__rlasp_stack_elide_zero_11 : i64
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_cons(%188, %187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %190 = arith.addi %189, %__rlasp_stack_elide_zero_12 : i64
      %191 = func.call @stack_pop_pointer() : () -> i64
      %192 = func.call @cc_cons(%191, %190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %193 = arith.addi %192, %__rlasp_stack_elide_zero_13 : i64
      %424 = arith.constant 4634242382299137 : i64
      %425 = arith.constant 0 : i64
      %426 = func.call @cc_make_closure(%424, %425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %427 = arith.addi %426, %__rlasp_stack_elide_zero_14 : i64
      %428 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @cc_cons(%430, %429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %432 = arith.addi %431, %__rlasp_stack_elide_zero_15 : i64
      %433 = llvm.mlir.addressof @str29 : !llvm.ptr
      %434 = arith.constant 11 : i64
      %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
      %436 = llvm.mlir.addressof @str30 : !llvm.ptr
      %437 = arith.constant 7 : i64
      %438 = func.call @cc_make_string(%436, %437) : (!llvm.ptr, i64) -> i64
      %439 = func.call @cc_intern(%435, %438) : (i64, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_values_pack(%441) : (i64) -> i64
      %443 = func.call @cc_nil_value() : () -> i64
      %444 = llvm.mlir.addressof @str31 : !llvm.ptr
      %445 = arith.constant 4 : i64
      %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
      %447 = llvm.mlir.addressof @str32 : !llvm.ptr
      %448 = arith.constant 7 : i64
      %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
      %450 = func.call @cc_intern(%446, %449) : (i64, i64) -> i64
      %451 = func.call @cc_nil_value() : () -> i64
      %452 = func.call @cc_cons(%450, %451) : (i64, i64) -> i64
      %453 = func.call @cc_values_pack(%452) : (i64) -> i64
      %454 = llvm.mlir.addressof @str33 : !llvm.ptr
      %455 = arith.constant 6 : i64
      %456 = func.call @cc_make_string(%454, %455) : (!llvm.ptr, i64) -> i64
      %457 = func.call @cc_nil_value() : () -> i64
      %458 = func.call @cc_intern(%456, %457) : (i64, i64) -> i64
      %459 = func.call @cc_nil_value() : () -> i64
      %460 = func.call @cc_cons(%458, %459) : (i64, i64) -> i64
      %461 = func.call @cc_values_pack(%460) : (i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %462 = arith.addi %458, %__rlasp_stack_elide_zero_16 : i64
      %463 = func.call @cc_nil_value() : () -> i64
      %464 = func.call @cc_errorp(%64) : (i64) -> i64
      %465 = arith.cmpi ne, %464, %463 : i64
      %466 = arith.cmpi eq, %463, %463 : i64
      %467 = arith.andi %465, %466 : i1
      %468 = scf.if %467 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %463 : i64
      }
      %469 = func.call @cc_errorp(%193) : (i64) -> i64
      %470 = arith.cmpi ne, %469, %463 : i64
      %471 = arith.cmpi eq, %468, %463 : i64
      %472 = arith.andi %470, %471 : i1
      %473 = scf.if %472 -> (i64) {
        scf.yield %193 : i64
      } else {
        scf.yield %468 : i64
      }
      %474 = func.call @cc_errorp(%427) : (i64) -> i64
      %475 = arith.cmpi ne, %474, %463 : i64
      %476 = arith.cmpi eq, %473, %463 : i64
      %477 = arith.andi %475, %476 : i1
      %478 = scf.if %477 -> (i64) {
        scf.yield %427 : i64
      } else {
        scf.yield %473 : i64
      }
      %479 = func.call @cc_errorp(%432) : (i64) -> i64
      %480 = arith.cmpi ne, %479, %463 : i64
      %481 = arith.cmpi eq, %478, %463 : i64
      %482 = arith.andi %480, %481 : i1
      %483 = scf.if %482 -> (i64) {
        scf.yield %432 : i64
      } else {
        scf.yield %478 : i64
      }
      %484 = func.call @cc_errorp(%439) : (i64) -> i64
      %485 = arith.cmpi ne, %484, %463 : i64
      %486 = arith.cmpi eq, %483, %463 : i64
      %487 = arith.andi %485, %486 : i1
      %488 = scf.if %487 -> (i64) {
        scf.yield %439 : i64
      } else {
        scf.yield %483 : i64
      }
      %489 = func.call @cc_errorp(%443) : (i64) -> i64
      %490 = arith.cmpi ne, %489, %463 : i64
      %491 = arith.cmpi eq, %488, %463 : i64
      %492 = arith.andi %490, %491 : i1
      %493 = scf.if %492 -> (i64) {
        scf.yield %443 : i64
      } else {
        scf.yield %488 : i64
      }
      %494 = func.call @cc_errorp(%450) : (i64) -> i64
      %495 = arith.cmpi ne, %494, %463 : i64
      %496 = arith.cmpi eq, %493, %463 : i64
      %497 = arith.andi %495, %496 : i1
      %498 = scf.if %497 -> (i64) {
        scf.yield %450 : i64
      } else {
        scf.yield %493 : i64
      }
      %499 = func.call @cc_errorp(%462) : (i64) -> i64
      %500 = arith.cmpi ne, %499, %463 : i64
      %501 = arith.cmpi eq, %498, %463 : i64
      %502 = arith.andi %500, %501 : i1
      %503 = scf.if %502 -> (i64) {
        scf.yield %462 : i64
      } else {
        scf.yield %498 : i64
      }
      %504 = arith.cmpi ne, %503, %463 : i64
      scf.if %504 {
        func.call @stack_push_pointer(%503) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%193) : (i64) -> ()
        func.call @stack_push_pointer(%427) : (i64) -> ()
        func.call @stack_push_pointer(%432) : (i64) -> ()
        func.call @stack_push_pointer(%439) : (i64) -> ()
        func.call @stack_push_pointer(%443) : (i64) -> ()
        func.call @stack_push_pointer(%450) : (i64) -> ()
        func.call @stack_push_pointer(%462) : (i64) -> ()
        %505 = llvm.mlir.addressof @str34 : !llvm.ptr
        %506 = func.call @cc_make_function_ref_const(%505) : (!llvm.ptr) -> i64
        %507 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%506, %507) : (i64, i64) -> ()
      }
      %508 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %508 : i64
    }
    %509 = func.call @cc_nil_value() : () -> i64
    %510 = func.call @cc_errorp(%55) : (i64) -> i64
    %511 = arith.cmpi ne, %510, %509 : i64
    %512 = scf.if %511 -> (i64) {
      scf.yield %55 : i64
    } else {
      %513 = llvm.mlir.addressof @str35 : !llvm.ptr
      %514 = arith.constant 16 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = func.call @cc_nil_value() : () -> i64
      %517 = func.call @cc_intern(%515, %516) : (i64, i64) -> i64
      %518 = func.call @cc_nil_value() : () -> i64
      %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
      %520 = func.call @cc_values_pack(%519) : (i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %521 = arith.addi %517, %__rlasp_stack_elide_zero_17 : i64
      %522 = llvm.mlir.addressof @str36 : !llvm.ptr
      %523 = arith.constant 4 : i64
      %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
      %525 = func.call @cc_nil_value() : () -> i64
      %526 = func.call @cc_intern(%524, %525) : (i64, i64) -> i64
      %527 = func.call @cc_nil_value() : () -> i64
      %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
      %529 = func.call @cc_values_pack(%528) : (i64) -> i64
      func.call @stack_push_pointer(%526) : (i64) -> ()
      %530 = llvm.mlir.addressof @str37 : !llvm.ptr
      %531 = arith.constant 4 : i64
      %532 = func.call @cc_make_string(%530, %531) : (!llvm.ptr, i64) -> i64
      %533 = func.call @cc_nil_value() : () -> i64
      %534 = func.call @cc_intern(%532, %533) : (i64, i64) -> i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_cons(%534, %535) : (i64, i64) -> i64
      %537 = func.call @cc_values_pack(%536) : (i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_cons(%539, %538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %541 = arith.addi %540, %__rlasp_stack_elide_zero_18 : i64
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @cc_cons(%542, %541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      %544 = llvm.mlir.addressof @str38 : !llvm.ptr
      %545 = arith.constant 4 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_intern(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      %552 = llvm.mlir.addressof @str39 : !llvm.ptr
      %553 = arith.constant 20 : i64
      %554 = func.call @cc_make_string(%552, %553) : (!llvm.ptr, i64) -> i64
      %555 = llvm.mlir.addressof @str40 : !llvm.ptr
      %556 = arith.constant 2 : i64
      %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
      %558 = func.call @cc_intern(%554, %557) : (i64, i64) -> i64
      %559 = func.call @cc_nil_value() : () -> i64
      %560 = func.call @cc_cons(%558, %559) : (i64, i64) -> i64
      %561 = func.call @cc_values_pack(%560) : (i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %562 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      %563 = llvm.mlir.addressof @str41 : !llvm.ptr
      %564 = arith.constant 21 : i64
      %565 = func.call @cc_make_string(%563, %564) : (!llvm.ptr, i64) -> i64
      %566 = func.call @cc_nil_value() : () -> i64
      %567 = func.call @cc_intern(%565, %566) : (i64, i64) -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
      %570 = func.call @cc_values_pack(%569) : (i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %571 = arith.addi %567, %__rlasp_stack_elide_zero_19 : i64
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_cons(%571, %572) : (i64, i64) -> i64
      %574 = llvm.mlir.addressof @str42 : !llvm.ptr
      %575 = arith.constant 5 : i64
      %576 = func.call @cc_make_string(%574, %575) : (!llvm.ptr, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_intern(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_cons(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_values_pack(%580) : (i64) -> i64
      %582 = func.call @cc_cons(%578, %573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%582) : (i64) -> ()
      %583 = llvm.mlir.addressof @str43 : !llvm.ptr
      %584 = arith.constant 6 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_nil_value() : () -> i64
      %587 = func.call @cc_intern(%585, %586) : (i64, i64) -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
      %590 = func.call @cc_values_pack(%589) : (i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %591 = llvm.mlir.addressof @str44 : !llvm.ptr
      %592 = arith.constant 12 : i64
      %593 = func.call @cc_make_string(%591, %592) : (!llvm.ptr, i64) -> i64
      %594 = llvm.mlir.addressof @str45 : !llvm.ptr
      %595 = arith.constant 11 : i64
      %596 = func.call @cc_make_string(%594, %595) : (!llvm.ptr, i64) -> i64
      %597 = func.call @cc_intern(%593, %596) : (i64, i64) -> i64
      %598 = func.call @cc_nil_value() : () -> i64
      %599 = func.call @cc_cons(%597, %598) : (i64, i64) -> i64
      %600 = func.call @cc_values_pack(%599) : (i64) -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      %601 = llvm.mlir.addressof @str46 : !llvm.ptr
      %602 = arith.constant 4 : i64
      %603 = func.call @cc_make_string(%601, %602) : (!llvm.ptr, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_intern(%603, %604) : (i64, i64) -> i64
      %606 = func.call @cc_nil_value() : () -> i64
      %607 = func.call @cc_cons(%605, %606) : (i64, i64) -> i64
      %608 = func.call @cc_values_pack(%607) : (i64) -> i64
      func.call @stack_push_pointer(%605) : (i64) -> ()
      %609 = llvm.mlir.addressof @str47 : !llvm.ptr
      %610 = arith.constant 24 : i64
      %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
      %612 = llvm.mlir.addressof @str48 : !llvm.ptr
      %613 = arith.constant 4 : i64
      %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
      %615 = func.call @cc_intern(%611, %614) : (i64, i64) -> i64
      %616 = func.call @cc_nil_value() : () -> i64
      %617 = func.call @cc_cons(%615, %616) : (i64, i64) -> i64
      %618 = func.call @cc_values_pack(%617) : (i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = func.call @cc_cons(%620, %619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @stack_pop_pointer() : () -> i64
      %624 = func.call @cc_cons(%623, %622) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %625 = arith.addi %624, %__rlasp_stack_elide_zero_20 : i64
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = func.call @cc_cons(%626, %625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      %628 = llvm.mlir.addressof @str49 : !llvm.ptr
      %629 = arith.constant 22 : i64
      %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
      %631 = llvm.mlir.addressof @str50 : !llvm.ptr
      %632 = arith.constant 2 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = func.call @cc_intern(%630, %633) : (i64, i64) -> i64
      %635 = func.call @cc_nil_value() : () -> i64
      %636 = func.call @cc_cons(%634, %635) : (i64, i64) -> i64
      %637 = func.call @cc_values_pack(%636) : (i64) -> i64
      func.call @stack_push_pointer(%634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %638 = llvm.mlir.addressof @str51 : !llvm.ptr
      %639 = arith.constant 4 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = llvm.mlir.addressof @str52 : !llvm.ptr
      %642 = arith.constant 11 : i64
      %643 = func.call @cc_make_string(%641, %642) : (!llvm.ptr, i64) -> i64
      %644 = func.call @cc_intern(%640, %643) : (i64, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_values_pack(%646) : (i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %648 = llvm.mlir.addressof @str53 : !llvm.ptr
      %649 = arith.constant 4 : i64
      %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_intern(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_nil_value() : () -> i64
      %654 = func.call @cc_cons(%652, %653) : (i64, i64) -> i64
      %655 = func.call @cc_values_pack(%654) : (i64) -> i64
      func.call @stack_push_pointer(%652) : (i64) -> ()
      %656 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @cc_cons(%658, %657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %660 = arith.addi %659, %__rlasp_stack_elide_zero_21 : i64
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @cc_cons(%661, %660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %663 = arith.addi %662, %__rlasp_stack_elide_zero_22 : i64
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @cc_cons(%664, %663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @cc_cons(%667, %666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %669 = arith.addi %668, %__rlasp_stack_elide_zero_23 : i64
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @cc_cons(%670, %669) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %672 = arith.addi %671, %__rlasp_stack_elide_zero_24 : i64
      %673 = func.call @stack_pop_pointer() : () -> i64
      %674 = func.call @cc_cons(%673, %672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %675 = func.call @stack_pop_pointer() : () -> i64
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @cc_cons(%676, %675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %678 = arith.addi %677, %__rlasp_stack_elide_zero_25 : i64
      %679 = func.call @stack_pop_pointer() : () -> i64
      %680 = func.call @cc_cons(%679, %678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %681 = arith.addi %680, %__rlasp_stack_elide_zero_26 : i64
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @cc_cons(%682, %681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %684 = func.call @stack_pop_pointer() : () -> i64
      %685 = func.call @stack_pop_pointer() : () -> i64
      %686 = func.call @cc_cons(%685, %684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %687 = arith.addi %686, %__rlasp_stack_elide_zero_27 : i64
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = func.call @cc_cons(%688, %687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %690 = arith.addi %689, %__rlasp_stack_elide_zero_28 : i64
      %691 = func.call @stack_pop_pointer() : () -> i64
      %692 = func.call @cc_cons(%691, %690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @stack_pop_pointer() : () -> i64
      %695 = func.call @cc_cons(%694, %693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %696 = arith.addi %695, %__rlasp_stack_elide_zero_29 : i64
      %697 = func.call @stack_pop_pointer() : () -> i64
      %698 = func.call @cc_cons(%697, %696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %699 = arith.addi %698, %__rlasp_stack_elide_zero_30 : i64
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = func.call @cc_cons(%700, %699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%701) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %702 = func.call @stack_pop_pointer() : () -> i64
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @cc_cons(%703, %702) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %705 = arith.addi %704, %__rlasp_stack_elide_zero_31 : i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_cons(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @cc_cons(%709, %708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %711 = arith.addi %710, %__rlasp_stack_elide_zero_32 : i64
      %712 = func.call @stack_pop_pointer() : () -> i64
      %713 = func.call @cc_cons(%712, %711) : (i64, i64) -> i64
      func.call @stack_push_pointer(%713) : (i64) -> ()
      %714 = llvm.mlir.addressof @str54 : !llvm.ptr
      %715 = arith.constant 14 : i64
      %716 = func.call @cc_make_string(%714, %715) : (!llvm.ptr, i64) -> i64
      %717 = llvm.mlir.addressof @str55 : !llvm.ptr
      %718 = arith.constant 2 : i64
      %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
      %720 = func.call @cc_intern(%716, %719) : (i64, i64) -> i64
      %721 = func.call @cc_nil_value() : () -> i64
      %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
      %723 = func.call @cc_values_pack(%722) : (i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      %724 = llvm.mlir.addressof @str56 : !llvm.ptr
      %725 = arith.constant 4 : i64
      %726 = func.call @cc_make_string(%724, %725) : (!llvm.ptr, i64) -> i64
      %727 = func.call @cc_nil_value() : () -> i64
      %728 = func.call @cc_intern(%726, %727) : (i64, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_cons(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_values_pack(%730) : (i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @cc_cons(%733, %732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %735 = arith.addi %734, %__rlasp_stack_elide_zero_33 : i64
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @cc_cons(%736, %735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%737) : (i64) -> ()
      %738 = llvm.mlir.addressof @str57 : !llvm.ptr
      %739 = arith.constant 13 : i64
      %740 = func.call @cc_make_string(%738, %739) : (!llvm.ptr, i64) -> i64
      %741 = llvm.mlir.addressof @str58 : !llvm.ptr
      %742 = arith.constant 11 : i64
      %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
      %744 = func.call @cc_intern(%740, %743) : (i64, i64) -> i64
      %745 = func.call @cc_nil_value() : () -> i64
      %746 = func.call @cc_cons(%744, %745) : (i64, i64) -> i64
      %747 = func.call @cc_values_pack(%746) : (i64) -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
      %748 = llvm.mlir.addressof @str59 : !llvm.ptr
      %749 = arith.constant 12 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      %751 = llvm.mlir.addressof @str60 : !llvm.ptr
      %752 = arith.constant 2 : i64
      %753 = func.call @cc_make_string(%751, %752) : (!llvm.ptr, i64) -> i64
      %754 = func.call @cc_intern(%750, %753) : (i64, i64) -> i64
      %755 = func.call @cc_nil_value() : () -> i64
      %756 = func.call @cc_cons(%754, %755) : (i64, i64) -> i64
      %757 = func.call @cc_values_pack(%756) : (i64) -> i64
      func.call @stack_push_pointer(%754) : (i64) -> ()
      %758 = llvm.mlir.addressof @str61 : !llvm.ptr
      %759 = arith.constant 4 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      %761 = func.call @cc_nil_value() : () -> i64
      %762 = func.call @cc_intern(%760, %761) : (i64, i64) -> i64
      %763 = func.call @cc_nil_value() : () -> i64
      %764 = func.call @cc_cons(%762, %763) : (i64, i64) -> i64
      %765 = func.call @cc_values_pack(%764) : (i64) -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @cc_cons(%767, %766) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %769 = arith.addi %768, %__rlasp_stack_elide_zero_34 : i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%770, %769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_cons(%773, %772) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %775 = arith.addi %774, %__rlasp_stack_elide_zero_35 : i64
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @cc_cons(%776, %775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %778 = llvm.mlir.addressof @str62 : !llvm.ptr
      %779 = arith.constant 4 : i64
      %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_intern(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_cons(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_values_pack(%784) : (i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %786 = func.call @stack_pop_pointer() : () -> i64
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @cc_cons(%787, %786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %789 = arith.addi %788, %__rlasp_stack_elide_zero_36 : i64
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @cc_cons(%790, %789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %792 = arith.addi %791, %__rlasp_stack_elide_zero_37 : i64
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @cc_cons(%793, %792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %795 = arith.addi %794, %__rlasp_stack_elide_zero_38 : i64
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @cc_cons(%796, %795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %798 = arith.addi %797, %__rlasp_stack_elide_zero_39 : i64
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @cc_cons(%799, %798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %801 = arith.addi %800, %__rlasp_stack_elide_zero_40 : i64
      %1087 = arith.constant 4634242382299141 : i64
      %1088 = arith.constant 0 : i64
      %1089 = func.call @cc_make_closure(%1087, %1088) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %1090 = arith.addi %1089, %__rlasp_stack_elide_zero_41 : i64
      %1091 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1091) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @cc_cons(%1093, %1092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %1095 = arith.addi %1094, %__rlasp_stack_elide_zero_42 : i64
      %1096 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1097 = arith.constant 11 : i64
      %1098 = func.call @cc_make_string(%1096, %1097) : (!llvm.ptr, i64) -> i64
      %1099 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1100 = arith.constant 7 : i64
      %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = func.call @cc_intern(%1098, %1101) : (i64, i64) -> i64
      %1103 = func.call @cc_nil_value() : () -> i64
      %1104 = func.call @cc_cons(%1102, %1103) : (i64, i64) -> i64
      %1105 = func.call @cc_values_pack(%1104) : (i64) -> i64
      %1106 = func.call @cc_nil_value() : () -> i64
      %1107 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1108 = arith.constant 4 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      %1110 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1111 = arith.constant 7 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = func.call @cc_intern(%1109, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_cons(%1113, %1114) : (i64, i64) -> i64
      %1116 = func.call @cc_values_pack(%1115) : (i64) -> i64
      %1117 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1118 = arith.constant 6 : i64
      %1119 = func.call @cc_make_string(%1117, %1118) : (!llvm.ptr, i64) -> i64
      %1120 = func.call @cc_nil_value() : () -> i64
      %1121 = func.call @cc_intern(%1119, %1120) : (i64, i64) -> i64
      %1122 = func.call @cc_nil_value() : () -> i64
      %1123 = func.call @cc_cons(%1121, %1122) : (i64, i64) -> i64
      %1124 = func.call @cc_values_pack(%1123) : (i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %1125 = arith.addi %1121, %__rlasp_stack_elide_zero_43 : i64
      %1126 = func.call @cc_nil_value() : () -> i64
      %1127 = func.call @cc_errorp(%521) : (i64) -> i64
      %1128 = arith.cmpi ne, %1127, %1126 : i64
      %1129 = arith.cmpi eq, %1126, %1126 : i64
      %1130 = arith.andi %1128, %1129 : i1
      %1131 = scf.if %1130 -> (i64) {
        scf.yield %521 : i64
      } else {
        scf.yield %1126 : i64
      }
      %1132 = func.call @cc_errorp(%801) : (i64) -> i64
      %1133 = arith.cmpi ne, %1132, %1126 : i64
      %1134 = arith.cmpi eq, %1131, %1126 : i64
      %1135 = arith.andi %1133, %1134 : i1
      %1136 = scf.if %1135 -> (i64) {
        scf.yield %801 : i64
      } else {
        scf.yield %1131 : i64
      }
      %1137 = func.call @cc_errorp(%1090) : (i64) -> i64
      %1138 = arith.cmpi ne, %1137, %1126 : i64
      %1139 = arith.cmpi eq, %1136, %1126 : i64
      %1140 = arith.andi %1138, %1139 : i1
      %1141 = scf.if %1140 -> (i64) {
        scf.yield %1090 : i64
      } else {
        scf.yield %1136 : i64
      }
      %1142 = func.call @cc_errorp(%1095) : (i64) -> i64
      %1143 = arith.cmpi ne, %1142, %1126 : i64
      %1144 = arith.cmpi eq, %1141, %1126 : i64
      %1145 = arith.andi %1143, %1144 : i1
      %1146 = scf.if %1145 -> (i64) {
        scf.yield %1095 : i64
      } else {
        scf.yield %1141 : i64
      }
      %1147 = func.call @cc_errorp(%1102) : (i64) -> i64
      %1148 = arith.cmpi ne, %1147, %1126 : i64
      %1149 = arith.cmpi eq, %1146, %1126 : i64
      %1150 = arith.andi %1148, %1149 : i1
      %1151 = scf.if %1150 -> (i64) {
        scf.yield %1102 : i64
      } else {
        scf.yield %1146 : i64
      }
      %1152 = func.call @cc_errorp(%1106) : (i64) -> i64
      %1153 = arith.cmpi ne, %1152, %1126 : i64
      %1154 = arith.cmpi eq, %1151, %1126 : i64
      %1155 = arith.andi %1153, %1154 : i1
      %1156 = scf.if %1155 -> (i64) {
        scf.yield %1106 : i64
      } else {
        scf.yield %1151 : i64
      }
      %1157 = func.call @cc_errorp(%1113) : (i64) -> i64
      %1158 = arith.cmpi ne, %1157, %1126 : i64
      %1159 = arith.cmpi eq, %1156, %1126 : i64
      %1160 = arith.andi %1158, %1159 : i1
      %1161 = scf.if %1160 -> (i64) {
        scf.yield %1113 : i64
      } else {
        scf.yield %1156 : i64
      }
      %1162 = func.call @cc_errorp(%1125) : (i64) -> i64
      %1163 = arith.cmpi ne, %1162, %1126 : i64
      %1164 = arith.cmpi eq, %1161, %1126 : i64
      %1165 = arith.andi %1163, %1164 : i1
      %1166 = scf.if %1165 -> (i64) {
        scf.yield %1125 : i64
      } else {
        scf.yield %1161 : i64
      }
      %1167 = arith.cmpi ne, %1166, %1126 : i64
      scf.if %1167 {
        func.call @stack_push_pointer(%1166) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%521) : (i64) -> ()
        func.call @stack_push_pointer(%801) : (i64) -> ()
        func.call @stack_push_pointer(%1090) : (i64) -> ()
        func.call @stack_push_pointer(%1095) : (i64) -> ()
        func.call @stack_push_pointer(%1102) : (i64) -> ()
        func.call @stack_push_pointer(%1106) : (i64) -> ()
        func.call @stack_push_pointer(%1113) : (i64) -> ()
        func.call @stack_push_pointer(%1125) : (i64) -> ()
        %1168 = llvm.mlir.addressof @str84 : !llvm.ptr
        %1169 = func.call @cc_make_function_ref_const(%1168) : (!llvm.ptr) -> i64
        %1170 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1169, %1170) : (i64, i64) -> ()
      }
      %1171 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1171 : i64
    }
    %1172 = func.call @cc_nil_value() : () -> i64
    %1173 = func.call @cc_errorp(%512) : (i64) -> i64
    %1174 = arith.cmpi ne, %1173, %1172 : i64
    %1175 = scf.if %1174 -> (i64) {
      scf.yield %512 : i64
    } else {
      %1176 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1177 = arith.constant 14 : i64
      %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
      %1179 = func.call @cc_nil_value() : () -> i64
      %1180 = func.call @cc_intern(%1178, %1179) : (i64, i64) -> i64
      %1181 = func.call @cc_nil_value() : () -> i64
      %1182 = func.call @cc_cons(%1180, %1181) : (i64, i64) -> i64
      %1183 = func.call @cc_values_pack(%1182) : (i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %1184 = arith.addi %1180, %__rlasp_stack_elide_zero_44 : i64
      %1185 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1186 = arith.constant 3 : i64
      %1187 = func.call @cc_make_string(%1185, %1186) : (!llvm.ptr, i64) -> i64
      %1188 = func.call @cc_nil_value() : () -> i64
      %1189 = func.call @cc_intern(%1187, %1188) : (i64, i64) -> i64
      %1190 = func.call @cc_nil_value() : () -> i64
      %1191 = func.call @cc_cons(%1189, %1190) : (i64, i64) -> i64
      %1192 = func.call @cc_values_pack(%1191) : (i64) -> i64
      func.call @stack_push_pointer(%1189) : (i64) -> ()
      %1193 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1194 = arith.constant 4 : i64
      %1195 = func.call @cc_make_string(%1193, %1194) : (!llvm.ptr, i64) -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_intern(%1195, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_values_pack(%1199) : (i64) -> i64
      func.call @stack_push_pointer(%1197) : (i64) -> ()
      %1201 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1202 = arith.constant 4 : i64
      %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
      %1204 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1205 = arith.constant 11 : i64
      %1206 = func.call @cc_make_string(%1204, %1205) : (!llvm.ptr, i64) -> i64
      %1207 = func.call @cc_intern(%1203, %1206) : (i64, i64) -> i64
      %1208 = func.call @cc_nil_value() : () -> i64
      %1209 = func.call @cc_cons(%1207, %1208) : (i64, i64) -> i64
      %1210 = func.call @cc_values_pack(%1209) : (i64) -> i64
      func.call @stack_push_pointer(%1207) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = func.call @stack_pop_pointer() : () -> i64
      %1213 = func.call @cc_cons(%1212, %1211) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1214 = arith.addi %1213, %__rlasp_stack_elide_zero_45 : i64
      %1215 = func.call @stack_pop_pointer() : () -> i64
      %1216 = func.call @cc_cons(%1215, %1214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = func.call @stack_pop_pointer() : () -> i64
      %1219 = func.call @cc_cons(%1218, %1217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1220 = arith.addi %1219, %__rlasp_stack_elide_zero_46 : i64
      %1221 = func.call @stack_pop_pointer() : () -> i64
      %1222 = func.call @cc_cons(%1221, %1220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @stack_pop_pointer() : () -> i64
      %1225 = func.call @cc_cons(%1224, %1223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1225) : (i64) -> ()
      %1226 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1227 = arith.constant 20 : i64
      %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_intern(%1228, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_nil_value() : () -> i64
      %1232 = func.call @cc_cons(%1230, %1231) : (i64, i64) -> i64
      %1233 = func.call @cc_values_pack(%1232) : (i64) -> i64
      func.call @stack_push_pointer(%1230) : (i64) -> ()
      %1234 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1235 = arith.constant 19 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_intern(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_cons(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = func.call @stack_pop_pointer() : () -> i64
      %1244 = func.call @cc_cons(%1243, %1242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1244) : (i64) -> ()
      %1245 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1246 = arith.constant 17 : i64
      %1247 = func.call @cc_make_string(%1245, %1246) : (!llvm.ptr, i64) -> i64
      %1248 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1249 = arith.constant 2 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = func.call @cc_intern(%1247, %1250) : (i64, i64) -> i64
      %1252 = func.call @cc_nil_value() : () -> i64
      %1253 = func.call @cc_cons(%1251, %1252) : (i64, i64) -> i64
      %1254 = func.call @cc_values_pack(%1253) : (i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1255 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1256 = arith.constant 19 : i64
      %1257 = func.call @cc_make_string(%1255, %1256) : (!llvm.ptr, i64) -> i64
      %1258 = func.call @cc_nil_value() : () -> i64
      %1259 = func.call @cc_intern(%1257, %1258) : (i64, i64) -> i64
      %1260 = func.call @cc_nil_value() : () -> i64
      %1261 = func.call @cc_cons(%1259, %1260) : (i64, i64) -> i64
      %1262 = func.call @cc_values_pack(%1261) : (i64) -> i64
      func.call @stack_push_pointer(%1259) : (i64) -> ()
      %1263 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1264 = arith.constant 6 : i64
      %1265 = func.call @cc_make_string(%1263, %1264) : (!llvm.ptr, i64) -> i64
      %1266 = func.call @cc_nil_value() : () -> i64
      %1267 = func.call @cc_intern(%1265, %1266) : (i64, i64) -> i64
      %1268 = func.call @cc_nil_value() : () -> i64
      %1269 = func.call @cc_cons(%1267, %1268) : (i64, i64) -> i64
      %1270 = func.call @cc_values_pack(%1269) : (i64) -> i64
      func.call @stack_push_pointer(%1267) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1271 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1272 = arith.constant 4 : i64
      %1273 = func.call @cc_make_string(%1271, %1272) : (!llvm.ptr, i64) -> i64
      %1274 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1275 = arith.constant 11 : i64
      %1276 = func.call @cc_make_string(%1274, %1275) : (!llvm.ptr, i64) -> i64
      %1277 = func.call @cc_intern(%1273, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_nil_value() : () -> i64
      %1279 = func.call @cc_cons(%1277, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_values_pack(%1279) : (i64) -> i64
      func.call @stack_push_pointer(%1277) : (i64) -> ()
      %1281 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1282 = arith.constant 6 : i64
      %1283 = func.call @cc_make_string(%1281, %1282) : (!llvm.ptr, i64) -> i64
      %1284 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1285 = arith.constant 2 : i64
      %1286 = func.call @cc_make_string(%1284, %1285) : (!llvm.ptr, i64) -> i64
      %1287 = func.call @cc_intern(%1283, %1286) : (i64, i64) -> i64
      %1288 = func.call @cc_nil_value() : () -> i64
      %1289 = func.call @cc_cons(%1287, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_values_pack(%1289) : (i64) -> i64
      func.call @stack_push_pointer(%1287) : (i64) -> ()
      %1291 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1292 = arith.constant 3 : i64
      %1293 = func.call @cc_make_string(%1291, %1292) : (!llvm.ptr, i64) -> i64
      %1294 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1295 = arith.constant 11 : i64
      %1296 = func.call @cc_make_string(%1294, %1295) : (!llvm.ptr, i64) -> i64
      %1297 = func.call @cc_intern(%1293, %1296) : (i64, i64) -> i64
      %1298 = func.call @cc_nil_value() : () -> i64
      %1299 = func.call @cc_cons(%1297, %1298) : (i64, i64) -> i64
      %1300 = func.call @cc_values_pack(%1299) : (i64) -> i64
      func.call @stack_push_pointer(%1297) : (i64) -> ()
      %1301 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1302 = arith.constant 4 : i64
      %1303 = func.call @cc_make_string(%1301, %1302) : (!llvm.ptr, i64) -> i64
      %1304 = func.call @cc_nil_value() : () -> i64
      %1305 = func.call @cc_intern(%1303, %1304) : (i64, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_cons(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_values_pack(%1307) : (i64) -> i64
      func.call @stack_push_pointer(%1305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1309 = func.call @stack_pop_pointer() : () -> i64
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @cc_cons(%1310, %1309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1312 = arith.addi %1311, %__rlasp_stack_elide_zero_47 : i64
      %1313 = func.call @stack_pop_pointer() : () -> i64
      %1314 = func.call @cc_cons(%1313, %1312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1315 = func.call @stack_pop_pointer() : () -> i64
      %1316 = func.call @stack_pop_pointer() : () -> i64
      %1317 = func.call @cc_cons(%1316, %1315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1318 = arith.addi %1317, %__rlasp_stack_elide_zero_48 : i64
      %1319 = func.call @stack_pop_pointer() : () -> i64
      %1320 = func.call @cc_cons(%1319, %1318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1320) : (i64) -> ()
      %1321 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1321) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1322 = func.call @stack_pop_pointer() : () -> i64
      %1323 = func.call @stack_pop_pointer() : () -> i64
      %1324 = func.call @cc_cons(%1323, %1322) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1325 = arith.addi %1324, %__rlasp_stack_elide_zero_49 : i64
      %1326 = func.call @stack_pop_pointer() : () -> i64
      %1327 = func.call @cc_cons(%1326, %1325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1328 = arith.addi %1327, %__rlasp_stack_elide_zero_50 : i64
      %1329 = func.call @stack_pop_pointer() : () -> i64
      %1330 = func.call @cc_cons(%1329, %1328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @stack_pop_pointer() : () -> i64
      %1333 = func.call @cc_cons(%1332, %1331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1334 = arith.addi %1333, %__rlasp_stack_elide_zero_51 : i64
      %1335 = func.call @stack_pop_pointer() : () -> i64
      %1336 = func.call @cc_cons(%1335, %1334) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1337 = arith.addi %1336, %__rlasp_stack_elide_zero_52 : i64
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = func.call @cc_cons(%1338, %1337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = func.call @stack_pop_pointer() : () -> i64
      %1342 = func.call @cc_cons(%1341, %1340) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1343 = arith.addi %1342, %__rlasp_stack_elide_zero_53 : i64
      %1344 = func.call @stack_pop_pointer() : () -> i64
      %1345 = func.call @cc_cons(%1344, %1343) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1346 = arith.addi %1345, %__rlasp_stack_elide_zero_54 : i64
      %1347 = func.call @stack_pop_pointer() : () -> i64
      %1348 = func.call @cc_cons(%1347, %1346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = func.call @stack_pop_pointer() : () -> i64
      %1351 = func.call @cc_cons(%1350, %1349) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1352 = arith.addi %1351, %__rlasp_stack_elide_zero_55 : i64
      %1353 = func.call @stack_pop_pointer() : () -> i64
      %1354 = func.call @cc_cons(%1353, %1352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1355 = arith.addi %1354, %__rlasp_stack_elide_zero_56 : i64
      %1356 = func.call @stack_pop_pointer() : () -> i64
      %1357 = func.call @cc_cons(%1356, %1355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1358 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1359 = arith.constant 4 : i64
      %1360 = func.call @cc_make_string(%1358, %1359) : (!llvm.ptr, i64) -> i64
      %1361 = func.call @cc_nil_value() : () -> i64
      %1362 = func.call @cc_intern(%1360, %1361) : (i64, i64) -> i64
      %1363 = func.call @cc_nil_value() : () -> i64
      %1364 = func.call @cc_cons(%1362, %1363) : (i64, i64) -> i64
      %1365 = func.call @cc_values_pack(%1364) : (i64) -> i64
      func.call @stack_push_pointer(%1362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1369 = arith.addi %1368, %__rlasp_stack_elide_zero_57 : i64
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_cons(%1370, %1369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1372 = arith.addi %1371, %__rlasp_stack_elide_zero_58 : i64
      %1373 = func.call @stack_pop_pointer() : () -> i64
      %1374 = func.call @cc_cons(%1373, %1372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1375 = arith.addi %1374, %__rlasp_stack_elide_zero_59 : i64
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @cc_cons(%1376, %1375) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1378 = arith.addi %1377, %__rlasp_stack_elide_zero_60 : i64
      %1634 = arith.constant 4634242382299145 : i64
      %1635 = arith.constant 0 : i64
      %1636 = func.call @cc_make_closure(%1634, %1635) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1637 = arith.addi %1636, %__rlasp_stack_elide_zero_61 : i64
      %1638 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1639 = func.call @stack_pop_pointer() : () -> i64
      %1640 = func.call @stack_pop_pointer() : () -> i64
      %1641 = func.call @cc_cons(%1640, %1639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1645 = arith.addi %1644, %__rlasp_stack_elide_zero_62 : i64
      %1646 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1647 = arith.constant 11 : i64
      %1648 = func.call @cc_make_string(%1646, %1647) : (!llvm.ptr, i64) -> i64
      %1649 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1650 = arith.constant 7 : i64
      %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
      %1652 = func.call @cc_intern(%1648, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      %1656 = func.call @cc_nil_value() : () -> i64
      %1657 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1658 = arith.constant 4 : i64
      %1659 = func.call @cc_make_string(%1657, %1658) : (!llvm.ptr, i64) -> i64
      %1660 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1661 = arith.constant 7 : i64
      %1662 = func.call @cc_make_string(%1660, %1661) : (!llvm.ptr, i64) -> i64
      %1663 = func.call @cc_intern(%1659, %1662) : (i64, i64) -> i64
      %1664 = func.call @cc_nil_value() : () -> i64
      %1665 = func.call @cc_cons(%1663, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_values_pack(%1665) : (i64) -> i64
      %1667 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1668 = arith.constant 6 : i64
      %1669 = func.call @cc_make_string(%1667, %1668) : (!llvm.ptr, i64) -> i64
      %1670 = func.call @cc_nil_value() : () -> i64
      %1671 = func.call @cc_intern(%1669, %1670) : (i64, i64) -> i64
      %1672 = func.call @cc_nil_value() : () -> i64
      %1673 = func.call @cc_cons(%1671, %1672) : (i64, i64) -> i64
      %1674 = func.call @cc_values_pack(%1673) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1675 = arith.addi %1671, %__rlasp_stack_elide_zero_63 : i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_errorp(%1184) : (i64) -> i64
      %1678 = arith.cmpi ne, %1677, %1676 : i64
      %1679 = arith.cmpi eq, %1676, %1676 : i64
      %1680 = arith.andi %1678, %1679 : i1
      %1681 = scf.if %1680 -> (i64) {
        scf.yield %1184 : i64
      } else {
        scf.yield %1676 : i64
      }
      %1682 = func.call @cc_errorp(%1378) : (i64) -> i64
      %1683 = arith.cmpi ne, %1682, %1676 : i64
      %1684 = arith.cmpi eq, %1681, %1676 : i64
      %1685 = arith.andi %1683, %1684 : i1
      %1686 = scf.if %1685 -> (i64) {
        scf.yield %1378 : i64
      } else {
        scf.yield %1681 : i64
      }
      %1687 = func.call @cc_errorp(%1637) : (i64) -> i64
      %1688 = arith.cmpi ne, %1687, %1676 : i64
      %1689 = arith.cmpi eq, %1686, %1676 : i64
      %1690 = arith.andi %1688, %1689 : i1
      %1691 = scf.if %1690 -> (i64) {
        scf.yield %1637 : i64
      } else {
        scf.yield %1686 : i64
      }
      %1692 = func.call @cc_errorp(%1645) : (i64) -> i64
      %1693 = arith.cmpi ne, %1692, %1676 : i64
      %1694 = arith.cmpi eq, %1691, %1676 : i64
      %1695 = arith.andi %1693, %1694 : i1
      %1696 = scf.if %1695 -> (i64) {
        scf.yield %1645 : i64
      } else {
        scf.yield %1691 : i64
      }
      %1697 = func.call @cc_errorp(%1652) : (i64) -> i64
      %1698 = arith.cmpi ne, %1697, %1676 : i64
      %1699 = arith.cmpi eq, %1696, %1676 : i64
      %1700 = arith.andi %1698, %1699 : i1
      %1701 = scf.if %1700 -> (i64) {
        scf.yield %1652 : i64
      } else {
        scf.yield %1696 : i64
      }
      %1702 = func.call @cc_errorp(%1656) : (i64) -> i64
      %1703 = arith.cmpi ne, %1702, %1676 : i64
      %1704 = arith.cmpi eq, %1701, %1676 : i64
      %1705 = arith.andi %1703, %1704 : i1
      %1706 = scf.if %1705 -> (i64) {
        scf.yield %1656 : i64
      } else {
        scf.yield %1701 : i64
      }
      %1707 = func.call @cc_errorp(%1663) : (i64) -> i64
      %1708 = arith.cmpi ne, %1707, %1676 : i64
      %1709 = arith.cmpi eq, %1706, %1676 : i64
      %1710 = arith.andi %1708, %1709 : i1
      %1711 = scf.if %1710 -> (i64) {
        scf.yield %1663 : i64
      } else {
        scf.yield %1706 : i64
      }
      %1712 = func.call @cc_errorp(%1675) : (i64) -> i64
      %1713 = arith.cmpi ne, %1712, %1676 : i64
      %1714 = arith.cmpi eq, %1711, %1676 : i64
      %1715 = arith.andi %1713, %1714 : i1
      %1716 = scf.if %1715 -> (i64) {
        scf.yield %1675 : i64
      } else {
        scf.yield %1711 : i64
      }
      %1717 = arith.cmpi ne, %1716, %1676 : i64
      scf.if %1717 {
        func.call @stack_push_pointer(%1716) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1184) : (i64) -> ()
        func.call @stack_push_pointer(%1378) : (i64) -> ()
        func.call @stack_push_pointer(%1637) : (i64) -> ()
        func.call @stack_push_pointer(%1645) : (i64) -> ()
        func.call @stack_push_pointer(%1652) : (i64) -> ()
        func.call @stack_push_pointer(%1656) : (i64) -> ()
        func.call @stack_push_pointer(%1663) : (i64) -> ()
        func.call @stack_push_pointer(%1675) : (i64) -> ()
        %1718 = llvm.mlir.addressof @str121 : !llvm.ptr
        %1719 = func.call @cc_make_function_ref_const(%1718) : (!llvm.ptr) -> i64
        %1720 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1719, %1720) : (i64, i64) -> ()
      }
      %1721 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1721 : i64
    }
    %1722 = func.call @cc_nil_value() : () -> i64
    %1723 = func.call @cc_errorp(%1175) : (i64) -> i64
    %1724 = arith.cmpi ne, %1723, %1722 : i64
    %1725 = scf.if %1724 -> (i64) {
      scf.yield %1175 : i64
    } else {
      %1726 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1727 = arith.constant 19 : i64
      %1728 = func.call @cc_make_string(%1726, %1727) : (!llvm.ptr, i64) -> i64
      %1729 = func.call @cc_nil_value() : () -> i64
      %1730 = func.call @cc_intern(%1728, %1729) : (i64, i64) -> i64
      %1731 = func.call @cc_nil_value() : () -> i64
      %1732 = func.call @cc_cons(%1730, %1731) : (i64, i64) -> i64
      %1733 = func.call @cc_values_pack(%1732) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1734 = arith.addi %1730, %__rlasp_stack_elide_zero_64 : i64
      %1735 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1736 = arith.constant 3 : i64
      %1737 = func.call @cc_make_string(%1735, %1736) : (!llvm.ptr, i64) -> i64
      %1738 = func.call @cc_nil_value() : () -> i64
      %1739 = func.call @cc_intern(%1737, %1738) : (i64, i64) -> i64
      %1740 = func.call @cc_nil_value() : () -> i64
      %1741 = func.call @cc_cons(%1739, %1740) : (i64, i64) -> i64
      %1742 = func.call @cc_values_pack(%1741) : (i64) -> i64
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      %1743 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1744 = arith.constant 4 : i64
      %1745 = func.call @cc_make_string(%1743, %1744) : (!llvm.ptr, i64) -> i64
      %1746 = func.call @cc_nil_value() : () -> i64
      %1747 = func.call @cc_intern(%1745, %1746) : (i64, i64) -> i64
      %1748 = func.call @cc_nil_value() : () -> i64
      %1749 = func.call @cc_cons(%1747, %1748) : (i64, i64) -> i64
      %1750 = func.call @cc_values_pack(%1749) : (i64) -> i64
      func.call @stack_push_pointer(%1747) : (i64) -> ()
      %1751 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1752 = arith.constant 4 : i64
      %1753 = func.call @cc_make_string(%1751, %1752) : (!llvm.ptr, i64) -> i64
      %1754 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1755 = arith.constant 11 : i64
      %1756 = func.call @cc_make_string(%1754, %1755) : (!llvm.ptr, i64) -> i64
      %1757 = func.call @cc_intern(%1753, %1756) : (i64, i64) -> i64
      %1758 = func.call @cc_nil_value() : () -> i64
      %1759 = func.call @cc_cons(%1757, %1758) : (i64, i64) -> i64
      %1760 = func.call @cc_values_pack(%1759) : (i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1761 = func.call @stack_pop_pointer() : () -> i64
      %1762 = func.call @stack_pop_pointer() : () -> i64
      %1763 = func.call @cc_cons(%1762, %1761) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1764 = arith.addi %1763, %__rlasp_stack_elide_zero_65 : i64
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = func.call @cc_cons(%1765, %1764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1767 = func.call @stack_pop_pointer() : () -> i64
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @cc_cons(%1768, %1767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1770 = arith.addi %1769, %__rlasp_stack_elide_zero_66 : i64
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @cc_cons(%1771, %1770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1772) : (i64) -> ()
      %1773 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1774 = arith.constant 6 : i64
      %1775 = func.call @cc_make_string(%1773, %1774) : (!llvm.ptr, i64) -> i64
      %1776 = func.call @cc_nil_value() : () -> i64
      %1777 = func.call @cc_intern(%1775, %1776) : (i64, i64) -> i64
      %1778 = func.call @cc_nil_value() : () -> i64
      %1779 = func.call @cc_cons(%1777, %1778) : (i64, i64) -> i64
      %1780 = func.call @cc_values_pack(%1779) : (i64) -> i64
      func.call @stack_push_pointer(%1777) : (i64) -> ()
      %1781 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1782 = arith.constant 20 : i64
      %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
      %1784 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1785 = arith.constant 2 : i64
      %1786 = func.call @cc_make_string(%1784, %1785) : (!llvm.ptr, i64) -> i64
      %1787 = func.call @cc_intern(%1783, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_nil_value() : () -> i64
      %1789 = func.call @cc_cons(%1787, %1788) : (i64, i64) -> i64
      %1790 = func.call @cc_values_pack(%1789) : (i64) -> i64
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      %1791 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1791) : (i64) -> ()
      %1792 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1793 = arith.constant 24 : i64
      %1794 = func.call @cc_make_string(%1792, %1793) : (!llvm.ptr, i64) -> i64
      %1795 = func.call @cc_nil_value() : () -> i64
      %1796 = func.call @cc_intern(%1794, %1795) : (i64, i64) -> i64
      %1797 = func.call @cc_nil_value() : () -> i64
      %1798 = func.call @cc_cons(%1796, %1797) : (i64, i64) -> i64
      %1799 = func.call @cc_values_pack(%1798) : (i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1800 = arith.addi %1796, %__rlasp_stack_elide_zero_67 : i64
      %1801 = func.call @stack_pop_pointer() : () -> i64
      %1802 = func.call @cc_cons(%1800, %1801) : (i64, i64) -> i64
      %1803 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1804 = arith.constant 5 : i64
      %1805 = func.call @cc_make_string(%1803, %1804) : (!llvm.ptr, i64) -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = func.call @cc_intern(%1805, %1806) : (i64, i64) -> i64
      %1808 = func.call @cc_nil_value() : () -> i64
      %1809 = func.call @cc_cons(%1807, %1808) : (i64, i64) -> i64
      %1810 = func.call @cc_values_pack(%1809) : (i64) -> i64
      %1811 = func.call @cc_cons(%1807, %1802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1811) : (i64) -> ()
      %1812 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1813 = arith.constant 6 : i64
      %1814 = func.call @cc_make_string(%1812, %1813) : (!llvm.ptr, i64) -> i64
      %1815 = func.call @cc_nil_value() : () -> i64
      %1816 = func.call @cc_intern(%1814, %1815) : (i64, i64) -> i64
      %1817 = func.call @cc_nil_value() : () -> i64
      %1818 = func.call @cc_cons(%1816, %1817) : (i64, i64) -> i64
      %1819 = func.call @cc_values_pack(%1818) : (i64) -> i64
      func.call @stack_push_pointer(%1816) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1820 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1821 = arith.constant 5 : i64
      %1822 = func.call @cc_make_string(%1820, %1821) : (!llvm.ptr, i64) -> i64
      %1823 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1824 = arith.constant 11 : i64
      %1825 = func.call @cc_make_string(%1823, %1824) : (!llvm.ptr, i64) -> i64
      %1826 = func.call @cc_intern(%1822, %1825) : (i64, i64) -> i64
      %1827 = func.call @cc_nil_value() : () -> i64
      %1828 = func.call @cc_cons(%1826, %1827) : (i64, i64) -> i64
      %1829 = func.call @cc_values_pack(%1828) : (i64) -> i64
      func.call @stack_push_pointer(%1826) : (i64) -> ()
      %1830 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1830) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1831 = func.call @stack_pop_pointer() : () -> i64
      %1832 = func.call @stack_pop_pointer() : () -> i64
      %1833 = func.call @cc_cons(%1832, %1831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1834 = arith.addi %1833, %__rlasp_stack_elide_zero_68 : i64
      %1835 = func.call @stack_pop_pointer() : () -> i64
      %1836 = func.call @cc_cons(%1835, %1834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @cc_cons(%1838, %1837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1840 = arith.addi %1839, %__rlasp_stack_elide_zero_69 : i64
      %1841 = func.call @stack_pop_pointer() : () -> i64
      %1842 = func.call @cc_cons(%1841, %1840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1843 = arith.addi %1842, %__rlasp_stack_elide_zero_70 : i64
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @cc_cons(%1844, %1843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1846 = func.call @stack_pop_pointer() : () -> i64
      %1847 = func.call @stack_pop_pointer() : () -> i64
      %1848 = func.call @cc_cons(%1847, %1846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1849 = arith.addi %1848, %__rlasp_stack_elide_zero_71 : i64
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @cc_cons(%1850, %1849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1852 = arith.addi %1851, %__rlasp_stack_elide_zero_72 : i64
      %1853 = func.call @stack_pop_pointer() : () -> i64
      %1854 = func.call @cc_cons(%1853, %1852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @stack_pop_pointer() : () -> i64
      %1857 = func.call @cc_cons(%1856, %1855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1858 = arith.addi %1857, %__rlasp_stack_elide_zero_73 : i64
      %1859 = func.call @stack_pop_pointer() : () -> i64
      %1860 = func.call @cc_cons(%1859, %1858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1860) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1861 = func.call @stack_pop_pointer() : () -> i64
      %1862 = func.call @stack_pop_pointer() : () -> i64
      %1863 = func.call @cc_cons(%1862, %1861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1864 = arith.addi %1863, %__rlasp_stack_elide_zero_74 : i64
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @cc_cons(%1865, %1864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1866) : (i64) -> ()
      %1867 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1868 = arith.constant 17 : i64
      %1869 = func.call @cc_make_string(%1867, %1868) : (!llvm.ptr, i64) -> i64
      %1870 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1871 = arith.constant 2 : i64
      %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
      %1873 = func.call @cc_intern(%1869, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_nil_value() : () -> i64
      %1875 = func.call @cc_cons(%1873, %1874) : (i64, i64) -> i64
      %1876 = func.call @cc_values_pack(%1875) : (i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      %1877 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1878 = arith.constant 6 : i64
      %1879 = func.call @cc_make_string(%1877, %1878) : (!llvm.ptr, i64) -> i64
      %1880 = func.call @cc_nil_value() : () -> i64
      %1881 = func.call @cc_intern(%1879, %1880) : (i64, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_cons(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_values_pack(%1883) : (i64) -> i64
      func.call @stack_push_pointer(%1881) : (i64) -> ()
      %1885 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1886 = arith.constant 6 : i64
      %1887 = func.call @cc_make_string(%1885, %1886) : (!llvm.ptr, i64) -> i64
      %1888 = func.call @cc_nil_value() : () -> i64
      %1889 = func.call @cc_intern(%1887, %1888) : (i64, i64) -> i64
      %1890 = func.call @cc_nil_value() : () -> i64
      %1891 = func.call @cc_cons(%1889, %1890) : (i64, i64) -> i64
      %1892 = func.call @cc_values_pack(%1891) : (i64) -> i64
      func.call @stack_push_pointer(%1889) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1893 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1894 = arith.constant 4 : i64
      %1895 = func.call @cc_make_string(%1893, %1894) : (!llvm.ptr, i64) -> i64
      %1896 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1897 = arith.constant 11 : i64
      %1898 = func.call @cc_make_string(%1896, %1897) : (!llvm.ptr, i64) -> i64
      %1899 = func.call @cc_intern(%1895, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_cons(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_values_pack(%1901) : (i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      %1903 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1904 = arith.constant 6 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1907 = arith.constant 2 : i64
      %1908 = func.call @cc_make_string(%1906, %1907) : (!llvm.ptr, i64) -> i64
      %1909 = func.call @cc_intern(%1905, %1908) : (i64, i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = func.call @cc_cons(%1909, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_values_pack(%1911) : (i64) -> i64
      func.call @stack_push_pointer(%1909) : (i64) -> ()
      %1913 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1914 = arith.constant 3 : i64
      %1915 = func.call @cc_make_string(%1913, %1914) : (!llvm.ptr, i64) -> i64
      %1916 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1917 = arith.constant 11 : i64
      %1918 = func.call @cc_make_string(%1916, %1917) : (!llvm.ptr, i64) -> i64
      %1919 = func.call @cc_intern(%1915, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_nil_value() : () -> i64
      %1921 = func.call @cc_cons(%1919, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_values_pack(%1921) : (i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      %1923 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1924 = arith.constant 4 : i64
      %1925 = func.call @cc_make_string(%1923, %1924) : (!llvm.ptr, i64) -> i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_intern(%1925, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_nil_value() : () -> i64
      %1929 = func.call @cc_cons(%1927, %1928) : (i64, i64) -> i64
      %1930 = func.call @cc_values_pack(%1929) : (i64) -> i64
      func.call @stack_push_pointer(%1927) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1931 = func.call @stack_pop_pointer() : () -> i64
      %1932 = func.call @stack_pop_pointer() : () -> i64
      %1933 = func.call @cc_cons(%1932, %1931) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1934 = arith.addi %1933, %__rlasp_stack_elide_zero_75 : i64
      %1935 = func.call @stack_pop_pointer() : () -> i64
      %1936 = func.call @cc_cons(%1935, %1934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1937 = func.call @stack_pop_pointer() : () -> i64
      %1938 = func.call @stack_pop_pointer() : () -> i64
      %1939 = func.call @cc_cons(%1938, %1937) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1940 = arith.addi %1939, %__rlasp_stack_elide_zero_76 : i64
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = func.call @cc_cons(%1941, %1940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1942) : (i64) -> ()
      %1943 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1943) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1944 = func.call @stack_pop_pointer() : () -> i64
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_cons(%1945, %1944) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1947 = arith.addi %1946, %__rlasp_stack_elide_zero_77 : i64
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @cc_cons(%1948, %1947) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1950 = arith.addi %1949, %__rlasp_stack_elide_zero_78 : i64
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_cons(%1951, %1950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1956 = arith.addi %1955, %__rlasp_stack_elide_zero_79 : i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1959 = arith.addi %1958, %__rlasp_stack_elide_zero_80 : i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @cc_cons(%1963, %1962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1965 = arith.addi %1964, %__rlasp_stack_elide_zero_81 : i64
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @cc_cons(%1966, %1965) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1968 = arith.addi %1967, %__rlasp_stack_elide_zero_82 : i64
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @cc_cons(%1969, %1968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1970) : (i64) -> ()
      %1971 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1972 = arith.constant 12 : i64
      %1973 = func.call @cc_make_string(%1971, %1972) : (!llvm.ptr, i64) -> i64
      %1974 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1975 = arith.constant 2 : i64
      %1976 = func.call @cc_make_string(%1974, %1975) : (!llvm.ptr, i64) -> i64
      %1977 = func.call @cc_intern(%1973, %1976) : (i64, i64) -> i64
      %1978 = func.call @cc_nil_value() : () -> i64
      %1979 = func.call @cc_cons(%1977, %1978) : (i64, i64) -> i64
      %1980 = func.call @cc_values_pack(%1979) : (i64) -> i64
      func.call @stack_push_pointer(%1977) : (i64) -> ()
      %1981 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1982 = arith.constant 6 : i64
      %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
      %1984 = func.call @cc_nil_value() : () -> i64
      %1985 = func.call @cc_intern(%1983, %1984) : (i64, i64) -> i64
      %1986 = func.call @cc_nil_value() : () -> i64
      %1987 = func.call @cc_cons(%1985, %1986) : (i64, i64) -> i64
      %1988 = func.call @cc_values_pack(%1987) : (i64) -> i64
      func.call @stack_push_pointer(%1985) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1989 = func.call @stack_pop_pointer() : () -> i64
      %1990 = func.call @stack_pop_pointer() : () -> i64
      %1991 = func.call @cc_cons(%1990, %1989) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1992 = arith.addi %1991, %__rlasp_stack_elide_zero_83 : i64
      %1993 = func.call @stack_pop_pointer() : () -> i64
      %1994 = func.call @cc_cons(%1993, %1992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1994) : (i64) -> ()
      %1995 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1996 = arith.constant 4 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      %1998 = func.call @cc_nil_value() : () -> i64
      %1999 = func.call @cc_intern(%1997, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2003 = func.call @stack_pop_pointer() : () -> i64
      %2004 = func.call @stack_pop_pointer() : () -> i64
      %2005 = func.call @cc_cons(%2004, %2003) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %2006 = arith.addi %2005, %__rlasp_stack_elide_zero_84 : i64
      %2007 = func.call @stack_pop_pointer() : () -> i64
      %2008 = func.call @cc_cons(%2007, %2006) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %2009 = arith.addi %2008, %__rlasp_stack_elide_zero_85 : i64
      %2010 = func.call @stack_pop_pointer() : () -> i64
      %2011 = func.call @cc_cons(%2010, %2009) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %2012 = arith.addi %2011, %__rlasp_stack_elide_zero_86 : i64
      %2013 = func.call @stack_pop_pointer() : () -> i64
      %2014 = func.call @cc_cons(%2013, %2012) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %2015 = arith.addi %2014, %__rlasp_stack_elide_zero_87 : i64
      %2016 = func.call @stack_pop_pointer() : () -> i64
      %2017 = func.call @cc_cons(%2016, %2015) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2018 = arith.addi %2017, %__rlasp_stack_elide_zero_88 : i64
      %2148 = arith.constant 130642754928654 : i64
      %2149 = arith.constant 0 : i64
      %2150 = func.call @cc_make_closure(%2148, %2149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2151 = arith.addi %2150, %__rlasp_stack_elide_zero_89 : i64
      %2152 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2153 = func.call @stack_pop_pointer() : () -> i64
      %2154 = func.call @stack_pop_pointer() : () -> i64
      %2155 = func.call @cc_cons(%2154, %2153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2156 = func.call @stack_pop_pointer() : () -> i64
      %2157 = func.call @stack_pop_pointer() : () -> i64
      %2158 = func.call @cc_cons(%2157, %2156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2159 = arith.addi %2158, %__rlasp_stack_elide_zero_90 : i64
      %2160 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2161 = arith.constant 11 : i64
      %2162 = func.call @cc_make_string(%2160, %2161) : (!llvm.ptr, i64) -> i64
      %2163 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2164 = arith.constant 7 : i64
      %2165 = func.call @cc_make_string(%2163, %2164) : (!llvm.ptr, i64) -> i64
      %2166 = func.call @cc_intern(%2162, %2165) : (i64, i64) -> i64
      %2167 = func.call @cc_nil_value() : () -> i64
      %2168 = func.call @cc_cons(%2166, %2167) : (i64, i64) -> i64
      %2169 = func.call @cc_values_pack(%2168) : (i64) -> i64
      %2170 = func.call @cc_nil_value() : () -> i64
      %2171 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2172 = arith.constant 4 : i64
      %2173 = func.call @cc_make_string(%2171, %2172) : (!llvm.ptr, i64) -> i64
      %2174 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2175 = arith.constant 7 : i64
      %2176 = func.call @cc_make_string(%2174, %2175) : (!llvm.ptr, i64) -> i64
      %2177 = func.call @cc_intern(%2173, %2176) : (i64, i64) -> i64
      %2178 = func.call @cc_nil_value() : () -> i64
      %2179 = func.call @cc_cons(%2177, %2178) : (i64, i64) -> i64
      %2180 = func.call @cc_values_pack(%2179) : (i64) -> i64
      %2181 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2182 = arith.constant 6 : i64
      %2183 = func.call @cc_make_string(%2181, %2182) : (!llvm.ptr, i64) -> i64
      %2184 = func.call @cc_nil_value() : () -> i64
      %2185 = func.call @cc_intern(%2183, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2189 = arith.addi %2185, %__rlasp_stack_elide_zero_91 : i64
      %2190 = func.call @cc_nil_value() : () -> i64
      %2191 = func.call @cc_errorp(%1734) : (i64) -> i64
      %2192 = arith.cmpi ne, %2191, %2190 : i64
      %2193 = arith.cmpi eq, %2190, %2190 : i64
      %2194 = arith.andi %2192, %2193 : i1
      %2195 = scf.if %2194 -> (i64) {
        scf.yield %1734 : i64
      } else {
        scf.yield %2190 : i64
      }
      %2196 = func.call @cc_errorp(%2018) : (i64) -> i64
      %2197 = arith.cmpi ne, %2196, %2190 : i64
      %2198 = arith.cmpi eq, %2195, %2190 : i64
      %2199 = arith.andi %2197, %2198 : i1
      %2200 = scf.if %2199 -> (i64) {
        scf.yield %2018 : i64
      } else {
        scf.yield %2195 : i64
      }
      %2201 = func.call @cc_errorp(%2151) : (i64) -> i64
      %2202 = arith.cmpi ne, %2201, %2190 : i64
      %2203 = arith.cmpi eq, %2200, %2190 : i64
      %2204 = arith.andi %2202, %2203 : i1
      %2205 = scf.if %2204 -> (i64) {
        scf.yield %2151 : i64
      } else {
        scf.yield %2200 : i64
      }
      %2206 = func.call @cc_errorp(%2159) : (i64) -> i64
      %2207 = arith.cmpi ne, %2206, %2190 : i64
      %2208 = arith.cmpi eq, %2205, %2190 : i64
      %2209 = arith.andi %2207, %2208 : i1
      %2210 = scf.if %2209 -> (i64) {
        scf.yield %2159 : i64
      } else {
        scf.yield %2205 : i64
      }
      %2211 = func.call @cc_errorp(%2166) : (i64) -> i64
      %2212 = arith.cmpi ne, %2211, %2190 : i64
      %2213 = arith.cmpi eq, %2210, %2190 : i64
      %2214 = arith.andi %2212, %2213 : i1
      %2215 = scf.if %2214 -> (i64) {
        scf.yield %2166 : i64
      } else {
        scf.yield %2210 : i64
      }
      %2216 = func.call @cc_errorp(%2170) : (i64) -> i64
      %2217 = arith.cmpi ne, %2216, %2190 : i64
      %2218 = arith.cmpi eq, %2215, %2190 : i64
      %2219 = arith.andi %2217, %2218 : i1
      %2220 = scf.if %2219 -> (i64) {
        scf.yield %2170 : i64
      } else {
        scf.yield %2215 : i64
      }
      %2221 = func.call @cc_errorp(%2177) : (i64) -> i64
      %2222 = arith.cmpi ne, %2221, %2190 : i64
      %2223 = arith.cmpi eq, %2220, %2190 : i64
      %2224 = arith.andi %2222, %2223 : i1
      %2225 = scf.if %2224 -> (i64) {
        scf.yield %2177 : i64
      } else {
        scf.yield %2220 : i64
      }
      %2226 = func.call @cc_errorp(%2189) : (i64) -> i64
      %2227 = arith.cmpi ne, %2226, %2190 : i64
      %2228 = arith.cmpi eq, %2225, %2190 : i64
      %2229 = arith.andi %2227, %2228 : i1
      %2230 = scf.if %2229 -> (i64) {
        scf.yield %2189 : i64
      } else {
        scf.yield %2225 : i64
      }
      %2231 = arith.cmpi ne, %2230, %2190 : i64
      scf.if %2231 {
        func.call @stack_push_pointer(%2230) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1734) : (i64) -> ()
        func.call @stack_push_pointer(%2018) : (i64) -> ()
        func.call @stack_push_pointer(%2151) : (i64) -> ()
        func.call @stack_push_pointer(%2159) : (i64) -> ()
        func.call @stack_push_pointer(%2166) : (i64) -> ()
        func.call @stack_push_pointer(%2170) : (i64) -> ()
        func.call @stack_push_pointer(%2177) : (i64) -> ()
        func.call @stack_push_pointer(%2189) : (i64) -> ()
        %2232 = llvm.mlir.addressof @str161 : !llvm.ptr
        %2233 = func.call @cc_make_function_ref_const(%2232) : (!llvm.ptr) -> i64
        %2234 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2233, %2234) : (i64, i64) -> ()
      }
      %2235 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2235 : i64
    }
    %2236 = func.call @cc_nil_value() : () -> i64
    %2237 = func.call @cc_errorp(%1725) : (i64) -> i64
    %2238 = arith.cmpi ne, %2237, %2236 : i64
    %2239 = scf.if %2238 -> (i64) {
      scf.yield %1725 : i64
    } else {
      %2240 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2241 = arith.constant 18 : i64
      %2242 = func.call @cc_make_string(%2240, %2241) : (!llvm.ptr, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_intern(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_nil_value() : () -> i64
      %2246 = func.call @cc_cons(%2244, %2245) : (i64, i64) -> i64
      %2247 = func.call @cc_values_pack(%2246) : (i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2248 = arith.addi %2244, %__rlasp_stack_elide_zero_92 : i64
      %2249 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2250 = arith.constant 3 : i64
      %2251 = func.call @cc_make_string(%2249, %2250) : (!llvm.ptr, i64) -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_intern(%2251, %2252) : (i64, i64) -> i64
      %2254 = func.call @cc_nil_value() : () -> i64
      %2255 = func.call @cc_cons(%2253, %2254) : (i64, i64) -> i64
      %2256 = func.call @cc_values_pack(%2255) : (i64) -> i64
      func.call @stack_push_pointer(%2253) : (i64) -> ()
      %2257 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2258 = arith.constant 4 : i64
      %2259 = func.call @cc_make_string(%2257, %2258) : (!llvm.ptr, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_intern(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_nil_value() : () -> i64
      %2263 = func.call @cc_cons(%2261, %2262) : (i64, i64) -> i64
      %2264 = func.call @cc_values_pack(%2263) : (i64) -> i64
      func.call @stack_push_pointer(%2261) : (i64) -> ()
      %2265 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2266 = arith.constant 9 : i64
      %2267 = func.call @cc_make_string(%2265, %2266) : (!llvm.ptr, i64) -> i64
      %2268 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2269 = arith.constant 2 : i64
      %2270 = func.call @cc_make_string(%2268, %2269) : (!llvm.ptr, i64) -> i64
      %2271 = func.call @cc_intern(%2267, %2270) : (i64, i64) -> i64
      %2272 = func.call @cc_nil_value() : () -> i64
      %2273 = func.call @cc_cons(%2271, %2272) : (i64, i64) -> i64
      %2274 = func.call @cc_values_pack(%2273) : (i64) -> i64
      func.call @stack_push_pointer(%2271) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2275 = func.call @stack_pop_pointer() : () -> i64
      %2276 = func.call @stack_pop_pointer() : () -> i64
      %2277 = func.call @cc_cons(%2276, %2275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2278 = func.call @stack_pop_pointer() : () -> i64
      %2279 = func.call @stack_pop_pointer() : () -> i64
      %2280 = func.call @cc_cons(%2279, %2278) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2281 = arith.addi %2280, %__rlasp_stack_elide_zero_93 : i64
      %2282 = func.call @stack_pop_pointer() : () -> i64
      %2283 = func.call @cc_cons(%2282, %2281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2283) : (i64) -> ()
      %2284 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2285 = arith.constant 4 : i64
      %2286 = func.call @cc_make_string(%2284, %2285) : (!llvm.ptr, i64) -> i64
      %2287 = func.call @cc_nil_value() : () -> i64
      %2288 = func.call @cc_intern(%2286, %2287) : (i64, i64) -> i64
      %2289 = func.call @cc_nil_value() : () -> i64
      %2290 = func.call @cc_cons(%2288, %2289) : (i64, i64) -> i64
      %2291 = func.call @cc_values_pack(%2290) : (i64) -> i64
      func.call @stack_push_pointer(%2288) : (i64) -> ()
      %2292 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2293 = arith.constant 4 : i64
      %2294 = func.call @cc_make_string(%2292, %2293) : (!llvm.ptr, i64) -> i64
      %2295 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2296 = arith.constant 11 : i64
      %2297 = func.call @cc_make_string(%2295, %2296) : (!llvm.ptr, i64) -> i64
      %2298 = func.call @cc_intern(%2294, %2297) : (i64, i64) -> i64
      %2299 = func.call @cc_nil_value() : () -> i64
      %2300 = func.call @cc_cons(%2298, %2299) : (i64, i64) -> i64
      %2301 = func.call @cc_values_pack(%2300) : (i64) -> i64
      func.call @stack_push_pointer(%2298) : (i64) -> ()
      %2302 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @cc_cons(%2304, %2303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2306 = arith.addi %2305, %__rlasp_stack_elide_zero_94 : i64
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @cc_cons(%2307, %2306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2309 = func.call @stack_pop_pointer() : () -> i64
      %2310 = func.call @stack_pop_pointer() : () -> i64
      %2311 = func.call @cc_cons(%2310, %2309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2312 = arith.addi %2311, %__rlasp_stack_elide_zero_95 : i64
      %2313 = func.call @stack_pop_pointer() : () -> i64
      %2314 = func.call @cc_cons(%2313, %2312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2314) : (i64) -> ()
      %2315 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2316 = arith.constant 4 : i64
      %2317 = func.call @cc_make_string(%2315, %2316) : (!llvm.ptr, i64) -> i64
      %2318 = func.call @cc_nil_value() : () -> i64
      %2319 = func.call @cc_intern(%2317, %2318) : (i64, i64) -> i64
      %2320 = func.call @cc_nil_value() : () -> i64
      %2321 = func.call @cc_cons(%2319, %2320) : (i64, i64) -> i64
      %2322 = func.call @cc_values_pack(%2321) : (i64) -> i64
      func.call @stack_push_pointer(%2319) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = func.call @cc_cons(%2324, %2323) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2326 = arith.addi %2325, %__rlasp_stack_elide_zero_96 : i64
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @cc_cons(%2327, %2326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @stack_pop_pointer() : () -> i64
      %2331 = func.call @cc_cons(%2330, %2329) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2332 = arith.addi %2331, %__rlasp_stack_elide_zero_97 : i64
      %2333 = func.call @stack_pop_pointer() : () -> i64
      %2334 = func.call @cc_cons(%2333, %2332) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2335 = arith.addi %2334, %__rlasp_stack_elide_zero_98 : i64
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @cc_cons(%2336, %2335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2337) : (i64) -> ()
      %2338 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2339 = arith.constant 9 : i64
      %2340 = func.call @cc_make_string(%2338, %2339) : (!llvm.ptr, i64) -> i64
      %2341 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2342 = arith.constant 2 : i64
      %2343 = func.call @cc_make_string(%2341, %2342) : (!llvm.ptr, i64) -> i64
      %2344 = func.call @cc_intern(%2340, %2343) : (i64, i64) -> i64
      %2345 = func.call @cc_nil_value() : () -> i64
      %2346 = func.call @cc_cons(%2344, %2345) : (i64, i64) -> i64
      %2347 = func.call @cc_values_pack(%2346) : (i64) -> i64
      func.call @stack_push_pointer(%2344) : (i64) -> ()
      %2348 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2349 = arith.constant 4 : i64
      %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
      %2351 = func.call @cc_nil_value() : () -> i64
      %2352 = func.call @cc_intern(%2350, %2351) : (i64, i64) -> i64
      %2353 = func.call @cc_nil_value() : () -> i64
      %2354 = func.call @cc_cons(%2352, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_values_pack(%2354) : (i64) -> i64
      func.call @stack_push_pointer(%2352) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @stack_pop_pointer() : () -> i64
      %2358 = func.call @cc_cons(%2357, %2356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2358) : (i64) -> ()
      %2359 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2360 = arith.constant 4 : i64
      %2361 = func.call @cc_make_string(%2359, %2360) : (!llvm.ptr, i64) -> i64
      %2362 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2363 = arith.constant 11 : i64
      %2364 = func.call @cc_make_string(%2362, %2363) : (!llvm.ptr, i64) -> i64
      %2365 = func.call @cc_intern(%2361, %2364) : (i64, i64) -> i64
      %2366 = func.call @cc_nil_value() : () -> i64
      %2367 = func.call @cc_cons(%2365, %2366) : (i64, i64) -> i64
      %2368 = func.call @cc_values_pack(%2367) : (i64) -> i64
      func.call @stack_push_pointer(%2365) : (i64) -> ()
      %2369 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2370 = arith.constant 4 : i64
      %2371 = func.call @cc_make_string(%2369, %2370) : (!llvm.ptr, i64) -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_intern(%2371, %2372) : (i64, i64) -> i64
      %2374 = func.call @cc_nil_value() : () -> i64
      %2375 = func.call @cc_cons(%2373, %2374) : (i64, i64) -> i64
      %2376 = func.call @cc_values_pack(%2375) : (i64) -> i64
      func.call @stack_push_pointer(%2373) : (i64) -> ()
      %2377 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2378 = arith.constant 20 : i64
      %2379 = func.call @cc_make_string(%2377, %2378) : (!llvm.ptr, i64) -> i64
      %2380 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2381 = arith.constant 2 : i64
      %2382 = func.call @cc_make_string(%2380, %2381) : (!llvm.ptr, i64) -> i64
      %2383 = func.call @cc_intern(%2379, %2382) : (i64, i64) -> i64
      %2384 = func.call @cc_nil_value() : () -> i64
      %2385 = func.call @cc_cons(%2383, %2384) : (i64, i64) -> i64
      %2386 = func.call @cc_values_pack(%2385) : (i64) -> i64
      func.call @stack_push_pointer(%2383) : (i64) -> ()
      %2387 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2387) : (i64) -> ()
      %2388 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2389 = arith.constant 23 : i64
      %2390 = func.call @cc_make_string(%2388, %2389) : (!llvm.ptr, i64) -> i64
      %2391 = func.call @cc_nil_value() : () -> i64
      %2392 = func.call @cc_intern(%2390, %2391) : (i64, i64) -> i64
      %2393 = func.call @cc_nil_value() : () -> i64
      %2394 = func.call @cc_cons(%2392, %2393) : (i64, i64) -> i64
      %2395 = func.call @cc_values_pack(%2394) : (i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2396 = arith.addi %2392, %__rlasp_stack_elide_zero_99 : i64
      %2397 = func.call @stack_pop_pointer() : () -> i64
      %2398 = func.call @cc_cons(%2396, %2397) : (i64, i64) -> i64
      %2399 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2400 = arith.constant 5 : i64
      %2401 = func.call @cc_make_string(%2399, %2400) : (!llvm.ptr, i64) -> i64
      %2402 = func.call @cc_nil_value() : () -> i64
      %2403 = func.call @cc_intern(%2401, %2402) : (i64, i64) -> i64
      %2404 = func.call @cc_nil_value() : () -> i64
      %2405 = func.call @cc_cons(%2403, %2404) : (i64, i64) -> i64
      %2406 = func.call @cc_values_pack(%2405) : (i64) -> i64
      %2407 = func.call @cc_cons(%2403, %2398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2407) : (i64) -> ()
      %2408 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2409 = arith.constant 6 : i64
      %2410 = func.call @cc_make_string(%2408, %2409) : (!llvm.ptr, i64) -> i64
      %2411 = func.call @cc_nil_value() : () -> i64
      %2412 = func.call @cc_intern(%2410, %2411) : (i64, i64) -> i64
      %2413 = func.call @cc_nil_value() : () -> i64
      %2414 = func.call @cc_cons(%2412, %2413) : (i64, i64) -> i64
      %2415 = func.call @cc_values_pack(%2414) : (i64) -> i64
      func.call @stack_push_pointer(%2412) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2416 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2417 = arith.constant 9 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      %2419 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2420 = arith.constant 2 : i64
      %2421 = func.call @cc_make_string(%2419, %2420) : (!llvm.ptr, i64) -> i64
      %2422 = func.call @cc_intern(%2418, %2421) : (i64, i64) -> i64
      %2423 = func.call @cc_nil_value() : () -> i64
      %2424 = func.call @cc_cons(%2422, %2423) : (i64, i64) -> i64
      %2425 = func.call @cc_values_pack(%2424) : (i64) -> i64
      func.call @stack_push_pointer(%2422) : (i64) -> ()
      %2426 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2427 = arith.constant 4 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_intern(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2434 = func.call @stack_pop_pointer() : () -> i64
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @cc_cons(%2435, %2434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2436) : (i64) -> ()
      %2437 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2438 = arith.constant 4 : i64
      %2439 = func.call @cc_make_string(%2437, %2438) : (!llvm.ptr, i64) -> i64
      %2440 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2441 = arith.constant 11 : i64
      %2442 = func.call @cc_make_string(%2440, %2441) : (!llvm.ptr, i64) -> i64
      %2443 = func.call @cc_intern(%2439, %2442) : (i64, i64) -> i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_cons(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_values_pack(%2445) : (i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      %2447 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2448 = arith.constant 6 : i64
      %2449 = func.call @cc_make_string(%2447, %2448) : (!llvm.ptr, i64) -> i64
      %2450 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2451 = arith.constant 2 : i64
      %2452 = func.call @cc_make_string(%2450, %2451) : (!llvm.ptr, i64) -> i64
      %2453 = func.call @cc_intern(%2449, %2452) : (i64, i64) -> i64
      %2454 = func.call @cc_nil_value() : () -> i64
      %2455 = func.call @cc_cons(%2453, %2454) : (i64, i64) -> i64
      %2456 = func.call @cc_values_pack(%2455) : (i64) -> i64
      func.call @stack_push_pointer(%2453) : (i64) -> ()
      %2457 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2458 = arith.constant 3 : i64
      %2459 = func.call @cc_make_string(%2457, %2458) : (!llvm.ptr, i64) -> i64
      %2460 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2461 = arith.constant 11 : i64
      %2462 = func.call @cc_make_string(%2460, %2461) : (!llvm.ptr, i64) -> i64
      %2463 = func.call @cc_intern(%2459, %2462) : (i64, i64) -> i64
      %2464 = func.call @cc_nil_value() : () -> i64
      %2465 = func.call @cc_cons(%2463, %2464) : (i64, i64) -> i64
      %2466 = func.call @cc_values_pack(%2465) : (i64) -> i64
      func.call @stack_push_pointer(%2463) : (i64) -> ()
      %2467 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2468 = arith.constant 4 : i64
      %2469 = func.call @cc_make_string(%2467, %2468) : (!llvm.ptr, i64) -> i64
      %2470 = func.call @cc_nil_value() : () -> i64
      %2471 = func.call @cc_intern(%2469, %2470) : (i64, i64) -> i64
      %2472 = func.call @cc_nil_value() : () -> i64
      %2473 = func.call @cc_cons(%2471, %2472) : (i64, i64) -> i64
      %2474 = func.call @cc_values_pack(%2473) : (i64) -> i64
      func.call @stack_push_pointer(%2471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2475 = func.call @stack_pop_pointer() : () -> i64
      %2476 = func.call @stack_pop_pointer() : () -> i64
      %2477 = func.call @cc_cons(%2476, %2475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2478 = arith.addi %2477, %__rlasp_stack_elide_zero_100 : i64
      %2479 = func.call @stack_pop_pointer() : () -> i64
      %2480 = func.call @cc_cons(%2479, %2478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2480) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2481 = func.call @stack_pop_pointer() : () -> i64
      %2482 = func.call @stack_pop_pointer() : () -> i64
      %2483 = func.call @cc_cons(%2482, %2481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2484 = arith.addi %2483, %__rlasp_stack_elide_zero_101 : i64
      %2485 = func.call @stack_pop_pointer() : () -> i64
      %2486 = func.call @cc_cons(%2485, %2484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = func.call @stack_pop_pointer() : () -> i64
      %2489 = func.call @cc_cons(%2488, %2487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2490 = arith.addi %2489, %__rlasp_stack_elide_zero_102 : i64
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = func.call @cc_cons(%2491, %2490) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2493 = arith.addi %2492, %__rlasp_stack_elide_zero_103 : i64
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = func.call @cc_cons(%2494, %2493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2495) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2496 = func.call @stack_pop_pointer() : () -> i64
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @cc_cons(%2497, %2496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2499 = arith.addi %2498, %__rlasp_stack_elide_zero_104 : i64
      %2500 = func.call @stack_pop_pointer() : () -> i64
      %2501 = func.call @cc_cons(%2500, %2499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2502 = arith.addi %2501, %__rlasp_stack_elide_zero_105 : i64
      %2503 = func.call @stack_pop_pointer() : () -> i64
      %2504 = func.call @cc_cons(%2503, %2502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2504) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2505 = func.call @stack_pop_pointer() : () -> i64
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @cc_cons(%2506, %2505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2508 = arith.addi %2507, %__rlasp_stack_elide_zero_106 : i64
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_cons(%2509, %2508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2511 = arith.addi %2510, %__rlasp_stack_elide_zero_107 : i64
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @cc_cons(%2512, %2511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2514 = func.call @stack_pop_pointer() : () -> i64
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @cc_cons(%2515, %2514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2517 = arith.addi %2516, %__rlasp_stack_elide_zero_108 : i64
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @cc_cons(%2518, %2517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2520 = arith.addi %2519, %__rlasp_stack_elide_zero_109 : i64
      %2521 = func.call @stack_pop_pointer() : () -> i64
      %2522 = func.call @cc_cons(%2521, %2520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2523 = func.call @stack_pop_pointer() : () -> i64
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2525 = func.call @cc_cons(%2524, %2523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2526 = arith.addi %2525, %__rlasp_stack_elide_zero_110 : i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2527, %2526) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2529 = arith.addi %2528, %__rlasp_stack_elide_zero_111 : i64
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @cc_cons(%2530, %2529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      %2532 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2533 = arith.constant 14 : i64
      %2534 = func.call @cc_make_string(%2532, %2533) : (!llvm.ptr, i64) -> i64
      %2535 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2536 = arith.constant 2 : i64
      %2537 = func.call @cc_make_string(%2535, %2536) : (!llvm.ptr, i64) -> i64
      %2538 = func.call @cc_intern(%2534, %2537) : (i64, i64) -> i64
      %2539 = func.call @cc_nil_value() : () -> i64
      %2540 = func.call @cc_cons(%2538, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_values_pack(%2540) : (i64) -> i64
      func.call @stack_push_pointer(%2538) : (i64) -> ()
      %2542 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2543 = arith.constant 4 : i64
      %2544 = func.call @cc_make_string(%2542, %2543) : (!llvm.ptr, i64) -> i64
      %2545 = func.call @cc_nil_value() : () -> i64
      %2546 = func.call @cc_intern(%2544, %2545) : (i64, i64) -> i64
      %2547 = func.call @cc_nil_value() : () -> i64
      %2548 = func.call @cc_cons(%2546, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_values_pack(%2548) : (i64) -> i64
      func.call @stack_push_pointer(%2546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2550 = func.call @stack_pop_pointer() : () -> i64
      %2551 = func.call @stack_pop_pointer() : () -> i64
      %2552 = func.call @cc_cons(%2551, %2550) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2553 = arith.addi %2552, %__rlasp_stack_elide_zero_112 : i64
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @cc_cons(%2554, %2553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2556 = func.call @stack_pop_pointer() : () -> i64
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_cons(%2557, %2556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2559 = arith.addi %2558, %__rlasp_stack_elide_zero_113 : i64
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = func.call @cc_cons(%2560, %2559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2562 = arith.addi %2561, %__rlasp_stack_elide_zero_114 : i64
      %2563 = func.call @stack_pop_pointer() : () -> i64
      %2564 = func.call @cc_cons(%2563, %2562) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2565 = arith.addi %2564, %__rlasp_stack_elide_zero_115 : i64
      %2566 = func.call @stack_pop_pointer() : () -> i64
      %2567 = func.call @cc_cons(%2566, %2565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2567) : (i64) -> ()
      %2568 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2569 = arith.constant 13 : i64
      %2570 = func.call @cc_make_string(%2568, %2569) : (!llvm.ptr, i64) -> i64
      %2571 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2572 = arith.constant 11 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = func.call @cc_intern(%2570, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_cons(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_values_pack(%2576) : (i64) -> i64
      func.call @stack_push_pointer(%2574) : (i64) -> ()
      %2578 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2579 = arith.constant 12 : i64
      %2580 = func.call @cc_make_string(%2578, %2579) : (!llvm.ptr, i64) -> i64
      %2581 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2582 = arith.constant 2 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = func.call @cc_intern(%2580, %2583) : (i64, i64) -> i64
      %2585 = func.call @cc_nil_value() : () -> i64
      %2586 = func.call @cc_cons(%2584, %2585) : (i64, i64) -> i64
      %2587 = func.call @cc_values_pack(%2586) : (i64) -> i64
      func.call @stack_push_pointer(%2584) : (i64) -> ()
      %2588 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2589 = arith.constant 4 : i64
      %2590 = func.call @cc_make_string(%2588, %2589) : (!llvm.ptr, i64) -> i64
      %2591 = func.call @cc_nil_value() : () -> i64
      %2592 = func.call @cc_intern(%2590, %2591) : (i64, i64) -> i64
      %2593 = func.call @cc_nil_value() : () -> i64
      %2594 = func.call @cc_cons(%2592, %2593) : (i64, i64) -> i64
      %2595 = func.call @cc_values_pack(%2594) : (i64) -> i64
      func.call @stack_push_pointer(%2592) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2596 = func.call @stack_pop_pointer() : () -> i64
      %2597 = func.call @stack_pop_pointer() : () -> i64
      %2598 = func.call @cc_cons(%2597, %2596) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2599 = arith.addi %2598, %__rlasp_stack_elide_zero_116 : i64
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @cc_cons(%2600, %2599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2601) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_cons(%2603, %2602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2605 = arith.addi %2604, %__rlasp_stack_elide_zero_117 : i64
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @cc_cons(%2606, %2605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2607) : (i64) -> ()
      %2608 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2609 = arith.constant 4 : i64
      %2610 = func.call @cc_make_string(%2608, %2609) : (!llvm.ptr, i64) -> i64
      %2611 = func.call @cc_nil_value() : () -> i64
      %2612 = func.call @cc_intern(%2610, %2611) : (i64, i64) -> i64
      %2613 = func.call @cc_nil_value() : () -> i64
      %2614 = func.call @cc_cons(%2612, %2613) : (i64, i64) -> i64
      %2615 = func.call @cc_values_pack(%2614) : (i64) -> i64
      func.call @stack_push_pointer(%2612) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2616 = func.call @stack_pop_pointer() : () -> i64
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = func.call @cc_cons(%2617, %2616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2619 = arith.addi %2618, %__rlasp_stack_elide_zero_118 : i64
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = func.call @cc_cons(%2620, %2619) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2622 = arith.addi %2621, %__rlasp_stack_elide_zero_119 : i64
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = func.call @cc_cons(%2623, %2622) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2625 = arith.addi %2624, %__rlasp_stack_elide_zero_120 : i64
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @cc_cons(%2626, %2625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2628 = arith.addi %2627, %__rlasp_stack_elide_zero_121 : i64
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_cons(%2629, %2628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2631 = arith.addi %2630, %__rlasp_stack_elide_zero_122 : i64
      %2862 = arith.constant 130642754928658 : i64
      %2863 = arith.constant 0 : i64
      %2864 = func.call @cc_make_closure(%2862, %2863) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2865 = arith.addi %2864, %__rlasp_stack_elide_zero_123 : i64
      %2866 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2866) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @stack_pop_pointer() : () -> i64
      %2869 = func.call @cc_cons(%2868, %2867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2869) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @stack_pop_pointer() : () -> i64
      %2872 = func.call @cc_cons(%2871, %2870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2873 = arith.addi %2872, %__rlasp_stack_elide_zero_124 : i64
      %2874 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2875 = arith.constant 11 : i64
      %2876 = func.call @cc_make_string(%2874, %2875) : (!llvm.ptr, i64) -> i64
      %2877 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2878 = arith.constant 7 : i64
      %2879 = func.call @cc_make_string(%2877, %2878) : (!llvm.ptr, i64) -> i64
      %2880 = func.call @cc_intern(%2876, %2879) : (i64, i64) -> i64
      %2881 = func.call @cc_nil_value() : () -> i64
      %2882 = func.call @cc_cons(%2880, %2881) : (i64, i64) -> i64
      %2883 = func.call @cc_values_pack(%2882) : (i64) -> i64
      %2884 = func.call @cc_nil_value() : () -> i64
      %2885 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2886 = arith.constant 4 : i64
      %2887 = func.call @cc_make_string(%2885, %2886) : (!llvm.ptr, i64) -> i64
      %2888 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2889 = arith.constant 7 : i64
      %2890 = func.call @cc_make_string(%2888, %2889) : (!llvm.ptr, i64) -> i64
      %2891 = func.call @cc_intern(%2887, %2890) : (i64, i64) -> i64
      %2892 = func.call @cc_nil_value() : () -> i64
      %2893 = func.call @cc_cons(%2891, %2892) : (i64, i64) -> i64
      %2894 = func.call @cc_values_pack(%2893) : (i64) -> i64
      %2895 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2896 = arith.constant 6 : i64
      %2897 = func.call @cc_make_string(%2895, %2896) : (!llvm.ptr, i64) -> i64
      %2898 = func.call @cc_nil_value() : () -> i64
      %2899 = func.call @cc_intern(%2897, %2898) : (i64, i64) -> i64
      %2900 = func.call @cc_nil_value() : () -> i64
      %2901 = func.call @cc_cons(%2899, %2900) : (i64, i64) -> i64
      %2902 = func.call @cc_values_pack(%2901) : (i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2903 = arith.addi %2899, %__rlasp_stack_elide_zero_125 : i64
      %2904 = func.call @cc_nil_value() : () -> i64
      %2905 = func.call @cc_errorp(%2248) : (i64) -> i64
      %2906 = arith.cmpi ne, %2905, %2904 : i64
      %2907 = arith.cmpi eq, %2904, %2904 : i64
      %2908 = arith.andi %2906, %2907 : i1
      %2909 = scf.if %2908 -> (i64) {
        scf.yield %2248 : i64
      } else {
        scf.yield %2904 : i64
      }
      %2910 = func.call @cc_errorp(%2631) : (i64) -> i64
      %2911 = arith.cmpi ne, %2910, %2904 : i64
      %2912 = arith.cmpi eq, %2909, %2904 : i64
      %2913 = arith.andi %2911, %2912 : i1
      %2914 = scf.if %2913 -> (i64) {
        scf.yield %2631 : i64
      } else {
        scf.yield %2909 : i64
      }
      %2915 = func.call @cc_errorp(%2865) : (i64) -> i64
      %2916 = arith.cmpi ne, %2915, %2904 : i64
      %2917 = arith.cmpi eq, %2914, %2904 : i64
      %2918 = arith.andi %2916, %2917 : i1
      %2919 = scf.if %2918 -> (i64) {
        scf.yield %2865 : i64
      } else {
        scf.yield %2914 : i64
      }
      %2920 = func.call @cc_errorp(%2873) : (i64) -> i64
      %2921 = arith.cmpi ne, %2920, %2904 : i64
      %2922 = arith.cmpi eq, %2919, %2904 : i64
      %2923 = arith.andi %2921, %2922 : i1
      %2924 = scf.if %2923 -> (i64) {
        scf.yield %2873 : i64
      } else {
        scf.yield %2919 : i64
      }
      %2925 = func.call @cc_errorp(%2880) : (i64) -> i64
      %2926 = arith.cmpi ne, %2925, %2904 : i64
      %2927 = arith.cmpi eq, %2924, %2904 : i64
      %2928 = arith.andi %2926, %2927 : i1
      %2929 = scf.if %2928 -> (i64) {
        scf.yield %2880 : i64
      } else {
        scf.yield %2924 : i64
      }
      %2930 = func.call @cc_errorp(%2884) : (i64) -> i64
      %2931 = arith.cmpi ne, %2930, %2904 : i64
      %2932 = arith.cmpi eq, %2929, %2904 : i64
      %2933 = arith.andi %2931, %2932 : i1
      %2934 = scf.if %2933 -> (i64) {
        scf.yield %2884 : i64
      } else {
        scf.yield %2929 : i64
      }
      %2935 = func.call @cc_errorp(%2891) : (i64) -> i64
      %2936 = arith.cmpi ne, %2935, %2904 : i64
      %2937 = arith.cmpi eq, %2934, %2904 : i64
      %2938 = arith.andi %2936, %2937 : i1
      %2939 = scf.if %2938 -> (i64) {
        scf.yield %2891 : i64
      } else {
        scf.yield %2934 : i64
      }
      %2940 = func.call @cc_errorp(%2903) : (i64) -> i64
      %2941 = arith.cmpi ne, %2940, %2904 : i64
      %2942 = arith.cmpi eq, %2939, %2904 : i64
      %2943 = arith.andi %2941, %2942 : i1
      %2944 = scf.if %2943 -> (i64) {
        scf.yield %2903 : i64
      } else {
        scf.yield %2939 : i64
      }
      %2945 = arith.cmpi ne, %2944, %2904 : i64
      scf.if %2945 {
        func.call @stack_push_pointer(%2944) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2248) : (i64) -> ()
        func.call @stack_push_pointer(%2631) : (i64) -> ()
        func.call @stack_push_pointer(%2865) : (i64) -> ()
        func.call @stack_push_pointer(%2873) : (i64) -> ()
        func.call @stack_push_pointer(%2880) : (i64) -> ()
        func.call @stack_push_pointer(%2884) : (i64) -> ()
        func.call @stack_push_pointer(%2891) : (i64) -> ()
        func.call @stack_push_pointer(%2903) : (i64) -> ()
        %2946 = llvm.mlir.addressof @str217 : !llvm.ptr
        %2947 = func.call @cc_make_function_ref_const(%2946) : (!llvm.ptr) -> i64
        %2948 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2947, %2948) : (i64, i64) -> ()
      }
      %2949 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2949 : i64
    }
    %2950 = func.call @cc_nil_value() : () -> i64
    %2951 = func.call @cc_errorp(%2239) : (i64) -> i64
    %2952 = arith.cmpi ne, %2951, %2950 : i64
    %2953 = scf.if %2952 -> (i64) {
      scf.yield %2239 : i64
    } else {
      %2954 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2955 = arith.constant 19 : i64
      %2956 = func.call @cc_make_string(%2954, %2955) : (!llvm.ptr, i64) -> i64
      %2957 = func.call @cc_nil_value() : () -> i64
      %2958 = func.call @cc_intern(%2956, %2957) : (i64, i64) -> i64
      %2959 = func.call @cc_nil_value() : () -> i64
      %2960 = func.call @cc_cons(%2958, %2959) : (i64, i64) -> i64
      %2961 = func.call @cc_values_pack(%2960) : (i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2962 = arith.addi %2958, %__rlasp_stack_elide_zero_126 : i64
      %2963 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2964 = arith.constant 4 : i64
      %2965 = func.call @cc_make_string(%2963, %2964) : (!llvm.ptr, i64) -> i64
      %2966 = func.call @cc_nil_value() : () -> i64
      %2967 = func.call @cc_intern(%2965, %2966) : (i64, i64) -> i64
      %2968 = func.call @cc_nil_value() : () -> i64
      %2969 = func.call @cc_cons(%2967, %2968) : (i64, i64) -> i64
      %2970 = func.call @cc_values_pack(%2969) : (i64) -> i64
      func.call @stack_push_pointer(%2967) : (i64) -> ()
      %2971 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2972 = arith.constant 4 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = func.call @cc_nil_value() : () -> i64
      %2975 = func.call @cc_intern(%2973, %2974) : (i64, i64) -> i64
      %2976 = func.call @cc_nil_value() : () -> i64
      %2977 = func.call @cc_cons(%2975, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_values_pack(%2977) : (i64) -> i64
      func.call @stack_push_pointer(%2975) : (i64) -> ()
      %2979 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2979) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2980 = func.call @stack_pop_pointer() : () -> i64
      %2981 = func.call @stack_pop_pointer() : () -> i64
      %2982 = func.call @cc_cons(%2981, %2980) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2983 = arith.addi %2982, %__rlasp_stack_elide_zero_127 : i64
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @cc_cons(%2984, %2983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2986 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2987 = arith.constant 4 : i64
      %2988 = func.call @cc_make_string(%2986, %2987) : (!llvm.ptr, i64) -> i64
      %2989 = func.call @cc_nil_value() : () -> i64
      %2990 = func.call @cc_intern(%2988, %2989) : (i64, i64) -> i64
      %2991 = func.call @cc_nil_value() : () -> i64
      %2992 = func.call @cc_cons(%2990, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_values_pack(%2992) : (i64) -> i64
      func.call @stack_push_pointer(%2990) : (i64) -> ()
      %2994 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2995 = arith.constant 20 : i64
      %2996 = func.call @cc_make_string(%2994, %2995) : (!llvm.ptr, i64) -> i64
      %2997 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2998 = arith.constant 2 : i64
      %2999 = func.call @cc_make_string(%2997, %2998) : (!llvm.ptr, i64) -> i64
      %3000 = func.call @cc_intern(%2996, %2999) : (i64, i64) -> i64
      %3001 = func.call @cc_nil_value() : () -> i64
      %3002 = func.call @cc_cons(%3000, %3001) : (i64, i64) -> i64
      %3003 = func.call @cc_values_pack(%3002) : (i64) -> i64
      func.call @stack_push_pointer(%3000) : (i64) -> ()
      %3004 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3005 = llvm.mlir.addressof @str224 : !llvm.ptr
      %3006 = arith.constant 24 : i64
      %3007 = func.call @cc_make_string(%3005, %3006) : (!llvm.ptr, i64) -> i64
      %3008 = func.call @cc_nil_value() : () -> i64
      %3009 = func.call @cc_intern(%3007, %3008) : (i64, i64) -> i64
      %3010 = func.call @cc_nil_value() : () -> i64
      %3011 = func.call @cc_cons(%3009, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_values_pack(%3011) : (i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %3013 = arith.addi %3009, %__rlasp_stack_elide_zero_128 : i64
      %3014 = func.call @stack_pop_pointer() : () -> i64
      %3015 = func.call @cc_cons(%3013, %3014) : (i64, i64) -> i64
      %3016 = llvm.mlir.addressof @str225 : !llvm.ptr
      %3017 = arith.constant 5 : i64
      %3018 = func.call @cc_make_string(%3016, %3017) : (!llvm.ptr, i64) -> i64
      %3019 = func.call @cc_nil_value() : () -> i64
      %3020 = func.call @cc_intern(%3018, %3019) : (i64, i64) -> i64
      %3021 = func.call @cc_nil_value() : () -> i64
      %3022 = func.call @cc_cons(%3020, %3021) : (i64, i64) -> i64
      %3023 = func.call @cc_values_pack(%3022) : (i64) -> i64
      %3024 = func.call @cc_cons(%3020, %3015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3025 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3026 = arith.constant 6 : i64
      %3027 = func.call @cc_make_string(%3025, %3026) : (!llvm.ptr, i64) -> i64
      %3028 = func.call @cc_nil_value() : () -> i64
      %3029 = func.call @cc_intern(%3027, %3028) : (i64, i64) -> i64
      %3030 = func.call @cc_nil_value() : () -> i64
      %3031 = func.call @cc_cons(%3029, %3030) : (i64, i64) -> i64
      %3032 = func.call @cc_values_pack(%3031) : (i64) -> i64
      func.call @stack_push_pointer(%3029) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3033 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3034 = arith.constant 4 : i64
      %3035 = func.call @cc_make_string(%3033, %3034) : (!llvm.ptr, i64) -> i64
      %3036 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3037 = arith.constant 11 : i64
      %3038 = func.call @cc_make_string(%3036, %3037) : (!llvm.ptr, i64) -> i64
      %3039 = func.call @cc_intern(%3035, %3038) : (i64, i64) -> i64
      %3040 = func.call @cc_nil_value() : () -> i64
      %3041 = func.call @cc_cons(%3039, %3040) : (i64, i64) -> i64
      %3042 = func.call @cc_values_pack(%3041) : (i64) -> i64
      func.call @stack_push_pointer(%3039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3043 = func.call @stack_pop_pointer() : () -> i64
      %3044 = func.call @stack_pop_pointer() : () -> i64
      %3045 = func.call @cc_cons(%3044, %3043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3045) : (i64) -> ()
      %3046 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3047 = arith.constant 4 : i64
      %3048 = func.call @cc_make_string(%3046, %3047) : (!llvm.ptr, i64) -> i64
      %3049 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3050 = arith.constant 11 : i64
      %3051 = func.call @cc_make_string(%3049, %3050) : (!llvm.ptr, i64) -> i64
      %3052 = func.call @cc_intern(%3048, %3051) : (i64, i64) -> i64
      %3053 = func.call @cc_nil_value() : () -> i64
      %3054 = func.call @cc_cons(%3052, %3053) : (i64, i64) -> i64
      %3055 = func.call @cc_values_pack(%3054) : (i64) -> i64
      func.call @stack_push_pointer(%3052) : (i64) -> ()
      %3056 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3057 = arith.constant 4 : i64
      %3058 = func.call @cc_make_string(%3056, %3057) : (!llvm.ptr, i64) -> i64
      %3059 = func.call @cc_nil_value() : () -> i64
      %3060 = func.call @cc_intern(%3058, %3059) : (i64, i64) -> i64
      %3061 = func.call @cc_nil_value() : () -> i64
      %3062 = func.call @cc_cons(%3060, %3061) : (i64, i64) -> i64
      %3063 = func.call @cc_values_pack(%3062) : (i64) -> i64
      func.call @stack_push_pointer(%3060) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3064 = func.call @stack_pop_pointer() : () -> i64
      %3065 = func.call @stack_pop_pointer() : () -> i64
      %3066 = func.call @cc_cons(%3065, %3064) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %3067 = arith.addi %3066, %__rlasp_stack_elide_zero_129 : i64
      %3068 = func.call @stack_pop_pointer() : () -> i64
      %3069 = func.call @cc_cons(%3068, %3067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %3070 = arith.addi %3069, %__rlasp_stack_elide_zero_130 : i64
      %3071 = func.call @stack_pop_pointer() : () -> i64
      %3072 = func.call @cc_cons(%3071, %3070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3072) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3073 = func.call @stack_pop_pointer() : () -> i64
      %3074 = func.call @stack_pop_pointer() : () -> i64
      %3075 = func.call @cc_cons(%3074, %3073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %3076 = arith.addi %3075, %__rlasp_stack_elide_zero_131 : i64
      %3077 = func.call @stack_pop_pointer() : () -> i64
      %3078 = func.call @cc_cons(%3077, %3076) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %3079 = arith.addi %3078, %__rlasp_stack_elide_zero_132 : i64
      %3080 = func.call @stack_pop_pointer() : () -> i64
      %3081 = func.call @cc_cons(%3080, %3079) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %3082 = arith.addi %3081, %__rlasp_stack_elide_zero_133 : i64
      %3083 = func.call @stack_pop_pointer() : () -> i64
      %3084 = func.call @cc_cons(%3083, %3082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3085 = func.call @stack_pop_pointer() : () -> i64
      %3086 = func.call @stack_pop_pointer() : () -> i64
      %3087 = func.call @cc_cons(%3086, %3085) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %3088 = arith.addi %3087, %__rlasp_stack_elide_zero_134 : i64
      %3089 = func.call @stack_pop_pointer() : () -> i64
      %3090 = func.call @cc_cons(%3089, %3088) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %3091 = arith.addi %3090, %__rlasp_stack_elide_zero_135 : i64
      %3092 = func.call @stack_pop_pointer() : () -> i64
      %3093 = func.call @cc_cons(%3092, %3091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3094 = func.call @stack_pop_pointer() : () -> i64
      %3095 = func.call @stack_pop_pointer() : () -> i64
      %3096 = func.call @cc_cons(%3095, %3094) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %3097 = arith.addi %3096, %__rlasp_stack_elide_zero_136 : i64
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = func.call @cc_cons(%3098, %3097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3099) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3100 = func.call @stack_pop_pointer() : () -> i64
      %3101 = func.call @stack_pop_pointer() : () -> i64
      %3102 = func.call @cc_cons(%3101, %3100) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %3103 = arith.addi %3102, %__rlasp_stack_elide_zero_137 : i64
      %3104 = func.call @stack_pop_pointer() : () -> i64
      %3105 = func.call @cc_cons(%3104, %3103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3105) : (i64) -> ()
      %3106 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3107 = arith.constant 14 : i64
      %3108 = func.call @cc_make_string(%3106, %3107) : (!llvm.ptr, i64) -> i64
      %3109 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3110 = arith.constant 2 : i64
      %3111 = func.call @cc_make_string(%3109, %3110) : (!llvm.ptr, i64) -> i64
      %3112 = func.call @cc_intern(%3108, %3111) : (i64, i64) -> i64
      %3113 = func.call @cc_nil_value() : () -> i64
      %3114 = func.call @cc_cons(%3112, %3113) : (i64, i64) -> i64
      %3115 = func.call @cc_values_pack(%3114) : (i64) -> i64
      func.call @stack_push_pointer(%3112) : (i64) -> ()
      %3116 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3117 = arith.constant 4 : i64
      %3118 = func.call @cc_make_string(%3116, %3117) : (!llvm.ptr, i64) -> i64
      %3119 = func.call @cc_nil_value() : () -> i64
      %3120 = func.call @cc_intern(%3118, %3119) : (i64, i64) -> i64
      %3121 = func.call @cc_nil_value() : () -> i64
      %3122 = func.call @cc_cons(%3120, %3121) : (i64, i64) -> i64
      %3123 = func.call @cc_values_pack(%3122) : (i64) -> i64
      func.call @stack_push_pointer(%3120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3124 = func.call @stack_pop_pointer() : () -> i64
      %3125 = func.call @stack_pop_pointer() : () -> i64
      %3126 = func.call @cc_cons(%3125, %3124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %3127 = arith.addi %3126, %__rlasp_stack_elide_zero_138 : i64
      %3128 = func.call @stack_pop_pointer() : () -> i64
      %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3129) : (i64) -> ()
      %3130 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3131 = arith.constant 13 : i64
      %3132 = func.call @cc_make_string(%3130, %3131) : (!llvm.ptr, i64) -> i64
      %3133 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3134 = arith.constant 11 : i64
      %3135 = func.call @cc_make_string(%3133, %3134) : (!llvm.ptr, i64) -> i64
      %3136 = func.call @cc_intern(%3132, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_nil_value() : () -> i64
      %3138 = func.call @cc_cons(%3136, %3137) : (i64, i64) -> i64
      %3139 = func.call @cc_values_pack(%3138) : (i64) -> i64
      func.call @stack_push_pointer(%3136) : (i64) -> ()
      %3140 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3141 = arith.constant 12 : i64
      %3142 = func.call @cc_make_string(%3140, %3141) : (!llvm.ptr, i64) -> i64
      %3143 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3144 = arith.constant 2 : i64
      %3145 = func.call @cc_make_string(%3143, %3144) : (!llvm.ptr, i64) -> i64
      %3146 = func.call @cc_intern(%3142, %3145) : (i64, i64) -> i64
      %3147 = func.call @cc_nil_value() : () -> i64
      %3148 = func.call @cc_cons(%3146, %3147) : (i64, i64) -> i64
      %3149 = func.call @cc_values_pack(%3148) : (i64) -> i64
      func.call @stack_push_pointer(%3146) : (i64) -> ()
      %3150 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3151 = arith.constant 4 : i64
      %3152 = func.call @cc_make_string(%3150, %3151) : (!llvm.ptr, i64) -> i64
      %3153 = func.call @cc_nil_value() : () -> i64
      %3154 = func.call @cc_intern(%3152, %3153) : (i64, i64) -> i64
      %3155 = func.call @cc_nil_value() : () -> i64
      %3156 = func.call @cc_cons(%3154, %3155) : (i64, i64) -> i64
      %3157 = func.call @cc_values_pack(%3156) : (i64) -> i64
      func.call @stack_push_pointer(%3154) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3158 = func.call @stack_pop_pointer() : () -> i64
      %3159 = func.call @stack_pop_pointer() : () -> i64
      %3160 = func.call @cc_cons(%3159, %3158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %3161 = arith.addi %3160, %__rlasp_stack_elide_zero_139 : i64
      %3162 = func.call @stack_pop_pointer() : () -> i64
      %3163 = func.call @cc_cons(%3162, %3161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3163) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3164 = func.call @stack_pop_pointer() : () -> i64
      %3165 = func.call @stack_pop_pointer() : () -> i64
      %3166 = func.call @cc_cons(%3165, %3164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3167 = arith.addi %3166, %__rlasp_stack_elide_zero_140 : i64
      %3168 = func.call @stack_pop_pointer() : () -> i64
      %3169 = func.call @cc_cons(%3168, %3167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3169) : (i64) -> ()
      %3170 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3171 = arith.constant 4 : i64
      %3172 = func.call @cc_make_string(%3170, %3171) : (!llvm.ptr, i64) -> i64
      %3173 = func.call @cc_nil_value() : () -> i64
      %3174 = func.call @cc_intern(%3172, %3173) : (i64, i64) -> i64
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_cons(%3174, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_values_pack(%3176) : (i64) -> i64
      func.call @stack_push_pointer(%3174) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3178 = func.call @stack_pop_pointer() : () -> i64
      %3179 = func.call @stack_pop_pointer() : () -> i64
      %3180 = func.call @cc_cons(%3179, %3178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3181 = arith.addi %3180, %__rlasp_stack_elide_zero_141 : i64
      %3182 = func.call @stack_pop_pointer() : () -> i64
      %3183 = func.call @cc_cons(%3182, %3181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3184 = arith.addi %3183, %__rlasp_stack_elide_zero_142 : i64
      %3185 = func.call @stack_pop_pointer() : () -> i64
      %3186 = func.call @cc_cons(%3185, %3184) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3187 = arith.addi %3186, %__rlasp_stack_elide_zero_143 : i64
      %3188 = func.call @stack_pop_pointer() : () -> i64
      %3189 = func.call @cc_cons(%3188, %3187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3190 = arith.addi %3189, %__rlasp_stack_elide_zero_144 : i64
      %3191 = func.call @stack_pop_pointer() : () -> i64
      %3192 = func.call @cc_cons(%3191, %3190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3193 = arith.addi %3192, %__rlasp_stack_elide_zero_145 : i64
      %3307 = arith.constant 130642754928662 : i64
      %3308 = arith.constant 0 : i64
      %3309 = func.call @cc_make_closure(%3307, %3308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3310 = arith.addi %3309, %__rlasp_stack_elide_zero_146 : i64
      %3311 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3313 = func.call @stack_pop_pointer() : () -> i64
      %3314 = func.call @cc_cons(%3313, %3312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3315 = arith.addi %3314, %__rlasp_stack_elide_zero_147 : i64
      %3316 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3317 = arith.constant 11 : i64
      %3318 = func.call @cc_make_string(%3316, %3317) : (!llvm.ptr, i64) -> i64
      %3319 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3320 = arith.constant 7 : i64
      %3321 = func.call @cc_make_string(%3319, %3320) : (!llvm.ptr, i64) -> i64
      %3322 = func.call @cc_intern(%3318, %3321) : (i64, i64) -> i64
      %3323 = func.call @cc_nil_value() : () -> i64
      %3324 = func.call @cc_cons(%3322, %3323) : (i64, i64) -> i64
      %3325 = func.call @cc_values_pack(%3324) : (i64) -> i64
      %3326 = func.call @cc_nil_value() : () -> i64
      %3327 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3328 = arith.constant 4 : i64
      %3329 = func.call @cc_make_string(%3327, %3328) : (!llvm.ptr, i64) -> i64
      %3330 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3331 = arith.constant 7 : i64
      %3332 = func.call @cc_make_string(%3330, %3331) : (!llvm.ptr, i64) -> i64
      %3333 = func.call @cc_intern(%3329, %3332) : (i64, i64) -> i64
      %3334 = func.call @cc_nil_value() : () -> i64
      %3335 = func.call @cc_cons(%3333, %3334) : (i64, i64) -> i64
      %3336 = func.call @cc_values_pack(%3335) : (i64) -> i64
      %3337 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3338 = arith.constant 6 : i64
      %3339 = func.call @cc_make_string(%3337, %3338) : (!llvm.ptr, i64) -> i64
      %3340 = func.call @cc_nil_value() : () -> i64
      %3341 = func.call @cc_intern(%3339, %3340) : (i64, i64) -> i64
      %3342 = func.call @cc_nil_value() : () -> i64
      %3343 = func.call @cc_cons(%3341, %3342) : (i64, i64) -> i64
      %3344 = func.call @cc_values_pack(%3343) : (i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3345 = arith.addi %3341, %__rlasp_stack_elide_zero_148 : i64
      %3346 = func.call @cc_nil_value() : () -> i64
      %3347 = func.call @cc_errorp(%2962) : (i64) -> i64
      %3348 = arith.cmpi ne, %3347, %3346 : i64
      %3349 = arith.cmpi eq, %3346, %3346 : i64
      %3350 = arith.andi %3348, %3349 : i1
      %3351 = scf.if %3350 -> (i64) {
        scf.yield %2962 : i64
      } else {
        scf.yield %3346 : i64
      }
      %3352 = func.call @cc_errorp(%3193) : (i64) -> i64
      %3353 = arith.cmpi ne, %3352, %3346 : i64
      %3354 = arith.cmpi eq, %3351, %3346 : i64
      %3355 = arith.andi %3353, %3354 : i1
      %3356 = scf.if %3355 -> (i64) {
        scf.yield %3193 : i64
      } else {
        scf.yield %3351 : i64
      }
      %3357 = func.call @cc_errorp(%3310) : (i64) -> i64
      %3358 = arith.cmpi ne, %3357, %3346 : i64
      %3359 = arith.cmpi eq, %3356, %3346 : i64
      %3360 = arith.andi %3358, %3359 : i1
      %3361 = scf.if %3360 -> (i64) {
        scf.yield %3310 : i64
      } else {
        scf.yield %3356 : i64
      }
      %3362 = func.call @cc_errorp(%3315) : (i64) -> i64
      %3363 = arith.cmpi ne, %3362, %3346 : i64
      %3364 = arith.cmpi eq, %3361, %3346 : i64
      %3365 = arith.andi %3363, %3364 : i1
      %3366 = scf.if %3365 -> (i64) {
        scf.yield %3315 : i64
      } else {
        scf.yield %3361 : i64
      }
      %3367 = func.call @cc_errorp(%3322) : (i64) -> i64
      %3368 = arith.cmpi ne, %3367, %3346 : i64
      %3369 = arith.cmpi eq, %3366, %3346 : i64
      %3370 = arith.andi %3368, %3369 : i1
      %3371 = scf.if %3370 -> (i64) {
        scf.yield %3322 : i64
      } else {
        scf.yield %3366 : i64
      }
      %3372 = func.call @cc_errorp(%3326) : (i64) -> i64
      %3373 = arith.cmpi ne, %3372, %3346 : i64
      %3374 = arith.cmpi eq, %3371, %3346 : i64
      %3375 = arith.andi %3373, %3374 : i1
      %3376 = scf.if %3375 -> (i64) {
        scf.yield %3326 : i64
      } else {
        scf.yield %3371 : i64
      }
      %3377 = func.call @cc_errorp(%3333) : (i64) -> i64
      %3378 = arith.cmpi ne, %3377, %3346 : i64
      %3379 = arith.cmpi eq, %3376, %3346 : i64
      %3380 = arith.andi %3378, %3379 : i1
      %3381 = scf.if %3380 -> (i64) {
        scf.yield %3333 : i64
      } else {
        scf.yield %3376 : i64
      }
      %3382 = func.call @cc_errorp(%3345) : (i64) -> i64
      %3383 = arith.cmpi ne, %3382, %3346 : i64
      %3384 = arith.cmpi eq, %3381, %3346 : i64
      %3385 = arith.andi %3383, %3384 : i1
      %3386 = scf.if %3385 -> (i64) {
        scf.yield %3345 : i64
      } else {
        scf.yield %3381 : i64
      }
      %3387 = arith.cmpi ne, %3386, %3346 : i64
      scf.if %3387 {
        func.call @stack_push_pointer(%3386) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2962) : (i64) -> ()
        func.call @stack_push_pointer(%3193) : (i64) -> ()
        func.call @stack_push_pointer(%3310) : (i64) -> ()
        func.call @stack_push_pointer(%3315) : (i64) -> ()
        func.call @stack_push_pointer(%3322) : (i64) -> ()
        func.call @stack_push_pointer(%3326) : (i64) -> ()
        func.call @stack_push_pointer(%3333) : (i64) -> ()
        func.call @stack_push_pointer(%3345) : (i64) -> ()
        %3388 = llvm.mlir.addressof @str252 : !llvm.ptr
        %3389 = func.call @cc_make_function_ref_const(%3388) : (!llvm.ptr) -> i64
        %3390 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3389, %3390) : (i64, i64) -> ()
      }
      %3391 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3391 : i64
    }
    %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
    %3392 = arith.addi %2953, %__rlasp_stack_elide_zero_149 : i64
    %3393 = func.call @cc_multiple_value_list(%3392) : (i64) -> i64
    %3394 = llvm.mlir.addressof @str253 : !llvm.ptr
    %3395 = arith.constant 38 : i64
    %3396 = func.call @cc_make_string(%3394, %3395) : (!llvm.ptr, i64) -> i64
    %3397 = func.call @cc_nil_value() : () -> i64
    %3398 = func.call @cc_intern(%3396, %3397) : (i64, i64) -> i64
    %3399 = func.call @cc_nil_value() : () -> i64
    %3400 = func.call @cc_cons(%3398, %3399) : (i64, i64) -> i64
    %3401 = func.call @cc_values_pack(%3400) : (i64) -> i64
    %3402 = func.call @cc_symbol_value(%3398) : (i64) -> i64
    %3403 = llvm.mlir.addressof @str254 : !llvm.ptr
    %3404 = arith.constant 40 : i64
    %3405 = func.call @cc_make_string(%3403, %3404) : (!llvm.ptr, i64) -> i64
    %3406 = func.call @cc_nil_value() : () -> i64
    %3407 = func.call @cc_intern(%3405, %3406) : (i64, i64) -> i64
    %3408 = func.call @cc_nil_value() : () -> i64
    %3409 = func.call @cc_cons(%3407, %3408) : (i64, i64) -> i64
    %3410 = func.call @cc_values_pack(%3409) : (i64) -> i64
    %3411 = func.call @cc_symbol_value(%3407) : (i64) -> i64
    %3412 = func.call @cc_nil_value() : () -> i64
    %3413 = arith.cmpi ne, %3402, %3412 : i64
    %3414 = scf.if %3413 -> (i64) {
      scf.yield %3411 : i64
    } else {
      scf.yield %3393 : i64
    }
    %3415 = func.call @cc_values_pack(%3414) : (i64) -> i64
    func.call @stack_push_pointer(%3415) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299139"() {
    %257 = func.call @stack_pop_pointer() : () -> i64
    %258 = func.call @stack_pop_pointer() : () -> i64
    %259 = func.call @cc_nil_value() : () -> i64
    %260 = func.call @cc_nil_value() : () -> i64
    %261 = func.call @cc_errorp(%259) : (i64) -> i64
    %262 = arith.cmpi ne, %261, %260 : i64
    %263 = scf.if %262 -> (i64) {
      scf.yield %259 : i64
    } else {
      %265 = func.call @cc_symbol_value(%258) : (i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_errorp(%266) : (i64) -> i64
      %269 = arith.cmpi ne, %268, %267 : i64
      %270 = scf.if %269 -> (i64) {
        scf.yield %266 : i64
      } else {
        %271 = func.call @cc_nil_value() : () -> i64
        %272 = func.call @cc_nil_value() : () -> i64
        %273 = func.call @cc_errorp(%271) : (i64) -> i64
        %274 = arith.cmpi ne, %273, %272 : i64
        %275 = scf.if %274 -> (i64) {
          scf.yield %271 : i64
        } else {
          %276 = func.call @cc_nil_value() : () -> i64
          %277 = func.call @cc_errorp(%265) : (i64) -> i64
          %278 = arith.cmpi ne, %277, %276 : i64
          %279 = arith.cmpi eq, %276, %276 : i64
          %280 = arith.andi %278, %279 : i1
          %281 = scf.if %280 -> (i64) {
            scf.yield %265 : i64
          } else {
            scf.yield %276 : i64
          }
          %282 = arith.cmpi ne, %281, %276 : i64
          scf.if %282 {
            func.call @stack_push_pointer(%281) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%265) : (i64) -> ()
            %283 = llvm.mlir.addressof @str21 : !llvm.ptr
            %284 = func.call @cc_make_function_ref_const(%283) : (!llvm.ptr) -> i64
            %285 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%284, %285) : (i64, i64) -> ()
          }
          %286 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %286 : i64
        }
        %287 = func.call @cc_nil_value() : () -> i64
        %288 = func.call @cc_errorp(%275) : (i64) -> i64
        %289 = arith.cmpi ne, %288, %287 : i64
        %290 = scf.if %289 -> (i64) {
          scf.yield %275 : i64
        } else {
          %291 = func.call @cc_nil_value() : () -> i64
          %292 = arith.cmpi ne, %291, %291 : i64
          scf.if %292 {
            func.call @stack_push_pointer(%291) : (i64) -> ()
          } else {
            %293 = llvm.mlir.addressof @str22 : !llvm.ptr
            %294 = func.call @cc_make_function_ref_const(%293) : (!llvm.ptr) -> i64
            %295 = arith.constant 0 : i64
            func.call @cc_funcall_stack(%294, %295) : (i64, i64) -> ()
          }
          %296 = func.call @stack_pop_pointer() : () -> i64
          %297 = func.call @cc_nil_value() : () -> i64
          %298 = func.call @cc_errorp(%296) : (i64) -> i64
          %299 = arith.cmpi ne, %298, %297 : i64
          %300 = scf.if %299 -> (i64) {
            scf.yield %296 : i64
          } else {
            %301 = func.call @cc_nil_value() : () -> i64
            %302 = func.call @cc_set_symbol_value(%257, %301) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
            %303 = arith.addi %301, %__rlasp_stack_elide_zero_150 : i64
            scf.yield %303 : i64
          }
          %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
          %304 = arith.addi %300, %__rlasp_stack_elide_zero_151 : i64
          scf.yield %304 : i64
        }
        %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
        %305 = arith.addi %290, %__rlasp_stack_elide_zero_152 : i64
        %306 = func.call @cc_multiple_value_list(%305) : (i64) -> i64
        %307 = func.call @cc_nil_value() : () -> i64
        %308 = func.call @cc_errorp(%265) : (i64) -> i64
        %309 = arith.cmpi ne, %308, %307 : i64
        %310 = arith.cmpi eq, %307, %307 : i64
        %311 = arith.andi %309, %310 : i1
        %312 = scf.if %311 -> (i64) {
          scf.yield %265 : i64
        } else {
          scf.yield %307 : i64
        }
        %313 = arith.cmpi ne, %312, %307 : i64
        scf.if %313 {
          func.call @stack_push_pointer(%312) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%265) : (i64) -> ()
          %314 = llvm.mlir.addressof @str23 : !llvm.ptr
          %315 = func.call @cc_make_function_ref_const(%314) : (!llvm.ptr) -> i64
          %316 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%315, %316) : (i64, i64) -> ()
        }
        %317 = func.call @stack_depth() : () -> i64
        %318 = arith.constant 0 : i64
        %319 = arith.cmpi sgt, %317, %318 : i64
        scf.if %319 {
          %320 = func.call @stack_pop_pointer() : () -> i64
        }
        %321 = func.call @cc_values_pack(%306) : (i64) -> i64
        %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
        %322 = arith.addi %321, %__rlasp_stack_elide_zero_153 : i64
        scf.yield %322 : i64
      }
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %323 = arith.addi %270, %__rlasp_stack_elide_zero_154 : i64
      scf.yield %323 : i64
    }
    func.call @stack_push_pointer(%263) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299137"() {
    %194 = func.call @cc_nil_value() : () -> i64
    %195 = func.call @cc_nil_value() : () -> i64
    %196 = func.call @cc_errorp(%194) : (i64) -> i64
    %197 = arith.cmpi ne, %196, %195 : i64
    %198 = scf.if %197 -> (i64) {
      scf.yield %194 : i64
    } else {
      %199 = func.call @cc_t_value() : () -> i64
      %200 = llvm.mlir.addressof @str17 : !llvm.ptr
      %201 = arith.constant 33 : i64
      %202 = func.call @cc_make_symbol(%200, %201) : (!llvm.ptr, i64) -> i64
      %203 = func.call @cc_persistent_root_value(%202) : (i64) -> i64
      %204 = func.call @cc_set_symbol_value(%203, %199) : (i64, i64) -> i64
      %205 = func.call @cc_nil_value() : () -> i64
      %206 = func.call @cc_nil_value() : () -> i64
      %207 = func.call @cc_errorp(%205) : (i64) -> i64
      %208 = arith.cmpi ne, %207, %206 : i64
      %209 = scf.if %208 -> (i64) {
        scf.yield %205 : i64
      } else {
        %210 = func.call @cc_nil_value() : () -> i64
        %211 = arith.cmpi ne, %210, %210 : i64
        scf.if %211 {
          func.call @stack_push_pointer(%210) : (i64) -> ()
        } else {
          %212 = llvm.mlir.addressof @str18 : !llvm.ptr
          %213 = func.call @cc_make_function_ref_const(%212) : (!llvm.ptr) -> i64
          %214 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%213, %214) : (i64, i64) -> ()
        }
        %215 = func.call @stack_pop_pointer() : () -> i64
        %216 = func.call @cc_nil_value() : () -> i64
        %217 = func.call @cc_nil_value() : () -> i64
        %218 = func.call @cc_nil_value() : () -> i64
        %219 = func.call @cc_errorp(%217) : (i64) -> i64
        %220 = arith.cmpi ne, %219, %218 : i64
        %221:2 = scf.if %220 -> (i64, i64) {
          scf.yield %217, %216 : i64, i64
        } else {
          %223 = func.call @cc_nil_value() : () -> i64
          %224 = func.call @cc_nil_value() : () -> i64
          %225 = func.call @cc_errorp(%223) : (i64) -> i64
          %226 = arith.cmpi ne, %225, %224 : i64
          %227:2 = scf.if %226 -> (i64, i64) {
            scf.yield %223, %216 : i64, i64
          } else {
            %228 = func.call @cc_nil_value() : () -> i64
            %229 = func.call @cc_nil_value() : () -> i64
            %230 = func.call @cc_errorp(%228) : (i64) -> i64
            %231 = arith.cmpi ne, %230, %229 : i64
            %232:2 = scf.if %231 -> (i64, i64) {
              scf.yield %228, %216 : i64, i64
            } else {
              %233 = func.call @cc_nil_value() : () -> i64
              %234 = func.call @cc_errorp(%215) : (i64) -> i64
              %235 = arith.cmpi ne, %234, %233 : i64
              %236 = arith.cmpi eq, %233, %233 : i64
              %237 = arith.andi %235, %236 : i1
              %238 = scf.if %237 -> (i64) {
                scf.yield %215 : i64
              } else {
                scf.yield %233 : i64
              }
              %239 = arith.cmpi ne, %238, %233 : i64
              scf.if %239 {
                func.call @stack_push_pointer(%238) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%215) : (i64) -> ()
                %240 = llvm.mlir.addressof @str19 : !llvm.ptr
                %241 = func.call @cc_make_function_ref_const(%240) : (!llvm.ptr) -> i64
                %242 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%241, %242) : (i64, i64) -> ()
              }
              %243 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %243, %216 : i64, i64
            }
            %244 = func.call @cc_nil_value() : () -> i64
            %245 = func.call @cc_errorp(%232#0) : (i64) -> i64
            %246 = arith.cmpi ne, %245, %244 : i64
            %247:2 = scf.if %246 -> (i64, i64) {
              scf.yield %232#0, %232#1 : i64, i64
            } else {
              %248 = llvm.mlir.addressof @str20 : !llvm.ptr
              %249 = arith.constant 27 : i64
              %250 = func.call @cc_make_string(%248, %249) : (!llvm.ptr, i64) -> i64
              %251 = func.call @cc_nil_value() : () -> i64
              %252 = func.call @cc_intern(%250, %251) : (i64, i64) -> i64
              %253 = func.call @cc_nil_value() : () -> i64
              %254 = func.call @cc_cons(%252, %253) : (i64, i64) -> i64
              %255 = func.call @cc_values_pack(%254) : (i64) -> i64
              %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
              %256 = arith.addi %252, %__rlasp_stack_elide_zero_155 : i64
              %324 = llvm.mlir.addressof @str24 : !llvm.ptr
              %325 = arith.constant 34 : i64
              %326 = func.call @cc_make_symbol(%324, %325) : (!llvm.ptr, i64) -> i64
              %327 = func.call @cc_persistent_root_value(%326) : (i64) -> i64
              %328 = func.call @cc_set_symbol_value(%327, %215) : (i64, i64) -> i64
              func.call @stack_push_pointer(%327) : (i64) -> ()
              func.call @stack_push_pointer(%203) : (i64) -> ()
              %329 = arith.constant 4634242382299139 : i64
              %330 = arith.constant 2 : i64
              %331 = func.call @cc_make_closure(%329, %330) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
              %332 = arith.addi %331, %__rlasp_stack_elide_zero_156 : i64
              %333 = func.call @cc_nil_value() : () -> i64
              %334 = func.call @cc_errorp(%256) : (i64) -> i64
              %335 = arith.cmpi ne, %334, %333 : i64
              %336 = arith.cmpi eq, %333, %333 : i64
              %337 = arith.andi %335, %336 : i1
              %338 = scf.if %337 -> (i64) {
                scf.yield %256 : i64
              } else {
                scf.yield %333 : i64
              }
              %339 = func.call @cc_errorp(%332) : (i64) -> i64
              %340 = arith.cmpi ne, %339, %333 : i64
              %341 = arith.cmpi eq, %338, %333 : i64
              %342 = arith.andi %340, %341 : i1
              %343 = scf.if %342 -> (i64) {
                scf.yield %332 : i64
              } else {
                scf.yield %338 : i64
              }
              %344 = arith.cmpi ne, %343, %333 : i64
              scf.if %344 {
                func.call @stack_push_pointer(%343) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%256) : (i64) -> ()
                func.call @stack_push_pointer(%332) : (i64) -> ()
                %345 = llvm.mlir.addressof @str25 : !llvm.ptr
                %346 = func.call @cc_make_function_ref_const(%345) : (!llvm.ptr) -> i64
                %347 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%346, %347) : (i64, i64) -> ()
              }
              %348 = func.call @stack_pop_pointer() : () -> i64
              %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
              %349 = arith.addi %348, %__rlasp_stack_elide_zero_157 : i64
              %350 = func.call @cc_nil_value() : () -> i64
              %351 = func.call @cc_errorp(%349) : (i64) -> i64
              %352 = arith.cmpi ne, %351, %350 : i64
              %353 = scf.if %352 -> (i64) {
                scf.yield %349 : i64
              } else {
                %354 = func.call @cc_nil_value() : () -> i64
                %355 = func.call @cc_errorp(%348) : (i64) -> i64
                %356 = arith.cmpi ne, %355, %354 : i64
                %357 = arith.cmpi eq, %354, %354 : i64
                %358 = arith.andi %356, %357 : i1
                %359 = scf.if %358 -> (i64) {
                  scf.yield %348 : i64
                } else {
                  scf.yield %354 : i64
                }
                %360 = arith.cmpi ne, %359, %354 : i64
                scf.if %360 {
                  func.call @stack_push_pointer(%359) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%348) : (i64) -> ()
                  %361 = llvm.mlir.addressof @str26 : !llvm.ptr
                  %362 = func.call @cc_make_function_ref_const(%361) : (!llvm.ptr) -> i64
                  %363 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%362, %363) : (i64, i64) -> ()
                }
                %364 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %364 : i64
              }
              %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
              %365 = arith.addi %353, %__rlasp_stack_elide_zero_158 : i64
              scf.yield %365, %348 : i64, i64
            }
            %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
            %366 = arith.addi %247#0, %__rlasp_stack_elide_zero_159 : i64
            %367 = func.call @cc_multiple_value_list(%366) : (i64) -> i64
            %368 = func.call @cc_nil_value() : () -> i64
            %369 = func.call @cc_errorp(%215) : (i64) -> i64
            %370 = arith.cmpi ne, %369, %368 : i64
            %371 = arith.cmpi eq, %368, %368 : i64
            %372 = arith.andi %370, %371 : i1
            %373 = scf.if %372 -> (i64) {
              scf.yield %215 : i64
            } else {
              scf.yield %368 : i64
            }
            %374 = arith.cmpi ne, %373, %368 : i64
            scf.if %374 {
              func.call @stack_push_pointer(%373) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%215) : (i64) -> ()
              %375 = llvm.mlir.addressof @str27 : !llvm.ptr
              %376 = func.call @cc_make_function_ref_const(%375) : (!llvm.ptr) -> i64
              %377 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%376, %377) : (i64, i64) -> ()
            }
            %378 = func.call @stack_depth() : () -> i64
            %379 = arith.constant 0 : i64
            %380 = arith.cmpi sgt, %378, %379 : i64
            scf.if %380 {
              %381 = func.call @stack_pop_pointer() : () -> i64
            }
            %382 = func.call @cc_values_pack(%367) : (i64) -> i64
            %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
            %383 = arith.addi %382, %__rlasp_stack_elide_zero_160 : i64
            scf.yield %383, %247#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
          %384 = arith.addi %227#0, %__rlasp_stack_elide_zero_161 : i64
          scf.yield %384, %227#1 : i64, i64
        }
        %385 = func.call @cc_nil_value() : () -> i64
        %386 = func.call @cc_errorp(%221#0) : (i64) -> i64
        %387 = arith.cmpi ne, %386, %385 : i64
        %388:2 = scf.if %387 -> (i64, i64) {
          scf.yield %221#0, %221#1 : i64, i64
        } else {
          %389 = func.call @cc_push_ignore_errors_trap() : () -> i64
          func.call @cc_clear_multiple_values() : () -> ()
          %390 = func.call @cc_nil_value() : () -> i64
          %391 = func.call @cc_nil_value() : () -> i64
          %392 = func.call @cc_errorp(%390) : (i64) -> i64
          %393 = arith.cmpi ne, %392, %391 : i64
          %394 = scf.if %393 -> (i64) {
            scf.yield %390 : i64
          } else {
            %395 = func.call @cc_nil_value() : () -> i64
            %396 = func.call @cc_errorp(%221#1) : (i64) -> i64
            %397 = arith.cmpi ne, %396, %395 : i64
            %398 = arith.cmpi eq, %395, %395 : i64
            %399 = arith.andi %397, %398 : i1
            %400 = scf.if %399 -> (i64) {
              scf.yield %221#1 : i64
            } else {
              scf.yield %395 : i64
            }
            %401 = arith.cmpi ne, %400, %395 : i64
            scf.if %401 {
              func.call @stack_push_pointer(%400) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%221#1) : (i64) -> ()
              %402 = llvm.mlir.addressof @str28 : !llvm.ptr
              %403 = func.call @cc_make_function_ref_const(%402) : (!llvm.ptr) -> i64
              %404 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%403, %404) : (i64, i64) -> ()
            }
            %405 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %405 : i64
          }
          %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
          %406 = arith.addi %394, %__rlasp_stack_elide_zero_162 : i64
          %407 = func.call @cc_pop_ignore_errors_trap() : () -> i64
          %408 = func.call @cc_errorp(%406) : (i64) -> i64
          %409 = func.call @cc_nil_value() : () -> i64
          %410 = arith.cmpi ne, %408, %409 : i64
          scf.if %410 {
            %411 = func.call @cc_condition_value(%406) : (i64) -> i64
            %412 = func.call @cc_values2(%409, %411) : (i64, i64) -> i64
            func.call @stack_push_pointer(%412) : (i64) -> ()
          } else {
            %413 = func.call @cc_multiple_value_list(%406) : (i64) -> i64
            %414 = func.call @cc_values_pack(%413) : (i64) -> i64
            func.call @stack_push_pointer(%414) : (i64) -> ()
          }
          %415 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %415, %221#1 : i64, i64
        }
        %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
        %416 = arith.addi %388#0, %__rlasp_stack_elide_zero_163 : i64
        scf.yield %416 : i64
      }
      %417 = func.call @cc_nil_value() : () -> i64
      %418 = func.call @cc_errorp(%209) : (i64) -> i64
      %419 = arith.cmpi ne, %418, %417 : i64
      %420 = scf.if %419 -> (i64) {
        scf.yield %209 : i64
      } else {
        %421 = func.call @cc_symbol_value(%203) : (i64) -> i64
        %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
        %422 = arith.addi %421, %__rlasp_stack_elide_zero_164 : i64
        scf.yield %422 : i64
      }
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %423 = arith.addi %420, %__rlasp_stack_elide_zero_165 : i64
      scf.yield %423 : i64
    }
    func.call @stack_push_pointer(%198) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299142"() {
    %817 = func.call @stack_pop_pointer() : () -> i64
    %818 = func.call @cc_nil_value() : () -> i64
    %819 = func.call @cc_nil_value() : () -> i64
    %820 = func.call @cc_errorp(%818) : (i64) -> i64
    %821 = arith.cmpi ne, %820, %819 : i64
    %822 = scf.if %821 -> (i64) {
      scf.yield %818 : i64
    } else {
      %823 = func.call @cc_nil_value() : () -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_nil_value() : () -> i64
      %826 = func.call @cc_nil_value() : () -> i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = func.call @cc_errorp(%826) : (i64) -> i64
      %829 = arith.cmpi ne, %828, %827 : i64
      %830 = scf.if %829 -> (i64) {
        scf.yield %826 : i64
      } else {
        %831 = func.call @cc_nil_value() : () -> i64
        %832 = llvm.mlir.addressof @str64 : !llvm.ptr
        %833 = arith.constant 38 : i64
        %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
        %835 = func.call @cc_nil_value() : () -> i64
        %836 = func.call @cc_intern(%834, %835) : (i64, i64) -> i64
        %837 = func.call @cc_nil_value() : () -> i64
        %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
        %839 = func.call @cc_values_pack(%838) : (i64) -> i64
        %840 = func.call @cc_set_symbol_value(%836, %831) : (i64, i64) -> i64
        %841 = llvm.mlir.addressof @str65 : !llvm.ptr
        %842 = arith.constant 39 : i64
        %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
        %844 = func.call @cc_nil_value() : () -> i64
        %845 = func.call @cc_intern(%843, %844) : (i64, i64) -> i64
        %846 = func.call @cc_nil_value() : () -> i64
        %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
        %848 = func.call @cc_values_pack(%847) : (i64) -> i64
        %849 = func.call @cc_set_symbol_value(%845, %831) : (i64, i64) -> i64
        %850 = llvm.mlir.addressof @str66 : !llvm.ptr
        %851 = arith.constant 40 : i64
        %852 = func.call @cc_make_string(%850, %851) : (!llvm.ptr, i64) -> i64
        %853 = func.call @cc_nil_value() : () -> i64
        %854 = func.call @cc_intern(%852, %853) : (i64, i64) -> i64
        %855 = func.call @cc_nil_value() : () -> i64
        %856 = func.call @cc_cons(%854, %855) : (i64, i64) -> i64
        %857 = func.call @cc_values_pack(%856) : (i64) -> i64
        %858 = func.call @cc_set_symbol_value(%854, %831) : (i64, i64) -> i64
        %859:3 = scf.while (%arg0 = %825, %arg1 = %824, %arg2 = %823) : (i64, i64, i64) -> (i64, i64, i64) {
          %860 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
          %861 = arith.addi %arg2, %__rlasp_stack_elide_zero_166 : i64
          %862 = func.call @cc_nil_value() : () -> i64
          %863 = func.call @cc_cons(%861, %862) : (i64, i64) -> i64
          %864 = func.call @cc_not(%863) : (i64) -> i64
          %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
          %865 = arith.addi %864, %__rlasp_stack_elide_zero_167 : i64
          %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
          %866 = arith.addi %arg1, %__rlasp_stack_elide_zero_168 : i64
          %867 = func.call @cc_nil_value() : () -> i64
          %868 = func.call @cc_cons(%866, %867) : (i64, i64) -> i64
          %869 = func.call @cc_not(%868) : (i64) -> i64
          %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
          %870 = arith.addi %869, %__rlasp_stack_elide_zero_169 : i64
          %871 = func.call @cc_cons(%870, %860) : (i64, i64) -> i64
          %872 = func.call @cc_cons(%865, %871) : (i64, i64) -> i64
          %873 = func.call @cc_and(%872) : (i64) -> i64
          %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
          %874 = arith.addi %873, %__rlasp_stack_elide_zero_170 : i64
          %875 = func.call @cc_nil_value() : () -> i64
          %876 = arith.cmpi ne, %874, %875 : i64
          %877 = func.call @cc_nil_value() : () -> i64
          %878 = llvm.mlir.addressof @str67 : !llvm.ptr
          %879 = arith.constant 38 : i64
          %880 = func.call @cc_make_string(%878, %879) : (!llvm.ptr, i64) -> i64
          %881 = func.call @cc_nil_value() : () -> i64
          %882 = func.call @cc_intern(%880, %881) : (i64, i64) -> i64
          %883 = func.call @cc_nil_value() : () -> i64
          %884 = func.call @cc_cons(%882, %883) : (i64, i64) -> i64
          %885 = func.call @cc_values_pack(%884) : (i64) -> i64
          %886 = func.call @cc_symbol_value(%882) : (i64) -> i64
          %887 = arith.cmpi ne, %886, %877 : i64
          %888 = llvm.mlir.addressof @str68 : !llvm.ptr
          %889 = arith.constant 38 : i64
          %890 = func.call @cc_make_string(%888, %889) : (!llvm.ptr, i64) -> i64
          %891 = func.call @cc_nil_value() : () -> i64
          %892 = func.call @cc_intern(%890, %891) : (i64, i64) -> i64
          %893 = func.call @cc_nil_value() : () -> i64
          %894 = func.call @cc_cons(%892, %893) : (i64, i64) -> i64
          %895 = func.call @cc_values_pack(%894) : (i64) -> i64
          %896 = func.call @cc_symbol_value(%892) : (i64) -> i64
          %897 = arith.cmpi ne, %896, %877 : i64
          %898 = arith.ori %887, %897 : i1
          %899 = arith.constant 0 : i1
          %900 = arith.cmpi eq, %898, %899 : i1
          %901 = arith.andi %876, %900 : i1
          scf.condition(%901) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%902: i64, %903: i64, %904: i64):
          %905 = func.call @cc_nil_value() : () -> i64
          %906 = func.call @cc_nil_value() : () -> i64
          %907 = func.call @cc_errorp(%905) : (i64) -> i64
          %908 = arith.cmpi ne, %907, %906 : i64
          %909 = scf.if %908 -> (i64) {
            scf.yield %905 : i64
          } else {
            %910 = func.call @cc_nil_value() : () -> i64
            %911 = arith.cmpi ne, %910, %910 : i64
            scf.if %911 {
              func.call @stack_push_pointer(%910) : (i64) -> ()
            } else {
              %912 = llvm.mlir.addressof @str69 : !llvm.ptr
              %913 = func.call @cc_make_function_ref_const(%912) : (!llvm.ptr) -> i64
              %914 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%913, %914) : (i64, i64) -> ()
            }
            %915 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %915 : i64
          }
          %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
          %916 = arith.addi %909, %__rlasp_stack_elide_zero_171 : i64
          func.call @stack_push_pointer(%916) : (i64) -> ()
          %917 = func.call @stack_depth() : () -> i64
          %918 = arith.constant 0 : i64
          %919 = arith.cmpi sgt, %917, %918 : i64
          scf.if %919 {
            %920 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
          %921 = arith.addi %916, %__rlasp_stack_elide_zero_172 : i64
          %922 = func.call @cc_errorp(%921) : (i64) -> i64
          %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
          %923 = arith.addi %922, %__rlasp_stack_elide_zero_173 : i64
          %924 = func.call @cc_nil_value() : () -> i64
          %925 = arith.cmpi ne, %923, %924 : i64
          %926:3 = scf.if %925 -> (i64, i64, i64) {
            %927 = func.call @cc_nil_value() : () -> i64
            %928 = func.call @cc_nil_value() : () -> i64
            %929 = func.call @cc_errorp(%927) : (i64) -> i64
            %930 = arith.cmpi ne, %929, %928 : i64
            %931:3 = scf.if %930 -> (i64, i64, i64) {
              scf.yield %927, %904, %903 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
              %932 = arith.addi %916, %__rlasp_stack_elide_zero_174 : i64
              scf.yield %932, %904, %916 : i64, i64, i64
            }
            %933 = func.call @cc_nil_value() : () -> i64
            %934 = func.call @cc_errorp(%931#0) : (i64) -> i64
            %935 = arith.cmpi ne, %934, %933 : i64
            %936:3 = scf.if %935 -> (i64, i64, i64) {
              scf.yield %931#0, %931#1, %931#2 : i64, i64, i64
            } else {
              %937 = func.call @cc_t_value() : () -> i64
              %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
              %938 = arith.addi %937, %__rlasp_stack_elide_zero_175 : i64
              scf.yield %938, %937, %931#2 : i64, i64, i64
            }
            %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
            %939 = arith.addi %936#0, %__rlasp_stack_elide_zero_176 : i64
            scf.yield %939, %936#1, %936#2 : i64, i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %940 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %940, %904, %903 : i64, i64, i64
          }
          func.call @stack_push_pointer(%926#0) : (i64) -> ()
          %941 = func.call @stack_depth() : () -> i64
          %942 = arith.constant 0 : i64
          %943 = arith.cmpi sgt, %941, %942 : i64
          scf.if %943 {
            %944 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %916, %926#2, %926#1 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %945 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
        %946 = arith.addi %859#1, %__rlasp_stack_elide_zero_177 : i64
        %947 = func.call @cc_nil_value() : () -> i64
        %948 = arith.cmpi ne, %946, %947 : i64
        scf.if %948 {
          func.call @stack_push_pointer(%859#1) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
        }
        %949 = func.call @stack_pop_pointer() : () -> i64
        %950 = func.call @cc_multiple_value_list(%949) : (i64) -> i64
        %951 = llvm.mlir.addressof @str70 : !llvm.ptr
        %952 = arith.constant 38 : i64
        %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
        %954 = func.call @cc_nil_value() : () -> i64
        %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
        %956 = func.call @cc_nil_value() : () -> i64
        %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
        %958 = func.call @cc_values_pack(%957) : (i64) -> i64
        %959 = func.call @cc_symbol_value(%955) : (i64) -> i64
        %960 = llvm.mlir.addressof @str71 : !llvm.ptr
        %961 = arith.constant 39 : i64
        %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
        %963 = func.call @cc_nil_value() : () -> i64
        %964 = func.call @cc_intern(%962, %963) : (i64, i64) -> i64
        %965 = func.call @cc_nil_value() : () -> i64
        %966 = func.call @cc_cons(%964, %965) : (i64, i64) -> i64
        %967 = func.call @cc_values_pack(%966) : (i64) -> i64
        %968 = func.call @cc_symbol_value(%964) : (i64) -> i64
        %969 = llvm.mlir.addressof @str72 : !llvm.ptr
        %970 = arith.constant 40 : i64
        %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
        %972 = func.call @cc_nil_value() : () -> i64
        %973 = func.call @cc_intern(%971, %972) : (i64, i64) -> i64
        %974 = func.call @cc_nil_value() : () -> i64
        %975 = func.call @cc_cons(%973, %974) : (i64, i64) -> i64
        %976 = func.call @cc_values_pack(%975) : (i64) -> i64
        %977 = func.call @cc_symbol_value(%973) : (i64) -> i64
        %978 = func.call @cc_nil_value() : () -> i64
        %979 = arith.cmpi ne, %959, %978 : i64
        %980 = scf.if %979 -> (i64) {
          scf.yield %977 : i64
        } else {
          scf.yield %950 : i64
        }
        %981 = func.call @cc_values_pack(%980) : (i64) -> i64
        %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
        %982 = arith.addi %981, %__rlasp_stack_elide_zero_178 : i64
        scf.yield %982 : i64
      }
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %983 = arith.addi %830, %__rlasp_stack_elide_zero_179 : i64
      %984 = func.call @cc_errorp(%983) : (i64) -> i64
      %985 = func.call @cc_nil_value() : () -> i64
      %986 = arith.cmpi ne, %984, %985 : i64
      %987 = scf.if %986 -> (i64) {
        %988 = func.call @cc_condition_value(%983) : (i64) -> i64
        %989 = llvm.mlir.addressof @str73 : !llvm.ptr
        %990 = arith.constant 22 : i64
        %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
        %992 = llvm.mlir.addressof @str74 : !llvm.ptr
        %993 = arith.constant 2 : i64
        %994 = func.call @cc_make_string(%992, %993) : (!llvm.ptr, i64) -> i64
        %995 = func.call @cc_intern(%991, %994) : (i64, i64) -> i64
        %996 = func.call @cc_nil_value() : () -> i64
        %997 = func.call @cc_cons(%995, %996) : (i64, i64) -> i64
        %998 = func.call @cc_values_pack(%997) : (i64) -> i64
        %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
        %999 = arith.addi %995, %__rlasp_stack_elide_zero_180 : i64
        %1000 = func.call @cc_typep(%988, %999) : (i64, i64) -> i64
        %1001 = func.call @cc_nil_value() : () -> i64
        %1002 = arith.cmpi ne, %1000, %1001 : i64
        %1003 = scf.if %1002 -> (i64) {
          %1004 = func.call @cc_t_value() : () -> i64
          %1005 = func.call @cc_set_symbol_value(%817, %1004) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
          %1006 = arith.addi %1004, %__rlasp_stack_elide_zero_181 : i64
          scf.yield %1006 : i64
        } else {
          scf.yield %983 : i64
        }
        scf.yield %1003 : i64
      } else {
        scf.yield %983 : i64
      }
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %1007 = arith.addi %987, %__rlasp_stack_elide_zero_182 : i64
      scf.yield %1007 : i64
    }
    func.call @stack_push_pointer(%822) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299141"() {
    %802 = func.call @cc_nil_value() : () -> i64
    %803 = func.call @cc_nil_value() : () -> i64
    %804 = func.call @cc_errorp(%802) : (i64) -> i64
    %805 = arith.cmpi ne, %804, %803 : i64
    %806 = scf.if %805 -> (i64) {
      scf.yield %802 : i64
    } else {
      %807 = func.call @cc_nil_value() : () -> i64
      %808 = llvm.mlir.addressof @str63 : !llvm.ptr
      %809 = arith.constant 21 : i64
      %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_intern(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_nil_value() : () -> i64
      %814 = func.call @cc_cons(%812, %813) : (i64, i64) -> i64
      %815 = func.call @cc_values_pack(%814) : (i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %816 = arith.addi %812, %__rlasp_stack_elide_zero_183 : i64
      %1008 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1009 = arith.constant 33 : i64
      %1010 = func.call @cc_make_symbol(%1008, %1009) : (!llvm.ptr, i64) -> i64
      %1011 = func.call @cc_persistent_root_value(%1010) : (i64) -> i64
      %1012 = func.call @cc_set_symbol_value(%1011, %807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1011) : (i64) -> ()
      %1013 = arith.constant 4634242382299142 : i64
      %1014 = arith.constant 1 : i64
      %1015 = func.call @cc_make_closure(%1013, %1014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %1016 = arith.addi %1015, %__rlasp_stack_elide_zero_184 : i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_errorp(%816) : (i64) -> i64
      %1019 = arith.cmpi ne, %1018, %1017 : i64
      %1020 = arith.cmpi eq, %1017, %1017 : i64
      %1021 = arith.andi %1019, %1020 : i1
      %1022 = scf.if %1021 -> (i64) {
        scf.yield %816 : i64
      } else {
        scf.yield %1017 : i64
      }
      %1023 = func.call @cc_errorp(%1016) : (i64) -> i64
      %1024 = arith.cmpi ne, %1023, %1017 : i64
      %1025 = arith.cmpi eq, %1022, %1017 : i64
      %1026 = arith.andi %1024, %1025 : i1
      %1027 = scf.if %1026 -> (i64) {
        scf.yield %1016 : i64
      } else {
        scf.yield %1022 : i64
      }
      %1028 = arith.cmpi ne, %1027, %1017 : i64
      scf.if %1028 {
        func.call @stack_push_pointer(%1027) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%816) : (i64) -> ()
        func.call @stack_push_pointer(%1016) : (i64) -> ()
        %1029 = llvm.mlir.addressof @str76 : !llvm.ptr
        %1030 = func.call @cc_make_function_ref_const(%1029) : (!llvm.ptr) -> i64
        %1031 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1030, %1031) : (i64, i64) -> ()
      }
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_errorp(%1033) : (i64) -> i64
      %1036 = arith.cmpi ne, %1035, %1034 : i64
      %1037 = scf.if %1036 -> (i64) {
        scf.yield %1033 : i64
      } else {
        %1038 = func.call @cc_nil_value() : () -> i64
        %1039 = func.call @cc_errorp(%1032) : (i64) -> i64
        %1040 = arith.cmpi ne, %1039, %1038 : i64
        %1041 = arith.cmpi eq, %1038, %1038 : i64
        %1042 = arith.andi %1040, %1041 : i1
        %1043 = scf.if %1042 -> (i64) {
          scf.yield %1032 : i64
        } else {
          scf.yield %1038 : i64
        }
        %1044 = arith.cmpi ne, %1043, %1038 : i64
        scf.if %1044 {
          func.call @stack_push_pointer(%1043) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1032) : (i64) -> ()
          %1045 = llvm.mlir.addressof @str77 : !llvm.ptr
          %1046 = func.call @cc_make_function_ref_const(%1045) : (!llvm.ptr) -> i64
          %1047 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1046, %1047) : (i64, i64) -> ()
        }
        %1048 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1048 : i64
      }
      %1049 = func.call @cc_nil_value() : () -> i64
      %1050 = func.call @cc_errorp(%1037) : (i64) -> i64
      %1051 = arith.cmpi ne, %1050, %1049 : i64
      %1052 = scf.if %1051 -> (i64) {
        scf.yield %1037 : i64
      } else {
        %1053 = func.call @cc_push_ignore_errors_trap() : () -> i64
        func.call @cc_clear_multiple_values() : () -> ()
        %1054 = func.call @cc_nil_value() : () -> i64
        %1055 = func.call @cc_nil_value() : () -> i64
        %1056 = func.call @cc_errorp(%1054) : (i64) -> i64
        %1057 = arith.cmpi ne, %1056, %1055 : i64
        %1058 = scf.if %1057 -> (i64) {
          scf.yield %1054 : i64
        } else {
          %1059 = func.call @cc_nil_value() : () -> i64
          %1060 = func.call @cc_errorp(%1032) : (i64) -> i64
          %1061 = arith.cmpi ne, %1060, %1059 : i64
          %1062 = arith.cmpi eq, %1059, %1059 : i64
          %1063 = arith.andi %1061, %1062 : i1
          %1064 = scf.if %1063 -> (i64) {
            scf.yield %1032 : i64
          } else {
            scf.yield %1059 : i64
          }
          %1065 = arith.cmpi ne, %1064, %1059 : i64
          scf.if %1065 {
            func.call @stack_push_pointer(%1064) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1032) : (i64) -> ()
            %1066 = llvm.mlir.addressof @str78 : !llvm.ptr
            %1067 = func.call @cc_make_function_ref_const(%1066) : (!llvm.ptr) -> i64
            %1068 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1067, %1068) : (i64, i64) -> ()
          }
          %1069 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1069 : i64
        }
        %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
        %1070 = arith.addi %1058, %__rlasp_stack_elide_zero_185 : i64
        %1071 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %1072 = func.call @cc_errorp(%1070) : (i64) -> i64
        %1073 = func.call @cc_nil_value() : () -> i64
        %1074 = arith.cmpi ne, %1072, %1073 : i64
        scf.if %1074 {
          %1075 = func.call @cc_condition_value(%1070) : (i64) -> i64
          %1076 = func.call @cc_values2(%1073, %1075) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1076) : (i64) -> ()
        } else {
          %1077 = func.call @cc_multiple_value_list(%1070) : (i64) -> i64
          %1078 = func.call @cc_values_pack(%1077) : (i64) -> i64
          func.call @stack_push_pointer(%1078) : (i64) -> ()
        }
        %1079 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1079 : i64
      }
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_errorp(%1052) : (i64) -> i64
      %1082 = arith.cmpi ne, %1081, %1080 : i64
      %1083 = scf.if %1082 -> (i64) {
        scf.yield %1052 : i64
      } else {
        %1084 = func.call @cc_symbol_value(%1011) : (i64) -> i64
        %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
        %1085 = arith.addi %1084, %__rlasp_stack_elide_zero_186 : i64
        scf.yield %1085 : i64
      }
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %1086 = arith.addi %1083, %__rlasp_stack_elide_zero_187 : i64
      scf.yield %1086 : i64
    }
    func.call @stack_push_pointer(%806) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299147"() {
    %1454 = func.call @stack_pop_pointer() : () -> i64
    %1455 = func.call @cc_nil_value() : () -> i64
    %1456 = func.call @cc_nil_value() : () -> i64
    %1457 = func.call @cc_errorp(%1455) : (i64) -> i64
    %1458 = arith.cmpi ne, %1457, %1456 : i64
    %1459 = scf.if %1458 -> (i64) {
      scf.yield %1455 : i64
    } else {
      %1461 = func.call @cc_symbol_value(%1454) : (i64) -> i64
      %1462 = func.call @cc_nil_value() : () -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_errorp(%1462) : (i64) -> i64
      %1465 = arith.cmpi ne, %1464, %1463 : i64
      %1466 = scf.if %1465 -> (i64) {
        scf.yield %1462 : i64
      } else {
        %1467 = func.call @cc_nil_value() : () -> i64
        %1468 = func.call @cc_nil_value() : () -> i64
        %1469 = func.call @cc_errorp(%1467) : (i64) -> i64
        %1470 = arith.cmpi ne, %1469, %1468 : i64
        %1471 = scf.if %1470 -> (i64) {
          scf.yield %1467 : i64
        } else {
          %1472 = func.call @cc_nil_value() : () -> i64
          %1473 = func.call @cc_errorp(%1461) : (i64) -> i64
          %1474 = arith.cmpi ne, %1473, %1472 : i64
          %1475 = arith.cmpi eq, %1472, %1472 : i64
          %1476 = arith.andi %1474, %1475 : i1
          %1477 = scf.if %1476 -> (i64) {
            scf.yield %1461 : i64
          } else {
            scf.yield %1472 : i64
          }
          %1478 = arith.cmpi ne, %1477, %1472 : i64
          scf.if %1478 {
            func.call @stack_push_pointer(%1477) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1461) : (i64) -> ()
            %1479 = llvm.mlir.addressof @str108 : !llvm.ptr
            %1480 = func.call @cc_make_function_ref_const(%1479) : (!llvm.ptr) -> i64
            %1481 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1480, %1481) : (i64, i64) -> ()
          }
          %1482 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1482 : i64
        }
        %1483 = func.call @cc_nil_value() : () -> i64
        %1484 = func.call @cc_errorp(%1471) : (i64) -> i64
        %1485 = arith.cmpi ne, %1484, %1483 : i64
        %1486 = scf.if %1485 -> (i64) {
          scf.yield %1471 : i64
        } else {
          %1487 = func.call @cc_nil_value() : () -> i64
          %1488 = arith.cmpi ne, %1487, %1487 : i64
          scf.if %1488 {
            func.call @stack_push_pointer(%1487) : (i64) -> ()
          } else {
            %1489 = llvm.mlir.addressof @str109 : !llvm.ptr
            %1490 = func.call @cc_make_function_ref_const(%1489) : (!llvm.ptr) -> i64
            %1491 = arith.constant 0 : i64
            func.call @cc_funcall_stack(%1490, %1491) : (i64, i64) -> ()
          }
          %1492 = func.call @stack_pop_pointer() : () -> i64
          %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
          %1493 = arith.addi %1492, %__rlasp_stack_elide_zero_188 : i64
          scf.yield %1493 : i64
        }
        %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
        %1494 = arith.addi %1486, %__rlasp_stack_elide_zero_189 : i64
        %1495 = func.call @cc_multiple_value_list(%1494) : (i64) -> i64
        %1496 = func.call @cc_nil_value() : () -> i64
        %1497 = func.call @cc_errorp(%1461) : (i64) -> i64
        %1498 = arith.cmpi ne, %1497, %1496 : i64
        %1499 = arith.cmpi eq, %1496, %1496 : i64
        %1500 = arith.andi %1498, %1499 : i1
        %1501 = scf.if %1500 -> (i64) {
          scf.yield %1461 : i64
        } else {
          scf.yield %1496 : i64
        }
        %1502 = arith.cmpi ne, %1501, %1496 : i64
        scf.if %1502 {
          func.call @stack_push_pointer(%1501) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1461) : (i64) -> ()
          %1503 = llvm.mlir.addressof @str110 : !llvm.ptr
          %1504 = func.call @cc_make_function_ref_const(%1503) : (!llvm.ptr) -> i64
          %1505 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1504, %1505) : (i64, i64) -> ()
        }
        %1506 = func.call @stack_depth() : () -> i64
        %1507 = arith.constant 0 : i64
        %1508 = arith.cmpi sgt, %1506, %1507 : i64
        scf.if %1508 {
          %1509 = func.call @stack_pop_pointer() : () -> i64
        }
        %1510 = func.call @cc_values_pack(%1495) : (i64) -> i64
        %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
        %1511 = arith.addi %1510, %__rlasp_stack_elide_zero_190 : i64
        scf.yield %1511 : i64
      }
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %1512 = arith.addi %1466, %__rlasp_stack_elide_zero_191 : i64
      scf.yield %1512 : i64
    }
    func.call @stack_push_pointer(%1459) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928653"() {
    %1543 = func.call @stack_pop_pointer() : () -> i64
    %1544 = func.call @cc_nil_value() : () -> i64
    %1545 = func.call @cc_nil_value() : () -> i64
    %1546 = func.call @cc_errorp(%1544) : (i64) -> i64
    %1547 = arith.cmpi ne, %1546, %1545 : i64
    %1548 = scf.if %1547 -> (i64) {
      scf.yield %1544 : i64
    } else {
      %1549 = func.call @cc_symbol_value(%1543) : (i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      %1550 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %1551 = arith.addi %1550, %__rlasp_stack_elide_zero_192 : i64
      %1552 = func.call @stack_pop_pointer() : () -> i64
      %1553 = func.call @cc_set_car(%1552, %1551) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %1554 = arith.addi %1553, %__rlasp_stack_elide_zero_193 : i64
      scf.yield %1554 : i64
    }
    func.call @stack_push_pointer(%1548) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299145"() {
    %1379 = func.call @cc_nil_value() : () -> i64
    %1380 = func.call @cc_nil_value() : () -> i64
    %1381 = func.call @cc_errorp(%1379) : (i64) -> i64
    %1382 = arith.cmpi ne, %1381, %1380 : i64
    %1383 = scf.if %1382 -> (i64) {
      scf.yield %1379 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_nil_value() : () -> i64
      %1386 = func.call @cc_errorp(%1384) : (i64) -> i64
      %1387 = arith.cmpi ne, %1386, %1385 : i64
      %1388 = arith.cmpi eq, %1385, %1385 : i64
      %1389 = arith.andi %1387, %1388 : i1
      %1390 = scf.if %1389 -> (i64) {
        scf.yield %1384 : i64
      } else {
        scf.yield %1385 : i64
      }
      %1391 = arith.cmpi ne, %1390, %1385 : i64
      scf.if %1391 {
        func.call @stack_push_pointer(%1390) : (i64) -> ()
      } else {
        %1392 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1392) : (i64) -> ()
        %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
        %1393 = arith.addi %1384, %__rlasp_stack_elide_zero_194 : i64
        %1394 = func.call @stack_pop_pointer() : () -> i64
        %1395 = func.call @cc_cons(%1393, %1394) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1395) : (i64) -> ()
      }
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1398 = arith.constant 33 : i64
      %1399 = func.call @cc_make_symbol(%1397, %1398) : (!llvm.ptr, i64) -> i64
      %1400 = func.call @cc_persistent_root_value(%1399) : (i64) -> i64
      %1401 = func.call @cc_set_symbol_value(%1400, %1396) : (i64, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_nil_value() : () -> i64
      %1404 = func.call @cc_errorp(%1402) : (i64) -> i64
      %1405 = arith.cmpi ne, %1404, %1403 : i64
      %1406 = scf.if %1405 -> (i64) {
        scf.yield %1402 : i64
      } else {
        %1407 = func.call @cc_nil_value() : () -> i64
        %1408 = arith.cmpi ne, %1407, %1407 : i64
        scf.if %1408 {
          func.call @stack_push_pointer(%1407) : (i64) -> ()
        } else {
          %1409 = llvm.mlir.addressof @str105 : !llvm.ptr
          %1410 = func.call @cc_make_function_ref_const(%1409) : (!llvm.ptr) -> i64
          %1411 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1410, %1411) : (i64, i64) -> ()
        }
        %1412 = func.call @stack_pop_pointer() : () -> i64
        %1413 = func.call @cc_nil_value() : () -> i64
        %1414 = func.call @cc_nil_value() : () -> i64
        %1415 = func.call @cc_nil_value() : () -> i64
        %1416 = func.call @cc_errorp(%1414) : (i64) -> i64
        %1417 = arith.cmpi ne, %1416, %1415 : i64
        %1418:2 = scf.if %1417 -> (i64, i64) {
          scf.yield %1414, %1413 : i64, i64
        } else {
          %1420 = func.call @cc_nil_value() : () -> i64
          %1421 = func.call @cc_nil_value() : () -> i64
          %1422 = func.call @cc_errorp(%1420) : (i64) -> i64
          %1423 = arith.cmpi ne, %1422, %1421 : i64
          %1424:2 = scf.if %1423 -> (i64, i64) {
            scf.yield %1420, %1413 : i64, i64
          } else {
            %1425 = func.call @cc_nil_value() : () -> i64
            %1426 = func.call @cc_nil_value() : () -> i64
            %1427 = func.call @cc_errorp(%1425) : (i64) -> i64
            %1428 = arith.cmpi ne, %1427, %1426 : i64
            %1429:2 = scf.if %1428 -> (i64, i64) {
              scf.yield %1425, %1413 : i64, i64
            } else {
              %1430 = func.call @cc_nil_value() : () -> i64
              %1431 = func.call @cc_errorp(%1412) : (i64) -> i64
              %1432 = arith.cmpi ne, %1431, %1430 : i64
              %1433 = arith.cmpi eq, %1430, %1430 : i64
              %1434 = arith.andi %1432, %1433 : i1
              %1435 = scf.if %1434 -> (i64) {
                scf.yield %1412 : i64
              } else {
                scf.yield %1430 : i64
              }
              %1436 = arith.cmpi ne, %1435, %1430 : i64
              scf.if %1436 {
                func.call @stack_push_pointer(%1435) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1412) : (i64) -> ()
                %1437 = llvm.mlir.addressof @str106 : !llvm.ptr
                %1438 = func.call @cc_make_function_ref_const(%1437) : (!llvm.ptr) -> i64
                %1439 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%1438, %1439) : (i64, i64) -> ()
              }
              %1440 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1440, %1413 : i64, i64
            }
            %1441 = func.call @cc_nil_value() : () -> i64
            %1442 = func.call @cc_errorp(%1429#0) : (i64) -> i64
            %1443 = arith.cmpi ne, %1442, %1441 : i64
            %1444:2 = scf.if %1443 -> (i64, i64) {
              scf.yield %1429#0, %1429#1 : i64, i64
            } else {
              %1445 = llvm.mlir.addressof @str107 : !llvm.ptr
              %1446 = arith.constant 19 : i64
              %1447 = func.call @cc_make_string(%1445, %1446) : (!llvm.ptr, i64) -> i64
              %1448 = func.call @cc_nil_value() : () -> i64
              %1449 = func.call @cc_intern(%1447, %1448) : (i64, i64) -> i64
              %1450 = func.call @cc_nil_value() : () -> i64
              %1451 = func.call @cc_cons(%1449, %1450) : (i64, i64) -> i64
              %1452 = func.call @cc_values_pack(%1451) : (i64) -> i64
              %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
              %1453 = arith.addi %1449, %__rlasp_stack_elide_zero_195 : i64
              %1513 = llvm.mlir.addressof @str111 : !llvm.ptr
              %1514 = arith.constant 34 : i64
              %1515 = func.call @cc_make_symbol(%1513, %1514) : (!llvm.ptr, i64) -> i64
              %1516 = func.call @cc_persistent_root_value(%1515) : (i64) -> i64
              %1517 = func.call @cc_set_symbol_value(%1516, %1412) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1516) : (i64) -> ()
              %1518 = arith.constant 4634242382299147 : i64
              %1519 = arith.constant 1 : i64
              %1520 = func.call @cc_make_closure(%1518, %1519) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
              %1521 = arith.addi %1520, %__rlasp_stack_elide_zero_196 : i64
              %1522 = func.call @cc_nil_value() : () -> i64
              %1523 = func.call @cc_errorp(%1453) : (i64) -> i64
              %1524 = arith.cmpi ne, %1523, %1522 : i64
              %1525 = arith.cmpi eq, %1522, %1522 : i64
              %1526 = arith.andi %1524, %1525 : i1
              %1527 = scf.if %1526 -> (i64) {
                scf.yield %1453 : i64
              } else {
                scf.yield %1522 : i64
              }
              %1528 = func.call @cc_errorp(%1521) : (i64) -> i64
              %1529 = arith.cmpi ne, %1528, %1522 : i64
              %1530 = arith.cmpi eq, %1527, %1522 : i64
              %1531 = arith.andi %1529, %1530 : i1
              %1532 = scf.if %1531 -> (i64) {
                scf.yield %1521 : i64
              } else {
                scf.yield %1527 : i64
              }
              %1533 = arith.cmpi ne, %1532, %1522 : i64
              scf.if %1533 {
                func.call @stack_push_pointer(%1532) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1453) : (i64) -> ()
                func.call @stack_push_pointer(%1521) : (i64) -> ()
                %1534 = llvm.mlir.addressof @str112 : !llvm.ptr
                %1535 = func.call @cc_make_function_ref_const(%1534) : (!llvm.ptr) -> i64
                %1536 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%1535, %1536) : (i64, i64) -> ()
              }
              %1537 = func.call @stack_pop_pointer() : () -> i64
              %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
              %1538 = arith.addi %1537, %__rlasp_stack_elide_zero_197 : i64
              %1539 = func.call @cc_nil_value() : () -> i64
              %1540 = func.call @cc_errorp(%1538) : (i64) -> i64
              %1541 = arith.cmpi ne, %1540, %1539 : i64
              %1542 = scf.if %1541 -> (i64) {
                scf.yield %1538 : i64
              } else {
                func.call @stack_push_pointer(%1400) : (i64) -> ()
                %1555 = arith.constant 130642754928653 : i64
                %1556 = arith.constant 1 : i64
                %1557 = func.call @cc_make_closure(%1555, %1556) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
                %1558 = arith.addi %1557, %__rlasp_stack_elide_zero_198 : i64
                %1559 = func.call @cc_nil_value() : () -> i64
                %1560 = func.call @cc_errorp(%1537) : (i64) -> i64
                %1561 = arith.cmpi ne, %1560, %1559 : i64
                %1562 = arith.cmpi eq, %1559, %1559 : i64
                %1563 = arith.andi %1561, %1562 : i1
                %1564 = scf.if %1563 -> (i64) {
                  scf.yield %1537 : i64
                } else {
                  scf.yield %1559 : i64
                }
                %1565 = func.call @cc_errorp(%1558) : (i64) -> i64
                %1566 = arith.cmpi ne, %1565, %1559 : i64
                %1567 = arith.cmpi eq, %1564, %1559 : i64
                %1568 = arith.andi %1566, %1567 : i1
                %1569 = scf.if %1568 -> (i64) {
                  scf.yield %1558 : i64
                } else {
                  scf.yield %1564 : i64
                }
                %1570 = arith.cmpi ne, %1569, %1559 : i64
                scf.if %1570 {
                  func.call @stack_push_pointer(%1569) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%1537) : (i64) -> ()
                  func.call @stack_push_pointer(%1558) : (i64) -> ()
                  %1571 = llvm.mlir.addressof @str113 : !llvm.ptr
                  %1572 = func.call @cc_make_function_ref_const(%1571) : (!llvm.ptr) -> i64
                  %1573 = arith.constant 2 : i64
                  func.call @cc_funcall_stack(%1572, %1573) : (i64, i64) -> ()
                }
                %1574 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %1574 : i64
              }
              %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
              %1575 = arith.addi %1542, %__rlasp_stack_elide_zero_199 : i64
              scf.yield %1575, %1537 : i64, i64
            }
            %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
            %1576 = arith.addi %1444#0, %__rlasp_stack_elide_zero_200 : i64
            %1577 = func.call @cc_multiple_value_list(%1576) : (i64) -> i64
            %1578 = func.call @cc_nil_value() : () -> i64
            %1579 = func.call @cc_errorp(%1412) : (i64) -> i64
            %1580 = arith.cmpi ne, %1579, %1578 : i64
            %1581 = arith.cmpi eq, %1578, %1578 : i64
            %1582 = arith.andi %1580, %1581 : i1
            %1583 = scf.if %1582 -> (i64) {
              scf.yield %1412 : i64
            } else {
              scf.yield %1578 : i64
            }
            %1584 = arith.cmpi ne, %1583, %1578 : i64
            scf.if %1584 {
              func.call @stack_push_pointer(%1583) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1412) : (i64) -> ()
              %1585 = llvm.mlir.addressof @str114 : !llvm.ptr
              %1586 = func.call @cc_make_function_ref_const(%1585) : (!llvm.ptr) -> i64
              %1587 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1586, %1587) : (i64, i64) -> ()
            }
            %1588 = func.call @stack_depth() : () -> i64
            %1589 = arith.constant 0 : i64
            %1590 = arith.cmpi sgt, %1588, %1589 : i64
            scf.if %1590 {
              %1591 = func.call @stack_pop_pointer() : () -> i64
            }
            %1592 = func.call @cc_values_pack(%1577) : (i64) -> i64
            %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
            %1593 = arith.addi %1592, %__rlasp_stack_elide_zero_201 : i64
            scf.yield %1593, %1444#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
          %1594 = arith.addi %1424#0, %__rlasp_stack_elide_zero_202 : i64
          scf.yield %1594, %1424#1 : i64, i64
        }
        %1595 = func.call @cc_nil_value() : () -> i64
        %1596 = func.call @cc_errorp(%1418#0) : (i64) -> i64
        %1597 = arith.cmpi ne, %1596, %1595 : i64
        %1598:2 = scf.if %1597 -> (i64, i64) {
          scf.yield %1418#0, %1418#1 : i64, i64
        } else {
          %1599 = func.call @cc_push_ignore_errors_trap() : () -> i64
          func.call @cc_clear_multiple_values() : () -> ()
          %1600 = func.call @cc_nil_value() : () -> i64
          %1601 = func.call @cc_nil_value() : () -> i64
          %1602 = func.call @cc_errorp(%1600) : (i64) -> i64
          %1603 = arith.cmpi ne, %1602, %1601 : i64
          %1604 = scf.if %1603 -> (i64) {
            scf.yield %1600 : i64
          } else {
            %1605 = func.call @cc_nil_value() : () -> i64
            %1606 = func.call @cc_errorp(%1418#1) : (i64) -> i64
            %1607 = arith.cmpi ne, %1606, %1605 : i64
            %1608 = arith.cmpi eq, %1605, %1605 : i64
            %1609 = arith.andi %1607, %1608 : i1
            %1610 = scf.if %1609 -> (i64) {
              scf.yield %1418#1 : i64
            } else {
              scf.yield %1605 : i64
            }
            %1611 = arith.cmpi ne, %1610, %1605 : i64
            scf.if %1611 {
              func.call @stack_push_pointer(%1610) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1418#1) : (i64) -> ()
              %1612 = llvm.mlir.addressof @str115 : !llvm.ptr
              %1613 = func.call @cc_make_function_ref_const(%1612) : (!llvm.ptr) -> i64
              %1614 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1613, %1614) : (i64, i64) -> ()
            }
            %1615 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1615 : i64
          }
          %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
          %1616 = arith.addi %1604, %__rlasp_stack_elide_zero_203 : i64
          %1617 = func.call @cc_pop_ignore_errors_trap() : () -> i64
          %1618 = func.call @cc_errorp(%1616) : (i64) -> i64
          %1619 = func.call @cc_nil_value() : () -> i64
          %1620 = arith.cmpi ne, %1618, %1619 : i64
          scf.if %1620 {
            %1621 = func.call @cc_condition_value(%1616) : (i64) -> i64
            %1622 = func.call @cc_values2(%1619, %1621) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1622) : (i64) -> ()
          } else {
            %1623 = func.call @cc_multiple_value_list(%1616) : (i64) -> i64
            %1624 = func.call @cc_values_pack(%1623) : (i64) -> i64
            func.call @stack_push_pointer(%1624) : (i64) -> ()
          }
          %1625 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1625, %1418#1 : i64, i64
        }
        %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
        %1626 = arith.addi %1598#0, %__rlasp_stack_elide_zero_204 : i64
        scf.yield %1626 : i64
      }
      %1627 = func.call @cc_nil_value() : () -> i64
      %1628 = func.call @cc_errorp(%1406) : (i64) -> i64
      %1629 = arith.cmpi ne, %1628, %1627 : i64
      %1630 = scf.if %1629 -> (i64) {
        scf.yield %1406 : i64
      } else {
        %1631 = func.call @cc_symbol_value(%1400) : (i64) -> i64
        %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
        %1632 = arith.addi %1631, %__rlasp_stack_elide_zero_205 : i64
        scf.yield %1632 : i64
      }
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %1633 = arith.addi %1630, %__rlasp_stack_elide_zero_206 : i64
      scf.yield %1633 : i64
    }
    func.call @stack_push_pointer(%1383) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928655"() {
    %2046 = func.call @cc_nil_value() : () -> i64
    %2047 = func.call @cc_nil_value() : () -> i64
    %2048 = func.call @cc_errorp(%2046) : (i64) -> i64
    %2049 = arith.cmpi ne, %2048, %2047 : i64
    %2050 = scf.if %2049 -> (i64) {
      scf.yield %2046 : i64
    } else {
      %2051 = arith.constant 3 : i64
      %2052 = func.call @cc_box_fixnum(%2051) : (i64) -> i64
      %2053 = func.call @cc_nil_value() : () -> i64
      %2054 = func.call @cc_errorp(%2052) : (i64) -> i64
      %2055 = arith.cmpi ne, %2054, %2053 : i64
      %2056 = arith.cmpi eq, %2053, %2053 : i64
      %2057 = arith.andi %2055, %2056 : i1
      %2058 = scf.if %2057 -> (i64) {
        scf.yield %2052 : i64
      } else {
        scf.yield %2053 : i64
      }
      %2059 = arith.cmpi ne, %2058, %2053 : i64
      scf.if %2059 {
        func.call @stack_push_pointer(%2058) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2052) : (i64) -> ()
        %2060 = llvm.mlir.addressof @str151 : !llvm.ptr
        %2061 = func.call @cc_make_function_ref_const(%2060) : (!llvm.ptr) -> i64
        %2062 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2061, %2062) : (i64, i64) -> ()
      }
      %2063 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2063 : i64
    }
    func.call @stack_push_pointer(%2050) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928657"() {
    %2094 = func.call @stack_pop_pointer() : () -> i64
    %2095 = func.call @cc_nil_value() : () -> i64
    %2096 = func.call @cc_nil_value() : () -> i64
    %2097 = func.call @cc_errorp(%2095) : (i64) -> i64
    %2098 = arith.cmpi ne, %2097, %2096 : i64
    %2099 = scf.if %2098 -> (i64) {
      scf.yield %2095 : i64
    } else {
      %2100 = func.call @cc_symbol_value(%2094) : (i64) -> i64
      func.call @stack_push_pointer(%2100) : (i64) -> ()
      %2101 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %2102 = arith.addi %2101, %__rlasp_stack_elide_zero_207 : i64
      %2103 = func.call @stack_pop_pointer() : () -> i64
      %2104 = func.call @cc_set_car(%2103, %2102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %2105 = arith.addi %2104, %__rlasp_stack_elide_zero_208 : i64
      scf.yield %2105 : i64
    }
    func.call @stack_push_pointer(%2099) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928654"() {
    %2019 = func.call @cc_nil_value() : () -> i64
    %2020 = func.call @cc_nil_value() : () -> i64
    %2021 = func.call @cc_errorp(%2019) : (i64) -> i64
    %2022 = arith.cmpi ne, %2021, %2020 : i64
    %2023 = scf.if %2022 -> (i64) {
      scf.yield %2019 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2024 = func.call @stack_pop_pointer() : () -> i64
      %2025 = func.call @cc_nil_value() : () -> i64
      %2026 = func.call @cc_errorp(%2024) : (i64) -> i64
      %2027 = arith.cmpi ne, %2026, %2025 : i64
      %2028 = arith.cmpi eq, %2025, %2025 : i64
      %2029 = arith.andi %2027, %2028 : i1
      %2030 = scf.if %2029 -> (i64) {
        scf.yield %2024 : i64
      } else {
        scf.yield %2025 : i64
      }
      %2031 = arith.cmpi ne, %2030, %2025 : i64
      scf.if %2031 {
        func.call @stack_push_pointer(%2030) : (i64) -> ()
      } else {
        %2032 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2032) : (i64) -> ()
        %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
        %2033 = arith.addi %2024, %__rlasp_stack_elide_zero_209 : i64
        %2034 = func.call @stack_pop_pointer() : () -> i64
        %2035 = func.call @cc_cons(%2033, %2034) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2035) : (i64) -> ()
      }
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = llvm.mlir.addressof @str150 : !llvm.ptr
      %2038 = arith.constant 24 : i64
      %2039 = func.call @cc_make_string(%2037, %2038) : (!llvm.ptr, i64) -> i64
      %2040 = func.call @cc_nil_value() : () -> i64
      %2041 = func.call @cc_intern(%2039, %2040) : (i64, i64) -> i64
      %2042 = func.call @cc_nil_value() : () -> i64
      %2043 = func.call @cc_cons(%2041, %2042) : (i64, i64) -> i64
      %2044 = func.call @cc_values_pack(%2043) : (i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %2045 = arith.addi %2041, %__rlasp_stack_elide_zero_210 : i64
      %2064 = arith.constant 130642754928655 : i64
      %2065 = arith.constant 0 : i64
      %2066 = func.call @cc_make_closure(%2064, %2065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %2067 = arith.addi %2066, %__rlasp_stack_elide_zero_211 : i64
      %2068 = func.call @cc_nil_value() : () -> i64
      %2069 = func.call @cc_errorp(%2045) : (i64) -> i64
      %2070 = arith.cmpi ne, %2069, %2068 : i64
      %2071 = arith.cmpi eq, %2068, %2068 : i64
      %2072 = arith.andi %2070, %2071 : i1
      %2073 = scf.if %2072 -> (i64) {
        scf.yield %2045 : i64
      } else {
        scf.yield %2068 : i64
      }
      %2074 = func.call @cc_errorp(%2067) : (i64) -> i64
      %2075 = arith.cmpi ne, %2074, %2068 : i64
      %2076 = arith.cmpi eq, %2073, %2068 : i64
      %2077 = arith.andi %2075, %2076 : i1
      %2078 = scf.if %2077 -> (i64) {
        scf.yield %2067 : i64
      } else {
        scf.yield %2073 : i64
      }
      %2079 = arith.cmpi ne, %2078, %2068 : i64
      scf.if %2079 {
        func.call @stack_push_pointer(%2078) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2045) : (i64) -> ()
        func.call @stack_push_pointer(%2067) : (i64) -> ()
        %2080 = llvm.mlir.addressof @str152 : !llvm.ptr
        %2081 = func.call @cc_make_function_ref_const(%2080) : (!llvm.ptr) -> i64
        %2082 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2081, %2082) : (i64, i64) -> ()
      }
      %2083 = func.call @stack_pop_pointer() : () -> i64
      %2084 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2085 = arith.constant 33 : i64
      %2086 = func.call @cc_make_symbol(%2084, %2085) : (!llvm.ptr, i64) -> i64
      %2087 = func.call @cc_persistent_root_value(%2086) : (i64) -> i64
      %2088 = func.call @cc_set_symbol_value(%2087, %2036) : (i64, i64) -> i64
      %2089 = func.call @cc_nil_value() : () -> i64
      %2090 = func.call @cc_nil_value() : () -> i64
      %2091 = func.call @cc_errorp(%2089) : (i64) -> i64
      %2092 = arith.cmpi ne, %2091, %2090 : i64
      %2093 = scf.if %2092 -> (i64) {
        scf.yield %2089 : i64
      } else {
        func.call @stack_push_pointer(%2087) : (i64) -> ()
        %2106 = arith.constant 130642754928657 : i64
        %2107 = arith.constant 1 : i64
        %2108 = func.call @cc_make_closure(%2106, %2107) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
        %2109 = arith.addi %2108, %__rlasp_stack_elide_zero_212 : i64
        %2110 = func.call @cc_nil_value() : () -> i64
        %2111 = func.call @cc_errorp(%2083) : (i64) -> i64
        %2112 = arith.cmpi ne, %2111, %2110 : i64
        %2113 = arith.cmpi eq, %2110, %2110 : i64
        %2114 = arith.andi %2112, %2113 : i1
        %2115 = scf.if %2114 -> (i64) {
          scf.yield %2083 : i64
        } else {
          scf.yield %2110 : i64
        }
        %2116 = func.call @cc_errorp(%2109) : (i64) -> i64
        %2117 = arith.cmpi ne, %2116, %2110 : i64
        %2118 = arith.cmpi eq, %2115, %2110 : i64
        %2119 = arith.andi %2117, %2118 : i1
        %2120 = scf.if %2119 -> (i64) {
          scf.yield %2109 : i64
        } else {
          scf.yield %2115 : i64
        }
        %2121 = arith.cmpi ne, %2120, %2110 : i64
        scf.if %2121 {
          func.call @stack_push_pointer(%2120) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2083) : (i64) -> ()
          func.call @stack_push_pointer(%2109) : (i64) -> ()
          %2122 = llvm.mlir.addressof @str154 : !llvm.ptr
          %2123 = func.call @cc_make_function_ref_const(%2122) : (!llvm.ptr) -> i64
          %2124 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2123, %2124) : (i64, i64) -> ()
        }
        %2125 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2125 : i64
      }
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_errorp(%2093) : (i64) -> i64
      %2128 = arith.cmpi ne, %2127, %2126 : i64
      %2129 = scf.if %2128 -> (i64) {
        scf.yield %2093 : i64
      } else {
        %2130 = func.call @cc_nil_value() : () -> i64
        %2131 = func.call @cc_errorp(%2083) : (i64) -> i64
        %2132 = arith.cmpi ne, %2131, %2130 : i64
        %2133 = arith.cmpi eq, %2130, %2130 : i64
        %2134 = arith.andi %2132, %2133 : i1
        %2135 = scf.if %2134 -> (i64) {
          scf.yield %2083 : i64
        } else {
          scf.yield %2130 : i64
        }
        %2136 = arith.cmpi ne, %2135, %2130 : i64
        scf.if %2136 {
          func.call @stack_push_pointer(%2135) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2083) : (i64) -> ()
          %2137 = llvm.mlir.addressof @str155 : !llvm.ptr
          %2138 = func.call @cc_make_function_ref_const(%2137) : (!llvm.ptr) -> i64
          %2139 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2138, %2139) : (i64, i64) -> ()
        }
        %2140 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2140 : i64
      }
      %2141 = func.call @cc_nil_value() : () -> i64
      %2142 = func.call @cc_errorp(%2129) : (i64) -> i64
      %2143 = arith.cmpi ne, %2142, %2141 : i64
      %2144 = scf.if %2143 -> (i64) {
        scf.yield %2129 : i64
      } else {
        %2145 = func.call @cc_symbol_value(%2087) : (i64) -> i64
        %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
        %2146 = arith.addi %2145, %__rlasp_stack_elide_zero_213 : i64
        scf.yield %2146 : i64
      }
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %2147 = arith.addi %2144, %__rlasp_stack_elide_zero_214 : i64
      scf.yield %2147 : i64
    }
    func.call @stack_push_pointer(%2023) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928661"() {
    %2709 = func.call @stack_pop_pointer() : () -> i64
    %2710 = func.call @stack_pop_pointer() : () -> i64
    %2711 = func.call @cc_nil_value() : () -> i64
    %2712 = func.call @cc_nil_value() : () -> i64
    %2713 = func.call @cc_errorp(%2711) : (i64) -> i64
    %2714 = arith.cmpi ne, %2713, %2712 : i64
    %2715 = scf.if %2714 -> (i64) {
      scf.yield %2711 : i64
    } else {
      %2717 = func.call @cc_symbol_value(%2709) : (i64) -> i64
      %2718 = func.call @cc_nil_value() : () -> i64
      %2719 = func.call @cc_nil_value() : () -> i64
      %2720 = func.call @cc_errorp(%2718) : (i64) -> i64
      %2721 = arith.cmpi ne, %2720, %2719 : i64
      %2722 = scf.if %2721 -> (i64) {
        scf.yield %2718 : i64
      } else {
        %2723 = func.call @cc_nil_value() : () -> i64
        %2724 = func.call @cc_nil_value() : () -> i64
        %2725 = func.call @cc_errorp(%2723) : (i64) -> i64
        %2726 = arith.cmpi ne, %2725, %2724 : i64
        %2727 = scf.if %2726 -> (i64) {
          scf.yield %2723 : i64
        } else {
          %2728 = func.call @cc_nil_value() : () -> i64
          %2729 = func.call @cc_errorp(%2717) : (i64) -> i64
          %2730 = arith.cmpi ne, %2729, %2728 : i64
          %2731 = arith.cmpi eq, %2728, %2728 : i64
          %2732 = arith.andi %2730, %2731 : i1
          %2733 = scf.if %2732 -> (i64) {
            scf.yield %2717 : i64
          } else {
            scf.yield %2728 : i64
          }
          %2734 = arith.cmpi ne, %2733, %2728 : i64
          scf.if %2734 {
            func.call @stack_push_pointer(%2733) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2717) : (i64) -> ()
            %2735 = llvm.mlir.addressof @str206 : !llvm.ptr
            %2736 = func.call @cc_make_function_ref_const(%2735) : (!llvm.ptr) -> i64
            %2737 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2736, %2737) : (i64, i64) -> ()
          }
          %2738 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2738 : i64
        }
        %2739 = func.call @cc_nil_value() : () -> i64
        %2740 = func.call @cc_errorp(%2727) : (i64) -> i64
        %2741 = arith.cmpi ne, %2740, %2739 : i64
        %2742 = scf.if %2741 -> (i64) {
          scf.yield %2727 : i64
        } else {
          %2743 = func.call @cc_symbol_value(%2710) : (i64) -> i64
          func.call @stack_push_pointer(%2743) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %2744 = func.call @stack_pop_pointer() : () -> i64
          %2745 = func.call @stack_pop_pointer() : () -> i64
          %2746 = func.call @cc_set_car(%2745, %2744) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
          %2747 = arith.addi %2746, %__rlasp_stack_elide_zero_215 : i64
          %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
          %2748 = arith.addi %2747, %__rlasp_stack_elide_zero_216 : i64
          scf.yield %2748 : i64
        }
        %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
        %2749 = arith.addi %2742, %__rlasp_stack_elide_zero_217 : i64
        %2750 = func.call @cc_multiple_value_list(%2749) : (i64) -> i64
        %2751 = func.call @cc_nil_value() : () -> i64
        %2752 = func.call @cc_errorp(%2717) : (i64) -> i64
        %2753 = arith.cmpi ne, %2752, %2751 : i64
        %2754 = arith.cmpi eq, %2751, %2751 : i64
        %2755 = arith.andi %2753, %2754 : i1
        %2756 = scf.if %2755 -> (i64) {
          scf.yield %2717 : i64
        } else {
          scf.yield %2751 : i64
        }
        %2757 = arith.cmpi ne, %2756, %2751 : i64
        scf.if %2757 {
          func.call @stack_push_pointer(%2756) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2717) : (i64) -> ()
          %2758 = llvm.mlir.addressof @str207 : !llvm.ptr
          %2759 = func.call @cc_make_function_ref_const(%2758) : (!llvm.ptr) -> i64
          %2760 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2759, %2760) : (i64, i64) -> ()
        }
        %2761 = func.call @stack_depth() : () -> i64
        %2762 = arith.constant 0 : i64
        %2763 = arith.cmpi sgt, %2761, %2762 : i64
        scf.if %2763 {
          %2764 = func.call @stack_pop_pointer() : () -> i64
        }
        %2765 = func.call @cc_values_pack(%2750) : (i64) -> i64
        %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
        %2766 = arith.addi %2765, %__rlasp_stack_elide_zero_218 : i64
        scf.yield %2766 : i64
      }
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %2767 = arith.addi %2722, %__rlasp_stack_elide_zero_219 : i64
      scf.yield %2767 : i64
    }
    func.call @stack_push_pointer(%2715) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928658"() {
    %2632 = func.call @cc_nil_value() : () -> i64
    %2633 = func.call @cc_nil_value() : () -> i64
    %2634 = func.call @cc_errorp(%2632) : (i64) -> i64
    %2635 = arith.cmpi ne, %2634, %2633 : i64
    %2636 = scf.if %2635 -> (i64) {
      scf.yield %2632 : i64
    } else {
      %2637 = func.call @cc_nil_value() : () -> i64
      %2638 = arith.cmpi ne, %2637, %2637 : i64
      scf.if %2638 {
        func.call @stack_push_pointer(%2637) : (i64) -> ()
      } else {
        %2639 = llvm.mlir.addressof @str201 : !llvm.ptr
        %2640 = func.call @cc_make_function_ref_const(%2639) : (!llvm.ptr) -> i64
        %2641 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%2640, %2641) : (i64, i64) -> ()
      }
      %2642 = func.call @stack_pop_pointer() : () -> i64
      %2643 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %2644 = arith.addi %2643, %__rlasp_stack_elide_zero_220 : i64
      %2645 = func.call @cc_nil_value() : () -> i64
      %2646 = func.call @cc_errorp(%2644) : (i64) -> i64
      %2647 = arith.cmpi ne, %2646, %2645 : i64
      %2648 = arith.cmpi eq, %2645, %2645 : i64
      %2649 = arith.andi %2647, %2648 : i1
      %2650 = scf.if %2649 -> (i64) {
        scf.yield %2644 : i64
      } else {
        scf.yield %2645 : i64
      }
      %2651 = arith.cmpi ne, %2650, %2645 : i64
      scf.if %2651 {
        func.call @stack_push_pointer(%2650) : (i64) -> ()
      } else {
        %2652 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2652) : (i64) -> ()
        %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
        %2653 = arith.addi %2644, %__rlasp_stack_elide_zero_221 : i64
        %2654 = func.call @stack_pop_pointer() : () -> i64
        %2655 = func.call @cc_cons(%2653, %2654) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2655) : (i64) -> ()
      }
      %2656 = func.call @stack_pop_pointer() : () -> i64
      %2657 = func.call @cc_nil_value() : () -> i64
      %2658 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2659 = arith.constant 33 : i64
      %2660 = func.call @cc_make_symbol(%2658, %2659) : (!llvm.ptr, i64) -> i64
      %2661 = func.call @cc_persistent_root_value(%2660) : (i64) -> i64
      %2662 = func.call @cc_set_symbol_value(%2661, %2656) : (i64, i64) -> i64
      %2663 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2664 = arith.constant 33 : i64
      %2665 = func.call @cc_make_symbol(%2663, %2664) : (!llvm.ptr, i64) -> i64
      %2666 = func.call @cc_persistent_root_value(%2665) : (i64) -> i64
      %2667 = func.call @cc_set_symbol_value(%2666, %2642) : (i64, i64) -> i64
      %2668 = func.call @cc_nil_value() : () -> i64
      %2669 = func.call @cc_nil_value() : () -> i64
      %2670 = func.call @cc_errorp(%2668) : (i64) -> i64
      %2671 = arith.cmpi ne, %2670, %2669 : i64
      %2672:2 = scf.if %2671 -> (i64, i64) {
        scf.yield %2668, %2657 : i64, i64
      } else {
        %2674 = func.call @cc_symbol_value(%2666) : (i64) -> i64
        %2675 = func.call @cc_nil_value() : () -> i64
        %2676 = func.call @cc_nil_value() : () -> i64
        %2677 = func.call @cc_errorp(%2675) : (i64) -> i64
        %2678 = arith.cmpi ne, %2677, %2676 : i64
        %2679:2 = scf.if %2678 -> (i64, i64) {
          scf.yield %2675, %2657 : i64, i64
        } else {
          %2680 = func.call @cc_nil_value() : () -> i64
          %2681 = func.call @cc_nil_value() : () -> i64
          %2682 = func.call @cc_errorp(%2680) : (i64) -> i64
          %2683 = arith.cmpi ne, %2682, %2681 : i64
          %2684:2 = scf.if %2683 -> (i64, i64) {
            scf.yield %2680, %2657 : i64, i64
          } else {
            %2685 = func.call @cc_nil_value() : () -> i64
            %2686 = func.call @cc_errorp(%2674) : (i64) -> i64
            %2687 = arith.cmpi ne, %2686, %2685 : i64
            %2688 = arith.cmpi eq, %2685, %2685 : i64
            %2689 = arith.andi %2687, %2688 : i1
            %2690 = scf.if %2689 -> (i64) {
              scf.yield %2674 : i64
            } else {
              scf.yield %2685 : i64
            }
            %2691 = arith.cmpi ne, %2690, %2685 : i64
            scf.if %2691 {
              func.call @stack_push_pointer(%2690) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2674) : (i64) -> ()
              %2692 = llvm.mlir.addressof @str204 : !llvm.ptr
              %2693 = func.call @cc_make_function_ref_const(%2692) : (!llvm.ptr) -> i64
              %2694 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2693, %2694) : (i64, i64) -> ()
            }
            %2695 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2695, %2657 : i64, i64
          }
          %2696 = func.call @cc_nil_value() : () -> i64
          %2697 = func.call @cc_errorp(%2684#0) : (i64) -> i64
          %2698 = arith.cmpi ne, %2697, %2696 : i64
          %2699:2 = scf.if %2698 -> (i64, i64) {
            scf.yield %2684#0, %2684#1 : i64, i64
          } else {
            %2700 = llvm.mlir.addressof @str205 : !llvm.ptr
            %2701 = arith.constant 23 : i64
            %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
            %2703 = func.call @cc_nil_value() : () -> i64
            %2704 = func.call @cc_intern(%2702, %2703) : (i64, i64) -> i64
            %2705 = func.call @cc_nil_value() : () -> i64
            %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
            %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
            %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
            %2708 = arith.addi %2704, %__rlasp_stack_elide_zero_222 : i64
            func.call @stack_push_pointer(%2661) : (i64) -> ()
            func.call @stack_push_pointer(%2666) : (i64) -> ()
            %2768 = arith.constant 130642754928661 : i64
            %2769 = arith.constant 2 : i64
            %2770 = func.call @cc_make_closure(%2768, %2769) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
            %2771 = arith.addi %2770, %__rlasp_stack_elide_zero_223 : i64
            %2772 = func.call @cc_nil_value() : () -> i64
            %2773 = func.call @cc_errorp(%2708) : (i64) -> i64
            %2774 = arith.cmpi ne, %2773, %2772 : i64
            %2775 = arith.cmpi eq, %2772, %2772 : i64
            %2776 = arith.andi %2774, %2775 : i1
            %2777 = scf.if %2776 -> (i64) {
              scf.yield %2708 : i64
            } else {
              scf.yield %2772 : i64
            }
            %2778 = func.call @cc_errorp(%2771) : (i64) -> i64
            %2779 = arith.cmpi ne, %2778, %2772 : i64
            %2780 = arith.cmpi eq, %2777, %2772 : i64
            %2781 = arith.andi %2779, %2780 : i1
            %2782 = scf.if %2781 -> (i64) {
              scf.yield %2771 : i64
            } else {
              scf.yield %2777 : i64
            }
            %2783 = arith.cmpi ne, %2782, %2772 : i64
            scf.if %2783 {
              func.call @stack_push_pointer(%2782) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2708) : (i64) -> ()
              func.call @stack_push_pointer(%2771) : (i64) -> ()
              %2784 = llvm.mlir.addressof @str208 : !llvm.ptr
              %2785 = func.call @cc_make_function_ref_const(%2784) : (!llvm.ptr) -> i64
              %2786 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%2785, %2786) : (i64, i64) -> ()
            }
            %2787 = func.call @stack_pop_pointer() : () -> i64
            %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
            %2788 = arith.addi %2787, %__rlasp_stack_elide_zero_224 : i64
            %2789 = func.call @cc_nil_value() : () -> i64
            %2790 = func.call @cc_errorp(%2788) : (i64) -> i64
            %2791 = arith.cmpi ne, %2790, %2789 : i64
            %2792 = scf.if %2791 -> (i64) {
              scf.yield %2788 : i64
            } else {
              %2793 = func.call @cc_nil_value() : () -> i64
              %2794 = func.call @cc_errorp(%2787) : (i64) -> i64
              %2795 = arith.cmpi ne, %2794, %2793 : i64
              %2796 = arith.cmpi eq, %2793, %2793 : i64
              %2797 = arith.andi %2795, %2796 : i1
              %2798 = scf.if %2797 -> (i64) {
                scf.yield %2787 : i64
              } else {
                scf.yield %2793 : i64
              }
              %2799 = arith.cmpi ne, %2798, %2793 : i64
              scf.if %2799 {
                func.call @stack_push_pointer(%2798) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%2787) : (i64) -> ()
                %2800 = llvm.mlir.addressof @str209 : !llvm.ptr
                %2801 = func.call @cc_make_function_ref_const(%2800) : (!llvm.ptr) -> i64
                %2802 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%2801, %2802) : (i64, i64) -> ()
              }
              %2803 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2803 : i64
            }
            %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
            %2804 = arith.addi %2792, %__rlasp_stack_elide_zero_225 : i64
            scf.yield %2804, %2787 : i64, i64
          }
          %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
          %2805 = arith.addi %2699#0, %__rlasp_stack_elide_zero_226 : i64
          %2806 = func.call @cc_multiple_value_list(%2805) : (i64) -> i64
          %2807 = func.call @cc_nil_value() : () -> i64
          %2808 = func.call @cc_errorp(%2674) : (i64) -> i64
          %2809 = arith.cmpi ne, %2808, %2807 : i64
          %2810 = arith.cmpi eq, %2807, %2807 : i64
          %2811 = arith.andi %2809, %2810 : i1
          %2812 = scf.if %2811 -> (i64) {
            scf.yield %2674 : i64
          } else {
            scf.yield %2807 : i64
          }
          %2813 = arith.cmpi ne, %2812, %2807 : i64
          scf.if %2813 {
            func.call @stack_push_pointer(%2812) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2674) : (i64) -> ()
            %2814 = llvm.mlir.addressof @str210 : !llvm.ptr
            %2815 = func.call @cc_make_function_ref_const(%2814) : (!llvm.ptr) -> i64
            %2816 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2815, %2816) : (i64, i64) -> ()
          }
          %2817 = func.call @stack_depth() : () -> i64
          %2818 = arith.constant 0 : i64
          %2819 = arith.cmpi sgt, %2817, %2818 : i64
          scf.if %2819 {
            %2820 = func.call @stack_pop_pointer() : () -> i64
          }
          %2821 = func.call @cc_values_pack(%2806) : (i64) -> i64
          %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
          %2822 = arith.addi %2821, %__rlasp_stack_elide_zero_227 : i64
          scf.yield %2822, %2699#1 : i64, i64
        }
        %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
        %2823 = arith.addi %2679#0, %__rlasp_stack_elide_zero_228 : i64
        scf.yield %2823, %2679#1 : i64, i64
      }
      %2824 = func.call @cc_nil_value() : () -> i64
      %2825 = func.call @cc_errorp(%2672#0) : (i64) -> i64
      %2826 = arith.cmpi ne, %2825, %2824 : i64
      %2827:2 = scf.if %2826 -> (i64, i64) {
        scf.yield %2672#0, %2672#1 : i64, i64
      } else {
        %2828 = func.call @cc_push_ignore_errors_trap() : () -> i64
        func.call @cc_clear_multiple_values() : () -> ()
        %2829 = func.call @cc_nil_value() : () -> i64
        %2830 = func.call @cc_nil_value() : () -> i64
        %2831 = func.call @cc_errorp(%2829) : (i64) -> i64
        %2832 = arith.cmpi ne, %2831, %2830 : i64
        %2833 = scf.if %2832 -> (i64) {
          scf.yield %2829 : i64
        } else {
          %2834 = func.call @cc_nil_value() : () -> i64
          %2835 = func.call @cc_errorp(%2672#1) : (i64) -> i64
          %2836 = arith.cmpi ne, %2835, %2834 : i64
          %2837 = arith.cmpi eq, %2834, %2834 : i64
          %2838 = arith.andi %2836, %2837 : i1
          %2839 = scf.if %2838 -> (i64) {
            scf.yield %2672#1 : i64
          } else {
            scf.yield %2834 : i64
          }
          %2840 = arith.cmpi ne, %2839, %2834 : i64
          scf.if %2840 {
            func.call @stack_push_pointer(%2839) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2672#1) : (i64) -> ()
            %2841 = llvm.mlir.addressof @str211 : !llvm.ptr
            %2842 = func.call @cc_make_function_ref_const(%2841) : (!llvm.ptr) -> i64
            %2843 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2842, %2843) : (i64, i64) -> ()
          }
          %2844 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2844 : i64
        }
        %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
        %2845 = arith.addi %2833, %__rlasp_stack_elide_zero_229 : i64
        %2846 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %2847 = func.call @cc_errorp(%2845) : (i64) -> i64
        %2848 = func.call @cc_nil_value() : () -> i64
        %2849 = arith.cmpi ne, %2847, %2848 : i64
        scf.if %2849 {
          %2850 = func.call @cc_condition_value(%2845) : (i64) -> i64
          %2851 = func.call @cc_values2(%2848, %2850) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2851) : (i64) -> ()
        } else {
          %2852 = func.call @cc_multiple_value_list(%2845) : (i64) -> i64
          %2853 = func.call @cc_values_pack(%2852) : (i64) -> i64
          func.call @stack_push_pointer(%2853) : (i64) -> ()
        }
        %2854 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2854, %2672#1 : i64, i64
      }
      %2855 = func.call @cc_nil_value() : () -> i64
      %2856 = func.call @cc_errorp(%2827#0) : (i64) -> i64
      %2857 = arith.cmpi ne, %2856, %2855 : i64
      %2858:2 = scf.if %2857 -> (i64, i64) {
        scf.yield %2827#0, %2827#1 : i64, i64
      } else {
        %2859 = func.call @cc_symbol_value(%2661) : (i64) -> i64
        %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
        %2860 = arith.addi %2859, %__rlasp_stack_elide_zero_230 : i64
        scf.yield %2860, %2827#1 : i64, i64
      }
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %2861 = arith.addi %2858#0, %__rlasp_stack_elide_zero_231 : i64
      scf.yield %2861 : i64
    }
    func.call @stack_push_pointer(%2636) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928663"() {
    %3209 = func.call @stack_pop_pointer() : () -> i64
    %3210 = func.call @cc_nil_value() : () -> i64
    %3211 = func.call @cc_nil_value() : () -> i64
    %3212 = func.call @cc_errorp(%3210) : (i64) -> i64
    %3213 = arith.cmpi ne, %3212, %3211 : i64
    %3214 = scf.if %3213 -> (i64) {
      scf.yield %3210 : i64
    } else {
      %3215 = func.call @cc_nil_value() : () -> i64
      %3216 = arith.cmpi ne, %3215, %3215 : i64
      scf.if %3216 {
        func.call @stack_push_pointer(%3215) : (i64) -> ()
      } else {
        %3217 = llvm.mlir.addressof @str242 : !llvm.ptr
        %3218 = func.call @cc_make_function_ref_const(%3217) : (!llvm.ptr) -> i64
        %3219 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%3218, %3219) : (i64, i64) -> ()
      }
      %3220 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3220 : i64
    }
    %3221 = func.call @cc_nil_value() : () -> i64
    %3222 = func.call @cc_errorp(%3214) : (i64) -> i64
    %3223 = arith.cmpi ne, %3222, %3221 : i64
    %3224 = scf.if %3223 -> (i64) {
      scf.yield %3214 : i64
    } else {
      %3225 = func.call @cc_nil_value() : () -> i64
      %3226 = func.call @cc_set_symbol_value(%3209, %3225) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %3227 = arith.addi %3225, %__rlasp_stack_elide_zero_232 : i64
      scf.yield %3227 : i64
    }
    func.call @stack_push_pointer(%3224) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928662"() {
    %3194 = func.call @cc_nil_value() : () -> i64
    %3195 = func.call @cc_nil_value() : () -> i64
    %3196 = func.call @cc_errorp(%3194) : (i64) -> i64
    %3197 = arith.cmpi ne, %3196, %3195 : i64
    %3198 = scf.if %3197 -> (i64) {
      scf.yield %3194 : i64
    } else {
      %3199 = func.call @cc_t_value() : () -> i64
      %3200 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3201 = arith.constant 24 : i64
      %3202 = func.call @cc_make_string(%3200, %3201) : (!llvm.ptr, i64) -> i64
      %3203 = func.call @cc_nil_value() : () -> i64
      %3204 = func.call @cc_intern(%3202, %3203) : (i64, i64) -> i64
      %3205 = func.call @cc_nil_value() : () -> i64
      %3206 = func.call @cc_cons(%3204, %3205) : (i64, i64) -> i64
      %3207 = func.call @cc_values_pack(%3206) : (i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %3208 = arith.addi %3204, %__rlasp_stack_elide_zero_233 : i64
      %3228 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3229 = arith.constant 33 : i64
      %3230 = func.call @cc_make_symbol(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = func.call @cc_persistent_root_value(%3230) : (i64) -> i64
      %3232 = func.call @cc_set_symbol_value(%3231, %3199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3231) : (i64) -> ()
      %3233 = arith.constant 130642754928663 : i64
      %3234 = arith.constant 1 : i64
      %3235 = func.call @cc_make_closure(%3233, %3234) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %3236 = arith.addi %3235, %__rlasp_stack_elide_zero_234 : i64
      %3237 = func.call @cc_nil_value() : () -> i64
      %3238 = func.call @cc_errorp(%3208) : (i64) -> i64
      %3239 = arith.cmpi ne, %3238, %3237 : i64
      %3240 = arith.cmpi eq, %3237, %3237 : i64
      %3241 = arith.andi %3239, %3240 : i1
      %3242 = scf.if %3241 -> (i64) {
        scf.yield %3208 : i64
      } else {
        scf.yield %3237 : i64
      }
      %3243 = func.call @cc_errorp(%3236) : (i64) -> i64
      %3244 = arith.cmpi ne, %3243, %3237 : i64
      %3245 = arith.cmpi eq, %3242, %3237 : i64
      %3246 = arith.andi %3244, %3245 : i1
      %3247 = scf.if %3246 -> (i64) {
        scf.yield %3236 : i64
      } else {
        scf.yield %3242 : i64
      }
      %3248 = arith.cmpi ne, %3247, %3237 : i64
      scf.if %3248 {
        func.call @stack_push_pointer(%3247) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3208) : (i64) -> ()
        func.call @stack_push_pointer(%3236) : (i64) -> ()
        %3249 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3250 = func.call @cc_make_function_ref_const(%3249) : (!llvm.ptr) -> i64
        %3251 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3250, %3251) : (i64, i64) -> ()
      }
      %3252 = func.call @stack_pop_pointer() : () -> i64
      %3253 = func.call @cc_nil_value() : () -> i64
      %3254 = func.call @cc_nil_value() : () -> i64
      %3255 = func.call @cc_errorp(%3253) : (i64) -> i64
      %3256 = arith.cmpi ne, %3255, %3254 : i64
      %3257 = scf.if %3256 -> (i64) {
        scf.yield %3253 : i64
      } else {
        %3258 = func.call @cc_nil_value() : () -> i64
        %3259 = func.call @cc_errorp(%3252) : (i64) -> i64
        %3260 = arith.cmpi ne, %3259, %3258 : i64
        %3261 = arith.cmpi eq, %3258, %3258 : i64
        %3262 = arith.andi %3260, %3261 : i1
        %3263 = scf.if %3262 -> (i64) {
          scf.yield %3252 : i64
        } else {
          scf.yield %3258 : i64
        }
        %3264 = arith.cmpi ne, %3263, %3258 : i64
        scf.if %3264 {
          func.call @stack_push_pointer(%3263) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3252) : (i64) -> ()
          %3265 = llvm.mlir.addressof @str245 : !llvm.ptr
          %3266 = func.call @cc_make_function_ref_const(%3265) : (!llvm.ptr) -> i64
          %3267 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3266, %3267) : (i64, i64) -> ()
        }
        %3268 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3268 : i64
      }
      %3269 = func.call @cc_nil_value() : () -> i64
      %3270 = func.call @cc_errorp(%3257) : (i64) -> i64
      %3271 = arith.cmpi ne, %3270, %3269 : i64
      %3272 = scf.if %3271 -> (i64) {
        scf.yield %3257 : i64
      } else {
        %3273 = func.call @cc_push_ignore_errors_trap() : () -> i64
        func.call @cc_clear_multiple_values() : () -> ()
        %3274 = func.call @cc_nil_value() : () -> i64
        %3275 = func.call @cc_nil_value() : () -> i64
        %3276 = func.call @cc_errorp(%3274) : (i64) -> i64
        %3277 = arith.cmpi ne, %3276, %3275 : i64
        %3278 = scf.if %3277 -> (i64) {
          scf.yield %3274 : i64
        } else {
          %3279 = func.call @cc_nil_value() : () -> i64
          %3280 = func.call @cc_errorp(%3252) : (i64) -> i64
          %3281 = arith.cmpi ne, %3280, %3279 : i64
          %3282 = arith.cmpi eq, %3279, %3279 : i64
          %3283 = arith.andi %3281, %3282 : i1
          %3284 = scf.if %3283 -> (i64) {
            scf.yield %3252 : i64
          } else {
            scf.yield %3279 : i64
          }
          %3285 = arith.cmpi ne, %3284, %3279 : i64
          scf.if %3285 {
            func.call @stack_push_pointer(%3284) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3252) : (i64) -> ()
            %3286 = llvm.mlir.addressof @str246 : !llvm.ptr
            %3287 = func.call @cc_make_function_ref_const(%3286) : (!llvm.ptr) -> i64
            %3288 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3287, %3288) : (i64, i64) -> ()
          }
          %3289 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3289 : i64
        }
        %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
        %3290 = arith.addi %3278, %__rlasp_stack_elide_zero_235 : i64
        %3291 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %3292 = func.call @cc_errorp(%3290) : (i64) -> i64
        %3293 = func.call @cc_nil_value() : () -> i64
        %3294 = arith.cmpi ne, %3292, %3293 : i64
        scf.if %3294 {
          %3295 = func.call @cc_condition_value(%3290) : (i64) -> i64
          %3296 = func.call @cc_values2(%3293, %3295) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3296) : (i64) -> ()
        } else {
          %3297 = func.call @cc_multiple_value_list(%3290) : (i64) -> i64
          %3298 = func.call @cc_values_pack(%3297) : (i64) -> i64
          func.call @stack_push_pointer(%3298) : (i64) -> ()
        }
        %3299 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3299 : i64
      }
      %3300 = func.call @cc_nil_value() : () -> i64
      %3301 = func.call @cc_errorp(%3272) : (i64) -> i64
      %3302 = arith.cmpi ne, %3301, %3300 : i64
      %3303 = scf.if %3302 -> (i64) {
        scf.yield %3272 : i64
      } else {
        %3304 = func.call @cc_symbol_value(%3231) : (i64) -> i64
        %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
        %3305 = arith.addi %3304, %__rlasp_stack_elide_zero_236 : i64
        scf.yield %3305 : i64
      }
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %3306 = arith.addi %3303, %__rlasp_stack_elide_zero_237 : i64
      scf.yield %3306 : i64
    }
    func.call @stack_push_pointer(%3198) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_130642754928640*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_130642754928640*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_130642754928640*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("CANCELLATION-INTERRUPT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str8("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str9("CANCELLATION-INTERRUPT-TEST\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str10("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str14("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str15("CANCELLATION-INTERRUPT-TEST\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str16("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("#:%%DYN-CELL-130642754928642-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str18("mp:make-lock\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("CANCELLATION-INTERRUPT-TEST\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str21("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("CORE:CHECK-PENDING-INTERRUPTS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str23("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str24("#:%%DYN-CELL-130642754928644-LOCK0\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str25("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str26("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str27("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str28("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str29("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str32("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str35("HANDLE-INTERRUPT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str36("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str37("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str38("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str40("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str41("HANDLE-INTERRUPT-TEST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str42("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str43("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str45("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str46("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str47("CHECK-PENDING-INTERRUPTS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str48("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str49("CANCELLATION-INTERRUPT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str50("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str51("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str54("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str55("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str56("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str57("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str60("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str61("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str62("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str63("HANDLE-INTERRUPT-TEST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETFLAG_130642754928647*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETVALUE_130642754928647*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETMVLIST_130642754928647*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_130642754928640*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETFLAG_130642754928647*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str69("CORE:CHECK-PENDING-INTERRUPTS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_130642754928647*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETVALUE_130642754928647*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETMVLIST_130642754928647*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str73("CANCELLATION-INTERRUPT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str74("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str75("#:%%DYN-CELL-130642754928648-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str76("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str77("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str78("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str79("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str83("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str84("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str85("CALL-INTERRUPT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str86("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str87("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str88("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str91("CALL-INTERRUPT-TEST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str92("INTERRUPT-PROCESS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str93("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str94("CALL-INTERRUPT-TEST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str95("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str96("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("ATOMIC\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str99("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str100("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str103("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str104("#:%%DYN-CELL-130642754928650-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str105("mp:make-lock\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str106("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("CALL-INTERRUPT-TEST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str108("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("CORE:CHECK-PENDING-INTERRUPTS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str110("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str111("#:%%DYN-CELL-130642754928652-LOCK1\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str112("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str113("mp:interrupt-process\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str114("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str115("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str116("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str117("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str119("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str120("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str121("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str122("SLEEP-INTERRUPTIBLE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str123("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str124("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str125("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("THREAD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str128("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str129("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str130("SLEEP-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str131("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str132("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str134("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("INTERRUPT-PROCESS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str136("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str137("THREAD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str138("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("ATOMIC\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str143("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str146("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str147("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str148("THREAD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str149("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str150("SLEEP-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str151("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str152("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str153("#:%%DYN-CELL-130642754928656-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str154("mp:interrupt-process\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str155("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str156("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str158("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str159("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str160("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str161("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str162("LOCK-INTERRUPTIBLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str163("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str164("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str165("MAKE-LOCK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str166("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str167("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str168("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("WITH-LOCK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str172("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str173("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str174("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str176("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str178("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str179("LOCK-INTERRUPTIBLE-TEST\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str180("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str181("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("WITH-LOCK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str183("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str184("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str185("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str186("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("ATOMIC\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str188("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str189("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str190("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str191("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str193("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str194("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str195("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str196("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str198("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str199("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str200("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str201("mp:make-lock\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str202("#:%%DYN-CELL-130642754928659-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str203("#:%%DYN-CELL-130642754928660-LOCK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str204("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("LOCK-INTERRUPTIBLE-TEST\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str206("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str208("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str209("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str210("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str211("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str212("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str214("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str216("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str217("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str218("INPUT-INTERRUPTIBLE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str219("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str220("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str221("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str222("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str223("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str224("INPUT-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str225("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str226("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str227("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str228("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str229("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str233("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str234("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str238("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str239("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str240("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str241("INPUT-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str242("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str243("#:%%DYN-CELL-130642754928664-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str244("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str245("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str246("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str247("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str249("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str250("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str251("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str252("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str253("*__MLIR_BLOCK_RETFLAG_130642754928640*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str254("*__MLIR_BLOCK_RETMVLIST_130642754928640*\00") : !llvm.array<41 x i8>
}
