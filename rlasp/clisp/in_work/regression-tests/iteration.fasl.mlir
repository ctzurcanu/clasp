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
      %57 = arith.constant 23 : i64
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
      %82 = arith.constant 3 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      %84 = func.call @cc_nil_value() : () -> i64
      %85 = func.call @cc_intern(%83, %84) : (i64, i64) -> i64
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = func.call @cc_cons(%85, %86) : (i64, i64) -> i64
      %88 = func.call @cc_values_pack(%87) : (i64) -> i64
      func.call @stack_push_pointer(%85) : (i64) -> ()
      %89 = llvm.mlir.addressof @str9 : !llvm.ptr
      %90 = arith.constant 8 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = func.call @cc_nil_value() : () -> i64
      %93 = func.call @cc_intern(%91, %92) : (i64, i64) -> i64
      %94 = func.call @cc_nil_value() : () -> i64
      %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
      %96 = func.call @cc_values_pack(%95) : (i64) -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @cc_cons(%98, %97) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %100 = arith.addi %99, %__rlasp_stack_elide_zero_3 : i64
      %101 = func.call @stack_pop_pointer() : () -> i64
      %102 = func.call @cc_cons(%101, %100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%102) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @cc_cons(%104, %103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
      %106 = llvm.mlir.addressof @str10 : !llvm.ptr
      %107 = arith.constant 4 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = llvm.mlir.addressof @str11 : !llvm.ptr
      %110 = arith.constant 11 : i64
      %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
      %112 = func.call @cc_intern(%108, %111) : (i64, i64) -> i64
      %113 = func.call @cc_nil_value() : () -> i64
      %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
      %115 = func.call @cc_values_pack(%114) : (i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %116 = llvm.mlir.addressof @str12 : !llvm.ptr
      %117 = arith.constant 14 : i64
      %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_intern(%118, %119) : (i64, i64) -> i64
      %121 = func.call @cc_nil_value() : () -> i64
      %122 = func.call @cc_cons(%120, %121) : (i64, i64) -> i64
      %123 = func.call @cc_values_pack(%122) : (i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %124 = llvm.mlir.addressof @str13 : !llvm.ptr
      %125 = arith.constant 9 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = llvm.mlir.addressof @str14 : !llvm.ptr
      %128 = arith.constant 11 : i64
      %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
      %130 = func.call @cc_intern(%126, %129) : (i64, i64) -> i64
      %131 = func.call @cc_nil_value() : () -> i64
      %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
      %133 = func.call @cc_values_pack(%132) : (i64) -> i64
      func.call @stack_push_pointer(%130) : (i64) -> ()
      %134 = llvm.mlir.addressof @str15 : !llvm.ptr
      %135 = arith.constant 9 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = llvm.mlir.addressof @str16 : !llvm.ptr
      %138 = arith.constant 11 : i64
      %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
      %140 = func.call @cc_intern(%136, %139) : (i64, i64) -> i64
      %141 = func.call @cc_nil_value() : () -> i64
      %142 = func.call @cc_cons(%140, %141) : (i64, i64) -> i64
      %143 = func.call @cc_values_pack(%142) : (i64) -> i64
      func.call @stack_push_pointer(%140) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_cons(%145, %144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %147 = arith.addi %146, %__rlasp_stack_elide_zero_4 : i64
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @cc_cons(%148, %147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%149) : (i64) -> ()
      %150 = llvm.mlir.addressof @str17 : !llvm.ptr
      %151 = arith.constant 4 : i64
      %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
      %153 = func.call @cc_nil_value() : () -> i64
      %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
      %157 = func.call @cc_values_pack(%156) : (i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      %158 = llvm.mlir.addressof @str18 : !llvm.ptr
      %159 = arith.constant 8 : i64
      %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_intern(%160, %161) : (i64, i64) -> i64
      %163 = func.call @cc_nil_value() : () -> i64
      %164 = func.call @cc_cons(%162, %163) : (i64, i64) -> i64
      %165 = func.call @cc_values_pack(%164) : (i64) -> i64
      func.call @stack_push_pointer(%162) : (i64) -> ()
      %166 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %170 = arith.addi %169, %__rlasp_stack_elide_zero_5 : i64
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_cons(%171, %170) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %173 = arith.addi %172, %__rlasp_stack_elide_zero_6 : i64
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_cons(%174, %173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %176 = llvm.mlir.addressof @str19 : !llvm.ptr
      %177 = arith.constant 14 : i64
      %178 = func.call @cc_make_string(%176, %177) : (!llvm.ptr, i64) -> i64
      %179 = llvm.mlir.addressof @str20 : !llvm.ptr
      %180 = arith.constant 11 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = func.call @cc_intern(%178, %181) : (i64, i64) -> i64
      %183 = func.call @cc_nil_value() : () -> i64
      %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
      %185 = func.call @cc_values_pack(%184) : (i64) -> i64
      func.call @stack_push_pointer(%182) : (i64) -> ()
      %186 = llvm.mlir.addressof @str21 : !llvm.ptr
      %187 = arith.constant 9 : i64
      %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
      %189 = llvm.mlir.addressof @str22 : !llvm.ptr
      %190 = arith.constant 11 : i64
      %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
      %192 = func.call @cc_intern(%188, %191) : (i64, i64) -> i64
      %193 = func.call @cc_nil_value() : () -> i64
      %194 = func.call @cc_cons(%192, %193) : (i64, i64) -> i64
      %195 = func.call @cc_values_pack(%194) : (i64) -> i64
      func.call @stack_push_pointer(%192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %196 = func.call @stack_pop_pointer() : () -> i64
      %197 = func.call @stack_pop_pointer() : () -> i64
      %198 = func.call @cc_cons(%197, %196) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %199 = arith.addi %198, %__rlasp_stack_elide_zero_7 : i64
      %200 = func.call @stack_pop_pointer() : () -> i64
      %201 = func.call @cc_cons(%200, %199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @stack_pop_pointer() : () -> i64
      %204 = func.call @cc_cons(%203, %202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %205 = arith.addi %204, %__rlasp_stack_elide_zero_8 : i64
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @cc_cons(%206, %205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %208 = arith.addi %207, %__rlasp_stack_elide_zero_9 : i64
      %209 = func.call @stack_pop_pointer() : () -> i64
      %210 = func.call @cc_cons(%209, %208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %211 = arith.addi %210, %__rlasp_stack_elide_zero_10 : i64
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @cc_cons(%212, %211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%213) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %214 = func.call @stack_pop_pointer() : () -> i64
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = func.call @cc_cons(%215, %214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      %217 = llvm.mlir.addressof @str23 : !llvm.ptr
      %218 = arith.constant 12 : i64
      %219 = func.call @cc_make_string(%217, %218) : (!llvm.ptr, i64) -> i64
      %220 = llvm.mlir.addressof @str24 : !llvm.ptr
      %221 = arith.constant 11 : i64
      %222 = func.call @cc_make_string(%220, %221) : (!llvm.ptr, i64) -> i64
      %223 = func.call @cc_intern(%219, %222) : (i64, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_cons(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_values_pack(%225) : (i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %227 = llvm.mlir.addressof @str25 : !llvm.ptr
      %228 = arith.constant 7 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = llvm.mlir.addressof @str26 : !llvm.ptr
      %231 = arith.constant 11 : i64
      %232 = func.call @cc_make_string(%230, %231) : (!llvm.ptr, i64) -> i64
      %233 = func.call @cc_intern(%229, %232) : (i64, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_cons(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_values_pack(%235) : (i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      %237 = llvm.mlir.addressof @str27 : !llvm.ptr
      %238 = arith.constant 8 : i64
      %239 = func.call @cc_make_string(%237, %238) : (!llvm.ptr, i64) -> i64
      %240 = llvm.mlir.addressof @str28 : !llvm.ptr
      %241 = arith.constant 11 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = func.call @cc_intern(%239, %242) : (i64, i64) -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_values_pack(%245) : (i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      %247 = llvm.mlir.addressof @str29 : !llvm.ptr
      %248 = arith.constant 14 : i64
      %249 = func.call @cc_make_string(%247, %248) : (!llvm.ptr, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_intern(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_nil_value() : () -> i64
      %253 = func.call @cc_cons(%251, %252) : (i64, i64) -> i64
      %254 = func.call @cc_values_pack(%253) : (i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %255 = func.call @stack_pop_pointer() : () -> i64
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @cc_cons(%256, %255) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %258 = arith.addi %257, %__rlasp_stack_elide_zero_11 : i64
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @cc_cons(%259, %258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %261 = func.call @stack_pop_pointer() : () -> i64
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_cons(%262, %261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %264 = arith.addi %263, %__rlasp_stack_elide_zero_12 : i64
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @cc_cons(%265, %264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @cc_cons(%268, %267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %270 = llvm.mlir.addressof @str30 : !llvm.ptr
      %271 = arith.constant 7 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = llvm.mlir.addressof @str31 : !llvm.ptr
      %274 = arith.constant 11 : i64
      %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
      %276 = func.call @cc_intern(%272, %275) : (i64, i64) -> i64
      %277 = func.call @cc_nil_value() : () -> i64
      %278 = func.call @cc_cons(%276, %277) : (i64, i64) -> i64
      %279 = func.call @cc_values_pack(%278) : (i64) -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %280 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%280) : (i64) -> ()
      %281 = llvm.mlir.addressof @str32 : !llvm.ptr
      %282 = arith.constant 6 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = llvm.mlir.addressof @str33 : !llvm.ptr
      %285 = arith.constant 11 : i64
      %286 = func.call @cc_make_string(%284, %285) : (!llvm.ptr, i64) -> i64
      %287 = func.call @cc_intern(%283, %286) : (i64, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_values_pack(%289) : (i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %291 = llvm.mlir.addressof @str34 : !llvm.ptr
      %292 = arith.constant 3 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = llvm.mlir.addressof @str35 : !llvm.ptr
      %295 = arith.constant 11 : i64
      %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
      %297 = func.call @cc_intern(%293, %296) : (i64, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_values_pack(%299) : (i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %301 = llvm.mlir.addressof @str36 : !llvm.ptr
      %302 = arith.constant 3 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = func.call @cc_intern(%303, %304) : (i64, i64) -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_cons(%305, %306) : (i64, i64) -> i64
      %308 = func.call @cc_values_pack(%307) : (i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %309 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%309) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %310 = func.call @stack_pop_pointer() : () -> i64
      %311 = func.call @stack_pop_pointer() : () -> i64
      %312 = func.call @cc_cons(%311, %310) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %313 = arith.addi %312, %__rlasp_stack_elide_zero_13 : i64
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @cc_cons(%314, %313) : (i64, i64) -> i64
      func.call @stack_push_pointer(%315) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %316 = func.call @stack_pop_pointer() : () -> i64
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @cc_cons(%317, %316) : (i64, i64) -> i64
      func.call @stack_push_pointer(%318) : (i64) -> ()
      %319 = llvm.mlir.addressof @str37 : !llvm.ptr
      %320 = arith.constant 6 : i64
      %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
      %322 = llvm.mlir.addressof @str38 : !llvm.ptr
      %323 = arith.constant 11 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      %325 = func.call @cc_intern(%321, %324) : (i64, i64) -> i64
      %326 = func.call @cc_nil_value() : () -> i64
      %327 = func.call @cc_cons(%325, %326) : (i64, i64) -> i64
      %328 = func.call @cc_values_pack(%327) : (i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %329 = llvm.mlir.addressof @str39 : !llvm.ptr
      %330 = arith.constant 1 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = func.call @cc_nil_value() : () -> i64
      %333 = func.call @cc_intern(%331, %332) : (i64, i64) -> i64
      %334 = func.call @cc_nil_value() : () -> i64
      %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
      %336 = func.call @cc_values_pack(%335) : (i64) -> i64
      func.call @stack_push_pointer(%333) : (i64) -> ()
      %337 = llvm.mlir.addressof @str40 : !llvm.ptr
      %338 = arith.constant 4 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = llvm.mlir.addressof @str41 : !llvm.ptr
      %341 = arith.constant 11 : i64
      %342 = func.call @cc_make_string(%340, %341) : (!llvm.ptr, i64) -> i64
      %343 = func.call @cc_intern(%339, %342) : (i64, i64) -> i64
      %344 = func.call @cc_nil_value() : () -> i64
      %345 = func.call @cc_cons(%343, %344) : (i64, i64) -> i64
      %346 = func.call @cc_values_pack(%345) : (i64) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %347 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%347) : (i64) -> ()
      %348 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%348) : (i64) -> ()
      %349 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%349) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %350 = func.call @stack_pop_pointer() : () -> i64
      %351 = func.call @stack_pop_pointer() : () -> i64
      %352 = func.call @cc_cons(%351, %350) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %353 = arith.addi %352, %__rlasp_stack_elide_zero_14 : i64
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_cons(%354, %353) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %356 = arith.addi %355, %__rlasp_stack_elide_zero_15 : i64
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @cc_cons(%357, %356) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %359 = arith.addi %358, %__rlasp_stack_elide_zero_16 : i64
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @cc_cons(%360, %359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%361) : (i64) -> ()
      %362 = llvm.mlir.addressof @str42 : !llvm.ptr
      %363 = arith.constant 3 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_intern(%364, %365) : (i64, i64) -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_cons(%366, %367) : (i64, i64) -> i64
      %369 = func.call @cc_values_pack(%368) : (i64) -> i64
      func.call @stack_push_pointer(%366) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @cc_cons(%371, %370) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %373 = arith.addi %372, %__rlasp_stack_elide_zero_17 : i64
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @cc_cons(%374, %373) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %376 = arith.addi %375, %__rlasp_stack_elide_zero_18 : i64
      %377 = func.call @stack_pop_pointer() : () -> i64
      %378 = func.call @cc_cons(%377, %376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%378) : (i64) -> ()
      %379 = llvm.mlir.addressof @str43 : !llvm.ptr
      %380 = arith.constant 7 : i64
      %381 = func.call @cc_make_string(%379, %380) : (!llvm.ptr, i64) -> i64
      %382 = llvm.mlir.addressof @str44 : !llvm.ptr
      %383 = arith.constant 11 : i64
      %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
      %385 = func.call @cc_intern(%381, %384) : (i64, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_cons(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_values_pack(%387) : (i64) -> i64
      func.call @stack_push_pointer(%385) : (i64) -> ()
      %389 = llvm.mlir.addressof @str45 : !llvm.ptr
      %390 = arith.constant 4 : i64
      %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
      %392 = llvm.mlir.addressof @str46 : !llvm.ptr
      %393 = arith.constant 11 : i64
      %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
      %395 = func.call @cc_intern(%391, %394) : (i64, i64) -> i64
      %396 = func.call @cc_nil_value() : () -> i64
      %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
      %398 = func.call @cc_values_pack(%397) : (i64) -> i64
      func.call @stack_push_pointer(%395) : (i64) -> ()
      %399 = llvm.mlir.addressof @str47 : !llvm.ptr
      %400 = arith.constant 6 : i64
      %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
      %402 = llvm.mlir.addressof @str48 : !llvm.ptr
      %403 = arith.constant 11 : i64
      %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
      %405 = func.call @cc_intern(%401, %404) : (i64, i64) -> i64
      %406 = func.call @cc_nil_value() : () -> i64
      %407 = func.call @cc_cons(%405, %406) : (i64, i64) -> i64
      %408 = func.call @cc_values_pack(%407) : (i64) -> i64
      func.call @stack_push_pointer(%405) : (i64) -> ()
      %409 = llvm.mlir.addressof @str49 : !llvm.ptr
      %410 = arith.constant 1 : i64
      %411 = func.call @cc_make_string(%409, %410) : (!llvm.ptr, i64) -> i64
      %412 = func.call @cc_nil_value() : () -> i64
      %413 = func.call @cc_intern(%411, %412) : (i64, i64) -> i64
      %414 = func.call @cc_nil_value() : () -> i64
      %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
      %416 = func.call @cc_values_pack(%415) : (i64) -> i64
      func.call @stack_push_pointer(%413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = func.call @cc_cons(%418, %417) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %420 = arith.addi %419, %__rlasp_stack_elide_zero_19 : i64
      %421 = func.call @stack_pop_pointer() : () -> i64
      %422 = func.call @cc_cons(%421, %420) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %423 = arith.addi %422, %__rlasp_stack_elide_zero_20 : i64
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @cc_cons(%424, %423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%427, %426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %429 = arith.addi %428, %__rlasp_stack_elide_zero_21 : i64
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @cc_cons(%430, %429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %432 = llvm.mlir.addressof @str50 : !llvm.ptr
      %433 = arith.constant 4 : i64
      %434 = func.call @cc_make_string(%432, %433) : (!llvm.ptr, i64) -> i64
      %435 = llvm.mlir.addressof @str51 : !llvm.ptr
      %436 = arith.constant 11 : i64
      %437 = func.call @cc_make_string(%435, %436) : (!llvm.ptr, i64) -> i64
      %438 = func.call @cc_intern(%434, %437) : (i64, i64) -> i64
      %439 = func.call @cc_nil_value() : () -> i64
      %440 = func.call @cc_cons(%438, %439) : (i64, i64) -> i64
      %441 = func.call @cc_values_pack(%440) : (i64) -> i64
      func.call @stack_push_pointer(%438) : (i64) -> ()
      %442 = llvm.mlir.addressof @str52 : !llvm.ptr
      %443 = arith.constant 3 : i64
      %444 = func.call @cc_make_string(%442, %443) : (!llvm.ptr, i64) -> i64
      %445 = func.call @cc_nil_value() : () -> i64
      %446 = func.call @cc_intern(%444, %445) : (i64, i64) -> i64
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_cons(%446, %447) : (i64, i64) -> i64
      %449 = func.call @cc_values_pack(%448) : (i64) -> i64
      func.call @stack_push_pointer(%446) : (i64) -> ()
      %450 = llvm.mlir.addressof @str53 : !llvm.ptr
      %451 = arith.constant 1 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      %453 = func.call @cc_nil_value() : () -> i64
      %454 = func.call @cc_intern(%452, %453) : (i64, i64) -> i64
      %455 = func.call @cc_nil_value() : () -> i64
      %456 = func.call @cc_cons(%454, %455) : (i64, i64) -> i64
      %457 = func.call @cc_values_pack(%456) : (i64) -> i64
      func.call @stack_push_pointer(%454) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %458 = func.call @stack_pop_pointer() : () -> i64
      %459 = func.call @stack_pop_pointer() : () -> i64
      %460 = func.call @cc_cons(%459, %458) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %461 = arith.addi %460, %__rlasp_stack_elide_zero_22 : i64
      %462 = func.call @stack_pop_pointer() : () -> i64
      %463 = func.call @cc_cons(%462, %461) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %464 = arith.addi %463, %__rlasp_stack_elide_zero_23 : i64
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = func.call @cc_cons(%465, %464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%466) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @stack_pop_pointer() : () -> i64
      %469 = func.call @cc_cons(%468, %467) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %470 = arith.addi %469, %__rlasp_stack_elide_zero_24 : i64
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = func.call @cc_cons(%471, %470) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %473 = arith.addi %472, %__rlasp_stack_elide_zero_25 : i64
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @cc_cons(%474, %473) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %476 = arith.addi %475, %__rlasp_stack_elide_zero_26 : i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_cons(%477, %476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @stack_pop_pointer() : () -> i64
      %481 = func.call @cc_cons(%480, %479) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %482 = arith.addi %481, %__rlasp_stack_elide_zero_27 : i64
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = func.call @cc_cons(%483, %482) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %485 = arith.addi %484, %__rlasp_stack_elide_zero_28 : i64
      %486 = func.call @stack_pop_pointer() : () -> i64
      %487 = func.call @cc_cons(%486, %485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%487) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @cc_cons(%489, %488) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %491 = arith.addi %490, %__rlasp_stack_elide_zero_29 : i64
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @cc_cons(%492, %491) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %494 = arith.addi %493, %__rlasp_stack_elide_zero_30 : i64
      %495 = func.call @stack_pop_pointer() : () -> i64
      %496 = func.call @cc_cons(%495, %494) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %497 = arith.addi %496, %__rlasp_stack_elide_zero_31 : i64
      %498 = func.call @stack_pop_pointer() : () -> i64
      %499 = func.call @cc_cons(%497, %498) : (i64, i64) -> i64
      %500 = llvm.mlir.addressof @str54 : !llvm.ptr
      %501 = arith.constant 5 : i64
      %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
      %503 = func.call @cc_nil_value() : () -> i64
      %504 = func.call @cc_intern(%502, %503) : (i64, i64) -> i64
      %505 = func.call @cc_nil_value() : () -> i64
      %506 = func.call @cc_cons(%504, %505) : (i64, i64) -> i64
      %507 = func.call @cc_values_pack(%506) : (i64) -> i64
      %508 = func.call @cc_cons(%504, %499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%508) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %509 = func.call @stack_pop_pointer() : () -> i64
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = func.call @cc_cons(%510, %509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %512 = arith.addi %511, %__rlasp_stack_elide_zero_32 : i64
      %513 = func.call @stack_pop_pointer() : () -> i64
      %514 = func.call @cc_cons(%513, %512) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %515 = arith.addi %514, %__rlasp_stack_elide_zero_33 : i64
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = func.call @cc_cons(%516, %515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = func.call @stack_pop_pointer() : () -> i64
      %520 = func.call @cc_cons(%519, %518) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %521 = arith.addi %520, %__rlasp_stack_elide_zero_34 : i64
      %522 = func.call @stack_pop_pointer() : () -> i64
      %523 = func.call @cc_cons(%522, %521) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %524 = arith.addi %523, %__rlasp_stack_elide_zero_35 : i64
      %525 = func.call @stack_pop_pointer() : () -> i64
      %526 = func.call @cc_cons(%525, %524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%526) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @cc_cons(%528, %527) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %530 = arith.addi %529, %__rlasp_stack_elide_zero_36 : i64
      %531 = func.call @stack_pop_pointer() : () -> i64
      %532 = func.call @cc_cons(%531, %530) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %533 = arith.addi %532, %__rlasp_stack_elide_zero_37 : i64
      %534 = func.call @stack_pop_pointer() : () -> i64
      %535 = func.call @cc_cons(%534, %533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%535) : (i64) -> ()
      %536 = llvm.mlir.addressof @str55 : !llvm.ptr
      %537 = arith.constant 3 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = llvm.mlir.addressof @str56 : !llvm.ptr
      %540 = arith.constant 11 : i64
      %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
      %542 = func.call @cc_intern(%538, %541) : (i64, i64) -> i64
      %543 = func.call @cc_nil_value() : () -> i64
      %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
      %545 = func.call @cc_values_pack(%544) : (i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %546 = llvm.mlir.addressof @str57 : !llvm.ptr
      %547 = arith.constant 8 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_intern(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
      %553 = func.call @cc_values_pack(%552) : (i64) -> i64
      func.call @stack_push_pointer(%550) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = func.call @cc_cons(%555, %554) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %557 = arith.addi %556, %__rlasp_stack_elide_zero_38 : i64
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @cc_cons(%558, %557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @cc_cons(%561, %560) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %563 = arith.addi %562, %__rlasp_stack_elide_zero_39 : i64
      %564 = func.call @stack_pop_pointer() : () -> i64
      %565 = func.call @cc_cons(%564, %563) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %566 = arith.addi %565, %__rlasp_stack_elide_zero_40 : i64
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @cc_cons(%567, %566) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %569 = arith.addi %568, %__rlasp_stack_elide_zero_41 : i64
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @cc_cons(%570, %569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @stack_pop_pointer() : () -> i64
      %574 = func.call @cc_cons(%573, %572) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %575 = arith.addi %574, %__rlasp_stack_elide_zero_42 : i64
      %576 = func.call @stack_pop_pointer() : () -> i64
      %577 = func.call @cc_cons(%576, %575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = func.call @cc_cons(%579, %578) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %581 = arith.addi %580, %__rlasp_stack_elide_zero_43 : i64
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @cc_cons(%582, %581) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %584 = arith.addi %583, %__rlasp_stack_elide_zero_44 : i64
      %819 = arith.constant 210468094345217 : i64
      %820 = arith.constant 0 : i64
      %821 = func.call @cc_make_closure(%819, %820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %822 = arith.addi %821, %__rlasp_stack_elide_zero_45 : i64
      %823 = llvm.mlir.addressof @str67 : !llvm.ptr
      %824 = arith.constant 1 : i64
      %825 = func.call @cc_make_string(%823, %824) : (!llvm.ptr, i64) -> i64
      %826 = func.call @cc_nil_value() : () -> i64
      %827 = func.call @cc_intern(%825, %826) : (i64, i64) -> i64
      %828 = func.call @cc_nil_value() : () -> i64
      %829 = func.call @cc_cons(%827, %828) : (i64, i64) -> i64
      %830 = func.call @cc_values_pack(%829) : (i64) -> i64
      func.call @stack_push_pointer(%827) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @stack_pop_pointer() : () -> i64
      %833 = func.call @cc_cons(%832, %831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %834 = arith.addi %833, %__rlasp_stack_elide_zero_46 : i64
      %835 = llvm.mlir.addressof @str68 : !llvm.ptr
      %836 = arith.constant 11 : i64
      %837 = func.call @cc_make_string(%835, %836) : (!llvm.ptr, i64) -> i64
      %838 = llvm.mlir.addressof @str69 : !llvm.ptr
      %839 = arith.constant 7 : i64
      %840 = func.call @cc_make_string(%838, %839) : (!llvm.ptr, i64) -> i64
      %841 = func.call @cc_intern(%837, %840) : (i64, i64) -> i64
      %842 = func.call @cc_nil_value() : () -> i64
      %843 = func.call @cc_cons(%841, %842) : (i64, i64) -> i64
      %844 = func.call @cc_values_pack(%843) : (i64) -> i64
      %845 = func.call @cc_nil_value() : () -> i64
      %846 = llvm.mlir.addressof @str70 : !llvm.ptr
      %847 = arith.constant 4 : i64
      %848 = func.call @cc_make_string(%846, %847) : (!llvm.ptr, i64) -> i64
      %849 = llvm.mlir.addressof @str71 : !llvm.ptr
      %850 = arith.constant 7 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = func.call @cc_intern(%848, %851) : (i64, i64) -> i64
      %853 = func.call @cc_nil_value() : () -> i64
      %854 = func.call @cc_cons(%852, %853) : (i64, i64) -> i64
      %855 = func.call @cc_values_pack(%854) : (i64) -> i64
      %856 = llvm.mlir.addressof @str72 : !llvm.ptr
      %857 = arith.constant 6 : i64
      %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
      %859 = func.call @cc_nil_value() : () -> i64
      %860 = func.call @cc_intern(%858, %859) : (i64, i64) -> i64
      %861 = func.call @cc_nil_value() : () -> i64
      %862 = func.call @cc_cons(%860, %861) : (i64, i64) -> i64
      %863 = func.call @cc_values_pack(%862) : (i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %864 = arith.addi %860, %__rlasp_stack_elide_zero_47 : i64
      %865 = func.call @cc_nil_value() : () -> i64
      %866 = func.call @cc_errorp(%64) : (i64) -> i64
      %867 = arith.cmpi ne, %866, %865 : i64
      %868 = arith.cmpi eq, %865, %865 : i64
      %869 = arith.andi %867, %868 : i1
      %870 = scf.if %869 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %865 : i64
      }
      %871 = func.call @cc_errorp(%584) : (i64) -> i64
      %872 = arith.cmpi ne, %871, %865 : i64
      %873 = arith.cmpi eq, %870, %865 : i64
      %874 = arith.andi %872, %873 : i1
      %875 = scf.if %874 -> (i64) {
        scf.yield %584 : i64
      } else {
        scf.yield %870 : i64
      }
      %876 = func.call @cc_errorp(%822) : (i64) -> i64
      %877 = arith.cmpi ne, %876, %865 : i64
      %878 = arith.cmpi eq, %875, %865 : i64
      %879 = arith.andi %877, %878 : i1
      %880 = scf.if %879 -> (i64) {
        scf.yield %822 : i64
      } else {
        scf.yield %875 : i64
      }
      %881 = func.call @cc_errorp(%834) : (i64) -> i64
      %882 = arith.cmpi ne, %881, %865 : i64
      %883 = arith.cmpi eq, %880, %865 : i64
      %884 = arith.andi %882, %883 : i1
      %885 = scf.if %884 -> (i64) {
        scf.yield %834 : i64
      } else {
        scf.yield %880 : i64
      }
      %886 = func.call @cc_errorp(%841) : (i64) -> i64
      %887 = arith.cmpi ne, %886, %865 : i64
      %888 = arith.cmpi eq, %885, %865 : i64
      %889 = arith.andi %887, %888 : i1
      %890 = scf.if %889 -> (i64) {
        scf.yield %841 : i64
      } else {
        scf.yield %885 : i64
      }
      %891 = func.call @cc_errorp(%845) : (i64) -> i64
      %892 = arith.cmpi ne, %891, %865 : i64
      %893 = arith.cmpi eq, %890, %865 : i64
      %894 = arith.andi %892, %893 : i1
      %895 = scf.if %894 -> (i64) {
        scf.yield %845 : i64
      } else {
        scf.yield %890 : i64
      }
      %896 = func.call @cc_errorp(%852) : (i64) -> i64
      %897 = arith.cmpi ne, %896, %865 : i64
      %898 = arith.cmpi eq, %895, %865 : i64
      %899 = arith.andi %897, %898 : i1
      %900 = scf.if %899 -> (i64) {
        scf.yield %852 : i64
      } else {
        scf.yield %895 : i64
      }
      %901 = func.call @cc_errorp(%864) : (i64) -> i64
      %902 = arith.cmpi ne, %901, %865 : i64
      %903 = arith.cmpi eq, %900, %865 : i64
      %904 = arith.andi %902, %903 : i1
      %905 = scf.if %904 -> (i64) {
        scf.yield %864 : i64
      } else {
        scf.yield %900 : i64
      }
      %906 = arith.cmpi ne, %905, %865 : i64
      scf.if %906 {
        func.call @stack_push_pointer(%905) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%584) : (i64) -> ()
        func.call @stack_push_pointer(%822) : (i64) -> ()
        func.call @stack_push_pointer(%834) : (i64) -> ()
        func.call @stack_push_pointer(%841) : (i64) -> ()
        func.call @stack_push_pointer(%845) : (i64) -> ()
        func.call @stack_push_pointer(%852) : (i64) -> ()
        func.call @stack_push_pointer(%864) : (i64) -> ()
        %907 = llvm.mlir.addressof @str73 : !llvm.ptr
        %908 = func.call @cc_make_function_ref_const(%907) : (!llvm.ptr) -> i64
        %909 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%908, %909) : (i64, i64) -> ()
      }
      %910 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %910 : i64
    }
    %911 = func.call @cc_nil_value() : () -> i64
    %912 = func.call @cc_errorp(%55) : (i64) -> i64
    %913 = arith.cmpi ne, %912, %911 : i64
    %914 = scf.if %913 -> (i64) {
      scf.yield %55 : i64
    } else {
      %915 = llvm.mlir.addressof @str74 : !llvm.ptr
      %916 = arith.constant 24 : i64
      %917 = func.call @cc_make_string(%915, %916) : (!llvm.ptr, i64) -> i64
      %918 = func.call @cc_nil_value() : () -> i64
      %919 = func.call @cc_intern(%917, %918) : (i64, i64) -> i64
      %920 = func.call @cc_nil_value() : () -> i64
      %921 = func.call @cc_cons(%919, %920) : (i64, i64) -> i64
      %922 = func.call @cc_values_pack(%921) : (i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %923 = arith.addi %919, %__rlasp_stack_elide_zero_48 : i64
      %924 = llvm.mlir.addressof @str75 : !llvm.ptr
      %925 = arith.constant 3 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = func.call @cc_nil_value() : () -> i64
      %928 = func.call @cc_intern(%926, %927) : (i64, i64) -> i64
      %929 = func.call @cc_nil_value() : () -> i64
      %930 = func.call @cc_cons(%928, %929) : (i64, i64) -> i64
      %931 = func.call @cc_values_pack(%930) : (i64) -> i64
      func.call @stack_push_pointer(%928) : (i64) -> ()
      %932 = llvm.mlir.addressof @str76 : !llvm.ptr
      %933 = arith.constant 3 : i64
      %934 = func.call @cc_make_string(%932, %933) : (!llvm.ptr, i64) -> i64
      %935 = func.call @cc_nil_value() : () -> i64
      %936 = func.call @cc_intern(%934, %935) : (i64, i64) -> i64
      %937 = func.call @cc_nil_value() : () -> i64
      %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
      %939 = func.call @cc_values_pack(%938) : (i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      %940 = llvm.mlir.addressof @str77 : !llvm.ptr
      %941 = arith.constant 3 : i64
      %942 = func.call @cc_make_string(%940, %941) : (!llvm.ptr, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_intern(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_cons(%944, %945) : (i64, i64) -> i64
      %947 = func.call @cc_values_pack(%946) : (i64) -> i64
      func.call @stack_push_pointer(%944) : (i64) -> ()
      %948 = llvm.mlir.addressof @str78 : !llvm.ptr
      %949 = arith.constant 3 : i64
      %950 = func.call @cc_make_string(%948, %949) : (!llvm.ptr, i64) -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_intern(%950, %951) : (i64, i64) -> i64
      %953 = func.call @cc_nil_value() : () -> i64
      %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
      %955 = func.call @cc_values_pack(%954) : (i64) -> i64
      func.call @stack_push_pointer(%952) : (i64) -> ()
      %956 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%956) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @stack_pop_pointer() : () -> i64
      %959 = func.call @cc_cons(%958, %957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %960 = arith.addi %959, %__rlasp_stack_elide_zero_49 : i64
      %961 = func.call @stack_pop_pointer() : () -> i64
      %962 = func.call @cc_cons(%961, %960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%962) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %963 = func.call @stack_pop_pointer() : () -> i64
      %964 = func.call @stack_pop_pointer() : () -> i64
      %965 = func.call @cc_cons(%964, %963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%965) : (i64) -> ()
      %966 = llvm.mlir.addressof @str79 : !llvm.ptr
      %967 = arith.constant 4 : i64
      %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
      %969 = llvm.mlir.addressof @str80 : !llvm.ptr
      %970 = arith.constant 11 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = func.call @cc_intern(%968, %971) : (i64, i64) -> i64
      %973 = func.call @cc_nil_value() : () -> i64
      %974 = func.call @cc_cons(%972, %973) : (i64, i64) -> i64
      %975 = func.call @cc_values_pack(%974) : (i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %976 = llvm.mlir.addressof @str81 : !llvm.ptr
      %977 = arith.constant 6 : i64
      %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
      %979 = func.call @cc_nil_value() : () -> i64
      %980 = func.call @cc_intern(%978, %979) : (i64, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_values_pack(%982) : (i64) -> i64
      func.call @stack_push_pointer(%980) : (i64) -> ()
      %984 = llvm.mlir.addressof @str82 : !llvm.ptr
      %985 = arith.constant 1 : i64
      %986 = func.call @cc_make_string(%984, %985) : (!llvm.ptr, i64) -> i64
      %987 = func.call @cc_nil_value() : () -> i64
      %988 = func.call @cc_intern(%986, %987) : (i64, i64) -> i64
      %989 = func.call @cc_nil_value() : () -> i64
      %990 = func.call @cc_cons(%988, %989) : (i64, i64) -> i64
      %991 = func.call @cc_values_pack(%990) : (i64) -> i64
      func.call @stack_push_pointer(%988) : (i64) -> ()
      %992 = llvm.mlir.addressof @str83 : !llvm.ptr
      %993 = arith.constant 4 : i64
      %994 = func.call @cc_make_string(%992, %993) : (!llvm.ptr, i64) -> i64
      %995 = llvm.mlir.addressof @str84 : !llvm.ptr
      %996 = arith.constant 11 : i64
      %997 = func.call @cc_make_string(%995, %996) : (!llvm.ptr, i64) -> i64
      %998 = func.call @cc_intern(%994, %997) : (i64, i64) -> i64
      %999 = func.call @cc_nil_value() : () -> i64
      %1000 = func.call @cc_cons(%998, %999) : (i64, i64) -> i64
      %1001 = func.call @cc_values_pack(%1000) : (i64) -> i64
      func.call @stack_push_pointer(%998) : (i64) -> ()
      %1002 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1002) : (i64) -> ()
      %1003 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1003) : (i64) -> ()
      %1004 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1004) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @stack_pop_pointer() : () -> i64
      %1007 = func.call @cc_cons(%1006, %1005) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1008 = arith.addi %1007, %__rlasp_stack_elide_zero_50 : i64
      %1009 = func.call @stack_pop_pointer() : () -> i64
      %1010 = func.call @cc_cons(%1009, %1008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1011 = arith.addi %1010, %__rlasp_stack_elide_zero_51 : i64
      %1012 = func.call @stack_pop_pointer() : () -> i64
      %1013 = func.call @cc_cons(%1012, %1011) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1014 = arith.addi %1013, %__rlasp_stack_elide_zero_52 : i64
      %1015 = func.call @stack_pop_pointer() : () -> i64
      %1016 = func.call @cc_cons(%1015, %1014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      %1017 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1018 = arith.constant 1 : i64
      %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_intern(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_nil_value() : () -> i64
      %1023 = func.call @cc_cons(%1021, %1022) : (i64, i64) -> i64
      %1024 = func.call @cc_values_pack(%1023) : (i64) -> i64
      func.call @stack_push_pointer(%1021) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @cc_cons(%1026, %1025) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1028 = arith.addi %1027, %__rlasp_stack_elide_zero_53 : i64
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @cc_cons(%1029, %1028) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1031 = arith.addi %1030, %__rlasp_stack_elide_zero_54 : i64
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_cons(%1032, %1031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1034 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1035 = arith.constant 4 : i64
      %1036 = func.call @cc_make_string(%1034, %1035) : (!llvm.ptr, i64) -> i64
      %1037 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1038 = arith.constant 11 : i64
      %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
      %1040 = func.call @cc_intern(%1036, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_nil_value() : () -> i64
      %1042 = func.call @cc_cons(%1040, %1041) : (i64, i64) -> i64
      %1043 = func.call @cc_values_pack(%1042) : (i64) -> i64
      func.call @stack_push_pointer(%1040) : (i64) -> ()
      %1044 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1045 = arith.constant 3 : i64
      %1046 = func.call @cc_make_string(%1044, %1045) : (!llvm.ptr, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_intern(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_nil_value() : () -> i64
      %1050 = func.call @cc_cons(%1048, %1049) : (i64, i64) -> i64
      %1051 = func.call @cc_values_pack(%1050) : (i64) -> i64
      func.call @stack_push_pointer(%1048) : (i64) -> ()
      %1052 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1053 = arith.constant 1 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      %1055 = func.call @cc_nil_value() : () -> i64
      %1056 = func.call @cc_intern(%1054, %1055) : (i64, i64) -> i64
      %1057 = func.call @cc_nil_value() : () -> i64
      %1058 = func.call @cc_cons(%1056, %1057) : (i64, i64) -> i64
      %1059 = func.call @cc_values_pack(%1058) : (i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @cc_cons(%1061, %1060) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1063 = arith.addi %1062, %__rlasp_stack_elide_zero_55 : i64
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @cc_cons(%1064, %1063) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1066 = arith.addi %1065, %__rlasp_stack_elide_zero_56 : i64
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @cc_cons(%1067, %1066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1068) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @cc_cons(%1070, %1069) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1072 = arith.addi %1071, %__rlasp_stack_elide_zero_57 : i64
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = func.call @cc_cons(%1073, %1072) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1075 = arith.addi %1074, %__rlasp_stack_elide_zero_58 : i64
      %1076 = func.call @stack_pop_pointer() : () -> i64
      %1077 = func.call @cc_cons(%1076, %1075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1077) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1078 = func.call @stack_pop_pointer() : () -> i64
      %1079 = func.call @stack_pop_pointer() : () -> i64
      %1080 = func.call @cc_cons(%1079, %1078) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1081 = arith.addi %1080, %__rlasp_stack_elide_zero_59 : i64
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = func.call @cc_cons(%1082, %1081) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1084 = func.call @stack_pop_pointer() : () -> i64
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @cc_cons(%1085, %1084) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1087 = arith.addi %1086, %__rlasp_stack_elide_zero_60 : i64
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @cc_cons(%1088, %1087) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1090 = arith.addi %1089, %__rlasp_stack_elide_zero_61 : i64
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @cc_cons(%1091, %1090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @cc_cons(%1094, %1093) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1096 = arith.addi %1095, %__rlasp_stack_elide_zero_62 : i64
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_cons(%1097, %1096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1099 = func.call @stack_pop_pointer() : () -> i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1100, %1099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1102 = arith.addi %1101, %__rlasp_stack_elide_zero_63 : i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1103, %1102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1105 = arith.addi %1104, %__rlasp_stack_elide_zero_64 : i64
      %1206 = arith.constant 210468094345224 : i64
      %1207 = arith.constant 0 : i64
      %1208 = func.call @cc_make_closure(%1206, %1207) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1209 = arith.addi %1208, %__rlasp_stack_elide_zero_65 : i64
      %1210 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1211 = arith.constant 1 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = func.call @cc_nil_value() : () -> i64
      %1214 = func.call @cc_intern(%1212, %1213) : (i64, i64) -> i64
      %1215 = func.call @cc_nil_value() : () -> i64
      %1216 = func.call @cc_cons(%1214, %1215) : (i64, i64) -> i64
      %1217 = func.call @cc_values_pack(%1216) : (i64) -> i64
      func.call @stack_push_pointer(%1214) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1218 = func.call @stack_pop_pointer() : () -> i64
      %1219 = func.call @stack_pop_pointer() : () -> i64
      %1220 = func.call @cc_cons(%1219, %1218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1221 = arith.addi %1220, %__rlasp_stack_elide_zero_66 : i64
      %1222 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1223 = arith.constant 11 : i64
      %1224 = func.call @cc_make_string(%1222, %1223) : (!llvm.ptr, i64) -> i64
      %1225 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1226 = arith.constant 7 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = func.call @cc_intern(%1224, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_cons(%1228, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_values_pack(%1230) : (i64) -> i64
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1234 = arith.constant 4 : i64
      %1235 = func.call @cc_make_string(%1233, %1234) : (!llvm.ptr, i64) -> i64
      %1236 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1237 = arith.constant 7 : i64
      %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
      %1239 = func.call @cc_intern(%1235, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_nil_value() : () -> i64
      %1241 = func.call @cc_cons(%1239, %1240) : (i64, i64) -> i64
      %1242 = func.call @cc_values_pack(%1241) : (i64) -> i64
      %1243 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1244 = arith.constant 6 : i64
      %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
      %1246 = func.call @cc_nil_value() : () -> i64
      %1247 = func.call @cc_intern(%1245, %1246) : (i64, i64) -> i64
      %1248 = func.call @cc_nil_value() : () -> i64
      %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
      %1250 = func.call @cc_values_pack(%1249) : (i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1251 = arith.addi %1247, %__rlasp_stack_elide_zero_67 : i64
      %1252 = func.call @cc_nil_value() : () -> i64
      %1253 = func.call @cc_errorp(%923) : (i64) -> i64
      %1254 = arith.cmpi ne, %1253, %1252 : i64
      %1255 = arith.cmpi eq, %1252, %1252 : i64
      %1256 = arith.andi %1254, %1255 : i1
      %1257 = scf.if %1256 -> (i64) {
        scf.yield %923 : i64
      } else {
        scf.yield %1252 : i64
      }
      %1258 = func.call @cc_errorp(%1105) : (i64) -> i64
      %1259 = arith.cmpi ne, %1258, %1252 : i64
      %1260 = arith.cmpi eq, %1257, %1252 : i64
      %1261 = arith.andi %1259, %1260 : i1
      %1262 = scf.if %1261 -> (i64) {
        scf.yield %1105 : i64
      } else {
        scf.yield %1257 : i64
      }
      %1263 = func.call @cc_errorp(%1209) : (i64) -> i64
      %1264 = arith.cmpi ne, %1263, %1252 : i64
      %1265 = arith.cmpi eq, %1262, %1252 : i64
      %1266 = arith.andi %1264, %1265 : i1
      %1267 = scf.if %1266 -> (i64) {
        scf.yield %1209 : i64
      } else {
        scf.yield %1262 : i64
      }
      %1268 = func.call @cc_errorp(%1221) : (i64) -> i64
      %1269 = arith.cmpi ne, %1268, %1252 : i64
      %1270 = arith.cmpi eq, %1267, %1252 : i64
      %1271 = arith.andi %1269, %1270 : i1
      %1272 = scf.if %1271 -> (i64) {
        scf.yield %1221 : i64
      } else {
        scf.yield %1267 : i64
      }
      %1273 = func.call @cc_errorp(%1228) : (i64) -> i64
      %1274 = arith.cmpi ne, %1273, %1252 : i64
      %1275 = arith.cmpi eq, %1272, %1252 : i64
      %1276 = arith.andi %1274, %1275 : i1
      %1277 = scf.if %1276 -> (i64) {
        scf.yield %1228 : i64
      } else {
        scf.yield %1272 : i64
      }
      %1278 = func.call @cc_errorp(%1232) : (i64) -> i64
      %1279 = arith.cmpi ne, %1278, %1252 : i64
      %1280 = arith.cmpi eq, %1277, %1252 : i64
      %1281 = arith.andi %1279, %1280 : i1
      %1282 = scf.if %1281 -> (i64) {
        scf.yield %1232 : i64
      } else {
        scf.yield %1277 : i64
      }
      %1283 = func.call @cc_errorp(%1239) : (i64) -> i64
      %1284 = arith.cmpi ne, %1283, %1252 : i64
      %1285 = arith.cmpi eq, %1282, %1252 : i64
      %1286 = arith.andi %1284, %1285 : i1
      %1287 = scf.if %1286 -> (i64) {
        scf.yield %1239 : i64
      } else {
        scf.yield %1282 : i64
      }
      %1288 = func.call @cc_errorp(%1251) : (i64) -> i64
      %1289 = arith.cmpi ne, %1288, %1252 : i64
      %1290 = arith.cmpi eq, %1287, %1252 : i64
      %1291 = arith.andi %1289, %1290 : i1
      %1292 = scf.if %1291 -> (i64) {
        scf.yield %1251 : i64
      } else {
        scf.yield %1287 : i64
      }
      %1293 = arith.cmpi ne, %1292, %1252 : i64
      scf.if %1293 {
        func.call @stack_push_pointer(%1292) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%923) : (i64) -> ()
        func.call @stack_push_pointer(%1105) : (i64) -> ()
        func.call @stack_push_pointer(%1209) : (i64) -> ()
        func.call @stack_push_pointer(%1221) : (i64) -> ()
        func.call @stack_push_pointer(%1228) : (i64) -> ()
        func.call @stack_push_pointer(%1232) : (i64) -> ()
        func.call @stack_push_pointer(%1239) : (i64) -> ()
        func.call @stack_push_pointer(%1251) : (i64) -> ()
        %1294 = llvm.mlir.addressof @str96 : !llvm.ptr
        %1295 = func.call @cc_make_function_ref_const(%1294) : (!llvm.ptr) -> i64
        %1296 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1295, %1296) : (i64, i64) -> ()
      }
      %1297 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1297 : i64
    }
    %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
    %1298 = arith.addi %914, %__rlasp_stack_elide_zero_68 : i64
    %1299 = func.call @cc_multiple_value_list(%1298) : (i64) -> i64
    %1300 = llvm.mlir.addressof @str97 : !llvm.ptr
    %1301 = arith.constant 38 : i64
    %1302 = func.call @cc_make_string(%1300, %1301) : (!llvm.ptr, i64) -> i64
    %1303 = func.call @cc_nil_value() : () -> i64
    %1304 = func.call @cc_intern(%1302, %1303) : (i64, i64) -> i64
    %1305 = func.call @cc_nil_value() : () -> i64
    %1306 = func.call @cc_cons(%1304, %1305) : (i64, i64) -> i64
    %1307 = func.call @cc_values_pack(%1306) : (i64) -> i64
    %1308 = func.call @cc_symbol_value(%1304) : (i64) -> i64
    %1309 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1310 = arith.constant 40 : i64
    %1311 = func.call @cc_make_string(%1309, %1310) : (!llvm.ptr, i64) -> i64
    %1312 = func.call @cc_nil_value() : () -> i64
    %1313 = func.call @cc_intern(%1311, %1312) : (i64, i64) -> i64
    %1314 = func.call @cc_nil_value() : () -> i64
    %1315 = func.call @cc_cons(%1313, %1314) : (i64, i64) -> i64
    %1316 = func.call @cc_values_pack(%1315) : (i64) -> i64
    %1317 = func.call @cc_symbol_value(%1313) : (i64) -> i64
    %1318 = func.call @cc_nil_value() : () -> i64
    %1319 = arith.cmpi ne, %1308, %1318 : i64
    %1320 = scf.if %1319 -> (i64) {
      scf.yield %1317 : i64
    } else {
      scf.yield %1299 : i64
    }
    %1321 = func.call @cc_values_pack(%1320) : (i64) -> i64
    func.call @stack_push_pointer(%1321) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345220"() {
    %601 = func.call @stack_pop_pointer() : () -> i64
    %602 = func.call @stack_pop_pointer() : () -> i64
    %603 = func.call @stack_pop_pointer() : () -> i64
    %604 = func.call @cc_nil_value() : () -> i64
    %605 = func.call @cc_nil_value() : () -> i64
    %606 = func.call @cc_errorp(%604) : (i64) -> i64
    %607 = arith.cmpi ne, %606, %605 : i64
    %608 = scf.if %607 -> (i64) {
      scf.yield %604 : i64
    } else {
      %609 = func.call @cc_t_value() : () -> i64
      %610 = func.call @cc_set_symbol_value(%603, %609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %611 = arith.addi %609, %__rlasp_stack_elide_zero_69 : i64
      scf.yield %611 : i64
    }
    %612 = func.call @cc_nil_value() : () -> i64
    %613 = func.call @cc_errorp(%608) : (i64) -> i64
    %614 = arith.cmpi ne, %613, %612 : i64
    %615 = scf.if %614 -> (i64) {
      scf.yield %608 : i64
    } else {
      %616 = func.call @cc_nil_value() : () -> i64
      %617 = func.call @cc_errorp(%601) : (i64) -> i64
      %618 = arith.cmpi ne, %617, %616 : i64
      %619 = arith.cmpi eq, %616, %616 : i64
      %620 = arith.andi %618, %619 : i1
      %621 = scf.if %620 -> (i64) {
        scf.yield %601 : i64
      } else {
        scf.yield %616 : i64
      }
      %622 = arith.cmpi ne, %621, %616 : i64
      scf.if %622 {
        func.call @stack_push_pointer(%621) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%601) : (i64) -> ()
        %623 = llvm.mlir.addressof @str59 : !llvm.ptr
        %624 = func.call @cc_make_function_ref_const(%623) : (!llvm.ptr) -> i64
        %625 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%624, %625) : (i64, i64) -> ()
      }
      %626 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %626 : i64
    }
    func.call @stack_push_pointer(%615) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345221"() {
    %658 = func.call @stack_pop_pointer() : () -> i64
    %659 = func.call @stack_pop_pointer() : () -> i64
    %660 = func.call @cc_nil_value() : () -> i64
    %661 = func.call @cc_nil_value() : () -> i64
    %662 = func.call @cc_errorp(%660) : (i64) -> i64
    %663 = arith.cmpi ne, %662, %661 : i64
    %664 = scf.if %663 -> (i64) {
      scf.yield %660 : i64
    } else {
      %665 = arith.constant 0 : i64
      %666 = func.call @cc_box_fixnum(%665) : (i64) -> i64
      %667 = func.call @cc_nil_value() : () -> i64
      %668 = func.call @cc_nil_value() : () -> i64
      %669 = func.call @cc_errorp(%667) : (i64) -> i64
      %670 = arith.cmpi ne, %669, %668 : i64
      %671 = scf.if %670 -> (i64) {
        scf.yield %667 : i64
      } else {
        %672 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%672) : (i64) -> ()
        %673 = func.call @stack_pop_pointer() : () -> i64
        %674 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%674) : (i64) -> ()
        %675 = func.call @stack_pop_pointer() : () -> i64
        %676 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%676) : (i64) -> ()
        %677 = func.call @stack_pop_pointer() : () -> i64
        %678 = func.call @cc_nil_value() : () -> i64
        %679 = func.call @cc_errorp(%673) : (i64) -> i64
        %680 = arith.cmpi ne, %679, %678 : i64
        %681 = arith.cmpi eq, %678, %678 : i64
        %682 = arith.andi %680, %681 : i1
        %683 = scf.if %682 -> (i64) {
          scf.yield %673 : i64
        } else {
          scf.yield %678 : i64
        }
        %684 = func.call @cc_errorp(%675) : (i64) -> i64
        %685 = arith.cmpi ne, %684, %678 : i64
        %686 = arith.cmpi eq, %683, %678 : i64
        %687 = arith.andi %685, %686 : i1
        %688 = scf.if %687 -> (i64) {
          scf.yield %675 : i64
        } else {
          scf.yield %683 : i64
        }
        %689 = func.call @cc_errorp(%677) : (i64) -> i64
        %690 = arith.cmpi ne, %689, %678 : i64
        %691 = arith.cmpi eq, %688, %678 : i64
        %692 = arith.andi %690, %691 : i1
        %693 = scf.if %692 -> (i64) {
          scf.yield %677 : i64
        } else {
          scf.yield %688 : i64
        }
        %694 = arith.cmpi ne, %693, %678 : i64
        scf.if %694 {
          func.call @stack_push_pointer(%693) : (i64) -> ()
        } else {
          %695 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%695) : (i64) -> ()
          %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
          %696 = arith.addi %677, %__rlasp_stack_elide_zero_70 : i64
          %697 = func.call @stack_pop_pointer() : () -> i64
          %698 = func.call @cc_cons(%696, %697) : (i64, i64) -> i64
          func.call @stack_push_pointer(%698) : (i64) -> ()
          %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
          %699 = arith.addi %675, %__rlasp_stack_elide_zero_71 : i64
          %700 = func.call @stack_pop_pointer() : () -> i64
          %701 = func.call @cc_cons(%699, %700) : (i64, i64) -> i64
          func.call @stack_push_pointer(%701) : (i64) -> ()
          %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
          %702 = arith.addi %673, %__rlasp_stack_elide_zero_72 : i64
          %703 = func.call @stack_pop_pointer() : () -> i64
          %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
          func.call @stack_push_pointer(%704) : (i64) -> ()
        }
        %705 = func.call @stack_pop_pointer() : () -> i64
        %706 = func.call @cc_nil_value() : () -> i64
        %707 = func.call @cc_errorp(%705) : (i64) -> i64
        %708 = arith.cmpi ne, %707, %706 : i64
        %709 = arith.cmpi eq, %706, %706 : i64
        %710 = arith.andi %708, %709 : i1
        %711 = scf.if %710 -> (i64) {
          scf.yield %705 : i64
        } else {
          scf.yield %706 : i64
        }
        %712 = func.call @cc_errorp(%666) : (i64) -> i64
        %713 = arith.cmpi ne, %712, %706 : i64
        %714 = arith.cmpi eq, %711, %706 : i64
        %715 = arith.andi %713, %714 : i1
        %716 = scf.if %715 -> (i64) {
          scf.yield %666 : i64
        } else {
          scf.yield %711 : i64
        }
        %717 = arith.cmpi ne, %716, %706 : i64
        scf.if %717 {
          func.call @stack_push_pointer(%716) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%705) : (i64) -> ()
          func.call @stack_push_pointer(%666) : (i64) -> ()
          %718 = llvm.mlir.addressof @str63 : !llvm.ptr
          %719 = func.call @cc_make_function_ref_const(%718) : (!llvm.ptr) -> i64
          %720 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%719, %720) : (i64, i64) -> ()
        }
        %721 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %722 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
        %723 = arith.addi %666, %__rlasp_stack_elide_zero_73 : i64
        %724 = func.call @cc_symbol_value(%659) : (i64) -> i64
        %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
        %725 = arith.addi %724, %__rlasp_stack_elide_zero_74 : i64
        %727 = arith.constant 3 : i64
        %726 = arith.andi %723, %727 : i64
        %728 = arith.constant 0 : i64
        %729 = arith.cmpi eq, %726, %728 : i64
        %731 = arith.constant 3 : i64
        %730 = arith.andi %725, %731 : i64
        %732 = arith.constant 0 : i64
        %733 = arith.cmpi eq, %730, %732 : i64
        %734 = arith.andi %729, %733 : i1
        %735 = scf.if %734 -> (i64) {
          %736 = arith.constant 2 : i64
          %737 = arith.shrsi %723, %736 : i64
          %738 = arith.constant 2 : i64
          %739 = arith.shrsi %725, %738 : i64
          %740 = arith.addi %737, %739 : i64
          %741 = arith.constant -2305843009213693952 : i64
          %742 = arith.constant 2305843009213693951 : i64
          %743 = arith.cmpi sge, %740, %741 : i64
          %744 = arith.cmpi sle, %740, %742 : i64
          %745 = arith.andi %743, %744 : i1
          %746 = scf.if %745 -> (i64) {
            %747 = arith.constant 2 : i64
            %748 = arith.shli %740, %747 : i64
            scf.yield %748 : i64
          } else {
            %749 = func.call @cc_add(%723, %725) : (i64, i64) -> i64
            scf.yield %749 : i64
          }
          scf.yield %746 : i64
        } else {
          %750 = func.call @cc_add(%723, %725) : (i64, i64) -> i64
          scf.yield %750 : i64
        }
        %751 = func.call @cc_set_symbol_value(%658, %735) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
        %752 = arith.addi %735, %__rlasp_stack_elide_zero_75 : i64
        %753 = func.call @cc_nil_value() : () -> i64
        %754 = func.call @cc_errorp(%721) : (i64) -> i64
        %755 = arith.cmpi ne, %754, %753 : i64
        %756 = arith.cmpi eq, %753, %753 : i64
        %757 = arith.andi %755, %756 : i1
        %758 = scf.if %757 -> (i64) {
          scf.yield %721 : i64
        } else {
          scf.yield %753 : i64
        }
        %759 = func.call @cc_errorp(%722) : (i64) -> i64
        %760 = arith.cmpi ne, %759, %753 : i64
        %761 = arith.cmpi eq, %758, %753 : i64
        %762 = arith.andi %760, %761 : i1
        %763 = scf.if %762 -> (i64) {
          scf.yield %722 : i64
        } else {
          scf.yield %758 : i64
        }
        %764 = func.call @cc_errorp(%752) : (i64) -> i64
        %765 = arith.cmpi ne, %764, %753 : i64
        %766 = arith.cmpi eq, %763, %753 : i64
        %767 = arith.andi %765, %766 : i1
        %768 = scf.if %767 -> (i64) {
          scf.yield %752 : i64
        } else {
          scf.yield %763 : i64
        }
        %769 = arith.cmpi ne, %768, %753 : i64
        scf.if %769 {
          func.call @stack_push_pointer(%768) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%721) : (i64) -> ()
          func.call @stack_push_pointer(%722) : (i64) -> ()
          func.call @stack_push_pointer(%752) : (i64) -> ()
          %770 = llvm.mlir.addressof @str64 : !llvm.ptr
          %771 = func.call @cc_make_function_ref_const(%770) : (!llvm.ptr) -> i64
          %772 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%771, %772) : (i64, i64) -> ()
        }
        %773 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %773 : i64
      }
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %774 = arith.addi %671, %__rlasp_stack_elide_zero_76 : i64
      scf.yield %774 : i64
    }
    func.call @stack_push_pointer(%664) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345217"() {
    %585 = func.call @cc_nil_value() : () -> i64
    %586 = func.call @cc_nil_value() : () -> i64
    %587 = func.call @cc_errorp(%585) : (i64) -> i64
    %588 = arith.cmpi ne, %587, %586 : i64
    %589 = scf.if %588 -> (i64) {
      scf.yield %585 : i64
    } else {
      %590 = func.call @cc_nil_value() : () -> i64
      %591 = llvm.mlir.addressof @str58 : !llvm.ptr
      %592 = arith.constant 37 : i64
      %593 = func.call @cc_make_symbol(%591, %592) : (!llvm.ptr, i64) -> i64
      %594 = func.call @cc_persistent_root_value(%593) : (i64) -> i64
      %595 = func.call @cc_set_symbol_value(%594, %590) : (i64, i64) -> i64
      %596 = func.call @cc_nil_value() : () -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_errorp(%596) : (i64) -> i64
      %599 = arith.cmpi ne, %598, %597 : i64
      %600 = scf.if %599 -> (i64) {
        scf.yield %596 : i64
      } else {
        func.call @stack_push_pointer(%594) : (i64) -> ()
        %627 = arith.constant 210468094345220 : i64
        %628 = arith.constant 1 : i64
        %629 = func.call @cc_make_closure(%627, %628) : (i64, i64) -> i64
        %630 = llvm.mlir.addressof @str60 : !llvm.ptr
        %631 = arith.constant 14 : i64
        %632 = func.call @cc_bind_function_object_const(%630, %631, %629) : (!llvm.ptr, i64, i64) -> i64
        %633 = func.call @cc_nil_value() : () -> i64
        %634 = llvm.mlir.addressof @str61 : !llvm.ptr
        %635 = arith.constant 7 : i64
        %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
        %637 = llvm.mlir.addressof @str62 : !llvm.ptr
        %638 = arith.constant 11 : i64
        %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
        %640 = func.call @cc_intern(%636, %639) : (i64, i64) -> i64
        %641 = func.call @cc_nil_value() : () -> i64
        %642 = func.call @cc_cons(%640, %641) : (i64, i64) -> i64
        %643 = func.call @cc_values_pack(%642) : (i64) -> i64
        %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
        %644 = arith.addi %640, %__rlasp_stack_elide_zero_77 : i64
        %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
        %645 = arith.addi %629, %__rlasp_stack_elide_zero_78 : i64
        %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
        %647 = func.call @cc_cons(%646, %633) : (i64, i64) -> i64
        %648 = func.call @cc_push_handler_frame(%647) : (i64) -> i64
        %649 = func.call @cc_errorp(%648) : (i64) -> i64
        %650 = func.call @cc_nil_value() : () -> i64
        %651 = arith.cmpi ne, %649, %650 : i64
        %652 = scf.if %651 -> (i64) {
          scf.yield %648 : i64
        } else {
          %653 = func.call @cc_nil_value() : () -> i64
          %654 = func.call @cc_nil_value() : () -> i64
          %655 = func.call @cc_errorp(%653) : (i64) -> i64
          %656 = arith.cmpi ne, %655, %654 : i64
          %657 = scf.if %656 -> (i64) {
            scf.yield %653 : i64
          } else {
            %775 = llvm.mlir.addressof @str65 : !llvm.ptr
            %776 = arith.constant 30 : i64
            %777 = func.call @cc_make_symbol(%775, %776) : (!llvm.ptr, i64) -> i64
            %778 = func.call @cc_persistent_root_value(%777) : (i64) -> i64
            func.call @stack_push_pointer(%778) : (i64) -> ()
            %779 = llvm.mlir.addressof @str66 : !llvm.ptr
            %780 = arith.constant 32 : i64
            %781 = func.call @cc_make_symbol(%779, %780) : (!llvm.ptr, i64) -> i64
            %782 = func.call @cc_persistent_root_value(%781) : (i64) -> i64
            func.call @stack_push_pointer(%782) : (i64) -> ()
            %783 = arith.constant 210468094345221 : i64
            %784 = arith.constant 2 : i64
            %785 = func.call @cc_make_closure(%783, %784) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
            %786 = arith.addi %785, %__rlasp_stack_elide_zero_79 : i64
            %787 = func.call @cc_nil_value() : () -> i64
            %788 = func.call @cc_cons(%787, %787) : (i64, i64) -> i64
            %789 = func.call @cc_cons(%787, %788) : (i64, i64) -> i64
            %790 = func.call @cc_cons(%786, %789) : (i64, i64) -> i64
            %791 = func.call @cc_values_pack(%790) : (i64) -> i64
            %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
            %792 = arith.addi %791, %__rlasp_stack_elide_zero_80 : i64
            scf.yield %792 : i64
          }
          %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
          %793 = arith.addi %657, %__rlasp_stack_elide_zero_81 : i64
          %794 = func.call @cc_pop_handler_frame() : () -> i64
          scf.yield %793 : i64
        }
        %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
        %795 = arith.addi %652, %__rlasp_stack_elide_zero_82 : i64
        %796 = func.call @cc_multiple_value_list(%795) : (i64) -> i64
        %797 = func.call @cc_symbol_value(%594) : (i64) -> i64
        %798 = func.call @cc_values_pack(%796) : (i64) -> i64
        %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
        %799 = arith.addi %798, %__rlasp_stack_elide_zero_83 : i64
        scf.yield %799 : i64
      }
      %800 = func.call @cc_nil_value() : () -> i64
      %801 = func.call @cc_errorp(%600) : (i64) -> i64
      %802 = arith.cmpi ne, %801, %800 : i64
      %803 = scf.if %802 -> (i64) {
        scf.yield %600 : i64
      } else {
        %804 = func.call @cc_symbol_value(%594) : (i64) -> i64
        %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
        %805 = arith.addi %804, %__rlasp_stack_elide_zero_84 : i64
        %806 = func.call @cc_nil_value() : () -> i64
        %807 = func.call @cc_cons(%805, %806) : (i64, i64) -> i64
        %808 = func.call @cc_not(%807) : (i64) -> i64
        %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
        %809 = arith.addi %808, %__rlasp_stack_elide_zero_85 : i64
        scf.yield %809 : i64
      }
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %810 = arith.addi %803, %__rlasp_stack_elide_zero_86 : i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_not(%812) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %814 = arith.addi %813, %__rlasp_stack_elide_zero_87 : i64
      %815 = func.call @cc_nil_value() : () -> i64
      %816 = func.call @cc_cons(%814, %815) : (i64, i64) -> i64
      %817 = func.call @cc_not(%816) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %818 = arith.addi %817, %__rlasp_stack_elide_zero_88 : i64
      scf.yield %818 : i64
    }
    func.call @stack_push_pointer(%589) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345224"() {
    %1106 = func.call @cc_nil_value() : () -> i64
    %1107 = func.call @cc_nil_value() : () -> i64
    %1108 = func.call @cc_errorp(%1106) : (i64) -> i64
    %1109 = arith.cmpi ne, %1108, %1107 : i64
    %1110 = scf.if %1109 -> (i64) {
      scf.yield %1106 : i64
    } else {
      %1111 = arith.constant 0 : i64
      %1112 = func.call @cc_box_fixnum(%1111) : (i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_errorp(%1113) : (i64) -> i64
      %1116 = arith.cmpi ne, %1115, %1114 : i64
      %1117:2 = scf.if %1116 -> (i64, i64) {
        scf.yield %1113, %1112 : i64, i64
      } else {
        %1118 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%1118) : (i64) -> ()
        %1119 = func.call @stack_pop_pointer() : () -> i64
        %1120 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%1120) : (i64) -> ()
        %1121 = func.call @stack_pop_pointer() : () -> i64
        %1122 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%1122) : (i64) -> ()
        %1123 = func.call @stack_pop_pointer() : () -> i64
        %1124 = func.call @cc_nil_value() : () -> i64
        %1125 = func.call @cc_errorp(%1119) : (i64) -> i64
        %1126 = arith.cmpi ne, %1125, %1124 : i64
        %1127 = arith.cmpi eq, %1124, %1124 : i64
        %1128 = arith.andi %1126, %1127 : i1
        %1129 = scf.if %1128 -> (i64) {
          scf.yield %1119 : i64
        } else {
          scf.yield %1124 : i64
        }
        %1130 = func.call @cc_errorp(%1121) : (i64) -> i64
        %1131 = arith.cmpi ne, %1130, %1124 : i64
        %1132 = arith.cmpi eq, %1129, %1124 : i64
        %1133 = arith.andi %1131, %1132 : i1
        %1134 = scf.if %1133 -> (i64) {
          scf.yield %1121 : i64
        } else {
          scf.yield %1129 : i64
        }
        %1135 = func.call @cc_errorp(%1123) : (i64) -> i64
        %1136 = arith.cmpi ne, %1135, %1124 : i64
        %1137 = arith.cmpi eq, %1134, %1124 : i64
        %1138 = arith.andi %1136, %1137 : i1
        %1139 = scf.if %1138 -> (i64) {
          scf.yield %1123 : i64
        } else {
          scf.yield %1134 : i64
        }
        %1140 = arith.cmpi ne, %1139, %1124 : i64
        scf.if %1140 {
          func.call @stack_push_pointer(%1139) : (i64) -> ()
        } else {
          %1141 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%1141) : (i64) -> ()
          %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
          %1142 = arith.addi %1123, %__rlasp_stack_elide_zero_89 : i64
          %1143 = func.call @stack_pop_pointer() : () -> i64
          %1144 = func.call @cc_cons(%1142, %1143) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1144) : (i64) -> ()
          %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
          %1145 = arith.addi %1121, %__rlasp_stack_elide_zero_90 : i64
          %1146 = func.call @stack_pop_pointer() : () -> i64
          %1147 = func.call @cc_cons(%1145, %1146) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1147) : (i64) -> ()
          %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
          %1148 = arith.addi %1119, %__rlasp_stack_elide_zero_91 : i64
          %1149 = func.call @stack_pop_pointer() : () -> i64
          %1150 = func.call @cc_cons(%1148, %1149) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1150) : (i64) -> ()
        }
        %1151 = func.call @stack_pop_pointer() : () -> i64
        %1152:2 = scf.while (%arg0 = %1151, %arg1 = %1112) : (i64, i64) -> (i64, i64) {
          %1153 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %1154 = arith.constant 0 : i32
          %1155 = arith.cmpi ne, %1153, %1154 : i32
          scf.condition(%1155) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%1156: i64, %1157: i64):
          %1158 = func.call @cc_car(%1156) : (i64) -> i64
          %1160 = arith.constant 3 : i64
          %1159 = arith.andi %1157, %1160 : i64
          %1161 = arith.constant 0 : i64
          %1162 = arith.cmpi eq, %1159, %1161 : i64
          %1164 = arith.constant 3 : i64
          %1163 = arith.andi %1158, %1164 : i64
          %1165 = arith.constant 0 : i64
          %1166 = arith.cmpi eq, %1163, %1165 : i64
          %1167 = arith.andi %1162, %1166 : i1
          %1168 = scf.if %1167 -> (i64) {
            %1169 = arith.constant 2 : i64
            %1170 = arith.shrsi %1157, %1169 : i64
            %1171 = arith.constant 2 : i64
            %1172 = arith.shrsi %1158, %1171 : i64
            %1173 = arith.addi %1170, %1172 : i64
            %1174 = arith.constant -2305843009213693952 : i64
            %1175 = arith.constant 2305843009213693951 : i64
            %1176 = arith.cmpi sge, %1173, %1174 : i64
            %1177 = arith.cmpi sle, %1173, %1175 : i64
            %1178 = arith.andi %1176, %1177 : i1
            %1179 = scf.if %1178 -> (i64) {
              %1180 = arith.constant 2 : i64
              %1181 = arith.shli %1173, %1180 : i64
              scf.yield %1181 : i64
            } else {
              %1182 = func.call @cc_add(%1157, %1158) : (i64, i64) -> i64
              scf.yield %1182 : i64
            }
            scf.yield %1179 : i64
          } else {
            %1183 = func.call @cc_add(%1157, %1158) : (i64, i64) -> i64
            scf.yield %1183 : i64
          }
          %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
          %1184 = arith.addi %1168, %__rlasp_stack_elide_zero_92 : i64
          func.call @stack_push_pointer(%1184) : (i64) -> ()
          %1185 = func.call @stack_depth() : () -> i64
          %1186 = arith.constant 0 : i64
          %1187 = arith.cmpi sgt, %1185, %1186 : i64
          scf.if %1187 {
            %1188 = func.call @stack_pop_pointer() : () -> i64
          }
          %1189 = func.call @cc_cdr(%1156) : (i64) -> i64
          scf.yield %1189, %1184 : i64, i64
        }
        %1190 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
        %1191 = arith.addi %1190, %__rlasp_stack_elide_zero_93 : i64
        %1192 = func.call @cc_nil_value() : () -> i64
        %1193 = arith.cmpi eq, %1191, %1192 : i64
        %1195 = func.call @cc_t_value() : () -> i64
        %1194 = arith.select %1193, %1195, %1192 : i64
        %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
        %1196 = arith.addi %1194, %__rlasp_stack_elide_zero_94 : i64
        scf.yield %1196, %1152#1 : i64, i64
      }
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1197 = arith.addi %1117#0, %__rlasp_stack_elide_zero_95 : i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_not(%1199) : (i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1201 = arith.addi %1200, %__rlasp_stack_elide_zero_96 : i64
      %1202 = func.call @cc_nil_value() : () -> i64
      %1203 = func.call @cc_cons(%1201, %1202) : (i64, i64) -> i64
      %1204 = func.call @cc_not(%1203) : (i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1205 = arith.addi %1204, %__rlasp_stack_elide_zero_97 : i64
      scf.yield %1205 : i64
    }
    func.call @stack_push_pointer(%1110) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_210468094345216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_210468094345216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_210468094345216*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("DOLIST-DECLARE-ELEMENTS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str9("DID-WARN\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str10("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("CATCH-WARNINGS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str13("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("DID-WARN\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str19("MUFFLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("HANDLER-BIND\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("CATCH-WARNINGS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str30("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str35("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str37("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str40("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str43("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str50("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str53("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str54("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str56("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("DID-WARN\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("#:%%DYN-CELL-210468094345218-DID-WARN\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str59("MUFFLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str60("catch-warnings\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str61("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str64("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("#:%%DYN-CELL-210468094345222-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str66("#:%%DYN-CELL-210468094345223-SUM\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str67("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str68("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str70("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str71("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str72("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str74("DOLIST-VAR-NIL-AT-RETURN\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str75("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str76("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str77("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str78("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str82("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str83("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str86("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str89("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str90("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str91("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str96("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETFLAG_210468094345216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETMVLIST_210468094345216*\00") : !llvm.array<41 x i8>
}
