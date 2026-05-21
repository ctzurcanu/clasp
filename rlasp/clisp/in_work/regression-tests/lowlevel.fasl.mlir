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
      %57 = arith.constant 19 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 21 : i64
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
      %76 = arith.constant 17 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = llvm.mlir.addressof @str9 : !llvm.ptr
      %79 = arith.constant 11 : i64
      %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
      %81 = func.call @cc_intern(%77, %80) : (i64, i64) -> i64
      %82 = func.call @cc_nil_value() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      %84 = func.call @cc_values_pack(%83) : (i64) -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = func.call @cc_cons(%86, %85) : (i64, i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %88 = llvm.mlir.addressof @str10 : !llvm.ptr
      %89 = arith.constant 12 : i64
      %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
      %91 = llvm.mlir.addressof @str11 : !llvm.ptr
      %92 = arith.constant 11 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = func.call @cc_intern(%90, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %98 = llvm.mlir.addressof @str12 : !llvm.ptr
      %99 = arith.constant 50 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      %101 = llvm.mlir.addressof @str13 : !llvm.ptr
      %102 = arith.constant 7 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = llvm.mlir.addressof @str14 : !llvm.ptr
      %105 = arith.constant 7 : i64
      %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
      %107 = func.call @cc_intern(%103, %106) : (i64, i64) -> i64
      %108 = func.call @cc_nil_value() : () -> i64
      %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
      %110 = func.call @cc_values_pack(%109) : (i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %111 = llvm.mlir.addressof @str15 : !llvm.ptr
      %112 = arith.constant 5 : i64
      %113 = func.call @cc_make_string(%111, %112) : (!llvm.ptr, i64) -> i64
      %114 = llvm.mlir.addressof @str16 : !llvm.ptr
      %115 = arith.constant 7 : i64
      %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
      %117 = func.call @cc_intern(%113, %116) : (i64, i64) -> i64
      %118 = func.call @cc_nil_value() : () -> i64
      %119 = func.call @cc_cons(%117, %118) : (i64, i64) -> i64
      %120 = func.call @cc_values_pack(%119) : (i64) -> i64
      func.call @stack_push_pointer(%117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%122, %121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %124 = arith.addi %123, %__rlasp_stack_elide_zero_3 : i64
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @cc_cons(%125, %124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %127 = arith.addi %126, %__rlasp_stack_elide_zero_4 : i64
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = func.call @cc_cons(%128, %127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %130 = arith.addi %129, %__rlasp_stack_elide_zero_5 : i64
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @cc_cons(%131, %130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %133 = arith.addi %132, %__rlasp_stack_elide_zero_6 : i64
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = func.call @cc_cons(%134, %133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %136 = arith.addi %135, %__rlasp_stack_elide_zero_7 : i64
      %137 = func.call @stack_pop_pointer() : () -> i64
      %138 = func.call @cc_cons(%137, %136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %139 = func.call @stack_pop_pointer() : () -> i64
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = func.call @cc_cons(%140, %139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %142 = arith.addi %141, %__rlasp_stack_elide_zero_8 : i64
      %143 = func.call @stack_pop_pointer() : () -> i64
      %144 = func.call @cc_cons(%143, %142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %145 = arith.addi %144, %__rlasp_stack_elide_zero_9 : i64
      %146 = func.call @stack_pop_pointer() : () -> i64
      %147 = func.call @cc_cons(%146, %145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %148 = arith.addi %147, %__rlasp_stack_elide_zero_10 : i64
      %229 = arith.constant 275586643656705 : i64
      %230 = arith.constant 0 : i64
      %231 = func.call @cc_make_closure(%229, %230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %232 = arith.addi %231, %__rlasp_stack_elide_zero_11 : i64
      %233 = llvm.mlir.addressof @str24 : !llvm.ptr
      %234 = arith.constant 0 : i64
      %235 = func.call @cc_make_string(%233, %234) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%235) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %236 = func.call @stack_pop_pointer() : () -> i64
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_cons(%237, %236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %239 = arith.addi %238, %__rlasp_stack_elide_zero_12 : i64
      %240 = llvm.mlir.addressof @str25 : !llvm.ptr
      %241 = arith.constant 11 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = llvm.mlir.addressof @str26 : !llvm.ptr
      %244 = arith.constant 7 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_intern(%242, %245) : (i64, i64) -> i64
      %247 = func.call @cc_nil_value() : () -> i64
      %248 = func.call @cc_cons(%246, %247) : (i64, i64) -> i64
      %249 = func.call @cc_values_pack(%248) : (i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = llvm.mlir.addressof @str27 : !llvm.ptr
      %252 = arith.constant 4 : i64
      %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
      %254 = llvm.mlir.addressof @str28 : !llvm.ptr
      %255 = arith.constant 7 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = func.call @cc_intern(%253, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      %261 = llvm.mlir.addressof @str29 : !llvm.ptr
      %262 = arith.constant 6 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_intern(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %269 = arith.addi %265, %__rlasp_stack_elide_zero_13 : i64
      %270 = func.call @cc_nil_value() : () -> i64
      %271 = func.call @cc_errorp(%64) : (i64) -> i64
      %272 = arith.cmpi ne, %271, %270 : i64
      %273 = arith.cmpi eq, %270, %270 : i64
      %274 = arith.andi %272, %273 : i1
      %275 = scf.if %274 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %270 : i64
      }
      %276 = func.call @cc_errorp(%148) : (i64) -> i64
      %277 = arith.cmpi ne, %276, %270 : i64
      %278 = arith.cmpi eq, %275, %270 : i64
      %279 = arith.andi %277, %278 : i1
      %280 = scf.if %279 -> (i64) {
        scf.yield %148 : i64
      } else {
        scf.yield %275 : i64
      }
      %281 = func.call @cc_errorp(%232) : (i64) -> i64
      %282 = arith.cmpi ne, %281, %270 : i64
      %283 = arith.cmpi eq, %280, %270 : i64
      %284 = arith.andi %282, %283 : i1
      %285 = scf.if %284 -> (i64) {
        scf.yield %232 : i64
      } else {
        scf.yield %280 : i64
      }
      %286 = func.call @cc_errorp(%239) : (i64) -> i64
      %287 = arith.cmpi ne, %286, %270 : i64
      %288 = arith.cmpi eq, %285, %270 : i64
      %289 = arith.andi %287, %288 : i1
      %290 = scf.if %289 -> (i64) {
        scf.yield %239 : i64
      } else {
        scf.yield %285 : i64
      }
      %291 = func.call @cc_errorp(%246) : (i64) -> i64
      %292 = arith.cmpi ne, %291, %270 : i64
      %293 = arith.cmpi eq, %290, %270 : i64
      %294 = arith.andi %292, %293 : i1
      %295 = scf.if %294 -> (i64) {
        scf.yield %246 : i64
      } else {
        scf.yield %290 : i64
      }
      %296 = func.call @cc_errorp(%250) : (i64) -> i64
      %297 = arith.cmpi ne, %296, %270 : i64
      %298 = arith.cmpi eq, %295, %270 : i64
      %299 = arith.andi %297, %298 : i1
      %300 = scf.if %299 -> (i64) {
        scf.yield %250 : i64
      } else {
        scf.yield %295 : i64
      }
      %301 = func.call @cc_errorp(%257) : (i64) -> i64
      %302 = arith.cmpi ne, %301, %270 : i64
      %303 = arith.cmpi eq, %300, %270 : i64
      %304 = arith.andi %302, %303 : i1
      %305 = scf.if %304 -> (i64) {
        scf.yield %257 : i64
      } else {
        scf.yield %300 : i64
      }
      %306 = func.call @cc_errorp(%269) : (i64) -> i64
      %307 = arith.cmpi ne, %306, %270 : i64
      %308 = arith.cmpi eq, %305, %270 : i64
      %309 = arith.andi %307, %308 : i1
      %310 = scf.if %309 -> (i64) {
        scf.yield %269 : i64
      } else {
        scf.yield %305 : i64
      }
      %311 = arith.cmpi ne, %310, %270 : i64
      scf.if %311 {
        func.call @stack_push_pointer(%310) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%148) : (i64) -> ()
        func.call @stack_push_pointer(%232) : (i64) -> ()
        func.call @stack_push_pointer(%239) : (i64) -> ()
        func.call @stack_push_pointer(%246) : (i64) -> ()
        func.call @stack_push_pointer(%250) : (i64) -> ()
        func.call @stack_push_pointer(%257) : (i64) -> ()
        func.call @stack_push_pointer(%269) : (i64) -> ()
        %312 = llvm.mlir.addressof @str30 : !llvm.ptr
        %313 = func.call @cc_make_function_ref_const(%312) : (!llvm.ptr) -> i64
        %314 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%313, %314) : (i64, i64) -> ()
      }
      %315 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %315 : i64
    }
    %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
    %316 = arith.addi %55, %__rlasp_stack_elide_zero_14 : i64
    %317 = func.call @cc_multiple_value_list(%316) : (i64) -> i64
    %318 = llvm.mlir.addressof @str31 : !llvm.ptr
    %319 = arith.constant 38 : i64
    %320 = func.call @cc_make_string(%318, %319) : (!llvm.ptr, i64) -> i64
    %321 = func.call @cc_nil_value() : () -> i64
    %322 = func.call @cc_intern(%320, %321) : (i64, i64) -> i64
    %323 = func.call @cc_nil_value() : () -> i64
    %324 = func.call @cc_cons(%322, %323) : (i64, i64) -> i64
    %325 = func.call @cc_values_pack(%324) : (i64) -> i64
    %326 = func.call @cc_symbol_value(%322) : (i64) -> i64
    %327 = llvm.mlir.addressof @str32 : !llvm.ptr
    %328 = arith.constant 40 : i64
    %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
    %330 = func.call @cc_nil_value() : () -> i64
    %331 = func.call @cc_intern(%329, %330) : (i64, i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
    %334 = func.call @cc_values_pack(%333) : (i64) -> i64
    %335 = func.call @cc_symbol_value(%331) : (i64) -> i64
    %336 = func.call @cc_nil_value() : () -> i64
    %337 = arith.cmpi ne, %326, %336 : i64
    %338 = scf.if %337 -> (i64) {
      scf.yield %335 : i64
    } else {
      scf.yield %317 : i64
    }
    %339 = func.call @cc_values_pack(%338) : (i64) -> i64
    func.call @stack_push_pointer(%339) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275586643656705"() {
    %149 = func.call @cc_nil_value() : () -> i64
    %150 = func.call @cc_nil_value() : () -> i64
    %151 = func.call @cc_errorp(%149) : (i64) -> i64
    %152 = arith.cmpi ne, %151, %150 : i64
    %153 = scf.if %152 -> (i64) {
      scf.yield %149 : i64
    } else {
      %154 = func.call @cc_make_string_output_stream() : () -> i64
      %155 = llvm.mlir.addressof @str17 : !llvm.ptr
      %156 = arith.constant 17 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = func.call @cc_intern(%157, %158) : (i64, i64) -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = func.call @cc_values_pack(%161) : (i64) -> i64
      %163 = func.call @cc_symbol_value(%159) : (i64) -> i64
      %164 = func.call @cc_set_symbol_value(%159, %154) : (i64, i64) -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%165) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_cons(%166, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %169 = llvm.mlir.addressof @str18 : !llvm.ptr
      %170 = arith.constant 5 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      %172 = llvm.mlir.addressof @str19 : !llvm.ptr
      %173 = arith.constant 7 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = func.call @cc_intern(%171, %174) : (i64, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_cons(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_values_pack(%177) : (i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %179 = arith.addi %175, %__rlasp_stack_elide_zero_15 : i64
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_cons(%179, %180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%181) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @stack_pop_pointer() : () -> i64
      %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %185 = llvm.mlir.addressof @str20 : !llvm.ptr
      %186 = arith.constant 7 : i64
      %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
      %188 = llvm.mlir.addressof @str21 : !llvm.ptr
      %189 = arith.constant 7 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = func.call @cc_intern(%187, %190) : (i64, i64) -> i64
      %192 = func.call @cc_nil_value() : () -> i64
      %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
      %194 = func.call @cc_values_pack(%193) : (i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %195 = arith.addi %191, %__rlasp_stack_elide_zero_16 : i64
      %196 = func.call @stack_pop_pointer() : () -> i64
      %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%197) : (i64) -> ()
      %198 = llvm.mlir.addressof @str22 : !llvm.ptr
      %199 = arith.constant 50 : i64
      %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %201 = arith.addi %200, %__rlasp_stack_elide_zero_17 : i64
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%203) : (i64) -> ()
      %204 = llvm.mlir.addressof @str23 : !llvm.ptr
      %205 = arith.constant 12 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_intern(%206, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %212 = arith.addi %208, %__rlasp_stack_elide_zero_18 : i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%212, %213) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %215 = arith.addi %214, %__rlasp_stack_elide_zero_19 : i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_cons(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_eval(%217) : (i64) -> i64
      %219 = func.call @cc_multiple_value_list(%218) : (i64) -> i64
      %220 = func.call @cc_values_pack(%219) : (i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %221 = arith.addi %220, %__rlasp_stack_elide_zero_20 : i64
      %222 = func.call @cc_nil_value() : () -> i64
      %223 = func.call @cc_errorp(%221) : (i64) -> i64
      %224 = arith.cmpi ne, %223, %222 : i64
      %225 = scf.if %224 -> (i64) {
        scf.yield %221 : i64
      } else {
        %226 = func.call @cc_get_output_stream_string(%154) : (i64) -> i64
        scf.yield %226 : i64
      }
      func.call @stack_push_pointer(%225) : (i64) -> ()
      %227 = func.call @cc_set_symbol_value(%159, %163) : (i64, i64) -> i64
      %228 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %228 : i64
    }
    func.call @stack_push_pointer(%153) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_275586643656704*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_275586643656704*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_275586643656704*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("COMPILE-2-LOW-LEVEL\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str6("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("sys:src;lisp;regression-tests;lowlevel-source.lisp\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str13("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str18("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("sys:src;lisp;regression-tests;lowlevel-source.lisp\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str23("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str25("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str28("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_275586643656704*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETMVLIST_275586643656704*\00") : !llvm.array<41 x i8>
}
