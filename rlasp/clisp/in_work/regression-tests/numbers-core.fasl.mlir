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
      %57 = arith.constant 31 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 4 : i64
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
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @cc_cons(%82, %81) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %84 = arith.addi %83, %__rlasp_stack_elide_zero_3 : i64
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @cc_cons(%85, %84) : (i64, i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %87 = llvm.mlir.addressof @str8 : !llvm.ptr
      %88 = arith.constant 15 : i64
      %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
      %90 = func.call @cc_nil_value() : () -> i64
      %91 = func.call @cc_intern(%89, %90) : (i64, i64) -> i64
      %92 = func.call @cc_nil_value() : () -> i64
      %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
      %94 = func.call @cc_values_pack(%93) : (i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %95 = llvm.mlir.addressof @str9 : !llvm.ptr
      %96 = arith.constant 4 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = llvm.mlir.addressof @str10 : !llvm.ptr
      %99 = arith.constant 11 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = func.call @cc_intern(%97, %100) : (i64, i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_cons(%101, %102) : (i64, i64) -> i64
      %104 = func.call @cc_values_pack(%103) : (i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      %105 = llvm.mlir.addressof @str11 : !llvm.ptr
      %106 = arith.constant 26 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = llvm.mlir.addressof @str12 : !llvm.ptr
      %109 = arith.constant 11 : i64
      %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
      %111 = func.call @cc_intern(%107, %110) : (i64, i64) -> i64
      %112 = func.call @cc_nil_value() : () -> i64
      %113 = func.call @cc_cons(%111, %112) : (i64, i64) -> i64
      %114 = func.call @cc_values_pack(%113) : (i64) -> i64
      func.call @stack_push_pointer(%111) : (i64) -> ()
      %115 = arith.constant -3.0 : f64
      %116 = func.call @cc_box_single_float(%115) : (f64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %117 = arith.constant 0.0 : f64
      %118 = func.call @cc_box_single_float(%117) : (f64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      %119 = arith.constant 3.0 : f64
      %120 = func.call @cc_box_single_float(%119) : (f64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %121 = llvm.mlir.addressof @str13 : !llvm.ptr
      %122 = arith.constant 26 : i64
      %123 = func.call @cc_make_string(%121, %122) : (!llvm.ptr, i64) -> i64
      %124 = llvm.mlir.addressof @str14 : !llvm.ptr
      %125 = arith.constant 11 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = func.call @cc_intern(%123, %126) : (i64, i64) -> i64
      %128 = func.call @cc_nil_value() : () -> i64
      %129 = func.call @cc_cons(%127, %128) : (i64, i64) -> i64
      %130 = func.call @cc_values_pack(%129) : (i64) -> i64
      func.call @stack_push_pointer(%127) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @stack_pop_pointer() : () -> i64
      %133 = func.call @cc_cons(%132, %131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %134 = arith.addi %133, %__rlasp_stack_elide_zero_4 : i64
      %135 = func.call @stack_pop_pointer() : () -> i64
      %136 = func.call @cc_cons(%135, %134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %137 = arith.addi %136, %__rlasp_stack_elide_zero_5 : i64
      %138 = func.call @stack_pop_pointer() : () -> i64
      %139 = func.call @cc_cons(%138, %137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %140 = arith.addi %139, %__rlasp_stack_elide_zero_6 : i64
      %141 = func.call @stack_pop_pointer() : () -> i64
      %142 = func.call @cc_cons(%141, %140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %143 = arith.addi %142, %__rlasp_stack_elide_zero_7 : i64
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @cc_cons(%144, %143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %146 = arith.addi %145, %__rlasp_stack_elide_zero_8 : i64
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @cc_cons(%147, %146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = func.call @stack_pop_pointer() : () -> i64
      %151 = func.call @cc_cons(%150, %149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %152 = arith.addi %151, %__rlasp_stack_elide_zero_9 : i64
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @cc_cons(%153, %152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      %155 = llvm.mlir.addressof @str15 : !llvm.ptr
      %156 = arith.constant 4 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = func.call @cc_intern(%157, %158) : (i64, i64) -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = func.call @cc_values_pack(%161) : (i64) -> i64
      func.call @stack_push_pointer(%159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %163 = func.call @stack_pop_pointer() : () -> i64
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @cc_cons(%164, %163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %166 = arith.addi %165, %__rlasp_stack_elide_zero_10 : i64
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_cons(%167, %166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %169 = llvm.mlir.addressof @str16 : !llvm.ptr
      %170 = arith.constant 15 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      %173 = func.call @cc_intern(%171, %172) : (i64, i64) -> i64
      %174 = func.call @cc_nil_value() : () -> i64
      %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
      %176 = func.call @cc_values_pack(%175) : (i64) -> i64
      func.call @stack_push_pointer(%173) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @stack_pop_pointer() : () -> i64
      %179 = func.call @cc_cons(%178, %177) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %180 = arith.addi %179, %__rlasp_stack_elide_zero_11 : i64
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @cc_cons(%181, %180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %183 = func.call @stack_pop_pointer() : () -> i64
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = func.call @cc_cons(%184, %183) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %186 = arith.addi %185, %__rlasp_stack_elide_zero_12 : i64
      %187 = func.call @stack_pop_pointer() : () -> i64
      %188 = func.call @cc_cons(%187, %186) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %189 = arith.addi %188, %__rlasp_stack_elide_zero_13 : i64
      %190 = func.call @stack_pop_pointer() : () -> i64
      %191 = func.call @cc_cons(%190, %189) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %192 = arith.addi %191, %__rlasp_stack_elide_zero_14 : i64
      %193 = func.call @stack_pop_pointer() : () -> i64
      %194 = func.call @cc_cons(%193, %192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      %195 = llvm.mlir.addressof @str17 : !llvm.ptr
      %196 = arith.constant 5 : i64
      %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
      %198 = func.call @cc_nil_value() : () -> i64
      %199 = func.call @cc_intern(%197, %198) : (i64, i64) -> i64
      %200 = func.call @cc_nil_value() : () -> i64
      %201 = func.call @cc_cons(%199, %200) : (i64, i64) -> i64
      %202 = func.call @cc_values_pack(%201) : (i64) -> i64
      func.call @stack_push_pointer(%199) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %203 = llvm.mlir.addressof @str18 : !llvm.ptr
      %204 = arith.constant 5 : i64
      %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
      %206 = llvm.mlir.addressof @str19 : !llvm.ptr
      %207 = arith.constant 3 : i64
      %208 = func.call @cc_make_string(%206, %207) : (!llvm.ptr, i64) -> i64
      %209 = func.call @cc_intern(%205, %208) : (i64, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_cons(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %213 = llvm.mlir.addressof @str20 : !llvm.ptr
      %214 = arith.constant 15 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_intern(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_cons(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_values_pack(%219) : (i64) -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %221 = llvm.mlir.addressof @str21 : !llvm.ptr
      %222 = arith.constant 5 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_intern(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_cons(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_values_pack(%227) : (i64) -> i64
      func.call @stack_push_pointer(%225) : (i64) -> ()
      %229 = llvm.mlir.addressof @str22 : !llvm.ptr
      %230 = arith.constant 2 : i64
      %231 = func.call @cc_make_string(%229, %230) : (!llvm.ptr, i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_intern(%231, %232) : (i64, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_cons(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_values_pack(%235) : (i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      %237 = llvm.mlir.addressof @str23 : !llvm.ptr
      %238 = arith.constant 3 : i64
      %239 = func.call @cc_make_string(%237, %238) : (!llvm.ptr, i64) -> i64
      %240 = func.call @cc_nil_value() : () -> i64
      %241 = func.call @cc_intern(%239, %240) : (i64, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_cons(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_values_pack(%243) : (i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
      %245 = llvm.mlir.addressof @str24 : !llvm.ptr
      %246 = arith.constant 3 : i64
      %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_intern(%247, %248) : (i64, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_values_pack(%251) : (i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      %253 = llvm.mlir.addressof @str25 : !llvm.ptr
      %254 = arith.constant 4 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_intern(%255, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %261 = llvm.mlir.addressof @str26 : !llvm.ptr
      %262 = arith.constant 15 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_intern(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      func.call @stack_push_pointer(%265) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %269 = func.call @stack_pop_pointer() : () -> i64
      %270 = func.call @stack_pop_pointer() : () -> i64
      %271 = func.call @cc_cons(%270, %269) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %272 = arith.addi %271, %__rlasp_stack_elide_zero_15 : i64
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = func.call @cc_cons(%273, %272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%274) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %275 = func.call @stack_pop_pointer() : () -> i64
      %276 = func.call @stack_pop_pointer() : () -> i64
      %277 = func.call @cc_cons(%276, %275) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %278 = arith.addi %277, %__rlasp_stack_elide_zero_16 : i64
      %279 = func.call @stack_pop_pointer() : () -> i64
      %280 = func.call @cc_cons(%279, %278) : (i64, i64) -> i64
      func.call @stack_push_pointer(%280) : (i64) -> ()
      %281 = llvm.mlir.addressof @str27 : !llvm.ptr
      %282 = arith.constant 3 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_intern(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_nil_value() : () -> i64
      %287 = func.call @cc_cons(%285, %286) : (i64, i64) -> i64
      %288 = func.call @cc_values_pack(%287) : (i64) -> i64
      func.call @stack_push_pointer(%285) : (i64) -> ()
      %289 = llvm.mlir.addressof @str28 : !llvm.ptr
      %290 = arith.constant 5 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_values_pack(%295) : (i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %297 = llvm.mlir.addressof @str29 : !llvm.ptr
      %298 = arith.constant 15 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_intern(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_nil_value() : () -> i64
      %303 = func.call @cc_cons(%301, %302) : (i64, i64) -> i64
      %304 = func.call @cc_values_pack(%303) : (i64) -> i64
      func.call @stack_push_pointer(%301) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %305 = func.call @stack_pop_pointer() : () -> i64
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @cc_cons(%306, %305) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %308 = arith.addi %307, %__rlasp_stack_elide_zero_17 : i64
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @cc_cons(%309, %308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %311 = func.call @stack_pop_pointer() : () -> i64
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_cons(%312, %311) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %314 = arith.addi %313, %__rlasp_stack_elide_zero_18 : i64
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = func.call @cc_cons(%315, %314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%318, %317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %320 = arith.addi %319, %__rlasp_stack_elide_zero_19 : i64
      %321 = func.call @stack_pop_pointer() : () -> i64
      %322 = func.call @cc_cons(%321, %320) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %323 = arith.addi %322, %__rlasp_stack_elide_zero_20 : i64
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @cc_cons(%324, %323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %326 = llvm.mlir.addressof @str30 : !llvm.ptr
      %327 = arith.constant 11 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_intern(%328, %329) : (i64, i64) -> i64
      %331 = func.call @cc_nil_value() : () -> i64
      %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
      %333 = func.call @cc_values_pack(%332) : (i64) -> i64
      func.call @stack_push_pointer(%330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %334 = llvm.mlir.addressof @str31 : !llvm.ptr
      %335 = arith.constant 5 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = func.call @cc_nil_value() : () -> i64
      %338 = func.call @cc_intern(%336, %337) : (i64, i64) -> i64
      %339 = func.call @cc_nil_value() : () -> i64
      %340 = func.call @cc_cons(%338, %339) : (i64, i64) -> i64
      %341 = func.call @cc_values_pack(%340) : (i64) -> i64
      func.call @stack_push_pointer(%338) : (i64) -> ()
      %342 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%342) : (i64) -> ()
      %343 = llvm.mlir.addressof @str32 : !llvm.ptr
      %344 = arith.constant 10 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = func.call @cc_nil_value() : () -> i64
      %347 = func.call @cc_intern(%345, %346) : (i64, i64) -> i64
      %348 = func.call @cc_nil_value() : () -> i64
      %349 = func.call @cc_cons(%347, %348) : (i64, i64) -> i64
      %350 = func.call @cc_values_pack(%349) : (i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %351 = arith.addi %347, %__rlasp_stack_elide_zero_21 : i64
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
      %354 = llvm.mlir.addressof @str33 : !llvm.ptr
      %355 = arith.constant 5 : i64
      %356 = func.call @cc_make_string(%354, %355) : (!llvm.ptr, i64) -> i64
      %357 = func.call @cc_nil_value() : () -> i64
      %358 = func.call @cc_intern(%356, %357) : (i64, i64) -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_cons(%358, %359) : (i64, i64) -> i64
      %361 = func.call @cc_values_pack(%360) : (i64) -> i64
      %362 = func.call @cc_cons(%358, %353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @cc_cons(%364, %363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %366 = arith.addi %365, %__rlasp_stack_elide_zero_22 : i64
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @cc_cons(%367, %366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%368) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = func.call @cc_cons(%370, %369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %372 = arith.addi %371, %__rlasp_stack_elide_zero_23 : i64
      %373 = func.call @stack_pop_pointer() : () -> i64
      %374 = func.call @cc_cons(%373, %372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %375 = arith.addi %374, %__rlasp_stack_elide_zero_24 : i64
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = func.call @cc_cons(%376, %375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %378 = func.call @stack_pop_pointer() : () -> i64
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @cc_cons(%379, %378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %381 = arith.addi %380, %__rlasp_stack_elide_zero_25 : i64
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @cc_cons(%382, %381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %384 = arith.addi %383, %__rlasp_stack_elide_zero_26 : i64
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @cc_cons(%385, %384) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %387 = arith.addi %386, %__rlasp_stack_elide_zero_27 : i64
      %388 = func.call @stack_pop_pointer() : () -> i64
      %389 = func.call @cc_cons(%388, %387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%389) : (i64) -> ()
      %390 = llvm.mlir.addressof @str34 : !llvm.ptr
      %391 = arith.constant 4 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_intern(%392, %393) : (i64, i64) -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
      %397 = func.call @cc_values_pack(%396) : (i64) -> i64
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %398 = llvm.mlir.addressof @str35 : !llvm.ptr
      %399 = arith.constant 3 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      %406 = llvm.mlir.addressof @str36 : !llvm.ptr
      %407 = arith.constant 3 : i64
      %408 = func.call @cc_make_string(%406, %407) : (!llvm.ptr, i64) -> i64
      %409 = func.call @cc_nil_value() : () -> i64
      %410 = func.call @cc_intern(%408, %409) : (i64, i64) -> i64
      %411 = func.call @cc_nil_value() : () -> i64
      %412 = func.call @cc_cons(%410, %411) : (i64, i64) -> i64
      %413 = func.call @cc_values_pack(%412) : (i64) -> i64
      func.call @stack_push_pointer(%410) : (i64) -> ()
      %414 = llvm.mlir.addressof @str37 : !llvm.ptr
      %415 = arith.constant 15 : i64
      %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
      %417 = func.call @cc_nil_value() : () -> i64
      %418 = func.call @cc_intern(%416, %417) : (i64, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_values_pack(%420) : (i64) -> i64
      func.call @stack_push_pointer(%418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %422 = func.call @stack_pop_pointer() : () -> i64
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @cc_cons(%423, %422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %425 = arith.addi %424, %__rlasp_stack_elide_zero_28 : i64
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @cc_cons(%426, %425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %431 = arith.addi %430, %__rlasp_stack_elide_zero_29 : i64
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @cc_cons(%432, %431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %434 = arith.addi %433, %__rlasp_stack_elide_zero_30 : i64
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_cons(%435, %434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      %437 = llvm.mlir.addressof @str38 : !llvm.ptr
      %438 = arith.constant 4 : i64
      %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_intern(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_nil_value() : () -> i64
      %443 = func.call @cc_cons(%441, %442) : (i64, i64) -> i64
      %444 = func.call @cc_values_pack(%443) : (i64) -> i64
      func.call @stack_push_pointer(%441) : (i64) -> ()
      %445 = llvm.mlir.addressof @str39 : !llvm.ptr
      %446 = arith.constant 4 : i64
      %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_intern(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_values_pack(%451) : (i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %453 = llvm.mlir.addressof @str40 : !llvm.ptr
      %454 = arith.constant 20 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = llvm.mlir.addressof @str41 : !llvm.ptr
      %457 = arith.constant 3 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      %463 = llvm.mlir.addressof @str42 : !llvm.ptr
      %464 = arith.constant 3 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = func.call @cc_nil_value() : () -> i64
      %467 = func.call @cc_intern(%465, %466) : (i64, i64) -> i64
      %468 = func.call @cc_nil_value() : () -> i64
      %469 = func.call @cc_cons(%467, %468) : (i64, i64) -> i64
      %470 = func.call @cc_values_pack(%469) : (i64) -> i64
      func.call @stack_push_pointer(%467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @cc_cons(%472, %471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %474 = arith.addi %473, %__rlasp_stack_elide_zero_31 : i64
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @cc_cons(%475, %474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @cc_cons(%478, %477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %480 = arith.addi %479, %__rlasp_stack_elide_zero_32 : i64
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @cc_cons(%481, %480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %483 = arith.addi %482, %__rlasp_stack_elide_zero_33 : i64
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @cc_cons(%484, %483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%485) : (i64) -> ()
      %486 = llvm.mlir.addressof @str43 : !llvm.ptr
      %487 = arith.constant 2 : i64
      %488 = func.call @cc_make_string(%486, %487) : (!llvm.ptr, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_intern(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_nil_value() : () -> i64
      %492 = func.call @cc_cons(%490, %491) : (i64, i64) -> i64
      %493 = func.call @cc_values_pack(%492) : (i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %494 = llvm.mlir.addressof @str44 : !llvm.ptr
      %495 = arith.constant 3 : i64
      %496 = func.call @cc_make_string(%494, %495) : (!llvm.ptr, i64) -> i64
      %497 = func.call @cc_nil_value() : () -> i64
      %498 = func.call @cc_intern(%496, %497) : (i64, i64) -> i64
      %499 = func.call @cc_nil_value() : () -> i64
      %500 = func.call @cc_cons(%498, %499) : (i64, i64) -> i64
      %501 = func.call @cc_values_pack(%500) : (i64) -> i64
      func.call @stack_push_pointer(%498) : (i64) -> ()
      %502 = llvm.mlir.addressof @str45 : !llvm.ptr
      %503 = arith.constant 1 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = llvm.mlir.addressof @str46 : !llvm.ptr
      %506 = arith.constant 11 : i64
      %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
      %508 = func.call @cc_intern(%504, %507) : (i64, i64) -> i64
      %509 = func.call @cc_nil_value() : () -> i64
      %510 = func.call @cc_cons(%508, %509) : (i64, i64) -> i64
      %511 = func.call @cc_values_pack(%510) : (i64) -> i64
      func.call @stack_push_pointer(%508) : (i64) -> ()
      %512 = llvm.mlir.addressof @str47 : !llvm.ptr
      %513 = arith.constant 3 : i64
      %514 = func.call @cc_make_string(%512, %513) : (!llvm.ptr, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_intern(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_nil_value() : () -> i64
      %518 = func.call @cc_cons(%516, %517) : (i64, i64) -> i64
      %519 = func.call @cc_values_pack(%518) : (i64) -> i64
      func.call @stack_push_pointer(%516) : (i64) -> ()
      %520 = llvm.mlir.addressof @str48 : !llvm.ptr
      %521 = arith.constant 20 : i64
      %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
      %523 = llvm.mlir.addressof @str49 : !llvm.ptr
      %524 = arith.constant 3 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      %526 = func.call @cc_intern(%522, %525) : (i64, i64) -> i64
      %527 = func.call @cc_nil_value() : () -> i64
      %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
      %529 = func.call @cc_values_pack(%528) : (i64) -> i64
      func.call @stack_push_pointer(%526) : (i64) -> ()
      %530 = llvm.mlir.addressof @str50 : !llvm.ptr
      %531 = arith.constant 4 : i64
      %532 = func.call @cc_make_string(%530, %531) : (!llvm.ptr, i64) -> i64
      %533 = func.call @cc_nil_value() : () -> i64
      %534 = func.call @cc_intern(%532, %533) : (i64, i64) -> i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_cons(%534, %535) : (i64, i64) -> i64
      %537 = func.call @cc_values_pack(%536) : (i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_cons(%539, %538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %541 = arith.addi %540, %__rlasp_stack_elide_zero_34 : i64
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @cc_cons(%542, %541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %544 = func.call @stack_pop_pointer() : () -> i64
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @cc_cons(%545, %544) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %547 = arith.addi %546, %__rlasp_stack_elide_zero_35 : i64
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @cc_cons(%548, %547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %550 = arith.addi %549, %__rlasp_stack_elide_zero_36 : i64
      %551 = func.call @stack_pop_pointer() : () -> i64
      %552 = func.call @cc_cons(%551, %550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @cc_cons(%554, %553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %556 = arith.addi %555, %__rlasp_stack_elide_zero_37 : i64
      %557 = func.call @stack_pop_pointer() : () -> i64
      %558 = func.call @cc_cons(%557, %556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %559 = llvm.mlir.addressof @str51 : !llvm.ptr
      %560 = arith.constant 5 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_intern(%561, %562) : (i64, i64) -> i64
      %564 = func.call @cc_nil_value() : () -> i64
      %565 = func.call @cc_cons(%563, %564) : (i64, i64) -> i64
      %566 = func.call @cc_values_pack(%565) : (i64) -> i64
      func.call @stack_push_pointer(%563) : (i64) -> ()
      %567 = llvm.mlir.addressof @str52 : !llvm.ptr
      %568 = arith.constant 4 : i64
      %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
      %570 = func.call @cc_nil_value() : () -> i64
      %571 = func.call @cc_intern(%569, %570) : (i64, i64) -> i64
      %572 = func.call @cc_nil_value() : () -> i64
      %573 = func.call @cc_cons(%571, %572) : (i64, i64) -> i64
      %574 = func.call @cc_values_pack(%573) : (i64) -> i64
      func.call @stack_push_pointer(%571) : (i64) -> ()
      %575 = llvm.mlir.addressof @str53 : !llvm.ptr
      %576 = arith.constant 15 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_nil_value() : () -> i64
      %579 = func.call @cc_intern(%577, %578) : (i64, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_values_pack(%581) : (i64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %583 = llvm.mlir.addressof @str54 : !llvm.ptr
      %584 = arith.constant 6 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_nil_value() : () -> i64
      %587 = func.call @cc_intern(%585, %586) : (i64, i64) -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
      %590 = func.call @cc_values_pack(%589) : (i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %591 = llvm.mlir.addressof @str55 : !llvm.ptr
      %592 = arith.constant 15 : i64
      %593 = func.call @cc_make_string(%591, %592) : (!llvm.ptr, i64) -> i64
      %594 = func.call @cc_nil_value() : () -> i64
      %595 = func.call @cc_intern(%593, %594) : (i64, i64) -> i64
      %596 = func.call @cc_nil_value() : () -> i64
      %597 = func.call @cc_cons(%595, %596) : (i64, i64) -> i64
      %598 = func.call @cc_values_pack(%597) : (i64) -> i64
      func.call @stack_push_pointer(%595) : (i64) -> ()
      %599 = llvm.mlir.addressof @str56 : !llvm.ptr
      %600 = arith.constant 4 : i64
      %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
      %602 = func.call @cc_nil_value() : () -> i64
      %603 = func.call @cc_intern(%601, %602) : (i64, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_cons(%603, %604) : (i64, i64) -> i64
      %606 = func.call @cc_values_pack(%605) : (i64) -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      %607 = llvm.mlir.addressof @str57 : !llvm.ptr
      %608 = arith.constant 3 : i64
      %609 = func.call @cc_make_string(%607, %608) : (!llvm.ptr, i64) -> i64
      %610 = func.call @cc_nil_value() : () -> i64
      %611 = func.call @cc_intern(%609, %610) : (i64, i64) -> i64
      %612 = func.call @cc_nil_value() : () -> i64
      %613 = func.call @cc_cons(%611, %612) : (i64, i64) -> i64
      %614 = func.call @cc_values_pack(%613) : (i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %615 = func.call @stack_pop_pointer() : () -> i64
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = func.call @cc_cons(%616, %615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %618 = arith.addi %617, %__rlasp_stack_elide_zero_38 : i64
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @cc_cons(%619, %618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%620) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %621 = func.call @stack_pop_pointer() : () -> i64
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @cc_cons(%622, %621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %624 = arith.addi %623, %__rlasp_stack_elide_zero_39 : i64
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @cc_cons(%625, %624) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %627 = arith.addi %626, %__rlasp_stack_elide_zero_40 : i64
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @cc_cons(%628, %627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @cc_cons(%631, %630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %633 = arith.addi %632, %__rlasp_stack_elide_zero_41 : i64
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @cc_cons(%634, %633) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %636 = arith.addi %635, %__rlasp_stack_elide_zero_42 : i64
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @cc_cons(%637, %636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%638) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %639 = func.call @stack_pop_pointer() : () -> i64
      %640 = func.call @stack_pop_pointer() : () -> i64
      %641 = func.call @cc_cons(%640, %639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %642 = arith.addi %641, %__rlasp_stack_elide_zero_43 : i64
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @cc_cons(%643, %642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @cc_cons(%646, %645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %648 = arith.addi %647, %__rlasp_stack_elide_zero_44 : i64
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = func.call @cc_cons(%649, %648) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %651 = arith.addi %650, %__rlasp_stack_elide_zero_45 : i64
      %652 = func.call @stack_pop_pointer() : () -> i64
      %653 = func.call @cc_cons(%652, %651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %654 = arith.addi %653, %__rlasp_stack_elide_zero_46 : i64
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @cc_cons(%655, %654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @cc_cons(%658, %657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %660 = arith.addi %659, %__rlasp_stack_elide_zero_47 : i64
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @cc_cons(%661, %660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %663 = arith.addi %662, %__rlasp_stack_elide_zero_48 : i64
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @cc_cons(%664, %663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %666 = arith.addi %665, %__rlasp_stack_elide_zero_49 : i64
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @cc_cons(%667, %666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %669 = arith.addi %668, %__rlasp_stack_elide_zero_50 : i64
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @cc_cons(%670, %669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %672 = llvm.mlir.addressof @str58 : !llvm.ptr
      %673 = arith.constant 4 : i64
      %674 = func.call @cc_make_string(%672, %673) : (!llvm.ptr, i64) -> i64
      %675 = func.call @cc_nil_value() : () -> i64
      %676 = func.call @cc_intern(%674, %675) : (i64, i64) -> i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = func.call @cc_cons(%676, %677) : (i64, i64) -> i64
      %679 = func.call @cc_values_pack(%678) : (i64) -> i64
      func.call @stack_push_pointer(%676) : (i64) -> ()
      %680 = llvm.mlir.addressof @str59 : !llvm.ptr
      %681 = arith.constant 15 : i64
      %682 = func.call @cc_make_string(%680, %681) : (!llvm.ptr, i64) -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_intern(%682, %683) : (i64, i64) -> i64
      %685 = func.call @cc_nil_value() : () -> i64
      %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
      %687 = func.call @cc_values_pack(%686) : (i64) -> i64
      func.call @stack_push_pointer(%684) : (i64) -> ()
      %688 = llvm.mlir.addressof @str60 : !llvm.ptr
      %689 = arith.constant 3 : i64
      %690 = func.call @cc_make_string(%688, %689) : (!llvm.ptr, i64) -> i64
      %691 = func.call @cc_nil_value() : () -> i64
      %692 = func.call @cc_intern(%690, %691) : (i64, i64) -> i64
      %693 = func.call @cc_nil_value() : () -> i64
      %694 = func.call @cc_cons(%692, %693) : (i64, i64) -> i64
      %695 = func.call @cc_values_pack(%694) : (i64) -> i64
      func.call @stack_push_pointer(%692) : (i64) -> ()
      %696 = llvm.mlir.addressof @str61 : !llvm.ptr
      %697 = arith.constant 15 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_intern(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_cons(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_values_pack(%702) : (i64) -> i64
      func.call @stack_push_pointer(%700) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %704 = func.call @stack_pop_pointer() : () -> i64
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @cc_cons(%705, %704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %707 = arith.addi %706, %__rlasp_stack_elide_zero_51 : i64
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_cons(%708, %707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %713 = arith.addi %712, %__rlasp_stack_elide_zero_52 : i64
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @cc_cons(%714, %713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %716 = arith.addi %715, %__rlasp_stack_elide_zero_53 : i64
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @cc_cons(%717, %716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%718) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @cc_cons(%720, %719) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %722 = arith.addi %721, %__rlasp_stack_elide_zero_54 : i64
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @cc_cons(%723, %722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %725 = arith.addi %724, %__rlasp_stack_elide_zero_55 : i64
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @cc_cons(%726, %725) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %728 = arith.addi %727, %__rlasp_stack_elide_zero_56 : i64
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @cc_cons(%729, %728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%730) : (i64) -> ()
      %731 = llvm.mlir.addressof @str62 : !llvm.ptr
      %732 = arith.constant 15 : i64
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
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %742 = arith.addi %741, %__rlasp_stack_elide_zero_57 : i64
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @cc_cons(%743, %742) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %745 = arith.addi %744, %__rlasp_stack_elide_zero_58 : i64
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @cc_cons(%746, %745) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %748 = arith.addi %747, %__rlasp_stack_elide_zero_59 : i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %754 = arith.addi %753, %__rlasp_stack_elide_zero_60 : i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %757 = arith.addi %756, %__rlasp_stack_elide_zero_61 : i64
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @cc_cons(%758, %757) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %760 = arith.addi %759, %__rlasp_stack_elide_zero_62 : i64
      %1139 = arith.constant 162741310455809 : i64
      %1140 = arith.constant 0 : i64
      %1141 = func.call @cc_make_closure(%1139, %1140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1142 = arith.addi %1141, %__rlasp_stack_elide_zero_63 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @cc_cons(%1144, %1143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1146 = arith.addi %1145, %__rlasp_stack_elide_zero_64 : i64
      %1147 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1148 = arith.constant 11 : i64
      %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
      %1150 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1151 = arith.constant 7 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = func.call @cc_intern(%1149, %1152) : (i64, i64) -> i64
      %1154 = func.call @cc_nil_value() : () -> i64
      %1155 = func.call @cc_cons(%1153, %1154) : (i64, i64) -> i64
      %1156 = func.call @cc_values_pack(%1155) : (i64) -> i64
      %1157 = func.call @cc_nil_value() : () -> i64
      %1158 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1159 = arith.constant 4 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1162 = arith.constant 7 : i64
      %1163 = func.call @cc_make_string(%1161, %1162) : (!llvm.ptr, i64) -> i64
      %1164 = func.call @cc_intern(%1160, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
      %1167 = func.call @cc_values_pack(%1166) : (i64) -> i64
      %1168 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1169 = arith.constant 6 : i64
      %1170 = func.call @cc_make_string(%1168, %1169) : (!llvm.ptr, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_intern(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_cons(%1172, %1173) : (i64, i64) -> i64
      %1175 = func.call @cc_values_pack(%1174) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1176 = arith.addi %1172, %__rlasp_stack_elide_zero_65 : i64
      %1177 = func.call @cc_nil_value() : () -> i64
      %1178 = func.call @cc_errorp(%64) : (i64) -> i64
      %1179 = arith.cmpi ne, %1178, %1177 : i64
      %1180 = arith.cmpi eq, %1177, %1177 : i64
      %1181 = arith.andi %1179, %1180 : i1
      %1182 = scf.if %1181 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %1177 : i64
      }
      %1183 = func.call @cc_errorp(%760) : (i64) -> i64
      %1184 = arith.cmpi ne, %1183, %1177 : i64
      %1185 = arith.cmpi eq, %1182, %1177 : i64
      %1186 = arith.andi %1184, %1185 : i1
      %1187 = scf.if %1186 -> (i64) {
        scf.yield %760 : i64
      } else {
        scf.yield %1182 : i64
      }
      %1188 = func.call @cc_errorp(%1142) : (i64) -> i64
      %1189 = arith.cmpi ne, %1188, %1177 : i64
      %1190 = arith.cmpi eq, %1187, %1177 : i64
      %1191 = arith.andi %1189, %1190 : i1
      %1192 = scf.if %1191 -> (i64) {
        scf.yield %1142 : i64
      } else {
        scf.yield %1187 : i64
      }
      %1193 = func.call @cc_errorp(%1146) : (i64) -> i64
      %1194 = arith.cmpi ne, %1193, %1177 : i64
      %1195 = arith.cmpi eq, %1192, %1177 : i64
      %1196 = arith.andi %1194, %1195 : i1
      %1197 = scf.if %1196 -> (i64) {
        scf.yield %1146 : i64
      } else {
        scf.yield %1192 : i64
      }
      %1198 = func.call @cc_errorp(%1153) : (i64) -> i64
      %1199 = arith.cmpi ne, %1198, %1177 : i64
      %1200 = arith.cmpi eq, %1197, %1177 : i64
      %1201 = arith.andi %1199, %1200 : i1
      %1202 = scf.if %1201 -> (i64) {
        scf.yield %1153 : i64
      } else {
        scf.yield %1197 : i64
      }
      %1203 = func.call @cc_errorp(%1157) : (i64) -> i64
      %1204 = arith.cmpi ne, %1203, %1177 : i64
      %1205 = arith.cmpi eq, %1202, %1177 : i64
      %1206 = arith.andi %1204, %1205 : i1
      %1207 = scf.if %1206 -> (i64) {
        scf.yield %1157 : i64
      } else {
        scf.yield %1202 : i64
      }
      %1208 = func.call @cc_errorp(%1164) : (i64) -> i64
      %1209 = arith.cmpi ne, %1208, %1177 : i64
      %1210 = arith.cmpi eq, %1207, %1177 : i64
      %1211 = arith.andi %1209, %1210 : i1
      %1212 = scf.if %1211 -> (i64) {
        scf.yield %1164 : i64
      } else {
        scf.yield %1207 : i64
      }
      %1213 = func.call @cc_errorp(%1176) : (i64) -> i64
      %1214 = arith.cmpi ne, %1213, %1177 : i64
      %1215 = arith.cmpi eq, %1212, %1177 : i64
      %1216 = arith.andi %1214, %1215 : i1
      %1217 = scf.if %1216 -> (i64) {
        scf.yield %1176 : i64
      } else {
        scf.yield %1212 : i64
      }
      %1218 = arith.cmpi ne, %1217, %1177 : i64
      scf.if %1218 {
        func.call @stack_push_pointer(%1217) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%760) : (i64) -> ()
        func.call @stack_push_pointer(%1142) : (i64) -> ()
        func.call @stack_push_pointer(%1146) : (i64) -> ()
        func.call @stack_push_pointer(%1153) : (i64) -> ()
        func.call @stack_push_pointer(%1157) : (i64) -> ()
        func.call @stack_push_pointer(%1164) : (i64) -> ()
        func.call @stack_push_pointer(%1176) : (i64) -> ()
        %1219 = llvm.mlir.addressof @str87 : !llvm.ptr
        %1220 = func.call @cc_make_function_ref_const(%1219) : (!llvm.ptr) -> i64
        %1221 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1220, %1221) : (i64, i64) -> ()
      }
      %1222 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1222 : i64
    }
    %1223 = func.call @cc_nil_value() : () -> i64
    %1224 = func.call @cc_errorp(%55) : (i64) -> i64
    %1225 = arith.cmpi ne, %1224, %1223 : i64
    %1226 = scf.if %1225 -> (i64) {
      scf.yield %55 : i64
    } else {
      %1227 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1228 = arith.constant 27 : i64
      %1229 = func.call @cc_make_string(%1227, %1228) : (!llvm.ptr, i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = func.call @cc_intern(%1229, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = func.call @cc_cons(%1231, %1232) : (i64, i64) -> i64
      %1234 = func.call @cc_values_pack(%1233) : (i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1235 = arith.addi %1231, %__rlasp_stack_elide_zero_66 : i64
      %1236 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1237 = arith.constant 13 : i64
      %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
      %1239 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1240 = arith.constant 11 : i64
      %1241 = func.call @cc_make_string(%1239, %1240) : (!llvm.ptr, i64) -> i64
      %1242 = func.call @cc_intern(%1238, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_cons(%1242, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_values_pack(%1244) : (i64) -> i64
      func.call @stack_push_pointer(%1242) : (i64) -> ()
      %1246 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1247 = arith.constant 6 : i64
      %1248 = func.call @cc_make_string(%1246, %1247) : (!llvm.ptr, i64) -> i64
      %1249 = func.call @cc_nil_value() : () -> i64
      %1250 = func.call @cc_intern(%1248, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_nil_value() : () -> i64
      %1252 = func.call @cc_cons(%1250, %1251) : (i64, i64) -> i64
      %1253 = func.call @cc_values_pack(%1252) : (i64) -> i64
      func.call @stack_push_pointer(%1250) : (i64) -> ()
      %1254 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1255 = arith.constant 19 : i64
      %1256 = func.call @cc_make_string(%1254, %1255) : (!llvm.ptr, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_intern(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_nil_value() : () -> i64
      %1260 = func.call @cc_cons(%1258, %1259) : (i64, i64) -> i64
      %1261 = func.call @cc_values_pack(%1260) : (i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1262 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1263 = arith.constant 20 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1266 = arith.constant 3 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = func.call @cc_intern(%1264, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_cons(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1272 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @stack_pop_pointer() : () -> i64
      %1275 = func.call @cc_cons(%1274, %1273) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1276 = arith.addi %1275, %__rlasp_stack_elide_zero_67 : i64
      %1277 = func.call @stack_pop_pointer() : () -> i64
      %1278 = func.call @cc_cons(%1277, %1276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @cc_cons(%1280, %1279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1282 = arith.addi %1281, %__rlasp_stack_elide_zero_68 : i64
      %1283 = func.call @stack_pop_pointer() : () -> i64
      %1284 = func.call @cc_cons(%1283, %1282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1285 = func.call @stack_pop_pointer() : () -> i64
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @cc_cons(%1286, %1285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1288 = arith.addi %1287, %__rlasp_stack_elide_zero_69 : i64
      %1289 = func.call @stack_pop_pointer() : () -> i64
      %1290 = func.call @cc_cons(%1289, %1288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1291 = arith.addi %1290, %__rlasp_stack_elide_zero_70 : i64
      %1292 = func.call @stack_pop_pointer() : () -> i64
      %1293 = func.call @cc_cons(%1292, %1291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1294 = func.call @stack_pop_pointer() : () -> i64
      %1295 = func.call @stack_pop_pointer() : () -> i64
      %1296 = func.call @cc_cons(%1295, %1294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1297 = arith.addi %1296, %__rlasp_stack_elide_zero_71 : i64
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %1299 = func.call @cc_cons(%1298, %1297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1300 = arith.addi %1299, %__rlasp_stack_elide_zero_72 : i64
      %1356 = arith.constant 162741310455811 : i64
      %1357 = arith.constant 0 : i64
      %1358 = func.call @cc_make_closure(%1356, %1357) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1359 = arith.addi %1358, %__rlasp_stack_elide_zero_73 : i64
      %1360 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1361 = arith.constant 4 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = func.call @cc_nil_value() : () -> i64
      %1364 = func.call @cc_intern(%1362, %1363) : (i64, i64) -> i64
      %1365 = func.call @cc_nil_value() : () -> i64
      %1366 = func.call @cc_cons(%1364, %1365) : (i64, i64) -> i64
      %1367 = func.call @cc_values_pack(%1366) : (i64) -> i64
      func.call @stack_push_pointer(%1364) : (i64) -> ()
      %1368 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1369 = arith.constant 5 : i64
      %1370 = func.call @cc_make_string(%1368, %1369) : (!llvm.ptr, i64) -> i64
      %1371 = func.call @cc_nil_value() : () -> i64
      %1372 = func.call @cc_intern(%1370, %1371) : (i64, i64) -> i64
      %1373 = func.call @cc_nil_value() : () -> i64
      %1374 = func.call @cc_cons(%1372, %1373) : (i64, i64) -> i64
      %1375 = func.call @cc_values_pack(%1374) : (i64) -> i64
      func.call @stack_push_pointer(%1372) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @cc_cons(%1377, %1376) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1379 = arith.addi %1378, %__rlasp_stack_elide_zero_74 : i64
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @cc_cons(%1380, %1379) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1382 = arith.addi %1381, %__rlasp_stack_elide_zero_75 : i64
      %1383 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1384 = arith.constant 11 : i64
      %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
      %1386 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1387 = arith.constant 7 : i64
      %1388 = func.call @cc_make_string(%1386, %1387) : (!llvm.ptr, i64) -> i64
      %1389 = func.call @cc_intern(%1385, %1388) : (i64, i64) -> i64
      %1390 = func.call @cc_nil_value() : () -> i64
      %1391 = func.call @cc_cons(%1389, %1390) : (i64, i64) -> i64
      %1392 = func.call @cc_values_pack(%1391) : (i64) -> i64
      %1393 = func.call @cc_nil_value() : () -> i64
      %1394 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1395 = arith.constant 4 : i64
      %1396 = func.call @cc_make_string(%1394, %1395) : (!llvm.ptr, i64) -> i64
      %1397 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1398 = arith.constant 7 : i64
      %1399 = func.call @cc_make_string(%1397, %1398) : (!llvm.ptr, i64) -> i64
      %1400 = func.call @cc_intern(%1396, %1399) : (i64, i64) -> i64
      %1401 = func.call @cc_nil_value() : () -> i64
      %1402 = func.call @cc_cons(%1400, %1401) : (i64, i64) -> i64
      %1403 = func.call @cc_values_pack(%1402) : (i64) -> i64
      %1404 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1405 = arith.constant 5 : i64
      %1406 = func.call @cc_make_string(%1404, %1405) : (!llvm.ptr, i64) -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_intern(%1406, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_nil_value() : () -> i64
      %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
      %1411 = func.call @cc_values_pack(%1410) : (i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1412 = arith.addi %1408, %__rlasp_stack_elide_zero_76 : i64
      %1413 = func.call @cc_nil_value() : () -> i64
      %1414 = func.call @cc_errorp(%1235) : (i64) -> i64
      %1415 = arith.cmpi ne, %1414, %1413 : i64
      %1416 = arith.cmpi eq, %1413, %1413 : i64
      %1417 = arith.andi %1415, %1416 : i1
      %1418 = scf.if %1417 -> (i64) {
        scf.yield %1235 : i64
      } else {
        scf.yield %1413 : i64
      }
      %1419 = func.call @cc_errorp(%1300) : (i64) -> i64
      %1420 = arith.cmpi ne, %1419, %1413 : i64
      %1421 = arith.cmpi eq, %1418, %1413 : i64
      %1422 = arith.andi %1420, %1421 : i1
      %1423 = scf.if %1422 -> (i64) {
        scf.yield %1300 : i64
      } else {
        scf.yield %1418 : i64
      }
      %1424 = func.call @cc_errorp(%1359) : (i64) -> i64
      %1425 = arith.cmpi ne, %1424, %1413 : i64
      %1426 = arith.cmpi eq, %1423, %1413 : i64
      %1427 = arith.andi %1425, %1426 : i1
      %1428 = scf.if %1427 -> (i64) {
        scf.yield %1359 : i64
      } else {
        scf.yield %1423 : i64
      }
      %1429 = func.call @cc_errorp(%1382) : (i64) -> i64
      %1430 = arith.cmpi ne, %1429, %1413 : i64
      %1431 = arith.cmpi eq, %1428, %1413 : i64
      %1432 = arith.andi %1430, %1431 : i1
      %1433 = scf.if %1432 -> (i64) {
        scf.yield %1382 : i64
      } else {
        scf.yield %1428 : i64
      }
      %1434 = func.call @cc_errorp(%1389) : (i64) -> i64
      %1435 = arith.cmpi ne, %1434, %1413 : i64
      %1436 = arith.cmpi eq, %1433, %1413 : i64
      %1437 = arith.andi %1435, %1436 : i1
      %1438 = scf.if %1437 -> (i64) {
        scf.yield %1389 : i64
      } else {
        scf.yield %1433 : i64
      }
      %1439 = func.call @cc_errorp(%1393) : (i64) -> i64
      %1440 = arith.cmpi ne, %1439, %1413 : i64
      %1441 = arith.cmpi eq, %1438, %1413 : i64
      %1442 = arith.andi %1440, %1441 : i1
      %1443 = scf.if %1442 -> (i64) {
        scf.yield %1393 : i64
      } else {
        scf.yield %1438 : i64
      }
      %1444 = func.call @cc_errorp(%1400) : (i64) -> i64
      %1445 = arith.cmpi ne, %1444, %1413 : i64
      %1446 = arith.cmpi eq, %1443, %1413 : i64
      %1447 = arith.andi %1445, %1446 : i1
      %1448 = scf.if %1447 -> (i64) {
        scf.yield %1400 : i64
      } else {
        scf.yield %1443 : i64
      }
      %1449 = func.call @cc_errorp(%1412) : (i64) -> i64
      %1450 = arith.cmpi ne, %1449, %1413 : i64
      %1451 = arith.cmpi eq, %1448, %1413 : i64
      %1452 = arith.andi %1450, %1451 : i1
      %1453 = scf.if %1452 -> (i64) {
        scf.yield %1412 : i64
      } else {
        scf.yield %1448 : i64
      }
      %1454 = arith.cmpi ne, %1453, %1413 : i64
      scf.if %1454 {
        func.call @stack_push_pointer(%1453) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1235) : (i64) -> ()
        func.call @stack_push_pointer(%1300) : (i64) -> ()
        func.call @stack_push_pointer(%1359) : (i64) -> ()
        func.call @stack_push_pointer(%1382) : (i64) -> ()
        func.call @stack_push_pointer(%1389) : (i64) -> ()
        func.call @stack_push_pointer(%1393) : (i64) -> ()
        func.call @stack_push_pointer(%1400) : (i64) -> ()
        func.call @stack_push_pointer(%1412) : (i64) -> ()
        %1455 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1456 = func.call @cc_make_function_ref_const(%1455) : (!llvm.ptr) -> i64
        %1457 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1456, %1457) : (i64, i64) -> ()
      }
      %1458 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1458 : i64
    }
    %1459 = func.call @cc_nil_value() : () -> i64
    %1460 = func.call @cc_errorp(%1226) : (i64) -> i64
    %1461 = arith.cmpi ne, %1460, %1459 : i64
    %1462 = scf.if %1461 -> (i64) {
      scf.yield %1226 : i64
    } else {
      %1463 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1464 = arith.constant 27 : i64
      %1465 = func.call @cc_make_string(%1463, %1464) : (!llvm.ptr, i64) -> i64
      %1466 = func.call @cc_nil_value() : () -> i64
      %1467 = func.call @cc_intern(%1465, %1466) : (i64, i64) -> i64
      %1468 = func.call @cc_nil_value() : () -> i64
      %1469 = func.call @cc_cons(%1467, %1468) : (i64, i64) -> i64
      %1470 = func.call @cc_values_pack(%1469) : (i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1471 = arith.addi %1467, %__rlasp_stack_elide_zero_77 : i64
      %1472 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1473 = arith.constant 13 : i64
      %1474 = func.call @cc_make_string(%1472, %1473) : (!llvm.ptr, i64) -> i64
      %1475 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1476 = arith.constant 11 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = func.call @cc_intern(%1474, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_nil_value() : () -> i64
      %1480 = func.call @cc_cons(%1478, %1479) : (i64, i64) -> i64
      %1481 = func.call @cc_values_pack(%1480) : (i64) -> i64
      func.call @stack_push_pointer(%1478) : (i64) -> ()
      %1482 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1483 = arith.constant 6 : i64
      %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
      %1485 = func.call @cc_nil_value() : () -> i64
      %1486 = func.call @cc_intern(%1484, %1485) : (i64, i64) -> i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_cons(%1486, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_values_pack(%1488) : (i64) -> i64
      func.call @stack_push_pointer(%1486) : (i64) -> ()
      %1490 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1491 = arith.constant 19 : i64
      %1492 = func.call @cc_make_string(%1490, %1491) : (!llvm.ptr, i64) -> i64
      %1493 = func.call @cc_nil_value() : () -> i64
      %1494 = func.call @cc_intern(%1492, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
      func.call @stack_push_pointer(%1494) : (i64) -> ()
      %1498 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1499 = arith.constant 20 : i64
      %1500 = func.call @cc_make_string(%1498, %1499) : (!llvm.ptr, i64) -> i64
      %1501 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1502 = arith.constant 3 : i64
      %1503 = func.call @cc_make_string(%1501, %1502) : (!llvm.ptr, i64) -> i64
      %1504 = func.call @cc_intern(%1500, %1503) : (i64, i64) -> i64
      %1505 = func.call @cc_nil_value() : () -> i64
      %1506 = func.call @cc_cons(%1504, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_values_pack(%1506) : (i64) -> i64
      func.call @stack_push_pointer(%1504) : (i64) -> ()
      %1508 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1508) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1509 = func.call @stack_pop_pointer() : () -> i64
      %1510 = func.call @stack_pop_pointer() : () -> i64
      %1511 = func.call @cc_cons(%1510, %1509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1512 = arith.addi %1511, %__rlasp_stack_elide_zero_78 : i64
      %1513 = func.call @stack_pop_pointer() : () -> i64
      %1514 = func.call @cc_cons(%1513, %1512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1515 = func.call @stack_pop_pointer() : () -> i64
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @cc_cons(%1516, %1515) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1518 = arith.addi %1517, %__rlasp_stack_elide_zero_79 : i64
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @cc_cons(%1519, %1518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1521 = func.call @stack_pop_pointer() : () -> i64
      %1522 = func.call @stack_pop_pointer() : () -> i64
      %1523 = func.call @cc_cons(%1522, %1521) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1524 = arith.addi %1523, %__rlasp_stack_elide_zero_80 : i64
      %1525 = func.call @stack_pop_pointer() : () -> i64
      %1526 = func.call @cc_cons(%1525, %1524) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1527 = arith.addi %1526, %__rlasp_stack_elide_zero_81 : i64
      %1528 = func.call @stack_pop_pointer() : () -> i64
      %1529 = func.call @cc_cons(%1528, %1527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1529) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1530 = func.call @stack_pop_pointer() : () -> i64
      %1531 = func.call @stack_pop_pointer() : () -> i64
      %1532 = func.call @cc_cons(%1531, %1530) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1533 = arith.addi %1532, %__rlasp_stack_elide_zero_82 : i64
      %1534 = func.call @stack_pop_pointer() : () -> i64
      %1535 = func.call @cc_cons(%1534, %1533) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1536 = arith.addi %1535, %__rlasp_stack_elide_zero_83 : i64
      %1592 = arith.constant 162741310455812 : i64
      %1593 = arith.constant 0 : i64
      %1594 = func.call @cc_make_closure(%1592, %1593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1595 = arith.addi %1594, %__rlasp_stack_elide_zero_84 : i64
      %1596 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1597 = arith.constant 4 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_intern(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_nil_value() : () -> i64
      %1602 = func.call @cc_cons(%1600, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_values_pack(%1602) : (i64) -> i64
      func.call @stack_push_pointer(%1600) : (i64) -> ()
      %1604 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1605 = arith.constant 5 : i64
      %1606 = func.call @cc_make_string(%1604, %1605) : (!llvm.ptr, i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = func.call @cc_intern(%1606, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_cons(%1608, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_values_pack(%1610) : (i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = func.call @stack_pop_pointer() : () -> i64
      %1614 = func.call @cc_cons(%1613, %1612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1615 = arith.addi %1614, %__rlasp_stack_elide_zero_85 : i64
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @cc_cons(%1616, %1615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1618 = arith.addi %1617, %__rlasp_stack_elide_zero_86 : i64
      %1619 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1620 = arith.constant 11 : i64
      %1621 = func.call @cc_make_string(%1619, %1620) : (!llvm.ptr, i64) -> i64
      %1622 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1623 = arith.constant 7 : i64
      %1624 = func.call @cc_make_string(%1622, %1623) : (!llvm.ptr, i64) -> i64
      %1625 = func.call @cc_intern(%1621, %1624) : (i64, i64) -> i64
      %1626 = func.call @cc_nil_value() : () -> i64
      %1627 = func.call @cc_cons(%1625, %1626) : (i64, i64) -> i64
      %1628 = func.call @cc_values_pack(%1627) : (i64) -> i64
      %1629 = func.call @cc_nil_value() : () -> i64
      %1630 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1631 = arith.constant 4 : i64
      %1632 = func.call @cc_make_string(%1630, %1631) : (!llvm.ptr, i64) -> i64
      %1633 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1634 = arith.constant 7 : i64
      %1635 = func.call @cc_make_string(%1633, %1634) : (!llvm.ptr, i64) -> i64
      %1636 = func.call @cc_intern(%1632, %1635) : (i64, i64) -> i64
      %1637 = func.call @cc_nil_value() : () -> i64
      %1638 = func.call @cc_cons(%1636, %1637) : (i64, i64) -> i64
      %1639 = func.call @cc_values_pack(%1638) : (i64) -> i64
      %1640 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1641 = arith.constant 5 : i64
      %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
      %1643 = func.call @cc_nil_value() : () -> i64
      %1644 = func.call @cc_intern(%1642, %1643) : (i64, i64) -> i64
      %1645 = func.call @cc_nil_value() : () -> i64
      %1646 = func.call @cc_cons(%1644, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_values_pack(%1646) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1648 = arith.addi %1644, %__rlasp_stack_elide_zero_87 : i64
      %1649 = func.call @cc_nil_value() : () -> i64
      %1650 = func.call @cc_errorp(%1471) : (i64) -> i64
      %1651 = arith.cmpi ne, %1650, %1649 : i64
      %1652 = arith.cmpi eq, %1649, %1649 : i64
      %1653 = arith.andi %1651, %1652 : i1
      %1654 = scf.if %1653 -> (i64) {
        scf.yield %1471 : i64
      } else {
        scf.yield %1649 : i64
      }
      %1655 = func.call @cc_errorp(%1536) : (i64) -> i64
      %1656 = arith.cmpi ne, %1655, %1649 : i64
      %1657 = arith.cmpi eq, %1654, %1649 : i64
      %1658 = arith.andi %1656, %1657 : i1
      %1659 = scf.if %1658 -> (i64) {
        scf.yield %1536 : i64
      } else {
        scf.yield %1654 : i64
      }
      %1660 = func.call @cc_errorp(%1595) : (i64) -> i64
      %1661 = arith.cmpi ne, %1660, %1649 : i64
      %1662 = arith.cmpi eq, %1659, %1649 : i64
      %1663 = arith.andi %1661, %1662 : i1
      %1664 = scf.if %1663 -> (i64) {
        scf.yield %1595 : i64
      } else {
        scf.yield %1659 : i64
      }
      %1665 = func.call @cc_errorp(%1618) : (i64) -> i64
      %1666 = arith.cmpi ne, %1665, %1649 : i64
      %1667 = arith.cmpi eq, %1664, %1649 : i64
      %1668 = arith.andi %1666, %1667 : i1
      %1669 = scf.if %1668 -> (i64) {
        scf.yield %1618 : i64
      } else {
        scf.yield %1664 : i64
      }
      %1670 = func.call @cc_errorp(%1625) : (i64) -> i64
      %1671 = arith.cmpi ne, %1670, %1649 : i64
      %1672 = arith.cmpi eq, %1669, %1649 : i64
      %1673 = arith.andi %1671, %1672 : i1
      %1674 = scf.if %1673 -> (i64) {
        scf.yield %1625 : i64
      } else {
        scf.yield %1669 : i64
      }
      %1675 = func.call @cc_errorp(%1629) : (i64) -> i64
      %1676 = arith.cmpi ne, %1675, %1649 : i64
      %1677 = arith.cmpi eq, %1674, %1649 : i64
      %1678 = arith.andi %1676, %1677 : i1
      %1679 = scf.if %1678 -> (i64) {
        scf.yield %1629 : i64
      } else {
        scf.yield %1674 : i64
      }
      %1680 = func.call @cc_errorp(%1636) : (i64) -> i64
      %1681 = arith.cmpi ne, %1680, %1649 : i64
      %1682 = arith.cmpi eq, %1679, %1649 : i64
      %1683 = arith.andi %1681, %1682 : i1
      %1684 = scf.if %1683 -> (i64) {
        scf.yield %1636 : i64
      } else {
        scf.yield %1679 : i64
      }
      %1685 = func.call @cc_errorp(%1648) : (i64) -> i64
      %1686 = arith.cmpi ne, %1685, %1649 : i64
      %1687 = arith.cmpi eq, %1684, %1649 : i64
      %1688 = arith.andi %1686, %1687 : i1
      %1689 = scf.if %1688 -> (i64) {
        scf.yield %1648 : i64
      } else {
        scf.yield %1684 : i64
      }
      %1690 = arith.cmpi ne, %1689, %1649 : i64
      scf.if %1690 {
        func.call @stack_push_pointer(%1689) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1471) : (i64) -> ()
        func.call @stack_push_pointer(%1536) : (i64) -> ()
        func.call @stack_push_pointer(%1595) : (i64) -> ()
        func.call @stack_push_pointer(%1618) : (i64) -> ()
        func.call @stack_push_pointer(%1625) : (i64) -> ()
        func.call @stack_push_pointer(%1629) : (i64) -> ()
        func.call @stack_push_pointer(%1636) : (i64) -> ()
        func.call @stack_push_pointer(%1648) : (i64) -> ()
        %1691 = llvm.mlir.addressof @str119 : !llvm.ptr
        %1692 = func.call @cc_make_function_ref_const(%1691) : (!llvm.ptr) -> i64
        %1693 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1692, %1693) : (i64, i64) -> ()
      }
      %1694 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1694 : i64
    }
    %1695 = func.call @cc_nil_value() : () -> i64
    %1696 = func.call @cc_errorp(%1462) : (i64) -> i64
    %1697 = arith.cmpi ne, %1696, %1695 : i64
    %1698 = scf.if %1697 -> (i64) {
      scf.yield %1462 : i64
    } else {
      %1699 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1700 = arith.constant 27 : i64
      %1701 = func.call @cc_make_string(%1699, %1700) : (!llvm.ptr, i64) -> i64
      %1702 = func.call @cc_nil_value() : () -> i64
      %1703 = func.call @cc_intern(%1701, %1702) : (i64, i64) -> i64
      %1704 = func.call @cc_nil_value() : () -> i64
      %1705 = func.call @cc_cons(%1703, %1704) : (i64, i64) -> i64
      %1706 = func.call @cc_values_pack(%1705) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1707 = arith.addi %1703, %__rlasp_stack_elide_zero_88 : i64
      %1708 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1709 = arith.constant 13 : i64
      %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
      %1711 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1712 = arith.constant 11 : i64
      %1713 = func.call @cc_make_string(%1711, %1712) : (!llvm.ptr, i64) -> i64
      %1714 = func.call @cc_intern(%1710, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_nil_value() : () -> i64
      %1716 = func.call @cc_cons(%1714, %1715) : (i64, i64) -> i64
      %1717 = func.call @cc_values_pack(%1716) : (i64) -> i64
      func.call @stack_push_pointer(%1714) : (i64) -> ()
      %1718 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1719 = arith.constant 6 : i64
      %1720 = func.call @cc_make_string(%1718, %1719) : (!llvm.ptr, i64) -> i64
      %1721 = func.call @cc_nil_value() : () -> i64
      %1722 = func.call @cc_intern(%1720, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_cons(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_values_pack(%1724) : (i64) -> i64
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      %1726 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1727 = arith.constant 19 : i64
      %1728 = func.call @cc_make_string(%1726, %1727) : (!llvm.ptr, i64) -> i64
      %1729 = func.call @cc_nil_value() : () -> i64
      %1730 = func.call @cc_intern(%1728, %1729) : (i64, i64) -> i64
      %1731 = func.call @cc_nil_value() : () -> i64
      %1732 = func.call @cc_cons(%1730, %1731) : (i64, i64) -> i64
      %1733 = func.call @cc_values_pack(%1732) : (i64) -> i64
      func.call @stack_push_pointer(%1730) : (i64) -> ()
      %1734 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1735 = arith.constant 20 : i64
      %1736 = func.call @cc_make_string(%1734, %1735) : (!llvm.ptr, i64) -> i64
      %1737 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1738 = arith.constant 3 : i64
      %1739 = func.call @cc_make_string(%1737, %1738) : (!llvm.ptr, i64) -> i64
      %1740 = func.call @cc_intern(%1736, %1739) : (i64, i64) -> i64
      %1741 = func.call @cc_nil_value() : () -> i64
      %1742 = func.call @cc_cons(%1740, %1741) : (i64, i64) -> i64
      %1743 = func.call @cc_values_pack(%1742) : (i64) -> i64
      func.call @stack_push_pointer(%1740) : (i64) -> ()
      %1744 = arith.constant 3.0 : f64
      %1745 = func.call @cc_box_float(%1744) : (f64) -> i64
      func.call @stack_push_pointer(%1745) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1746 = func.call @stack_pop_pointer() : () -> i64
      %1747 = func.call @stack_pop_pointer() : () -> i64
      %1748 = func.call @cc_cons(%1747, %1746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1749 = arith.addi %1748, %__rlasp_stack_elide_zero_89 : i64
      %1750 = func.call @stack_pop_pointer() : () -> i64
      %1751 = func.call @cc_cons(%1750, %1749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1752 = func.call @stack_pop_pointer() : () -> i64
      %1753 = func.call @stack_pop_pointer() : () -> i64
      %1754 = func.call @cc_cons(%1753, %1752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1755 = arith.addi %1754, %__rlasp_stack_elide_zero_90 : i64
      %1756 = func.call @stack_pop_pointer() : () -> i64
      %1757 = func.call @cc_cons(%1756, %1755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1758 = func.call @stack_pop_pointer() : () -> i64
      %1759 = func.call @stack_pop_pointer() : () -> i64
      %1760 = func.call @cc_cons(%1759, %1758) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1761 = arith.addi %1760, %__rlasp_stack_elide_zero_91 : i64
      %1762 = func.call @stack_pop_pointer() : () -> i64
      %1763 = func.call @cc_cons(%1762, %1761) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1764 = arith.addi %1763, %__rlasp_stack_elide_zero_92 : i64
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = func.call @cc_cons(%1765, %1764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1767 = func.call @stack_pop_pointer() : () -> i64
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @cc_cons(%1768, %1767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1770 = arith.addi %1769, %__rlasp_stack_elide_zero_93 : i64
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @cc_cons(%1771, %1770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1773 = arith.addi %1772, %__rlasp_stack_elide_zero_94 : i64
      %1830 = arith.constant 162741310455813 : i64
      %1831 = arith.constant 0 : i64
      %1832 = func.call @cc_make_closure(%1830, %1831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1833 = arith.addi %1832, %__rlasp_stack_elide_zero_95 : i64
      %1834 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1835 = arith.constant 4 : i64
      %1836 = func.call @cc_make_string(%1834, %1835) : (!llvm.ptr, i64) -> i64
      %1837 = func.call @cc_nil_value() : () -> i64
      %1838 = func.call @cc_intern(%1836, %1837) : (i64, i64) -> i64
      %1839 = func.call @cc_nil_value() : () -> i64
      %1840 = func.call @cc_cons(%1838, %1839) : (i64, i64) -> i64
      %1841 = func.call @cc_values_pack(%1840) : (i64) -> i64
      func.call @stack_push_pointer(%1838) : (i64) -> ()
      %1842 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1843 = arith.constant 5 : i64
      %1844 = func.call @cc_make_string(%1842, %1843) : (!llvm.ptr, i64) -> i64
      %1845 = func.call @cc_nil_value() : () -> i64
      %1846 = func.call @cc_intern(%1844, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_nil_value() : () -> i64
      %1848 = func.call @cc_cons(%1846, %1847) : (i64, i64) -> i64
      %1849 = func.call @cc_values_pack(%1848) : (i64) -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @stack_pop_pointer() : () -> i64
      %1852 = func.call @cc_cons(%1851, %1850) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1853 = arith.addi %1852, %__rlasp_stack_elide_zero_96 : i64
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = func.call @cc_cons(%1854, %1853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1856 = arith.addi %1855, %__rlasp_stack_elide_zero_97 : i64
      %1857 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1858 = arith.constant 11 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1861 = arith.constant 7 : i64
      %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
      %1863 = func.call @cc_intern(%1859, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_nil_value() : () -> i64
      %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
      %1867 = func.call @cc_nil_value() : () -> i64
      %1868 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1869 = arith.constant 4 : i64
      %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
      %1871 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1872 = arith.constant 7 : i64
      %1873 = func.call @cc_make_string(%1871, %1872) : (!llvm.ptr, i64) -> i64
      %1874 = func.call @cc_intern(%1870, %1873) : (i64, i64) -> i64
      %1875 = func.call @cc_nil_value() : () -> i64
      %1876 = func.call @cc_cons(%1874, %1875) : (i64, i64) -> i64
      %1877 = func.call @cc_values_pack(%1876) : (i64) -> i64
      %1878 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1879 = arith.constant 5 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_nil_value() : () -> i64
      %1882 = func.call @cc_intern(%1880, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_nil_value() : () -> i64
      %1884 = func.call @cc_cons(%1882, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_values_pack(%1884) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1886 = arith.addi %1882, %__rlasp_stack_elide_zero_98 : i64
      %1887 = func.call @cc_nil_value() : () -> i64
      %1888 = func.call @cc_errorp(%1707) : (i64) -> i64
      %1889 = arith.cmpi ne, %1888, %1887 : i64
      %1890 = arith.cmpi eq, %1887, %1887 : i64
      %1891 = arith.andi %1889, %1890 : i1
      %1892 = scf.if %1891 -> (i64) {
        scf.yield %1707 : i64
      } else {
        scf.yield %1887 : i64
      }
      %1893 = func.call @cc_errorp(%1773) : (i64) -> i64
      %1894 = arith.cmpi ne, %1893, %1887 : i64
      %1895 = arith.cmpi eq, %1892, %1887 : i64
      %1896 = arith.andi %1894, %1895 : i1
      %1897 = scf.if %1896 -> (i64) {
        scf.yield %1773 : i64
      } else {
        scf.yield %1892 : i64
      }
      %1898 = func.call @cc_errorp(%1833) : (i64) -> i64
      %1899 = arith.cmpi ne, %1898, %1887 : i64
      %1900 = arith.cmpi eq, %1897, %1887 : i64
      %1901 = arith.andi %1899, %1900 : i1
      %1902 = scf.if %1901 -> (i64) {
        scf.yield %1833 : i64
      } else {
        scf.yield %1897 : i64
      }
      %1903 = func.call @cc_errorp(%1856) : (i64) -> i64
      %1904 = arith.cmpi ne, %1903, %1887 : i64
      %1905 = arith.cmpi eq, %1902, %1887 : i64
      %1906 = arith.andi %1904, %1905 : i1
      %1907 = scf.if %1906 -> (i64) {
        scf.yield %1856 : i64
      } else {
        scf.yield %1902 : i64
      }
      %1908 = func.call @cc_errorp(%1863) : (i64) -> i64
      %1909 = arith.cmpi ne, %1908, %1887 : i64
      %1910 = arith.cmpi eq, %1907, %1887 : i64
      %1911 = arith.andi %1909, %1910 : i1
      %1912 = scf.if %1911 -> (i64) {
        scf.yield %1863 : i64
      } else {
        scf.yield %1907 : i64
      }
      %1913 = func.call @cc_errorp(%1867) : (i64) -> i64
      %1914 = arith.cmpi ne, %1913, %1887 : i64
      %1915 = arith.cmpi eq, %1912, %1887 : i64
      %1916 = arith.andi %1914, %1915 : i1
      %1917 = scf.if %1916 -> (i64) {
        scf.yield %1867 : i64
      } else {
        scf.yield %1912 : i64
      }
      %1918 = func.call @cc_errorp(%1874) : (i64) -> i64
      %1919 = arith.cmpi ne, %1918, %1887 : i64
      %1920 = arith.cmpi eq, %1917, %1887 : i64
      %1921 = arith.andi %1919, %1920 : i1
      %1922 = scf.if %1921 -> (i64) {
        scf.yield %1874 : i64
      } else {
        scf.yield %1917 : i64
      }
      %1923 = func.call @cc_errorp(%1886) : (i64) -> i64
      %1924 = arith.cmpi ne, %1923, %1887 : i64
      %1925 = arith.cmpi eq, %1922, %1887 : i64
      %1926 = arith.andi %1924, %1925 : i1
      %1927 = scf.if %1926 -> (i64) {
        scf.yield %1886 : i64
      } else {
        scf.yield %1922 : i64
      }
      %1928 = arith.cmpi ne, %1927, %1887 : i64
      scf.if %1928 {
        func.call @stack_push_pointer(%1927) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1707) : (i64) -> ()
        func.call @stack_push_pointer(%1773) : (i64) -> ()
        func.call @stack_push_pointer(%1833) : (i64) -> ()
        func.call @stack_push_pointer(%1856) : (i64) -> ()
        func.call @stack_push_pointer(%1863) : (i64) -> ()
        func.call @stack_push_pointer(%1867) : (i64) -> ()
        func.call @stack_push_pointer(%1874) : (i64) -> ()
        func.call @stack_push_pointer(%1886) : (i64) -> ()
        %1929 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1930 = func.call @cc_make_function_ref_const(%1929) : (!llvm.ptr) -> i64
        %1931 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1930, %1931) : (i64, i64) -> ()
      }
      %1932 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1932 : i64
    }
    %1933 = func.call @cc_nil_value() : () -> i64
    %1934 = func.call @cc_errorp(%1698) : (i64) -> i64
    %1935 = arith.cmpi ne, %1934, %1933 : i64
    %1936 = scf.if %1935 -> (i64) {
      scf.yield %1698 : i64
    } else {
      %1937 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1938 = arith.constant 27 : i64
      %1939 = func.call @cc_make_string(%1937, %1938) : (!llvm.ptr, i64) -> i64
      %1940 = func.call @cc_nil_value() : () -> i64
      %1941 = func.call @cc_intern(%1939, %1940) : (i64, i64) -> i64
      %1942 = func.call @cc_nil_value() : () -> i64
      %1943 = func.call @cc_cons(%1941, %1942) : (i64, i64) -> i64
      %1944 = func.call @cc_values_pack(%1943) : (i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %1945 = arith.addi %1941, %__rlasp_stack_elide_zero_99 : i64
      %1946 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1947 = arith.constant 13 : i64
      %1948 = func.call @cc_make_string(%1946, %1947) : (!llvm.ptr, i64) -> i64
      %1949 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1950 = arith.constant 11 : i64
      %1951 = func.call @cc_make_string(%1949, %1950) : (!llvm.ptr, i64) -> i64
      %1952 = func.call @cc_intern(%1948, %1951) : (i64, i64) -> i64
      %1953 = func.call @cc_nil_value() : () -> i64
      %1954 = func.call @cc_cons(%1952, %1953) : (i64, i64) -> i64
      %1955 = func.call @cc_values_pack(%1954) : (i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1956 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1957 = arith.constant 6 : i64
      %1958 = func.call @cc_make_string(%1956, %1957) : (!llvm.ptr, i64) -> i64
      %1959 = func.call @cc_nil_value() : () -> i64
      %1960 = func.call @cc_intern(%1958, %1959) : (i64, i64) -> i64
      %1961 = func.call @cc_nil_value() : () -> i64
      %1962 = func.call @cc_cons(%1960, %1961) : (i64, i64) -> i64
      %1963 = func.call @cc_values_pack(%1962) : (i64) -> i64
      func.call @stack_push_pointer(%1960) : (i64) -> ()
      %1964 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1965 = arith.constant 19 : i64
      %1966 = func.call @cc_make_string(%1964, %1965) : (!llvm.ptr, i64) -> i64
      %1967 = func.call @cc_nil_value() : () -> i64
      %1968 = func.call @cc_intern(%1966, %1967) : (i64, i64) -> i64
      %1969 = func.call @cc_nil_value() : () -> i64
      %1970 = func.call @cc_cons(%1968, %1969) : (i64, i64) -> i64
      %1971 = func.call @cc_values_pack(%1970) : (i64) -> i64
      func.call @stack_push_pointer(%1968) : (i64) -> ()
      %1972 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1973 = arith.constant 20 : i64
      %1974 = func.call @cc_make_string(%1972, %1973) : (!llvm.ptr, i64) -> i64
      %1975 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1976 = arith.constant 3 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = func.call @cc_intern(%1974, %1977) : (i64, i64) -> i64
      %1979 = func.call @cc_nil_value() : () -> i64
      %1980 = func.call @cc_cons(%1978, %1979) : (i64, i64) -> i64
      %1981 = func.call @cc_values_pack(%1980) : (i64) -> i64
      func.call @stack_push_pointer(%1978) : (i64) -> ()
      %1982 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1983 = arith.constant 2 : i64
      %1984 = func.call @cc_make_string(%1982, %1983) : (!llvm.ptr, i64) -> i64
      %1985 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1986 = arith.constant 11 : i64
      %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
      %1988 = func.call @cc_intern(%1984, %1987) : (i64, i64) -> i64
      %1989 = func.call @cc_nil_value() : () -> i64
      %1990 = func.call @cc_cons(%1988, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_values_pack(%1990) : (i64) -> i64
      func.call @stack_push_pointer(%1988) : (i64) -> ()
      %1992 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1993 = arith.constant 20 : i64
      %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
      %1995 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1996 = arith.constant 11 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      %1998 = func.call @cc_intern(%1994, %1997) : (i64, i64) -> i64
      %1999 = func.call @cc_nil_value() : () -> i64
      %2000 = func.call @cc_cons(%1998, %1999) : (i64, i64) -> i64
      %2001 = func.call @cc_values_pack(%2000) : (i64) -> i64
      func.call @stack_push_pointer(%1998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2002 = func.call @stack_pop_pointer() : () -> i64
      %2003 = func.call @stack_pop_pointer() : () -> i64
      %2004 = func.call @cc_cons(%2003, %2002) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2005 = arith.addi %2004, %__rlasp_stack_elide_zero_100 : i64
      %2006 = func.call @stack_pop_pointer() : () -> i64
      %2007 = func.call @cc_cons(%2006, %2005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2008 = func.call @stack_pop_pointer() : () -> i64
      %2009 = func.call @stack_pop_pointer() : () -> i64
      %2010 = func.call @cc_cons(%2009, %2008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2011 = arith.addi %2010, %__rlasp_stack_elide_zero_101 : i64
      %2012 = func.call @stack_pop_pointer() : () -> i64
      %2013 = func.call @cc_cons(%2012, %2011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = func.call @stack_pop_pointer() : () -> i64
      %2016 = func.call @cc_cons(%2015, %2014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2017 = arith.addi %2016, %__rlasp_stack_elide_zero_102 : i64
      %2018 = func.call @stack_pop_pointer() : () -> i64
      %2019 = func.call @cc_cons(%2018, %2017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2019) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @stack_pop_pointer() : () -> i64
      %2022 = func.call @cc_cons(%2021, %2020) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2023 = arith.addi %2022, %__rlasp_stack_elide_zero_103 : i64
      %2024 = func.call @stack_pop_pointer() : () -> i64
      %2025 = func.call @cc_cons(%2024, %2023) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2026 = arith.addi %2025, %__rlasp_stack_elide_zero_104 : i64
      %2027 = func.call @stack_pop_pointer() : () -> i64
      %2028 = func.call @cc_cons(%2027, %2026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @stack_pop_pointer() : () -> i64
      %2031 = func.call @cc_cons(%2030, %2029) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2032 = arith.addi %2031, %__rlasp_stack_elide_zero_105 : i64
      %2033 = func.call @stack_pop_pointer() : () -> i64
      %2034 = func.call @cc_cons(%2033, %2032) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2035 = arith.addi %2034, %__rlasp_stack_elide_zero_106 : i64
      %2128 = arith.constant 162741310455814 : i64
      %2129 = arith.constant 0 : i64
      %2130 = func.call @cc_make_closure(%2128, %2129) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2131 = arith.addi %2130, %__rlasp_stack_elide_zero_107 : i64
      %2132 = llvm.mlir.addressof @str150 : !llvm.ptr
      %2133 = arith.constant 4 : i64
      %2134 = func.call @cc_make_string(%2132, %2133) : (!llvm.ptr, i64) -> i64
      %2135 = func.call @cc_nil_value() : () -> i64
      %2136 = func.call @cc_intern(%2134, %2135) : (i64, i64) -> i64
      %2137 = func.call @cc_nil_value() : () -> i64
      %2138 = func.call @cc_cons(%2136, %2137) : (i64, i64) -> i64
      %2139 = func.call @cc_values_pack(%2138) : (i64) -> i64
      func.call @stack_push_pointer(%2136) : (i64) -> ()
      %2140 = llvm.mlir.addressof @str151 : !llvm.ptr
      %2141 = arith.constant 5 : i64
      %2142 = func.call @cc_make_string(%2140, %2141) : (!llvm.ptr, i64) -> i64
      %2143 = func.call @cc_nil_value() : () -> i64
      %2144 = func.call @cc_intern(%2142, %2143) : (i64, i64) -> i64
      %2145 = func.call @cc_nil_value() : () -> i64
      %2146 = func.call @cc_cons(%2144, %2145) : (i64, i64) -> i64
      %2147 = func.call @cc_values_pack(%2146) : (i64) -> i64
      func.call @stack_push_pointer(%2144) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2148 = func.call @stack_pop_pointer() : () -> i64
      %2149 = func.call @stack_pop_pointer() : () -> i64
      %2150 = func.call @cc_cons(%2149, %2148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2151 = arith.addi %2150, %__rlasp_stack_elide_zero_108 : i64
      %2152 = func.call @stack_pop_pointer() : () -> i64
      %2153 = func.call @cc_cons(%2152, %2151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2154 = arith.addi %2153, %__rlasp_stack_elide_zero_109 : i64
      %2155 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2156 = arith.constant 11 : i64
      %2157 = func.call @cc_make_string(%2155, %2156) : (!llvm.ptr, i64) -> i64
      %2158 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2159 = arith.constant 7 : i64
      %2160 = func.call @cc_make_string(%2158, %2159) : (!llvm.ptr, i64) -> i64
      %2161 = func.call @cc_intern(%2157, %2160) : (i64, i64) -> i64
      %2162 = func.call @cc_nil_value() : () -> i64
      %2163 = func.call @cc_cons(%2161, %2162) : (i64, i64) -> i64
      %2164 = func.call @cc_values_pack(%2163) : (i64) -> i64
      %2165 = func.call @cc_nil_value() : () -> i64
      %2166 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2167 = arith.constant 4 : i64
      %2168 = func.call @cc_make_string(%2166, %2167) : (!llvm.ptr, i64) -> i64
      %2169 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2170 = arith.constant 7 : i64
      %2171 = func.call @cc_make_string(%2169, %2170) : (!llvm.ptr, i64) -> i64
      %2172 = func.call @cc_intern(%2168, %2171) : (i64, i64) -> i64
      %2173 = func.call @cc_nil_value() : () -> i64
      %2174 = func.call @cc_cons(%2172, %2173) : (i64, i64) -> i64
      %2175 = func.call @cc_values_pack(%2174) : (i64) -> i64
      %2176 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2177 = arith.constant 5 : i64
      %2178 = func.call @cc_make_string(%2176, %2177) : (!llvm.ptr, i64) -> i64
      %2179 = func.call @cc_nil_value() : () -> i64
      %2180 = func.call @cc_intern(%2178, %2179) : (i64, i64) -> i64
      %2181 = func.call @cc_nil_value() : () -> i64
      %2182 = func.call @cc_cons(%2180, %2181) : (i64, i64) -> i64
      %2183 = func.call @cc_values_pack(%2182) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2184 = arith.addi %2180, %__rlasp_stack_elide_zero_110 : i64
      %2185 = func.call @cc_nil_value() : () -> i64
      %2186 = func.call @cc_errorp(%1945) : (i64) -> i64
      %2187 = arith.cmpi ne, %2186, %2185 : i64
      %2188 = arith.cmpi eq, %2185, %2185 : i64
      %2189 = arith.andi %2187, %2188 : i1
      %2190 = scf.if %2189 -> (i64) {
        scf.yield %1945 : i64
      } else {
        scf.yield %2185 : i64
      }
      %2191 = func.call @cc_errorp(%2035) : (i64) -> i64
      %2192 = arith.cmpi ne, %2191, %2185 : i64
      %2193 = arith.cmpi eq, %2190, %2185 : i64
      %2194 = arith.andi %2192, %2193 : i1
      %2195 = scf.if %2194 -> (i64) {
        scf.yield %2035 : i64
      } else {
        scf.yield %2190 : i64
      }
      %2196 = func.call @cc_errorp(%2131) : (i64) -> i64
      %2197 = arith.cmpi ne, %2196, %2185 : i64
      %2198 = arith.cmpi eq, %2195, %2185 : i64
      %2199 = arith.andi %2197, %2198 : i1
      %2200 = scf.if %2199 -> (i64) {
        scf.yield %2131 : i64
      } else {
        scf.yield %2195 : i64
      }
      %2201 = func.call @cc_errorp(%2154) : (i64) -> i64
      %2202 = arith.cmpi ne, %2201, %2185 : i64
      %2203 = arith.cmpi eq, %2200, %2185 : i64
      %2204 = arith.andi %2202, %2203 : i1
      %2205 = scf.if %2204 -> (i64) {
        scf.yield %2154 : i64
      } else {
        scf.yield %2200 : i64
      }
      %2206 = func.call @cc_errorp(%2161) : (i64) -> i64
      %2207 = arith.cmpi ne, %2206, %2185 : i64
      %2208 = arith.cmpi eq, %2205, %2185 : i64
      %2209 = arith.andi %2207, %2208 : i1
      %2210 = scf.if %2209 -> (i64) {
        scf.yield %2161 : i64
      } else {
        scf.yield %2205 : i64
      }
      %2211 = func.call @cc_errorp(%2165) : (i64) -> i64
      %2212 = arith.cmpi ne, %2211, %2185 : i64
      %2213 = arith.cmpi eq, %2210, %2185 : i64
      %2214 = arith.andi %2212, %2213 : i1
      %2215 = scf.if %2214 -> (i64) {
        scf.yield %2165 : i64
      } else {
        scf.yield %2210 : i64
      }
      %2216 = func.call @cc_errorp(%2172) : (i64) -> i64
      %2217 = arith.cmpi ne, %2216, %2185 : i64
      %2218 = arith.cmpi eq, %2215, %2185 : i64
      %2219 = arith.andi %2217, %2218 : i1
      %2220 = scf.if %2219 -> (i64) {
        scf.yield %2172 : i64
      } else {
        scf.yield %2215 : i64
      }
      %2221 = func.call @cc_errorp(%2184) : (i64) -> i64
      %2222 = arith.cmpi ne, %2221, %2185 : i64
      %2223 = arith.cmpi eq, %2220, %2185 : i64
      %2224 = arith.andi %2222, %2223 : i1
      %2225 = scf.if %2224 -> (i64) {
        scf.yield %2184 : i64
      } else {
        scf.yield %2220 : i64
      }
      %2226 = arith.cmpi ne, %2225, %2185 : i64
      scf.if %2226 {
        func.call @stack_push_pointer(%2225) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1945) : (i64) -> ()
        func.call @stack_push_pointer(%2035) : (i64) -> ()
        func.call @stack_push_pointer(%2131) : (i64) -> ()
        func.call @stack_push_pointer(%2154) : (i64) -> ()
        func.call @stack_push_pointer(%2161) : (i64) -> ()
        func.call @stack_push_pointer(%2165) : (i64) -> ()
        func.call @stack_push_pointer(%2172) : (i64) -> ()
        func.call @stack_push_pointer(%2184) : (i64) -> ()
        %2227 = llvm.mlir.addressof @str157 : !llvm.ptr
        %2228 = func.call @cc_make_function_ref_const(%2227) : (!llvm.ptr) -> i64
        %2229 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2228, %2229) : (i64, i64) -> ()
      }
      %2230 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2230 : i64
    }
    %2231 = func.call @cc_nil_value() : () -> i64
    %2232 = func.call @cc_errorp(%1936) : (i64) -> i64
    %2233 = arith.cmpi ne, %2232, %2231 : i64
    %2234 = scf.if %2233 -> (i64) {
      scf.yield %1936 : i64
    } else {
      %2235 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2236 = arith.constant 27 : i64
      %2237 = func.call @cc_make_string(%2235, %2236) : (!llvm.ptr, i64) -> i64
      %2238 = func.call @cc_nil_value() : () -> i64
      %2239 = func.call @cc_intern(%2237, %2238) : (i64, i64) -> i64
      %2240 = func.call @cc_nil_value() : () -> i64
      %2241 = func.call @cc_cons(%2239, %2240) : (i64, i64) -> i64
      %2242 = func.call @cc_values_pack(%2241) : (i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2243 = arith.addi %2239, %__rlasp_stack_elide_zero_111 : i64
      %2244 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2245 = arith.constant 13 : i64
      %2246 = func.call @cc_make_string(%2244, %2245) : (!llvm.ptr, i64) -> i64
      %2247 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2248 = arith.constant 11 : i64
      %2249 = func.call @cc_make_string(%2247, %2248) : (!llvm.ptr, i64) -> i64
      %2250 = func.call @cc_intern(%2246, %2249) : (i64, i64) -> i64
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_cons(%2250, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_values_pack(%2252) : (i64) -> i64
      func.call @stack_push_pointer(%2250) : (i64) -> ()
      %2254 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2255 = arith.constant 6 : i64
      %2256 = func.call @cc_make_string(%2254, %2255) : (!llvm.ptr, i64) -> i64
      %2257 = func.call @cc_nil_value() : () -> i64
      %2258 = func.call @cc_intern(%2256, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_cons(%2258, %2259) : (i64, i64) -> i64
      %2261 = func.call @cc_values_pack(%2260) : (i64) -> i64
      func.call @stack_push_pointer(%2258) : (i64) -> ()
      %2262 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2263 = arith.constant 19 : i64
      %2264 = func.call @cc_make_string(%2262, %2263) : (!llvm.ptr, i64) -> i64
      %2265 = func.call @cc_nil_value() : () -> i64
      %2266 = func.call @cc_intern(%2264, %2265) : (i64, i64) -> i64
      %2267 = func.call @cc_nil_value() : () -> i64
      %2268 = func.call @cc_cons(%2266, %2267) : (i64, i64) -> i64
      %2269 = func.call @cc_values_pack(%2268) : (i64) -> i64
      func.call @stack_push_pointer(%2266) : (i64) -> ()
      %2270 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2271 = arith.constant 20 : i64
      %2272 = func.call @cc_make_string(%2270, %2271) : (!llvm.ptr, i64) -> i64
      %2273 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2274 = arith.constant 3 : i64
      %2275 = func.call @cc_make_string(%2273, %2274) : (!llvm.ptr, i64) -> i64
      %2276 = func.call @cc_intern(%2272, %2275) : (i64, i64) -> i64
      %2277 = func.call @cc_nil_value() : () -> i64
      %2278 = func.call @cc_cons(%2276, %2277) : (i64, i64) -> i64
      %2279 = func.call @cc_values_pack(%2278) : (i64) -> i64
      func.call @stack_push_pointer(%2276) : (i64) -> ()
      %2280 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2281 = arith.constant 2 : i64
      %2282 = func.call @cc_make_string(%2280, %2281) : (!llvm.ptr, i64) -> i64
      %2283 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2284 = arith.constant 11 : i64
      %2285 = func.call @cc_make_string(%2283, %2284) : (!llvm.ptr, i64) -> i64
      %2286 = func.call @cc_intern(%2282, %2285) : (i64, i64) -> i64
      %2287 = func.call @cc_nil_value() : () -> i64
      %2288 = func.call @cc_cons(%2286, %2287) : (i64, i64) -> i64
      %2289 = func.call @cc_values_pack(%2288) : (i64) -> i64
      func.call @stack_push_pointer(%2286) : (i64) -> ()
      %2290 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2291 = arith.constant 20 : i64
      %2292 = func.call @cc_make_string(%2290, %2291) : (!llvm.ptr, i64) -> i64
      %2293 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2294 = arith.constant 11 : i64
      %2295 = func.call @cc_make_string(%2293, %2294) : (!llvm.ptr, i64) -> i64
      %2296 = func.call @cc_intern(%2292, %2295) : (i64, i64) -> i64
      %2297 = func.call @cc_nil_value() : () -> i64
      %2298 = func.call @cc_cons(%2296, %2297) : (i64, i64) -> i64
      %2299 = func.call @cc_values_pack(%2298) : (i64) -> i64
      func.call @stack_push_pointer(%2296) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2300 = func.call @stack_pop_pointer() : () -> i64
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = func.call @cc_cons(%2301, %2300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2303 = arith.addi %2302, %__rlasp_stack_elide_zero_112 : i64
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @cc_cons(%2304, %2303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2306 = func.call @stack_pop_pointer() : () -> i64
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @cc_cons(%2307, %2306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2309 = arith.addi %2308, %__rlasp_stack_elide_zero_113 : i64
      %2310 = func.call @stack_pop_pointer() : () -> i64
      %2311 = func.call @cc_cons(%2310, %2309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2312 = func.call @stack_pop_pointer() : () -> i64
      %2313 = func.call @stack_pop_pointer() : () -> i64
      %2314 = func.call @cc_cons(%2313, %2312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2315 = arith.addi %2314, %__rlasp_stack_elide_zero_114 : i64
      %2316 = func.call @stack_pop_pointer() : () -> i64
      %2317 = func.call @cc_cons(%2316, %2315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @stack_pop_pointer() : () -> i64
      %2320 = func.call @cc_cons(%2319, %2318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2321 = arith.addi %2320, %__rlasp_stack_elide_zero_115 : i64
      %2322 = func.call @stack_pop_pointer() : () -> i64
      %2323 = func.call @cc_cons(%2322, %2321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2324 = arith.addi %2323, %__rlasp_stack_elide_zero_116 : i64
      %2325 = func.call @stack_pop_pointer() : () -> i64
      %2326 = func.call @cc_cons(%2325, %2324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @stack_pop_pointer() : () -> i64
      %2329 = func.call @cc_cons(%2328, %2327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2330 = arith.addi %2329, %__rlasp_stack_elide_zero_117 : i64
      %2331 = func.call @stack_pop_pointer() : () -> i64
      %2332 = func.call @cc_cons(%2331, %2330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2333 = arith.addi %2332, %__rlasp_stack_elide_zero_118 : i64
      %2426 = arith.constant 162741310455815 : i64
      %2427 = arith.constant 0 : i64
      %2428 = func.call @cc_make_closure(%2426, %2427) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2429 = arith.addi %2428, %__rlasp_stack_elide_zero_119 : i64
      %2430 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2431 = arith.constant 4 : i64
      %2432 = func.call @cc_make_string(%2430, %2431) : (!llvm.ptr, i64) -> i64
      %2433 = func.call @cc_nil_value() : () -> i64
      %2434 = func.call @cc_intern(%2432, %2433) : (i64, i64) -> i64
      %2435 = func.call @cc_nil_value() : () -> i64
      %2436 = func.call @cc_cons(%2434, %2435) : (i64, i64) -> i64
      %2437 = func.call @cc_values_pack(%2436) : (i64) -> i64
      func.call @stack_push_pointer(%2434) : (i64) -> ()
      %2438 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2439 = arith.constant 5 : i64
      %2440 = func.call @cc_make_string(%2438, %2439) : (!llvm.ptr, i64) -> i64
      %2441 = func.call @cc_nil_value() : () -> i64
      %2442 = func.call @cc_intern(%2440, %2441) : (i64, i64) -> i64
      %2443 = func.call @cc_nil_value() : () -> i64
      %2444 = func.call @cc_cons(%2442, %2443) : (i64, i64) -> i64
      %2445 = func.call @cc_values_pack(%2444) : (i64) -> i64
      func.call @stack_push_pointer(%2442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2446 = func.call @stack_pop_pointer() : () -> i64
      %2447 = func.call @stack_pop_pointer() : () -> i64
      %2448 = func.call @cc_cons(%2447, %2446) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2449 = arith.addi %2448, %__rlasp_stack_elide_zero_120 : i64
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @cc_cons(%2450, %2449) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2452 = arith.addi %2451, %__rlasp_stack_elide_zero_121 : i64
      %2453 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2454 = arith.constant 11 : i64
      %2455 = func.call @cc_make_string(%2453, %2454) : (!llvm.ptr, i64) -> i64
      %2456 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2457 = arith.constant 7 : i64
      %2458 = func.call @cc_make_string(%2456, %2457) : (!llvm.ptr, i64) -> i64
      %2459 = func.call @cc_intern(%2455, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_nil_value() : () -> i64
      %2461 = func.call @cc_cons(%2459, %2460) : (i64, i64) -> i64
      %2462 = func.call @cc_values_pack(%2461) : (i64) -> i64
      %2463 = func.call @cc_nil_value() : () -> i64
      %2464 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2465 = arith.constant 4 : i64
      %2466 = func.call @cc_make_string(%2464, %2465) : (!llvm.ptr, i64) -> i64
      %2467 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2468 = arith.constant 7 : i64
      %2469 = func.call @cc_make_string(%2467, %2468) : (!llvm.ptr, i64) -> i64
      %2470 = func.call @cc_intern(%2466, %2469) : (i64, i64) -> i64
      %2471 = func.call @cc_nil_value() : () -> i64
      %2472 = func.call @cc_cons(%2470, %2471) : (i64, i64) -> i64
      %2473 = func.call @cc_values_pack(%2472) : (i64) -> i64
      %2474 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2475 = arith.constant 5 : i64
      %2476 = func.call @cc_make_string(%2474, %2475) : (!llvm.ptr, i64) -> i64
      %2477 = func.call @cc_nil_value() : () -> i64
      %2478 = func.call @cc_intern(%2476, %2477) : (i64, i64) -> i64
      %2479 = func.call @cc_nil_value() : () -> i64
      %2480 = func.call @cc_cons(%2478, %2479) : (i64, i64) -> i64
      %2481 = func.call @cc_values_pack(%2480) : (i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2482 = arith.addi %2478, %__rlasp_stack_elide_zero_122 : i64
      %2483 = func.call @cc_nil_value() : () -> i64
      %2484 = func.call @cc_errorp(%2243) : (i64) -> i64
      %2485 = arith.cmpi ne, %2484, %2483 : i64
      %2486 = arith.cmpi eq, %2483, %2483 : i64
      %2487 = arith.andi %2485, %2486 : i1
      %2488 = scf.if %2487 -> (i64) {
        scf.yield %2243 : i64
      } else {
        scf.yield %2483 : i64
      }
      %2489 = func.call @cc_errorp(%2333) : (i64) -> i64
      %2490 = arith.cmpi ne, %2489, %2483 : i64
      %2491 = arith.cmpi eq, %2488, %2483 : i64
      %2492 = arith.andi %2490, %2491 : i1
      %2493 = scf.if %2492 -> (i64) {
        scf.yield %2333 : i64
      } else {
        scf.yield %2488 : i64
      }
      %2494 = func.call @cc_errorp(%2429) : (i64) -> i64
      %2495 = arith.cmpi ne, %2494, %2483 : i64
      %2496 = arith.cmpi eq, %2493, %2483 : i64
      %2497 = arith.andi %2495, %2496 : i1
      %2498 = scf.if %2497 -> (i64) {
        scf.yield %2429 : i64
      } else {
        scf.yield %2493 : i64
      }
      %2499 = func.call @cc_errorp(%2452) : (i64) -> i64
      %2500 = arith.cmpi ne, %2499, %2483 : i64
      %2501 = arith.cmpi eq, %2498, %2483 : i64
      %2502 = arith.andi %2500, %2501 : i1
      %2503 = scf.if %2502 -> (i64) {
        scf.yield %2452 : i64
      } else {
        scf.yield %2498 : i64
      }
      %2504 = func.call @cc_errorp(%2459) : (i64) -> i64
      %2505 = arith.cmpi ne, %2504, %2483 : i64
      %2506 = arith.cmpi eq, %2503, %2483 : i64
      %2507 = arith.andi %2505, %2506 : i1
      %2508 = scf.if %2507 -> (i64) {
        scf.yield %2459 : i64
      } else {
        scf.yield %2503 : i64
      }
      %2509 = func.call @cc_errorp(%2463) : (i64) -> i64
      %2510 = arith.cmpi ne, %2509, %2483 : i64
      %2511 = arith.cmpi eq, %2508, %2483 : i64
      %2512 = arith.andi %2510, %2511 : i1
      %2513 = scf.if %2512 -> (i64) {
        scf.yield %2463 : i64
      } else {
        scf.yield %2508 : i64
      }
      %2514 = func.call @cc_errorp(%2470) : (i64) -> i64
      %2515 = arith.cmpi ne, %2514, %2483 : i64
      %2516 = arith.cmpi eq, %2513, %2483 : i64
      %2517 = arith.andi %2515, %2516 : i1
      %2518 = scf.if %2517 -> (i64) {
        scf.yield %2470 : i64
      } else {
        scf.yield %2513 : i64
      }
      %2519 = func.call @cc_errorp(%2482) : (i64) -> i64
      %2520 = arith.cmpi ne, %2519, %2483 : i64
      %2521 = arith.cmpi eq, %2518, %2483 : i64
      %2522 = arith.andi %2520, %2521 : i1
      %2523 = scf.if %2522 -> (i64) {
        scf.yield %2482 : i64
      } else {
        scf.yield %2518 : i64
      }
      %2524 = arith.cmpi ne, %2523, %2483 : i64
      scf.if %2524 {
        func.call @stack_push_pointer(%2523) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2243) : (i64) -> ()
        func.call @stack_push_pointer(%2333) : (i64) -> ()
        func.call @stack_push_pointer(%2429) : (i64) -> ()
        func.call @stack_push_pointer(%2452) : (i64) -> ()
        func.call @stack_push_pointer(%2459) : (i64) -> ()
        func.call @stack_push_pointer(%2463) : (i64) -> ()
        func.call @stack_push_pointer(%2470) : (i64) -> ()
        func.call @stack_push_pointer(%2482) : (i64) -> ()
        %2525 = llvm.mlir.addressof @str179 : !llvm.ptr
        %2526 = func.call @cc_make_function_ref_const(%2525) : (!llvm.ptr) -> i64
        %2527 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2526, %2527) : (i64, i64) -> ()
      }
      %2528 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2528 : i64
    }
    %2529 = func.call @cc_nil_value() : () -> i64
    %2530 = func.call @cc_errorp(%2234) : (i64) -> i64
    %2531 = arith.cmpi ne, %2530, %2529 : i64
    %2532 = scf.if %2531 -> (i64) {
      scf.yield %2234 : i64
    } else {
      %2533 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2534 = arith.constant 31 : i64
      %2535 = func.call @cc_make_string(%2533, %2534) : (!llvm.ptr, i64) -> i64
      %2536 = func.call @cc_nil_value() : () -> i64
      %2537 = func.call @cc_intern(%2535, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_nil_value() : () -> i64
      %2539 = func.call @cc_cons(%2537, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_values_pack(%2539) : (i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2541 = arith.addi %2537, %__rlasp_stack_elide_zero_123 : i64
      %2542 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2543 = arith.constant 4 : i64
      %2544 = func.call @cc_make_string(%2542, %2543) : (!llvm.ptr, i64) -> i64
      %2545 = func.call @cc_nil_value() : () -> i64
      %2546 = func.call @cc_intern(%2544, %2545) : (i64, i64) -> i64
      %2547 = func.call @cc_nil_value() : () -> i64
      %2548 = func.call @cc_cons(%2546, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_values_pack(%2548) : (i64) -> i64
      func.call @stack_push_pointer(%2546) : (i64) -> ()
      %2550 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2551 = arith.constant 3 : i64
      %2552 = func.call @cc_make_string(%2550, %2551) : (!llvm.ptr, i64) -> i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = func.call @cc_intern(%2552, %2553) : (i64, i64) -> i64
      %2555 = func.call @cc_nil_value() : () -> i64
      %2556 = func.call @cc_cons(%2554, %2555) : (i64, i64) -> i64
      %2557 = func.call @cc_values_pack(%2556) : (i64) -> i64
      func.call @stack_push_pointer(%2554) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2558 = func.call @stack_pop_pointer() : () -> i64
      %2559 = func.call @stack_pop_pointer() : () -> i64
      %2560 = func.call @cc_cons(%2559, %2558) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2561 = arith.addi %2560, %__rlasp_stack_elide_zero_124 : i64
      %2562 = func.call @stack_pop_pointer() : () -> i64
      %2563 = func.call @cc_cons(%2562, %2561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      %2564 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2565 = arith.constant 15 : i64
      %2566 = func.call @cc_make_string(%2564, %2565) : (!llvm.ptr, i64) -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_intern(%2566, %2567) : (i64, i64) -> i64
      %2569 = func.call @cc_nil_value() : () -> i64
      %2570 = func.call @cc_cons(%2568, %2569) : (i64, i64) -> i64
      %2571 = func.call @cc_values_pack(%2570) : (i64) -> i64
      func.call @stack_push_pointer(%2568) : (i64) -> ()
      %2572 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2573 = arith.constant 4 : i64
      %2574 = func.call @cc_make_string(%2572, %2573) : (!llvm.ptr, i64) -> i64
      %2575 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2576 = arith.constant 11 : i64
      %2577 = func.call @cc_make_string(%2575, %2576) : (!llvm.ptr, i64) -> i64
      %2578 = func.call @cc_intern(%2574, %2577) : (i64, i64) -> i64
      %2579 = func.call @cc_nil_value() : () -> i64
      %2580 = func.call @cc_cons(%2578, %2579) : (i64, i64) -> i64
      %2581 = func.call @cc_values_pack(%2580) : (i64) -> i64
      func.call @stack_push_pointer(%2578) : (i64) -> ()
      %2582 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2583 = arith.constant 26 : i64
      %2584 = func.call @cc_make_string(%2582, %2583) : (!llvm.ptr, i64) -> i64
      %2585 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2586 = arith.constant 11 : i64
      %2587 = func.call @cc_make_string(%2585, %2586) : (!llvm.ptr, i64) -> i64
      %2588 = func.call @cc_intern(%2584, %2587) : (i64, i64) -> i64
      %2589 = func.call @cc_nil_value() : () -> i64
      %2590 = func.call @cc_cons(%2588, %2589) : (i64, i64) -> i64
      %2591 = func.call @cc_values_pack(%2590) : (i64) -> i64
      func.call @stack_push_pointer(%2588) : (i64) -> ()
      %2592 = arith.constant -3.0 : f64
      %2593 = func.call @cc_box_float(%2592) : (f64) -> i64
      func.call @stack_push_pointer(%2593) : (i64) -> ()
      %2594 = arith.constant 0.0 : f64
      %2595 = func.call @cc_box_float(%2594) : (f64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      %2596 = arith.constant 3.0 : f64
      %2597 = func.call @cc_box_float(%2596) : (f64) -> i64
      func.call @stack_push_pointer(%2597) : (i64) -> ()
      %2598 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2599 = arith.constant 26 : i64
      %2600 = func.call @cc_make_string(%2598, %2599) : (!llvm.ptr, i64) -> i64
      %2601 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2602 = arith.constant 11 : i64
      %2603 = func.call @cc_make_string(%2601, %2602) : (!llvm.ptr, i64) -> i64
      %2604 = func.call @cc_intern(%2600, %2603) : (i64, i64) -> i64
      %2605 = func.call @cc_nil_value() : () -> i64
      %2606 = func.call @cc_cons(%2604, %2605) : (i64, i64) -> i64
      %2607 = func.call @cc_values_pack(%2606) : (i64) -> i64
      func.call @stack_push_pointer(%2604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2608 = func.call @stack_pop_pointer() : () -> i64
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = func.call @cc_cons(%2609, %2608) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2611 = arith.addi %2610, %__rlasp_stack_elide_zero_125 : i64
      %2612 = func.call @stack_pop_pointer() : () -> i64
      %2613 = func.call @cc_cons(%2612, %2611) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2614 = arith.addi %2613, %__rlasp_stack_elide_zero_126 : i64
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = func.call @cc_cons(%2615, %2614) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2617 = arith.addi %2616, %__rlasp_stack_elide_zero_127 : i64
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @cc_cons(%2618, %2617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2620 = arith.addi %2619, %__rlasp_stack_elide_zero_128 : i64
      %2621 = func.call @stack_pop_pointer() : () -> i64
      %2622 = func.call @cc_cons(%2621, %2620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2623 = arith.addi %2622, %__rlasp_stack_elide_zero_129 : i64
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = func.call @cc_cons(%2624, %2623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2625) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = func.call @cc_cons(%2627, %2626) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2629 = arith.addi %2628, %__rlasp_stack_elide_zero_130 : i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2630, %2629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2631) : (i64) -> ()
      %2632 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2633 = arith.constant 4 : i64
      %2634 = func.call @cc_make_string(%2632, %2633) : (!llvm.ptr, i64) -> i64
      %2635 = func.call @cc_nil_value() : () -> i64
      %2636 = func.call @cc_intern(%2634, %2635) : (i64, i64) -> i64
      %2637 = func.call @cc_nil_value() : () -> i64
      %2638 = func.call @cc_cons(%2636, %2637) : (i64, i64) -> i64
      %2639 = func.call @cc_values_pack(%2638) : (i64) -> i64
      func.call @stack_push_pointer(%2636) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2643 = arith.addi %2642, %__rlasp_stack_elide_zero_131 : i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2645) : (i64) -> ()
      %2646 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2647 = arith.constant 15 : i64
      %2648 = func.call @cc_make_string(%2646, %2647) : (!llvm.ptr, i64) -> i64
      %2649 = func.call @cc_nil_value() : () -> i64
      %2650 = func.call @cc_intern(%2648, %2649) : (i64, i64) -> i64
      %2651 = func.call @cc_nil_value() : () -> i64
      %2652 = func.call @cc_cons(%2650, %2651) : (i64, i64) -> i64
      %2653 = func.call @cc_values_pack(%2652) : (i64) -> i64
      func.call @stack_push_pointer(%2650) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2654 = func.call @stack_pop_pointer() : () -> i64
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = func.call @cc_cons(%2655, %2654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2657 = arith.addi %2656, %__rlasp_stack_elide_zero_132 : i64
      %2658 = func.call @stack_pop_pointer() : () -> i64
      %2659 = func.call @cc_cons(%2658, %2657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2659) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2660 = func.call @stack_pop_pointer() : () -> i64
      %2661 = func.call @stack_pop_pointer() : () -> i64
      %2662 = func.call @cc_cons(%2661, %2660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2663 = arith.addi %2662, %__rlasp_stack_elide_zero_133 : i64
      %2664 = func.call @stack_pop_pointer() : () -> i64
      %2665 = func.call @cc_cons(%2664, %2663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2666 = arith.addi %2665, %__rlasp_stack_elide_zero_134 : i64
      %2667 = func.call @stack_pop_pointer() : () -> i64
      %2668 = func.call @cc_cons(%2667, %2666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2669 = arith.addi %2668, %__rlasp_stack_elide_zero_135 : i64
      %2670 = func.call @stack_pop_pointer() : () -> i64
      %2671 = func.call @cc_cons(%2670, %2669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2671) : (i64) -> ()
      %2672 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2673 = arith.constant 5 : i64
      %2674 = func.call @cc_make_string(%2672, %2673) : (!llvm.ptr, i64) -> i64
      %2675 = func.call @cc_nil_value() : () -> i64
      %2676 = func.call @cc_intern(%2674, %2675) : (i64, i64) -> i64
      %2677 = func.call @cc_nil_value() : () -> i64
      %2678 = func.call @cc_cons(%2676, %2677) : (i64, i64) -> i64
      %2679 = func.call @cc_values_pack(%2678) : (i64) -> i64
      func.call @stack_push_pointer(%2676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2680 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2681 = arith.constant 5 : i64
      %2682 = func.call @cc_make_string(%2680, %2681) : (!llvm.ptr, i64) -> i64
      %2683 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2684 = arith.constant 3 : i64
      %2685 = func.call @cc_make_string(%2683, %2684) : (!llvm.ptr, i64) -> i64
      %2686 = func.call @cc_intern(%2682, %2685) : (i64, i64) -> i64
      %2687 = func.call @cc_nil_value() : () -> i64
      %2688 = func.call @cc_cons(%2686, %2687) : (i64, i64) -> i64
      %2689 = func.call @cc_values_pack(%2688) : (i64) -> i64
      func.call @stack_push_pointer(%2686) : (i64) -> ()
      %2690 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2691 = arith.constant 15 : i64
      %2692 = func.call @cc_make_string(%2690, %2691) : (!llvm.ptr, i64) -> i64
      %2693 = func.call @cc_nil_value() : () -> i64
      %2694 = func.call @cc_intern(%2692, %2693) : (i64, i64) -> i64
      %2695 = func.call @cc_nil_value() : () -> i64
      %2696 = func.call @cc_cons(%2694, %2695) : (i64, i64) -> i64
      %2697 = func.call @cc_values_pack(%2696) : (i64) -> i64
      func.call @stack_push_pointer(%2694) : (i64) -> ()
      %2698 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2699 = arith.constant 5 : i64
      %2700 = func.call @cc_make_string(%2698, %2699) : (!llvm.ptr, i64) -> i64
      %2701 = func.call @cc_nil_value() : () -> i64
      %2702 = func.call @cc_intern(%2700, %2701) : (i64, i64) -> i64
      %2703 = func.call @cc_nil_value() : () -> i64
      %2704 = func.call @cc_cons(%2702, %2703) : (i64, i64) -> i64
      %2705 = func.call @cc_values_pack(%2704) : (i64) -> i64
      func.call @stack_push_pointer(%2702) : (i64) -> ()
      %2706 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2707 = arith.constant 2 : i64
      %2708 = func.call @cc_make_string(%2706, %2707) : (!llvm.ptr, i64) -> i64
      %2709 = func.call @cc_nil_value() : () -> i64
      %2710 = func.call @cc_intern(%2708, %2709) : (i64, i64) -> i64
      %2711 = func.call @cc_nil_value() : () -> i64
      %2712 = func.call @cc_cons(%2710, %2711) : (i64, i64) -> i64
      %2713 = func.call @cc_values_pack(%2712) : (i64) -> i64
      func.call @stack_push_pointer(%2710) : (i64) -> ()
      %2714 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2715 = arith.constant 3 : i64
      %2716 = func.call @cc_make_string(%2714, %2715) : (!llvm.ptr, i64) -> i64
      %2717 = func.call @cc_nil_value() : () -> i64
      %2718 = func.call @cc_intern(%2716, %2717) : (i64, i64) -> i64
      %2719 = func.call @cc_nil_value() : () -> i64
      %2720 = func.call @cc_cons(%2718, %2719) : (i64, i64) -> i64
      %2721 = func.call @cc_values_pack(%2720) : (i64) -> i64
      func.call @stack_push_pointer(%2718) : (i64) -> ()
      %2722 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2723 = arith.constant 3 : i64
      %2724 = func.call @cc_make_string(%2722, %2723) : (!llvm.ptr, i64) -> i64
      %2725 = func.call @cc_nil_value() : () -> i64
      %2726 = func.call @cc_intern(%2724, %2725) : (i64, i64) -> i64
      %2727 = func.call @cc_nil_value() : () -> i64
      %2728 = func.call @cc_cons(%2726, %2727) : (i64, i64) -> i64
      %2729 = func.call @cc_values_pack(%2728) : (i64) -> i64
      func.call @stack_push_pointer(%2726) : (i64) -> ()
      %2730 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2731 = arith.constant 4 : i64
      %2732 = func.call @cc_make_string(%2730, %2731) : (!llvm.ptr, i64) -> i64
      %2733 = func.call @cc_nil_value() : () -> i64
      %2734 = func.call @cc_intern(%2732, %2733) : (i64, i64) -> i64
      %2735 = func.call @cc_nil_value() : () -> i64
      %2736 = func.call @cc_cons(%2734, %2735) : (i64, i64) -> i64
      %2737 = func.call @cc_values_pack(%2736) : (i64) -> i64
      func.call @stack_push_pointer(%2734) : (i64) -> ()
      %2738 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2739 = arith.constant 15 : i64
      %2740 = func.call @cc_make_string(%2738, %2739) : (!llvm.ptr, i64) -> i64
      %2741 = func.call @cc_nil_value() : () -> i64
      %2742 = func.call @cc_intern(%2740, %2741) : (i64, i64) -> i64
      %2743 = func.call @cc_nil_value() : () -> i64
      %2744 = func.call @cc_cons(%2742, %2743) : (i64, i64) -> i64
      %2745 = func.call @cc_values_pack(%2744) : (i64) -> i64
      func.call @stack_push_pointer(%2742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2746 = func.call @stack_pop_pointer() : () -> i64
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @cc_cons(%2747, %2746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2749 = arith.addi %2748, %__rlasp_stack_elide_zero_136 : i64
      %2750 = func.call @stack_pop_pointer() : () -> i64
      %2751 = func.call @cc_cons(%2750, %2749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_cons(%2753, %2752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2755 = arith.addi %2754, %__rlasp_stack_elide_zero_137 : i64
      %2756 = func.call @stack_pop_pointer() : () -> i64
      %2757 = func.call @cc_cons(%2756, %2755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2757) : (i64) -> ()
      %2758 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2759 = arith.constant 3 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = func.call @cc_nil_value() : () -> i64
      %2762 = func.call @cc_intern(%2760, %2761) : (i64, i64) -> i64
      %2763 = func.call @cc_nil_value() : () -> i64
      %2764 = func.call @cc_cons(%2762, %2763) : (i64, i64) -> i64
      %2765 = func.call @cc_values_pack(%2764) : (i64) -> i64
      func.call @stack_push_pointer(%2762) : (i64) -> ()
      %2766 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2767 = arith.constant 5 : i64
      %2768 = func.call @cc_make_string(%2766, %2767) : (!llvm.ptr, i64) -> i64
      %2769 = func.call @cc_nil_value() : () -> i64
      %2770 = func.call @cc_intern(%2768, %2769) : (i64, i64) -> i64
      %2771 = func.call @cc_nil_value() : () -> i64
      %2772 = func.call @cc_cons(%2770, %2771) : (i64, i64) -> i64
      %2773 = func.call @cc_values_pack(%2772) : (i64) -> i64
      func.call @stack_push_pointer(%2770) : (i64) -> ()
      %2774 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2775 = arith.constant 15 : i64
      %2776 = func.call @cc_make_string(%2774, %2775) : (!llvm.ptr, i64) -> i64
      %2777 = func.call @cc_nil_value() : () -> i64
      %2778 = func.call @cc_intern(%2776, %2777) : (i64, i64) -> i64
      %2779 = func.call @cc_nil_value() : () -> i64
      %2780 = func.call @cc_cons(%2778, %2779) : (i64, i64) -> i64
      %2781 = func.call @cc_values_pack(%2780) : (i64) -> i64
      func.call @stack_push_pointer(%2778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2782 = func.call @stack_pop_pointer() : () -> i64
      %2783 = func.call @stack_pop_pointer() : () -> i64
      %2784 = func.call @cc_cons(%2783, %2782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2785 = arith.addi %2784, %__rlasp_stack_elide_zero_138 : i64
      %2786 = func.call @stack_pop_pointer() : () -> i64
      %2787 = func.call @cc_cons(%2786, %2785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2788 = func.call @stack_pop_pointer() : () -> i64
      %2789 = func.call @stack_pop_pointer() : () -> i64
      %2790 = func.call @cc_cons(%2789, %2788) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2791 = arith.addi %2790, %__rlasp_stack_elide_zero_139 : i64
      %2792 = func.call @stack_pop_pointer() : () -> i64
      %2793 = func.call @cc_cons(%2792, %2791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2794 = func.call @stack_pop_pointer() : () -> i64
      %2795 = func.call @stack_pop_pointer() : () -> i64
      %2796 = func.call @cc_cons(%2795, %2794) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2797 = arith.addi %2796, %__rlasp_stack_elide_zero_140 : i64
      %2798 = func.call @stack_pop_pointer() : () -> i64
      %2799 = func.call @cc_cons(%2798, %2797) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2800 = arith.addi %2799, %__rlasp_stack_elide_zero_141 : i64
      %2801 = func.call @stack_pop_pointer() : () -> i64
      %2802 = func.call @cc_cons(%2801, %2800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2802) : (i64) -> ()
      %2803 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2804 = arith.constant 11 : i64
      %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
      %2806 = func.call @cc_nil_value() : () -> i64
      %2807 = func.call @cc_intern(%2805, %2806) : (i64, i64) -> i64
      %2808 = func.call @cc_nil_value() : () -> i64
      %2809 = func.call @cc_cons(%2807, %2808) : (i64, i64) -> i64
      %2810 = func.call @cc_values_pack(%2809) : (i64) -> i64
      func.call @stack_push_pointer(%2807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2811 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2812 = arith.constant 5 : i64
      %2813 = func.call @cc_make_string(%2811, %2812) : (!llvm.ptr, i64) -> i64
      %2814 = func.call @cc_nil_value() : () -> i64
      %2815 = func.call @cc_intern(%2813, %2814) : (i64, i64) -> i64
      %2816 = func.call @cc_nil_value() : () -> i64
      %2817 = func.call @cc_cons(%2815, %2816) : (i64, i64) -> i64
      %2818 = func.call @cc_values_pack(%2817) : (i64) -> i64
      func.call @stack_push_pointer(%2815) : (i64) -> ()
      %2819 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      %2820 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2821 = arith.constant 10 : i64
      %2822 = func.call @cc_make_string(%2820, %2821) : (!llvm.ptr, i64) -> i64
      %2823 = func.call @cc_nil_value() : () -> i64
      %2824 = func.call @cc_intern(%2822, %2823) : (i64, i64) -> i64
      %2825 = func.call @cc_nil_value() : () -> i64
      %2826 = func.call @cc_cons(%2824, %2825) : (i64, i64) -> i64
      %2827 = func.call @cc_values_pack(%2826) : (i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2828 = arith.addi %2824, %__rlasp_stack_elide_zero_142 : i64
      %2829 = func.call @stack_pop_pointer() : () -> i64
      %2830 = func.call @cc_cons(%2828, %2829) : (i64, i64) -> i64
      %2831 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2832 = arith.constant 5 : i64
      %2833 = func.call @cc_make_string(%2831, %2832) : (!llvm.ptr, i64) -> i64
      %2834 = func.call @cc_nil_value() : () -> i64
      %2835 = func.call @cc_intern(%2833, %2834) : (i64, i64) -> i64
      %2836 = func.call @cc_nil_value() : () -> i64
      %2837 = func.call @cc_cons(%2835, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_values_pack(%2837) : (i64) -> i64
      %2839 = func.call @cc_cons(%2835, %2830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2839) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @stack_pop_pointer() : () -> i64
      %2842 = func.call @cc_cons(%2841, %2840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2843 = arith.addi %2842, %__rlasp_stack_elide_zero_143 : i64
      %2844 = func.call @stack_pop_pointer() : () -> i64
      %2845 = func.call @cc_cons(%2844, %2843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2846 = func.call @stack_pop_pointer() : () -> i64
      %2847 = func.call @stack_pop_pointer() : () -> i64
      %2848 = func.call @cc_cons(%2847, %2846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2849 = arith.addi %2848, %__rlasp_stack_elide_zero_144 : i64
      %2850 = func.call @stack_pop_pointer() : () -> i64
      %2851 = func.call @cc_cons(%2850, %2849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2852 = arith.addi %2851, %__rlasp_stack_elide_zero_145 : i64
      %2853 = func.call @stack_pop_pointer() : () -> i64
      %2854 = func.call @cc_cons(%2853, %2852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2855 = func.call @stack_pop_pointer() : () -> i64
      %2856 = func.call @stack_pop_pointer() : () -> i64
      %2857 = func.call @cc_cons(%2856, %2855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2858 = arith.addi %2857, %__rlasp_stack_elide_zero_146 : i64
      %2859 = func.call @stack_pop_pointer() : () -> i64
      %2860 = func.call @cc_cons(%2859, %2858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2861 = arith.addi %2860, %__rlasp_stack_elide_zero_147 : i64
      %2862 = func.call @stack_pop_pointer() : () -> i64
      %2863 = func.call @cc_cons(%2862, %2861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2864 = arith.addi %2863, %__rlasp_stack_elide_zero_148 : i64
      %2865 = func.call @stack_pop_pointer() : () -> i64
      %2866 = func.call @cc_cons(%2865, %2864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2866) : (i64) -> ()
      %2867 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2868 = arith.constant 4 : i64
      %2869 = func.call @cc_make_string(%2867, %2868) : (!llvm.ptr, i64) -> i64
      %2870 = func.call @cc_nil_value() : () -> i64
      %2871 = func.call @cc_intern(%2869, %2870) : (i64, i64) -> i64
      %2872 = func.call @cc_nil_value() : () -> i64
      %2873 = func.call @cc_cons(%2871, %2872) : (i64, i64) -> i64
      %2874 = func.call @cc_values_pack(%2873) : (i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
      %2875 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2876 = arith.constant 3 : i64
      %2877 = func.call @cc_make_string(%2875, %2876) : (!llvm.ptr, i64) -> i64
      %2878 = func.call @cc_nil_value() : () -> i64
      %2879 = func.call @cc_intern(%2877, %2878) : (i64, i64) -> i64
      %2880 = func.call @cc_nil_value() : () -> i64
      %2881 = func.call @cc_cons(%2879, %2880) : (i64, i64) -> i64
      %2882 = func.call @cc_values_pack(%2881) : (i64) -> i64
      func.call @stack_push_pointer(%2879) : (i64) -> ()
      %2883 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2884 = arith.constant 3 : i64
      %2885 = func.call @cc_make_string(%2883, %2884) : (!llvm.ptr, i64) -> i64
      %2886 = func.call @cc_nil_value() : () -> i64
      %2887 = func.call @cc_intern(%2885, %2886) : (i64, i64) -> i64
      %2888 = func.call @cc_nil_value() : () -> i64
      %2889 = func.call @cc_cons(%2887, %2888) : (i64, i64) -> i64
      %2890 = func.call @cc_values_pack(%2889) : (i64) -> i64
      func.call @stack_push_pointer(%2887) : (i64) -> ()
      %2891 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2892 = arith.constant 15 : i64
      %2893 = func.call @cc_make_string(%2891, %2892) : (!llvm.ptr, i64) -> i64
      %2894 = func.call @cc_nil_value() : () -> i64
      %2895 = func.call @cc_intern(%2893, %2894) : (i64, i64) -> i64
      %2896 = func.call @cc_nil_value() : () -> i64
      %2897 = func.call @cc_cons(%2895, %2896) : (i64, i64) -> i64
      %2898 = func.call @cc_values_pack(%2897) : (i64) -> i64
      func.call @stack_push_pointer(%2895) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2899 = func.call @stack_pop_pointer() : () -> i64
      %2900 = func.call @stack_pop_pointer() : () -> i64
      %2901 = func.call @cc_cons(%2900, %2899) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %2902 = arith.addi %2901, %__rlasp_stack_elide_zero_149 : i64
      %2903 = func.call @stack_pop_pointer() : () -> i64
      %2904 = func.call @cc_cons(%2903, %2902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2904) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2905 = func.call @stack_pop_pointer() : () -> i64
      %2906 = func.call @stack_pop_pointer() : () -> i64
      %2907 = func.call @cc_cons(%2906, %2905) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %2908 = arith.addi %2907, %__rlasp_stack_elide_zero_150 : i64
      %2909 = func.call @stack_pop_pointer() : () -> i64
      %2910 = func.call @cc_cons(%2909, %2908) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %2911 = arith.addi %2910, %__rlasp_stack_elide_zero_151 : i64
      %2912 = func.call @stack_pop_pointer() : () -> i64
      %2913 = func.call @cc_cons(%2912, %2911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2913) : (i64) -> ()
      %2914 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2915 = arith.constant 4 : i64
      %2916 = func.call @cc_make_string(%2914, %2915) : (!llvm.ptr, i64) -> i64
      %2917 = func.call @cc_nil_value() : () -> i64
      %2918 = func.call @cc_intern(%2916, %2917) : (i64, i64) -> i64
      %2919 = func.call @cc_nil_value() : () -> i64
      %2920 = func.call @cc_cons(%2918, %2919) : (i64, i64) -> i64
      %2921 = func.call @cc_values_pack(%2920) : (i64) -> i64
      func.call @stack_push_pointer(%2918) : (i64) -> ()
      %2922 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2923 = arith.constant 4 : i64
      %2924 = func.call @cc_make_string(%2922, %2923) : (!llvm.ptr, i64) -> i64
      %2925 = func.call @cc_nil_value() : () -> i64
      %2926 = func.call @cc_intern(%2924, %2925) : (i64, i64) -> i64
      %2927 = func.call @cc_nil_value() : () -> i64
      %2928 = func.call @cc_cons(%2926, %2927) : (i64, i64) -> i64
      %2929 = func.call @cc_values_pack(%2928) : (i64) -> i64
      func.call @stack_push_pointer(%2926) : (i64) -> ()
      %2930 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2931 = arith.constant 20 : i64
      %2932 = func.call @cc_make_string(%2930, %2931) : (!llvm.ptr, i64) -> i64
      %2933 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2934 = arith.constant 3 : i64
      %2935 = func.call @cc_make_string(%2933, %2934) : (!llvm.ptr, i64) -> i64
      %2936 = func.call @cc_intern(%2932, %2935) : (i64, i64) -> i64
      %2937 = func.call @cc_nil_value() : () -> i64
      %2938 = func.call @cc_cons(%2936, %2937) : (i64, i64) -> i64
      %2939 = func.call @cc_values_pack(%2938) : (i64) -> i64
      func.call @stack_push_pointer(%2936) : (i64) -> ()
      %2940 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2941 = arith.constant 3 : i64
      %2942 = func.call @cc_make_string(%2940, %2941) : (!llvm.ptr, i64) -> i64
      %2943 = func.call @cc_nil_value() : () -> i64
      %2944 = func.call @cc_intern(%2942, %2943) : (i64, i64) -> i64
      %2945 = func.call @cc_nil_value() : () -> i64
      %2946 = func.call @cc_cons(%2944, %2945) : (i64, i64) -> i64
      %2947 = func.call @cc_values_pack(%2946) : (i64) -> i64
      func.call @stack_push_pointer(%2944) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2948 = func.call @stack_pop_pointer() : () -> i64
      %2949 = func.call @stack_pop_pointer() : () -> i64
      %2950 = func.call @cc_cons(%2949, %2948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %2951 = arith.addi %2950, %__rlasp_stack_elide_zero_152 : i64
      %2952 = func.call @stack_pop_pointer() : () -> i64
      %2953 = func.call @cc_cons(%2952, %2951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2954 = func.call @stack_pop_pointer() : () -> i64
      %2955 = func.call @stack_pop_pointer() : () -> i64
      %2956 = func.call @cc_cons(%2955, %2954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %2957 = arith.addi %2956, %__rlasp_stack_elide_zero_153 : i64
      %2958 = func.call @stack_pop_pointer() : () -> i64
      %2959 = func.call @cc_cons(%2958, %2957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %2960 = arith.addi %2959, %__rlasp_stack_elide_zero_154 : i64
      %2961 = func.call @stack_pop_pointer() : () -> i64
      %2962 = func.call @cc_cons(%2961, %2960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2962) : (i64) -> ()
      %2963 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2964 = arith.constant 2 : i64
      %2965 = func.call @cc_make_string(%2963, %2964) : (!llvm.ptr, i64) -> i64
      %2966 = func.call @cc_nil_value() : () -> i64
      %2967 = func.call @cc_intern(%2965, %2966) : (i64, i64) -> i64
      %2968 = func.call @cc_nil_value() : () -> i64
      %2969 = func.call @cc_cons(%2967, %2968) : (i64, i64) -> i64
      %2970 = func.call @cc_values_pack(%2969) : (i64) -> i64
      func.call @stack_push_pointer(%2967) : (i64) -> ()
      %2971 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2972 = arith.constant 3 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = func.call @cc_nil_value() : () -> i64
      %2975 = func.call @cc_intern(%2973, %2974) : (i64, i64) -> i64
      %2976 = func.call @cc_nil_value() : () -> i64
      %2977 = func.call @cc_cons(%2975, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_values_pack(%2977) : (i64) -> i64
      func.call @stack_push_pointer(%2975) : (i64) -> ()
      %2979 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2980 = arith.constant 1 : i64
      %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
      %2982 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2983 = arith.constant 11 : i64
      %2984 = func.call @cc_make_string(%2982, %2983) : (!llvm.ptr, i64) -> i64
      %2985 = func.call @cc_intern(%2981, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_values_pack(%2987) : (i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2989 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2990 = arith.constant 3 : i64
      %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
      %2992 = func.call @cc_nil_value() : () -> i64
      %2993 = func.call @cc_intern(%2991, %2992) : (i64, i64) -> i64
      %2994 = func.call @cc_nil_value() : () -> i64
      %2995 = func.call @cc_cons(%2993, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_values_pack(%2995) : (i64) -> i64
      func.call @stack_push_pointer(%2993) : (i64) -> ()
      %2997 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2998 = arith.constant 20 : i64
      %2999 = func.call @cc_make_string(%2997, %2998) : (!llvm.ptr, i64) -> i64
      %3000 = llvm.mlir.addressof @str224 : !llvm.ptr
      %3001 = arith.constant 3 : i64
      %3002 = func.call @cc_make_string(%3000, %3001) : (!llvm.ptr, i64) -> i64
      %3003 = func.call @cc_intern(%2999, %3002) : (i64, i64) -> i64
      %3004 = func.call @cc_nil_value() : () -> i64
      %3005 = func.call @cc_cons(%3003, %3004) : (i64, i64) -> i64
      %3006 = func.call @cc_values_pack(%3005) : (i64) -> i64
      func.call @stack_push_pointer(%3003) : (i64) -> ()
      %3007 = llvm.mlir.addressof @str225 : !llvm.ptr
      %3008 = arith.constant 4 : i64
      %3009 = func.call @cc_make_string(%3007, %3008) : (!llvm.ptr, i64) -> i64
      %3010 = func.call @cc_nil_value() : () -> i64
      %3011 = func.call @cc_intern(%3009, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_nil_value() : () -> i64
      %3013 = func.call @cc_cons(%3011, %3012) : (i64, i64) -> i64
      %3014 = func.call @cc_values_pack(%3013) : (i64) -> i64
      func.call @stack_push_pointer(%3011) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3015 = func.call @stack_pop_pointer() : () -> i64
      %3016 = func.call @stack_pop_pointer() : () -> i64
      %3017 = func.call @cc_cons(%3016, %3015) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3018 = arith.addi %3017, %__rlasp_stack_elide_zero_155 : i64
      %3019 = func.call @stack_pop_pointer() : () -> i64
      %3020 = func.call @cc_cons(%3019, %3018) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3020) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3021 = func.call @stack_pop_pointer() : () -> i64
      %3022 = func.call @stack_pop_pointer() : () -> i64
      %3023 = func.call @cc_cons(%3022, %3021) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3024 = arith.addi %3023, %__rlasp_stack_elide_zero_156 : i64
      %3025 = func.call @stack_pop_pointer() : () -> i64
      %3026 = func.call @cc_cons(%3025, %3024) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3027 = arith.addi %3026, %__rlasp_stack_elide_zero_157 : i64
      %3028 = func.call @stack_pop_pointer() : () -> i64
      %3029 = func.call @cc_cons(%3028, %3027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3029) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3030 = func.call @stack_pop_pointer() : () -> i64
      %3031 = func.call @stack_pop_pointer() : () -> i64
      %3032 = func.call @cc_cons(%3031, %3030) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3033 = arith.addi %3032, %__rlasp_stack_elide_zero_158 : i64
      %3034 = func.call @stack_pop_pointer() : () -> i64
      %3035 = func.call @cc_cons(%3034, %3033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3035) : (i64) -> ()
      %3036 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3037 = arith.constant 5 : i64
      %3038 = func.call @cc_make_string(%3036, %3037) : (!llvm.ptr, i64) -> i64
      %3039 = func.call @cc_nil_value() : () -> i64
      %3040 = func.call @cc_intern(%3038, %3039) : (i64, i64) -> i64
      %3041 = func.call @cc_nil_value() : () -> i64
      %3042 = func.call @cc_cons(%3040, %3041) : (i64, i64) -> i64
      %3043 = func.call @cc_values_pack(%3042) : (i64) -> i64
      func.call @stack_push_pointer(%3040) : (i64) -> ()
      %3044 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3045 = arith.constant 4 : i64
      %3046 = func.call @cc_make_string(%3044, %3045) : (!llvm.ptr, i64) -> i64
      %3047 = func.call @cc_nil_value() : () -> i64
      %3048 = func.call @cc_intern(%3046, %3047) : (i64, i64) -> i64
      %3049 = func.call @cc_nil_value() : () -> i64
      %3050 = func.call @cc_cons(%3048, %3049) : (i64, i64) -> i64
      %3051 = func.call @cc_values_pack(%3050) : (i64) -> i64
      func.call @stack_push_pointer(%3048) : (i64) -> ()
      %3052 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3053 = arith.constant 15 : i64
      %3054 = func.call @cc_make_string(%3052, %3053) : (!llvm.ptr, i64) -> i64
      %3055 = func.call @cc_nil_value() : () -> i64
      %3056 = func.call @cc_intern(%3054, %3055) : (i64, i64) -> i64
      %3057 = func.call @cc_nil_value() : () -> i64
      %3058 = func.call @cc_cons(%3056, %3057) : (i64, i64) -> i64
      %3059 = func.call @cc_values_pack(%3058) : (i64) -> i64
      func.call @stack_push_pointer(%3056) : (i64) -> ()
      %3060 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3061 = arith.constant 6 : i64
      %3062 = func.call @cc_make_string(%3060, %3061) : (!llvm.ptr, i64) -> i64
      %3063 = func.call @cc_nil_value() : () -> i64
      %3064 = func.call @cc_intern(%3062, %3063) : (i64, i64) -> i64
      %3065 = func.call @cc_nil_value() : () -> i64
      %3066 = func.call @cc_cons(%3064, %3065) : (i64, i64) -> i64
      %3067 = func.call @cc_values_pack(%3066) : (i64) -> i64
      func.call @stack_push_pointer(%3064) : (i64) -> ()
      %3068 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3069 = arith.constant 15 : i64
      %3070 = func.call @cc_make_string(%3068, %3069) : (!llvm.ptr, i64) -> i64
      %3071 = func.call @cc_nil_value() : () -> i64
      %3072 = func.call @cc_intern(%3070, %3071) : (i64, i64) -> i64
      %3073 = func.call @cc_nil_value() : () -> i64
      %3074 = func.call @cc_cons(%3072, %3073) : (i64, i64) -> i64
      %3075 = func.call @cc_values_pack(%3074) : (i64) -> i64
      func.call @stack_push_pointer(%3072) : (i64) -> ()
      %3076 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3077 = arith.constant 4 : i64
      %3078 = func.call @cc_make_string(%3076, %3077) : (!llvm.ptr, i64) -> i64
      %3079 = func.call @cc_nil_value() : () -> i64
      %3080 = func.call @cc_intern(%3078, %3079) : (i64, i64) -> i64
      %3081 = func.call @cc_nil_value() : () -> i64
      %3082 = func.call @cc_cons(%3080, %3081) : (i64, i64) -> i64
      %3083 = func.call @cc_values_pack(%3082) : (i64) -> i64
      func.call @stack_push_pointer(%3080) : (i64) -> ()
      %3084 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3085 = arith.constant 3 : i64
      %3086 = func.call @cc_make_string(%3084, %3085) : (!llvm.ptr, i64) -> i64
      %3087 = func.call @cc_nil_value() : () -> i64
      %3088 = func.call @cc_intern(%3086, %3087) : (i64, i64) -> i64
      %3089 = func.call @cc_nil_value() : () -> i64
      %3090 = func.call @cc_cons(%3088, %3089) : (i64, i64) -> i64
      %3091 = func.call @cc_values_pack(%3090) : (i64) -> i64
      func.call @stack_push_pointer(%3088) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3092 = func.call @stack_pop_pointer() : () -> i64
      %3093 = func.call @stack_pop_pointer() : () -> i64
      %3094 = func.call @cc_cons(%3093, %3092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3095 = arith.addi %3094, %__rlasp_stack_elide_zero_159 : i64
      %3096 = func.call @stack_pop_pointer() : () -> i64
      %3097 = func.call @cc_cons(%3096, %3095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3097) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = func.call @stack_pop_pointer() : () -> i64
      %3100 = func.call @cc_cons(%3099, %3098) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3101 = arith.addi %3100, %__rlasp_stack_elide_zero_160 : i64
      %3102 = func.call @stack_pop_pointer() : () -> i64
      %3103 = func.call @cc_cons(%3102, %3101) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3104 = arith.addi %3103, %__rlasp_stack_elide_zero_161 : i64
      %3105 = func.call @stack_pop_pointer() : () -> i64
      %3106 = func.call @cc_cons(%3105, %3104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3106) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3107 = func.call @stack_pop_pointer() : () -> i64
      %3108 = func.call @stack_pop_pointer() : () -> i64
      %3109 = func.call @cc_cons(%3108, %3107) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3110 = arith.addi %3109, %__rlasp_stack_elide_zero_162 : i64
      %3111 = func.call @stack_pop_pointer() : () -> i64
      %3112 = func.call @cc_cons(%3111, %3110) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3113 = arith.addi %3112, %__rlasp_stack_elide_zero_163 : i64
      %3114 = func.call @stack_pop_pointer() : () -> i64
      %3115 = func.call @cc_cons(%3114, %3113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @stack_pop_pointer() : () -> i64
      %3118 = func.call @cc_cons(%3117, %3116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3119 = arith.addi %3118, %__rlasp_stack_elide_zero_164 : i64
      %3120 = func.call @stack_pop_pointer() : () -> i64
      %3121 = func.call @cc_cons(%3120, %3119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3122 = func.call @stack_pop_pointer() : () -> i64
      %3123 = func.call @stack_pop_pointer() : () -> i64
      %3124 = func.call @cc_cons(%3123, %3122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3125 = arith.addi %3124, %__rlasp_stack_elide_zero_165 : i64
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = func.call @cc_cons(%3126, %3125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3128 = arith.addi %3127, %__rlasp_stack_elide_zero_166 : i64
      %3129 = func.call @stack_pop_pointer() : () -> i64
      %3130 = func.call @cc_cons(%3129, %3128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3131 = arith.addi %3130, %__rlasp_stack_elide_zero_167 : i64
      %3132 = func.call @stack_pop_pointer() : () -> i64
      %3133 = func.call @cc_cons(%3132, %3131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3133) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @stack_pop_pointer() : () -> i64
      %3136 = func.call @cc_cons(%3135, %3134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3137 = arith.addi %3136, %__rlasp_stack_elide_zero_168 : i64
      %3138 = func.call @stack_pop_pointer() : () -> i64
      %3139 = func.call @cc_cons(%3138, %3137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3140 = arith.addi %3139, %__rlasp_stack_elide_zero_169 : i64
      %3141 = func.call @stack_pop_pointer() : () -> i64
      %3142 = func.call @cc_cons(%3141, %3140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3143 = arith.addi %3142, %__rlasp_stack_elide_zero_170 : i64
      %3144 = func.call @stack_pop_pointer() : () -> i64
      %3145 = func.call @cc_cons(%3144, %3143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3146 = arith.addi %3145, %__rlasp_stack_elide_zero_171 : i64
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @cc_cons(%3147, %3146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3148) : (i64) -> ()
      %3149 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3150 = arith.constant 4 : i64
      %3151 = func.call @cc_make_string(%3149, %3150) : (!llvm.ptr, i64) -> i64
      %3152 = func.call @cc_nil_value() : () -> i64
      %3153 = func.call @cc_intern(%3151, %3152) : (i64, i64) -> i64
      %3154 = func.call @cc_nil_value() : () -> i64
      %3155 = func.call @cc_cons(%3153, %3154) : (i64, i64) -> i64
      %3156 = func.call @cc_values_pack(%3155) : (i64) -> i64
      func.call @stack_push_pointer(%3153) : (i64) -> ()
      %3157 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3158 = arith.constant 15 : i64
      %3159 = func.call @cc_make_string(%3157, %3158) : (!llvm.ptr, i64) -> i64
      %3160 = func.call @cc_nil_value() : () -> i64
      %3161 = func.call @cc_intern(%3159, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_nil_value() : () -> i64
      %3163 = func.call @cc_cons(%3161, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_values_pack(%3163) : (i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      %3165 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3166 = arith.constant 3 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = func.call @cc_nil_value() : () -> i64
      %3169 = func.call @cc_intern(%3167, %3168) : (i64, i64) -> i64
      %3170 = func.call @cc_nil_value() : () -> i64
      %3171 = func.call @cc_cons(%3169, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_values_pack(%3171) : (i64) -> i64
      func.call @stack_push_pointer(%3169) : (i64) -> ()
      %3173 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3174 = arith.constant 15 : i64
      %3175 = func.call @cc_make_string(%3173, %3174) : (!llvm.ptr, i64) -> i64
      %3176 = func.call @cc_nil_value() : () -> i64
      %3177 = func.call @cc_intern(%3175, %3176) : (i64, i64) -> i64
      %3178 = func.call @cc_nil_value() : () -> i64
      %3179 = func.call @cc_cons(%3177, %3178) : (i64, i64) -> i64
      %3180 = func.call @cc_values_pack(%3179) : (i64) -> i64
      func.call @stack_push_pointer(%3177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3181 = func.call @stack_pop_pointer() : () -> i64
      %3182 = func.call @stack_pop_pointer() : () -> i64
      %3183 = func.call @cc_cons(%3182, %3181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3184 = arith.addi %3183, %__rlasp_stack_elide_zero_172 : i64
      %3185 = func.call @stack_pop_pointer() : () -> i64
      %3186 = func.call @cc_cons(%3185, %3184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3187 = func.call @stack_pop_pointer() : () -> i64
      %3188 = func.call @stack_pop_pointer() : () -> i64
      %3189 = func.call @cc_cons(%3188, %3187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3190 = arith.addi %3189, %__rlasp_stack_elide_zero_173 : i64
      %3191 = func.call @stack_pop_pointer() : () -> i64
      %3192 = func.call @cc_cons(%3191, %3190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3193 = arith.addi %3192, %__rlasp_stack_elide_zero_174 : i64
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = func.call @cc_cons(%3194, %3193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3195) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3199 = arith.addi %3198, %__rlasp_stack_elide_zero_175 : i64
      %3200 = func.call @stack_pop_pointer() : () -> i64
      %3201 = func.call @cc_cons(%3200, %3199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3202 = arith.addi %3201, %__rlasp_stack_elide_zero_176 : i64
      %3203 = func.call @stack_pop_pointer() : () -> i64
      %3204 = func.call @cc_cons(%3203, %3202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3205 = arith.addi %3204, %__rlasp_stack_elide_zero_177 : i64
      %3206 = func.call @stack_pop_pointer() : () -> i64
      %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3207) : (i64) -> ()
      %3208 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3209 = arith.constant 15 : i64
      %3210 = func.call @cc_make_string(%3208, %3209) : (!llvm.ptr, i64) -> i64
      %3211 = func.call @cc_nil_value() : () -> i64
      %3212 = func.call @cc_intern(%3210, %3211) : (i64, i64) -> i64
      %3213 = func.call @cc_nil_value() : () -> i64
      %3214 = func.call @cc_cons(%3212, %3213) : (i64, i64) -> i64
      %3215 = func.call @cc_values_pack(%3214) : (i64) -> i64
      func.call @stack_push_pointer(%3212) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @cc_cons(%3217, %3216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3219 = arith.addi %3218, %__rlasp_stack_elide_zero_178 : i64
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @cc_cons(%3220, %3219) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3222 = arith.addi %3221, %__rlasp_stack_elide_zero_179 : i64
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @cc_cons(%3223, %3222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3225 = arith.addi %3224, %__rlasp_stack_elide_zero_180 : i64
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = func.call @cc_cons(%3226, %3225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3227) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3228 = func.call @stack_pop_pointer() : () -> i64
      %3229 = func.call @stack_pop_pointer() : () -> i64
      %3230 = func.call @cc_cons(%3229, %3228) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3231 = arith.addi %3230, %__rlasp_stack_elide_zero_181 : i64
      %3232 = func.call @stack_pop_pointer() : () -> i64
      %3233 = func.call @cc_cons(%3232, %3231) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3234 = arith.addi %3233, %__rlasp_stack_elide_zero_182 : i64
      %3235 = func.call @stack_pop_pointer() : () -> i64
      %3236 = func.call @cc_cons(%3235, %3234) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3237 = arith.addi %3236, %__rlasp_stack_elide_zero_183 : i64
      %3616 = arith.constant 162741310455816 : i64
      %3617 = arith.constant 0 : i64
      %3618 = func.call @cc_make_closure(%3616, %3617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3619 = arith.addi %3618, %__rlasp_stack_elide_zero_184 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3620 = func.call @stack_pop_pointer() : () -> i64
      %3621 = func.call @stack_pop_pointer() : () -> i64
      %3622 = func.call @cc_cons(%3621, %3620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3623 = arith.addi %3622, %__rlasp_stack_elide_zero_185 : i64
      %3624 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3625 = arith.constant 11 : i64
      %3626 = func.call @cc_make_string(%3624, %3625) : (!llvm.ptr, i64) -> i64
      %3627 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3628 = arith.constant 7 : i64
      %3629 = func.call @cc_make_string(%3627, %3628) : (!llvm.ptr, i64) -> i64
      %3630 = func.call @cc_intern(%3626, %3629) : (i64, i64) -> i64
      %3631 = func.call @cc_nil_value() : () -> i64
      %3632 = func.call @cc_cons(%3630, %3631) : (i64, i64) -> i64
      %3633 = func.call @cc_values_pack(%3632) : (i64) -> i64
      %3634 = func.call @cc_nil_value() : () -> i64
      %3635 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3636 = arith.constant 4 : i64
      %3637 = func.call @cc_make_string(%3635, %3636) : (!llvm.ptr, i64) -> i64
      %3638 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3639 = arith.constant 7 : i64
      %3640 = func.call @cc_make_string(%3638, %3639) : (!llvm.ptr, i64) -> i64
      %3641 = func.call @cc_intern(%3637, %3640) : (i64, i64) -> i64
      %3642 = func.call @cc_nil_value() : () -> i64
      %3643 = func.call @cc_cons(%3641, %3642) : (i64, i64) -> i64
      %3644 = func.call @cc_values_pack(%3643) : (i64) -> i64
      %3645 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3646 = arith.constant 6 : i64
      %3647 = func.call @cc_make_string(%3645, %3646) : (!llvm.ptr, i64) -> i64
      %3648 = func.call @cc_nil_value() : () -> i64
      %3649 = func.call @cc_intern(%3647, %3648) : (i64, i64) -> i64
      %3650 = func.call @cc_nil_value() : () -> i64
      %3651 = func.call @cc_cons(%3649, %3650) : (i64, i64) -> i64
      %3652 = func.call @cc_values_pack(%3651) : (i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3653 = arith.addi %3649, %__rlasp_stack_elide_zero_186 : i64
      %3654 = func.call @cc_nil_value() : () -> i64
      %3655 = func.call @cc_errorp(%2541) : (i64) -> i64
      %3656 = arith.cmpi ne, %3655, %3654 : i64
      %3657 = arith.cmpi eq, %3654, %3654 : i64
      %3658 = arith.andi %3656, %3657 : i1
      %3659 = scf.if %3658 -> (i64) {
        scf.yield %2541 : i64
      } else {
        scf.yield %3654 : i64
      }
      %3660 = func.call @cc_errorp(%3237) : (i64) -> i64
      %3661 = arith.cmpi ne, %3660, %3654 : i64
      %3662 = arith.cmpi eq, %3659, %3654 : i64
      %3663 = arith.andi %3661, %3662 : i1
      %3664 = scf.if %3663 -> (i64) {
        scf.yield %3237 : i64
      } else {
        scf.yield %3659 : i64
      }
      %3665 = func.call @cc_errorp(%3619) : (i64) -> i64
      %3666 = arith.cmpi ne, %3665, %3654 : i64
      %3667 = arith.cmpi eq, %3664, %3654 : i64
      %3668 = arith.andi %3666, %3667 : i1
      %3669 = scf.if %3668 -> (i64) {
        scf.yield %3619 : i64
      } else {
        scf.yield %3664 : i64
      }
      %3670 = func.call @cc_errorp(%3623) : (i64) -> i64
      %3671 = arith.cmpi ne, %3670, %3654 : i64
      %3672 = arith.cmpi eq, %3669, %3654 : i64
      %3673 = arith.andi %3671, %3672 : i1
      %3674 = scf.if %3673 -> (i64) {
        scf.yield %3623 : i64
      } else {
        scf.yield %3669 : i64
      }
      %3675 = func.call @cc_errorp(%3630) : (i64) -> i64
      %3676 = arith.cmpi ne, %3675, %3654 : i64
      %3677 = arith.cmpi eq, %3674, %3654 : i64
      %3678 = arith.andi %3676, %3677 : i1
      %3679 = scf.if %3678 -> (i64) {
        scf.yield %3630 : i64
      } else {
        scf.yield %3674 : i64
      }
      %3680 = func.call @cc_errorp(%3634) : (i64) -> i64
      %3681 = arith.cmpi ne, %3680, %3654 : i64
      %3682 = arith.cmpi eq, %3679, %3654 : i64
      %3683 = arith.andi %3681, %3682 : i1
      %3684 = scf.if %3683 -> (i64) {
        scf.yield %3634 : i64
      } else {
        scf.yield %3679 : i64
      }
      %3685 = func.call @cc_errorp(%3641) : (i64) -> i64
      %3686 = arith.cmpi ne, %3685, %3654 : i64
      %3687 = arith.cmpi eq, %3684, %3654 : i64
      %3688 = arith.andi %3686, %3687 : i1
      %3689 = scf.if %3688 -> (i64) {
        scf.yield %3641 : i64
      } else {
        scf.yield %3684 : i64
      }
      %3690 = func.call @cc_errorp(%3653) : (i64) -> i64
      %3691 = arith.cmpi ne, %3690, %3654 : i64
      %3692 = arith.cmpi eq, %3689, %3654 : i64
      %3693 = arith.andi %3691, %3692 : i1
      %3694 = scf.if %3693 -> (i64) {
        scf.yield %3653 : i64
      } else {
        scf.yield %3689 : i64
      }
      %3695 = arith.cmpi ne, %3694, %3654 : i64
      scf.if %3695 {
        func.call @stack_push_pointer(%3694) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2541) : (i64) -> ()
        func.call @stack_push_pointer(%3237) : (i64) -> ()
        func.call @stack_push_pointer(%3619) : (i64) -> ()
        func.call @stack_push_pointer(%3623) : (i64) -> ()
        func.call @stack_push_pointer(%3630) : (i64) -> ()
        func.call @stack_push_pointer(%3634) : (i64) -> ()
        func.call @stack_push_pointer(%3641) : (i64) -> ()
        func.call @stack_push_pointer(%3653) : (i64) -> ()
        %3696 = llvm.mlir.addressof @str262 : !llvm.ptr
        %3697 = func.call @cc_make_function_ref_const(%3696) : (!llvm.ptr) -> i64
        %3698 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3697, %3698) : (i64, i64) -> ()
      }
      %3699 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3699 : i64
    }
    %3700 = func.call @cc_nil_value() : () -> i64
    %3701 = func.call @cc_errorp(%2532) : (i64) -> i64
    %3702 = arith.cmpi ne, %3701, %3700 : i64
    %3703 = scf.if %3702 -> (i64) {
      scf.yield %2532 : i64
    } else {
      %3704 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3705 = arith.constant 27 : i64
      %3706 = func.call @cc_make_string(%3704, %3705) : (!llvm.ptr, i64) -> i64
      %3707 = func.call @cc_nil_value() : () -> i64
      %3708 = func.call @cc_intern(%3706, %3707) : (i64, i64) -> i64
      %3709 = func.call @cc_nil_value() : () -> i64
      %3710 = func.call @cc_cons(%3708, %3709) : (i64, i64) -> i64
      %3711 = func.call @cc_values_pack(%3710) : (i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3712 = arith.addi %3708, %__rlasp_stack_elide_zero_187 : i64
      %3713 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3714 = arith.constant 13 : i64
      %3715 = func.call @cc_make_string(%3713, %3714) : (!llvm.ptr, i64) -> i64
      %3716 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3717 = arith.constant 11 : i64
      %3718 = func.call @cc_make_string(%3716, %3717) : (!llvm.ptr, i64) -> i64
      %3719 = func.call @cc_intern(%3715, %3718) : (i64, i64) -> i64
      %3720 = func.call @cc_nil_value() : () -> i64
      %3721 = func.call @cc_cons(%3719, %3720) : (i64, i64) -> i64
      %3722 = func.call @cc_values_pack(%3721) : (i64) -> i64
      func.call @stack_push_pointer(%3719) : (i64) -> ()
      %3723 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3724 = arith.constant 6 : i64
      %3725 = func.call @cc_make_string(%3723, %3724) : (!llvm.ptr, i64) -> i64
      %3726 = func.call @cc_nil_value() : () -> i64
      %3727 = func.call @cc_intern(%3725, %3726) : (i64, i64) -> i64
      %3728 = func.call @cc_nil_value() : () -> i64
      %3729 = func.call @cc_cons(%3727, %3728) : (i64, i64) -> i64
      %3730 = func.call @cc_values_pack(%3729) : (i64) -> i64
      func.call @stack_push_pointer(%3727) : (i64) -> ()
      %3731 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3732 = arith.constant 19 : i64
      %3733 = func.call @cc_make_string(%3731, %3732) : (!llvm.ptr, i64) -> i64
      %3734 = func.call @cc_nil_value() : () -> i64
      %3735 = func.call @cc_intern(%3733, %3734) : (i64, i64) -> i64
      %3736 = func.call @cc_nil_value() : () -> i64
      %3737 = func.call @cc_cons(%3735, %3736) : (i64, i64) -> i64
      %3738 = func.call @cc_values_pack(%3737) : (i64) -> i64
      func.call @stack_push_pointer(%3735) : (i64) -> ()
      %3739 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3740 = arith.constant 20 : i64
      %3741 = func.call @cc_make_string(%3739, %3740) : (!llvm.ptr, i64) -> i64
      %3742 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3743 = arith.constant 3 : i64
      %3744 = func.call @cc_make_string(%3742, %3743) : (!llvm.ptr, i64) -> i64
      %3745 = func.call @cc_intern(%3741, %3744) : (i64, i64) -> i64
      %3746 = func.call @cc_nil_value() : () -> i64
      %3747 = func.call @cc_cons(%3745, %3746) : (i64, i64) -> i64
      %3748 = func.call @cc_values_pack(%3747) : (i64) -> i64
      func.call @stack_push_pointer(%3745) : (i64) -> ()
      %3749 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3749) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3750 = func.call @stack_pop_pointer() : () -> i64
      %3751 = func.call @stack_pop_pointer() : () -> i64
      %3752 = func.call @cc_cons(%3751, %3750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3753 = arith.addi %3752, %__rlasp_stack_elide_zero_188 : i64
      %3754 = func.call @stack_pop_pointer() : () -> i64
      %3755 = func.call @cc_cons(%3754, %3753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3755) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3756 = func.call @stack_pop_pointer() : () -> i64
      %3757 = func.call @stack_pop_pointer() : () -> i64
      %3758 = func.call @cc_cons(%3757, %3756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3759 = arith.addi %3758, %__rlasp_stack_elide_zero_189 : i64
      %3760 = func.call @stack_pop_pointer() : () -> i64
      %3761 = func.call @cc_cons(%3760, %3759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3761) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = func.call @stack_pop_pointer() : () -> i64
      %3764 = func.call @cc_cons(%3763, %3762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3765 = arith.addi %3764, %__rlasp_stack_elide_zero_190 : i64
      %3766 = func.call @stack_pop_pointer() : () -> i64
      %3767 = func.call @cc_cons(%3766, %3765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3768 = arith.addi %3767, %__rlasp_stack_elide_zero_191 : i64
      %3769 = func.call @stack_pop_pointer() : () -> i64
      %3770 = func.call @cc_cons(%3769, %3768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3771 = func.call @stack_pop_pointer() : () -> i64
      %3772 = func.call @stack_pop_pointer() : () -> i64
      %3773 = func.call @cc_cons(%3772, %3771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3774 = arith.addi %3773, %__rlasp_stack_elide_zero_192 : i64
      %3775 = func.call @stack_pop_pointer() : () -> i64
      %3776 = func.call @cc_cons(%3775, %3774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3777 = arith.addi %3776, %__rlasp_stack_elide_zero_193 : i64
      %3833 = arith.constant 162741310455818 : i64
      %3834 = arith.constant 0 : i64
      %3835 = func.call @cc_make_closure(%3833, %3834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3836 = arith.addi %3835, %__rlasp_stack_elide_zero_194 : i64
      %3837 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3838 = arith.constant 4 : i64
      %3839 = func.call @cc_make_string(%3837, %3838) : (!llvm.ptr, i64) -> i64
      %3840 = func.call @cc_nil_value() : () -> i64
      %3841 = func.call @cc_intern(%3839, %3840) : (i64, i64) -> i64
      %3842 = func.call @cc_nil_value() : () -> i64
      %3843 = func.call @cc_cons(%3841, %3842) : (i64, i64) -> i64
      %3844 = func.call @cc_values_pack(%3843) : (i64) -> i64
      func.call @stack_push_pointer(%3841) : (i64) -> ()
      %3845 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3846 = arith.constant 5 : i64
      %3847 = func.call @cc_make_string(%3845, %3846) : (!llvm.ptr, i64) -> i64
      %3848 = func.call @cc_nil_value() : () -> i64
      %3849 = func.call @cc_intern(%3847, %3848) : (i64, i64) -> i64
      %3850 = func.call @cc_nil_value() : () -> i64
      %3851 = func.call @cc_cons(%3849, %3850) : (i64, i64) -> i64
      %3852 = func.call @cc_values_pack(%3851) : (i64) -> i64
      func.call @stack_push_pointer(%3849) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3853 = func.call @stack_pop_pointer() : () -> i64
      %3854 = func.call @stack_pop_pointer() : () -> i64
      %3855 = func.call @cc_cons(%3854, %3853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %3856 = arith.addi %3855, %__rlasp_stack_elide_zero_195 : i64
      %3857 = func.call @stack_pop_pointer() : () -> i64
      %3858 = func.call @cc_cons(%3857, %3856) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %3859 = arith.addi %3858, %__rlasp_stack_elide_zero_196 : i64
      %3860 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3861 = arith.constant 11 : i64
      %3862 = func.call @cc_make_string(%3860, %3861) : (!llvm.ptr, i64) -> i64
      %3863 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3864 = arith.constant 7 : i64
      %3865 = func.call @cc_make_string(%3863, %3864) : (!llvm.ptr, i64) -> i64
      %3866 = func.call @cc_intern(%3862, %3865) : (i64, i64) -> i64
      %3867 = func.call @cc_nil_value() : () -> i64
      %3868 = func.call @cc_cons(%3866, %3867) : (i64, i64) -> i64
      %3869 = func.call @cc_values_pack(%3868) : (i64) -> i64
      %3870 = func.call @cc_nil_value() : () -> i64
      %3871 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3872 = arith.constant 4 : i64
      %3873 = func.call @cc_make_string(%3871, %3872) : (!llvm.ptr, i64) -> i64
      %3874 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3875 = arith.constant 7 : i64
      %3876 = func.call @cc_make_string(%3874, %3875) : (!llvm.ptr, i64) -> i64
      %3877 = func.call @cc_intern(%3873, %3876) : (i64, i64) -> i64
      %3878 = func.call @cc_nil_value() : () -> i64
      %3879 = func.call @cc_cons(%3877, %3878) : (i64, i64) -> i64
      %3880 = func.call @cc_values_pack(%3879) : (i64) -> i64
      %3881 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3882 = arith.constant 5 : i64
      %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
      %3884 = func.call @cc_nil_value() : () -> i64
      %3885 = func.call @cc_intern(%3883, %3884) : (i64, i64) -> i64
      %3886 = func.call @cc_nil_value() : () -> i64
      %3887 = func.call @cc_cons(%3885, %3886) : (i64, i64) -> i64
      %3888 = func.call @cc_values_pack(%3887) : (i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %3889 = arith.addi %3885, %__rlasp_stack_elide_zero_197 : i64
      %3890 = func.call @cc_nil_value() : () -> i64
      %3891 = func.call @cc_errorp(%3712) : (i64) -> i64
      %3892 = arith.cmpi ne, %3891, %3890 : i64
      %3893 = arith.cmpi eq, %3890, %3890 : i64
      %3894 = arith.andi %3892, %3893 : i1
      %3895 = scf.if %3894 -> (i64) {
        scf.yield %3712 : i64
      } else {
        scf.yield %3890 : i64
      }
      %3896 = func.call @cc_errorp(%3777) : (i64) -> i64
      %3897 = arith.cmpi ne, %3896, %3890 : i64
      %3898 = arith.cmpi eq, %3895, %3890 : i64
      %3899 = arith.andi %3897, %3898 : i1
      %3900 = scf.if %3899 -> (i64) {
        scf.yield %3777 : i64
      } else {
        scf.yield %3895 : i64
      }
      %3901 = func.call @cc_errorp(%3836) : (i64) -> i64
      %3902 = arith.cmpi ne, %3901, %3890 : i64
      %3903 = arith.cmpi eq, %3900, %3890 : i64
      %3904 = arith.andi %3902, %3903 : i1
      %3905 = scf.if %3904 -> (i64) {
        scf.yield %3836 : i64
      } else {
        scf.yield %3900 : i64
      }
      %3906 = func.call @cc_errorp(%3859) : (i64) -> i64
      %3907 = arith.cmpi ne, %3906, %3890 : i64
      %3908 = arith.cmpi eq, %3905, %3890 : i64
      %3909 = arith.andi %3907, %3908 : i1
      %3910 = scf.if %3909 -> (i64) {
        scf.yield %3859 : i64
      } else {
        scf.yield %3905 : i64
      }
      %3911 = func.call @cc_errorp(%3866) : (i64) -> i64
      %3912 = arith.cmpi ne, %3911, %3890 : i64
      %3913 = arith.cmpi eq, %3910, %3890 : i64
      %3914 = arith.andi %3912, %3913 : i1
      %3915 = scf.if %3914 -> (i64) {
        scf.yield %3866 : i64
      } else {
        scf.yield %3910 : i64
      }
      %3916 = func.call @cc_errorp(%3870) : (i64) -> i64
      %3917 = arith.cmpi ne, %3916, %3890 : i64
      %3918 = arith.cmpi eq, %3915, %3890 : i64
      %3919 = arith.andi %3917, %3918 : i1
      %3920 = scf.if %3919 -> (i64) {
        scf.yield %3870 : i64
      } else {
        scf.yield %3915 : i64
      }
      %3921 = func.call @cc_errorp(%3877) : (i64) -> i64
      %3922 = arith.cmpi ne, %3921, %3890 : i64
      %3923 = arith.cmpi eq, %3920, %3890 : i64
      %3924 = arith.andi %3922, %3923 : i1
      %3925 = scf.if %3924 -> (i64) {
        scf.yield %3877 : i64
      } else {
        scf.yield %3920 : i64
      }
      %3926 = func.call @cc_errorp(%3889) : (i64) -> i64
      %3927 = arith.cmpi ne, %3926, %3890 : i64
      %3928 = arith.cmpi eq, %3925, %3890 : i64
      %3929 = arith.andi %3927, %3928 : i1
      %3930 = scf.if %3929 -> (i64) {
        scf.yield %3889 : i64
      } else {
        scf.yield %3925 : i64
      }
      %3931 = arith.cmpi ne, %3930, %3890 : i64
      scf.if %3931 {
        func.call @stack_push_pointer(%3930) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3712) : (i64) -> ()
        func.call @stack_push_pointer(%3777) : (i64) -> ()
        func.call @stack_push_pointer(%3836) : (i64) -> ()
        func.call @stack_push_pointer(%3859) : (i64) -> ()
        func.call @stack_push_pointer(%3866) : (i64) -> ()
        func.call @stack_push_pointer(%3870) : (i64) -> ()
        func.call @stack_push_pointer(%3877) : (i64) -> ()
        func.call @stack_push_pointer(%3889) : (i64) -> ()
        %3932 = llvm.mlir.addressof @str278 : !llvm.ptr
        %3933 = func.call @cc_make_function_ref_const(%3932) : (!llvm.ptr) -> i64
        %3934 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3933, %3934) : (i64, i64) -> ()
      }
      %3935 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3935 : i64
    }
    %3936 = func.call @cc_nil_value() : () -> i64
    %3937 = func.call @cc_errorp(%3703) : (i64) -> i64
    %3938 = arith.cmpi ne, %3937, %3936 : i64
    %3939 = scf.if %3938 -> (i64) {
      scf.yield %3703 : i64
    } else {
      %3940 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3941 = arith.constant 27 : i64
      %3942 = func.call @cc_make_string(%3940, %3941) : (!llvm.ptr, i64) -> i64
      %3943 = func.call @cc_nil_value() : () -> i64
      %3944 = func.call @cc_intern(%3942, %3943) : (i64, i64) -> i64
      %3945 = func.call @cc_nil_value() : () -> i64
      %3946 = func.call @cc_cons(%3944, %3945) : (i64, i64) -> i64
      %3947 = func.call @cc_values_pack(%3946) : (i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %3948 = arith.addi %3944, %__rlasp_stack_elide_zero_198 : i64
      %3949 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3950 = arith.constant 13 : i64
      %3951 = func.call @cc_make_string(%3949, %3950) : (!llvm.ptr, i64) -> i64
      %3952 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3953 = arith.constant 11 : i64
      %3954 = func.call @cc_make_string(%3952, %3953) : (!llvm.ptr, i64) -> i64
      %3955 = func.call @cc_intern(%3951, %3954) : (i64, i64) -> i64
      %3956 = func.call @cc_nil_value() : () -> i64
      %3957 = func.call @cc_cons(%3955, %3956) : (i64, i64) -> i64
      %3958 = func.call @cc_values_pack(%3957) : (i64) -> i64
      func.call @stack_push_pointer(%3955) : (i64) -> ()
      %3959 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3960 = arith.constant 6 : i64
      %3961 = func.call @cc_make_string(%3959, %3960) : (!llvm.ptr, i64) -> i64
      %3962 = func.call @cc_nil_value() : () -> i64
      %3963 = func.call @cc_intern(%3961, %3962) : (i64, i64) -> i64
      %3964 = func.call @cc_nil_value() : () -> i64
      %3965 = func.call @cc_cons(%3963, %3964) : (i64, i64) -> i64
      %3966 = func.call @cc_values_pack(%3965) : (i64) -> i64
      func.call @stack_push_pointer(%3963) : (i64) -> ()
      %3967 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3968 = arith.constant 19 : i64
      %3969 = func.call @cc_make_string(%3967, %3968) : (!llvm.ptr, i64) -> i64
      %3970 = func.call @cc_nil_value() : () -> i64
      %3971 = func.call @cc_intern(%3969, %3970) : (i64, i64) -> i64
      %3972 = func.call @cc_nil_value() : () -> i64
      %3973 = func.call @cc_cons(%3971, %3972) : (i64, i64) -> i64
      %3974 = func.call @cc_values_pack(%3973) : (i64) -> i64
      func.call @stack_push_pointer(%3971) : (i64) -> ()
      %3975 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3976 = arith.constant 20 : i64
      %3977 = func.call @cc_make_string(%3975, %3976) : (!llvm.ptr, i64) -> i64
      %3978 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3979 = arith.constant 3 : i64
      %3980 = func.call @cc_make_string(%3978, %3979) : (!llvm.ptr, i64) -> i64
      %3981 = func.call @cc_intern(%3977, %3980) : (i64, i64) -> i64
      %3982 = func.call @cc_nil_value() : () -> i64
      %3983 = func.call @cc_cons(%3981, %3982) : (i64, i64) -> i64
      %3984 = func.call @cc_values_pack(%3983) : (i64) -> i64
      func.call @stack_push_pointer(%3981) : (i64) -> ()
      %3985 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%3985) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3986 = func.call @stack_pop_pointer() : () -> i64
      %3987 = func.call @stack_pop_pointer() : () -> i64
      %3988 = func.call @cc_cons(%3987, %3986) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %3989 = arith.addi %3988, %__rlasp_stack_elide_zero_199 : i64
      %3990 = func.call @stack_pop_pointer() : () -> i64
      %3991 = func.call @cc_cons(%3990, %3989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3992 = func.call @stack_pop_pointer() : () -> i64
      %3993 = func.call @stack_pop_pointer() : () -> i64
      %3994 = func.call @cc_cons(%3993, %3992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %3995 = arith.addi %3994, %__rlasp_stack_elide_zero_200 : i64
      %3996 = func.call @stack_pop_pointer() : () -> i64
      %3997 = func.call @cc_cons(%3996, %3995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3998 = func.call @stack_pop_pointer() : () -> i64
      %3999 = func.call @stack_pop_pointer() : () -> i64
      %4000 = func.call @cc_cons(%3999, %3998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4001 = arith.addi %4000, %__rlasp_stack_elide_zero_201 : i64
      %4002 = func.call @stack_pop_pointer() : () -> i64
      %4003 = func.call @cc_cons(%4002, %4001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4004 = arith.addi %4003, %__rlasp_stack_elide_zero_202 : i64
      %4005 = func.call @stack_pop_pointer() : () -> i64
      %4006 = func.call @cc_cons(%4005, %4004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4006) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4007 = func.call @stack_pop_pointer() : () -> i64
      %4008 = func.call @stack_pop_pointer() : () -> i64
      %4009 = func.call @cc_cons(%4008, %4007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4010 = arith.addi %4009, %__rlasp_stack_elide_zero_203 : i64
      %4011 = func.call @stack_pop_pointer() : () -> i64
      %4012 = func.call @cc_cons(%4011, %4010) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4013 = arith.addi %4012, %__rlasp_stack_elide_zero_204 : i64
      %4069 = arith.constant 162741310455819 : i64
      %4070 = arith.constant 0 : i64
      %4071 = func.call @cc_make_closure(%4069, %4070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4072 = arith.addi %4071, %__rlasp_stack_elide_zero_205 : i64
      %4073 = llvm.mlir.addressof @str287 : !llvm.ptr
      %4074 = arith.constant 4 : i64
      %4075 = func.call @cc_make_string(%4073, %4074) : (!llvm.ptr, i64) -> i64
      %4076 = func.call @cc_nil_value() : () -> i64
      %4077 = func.call @cc_intern(%4075, %4076) : (i64, i64) -> i64
      %4078 = func.call @cc_nil_value() : () -> i64
      %4079 = func.call @cc_cons(%4077, %4078) : (i64, i64) -> i64
      %4080 = func.call @cc_values_pack(%4079) : (i64) -> i64
      func.call @stack_push_pointer(%4077) : (i64) -> ()
      %4081 = llvm.mlir.addressof @str288 : !llvm.ptr
      %4082 = arith.constant 5 : i64
      %4083 = func.call @cc_make_string(%4081, %4082) : (!llvm.ptr, i64) -> i64
      %4084 = func.call @cc_nil_value() : () -> i64
      %4085 = func.call @cc_intern(%4083, %4084) : (i64, i64) -> i64
      %4086 = func.call @cc_nil_value() : () -> i64
      %4087 = func.call @cc_cons(%4085, %4086) : (i64, i64) -> i64
      %4088 = func.call @cc_values_pack(%4087) : (i64) -> i64
      func.call @stack_push_pointer(%4085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4089 = func.call @stack_pop_pointer() : () -> i64
      %4090 = func.call @stack_pop_pointer() : () -> i64
      %4091 = func.call @cc_cons(%4090, %4089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4092 = arith.addi %4091, %__rlasp_stack_elide_zero_206 : i64
      %4093 = func.call @stack_pop_pointer() : () -> i64
      %4094 = func.call @cc_cons(%4093, %4092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4095 = arith.addi %4094, %__rlasp_stack_elide_zero_207 : i64
      %4096 = llvm.mlir.addressof @str289 : !llvm.ptr
      %4097 = arith.constant 11 : i64
      %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
      %4099 = llvm.mlir.addressof @str290 : !llvm.ptr
      %4100 = arith.constant 7 : i64
      %4101 = func.call @cc_make_string(%4099, %4100) : (!llvm.ptr, i64) -> i64
      %4102 = func.call @cc_intern(%4098, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_nil_value() : () -> i64
      %4104 = func.call @cc_cons(%4102, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_values_pack(%4104) : (i64) -> i64
      %4106 = func.call @cc_nil_value() : () -> i64
      %4107 = llvm.mlir.addressof @str291 : !llvm.ptr
      %4108 = arith.constant 4 : i64
      %4109 = func.call @cc_make_string(%4107, %4108) : (!llvm.ptr, i64) -> i64
      %4110 = llvm.mlir.addressof @str292 : !llvm.ptr
      %4111 = arith.constant 7 : i64
      %4112 = func.call @cc_make_string(%4110, %4111) : (!llvm.ptr, i64) -> i64
      %4113 = func.call @cc_intern(%4109, %4112) : (i64, i64) -> i64
      %4114 = func.call @cc_nil_value() : () -> i64
      %4115 = func.call @cc_cons(%4113, %4114) : (i64, i64) -> i64
      %4116 = func.call @cc_values_pack(%4115) : (i64) -> i64
      %4117 = llvm.mlir.addressof @str293 : !llvm.ptr
      %4118 = arith.constant 5 : i64
      %4119 = func.call @cc_make_string(%4117, %4118) : (!llvm.ptr, i64) -> i64
      %4120 = func.call @cc_nil_value() : () -> i64
      %4121 = func.call @cc_intern(%4119, %4120) : (i64, i64) -> i64
      %4122 = func.call @cc_nil_value() : () -> i64
      %4123 = func.call @cc_cons(%4121, %4122) : (i64, i64) -> i64
      %4124 = func.call @cc_values_pack(%4123) : (i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4125 = arith.addi %4121, %__rlasp_stack_elide_zero_208 : i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_errorp(%3948) : (i64) -> i64
      %4128 = arith.cmpi ne, %4127, %4126 : i64
      %4129 = arith.cmpi eq, %4126, %4126 : i64
      %4130 = arith.andi %4128, %4129 : i1
      %4131 = scf.if %4130 -> (i64) {
        scf.yield %3948 : i64
      } else {
        scf.yield %4126 : i64
      }
      %4132 = func.call @cc_errorp(%4013) : (i64) -> i64
      %4133 = arith.cmpi ne, %4132, %4126 : i64
      %4134 = arith.cmpi eq, %4131, %4126 : i64
      %4135 = arith.andi %4133, %4134 : i1
      %4136 = scf.if %4135 -> (i64) {
        scf.yield %4013 : i64
      } else {
        scf.yield %4131 : i64
      }
      %4137 = func.call @cc_errorp(%4072) : (i64) -> i64
      %4138 = arith.cmpi ne, %4137, %4126 : i64
      %4139 = arith.cmpi eq, %4136, %4126 : i64
      %4140 = arith.andi %4138, %4139 : i1
      %4141 = scf.if %4140 -> (i64) {
        scf.yield %4072 : i64
      } else {
        scf.yield %4136 : i64
      }
      %4142 = func.call @cc_errorp(%4095) : (i64) -> i64
      %4143 = arith.cmpi ne, %4142, %4126 : i64
      %4144 = arith.cmpi eq, %4141, %4126 : i64
      %4145 = arith.andi %4143, %4144 : i1
      %4146 = scf.if %4145 -> (i64) {
        scf.yield %4095 : i64
      } else {
        scf.yield %4141 : i64
      }
      %4147 = func.call @cc_errorp(%4102) : (i64) -> i64
      %4148 = arith.cmpi ne, %4147, %4126 : i64
      %4149 = arith.cmpi eq, %4146, %4126 : i64
      %4150 = arith.andi %4148, %4149 : i1
      %4151 = scf.if %4150 -> (i64) {
        scf.yield %4102 : i64
      } else {
        scf.yield %4146 : i64
      }
      %4152 = func.call @cc_errorp(%4106) : (i64) -> i64
      %4153 = arith.cmpi ne, %4152, %4126 : i64
      %4154 = arith.cmpi eq, %4151, %4126 : i64
      %4155 = arith.andi %4153, %4154 : i1
      %4156 = scf.if %4155 -> (i64) {
        scf.yield %4106 : i64
      } else {
        scf.yield %4151 : i64
      }
      %4157 = func.call @cc_errorp(%4113) : (i64) -> i64
      %4158 = arith.cmpi ne, %4157, %4126 : i64
      %4159 = arith.cmpi eq, %4156, %4126 : i64
      %4160 = arith.andi %4158, %4159 : i1
      %4161 = scf.if %4160 -> (i64) {
        scf.yield %4113 : i64
      } else {
        scf.yield %4156 : i64
      }
      %4162 = func.call @cc_errorp(%4125) : (i64) -> i64
      %4163 = arith.cmpi ne, %4162, %4126 : i64
      %4164 = arith.cmpi eq, %4161, %4126 : i64
      %4165 = arith.andi %4163, %4164 : i1
      %4166 = scf.if %4165 -> (i64) {
        scf.yield %4125 : i64
      } else {
        scf.yield %4161 : i64
      }
      %4167 = arith.cmpi ne, %4166, %4126 : i64
      scf.if %4167 {
        func.call @stack_push_pointer(%4166) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3948) : (i64) -> ()
        func.call @stack_push_pointer(%4013) : (i64) -> ()
        func.call @stack_push_pointer(%4072) : (i64) -> ()
        func.call @stack_push_pointer(%4095) : (i64) -> ()
        func.call @stack_push_pointer(%4102) : (i64) -> ()
        func.call @stack_push_pointer(%4106) : (i64) -> ()
        func.call @stack_push_pointer(%4113) : (i64) -> ()
        func.call @stack_push_pointer(%4125) : (i64) -> ()
        %4168 = llvm.mlir.addressof @str294 : !llvm.ptr
        %4169 = func.call @cc_make_function_ref_const(%4168) : (!llvm.ptr) -> i64
        %4170 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4169, %4170) : (i64, i64) -> ()
      }
      %4171 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4171 : i64
    }
    %4172 = func.call @cc_nil_value() : () -> i64
    %4173 = func.call @cc_errorp(%3939) : (i64) -> i64
    %4174 = arith.cmpi ne, %4173, %4172 : i64
    %4175 = scf.if %4174 -> (i64) {
      scf.yield %3939 : i64
    } else {
      %4176 = llvm.mlir.addressof @str295 : !llvm.ptr
      %4177 = arith.constant 27 : i64
      %4178 = func.call @cc_make_string(%4176, %4177) : (!llvm.ptr, i64) -> i64
      %4179 = func.call @cc_nil_value() : () -> i64
      %4180 = func.call @cc_intern(%4178, %4179) : (i64, i64) -> i64
      %4181 = func.call @cc_nil_value() : () -> i64
      %4182 = func.call @cc_cons(%4180, %4181) : (i64, i64) -> i64
      %4183 = func.call @cc_values_pack(%4182) : (i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4184 = arith.addi %4180, %__rlasp_stack_elide_zero_209 : i64
      %4185 = llvm.mlir.addressof @str296 : !llvm.ptr
      %4186 = arith.constant 13 : i64
      %4187 = func.call @cc_make_string(%4185, %4186) : (!llvm.ptr, i64) -> i64
      %4188 = llvm.mlir.addressof @str297 : !llvm.ptr
      %4189 = arith.constant 11 : i64
      %4190 = func.call @cc_make_string(%4188, %4189) : (!llvm.ptr, i64) -> i64
      %4191 = func.call @cc_intern(%4187, %4190) : (i64, i64) -> i64
      %4192 = func.call @cc_nil_value() : () -> i64
      %4193 = func.call @cc_cons(%4191, %4192) : (i64, i64) -> i64
      %4194 = func.call @cc_values_pack(%4193) : (i64) -> i64
      func.call @stack_push_pointer(%4191) : (i64) -> ()
      %4195 = llvm.mlir.addressof @str298 : !llvm.ptr
      %4196 = arith.constant 6 : i64
      %4197 = func.call @cc_make_string(%4195, %4196) : (!llvm.ptr, i64) -> i64
      %4198 = func.call @cc_nil_value() : () -> i64
      %4199 = func.call @cc_intern(%4197, %4198) : (i64, i64) -> i64
      %4200 = func.call @cc_nil_value() : () -> i64
      %4201 = func.call @cc_cons(%4199, %4200) : (i64, i64) -> i64
      %4202 = func.call @cc_values_pack(%4201) : (i64) -> i64
      func.call @stack_push_pointer(%4199) : (i64) -> ()
      %4203 = llvm.mlir.addressof @str299 : !llvm.ptr
      %4204 = arith.constant 19 : i64
      %4205 = func.call @cc_make_string(%4203, %4204) : (!llvm.ptr, i64) -> i64
      %4206 = func.call @cc_nil_value() : () -> i64
      %4207 = func.call @cc_intern(%4205, %4206) : (i64, i64) -> i64
      %4208 = func.call @cc_nil_value() : () -> i64
      %4209 = func.call @cc_cons(%4207, %4208) : (i64, i64) -> i64
      %4210 = func.call @cc_values_pack(%4209) : (i64) -> i64
      func.call @stack_push_pointer(%4207) : (i64) -> ()
      %4211 = llvm.mlir.addressof @str300 : !llvm.ptr
      %4212 = arith.constant 20 : i64
      %4213 = func.call @cc_make_string(%4211, %4212) : (!llvm.ptr, i64) -> i64
      %4214 = llvm.mlir.addressof @str301 : !llvm.ptr
      %4215 = arith.constant 3 : i64
      %4216 = func.call @cc_make_string(%4214, %4215) : (!llvm.ptr, i64) -> i64
      %4217 = func.call @cc_intern(%4213, %4216) : (i64, i64) -> i64
      %4218 = func.call @cc_nil_value() : () -> i64
      %4219 = func.call @cc_cons(%4217, %4218) : (i64, i64) -> i64
      %4220 = func.call @cc_values_pack(%4219) : (i64) -> i64
      func.call @stack_push_pointer(%4217) : (i64) -> ()
      %4221 = arith.constant 3.0 : f64
      %4222 = func.call @cc_box_single_float(%4221) : (f64) -> i64
      func.call @stack_push_pointer(%4222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4223 = func.call @stack_pop_pointer() : () -> i64
      %4224 = func.call @stack_pop_pointer() : () -> i64
      %4225 = func.call @cc_cons(%4224, %4223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4226 = arith.addi %4225, %__rlasp_stack_elide_zero_210 : i64
      %4227 = func.call @stack_pop_pointer() : () -> i64
      %4228 = func.call @cc_cons(%4227, %4226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4228) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4229 = func.call @stack_pop_pointer() : () -> i64
      %4230 = func.call @stack_pop_pointer() : () -> i64
      %4231 = func.call @cc_cons(%4230, %4229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4232 = arith.addi %4231, %__rlasp_stack_elide_zero_211 : i64
      %4233 = func.call @stack_pop_pointer() : () -> i64
      %4234 = func.call @cc_cons(%4233, %4232) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4234) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4235 = func.call @stack_pop_pointer() : () -> i64
      %4236 = func.call @stack_pop_pointer() : () -> i64
      %4237 = func.call @cc_cons(%4236, %4235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4238 = arith.addi %4237, %__rlasp_stack_elide_zero_212 : i64
      %4239 = func.call @stack_pop_pointer() : () -> i64
      %4240 = func.call @cc_cons(%4239, %4238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4241 = arith.addi %4240, %__rlasp_stack_elide_zero_213 : i64
      %4242 = func.call @stack_pop_pointer() : () -> i64
      %4243 = func.call @cc_cons(%4242, %4241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4244 = func.call @stack_pop_pointer() : () -> i64
      %4245 = func.call @stack_pop_pointer() : () -> i64
      %4246 = func.call @cc_cons(%4245, %4244) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4247 = arith.addi %4246, %__rlasp_stack_elide_zero_214 : i64
      %4248 = func.call @stack_pop_pointer() : () -> i64
      %4249 = func.call @cc_cons(%4248, %4247) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4250 = arith.addi %4249, %__rlasp_stack_elide_zero_215 : i64
      %4307 = arith.constant 162741310455820 : i64
      %4308 = arith.constant 0 : i64
      %4309 = func.call @cc_make_closure(%4307, %4308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4310 = arith.addi %4309, %__rlasp_stack_elide_zero_216 : i64
      %4311 = llvm.mlir.addressof @str303 : !llvm.ptr
      %4312 = arith.constant 4 : i64
      %4313 = func.call @cc_make_string(%4311, %4312) : (!llvm.ptr, i64) -> i64
      %4314 = func.call @cc_nil_value() : () -> i64
      %4315 = func.call @cc_intern(%4313, %4314) : (i64, i64) -> i64
      %4316 = func.call @cc_nil_value() : () -> i64
      %4317 = func.call @cc_cons(%4315, %4316) : (i64, i64) -> i64
      %4318 = func.call @cc_values_pack(%4317) : (i64) -> i64
      func.call @stack_push_pointer(%4315) : (i64) -> ()
      %4319 = llvm.mlir.addressof @str304 : !llvm.ptr
      %4320 = arith.constant 5 : i64
      %4321 = func.call @cc_make_string(%4319, %4320) : (!llvm.ptr, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_intern(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_nil_value() : () -> i64
      %4325 = func.call @cc_cons(%4323, %4324) : (i64, i64) -> i64
      %4326 = func.call @cc_values_pack(%4325) : (i64) -> i64
      func.call @stack_push_pointer(%4323) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4327 = func.call @stack_pop_pointer() : () -> i64
      %4328 = func.call @stack_pop_pointer() : () -> i64
      %4329 = func.call @cc_cons(%4328, %4327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4330 = arith.addi %4329, %__rlasp_stack_elide_zero_217 : i64
      %4331 = func.call @stack_pop_pointer() : () -> i64
      %4332 = func.call @cc_cons(%4331, %4330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4333 = arith.addi %4332, %__rlasp_stack_elide_zero_218 : i64
      %4334 = llvm.mlir.addressof @str305 : !llvm.ptr
      %4335 = arith.constant 11 : i64
      %4336 = func.call @cc_make_string(%4334, %4335) : (!llvm.ptr, i64) -> i64
      %4337 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4338 = arith.constant 7 : i64
      %4339 = func.call @cc_make_string(%4337, %4338) : (!llvm.ptr, i64) -> i64
      %4340 = func.call @cc_intern(%4336, %4339) : (i64, i64) -> i64
      %4341 = func.call @cc_nil_value() : () -> i64
      %4342 = func.call @cc_cons(%4340, %4341) : (i64, i64) -> i64
      %4343 = func.call @cc_values_pack(%4342) : (i64) -> i64
      %4344 = func.call @cc_nil_value() : () -> i64
      %4345 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4346 = arith.constant 4 : i64
      %4347 = func.call @cc_make_string(%4345, %4346) : (!llvm.ptr, i64) -> i64
      %4348 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4349 = arith.constant 7 : i64
      %4350 = func.call @cc_make_string(%4348, %4349) : (!llvm.ptr, i64) -> i64
      %4351 = func.call @cc_intern(%4347, %4350) : (i64, i64) -> i64
      %4352 = func.call @cc_nil_value() : () -> i64
      %4353 = func.call @cc_cons(%4351, %4352) : (i64, i64) -> i64
      %4354 = func.call @cc_values_pack(%4353) : (i64) -> i64
      %4355 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4356 = arith.constant 5 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = func.call @cc_nil_value() : () -> i64
      %4359 = func.call @cc_intern(%4357, %4358) : (i64, i64) -> i64
      %4360 = func.call @cc_nil_value() : () -> i64
      %4361 = func.call @cc_cons(%4359, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_values_pack(%4361) : (i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4363 = arith.addi %4359, %__rlasp_stack_elide_zero_219 : i64
      %4364 = func.call @cc_nil_value() : () -> i64
      %4365 = func.call @cc_errorp(%4184) : (i64) -> i64
      %4366 = arith.cmpi ne, %4365, %4364 : i64
      %4367 = arith.cmpi eq, %4364, %4364 : i64
      %4368 = arith.andi %4366, %4367 : i1
      %4369 = scf.if %4368 -> (i64) {
        scf.yield %4184 : i64
      } else {
        scf.yield %4364 : i64
      }
      %4370 = func.call @cc_errorp(%4250) : (i64) -> i64
      %4371 = arith.cmpi ne, %4370, %4364 : i64
      %4372 = arith.cmpi eq, %4369, %4364 : i64
      %4373 = arith.andi %4371, %4372 : i1
      %4374 = scf.if %4373 -> (i64) {
        scf.yield %4250 : i64
      } else {
        scf.yield %4369 : i64
      }
      %4375 = func.call @cc_errorp(%4310) : (i64) -> i64
      %4376 = arith.cmpi ne, %4375, %4364 : i64
      %4377 = arith.cmpi eq, %4374, %4364 : i64
      %4378 = arith.andi %4376, %4377 : i1
      %4379 = scf.if %4378 -> (i64) {
        scf.yield %4310 : i64
      } else {
        scf.yield %4374 : i64
      }
      %4380 = func.call @cc_errorp(%4333) : (i64) -> i64
      %4381 = arith.cmpi ne, %4380, %4364 : i64
      %4382 = arith.cmpi eq, %4379, %4364 : i64
      %4383 = arith.andi %4381, %4382 : i1
      %4384 = scf.if %4383 -> (i64) {
        scf.yield %4333 : i64
      } else {
        scf.yield %4379 : i64
      }
      %4385 = func.call @cc_errorp(%4340) : (i64) -> i64
      %4386 = arith.cmpi ne, %4385, %4364 : i64
      %4387 = arith.cmpi eq, %4384, %4364 : i64
      %4388 = arith.andi %4386, %4387 : i1
      %4389 = scf.if %4388 -> (i64) {
        scf.yield %4340 : i64
      } else {
        scf.yield %4384 : i64
      }
      %4390 = func.call @cc_errorp(%4344) : (i64) -> i64
      %4391 = arith.cmpi ne, %4390, %4364 : i64
      %4392 = arith.cmpi eq, %4389, %4364 : i64
      %4393 = arith.andi %4391, %4392 : i1
      %4394 = scf.if %4393 -> (i64) {
        scf.yield %4344 : i64
      } else {
        scf.yield %4389 : i64
      }
      %4395 = func.call @cc_errorp(%4351) : (i64) -> i64
      %4396 = arith.cmpi ne, %4395, %4364 : i64
      %4397 = arith.cmpi eq, %4394, %4364 : i64
      %4398 = arith.andi %4396, %4397 : i1
      %4399 = scf.if %4398 -> (i64) {
        scf.yield %4351 : i64
      } else {
        scf.yield %4394 : i64
      }
      %4400 = func.call @cc_errorp(%4363) : (i64) -> i64
      %4401 = arith.cmpi ne, %4400, %4364 : i64
      %4402 = arith.cmpi eq, %4399, %4364 : i64
      %4403 = arith.andi %4401, %4402 : i1
      %4404 = scf.if %4403 -> (i64) {
        scf.yield %4363 : i64
      } else {
        scf.yield %4399 : i64
      }
      %4405 = arith.cmpi ne, %4404, %4364 : i64
      scf.if %4405 {
        func.call @stack_push_pointer(%4404) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4184) : (i64) -> ()
        func.call @stack_push_pointer(%4250) : (i64) -> ()
        func.call @stack_push_pointer(%4310) : (i64) -> ()
        func.call @stack_push_pointer(%4333) : (i64) -> ()
        func.call @stack_push_pointer(%4340) : (i64) -> ()
        func.call @stack_push_pointer(%4344) : (i64) -> ()
        func.call @stack_push_pointer(%4351) : (i64) -> ()
        func.call @stack_push_pointer(%4363) : (i64) -> ()
        %4406 = llvm.mlir.addressof @str310 : !llvm.ptr
        %4407 = func.call @cc_make_function_ref_const(%4406) : (!llvm.ptr) -> i64
        %4408 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4407, %4408) : (i64, i64) -> ()
      }
      %4409 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4409 : i64
    }
    %4410 = func.call @cc_nil_value() : () -> i64
    %4411 = func.call @cc_errorp(%4175) : (i64) -> i64
    %4412 = arith.cmpi ne, %4411, %4410 : i64
    %4413 = scf.if %4412 -> (i64) {
      scf.yield %4175 : i64
    } else {
      %4414 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4415 = arith.constant 27 : i64
      %4416 = func.call @cc_make_string(%4414, %4415) : (!llvm.ptr, i64) -> i64
      %4417 = func.call @cc_nil_value() : () -> i64
      %4418 = func.call @cc_intern(%4416, %4417) : (i64, i64) -> i64
      %4419 = func.call @cc_nil_value() : () -> i64
      %4420 = func.call @cc_cons(%4418, %4419) : (i64, i64) -> i64
      %4421 = func.call @cc_values_pack(%4420) : (i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4422 = arith.addi %4418, %__rlasp_stack_elide_zero_220 : i64
      %4423 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4424 = arith.constant 13 : i64
      %4425 = func.call @cc_make_string(%4423, %4424) : (!llvm.ptr, i64) -> i64
      %4426 = llvm.mlir.addressof @str313 : !llvm.ptr
      %4427 = arith.constant 11 : i64
      %4428 = func.call @cc_make_string(%4426, %4427) : (!llvm.ptr, i64) -> i64
      %4429 = func.call @cc_intern(%4425, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_nil_value() : () -> i64
      %4431 = func.call @cc_cons(%4429, %4430) : (i64, i64) -> i64
      %4432 = func.call @cc_values_pack(%4431) : (i64) -> i64
      func.call @stack_push_pointer(%4429) : (i64) -> ()
      %4433 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4434 = arith.constant 6 : i64
      %4435 = func.call @cc_make_string(%4433, %4434) : (!llvm.ptr, i64) -> i64
      %4436 = func.call @cc_nil_value() : () -> i64
      %4437 = func.call @cc_intern(%4435, %4436) : (i64, i64) -> i64
      %4438 = func.call @cc_nil_value() : () -> i64
      %4439 = func.call @cc_cons(%4437, %4438) : (i64, i64) -> i64
      %4440 = func.call @cc_values_pack(%4439) : (i64) -> i64
      func.call @stack_push_pointer(%4437) : (i64) -> ()
      %4441 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4442 = arith.constant 19 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = func.call @cc_nil_value() : () -> i64
      %4445 = func.call @cc_intern(%4443, %4444) : (i64, i64) -> i64
      %4446 = func.call @cc_nil_value() : () -> i64
      %4447 = func.call @cc_cons(%4445, %4446) : (i64, i64) -> i64
      %4448 = func.call @cc_values_pack(%4447) : (i64) -> i64
      func.call @stack_push_pointer(%4445) : (i64) -> ()
      %4449 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4450 = arith.constant 20 : i64
      %4451 = func.call @cc_make_string(%4449, %4450) : (!llvm.ptr, i64) -> i64
      %4452 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4453 = arith.constant 3 : i64
      %4454 = func.call @cc_make_string(%4452, %4453) : (!llvm.ptr, i64) -> i64
      %4455 = func.call @cc_intern(%4451, %4454) : (i64, i64) -> i64
      %4456 = func.call @cc_nil_value() : () -> i64
      %4457 = func.call @cc_cons(%4455, %4456) : (i64, i64) -> i64
      %4458 = func.call @cc_values_pack(%4457) : (i64) -> i64
      func.call @stack_push_pointer(%4455) : (i64) -> ()
      %4459 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4460 = arith.constant 2 : i64
      %4461 = func.call @cc_make_string(%4459, %4460) : (!llvm.ptr, i64) -> i64
      %4462 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4463 = arith.constant 11 : i64
      %4464 = func.call @cc_make_string(%4462, %4463) : (!llvm.ptr, i64) -> i64
      %4465 = func.call @cc_intern(%4461, %4464) : (i64, i64) -> i64
      %4466 = func.call @cc_nil_value() : () -> i64
      %4467 = func.call @cc_cons(%4465, %4466) : (i64, i64) -> i64
      %4468 = func.call @cc_values_pack(%4467) : (i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      %4469 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4470 = arith.constant 20 : i64
      %4471 = func.call @cc_make_string(%4469, %4470) : (!llvm.ptr, i64) -> i64
      %4472 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4473 = arith.constant 11 : i64
      %4474 = func.call @cc_make_string(%4472, %4473) : (!llvm.ptr, i64) -> i64
      %4475 = func.call @cc_intern(%4471, %4474) : (i64, i64) -> i64
      %4476 = func.call @cc_nil_value() : () -> i64
      %4477 = func.call @cc_cons(%4475, %4476) : (i64, i64) -> i64
      %4478 = func.call @cc_values_pack(%4477) : (i64) -> i64
      func.call @stack_push_pointer(%4475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4479 = func.call @stack_pop_pointer() : () -> i64
      %4480 = func.call @stack_pop_pointer() : () -> i64
      %4481 = func.call @cc_cons(%4480, %4479) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4482 = arith.addi %4481, %__rlasp_stack_elide_zero_221 : i64
      %4483 = func.call @stack_pop_pointer() : () -> i64
      %4484 = func.call @cc_cons(%4483, %4482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4484) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @stack_pop_pointer() : () -> i64
      %4487 = func.call @cc_cons(%4486, %4485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4488 = arith.addi %4487, %__rlasp_stack_elide_zero_222 : i64
      %4489 = func.call @stack_pop_pointer() : () -> i64
      %4490 = func.call @cc_cons(%4489, %4488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4490) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @stack_pop_pointer() : () -> i64
      %4493 = func.call @cc_cons(%4492, %4491) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4494 = arith.addi %4493, %__rlasp_stack_elide_zero_223 : i64
      %4495 = func.call @stack_pop_pointer() : () -> i64
      %4496 = func.call @cc_cons(%4495, %4494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4496) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @stack_pop_pointer() : () -> i64
      %4499 = func.call @cc_cons(%4498, %4497) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4500 = arith.addi %4499, %__rlasp_stack_elide_zero_224 : i64
      %4501 = func.call @stack_pop_pointer() : () -> i64
      %4502 = func.call @cc_cons(%4501, %4500) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4503 = arith.addi %4502, %__rlasp_stack_elide_zero_225 : i64
      %4504 = func.call @stack_pop_pointer() : () -> i64
      %4505 = func.call @cc_cons(%4504, %4503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4505) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @stack_pop_pointer() : () -> i64
      %4508 = func.call @cc_cons(%4507, %4506) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4509 = arith.addi %4508, %__rlasp_stack_elide_zero_226 : i64
      %4510 = func.call @stack_pop_pointer() : () -> i64
      %4511 = func.call @cc_cons(%4510, %4509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4512 = arith.addi %4511, %__rlasp_stack_elide_zero_227 : i64
      %4605 = arith.constant 162741310455821 : i64
      %4606 = arith.constant 0 : i64
      %4607 = func.call @cc_make_closure(%4605, %4606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4608 = arith.addi %4607, %__rlasp_stack_elide_zero_228 : i64
      %4609 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4610 = arith.constant 4 : i64
      %4611 = func.call @cc_make_string(%4609, %4610) : (!llvm.ptr, i64) -> i64
      %4612 = func.call @cc_nil_value() : () -> i64
      %4613 = func.call @cc_intern(%4611, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_nil_value() : () -> i64
      %4615 = func.call @cc_cons(%4613, %4614) : (i64, i64) -> i64
      %4616 = func.call @cc_values_pack(%4615) : (i64) -> i64
      func.call @stack_push_pointer(%4613) : (i64) -> ()
      %4617 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4618 = arith.constant 5 : i64
      %4619 = func.call @cc_make_string(%4617, %4618) : (!llvm.ptr, i64) -> i64
      %4620 = func.call @cc_nil_value() : () -> i64
      %4621 = func.call @cc_intern(%4619, %4620) : (i64, i64) -> i64
      %4622 = func.call @cc_nil_value() : () -> i64
      %4623 = func.call @cc_cons(%4621, %4622) : (i64, i64) -> i64
      %4624 = func.call @cc_values_pack(%4623) : (i64) -> i64
      func.call @stack_push_pointer(%4621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4625 = func.call @stack_pop_pointer() : () -> i64
      %4626 = func.call @stack_pop_pointer() : () -> i64
      %4627 = func.call @cc_cons(%4626, %4625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %4628 = arith.addi %4627, %__rlasp_stack_elide_zero_229 : i64
      %4629 = func.call @stack_pop_pointer() : () -> i64
      %4630 = func.call @cc_cons(%4629, %4628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %4631 = arith.addi %4630, %__rlasp_stack_elide_zero_230 : i64
      %4632 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4633 = arith.constant 11 : i64
      %4634 = func.call @cc_make_string(%4632, %4633) : (!llvm.ptr, i64) -> i64
      %4635 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4636 = arith.constant 7 : i64
      %4637 = func.call @cc_make_string(%4635, %4636) : (!llvm.ptr, i64) -> i64
      %4638 = func.call @cc_intern(%4634, %4637) : (i64, i64) -> i64
      %4639 = func.call @cc_nil_value() : () -> i64
      %4640 = func.call @cc_cons(%4638, %4639) : (i64, i64) -> i64
      %4641 = func.call @cc_values_pack(%4640) : (i64) -> i64
      %4642 = func.call @cc_nil_value() : () -> i64
      %4643 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4644 = arith.constant 4 : i64
      %4645 = func.call @cc_make_string(%4643, %4644) : (!llvm.ptr, i64) -> i64
      %4646 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4647 = arith.constant 7 : i64
      %4648 = func.call @cc_make_string(%4646, %4647) : (!llvm.ptr, i64) -> i64
      %4649 = func.call @cc_intern(%4645, %4648) : (i64, i64) -> i64
      %4650 = func.call @cc_nil_value() : () -> i64
      %4651 = func.call @cc_cons(%4649, %4650) : (i64, i64) -> i64
      %4652 = func.call @cc_values_pack(%4651) : (i64) -> i64
      %4653 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4654 = arith.constant 5 : i64
      %4655 = func.call @cc_make_string(%4653, %4654) : (!llvm.ptr, i64) -> i64
      %4656 = func.call @cc_nil_value() : () -> i64
      %4657 = func.call @cc_intern(%4655, %4656) : (i64, i64) -> i64
      %4658 = func.call @cc_nil_value() : () -> i64
      %4659 = func.call @cc_cons(%4657, %4658) : (i64, i64) -> i64
      %4660 = func.call @cc_values_pack(%4659) : (i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %4661 = arith.addi %4657, %__rlasp_stack_elide_zero_231 : i64
      %4662 = func.call @cc_nil_value() : () -> i64
      %4663 = func.call @cc_errorp(%4422) : (i64) -> i64
      %4664 = arith.cmpi ne, %4663, %4662 : i64
      %4665 = arith.cmpi eq, %4662, %4662 : i64
      %4666 = arith.andi %4664, %4665 : i1
      %4667 = scf.if %4666 -> (i64) {
        scf.yield %4422 : i64
      } else {
        scf.yield %4662 : i64
      }
      %4668 = func.call @cc_errorp(%4512) : (i64) -> i64
      %4669 = arith.cmpi ne, %4668, %4662 : i64
      %4670 = arith.cmpi eq, %4667, %4662 : i64
      %4671 = arith.andi %4669, %4670 : i1
      %4672 = scf.if %4671 -> (i64) {
        scf.yield %4512 : i64
      } else {
        scf.yield %4667 : i64
      }
      %4673 = func.call @cc_errorp(%4608) : (i64) -> i64
      %4674 = arith.cmpi ne, %4673, %4662 : i64
      %4675 = arith.cmpi eq, %4672, %4662 : i64
      %4676 = arith.andi %4674, %4675 : i1
      %4677 = scf.if %4676 -> (i64) {
        scf.yield %4608 : i64
      } else {
        scf.yield %4672 : i64
      }
      %4678 = func.call @cc_errorp(%4631) : (i64) -> i64
      %4679 = arith.cmpi ne, %4678, %4662 : i64
      %4680 = arith.cmpi eq, %4677, %4662 : i64
      %4681 = arith.andi %4679, %4680 : i1
      %4682 = scf.if %4681 -> (i64) {
        scf.yield %4631 : i64
      } else {
        scf.yield %4677 : i64
      }
      %4683 = func.call @cc_errorp(%4638) : (i64) -> i64
      %4684 = arith.cmpi ne, %4683, %4662 : i64
      %4685 = arith.cmpi eq, %4682, %4662 : i64
      %4686 = arith.andi %4684, %4685 : i1
      %4687 = scf.if %4686 -> (i64) {
        scf.yield %4638 : i64
      } else {
        scf.yield %4682 : i64
      }
      %4688 = func.call @cc_errorp(%4642) : (i64) -> i64
      %4689 = arith.cmpi ne, %4688, %4662 : i64
      %4690 = arith.cmpi eq, %4687, %4662 : i64
      %4691 = arith.andi %4689, %4690 : i1
      %4692 = scf.if %4691 -> (i64) {
        scf.yield %4642 : i64
      } else {
        scf.yield %4687 : i64
      }
      %4693 = func.call @cc_errorp(%4649) : (i64) -> i64
      %4694 = arith.cmpi ne, %4693, %4662 : i64
      %4695 = arith.cmpi eq, %4692, %4662 : i64
      %4696 = arith.andi %4694, %4695 : i1
      %4697 = scf.if %4696 -> (i64) {
        scf.yield %4649 : i64
      } else {
        scf.yield %4692 : i64
      }
      %4698 = func.call @cc_errorp(%4661) : (i64) -> i64
      %4699 = arith.cmpi ne, %4698, %4662 : i64
      %4700 = arith.cmpi eq, %4697, %4662 : i64
      %4701 = arith.andi %4699, %4700 : i1
      %4702 = scf.if %4701 -> (i64) {
        scf.yield %4661 : i64
      } else {
        scf.yield %4697 : i64
      }
      %4703 = arith.cmpi ne, %4702, %4662 : i64
      scf.if %4703 {
        func.call @stack_push_pointer(%4702) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4422) : (i64) -> ()
        func.call @stack_push_pointer(%4512) : (i64) -> ()
        func.call @stack_push_pointer(%4608) : (i64) -> ()
        func.call @stack_push_pointer(%4631) : (i64) -> ()
        func.call @stack_push_pointer(%4638) : (i64) -> ()
        func.call @stack_push_pointer(%4642) : (i64) -> ()
        func.call @stack_push_pointer(%4649) : (i64) -> ()
        func.call @stack_push_pointer(%4661) : (i64) -> ()
        %4704 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4705 = func.call @cc_make_function_ref_const(%4704) : (!llvm.ptr) -> i64
        %4706 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4705, %4706) : (i64, i64) -> ()
      }
      %4707 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4707 : i64
    }
    %4708 = func.call @cc_nil_value() : () -> i64
    %4709 = func.call @cc_errorp(%4413) : (i64) -> i64
    %4710 = arith.cmpi ne, %4709, %4708 : i64
    %4711 = scf.if %4710 -> (i64) {
      scf.yield %4413 : i64
    } else {
      %4712 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4713 = arith.constant 27 : i64
      %4714 = func.call @cc_make_string(%4712, %4713) : (!llvm.ptr, i64) -> i64
      %4715 = func.call @cc_nil_value() : () -> i64
      %4716 = func.call @cc_intern(%4714, %4715) : (i64, i64) -> i64
      %4717 = func.call @cc_nil_value() : () -> i64
      %4718 = func.call @cc_cons(%4716, %4717) : (i64, i64) -> i64
      %4719 = func.call @cc_values_pack(%4718) : (i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %4720 = arith.addi %4716, %__rlasp_stack_elide_zero_232 : i64
      %4721 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4722 = arith.constant 13 : i64
      %4723 = func.call @cc_make_string(%4721, %4722) : (!llvm.ptr, i64) -> i64
      %4724 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4725 = arith.constant 11 : i64
      %4726 = func.call @cc_make_string(%4724, %4725) : (!llvm.ptr, i64) -> i64
      %4727 = func.call @cc_intern(%4723, %4726) : (i64, i64) -> i64
      %4728 = func.call @cc_nil_value() : () -> i64
      %4729 = func.call @cc_cons(%4727, %4728) : (i64, i64) -> i64
      %4730 = func.call @cc_values_pack(%4729) : (i64) -> i64
      func.call @stack_push_pointer(%4727) : (i64) -> ()
      %4731 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4732 = arith.constant 6 : i64
      %4733 = func.call @cc_make_string(%4731, %4732) : (!llvm.ptr, i64) -> i64
      %4734 = func.call @cc_nil_value() : () -> i64
      %4735 = func.call @cc_intern(%4733, %4734) : (i64, i64) -> i64
      %4736 = func.call @cc_nil_value() : () -> i64
      %4737 = func.call @cc_cons(%4735, %4736) : (i64, i64) -> i64
      %4738 = func.call @cc_values_pack(%4737) : (i64) -> i64
      func.call @stack_push_pointer(%4735) : (i64) -> ()
      %4739 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4740 = arith.constant 19 : i64
      %4741 = func.call @cc_make_string(%4739, %4740) : (!llvm.ptr, i64) -> i64
      %4742 = func.call @cc_nil_value() : () -> i64
      %4743 = func.call @cc_intern(%4741, %4742) : (i64, i64) -> i64
      %4744 = func.call @cc_nil_value() : () -> i64
      %4745 = func.call @cc_cons(%4743, %4744) : (i64, i64) -> i64
      %4746 = func.call @cc_values_pack(%4745) : (i64) -> i64
      func.call @stack_push_pointer(%4743) : (i64) -> ()
      %4747 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4748 = arith.constant 20 : i64
      %4749 = func.call @cc_make_string(%4747, %4748) : (!llvm.ptr, i64) -> i64
      %4750 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4751 = arith.constant 3 : i64
      %4752 = func.call @cc_make_string(%4750, %4751) : (!llvm.ptr, i64) -> i64
      %4753 = func.call @cc_intern(%4749, %4752) : (i64, i64) -> i64
      %4754 = func.call @cc_nil_value() : () -> i64
      %4755 = func.call @cc_cons(%4753, %4754) : (i64, i64) -> i64
      %4756 = func.call @cc_values_pack(%4755) : (i64) -> i64
      func.call @stack_push_pointer(%4753) : (i64) -> ()
      %4757 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4758 = arith.constant 2 : i64
      %4759 = func.call @cc_make_string(%4757, %4758) : (!llvm.ptr, i64) -> i64
      %4760 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4761 = arith.constant 11 : i64
      %4762 = func.call @cc_make_string(%4760, %4761) : (!llvm.ptr, i64) -> i64
      %4763 = func.call @cc_intern(%4759, %4762) : (i64, i64) -> i64
      %4764 = func.call @cc_nil_value() : () -> i64
      %4765 = func.call @cc_cons(%4763, %4764) : (i64, i64) -> i64
      %4766 = func.call @cc_values_pack(%4765) : (i64) -> i64
      func.call @stack_push_pointer(%4763) : (i64) -> ()
      %4767 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4768 = arith.constant 20 : i64
      %4769 = func.call @cc_make_string(%4767, %4768) : (!llvm.ptr, i64) -> i64
      %4770 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4771 = arith.constant 11 : i64
      %4772 = func.call @cc_make_string(%4770, %4771) : (!llvm.ptr, i64) -> i64
      %4773 = func.call @cc_intern(%4769, %4772) : (i64, i64) -> i64
      %4774 = func.call @cc_nil_value() : () -> i64
      %4775 = func.call @cc_cons(%4773, %4774) : (i64, i64) -> i64
      %4776 = func.call @cc_values_pack(%4775) : (i64) -> i64
      func.call @stack_push_pointer(%4773) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4777 = func.call @stack_pop_pointer() : () -> i64
      %4778 = func.call @stack_pop_pointer() : () -> i64
      %4779 = func.call @cc_cons(%4778, %4777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %4780 = arith.addi %4779, %__rlasp_stack_elide_zero_233 : i64
      %4781 = func.call @stack_pop_pointer() : () -> i64
      %4782 = func.call @cc_cons(%4781, %4780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4783 = func.call @stack_pop_pointer() : () -> i64
      %4784 = func.call @stack_pop_pointer() : () -> i64
      %4785 = func.call @cc_cons(%4784, %4783) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %4786 = arith.addi %4785, %__rlasp_stack_elide_zero_234 : i64
      %4787 = func.call @stack_pop_pointer() : () -> i64
      %4788 = func.call @cc_cons(%4787, %4786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4788) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4789 = func.call @stack_pop_pointer() : () -> i64
      %4790 = func.call @stack_pop_pointer() : () -> i64
      %4791 = func.call @cc_cons(%4790, %4789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %4792 = arith.addi %4791, %__rlasp_stack_elide_zero_235 : i64
      %4793 = func.call @stack_pop_pointer() : () -> i64
      %4794 = func.call @cc_cons(%4793, %4792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4795 = func.call @stack_pop_pointer() : () -> i64
      %4796 = func.call @stack_pop_pointer() : () -> i64
      %4797 = func.call @cc_cons(%4796, %4795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %4798 = arith.addi %4797, %__rlasp_stack_elide_zero_236 : i64
      %4799 = func.call @stack_pop_pointer() : () -> i64
      %4800 = func.call @cc_cons(%4799, %4798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %4801 = arith.addi %4800, %__rlasp_stack_elide_zero_237 : i64
      %4802 = func.call @stack_pop_pointer() : () -> i64
      %4803 = func.call @cc_cons(%4802, %4801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4803) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4804 = func.call @stack_pop_pointer() : () -> i64
      %4805 = func.call @stack_pop_pointer() : () -> i64
      %4806 = func.call @cc_cons(%4805, %4804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %4807 = arith.addi %4806, %__rlasp_stack_elide_zero_238 : i64
      %4808 = func.call @stack_pop_pointer() : () -> i64
      %4809 = func.call @cc_cons(%4808, %4807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %4810 = arith.addi %4809, %__rlasp_stack_elide_zero_239 : i64
      %4903 = arith.constant 162741310455822 : i64
      %4904 = arith.constant 0 : i64
      %4905 = func.call @cc_make_closure(%4903, %4904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %4906 = arith.addi %4905, %__rlasp_stack_elide_zero_240 : i64
      %4907 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4908 = arith.constant 4 : i64
      %4909 = func.call @cc_make_string(%4907, %4908) : (!llvm.ptr, i64) -> i64
      %4910 = func.call @cc_nil_value() : () -> i64
      %4911 = func.call @cc_intern(%4909, %4910) : (i64, i64) -> i64
      %4912 = func.call @cc_nil_value() : () -> i64
      %4913 = func.call @cc_cons(%4911, %4912) : (i64, i64) -> i64
      %4914 = func.call @cc_values_pack(%4913) : (i64) -> i64
      func.call @stack_push_pointer(%4911) : (i64) -> ()
      %4915 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4916 = arith.constant 5 : i64
      %4917 = func.call @cc_make_string(%4915, %4916) : (!llvm.ptr, i64) -> i64
      %4918 = func.call @cc_nil_value() : () -> i64
      %4919 = func.call @cc_intern(%4917, %4918) : (i64, i64) -> i64
      %4920 = func.call @cc_nil_value() : () -> i64
      %4921 = func.call @cc_cons(%4919, %4920) : (i64, i64) -> i64
      %4922 = func.call @cc_values_pack(%4921) : (i64) -> i64
      func.call @stack_push_pointer(%4919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4923 = func.call @stack_pop_pointer() : () -> i64
      %4924 = func.call @stack_pop_pointer() : () -> i64
      %4925 = func.call @cc_cons(%4924, %4923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %4926 = arith.addi %4925, %__rlasp_stack_elide_zero_241 : i64
      %4927 = func.call @stack_pop_pointer() : () -> i64
      %4928 = func.call @cc_cons(%4927, %4926) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %4929 = arith.addi %4928, %__rlasp_stack_elide_zero_242 : i64
      %4930 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4931 = arith.constant 11 : i64
      %4932 = func.call @cc_make_string(%4930, %4931) : (!llvm.ptr, i64) -> i64
      %4933 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4934 = arith.constant 7 : i64
      %4935 = func.call @cc_make_string(%4933, %4934) : (!llvm.ptr, i64) -> i64
      %4936 = func.call @cc_intern(%4932, %4935) : (i64, i64) -> i64
      %4937 = func.call @cc_nil_value() : () -> i64
      %4938 = func.call @cc_cons(%4936, %4937) : (i64, i64) -> i64
      %4939 = func.call @cc_values_pack(%4938) : (i64) -> i64
      %4940 = func.call @cc_nil_value() : () -> i64
      %4941 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4942 = arith.constant 4 : i64
      %4943 = func.call @cc_make_string(%4941, %4942) : (!llvm.ptr, i64) -> i64
      %4944 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4945 = arith.constant 7 : i64
      %4946 = func.call @cc_make_string(%4944, %4945) : (!llvm.ptr, i64) -> i64
      %4947 = func.call @cc_intern(%4943, %4946) : (i64, i64) -> i64
      %4948 = func.call @cc_nil_value() : () -> i64
      %4949 = func.call @cc_cons(%4947, %4948) : (i64, i64) -> i64
      %4950 = func.call @cc_values_pack(%4949) : (i64) -> i64
      %4951 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4952 = arith.constant 5 : i64
      %4953 = func.call @cc_make_string(%4951, %4952) : (!llvm.ptr, i64) -> i64
      %4954 = func.call @cc_nil_value() : () -> i64
      %4955 = func.call @cc_intern(%4953, %4954) : (i64, i64) -> i64
      %4956 = func.call @cc_nil_value() : () -> i64
      %4957 = func.call @cc_cons(%4955, %4956) : (i64, i64) -> i64
      %4958 = func.call @cc_values_pack(%4957) : (i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %4959 = arith.addi %4955, %__rlasp_stack_elide_zero_243 : i64
      %4960 = func.call @cc_nil_value() : () -> i64
      %4961 = func.call @cc_errorp(%4720) : (i64) -> i64
      %4962 = arith.cmpi ne, %4961, %4960 : i64
      %4963 = arith.cmpi eq, %4960, %4960 : i64
      %4964 = arith.andi %4962, %4963 : i1
      %4965 = scf.if %4964 -> (i64) {
        scf.yield %4720 : i64
      } else {
        scf.yield %4960 : i64
      }
      %4966 = func.call @cc_errorp(%4810) : (i64) -> i64
      %4967 = arith.cmpi ne, %4966, %4960 : i64
      %4968 = arith.cmpi eq, %4965, %4960 : i64
      %4969 = arith.andi %4967, %4968 : i1
      %4970 = scf.if %4969 -> (i64) {
        scf.yield %4810 : i64
      } else {
        scf.yield %4965 : i64
      }
      %4971 = func.call @cc_errorp(%4906) : (i64) -> i64
      %4972 = arith.cmpi ne, %4971, %4960 : i64
      %4973 = arith.cmpi eq, %4970, %4960 : i64
      %4974 = arith.andi %4972, %4973 : i1
      %4975 = scf.if %4974 -> (i64) {
        scf.yield %4906 : i64
      } else {
        scf.yield %4970 : i64
      }
      %4976 = func.call @cc_errorp(%4929) : (i64) -> i64
      %4977 = arith.cmpi ne, %4976, %4960 : i64
      %4978 = arith.cmpi eq, %4975, %4960 : i64
      %4979 = arith.andi %4977, %4978 : i1
      %4980 = scf.if %4979 -> (i64) {
        scf.yield %4929 : i64
      } else {
        scf.yield %4975 : i64
      }
      %4981 = func.call @cc_errorp(%4936) : (i64) -> i64
      %4982 = arith.cmpi ne, %4981, %4960 : i64
      %4983 = arith.cmpi eq, %4980, %4960 : i64
      %4984 = arith.andi %4982, %4983 : i1
      %4985 = scf.if %4984 -> (i64) {
        scf.yield %4936 : i64
      } else {
        scf.yield %4980 : i64
      }
      %4986 = func.call @cc_errorp(%4940) : (i64) -> i64
      %4987 = arith.cmpi ne, %4986, %4960 : i64
      %4988 = arith.cmpi eq, %4985, %4960 : i64
      %4989 = arith.andi %4987, %4988 : i1
      %4990 = scf.if %4989 -> (i64) {
        scf.yield %4940 : i64
      } else {
        scf.yield %4985 : i64
      }
      %4991 = func.call @cc_errorp(%4947) : (i64) -> i64
      %4992 = arith.cmpi ne, %4991, %4960 : i64
      %4993 = arith.cmpi eq, %4990, %4960 : i64
      %4994 = arith.andi %4992, %4993 : i1
      %4995 = scf.if %4994 -> (i64) {
        scf.yield %4947 : i64
      } else {
        scf.yield %4990 : i64
      }
      %4996 = func.call @cc_errorp(%4959) : (i64) -> i64
      %4997 = arith.cmpi ne, %4996, %4960 : i64
      %4998 = arith.cmpi eq, %4995, %4960 : i64
      %4999 = arith.andi %4997, %4998 : i1
      %5000 = scf.if %4999 -> (i64) {
        scf.yield %4959 : i64
      } else {
        scf.yield %4995 : i64
      }
      %5001 = arith.cmpi ne, %5000, %4960 : i64
      scf.if %5001 {
        func.call @stack_push_pointer(%5000) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4720) : (i64) -> ()
        func.call @stack_push_pointer(%4810) : (i64) -> ()
        func.call @stack_push_pointer(%4906) : (i64) -> ()
        func.call @stack_push_pointer(%4929) : (i64) -> ()
        func.call @stack_push_pointer(%4936) : (i64) -> ()
        func.call @stack_push_pointer(%4940) : (i64) -> ()
        func.call @stack_push_pointer(%4947) : (i64) -> ()
        func.call @stack_push_pointer(%4959) : (i64) -> ()
        %5002 = llvm.mlir.addressof @str354 : !llvm.ptr
        %5003 = func.call @cc_make_function_ref_const(%5002) : (!llvm.ptr) -> i64
        %5004 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5003, %5004) : (i64, i64) -> ()
      }
      %5005 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5005 : i64
    }
    %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
    %5006 = arith.addi %4711, %__rlasp_stack_elide_zero_244 : i64
    %5007 = func.call @cc_multiple_value_list(%5006) : (i64) -> i64
    %5008 = llvm.mlir.addressof @str355 : !llvm.ptr
    %5009 = arith.constant 38 : i64
    %5010 = func.call @cc_make_string(%5008, %5009) : (!llvm.ptr, i64) -> i64
    %5011 = func.call @cc_nil_value() : () -> i64
    %5012 = func.call @cc_intern(%5010, %5011) : (i64, i64) -> i64
    %5013 = func.call @cc_nil_value() : () -> i64
    %5014 = func.call @cc_cons(%5012, %5013) : (i64, i64) -> i64
    %5015 = func.call @cc_values_pack(%5014) : (i64) -> i64
    %5016 = func.call @cc_symbol_value(%5012) : (i64) -> i64
    %5017 = llvm.mlir.addressof @str356 : !llvm.ptr
    %5018 = arith.constant 40 : i64
    %5019 = func.call @cc_make_string(%5017, %5018) : (!llvm.ptr, i64) -> i64
    %5020 = func.call @cc_nil_value() : () -> i64
    %5021 = func.call @cc_intern(%5019, %5020) : (i64, i64) -> i64
    %5022 = func.call @cc_nil_value() : () -> i64
    %5023 = func.call @cc_cons(%5021, %5022) : (i64, i64) -> i64
    %5024 = func.call @cc_values_pack(%5023) : (i64) -> i64
    %5025 = func.call @cc_symbol_value(%5021) : (i64) -> i64
    %5026 = func.call @cc_nil_value() : () -> i64
    %5027 = arith.cmpi ne, %5016, %5026 : i64
    %5028 = scf.if %5027 -> (i64) {
      scf.yield %5025 : i64
    } else {
      scf.yield %5007 : i64
    }
    %5029 = func.call @cc_values_pack(%5028) : (i64) -> i64
    func.call @stack_push_pointer(%5029) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455809"() {
    %761 = func.call @cc_nil_value() : () -> i64
    %762 = func.call @cc_nil_value() : () -> i64
    %763 = func.call @cc_errorp(%761) : (i64) -> i64
    %764 = arith.cmpi ne, %763, %762 : i64
    %765 = scf.if %764 -> (i64) {
      scf.yield %761 : i64
    } else {
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = llvm.mlir.addressof @str63 : !llvm.ptr
      %768 = arith.constant 26 : i64
      %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
      %770 = llvm.mlir.addressof @str64 : !llvm.ptr
      %771 = arith.constant 11 : i64
      %772 = func.call @cc_make_string(%770, %771) : (!llvm.ptr, i64) -> i64
      %773 = func.call @cc_intern(%769, %772) : (i64, i64) -> i64
      %774 = func.call @cc_nil_value() : () -> i64
      %775 = func.call @cc_cons(%773, %774) : (i64, i64) -> i64
      %776 = func.call @cc_values_pack(%775) : (i64) -> i64
      %777 = func.call @cc_symbol_value(%773) : (i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %778 = arith.addi %777, %__rlasp_stack_elide_zero_245 : i64
      %779 = arith.constant -3.0 : f64
      %780 = func.call @cc_box_single_float(%779) : (f64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %781 = arith.addi %780, %__rlasp_stack_elide_zero_246 : i64
      %782 = arith.constant 0.0 : f64
      %783 = func.call @cc_box_single_float(%782) : (f64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %784 = arith.addi %783, %__rlasp_stack_elide_zero_247 : i64
      %785 = arith.constant 3.0 : f64
      %786 = func.call @cc_box_single_float(%785) : (f64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %787 = arith.addi %786, %__rlasp_stack_elide_zero_248 : i64
      %788 = llvm.mlir.addressof @str65 : !llvm.ptr
      %789 = arith.constant 26 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str66 : !llvm.ptr
      %792 = arith.constant 11 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      %798 = func.call @cc_symbol_value(%794) : (i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %799 = arith.addi %798, %__rlasp_stack_elide_zero_249 : i64
      %800 = func.call @cc_nil_value() : () -> i64
      %801 = func.call @cc_errorp(%778) : (i64) -> i64
      %802 = arith.cmpi ne, %801, %800 : i64
      %803 = arith.cmpi eq, %800, %800 : i64
      %804 = arith.andi %802, %803 : i1
      %805 = scf.if %804 -> (i64) {
        scf.yield %778 : i64
      } else {
        scf.yield %800 : i64
      }
      %806 = func.call @cc_errorp(%781) : (i64) -> i64
      %807 = arith.cmpi ne, %806, %800 : i64
      %808 = arith.cmpi eq, %805, %800 : i64
      %809 = arith.andi %807, %808 : i1
      %810 = scf.if %809 -> (i64) {
        scf.yield %781 : i64
      } else {
        scf.yield %805 : i64
      }
      %811 = func.call @cc_errorp(%784) : (i64) -> i64
      %812 = arith.cmpi ne, %811, %800 : i64
      %813 = arith.cmpi eq, %810, %800 : i64
      %814 = arith.andi %812, %813 : i1
      %815 = scf.if %814 -> (i64) {
        scf.yield %784 : i64
      } else {
        scf.yield %810 : i64
      }
      %816 = func.call @cc_errorp(%787) : (i64) -> i64
      %817 = arith.cmpi ne, %816, %800 : i64
      %818 = arith.cmpi eq, %815, %800 : i64
      %819 = arith.andi %817, %818 : i1
      %820 = scf.if %819 -> (i64) {
        scf.yield %787 : i64
      } else {
        scf.yield %815 : i64
      }
      %821 = func.call @cc_errorp(%799) : (i64) -> i64
      %822 = arith.cmpi ne, %821, %800 : i64
      %823 = arith.cmpi eq, %820, %800 : i64
      %824 = arith.andi %822, %823 : i1
      %825 = scf.if %824 -> (i64) {
        scf.yield %799 : i64
      } else {
        scf.yield %820 : i64
      }
      %826 = arith.cmpi ne, %825, %800 : i64
      scf.if %826 {
        func.call @stack_push_pointer(%825) : (i64) -> ()
      } else {
        %827 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%827) : (i64) -> ()
        %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
        %828 = arith.addi %799, %__rlasp_stack_elide_zero_250 : i64
        %829 = func.call @stack_pop_pointer() : () -> i64
        %830 = func.call @cc_cons(%828, %829) : (i64, i64) -> i64
        func.call @stack_push_pointer(%830) : (i64) -> ()
        %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
        %831 = arith.addi %787, %__rlasp_stack_elide_zero_251 : i64
        %832 = func.call @stack_pop_pointer() : () -> i64
        %833 = func.call @cc_cons(%831, %832) : (i64, i64) -> i64
        func.call @stack_push_pointer(%833) : (i64) -> ()
        %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
        %834 = arith.addi %784, %__rlasp_stack_elide_zero_252 : i64
        %835 = func.call @stack_pop_pointer() : () -> i64
        %836 = func.call @cc_cons(%834, %835) : (i64, i64) -> i64
        func.call @stack_push_pointer(%836) : (i64) -> ()
        %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
        %837 = arith.addi %781, %__rlasp_stack_elide_zero_253 : i64
        %838 = func.call @stack_pop_pointer() : () -> i64
        %839 = func.call @cc_cons(%837, %838) : (i64, i64) -> i64
        func.call @stack_push_pointer(%839) : (i64) -> ()
        %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
        %840 = arith.addi %778, %__rlasp_stack_elide_zero_254 : i64
        %841 = func.call @stack_pop_pointer() : () -> i64
        %842 = func.call @cc_cons(%840, %841) : (i64, i64) -> i64
        func.call @stack_push_pointer(%842) : (i64) -> ()
      }
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @cc_nil_value() : () -> i64
      %845 = func.call @cc_nil_value() : () -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_nil_value() : () -> i64
      %848 = func.call @cc_errorp(%846) : (i64) -> i64
      %849 = arith.cmpi ne, %848, %847 : i64
      %850:5 = scf.if %849 -> (i64, i64, i64, i64, i64) {
        scf.yield %846, %843, %845, %766, %844 : i64, i64, i64, i64, i64
      } else {
        %851 = func.call @cc_nil_value() : () -> i64
        %852 = llvm.mlir.addressof @str67 : !llvm.ptr
        %853 = arith.constant 38 : i64
        %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
        %855 = func.call @cc_nil_value() : () -> i64
        %856 = func.call @cc_intern(%854, %855) : (i64, i64) -> i64
        %857 = func.call @cc_nil_value() : () -> i64
        %858 = func.call @cc_cons(%856, %857) : (i64, i64) -> i64
        %859 = func.call @cc_values_pack(%858) : (i64) -> i64
        %860 = func.call @cc_set_symbol_value(%856, %851) : (i64, i64) -> i64
        %861 = llvm.mlir.addressof @str68 : !llvm.ptr
        %862 = arith.constant 39 : i64
        %863 = func.call @cc_make_string(%861, %862) : (!llvm.ptr, i64) -> i64
        %864 = func.call @cc_nil_value() : () -> i64
        %865 = func.call @cc_intern(%863, %864) : (i64, i64) -> i64
        %866 = func.call @cc_nil_value() : () -> i64
        %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
        %868 = func.call @cc_values_pack(%867) : (i64) -> i64
        %869 = func.call @cc_set_symbol_value(%865, %851) : (i64, i64) -> i64
        %870 = llvm.mlir.addressof @str69 : !llvm.ptr
        %871 = arith.constant 40 : i64
        %872 = func.call @cc_make_string(%870, %871) : (!llvm.ptr, i64) -> i64
        %873 = func.call @cc_nil_value() : () -> i64
        %874 = func.call @cc_intern(%872, %873) : (i64, i64) -> i64
        %875 = func.call @cc_nil_value() : () -> i64
        %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
        %877 = func.call @cc_values_pack(%876) : (i64) -> i64
        %878 = func.call @cc_set_symbol_value(%874, %851) : (i64, i64) -> i64
        %879:4 = scf.while (%arg0 = %766, %arg1 = %844, %arg2 = %845, %arg3 = %843) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
          %880 = arith.addi %arg3, %__rlasp_stack_elide_zero_255 : i64
          %881 = func.call @cc_nil_value() : () -> i64
          %882 = arith.cmpi ne, %880, %881 : i64
          %883 = func.call @cc_nil_value() : () -> i64
          %884 = llvm.mlir.addressof @str70 : !llvm.ptr
          %885 = arith.constant 38 : i64
          %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
          %887 = func.call @cc_nil_value() : () -> i64
          %888 = func.call @cc_intern(%886, %887) : (i64, i64) -> i64
          %889 = func.call @cc_nil_value() : () -> i64
          %890 = func.call @cc_cons(%888, %889) : (i64, i64) -> i64
          %891 = func.call @cc_values_pack(%890) : (i64) -> i64
          %892 = func.call @cc_symbol_value(%888) : (i64) -> i64
          %893 = arith.cmpi ne, %892, %883 : i64
          %894 = llvm.mlir.addressof @str71 : !llvm.ptr
          %895 = arith.constant 38 : i64
          %896 = func.call @cc_make_string(%894, %895) : (!llvm.ptr, i64) -> i64
          %897 = func.call @cc_nil_value() : () -> i64
          %898 = func.call @cc_intern(%896, %897) : (i64, i64) -> i64
          %899 = func.call @cc_nil_value() : () -> i64
          %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
          %901 = func.call @cc_values_pack(%900) : (i64) -> i64
          %902 = func.call @cc_symbol_value(%898) : (i64) -> i64
          %903 = arith.cmpi ne, %902, %883 : i64
          %904 = arith.ori %893, %903 : i1
          %905 = arith.constant 0 : i1
          %906 = arith.cmpi eq, %904, %905 : i1
          %907 = arith.andi %882, %906 : i1
          scf.condition(%907) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
        } do {
          ^bb0(%908: i64, %909: i64, %910: i64, %911: i64):
          %912 = func.call @cc_nil_value() : () -> i64
          %913 = func.call @cc_nil_value() : () -> i64
          %914 = func.call @cc_errorp(%912) : (i64) -> i64
          %915 = arith.cmpi ne, %914, %913 : i64
          %916:4 = scf.if %915 -> (i64, i64, i64, i64) {
            scf.yield %912, %910, %908, %909 : i64, i64, i64, i64
          } else {
            %917 = func.call @cc_nil_value() : () -> i64
            %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
            %918 = arith.addi %911, %__rlasp_stack_elide_zero_256 : i64
            %919 = func.call @cc_nil_value() : () -> i64
            %920 = arith.cmpi eq, %918, %919 : i64
            %922 = func.call @cc_t_value() : () -> i64
            %921 = arith.select %920, %922, %919 : i64
            %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
            %923 = arith.addi %921, %__rlasp_stack_elide_zero_257 : i64
            %924 = func.call @cc_nil_value() : () -> i64
            %925 = func.call @cc_cons(%923, %924) : (i64, i64) -> i64
            %926 = func.call @cc_not(%925) : (i64) -> i64
            %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
            %927 = arith.addi %926, %__rlasp_stack_elide_zero_258 : i64
            %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
            %928 = arith.addi %911, %__rlasp_stack_elide_zero_259 : i64
            %929 = func.call @cc_is_cons(%928) : (i64) -> i32
            %930 = arith.constant 0 : i32
            %931 = arith.cmpi ne, %929, %930 : i32
            %932 = func.call @cc_t_value() : () -> i64
            %933 = func.call @cc_nil_value() : () -> i64
            %934 = arith.select %931, %932, %933 : i64
            %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
            %935 = arith.addi %934, %__rlasp_stack_elide_zero_260 : i64
            %936 = func.call @cc_nil_value() : () -> i64
            %937 = func.call @cc_cons(%935, %936) : (i64, i64) -> i64
            %938 = func.call @cc_not(%937) : (i64) -> i64
            %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
            %939 = arith.addi %938, %__rlasp_stack_elide_zero_261 : i64
            %940 = func.call @cc_cons(%939, %917) : (i64, i64) -> i64
            %941 = func.call @cc_cons(%927, %940) : (i64, i64) -> i64
            %942 = func.call @cc_and(%941) : (i64) -> i64
            %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
            %943 = arith.addi %942, %__rlasp_stack_elide_zero_262 : i64
            %944 = func.call @cc_nil_value() : () -> i64
            %945 = arith.cmpi ne, %943, %944 : i64
            scf.if %945 {
              %946 = llvm.mlir.addressof @str72 : !llvm.ptr
              %947 = arith.constant 10 : i64
              %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
              %949 = func.call @cc_nil_value() : () -> i64
              %950 = func.call @cc_intern(%948, %949) : (i64, i64) -> i64
              %951 = func.call @cc_nil_value() : () -> i64
              %952 = func.call @cc_cons(%950, %951) : (i64, i64) -> i64
              %953 = func.call @cc_values_pack(%952) : (i64) -> i64
              %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
              %954 = arith.addi %950, %__rlasp_stack_elide_zero_263 : i64
              %955 = func.call @cc_nil_value() : () -> i64
              %956 = func.call @cc_errorp(%954) : (i64) -> i64
              %957 = arith.cmpi ne, %956, %955 : i64
              %958 = arith.cmpi eq, %955, %955 : i64
              %959 = arith.andi %957, %958 : i1
              %960 = scf.if %959 -> (i64) {
                scf.yield %954 : i64
              } else {
                scf.yield %955 : i64
              }
              %961 = arith.cmpi ne, %960, %955 : i64
              scf.if %961 {
                func.call @stack_push_pointer(%960) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%954) : (i64) -> ()
                %962 = llvm.mlir.addressof @str73 : !llvm.ptr
                %963 = func.call @cc_make_function_ref_const(%962) : (!llvm.ptr) -> i64
                %964 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%963, %964) : (i64, i64) -> ()
              }
              %965 = func.call @stack_pop_pointer() : () -> i64
              %966 = func.call @cc_multiple_value_list(%965) : (i64) -> i64
              %967 = func.call @cc_t_value() : () -> i64
              %968 = llvm.mlir.addressof @str74 : !llvm.ptr
              %969 = arith.constant 38 : i64
              %970 = func.call @cc_make_string(%968, %969) : (!llvm.ptr, i64) -> i64
              %971 = func.call @cc_nil_value() : () -> i64
              %972 = func.call @cc_intern(%970, %971) : (i64, i64) -> i64
              %973 = func.call @cc_nil_value() : () -> i64
              %974 = func.call @cc_cons(%972, %973) : (i64, i64) -> i64
              %975 = func.call @cc_values_pack(%974) : (i64) -> i64
              %976 = func.call @cc_set_symbol_value(%972, %967) : (i64, i64) -> i64
              %977 = llvm.mlir.addressof @str75 : !llvm.ptr
              %978 = arith.constant 39 : i64
              %979 = func.call @cc_make_string(%977, %978) : (!llvm.ptr, i64) -> i64
              %980 = func.call @cc_nil_value() : () -> i64
              %981 = func.call @cc_intern(%979, %980) : (i64, i64) -> i64
              %982 = func.call @cc_nil_value() : () -> i64
              %983 = func.call @cc_cons(%981, %982) : (i64, i64) -> i64
              %984 = func.call @cc_values_pack(%983) : (i64) -> i64
              %985 = func.call @cc_set_symbol_value(%981, %965) : (i64, i64) -> i64
              %986 = llvm.mlir.addressof @str76 : !llvm.ptr
              %987 = arith.constant 40 : i64
              %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
              %989 = func.call @cc_nil_value() : () -> i64
              %990 = func.call @cc_intern(%988, %989) : (i64, i64) -> i64
              %991 = func.call @cc_nil_value() : () -> i64
              %992 = func.call @cc_cons(%990, %991) : (i64, i64) -> i64
              %993 = func.call @cc_values_pack(%992) : (i64) -> i64
              %994 = func.call @cc_set_symbol_value(%990, %966) : (i64, i64) -> i64
              func.call @stack_push_pointer(%965) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %995 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %995, %910, %908, %909 : i64, i64, i64, i64
          }
          %996 = func.call @cc_nil_value() : () -> i64
          %997 = func.call @cc_errorp(%916#0) : (i64) -> i64
          %998 = arith.cmpi ne, %997, %996 : i64
          %999:4 = scf.if %998 -> (i64, i64, i64, i64) {
            scf.yield %916#0, %916#1, %916#2, %916#3 : i64, i64, i64, i64
          } else {
            %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
            %1000 = arith.addi %911, %__rlasp_stack_elide_zero_264 : i64
            %1001 = func.call @cc_car(%1000) : (i64) -> i64
            %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
            %1002 = arith.addi %1001, %__rlasp_stack_elide_zero_265 : i64
            %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
            %1003 = arith.addi %1002, %__rlasp_stack_elide_zero_266 : i64
            scf.yield %1003, %916#1, %1002, %916#3 : i64, i64, i64, i64
          }
          %1004 = func.call @cc_nil_value() : () -> i64
          %1005 = func.call @cc_errorp(%999#0) : (i64) -> i64
          %1006 = arith.cmpi ne, %1005, %1004 : i64
          %1007:4 = scf.if %1006 -> (i64, i64, i64, i64) {
            scf.yield %999#0, %999#1, %999#2, %999#3 : i64, i64, i64, i64
          } else {
            %1008 = func.call @cc_nil_value() : () -> i64
            %1009 = func.call @cc_errorp(%999#2) : (i64) -> i64
            %1010 = arith.cmpi ne, %1009, %1008 : i64
            %1011 = arith.cmpi eq, %1008, %1008 : i64
            %1012 = arith.andi %1010, %1011 : i1
            %1013 = scf.if %1012 -> (i64) {
              scf.yield %999#2 : i64
            } else {
              scf.yield %1008 : i64
            }
            %1014 = arith.cmpi ne, %1013, %1008 : i64
            scf.if %1014 {
              func.call @stack_push_pointer(%1013) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%999#2) : (i64) -> ()
              %1015 = llvm.mlir.addressof @str77 : !llvm.ptr
              %1016 = func.call @cc_make_function_ref_const(%1015) : (!llvm.ptr) -> i64
              %1017 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1016, %1017) : (i64, i64) -> ()
            }
            %1018 = func.call @stack_pop_pointer() : () -> i64
            %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
            %1019 = arith.addi %1018, %__rlasp_stack_elide_zero_267 : i64
            scf.yield %1019, %999#1, %999#2, %1018 : i64, i64, i64, i64
          }
          %1020 = func.call @cc_nil_value() : () -> i64
          %1021 = func.call @cc_errorp(%1007#0) : (i64) -> i64
          %1022 = arith.cmpi ne, %1021, %1020 : i64
          %1023:4 = scf.if %1022 -> (i64, i64, i64, i64) {
            scf.yield %1007#0, %1007#1, %1007#2, %1007#3 : i64, i64, i64, i64
          } else {
            %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
            %1024 = arith.addi %1007#2, %__rlasp_stack_elide_zero_268 : i64
            %1025 = func.call @cc_nil_value() : () -> i64
            %1026 = func.call @cc_errorp(%1007#3) : (i64) -> i64
            %1027 = arith.cmpi ne, %1026, %1025 : i64
            %1028 = arith.cmpi eq, %1025, %1025 : i64
            %1029 = arith.andi %1027, %1028 : i1
            %1030 = scf.if %1029 -> (i64) {
              scf.yield %1007#3 : i64
            } else {
              scf.yield %1025 : i64
            }
            %1031 = arith.cmpi ne, %1030, %1025 : i64
            scf.if %1031 {
              func.call @stack_push_pointer(%1030) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1007#3) : (i64) -> ()
              %1032 = llvm.mlir.addressof @str78 : !llvm.ptr
              %1033 = func.call @cc_make_function_ref_const(%1032) : (!llvm.ptr) -> i64
              %1034 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1033, %1034) : (i64, i64) -> ()
            }
            %1035 = func.call @stack_pop_pointer() : () -> i64
            %1036 = arith.constant 1 : i1
            %1038 = arith.constant 3 : i64
            %1037 = arith.andi %1024, %1038 : i64
            %1039 = arith.constant 0 : i64
            %1040 = arith.cmpi eq, %1037, %1039 : i64
            %1042 = arith.constant 3 : i64
            %1041 = arith.andi %1035, %1042 : i64
            %1043 = arith.constant 0 : i64
            %1044 = arith.cmpi eq, %1041, %1043 : i64
            %1045 = arith.andi %1040, %1044 : i1
            %1046 = scf.if %1045 -> (i1) {
              %1047 = arith.constant 2 : i64
              %1048 = arith.shrsi %1024, %1047 : i64
              %1049 = arith.constant 2 : i64
              %1050 = arith.shrsi %1035, %1049 : i64
              %1051 = arith.cmpi eq, %1048, %1050 : i64
              scf.yield %1051 : i1
            } else {
              %1052 = func.call @cc_eq(%1024, %1035) : (i64, i64) -> i64
              %1053 = func.call @cc_nil_value() : () -> i64
              %1054 = arith.cmpi ne, %1052, %1053 : i64
              scf.yield %1054 : i1
            }
            %1055 = arith.andi %1036, %1046 : i1
            %1056 = func.call @cc_nil_value() : () -> i64
            %1057 = func.call @cc_t_value() : () -> i64
            %1058 = scf.if %1055 -> (i64) {
              scf.yield %1057 : i64
            } else {
              scf.yield %1056 : i64
            }
            %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
            %1059 = arith.addi %1058, %__rlasp_stack_elide_zero_269 : i64
            %1060 = func.call @cc_nil_value() : () -> i64
            %1061 = func.call @cc_cons(%1059, %1060) : (i64, i64) -> i64
            %1062 = func.call @cc_not(%1061) : (i64) -> i64
            %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
            %1063 = arith.addi %1062, %__rlasp_stack_elide_zero_270 : i64
            %1064 = func.call @cc_nil_value() : () -> i64
            %1065 = arith.cmpi ne, %1063, %1064 : i64
            %1066:2 = scf.if %1065 -> (i64, i64) {
              %1067 = func.call @cc_nil_value() : () -> i64
              %1068 = func.call @cc_nil_value() : () -> i64
              %1069 = func.call @cc_errorp(%1067) : (i64) -> i64
              %1070 = arith.cmpi ne, %1069, %1068 : i64
              %1071:2 = scf.if %1070 -> (i64, i64) {
                scf.yield %1067, %1007#1 : i64, i64
              } else {
                func.call @stack_push_pointer(%1007#1) : (i64) -> ()
                %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
                %1072 = arith.addi %1007#2, %__rlasp_stack_elide_zero_271 : i64
                %1073 = func.call @cc_nil_value() : () -> i64
                %1074 = func.call @cc_errorp(%1072) : (i64) -> i64
                %1075 = arith.cmpi ne, %1074, %1073 : i64
                %1076 = arith.cmpi eq, %1073, %1073 : i64
                %1077 = arith.andi %1075, %1076 : i1
                %1078 = scf.if %1077 -> (i64) {
                  scf.yield %1072 : i64
                } else {
                  scf.yield %1073 : i64
                }
                %1079 = arith.cmpi ne, %1078, %1073 : i64
                scf.if %1079 {
                  func.call @stack_push_pointer(%1078) : (i64) -> ()
                } else {
                  %1080 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%1080) : (i64) -> ()
                  %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
                  %1081 = arith.addi %1072, %__rlasp_stack_elide_zero_272 : i64
                  %1082 = func.call @stack_pop_pointer() : () -> i64
                  %1083 = func.call @cc_cons(%1081, %1082) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1083) : (i64) -> ()
                }
                %1084 = func.call @stack_pop_pointer() : () -> i64
                %1085 = func.call @stack_pop_pointer() : () -> i64
                %1086 = func.call @cc_append(%1085, %1084) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
                %1087 = arith.addi %1086, %__rlasp_stack_elide_zero_273 : i64
                %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
                %1088 = arith.addi %1087, %__rlasp_stack_elide_zero_274 : i64
                scf.yield %1088, %1087 : i64, i64
              }
              %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
              %1089 = arith.addi %1071#0, %__rlasp_stack_elide_zero_275 : i64
              scf.yield %1089, %1071#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %1090 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1090, %1007#1 : i64, i64
            }
            %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
            %1091 = arith.addi %1066#0, %__rlasp_stack_elide_zero_276 : i64
            scf.yield %1091, %1066#1, %1007#2, %1007#3 : i64, i64, i64, i64
          }
          func.call @stack_push_pointer(%1023#0) : (i64) -> ()
          %1092 = func.call @stack_depth() : () -> i64
          %1093 = arith.constant 0 : i64
          %1094 = arith.cmpi sgt, %1092, %1093 : i64
          scf.if %1094 {
            %1095 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
          %1096 = arith.addi %911, %__rlasp_stack_elide_zero_277 : i64
          %1097 = func.call @cc_cdr(%1096) : (i64) -> i64
          %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
          %1098 = arith.addi %1097, %__rlasp_stack_elide_zero_278 : i64
          func.call @stack_push_pointer(%1098) : (i64) -> ()
          %1099 = func.call @stack_depth() : () -> i64
          %1100 = arith.constant 0 : i64
          %1101 = arith.cmpi sgt, %1099, %1100 : i64
          scf.if %1101 {
            %1102 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1023#2, %1023#3, %1023#1, %1098 : i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1103 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
        %1104 = arith.addi %879#2, %__rlasp_stack_elide_zero_279 : i64
        %1105 = func.call @cc_multiple_value_list(%1104) : (i64) -> i64
        %1106 = llvm.mlir.addressof @str79 : !llvm.ptr
        %1107 = arith.constant 38 : i64
        %1108 = func.call @cc_make_string(%1106, %1107) : (!llvm.ptr, i64) -> i64
        %1109 = func.call @cc_nil_value() : () -> i64
        %1110 = func.call @cc_intern(%1108, %1109) : (i64, i64) -> i64
        %1111 = func.call @cc_nil_value() : () -> i64
        %1112 = func.call @cc_cons(%1110, %1111) : (i64, i64) -> i64
        %1113 = func.call @cc_values_pack(%1112) : (i64) -> i64
        %1114 = func.call @cc_symbol_value(%1110) : (i64) -> i64
        %1115 = llvm.mlir.addressof @str80 : !llvm.ptr
        %1116 = arith.constant 39 : i64
        %1117 = func.call @cc_make_string(%1115, %1116) : (!llvm.ptr, i64) -> i64
        %1118 = func.call @cc_nil_value() : () -> i64
        %1119 = func.call @cc_intern(%1117, %1118) : (i64, i64) -> i64
        %1120 = func.call @cc_nil_value() : () -> i64
        %1121 = func.call @cc_cons(%1119, %1120) : (i64, i64) -> i64
        %1122 = func.call @cc_values_pack(%1121) : (i64) -> i64
        %1123 = func.call @cc_symbol_value(%1119) : (i64) -> i64
        %1124 = llvm.mlir.addressof @str81 : !llvm.ptr
        %1125 = arith.constant 40 : i64
        %1126 = func.call @cc_make_string(%1124, %1125) : (!llvm.ptr, i64) -> i64
        %1127 = func.call @cc_nil_value() : () -> i64
        %1128 = func.call @cc_intern(%1126, %1127) : (i64, i64) -> i64
        %1129 = func.call @cc_nil_value() : () -> i64
        %1130 = func.call @cc_cons(%1128, %1129) : (i64, i64) -> i64
        %1131 = func.call @cc_values_pack(%1130) : (i64) -> i64
        %1132 = func.call @cc_symbol_value(%1128) : (i64) -> i64
        %1133 = func.call @cc_nil_value() : () -> i64
        %1134 = arith.cmpi ne, %1114, %1133 : i64
        %1135 = scf.if %1134 -> (i64) {
          scf.yield %1132 : i64
        } else {
          scf.yield %1105 : i64
        }
        %1136 = func.call @cc_values_pack(%1135) : (i64) -> i64
        %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
        %1137 = arith.addi %1136, %__rlasp_stack_elide_zero_280 : i64
        scf.yield %1137, %879#3, %879#2, %879#0, %879#1 : i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %1138 = arith.addi %850#0, %__rlasp_stack_elide_zero_281 : i64
      scf.yield %1138 : i64
    }
    func.call @stack_push_pointer(%765) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455811"() {
    %1301 = func.call @cc_nil_value() : () -> i64
    %1302 = func.call @cc_nil_value() : () -> i64
    %1303 = func.call @cc_errorp(%1301) : (i64) -> i64
    %1304 = arith.cmpi ne, %1303, %1302 : i64
    %1305 = scf.if %1304 -> (i64) {
      scf.yield %1301 : i64
    } else {
      %1306 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1307 = func.call @cc_nil_value() : () -> i64
      %1308 = func.call @cc_nil_value() : () -> i64
      %1309 = func.call @cc_errorp(%1307) : (i64) -> i64
      %1310 = arith.cmpi ne, %1309, %1308 : i64
      %1311 = scf.if %1310 -> (i64) {
        scf.yield %1307 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1312 = arith.constant 0 : i64
        %1313 = func.call @cc_box_fixnum(%1312) : (i64) -> i64
        %1314 = func.call @cc_nil_value() : () -> i64
        %1315 = func.call @cc_errorp(%1313) : (i64) -> i64
        %1316 = arith.cmpi ne, %1315, %1314 : i64
        %1317 = arith.cmpi eq, %1314, %1314 : i64
        %1318 = arith.andi %1316, %1317 : i1
        %1319 = scf.if %1318 -> (i64) {
          scf.yield %1313 : i64
        } else {
          scf.yield %1314 : i64
        }
        %1320 = arith.cmpi ne, %1319, %1314 : i64
        scf.if %1320 {
          func.call @stack_push_pointer(%1319) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1313) : (i64) -> ()
          %1321 = llvm.mlir.addressof @str95 : !llvm.ptr
          %1322 = func.call @cc_make_function_ref_const(%1321) : (!llvm.ptr) -> i64
          %1323 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1322, %1323) : (i64, i64) -> ()
        }
        %1324 = func.call @stack_pop_pointer() : () -> i64
        %1325 = func.call @cc_errorp(%1324) : (i64) -> i64
        %1326 = func.call @cc_nil_value() : () -> i64
        %1327 = arith.cmpi ne, %1325, %1326 : i64
        scf.if %1327 {
          func.call @stack_push_pointer(%1324) : (i64) -> ()
        } else {
          %1328 = func.call @cc_multiple_value_list(%1324) : (i64) -> i64
          func.call @stack_push_pointer(%1328) : (i64) -> ()
        }
        %1329 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1330 = func.call @stack_pop_pointer() : () -> i64
        %1331 = func.call @cc_nil_value() : () -> i64
        %1332 = func.call @cc_maybe_error_from_multiple_value_list(%1329) : (i64) -> i64
        %1333 = func.call @cc_errorp(%1332) : (i64) -> i64
        %1334 = arith.cmpi ne, %1333, %1331 : i64
        %1335 = arith.cmpi eq, %1331, %1331 : i64
        %1336 = arith.andi %1334, %1335 : i1
        %1337 = scf.if %1336 -> (i64) {
          scf.yield %1332 : i64
        } else {
          scf.yield %1331 : i64
        }
        %1338 = arith.cmpi ne, %1337, %1331 : i64
        scf.if %1338 {
          func.call @stack_push_pointer(%1337) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1339 = func.call @stack_pop_pointer() : () -> i64
          %1340 = func.call @cc_cons(%1330, %1339) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
          %1341 = arith.addi %1340, %__rlasp_stack_elide_zero_282 : i64
          %1342 = func.call @cc_cons(%1329, %1341) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
          %1343 = arith.addi %1342, %__rlasp_stack_elide_zero_283 : i64
          %1344 = func.call @cc_values_pack(%1343) : (i64) -> i64
          func.call @stack_push_pointer(%1344) : (i64) -> ()
        }
        %1345 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1345 : i64
      }
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %1346 = arith.addi %1311, %__rlasp_stack_elide_zero_284 : i64
      %1347 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1348 = func.call @cc_errorp(%1346) : (i64) -> i64
      %1349 = func.call @cc_nil_value() : () -> i64
      %1350 = arith.cmpi ne, %1348, %1349 : i64
      scf.if %1350 {
        %1351 = func.call @cc_condition_value(%1346) : (i64) -> i64
        %1352 = func.call @cc_values2(%1349, %1351) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1352) : (i64) -> ()
      } else {
        %1353 = func.call @cc_multiple_value_list(%1346) : (i64) -> i64
        %1354 = func.call @cc_values_pack(%1353) : (i64) -> i64
        func.call @stack_push_pointer(%1354) : (i64) -> ()
      }
      %1355 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1355 : i64
    }
    func.call @stack_push_pointer(%1305) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455812"() {
    %1537 = func.call @cc_nil_value() : () -> i64
    %1538 = func.call @cc_nil_value() : () -> i64
    %1539 = func.call @cc_errorp(%1537) : (i64) -> i64
    %1540 = arith.cmpi ne, %1539, %1538 : i64
    %1541 = scf.if %1540 -> (i64) {
      scf.yield %1537 : i64
    } else {
      %1542 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1543 = func.call @cc_nil_value() : () -> i64
      %1544 = func.call @cc_nil_value() : () -> i64
      %1545 = func.call @cc_errorp(%1543) : (i64) -> i64
      %1546 = arith.cmpi ne, %1545, %1544 : i64
      %1547 = scf.if %1546 -> (i64) {
        scf.yield %1543 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1548 = arith.constant 3 : i64
        %1549 = func.call @cc_box_fixnum(%1548) : (i64) -> i64
        %1550 = func.call @cc_nil_value() : () -> i64
        %1551 = func.call @cc_errorp(%1549) : (i64) -> i64
        %1552 = arith.cmpi ne, %1551, %1550 : i64
        %1553 = arith.cmpi eq, %1550, %1550 : i64
        %1554 = arith.andi %1552, %1553 : i1
        %1555 = scf.if %1554 -> (i64) {
          scf.yield %1549 : i64
        } else {
          scf.yield %1550 : i64
        }
        %1556 = arith.cmpi ne, %1555, %1550 : i64
        scf.if %1556 {
          func.call @stack_push_pointer(%1555) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1549) : (i64) -> ()
          %1557 = llvm.mlir.addressof @str111 : !llvm.ptr
          %1558 = func.call @cc_make_function_ref_const(%1557) : (!llvm.ptr) -> i64
          %1559 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1558, %1559) : (i64, i64) -> ()
        }
        %1560 = func.call @stack_pop_pointer() : () -> i64
        %1561 = func.call @cc_errorp(%1560) : (i64) -> i64
        %1562 = func.call @cc_nil_value() : () -> i64
        %1563 = arith.cmpi ne, %1561, %1562 : i64
        scf.if %1563 {
          func.call @stack_push_pointer(%1560) : (i64) -> ()
        } else {
          %1564 = func.call @cc_multiple_value_list(%1560) : (i64) -> i64
          func.call @stack_push_pointer(%1564) : (i64) -> ()
        }
        %1565 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1566 = func.call @stack_pop_pointer() : () -> i64
        %1567 = func.call @cc_nil_value() : () -> i64
        %1568 = func.call @cc_maybe_error_from_multiple_value_list(%1565) : (i64) -> i64
        %1569 = func.call @cc_errorp(%1568) : (i64) -> i64
        %1570 = arith.cmpi ne, %1569, %1567 : i64
        %1571 = arith.cmpi eq, %1567, %1567 : i64
        %1572 = arith.andi %1570, %1571 : i1
        %1573 = scf.if %1572 -> (i64) {
          scf.yield %1568 : i64
        } else {
          scf.yield %1567 : i64
        }
        %1574 = arith.cmpi ne, %1573, %1567 : i64
        scf.if %1574 {
          func.call @stack_push_pointer(%1573) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1575 = func.call @stack_pop_pointer() : () -> i64
          %1576 = func.call @cc_cons(%1566, %1575) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
          %1577 = arith.addi %1576, %__rlasp_stack_elide_zero_285 : i64
          %1578 = func.call @cc_cons(%1565, %1577) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
          %1579 = arith.addi %1578, %__rlasp_stack_elide_zero_286 : i64
          %1580 = func.call @cc_values_pack(%1579) : (i64) -> i64
          func.call @stack_push_pointer(%1580) : (i64) -> ()
        }
        %1581 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1581 : i64
      }
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %1582 = arith.addi %1547, %__rlasp_stack_elide_zero_287 : i64
      %1583 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1584 = func.call @cc_errorp(%1582) : (i64) -> i64
      %1585 = func.call @cc_nil_value() : () -> i64
      %1586 = arith.cmpi ne, %1584, %1585 : i64
      scf.if %1586 {
        %1587 = func.call @cc_condition_value(%1582) : (i64) -> i64
        %1588 = func.call @cc_values2(%1585, %1587) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1588) : (i64) -> ()
      } else {
        %1589 = func.call @cc_multiple_value_list(%1582) : (i64) -> i64
        %1590 = func.call @cc_values_pack(%1589) : (i64) -> i64
        func.call @stack_push_pointer(%1590) : (i64) -> ()
      }
      %1591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1591 : i64
    }
    func.call @stack_push_pointer(%1541) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455813"() {
    %1774 = func.call @cc_nil_value() : () -> i64
    %1775 = func.call @cc_nil_value() : () -> i64
    %1776 = func.call @cc_errorp(%1774) : (i64) -> i64
    %1777 = arith.cmpi ne, %1776, %1775 : i64
    %1778 = scf.if %1777 -> (i64) {
      scf.yield %1774 : i64
    } else {
      %1779 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1780 = func.call @cc_nil_value() : () -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_errorp(%1780) : (i64) -> i64
      %1783 = arith.cmpi ne, %1782, %1781 : i64
      %1784 = scf.if %1783 -> (i64) {
        scf.yield %1780 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1785 = arith.constant 3.0 : f64
        %1786 = func.call @cc_box_float(%1785) : (f64) -> i64
        %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
        %1787 = arith.addi %1786, %__rlasp_stack_elide_zero_288 : i64
        %1788 = func.call @cc_nil_value() : () -> i64
        %1789 = func.call @cc_errorp(%1787) : (i64) -> i64
        %1790 = arith.cmpi ne, %1789, %1788 : i64
        %1791 = arith.cmpi eq, %1788, %1788 : i64
        %1792 = arith.andi %1790, %1791 : i1
        %1793 = scf.if %1792 -> (i64) {
          scf.yield %1787 : i64
        } else {
          scf.yield %1788 : i64
        }
        %1794 = arith.cmpi ne, %1793, %1788 : i64
        scf.if %1794 {
          func.call @stack_push_pointer(%1793) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1787) : (i64) -> ()
          %1795 = llvm.mlir.addressof @str127 : !llvm.ptr
          %1796 = func.call @cc_make_function_ref_const(%1795) : (!llvm.ptr) -> i64
          %1797 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1796, %1797) : (i64, i64) -> ()
        }
        %1798 = func.call @stack_pop_pointer() : () -> i64
        %1799 = func.call @cc_errorp(%1798) : (i64) -> i64
        %1800 = func.call @cc_nil_value() : () -> i64
        %1801 = arith.cmpi ne, %1799, %1800 : i64
        scf.if %1801 {
          func.call @stack_push_pointer(%1798) : (i64) -> ()
        } else {
          %1802 = func.call @cc_multiple_value_list(%1798) : (i64) -> i64
          func.call @stack_push_pointer(%1802) : (i64) -> ()
        }
        %1803 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1804 = func.call @stack_pop_pointer() : () -> i64
        %1805 = func.call @cc_nil_value() : () -> i64
        %1806 = func.call @cc_maybe_error_from_multiple_value_list(%1803) : (i64) -> i64
        %1807 = func.call @cc_errorp(%1806) : (i64) -> i64
        %1808 = arith.cmpi ne, %1807, %1805 : i64
        %1809 = arith.cmpi eq, %1805, %1805 : i64
        %1810 = arith.andi %1808, %1809 : i1
        %1811 = scf.if %1810 -> (i64) {
          scf.yield %1806 : i64
        } else {
          scf.yield %1805 : i64
        }
        %1812 = arith.cmpi ne, %1811, %1805 : i64
        scf.if %1812 {
          func.call @stack_push_pointer(%1811) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1813 = func.call @stack_pop_pointer() : () -> i64
          %1814 = func.call @cc_cons(%1804, %1813) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
          %1815 = arith.addi %1814, %__rlasp_stack_elide_zero_289 : i64
          %1816 = func.call @cc_cons(%1803, %1815) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
          %1817 = arith.addi %1816, %__rlasp_stack_elide_zero_290 : i64
          %1818 = func.call @cc_values_pack(%1817) : (i64) -> i64
          func.call @stack_push_pointer(%1818) : (i64) -> ()
        }
        %1819 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1819 : i64
      }
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %1820 = arith.addi %1784, %__rlasp_stack_elide_zero_291 : i64
      %1821 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1822 = func.call @cc_errorp(%1820) : (i64) -> i64
      %1823 = func.call @cc_nil_value() : () -> i64
      %1824 = arith.cmpi ne, %1822, %1823 : i64
      scf.if %1824 {
        %1825 = func.call @cc_condition_value(%1820) : (i64) -> i64
        %1826 = func.call @cc_values2(%1823, %1825) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1826) : (i64) -> ()
      } else {
        %1827 = func.call @cc_multiple_value_list(%1820) : (i64) -> i64
        %1828 = func.call @cc_values_pack(%1827) : (i64) -> i64
        func.call @stack_push_pointer(%1828) : (i64) -> ()
      }
      %1829 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1829 : i64
    }
    func.call @stack_push_pointer(%1778) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455814"() {
    %2036 = func.call @cc_nil_value() : () -> i64
    %2037 = func.call @cc_nil_value() : () -> i64
    %2038 = func.call @cc_errorp(%2036) : (i64) -> i64
    %2039 = arith.cmpi ne, %2038, %2037 : i64
    %2040 = scf.if %2039 -> (i64) {
      scf.yield %2036 : i64
    } else {
      %2041 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2042 = func.call @cc_nil_value() : () -> i64
      %2043 = func.call @cc_nil_value() : () -> i64
      %2044 = func.call @cc_errorp(%2042) : (i64) -> i64
      %2045 = arith.cmpi ne, %2044, %2043 : i64
      %2046 = scf.if %2045 -> (i64) {
        scf.yield %2042 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2047 = llvm.mlir.addressof @str147 : !llvm.ptr
        %2048 = arith.constant 20 : i64
        %2049 = func.call @cc_make_string(%2047, %2048) : (!llvm.ptr, i64) -> i64
        %2050 = llvm.mlir.addressof @str148 : !llvm.ptr
        %2051 = arith.constant 11 : i64
        %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
        %2053 = func.call @cc_intern(%2049, %2052) : (i64, i64) -> i64
        %2054 = func.call @cc_nil_value() : () -> i64
        %2055 = func.call @cc_cons(%2053, %2054) : (i64, i64) -> i64
        %2056 = func.call @cc_values_pack(%2055) : (i64) -> i64
        %2057 = func.call @cc_symbol_value(%2053) : (i64) -> i64
        %2058 = arith.constant 1 : i64
        %2059 = func.call @cc_box_fixnum(%2058) : (i64) -> i64
        %2061 = arith.constant 3 : i64
        %2060 = arith.andi %2057, %2061 : i64
        %2062 = arith.constant 0 : i64
        %2063 = arith.cmpi eq, %2060, %2062 : i64
        %2065 = arith.constant 3 : i64
        %2064 = arith.andi %2059, %2065 : i64
        %2066 = arith.constant 0 : i64
        %2067 = arith.cmpi eq, %2064, %2066 : i64
        %2068 = arith.andi %2063, %2067 : i1
        %2069 = scf.if %2068 -> (i64) {
          %2070 = arith.constant 2 : i64
          %2071 = arith.shrsi %2057, %2070 : i64
          %2072 = arith.constant 2 : i64
          %2073 = arith.shrsi %2059, %2072 : i64
          %2074 = arith.addi %2071, %2073 : i64
          %2075 = arith.constant -2305843009213693952 : i64
          %2076 = arith.constant 2305843009213693951 : i64
          %2077 = arith.cmpi sge, %2074, %2075 : i64
          %2078 = arith.cmpi sle, %2074, %2076 : i64
          %2079 = arith.andi %2077, %2078 : i1
          %2080 = scf.if %2079 -> (i64) {
            %2081 = arith.constant 2 : i64
            %2082 = arith.shli %2074, %2081 : i64
            scf.yield %2082 : i64
          } else {
            %2083 = func.call @cc_add(%2057, %2059) : (i64, i64) -> i64
            scf.yield %2083 : i64
          }
          scf.yield %2080 : i64
        } else {
          %2084 = func.call @cc_add(%2057, %2059) : (i64, i64) -> i64
          scf.yield %2084 : i64
        }
        %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
        %2085 = arith.addi %2069, %__rlasp_stack_elide_zero_292 : i64
        %2086 = func.call @cc_nil_value() : () -> i64
        %2087 = func.call @cc_errorp(%2085) : (i64) -> i64
        %2088 = arith.cmpi ne, %2087, %2086 : i64
        %2089 = arith.cmpi eq, %2086, %2086 : i64
        %2090 = arith.andi %2088, %2089 : i1
        %2091 = scf.if %2090 -> (i64) {
          scf.yield %2085 : i64
        } else {
          scf.yield %2086 : i64
        }
        %2092 = arith.cmpi ne, %2091, %2086 : i64
        scf.if %2092 {
          func.call @stack_push_pointer(%2091) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2085) : (i64) -> ()
          %2093 = llvm.mlir.addressof @str149 : !llvm.ptr
          %2094 = func.call @cc_make_function_ref_const(%2093) : (!llvm.ptr) -> i64
          %2095 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2094, %2095) : (i64, i64) -> ()
        }
        %2096 = func.call @stack_pop_pointer() : () -> i64
        %2097 = func.call @cc_errorp(%2096) : (i64) -> i64
        %2098 = func.call @cc_nil_value() : () -> i64
        %2099 = arith.cmpi ne, %2097, %2098 : i64
        scf.if %2099 {
          func.call @stack_push_pointer(%2096) : (i64) -> ()
        } else {
          %2100 = func.call @cc_multiple_value_list(%2096) : (i64) -> i64
          func.call @stack_push_pointer(%2100) : (i64) -> ()
        }
        %2101 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2102 = func.call @stack_pop_pointer() : () -> i64
        %2103 = func.call @cc_nil_value() : () -> i64
        %2104 = func.call @cc_maybe_error_from_multiple_value_list(%2101) : (i64) -> i64
        %2105 = func.call @cc_errorp(%2104) : (i64) -> i64
        %2106 = arith.cmpi ne, %2105, %2103 : i64
        %2107 = arith.cmpi eq, %2103, %2103 : i64
        %2108 = arith.andi %2106, %2107 : i1
        %2109 = scf.if %2108 -> (i64) {
          scf.yield %2104 : i64
        } else {
          scf.yield %2103 : i64
        }
        %2110 = arith.cmpi ne, %2109, %2103 : i64
        scf.if %2110 {
          func.call @stack_push_pointer(%2109) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2111 = func.call @stack_pop_pointer() : () -> i64
          %2112 = func.call @cc_cons(%2102, %2111) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
          %2113 = arith.addi %2112, %__rlasp_stack_elide_zero_293 : i64
          %2114 = func.call @cc_cons(%2101, %2113) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
          %2115 = arith.addi %2114, %__rlasp_stack_elide_zero_294 : i64
          %2116 = func.call @cc_values_pack(%2115) : (i64) -> i64
          func.call @stack_push_pointer(%2116) : (i64) -> ()
        }
        %2117 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2117 : i64
      }
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %2118 = arith.addi %2046, %__rlasp_stack_elide_zero_295 : i64
      %2119 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2120 = func.call @cc_errorp(%2118) : (i64) -> i64
      %2121 = func.call @cc_nil_value() : () -> i64
      %2122 = arith.cmpi ne, %2120, %2121 : i64
      scf.if %2122 {
        %2123 = func.call @cc_condition_value(%2118) : (i64) -> i64
        %2124 = func.call @cc_values2(%2121, %2123) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2124) : (i64) -> ()
      } else {
        %2125 = func.call @cc_multiple_value_list(%2118) : (i64) -> i64
        %2126 = func.call @cc_values_pack(%2125) : (i64) -> i64
        func.call @stack_push_pointer(%2126) : (i64) -> ()
      }
      %2127 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2127 : i64
    }
    func.call @stack_push_pointer(%2040) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455815"() {
    %2334 = func.call @cc_nil_value() : () -> i64
    %2335 = func.call @cc_nil_value() : () -> i64
    %2336 = func.call @cc_errorp(%2334) : (i64) -> i64
    %2337 = arith.cmpi ne, %2336, %2335 : i64
    %2338 = scf.if %2337 -> (i64) {
      scf.yield %2334 : i64
    } else {
      %2339 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2340 = func.call @cc_nil_value() : () -> i64
      %2341 = func.call @cc_nil_value() : () -> i64
      %2342 = func.call @cc_errorp(%2340) : (i64) -> i64
      %2343 = arith.cmpi ne, %2342, %2341 : i64
      %2344 = scf.if %2343 -> (i64) {
        scf.yield %2340 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2345 = llvm.mlir.addressof @str169 : !llvm.ptr
        %2346 = arith.constant 20 : i64
        %2347 = func.call @cc_make_string(%2345, %2346) : (!llvm.ptr, i64) -> i64
        %2348 = llvm.mlir.addressof @str170 : !llvm.ptr
        %2349 = arith.constant 11 : i64
        %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
        %2351 = func.call @cc_intern(%2347, %2350) : (i64, i64) -> i64
        %2352 = func.call @cc_nil_value() : () -> i64
        %2353 = func.call @cc_cons(%2351, %2352) : (i64, i64) -> i64
        %2354 = func.call @cc_values_pack(%2353) : (i64) -> i64
        %2355 = func.call @cc_symbol_value(%2351) : (i64) -> i64
        %2356 = arith.constant 1 : i64
        %2357 = func.call @cc_box_fixnum(%2356) : (i64) -> i64
        %2359 = arith.constant 3 : i64
        %2358 = arith.andi %2355, %2359 : i64
        %2360 = arith.constant 0 : i64
        %2361 = arith.cmpi eq, %2358, %2360 : i64
        %2363 = arith.constant 3 : i64
        %2362 = arith.andi %2357, %2363 : i64
        %2364 = arith.constant 0 : i64
        %2365 = arith.cmpi eq, %2362, %2364 : i64
        %2366 = arith.andi %2361, %2365 : i1
        %2367 = scf.if %2366 -> (i64) {
          %2368 = arith.constant 2 : i64
          %2369 = arith.shrsi %2355, %2368 : i64
          %2370 = arith.constant 2 : i64
          %2371 = arith.shrsi %2357, %2370 : i64
          %2372 = arith.subi %2369, %2371 : i64
          %2373 = arith.constant -2305843009213693952 : i64
          %2374 = arith.constant 2305843009213693951 : i64
          %2375 = arith.cmpi sge, %2372, %2373 : i64
          %2376 = arith.cmpi sle, %2372, %2374 : i64
          %2377 = arith.andi %2375, %2376 : i1
          %2378 = scf.if %2377 -> (i64) {
            %2379 = arith.constant 2 : i64
            %2380 = arith.shli %2372, %2379 : i64
            scf.yield %2380 : i64
          } else {
            %2381 = func.call @cc_sub(%2355, %2357) : (i64, i64) -> i64
            scf.yield %2381 : i64
          }
          scf.yield %2378 : i64
        } else {
          %2382 = func.call @cc_sub(%2355, %2357) : (i64, i64) -> i64
          scf.yield %2382 : i64
        }
        %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
        %2383 = arith.addi %2367, %__rlasp_stack_elide_zero_296 : i64
        %2384 = func.call @cc_nil_value() : () -> i64
        %2385 = func.call @cc_errorp(%2383) : (i64) -> i64
        %2386 = arith.cmpi ne, %2385, %2384 : i64
        %2387 = arith.cmpi eq, %2384, %2384 : i64
        %2388 = arith.andi %2386, %2387 : i1
        %2389 = scf.if %2388 -> (i64) {
          scf.yield %2383 : i64
        } else {
          scf.yield %2384 : i64
        }
        %2390 = arith.cmpi ne, %2389, %2384 : i64
        scf.if %2390 {
          func.call @stack_push_pointer(%2389) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2383) : (i64) -> ()
          %2391 = llvm.mlir.addressof @str171 : !llvm.ptr
          %2392 = func.call @cc_make_function_ref_const(%2391) : (!llvm.ptr) -> i64
          %2393 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2392, %2393) : (i64, i64) -> ()
        }
        %2394 = func.call @stack_pop_pointer() : () -> i64
        %2395 = func.call @cc_errorp(%2394) : (i64) -> i64
        %2396 = func.call @cc_nil_value() : () -> i64
        %2397 = arith.cmpi ne, %2395, %2396 : i64
        scf.if %2397 {
          func.call @stack_push_pointer(%2394) : (i64) -> ()
        } else {
          %2398 = func.call @cc_multiple_value_list(%2394) : (i64) -> i64
          func.call @stack_push_pointer(%2398) : (i64) -> ()
        }
        %2399 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2400 = func.call @stack_pop_pointer() : () -> i64
        %2401 = func.call @cc_nil_value() : () -> i64
        %2402 = func.call @cc_maybe_error_from_multiple_value_list(%2399) : (i64) -> i64
        %2403 = func.call @cc_errorp(%2402) : (i64) -> i64
        %2404 = arith.cmpi ne, %2403, %2401 : i64
        %2405 = arith.cmpi eq, %2401, %2401 : i64
        %2406 = arith.andi %2404, %2405 : i1
        %2407 = scf.if %2406 -> (i64) {
          scf.yield %2402 : i64
        } else {
          scf.yield %2401 : i64
        }
        %2408 = arith.cmpi ne, %2407, %2401 : i64
        scf.if %2408 {
          func.call @stack_push_pointer(%2407) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2409 = func.call @stack_pop_pointer() : () -> i64
          %2410 = func.call @cc_cons(%2400, %2409) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
          %2411 = arith.addi %2410, %__rlasp_stack_elide_zero_297 : i64
          %2412 = func.call @cc_cons(%2399, %2411) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
          %2413 = arith.addi %2412, %__rlasp_stack_elide_zero_298 : i64
          %2414 = func.call @cc_values_pack(%2413) : (i64) -> i64
          func.call @stack_push_pointer(%2414) : (i64) -> ()
        }
        %2415 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2415 : i64
      }
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %2416 = arith.addi %2344, %__rlasp_stack_elide_zero_299 : i64
      %2417 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2418 = func.call @cc_errorp(%2416) : (i64) -> i64
      %2419 = func.call @cc_nil_value() : () -> i64
      %2420 = arith.cmpi ne, %2418, %2419 : i64
      scf.if %2420 {
        %2421 = func.call @cc_condition_value(%2416) : (i64) -> i64
        %2422 = func.call @cc_values2(%2419, %2421) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2422) : (i64) -> ()
      } else {
        %2423 = func.call @cc_multiple_value_list(%2416) : (i64) -> i64
        %2424 = func.call @cc_values_pack(%2423) : (i64) -> i64
        func.call @stack_push_pointer(%2424) : (i64) -> ()
      }
      %2425 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2425 : i64
    }
    func.call @stack_push_pointer(%2338) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455816"() {
    %3238 = func.call @cc_nil_value() : () -> i64
    %3239 = func.call @cc_nil_value() : () -> i64
    %3240 = func.call @cc_errorp(%3238) : (i64) -> i64
    %3241 = arith.cmpi ne, %3240, %3239 : i64
    %3242 = scf.if %3241 -> (i64) {
      scf.yield %3238 : i64
    } else {
      %3243 = func.call @cc_nil_value() : () -> i64
      %3244 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3245 = arith.constant 26 : i64
      %3246 = func.call @cc_make_string(%3244, %3245) : (!llvm.ptr, i64) -> i64
      %3247 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3248 = arith.constant 11 : i64
      %3249 = func.call @cc_make_string(%3247, %3248) : (!llvm.ptr, i64) -> i64
      %3250 = func.call @cc_intern(%3246, %3249) : (i64, i64) -> i64
      %3251 = func.call @cc_nil_value() : () -> i64
      %3252 = func.call @cc_cons(%3250, %3251) : (i64, i64) -> i64
      %3253 = func.call @cc_values_pack(%3252) : (i64) -> i64
      %3254 = func.call @cc_symbol_value(%3250) : (i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %3255 = arith.addi %3254, %__rlasp_stack_elide_zero_300 : i64
      %3256 = arith.constant -3.0 : f64
      %3257 = func.call @cc_box_float(%3256) : (f64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %3258 = arith.addi %3257, %__rlasp_stack_elide_zero_301 : i64
      %3259 = arith.constant 0.0 : f64
      %3260 = func.call @cc_box_float(%3259) : (f64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %3261 = arith.addi %3260, %__rlasp_stack_elide_zero_302 : i64
      %3262 = arith.constant 3.0 : f64
      %3263 = func.call @cc_box_float(%3262) : (f64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %3264 = arith.addi %3263, %__rlasp_stack_elide_zero_303 : i64
      %3265 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3266 = arith.constant 26 : i64
      %3267 = func.call @cc_make_string(%3265, %3266) : (!llvm.ptr, i64) -> i64
      %3268 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3269 = arith.constant 11 : i64
      %3270 = func.call @cc_make_string(%3268, %3269) : (!llvm.ptr, i64) -> i64
      %3271 = func.call @cc_intern(%3267, %3270) : (i64, i64) -> i64
      %3272 = func.call @cc_nil_value() : () -> i64
      %3273 = func.call @cc_cons(%3271, %3272) : (i64, i64) -> i64
      %3274 = func.call @cc_values_pack(%3273) : (i64) -> i64
      %3275 = func.call @cc_symbol_value(%3271) : (i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %3276 = arith.addi %3275, %__rlasp_stack_elide_zero_304 : i64
      %3277 = func.call @cc_nil_value() : () -> i64
      %3278 = func.call @cc_errorp(%3255) : (i64) -> i64
      %3279 = arith.cmpi ne, %3278, %3277 : i64
      %3280 = arith.cmpi eq, %3277, %3277 : i64
      %3281 = arith.andi %3279, %3280 : i1
      %3282 = scf.if %3281 -> (i64) {
        scf.yield %3255 : i64
      } else {
        scf.yield %3277 : i64
      }
      %3283 = func.call @cc_errorp(%3258) : (i64) -> i64
      %3284 = arith.cmpi ne, %3283, %3277 : i64
      %3285 = arith.cmpi eq, %3282, %3277 : i64
      %3286 = arith.andi %3284, %3285 : i1
      %3287 = scf.if %3286 -> (i64) {
        scf.yield %3258 : i64
      } else {
        scf.yield %3282 : i64
      }
      %3288 = func.call @cc_errorp(%3261) : (i64) -> i64
      %3289 = arith.cmpi ne, %3288, %3277 : i64
      %3290 = arith.cmpi eq, %3287, %3277 : i64
      %3291 = arith.andi %3289, %3290 : i1
      %3292 = scf.if %3291 -> (i64) {
        scf.yield %3261 : i64
      } else {
        scf.yield %3287 : i64
      }
      %3293 = func.call @cc_errorp(%3264) : (i64) -> i64
      %3294 = arith.cmpi ne, %3293, %3277 : i64
      %3295 = arith.cmpi eq, %3292, %3277 : i64
      %3296 = arith.andi %3294, %3295 : i1
      %3297 = scf.if %3296 -> (i64) {
        scf.yield %3264 : i64
      } else {
        scf.yield %3292 : i64
      }
      %3298 = func.call @cc_errorp(%3276) : (i64) -> i64
      %3299 = arith.cmpi ne, %3298, %3277 : i64
      %3300 = arith.cmpi eq, %3297, %3277 : i64
      %3301 = arith.andi %3299, %3300 : i1
      %3302 = scf.if %3301 -> (i64) {
        scf.yield %3276 : i64
      } else {
        scf.yield %3297 : i64
      }
      %3303 = arith.cmpi ne, %3302, %3277 : i64
      scf.if %3303 {
        func.call @stack_push_pointer(%3302) : (i64) -> ()
      } else {
        %3304 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3304) : (i64) -> ()
        %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
        %3305 = arith.addi %3276, %__rlasp_stack_elide_zero_305 : i64
        %3306 = func.call @stack_pop_pointer() : () -> i64
        %3307 = func.call @cc_cons(%3305, %3306) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3307) : (i64) -> ()
        %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
        %3308 = arith.addi %3264, %__rlasp_stack_elide_zero_306 : i64
        %3309 = func.call @stack_pop_pointer() : () -> i64
        %3310 = func.call @cc_cons(%3308, %3309) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3310) : (i64) -> ()
        %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
        %3311 = arith.addi %3261, %__rlasp_stack_elide_zero_307 : i64
        %3312 = func.call @stack_pop_pointer() : () -> i64
        %3313 = func.call @cc_cons(%3311, %3312) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3313) : (i64) -> ()
        %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
        %3314 = arith.addi %3258, %__rlasp_stack_elide_zero_308 : i64
        %3315 = func.call @stack_pop_pointer() : () -> i64
        %3316 = func.call @cc_cons(%3314, %3315) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3316) : (i64) -> ()
        %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
        %3317 = arith.addi %3255, %__rlasp_stack_elide_zero_309 : i64
        %3318 = func.call @stack_pop_pointer() : () -> i64
        %3319 = func.call @cc_cons(%3317, %3318) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3319) : (i64) -> ()
      }
      %3320 = func.call @stack_pop_pointer() : () -> i64
      %3321 = func.call @cc_nil_value() : () -> i64
      %3322 = func.call @cc_nil_value() : () -> i64
      %3323 = func.call @cc_nil_value() : () -> i64
      %3324 = func.call @cc_nil_value() : () -> i64
      %3325 = func.call @cc_errorp(%3323) : (i64) -> i64
      %3326 = arith.cmpi ne, %3325, %3324 : i64
      %3327:5 = scf.if %3326 -> (i64, i64, i64, i64, i64) {
        scf.yield %3323, %3320, %3322, %3243, %3321 : i64, i64, i64, i64, i64
      } else {
        %3328 = func.call @cc_nil_value() : () -> i64
        %3329 = llvm.mlir.addressof @str242 : !llvm.ptr
        %3330 = arith.constant 38 : i64
        %3331 = func.call @cc_make_string(%3329, %3330) : (!llvm.ptr, i64) -> i64
        %3332 = func.call @cc_nil_value() : () -> i64
        %3333 = func.call @cc_intern(%3331, %3332) : (i64, i64) -> i64
        %3334 = func.call @cc_nil_value() : () -> i64
        %3335 = func.call @cc_cons(%3333, %3334) : (i64, i64) -> i64
        %3336 = func.call @cc_values_pack(%3335) : (i64) -> i64
        %3337 = func.call @cc_set_symbol_value(%3333, %3328) : (i64, i64) -> i64
        %3338 = llvm.mlir.addressof @str243 : !llvm.ptr
        %3339 = arith.constant 39 : i64
        %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
        %3341 = func.call @cc_nil_value() : () -> i64
        %3342 = func.call @cc_intern(%3340, %3341) : (i64, i64) -> i64
        %3343 = func.call @cc_nil_value() : () -> i64
        %3344 = func.call @cc_cons(%3342, %3343) : (i64, i64) -> i64
        %3345 = func.call @cc_values_pack(%3344) : (i64) -> i64
        %3346 = func.call @cc_set_symbol_value(%3342, %3328) : (i64, i64) -> i64
        %3347 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3348 = arith.constant 40 : i64
        %3349 = func.call @cc_make_string(%3347, %3348) : (!llvm.ptr, i64) -> i64
        %3350 = func.call @cc_nil_value() : () -> i64
        %3351 = func.call @cc_intern(%3349, %3350) : (i64, i64) -> i64
        %3352 = func.call @cc_nil_value() : () -> i64
        %3353 = func.call @cc_cons(%3351, %3352) : (i64, i64) -> i64
        %3354 = func.call @cc_values_pack(%3353) : (i64) -> i64
        %3355 = func.call @cc_set_symbol_value(%3351, %3328) : (i64, i64) -> i64
        %3356:4 = scf.while (%arg0 = %3243, %arg1 = %3321, %arg2 = %3322, %arg3 = %3320) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
          %3357 = arith.addi %arg3, %__rlasp_stack_elide_zero_310 : i64
          %3358 = func.call @cc_nil_value() : () -> i64
          %3359 = arith.cmpi ne, %3357, %3358 : i64
          %3360 = func.call @cc_nil_value() : () -> i64
          %3361 = llvm.mlir.addressof @str245 : !llvm.ptr
          %3362 = arith.constant 38 : i64
          %3363 = func.call @cc_make_string(%3361, %3362) : (!llvm.ptr, i64) -> i64
          %3364 = func.call @cc_nil_value() : () -> i64
          %3365 = func.call @cc_intern(%3363, %3364) : (i64, i64) -> i64
          %3366 = func.call @cc_nil_value() : () -> i64
          %3367 = func.call @cc_cons(%3365, %3366) : (i64, i64) -> i64
          %3368 = func.call @cc_values_pack(%3367) : (i64) -> i64
          %3369 = func.call @cc_symbol_value(%3365) : (i64) -> i64
          %3370 = arith.cmpi ne, %3369, %3360 : i64
          %3371 = llvm.mlir.addressof @str246 : !llvm.ptr
          %3372 = arith.constant 38 : i64
          %3373 = func.call @cc_make_string(%3371, %3372) : (!llvm.ptr, i64) -> i64
          %3374 = func.call @cc_nil_value() : () -> i64
          %3375 = func.call @cc_intern(%3373, %3374) : (i64, i64) -> i64
          %3376 = func.call @cc_nil_value() : () -> i64
          %3377 = func.call @cc_cons(%3375, %3376) : (i64, i64) -> i64
          %3378 = func.call @cc_values_pack(%3377) : (i64) -> i64
          %3379 = func.call @cc_symbol_value(%3375) : (i64) -> i64
          %3380 = arith.cmpi ne, %3379, %3360 : i64
          %3381 = arith.ori %3370, %3380 : i1
          %3382 = arith.constant 0 : i1
          %3383 = arith.cmpi eq, %3381, %3382 : i1
          %3384 = arith.andi %3359, %3383 : i1
          scf.condition(%3384) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
        } do {
          ^bb0(%3385: i64, %3386: i64, %3387: i64, %3388: i64):
          %3389 = func.call @cc_nil_value() : () -> i64
          %3390 = func.call @cc_nil_value() : () -> i64
          %3391 = func.call @cc_errorp(%3389) : (i64) -> i64
          %3392 = arith.cmpi ne, %3391, %3390 : i64
          %3393:4 = scf.if %3392 -> (i64, i64, i64, i64) {
            scf.yield %3389, %3387, %3385, %3386 : i64, i64, i64, i64
          } else {
            %3394 = func.call @cc_nil_value() : () -> i64
            %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
            %3395 = arith.addi %3388, %__rlasp_stack_elide_zero_311 : i64
            %3396 = func.call @cc_nil_value() : () -> i64
            %3397 = arith.cmpi eq, %3395, %3396 : i64
            %3399 = func.call @cc_t_value() : () -> i64
            %3398 = arith.select %3397, %3399, %3396 : i64
            %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
            %3400 = arith.addi %3398, %__rlasp_stack_elide_zero_312 : i64
            %3401 = func.call @cc_nil_value() : () -> i64
            %3402 = func.call @cc_cons(%3400, %3401) : (i64, i64) -> i64
            %3403 = func.call @cc_not(%3402) : (i64) -> i64
            %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
            %3404 = arith.addi %3403, %__rlasp_stack_elide_zero_313 : i64
            %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
            %3405 = arith.addi %3388, %__rlasp_stack_elide_zero_314 : i64
            %3406 = func.call @cc_is_cons(%3405) : (i64) -> i32
            %3407 = arith.constant 0 : i32
            %3408 = arith.cmpi ne, %3406, %3407 : i32
            %3409 = func.call @cc_t_value() : () -> i64
            %3410 = func.call @cc_nil_value() : () -> i64
            %3411 = arith.select %3408, %3409, %3410 : i64
            %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
            %3412 = arith.addi %3411, %__rlasp_stack_elide_zero_315 : i64
            %3413 = func.call @cc_nil_value() : () -> i64
            %3414 = func.call @cc_cons(%3412, %3413) : (i64, i64) -> i64
            %3415 = func.call @cc_not(%3414) : (i64) -> i64
            %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
            %3416 = arith.addi %3415, %__rlasp_stack_elide_zero_316 : i64
            %3417 = func.call @cc_cons(%3416, %3394) : (i64, i64) -> i64
            %3418 = func.call @cc_cons(%3404, %3417) : (i64, i64) -> i64
            %3419 = func.call @cc_and(%3418) : (i64) -> i64
            %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
            %3420 = arith.addi %3419, %__rlasp_stack_elide_zero_317 : i64
            %3421 = func.call @cc_nil_value() : () -> i64
            %3422 = arith.cmpi ne, %3420, %3421 : i64
            scf.if %3422 {
              %3423 = llvm.mlir.addressof @str247 : !llvm.ptr
              %3424 = arith.constant 10 : i64
              %3425 = func.call @cc_make_string(%3423, %3424) : (!llvm.ptr, i64) -> i64
              %3426 = func.call @cc_nil_value() : () -> i64
              %3427 = func.call @cc_intern(%3425, %3426) : (i64, i64) -> i64
              %3428 = func.call @cc_nil_value() : () -> i64
              %3429 = func.call @cc_cons(%3427, %3428) : (i64, i64) -> i64
              %3430 = func.call @cc_values_pack(%3429) : (i64) -> i64
              %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
              %3431 = arith.addi %3427, %__rlasp_stack_elide_zero_318 : i64
              %3432 = func.call @cc_nil_value() : () -> i64
              %3433 = func.call @cc_errorp(%3431) : (i64) -> i64
              %3434 = arith.cmpi ne, %3433, %3432 : i64
              %3435 = arith.cmpi eq, %3432, %3432 : i64
              %3436 = arith.andi %3434, %3435 : i1
              %3437 = scf.if %3436 -> (i64) {
                scf.yield %3431 : i64
              } else {
                scf.yield %3432 : i64
              }
              %3438 = arith.cmpi ne, %3437, %3432 : i64
              scf.if %3438 {
                func.call @stack_push_pointer(%3437) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%3431) : (i64) -> ()
                %3439 = llvm.mlir.addressof @str248 : !llvm.ptr
                %3440 = func.call @cc_make_function_ref_const(%3439) : (!llvm.ptr) -> i64
                %3441 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%3440, %3441) : (i64, i64) -> ()
              }
              %3442 = func.call @stack_pop_pointer() : () -> i64
              %3443 = func.call @cc_multiple_value_list(%3442) : (i64) -> i64
              %3444 = func.call @cc_t_value() : () -> i64
              %3445 = llvm.mlir.addressof @str249 : !llvm.ptr
              %3446 = arith.constant 38 : i64
              %3447 = func.call @cc_make_string(%3445, %3446) : (!llvm.ptr, i64) -> i64
              %3448 = func.call @cc_nil_value() : () -> i64
              %3449 = func.call @cc_intern(%3447, %3448) : (i64, i64) -> i64
              %3450 = func.call @cc_nil_value() : () -> i64
              %3451 = func.call @cc_cons(%3449, %3450) : (i64, i64) -> i64
              %3452 = func.call @cc_values_pack(%3451) : (i64) -> i64
              %3453 = func.call @cc_set_symbol_value(%3449, %3444) : (i64, i64) -> i64
              %3454 = llvm.mlir.addressof @str250 : !llvm.ptr
              %3455 = arith.constant 39 : i64
              %3456 = func.call @cc_make_string(%3454, %3455) : (!llvm.ptr, i64) -> i64
              %3457 = func.call @cc_nil_value() : () -> i64
              %3458 = func.call @cc_intern(%3456, %3457) : (i64, i64) -> i64
              %3459 = func.call @cc_nil_value() : () -> i64
              %3460 = func.call @cc_cons(%3458, %3459) : (i64, i64) -> i64
              %3461 = func.call @cc_values_pack(%3460) : (i64) -> i64
              %3462 = func.call @cc_set_symbol_value(%3458, %3442) : (i64, i64) -> i64
              %3463 = llvm.mlir.addressof @str251 : !llvm.ptr
              %3464 = arith.constant 40 : i64
              %3465 = func.call @cc_make_string(%3463, %3464) : (!llvm.ptr, i64) -> i64
              %3466 = func.call @cc_nil_value() : () -> i64
              %3467 = func.call @cc_intern(%3465, %3466) : (i64, i64) -> i64
              %3468 = func.call @cc_nil_value() : () -> i64
              %3469 = func.call @cc_cons(%3467, %3468) : (i64, i64) -> i64
              %3470 = func.call @cc_values_pack(%3469) : (i64) -> i64
              %3471 = func.call @cc_set_symbol_value(%3467, %3443) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3442) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %3472 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3472, %3387, %3385, %3386 : i64, i64, i64, i64
          }
          %3473 = func.call @cc_nil_value() : () -> i64
          %3474 = func.call @cc_errorp(%3393#0) : (i64) -> i64
          %3475 = arith.cmpi ne, %3474, %3473 : i64
          %3476:4 = scf.if %3475 -> (i64, i64, i64, i64) {
            scf.yield %3393#0, %3393#1, %3393#2, %3393#3 : i64, i64, i64, i64
          } else {
            %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
            %3477 = arith.addi %3388, %__rlasp_stack_elide_zero_319 : i64
            %3478 = func.call @cc_car(%3477) : (i64) -> i64
            %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
            %3479 = arith.addi %3478, %__rlasp_stack_elide_zero_320 : i64
            %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
            %3480 = arith.addi %3479, %__rlasp_stack_elide_zero_321 : i64
            scf.yield %3480, %3393#1, %3479, %3393#3 : i64, i64, i64, i64
          }
          %3481 = func.call @cc_nil_value() : () -> i64
          %3482 = func.call @cc_errorp(%3476#0) : (i64) -> i64
          %3483 = arith.cmpi ne, %3482, %3481 : i64
          %3484:4 = scf.if %3483 -> (i64, i64, i64, i64) {
            scf.yield %3476#0, %3476#1, %3476#2, %3476#3 : i64, i64, i64, i64
          } else {
            %3485 = func.call @cc_nil_value() : () -> i64
            %3486 = func.call @cc_errorp(%3476#2) : (i64) -> i64
            %3487 = arith.cmpi ne, %3486, %3485 : i64
            %3488 = arith.cmpi eq, %3485, %3485 : i64
            %3489 = arith.andi %3487, %3488 : i1
            %3490 = scf.if %3489 -> (i64) {
              scf.yield %3476#2 : i64
            } else {
              scf.yield %3485 : i64
            }
            %3491 = arith.cmpi ne, %3490, %3485 : i64
            scf.if %3491 {
              func.call @stack_push_pointer(%3490) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3476#2) : (i64) -> ()
              %3492 = llvm.mlir.addressof @str252 : !llvm.ptr
              %3493 = func.call @cc_make_function_ref_const(%3492) : (!llvm.ptr) -> i64
              %3494 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3493, %3494) : (i64, i64) -> ()
            }
            %3495 = func.call @stack_pop_pointer() : () -> i64
            %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
            %3496 = arith.addi %3495, %__rlasp_stack_elide_zero_322 : i64
            scf.yield %3496, %3476#1, %3476#2, %3495 : i64, i64, i64, i64
          }
          %3497 = func.call @cc_nil_value() : () -> i64
          %3498 = func.call @cc_errorp(%3484#0) : (i64) -> i64
          %3499 = arith.cmpi ne, %3498, %3497 : i64
          %3500:4 = scf.if %3499 -> (i64, i64, i64, i64) {
            scf.yield %3484#0, %3484#1, %3484#2, %3484#3 : i64, i64, i64, i64
          } else {
            %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
            %3501 = arith.addi %3484#2, %__rlasp_stack_elide_zero_323 : i64
            %3502 = func.call @cc_nil_value() : () -> i64
            %3503 = func.call @cc_errorp(%3484#3) : (i64) -> i64
            %3504 = arith.cmpi ne, %3503, %3502 : i64
            %3505 = arith.cmpi eq, %3502, %3502 : i64
            %3506 = arith.andi %3504, %3505 : i1
            %3507 = scf.if %3506 -> (i64) {
              scf.yield %3484#3 : i64
            } else {
              scf.yield %3502 : i64
            }
            %3508 = arith.cmpi ne, %3507, %3502 : i64
            scf.if %3508 {
              func.call @stack_push_pointer(%3507) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3484#3) : (i64) -> ()
              %3509 = llvm.mlir.addressof @str253 : !llvm.ptr
              %3510 = func.call @cc_make_function_ref_const(%3509) : (!llvm.ptr) -> i64
              %3511 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3510, %3511) : (i64, i64) -> ()
            }
            %3512 = func.call @stack_pop_pointer() : () -> i64
            %3513 = arith.constant 1 : i1
            %3515 = arith.constant 3 : i64
            %3514 = arith.andi %3501, %3515 : i64
            %3516 = arith.constant 0 : i64
            %3517 = arith.cmpi eq, %3514, %3516 : i64
            %3519 = arith.constant 3 : i64
            %3518 = arith.andi %3512, %3519 : i64
            %3520 = arith.constant 0 : i64
            %3521 = arith.cmpi eq, %3518, %3520 : i64
            %3522 = arith.andi %3517, %3521 : i1
            %3523 = scf.if %3522 -> (i1) {
              %3524 = arith.constant 2 : i64
              %3525 = arith.shrsi %3501, %3524 : i64
              %3526 = arith.constant 2 : i64
              %3527 = arith.shrsi %3512, %3526 : i64
              %3528 = arith.cmpi eq, %3525, %3527 : i64
              scf.yield %3528 : i1
            } else {
              %3529 = func.call @cc_eq(%3501, %3512) : (i64, i64) -> i64
              %3530 = func.call @cc_nil_value() : () -> i64
              %3531 = arith.cmpi ne, %3529, %3530 : i64
              scf.yield %3531 : i1
            }
            %3532 = arith.andi %3513, %3523 : i1
            %3533 = func.call @cc_nil_value() : () -> i64
            %3534 = func.call @cc_t_value() : () -> i64
            %3535 = scf.if %3532 -> (i64) {
              scf.yield %3534 : i64
            } else {
              scf.yield %3533 : i64
            }
            %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
            %3536 = arith.addi %3535, %__rlasp_stack_elide_zero_324 : i64
            %3537 = func.call @cc_nil_value() : () -> i64
            %3538 = func.call @cc_cons(%3536, %3537) : (i64, i64) -> i64
            %3539 = func.call @cc_not(%3538) : (i64) -> i64
            %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
            %3540 = arith.addi %3539, %__rlasp_stack_elide_zero_325 : i64
            %3541 = func.call @cc_nil_value() : () -> i64
            %3542 = arith.cmpi ne, %3540, %3541 : i64
            %3543:2 = scf.if %3542 -> (i64, i64) {
              %3544 = func.call @cc_nil_value() : () -> i64
              %3545 = func.call @cc_nil_value() : () -> i64
              %3546 = func.call @cc_errorp(%3544) : (i64) -> i64
              %3547 = arith.cmpi ne, %3546, %3545 : i64
              %3548:2 = scf.if %3547 -> (i64, i64) {
                scf.yield %3544, %3484#1 : i64, i64
              } else {
                func.call @stack_push_pointer(%3484#1) : (i64) -> ()
                %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
                %3549 = arith.addi %3484#2, %__rlasp_stack_elide_zero_326 : i64
                %3550 = func.call @cc_nil_value() : () -> i64
                %3551 = func.call @cc_errorp(%3549) : (i64) -> i64
                %3552 = arith.cmpi ne, %3551, %3550 : i64
                %3553 = arith.cmpi eq, %3550, %3550 : i64
                %3554 = arith.andi %3552, %3553 : i1
                %3555 = scf.if %3554 -> (i64) {
                  scf.yield %3549 : i64
                } else {
                  scf.yield %3550 : i64
                }
                %3556 = arith.cmpi ne, %3555, %3550 : i64
                scf.if %3556 {
                  func.call @stack_push_pointer(%3555) : (i64) -> ()
                } else {
                  %3557 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%3557) : (i64) -> ()
                  %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
                  %3558 = arith.addi %3549, %__rlasp_stack_elide_zero_327 : i64
                  %3559 = func.call @stack_pop_pointer() : () -> i64
                  %3560 = func.call @cc_cons(%3558, %3559) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%3560) : (i64) -> ()
                }
                %3561 = func.call @stack_pop_pointer() : () -> i64
                %3562 = func.call @stack_pop_pointer() : () -> i64
                %3563 = func.call @cc_append(%3562, %3561) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
                %3564 = arith.addi %3563, %__rlasp_stack_elide_zero_328 : i64
                %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
                %3565 = arith.addi %3564, %__rlasp_stack_elide_zero_329 : i64
                scf.yield %3565, %3564 : i64, i64
              }
              %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
              %3566 = arith.addi %3548#0, %__rlasp_stack_elide_zero_330 : i64
              scf.yield %3566, %3548#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %3567 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %3567, %3484#1 : i64, i64
            }
            %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
            %3568 = arith.addi %3543#0, %__rlasp_stack_elide_zero_331 : i64
            scf.yield %3568, %3543#1, %3484#2, %3484#3 : i64, i64, i64, i64
          }
          func.call @stack_push_pointer(%3500#0) : (i64) -> ()
          %3569 = func.call @stack_depth() : () -> i64
          %3570 = arith.constant 0 : i64
          %3571 = arith.cmpi sgt, %3569, %3570 : i64
          scf.if %3571 {
            %3572 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
          %3573 = arith.addi %3388, %__rlasp_stack_elide_zero_332 : i64
          %3574 = func.call @cc_cdr(%3573) : (i64) -> i64
          %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
          %3575 = arith.addi %3574, %__rlasp_stack_elide_zero_333 : i64
          func.call @stack_push_pointer(%3575) : (i64) -> ()
          %3576 = func.call @stack_depth() : () -> i64
          %3577 = arith.constant 0 : i64
          %3578 = arith.cmpi sgt, %3576, %3577 : i64
          scf.if %3578 {
            %3579 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %3500#2, %3500#3, %3500#1, %3575 : i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %3580 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
        %3581 = arith.addi %3356#2, %__rlasp_stack_elide_zero_334 : i64
        %3582 = func.call @cc_multiple_value_list(%3581) : (i64) -> i64
        %3583 = llvm.mlir.addressof @str254 : !llvm.ptr
        %3584 = arith.constant 38 : i64
        %3585 = func.call @cc_make_string(%3583, %3584) : (!llvm.ptr, i64) -> i64
        %3586 = func.call @cc_nil_value() : () -> i64
        %3587 = func.call @cc_intern(%3585, %3586) : (i64, i64) -> i64
        %3588 = func.call @cc_nil_value() : () -> i64
        %3589 = func.call @cc_cons(%3587, %3588) : (i64, i64) -> i64
        %3590 = func.call @cc_values_pack(%3589) : (i64) -> i64
        %3591 = func.call @cc_symbol_value(%3587) : (i64) -> i64
        %3592 = llvm.mlir.addressof @str255 : !llvm.ptr
        %3593 = arith.constant 39 : i64
        %3594 = func.call @cc_make_string(%3592, %3593) : (!llvm.ptr, i64) -> i64
        %3595 = func.call @cc_nil_value() : () -> i64
        %3596 = func.call @cc_intern(%3594, %3595) : (i64, i64) -> i64
        %3597 = func.call @cc_nil_value() : () -> i64
        %3598 = func.call @cc_cons(%3596, %3597) : (i64, i64) -> i64
        %3599 = func.call @cc_values_pack(%3598) : (i64) -> i64
        %3600 = func.call @cc_symbol_value(%3596) : (i64) -> i64
        %3601 = llvm.mlir.addressof @str256 : !llvm.ptr
        %3602 = arith.constant 40 : i64
        %3603 = func.call @cc_make_string(%3601, %3602) : (!llvm.ptr, i64) -> i64
        %3604 = func.call @cc_nil_value() : () -> i64
        %3605 = func.call @cc_intern(%3603, %3604) : (i64, i64) -> i64
        %3606 = func.call @cc_nil_value() : () -> i64
        %3607 = func.call @cc_cons(%3605, %3606) : (i64, i64) -> i64
        %3608 = func.call @cc_values_pack(%3607) : (i64) -> i64
        %3609 = func.call @cc_symbol_value(%3605) : (i64) -> i64
        %3610 = func.call @cc_nil_value() : () -> i64
        %3611 = arith.cmpi ne, %3591, %3610 : i64
        %3612 = scf.if %3611 -> (i64) {
          scf.yield %3609 : i64
        } else {
          scf.yield %3582 : i64
        }
        %3613 = func.call @cc_values_pack(%3612) : (i64) -> i64
        %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
        %3614 = arith.addi %3613, %__rlasp_stack_elide_zero_335 : i64
        scf.yield %3614, %3356#3, %3356#2, %3356#0, %3356#1 : i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %3615 = arith.addi %3327#0, %__rlasp_stack_elide_zero_336 : i64
      scf.yield %3615 : i64
    }
    func.call @stack_push_pointer(%3242) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455818"() {
    %3778 = func.call @cc_nil_value() : () -> i64
    %3779 = func.call @cc_nil_value() : () -> i64
    %3780 = func.call @cc_errorp(%3778) : (i64) -> i64
    %3781 = arith.cmpi ne, %3780, %3779 : i64
    %3782 = scf.if %3781 -> (i64) {
      scf.yield %3778 : i64
    } else {
      %3783 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3784 = func.call @cc_nil_value() : () -> i64
      %3785 = func.call @cc_nil_value() : () -> i64
      %3786 = func.call @cc_errorp(%3784) : (i64) -> i64
      %3787 = arith.cmpi ne, %3786, %3785 : i64
      %3788 = scf.if %3787 -> (i64) {
        scf.yield %3784 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3789 = arith.constant 0 : i64
        %3790 = func.call @cc_box_fixnum(%3789) : (i64) -> i64
        %3791 = func.call @cc_nil_value() : () -> i64
        %3792 = func.call @cc_errorp(%3790) : (i64) -> i64
        %3793 = arith.cmpi ne, %3792, %3791 : i64
        %3794 = arith.cmpi eq, %3791, %3791 : i64
        %3795 = arith.andi %3793, %3794 : i1
        %3796 = scf.if %3795 -> (i64) {
          scf.yield %3790 : i64
        } else {
          scf.yield %3791 : i64
        }
        %3797 = arith.cmpi ne, %3796, %3791 : i64
        scf.if %3797 {
          func.call @stack_push_pointer(%3796) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3790) : (i64) -> ()
          %3798 = llvm.mlir.addressof @str270 : !llvm.ptr
          %3799 = func.call @cc_make_function_ref_const(%3798) : (!llvm.ptr) -> i64
          %3800 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3799, %3800) : (i64, i64) -> ()
        }
        %3801 = func.call @stack_pop_pointer() : () -> i64
        %3802 = func.call @cc_errorp(%3801) : (i64) -> i64
        %3803 = func.call @cc_nil_value() : () -> i64
        %3804 = arith.cmpi ne, %3802, %3803 : i64
        scf.if %3804 {
          func.call @stack_push_pointer(%3801) : (i64) -> ()
        } else {
          %3805 = func.call @cc_multiple_value_list(%3801) : (i64) -> i64
          func.call @stack_push_pointer(%3805) : (i64) -> ()
        }
        %3806 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3807 = func.call @stack_pop_pointer() : () -> i64
        %3808 = func.call @cc_nil_value() : () -> i64
        %3809 = func.call @cc_maybe_error_from_multiple_value_list(%3806) : (i64) -> i64
        %3810 = func.call @cc_errorp(%3809) : (i64) -> i64
        %3811 = arith.cmpi ne, %3810, %3808 : i64
        %3812 = arith.cmpi eq, %3808, %3808 : i64
        %3813 = arith.andi %3811, %3812 : i1
        %3814 = scf.if %3813 -> (i64) {
          scf.yield %3809 : i64
        } else {
          scf.yield %3808 : i64
        }
        %3815 = arith.cmpi ne, %3814, %3808 : i64
        scf.if %3815 {
          func.call @stack_push_pointer(%3814) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3816 = func.call @stack_pop_pointer() : () -> i64
          %3817 = func.call @cc_cons(%3807, %3816) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
          %3818 = arith.addi %3817, %__rlasp_stack_elide_zero_337 : i64
          %3819 = func.call @cc_cons(%3806, %3818) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
          %3820 = arith.addi %3819, %__rlasp_stack_elide_zero_338 : i64
          %3821 = func.call @cc_values_pack(%3820) : (i64) -> i64
          func.call @stack_push_pointer(%3821) : (i64) -> ()
        }
        %3822 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3822 : i64
      }
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %3823 = arith.addi %3788, %__rlasp_stack_elide_zero_339 : i64
      %3824 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3825 = func.call @cc_errorp(%3823) : (i64) -> i64
      %3826 = func.call @cc_nil_value() : () -> i64
      %3827 = arith.cmpi ne, %3825, %3826 : i64
      scf.if %3827 {
        %3828 = func.call @cc_condition_value(%3823) : (i64) -> i64
        %3829 = func.call @cc_values2(%3826, %3828) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3829) : (i64) -> ()
      } else {
        %3830 = func.call @cc_multiple_value_list(%3823) : (i64) -> i64
        %3831 = func.call @cc_values_pack(%3830) : (i64) -> i64
        func.call @stack_push_pointer(%3831) : (i64) -> ()
      }
      %3832 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3832 : i64
    }
    func.call @stack_push_pointer(%3782) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455819"() {
    %4014 = func.call @cc_nil_value() : () -> i64
    %4015 = func.call @cc_nil_value() : () -> i64
    %4016 = func.call @cc_errorp(%4014) : (i64) -> i64
    %4017 = arith.cmpi ne, %4016, %4015 : i64
    %4018 = scf.if %4017 -> (i64) {
      scf.yield %4014 : i64
    } else {
      %4019 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4020 = func.call @cc_nil_value() : () -> i64
      %4021 = func.call @cc_nil_value() : () -> i64
      %4022 = func.call @cc_errorp(%4020) : (i64) -> i64
      %4023 = arith.cmpi ne, %4022, %4021 : i64
      %4024 = scf.if %4023 -> (i64) {
        scf.yield %4020 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4025 = arith.constant 3 : i64
        %4026 = func.call @cc_box_fixnum(%4025) : (i64) -> i64
        %4027 = func.call @cc_nil_value() : () -> i64
        %4028 = func.call @cc_errorp(%4026) : (i64) -> i64
        %4029 = arith.cmpi ne, %4028, %4027 : i64
        %4030 = arith.cmpi eq, %4027, %4027 : i64
        %4031 = arith.andi %4029, %4030 : i1
        %4032 = scf.if %4031 -> (i64) {
          scf.yield %4026 : i64
        } else {
          scf.yield %4027 : i64
        }
        %4033 = arith.cmpi ne, %4032, %4027 : i64
        scf.if %4033 {
          func.call @stack_push_pointer(%4032) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4026) : (i64) -> ()
          %4034 = llvm.mlir.addressof @str286 : !llvm.ptr
          %4035 = func.call @cc_make_function_ref_const(%4034) : (!llvm.ptr) -> i64
          %4036 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4035, %4036) : (i64, i64) -> ()
        }
        %4037 = func.call @stack_pop_pointer() : () -> i64
        %4038 = func.call @cc_errorp(%4037) : (i64) -> i64
        %4039 = func.call @cc_nil_value() : () -> i64
        %4040 = arith.cmpi ne, %4038, %4039 : i64
        scf.if %4040 {
          func.call @stack_push_pointer(%4037) : (i64) -> ()
        } else {
          %4041 = func.call @cc_multiple_value_list(%4037) : (i64) -> i64
          func.call @stack_push_pointer(%4041) : (i64) -> ()
        }
        %4042 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4043 = func.call @stack_pop_pointer() : () -> i64
        %4044 = func.call @cc_nil_value() : () -> i64
        %4045 = func.call @cc_maybe_error_from_multiple_value_list(%4042) : (i64) -> i64
        %4046 = func.call @cc_errorp(%4045) : (i64) -> i64
        %4047 = arith.cmpi ne, %4046, %4044 : i64
        %4048 = arith.cmpi eq, %4044, %4044 : i64
        %4049 = arith.andi %4047, %4048 : i1
        %4050 = scf.if %4049 -> (i64) {
          scf.yield %4045 : i64
        } else {
          scf.yield %4044 : i64
        }
        %4051 = arith.cmpi ne, %4050, %4044 : i64
        scf.if %4051 {
          func.call @stack_push_pointer(%4050) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4052 = func.call @stack_pop_pointer() : () -> i64
          %4053 = func.call @cc_cons(%4043, %4052) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
          %4054 = arith.addi %4053, %__rlasp_stack_elide_zero_340 : i64
          %4055 = func.call @cc_cons(%4042, %4054) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
          %4056 = arith.addi %4055, %__rlasp_stack_elide_zero_341 : i64
          %4057 = func.call @cc_values_pack(%4056) : (i64) -> i64
          func.call @stack_push_pointer(%4057) : (i64) -> ()
        }
        %4058 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4058 : i64
      }
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %4059 = arith.addi %4024, %__rlasp_stack_elide_zero_342 : i64
      %4060 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4061 = func.call @cc_errorp(%4059) : (i64) -> i64
      %4062 = func.call @cc_nil_value() : () -> i64
      %4063 = arith.cmpi ne, %4061, %4062 : i64
      scf.if %4063 {
        %4064 = func.call @cc_condition_value(%4059) : (i64) -> i64
        %4065 = func.call @cc_values2(%4062, %4064) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4065) : (i64) -> ()
      } else {
        %4066 = func.call @cc_multiple_value_list(%4059) : (i64) -> i64
        %4067 = func.call @cc_values_pack(%4066) : (i64) -> i64
        func.call @stack_push_pointer(%4067) : (i64) -> ()
      }
      %4068 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4068 : i64
    }
    func.call @stack_push_pointer(%4018) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455820"() {
    %4251 = func.call @cc_nil_value() : () -> i64
    %4252 = func.call @cc_nil_value() : () -> i64
    %4253 = func.call @cc_errorp(%4251) : (i64) -> i64
    %4254 = arith.cmpi ne, %4253, %4252 : i64
    %4255 = scf.if %4254 -> (i64) {
      scf.yield %4251 : i64
    } else {
      %4256 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4257 = func.call @cc_nil_value() : () -> i64
      %4258 = func.call @cc_nil_value() : () -> i64
      %4259 = func.call @cc_errorp(%4257) : (i64) -> i64
      %4260 = arith.cmpi ne, %4259, %4258 : i64
      %4261 = scf.if %4260 -> (i64) {
        scf.yield %4257 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4262 = arith.constant 3.0 : f64
        %4263 = func.call @cc_box_single_float(%4262) : (f64) -> i64
        %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
        %4264 = arith.addi %4263, %__rlasp_stack_elide_zero_343 : i64
        %4265 = func.call @cc_nil_value() : () -> i64
        %4266 = func.call @cc_errorp(%4264) : (i64) -> i64
        %4267 = arith.cmpi ne, %4266, %4265 : i64
        %4268 = arith.cmpi eq, %4265, %4265 : i64
        %4269 = arith.andi %4267, %4268 : i1
        %4270 = scf.if %4269 -> (i64) {
          scf.yield %4264 : i64
        } else {
          scf.yield %4265 : i64
        }
        %4271 = arith.cmpi ne, %4270, %4265 : i64
        scf.if %4271 {
          func.call @stack_push_pointer(%4270) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4264) : (i64) -> ()
          %4272 = llvm.mlir.addressof @str302 : !llvm.ptr
          %4273 = func.call @cc_make_function_ref_const(%4272) : (!llvm.ptr) -> i64
          %4274 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4273, %4274) : (i64, i64) -> ()
        }
        %4275 = func.call @stack_pop_pointer() : () -> i64
        %4276 = func.call @cc_errorp(%4275) : (i64) -> i64
        %4277 = func.call @cc_nil_value() : () -> i64
        %4278 = arith.cmpi ne, %4276, %4277 : i64
        scf.if %4278 {
          func.call @stack_push_pointer(%4275) : (i64) -> ()
        } else {
          %4279 = func.call @cc_multiple_value_list(%4275) : (i64) -> i64
          func.call @stack_push_pointer(%4279) : (i64) -> ()
        }
        %4280 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4281 = func.call @stack_pop_pointer() : () -> i64
        %4282 = func.call @cc_nil_value() : () -> i64
        %4283 = func.call @cc_maybe_error_from_multiple_value_list(%4280) : (i64) -> i64
        %4284 = func.call @cc_errorp(%4283) : (i64) -> i64
        %4285 = arith.cmpi ne, %4284, %4282 : i64
        %4286 = arith.cmpi eq, %4282, %4282 : i64
        %4287 = arith.andi %4285, %4286 : i1
        %4288 = scf.if %4287 -> (i64) {
          scf.yield %4283 : i64
        } else {
          scf.yield %4282 : i64
        }
        %4289 = arith.cmpi ne, %4288, %4282 : i64
        scf.if %4289 {
          func.call @stack_push_pointer(%4288) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4290 = func.call @stack_pop_pointer() : () -> i64
          %4291 = func.call @cc_cons(%4281, %4290) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
          %4292 = arith.addi %4291, %__rlasp_stack_elide_zero_344 : i64
          %4293 = func.call @cc_cons(%4280, %4292) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
          %4294 = arith.addi %4293, %__rlasp_stack_elide_zero_345 : i64
          %4295 = func.call @cc_values_pack(%4294) : (i64) -> i64
          func.call @stack_push_pointer(%4295) : (i64) -> ()
        }
        %4296 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4296 : i64
      }
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %4297 = arith.addi %4261, %__rlasp_stack_elide_zero_346 : i64
      %4298 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4299 = func.call @cc_errorp(%4297) : (i64) -> i64
      %4300 = func.call @cc_nil_value() : () -> i64
      %4301 = arith.cmpi ne, %4299, %4300 : i64
      scf.if %4301 {
        %4302 = func.call @cc_condition_value(%4297) : (i64) -> i64
        %4303 = func.call @cc_values2(%4300, %4302) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4303) : (i64) -> ()
      } else {
        %4304 = func.call @cc_multiple_value_list(%4297) : (i64) -> i64
        %4305 = func.call @cc_values_pack(%4304) : (i64) -> i64
        func.call @stack_push_pointer(%4305) : (i64) -> ()
      }
      %4306 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4306 : i64
    }
    func.call @stack_push_pointer(%4255) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455821"() {
    %4513 = func.call @cc_nil_value() : () -> i64
    %4514 = func.call @cc_nil_value() : () -> i64
    %4515 = func.call @cc_errorp(%4513) : (i64) -> i64
    %4516 = arith.cmpi ne, %4515, %4514 : i64
    %4517 = scf.if %4516 -> (i64) {
      scf.yield %4513 : i64
    } else {
      %4518 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4519 = func.call @cc_nil_value() : () -> i64
      %4520 = func.call @cc_nil_value() : () -> i64
      %4521 = func.call @cc_errorp(%4519) : (i64) -> i64
      %4522 = arith.cmpi ne, %4521, %4520 : i64
      %4523 = scf.if %4522 -> (i64) {
        scf.yield %4519 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4524 = llvm.mlir.addressof @str322 : !llvm.ptr
        %4525 = arith.constant 20 : i64
        %4526 = func.call @cc_make_string(%4524, %4525) : (!llvm.ptr, i64) -> i64
        %4527 = llvm.mlir.addressof @str323 : !llvm.ptr
        %4528 = arith.constant 11 : i64
        %4529 = func.call @cc_make_string(%4527, %4528) : (!llvm.ptr, i64) -> i64
        %4530 = func.call @cc_intern(%4526, %4529) : (i64, i64) -> i64
        %4531 = func.call @cc_nil_value() : () -> i64
        %4532 = func.call @cc_cons(%4530, %4531) : (i64, i64) -> i64
        %4533 = func.call @cc_values_pack(%4532) : (i64) -> i64
        %4534 = func.call @cc_symbol_value(%4530) : (i64) -> i64
        %4535 = arith.constant 1 : i64
        %4536 = func.call @cc_box_fixnum(%4535) : (i64) -> i64
        %4538 = arith.constant 3 : i64
        %4537 = arith.andi %4534, %4538 : i64
        %4539 = arith.constant 0 : i64
        %4540 = arith.cmpi eq, %4537, %4539 : i64
        %4542 = arith.constant 3 : i64
        %4541 = arith.andi %4536, %4542 : i64
        %4543 = arith.constant 0 : i64
        %4544 = arith.cmpi eq, %4541, %4543 : i64
        %4545 = arith.andi %4540, %4544 : i1
        %4546 = scf.if %4545 -> (i64) {
          %4547 = arith.constant 2 : i64
          %4548 = arith.shrsi %4534, %4547 : i64
          %4549 = arith.constant 2 : i64
          %4550 = arith.shrsi %4536, %4549 : i64
          %4551 = arith.addi %4548, %4550 : i64
          %4552 = arith.constant -2305843009213693952 : i64
          %4553 = arith.constant 2305843009213693951 : i64
          %4554 = arith.cmpi sge, %4551, %4552 : i64
          %4555 = arith.cmpi sle, %4551, %4553 : i64
          %4556 = arith.andi %4554, %4555 : i1
          %4557 = scf.if %4556 -> (i64) {
            %4558 = arith.constant 2 : i64
            %4559 = arith.shli %4551, %4558 : i64
            scf.yield %4559 : i64
          } else {
            %4560 = func.call @cc_add(%4534, %4536) : (i64, i64) -> i64
            scf.yield %4560 : i64
          }
          scf.yield %4557 : i64
        } else {
          %4561 = func.call @cc_add(%4534, %4536) : (i64, i64) -> i64
          scf.yield %4561 : i64
        }
        %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
        %4562 = arith.addi %4546, %__rlasp_stack_elide_zero_347 : i64
        %4563 = func.call @cc_nil_value() : () -> i64
        %4564 = func.call @cc_errorp(%4562) : (i64) -> i64
        %4565 = arith.cmpi ne, %4564, %4563 : i64
        %4566 = arith.cmpi eq, %4563, %4563 : i64
        %4567 = arith.andi %4565, %4566 : i1
        %4568 = scf.if %4567 -> (i64) {
          scf.yield %4562 : i64
        } else {
          scf.yield %4563 : i64
        }
        %4569 = arith.cmpi ne, %4568, %4563 : i64
        scf.if %4569 {
          func.call @stack_push_pointer(%4568) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4562) : (i64) -> ()
          %4570 = llvm.mlir.addressof @str324 : !llvm.ptr
          %4571 = func.call @cc_make_function_ref_const(%4570) : (!llvm.ptr) -> i64
          %4572 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4571, %4572) : (i64, i64) -> ()
        }
        %4573 = func.call @stack_pop_pointer() : () -> i64
        %4574 = func.call @cc_errorp(%4573) : (i64) -> i64
        %4575 = func.call @cc_nil_value() : () -> i64
        %4576 = arith.cmpi ne, %4574, %4575 : i64
        scf.if %4576 {
          func.call @stack_push_pointer(%4573) : (i64) -> ()
        } else {
          %4577 = func.call @cc_multiple_value_list(%4573) : (i64) -> i64
          func.call @stack_push_pointer(%4577) : (i64) -> ()
        }
        %4578 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4579 = func.call @stack_pop_pointer() : () -> i64
        %4580 = func.call @cc_nil_value() : () -> i64
        %4581 = func.call @cc_maybe_error_from_multiple_value_list(%4578) : (i64) -> i64
        %4582 = func.call @cc_errorp(%4581) : (i64) -> i64
        %4583 = arith.cmpi ne, %4582, %4580 : i64
        %4584 = arith.cmpi eq, %4580, %4580 : i64
        %4585 = arith.andi %4583, %4584 : i1
        %4586 = scf.if %4585 -> (i64) {
          scf.yield %4581 : i64
        } else {
          scf.yield %4580 : i64
        }
        %4587 = arith.cmpi ne, %4586, %4580 : i64
        scf.if %4587 {
          func.call @stack_push_pointer(%4586) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4588 = func.call @stack_pop_pointer() : () -> i64
          %4589 = func.call @cc_cons(%4579, %4588) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
          %4590 = arith.addi %4589, %__rlasp_stack_elide_zero_348 : i64
          %4591 = func.call @cc_cons(%4578, %4590) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
          %4592 = arith.addi %4591, %__rlasp_stack_elide_zero_349 : i64
          %4593 = func.call @cc_values_pack(%4592) : (i64) -> i64
          func.call @stack_push_pointer(%4593) : (i64) -> ()
        }
        %4594 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4594 : i64
      }
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %4595 = arith.addi %4523, %__rlasp_stack_elide_zero_350 : i64
      %4596 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4597 = func.call @cc_errorp(%4595) : (i64) -> i64
      %4598 = func.call @cc_nil_value() : () -> i64
      %4599 = arith.cmpi ne, %4597, %4598 : i64
      scf.if %4599 {
        %4600 = func.call @cc_condition_value(%4595) : (i64) -> i64
        %4601 = func.call @cc_values2(%4598, %4600) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4601) : (i64) -> ()
      } else {
        %4602 = func.call @cc_multiple_value_list(%4595) : (i64) -> i64
        %4603 = func.call @cc_values_pack(%4602) : (i64) -> i64
        func.call @stack_push_pointer(%4603) : (i64) -> ()
      }
      %4604 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4604 : i64
    }
    func.call @stack_push_pointer(%4517) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455822"() {
    %4811 = func.call @cc_nil_value() : () -> i64
    %4812 = func.call @cc_nil_value() : () -> i64
    %4813 = func.call @cc_errorp(%4811) : (i64) -> i64
    %4814 = arith.cmpi ne, %4813, %4812 : i64
    %4815 = scf.if %4814 -> (i64) {
      scf.yield %4811 : i64
    } else {
      %4816 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4817 = func.call @cc_nil_value() : () -> i64
      %4818 = func.call @cc_nil_value() : () -> i64
      %4819 = func.call @cc_errorp(%4817) : (i64) -> i64
      %4820 = arith.cmpi ne, %4819, %4818 : i64
      %4821 = scf.if %4820 -> (i64) {
        scf.yield %4817 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4822 = llvm.mlir.addressof @str344 : !llvm.ptr
        %4823 = arith.constant 20 : i64
        %4824 = func.call @cc_make_string(%4822, %4823) : (!llvm.ptr, i64) -> i64
        %4825 = llvm.mlir.addressof @str345 : !llvm.ptr
        %4826 = arith.constant 11 : i64
        %4827 = func.call @cc_make_string(%4825, %4826) : (!llvm.ptr, i64) -> i64
        %4828 = func.call @cc_intern(%4824, %4827) : (i64, i64) -> i64
        %4829 = func.call @cc_nil_value() : () -> i64
        %4830 = func.call @cc_cons(%4828, %4829) : (i64, i64) -> i64
        %4831 = func.call @cc_values_pack(%4830) : (i64) -> i64
        %4832 = func.call @cc_symbol_value(%4828) : (i64) -> i64
        %4833 = arith.constant 1 : i64
        %4834 = func.call @cc_box_fixnum(%4833) : (i64) -> i64
        %4836 = arith.constant 3 : i64
        %4835 = arith.andi %4832, %4836 : i64
        %4837 = arith.constant 0 : i64
        %4838 = arith.cmpi eq, %4835, %4837 : i64
        %4840 = arith.constant 3 : i64
        %4839 = arith.andi %4834, %4840 : i64
        %4841 = arith.constant 0 : i64
        %4842 = arith.cmpi eq, %4839, %4841 : i64
        %4843 = arith.andi %4838, %4842 : i1
        %4844 = scf.if %4843 -> (i64) {
          %4845 = arith.constant 2 : i64
          %4846 = arith.shrsi %4832, %4845 : i64
          %4847 = arith.constant 2 : i64
          %4848 = arith.shrsi %4834, %4847 : i64
          %4849 = arith.subi %4846, %4848 : i64
          %4850 = arith.constant -2305843009213693952 : i64
          %4851 = arith.constant 2305843009213693951 : i64
          %4852 = arith.cmpi sge, %4849, %4850 : i64
          %4853 = arith.cmpi sle, %4849, %4851 : i64
          %4854 = arith.andi %4852, %4853 : i1
          %4855 = scf.if %4854 -> (i64) {
            %4856 = arith.constant 2 : i64
            %4857 = arith.shli %4849, %4856 : i64
            scf.yield %4857 : i64
          } else {
            %4858 = func.call @cc_sub(%4832, %4834) : (i64, i64) -> i64
            scf.yield %4858 : i64
          }
          scf.yield %4855 : i64
        } else {
          %4859 = func.call @cc_sub(%4832, %4834) : (i64, i64) -> i64
          scf.yield %4859 : i64
        }
        %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
        %4860 = arith.addi %4844, %__rlasp_stack_elide_zero_351 : i64
        %4861 = func.call @cc_nil_value() : () -> i64
        %4862 = func.call @cc_errorp(%4860) : (i64) -> i64
        %4863 = arith.cmpi ne, %4862, %4861 : i64
        %4864 = arith.cmpi eq, %4861, %4861 : i64
        %4865 = arith.andi %4863, %4864 : i1
        %4866 = scf.if %4865 -> (i64) {
          scf.yield %4860 : i64
        } else {
          scf.yield %4861 : i64
        }
        %4867 = arith.cmpi ne, %4866, %4861 : i64
        scf.if %4867 {
          func.call @stack_push_pointer(%4866) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4860) : (i64) -> ()
          %4868 = llvm.mlir.addressof @str346 : !llvm.ptr
          %4869 = func.call @cc_make_function_ref_const(%4868) : (!llvm.ptr) -> i64
          %4870 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4869, %4870) : (i64, i64) -> ()
        }
        %4871 = func.call @stack_pop_pointer() : () -> i64
        %4872 = func.call @cc_errorp(%4871) : (i64) -> i64
        %4873 = func.call @cc_nil_value() : () -> i64
        %4874 = arith.cmpi ne, %4872, %4873 : i64
        scf.if %4874 {
          func.call @stack_push_pointer(%4871) : (i64) -> ()
        } else {
          %4875 = func.call @cc_multiple_value_list(%4871) : (i64) -> i64
          func.call @stack_push_pointer(%4875) : (i64) -> ()
        }
        %4876 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4877 = func.call @stack_pop_pointer() : () -> i64
        %4878 = func.call @cc_nil_value() : () -> i64
        %4879 = func.call @cc_maybe_error_from_multiple_value_list(%4876) : (i64) -> i64
        %4880 = func.call @cc_errorp(%4879) : (i64) -> i64
        %4881 = arith.cmpi ne, %4880, %4878 : i64
        %4882 = arith.cmpi eq, %4878, %4878 : i64
        %4883 = arith.andi %4881, %4882 : i1
        %4884 = scf.if %4883 -> (i64) {
          scf.yield %4879 : i64
        } else {
          scf.yield %4878 : i64
        }
        %4885 = arith.cmpi ne, %4884, %4878 : i64
        scf.if %4885 {
          func.call @stack_push_pointer(%4884) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4886 = func.call @stack_pop_pointer() : () -> i64
          %4887 = func.call @cc_cons(%4877, %4886) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
          %4888 = arith.addi %4887, %__rlasp_stack_elide_zero_352 : i64
          %4889 = func.call @cc_cons(%4876, %4888) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
          %4890 = arith.addi %4889, %__rlasp_stack_elide_zero_353 : i64
          %4891 = func.call @cc_values_pack(%4890) : (i64) -> i64
          func.call @stack_push_pointer(%4891) : (i64) -> ()
        }
        %4892 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4892 : i64
      }
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %4893 = arith.addi %4821, %__rlasp_stack_elide_zero_354 : i64
      %4894 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4895 = func.call @cc_errorp(%4893) : (i64) -> i64
      %4896 = func.call @cc_nil_value() : () -> i64
      %4897 = arith.cmpi ne, %4895, %4896 : i64
      scf.if %4897 {
        %4898 = func.call @cc_condition_value(%4893) : (i64) -> i64
        %4899 = func.call @cc_values2(%4896, %4898) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4899) : (i64) -> ()
      } else {
        %4900 = func.call @cc_multiple_value_list(%4893) : (i64) -> i64
        %4901 = func.call @cc_values_pack(%4900) : (i64) -> i64
        func.call @stack_push_pointer(%4901) : (i64) -> ()
      }
      %4902 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4902 : i64
    }
    func.call @stack_push_pointer(%4815) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_162741310455808*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_162741310455808*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("SINGLE-FLOAT-BIT-POSITIVE-CASES\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str6("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str7("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str9("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str12("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str13("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str17("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str18("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str20("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str21("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str22("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str23("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str24("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str25("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str27("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str28("CONSP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str30("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str33("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str36("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str37("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str41("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str42("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str43("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str44("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str45("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str48("BITS-TO-SINGLE-FLOAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str49("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str50("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str52("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str53("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str54("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str55("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str56("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str57("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str58("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str60("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str62("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str63("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETVALUE_162741310455810*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETMVLIST_162741310455810*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str72("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str73("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETVALUE_162741310455810*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETMVLIST_162741310455810*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str77("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str78("ext:bits-to-single-float\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETVALUE_162741310455810*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETMVLIST_162741310455810*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str82("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str88("SINGLE-FLOAT-BIT-NEGATIVE-1\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str89("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str90("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str92("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str93("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str94("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str96("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str100("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str101("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str102("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str103("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str104("SINGLE-FLOAT-BIT-NEGATIVE-2\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str105("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str106("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str109("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str110("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str111("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str112("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str119("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str120("SINGLE-FLOAT-BIT-NEGATIVE-3\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str121("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str122("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str124("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str125("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str126("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str127("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str128("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str129("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str130("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str135("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str136("SINGLE-FLOAT-BIT-NEGATIVE-4\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str137("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str138("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str140("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str141("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str142("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str143("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str148("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str150("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str152("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str156("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str157("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str158("SINGLE-FLOAT-BIT-NEGATIVE-5\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str159("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str160("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str162("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str163("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str164("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str168("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str170("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str172("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str173("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str178("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str179("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str180("DOUBLE-FLOAT-BIT-POSITIVE-CASES\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str181("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str182("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str183("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str184("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str185("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str189("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str191("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str192("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str194("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str195("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str196("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str197("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str198("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str199("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str200("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str201("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str202("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str203("CONSP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str204("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str205("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str207("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str208("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str211("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str212("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str213("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str214("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str216("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str217("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str218("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str219("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str220("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str223("BITS-TO-DOUBLE-FLOAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str224("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str225("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str226("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str227("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str228("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str229("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str230("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str231("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str233("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str235("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str236("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str237("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str238("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETVALUE_162741310455817*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETMVLIST_162741310455817*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str245("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str246("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str247("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str248("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str250("*__MLIR_BLOCK_RETVALUE_162741310455817*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str251("*__MLIR_BLOCK_RETMVLIST_162741310455817*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str252("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str253("ext:bits-to-double-float\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str254("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str255("*__MLIR_BLOCK_RETVALUE_162741310455817*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str256("*__MLIR_BLOCK_RETMVLIST_162741310455817*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str257("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str261("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str262("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str263("DOUBLE-FLOAT-BIT-NEGATIVE-1\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str264("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str265("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str266("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str267("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str268("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str269("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str270("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str271("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str272("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str273("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str275("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str276("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str277("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str278("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str279("DOUBLE-FLOAT-BIT-NEGATIVE-2\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str280("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str281("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str283("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str284("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str285("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str286("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str287("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str288("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str289("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str290("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str292("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str293("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str294("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str295("DOUBLE-FLOAT-BIT-NEGATIVE-3\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str296("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str300("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str301("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str302("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str303("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str304("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str305("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str306("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str307("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str308("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str309("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str310("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str311("DOUBLE-FLOAT-BIT-NEGATIVE-4\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str312("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str315("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str316("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str317("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str318("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str319("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str323("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str325("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str326("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str327("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str329("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str330("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str331("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str332("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str333("DOUBLE-FLOAT-BIT-NEGATIVE-5\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str334("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str335("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str337("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str338("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str339("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str340("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str343("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str345("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str346("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str347("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str348("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str349("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str350("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str351("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str352("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str353("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str354("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str355("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str356("*__MLIR_BLOCK_RETMVLIST_162741310455808*\00") : !llvm.array<41 x i8>
}
