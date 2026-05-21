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
      %82 = arith.constant 4 : i64
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
      %92 = arith.constant 42 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %94 = func.call @stack_pop_pointer() : () -> i64
      %95 = func.call @stack_pop_pointer() : () -> i64
      %96 = func.call @cc_cons(%95, %94) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %97 = arith.addi %96, %__rlasp_stack_elide_zero_3 : i64
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @cc_cons(%98, %97) : (i64, i64) -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %100 = func.call @stack_pop_pointer() : () -> i64
      %101 = func.call @stack_pop_pointer() : () -> i64
      %102 = func.call @cc_cons(%101, %100) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %103 = arith.addi %102, %__rlasp_stack_elide_zero_4 : i64
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @cc_cons(%104, %103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %106 = func.call @stack_pop_pointer() : () -> i64
      %107 = func.call @stack_pop_pointer() : () -> i64
      %108 = func.call @cc_cons(%107, %106) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %109 = arith.addi %108, %__rlasp_stack_elide_zero_5 : i64
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @cc_cons(%110, %109) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %112 = arith.addi %111, %__rlasp_stack_elide_zero_6 : i64
      %140 = arith.constant 269090723725313 : i64
      %141 = arith.constant 0 : i64
      %142 = func.call @cc_make_closure(%140, %141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %143 = arith.addi %142, %__rlasp_stack_elide_zero_7 : i64
      %144 = llvm.mlir.addressof @str13 : !llvm.ptr
      %145 = arith.constant 1 : i64
      %146 = func.call @cc_make_string(%144, %145) : (!llvm.ptr, i64) -> i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_intern(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_nil_value() : () -> i64
      %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
      %151 = func.call @cc_values_pack(%150) : (i64) -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @cc_cons(%153, %152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %155 = arith.addi %154, %__rlasp_stack_elide_zero_8 : i64
      %156 = llvm.mlir.addressof @str14 : !llvm.ptr
      %157 = arith.constant 11 : i64
      %158 = func.call @cc_make_string(%156, %157) : (!llvm.ptr, i64) -> i64
      %159 = llvm.mlir.addressof @str15 : !llvm.ptr
      %160 = arith.constant 7 : i64
      %161 = func.call @cc_make_string(%159, %160) : (!llvm.ptr, i64) -> i64
      %162 = func.call @cc_intern(%158, %161) : (i64, i64) -> i64
      %163 = func.call @cc_nil_value() : () -> i64
      %164 = func.call @cc_cons(%162, %163) : (i64, i64) -> i64
      %165 = func.call @cc_values_pack(%164) : (i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = llvm.mlir.addressof @str16 : !llvm.ptr
      %168 = arith.constant 4 : i64
      %169 = func.call @cc_make_string(%167, %168) : (!llvm.ptr, i64) -> i64
      %170 = llvm.mlir.addressof @str17 : !llvm.ptr
      %171 = arith.constant 7 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = func.call @cc_intern(%169, %172) : (i64, i64) -> i64
      %174 = func.call @cc_nil_value() : () -> i64
      %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
      %176 = func.call @cc_values_pack(%175) : (i64) -> i64
      %177 = llvm.mlir.addressof @str18 : !llvm.ptr
      %178 = arith.constant 6 : i64
      %179 = func.call @cc_make_string(%177, %178) : (!llvm.ptr, i64) -> i64
      %180 = func.call @cc_nil_value() : () -> i64
      %181 = func.call @cc_intern(%179, %180) : (i64, i64) -> i64
      %182 = func.call @cc_nil_value() : () -> i64
      %183 = func.call @cc_cons(%181, %182) : (i64, i64) -> i64
      %184 = func.call @cc_values_pack(%183) : (i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %185 = arith.addi %181, %__rlasp_stack_elide_zero_9 : i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_errorp(%64) : (i64) -> i64
      %188 = arith.cmpi ne, %187, %186 : i64
      %189 = arith.cmpi eq, %186, %186 : i64
      %190 = arith.andi %188, %189 : i1
      %191 = scf.if %190 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %186 : i64
      }
      %192 = func.call @cc_errorp(%112) : (i64) -> i64
      %193 = arith.cmpi ne, %192, %186 : i64
      %194 = arith.cmpi eq, %191, %186 : i64
      %195 = arith.andi %193, %194 : i1
      %196 = scf.if %195 -> (i64) {
        scf.yield %112 : i64
      } else {
        scf.yield %191 : i64
      }
      %197 = func.call @cc_errorp(%143) : (i64) -> i64
      %198 = arith.cmpi ne, %197, %186 : i64
      %199 = arith.cmpi eq, %196, %186 : i64
      %200 = arith.andi %198, %199 : i1
      %201 = scf.if %200 -> (i64) {
        scf.yield %143 : i64
      } else {
        scf.yield %196 : i64
      }
      %202 = func.call @cc_errorp(%155) : (i64) -> i64
      %203 = arith.cmpi ne, %202, %186 : i64
      %204 = arith.cmpi eq, %201, %186 : i64
      %205 = arith.andi %203, %204 : i1
      %206 = scf.if %205 -> (i64) {
        scf.yield %155 : i64
      } else {
        scf.yield %201 : i64
      }
      %207 = func.call @cc_errorp(%162) : (i64) -> i64
      %208 = arith.cmpi ne, %207, %186 : i64
      %209 = arith.cmpi eq, %206, %186 : i64
      %210 = arith.andi %208, %209 : i1
      %211 = scf.if %210 -> (i64) {
        scf.yield %162 : i64
      } else {
        scf.yield %206 : i64
      }
      %212 = func.call @cc_errorp(%166) : (i64) -> i64
      %213 = arith.cmpi ne, %212, %186 : i64
      %214 = arith.cmpi eq, %211, %186 : i64
      %215 = arith.andi %213, %214 : i1
      %216 = scf.if %215 -> (i64) {
        scf.yield %166 : i64
      } else {
        scf.yield %211 : i64
      }
      %217 = func.call @cc_errorp(%173) : (i64) -> i64
      %218 = arith.cmpi ne, %217, %186 : i64
      %219 = arith.cmpi eq, %216, %186 : i64
      %220 = arith.andi %218, %219 : i1
      %221 = scf.if %220 -> (i64) {
        scf.yield %173 : i64
      } else {
        scf.yield %216 : i64
      }
      %222 = func.call @cc_errorp(%185) : (i64) -> i64
      %223 = arith.cmpi ne, %222, %186 : i64
      %224 = arith.cmpi eq, %221, %186 : i64
      %225 = arith.andi %223, %224 : i1
      %226 = scf.if %225 -> (i64) {
        scf.yield %185 : i64
      } else {
        scf.yield %221 : i64
      }
      %227 = arith.cmpi ne, %226, %186 : i64
      scf.if %227 {
        func.call @stack_push_pointer(%226) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%112) : (i64) -> ()
        func.call @stack_push_pointer(%143) : (i64) -> ()
        func.call @stack_push_pointer(%155) : (i64) -> ()
        func.call @stack_push_pointer(%162) : (i64) -> ()
        func.call @stack_push_pointer(%166) : (i64) -> ()
        func.call @stack_push_pointer(%173) : (i64) -> ()
        func.call @stack_push_pointer(%185) : (i64) -> ()
        %228 = llvm.mlir.addressof @str19 : !llvm.ptr
        %229 = func.call @cc_make_function_ref_const(%228) : (!llvm.ptr) -> i64
        %230 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%229, %230) : (i64, i64) -> ()
      }
      %231 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %231 : i64
    }
    %232 = func.call @cc_nil_value() : () -> i64
    %233 = func.call @cc_errorp(%55) : (i64) -> i64
    %234 = arith.cmpi ne, %233, %232 : i64
    %235 = scf.if %234 -> (i64) {
      scf.yield %55 : i64
    } else {
      %236 = llvm.mlir.addressof @str20 : !llvm.ptr
      %237 = arith.constant 9 : i64
      %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
      %239 = func.call @cc_nil_value() : () -> i64
      %240 = func.call @cc_intern(%238, %239) : (i64, i64) -> i64
      %241 = func.call @cc_nil_value() : () -> i64
      %242 = func.call @cc_cons(%240, %241) : (i64, i64) -> i64
      %243 = func.call @cc_values_pack(%242) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %244 = arith.addi %240, %__rlasp_stack_elide_zero_10 : i64
      %245 = llvm.mlir.addressof @str21 : !llvm.ptr
      %246 = arith.constant 6 : i64
      %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_intern(%247, %248) : (i64, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_values_pack(%251) : (i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      %253 = llvm.mlir.addressof @str22 : !llvm.ptr
      %254 = arith.constant 3 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_intern(%255, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %261 = llvm.mlir.addressof @str23 : !llvm.ptr
      %262 = arith.constant 4 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_intern(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      func.call @stack_push_pointer(%265) : (i64) -> ()
      %269 = llvm.mlir.addressof @str24 : !llvm.ptr
      %270 = arith.constant 42 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%271) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %272 = func.call @stack_pop_pointer() : () -> i64
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = func.call @cc_cons(%273, %272) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %275 = arith.addi %274, %__rlasp_stack_elide_zero_11 : i64
      %276 = func.call @stack_pop_pointer() : () -> i64
      %277 = func.call @cc_cons(%276, %275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %278 = func.call @stack_pop_pointer() : () -> i64
      %279 = func.call @stack_pop_pointer() : () -> i64
      %280 = func.call @cc_cons(%279, %278) : (i64, i64) -> i64
      func.call @stack_push_pointer(%280) : (i64) -> ()
      %281 = llvm.mlir.addressof @str25 : !llvm.ptr
      %282 = arith.constant 4 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = llvm.mlir.addressof @str26 : !llvm.ptr
      %285 = arith.constant 3 : i64
      %286 = func.call @cc_make_string(%284, %285) : (!llvm.ptr, i64) -> i64
      %287 = func.call @cc_intern(%283, %286) : (i64, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_values_pack(%289) : (i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      %291 = llvm.mlir.addressof @str27 : !llvm.ptr
      %292 = arith.constant 4 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_intern(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_nil_value() : () -> i64
      %297 = func.call @cc_cons(%295, %296) : (i64, i64) -> i64
      %298 = func.call @cc_values_pack(%297) : (i64) -> i64
      func.call @stack_push_pointer(%295) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %299 = func.call @stack_pop_pointer() : () -> i64
      %300 = func.call @stack_pop_pointer() : () -> i64
      %301 = func.call @cc_cons(%300, %299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %302 = arith.addi %301, %__rlasp_stack_elide_zero_12 : i64
      %303 = func.call @stack_pop_pointer() : () -> i64
      %304 = func.call @cc_cons(%303, %302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %305 = func.call @stack_pop_pointer() : () -> i64
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @cc_cons(%306, %305) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %308 = arith.addi %307, %__rlasp_stack_elide_zero_13 : i64
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @cc_cons(%309, %308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %311 = arith.addi %310, %__rlasp_stack_elide_zero_14 : i64
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_cons(%312, %311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = func.call @cc_cons(%315, %314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %317 = arith.addi %316, %__rlasp_stack_elide_zero_15 : i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%318, %317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %320 = arith.addi %319, %__rlasp_stack_elide_zero_16 : i64
      %351 = arith.constant 269090723725314 : i64
      %352 = arith.constant 0 : i64
      %353 = func.call @cc_make_closure(%351, %352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %354 = arith.addi %353, %__rlasp_stack_elide_zero_17 : i64
      %355 = llvm.mlir.addressof @str30 : !llvm.ptr
      %356 = arith.constant 6 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = llvm.mlir.addressof @str31 : !llvm.ptr
      %359 = arith.constant 11 : i64
      %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
      %361 = func.call @cc_intern(%357, %360) : (i64, i64) -> i64
      %362 = func.call @cc_nil_value() : () -> i64
      %363 = func.call @cc_cons(%361, %362) : (i64, i64) -> i64
      %364 = func.call @cc_values_pack(%363) : (i64) -> i64
      func.call @stack_push_pointer(%361) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_cons(%366, %365) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %368 = arith.addi %367, %__rlasp_stack_elide_zero_18 : i64
      %369 = llvm.mlir.addressof @str32 : !llvm.ptr
      %370 = arith.constant 11 : i64
      %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
      %372 = llvm.mlir.addressof @str33 : !llvm.ptr
      %373 = arith.constant 7 : i64
      %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
      %375 = func.call @cc_intern(%371, %374) : (i64, i64) -> i64
      %376 = func.call @cc_nil_value() : () -> i64
      %377 = func.call @cc_cons(%375, %376) : (i64, i64) -> i64
      %378 = func.call @cc_values_pack(%377) : (i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = llvm.mlir.addressof @str34 : !llvm.ptr
      %381 = arith.constant 4 : i64
      %382 = func.call @cc_make_string(%380, %381) : (!llvm.ptr, i64) -> i64
      %383 = llvm.mlir.addressof @str35 : !llvm.ptr
      %384 = arith.constant 7 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = func.call @cc_intern(%382, %385) : (i64, i64) -> i64
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_cons(%386, %387) : (i64, i64) -> i64
      %389 = func.call @cc_values_pack(%388) : (i64) -> i64
      %390 = llvm.mlir.addressof @str36 : !llvm.ptr
      %391 = arith.constant 5 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_intern(%392, %393) : (i64, i64) -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
      %397 = func.call @cc_values_pack(%396) : (i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %398 = arith.addi %394, %__rlasp_stack_elide_zero_19 : i64
      %399 = func.call @cc_nil_value() : () -> i64
      %400 = func.call @cc_errorp(%244) : (i64) -> i64
      %401 = arith.cmpi ne, %400, %399 : i64
      %402 = arith.cmpi eq, %399, %399 : i64
      %403 = arith.andi %401, %402 : i1
      %404 = scf.if %403 -> (i64) {
        scf.yield %244 : i64
      } else {
        scf.yield %399 : i64
      }
      %405 = func.call @cc_errorp(%320) : (i64) -> i64
      %406 = arith.cmpi ne, %405, %399 : i64
      %407 = arith.cmpi eq, %404, %399 : i64
      %408 = arith.andi %406, %407 : i1
      %409 = scf.if %408 -> (i64) {
        scf.yield %320 : i64
      } else {
        scf.yield %404 : i64
      }
      %410 = func.call @cc_errorp(%354) : (i64) -> i64
      %411 = arith.cmpi ne, %410, %399 : i64
      %412 = arith.cmpi eq, %409, %399 : i64
      %413 = arith.andi %411, %412 : i1
      %414 = scf.if %413 -> (i64) {
        scf.yield %354 : i64
      } else {
        scf.yield %409 : i64
      }
      %415 = func.call @cc_errorp(%368) : (i64) -> i64
      %416 = arith.cmpi ne, %415, %399 : i64
      %417 = arith.cmpi eq, %414, %399 : i64
      %418 = arith.andi %416, %417 : i1
      %419 = scf.if %418 -> (i64) {
        scf.yield %368 : i64
      } else {
        scf.yield %414 : i64
      }
      %420 = func.call @cc_errorp(%375) : (i64) -> i64
      %421 = arith.cmpi ne, %420, %399 : i64
      %422 = arith.cmpi eq, %419, %399 : i64
      %423 = arith.andi %421, %422 : i1
      %424 = scf.if %423 -> (i64) {
        scf.yield %375 : i64
      } else {
        scf.yield %419 : i64
      }
      %425 = func.call @cc_errorp(%379) : (i64) -> i64
      %426 = arith.cmpi ne, %425, %399 : i64
      %427 = arith.cmpi eq, %424, %399 : i64
      %428 = arith.andi %426, %427 : i1
      %429 = scf.if %428 -> (i64) {
        scf.yield %379 : i64
      } else {
        scf.yield %424 : i64
      }
      %430 = func.call @cc_errorp(%386) : (i64) -> i64
      %431 = arith.cmpi ne, %430, %399 : i64
      %432 = arith.cmpi eq, %429, %399 : i64
      %433 = arith.andi %431, %432 : i1
      %434 = scf.if %433 -> (i64) {
        scf.yield %386 : i64
      } else {
        scf.yield %429 : i64
      }
      %435 = func.call @cc_errorp(%398) : (i64) -> i64
      %436 = arith.cmpi ne, %435, %399 : i64
      %437 = arith.cmpi eq, %434, %399 : i64
      %438 = arith.andi %436, %437 : i1
      %439 = scf.if %438 -> (i64) {
        scf.yield %398 : i64
      } else {
        scf.yield %434 : i64
      }
      %440 = arith.cmpi ne, %439, %399 : i64
      scf.if %440 {
        func.call @stack_push_pointer(%439) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%244) : (i64) -> ()
        func.call @stack_push_pointer(%320) : (i64) -> ()
        func.call @stack_push_pointer(%354) : (i64) -> ()
        func.call @stack_push_pointer(%368) : (i64) -> ()
        func.call @stack_push_pointer(%375) : (i64) -> ()
        func.call @stack_push_pointer(%379) : (i64) -> ()
        func.call @stack_push_pointer(%386) : (i64) -> ()
        func.call @stack_push_pointer(%398) : (i64) -> ()
        %441 = llvm.mlir.addressof @str37 : !llvm.ptr
        %442 = func.call @cc_make_function_ref_const(%441) : (!llvm.ptr) -> i64
        %443 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%442, %443) : (i64, i64) -> ()
      }
      %444 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %444 : i64
    }
    %445 = func.call @cc_nil_value() : () -> i64
    %446 = func.call @cc_errorp(%235) : (i64) -> i64
    %447 = arith.cmpi ne, %446, %445 : i64
    %448 = scf.if %447 -> (i64) {
      scf.yield %235 : i64
    } else {
      %449 = llvm.mlir.addressof @str38 : !llvm.ptr
      %450 = arith.constant 10 : i64
      %451 = func.call @cc_make_string(%449, %450) : (!llvm.ptr, i64) -> i64
      %452 = func.call @cc_nil_value() : () -> i64
      %453 = func.call @cc_intern(%451, %452) : (i64, i64) -> i64
      %454 = func.call @cc_nil_value() : () -> i64
      %455 = func.call @cc_cons(%453, %454) : (i64, i64) -> i64
      %456 = func.call @cc_values_pack(%455) : (i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %457 = arith.addi %453, %__rlasp_stack_elide_zero_20 : i64
      %458 = llvm.mlir.addressof @str39 : !llvm.ptr
      %459 = arith.constant 6 : i64
      %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
      %461 = func.call @cc_nil_value() : () -> i64
      %462 = func.call @cc_intern(%460, %461) : (i64, i64) -> i64
      %463 = func.call @cc_nil_value() : () -> i64
      %464 = func.call @cc_cons(%462, %463) : (i64, i64) -> i64
      %465 = func.call @cc_values_pack(%464) : (i64) -> i64
      func.call @stack_push_pointer(%462) : (i64) -> ()
      %466 = llvm.mlir.addressof @str40 : !llvm.ptr
      %467 = arith.constant 3 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_intern(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_nil_value() : () -> i64
      %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
      %473 = func.call @cc_values_pack(%472) : (i64) -> i64
      func.call @stack_push_pointer(%470) : (i64) -> ()
      %474 = llvm.mlir.addressof @str41 : !llvm.ptr
      %475 = arith.constant 4 : i64
      %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
      %477 = func.call @cc_nil_value() : () -> i64
      %478 = func.call @cc_intern(%476, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %482 = llvm.mlir.addressof @str42 : !llvm.ptr
      %483 = arith.constant 42 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%484) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @stack_pop_pointer() : () -> i64
      %487 = func.call @cc_cons(%486, %485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %488 = arith.addi %487, %__rlasp_stack_elide_zero_21 : i64
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @cc_cons(%489, %488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @cc_cons(%492, %491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%493) : (i64) -> ()
      %494 = llvm.mlir.addressof @str43 : !llvm.ptr
      %495 = arith.constant 9 : i64
      %496 = func.call @cc_make_string(%494, %495) : (!llvm.ptr, i64) -> i64
      %497 = llvm.mlir.addressof @str44 : !llvm.ptr
      %498 = arith.constant 11 : i64
      %499 = func.call @cc_make_string(%497, %498) : (!llvm.ptr, i64) -> i64
      %500 = func.call @cc_intern(%496, %499) : (i64, i64) -> i64
      %501 = func.call @cc_nil_value() : () -> i64
      %502 = func.call @cc_cons(%500, %501) : (i64, i64) -> i64
      %503 = func.call @cc_values_pack(%502) : (i64) -> i64
      func.call @stack_push_pointer(%500) : (i64) -> ()
      %504 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%504) : (i64) -> ()
      %505 = llvm.mlir.addressof @str45 : !llvm.ptr
      %506 = arith.constant 4 : i64
      %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
      %508 = llvm.mlir.addressof @str46 : !llvm.ptr
      %509 = arith.constant 3 : i64
      %510 = func.call @cc_make_string(%508, %509) : (!llvm.ptr, i64) -> i64
      %511 = func.call @cc_intern(%507, %510) : (i64, i64) -> i64
      %512 = func.call @cc_nil_value() : () -> i64
      %513 = func.call @cc_cons(%511, %512) : (i64, i64) -> i64
      %514 = func.call @cc_values_pack(%513) : (i64) -> i64
      func.call @stack_push_pointer(%511) : (i64) -> ()
      %515 = llvm.mlir.addressof @str47 : !llvm.ptr
      %516 = arith.constant 4 : i64
      %517 = func.call @cc_make_string(%515, %516) : (!llvm.ptr, i64) -> i64
      %518 = func.call @cc_nil_value() : () -> i64
      %519 = func.call @cc_intern(%517, %518) : (i64, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_values_pack(%521) : (i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @cc_cons(%524, %523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %526 = arith.addi %525, %__rlasp_stack_elide_zero_22 : i64
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @cc_cons(%527, %526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @stack_pop_pointer() : () -> i64
      %531 = func.call @cc_cons(%530, %529) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %532 = arith.addi %531, %__rlasp_stack_elide_zero_23 : i64
      %533 = func.call @stack_pop_pointer() : () -> i64
      %534 = func.call @cc_cons(%533, %532) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %535 = arith.addi %534, %__rlasp_stack_elide_zero_24 : i64
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = func.call @cc_cons(%536, %535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_cons(%539, %538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %541 = arith.addi %540, %__rlasp_stack_elide_zero_25 : i64
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @cc_cons(%542, %541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %544 = arith.addi %543, %__rlasp_stack_elide_zero_26 : i64
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @cc_cons(%545, %544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @cc_cons(%548, %547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %550 = arith.addi %549, %__rlasp_stack_elide_zero_27 : i64
      %551 = func.call @stack_pop_pointer() : () -> i64
      %552 = func.call @cc_cons(%551, %550) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %553 = arith.addi %552, %__rlasp_stack_elide_zero_28 : i64
      %589 = arith.constant 269090723725315 : i64
      %590 = arith.constant 0 : i64
      %591 = func.call @cc_make_closure(%589, %590) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %592 = arith.addi %591, %__rlasp_stack_elide_zero_29 : i64
      %593 = llvm.mlir.addressof @str50 : !llvm.ptr
      %594 = arith.constant 6 : i64
      %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
      %596 = llvm.mlir.addressof @str51 : !llvm.ptr
      %597 = arith.constant 11 : i64
      %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
      %599 = func.call @cc_intern(%595, %598) : (i64, i64) -> i64
      %600 = func.call @cc_nil_value() : () -> i64
      %601 = func.call @cc_cons(%599, %600) : (i64, i64) -> i64
      %602 = func.call @cc_values_pack(%601) : (i64) -> i64
      func.call @stack_push_pointer(%599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %606 = arith.addi %605, %__rlasp_stack_elide_zero_30 : i64
      %607 = llvm.mlir.addressof @str52 : !llvm.ptr
      %608 = arith.constant 11 : i64
      %609 = func.call @cc_make_string(%607, %608) : (!llvm.ptr, i64) -> i64
      %610 = llvm.mlir.addressof @str53 : !llvm.ptr
      %611 = arith.constant 7 : i64
      %612 = func.call @cc_make_string(%610, %611) : (!llvm.ptr, i64) -> i64
      %613 = func.call @cc_intern(%609, %612) : (i64, i64) -> i64
      %614 = func.call @cc_nil_value() : () -> i64
      %615 = func.call @cc_cons(%613, %614) : (i64, i64) -> i64
      %616 = func.call @cc_values_pack(%615) : (i64) -> i64
      %617 = func.call @cc_nil_value() : () -> i64
      %618 = llvm.mlir.addressof @str54 : !llvm.ptr
      %619 = arith.constant 4 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = llvm.mlir.addressof @str55 : !llvm.ptr
      %622 = arith.constant 7 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = func.call @cc_intern(%620, %623) : (i64, i64) -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      %627 = func.call @cc_values_pack(%626) : (i64) -> i64
      %628 = llvm.mlir.addressof @str56 : !llvm.ptr
      %629 = arith.constant 5 : i64
      %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_intern(%630, %631) : (i64, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_values_pack(%634) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %636 = arith.addi %632, %__rlasp_stack_elide_zero_31 : i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_errorp(%457) : (i64) -> i64
      %639 = arith.cmpi ne, %638, %637 : i64
      %640 = arith.cmpi eq, %637, %637 : i64
      %641 = arith.andi %639, %640 : i1
      %642 = scf.if %641 -> (i64) {
        scf.yield %457 : i64
      } else {
        scf.yield %637 : i64
      }
      %643 = func.call @cc_errorp(%553) : (i64) -> i64
      %644 = arith.cmpi ne, %643, %637 : i64
      %645 = arith.cmpi eq, %642, %637 : i64
      %646 = arith.andi %644, %645 : i1
      %647 = scf.if %646 -> (i64) {
        scf.yield %553 : i64
      } else {
        scf.yield %642 : i64
      }
      %648 = func.call @cc_errorp(%592) : (i64) -> i64
      %649 = arith.cmpi ne, %648, %637 : i64
      %650 = arith.cmpi eq, %647, %637 : i64
      %651 = arith.andi %649, %650 : i1
      %652 = scf.if %651 -> (i64) {
        scf.yield %592 : i64
      } else {
        scf.yield %647 : i64
      }
      %653 = func.call @cc_errorp(%606) : (i64) -> i64
      %654 = arith.cmpi ne, %653, %637 : i64
      %655 = arith.cmpi eq, %652, %637 : i64
      %656 = arith.andi %654, %655 : i1
      %657 = scf.if %656 -> (i64) {
        scf.yield %606 : i64
      } else {
        scf.yield %652 : i64
      }
      %658 = func.call @cc_errorp(%613) : (i64) -> i64
      %659 = arith.cmpi ne, %658, %637 : i64
      %660 = arith.cmpi eq, %657, %637 : i64
      %661 = arith.andi %659, %660 : i1
      %662 = scf.if %661 -> (i64) {
        scf.yield %613 : i64
      } else {
        scf.yield %657 : i64
      }
      %663 = func.call @cc_errorp(%617) : (i64) -> i64
      %664 = arith.cmpi ne, %663, %637 : i64
      %665 = arith.cmpi eq, %662, %637 : i64
      %666 = arith.andi %664, %665 : i1
      %667 = scf.if %666 -> (i64) {
        scf.yield %617 : i64
      } else {
        scf.yield %662 : i64
      }
      %668 = func.call @cc_errorp(%624) : (i64) -> i64
      %669 = arith.cmpi ne, %668, %637 : i64
      %670 = arith.cmpi eq, %667, %637 : i64
      %671 = arith.andi %669, %670 : i1
      %672 = scf.if %671 -> (i64) {
        scf.yield %624 : i64
      } else {
        scf.yield %667 : i64
      }
      %673 = func.call @cc_errorp(%636) : (i64) -> i64
      %674 = arith.cmpi ne, %673, %637 : i64
      %675 = arith.cmpi eq, %672, %637 : i64
      %676 = arith.andi %674, %675 : i1
      %677 = scf.if %676 -> (i64) {
        scf.yield %636 : i64
      } else {
        scf.yield %672 : i64
      }
      %678 = arith.cmpi ne, %677, %637 : i64
      scf.if %678 {
        func.call @stack_push_pointer(%677) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%457) : (i64) -> ()
        func.call @stack_push_pointer(%553) : (i64) -> ()
        func.call @stack_push_pointer(%592) : (i64) -> ()
        func.call @stack_push_pointer(%606) : (i64) -> ()
        func.call @stack_push_pointer(%613) : (i64) -> ()
        func.call @stack_push_pointer(%617) : (i64) -> ()
        func.call @stack_push_pointer(%624) : (i64) -> ()
        func.call @stack_push_pointer(%636) : (i64) -> ()
        %679 = llvm.mlir.addressof @str57 : !llvm.ptr
        %680 = func.call @cc_make_function_ref_const(%679) : (!llvm.ptr) -> i64
        %681 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%680, %681) : (i64, i64) -> ()
      }
      %682 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %682 : i64
    }
    %683 = func.call @cc_nil_value() : () -> i64
    %684 = func.call @cc_errorp(%448) : (i64) -> i64
    %685 = arith.cmpi ne, %684, %683 : i64
    %686 = scf.if %685 -> (i64) {
      scf.yield %448 : i64
    } else {
      %687 = llvm.mlir.addressof @str58 : !llvm.ptr
      %688 = arith.constant 35 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = func.call @cc_nil_value() : () -> i64
      %691 = func.call @cc_intern(%689, %690) : (i64, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_cons(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_values_pack(%693) : (i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %695 = arith.addi %691, %__rlasp_stack_elide_zero_32 : i64
      %696 = llvm.mlir.addressof @str59 : !llvm.ptr
      %697 = arith.constant 3 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_intern(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_cons(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_values_pack(%702) : (i64) -> i64
      func.call @stack_push_pointer(%700) : (i64) -> ()
      %704 = llvm.mlir.addressof @str60 : !llvm.ptr
      %705 = arith.constant 3 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = func.call @cc_nil_value() : () -> i64
      %708 = func.call @cc_intern(%706, %707) : (i64, i64) -> i64
      %709 = func.call @cc_nil_value() : () -> i64
      %710 = func.call @cc_cons(%708, %709) : (i64, i64) -> i64
      %711 = func.call @cc_values_pack(%710) : (i64) -> i64
      func.call @stack_push_pointer(%708) : (i64) -> ()
      %712 = llvm.mlir.addressof @str61 : !llvm.ptr
      %713 = arith.constant 3 : i64
      %714 = func.call @cc_make_string(%712, %713) : (!llvm.ptr, i64) -> i64
      %715 = func.call @cc_nil_value() : () -> i64
      %716 = func.call @cc_intern(%714, %715) : (i64, i64) -> i64
      %717 = func.call @cc_nil_value() : () -> i64
      %718 = func.call @cc_cons(%716, %717) : (i64, i64) -> i64
      %719 = func.call @cc_values_pack(%718) : (i64) -> i64
      func.call @stack_push_pointer(%716) : (i64) -> ()
      %720 = llvm.mlir.addressof @str62 : !llvm.ptr
      %721 = arith.constant 10 : i64
      %722 = func.call @cc_make_string(%720, %721) : (!llvm.ptr, i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_intern(%722, %723) : (i64, i64) -> i64
      %725 = func.call @cc_nil_value() : () -> i64
      %726 = func.call @cc_cons(%724, %725) : (i64, i64) -> i64
      %727 = func.call @cc_values_pack(%726) : (i64) -> i64
      func.call @stack_push_pointer(%724) : (i64) -> ()
      %728 = llvm.mlir.addressof @str63 : !llvm.ptr
      %729 = arith.constant 26 : i64
      %730 = func.call @cc_make_string(%728, %729) : (!llvm.ptr, i64) -> i64
      %731 = llvm.mlir.addressof @str64 : !llvm.ptr
      %732 = arith.constant 11 : i64
      %733 = func.call @cc_make_string(%731, %732) : (!llvm.ptr, i64) -> i64
      %734 = func.call @cc_intern(%730, %733) : (i64, i64) -> i64
      %735 = func.call @cc_nil_value() : () -> i64
      %736 = func.call @cc_cons(%734, %735) : (i64, i64) -> i64
      %737 = func.call @cc_values_pack(%736) : (i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %738 = llvm.mlir.addressof @str65 : !llvm.ptr
      %739 = arith.constant 42 : i64
      %740 = func.call @cc_make_string(%738, %739) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @stack_pop_pointer() : () -> i64
      %743 = func.call @cc_cons(%742, %741) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %744 = arith.addi %743, %__rlasp_stack_elide_zero_33 : i64
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @cc_cons(%745, %744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%746) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%748, %747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %750 = arith.addi %749, %__rlasp_stack_elide_zero_34 : i64
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_cons(%751, %750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%752) : (i64) -> ()
      %753 = llvm.mlir.addressof @str66 : !llvm.ptr
      %754 = arith.constant 7 : i64
      %755 = func.call @cc_make_string(%753, %754) : (!llvm.ptr, i64) -> i64
      %756 = func.call @cc_nil_value() : () -> i64
      %757 = func.call @cc_intern(%755, %756) : (i64, i64) -> i64
      %758 = func.call @cc_nil_value() : () -> i64
      %759 = func.call @cc_cons(%757, %758) : (i64, i64) -> i64
      %760 = func.call @cc_values_pack(%759) : (i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      %761 = llvm.mlir.addressof @str67 : !llvm.ptr
      %762 = arith.constant 42 : i64
      %763 = func.call @cc_make_string(%761, %762) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%763) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %764 = func.call @stack_pop_pointer() : () -> i64
      %765 = func.call @stack_pop_pointer() : () -> i64
      %766 = func.call @cc_cons(%765, %764) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %767 = arith.addi %766, %__rlasp_stack_elide_zero_35 : i64
      %768 = func.call @stack_pop_pointer() : () -> i64
      %769 = func.call @cc_cons(%768, %767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @cc_cons(%771, %770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %773 = arith.addi %772, %__rlasp_stack_elide_zero_36 : i64
      %774 = func.call @stack_pop_pointer() : () -> i64
      %775 = func.call @cc_cons(%774, %773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%775) : (i64) -> ()
      %776 = llvm.mlir.addressof @str68 : !llvm.ptr
      %777 = arith.constant 1 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      %779 = llvm.mlir.addressof @str69 : !llvm.ptr
      %780 = arith.constant 11 : i64
      %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
      %782 = func.call @cc_intern(%778, %781) : (i64, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_cons(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_values_pack(%784) : (i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      %786 = llvm.mlir.addressof @str70 : !llvm.ptr
      %787 = arith.constant 9 : i64
      %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
      %789 = llvm.mlir.addressof @str71 : !llvm.ptr
      %790 = arith.constant 11 : i64
      %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
      %792 = func.call @cc_intern(%788, %791) : (i64, i64) -> i64
      %793 = func.call @cc_nil_value() : () -> i64
      %794 = func.call @cc_cons(%792, %793) : (i64, i64) -> i64
      %795 = func.call @cc_values_pack(%794) : (i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %796 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%796) : (i64) -> ()
      %797 = llvm.mlir.addressof @str72 : !llvm.ptr
      %798 = arith.constant 4 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = llvm.mlir.addressof @str73 : !llvm.ptr
      %801 = arith.constant 3 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = func.call @cc_intern(%799, %802) : (i64, i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
      %806 = func.call @cc_values_pack(%805) : (i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %807 = llvm.mlir.addressof @str74 : !llvm.ptr
      %808 = arith.constant 10 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_nil_value() : () -> i64
      %811 = func.call @cc_intern(%809, %810) : (i64, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_values_pack(%813) : (i64) -> i64
      func.call @stack_push_pointer(%811) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = func.call @stack_pop_pointer() : () -> i64
      %817 = func.call @cc_cons(%816, %815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %818 = arith.addi %817, %__rlasp_stack_elide_zero_37 : i64
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @cc_cons(%819, %818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @cc_cons(%822, %821) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %824 = arith.addi %823, %__rlasp_stack_elide_zero_38 : i64
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %827 = arith.addi %826, %__rlasp_stack_elide_zero_39 : i64
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %830 = llvm.mlir.addressof @str75 : !llvm.ptr
      %831 = arith.constant 9 : i64
      %832 = func.call @cc_make_string(%830, %831) : (!llvm.ptr, i64) -> i64
      %833 = llvm.mlir.addressof @str76 : !llvm.ptr
      %834 = arith.constant 11 : i64
      %835 = func.call @cc_make_string(%833, %834) : (!llvm.ptr, i64) -> i64
      %836 = func.call @cc_intern(%832, %835) : (i64, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_values_pack(%838) : (i64) -> i64
      func.call @stack_push_pointer(%836) : (i64) -> ()
      %840 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%840) : (i64) -> ()
      %841 = llvm.mlir.addressof @str77 : !llvm.ptr
      %842 = arith.constant 4 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = llvm.mlir.addressof @str78 : !llvm.ptr
      %845 = arith.constant 3 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = func.call @cc_intern(%843, %846) : (i64, i64) -> i64
      %848 = func.call @cc_nil_value() : () -> i64
      %849 = func.call @cc_cons(%847, %848) : (i64, i64) -> i64
      %850 = func.call @cc_values_pack(%849) : (i64) -> i64
      func.call @stack_push_pointer(%847) : (i64) -> ()
      %851 = llvm.mlir.addressof @str79 : !llvm.ptr
      %852 = arith.constant 7 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = func.call @cc_nil_value() : () -> i64
      %855 = func.call @cc_intern(%853, %854) : (i64, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_cons(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_values_pack(%857) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @stack_pop_pointer() : () -> i64
      %861 = func.call @cc_cons(%860, %859) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %862 = arith.addi %861, %__rlasp_stack_elide_zero_40 : i64
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_cons(%863, %862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %865 = func.call @stack_pop_pointer() : () -> i64
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = func.call @cc_cons(%866, %865) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %868 = arith.addi %867, %__rlasp_stack_elide_zero_41 : i64
      %869 = func.call @stack_pop_pointer() : () -> i64
      %870 = func.call @cc_cons(%869, %868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %871 = arith.addi %870, %__rlasp_stack_elide_zero_42 : i64
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @cc_cons(%872, %871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %874 = func.call @stack_pop_pointer() : () -> i64
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @cc_cons(%875, %874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %877 = arith.addi %876, %__rlasp_stack_elide_zero_43 : i64
      %878 = func.call @stack_pop_pointer() : () -> i64
      %879 = func.call @cc_cons(%878, %877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %880 = arith.addi %879, %__rlasp_stack_elide_zero_44 : i64
      %881 = func.call @stack_pop_pointer() : () -> i64
      %882 = func.call @cc_cons(%881, %880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @stack_pop_pointer() : () -> i64
      %885 = func.call @cc_cons(%884, %883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %886 = arith.addi %885, %__rlasp_stack_elide_zero_45 : i64
      %887 = func.call @stack_pop_pointer() : () -> i64
      %888 = func.call @cc_cons(%887, %886) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %889 = arith.addi %888, %__rlasp_stack_elide_zero_46 : i64
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_cons(%890, %889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %895 = arith.addi %894, %__rlasp_stack_elide_zero_47 : i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%896, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%899, %898) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %901 = arith.addi %900, %__rlasp_stack_elide_zero_48 : i64
      %902 = func.call @stack_pop_pointer() : () -> i64
      %903 = func.call @cc_cons(%902, %901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %904 = arith.addi %903, %__rlasp_stack_elide_zero_49 : i64
      %997 = arith.constant 269090723725316 : i64
      %998 = arith.constant 0 : i64
      %999 = func.call @cc_make_closure(%997, %998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1000 = arith.addi %999, %__rlasp_stack_elide_zero_50 : i64
      %1001 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1002 = arith.constant 1 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      %1004 = func.call @cc_nil_value() : () -> i64
      %1005 = func.call @cc_intern(%1003, %1004) : (i64, i64) -> i64
      %1006 = func.call @cc_nil_value() : () -> i64
      %1007 = func.call @cc_cons(%1005, %1006) : (i64, i64) -> i64
      %1008 = func.call @cc_values_pack(%1007) : (i64) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1009 = func.call @stack_pop_pointer() : () -> i64
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = func.call @cc_cons(%1010, %1009) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1012 = arith.addi %1011, %__rlasp_stack_elide_zero_51 : i64
      %1013 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1014 = arith.constant 11 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1017 = arith.constant 7 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = func.call @cc_intern(%1015, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1025 = arith.constant 4 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1028 = arith.constant 7 : i64
      %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
      %1030 = func.call @cc_intern(%1026, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_nil_value() : () -> i64
      %1032 = func.call @cc_cons(%1030, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_values_pack(%1032) : (i64) -> i64
      %1034 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1035 = arith.constant 6 : i64
      %1036 = func.call @cc_make_string(%1034, %1035) : (!llvm.ptr, i64) -> i64
      %1037 = func.call @cc_nil_value() : () -> i64
      %1038 = func.call @cc_intern(%1036, %1037) : (i64, i64) -> i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_cons(%1038, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_values_pack(%1040) : (i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1042 = arith.addi %1038, %__rlasp_stack_elide_zero_52 : i64
      %1043 = func.call @cc_nil_value() : () -> i64
      %1044 = func.call @cc_errorp(%695) : (i64) -> i64
      %1045 = arith.cmpi ne, %1044, %1043 : i64
      %1046 = arith.cmpi eq, %1043, %1043 : i64
      %1047 = arith.andi %1045, %1046 : i1
      %1048 = scf.if %1047 -> (i64) {
        scf.yield %695 : i64
      } else {
        scf.yield %1043 : i64
      }
      %1049 = func.call @cc_errorp(%904) : (i64) -> i64
      %1050 = arith.cmpi ne, %1049, %1043 : i64
      %1051 = arith.cmpi eq, %1048, %1043 : i64
      %1052 = arith.andi %1050, %1051 : i1
      %1053 = scf.if %1052 -> (i64) {
        scf.yield %904 : i64
      } else {
        scf.yield %1048 : i64
      }
      %1054 = func.call @cc_errorp(%1000) : (i64) -> i64
      %1055 = arith.cmpi ne, %1054, %1043 : i64
      %1056 = arith.cmpi eq, %1053, %1043 : i64
      %1057 = arith.andi %1055, %1056 : i1
      %1058 = scf.if %1057 -> (i64) {
        scf.yield %1000 : i64
      } else {
        scf.yield %1053 : i64
      }
      %1059 = func.call @cc_errorp(%1012) : (i64) -> i64
      %1060 = arith.cmpi ne, %1059, %1043 : i64
      %1061 = arith.cmpi eq, %1058, %1043 : i64
      %1062 = arith.andi %1060, %1061 : i1
      %1063 = scf.if %1062 -> (i64) {
        scf.yield %1012 : i64
      } else {
        scf.yield %1058 : i64
      }
      %1064 = func.call @cc_errorp(%1019) : (i64) -> i64
      %1065 = arith.cmpi ne, %1064, %1043 : i64
      %1066 = arith.cmpi eq, %1063, %1043 : i64
      %1067 = arith.andi %1065, %1066 : i1
      %1068 = scf.if %1067 -> (i64) {
        scf.yield %1019 : i64
      } else {
        scf.yield %1063 : i64
      }
      %1069 = func.call @cc_errorp(%1023) : (i64) -> i64
      %1070 = arith.cmpi ne, %1069, %1043 : i64
      %1071 = arith.cmpi eq, %1068, %1043 : i64
      %1072 = arith.andi %1070, %1071 : i1
      %1073 = scf.if %1072 -> (i64) {
        scf.yield %1023 : i64
      } else {
        scf.yield %1068 : i64
      }
      %1074 = func.call @cc_errorp(%1030) : (i64) -> i64
      %1075 = arith.cmpi ne, %1074, %1043 : i64
      %1076 = arith.cmpi eq, %1073, %1043 : i64
      %1077 = arith.andi %1075, %1076 : i1
      %1078 = scf.if %1077 -> (i64) {
        scf.yield %1030 : i64
      } else {
        scf.yield %1073 : i64
      }
      %1079 = func.call @cc_errorp(%1042) : (i64) -> i64
      %1080 = arith.cmpi ne, %1079, %1043 : i64
      %1081 = arith.cmpi eq, %1078, %1043 : i64
      %1082 = arith.andi %1080, %1081 : i1
      %1083 = scf.if %1082 -> (i64) {
        scf.yield %1042 : i64
      } else {
        scf.yield %1078 : i64
      }
      %1084 = arith.cmpi ne, %1083, %1043 : i64
      scf.if %1084 {
        func.call @stack_push_pointer(%1083) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%695) : (i64) -> ()
        func.call @stack_push_pointer(%904) : (i64) -> ()
        func.call @stack_push_pointer(%1000) : (i64) -> ()
        func.call @stack_push_pointer(%1012) : (i64) -> ()
        func.call @stack_push_pointer(%1019) : (i64) -> ()
        func.call @stack_push_pointer(%1023) : (i64) -> ()
        func.call @stack_push_pointer(%1030) : (i64) -> ()
        func.call @stack_push_pointer(%1042) : (i64) -> ()
        %1085 = llvm.mlir.addressof @str91 : !llvm.ptr
        %1086 = func.call @cc_make_function_ref_const(%1085) : (!llvm.ptr) -> i64
        %1087 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1086, %1087) : (i64, i64) -> ()
      }
      %1088 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1088 : i64
    }
    %1089 = func.call @cc_nil_value() : () -> i64
    %1090 = func.call @cc_errorp(%686) : (i64) -> i64
    %1091 = arith.cmpi ne, %1090, %1089 : i64
    %1092 = scf.if %1091 -> (i64) {
      scf.yield %686 : i64
    } else {
      %1093 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1094 = arith.constant 14 : i64
      %1095 = func.call @cc_make_string(%1093, %1094) : (!llvm.ptr, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_intern(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_nil_value() : () -> i64
      %1099 = func.call @cc_cons(%1097, %1098) : (i64, i64) -> i64
      %1100 = func.call @cc_values_pack(%1099) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1101 = arith.addi %1097, %__rlasp_stack_elide_zero_53 : i64
      %1102 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1103 = arith.constant 3 : i64
      %1104 = func.call @cc_make_string(%1102, %1103) : (!llvm.ptr, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_intern(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_nil_value() : () -> i64
      %1108 = func.call @cc_cons(%1106, %1107) : (i64, i64) -> i64
      %1109 = func.call @cc_values_pack(%1108) : (i64) -> i64
      func.call @stack_push_pointer(%1106) : (i64) -> ()
      %1110 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1111 = arith.constant 3 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_intern(%1112, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1118 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1119 = arith.constant 9 : i64
      %1120 = func.call @cc_make_string(%1118, %1119) : (!llvm.ptr, i64) -> i64
      %1121 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1122 = arith.constant 11 : i64
      %1123 = func.call @cc_make_string(%1121, %1122) : (!llvm.ptr, i64) -> i64
      %1124 = func.call @cc_intern(%1120, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_cons(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_values_pack(%1126) : (i64) -> i64
      func.call @stack_push_pointer(%1124) : (i64) -> ()
      %1128 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1128) : (i64) -> ()
      %1129 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1130 = arith.constant 4 : i64
      %1131 = func.call @cc_make_string(%1129, %1130) : (!llvm.ptr, i64) -> i64
      %1132 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1133 = arith.constant 3 : i64
      %1134 = func.call @cc_make_string(%1132, %1133) : (!llvm.ptr, i64) -> i64
      %1135 = func.call @cc_intern(%1131, %1134) : (i64, i64) -> i64
      %1136 = func.call @cc_nil_value() : () -> i64
      %1137 = func.call @cc_cons(%1135, %1136) : (i64, i64) -> i64
      %1138 = func.call @cc_values_pack(%1137) : (i64) -> i64
      func.call @stack_push_pointer(%1135) : (i64) -> ()
      %1139 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1140 = arith.constant 42 : i64
      %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @cc_cons(%1143, %1142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1145 = arith.addi %1144, %__rlasp_stack_elide_zero_54 : i64
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @cc_cons(%1146, %1145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @cc_cons(%1149, %1148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1151 = arith.addi %1150, %__rlasp_stack_elide_zero_55 : i64
      %1152 = func.call @stack_pop_pointer() : () -> i64
      %1153 = func.call @cc_cons(%1152, %1151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1154 = arith.addi %1153, %__rlasp_stack_elide_zero_56 : i64
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @cc_cons(%1155, %1154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @stack_pop_pointer() : () -> i64
      %1159 = func.call @cc_cons(%1158, %1157) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1160 = arith.addi %1159, %__rlasp_stack_elide_zero_57 : i64
      %1161 = func.call @stack_pop_pointer() : () -> i64
      %1162 = func.call @cc_cons(%1161, %1160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @stack_pop_pointer() : () -> i64
      %1165 = func.call @cc_cons(%1164, %1163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1166 = arith.addi %1165, %__rlasp_stack_elide_zero_58 : i64
      %1167 = func.call @stack_pop_pointer() : () -> i64
      %1168 = func.call @cc_cons(%1167, %1166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1169 = arith.addi %1168, %__rlasp_stack_elide_zero_59 : i64
      %1202 = arith.constant 269090723725317 : i64
      %1203 = arith.constant 0 : i64
      %1204 = func.call @cc_make_closure(%1202, %1203) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1205 = arith.addi %1204, %__rlasp_stack_elide_zero_60 : i64
      %1206 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1207 = arith.constant 1 : i64
      %1208 = func.call @cc_make_string(%1206, %1207) : (!llvm.ptr, i64) -> i64
      %1209 = func.call @cc_nil_value() : () -> i64
      %1210 = func.call @cc_intern(%1208, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_nil_value() : () -> i64
      %1212 = func.call @cc_cons(%1210, %1211) : (i64, i64) -> i64
      %1213 = func.call @cc_values_pack(%1212) : (i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1214 = func.call @stack_pop_pointer() : () -> i64
      %1215 = func.call @stack_pop_pointer() : () -> i64
      %1216 = func.call @cc_cons(%1215, %1214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1217 = arith.addi %1216, %__rlasp_stack_elide_zero_61 : i64
      %1218 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1219 = arith.constant 11 : i64
      %1220 = func.call @cc_make_string(%1218, %1219) : (!llvm.ptr, i64) -> i64
      %1221 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1222 = arith.constant 7 : i64
      %1223 = func.call @cc_make_string(%1221, %1222) : (!llvm.ptr, i64) -> i64
      %1224 = func.call @cc_intern(%1220, %1223) : (i64, i64) -> i64
      %1225 = func.call @cc_nil_value() : () -> i64
      %1226 = func.call @cc_cons(%1224, %1225) : (i64, i64) -> i64
      %1227 = func.call @cc_values_pack(%1226) : (i64) -> i64
      %1228 = func.call @cc_nil_value() : () -> i64
      %1229 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1230 = arith.constant 4 : i64
      %1231 = func.call @cc_make_string(%1229, %1230) : (!llvm.ptr, i64) -> i64
      %1232 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1233 = arith.constant 7 : i64
      %1234 = func.call @cc_make_string(%1232, %1233) : (!llvm.ptr, i64) -> i64
      %1235 = func.call @cc_intern(%1231, %1234) : (i64, i64) -> i64
      %1236 = func.call @cc_nil_value() : () -> i64
      %1237 = func.call @cc_cons(%1235, %1236) : (i64, i64) -> i64
      %1238 = func.call @cc_values_pack(%1237) : (i64) -> i64
      %1239 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1240 = arith.constant 6 : i64
      %1241 = func.call @cc_make_string(%1239, %1240) : (!llvm.ptr, i64) -> i64
      %1242 = func.call @cc_nil_value() : () -> i64
      %1243 = func.call @cc_intern(%1241, %1242) : (i64, i64) -> i64
      %1244 = func.call @cc_nil_value() : () -> i64
      %1245 = func.call @cc_cons(%1243, %1244) : (i64, i64) -> i64
      %1246 = func.call @cc_values_pack(%1245) : (i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1247 = arith.addi %1243, %__rlasp_stack_elide_zero_62 : i64
      %1248 = func.call @cc_nil_value() : () -> i64
      %1249 = func.call @cc_errorp(%1101) : (i64) -> i64
      %1250 = arith.cmpi ne, %1249, %1248 : i64
      %1251 = arith.cmpi eq, %1248, %1248 : i64
      %1252 = arith.andi %1250, %1251 : i1
      %1253 = scf.if %1252 -> (i64) {
        scf.yield %1101 : i64
      } else {
        scf.yield %1248 : i64
      }
      %1254 = func.call @cc_errorp(%1169) : (i64) -> i64
      %1255 = arith.cmpi ne, %1254, %1248 : i64
      %1256 = arith.cmpi eq, %1253, %1248 : i64
      %1257 = arith.andi %1255, %1256 : i1
      %1258 = scf.if %1257 -> (i64) {
        scf.yield %1169 : i64
      } else {
        scf.yield %1253 : i64
      }
      %1259 = func.call @cc_errorp(%1205) : (i64) -> i64
      %1260 = arith.cmpi ne, %1259, %1248 : i64
      %1261 = arith.cmpi eq, %1258, %1248 : i64
      %1262 = arith.andi %1260, %1261 : i1
      %1263 = scf.if %1262 -> (i64) {
        scf.yield %1205 : i64
      } else {
        scf.yield %1258 : i64
      }
      %1264 = func.call @cc_errorp(%1217) : (i64) -> i64
      %1265 = arith.cmpi ne, %1264, %1248 : i64
      %1266 = arith.cmpi eq, %1263, %1248 : i64
      %1267 = arith.andi %1265, %1266 : i1
      %1268 = scf.if %1267 -> (i64) {
        scf.yield %1217 : i64
      } else {
        scf.yield %1263 : i64
      }
      %1269 = func.call @cc_errorp(%1224) : (i64) -> i64
      %1270 = arith.cmpi ne, %1269, %1248 : i64
      %1271 = arith.cmpi eq, %1268, %1248 : i64
      %1272 = arith.andi %1270, %1271 : i1
      %1273 = scf.if %1272 -> (i64) {
        scf.yield %1224 : i64
      } else {
        scf.yield %1268 : i64
      }
      %1274 = func.call @cc_errorp(%1228) : (i64) -> i64
      %1275 = arith.cmpi ne, %1274, %1248 : i64
      %1276 = arith.cmpi eq, %1273, %1248 : i64
      %1277 = arith.andi %1275, %1276 : i1
      %1278 = scf.if %1277 -> (i64) {
        scf.yield %1228 : i64
      } else {
        scf.yield %1273 : i64
      }
      %1279 = func.call @cc_errorp(%1235) : (i64) -> i64
      %1280 = arith.cmpi ne, %1279, %1248 : i64
      %1281 = arith.cmpi eq, %1278, %1248 : i64
      %1282 = arith.andi %1280, %1281 : i1
      %1283 = scf.if %1282 -> (i64) {
        scf.yield %1235 : i64
      } else {
        scf.yield %1278 : i64
      }
      %1284 = func.call @cc_errorp(%1247) : (i64) -> i64
      %1285 = arith.cmpi ne, %1284, %1248 : i64
      %1286 = arith.cmpi eq, %1283, %1248 : i64
      %1287 = arith.andi %1285, %1286 : i1
      %1288 = scf.if %1287 -> (i64) {
        scf.yield %1247 : i64
      } else {
        scf.yield %1283 : i64
      }
      %1289 = arith.cmpi ne, %1288, %1248 : i64
      scf.if %1289 {
        func.call @stack_push_pointer(%1288) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1101) : (i64) -> ()
        func.call @stack_push_pointer(%1169) : (i64) -> ()
        func.call @stack_push_pointer(%1205) : (i64) -> ()
        func.call @stack_push_pointer(%1217) : (i64) -> ()
        func.call @stack_push_pointer(%1224) : (i64) -> ()
        func.call @stack_push_pointer(%1228) : (i64) -> ()
        func.call @stack_push_pointer(%1235) : (i64) -> ()
        func.call @stack_push_pointer(%1247) : (i64) -> ()
        %1290 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1291 = func.call @cc_make_function_ref_const(%1290) : (!llvm.ptr) -> i64
        %1292 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1291, %1292) : (i64, i64) -> ()
      }
      %1293 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1293 : i64
    }
    %1294 = func.call @cc_nil_value() : () -> i64
    %1295 = func.call @cc_errorp(%1092) : (i64) -> i64
    %1296 = arith.cmpi ne, %1295, %1294 : i64
    %1297 = scf.if %1296 -> (i64) {
      scf.yield %1092 : i64
    } else {
      %1298 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1299 = arith.constant 9 : i64
      %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
      %1301 = func.call @cc_nil_value() : () -> i64
      %1302 = func.call @cc_intern(%1300, %1301) : (i64, i64) -> i64
      %1303 = func.call @cc_nil_value() : () -> i64
      %1304 = func.call @cc_cons(%1302, %1303) : (i64, i64) -> i64
      %1305 = func.call @cc_values_pack(%1304) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1306 = arith.addi %1302, %__rlasp_stack_elide_zero_63 : i64
      %1307 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1308 = arith.constant 3 : i64
      %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
      %1310 = func.call @cc_nil_value() : () -> i64
      %1311 = func.call @cc_intern(%1309, %1310) : (i64, i64) -> i64
      %1312 = func.call @cc_nil_value() : () -> i64
      %1313 = func.call @cc_cons(%1311, %1312) : (i64, i64) -> i64
      %1314 = func.call @cc_values_pack(%1313) : (i64) -> i64
      func.call @stack_push_pointer(%1311) : (i64) -> ()
      %1315 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1316 = arith.constant 3 : i64
      %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
      %1318 = func.call @cc_nil_value() : () -> i64
      %1319 = func.call @cc_intern(%1317, %1318) : (i64, i64) -> i64
      %1320 = func.call @cc_nil_value() : () -> i64
      %1321 = func.call @cc_cons(%1319, %1320) : (i64, i64) -> i64
      %1322 = func.call @cc_values_pack(%1321) : (i64) -> i64
      func.call @stack_push_pointer(%1319) : (i64) -> ()
      %1323 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1324 = arith.constant 3 : i64
      %1325 = func.call @cc_make_string(%1323, %1324) : (!llvm.ptr, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_intern(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_nil_value() : () -> i64
      %1329 = func.call @cc_cons(%1327, %1328) : (i64, i64) -> i64
      %1330 = func.call @cc_values_pack(%1329) : (i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1331 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1332 = arith.constant 4 : i64
      %1333 = func.call @cc_make_string(%1331, %1332) : (!llvm.ptr, i64) -> i64
      %1334 = func.call @cc_nil_value() : () -> i64
      %1335 = func.call @cc_intern(%1333, %1334) : (i64, i64) -> i64
      %1336 = func.call @cc_nil_value() : () -> i64
      %1337 = func.call @cc_cons(%1335, %1336) : (i64, i64) -> i64
      %1338 = func.call @cc_values_pack(%1337) : (i64) -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      %1339 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1340 = arith.constant 42 : i64
      %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1342 = func.call @stack_pop_pointer() : () -> i64
      %1343 = func.call @stack_pop_pointer() : () -> i64
      %1344 = func.call @cc_cons(%1343, %1342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1345 = arith.addi %1344, %__rlasp_stack_elide_zero_64 : i64
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @cc_cons(%1346, %1345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1348 = func.call @stack_pop_pointer() : () -> i64
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = func.call @cc_cons(%1349, %1348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1350) : (i64) -> ()
      %1351 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1352 = arith.constant 14 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      %1354 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1355 = arith.constant 11 : i64
      %1356 = func.call @cc_make_string(%1354, %1355) : (!llvm.ptr, i64) -> i64
      %1357 = func.call @cc_intern(%1353, %1356) : (i64, i64) -> i64
      %1358 = func.call @cc_nil_value() : () -> i64
      %1359 = func.call @cc_cons(%1357, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_values_pack(%1359) : (i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1361 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1362 = arith.constant 6 : i64
      %1363 = func.call @cc_make_string(%1361, %1362) : (!llvm.ptr, i64) -> i64
      %1364 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1365 = arith.constant 11 : i64
      %1366 = func.call @cc_make_string(%1364, %1365) : (!llvm.ptr, i64) -> i64
      %1367 = func.call @cc_intern(%1363, %1366) : (i64, i64) -> i64
      %1368 = func.call @cc_nil_value() : () -> i64
      %1369 = func.call @cc_cons(%1367, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_values_pack(%1369) : (i64) -> i64
      func.call @stack_push_pointer(%1367) : (i64) -> ()
      %1371 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1372 = arith.constant 4 : i64
      %1373 = func.call @cc_make_string(%1371, %1372) : (!llvm.ptr, i64) -> i64
      %1374 = func.call @cc_nil_value() : () -> i64
      %1375 = func.call @cc_intern(%1373, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_nil_value() : () -> i64
      %1377 = func.call @cc_cons(%1375, %1376) : (i64, i64) -> i64
      %1378 = func.call @cc_values_pack(%1377) : (i64) -> i64
      func.call @stack_push_pointer(%1375) : (i64) -> ()
      %1379 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1380 = arith.constant 9 : i64
      %1381 = func.call @cc_make_string(%1379, %1380) : (!llvm.ptr, i64) -> i64
      %1382 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1383 = arith.constant 7 : i64
      %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
      %1385 = func.call @cc_intern(%1381, %1384) : (i64, i64) -> i64
      %1386 = func.call @cc_nil_value() : () -> i64
      %1387 = func.call @cc_cons(%1385, %1386) : (i64, i64) -> i64
      %1388 = func.call @cc_values_pack(%1387) : (i64) -> i64
      func.call @stack_push_pointer(%1385) : (i64) -> ()
      %1389 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1390 = arith.constant 5 : i64
      %1391 = func.call @cc_make_string(%1389, %1390) : (!llvm.ptr, i64) -> i64
      %1392 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1393 = arith.constant 7 : i64
      %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
      %1395 = func.call @cc_intern(%1391, %1394) : (i64, i64) -> i64
      %1396 = func.call @cc_nil_value() : () -> i64
      %1397 = func.call @cc_cons(%1395, %1396) : (i64, i64) -> i64
      %1398 = func.call @cc_values_pack(%1397) : (i64) -> i64
      func.call @stack_push_pointer(%1395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1399 = func.call @stack_pop_pointer() : () -> i64
      %1400 = func.call @stack_pop_pointer() : () -> i64
      %1401 = func.call @cc_cons(%1400, %1399) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1402 = arith.addi %1401, %__rlasp_stack_elide_zero_65 : i64
      %1403 = func.call @stack_pop_pointer() : () -> i64
      %1404 = func.call @cc_cons(%1403, %1402) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1405 = arith.addi %1404, %__rlasp_stack_elide_zero_66 : i64
      %1406 = func.call @stack_pop_pointer() : () -> i64
      %1407 = func.call @cc_cons(%1406, %1405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1408 = arith.addi %1407, %__rlasp_stack_elide_zero_67 : i64
      %1409 = func.call @stack_pop_pointer() : () -> i64
      %1410 = func.call @cc_cons(%1409, %1408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1410) : (i64) -> ()
      %1411 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1412 = arith.constant 3 : i64
      %1413 = func.call @cc_make_string(%1411, %1412) : (!llvm.ptr, i64) -> i64
      %1414 = func.call @cc_nil_value() : () -> i64
      %1415 = func.call @cc_intern(%1413, %1414) : (i64, i64) -> i64
      %1416 = func.call @cc_nil_value() : () -> i64
      %1417 = func.call @cc_cons(%1415, %1416) : (i64, i64) -> i64
      %1418 = func.call @cc_values_pack(%1417) : (i64) -> i64
      func.call @stack_push_pointer(%1415) : (i64) -> ()
      %1419 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1420 = arith.constant 2 : i64
      %1421 = func.call @cc_make_string(%1419, %1420) : (!llvm.ptr, i64) -> i64
      %1422 = func.call @cc_nil_value() : () -> i64
      %1423 = func.call @cc_intern(%1421, %1422) : (i64, i64) -> i64
      %1424 = func.call @cc_nil_value() : () -> i64
      %1425 = func.call @cc_cons(%1423, %1424) : (i64, i64) -> i64
      %1426 = func.call @cc_values_pack(%1425) : (i64) -> i64
      func.call @stack_push_pointer(%1423) : (i64) -> ()
      %1427 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1428 = arith.constant 27 : i64
      %1429 = func.call @cc_make_string(%1427, %1428) : (!llvm.ptr, i64) -> i64
      %1430 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1431 = arith.constant 3 : i64
      %1432 = func.call @cc_make_string(%1430, %1431) : (!llvm.ptr, i64) -> i64
      %1433 = func.call @cc_intern(%1429, %1432) : (i64, i64) -> i64
      %1434 = func.call @cc_nil_value() : () -> i64
      %1435 = func.call @cc_cons(%1433, %1434) : (i64, i64) -> i64
      %1436 = func.call @cc_values_pack(%1435) : (i64) -> i64
      func.call @stack_push_pointer(%1433) : (i64) -> ()
      %1437 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1438 = arith.constant 6 : i64
      %1439 = func.call @cc_make_string(%1437, %1438) : (!llvm.ptr, i64) -> i64
      %1440 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1441 = arith.constant 11 : i64
      %1442 = func.call @cc_make_string(%1440, %1441) : (!llvm.ptr, i64) -> i64
      %1443 = func.call @cc_intern(%1439, %1442) : (i64, i64) -> i64
      %1444 = func.call @cc_nil_value() : () -> i64
      %1445 = func.call @cc_cons(%1443, %1444) : (i64, i64) -> i64
      %1446 = func.call @cc_values_pack(%1445) : (i64) -> i64
      func.call @stack_push_pointer(%1443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1447 = func.call @stack_pop_pointer() : () -> i64
      %1448 = func.call @stack_pop_pointer() : () -> i64
      %1449 = func.call @cc_cons(%1448, %1447) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1450 = arith.addi %1449, %__rlasp_stack_elide_zero_68 : i64
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @cc_cons(%1451, %1450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1452) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1453 = func.call @stack_pop_pointer() : () -> i64
      %1454 = func.call @stack_pop_pointer() : () -> i64
      %1455 = func.call @cc_cons(%1454, %1453) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1456 = arith.addi %1455, %__rlasp_stack_elide_zero_69 : i64
      %1457 = func.call @stack_pop_pointer() : () -> i64
      %1458 = func.call @cc_cons(%1457, %1456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1459 = func.call @stack_pop_pointer() : () -> i64
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = func.call @cc_cons(%1460, %1459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1461) : (i64) -> ()
      %1462 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1463 = arith.constant 5 : i64
      %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
      %1465 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1466 = arith.constant 3 : i64
      %1467 = func.call @cc_make_string(%1465, %1466) : (!llvm.ptr, i64) -> i64
      %1468 = func.call @cc_intern(%1464, %1467) : (i64, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_cons(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_values_pack(%1470) : (i64) -> i64
      func.call @stack_push_pointer(%1468) : (i64) -> ()
      %1472 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1473 = arith.constant 2 : i64
      %1474 = func.call @cc_make_string(%1472, %1473) : (!llvm.ptr, i64) -> i64
      %1475 = func.call @cc_nil_value() : () -> i64
      %1476 = func.call @cc_intern(%1474, %1475) : (i64, i64) -> i64
      %1477 = func.call @cc_nil_value() : () -> i64
      %1478 = func.call @cc_cons(%1476, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_values_pack(%1478) : (i64) -> i64
      func.call @stack_push_pointer(%1476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1480 = func.call @stack_pop_pointer() : () -> i64
      %1481 = func.call @stack_pop_pointer() : () -> i64
      %1482 = func.call @cc_cons(%1481, %1480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1483 = arith.addi %1482, %__rlasp_stack_elide_zero_70 : i64
      %1484 = func.call @stack_pop_pointer() : () -> i64
      %1485 = func.call @cc_cons(%1484, %1483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1486 = func.call @stack_pop_pointer() : () -> i64
      %1487 = func.call @stack_pop_pointer() : () -> i64
      %1488 = func.call @cc_cons(%1487, %1486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1489 = arith.addi %1488, %__rlasp_stack_elide_zero_71 : i64
      %1490 = func.call @stack_pop_pointer() : () -> i64
      %1491 = func.call @cc_cons(%1490, %1489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1492 = arith.addi %1491, %__rlasp_stack_elide_zero_72 : i64
      %1493 = func.call @stack_pop_pointer() : () -> i64
      %1494 = func.call @cc_cons(%1493, %1492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1494) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1495 = func.call @stack_pop_pointer() : () -> i64
      %1496 = func.call @stack_pop_pointer() : () -> i64
      %1497 = func.call @cc_cons(%1496, %1495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1498 = arith.addi %1497, %__rlasp_stack_elide_zero_73 : i64
      %1499 = func.call @stack_pop_pointer() : () -> i64
      %1500 = func.call @cc_cons(%1499, %1498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1501 = arith.addi %1500, %__rlasp_stack_elide_zero_74 : i64
      %1502 = func.call @stack_pop_pointer() : () -> i64
      %1503 = func.call @cc_cons(%1502, %1501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1503) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1504 = func.call @stack_pop_pointer() : () -> i64
      %1505 = func.call @stack_pop_pointer() : () -> i64
      %1506 = func.call @cc_cons(%1505, %1504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1507 = arith.addi %1506, %__rlasp_stack_elide_zero_75 : i64
      %1508 = func.call @stack_pop_pointer() : () -> i64
      %1509 = func.call @cc_cons(%1508, %1507) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1510 = arith.addi %1509, %__rlasp_stack_elide_zero_76 : i64
      %1511 = func.call @stack_pop_pointer() : () -> i64
      %1512 = func.call @cc_cons(%1511, %1510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1512) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1513 = func.call @stack_pop_pointer() : () -> i64
      %1514 = func.call @stack_pop_pointer() : () -> i64
      %1515 = func.call @cc_cons(%1514, %1513) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1516 = arith.addi %1515, %__rlasp_stack_elide_zero_77 : i64
      %1517 = func.call @stack_pop_pointer() : () -> i64
      %1518 = func.call @cc_cons(%1517, %1516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @stack_pop_pointer() : () -> i64
      %1521 = func.call @cc_cons(%1520, %1519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1522 = arith.addi %1521, %__rlasp_stack_elide_zero_78 : i64
      %1523 = func.call @stack_pop_pointer() : () -> i64
      %1524 = func.call @cc_cons(%1523, %1522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1525 = arith.addi %1524, %__rlasp_stack_elide_zero_79 : i64
      %1640 = arith.constant 269090723725318 : i64
      %1641 = arith.constant 0 : i64
      %1642 = func.call @cc_make_closure(%1640, %1641) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1643 = arith.addi %1642, %__rlasp_stack_elide_zero_80 : i64
      %1644 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1645 = arith.constant 1 : i64
      %1646 = func.call @cc_make_string(%1644, %1645) : (!llvm.ptr, i64) -> i64
      %1647 = func.call @cc_nil_value() : () -> i64
      %1648 = func.call @cc_intern(%1646, %1647) : (i64, i64) -> i64
      %1649 = func.call @cc_nil_value() : () -> i64
      %1650 = func.call @cc_cons(%1648, %1649) : (i64, i64) -> i64
      %1651 = func.call @cc_values_pack(%1650) : (i64) -> i64
      func.call @stack_push_pointer(%1648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @cc_cons(%1653, %1652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1655 = arith.addi %1654, %__rlasp_stack_elide_zero_81 : i64
      %1656 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1657 = arith.constant 11 : i64
      %1658 = func.call @cc_make_string(%1656, %1657) : (!llvm.ptr, i64) -> i64
      %1659 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1660 = arith.constant 7 : i64
      %1661 = func.call @cc_make_string(%1659, %1660) : (!llvm.ptr, i64) -> i64
      %1662 = func.call @cc_intern(%1658, %1661) : (i64, i64) -> i64
      %1663 = func.call @cc_nil_value() : () -> i64
      %1664 = func.call @cc_cons(%1662, %1663) : (i64, i64) -> i64
      %1665 = func.call @cc_values_pack(%1664) : (i64) -> i64
      %1666 = func.call @cc_nil_value() : () -> i64
      %1667 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1668 = arith.constant 4 : i64
      %1669 = func.call @cc_make_string(%1667, %1668) : (!llvm.ptr, i64) -> i64
      %1670 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1671 = arith.constant 7 : i64
      %1672 = func.call @cc_make_string(%1670, %1671) : (!llvm.ptr, i64) -> i64
      %1673 = func.call @cc_intern(%1669, %1672) : (i64, i64) -> i64
      %1674 = func.call @cc_nil_value() : () -> i64
      %1675 = func.call @cc_cons(%1673, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_values_pack(%1675) : (i64) -> i64
      %1677 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1678 = arith.constant 6 : i64
      %1679 = func.call @cc_make_string(%1677, %1678) : (!llvm.ptr, i64) -> i64
      %1680 = func.call @cc_nil_value() : () -> i64
      %1681 = func.call @cc_intern(%1679, %1680) : (i64, i64) -> i64
      %1682 = func.call @cc_nil_value() : () -> i64
      %1683 = func.call @cc_cons(%1681, %1682) : (i64, i64) -> i64
      %1684 = func.call @cc_values_pack(%1683) : (i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1685 = arith.addi %1681, %__rlasp_stack_elide_zero_82 : i64
      %1686 = func.call @cc_nil_value() : () -> i64
      %1687 = func.call @cc_errorp(%1306) : (i64) -> i64
      %1688 = arith.cmpi ne, %1687, %1686 : i64
      %1689 = arith.cmpi eq, %1686, %1686 : i64
      %1690 = arith.andi %1688, %1689 : i1
      %1691 = scf.if %1690 -> (i64) {
        scf.yield %1306 : i64
      } else {
        scf.yield %1686 : i64
      }
      %1692 = func.call @cc_errorp(%1525) : (i64) -> i64
      %1693 = arith.cmpi ne, %1692, %1686 : i64
      %1694 = arith.cmpi eq, %1691, %1686 : i64
      %1695 = arith.andi %1693, %1694 : i1
      %1696 = scf.if %1695 -> (i64) {
        scf.yield %1525 : i64
      } else {
        scf.yield %1691 : i64
      }
      %1697 = func.call @cc_errorp(%1643) : (i64) -> i64
      %1698 = arith.cmpi ne, %1697, %1686 : i64
      %1699 = arith.cmpi eq, %1696, %1686 : i64
      %1700 = arith.andi %1698, %1699 : i1
      %1701 = scf.if %1700 -> (i64) {
        scf.yield %1643 : i64
      } else {
        scf.yield %1696 : i64
      }
      %1702 = func.call @cc_errorp(%1655) : (i64) -> i64
      %1703 = arith.cmpi ne, %1702, %1686 : i64
      %1704 = arith.cmpi eq, %1701, %1686 : i64
      %1705 = arith.andi %1703, %1704 : i1
      %1706 = scf.if %1705 -> (i64) {
        scf.yield %1655 : i64
      } else {
        scf.yield %1701 : i64
      }
      %1707 = func.call @cc_errorp(%1662) : (i64) -> i64
      %1708 = arith.cmpi ne, %1707, %1686 : i64
      %1709 = arith.cmpi eq, %1706, %1686 : i64
      %1710 = arith.andi %1708, %1709 : i1
      %1711 = scf.if %1710 -> (i64) {
        scf.yield %1662 : i64
      } else {
        scf.yield %1706 : i64
      }
      %1712 = func.call @cc_errorp(%1666) : (i64) -> i64
      %1713 = arith.cmpi ne, %1712, %1686 : i64
      %1714 = arith.cmpi eq, %1711, %1686 : i64
      %1715 = arith.andi %1713, %1714 : i1
      %1716 = scf.if %1715 -> (i64) {
        scf.yield %1666 : i64
      } else {
        scf.yield %1711 : i64
      }
      %1717 = func.call @cc_errorp(%1673) : (i64) -> i64
      %1718 = arith.cmpi ne, %1717, %1686 : i64
      %1719 = arith.cmpi eq, %1716, %1686 : i64
      %1720 = arith.andi %1718, %1719 : i1
      %1721 = scf.if %1720 -> (i64) {
        scf.yield %1673 : i64
      } else {
        scf.yield %1716 : i64
      }
      %1722 = func.call @cc_errorp(%1685) : (i64) -> i64
      %1723 = arith.cmpi ne, %1722, %1686 : i64
      %1724 = arith.cmpi eq, %1721, %1686 : i64
      %1725 = arith.andi %1723, %1724 : i1
      %1726 = scf.if %1725 -> (i64) {
        scf.yield %1685 : i64
      } else {
        scf.yield %1721 : i64
      }
      %1727 = arith.cmpi ne, %1726, %1686 : i64
      scf.if %1727 {
        func.call @stack_push_pointer(%1726) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1306) : (i64) -> ()
        func.call @stack_push_pointer(%1525) : (i64) -> ()
        func.call @stack_push_pointer(%1643) : (i64) -> ()
        func.call @stack_push_pointer(%1655) : (i64) -> ()
        func.call @stack_push_pointer(%1662) : (i64) -> ()
        func.call @stack_push_pointer(%1666) : (i64) -> ()
        func.call @stack_push_pointer(%1673) : (i64) -> ()
        func.call @stack_push_pointer(%1685) : (i64) -> ()
        %1728 = llvm.mlir.addressof @str148 : !llvm.ptr
        %1729 = func.call @cc_make_function_ref_const(%1728) : (!llvm.ptr) -> i64
        %1730 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1729, %1730) : (i64, i64) -> ()
      }
      %1731 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1731 : i64
    }
    %1732 = func.call @cc_nil_value() : () -> i64
    %1733 = func.call @cc_errorp(%1297) : (i64) -> i64
    %1734 = arith.cmpi ne, %1733, %1732 : i64
    %1735 = scf.if %1734 -> (i64) {
      scf.yield %1297 : i64
    } else {
      %1736 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1737 = arith.constant 10 : i64
      %1738 = func.call @cc_make_string(%1736, %1737) : (!llvm.ptr, i64) -> i64
      %1739 = func.call @cc_nil_value() : () -> i64
      %1740 = func.call @cc_intern(%1738, %1739) : (i64, i64) -> i64
      %1741 = func.call @cc_nil_value() : () -> i64
      %1742 = func.call @cc_cons(%1740, %1741) : (i64, i64) -> i64
      %1743 = func.call @cc_values_pack(%1742) : (i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1744 = arith.addi %1740, %__rlasp_stack_elide_zero_83 : i64
      %1745 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1746 = arith.constant 3 : i64
      %1747 = func.call @cc_make_string(%1745, %1746) : (!llvm.ptr, i64) -> i64
      %1748 = func.call @cc_nil_value() : () -> i64
      %1749 = func.call @cc_intern(%1747, %1748) : (i64, i64) -> i64
      %1750 = func.call @cc_nil_value() : () -> i64
      %1751 = func.call @cc_cons(%1749, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_values_pack(%1751) : (i64) -> i64
      func.call @stack_push_pointer(%1749) : (i64) -> ()
      %1753 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1754 = arith.constant 3 : i64
      %1755 = func.call @cc_make_string(%1753, %1754) : (!llvm.ptr, i64) -> i64
      %1756 = func.call @cc_nil_value() : () -> i64
      %1757 = func.call @cc_intern(%1755, %1756) : (i64, i64) -> i64
      %1758 = func.call @cc_nil_value() : () -> i64
      %1759 = func.call @cc_cons(%1757, %1758) : (i64, i64) -> i64
      %1760 = func.call @cc_values_pack(%1759) : (i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      %1761 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1762 = arith.constant 3 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = func.call @cc_nil_value() : () -> i64
      %1765 = func.call @cc_intern(%1763, %1764) : (i64, i64) -> i64
      %1766 = func.call @cc_nil_value() : () -> i64
      %1767 = func.call @cc_cons(%1765, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_values_pack(%1767) : (i64) -> i64
      func.call @stack_push_pointer(%1765) : (i64) -> ()
      %1769 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1770 = arith.constant 4 : i64
      %1771 = func.call @cc_make_string(%1769, %1770) : (!llvm.ptr, i64) -> i64
      %1772 = func.call @cc_nil_value() : () -> i64
      %1773 = func.call @cc_intern(%1771, %1772) : (i64, i64) -> i64
      %1774 = func.call @cc_nil_value() : () -> i64
      %1775 = func.call @cc_cons(%1773, %1774) : (i64, i64) -> i64
      %1776 = func.call @cc_values_pack(%1775) : (i64) -> i64
      func.call @stack_push_pointer(%1773) : (i64) -> ()
      %1777 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1778 = arith.constant 42 : i64
      %1779 = func.call @cc_make_string(%1777, %1778) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1779) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @stack_pop_pointer() : () -> i64
      %1782 = func.call @cc_cons(%1781, %1780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1783 = arith.addi %1782, %__rlasp_stack_elide_zero_84 : i64
      %1784 = func.call @stack_pop_pointer() : () -> i64
      %1785 = func.call @cc_cons(%1784, %1783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1785) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @cc_cons(%1787, %1786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1788) : (i64) -> ()
      %1789 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1790 = arith.constant 14 : i64
      %1791 = func.call @cc_make_string(%1789, %1790) : (!llvm.ptr, i64) -> i64
      %1792 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1793 = arith.constant 11 : i64
      %1794 = func.call @cc_make_string(%1792, %1793) : (!llvm.ptr, i64) -> i64
      %1795 = func.call @cc_intern(%1791, %1794) : (i64, i64) -> i64
      %1796 = func.call @cc_nil_value() : () -> i64
      %1797 = func.call @cc_cons(%1795, %1796) : (i64, i64) -> i64
      %1798 = func.call @cc_values_pack(%1797) : (i64) -> i64
      func.call @stack_push_pointer(%1795) : (i64) -> ()
      %1799 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1800 = arith.constant 6 : i64
      %1801 = func.call @cc_make_string(%1799, %1800) : (!llvm.ptr, i64) -> i64
      %1802 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1803 = arith.constant 11 : i64
      %1804 = func.call @cc_make_string(%1802, %1803) : (!llvm.ptr, i64) -> i64
      %1805 = func.call @cc_intern(%1801, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = func.call @cc_cons(%1805, %1806) : (i64, i64) -> i64
      %1808 = func.call @cc_values_pack(%1807) : (i64) -> i64
      func.call @stack_push_pointer(%1805) : (i64) -> ()
      %1809 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1810 = arith.constant 4 : i64
      %1811 = func.call @cc_make_string(%1809, %1810) : (!llvm.ptr, i64) -> i64
      %1812 = func.call @cc_nil_value() : () -> i64
      %1813 = func.call @cc_intern(%1811, %1812) : (i64, i64) -> i64
      %1814 = func.call @cc_nil_value() : () -> i64
      %1815 = func.call @cc_cons(%1813, %1814) : (i64, i64) -> i64
      %1816 = func.call @cc_values_pack(%1815) : (i64) -> i64
      func.call @stack_push_pointer(%1813) : (i64) -> ()
      %1817 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1818 = arith.constant 9 : i64
      %1819 = func.call @cc_make_string(%1817, %1818) : (!llvm.ptr, i64) -> i64
      %1820 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1821 = arith.constant 7 : i64
      %1822 = func.call @cc_make_string(%1820, %1821) : (!llvm.ptr, i64) -> i64
      %1823 = func.call @cc_intern(%1819, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_cons(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_values_pack(%1825) : (i64) -> i64
      func.call @stack_push_pointer(%1823) : (i64) -> ()
      %1827 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1828 = arith.constant 5 : i64
      %1829 = func.call @cc_make_string(%1827, %1828) : (!llvm.ptr, i64) -> i64
      %1830 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1831 = arith.constant 7 : i64
      %1832 = func.call @cc_make_string(%1830, %1831) : (!llvm.ptr, i64) -> i64
      %1833 = func.call @cc_intern(%1829, %1832) : (i64, i64) -> i64
      %1834 = func.call @cc_nil_value() : () -> i64
      %1835 = func.call @cc_cons(%1833, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_values_pack(%1835) : (i64) -> i64
      func.call @stack_push_pointer(%1833) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @cc_cons(%1838, %1837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1840 = arith.addi %1839, %__rlasp_stack_elide_zero_85 : i64
      %1841 = func.call @stack_pop_pointer() : () -> i64
      %1842 = func.call @cc_cons(%1841, %1840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1843 = arith.addi %1842, %__rlasp_stack_elide_zero_86 : i64
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @cc_cons(%1844, %1843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1846 = arith.addi %1845, %__rlasp_stack_elide_zero_87 : i64
      %1847 = func.call @stack_pop_pointer() : () -> i64
      %1848 = func.call @cc_cons(%1847, %1846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1848) : (i64) -> ()
      %1849 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1850 = arith.constant 3 : i64
      %1851 = func.call @cc_make_string(%1849, %1850) : (!llvm.ptr, i64) -> i64
      %1852 = func.call @cc_nil_value() : () -> i64
      %1853 = func.call @cc_intern(%1851, %1852) : (i64, i64) -> i64
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_cons(%1853, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_values_pack(%1855) : (i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      %1857 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1858 = arith.constant 2 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = func.call @cc_nil_value() : () -> i64
      %1861 = func.call @cc_intern(%1859, %1860) : (i64, i64) -> i64
      %1862 = func.call @cc_nil_value() : () -> i64
      %1863 = func.call @cc_cons(%1861, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_values_pack(%1863) : (i64) -> i64
      func.call @stack_push_pointer(%1861) : (i64) -> ()
      %1865 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1866 = arith.constant 27 : i64
      %1867 = func.call @cc_make_string(%1865, %1866) : (!llvm.ptr, i64) -> i64
      %1868 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1869 = arith.constant 3 : i64
      %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
      %1871 = func.call @cc_intern(%1867, %1870) : (i64, i64) -> i64
      %1872 = func.call @cc_nil_value() : () -> i64
      %1873 = func.call @cc_cons(%1871, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_values_pack(%1873) : (i64) -> i64
      func.call @stack_push_pointer(%1871) : (i64) -> ()
      %1875 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1876 = arith.constant 6 : i64
      %1877 = func.call @cc_make_string(%1875, %1876) : (!llvm.ptr, i64) -> i64
      %1878 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1879 = arith.constant 11 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_intern(%1877, %1880) : (i64, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_cons(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_values_pack(%1883) : (i64) -> i64
      func.call @stack_push_pointer(%1881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1885 = func.call @stack_pop_pointer() : () -> i64
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @cc_cons(%1886, %1885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1888 = arith.addi %1887, %__rlasp_stack_elide_zero_88 : i64
      %1889 = func.call @stack_pop_pointer() : () -> i64
      %1890 = func.call @cc_cons(%1889, %1888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1890) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1891 = func.call @stack_pop_pointer() : () -> i64
      %1892 = func.call @stack_pop_pointer() : () -> i64
      %1893 = func.call @cc_cons(%1892, %1891) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1894 = arith.addi %1893, %__rlasp_stack_elide_zero_89 : i64
      %1895 = func.call @stack_pop_pointer() : () -> i64
      %1896 = func.call @cc_cons(%1895, %1894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @stack_pop_pointer() : () -> i64
      %1899 = func.call @cc_cons(%1898, %1897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      %1900 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1901 = arith.constant 1 : i64
      %1902 = func.call @cc_make_string(%1900, %1901) : (!llvm.ptr, i64) -> i64
      %1903 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1904 = arith.constant 11 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = func.call @cc_intern(%1902, %1905) : (i64, i64) -> i64
      %1907 = func.call @cc_nil_value() : () -> i64
      %1908 = func.call @cc_cons(%1906, %1907) : (i64, i64) -> i64
      %1909 = func.call @cc_values_pack(%1908) : (i64) -> i64
      func.call @stack_push_pointer(%1906) : (i64) -> ()
      %1910 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1911 = arith.constant 9 : i64
      %1912 = func.call @cc_make_string(%1910, %1911) : (!llvm.ptr, i64) -> i64
      %1913 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1914 = arith.constant 11 : i64
      %1915 = func.call @cc_make_string(%1913, %1914) : (!llvm.ptr, i64) -> i64
      %1916 = func.call @cc_intern(%1912, %1915) : (i64, i64) -> i64
      %1917 = func.call @cc_nil_value() : () -> i64
      %1918 = func.call @cc_cons(%1916, %1917) : (i64, i64) -> i64
      %1919 = func.call @cc_values_pack(%1918) : (i64) -> i64
      func.call @stack_push_pointer(%1916) : (i64) -> ()
      %1920 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1920) : (i64) -> ()
      %1921 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1922 = arith.constant 4 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1925 = arith.constant 3 : i64
      %1926 = func.call @cc_make_string(%1924, %1925) : (!llvm.ptr, i64) -> i64
      %1927 = func.call @cc_intern(%1923, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_nil_value() : () -> i64
      %1929 = func.call @cc_cons(%1927, %1928) : (i64, i64) -> i64
      %1930 = func.call @cc_values_pack(%1929) : (i64) -> i64
      func.call @stack_push_pointer(%1927) : (i64) -> ()
      %1931 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1932 = arith.constant 4 : i64
      %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
      %1934 = func.call @cc_nil_value() : () -> i64
      %1935 = func.call @cc_intern(%1933, %1934) : (i64, i64) -> i64
      %1936 = func.call @cc_nil_value() : () -> i64
      %1937 = func.call @cc_cons(%1935, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_values_pack(%1937) : (i64) -> i64
      func.call @stack_push_pointer(%1935) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1942 = arith.addi %1941, %__rlasp_stack_elide_zero_90 : i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @stack_pop_pointer() : () -> i64
      %1947 = func.call @cc_cons(%1946, %1945) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1948 = arith.addi %1947, %__rlasp_stack_elide_zero_91 : i64
      %1949 = func.call @stack_pop_pointer() : () -> i64
      %1950 = func.call @cc_cons(%1949, %1948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1951 = arith.addi %1950, %__rlasp_stack_elide_zero_92 : i64
      %1952 = func.call @stack_pop_pointer() : () -> i64
      %1953 = func.call @cc_cons(%1952, %1951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      %1954 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1955 = arith.constant 9 : i64
      %1956 = func.call @cc_make_string(%1954, %1955) : (!llvm.ptr, i64) -> i64
      %1957 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1958 = arith.constant 11 : i64
      %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
      %1960 = func.call @cc_intern(%1956, %1959) : (i64, i64) -> i64
      %1961 = func.call @cc_nil_value() : () -> i64
      %1962 = func.call @cc_cons(%1960, %1961) : (i64, i64) -> i64
      %1963 = func.call @cc_values_pack(%1962) : (i64) -> i64
      func.call @stack_push_pointer(%1960) : (i64) -> ()
      %1964 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1964) : (i64) -> ()
      %1965 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1966 = arith.constant 5 : i64
      %1967 = func.call @cc_make_string(%1965, %1966) : (!llvm.ptr, i64) -> i64
      %1968 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1969 = arith.constant 3 : i64
      %1970 = func.call @cc_make_string(%1968, %1969) : (!llvm.ptr, i64) -> i64
      %1971 = func.call @cc_intern(%1967, %1970) : (i64, i64) -> i64
      %1972 = func.call @cc_nil_value() : () -> i64
      %1973 = func.call @cc_cons(%1971, %1972) : (i64, i64) -> i64
      %1974 = func.call @cc_values_pack(%1973) : (i64) -> i64
      func.call @stack_push_pointer(%1971) : (i64) -> ()
      %1975 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1976 = arith.constant 2 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = func.call @cc_nil_value() : () -> i64
      %1979 = func.call @cc_intern(%1977, %1978) : (i64, i64) -> i64
      %1980 = func.call @cc_nil_value() : () -> i64
      %1981 = func.call @cc_cons(%1979, %1980) : (i64, i64) -> i64
      %1982 = func.call @cc_values_pack(%1981) : (i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = func.call @stack_pop_pointer() : () -> i64
      %1985 = func.call @cc_cons(%1984, %1983) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1986 = arith.addi %1985, %__rlasp_stack_elide_zero_93 : i64
      %1987 = func.call @stack_pop_pointer() : () -> i64
      %1988 = func.call @cc_cons(%1987, %1986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1988) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1989 = func.call @stack_pop_pointer() : () -> i64
      %1990 = func.call @stack_pop_pointer() : () -> i64
      %1991 = func.call @cc_cons(%1990, %1989) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1992 = arith.addi %1991, %__rlasp_stack_elide_zero_94 : i64
      %1993 = func.call @stack_pop_pointer() : () -> i64
      %1994 = func.call @cc_cons(%1993, %1992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1995 = arith.addi %1994, %__rlasp_stack_elide_zero_95 : i64
      %1996 = func.call @stack_pop_pointer() : () -> i64
      %1997 = func.call @cc_cons(%1996, %1995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1998 = func.call @stack_pop_pointer() : () -> i64
      %1999 = func.call @stack_pop_pointer() : () -> i64
      %2000 = func.call @cc_cons(%1999, %1998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2001 = arith.addi %2000, %__rlasp_stack_elide_zero_96 : i64
      %2002 = func.call @stack_pop_pointer() : () -> i64
      %2003 = func.call @cc_cons(%2002, %2001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2004 = arith.addi %2003, %__rlasp_stack_elide_zero_97 : i64
      %2005 = func.call @stack_pop_pointer() : () -> i64
      %2006 = func.call @cc_cons(%2005, %2004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2006) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2007 = func.call @stack_pop_pointer() : () -> i64
      %2008 = func.call @stack_pop_pointer() : () -> i64
      %2009 = func.call @cc_cons(%2008, %2007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2010 = arith.addi %2009, %__rlasp_stack_elide_zero_98 : i64
      %2011 = func.call @stack_pop_pointer() : () -> i64
      %2012 = func.call @cc_cons(%2011, %2010) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2013 = arith.addi %2012, %__rlasp_stack_elide_zero_99 : i64
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = func.call @cc_cons(%2014, %2013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2016 = func.call @stack_pop_pointer() : () -> i64
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @cc_cons(%2017, %2016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2019 = arith.addi %2018, %__rlasp_stack_elide_zero_100 : i64
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @cc_cons(%2020, %2019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2022 = arith.addi %2021, %__rlasp_stack_elide_zero_101 : i64
      %2023 = func.call @stack_pop_pointer() : () -> i64
      %2024 = func.call @cc_cons(%2023, %2022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2025 = func.call @stack_pop_pointer() : () -> i64
      %2026 = func.call @stack_pop_pointer() : () -> i64
      %2027 = func.call @cc_cons(%2026, %2025) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2028 = arith.addi %2027, %__rlasp_stack_elide_zero_102 : i64
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @cc_cons(%2029, %2028) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2031 = arith.addi %2030, %__rlasp_stack_elide_zero_103 : i64
      %2032 = func.call @stack_pop_pointer() : () -> i64
      %2033 = func.call @cc_cons(%2032, %2031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2034 = func.call @stack_pop_pointer() : () -> i64
      %2035 = func.call @stack_pop_pointer() : () -> i64
      %2036 = func.call @cc_cons(%2035, %2034) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2037 = arith.addi %2036, %__rlasp_stack_elide_zero_104 : i64
      %2038 = func.call @stack_pop_pointer() : () -> i64
      %2039 = func.call @cc_cons(%2038, %2037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2040 = func.call @stack_pop_pointer() : () -> i64
      %2041 = func.call @stack_pop_pointer() : () -> i64
      %2042 = func.call @cc_cons(%2041, %2040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2043 = arith.addi %2042, %__rlasp_stack_elide_zero_105 : i64
      %2044 = func.call @stack_pop_pointer() : () -> i64
      %2045 = func.call @cc_cons(%2044, %2043) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2046 = arith.addi %2045, %__rlasp_stack_elide_zero_106 : i64
      %2206 = arith.constant 269090723725319 : i64
      %2207 = arith.constant 0 : i64
      %2208 = func.call @cc_make_closure(%2206, %2207) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2209 = arith.addi %2208, %__rlasp_stack_elide_zero_107 : i64
      %2210 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2211 = arith.constant 1 : i64
      %2212 = func.call @cc_make_string(%2210, %2211) : (!llvm.ptr, i64) -> i64
      %2213 = func.call @cc_nil_value() : () -> i64
      %2214 = func.call @cc_intern(%2212, %2213) : (i64, i64) -> i64
      %2215 = func.call @cc_nil_value() : () -> i64
      %2216 = func.call @cc_cons(%2214, %2215) : (i64, i64) -> i64
      %2217 = func.call @cc_values_pack(%2216) : (i64) -> i64
      func.call @stack_push_pointer(%2214) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2218 = func.call @stack_pop_pointer() : () -> i64
      %2219 = func.call @stack_pop_pointer() : () -> i64
      %2220 = func.call @cc_cons(%2219, %2218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2221 = arith.addi %2220, %__rlasp_stack_elide_zero_108 : i64
      %2222 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2223 = arith.constant 11 : i64
      %2224 = func.call @cc_make_string(%2222, %2223) : (!llvm.ptr, i64) -> i64
      %2225 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2226 = arith.constant 7 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_intern(%2224, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_nil_value() : () -> i64
      %2230 = func.call @cc_cons(%2228, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_values_pack(%2230) : (i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2234 = arith.constant 4 : i64
      %2235 = func.call @cc_make_string(%2233, %2234) : (!llvm.ptr, i64) -> i64
      %2236 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2237 = arith.constant 7 : i64
      %2238 = func.call @cc_make_string(%2236, %2237) : (!llvm.ptr, i64) -> i64
      %2239 = func.call @cc_intern(%2235, %2238) : (i64, i64) -> i64
      %2240 = func.call @cc_nil_value() : () -> i64
      %2241 = func.call @cc_cons(%2239, %2240) : (i64, i64) -> i64
      %2242 = func.call @cc_values_pack(%2241) : (i64) -> i64
      %2243 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2244 = arith.constant 6 : i64
      %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
      %2246 = func.call @cc_nil_value() : () -> i64
      %2247 = func.call @cc_intern(%2245, %2246) : (i64, i64) -> i64
      %2248 = func.call @cc_nil_value() : () -> i64
      %2249 = func.call @cc_cons(%2247, %2248) : (i64, i64) -> i64
      %2250 = func.call @cc_values_pack(%2249) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2251 = arith.addi %2247, %__rlasp_stack_elide_zero_109 : i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_errorp(%1744) : (i64) -> i64
      %2254 = arith.cmpi ne, %2253, %2252 : i64
      %2255 = arith.cmpi eq, %2252, %2252 : i64
      %2256 = arith.andi %2254, %2255 : i1
      %2257 = scf.if %2256 -> (i64) {
        scf.yield %1744 : i64
      } else {
        scf.yield %2252 : i64
      }
      %2258 = func.call @cc_errorp(%2046) : (i64) -> i64
      %2259 = arith.cmpi ne, %2258, %2252 : i64
      %2260 = arith.cmpi eq, %2257, %2252 : i64
      %2261 = arith.andi %2259, %2260 : i1
      %2262 = scf.if %2261 -> (i64) {
        scf.yield %2046 : i64
      } else {
        scf.yield %2257 : i64
      }
      %2263 = func.call @cc_errorp(%2209) : (i64) -> i64
      %2264 = arith.cmpi ne, %2263, %2252 : i64
      %2265 = arith.cmpi eq, %2262, %2252 : i64
      %2266 = arith.andi %2264, %2265 : i1
      %2267 = scf.if %2266 -> (i64) {
        scf.yield %2209 : i64
      } else {
        scf.yield %2262 : i64
      }
      %2268 = func.call @cc_errorp(%2221) : (i64) -> i64
      %2269 = arith.cmpi ne, %2268, %2252 : i64
      %2270 = arith.cmpi eq, %2267, %2252 : i64
      %2271 = arith.andi %2269, %2270 : i1
      %2272 = scf.if %2271 -> (i64) {
        scf.yield %2221 : i64
      } else {
        scf.yield %2267 : i64
      }
      %2273 = func.call @cc_errorp(%2228) : (i64) -> i64
      %2274 = arith.cmpi ne, %2273, %2252 : i64
      %2275 = arith.cmpi eq, %2272, %2252 : i64
      %2276 = arith.andi %2274, %2275 : i1
      %2277 = scf.if %2276 -> (i64) {
        scf.yield %2228 : i64
      } else {
        scf.yield %2272 : i64
      }
      %2278 = func.call @cc_errorp(%2232) : (i64) -> i64
      %2279 = arith.cmpi ne, %2278, %2252 : i64
      %2280 = arith.cmpi eq, %2277, %2252 : i64
      %2281 = arith.andi %2279, %2280 : i1
      %2282 = scf.if %2281 -> (i64) {
        scf.yield %2232 : i64
      } else {
        scf.yield %2277 : i64
      }
      %2283 = func.call @cc_errorp(%2239) : (i64) -> i64
      %2284 = arith.cmpi ne, %2283, %2252 : i64
      %2285 = arith.cmpi eq, %2282, %2252 : i64
      %2286 = arith.andi %2284, %2285 : i1
      %2287 = scf.if %2286 -> (i64) {
        scf.yield %2239 : i64
      } else {
        scf.yield %2282 : i64
      }
      %2288 = func.call @cc_errorp(%2251) : (i64) -> i64
      %2289 = arith.cmpi ne, %2288, %2252 : i64
      %2290 = arith.cmpi eq, %2287, %2252 : i64
      %2291 = arith.andi %2289, %2290 : i1
      %2292 = scf.if %2291 -> (i64) {
        scf.yield %2251 : i64
      } else {
        scf.yield %2287 : i64
      }
      %2293 = arith.cmpi ne, %2292, %2252 : i64
      scf.if %2293 {
        func.call @stack_push_pointer(%2292) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1744) : (i64) -> ()
        func.call @stack_push_pointer(%2046) : (i64) -> ()
        func.call @stack_push_pointer(%2209) : (i64) -> ()
        func.call @stack_push_pointer(%2221) : (i64) -> ()
        func.call @stack_push_pointer(%2228) : (i64) -> ()
        func.call @stack_push_pointer(%2232) : (i64) -> ()
        func.call @stack_push_pointer(%2239) : (i64) -> ()
        func.call @stack_push_pointer(%2251) : (i64) -> ()
        %2294 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2295 = func.call @cc_make_function_ref_const(%2294) : (!llvm.ptr) -> i64
        %2296 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2295, %2296) : (i64, i64) -> ()
      }
      %2297 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2297 : i64
    }
    %2298 = func.call @cc_nil_value() : () -> i64
    %2299 = func.call @cc_errorp(%1735) : (i64) -> i64
    %2300 = arith.cmpi ne, %2299, %2298 : i64
    %2301 = scf.if %2300 -> (i64) {
      scf.yield %1735 : i64
    } else {
      %2302 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2303 = arith.constant 11 : i64
      %2304 = func.call @cc_make_string(%2302, %2303) : (!llvm.ptr, i64) -> i64
      %2305 = func.call @cc_nil_value() : () -> i64
      %2306 = func.call @cc_intern(%2304, %2305) : (i64, i64) -> i64
      %2307 = func.call @cc_nil_value() : () -> i64
      %2308 = func.call @cc_cons(%2306, %2307) : (i64, i64) -> i64
      %2309 = func.call @cc_values_pack(%2308) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2310 = arith.addi %2306, %__rlasp_stack_elide_zero_110 : i64
      %2311 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2312 = arith.constant 3 : i64
      %2313 = func.call @cc_make_string(%2311, %2312) : (!llvm.ptr, i64) -> i64
      %2314 = func.call @cc_nil_value() : () -> i64
      %2315 = func.call @cc_intern(%2313, %2314) : (i64, i64) -> i64
      %2316 = func.call @cc_nil_value() : () -> i64
      %2317 = func.call @cc_cons(%2315, %2316) : (i64, i64) -> i64
      %2318 = func.call @cc_values_pack(%2317) : (i64) -> i64
      func.call @stack_push_pointer(%2315) : (i64) -> ()
      %2319 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2320 = arith.constant 3 : i64
      %2321 = func.call @cc_make_string(%2319, %2320) : (!llvm.ptr, i64) -> i64
      %2322 = func.call @cc_nil_value() : () -> i64
      %2323 = func.call @cc_intern(%2321, %2322) : (i64, i64) -> i64
      %2324 = func.call @cc_nil_value() : () -> i64
      %2325 = func.call @cc_cons(%2323, %2324) : (i64, i64) -> i64
      %2326 = func.call @cc_values_pack(%2325) : (i64) -> i64
      func.call @stack_push_pointer(%2323) : (i64) -> ()
      %2327 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2328 = arith.constant 3 : i64
      %2329 = func.call @cc_make_string(%2327, %2328) : (!llvm.ptr, i64) -> i64
      %2330 = func.call @cc_nil_value() : () -> i64
      %2331 = func.call @cc_intern(%2329, %2330) : (i64, i64) -> i64
      %2332 = func.call @cc_nil_value() : () -> i64
      %2333 = func.call @cc_cons(%2331, %2332) : (i64, i64) -> i64
      %2334 = func.call @cc_values_pack(%2333) : (i64) -> i64
      func.call @stack_push_pointer(%2331) : (i64) -> ()
      %2335 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2336 = arith.constant 4 : i64
      %2337 = func.call @cc_make_string(%2335, %2336) : (!llvm.ptr, i64) -> i64
      %2338 = func.call @cc_nil_value() : () -> i64
      %2339 = func.call @cc_intern(%2337, %2338) : (i64, i64) -> i64
      %2340 = func.call @cc_nil_value() : () -> i64
      %2341 = func.call @cc_cons(%2339, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_values_pack(%2341) : (i64) -> i64
      func.call @stack_push_pointer(%2339) : (i64) -> ()
      %2343 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2344 = arith.constant 42 : i64
      %2345 = func.call @cc_make_string(%2343, %2344) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2345) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2346 = func.call @stack_pop_pointer() : () -> i64
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @cc_cons(%2347, %2346) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2349 = arith.addi %2348, %__rlasp_stack_elide_zero_111 : i64
      %2350 = func.call @stack_pop_pointer() : () -> i64
      %2351 = func.call @cc_cons(%2350, %2349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2351) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2352 = func.call @stack_pop_pointer() : () -> i64
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @cc_cons(%2353, %2352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2355 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2356 = arith.constant 14 : i64
      %2357 = func.call @cc_make_string(%2355, %2356) : (!llvm.ptr, i64) -> i64
      %2358 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2359 = arith.constant 11 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      %2361 = func.call @cc_intern(%2357, %2360) : (i64, i64) -> i64
      %2362 = func.call @cc_nil_value() : () -> i64
      %2363 = func.call @cc_cons(%2361, %2362) : (i64, i64) -> i64
      %2364 = func.call @cc_values_pack(%2363) : (i64) -> i64
      func.call @stack_push_pointer(%2361) : (i64) -> ()
      %2365 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2366 = arith.constant 6 : i64
      %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
      %2368 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2369 = arith.constant 11 : i64
      %2370 = func.call @cc_make_string(%2368, %2369) : (!llvm.ptr, i64) -> i64
      %2371 = func.call @cc_intern(%2367, %2370) : (i64, i64) -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_cons(%2371, %2372) : (i64, i64) -> i64
      %2374 = func.call @cc_values_pack(%2373) : (i64) -> i64
      func.call @stack_push_pointer(%2371) : (i64) -> ()
      %2375 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2376 = arith.constant 4 : i64
      %2377 = func.call @cc_make_string(%2375, %2376) : (!llvm.ptr, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_intern(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_nil_value() : () -> i64
      %2381 = func.call @cc_cons(%2379, %2380) : (i64, i64) -> i64
      %2382 = func.call @cc_values_pack(%2381) : (i64) -> i64
      func.call @stack_push_pointer(%2379) : (i64) -> ()
      %2383 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2384 = arith.constant 9 : i64
      %2385 = func.call @cc_make_string(%2383, %2384) : (!llvm.ptr, i64) -> i64
      %2386 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2387 = arith.constant 7 : i64
      %2388 = func.call @cc_make_string(%2386, %2387) : (!llvm.ptr, i64) -> i64
      %2389 = func.call @cc_intern(%2385, %2388) : (i64, i64) -> i64
      %2390 = func.call @cc_nil_value() : () -> i64
      %2391 = func.call @cc_cons(%2389, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_values_pack(%2391) : (i64) -> i64
      func.call @stack_push_pointer(%2389) : (i64) -> ()
      %2393 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2394 = arith.constant 5 : i64
      %2395 = func.call @cc_make_string(%2393, %2394) : (!llvm.ptr, i64) -> i64
      %2396 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2397 = arith.constant 7 : i64
      %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
      %2399 = func.call @cc_intern(%2395, %2398) : (i64, i64) -> i64
      %2400 = func.call @cc_nil_value() : () -> i64
      %2401 = func.call @cc_cons(%2399, %2400) : (i64, i64) -> i64
      %2402 = func.call @cc_values_pack(%2401) : (i64) -> i64
      func.call @stack_push_pointer(%2399) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2403 = func.call @stack_pop_pointer() : () -> i64
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = func.call @cc_cons(%2404, %2403) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2406 = arith.addi %2405, %__rlasp_stack_elide_zero_112 : i64
      %2407 = func.call @stack_pop_pointer() : () -> i64
      %2408 = func.call @cc_cons(%2407, %2406) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2409 = arith.addi %2408, %__rlasp_stack_elide_zero_113 : i64
      %2410 = func.call @stack_pop_pointer() : () -> i64
      %2411 = func.call @cc_cons(%2410, %2409) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2412 = arith.addi %2411, %__rlasp_stack_elide_zero_114 : i64
      %2413 = func.call @stack_pop_pointer() : () -> i64
      %2414 = func.call @cc_cons(%2413, %2412) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2414) : (i64) -> ()
      %2415 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2416 = arith.constant 3 : i64
      %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_intern(%2417, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      func.call @stack_push_pointer(%2419) : (i64) -> ()
      %2423 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2424 = arith.constant 2 : i64
      %2425 = func.call @cc_make_string(%2423, %2424) : (!llvm.ptr, i64) -> i64
      %2426 = func.call @cc_nil_value() : () -> i64
      %2427 = func.call @cc_intern(%2425, %2426) : (i64, i64) -> i64
      %2428 = func.call @cc_nil_value() : () -> i64
      %2429 = func.call @cc_cons(%2427, %2428) : (i64, i64) -> i64
      %2430 = func.call @cc_values_pack(%2429) : (i64) -> i64
      func.call @stack_push_pointer(%2427) : (i64) -> ()
      %2431 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2432 = arith.constant 27 : i64
      %2433 = func.call @cc_make_string(%2431, %2432) : (!llvm.ptr, i64) -> i64
      %2434 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2435 = arith.constant 3 : i64
      %2436 = func.call @cc_make_string(%2434, %2435) : (!llvm.ptr, i64) -> i64
      %2437 = func.call @cc_intern(%2433, %2436) : (i64, i64) -> i64
      %2438 = func.call @cc_nil_value() : () -> i64
      %2439 = func.call @cc_cons(%2437, %2438) : (i64, i64) -> i64
      %2440 = func.call @cc_values_pack(%2439) : (i64) -> i64
      func.call @stack_push_pointer(%2437) : (i64) -> ()
      %2441 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2442 = arith.constant 6 : i64
      %2443 = func.call @cc_make_string(%2441, %2442) : (!llvm.ptr, i64) -> i64
      %2444 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2445 = arith.constant 11 : i64
      %2446 = func.call @cc_make_string(%2444, %2445) : (!llvm.ptr, i64) -> i64
      %2447 = func.call @cc_intern(%2443, %2446) : (i64, i64) -> i64
      %2448 = func.call @cc_nil_value() : () -> i64
      %2449 = func.call @cc_cons(%2447, %2448) : (i64, i64) -> i64
      %2450 = func.call @cc_values_pack(%2449) : (i64) -> i64
      func.call @stack_push_pointer(%2447) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2451 = func.call @stack_pop_pointer() : () -> i64
      %2452 = func.call @stack_pop_pointer() : () -> i64
      %2453 = func.call @cc_cons(%2452, %2451) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2454 = arith.addi %2453, %__rlasp_stack_elide_zero_115 : i64
      %2455 = func.call @stack_pop_pointer() : () -> i64
      %2456 = func.call @cc_cons(%2455, %2454) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2456) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2457 = func.call @stack_pop_pointer() : () -> i64
      %2458 = func.call @stack_pop_pointer() : () -> i64
      %2459 = func.call @cc_cons(%2458, %2457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2460 = arith.addi %2459, %__rlasp_stack_elide_zero_116 : i64
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = func.call @cc_cons(%2461, %2460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2462) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2463 = func.call @stack_pop_pointer() : () -> i64
      %2464 = func.call @stack_pop_pointer() : () -> i64
      %2465 = func.call @cc_cons(%2464, %2463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2465) : (i64) -> ()
      %2466 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2467 = arith.constant 1 : i64
      %2468 = func.call @cc_make_string(%2466, %2467) : (!llvm.ptr, i64) -> i64
      %2469 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2470 = arith.constant 11 : i64
      %2471 = func.call @cc_make_string(%2469, %2470) : (!llvm.ptr, i64) -> i64
      %2472 = func.call @cc_intern(%2468, %2471) : (i64, i64) -> i64
      %2473 = func.call @cc_nil_value() : () -> i64
      %2474 = func.call @cc_cons(%2472, %2473) : (i64, i64) -> i64
      %2475 = func.call @cc_values_pack(%2474) : (i64) -> i64
      func.call @stack_push_pointer(%2472) : (i64) -> ()
      %2476 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2477 = arith.constant 9 : i64
      %2478 = func.call @cc_make_string(%2476, %2477) : (!llvm.ptr, i64) -> i64
      %2479 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2480 = arith.constant 11 : i64
      %2481 = func.call @cc_make_string(%2479, %2480) : (!llvm.ptr, i64) -> i64
      %2482 = func.call @cc_intern(%2478, %2481) : (i64, i64) -> i64
      %2483 = func.call @cc_nil_value() : () -> i64
      %2484 = func.call @cc_cons(%2482, %2483) : (i64, i64) -> i64
      %2485 = func.call @cc_values_pack(%2484) : (i64) -> i64
      func.call @stack_push_pointer(%2482) : (i64) -> ()
      %2486 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2486) : (i64) -> ()
      %2487 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2488 = arith.constant 4 : i64
      %2489 = func.call @cc_make_string(%2487, %2488) : (!llvm.ptr, i64) -> i64
      %2490 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2491 = arith.constant 3 : i64
      %2492 = func.call @cc_make_string(%2490, %2491) : (!llvm.ptr, i64) -> i64
      %2493 = func.call @cc_intern(%2489, %2492) : (i64, i64) -> i64
      %2494 = func.call @cc_nil_value() : () -> i64
      %2495 = func.call @cc_cons(%2493, %2494) : (i64, i64) -> i64
      %2496 = func.call @cc_values_pack(%2495) : (i64) -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      %2497 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2498 = arith.constant 4 : i64
      %2499 = func.call @cc_make_string(%2497, %2498) : (!llvm.ptr, i64) -> i64
      %2500 = func.call @cc_nil_value() : () -> i64
      %2501 = func.call @cc_intern(%2499, %2500) : (i64, i64) -> i64
      %2502 = func.call @cc_nil_value() : () -> i64
      %2503 = func.call @cc_cons(%2501, %2502) : (i64, i64) -> i64
      %2504 = func.call @cc_values_pack(%2503) : (i64) -> i64
      func.call @stack_push_pointer(%2501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2505 = func.call @stack_pop_pointer() : () -> i64
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @cc_cons(%2506, %2505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2508 = arith.addi %2507, %__rlasp_stack_elide_zero_117 : i64
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_cons(%2509, %2508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2511 = func.call @stack_pop_pointer() : () -> i64
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @cc_cons(%2512, %2511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2514 = arith.addi %2513, %__rlasp_stack_elide_zero_118 : i64
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @cc_cons(%2515, %2514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2517 = arith.addi %2516, %__rlasp_stack_elide_zero_119 : i64
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @cc_cons(%2518, %2517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2519) : (i64) -> ()
      %2520 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2521 = arith.constant 9 : i64
      %2522 = func.call @cc_make_string(%2520, %2521) : (!llvm.ptr, i64) -> i64
      %2523 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2524 = arith.constant 11 : i64
      %2525 = func.call @cc_make_string(%2523, %2524) : (!llvm.ptr, i64) -> i64
      %2526 = func.call @cc_intern(%2522, %2525) : (i64, i64) -> i64
      %2527 = func.call @cc_nil_value() : () -> i64
      %2528 = func.call @cc_cons(%2526, %2527) : (i64, i64) -> i64
      %2529 = func.call @cc_values_pack(%2528) : (i64) -> i64
      func.call @stack_push_pointer(%2526) : (i64) -> ()
      %2530 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2530) : (i64) -> ()
      %2531 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2532 = arith.constant 5 : i64
      %2533 = func.call @cc_make_string(%2531, %2532) : (!llvm.ptr, i64) -> i64
      %2534 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2535 = arith.constant 3 : i64
      %2536 = func.call @cc_make_string(%2534, %2535) : (!llvm.ptr, i64) -> i64
      %2537 = func.call @cc_intern(%2533, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_nil_value() : () -> i64
      %2539 = func.call @cc_cons(%2537, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_values_pack(%2539) : (i64) -> i64
      func.call @stack_push_pointer(%2537) : (i64) -> ()
      %2541 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2542 = arith.constant 2 : i64
      %2543 = func.call @cc_make_string(%2541, %2542) : (!llvm.ptr, i64) -> i64
      %2544 = func.call @cc_nil_value() : () -> i64
      %2545 = func.call @cc_intern(%2543, %2544) : (i64, i64) -> i64
      %2546 = func.call @cc_nil_value() : () -> i64
      %2547 = func.call @cc_cons(%2545, %2546) : (i64, i64) -> i64
      %2548 = func.call @cc_values_pack(%2547) : (i64) -> i64
      func.call @stack_push_pointer(%2545) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2549 = func.call @stack_pop_pointer() : () -> i64
      %2550 = func.call @stack_pop_pointer() : () -> i64
      %2551 = func.call @cc_cons(%2550, %2549) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2552 = arith.addi %2551, %__rlasp_stack_elide_zero_120 : i64
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2554 = func.call @cc_cons(%2553, %2552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2554) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2555 = func.call @stack_pop_pointer() : () -> i64
      %2556 = func.call @stack_pop_pointer() : () -> i64
      %2557 = func.call @cc_cons(%2556, %2555) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2558 = arith.addi %2557, %__rlasp_stack_elide_zero_121 : i64
      %2559 = func.call @stack_pop_pointer() : () -> i64
      %2560 = func.call @cc_cons(%2559, %2558) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2561 = arith.addi %2560, %__rlasp_stack_elide_zero_122 : i64
      %2562 = func.call @stack_pop_pointer() : () -> i64
      %2563 = func.call @cc_cons(%2562, %2561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2564 = func.call @stack_pop_pointer() : () -> i64
      %2565 = func.call @stack_pop_pointer() : () -> i64
      %2566 = func.call @cc_cons(%2565, %2564) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2567 = arith.addi %2566, %__rlasp_stack_elide_zero_123 : i64
      %2568 = func.call @stack_pop_pointer() : () -> i64
      %2569 = func.call @cc_cons(%2568, %2567) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2570 = arith.addi %2569, %__rlasp_stack_elide_zero_124 : i64
      %2571 = func.call @stack_pop_pointer() : () -> i64
      %2572 = func.call @cc_cons(%2571, %2570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2572) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2573 = func.call @stack_pop_pointer() : () -> i64
      %2574 = func.call @stack_pop_pointer() : () -> i64
      %2575 = func.call @cc_cons(%2574, %2573) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2576 = arith.addi %2575, %__rlasp_stack_elide_zero_125 : i64
      %2577 = func.call @stack_pop_pointer() : () -> i64
      %2578 = func.call @cc_cons(%2577, %2576) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2579 = arith.addi %2578, %__rlasp_stack_elide_zero_126 : i64
      %2580 = func.call @stack_pop_pointer() : () -> i64
      %2581 = func.call @cc_cons(%2580, %2579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2582 = func.call @stack_pop_pointer() : () -> i64
      %2583 = func.call @stack_pop_pointer() : () -> i64
      %2584 = func.call @cc_cons(%2583, %2582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2585 = arith.addi %2584, %__rlasp_stack_elide_zero_127 : i64
      %2586 = func.call @stack_pop_pointer() : () -> i64
      %2587 = func.call @cc_cons(%2586, %2585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2588 = arith.addi %2587, %__rlasp_stack_elide_zero_128 : i64
      %2589 = func.call @stack_pop_pointer() : () -> i64
      %2590 = func.call @cc_cons(%2589, %2588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2590) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2591 = func.call @stack_pop_pointer() : () -> i64
      %2592 = func.call @stack_pop_pointer() : () -> i64
      %2593 = func.call @cc_cons(%2592, %2591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2594 = arith.addi %2593, %__rlasp_stack_elide_zero_129 : i64
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @cc_cons(%2595, %2594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2597 = arith.addi %2596, %__rlasp_stack_elide_zero_130 : i64
      %2598 = func.call @stack_pop_pointer() : () -> i64
      %2599 = func.call @cc_cons(%2598, %2597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @stack_pop_pointer() : () -> i64
      %2602 = func.call @cc_cons(%2601, %2600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2603 = arith.addi %2602, %__rlasp_stack_elide_zero_131 : i64
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @cc_cons(%2604, %2603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2605) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_cons(%2607, %2606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2609 = arith.addi %2608, %__rlasp_stack_elide_zero_132 : i64
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @cc_cons(%2610, %2609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2612 = arith.addi %2611, %__rlasp_stack_elide_zero_133 : i64
      %2772 = arith.constant 269090723725320 : i64
      %2773 = arith.constant 0 : i64
      %2774 = func.call @cc_make_closure(%2772, %2773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2775 = arith.addi %2774, %__rlasp_stack_elide_zero_134 : i64
      %2776 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2777 = arith.constant 1 : i64
      %2778 = func.call @cc_make_string(%2776, %2777) : (!llvm.ptr, i64) -> i64
      %2779 = func.call @cc_nil_value() : () -> i64
      %2780 = func.call @cc_intern(%2778, %2779) : (i64, i64) -> i64
      %2781 = func.call @cc_nil_value() : () -> i64
      %2782 = func.call @cc_cons(%2780, %2781) : (i64, i64) -> i64
      %2783 = func.call @cc_values_pack(%2782) : (i64) -> i64
      func.call @stack_push_pointer(%2780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2784 = func.call @stack_pop_pointer() : () -> i64
      %2785 = func.call @stack_pop_pointer() : () -> i64
      %2786 = func.call @cc_cons(%2785, %2784) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2787 = arith.addi %2786, %__rlasp_stack_elide_zero_135 : i64
      %2788 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2789 = arith.constant 11 : i64
      %2790 = func.call @cc_make_string(%2788, %2789) : (!llvm.ptr, i64) -> i64
      %2791 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2792 = arith.constant 7 : i64
      %2793 = func.call @cc_make_string(%2791, %2792) : (!llvm.ptr, i64) -> i64
      %2794 = func.call @cc_intern(%2790, %2793) : (i64, i64) -> i64
      %2795 = func.call @cc_nil_value() : () -> i64
      %2796 = func.call @cc_cons(%2794, %2795) : (i64, i64) -> i64
      %2797 = func.call @cc_values_pack(%2796) : (i64) -> i64
      %2798 = func.call @cc_nil_value() : () -> i64
      %2799 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2800 = arith.constant 4 : i64
      %2801 = func.call @cc_make_string(%2799, %2800) : (!llvm.ptr, i64) -> i64
      %2802 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2803 = arith.constant 7 : i64
      %2804 = func.call @cc_make_string(%2802, %2803) : (!llvm.ptr, i64) -> i64
      %2805 = func.call @cc_intern(%2801, %2804) : (i64, i64) -> i64
      %2806 = func.call @cc_nil_value() : () -> i64
      %2807 = func.call @cc_cons(%2805, %2806) : (i64, i64) -> i64
      %2808 = func.call @cc_values_pack(%2807) : (i64) -> i64
      %2809 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2810 = arith.constant 6 : i64
      %2811 = func.call @cc_make_string(%2809, %2810) : (!llvm.ptr, i64) -> i64
      %2812 = func.call @cc_nil_value() : () -> i64
      %2813 = func.call @cc_intern(%2811, %2812) : (i64, i64) -> i64
      %2814 = func.call @cc_nil_value() : () -> i64
      %2815 = func.call @cc_cons(%2813, %2814) : (i64, i64) -> i64
      %2816 = func.call @cc_values_pack(%2815) : (i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2817 = arith.addi %2813, %__rlasp_stack_elide_zero_136 : i64
      %2818 = func.call @cc_nil_value() : () -> i64
      %2819 = func.call @cc_errorp(%2310) : (i64) -> i64
      %2820 = arith.cmpi ne, %2819, %2818 : i64
      %2821 = arith.cmpi eq, %2818, %2818 : i64
      %2822 = arith.andi %2820, %2821 : i1
      %2823 = scf.if %2822 -> (i64) {
        scf.yield %2310 : i64
      } else {
        scf.yield %2818 : i64
      }
      %2824 = func.call @cc_errorp(%2612) : (i64) -> i64
      %2825 = arith.cmpi ne, %2824, %2818 : i64
      %2826 = arith.cmpi eq, %2823, %2818 : i64
      %2827 = arith.andi %2825, %2826 : i1
      %2828 = scf.if %2827 -> (i64) {
        scf.yield %2612 : i64
      } else {
        scf.yield %2823 : i64
      }
      %2829 = func.call @cc_errorp(%2775) : (i64) -> i64
      %2830 = arith.cmpi ne, %2829, %2818 : i64
      %2831 = arith.cmpi eq, %2828, %2818 : i64
      %2832 = arith.andi %2830, %2831 : i1
      %2833 = scf.if %2832 -> (i64) {
        scf.yield %2775 : i64
      } else {
        scf.yield %2828 : i64
      }
      %2834 = func.call @cc_errorp(%2787) : (i64) -> i64
      %2835 = arith.cmpi ne, %2834, %2818 : i64
      %2836 = arith.cmpi eq, %2833, %2818 : i64
      %2837 = arith.andi %2835, %2836 : i1
      %2838 = scf.if %2837 -> (i64) {
        scf.yield %2787 : i64
      } else {
        scf.yield %2833 : i64
      }
      %2839 = func.call @cc_errorp(%2794) : (i64) -> i64
      %2840 = arith.cmpi ne, %2839, %2818 : i64
      %2841 = arith.cmpi eq, %2838, %2818 : i64
      %2842 = arith.andi %2840, %2841 : i1
      %2843 = scf.if %2842 -> (i64) {
        scf.yield %2794 : i64
      } else {
        scf.yield %2838 : i64
      }
      %2844 = func.call @cc_errorp(%2798) : (i64) -> i64
      %2845 = arith.cmpi ne, %2844, %2818 : i64
      %2846 = arith.cmpi eq, %2843, %2818 : i64
      %2847 = arith.andi %2845, %2846 : i1
      %2848 = scf.if %2847 -> (i64) {
        scf.yield %2798 : i64
      } else {
        scf.yield %2843 : i64
      }
      %2849 = func.call @cc_errorp(%2805) : (i64) -> i64
      %2850 = arith.cmpi ne, %2849, %2818 : i64
      %2851 = arith.cmpi eq, %2848, %2818 : i64
      %2852 = arith.andi %2850, %2851 : i1
      %2853 = scf.if %2852 -> (i64) {
        scf.yield %2805 : i64
      } else {
        scf.yield %2848 : i64
      }
      %2854 = func.call @cc_errorp(%2817) : (i64) -> i64
      %2855 = arith.cmpi ne, %2854, %2818 : i64
      %2856 = arith.cmpi eq, %2853, %2818 : i64
      %2857 = arith.andi %2855, %2856 : i1
      %2858 = scf.if %2857 -> (i64) {
        scf.yield %2817 : i64
      } else {
        scf.yield %2853 : i64
      }
      %2859 = arith.cmpi ne, %2858, %2818 : i64
      scf.if %2859 {
        func.call @stack_push_pointer(%2858) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2310) : (i64) -> ()
        func.call @stack_push_pointer(%2612) : (i64) -> ()
        func.call @stack_push_pointer(%2775) : (i64) -> ()
        func.call @stack_push_pointer(%2787) : (i64) -> ()
        func.call @stack_push_pointer(%2794) : (i64) -> ()
        func.call @stack_push_pointer(%2798) : (i64) -> ()
        func.call @stack_push_pointer(%2805) : (i64) -> ()
        func.call @stack_push_pointer(%2817) : (i64) -> ()
        %2860 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2861 = func.call @cc_make_function_ref_const(%2860) : (!llvm.ptr) -> i64
        %2862 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2861, %2862) : (i64, i64) -> ()
      }
      %2863 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2863 : i64
    }
    %2864 = func.call @cc_nil_value() : () -> i64
    %2865 = func.call @cc_errorp(%2301) : (i64) -> i64
    %2866 = arith.cmpi ne, %2865, %2864 : i64
    %2867 = scf.if %2866 -> (i64) {
      scf.yield %2301 : i64
    } else {
      %2868 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2869 = arith.constant 10 : i64
      %2870 = func.call @cc_make_string(%2868, %2869) : (!llvm.ptr, i64) -> i64
      %2871 = func.call @cc_nil_value() : () -> i64
      %2872 = func.call @cc_intern(%2870, %2871) : (i64, i64) -> i64
      %2873 = func.call @cc_nil_value() : () -> i64
      %2874 = func.call @cc_cons(%2872, %2873) : (i64, i64) -> i64
      %2875 = func.call @cc_values_pack(%2874) : (i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2876 = arith.addi %2872, %__rlasp_stack_elide_zero_137 : i64
      %2877 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2878 = arith.constant 3 : i64
      %2879 = func.call @cc_make_string(%2877, %2878) : (!llvm.ptr, i64) -> i64
      %2880 = func.call @cc_nil_value() : () -> i64
      %2881 = func.call @cc_intern(%2879, %2880) : (i64, i64) -> i64
      %2882 = func.call @cc_nil_value() : () -> i64
      %2883 = func.call @cc_cons(%2881, %2882) : (i64, i64) -> i64
      %2884 = func.call @cc_values_pack(%2883) : (i64) -> i64
      func.call @stack_push_pointer(%2881) : (i64) -> ()
      %2885 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2886 = arith.constant 3 : i64
      %2887 = func.call @cc_make_string(%2885, %2886) : (!llvm.ptr, i64) -> i64
      %2888 = func.call @cc_nil_value() : () -> i64
      %2889 = func.call @cc_intern(%2887, %2888) : (i64, i64) -> i64
      %2890 = func.call @cc_nil_value() : () -> i64
      %2891 = func.call @cc_cons(%2889, %2890) : (i64, i64) -> i64
      %2892 = func.call @cc_values_pack(%2891) : (i64) -> i64
      func.call @stack_push_pointer(%2889) : (i64) -> ()
      %2893 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2894 = arith.constant 3 : i64
      %2895 = func.call @cc_make_string(%2893, %2894) : (!llvm.ptr, i64) -> i64
      %2896 = func.call @cc_nil_value() : () -> i64
      %2897 = func.call @cc_intern(%2895, %2896) : (i64, i64) -> i64
      %2898 = func.call @cc_nil_value() : () -> i64
      %2899 = func.call @cc_cons(%2897, %2898) : (i64, i64) -> i64
      %2900 = func.call @cc_values_pack(%2899) : (i64) -> i64
      func.call @stack_push_pointer(%2897) : (i64) -> ()
      %2901 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2902 = arith.constant 4 : i64
      %2903 = func.call @cc_make_string(%2901, %2902) : (!llvm.ptr, i64) -> i64
      %2904 = func.call @cc_nil_value() : () -> i64
      %2905 = func.call @cc_intern(%2903, %2904) : (i64, i64) -> i64
      %2906 = func.call @cc_nil_value() : () -> i64
      %2907 = func.call @cc_cons(%2905, %2906) : (i64, i64) -> i64
      %2908 = func.call @cc_values_pack(%2907) : (i64) -> i64
      func.call @stack_push_pointer(%2905) : (i64) -> ()
      %2909 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2910 = arith.constant 42 : i64
      %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2911) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2912 = func.call @stack_pop_pointer() : () -> i64
      %2913 = func.call @stack_pop_pointer() : () -> i64
      %2914 = func.call @cc_cons(%2913, %2912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2915 = arith.addi %2914, %__rlasp_stack_elide_zero_138 : i64
      %2916 = func.call @stack_pop_pointer() : () -> i64
      %2917 = func.call @cc_cons(%2916, %2915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2917) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = func.call @stack_pop_pointer() : () -> i64
      %2920 = func.call @cc_cons(%2919, %2918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2920) : (i64) -> ()
      %2921 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2922 = arith.constant 14 : i64
      %2923 = func.call @cc_make_string(%2921, %2922) : (!llvm.ptr, i64) -> i64
      %2924 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2925 = arith.constant 11 : i64
      %2926 = func.call @cc_make_string(%2924, %2925) : (!llvm.ptr, i64) -> i64
      %2927 = func.call @cc_intern(%2923, %2926) : (i64, i64) -> i64
      %2928 = func.call @cc_nil_value() : () -> i64
      %2929 = func.call @cc_cons(%2927, %2928) : (i64, i64) -> i64
      %2930 = func.call @cc_values_pack(%2929) : (i64) -> i64
      func.call @stack_push_pointer(%2927) : (i64) -> ()
      %2931 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2932 = arith.constant 6 : i64
      %2933 = func.call @cc_make_string(%2931, %2932) : (!llvm.ptr, i64) -> i64
      %2934 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2935 = arith.constant 11 : i64
      %2936 = func.call @cc_make_string(%2934, %2935) : (!llvm.ptr, i64) -> i64
      %2937 = func.call @cc_intern(%2933, %2936) : (i64, i64) -> i64
      %2938 = func.call @cc_nil_value() : () -> i64
      %2939 = func.call @cc_cons(%2937, %2938) : (i64, i64) -> i64
      %2940 = func.call @cc_values_pack(%2939) : (i64) -> i64
      func.call @stack_push_pointer(%2937) : (i64) -> ()
      %2941 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2942 = arith.constant 4 : i64
      %2943 = func.call @cc_make_string(%2941, %2942) : (!llvm.ptr, i64) -> i64
      %2944 = func.call @cc_nil_value() : () -> i64
      %2945 = func.call @cc_intern(%2943, %2944) : (i64, i64) -> i64
      %2946 = func.call @cc_nil_value() : () -> i64
      %2947 = func.call @cc_cons(%2945, %2946) : (i64, i64) -> i64
      %2948 = func.call @cc_values_pack(%2947) : (i64) -> i64
      func.call @stack_push_pointer(%2945) : (i64) -> ()
      %2949 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2950 = arith.constant 9 : i64
      %2951 = func.call @cc_make_string(%2949, %2950) : (!llvm.ptr, i64) -> i64
      %2952 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2953 = arith.constant 7 : i64
      %2954 = func.call @cc_make_string(%2952, %2953) : (!llvm.ptr, i64) -> i64
      %2955 = func.call @cc_intern(%2951, %2954) : (i64, i64) -> i64
      %2956 = func.call @cc_nil_value() : () -> i64
      %2957 = func.call @cc_cons(%2955, %2956) : (i64, i64) -> i64
      %2958 = func.call @cc_values_pack(%2957) : (i64) -> i64
      func.call @stack_push_pointer(%2955) : (i64) -> ()
      %2959 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2960 = arith.constant 5 : i64
      %2961 = func.call @cc_make_string(%2959, %2960) : (!llvm.ptr, i64) -> i64
      %2962 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2963 = arith.constant 7 : i64
      %2964 = func.call @cc_make_string(%2962, %2963) : (!llvm.ptr, i64) -> i64
      %2965 = func.call @cc_intern(%2961, %2964) : (i64, i64) -> i64
      %2966 = func.call @cc_nil_value() : () -> i64
      %2967 = func.call @cc_cons(%2965, %2966) : (i64, i64) -> i64
      %2968 = func.call @cc_values_pack(%2967) : (i64) -> i64
      func.call @stack_push_pointer(%2965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @stack_pop_pointer() : () -> i64
      %2971 = func.call @cc_cons(%2970, %2969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2972 = arith.addi %2971, %__rlasp_stack_elide_zero_139 : i64
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @cc_cons(%2973, %2972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2975 = arith.addi %2974, %__rlasp_stack_elide_zero_140 : i64
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = func.call @cc_cons(%2976, %2975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2978 = arith.addi %2977, %__rlasp_stack_elide_zero_141 : i64
      %2979 = func.call @stack_pop_pointer() : () -> i64
      %2980 = func.call @cc_cons(%2979, %2978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      %2981 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2982 = arith.constant 3 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      %2984 = func.call @cc_nil_value() : () -> i64
      %2985 = func.call @cc_intern(%2983, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_values_pack(%2987) : (i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2989 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2990 = arith.constant 2 : i64
      %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
      %2992 = func.call @cc_nil_value() : () -> i64
      %2993 = func.call @cc_intern(%2991, %2992) : (i64, i64) -> i64
      %2994 = func.call @cc_nil_value() : () -> i64
      %2995 = func.call @cc_cons(%2993, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_values_pack(%2995) : (i64) -> i64
      func.call @stack_push_pointer(%2993) : (i64) -> ()
      %2997 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2998 = arith.constant 27 : i64
      %2999 = func.call @cc_make_string(%2997, %2998) : (!llvm.ptr, i64) -> i64
      %3000 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3001 = arith.constant 3 : i64
      %3002 = func.call @cc_make_string(%3000, %3001) : (!llvm.ptr, i64) -> i64
      %3003 = func.call @cc_intern(%2999, %3002) : (i64, i64) -> i64
      %3004 = func.call @cc_nil_value() : () -> i64
      %3005 = func.call @cc_cons(%3003, %3004) : (i64, i64) -> i64
      %3006 = func.call @cc_values_pack(%3005) : (i64) -> i64
      func.call @stack_push_pointer(%3003) : (i64) -> ()
      %3007 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3008 = arith.constant 6 : i64
      %3009 = func.call @cc_make_string(%3007, %3008) : (!llvm.ptr, i64) -> i64
      %3010 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3011 = arith.constant 11 : i64
      %3012 = func.call @cc_make_string(%3010, %3011) : (!llvm.ptr, i64) -> i64
      %3013 = func.call @cc_intern(%3009, %3012) : (i64, i64) -> i64
      %3014 = func.call @cc_nil_value() : () -> i64
      %3015 = func.call @cc_cons(%3013, %3014) : (i64, i64) -> i64
      %3016 = func.call @cc_values_pack(%3015) : (i64) -> i64
      func.call @stack_push_pointer(%3013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = func.call @stack_pop_pointer() : () -> i64
      %3019 = func.call @cc_cons(%3018, %3017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3020 = arith.addi %3019, %__rlasp_stack_elide_zero_142 : i64
      %3021 = func.call @stack_pop_pointer() : () -> i64
      %3022 = func.call @cc_cons(%3021, %3020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3022) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3023 = func.call @stack_pop_pointer() : () -> i64
      %3024 = func.call @stack_pop_pointer() : () -> i64
      %3025 = func.call @cc_cons(%3024, %3023) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3026 = arith.addi %3025, %__rlasp_stack_elide_zero_143 : i64
      %3027 = func.call @stack_pop_pointer() : () -> i64
      %3028 = func.call @cc_cons(%3027, %3026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3029 = func.call @stack_pop_pointer() : () -> i64
      %3030 = func.call @stack_pop_pointer() : () -> i64
      %3031 = func.call @cc_cons(%3030, %3029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3031) : (i64) -> ()
      %3032 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3033 = arith.constant 1 : i64
      %3034 = func.call @cc_make_string(%3032, %3033) : (!llvm.ptr, i64) -> i64
      %3035 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3036 = arith.constant 11 : i64
      %3037 = func.call @cc_make_string(%3035, %3036) : (!llvm.ptr, i64) -> i64
      %3038 = func.call @cc_intern(%3034, %3037) : (i64, i64) -> i64
      %3039 = func.call @cc_nil_value() : () -> i64
      %3040 = func.call @cc_cons(%3038, %3039) : (i64, i64) -> i64
      %3041 = func.call @cc_values_pack(%3040) : (i64) -> i64
      func.call @stack_push_pointer(%3038) : (i64) -> ()
      %3042 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3043 = arith.constant 9 : i64
      %3044 = func.call @cc_make_string(%3042, %3043) : (!llvm.ptr, i64) -> i64
      %3045 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3046 = arith.constant 11 : i64
      %3047 = func.call @cc_make_string(%3045, %3046) : (!llvm.ptr, i64) -> i64
      %3048 = func.call @cc_intern(%3044, %3047) : (i64, i64) -> i64
      %3049 = func.call @cc_nil_value() : () -> i64
      %3050 = func.call @cc_cons(%3048, %3049) : (i64, i64) -> i64
      %3051 = func.call @cc_values_pack(%3050) : (i64) -> i64
      func.call @stack_push_pointer(%3048) : (i64) -> ()
      %3052 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3052) : (i64) -> ()
      %3053 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3054 = arith.constant 4 : i64
      %3055 = func.call @cc_make_string(%3053, %3054) : (!llvm.ptr, i64) -> i64
      %3056 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3057 = arith.constant 3 : i64
      %3058 = func.call @cc_make_string(%3056, %3057) : (!llvm.ptr, i64) -> i64
      %3059 = func.call @cc_intern(%3055, %3058) : (i64, i64) -> i64
      %3060 = func.call @cc_nil_value() : () -> i64
      %3061 = func.call @cc_cons(%3059, %3060) : (i64, i64) -> i64
      %3062 = func.call @cc_values_pack(%3061) : (i64) -> i64
      func.call @stack_push_pointer(%3059) : (i64) -> ()
      %3063 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3064 = arith.constant 4 : i64
      %3065 = func.call @cc_make_string(%3063, %3064) : (!llvm.ptr, i64) -> i64
      %3066 = func.call @cc_nil_value() : () -> i64
      %3067 = func.call @cc_intern(%3065, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_nil_value() : () -> i64
      %3069 = func.call @cc_cons(%3067, %3068) : (i64, i64) -> i64
      %3070 = func.call @cc_values_pack(%3069) : (i64) -> i64
      func.call @stack_push_pointer(%3067) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3071 = func.call @stack_pop_pointer() : () -> i64
      %3072 = func.call @stack_pop_pointer() : () -> i64
      %3073 = func.call @cc_cons(%3072, %3071) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3074 = arith.addi %3073, %__rlasp_stack_elide_zero_144 : i64
      %3075 = func.call @stack_pop_pointer() : () -> i64
      %3076 = func.call @cc_cons(%3075, %3074) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3076) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3077 = func.call @stack_pop_pointer() : () -> i64
      %3078 = func.call @stack_pop_pointer() : () -> i64
      %3079 = func.call @cc_cons(%3078, %3077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3080 = arith.addi %3079, %__rlasp_stack_elide_zero_145 : i64
      %3081 = func.call @stack_pop_pointer() : () -> i64
      %3082 = func.call @cc_cons(%3081, %3080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3083 = arith.addi %3082, %__rlasp_stack_elide_zero_146 : i64
      %3084 = func.call @stack_pop_pointer() : () -> i64
      %3085 = func.call @cc_cons(%3084, %3083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3085) : (i64) -> ()
      %3086 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3087 = arith.constant 9 : i64
      %3088 = func.call @cc_make_string(%3086, %3087) : (!llvm.ptr, i64) -> i64
      %3089 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3090 = arith.constant 11 : i64
      %3091 = func.call @cc_make_string(%3089, %3090) : (!llvm.ptr, i64) -> i64
      %3092 = func.call @cc_intern(%3088, %3091) : (i64, i64) -> i64
      %3093 = func.call @cc_nil_value() : () -> i64
      %3094 = func.call @cc_cons(%3092, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_values_pack(%3094) : (i64) -> i64
      func.call @stack_push_pointer(%3092) : (i64) -> ()
      %3096 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3096) : (i64) -> ()
      %3097 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3098 = arith.constant 5 : i64
      %3099 = func.call @cc_make_string(%3097, %3098) : (!llvm.ptr, i64) -> i64
      %3100 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3101 = arith.constant 3 : i64
      %3102 = func.call @cc_make_string(%3100, %3101) : (!llvm.ptr, i64) -> i64
      %3103 = func.call @cc_intern(%3099, %3102) : (i64, i64) -> i64
      %3104 = func.call @cc_nil_value() : () -> i64
      %3105 = func.call @cc_cons(%3103, %3104) : (i64, i64) -> i64
      %3106 = func.call @cc_values_pack(%3105) : (i64) -> i64
      func.call @stack_push_pointer(%3103) : (i64) -> ()
      %3107 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3108 = arith.constant 2 : i64
      %3109 = func.call @cc_make_string(%3107, %3108) : (!llvm.ptr, i64) -> i64
      %3110 = func.call @cc_nil_value() : () -> i64
      %3111 = func.call @cc_intern(%3109, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_nil_value() : () -> i64
      %3113 = func.call @cc_cons(%3111, %3112) : (i64, i64) -> i64
      %3114 = func.call @cc_values_pack(%3113) : (i64) -> i64
      func.call @stack_push_pointer(%3111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3115 = func.call @stack_pop_pointer() : () -> i64
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @cc_cons(%3116, %3115) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3118 = arith.addi %3117, %__rlasp_stack_elide_zero_147 : i64
      %3119 = func.call @stack_pop_pointer() : () -> i64
      %3120 = func.call @cc_cons(%3119, %3118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3121 = func.call @stack_pop_pointer() : () -> i64
      %3122 = func.call @stack_pop_pointer() : () -> i64
      %3123 = func.call @cc_cons(%3122, %3121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3124 = arith.addi %3123, %__rlasp_stack_elide_zero_148 : i64
      %3125 = func.call @stack_pop_pointer() : () -> i64
      %3126 = func.call @cc_cons(%3125, %3124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3127 = arith.addi %3126, %__rlasp_stack_elide_zero_149 : i64
      %3128 = func.call @stack_pop_pointer() : () -> i64
      %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @stack_pop_pointer() : () -> i64
      %3132 = func.call @cc_cons(%3131, %3130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3133 = arith.addi %3132, %__rlasp_stack_elide_zero_150 : i64
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_cons(%3134, %3133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3136 = arith.addi %3135, %__rlasp_stack_elide_zero_151 : i64
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = func.call @cc_cons(%3137, %3136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3139 = func.call @stack_pop_pointer() : () -> i64
      %3140 = func.call @stack_pop_pointer() : () -> i64
      %3141 = func.call @cc_cons(%3140, %3139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3142 = arith.addi %3141, %__rlasp_stack_elide_zero_152 : i64
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @cc_cons(%3143, %3142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3145 = arith.addi %3144, %__rlasp_stack_elide_zero_153 : i64
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @cc_cons(%3146, %3145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3148 = func.call @stack_pop_pointer() : () -> i64
      %3149 = func.call @stack_pop_pointer() : () -> i64
      %3150 = func.call @cc_cons(%3149, %3148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3151 = arith.addi %3150, %__rlasp_stack_elide_zero_154 : i64
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = func.call @cc_cons(%3152, %3151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3154 = arith.addi %3153, %__rlasp_stack_elide_zero_155 : i64
      %3155 = func.call @stack_pop_pointer() : () -> i64
      %3156 = func.call @cc_cons(%3155, %3154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3157 = func.call @stack_pop_pointer() : () -> i64
      %3158 = func.call @stack_pop_pointer() : () -> i64
      %3159 = func.call @cc_cons(%3158, %3157) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3160 = arith.addi %3159, %__rlasp_stack_elide_zero_156 : i64
      %3161 = func.call @stack_pop_pointer() : () -> i64
      %3162 = func.call @cc_cons(%3161, %3160) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3163 = arith.addi %3162, %__rlasp_stack_elide_zero_157 : i64
      %3164 = func.call @stack_pop_pointer() : () -> i64
      %3165 = func.call @cc_cons(%3164, %3163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3165) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3166 = func.call @stack_pop_pointer() : () -> i64
      %3167 = func.call @stack_pop_pointer() : () -> i64
      %3168 = func.call @cc_cons(%3167, %3166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3169 = arith.addi %3168, %__rlasp_stack_elide_zero_158 : i64
      %3170 = func.call @stack_pop_pointer() : () -> i64
      %3171 = func.call @cc_cons(%3170, %3169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3172 = func.call @stack_pop_pointer() : () -> i64
      %3173 = func.call @stack_pop_pointer() : () -> i64
      %3174 = func.call @cc_cons(%3173, %3172) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3175 = arith.addi %3174, %__rlasp_stack_elide_zero_159 : i64
      %3176 = func.call @stack_pop_pointer() : () -> i64
      %3177 = func.call @cc_cons(%3176, %3175) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3178 = arith.addi %3177, %__rlasp_stack_elide_zero_160 : i64
      %3338 = arith.constant 269090723725321 : i64
      %3339 = arith.constant 0 : i64
      %3340 = func.call @cc_make_closure(%3338, %3339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3341 = arith.addi %3340, %__rlasp_stack_elide_zero_161 : i64
      %3342 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3343 = arith.constant 1 : i64
      %3344 = func.call @cc_make_string(%3342, %3343) : (!llvm.ptr, i64) -> i64
      %3345 = func.call @cc_nil_value() : () -> i64
      %3346 = func.call @cc_intern(%3344, %3345) : (i64, i64) -> i64
      %3347 = func.call @cc_nil_value() : () -> i64
      %3348 = func.call @cc_cons(%3346, %3347) : (i64, i64) -> i64
      %3349 = func.call @cc_values_pack(%3348) : (i64) -> i64
      func.call @stack_push_pointer(%3346) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3350 = func.call @stack_pop_pointer() : () -> i64
      %3351 = func.call @stack_pop_pointer() : () -> i64
      %3352 = func.call @cc_cons(%3351, %3350) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3353 = arith.addi %3352, %__rlasp_stack_elide_zero_162 : i64
      %3354 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3355 = arith.constant 11 : i64
      %3356 = func.call @cc_make_string(%3354, %3355) : (!llvm.ptr, i64) -> i64
      %3357 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3358 = arith.constant 7 : i64
      %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
      %3360 = func.call @cc_intern(%3356, %3359) : (i64, i64) -> i64
      %3361 = func.call @cc_nil_value() : () -> i64
      %3362 = func.call @cc_cons(%3360, %3361) : (i64, i64) -> i64
      %3363 = func.call @cc_values_pack(%3362) : (i64) -> i64
      %3364 = func.call @cc_nil_value() : () -> i64
      %3365 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3366 = arith.constant 4 : i64
      %3367 = func.call @cc_make_string(%3365, %3366) : (!llvm.ptr, i64) -> i64
      %3368 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3369 = arith.constant 7 : i64
      %3370 = func.call @cc_make_string(%3368, %3369) : (!llvm.ptr, i64) -> i64
      %3371 = func.call @cc_intern(%3367, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_nil_value() : () -> i64
      %3373 = func.call @cc_cons(%3371, %3372) : (i64, i64) -> i64
      %3374 = func.call @cc_values_pack(%3373) : (i64) -> i64
      %3375 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3376 = arith.constant 6 : i64
      %3377 = func.call @cc_make_string(%3375, %3376) : (!llvm.ptr, i64) -> i64
      %3378 = func.call @cc_nil_value() : () -> i64
      %3379 = func.call @cc_intern(%3377, %3378) : (i64, i64) -> i64
      %3380 = func.call @cc_nil_value() : () -> i64
      %3381 = func.call @cc_cons(%3379, %3380) : (i64, i64) -> i64
      %3382 = func.call @cc_values_pack(%3381) : (i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3383 = arith.addi %3379, %__rlasp_stack_elide_zero_163 : i64
      %3384 = func.call @cc_nil_value() : () -> i64
      %3385 = func.call @cc_errorp(%2876) : (i64) -> i64
      %3386 = arith.cmpi ne, %3385, %3384 : i64
      %3387 = arith.cmpi eq, %3384, %3384 : i64
      %3388 = arith.andi %3386, %3387 : i1
      %3389 = scf.if %3388 -> (i64) {
        scf.yield %2876 : i64
      } else {
        scf.yield %3384 : i64
      }
      %3390 = func.call @cc_errorp(%3178) : (i64) -> i64
      %3391 = arith.cmpi ne, %3390, %3384 : i64
      %3392 = arith.cmpi eq, %3389, %3384 : i64
      %3393 = arith.andi %3391, %3392 : i1
      %3394 = scf.if %3393 -> (i64) {
        scf.yield %3178 : i64
      } else {
        scf.yield %3389 : i64
      }
      %3395 = func.call @cc_errorp(%3341) : (i64) -> i64
      %3396 = arith.cmpi ne, %3395, %3384 : i64
      %3397 = arith.cmpi eq, %3394, %3384 : i64
      %3398 = arith.andi %3396, %3397 : i1
      %3399 = scf.if %3398 -> (i64) {
        scf.yield %3341 : i64
      } else {
        scf.yield %3394 : i64
      }
      %3400 = func.call @cc_errorp(%3353) : (i64) -> i64
      %3401 = arith.cmpi ne, %3400, %3384 : i64
      %3402 = arith.cmpi eq, %3399, %3384 : i64
      %3403 = arith.andi %3401, %3402 : i1
      %3404 = scf.if %3403 -> (i64) {
        scf.yield %3353 : i64
      } else {
        scf.yield %3399 : i64
      }
      %3405 = func.call @cc_errorp(%3360) : (i64) -> i64
      %3406 = arith.cmpi ne, %3405, %3384 : i64
      %3407 = arith.cmpi eq, %3404, %3384 : i64
      %3408 = arith.andi %3406, %3407 : i1
      %3409 = scf.if %3408 -> (i64) {
        scf.yield %3360 : i64
      } else {
        scf.yield %3404 : i64
      }
      %3410 = func.call @cc_errorp(%3364) : (i64) -> i64
      %3411 = arith.cmpi ne, %3410, %3384 : i64
      %3412 = arith.cmpi eq, %3409, %3384 : i64
      %3413 = arith.andi %3411, %3412 : i1
      %3414 = scf.if %3413 -> (i64) {
        scf.yield %3364 : i64
      } else {
        scf.yield %3409 : i64
      }
      %3415 = func.call @cc_errorp(%3371) : (i64) -> i64
      %3416 = arith.cmpi ne, %3415, %3384 : i64
      %3417 = arith.cmpi eq, %3414, %3384 : i64
      %3418 = arith.andi %3416, %3417 : i1
      %3419 = scf.if %3418 -> (i64) {
        scf.yield %3371 : i64
      } else {
        scf.yield %3414 : i64
      }
      %3420 = func.call @cc_errorp(%3383) : (i64) -> i64
      %3421 = arith.cmpi ne, %3420, %3384 : i64
      %3422 = arith.cmpi eq, %3419, %3384 : i64
      %3423 = arith.andi %3421, %3422 : i1
      %3424 = scf.if %3423 -> (i64) {
        scf.yield %3383 : i64
      } else {
        scf.yield %3419 : i64
      }
      %3425 = arith.cmpi ne, %3424, %3384 : i64
      scf.if %3425 {
        func.call @stack_push_pointer(%3424) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2876) : (i64) -> ()
        func.call @stack_push_pointer(%3178) : (i64) -> ()
        func.call @stack_push_pointer(%3341) : (i64) -> ()
        func.call @stack_push_pointer(%3353) : (i64) -> ()
        func.call @stack_push_pointer(%3360) : (i64) -> ()
        func.call @stack_push_pointer(%3364) : (i64) -> ()
        func.call @stack_push_pointer(%3371) : (i64) -> ()
        func.call @stack_push_pointer(%3383) : (i64) -> ()
        %3426 = llvm.mlir.addressof @str298 : !llvm.ptr
        %3427 = func.call @cc_make_function_ref_const(%3426) : (!llvm.ptr) -> i64
        %3428 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3427, %3428) : (i64, i64) -> ()
      }
      %3429 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3429 : i64
    }
    %3430 = func.call @cc_nil_value() : () -> i64
    %3431 = func.call @cc_errorp(%2867) : (i64) -> i64
    %3432 = arith.cmpi ne, %3431, %3430 : i64
    %3433 = scf.if %3432 -> (i64) {
      scf.yield %2867 : i64
    } else {
      %3434 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3435 = arith.constant 38 : i64
      %3436 = func.call @cc_make_string(%3434, %3435) : (!llvm.ptr, i64) -> i64
      %3437 = func.call @cc_nil_value() : () -> i64
      %3438 = func.call @cc_intern(%3436, %3437) : (i64, i64) -> i64
      %3439 = func.call @cc_nil_value() : () -> i64
      %3440 = func.call @cc_cons(%3438, %3439) : (i64, i64) -> i64
      %3441 = func.call @cc_values_pack(%3440) : (i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3442 = arith.addi %3438, %__rlasp_stack_elide_zero_164 : i64
      %3443 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3444 = arith.constant 13 : i64
      %3445 = func.call @cc_make_string(%3443, %3444) : (!llvm.ptr, i64) -> i64
      %3446 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3447 = arith.constant 11 : i64
      %3448 = func.call @cc_make_string(%3446, %3447) : (!llvm.ptr, i64) -> i64
      %3449 = func.call @cc_intern(%3445, %3448) : (i64, i64) -> i64
      %3450 = func.call @cc_nil_value() : () -> i64
      %3451 = func.call @cc_cons(%3449, %3450) : (i64, i64) -> i64
      %3452 = func.call @cc_values_pack(%3451) : (i64) -> i64
      func.call @stack_push_pointer(%3449) : (i64) -> ()
      %3453 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3454 = arith.constant 6 : i64
      %3455 = func.call @cc_make_string(%3453, %3454) : (!llvm.ptr, i64) -> i64
      %3456 = func.call @cc_nil_value() : () -> i64
      %3457 = func.call @cc_intern(%3455, %3456) : (i64, i64) -> i64
      %3458 = func.call @cc_nil_value() : () -> i64
      %3459 = func.call @cc_cons(%3457, %3458) : (i64, i64) -> i64
      %3460 = func.call @cc_values_pack(%3459) : (i64) -> i64
      func.call @stack_push_pointer(%3457) : (i64) -> ()
      %3461 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3462 = arith.constant 19 : i64
      %3463 = func.call @cc_make_string(%3461, %3462) : (!llvm.ptr, i64) -> i64
      %3464 = func.call @cc_nil_value() : () -> i64
      %3465 = func.call @cc_intern(%3463, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3470 = arith.constant 27 : i64
      %3471 = func.call @cc_make_string(%3469, %3470) : (!llvm.ptr, i64) -> i64
      %3472 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3473 = arith.constant 3 : i64
      %3474 = func.call @cc_make_string(%3472, %3473) : (!llvm.ptr, i64) -> i64
      %3475 = func.call @cc_intern(%3471, %3474) : (i64, i64) -> i64
      %3476 = func.call @cc_nil_value() : () -> i64
      %3477 = func.call @cc_cons(%3475, %3476) : (i64, i64) -> i64
      %3478 = func.call @cc_values_pack(%3477) : (i64) -> i64
      func.call @stack_push_pointer(%3475) : (i64) -> ()
      %3479 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%3479) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3480 = func.call @stack_pop_pointer() : () -> i64
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @cc_cons(%3481, %3480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3483 = arith.addi %3482, %__rlasp_stack_elide_zero_165 : i64
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @cc_cons(%3484, %3483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3486 = func.call @stack_pop_pointer() : () -> i64
      %3487 = func.call @stack_pop_pointer() : () -> i64
      %3488 = func.call @cc_cons(%3487, %3486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3489 = arith.addi %3488, %__rlasp_stack_elide_zero_166 : i64
      %3490 = func.call @stack_pop_pointer() : () -> i64
      %3491 = func.call @cc_cons(%3490, %3489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3492 = func.call @stack_pop_pointer() : () -> i64
      %3493 = func.call @stack_pop_pointer() : () -> i64
      %3494 = func.call @cc_cons(%3493, %3492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3495 = arith.addi %3494, %__rlasp_stack_elide_zero_167 : i64
      %3496 = func.call @stack_pop_pointer() : () -> i64
      %3497 = func.call @cc_cons(%3496, %3495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3498 = arith.addi %3497, %__rlasp_stack_elide_zero_168 : i64
      %3499 = func.call @stack_pop_pointer() : () -> i64
      %3500 = func.call @cc_cons(%3499, %3498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3500) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3501 = func.call @stack_pop_pointer() : () -> i64
      %3502 = func.call @stack_pop_pointer() : () -> i64
      %3503 = func.call @cc_cons(%3502, %3501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3504 = arith.addi %3503, %__rlasp_stack_elide_zero_169 : i64
      %3505 = func.call @stack_pop_pointer() : () -> i64
      %3506 = func.call @cc_cons(%3505, %3504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3507 = arith.addi %3506, %__rlasp_stack_elide_zero_170 : i64
      %3563 = arith.constant 269090723725322 : i64
      %3564 = arith.constant 0 : i64
      %3565 = func.call @cc_make_closure(%3563, %3564) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3566 = arith.addi %3565, %__rlasp_stack_elide_zero_171 : i64
      %3567 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3568 = arith.constant 4 : i64
      %3569 = func.call @cc_make_string(%3567, %3568) : (!llvm.ptr, i64) -> i64
      %3570 = func.call @cc_nil_value() : () -> i64
      %3571 = func.call @cc_intern(%3569, %3570) : (i64, i64) -> i64
      %3572 = func.call @cc_nil_value() : () -> i64
      %3573 = func.call @cc_cons(%3571, %3572) : (i64, i64) -> i64
      %3574 = func.call @cc_values_pack(%3573) : (i64) -> i64
      func.call @stack_push_pointer(%3571) : (i64) -> ()
      %3575 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3576 = arith.constant 10 : i64
      %3577 = func.call @cc_make_string(%3575, %3576) : (!llvm.ptr, i64) -> i64
      %3578 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3579 = arith.constant 11 : i64
      %3580 = func.call @cc_make_string(%3578, %3579) : (!llvm.ptr, i64) -> i64
      %3581 = func.call @cc_intern(%3577, %3580) : (i64, i64) -> i64
      %3582 = func.call @cc_nil_value() : () -> i64
      %3583 = func.call @cc_cons(%3581, %3582) : (i64, i64) -> i64
      %3584 = func.call @cc_values_pack(%3583) : (i64) -> i64
      func.call @stack_push_pointer(%3581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = func.call @stack_pop_pointer() : () -> i64
      %3587 = func.call @cc_cons(%3586, %3585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3588 = arith.addi %3587, %__rlasp_stack_elide_zero_172 : i64
      %3589 = func.call @stack_pop_pointer() : () -> i64
      %3590 = func.call @cc_cons(%3589, %3588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3591 = arith.addi %3590, %__rlasp_stack_elide_zero_173 : i64
      %3592 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3593 = arith.constant 11 : i64
      %3594 = func.call @cc_make_string(%3592, %3593) : (!llvm.ptr, i64) -> i64
      %3595 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3596 = arith.constant 7 : i64
      %3597 = func.call @cc_make_string(%3595, %3596) : (!llvm.ptr, i64) -> i64
      %3598 = func.call @cc_intern(%3594, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_cons(%3598, %3599) : (i64, i64) -> i64
      %3601 = func.call @cc_values_pack(%3600) : (i64) -> i64
      %3602 = func.call @cc_nil_value() : () -> i64
      %3603 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3604 = arith.constant 4 : i64
      %3605 = func.call @cc_make_string(%3603, %3604) : (!llvm.ptr, i64) -> i64
      %3606 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3607 = arith.constant 7 : i64
      %3608 = func.call @cc_make_string(%3606, %3607) : (!llvm.ptr, i64) -> i64
      %3609 = func.call @cc_intern(%3605, %3608) : (i64, i64) -> i64
      %3610 = func.call @cc_nil_value() : () -> i64
      %3611 = func.call @cc_cons(%3609, %3610) : (i64, i64) -> i64
      %3612 = func.call @cc_values_pack(%3611) : (i64) -> i64
      %3613 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3614 = arith.constant 5 : i64
      %3615 = func.call @cc_make_string(%3613, %3614) : (!llvm.ptr, i64) -> i64
      %3616 = func.call @cc_nil_value() : () -> i64
      %3617 = func.call @cc_intern(%3615, %3616) : (i64, i64) -> i64
      %3618 = func.call @cc_nil_value() : () -> i64
      %3619 = func.call @cc_cons(%3617, %3618) : (i64, i64) -> i64
      %3620 = func.call @cc_values_pack(%3619) : (i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3621 = arith.addi %3617, %__rlasp_stack_elide_zero_174 : i64
      %3622 = func.call @cc_nil_value() : () -> i64
      %3623 = func.call @cc_errorp(%3442) : (i64) -> i64
      %3624 = arith.cmpi ne, %3623, %3622 : i64
      %3625 = arith.cmpi eq, %3622, %3622 : i64
      %3626 = arith.andi %3624, %3625 : i1
      %3627 = scf.if %3626 -> (i64) {
        scf.yield %3442 : i64
      } else {
        scf.yield %3622 : i64
      }
      %3628 = func.call @cc_errorp(%3507) : (i64) -> i64
      %3629 = arith.cmpi ne, %3628, %3622 : i64
      %3630 = arith.cmpi eq, %3627, %3622 : i64
      %3631 = arith.andi %3629, %3630 : i1
      %3632 = scf.if %3631 -> (i64) {
        scf.yield %3507 : i64
      } else {
        scf.yield %3627 : i64
      }
      %3633 = func.call @cc_errorp(%3566) : (i64) -> i64
      %3634 = arith.cmpi ne, %3633, %3622 : i64
      %3635 = arith.cmpi eq, %3632, %3622 : i64
      %3636 = arith.andi %3634, %3635 : i1
      %3637 = scf.if %3636 -> (i64) {
        scf.yield %3566 : i64
      } else {
        scf.yield %3632 : i64
      }
      %3638 = func.call @cc_errorp(%3591) : (i64) -> i64
      %3639 = arith.cmpi ne, %3638, %3622 : i64
      %3640 = arith.cmpi eq, %3637, %3622 : i64
      %3641 = arith.andi %3639, %3640 : i1
      %3642 = scf.if %3641 -> (i64) {
        scf.yield %3591 : i64
      } else {
        scf.yield %3637 : i64
      }
      %3643 = func.call @cc_errorp(%3598) : (i64) -> i64
      %3644 = arith.cmpi ne, %3643, %3622 : i64
      %3645 = arith.cmpi eq, %3642, %3622 : i64
      %3646 = arith.andi %3644, %3645 : i1
      %3647 = scf.if %3646 -> (i64) {
        scf.yield %3598 : i64
      } else {
        scf.yield %3642 : i64
      }
      %3648 = func.call @cc_errorp(%3602) : (i64) -> i64
      %3649 = arith.cmpi ne, %3648, %3622 : i64
      %3650 = arith.cmpi eq, %3647, %3622 : i64
      %3651 = arith.andi %3649, %3650 : i1
      %3652 = scf.if %3651 -> (i64) {
        scf.yield %3602 : i64
      } else {
        scf.yield %3647 : i64
      }
      %3653 = func.call @cc_errorp(%3609) : (i64) -> i64
      %3654 = arith.cmpi ne, %3653, %3622 : i64
      %3655 = arith.cmpi eq, %3652, %3622 : i64
      %3656 = arith.andi %3654, %3655 : i1
      %3657 = scf.if %3656 -> (i64) {
        scf.yield %3609 : i64
      } else {
        scf.yield %3652 : i64
      }
      %3658 = func.call @cc_errorp(%3621) : (i64) -> i64
      %3659 = arith.cmpi ne, %3658, %3622 : i64
      %3660 = arith.cmpi eq, %3657, %3622 : i64
      %3661 = arith.andi %3659, %3660 : i1
      %3662 = scf.if %3661 -> (i64) {
        scf.yield %3621 : i64
      } else {
        scf.yield %3657 : i64
      }
      %3663 = arith.cmpi ne, %3662, %3622 : i64
      scf.if %3663 {
        func.call @stack_push_pointer(%3662) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3442) : (i64) -> ()
        func.call @stack_push_pointer(%3507) : (i64) -> ()
        func.call @stack_push_pointer(%3566) : (i64) -> ()
        func.call @stack_push_pointer(%3591) : (i64) -> ()
        func.call @stack_push_pointer(%3598) : (i64) -> ()
        func.call @stack_push_pointer(%3602) : (i64) -> ()
        func.call @stack_push_pointer(%3609) : (i64) -> ()
        func.call @stack_push_pointer(%3621) : (i64) -> ()
        %3664 = llvm.mlir.addressof @str315 : !llvm.ptr
        %3665 = func.call @cc_make_function_ref_const(%3664) : (!llvm.ptr) -> i64
        %3666 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3665, %3666) : (i64, i64) -> ()
      }
      %3667 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3667 : i64
    }
    %3668 = func.call @cc_nil_value() : () -> i64
    %3669 = func.call @cc_errorp(%3433) : (i64) -> i64
    %3670 = arith.cmpi ne, %3669, %3668 : i64
    %3671 = scf.if %3670 -> (i64) {
      scf.yield %3433 : i64
    } else {
      %3672 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3673 = arith.constant 20 : i64
      %3674 = func.call @cc_make_string(%3672, %3673) : (!llvm.ptr, i64) -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_intern(%3674, %3675) : (i64, i64) -> i64
      %3677 = func.call @cc_nil_value() : () -> i64
      %3678 = func.call @cc_cons(%3676, %3677) : (i64, i64) -> i64
      %3679 = func.call @cc_values_pack(%3678) : (i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3680 = arith.addi %3676, %__rlasp_stack_elide_zero_175 : i64
      %3681 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3682 = arith.constant 3 : i64
      %3683 = func.call @cc_make_string(%3681, %3682) : (!llvm.ptr, i64) -> i64
      %3684 = func.call @cc_nil_value() : () -> i64
      %3685 = func.call @cc_intern(%3683, %3684) : (i64, i64) -> i64
      %3686 = func.call @cc_nil_value() : () -> i64
      %3687 = func.call @cc_cons(%3685, %3686) : (i64, i64) -> i64
      %3688 = func.call @cc_values_pack(%3687) : (i64) -> i64
      func.call @stack_push_pointer(%3685) : (i64) -> ()
      %3689 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3690 = arith.constant 3 : i64
      %3691 = func.call @cc_make_string(%3689, %3690) : (!llvm.ptr, i64) -> i64
      %3692 = func.call @cc_nil_value() : () -> i64
      %3693 = func.call @cc_intern(%3691, %3692) : (i64, i64) -> i64
      %3694 = func.call @cc_nil_value() : () -> i64
      %3695 = func.call @cc_cons(%3693, %3694) : (i64, i64) -> i64
      %3696 = func.call @cc_values_pack(%3695) : (i64) -> i64
      func.call @stack_push_pointer(%3693) : (i64) -> ()
      %3697 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3698 = arith.constant 19 : i64
      %3699 = func.call @cc_make_string(%3697, %3698) : (!llvm.ptr, i64) -> i64
      %3700 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3701 = arith.constant 11 : i64
      %3702 = func.call @cc_make_string(%3700, %3701) : (!llvm.ptr, i64) -> i64
      %3703 = func.call @cc_intern(%3699, %3702) : (i64, i64) -> i64
      %3704 = func.call @cc_nil_value() : () -> i64
      %3705 = func.call @cc_cons(%3703, %3704) : (i64, i64) -> i64
      %3706 = func.call @cc_values_pack(%3705) : (i64) -> i64
      func.call @stack_push_pointer(%3703) : (i64) -> ()
      %3707 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3708 = arith.constant 5 : i64
      %3709 = func.call @cc_make_string(%3707, %3708) : (!llvm.ptr, i64) -> i64
      %3710 = func.call @cc_nil_value() : () -> i64
      %3711 = func.call @cc_intern(%3709, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_nil_value() : () -> i64
      %3713 = func.call @cc_cons(%3711, %3712) : (i64, i64) -> i64
      %3714 = func.call @cc_values_pack(%3713) : (i64) -> i64
      func.call @stack_push_pointer(%3711) : (i64) -> ()
      %3715 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3716 = arith.constant 20 : i64
      %3717 = func.call @cc_make_string(%3715, %3716) : (!llvm.ptr, i64) -> i64
      %3718 = func.call @cc_nil_value() : () -> i64
      %3719 = func.call @cc_intern(%3717, %3718) : (i64, i64) -> i64
      %3720 = func.call @cc_nil_value() : () -> i64
      %3721 = func.call @cc_cons(%3719, %3720) : (i64, i64) -> i64
      %3722 = func.call @cc_values_pack(%3721) : (i64) -> i64
      func.call @stack_push_pointer(%3719) : (i64) -> ()
      %3723 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3724 = arith.constant 6 : i64
      %3725 = func.call @cc_make_string(%3723, %3724) : (!llvm.ptr, i64) -> i64
      %3726 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3727 = arith.constant 11 : i64
      %3728 = func.call @cc_make_string(%3726, %3727) : (!llvm.ptr, i64) -> i64
      %3729 = func.call @cc_intern(%3725, %3728) : (i64, i64) -> i64
      %3730 = func.call @cc_nil_value() : () -> i64
      %3731 = func.call @cc_cons(%3729, %3730) : (i64, i64) -> i64
      %3732 = func.call @cc_values_pack(%3731) : (i64) -> i64
      func.call @stack_push_pointer(%3729) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3733 = func.call @stack_pop_pointer() : () -> i64
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = func.call @cc_cons(%3734, %3733) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3736 = arith.addi %3735, %__rlasp_stack_elide_zero_176 : i64
      %3737 = func.call @stack_pop_pointer() : () -> i64
      %3738 = func.call @cc_cons(%3737, %3736) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3739 = arith.addi %3738, %__rlasp_stack_elide_zero_177 : i64
      %3740 = func.call @stack_pop_pointer() : () -> i64
      %3741 = func.call @cc_cons(%3740, %3739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3741) : (i64) -> ()
      %3742 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3743 = arith.constant 12 : i64
      %3744 = func.call @cc_make_string(%3742, %3743) : (!llvm.ptr, i64) -> i64
      %3745 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3746 = arith.constant 3 : i64
      %3747 = func.call @cc_make_string(%3745, %3746) : (!llvm.ptr, i64) -> i64
      %3748 = func.call @cc_intern(%3744, %3747) : (i64, i64) -> i64
      %3749 = func.call @cc_nil_value() : () -> i64
      %3750 = func.call @cc_cons(%3748, %3749) : (i64, i64) -> i64
      %3751 = func.call @cc_values_pack(%3750) : (i64) -> i64
      func.call @stack_push_pointer(%3748) : (i64) -> ()
      %3752 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3753 = arith.constant 4 : i64
      %3754 = func.call @cc_make_string(%3752, %3753) : (!llvm.ptr, i64) -> i64
      %3755 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3756 = arith.constant 11 : i64
      %3757 = func.call @cc_make_string(%3755, %3756) : (!llvm.ptr, i64) -> i64
      %3758 = func.call @cc_intern(%3754, %3757) : (i64, i64) -> i64
      %3759 = func.call @cc_nil_value() : () -> i64
      %3760 = func.call @cc_cons(%3758, %3759) : (i64, i64) -> i64
      %3761 = func.call @cc_values_pack(%3760) : (i64) -> i64
      func.call @stack_push_pointer(%3758) : (i64) -> ()
      %3762 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3763 = arith.constant 11 : i64
      %3764 = func.call @cc_make_string(%3762, %3763) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3764) : (i64) -> ()
      %3765 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3766 = arith.constant 9 : i64
      %3767 = func.call @cc_make_string(%3765, %3766) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3767) : (i64) -> ()
      %3768 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3769 = arith.constant 8 : i64
      %3770 = func.call @cc_make_string(%3768, %3769) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3770) : (i64) -> ()
      %3771 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3772 = arith.constant 6 : i64
      %3773 = func.call @cc_make_string(%3771, %3772) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3773) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = func.call @stack_pop_pointer() : () -> i64
      %3776 = func.call @cc_cons(%3775, %3774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3777 = arith.addi %3776, %__rlasp_stack_elide_zero_178 : i64
      %3778 = func.call @stack_pop_pointer() : () -> i64
      %3779 = func.call @cc_cons(%3778, %3777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3780 = arith.addi %3779, %__rlasp_stack_elide_zero_179 : i64
      %3781 = func.call @stack_pop_pointer() : () -> i64
      %3782 = func.call @cc_cons(%3781, %3780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3783 = arith.addi %3782, %__rlasp_stack_elide_zero_180 : i64
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = func.call @cc_cons(%3784, %3783) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3786 = arith.addi %3785, %__rlasp_stack_elide_zero_181 : i64
      %3787 = func.call @stack_pop_pointer() : () -> i64
      %3788 = func.call @cc_cons(%3787, %3786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3788) : (i64) -> ()
      %3789 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3789) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3790 = func.call @stack_pop_pointer() : () -> i64
      %3791 = func.call @stack_pop_pointer() : () -> i64
      %3792 = func.call @cc_cons(%3791, %3790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3793 = arith.addi %3792, %__rlasp_stack_elide_zero_182 : i64
      %3794 = func.call @stack_pop_pointer() : () -> i64
      %3795 = func.call @cc_cons(%3794, %3793) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3796 = arith.addi %3795, %__rlasp_stack_elide_zero_183 : i64
      %3797 = func.call @stack_pop_pointer() : () -> i64
      %3798 = func.call @cc_cons(%3797, %3796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3798) : (i64) -> ()
      %3799 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3800 = arith.constant 7 : i64
      %3801 = func.call @cc_make_string(%3799, %3800) : (!llvm.ptr, i64) -> i64
      %3802 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3803 = arith.constant 11 : i64
      %3804 = func.call @cc_make_string(%3802, %3803) : (!llvm.ptr, i64) -> i64
      %3805 = func.call @cc_intern(%3801, %3804) : (i64, i64) -> i64
      %3806 = func.call @cc_nil_value() : () -> i64
      %3807 = func.call @cc_cons(%3805, %3806) : (i64, i64) -> i64
      %3808 = func.call @cc_values_pack(%3807) : (i64) -> i64
      func.call @stack_push_pointer(%3805) : (i64) -> ()
      %3809 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3810 = arith.constant 6 : i64
      %3811 = func.call @cc_make_string(%3809, %3810) : (!llvm.ptr, i64) -> i64
      %3812 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3813 = arith.constant 11 : i64
      %3814 = func.call @cc_make_string(%3812, %3813) : (!llvm.ptr, i64) -> i64
      %3815 = func.call @cc_intern(%3811, %3814) : (i64, i64) -> i64
      %3816 = func.call @cc_nil_value() : () -> i64
      %3817 = func.call @cc_cons(%3815, %3816) : (i64, i64) -> i64
      %3818 = func.call @cc_values_pack(%3817) : (i64) -> i64
      func.call @stack_push_pointer(%3815) : (i64) -> ()
      %3819 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3820 = arith.constant 5 : i64
      %3821 = func.call @cc_make_string(%3819, %3820) : (!llvm.ptr, i64) -> i64
      %3822 = func.call @cc_nil_value() : () -> i64
      %3823 = func.call @cc_intern(%3821, %3822) : (i64, i64) -> i64
      %3824 = func.call @cc_nil_value() : () -> i64
      %3825 = func.call @cc_cons(%3823, %3824) : (i64, i64) -> i64
      %3826 = func.call @cc_values_pack(%3825) : (i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      %3827 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3828 = arith.constant 20 : i64
      %3829 = func.call @cc_make_string(%3827, %3828) : (!llvm.ptr, i64) -> i64
      %3830 = func.call @cc_nil_value() : () -> i64
      %3831 = func.call @cc_intern(%3829, %3830) : (i64, i64) -> i64
      %3832 = func.call @cc_nil_value() : () -> i64
      %3833 = func.call @cc_cons(%3831, %3832) : (i64, i64) -> i64
      %3834 = func.call @cc_values_pack(%3833) : (i64) -> i64
      func.call @stack_push_pointer(%3831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @stack_pop_pointer() : () -> i64
      %3837 = func.call @cc_cons(%3836, %3835) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3838 = arith.addi %3837, %__rlasp_stack_elide_zero_184 : i64
      %3839 = func.call @stack_pop_pointer() : () -> i64
      %3840 = func.call @cc_cons(%3839, %3838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3841 = arith.addi %3840, %__rlasp_stack_elide_zero_185 : i64
      %3842 = func.call @stack_pop_pointer() : () -> i64
      %3843 = func.call @cc_cons(%3842, %3841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3843) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3844 = func.call @stack_pop_pointer() : () -> i64
      %3845 = func.call @stack_pop_pointer() : () -> i64
      %3846 = func.call @cc_cons(%3845, %3844) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3847 = arith.addi %3846, %__rlasp_stack_elide_zero_186 : i64
      %3848 = func.call @stack_pop_pointer() : () -> i64
      %3849 = func.call @cc_cons(%3848, %3847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3849) : (i64) -> ()
      %3850 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3851 = arith.constant 2 : i64
      %3852 = func.call @cc_make_string(%3850, %3851) : (!llvm.ptr, i64) -> i64
      %3853 = func.call @cc_nil_value() : () -> i64
      %3854 = func.call @cc_intern(%3852, %3853) : (i64, i64) -> i64
      %3855 = func.call @cc_nil_value() : () -> i64
      %3856 = func.call @cc_cons(%3854, %3855) : (i64, i64) -> i64
      %3857 = func.call @cc_values_pack(%3856) : (i64) -> i64
      func.call @stack_push_pointer(%3854) : (i64) -> ()
      %3858 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3859 = arith.constant 6 : i64
      %3860 = func.call @cc_make_string(%3858, %3859) : (!llvm.ptr, i64) -> i64
      %3861 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3862 = arith.constant 11 : i64
      %3863 = func.call @cc_make_string(%3861, %3862) : (!llvm.ptr, i64) -> i64
      %3864 = func.call @cc_intern(%3860, %3863) : (i64, i64) -> i64
      %3865 = func.call @cc_nil_value() : () -> i64
      %3866 = func.call @cc_cons(%3864, %3865) : (i64, i64) -> i64
      %3867 = func.call @cc_values_pack(%3866) : (i64) -> i64
      func.call @stack_push_pointer(%3864) : (i64) -> ()
      %3868 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3869 = arith.constant 5 : i64
      %3870 = func.call @cc_make_string(%3868, %3869) : (!llvm.ptr, i64) -> i64
      %3871 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3872 = arith.constant 11 : i64
      %3873 = func.call @cc_make_string(%3871, %3872) : (!llvm.ptr, i64) -> i64
      %3874 = func.call @cc_intern(%3870, %3873) : (i64, i64) -> i64
      %3875 = func.call @cc_nil_value() : () -> i64
      %3876 = func.call @cc_cons(%3874, %3875) : (i64, i64) -> i64
      %3877 = func.call @cc_values_pack(%3876) : (i64) -> i64
      func.call @stack_push_pointer(%3874) : (i64) -> ()
      %3878 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3879 = arith.constant 6 : i64
      %3880 = func.call @cc_make_string(%3878, %3879) : (!llvm.ptr, i64) -> i64
      %3881 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3882 = arith.constant 11 : i64
      %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
      %3884 = func.call @cc_intern(%3880, %3883) : (i64, i64) -> i64
      %3885 = func.call @cc_nil_value() : () -> i64
      %3886 = func.call @cc_cons(%3884, %3885) : (i64, i64) -> i64
      %3887 = func.call @cc_values_pack(%3886) : (i64) -> i64
      func.call @stack_push_pointer(%3884) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3888 = func.call @stack_pop_pointer() : () -> i64
      %3889 = func.call @stack_pop_pointer() : () -> i64
      %3890 = func.call @cc_cons(%3889, %3888) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3891 = arith.addi %3890, %__rlasp_stack_elide_zero_187 : i64
      %3892 = func.call @stack_pop_pointer() : () -> i64
      %3893 = func.call @cc_cons(%3892, %3891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3893) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3894 = func.call @stack_pop_pointer() : () -> i64
      %3895 = func.call @stack_pop_pointer() : () -> i64
      %3896 = func.call @cc_cons(%3895, %3894) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3897 = arith.addi %3896, %__rlasp_stack_elide_zero_188 : i64
      %3898 = func.call @stack_pop_pointer() : () -> i64
      %3899 = func.call @cc_cons(%3898, %3897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3900 = arith.addi %3899, %__rlasp_stack_elide_zero_189 : i64
      %3901 = func.call @stack_pop_pointer() : () -> i64
      %3902 = func.call @cc_cons(%3901, %3900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3903 = arith.addi %3902, %__rlasp_stack_elide_zero_190 : i64
      %3904 = func.call @stack_pop_pointer() : () -> i64
      %3905 = func.call @cc_cons(%3904, %3903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3906 = func.call @stack_pop_pointer() : () -> i64
      %3907 = func.call @stack_pop_pointer() : () -> i64
      %3908 = func.call @cc_cons(%3907, %3906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3909 = arith.addi %3908, %__rlasp_stack_elide_zero_191 : i64
      %3910 = func.call @stack_pop_pointer() : () -> i64
      %3911 = func.call @cc_cons(%3910, %3909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3912 = arith.addi %3911, %__rlasp_stack_elide_zero_192 : i64
      %3913 = func.call @stack_pop_pointer() : () -> i64
      %3914 = func.call @cc_cons(%3913, %3912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3915 = arith.addi %3914, %__rlasp_stack_elide_zero_193 : i64
      %3916 = func.call @stack_pop_pointer() : () -> i64
      %3917 = func.call @cc_cons(%3916, %3915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3918 = arith.addi %3917, %__rlasp_stack_elide_zero_194 : i64
      %3919 = func.call @stack_pop_pointer() : () -> i64
      %3920 = func.call @cc_cons(%3919, %3918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3921 = func.call @stack_pop_pointer() : () -> i64
      %3922 = func.call @stack_pop_pointer() : () -> i64
      %3923 = func.call @cc_cons(%3922, %3921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %3924 = arith.addi %3923, %__rlasp_stack_elide_zero_195 : i64
      %3925 = func.call @stack_pop_pointer() : () -> i64
      %3926 = func.call @cc_cons(%3925, %3924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3926) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3927 = func.call @stack_pop_pointer() : () -> i64
      %3928 = func.call @stack_pop_pointer() : () -> i64
      %3929 = func.call @cc_cons(%3928, %3927) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %3930 = arith.addi %3929, %__rlasp_stack_elide_zero_196 : i64
      %3931 = func.call @stack_pop_pointer() : () -> i64
      %3932 = func.call @cc_cons(%3931, %3930) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %3933 = arith.addi %3932, %__rlasp_stack_elide_zero_197 : i64
      %4046 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4047 = arith.constant 34 : i64
      %4048 = func.call @cc_make_symbol(%4046, %4047) : (!llvm.ptr, i64) -> i64
      %4049 = func.call @cc_persistent_root_value(%4048) : (i64) -> i64
      func.call @stack_push_pointer(%4049) : (i64) -> ()
      %4050 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4051 = arith.constant 49 : i64
      %4052 = func.call @cc_make_symbol(%4050, %4051) : (!llvm.ptr, i64) -> i64
      %4053 = func.call @cc_persistent_root_value(%4052) : (i64) -> i64
      func.call @stack_push_pointer(%4053) : (i64) -> ()
      %4054 = arith.constant 269090723725323 : i64
      %4055 = arith.constant 2 : i64
      %4056 = func.call @cc_make_closure(%4054, %4055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4057 = arith.addi %4056, %__rlasp_stack_elide_zero_198 : i64
      %4058 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4059 = arith.constant 1 : i64
      %4060 = func.call @cc_make_string(%4058, %4059) : (!llvm.ptr, i64) -> i64
      %4061 = func.call @cc_nil_value() : () -> i64
      %4062 = func.call @cc_intern(%4060, %4061) : (i64, i64) -> i64
      %4063 = func.call @cc_nil_value() : () -> i64
      %4064 = func.call @cc_cons(%4062, %4063) : (i64, i64) -> i64
      %4065 = func.call @cc_values_pack(%4064) : (i64) -> i64
      func.call @stack_push_pointer(%4062) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4066 = func.call @stack_pop_pointer() : () -> i64
      %4067 = func.call @stack_pop_pointer() : () -> i64
      %4068 = func.call @cc_cons(%4067, %4066) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4069 = arith.addi %4068, %__rlasp_stack_elide_zero_199 : i64
      %4070 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4071 = arith.constant 11 : i64
      %4072 = func.call @cc_make_string(%4070, %4071) : (!llvm.ptr, i64) -> i64
      %4073 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4074 = arith.constant 7 : i64
      %4075 = func.call @cc_make_string(%4073, %4074) : (!llvm.ptr, i64) -> i64
      %4076 = func.call @cc_intern(%4072, %4075) : (i64, i64) -> i64
      %4077 = func.call @cc_nil_value() : () -> i64
      %4078 = func.call @cc_cons(%4076, %4077) : (i64, i64) -> i64
      %4079 = func.call @cc_values_pack(%4078) : (i64) -> i64
      %4080 = func.call @cc_nil_value() : () -> i64
      %4081 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4082 = arith.constant 4 : i64
      %4083 = func.call @cc_make_string(%4081, %4082) : (!llvm.ptr, i64) -> i64
      %4084 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4085 = arith.constant 7 : i64
      %4086 = func.call @cc_make_string(%4084, %4085) : (!llvm.ptr, i64) -> i64
      %4087 = func.call @cc_intern(%4083, %4086) : (i64, i64) -> i64
      %4088 = func.call @cc_nil_value() : () -> i64
      %4089 = func.call @cc_cons(%4087, %4088) : (i64, i64) -> i64
      %4090 = func.call @cc_values_pack(%4089) : (i64) -> i64
      %4091 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4092 = arith.constant 6 : i64
      %4093 = func.call @cc_make_string(%4091, %4092) : (!llvm.ptr, i64) -> i64
      %4094 = func.call @cc_nil_value() : () -> i64
      %4095 = func.call @cc_intern(%4093, %4094) : (i64, i64) -> i64
      %4096 = func.call @cc_nil_value() : () -> i64
      %4097 = func.call @cc_cons(%4095, %4096) : (i64, i64) -> i64
      %4098 = func.call @cc_values_pack(%4097) : (i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4099 = arith.addi %4095, %__rlasp_stack_elide_zero_200 : i64
      %4100 = func.call @cc_nil_value() : () -> i64
      %4101 = func.call @cc_errorp(%3680) : (i64) -> i64
      %4102 = arith.cmpi ne, %4101, %4100 : i64
      %4103 = arith.cmpi eq, %4100, %4100 : i64
      %4104 = arith.andi %4102, %4103 : i1
      %4105 = scf.if %4104 -> (i64) {
        scf.yield %3680 : i64
      } else {
        scf.yield %4100 : i64
      }
      %4106 = func.call @cc_errorp(%3933) : (i64) -> i64
      %4107 = arith.cmpi ne, %4106, %4100 : i64
      %4108 = arith.cmpi eq, %4105, %4100 : i64
      %4109 = arith.andi %4107, %4108 : i1
      %4110 = scf.if %4109 -> (i64) {
        scf.yield %3933 : i64
      } else {
        scf.yield %4105 : i64
      }
      %4111 = func.call @cc_errorp(%4057) : (i64) -> i64
      %4112 = arith.cmpi ne, %4111, %4100 : i64
      %4113 = arith.cmpi eq, %4110, %4100 : i64
      %4114 = arith.andi %4112, %4113 : i1
      %4115 = scf.if %4114 -> (i64) {
        scf.yield %4057 : i64
      } else {
        scf.yield %4110 : i64
      }
      %4116 = func.call @cc_errorp(%4069) : (i64) -> i64
      %4117 = arith.cmpi ne, %4116, %4100 : i64
      %4118 = arith.cmpi eq, %4115, %4100 : i64
      %4119 = arith.andi %4117, %4118 : i1
      %4120 = scf.if %4119 -> (i64) {
        scf.yield %4069 : i64
      } else {
        scf.yield %4115 : i64
      }
      %4121 = func.call @cc_errorp(%4076) : (i64) -> i64
      %4122 = arith.cmpi ne, %4121, %4100 : i64
      %4123 = arith.cmpi eq, %4120, %4100 : i64
      %4124 = arith.andi %4122, %4123 : i1
      %4125 = scf.if %4124 -> (i64) {
        scf.yield %4076 : i64
      } else {
        scf.yield %4120 : i64
      }
      %4126 = func.call @cc_errorp(%4080) : (i64) -> i64
      %4127 = arith.cmpi ne, %4126, %4100 : i64
      %4128 = arith.cmpi eq, %4125, %4100 : i64
      %4129 = arith.andi %4127, %4128 : i1
      %4130 = scf.if %4129 -> (i64) {
        scf.yield %4080 : i64
      } else {
        scf.yield %4125 : i64
      }
      %4131 = func.call @cc_errorp(%4087) : (i64) -> i64
      %4132 = arith.cmpi ne, %4131, %4100 : i64
      %4133 = arith.cmpi eq, %4130, %4100 : i64
      %4134 = arith.andi %4132, %4133 : i1
      %4135 = scf.if %4134 -> (i64) {
        scf.yield %4087 : i64
      } else {
        scf.yield %4130 : i64
      }
      %4136 = func.call @cc_errorp(%4099) : (i64) -> i64
      %4137 = arith.cmpi ne, %4136, %4100 : i64
      %4138 = arith.cmpi eq, %4135, %4100 : i64
      %4139 = arith.andi %4137, %4138 : i1
      %4140 = scf.if %4139 -> (i64) {
        scf.yield %4099 : i64
      } else {
        scf.yield %4135 : i64
      }
      %4141 = arith.cmpi ne, %4140, %4100 : i64
      scf.if %4141 {
        func.call @stack_push_pointer(%4140) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3680) : (i64) -> ()
        func.call @stack_push_pointer(%3933) : (i64) -> ()
        func.call @stack_push_pointer(%4057) : (i64) -> ()
        func.call @stack_push_pointer(%4069) : (i64) -> ()
        func.call @stack_push_pointer(%4076) : (i64) -> ()
        func.call @stack_push_pointer(%4080) : (i64) -> ()
        func.call @stack_push_pointer(%4087) : (i64) -> ()
        func.call @stack_push_pointer(%4099) : (i64) -> ()
        %4142 = llvm.mlir.addressof @str359 : !llvm.ptr
        %4143 = func.call @cc_make_function_ref_const(%4142) : (!llvm.ptr) -> i64
        %4144 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4143, %4144) : (i64, i64) -> ()
      }
      %4145 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4145 : i64
    }
    %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
    %4146 = arith.addi %3671, %__rlasp_stack_elide_zero_201 : i64
    %4147 = func.call @cc_multiple_value_list(%4146) : (i64) -> i64
    %4148 = llvm.mlir.addressof @str360 : !llvm.ptr
    %4149 = arith.constant 38 : i64
    %4150 = func.call @cc_make_string(%4148, %4149) : (!llvm.ptr, i64) -> i64
    %4151 = func.call @cc_nil_value() : () -> i64
    %4152 = func.call @cc_intern(%4150, %4151) : (i64, i64) -> i64
    %4153 = func.call @cc_nil_value() : () -> i64
    %4154 = func.call @cc_cons(%4152, %4153) : (i64, i64) -> i64
    %4155 = func.call @cc_values_pack(%4154) : (i64) -> i64
    %4156 = func.call @cc_symbol_value(%4152) : (i64) -> i64
    %4157 = llvm.mlir.addressof @str361 : !llvm.ptr
    %4158 = arith.constant 40 : i64
    %4159 = func.call @cc_make_string(%4157, %4158) : (!llvm.ptr, i64) -> i64
    %4160 = func.call @cc_nil_value() : () -> i64
    %4161 = func.call @cc_intern(%4159, %4160) : (i64, i64) -> i64
    %4162 = func.call @cc_nil_value() : () -> i64
    %4163 = func.call @cc_cons(%4161, %4162) : (i64, i64) -> i64
    %4164 = func.call @cc_values_pack(%4163) : (i64) -> i64
    %4165 = func.call @cc_symbol_value(%4161) : (i64) -> i64
    %4166 = func.call @cc_nil_value() : () -> i64
    %4167 = arith.cmpi ne, %4156, %4166 : i64
    %4168 = scf.if %4167 -> (i64) {
      scf.yield %4165 : i64
    } else {
      scf.yield %4147 : i64
    }
    %4169 = func.call @cc_values_pack(%4168) : (i64) -> i64
    func.call @stack_push_pointer(%4169) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725313"() {
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_errorp(%113) : (i64) -> i64
    %116 = arith.cmpi ne, %115, %114 : i64
    %117 = scf.if %116 -> (i64) {
      scf.yield %113 : i64
    } else {
      %118 = llvm.mlir.addressof @str11 : !llvm.ptr
      %119 = arith.constant 42 : i64
      %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
      %121 = func.call @cc_nil_value() : () -> i64
      %122 = func.call @cc_errorp(%120) : (i64) -> i64
      %123 = arith.cmpi ne, %122, %121 : i64
      %124 = arith.cmpi eq, %121, %121 : i64
      %125 = arith.andi %123, %124 : i1
      %126 = scf.if %125 -> (i64) {
        scf.yield %120 : i64
      } else {
        scf.yield %121 : i64
      }
      %127 = arith.cmpi ne, %126, %121 : i64
      scf.if %127 {
        func.call @stack_push_pointer(%126) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%120) : (i64) -> ()
        %128 = llvm.mlir.addressof @str12 : !llvm.ptr
        %129 = func.call @cc_make_function_ref_const(%128) : (!llvm.ptr) -> i64
        %130 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%129, %130) : (i64, i64) -> ()
      }
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @cc_nil_value() : () -> i64
      %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
      %134 = func.call @cc_not(%133) : (i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %135 = arith.addi %134, %__rlasp_stack_elide_zero_202 : i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
      %138 = func.call @cc_not(%137) : (i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %139 = arith.addi %138, %__rlasp_stack_elide_zero_203 : i64
      scf.yield %139 : i64
    }
    func.call @stack_push_pointer(%117) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725314"() {
    %321 = func.call @cc_nil_value() : () -> i64
    %322 = func.call @cc_nil_value() : () -> i64
    %323 = func.call @cc_errorp(%321) : (i64) -> i64
    %324 = arith.cmpi ne, %323, %322 : i64
    %325 = scf.if %324 -> (i64) {
      scf.yield %321 : i64
    } else {
      %326 = llvm.mlir.addressof @str28 : !llvm.ptr
      %327 = arith.constant 42 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_errorp(%329) : (i64) -> i64
      %332 = arith.cmpi ne, %331, %330 : i64
      %333 = scf.if %332 -> (i64) {
        scf.yield %329 : i64
      } else {
        %334 = func.call @cc_nil_value() : () -> i64
        %335 = func.call @cc_errorp(%328) : (i64) -> i64
        %336 = arith.cmpi ne, %335, %334 : i64
        %337 = arith.cmpi eq, %334, %334 : i64
        %338 = arith.andi %336, %337 : i1
        %339 = scf.if %338 -> (i64) {
          scf.yield %328 : i64
        } else {
          scf.yield %334 : i64
        }
        %340 = arith.cmpi ne, %339, %334 : i64
        scf.if %340 {
          func.call @stack_push_pointer(%339) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%328) : (i64) -> ()
          %341 = llvm.mlir.addressof @str29 : !llvm.ptr
          %342 = func.call @cc_make_function_ref_const(%341) : (!llvm.ptr) -> i64
          %343 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%342, %343) : (i64, i64) -> ()
        }
        %344 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %344 : i64
      }
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %345 = arith.addi %333, %__rlasp_stack_elide_zero_204 : i64
      func.call @stack_push_nil() : () -> ()
      %346 = func.call @stack_pop_pointer() : () -> i64
      %347 = func.call @cc_cons(%345, %346) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %348 = arith.addi %347, %__rlasp_stack_elide_zero_205 : i64
      %349 = func.call @cc_values_pack(%348) : (i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %350 = arith.addi %349, %__rlasp_stack_elide_zero_206 : i64
      scf.yield %350 : i64
    }
    func.call @stack_push_pointer(%325) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725315"() {
    %554 = func.call @cc_nil_value() : () -> i64
    %555 = func.call @cc_nil_value() : () -> i64
    %556 = func.call @cc_errorp(%554) : (i64) -> i64
    %557 = arith.cmpi ne, %556, %555 : i64
    %558 = scf.if %557 -> (i64) {
      scf.yield %554 : i64
    } else {
      %559 = llvm.mlir.addressof @str48 : !llvm.ptr
      %560 = arith.constant 42 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_errorp(%562) : (i64) -> i64
      %565 = arith.cmpi ne, %564, %563 : i64
      %566 = scf.if %565 -> (i64) {
        scf.yield %562 : i64
      } else {
        %567 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%567) : (i64) -> ()
        %568 = func.call @stack_pop_pointer() : () -> i64
        %569 = func.call @cc_nil_value() : () -> i64
        %570 = func.call @cc_errorp(%561) : (i64) -> i64
        %571 = arith.cmpi ne, %570, %569 : i64
        %572 = arith.cmpi eq, %569, %569 : i64
        %573 = arith.andi %571, %572 : i1
        %574 = scf.if %573 -> (i64) {
          scf.yield %561 : i64
        } else {
          scf.yield %569 : i64
        }
        %575 = arith.cmpi ne, %574, %569 : i64
        scf.if %575 {
          func.call @stack_push_pointer(%574) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%561) : (i64) -> ()
          %576 = llvm.mlir.addressof @str49 : !llvm.ptr
          %577 = func.call @cc_make_function_ref_const(%576) : (!llvm.ptr) -> i64
          %578 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%577, %578) : (i64, i64) -> ()
        }
        %579 = func.call @stack_pop_pointer() : () -> i64
        %580 = func.call @cc_multiple_value_list(%579) : (i64) -> i64
        %581 = func.call @cc_nth(%568, %580) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
        %582 = arith.addi %581, %__rlasp_stack_elide_zero_207 : i64
        scf.yield %582 : i64
      }
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %583 = arith.addi %566, %__rlasp_stack_elide_zero_208 : i64
      func.call @stack_push_nil() : () -> ()
      %584 = func.call @stack_pop_pointer() : () -> i64
      %585 = func.call @cc_cons(%583, %584) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %586 = arith.addi %585, %__rlasp_stack_elide_zero_209 : i64
      %587 = func.call @cc_values_pack(%586) : (i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %588 = arith.addi %587, %__rlasp_stack_elide_zero_210 : i64
      scf.yield %588 : i64
    }
    func.call @stack_push_pointer(%558) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725316"() {
    %905 = func.call @cc_nil_value() : () -> i64
    %906 = func.call @cc_nil_value() : () -> i64
    %907 = func.call @cc_errorp(%905) : (i64) -> i64
    %908 = arith.cmpi ne, %907, %906 : i64
    %909 = scf.if %908 -> (i64) {
      scf.yield %905 : i64
    } else {
      %910 = llvm.mlir.addressof @str80 : !llvm.ptr
      %911 = arith.constant 42 : i64
      %912 = func.call @cc_make_string(%910, %911) : (!llvm.ptr, i64) -> i64
      %913 = func.call @cc_nil_value() : () -> i64
      %914 = func.call @cc_errorp(%912) : (i64) -> i64
      %915 = arith.cmpi ne, %914, %913 : i64
      %916 = arith.cmpi eq, %913, %913 : i64
      %917 = arith.andi %915, %916 : i1
      %918 = scf.if %917 -> (i64) {
        scf.yield %912 : i64
      } else {
        scf.yield %913 : i64
      }
      %919 = arith.cmpi ne, %918, %913 : i64
      scf.if %919 {
        func.call @stack_push_pointer(%918) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%912) : (i64) -> ()
        %920 = llvm.mlir.addressof @str81 : !llvm.ptr
        %921 = func.call @cc_make_function_ref_const(%920) : (!llvm.ptr) -> i64
        %922 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%921, %922) : (i64, i64) -> ()
      }
      %923 = func.call @stack_pop_pointer() : () -> i64
      %924 = llvm.mlir.addressof @str82 : !llvm.ptr
      %925 = arith.constant 42 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = func.call @cc_nil_value() : () -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_errorp(%927) : (i64) -> i64
      %930 = arith.cmpi ne, %929, %928 : i64
      %931 = scf.if %930 -> (i64) {
        scf.yield %927 : i64
      } else {
        %932 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%932) : (i64) -> ()
        %933 = func.call @stack_pop_pointer() : () -> i64
        %934 = func.call @cc_nil_value() : () -> i64
        %935 = func.call @cc_errorp(%923) : (i64) -> i64
        %936 = arith.cmpi ne, %935, %934 : i64
        %937 = arith.cmpi eq, %934, %934 : i64
        %938 = arith.andi %936, %937 : i1
        %939 = scf.if %938 -> (i64) {
          scf.yield %923 : i64
        } else {
          scf.yield %934 : i64
        }
        %940 = arith.cmpi ne, %939, %934 : i64
        scf.if %940 {
          func.call @stack_push_pointer(%939) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%923) : (i64) -> ()
          %941 = llvm.mlir.addressof @str83 : !llvm.ptr
          %942 = func.call @cc_make_function_ref_const(%941) : (!llvm.ptr) -> i64
          %943 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%942, %943) : (i64, i64) -> ()
        }
        %944 = func.call @stack_pop_pointer() : () -> i64
        %945 = func.call @cc_multiple_value_list(%944) : (i64) -> i64
        %946 = func.call @cc_nth(%933, %945) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
        %947 = arith.addi %946, %__rlasp_stack_elide_zero_211 : i64
        %948 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%948) : (i64) -> ()
        %949 = func.call @stack_pop_pointer() : () -> i64
        %950 = func.call @cc_nil_value() : () -> i64
        %951 = func.call @cc_errorp(%926) : (i64) -> i64
        %952 = arith.cmpi ne, %951, %950 : i64
        %953 = arith.cmpi eq, %950, %950 : i64
        %954 = arith.andi %952, %953 : i1
        %955 = scf.if %954 -> (i64) {
          scf.yield %926 : i64
        } else {
          scf.yield %950 : i64
        }
        %956 = arith.cmpi ne, %955, %950 : i64
        scf.if %956 {
          func.call @stack_push_pointer(%955) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%926) : (i64) -> ()
          %957 = llvm.mlir.addressof @str84 : !llvm.ptr
          %958 = func.call @cc_make_function_ref_const(%957) : (!llvm.ptr) -> i64
          %959 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%958, %959) : (i64, i64) -> ()
        }
        %960 = func.call @stack_pop_pointer() : () -> i64
        %961 = func.call @cc_multiple_value_list(%960) : (i64) -> i64
        %962 = func.call @cc_nth(%949, %961) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
        %963 = arith.addi %962, %__rlasp_stack_elide_zero_212 : i64
        %964 = arith.constant 1 : i1
        %966 = arith.constant 3 : i64
        %965 = arith.andi %947, %966 : i64
        %967 = arith.constant 0 : i64
        %968 = arith.cmpi eq, %965, %967 : i64
        %970 = arith.constant 3 : i64
        %969 = arith.andi %963, %970 : i64
        %971 = arith.constant 0 : i64
        %972 = arith.cmpi eq, %969, %971 : i64
        %973 = arith.andi %968, %972 : i1
        %974 = scf.if %973 -> (i1) {
          %975 = arith.constant 2 : i64
          %976 = arith.shrsi %947, %975 : i64
          %977 = arith.constant 2 : i64
          %978 = arith.shrsi %963, %977 : i64
          %979 = arith.cmpi eq, %976, %978 : i64
          scf.yield %979 : i1
        } else {
          %980 = func.call @cc_eq(%947, %963) : (i64, i64) -> i64
          %981 = func.call @cc_nil_value() : () -> i64
          %982 = arith.cmpi ne, %980, %981 : i64
          scf.yield %982 : i1
        }
        %983 = arith.andi %964, %974 : i1
        %984 = func.call @cc_nil_value() : () -> i64
        %985 = func.call @cc_t_value() : () -> i64
        %986 = scf.if %983 -> (i64) {
          scf.yield %985 : i64
        } else {
          scf.yield %984 : i64
        }
        %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
        %987 = arith.addi %986, %__rlasp_stack_elide_zero_213 : i64
        scf.yield %987 : i64
      }
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %988 = arith.addi %931, %__rlasp_stack_elide_zero_214 : i64
      %989 = func.call @cc_nil_value() : () -> i64
      %990 = func.call @cc_cons(%988, %989) : (i64, i64) -> i64
      %991 = func.call @cc_not(%990) : (i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %992 = arith.addi %991, %__rlasp_stack_elide_zero_215 : i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_not(%994) : (i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %996 = arith.addi %995, %__rlasp_stack_elide_zero_216 : i64
      scf.yield %996 : i64
    }
    func.call @stack_push_pointer(%909) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725317"() {
    %1170 = func.call @cc_nil_value() : () -> i64
    %1171 = func.call @cc_nil_value() : () -> i64
    %1172 = func.call @cc_errorp(%1170) : (i64) -> i64
    %1173 = arith.cmpi ne, %1172, %1171 : i64
    %1174 = scf.if %1173 -> (i64) {
      scf.yield %1170 : i64
    } else {
      %1175 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1175) : (i64) -> ()
      %1176 = func.call @stack_pop_pointer() : () -> i64
      %1177 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1178 = arith.constant 42 : i64
      %1179 = func.call @cc_make_string(%1177, %1178) : (!llvm.ptr, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_errorp(%1179) : (i64) -> i64
      %1182 = arith.cmpi ne, %1181, %1180 : i64
      %1183 = arith.cmpi eq, %1180, %1180 : i64
      %1184 = arith.andi %1182, %1183 : i1
      %1185 = scf.if %1184 -> (i64) {
        scf.yield %1179 : i64
      } else {
        scf.yield %1180 : i64
      }
      %1186 = arith.cmpi ne, %1185, %1180 : i64
      scf.if %1186 {
        func.call @stack_push_pointer(%1185) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1179) : (i64) -> ()
        %1187 = llvm.mlir.addressof @str101 : !llvm.ptr
        %1188 = func.call @cc_make_function_ref_const(%1187) : (!llvm.ptr) -> i64
        %1189 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1188, %1189) : (i64, i64) -> ()
      }
      %1190 = func.call @stack_pop_pointer() : () -> i64
      %1191 = func.call @cc_multiple_value_list(%1190) : (i64) -> i64
      %1192 = func.call @cc_nth(%1176, %1191) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %1193 = arith.addi %1192, %__rlasp_stack_elide_zero_217 : i64
      %1194 = func.call @cc_nil_value() : () -> i64
      %1195 = func.call @cc_cons(%1193, %1194) : (i64, i64) -> i64
      %1196 = func.call @cc_not(%1195) : (i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %1197 = arith.addi %1196, %__rlasp_stack_elide_zero_218 : i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_not(%1199) : (i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %1201 = arith.addi %1200, %__rlasp_stack_elide_zero_219 : i64
      scf.yield %1201 : i64
    }
    func.call @stack_push_pointer(%1174) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725318"() {
    %1526 = func.call @cc_nil_value() : () -> i64
    %1527 = func.call @cc_nil_value() : () -> i64
    %1528 = func.call @cc_errorp(%1526) : (i64) -> i64
    %1529 = arith.cmpi ne, %1528, %1527 : i64
    %1530 = scf.if %1529 -> (i64) {
      scf.yield %1526 : i64
    } else {
      %1531 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1532 = arith.constant 42 : i64
      %1533 = func.call @cc_make_string(%1531, %1532) : (!llvm.ptr, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_nil_value() : () -> i64
      %1536 = func.call @cc_errorp(%1534) : (i64) -> i64
      %1537 = arith.cmpi ne, %1536, %1535 : i64
      %1538 = scf.if %1537 -> (i64) {
        scf.yield %1534 : i64
      } else {
        %1539 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1540 = arith.constant 9 : i64
        %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
        %1542 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1543 = arith.constant 7 : i64
        %1544 = func.call @cc_make_string(%1542, %1543) : (!llvm.ptr, i64) -> i64
        %1545 = func.call @cc_intern(%1541, %1544) : (i64, i64) -> i64
        %1546 = func.call @cc_nil_value() : () -> i64
        %1547 = func.call @cc_cons(%1545, %1546) : (i64, i64) -> i64
        %1548 = func.call @cc_values_pack(%1547) : (i64) -> i64
        %1549 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1550 = arith.constant 5 : i64
        %1551 = func.call @cc_make_string(%1549, %1550) : (!llvm.ptr, i64) -> i64
        %1552 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1553 = arith.constant 7 : i64
        %1554 = func.call @cc_make_string(%1552, %1553) : (!llvm.ptr, i64) -> i64
        %1555 = func.call @cc_intern(%1551, %1554) : (i64, i64) -> i64
        %1556 = func.call @cc_nil_value() : () -> i64
        %1557 = func.call @cc_cons(%1555, %1556) : (i64, i64) -> i64
        %1558 = func.call @cc_values_pack(%1557) : (i64) -> i64
        %1559 = func.call @cc_nil_value() : () -> i64
        %1560 = func.call @cc_errorp(%1533) : (i64) -> i64
        %1561 = arith.cmpi ne, %1560, %1559 : i64
        %1562 = arith.cmpi eq, %1559, %1559 : i64
        %1563 = arith.andi %1561, %1562 : i1
        %1564 = scf.if %1563 -> (i64) {
          scf.yield %1533 : i64
        } else {
          scf.yield %1559 : i64
        }
        %1565 = func.call @cc_errorp(%1545) : (i64) -> i64
        %1566 = arith.cmpi ne, %1565, %1559 : i64
        %1567 = arith.cmpi eq, %1564, %1559 : i64
        %1568 = arith.andi %1566, %1567 : i1
        %1569 = scf.if %1568 -> (i64) {
          scf.yield %1545 : i64
        } else {
          scf.yield %1564 : i64
        }
        %1570 = func.call @cc_errorp(%1555) : (i64) -> i64
        %1571 = arith.cmpi ne, %1570, %1559 : i64
        %1572 = arith.cmpi eq, %1569, %1559 : i64
        %1573 = arith.andi %1571, %1572 : i1
        %1574 = scf.if %1573 -> (i64) {
          scf.yield %1555 : i64
        } else {
          scf.yield %1569 : i64
        }
        %1575 = arith.cmpi ne, %1574, %1559 : i64
        scf.if %1575 {
          func.call @stack_push_pointer(%1574) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1533) : (i64) -> ()
          func.call @stack_push_pointer(%1545) : (i64) -> ()
          func.call @stack_push_pointer(%1555) : (i64) -> ()
          %1576 = llvm.mlir.addressof @str138 : !llvm.ptr
          %1577 = func.call @cc_make_function_ref_const(%1576) : (!llvm.ptr) -> i64
          %1578 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1577, %1578) : (i64, i64) -> ()
        }
        %1579 = func.call @stack_pop_pointer() : () -> i64
        %1580 = func.call @cc_nil_value() : () -> i64
        %1581 = func.call @cc_nil_value() : () -> i64
        %1582 = func.call @cc_errorp(%1580) : (i64) -> i64
        %1583 = arith.cmpi ne, %1582, %1581 : i64
        %1584 = scf.if %1583 -> (i64) {
          scf.yield %1580 : i64
        } else {
          %1585 = func.call @cc_nil_value() : () -> i64
          %1586 = func.call @cc_errorp(%1579) : (i64) -> i64
          %1587 = arith.cmpi ne, %1586, %1585 : i64
          %1588 = arith.cmpi eq, %1585, %1585 : i64
          %1589 = arith.andi %1587, %1588 : i1
          %1590 = scf.if %1589 -> (i64) {
            scf.yield %1579 : i64
          } else {
            scf.yield %1585 : i64
          }
          %1591 = arith.cmpi ne, %1590, %1585 : i64
          scf.if %1591 {
            func.call @stack_push_pointer(%1590) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1579) : (i64) -> ()
            %1592 = llvm.mlir.addressof @str139 : !llvm.ptr
            %1593 = func.call @cc_make_function_ref_const(%1592) : (!llvm.ptr) -> i64
            %1594 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1593, %1594) : (i64, i64) -> ()
          }
          %1595 = func.call @stack_pop_pointer() : () -> i64
          %1596 = func.call @cc_nil_value() : () -> i64
          %1597 = func.call @cc_nil_value() : () -> i64
          %1598 = func.call @cc_errorp(%1596) : (i64) -> i64
          %1599 = arith.cmpi ne, %1598, %1597 : i64
          %1600 = scf.if %1599 -> (i64) {
            scf.yield %1596 : i64
          } else {
            %1601 = func.call @cc_nil_value() : () -> i64
            %1602 = func.call @cc_errorp(%1595) : (i64) -> i64
            %1603 = arith.cmpi ne, %1602, %1601 : i64
            %1604 = arith.cmpi eq, %1601, %1601 : i64
            %1605 = arith.andi %1603, %1604 : i1
            %1606 = scf.if %1605 -> (i64) {
              scf.yield %1595 : i64
            } else {
              scf.yield %1601 : i64
            }
            %1607 = arith.cmpi ne, %1606, %1601 : i64
            scf.if %1607 {
              func.call @stack_push_pointer(%1606) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1595) : (i64) -> ()
              %1608 = llvm.mlir.addressof @str140 : !llvm.ptr
              %1609 = func.call @cc_make_function_ref_const(%1608) : (!llvm.ptr) -> i64
              %1610 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1609, %1610) : (i64, i64) -> ()
            }
            %1611 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1611 : i64
          }
          %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
          %1612 = arith.addi %1600, %__rlasp_stack_elide_zero_220 : i64
          %1613 = func.call @cc_multiple_value_list(%1612) : (i64) -> i64
          %1614 = func.call @cc_nil_value() : () -> i64
          %1615 = func.call @cc_errorp(%1579) : (i64) -> i64
          %1616 = arith.cmpi ne, %1615, %1614 : i64
          %1617 = arith.cmpi eq, %1614, %1614 : i64
          %1618 = arith.andi %1616, %1617 : i1
          %1619 = scf.if %1618 -> (i64) {
            scf.yield %1579 : i64
          } else {
            scf.yield %1614 : i64
          }
          %1620 = arith.cmpi ne, %1619, %1614 : i64
          scf.if %1620 {
            func.call @stack_push_pointer(%1619) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1579) : (i64) -> ()
            %1621 = llvm.mlir.addressof @str141 : !llvm.ptr
            %1622 = func.call @cc_make_function_ref_const(%1621) : (!llvm.ptr) -> i64
            %1623 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1622, %1623) : (i64, i64) -> ()
          }
          %1624 = func.call @stack_depth() : () -> i64
          %1625 = arith.constant 0 : i64
          %1626 = arith.cmpi sgt, %1624, %1625 : i64
          scf.if %1626 {
            %1627 = func.call @stack_pop_pointer() : () -> i64
          }
          %1628 = func.call @cc_values_pack(%1613) : (i64) -> i64
          %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
          %1629 = arith.addi %1628, %__rlasp_stack_elide_zero_221 : i64
          scf.yield %1629 : i64
        }
        %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
        %1630 = arith.addi %1584, %__rlasp_stack_elide_zero_222 : i64
        scf.yield %1630 : i64
      }
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %1631 = arith.addi %1538, %__rlasp_stack_elide_zero_223 : i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_cons(%1631, %1632) : (i64, i64) -> i64
      %1634 = func.call @cc_not(%1633) : (i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %1635 = arith.addi %1634, %__rlasp_stack_elide_zero_224 : i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_not(%1637) : (i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %1639 = arith.addi %1638, %__rlasp_stack_elide_zero_225 : i64
      scf.yield %1639 : i64
    }
    func.call @stack_push_pointer(%1530) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725319"() {
    %2047 = func.call @cc_nil_value() : () -> i64
    %2048 = func.call @cc_nil_value() : () -> i64
    %2049 = func.call @cc_errorp(%2047) : (i64) -> i64
    %2050 = arith.cmpi ne, %2049, %2048 : i64
    %2051 = scf.if %2050 -> (i64) {
      scf.yield %2047 : i64
    } else {
      %2052 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2053 = arith.constant 42 : i64
      %2054 = func.call @cc_make_string(%2052, %2053) : (!llvm.ptr, i64) -> i64
      %2055 = func.call @cc_nil_value() : () -> i64
      %2056 = func.call @cc_nil_value() : () -> i64
      %2057 = func.call @cc_errorp(%2055) : (i64) -> i64
      %2058 = arith.cmpi ne, %2057, %2056 : i64
      %2059 = scf.if %2058 -> (i64) {
        scf.yield %2055 : i64
      } else {
        %2060 = llvm.mlir.addressof @str183 : !llvm.ptr
        %2061 = arith.constant 9 : i64
        %2062 = func.call @cc_make_string(%2060, %2061) : (!llvm.ptr, i64) -> i64
        %2063 = llvm.mlir.addressof @str184 : !llvm.ptr
        %2064 = arith.constant 7 : i64
        %2065 = func.call @cc_make_string(%2063, %2064) : (!llvm.ptr, i64) -> i64
        %2066 = func.call @cc_intern(%2062, %2065) : (i64, i64) -> i64
        %2067 = func.call @cc_nil_value() : () -> i64
        %2068 = func.call @cc_cons(%2066, %2067) : (i64, i64) -> i64
        %2069 = func.call @cc_values_pack(%2068) : (i64) -> i64
        %2070 = llvm.mlir.addressof @str185 : !llvm.ptr
        %2071 = arith.constant 5 : i64
        %2072 = func.call @cc_make_string(%2070, %2071) : (!llvm.ptr, i64) -> i64
        %2073 = llvm.mlir.addressof @str186 : !llvm.ptr
        %2074 = arith.constant 7 : i64
        %2075 = func.call @cc_make_string(%2073, %2074) : (!llvm.ptr, i64) -> i64
        %2076 = func.call @cc_intern(%2072, %2075) : (i64, i64) -> i64
        %2077 = func.call @cc_nil_value() : () -> i64
        %2078 = func.call @cc_cons(%2076, %2077) : (i64, i64) -> i64
        %2079 = func.call @cc_values_pack(%2078) : (i64) -> i64
        %2080 = func.call @cc_nil_value() : () -> i64
        %2081 = func.call @cc_errorp(%2054) : (i64) -> i64
        %2082 = arith.cmpi ne, %2081, %2080 : i64
        %2083 = arith.cmpi eq, %2080, %2080 : i64
        %2084 = arith.andi %2082, %2083 : i1
        %2085 = scf.if %2084 -> (i64) {
          scf.yield %2054 : i64
        } else {
          scf.yield %2080 : i64
        }
        %2086 = func.call @cc_errorp(%2066) : (i64) -> i64
        %2087 = arith.cmpi ne, %2086, %2080 : i64
        %2088 = arith.cmpi eq, %2085, %2080 : i64
        %2089 = arith.andi %2087, %2088 : i1
        %2090 = scf.if %2089 -> (i64) {
          scf.yield %2066 : i64
        } else {
          scf.yield %2085 : i64
        }
        %2091 = func.call @cc_errorp(%2076) : (i64) -> i64
        %2092 = arith.cmpi ne, %2091, %2080 : i64
        %2093 = arith.cmpi eq, %2090, %2080 : i64
        %2094 = arith.andi %2092, %2093 : i1
        %2095 = scf.if %2094 -> (i64) {
          scf.yield %2076 : i64
        } else {
          scf.yield %2090 : i64
        }
        %2096 = arith.cmpi ne, %2095, %2080 : i64
        scf.if %2096 {
          func.call @stack_push_pointer(%2095) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2054) : (i64) -> ()
          func.call @stack_push_pointer(%2066) : (i64) -> ()
          func.call @stack_push_pointer(%2076) : (i64) -> ()
          %2097 = llvm.mlir.addressof @str187 : !llvm.ptr
          %2098 = func.call @cc_make_function_ref_const(%2097) : (!llvm.ptr) -> i64
          %2099 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%2098, %2099) : (i64, i64) -> ()
        }
        %2100 = func.call @stack_pop_pointer() : () -> i64
        %2101 = func.call @cc_nil_value() : () -> i64
        %2102 = func.call @cc_nil_value() : () -> i64
        %2103 = func.call @cc_errorp(%2101) : (i64) -> i64
        %2104 = arith.cmpi ne, %2103, %2102 : i64
        %2105 = scf.if %2104 -> (i64) {
          scf.yield %2101 : i64
        } else {
          %2106 = func.call @cc_nil_value() : () -> i64
          %2107 = func.call @cc_errorp(%2100) : (i64) -> i64
          %2108 = arith.cmpi ne, %2107, %2106 : i64
          %2109 = arith.cmpi eq, %2106, %2106 : i64
          %2110 = arith.andi %2108, %2109 : i1
          %2111 = scf.if %2110 -> (i64) {
            scf.yield %2100 : i64
          } else {
            scf.yield %2106 : i64
          }
          %2112 = arith.cmpi ne, %2111, %2106 : i64
          scf.if %2112 {
            func.call @stack_push_pointer(%2111) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2100) : (i64) -> ()
            %2113 = llvm.mlir.addressof @str188 : !llvm.ptr
            %2114 = func.call @cc_make_function_ref_const(%2113) : (!llvm.ptr) -> i64
            %2115 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2114, %2115) : (i64, i64) -> ()
          }
          %2116 = func.call @stack_pop_pointer() : () -> i64
          %2117 = func.call @cc_nil_value() : () -> i64
          %2118 = func.call @cc_nil_value() : () -> i64
          %2119 = func.call @cc_errorp(%2117) : (i64) -> i64
          %2120 = arith.cmpi ne, %2119, %2118 : i64
          %2121 = scf.if %2120 -> (i64) {
            scf.yield %2117 : i64
          } else {
            %2122 = arith.constant 0 : i64
            func.call @stack_push_fixnum(%2122) : (i64) -> ()
            %2123 = func.call @stack_pop_pointer() : () -> i64
            %2124 = func.call @cc_nil_value() : () -> i64
            %2125 = func.call @cc_errorp(%2054) : (i64) -> i64
            %2126 = arith.cmpi ne, %2125, %2124 : i64
            %2127 = arith.cmpi eq, %2124, %2124 : i64
            %2128 = arith.andi %2126, %2127 : i1
            %2129 = scf.if %2128 -> (i64) {
              scf.yield %2054 : i64
            } else {
              scf.yield %2124 : i64
            }
            %2130 = arith.cmpi ne, %2129, %2124 : i64
            scf.if %2130 {
              func.call @stack_push_pointer(%2129) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2054) : (i64) -> ()
              %2131 = llvm.mlir.addressof @str189 : !llvm.ptr
              %2132 = func.call @cc_make_function_ref_const(%2131) : (!llvm.ptr) -> i64
              %2133 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2132, %2133) : (i64, i64) -> ()
            }
            %2134 = func.call @stack_pop_pointer() : () -> i64
            %2135 = func.call @cc_multiple_value_list(%2134) : (i64) -> i64
            %2136 = func.call @cc_nth(%2123, %2135) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
            %2137 = arith.addi %2136, %__rlasp_stack_elide_zero_226 : i64
            %2138 = arith.constant 0 : i64
            func.call @stack_push_fixnum(%2138) : (i64) -> ()
            %2139 = func.call @stack_pop_pointer() : () -> i64
            %2140 = func.call @cc_nil_value() : () -> i64
            %2141 = func.call @cc_errorp(%2116) : (i64) -> i64
            %2142 = arith.cmpi ne, %2141, %2140 : i64
            %2143 = arith.cmpi eq, %2140, %2140 : i64
            %2144 = arith.andi %2142, %2143 : i1
            %2145 = scf.if %2144 -> (i64) {
              scf.yield %2116 : i64
            } else {
              scf.yield %2140 : i64
            }
            %2146 = arith.cmpi ne, %2145, %2140 : i64
            scf.if %2146 {
              func.call @stack_push_pointer(%2145) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2116) : (i64) -> ()
              %2147 = llvm.mlir.addressof @str190 : !llvm.ptr
              %2148 = func.call @cc_make_function_ref_const(%2147) : (!llvm.ptr) -> i64
              %2149 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2148, %2149) : (i64, i64) -> ()
            }
            %2150 = func.call @stack_pop_pointer() : () -> i64
            %2151 = func.call @cc_multiple_value_list(%2150) : (i64) -> i64
            %2152 = func.call @cc_nth(%2139, %2151) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
            %2153 = arith.addi %2152, %__rlasp_stack_elide_zero_227 : i64
            %2154 = arith.constant 1 : i1
            %2156 = arith.constant 3 : i64
            %2155 = arith.andi %2137, %2156 : i64
            %2157 = arith.constant 0 : i64
            %2158 = arith.cmpi eq, %2155, %2157 : i64
            %2160 = arith.constant 3 : i64
            %2159 = arith.andi %2153, %2160 : i64
            %2161 = arith.constant 0 : i64
            %2162 = arith.cmpi eq, %2159, %2161 : i64
            %2163 = arith.andi %2158, %2162 : i1
            %2164 = scf.if %2163 -> (i1) {
              %2165 = arith.constant 2 : i64
              %2166 = arith.shrsi %2137, %2165 : i64
              %2167 = arith.constant 2 : i64
              %2168 = arith.shrsi %2153, %2167 : i64
              %2169 = arith.cmpi eq, %2166, %2168 : i64
              scf.yield %2169 : i1
            } else {
              %2170 = func.call @cc_eq(%2137, %2153) : (i64, i64) -> i64
              %2171 = func.call @cc_nil_value() : () -> i64
              %2172 = arith.cmpi ne, %2170, %2171 : i64
              scf.yield %2172 : i1
            }
            %2173 = arith.andi %2154, %2164 : i1
            %2174 = func.call @cc_nil_value() : () -> i64
            %2175 = func.call @cc_t_value() : () -> i64
            %2176 = scf.if %2173 -> (i64) {
              scf.yield %2175 : i64
            } else {
              scf.yield %2174 : i64
            }
            %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
            %2177 = arith.addi %2176, %__rlasp_stack_elide_zero_228 : i64
            scf.yield %2177 : i64
          }
          %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
          %2178 = arith.addi %2121, %__rlasp_stack_elide_zero_229 : i64
          %2179 = func.call @cc_multiple_value_list(%2178) : (i64) -> i64
          %2180 = func.call @cc_nil_value() : () -> i64
          %2181 = func.call @cc_errorp(%2100) : (i64) -> i64
          %2182 = arith.cmpi ne, %2181, %2180 : i64
          %2183 = arith.cmpi eq, %2180, %2180 : i64
          %2184 = arith.andi %2182, %2183 : i1
          %2185 = scf.if %2184 -> (i64) {
            scf.yield %2100 : i64
          } else {
            scf.yield %2180 : i64
          }
          %2186 = arith.cmpi ne, %2185, %2180 : i64
          scf.if %2186 {
            func.call @stack_push_pointer(%2185) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2100) : (i64) -> ()
            %2187 = llvm.mlir.addressof @str191 : !llvm.ptr
            %2188 = func.call @cc_make_function_ref_const(%2187) : (!llvm.ptr) -> i64
            %2189 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2188, %2189) : (i64, i64) -> ()
          }
          %2190 = func.call @stack_depth() : () -> i64
          %2191 = arith.constant 0 : i64
          %2192 = arith.cmpi sgt, %2190, %2191 : i64
          scf.if %2192 {
            %2193 = func.call @stack_pop_pointer() : () -> i64
          }
          %2194 = func.call @cc_values_pack(%2179) : (i64) -> i64
          %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
          %2195 = arith.addi %2194, %__rlasp_stack_elide_zero_230 : i64
          scf.yield %2195 : i64
        }
        %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
        %2196 = arith.addi %2105, %__rlasp_stack_elide_zero_231 : i64
        scf.yield %2196 : i64
      }
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %2197 = arith.addi %2059, %__rlasp_stack_elide_zero_232 : i64
      %2198 = func.call @cc_nil_value() : () -> i64
      %2199 = func.call @cc_cons(%2197, %2198) : (i64, i64) -> i64
      %2200 = func.call @cc_not(%2199) : (i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %2201 = arith.addi %2200, %__rlasp_stack_elide_zero_233 : i64
      %2202 = func.call @cc_nil_value() : () -> i64
      %2203 = func.call @cc_cons(%2201, %2202) : (i64, i64) -> i64
      %2204 = func.call @cc_not(%2203) : (i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %2205 = arith.addi %2204, %__rlasp_stack_elide_zero_234 : i64
      scf.yield %2205 : i64
    }
    func.call @stack_push_pointer(%2051) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725320"() {
    %2613 = func.call @cc_nil_value() : () -> i64
    %2614 = func.call @cc_nil_value() : () -> i64
    %2615 = func.call @cc_errorp(%2613) : (i64) -> i64
    %2616 = arith.cmpi ne, %2615, %2614 : i64
    %2617 = scf.if %2616 -> (i64) {
      scf.yield %2613 : i64
    } else {
      %2618 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2619 = arith.constant 42 : i64
      %2620 = func.call @cc_make_string(%2618, %2619) : (!llvm.ptr, i64) -> i64
      %2621 = func.call @cc_nil_value() : () -> i64
      %2622 = func.call @cc_nil_value() : () -> i64
      %2623 = func.call @cc_errorp(%2621) : (i64) -> i64
      %2624 = arith.cmpi ne, %2623, %2622 : i64
      %2625 = scf.if %2624 -> (i64) {
        scf.yield %2621 : i64
      } else {
        %2626 = llvm.mlir.addressof @str233 : !llvm.ptr
        %2627 = arith.constant 9 : i64
        %2628 = func.call @cc_make_string(%2626, %2627) : (!llvm.ptr, i64) -> i64
        %2629 = llvm.mlir.addressof @str234 : !llvm.ptr
        %2630 = arith.constant 7 : i64
        %2631 = func.call @cc_make_string(%2629, %2630) : (!llvm.ptr, i64) -> i64
        %2632 = func.call @cc_intern(%2628, %2631) : (i64, i64) -> i64
        %2633 = func.call @cc_nil_value() : () -> i64
        %2634 = func.call @cc_cons(%2632, %2633) : (i64, i64) -> i64
        %2635 = func.call @cc_values_pack(%2634) : (i64) -> i64
        %2636 = llvm.mlir.addressof @str235 : !llvm.ptr
        %2637 = arith.constant 5 : i64
        %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
        %2639 = llvm.mlir.addressof @str236 : !llvm.ptr
        %2640 = arith.constant 7 : i64
        %2641 = func.call @cc_make_string(%2639, %2640) : (!llvm.ptr, i64) -> i64
        %2642 = func.call @cc_intern(%2638, %2641) : (i64, i64) -> i64
        %2643 = func.call @cc_nil_value() : () -> i64
        %2644 = func.call @cc_cons(%2642, %2643) : (i64, i64) -> i64
        %2645 = func.call @cc_values_pack(%2644) : (i64) -> i64
        %2646 = func.call @cc_nil_value() : () -> i64
        %2647 = func.call @cc_errorp(%2620) : (i64) -> i64
        %2648 = arith.cmpi ne, %2647, %2646 : i64
        %2649 = arith.cmpi eq, %2646, %2646 : i64
        %2650 = arith.andi %2648, %2649 : i1
        %2651 = scf.if %2650 -> (i64) {
          scf.yield %2620 : i64
        } else {
          scf.yield %2646 : i64
        }
        %2652 = func.call @cc_errorp(%2632) : (i64) -> i64
        %2653 = arith.cmpi ne, %2652, %2646 : i64
        %2654 = arith.cmpi eq, %2651, %2646 : i64
        %2655 = arith.andi %2653, %2654 : i1
        %2656 = scf.if %2655 -> (i64) {
          scf.yield %2632 : i64
        } else {
          scf.yield %2651 : i64
        }
        %2657 = func.call @cc_errorp(%2642) : (i64) -> i64
        %2658 = arith.cmpi ne, %2657, %2646 : i64
        %2659 = arith.cmpi eq, %2656, %2646 : i64
        %2660 = arith.andi %2658, %2659 : i1
        %2661 = scf.if %2660 -> (i64) {
          scf.yield %2642 : i64
        } else {
          scf.yield %2656 : i64
        }
        %2662 = arith.cmpi ne, %2661, %2646 : i64
        scf.if %2662 {
          func.call @stack_push_pointer(%2661) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2620) : (i64) -> ()
          func.call @stack_push_pointer(%2632) : (i64) -> ()
          func.call @stack_push_pointer(%2642) : (i64) -> ()
          %2663 = llvm.mlir.addressof @str237 : !llvm.ptr
          %2664 = func.call @cc_make_function_ref_const(%2663) : (!llvm.ptr) -> i64
          %2665 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%2664, %2665) : (i64, i64) -> ()
        }
        %2666 = func.call @stack_pop_pointer() : () -> i64
        %2667 = func.call @cc_nil_value() : () -> i64
        %2668 = func.call @cc_nil_value() : () -> i64
        %2669 = func.call @cc_errorp(%2667) : (i64) -> i64
        %2670 = arith.cmpi ne, %2669, %2668 : i64
        %2671 = scf.if %2670 -> (i64) {
          scf.yield %2667 : i64
        } else {
          %2672 = func.call @cc_nil_value() : () -> i64
          %2673 = func.call @cc_errorp(%2666) : (i64) -> i64
          %2674 = arith.cmpi ne, %2673, %2672 : i64
          %2675 = arith.cmpi eq, %2672, %2672 : i64
          %2676 = arith.andi %2674, %2675 : i1
          %2677 = scf.if %2676 -> (i64) {
            scf.yield %2666 : i64
          } else {
            scf.yield %2672 : i64
          }
          %2678 = arith.cmpi ne, %2677, %2672 : i64
          scf.if %2678 {
            func.call @stack_push_pointer(%2677) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2666) : (i64) -> ()
            %2679 = llvm.mlir.addressof @str238 : !llvm.ptr
            %2680 = func.call @cc_make_function_ref_const(%2679) : (!llvm.ptr) -> i64
            %2681 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2680, %2681) : (i64, i64) -> ()
          }
          %2682 = func.call @stack_pop_pointer() : () -> i64
          %2683 = func.call @cc_nil_value() : () -> i64
          %2684 = func.call @cc_nil_value() : () -> i64
          %2685 = func.call @cc_errorp(%2683) : (i64) -> i64
          %2686 = arith.cmpi ne, %2685, %2684 : i64
          %2687 = scf.if %2686 -> (i64) {
            scf.yield %2683 : i64
          } else {
            %2688 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%2688) : (i64) -> ()
            %2689 = func.call @stack_pop_pointer() : () -> i64
            %2690 = func.call @cc_nil_value() : () -> i64
            %2691 = func.call @cc_errorp(%2620) : (i64) -> i64
            %2692 = arith.cmpi ne, %2691, %2690 : i64
            %2693 = arith.cmpi eq, %2690, %2690 : i64
            %2694 = arith.andi %2692, %2693 : i1
            %2695 = scf.if %2694 -> (i64) {
              scf.yield %2620 : i64
            } else {
              scf.yield %2690 : i64
            }
            %2696 = arith.cmpi ne, %2695, %2690 : i64
            scf.if %2696 {
              func.call @stack_push_pointer(%2695) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2620) : (i64) -> ()
              %2697 = llvm.mlir.addressof @str239 : !llvm.ptr
              %2698 = func.call @cc_make_function_ref_const(%2697) : (!llvm.ptr) -> i64
              %2699 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2698, %2699) : (i64, i64) -> ()
            }
            %2700 = func.call @stack_pop_pointer() : () -> i64
            %2701 = func.call @cc_multiple_value_list(%2700) : (i64) -> i64
            %2702 = func.call @cc_nth(%2689, %2701) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
            %2703 = arith.addi %2702, %__rlasp_stack_elide_zero_235 : i64
            %2704 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%2704) : (i64) -> ()
            %2705 = func.call @stack_pop_pointer() : () -> i64
            %2706 = func.call @cc_nil_value() : () -> i64
            %2707 = func.call @cc_errorp(%2682) : (i64) -> i64
            %2708 = arith.cmpi ne, %2707, %2706 : i64
            %2709 = arith.cmpi eq, %2706, %2706 : i64
            %2710 = arith.andi %2708, %2709 : i1
            %2711 = scf.if %2710 -> (i64) {
              scf.yield %2682 : i64
            } else {
              scf.yield %2706 : i64
            }
            %2712 = arith.cmpi ne, %2711, %2706 : i64
            scf.if %2712 {
              func.call @stack_push_pointer(%2711) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2682) : (i64) -> ()
              %2713 = llvm.mlir.addressof @str240 : !llvm.ptr
              %2714 = func.call @cc_make_function_ref_const(%2713) : (!llvm.ptr) -> i64
              %2715 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2714, %2715) : (i64, i64) -> ()
            }
            %2716 = func.call @stack_pop_pointer() : () -> i64
            %2717 = func.call @cc_multiple_value_list(%2716) : (i64) -> i64
            %2718 = func.call @cc_nth(%2705, %2717) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
            %2719 = arith.addi %2718, %__rlasp_stack_elide_zero_236 : i64
            %2720 = arith.constant 1 : i1
            %2722 = arith.constant 3 : i64
            %2721 = arith.andi %2703, %2722 : i64
            %2723 = arith.constant 0 : i64
            %2724 = arith.cmpi eq, %2721, %2723 : i64
            %2726 = arith.constant 3 : i64
            %2725 = arith.andi %2719, %2726 : i64
            %2727 = arith.constant 0 : i64
            %2728 = arith.cmpi eq, %2725, %2727 : i64
            %2729 = arith.andi %2724, %2728 : i1
            %2730 = scf.if %2729 -> (i1) {
              %2731 = arith.constant 2 : i64
              %2732 = arith.shrsi %2703, %2731 : i64
              %2733 = arith.constant 2 : i64
              %2734 = arith.shrsi %2719, %2733 : i64
              %2735 = arith.cmpi eq, %2732, %2734 : i64
              scf.yield %2735 : i1
            } else {
              %2736 = func.call @cc_eq(%2703, %2719) : (i64, i64) -> i64
              %2737 = func.call @cc_nil_value() : () -> i64
              %2738 = arith.cmpi ne, %2736, %2737 : i64
              scf.yield %2738 : i1
            }
            %2739 = arith.andi %2720, %2730 : i1
            %2740 = func.call @cc_nil_value() : () -> i64
            %2741 = func.call @cc_t_value() : () -> i64
            %2742 = scf.if %2739 -> (i64) {
              scf.yield %2741 : i64
            } else {
              scf.yield %2740 : i64
            }
            %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
            %2743 = arith.addi %2742, %__rlasp_stack_elide_zero_237 : i64
            scf.yield %2743 : i64
          }
          %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
          %2744 = arith.addi %2687, %__rlasp_stack_elide_zero_238 : i64
          %2745 = func.call @cc_multiple_value_list(%2744) : (i64) -> i64
          %2746 = func.call @cc_nil_value() : () -> i64
          %2747 = func.call @cc_errorp(%2666) : (i64) -> i64
          %2748 = arith.cmpi ne, %2747, %2746 : i64
          %2749 = arith.cmpi eq, %2746, %2746 : i64
          %2750 = arith.andi %2748, %2749 : i1
          %2751 = scf.if %2750 -> (i64) {
            scf.yield %2666 : i64
          } else {
            scf.yield %2746 : i64
          }
          %2752 = arith.cmpi ne, %2751, %2746 : i64
          scf.if %2752 {
            func.call @stack_push_pointer(%2751) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2666) : (i64) -> ()
            %2753 = llvm.mlir.addressof @str241 : !llvm.ptr
            %2754 = func.call @cc_make_function_ref_const(%2753) : (!llvm.ptr) -> i64
            %2755 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2754, %2755) : (i64, i64) -> ()
          }
          %2756 = func.call @stack_depth() : () -> i64
          %2757 = arith.constant 0 : i64
          %2758 = arith.cmpi sgt, %2756, %2757 : i64
          scf.if %2758 {
            %2759 = func.call @stack_pop_pointer() : () -> i64
          }
          %2760 = func.call @cc_values_pack(%2745) : (i64) -> i64
          %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
          %2761 = arith.addi %2760, %__rlasp_stack_elide_zero_239 : i64
          scf.yield %2761 : i64
        }
        %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
        %2762 = arith.addi %2671, %__rlasp_stack_elide_zero_240 : i64
        scf.yield %2762 : i64
      }
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %2763 = arith.addi %2625, %__rlasp_stack_elide_zero_241 : i64
      %2764 = func.call @cc_nil_value() : () -> i64
      %2765 = func.call @cc_cons(%2763, %2764) : (i64, i64) -> i64
      %2766 = func.call @cc_not(%2765) : (i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %2767 = arith.addi %2766, %__rlasp_stack_elide_zero_242 : i64
      %2768 = func.call @cc_nil_value() : () -> i64
      %2769 = func.call @cc_cons(%2767, %2768) : (i64, i64) -> i64
      %2770 = func.call @cc_not(%2769) : (i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %2771 = arith.addi %2770, %__rlasp_stack_elide_zero_243 : i64
      scf.yield %2771 : i64
    }
    func.call @stack_push_pointer(%2617) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725321"() {
    %3179 = func.call @cc_nil_value() : () -> i64
    %3180 = func.call @cc_nil_value() : () -> i64
    %3181 = func.call @cc_errorp(%3179) : (i64) -> i64
    %3182 = arith.cmpi ne, %3181, %3180 : i64
    %3183 = scf.if %3182 -> (i64) {
      scf.yield %3179 : i64
    } else {
      %3184 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3185 = arith.constant 42 : i64
      %3186 = func.call @cc_make_string(%3184, %3185) : (!llvm.ptr, i64) -> i64
      %3187 = func.call @cc_nil_value() : () -> i64
      %3188 = func.call @cc_nil_value() : () -> i64
      %3189 = func.call @cc_errorp(%3187) : (i64) -> i64
      %3190 = arith.cmpi ne, %3189, %3188 : i64
      %3191 = scf.if %3190 -> (i64) {
        scf.yield %3187 : i64
      } else {
        %3192 = llvm.mlir.addressof @str283 : !llvm.ptr
        %3193 = arith.constant 9 : i64
        %3194 = func.call @cc_make_string(%3192, %3193) : (!llvm.ptr, i64) -> i64
        %3195 = llvm.mlir.addressof @str284 : !llvm.ptr
        %3196 = arith.constant 7 : i64
        %3197 = func.call @cc_make_string(%3195, %3196) : (!llvm.ptr, i64) -> i64
        %3198 = func.call @cc_intern(%3194, %3197) : (i64, i64) -> i64
        %3199 = func.call @cc_nil_value() : () -> i64
        %3200 = func.call @cc_cons(%3198, %3199) : (i64, i64) -> i64
        %3201 = func.call @cc_values_pack(%3200) : (i64) -> i64
        %3202 = llvm.mlir.addressof @str285 : !llvm.ptr
        %3203 = arith.constant 5 : i64
        %3204 = func.call @cc_make_string(%3202, %3203) : (!llvm.ptr, i64) -> i64
        %3205 = llvm.mlir.addressof @str286 : !llvm.ptr
        %3206 = arith.constant 7 : i64
        %3207 = func.call @cc_make_string(%3205, %3206) : (!llvm.ptr, i64) -> i64
        %3208 = func.call @cc_intern(%3204, %3207) : (i64, i64) -> i64
        %3209 = func.call @cc_nil_value() : () -> i64
        %3210 = func.call @cc_cons(%3208, %3209) : (i64, i64) -> i64
        %3211 = func.call @cc_values_pack(%3210) : (i64) -> i64
        %3212 = func.call @cc_nil_value() : () -> i64
        %3213 = func.call @cc_errorp(%3186) : (i64) -> i64
        %3214 = arith.cmpi ne, %3213, %3212 : i64
        %3215 = arith.cmpi eq, %3212, %3212 : i64
        %3216 = arith.andi %3214, %3215 : i1
        %3217 = scf.if %3216 -> (i64) {
          scf.yield %3186 : i64
        } else {
          scf.yield %3212 : i64
        }
        %3218 = func.call @cc_errorp(%3198) : (i64) -> i64
        %3219 = arith.cmpi ne, %3218, %3212 : i64
        %3220 = arith.cmpi eq, %3217, %3212 : i64
        %3221 = arith.andi %3219, %3220 : i1
        %3222 = scf.if %3221 -> (i64) {
          scf.yield %3198 : i64
        } else {
          scf.yield %3217 : i64
        }
        %3223 = func.call @cc_errorp(%3208) : (i64) -> i64
        %3224 = arith.cmpi ne, %3223, %3212 : i64
        %3225 = arith.cmpi eq, %3222, %3212 : i64
        %3226 = arith.andi %3224, %3225 : i1
        %3227 = scf.if %3226 -> (i64) {
          scf.yield %3208 : i64
        } else {
          scf.yield %3222 : i64
        }
        %3228 = arith.cmpi ne, %3227, %3212 : i64
        scf.if %3228 {
          func.call @stack_push_pointer(%3227) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3186) : (i64) -> ()
          func.call @stack_push_pointer(%3198) : (i64) -> ()
          func.call @stack_push_pointer(%3208) : (i64) -> ()
          %3229 = llvm.mlir.addressof @str287 : !llvm.ptr
          %3230 = func.call @cc_make_function_ref_const(%3229) : (!llvm.ptr) -> i64
          %3231 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%3230, %3231) : (i64, i64) -> ()
        }
        %3232 = func.call @stack_pop_pointer() : () -> i64
        %3233 = func.call @cc_nil_value() : () -> i64
        %3234 = func.call @cc_nil_value() : () -> i64
        %3235 = func.call @cc_errorp(%3233) : (i64) -> i64
        %3236 = arith.cmpi ne, %3235, %3234 : i64
        %3237 = scf.if %3236 -> (i64) {
          scf.yield %3233 : i64
        } else {
          %3238 = func.call @cc_nil_value() : () -> i64
          %3239 = func.call @cc_errorp(%3232) : (i64) -> i64
          %3240 = arith.cmpi ne, %3239, %3238 : i64
          %3241 = arith.cmpi eq, %3238, %3238 : i64
          %3242 = arith.andi %3240, %3241 : i1
          %3243 = scf.if %3242 -> (i64) {
            scf.yield %3232 : i64
          } else {
            scf.yield %3238 : i64
          }
          %3244 = arith.cmpi ne, %3243, %3238 : i64
          scf.if %3244 {
            func.call @stack_push_pointer(%3243) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3232) : (i64) -> ()
            %3245 = llvm.mlir.addressof @str288 : !llvm.ptr
            %3246 = func.call @cc_make_function_ref_const(%3245) : (!llvm.ptr) -> i64
            %3247 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3246, %3247) : (i64, i64) -> ()
          }
          %3248 = func.call @stack_pop_pointer() : () -> i64
          %3249 = func.call @cc_nil_value() : () -> i64
          %3250 = func.call @cc_nil_value() : () -> i64
          %3251 = func.call @cc_errorp(%3249) : (i64) -> i64
          %3252 = arith.cmpi ne, %3251, %3250 : i64
          %3253 = scf.if %3252 -> (i64) {
            scf.yield %3249 : i64
          } else {
            %3254 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3254) : (i64) -> ()
            %3255 = func.call @stack_pop_pointer() : () -> i64
            %3256 = func.call @cc_nil_value() : () -> i64
            %3257 = func.call @cc_errorp(%3186) : (i64) -> i64
            %3258 = arith.cmpi ne, %3257, %3256 : i64
            %3259 = arith.cmpi eq, %3256, %3256 : i64
            %3260 = arith.andi %3258, %3259 : i1
            %3261 = scf.if %3260 -> (i64) {
              scf.yield %3186 : i64
            } else {
              scf.yield %3256 : i64
            }
            %3262 = arith.cmpi ne, %3261, %3256 : i64
            scf.if %3262 {
              func.call @stack_push_pointer(%3261) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3186) : (i64) -> ()
              %3263 = llvm.mlir.addressof @str289 : !llvm.ptr
              %3264 = func.call @cc_make_function_ref_const(%3263) : (!llvm.ptr) -> i64
              %3265 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3264, %3265) : (i64, i64) -> ()
            }
            %3266 = func.call @stack_pop_pointer() : () -> i64
            %3267 = func.call @cc_multiple_value_list(%3266) : (i64) -> i64
            %3268 = func.call @cc_nth(%3255, %3267) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
            %3269 = arith.addi %3268, %__rlasp_stack_elide_zero_244 : i64
            %3270 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3270) : (i64) -> ()
            %3271 = func.call @stack_pop_pointer() : () -> i64
            %3272 = func.call @cc_nil_value() : () -> i64
            %3273 = func.call @cc_errorp(%3248) : (i64) -> i64
            %3274 = arith.cmpi ne, %3273, %3272 : i64
            %3275 = arith.cmpi eq, %3272, %3272 : i64
            %3276 = arith.andi %3274, %3275 : i1
            %3277 = scf.if %3276 -> (i64) {
              scf.yield %3248 : i64
            } else {
              scf.yield %3272 : i64
            }
            %3278 = arith.cmpi ne, %3277, %3272 : i64
            scf.if %3278 {
              func.call @stack_push_pointer(%3277) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3248) : (i64) -> ()
              %3279 = llvm.mlir.addressof @str290 : !llvm.ptr
              %3280 = func.call @cc_make_function_ref_const(%3279) : (!llvm.ptr) -> i64
              %3281 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3280, %3281) : (i64, i64) -> ()
            }
            %3282 = func.call @stack_pop_pointer() : () -> i64
            %3283 = func.call @cc_multiple_value_list(%3282) : (i64) -> i64
            %3284 = func.call @cc_nth(%3271, %3283) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
            %3285 = arith.addi %3284, %__rlasp_stack_elide_zero_245 : i64
            %3286 = arith.constant 1 : i1
            %3288 = arith.constant 3 : i64
            %3287 = arith.andi %3269, %3288 : i64
            %3289 = arith.constant 0 : i64
            %3290 = arith.cmpi eq, %3287, %3289 : i64
            %3292 = arith.constant 3 : i64
            %3291 = arith.andi %3285, %3292 : i64
            %3293 = arith.constant 0 : i64
            %3294 = arith.cmpi eq, %3291, %3293 : i64
            %3295 = arith.andi %3290, %3294 : i1
            %3296 = scf.if %3295 -> (i1) {
              %3297 = arith.constant 2 : i64
              %3298 = arith.shrsi %3269, %3297 : i64
              %3299 = arith.constant 2 : i64
              %3300 = arith.shrsi %3285, %3299 : i64
              %3301 = arith.cmpi eq, %3298, %3300 : i64
              scf.yield %3301 : i1
            } else {
              %3302 = func.call @cc_eq(%3269, %3285) : (i64, i64) -> i64
              %3303 = func.call @cc_nil_value() : () -> i64
              %3304 = arith.cmpi ne, %3302, %3303 : i64
              scf.yield %3304 : i1
            }
            %3305 = arith.andi %3286, %3296 : i1
            %3306 = func.call @cc_nil_value() : () -> i64
            %3307 = func.call @cc_t_value() : () -> i64
            %3308 = scf.if %3305 -> (i64) {
              scf.yield %3307 : i64
            } else {
              scf.yield %3306 : i64
            }
            %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
            %3309 = arith.addi %3308, %__rlasp_stack_elide_zero_246 : i64
            scf.yield %3309 : i64
          }
          %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
          %3310 = arith.addi %3253, %__rlasp_stack_elide_zero_247 : i64
          %3311 = func.call @cc_multiple_value_list(%3310) : (i64) -> i64
          %3312 = func.call @cc_nil_value() : () -> i64
          %3313 = func.call @cc_errorp(%3232) : (i64) -> i64
          %3314 = arith.cmpi ne, %3313, %3312 : i64
          %3315 = arith.cmpi eq, %3312, %3312 : i64
          %3316 = arith.andi %3314, %3315 : i1
          %3317 = scf.if %3316 -> (i64) {
            scf.yield %3232 : i64
          } else {
            scf.yield %3312 : i64
          }
          %3318 = arith.cmpi ne, %3317, %3312 : i64
          scf.if %3318 {
            func.call @stack_push_pointer(%3317) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3232) : (i64) -> ()
            %3319 = llvm.mlir.addressof @str291 : !llvm.ptr
            %3320 = func.call @cc_make_function_ref_const(%3319) : (!llvm.ptr) -> i64
            %3321 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3320, %3321) : (i64, i64) -> ()
          }
          %3322 = func.call @stack_depth() : () -> i64
          %3323 = arith.constant 0 : i64
          %3324 = arith.cmpi sgt, %3322, %3323 : i64
          scf.if %3324 {
            %3325 = func.call @stack_pop_pointer() : () -> i64
          }
          %3326 = func.call @cc_values_pack(%3311) : (i64) -> i64
          %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
          %3327 = arith.addi %3326, %__rlasp_stack_elide_zero_248 : i64
          scf.yield %3327 : i64
        }
        %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
        %3328 = arith.addi %3237, %__rlasp_stack_elide_zero_249 : i64
        scf.yield %3328 : i64
      }
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %3329 = arith.addi %3191, %__rlasp_stack_elide_zero_250 : i64
      %3330 = func.call @cc_nil_value() : () -> i64
      %3331 = func.call @cc_cons(%3329, %3330) : (i64, i64) -> i64
      %3332 = func.call @cc_not(%3331) : (i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %3333 = arith.addi %3332, %__rlasp_stack_elide_zero_251 : i64
      %3334 = func.call @cc_nil_value() : () -> i64
      %3335 = func.call @cc_cons(%3333, %3334) : (i64, i64) -> i64
      %3336 = func.call @cc_not(%3335) : (i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %3337 = arith.addi %3336, %__rlasp_stack_elide_zero_252 : i64
      scf.yield %3337 : i64
    }
    func.call @stack_push_pointer(%3183) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725322"() {
    %3508 = func.call @cc_nil_value() : () -> i64
    %3509 = func.call @cc_nil_value() : () -> i64
    %3510 = func.call @cc_errorp(%3508) : (i64) -> i64
    %3511 = arith.cmpi ne, %3510, %3509 : i64
    %3512 = scf.if %3511 -> (i64) {
      scf.yield %3508 : i64
    } else {
      %3513 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3514 = func.call @cc_nil_value() : () -> i64
      %3515 = func.call @cc_nil_value() : () -> i64
      %3516 = func.call @cc_errorp(%3514) : (i64) -> i64
      %3517 = arith.cmpi ne, %3516, %3515 : i64
      %3518 = scf.if %3517 -> (i64) {
        scf.yield %3514 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3519 = arith.constant 23 : i64
        %3520 = func.call @cc_box_fixnum(%3519) : (i64) -> i64
        %3521 = func.call @cc_nil_value() : () -> i64
        %3522 = func.call @cc_errorp(%3520) : (i64) -> i64
        %3523 = arith.cmpi ne, %3522, %3521 : i64
        %3524 = arith.cmpi eq, %3521, %3521 : i64
        %3525 = arith.andi %3523, %3524 : i1
        %3526 = scf.if %3525 -> (i64) {
          scf.yield %3520 : i64
        } else {
          scf.yield %3521 : i64
        }
        %3527 = arith.cmpi ne, %3526, %3521 : i64
        scf.if %3527 {
          func.call @stack_push_pointer(%3526) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3520) : (i64) -> ()
          %3528 = llvm.mlir.addressof @str306 : !llvm.ptr
          %3529 = func.call @cc_make_function_ref_const(%3528) : (!llvm.ptr) -> i64
          %3530 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3529, %3530) : (i64, i64) -> ()
        }
        %3531 = func.call @stack_pop_pointer() : () -> i64
        %3532 = func.call @cc_errorp(%3531) : (i64) -> i64
        %3533 = func.call @cc_nil_value() : () -> i64
        %3534 = arith.cmpi ne, %3532, %3533 : i64
        scf.if %3534 {
          func.call @stack_push_pointer(%3531) : (i64) -> ()
        } else {
          %3535 = func.call @cc_multiple_value_list(%3531) : (i64) -> i64
          func.call @stack_push_pointer(%3535) : (i64) -> ()
        }
        %3536 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3537 = func.call @stack_pop_pointer() : () -> i64
        %3538 = func.call @cc_nil_value() : () -> i64
        %3539 = func.call @cc_maybe_error_from_multiple_value_list(%3536) : (i64) -> i64
        %3540 = func.call @cc_errorp(%3539) : (i64) -> i64
        %3541 = arith.cmpi ne, %3540, %3538 : i64
        %3542 = arith.cmpi eq, %3538, %3538 : i64
        %3543 = arith.andi %3541, %3542 : i1
        %3544 = scf.if %3543 -> (i64) {
          scf.yield %3539 : i64
        } else {
          scf.yield %3538 : i64
        }
        %3545 = arith.cmpi ne, %3544, %3538 : i64
        scf.if %3545 {
          func.call @stack_push_pointer(%3544) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3546 = func.call @stack_pop_pointer() : () -> i64
          %3547 = func.call @cc_cons(%3537, %3546) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
          %3548 = arith.addi %3547, %__rlasp_stack_elide_zero_253 : i64
          %3549 = func.call @cc_cons(%3536, %3548) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
          %3550 = arith.addi %3549, %__rlasp_stack_elide_zero_254 : i64
          %3551 = func.call @cc_values_pack(%3550) : (i64) -> i64
          func.call @stack_push_pointer(%3551) : (i64) -> ()
        }
        %3552 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3552 : i64
      }
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %3553 = arith.addi %3518, %__rlasp_stack_elide_zero_255 : i64
      %3554 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3555 = func.call @cc_errorp(%3553) : (i64) -> i64
      %3556 = func.call @cc_nil_value() : () -> i64
      %3557 = arith.cmpi ne, %3555, %3556 : i64
      scf.if %3557 {
        %3558 = func.call @cc_condition_value(%3553) : (i64) -> i64
        %3559 = func.call @cc_values2(%3556, %3558) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3559) : (i64) -> ()
      } else {
        %3560 = func.call @cc_multiple_value_list(%3553) : (i64) -> i64
        %3561 = func.call @cc_values_pack(%3560) : (i64) -> i64
        func.call @stack_push_pointer(%3561) : (i64) -> ()
      }
      %3562 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3562 : i64
    }
    func.call @stack_push_pointer(%3512) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725323"() {
    %3934 = func.call @stack_pop_pointer() : () -> i64
    %3935 = func.call @stack_pop_pointer() : () -> i64
    %3936 = func.call @cc_nil_value() : () -> i64
    %3937 = func.call @cc_nil_value() : () -> i64
    %3938 = func.call @cc_errorp(%3936) : (i64) -> i64
    %3939 = arith.cmpi ne, %3938, %3937 : i64
    %3940 = scf.if %3939 -> (i64) {
      scf.yield %3936 : i64
    } else {
      %3941 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3942 = arith.constant 11 : i64
      %3943 = func.call @cc_make_string(%3941, %3942) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %3944 = arith.addi %3943, %__rlasp_stack_elide_zero_256 : i64
      %3945 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3946 = arith.constant 9 : i64
      %3947 = func.call @cc_make_string(%3945, %3946) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %3948 = arith.addi %3947, %__rlasp_stack_elide_zero_257 : i64
      %3949 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3950 = arith.constant 8 : i64
      %3951 = func.call @cc_make_string(%3949, %3950) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %3952 = arith.addi %3951, %__rlasp_stack_elide_zero_258 : i64
      %3953 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3954 = arith.constant 6 : i64
      %3955 = func.call @cc_make_string(%3953, %3954) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %3956 = arith.addi %3955, %__rlasp_stack_elide_zero_259 : i64
      %3957 = func.call @cc_nil_value() : () -> i64
      %3958 = func.call @cc_errorp(%3944) : (i64) -> i64
      %3959 = arith.cmpi ne, %3958, %3957 : i64
      %3960 = arith.cmpi eq, %3957, %3957 : i64
      %3961 = arith.andi %3959, %3960 : i1
      %3962 = scf.if %3961 -> (i64) {
        scf.yield %3944 : i64
      } else {
        scf.yield %3957 : i64
      }
      %3963 = func.call @cc_errorp(%3948) : (i64) -> i64
      %3964 = arith.cmpi ne, %3963, %3957 : i64
      %3965 = arith.cmpi eq, %3962, %3957 : i64
      %3966 = arith.andi %3964, %3965 : i1
      %3967 = scf.if %3966 -> (i64) {
        scf.yield %3948 : i64
      } else {
        scf.yield %3962 : i64
      }
      %3968 = func.call @cc_errorp(%3952) : (i64) -> i64
      %3969 = arith.cmpi ne, %3968, %3957 : i64
      %3970 = arith.cmpi eq, %3967, %3957 : i64
      %3971 = arith.andi %3969, %3970 : i1
      %3972 = scf.if %3971 -> (i64) {
        scf.yield %3952 : i64
      } else {
        scf.yield %3967 : i64
      }
      %3973 = func.call @cc_errorp(%3956) : (i64) -> i64
      %3974 = arith.cmpi ne, %3973, %3957 : i64
      %3975 = arith.cmpi eq, %3972, %3957 : i64
      %3976 = arith.andi %3974, %3975 : i1
      %3977 = scf.if %3976 -> (i64) {
        scf.yield %3956 : i64
      } else {
        scf.yield %3972 : i64
      }
      %3978 = arith.cmpi ne, %3977, %3957 : i64
      scf.if %3978 {
        func.call @stack_push_pointer(%3977) : (i64) -> ()
      } else {
        %3979 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3979) : (i64) -> ()
        %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
        %3980 = arith.addi %3956, %__rlasp_stack_elide_zero_260 : i64
        %3981 = func.call @stack_pop_pointer() : () -> i64
        %3982 = func.call @cc_cons(%3980, %3981) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3982) : (i64) -> ()
        %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
        %3983 = arith.addi %3952, %__rlasp_stack_elide_zero_261 : i64
        %3984 = func.call @stack_pop_pointer() : () -> i64
        %3985 = func.call @cc_cons(%3983, %3984) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3985) : (i64) -> ()
        %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
        %3986 = arith.addi %3948, %__rlasp_stack_elide_zero_262 : i64
        %3987 = func.call @stack_pop_pointer() : () -> i64
        %3988 = func.call @cc_cons(%3986, %3987) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3988) : (i64) -> ()
        %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
        %3989 = arith.addi %3944, %__rlasp_stack_elide_zero_263 : i64
        %3990 = func.call @stack_pop_pointer() : () -> i64
        %3991 = func.call @cc_cons(%3989, %3990) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3991) : (i64) -> ()
      }
      %3992 = func.call @stack_pop_pointer() : () -> i64
      %3993 = func.call @cc_t_value() : () -> i64
      %3994 = func.call @cc_nil_value() : () -> i64
      %3995 = func.call @cc_errorp(%3992) : (i64) -> i64
      %3996 = arith.cmpi ne, %3995, %3994 : i64
      %3997 = arith.cmpi eq, %3994, %3994 : i64
      %3998 = arith.andi %3996, %3997 : i1
      %3999 = scf.if %3998 -> (i64) {
        scf.yield %3992 : i64
      } else {
        scf.yield %3994 : i64
      }
      %4000 = func.call @cc_errorp(%3993) : (i64) -> i64
      %4001 = arith.cmpi ne, %4000, %3994 : i64
      %4002 = arith.cmpi eq, %3999, %3994 : i64
      %4003 = arith.andi %4001, %4002 : i1
      %4004 = scf.if %4003 -> (i64) {
        scf.yield %3993 : i64
      } else {
        scf.yield %3999 : i64
      }
      %4005 = arith.cmpi ne, %4004, %3994 : i64
      scf.if %4005 {
        func.call @stack_push_pointer(%4004) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3992) : (i64) -> ()
        func.call @stack_push_pointer(%3993) : (i64) -> ()
        %4006 = llvm.mlir.addressof @str350 : !llvm.ptr
        %4007 = func.call @cc_make_function_ref_const(%4006) : (!llvm.ptr) -> i64
        %4008 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%4007, %4008) : (i64, i64) -> ()
      }
      %4009 = func.call @stack_pop_pointer() : () -> i64
      %4010 = func.call @cc_multiple_value_list(%4009) : (i64) -> i64
      %4011 = arith.constant 0 : i64
      %4012 = func.call @cc_box_fixnum(%4011) : (i64) -> i64
      %4013 = func.call @cc_nth(%4012, %4010) : (i64, i64) -> i64
      %4014 = arith.constant 1 : i64
      %4015 = func.call @cc_box_fixnum(%4014) : (i64) -> i64
      %4016 = func.call @cc_nth(%4015, %4010) : (i64, i64) -> i64
      %4017 = arith.constant 2 : i64
      %4018 = func.call @cc_box_fixnum(%4017) : (i64) -> i64
      %4019 = func.call @cc_nth(%4018, %4010) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %4020 = func.call @stack_depth() : () -> i64
      %4021 = arith.constant 0 : i64
      %4022 = arith.cmpi sgt, %4020, %4021 : i64
      scf.if %4022 {
        %4023 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %4024 = arith.addi %4019, %__rlasp_stack_elide_zero_264 : i64
      %4025 = func.call @cc_nil_value() : () -> i64
      %4026 = arith.cmpi ne, %4024, %4025 : i64
      scf.if %4026 {
        %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
        %4027 = arith.addi %4019, %__rlasp_stack_elide_zero_265 : i64
        %4028 = func.call @cc_nil_value() : () -> i64
        %4029 = func.call @cc_errorp(%4027) : (i64) -> i64
        %4030 = arith.cmpi ne, %4029, %4028 : i64
        %4031 = arith.cmpi eq, %4028, %4028 : i64
        %4032 = arith.andi %4030, %4031 : i1
        %4033 = scf.if %4032 -> (i64) {
          scf.yield %4027 : i64
        } else {
          scf.yield %4028 : i64
        }
        %4034 = arith.cmpi ne, %4033, %4028 : i64
        scf.if %4034 {
          func.call @stack_push_pointer(%4033) : (i64) -> ()
        } else {
          %4035 = func.call @cc_nil_value() : () -> i64
          %4036 = func.call @cc_cons(%4027, %4035) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4036) : (i64) -> ()
          func.call @cc_write_stack() : () -> ()
        }
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %4037 = func.call @stack_pop_pointer() : () -> i64
      %4038 = func.call @cc_nil_value() : () -> i64
      %4039 = func.call @cc_cons(%4037, %4038) : (i64, i64) -> i64
      %4040 = func.call @cc_not(%4039) : (i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %4041 = arith.addi %4040, %__rlasp_stack_elide_zero_266 : i64
      %4042 = func.call @cc_nil_value() : () -> i64
      %4043 = func.call @cc_cons(%4041, %4042) : (i64, i64) -> i64
      %4044 = func.call @cc_not(%4043) : (i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %4045 = arith.addi %4044, %__rlasp_stack_elide_zero_267 : i64
      scf.yield %4045 : i64
    }
    func.call @stack_push_pointer(%3940) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_269090723725312*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_269090723725312*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_269090723725312*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("STAT-ALL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str9("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str10("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str11("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str12("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str13("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str14("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str20("STAT-SIZE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str21("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str23("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str25("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str27("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str28("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str29("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str30("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str38("STAT-MTIME\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str39("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str41("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str43("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str47("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str49("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str50("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str58("STAT-SIZE-MTIME-NO-LOGICAL-PATHNAME\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str59("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str60("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("FILE-NO-LP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str63("TRANSLATE-LOGICAL-PATHNAME\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str66("FILE-LP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str67("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str68("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str73("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str74("FILE-NO-LP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str75("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str76("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str78("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("FILE-LP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str81("TRANSLATE-LOGICAL-PATHNAME\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str82("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str83("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str84("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str85("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str86("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str90("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str91("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str92("STAT-SIZE-MODE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str93("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str94("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str96("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str97("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str99("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str100("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str101("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str102("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str103("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str109("FSTAT-ALL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str110("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str111("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str114("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str115("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str116("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str117("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str118("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str120("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str121("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str122("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str123("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str125("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str126("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str127("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str131("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str132("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str133("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str134("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str135("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str136("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str137("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str138("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str139("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str140("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str141("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str142("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str143("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str145("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str146("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str147("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str148("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str149("FSTAT-SIZE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str150("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str151("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str152("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str153("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str154("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str155("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str166("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str167("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str168("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str176("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str180("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str181("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str182("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str183("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str189("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str190("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str191("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str192("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str198("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str199("FSTAT-MTIME\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str201("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str203("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str205("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str206("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str211("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str212("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str213("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str214("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str215("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str216("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str217("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str218("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str226("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str227("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str228("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str229("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str230("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str231("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str232("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str233("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str238("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str239("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str240("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str241("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str242("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str243("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str246("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str247("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str248("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str249("FSTAT-MODE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str250("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str251("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str252("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str253("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str255("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str258("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str261("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str262("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str263("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str264("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str265("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str266("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str267("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str268("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str276("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str277("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str280("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str281("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str282("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str283("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str288("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str289("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str290("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str291("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str292("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str293("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str295("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str296("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str297("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str298("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str299("FILE-STREAM-FILE-DESCRIPTOR-WRONG-TYPE\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str300("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str301("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str303("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str304("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str305("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str306("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str307("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str308("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str309("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str313("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str314("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str315("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str316("FILESTREAM_O__REPR__\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str317("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str318("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str319("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("ERRNO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str322("PID-OR-ERROR-MESSAGE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str323("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("VFORK-EXECVP\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str326("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str327("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str328("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str329("llvm-config\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("--ldflags\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str331("--libdir\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str332("--libs\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str333("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str334("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str336("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("ERRNO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str338("PID-OR-ERROR-MESSAGE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str339("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str340("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str343("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str345("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str346("llvm-config\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("--ldflags\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str348("--libdir\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str349("--libs\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str350("ext:vfork-execvp\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str351("#:%%DYN-CELL-269090723725324-ERRNO\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str352("#:%%DYN-CELL-269090723725325-PID-OR-ERROR-MESSAGE\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str353("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str354("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str357("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str358("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str359("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str360("*__MLIR_BLOCK_RETFLAG_269090723725312*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str361("*__MLIR_BLOCK_RETMVLIST_269090723725312*\00") : !llvm.array<41 x i8>
}
