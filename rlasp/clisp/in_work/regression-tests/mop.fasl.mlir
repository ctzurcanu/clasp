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
      %57 = arith.constant 20 : i64
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
      %74 = arith.constant 17 : i64
      %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
      %76 = func.call @cc_nil_value() : () -> i64
      %77 = func.call @cc_intern(%75, %76) : (i64, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      %79 = func.call @cc_cons(%77, %78) : (i64, i64) -> i64
      %80 = func.call @cc_values_pack(%79) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %81 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      %82 = llvm.mlir.addressof @str8 : !llvm.ptr
      %83 = arith.constant 31 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = llvm.mlir.addressof @str9 : !llvm.ptr
      %86 = arith.constant 4 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = func.call @cc_intern(%84, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %92 = llvm.mlir.addressof @str10 : !llvm.ptr
      %93 = arith.constant 13 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = arith.constant 4 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = func.call @cc_intern(%94, %97) : (i64, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_values_pack(%100) : (i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %102 = llvm.mlir.addressof @str12 : !llvm.ptr
      %103 = arith.constant 17 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = llvm.mlir.addressof @str13 : !llvm.ptr
      %106 = arith.constant 4 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = func.call @cc_intern(%104, %107) : (i64, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_values_pack(%110) : (i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      %112 = llvm.mlir.addressof @str14 : !llvm.ptr
      %113 = arith.constant 19 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = llvm.mlir.addressof @str15 : !llvm.ptr
      %116 = arith.constant 4 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = func.call @cc_intern(%114, %117) : (i64, i64) -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
      %121 = func.call @cc_values_pack(%120) : (i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      %122 = llvm.mlir.addressof @str16 : !llvm.ptr
      %123 = arith.constant 22 : i64
      %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
      %125 = llvm.mlir.addressof @str17 : !llvm.ptr
      %126 = arith.constant 4 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = func.call @cc_intern(%124, %127) : (i64, i64) -> i64
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_cons(%128, %129) : (i64, i64) -> i64
      %131 = func.call @cc_values_pack(%130) : (i64) -> i64
      func.call @stack_push_pointer(%128) : (i64) -> ()
      %132 = llvm.mlir.addressof @str18 : !llvm.ptr
      %133 = arith.constant 29 : i64
      %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
      %135 = llvm.mlir.addressof @str19 : !llvm.ptr
      %136 = arith.constant 4 : i64
      %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
      %138 = func.call @cc_intern(%134, %137) : (i64, i64) -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
      %141 = func.call @cc_values_pack(%140) : (i64) -> i64
      func.call @stack_push_pointer(%138) : (i64) -> ()
      %142 = llvm.mlir.addressof @str20 : !llvm.ptr
      %143 = arith.constant 18 : i64
      %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
      %145 = llvm.mlir.addressof @str21 : !llvm.ptr
      %146 = arith.constant 4 : i64
      %147 = func.call @cc_make_string(%145, %146) : (!llvm.ptr, i64) -> i64
      %148 = func.call @cc_intern(%144, %147) : (i64, i64) -> i64
      %149 = func.call @cc_nil_value() : () -> i64
      %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
      %151 = func.call @cc_values_pack(%150) : (i64) -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      %152 = llvm.mlir.addressof @str22 : !llvm.ptr
      %153 = arith.constant 23 : i64
      %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
      %155 = llvm.mlir.addressof @str23 : !llvm.ptr
      %156 = arith.constant 4 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = func.call @cc_intern(%154, %157) : (i64, i64) -> i64
      %159 = func.call @cc_nil_value() : () -> i64
      %160 = func.call @cc_cons(%158, %159) : (i64, i64) -> i64
      %161 = func.call @cc_values_pack(%160) : (i64) -> i64
      func.call @stack_push_pointer(%158) : (i64) -> ()
      %162 = llvm.mlir.addressof @str24 : !llvm.ptr
      %163 = arith.constant 25 : i64
      %164 = func.call @cc_make_string(%162, %163) : (!llvm.ptr, i64) -> i64
      %165 = llvm.mlir.addressof @str25 : !llvm.ptr
      %166 = arith.constant 4 : i64
      %167 = func.call @cc_make_string(%165, %166) : (!llvm.ptr, i64) -> i64
      %168 = func.call @cc_intern(%164, %167) : (i64, i64) -> i64
      %169 = func.call @cc_nil_value() : () -> i64
      %170 = func.call @cc_cons(%168, %169) : (i64, i64) -> i64
      %171 = func.call @cc_values_pack(%170) : (i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %172 = llvm.mlir.addressof @str26 : !llvm.ptr
      %173 = arith.constant 17 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = llvm.mlir.addressof @str27 : !llvm.ptr
      %176 = arith.constant 4 : i64
      %177 = func.call @cc_make_string(%175, %176) : (!llvm.ptr, i64) -> i64
      %178 = func.call @cc_intern(%174, %177) : (i64, i64) -> i64
      %179 = func.call @cc_nil_value() : () -> i64
      %180 = func.call @cc_cons(%178, %179) : (i64, i64) -> i64
      %181 = func.call @cc_values_pack(%180) : (i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %182 = llvm.mlir.addressof @str28 : !llvm.ptr
      %183 = arith.constant 21 : i64
      %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
      %185 = llvm.mlir.addressof @str29 : !llvm.ptr
      %186 = arith.constant 4 : i64
      %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
      %188 = func.call @cc_intern(%184, %187) : (i64, i64) -> i64
      %189 = func.call @cc_nil_value() : () -> i64
      %190 = func.call @cc_cons(%188, %189) : (i64, i64) -> i64
      %191 = func.call @cc_values_pack(%190) : (i64) -> i64
      func.call @stack_push_pointer(%188) : (i64) -> ()
      %192 = llvm.mlir.addressof @str30 : !llvm.ptr
      %193 = arith.constant 15 : i64
      %194 = func.call @cc_make_string(%192, %193) : (!llvm.ptr, i64) -> i64
      %195 = llvm.mlir.addressof @str31 : !llvm.ptr
      %196 = arith.constant 4 : i64
      %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
      %198 = func.call @cc_intern(%194, %197) : (i64, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_cons(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_values_pack(%200) : (i64) -> i64
      func.call @stack_push_pointer(%198) : (i64) -> ()
      %202 = llvm.mlir.addressof @str32 : !llvm.ptr
      %203 = arith.constant 11 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = llvm.mlir.addressof @str33 : !llvm.ptr
      %206 = arith.constant 4 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %212 = llvm.mlir.addressof @str34 : !llvm.ptr
      %213 = arith.constant 40 : i64
      %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
      %215 = llvm.mlir.addressof @str35 : !llvm.ptr
      %216 = arith.constant 4 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_intern(%214, %217) : (i64, i64) -> i64
      %219 = func.call @cc_nil_value() : () -> i64
      %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      func.call @stack_push_pointer(%218) : (i64) -> ()
      %222 = llvm.mlir.addressof @str36 : !llvm.ptr
      %223 = arith.constant 29 : i64
      %224 = func.call @cc_make_string(%222, %223) : (!llvm.ptr, i64) -> i64
      %225 = llvm.mlir.addressof @str37 : !llvm.ptr
      %226 = arith.constant 4 : i64
      %227 = func.call @cc_make_string(%225, %226) : (!llvm.ptr, i64) -> i64
      %228 = func.call @cc_intern(%224, %227) : (i64, i64) -> i64
      %229 = func.call @cc_nil_value() : () -> i64
      %230 = func.call @cc_cons(%228, %229) : (i64, i64) -> i64
      %231 = func.call @cc_values_pack(%230) : (i64) -> i64
      func.call @stack_push_pointer(%228) : (i64) -> ()
      %232 = llvm.mlir.addressof @str38 : !llvm.ptr
      %233 = arith.constant 31 : i64
      %234 = func.call @cc_make_string(%232, %233) : (!llvm.ptr, i64) -> i64
      %235 = llvm.mlir.addressof @str39 : !llvm.ptr
      %236 = arith.constant 4 : i64
      %237 = func.call @cc_make_string(%235, %236) : (!llvm.ptr, i64) -> i64
      %238 = func.call @cc_intern(%234, %237) : (i64, i64) -> i64
      %239 = func.call @cc_nil_value() : () -> i64
      %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
      %241 = func.call @cc_values_pack(%240) : (i64) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %242 = llvm.mlir.addressof @str40 : !llvm.ptr
      %243 = arith.constant 24 : i64
      %244 = func.call @cc_make_string(%242, %243) : (!llvm.ptr, i64) -> i64
      %245 = llvm.mlir.addressof @str41 : !llvm.ptr
      %246 = arith.constant 4 : i64
      %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
      %248 = func.call @cc_intern(%244, %247) : (i64, i64) -> i64
      %249 = func.call @cc_nil_value() : () -> i64
      %250 = func.call @cc_cons(%248, %249) : (i64, i64) -> i64
      %251 = func.call @cc_values_pack(%250) : (i64) -> i64
      func.call @stack_push_pointer(%248) : (i64) -> ()
      %252 = llvm.mlir.addressof @str42 : !llvm.ptr
      %253 = arith.constant 33 : i64
      %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
      %255 = llvm.mlir.addressof @str43 : !llvm.ptr
      %256 = arith.constant 4 : i64
      %257 = func.call @cc_make_string(%255, %256) : (!llvm.ptr, i64) -> i64
      %258 = func.call @cc_intern(%254, %257) : (i64, i64) -> i64
      %259 = func.call @cc_nil_value() : () -> i64
      %260 = func.call @cc_cons(%258, %259) : (i64, i64) -> i64
      %261 = func.call @cc_values_pack(%260) : (i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      %262 = llvm.mlir.addressof @str44 : !llvm.ptr
      %263 = arith.constant 13 : i64
      %264 = func.call @cc_make_string(%262, %263) : (!llvm.ptr, i64) -> i64
      %265 = llvm.mlir.addressof @str45 : !llvm.ptr
      %266 = arith.constant 4 : i64
      %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
      %268 = func.call @cc_intern(%264, %267) : (i64, i64) -> i64
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
      %271 = func.call @cc_values_pack(%270) : (i64) -> i64
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %272 = llvm.mlir.addressof @str46 : !llvm.ptr
      %273 = arith.constant 28 : i64
      %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
      %275 = llvm.mlir.addressof @str47 : !llvm.ptr
      %276 = arith.constant 4 : i64
      %277 = func.call @cc_make_string(%275, %276) : (!llvm.ptr, i64) -> i64
      %278 = func.call @cc_intern(%274, %277) : (i64, i64) -> i64
      %279 = func.call @cc_nil_value() : () -> i64
      %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
      %281 = func.call @cc_values_pack(%280) : (i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %282 = llvm.mlir.addressof @str48 : !llvm.ptr
      %283 = arith.constant 31 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = llvm.mlir.addressof @str49 : !llvm.ptr
      %286 = arith.constant 4 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = func.call @cc_intern(%284, %287) : (i64, i64) -> i64
      %289 = func.call @cc_nil_value() : () -> i64
      %290 = func.call @cc_cons(%288, %289) : (i64, i64) -> i64
      %291 = func.call @cc_values_pack(%290) : (i64) -> i64
      func.call @stack_push_pointer(%288) : (i64) -> ()
      %292 = llvm.mlir.addressof @str50 : !llvm.ptr
      %293 = arith.constant 24 : i64
      %294 = func.call @cc_make_string(%292, %293) : (!llvm.ptr, i64) -> i64
      %295 = llvm.mlir.addressof @str51 : !llvm.ptr
      %296 = arith.constant 4 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = func.call @cc_intern(%294, %297) : (i64, i64) -> i64
      %299 = func.call @cc_nil_value() : () -> i64
      %300 = func.call @cc_cons(%298, %299) : (i64, i64) -> i64
      %301 = func.call @cc_values_pack(%300) : (i64) -> i64
      func.call @stack_push_pointer(%298) : (i64) -> ()
      %302 = llvm.mlir.addressof @str52 : !llvm.ptr
      %303 = arith.constant 35 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = llvm.mlir.addressof @str53 : !llvm.ptr
      %306 = arith.constant 4 : i64
      %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
      %308 = func.call @cc_intern(%304, %307) : (i64, i64) -> i64
      %309 = func.call @cc_nil_value() : () -> i64
      %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
      %311 = func.call @cc_values_pack(%310) : (i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %312 = llvm.mlir.addressof @str54 : !llvm.ptr
      %313 = arith.constant 20 : i64
      %314 = func.call @cc_make_string(%312, %313) : (!llvm.ptr, i64) -> i64
      %315 = llvm.mlir.addressof @str55 : !llvm.ptr
      %316 = arith.constant 4 : i64
      %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
      %318 = func.call @cc_intern(%314, %317) : (i64, i64) -> i64
      %319 = func.call @cc_nil_value() : () -> i64
      %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
      %321 = func.call @cc_values_pack(%320) : (i64) -> i64
      func.call @stack_push_pointer(%318) : (i64) -> ()
      %322 = llvm.mlir.addressof @str56 : !llvm.ptr
      %323 = arith.constant 23 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      %325 = llvm.mlir.addressof @str57 : !llvm.ptr
      %326 = arith.constant 4 : i64
      %327 = func.call @cc_make_string(%325, %326) : (!llvm.ptr, i64) -> i64
      %328 = func.call @cc_intern(%324, %327) : (i64, i64) -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_cons(%328, %329) : (i64, i64) -> i64
      %331 = func.call @cc_values_pack(%330) : (i64) -> i64
      func.call @stack_push_pointer(%328) : (i64) -> ()
      %332 = llvm.mlir.addressof @str58 : !llvm.ptr
      %333 = arith.constant 42 : i64
      %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
      %335 = llvm.mlir.addressof @str59 : !llvm.ptr
      %336 = arith.constant 4 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = func.call @cc_intern(%334, %337) : (i64, i64) -> i64
      %339 = func.call @cc_nil_value() : () -> i64
      %340 = func.call @cc_cons(%338, %339) : (i64, i64) -> i64
      %341 = func.call @cc_values_pack(%340) : (i64) -> i64
      func.call @stack_push_pointer(%338) : (i64) -> ()
      %342 = llvm.mlir.addressof @str60 : !llvm.ptr
      %343 = arith.constant 28 : i64
      %344 = func.call @cc_make_string(%342, %343) : (!llvm.ptr, i64) -> i64
      %345 = llvm.mlir.addressof @str61 : !llvm.ptr
      %346 = arith.constant 4 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      %348 = func.call @cc_intern(%344, %347) : (i64, i64) -> i64
      %349 = func.call @cc_nil_value() : () -> i64
      %350 = func.call @cc_cons(%348, %349) : (i64, i64) -> i64
      %351 = func.call @cc_values_pack(%350) : (i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %352 = llvm.mlir.addressof @str62 : !llvm.ptr
      %353 = arith.constant 29 : i64
      %354 = func.call @cc_make_string(%352, %353) : (!llvm.ptr, i64) -> i64
      %355 = llvm.mlir.addressof @str63 : !llvm.ptr
      %356 = arith.constant 4 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = func.call @cc_intern(%354, %357) : (i64, i64) -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_cons(%358, %359) : (i64, i64) -> i64
      %361 = func.call @cc_values_pack(%360) : (i64) -> i64
      func.call @stack_push_pointer(%358) : (i64) -> ()
      %362 = llvm.mlir.addressof @str64 : !llvm.ptr
      %363 = arith.constant 35 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = llvm.mlir.addressof @str65 : !llvm.ptr
      %366 = arith.constant 4 : i64
      %367 = func.call @cc_make_string(%365, %366) : (!llvm.ptr, i64) -> i64
      %368 = func.call @cc_intern(%364, %367) : (i64, i64) -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_cons(%368, %369) : (i64, i64) -> i64
      %371 = func.call @cc_values_pack(%370) : (i64) -> i64
      func.call @stack_push_pointer(%368) : (i64) -> ()
      %372 = llvm.mlir.addressof @str66 : !llvm.ptr
      %373 = arith.constant 24 : i64
      %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
      %375 = llvm.mlir.addressof @str67 : !llvm.ptr
      %376 = arith.constant 4 : i64
      %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
      %378 = func.call @cc_intern(%374, %377) : (i64, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_values_pack(%380) : (i64) -> i64
      func.call @stack_push_pointer(%378) : (i64) -> ()
      %382 = llvm.mlir.addressof @str68 : !llvm.ptr
      %383 = arith.constant 21 : i64
      %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
      %385 = llvm.mlir.addressof @str69 : !llvm.ptr
      %386 = arith.constant 4 : i64
      %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
      %388 = func.call @cc_intern(%384, %387) : (i64, i64) -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
      %391 = func.call @cc_values_pack(%390) : (i64) -> i64
      func.call @stack_push_pointer(%388) : (i64) -> ()
      %392 = llvm.mlir.addressof @str70 : !llvm.ptr
      %393 = arith.constant 18 : i64
      %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
      %395 = llvm.mlir.addressof @str71 : !llvm.ptr
      %396 = arith.constant 4 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = func.call @cc_intern(%394, %397) : (i64, i64) -> i64
      %399 = func.call @cc_nil_value() : () -> i64
      %400 = func.call @cc_cons(%398, %399) : (i64, i64) -> i64
      %401 = func.call @cc_values_pack(%400) : (i64) -> i64
      func.call @stack_push_pointer(%398) : (i64) -> ()
      %402 = llvm.mlir.addressof @str72 : !llvm.ptr
      %403 = arith.constant 14 : i64
      %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
      %405 = llvm.mlir.addressof @str73 : !llvm.ptr
      %406 = arith.constant 4 : i64
      %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
      %408 = func.call @cc_intern(%404, %407) : (i64, i64) -> i64
      %409 = func.call @cc_nil_value() : () -> i64
      %410 = func.call @cc_cons(%408, %409) : (i64, i64) -> i64
      %411 = func.call @cc_values_pack(%410) : (i64) -> i64
      func.call @stack_push_pointer(%408) : (i64) -> ()
      %412 = llvm.mlir.addressof @str74 : !llvm.ptr
      %413 = arith.constant 15 : i64
      %414 = func.call @cc_make_string(%412, %413) : (!llvm.ptr, i64) -> i64
      %415 = llvm.mlir.addressof @str75 : !llvm.ptr
      %416 = arith.constant 4 : i64
      %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
      %418 = func.call @cc_intern(%414, %417) : (i64, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_values_pack(%420) : (i64) -> i64
      func.call @stack_push_pointer(%418) : (i64) -> ()
      %422 = llvm.mlir.addressof @str76 : !llvm.ptr
      %423 = arith.constant 23 : i64
      %424 = func.call @cc_make_string(%422, %423) : (!llvm.ptr, i64) -> i64
      %425 = llvm.mlir.addressof @str77 : !llvm.ptr
      %426 = arith.constant 4 : i64
      %427 = func.call @cc_make_string(%425, %426) : (!llvm.ptr, i64) -> i64
      %428 = func.call @cc_intern(%424, %427) : (i64, i64) -> i64
      %429 = func.call @cc_nil_value() : () -> i64
      %430 = func.call @cc_cons(%428, %429) : (i64, i64) -> i64
      %431 = func.call @cc_values_pack(%430) : (i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      %432 = llvm.mlir.addressof @str78 : !llvm.ptr
      %433 = arith.constant 18 : i64
      %434 = func.call @cc_make_string(%432, %433) : (!llvm.ptr, i64) -> i64
      %435 = llvm.mlir.addressof @str79 : !llvm.ptr
      %436 = arith.constant 4 : i64
      %437 = func.call @cc_make_string(%435, %436) : (!llvm.ptr, i64) -> i64
      %438 = func.call @cc_intern(%434, %437) : (i64, i64) -> i64
      %439 = func.call @cc_nil_value() : () -> i64
      %440 = func.call @cc_cons(%438, %439) : (i64, i64) -> i64
      %441 = func.call @cc_values_pack(%440) : (i64) -> i64
      func.call @stack_push_pointer(%438) : (i64) -> ()
      %442 = llvm.mlir.addressof @str80 : !llvm.ptr
      %443 = arith.constant 19 : i64
      %444 = func.call @cc_make_string(%442, %443) : (!llvm.ptr, i64) -> i64
      %445 = llvm.mlir.addressof @str81 : !llvm.ptr
      %446 = arith.constant 4 : i64
      %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
      %448 = func.call @cc_intern(%444, %447) : (i64, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_cons(%448, %449) : (i64, i64) -> i64
      %451 = func.call @cc_values_pack(%450) : (i64) -> i64
      func.call @stack_push_pointer(%448) : (i64) -> ()
      %452 = llvm.mlir.addressof @str82 : !llvm.ptr
      %453 = arith.constant 17 : i64
      %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
      %455 = llvm.mlir.addressof @str83 : !llvm.ptr
      %456 = arith.constant 4 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = func.call @cc_intern(%454, %457) : (i64, i64) -> i64
      %459 = func.call @cc_nil_value() : () -> i64
      %460 = func.call @cc_cons(%458, %459) : (i64, i64) -> i64
      %461 = func.call @cc_values_pack(%460) : (i64) -> i64
      func.call @stack_push_pointer(%458) : (i64) -> ()
      %462 = llvm.mlir.addressof @str84 : !llvm.ptr
      %463 = arith.constant 26 : i64
      %464 = func.call @cc_make_string(%462, %463) : (!llvm.ptr, i64) -> i64
      %465 = llvm.mlir.addressof @str85 : !llvm.ptr
      %466 = arith.constant 4 : i64
      %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
      %468 = func.call @cc_intern(%464, %467) : (i64, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_cons(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_values_pack(%470) : (i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %472 = llvm.mlir.addressof @str86 : !llvm.ptr
      %473 = arith.constant 28 : i64
      %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
      %475 = llvm.mlir.addressof @str87 : !llvm.ptr
      %476 = arith.constant 4 : i64
      %477 = func.call @cc_make_string(%475, %476) : (!llvm.ptr, i64) -> i64
      %478 = func.call @cc_intern(%474, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %482 = llvm.mlir.addressof @str88 : !llvm.ptr
      %483 = arith.constant 24 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = llvm.mlir.addressof @str89 : !llvm.ptr
      %486 = arith.constant 4 : i64
      %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
      %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %492 = llvm.mlir.addressof @str90 : !llvm.ptr
      %493 = arith.constant 20 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = llvm.mlir.addressof @str91 : !llvm.ptr
      %496 = arith.constant 4 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = func.call @cc_intern(%494, %497) : (i64, i64) -> i64
      %499 = func.call @cc_nil_value() : () -> i64
      %500 = func.call @cc_cons(%498, %499) : (i64, i64) -> i64
      %501 = func.call @cc_values_pack(%500) : (i64) -> i64
      func.call @stack_push_pointer(%498) : (i64) -> ()
      %502 = llvm.mlir.addressof @str92 : !llvm.ptr
      %503 = arith.constant 20 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = llvm.mlir.addressof @str93 : !llvm.ptr
      %506 = arith.constant 4 : i64
      %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
      %508 = func.call @cc_intern(%504, %507) : (i64, i64) -> i64
      %509 = func.call @cc_nil_value() : () -> i64
      %510 = func.call @cc_cons(%508, %509) : (i64, i64) -> i64
      %511 = func.call @cc_values_pack(%510) : (i64) -> i64
      func.call @stack_push_pointer(%508) : (i64) -> ()
      %512 = llvm.mlir.addressof @str94 : !llvm.ptr
      %513 = arith.constant 23 : i64
      %514 = func.call @cc_make_string(%512, %513) : (!llvm.ptr, i64) -> i64
      %515 = llvm.mlir.addressof @str95 : !llvm.ptr
      %516 = arith.constant 4 : i64
      %517 = func.call @cc_make_string(%515, %516) : (!llvm.ptr, i64) -> i64
      %518 = func.call @cc_intern(%514, %517) : (i64, i64) -> i64
      %519 = func.call @cc_nil_value() : () -> i64
      %520 = func.call @cc_cons(%518, %519) : (i64, i64) -> i64
      %521 = func.call @cc_values_pack(%520) : (i64) -> i64
      func.call @stack_push_pointer(%518) : (i64) -> ()
      %522 = llvm.mlir.addressof @str96 : !llvm.ptr
      %523 = arith.constant 23 : i64
      %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
      %525 = llvm.mlir.addressof @str97 : !llvm.ptr
      %526 = arith.constant 4 : i64
      %527 = func.call @cc_make_string(%525, %526) : (!llvm.ptr, i64) -> i64
      %528 = func.call @cc_intern(%524, %527) : (i64, i64) -> i64
      %529 = func.call @cc_nil_value() : () -> i64
      %530 = func.call @cc_cons(%528, %529) : (i64, i64) -> i64
      %531 = func.call @cc_values_pack(%530) : (i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      %532 = llvm.mlir.addressof @str98 : !llvm.ptr
      %533 = arith.constant 24 : i64
      %534 = func.call @cc_make_string(%532, %533) : (!llvm.ptr, i64) -> i64
      %535 = llvm.mlir.addressof @str99 : !llvm.ptr
      %536 = arith.constant 4 : i64
      %537 = func.call @cc_make_string(%535, %536) : (!llvm.ptr, i64) -> i64
      %538 = func.call @cc_intern(%534, %537) : (i64, i64) -> i64
      %539 = func.call @cc_nil_value() : () -> i64
      %540 = func.call @cc_cons(%538, %539) : (i64, i64) -> i64
      %541 = func.call @cc_values_pack(%540) : (i64) -> i64
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %542 = llvm.mlir.addressof @str100 : !llvm.ptr
      %543 = arith.constant 19 : i64
      %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
      %545 = llvm.mlir.addressof @str101 : !llvm.ptr
      %546 = arith.constant 4 : i64
      %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
      %548 = func.call @cc_intern(%544, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      %552 = llvm.mlir.addressof @str102 : !llvm.ptr
      %553 = arith.constant 16 : i64
      %554 = func.call @cc_make_string(%552, %553) : (!llvm.ptr, i64) -> i64
      %555 = llvm.mlir.addressof @str103 : !llvm.ptr
      %556 = arith.constant 4 : i64
      %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
      %558 = func.call @cc_intern(%554, %557) : (i64, i64) -> i64
      %559 = func.call @cc_nil_value() : () -> i64
      %560 = func.call @cc_cons(%558, %559) : (i64, i64) -> i64
      %561 = func.call @cc_values_pack(%560) : (i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %562 = llvm.mlir.addressof @str104 : !llvm.ptr
      %563 = arith.constant 20 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = llvm.mlir.addressof @str105 : !llvm.ptr
      %566 = arith.constant 4 : i64
      %567 = func.call @cc_make_string(%565, %566) : (!llvm.ptr, i64) -> i64
      %568 = func.call @cc_intern(%564, %567) : (i64, i64) -> i64
      %569 = func.call @cc_nil_value() : () -> i64
      %570 = func.call @cc_cons(%568, %569) : (i64, i64) -> i64
      %571 = func.call @cc_values_pack(%570) : (i64) -> i64
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %572 = llvm.mlir.addressof @str106 : !llvm.ptr
      %573 = arith.constant 22 : i64
      %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
      %575 = llvm.mlir.addressof @str107 : !llvm.ptr
      %576 = arith.constant 4 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_intern(%574, %577) : (i64, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_cons(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_values_pack(%580) : (i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      %582 = llvm.mlir.addressof @str108 : !llvm.ptr
      %583 = arith.constant 4 : i64
      %584 = func.call @cc_make_string(%582, %583) : (!llvm.ptr, i64) -> i64
      %585 = llvm.mlir.addressof @str109 : !llvm.ptr
      %586 = arith.constant 11 : i64
      %587 = func.call @cc_make_string(%585, %586) : (!llvm.ptr, i64) -> i64
      %588 = func.call @cc_intern(%584, %587) : (i64, i64) -> i64
      %589 = func.call @cc_nil_value() : () -> i64
      %590 = func.call @cc_cons(%588, %589) : (i64, i64) -> i64
      %591 = func.call @cc_values_pack(%590) : (i64) -> i64
      func.call @stack_push_pointer(%588) : (i64) -> ()
      %592 = llvm.mlir.addressof @str110 : !llvm.ptr
      %593 = arith.constant 21 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = llvm.mlir.addressof @str111 : !llvm.ptr
      %596 = arith.constant 4 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = func.call @cc_intern(%594, %597) : (i64, i64) -> i64
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_cons(%598, %599) : (i64, i64) -> i64
      %601 = func.call @cc_values_pack(%600) : (i64) -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %602 = func.call @stack_pop_pointer() : () -> i64
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @cc_cons(%603, %602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %605 = arith.addi %604, %__rlasp_stack_elide_zero_3 : i64
      %606 = func.call @stack_pop_pointer() : () -> i64
      %607 = func.call @cc_cons(%606, %605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%607) : (i64) -> ()
      %608 = llvm.mlir.addressof @str112 : !llvm.ptr
      %609 = arith.constant 4 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = llvm.mlir.addressof @str113 : !llvm.ptr
      %612 = arith.constant 11 : i64
      %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
      %614 = func.call @cc_intern(%610, %613) : (i64, i64) -> i64
      %615 = func.call @cc_nil_value() : () -> i64
      %616 = func.call @cc_cons(%614, %615) : (i64, i64) -> i64
      %617 = func.call @cc_values_pack(%616) : (i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %618 = llvm.mlir.addressof @str114 : !llvm.ptr
      %619 = arith.constant 22 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = llvm.mlir.addressof @str115 : !llvm.ptr
      %622 = arith.constant 4 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = func.call @cc_intern(%620, %623) : (i64, i64) -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      %627 = func.call @cc_values_pack(%626) : (i64) -> i64
      func.call @stack_push_pointer(%624) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @stack_pop_pointer() : () -> i64
      %630 = func.call @cc_cons(%629, %628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %631 = arith.addi %630, %__rlasp_stack_elide_zero_4 : i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%632, %631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
      %634 = llvm.mlir.addressof @str116 : !llvm.ptr
      %635 = arith.constant 23 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = llvm.mlir.addressof @str117 : !llvm.ptr
      %638 = arith.constant 4 : i64
      %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
      %640 = func.call @cc_intern(%636, %639) : (i64, i64) -> i64
      %641 = func.call @cc_nil_value() : () -> i64
      %642 = func.call @cc_cons(%640, %641) : (i64, i64) -> i64
      %643 = func.call @cc_values_pack(%642) : (i64) -> i64
      func.call @stack_push_pointer(%640) : (i64) -> ()
      %644 = llvm.mlir.addressof @str118 : !llvm.ptr
      %645 = arith.constant 27 : i64
      %646 = func.call @cc_make_string(%644, %645) : (!llvm.ptr, i64) -> i64
      %647 = llvm.mlir.addressof @str119 : !llvm.ptr
      %648 = arith.constant 4 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_intern(%646, %649) : (i64, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_values_pack(%652) : (i64) -> i64
      func.call @stack_push_pointer(%650) : (i64) -> ()
      %654 = llvm.mlir.addressof @str120 : !llvm.ptr
      %655 = arith.constant 22 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = llvm.mlir.addressof @str121 : !llvm.ptr
      %658 = arith.constant 4 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_intern(%656, %659) : (i64, i64) -> i64
      %661 = func.call @cc_nil_value() : () -> i64
      %662 = func.call @cc_cons(%660, %661) : (i64, i64) -> i64
      %663 = func.call @cc_values_pack(%662) : (i64) -> i64
      func.call @stack_push_pointer(%660) : (i64) -> ()
      %664 = llvm.mlir.addressof @str122 : !llvm.ptr
      %665 = arith.constant 36 : i64
      %666 = func.call @cc_make_string(%664, %665) : (!llvm.ptr, i64) -> i64
      %667 = llvm.mlir.addressof @str123 : !llvm.ptr
      %668 = arith.constant 4 : i64
      %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
      %670 = func.call @cc_intern(%666, %669) : (i64, i64) -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
      %673 = func.call @cc_values_pack(%672) : (i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %674 = llvm.mlir.addressof @str124 : !llvm.ptr
      %675 = arith.constant 26 : i64
      %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
      %677 = llvm.mlir.addressof @str125 : !llvm.ptr
      %678 = arith.constant 4 : i64
      %679 = func.call @cc_make_string(%677, %678) : (!llvm.ptr, i64) -> i64
      %680 = func.call @cc_intern(%676, %679) : (i64, i64) -> i64
      %681 = func.call @cc_nil_value() : () -> i64
      %682 = func.call @cc_cons(%680, %681) : (i64, i64) -> i64
      %683 = func.call @cc_values_pack(%682) : (i64) -> i64
      func.call @stack_push_pointer(%680) : (i64) -> ()
      %684 = llvm.mlir.addressof @str126 : !llvm.ptr
      %685 = arith.constant 16 : i64
      %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
      %687 = llvm.mlir.addressof @str127 : !llvm.ptr
      %688 = arith.constant 4 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = func.call @cc_intern(%686, %689) : (i64, i64) -> i64
      %691 = func.call @cc_nil_value() : () -> i64
      %692 = func.call @cc_cons(%690, %691) : (i64, i64) -> i64
      %693 = func.call @cc_values_pack(%692) : (i64) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      %694 = llvm.mlir.addressof @str128 : !llvm.ptr
      %695 = arith.constant 19 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      %697 = llvm.mlir.addressof @str129 : !llvm.ptr
      %698 = arith.constant 4 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = func.call @cc_intern(%696, %699) : (i64, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_cons(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_values_pack(%702) : (i64) -> i64
      func.call @stack_push_pointer(%700) : (i64) -> ()
      %704 = llvm.mlir.addressof @str130 : !llvm.ptr
      %705 = arith.constant 19 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = llvm.mlir.addressof @str131 : !llvm.ptr
      %708 = arith.constant 4 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = func.call @cc_intern(%706, %709) : (i64, i64) -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_cons(%710, %711) : (i64, i64) -> i64
      %713 = func.call @cc_values_pack(%712) : (i64) -> i64
      func.call @stack_push_pointer(%710) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @cc_cons(%715, %714) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %717 = arith.addi %716, %__rlasp_stack_elide_zero_5 : i64
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @cc_cons(%718, %717) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %720 = arith.addi %719, %__rlasp_stack_elide_zero_6 : i64
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_cons(%721, %720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %723 = arith.addi %722, %__rlasp_stack_elide_zero_7 : i64
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @cc_cons(%724, %723) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %726 = arith.addi %725, %__rlasp_stack_elide_zero_8 : i64
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @cc_cons(%727, %726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %729 = arith.addi %728, %__rlasp_stack_elide_zero_9 : i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %732 = arith.addi %731, %__rlasp_stack_elide_zero_10 : i64
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @cc_cons(%733, %732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %735 = arith.addi %734, %__rlasp_stack_elide_zero_11 : i64
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @cc_cons(%736, %735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %738 = arith.addi %737, %__rlasp_stack_elide_zero_12 : i64
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @cc_cons(%739, %738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %741 = arith.addi %740, %__rlasp_stack_elide_zero_13 : i64
      %742 = func.call @stack_pop_pointer() : () -> i64
      %743 = func.call @cc_cons(%742, %741) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %744 = arith.addi %743, %__rlasp_stack_elide_zero_14 : i64
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @cc_cons(%745, %744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %747 = arith.addi %746, %__rlasp_stack_elide_zero_15 : i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%748, %747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %750 = arith.addi %749, %__rlasp_stack_elide_zero_16 : i64
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_cons(%751, %750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %753 = arith.addi %752, %__rlasp_stack_elide_zero_17 : i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%754, %753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %756 = arith.addi %755, %__rlasp_stack_elide_zero_18 : i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%757, %756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %759 = arith.addi %758, %__rlasp_stack_elide_zero_19 : i64
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @cc_cons(%760, %759) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %762 = arith.addi %761, %__rlasp_stack_elide_zero_20 : i64
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @cc_cons(%763, %762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %765 = arith.addi %764, %__rlasp_stack_elide_zero_21 : i64
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @cc_cons(%766, %765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %768 = arith.addi %767, %__rlasp_stack_elide_zero_22 : i64
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @cc_cons(%769, %768) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %771 = arith.addi %770, %__rlasp_stack_elide_zero_23 : i64
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @cc_cons(%772, %771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %774 = arith.addi %773, %__rlasp_stack_elide_zero_24 : i64
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @cc_cons(%775, %774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %777 = arith.addi %776, %__rlasp_stack_elide_zero_25 : i64
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @cc_cons(%778, %777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %780 = arith.addi %779, %__rlasp_stack_elide_zero_26 : i64
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = func.call @cc_cons(%781, %780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %783 = arith.addi %782, %__rlasp_stack_elide_zero_27 : i64
      %784 = func.call @stack_pop_pointer() : () -> i64
      %785 = func.call @cc_cons(%784, %783) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %786 = arith.addi %785, %__rlasp_stack_elide_zero_28 : i64
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @cc_cons(%787, %786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %789 = arith.addi %788, %__rlasp_stack_elide_zero_29 : i64
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @cc_cons(%790, %789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %792 = arith.addi %791, %__rlasp_stack_elide_zero_30 : i64
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @cc_cons(%793, %792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %795 = arith.addi %794, %__rlasp_stack_elide_zero_31 : i64
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @cc_cons(%796, %795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %798 = arith.addi %797, %__rlasp_stack_elide_zero_32 : i64
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @cc_cons(%799, %798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %801 = arith.addi %800, %__rlasp_stack_elide_zero_33 : i64
      %802 = func.call @stack_pop_pointer() : () -> i64
      %803 = func.call @cc_cons(%802, %801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %804 = arith.addi %803, %__rlasp_stack_elide_zero_34 : i64
      %805 = func.call @stack_pop_pointer() : () -> i64
      %806 = func.call @cc_cons(%805, %804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %807 = arith.addi %806, %__rlasp_stack_elide_zero_35 : i64
      %808 = func.call @stack_pop_pointer() : () -> i64
      %809 = func.call @cc_cons(%808, %807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %810 = arith.addi %809, %__rlasp_stack_elide_zero_36 : i64
      %811 = func.call @stack_pop_pointer() : () -> i64
      %812 = func.call @cc_cons(%811, %810) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %813 = arith.addi %812, %__rlasp_stack_elide_zero_37 : i64
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @cc_cons(%814, %813) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %816 = arith.addi %815, %__rlasp_stack_elide_zero_38 : i64
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @cc_cons(%817, %816) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %819 = arith.addi %818, %__rlasp_stack_elide_zero_39 : i64
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @cc_cons(%820, %819) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %822 = arith.addi %821, %__rlasp_stack_elide_zero_40 : i64
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @cc_cons(%823, %822) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %825 = arith.addi %824, %__rlasp_stack_elide_zero_41 : i64
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = func.call @cc_cons(%826, %825) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %828 = arith.addi %827, %__rlasp_stack_elide_zero_42 : i64
      %829 = func.call @stack_pop_pointer() : () -> i64
      %830 = func.call @cc_cons(%829, %828) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %831 = arith.addi %830, %__rlasp_stack_elide_zero_43 : i64
      %832 = func.call @stack_pop_pointer() : () -> i64
      %833 = func.call @cc_cons(%832, %831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %834 = arith.addi %833, %__rlasp_stack_elide_zero_44 : i64
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @cc_cons(%835, %834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %837 = arith.addi %836, %__rlasp_stack_elide_zero_45 : i64
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @cc_cons(%838, %837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %840 = arith.addi %839, %__rlasp_stack_elide_zero_46 : i64
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @cc_cons(%841, %840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %843 = arith.addi %842, %__rlasp_stack_elide_zero_47 : i64
      %844 = func.call @stack_pop_pointer() : () -> i64
      %845 = func.call @cc_cons(%844, %843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %846 = arith.addi %845, %__rlasp_stack_elide_zero_48 : i64
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @cc_cons(%847, %846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %849 = arith.addi %848, %__rlasp_stack_elide_zero_49 : i64
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_cons(%850, %849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %852 = arith.addi %851, %__rlasp_stack_elide_zero_50 : i64
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @cc_cons(%853, %852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %855 = arith.addi %854, %__rlasp_stack_elide_zero_51 : i64
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @cc_cons(%856, %855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %858 = arith.addi %857, %__rlasp_stack_elide_zero_52 : i64
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @cc_cons(%859, %858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %861 = arith.addi %860, %__rlasp_stack_elide_zero_53 : i64
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @cc_cons(%862, %861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %864 = arith.addi %863, %__rlasp_stack_elide_zero_54 : i64
      %865 = func.call @stack_pop_pointer() : () -> i64
      %866 = func.call @cc_cons(%865, %864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %867 = arith.addi %866, %__rlasp_stack_elide_zero_55 : i64
      %868 = func.call @stack_pop_pointer() : () -> i64
      %869 = func.call @cc_cons(%868, %867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %870 = arith.addi %869, %__rlasp_stack_elide_zero_56 : i64
      %871 = func.call @stack_pop_pointer() : () -> i64
      %872 = func.call @cc_cons(%871, %870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %873 = arith.addi %872, %__rlasp_stack_elide_zero_57 : i64
      %874 = func.call @stack_pop_pointer() : () -> i64
      %875 = func.call @cc_cons(%874, %873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %876 = arith.addi %875, %__rlasp_stack_elide_zero_58 : i64
      %877 = func.call @stack_pop_pointer() : () -> i64
      %878 = func.call @cc_cons(%877, %876) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %879 = arith.addi %878, %__rlasp_stack_elide_zero_59 : i64
      %880 = func.call @stack_pop_pointer() : () -> i64
      %881 = func.call @cc_cons(%880, %879) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %882 = arith.addi %881, %__rlasp_stack_elide_zero_60 : i64
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @cc_cons(%883, %882) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %885 = arith.addi %884, %__rlasp_stack_elide_zero_61 : i64
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @cc_cons(%886, %885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %888 = arith.addi %887, %__rlasp_stack_elide_zero_62 : i64
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @cc_cons(%889, %888) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %891 = arith.addi %890, %__rlasp_stack_elide_zero_63 : i64
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @cc_cons(%892, %891) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %894 = arith.addi %893, %__rlasp_stack_elide_zero_64 : i64
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @cc_cons(%894, %895) : (i64, i64) -> i64
      %897 = llvm.mlir.addressof @str132 : !llvm.ptr
      %898 = arith.constant 5 : i64
      %899 = func.call @cc_make_string(%897, %898) : (!llvm.ptr, i64) -> i64
      %900 = func.call @cc_nil_value() : () -> i64
      %901 = func.call @cc_intern(%899, %900) : (i64, i64) -> i64
      %902 = func.call @cc_nil_value() : () -> i64
      %903 = func.call @cc_cons(%901, %902) : (i64, i64) -> i64
      %904 = func.call @cc_values_pack(%903) : (i64) -> i64
      %905 = func.call @cc_cons(%901, %896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %906 = func.call @stack_pop_pointer() : () -> i64
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @cc_cons(%907, %906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %909 = arith.addi %908, %__rlasp_stack_elide_zero_65 : i64
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @cc_cons(%910, %909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%911) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %912 = func.call @stack_pop_pointer() : () -> i64
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @cc_cons(%913, %912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %915 = llvm.mlir.addressof @str133 : !llvm.ptr
      %916 = arith.constant 4 : i64
      %917 = func.call @cc_make_string(%915, %916) : (!llvm.ptr, i64) -> i64
      %918 = func.call @cc_nil_value() : () -> i64
      %919 = func.call @cc_intern(%917, %918) : (i64, i64) -> i64
      %920 = func.call @cc_nil_value() : () -> i64
      %921 = func.call @cc_cons(%919, %920) : (i64, i64) -> i64
      %922 = func.call @cc_values_pack(%921) : (i64) -> i64
      func.call @stack_push_pointer(%919) : (i64) -> ()
      %923 = llvm.mlir.addressof @str134 : !llvm.ptr
      %924 = arith.constant 3 : i64
      %925 = func.call @cc_make_string(%923, %924) : (!llvm.ptr, i64) -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_intern(%925, %926) : (i64, i64) -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_cons(%927, %928) : (i64, i64) -> i64
      %930 = func.call @cc_values_pack(%929) : (i64) -> i64
      func.call @stack_push_pointer(%927) : (i64) -> ()
      %931 = llvm.mlir.addressof @str135 : !llvm.ptr
      %932 = arith.constant 1 : i64
      %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
      %934 = func.call @cc_nil_value() : () -> i64
      %935 = func.call @cc_intern(%933, %934) : (i64, i64) -> i64
      %936 = func.call @cc_nil_value() : () -> i64
      %937 = func.call @cc_cons(%935, %936) : (i64, i64) -> i64
      %938 = func.call @cc_values_pack(%937) : (i64) -> i64
      func.call @stack_push_pointer(%935) : (i64) -> ()
      %939 = llvm.mlir.addressof @str136 : !llvm.ptr
      %940 = arith.constant 2 : i64
      %941 = func.call @cc_make_string(%939, %940) : (!llvm.ptr, i64) -> i64
      %942 = func.call @cc_nil_value() : () -> i64
      %943 = func.call @cc_intern(%941, %942) : (i64, i64) -> i64
      %944 = func.call @cc_nil_value() : () -> i64
      %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
      %946 = func.call @cc_values_pack(%945) : (i64) -> i64
      func.call @stack_push_pointer(%943) : (i64) -> ()
      %947 = llvm.mlir.addressof @str137 : !llvm.ptr
      %948 = arith.constant 17 : i64
      %949 = func.call @cc_make_string(%947, %948) : (!llvm.ptr, i64) -> i64
      %950 = func.call @cc_nil_value() : () -> i64
      %951 = func.call @cc_intern(%949, %950) : (i64, i64) -> i64
      %952 = func.call @cc_nil_value() : () -> i64
      %953 = func.call @cc_cons(%951, %952) : (i64, i64) -> i64
      %954 = func.call @cc_values_pack(%953) : (i64) -> i64
      func.call @stack_push_pointer(%951) : (i64) -> ()
      %955 = llvm.mlir.addressof @str138 : !llvm.ptr
      %956 = arith.constant 6 : i64
      %957 = func.call @cc_make_string(%955, %956) : (!llvm.ptr, i64) -> i64
      %958 = llvm.mlir.addressof @str139 : !llvm.ptr
      %959 = arith.constant 11 : i64
      %960 = func.call @cc_make_string(%958, %959) : (!llvm.ptr, i64) -> i64
      %961 = func.call @cc_intern(%957, %960) : (i64, i64) -> i64
      %962 = func.call @cc_nil_value() : () -> i64
      %963 = func.call @cc_cons(%961, %962) : (i64, i64) -> i64
      %964 = func.call @cc_values_pack(%963) : (i64) -> i64
      func.call @stack_push_pointer(%961) : (i64) -> ()
      %965 = llvm.mlir.addressof @str140 : !llvm.ptr
      %966 = arith.constant 3 : i64
      %967 = func.call @cc_make_string(%965, %966) : (!llvm.ptr, i64) -> i64
      %968 = llvm.mlir.addressof @str141 : !llvm.ptr
      %969 = arith.constant 11 : i64
      %970 = func.call @cc_make_string(%968, %969) : (!llvm.ptr, i64) -> i64
      %971 = func.call @cc_intern(%967, %970) : (i64, i64) -> i64
      %972 = func.call @cc_nil_value() : () -> i64
      %973 = func.call @cc_cons(%971, %972) : (i64, i64) -> i64
      %974 = func.call @cc_values_pack(%973) : (i64) -> i64
      func.call @stack_push_pointer(%971) : (i64) -> ()
      %975 = llvm.mlir.addressof @str142 : !llvm.ptr
      %976 = arith.constant 7 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = llvm.mlir.addressof @str143 : !llvm.ptr
      %979 = arith.constant 11 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_intern(%977, %980) : (i64, i64) -> i64
      %982 = func.call @cc_nil_value() : () -> i64
      %983 = func.call @cc_cons(%981, %982) : (i64, i64) -> i64
      %984 = func.call @cc_values_pack(%983) : (i64) -> i64
      func.call @stack_push_pointer(%981) : (i64) -> ()
      %985 = llvm.mlir.addressof @str144 : !llvm.ptr
      %986 = arith.constant 1 : i64
      %987 = func.call @cc_make_string(%985, %986) : (!llvm.ptr, i64) -> i64
      %988 = func.call @cc_nil_value() : () -> i64
      %989 = func.call @cc_intern(%987, %988) : (i64, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_cons(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_values_pack(%991) : (i64) -> i64
      func.call @stack_push_pointer(%989) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @stack_pop_pointer() : () -> i64
      %995 = func.call @cc_cons(%994, %993) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %996 = arith.addi %995, %__rlasp_stack_elide_zero_66 : i64
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = func.call @cc_cons(%997, %996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%998) : (i64) -> ()
      %999 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1000 = arith.constant 5 : i64
      %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
      %1002 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1003 = arith.constant 11 : i64
      %1004 = func.call @cc_make_string(%1002, %1003) : (!llvm.ptr, i64) -> i64
      %1005 = func.call @cc_intern(%1001, %1004) : (i64, i64) -> i64
      %1006 = func.call @cc_nil_value() : () -> i64
      %1007 = func.call @cc_cons(%1005, %1006) : (i64, i64) -> i64
      %1008 = func.call @cc_values_pack(%1007) : (i64) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1009 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1010 = arith.constant 11 : i64
      %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
      %1012 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1013 = arith.constant 11 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = func.call @cc_intern(%1011, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1019 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1020 = arith.constant 1 : i64
      %1021 = func.call @cc_make_string(%1019, %1020) : (!llvm.ptr, i64) -> i64
      %1022 = func.call @cc_nil_value() : () -> i64
      %1023 = func.call @cc_intern(%1021, %1022) : (i64, i64) -> i64
      %1024 = func.call @cc_nil_value() : () -> i64
      %1025 = func.call @cc_cons(%1023, %1024) : (i64, i64) -> i64
      %1026 = func.call @cc_values_pack(%1025) : (i64) -> i64
      func.call @stack_push_pointer(%1023) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = func.call @cc_cons(%1028, %1027) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1030 = arith.addi %1029, %__rlasp_stack_elide_zero_67 : i64
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @cc_cons(%1031, %1030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1032) : (i64) -> ()
      %1033 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1034 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1035 = arith.constant 16 : i64
      %1036 = func.call @cc_make_string(%1034, %1035) : (!llvm.ptr, i64) -> i64
      %1037 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1038 = arith.constant 11 : i64
      %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
      %1040 = func.call @cc_intern(%1036, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_nil_value() : () -> i64
      %1042 = func.call @cc_cons(%1040, %1041) : (i64, i64) -> i64
      %1043 = func.call @cc_values_pack(%1042) : (i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1044 = arith.addi %1040, %__rlasp_stack_elide_zero_68 : i64
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @cc_cons(%1044, %1045) : (i64, i64) -> i64
      %1047 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1048 = arith.constant 5 : i64
      %1049 = func.call @cc_make_string(%1047, %1048) : (!llvm.ptr, i64) -> i64
      %1050 = func.call @cc_nil_value() : () -> i64
      %1051 = func.call @cc_intern(%1049, %1050) : (i64, i64) -> i64
      %1052 = func.call @cc_nil_value() : () -> i64
      %1053 = func.call @cc_cons(%1051, %1052) : (i64, i64) -> i64
      %1054 = func.call @cc_values_pack(%1053) : (i64) -> i64
      %1055 = func.call @cc_cons(%1051, %1046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1057, %1056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1059 = arith.addi %1058, %__rlasp_stack_elide_zero_69 : i64
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @cc_cons(%1060, %1059) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1062 = arith.addi %1061, %__rlasp_stack_elide_zero_70 : i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @cc_cons(%1066, %1065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1068 = arith.addi %1067, %__rlasp_stack_elide_zero_71 : i64
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @cc_cons(%1069, %1068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1071 = arith.addi %1070, %__rlasp_stack_elide_zero_72 : i64
      %1072 = func.call @stack_pop_pointer() : () -> i64
      %1073 = func.call @cc_cons(%1072, %1071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1073) : (i64) -> ()
      %1074 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1075 = arith.constant 7 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      %1077 = func.call @cc_nil_value() : () -> i64
      %1078 = func.call @cc_intern(%1076, %1077) : (i64, i64) -> i64
      %1079 = func.call @cc_nil_value() : () -> i64
      %1080 = func.call @cc_cons(%1078, %1079) : (i64, i64) -> i64
      %1081 = func.call @cc_values_pack(%1080) : (i64) -> i64
      func.call @stack_push_pointer(%1078) : (i64) -> ()
      %1082 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1083 = arith.constant 1 : i64
      %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_intern(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_nil_value() : () -> i64
      %1088 = func.call @cc_cons(%1086, %1087) : (i64, i64) -> i64
      %1089 = func.call @cc_values_pack(%1088) : (i64) -> i64
      func.call @stack_push_pointer(%1086) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1090 = func.call @stack_pop_pointer() : () -> i64
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @cc_cons(%1091, %1090) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1093 = arith.addi %1092, %__rlasp_stack_elide_zero_73 : i64
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @cc_cons(%1094, %1093) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1096 = arith.addi %1095, %__rlasp_stack_elide_zero_74 : i64
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_cons(%1097, %1096) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1099 = arith.addi %1098, %__rlasp_stack_elide_zero_75 : i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1100, %1099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1102 = arith.addi %1101, %__rlasp_stack_elide_zero_76 : i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1103, %1102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1105 = arith.addi %1104, %__rlasp_stack_elide_zero_77 : i64
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @cc_cons(%1106, %1105) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1108 = arith.addi %1107, %__rlasp_stack_elide_zero_78 : i64
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @cc_cons(%1109, %1108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1111 = arith.addi %1110, %__rlasp_stack_elide_zero_79 : i64
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @cc_cons(%1112, %1111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1114 = arith.addi %1113, %__rlasp_stack_elide_zero_80 : i64
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @cc_cons(%1115, %1114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1118, %1117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1120 = arith.addi %1119, %__rlasp_stack_elide_zero_81 : i64
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @cc_cons(%1121, %1120) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1123 = arith.addi %1122, %__rlasp_stack_elide_zero_82 : i64
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @cc_cons(%1124, %1123) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1126 = arith.addi %1125, %__rlasp_stack_elide_zero_83 : i64
      %2217 = arith.constant 120590987952129 : i64
      %2218 = arith.constant 0 : i64
      %2219 = func.call @cc_make_closure(%2217, %2218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %2220 = arith.addi %2219, %__rlasp_stack_elide_zero_84 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2221 = func.call @stack_pop_pointer() : () -> i64
      %2222 = func.call @stack_pop_pointer() : () -> i64
      %2223 = func.call @cc_cons(%2222, %2221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %2224 = arith.addi %2223, %__rlasp_stack_elide_zero_85 : i64
      %2225 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2226 = arith.constant 11 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = llvm.mlir.addressof @str295 : !llvm.ptr
      %2229 = arith.constant 7 : i64
      %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
      %2231 = func.call @cc_intern(%2227, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_cons(%2231, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_values_pack(%2233) : (i64) -> i64
      %2235 = func.call @cc_nil_value() : () -> i64
      %2236 = llvm.mlir.addressof @str296 : !llvm.ptr
      %2237 = arith.constant 4 : i64
      %2238 = func.call @cc_make_string(%2236, %2237) : (!llvm.ptr, i64) -> i64
      %2239 = llvm.mlir.addressof @str297 : !llvm.ptr
      %2240 = arith.constant 7 : i64
      %2241 = func.call @cc_make_string(%2239, %2240) : (!llvm.ptr, i64) -> i64
      %2242 = func.call @cc_intern(%2238, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_cons(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_values_pack(%2244) : (i64) -> i64
      %2246 = llvm.mlir.addressof @str298 : !llvm.ptr
      %2247 = arith.constant 6 : i64
      %2248 = func.call @cc_make_string(%2246, %2247) : (!llvm.ptr, i64) -> i64
      %2249 = func.call @cc_nil_value() : () -> i64
      %2250 = func.call @cc_intern(%2248, %2249) : (i64, i64) -> i64
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_cons(%2250, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_values_pack(%2252) : (i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %2254 = arith.addi %2250, %__rlasp_stack_elide_zero_86 : i64
      %2255 = func.call @cc_nil_value() : () -> i64
      %2256 = func.call @cc_errorp(%64) : (i64) -> i64
      %2257 = arith.cmpi ne, %2256, %2255 : i64
      %2258 = arith.cmpi eq, %2255, %2255 : i64
      %2259 = arith.andi %2257, %2258 : i1
      %2260 = scf.if %2259 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %2255 : i64
      }
      %2261 = func.call @cc_errorp(%1126) : (i64) -> i64
      %2262 = arith.cmpi ne, %2261, %2255 : i64
      %2263 = arith.cmpi eq, %2260, %2255 : i64
      %2264 = arith.andi %2262, %2263 : i1
      %2265 = scf.if %2264 -> (i64) {
        scf.yield %1126 : i64
      } else {
        scf.yield %2260 : i64
      }
      %2266 = func.call @cc_errorp(%2220) : (i64) -> i64
      %2267 = arith.cmpi ne, %2266, %2255 : i64
      %2268 = arith.cmpi eq, %2265, %2255 : i64
      %2269 = arith.andi %2267, %2268 : i1
      %2270 = scf.if %2269 -> (i64) {
        scf.yield %2220 : i64
      } else {
        scf.yield %2265 : i64
      }
      %2271 = func.call @cc_errorp(%2224) : (i64) -> i64
      %2272 = arith.cmpi ne, %2271, %2255 : i64
      %2273 = arith.cmpi eq, %2270, %2255 : i64
      %2274 = arith.andi %2272, %2273 : i1
      %2275 = scf.if %2274 -> (i64) {
        scf.yield %2224 : i64
      } else {
        scf.yield %2270 : i64
      }
      %2276 = func.call @cc_errorp(%2231) : (i64) -> i64
      %2277 = arith.cmpi ne, %2276, %2255 : i64
      %2278 = arith.cmpi eq, %2275, %2255 : i64
      %2279 = arith.andi %2277, %2278 : i1
      %2280 = scf.if %2279 -> (i64) {
        scf.yield %2231 : i64
      } else {
        scf.yield %2275 : i64
      }
      %2281 = func.call @cc_errorp(%2235) : (i64) -> i64
      %2282 = arith.cmpi ne, %2281, %2255 : i64
      %2283 = arith.cmpi eq, %2280, %2255 : i64
      %2284 = arith.andi %2282, %2283 : i1
      %2285 = scf.if %2284 -> (i64) {
        scf.yield %2235 : i64
      } else {
        scf.yield %2280 : i64
      }
      %2286 = func.call @cc_errorp(%2242) : (i64) -> i64
      %2287 = arith.cmpi ne, %2286, %2255 : i64
      %2288 = arith.cmpi eq, %2285, %2255 : i64
      %2289 = arith.andi %2287, %2288 : i1
      %2290 = scf.if %2289 -> (i64) {
        scf.yield %2242 : i64
      } else {
        scf.yield %2285 : i64
      }
      %2291 = func.call @cc_errorp(%2254) : (i64) -> i64
      %2292 = arith.cmpi ne, %2291, %2255 : i64
      %2293 = arith.cmpi eq, %2290, %2255 : i64
      %2294 = arith.andi %2292, %2293 : i1
      %2295 = scf.if %2294 -> (i64) {
        scf.yield %2254 : i64
      } else {
        scf.yield %2290 : i64
      }
      %2296 = arith.cmpi ne, %2295, %2255 : i64
      scf.if %2296 {
        func.call @stack_push_pointer(%2295) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%1126) : (i64) -> ()
        func.call @stack_push_pointer(%2220) : (i64) -> ()
        func.call @stack_push_pointer(%2224) : (i64) -> ()
        func.call @stack_push_pointer(%2231) : (i64) -> ()
        func.call @stack_push_pointer(%2235) : (i64) -> ()
        func.call @stack_push_pointer(%2242) : (i64) -> ()
        func.call @stack_push_pointer(%2254) : (i64) -> ()
        %2297 = llvm.mlir.addressof @str299 : !llvm.ptr
        %2298 = func.call @cc_make_function_ref_const(%2297) : (!llvm.ptr) -> i64
        %2299 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2298, %2299) : (i64, i64) -> ()
      }
      %2300 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2300 : i64
    }
    %2301 = func.call @cc_nil_value() : () -> i64
    %2302 = func.call @cc_errorp(%55) : (i64) -> i64
    %2303 = arith.cmpi ne, %2302, %2301 : i64
    %2304 = scf.if %2303 -> (i64) {
      scf.yield %55 : i64
    } else {
      %2305 = llvm.mlir.addressof @str300 : !llvm.ptr
      %2306 = arith.constant 23 : i64
      %2307 = func.call @cc_make_string(%2305, %2306) : (!llvm.ptr, i64) -> i64
      %2308 = func.call @cc_nil_value() : () -> i64
      %2309 = func.call @cc_intern(%2307, %2308) : (i64, i64) -> i64
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_cons(%2309, %2310) : (i64, i64) -> i64
      %2312 = func.call @cc_values_pack(%2311) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %2313 = arith.addi %2309, %__rlasp_stack_elide_zero_87 : i64
      %2314 = llvm.mlir.addressof @str301 : !llvm.ptr
      %2315 = arith.constant 3 : i64
      %2316 = func.call @cc_make_string(%2314, %2315) : (!llvm.ptr, i64) -> i64
      %2317 = func.call @cc_nil_value() : () -> i64
      %2318 = func.call @cc_intern(%2316, %2317) : (i64, i64) -> i64
      %2319 = func.call @cc_nil_value() : () -> i64
      %2320 = func.call @cc_cons(%2318, %2319) : (i64, i64) -> i64
      %2321 = func.call @cc_values_pack(%2320) : (i64) -> i64
      func.call @stack_push_pointer(%2318) : (i64) -> ()
      %2322 = llvm.mlir.addressof @str302 : !llvm.ptr
      %2323 = arith.constant 16 : i64
      %2324 = func.call @cc_make_string(%2322, %2323) : (!llvm.ptr, i64) -> i64
      %2325 = func.call @cc_nil_value() : () -> i64
      %2326 = func.call @cc_intern(%2324, %2325) : (i64, i64) -> i64
      %2327 = func.call @cc_nil_value() : () -> i64
      %2328 = func.call @cc_cons(%2326, %2327) : (i64, i64) -> i64
      %2329 = func.call @cc_values_pack(%2328) : (i64) -> i64
      func.call @stack_push_pointer(%2326) : (i64) -> ()
      %2330 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2330) : (i64) -> ()
      %2331 = llvm.mlir.addressof @str303 : !llvm.ptr
      %2332 = arith.constant 22 : i64
      %2333 = func.call @cc_make_string(%2331, %2332) : (!llvm.ptr, i64) -> i64
      %2334 = llvm.mlir.addressof @str304 : !llvm.ptr
      %2335 = arith.constant 4 : i64
      %2336 = func.call @cc_make_string(%2334, %2335) : (!llvm.ptr, i64) -> i64
      %2337 = func.call @cc_intern(%2333, %2336) : (i64, i64) -> i64
      %2338 = func.call @cc_nil_value() : () -> i64
      %2339 = func.call @cc_cons(%2337, %2338) : (i64, i64) -> i64
      %2340 = func.call @cc_values_pack(%2339) : (i64) -> i64
      func.call @stack_push_pointer(%2337) : (i64) -> ()
      %2341 = llvm.mlir.addressof @str305 : !llvm.ptr
      %2342 = arith.constant 19 : i64
      %2343 = func.call @cc_make_string(%2341, %2342) : (!llvm.ptr, i64) -> i64
      %2344 = llvm.mlir.addressof @str306 : !llvm.ptr
      %2345 = arith.constant 4 : i64
      %2346 = func.call @cc_make_string(%2344, %2345) : (!llvm.ptr, i64) -> i64
      %2347 = func.call @cc_intern(%2343, %2346) : (i64, i64) -> i64
      %2348 = func.call @cc_nil_value() : () -> i64
      %2349 = func.call @cc_cons(%2347, %2348) : (i64, i64) -> i64
      %2350 = func.call @cc_values_pack(%2349) : (i64) -> i64
      func.call @stack_push_pointer(%2347) : (i64) -> ()
      %2351 = llvm.mlir.addressof @str307 : !llvm.ptr
      %2352 = arith.constant 25 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = llvm.mlir.addressof @str308 : !llvm.ptr
      %2355 = arith.constant 4 : i64
      %2356 = func.call @cc_make_string(%2354, %2355) : (!llvm.ptr, i64) -> i64
      %2357 = func.call @cc_intern(%2353, %2356) : (i64, i64) -> i64
      %2358 = func.call @cc_nil_value() : () -> i64
      %2359 = func.call @cc_cons(%2357, %2358) : (i64, i64) -> i64
      %2360 = func.call @cc_values_pack(%2359) : (i64) -> i64
      func.call @stack_push_pointer(%2357) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2361 = func.call @stack_pop_pointer() : () -> i64
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = func.call @cc_cons(%2362, %2361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2364 = arith.addi %2363, %__rlasp_stack_elide_zero_88 : i64
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @cc_cons(%2365, %2364) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2367 = arith.addi %2366, %__rlasp_stack_elide_zero_89 : i64
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @cc_cons(%2368, %2367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2370 = arith.addi %2369, %__rlasp_stack_elide_zero_90 : i64
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @cc_cons(%2370, %2371) : (i64, i64) -> i64
      %2373 = llvm.mlir.addressof @str309 : !llvm.ptr
      %2374 = arith.constant 5 : i64
      %2375 = func.call @cc_make_string(%2373, %2374) : (!llvm.ptr, i64) -> i64
      %2376 = func.call @cc_nil_value() : () -> i64
      %2377 = func.call @cc_intern(%2375, %2376) : (i64, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_cons(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_values_pack(%2379) : (i64) -> i64
      %2381 = func.call @cc_cons(%2377, %2372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2382 = func.call @stack_pop_pointer() : () -> i64
      %2383 = func.call @stack_pop_pointer() : () -> i64
      %2384 = func.call @cc_cons(%2383, %2382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2385 = arith.addi %2384, %__rlasp_stack_elide_zero_91 : i64
      %2386 = func.call @stack_pop_pointer() : () -> i64
      %2387 = func.call @cc_cons(%2386, %2385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2387) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2388 = func.call @stack_pop_pointer() : () -> i64
      %2389 = func.call @stack_pop_pointer() : () -> i64
      %2390 = func.call @cc_cons(%2389, %2388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2390) : (i64) -> ()
      %2391 = llvm.mlir.addressof @str310 : !llvm.ptr
      %2392 = arith.constant 4 : i64
      %2393 = func.call @cc_make_string(%2391, %2392) : (!llvm.ptr, i64) -> i64
      %2394 = func.call @cc_nil_value() : () -> i64
      %2395 = func.call @cc_intern(%2393, %2394) : (i64, i64) -> i64
      %2396 = func.call @cc_nil_value() : () -> i64
      %2397 = func.call @cc_cons(%2395, %2396) : (i64, i64) -> i64
      %2398 = func.call @cc_values_pack(%2397) : (i64) -> i64
      func.call @stack_push_pointer(%2395) : (i64) -> ()
      %2399 = llvm.mlir.addressof @str311 : !llvm.ptr
      %2400 = arith.constant 3 : i64
      %2401 = func.call @cc_make_string(%2399, %2400) : (!llvm.ptr, i64) -> i64
      %2402 = func.call @cc_nil_value() : () -> i64
      %2403 = func.call @cc_intern(%2401, %2402) : (i64, i64) -> i64
      %2404 = func.call @cc_nil_value() : () -> i64
      %2405 = func.call @cc_cons(%2403, %2404) : (i64, i64) -> i64
      %2406 = func.call @cc_values_pack(%2405) : (i64) -> i64
      func.call @stack_push_pointer(%2403) : (i64) -> ()
      %2407 = llvm.mlir.addressof @str312 : !llvm.ptr
      %2408 = arith.constant 1 : i64
      %2409 = func.call @cc_make_string(%2407, %2408) : (!llvm.ptr, i64) -> i64
      %2410 = func.call @cc_nil_value() : () -> i64
      %2411 = func.call @cc_intern(%2409, %2410) : (i64, i64) -> i64
      %2412 = func.call @cc_nil_value() : () -> i64
      %2413 = func.call @cc_cons(%2411, %2412) : (i64, i64) -> i64
      %2414 = func.call @cc_values_pack(%2413) : (i64) -> i64
      func.call @stack_push_pointer(%2411) : (i64) -> ()
      %2415 = llvm.mlir.addressof @str313 : !llvm.ptr
      %2416 = arith.constant 2 : i64
      %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_intern(%2417, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      func.call @stack_push_pointer(%2419) : (i64) -> ()
      %2423 = llvm.mlir.addressof @str314 : !llvm.ptr
      %2424 = arith.constant 16 : i64
      %2425 = func.call @cc_make_string(%2423, %2424) : (!llvm.ptr, i64) -> i64
      %2426 = func.call @cc_nil_value() : () -> i64
      %2427 = func.call @cc_intern(%2425, %2426) : (i64, i64) -> i64
      %2428 = func.call @cc_nil_value() : () -> i64
      %2429 = func.call @cc_cons(%2427, %2428) : (i64, i64) -> i64
      %2430 = func.call @cc_values_pack(%2429) : (i64) -> i64
      func.call @stack_push_pointer(%2427) : (i64) -> ()
      %2431 = llvm.mlir.addressof @str315 : !llvm.ptr
      %2432 = arith.constant 6 : i64
      %2433 = func.call @cc_make_string(%2431, %2432) : (!llvm.ptr, i64) -> i64
      %2434 = llvm.mlir.addressof @str316 : !llvm.ptr
      %2435 = arith.constant 11 : i64
      %2436 = func.call @cc_make_string(%2434, %2435) : (!llvm.ptr, i64) -> i64
      %2437 = func.call @cc_intern(%2433, %2436) : (i64, i64) -> i64
      %2438 = func.call @cc_nil_value() : () -> i64
      %2439 = func.call @cc_cons(%2437, %2438) : (i64, i64) -> i64
      %2440 = func.call @cc_values_pack(%2439) : (i64) -> i64
      func.call @stack_push_pointer(%2437) : (i64) -> ()
      %2441 = llvm.mlir.addressof @str317 : !llvm.ptr
      %2442 = arith.constant 7 : i64
      %2443 = func.call @cc_make_string(%2441, %2442) : (!llvm.ptr, i64) -> i64
      %2444 = llvm.mlir.addressof @str318 : !llvm.ptr
      %2445 = arith.constant 11 : i64
      %2446 = func.call @cc_make_string(%2444, %2445) : (!llvm.ptr, i64) -> i64
      %2447 = func.call @cc_intern(%2443, %2446) : (i64, i64) -> i64
      %2448 = func.call @cc_nil_value() : () -> i64
      %2449 = func.call @cc_cons(%2447, %2448) : (i64, i64) -> i64
      %2450 = func.call @cc_values_pack(%2449) : (i64) -> i64
      func.call @stack_push_pointer(%2447) : (i64) -> ()
      %2451 = llvm.mlir.addressof @str319 : !llvm.ptr
      %2452 = arith.constant 1 : i64
      %2453 = func.call @cc_make_string(%2451, %2452) : (!llvm.ptr, i64) -> i64
      %2454 = func.call @cc_nil_value() : () -> i64
      %2455 = func.call @cc_intern(%2453, %2454) : (i64, i64) -> i64
      %2456 = func.call @cc_nil_value() : () -> i64
      %2457 = func.call @cc_cons(%2455, %2456) : (i64, i64) -> i64
      %2458 = func.call @cc_values_pack(%2457) : (i64) -> i64
      func.call @stack_push_pointer(%2455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2459 = func.call @stack_pop_pointer() : () -> i64
      %2460 = func.call @stack_pop_pointer() : () -> i64
      %2461 = func.call @cc_cons(%2460, %2459) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2462 = arith.addi %2461, %__rlasp_stack_elide_zero_92 : i64
      %2463 = func.call @stack_pop_pointer() : () -> i64
      %2464 = func.call @cc_cons(%2463, %2462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2464) : (i64) -> ()
      %2465 = llvm.mlir.addressof @str320 : !llvm.ptr
      %2466 = arith.constant 7 : i64
      %2467 = func.call @cc_make_string(%2465, %2466) : (!llvm.ptr, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_intern(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_nil_value() : () -> i64
      %2471 = func.call @cc_cons(%2469, %2470) : (i64, i64) -> i64
      %2472 = func.call @cc_values_pack(%2471) : (i64) -> i64
      func.call @stack_push_pointer(%2469) : (i64) -> ()
      %2473 = llvm.mlir.addressof @str321 : !llvm.ptr
      %2474 = arith.constant 1 : i64
      %2475 = func.call @cc_make_string(%2473, %2474) : (!llvm.ptr, i64) -> i64
      %2476 = func.call @cc_nil_value() : () -> i64
      %2477 = func.call @cc_intern(%2475, %2476) : (i64, i64) -> i64
      %2478 = func.call @cc_nil_value() : () -> i64
      %2479 = func.call @cc_cons(%2477, %2478) : (i64, i64) -> i64
      %2480 = func.call @cc_values_pack(%2479) : (i64) -> i64
      func.call @stack_push_pointer(%2477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2481 = func.call @stack_pop_pointer() : () -> i64
      %2482 = func.call @stack_pop_pointer() : () -> i64
      %2483 = func.call @cc_cons(%2482, %2481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2484 = arith.addi %2483, %__rlasp_stack_elide_zero_93 : i64
      %2485 = func.call @stack_pop_pointer() : () -> i64
      %2486 = func.call @cc_cons(%2485, %2484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2487 = arith.addi %2486, %__rlasp_stack_elide_zero_94 : i64
      %2488 = func.call @stack_pop_pointer() : () -> i64
      %2489 = func.call @cc_cons(%2488, %2487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2490 = arith.addi %2489, %__rlasp_stack_elide_zero_95 : i64
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = func.call @cc_cons(%2491, %2490) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2493 = arith.addi %2492, %__rlasp_stack_elide_zero_96 : i64
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = func.call @cc_cons(%2494, %2493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2496 = arith.addi %2495, %__rlasp_stack_elide_zero_97 : i64
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @cc_cons(%2497, %2496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2499 = arith.addi %2498, %__rlasp_stack_elide_zero_98 : i64
      %2500 = func.call @stack_pop_pointer() : () -> i64
      %2501 = func.call @cc_cons(%2500, %2499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2502 = arith.addi %2501, %__rlasp_stack_elide_zero_99 : i64
      %2503 = func.call @stack_pop_pointer() : () -> i64
      %2504 = func.call @cc_cons(%2503, %2502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2505 = arith.addi %2504, %__rlasp_stack_elide_zero_100 : i64
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @cc_cons(%2506, %2505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2507) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2508 = func.call @stack_pop_pointer() : () -> i64
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_cons(%2509, %2508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2511 = arith.addi %2510, %__rlasp_stack_elide_zero_101 : i64
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @cc_cons(%2512, %2511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2514 = arith.addi %2513, %__rlasp_stack_elide_zero_102 : i64
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @cc_cons(%2515, %2514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2517 = arith.addi %2516, %__rlasp_stack_elide_zero_103 : i64
      %2814 = arith.constant 120590987952131 : i64
      %2815 = arith.constant 0 : i64
      %2816 = func.call @cc_make_closure(%2814, %2815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2817 = arith.addi %2816, %__rlasp_stack_elide_zero_104 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = func.call @stack_pop_pointer() : () -> i64
      %2820 = func.call @cc_cons(%2819, %2818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2821 = arith.addi %2820, %__rlasp_stack_elide_zero_105 : i64
      %2822 = llvm.mlir.addressof @str341 : !llvm.ptr
      %2823 = arith.constant 11 : i64
      %2824 = func.call @cc_make_string(%2822, %2823) : (!llvm.ptr, i64) -> i64
      %2825 = llvm.mlir.addressof @str342 : !llvm.ptr
      %2826 = arith.constant 7 : i64
      %2827 = func.call @cc_make_string(%2825, %2826) : (!llvm.ptr, i64) -> i64
      %2828 = func.call @cc_intern(%2824, %2827) : (i64, i64) -> i64
      %2829 = func.call @cc_nil_value() : () -> i64
      %2830 = func.call @cc_cons(%2828, %2829) : (i64, i64) -> i64
      %2831 = func.call @cc_values_pack(%2830) : (i64) -> i64
      %2832 = func.call @cc_nil_value() : () -> i64
      %2833 = llvm.mlir.addressof @str343 : !llvm.ptr
      %2834 = arith.constant 4 : i64
      %2835 = func.call @cc_make_string(%2833, %2834) : (!llvm.ptr, i64) -> i64
      %2836 = llvm.mlir.addressof @str344 : !llvm.ptr
      %2837 = arith.constant 7 : i64
      %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
      %2839 = func.call @cc_intern(%2835, %2838) : (i64, i64) -> i64
      %2840 = func.call @cc_nil_value() : () -> i64
      %2841 = func.call @cc_cons(%2839, %2840) : (i64, i64) -> i64
      %2842 = func.call @cc_values_pack(%2841) : (i64) -> i64
      %2843 = llvm.mlir.addressof @str345 : !llvm.ptr
      %2844 = arith.constant 6 : i64
      %2845 = func.call @cc_make_string(%2843, %2844) : (!llvm.ptr, i64) -> i64
      %2846 = func.call @cc_nil_value() : () -> i64
      %2847 = func.call @cc_intern(%2845, %2846) : (i64, i64) -> i64
      %2848 = func.call @cc_nil_value() : () -> i64
      %2849 = func.call @cc_cons(%2847, %2848) : (i64, i64) -> i64
      %2850 = func.call @cc_values_pack(%2849) : (i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2851 = arith.addi %2847, %__rlasp_stack_elide_zero_106 : i64
      %2852 = func.call @cc_nil_value() : () -> i64
      %2853 = func.call @cc_errorp(%2313) : (i64) -> i64
      %2854 = arith.cmpi ne, %2853, %2852 : i64
      %2855 = arith.cmpi eq, %2852, %2852 : i64
      %2856 = arith.andi %2854, %2855 : i1
      %2857 = scf.if %2856 -> (i64) {
        scf.yield %2313 : i64
      } else {
        scf.yield %2852 : i64
      }
      %2858 = func.call @cc_errorp(%2517) : (i64) -> i64
      %2859 = arith.cmpi ne, %2858, %2852 : i64
      %2860 = arith.cmpi eq, %2857, %2852 : i64
      %2861 = arith.andi %2859, %2860 : i1
      %2862 = scf.if %2861 -> (i64) {
        scf.yield %2517 : i64
      } else {
        scf.yield %2857 : i64
      }
      %2863 = func.call @cc_errorp(%2817) : (i64) -> i64
      %2864 = arith.cmpi ne, %2863, %2852 : i64
      %2865 = arith.cmpi eq, %2862, %2852 : i64
      %2866 = arith.andi %2864, %2865 : i1
      %2867 = scf.if %2866 -> (i64) {
        scf.yield %2817 : i64
      } else {
        scf.yield %2862 : i64
      }
      %2868 = func.call @cc_errorp(%2821) : (i64) -> i64
      %2869 = arith.cmpi ne, %2868, %2852 : i64
      %2870 = arith.cmpi eq, %2867, %2852 : i64
      %2871 = arith.andi %2869, %2870 : i1
      %2872 = scf.if %2871 -> (i64) {
        scf.yield %2821 : i64
      } else {
        scf.yield %2867 : i64
      }
      %2873 = func.call @cc_errorp(%2828) : (i64) -> i64
      %2874 = arith.cmpi ne, %2873, %2852 : i64
      %2875 = arith.cmpi eq, %2872, %2852 : i64
      %2876 = arith.andi %2874, %2875 : i1
      %2877 = scf.if %2876 -> (i64) {
        scf.yield %2828 : i64
      } else {
        scf.yield %2872 : i64
      }
      %2878 = func.call @cc_errorp(%2832) : (i64) -> i64
      %2879 = arith.cmpi ne, %2878, %2852 : i64
      %2880 = arith.cmpi eq, %2877, %2852 : i64
      %2881 = arith.andi %2879, %2880 : i1
      %2882 = scf.if %2881 -> (i64) {
        scf.yield %2832 : i64
      } else {
        scf.yield %2877 : i64
      }
      %2883 = func.call @cc_errorp(%2839) : (i64) -> i64
      %2884 = arith.cmpi ne, %2883, %2852 : i64
      %2885 = arith.cmpi eq, %2882, %2852 : i64
      %2886 = arith.andi %2884, %2885 : i1
      %2887 = scf.if %2886 -> (i64) {
        scf.yield %2839 : i64
      } else {
        scf.yield %2882 : i64
      }
      %2888 = func.call @cc_errorp(%2851) : (i64) -> i64
      %2889 = arith.cmpi ne, %2888, %2852 : i64
      %2890 = arith.cmpi eq, %2887, %2852 : i64
      %2891 = arith.andi %2889, %2890 : i1
      %2892 = scf.if %2891 -> (i64) {
        scf.yield %2851 : i64
      } else {
        scf.yield %2887 : i64
      }
      %2893 = arith.cmpi ne, %2892, %2852 : i64
      scf.if %2893 {
        func.call @stack_push_pointer(%2892) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2313) : (i64) -> ()
        func.call @stack_push_pointer(%2517) : (i64) -> ()
        func.call @stack_push_pointer(%2817) : (i64) -> ()
        func.call @stack_push_pointer(%2821) : (i64) -> ()
        func.call @stack_push_pointer(%2828) : (i64) -> ()
        func.call @stack_push_pointer(%2832) : (i64) -> ()
        func.call @stack_push_pointer(%2839) : (i64) -> ()
        func.call @stack_push_pointer(%2851) : (i64) -> ()
        %2894 = llvm.mlir.addressof @str346 : !llvm.ptr
        %2895 = func.call @cc_make_function_ref_const(%2894) : (!llvm.ptr) -> i64
        %2896 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2895, %2896) : (i64, i64) -> ()
      }
      %2897 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2897 : i64
    }
    %2898 = func.call @cc_nil_value() : () -> i64
    %2899 = func.call @cc_errorp(%2304) : (i64) -> i64
    %2900 = arith.cmpi ne, %2899, %2898 : i64
    %2901 = scf.if %2900 -> (i64) {
      scf.yield %2304 : i64
    } else {
      %2902 = llvm.mlir.addressof @str347 : !llvm.ptr
      %2903 = arith.constant 22 : i64
      %2904 = func.call @cc_make_string(%2902, %2903) : (!llvm.ptr, i64) -> i64
      %2905 = func.call @cc_nil_value() : () -> i64
      %2906 = func.call @cc_intern(%2904, %2905) : (i64, i64) -> i64
      %2907 = func.call @cc_nil_value() : () -> i64
      %2908 = func.call @cc_cons(%2906, %2907) : (i64, i64) -> i64
      %2909 = func.call @cc_values_pack(%2908) : (i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2910 = arith.addi %2906, %__rlasp_stack_elide_zero_107 : i64
      %2911 = llvm.mlir.addressof @str348 : !llvm.ptr
      %2912 = arith.constant 3 : i64
      %2913 = func.call @cc_make_string(%2911, %2912) : (!llvm.ptr, i64) -> i64
      %2914 = func.call @cc_nil_value() : () -> i64
      %2915 = func.call @cc_intern(%2913, %2914) : (i64, i64) -> i64
      %2916 = func.call @cc_nil_value() : () -> i64
      %2917 = func.call @cc_cons(%2915, %2916) : (i64, i64) -> i64
      %2918 = func.call @cc_values_pack(%2917) : (i64) -> i64
      func.call @stack_push_pointer(%2915) : (i64) -> ()
      %2919 = llvm.mlir.addressof @str349 : !llvm.ptr
      %2920 = arith.constant 10 : i64
      %2921 = func.call @cc_make_string(%2919, %2920) : (!llvm.ptr, i64) -> i64
      %2922 = func.call @cc_nil_value() : () -> i64
      %2923 = func.call @cc_intern(%2921, %2922) : (i64, i64) -> i64
      %2924 = func.call @cc_nil_value() : () -> i64
      %2925 = func.call @cc_cons(%2923, %2924) : (i64, i64) -> i64
      %2926 = func.call @cc_values_pack(%2925) : (i64) -> i64
      func.call @stack_push_pointer(%2923) : (i64) -> ()
      %2927 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2927) : (i64) -> ()
      %2928 = llvm.mlir.addressof @str350 : !llvm.ptr
      %2929 = arith.constant 31 : i64
      %2930 = func.call @cc_make_string(%2928, %2929) : (!llvm.ptr, i64) -> i64
      %2931 = llvm.mlir.addressof @str351 : !llvm.ptr
      %2932 = arith.constant 4 : i64
      %2933 = func.call @cc_make_string(%2931, %2932) : (!llvm.ptr, i64) -> i64
      %2934 = func.call @cc_intern(%2930, %2933) : (i64, i64) -> i64
      %2935 = func.call @cc_nil_value() : () -> i64
      %2936 = func.call @cc_cons(%2934, %2935) : (i64, i64) -> i64
      %2937 = func.call @cc_values_pack(%2936) : (i64) -> i64
      func.call @stack_push_pointer(%2934) : (i64) -> ()
      %2938 = llvm.mlir.addressof @str352 : !llvm.ptr
      %2939 = arith.constant 13 : i64
      %2940 = func.call @cc_make_string(%2938, %2939) : (!llvm.ptr, i64) -> i64
      %2941 = llvm.mlir.addressof @str353 : !llvm.ptr
      %2942 = arith.constant 4 : i64
      %2943 = func.call @cc_make_string(%2941, %2942) : (!llvm.ptr, i64) -> i64
      %2944 = func.call @cc_intern(%2940, %2943) : (i64, i64) -> i64
      %2945 = func.call @cc_nil_value() : () -> i64
      %2946 = func.call @cc_cons(%2944, %2945) : (i64, i64) -> i64
      %2947 = func.call @cc_values_pack(%2946) : (i64) -> i64
      func.call @stack_push_pointer(%2944) : (i64) -> ()
      %2948 = llvm.mlir.addressof @str354 : !llvm.ptr
      %2949 = arith.constant 17 : i64
      %2950 = func.call @cc_make_string(%2948, %2949) : (!llvm.ptr, i64) -> i64
      %2951 = llvm.mlir.addressof @str355 : !llvm.ptr
      %2952 = arith.constant 4 : i64
      %2953 = func.call @cc_make_string(%2951, %2952) : (!llvm.ptr, i64) -> i64
      %2954 = func.call @cc_intern(%2950, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_nil_value() : () -> i64
      %2956 = func.call @cc_cons(%2954, %2955) : (i64, i64) -> i64
      %2957 = func.call @cc_values_pack(%2956) : (i64) -> i64
      func.call @stack_push_pointer(%2954) : (i64) -> ()
      %2958 = llvm.mlir.addressof @str356 : !llvm.ptr
      %2959 = arith.constant 19 : i64
      %2960 = func.call @cc_make_string(%2958, %2959) : (!llvm.ptr, i64) -> i64
      %2961 = llvm.mlir.addressof @str357 : !llvm.ptr
      %2962 = arith.constant 4 : i64
      %2963 = func.call @cc_make_string(%2961, %2962) : (!llvm.ptr, i64) -> i64
      %2964 = func.call @cc_intern(%2960, %2963) : (i64, i64) -> i64
      %2965 = func.call @cc_nil_value() : () -> i64
      %2966 = func.call @cc_cons(%2964, %2965) : (i64, i64) -> i64
      %2967 = func.call @cc_values_pack(%2966) : (i64) -> i64
      func.call @stack_push_pointer(%2964) : (i64) -> ()
      %2968 = llvm.mlir.addressof @str358 : !llvm.ptr
      %2969 = arith.constant 22 : i64
      %2970 = func.call @cc_make_string(%2968, %2969) : (!llvm.ptr, i64) -> i64
      %2971 = llvm.mlir.addressof @str359 : !llvm.ptr
      %2972 = arith.constant 4 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = func.call @cc_intern(%2970, %2973) : (i64, i64) -> i64
      %2975 = func.call @cc_nil_value() : () -> i64
      %2976 = func.call @cc_cons(%2974, %2975) : (i64, i64) -> i64
      %2977 = func.call @cc_values_pack(%2976) : (i64) -> i64
      func.call @stack_push_pointer(%2974) : (i64) -> ()
      %2978 = llvm.mlir.addressof @str360 : !llvm.ptr
      %2979 = arith.constant 29 : i64
      %2980 = func.call @cc_make_string(%2978, %2979) : (!llvm.ptr, i64) -> i64
      %2981 = llvm.mlir.addressof @str361 : !llvm.ptr
      %2982 = arith.constant 4 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      %2984 = func.call @cc_intern(%2980, %2983) : (i64, i64) -> i64
      %2985 = func.call @cc_nil_value() : () -> i64
      %2986 = func.call @cc_cons(%2984, %2985) : (i64, i64) -> i64
      %2987 = func.call @cc_values_pack(%2986) : (i64) -> i64
      func.call @stack_push_pointer(%2984) : (i64) -> ()
      %2988 = llvm.mlir.addressof @str362 : !llvm.ptr
      %2989 = arith.constant 18 : i64
      %2990 = func.call @cc_make_string(%2988, %2989) : (!llvm.ptr, i64) -> i64
      %2991 = llvm.mlir.addressof @str363 : !llvm.ptr
      %2992 = arith.constant 4 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = func.call @cc_intern(%2990, %2993) : (i64, i64) -> i64
      %2995 = func.call @cc_nil_value() : () -> i64
      %2996 = func.call @cc_cons(%2994, %2995) : (i64, i64) -> i64
      %2997 = func.call @cc_values_pack(%2996) : (i64) -> i64
      func.call @stack_push_pointer(%2994) : (i64) -> ()
      %2998 = llvm.mlir.addressof @str364 : !llvm.ptr
      %2999 = arith.constant 23 : i64
      %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
      %3001 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3002 = arith.constant 4 : i64
      %3003 = func.call @cc_make_string(%3001, %3002) : (!llvm.ptr, i64) -> i64
      %3004 = func.call @cc_intern(%3000, %3003) : (i64, i64) -> i64
      %3005 = func.call @cc_nil_value() : () -> i64
      %3006 = func.call @cc_cons(%3004, %3005) : (i64, i64) -> i64
      %3007 = func.call @cc_values_pack(%3006) : (i64) -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3008 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3009 = arith.constant 25 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3012 = arith.constant 4 : i64
      %3013 = func.call @cc_make_string(%3011, %3012) : (!llvm.ptr, i64) -> i64
      %3014 = func.call @cc_intern(%3010, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_nil_value() : () -> i64
      %3016 = func.call @cc_cons(%3014, %3015) : (i64, i64) -> i64
      %3017 = func.call @cc_values_pack(%3016) : (i64) -> i64
      func.call @stack_push_pointer(%3014) : (i64) -> ()
      %3018 = llvm.mlir.addressof @str368 : !llvm.ptr
      %3019 = arith.constant 17 : i64
      %3020 = func.call @cc_make_string(%3018, %3019) : (!llvm.ptr, i64) -> i64
      %3021 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3022 = arith.constant 4 : i64
      %3023 = func.call @cc_make_string(%3021, %3022) : (!llvm.ptr, i64) -> i64
      %3024 = func.call @cc_intern(%3020, %3023) : (i64, i64) -> i64
      %3025 = func.call @cc_nil_value() : () -> i64
      %3026 = func.call @cc_cons(%3024, %3025) : (i64, i64) -> i64
      %3027 = func.call @cc_values_pack(%3026) : (i64) -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3028 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3029 = arith.constant 21 : i64
      %3030 = func.call @cc_make_string(%3028, %3029) : (!llvm.ptr, i64) -> i64
      %3031 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3032 = arith.constant 4 : i64
      %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
      %3034 = func.call @cc_intern(%3030, %3033) : (i64, i64) -> i64
      %3035 = func.call @cc_nil_value() : () -> i64
      %3036 = func.call @cc_cons(%3034, %3035) : (i64, i64) -> i64
      %3037 = func.call @cc_values_pack(%3036) : (i64) -> i64
      func.call @stack_push_pointer(%3034) : (i64) -> ()
      %3038 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3039 = arith.constant 15 : i64
      %3040 = func.call @cc_make_string(%3038, %3039) : (!llvm.ptr, i64) -> i64
      %3041 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3042 = arith.constant 4 : i64
      %3043 = func.call @cc_make_string(%3041, %3042) : (!llvm.ptr, i64) -> i64
      %3044 = func.call @cc_intern(%3040, %3043) : (i64, i64) -> i64
      %3045 = func.call @cc_nil_value() : () -> i64
      %3046 = func.call @cc_cons(%3044, %3045) : (i64, i64) -> i64
      %3047 = func.call @cc_values_pack(%3046) : (i64) -> i64
      func.call @stack_push_pointer(%3044) : (i64) -> ()
      %3048 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3049 = arith.constant 11 : i64
      %3050 = func.call @cc_make_string(%3048, %3049) : (!llvm.ptr, i64) -> i64
      %3051 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3052 = arith.constant 4 : i64
      %3053 = func.call @cc_make_string(%3051, %3052) : (!llvm.ptr, i64) -> i64
      %3054 = func.call @cc_intern(%3050, %3053) : (i64, i64) -> i64
      %3055 = func.call @cc_nil_value() : () -> i64
      %3056 = func.call @cc_cons(%3054, %3055) : (i64, i64) -> i64
      %3057 = func.call @cc_values_pack(%3056) : (i64) -> i64
      func.call @stack_push_pointer(%3054) : (i64) -> ()
      %3058 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3059 = arith.constant 40 : i64
      %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
      %3061 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3062 = arith.constant 4 : i64
      %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
      %3064 = func.call @cc_intern(%3060, %3063) : (i64, i64) -> i64
      %3065 = func.call @cc_nil_value() : () -> i64
      %3066 = func.call @cc_cons(%3064, %3065) : (i64, i64) -> i64
      %3067 = func.call @cc_values_pack(%3066) : (i64) -> i64
      func.call @stack_push_pointer(%3064) : (i64) -> ()
      %3068 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3069 = arith.constant 29 : i64
      %3070 = func.call @cc_make_string(%3068, %3069) : (!llvm.ptr, i64) -> i64
      %3071 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3072 = arith.constant 4 : i64
      %3073 = func.call @cc_make_string(%3071, %3072) : (!llvm.ptr, i64) -> i64
      %3074 = func.call @cc_intern(%3070, %3073) : (i64, i64) -> i64
      %3075 = func.call @cc_nil_value() : () -> i64
      %3076 = func.call @cc_cons(%3074, %3075) : (i64, i64) -> i64
      %3077 = func.call @cc_values_pack(%3076) : (i64) -> i64
      func.call @stack_push_pointer(%3074) : (i64) -> ()
      %3078 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3079 = arith.constant 31 : i64
      %3080 = func.call @cc_make_string(%3078, %3079) : (!llvm.ptr, i64) -> i64
      %3081 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3082 = arith.constant 4 : i64
      %3083 = func.call @cc_make_string(%3081, %3082) : (!llvm.ptr, i64) -> i64
      %3084 = func.call @cc_intern(%3080, %3083) : (i64, i64) -> i64
      %3085 = func.call @cc_nil_value() : () -> i64
      %3086 = func.call @cc_cons(%3084, %3085) : (i64, i64) -> i64
      %3087 = func.call @cc_values_pack(%3086) : (i64) -> i64
      func.call @stack_push_pointer(%3084) : (i64) -> ()
      %3088 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3089 = arith.constant 24 : i64
      %3090 = func.call @cc_make_string(%3088, %3089) : (!llvm.ptr, i64) -> i64
      %3091 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3092 = arith.constant 4 : i64
      %3093 = func.call @cc_make_string(%3091, %3092) : (!llvm.ptr, i64) -> i64
      %3094 = func.call @cc_intern(%3090, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_nil_value() : () -> i64
      %3096 = func.call @cc_cons(%3094, %3095) : (i64, i64) -> i64
      %3097 = func.call @cc_values_pack(%3096) : (i64) -> i64
      func.call @stack_push_pointer(%3094) : (i64) -> ()
      %3098 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3099 = arith.constant 33 : i64
      %3100 = func.call @cc_make_string(%3098, %3099) : (!llvm.ptr, i64) -> i64
      %3101 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3102 = arith.constant 4 : i64
      %3103 = func.call @cc_make_string(%3101, %3102) : (!llvm.ptr, i64) -> i64
      %3104 = func.call @cc_intern(%3100, %3103) : (i64, i64) -> i64
      %3105 = func.call @cc_nil_value() : () -> i64
      %3106 = func.call @cc_cons(%3104, %3105) : (i64, i64) -> i64
      %3107 = func.call @cc_values_pack(%3106) : (i64) -> i64
      func.call @stack_push_pointer(%3104) : (i64) -> ()
      %3108 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3109 = arith.constant 13 : i64
      %3110 = func.call @cc_make_string(%3108, %3109) : (!llvm.ptr, i64) -> i64
      %3111 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3112 = arith.constant 4 : i64
      %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = func.call @cc_intern(%3110, %3113) : (i64, i64) -> i64
      %3115 = func.call @cc_nil_value() : () -> i64
      %3116 = func.call @cc_cons(%3114, %3115) : (i64, i64) -> i64
      %3117 = func.call @cc_values_pack(%3116) : (i64) -> i64
      func.call @stack_push_pointer(%3114) : (i64) -> ()
      %3118 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3119 = arith.constant 28 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3122 = arith.constant 4 : i64
      %3123 = func.call @cc_make_string(%3121, %3122) : (!llvm.ptr, i64) -> i64
      %3124 = func.call @cc_intern(%3120, %3123) : (i64, i64) -> i64
      %3125 = func.call @cc_nil_value() : () -> i64
      %3126 = func.call @cc_cons(%3124, %3125) : (i64, i64) -> i64
      %3127 = func.call @cc_values_pack(%3126) : (i64) -> i64
      func.call @stack_push_pointer(%3124) : (i64) -> ()
      %3128 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3129 = arith.constant 31 : i64
      %3130 = func.call @cc_make_string(%3128, %3129) : (!llvm.ptr, i64) -> i64
      %3131 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3132 = arith.constant 4 : i64
      %3133 = func.call @cc_make_string(%3131, %3132) : (!llvm.ptr, i64) -> i64
      %3134 = func.call @cc_intern(%3130, %3133) : (i64, i64) -> i64
      %3135 = func.call @cc_nil_value() : () -> i64
      %3136 = func.call @cc_cons(%3134, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_values_pack(%3136) : (i64) -> i64
      func.call @stack_push_pointer(%3134) : (i64) -> ()
      %3138 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3139 = arith.constant 24 : i64
      %3140 = func.call @cc_make_string(%3138, %3139) : (!llvm.ptr, i64) -> i64
      %3141 = llvm.mlir.addressof @str393 : !llvm.ptr
      %3142 = arith.constant 4 : i64
      %3143 = func.call @cc_make_string(%3141, %3142) : (!llvm.ptr, i64) -> i64
      %3144 = func.call @cc_intern(%3140, %3143) : (i64, i64) -> i64
      %3145 = func.call @cc_nil_value() : () -> i64
      %3146 = func.call @cc_cons(%3144, %3145) : (i64, i64) -> i64
      %3147 = func.call @cc_values_pack(%3146) : (i64) -> i64
      func.call @stack_push_pointer(%3144) : (i64) -> ()
      %3148 = llvm.mlir.addressof @str394 : !llvm.ptr
      %3149 = arith.constant 35 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      %3151 = llvm.mlir.addressof @str395 : !llvm.ptr
      %3152 = arith.constant 4 : i64
      %3153 = func.call @cc_make_string(%3151, %3152) : (!llvm.ptr, i64) -> i64
      %3154 = func.call @cc_intern(%3150, %3153) : (i64, i64) -> i64
      %3155 = func.call @cc_nil_value() : () -> i64
      %3156 = func.call @cc_cons(%3154, %3155) : (i64, i64) -> i64
      %3157 = func.call @cc_values_pack(%3156) : (i64) -> i64
      func.call @stack_push_pointer(%3154) : (i64) -> ()
      %3158 = llvm.mlir.addressof @str396 : !llvm.ptr
      %3159 = arith.constant 20 : i64
      %3160 = func.call @cc_make_string(%3158, %3159) : (!llvm.ptr, i64) -> i64
      %3161 = llvm.mlir.addressof @str397 : !llvm.ptr
      %3162 = arith.constant 4 : i64
      %3163 = func.call @cc_make_string(%3161, %3162) : (!llvm.ptr, i64) -> i64
      %3164 = func.call @cc_intern(%3160, %3163) : (i64, i64) -> i64
      %3165 = func.call @cc_nil_value() : () -> i64
      %3166 = func.call @cc_cons(%3164, %3165) : (i64, i64) -> i64
      %3167 = func.call @cc_values_pack(%3166) : (i64) -> i64
      func.call @stack_push_pointer(%3164) : (i64) -> ()
      %3168 = llvm.mlir.addressof @str398 : !llvm.ptr
      %3169 = arith.constant 23 : i64
      %3170 = func.call @cc_make_string(%3168, %3169) : (!llvm.ptr, i64) -> i64
      %3171 = llvm.mlir.addressof @str399 : !llvm.ptr
      %3172 = arith.constant 4 : i64
      %3173 = func.call @cc_make_string(%3171, %3172) : (!llvm.ptr, i64) -> i64
      %3174 = func.call @cc_intern(%3170, %3173) : (i64, i64) -> i64
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_cons(%3174, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_values_pack(%3176) : (i64) -> i64
      func.call @stack_push_pointer(%3174) : (i64) -> ()
      %3178 = llvm.mlir.addressof @str400 : !llvm.ptr
      %3179 = arith.constant 42 : i64
      %3180 = func.call @cc_make_string(%3178, %3179) : (!llvm.ptr, i64) -> i64
      %3181 = llvm.mlir.addressof @str401 : !llvm.ptr
      %3182 = arith.constant 4 : i64
      %3183 = func.call @cc_make_string(%3181, %3182) : (!llvm.ptr, i64) -> i64
      %3184 = func.call @cc_intern(%3180, %3183) : (i64, i64) -> i64
      %3185 = func.call @cc_nil_value() : () -> i64
      %3186 = func.call @cc_cons(%3184, %3185) : (i64, i64) -> i64
      %3187 = func.call @cc_values_pack(%3186) : (i64) -> i64
      func.call @stack_push_pointer(%3184) : (i64) -> ()
      %3188 = llvm.mlir.addressof @str402 : !llvm.ptr
      %3189 = arith.constant 28 : i64
      %3190 = func.call @cc_make_string(%3188, %3189) : (!llvm.ptr, i64) -> i64
      %3191 = llvm.mlir.addressof @str403 : !llvm.ptr
      %3192 = arith.constant 4 : i64
      %3193 = func.call @cc_make_string(%3191, %3192) : (!llvm.ptr, i64) -> i64
      %3194 = func.call @cc_intern(%3190, %3193) : (i64, i64) -> i64
      %3195 = func.call @cc_nil_value() : () -> i64
      %3196 = func.call @cc_cons(%3194, %3195) : (i64, i64) -> i64
      %3197 = func.call @cc_values_pack(%3196) : (i64) -> i64
      func.call @stack_push_pointer(%3194) : (i64) -> ()
      %3198 = llvm.mlir.addressof @str404 : !llvm.ptr
      %3199 = arith.constant 29 : i64
      %3200 = func.call @cc_make_string(%3198, %3199) : (!llvm.ptr, i64) -> i64
      %3201 = llvm.mlir.addressof @str405 : !llvm.ptr
      %3202 = arith.constant 4 : i64
      %3203 = func.call @cc_make_string(%3201, %3202) : (!llvm.ptr, i64) -> i64
      %3204 = func.call @cc_intern(%3200, %3203) : (i64, i64) -> i64
      %3205 = func.call @cc_nil_value() : () -> i64
      %3206 = func.call @cc_cons(%3204, %3205) : (i64, i64) -> i64
      %3207 = func.call @cc_values_pack(%3206) : (i64) -> i64
      func.call @stack_push_pointer(%3204) : (i64) -> ()
      %3208 = llvm.mlir.addressof @str406 : !llvm.ptr
      %3209 = arith.constant 35 : i64
      %3210 = func.call @cc_make_string(%3208, %3209) : (!llvm.ptr, i64) -> i64
      %3211 = llvm.mlir.addressof @str407 : !llvm.ptr
      %3212 = arith.constant 4 : i64
      %3213 = func.call @cc_make_string(%3211, %3212) : (!llvm.ptr, i64) -> i64
      %3214 = func.call @cc_intern(%3210, %3213) : (i64, i64) -> i64
      %3215 = func.call @cc_nil_value() : () -> i64
      %3216 = func.call @cc_cons(%3214, %3215) : (i64, i64) -> i64
      %3217 = func.call @cc_values_pack(%3216) : (i64) -> i64
      func.call @stack_push_pointer(%3214) : (i64) -> ()
      %3218 = llvm.mlir.addressof @str408 : !llvm.ptr
      %3219 = arith.constant 24 : i64
      %3220 = func.call @cc_make_string(%3218, %3219) : (!llvm.ptr, i64) -> i64
      %3221 = llvm.mlir.addressof @str409 : !llvm.ptr
      %3222 = arith.constant 4 : i64
      %3223 = func.call @cc_make_string(%3221, %3222) : (!llvm.ptr, i64) -> i64
      %3224 = func.call @cc_intern(%3220, %3223) : (i64, i64) -> i64
      %3225 = func.call @cc_nil_value() : () -> i64
      %3226 = func.call @cc_cons(%3224, %3225) : (i64, i64) -> i64
      %3227 = func.call @cc_values_pack(%3226) : (i64) -> i64
      func.call @stack_push_pointer(%3224) : (i64) -> ()
      %3228 = llvm.mlir.addressof @str410 : !llvm.ptr
      %3229 = arith.constant 18 : i64
      %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = llvm.mlir.addressof @str411 : !llvm.ptr
      %3232 = arith.constant 4 : i64
      %3233 = func.call @cc_make_string(%3231, %3232) : (!llvm.ptr, i64) -> i64
      %3234 = func.call @cc_intern(%3230, %3233) : (i64, i64) -> i64
      %3235 = func.call @cc_nil_value() : () -> i64
      %3236 = func.call @cc_cons(%3234, %3235) : (i64, i64) -> i64
      %3237 = func.call @cc_values_pack(%3236) : (i64) -> i64
      func.call @stack_push_pointer(%3234) : (i64) -> ()
      %3238 = llvm.mlir.addressof @str412 : !llvm.ptr
      %3239 = arith.constant 14 : i64
      %3240 = func.call @cc_make_string(%3238, %3239) : (!llvm.ptr, i64) -> i64
      %3241 = llvm.mlir.addressof @str413 : !llvm.ptr
      %3242 = arith.constant 4 : i64
      %3243 = func.call @cc_make_string(%3241, %3242) : (!llvm.ptr, i64) -> i64
      %3244 = func.call @cc_intern(%3240, %3243) : (i64, i64) -> i64
      %3245 = func.call @cc_nil_value() : () -> i64
      %3246 = func.call @cc_cons(%3244, %3245) : (i64, i64) -> i64
      %3247 = func.call @cc_values_pack(%3246) : (i64) -> i64
      func.call @stack_push_pointer(%3244) : (i64) -> ()
      %3248 = llvm.mlir.addressof @str414 : !llvm.ptr
      %3249 = arith.constant 15 : i64
      %3250 = func.call @cc_make_string(%3248, %3249) : (!llvm.ptr, i64) -> i64
      %3251 = llvm.mlir.addressof @str415 : !llvm.ptr
      %3252 = arith.constant 4 : i64
      %3253 = func.call @cc_make_string(%3251, %3252) : (!llvm.ptr, i64) -> i64
      %3254 = func.call @cc_intern(%3250, %3253) : (i64, i64) -> i64
      %3255 = func.call @cc_nil_value() : () -> i64
      %3256 = func.call @cc_cons(%3254, %3255) : (i64, i64) -> i64
      %3257 = func.call @cc_values_pack(%3256) : (i64) -> i64
      func.call @stack_push_pointer(%3254) : (i64) -> ()
      %3258 = llvm.mlir.addressof @str416 : !llvm.ptr
      %3259 = arith.constant 23 : i64
      %3260 = func.call @cc_make_string(%3258, %3259) : (!llvm.ptr, i64) -> i64
      %3261 = llvm.mlir.addressof @str417 : !llvm.ptr
      %3262 = arith.constant 4 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = func.call @cc_intern(%3260, %3263) : (i64, i64) -> i64
      %3265 = func.call @cc_nil_value() : () -> i64
      %3266 = func.call @cc_cons(%3264, %3265) : (i64, i64) -> i64
      %3267 = func.call @cc_values_pack(%3266) : (i64) -> i64
      func.call @stack_push_pointer(%3264) : (i64) -> ()
      %3268 = llvm.mlir.addressof @str418 : !llvm.ptr
      %3269 = arith.constant 18 : i64
      %3270 = func.call @cc_make_string(%3268, %3269) : (!llvm.ptr, i64) -> i64
      %3271 = llvm.mlir.addressof @str419 : !llvm.ptr
      %3272 = arith.constant 4 : i64
      %3273 = func.call @cc_make_string(%3271, %3272) : (!llvm.ptr, i64) -> i64
      %3274 = func.call @cc_intern(%3270, %3273) : (i64, i64) -> i64
      %3275 = func.call @cc_nil_value() : () -> i64
      %3276 = func.call @cc_cons(%3274, %3275) : (i64, i64) -> i64
      %3277 = func.call @cc_values_pack(%3276) : (i64) -> i64
      func.call @stack_push_pointer(%3274) : (i64) -> ()
      %3278 = llvm.mlir.addressof @str420 : !llvm.ptr
      %3279 = arith.constant 19 : i64
      %3280 = func.call @cc_make_string(%3278, %3279) : (!llvm.ptr, i64) -> i64
      %3281 = llvm.mlir.addressof @str421 : !llvm.ptr
      %3282 = arith.constant 4 : i64
      %3283 = func.call @cc_make_string(%3281, %3282) : (!llvm.ptr, i64) -> i64
      %3284 = func.call @cc_intern(%3280, %3283) : (i64, i64) -> i64
      %3285 = func.call @cc_nil_value() : () -> i64
      %3286 = func.call @cc_cons(%3284, %3285) : (i64, i64) -> i64
      %3287 = func.call @cc_values_pack(%3286) : (i64) -> i64
      func.call @stack_push_pointer(%3284) : (i64) -> ()
      %3288 = llvm.mlir.addressof @str422 : !llvm.ptr
      %3289 = arith.constant 17 : i64
      %3290 = func.call @cc_make_string(%3288, %3289) : (!llvm.ptr, i64) -> i64
      %3291 = llvm.mlir.addressof @str423 : !llvm.ptr
      %3292 = arith.constant 4 : i64
      %3293 = func.call @cc_make_string(%3291, %3292) : (!llvm.ptr, i64) -> i64
      %3294 = func.call @cc_intern(%3290, %3293) : (i64, i64) -> i64
      %3295 = func.call @cc_nil_value() : () -> i64
      %3296 = func.call @cc_cons(%3294, %3295) : (i64, i64) -> i64
      %3297 = func.call @cc_values_pack(%3296) : (i64) -> i64
      func.call @stack_push_pointer(%3294) : (i64) -> ()
      %3298 = llvm.mlir.addressof @str424 : !llvm.ptr
      %3299 = arith.constant 26 : i64
      %3300 = func.call @cc_make_string(%3298, %3299) : (!llvm.ptr, i64) -> i64
      %3301 = llvm.mlir.addressof @str425 : !llvm.ptr
      %3302 = arith.constant 4 : i64
      %3303 = func.call @cc_make_string(%3301, %3302) : (!llvm.ptr, i64) -> i64
      %3304 = func.call @cc_intern(%3300, %3303) : (i64, i64) -> i64
      %3305 = func.call @cc_nil_value() : () -> i64
      %3306 = func.call @cc_cons(%3304, %3305) : (i64, i64) -> i64
      %3307 = func.call @cc_values_pack(%3306) : (i64) -> i64
      func.call @stack_push_pointer(%3304) : (i64) -> ()
      %3308 = llvm.mlir.addressof @str426 : !llvm.ptr
      %3309 = arith.constant 28 : i64
      %3310 = func.call @cc_make_string(%3308, %3309) : (!llvm.ptr, i64) -> i64
      %3311 = llvm.mlir.addressof @str427 : !llvm.ptr
      %3312 = arith.constant 4 : i64
      %3313 = func.call @cc_make_string(%3311, %3312) : (!llvm.ptr, i64) -> i64
      %3314 = func.call @cc_intern(%3310, %3313) : (i64, i64) -> i64
      %3315 = func.call @cc_nil_value() : () -> i64
      %3316 = func.call @cc_cons(%3314, %3315) : (i64, i64) -> i64
      %3317 = func.call @cc_values_pack(%3316) : (i64) -> i64
      func.call @stack_push_pointer(%3314) : (i64) -> ()
      %3318 = llvm.mlir.addressof @str428 : !llvm.ptr
      %3319 = arith.constant 24 : i64
      %3320 = func.call @cc_make_string(%3318, %3319) : (!llvm.ptr, i64) -> i64
      %3321 = llvm.mlir.addressof @str429 : !llvm.ptr
      %3322 = arith.constant 4 : i64
      %3323 = func.call @cc_make_string(%3321, %3322) : (!llvm.ptr, i64) -> i64
      %3324 = func.call @cc_intern(%3320, %3323) : (i64, i64) -> i64
      %3325 = func.call @cc_nil_value() : () -> i64
      %3326 = func.call @cc_cons(%3324, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
      func.call @stack_push_pointer(%3324) : (i64) -> ()
      %3328 = llvm.mlir.addressof @str430 : !llvm.ptr
      %3329 = arith.constant 20 : i64
      %3330 = func.call @cc_make_string(%3328, %3329) : (!llvm.ptr, i64) -> i64
      %3331 = llvm.mlir.addressof @str431 : !llvm.ptr
      %3332 = arith.constant 4 : i64
      %3333 = func.call @cc_make_string(%3331, %3332) : (!llvm.ptr, i64) -> i64
      %3334 = func.call @cc_intern(%3330, %3333) : (i64, i64) -> i64
      %3335 = func.call @cc_nil_value() : () -> i64
      %3336 = func.call @cc_cons(%3334, %3335) : (i64, i64) -> i64
      %3337 = func.call @cc_values_pack(%3336) : (i64) -> i64
      func.call @stack_push_pointer(%3334) : (i64) -> ()
      %3338 = llvm.mlir.addressof @str432 : !llvm.ptr
      %3339 = arith.constant 20 : i64
      %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
      %3341 = llvm.mlir.addressof @str433 : !llvm.ptr
      %3342 = arith.constant 4 : i64
      %3343 = func.call @cc_make_string(%3341, %3342) : (!llvm.ptr, i64) -> i64
      %3344 = func.call @cc_intern(%3340, %3343) : (i64, i64) -> i64
      %3345 = func.call @cc_nil_value() : () -> i64
      %3346 = func.call @cc_cons(%3344, %3345) : (i64, i64) -> i64
      %3347 = func.call @cc_values_pack(%3346) : (i64) -> i64
      func.call @stack_push_pointer(%3344) : (i64) -> ()
      %3348 = llvm.mlir.addressof @str434 : !llvm.ptr
      %3349 = arith.constant 23 : i64
      %3350 = func.call @cc_make_string(%3348, %3349) : (!llvm.ptr, i64) -> i64
      %3351 = llvm.mlir.addressof @str435 : !llvm.ptr
      %3352 = arith.constant 4 : i64
      %3353 = func.call @cc_make_string(%3351, %3352) : (!llvm.ptr, i64) -> i64
      %3354 = func.call @cc_intern(%3350, %3353) : (i64, i64) -> i64
      %3355 = func.call @cc_nil_value() : () -> i64
      %3356 = func.call @cc_cons(%3354, %3355) : (i64, i64) -> i64
      %3357 = func.call @cc_values_pack(%3356) : (i64) -> i64
      func.call @stack_push_pointer(%3354) : (i64) -> ()
      %3358 = llvm.mlir.addressof @str436 : !llvm.ptr
      %3359 = arith.constant 23 : i64
      %3360 = func.call @cc_make_string(%3358, %3359) : (!llvm.ptr, i64) -> i64
      %3361 = llvm.mlir.addressof @str437 : !llvm.ptr
      %3362 = arith.constant 4 : i64
      %3363 = func.call @cc_make_string(%3361, %3362) : (!llvm.ptr, i64) -> i64
      %3364 = func.call @cc_intern(%3360, %3363) : (i64, i64) -> i64
      %3365 = func.call @cc_nil_value() : () -> i64
      %3366 = func.call @cc_cons(%3364, %3365) : (i64, i64) -> i64
      %3367 = func.call @cc_values_pack(%3366) : (i64) -> i64
      func.call @stack_push_pointer(%3364) : (i64) -> ()
      %3368 = llvm.mlir.addressof @str438 : !llvm.ptr
      %3369 = arith.constant 24 : i64
      %3370 = func.call @cc_make_string(%3368, %3369) : (!llvm.ptr, i64) -> i64
      %3371 = llvm.mlir.addressof @str439 : !llvm.ptr
      %3372 = arith.constant 4 : i64
      %3373 = func.call @cc_make_string(%3371, %3372) : (!llvm.ptr, i64) -> i64
      %3374 = func.call @cc_intern(%3370, %3373) : (i64, i64) -> i64
      %3375 = func.call @cc_nil_value() : () -> i64
      %3376 = func.call @cc_cons(%3374, %3375) : (i64, i64) -> i64
      %3377 = func.call @cc_values_pack(%3376) : (i64) -> i64
      func.call @stack_push_pointer(%3374) : (i64) -> ()
      %3378 = llvm.mlir.addressof @str440 : !llvm.ptr
      %3379 = arith.constant 19 : i64
      %3380 = func.call @cc_make_string(%3378, %3379) : (!llvm.ptr, i64) -> i64
      %3381 = llvm.mlir.addressof @str441 : !llvm.ptr
      %3382 = arith.constant 4 : i64
      %3383 = func.call @cc_make_string(%3381, %3382) : (!llvm.ptr, i64) -> i64
      %3384 = func.call @cc_intern(%3380, %3383) : (i64, i64) -> i64
      %3385 = func.call @cc_nil_value() : () -> i64
      %3386 = func.call @cc_cons(%3384, %3385) : (i64, i64) -> i64
      %3387 = func.call @cc_values_pack(%3386) : (i64) -> i64
      func.call @stack_push_pointer(%3384) : (i64) -> ()
      %3388 = llvm.mlir.addressof @str442 : !llvm.ptr
      %3389 = arith.constant 16 : i64
      %3390 = func.call @cc_make_string(%3388, %3389) : (!llvm.ptr, i64) -> i64
      %3391 = llvm.mlir.addressof @str443 : !llvm.ptr
      %3392 = arith.constant 4 : i64
      %3393 = func.call @cc_make_string(%3391, %3392) : (!llvm.ptr, i64) -> i64
      %3394 = func.call @cc_intern(%3390, %3393) : (i64, i64) -> i64
      %3395 = func.call @cc_nil_value() : () -> i64
      %3396 = func.call @cc_cons(%3394, %3395) : (i64, i64) -> i64
      %3397 = func.call @cc_values_pack(%3396) : (i64) -> i64
      func.call @stack_push_pointer(%3394) : (i64) -> ()
      %3398 = llvm.mlir.addressof @str444 : !llvm.ptr
      %3399 = arith.constant 20 : i64
      %3400 = func.call @cc_make_string(%3398, %3399) : (!llvm.ptr, i64) -> i64
      %3401 = llvm.mlir.addressof @str445 : !llvm.ptr
      %3402 = arith.constant 4 : i64
      %3403 = func.call @cc_make_string(%3401, %3402) : (!llvm.ptr, i64) -> i64
      %3404 = func.call @cc_intern(%3400, %3403) : (i64, i64) -> i64
      %3405 = func.call @cc_nil_value() : () -> i64
      %3406 = func.call @cc_cons(%3404, %3405) : (i64, i64) -> i64
      %3407 = func.call @cc_values_pack(%3406) : (i64) -> i64
      func.call @stack_push_pointer(%3404) : (i64) -> ()
      %3408 = llvm.mlir.addressof @str446 : !llvm.ptr
      %3409 = arith.constant 22 : i64
      %3410 = func.call @cc_make_string(%3408, %3409) : (!llvm.ptr, i64) -> i64
      %3411 = llvm.mlir.addressof @str447 : !llvm.ptr
      %3412 = arith.constant 4 : i64
      %3413 = func.call @cc_make_string(%3411, %3412) : (!llvm.ptr, i64) -> i64
      %3414 = func.call @cc_intern(%3410, %3413) : (i64, i64) -> i64
      %3415 = func.call @cc_nil_value() : () -> i64
      %3416 = func.call @cc_cons(%3414, %3415) : (i64, i64) -> i64
      %3417 = func.call @cc_values_pack(%3416) : (i64) -> i64
      func.call @stack_push_pointer(%3414) : (i64) -> ()
      %3418 = llvm.mlir.addressof @str448 : !llvm.ptr
      %3419 = arith.constant 23 : i64
      %3420 = func.call @cc_make_string(%3418, %3419) : (!llvm.ptr, i64) -> i64
      %3421 = llvm.mlir.addressof @str449 : !llvm.ptr
      %3422 = arith.constant 4 : i64
      %3423 = func.call @cc_make_string(%3421, %3422) : (!llvm.ptr, i64) -> i64
      %3424 = func.call @cc_intern(%3420, %3423) : (i64, i64) -> i64
      %3425 = func.call @cc_nil_value() : () -> i64
      %3426 = func.call @cc_cons(%3424, %3425) : (i64, i64) -> i64
      %3427 = func.call @cc_values_pack(%3426) : (i64) -> i64
      func.call @stack_push_pointer(%3424) : (i64) -> ()
      %3428 = llvm.mlir.addressof @str450 : !llvm.ptr
      %3429 = arith.constant 27 : i64
      %3430 = func.call @cc_make_string(%3428, %3429) : (!llvm.ptr, i64) -> i64
      %3431 = llvm.mlir.addressof @str451 : !llvm.ptr
      %3432 = arith.constant 4 : i64
      %3433 = func.call @cc_make_string(%3431, %3432) : (!llvm.ptr, i64) -> i64
      %3434 = func.call @cc_intern(%3430, %3433) : (i64, i64) -> i64
      %3435 = func.call @cc_nil_value() : () -> i64
      %3436 = func.call @cc_cons(%3434, %3435) : (i64, i64) -> i64
      %3437 = func.call @cc_values_pack(%3436) : (i64) -> i64
      func.call @stack_push_pointer(%3434) : (i64) -> ()
      %3438 = llvm.mlir.addressof @str452 : !llvm.ptr
      %3439 = arith.constant 36 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = llvm.mlir.addressof @str453 : !llvm.ptr
      %3442 = arith.constant 4 : i64
      %3443 = func.call @cc_make_string(%3441, %3442) : (!llvm.ptr, i64) -> i64
      %3444 = func.call @cc_intern(%3440, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_nil_value() : () -> i64
      %3446 = func.call @cc_cons(%3444, %3445) : (i64, i64) -> i64
      %3447 = func.call @cc_values_pack(%3446) : (i64) -> i64
      func.call @stack_push_pointer(%3444) : (i64) -> ()
      %3448 = llvm.mlir.addressof @str454 : !llvm.ptr
      %3449 = arith.constant 26 : i64
      %3450 = func.call @cc_make_string(%3448, %3449) : (!llvm.ptr, i64) -> i64
      %3451 = llvm.mlir.addressof @str455 : !llvm.ptr
      %3452 = arith.constant 4 : i64
      %3453 = func.call @cc_make_string(%3451, %3452) : (!llvm.ptr, i64) -> i64
      %3454 = func.call @cc_intern(%3450, %3453) : (i64, i64) -> i64
      %3455 = func.call @cc_nil_value() : () -> i64
      %3456 = func.call @cc_cons(%3454, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_values_pack(%3456) : (i64) -> i64
      func.call @stack_push_pointer(%3454) : (i64) -> ()
      %3458 = llvm.mlir.addressof @str456 : !llvm.ptr
      %3459 = arith.constant 16 : i64
      %3460 = func.call @cc_make_string(%3458, %3459) : (!llvm.ptr, i64) -> i64
      %3461 = llvm.mlir.addressof @str457 : !llvm.ptr
      %3462 = arith.constant 4 : i64
      %3463 = func.call @cc_make_string(%3461, %3462) : (!llvm.ptr, i64) -> i64
      %3464 = func.call @cc_intern(%3460, %3463) : (i64, i64) -> i64
      %3465 = func.call @cc_nil_value() : () -> i64
      %3466 = func.call @cc_cons(%3464, %3465) : (i64, i64) -> i64
      %3467 = func.call @cc_values_pack(%3466) : (i64) -> i64
      func.call @stack_push_pointer(%3464) : (i64) -> ()
      %3468 = llvm.mlir.addressof @str458 : !llvm.ptr
      %3469 = arith.constant 19 : i64
      %3470 = func.call @cc_make_string(%3468, %3469) : (!llvm.ptr, i64) -> i64
      %3471 = llvm.mlir.addressof @str459 : !llvm.ptr
      %3472 = arith.constant 4 : i64
      %3473 = func.call @cc_make_string(%3471, %3472) : (!llvm.ptr, i64) -> i64
      %3474 = func.call @cc_intern(%3470, %3473) : (i64, i64) -> i64
      %3475 = func.call @cc_nil_value() : () -> i64
      %3476 = func.call @cc_cons(%3474, %3475) : (i64, i64) -> i64
      %3477 = func.call @cc_values_pack(%3476) : (i64) -> i64
      func.call @stack_push_pointer(%3474) : (i64) -> ()
      %3478 = llvm.mlir.addressof @str460 : !llvm.ptr
      %3479 = arith.constant 19 : i64
      %3480 = func.call @cc_make_string(%3478, %3479) : (!llvm.ptr, i64) -> i64
      %3481 = llvm.mlir.addressof @str461 : !llvm.ptr
      %3482 = arith.constant 4 : i64
      %3483 = func.call @cc_make_string(%3481, %3482) : (!llvm.ptr, i64) -> i64
      %3484 = func.call @cc_intern(%3480, %3483) : (i64, i64) -> i64
      %3485 = func.call @cc_nil_value() : () -> i64
      %3486 = func.call @cc_cons(%3484, %3485) : (i64, i64) -> i64
      %3487 = func.call @cc_values_pack(%3486) : (i64) -> i64
      func.call @stack_push_pointer(%3484) : (i64) -> ()
      %3488 = llvm.mlir.addressof @str462 : !llvm.ptr
      %3489 = arith.constant 22 : i64
      %3490 = func.call @cc_make_string(%3488, %3489) : (!llvm.ptr, i64) -> i64
      %3491 = llvm.mlir.addressof @str463 : !llvm.ptr
      %3492 = arith.constant 4 : i64
      %3493 = func.call @cc_make_string(%3491, %3492) : (!llvm.ptr, i64) -> i64
      %3494 = func.call @cc_intern(%3490, %3493) : (i64, i64) -> i64
      %3495 = func.call @cc_nil_value() : () -> i64
      %3496 = func.call @cc_cons(%3494, %3495) : (i64, i64) -> i64
      %3497 = func.call @cc_values_pack(%3496) : (i64) -> i64
      func.call @stack_push_pointer(%3494) : (i64) -> ()
      %3498 = llvm.mlir.addressof @str464 : !llvm.ptr
      %3499 = arith.constant 19 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = llvm.mlir.addressof @str465 : !llvm.ptr
      %3502 = arith.constant 4 : i64
      %3503 = func.call @cc_make_string(%3501, %3502) : (!llvm.ptr, i64) -> i64
      %3504 = func.call @cc_intern(%3500, %3503) : (i64, i64) -> i64
      %3505 = func.call @cc_nil_value() : () -> i64
      %3506 = func.call @cc_cons(%3504, %3505) : (i64, i64) -> i64
      %3507 = func.call @cc_values_pack(%3506) : (i64) -> i64
      func.call @stack_push_pointer(%3504) : (i64) -> ()
      %3508 = llvm.mlir.addressof @str466 : !llvm.ptr
      %3509 = arith.constant 25 : i64
      %3510 = func.call @cc_make_string(%3508, %3509) : (!llvm.ptr, i64) -> i64
      %3511 = llvm.mlir.addressof @str467 : !llvm.ptr
      %3512 = arith.constant 4 : i64
      %3513 = func.call @cc_make_string(%3511, %3512) : (!llvm.ptr, i64) -> i64
      %3514 = func.call @cc_intern(%3510, %3513) : (i64, i64) -> i64
      %3515 = func.call @cc_nil_value() : () -> i64
      %3516 = func.call @cc_cons(%3514, %3515) : (i64, i64) -> i64
      %3517 = func.call @cc_values_pack(%3516) : (i64) -> i64
      func.call @stack_push_pointer(%3514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3518 = func.call @stack_pop_pointer() : () -> i64
      %3519 = func.call @stack_pop_pointer() : () -> i64
      %3520 = func.call @cc_cons(%3519, %3518) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %3521 = arith.addi %3520, %__rlasp_stack_elide_zero_108 : i64
      %3522 = func.call @stack_pop_pointer() : () -> i64
      %3523 = func.call @cc_cons(%3522, %3521) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %3524 = arith.addi %3523, %__rlasp_stack_elide_zero_109 : i64
      %3525 = func.call @stack_pop_pointer() : () -> i64
      %3526 = func.call @cc_cons(%3525, %3524) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %3527 = arith.addi %3526, %__rlasp_stack_elide_zero_110 : i64
      %3528 = func.call @stack_pop_pointer() : () -> i64
      %3529 = func.call @cc_cons(%3528, %3527) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %3530 = arith.addi %3529, %__rlasp_stack_elide_zero_111 : i64
      %3531 = func.call @stack_pop_pointer() : () -> i64
      %3532 = func.call @cc_cons(%3531, %3530) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %3533 = arith.addi %3532, %__rlasp_stack_elide_zero_112 : i64
      %3534 = func.call @stack_pop_pointer() : () -> i64
      %3535 = func.call @cc_cons(%3534, %3533) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %3536 = arith.addi %3535, %__rlasp_stack_elide_zero_113 : i64
      %3537 = func.call @stack_pop_pointer() : () -> i64
      %3538 = func.call @cc_cons(%3537, %3536) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %3539 = arith.addi %3538, %__rlasp_stack_elide_zero_114 : i64
      %3540 = func.call @stack_pop_pointer() : () -> i64
      %3541 = func.call @cc_cons(%3540, %3539) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %3542 = arith.addi %3541, %__rlasp_stack_elide_zero_115 : i64
      %3543 = func.call @stack_pop_pointer() : () -> i64
      %3544 = func.call @cc_cons(%3543, %3542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %3545 = arith.addi %3544, %__rlasp_stack_elide_zero_116 : i64
      %3546 = func.call @stack_pop_pointer() : () -> i64
      %3547 = func.call @cc_cons(%3546, %3545) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %3548 = arith.addi %3547, %__rlasp_stack_elide_zero_117 : i64
      %3549 = func.call @stack_pop_pointer() : () -> i64
      %3550 = func.call @cc_cons(%3549, %3548) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %3551 = arith.addi %3550, %__rlasp_stack_elide_zero_118 : i64
      %3552 = func.call @stack_pop_pointer() : () -> i64
      %3553 = func.call @cc_cons(%3552, %3551) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %3554 = arith.addi %3553, %__rlasp_stack_elide_zero_119 : i64
      %3555 = func.call @stack_pop_pointer() : () -> i64
      %3556 = func.call @cc_cons(%3555, %3554) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %3557 = arith.addi %3556, %__rlasp_stack_elide_zero_120 : i64
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = func.call @cc_cons(%3558, %3557) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %3560 = arith.addi %3559, %__rlasp_stack_elide_zero_121 : i64
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @cc_cons(%3561, %3560) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %3563 = arith.addi %3562, %__rlasp_stack_elide_zero_122 : i64
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3565 = func.call @cc_cons(%3564, %3563) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %3566 = arith.addi %3565, %__rlasp_stack_elide_zero_123 : i64
      %3567 = func.call @stack_pop_pointer() : () -> i64
      %3568 = func.call @cc_cons(%3567, %3566) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %3569 = arith.addi %3568, %__rlasp_stack_elide_zero_124 : i64
      %3570 = func.call @stack_pop_pointer() : () -> i64
      %3571 = func.call @cc_cons(%3570, %3569) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %3572 = arith.addi %3571, %__rlasp_stack_elide_zero_125 : i64
      %3573 = func.call @stack_pop_pointer() : () -> i64
      %3574 = func.call @cc_cons(%3573, %3572) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %3575 = arith.addi %3574, %__rlasp_stack_elide_zero_126 : i64
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @cc_cons(%3576, %3575) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %3578 = arith.addi %3577, %__rlasp_stack_elide_zero_127 : i64
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @cc_cons(%3579, %3578) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %3581 = arith.addi %3580, %__rlasp_stack_elide_zero_128 : i64
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @cc_cons(%3582, %3581) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %3584 = arith.addi %3583, %__rlasp_stack_elide_zero_129 : i64
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = func.call @cc_cons(%3585, %3584) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %3587 = arith.addi %3586, %__rlasp_stack_elide_zero_130 : i64
      %3588 = func.call @stack_pop_pointer() : () -> i64
      %3589 = func.call @cc_cons(%3588, %3587) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %3590 = arith.addi %3589, %__rlasp_stack_elide_zero_131 : i64
      %3591 = func.call @stack_pop_pointer() : () -> i64
      %3592 = func.call @cc_cons(%3591, %3590) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %3593 = arith.addi %3592, %__rlasp_stack_elide_zero_132 : i64
      %3594 = func.call @stack_pop_pointer() : () -> i64
      %3595 = func.call @cc_cons(%3594, %3593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %3596 = arith.addi %3595, %__rlasp_stack_elide_zero_133 : i64
      %3597 = func.call @stack_pop_pointer() : () -> i64
      %3598 = func.call @cc_cons(%3597, %3596) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %3599 = arith.addi %3598, %__rlasp_stack_elide_zero_134 : i64
      %3600 = func.call @stack_pop_pointer() : () -> i64
      %3601 = func.call @cc_cons(%3600, %3599) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %3602 = arith.addi %3601, %__rlasp_stack_elide_zero_135 : i64
      %3603 = func.call @stack_pop_pointer() : () -> i64
      %3604 = func.call @cc_cons(%3603, %3602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %3605 = arith.addi %3604, %__rlasp_stack_elide_zero_136 : i64
      %3606 = func.call @stack_pop_pointer() : () -> i64
      %3607 = func.call @cc_cons(%3606, %3605) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %3608 = arith.addi %3607, %__rlasp_stack_elide_zero_137 : i64
      %3609 = func.call @stack_pop_pointer() : () -> i64
      %3610 = func.call @cc_cons(%3609, %3608) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %3611 = arith.addi %3610, %__rlasp_stack_elide_zero_138 : i64
      %3612 = func.call @stack_pop_pointer() : () -> i64
      %3613 = func.call @cc_cons(%3612, %3611) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %3614 = arith.addi %3613, %__rlasp_stack_elide_zero_139 : i64
      %3615 = func.call @stack_pop_pointer() : () -> i64
      %3616 = func.call @cc_cons(%3615, %3614) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3617 = arith.addi %3616, %__rlasp_stack_elide_zero_140 : i64
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @cc_cons(%3618, %3617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3620 = arith.addi %3619, %__rlasp_stack_elide_zero_141 : i64
      %3621 = func.call @stack_pop_pointer() : () -> i64
      %3622 = func.call @cc_cons(%3621, %3620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3623 = arith.addi %3622, %__rlasp_stack_elide_zero_142 : i64
      %3624 = func.call @stack_pop_pointer() : () -> i64
      %3625 = func.call @cc_cons(%3624, %3623) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3626 = arith.addi %3625, %__rlasp_stack_elide_zero_143 : i64
      %3627 = func.call @stack_pop_pointer() : () -> i64
      %3628 = func.call @cc_cons(%3627, %3626) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3629 = arith.addi %3628, %__rlasp_stack_elide_zero_144 : i64
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = func.call @cc_cons(%3630, %3629) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3632 = arith.addi %3631, %__rlasp_stack_elide_zero_145 : i64
      %3633 = func.call @stack_pop_pointer() : () -> i64
      %3634 = func.call @cc_cons(%3633, %3632) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3635 = arith.addi %3634, %__rlasp_stack_elide_zero_146 : i64
      %3636 = func.call @stack_pop_pointer() : () -> i64
      %3637 = func.call @cc_cons(%3636, %3635) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3638 = arith.addi %3637, %__rlasp_stack_elide_zero_147 : i64
      %3639 = func.call @stack_pop_pointer() : () -> i64
      %3640 = func.call @cc_cons(%3639, %3638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3641 = arith.addi %3640, %__rlasp_stack_elide_zero_148 : i64
      %3642 = func.call @stack_pop_pointer() : () -> i64
      %3643 = func.call @cc_cons(%3642, %3641) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3644 = arith.addi %3643, %__rlasp_stack_elide_zero_149 : i64
      %3645 = func.call @stack_pop_pointer() : () -> i64
      %3646 = func.call @cc_cons(%3645, %3644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3647 = arith.addi %3646, %__rlasp_stack_elide_zero_150 : i64
      %3648 = func.call @stack_pop_pointer() : () -> i64
      %3649 = func.call @cc_cons(%3648, %3647) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3650 = arith.addi %3649, %__rlasp_stack_elide_zero_151 : i64
      %3651 = func.call @stack_pop_pointer() : () -> i64
      %3652 = func.call @cc_cons(%3651, %3650) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3653 = arith.addi %3652, %__rlasp_stack_elide_zero_152 : i64
      %3654 = func.call @stack_pop_pointer() : () -> i64
      %3655 = func.call @cc_cons(%3654, %3653) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3656 = arith.addi %3655, %__rlasp_stack_elide_zero_153 : i64
      %3657 = func.call @stack_pop_pointer() : () -> i64
      %3658 = func.call @cc_cons(%3657, %3656) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3659 = arith.addi %3658, %__rlasp_stack_elide_zero_154 : i64
      %3660 = func.call @stack_pop_pointer() : () -> i64
      %3661 = func.call @cc_cons(%3660, %3659) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3662 = arith.addi %3661, %__rlasp_stack_elide_zero_155 : i64
      %3663 = func.call @stack_pop_pointer() : () -> i64
      %3664 = func.call @cc_cons(%3663, %3662) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3665 = arith.addi %3664, %__rlasp_stack_elide_zero_156 : i64
      %3666 = func.call @stack_pop_pointer() : () -> i64
      %3667 = func.call @cc_cons(%3666, %3665) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3668 = arith.addi %3667, %__rlasp_stack_elide_zero_157 : i64
      %3669 = func.call @stack_pop_pointer() : () -> i64
      %3670 = func.call @cc_cons(%3669, %3668) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3671 = arith.addi %3670, %__rlasp_stack_elide_zero_158 : i64
      %3672 = func.call @stack_pop_pointer() : () -> i64
      %3673 = func.call @cc_cons(%3672, %3671) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3674 = arith.addi %3673, %__rlasp_stack_elide_zero_159 : i64
      %3675 = func.call @stack_pop_pointer() : () -> i64
      %3676 = func.call @cc_cons(%3675, %3674) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3677 = arith.addi %3676, %__rlasp_stack_elide_zero_160 : i64
      %3678 = func.call @stack_pop_pointer() : () -> i64
      %3679 = func.call @cc_cons(%3678, %3677) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3680 = arith.addi %3679, %__rlasp_stack_elide_zero_161 : i64
      %3681 = func.call @stack_pop_pointer() : () -> i64
      %3682 = func.call @cc_cons(%3681, %3680) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3683 = arith.addi %3682, %__rlasp_stack_elide_zero_162 : i64
      %3684 = func.call @stack_pop_pointer() : () -> i64
      %3685 = func.call @cc_cons(%3684, %3683) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3686 = arith.addi %3685, %__rlasp_stack_elide_zero_163 : i64
      %3687 = func.call @stack_pop_pointer() : () -> i64
      %3688 = func.call @cc_cons(%3687, %3686) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3689 = arith.addi %3688, %__rlasp_stack_elide_zero_164 : i64
      %3690 = func.call @stack_pop_pointer() : () -> i64
      %3691 = func.call @cc_cons(%3690, %3689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3692 = arith.addi %3691, %__rlasp_stack_elide_zero_165 : i64
      %3693 = func.call @stack_pop_pointer() : () -> i64
      %3694 = func.call @cc_cons(%3693, %3692) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3695 = arith.addi %3694, %__rlasp_stack_elide_zero_166 : i64
      %3696 = func.call @stack_pop_pointer() : () -> i64
      %3697 = func.call @cc_cons(%3695, %3696) : (i64, i64) -> i64
      %3698 = llvm.mlir.addressof @str468 : !llvm.ptr
      %3699 = arith.constant 5 : i64
      %3700 = func.call @cc_make_string(%3698, %3699) : (!llvm.ptr, i64) -> i64
      %3701 = func.call @cc_nil_value() : () -> i64
      %3702 = func.call @cc_intern(%3700, %3701) : (i64, i64) -> i64
      %3703 = func.call @cc_nil_value() : () -> i64
      %3704 = func.call @cc_cons(%3702, %3703) : (i64, i64) -> i64
      %3705 = func.call @cc_values_pack(%3704) : (i64) -> i64
      %3706 = func.call @cc_cons(%3702, %3697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3707 = func.call @stack_pop_pointer() : () -> i64
      %3708 = func.call @stack_pop_pointer() : () -> i64
      %3709 = func.call @cc_cons(%3708, %3707) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3710 = arith.addi %3709, %__rlasp_stack_elide_zero_167 : i64
      %3711 = func.call @stack_pop_pointer() : () -> i64
      %3712 = func.call @cc_cons(%3711, %3710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3713 = func.call @stack_pop_pointer() : () -> i64
      %3714 = func.call @stack_pop_pointer() : () -> i64
      %3715 = func.call @cc_cons(%3714, %3713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3715) : (i64) -> ()
      %3716 = llvm.mlir.addressof @str469 : !llvm.ptr
      %3717 = arith.constant 4 : i64
      %3718 = func.call @cc_make_string(%3716, %3717) : (!llvm.ptr, i64) -> i64
      %3719 = func.call @cc_nil_value() : () -> i64
      %3720 = func.call @cc_intern(%3718, %3719) : (i64, i64) -> i64
      %3721 = func.call @cc_nil_value() : () -> i64
      %3722 = func.call @cc_cons(%3720, %3721) : (i64, i64) -> i64
      %3723 = func.call @cc_values_pack(%3722) : (i64) -> i64
      func.call @stack_push_pointer(%3720) : (i64) -> ()
      %3724 = llvm.mlir.addressof @str470 : !llvm.ptr
      %3725 = arith.constant 3 : i64
      %3726 = func.call @cc_make_string(%3724, %3725) : (!llvm.ptr, i64) -> i64
      %3727 = func.call @cc_nil_value() : () -> i64
      %3728 = func.call @cc_intern(%3726, %3727) : (i64, i64) -> i64
      %3729 = func.call @cc_nil_value() : () -> i64
      %3730 = func.call @cc_cons(%3728, %3729) : (i64, i64) -> i64
      %3731 = func.call @cc_values_pack(%3730) : (i64) -> i64
      func.call @stack_push_pointer(%3728) : (i64) -> ()
      %3732 = llvm.mlir.addressof @str471 : !llvm.ptr
      %3733 = arith.constant 1 : i64
      %3734 = func.call @cc_make_string(%3732, %3733) : (!llvm.ptr, i64) -> i64
      %3735 = func.call @cc_nil_value() : () -> i64
      %3736 = func.call @cc_intern(%3734, %3735) : (i64, i64) -> i64
      %3737 = func.call @cc_nil_value() : () -> i64
      %3738 = func.call @cc_cons(%3736, %3737) : (i64, i64) -> i64
      %3739 = func.call @cc_values_pack(%3738) : (i64) -> i64
      func.call @stack_push_pointer(%3736) : (i64) -> ()
      %3740 = llvm.mlir.addressof @str472 : !llvm.ptr
      %3741 = arith.constant 2 : i64
      %3742 = func.call @cc_make_string(%3740, %3741) : (!llvm.ptr, i64) -> i64
      %3743 = func.call @cc_nil_value() : () -> i64
      %3744 = func.call @cc_intern(%3742, %3743) : (i64, i64) -> i64
      %3745 = func.call @cc_nil_value() : () -> i64
      %3746 = func.call @cc_cons(%3744, %3745) : (i64, i64) -> i64
      %3747 = func.call @cc_values_pack(%3746) : (i64) -> i64
      func.call @stack_push_pointer(%3744) : (i64) -> ()
      %3748 = llvm.mlir.addressof @str473 : !llvm.ptr
      %3749 = arith.constant 10 : i64
      %3750 = func.call @cc_make_string(%3748, %3749) : (!llvm.ptr, i64) -> i64
      %3751 = func.call @cc_nil_value() : () -> i64
      %3752 = func.call @cc_intern(%3750, %3751) : (i64, i64) -> i64
      %3753 = func.call @cc_nil_value() : () -> i64
      %3754 = func.call @cc_cons(%3752, %3753) : (i64, i64) -> i64
      %3755 = func.call @cc_values_pack(%3754) : (i64) -> i64
      func.call @stack_push_pointer(%3752) : (i64) -> ()
      %3756 = llvm.mlir.addressof @str474 : !llvm.ptr
      %3757 = arith.constant 4 : i64
      %3758 = func.call @cc_make_string(%3756, %3757) : (!llvm.ptr, i64) -> i64
      %3759 = llvm.mlir.addressof @str475 : !llvm.ptr
      %3760 = arith.constant 11 : i64
      %3761 = func.call @cc_make_string(%3759, %3760) : (!llvm.ptr, i64) -> i64
      %3762 = func.call @cc_intern(%3758, %3761) : (i64, i64) -> i64
      %3763 = func.call @cc_nil_value() : () -> i64
      %3764 = func.call @cc_cons(%3762, %3763) : (i64, i64) -> i64
      %3765 = func.call @cc_values_pack(%3764) : (i64) -> i64
      func.call @stack_push_pointer(%3762) : (i64) -> ()
      %3766 = llvm.mlir.addressof @str476 : !llvm.ptr
      %3767 = arith.constant 7 : i64
      %3768 = func.call @cc_make_string(%3766, %3767) : (!llvm.ptr, i64) -> i64
      %3769 = llvm.mlir.addressof @str477 : !llvm.ptr
      %3770 = arith.constant 11 : i64
      %3771 = func.call @cc_make_string(%3769, %3770) : (!llvm.ptr, i64) -> i64
      %3772 = func.call @cc_intern(%3768, %3771) : (i64, i64) -> i64
      %3773 = func.call @cc_nil_value() : () -> i64
      %3774 = func.call @cc_cons(%3772, %3773) : (i64, i64) -> i64
      %3775 = func.call @cc_values_pack(%3774) : (i64) -> i64
      func.call @stack_push_pointer(%3772) : (i64) -> ()
      %3776 = llvm.mlir.addressof @str478 : !llvm.ptr
      %3777 = arith.constant 9 : i64
      %3778 = func.call @cc_make_string(%3776, %3777) : (!llvm.ptr, i64) -> i64
      %3779 = func.call @cc_nil_value() : () -> i64
      %3780 = func.call @cc_intern(%3778, %3779) : (i64, i64) -> i64
      %3781 = func.call @cc_nil_value() : () -> i64
      %3782 = func.call @cc_cons(%3780, %3781) : (i64, i64) -> i64
      %3783 = func.call @cc_values_pack(%3782) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3784 = llvm.mlir.addressof @str479 : !llvm.ptr
      %3785 = arith.constant 4 : i64
      %3786 = func.call @cc_make_string(%3784, %3785) : (!llvm.ptr, i64) -> i64
      %3787 = llvm.mlir.addressof @str480 : !llvm.ptr
      %3788 = arith.constant 11 : i64
      %3789 = func.call @cc_make_string(%3787, %3788) : (!llvm.ptr, i64) -> i64
      %3790 = func.call @cc_intern(%3786, %3789) : (i64, i64) -> i64
      %3791 = func.call @cc_nil_value() : () -> i64
      %3792 = func.call @cc_cons(%3790, %3791) : (i64, i64) -> i64
      %3793 = func.call @cc_values_pack(%3792) : (i64) -> i64
      func.call @stack_push_pointer(%3790) : (i64) -> ()
      %3794 = llvm.mlir.addressof @str481 : !llvm.ptr
      %3795 = arith.constant 7 : i64
      %3796 = func.call @cc_make_string(%3794, %3795) : (!llvm.ptr, i64) -> i64
      %3797 = func.call @cc_nil_value() : () -> i64
      %3798 = func.call @cc_intern(%3796, %3797) : (i64, i64) -> i64
      %3799 = func.call @cc_nil_value() : () -> i64
      %3800 = func.call @cc_cons(%3798, %3799) : (i64, i64) -> i64
      %3801 = func.call @cc_values_pack(%3800) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3802 = llvm.mlir.addressof @str482 : !llvm.ptr
      %3803 = arith.constant 1 : i64
      %3804 = func.call @cc_make_string(%3802, %3803) : (!llvm.ptr, i64) -> i64
      %3805 = func.call @cc_nil_value() : () -> i64
      %3806 = func.call @cc_intern(%3804, %3805) : (i64, i64) -> i64
      %3807 = func.call @cc_nil_value() : () -> i64
      %3808 = func.call @cc_cons(%3806, %3807) : (i64, i64) -> i64
      %3809 = func.call @cc_values_pack(%3808) : (i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3810 = arith.addi %3806, %__rlasp_stack_elide_zero_168 : i64
      %3811 = func.call @stack_pop_pointer() : () -> i64
      %3812 = func.call @cc_cons(%3810, %3811) : (i64, i64) -> i64
      %3813 = func.call @cc_cons(%3798, %3812) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3814 = func.call @stack_pop_pointer() : () -> i64
      %3815 = func.call @stack_pop_pointer() : () -> i64
      %3816 = func.call @cc_cons(%3815, %3814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3817 = arith.addi %3816, %__rlasp_stack_elide_zero_169 : i64
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = func.call @cc_cons(%3818, %3817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3820 = arith.addi %3819, %__rlasp_stack_elide_zero_170 : i64
      %3821 = func.call @stack_pop_pointer() : () -> i64
      %3822 = func.call @cc_cons(%3820, %3821) : (i64, i64) -> i64
      %3823 = func.call @cc_cons(%3780, %3822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = func.call @stack_pop_pointer() : () -> i64
      %3826 = func.call @cc_cons(%3825, %3824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3827 = arith.addi %3826, %__rlasp_stack_elide_zero_171 : i64
      %3828 = func.call @stack_pop_pointer() : () -> i64
      %3829 = func.call @cc_cons(%3828, %3827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3829) : (i64) -> ()
      %3830 = llvm.mlir.addressof @str483 : !llvm.ptr
      %3831 = arith.constant 7 : i64
      %3832 = func.call @cc_make_string(%3830, %3831) : (!llvm.ptr, i64) -> i64
      %3833 = func.call @cc_nil_value() : () -> i64
      %3834 = func.call @cc_intern(%3832, %3833) : (i64, i64) -> i64
      %3835 = func.call @cc_nil_value() : () -> i64
      %3836 = func.call @cc_cons(%3834, %3835) : (i64, i64) -> i64
      %3837 = func.call @cc_values_pack(%3836) : (i64) -> i64
      func.call @stack_push_pointer(%3834) : (i64) -> ()
      %3838 = llvm.mlir.addressof @str484 : !llvm.ptr
      %3839 = arith.constant 1 : i64
      %3840 = func.call @cc_make_string(%3838, %3839) : (!llvm.ptr, i64) -> i64
      %3841 = func.call @cc_nil_value() : () -> i64
      %3842 = func.call @cc_intern(%3840, %3841) : (i64, i64) -> i64
      %3843 = func.call @cc_nil_value() : () -> i64
      %3844 = func.call @cc_cons(%3842, %3843) : (i64, i64) -> i64
      %3845 = func.call @cc_values_pack(%3844) : (i64) -> i64
      func.call @stack_push_pointer(%3842) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3846 = func.call @stack_pop_pointer() : () -> i64
      %3847 = func.call @stack_pop_pointer() : () -> i64
      %3848 = func.call @cc_cons(%3847, %3846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3849 = arith.addi %3848, %__rlasp_stack_elide_zero_172 : i64
      %3850 = func.call @stack_pop_pointer() : () -> i64
      %3851 = func.call @cc_cons(%3850, %3849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3852 = arith.addi %3851, %__rlasp_stack_elide_zero_173 : i64
      %3853 = func.call @stack_pop_pointer() : () -> i64
      %3854 = func.call @cc_cons(%3853, %3852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3855 = arith.addi %3854, %__rlasp_stack_elide_zero_174 : i64
      %3856 = func.call @stack_pop_pointer() : () -> i64
      %3857 = func.call @cc_cons(%3856, %3855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3858 = arith.addi %3857, %__rlasp_stack_elide_zero_175 : i64
      %3859 = func.call @stack_pop_pointer() : () -> i64
      %3860 = func.call @cc_cons(%3859, %3858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3861 = arith.addi %3860, %__rlasp_stack_elide_zero_176 : i64
      %3862 = func.call @stack_pop_pointer() : () -> i64
      %3863 = func.call @cc_cons(%3862, %3861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3864 = arith.addi %3863, %__rlasp_stack_elide_zero_177 : i64
      %3865 = func.call @stack_pop_pointer() : () -> i64
      %3866 = func.call @cc_cons(%3865, %3864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3867 = arith.addi %3866, %__rlasp_stack_elide_zero_178 : i64
      %3868 = func.call @stack_pop_pointer() : () -> i64
      %3869 = func.call @cc_cons(%3868, %3867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3870 = arith.addi %3869, %__rlasp_stack_elide_zero_179 : i64
      %3871 = func.call @stack_pop_pointer() : () -> i64
      %3872 = func.call @cc_cons(%3871, %3870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3872) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3873 = func.call @stack_pop_pointer() : () -> i64
      %3874 = func.call @stack_pop_pointer() : () -> i64
      %3875 = func.call @cc_cons(%3874, %3873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3876 = arith.addi %3875, %__rlasp_stack_elide_zero_180 : i64
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @cc_cons(%3877, %3876) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3879 = arith.addi %3878, %__rlasp_stack_elide_zero_181 : i64
      %3880 = func.call @stack_pop_pointer() : () -> i64
      %3881 = func.call @cc_cons(%3880, %3879) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3882 = arith.addi %3881, %__rlasp_stack_elide_zero_182 : i64
      %4919 = arith.constant 120590987952133 : i64
      %4920 = arith.constant 0 : i64
      %4921 = func.call @cc_make_closure(%4919, %4920) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %4922 = arith.addi %4921, %__rlasp_stack_elide_zero_183 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4923 = func.call @stack_pop_pointer() : () -> i64
      %4924 = func.call @stack_pop_pointer() : () -> i64
      %4925 = func.call @cc_cons(%4924, %4923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %4926 = arith.addi %4925, %__rlasp_stack_elide_zero_184 : i64
      %4927 = llvm.mlir.addressof @str618 : !llvm.ptr
      %4928 = arith.constant 11 : i64
      %4929 = func.call @cc_make_string(%4927, %4928) : (!llvm.ptr, i64) -> i64
      %4930 = llvm.mlir.addressof @str619 : !llvm.ptr
      %4931 = arith.constant 7 : i64
      %4932 = func.call @cc_make_string(%4930, %4931) : (!llvm.ptr, i64) -> i64
      %4933 = func.call @cc_intern(%4929, %4932) : (i64, i64) -> i64
      %4934 = func.call @cc_nil_value() : () -> i64
      %4935 = func.call @cc_cons(%4933, %4934) : (i64, i64) -> i64
      %4936 = func.call @cc_values_pack(%4935) : (i64) -> i64
      %4937 = func.call @cc_nil_value() : () -> i64
      %4938 = llvm.mlir.addressof @str620 : !llvm.ptr
      %4939 = arith.constant 4 : i64
      %4940 = func.call @cc_make_string(%4938, %4939) : (!llvm.ptr, i64) -> i64
      %4941 = llvm.mlir.addressof @str621 : !llvm.ptr
      %4942 = arith.constant 7 : i64
      %4943 = func.call @cc_make_string(%4941, %4942) : (!llvm.ptr, i64) -> i64
      %4944 = func.call @cc_intern(%4940, %4943) : (i64, i64) -> i64
      %4945 = func.call @cc_nil_value() : () -> i64
      %4946 = func.call @cc_cons(%4944, %4945) : (i64, i64) -> i64
      %4947 = func.call @cc_values_pack(%4946) : (i64) -> i64
      %4948 = llvm.mlir.addressof @str622 : !llvm.ptr
      %4949 = arith.constant 6 : i64
      %4950 = func.call @cc_make_string(%4948, %4949) : (!llvm.ptr, i64) -> i64
      %4951 = func.call @cc_nil_value() : () -> i64
      %4952 = func.call @cc_intern(%4950, %4951) : (i64, i64) -> i64
      %4953 = func.call @cc_nil_value() : () -> i64
      %4954 = func.call @cc_cons(%4952, %4953) : (i64, i64) -> i64
      %4955 = func.call @cc_values_pack(%4954) : (i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %4956 = arith.addi %4952, %__rlasp_stack_elide_zero_185 : i64
      %4957 = func.call @cc_nil_value() : () -> i64
      %4958 = func.call @cc_errorp(%2910) : (i64) -> i64
      %4959 = arith.cmpi ne, %4958, %4957 : i64
      %4960 = arith.cmpi eq, %4957, %4957 : i64
      %4961 = arith.andi %4959, %4960 : i1
      %4962 = scf.if %4961 -> (i64) {
        scf.yield %2910 : i64
      } else {
        scf.yield %4957 : i64
      }
      %4963 = func.call @cc_errorp(%3882) : (i64) -> i64
      %4964 = arith.cmpi ne, %4963, %4957 : i64
      %4965 = arith.cmpi eq, %4962, %4957 : i64
      %4966 = arith.andi %4964, %4965 : i1
      %4967 = scf.if %4966 -> (i64) {
        scf.yield %3882 : i64
      } else {
        scf.yield %4962 : i64
      }
      %4968 = func.call @cc_errorp(%4922) : (i64) -> i64
      %4969 = arith.cmpi ne, %4968, %4957 : i64
      %4970 = arith.cmpi eq, %4967, %4957 : i64
      %4971 = arith.andi %4969, %4970 : i1
      %4972 = scf.if %4971 -> (i64) {
        scf.yield %4922 : i64
      } else {
        scf.yield %4967 : i64
      }
      %4973 = func.call @cc_errorp(%4926) : (i64) -> i64
      %4974 = arith.cmpi ne, %4973, %4957 : i64
      %4975 = arith.cmpi eq, %4972, %4957 : i64
      %4976 = arith.andi %4974, %4975 : i1
      %4977 = scf.if %4976 -> (i64) {
        scf.yield %4926 : i64
      } else {
        scf.yield %4972 : i64
      }
      %4978 = func.call @cc_errorp(%4933) : (i64) -> i64
      %4979 = arith.cmpi ne, %4978, %4957 : i64
      %4980 = arith.cmpi eq, %4977, %4957 : i64
      %4981 = arith.andi %4979, %4980 : i1
      %4982 = scf.if %4981 -> (i64) {
        scf.yield %4933 : i64
      } else {
        scf.yield %4977 : i64
      }
      %4983 = func.call @cc_errorp(%4937) : (i64) -> i64
      %4984 = arith.cmpi ne, %4983, %4957 : i64
      %4985 = arith.cmpi eq, %4982, %4957 : i64
      %4986 = arith.andi %4984, %4985 : i1
      %4987 = scf.if %4986 -> (i64) {
        scf.yield %4937 : i64
      } else {
        scf.yield %4982 : i64
      }
      %4988 = func.call @cc_errorp(%4944) : (i64) -> i64
      %4989 = arith.cmpi ne, %4988, %4957 : i64
      %4990 = arith.cmpi eq, %4987, %4957 : i64
      %4991 = arith.andi %4989, %4990 : i1
      %4992 = scf.if %4991 -> (i64) {
        scf.yield %4944 : i64
      } else {
        scf.yield %4987 : i64
      }
      %4993 = func.call @cc_errorp(%4956) : (i64) -> i64
      %4994 = arith.cmpi ne, %4993, %4957 : i64
      %4995 = arith.cmpi eq, %4992, %4957 : i64
      %4996 = arith.andi %4994, %4995 : i1
      %4997 = scf.if %4996 -> (i64) {
        scf.yield %4956 : i64
      } else {
        scf.yield %4992 : i64
      }
      %4998 = arith.cmpi ne, %4997, %4957 : i64
      scf.if %4998 {
        func.call @stack_push_pointer(%4997) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2910) : (i64) -> ()
        func.call @stack_push_pointer(%3882) : (i64) -> ()
        func.call @stack_push_pointer(%4922) : (i64) -> ()
        func.call @stack_push_pointer(%4926) : (i64) -> ()
        func.call @stack_push_pointer(%4933) : (i64) -> ()
        func.call @stack_push_pointer(%4937) : (i64) -> ()
        func.call @stack_push_pointer(%4944) : (i64) -> ()
        func.call @stack_push_pointer(%4956) : (i64) -> ()
        %4999 = llvm.mlir.addressof @str623 : !llvm.ptr
        %5000 = func.call @cc_make_function_ref_const(%4999) : (!llvm.ptr) -> i64
        %5001 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5000, %5001) : (i64, i64) -> ()
      }
      %5002 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5002 : i64
    }
    %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
    %5003 = arith.addi %2901, %__rlasp_stack_elide_zero_186 : i64
    %5004 = func.call @cc_multiple_value_list(%5003) : (i64) -> i64
    %5005 = llvm.mlir.addressof @str624 : !llvm.ptr
    %5006 = arith.constant 38 : i64
    %5007 = func.call @cc_make_string(%5005, %5006) : (!llvm.ptr, i64) -> i64
    %5008 = func.call @cc_nil_value() : () -> i64
    %5009 = func.call @cc_intern(%5007, %5008) : (i64, i64) -> i64
    %5010 = func.call @cc_nil_value() : () -> i64
    %5011 = func.call @cc_cons(%5009, %5010) : (i64, i64) -> i64
    %5012 = func.call @cc_values_pack(%5011) : (i64) -> i64
    %5013 = func.call @cc_symbol_value(%5009) : (i64) -> i64
    %5014 = llvm.mlir.addressof @str625 : !llvm.ptr
    %5015 = arith.constant 40 : i64
    %5016 = func.call @cc_make_string(%5014, %5015) : (!llvm.ptr, i64) -> i64
    %5017 = func.call @cc_nil_value() : () -> i64
    %5018 = func.call @cc_intern(%5016, %5017) : (i64, i64) -> i64
    %5019 = func.call @cc_nil_value() : () -> i64
    %5020 = func.call @cc_cons(%5018, %5019) : (i64, i64) -> i64
    %5021 = func.call @cc_values_pack(%5020) : (i64) -> i64
    %5022 = func.call @cc_symbol_value(%5018) : (i64) -> i64
    %5023 = func.call @cc_nil_value() : () -> i64
    %5024 = arith.cmpi ne, %5013, %5023 : i64
    %5025 = scf.if %5024 -> (i64) {
      scf.yield %5022 : i64
    } else {
      scf.yield %5004 : i64
    }
    %5026 = func.call @cc_values_pack(%5025) : (i64) -> i64
    func.call @stack_push_pointer(%5026) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_120590987952129"() {
    %1127 = func.call @cc_nil_value() : () -> i64
    %1128 = func.call @cc_nil_value() : () -> i64
    %1129 = func.call @cc_errorp(%1127) : (i64) -> i64
    %1130 = arith.cmpi ne, %1129, %1128 : i64
    %1131 = scf.if %1130 -> (i64) {
      scf.yield %1127 : i64
    } else {
      %1132 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1133 = arith.constant 31 : i64
      %1134 = func.call @cc_make_string(%1132, %1133) : (!llvm.ptr, i64) -> i64
      %1135 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1136 = arith.constant 4 : i64
      %1137 = func.call @cc_make_string(%1135, %1136) : (!llvm.ptr, i64) -> i64
      %1138 = func.call @cc_intern(%1134, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_nil_value() : () -> i64
      %1140 = func.call @cc_cons(%1138, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_values_pack(%1140) : (i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      %1142 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1143 = arith.constant 13 : i64
      %1144 = func.call @cc_make_string(%1142, %1143) : (!llvm.ptr, i64) -> i64
      %1145 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1146 = arith.constant 4 : i64
      %1147 = func.call @cc_make_string(%1145, %1146) : (!llvm.ptr, i64) -> i64
      %1148 = func.call @cc_intern(%1144, %1147) : (i64, i64) -> i64
      %1149 = func.call @cc_nil_value() : () -> i64
      %1150 = func.call @cc_cons(%1148, %1149) : (i64, i64) -> i64
      %1151 = func.call @cc_values_pack(%1150) : (i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      %1152 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1153 = arith.constant 17 : i64
      %1154 = func.call @cc_make_string(%1152, %1153) : (!llvm.ptr, i64) -> i64
      %1155 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1156 = arith.constant 4 : i64
      %1157 = func.call @cc_make_string(%1155, %1156) : (!llvm.ptr, i64) -> i64
      %1158 = func.call @cc_intern(%1154, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = func.call @cc_cons(%1158, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_values_pack(%1160) : (i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1162 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1163 = arith.constant 19 : i64
      %1164 = func.call @cc_make_string(%1162, %1163) : (!llvm.ptr, i64) -> i64
      %1165 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1166 = arith.constant 4 : i64
      %1167 = func.call @cc_make_string(%1165, %1166) : (!llvm.ptr, i64) -> i64
      %1168 = func.call @cc_intern(%1164, %1167) : (i64, i64) -> i64
      %1169 = func.call @cc_nil_value() : () -> i64
      %1170 = func.call @cc_cons(%1168, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_values_pack(%1170) : (i64) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1172 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1173 = arith.constant 22 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1176 = arith.constant 4 : i64
      %1177 = func.call @cc_make_string(%1175, %1176) : (!llvm.ptr, i64) -> i64
      %1178 = func.call @cc_intern(%1174, %1177) : (i64, i64) -> i64
      %1179 = func.call @cc_nil_value() : () -> i64
      %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
      %1181 = func.call @cc_values_pack(%1180) : (i64) -> i64
      func.call @stack_push_pointer(%1178) : (i64) -> ()
      %1182 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1183 = arith.constant 29 : i64
      %1184 = func.call @cc_make_string(%1182, %1183) : (!llvm.ptr, i64) -> i64
      %1185 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1186 = arith.constant 4 : i64
      %1187 = func.call @cc_make_string(%1185, %1186) : (!llvm.ptr, i64) -> i64
      %1188 = func.call @cc_intern(%1184, %1187) : (i64, i64) -> i64
      %1189 = func.call @cc_nil_value() : () -> i64
      %1190 = func.call @cc_cons(%1188, %1189) : (i64, i64) -> i64
      %1191 = func.call @cc_values_pack(%1190) : (i64) -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1192 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1193 = arith.constant 18 : i64
      %1194 = func.call @cc_make_string(%1192, %1193) : (!llvm.ptr, i64) -> i64
      %1195 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1196 = arith.constant 4 : i64
      %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
      %1198 = func.call @cc_intern(%1194, %1197) : (i64, i64) -> i64
      %1199 = func.call @cc_nil_value() : () -> i64
      %1200 = func.call @cc_cons(%1198, %1199) : (i64, i64) -> i64
      %1201 = func.call @cc_values_pack(%1200) : (i64) -> i64
      func.call @stack_push_pointer(%1198) : (i64) -> ()
      %1202 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1203 = arith.constant 23 : i64
      %1204 = func.call @cc_make_string(%1202, %1203) : (!llvm.ptr, i64) -> i64
      %1205 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1206 = arith.constant 4 : i64
      %1207 = func.call @cc_make_string(%1205, %1206) : (!llvm.ptr, i64) -> i64
      %1208 = func.call @cc_intern(%1204, %1207) : (i64, i64) -> i64
      %1209 = func.call @cc_nil_value() : () -> i64
      %1210 = func.call @cc_cons(%1208, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_values_pack(%1210) : (i64) -> i64
      func.call @stack_push_pointer(%1208) : (i64) -> ()
      %1212 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1213 = arith.constant 25 : i64
      %1214 = func.call @cc_make_string(%1212, %1213) : (!llvm.ptr, i64) -> i64
      %1215 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1216 = arith.constant 4 : i64
      %1217 = func.call @cc_make_string(%1215, %1216) : (!llvm.ptr, i64) -> i64
      %1218 = func.call @cc_intern(%1214, %1217) : (i64, i64) -> i64
      %1219 = func.call @cc_nil_value() : () -> i64
      %1220 = func.call @cc_cons(%1218, %1219) : (i64, i64) -> i64
      %1221 = func.call @cc_values_pack(%1220) : (i64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
      %1222 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1223 = arith.constant 17 : i64
      %1224 = func.call @cc_make_string(%1222, %1223) : (!llvm.ptr, i64) -> i64
      %1225 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1226 = arith.constant 4 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = func.call @cc_intern(%1224, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_cons(%1228, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_values_pack(%1230) : (i64) -> i64
      func.call @stack_push_pointer(%1228) : (i64) -> ()
      %1232 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1233 = arith.constant 21 : i64
      %1234 = func.call @cc_make_string(%1232, %1233) : (!llvm.ptr, i64) -> i64
      %1235 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1236 = arith.constant 4 : i64
      %1237 = func.call @cc_make_string(%1235, %1236) : (!llvm.ptr, i64) -> i64
      %1238 = func.call @cc_intern(%1234, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_cons(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      %1242 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1243 = arith.constant 15 : i64
      %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
      %1245 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1246 = arith.constant 4 : i64
      %1247 = func.call @cc_make_string(%1245, %1246) : (!llvm.ptr, i64) -> i64
      %1248 = func.call @cc_intern(%1244, %1247) : (i64, i64) -> i64
      %1249 = func.call @cc_nil_value() : () -> i64
      %1250 = func.call @cc_cons(%1248, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_values_pack(%1250) : (i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      %1252 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1253 = arith.constant 11 : i64
      %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
      %1255 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1256 = arith.constant 4 : i64
      %1257 = func.call @cc_make_string(%1255, %1256) : (!llvm.ptr, i64) -> i64
      %1258 = func.call @cc_intern(%1254, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_nil_value() : () -> i64
      %1260 = func.call @cc_cons(%1258, %1259) : (i64, i64) -> i64
      %1261 = func.call @cc_values_pack(%1260) : (i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1262 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1263 = arith.constant 40 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1266 = arith.constant 4 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = func.call @cc_intern(%1264, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_cons(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1272 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1273 = arith.constant 29 : i64
      %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
      %1275 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1276 = arith.constant 4 : i64
      %1277 = func.call @cc_make_string(%1275, %1276) : (!llvm.ptr, i64) -> i64
      %1278 = func.call @cc_intern(%1274, %1277) : (i64, i64) -> i64
      %1279 = func.call @cc_nil_value() : () -> i64
      %1280 = func.call @cc_cons(%1278, %1279) : (i64, i64) -> i64
      %1281 = func.call @cc_values_pack(%1280) : (i64) -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1282 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1283 = arith.constant 31 : i64
      %1284 = func.call @cc_make_string(%1282, %1283) : (!llvm.ptr, i64) -> i64
      %1285 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1286 = arith.constant 4 : i64
      %1287 = func.call @cc_make_string(%1285, %1286) : (!llvm.ptr, i64) -> i64
      %1288 = func.call @cc_intern(%1284, %1287) : (i64, i64) -> i64
      %1289 = func.call @cc_nil_value() : () -> i64
      %1290 = func.call @cc_cons(%1288, %1289) : (i64, i64) -> i64
      %1291 = func.call @cc_values_pack(%1290) : (i64) -> i64
      func.call @stack_push_pointer(%1288) : (i64) -> ()
      %1292 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1293 = arith.constant 24 : i64
      %1294 = func.call @cc_make_string(%1292, %1293) : (!llvm.ptr, i64) -> i64
      %1295 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1296 = arith.constant 4 : i64
      %1297 = func.call @cc_make_string(%1295, %1296) : (!llvm.ptr, i64) -> i64
      %1298 = func.call @cc_intern(%1294, %1297) : (i64, i64) -> i64
      %1299 = func.call @cc_nil_value() : () -> i64
      %1300 = func.call @cc_cons(%1298, %1299) : (i64, i64) -> i64
      %1301 = func.call @cc_values_pack(%1300) : (i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      %1302 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1303 = arith.constant 33 : i64
      %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
      %1305 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1306 = arith.constant 4 : i64
      %1307 = func.call @cc_make_string(%1305, %1306) : (!llvm.ptr, i64) -> i64
      %1308 = func.call @cc_intern(%1304, %1307) : (i64, i64) -> i64
      %1309 = func.call @cc_nil_value() : () -> i64
      %1310 = func.call @cc_cons(%1308, %1309) : (i64, i64) -> i64
      %1311 = func.call @cc_values_pack(%1310) : (i64) -> i64
      func.call @stack_push_pointer(%1308) : (i64) -> ()
      %1312 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1313 = arith.constant 13 : i64
      %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
      %1315 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1316 = arith.constant 4 : i64
      %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
      %1318 = func.call @cc_intern(%1314, %1317) : (i64, i64) -> i64
      %1319 = func.call @cc_nil_value() : () -> i64
      %1320 = func.call @cc_cons(%1318, %1319) : (i64, i64) -> i64
      %1321 = func.call @cc_values_pack(%1320) : (i64) -> i64
      func.call @stack_push_pointer(%1318) : (i64) -> ()
      %1322 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1323 = arith.constant 28 : i64
      %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
      %1325 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1326 = arith.constant 4 : i64
      %1327 = func.call @cc_make_string(%1325, %1326) : (!llvm.ptr, i64) -> i64
      %1328 = func.call @cc_intern(%1324, %1327) : (i64, i64) -> i64
      %1329 = func.call @cc_nil_value() : () -> i64
      %1330 = func.call @cc_cons(%1328, %1329) : (i64, i64) -> i64
      %1331 = func.call @cc_values_pack(%1330) : (i64) -> i64
      func.call @stack_push_pointer(%1328) : (i64) -> ()
      %1332 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1333 = arith.constant 31 : i64
      %1334 = func.call @cc_make_string(%1332, %1333) : (!llvm.ptr, i64) -> i64
      %1335 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1336 = arith.constant 4 : i64
      %1337 = func.call @cc_make_string(%1335, %1336) : (!llvm.ptr, i64) -> i64
      %1338 = func.call @cc_intern(%1334, %1337) : (i64, i64) -> i64
      %1339 = func.call @cc_nil_value() : () -> i64
      %1340 = func.call @cc_cons(%1338, %1339) : (i64, i64) -> i64
      %1341 = func.call @cc_values_pack(%1340) : (i64) -> i64
      func.call @stack_push_pointer(%1338) : (i64) -> ()
      %1342 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1343 = arith.constant 24 : i64
      %1344 = func.call @cc_make_string(%1342, %1343) : (!llvm.ptr, i64) -> i64
      %1345 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1346 = arith.constant 4 : i64
      %1347 = func.call @cc_make_string(%1345, %1346) : (!llvm.ptr, i64) -> i64
      %1348 = func.call @cc_intern(%1344, %1347) : (i64, i64) -> i64
      %1349 = func.call @cc_nil_value() : () -> i64
      %1350 = func.call @cc_cons(%1348, %1349) : (i64, i64) -> i64
      %1351 = func.call @cc_values_pack(%1350) : (i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1352 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1353 = arith.constant 35 : i64
      %1354 = func.call @cc_make_string(%1352, %1353) : (!llvm.ptr, i64) -> i64
      %1355 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1356 = arith.constant 4 : i64
      %1357 = func.call @cc_make_string(%1355, %1356) : (!llvm.ptr, i64) -> i64
      %1358 = func.call @cc_intern(%1354, %1357) : (i64, i64) -> i64
      %1359 = func.call @cc_nil_value() : () -> i64
      %1360 = func.call @cc_cons(%1358, %1359) : (i64, i64) -> i64
      %1361 = func.call @cc_values_pack(%1360) : (i64) -> i64
      func.call @stack_push_pointer(%1358) : (i64) -> ()
      %1362 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1363 = arith.constant 20 : i64
      %1364 = func.call @cc_make_string(%1362, %1363) : (!llvm.ptr, i64) -> i64
      %1365 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1366 = arith.constant 4 : i64
      %1367 = func.call @cc_make_string(%1365, %1366) : (!llvm.ptr, i64) -> i64
      %1368 = func.call @cc_intern(%1364, %1367) : (i64, i64) -> i64
      %1369 = func.call @cc_nil_value() : () -> i64
      %1370 = func.call @cc_cons(%1368, %1369) : (i64, i64) -> i64
      %1371 = func.call @cc_values_pack(%1370) : (i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      %1372 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1373 = arith.constant 23 : i64
      %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
      %1375 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1376 = arith.constant 4 : i64
      %1377 = func.call @cc_make_string(%1375, %1376) : (!llvm.ptr, i64) -> i64
      %1378 = func.call @cc_intern(%1374, %1377) : (i64, i64) -> i64
      %1379 = func.call @cc_nil_value() : () -> i64
      %1380 = func.call @cc_cons(%1378, %1379) : (i64, i64) -> i64
      %1381 = func.call @cc_values_pack(%1380) : (i64) -> i64
      func.call @stack_push_pointer(%1378) : (i64) -> ()
      %1382 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1383 = arith.constant 42 : i64
      %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
      %1385 = llvm.mlir.addressof @str206 : !llvm.ptr
      %1386 = arith.constant 4 : i64
      %1387 = func.call @cc_make_string(%1385, %1386) : (!llvm.ptr, i64) -> i64
      %1388 = func.call @cc_intern(%1384, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_nil_value() : () -> i64
      %1390 = func.call @cc_cons(%1388, %1389) : (i64, i64) -> i64
      %1391 = func.call @cc_values_pack(%1390) : (i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1392 = llvm.mlir.addressof @str207 : !llvm.ptr
      %1393 = arith.constant 28 : i64
      %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
      %1395 = llvm.mlir.addressof @str208 : !llvm.ptr
      %1396 = arith.constant 4 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = func.call @cc_intern(%1394, %1397) : (i64, i64) -> i64
      %1399 = func.call @cc_nil_value() : () -> i64
      %1400 = func.call @cc_cons(%1398, %1399) : (i64, i64) -> i64
      %1401 = func.call @cc_values_pack(%1400) : (i64) -> i64
      func.call @stack_push_pointer(%1398) : (i64) -> ()
      %1402 = llvm.mlir.addressof @str209 : !llvm.ptr
      %1403 = arith.constant 29 : i64
      %1404 = func.call @cc_make_string(%1402, %1403) : (!llvm.ptr, i64) -> i64
      %1405 = llvm.mlir.addressof @str210 : !llvm.ptr
      %1406 = arith.constant 4 : i64
      %1407 = func.call @cc_make_string(%1405, %1406) : (!llvm.ptr, i64) -> i64
      %1408 = func.call @cc_intern(%1404, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_nil_value() : () -> i64
      %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
      %1411 = func.call @cc_values_pack(%1410) : (i64) -> i64
      func.call @stack_push_pointer(%1408) : (i64) -> ()
      %1412 = llvm.mlir.addressof @str211 : !llvm.ptr
      %1413 = arith.constant 35 : i64
      %1414 = func.call @cc_make_string(%1412, %1413) : (!llvm.ptr, i64) -> i64
      %1415 = llvm.mlir.addressof @str212 : !llvm.ptr
      %1416 = arith.constant 4 : i64
      %1417 = func.call @cc_make_string(%1415, %1416) : (!llvm.ptr, i64) -> i64
      %1418 = func.call @cc_intern(%1414, %1417) : (i64, i64) -> i64
      %1419 = func.call @cc_nil_value() : () -> i64
      %1420 = func.call @cc_cons(%1418, %1419) : (i64, i64) -> i64
      %1421 = func.call @cc_values_pack(%1420) : (i64) -> i64
      func.call @stack_push_pointer(%1418) : (i64) -> ()
      %1422 = llvm.mlir.addressof @str213 : !llvm.ptr
      %1423 = arith.constant 24 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      %1425 = llvm.mlir.addressof @str214 : !llvm.ptr
      %1426 = arith.constant 4 : i64
      %1427 = func.call @cc_make_string(%1425, %1426) : (!llvm.ptr, i64) -> i64
      %1428 = func.call @cc_intern(%1424, %1427) : (i64, i64) -> i64
      %1429 = func.call @cc_nil_value() : () -> i64
      %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
      %1431 = func.call @cc_values_pack(%1430) : (i64) -> i64
      func.call @stack_push_pointer(%1428) : (i64) -> ()
      %1432 = llvm.mlir.addressof @str215 : !llvm.ptr
      %1433 = arith.constant 21 : i64
      %1434 = func.call @cc_make_string(%1432, %1433) : (!llvm.ptr, i64) -> i64
      %1435 = llvm.mlir.addressof @str216 : !llvm.ptr
      %1436 = arith.constant 4 : i64
      %1437 = func.call @cc_make_string(%1435, %1436) : (!llvm.ptr, i64) -> i64
      %1438 = func.call @cc_intern(%1434, %1437) : (i64, i64) -> i64
      %1439 = func.call @cc_nil_value() : () -> i64
      %1440 = func.call @cc_cons(%1438, %1439) : (i64, i64) -> i64
      %1441 = func.call @cc_values_pack(%1440) : (i64) -> i64
      func.call @stack_push_pointer(%1438) : (i64) -> ()
      %1442 = llvm.mlir.addressof @str217 : !llvm.ptr
      %1443 = arith.constant 18 : i64
      %1444 = func.call @cc_make_string(%1442, %1443) : (!llvm.ptr, i64) -> i64
      %1445 = llvm.mlir.addressof @str218 : !llvm.ptr
      %1446 = arith.constant 4 : i64
      %1447 = func.call @cc_make_string(%1445, %1446) : (!llvm.ptr, i64) -> i64
      %1448 = func.call @cc_intern(%1444, %1447) : (i64, i64) -> i64
      %1449 = func.call @cc_nil_value() : () -> i64
      %1450 = func.call @cc_cons(%1448, %1449) : (i64, i64) -> i64
      %1451 = func.call @cc_values_pack(%1450) : (i64) -> i64
      func.call @stack_push_pointer(%1448) : (i64) -> ()
      %1452 = llvm.mlir.addressof @str219 : !llvm.ptr
      %1453 = arith.constant 14 : i64
      %1454 = func.call @cc_make_string(%1452, %1453) : (!llvm.ptr, i64) -> i64
      %1455 = llvm.mlir.addressof @str220 : !llvm.ptr
      %1456 = arith.constant 4 : i64
      %1457 = func.call @cc_make_string(%1455, %1456) : (!llvm.ptr, i64) -> i64
      %1458 = func.call @cc_intern(%1454, %1457) : (i64, i64) -> i64
      %1459 = func.call @cc_nil_value() : () -> i64
      %1460 = func.call @cc_cons(%1458, %1459) : (i64, i64) -> i64
      %1461 = func.call @cc_values_pack(%1460) : (i64) -> i64
      func.call @stack_push_pointer(%1458) : (i64) -> ()
      %1462 = llvm.mlir.addressof @str221 : !llvm.ptr
      %1463 = arith.constant 15 : i64
      %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
      %1465 = llvm.mlir.addressof @str222 : !llvm.ptr
      %1466 = arith.constant 4 : i64
      %1467 = func.call @cc_make_string(%1465, %1466) : (!llvm.ptr, i64) -> i64
      %1468 = func.call @cc_intern(%1464, %1467) : (i64, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_cons(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_values_pack(%1470) : (i64) -> i64
      func.call @stack_push_pointer(%1468) : (i64) -> ()
      %1472 = llvm.mlir.addressof @str223 : !llvm.ptr
      %1473 = arith.constant 23 : i64
      %1474 = func.call @cc_make_string(%1472, %1473) : (!llvm.ptr, i64) -> i64
      %1475 = llvm.mlir.addressof @str224 : !llvm.ptr
      %1476 = arith.constant 4 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = func.call @cc_intern(%1474, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_nil_value() : () -> i64
      %1480 = func.call @cc_cons(%1478, %1479) : (i64, i64) -> i64
      %1481 = func.call @cc_values_pack(%1480) : (i64) -> i64
      func.call @stack_push_pointer(%1478) : (i64) -> ()
      %1482 = llvm.mlir.addressof @str225 : !llvm.ptr
      %1483 = arith.constant 18 : i64
      %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
      %1485 = llvm.mlir.addressof @str226 : !llvm.ptr
      %1486 = arith.constant 4 : i64
      %1487 = func.call @cc_make_string(%1485, %1486) : (!llvm.ptr, i64) -> i64
      %1488 = func.call @cc_intern(%1484, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_nil_value() : () -> i64
      %1490 = func.call @cc_cons(%1488, %1489) : (i64, i64) -> i64
      %1491 = func.call @cc_values_pack(%1490) : (i64) -> i64
      func.call @stack_push_pointer(%1488) : (i64) -> ()
      %1492 = llvm.mlir.addressof @str227 : !llvm.ptr
      %1493 = arith.constant 19 : i64
      %1494 = func.call @cc_make_string(%1492, %1493) : (!llvm.ptr, i64) -> i64
      %1495 = llvm.mlir.addressof @str228 : !llvm.ptr
      %1496 = arith.constant 4 : i64
      %1497 = func.call @cc_make_string(%1495, %1496) : (!llvm.ptr, i64) -> i64
      %1498 = func.call @cc_intern(%1494, %1497) : (i64, i64) -> i64
      %1499 = func.call @cc_nil_value() : () -> i64
      %1500 = func.call @cc_cons(%1498, %1499) : (i64, i64) -> i64
      %1501 = func.call @cc_values_pack(%1500) : (i64) -> i64
      func.call @stack_push_pointer(%1498) : (i64) -> ()
      %1502 = llvm.mlir.addressof @str229 : !llvm.ptr
      %1503 = arith.constant 17 : i64
      %1504 = func.call @cc_make_string(%1502, %1503) : (!llvm.ptr, i64) -> i64
      %1505 = llvm.mlir.addressof @str230 : !llvm.ptr
      %1506 = arith.constant 4 : i64
      %1507 = func.call @cc_make_string(%1505, %1506) : (!llvm.ptr, i64) -> i64
      %1508 = func.call @cc_intern(%1504, %1507) : (i64, i64) -> i64
      %1509 = func.call @cc_nil_value() : () -> i64
      %1510 = func.call @cc_cons(%1508, %1509) : (i64, i64) -> i64
      %1511 = func.call @cc_values_pack(%1510) : (i64) -> i64
      func.call @stack_push_pointer(%1508) : (i64) -> ()
      %1512 = llvm.mlir.addressof @str231 : !llvm.ptr
      %1513 = arith.constant 26 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = llvm.mlir.addressof @str232 : !llvm.ptr
      %1516 = arith.constant 4 : i64
      %1517 = func.call @cc_make_string(%1515, %1516) : (!llvm.ptr, i64) -> i64
      %1518 = func.call @cc_intern(%1514, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_nil_value() : () -> i64
      %1520 = func.call @cc_cons(%1518, %1519) : (i64, i64) -> i64
      %1521 = func.call @cc_values_pack(%1520) : (i64) -> i64
      func.call @stack_push_pointer(%1518) : (i64) -> ()
      %1522 = llvm.mlir.addressof @str233 : !llvm.ptr
      %1523 = arith.constant 28 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = llvm.mlir.addressof @str234 : !llvm.ptr
      %1526 = arith.constant 4 : i64
      %1527 = func.call @cc_make_string(%1525, %1526) : (!llvm.ptr, i64) -> i64
      %1528 = func.call @cc_intern(%1524, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_cons(%1528, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_values_pack(%1530) : (i64) -> i64
      func.call @stack_push_pointer(%1528) : (i64) -> ()
      %1532 = llvm.mlir.addressof @str235 : !llvm.ptr
      %1533 = arith.constant 24 : i64
      %1534 = func.call @cc_make_string(%1532, %1533) : (!llvm.ptr, i64) -> i64
      %1535 = llvm.mlir.addressof @str236 : !llvm.ptr
      %1536 = arith.constant 4 : i64
      %1537 = func.call @cc_make_string(%1535, %1536) : (!llvm.ptr, i64) -> i64
      %1538 = func.call @cc_intern(%1534, %1537) : (i64, i64) -> i64
      %1539 = func.call @cc_nil_value() : () -> i64
      %1540 = func.call @cc_cons(%1538, %1539) : (i64, i64) -> i64
      %1541 = func.call @cc_values_pack(%1540) : (i64) -> i64
      func.call @stack_push_pointer(%1538) : (i64) -> ()
      %1542 = llvm.mlir.addressof @str237 : !llvm.ptr
      %1543 = arith.constant 20 : i64
      %1544 = func.call @cc_make_string(%1542, %1543) : (!llvm.ptr, i64) -> i64
      %1545 = llvm.mlir.addressof @str238 : !llvm.ptr
      %1546 = arith.constant 4 : i64
      %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
      %1548 = func.call @cc_intern(%1544, %1547) : (i64, i64) -> i64
      %1549 = func.call @cc_nil_value() : () -> i64
      %1550 = func.call @cc_cons(%1548, %1549) : (i64, i64) -> i64
      %1551 = func.call @cc_values_pack(%1550) : (i64) -> i64
      func.call @stack_push_pointer(%1548) : (i64) -> ()
      %1552 = llvm.mlir.addressof @str239 : !llvm.ptr
      %1553 = arith.constant 20 : i64
      %1554 = func.call @cc_make_string(%1552, %1553) : (!llvm.ptr, i64) -> i64
      %1555 = llvm.mlir.addressof @str240 : !llvm.ptr
      %1556 = arith.constant 4 : i64
      %1557 = func.call @cc_make_string(%1555, %1556) : (!llvm.ptr, i64) -> i64
      %1558 = func.call @cc_intern(%1554, %1557) : (i64, i64) -> i64
      %1559 = func.call @cc_nil_value() : () -> i64
      %1560 = func.call @cc_cons(%1558, %1559) : (i64, i64) -> i64
      %1561 = func.call @cc_values_pack(%1560) : (i64) -> i64
      func.call @stack_push_pointer(%1558) : (i64) -> ()
      %1562 = llvm.mlir.addressof @str241 : !llvm.ptr
      %1563 = arith.constant 23 : i64
      %1564 = func.call @cc_make_string(%1562, %1563) : (!llvm.ptr, i64) -> i64
      %1565 = llvm.mlir.addressof @str242 : !llvm.ptr
      %1566 = arith.constant 4 : i64
      %1567 = func.call @cc_make_string(%1565, %1566) : (!llvm.ptr, i64) -> i64
      %1568 = func.call @cc_intern(%1564, %1567) : (i64, i64) -> i64
      %1569 = func.call @cc_nil_value() : () -> i64
      %1570 = func.call @cc_cons(%1568, %1569) : (i64, i64) -> i64
      %1571 = func.call @cc_values_pack(%1570) : (i64) -> i64
      func.call @stack_push_pointer(%1568) : (i64) -> ()
      %1572 = llvm.mlir.addressof @str243 : !llvm.ptr
      %1573 = arith.constant 23 : i64
      %1574 = func.call @cc_make_string(%1572, %1573) : (!llvm.ptr, i64) -> i64
      %1575 = llvm.mlir.addressof @str244 : !llvm.ptr
      %1576 = arith.constant 4 : i64
      %1577 = func.call @cc_make_string(%1575, %1576) : (!llvm.ptr, i64) -> i64
      %1578 = func.call @cc_intern(%1574, %1577) : (i64, i64) -> i64
      %1579 = func.call @cc_nil_value() : () -> i64
      %1580 = func.call @cc_cons(%1578, %1579) : (i64, i64) -> i64
      %1581 = func.call @cc_values_pack(%1580) : (i64) -> i64
      func.call @stack_push_pointer(%1578) : (i64) -> ()
      %1582 = llvm.mlir.addressof @str245 : !llvm.ptr
      %1583 = arith.constant 24 : i64
      %1584 = func.call @cc_make_string(%1582, %1583) : (!llvm.ptr, i64) -> i64
      %1585 = llvm.mlir.addressof @str246 : !llvm.ptr
      %1586 = arith.constant 4 : i64
      %1587 = func.call @cc_make_string(%1585, %1586) : (!llvm.ptr, i64) -> i64
      %1588 = func.call @cc_intern(%1584, %1587) : (i64, i64) -> i64
      %1589 = func.call @cc_nil_value() : () -> i64
      %1590 = func.call @cc_cons(%1588, %1589) : (i64, i64) -> i64
      %1591 = func.call @cc_values_pack(%1590) : (i64) -> i64
      func.call @stack_push_pointer(%1588) : (i64) -> ()
      %1592 = llvm.mlir.addressof @str247 : !llvm.ptr
      %1593 = arith.constant 19 : i64
      %1594 = func.call @cc_make_string(%1592, %1593) : (!llvm.ptr, i64) -> i64
      %1595 = llvm.mlir.addressof @str248 : !llvm.ptr
      %1596 = arith.constant 4 : i64
      %1597 = func.call @cc_make_string(%1595, %1596) : (!llvm.ptr, i64) -> i64
      %1598 = func.call @cc_intern(%1594, %1597) : (i64, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_cons(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_values_pack(%1600) : (i64) -> i64
      func.call @stack_push_pointer(%1598) : (i64) -> ()
      %1602 = llvm.mlir.addressof @str249 : !llvm.ptr
      %1603 = arith.constant 16 : i64
      %1604 = func.call @cc_make_string(%1602, %1603) : (!llvm.ptr, i64) -> i64
      %1605 = llvm.mlir.addressof @str250 : !llvm.ptr
      %1606 = arith.constant 4 : i64
      %1607 = func.call @cc_make_string(%1605, %1606) : (!llvm.ptr, i64) -> i64
      %1608 = func.call @cc_intern(%1604, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_cons(%1608, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_values_pack(%1610) : (i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      %1612 = llvm.mlir.addressof @str251 : !llvm.ptr
      %1613 = arith.constant 20 : i64
      %1614 = func.call @cc_make_string(%1612, %1613) : (!llvm.ptr, i64) -> i64
      %1615 = llvm.mlir.addressof @str252 : !llvm.ptr
      %1616 = arith.constant 4 : i64
      %1617 = func.call @cc_make_string(%1615, %1616) : (!llvm.ptr, i64) -> i64
      %1618 = func.call @cc_intern(%1614, %1617) : (i64, i64) -> i64
      %1619 = func.call @cc_nil_value() : () -> i64
      %1620 = func.call @cc_cons(%1618, %1619) : (i64, i64) -> i64
      %1621 = func.call @cc_values_pack(%1620) : (i64) -> i64
      func.call @stack_push_pointer(%1618) : (i64) -> ()
      %1622 = llvm.mlir.addressof @str253 : !llvm.ptr
      %1623 = arith.constant 22 : i64
      %1624 = func.call @cc_make_string(%1622, %1623) : (!llvm.ptr, i64) -> i64
      %1625 = llvm.mlir.addressof @str254 : !llvm.ptr
      %1626 = arith.constant 4 : i64
      %1627 = func.call @cc_make_string(%1625, %1626) : (!llvm.ptr, i64) -> i64
      %1628 = func.call @cc_intern(%1624, %1627) : (i64, i64) -> i64
      %1629 = func.call @cc_nil_value() : () -> i64
      %1630 = func.call @cc_cons(%1628, %1629) : (i64, i64) -> i64
      %1631 = func.call @cc_values_pack(%1630) : (i64) -> i64
      func.call @stack_push_pointer(%1628) : (i64) -> ()
      %1632 = llvm.mlir.addressof @str255 : !llvm.ptr
      %1633 = arith.constant 4 : i64
      %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = llvm.mlir.addressof @str256 : !llvm.ptr
      %1636 = arith.constant 11 : i64
      %1637 = func.call @cc_make_string(%1635, %1636) : (!llvm.ptr, i64) -> i64
      %1638 = func.call @cc_intern(%1634, %1637) : (i64, i64) -> i64
      %1639 = func.call @cc_nil_value() : () -> i64
      %1640 = func.call @cc_cons(%1638, %1639) : (i64, i64) -> i64
      %1641 = func.call @cc_values_pack(%1640) : (i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1642 = llvm.mlir.addressof @str257 : !llvm.ptr
      %1643 = arith.constant 21 : i64
      %1644 = func.call @cc_make_string(%1642, %1643) : (!llvm.ptr, i64) -> i64
      %1645 = llvm.mlir.addressof @str258 : !llvm.ptr
      %1646 = arith.constant 4 : i64
      %1647 = func.call @cc_make_string(%1645, %1646) : (!llvm.ptr, i64) -> i64
      %1648 = func.call @cc_intern(%1644, %1647) : (i64, i64) -> i64
      %1649 = func.call @cc_nil_value() : () -> i64
      %1650 = func.call @cc_cons(%1648, %1649) : (i64, i64) -> i64
      %1651 = func.call @cc_values_pack(%1650) : (i64) -> i64
      func.call @stack_push_pointer(%1648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @cc_cons(%1653, %1652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %1655 = arith.addi %1654, %__rlasp_stack_elide_zero_187 : i64
      %1656 = func.call @stack_pop_pointer() : () -> i64
      %1657 = func.call @cc_cons(%1656, %1655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1657) : (i64) -> ()
      %1658 = llvm.mlir.addressof @str259 : !llvm.ptr
      %1659 = arith.constant 4 : i64
      %1660 = func.call @cc_make_string(%1658, %1659) : (!llvm.ptr, i64) -> i64
      %1661 = llvm.mlir.addressof @str260 : !llvm.ptr
      %1662 = arith.constant 11 : i64
      %1663 = func.call @cc_make_string(%1661, %1662) : (!llvm.ptr, i64) -> i64
      %1664 = func.call @cc_intern(%1660, %1663) : (i64, i64) -> i64
      %1665 = func.call @cc_nil_value() : () -> i64
      %1666 = func.call @cc_cons(%1664, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_values_pack(%1666) : (i64) -> i64
      func.call @stack_push_pointer(%1664) : (i64) -> ()
      %1668 = llvm.mlir.addressof @str261 : !llvm.ptr
      %1669 = arith.constant 22 : i64
      %1670 = func.call @cc_make_string(%1668, %1669) : (!llvm.ptr, i64) -> i64
      %1671 = llvm.mlir.addressof @str262 : !llvm.ptr
      %1672 = arith.constant 4 : i64
      %1673 = func.call @cc_make_string(%1671, %1672) : (!llvm.ptr, i64) -> i64
      %1674 = func.call @cc_intern(%1670, %1673) : (i64, i64) -> i64
      %1675 = func.call @cc_nil_value() : () -> i64
      %1676 = func.call @cc_cons(%1674, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_values_pack(%1676) : (i64) -> i64
      func.call @stack_push_pointer(%1674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @stack_pop_pointer() : () -> i64
      %1680 = func.call @cc_cons(%1679, %1678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %1681 = arith.addi %1680, %__rlasp_stack_elide_zero_188 : i64
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @cc_cons(%1682, %1681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1683) : (i64) -> ()
      %1684 = llvm.mlir.addressof @str263 : !llvm.ptr
      %1685 = arith.constant 23 : i64
      %1686 = func.call @cc_make_string(%1684, %1685) : (!llvm.ptr, i64) -> i64
      %1687 = llvm.mlir.addressof @str264 : !llvm.ptr
      %1688 = arith.constant 4 : i64
      %1689 = func.call @cc_make_string(%1687, %1688) : (!llvm.ptr, i64) -> i64
      %1690 = func.call @cc_intern(%1686, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_nil_value() : () -> i64
      %1692 = func.call @cc_cons(%1690, %1691) : (i64, i64) -> i64
      %1693 = func.call @cc_values_pack(%1692) : (i64) -> i64
      func.call @stack_push_pointer(%1690) : (i64) -> ()
      %1694 = llvm.mlir.addressof @str265 : !llvm.ptr
      %1695 = arith.constant 27 : i64
      %1696 = func.call @cc_make_string(%1694, %1695) : (!llvm.ptr, i64) -> i64
      %1697 = llvm.mlir.addressof @str266 : !llvm.ptr
      %1698 = arith.constant 4 : i64
      %1699 = func.call @cc_make_string(%1697, %1698) : (!llvm.ptr, i64) -> i64
      %1700 = func.call @cc_intern(%1696, %1699) : (i64, i64) -> i64
      %1701 = func.call @cc_nil_value() : () -> i64
      %1702 = func.call @cc_cons(%1700, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_values_pack(%1702) : (i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1704 = llvm.mlir.addressof @str267 : !llvm.ptr
      %1705 = arith.constant 22 : i64
      %1706 = func.call @cc_make_string(%1704, %1705) : (!llvm.ptr, i64) -> i64
      %1707 = llvm.mlir.addressof @str268 : !llvm.ptr
      %1708 = arith.constant 4 : i64
      %1709 = func.call @cc_make_string(%1707, %1708) : (!llvm.ptr, i64) -> i64
      %1710 = func.call @cc_intern(%1706, %1709) : (i64, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_cons(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_values_pack(%1712) : (i64) -> i64
      func.call @stack_push_pointer(%1710) : (i64) -> ()
      %1714 = llvm.mlir.addressof @str269 : !llvm.ptr
      %1715 = arith.constant 36 : i64
      %1716 = func.call @cc_make_string(%1714, %1715) : (!llvm.ptr, i64) -> i64
      %1717 = llvm.mlir.addressof @str270 : !llvm.ptr
      %1718 = arith.constant 4 : i64
      %1719 = func.call @cc_make_string(%1717, %1718) : (!llvm.ptr, i64) -> i64
      %1720 = func.call @cc_intern(%1716, %1719) : (i64, i64) -> i64
      %1721 = func.call @cc_nil_value() : () -> i64
      %1722 = func.call @cc_cons(%1720, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_values_pack(%1722) : (i64) -> i64
      func.call @stack_push_pointer(%1720) : (i64) -> ()
      %1724 = llvm.mlir.addressof @str271 : !llvm.ptr
      %1725 = arith.constant 26 : i64
      %1726 = func.call @cc_make_string(%1724, %1725) : (!llvm.ptr, i64) -> i64
      %1727 = llvm.mlir.addressof @str272 : !llvm.ptr
      %1728 = arith.constant 4 : i64
      %1729 = func.call @cc_make_string(%1727, %1728) : (!llvm.ptr, i64) -> i64
      %1730 = func.call @cc_intern(%1726, %1729) : (i64, i64) -> i64
      %1731 = func.call @cc_nil_value() : () -> i64
      %1732 = func.call @cc_cons(%1730, %1731) : (i64, i64) -> i64
      %1733 = func.call @cc_values_pack(%1732) : (i64) -> i64
      func.call @stack_push_pointer(%1730) : (i64) -> ()
      %1734 = llvm.mlir.addressof @str273 : !llvm.ptr
      %1735 = arith.constant 16 : i64
      %1736 = func.call @cc_make_string(%1734, %1735) : (!llvm.ptr, i64) -> i64
      %1737 = llvm.mlir.addressof @str274 : !llvm.ptr
      %1738 = arith.constant 4 : i64
      %1739 = func.call @cc_make_string(%1737, %1738) : (!llvm.ptr, i64) -> i64
      %1740 = func.call @cc_intern(%1736, %1739) : (i64, i64) -> i64
      %1741 = func.call @cc_nil_value() : () -> i64
      %1742 = func.call @cc_cons(%1740, %1741) : (i64, i64) -> i64
      %1743 = func.call @cc_values_pack(%1742) : (i64) -> i64
      func.call @stack_push_pointer(%1740) : (i64) -> ()
      %1744 = llvm.mlir.addressof @str275 : !llvm.ptr
      %1745 = arith.constant 19 : i64
      %1746 = func.call @cc_make_string(%1744, %1745) : (!llvm.ptr, i64) -> i64
      %1747 = llvm.mlir.addressof @str276 : !llvm.ptr
      %1748 = arith.constant 4 : i64
      %1749 = func.call @cc_make_string(%1747, %1748) : (!llvm.ptr, i64) -> i64
      %1750 = func.call @cc_intern(%1746, %1749) : (i64, i64) -> i64
      %1751 = func.call @cc_nil_value() : () -> i64
      %1752 = func.call @cc_cons(%1750, %1751) : (i64, i64) -> i64
      %1753 = func.call @cc_values_pack(%1752) : (i64) -> i64
      func.call @stack_push_pointer(%1750) : (i64) -> ()
      %1754 = llvm.mlir.addressof @str277 : !llvm.ptr
      %1755 = arith.constant 19 : i64
      %1756 = func.call @cc_make_string(%1754, %1755) : (!llvm.ptr, i64) -> i64
      %1757 = llvm.mlir.addressof @str278 : !llvm.ptr
      %1758 = arith.constant 4 : i64
      %1759 = func.call @cc_make_string(%1757, %1758) : (!llvm.ptr, i64) -> i64
      %1760 = func.call @cc_intern(%1756, %1759) : (i64, i64) -> i64
      %1761 = func.call @cc_nil_value() : () -> i64
      %1762 = func.call @cc_cons(%1760, %1761) : (i64, i64) -> i64
      %1763 = func.call @cc_values_pack(%1762) : (i64) -> i64
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1764 = func.call @stack_pop_pointer() : () -> i64
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = func.call @cc_cons(%1765, %1764) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %1767 = arith.addi %1766, %__rlasp_stack_elide_zero_189 : i64
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @cc_cons(%1768, %1767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %1770 = arith.addi %1769, %__rlasp_stack_elide_zero_190 : i64
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @cc_cons(%1771, %1770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %1773 = arith.addi %1772, %__rlasp_stack_elide_zero_191 : i64
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = func.call @cc_cons(%1774, %1773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %1776 = arith.addi %1775, %__rlasp_stack_elide_zero_192 : i64
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = func.call @cc_cons(%1777, %1776) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %1779 = arith.addi %1778, %__rlasp_stack_elide_zero_193 : i64
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @cc_cons(%1780, %1779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %1782 = arith.addi %1781, %__rlasp_stack_elide_zero_194 : i64
      %1783 = func.call @stack_pop_pointer() : () -> i64
      %1784 = func.call @cc_cons(%1783, %1782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %1785 = arith.addi %1784, %__rlasp_stack_elide_zero_195 : i64
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @cc_cons(%1786, %1785) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %1788 = arith.addi %1787, %__rlasp_stack_elide_zero_196 : i64
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @cc_cons(%1789, %1788) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %1791 = arith.addi %1790, %__rlasp_stack_elide_zero_197 : i64
      %1792 = func.call @stack_pop_pointer() : () -> i64
      %1793 = func.call @cc_cons(%1792, %1791) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %1794 = arith.addi %1793, %__rlasp_stack_elide_zero_198 : i64
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @cc_cons(%1795, %1794) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %1797 = arith.addi %1796, %__rlasp_stack_elide_zero_199 : i64
      %1798 = func.call @stack_pop_pointer() : () -> i64
      %1799 = func.call @cc_cons(%1798, %1797) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %1800 = arith.addi %1799, %__rlasp_stack_elide_zero_200 : i64
      %1801 = func.call @stack_pop_pointer() : () -> i64
      %1802 = func.call @cc_cons(%1801, %1800) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %1803 = arith.addi %1802, %__rlasp_stack_elide_zero_201 : i64
      %1804 = func.call @stack_pop_pointer() : () -> i64
      %1805 = func.call @cc_cons(%1804, %1803) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %1806 = arith.addi %1805, %__rlasp_stack_elide_zero_202 : i64
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = func.call @cc_cons(%1807, %1806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %1809 = arith.addi %1808, %__rlasp_stack_elide_zero_203 : i64
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = func.call @cc_cons(%1810, %1809) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %1812 = arith.addi %1811, %__rlasp_stack_elide_zero_204 : i64
      %1813 = func.call @stack_pop_pointer() : () -> i64
      %1814 = func.call @cc_cons(%1813, %1812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %1815 = arith.addi %1814, %__rlasp_stack_elide_zero_205 : i64
      %1816 = func.call @stack_pop_pointer() : () -> i64
      %1817 = func.call @cc_cons(%1816, %1815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %1818 = arith.addi %1817, %__rlasp_stack_elide_zero_206 : i64
      %1819 = func.call @stack_pop_pointer() : () -> i64
      %1820 = func.call @cc_cons(%1819, %1818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %1821 = arith.addi %1820, %__rlasp_stack_elide_zero_207 : i64
      %1822 = func.call @stack_pop_pointer() : () -> i64
      %1823 = func.call @cc_cons(%1822, %1821) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %1824 = arith.addi %1823, %__rlasp_stack_elide_zero_208 : i64
      %1825 = func.call @stack_pop_pointer() : () -> i64
      %1826 = func.call @cc_cons(%1825, %1824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %1827 = arith.addi %1826, %__rlasp_stack_elide_zero_209 : i64
      %1828 = func.call @stack_pop_pointer() : () -> i64
      %1829 = func.call @cc_cons(%1828, %1827) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %1830 = arith.addi %1829, %__rlasp_stack_elide_zero_210 : i64
      %1831 = func.call @stack_pop_pointer() : () -> i64
      %1832 = func.call @cc_cons(%1831, %1830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %1833 = arith.addi %1832, %__rlasp_stack_elide_zero_211 : i64
      %1834 = func.call @stack_pop_pointer() : () -> i64
      %1835 = func.call @cc_cons(%1834, %1833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %1836 = arith.addi %1835, %__rlasp_stack_elide_zero_212 : i64
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @cc_cons(%1837, %1836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %1839 = arith.addi %1838, %__rlasp_stack_elide_zero_213 : i64
      %1840 = func.call @stack_pop_pointer() : () -> i64
      %1841 = func.call @cc_cons(%1840, %1839) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %1842 = arith.addi %1841, %__rlasp_stack_elide_zero_214 : i64
      %1843 = func.call @stack_pop_pointer() : () -> i64
      %1844 = func.call @cc_cons(%1843, %1842) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %1845 = arith.addi %1844, %__rlasp_stack_elide_zero_215 : i64
      %1846 = func.call @stack_pop_pointer() : () -> i64
      %1847 = func.call @cc_cons(%1846, %1845) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %1848 = arith.addi %1847, %__rlasp_stack_elide_zero_216 : i64
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @cc_cons(%1849, %1848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %1851 = arith.addi %1850, %__rlasp_stack_elide_zero_217 : i64
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @cc_cons(%1852, %1851) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %1854 = arith.addi %1853, %__rlasp_stack_elide_zero_218 : i64
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @cc_cons(%1855, %1854) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %1857 = arith.addi %1856, %__rlasp_stack_elide_zero_219 : i64
      %1858 = func.call @stack_pop_pointer() : () -> i64
      %1859 = func.call @cc_cons(%1858, %1857) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %1860 = arith.addi %1859, %__rlasp_stack_elide_zero_220 : i64
      %1861 = func.call @stack_pop_pointer() : () -> i64
      %1862 = func.call @cc_cons(%1861, %1860) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %1863 = arith.addi %1862, %__rlasp_stack_elide_zero_221 : i64
      %1864 = func.call @stack_pop_pointer() : () -> i64
      %1865 = func.call @cc_cons(%1864, %1863) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %1866 = arith.addi %1865, %__rlasp_stack_elide_zero_222 : i64
      %1867 = func.call @stack_pop_pointer() : () -> i64
      %1868 = func.call @cc_cons(%1867, %1866) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %1869 = arith.addi %1868, %__rlasp_stack_elide_zero_223 : i64
      %1870 = func.call @stack_pop_pointer() : () -> i64
      %1871 = func.call @cc_cons(%1870, %1869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %1872 = arith.addi %1871, %__rlasp_stack_elide_zero_224 : i64
      %1873 = func.call @stack_pop_pointer() : () -> i64
      %1874 = func.call @cc_cons(%1873, %1872) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %1875 = arith.addi %1874, %__rlasp_stack_elide_zero_225 : i64
      %1876 = func.call @stack_pop_pointer() : () -> i64
      %1877 = func.call @cc_cons(%1876, %1875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %1878 = arith.addi %1877, %__rlasp_stack_elide_zero_226 : i64
      %1879 = func.call @stack_pop_pointer() : () -> i64
      %1880 = func.call @cc_cons(%1879, %1878) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %1881 = arith.addi %1880, %__rlasp_stack_elide_zero_227 : i64
      %1882 = func.call @stack_pop_pointer() : () -> i64
      %1883 = func.call @cc_cons(%1882, %1881) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %1884 = arith.addi %1883, %__rlasp_stack_elide_zero_228 : i64
      %1885 = func.call @stack_pop_pointer() : () -> i64
      %1886 = func.call @cc_cons(%1885, %1884) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %1887 = arith.addi %1886, %__rlasp_stack_elide_zero_229 : i64
      %1888 = func.call @stack_pop_pointer() : () -> i64
      %1889 = func.call @cc_cons(%1888, %1887) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %1890 = arith.addi %1889, %__rlasp_stack_elide_zero_230 : i64
      %1891 = func.call @stack_pop_pointer() : () -> i64
      %1892 = func.call @cc_cons(%1891, %1890) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %1893 = arith.addi %1892, %__rlasp_stack_elide_zero_231 : i64
      %1894 = func.call @stack_pop_pointer() : () -> i64
      %1895 = func.call @cc_cons(%1894, %1893) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %1896 = arith.addi %1895, %__rlasp_stack_elide_zero_232 : i64
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @cc_cons(%1897, %1896) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %1899 = arith.addi %1898, %__rlasp_stack_elide_zero_233 : i64
      %1900 = func.call @stack_pop_pointer() : () -> i64
      %1901 = func.call @cc_cons(%1900, %1899) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %1902 = arith.addi %1901, %__rlasp_stack_elide_zero_234 : i64
      %1903 = func.call @stack_pop_pointer() : () -> i64
      %1904 = func.call @cc_cons(%1903, %1902) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %1905 = arith.addi %1904, %__rlasp_stack_elide_zero_235 : i64
      %1906 = func.call @stack_pop_pointer() : () -> i64
      %1907 = func.call @cc_cons(%1906, %1905) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %1908 = arith.addi %1907, %__rlasp_stack_elide_zero_236 : i64
      %1909 = func.call @stack_pop_pointer() : () -> i64
      %1910 = func.call @cc_cons(%1909, %1908) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %1911 = arith.addi %1910, %__rlasp_stack_elide_zero_237 : i64
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @cc_cons(%1912, %1911) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %1914 = arith.addi %1913, %__rlasp_stack_elide_zero_238 : i64
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @cc_cons(%1915, %1914) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %1917 = arith.addi %1916, %__rlasp_stack_elide_zero_239 : i64
      %1918 = func.call @stack_pop_pointer() : () -> i64
      %1919 = func.call @cc_cons(%1918, %1917) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %1920 = arith.addi %1919, %__rlasp_stack_elide_zero_240 : i64
      %1921 = func.call @stack_pop_pointer() : () -> i64
      %1922 = func.call @cc_cons(%1921, %1920) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %1923 = arith.addi %1922, %__rlasp_stack_elide_zero_241 : i64
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @cc_cons(%1924, %1923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %1926 = arith.addi %1925, %__rlasp_stack_elide_zero_242 : i64
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @cc_cons(%1927, %1926) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %1929 = arith.addi %1928, %__rlasp_stack_elide_zero_243 : i64
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @cc_cons(%1930, %1929) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %1932 = arith.addi %1931, %__rlasp_stack_elide_zero_244 : i64
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @cc_cons(%1933, %1932) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %1935 = arith.addi %1934, %__rlasp_stack_elide_zero_245 : i64
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_cons(%1936, %1935) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %1938 = arith.addi %1937, %__rlasp_stack_elide_zero_246 : i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1939, %1938) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %1941 = arith.addi %1940, %__rlasp_stack_elide_zero_247 : i64
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_cons(%1942, %1941) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %1944 = arith.addi %1943, %__rlasp_stack_elide_zero_248 : i64
      %1945 = func.call @cc_nil_value() : () -> i64
      %1946 = func.call @cc_nil_value() : () -> i64
      %1947 = func.call @cc_errorp(%1945) : (i64) -> i64
      %1948 = arith.cmpi ne, %1947, %1946 : i64
      %1949 = scf.if %1948 -> (i64) {
        scf.yield %1945 : i64
      } else {
        %1950 = func.call @cc_nil_value() : () -> i64
        %1951 = func.call @cc_nil_value() : () -> i64
        %1952 = func.call @cc_nil_value() : () -> i64
        %1953 = func.call @cc_nil_value() : () -> i64
        %1954 = func.call @cc_errorp(%1952) : (i64) -> i64
        %1955 = arith.cmpi ne, %1954, %1953 : i64
        %1956 = scf.if %1955 -> (i64) {
          scf.yield %1952 : i64
        } else {
          %1957 = func.call @cc_nil_value() : () -> i64
          %1958 = llvm.mlir.addressof @str279 : !llvm.ptr
          %1959 = arith.constant 38 : i64
          %1960 = func.call @cc_make_string(%1958, %1959) : (!llvm.ptr, i64) -> i64
          %1961 = func.call @cc_nil_value() : () -> i64
          %1962 = func.call @cc_intern(%1960, %1961) : (i64, i64) -> i64
          %1963 = func.call @cc_nil_value() : () -> i64
          %1964 = func.call @cc_cons(%1962, %1963) : (i64, i64) -> i64
          %1965 = func.call @cc_values_pack(%1964) : (i64) -> i64
          %1966 = func.call @cc_set_symbol_value(%1962, %1957) : (i64, i64) -> i64
          %1967 = llvm.mlir.addressof @str280 : !llvm.ptr
          %1968 = arith.constant 39 : i64
          %1969 = func.call @cc_make_string(%1967, %1968) : (!llvm.ptr, i64) -> i64
          %1970 = func.call @cc_nil_value() : () -> i64
          %1971 = func.call @cc_intern(%1969, %1970) : (i64, i64) -> i64
          %1972 = func.call @cc_nil_value() : () -> i64
          %1973 = func.call @cc_cons(%1971, %1972) : (i64, i64) -> i64
          %1974 = func.call @cc_values_pack(%1973) : (i64) -> i64
          %1975 = func.call @cc_set_symbol_value(%1971, %1957) : (i64, i64) -> i64
          %1976 = llvm.mlir.addressof @str281 : !llvm.ptr
          %1977 = arith.constant 40 : i64
          %1978 = func.call @cc_make_string(%1976, %1977) : (!llvm.ptr, i64) -> i64
          %1979 = func.call @cc_nil_value() : () -> i64
          %1980 = func.call @cc_intern(%1978, %1979) : (i64, i64) -> i64
          %1981 = func.call @cc_nil_value() : () -> i64
          %1982 = func.call @cc_cons(%1980, %1981) : (i64, i64) -> i64
          %1983 = func.call @cc_values_pack(%1982) : (i64) -> i64
          %1984 = func.call @cc_set_symbol_value(%1980, %1957) : (i64, i64) -> i64
          %1985:3 = scf.while (%arg0 = %1950, %arg1 = %1951, %arg2 = %1944) : (i64, i64, i64) -> (i64, i64, i64) {
            %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
            %1986 = arith.addi %arg2, %__rlasp_stack_elide_zero_249 : i64
            %1987 = func.call @cc_nil_value() : () -> i64
            %1988 = arith.cmpi ne, %1986, %1987 : i64
            %1989 = func.call @cc_nil_value() : () -> i64
            %1990 = llvm.mlir.addressof @str282 : !llvm.ptr
            %1991 = arith.constant 38 : i64
            %1992 = func.call @cc_make_string(%1990, %1991) : (!llvm.ptr, i64) -> i64
            %1993 = func.call @cc_nil_value() : () -> i64
            %1994 = func.call @cc_intern(%1992, %1993) : (i64, i64) -> i64
            %1995 = func.call @cc_nil_value() : () -> i64
            %1996 = func.call @cc_cons(%1994, %1995) : (i64, i64) -> i64
            %1997 = func.call @cc_values_pack(%1996) : (i64) -> i64
            %1998 = func.call @cc_symbol_value(%1994) : (i64) -> i64
            %1999 = arith.cmpi ne, %1998, %1989 : i64
            %2000 = llvm.mlir.addressof @str283 : !llvm.ptr
            %2001 = arith.constant 38 : i64
            %2002 = func.call @cc_make_string(%2000, %2001) : (!llvm.ptr, i64) -> i64
            %2003 = func.call @cc_nil_value() : () -> i64
            %2004 = func.call @cc_intern(%2002, %2003) : (i64, i64) -> i64
            %2005 = func.call @cc_nil_value() : () -> i64
            %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
            %2007 = func.call @cc_values_pack(%2006) : (i64) -> i64
            %2008 = func.call @cc_symbol_value(%2004) : (i64) -> i64
            %2009 = arith.cmpi ne, %2008, %1989 : i64
            %2010 = arith.ori %1999, %2009 : i1
            %2011 = arith.constant 0 : i1
            %2012 = arith.cmpi eq, %2010, %2011 : i1
            %2013 = arith.andi %1988, %2012 : i1
            scf.condition(%2013) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%2014: i64, %2015: i64, %2016: i64):
            %2017 = func.call @cc_nil_value() : () -> i64
            %2018 = func.call @cc_nil_value() : () -> i64
            %2019 = func.call @cc_errorp(%2017) : (i64) -> i64
            %2020 = arith.cmpi ne, %2019, %2018 : i64
            %2021:3 = scf.if %2020 -> (i64, i64, i64) {
              scf.yield %2017, %2015, %2014 : i64, i64, i64
            } else {
              %2022 = func.call @cc_nil_value() : () -> i64
              %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
              %2023 = arith.addi %2016, %__rlasp_stack_elide_zero_250 : i64
              %2024 = func.call @cc_nil_value() : () -> i64
              %2025 = arith.cmpi eq, %2023, %2024 : i64
              %2027 = func.call @cc_t_value() : () -> i64
              %2026 = arith.select %2025, %2027, %2024 : i64
              %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
              %2028 = arith.addi %2026, %__rlasp_stack_elide_zero_251 : i64
              %2029 = func.call @cc_nil_value() : () -> i64
              %2030 = func.call @cc_cons(%2028, %2029) : (i64, i64) -> i64
              %2031 = func.call @cc_not(%2030) : (i64) -> i64
              %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
              %2032 = arith.addi %2031, %__rlasp_stack_elide_zero_252 : i64
              %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
              %2033 = arith.addi %2016, %__rlasp_stack_elide_zero_253 : i64
              %2034 = func.call @cc_is_cons(%2033) : (i64) -> i32
              %2035 = arith.constant 0 : i32
              %2036 = arith.cmpi ne, %2034, %2035 : i32
              %2037 = func.call @cc_t_value() : () -> i64
              %2038 = func.call @cc_nil_value() : () -> i64
              %2039 = arith.select %2036, %2037, %2038 : i64
              %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
              %2040 = arith.addi %2039, %__rlasp_stack_elide_zero_254 : i64
              %2041 = func.call @cc_nil_value() : () -> i64
              %2042 = func.call @cc_cons(%2040, %2041) : (i64, i64) -> i64
              %2043 = func.call @cc_not(%2042) : (i64) -> i64
              %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
              %2044 = arith.addi %2043, %__rlasp_stack_elide_zero_255 : i64
              %2045 = func.call @cc_cons(%2044, %2022) : (i64, i64) -> i64
              %2046 = func.call @cc_cons(%2032, %2045) : (i64, i64) -> i64
              %2047 = func.call @cc_and(%2046) : (i64) -> i64
              %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
              %2048 = arith.addi %2047, %__rlasp_stack_elide_zero_256 : i64
              %2049 = func.call @cc_nil_value() : () -> i64
              %2050 = arith.cmpi ne, %2048, %2049 : i64
              scf.if %2050 {
                %2051 = llvm.mlir.addressof @str284 : !llvm.ptr
                %2052 = arith.constant 10 : i64
                %2053 = func.call @cc_make_string(%2051, %2052) : (!llvm.ptr, i64) -> i64
                %2054 = func.call @cc_nil_value() : () -> i64
                %2055 = func.call @cc_intern(%2053, %2054) : (i64, i64) -> i64
                %2056 = func.call @cc_nil_value() : () -> i64
                %2057 = func.call @cc_cons(%2055, %2056) : (i64, i64) -> i64
                %2058 = func.call @cc_values_pack(%2057) : (i64) -> i64
                %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
                %2059 = arith.addi %2055, %__rlasp_stack_elide_zero_257 : i64
                %2060 = func.call @cc_nil_value() : () -> i64
                %2061 = func.call @cc_errorp(%2059) : (i64) -> i64
                %2062 = arith.cmpi ne, %2061, %2060 : i64
                %2063 = arith.cmpi eq, %2060, %2060 : i64
                %2064 = arith.andi %2062, %2063 : i1
                %2065 = scf.if %2064 -> (i64) {
                  scf.yield %2059 : i64
                } else {
                  scf.yield %2060 : i64
                }
                %2066 = arith.cmpi ne, %2065, %2060 : i64
                scf.if %2066 {
                  func.call @stack_push_pointer(%2065) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%2059) : (i64) -> ()
                  %2067 = llvm.mlir.addressof @str285 : !llvm.ptr
                  %2068 = func.call @cc_make_function_ref_const(%2067) : (!llvm.ptr) -> i64
                  %2069 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%2068, %2069) : (i64, i64) -> ()
                }
                %2070 = func.call @stack_pop_pointer() : () -> i64
                %2071 = func.call @cc_multiple_value_list(%2070) : (i64) -> i64
                %2072 = func.call @cc_t_value() : () -> i64
                %2073 = llvm.mlir.addressof @str286 : !llvm.ptr
                %2074 = arith.constant 38 : i64
                %2075 = func.call @cc_make_string(%2073, %2074) : (!llvm.ptr, i64) -> i64
                %2076 = func.call @cc_nil_value() : () -> i64
                %2077 = func.call @cc_intern(%2075, %2076) : (i64, i64) -> i64
                %2078 = func.call @cc_nil_value() : () -> i64
                %2079 = func.call @cc_cons(%2077, %2078) : (i64, i64) -> i64
                %2080 = func.call @cc_values_pack(%2079) : (i64) -> i64
                %2081 = func.call @cc_set_symbol_value(%2077, %2072) : (i64, i64) -> i64
                %2082 = llvm.mlir.addressof @str287 : !llvm.ptr
                %2083 = arith.constant 39 : i64
                %2084 = func.call @cc_make_string(%2082, %2083) : (!llvm.ptr, i64) -> i64
                %2085 = func.call @cc_nil_value() : () -> i64
                %2086 = func.call @cc_intern(%2084, %2085) : (i64, i64) -> i64
                %2087 = func.call @cc_nil_value() : () -> i64
                %2088 = func.call @cc_cons(%2086, %2087) : (i64, i64) -> i64
                %2089 = func.call @cc_values_pack(%2088) : (i64) -> i64
                %2090 = func.call @cc_set_symbol_value(%2086, %2070) : (i64, i64) -> i64
                %2091 = llvm.mlir.addressof @str288 : !llvm.ptr
                %2092 = arith.constant 40 : i64
                %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
                %2094 = func.call @cc_nil_value() : () -> i64
                %2095 = func.call @cc_intern(%2093, %2094) : (i64, i64) -> i64
                %2096 = func.call @cc_nil_value() : () -> i64
                %2097 = func.call @cc_cons(%2095, %2096) : (i64, i64) -> i64
                %2098 = func.call @cc_values_pack(%2097) : (i64) -> i64
                %2099 = func.call @cc_set_symbol_value(%2095, %2071) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2070) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %2100 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2100, %2015, %2014 : i64, i64, i64
            }
            %2101 = func.call @cc_nil_value() : () -> i64
            %2102 = func.call @cc_errorp(%2021#0) : (i64) -> i64
            %2103 = arith.cmpi ne, %2102, %2101 : i64
            %2104:3 = scf.if %2103 -> (i64, i64, i64) {
              scf.yield %2021#0, %2021#1, %2021#2 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
              %2105 = arith.addi %2016, %__rlasp_stack_elide_zero_258 : i64
              %2106 = func.call @cc_car(%2105) : (i64) -> i64
              %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
              %2107 = arith.addi %2106, %__rlasp_stack_elide_zero_259 : i64
              %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
              %2108 = arith.addi %2107, %__rlasp_stack_elide_zero_260 : i64
              scf.yield %2108, %2021#1, %2107 : i64, i64, i64
            }
            %2109 = func.call @cc_nil_value() : () -> i64
            %2110 = func.call @cc_errorp(%2104#0) : (i64) -> i64
            %2111 = arith.cmpi ne, %2110, %2109 : i64
            %2112:3 = scf.if %2111 -> (i64, i64, i64) {
              scf.yield %2104#0, %2104#1, %2104#2 : i64, i64, i64
            } else {
              %2113 = func.call @cc_nil_value() : () -> i64
              %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
              %2114 = arith.addi %2104#2, %__rlasp_stack_elide_zero_261 : i64
              %2115 = func.call @cc_fboundp(%2114) : (i64) -> i64
              %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
              %2116 = arith.addi %2115, %__rlasp_stack_elide_zero_262 : i64
              %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
              %2117 = arith.addi %2104#2, %__rlasp_stack_elide_zero_263 : i64
              %2118 = func.call @cc_fdefinition(%2117) : (i64) -> i64
              func.call @stack_push_pointer(%2118) : (i64) -> ()
              %2119 = llvm.mlir.addressof @str289 : !llvm.ptr
              %2120 = arith.constant 16 : i64
              %2121 = func.call @cc_make_string(%2119, %2120) : (!llvm.ptr, i64) -> i64
              %2122 = llvm.mlir.addressof @str290 : !llvm.ptr
              %2123 = arith.constant 11 : i64
              %2124 = func.call @cc_make_string(%2122, %2123) : (!llvm.ptr, i64) -> i64
              %2125 = func.call @cc_intern(%2121, %2124) : (i64, i64) -> i64
              %2126 = func.call @cc_nil_value() : () -> i64
              %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
              %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
              %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
              %2129 = arith.addi %2125, %__rlasp_stack_elide_zero_264 : i64
              %2130 = func.call @stack_pop_pointer() : () -> i64
              %2131 = func.call @cc_typep(%2130, %2129) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
              %2132 = arith.addi %2131, %__rlasp_stack_elide_zero_265 : i64
              %2133 = func.call @cc_cons(%2132, %2113) : (i64, i64) -> i64
              %2134 = func.call @cc_cons(%2116, %2133) : (i64, i64) -> i64
              %2135 = func.call @cc_and(%2134) : (i64) -> i64
              %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
              %2136 = arith.addi %2135, %__rlasp_stack_elide_zero_266 : i64
              %2137 = func.call @cc_nil_value() : () -> i64
              %2138 = func.call @cc_cons(%2136, %2137) : (i64, i64) -> i64
              %2139 = func.call @cc_not(%2138) : (i64) -> i64
              %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
              %2140 = arith.addi %2139, %__rlasp_stack_elide_zero_267 : i64
              %2141 = func.call @cc_nil_value() : () -> i64
              %2142 = arith.cmpi ne, %2140, %2141 : i64
              %2143:2 = scf.if %2142 -> (i64, i64) {
                %2144 = func.call @cc_nil_value() : () -> i64
                %2145 = func.call @cc_nil_value() : () -> i64
                %2146 = func.call @cc_errorp(%2144) : (i64) -> i64
                %2147 = arith.cmpi ne, %2146, %2145 : i64
                %2148:2 = scf.if %2147 -> (i64, i64) {
                  scf.yield %2144, %2104#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%2104#1) : (i64) -> ()
                  %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
                  %2149 = arith.addi %2104#2, %__rlasp_stack_elide_zero_268 : i64
                  %2150 = func.call @cc_nil_value() : () -> i64
                  %2151 = func.call @cc_errorp(%2149) : (i64) -> i64
                  %2152 = arith.cmpi ne, %2151, %2150 : i64
                  %2153 = arith.cmpi eq, %2150, %2150 : i64
                  %2154 = arith.andi %2152, %2153 : i1
                  %2155 = scf.if %2154 -> (i64) {
                    scf.yield %2149 : i64
                  } else {
                    scf.yield %2150 : i64
                  }
                  %2156 = arith.cmpi ne, %2155, %2150 : i64
                  scf.if %2156 {
                    func.call @stack_push_pointer(%2155) : (i64) -> ()
                  } else {
                    %2157 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%2157) : (i64) -> ()
                    %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
                    %2158 = arith.addi %2149, %__rlasp_stack_elide_zero_269 : i64
                    %2159 = func.call @stack_pop_pointer() : () -> i64
                    %2160 = func.call @cc_cons(%2158, %2159) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%2160) : (i64) -> ()
                  }
                  %2161 = func.call @stack_pop_pointer() : () -> i64
                  %2162 = func.call @stack_pop_pointer() : () -> i64
                  %2163 = func.call @cc_append(%2162, %2161) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
                  %2164 = arith.addi %2163, %__rlasp_stack_elide_zero_270 : i64
                  %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
                  %2165 = arith.addi %2164, %__rlasp_stack_elide_zero_271 : i64
                  scf.yield %2165, %2164 : i64, i64
                }
                %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
                %2166 = arith.addi %2148#0, %__rlasp_stack_elide_zero_272 : i64
                scf.yield %2166, %2148#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %2167 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2167, %2104#1 : i64, i64
              }
              %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
              %2168 = arith.addi %2143#0, %__rlasp_stack_elide_zero_273 : i64
              scf.yield %2168, %2143#1, %2104#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%2112#0) : (i64) -> ()
            %2169 = func.call @stack_depth() : () -> i64
            %2170 = arith.constant 0 : i64
            %2171 = arith.cmpi sgt, %2169, %2170 : i64
            scf.if %2171 {
              %2172 = func.call @stack_pop_pointer() : () -> i64
            }
            %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
            %2173 = arith.addi %2016, %__rlasp_stack_elide_zero_274 : i64
            %2174 = func.call @cc_cdr(%2173) : (i64) -> i64
            %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
            %2175 = arith.addi %2174, %__rlasp_stack_elide_zero_275 : i64
            func.call @stack_push_pointer(%2175) : (i64) -> ()
            %2176 = func.call @stack_depth() : () -> i64
            %2177 = arith.constant 0 : i64
            %2178 = arith.cmpi sgt, %2176, %2177 : i64
            scf.if %2178 {
              %2179 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2112#2, %2112#1, %2175 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %2180 = func.call @stack_pop_pointer() : () -> i64
          %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
          %2181 = arith.addi %1985#1, %__rlasp_stack_elide_zero_276 : i64
          %2182 = func.call @cc_multiple_value_list(%2181) : (i64) -> i64
          %2183 = llvm.mlir.addressof @str291 : !llvm.ptr
          %2184 = arith.constant 38 : i64
          %2185 = func.call @cc_make_string(%2183, %2184) : (!llvm.ptr, i64) -> i64
          %2186 = func.call @cc_nil_value() : () -> i64
          %2187 = func.call @cc_intern(%2185, %2186) : (i64, i64) -> i64
          %2188 = func.call @cc_nil_value() : () -> i64
          %2189 = func.call @cc_cons(%2187, %2188) : (i64, i64) -> i64
          %2190 = func.call @cc_values_pack(%2189) : (i64) -> i64
          %2191 = func.call @cc_symbol_value(%2187) : (i64) -> i64
          %2192 = llvm.mlir.addressof @str292 : !llvm.ptr
          %2193 = arith.constant 39 : i64
          %2194 = func.call @cc_make_string(%2192, %2193) : (!llvm.ptr, i64) -> i64
          %2195 = func.call @cc_nil_value() : () -> i64
          %2196 = func.call @cc_intern(%2194, %2195) : (i64, i64) -> i64
          %2197 = func.call @cc_nil_value() : () -> i64
          %2198 = func.call @cc_cons(%2196, %2197) : (i64, i64) -> i64
          %2199 = func.call @cc_values_pack(%2198) : (i64) -> i64
          %2200 = func.call @cc_symbol_value(%2196) : (i64) -> i64
          %2201 = llvm.mlir.addressof @str293 : !llvm.ptr
          %2202 = arith.constant 40 : i64
          %2203 = func.call @cc_make_string(%2201, %2202) : (!llvm.ptr, i64) -> i64
          %2204 = func.call @cc_nil_value() : () -> i64
          %2205 = func.call @cc_intern(%2203, %2204) : (i64, i64) -> i64
          %2206 = func.call @cc_nil_value() : () -> i64
          %2207 = func.call @cc_cons(%2205, %2206) : (i64, i64) -> i64
          %2208 = func.call @cc_values_pack(%2207) : (i64) -> i64
          %2209 = func.call @cc_symbol_value(%2205) : (i64) -> i64
          %2210 = func.call @cc_nil_value() : () -> i64
          %2211 = arith.cmpi ne, %2191, %2210 : i64
          %2212 = scf.if %2211 -> (i64) {
            scf.yield %2209 : i64
          } else {
            scf.yield %2182 : i64
          }
          %2213 = func.call @cc_values_pack(%2212) : (i64) -> i64
          %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
          %2214 = arith.addi %2213, %__rlasp_stack_elide_zero_277 : i64
          scf.yield %2214 : i64
        }
        %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
        %2215 = arith.addi %1956, %__rlasp_stack_elide_zero_278 : i64
        scf.yield %2215 : i64
      }
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %2216 = arith.addi %1949, %__rlasp_stack_elide_zero_279 : i64
      scf.yield %2216 : i64
    }
    func.call @stack_push_pointer(%1131) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_120590987952131"() {
    %2518 = func.call @cc_nil_value() : () -> i64
    %2519 = func.call @cc_nil_value() : () -> i64
    %2520 = func.call @cc_errorp(%2518) : (i64) -> i64
    %2521 = arith.cmpi ne, %2520, %2519 : i64
    %2522 = scf.if %2521 -> (i64) {
      scf.yield %2518 : i64
    } else {
      %2523 = llvm.mlir.addressof @str322 : !llvm.ptr
      %2524 = arith.constant 22 : i64
      %2525 = func.call @cc_make_string(%2523, %2524) : (!llvm.ptr, i64) -> i64
      %2526 = llvm.mlir.addressof @str323 : !llvm.ptr
      %2527 = arith.constant 4 : i64
      %2528 = func.call @cc_make_string(%2526, %2527) : (!llvm.ptr, i64) -> i64
      %2529 = func.call @cc_intern(%2525, %2528) : (i64, i64) -> i64
      %2530 = func.call @cc_nil_value() : () -> i64
      %2531 = func.call @cc_cons(%2529, %2530) : (i64, i64) -> i64
      %2532 = func.call @cc_values_pack(%2531) : (i64) -> i64
      func.call @stack_push_pointer(%2529) : (i64) -> ()
      %2533 = llvm.mlir.addressof @str324 : !llvm.ptr
      %2534 = arith.constant 19 : i64
      %2535 = func.call @cc_make_string(%2533, %2534) : (!llvm.ptr, i64) -> i64
      %2536 = llvm.mlir.addressof @str325 : !llvm.ptr
      %2537 = arith.constant 4 : i64
      %2538 = func.call @cc_make_string(%2536, %2537) : (!llvm.ptr, i64) -> i64
      %2539 = func.call @cc_intern(%2535, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_nil_value() : () -> i64
      %2541 = func.call @cc_cons(%2539, %2540) : (i64, i64) -> i64
      %2542 = func.call @cc_values_pack(%2541) : (i64) -> i64
      func.call @stack_push_pointer(%2539) : (i64) -> ()
      %2543 = llvm.mlir.addressof @str326 : !llvm.ptr
      %2544 = arith.constant 25 : i64
      %2545 = func.call @cc_make_string(%2543, %2544) : (!llvm.ptr, i64) -> i64
      %2546 = llvm.mlir.addressof @str327 : !llvm.ptr
      %2547 = arith.constant 4 : i64
      %2548 = func.call @cc_make_string(%2546, %2547) : (!llvm.ptr, i64) -> i64
      %2549 = func.call @cc_intern(%2545, %2548) : (i64, i64) -> i64
      %2550 = func.call @cc_nil_value() : () -> i64
      %2551 = func.call @cc_cons(%2549, %2550) : (i64, i64) -> i64
      %2552 = func.call @cc_values_pack(%2551) : (i64) -> i64
      func.call @stack_push_pointer(%2549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @cc_cons(%2554, %2553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %2556 = arith.addi %2555, %__rlasp_stack_elide_zero_280 : i64
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_cons(%2557, %2556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %2559 = arith.addi %2558, %__rlasp_stack_elide_zero_281 : i64
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = func.call @cc_cons(%2560, %2559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %2562 = arith.addi %2561, %__rlasp_stack_elide_zero_282 : i64
      %2563 = func.call @cc_nil_value() : () -> i64
      %2564 = func.call @cc_nil_value() : () -> i64
      %2565 = func.call @cc_errorp(%2563) : (i64) -> i64
      %2566 = arith.cmpi ne, %2565, %2564 : i64
      %2567 = scf.if %2566 -> (i64) {
        scf.yield %2563 : i64
      } else {
        %2568 = func.call @cc_nil_value() : () -> i64
        %2569 = func.call @cc_nil_value() : () -> i64
        %2570 = func.call @cc_nil_value() : () -> i64
        %2571 = func.call @cc_nil_value() : () -> i64
        %2572 = func.call @cc_errorp(%2570) : (i64) -> i64
        %2573 = arith.cmpi ne, %2572, %2571 : i64
        %2574 = scf.if %2573 -> (i64) {
          scf.yield %2570 : i64
        } else {
          %2575 = func.call @cc_nil_value() : () -> i64
          %2576 = llvm.mlir.addressof @str328 : !llvm.ptr
          %2577 = arith.constant 38 : i64
          %2578 = func.call @cc_make_string(%2576, %2577) : (!llvm.ptr, i64) -> i64
          %2579 = func.call @cc_nil_value() : () -> i64
          %2580 = func.call @cc_intern(%2578, %2579) : (i64, i64) -> i64
          %2581 = func.call @cc_nil_value() : () -> i64
          %2582 = func.call @cc_cons(%2580, %2581) : (i64, i64) -> i64
          %2583 = func.call @cc_values_pack(%2582) : (i64) -> i64
          %2584 = func.call @cc_set_symbol_value(%2580, %2575) : (i64, i64) -> i64
          %2585 = llvm.mlir.addressof @str329 : !llvm.ptr
          %2586 = arith.constant 39 : i64
          %2587 = func.call @cc_make_string(%2585, %2586) : (!llvm.ptr, i64) -> i64
          %2588 = func.call @cc_nil_value() : () -> i64
          %2589 = func.call @cc_intern(%2587, %2588) : (i64, i64) -> i64
          %2590 = func.call @cc_nil_value() : () -> i64
          %2591 = func.call @cc_cons(%2589, %2590) : (i64, i64) -> i64
          %2592 = func.call @cc_values_pack(%2591) : (i64) -> i64
          %2593 = func.call @cc_set_symbol_value(%2589, %2575) : (i64, i64) -> i64
          %2594 = llvm.mlir.addressof @str330 : !llvm.ptr
          %2595 = arith.constant 40 : i64
          %2596 = func.call @cc_make_string(%2594, %2595) : (!llvm.ptr, i64) -> i64
          %2597 = func.call @cc_nil_value() : () -> i64
          %2598 = func.call @cc_intern(%2596, %2597) : (i64, i64) -> i64
          %2599 = func.call @cc_nil_value() : () -> i64
          %2600 = func.call @cc_cons(%2598, %2599) : (i64, i64) -> i64
          %2601 = func.call @cc_values_pack(%2600) : (i64) -> i64
          %2602 = func.call @cc_set_symbol_value(%2598, %2575) : (i64, i64) -> i64
          %2603:3 = scf.while (%arg0 = %2568, %arg1 = %2569, %arg2 = %2562) : (i64, i64, i64) -> (i64, i64, i64) {
            %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
            %2604 = arith.addi %arg2, %__rlasp_stack_elide_zero_283 : i64
            %2605 = func.call @cc_nil_value() : () -> i64
            %2606 = arith.cmpi ne, %2604, %2605 : i64
            %2607 = func.call @cc_nil_value() : () -> i64
            %2608 = llvm.mlir.addressof @str331 : !llvm.ptr
            %2609 = arith.constant 38 : i64
            %2610 = func.call @cc_make_string(%2608, %2609) : (!llvm.ptr, i64) -> i64
            %2611 = func.call @cc_nil_value() : () -> i64
            %2612 = func.call @cc_intern(%2610, %2611) : (i64, i64) -> i64
            %2613 = func.call @cc_nil_value() : () -> i64
            %2614 = func.call @cc_cons(%2612, %2613) : (i64, i64) -> i64
            %2615 = func.call @cc_values_pack(%2614) : (i64) -> i64
            %2616 = func.call @cc_symbol_value(%2612) : (i64) -> i64
            %2617 = arith.cmpi ne, %2616, %2607 : i64
            %2618 = llvm.mlir.addressof @str332 : !llvm.ptr
            %2619 = arith.constant 38 : i64
            %2620 = func.call @cc_make_string(%2618, %2619) : (!llvm.ptr, i64) -> i64
            %2621 = func.call @cc_nil_value() : () -> i64
            %2622 = func.call @cc_intern(%2620, %2621) : (i64, i64) -> i64
            %2623 = func.call @cc_nil_value() : () -> i64
            %2624 = func.call @cc_cons(%2622, %2623) : (i64, i64) -> i64
            %2625 = func.call @cc_values_pack(%2624) : (i64) -> i64
            %2626 = func.call @cc_symbol_value(%2622) : (i64) -> i64
            %2627 = arith.cmpi ne, %2626, %2607 : i64
            %2628 = arith.ori %2617, %2627 : i1
            %2629 = arith.constant 0 : i1
            %2630 = arith.cmpi eq, %2628, %2629 : i1
            %2631 = arith.andi %2606, %2630 : i1
            scf.condition(%2631) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%2632: i64, %2633: i64, %2634: i64):
            %2635 = func.call @cc_nil_value() : () -> i64
            %2636 = func.call @cc_nil_value() : () -> i64
            %2637 = func.call @cc_errorp(%2635) : (i64) -> i64
            %2638 = arith.cmpi ne, %2637, %2636 : i64
            %2639:3 = scf.if %2638 -> (i64, i64, i64) {
              scf.yield %2635, %2633, %2632 : i64, i64, i64
            } else {
              %2640 = func.call @cc_nil_value() : () -> i64
              %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
              %2641 = arith.addi %2634, %__rlasp_stack_elide_zero_284 : i64
              %2642 = func.call @cc_nil_value() : () -> i64
              %2643 = arith.cmpi eq, %2641, %2642 : i64
              %2645 = func.call @cc_t_value() : () -> i64
              %2644 = arith.select %2643, %2645, %2642 : i64
              %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
              %2646 = arith.addi %2644, %__rlasp_stack_elide_zero_285 : i64
              %2647 = func.call @cc_nil_value() : () -> i64
              %2648 = func.call @cc_cons(%2646, %2647) : (i64, i64) -> i64
              %2649 = func.call @cc_not(%2648) : (i64) -> i64
              %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
              %2650 = arith.addi %2649, %__rlasp_stack_elide_zero_286 : i64
              %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
              %2651 = arith.addi %2634, %__rlasp_stack_elide_zero_287 : i64
              %2652 = func.call @cc_is_cons(%2651) : (i64) -> i32
              %2653 = arith.constant 0 : i32
              %2654 = arith.cmpi ne, %2652, %2653 : i32
              %2655 = func.call @cc_t_value() : () -> i64
              %2656 = func.call @cc_nil_value() : () -> i64
              %2657 = arith.select %2654, %2655, %2656 : i64
              %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
              %2658 = arith.addi %2657, %__rlasp_stack_elide_zero_288 : i64
              %2659 = func.call @cc_nil_value() : () -> i64
              %2660 = func.call @cc_cons(%2658, %2659) : (i64, i64) -> i64
              %2661 = func.call @cc_not(%2660) : (i64) -> i64
              %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
              %2662 = arith.addi %2661, %__rlasp_stack_elide_zero_289 : i64
              %2663 = func.call @cc_cons(%2662, %2640) : (i64, i64) -> i64
              %2664 = func.call @cc_cons(%2650, %2663) : (i64, i64) -> i64
              %2665 = func.call @cc_and(%2664) : (i64) -> i64
              %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
              %2666 = arith.addi %2665, %__rlasp_stack_elide_zero_290 : i64
              %2667 = func.call @cc_nil_value() : () -> i64
              %2668 = arith.cmpi ne, %2666, %2667 : i64
              scf.if %2668 {
                %2669 = llvm.mlir.addressof @str333 : !llvm.ptr
                %2670 = arith.constant 10 : i64
                %2671 = func.call @cc_make_string(%2669, %2670) : (!llvm.ptr, i64) -> i64
                %2672 = func.call @cc_nil_value() : () -> i64
                %2673 = func.call @cc_intern(%2671, %2672) : (i64, i64) -> i64
                %2674 = func.call @cc_nil_value() : () -> i64
                %2675 = func.call @cc_cons(%2673, %2674) : (i64, i64) -> i64
                %2676 = func.call @cc_values_pack(%2675) : (i64) -> i64
                %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
                %2677 = arith.addi %2673, %__rlasp_stack_elide_zero_291 : i64
                %2678 = func.call @cc_nil_value() : () -> i64
                %2679 = func.call @cc_errorp(%2677) : (i64) -> i64
                %2680 = arith.cmpi ne, %2679, %2678 : i64
                %2681 = arith.cmpi eq, %2678, %2678 : i64
                %2682 = arith.andi %2680, %2681 : i1
                %2683 = scf.if %2682 -> (i64) {
                  scf.yield %2677 : i64
                } else {
                  scf.yield %2678 : i64
                }
                %2684 = arith.cmpi ne, %2683, %2678 : i64
                scf.if %2684 {
                  func.call @stack_push_pointer(%2683) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%2677) : (i64) -> ()
                  %2685 = llvm.mlir.addressof @str334 : !llvm.ptr
                  %2686 = func.call @cc_make_function_ref_const(%2685) : (!llvm.ptr) -> i64
                  %2687 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%2686, %2687) : (i64, i64) -> ()
                }
                %2688 = func.call @stack_pop_pointer() : () -> i64
                %2689 = func.call @cc_multiple_value_list(%2688) : (i64) -> i64
                %2690 = func.call @cc_t_value() : () -> i64
                %2691 = llvm.mlir.addressof @str335 : !llvm.ptr
                %2692 = arith.constant 38 : i64
                %2693 = func.call @cc_make_string(%2691, %2692) : (!llvm.ptr, i64) -> i64
                %2694 = func.call @cc_nil_value() : () -> i64
                %2695 = func.call @cc_intern(%2693, %2694) : (i64, i64) -> i64
                %2696 = func.call @cc_nil_value() : () -> i64
                %2697 = func.call @cc_cons(%2695, %2696) : (i64, i64) -> i64
                %2698 = func.call @cc_values_pack(%2697) : (i64) -> i64
                %2699 = func.call @cc_set_symbol_value(%2695, %2690) : (i64, i64) -> i64
                %2700 = llvm.mlir.addressof @str336 : !llvm.ptr
                %2701 = arith.constant 39 : i64
                %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
                %2703 = func.call @cc_nil_value() : () -> i64
                %2704 = func.call @cc_intern(%2702, %2703) : (i64, i64) -> i64
                %2705 = func.call @cc_nil_value() : () -> i64
                %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
                %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
                %2708 = func.call @cc_set_symbol_value(%2704, %2688) : (i64, i64) -> i64
                %2709 = llvm.mlir.addressof @str337 : !llvm.ptr
                %2710 = arith.constant 40 : i64
                %2711 = func.call @cc_make_string(%2709, %2710) : (!llvm.ptr, i64) -> i64
                %2712 = func.call @cc_nil_value() : () -> i64
                %2713 = func.call @cc_intern(%2711, %2712) : (i64, i64) -> i64
                %2714 = func.call @cc_nil_value() : () -> i64
                %2715 = func.call @cc_cons(%2713, %2714) : (i64, i64) -> i64
                %2716 = func.call @cc_values_pack(%2715) : (i64) -> i64
                %2717 = func.call @cc_set_symbol_value(%2713, %2689) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2688) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %2718 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2718, %2633, %2632 : i64, i64, i64
            }
            %2719 = func.call @cc_nil_value() : () -> i64
            %2720 = func.call @cc_errorp(%2639#0) : (i64) -> i64
            %2721 = arith.cmpi ne, %2720, %2719 : i64
            %2722:3 = scf.if %2721 -> (i64, i64, i64) {
              scf.yield %2639#0, %2639#1, %2639#2 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
              %2723 = arith.addi %2634, %__rlasp_stack_elide_zero_292 : i64
              %2724 = func.call @cc_car(%2723) : (i64) -> i64
              %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
              %2725 = arith.addi %2724, %__rlasp_stack_elide_zero_293 : i64
              %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
              %2726 = arith.addi %2725, %__rlasp_stack_elide_zero_294 : i64
              scf.yield %2726, %2639#1, %2725 : i64, i64, i64
            }
            %2727 = func.call @cc_nil_value() : () -> i64
            %2728 = func.call @cc_errorp(%2722#0) : (i64) -> i64
            %2729 = arith.cmpi ne, %2728, %2727 : i64
            %2730:3 = scf.if %2729 -> (i64, i64, i64) {
              scf.yield %2722#0, %2722#1, %2722#2 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
              %2731 = arith.addi %2722#2, %__rlasp_stack_elide_zero_295 : i64
              %2732 = func.call @cc_fboundp(%2731) : (i64) -> i64
              %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
              %2733 = arith.addi %2732, %__rlasp_stack_elide_zero_296 : i64
              %2734 = func.call @cc_nil_value() : () -> i64
              %2735 = func.call @cc_cons(%2733, %2734) : (i64, i64) -> i64
              %2736 = func.call @cc_not(%2735) : (i64) -> i64
              %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
              %2737 = arith.addi %2736, %__rlasp_stack_elide_zero_297 : i64
              %2738 = func.call @cc_nil_value() : () -> i64
              %2739 = arith.cmpi ne, %2737, %2738 : i64
              %2740:2 = scf.if %2739 -> (i64, i64) {
                %2741 = func.call @cc_nil_value() : () -> i64
                %2742 = func.call @cc_nil_value() : () -> i64
                %2743 = func.call @cc_errorp(%2741) : (i64) -> i64
                %2744 = arith.cmpi ne, %2743, %2742 : i64
                %2745:2 = scf.if %2744 -> (i64, i64) {
                  scf.yield %2741, %2722#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%2722#1) : (i64) -> ()
                  %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
                  %2746 = arith.addi %2722#2, %__rlasp_stack_elide_zero_298 : i64
                  %2747 = func.call @cc_nil_value() : () -> i64
                  %2748 = func.call @cc_errorp(%2746) : (i64) -> i64
                  %2749 = arith.cmpi ne, %2748, %2747 : i64
                  %2750 = arith.cmpi eq, %2747, %2747 : i64
                  %2751 = arith.andi %2749, %2750 : i1
                  %2752 = scf.if %2751 -> (i64) {
                    scf.yield %2746 : i64
                  } else {
                    scf.yield %2747 : i64
                  }
                  %2753 = arith.cmpi ne, %2752, %2747 : i64
                  scf.if %2753 {
                    func.call @stack_push_pointer(%2752) : (i64) -> ()
                  } else {
                    %2754 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%2754) : (i64) -> ()
                    %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
                    %2755 = arith.addi %2746, %__rlasp_stack_elide_zero_299 : i64
                    %2756 = func.call @stack_pop_pointer() : () -> i64
                    %2757 = func.call @cc_cons(%2755, %2756) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%2757) : (i64) -> ()
                  }
                  %2758 = func.call @stack_pop_pointer() : () -> i64
                  %2759 = func.call @stack_pop_pointer() : () -> i64
                  %2760 = func.call @cc_append(%2759, %2758) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
                  %2761 = arith.addi %2760, %__rlasp_stack_elide_zero_300 : i64
                  %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
                  %2762 = arith.addi %2761, %__rlasp_stack_elide_zero_301 : i64
                  scf.yield %2762, %2761 : i64, i64
                }
                %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
                %2763 = arith.addi %2745#0, %__rlasp_stack_elide_zero_302 : i64
                scf.yield %2763, %2745#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %2764 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2764, %2722#1 : i64, i64
              }
              %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
              %2765 = arith.addi %2740#0, %__rlasp_stack_elide_zero_303 : i64
              scf.yield %2765, %2740#1, %2722#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%2730#0) : (i64) -> ()
            %2766 = func.call @stack_depth() : () -> i64
            %2767 = arith.constant 0 : i64
            %2768 = arith.cmpi sgt, %2766, %2767 : i64
            scf.if %2768 {
              %2769 = func.call @stack_pop_pointer() : () -> i64
            }
            %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
            %2770 = arith.addi %2634, %__rlasp_stack_elide_zero_304 : i64
            %2771 = func.call @cc_cdr(%2770) : (i64) -> i64
            %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
            %2772 = arith.addi %2771, %__rlasp_stack_elide_zero_305 : i64
            func.call @stack_push_pointer(%2772) : (i64) -> ()
            %2773 = func.call @stack_depth() : () -> i64
            %2774 = arith.constant 0 : i64
            %2775 = arith.cmpi sgt, %2773, %2774 : i64
            scf.if %2775 {
              %2776 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2730#2, %2730#1, %2772 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %2777 = func.call @stack_pop_pointer() : () -> i64
          %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
          %2778 = arith.addi %2603#1, %__rlasp_stack_elide_zero_306 : i64
          %2779 = func.call @cc_multiple_value_list(%2778) : (i64) -> i64
          %2780 = llvm.mlir.addressof @str338 : !llvm.ptr
          %2781 = arith.constant 38 : i64
          %2782 = func.call @cc_make_string(%2780, %2781) : (!llvm.ptr, i64) -> i64
          %2783 = func.call @cc_nil_value() : () -> i64
          %2784 = func.call @cc_intern(%2782, %2783) : (i64, i64) -> i64
          %2785 = func.call @cc_nil_value() : () -> i64
          %2786 = func.call @cc_cons(%2784, %2785) : (i64, i64) -> i64
          %2787 = func.call @cc_values_pack(%2786) : (i64) -> i64
          %2788 = func.call @cc_symbol_value(%2784) : (i64) -> i64
          %2789 = llvm.mlir.addressof @str339 : !llvm.ptr
          %2790 = arith.constant 39 : i64
          %2791 = func.call @cc_make_string(%2789, %2790) : (!llvm.ptr, i64) -> i64
          %2792 = func.call @cc_nil_value() : () -> i64
          %2793 = func.call @cc_intern(%2791, %2792) : (i64, i64) -> i64
          %2794 = func.call @cc_nil_value() : () -> i64
          %2795 = func.call @cc_cons(%2793, %2794) : (i64, i64) -> i64
          %2796 = func.call @cc_values_pack(%2795) : (i64) -> i64
          %2797 = func.call @cc_symbol_value(%2793) : (i64) -> i64
          %2798 = llvm.mlir.addressof @str340 : !llvm.ptr
          %2799 = arith.constant 40 : i64
          %2800 = func.call @cc_make_string(%2798, %2799) : (!llvm.ptr, i64) -> i64
          %2801 = func.call @cc_nil_value() : () -> i64
          %2802 = func.call @cc_intern(%2800, %2801) : (i64, i64) -> i64
          %2803 = func.call @cc_nil_value() : () -> i64
          %2804 = func.call @cc_cons(%2802, %2803) : (i64, i64) -> i64
          %2805 = func.call @cc_values_pack(%2804) : (i64) -> i64
          %2806 = func.call @cc_symbol_value(%2802) : (i64) -> i64
          %2807 = func.call @cc_nil_value() : () -> i64
          %2808 = arith.cmpi ne, %2788, %2807 : i64
          %2809 = scf.if %2808 -> (i64) {
            scf.yield %2806 : i64
          } else {
            scf.yield %2779 : i64
          }
          %2810 = func.call @cc_values_pack(%2809) : (i64) -> i64
          %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
          %2811 = arith.addi %2810, %__rlasp_stack_elide_zero_307 : i64
          scf.yield %2811 : i64
        }
        %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
        %2812 = arith.addi %2574, %__rlasp_stack_elide_zero_308 : i64
        scf.yield %2812 : i64
      }
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %2813 = arith.addi %2567, %__rlasp_stack_elide_zero_309 : i64
      scf.yield %2813 : i64
    }
    func.call @stack_push_pointer(%2522) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_120590987952133"() {
    %3883 = func.call @cc_nil_value() : () -> i64
    %3884 = func.call @cc_nil_value() : () -> i64
    %3885 = func.call @cc_errorp(%3883) : (i64) -> i64
    %3886 = arith.cmpi ne, %3885, %3884 : i64
    %3887 = scf.if %3886 -> (i64) {
      scf.yield %3883 : i64
    } else {
      %3888 = llvm.mlir.addressof @str485 : !llvm.ptr
      %3889 = arith.constant 31 : i64
      %3890 = func.call @cc_make_string(%3888, %3889) : (!llvm.ptr, i64) -> i64
      %3891 = llvm.mlir.addressof @str486 : !llvm.ptr
      %3892 = arith.constant 4 : i64
      %3893 = func.call @cc_make_string(%3891, %3892) : (!llvm.ptr, i64) -> i64
      %3894 = func.call @cc_intern(%3890, %3893) : (i64, i64) -> i64
      %3895 = func.call @cc_nil_value() : () -> i64
      %3896 = func.call @cc_cons(%3894, %3895) : (i64, i64) -> i64
      %3897 = func.call @cc_values_pack(%3896) : (i64) -> i64
      func.call @stack_push_pointer(%3894) : (i64) -> ()
      %3898 = llvm.mlir.addressof @str487 : !llvm.ptr
      %3899 = arith.constant 13 : i64
      %3900 = func.call @cc_make_string(%3898, %3899) : (!llvm.ptr, i64) -> i64
      %3901 = llvm.mlir.addressof @str488 : !llvm.ptr
      %3902 = arith.constant 4 : i64
      %3903 = func.call @cc_make_string(%3901, %3902) : (!llvm.ptr, i64) -> i64
      %3904 = func.call @cc_intern(%3900, %3903) : (i64, i64) -> i64
      %3905 = func.call @cc_nil_value() : () -> i64
      %3906 = func.call @cc_cons(%3904, %3905) : (i64, i64) -> i64
      %3907 = func.call @cc_values_pack(%3906) : (i64) -> i64
      func.call @stack_push_pointer(%3904) : (i64) -> ()
      %3908 = llvm.mlir.addressof @str489 : !llvm.ptr
      %3909 = arith.constant 17 : i64
      %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
      %3911 = llvm.mlir.addressof @str490 : !llvm.ptr
      %3912 = arith.constant 4 : i64
      %3913 = func.call @cc_make_string(%3911, %3912) : (!llvm.ptr, i64) -> i64
      %3914 = func.call @cc_intern(%3910, %3913) : (i64, i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_cons(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_values_pack(%3916) : (i64) -> i64
      func.call @stack_push_pointer(%3914) : (i64) -> ()
      %3918 = llvm.mlir.addressof @str491 : !llvm.ptr
      %3919 = arith.constant 19 : i64
      %3920 = func.call @cc_make_string(%3918, %3919) : (!llvm.ptr, i64) -> i64
      %3921 = llvm.mlir.addressof @str492 : !llvm.ptr
      %3922 = arith.constant 4 : i64
      %3923 = func.call @cc_make_string(%3921, %3922) : (!llvm.ptr, i64) -> i64
      %3924 = func.call @cc_intern(%3920, %3923) : (i64, i64) -> i64
      %3925 = func.call @cc_nil_value() : () -> i64
      %3926 = func.call @cc_cons(%3924, %3925) : (i64, i64) -> i64
      %3927 = func.call @cc_values_pack(%3926) : (i64) -> i64
      func.call @stack_push_pointer(%3924) : (i64) -> ()
      %3928 = llvm.mlir.addressof @str493 : !llvm.ptr
      %3929 = arith.constant 22 : i64
      %3930 = func.call @cc_make_string(%3928, %3929) : (!llvm.ptr, i64) -> i64
      %3931 = llvm.mlir.addressof @str494 : !llvm.ptr
      %3932 = arith.constant 4 : i64
      %3933 = func.call @cc_make_string(%3931, %3932) : (!llvm.ptr, i64) -> i64
      %3934 = func.call @cc_intern(%3930, %3933) : (i64, i64) -> i64
      %3935 = func.call @cc_nil_value() : () -> i64
      %3936 = func.call @cc_cons(%3934, %3935) : (i64, i64) -> i64
      %3937 = func.call @cc_values_pack(%3936) : (i64) -> i64
      func.call @stack_push_pointer(%3934) : (i64) -> ()
      %3938 = llvm.mlir.addressof @str495 : !llvm.ptr
      %3939 = arith.constant 29 : i64
      %3940 = func.call @cc_make_string(%3938, %3939) : (!llvm.ptr, i64) -> i64
      %3941 = llvm.mlir.addressof @str496 : !llvm.ptr
      %3942 = arith.constant 4 : i64
      %3943 = func.call @cc_make_string(%3941, %3942) : (!llvm.ptr, i64) -> i64
      %3944 = func.call @cc_intern(%3940, %3943) : (i64, i64) -> i64
      %3945 = func.call @cc_nil_value() : () -> i64
      %3946 = func.call @cc_cons(%3944, %3945) : (i64, i64) -> i64
      %3947 = func.call @cc_values_pack(%3946) : (i64) -> i64
      func.call @stack_push_pointer(%3944) : (i64) -> ()
      %3948 = llvm.mlir.addressof @str497 : !llvm.ptr
      %3949 = arith.constant 18 : i64
      %3950 = func.call @cc_make_string(%3948, %3949) : (!llvm.ptr, i64) -> i64
      %3951 = llvm.mlir.addressof @str498 : !llvm.ptr
      %3952 = arith.constant 4 : i64
      %3953 = func.call @cc_make_string(%3951, %3952) : (!llvm.ptr, i64) -> i64
      %3954 = func.call @cc_intern(%3950, %3953) : (i64, i64) -> i64
      %3955 = func.call @cc_nil_value() : () -> i64
      %3956 = func.call @cc_cons(%3954, %3955) : (i64, i64) -> i64
      %3957 = func.call @cc_values_pack(%3956) : (i64) -> i64
      func.call @stack_push_pointer(%3954) : (i64) -> ()
      %3958 = llvm.mlir.addressof @str499 : !llvm.ptr
      %3959 = arith.constant 23 : i64
      %3960 = func.call @cc_make_string(%3958, %3959) : (!llvm.ptr, i64) -> i64
      %3961 = llvm.mlir.addressof @str500 : !llvm.ptr
      %3962 = arith.constant 4 : i64
      %3963 = func.call @cc_make_string(%3961, %3962) : (!llvm.ptr, i64) -> i64
      %3964 = func.call @cc_intern(%3960, %3963) : (i64, i64) -> i64
      %3965 = func.call @cc_nil_value() : () -> i64
      %3966 = func.call @cc_cons(%3964, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_values_pack(%3966) : (i64) -> i64
      func.call @stack_push_pointer(%3964) : (i64) -> ()
      %3968 = llvm.mlir.addressof @str501 : !llvm.ptr
      %3969 = arith.constant 25 : i64
      %3970 = func.call @cc_make_string(%3968, %3969) : (!llvm.ptr, i64) -> i64
      %3971 = llvm.mlir.addressof @str502 : !llvm.ptr
      %3972 = arith.constant 4 : i64
      %3973 = func.call @cc_make_string(%3971, %3972) : (!llvm.ptr, i64) -> i64
      %3974 = func.call @cc_intern(%3970, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_nil_value() : () -> i64
      %3976 = func.call @cc_cons(%3974, %3975) : (i64, i64) -> i64
      %3977 = func.call @cc_values_pack(%3976) : (i64) -> i64
      func.call @stack_push_pointer(%3974) : (i64) -> ()
      %3978 = llvm.mlir.addressof @str503 : !llvm.ptr
      %3979 = arith.constant 17 : i64
      %3980 = func.call @cc_make_string(%3978, %3979) : (!llvm.ptr, i64) -> i64
      %3981 = llvm.mlir.addressof @str504 : !llvm.ptr
      %3982 = arith.constant 4 : i64
      %3983 = func.call @cc_make_string(%3981, %3982) : (!llvm.ptr, i64) -> i64
      %3984 = func.call @cc_intern(%3980, %3983) : (i64, i64) -> i64
      %3985 = func.call @cc_nil_value() : () -> i64
      %3986 = func.call @cc_cons(%3984, %3985) : (i64, i64) -> i64
      %3987 = func.call @cc_values_pack(%3986) : (i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      %3988 = llvm.mlir.addressof @str505 : !llvm.ptr
      %3989 = arith.constant 21 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = llvm.mlir.addressof @str506 : !llvm.ptr
      %3992 = arith.constant 4 : i64
      %3993 = func.call @cc_make_string(%3991, %3992) : (!llvm.ptr, i64) -> i64
      %3994 = func.call @cc_intern(%3990, %3993) : (i64, i64) -> i64
      %3995 = func.call @cc_nil_value() : () -> i64
      %3996 = func.call @cc_cons(%3994, %3995) : (i64, i64) -> i64
      %3997 = func.call @cc_values_pack(%3996) : (i64) -> i64
      func.call @stack_push_pointer(%3994) : (i64) -> ()
      %3998 = llvm.mlir.addressof @str507 : !llvm.ptr
      %3999 = arith.constant 15 : i64
      %4000 = func.call @cc_make_string(%3998, %3999) : (!llvm.ptr, i64) -> i64
      %4001 = llvm.mlir.addressof @str508 : !llvm.ptr
      %4002 = arith.constant 4 : i64
      %4003 = func.call @cc_make_string(%4001, %4002) : (!llvm.ptr, i64) -> i64
      %4004 = func.call @cc_intern(%4000, %4003) : (i64, i64) -> i64
      %4005 = func.call @cc_nil_value() : () -> i64
      %4006 = func.call @cc_cons(%4004, %4005) : (i64, i64) -> i64
      %4007 = func.call @cc_values_pack(%4006) : (i64) -> i64
      func.call @stack_push_pointer(%4004) : (i64) -> ()
      %4008 = llvm.mlir.addressof @str509 : !llvm.ptr
      %4009 = arith.constant 11 : i64
      %4010 = func.call @cc_make_string(%4008, %4009) : (!llvm.ptr, i64) -> i64
      %4011 = llvm.mlir.addressof @str510 : !llvm.ptr
      %4012 = arith.constant 4 : i64
      %4013 = func.call @cc_make_string(%4011, %4012) : (!llvm.ptr, i64) -> i64
      %4014 = func.call @cc_intern(%4010, %4013) : (i64, i64) -> i64
      %4015 = func.call @cc_nil_value() : () -> i64
      %4016 = func.call @cc_cons(%4014, %4015) : (i64, i64) -> i64
      %4017 = func.call @cc_values_pack(%4016) : (i64) -> i64
      func.call @stack_push_pointer(%4014) : (i64) -> ()
      %4018 = llvm.mlir.addressof @str511 : !llvm.ptr
      %4019 = arith.constant 40 : i64
      %4020 = func.call @cc_make_string(%4018, %4019) : (!llvm.ptr, i64) -> i64
      %4021 = llvm.mlir.addressof @str512 : !llvm.ptr
      %4022 = arith.constant 4 : i64
      %4023 = func.call @cc_make_string(%4021, %4022) : (!llvm.ptr, i64) -> i64
      %4024 = func.call @cc_intern(%4020, %4023) : (i64, i64) -> i64
      %4025 = func.call @cc_nil_value() : () -> i64
      %4026 = func.call @cc_cons(%4024, %4025) : (i64, i64) -> i64
      %4027 = func.call @cc_values_pack(%4026) : (i64) -> i64
      func.call @stack_push_pointer(%4024) : (i64) -> ()
      %4028 = llvm.mlir.addressof @str513 : !llvm.ptr
      %4029 = arith.constant 29 : i64
      %4030 = func.call @cc_make_string(%4028, %4029) : (!llvm.ptr, i64) -> i64
      %4031 = llvm.mlir.addressof @str514 : !llvm.ptr
      %4032 = arith.constant 4 : i64
      %4033 = func.call @cc_make_string(%4031, %4032) : (!llvm.ptr, i64) -> i64
      %4034 = func.call @cc_intern(%4030, %4033) : (i64, i64) -> i64
      %4035 = func.call @cc_nil_value() : () -> i64
      %4036 = func.call @cc_cons(%4034, %4035) : (i64, i64) -> i64
      %4037 = func.call @cc_values_pack(%4036) : (i64) -> i64
      func.call @stack_push_pointer(%4034) : (i64) -> ()
      %4038 = llvm.mlir.addressof @str515 : !llvm.ptr
      %4039 = arith.constant 31 : i64
      %4040 = func.call @cc_make_string(%4038, %4039) : (!llvm.ptr, i64) -> i64
      %4041 = llvm.mlir.addressof @str516 : !llvm.ptr
      %4042 = arith.constant 4 : i64
      %4043 = func.call @cc_make_string(%4041, %4042) : (!llvm.ptr, i64) -> i64
      %4044 = func.call @cc_intern(%4040, %4043) : (i64, i64) -> i64
      %4045 = func.call @cc_nil_value() : () -> i64
      %4046 = func.call @cc_cons(%4044, %4045) : (i64, i64) -> i64
      %4047 = func.call @cc_values_pack(%4046) : (i64) -> i64
      func.call @stack_push_pointer(%4044) : (i64) -> ()
      %4048 = llvm.mlir.addressof @str517 : !llvm.ptr
      %4049 = arith.constant 24 : i64
      %4050 = func.call @cc_make_string(%4048, %4049) : (!llvm.ptr, i64) -> i64
      %4051 = llvm.mlir.addressof @str518 : !llvm.ptr
      %4052 = arith.constant 4 : i64
      %4053 = func.call @cc_make_string(%4051, %4052) : (!llvm.ptr, i64) -> i64
      %4054 = func.call @cc_intern(%4050, %4053) : (i64, i64) -> i64
      %4055 = func.call @cc_nil_value() : () -> i64
      %4056 = func.call @cc_cons(%4054, %4055) : (i64, i64) -> i64
      %4057 = func.call @cc_values_pack(%4056) : (i64) -> i64
      func.call @stack_push_pointer(%4054) : (i64) -> ()
      %4058 = llvm.mlir.addressof @str519 : !llvm.ptr
      %4059 = arith.constant 33 : i64
      %4060 = func.call @cc_make_string(%4058, %4059) : (!llvm.ptr, i64) -> i64
      %4061 = llvm.mlir.addressof @str520 : !llvm.ptr
      %4062 = arith.constant 4 : i64
      %4063 = func.call @cc_make_string(%4061, %4062) : (!llvm.ptr, i64) -> i64
      %4064 = func.call @cc_intern(%4060, %4063) : (i64, i64) -> i64
      %4065 = func.call @cc_nil_value() : () -> i64
      %4066 = func.call @cc_cons(%4064, %4065) : (i64, i64) -> i64
      %4067 = func.call @cc_values_pack(%4066) : (i64) -> i64
      func.call @stack_push_pointer(%4064) : (i64) -> ()
      %4068 = llvm.mlir.addressof @str521 : !llvm.ptr
      %4069 = arith.constant 13 : i64
      %4070 = func.call @cc_make_string(%4068, %4069) : (!llvm.ptr, i64) -> i64
      %4071 = llvm.mlir.addressof @str522 : !llvm.ptr
      %4072 = arith.constant 4 : i64
      %4073 = func.call @cc_make_string(%4071, %4072) : (!llvm.ptr, i64) -> i64
      %4074 = func.call @cc_intern(%4070, %4073) : (i64, i64) -> i64
      %4075 = func.call @cc_nil_value() : () -> i64
      %4076 = func.call @cc_cons(%4074, %4075) : (i64, i64) -> i64
      %4077 = func.call @cc_values_pack(%4076) : (i64) -> i64
      func.call @stack_push_pointer(%4074) : (i64) -> ()
      %4078 = llvm.mlir.addressof @str523 : !llvm.ptr
      %4079 = arith.constant 28 : i64
      %4080 = func.call @cc_make_string(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = llvm.mlir.addressof @str524 : !llvm.ptr
      %4082 = arith.constant 4 : i64
      %4083 = func.call @cc_make_string(%4081, %4082) : (!llvm.ptr, i64) -> i64
      %4084 = func.call @cc_intern(%4080, %4083) : (i64, i64) -> i64
      %4085 = func.call @cc_nil_value() : () -> i64
      %4086 = func.call @cc_cons(%4084, %4085) : (i64, i64) -> i64
      %4087 = func.call @cc_values_pack(%4086) : (i64) -> i64
      func.call @stack_push_pointer(%4084) : (i64) -> ()
      %4088 = llvm.mlir.addressof @str525 : !llvm.ptr
      %4089 = arith.constant 31 : i64
      %4090 = func.call @cc_make_string(%4088, %4089) : (!llvm.ptr, i64) -> i64
      %4091 = llvm.mlir.addressof @str526 : !llvm.ptr
      %4092 = arith.constant 4 : i64
      %4093 = func.call @cc_make_string(%4091, %4092) : (!llvm.ptr, i64) -> i64
      %4094 = func.call @cc_intern(%4090, %4093) : (i64, i64) -> i64
      %4095 = func.call @cc_nil_value() : () -> i64
      %4096 = func.call @cc_cons(%4094, %4095) : (i64, i64) -> i64
      %4097 = func.call @cc_values_pack(%4096) : (i64) -> i64
      func.call @stack_push_pointer(%4094) : (i64) -> ()
      %4098 = llvm.mlir.addressof @str527 : !llvm.ptr
      %4099 = arith.constant 24 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = llvm.mlir.addressof @str528 : !llvm.ptr
      %4102 = arith.constant 4 : i64
      %4103 = func.call @cc_make_string(%4101, %4102) : (!llvm.ptr, i64) -> i64
      %4104 = func.call @cc_intern(%4100, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_cons(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_values_pack(%4106) : (i64) -> i64
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4108 = llvm.mlir.addressof @str529 : !llvm.ptr
      %4109 = arith.constant 35 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = llvm.mlir.addressof @str530 : !llvm.ptr
      %4112 = arith.constant 4 : i64
      %4113 = func.call @cc_make_string(%4111, %4112) : (!llvm.ptr, i64) -> i64
      %4114 = func.call @cc_intern(%4110, %4113) : (i64, i64) -> i64
      %4115 = func.call @cc_nil_value() : () -> i64
      %4116 = func.call @cc_cons(%4114, %4115) : (i64, i64) -> i64
      %4117 = func.call @cc_values_pack(%4116) : (i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4118 = llvm.mlir.addressof @str531 : !llvm.ptr
      %4119 = arith.constant 20 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = llvm.mlir.addressof @str532 : !llvm.ptr
      %4122 = arith.constant 4 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_intern(%4120, %4123) : (i64, i64) -> i64
      %4125 = func.call @cc_nil_value() : () -> i64
      %4126 = func.call @cc_cons(%4124, %4125) : (i64, i64) -> i64
      %4127 = func.call @cc_values_pack(%4126) : (i64) -> i64
      func.call @stack_push_pointer(%4124) : (i64) -> ()
      %4128 = llvm.mlir.addressof @str533 : !llvm.ptr
      %4129 = arith.constant 23 : i64
      %4130 = func.call @cc_make_string(%4128, %4129) : (!llvm.ptr, i64) -> i64
      %4131 = llvm.mlir.addressof @str534 : !llvm.ptr
      %4132 = arith.constant 4 : i64
      %4133 = func.call @cc_make_string(%4131, %4132) : (!llvm.ptr, i64) -> i64
      %4134 = func.call @cc_intern(%4130, %4133) : (i64, i64) -> i64
      %4135 = func.call @cc_nil_value() : () -> i64
      %4136 = func.call @cc_cons(%4134, %4135) : (i64, i64) -> i64
      %4137 = func.call @cc_values_pack(%4136) : (i64) -> i64
      func.call @stack_push_pointer(%4134) : (i64) -> ()
      %4138 = llvm.mlir.addressof @str535 : !llvm.ptr
      %4139 = arith.constant 42 : i64
      %4140 = func.call @cc_make_string(%4138, %4139) : (!llvm.ptr, i64) -> i64
      %4141 = llvm.mlir.addressof @str536 : !llvm.ptr
      %4142 = arith.constant 4 : i64
      %4143 = func.call @cc_make_string(%4141, %4142) : (!llvm.ptr, i64) -> i64
      %4144 = func.call @cc_intern(%4140, %4143) : (i64, i64) -> i64
      %4145 = func.call @cc_nil_value() : () -> i64
      %4146 = func.call @cc_cons(%4144, %4145) : (i64, i64) -> i64
      %4147 = func.call @cc_values_pack(%4146) : (i64) -> i64
      func.call @stack_push_pointer(%4144) : (i64) -> ()
      %4148 = llvm.mlir.addressof @str537 : !llvm.ptr
      %4149 = arith.constant 28 : i64
      %4150 = func.call @cc_make_string(%4148, %4149) : (!llvm.ptr, i64) -> i64
      %4151 = llvm.mlir.addressof @str538 : !llvm.ptr
      %4152 = arith.constant 4 : i64
      %4153 = func.call @cc_make_string(%4151, %4152) : (!llvm.ptr, i64) -> i64
      %4154 = func.call @cc_intern(%4150, %4153) : (i64, i64) -> i64
      %4155 = func.call @cc_nil_value() : () -> i64
      %4156 = func.call @cc_cons(%4154, %4155) : (i64, i64) -> i64
      %4157 = func.call @cc_values_pack(%4156) : (i64) -> i64
      func.call @stack_push_pointer(%4154) : (i64) -> ()
      %4158 = llvm.mlir.addressof @str539 : !llvm.ptr
      %4159 = arith.constant 29 : i64
      %4160 = func.call @cc_make_string(%4158, %4159) : (!llvm.ptr, i64) -> i64
      %4161 = llvm.mlir.addressof @str540 : !llvm.ptr
      %4162 = arith.constant 4 : i64
      %4163 = func.call @cc_make_string(%4161, %4162) : (!llvm.ptr, i64) -> i64
      %4164 = func.call @cc_intern(%4160, %4163) : (i64, i64) -> i64
      %4165 = func.call @cc_nil_value() : () -> i64
      %4166 = func.call @cc_cons(%4164, %4165) : (i64, i64) -> i64
      %4167 = func.call @cc_values_pack(%4166) : (i64) -> i64
      func.call @stack_push_pointer(%4164) : (i64) -> ()
      %4168 = llvm.mlir.addressof @str541 : !llvm.ptr
      %4169 = arith.constant 35 : i64
      %4170 = func.call @cc_make_string(%4168, %4169) : (!llvm.ptr, i64) -> i64
      %4171 = llvm.mlir.addressof @str542 : !llvm.ptr
      %4172 = arith.constant 4 : i64
      %4173 = func.call @cc_make_string(%4171, %4172) : (!llvm.ptr, i64) -> i64
      %4174 = func.call @cc_intern(%4170, %4173) : (i64, i64) -> i64
      %4175 = func.call @cc_nil_value() : () -> i64
      %4176 = func.call @cc_cons(%4174, %4175) : (i64, i64) -> i64
      %4177 = func.call @cc_values_pack(%4176) : (i64) -> i64
      func.call @stack_push_pointer(%4174) : (i64) -> ()
      %4178 = llvm.mlir.addressof @str543 : !llvm.ptr
      %4179 = arith.constant 24 : i64
      %4180 = func.call @cc_make_string(%4178, %4179) : (!llvm.ptr, i64) -> i64
      %4181 = llvm.mlir.addressof @str544 : !llvm.ptr
      %4182 = arith.constant 4 : i64
      %4183 = func.call @cc_make_string(%4181, %4182) : (!llvm.ptr, i64) -> i64
      %4184 = func.call @cc_intern(%4180, %4183) : (i64, i64) -> i64
      %4185 = func.call @cc_nil_value() : () -> i64
      %4186 = func.call @cc_cons(%4184, %4185) : (i64, i64) -> i64
      %4187 = func.call @cc_values_pack(%4186) : (i64) -> i64
      func.call @stack_push_pointer(%4184) : (i64) -> ()
      %4188 = llvm.mlir.addressof @str545 : !llvm.ptr
      %4189 = arith.constant 18 : i64
      %4190 = func.call @cc_make_string(%4188, %4189) : (!llvm.ptr, i64) -> i64
      %4191 = llvm.mlir.addressof @str546 : !llvm.ptr
      %4192 = arith.constant 4 : i64
      %4193 = func.call @cc_make_string(%4191, %4192) : (!llvm.ptr, i64) -> i64
      %4194 = func.call @cc_intern(%4190, %4193) : (i64, i64) -> i64
      %4195 = func.call @cc_nil_value() : () -> i64
      %4196 = func.call @cc_cons(%4194, %4195) : (i64, i64) -> i64
      %4197 = func.call @cc_values_pack(%4196) : (i64) -> i64
      func.call @stack_push_pointer(%4194) : (i64) -> ()
      %4198 = llvm.mlir.addressof @str547 : !llvm.ptr
      %4199 = arith.constant 14 : i64
      %4200 = func.call @cc_make_string(%4198, %4199) : (!llvm.ptr, i64) -> i64
      %4201 = llvm.mlir.addressof @str548 : !llvm.ptr
      %4202 = arith.constant 4 : i64
      %4203 = func.call @cc_make_string(%4201, %4202) : (!llvm.ptr, i64) -> i64
      %4204 = func.call @cc_intern(%4200, %4203) : (i64, i64) -> i64
      %4205 = func.call @cc_nil_value() : () -> i64
      %4206 = func.call @cc_cons(%4204, %4205) : (i64, i64) -> i64
      %4207 = func.call @cc_values_pack(%4206) : (i64) -> i64
      func.call @stack_push_pointer(%4204) : (i64) -> ()
      %4208 = llvm.mlir.addressof @str549 : !llvm.ptr
      %4209 = arith.constant 15 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = llvm.mlir.addressof @str550 : !llvm.ptr
      %4212 = arith.constant 4 : i64
      %4213 = func.call @cc_make_string(%4211, %4212) : (!llvm.ptr, i64) -> i64
      %4214 = func.call @cc_intern(%4210, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_nil_value() : () -> i64
      %4216 = func.call @cc_cons(%4214, %4215) : (i64, i64) -> i64
      %4217 = func.call @cc_values_pack(%4216) : (i64) -> i64
      func.call @stack_push_pointer(%4214) : (i64) -> ()
      %4218 = llvm.mlir.addressof @str551 : !llvm.ptr
      %4219 = arith.constant 23 : i64
      %4220 = func.call @cc_make_string(%4218, %4219) : (!llvm.ptr, i64) -> i64
      %4221 = llvm.mlir.addressof @str552 : !llvm.ptr
      %4222 = arith.constant 4 : i64
      %4223 = func.call @cc_make_string(%4221, %4222) : (!llvm.ptr, i64) -> i64
      %4224 = func.call @cc_intern(%4220, %4223) : (i64, i64) -> i64
      %4225 = func.call @cc_nil_value() : () -> i64
      %4226 = func.call @cc_cons(%4224, %4225) : (i64, i64) -> i64
      %4227 = func.call @cc_values_pack(%4226) : (i64) -> i64
      func.call @stack_push_pointer(%4224) : (i64) -> ()
      %4228 = llvm.mlir.addressof @str553 : !llvm.ptr
      %4229 = arith.constant 18 : i64
      %4230 = func.call @cc_make_string(%4228, %4229) : (!llvm.ptr, i64) -> i64
      %4231 = llvm.mlir.addressof @str554 : !llvm.ptr
      %4232 = arith.constant 4 : i64
      %4233 = func.call @cc_make_string(%4231, %4232) : (!llvm.ptr, i64) -> i64
      %4234 = func.call @cc_intern(%4230, %4233) : (i64, i64) -> i64
      %4235 = func.call @cc_nil_value() : () -> i64
      %4236 = func.call @cc_cons(%4234, %4235) : (i64, i64) -> i64
      %4237 = func.call @cc_values_pack(%4236) : (i64) -> i64
      func.call @stack_push_pointer(%4234) : (i64) -> ()
      %4238 = llvm.mlir.addressof @str555 : !llvm.ptr
      %4239 = arith.constant 19 : i64
      %4240 = func.call @cc_make_string(%4238, %4239) : (!llvm.ptr, i64) -> i64
      %4241 = llvm.mlir.addressof @str556 : !llvm.ptr
      %4242 = arith.constant 4 : i64
      %4243 = func.call @cc_make_string(%4241, %4242) : (!llvm.ptr, i64) -> i64
      %4244 = func.call @cc_intern(%4240, %4243) : (i64, i64) -> i64
      %4245 = func.call @cc_nil_value() : () -> i64
      %4246 = func.call @cc_cons(%4244, %4245) : (i64, i64) -> i64
      %4247 = func.call @cc_values_pack(%4246) : (i64) -> i64
      func.call @stack_push_pointer(%4244) : (i64) -> ()
      %4248 = llvm.mlir.addressof @str557 : !llvm.ptr
      %4249 = arith.constant 17 : i64
      %4250 = func.call @cc_make_string(%4248, %4249) : (!llvm.ptr, i64) -> i64
      %4251 = llvm.mlir.addressof @str558 : !llvm.ptr
      %4252 = arith.constant 4 : i64
      %4253 = func.call @cc_make_string(%4251, %4252) : (!llvm.ptr, i64) -> i64
      %4254 = func.call @cc_intern(%4250, %4253) : (i64, i64) -> i64
      %4255 = func.call @cc_nil_value() : () -> i64
      %4256 = func.call @cc_cons(%4254, %4255) : (i64, i64) -> i64
      %4257 = func.call @cc_values_pack(%4256) : (i64) -> i64
      func.call @stack_push_pointer(%4254) : (i64) -> ()
      %4258 = llvm.mlir.addressof @str559 : !llvm.ptr
      %4259 = arith.constant 26 : i64
      %4260 = func.call @cc_make_string(%4258, %4259) : (!llvm.ptr, i64) -> i64
      %4261 = llvm.mlir.addressof @str560 : !llvm.ptr
      %4262 = arith.constant 4 : i64
      %4263 = func.call @cc_make_string(%4261, %4262) : (!llvm.ptr, i64) -> i64
      %4264 = func.call @cc_intern(%4260, %4263) : (i64, i64) -> i64
      %4265 = func.call @cc_nil_value() : () -> i64
      %4266 = func.call @cc_cons(%4264, %4265) : (i64, i64) -> i64
      %4267 = func.call @cc_values_pack(%4266) : (i64) -> i64
      func.call @stack_push_pointer(%4264) : (i64) -> ()
      %4268 = llvm.mlir.addressof @str561 : !llvm.ptr
      %4269 = arith.constant 28 : i64
      %4270 = func.call @cc_make_string(%4268, %4269) : (!llvm.ptr, i64) -> i64
      %4271 = llvm.mlir.addressof @str562 : !llvm.ptr
      %4272 = arith.constant 4 : i64
      %4273 = func.call @cc_make_string(%4271, %4272) : (!llvm.ptr, i64) -> i64
      %4274 = func.call @cc_intern(%4270, %4273) : (i64, i64) -> i64
      %4275 = func.call @cc_nil_value() : () -> i64
      %4276 = func.call @cc_cons(%4274, %4275) : (i64, i64) -> i64
      %4277 = func.call @cc_values_pack(%4276) : (i64) -> i64
      func.call @stack_push_pointer(%4274) : (i64) -> ()
      %4278 = llvm.mlir.addressof @str563 : !llvm.ptr
      %4279 = arith.constant 24 : i64
      %4280 = func.call @cc_make_string(%4278, %4279) : (!llvm.ptr, i64) -> i64
      %4281 = llvm.mlir.addressof @str564 : !llvm.ptr
      %4282 = arith.constant 4 : i64
      %4283 = func.call @cc_make_string(%4281, %4282) : (!llvm.ptr, i64) -> i64
      %4284 = func.call @cc_intern(%4280, %4283) : (i64, i64) -> i64
      %4285 = func.call @cc_nil_value() : () -> i64
      %4286 = func.call @cc_cons(%4284, %4285) : (i64, i64) -> i64
      %4287 = func.call @cc_values_pack(%4286) : (i64) -> i64
      func.call @stack_push_pointer(%4284) : (i64) -> ()
      %4288 = llvm.mlir.addressof @str565 : !llvm.ptr
      %4289 = arith.constant 20 : i64
      %4290 = func.call @cc_make_string(%4288, %4289) : (!llvm.ptr, i64) -> i64
      %4291 = llvm.mlir.addressof @str566 : !llvm.ptr
      %4292 = arith.constant 4 : i64
      %4293 = func.call @cc_make_string(%4291, %4292) : (!llvm.ptr, i64) -> i64
      %4294 = func.call @cc_intern(%4290, %4293) : (i64, i64) -> i64
      %4295 = func.call @cc_nil_value() : () -> i64
      %4296 = func.call @cc_cons(%4294, %4295) : (i64, i64) -> i64
      %4297 = func.call @cc_values_pack(%4296) : (i64) -> i64
      func.call @stack_push_pointer(%4294) : (i64) -> ()
      %4298 = llvm.mlir.addressof @str567 : !llvm.ptr
      %4299 = arith.constant 20 : i64
      %4300 = func.call @cc_make_string(%4298, %4299) : (!llvm.ptr, i64) -> i64
      %4301 = llvm.mlir.addressof @str568 : !llvm.ptr
      %4302 = arith.constant 4 : i64
      %4303 = func.call @cc_make_string(%4301, %4302) : (!llvm.ptr, i64) -> i64
      %4304 = func.call @cc_intern(%4300, %4303) : (i64, i64) -> i64
      %4305 = func.call @cc_nil_value() : () -> i64
      %4306 = func.call @cc_cons(%4304, %4305) : (i64, i64) -> i64
      %4307 = func.call @cc_values_pack(%4306) : (i64) -> i64
      func.call @stack_push_pointer(%4304) : (i64) -> ()
      %4308 = llvm.mlir.addressof @str569 : !llvm.ptr
      %4309 = arith.constant 23 : i64
      %4310 = func.call @cc_make_string(%4308, %4309) : (!llvm.ptr, i64) -> i64
      %4311 = llvm.mlir.addressof @str570 : !llvm.ptr
      %4312 = arith.constant 4 : i64
      %4313 = func.call @cc_make_string(%4311, %4312) : (!llvm.ptr, i64) -> i64
      %4314 = func.call @cc_intern(%4310, %4313) : (i64, i64) -> i64
      %4315 = func.call @cc_nil_value() : () -> i64
      %4316 = func.call @cc_cons(%4314, %4315) : (i64, i64) -> i64
      %4317 = func.call @cc_values_pack(%4316) : (i64) -> i64
      func.call @stack_push_pointer(%4314) : (i64) -> ()
      %4318 = llvm.mlir.addressof @str571 : !llvm.ptr
      %4319 = arith.constant 23 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = llvm.mlir.addressof @str572 : !llvm.ptr
      %4322 = arith.constant 4 : i64
      %4323 = func.call @cc_make_string(%4321, %4322) : (!llvm.ptr, i64) -> i64
      %4324 = func.call @cc_intern(%4320, %4323) : (i64, i64) -> i64
      %4325 = func.call @cc_nil_value() : () -> i64
      %4326 = func.call @cc_cons(%4324, %4325) : (i64, i64) -> i64
      %4327 = func.call @cc_values_pack(%4326) : (i64) -> i64
      func.call @stack_push_pointer(%4324) : (i64) -> ()
      %4328 = llvm.mlir.addressof @str573 : !llvm.ptr
      %4329 = arith.constant 24 : i64
      %4330 = func.call @cc_make_string(%4328, %4329) : (!llvm.ptr, i64) -> i64
      %4331 = llvm.mlir.addressof @str574 : !llvm.ptr
      %4332 = arith.constant 4 : i64
      %4333 = func.call @cc_make_string(%4331, %4332) : (!llvm.ptr, i64) -> i64
      %4334 = func.call @cc_intern(%4330, %4333) : (i64, i64) -> i64
      %4335 = func.call @cc_nil_value() : () -> i64
      %4336 = func.call @cc_cons(%4334, %4335) : (i64, i64) -> i64
      %4337 = func.call @cc_values_pack(%4336) : (i64) -> i64
      func.call @stack_push_pointer(%4334) : (i64) -> ()
      %4338 = llvm.mlir.addressof @str575 : !llvm.ptr
      %4339 = arith.constant 19 : i64
      %4340 = func.call @cc_make_string(%4338, %4339) : (!llvm.ptr, i64) -> i64
      %4341 = llvm.mlir.addressof @str576 : !llvm.ptr
      %4342 = arith.constant 4 : i64
      %4343 = func.call @cc_make_string(%4341, %4342) : (!llvm.ptr, i64) -> i64
      %4344 = func.call @cc_intern(%4340, %4343) : (i64, i64) -> i64
      %4345 = func.call @cc_nil_value() : () -> i64
      %4346 = func.call @cc_cons(%4344, %4345) : (i64, i64) -> i64
      %4347 = func.call @cc_values_pack(%4346) : (i64) -> i64
      func.call @stack_push_pointer(%4344) : (i64) -> ()
      %4348 = llvm.mlir.addressof @str577 : !llvm.ptr
      %4349 = arith.constant 16 : i64
      %4350 = func.call @cc_make_string(%4348, %4349) : (!llvm.ptr, i64) -> i64
      %4351 = llvm.mlir.addressof @str578 : !llvm.ptr
      %4352 = arith.constant 4 : i64
      %4353 = func.call @cc_make_string(%4351, %4352) : (!llvm.ptr, i64) -> i64
      %4354 = func.call @cc_intern(%4350, %4353) : (i64, i64) -> i64
      %4355 = func.call @cc_nil_value() : () -> i64
      %4356 = func.call @cc_cons(%4354, %4355) : (i64, i64) -> i64
      %4357 = func.call @cc_values_pack(%4356) : (i64) -> i64
      func.call @stack_push_pointer(%4354) : (i64) -> ()
      %4358 = llvm.mlir.addressof @str579 : !llvm.ptr
      %4359 = arith.constant 20 : i64
      %4360 = func.call @cc_make_string(%4358, %4359) : (!llvm.ptr, i64) -> i64
      %4361 = llvm.mlir.addressof @str580 : !llvm.ptr
      %4362 = arith.constant 4 : i64
      %4363 = func.call @cc_make_string(%4361, %4362) : (!llvm.ptr, i64) -> i64
      %4364 = func.call @cc_intern(%4360, %4363) : (i64, i64) -> i64
      %4365 = func.call @cc_nil_value() : () -> i64
      %4366 = func.call @cc_cons(%4364, %4365) : (i64, i64) -> i64
      %4367 = func.call @cc_values_pack(%4366) : (i64) -> i64
      func.call @stack_push_pointer(%4364) : (i64) -> ()
      %4368 = llvm.mlir.addressof @str581 : !llvm.ptr
      %4369 = arith.constant 22 : i64
      %4370 = func.call @cc_make_string(%4368, %4369) : (!llvm.ptr, i64) -> i64
      %4371 = llvm.mlir.addressof @str582 : !llvm.ptr
      %4372 = arith.constant 4 : i64
      %4373 = func.call @cc_make_string(%4371, %4372) : (!llvm.ptr, i64) -> i64
      %4374 = func.call @cc_intern(%4370, %4373) : (i64, i64) -> i64
      %4375 = func.call @cc_nil_value() : () -> i64
      %4376 = func.call @cc_cons(%4374, %4375) : (i64, i64) -> i64
      %4377 = func.call @cc_values_pack(%4376) : (i64) -> i64
      func.call @stack_push_pointer(%4374) : (i64) -> ()
      %4378 = llvm.mlir.addressof @str583 : !llvm.ptr
      %4379 = arith.constant 23 : i64
      %4380 = func.call @cc_make_string(%4378, %4379) : (!llvm.ptr, i64) -> i64
      %4381 = llvm.mlir.addressof @str584 : !llvm.ptr
      %4382 = arith.constant 4 : i64
      %4383 = func.call @cc_make_string(%4381, %4382) : (!llvm.ptr, i64) -> i64
      %4384 = func.call @cc_intern(%4380, %4383) : (i64, i64) -> i64
      %4385 = func.call @cc_nil_value() : () -> i64
      %4386 = func.call @cc_cons(%4384, %4385) : (i64, i64) -> i64
      %4387 = func.call @cc_values_pack(%4386) : (i64) -> i64
      func.call @stack_push_pointer(%4384) : (i64) -> ()
      %4388 = llvm.mlir.addressof @str585 : !llvm.ptr
      %4389 = arith.constant 27 : i64
      %4390 = func.call @cc_make_string(%4388, %4389) : (!llvm.ptr, i64) -> i64
      %4391 = llvm.mlir.addressof @str586 : !llvm.ptr
      %4392 = arith.constant 4 : i64
      %4393 = func.call @cc_make_string(%4391, %4392) : (!llvm.ptr, i64) -> i64
      %4394 = func.call @cc_intern(%4390, %4393) : (i64, i64) -> i64
      %4395 = func.call @cc_nil_value() : () -> i64
      %4396 = func.call @cc_cons(%4394, %4395) : (i64, i64) -> i64
      %4397 = func.call @cc_values_pack(%4396) : (i64) -> i64
      func.call @stack_push_pointer(%4394) : (i64) -> ()
      %4398 = llvm.mlir.addressof @str587 : !llvm.ptr
      %4399 = arith.constant 36 : i64
      %4400 = func.call @cc_make_string(%4398, %4399) : (!llvm.ptr, i64) -> i64
      %4401 = llvm.mlir.addressof @str588 : !llvm.ptr
      %4402 = arith.constant 4 : i64
      %4403 = func.call @cc_make_string(%4401, %4402) : (!llvm.ptr, i64) -> i64
      %4404 = func.call @cc_intern(%4400, %4403) : (i64, i64) -> i64
      %4405 = func.call @cc_nil_value() : () -> i64
      %4406 = func.call @cc_cons(%4404, %4405) : (i64, i64) -> i64
      %4407 = func.call @cc_values_pack(%4406) : (i64) -> i64
      func.call @stack_push_pointer(%4404) : (i64) -> ()
      %4408 = llvm.mlir.addressof @str589 : !llvm.ptr
      %4409 = arith.constant 26 : i64
      %4410 = func.call @cc_make_string(%4408, %4409) : (!llvm.ptr, i64) -> i64
      %4411 = llvm.mlir.addressof @str590 : !llvm.ptr
      %4412 = arith.constant 4 : i64
      %4413 = func.call @cc_make_string(%4411, %4412) : (!llvm.ptr, i64) -> i64
      %4414 = func.call @cc_intern(%4410, %4413) : (i64, i64) -> i64
      %4415 = func.call @cc_nil_value() : () -> i64
      %4416 = func.call @cc_cons(%4414, %4415) : (i64, i64) -> i64
      %4417 = func.call @cc_values_pack(%4416) : (i64) -> i64
      func.call @stack_push_pointer(%4414) : (i64) -> ()
      %4418 = llvm.mlir.addressof @str591 : !llvm.ptr
      %4419 = arith.constant 16 : i64
      %4420 = func.call @cc_make_string(%4418, %4419) : (!llvm.ptr, i64) -> i64
      %4421 = llvm.mlir.addressof @str592 : !llvm.ptr
      %4422 = arith.constant 4 : i64
      %4423 = func.call @cc_make_string(%4421, %4422) : (!llvm.ptr, i64) -> i64
      %4424 = func.call @cc_intern(%4420, %4423) : (i64, i64) -> i64
      %4425 = func.call @cc_nil_value() : () -> i64
      %4426 = func.call @cc_cons(%4424, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_values_pack(%4426) : (i64) -> i64
      func.call @stack_push_pointer(%4424) : (i64) -> ()
      %4428 = llvm.mlir.addressof @str593 : !llvm.ptr
      %4429 = arith.constant 19 : i64
      %4430 = func.call @cc_make_string(%4428, %4429) : (!llvm.ptr, i64) -> i64
      %4431 = llvm.mlir.addressof @str594 : !llvm.ptr
      %4432 = arith.constant 4 : i64
      %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
      %4434 = func.call @cc_intern(%4430, %4433) : (i64, i64) -> i64
      %4435 = func.call @cc_nil_value() : () -> i64
      %4436 = func.call @cc_cons(%4434, %4435) : (i64, i64) -> i64
      %4437 = func.call @cc_values_pack(%4436) : (i64) -> i64
      func.call @stack_push_pointer(%4434) : (i64) -> ()
      %4438 = llvm.mlir.addressof @str595 : !llvm.ptr
      %4439 = arith.constant 19 : i64
      %4440 = func.call @cc_make_string(%4438, %4439) : (!llvm.ptr, i64) -> i64
      %4441 = llvm.mlir.addressof @str596 : !llvm.ptr
      %4442 = arith.constant 4 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = func.call @cc_intern(%4440, %4443) : (i64, i64) -> i64
      %4445 = func.call @cc_nil_value() : () -> i64
      %4446 = func.call @cc_cons(%4444, %4445) : (i64, i64) -> i64
      %4447 = func.call @cc_values_pack(%4446) : (i64) -> i64
      func.call @stack_push_pointer(%4444) : (i64) -> ()
      %4448 = llvm.mlir.addressof @str597 : !llvm.ptr
      %4449 = arith.constant 22 : i64
      %4450 = func.call @cc_make_string(%4448, %4449) : (!llvm.ptr, i64) -> i64
      %4451 = llvm.mlir.addressof @str598 : !llvm.ptr
      %4452 = arith.constant 4 : i64
      %4453 = func.call @cc_make_string(%4451, %4452) : (!llvm.ptr, i64) -> i64
      %4454 = func.call @cc_intern(%4450, %4453) : (i64, i64) -> i64
      %4455 = func.call @cc_nil_value() : () -> i64
      %4456 = func.call @cc_cons(%4454, %4455) : (i64, i64) -> i64
      %4457 = func.call @cc_values_pack(%4456) : (i64) -> i64
      func.call @stack_push_pointer(%4454) : (i64) -> ()
      %4458 = llvm.mlir.addressof @str599 : !llvm.ptr
      %4459 = arith.constant 19 : i64
      %4460 = func.call @cc_make_string(%4458, %4459) : (!llvm.ptr, i64) -> i64
      %4461 = llvm.mlir.addressof @str600 : !llvm.ptr
      %4462 = arith.constant 4 : i64
      %4463 = func.call @cc_make_string(%4461, %4462) : (!llvm.ptr, i64) -> i64
      %4464 = func.call @cc_intern(%4460, %4463) : (i64, i64) -> i64
      %4465 = func.call @cc_nil_value() : () -> i64
      %4466 = func.call @cc_cons(%4464, %4465) : (i64, i64) -> i64
      %4467 = func.call @cc_values_pack(%4466) : (i64) -> i64
      func.call @stack_push_pointer(%4464) : (i64) -> ()
      %4468 = llvm.mlir.addressof @str601 : !llvm.ptr
      %4469 = arith.constant 25 : i64
      %4470 = func.call @cc_make_string(%4468, %4469) : (!llvm.ptr, i64) -> i64
      %4471 = llvm.mlir.addressof @str602 : !llvm.ptr
      %4472 = arith.constant 4 : i64
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
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %4481 = arith.addi %4480, %__rlasp_stack_elide_zero_310 : i64
      %4482 = func.call @stack_pop_pointer() : () -> i64
      %4483 = func.call @cc_cons(%4482, %4481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %4484 = arith.addi %4483, %__rlasp_stack_elide_zero_311 : i64
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @cc_cons(%4485, %4484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %4487 = arith.addi %4486, %__rlasp_stack_elide_zero_312 : i64
      %4488 = func.call @stack_pop_pointer() : () -> i64
      %4489 = func.call @cc_cons(%4488, %4487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %4490 = arith.addi %4489, %__rlasp_stack_elide_zero_313 : i64
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @cc_cons(%4491, %4490) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %4493 = arith.addi %4492, %__rlasp_stack_elide_zero_314 : i64
      %4494 = func.call @stack_pop_pointer() : () -> i64
      %4495 = func.call @cc_cons(%4494, %4493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %4496 = arith.addi %4495, %__rlasp_stack_elide_zero_315 : i64
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @cc_cons(%4497, %4496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %4499 = arith.addi %4498, %__rlasp_stack_elide_zero_316 : i64
      %4500 = func.call @stack_pop_pointer() : () -> i64
      %4501 = func.call @cc_cons(%4500, %4499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %4502 = arith.addi %4501, %__rlasp_stack_elide_zero_317 : i64
      %4503 = func.call @stack_pop_pointer() : () -> i64
      %4504 = func.call @cc_cons(%4503, %4502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %4505 = arith.addi %4504, %__rlasp_stack_elide_zero_318 : i64
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @cc_cons(%4506, %4505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %4508 = arith.addi %4507, %__rlasp_stack_elide_zero_319 : i64
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @cc_cons(%4509, %4508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %4511 = arith.addi %4510, %__rlasp_stack_elide_zero_320 : i64
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @cc_cons(%4512, %4511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %4514 = arith.addi %4513, %__rlasp_stack_elide_zero_321 : i64
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @cc_cons(%4515, %4514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %4517 = arith.addi %4516, %__rlasp_stack_elide_zero_322 : i64
      %4518 = func.call @stack_pop_pointer() : () -> i64
      %4519 = func.call @cc_cons(%4518, %4517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %4520 = arith.addi %4519, %__rlasp_stack_elide_zero_323 : i64
      %4521 = func.call @stack_pop_pointer() : () -> i64
      %4522 = func.call @cc_cons(%4521, %4520) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %4523 = arith.addi %4522, %__rlasp_stack_elide_zero_324 : i64
      %4524 = func.call @stack_pop_pointer() : () -> i64
      %4525 = func.call @cc_cons(%4524, %4523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %4526 = arith.addi %4525, %__rlasp_stack_elide_zero_325 : i64
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @cc_cons(%4527, %4526) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %4529 = arith.addi %4528, %__rlasp_stack_elide_zero_326 : i64
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @cc_cons(%4530, %4529) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %4532 = arith.addi %4531, %__rlasp_stack_elide_zero_327 : i64
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @cc_cons(%4533, %4532) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %4535 = arith.addi %4534, %__rlasp_stack_elide_zero_328 : i64
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @cc_cons(%4536, %4535) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %4538 = arith.addi %4537, %__rlasp_stack_elide_zero_329 : i64
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4540 = func.call @cc_cons(%4539, %4538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %4541 = arith.addi %4540, %__rlasp_stack_elide_zero_330 : i64
      %4542 = func.call @stack_pop_pointer() : () -> i64
      %4543 = func.call @cc_cons(%4542, %4541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %4544 = arith.addi %4543, %__rlasp_stack_elide_zero_331 : i64
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = func.call @cc_cons(%4545, %4544) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %4547 = arith.addi %4546, %__rlasp_stack_elide_zero_332 : i64
      %4548 = func.call @stack_pop_pointer() : () -> i64
      %4549 = func.call @cc_cons(%4548, %4547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %4550 = arith.addi %4549, %__rlasp_stack_elide_zero_333 : i64
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = func.call @cc_cons(%4551, %4550) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %4553 = arith.addi %4552, %__rlasp_stack_elide_zero_334 : i64
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = func.call @cc_cons(%4554, %4553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %4556 = arith.addi %4555, %__rlasp_stack_elide_zero_335 : i64
      %4557 = func.call @stack_pop_pointer() : () -> i64
      %4558 = func.call @cc_cons(%4557, %4556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %4559 = arith.addi %4558, %__rlasp_stack_elide_zero_336 : i64
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_cons(%4560, %4559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %4562 = arith.addi %4561, %__rlasp_stack_elide_zero_337 : i64
      %4563 = func.call @stack_pop_pointer() : () -> i64
      %4564 = func.call @cc_cons(%4563, %4562) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %4565 = arith.addi %4564, %__rlasp_stack_elide_zero_338 : i64
      %4566 = func.call @stack_pop_pointer() : () -> i64
      %4567 = func.call @cc_cons(%4566, %4565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %4568 = arith.addi %4567, %__rlasp_stack_elide_zero_339 : i64
      %4569 = func.call @stack_pop_pointer() : () -> i64
      %4570 = func.call @cc_cons(%4569, %4568) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %4571 = arith.addi %4570, %__rlasp_stack_elide_zero_340 : i64
      %4572 = func.call @stack_pop_pointer() : () -> i64
      %4573 = func.call @cc_cons(%4572, %4571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %4574 = arith.addi %4573, %__rlasp_stack_elide_zero_341 : i64
      %4575 = func.call @stack_pop_pointer() : () -> i64
      %4576 = func.call @cc_cons(%4575, %4574) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %4577 = arith.addi %4576, %__rlasp_stack_elide_zero_342 : i64
      %4578 = func.call @stack_pop_pointer() : () -> i64
      %4579 = func.call @cc_cons(%4578, %4577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %4580 = arith.addi %4579, %__rlasp_stack_elide_zero_343 : i64
      %4581 = func.call @stack_pop_pointer() : () -> i64
      %4582 = func.call @cc_cons(%4581, %4580) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %4583 = arith.addi %4582, %__rlasp_stack_elide_zero_344 : i64
      %4584 = func.call @stack_pop_pointer() : () -> i64
      %4585 = func.call @cc_cons(%4584, %4583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %4586 = arith.addi %4585, %__rlasp_stack_elide_zero_345 : i64
      %4587 = func.call @stack_pop_pointer() : () -> i64
      %4588 = func.call @cc_cons(%4587, %4586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %4589 = arith.addi %4588, %__rlasp_stack_elide_zero_346 : i64
      %4590 = func.call @stack_pop_pointer() : () -> i64
      %4591 = func.call @cc_cons(%4590, %4589) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %4592 = arith.addi %4591, %__rlasp_stack_elide_zero_347 : i64
      %4593 = func.call @stack_pop_pointer() : () -> i64
      %4594 = func.call @cc_cons(%4593, %4592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %4595 = arith.addi %4594, %__rlasp_stack_elide_zero_348 : i64
      %4596 = func.call @stack_pop_pointer() : () -> i64
      %4597 = func.call @cc_cons(%4596, %4595) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %4598 = arith.addi %4597, %__rlasp_stack_elide_zero_349 : i64
      %4599 = func.call @stack_pop_pointer() : () -> i64
      %4600 = func.call @cc_cons(%4599, %4598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %4601 = arith.addi %4600, %__rlasp_stack_elide_zero_350 : i64
      %4602 = func.call @stack_pop_pointer() : () -> i64
      %4603 = func.call @cc_cons(%4602, %4601) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %4604 = arith.addi %4603, %__rlasp_stack_elide_zero_351 : i64
      %4605 = func.call @stack_pop_pointer() : () -> i64
      %4606 = func.call @cc_cons(%4605, %4604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %4607 = arith.addi %4606, %__rlasp_stack_elide_zero_352 : i64
      %4608 = func.call @stack_pop_pointer() : () -> i64
      %4609 = func.call @cc_cons(%4608, %4607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %4610 = arith.addi %4609, %__rlasp_stack_elide_zero_353 : i64
      %4611 = func.call @stack_pop_pointer() : () -> i64
      %4612 = func.call @cc_cons(%4611, %4610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %4613 = arith.addi %4612, %__rlasp_stack_elide_zero_354 : i64
      %4614 = func.call @stack_pop_pointer() : () -> i64
      %4615 = func.call @cc_cons(%4614, %4613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %4616 = arith.addi %4615, %__rlasp_stack_elide_zero_355 : i64
      %4617 = func.call @stack_pop_pointer() : () -> i64
      %4618 = func.call @cc_cons(%4617, %4616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %4619 = arith.addi %4618, %__rlasp_stack_elide_zero_356 : i64
      %4620 = func.call @stack_pop_pointer() : () -> i64
      %4621 = func.call @cc_cons(%4620, %4619) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %4622 = arith.addi %4621, %__rlasp_stack_elide_zero_357 : i64
      %4623 = func.call @stack_pop_pointer() : () -> i64
      %4624 = func.call @cc_cons(%4623, %4622) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %4625 = arith.addi %4624, %__rlasp_stack_elide_zero_358 : i64
      %4626 = func.call @stack_pop_pointer() : () -> i64
      %4627 = func.call @cc_cons(%4626, %4625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %4628 = arith.addi %4627, %__rlasp_stack_elide_zero_359 : i64
      %4629 = func.call @stack_pop_pointer() : () -> i64
      %4630 = func.call @cc_cons(%4629, %4628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %4631 = arith.addi %4630, %__rlasp_stack_elide_zero_360 : i64
      %4632 = func.call @stack_pop_pointer() : () -> i64
      %4633 = func.call @cc_cons(%4632, %4631) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %4634 = arith.addi %4633, %__rlasp_stack_elide_zero_361 : i64
      %4635 = func.call @stack_pop_pointer() : () -> i64
      %4636 = func.call @cc_cons(%4635, %4634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %4637 = arith.addi %4636, %__rlasp_stack_elide_zero_362 : i64
      %4638 = func.call @stack_pop_pointer() : () -> i64
      %4639 = func.call @cc_cons(%4638, %4637) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %4640 = arith.addi %4639, %__rlasp_stack_elide_zero_363 : i64
      %4641 = func.call @stack_pop_pointer() : () -> i64
      %4642 = func.call @cc_cons(%4641, %4640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %4643 = arith.addi %4642, %__rlasp_stack_elide_zero_364 : i64
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @cc_cons(%4644, %4643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %4646 = arith.addi %4645, %__rlasp_stack_elide_zero_365 : i64
      %4647 = func.call @stack_pop_pointer() : () -> i64
      %4648 = func.call @cc_cons(%4647, %4646) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %4649 = arith.addi %4648, %__rlasp_stack_elide_zero_366 : i64
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @cc_cons(%4650, %4649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %4652 = arith.addi %4651, %__rlasp_stack_elide_zero_367 : i64
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @cc_cons(%4653, %4652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %4655 = arith.addi %4654, %__rlasp_stack_elide_zero_368 : i64
      %4656 = func.call @cc_nil_value() : () -> i64
      %4657 = func.call @cc_nil_value() : () -> i64
      %4658 = func.call @cc_errorp(%4656) : (i64) -> i64
      %4659 = arith.cmpi ne, %4658, %4657 : i64
      %4660 = scf.if %4659 -> (i64) {
        scf.yield %4656 : i64
      } else {
        %4661 = func.call @cc_nil_value() : () -> i64
        %4662 = func.call @cc_nil_value() : () -> i64
        %4663 = func.call @cc_nil_value() : () -> i64
        %4664 = func.call @cc_nil_value() : () -> i64
        %4665 = func.call @cc_errorp(%4663) : (i64) -> i64
        %4666 = arith.cmpi ne, %4665, %4664 : i64
        %4667 = scf.if %4666 -> (i64) {
          scf.yield %4663 : i64
        } else {
          %4668 = func.call @cc_nil_value() : () -> i64
          %4669 = llvm.mlir.addressof @str603 : !llvm.ptr
          %4670 = arith.constant 38 : i64
          %4671 = func.call @cc_make_string(%4669, %4670) : (!llvm.ptr, i64) -> i64
          %4672 = func.call @cc_nil_value() : () -> i64
          %4673 = func.call @cc_intern(%4671, %4672) : (i64, i64) -> i64
          %4674 = func.call @cc_nil_value() : () -> i64
          %4675 = func.call @cc_cons(%4673, %4674) : (i64, i64) -> i64
          %4676 = func.call @cc_values_pack(%4675) : (i64) -> i64
          %4677 = func.call @cc_set_symbol_value(%4673, %4668) : (i64, i64) -> i64
          %4678 = llvm.mlir.addressof @str604 : !llvm.ptr
          %4679 = arith.constant 39 : i64
          %4680 = func.call @cc_make_string(%4678, %4679) : (!llvm.ptr, i64) -> i64
          %4681 = func.call @cc_nil_value() : () -> i64
          %4682 = func.call @cc_intern(%4680, %4681) : (i64, i64) -> i64
          %4683 = func.call @cc_nil_value() : () -> i64
          %4684 = func.call @cc_cons(%4682, %4683) : (i64, i64) -> i64
          %4685 = func.call @cc_values_pack(%4684) : (i64) -> i64
          %4686 = func.call @cc_set_symbol_value(%4682, %4668) : (i64, i64) -> i64
          %4687 = llvm.mlir.addressof @str605 : !llvm.ptr
          %4688 = arith.constant 40 : i64
          %4689 = func.call @cc_make_string(%4687, %4688) : (!llvm.ptr, i64) -> i64
          %4690 = func.call @cc_nil_value() : () -> i64
          %4691 = func.call @cc_intern(%4689, %4690) : (i64, i64) -> i64
          %4692 = func.call @cc_nil_value() : () -> i64
          %4693 = func.call @cc_cons(%4691, %4692) : (i64, i64) -> i64
          %4694 = func.call @cc_values_pack(%4693) : (i64) -> i64
          %4695 = func.call @cc_set_symbol_value(%4691, %4668) : (i64, i64) -> i64
          %4696:3 = scf.while (%arg0 = %4661, %arg1 = %4662, %arg2 = %4655) : (i64, i64, i64) -> (i64, i64, i64) {
            %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
            %4697 = arith.addi %arg2, %__rlasp_stack_elide_zero_369 : i64
            %4698 = func.call @cc_nil_value() : () -> i64
            %4699 = arith.cmpi ne, %4697, %4698 : i64
            %4700 = func.call @cc_nil_value() : () -> i64
            %4701 = llvm.mlir.addressof @str606 : !llvm.ptr
            %4702 = arith.constant 38 : i64
            %4703 = func.call @cc_make_string(%4701, %4702) : (!llvm.ptr, i64) -> i64
            %4704 = func.call @cc_nil_value() : () -> i64
            %4705 = func.call @cc_intern(%4703, %4704) : (i64, i64) -> i64
            %4706 = func.call @cc_nil_value() : () -> i64
            %4707 = func.call @cc_cons(%4705, %4706) : (i64, i64) -> i64
            %4708 = func.call @cc_values_pack(%4707) : (i64) -> i64
            %4709 = func.call @cc_symbol_value(%4705) : (i64) -> i64
            %4710 = arith.cmpi ne, %4709, %4700 : i64
            %4711 = llvm.mlir.addressof @str607 : !llvm.ptr
            %4712 = arith.constant 38 : i64
            %4713 = func.call @cc_make_string(%4711, %4712) : (!llvm.ptr, i64) -> i64
            %4714 = func.call @cc_nil_value() : () -> i64
            %4715 = func.call @cc_intern(%4713, %4714) : (i64, i64) -> i64
            %4716 = func.call @cc_nil_value() : () -> i64
            %4717 = func.call @cc_cons(%4715, %4716) : (i64, i64) -> i64
            %4718 = func.call @cc_values_pack(%4717) : (i64) -> i64
            %4719 = func.call @cc_symbol_value(%4715) : (i64) -> i64
            %4720 = arith.cmpi ne, %4719, %4700 : i64
            %4721 = arith.ori %4710, %4720 : i1
            %4722 = arith.constant 0 : i1
            %4723 = arith.cmpi eq, %4721, %4722 : i1
            %4724 = arith.andi %4699, %4723 : i1
            scf.condition(%4724) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%4725: i64, %4726: i64, %4727: i64):
            %4728 = func.call @cc_nil_value() : () -> i64
            %4729 = func.call @cc_nil_value() : () -> i64
            %4730 = func.call @cc_errorp(%4728) : (i64) -> i64
            %4731 = arith.cmpi ne, %4730, %4729 : i64
            %4732:3 = scf.if %4731 -> (i64, i64, i64) {
              scf.yield %4728, %4726, %4725 : i64, i64, i64
            } else {
              %4733 = func.call @cc_nil_value() : () -> i64
              %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
              %4734 = arith.addi %4727, %__rlasp_stack_elide_zero_370 : i64
              %4735 = func.call @cc_nil_value() : () -> i64
              %4736 = arith.cmpi eq, %4734, %4735 : i64
              %4738 = func.call @cc_t_value() : () -> i64
              %4737 = arith.select %4736, %4738, %4735 : i64
              %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
              %4739 = arith.addi %4737, %__rlasp_stack_elide_zero_371 : i64
              %4740 = func.call @cc_nil_value() : () -> i64
              %4741 = func.call @cc_cons(%4739, %4740) : (i64, i64) -> i64
              %4742 = func.call @cc_not(%4741) : (i64) -> i64
              %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
              %4743 = arith.addi %4742, %__rlasp_stack_elide_zero_372 : i64
              %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
              %4744 = arith.addi %4727, %__rlasp_stack_elide_zero_373 : i64
              %4745 = func.call @cc_is_cons(%4744) : (i64) -> i32
              %4746 = arith.constant 0 : i32
              %4747 = arith.cmpi ne, %4745, %4746 : i32
              %4748 = func.call @cc_t_value() : () -> i64
              %4749 = func.call @cc_nil_value() : () -> i64
              %4750 = arith.select %4747, %4748, %4749 : i64
              %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
              %4751 = arith.addi %4750, %__rlasp_stack_elide_zero_374 : i64
              %4752 = func.call @cc_nil_value() : () -> i64
              %4753 = func.call @cc_cons(%4751, %4752) : (i64, i64) -> i64
              %4754 = func.call @cc_not(%4753) : (i64) -> i64
              %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
              %4755 = arith.addi %4754, %__rlasp_stack_elide_zero_375 : i64
              %4756 = func.call @cc_cons(%4755, %4733) : (i64, i64) -> i64
              %4757 = func.call @cc_cons(%4743, %4756) : (i64, i64) -> i64
              %4758 = func.call @cc_and(%4757) : (i64) -> i64
              %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
              %4759 = arith.addi %4758, %__rlasp_stack_elide_zero_376 : i64
              %4760 = func.call @cc_nil_value() : () -> i64
              %4761 = arith.cmpi ne, %4759, %4760 : i64
              scf.if %4761 {
                %4762 = llvm.mlir.addressof @str608 : !llvm.ptr
                %4763 = arith.constant 10 : i64
                %4764 = func.call @cc_make_string(%4762, %4763) : (!llvm.ptr, i64) -> i64
                %4765 = func.call @cc_nil_value() : () -> i64
                %4766 = func.call @cc_intern(%4764, %4765) : (i64, i64) -> i64
                %4767 = func.call @cc_nil_value() : () -> i64
                %4768 = func.call @cc_cons(%4766, %4767) : (i64, i64) -> i64
                %4769 = func.call @cc_values_pack(%4768) : (i64) -> i64
                %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
                %4770 = arith.addi %4766, %__rlasp_stack_elide_zero_377 : i64
                %4771 = func.call @cc_nil_value() : () -> i64
                %4772 = func.call @cc_errorp(%4770) : (i64) -> i64
                %4773 = arith.cmpi ne, %4772, %4771 : i64
                %4774 = arith.cmpi eq, %4771, %4771 : i64
                %4775 = arith.andi %4773, %4774 : i1
                %4776 = scf.if %4775 -> (i64) {
                  scf.yield %4770 : i64
                } else {
                  scf.yield %4771 : i64
                }
                %4777 = arith.cmpi ne, %4776, %4771 : i64
                scf.if %4777 {
                  func.call @stack_push_pointer(%4776) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%4770) : (i64) -> ()
                  %4778 = llvm.mlir.addressof @str609 : !llvm.ptr
                  %4779 = func.call @cc_make_function_ref_const(%4778) : (!llvm.ptr) -> i64
                  %4780 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%4779, %4780) : (i64, i64) -> ()
                }
                %4781 = func.call @stack_pop_pointer() : () -> i64
                %4782 = func.call @cc_multiple_value_list(%4781) : (i64) -> i64
                %4783 = func.call @cc_t_value() : () -> i64
                %4784 = llvm.mlir.addressof @str610 : !llvm.ptr
                %4785 = arith.constant 38 : i64
                %4786 = func.call @cc_make_string(%4784, %4785) : (!llvm.ptr, i64) -> i64
                %4787 = func.call @cc_nil_value() : () -> i64
                %4788 = func.call @cc_intern(%4786, %4787) : (i64, i64) -> i64
                %4789 = func.call @cc_nil_value() : () -> i64
                %4790 = func.call @cc_cons(%4788, %4789) : (i64, i64) -> i64
                %4791 = func.call @cc_values_pack(%4790) : (i64) -> i64
                %4792 = func.call @cc_set_symbol_value(%4788, %4783) : (i64, i64) -> i64
                %4793 = llvm.mlir.addressof @str611 : !llvm.ptr
                %4794 = arith.constant 39 : i64
                %4795 = func.call @cc_make_string(%4793, %4794) : (!llvm.ptr, i64) -> i64
                %4796 = func.call @cc_nil_value() : () -> i64
                %4797 = func.call @cc_intern(%4795, %4796) : (i64, i64) -> i64
                %4798 = func.call @cc_nil_value() : () -> i64
                %4799 = func.call @cc_cons(%4797, %4798) : (i64, i64) -> i64
                %4800 = func.call @cc_values_pack(%4799) : (i64) -> i64
                %4801 = func.call @cc_set_symbol_value(%4797, %4781) : (i64, i64) -> i64
                %4802 = llvm.mlir.addressof @str612 : !llvm.ptr
                %4803 = arith.constant 40 : i64
                %4804 = func.call @cc_make_string(%4802, %4803) : (!llvm.ptr, i64) -> i64
                %4805 = func.call @cc_nil_value() : () -> i64
                %4806 = func.call @cc_intern(%4804, %4805) : (i64, i64) -> i64
                %4807 = func.call @cc_nil_value() : () -> i64
                %4808 = func.call @cc_cons(%4806, %4807) : (i64, i64) -> i64
                %4809 = func.call @cc_values_pack(%4808) : (i64) -> i64
                %4810 = func.call @cc_set_symbol_value(%4806, %4782) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4781) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %4811 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %4811, %4726, %4725 : i64, i64, i64
            }
            %4812 = func.call @cc_nil_value() : () -> i64
            %4813 = func.call @cc_errorp(%4732#0) : (i64) -> i64
            %4814 = arith.cmpi ne, %4813, %4812 : i64
            %4815:3 = scf.if %4814 -> (i64, i64, i64) {
              scf.yield %4732#0, %4732#1, %4732#2 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
              %4816 = arith.addi %4727, %__rlasp_stack_elide_zero_378 : i64
              %4817 = func.call @cc_car(%4816) : (i64) -> i64
              %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
              %4818 = arith.addi %4817, %__rlasp_stack_elide_zero_379 : i64
              %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
              %4819 = arith.addi %4818, %__rlasp_stack_elide_zero_380 : i64
              scf.yield %4819, %4732#1, %4818 : i64, i64, i64
            }
            %4820 = func.call @cc_nil_value() : () -> i64
            %4821 = func.call @cc_errorp(%4815#0) : (i64) -> i64
            %4822 = arith.cmpi ne, %4821, %4820 : i64
            %4823:3 = scf.if %4822 -> (i64, i64, i64) {
              scf.yield %4815#0, %4815#1, %4815#2 : i64, i64, i64
            } else {
              %4824 = llvm.mlir.addressof @str613 : !llvm.ptr
              %4825 = arith.constant 4 : i64
              %4826 = func.call @cc_make_string(%4824, %4825) : (!llvm.ptr, i64) -> i64
              %4827 = llvm.mlir.addressof @str614 : !llvm.ptr
              %4828 = arith.constant 11 : i64
              %4829 = func.call @cc_make_string(%4827, %4828) : (!llvm.ptr, i64) -> i64
              %4830 = func.call @cc_intern(%4826, %4829) : (i64, i64) -> i64
              %4831 = func.call @cc_nil_value() : () -> i64
              %4832 = func.call @cc_cons(%4830, %4831) : (i64, i64) -> i64
              %4833 = func.call @cc_values_pack(%4832) : (i64) -> i64
              func.call @stack_push_pointer(%4830) : (i64) -> ()
              func.call @stack_push_pointer(%4815#2) : (i64) -> ()
              func.call @stack_push_nil() : () -> ()
              %4834 = func.call @stack_pop_pointer() : () -> i64
              %4835 = func.call @stack_pop_pointer() : () -> i64
              %4836 = func.call @cc_cons(%4835, %4834) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
              %4837 = arith.addi %4836, %__rlasp_stack_elide_zero_381 : i64
              %4838 = func.call @stack_pop_pointer() : () -> i64
              %4839 = func.call @cc_cons(%4838, %4837) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
              %4840 = arith.addi %4839, %__rlasp_stack_elide_zero_382 : i64
              %4841 = func.call @cc_fboundp(%4840) : (i64) -> i64
              %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
              %4842 = arith.addi %4841, %__rlasp_stack_elide_zero_383 : i64
              %4843 = func.call @cc_nil_value() : () -> i64
              %4844 = arith.cmpi ne, %4842, %4843 : i64
              %4845:2 = scf.if %4844 -> (i64, i64) {
                %4846 = func.call @cc_nil_value() : () -> i64
                %4847 = func.call @cc_nil_value() : () -> i64
                %4848 = func.call @cc_errorp(%4846) : (i64) -> i64
                %4849 = arith.cmpi ne, %4848, %4847 : i64
                %4850:2 = scf.if %4849 -> (i64, i64) {
                  scf.yield %4846, %4815#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%4815#1) : (i64) -> ()
                  %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
                  %4851 = arith.addi %4815#2, %__rlasp_stack_elide_zero_384 : i64
                  %4852 = func.call @cc_nil_value() : () -> i64
                  %4853 = func.call @cc_errorp(%4851) : (i64) -> i64
                  %4854 = arith.cmpi ne, %4853, %4852 : i64
                  %4855 = arith.cmpi eq, %4852, %4852 : i64
                  %4856 = arith.andi %4854, %4855 : i1
                  %4857 = scf.if %4856 -> (i64) {
                    scf.yield %4851 : i64
                  } else {
                    scf.yield %4852 : i64
                  }
                  %4858 = arith.cmpi ne, %4857, %4852 : i64
                  scf.if %4858 {
                    func.call @stack_push_pointer(%4857) : (i64) -> ()
                  } else {
                    %4859 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%4859) : (i64) -> ()
                    %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
                    %4860 = arith.addi %4851, %__rlasp_stack_elide_zero_385 : i64
                    %4861 = func.call @stack_pop_pointer() : () -> i64
                    %4862 = func.call @cc_cons(%4860, %4861) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%4862) : (i64) -> ()
                  }
                  %4863 = func.call @stack_pop_pointer() : () -> i64
                  %4864 = func.call @stack_pop_pointer() : () -> i64
                  %4865 = func.call @cc_append(%4864, %4863) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
                  %4866 = arith.addi %4865, %__rlasp_stack_elide_zero_386 : i64
                  %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
                  %4867 = arith.addi %4866, %__rlasp_stack_elide_zero_387 : i64
                  scf.yield %4867, %4866 : i64, i64
                }
                %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
                %4868 = arith.addi %4850#0, %__rlasp_stack_elide_zero_388 : i64
                scf.yield %4868, %4850#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %4869 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %4869, %4815#1 : i64, i64
              }
              %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
              %4870 = arith.addi %4845#0, %__rlasp_stack_elide_zero_389 : i64
              scf.yield %4870, %4845#1, %4815#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%4823#0) : (i64) -> ()
            %4871 = func.call @stack_depth() : () -> i64
            %4872 = arith.constant 0 : i64
            %4873 = arith.cmpi sgt, %4871, %4872 : i64
            scf.if %4873 {
              %4874 = func.call @stack_pop_pointer() : () -> i64
            }
            %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
            %4875 = arith.addi %4727, %__rlasp_stack_elide_zero_390 : i64
            %4876 = func.call @cc_cdr(%4875) : (i64) -> i64
            %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
            %4877 = arith.addi %4876, %__rlasp_stack_elide_zero_391 : i64
            func.call @stack_push_pointer(%4877) : (i64) -> ()
            %4878 = func.call @stack_depth() : () -> i64
            %4879 = arith.constant 0 : i64
            %4880 = arith.cmpi sgt, %4878, %4879 : i64
            scf.if %4880 {
              %4881 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %4823#2, %4823#1, %4877 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %4882 = func.call @stack_pop_pointer() : () -> i64
          %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
          %4883 = arith.addi %4696#1, %__rlasp_stack_elide_zero_392 : i64
          %4884 = func.call @cc_multiple_value_list(%4883) : (i64) -> i64
          %4885 = llvm.mlir.addressof @str615 : !llvm.ptr
          %4886 = arith.constant 38 : i64
          %4887 = func.call @cc_make_string(%4885, %4886) : (!llvm.ptr, i64) -> i64
          %4888 = func.call @cc_nil_value() : () -> i64
          %4889 = func.call @cc_intern(%4887, %4888) : (i64, i64) -> i64
          %4890 = func.call @cc_nil_value() : () -> i64
          %4891 = func.call @cc_cons(%4889, %4890) : (i64, i64) -> i64
          %4892 = func.call @cc_values_pack(%4891) : (i64) -> i64
          %4893 = func.call @cc_symbol_value(%4889) : (i64) -> i64
          %4894 = llvm.mlir.addressof @str616 : !llvm.ptr
          %4895 = arith.constant 39 : i64
          %4896 = func.call @cc_make_string(%4894, %4895) : (!llvm.ptr, i64) -> i64
          %4897 = func.call @cc_nil_value() : () -> i64
          %4898 = func.call @cc_intern(%4896, %4897) : (i64, i64) -> i64
          %4899 = func.call @cc_nil_value() : () -> i64
          %4900 = func.call @cc_cons(%4898, %4899) : (i64, i64) -> i64
          %4901 = func.call @cc_values_pack(%4900) : (i64) -> i64
          %4902 = func.call @cc_symbol_value(%4898) : (i64) -> i64
          %4903 = llvm.mlir.addressof @str617 : !llvm.ptr
          %4904 = arith.constant 40 : i64
          %4905 = func.call @cc_make_string(%4903, %4904) : (!llvm.ptr, i64) -> i64
          %4906 = func.call @cc_nil_value() : () -> i64
          %4907 = func.call @cc_intern(%4905, %4906) : (i64, i64) -> i64
          %4908 = func.call @cc_nil_value() : () -> i64
          %4909 = func.call @cc_cons(%4907, %4908) : (i64, i64) -> i64
          %4910 = func.call @cc_values_pack(%4909) : (i64) -> i64
          %4911 = func.call @cc_symbol_value(%4907) : (i64) -> i64
          %4912 = func.call @cc_nil_value() : () -> i64
          %4913 = arith.cmpi ne, %4893, %4912 : i64
          %4914 = scf.if %4913 -> (i64) {
            scf.yield %4911 : i64
          } else {
            scf.yield %4884 : i64
          }
          %4915 = func.call @cc_values_pack(%4914) : (i64) -> i64
          %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
          %4916 = arith.addi %4915, %__rlasp_stack_elide_zero_393 : i64
          scf.yield %4916 : i64
        }
        %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
        %4917 = arith.addi %4667, %__rlasp_stack_elide_zero_394 : i64
        scf.yield %4917 : i64
      }
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %4918 = arith.addi %4660, %__rlasp_stack_elide_zero_395 : i64
      scf.yield %4918 : i64
    }
    func.call @stack_push_pointer(%3887) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_120590987952128*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_120590987952128*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("MOP.GENERICS.FBOUNDP\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("MOP-GENERIC-NAMES\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str8("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str9("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str10("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str11("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str13("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str15("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str17("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str19("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str21("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str23("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str25("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str27("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str28("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str29("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str30("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str31("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str32("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str34("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str35("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str36("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str37("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str38("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str39("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str41("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str43("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str45("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str47("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str49("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str51("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str52("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str53("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str54("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str55("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str57("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str59("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str61("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str62("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str63("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str65("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str66("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str67("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str68("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str69("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str70("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str71("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str73("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str74("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str75("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str77("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str78("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str79("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str81("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str83("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str85("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str86("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str87("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str88("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str89("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str90("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str91("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str93("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str95("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str97("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str99("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str100("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str101("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str102("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str103("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str104("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str105("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str106("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str107("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str108("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str111("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str112("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str115("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str116("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str117("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str118("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str119("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str120("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str121("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str123("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str124("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str125("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str127("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str128("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str129("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str130("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str131("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str132("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str134("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str135("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str136("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str137("MOP-GENERIC-NAMES\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str138("UNLESS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str145("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("FDEFINITION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str150("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str153("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str156("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str157("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str158("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str159("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str160("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str163("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str164("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str165("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str166("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str167("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str168("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str170("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str172("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str173("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str174("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str176("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str178("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str179("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str182("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str183("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str184("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str185("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str186("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str188("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str190("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str191("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str192("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str193("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str194("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str195("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str196("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str198("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str199("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str200("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str201("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str202("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str203("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str204("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str205("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str206("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str207("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str208("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str209("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str210("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str211("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str212("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str213("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str214("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str216("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str218("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str219("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str220("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str221("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str222("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str223("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str224("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str226("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str227("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str228("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str229("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str230("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str231("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str232("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str233("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str234("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str236("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str237("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str238("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str239("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str240("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str241("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str242("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str243("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str244("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str245("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str246("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str247("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str248("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str249("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str250("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str251("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str252("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str253("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str254("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str255("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str258("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str259("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str262("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str263("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str264("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str265("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str266("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str267("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str268("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str269("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str270("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str271("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str272("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str273("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str274("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str276("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str277("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str278("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str279("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str280("*__MLIR_BLOCK_RETVALUE_120590987952130*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str281("*__MLIR_BLOCK_RETMVLIST_120590987952130*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str282("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str283("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str284("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str285("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str287("*__MLIR_BLOCK_RETVALUE_120590987952130*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str288("*__MLIR_BLOCK_RETMVLIST_120590987952130*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str289("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str292("*__MLIR_BLOCK_RETVALUE_120590987952130*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str293("*__MLIR_BLOCK_RETMVLIST_120590987952130*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str294("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str295("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str296("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str297("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str298("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str300("MOP.NONGENERICS.FBOUNDP\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str301("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str302("NONGENERIC-NAMES\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str303("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str304("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str305("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str306("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str307("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str308("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str309("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str310("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str312("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str313("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str314("NONGENERIC-NAMES\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str315("UNLESS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str316("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str318("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str320("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str321("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str322("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str323("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str324("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str325("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str326("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str327("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str328("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str329("*__MLIR_BLOCK_RETVALUE_120590987952132*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str330("*__MLIR_BLOCK_RETMVLIST_120590987952132*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str331("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str332("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str333("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str334("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str336("*__MLIR_BLOCK_RETVALUE_120590987952132*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str337("*__MLIR_BLOCK_RETMVLIST_120590987952132*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str338("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str339("*__MLIR_BLOCK_RETVALUE_120590987952132*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str340("*__MLIR_BLOCK_RETMVLIST_120590987952132*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str341("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str343("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str344("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str345("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str346("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str347("MOP.WRITERS.NONFBOUNDP\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str348("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str349("NONWRITERS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str350("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str351("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str352("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str353("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str354("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str355("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str356("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str357("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str358("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str359("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str360("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str361("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str362("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str363("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str364("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str365("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str367("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str368("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str369("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str370("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str371("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str373("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str374("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str376("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str377("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str378("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str379("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str380("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str381("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str382("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str383("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str384("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str385("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str386("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str387("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str388("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str389("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str390("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str391("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str392("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str393("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str394("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str395("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str396("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str397("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str398("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str399("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str400("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str401("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str402("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str403("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str404("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str405("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str406("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str407("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str408("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str409("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str410("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str411("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str412("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str413("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str414("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str415("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str416("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str417("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str418("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str419("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str420("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str421("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str422("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str423("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str424("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str425("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str426("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str427("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str428("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str429("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str430("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str431("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str432("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str433("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str434("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str435("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str436("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str437("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str438("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str439("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str440("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str441("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str442("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str443("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str444("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str445("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str446("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str447("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str448("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str449("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str450("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str451("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str452("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str453("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str455("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str456("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str457("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str458("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str459("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str460("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str461("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str462("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str463("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str464("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str465("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str466("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str467("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str468("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str469("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str470("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str471("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str472("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str473("NONWRITERS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str474("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str475("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str476("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str477("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str478("BACKQUOTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str479("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str480("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("UNQUOTE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str482("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str483("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str484("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str485("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str486("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str487("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str488("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str489("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str490("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str491("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str492("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str493("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str494("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str495("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str496("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str497("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str498("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str499("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str500("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str501("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str502("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str503("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str504("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str505("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str506("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str507("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str508("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str509("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str511("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str512("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str513("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str514("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str515("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str516("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str517("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str518("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str519("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str520("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str521("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str522("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str523("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str524("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str525("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str526("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str527("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str528("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str529("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str530("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str531("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str532("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str533("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str534("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str535("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str536("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str537("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str538("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str539("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str540("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str541("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str542("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str543("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str544("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str545("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str546("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str547("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str548("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str549("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str550("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str551("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str552("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str553("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str554("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str555("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str556("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str557("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str558("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str559("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str560("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str561("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str562("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str563("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str564("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str565("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str566("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str567("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str568("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str569("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str570("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str571("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str572("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str573("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str574("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str575("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str576("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str577("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str578("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str579("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str580("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str581("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str582("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str583("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str584("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str585("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str586("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str587("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str588("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str589("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str590("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str591("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str592("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str593("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str594("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str595("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str596("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str597("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str598("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str599("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str600("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str601("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str602("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str603("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str604("*__MLIR_BLOCK_RETVALUE_120590987952134*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str605("*__MLIR_BLOCK_RETMVLIST_120590987952134*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str606("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str607("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str608("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str609("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str610("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str611("*__MLIR_BLOCK_RETVALUE_120590987952134*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str612("*__MLIR_BLOCK_RETMVLIST_120590987952134*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str613("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str614("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str615("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str616("*__MLIR_BLOCK_RETVALUE_120590987952134*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str617("*__MLIR_BLOCK_RETMVLIST_120590987952134*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str618("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str619("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str620("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str621("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str622("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str623("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str624("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str625("*__MLIR_BLOCK_RETMVLIST_120590987952128*\00") : !llvm.array<41 x i8>
}
