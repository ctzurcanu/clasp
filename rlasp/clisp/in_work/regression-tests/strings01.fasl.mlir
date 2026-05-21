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
      %57 = arith.constant 14 : i64
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
      %74 = arith.constant 1 : i64
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
      func.call @stack_push_pointer(%83) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @cc_cons(%85, %84) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %87 = arith.addi %86, %__rlasp_stack_elide_zero_3 : i64
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @cc_cons(%88, %87) : (i64, i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @cc_cons(%91, %90) : (i64, i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %93 = llvm.mlir.addressof @str9 : !llvm.ptr
      %94 = arith.constant 7 : i64
      %95 = func.call @cc_make_string(%93, %94) : (!llvm.ptr, i64) -> i64
      %96 = llvm.mlir.addressof @str10 : !llvm.ptr
      %97 = arith.constant 11 : i64
      %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
      %99 = func.call @cc_intern(%95, %98) : (i64, i64) -> i64
      %100 = func.call @cc_nil_value() : () -> i64
      %101 = func.call @cc_cons(%99, %100) : (i64, i64) -> i64
      %102 = func.call @cc_values_pack(%101) : (i64) -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      %103 = llvm.mlir.addressof @str11 : !llvm.ptr
      %104 = arith.constant 1 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = func.call @cc_nil_value() : () -> i64
      %107 = func.call @cc_intern(%105, %106) : (i64, i64) -> i64
      %108 = func.call @cc_nil_value() : () -> i64
      %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
      %110 = func.call @cc_values_pack(%109) : (i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @cc_cons(%112, %111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %114 = arith.addi %113, %__rlasp_stack_elide_zero_4 : i64
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @cc_cons(%115, %114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %117 = func.call @stack_pop_pointer() : () -> i64
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @cc_cons(%118, %117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %120 = arith.addi %119, %__rlasp_stack_elide_zero_5 : i64
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @cc_cons(%121, %120) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %123 = arith.addi %122, %__rlasp_stack_elide_zero_6 : i64
      %124 = func.call @stack_pop_pointer() : () -> i64
      %125 = func.call @cc_cons(%124, %123) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %126 = arith.addi %125, %__rlasp_stack_elide_zero_7 : i64
      %144 = arith.constant 122791386939393 : i64
      %145 = arith.constant 0 : i64
      %146 = func.call @cc_make_closure(%144, %145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %147 = arith.addi %146, %__rlasp_stack_elide_zero_8 : i64
      %148 = llvm.mlir.addressof @str13 : !llvm.ptr
      %149 = arith.constant 3 : i64
      %150 = func.call @cc_make_string(%148, %149) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @cc_cons(%152, %151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %154 = arith.addi %153, %__rlasp_stack_elide_zero_9 : i64
      %155 = llvm.mlir.addressof @str14 : !llvm.ptr
      %156 = arith.constant 11 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = llvm.mlir.addressof @str15 : !llvm.ptr
      %159 = arith.constant 7 : i64
      %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
      %161 = func.call @cc_intern(%157, %160) : (i64, i64) -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_cons(%161, %162) : (i64, i64) -> i64
      %164 = func.call @cc_values_pack(%163) : (i64) -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      %166 = llvm.mlir.addressof @str16 : !llvm.ptr
      %167 = arith.constant 4 : i64
      %168 = func.call @cc_make_string(%166, %167) : (!llvm.ptr, i64) -> i64
      %169 = llvm.mlir.addressof @str17 : !llvm.ptr
      %170 = arith.constant 7 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      %172 = func.call @cc_intern(%168, %171) : (i64, i64) -> i64
      %173 = func.call @cc_nil_value() : () -> i64
      %174 = func.call @cc_cons(%172, %173) : (i64, i64) -> i64
      %175 = func.call @cc_values_pack(%174) : (i64) -> i64
      %176 = llvm.mlir.addressof @str18 : !llvm.ptr
      %177 = arith.constant 7 : i64
      %178 = func.call @cc_make_string(%176, %177) : (!llvm.ptr, i64) -> i64
      %179 = llvm.mlir.addressof @str19 : !llvm.ptr
      %180 = arith.constant 11 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = func.call @cc_intern(%178, %181) : (i64, i64) -> i64
      %183 = func.call @cc_nil_value() : () -> i64
      %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
      %185 = func.call @cc_values_pack(%184) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %186 = arith.addi %182, %__rlasp_stack_elide_zero_10 : i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_errorp(%64) : (i64) -> i64
      %189 = arith.cmpi ne, %188, %187 : i64
      %190 = arith.cmpi eq, %187, %187 : i64
      %191 = arith.andi %189, %190 : i1
      %192 = scf.if %191 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %187 : i64
      }
      %193 = func.call @cc_errorp(%126) : (i64) -> i64
      %194 = arith.cmpi ne, %193, %187 : i64
      %195 = arith.cmpi eq, %192, %187 : i64
      %196 = arith.andi %194, %195 : i1
      %197 = scf.if %196 -> (i64) {
        scf.yield %126 : i64
      } else {
        scf.yield %192 : i64
      }
      %198 = func.call @cc_errorp(%147) : (i64) -> i64
      %199 = arith.cmpi ne, %198, %187 : i64
      %200 = arith.cmpi eq, %197, %187 : i64
      %201 = arith.andi %199, %200 : i1
      %202 = scf.if %201 -> (i64) {
        scf.yield %147 : i64
      } else {
        scf.yield %197 : i64
      }
      %203 = func.call @cc_errorp(%154) : (i64) -> i64
      %204 = arith.cmpi ne, %203, %187 : i64
      %205 = arith.cmpi eq, %202, %187 : i64
      %206 = arith.andi %204, %205 : i1
      %207 = scf.if %206 -> (i64) {
        scf.yield %154 : i64
      } else {
        scf.yield %202 : i64
      }
      %208 = func.call @cc_errorp(%161) : (i64) -> i64
      %209 = arith.cmpi ne, %208, %187 : i64
      %210 = arith.cmpi eq, %207, %187 : i64
      %211 = arith.andi %209, %210 : i1
      %212 = scf.if %211 -> (i64) {
        scf.yield %161 : i64
      } else {
        scf.yield %207 : i64
      }
      %213 = func.call @cc_errorp(%165) : (i64) -> i64
      %214 = arith.cmpi ne, %213, %187 : i64
      %215 = arith.cmpi eq, %212, %187 : i64
      %216 = arith.andi %214, %215 : i1
      %217 = scf.if %216 -> (i64) {
        scf.yield %165 : i64
      } else {
        scf.yield %212 : i64
      }
      %218 = func.call @cc_errorp(%172) : (i64) -> i64
      %219 = arith.cmpi ne, %218, %187 : i64
      %220 = arith.cmpi eq, %217, %187 : i64
      %221 = arith.andi %219, %220 : i1
      %222 = scf.if %221 -> (i64) {
        scf.yield %172 : i64
      } else {
        scf.yield %217 : i64
      }
      %223 = func.call @cc_errorp(%186) : (i64) -> i64
      %224 = arith.cmpi ne, %223, %187 : i64
      %225 = arith.cmpi eq, %222, %187 : i64
      %226 = arith.andi %224, %225 : i1
      %227 = scf.if %226 -> (i64) {
        scf.yield %186 : i64
      } else {
        scf.yield %222 : i64
      }
      %228 = arith.cmpi ne, %227, %187 : i64
      scf.if %228 {
        func.call @stack_push_pointer(%227) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%126) : (i64) -> ()
        func.call @stack_push_pointer(%147) : (i64) -> ()
        func.call @stack_push_pointer(%154) : (i64) -> ()
        func.call @stack_push_pointer(%161) : (i64) -> ()
        func.call @stack_push_pointer(%165) : (i64) -> ()
        func.call @stack_push_pointer(%172) : (i64) -> ()
        func.call @stack_push_pointer(%186) : (i64) -> ()
        %229 = llvm.mlir.addressof @str20 : !llvm.ptr
        %230 = func.call @cc_make_function_ref_const(%229) : (!llvm.ptr) -> i64
        %231 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%230, %231) : (i64, i64) -> ()
      }
      %232 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %232 : i64
    }
    %233 = func.call @cc_nil_value() : () -> i64
    %234 = func.call @cc_errorp(%55) : (i64) -> i64
    %235 = arith.cmpi ne, %234, %233 : i64
    %236 = scf.if %235 -> (i64) {
      scf.yield %55 : i64
    } else {
      %237 = llvm.mlir.addressof @str21 : !llvm.ptr
      %238 = arith.constant 10 : i64
      %239 = func.call @cc_make_string(%237, %238) : (!llvm.ptr, i64) -> i64
      %240 = func.call @cc_nil_value() : () -> i64
      %241 = func.call @cc_intern(%239, %240) : (i64, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_cons(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_values_pack(%243) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %245 = arith.addi %241, %__rlasp_stack_elide_zero_11 : i64
      %246 = llvm.mlir.addressof @str22 : !llvm.ptr
      %247 = arith.constant 13 : i64
      %248 = func.call @cc_make_string(%246, %247) : (!llvm.ptr, i64) -> i64
      %249 = llvm.mlir.addressof @str23 : !llvm.ptr
      %250 = arith.constant 11 : i64
      %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
      %252 = func.call @cc_intern(%248, %251) : (i64, i64) -> i64
      %253 = func.call @cc_nil_value() : () -> i64
      %254 = func.call @cc_cons(%252, %253) : (i64, i64) -> i64
      %255 = func.call @cc_values_pack(%254) : (i64) -> i64
      func.call @stack_push_pointer(%252) : (i64) -> ()
      %256 = llvm.mlir.addressof @str24 : !llvm.ptr
      %257 = arith.constant 6 : i64
      %258 = func.call @cc_make_string(%256, %257) : (!llvm.ptr, i64) -> i64
      %259 = func.call @cc_nil_value() : () -> i64
      %260 = func.call @cc_intern(%258, %259) : (i64, i64) -> i64
      %261 = func.call @cc_nil_value() : () -> i64
      %262 = func.call @cc_cons(%260, %261) : (i64, i64) -> i64
      %263 = func.call @cc_values_pack(%262) : (i64) -> i64
      func.call @stack_push_pointer(%260) : (i64) -> ()
      %264 = llvm.mlir.addressof @str25 : !llvm.ptr
      %265 = arith.constant 19 : i64
      %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_intern(%266, %267) : (i64, i64) -> i64
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
      %271 = func.call @cc_values_pack(%270) : (i64) -> i64
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %272 = llvm.mlir.addressof @str26 : !llvm.ptr
      %273 = arith.constant 6 : i64
      %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
      %275 = llvm.mlir.addressof @str27 : !llvm.ptr
      %276 = arith.constant 11 : i64
      %277 = func.call @cc_make_string(%275, %276) : (!llvm.ptr, i64) -> i64
      %278 = func.call @cc_intern(%274, %277) : (i64, i64) -> i64
      %279 = func.call @cc_nil_value() : () -> i64
      %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
      %281 = func.call @cc_values_pack(%280) : (i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %282 = llvm.mlir.addressof @str28 : !llvm.ptr
      %283 = arith.constant 3 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      %285 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%285) : (i64) -> ()
      %286 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%286) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %287 = func.call @stack_pop_pointer() : () -> i64
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @cc_cons(%288, %287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %290 = arith.addi %289, %__rlasp_stack_elide_zero_12 : i64
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @cc_cons(%291, %290) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %293 = arith.addi %292, %__rlasp_stack_elide_zero_13 : i64
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @cc_cons(%294, %293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %296 = arith.addi %295, %__rlasp_stack_elide_zero_14 : i64
      %297 = func.call @stack_pop_pointer() : () -> i64
      %298 = func.call @cc_cons(%297, %296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %299 = func.call @stack_pop_pointer() : () -> i64
      %300 = func.call @stack_pop_pointer() : () -> i64
      %301 = func.call @cc_cons(%300, %299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %302 = arith.addi %301, %__rlasp_stack_elide_zero_15 : i64
      %303 = func.call @stack_pop_pointer() : () -> i64
      %304 = func.call @cc_cons(%303, %302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %305 = func.call @stack_pop_pointer() : () -> i64
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @cc_cons(%306, %305) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %308 = arith.addi %307, %__rlasp_stack_elide_zero_16 : i64
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @cc_cons(%309, %308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %311 = arith.addi %310, %__rlasp_stack_elide_zero_17 : i64
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_cons(%312, %311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = func.call @cc_cons(%315, %314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %317 = arith.addi %316, %__rlasp_stack_elide_zero_18 : i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%318, %317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %320 = arith.addi %319, %__rlasp_stack_elide_zero_19 : i64
      %373 = arith.constant 122791386939394 : i64
      %374 = arith.constant 0 : i64
      %375 = func.call @cc_make_closure(%373, %374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %376 = arith.addi %375, %__rlasp_stack_elide_zero_20 : i64
      %377 = llvm.mlir.addressof @str30 : !llvm.ptr
      %378 = arith.constant 4 : i64
      %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
      %380 = func.call @cc_nil_value() : () -> i64
      %381 = func.call @cc_intern(%379, %380) : (i64, i64) -> i64
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
      %384 = func.call @cc_values_pack(%383) : (i64) -> i64
      func.call @stack_push_pointer(%381) : (i64) -> ()
      %385 = llvm.mlir.addressof @str31 : !llvm.ptr
      %386 = arith.constant 5 : i64
      %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_intern(%387, %388) : (i64, i64) -> i64
      %390 = func.call @cc_nil_value() : () -> i64
      %391 = func.call @cc_cons(%389, %390) : (i64, i64) -> i64
      %392 = func.call @cc_values_pack(%391) : (i64) -> i64
      func.call @stack_push_pointer(%389) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %393 = func.call @stack_pop_pointer() : () -> i64
      %394 = func.call @stack_pop_pointer() : () -> i64
      %395 = func.call @cc_cons(%394, %393) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %396 = arith.addi %395, %__rlasp_stack_elide_zero_21 : i64
      %397 = func.call @stack_pop_pointer() : () -> i64
      %398 = func.call @cc_cons(%397, %396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %399 = arith.addi %398, %__rlasp_stack_elide_zero_22 : i64
      %400 = llvm.mlir.addressof @str32 : !llvm.ptr
      %401 = arith.constant 11 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = llvm.mlir.addressof @str33 : !llvm.ptr
      %404 = arith.constant 7 : i64
      %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
      %406 = func.call @cc_intern(%402, %405) : (i64, i64) -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
      %409 = func.call @cc_values_pack(%408) : (i64) -> i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = llvm.mlir.addressof @str34 : !llvm.ptr
      %412 = arith.constant 4 : i64
      %413 = func.call @cc_make_string(%411, %412) : (!llvm.ptr, i64) -> i64
      %414 = llvm.mlir.addressof @str35 : !llvm.ptr
      %415 = arith.constant 7 : i64
      %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
      %417 = func.call @cc_intern(%413, %416) : (i64, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
      %420 = func.call @cc_values_pack(%419) : (i64) -> i64
      %421 = llvm.mlir.addressof @str36 : !llvm.ptr
      %422 = arith.constant 5 : i64
      %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
      %424 = func.call @cc_nil_value() : () -> i64
      %425 = func.call @cc_intern(%423, %424) : (i64, i64) -> i64
      %426 = func.call @cc_nil_value() : () -> i64
      %427 = func.call @cc_cons(%425, %426) : (i64, i64) -> i64
      %428 = func.call @cc_values_pack(%427) : (i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %429 = arith.addi %425, %__rlasp_stack_elide_zero_23 : i64
      %430 = func.call @cc_nil_value() : () -> i64
      %431 = func.call @cc_errorp(%245) : (i64) -> i64
      %432 = arith.cmpi ne, %431, %430 : i64
      %433 = arith.cmpi eq, %430, %430 : i64
      %434 = arith.andi %432, %433 : i1
      %435 = scf.if %434 -> (i64) {
        scf.yield %245 : i64
      } else {
        scf.yield %430 : i64
      }
      %436 = func.call @cc_errorp(%320) : (i64) -> i64
      %437 = arith.cmpi ne, %436, %430 : i64
      %438 = arith.cmpi eq, %435, %430 : i64
      %439 = arith.andi %437, %438 : i1
      %440 = scf.if %439 -> (i64) {
        scf.yield %320 : i64
      } else {
        scf.yield %435 : i64
      }
      %441 = func.call @cc_errorp(%376) : (i64) -> i64
      %442 = arith.cmpi ne, %441, %430 : i64
      %443 = arith.cmpi eq, %440, %430 : i64
      %444 = arith.andi %442, %443 : i1
      %445 = scf.if %444 -> (i64) {
        scf.yield %376 : i64
      } else {
        scf.yield %440 : i64
      }
      %446 = func.call @cc_errorp(%399) : (i64) -> i64
      %447 = arith.cmpi ne, %446, %430 : i64
      %448 = arith.cmpi eq, %445, %430 : i64
      %449 = arith.andi %447, %448 : i1
      %450 = scf.if %449 -> (i64) {
        scf.yield %399 : i64
      } else {
        scf.yield %445 : i64
      }
      %451 = func.call @cc_errorp(%406) : (i64) -> i64
      %452 = arith.cmpi ne, %451, %430 : i64
      %453 = arith.cmpi eq, %450, %430 : i64
      %454 = arith.andi %452, %453 : i1
      %455 = scf.if %454 -> (i64) {
        scf.yield %406 : i64
      } else {
        scf.yield %450 : i64
      }
      %456 = func.call @cc_errorp(%410) : (i64) -> i64
      %457 = arith.cmpi ne, %456, %430 : i64
      %458 = arith.cmpi eq, %455, %430 : i64
      %459 = arith.andi %457, %458 : i1
      %460 = scf.if %459 -> (i64) {
        scf.yield %410 : i64
      } else {
        scf.yield %455 : i64
      }
      %461 = func.call @cc_errorp(%417) : (i64) -> i64
      %462 = arith.cmpi ne, %461, %430 : i64
      %463 = arith.cmpi eq, %460, %430 : i64
      %464 = arith.andi %462, %463 : i1
      %465 = scf.if %464 -> (i64) {
        scf.yield %417 : i64
      } else {
        scf.yield %460 : i64
      }
      %466 = func.call @cc_errorp(%429) : (i64) -> i64
      %467 = arith.cmpi ne, %466, %430 : i64
      %468 = arith.cmpi eq, %465, %430 : i64
      %469 = arith.andi %467, %468 : i1
      %470 = scf.if %469 -> (i64) {
        scf.yield %429 : i64
      } else {
        scf.yield %465 : i64
      }
      %471 = arith.cmpi ne, %470, %430 : i64
      scf.if %471 {
        func.call @stack_push_pointer(%470) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%245) : (i64) -> ()
        func.call @stack_push_pointer(%320) : (i64) -> ()
        func.call @stack_push_pointer(%376) : (i64) -> ()
        func.call @stack_push_pointer(%399) : (i64) -> ()
        func.call @stack_push_pointer(%406) : (i64) -> ()
        func.call @stack_push_pointer(%410) : (i64) -> ()
        func.call @stack_push_pointer(%417) : (i64) -> ()
        func.call @stack_push_pointer(%429) : (i64) -> ()
        %472 = llvm.mlir.addressof @str37 : !llvm.ptr
        %473 = func.call @cc_make_function_ref_const(%472) : (!llvm.ptr) -> i64
        %474 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%473, %474) : (i64, i64) -> ()
      }
      %475 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %475 : i64
    }
    %476 = func.call @cc_nil_value() : () -> i64
    %477 = func.call @cc_errorp(%236) : (i64) -> i64
    %478 = arith.cmpi ne, %477, %476 : i64
    %479 = scf.if %478 -> (i64) {
      scf.yield %236 : i64
    } else {
      %480 = llvm.mlir.addressof @str38 : !llvm.ptr
      %481 = arith.constant 17 : i64
      %482 = func.call @cc_make_string(%480, %481) : (!llvm.ptr, i64) -> i64
      %483 = func.call @cc_nil_value() : () -> i64
      %484 = func.call @cc_intern(%482, %483) : (i64, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_cons(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_values_pack(%486) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %488 = arith.addi %484, %__rlasp_stack_elide_zero_24 : i64
      %489 = llvm.mlir.addressof @str39 : !llvm.ptr
      %490 = arith.constant 10 : i64
      %491 = func.call @cc_make_string(%489, %490) : (!llvm.ptr, i64) -> i64
      %492 = llvm.mlir.addressof @str40 : !llvm.ptr
      %493 = arith.constant 11 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = func.call @cc_intern(%491, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %499 = arith.constant 97 : i64
      %500 = func.call @cc_box_character(%499) : (i64) -> i64
      func.call @stack_push_pointer(%500) : (i64) -> ()
      %501 = arith.constant 0 : i64
      %502 = func.call @cc_box_character(%501) : (i64) -> i64
      func.call @stack_push_pointer(%502) : (i64) -> ()
      %503 = llvm.mlir.addressof @str41 : !llvm.ptr
      %504 = arith.constant 15 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = llvm.mlir.addressof @str42 : !llvm.ptr
      %507 = arith.constant 11 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_intern(%505, %508) : (i64, i64) -> i64
      %510 = func.call @cc_nil_value() : () -> i64
      %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
      %512 = func.call @cc_values_pack(%511) : (i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %513 = llvm.mlir.addressof @str43 : !llvm.ptr
      %514 = arith.constant 11 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = llvm.mlir.addressof @str44 : !llvm.ptr
      %517 = arith.constant 11 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = func.call @cc_intern(%515, %518) : (i64, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_values_pack(%521) : (i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %523 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%523) : (i64) -> ()
      %524 = llvm.mlir.addressof @str45 : !llvm.ptr
      %525 = arith.constant 15 : i64
      %526 = func.call @cc_make_string(%524, %525) : (!llvm.ptr, i64) -> i64
      %527 = llvm.mlir.addressof @str46 : !llvm.ptr
      %528 = arith.constant 7 : i64
      %529 = func.call @cc_make_string(%527, %528) : (!llvm.ptr, i64) -> i64
      %530 = func.call @cc_intern(%526, %529) : (i64, i64) -> i64
      %531 = func.call @cc_nil_value() : () -> i64
      %532 = func.call @cc_cons(%530, %531) : (i64, i64) -> i64
      %533 = func.call @cc_values_pack(%532) : (i64) -> i64
      func.call @stack_push_pointer(%530) : (i64) -> ()
      %534 = arith.constant 0 : i64
      %535 = func.call @cc_box_character(%534) : (i64) -> i64
      func.call @stack_push_pointer(%535) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = func.call @stack_pop_pointer() : () -> i64
      %538 = func.call @cc_cons(%537, %536) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %539 = arith.addi %538, %__rlasp_stack_elide_zero_25 : i64
      %540 = func.call @stack_pop_pointer() : () -> i64
      %541 = func.call @cc_cons(%540, %539) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %542 = arith.addi %541, %__rlasp_stack_elide_zero_26 : i64
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = func.call @cc_cons(%543, %542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %545 = arith.addi %544, %__rlasp_stack_elide_zero_27 : i64
      %546 = func.call @stack_pop_pointer() : () -> i64
      %547 = func.call @cc_cons(%546, %545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%547) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @stack_pop_pointer() : () -> i64
      %550 = func.call @cc_cons(%549, %548) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %551 = arith.addi %550, %__rlasp_stack_elide_zero_28 : i64
      %552 = func.call @stack_pop_pointer() : () -> i64
      %553 = func.call @cc_cons(%552, %551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%553) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = func.call @cc_cons(%555, %554) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %557 = arith.addi %556, %__rlasp_stack_elide_zero_29 : i64
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @cc_cons(%558, %557) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %560 = arith.addi %559, %__rlasp_stack_elide_zero_30 : i64
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @cc_cons(%561, %560) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %563 = arith.addi %562, %__rlasp_stack_elide_zero_31 : i64
      %564 = func.call @stack_pop_pointer() : () -> i64
      %565 = func.call @cc_cons(%564, %563) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %566 = arith.addi %565, %__rlasp_stack_elide_zero_32 : i64
      %591 = arith.constant 122791386939395 : i64
      %592 = arith.constant 0 : i64
      %593 = func.call @cc_make_closure(%591, %592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %594 = arith.addi %593, %__rlasp_stack_elide_zero_33 : i64
      %595 = llvm.mlir.addressof @str48 : !llvm.ptr
      %596 = arith.constant 5 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = func.call @stack_pop_pointer() : () -> i64
      %600 = func.call @cc_cons(%599, %598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %601 = arith.addi %600, %__rlasp_stack_elide_zero_34 : i64
      %602 = llvm.mlir.addressof @str49 : !llvm.ptr
      %603 = arith.constant 11 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = llvm.mlir.addressof @str50 : !llvm.ptr
      %606 = arith.constant 7 : i64
      %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
      %608 = func.call @cc_intern(%604, %607) : (i64, i64) -> i64
      %609 = func.call @cc_nil_value() : () -> i64
      %610 = func.call @cc_cons(%608, %609) : (i64, i64) -> i64
      %611 = func.call @cc_values_pack(%610) : (i64) -> i64
      %612 = func.call @cc_nil_value() : () -> i64
      %613 = llvm.mlir.addressof @str51 : !llvm.ptr
      %614 = arith.constant 4 : i64
      %615 = func.call @cc_make_string(%613, %614) : (!llvm.ptr, i64) -> i64
      %616 = llvm.mlir.addressof @str52 : !llvm.ptr
      %617 = arith.constant 7 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = func.call @cc_intern(%615, %618) : (i64, i64) -> i64
      %620 = func.call @cc_nil_value() : () -> i64
      %621 = func.call @cc_cons(%619, %620) : (i64, i64) -> i64
      %622 = func.call @cc_values_pack(%621) : (i64) -> i64
      %623 = llvm.mlir.addressof @str53 : !llvm.ptr
      %624 = arith.constant 7 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = llvm.mlir.addressof @str54 : !llvm.ptr
      %627 = arith.constant 11 : i64
      %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
      %629 = func.call @cc_intern(%625, %628) : (i64, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_values_pack(%631) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %633 = arith.addi %629, %__rlasp_stack_elide_zero_35 : i64
      %634 = func.call @cc_nil_value() : () -> i64
      %635 = func.call @cc_errorp(%488) : (i64) -> i64
      %636 = arith.cmpi ne, %635, %634 : i64
      %637 = arith.cmpi eq, %634, %634 : i64
      %638 = arith.andi %636, %637 : i1
      %639 = scf.if %638 -> (i64) {
        scf.yield %488 : i64
      } else {
        scf.yield %634 : i64
      }
      %640 = func.call @cc_errorp(%566) : (i64) -> i64
      %641 = arith.cmpi ne, %640, %634 : i64
      %642 = arith.cmpi eq, %639, %634 : i64
      %643 = arith.andi %641, %642 : i1
      %644 = scf.if %643 -> (i64) {
        scf.yield %566 : i64
      } else {
        scf.yield %639 : i64
      }
      %645 = func.call @cc_errorp(%594) : (i64) -> i64
      %646 = arith.cmpi ne, %645, %634 : i64
      %647 = arith.cmpi eq, %644, %634 : i64
      %648 = arith.andi %646, %647 : i1
      %649 = scf.if %648 -> (i64) {
        scf.yield %594 : i64
      } else {
        scf.yield %644 : i64
      }
      %650 = func.call @cc_errorp(%601) : (i64) -> i64
      %651 = arith.cmpi ne, %650, %634 : i64
      %652 = arith.cmpi eq, %649, %634 : i64
      %653 = arith.andi %651, %652 : i1
      %654 = scf.if %653 -> (i64) {
        scf.yield %601 : i64
      } else {
        scf.yield %649 : i64
      }
      %655 = func.call @cc_errorp(%608) : (i64) -> i64
      %656 = arith.cmpi ne, %655, %634 : i64
      %657 = arith.cmpi eq, %654, %634 : i64
      %658 = arith.andi %656, %657 : i1
      %659 = scf.if %658 -> (i64) {
        scf.yield %608 : i64
      } else {
        scf.yield %654 : i64
      }
      %660 = func.call @cc_errorp(%612) : (i64) -> i64
      %661 = arith.cmpi ne, %660, %634 : i64
      %662 = arith.cmpi eq, %659, %634 : i64
      %663 = arith.andi %661, %662 : i1
      %664 = scf.if %663 -> (i64) {
        scf.yield %612 : i64
      } else {
        scf.yield %659 : i64
      }
      %665 = func.call @cc_errorp(%619) : (i64) -> i64
      %666 = arith.cmpi ne, %665, %634 : i64
      %667 = arith.cmpi eq, %664, %634 : i64
      %668 = arith.andi %666, %667 : i1
      %669 = scf.if %668 -> (i64) {
        scf.yield %619 : i64
      } else {
        scf.yield %664 : i64
      }
      %670 = func.call @cc_errorp(%633) : (i64) -> i64
      %671 = arith.cmpi ne, %670, %634 : i64
      %672 = arith.cmpi eq, %669, %634 : i64
      %673 = arith.andi %671, %672 : i1
      %674 = scf.if %673 -> (i64) {
        scf.yield %633 : i64
      } else {
        scf.yield %669 : i64
      }
      %675 = arith.cmpi ne, %674, %634 : i64
      scf.if %675 {
        func.call @stack_push_pointer(%674) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%488) : (i64) -> ()
        func.call @stack_push_pointer(%566) : (i64) -> ()
        func.call @stack_push_pointer(%594) : (i64) -> ()
        func.call @stack_push_pointer(%601) : (i64) -> ()
        func.call @stack_push_pointer(%608) : (i64) -> ()
        func.call @stack_push_pointer(%612) : (i64) -> ()
        func.call @stack_push_pointer(%619) : (i64) -> ()
        func.call @stack_push_pointer(%633) : (i64) -> ()
        %676 = llvm.mlir.addressof @str55 : !llvm.ptr
        %677 = func.call @cc_make_function_ref_const(%676) : (!llvm.ptr) -> i64
        %678 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%677, %678) : (i64, i64) -> ()
      }
      %679 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %679 : i64
    }
    %680 = func.call @cc_nil_value() : () -> i64
    %681 = func.call @cc_errorp(%479) : (i64) -> i64
    %682 = arith.cmpi ne, %681, %680 : i64
    %683 = scf.if %682 -> (i64) {
      scf.yield %479 : i64
    } else {
      %684 = llvm.mlir.addressof @str56 : !llvm.ptr
      %685 = arith.constant 17 : i64
      %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
      %687 = func.call @cc_nil_value() : () -> i64
      %688 = func.call @cc_intern(%686, %687) : (i64, i64) -> i64
      %689 = func.call @cc_nil_value() : () -> i64
      %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
      %691 = func.call @cc_values_pack(%690) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %692 = arith.addi %688, %__rlasp_stack_elide_zero_36 : i64
      %693 = llvm.mlir.addressof @str57 : !llvm.ptr
      %694 = arith.constant 10 : i64
      %695 = func.call @cc_make_string(%693, %694) : (!llvm.ptr, i64) -> i64
      %696 = llvm.mlir.addressof @str58 : !llvm.ptr
      %697 = arith.constant 11 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = func.call @cc_intern(%695, %698) : (i64, i64) -> i64
      %700 = func.call @cc_nil_value() : () -> i64
      %701 = func.call @cc_cons(%699, %700) : (i64, i64) -> i64
      %702 = func.call @cc_values_pack(%701) : (i64) -> i64
      func.call @stack_push_pointer(%699) : (i64) -> ()
      %703 = arith.constant 88 : i64
      %704 = func.call @cc_box_character(%703) : (i64) -> i64
      func.call @stack_push_pointer(%704) : (i64) -> ()
      %705 = arith.constant 0 : i64
      %706 = func.call @cc_box_character(%705) : (i64) -> i64
      func.call @stack_push_pointer(%706) : (i64) -> ()
      %707 = llvm.mlir.addressof @str59 : !llvm.ptr
      %708 = arith.constant 21 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = llvm.mlir.addressof @str60 : !llvm.ptr
      %711 = arith.constant 11 : i64
      %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
      %713 = func.call @cc_intern(%709, %712) : (i64, i64) -> i64
      %714 = func.call @cc_nil_value() : () -> i64
      %715 = func.call @cc_cons(%713, %714) : (i64, i64) -> i64
      %716 = func.call @cc_values_pack(%715) : (i64) -> i64
      func.call @stack_push_pointer(%713) : (i64) -> ()
      %717 = llvm.mlir.addressof @str61 : !llvm.ptr
      %718 = arith.constant 3 : i64
      %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_intern(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_values_pack(%723) : (i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @cc_cons(%726, %725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%727) : (i64) -> ()
      %728 = llvm.mlir.addressof @str62 : !llvm.ptr
      %729 = arith.constant 10 : i64
      %730 = func.call @cc_make_string(%728, %729) : (!llvm.ptr, i64) -> i64
      %731 = llvm.mlir.addressof @str63 : !llvm.ptr
      %732 = arith.constant 11 : i64
      %733 = func.call @cc_make_string(%731, %732) : (!llvm.ptr, i64) -> i64
      %734 = func.call @cc_intern(%730, %733) : (i64, i64) -> i64
      %735 = func.call @cc_nil_value() : () -> i64
      %736 = func.call @cc_cons(%734, %735) : (i64, i64) -> i64
      %737 = func.call @cc_values_pack(%736) : (i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %738 = arith.constant 0 : i64
      %739 = func.call @cc_box_character(%738) : (i64) -> i64
      func.call @stack_push_pointer(%739) : (i64) -> ()
      %740 = llvm.mlir.addressof @str64 : !llvm.ptr
      %741 = arith.constant 3 : i64
      %742 = func.call @cc_make_string(%740, %741) : (!llvm.ptr, i64) -> i64
      %743 = func.call @cc_nil_value() : () -> i64
      %744 = func.call @cc_intern(%742, %743) : (i64, i64) -> i64
      %745 = func.call @cc_nil_value() : () -> i64
      %746 = func.call @cc_cons(%744, %745) : (i64, i64) -> i64
      %747 = func.call @cc_values_pack(%746) : (i64) -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %751 = arith.addi %750, %__rlasp_stack_elide_zero_37 : i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %754 = arith.addi %753, %__rlasp_stack_elide_zero_38 : i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      %757 = llvm.mlir.addressof @str65 : !llvm.ptr
      %758 = arith.constant 5 : i64
      %759 = func.call @cc_make_string(%757, %758) : (!llvm.ptr, i64) -> i64
      %760 = llvm.mlir.addressof @str66 : !llvm.ptr
      %761 = arith.constant 11 : i64
      %762 = func.call @cc_make_string(%760, %761) : (!llvm.ptr, i64) -> i64
      %763 = func.call @cc_intern(%759, %762) : (i64, i64) -> i64
      %764 = func.call @cc_nil_value() : () -> i64
      %765 = func.call @cc_cons(%763, %764) : (i64, i64) -> i64
      %766 = func.call @cc_values_pack(%765) : (i64) -> i64
      func.call @stack_push_pointer(%763) : (i64) -> ()
      %767 = llvm.mlir.addressof @str67 : !llvm.ptr
      %768 = arith.constant 3 : i64
      %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%769) : (i64) -> ()
      %770 = llvm.mlir.addressof @str68 : !llvm.ptr
      %771 = arith.constant 3 : i64
      %772 = func.call @cc_make_string(%770, %771) : (!llvm.ptr, i64) -> i64
      %773 = func.call @cc_nil_value() : () -> i64
      %774 = func.call @cc_intern(%772, %773) : (i64, i64) -> i64
      %775 = func.call @cc_nil_value() : () -> i64
      %776 = func.call @cc_cons(%774, %775) : (i64, i64) -> i64
      %777 = func.call @cc_values_pack(%776) : (i64) -> i64
      func.call @stack_push_pointer(%774) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @cc_cons(%779, %778) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %781 = arith.addi %780, %__rlasp_stack_elide_zero_39 : i64
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = func.call @cc_cons(%782, %781) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %784 = arith.addi %783, %__rlasp_stack_elide_zero_40 : i64
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @cc_cons(%785, %784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %790 = arith.addi %789, %__rlasp_stack_elide_zero_41 : i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %793 = arith.addi %792, %__rlasp_stack_elide_zero_42 : i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%794, %793) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %796 = arith.addi %795, %__rlasp_stack_elide_zero_43 : i64
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @cc_cons(%797, %796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @cc_cons(%800, %799) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %802 = arith.addi %801, %__rlasp_stack_elide_zero_44 : i64
      %803 = func.call @stack_pop_pointer() : () -> i64
      %804 = func.call @cc_cons(%803, %802) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %805 = arith.addi %804, %__rlasp_stack_elide_zero_45 : i64
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = func.call @cc_cons(%806, %805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %808 = arith.addi %807, %__rlasp_stack_elide_zero_46 : i64
      %809 = func.call @stack_pop_pointer() : () -> i64
      %810 = func.call @cc_cons(%809, %808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %811 = arith.addi %810, %__rlasp_stack_elide_zero_47 : i64
      %873 = arith.constant 122791386939396 : i64
      %874 = arith.constant 0 : i64
      %875 = func.call @cc_make_closure(%873, %874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %876 = arith.addi %875, %__rlasp_stack_elide_zero_48 : i64
      %877 = llvm.mlir.addressof @str72 : !llvm.ptr
      %878 = arith.constant 4 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %880 = func.call @stack_pop_pointer() : () -> i64
      %881 = func.call @stack_pop_pointer() : () -> i64
      %882 = func.call @cc_cons(%881, %880) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %883 = arith.addi %882, %__rlasp_stack_elide_zero_49 : i64
      %884 = llvm.mlir.addressof @str73 : !llvm.ptr
      %885 = arith.constant 11 : i64
      %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
      %887 = llvm.mlir.addressof @str74 : !llvm.ptr
      %888 = arith.constant 7 : i64
      %889 = func.call @cc_make_string(%887, %888) : (!llvm.ptr, i64) -> i64
      %890 = func.call @cc_intern(%886, %889) : (i64, i64) -> i64
      %891 = func.call @cc_nil_value() : () -> i64
      %892 = func.call @cc_cons(%890, %891) : (i64, i64) -> i64
      %893 = func.call @cc_values_pack(%892) : (i64) -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = llvm.mlir.addressof @str75 : !llvm.ptr
      %896 = arith.constant 4 : i64
      %897 = func.call @cc_make_string(%895, %896) : (!llvm.ptr, i64) -> i64
      %898 = llvm.mlir.addressof @str76 : !llvm.ptr
      %899 = arith.constant 7 : i64
      %900 = func.call @cc_make_string(%898, %899) : (!llvm.ptr, i64) -> i64
      %901 = func.call @cc_intern(%897, %900) : (i64, i64) -> i64
      %902 = func.call @cc_nil_value() : () -> i64
      %903 = func.call @cc_cons(%901, %902) : (i64, i64) -> i64
      %904 = func.call @cc_values_pack(%903) : (i64) -> i64
      %905 = llvm.mlir.addressof @str77 : !llvm.ptr
      %906 = arith.constant 7 : i64
      %907 = func.call @cc_make_string(%905, %906) : (!llvm.ptr, i64) -> i64
      %908 = llvm.mlir.addressof @str78 : !llvm.ptr
      %909 = arith.constant 11 : i64
      %910 = func.call @cc_make_string(%908, %909) : (!llvm.ptr, i64) -> i64
      %911 = func.call @cc_intern(%907, %910) : (i64, i64) -> i64
      %912 = func.call @cc_nil_value() : () -> i64
      %913 = func.call @cc_cons(%911, %912) : (i64, i64) -> i64
      %914 = func.call @cc_values_pack(%913) : (i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %915 = arith.addi %911, %__rlasp_stack_elide_zero_50 : i64
      %916 = func.call @cc_nil_value() : () -> i64
      %917 = func.call @cc_errorp(%692) : (i64) -> i64
      %918 = arith.cmpi ne, %917, %916 : i64
      %919 = arith.cmpi eq, %916, %916 : i64
      %920 = arith.andi %918, %919 : i1
      %921 = scf.if %920 -> (i64) {
        scf.yield %692 : i64
      } else {
        scf.yield %916 : i64
      }
      %922 = func.call @cc_errorp(%811) : (i64) -> i64
      %923 = arith.cmpi ne, %922, %916 : i64
      %924 = arith.cmpi eq, %921, %916 : i64
      %925 = arith.andi %923, %924 : i1
      %926 = scf.if %925 -> (i64) {
        scf.yield %811 : i64
      } else {
        scf.yield %921 : i64
      }
      %927 = func.call @cc_errorp(%876) : (i64) -> i64
      %928 = arith.cmpi ne, %927, %916 : i64
      %929 = arith.cmpi eq, %926, %916 : i64
      %930 = arith.andi %928, %929 : i1
      %931 = scf.if %930 -> (i64) {
        scf.yield %876 : i64
      } else {
        scf.yield %926 : i64
      }
      %932 = func.call @cc_errorp(%883) : (i64) -> i64
      %933 = arith.cmpi ne, %932, %916 : i64
      %934 = arith.cmpi eq, %931, %916 : i64
      %935 = arith.andi %933, %934 : i1
      %936 = scf.if %935 -> (i64) {
        scf.yield %883 : i64
      } else {
        scf.yield %931 : i64
      }
      %937 = func.call @cc_errorp(%890) : (i64) -> i64
      %938 = arith.cmpi ne, %937, %916 : i64
      %939 = arith.cmpi eq, %936, %916 : i64
      %940 = arith.andi %938, %939 : i1
      %941 = scf.if %940 -> (i64) {
        scf.yield %890 : i64
      } else {
        scf.yield %936 : i64
      }
      %942 = func.call @cc_errorp(%894) : (i64) -> i64
      %943 = arith.cmpi ne, %942, %916 : i64
      %944 = arith.cmpi eq, %941, %916 : i64
      %945 = arith.andi %943, %944 : i1
      %946 = scf.if %945 -> (i64) {
        scf.yield %894 : i64
      } else {
        scf.yield %941 : i64
      }
      %947 = func.call @cc_errorp(%901) : (i64) -> i64
      %948 = arith.cmpi ne, %947, %916 : i64
      %949 = arith.cmpi eq, %946, %916 : i64
      %950 = arith.andi %948, %949 : i1
      %951 = scf.if %950 -> (i64) {
        scf.yield %901 : i64
      } else {
        scf.yield %946 : i64
      }
      %952 = func.call @cc_errorp(%915) : (i64) -> i64
      %953 = arith.cmpi ne, %952, %916 : i64
      %954 = arith.cmpi eq, %951, %916 : i64
      %955 = arith.andi %953, %954 : i1
      %956 = scf.if %955 -> (i64) {
        scf.yield %915 : i64
      } else {
        scf.yield %951 : i64
      }
      %957 = arith.cmpi ne, %956, %916 : i64
      scf.if %957 {
        func.call @stack_push_pointer(%956) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%692) : (i64) -> ()
        func.call @stack_push_pointer(%811) : (i64) -> ()
        func.call @stack_push_pointer(%876) : (i64) -> ()
        func.call @stack_push_pointer(%883) : (i64) -> ()
        func.call @stack_push_pointer(%890) : (i64) -> ()
        func.call @stack_push_pointer(%894) : (i64) -> ()
        func.call @stack_push_pointer(%901) : (i64) -> ()
        func.call @stack_push_pointer(%915) : (i64) -> ()
        %958 = llvm.mlir.addressof @str79 : !llvm.ptr
        %959 = func.call @cc_make_function_ref_const(%958) : (!llvm.ptr) -> i64
        %960 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%959, %960) : (i64, i64) -> ()
      }
      %961 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %961 : i64
    }
    %962 = func.call @cc_nil_value() : () -> i64
    %963 = func.call @cc_errorp(%683) : (i64) -> i64
    %964 = arith.cmpi ne, %963, %962 : i64
    %965 = scf.if %964 -> (i64) {
      scf.yield %683 : i64
    } else {
      %966 = llvm.mlir.addressof @str80 : !llvm.ptr
      %967 = arith.constant 21 : i64
      %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
      %969 = func.call @cc_nil_value() : () -> i64
      %970 = func.call @cc_intern(%968, %969) : (i64, i64) -> i64
      %971 = func.call @cc_nil_value() : () -> i64
      %972 = func.call @cc_cons(%970, %971) : (i64, i64) -> i64
      %973 = func.call @cc_values_pack(%972) : (i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %974 = arith.addi %970, %__rlasp_stack_elide_zero_51 : i64
      %975 = llvm.mlir.addressof @str81 : !llvm.ptr
      %976 = arith.constant 3 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = func.call @cc_nil_value() : () -> i64
      %979 = func.call @cc_intern(%977, %978) : (i64, i64) -> i64
      %980 = func.call @cc_nil_value() : () -> i64
      %981 = func.call @cc_cons(%979, %980) : (i64, i64) -> i64
      %982 = func.call @cc_values_pack(%981) : (i64) -> i64
      func.call @stack_push_pointer(%979) : (i64) -> ()
      %983 = llvm.mlir.addressof @str82 : !llvm.ptr
      %984 = arith.constant 3 : i64
      %985 = func.call @cc_make_string(%983, %984) : (!llvm.ptr, i64) -> i64
      %986 = func.call @cc_nil_value() : () -> i64
      %987 = func.call @cc_intern(%985, %986) : (i64, i64) -> i64
      %988 = func.call @cc_nil_value() : () -> i64
      %989 = func.call @cc_cons(%987, %988) : (i64, i64) -> i64
      %990 = func.call @cc_values_pack(%989) : (i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      %991 = llvm.mlir.addressof @str83 : !llvm.ptr
      %992 = arith.constant 11 : i64
      %993 = func.call @cc_make_string(%991, %992) : (!llvm.ptr, i64) -> i64
      %994 = llvm.mlir.addressof @str84 : !llvm.ptr
      %995 = arith.constant 11 : i64
      %996 = func.call @cc_make_string(%994, %995) : (!llvm.ptr, i64) -> i64
      %997 = func.call @cc_intern(%993, %996) : (i64, i64) -> i64
      %998 = func.call @cc_nil_value() : () -> i64
      %999 = func.call @cc_cons(%997, %998) : (i64, i64) -> i64
      %1000 = func.call @cc_values_pack(%999) : (i64) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %1001 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1001) : (i64) -> ()
      %1002 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1003 = arith.constant 6 : i64
      %1004 = func.call @cc_make_string(%1002, %1003) : (!llvm.ptr, i64) -> i64
      %1005 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1006 = arith.constant 11 : i64
      %1007 = func.call @cc_make_string(%1005, %1006) : (!llvm.ptr, i64) -> i64
      %1008 = func.call @cc_intern(%1004, %1007) : (i64, i64) -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_cons(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_values_pack(%1010) : (i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1012 = arith.addi %1008, %__rlasp_stack_elide_zero_52 : i64
      %1013 = func.call @stack_pop_pointer() : () -> i64
      %1014 = func.call @cc_cons(%1012, %1013) : (i64, i64) -> i64
      %1015 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1016 = arith.constant 5 : i64
      %1017 = func.call @cc_make_string(%1015, %1016) : (!llvm.ptr, i64) -> i64
      %1018 = func.call @cc_nil_value() : () -> i64
      %1019 = func.call @cc_intern(%1017, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      %1023 = func.call @cc_cons(%1019, %1014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1023) : (i64) -> ()
      %1024 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1025 = arith.constant 11 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1028 = arith.constant 11 : i64
      %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
      %1030 = func.call @cc_intern(%1026, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_nil_value() : () -> i64
      %1032 = func.call @cc_cons(%1030, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_values_pack(%1032) : (i64) -> i64
      func.call @stack_push_pointer(%1030) : (i64) -> ()
      %1034 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1034) : (i64) -> ()
      %1035 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1036 = arith.constant 15 : i64
      %1037 = func.call @cc_make_string(%1035, %1036) : (!llvm.ptr, i64) -> i64
      %1038 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1039 = arith.constant 7 : i64
      %1040 = func.call @cc_make_string(%1038, %1039) : (!llvm.ptr, i64) -> i64
      %1041 = func.call @cc_intern(%1037, %1040) : (i64, i64) -> i64
      %1042 = func.call @cc_nil_value() : () -> i64
      %1043 = func.call @cc_cons(%1041, %1042) : (i64, i64) -> i64
      %1044 = func.call @cc_values_pack(%1043) : (i64) -> i64
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      %1045 = arith.constant 0 : i64
      %1046 = func.call @cc_box_character(%1045) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @cc_cons(%1048, %1047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1050 = arith.addi %1049, %__rlasp_stack_elide_zero_53 : i64
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_cons(%1051, %1050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1053 = arith.addi %1052, %__rlasp_stack_elide_zero_54 : i64
      %1054 = func.call @stack_pop_pointer() : () -> i64
      %1055 = func.call @cc_cons(%1054, %1053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1056 = arith.addi %1055, %__rlasp_stack_elide_zero_55 : i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1057, %1056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1058) : (i64) -> ()
      %1059 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1060 = arith.constant 3 : i64
      %1061 = func.call @cc_make_string(%1059, %1060) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1065 = arith.addi %1064, %__rlasp_stack_elide_zero_56 : i64
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @cc_cons(%1066, %1065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1068 = arith.addi %1067, %__rlasp_stack_elide_zero_57 : i64
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @cc_cons(%1069, %1068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1071 = arith.addi %1070, %__rlasp_stack_elide_zero_58 : i64
      %1072 = func.call @stack_pop_pointer() : () -> i64
      %1073 = func.call @cc_cons(%1072, %1071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1073) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @stack_pop_pointer() : () -> i64
      %1076 = func.call @cc_cons(%1075, %1074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1077 = arith.addi %1076, %__rlasp_stack_elide_zero_59 : i64
      %1078 = func.call @stack_pop_pointer() : () -> i64
      %1079 = func.call @cc_cons(%1078, %1077) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1080 = func.call @stack_pop_pointer() : () -> i64
      %1081 = func.call @stack_pop_pointer() : () -> i64
      %1082 = func.call @cc_cons(%1081, %1080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1083 = arith.addi %1082, %__rlasp_stack_elide_zero_60 : i64
      %1084 = func.call @stack_pop_pointer() : () -> i64
      %1085 = func.call @cc_cons(%1084, %1083) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1086 = arith.addi %1085, %__rlasp_stack_elide_zero_61 : i64
      %1127 = arith.constant 122791386939397 : i64
      %1128 = arith.constant 0 : i64
      %1129 = func.call @cc_make_closure(%1127, %1128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1130 = arith.addi %1129, %__rlasp_stack_elide_zero_62 : i64
      %1131 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1132 = arith.constant 1 : i64
      %1133 = func.call @cc_make_string(%1131, %1132) : (!llvm.ptr, i64) -> i64
      %1134 = func.call @cc_nil_value() : () -> i64
      %1135 = func.call @cc_intern(%1133, %1134) : (i64, i64) -> i64
      %1136 = func.call @cc_nil_value() : () -> i64
      %1137 = func.call @cc_cons(%1135, %1136) : (i64, i64) -> i64
      %1138 = func.call @cc_values_pack(%1137) : (i64) -> i64
      func.call @stack_push_pointer(%1135) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @stack_pop_pointer() : () -> i64
      %1141 = func.call @cc_cons(%1140, %1139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1142 = arith.addi %1141, %__rlasp_stack_elide_zero_63 : i64
      %1143 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1144 = arith.constant 11 : i64
      %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
      %1146 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1147 = arith.constant 7 : i64
      %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
      %1149 = func.call @cc_intern(%1145, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_nil_value() : () -> i64
      %1151 = func.call @cc_cons(%1149, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_values_pack(%1151) : (i64) -> i64
      %1153 = func.call @cc_nil_value() : () -> i64
      %1154 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1155 = arith.constant 4 : i64
      %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
      %1157 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1158 = arith.constant 7 : i64
      %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
      %1160 = func.call @cc_intern(%1156, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_nil_value() : () -> i64
      %1162 = func.call @cc_cons(%1160, %1161) : (i64, i64) -> i64
      %1163 = func.call @cc_values_pack(%1162) : (i64) -> i64
      %1164 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1165 = arith.constant 6 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = func.call @cc_nil_value() : () -> i64
      %1168 = func.call @cc_intern(%1166, %1167) : (i64, i64) -> i64
      %1169 = func.call @cc_nil_value() : () -> i64
      %1170 = func.call @cc_cons(%1168, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_values_pack(%1170) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1172 = arith.addi %1168, %__rlasp_stack_elide_zero_64 : i64
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_errorp(%974) : (i64) -> i64
      %1175 = arith.cmpi ne, %1174, %1173 : i64
      %1176 = arith.cmpi eq, %1173, %1173 : i64
      %1177 = arith.andi %1175, %1176 : i1
      %1178 = scf.if %1177 -> (i64) {
        scf.yield %974 : i64
      } else {
        scf.yield %1173 : i64
      }
      %1179 = func.call @cc_errorp(%1086) : (i64) -> i64
      %1180 = arith.cmpi ne, %1179, %1173 : i64
      %1181 = arith.cmpi eq, %1178, %1173 : i64
      %1182 = arith.andi %1180, %1181 : i1
      %1183 = scf.if %1182 -> (i64) {
        scf.yield %1086 : i64
      } else {
        scf.yield %1178 : i64
      }
      %1184 = func.call @cc_errorp(%1130) : (i64) -> i64
      %1185 = arith.cmpi ne, %1184, %1173 : i64
      %1186 = arith.cmpi eq, %1183, %1173 : i64
      %1187 = arith.andi %1185, %1186 : i1
      %1188 = scf.if %1187 -> (i64) {
        scf.yield %1130 : i64
      } else {
        scf.yield %1183 : i64
      }
      %1189 = func.call @cc_errorp(%1142) : (i64) -> i64
      %1190 = arith.cmpi ne, %1189, %1173 : i64
      %1191 = arith.cmpi eq, %1188, %1173 : i64
      %1192 = arith.andi %1190, %1191 : i1
      %1193 = scf.if %1192 -> (i64) {
        scf.yield %1142 : i64
      } else {
        scf.yield %1188 : i64
      }
      %1194 = func.call @cc_errorp(%1149) : (i64) -> i64
      %1195 = arith.cmpi ne, %1194, %1173 : i64
      %1196 = arith.cmpi eq, %1193, %1173 : i64
      %1197 = arith.andi %1195, %1196 : i1
      %1198 = scf.if %1197 -> (i64) {
        scf.yield %1149 : i64
      } else {
        scf.yield %1193 : i64
      }
      %1199 = func.call @cc_errorp(%1153) : (i64) -> i64
      %1200 = arith.cmpi ne, %1199, %1173 : i64
      %1201 = arith.cmpi eq, %1198, %1173 : i64
      %1202 = arith.andi %1200, %1201 : i1
      %1203 = scf.if %1202 -> (i64) {
        scf.yield %1153 : i64
      } else {
        scf.yield %1198 : i64
      }
      %1204 = func.call @cc_errorp(%1160) : (i64) -> i64
      %1205 = arith.cmpi ne, %1204, %1173 : i64
      %1206 = arith.cmpi eq, %1203, %1173 : i64
      %1207 = arith.andi %1205, %1206 : i1
      %1208 = scf.if %1207 -> (i64) {
        scf.yield %1160 : i64
      } else {
        scf.yield %1203 : i64
      }
      %1209 = func.call @cc_errorp(%1172) : (i64) -> i64
      %1210 = arith.cmpi ne, %1209, %1173 : i64
      %1211 = arith.cmpi eq, %1208, %1173 : i64
      %1212 = arith.andi %1210, %1211 : i1
      %1213 = scf.if %1212 -> (i64) {
        scf.yield %1172 : i64
      } else {
        scf.yield %1208 : i64
      }
      %1214 = arith.cmpi ne, %1213, %1173 : i64
      scf.if %1214 {
        func.call @stack_push_pointer(%1213) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%974) : (i64) -> ()
        func.call @stack_push_pointer(%1086) : (i64) -> ()
        func.call @stack_push_pointer(%1130) : (i64) -> ()
        func.call @stack_push_pointer(%1142) : (i64) -> ()
        func.call @stack_push_pointer(%1149) : (i64) -> ()
        func.call @stack_push_pointer(%1153) : (i64) -> ()
        func.call @stack_push_pointer(%1160) : (i64) -> ()
        func.call @stack_push_pointer(%1172) : (i64) -> ()
        %1215 = llvm.mlir.addressof @str102 : !llvm.ptr
        %1216 = func.call @cc_make_function_ref_const(%1215) : (!llvm.ptr) -> i64
        %1217 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1216, %1217) : (i64, i64) -> ()
      }
      %1218 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1218 : i64
    }
    %1219 = func.call @cc_nil_value() : () -> i64
    %1220 = func.call @cc_errorp(%965) : (i64) -> i64
    %1221 = arith.cmpi ne, %1220, %1219 : i64
    %1222 = scf.if %1221 -> (i64) {
      scf.yield %965 : i64
    } else {
      %1223 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1224 = arith.constant 21 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = func.call @cc_nil_value() : () -> i64
      %1227 = func.call @cc_intern(%1225, %1226) : (i64, i64) -> i64
      %1228 = func.call @cc_nil_value() : () -> i64
      %1229 = func.call @cc_cons(%1227, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_values_pack(%1229) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1231 = arith.addi %1227, %__rlasp_stack_elide_zero_65 : i64
      %1232 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1233 = arith.constant 3 : i64
      %1234 = func.call @cc_make_string(%1232, %1233) : (!llvm.ptr, i64) -> i64
      %1235 = func.call @cc_nil_value() : () -> i64
      %1236 = func.call @cc_intern(%1234, %1235) : (i64, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_cons(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_values_pack(%1238) : (i64) -> i64
      func.call @stack_push_pointer(%1236) : (i64) -> ()
      %1240 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1241 = arith.constant 3 : i64
      %1242 = func.call @cc_make_string(%1240, %1241) : (!llvm.ptr, i64) -> i64
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_intern(%1242, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_nil_value() : () -> i64
      %1246 = func.call @cc_cons(%1244, %1245) : (i64, i64) -> i64
      %1247 = func.call @cc_values_pack(%1246) : (i64) -> i64
      func.call @stack_push_pointer(%1244) : (i64) -> ()
      %1248 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1249 = arith.constant 7 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1252 = arith.constant 11 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_intern(%1250, %1253) : (i64, i64) -> i64
      %1255 = func.call @cc_nil_value() : () -> i64
      %1256 = func.call @cc_cons(%1254, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_values_pack(%1256) : (i64) -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1258 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1259 = arith.constant 11 : i64
      %1260 = func.call @cc_make_string(%1258, %1259) : (!llvm.ptr, i64) -> i64
      %1261 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1262 = arith.constant 11 : i64
      %1263 = func.call @cc_make_string(%1261, %1262) : (!llvm.ptr, i64) -> i64
      %1264 = func.call @cc_intern(%1260, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_nil_value() : () -> i64
      %1266 = func.call @cc_cons(%1264, %1265) : (i64, i64) -> i64
      %1267 = func.call @cc_values_pack(%1266) : (i64) -> i64
      func.call @stack_push_pointer(%1264) : (i64) -> ()
      %1268 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1269 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1270 = arith.constant 6 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1273 = arith.constant 11 : i64
      %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
      %1275 = func.call @cc_intern(%1271, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_cons(%1275, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_values_pack(%1277) : (i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1279 = arith.addi %1275, %__rlasp_stack_elide_zero_66 : i64
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @cc_cons(%1279, %1280) : (i64, i64) -> i64
      %1282 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1283 = arith.constant 5 : i64
      %1284 = func.call @cc_make_string(%1282, %1283) : (!llvm.ptr, i64) -> i64
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = func.call @cc_intern(%1284, %1285) : (i64, i64) -> i64
      %1287 = func.call @cc_nil_value() : () -> i64
      %1288 = func.call @cc_cons(%1286, %1287) : (i64, i64) -> i64
      %1289 = func.call @cc_values_pack(%1288) : (i64) -> i64
      %1290 = func.call @cc_cons(%1286, %1281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1290) : (i64) -> ()
      %1291 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1292 = arith.constant 11 : i64
      %1293 = func.call @cc_make_string(%1291, %1292) : (!llvm.ptr, i64) -> i64
      %1294 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1295 = arith.constant 11 : i64
      %1296 = func.call @cc_make_string(%1294, %1295) : (!llvm.ptr, i64) -> i64
      %1297 = func.call @cc_intern(%1293, %1296) : (i64, i64) -> i64
      %1298 = func.call @cc_nil_value() : () -> i64
      %1299 = func.call @cc_cons(%1297, %1298) : (i64, i64) -> i64
      %1300 = func.call @cc_values_pack(%1299) : (i64) -> i64
      func.call @stack_push_pointer(%1297) : (i64) -> ()
      %1301 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1301) : (i64) -> ()
      %1302 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1303 = arith.constant 15 : i64
      %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
      %1305 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1306 = arith.constant 7 : i64
      %1307 = func.call @cc_make_string(%1305, %1306) : (!llvm.ptr, i64) -> i64
      %1308 = func.call @cc_intern(%1304, %1307) : (i64, i64) -> i64
      %1309 = func.call @cc_nil_value() : () -> i64
      %1310 = func.call @cc_cons(%1308, %1309) : (i64, i64) -> i64
      %1311 = func.call @cc_values_pack(%1310) : (i64) -> i64
      func.call @stack_push_pointer(%1308) : (i64) -> ()
      %1312 = arith.constant 0 : i64
      %1313 = func.call @cc_box_character(%1312) : (i64) -> i64
      func.call @stack_push_pointer(%1313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = func.call @stack_pop_pointer() : () -> i64
      %1316 = func.call @cc_cons(%1315, %1314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1317 = arith.addi %1316, %__rlasp_stack_elide_zero_67 : i64
      %1318 = func.call @stack_pop_pointer() : () -> i64
      %1319 = func.call @cc_cons(%1318, %1317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1320 = arith.addi %1319, %__rlasp_stack_elide_zero_68 : i64
      %1321 = func.call @stack_pop_pointer() : () -> i64
      %1322 = func.call @cc_cons(%1321, %1320) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1323 = arith.addi %1322, %__rlasp_stack_elide_zero_69 : i64
      %1324 = func.call @stack_pop_pointer() : () -> i64
      %1325 = func.call @cc_cons(%1324, %1323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1325) : (i64) -> ()
      %1326 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1327 = arith.constant 3 : i64
      %1328 = func.call @cc_make_string(%1326, %1327) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1329 = func.call @stack_pop_pointer() : () -> i64
      %1330 = func.call @stack_pop_pointer() : () -> i64
      %1331 = func.call @cc_cons(%1330, %1329) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1332 = arith.addi %1331, %__rlasp_stack_elide_zero_70 : i64
      %1333 = func.call @stack_pop_pointer() : () -> i64
      %1334 = func.call @cc_cons(%1333, %1332) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1335 = arith.addi %1334, %__rlasp_stack_elide_zero_71 : i64
      %1336 = func.call @stack_pop_pointer() : () -> i64
      %1337 = func.call @cc_cons(%1336, %1335) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1338 = arith.addi %1337, %__rlasp_stack_elide_zero_72 : i64
      %1339 = func.call @stack_pop_pointer() : () -> i64
      %1340 = func.call @cc_cons(%1339, %1338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1340) : (i64) -> ()
      %1341 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1342 = arith.constant 6 : i64
      %1343 = func.call @cc_make_string(%1341, %1342) : (!llvm.ptr, i64) -> i64
      %1344 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1345 = arith.constant 11 : i64
      %1346 = func.call @cc_make_string(%1344, %1345) : (!llvm.ptr, i64) -> i64
      %1347 = func.call @cc_intern(%1343, %1346) : (i64, i64) -> i64
      %1348 = func.call @cc_nil_value() : () -> i64
      %1349 = func.call @cc_cons(%1347, %1348) : (i64, i64) -> i64
      %1350 = func.call @cc_values_pack(%1349) : (i64) -> i64
      func.call @stack_push_pointer(%1347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1351 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1352 = arith.constant 9 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1354 = arith.constant 0 : i64
      %1355 = func.call @cc_box_character(%1354) : (i64) -> i64
      func.call @stack_push_pointer(%1355) : (i64) -> ()
      %1356 = arith.constant 0 : i64
      %1357 = func.call @cc_box_character(%1356) : (i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1358 = arith.constant 0 : i64
      %1359 = func.call @cc_box_character(%1358) : (i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1360 = func.call @stack_pop_pointer() : () -> i64
      %1361 = func.call @stack_pop_pointer() : () -> i64
      %1362 = func.call @cc_cons(%1361, %1360) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1363 = arith.addi %1362, %__rlasp_stack_elide_zero_73 : i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1364, %1363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1366 = arith.addi %1365, %__rlasp_stack_elide_zero_74 : i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1369 = arith.addi %1368, %__rlasp_stack_elide_zero_75 : i64
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_cons(%1370, %1369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1372 = arith.addi %1371, %__rlasp_stack_elide_zero_76 : i64
      %1373 = func.call @stack_pop_pointer() : () -> i64
      %1374 = func.call @cc_cons(%1373, %1372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1375 = arith.addi %1374, %__rlasp_stack_elide_zero_77 : i64
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @cc_cons(%1376, %1375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @stack_pop_pointer() : () -> i64
      %1380 = func.call @cc_cons(%1379, %1378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1381 = arith.addi %1380, %__rlasp_stack_elide_zero_78 : i64
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @cc_cons(%1382, %1381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1384 = arith.addi %1383, %__rlasp_stack_elide_zero_79 : i64
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @cc_cons(%1385, %1384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @stack_pop_pointer() : () -> i64
      %1389 = func.call @cc_cons(%1388, %1387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1390 = arith.addi %1389, %__rlasp_stack_elide_zero_80 : i64
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @cc_cons(%1391, %1390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1392) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @stack_pop_pointer() : () -> i64
      %1395 = func.call @cc_cons(%1394, %1393) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1396 = arith.addi %1395, %__rlasp_stack_elide_zero_81 : i64
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @cc_cons(%1397, %1396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1399 = arith.addi %1398, %__rlasp_stack_elide_zero_82 : i64
      %1461 = arith.constant 122791386939398 : i64
      %1462 = arith.constant 0 : i64
      %1463 = func.call @cc_make_closure(%1461, %1462) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1464 = arith.addi %1463, %__rlasp_stack_elide_zero_83 : i64
      %1465 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1466 = arith.constant 1 : i64
      %1467 = func.call @cc_make_string(%1465, %1466) : (!llvm.ptr, i64) -> i64
      %1468 = func.call @cc_nil_value() : () -> i64
      %1469 = func.call @cc_intern(%1467, %1468) : (i64, i64) -> i64
      %1470 = func.call @cc_nil_value() : () -> i64
      %1471 = func.call @cc_cons(%1469, %1470) : (i64, i64) -> i64
      %1472 = func.call @cc_values_pack(%1471) : (i64) -> i64
      func.call @stack_push_pointer(%1469) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1473 = func.call @stack_pop_pointer() : () -> i64
      %1474 = func.call @stack_pop_pointer() : () -> i64
      %1475 = func.call @cc_cons(%1474, %1473) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1476 = arith.addi %1475, %__rlasp_stack_elide_zero_84 : i64
      %1477 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1478 = arith.constant 11 : i64
      %1479 = func.call @cc_make_string(%1477, %1478) : (!llvm.ptr, i64) -> i64
      %1480 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1481 = arith.constant 7 : i64
      %1482 = func.call @cc_make_string(%1480, %1481) : (!llvm.ptr, i64) -> i64
      %1483 = func.call @cc_intern(%1479, %1482) : (i64, i64) -> i64
      %1484 = func.call @cc_nil_value() : () -> i64
      %1485 = func.call @cc_cons(%1483, %1484) : (i64, i64) -> i64
      %1486 = func.call @cc_values_pack(%1485) : (i64) -> i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1489 = arith.constant 4 : i64
      %1490 = func.call @cc_make_string(%1488, %1489) : (!llvm.ptr, i64) -> i64
      %1491 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1492 = arith.constant 7 : i64
      %1493 = func.call @cc_make_string(%1491, %1492) : (!llvm.ptr, i64) -> i64
      %1494 = func.call @cc_intern(%1490, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
      %1498 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1499 = arith.constant 6 : i64
      %1500 = func.call @cc_make_string(%1498, %1499) : (!llvm.ptr, i64) -> i64
      %1501 = func.call @cc_nil_value() : () -> i64
      %1502 = func.call @cc_intern(%1500, %1501) : (i64, i64) -> i64
      %1503 = func.call @cc_nil_value() : () -> i64
      %1504 = func.call @cc_cons(%1502, %1503) : (i64, i64) -> i64
      %1505 = func.call @cc_values_pack(%1504) : (i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1506 = arith.addi %1502, %__rlasp_stack_elide_zero_85 : i64
      %1507 = func.call @cc_nil_value() : () -> i64
      %1508 = func.call @cc_errorp(%1231) : (i64) -> i64
      %1509 = arith.cmpi ne, %1508, %1507 : i64
      %1510 = arith.cmpi eq, %1507, %1507 : i64
      %1511 = arith.andi %1509, %1510 : i1
      %1512 = scf.if %1511 -> (i64) {
        scf.yield %1231 : i64
      } else {
        scf.yield %1507 : i64
      }
      %1513 = func.call @cc_errorp(%1399) : (i64) -> i64
      %1514 = arith.cmpi ne, %1513, %1507 : i64
      %1515 = arith.cmpi eq, %1512, %1507 : i64
      %1516 = arith.andi %1514, %1515 : i1
      %1517 = scf.if %1516 -> (i64) {
        scf.yield %1399 : i64
      } else {
        scf.yield %1512 : i64
      }
      %1518 = func.call @cc_errorp(%1464) : (i64) -> i64
      %1519 = arith.cmpi ne, %1518, %1507 : i64
      %1520 = arith.cmpi eq, %1517, %1507 : i64
      %1521 = arith.andi %1519, %1520 : i1
      %1522 = scf.if %1521 -> (i64) {
        scf.yield %1464 : i64
      } else {
        scf.yield %1517 : i64
      }
      %1523 = func.call @cc_errorp(%1476) : (i64) -> i64
      %1524 = arith.cmpi ne, %1523, %1507 : i64
      %1525 = arith.cmpi eq, %1522, %1507 : i64
      %1526 = arith.andi %1524, %1525 : i1
      %1527 = scf.if %1526 -> (i64) {
        scf.yield %1476 : i64
      } else {
        scf.yield %1522 : i64
      }
      %1528 = func.call @cc_errorp(%1483) : (i64) -> i64
      %1529 = arith.cmpi ne, %1528, %1507 : i64
      %1530 = arith.cmpi eq, %1527, %1507 : i64
      %1531 = arith.andi %1529, %1530 : i1
      %1532 = scf.if %1531 -> (i64) {
        scf.yield %1483 : i64
      } else {
        scf.yield %1527 : i64
      }
      %1533 = func.call @cc_errorp(%1487) : (i64) -> i64
      %1534 = arith.cmpi ne, %1533, %1507 : i64
      %1535 = arith.cmpi eq, %1532, %1507 : i64
      %1536 = arith.andi %1534, %1535 : i1
      %1537 = scf.if %1536 -> (i64) {
        scf.yield %1487 : i64
      } else {
        scf.yield %1532 : i64
      }
      %1538 = func.call @cc_errorp(%1494) : (i64) -> i64
      %1539 = arith.cmpi ne, %1538, %1507 : i64
      %1540 = arith.cmpi eq, %1537, %1507 : i64
      %1541 = arith.andi %1539, %1540 : i1
      %1542 = scf.if %1541 -> (i64) {
        scf.yield %1494 : i64
      } else {
        scf.yield %1537 : i64
      }
      %1543 = func.call @cc_errorp(%1506) : (i64) -> i64
      %1544 = arith.cmpi ne, %1543, %1507 : i64
      %1545 = arith.cmpi eq, %1542, %1507 : i64
      %1546 = arith.andi %1544, %1545 : i1
      %1547 = scf.if %1546 -> (i64) {
        scf.yield %1506 : i64
      } else {
        scf.yield %1542 : i64
      }
      %1548 = arith.cmpi ne, %1547, %1507 : i64
      scf.if %1548 {
        func.call @stack_push_pointer(%1547) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1231) : (i64) -> ()
        func.call @stack_push_pointer(%1399) : (i64) -> ()
        func.call @stack_push_pointer(%1464) : (i64) -> ()
        func.call @stack_push_pointer(%1476) : (i64) -> ()
        func.call @stack_push_pointer(%1483) : (i64) -> ()
        func.call @stack_push_pointer(%1487) : (i64) -> ()
        func.call @stack_push_pointer(%1494) : (i64) -> ()
        func.call @stack_push_pointer(%1506) : (i64) -> ()
        %1549 = llvm.mlir.addressof @str132 : !llvm.ptr
        %1550 = func.call @cc_make_function_ref_const(%1549) : (!llvm.ptr) -> i64
        %1551 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1550, %1551) : (i64, i64) -> ()
      }
      %1552 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1552 : i64
    }
    %1553 = func.call @cc_nil_value() : () -> i64
    %1554 = func.call @cc_errorp(%1222) : (i64) -> i64
    %1555 = arith.cmpi ne, %1554, %1553 : i64
    %1556 = scf.if %1555 -> (i64) {
      scf.yield %1222 : i64
    } else {
      %1557 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1558 = arith.constant 18 : i64
      %1559 = func.call @cc_make_string(%1557, %1558) : (!llvm.ptr, i64) -> i64
      %1560 = func.call @cc_nil_value() : () -> i64
      %1561 = func.call @cc_intern(%1559, %1560) : (i64, i64) -> i64
      %1562 = func.call @cc_nil_value() : () -> i64
      %1563 = func.call @cc_cons(%1561, %1562) : (i64, i64) -> i64
      %1564 = func.call @cc_values_pack(%1563) : (i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1565 = arith.addi %1561, %__rlasp_stack_elide_zero_86 : i64
      %1566 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1567 = arith.constant 3 : i64
      %1568 = func.call @cc_make_string(%1566, %1567) : (!llvm.ptr, i64) -> i64
      %1569 = func.call @cc_nil_value() : () -> i64
      %1570 = func.call @cc_intern(%1568, %1569) : (i64, i64) -> i64
      %1571 = func.call @cc_nil_value() : () -> i64
      %1572 = func.call @cc_cons(%1570, %1571) : (i64, i64) -> i64
      %1573 = func.call @cc_values_pack(%1572) : (i64) -> i64
      func.call @stack_push_pointer(%1570) : (i64) -> ()
      %1574 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1575 = arith.constant 3 : i64
      %1576 = func.call @cc_make_string(%1574, %1575) : (!llvm.ptr, i64) -> i64
      %1577 = func.call @cc_nil_value() : () -> i64
      %1578 = func.call @cc_intern(%1576, %1577) : (i64, i64) -> i64
      %1579 = func.call @cc_nil_value() : () -> i64
      %1580 = func.call @cc_cons(%1578, %1579) : (i64, i64) -> i64
      %1581 = func.call @cc_values_pack(%1580) : (i64) -> i64
      func.call @stack_push_pointer(%1578) : (i64) -> ()
      %1582 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1583 = arith.constant 7 : i64
      %1584 = func.call @cc_make_string(%1582, %1583) : (!llvm.ptr, i64) -> i64
      %1585 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1586 = arith.constant 11 : i64
      %1587 = func.call @cc_make_string(%1585, %1586) : (!llvm.ptr, i64) -> i64
      %1588 = func.call @cc_intern(%1584, %1587) : (i64, i64) -> i64
      %1589 = func.call @cc_nil_value() : () -> i64
      %1590 = func.call @cc_cons(%1588, %1589) : (i64, i64) -> i64
      %1591 = func.call @cc_values_pack(%1590) : (i64) -> i64
      func.call @stack_push_pointer(%1588) : (i64) -> ()
      %1592 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1593 = arith.constant 8 : i64
      %1594 = func.call @cc_make_string(%1592, %1593) : (!llvm.ptr, i64) -> i64
      %1595 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1596 = arith.constant 11 : i64
      %1597 = func.call @cc_make_string(%1595, %1596) : (!llvm.ptr, i64) -> i64
      %1598 = func.call @cc_intern(%1594, %1597) : (i64, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_cons(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_values_pack(%1600) : (i64) -> i64
      func.call @stack_push_pointer(%1598) : (i64) -> ()
      %1602 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1603 = arith.constant 11 : i64
      %1604 = func.call @cc_make_string(%1602, %1603) : (!llvm.ptr, i64) -> i64
      %1605 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1606 = arith.constant 11 : i64
      %1607 = func.call @cc_make_string(%1605, %1606) : (!llvm.ptr, i64) -> i64
      %1608 = func.call @cc_intern(%1604, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_cons(%1608, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_values_pack(%1610) : (i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      %1612 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1612) : (i64) -> ()
      %1613 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1614 = arith.constant 6 : i64
      %1615 = func.call @cc_make_string(%1613, %1614) : (!llvm.ptr, i64) -> i64
      %1616 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1617 = arith.constant 11 : i64
      %1618 = func.call @cc_make_string(%1616, %1617) : (!llvm.ptr, i64) -> i64
      %1619 = func.call @cc_intern(%1615, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_nil_value() : () -> i64
      %1621 = func.call @cc_cons(%1619, %1620) : (i64, i64) -> i64
      %1622 = func.call @cc_values_pack(%1621) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1623 = arith.addi %1619, %__rlasp_stack_elide_zero_87 : i64
      %1624 = func.call @stack_pop_pointer() : () -> i64
      %1625 = func.call @cc_cons(%1623, %1624) : (i64, i64) -> i64
      %1626 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1627 = arith.constant 5 : i64
      %1628 = func.call @cc_make_string(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = func.call @cc_nil_value() : () -> i64
      %1630 = func.call @cc_intern(%1628, %1629) : (i64, i64) -> i64
      %1631 = func.call @cc_nil_value() : () -> i64
      %1632 = func.call @cc_cons(%1630, %1631) : (i64, i64) -> i64
      %1633 = func.call @cc_values_pack(%1632) : (i64) -> i64
      %1634 = func.call @cc_cons(%1630, %1625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1634) : (i64) -> ()
      %1635 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1636 = arith.constant 11 : i64
      %1637 = func.call @cc_make_string(%1635, %1636) : (!llvm.ptr, i64) -> i64
      %1638 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1639 = arith.constant 11 : i64
      %1640 = func.call @cc_make_string(%1638, %1639) : (!llvm.ptr, i64) -> i64
      %1641 = func.call @cc_intern(%1637, %1640) : (i64, i64) -> i64
      %1642 = func.call @cc_nil_value() : () -> i64
      %1643 = func.call @cc_cons(%1641, %1642) : (i64, i64) -> i64
      %1644 = func.call @cc_values_pack(%1643) : (i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      %1645 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1645) : (i64) -> ()
      %1646 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1647 = arith.constant 15 : i64
      %1648 = func.call @cc_make_string(%1646, %1647) : (!llvm.ptr, i64) -> i64
      %1649 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1650 = arith.constant 7 : i64
      %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
      %1652 = func.call @cc_intern(%1648, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      func.call @stack_push_pointer(%1652) : (i64) -> ()
      %1656 = arith.constant 0 : i64
      %1657 = func.call @cc_box_character(%1656) : (i64) -> i64
      func.call @stack_push_pointer(%1657) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @stack_pop_pointer() : () -> i64
      %1660 = func.call @cc_cons(%1659, %1658) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1661 = arith.addi %1660, %__rlasp_stack_elide_zero_88 : i64
      %1662 = func.call @stack_pop_pointer() : () -> i64
      %1663 = func.call @cc_cons(%1662, %1661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1664 = arith.addi %1663, %__rlasp_stack_elide_zero_89 : i64
      %1665 = func.call @stack_pop_pointer() : () -> i64
      %1666 = func.call @cc_cons(%1665, %1664) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1667 = arith.addi %1666, %__rlasp_stack_elide_zero_90 : i64
      %1668 = func.call @stack_pop_pointer() : () -> i64
      %1669 = func.call @cc_cons(%1668, %1667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1669) : (i64) -> ()
      %1670 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1671 = arith.constant 3 : i64
      %1672 = func.call @cc_make_string(%1670, %1671) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1672) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1673 = func.call @stack_pop_pointer() : () -> i64
      %1674 = func.call @stack_pop_pointer() : () -> i64
      %1675 = func.call @cc_cons(%1674, %1673) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1676 = arith.addi %1675, %__rlasp_stack_elide_zero_91 : i64
      %1677 = func.call @stack_pop_pointer() : () -> i64
      %1678 = func.call @cc_cons(%1677, %1676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1679 = arith.addi %1678, %__rlasp_stack_elide_zero_92 : i64
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @cc_cons(%1680, %1679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1682 = arith.addi %1681, %__rlasp_stack_elide_zero_93 : i64
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @cc_cons(%1683, %1682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1684) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1685 = func.call @stack_pop_pointer() : () -> i64
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @cc_cons(%1686, %1685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1688 = arith.addi %1687, %__rlasp_stack_elide_zero_94 : i64
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @cc_cons(%1689, %1688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1690) : (i64) -> ()
      %1691 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1692 = arith.constant 6 : i64
      %1693 = func.call @cc_make_string(%1691, %1692) : (!llvm.ptr, i64) -> i64
      %1694 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1695 = arith.constant 11 : i64
      %1696 = func.call @cc_make_string(%1694, %1695) : (!llvm.ptr, i64) -> i64
      %1697 = func.call @cc_intern(%1693, %1696) : (i64, i64) -> i64
      %1698 = func.call @cc_nil_value() : () -> i64
      %1699 = func.call @cc_cons(%1697, %1698) : (i64, i64) -> i64
      %1700 = func.call @cc_values_pack(%1699) : (i64) -> i64
      func.call @stack_push_pointer(%1697) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1701 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1702 = arith.constant 9 : i64
      %1703 = func.call @cc_make_string(%1701, %1702) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1703) : (i64) -> ()
      %1704 = arith.constant 0 : i64
      %1705 = func.call @cc_box_character(%1704) : (i64) -> i64
      func.call @stack_push_pointer(%1705) : (i64) -> ()
      %1706 = arith.constant 0 : i64
      %1707 = func.call @cc_box_character(%1706) : (i64) -> i64
      func.call @stack_push_pointer(%1707) : (i64) -> ()
      %1708 = arith.constant 0 : i64
      %1709 = func.call @cc_box_character(%1708) : (i64) -> i64
      func.call @stack_push_pointer(%1709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @stack_pop_pointer() : () -> i64
      %1712 = func.call @cc_cons(%1711, %1710) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1713 = arith.addi %1712, %__rlasp_stack_elide_zero_95 : i64
      %1714 = func.call @stack_pop_pointer() : () -> i64
      %1715 = func.call @cc_cons(%1714, %1713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1716 = arith.addi %1715, %__rlasp_stack_elide_zero_96 : i64
      %1717 = func.call @stack_pop_pointer() : () -> i64
      %1718 = func.call @cc_cons(%1717, %1716) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1719 = arith.addi %1718, %__rlasp_stack_elide_zero_97 : i64
      %1720 = func.call @stack_pop_pointer() : () -> i64
      %1721 = func.call @cc_cons(%1720, %1719) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1722 = arith.addi %1721, %__rlasp_stack_elide_zero_98 : i64
      %1723 = func.call @stack_pop_pointer() : () -> i64
      %1724 = func.call @cc_cons(%1723, %1722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %1725 = arith.addi %1724, %__rlasp_stack_elide_zero_99 : i64
      %1726 = func.call @stack_pop_pointer() : () -> i64
      %1727 = func.call @cc_cons(%1726, %1725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1728 = func.call @stack_pop_pointer() : () -> i64
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @cc_cons(%1729, %1728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %1731 = arith.addi %1730, %__rlasp_stack_elide_zero_100 : i64
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1733 = func.call @cc_cons(%1732, %1731) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %1734 = arith.addi %1733, %__rlasp_stack_elide_zero_101 : i64
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @cc_cons(%1735, %1734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1736) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1737 = func.call @stack_pop_pointer() : () -> i64
      %1738 = func.call @stack_pop_pointer() : () -> i64
      %1739 = func.call @cc_cons(%1738, %1737) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %1740 = arith.addi %1739, %__rlasp_stack_elide_zero_102 : i64
      %1741 = func.call @stack_pop_pointer() : () -> i64
      %1742 = func.call @cc_cons(%1741, %1740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1743 = func.call @stack_pop_pointer() : () -> i64
      %1744 = func.call @stack_pop_pointer() : () -> i64
      %1745 = func.call @cc_cons(%1744, %1743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %1746 = arith.addi %1745, %__rlasp_stack_elide_zero_103 : i64
      %1747 = func.call @stack_pop_pointer() : () -> i64
      %1748 = func.call @cc_cons(%1747, %1746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %1749 = arith.addi %1748, %__rlasp_stack_elide_zero_104 : i64
      %1813 = arith.constant 122791386939399 : i64
      %1814 = arith.constant 0 : i64
      %1815 = func.call @cc_make_closure(%1813, %1814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %1816 = arith.addi %1815, %__rlasp_stack_elide_zero_105 : i64
      %1817 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1818 = arith.constant 1 : i64
      %1819 = func.call @cc_make_string(%1817, %1818) : (!llvm.ptr, i64) -> i64
      %1820 = func.call @cc_nil_value() : () -> i64
      %1821 = func.call @cc_intern(%1819, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_cons(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_values_pack(%1823) : (i64) -> i64
      func.call @stack_push_pointer(%1821) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1825 = func.call @stack_pop_pointer() : () -> i64
      %1826 = func.call @stack_pop_pointer() : () -> i64
      %1827 = func.call @cc_cons(%1826, %1825) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %1828 = arith.addi %1827, %__rlasp_stack_elide_zero_106 : i64
      %1829 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1830 = arith.constant 11 : i64
      %1831 = func.call @cc_make_string(%1829, %1830) : (!llvm.ptr, i64) -> i64
      %1832 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1833 = arith.constant 7 : i64
      %1834 = func.call @cc_make_string(%1832, %1833) : (!llvm.ptr, i64) -> i64
      %1835 = func.call @cc_intern(%1831, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_nil_value() : () -> i64
      %1837 = func.call @cc_cons(%1835, %1836) : (i64, i64) -> i64
      %1838 = func.call @cc_values_pack(%1837) : (i64) -> i64
      %1839 = func.call @cc_nil_value() : () -> i64
      %1840 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1841 = arith.constant 4 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1844 = arith.constant 7 : i64
      %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
      %1846 = func.call @cc_intern(%1842, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_nil_value() : () -> i64
      %1848 = func.call @cc_cons(%1846, %1847) : (i64, i64) -> i64
      %1849 = func.call @cc_values_pack(%1848) : (i64) -> i64
      %1850 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1851 = arith.constant 6 : i64
      %1852 = func.call @cc_make_string(%1850, %1851) : (!llvm.ptr, i64) -> i64
      %1853 = func.call @cc_nil_value() : () -> i64
      %1854 = func.call @cc_intern(%1852, %1853) : (i64, i64) -> i64
      %1855 = func.call @cc_nil_value() : () -> i64
      %1856 = func.call @cc_cons(%1854, %1855) : (i64, i64) -> i64
      %1857 = func.call @cc_values_pack(%1856) : (i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %1858 = arith.addi %1854, %__rlasp_stack_elide_zero_107 : i64
      %1859 = func.call @cc_nil_value() : () -> i64
      %1860 = func.call @cc_errorp(%1565) : (i64) -> i64
      %1861 = arith.cmpi ne, %1860, %1859 : i64
      %1862 = arith.cmpi eq, %1859, %1859 : i64
      %1863 = arith.andi %1861, %1862 : i1
      %1864 = scf.if %1863 -> (i64) {
        scf.yield %1565 : i64
      } else {
        scf.yield %1859 : i64
      }
      %1865 = func.call @cc_errorp(%1749) : (i64) -> i64
      %1866 = arith.cmpi ne, %1865, %1859 : i64
      %1867 = arith.cmpi eq, %1864, %1859 : i64
      %1868 = arith.andi %1866, %1867 : i1
      %1869 = scf.if %1868 -> (i64) {
        scf.yield %1749 : i64
      } else {
        scf.yield %1864 : i64
      }
      %1870 = func.call @cc_errorp(%1816) : (i64) -> i64
      %1871 = arith.cmpi ne, %1870, %1859 : i64
      %1872 = arith.cmpi eq, %1869, %1859 : i64
      %1873 = arith.andi %1871, %1872 : i1
      %1874 = scf.if %1873 -> (i64) {
        scf.yield %1816 : i64
      } else {
        scf.yield %1869 : i64
      }
      %1875 = func.call @cc_errorp(%1828) : (i64) -> i64
      %1876 = arith.cmpi ne, %1875, %1859 : i64
      %1877 = arith.cmpi eq, %1874, %1859 : i64
      %1878 = arith.andi %1876, %1877 : i1
      %1879 = scf.if %1878 -> (i64) {
        scf.yield %1828 : i64
      } else {
        scf.yield %1874 : i64
      }
      %1880 = func.call @cc_errorp(%1835) : (i64) -> i64
      %1881 = arith.cmpi ne, %1880, %1859 : i64
      %1882 = arith.cmpi eq, %1879, %1859 : i64
      %1883 = arith.andi %1881, %1882 : i1
      %1884 = scf.if %1883 -> (i64) {
        scf.yield %1835 : i64
      } else {
        scf.yield %1879 : i64
      }
      %1885 = func.call @cc_errorp(%1839) : (i64) -> i64
      %1886 = arith.cmpi ne, %1885, %1859 : i64
      %1887 = arith.cmpi eq, %1884, %1859 : i64
      %1888 = arith.andi %1886, %1887 : i1
      %1889 = scf.if %1888 -> (i64) {
        scf.yield %1839 : i64
      } else {
        scf.yield %1884 : i64
      }
      %1890 = func.call @cc_errorp(%1846) : (i64) -> i64
      %1891 = arith.cmpi ne, %1890, %1859 : i64
      %1892 = arith.cmpi eq, %1889, %1859 : i64
      %1893 = arith.andi %1891, %1892 : i1
      %1894 = scf.if %1893 -> (i64) {
        scf.yield %1846 : i64
      } else {
        scf.yield %1889 : i64
      }
      %1895 = func.call @cc_errorp(%1858) : (i64) -> i64
      %1896 = arith.cmpi ne, %1895, %1859 : i64
      %1897 = arith.cmpi eq, %1894, %1859 : i64
      %1898 = arith.andi %1896, %1897 : i1
      %1899 = scf.if %1898 -> (i64) {
        scf.yield %1858 : i64
      } else {
        scf.yield %1894 : i64
      }
      %1900 = arith.cmpi ne, %1899, %1859 : i64
      scf.if %1900 {
        func.call @stack_push_pointer(%1899) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1565) : (i64) -> ()
        func.call @stack_push_pointer(%1749) : (i64) -> ()
        func.call @stack_push_pointer(%1816) : (i64) -> ()
        func.call @stack_push_pointer(%1828) : (i64) -> ()
        func.call @stack_push_pointer(%1835) : (i64) -> ()
        func.call @stack_push_pointer(%1839) : (i64) -> ()
        func.call @stack_push_pointer(%1846) : (i64) -> ()
        func.call @stack_push_pointer(%1858) : (i64) -> ()
        %1901 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1902 = func.call @cc_make_function_ref_const(%1901) : (!llvm.ptr) -> i64
        %1903 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1902, %1903) : (i64, i64) -> ()
      }
      %1904 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1904 : i64
    }
    %1905 = func.call @cc_nil_value() : () -> i64
    %1906 = func.call @cc_errorp(%1556) : (i64) -> i64
    %1907 = arith.cmpi ne, %1906, %1905 : i64
    %1908 = scf.if %1907 -> (i64) {
      scf.yield %1556 : i64
    } else {
      %1909 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1910 = arith.constant 17 : i64
      %1911 = func.call @cc_make_string(%1909, %1910) : (!llvm.ptr, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_intern(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_nil_value() : () -> i64
      %1915 = func.call @cc_cons(%1913, %1914) : (i64, i64) -> i64
      %1916 = func.call @cc_values_pack(%1915) : (i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %1917 = arith.addi %1913, %__rlasp_stack_elide_zero_108 : i64
      %1918 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1919 = arith.constant 10 : i64
      %1920 = func.call @cc_make_string(%1918, %1919) : (!llvm.ptr, i64) -> i64
      %1921 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1922 = arith.constant 11 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = func.call @cc_intern(%1920, %1923) : (i64, i64) -> i64
      %1925 = func.call @cc_nil_value() : () -> i64
      %1926 = func.call @cc_cons(%1924, %1925) : (i64, i64) -> i64
      %1927 = func.call @cc_values_pack(%1926) : (i64) -> i64
      func.call @stack_push_pointer(%1924) : (i64) -> ()
      %1928 = arith.constant 88 : i64
      %1929 = func.call @cc_box_character(%1928) : (i64) -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      %1930 = arith.constant 0 : i64
      %1931 = func.call @cc_box_character(%1930) : (i64) -> i64
      func.call @stack_push_pointer(%1931) : (i64) -> ()
      %1932 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1933 = arith.constant 6 : i64
      %1934 = func.call @cc_make_string(%1932, %1933) : (!llvm.ptr, i64) -> i64
      %1935 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1936 = arith.constant 11 : i64
      %1937 = func.call @cc_make_string(%1935, %1936) : (!llvm.ptr, i64) -> i64
      %1938 = func.call @cc_intern(%1934, %1937) : (i64, i64) -> i64
      %1939 = func.call @cc_nil_value() : () -> i64
      %1940 = func.call @cc_cons(%1938, %1939) : (i64, i64) -> i64
      %1941 = func.call @cc_values_pack(%1940) : (i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      %1942 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1943 = arith.constant 11 : i64
      %1944 = func.call @cc_make_string(%1942, %1943) : (!llvm.ptr, i64) -> i64
      %1945 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1946 = arith.constant 11 : i64
      %1947 = func.call @cc_make_string(%1945, %1946) : (!llvm.ptr, i64) -> i64
      %1948 = func.call @cc_intern(%1944, %1947) : (i64, i64) -> i64
      %1949 = func.call @cc_nil_value() : () -> i64
      %1950 = func.call @cc_cons(%1948, %1949) : (i64, i64) -> i64
      %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
      func.call @stack_push_pointer(%1948) : (i64) -> ()
      %1952 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1953 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1954 = arith.constant 6 : i64
      %1955 = func.call @cc_make_string(%1953, %1954) : (!llvm.ptr, i64) -> i64
      %1956 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1957 = arith.constant 11 : i64
      %1958 = func.call @cc_make_string(%1956, %1957) : (!llvm.ptr, i64) -> i64
      %1959 = func.call @cc_intern(%1955, %1958) : (i64, i64) -> i64
      %1960 = func.call @cc_nil_value() : () -> i64
      %1961 = func.call @cc_cons(%1959, %1960) : (i64, i64) -> i64
      %1962 = func.call @cc_values_pack(%1961) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %1963 = arith.addi %1959, %__rlasp_stack_elide_zero_109 : i64
      %1964 = func.call @stack_pop_pointer() : () -> i64
      %1965 = func.call @cc_cons(%1963, %1964) : (i64, i64) -> i64
      %1966 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1967 = arith.constant 5 : i64
      %1968 = func.call @cc_make_string(%1966, %1967) : (!llvm.ptr, i64) -> i64
      %1969 = func.call @cc_nil_value() : () -> i64
      %1970 = func.call @cc_intern(%1968, %1969) : (i64, i64) -> i64
      %1971 = func.call @cc_nil_value() : () -> i64
      %1972 = func.call @cc_cons(%1970, %1971) : (i64, i64) -> i64
      %1973 = func.call @cc_values_pack(%1972) : (i64) -> i64
      %1974 = func.call @cc_cons(%1970, %1965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1974) : (i64) -> ()
      %1975 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1976 = arith.constant 1 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1977) : (i64) -> ()
      %1978 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1979 = arith.constant 11 : i64
      %1980 = func.call @cc_make_string(%1978, %1979) : (!llvm.ptr, i64) -> i64
      %1981 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1982 = arith.constant 11 : i64
      %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
      %1984 = func.call @cc_intern(%1980, %1983) : (i64, i64) -> i64
      %1985 = func.call @cc_nil_value() : () -> i64
      %1986 = func.call @cc_cons(%1984, %1985) : (i64, i64) -> i64
      %1987 = func.call @cc_values_pack(%1986) : (i64) -> i64
      func.call @stack_push_pointer(%1984) : (i64) -> ()
      %1988 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1988) : (i64) -> ()
      %1989 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1990 = arith.constant 15 : i64
      %1991 = func.call @cc_make_string(%1989, %1990) : (!llvm.ptr, i64) -> i64
      %1992 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1993 = arith.constant 7 : i64
      %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
      %1995 = func.call @cc_intern(%1991, %1994) : (i64, i64) -> i64
      %1996 = func.call @cc_nil_value() : () -> i64
      %1997 = func.call @cc_cons(%1995, %1996) : (i64, i64) -> i64
      %1998 = func.call @cc_values_pack(%1997) : (i64) -> i64
      func.call @stack_push_pointer(%1995) : (i64) -> ()
      %1999 = arith.constant 0 : i64
      %2000 = func.call @cc_box_character(%1999) : (i64) -> i64
      func.call @stack_push_pointer(%2000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2001 = func.call @stack_pop_pointer() : () -> i64
      %2002 = func.call @stack_pop_pointer() : () -> i64
      %2003 = func.call @cc_cons(%2002, %2001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2004 = arith.addi %2003, %__rlasp_stack_elide_zero_110 : i64
      %2005 = func.call @stack_pop_pointer() : () -> i64
      %2006 = func.call @cc_cons(%2005, %2004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2007 = arith.addi %2006, %__rlasp_stack_elide_zero_111 : i64
      %2008 = func.call @stack_pop_pointer() : () -> i64
      %2009 = func.call @cc_cons(%2008, %2007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2010 = arith.addi %2009, %__rlasp_stack_elide_zero_112 : i64
      %2011 = func.call @stack_pop_pointer() : () -> i64
      %2012 = func.call @cc_cons(%2011, %2010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2012) : (i64) -> ()
      %2013 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2014 = arith.constant 3 : i64
      %2015 = func.call @cc_make_string(%2013, %2014) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2016 = func.call @stack_pop_pointer() : () -> i64
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @cc_cons(%2017, %2016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2019 = arith.addi %2018, %__rlasp_stack_elide_zero_113 : i64
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @cc_cons(%2020, %2019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2022 = arith.addi %2021, %__rlasp_stack_elide_zero_114 : i64
      %2023 = func.call @stack_pop_pointer() : () -> i64
      %2024 = func.call @cc_cons(%2023, %2022) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2025 = arith.addi %2024, %__rlasp_stack_elide_zero_115 : i64
      %2026 = func.call @stack_pop_pointer() : () -> i64
      %2027 = func.call @cc_cons(%2026, %2025) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2028 = arith.addi %2027, %__rlasp_stack_elide_zero_116 : i64
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @cc_cons(%2029, %2028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2030) : (i64) -> ()
      %2031 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2032 = func.call @stack_pop_pointer() : () -> i64
      %2033 = func.call @stack_pop_pointer() : () -> i64
      %2034 = func.call @cc_cons(%2033, %2032) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2035 = arith.addi %2034, %__rlasp_stack_elide_zero_117 : i64
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = func.call @cc_cons(%2036, %2035) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2038 = arith.addi %2037, %__rlasp_stack_elide_zero_118 : i64
      %2039 = func.call @stack_pop_pointer() : () -> i64
      %2040 = func.call @cc_cons(%2039, %2038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2040) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2041 = func.call @stack_pop_pointer() : () -> i64
      %2042 = func.call @stack_pop_pointer() : () -> i64
      %2043 = func.call @cc_cons(%2042, %2041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2044 = arith.addi %2043, %__rlasp_stack_elide_zero_119 : i64
      %2045 = func.call @stack_pop_pointer() : () -> i64
      %2046 = func.call @cc_cons(%2045, %2044) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2047 = arith.addi %2046, %__rlasp_stack_elide_zero_120 : i64
      %2048 = func.call @stack_pop_pointer() : () -> i64
      %2049 = func.call @cc_cons(%2048, %2047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2050 = arith.addi %2049, %__rlasp_stack_elide_zero_121 : i64
      %2051 = func.call @stack_pop_pointer() : () -> i64
      %2052 = func.call @cc_cons(%2051, %2050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2053 = arith.addi %2052, %__rlasp_stack_elide_zero_122 : i64
      %2105 = arith.constant 122791386939400 : i64
      %2106 = arith.constant 0 : i64
      %2107 = func.call @cc_make_closure(%2105, %2106) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2108 = arith.addi %2107, %__rlasp_stack_elide_zero_123 : i64
      %2109 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2110 = arith.constant 7 : i64
      %2111 = func.call @cc_make_string(%2109, %2110) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2112 = func.call @stack_pop_pointer() : () -> i64
      %2113 = func.call @stack_pop_pointer() : () -> i64
      %2114 = func.call @cc_cons(%2113, %2112) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2115 = arith.addi %2114, %__rlasp_stack_elide_zero_124 : i64
      %2116 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2117 = arith.constant 11 : i64
      %2118 = func.call @cc_make_string(%2116, %2117) : (!llvm.ptr, i64) -> i64
      %2119 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2120 = arith.constant 7 : i64
      %2121 = func.call @cc_make_string(%2119, %2120) : (!llvm.ptr, i64) -> i64
      %2122 = func.call @cc_intern(%2118, %2121) : (i64, i64) -> i64
      %2123 = func.call @cc_nil_value() : () -> i64
      %2124 = func.call @cc_cons(%2122, %2123) : (i64, i64) -> i64
      %2125 = func.call @cc_values_pack(%2124) : (i64) -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2128 = arith.constant 4 : i64
      %2129 = func.call @cc_make_string(%2127, %2128) : (!llvm.ptr, i64) -> i64
      %2130 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2131 = arith.constant 7 : i64
      %2132 = func.call @cc_make_string(%2130, %2131) : (!llvm.ptr, i64) -> i64
      %2133 = func.call @cc_intern(%2129, %2132) : (i64, i64) -> i64
      %2134 = func.call @cc_nil_value() : () -> i64
      %2135 = func.call @cc_cons(%2133, %2134) : (i64, i64) -> i64
      %2136 = func.call @cc_values_pack(%2135) : (i64) -> i64
      %2137 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2138 = arith.constant 7 : i64
      %2139 = func.call @cc_make_string(%2137, %2138) : (!llvm.ptr, i64) -> i64
      %2140 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2141 = arith.constant 11 : i64
      %2142 = func.call @cc_make_string(%2140, %2141) : (!llvm.ptr, i64) -> i64
      %2143 = func.call @cc_intern(%2139, %2142) : (i64, i64) -> i64
      %2144 = func.call @cc_nil_value() : () -> i64
      %2145 = func.call @cc_cons(%2143, %2144) : (i64, i64) -> i64
      %2146 = func.call @cc_values_pack(%2145) : (i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2147 = arith.addi %2143, %__rlasp_stack_elide_zero_125 : i64
      %2148 = func.call @cc_nil_value() : () -> i64
      %2149 = func.call @cc_errorp(%1917) : (i64) -> i64
      %2150 = arith.cmpi ne, %2149, %2148 : i64
      %2151 = arith.cmpi eq, %2148, %2148 : i64
      %2152 = arith.andi %2150, %2151 : i1
      %2153 = scf.if %2152 -> (i64) {
        scf.yield %1917 : i64
      } else {
        scf.yield %2148 : i64
      }
      %2154 = func.call @cc_errorp(%2053) : (i64) -> i64
      %2155 = arith.cmpi ne, %2154, %2148 : i64
      %2156 = arith.cmpi eq, %2153, %2148 : i64
      %2157 = arith.andi %2155, %2156 : i1
      %2158 = scf.if %2157 -> (i64) {
        scf.yield %2053 : i64
      } else {
        scf.yield %2153 : i64
      }
      %2159 = func.call @cc_errorp(%2108) : (i64) -> i64
      %2160 = arith.cmpi ne, %2159, %2148 : i64
      %2161 = arith.cmpi eq, %2158, %2148 : i64
      %2162 = arith.andi %2160, %2161 : i1
      %2163 = scf.if %2162 -> (i64) {
        scf.yield %2108 : i64
      } else {
        scf.yield %2158 : i64
      }
      %2164 = func.call @cc_errorp(%2115) : (i64) -> i64
      %2165 = arith.cmpi ne, %2164, %2148 : i64
      %2166 = arith.cmpi eq, %2163, %2148 : i64
      %2167 = arith.andi %2165, %2166 : i1
      %2168 = scf.if %2167 -> (i64) {
        scf.yield %2115 : i64
      } else {
        scf.yield %2163 : i64
      }
      %2169 = func.call @cc_errorp(%2122) : (i64) -> i64
      %2170 = arith.cmpi ne, %2169, %2148 : i64
      %2171 = arith.cmpi eq, %2168, %2148 : i64
      %2172 = arith.andi %2170, %2171 : i1
      %2173 = scf.if %2172 -> (i64) {
        scf.yield %2122 : i64
      } else {
        scf.yield %2168 : i64
      }
      %2174 = func.call @cc_errorp(%2126) : (i64) -> i64
      %2175 = arith.cmpi ne, %2174, %2148 : i64
      %2176 = arith.cmpi eq, %2173, %2148 : i64
      %2177 = arith.andi %2175, %2176 : i1
      %2178 = scf.if %2177 -> (i64) {
        scf.yield %2126 : i64
      } else {
        scf.yield %2173 : i64
      }
      %2179 = func.call @cc_errorp(%2133) : (i64) -> i64
      %2180 = arith.cmpi ne, %2179, %2148 : i64
      %2181 = arith.cmpi eq, %2178, %2148 : i64
      %2182 = arith.andi %2180, %2181 : i1
      %2183 = scf.if %2182 -> (i64) {
        scf.yield %2133 : i64
      } else {
        scf.yield %2178 : i64
      }
      %2184 = func.call @cc_errorp(%2147) : (i64) -> i64
      %2185 = arith.cmpi ne, %2184, %2148 : i64
      %2186 = arith.cmpi eq, %2183, %2148 : i64
      %2187 = arith.andi %2185, %2186 : i1
      %2188 = scf.if %2187 -> (i64) {
        scf.yield %2147 : i64
      } else {
        scf.yield %2183 : i64
      }
      %2189 = arith.cmpi ne, %2188, %2148 : i64
      scf.if %2189 {
        func.call @stack_push_pointer(%2188) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1917) : (i64) -> ()
        func.call @stack_push_pointer(%2053) : (i64) -> ()
        func.call @stack_push_pointer(%2108) : (i64) -> ()
        func.call @stack_push_pointer(%2115) : (i64) -> ()
        func.call @stack_push_pointer(%2122) : (i64) -> ()
        func.call @stack_push_pointer(%2126) : (i64) -> ()
        func.call @stack_push_pointer(%2133) : (i64) -> ()
        func.call @stack_push_pointer(%2147) : (i64) -> ()
        %2190 = llvm.mlir.addressof @str192 : !llvm.ptr
        %2191 = func.call @cc_make_function_ref_const(%2190) : (!llvm.ptr) -> i64
        %2192 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2191, %2192) : (i64, i64) -> ()
      }
      %2193 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2193 : i64
    }
    %2194 = func.call @cc_nil_value() : () -> i64
    %2195 = func.call @cc_errorp(%1908) : (i64) -> i64
    %2196 = arith.cmpi ne, %2195, %2194 : i64
    %2197 = scf.if %2196 -> (i64) {
      scf.yield %1908 : i64
    } else {
      %2198 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2199 = arith.constant 14 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = func.call @cc_nil_value() : () -> i64
      %2202 = func.call @cc_intern(%2200, %2201) : (i64, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_cons(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_values_pack(%2204) : (i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2206 = arith.addi %2202, %__rlasp_stack_elide_zero_126 : i64
      %2207 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2208 = arith.constant 13 : i64
      %2209 = func.call @cc_make_string(%2207, %2208) : (!llvm.ptr, i64) -> i64
      %2210 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2211 = arith.constant 11 : i64
      %2212 = func.call @cc_make_string(%2210, %2211) : (!llvm.ptr, i64) -> i64
      %2213 = func.call @cc_intern(%2209, %2212) : (i64, i64) -> i64
      %2214 = func.call @cc_nil_value() : () -> i64
      %2215 = func.call @cc_cons(%2213, %2214) : (i64, i64) -> i64
      %2216 = func.call @cc_values_pack(%2215) : (i64) -> i64
      func.call @stack_push_pointer(%2213) : (i64) -> ()
      %2217 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2218 = arith.constant 6 : i64
      %2219 = func.call @cc_make_string(%2217, %2218) : (!llvm.ptr, i64) -> i64
      %2220 = func.call @cc_nil_value() : () -> i64
      %2221 = func.call @cc_intern(%2219, %2220) : (i64, i64) -> i64
      %2222 = func.call @cc_nil_value() : () -> i64
      %2223 = func.call @cc_cons(%2221, %2222) : (i64, i64) -> i64
      %2224 = func.call @cc_values_pack(%2223) : (i64) -> i64
      func.call @stack_push_pointer(%2221) : (i64) -> ()
      %2225 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2226 = arith.constant 19 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_nil_value() : () -> i64
      %2229 = func.call @cc_intern(%2227, %2228) : (i64, i64) -> i64
      %2230 = func.call @cc_nil_value() : () -> i64
      %2231 = func.call @cc_cons(%2229, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_values_pack(%2231) : (i64) -> i64
      func.call @stack_push_pointer(%2229) : (i64) -> ()
      %2233 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2234 = arith.constant 13 : i64
      %2235 = func.call @cc_make_string(%2233, %2234) : (!llvm.ptr, i64) -> i64
      %2236 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2237 = arith.constant 11 : i64
      %2238 = func.call @cc_make_string(%2236, %2237) : (!llvm.ptr, i64) -> i64
      %2239 = func.call @cc_intern(%2235, %2238) : (i64, i64) -> i64
      %2240 = func.call @cc_nil_value() : () -> i64
      %2241 = func.call @cc_cons(%2239, %2240) : (i64, i64) -> i64
      %2242 = func.call @cc_values_pack(%2241) : (i64) -> i64
      func.call @stack_push_pointer(%2239) : (i64) -> ()
      %2243 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2244 = arith.constant 7 : i64
      %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2246 = func.call @stack_pop_pointer() : () -> i64
      %2247 = func.call @stack_pop_pointer() : () -> i64
      %2248 = func.call @cc_cons(%2247, %2246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2249 = arith.addi %2248, %__rlasp_stack_elide_zero_127 : i64
      %2250 = func.call @stack_pop_pointer() : () -> i64
      %2251 = func.call @cc_cons(%2250, %2249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2251) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2252 = func.call @stack_pop_pointer() : () -> i64
      %2253 = func.call @stack_pop_pointer() : () -> i64
      %2254 = func.call @cc_cons(%2253, %2252) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2255 = arith.addi %2254, %__rlasp_stack_elide_zero_128 : i64
      %2256 = func.call @stack_pop_pointer() : () -> i64
      %2257 = func.call @cc_cons(%2256, %2255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2257) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2258 = func.call @stack_pop_pointer() : () -> i64
      %2259 = func.call @stack_pop_pointer() : () -> i64
      %2260 = func.call @cc_cons(%2259, %2258) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2261 = arith.addi %2260, %__rlasp_stack_elide_zero_129 : i64
      %2262 = func.call @stack_pop_pointer() : () -> i64
      %2263 = func.call @cc_cons(%2262, %2261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2264 = arith.addi %2263, %__rlasp_stack_elide_zero_130 : i64
      %2265 = func.call @stack_pop_pointer() : () -> i64
      %2266 = func.call @cc_cons(%2265, %2264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2267 = func.call @stack_pop_pointer() : () -> i64
      %2268 = func.call @stack_pop_pointer() : () -> i64
      %2269 = func.call @cc_cons(%2268, %2267) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2270 = arith.addi %2269, %__rlasp_stack_elide_zero_131 : i64
      %2271 = func.call @stack_pop_pointer() : () -> i64
      %2272 = func.call @cc_cons(%2271, %2270) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2273 = arith.addi %2272, %__rlasp_stack_elide_zero_132 : i64
      %2330 = arith.constant 122791386939401 : i64
      %2331 = arith.constant 0 : i64
      %2332 = func.call @cc_make_closure(%2330, %2331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2333 = arith.addi %2332, %__rlasp_stack_elide_zero_133 : i64
      %2334 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2335 = arith.constant 4 : i64
      %2336 = func.call @cc_make_string(%2334, %2335) : (!llvm.ptr, i64) -> i64
      %2337 = func.call @cc_nil_value() : () -> i64
      %2338 = func.call @cc_intern(%2336, %2337) : (i64, i64) -> i64
      %2339 = func.call @cc_nil_value() : () -> i64
      %2340 = func.call @cc_cons(%2338, %2339) : (i64, i64) -> i64
      %2341 = func.call @cc_values_pack(%2340) : (i64) -> i64
      func.call @stack_push_pointer(%2338) : (i64) -> ()
      %2342 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2343 = arith.constant 11 : i64
      %2344 = func.call @cc_make_string(%2342, %2343) : (!llvm.ptr, i64) -> i64
      %2345 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2346 = arith.constant 11 : i64
      %2347 = func.call @cc_make_string(%2345, %2346) : (!llvm.ptr, i64) -> i64
      %2348 = func.call @cc_intern(%2344, %2347) : (i64, i64) -> i64
      %2349 = func.call @cc_nil_value() : () -> i64
      %2350 = func.call @cc_cons(%2348, %2349) : (i64, i64) -> i64
      %2351 = func.call @cc_values_pack(%2350) : (i64) -> i64
      func.call @stack_push_pointer(%2348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2352 = func.call @stack_pop_pointer() : () -> i64
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @cc_cons(%2353, %2352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2355 = arith.addi %2354, %__rlasp_stack_elide_zero_134 : i64
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @cc_cons(%2356, %2355) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2358 = arith.addi %2357, %__rlasp_stack_elide_zero_135 : i64
      %2359 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2360 = arith.constant 11 : i64
      %2361 = func.call @cc_make_string(%2359, %2360) : (!llvm.ptr, i64) -> i64
      %2362 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2363 = arith.constant 7 : i64
      %2364 = func.call @cc_make_string(%2362, %2363) : (!llvm.ptr, i64) -> i64
      %2365 = func.call @cc_intern(%2361, %2364) : (i64, i64) -> i64
      %2366 = func.call @cc_nil_value() : () -> i64
      %2367 = func.call @cc_cons(%2365, %2366) : (i64, i64) -> i64
      %2368 = func.call @cc_values_pack(%2367) : (i64) -> i64
      %2369 = func.call @cc_nil_value() : () -> i64
      %2370 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2371 = arith.constant 4 : i64
      %2372 = func.call @cc_make_string(%2370, %2371) : (!llvm.ptr, i64) -> i64
      %2373 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2374 = arith.constant 7 : i64
      %2375 = func.call @cc_make_string(%2373, %2374) : (!llvm.ptr, i64) -> i64
      %2376 = func.call @cc_intern(%2372, %2375) : (i64, i64) -> i64
      %2377 = func.call @cc_nil_value() : () -> i64
      %2378 = func.call @cc_cons(%2376, %2377) : (i64, i64) -> i64
      %2379 = func.call @cc_values_pack(%2378) : (i64) -> i64
      %2380 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2381 = arith.constant 5 : i64
      %2382 = func.call @cc_make_string(%2380, %2381) : (!llvm.ptr, i64) -> i64
      %2383 = func.call @cc_nil_value() : () -> i64
      %2384 = func.call @cc_intern(%2382, %2383) : (i64, i64) -> i64
      %2385 = func.call @cc_nil_value() : () -> i64
      %2386 = func.call @cc_cons(%2384, %2385) : (i64, i64) -> i64
      %2387 = func.call @cc_values_pack(%2386) : (i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2388 = arith.addi %2384, %__rlasp_stack_elide_zero_136 : i64
      %2389 = func.call @cc_nil_value() : () -> i64
      %2390 = func.call @cc_errorp(%2206) : (i64) -> i64
      %2391 = arith.cmpi ne, %2390, %2389 : i64
      %2392 = arith.cmpi eq, %2389, %2389 : i64
      %2393 = arith.andi %2391, %2392 : i1
      %2394 = scf.if %2393 -> (i64) {
        scf.yield %2206 : i64
      } else {
        scf.yield %2389 : i64
      }
      %2395 = func.call @cc_errorp(%2273) : (i64) -> i64
      %2396 = arith.cmpi ne, %2395, %2389 : i64
      %2397 = arith.cmpi eq, %2394, %2389 : i64
      %2398 = arith.andi %2396, %2397 : i1
      %2399 = scf.if %2398 -> (i64) {
        scf.yield %2273 : i64
      } else {
        scf.yield %2394 : i64
      }
      %2400 = func.call @cc_errorp(%2333) : (i64) -> i64
      %2401 = arith.cmpi ne, %2400, %2389 : i64
      %2402 = arith.cmpi eq, %2399, %2389 : i64
      %2403 = arith.andi %2401, %2402 : i1
      %2404 = scf.if %2403 -> (i64) {
        scf.yield %2333 : i64
      } else {
        scf.yield %2399 : i64
      }
      %2405 = func.call @cc_errorp(%2358) : (i64) -> i64
      %2406 = arith.cmpi ne, %2405, %2389 : i64
      %2407 = arith.cmpi eq, %2404, %2389 : i64
      %2408 = arith.andi %2406, %2407 : i1
      %2409 = scf.if %2408 -> (i64) {
        scf.yield %2358 : i64
      } else {
        scf.yield %2404 : i64
      }
      %2410 = func.call @cc_errorp(%2365) : (i64) -> i64
      %2411 = arith.cmpi ne, %2410, %2389 : i64
      %2412 = arith.cmpi eq, %2409, %2389 : i64
      %2413 = arith.andi %2411, %2412 : i1
      %2414 = scf.if %2413 -> (i64) {
        scf.yield %2365 : i64
      } else {
        scf.yield %2409 : i64
      }
      %2415 = func.call @cc_errorp(%2369) : (i64) -> i64
      %2416 = arith.cmpi ne, %2415, %2389 : i64
      %2417 = arith.cmpi eq, %2414, %2389 : i64
      %2418 = arith.andi %2416, %2417 : i1
      %2419 = scf.if %2418 -> (i64) {
        scf.yield %2369 : i64
      } else {
        scf.yield %2414 : i64
      }
      %2420 = func.call @cc_errorp(%2376) : (i64) -> i64
      %2421 = arith.cmpi ne, %2420, %2389 : i64
      %2422 = arith.cmpi eq, %2419, %2389 : i64
      %2423 = arith.andi %2421, %2422 : i1
      %2424 = scf.if %2423 -> (i64) {
        scf.yield %2376 : i64
      } else {
        scf.yield %2419 : i64
      }
      %2425 = func.call @cc_errorp(%2388) : (i64) -> i64
      %2426 = arith.cmpi ne, %2425, %2389 : i64
      %2427 = arith.cmpi eq, %2424, %2389 : i64
      %2428 = arith.andi %2426, %2427 : i1
      %2429 = scf.if %2428 -> (i64) {
        scf.yield %2388 : i64
      } else {
        scf.yield %2424 : i64
      }
      %2430 = arith.cmpi ne, %2429, %2389 : i64
      scf.if %2430 {
        func.call @stack_push_pointer(%2429) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2206) : (i64) -> ()
        func.call @stack_push_pointer(%2273) : (i64) -> ()
        func.call @stack_push_pointer(%2333) : (i64) -> ()
        func.call @stack_push_pointer(%2358) : (i64) -> ()
        func.call @stack_push_pointer(%2365) : (i64) -> ()
        func.call @stack_push_pointer(%2369) : (i64) -> ()
        func.call @stack_push_pointer(%2376) : (i64) -> ()
        func.call @stack_push_pointer(%2388) : (i64) -> ()
        %2431 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2432 = func.call @cc_make_function_ref_const(%2431) : (!llvm.ptr) -> i64
        %2433 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2432, %2433) : (i64, i64) -> ()
      }
      %2434 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2434 : i64
    }
    %2435 = func.call @cc_nil_value() : () -> i64
    %2436 = func.call @cc_errorp(%2197) : (i64) -> i64
    %2437 = arith.cmpi ne, %2436, %2435 : i64
    %2438 = scf.if %2437 -> (i64) {
      scf.yield %2197 : i64
    } else {
      %2439 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2440 = arith.constant 14 : i64
      %2441 = func.call @cc_make_string(%2439, %2440) : (!llvm.ptr, i64) -> i64
      %2442 = func.call @cc_nil_value() : () -> i64
      %2443 = func.call @cc_intern(%2441, %2442) : (i64, i64) -> i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_cons(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_values_pack(%2445) : (i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2447 = arith.addi %2443, %__rlasp_stack_elide_zero_137 : i64
      %2448 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2449 = arith.constant 13 : i64
      %2450 = func.call @cc_make_string(%2448, %2449) : (!llvm.ptr, i64) -> i64
      %2451 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2452 = arith.constant 11 : i64
      %2453 = func.call @cc_make_string(%2451, %2452) : (!llvm.ptr, i64) -> i64
      %2454 = func.call @cc_intern(%2450, %2453) : (i64, i64) -> i64
      %2455 = func.call @cc_nil_value() : () -> i64
      %2456 = func.call @cc_cons(%2454, %2455) : (i64, i64) -> i64
      %2457 = func.call @cc_values_pack(%2456) : (i64) -> i64
      func.call @stack_push_pointer(%2454) : (i64) -> ()
      %2458 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2459 = arith.constant 5 : i64
      %2460 = func.call @cc_make_string(%2458, %2459) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2460) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = func.call @stack_pop_pointer() : () -> i64
      %2463 = func.call @cc_cons(%2462, %2461) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2464 = arith.addi %2463, %__rlasp_stack_elide_zero_138 : i64
      %2465 = func.call @stack_pop_pointer() : () -> i64
      %2466 = func.call @cc_cons(%2465, %2464) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2467 = arith.addi %2466, %__rlasp_stack_elide_zero_139 : i64
      %2487 = arith.constant 122791386939402 : i64
      %2488 = arith.constant 0 : i64
      %2489 = func.call @cc_make_closure(%2487, %2488) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2490 = arith.addi %2489, %__rlasp_stack_elide_zero_140 : i64
      %2491 = arith.constant 123 : i64
      func.call @stack_push_fixnum(%2491) : (i64) -> ()
      %2492 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2493 = func.call @stack_pop_pointer() : () -> i64
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = func.call @cc_cons(%2494, %2493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2496 = arith.addi %2495, %__rlasp_stack_elide_zero_141 : i64
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @cc_cons(%2497, %2496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2499 = arith.addi %2498, %__rlasp_stack_elide_zero_142 : i64
      %2500 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2501 = arith.constant 11 : i64
      %2502 = func.call @cc_make_string(%2500, %2501) : (!llvm.ptr, i64) -> i64
      %2503 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2504 = arith.constant 7 : i64
      %2505 = func.call @cc_make_string(%2503, %2504) : (!llvm.ptr, i64) -> i64
      %2506 = func.call @cc_intern(%2502, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_nil_value() : () -> i64
      %2508 = func.call @cc_cons(%2506, %2507) : (i64, i64) -> i64
      %2509 = func.call @cc_values_pack(%2508) : (i64) -> i64
      %2510 = func.call @cc_nil_value() : () -> i64
      %2511 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2512 = arith.constant 4 : i64
      %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
      %2514 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2515 = arith.constant 7 : i64
      %2516 = func.call @cc_make_string(%2514, %2515) : (!llvm.ptr, i64) -> i64
      %2517 = func.call @cc_intern(%2513, %2516) : (i64, i64) -> i64
      %2518 = func.call @cc_nil_value() : () -> i64
      %2519 = func.call @cc_cons(%2517, %2518) : (i64, i64) -> i64
      %2520 = func.call @cc_values_pack(%2519) : (i64) -> i64
      %2521 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2522 = arith.constant 6 : i64
      %2523 = func.call @cc_make_string(%2521, %2522) : (!llvm.ptr, i64) -> i64
      %2524 = func.call @cc_nil_value() : () -> i64
      %2525 = func.call @cc_intern(%2523, %2524) : (i64, i64) -> i64
      %2526 = func.call @cc_nil_value() : () -> i64
      %2527 = func.call @cc_cons(%2525, %2526) : (i64, i64) -> i64
      %2528 = func.call @cc_values_pack(%2527) : (i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2529 = arith.addi %2525, %__rlasp_stack_elide_zero_143 : i64
      %2530 = func.call @cc_nil_value() : () -> i64
      %2531 = func.call @cc_errorp(%2447) : (i64) -> i64
      %2532 = arith.cmpi ne, %2531, %2530 : i64
      %2533 = arith.cmpi eq, %2530, %2530 : i64
      %2534 = arith.andi %2532, %2533 : i1
      %2535 = scf.if %2534 -> (i64) {
        scf.yield %2447 : i64
      } else {
        scf.yield %2530 : i64
      }
      %2536 = func.call @cc_errorp(%2467) : (i64) -> i64
      %2537 = arith.cmpi ne, %2536, %2530 : i64
      %2538 = arith.cmpi eq, %2535, %2530 : i64
      %2539 = arith.andi %2537, %2538 : i1
      %2540 = scf.if %2539 -> (i64) {
        scf.yield %2467 : i64
      } else {
        scf.yield %2535 : i64
      }
      %2541 = func.call @cc_errorp(%2490) : (i64) -> i64
      %2542 = arith.cmpi ne, %2541, %2530 : i64
      %2543 = arith.cmpi eq, %2540, %2530 : i64
      %2544 = arith.andi %2542, %2543 : i1
      %2545 = scf.if %2544 -> (i64) {
        scf.yield %2490 : i64
      } else {
        scf.yield %2540 : i64
      }
      %2546 = func.call @cc_errorp(%2499) : (i64) -> i64
      %2547 = arith.cmpi ne, %2546, %2530 : i64
      %2548 = arith.cmpi eq, %2545, %2530 : i64
      %2549 = arith.andi %2547, %2548 : i1
      %2550 = scf.if %2549 -> (i64) {
        scf.yield %2499 : i64
      } else {
        scf.yield %2545 : i64
      }
      %2551 = func.call @cc_errorp(%2506) : (i64) -> i64
      %2552 = arith.cmpi ne, %2551, %2530 : i64
      %2553 = arith.cmpi eq, %2550, %2530 : i64
      %2554 = arith.andi %2552, %2553 : i1
      %2555 = scf.if %2554 -> (i64) {
        scf.yield %2506 : i64
      } else {
        scf.yield %2550 : i64
      }
      %2556 = func.call @cc_errorp(%2510) : (i64) -> i64
      %2557 = arith.cmpi ne, %2556, %2530 : i64
      %2558 = arith.cmpi eq, %2555, %2530 : i64
      %2559 = arith.andi %2557, %2558 : i1
      %2560 = scf.if %2559 -> (i64) {
        scf.yield %2510 : i64
      } else {
        scf.yield %2555 : i64
      }
      %2561 = func.call @cc_errorp(%2517) : (i64) -> i64
      %2562 = arith.cmpi ne, %2561, %2530 : i64
      %2563 = arith.cmpi eq, %2560, %2530 : i64
      %2564 = arith.andi %2562, %2563 : i1
      %2565 = scf.if %2564 -> (i64) {
        scf.yield %2517 : i64
      } else {
        scf.yield %2560 : i64
      }
      %2566 = func.call @cc_errorp(%2529) : (i64) -> i64
      %2567 = arith.cmpi ne, %2566, %2530 : i64
      %2568 = arith.cmpi eq, %2565, %2530 : i64
      %2569 = arith.andi %2567, %2568 : i1
      %2570 = scf.if %2569 -> (i64) {
        scf.yield %2529 : i64
      } else {
        scf.yield %2565 : i64
      }
      %2571 = arith.cmpi ne, %2570, %2530 : i64
      scf.if %2571 {
        func.call @stack_push_pointer(%2570) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2447) : (i64) -> ()
        func.call @stack_push_pointer(%2467) : (i64) -> ()
        func.call @stack_push_pointer(%2490) : (i64) -> ()
        func.call @stack_push_pointer(%2499) : (i64) -> ()
        func.call @stack_push_pointer(%2506) : (i64) -> ()
        func.call @stack_push_pointer(%2510) : (i64) -> ()
        func.call @stack_push_pointer(%2517) : (i64) -> ()
        func.call @stack_push_pointer(%2529) : (i64) -> ()
        %2572 = llvm.mlir.addressof @str223 : !llvm.ptr
        %2573 = func.call @cc_make_function_ref_const(%2572) : (!llvm.ptr) -> i64
        %2574 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2573, %2574) : (i64, i64) -> ()
      }
      %2575 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2575 : i64
    }
    %2576 = func.call @cc_nil_value() : () -> i64
    %2577 = func.call @cc_errorp(%2438) : (i64) -> i64
    %2578 = arith.cmpi ne, %2577, %2576 : i64
    %2579 = scf.if %2578 -> (i64) {
      scf.yield %2438 : i64
    } else {
      %2580 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2581 = arith.constant 14 : i64
      %2582 = func.call @cc_make_string(%2580, %2581) : (!llvm.ptr, i64) -> i64
      %2583 = func.call @cc_nil_value() : () -> i64
      %2584 = func.call @cc_intern(%2582, %2583) : (i64, i64) -> i64
      %2585 = func.call @cc_nil_value() : () -> i64
      %2586 = func.call @cc_cons(%2584, %2585) : (i64, i64) -> i64
      %2587 = func.call @cc_values_pack(%2586) : (i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2588 = arith.addi %2584, %__rlasp_stack_elide_zero_144 : i64
      %2589 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2590 = arith.constant 13 : i64
      %2591 = func.call @cc_make_string(%2589, %2590) : (!llvm.ptr, i64) -> i64
      %2592 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2593 = arith.constant 11 : i64
      %2594 = func.call @cc_make_string(%2592, %2593) : (!llvm.ptr, i64) -> i64
      %2595 = func.call @cc_intern(%2591, %2594) : (i64, i64) -> i64
      %2596 = func.call @cc_nil_value() : () -> i64
      %2597 = func.call @cc_cons(%2595, %2596) : (i64, i64) -> i64
      %2598 = func.call @cc_values_pack(%2597) : (i64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      %2599 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2600 = arith.constant 6 : i64
      %2601 = func.call @cc_make_string(%2599, %2600) : (!llvm.ptr, i64) -> i64
      %2602 = func.call @cc_nil_value() : () -> i64
      %2603 = func.call @cc_intern(%2601, %2602) : (i64, i64) -> i64
      %2604 = func.call @cc_nil_value() : () -> i64
      %2605 = func.call @cc_cons(%2603, %2604) : (i64, i64) -> i64
      %2606 = func.call @cc_values_pack(%2605) : (i64) -> i64
      func.call @stack_push_pointer(%2603) : (i64) -> ()
      %2607 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2608 = arith.constant 19 : i64
      %2609 = func.call @cc_make_string(%2607, %2608) : (!llvm.ptr, i64) -> i64
      %2610 = func.call @cc_nil_value() : () -> i64
      %2611 = func.call @cc_intern(%2609, %2610) : (i64, i64) -> i64
      %2612 = func.call @cc_nil_value() : () -> i64
      %2613 = func.call @cc_cons(%2611, %2612) : (i64, i64) -> i64
      %2614 = func.call @cc_values_pack(%2613) : (i64) -> i64
      func.call @stack_push_pointer(%2611) : (i64) -> ()
      %2615 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2616 = arith.constant 13 : i64
      %2617 = func.call @cc_make_string(%2615, %2616) : (!llvm.ptr, i64) -> i64
      %2618 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2619 = arith.constant 11 : i64
      %2620 = func.call @cc_make_string(%2618, %2619) : (!llvm.ptr, i64) -> i64
      %2621 = func.call @cc_intern(%2617, %2620) : (i64, i64) -> i64
      %2622 = func.call @cc_nil_value() : () -> i64
      %2623 = func.call @cc_cons(%2621, %2622) : (i64, i64) -> i64
      %2624 = func.call @cc_values_pack(%2623) : (i64) -> i64
      func.call @stack_push_pointer(%2621) : (i64) -> ()
      %2625 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2626 = arith.constant 7 : i64
      %2627 = func.call @cc_make_string(%2625, %2626) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2628 = func.call @stack_pop_pointer() : () -> i64
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_cons(%2629, %2628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2631 = arith.addi %2630, %__rlasp_stack_elide_zero_145 : i64
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @cc_cons(%2632, %2631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2633) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2634 = func.call @stack_pop_pointer() : () -> i64
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = func.call @cc_cons(%2635, %2634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2637 = arith.addi %2636, %__rlasp_stack_elide_zero_146 : i64
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @cc_cons(%2638, %2637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2643 = arith.addi %2642, %__rlasp_stack_elide_zero_147 : i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2646 = arith.addi %2645, %__rlasp_stack_elide_zero_148 : i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = func.call @cc_cons(%2647, %2646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2649 = func.call @stack_pop_pointer() : () -> i64
      %2650 = func.call @stack_pop_pointer() : () -> i64
      %2651 = func.call @cc_cons(%2650, %2649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %2652 = arith.addi %2651, %__rlasp_stack_elide_zero_149 : i64
      %2653 = func.call @stack_pop_pointer() : () -> i64
      %2654 = func.call @cc_cons(%2653, %2652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %2655 = arith.addi %2654, %__rlasp_stack_elide_zero_150 : i64
      %2712 = arith.constant 122791386939403 : i64
      %2713 = arith.constant 0 : i64
      %2714 = func.call @cc_make_closure(%2712, %2713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %2715 = arith.addi %2714, %__rlasp_stack_elide_zero_151 : i64
      %2716 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2717 = arith.constant 4 : i64
      %2718 = func.call @cc_make_string(%2716, %2717) : (!llvm.ptr, i64) -> i64
      %2719 = func.call @cc_nil_value() : () -> i64
      %2720 = func.call @cc_intern(%2718, %2719) : (i64, i64) -> i64
      %2721 = func.call @cc_nil_value() : () -> i64
      %2722 = func.call @cc_cons(%2720, %2721) : (i64, i64) -> i64
      %2723 = func.call @cc_values_pack(%2722) : (i64) -> i64
      func.call @stack_push_pointer(%2720) : (i64) -> ()
      %2724 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2725 = arith.constant 11 : i64
      %2726 = func.call @cc_make_string(%2724, %2725) : (!llvm.ptr, i64) -> i64
      %2727 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2728 = arith.constant 11 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = func.call @cc_intern(%2726, %2729) : (i64, i64) -> i64
      %2731 = func.call @cc_nil_value() : () -> i64
      %2732 = func.call @cc_cons(%2730, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_values_pack(%2732) : (i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @cc_cons(%2735, %2734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %2737 = arith.addi %2736, %__rlasp_stack_elide_zero_152 : i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %2740 = arith.addi %2739, %__rlasp_stack_elide_zero_153 : i64
      %2741 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2742 = arith.constant 11 : i64
      %2743 = func.call @cc_make_string(%2741, %2742) : (!llvm.ptr, i64) -> i64
      %2744 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2745 = arith.constant 7 : i64
      %2746 = func.call @cc_make_string(%2744, %2745) : (!llvm.ptr, i64) -> i64
      %2747 = func.call @cc_intern(%2743, %2746) : (i64, i64) -> i64
      %2748 = func.call @cc_nil_value() : () -> i64
      %2749 = func.call @cc_cons(%2747, %2748) : (i64, i64) -> i64
      %2750 = func.call @cc_values_pack(%2749) : (i64) -> i64
      %2751 = func.call @cc_nil_value() : () -> i64
      %2752 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2753 = arith.constant 4 : i64
      %2754 = func.call @cc_make_string(%2752, %2753) : (!llvm.ptr, i64) -> i64
      %2755 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2756 = arith.constant 7 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = func.call @cc_intern(%2754, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_nil_value() : () -> i64
      %2760 = func.call @cc_cons(%2758, %2759) : (i64, i64) -> i64
      %2761 = func.call @cc_values_pack(%2760) : (i64) -> i64
      %2762 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2763 = arith.constant 5 : i64
      %2764 = func.call @cc_make_string(%2762, %2763) : (!llvm.ptr, i64) -> i64
      %2765 = func.call @cc_nil_value() : () -> i64
      %2766 = func.call @cc_intern(%2764, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_nil_value() : () -> i64
      %2768 = func.call @cc_cons(%2766, %2767) : (i64, i64) -> i64
      %2769 = func.call @cc_values_pack(%2768) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %2770 = arith.addi %2766, %__rlasp_stack_elide_zero_154 : i64
      %2771 = func.call @cc_nil_value() : () -> i64
      %2772 = func.call @cc_errorp(%2588) : (i64) -> i64
      %2773 = arith.cmpi ne, %2772, %2771 : i64
      %2774 = arith.cmpi eq, %2771, %2771 : i64
      %2775 = arith.andi %2773, %2774 : i1
      %2776 = scf.if %2775 -> (i64) {
        scf.yield %2588 : i64
      } else {
        scf.yield %2771 : i64
      }
      %2777 = func.call @cc_errorp(%2655) : (i64) -> i64
      %2778 = arith.cmpi ne, %2777, %2771 : i64
      %2779 = arith.cmpi eq, %2776, %2771 : i64
      %2780 = arith.andi %2778, %2779 : i1
      %2781 = scf.if %2780 -> (i64) {
        scf.yield %2655 : i64
      } else {
        scf.yield %2776 : i64
      }
      %2782 = func.call @cc_errorp(%2715) : (i64) -> i64
      %2783 = arith.cmpi ne, %2782, %2771 : i64
      %2784 = arith.cmpi eq, %2781, %2771 : i64
      %2785 = arith.andi %2783, %2784 : i1
      %2786 = scf.if %2785 -> (i64) {
        scf.yield %2715 : i64
      } else {
        scf.yield %2781 : i64
      }
      %2787 = func.call @cc_errorp(%2740) : (i64) -> i64
      %2788 = arith.cmpi ne, %2787, %2771 : i64
      %2789 = arith.cmpi eq, %2786, %2771 : i64
      %2790 = arith.andi %2788, %2789 : i1
      %2791 = scf.if %2790 -> (i64) {
        scf.yield %2740 : i64
      } else {
        scf.yield %2786 : i64
      }
      %2792 = func.call @cc_errorp(%2747) : (i64) -> i64
      %2793 = arith.cmpi ne, %2792, %2771 : i64
      %2794 = arith.cmpi eq, %2791, %2771 : i64
      %2795 = arith.andi %2793, %2794 : i1
      %2796 = scf.if %2795 -> (i64) {
        scf.yield %2747 : i64
      } else {
        scf.yield %2791 : i64
      }
      %2797 = func.call @cc_errorp(%2751) : (i64) -> i64
      %2798 = arith.cmpi ne, %2797, %2771 : i64
      %2799 = arith.cmpi eq, %2796, %2771 : i64
      %2800 = arith.andi %2798, %2799 : i1
      %2801 = scf.if %2800 -> (i64) {
        scf.yield %2751 : i64
      } else {
        scf.yield %2796 : i64
      }
      %2802 = func.call @cc_errorp(%2758) : (i64) -> i64
      %2803 = arith.cmpi ne, %2802, %2771 : i64
      %2804 = arith.cmpi eq, %2801, %2771 : i64
      %2805 = arith.andi %2803, %2804 : i1
      %2806 = scf.if %2805 -> (i64) {
        scf.yield %2758 : i64
      } else {
        scf.yield %2801 : i64
      }
      %2807 = func.call @cc_errorp(%2770) : (i64) -> i64
      %2808 = arith.cmpi ne, %2807, %2771 : i64
      %2809 = arith.cmpi eq, %2806, %2771 : i64
      %2810 = arith.andi %2808, %2809 : i1
      %2811 = scf.if %2810 -> (i64) {
        scf.yield %2770 : i64
      } else {
        scf.yield %2806 : i64
      }
      %2812 = arith.cmpi ne, %2811, %2771 : i64
      scf.if %2812 {
        func.call @stack_push_pointer(%2811) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2588) : (i64) -> ()
        func.call @stack_push_pointer(%2655) : (i64) -> ()
        func.call @stack_push_pointer(%2715) : (i64) -> ()
        func.call @stack_push_pointer(%2740) : (i64) -> ()
        func.call @stack_push_pointer(%2747) : (i64) -> ()
        func.call @stack_push_pointer(%2751) : (i64) -> ()
        func.call @stack_push_pointer(%2758) : (i64) -> ()
        func.call @stack_push_pointer(%2770) : (i64) -> ()
        %2813 = llvm.mlir.addressof @str242 : !llvm.ptr
        %2814 = func.call @cc_make_function_ref_const(%2813) : (!llvm.ptr) -> i64
        %2815 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2814, %2815) : (i64, i64) -> ()
      }
      %2816 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2816 : i64
    }
    %2817 = func.call @cc_nil_value() : () -> i64
    %2818 = func.call @cc_errorp(%2579) : (i64) -> i64
    %2819 = arith.cmpi ne, %2818, %2817 : i64
    %2820 = scf.if %2819 -> (i64) {
      scf.yield %2579 : i64
    } else {
      %2821 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2822 = arith.constant 14 : i64
      %2823 = func.call @cc_make_string(%2821, %2822) : (!llvm.ptr, i64) -> i64
      %2824 = func.call @cc_nil_value() : () -> i64
      %2825 = func.call @cc_intern(%2823, %2824) : (i64, i64) -> i64
      %2826 = func.call @cc_nil_value() : () -> i64
      %2827 = func.call @cc_cons(%2825, %2826) : (i64, i64) -> i64
      %2828 = func.call @cc_values_pack(%2827) : (i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %2829 = arith.addi %2825, %__rlasp_stack_elide_zero_155 : i64
      %2830 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2831 = arith.constant 13 : i64
      %2832 = func.call @cc_make_string(%2830, %2831) : (!llvm.ptr, i64) -> i64
      %2833 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2834 = arith.constant 11 : i64
      %2835 = func.call @cc_make_string(%2833, %2834) : (!llvm.ptr, i64) -> i64
      %2836 = func.call @cc_intern(%2832, %2835) : (i64, i64) -> i64
      %2837 = func.call @cc_nil_value() : () -> i64
      %2838 = func.call @cc_cons(%2836, %2837) : (i64, i64) -> i64
      %2839 = func.call @cc_values_pack(%2838) : (i64) -> i64
      func.call @stack_push_pointer(%2836) : (i64) -> ()
      %2840 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2841 = arith.constant 6 : i64
      %2842 = func.call @cc_make_string(%2840, %2841) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2842) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2843 = func.call @stack_pop_pointer() : () -> i64
      %2844 = func.call @stack_pop_pointer() : () -> i64
      %2845 = func.call @cc_cons(%2844, %2843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %2846 = arith.addi %2845, %__rlasp_stack_elide_zero_156 : i64
      %2847 = func.call @stack_pop_pointer() : () -> i64
      %2848 = func.call @cc_cons(%2847, %2846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %2849 = arith.addi %2848, %__rlasp_stack_elide_zero_157 : i64
      %2869 = arith.constant 122791386939404 : i64
      %2870 = arith.constant 0 : i64
      %2871 = func.call @cc_make_closure(%2869, %2870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %2872 = arith.addi %2871, %__rlasp_stack_elide_zero_158 : i64
      %2873 = arith.constant 123 : i64
      func.call @stack_push_fixnum(%2873) : (i64) -> ()
      %2874 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%2874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2875 = func.call @stack_pop_pointer() : () -> i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2876, %2875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %2878 = arith.addi %2877, %__rlasp_stack_elide_zero_159 : i64
      %2879 = func.call @stack_pop_pointer() : () -> i64
      %2880 = func.call @cc_cons(%2879, %2878) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %2881 = arith.addi %2880, %__rlasp_stack_elide_zero_160 : i64
      %2882 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2883 = arith.constant 11 : i64
      %2884 = func.call @cc_make_string(%2882, %2883) : (!llvm.ptr, i64) -> i64
      %2885 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2886 = arith.constant 7 : i64
      %2887 = func.call @cc_make_string(%2885, %2886) : (!llvm.ptr, i64) -> i64
      %2888 = func.call @cc_intern(%2884, %2887) : (i64, i64) -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = func.call @cc_cons(%2888, %2889) : (i64, i64) -> i64
      %2891 = func.call @cc_values_pack(%2890) : (i64) -> i64
      %2892 = func.call @cc_nil_value() : () -> i64
      %2893 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2894 = arith.constant 4 : i64
      %2895 = func.call @cc_make_string(%2893, %2894) : (!llvm.ptr, i64) -> i64
      %2896 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2897 = arith.constant 7 : i64
      %2898 = func.call @cc_make_string(%2896, %2897) : (!llvm.ptr, i64) -> i64
      %2899 = func.call @cc_intern(%2895, %2898) : (i64, i64) -> i64
      %2900 = func.call @cc_nil_value() : () -> i64
      %2901 = func.call @cc_cons(%2899, %2900) : (i64, i64) -> i64
      %2902 = func.call @cc_values_pack(%2901) : (i64) -> i64
      %2903 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2904 = arith.constant 6 : i64
      %2905 = func.call @cc_make_string(%2903, %2904) : (!llvm.ptr, i64) -> i64
      %2906 = func.call @cc_nil_value() : () -> i64
      %2907 = func.call @cc_intern(%2905, %2906) : (i64, i64) -> i64
      %2908 = func.call @cc_nil_value() : () -> i64
      %2909 = func.call @cc_cons(%2907, %2908) : (i64, i64) -> i64
      %2910 = func.call @cc_values_pack(%2909) : (i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %2911 = arith.addi %2907, %__rlasp_stack_elide_zero_161 : i64
      %2912 = func.call @cc_nil_value() : () -> i64
      %2913 = func.call @cc_errorp(%2829) : (i64) -> i64
      %2914 = arith.cmpi ne, %2913, %2912 : i64
      %2915 = arith.cmpi eq, %2912, %2912 : i64
      %2916 = arith.andi %2914, %2915 : i1
      %2917 = scf.if %2916 -> (i64) {
        scf.yield %2829 : i64
      } else {
        scf.yield %2912 : i64
      }
      %2918 = func.call @cc_errorp(%2849) : (i64) -> i64
      %2919 = arith.cmpi ne, %2918, %2912 : i64
      %2920 = arith.cmpi eq, %2917, %2912 : i64
      %2921 = arith.andi %2919, %2920 : i1
      %2922 = scf.if %2921 -> (i64) {
        scf.yield %2849 : i64
      } else {
        scf.yield %2917 : i64
      }
      %2923 = func.call @cc_errorp(%2872) : (i64) -> i64
      %2924 = arith.cmpi ne, %2923, %2912 : i64
      %2925 = arith.cmpi eq, %2922, %2912 : i64
      %2926 = arith.andi %2924, %2925 : i1
      %2927 = scf.if %2926 -> (i64) {
        scf.yield %2872 : i64
      } else {
        scf.yield %2922 : i64
      }
      %2928 = func.call @cc_errorp(%2881) : (i64) -> i64
      %2929 = arith.cmpi ne, %2928, %2912 : i64
      %2930 = arith.cmpi eq, %2927, %2912 : i64
      %2931 = arith.andi %2929, %2930 : i1
      %2932 = scf.if %2931 -> (i64) {
        scf.yield %2881 : i64
      } else {
        scf.yield %2927 : i64
      }
      %2933 = func.call @cc_errorp(%2888) : (i64) -> i64
      %2934 = arith.cmpi ne, %2933, %2912 : i64
      %2935 = arith.cmpi eq, %2932, %2912 : i64
      %2936 = arith.andi %2934, %2935 : i1
      %2937 = scf.if %2936 -> (i64) {
        scf.yield %2888 : i64
      } else {
        scf.yield %2932 : i64
      }
      %2938 = func.call @cc_errorp(%2892) : (i64) -> i64
      %2939 = arith.cmpi ne, %2938, %2912 : i64
      %2940 = arith.cmpi eq, %2937, %2912 : i64
      %2941 = arith.andi %2939, %2940 : i1
      %2942 = scf.if %2941 -> (i64) {
        scf.yield %2892 : i64
      } else {
        scf.yield %2937 : i64
      }
      %2943 = func.call @cc_errorp(%2899) : (i64) -> i64
      %2944 = arith.cmpi ne, %2943, %2912 : i64
      %2945 = arith.cmpi eq, %2942, %2912 : i64
      %2946 = arith.andi %2944, %2945 : i1
      %2947 = scf.if %2946 -> (i64) {
        scf.yield %2899 : i64
      } else {
        scf.yield %2942 : i64
      }
      %2948 = func.call @cc_errorp(%2911) : (i64) -> i64
      %2949 = arith.cmpi ne, %2948, %2912 : i64
      %2950 = arith.cmpi eq, %2947, %2912 : i64
      %2951 = arith.andi %2949, %2950 : i1
      %2952 = scf.if %2951 -> (i64) {
        scf.yield %2911 : i64
      } else {
        scf.yield %2947 : i64
      }
      %2953 = arith.cmpi ne, %2952, %2912 : i64
      scf.if %2953 {
        func.call @stack_push_pointer(%2952) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2829) : (i64) -> ()
        func.call @stack_push_pointer(%2849) : (i64) -> ()
        func.call @stack_push_pointer(%2872) : (i64) -> ()
        func.call @stack_push_pointer(%2881) : (i64) -> ()
        func.call @stack_push_pointer(%2888) : (i64) -> ()
        func.call @stack_push_pointer(%2892) : (i64) -> ()
        func.call @stack_push_pointer(%2899) : (i64) -> ()
        func.call @stack_push_pointer(%2911) : (i64) -> ()
        %2954 = llvm.mlir.addressof @str254 : !llvm.ptr
        %2955 = func.call @cc_make_function_ref_const(%2954) : (!llvm.ptr) -> i64
        %2956 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2955, %2956) : (i64, i64) -> ()
      }
      %2957 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2957 : i64
    }
    %2958 = func.call @cc_nil_value() : () -> i64
    %2959 = func.call @cc_errorp(%2820) : (i64) -> i64
    %2960 = arith.cmpi ne, %2959, %2958 : i64
    %2961 = scf.if %2960 -> (i64) {
      scf.yield %2820 : i64
    } else {
      %2962 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2963 = arith.constant 15 : i64
      %2964 = func.call @cc_make_string(%2962, %2963) : (!llvm.ptr, i64) -> i64
      %2965 = func.call @cc_nil_value() : () -> i64
      %2966 = func.call @cc_intern(%2964, %2965) : (i64, i64) -> i64
      %2967 = func.call @cc_nil_value() : () -> i64
      %2968 = func.call @cc_cons(%2966, %2967) : (i64, i64) -> i64
      %2969 = func.call @cc_values_pack(%2968) : (i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %2970 = arith.addi %2966, %__rlasp_stack_elide_zero_162 : i64
      %2971 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2972 = arith.constant 13 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2975 = arith.constant 11 : i64
      %2976 = func.call @cc_make_string(%2974, %2975) : (!llvm.ptr, i64) -> i64
      %2977 = func.call @cc_intern(%2973, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_nil_value() : () -> i64
      %2979 = func.call @cc_cons(%2977, %2978) : (i64, i64) -> i64
      %2980 = func.call @cc_values_pack(%2979) : (i64) -> i64
      func.call @stack_push_pointer(%2977) : (i64) -> ()
      %2981 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2982 = arith.constant 6 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @stack_pop_pointer() : () -> i64
      %2986 = func.call @cc_cons(%2985, %2984) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %2987 = arith.addi %2986, %__rlasp_stack_elide_zero_163 : i64
      %2988 = func.call @stack_pop_pointer() : () -> i64
      %2989 = func.call @cc_cons(%2988, %2987) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %2990 = arith.addi %2989, %__rlasp_stack_elide_zero_164 : i64
      %3010 = arith.constant 122791386939405 : i64
      %3011 = arith.constant 0 : i64
      %3012 = func.call @cc_make_closure(%3010, %3011) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3013 = arith.addi %3012, %__rlasp_stack_elide_zero_165 : i64
      %3014 = arith.constant -123 : i64
      func.call @stack_push_fixnum(%3014) : (i64) -> ()
      %3015 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%3015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3016 = func.call @stack_pop_pointer() : () -> i64
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = func.call @cc_cons(%3017, %3016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3019 = arith.addi %3018, %__rlasp_stack_elide_zero_166 : i64
      %3020 = func.call @stack_pop_pointer() : () -> i64
      %3021 = func.call @cc_cons(%3020, %3019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3022 = arith.addi %3021, %__rlasp_stack_elide_zero_167 : i64
      %3023 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3024 = arith.constant 11 : i64
      %3025 = func.call @cc_make_string(%3023, %3024) : (!llvm.ptr, i64) -> i64
      %3026 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3027 = arith.constant 7 : i64
      %3028 = func.call @cc_make_string(%3026, %3027) : (!llvm.ptr, i64) -> i64
      %3029 = func.call @cc_intern(%3025, %3028) : (i64, i64) -> i64
      %3030 = func.call @cc_nil_value() : () -> i64
      %3031 = func.call @cc_cons(%3029, %3030) : (i64, i64) -> i64
      %3032 = func.call @cc_values_pack(%3031) : (i64) -> i64
      %3033 = func.call @cc_nil_value() : () -> i64
      %3034 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3035 = arith.constant 4 : i64
      %3036 = func.call @cc_make_string(%3034, %3035) : (!llvm.ptr, i64) -> i64
      %3037 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3038 = arith.constant 7 : i64
      %3039 = func.call @cc_make_string(%3037, %3038) : (!llvm.ptr, i64) -> i64
      %3040 = func.call @cc_intern(%3036, %3039) : (i64, i64) -> i64
      %3041 = func.call @cc_nil_value() : () -> i64
      %3042 = func.call @cc_cons(%3040, %3041) : (i64, i64) -> i64
      %3043 = func.call @cc_values_pack(%3042) : (i64) -> i64
      %3044 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3045 = arith.constant 6 : i64
      %3046 = func.call @cc_make_string(%3044, %3045) : (!llvm.ptr, i64) -> i64
      %3047 = func.call @cc_nil_value() : () -> i64
      %3048 = func.call @cc_intern(%3046, %3047) : (i64, i64) -> i64
      %3049 = func.call @cc_nil_value() : () -> i64
      %3050 = func.call @cc_cons(%3048, %3049) : (i64, i64) -> i64
      %3051 = func.call @cc_values_pack(%3050) : (i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3052 = arith.addi %3048, %__rlasp_stack_elide_zero_168 : i64
      %3053 = func.call @cc_nil_value() : () -> i64
      %3054 = func.call @cc_errorp(%2970) : (i64) -> i64
      %3055 = arith.cmpi ne, %3054, %3053 : i64
      %3056 = arith.cmpi eq, %3053, %3053 : i64
      %3057 = arith.andi %3055, %3056 : i1
      %3058 = scf.if %3057 -> (i64) {
        scf.yield %2970 : i64
      } else {
        scf.yield %3053 : i64
      }
      %3059 = func.call @cc_errorp(%2990) : (i64) -> i64
      %3060 = arith.cmpi ne, %3059, %3053 : i64
      %3061 = arith.cmpi eq, %3058, %3053 : i64
      %3062 = arith.andi %3060, %3061 : i1
      %3063 = scf.if %3062 -> (i64) {
        scf.yield %2990 : i64
      } else {
        scf.yield %3058 : i64
      }
      %3064 = func.call @cc_errorp(%3013) : (i64) -> i64
      %3065 = arith.cmpi ne, %3064, %3053 : i64
      %3066 = arith.cmpi eq, %3063, %3053 : i64
      %3067 = arith.andi %3065, %3066 : i1
      %3068 = scf.if %3067 -> (i64) {
        scf.yield %3013 : i64
      } else {
        scf.yield %3063 : i64
      }
      %3069 = func.call @cc_errorp(%3022) : (i64) -> i64
      %3070 = arith.cmpi ne, %3069, %3053 : i64
      %3071 = arith.cmpi eq, %3068, %3053 : i64
      %3072 = arith.andi %3070, %3071 : i1
      %3073 = scf.if %3072 -> (i64) {
        scf.yield %3022 : i64
      } else {
        scf.yield %3068 : i64
      }
      %3074 = func.call @cc_errorp(%3029) : (i64) -> i64
      %3075 = arith.cmpi ne, %3074, %3053 : i64
      %3076 = arith.cmpi eq, %3073, %3053 : i64
      %3077 = arith.andi %3075, %3076 : i1
      %3078 = scf.if %3077 -> (i64) {
        scf.yield %3029 : i64
      } else {
        scf.yield %3073 : i64
      }
      %3079 = func.call @cc_errorp(%3033) : (i64) -> i64
      %3080 = arith.cmpi ne, %3079, %3053 : i64
      %3081 = arith.cmpi eq, %3078, %3053 : i64
      %3082 = arith.andi %3080, %3081 : i1
      %3083 = scf.if %3082 -> (i64) {
        scf.yield %3033 : i64
      } else {
        scf.yield %3078 : i64
      }
      %3084 = func.call @cc_errorp(%3040) : (i64) -> i64
      %3085 = arith.cmpi ne, %3084, %3053 : i64
      %3086 = arith.cmpi eq, %3083, %3053 : i64
      %3087 = arith.andi %3085, %3086 : i1
      %3088 = scf.if %3087 -> (i64) {
        scf.yield %3040 : i64
      } else {
        scf.yield %3083 : i64
      }
      %3089 = func.call @cc_errorp(%3052) : (i64) -> i64
      %3090 = arith.cmpi ne, %3089, %3053 : i64
      %3091 = arith.cmpi eq, %3088, %3053 : i64
      %3092 = arith.andi %3090, %3091 : i1
      %3093 = scf.if %3092 -> (i64) {
        scf.yield %3052 : i64
      } else {
        scf.yield %3088 : i64
      }
      %3094 = arith.cmpi ne, %3093, %3053 : i64
      scf.if %3094 {
        func.call @stack_push_pointer(%3093) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2970) : (i64) -> ()
        func.call @stack_push_pointer(%2990) : (i64) -> ()
        func.call @stack_push_pointer(%3013) : (i64) -> ()
        func.call @stack_push_pointer(%3022) : (i64) -> ()
        func.call @stack_push_pointer(%3029) : (i64) -> ()
        func.call @stack_push_pointer(%3033) : (i64) -> ()
        func.call @stack_push_pointer(%3040) : (i64) -> ()
        func.call @stack_push_pointer(%3052) : (i64) -> ()
        %3095 = llvm.mlir.addressof @str266 : !llvm.ptr
        %3096 = func.call @cc_make_function_ref_const(%3095) : (!llvm.ptr) -> i64
        %3097 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3096, %3097) : (i64, i64) -> ()
      }
      %3098 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3098 : i64
    }
    %3099 = func.call @cc_nil_value() : () -> i64
    %3100 = func.call @cc_errorp(%2961) : (i64) -> i64
    %3101 = arith.cmpi ne, %3100, %3099 : i64
    %3102 = scf.if %3101 -> (i64) {
      scf.yield %2961 : i64
    } else {
      %3103 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3104 = arith.constant 14 : i64
      %3105 = func.call @cc_make_string(%3103, %3104) : (!llvm.ptr, i64) -> i64
      %3106 = func.call @cc_nil_value() : () -> i64
      %3107 = func.call @cc_intern(%3105, %3106) : (i64, i64) -> i64
      %3108 = func.call @cc_nil_value() : () -> i64
      %3109 = func.call @cc_cons(%3107, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_values_pack(%3109) : (i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3111 = arith.addi %3107, %__rlasp_stack_elide_zero_169 : i64
      %3112 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3113 = arith.constant 13 : i64
      %3114 = func.call @cc_make_string(%3112, %3113) : (!llvm.ptr, i64) -> i64
      %3115 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3116 = arith.constant 11 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = func.call @cc_intern(%3114, %3117) : (i64, i64) -> i64
      %3119 = func.call @cc_nil_value() : () -> i64
      %3120 = func.call @cc_cons(%3118, %3119) : (i64, i64) -> i64
      %3121 = func.call @cc_values_pack(%3120) : (i64) -> i64
      func.call @stack_push_pointer(%3118) : (i64) -> ()
      %3122 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3123 = arith.constant 6 : i64
      %3124 = func.call @cc_make_string(%3122, %3123) : (!llvm.ptr, i64) -> i64
      %3125 = func.call @cc_nil_value() : () -> i64
      %3126 = func.call @cc_intern(%3124, %3125) : (i64, i64) -> i64
      %3127 = func.call @cc_nil_value() : () -> i64
      %3128 = func.call @cc_cons(%3126, %3127) : (i64, i64) -> i64
      %3129 = func.call @cc_values_pack(%3128) : (i64) -> i64
      func.call @stack_push_pointer(%3126) : (i64) -> ()
      %3130 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3131 = arith.constant 19 : i64
      %3132 = func.call @cc_make_string(%3130, %3131) : (!llvm.ptr, i64) -> i64
      %3133 = func.call @cc_nil_value() : () -> i64
      %3134 = func.call @cc_intern(%3132, %3133) : (i64, i64) -> i64
      %3135 = func.call @cc_nil_value() : () -> i64
      %3136 = func.call @cc_cons(%3134, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_values_pack(%3136) : (i64) -> i64
      func.call @stack_push_pointer(%3134) : (i64) -> ()
      %3138 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3139 = arith.constant 13 : i64
      %3140 = func.call @cc_make_string(%3138, %3139) : (!llvm.ptr, i64) -> i64
      %3141 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3142 = arith.constant 11 : i64
      %3143 = func.call @cc_make_string(%3141, %3142) : (!llvm.ptr, i64) -> i64
      %3144 = func.call @cc_intern(%3140, %3143) : (i64, i64) -> i64
      %3145 = func.call @cc_nil_value() : () -> i64
      %3146 = func.call @cc_cons(%3144, %3145) : (i64, i64) -> i64
      %3147 = func.call @cc_values_pack(%3146) : (i64) -> i64
      func.call @stack_push_pointer(%3144) : (i64) -> ()
      %3148 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3149 = arith.constant 7 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3151 = func.call @stack_pop_pointer() : () -> i64
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = func.call @cc_cons(%3152, %3151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3154 = arith.addi %3153, %__rlasp_stack_elide_zero_170 : i64
      %3155 = func.call @stack_pop_pointer() : () -> i64
      %3156 = func.call @cc_cons(%3155, %3154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3157 = func.call @stack_pop_pointer() : () -> i64
      %3158 = func.call @stack_pop_pointer() : () -> i64
      %3159 = func.call @cc_cons(%3158, %3157) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3160 = arith.addi %3159, %__rlasp_stack_elide_zero_171 : i64
      %3161 = func.call @stack_pop_pointer() : () -> i64
      %3162 = func.call @cc_cons(%3161, %3160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3162) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3163 = func.call @stack_pop_pointer() : () -> i64
      %3164 = func.call @stack_pop_pointer() : () -> i64
      %3165 = func.call @cc_cons(%3164, %3163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3166 = arith.addi %3165, %__rlasp_stack_elide_zero_172 : i64
      %3167 = func.call @stack_pop_pointer() : () -> i64
      %3168 = func.call @cc_cons(%3167, %3166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3169 = arith.addi %3168, %__rlasp_stack_elide_zero_173 : i64
      %3170 = func.call @stack_pop_pointer() : () -> i64
      %3171 = func.call @cc_cons(%3170, %3169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3172 = func.call @stack_pop_pointer() : () -> i64
      %3173 = func.call @stack_pop_pointer() : () -> i64
      %3174 = func.call @cc_cons(%3173, %3172) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3175 = arith.addi %3174, %__rlasp_stack_elide_zero_174 : i64
      %3176 = func.call @stack_pop_pointer() : () -> i64
      %3177 = func.call @cc_cons(%3176, %3175) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3178 = arith.addi %3177, %__rlasp_stack_elide_zero_175 : i64
      %3235 = arith.constant 122791386939406 : i64
      %3236 = arith.constant 0 : i64
      %3237 = func.call @cc_make_closure(%3235, %3236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3238 = arith.addi %3237, %__rlasp_stack_elide_zero_176 : i64
      %3239 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3240 = arith.constant 4 : i64
      %3241 = func.call @cc_make_string(%3239, %3240) : (!llvm.ptr, i64) -> i64
      %3242 = func.call @cc_nil_value() : () -> i64
      %3243 = func.call @cc_intern(%3241, %3242) : (i64, i64) -> i64
      %3244 = func.call @cc_nil_value() : () -> i64
      %3245 = func.call @cc_cons(%3243, %3244) : (i64, i64) -> i64
      %3246 = func.call @cc_values_pack(%3245) : (i64) -> i64
      func.call @stack_push_pointer(%3243) : (i64) -> ()
      %3247 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3248 = arith.constant 11 : i64
      %3249 = func.call @cc_make_string(%3247, %3248) : (!llvm.ptr, i64) -> i64
      %3250 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3251 = arith.constant 11 : i64
      %3252 = func.call @cc_make_string(%3250, %3251) : (!llvm.ptr, i64) -> i64
      %3253 = func.call @cc_intern(%3249, %3252) : (i64, i64) -> i64
      %3254 = func.call @cc_nil_value() : () -> i64
      %3255 = func.call @cc_cons(%3253, %3254) : (i64, i64) -> i64
      %3256 = func.call @cc_values_pack(%3255) : (i64) -> i64
      func.call @stack_push_pointer(%3253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3257 = func.call @stack_pop_pointer() : () -> i64
      %3258 = func.call @stack_pop_pointer() : () -> i64
      %3259 = func.call @cc_cons(%3258, %3257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3260 = arith.addi %3259, %__rlasp_stack_elide_zero_177 : i64
      %3261 = func.call @stack_pop_pointer() : () -> i64
      %3262 = func.call @cc_cons(%3261, %3260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3263 = arith.addi %3262, %__rlasp_stack_elide_zero_178 : i64
      %3264 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3265 = arith.constant 11 : i64
      %3266 = func.call @cc_make_string(%3264, %3265) : (!llvm.ptr, i64) -> i64
      %3267 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3268 = arith.constant 7 : i64
      %3269 = func.call @cc_make_string(%3267, %3268) : (!llvm.ptr, i64) -> i64
      %3270 = func.call @cc_intern(%3266, %3269) : (i64, i64) -> i64
      %3271 = func.call @cc_nil_value() : () -> i64
      %3272 = func.call @cc_cons(%3270, %3271) : (i64, i64) -> i64
      %3273 = func.call @cc_values_pack(%3272) : (i64) -> i64
      %3274 = func.call @cc_nil_value() : () -> i64
      %3275 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3276 = arith.constant 4 : i64
      %3277 = func.call @cc_make_string(%3275, %3276) : (!llvm.ptr, i64) -> i64
      %3278 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3279 = arith.constant 7 : i64
      %3280 = func.call @cc_make_string(%3278, %3279) : (!llvm.ptr, i64) -> i64
      %3281 = func.call @cc_intern(%3277, %3280) : (i64, i64) -> i64
      %3282 = func.call @cc_nil_value() : () -> i64
      %3283 = func.call @cc_cons(%3281, %3282) : (i64, i64) -> i64
      %3284 = func.call @cc_values_pack(%3283) : (i64) -> i64
      %3285 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3286 = arith.constant 5 : i64
      %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
      %3288 = func.call @cc_nil_value() : () -> i64
      %3289 = func.call @cc_intern(%3287, %3288) : (i64, i64) -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_cons(%3289, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_values_pack(%3291) : (i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3293 = arith.addi %3289, %__rlasp_stack_elide_zero_179 : i64
      %3294 = func.call @cc_nil_value() : () -> i64
      %3295 = func.call @cc_errorp(%3111) : (i64) -> i64
      %3296 = arith.cmpi ne, %3295, %3294 : i64
      %3297 = arith.cmpi eq, %3294, %3294 : i64
      %3298 = arith.andi %3296, %3297 : i1
      %3299 = scf.if %3298 -> (i64) {
        scf.yield %3111 : i64
      } else {
        scf.yield %3294 : i64
      }
      %3300 = func.call @cc_errorp(%3178) : (i64) -> i64
      %3301 = arith.cmpi ne, %3300, %3294 : i64
      %3302 = arith.cmpi eq, %3299, %3294 : i64
      %3303 = arith.andi %3301, %3302 : i1
      %3304 = scf.if %3303 -> (i64) {
        scf.yield %3178 : i64
      } else {
        scf.yield %3299 : i64
      }
      %3305 = func.call @cc_errorp(%3238) : (i64) -> i64
      %3306 = arith.cmpi ne, %3305, %3294 : i64
      %3307 = arith.cmpi eq, %3304, %3294 : i64
      %3308 = arith.andi %3306, %3307 : i1
      %3309 = scf.if %3308 -> (i64) {
        scf.yield %3238 : i64
      } else {
        scf.yield %3304 : i64
      }
      %3310 = func.call @cc_errorp(%3263) : (i64) -> i64
      %3311 = arith.cmpi ne, %3310, %3294 : i64
      %3312 = arith.cmpi eq, %3309, %3294 : i64
      %3313 = arith.andi %3311, %3312 : i1
      %3314 = scf.if %3313 -> (i64) {
        scf.yield %3263 : i64
      } else {
        scf.yield %3309 : i64
      }
      %3315 = func.call @cc_errorp(%3270) : (i64) -> i64
      %3316 = arith.cmpi ne, %3315, %3294 : i64
      %3317 = arith.cmpi eq, %3314, %3294 : i64
      %3318 = arith.andi %3316, %3317 : i1
      %3319 = scf.if %3318 -> (i64) {
        scf.yield %3270 : i64
      } else {
        scf.yield %3314 : i64
      }
      %3320 = func.call @cc_errorp(%3274) : (i64) -> i64
      %3321 = arith.cmpi ne, %3320, %3294 : i64
      %3322 = arith.cmpi eq, %3319, %3294 : i64
      %3323 = arith.andi %3321, %3322 : i1
      %3324 = scf.if %3323 -> (i64) {
        scf.yield %3274 : i64
      } else {
        scf.yield %3319 : i64
      }
      %3325 = func.call @cc_errorp(%3281) : (i64) -> i64
      %3326 = arith.cmpi ne, %3325, %3294 : i64
      %3327 = arith.cmpi eq, %3324, %3294 : i64
      %3328 = arith.andi %3326, %3327 : i1
      %3329 = scf.if %3328 -> (i64) {
        scf.yield %3281 : i64
      } else {
        scf.yield %3324 : i64
      }
      %3330 = func.call @cc_errorp(%3293) : (i64) -> i64
      %3331 = arith.cmpi ne, %3330, %3294 : i64
      %3332 = arith.cmpi eq, %3329, %3294 : i64
      %3333 = arith.andi %3331, %3332 : i1
      %3334 = scf.if %3333 -> (i64) {
        scf.yield %3293 : i64
      } else {
        scf.yield %3329 : i64
      }
      %3335 = arith.cmpi ne, %3334, %3294 : i64
      scf.if %3335 {
        func.call @stack_push_pointer(%3334) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3111) : (i64) -> ()
        func.call @stack_push_pointer(%3178) : (i64) -> ()
        func.call @stack_push_pointer(%3238) : (i64) -> ()
        func.call @stack_push_pointer(%3263) : (i64) -> ()
        func.call @stack_push_pointer(%3270) : (i64) -> ()
        func.call @stack_push_pointer(%3274) : (i64) -> ()
        func.call @stack_push_pointer(%3281) : (i64) -> ()
        func.call @stack_push_pointer(%3293) : (i64) -> ()
        %3336 = llvm.mlir.addressof @str285 : !llvm.ptr
        %3337 = func.call @cc_make_function_ref_const(%3336) : (!llvm.ptr) -> i64
        %3338 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3337, %3338) : (i64, i64) -> ()
      }
      %3339 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3339 : i64
    }
    %3340 = func.call @cc_nil_value() : () -> i64
    %3341 = func.call @cc_errorp(%3102) : (i64) -> i64
    %3342 = arith.cmpi ne, %3341, %3340 : i64
    %3343 = scf.if %3342 -> (i64) {
      scf.yield %3102 : i64
    } else {
      %3344 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3345 = arith.constant 14 : i64
      %3346 = func.call @cc_make_string(%3344, %3345) : (!llvm.ptr, i64) -> i64
      %3347 = func.call @cc_nil_value() : () -> i64
      %3348 = func.call @cc_intern(%3346, %3347) : (i64, i64) -> i64
      %3349 = func.call @cc_nil_value() : () -> i64
      %3350 = func.call @cc_cons(%3348, %3349) : (i64, i64) -> i64
      %3351 = func.call @cc_values_pack(%3350) : (i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3352 = arith.addi %3348, %__rlasp_stack_elide_zero_180 : i64
      %3353 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3354 = arith.constant 13 : i64
      %3355 = func.call @cc_make_string(%3353, %3354) : (!llvm.ptr, i64) -> i64
      %3356 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3357 = arith.constant 11 : i64
      %3358 = func.call @cc_make_string(%3356, %3357) : (!llvm.ptr, i64) -> i64
      %3359 = func.call @cc_intern(%3355, %3358) : (i64, i64) -> i64
      %3360 = func.call @cc_nil_value() : () -> i64
      %3361 = func.call @cc_cons(%3359, %3360) : (i64, i64) -> i64
      %3362 = func.call @cc_values_pack(%3361) : (i64) -> i64
      func.call @stack_push_pointer(%3359) : (i64) -> ()
      %3363 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3364 = arith.constant 5 : i64
      %3365 = func.call @cc_make_string(%3363, %3364) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3365) : (i64) -> ()
      %3366 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3367 = arith.constant 12 : i64
      %3368 = func.call @cc_make_string(%3366, %3367) : (!llvm.ptr, i64) -> i64
      %3369 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3370 = arith.constant 7 : i64
      %3371 = func.call @cc_make_string(%3369, %3370) : (!llvm.ptr, i64) -> i64
      %3372 = func.call @cc_intern(%3368, %3371) : (i64, i64) -> i64
      %3373 = func.call @cc_nil_value() : () -> i64
      %3374 = func.call @cc_cons(%3372, %3373) : (i64, i64) -> i64
      %3375 = func.call @cc_values_pack(%3374) : (i64) -> i64
      func.call @stack_push_pointer(%3372) : (i64) -> ()
      %3376 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3376) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3377 = func.call @stack_pop_pointer() : () -> i64
      %3378 = func.call @stack_pop_pointer() : () -> i64
      %3379 = func.call @cc_cons(%3378, %3377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3380 = arith.addi %3379, %__rlasp_stack_elide_zero_181 : i64
      %3381 = func.call @stack_pop_pointer() : () -> i64
      %3382 = func.call @cc_cons(%3381, %3380) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3383 = arith.addi %3382, %__rlasp_stack_elide_zero_182 : i64
      %3384 = func.call @stack_pop_pointer() : () -> i64
      %3385 = func.call @cc_cons(%3384, %3383) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3386 = arith.addi %3385, %__rlasp_stack_elide_zero_183 : i64
      %3387 = func.call @stack_pop_pointer() : () -> i64
      %3388 = func.call @cc_cons(%3387, %3386) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3389 = arith.addi %3388, %__rlasp_stack_elide_zero_184 : i64
      %3430 = arith.constant 122791386939407 : i64
      %3431 = arith.constant 0 : i64
      %3432 = func.call @cc_make_closure(%3430, %3431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3433 = arith.addi %3432, %__rlasp_stack_elide_zero_185 : i64
      %3434 = arith.constant 123 : i64
      func.call @stack_push_fixnum(%3434) : (i64) -> ()
      %3435 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%3435) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3436 = func.call @stack_pop_pointer() : () -> i64
      %3437 = func.call @stack_pop_pointer() : () -> i64
      %3438 = func.call @cc_cons(%3437, %3436) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3439 = arith.addi %3438, %__rlasp_stack_elide_zero_186 : i64
      %3440 = func.call @stack_pop_pointer() : () -> i64
      %3441 = func.call @cc_cons(%3440, %3439) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3442 = arith.addi %3441, %__rlasp_stack_elide_zero_187 : i64
      %3443 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3444 = arith.constant 11 : i64
      %3445 = func.call @cc_make_string(%3443, %3444) : (!llvm.ptr, i64) -> i64
      %3446 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3447 = arith.constant 7 : i64
      %3448 = func.call @cc_make_string(%3446, %3447) : (!llvm.ptr, i64) -> i64
      %3449 = func.call @cc_intern(%3445, %3448) : (i64, i64) -> i64
      %3450 = func.call @cc_nil_value() : () -> i64
      %3451 = func.call @cc_cons(%3449, %3450) : (i64, i64) -> i64
      %3452 = func.call @cc_values_pack(%3451) : (i64) -> i64
      %3453 = func.call @cc_nil_value() : () -> i64
      %3454 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3455 = arith.constant 4 : i64
      %3456 = func.call @cc_make_string(%3454, %3455) : (!llvm.ptr, i64) -> i64
      %3457 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3458 = arith.constant 7 : i64
      %3459 = func.call @cc_make_string(%3457, %3458) : (!llvm.ptr, i64) -> i64
      %3460 = func.call @cc_intern(%3456, %3459) : (i64, i64) -> i64
      %3461 = func.call @cc_nil_value() : () -> i64
      %3462 = func.call @cc_cons(%3460, %3461) : (i64, i64) -> i64
      %3463 = func.call @cc_values_pack(%3462) : (i64) -> i64
      %3464 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3465 = arith.constant 6 : i64
      %3466 = func.call @cc_make_string(%3464, %3465) : (!llvm.ptr, i64) -> i64
      %3467 = func.call @cc_nil_value() : () -> i64
      %3468 = func.call @cc_intern(%3466, %3467) : (i64, i64) -> i64
      %3469 = func.call @cc_nil_value() : () -> i64
      %3470 = func.call @cc_cons(%3468, %3469) : (i64, i64) -> i64
      %3471 = func.call @cc_values_pack(%3470) : (i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3472 = arith.addi %3468, %__rlasp_stack_elide_zero_188 : i64
      %3473 = func.call @cc_nil_value() : () -> i64
      %3474 = func.call @cc_errorp(%3352) : (i64) -> i64
      %3475 = arith.cmpi ne, %3474, %3473 : i64
      %3476 = arith.cmpi eq, %3473, %3473 : i64
      %3477 = arith.andi %3475, %3476 : i1
      %3478 = scf.if %3477 -> (i64) {
        scf.yield %3352 : i64
      } else {
        scf.yield %3473 : i64
      }
      %3479 = func.call @cc_errorp(%3389) : (i64) -> i64
      %3480 = arith.cmpi ne, %3479, %3473 : i64
      %3481 = arith.cmpi eq, %3478, %3473 : i64
      %3482 = arith.andi %3480, %3481 : i1
      %3483 = scf.if %3482 -> (i64) {
        scf.yield %3389 : i64
      } else {
        scf.yield %3478 : i64
      }
      %3484 = func.call @cc_errorp(%3433) : (i64) -> i64
      %3485 = arith.cmpi ne, %3484, %3473 : i64
      %3486 = arith.cmpi eq, %3483, %3473 : i64
      %3487 = arith.andi %3485, %3486 : i1
      %3488 = scf.if %3487 -> (i64) {
        scf.yield %3433 : i64
      } else {
        scf.yield %3483 : i64
      }
      %3489 = func.call @cc_errorp(%3442) : (i64) -> i64
      %3490 = arith.cmpi ne, %3489, %3473 : i64
      %3491 = arith.cmpi eq, %3488, %3473 : i64
      %3492 = arith.andi %3490, %3491 : i1
      %3493 = scf.if %3492 -> (i64) {
        scf.yield %3442 : i64
      } else {
        scf.yield %3488 : i64
      }
      %3494 = func.call @cc_errorp(%3449) : (i64) -> i64
      %3495 = arith.cmpi ne, %3494, %3473 : i64
      %3496 = arith.cmpi eq, %3493, %3473 : i64
      %3497 = arith.andi %3495, %3496 : i1
      %3498 = scf.if %3497 -> (i64) {
        scf.yield %3449 : i64
      } else {
        scf.yield %3493 : i64
      }
      %3499 = func.call @cc_errorp(%3453) : (i64) -> i64
      %3500 = arith.cmpi ne, %3499, %3473 : i64
      %3501 = arith.cmpi eq, %3498, %3473 : i64
      %3502 = arith.andi %3500, %3501 : i1
      %3503 = scf.if %3502 -> (i64) {
        scf.yield %3453 : i64
      } else {
        scf.yield %3498 : i64
      }
      %3504 = func.call @cc_errorp(%3460) : (i64) -> i64
      %3505 = arith.cmpi ne, %3504, %3473 : i64
      %3506 = arith.cmpi eq, %3503, %3473 : i64
      %3507 = arith.andi %3505, %3506 : i1
      %3508 = scf.if %3507 -> (i64) {
        scf.yield %3460 : i64
      } else {
        scf.yield %3503 : i64
      }
      %3509 = func.call @cc_errorp(%3472) : (i64) -> i64
      %3510 = arith.cmpi ne, %3509, %3473 : i64
      %3511 = arith.cmpi eq, %3508, %3473 : i64
      %3512 = arith.andi %3510, %3511 : i1
      %3513 = scf.if %3512 -> (i64) {
        scf.yield %3472 : i64
      } else {
        scf.yield %3508 : i64
      }
      %3514 = arith.cmpi ne, %3513, %3473 : i64
      scf.if %3514 {
        func.call @stack_push_pointer(%3513) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3352) : (i64) -> ()
        func.call @stack_push_pointer(%3389) : (i64) -> ()
        func.call @stack_push_pointer(%3433) : (i64) -> ()
        func.call @stack_push_pointer(%3442) : (i64) -> ()
        func.call @stack_push_pointer(%3449) : (i64) -> ()
        func.call @stack_push_pointer(%3453) : (i64) -> ()
        func.call @stack_push_pointer(%3460) : (i64) -> ()
        func.call @stack_push_pointer(%3472) : (i64) -> ()
        %3515 = llvm.mlir.addressof @str301 : !llvm.ptr
        %3516 = func.call @cc_make_function_ref_const(%3515) : (!llvm.ptr) -> i64
        %3517 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3516, %3517) : (i64, i64) -> ()
      }
      %3518 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3518 : i64
    }
    %3519 = func.call @cc_nil_value() : () -> i64
    %3520 = func.call @cc_errorp(%3343) : (i64) -> i64
    %3521 = arith.cmpi ne, %3520, %3519 : i64
    %3522 = scf.if %3521 -> (i64) {
      scf.yield %3343 : i64
    } else {
      %3523 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3524 = arith.constant 14 : i64
      %3525 = func.call @cc_make_string(%3523, %3524) : (!llvm.ptr, i64) -> i64
      %3526 = func.call @cc_nil_value() : () -> i64
      %3527 = func.call @cc_intern(%3525, %3526) : (i64, i64) -> i64
      %3528 = func.call @cc_nil_value() : () -> i64
      %3529 = func.call @cc_cons(%3527, %3528) : (i64, i64) -> i64
      %3530 = func.call @cc_values_pack(%3529) : (i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3531 = arith.addi %3527, %__rlasp_stack_elide_zero_189 : i64
      %3532 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3533 = arith.constant 13 : i64
      %3534 = func.call @cc_make_string(%3532, %3533) : (!llvm.ptr, i64) -> i64
      %3535 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3536 = arith.constant 11 : i64
      %3537 = func.call @cc_make_string(%3535, %3536) : (!llvm.ptr, i64) -> i64
      %3538 = func.call @cc_intern(%3534, %3537) : (i64, i64) -> i64
      %3539 = func.call @cc_nil_value() : () -> i64
      %3540 = func.call @cc_cons(%3538, %3539) : (i64, i64) -> i64
      %3541 = func.call @cc_values_pack(%3540) : (i64) -> i64
      func.call @stack_push_pointer(%3538) : (i64) -> ()
      %3542 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3543 = arith.constant 6 : i64
      %3544 = func.call @cc_make_string(%3542, %3543) : (!llvm.ptr, i64) -> i64
      %3545 = func.call @cc_nil_value() : () -> i64
      %3546 = func.call @cc_intern(%3544, %3545) : (i64, i64) -> i64
      %3547 = func.call @cc_nil_value() : () -> i64
      %3548 = func.call @cc_cons(%3546, %3547) : (i64, i64) -> i64
      %3549 = func.call @cc_values_pack(%3548) : (i64) -> i64
      func.call @stack_push_pointer(%3546) : (i64) -> ()
      %3550 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3551 = arith.constant 19 : i64
      %3552 = func.call @cc_make_string(%3550, %3551) : (!llvm.ptr, i64) -> i64
      %3553 = func.call @cc_nil_value() : () -> i64
      %3554 = func.call @cc_intern(%3552, %3553) : (i64, i64) -> i64
      %3555 = func.call @cc_nil_value() : () -> i64
      %3556 = func.call @cc_cons(%3554, %3555) : (i64, i64) -> i64
      %3557 = func.call @cc_values_pack(%3556) : (i64) -> i64
      func.call @stack_push_pointer(%3554) : (i64) -> ()
      %3558 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3559 = arith.constant 13 : i64
      %3560 = func.call @cc_make_string(%3558, %3559) : (!llvm.ptr, i64) -> i64
      %3561 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3562 = arith.constant 11 : i64
      %3563 = func.call @cc_make_string(%3561, %3562) : (!llvm.ptr, i64) -> i64
      %3564 = func.call @cc_intern(%3560, %3563) : (i64, i64) -> i64
      %3565 = func.call @cc_nil_value() : () -> i64
      %3566 = func.call @cc_cons(%3564, %3565) : (i64, i64) -> i64
      %3567 = func.call @cc_values_pack(%3566) : (i64) -> i64
      func.call @stack_push_pointer(%3564) : (i64) -> ()
      %3568 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3569 = arith.constant 1 : i64
      %3570 = func.call @cc_make_string(%3568, %3569) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3570) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3571 = func.call @stack_pop_pointer() : () -> i64
      %3572 = func.call @stack_pop_pointer() : () -> i64
      %3573 = func.call @cc_cons(%3572, %3571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3574 = arith.addi %3573, %__rlasp_stack_elide_zero_190 : i64
      %3575 = func.call @stack_pop_pointer() : () -> i64
      %3576 = func.call @cc_cons(%3575, %3574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3577 = func.call @stack_pop_pointer() : () -> i64
      %3578 = func.call @stack_pop_pointer() : () -> i64
      %3579 = func.call @cc_cons(%3578, %3577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3580 = arith.addi %3579, %__rlasp_stack_elide_zero_191 : i64
      %3581 = func.call @stack_pop_pointer() : () -> i64
      %3582 = func.call @cc_cons(%3581, %3580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3582) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @stack_pop_pointer() : () -> i64
      %3585 = func.call @cc_cons(%3584, %3583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3586 = arith.addi %3585, %__rlasp_stack_elide_zero_192 : i64
      %3587 = func.call @stack_pop_pointer() : () -> i64
      %3588 = func.call @cc_cons(%3587, %3586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3589 = arith.addi %3588, %__rlasp_stack_elide_zero_193 : i64
      %3590 = func.call @stack_pop_pointer() : () -> i64
      %3591 = func.call @cc_cons(%3590, %3589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3592 = func.call @stack_pop_pointer() : () -> i64
      %3593 = func.call @stack_pop_pointer() : () -> i64
      %3594 = func.call @cc_cons(%3593, %3592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3595 = arith.addi %3594, %__rlasp_stack_elide_zero_194 : i64
      %3596 = func.call @stack_pop_pointer() : () -> i64
      %3597 = func.call @cc_cons(%3596, %3595) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %3598 = arith.addi %3597, %__rlasp_stack_elide_zero_195 : i64
      %3655 = arith.constant 122791386939408 : i64
      %3656 = arith.constant 0 : i64
      %3657 = func.call @cc_make_closure(%3655, %3656) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %3658 = arith.addi %3657, %__rlasp_stack_elide_zero_196 : i64
      %3659 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3660 = arith.constant 4 : i64
      %3661 = func.call @cc_make_string(%3659, %3660) : (!llvm.ptr, i64) -> i64
      %3662 = func.call @cc_nil_value() : () -> i64
      %3663 = func.call @cc_intern(%3661, %3662) : (i64, i64) -> i64
      %3664 = func.call @cc_nil_value() : () -> i64
      %3665 = func.call @cc_cons(%3663, %3664) : (i64, i64) -> i64
      %3666 = func.call @cc_values_pack(%3665) : (i64) -> i64
      func.call @stack_push_pointer(%3663) : (i64) -> ()
      %3667 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3668 = arith.constant 11 : i64
      %3669 = func.call @cc_make_string(%3667, %3668) : (!llvm.ptr, i64) -> i64
      %3670 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3671 = arith.constant 11 : i64
      %3672 = func.call @cc_make_string(%3670, %3671) : (!llvm.ptr, i64) -> i64
      %3673 = func.call @cc_intern(%3669, %3672) : (i64, i64) -> i64
      %3674 = func.call @cc_nil_value() : () -> i64
      %3675 = func.call @cc_cons(%3673, %3674) : (i64, i64) -> i64
      %3676 = func.call @cc_values_pack(%3675) : (i64) -> i64
      func.call @stack_push_pointer(%3673) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3677 = func.call @stack_pop_pointer() : () -> i64
      %3678 = func.call @stack_pop_pointer() : () -> i64
      %3679 = func.call @cc_cons(%3678, %3677) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %3680 = arith.addi %3679, %__rlasp_stack_elide_zero_197 : i64
      %3681 = func.call @stack_pop_pointer() : () -> i64
      %3682 = func.call @cc_cons(%3681, %3680) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %3683 = arith.addi %3682, %__rlasp_stack_elide_zero_198 : i64
      %3684 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3685 = arith.constant 11 : i64
      %3686 = func.call @cc_make_string(%3684, %3685) : (!llvm.ptr, i64) -> i64
      %3687 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3688 = arith.constant 7 : i64
      %3689 = func.call @cc_make_string(%3687, %3688) : (!llvm.ptr, i64) -> i64
      %3690 = func.call @cc_intern(%3686, %3689) : (i64, i64) -> i64
      %3691 = func.call @cc_nil_value() : () -> i64
      %3692 = func.call @cc_cons(%3690, %3691) : (i64, i64) -> i64
      %3693 = func.call @cc_values_pack(%3692) : (i64) -> i64
      %3694 = func.call @cc_nil_value() : () -> i64
      %3695 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3696 = arith.constant 4 : i64
      %3697 = func.call @cc_make_string(%3695, %3696) : (!llvm.ptr, i64) -> i64
      %3698 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3699 = arith.constant 7 : i64
      %3700 = func.call @cc_make_string(%3698, %3699) : (!llvm.ptr, i64) -> i64
      %3701 = func.call @cc_intern(%3697, %3700) : (i64, i64) -> i64
      %3702 = func.call @cc_nil_value() : () -> i64
      %3703 = func.call @cc_cons(%3701, %3702) : (i64, i64) -> i64
      %3704 = func.call @cc_values_pack(%3703) : (i64) -> i64
      %3705 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3706 = arith.constant 5 : i64
      %3707 = func.call @cc_make_string(%3705, %3706) : (!llvm.ptr, i64) -> i64
      %3708 = func.call @cc_nil_value() : () -> i64
      %3709 = func.call @cc_intern(%3707, %3708) : (i64, i64) -> i64
      %3710 = func.call @cc_nil_value() : () -> i64
      %3711 = func.call @cc_cons(%3709, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_values_pack(%3711) : (i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %3713 = arith.addi %3709, %__rlasp_stack_elide_zero_199 : i64
      %3714 = func.call @cc_nil_value() : () -> i64
      %3715 = func.call @cc_errorp(%3531) : (i64) -> i64
      %3716 = arith.cmpi ne, %3715, %3714 : i64
      %3717 = arith.cmpi eq, %3714, %3714 : i64
      %3718 = arith.andi %3716, %3717 : i1
      %3719 = scf.if %3718 -> (i64) {
        scf.yield %3531 : i64
      } else {
        scf.yield %3714 : i64
      }
      %3720 = func.call @cc_errorp(%3598) : (i64) -> i64
      %3721 = arith.cmpi ne, %3720, %3714 : i64
      %3722 = arith.cmpi eq, %3719, %3714 : i64
      %3723 = arith.andi %3721, %3722 : i1
      %3724 = scf.if %3723 -> (i64) {
        scf.yield %3598 : i64
      } else {
        scf.yield %3719 : i64
      }
      %3725 = func.call @cc_errorp(%3658) : (i64) -> i64
      %3726 = arith.cmpi ne, %3725, %3714 : i64
      %3727 = arith.cmpi eq, %3724, %3714 : i64
      %3728 = arith.andi %3726, %3727 : i1
      %3729 = scf.if %3728 -> (i64) {
        scf.yield %3658 : i64
      } else {
        scf.yield %3724 : i64
      }
      %3730 = func.call @cc_errorp(%3683) : (i64) -> i64
      %3731 = arith.cmpi ne, %3730, %3714 : i64
      %3732 = arith.cmpi eq, %3729, %3714 : i64
      %3733 = arith.andi %3731, %3732 : i1
      %3734 = scf.if %3733 -> (i64) {
        scf.yield %3683 : i64
      } else {
        scf.yield %3729 : i64
      }
      %3735 = func.call @cc_errorp(%3690) : (i64) -> i64
      %3736 = arith.cmpi ne, %3735, %3714 : i64
      %3737 = arith.cmpi eq, %3734, %3714 : i64
      %3738 = arith.andi %3736, %3737 : i1
      %3739 = scf.if %3738 -> (i64) {
        scf.yield %3690 : i64
      } else {
        scf.yield %3734 : i64
      }
      %3740 = func.call @cc_errorp(%3694) : (i64) -> i64
      %3741 = arith.cmpi ne, %3740, %3714 : i64
      %3742 = arith.cmpi eq, %3739, %3714 : i64
      %3743 = arith.andi %3741, %3742 : i1
      %3744 = scf.if %3743 -> (i64) {
        scf.yield %3694 : i64
      } else {
        scf.yield %3739 : i64
      }
      %3745 = func.call @cc_errorp(%3701) : (i64) -> i64
      %3746 = arith.cmpi ne, %3745, %3714 : i64
      %3747 = arith.cmpi eq, %3744, %3714 : i64
      %3748 = arith.andi %3746, %3747 : i1
      %3749 = scf.if %3748 -> (i64) {
        scf.yield %3701 : i64
      } else {
        scf.yield %3744 : i64
      }
      %3750 = func.call @cc_errorp(%3713) : (i64) -> i64
      %3751 = arith.cmpi ne, %3750, %3714 : i64
      %3752 = arith.cmpi eq, %3749, %3714 : i64
      %3753 = arith.andi %3751, %3752 : i1
      %3754 = scf.if %3753 -> (i64) {
        scf.yield %3713 : i64
      } else {
        scf.yield %3749 : i64
      }
      %3755 = arith.cmpi ne, %3754, %3714 : i64
      scf.if %3755 {
        func.call @stack_push_pointer(%3754) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3531) : (i64) -> ()
        func.call @stack_push_pointer(%3598) : (i64) -> ()
        func.call @stack_push_pointer(%3658) : (i64) -> ()
        func.call @stack_push_pointer(%3683) : (i64) -> ()
        func.call @stack_push_pointer(%3690) : (i64) -> ()
        func.call @stack_push_pointer(%3694) : (i64) -> ()
        func.call @stack_push_pointer(%3701) : (i64) -> ()
        func.call @stack_push_pointer(%3713) : (i64) -> ()
        %3756 = llvm.mlir.addressof @str320 : !llvm.ptr
        %3757 = func.call @cc_make_function_ref_const(%3756) : (!llvm.ptr) -> i64
        %3758 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3757, %3758) : (i64, i64) -> ()
      }
      %3759 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3759 : i64
    }
    %3760 = func.call @cc_nil_value() : () -> i64
    %3761 = func.call @cc_errorp(%3522) : (i64) -> i64
    %3762 = arith.cmpi ne, %3761, %3760 : i64
    %3763 = scf.if %3762 -> (i64) {
      scf.yield %3522 : i64
    } else {
      %3764 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3765 = arith.constant 14 : i64
      %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
      %3767 = func.call @cc_nil_value() : () -> i64
      %3768 = func.call @cc_intern(%3766, %3767) : (i64, i64) -> i64
      %3769 = func.call @cc_nil_value() : () -> i64
      %3770 = func.call @cc_cons(%3768, %3769) : (i64, i64) -> i64
      %3771 = func.call @cc_values_pack(%3770) : (i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %3772 = arith.addi %3768, %__rlasp_stack_elide_zero_200 : i64
      %3773 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3774 = arith.constant 13 : i64
      %3775 = func.call @cc_make_string(%3773, %3774) : (!llvm.ptr, i64) -> i64
      %3776 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3777 = arith.constant 11 : i64
      %3778 = func.call @cc_make_string(%3776, %3777) : (!llvm.ptr, i64) -> i64
      %3779 = func.call @cc_intern(%3775, %3778) : (i64, i64) -> i64
      %3780 = func.call @cc_nil_value() : () -> i64
      %3781 = func.call @cc_cons(%3779, %3780) : (i64, i64) -> i64
      %3782 = func.call @cc_values_pack(%3781) : (i64) -> i64
      func.call @stack_push_pointer(%3779) : (i64) -> ()
      %3783 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3784 = arith.constant 6 : i64
      %3785 = func.call @cc_make_string(%3783, %3784) : (!llvm.ptr, i64) -> i64
      %3786 = func.call @cc_nil_value() : () -> i64
      %3787 = func.call @cc_intern(%3785, %3786) : (i64, i64) -> i64
      %3788 = func.call @cc_nil_value() : () -> i64
      %3789 = func.call @cc_cons(%3787, %3788) : (i64, i64) -> i64
      %3790 = func.call @cc_values_pack(%3789) : (i64) -> i64
      func.call @stack_push_pointer(%3787) : (i64) -> ()
      %3791 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3792 = arith.constant 19 : i64
      %3793 = func.call @cc_make_string(%3791, %3792) : (!llvm.ptr, i64) -> i64
      %3794 = func.call @cc_nil_value() : () -> i64
      %3795 = func.call @cc_intern(%3793, %3794) : (i64, i64) -> i64
      %3796 = func.call @cc_nil_value() : () -> i64
      %3797 = func.call @cc_cons(%3795, %3796) : (i64, i64) -> i64
      %3798 = func.call @cc_values_pack(%3797) : (i64) -> i64
      func.call @stack_push_pointer(%3795) : (i64) -> ()
      %3799 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3800 = arith.constant 13 : i64
      %3801 = func.call @cc_make_string(%3799, %3800) : (!llvm.ptr, i64) -> i64
      %3802 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3803 = arith.constant 11 : i64
      %3804 = func.call @cc_make_string(%3802, %3803) : (!llvm.ptr, i64) -> i64
      %3805 = func.call @cc_intern(%3801, %3804) : (i64, i64) -> i64
      %3806 = func.call @cc_nil_value() : () -> i64
      %3807 = func.call @cc_cons(%3805, %3806) : (i64, i64) -> i64
      %3808 = func.call @cc_values_pack(%3807) : (i64) -> i64
      func.call @stack_push_pointer(%3805) : (i64) -> ()
      %3809 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3810 = arith.constant 1 : i64
      %3811 = func.call @cc_make_string(%3809, %3810) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3811) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3812 = func.call @stack_pop_pointer() : () -> i64
      %3813 = func.call @stack_pop_pointer() : () -> i64
      %3814 = func.call @cc_cons(%3813, %3812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %3815 = arith.addi %3814, %__rlasp_stack_elide_zero_201 : i64
      %3816 = func.call @stack_pop_pointer() : () -> i64
      %3817 = func.call @cc_cons(%3816, %3815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3817) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = func.call @stack_pop_pointer() : () -> i64
      %3820 = func.call @cc_cons(%3819, %3818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %3821 = arith.addi %3820, %__rlasp_stack_elide_zero_202 : i64
      %3822 = func.call @stack_pop_pointer() : () -> i64
      %3823 = func.call @cc_cons(%3822, %3821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = func.call @stack_pop_pointer() : () -> i64
      %3826 = func.call @cc_cons(%3825, %3824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %3827 = arith.addi %3826, %__rlasp_stack_elide_zero_203 : i64
      %3828 = func.call @stack_pop_pointer() : () -> i64
      %3829 = func.call @cc_cons(%3828, %3827) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %3830 = arith.addi %3829, %__rlasp_stack_elide_zero_204 : i64
      %3831 = func.call @stack_pop_pointer() : () -> i64
      %3832 = func.call @cc_cons(%3831, %3830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3832) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3833 = func.call @stack_pop_pointer() : () -> i64
      %3834 = func.call @stack_pop_pointer() : () -> i64
      %3835 = func.call @cc_cons(%3834, %3833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %3836 = arith.addi %3835, %__rlasp_stack_elide_zero_205 : i64
      %3837 = func.call @stack_pop_pointer() : () -> i64
      %3838 = func.call @cc_cons(%3837, %3836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %3839 = arith.addi %3838, %__rlasp_stack_elide_zero_206 : i64
      %3896 = arith.constant 122791386939409 : i64
      %3897 = arith.constant 0 : i64
      %3898 = func.call @cc_make_closure(%3896, %3897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %3899 = arith.addi %3898, %__rlasp_stack_elide_zero_207 : i64
      %3900 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3901 = arith.constant 4 : i64
      %3902 = func.call @cc_make_string(%3900, %3901) : (!llvm.ptr, i64) -> i64
      %3903 = func.call @cc_nil_value() : () -> i64
      %3904 = func.call @cc_intern(%3902, %3903) : (i64, i64) -> i64
      %3905 = func.call @cc_nil_value() : () -> i64
      %3906 = func.call @cc_cons(%3904, %3905) : (i64, i64) -> i64
      %3907 = func.call @cc_values_pack(%3906) : (i64) -> i64
      func.call @stack_push_pointer(%3904) : (i64) -> ()
      %3908 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3909 = arith.constant 11 : i64
      %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
      %3911 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3912 = arith.constant 11 : i64
      %3913 = func.call @cc_make_string(%3911, %3912) : (!llvm.ptr, i64) -> i64
      %3914 = func.call @cc_intern(%3910, %3913) : (i64, i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_cons(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_values_pack(%3916) : (i64) -> i64
      func.call @stack_push_pointer(%3914) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3918 = func.call @stack_pop_pointer() : () -> i64
      %3919 = func.call @stack_pop_pointer() : () -> i64
      %3920 = func.call @cc_cons(%3919, %3918) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %3921 = arith.addi %3920, %__rlasp_stack_elide_zero_208 : i64
      %3922 = func.call @stack_pop_pointer() : () -> i64
      %3923 = func.call @cc_cons(%3922, %3921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %3924 = arith.addi %3923, %__rlasp_stack_elide_zero_209 : i64
      %3925 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3926 = arith.constant 11 : i64
      %3927 = func.call @cc_make_string(%3925, %3926) : (!llvm.ptr, i64) -> i64
      %3928 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3929 = arith.constant 7 : i64
      %3930 = func.call @cc_make_string(%3928, %3929) : (!llvm.ptr, i64) -> i64
      %3931 = func.call @cc_intern(%3927, %3930) : (i64, i64) -> i64
      %3932 = func.call @cc_nil_value() : () -> i64
      %3933 = func.call @cc_cons(%3931, %3932) : (i64, i64) -> i64
      %3934 = func.call @cc_values_pack(%3933) : (i64) -> i64
      %3935 = func.call @cc_nil_value() : () -> i64
      %3936 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3937 = arith.constant 4 : i64
      %3938 = func.call @cc_make_string(%3936, %3937) : (!llvm.ptr, i64) -> i64
      %3939 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3940 = arith.constant 7 : i64
      %3941 = func.call @cc_make_string(%3939, %3940) : (!llvm.ptr, i64) -> i64
      %3942 = func.call @cc_intern(%3938, %3941) : (i64, i64) -> i64
      %3943 = func.call @cc_nil_value() : () -> i64
      %3944 = func.call @cc_cons(%3942, %3943) : (i64, i64) -> i64
      %3945 = func.call @cc_values_pack(%3944) : (i64) -> i64
      %3946 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3947 = arith.constant 5 : i64
      %3948 = func.call @cc_make_string(%3946, %3947) : (!llvm.ptr, i64) -> i64
      %3949 = func.call @cc_nil_value() : () -> i64
      %3950 = func.call @cc_intern(%3948, %3949) : (i64, i64) -> i64
      %3951 = func.call @cc_nil_value() : () -> i64
      %3952 = func.call @cc_cons(%3950, %3951) : (i64, i64) -> i64
      %3953 = func.call @cc_values_pack(%3952) : (i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %3954 = arith.addi %3950, %__rlasp_stack_elide_zero_210 : i64
      %3955 = func.call @cc_nil_value() : () -> i64
      %3956 = func.call @cc_errorp(%3772) : (i64) -> i64
      %3957 = arith.cmpi ne, %3956, %3955 : i64
      %3958 = arith.cmpi eq, %3955, %3955 : i64
      %3959 = arith.andi %3957, %3958 : i1
      %3960 = scf.if %3959 -> (i64) {
        scf.yield %3772 : i64
      } else {
        scf.yield %3955 : i64
      }
      %3961 = func.call @cc_errorp(%3839) : (i64) -> i64
      %3962 = arith.cmpi ne, %3961, %3955 : i64
      %3963 = arith.cmpi eq, %3960, %3955 : i64
      %3964 = arith.andi %3962, %3963 : i1
      %3965 = scf.if %3964 -> (i64) {
        scf.yield %3839 : i64
      } else {
        scf.yield %3960 : i64
      }
      %3966 = func.call @cc_errorp(%3899) : (i64) -> i64
      %3967 = arith.cmpi ne, %3966, %3955 : i64
      %3968 = arith.cmpi eq, %3965, %3955 : i64
      %3969 = arith.andi %3967, %3968 : i1
      %3970 = scf.if %3969 -> (i64) {
        scf.yield %3899 : i64
      } else {
        scf.yield %3965 : i64
      }
      %3971 = func.call @cc_errorp(%3924) : (i64) -> i64
      %3972 = arith.cmpi ne, %3971, %3955 : i64
      %3973 = arith.cmpi eq, %3970, %3955 : i64
      %3974 = arith.andi %3972, %3973 : i1
      %3975 = scf.if %3974 -> (i64) {
        scf.yield %3924 : i64
      } else {
        scf.yield %3970 : i64
      }
      %3976 = func.call @cc_errorp(%3931) : (i64) -> i64
      %3977 = arith.cmpi ne, %3976, %3955 : i64
      %3978 = arith.cmpi eq, %3975, %3955 : i64
      %3979 = arith.andi %3977, %3978 : i1
      %3980 = scf.if %3979 -> (i64) {
        scf.yield %3931 : i64
      } else {
        scf.yield %3975 : i64
      }
      %3981 = func.call @cc_errorp(%3935) : (i64) -> i64
      %3982 = arith.cmpi ne, %3981, %3955 : i64
      %3983 = arith.cmpi eq, %3980, %3955 : i64
      %3984 = arith.andi %3982, %3983 : i1
      %3985 = scf.if %3984 -> (i64) {
        scf.yield %3935 : i64
      } else {
        scf.yield %3980 : i64
      }
      %3986 = func.call @cc_errorp(%3942) : (i64) -> i64
      %3987 = arith.cmpi ne, %3986, %3955 : i64
      %3988 = arith.cmpi eq, %3985, %3955 : i64
      %3989 = arith.andi %3987, %3988 : i1
      %3990 = scf.if %3989 -> (i64) {
        scf.yield %3942 : i64
      } else {
        scf.yield %3985 : i64
      }
      %3991 = func.call @cc_errorp(%3954) : (i64) -> i64
      %3992 = arith.cmpi ne, %3991, %3955 : i64
      %3993 = arith.cmpi eq, %3990, %3955 : i64
      %3994 = arith.andi %3992, %3993 : i1
      %3995 = scf.if %3994 -> (i64) {
        scf.yield %3954 : i64
      } else {
        scf.yield %3990 : i64
      }
      %3996 = arith.cmpi ne, %3995, %3955 : i64
      scf.if %3996 {
        func.call @stack_push_pointer(%3995) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3772) : (i64) -> ()
        func.call @stack_push_pointer(%3839) : (i64) -> ()
        func.call @stack_push_pointer(%3899) : (i64) -> ()
        func.call @stack_push_pointer(%3924) : (i64) -> ()
        func.call @stack_push_pointer(%3931) : (i64) -> ()
        func.call @stack_push_pointer(%3935) : (i64) -> ()
        func.call @stack_push_pointer(%3942) : (i64) -> ()
        func.call @stack_push_pointer(%3954) : (i64) -> ()
        %3997 = llvm.mlir.addressof @str339 : !llvm.ptr
        %3998 = func.call @cc_make_function_ref_const(%3997) : (!llvm.ptr) -> i64
        %3999 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3998, %3999) : (i64, i64) -> ()
      }
      %4000 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4000 : i64
    }
    %4001 = func.call @cc_nil_value() : () -> i64
    %4002 = func.call @cc_errorp(%3763) : (i64) -> i64
    %4003 = arith.cmpi ne, %4002, %4001 : i64
    %4004 = scf.if %4003 -> (i64) {
      scf.yield %3763 : i64
    } else {
      %4005 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4006 = arith.constant 14 : i64
      %4007 = func.call @cc_make_string(%4005, %4006) : (!llvm.ptr, i64) -> i64
      %4008 = func.call @cc_nil_value() : () -> i64
      %4009 = func.call @cc_intern(%4007, %4008) : (i64, i64) -> i64
      %4010 = func.call @cc_nil_value() : () -> i64
      %4011 = func.call @cc_cons(%4009, %4010) : (i64, i64) -> i64
      %4012 = func.call @cc_values_pack(%4011) : (i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4013 = arith.addi %4009, %__rlasp_stack_elide_zero_211 : i64
      %4014 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4015 = arith.constant 13 : i64
      %4016 = func.call @cc_make_string(%4014, %4015) : (!llvm.ptr, i64) -> i64
      %4017 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4018 = arith.constant 11 : i64
      %4019 = func.call @cc_make_string(%4017, %4018) : (!llvm.ptr, i64) -> i64
      %4020 = func.call @cc_intern(%4016, %4019) : (i64, i64) -> i64
      %4021 = func.call @cc_nil_value() : () -> i64
      %4022 = func.call @cc_cons(%4020, %4021) : (i64, i64) -> i64
      %4023 = func.call @cc_values_pack(%4022) : (i64) -> i64
      func.call @stack_push_pointer(%4020) : (i64) -> ()
      %4024 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4025 = arith.constant 6 : i64
      %4026 = func.call @cc_make_string(%4024, %4025) : (!llvm.ptr, i64) -> i64
      %4027 = func.call @cc_nil_value() : () -> i64
      %4028 = func.call @cc_intern(%4026, %4027) : (i64, i64) -> i64
      %4029 = func.call @cc_nil_value() : () -> i64
      %4030 = func.call @cc_cons(%4028, %4029) : (i64, i64) -> i64
      %4031 = func.call @cc_values_pack(%4030) : (i64) -> i64
      func.call @stack_push_pointer(%4028) : (i64) -> ()
      %4032 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4033 = arith.constant 19 : i64
      %4034 = func.call @cc_make_string(%4032, %4033) : (!llvm.ptr, i64) -> i64
      %4035 = func.call @cc_nil_value() : () -> i64
      %4036 = func.call @cc_intern(%4034, %4035) : (i64, i64) -> i64
      %4037 = func.call @cc_nil_value() : () -> i64
      %4038 = func.call @cc_cons(%4036, %4037) : (i64, i64) -> i64
      %4039 = func.call @cc_values_pack(%4038) : (i64) -> i64
      func.call @stack_push_pointer(%4036) : (i64) -> ()
      %4040 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4041 = arith.constant 13 : i64
      %4042 = func.call @cc_make_string(%4040, %4041) : (!llvm.ptr, i64) -> i64
      %4043 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4044 = arith.constant 11 : i64
      %4045 = func.call @cc_make_string(%4043, %4044) : (!llvm.ptr, i64) -> i64
      %4046 = func.call @cc_intern(%4042, %4045) : (i64, i64) -> i64
      %4047 = func.call @cc_nil_value() : () -> i64
      %4048 = func.call @cc_cons(%4046, %4047) : (i64, i64) -> i64
      %4049 = func.call @cc_values_pack(%4048) : (i64) -> i64
      func.call @stack_push_pointer(%4046) : (i64) -> ()
      %4050 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4051 = arith.constant 0 : i64
      %4052 = func.call @cc_make_string(%4050, %4051) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4052) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4053 = func.call @stack_pop_pointer() : () -> i64
      %4054 = func.call @stack_pop_pointer() : () -> i64
      %4055 = func.call @cc_cons(%4054, %4053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4056 = arith.addi %4055, %__rlasp_stack_elide_zero_212 : i64
      %4057 = func.call @stack_pop_pointer() : () -> i64
      %4058 = func.call @cc_cons(%4057, %4056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4058) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4059 = func.call @stack_pop_pointer() : () -> i64
      %4060 = func.call @stack_pop_pointer() : () -> i64
      %4061 = func.call @cc_cons(%4060, %4059) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4062 = arith.addi %4061, %__rlasp_stack_elide_zero_213 : i64
      %4063 = func.call @stack_pop_pointer() : () -> i64
      %4064 = func.call @cc_cons(%4063, %4062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4064) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4065 = func.call @stack_pop_pointer() : () -> i64
      %4066 = func.call @stack_pop_pointer() : () -> i64
      %4067 = func.call @cc_cons(%4066, %4065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4068 = arith.addi %4067, %__rlasp_stack_elide_zero_214 : i64
      %4069 = func.call @stack_pop_pointer() : () -> i64
      %4070 = func.call @cc_cons(%4069, %4068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4071 = arith.addi %4070, %__rlasp_stack_elide_zero_215 : i64
      %4072 = func.call @stack_pop_pointer() : () -> i64
      %4073 = func.call @cc_cons(%4072, %4071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4073) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4074 = func.call @stack_pop_pointer() : () -> i64
      %4075 = func.call @stack_pop_pointer() : () -> i64
      %4076 = func.call @cc_cons(%4075, %4074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4077 = arith.addi %4076, %__rlasp_stack_elide_zero_216 : i64
      %4078 = func.call @stack_pop_pointer() : () -> i64
      %4079 = func.call @cc_cons(%4078, %4077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4080 = arith.addi %4079, %__rlasp_stack_elide_zero_217 : i64
      %4137 = arith.constant 122791386939410 : i64
      %4138 = arith.constant 0 : i64
      %4139 = func.call @cc_make_closure(%4137, %4138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4140 = arith.addi %4139, %__rlasp_stack_elide_zero_218 : i64
      %4141 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4142 = arith.constant 4 : i64
      %4143 = func.call @cc_make_string(%4141, %4142) : (!llvm.ptr, i64) -> i64
      %4144 = func.call @cc_nil_value() : () -> i64
      %4145 = func.call @cc_intern(%4143, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_nil_value() : () -> i64
      %4147 = func.call @cc_cons(%4145, %4146) : (i64, i64) -> i64
      %4148 = func.call @cc_values_pack(%4147) : (i64) -> i64
      func.call @stack_push_pointer(%4145) : (i64) -> ()
      %4149 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4150 = arith.constant 11 : i64
      %4151 = func.call @cc_make_string(%4149, %4150) : (!llvm.ptr, i64) -> i64
      %4152 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4153 = arith.constant 11 : i64
      %4154 = func.call @cc_make_string(%4152, %4153) : (!llvm.ptr, i64) -> i64
      %4155 = func.call @cc_intern(%4151, %4154) : (i64, i64) -> i64
      %4156 = func.call @cc_nil_value() : () -> i64
      %4157 = func.call @cc_cons(%4155, %4156) : (i64, i64) -> i64
      %4158 = func.call @cc_values_pack(%4157) : (i64) -> i64
      func.call @stack_push_pointer(%4155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4159 = func.call @stack_pop_pointer() : () -> i64
      %4160 = func.call @stack_pop_pointer() : () -> i64
      %4161 = func.call @cc_cons(%4160, %4159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4162 = arith.addi %4161, %__rlasp_stack_elide_zero_219 : i64
      %4163 = func.call @stack_pop_pointer() : () -> i64
      %4164 = func.call @cc_cons(%4163, %4162) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4165 = arith.addi %4164, %__rlasp_stack_elide_zero_220 : i64
      %4166 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4167 = arith.constant 11 : i64
      %4168 = func.call @cc_make_string(%4166, %4167) : (!llvm.ptr, i64) -> i64
      %4169 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4170 = arith.constant 7 : i64
      %4171 = func.call @cc_make_string(%4169, %4170) : (!llvm.ptr, i64) -> i64
      %4172 = func.call @cc_intern(%4168, %4171) : (i64, i64) -> i64
      %4173 = func.call @cc_nil_value() : () -> i64
      %4174 = func.call @cc_cons(%4172, %4173) : (i64, i64) -> i64
      %4175 = func.call @cc_values_pack(%4174) : (i64) -> i64
      %4176 = func.call @cc_nil_value() : () -> i64
      %4177 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4178 = arith.constant 4 : i64
      %4179 = func.call @cc_make_string(%4177, %4178) : (!llvm.ptr, i64) -> i64
      %4180 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4181 = arith.constant 7 : i64
      %4182 = func.call @cc_make_string(%4180, %4181) : (!llvm.ptr, i64) -> i64
      %4183 = func.call @cc_intern(%4179, %4182) : (i64, i64) -> i64
      %4184 = func.call @cc_nil_value() : () -> i64
      %4185 = func.call @cc_cons(%4183, %4184) : (i64, i64) -> i64
      %4186 = func.call @cc_values_pack(%4185) : (i64) -> i64
      %4187 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4188 = arith.constant 5 : i64
      %4189 = func.call @cc_make_string(%4187, %4188) : (!llvm.ptr, i64) -> i64
      %4190 = func.call @cc_nil_value() : () -> i64
      %4191 = func.call @cc_intern(%4189, %4190) : (i64, i64) -> i64
      %4192 = func.call @cc_nil_value() : () -> i64
      %4193 = func.call @cc_cons(%4191, %4192) : (i64, i64) -> i64
      %4194 = func.call @cc_values_pack(%4193) : (i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4195 = arith.addi %4191, %__rlasp_stack_elide_zero_221 : i64
      %4196 = func.call @cc_nil_value() : () -> i64
      %4197 = func.call @cc_errorp(%4013) : (i64) -> i64
      %4198 = arith.cmpi ne, %4197, %4196 : i64
      %4199 = arith.cmpi eq, %4196, %4196 : i64
      %4200 = arith.andi %4198, %4199 : i1
      %4201 = scf.if %4200 -> (i64) {
        scf.yield %4013 : i64
      } else {
        scf.yield %4196 : i64
      }
      %4202 = func.call @cc_errorp(%4080) : (i64) -> i64
      %4203 = arith.cmpi ne, %4202, %4196 : i64
      %4204 = arith.cmpi eq, %4201, %4196 : i64
      %4205 = arith.andi %4203, %4204 : i1
      %4206 = scf.if %4205 -> (i64) {
        scf.yield %4080 : i64
      } else {
        scf.yield %4201 : i64
      }
      %4207 = func.call @cc_errorp(%4140) : (i64) -> i64
      %4208 = arith.cmpi ne, %4207, %4196 : i64
      %4209 = arith.cmpi eq, %4206, %4196 : i64
      %4210 = arith.andi %4208, %4209 : i1
      %4211 = scf.if %4210 -> (i64) {
        scf.yield %4140 : i64
      } else {
        scf.yield %4206 : i64
      }
      %4212 = func.call @cc_errorp(%4165) : (i64) -> i64
      %4213 = arith.cmpi ne, %4212, %4196 : i64
      %4214 = arith.cmpi eq, %4211, %4196 : i64
      %4215 = arith.andi %4213, %4214 : i1
      %4216 = scf.if %4215 -> (i64) {
        scf.yield %4165 : i64
      } else {
        scf.yield %4211 : i64
      }
      %4217 = func.call @cc_errorp(%4172) : (i64) -> i64
      %4218 = arith.cmpi ne, %4217, %4196 : i64
      %4219 = arith.cmpi eq, %4216, %4196 : i64
      %4220 = arith.andi %4218, %4219 : i1
      %4221 = scf.if %4220 -> (i64) {
        scf.yield %4172 : i64
      } else {
        scf.yield %4216 : i64
      }
      %4222 = func.call @cc_errorp(%4176) : (i64) -> i64
      %4223 = arith.cmpi ne, %4222, %4196 : i64
      %4224 = arith.cmpi eq, %4221, %4196 : i64
      %4225 = arith.andi %4223, %4224 : i1
      %4226 = scf.if %4225 -> (i64) {
        scf.yield %4176 : i64
      } else {
        scf.yield %4221 : i64
      }
      %4227 = func.call @cc_errorp(%4183) : (i64) -> i64
      %4228 = arith.cmpi ne, %4227, %4196 : i64
      %4229 = arith.cmpi eq, %4226, %4196 : i64
      %4230 = arith.andi %4228, %4229 : i1
      %4231 = scf.if %4230 -> (i64) {
        scf.yield %4183 : i64
      } else {
        scf.yield %4226 : i64
      }
      %4232 = func.call @cc_errorp(%4195) : (i64) -> i64
      %4233 = arith.cmpi ne, %4232, %4196 : i64
      %4234 = arith.cmpi eq, %4231, %4196 : i64
      %4235 = arith.andi %4233, %4234 : i1
      %4236 = scf.if %4235 -> (i64) {
        scf.yield %4195 : i64
      } else {
        scf.yield %4231 : i64
      }
      %4237 = arith.cmpi ne, %4236, %4196 : i64
      scf.if %4237 {
        func.call @stack_push_pointer(%4236) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4013) : (i64) -> ()
        func.call @stack_push_pointer(%4080) : (i64) -> ()
        func.call @stack_push_pointer(%4140) : (i64) -> ()
        func.call @stack_push_pointer(%4165) : (i64) -> ()
        func.call @stack_push_pointer(%4172) : (i64) -> ()
        func.call @stack_push_pointer(%4176) : (i64) -> ()
        func.call @stack_push_pointer(%4183) : (i64) -> ()
        func.call @stack_push_pointer(%4195) : (i64) -> ()
        %4238 = llvm.mlir.addressof @str358 : !llvm.ptr
        %4239 = func.call @cc_make_function_ref_const(%4238) : (!llvm.ptr) -> i64
        %4240 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4239, %4240) : (i64, i64) -> ()
      }
      %4241 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4241 : i64
    }
    %4242 = func.call @cc_nil_value() : () -> i64
    %4243 = func.call @cc_errorp(%4004) : (i64) -> i64
    %4244 = arith.cmpi ne, %4243, %4242 : i64
    %4245 = scf.if %4244 -> (i64) {
      scf.yield %4004 : i64
    } else {
      %4246 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4247 = arith.constant 14 : i64
      %4248 = func.call @cc_make_string(%4246, %4247) : (!llvm.ptr, i64) -> i64
      %4249 = func.call @cc_nil_value() : () -> i64
      %4250 = func.call @cc_intern(%4248, %4249) : (i64, i64) -> i64
      %4251 = func.call @cc_nil_value() : () -> i64
      %4252 = func.call @cc_cons(%4250, %4251) : (i64, i64) -> i64
      %4253 = func.call @cc_values_pack(%4252) : (i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4254 = arith.addi %4250, %__rlasp_stack_elide_zero_222 : i64
      %4255 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4256 = arith.constant 13 : i64
      %4257 = func.call @cc_make_string(%4255, %4256) : (!llvm.ptr, i64) -> i64
      %4258 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4259 = arith.constant 11 : i64
      %4260 = func.call @cc_make_string(%4258, %4259) : (!llvm.ptr, i64) -> i64
      %4261 = func.call @cc_intern(%4257, %4260) : (i64, i64) -> i64
      %4262 = func.call @cc_nil_value() : () -> i64
      %4263 = func.call @cc_cons(%4261, %4262) : (i64, i64) -> i64
      %4264 = func.call @cc_values_pack(%4263) : (i64) -> i64
      func.call @stack_push_pointer(%4261) : (i64) -> ()
      %4265 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4266 = arith.constant 1 : i64
      %4267 = func.call @cc_make_string(%4265, %4266) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4267) : (i64) -> ()
      %4268 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4269 = arith.constant 12 : i64
      %4270 = func.call @cc_make_string(%4268, %4269) : (!llvm.ptr, i64) -> i64
      %4271 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4272 = arith.constant 7 : i64
      %4273 = func.call @cc_make_string(%4271, %4272) : (!llvm.ptr, i64) -> i64
      %4274 = func.call @cc_intern(%4270, %4273) : (i64, i64) -> i64
      %4275 = func.call @cc_nil_value() : () -> i64
      %4276 = func.call @cc_cons(%4274, %4275) : (i64, i64) -> i64
      %4277 = func.call @cc_values_pack(%4276) : (i64) -> i64
      func.call @stack_push_pointer(%4274) : (i64) -> ()
      %4278 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4279 = func.call @stack_pop_pointer() : () -> i64
      %4280 = func.call @stack_pop_pointer() : () -> i64
      %4281 = func.call @cc_cons(%4280, %4279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4282 = arith.addi %4281, %__rlasp_stack_elide_zero_223 : i64
      %4283 = func.call @stack_pop_pointer() : () -> i64
      %4284 = func.call @cc_cons(%4283, %4282) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4285 = arith.addi %4284, %__rlasp_stack_elide_zero_224 : i64
      %4286 = func.call @stack_pop_pointer() : () -> i64
      %4287 = func.call @cc_cons(%4286, %4285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4288 = arith.addi %4287, %__rlasp_stack_elide_zero_225 : i64
      %4289 = func.call @stack_pop_pointer() : () -> i64
      %4290 = func.call @cc_cons(%4289, %4288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4291 = arith.addi %4290, %__rlasp_stack_elide_zero_226 : i64
      %4332 = arith.constant 122791386939411 : i64
      %4333 = arith.constant 0 : i64
      %4334 = func.call @cc_make_closure(%4332, %4333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4335 = arith.addi %4334, %__rlasp_stack_elide_zero_227 : i64
      func.call @stack_push_nil() : () -> ()
      %4336 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4337 = func.call @stack_pop_pointer() : () -> i64
      %4338 = func.call @stack_pop_pointer() : () -> i64
      %4339 = func.call @cc_cons(%4338, %4337) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4340 = arith.addi %4339, %__rlasp_stack_elide_zero_228 : i64
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @cc_cons(%4341, %4340) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %4343 = arith.addi %4342, %__rlasp_stack_elide_zero_229 : i64
      %4344 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4345 = arith.constant 11 : i64
      %4346 = func.call @cc_make_string(%4344, %4345) : (!llvm.ptr, i64) -> i64
      %4347 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4348 = arith.constant 7 : i64
      %4349 = func.call @cc_make_string(%4347, %4348) : (!llvm.ptr, i64) -> i64
      %4350 = func.call @cc_intern(%4346, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_nil_value() : () -> i64
      %4352 = func.call @cc_cons(%4350, %4351) : (i64, i64) -> i64
      %4353 = func.call @cc_values_pack(%4352) : (i64) -> i64
      %4354 = func.call @cc_nil_value() : () -> i64
      %4355 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4356 = arith.constant 4 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4359 = arith.constant 7 : i64
      %4360 = func.call @cc_make_string(%4358, %4359) : (!llvm.ptr, i64) -> i64
      %4361 = func.call @cc_intern(%4357, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_nil_value() : () -> i64
      %4363 = func.call @cc_cons(%4361, %4362) : (i64, i64) -> i64
      %4364 = func.call @cc_values_pack(%4363) : (i64) -> i64
      %4365 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4366 = arith.constant 6 : i64
      %4367 = func.call @cc_make_string(%4365, %4366) : (!llvm.ptr, i64) -> i64
      %4368 = func.call @cc_nil_value() : () -> i64
      %4369 = func.call @cc_intern(%4367, %4368) : (i64, i64) -> i64
      %4370 = func.call @cc_nil_value() : () -> i64
      %4371 = func.call @cc_cons(%4369, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_values_pack(%4371) : (i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %4373 = arith.addi %4369, %__rlasp_stack_elide_zero_230 : i64
      %4374 = func.call @cc_nil_value() : () -> i64
      %4375 = func.call @cc_errorp(%4254) : (i64) -> i64
      %4376 = arith.cmpi ne, %4375, %4374 : i64
      %4377 = arith.cmpi eq, %4374, %4374 : i64
      %4378 = arith.andi %4376, %4377 : i1
      %4379 = scf.if %4378 -> (i64) {
        scf.yield %4254 : i64
      } else {
        scf.yield %4374 : i64
      }
      %4380 = func.call @cc_errorp(%4291) : (i64) -> i64
      %4381 = arith.cmpi ne, %4380, %4374 : i64
      %4382 = arith.cmpi eq, %4379, %4374 : i64
      %4383 = arith.andi %4381, %4382 : i1
      %4384 = scf.if %4383 -> (i64) {
        scf.yield %4291 : i64
      } else {
        scf.yield %4379 : i64
      }
      %4385 = func.call @cc_errorp(%4335) : (i64) -> i64
      %4386 = arith.cmpi ne, %4385, %4374 : i64
      %4387 = arith.cmpi eq, %4384, %4374 : i64
      %4388 = arith.andi %4386, %4387 : i1
      %4389 = scf.if %4388 -> (i64) {
        scf.yield %4335 : i64
      } else {
        scf.yield %4384 : i64
      }
      %4390 = func.call @cc_errorp(%4343) : (i64) -> i64
      %4391 = arith.cmpi ne, %4390, %4374 : i64
      %4392 = arith.cmpi eq, %4389, %4374 : i64
      %4393 = arith.andi %4391, %4392 : i1
      %4394 = scf.if %4393 -> (i64) {
        scf.yield %4343 : i64
      } else {
        scf.yield %4389 : i64
      }
      %4395 = func.call @cc_errorp(%4350) : (i64) -> i64
      %4396 = arith.cmpi ne, %4395, %4374 : i64
      %4397 = arith.cmpi eq, %4394, %4374 : i64
      %4398 = arith.andi %4396, %4397 : i1
      %4399 = scf.if %4398 -> (i64) {
        scf.yield %4350 : i64
      } else {
        scf.yield %4394 : i64
      }
      %4400 = func.call @cc_errorp(%4354) : (i64) -> i64
      %4401 = arith.cmpi ne, %4400, %4374 : i64
      %4402 = arith.cmpi eq, %4399, %4374 : i64
      %4403 = arith.andi %4401, %4402 : i1
      %4404 = scf.if %4403 -> (i64) {
        scf.yield %4354 : i64
      } else {
        scf.yield %4399 : i64
      }
      %4405 = func.call @cc_errorp(%4361) : (i64) -> i64
      %4406 = arith.cmpi ne, %4405, %4374 : i64
      %4407 = arith.cmpi eq, %4404, %4374 : i64
      %4408 = arith.andi %4406, %4407 : i1
      %4409 = scf.if %4408 -> (i64) {
        scf.yield %4361 : i64
      } else {
        scf.yield %4404 : i64
      }
      %4410 = func.call @cc_errorp(%4373) : (i64) -> i64
      %4411 = arith.cmpi ne, %4410, %4374 : i64
      %4412 = arith.cmpi eq, %4409, %4374 : i64
      %4413 = arith.andi %4411, %4412 : i1
      %4414 = scf.if %4413 -> (i64) {
        scf.yield %4373 : i64
      } else {
        scf.yield %4409 : i64
      }
      %4415 = arith.cmpi ne, %4414, %4374 : i64
      scf.if %4415 {
        func.call @stack_push_pointer(%4414) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4254) : (i64) -> ()
        func.call @stack_push_pointer(%4291) : (i64) -> ()
        func.call @stack_push_pointer(%4335) : (i64) -> ()
        func.call @stack_push_pointer(%4343) : (i64) -> ()
        func.call @stack_push_pointer(%4350) : (i64) -> ()
        func.call @stack_push_pointer(%4354) : (i64) -> ()
        func.call @stack_push_pointer(%4361) : (i64) -> ()
        func.call @stack_push_pointer(%4373) : (i64) -> ()
        %4416 = llvm.mlir.addressof @str374 : !llvm.ptr
        %4417 = func.call @cc_make_function_ref_const(%4416) : (!llvm.ptr) -> i64
        %4418 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4417, %4418) : (i64, i64) -> ()
      }
      %4419 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4419 : i64
    }
    %4420 = func.call @cc_nil_value() : () -> i64
    %4421 = func.call @cc_errorp(%4245) : (i64) -> i64
    %4422 = arith.cmpi ne, %4421, %4420 : i64
    %4423 = scf.if %4422 -> (i64) {
      scf.yield %4245 : i64
    } else {
      %4424 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4425 = arith.constant 15 : i64
      %4426 = func.call @cc_make_string(%4424, %4425) : (!llvm.ptr, i64) -> i64
      %4427 = func.call @cc_nil_value() : () -> i64
      %4428 = func.call @cc_intern(%4426, %4427) : (i64, i64) -> i64
      %4429 = func.call @cc_nil_value() : () -> i64
      %4430 = func.call @cc_cons(%4428, %4429) : (i64, i64) -> i64
      %4431 = func.call @cc_values_pack(%4430) : (i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %4432 = arith.addi %4428, %__rlasp_stack_elide_zero_231 : i64
      %4433 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4434 = arith.constant 13 : i64
      %4435 = func.call @cc_make_string(%4433, %4434) : (!llvm.ptr, i64) -> i64
      %4436 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4437 = arith.constant 11 : i64
      %4438 = func.call @cc_make_string(%4436, %4437) : (!llvm.ptr, i64) -> i64
      %4439 = func.call @cc_intern(%4435, %4438) : (i64, i64) -> i64
      %4440 = func.call @cc_nil_value() : () -> i64
      %4441 = func.call @cc_cons(%4439, %4440) : (i64, i64) -> i64
      %4442 = func.call @cc_values_pack(%4441) : (i64) -> i64
      func.call @stack_push_pointer(%4439) : (i64) -> ()
      %4443 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4444 = arith.constant 1 : i64
      %4445 = func.call @cc_make_string(%4443, %4444) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4445) : (i64) -> ()
      %4446 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4447 = arith.constant 12 : i64
      %4448 = func.call @cc_make_string(%4446, %4447) : (!llvm.ptr, i64) -> i64
      %4449 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4450 = arith.constant 7 : i64
      %4451 = func.call @cc_make_string(%4449, %4450) : (!llvm.ptr, i64) -> i64
      %4452 = func.call @cc_intern(%4448, %4451) : (i64, i64) -> i64
      %4453 = func.call @cc_nil_value() : () -> i64
      %4454 = func.call @cc_cons(%4452, %4453) : (i64, i64) -> i64
      %4455 = func.call @cc_values_pack(%4454) : (i64) -> i64
      func.call @stack_push_pointer(%4452) : (i64) -> ()
      %4456 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4456) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4457 = func.call @stack_pop_pointer() : () -> i64
      %4458 = func.call @stack_pop_pointer() : () -> i64
      %4459 = func.call @cc_cons(%4458, %4457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %4460 = arith.addi %4459, %__rlasp_stack_elide_zero_232 : i64
      %4461 = func.call @stack_pop_pointer() : () -> i64
      %4462 = func.call @cc_cons(%4461, %4460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %4463 = arith.addi %4462, %__rlasp_stack_elide_zero_233 : i64
      %4464 = func.call @stack_pop_pointer() : () -> i64
      %4465 = func.call @cc_cons(%4464, %4463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %4466 = arith.addi %4465, %__rlasp_stack_elide_zero_234 : i64
      %4467 = func.call @stack_pop_pointer() : () -> i64
      %4468 = func.call @cc_cons(%4467, %4466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %4469 = arith.addi %4468, %__rlasp_stack_elide_zero_235 : i64
      %4510 = arith.constant 122791386939412 : i64
      %4511 = arith.constant 0 : i64
      %4512 = func.call @cc_make_closure(%4510, %4511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %4513 = arith.addi %4512, %__rlasp_stack_elide_zero_236 : i64
      func.call @stack_push_nil() : () -> ()
      %4514 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = func.call @cc_cons(%4516, %4515) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %4518 = arith.addi %4517, %__rlasp_stack_elide_zero_237 : i64
      %4519 = func.call @stack_pop_pointer() : () -> i64
      %4520 = func.call @cc_cons(%4519, %4518) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %4521 = arith.addi %4520, %__rlasp_stack_elide_zero_238 : i64
      %4522 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4523 = arith.constant 11 : i64
      %4524 = func.call @cc_make_string(%4522, %4523) : (!llvm.ptr, i64) -> i64
      %4525 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4526 = arith.constant 7 : i64
      %4527 = func.call @cc_make_string(%4525, %4526) : (!llvm.ptr, i64) -> i64
      %4528 = func.call @cc_intern(%4524, %4527) : (i64, i64) -> i64
      %4529 = func.call @cc_nil_value() : () -> i64
      %4530 = func.call @cc_cons(%4528, %4529) : (i64, i64) -> i64
      %4531 = func.call @cc_values_pack(%4530) : (i64) -> i64
      %4532 = func.call @cc_nil_value() : () -> i64
      %4533 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4534 = arith.constant 4 : i64
      %4535 = func.call @cc_make_string(%4533, %4534) : (!llvm.ptr, i64) -> i64
      %4536 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4537 = arith.constant 7 : i64
      %4538 = func.call @cc_make_string(%4536, %4537) : (!llvm.ptr, i64) -> i64
      %4539 = func.call @cc_intern(%4535, %4538) : (i64, i64) -> i64
      %4540 = func.call @cc_nil_value() : () -> i64
      %4541 = func.call @cc_cons(%4539, %4540) : (i64, i64) -> i64
      %4542 = func.call @cc_values_pack(%4541) : (i64) -> i64
      %4543 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4544 = arith.constant 6 : i64
      %4545 = func.call @cc_make_string(%4543, %4544) : (!llvm.ptr, i64) -> i64
      %4546 = func.call @cc_nil_value() : () -> i64
      %4547 = func.call @cc_intern(%4545, %4546) : (i64, i64) -> i64
      %4548 = func.call @cc_nil_value() : () -> i64
      %4549 = func.call @cc_cons(%4547, %4548) : (i64, i64) -> i64
      %4550 = func.call @cc_values_pack(%4549) : (i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %4551 = arith.addi %4547, %__rlasp_stack_elide_zero_239 : i64
      %4552 = func.call @cc_nil_value() : () -> i64
      %4553 = func.call @cc_errorp(%4432) : (i64) -> i64
      %4554 = arith.cmpi ne, %4553, %4552 : i64
      %4555 = arith.cmpi eq, %4552, %4552 : i64
      %4556 = arith.andi %4554, %4555 : i1
      %4557 = scf.if %4556 -> (i64) {
        scf.yield %4432 : i64
      } else {
        scf.yield %4552 : i64
      }
      %4558 = func.call @cc_errorp(%4469) : (i64) -> i64
      %4559 = arith.cmpi ne, %4558, %4552 : i64
      %4560 = arith.cmpi eq, %4557, %4552 : i64
      %4561 = arith.andi %4559, %4560 : i1
      %4562 = scf.if %4561 -> (i64) {
        scf.yield %4469 : i64
      } else {
        scf.yield %4557 : i64
      }
      %4563 = func.call @cc_errorp(%4513) : (i64) -> i64
      %4564 = arith.cmpi ne, %4563, %4552 : i64
      %4565 = arith.cmpi eq, %4562, %4552 : i64
      %4566 = arith.andi %4564, %4565 : i1
      %4567 = scf.if %4566 -> (i64) {
        scf.yield %4513 : i64
      } else {
        scf.yield %4562 : i64
      }
      %4568 = func.call @cc_errorp(%4521) : (i64) -> i64
      %4569 = arith.cmpi ne, %4568, %4552 : i64
      %4570 = arith.cmpi eq, %4567, %4552 : i64
      %4571 = arith.andi %4569, %4570 : i1
      %4572 = scf.if %4571 -> (i64) {
        scf.yield %4521 : i64
      } else {
        scf.yield %4567 : i64
      }
      %4573 = func.call @cc_errorp(%4528) : (i64) -> i64
      %4574 = arith.cmpi ne, %4573, %4552 : i64
      %4575 = arith.cmpi eq, %4572, %4552 : i64
      %4576 = arith.andi %4574, %4575 : i1
      %4577 = scf.if %4576 -> (i64) {
        scf.yield %4528 : i64
      } else {
        scf.yield %4572 : i64
      }
      %4578 = func.call @cc_errorp(%4532) : (i64) -> i64
      %4579 = arith.cmpi ne, %4578, %4552 : i64
      %4580 = arith.cmpi eq, %4577, %4552 : i64
      %4581 = arith.andi %4579, %4580 : i1
      %4582 = scf.if %4581 -> (i64) {
        scf.yield %4532 : i64
      } else {
        scf.yield %4577 : i64
      }
      %4583 = func.call @cc_errorp(%4539) : (i64) -> i64
      %4584 = arith.cmpi ne, %4583, %4552 : i64
      %4585 = arith.cmpi eq, %4582, %4552 : i64
      %4586 = arith.andi %4584, %4585 : i1
      %4587 = scf.if %4586 -> (i64) {
        scf.yield %4539 : i64
      } else {
        scf.yield %4582 : i64
      }
      %4588 = func.call @cc_errorp(%4551) : (i64) -> i64
      %4589 = arith.cmpi ne, %4588, %4552 : i64
      %4590 = arith.cmpi eq, %4587, %4552 : i64
      %4591 = arith.andi %4589, %4590 : i1
      %4592 = scf.if %4591 -> (i64) {
        scf.yield %4551 : i64
      } else {
        scf.yield %4587 : i64
      }
      %4593 = arith.cmpi ne, %4592, %4552 : i64
      scf.if %4593 {
        func.call @stack_push_pointer(%4592) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4432) : (i64) -> ()
        func.call @stack_push_pointer(%4469) : (i64) -> ()
        func.call @stack_push_pointer(%4513) : (i64) -> ()
        func.call @stack_push_pointer(%4521) : (i64) -> ()
        func.call @stack_push_pointer(%4528) : (i64) -> ()
        func.call @stack_push_pointer(%4532) : (i64) -> ()
        func.call @stack_push_pointer(%4539) : (i64) -> ()
        func.call @stack_push_pointer(%4551) : (i64) -> ()
        %4594 = llvm.mlir.addressof @str390 : !llvm.ptr
        %4595 = func.call @cc_make_function_ref_const(%4594) : (!llvm.ptr) -> i64
        %4596 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4595, %4596) : (i64, i64) -> ()
      }
      %4597 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4597 : i64
    }
    %4598 = func.call @cc_nil_value() : () -> i64
    %4599 = func.call @cc_errorp(%4423) : (i64) -> i64
    %4600 = arith.cmpi ne, %4599, %4598 : i64
    %4601 = scf.if %4600 -> (i64) {
      scf.yield %4423 : i64
    } else {
      %4602 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4603 = arith.constant 15 : i64
      %4604 = func.call @cc_make_string(%4602, %4603) : (!llvm.ptr, i64) -> i64
      %4605 = func.call @cc_nil_value() : () -> i64
      %4606 = func.call @cc_intern(%4604, %4605) : (i64, i64) -> i64
      %4607 = func.call @cc_nil_value() : () -> i64
      %4608 = func.call @cc_cons(%4606, %4607) : (i64, i64) -> i64
      %4609 = func.call @cc_values_pack(%4608) : (i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %4610 = arith.addi %4606, %__rlasp_stack_elide_zero_240 : i64
      %4611 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4612 = arith.constant 13 : i64
      %4613 = func.call @cc_make_string(%4611, %4612) : (!llvm.ptr, i64) -> i64
      %4614 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4615 = arith.constant 11 : i64
      %4616 = func.call @cc_make_string(%4614, %4615) : (!llvm.ptr, i64) -> i64
      %4617 = func.call @cc_intern(%4613, %4616) : (i64, i64) -> i64
      %4618 = func.call @cc_nil_value() : () -> i64
      %4619 = func.call @cc_cons(%4617, %4618) : (i64, i64) -> i64
      %4620 = func.call @cc_values_pack(%4619) : (i64) -> i64
      func.call @stack_push_pointer(%4617) : (i64) -> ()
      %4621 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4622 = arith.constant 0 : i64
      %4623 = func.call @cc_make_string(%4621, %4622) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4623) : (i64) -> ()
      %4624 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4625 = arith.constant 12 : i64
      %4626 = func.call @cc_make_string(%4624, %4625) : (!llvm.ptr, i64) -> i64
      %4627 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4628 = arith.constant 7 : i64
      %4629 = func.call @cc_make_string(%4627, %4628) : (!llvm.ptr, i64) -> i64
      %4630 = func.call @cc_intern(%4626, %4629) : (i64, i64) -> i64
      %4631 = func.call @cc_nil_value() : () -> i64
      %4632 = func.call @cc_cons(%4630, %4631) : (i64, i64) -> i64
      %4633 = func.call @cc_values_pack(%4632) : (i64) -> i64
      func.call @stack_push_pointer(%4630) : (i64) -> ()
      %4634 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4635 = func.call @stack_pop_pointer() : () -> i64
      %4636 = func.call @stack_pop_pointer() : () -> i64
      %4637 = func.call @cc_cons(%4636, %4635) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %4638 = arith.addi %4637, %__rlasp_stack_elide_zero_241 : i64
      %4639 = func.call @stack_pop_pointer() : () -> i64
      %4640 = func.call @cc_cons(%4639, %4638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %4641 = arith.addi %4640, %__rlasp_stack_elide_zero_242 : i64
      %4642 = func.call @stack_pop_pointer() : () -> i64
      %4643 = func.call @cc_cons(%4642, %4641) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %4644 = arith.addi %4643, %__rlasp_stack_elide_zero_243 : i64
      %4645 = func.call @stack_pop_pointer() : () -> i64
      %4646 = func.call @cc_cons(%4645, %4644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %4647 = arith.addi %4646, %__rlasp_stack_elide_zero_244 : i64
      %4688 = arith.constant 122791386939413 : i64
      %4689 = arith.constant 0 : i64
      %4690 = func.call @cc_make_closure(%4688, %4689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %4691 = arith.addi %4690, %__rlasp_stack_elide_zero_245 : i64
      func.call @stack_push_nil() : () -> ()
      %4692 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4693 = func.call @stack_pop_pointer() : () -> i64
      %4694 = func.call @stack_pop_pointer() : () -> i64
      %4695 = func.call @cc_cons(%4694, %4693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %4696 = arith.addi %4695, %__rlasp_stack_elide_zero_246 : i64
      %4697 = func.call @stack_pop_pointer() : () -> i64
      %4698 = func.call @cc_cons(%4697, %4696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %4699 = arith.addi %4698, %__rlasp_stack_elide_zero_247 : i64
      %4700 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4701 = arith.constant 11 : i64
      %4702 = func.call @cc_make_string(%4700, %4701) : (!llvm.ptr, i64) -> i64
      %4703 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4704 = arith.constant 7 : i64
      %4705 = func.call @cc_make_string(%4703, %4704) : (!llvm.ptr, i64) -> i64
      %4706 = func.call @cc_intern(%4702, %4705) : (i64, i64) -> i64
      %4707 = func.call @cc_nil_value() : () -> i64
      %4708 = func.call @cc_cons(%4706, %4707) : (i64, i64) -> i64
      %4709 = func.call @cc_values_pack(%4708) : (i64) -> i64
      %4710 = func.call @cc_nil_value() : () -> i64
      %4711 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4712 = arith.constant 4 : i64
      %4713 = func.call @cc_make_string(%4711, %4712) : (!llvm.ptr, i64) -> i64
      %4714 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4715 = arith.constant 7 : i64
      %4716 = func.call @cc_make_string(%4714, %4715) : (!llvm.ptr, i64) -> i64
      %4717 = func.call @cc_intern(%4713, %4716) : (i64, i64) -> i64
      %4718 = func.call @cc_nil_value() : () -> i64
      %4719 = func.call @cc_cons(%4717, %4718) : (i64, i64) -> i64
      %4720 = func.call @cc_values_pack(%4719) : (i64) -> i64
      %4721 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4722 = arith.constant 6 : i64
      %4723 = func.call @cc_make_string(%4721, %4722) : (!llvm.ptr, i64) -> i64
      %4724 = func.call @cc_nil_value() : () -> i64
      %4725 = func.call @cc_intern(%4723, %4724) : (i64, i64) -> i64
      %4726 = func.call @cc_nil_value() : () -> i64
      %4727 = func.call @cc_cons(%4725, %4726) : (i64, i64) -> i64
      %4728 = func.call @cc_values_pack(%4727) : (i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %4729 = arith.addi %4725, %__rlasp_stack_elide_zero_248 : i64
      %4730 = func.call @cc_nil_value() : () -> i64
      %4731 = func.call @cc_errorp(%4610) : (i64) -> i64
      %4732 = arith.cmpi ne, %4731, %4730 : i64
      %4733 = arith.cmpi eq, %4730, %4730 : i64
      %4734 = arith.andi %4732, %4733 : i1
      %4735 = scf.if %4734 -> (i64) {
        scf.yield %4610 : i64
      } else {
        scf.yield %4730 : i64
      }
      %4736 = func.call @cc_errorp(%4647) : (i64) -> i64
      %4737 = arith.cmpi ne, %4736, %4730 : i64
      %4738 = arith.cmpi eq, %4735, %4730 : i64
      %4739 = arith.andi %4737, %4738 : i1
      %4740 = scf.if %4739 -> (i64) {
        scf.yield %4647 : i64
      } else {
        scf.yield %4735 : i64
      }
      %4741 = func.call @cc_errorp(%4691) : (i64) -> i64
      %4742 = arith.cmpi ne, %4741, %4730 : i64
      %4743 = arith.cmpi eq, %4740, %4730 : i64
      %4744 = arith.andi %4742, %4743 : i1
      %4745 = scf.if %4744 -> (i64) {
        scf.yield %4691 : i64
      } else {
        scf.yield %4740 : i64
      }
      %4746 = func.call @cc_errorp(%4699) : (i64) -> i64
      %4747 = arith.cmpi ne, %4746, %4730 : i64
      %4748 = arith.cmpi eq, %4745, %4730 : i64
      %4749 = arith.andi %4747, %4748 : i1
      %4750 = scf.if %4749 -> (i64) {
        scf.yield %4699 : i64
      } else {
        scf.yield %4745 : i64
      }
      %4751 = func.call @cc_errorp(%4706) : (i64) -> i64
      %4752 = arith.cmpi ne, %4751, %4730 : i64
      %4753 = arith.cmpi eq, %4750, %4730 : i64
      %4754 = arith.andi %4752, %4753 : i1
      %4755 = scf.if %4754 -> (i64) {
        scf.yield %4706 : i64
      } else {
        scf.yield %4750 : i64
      }
      %4756 = func.call @cc_errorp(%4710) : (i64) -> i64
      %4757 = arith.cmpi ne, %4756, %4730 : i64
      %4758 = arith.cmpi eq, %4755, %4730 : i64
      %4759 = arith.andi %4757, %4758 : i1
      %4760 = scf.if %4759 -> (i64) {
        scf.yield %4710 : i64
      } else {
        scf.yield %4755 : i64
      }
      %4761 = func.call @cc_errorp(%4717) : (i64) -> i64
      %4762 = arith.cmpi ne, %4761, %4730 : i64
      %4763 = arith.cmpi eq, %4760, %4730 : i64
      %4764 = arith.andi %4762, %4763 : i1
      %4765 = scf.if %4764 -> (i64) {
        scf.yield %4717 : i64
      } else {
        scf.yield %4760 : i64
      }
      %4766 = func.call @cc_errorp(%4729) : (i64) -> i64
      %4767 = arith.cmpi ne, %4766, %4730 : i64
      %4768 = arith.cmpi eq, %4765, %4730 : i64
      %4769 = arith.andi %4767, %4768 : i1
      %4770 = scf.if %4769 -> (i64) {
        scf.yield %4729 : i64
      } else {
        scf.yield %4765 : i64
      }
      %4771 = arith.cmpi ne, %4770, %4730 : i64
      scf.if %4771 {
        func.call @stack_push_pointer(%4770) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4610) : (i64) -> ()
        func.call @stack_push_pointer(%4647) : (i64) -> ()
        func.call @stack_push_pointer(%4691) : (i64) -> ()
        func.call @stack_push_pointer(%4699) : (i64) -> ()
        func.call @stack_push_pointer(%4706) : (i64) -> ()
        func.call @stack_push_pointer(%4710) : (i64) -> ()
        func.call @stack_push_pointer(%4717) : (i64) -> ()
        func.call @stack_push_pointer(%4729) : (i64) -> ()
        %4772 = llvm.mlir.addressof @str406 : !llvm.ptr
        %4773 = func.call @cc_make_function_ref_const(%4772) : (!llvm.ptr) -> i64
        %4774 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4773, %4774) : (i64, i64) -> ()
      }
      %4775 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4775 : i64
    }
    %4776 = func.call @cc_nil_value() : () -> i64
    %4777 = func.call @cc_errorp(%4601) : (i64) -> i64
    %4778 = arith.cmpi ne, %4777, %4776 : i64
    %4779 = scf.if %4778 -> (i64) {
      scf.yield %4601 : i64
    } else {
      %4780 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4781 = arith.constant 14 : i64
      %4782 = func.call @cc_make_string(%4780, %4781) : (!llvm.ptr, i64) -> i64
      %4783 = func.call @cc_nil_value() : () -> i64
      %4784 = func.call @cc_intern(%4782, %4783) : (i64, i64) -> i64
      %4785 = func.call @cc_nil_value() : () -> i64
      %4786 = func.call @cc_cons(%4784, %4785) : (i64, i64) -> i64
      %4787 = func.call @cc_values_pack(%4786) : (i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %4788 = arith.addi %4784, %__rlasp_stack_elide_zero_249 : i64
      %4789 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4790 = arith.constant 3 : i64
      %4791 = func.call @cc_make_string(%4789, %4790) : (!llvm.ptr, i64) -> i64
      %4792 = func.call @cc_nil_value() : () -> i64
      %4793 = func.call @cc_intern(%4791, %4792) : (i64, i64) -> i64
      %4794 = func.call @cc_nil_value() : () -> i64
      %4795 = func.call @cc_cons(%4793, %4794) : (i64, i64) -> i64
      %4796 = func.call @cc_values_pack(%4795) : (i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      %4797 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4798 = arith.constant 3 : i64
      %4799 = func.call @cc_make_string(%4797, %4798) : (!llvm.ptr, i64) -> i64
      %4800 = func.call @cc_nil_value() : () -> i64
      %4801 = func.call @cc_intern(%4799, %4800) : (i64, i64) -> i64
      %4802 = func.call @cc_nil_value() : () -> i64
      %4803 = func.call @cc_cons(%4801, %4802) : (i64, i64) -> i64
      %4804 = func.call @cc_values_pack(%4803) : (i64) -> i64
      func.call @stack_push_pointer(%4801) : (i64) -> ()
      %4805 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4806 = arith.constant 2 : i64
      %4807 = func.call @cc_make_string(%4805, %4806) : (!llvm.ptr, i64) -> i64
      %4808 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4809 = arith.constant 11 : i64
      %4810 = func.call @cc_make_string(%4808, %4809) : (!llvm.ptr, i64) -> i64
      %4811 = func.call @cc_intern(%4807, %4810) : (i64, i64) -> i64
      %4812 = func.call @cc_nil_value() : () -> i64
      %4813 = func.call @cc_cons(%4811, %4812) : (i64, i64) -> i64
      %4814 = func.call @cc_values_pack(%4813) : (i64) -> i64
      func.call @stack_push_pointer(%4811) : (i64) -> ()
      %4815 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4816 = arith.constant 8 : i64
      %4817 = func.call @cc_make_string(%4815, %4816) : (!llvm.ptr, i64) -> i64
      %4818 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4819 = arith.constant 11 : i64
      %4820 = func.call @cc_make_string(%4818, %4819) : (!llvm.ptr, i64) -> i64
      %4821 = func.call @cc_intern(%4817, %4820) : (i64, i64) -> i64
      %4822 = func.call @cc_nil_value() : () -> i64
      %4823 = func.call @cc_cons(%4821, %4822) : (i64, i64) -> i64
      %4824 = func.call @cc_values_pack(%4823) : (i64) -> i64
      func.call @stack_push_pointer(%4821) : (i64) -> ()
      %4825 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4826 = arith.constant 7 : i64
      %4827 = func.call @cc_make_string(%4825, %4826) : (!llvm.ptr, i64) -> i64
      %4828 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4829 = arith.constant 11 : i64
      %4830 = func.call @cc_make_string(%4828, %4829) : (!llvm.ptr, i64) -> i64
      %4831 = func.call @cc_intern(%4827, %4830) : (i64, i64) -> i64
      %4832 = func.call @cc_nil_value() : () -> i64
      %4833 = func.call @cc_cons(%4831, %4832) : (i64, i64) -> i64
      %4834 = func.call @cc_values_pack(%4833) : (i64) -> i64
      func.call @stack_push_pointer(%4831) : (i64) -> ()
      %4835 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4836 = arith.constant 3 : i64
      %4837 = func.call @cc_make_string(%4835, %4836) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4838 = func.call @stack_pop_pointer() : () -> i64
      %4839 = func.call @stack_pop_pointer() : () -> i64
      %4840 = func.call @cc_cons(%4839, %4838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %4841 = arith.addi %4840, %__rlasp_stack_elide_zero_250 : i64
      %4842 = func.call @stack_pop_pointer() : () -> i64
      %4843 = func.call @cc_cons(%4842, %4841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4843) : (i64) -> ()
      %4844 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4844) : (i64) -> ()
      %4845 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4846 = arith.constant 12 : i64
      %4847 = func.call @cc_make_string(%4845, %4846) : (!llvm.ptr, i64) -> i64
      %4848 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4849 = arith.constant 11 : i64
      %4850 = func.call @cc_make_string(%4848, %4849) : (!llvm.ptr, i64) -> i64
      %4851 = func.call @cc_intern(%4847, %4850) : (i64, i64) -> i64
      %4852 = func.call @cc_nil_value() : () -> i64
      %4853 = func.call @cc_cons(%4851, %4852) : (i64, i64) -> i64
      %4854 = func.call @cc_values_pack(%4853) : (i64) -> i64
      func.call @stack_push_pointer(%4851) : (i64) -> ()
      %4855 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4856 = arith.constant 9 : i64
      %4857 = func.call @cc_make_string(%4855, %4856) : (!llvm.ptr, i64) -> i64
      %4858 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4859 = arith.constant 11 : i64
      %4860 = func.call @cc_make_string(%4858, %4859) : (!llvm.ptr, i64) -> i64
      %4861 = func.call @cc_intern(%4857, %4860) : (i64, i64) -> i64
      %4862 = func.call @cc_nil_value() : () -> i64
      %4863 = func.call @cc_cons(%4861, %4862) : (i64, i64) -> i64
      %4864 = func.call @cc_values_pack(%4863) : (i64) -> i64
      func.call @stack_push_pointer(%4861) : (i64) -> ()
      %4865 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4865) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4866 = func.call @stack_pop_pointer() : () -> i64
      %4867 = func.call @stack_pop_pointer() : () -> i64
      %4868 = func.call @cc_cons(%4867, %4866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4868) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4869 = func.call @stack_pop_pointer() : () -> i64
      %4870 = func.call @stack_pop_pointer() : () -> i64
      %4871 = func.call @cc_cons(%4870, %4869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %4872 = arith.addi %4871, %__rlasp_stack_elide_zero_251 : i64
      %4873 = func.call @stack_pop_pointer() : () -> i64
      %4874 = func.call @cc_cons(%4873, %4872) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %4875 = arith.addi %4874, %__rlasp_stack_elide_zero_252 : i64
      %4876 = func.call @stack_pop_pointer() : () -> i64
      %4877 = func.call @cc_cons(%4876, %4875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %4878 = arith.addi %4877, %__rlasp_stack_elide_zero_253 : i64
      %4879 = func.call @stack_pop_pointer() : () -> i64
      %4880 = func.call @cc_cons(%4878, %4879) : (i64, i64) -> i64
      %4881 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4882 = arith.constant 5 : i64
      %4883 = func.call @cc_make_string(%4881, %4882) : (!llvm.ptr, i64) -> i64
      %4884 = func.call @cc_nil_value() : () -> i64
      %4885 = func.call @cc_intern(%4883, %4884) : (i64, i64) -> i64
      %4886 = func.call @cc_nil_value() : () -> i64
      %4887 = func.call @cc_cons(%4885, %4886) : (i64, i64) -> i64
      %4888 = func.call @cc_values_pack(%4887) : (i64) -> i64
      %4889 = func.call @cc_cons(%4885, %4880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4889) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4890 = func.call @stack_pop_pointer() : () -> i64
      %4891 = func.call @stack_pop_pointer() : () -> i64
      %4892 = func.call @cc_cons(%4891, %4890) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %4893 = arith.addi %4892, %__rlasp_stack_elide_zero_254 : i64
      %4894 = func.call @stack_pop_pointer() : () -> i64
      %4895 = func.call @cc_cons(%4894, %4893) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %4896 = arith.addi %4895, %__rlasp_stack_elide_zero_255 : i64
      %4897 = func.call @stack_pop_pointer() : () -> i64
      %4898 = func.call @cc_cons(%4897, %4896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4898) : (i64) -> ()
      %4899 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4900 = arith.constant 8 : i64
      %4901 = func.call @cc_make_string(%4899, %4900) : (!llvm.ptr, i64) -> i64
      %4902 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4903 = arith.constant 11 : i64
      %4904 = func.call @cc_make_string(%4902, %4903) : (!llvm.ptr, i64) -> i64
      %4905 = func.call @cc_intern(%4901, %4904) : (i64, i64) -> i64
      %4906 = func.call @cc_nil_value() : () -> i64
      %4907 = func.call @cc_cons(%4905, %4906) : (i64, i64) -> i64
      %4908 = func.call @cc_values_pack(%4907) : (i64) -> i64
      func.call @stack_push_pointer(%4905) : (i64) -> ()
      %4909 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4910 = arith.constant 7 : i64
      %4911 = func.call @cc_make_string(%4909, %4910) : (!llvm.ptr, i64) -> i64
      %4912 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4913 = arith.constant 11 : i64
      %4914 = func.call @cc_make_string(%4912, %4913) : (!llvm.ptr, i64) -> i64
      %4915 = func.call @cc_intern(%4911, %4914) : (i64, i64) -> i64
      %4916 = func.call @cc_nil_value() : () -> i64
      %4917 = func.call @cc_cons(%4915, %4916) : (i64, i64) -> i64
      %4918 = func.call @cc_values_pack(%4917) : (i64) -> i64
      func.call @stack_push_pointer(%4915) : (i64) -> ()
      %4919 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4920 = arith.constant 3 : i64
      %4921 = func.call @cc_make_string(%4919, %4920) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4921) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4922 = func.call @stack_pop_pointer() : () -> i64
      %4923 = func.call @stack_pop_pointer() : () -> i64
      %4924 = func.call @cc_cons(%4923, %4922) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %4925 = arith.addi %4924, %__rlasp_stack_elide_zero_256 : i64
      %4926 = func.call @stack_pop_pointer() : () -> i64
      %4927 = func.call @cc_cons(%4926, %4925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4927) : (i64) -> ()
      %4928 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4928) : (i64) -> ()
      %4929 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4930 = arith.constant 12 : i64
      %4931 = func.call @cc_make_string(%4929, %4930) : (!llvm.ptr, i64) -> i64
      %4932 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4933 = arith.constant 11 : i64
      %4934 = func.call @cc_make_string(%4932, %4933) : (!llvm.ptr, i64) -> i64
      %4935 = func.call @cc_intern(%4931, %4934) : (i64, i64) -> i64
      %4936 = func.call @cc_nil_value() : () -> i64
      %4937 = func.call @cc_cons(%4935, %4936) : (i64, i64) -> i64
      %4938 = func.call @cc_values_pack(%4937) : (i64) -> i64
      func.call @stack_push_pointer(%4935) : (i64) -> ()
      %4939 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4940 = arith.constant 9 : i64
      %4941 = func.call @cc_make_string(%4939, %4940) : (!llvm.ptr, i64) -> i64
      %4942 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4943 = arith.constant 11 : i64
      %4944 = func.call @cc_make_string(%4942, %4943) : (!llvm.ptr, i64) -> i64
      %4945 = func.call @cc_intern(%4941, %4944) : (i64, i64) -> i64
      %4946 = func.call @cc_nil_value() : () -> i64
      %4947 = func.call @cc_cons(%4945, %4946) : (i64, i64) -> i64
      %4948 = func.call @cc_values_pack(%4947) : (i64) -> i64
      func.call @stack_push_pointer(%4945) : (i64) -> ()
      %4949 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4950 = func.call @stack_pop_pointer() : () -> i64
      %4951 = func.call @stack_pop_pointer() : () -> i64
      %4952 = func.call @cc_cons(%4951, %4950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4953 = func.call @stack_pop_pointer() : () -> i64
      %4954 = func.call @stack_pop_pointer() : () -> i64
      %4955 = func.call @cc_cons(%4954, %4953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %4956 = arith.addi %4955, %__rlasp_stack_elide_zero_257 : i64
      %4957 = func.call @stack_pop_pointer() : () -> i64
      %4958 = func.call @cc_cons(%4957, %4956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %4959 = arith.addi %4958, %__rlasp_stack_elide_zero_258 : i64
      %4960 = func.call @stack_pop_pointer() : () -> i64
      %4961 = func.call @cc_cons(%4960, %4959) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %4962 = arith.addi %4961, %__rlasp_stack_elide_zero_259 : i64
      %4963 = func.call @stack_pop_pointer() : () -> i64
      %4964 = func.call @cc_cons(%4962, %4963) : (i64, i64) -> i64
      %4965 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4966 = arith.constant 5 : i64
      %4967 = func.call @cc_make_string(%4965, %4966) : (!llvm.ptr, i64) -> i64
      %4968 = func.call @cc_nil_value() : () -> i64
      %4969 = func.call @cc_intern(%4967, %4968) : (i64, i64) -> i64
      %4970 = func.call @cc_nil_value() : () -> i64
      %4971 = func.call @cc_cons(%4969, %4970) : (i64, i64) -> i64
      %4972 = func.call @cc_values_pack(%4971) : (i64) -> i64
      %4973 = func.call @cc_cons(%4969, %4964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4974 = func.call @stack_pop_pointer() : () -> i64
      %4975 = func.call @stack_pop_pointer() : () -> i64
      %4976 = func.call @cc_cons(%4975, %4974) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %4977 = arith.addi %4976, %__rlasp_stack_elide_zero_260 : i64
      %4978 = func.call @stack_pop_pointer() : () -> i64
      %4979 = func.call @cc_cons(%4978, %4977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %4980 = arith.addi %4979, %__rlasp_stack_elide_zero_261 : i64
      %4981 = func.call @stack_pop_pointer() : () -> i64
      %4982 = func.call @cc_cons(%4981, %4980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4982) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4983 = func.call @stack_pop_pointer() : () -> i64
      %4984 = func.call @stack_pop_pointer() : () -> i64
      %4985 = func.call @cc_cons(%4984, %4983) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %4986 = arith.addi %4985, %__rlasp_stack_elide_zero_262 : i64
      %4987 = func.call @stack_pop_pointer() : () -> i64
      %4988 = func.call @cc_cons(%4987, %4986) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %4989 = arith.addi %4988, %__rlasp_stack_elide_zero_263 : i64
      %4990 = func.call @stack_pop_pointer() : () -> i64
      %4991 = func.call @cc_cons(%4990, %4989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4992 = func.call @stack_pop_pointer() : () -> i64
      %4993 = func.call @stack_pop_pointer() : () -> i64
      %4994 = func.call @cc_cons(%4993, %4992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %4995 = arith.addi %4994, %__rlasp_stack_elide_zero_264 : i64
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @cc_cons(%4996, %4995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4998 = func.call @stack_pop_pointer() : () -> i64
      %4999 = func.call @stack_pop_pointer() : () -> i64
      %5000 = func.call @cc_cons(%4999, %4998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %5001 = arith.addi %5000, %__rlasp_stack_elide_zero_265 : i64
      %5002 = func.call @stack_pop_pointer() : () -> i64
      %5003 = func.call @cc_cons(%5002, %5001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %5004 = arith.addi %5003, %__rlasp_stack_elide_zero_266 : i64
      %5107 = arith.constant 122791386939414 : i64
      %5108 = arith.constant 0 : i64
      %5109 = func.call @cc_make_closure(%5107, %5108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %5110 = arith.addi %5109, %__rlasp_stack_elide_zero_267 : i64
      %5111 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5112 = arith.constant 1 : i64
      %5113 = func.call @cc_make_string(%5111, %5112) : (!llvm.ptr, i64) -> i64
      %5114 = func.call @cc_nil_value() : () -> i64
      %5115 = func.call @cc_intern(%5113, %5114) : (i64, i64) -> i64
      %5116 = func.call @cc_nil_value() : () -> i64
      %5117 = func.call @cc_cons(%5115, %5116) : (i64, i64) -> i64
      %5118 = func.call @cc_values_pack(%5117) : (i64) -> i64
      func.call @stack_push_pointer(%5115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5119 = func.call @stack_pop_pointer() : () -> i64
      %5120 = func.call @stack_pop_pointer() : () -> i64
      %5121 = func.call @cc_cons(%5120, %5119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %5122 = arith.addi %5121, %__rlasp_stack_elide_zero_268 : i64
      %5123 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5124 = arith.constant 11 : i64
      %5125 = func.call @cc_make_string(%5123, %5124) : (!llvm.ptr, i64) -> i64
      %5126 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5127 = arith.constant 7 : i64
      %5128 = func.call @cc_make_string(%5126, %5127) : (!llvm.ptr, i64) -> i64
      %5129 = func.call @cc_intern(%5125, %5128) : (i64, i64) -> i64
      %5130 = func.call @cc_nil_value() : () -> i64
      %5131 = func.call @cc_cons(%5129, %5130) : (i64, i64) -> i64
      %5132 = func.call @cc_values_pack(%5131) : (i64) -> i64
      %5133 = func.call @cc_nil_value() : () -> i64
      %5134 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5135 = arith.constant 4 : i64
      %5136 = func.call @cc_make_string(%5134, %5135) : (!llvm.ptr, i64) -> i64
      %5137 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5138 = arith.constant 7 : i64
      %5139 = func.call @cc_make_string(%5137, %5138) : (!llvm.ptr, i64) -> i64
      %5140 = func.call @cc_intern(%5136, %5139) : (i64, i64) -> i64
      %5141 = func.call @cc_nil_value() : () -> i64
      %5142 = func.call @cc_cons(%5140, %5141) : (i64, i64) -> i64
      %5143 = func.call @cc_values_pack(%5142) : (i64) -> i64
      %5144 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5145 = arith.constant 6 : i64
      %5146 = func.call @cc_make_string(%5144, %5145) : (!llvm.ptr, i64) -> i64
      %5147 = func.call @cc_nil_value() : () -> i64
      %5148 = func.call @cc_intern(%5146, %5147) : (i64, i64) -> i64
      %5149 = func.call @cc_nil_value() : () -> i64
      %5150 = func.call @cc_cons(%5148, %5149) : (i64, i64) -> i64
      %5151 = func.call @cc_values_pack(%5150) : (i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %5152 = arith.addi %5148, %__rlasp_stack_elide_zero_269 : i64
      %5153 = func.call @cc_nil_value() : () -> i64
      %5154 = func.call @cc_errorp(%4788) : (i64) -> i64
      %5155 = arith.cmpi ne, %5154, %5153 : i64
      %5156 = arith.cmpi eq, %5153, %5153 : i64
      %5157 = arith.andi %5155, %5156 : i1
      %5158 = scf.if %5157 -> (i64) {
        scf.yield %4788 : i64
      } else {
        scf.yield %5153 : i64
      }
      %5159 = func.call @cc_errorp(%5004) : (i64) -> i64
      %5160 = arith.cmpi ne, %5159, %5153 : i64
      %5161 = arith.cmpi eq, %5158, %5153 : i64
      %5162 = arith.andi %5160, %5161 : i1
      %5163 = scf.if %5162 -> (i64) {
        scf.yield %5004 : i64
      } else {
        scf.yield %5158 : i64
      }
      %5164 = func.call @cc_errorp(%5110) : (i64) -> i64
      %5165 = arith.cmpi ne, %5164, %5153 : i64
      %5166 = arith.cmpi eq, %5163, %5153 : i64
      %5167 = arith.andi %5165, %5166 : i1
      %5168 = scf.if %5167 -> (i64) {
        scf.yield %5110 : i64
      } else {
        scf.yield %5163 : i64
      }
      %5169 = func.call @cc_errorp(%5122) : (i64) -> i64
      %5170 = arith.cmpi ne, %5169, %5153 : i64
      %5171 = arith.cmpi eq, %5168, %5153 : i64
      %5172 = arith.andi %5170, %5171 : i1
      %5173 = scf.if %5172 -> (i64) {
        scf.yield %5122 : i64
      } else {
        scf.yield %5168 : i64
      }
      %5174 = func.call @cc_errorp(%5129) : (i64) -> i64
      %5175 = arith.cmpi ne, %5174, %5153 : i64
      %5176 = arith.cmpi eq, %5173, %5153 : i64
      %5177 = arith.andi %5175, %5176 : i1
      %5178 = scf.if %5177 -> (i64) {
        scf.yield %5129 : i64
      } else {
        scf.yield %5173 : i64
      }
      %5179 = func.call @cc_errorp(%5133) : (i64) -> i64
      %5180 = arith.cmpi ne, %5179, %5153 : i64
      %5181 = arith.cmpi eq, %5178, %5153 : i64
      %5182 = arith.andi %5180, %5181 : i1
      %5183 = scf.if %5182 -> (i64) {
        scf.yield %5133 : i64
      } else {
        scf.yield %5178 : i64
      }
      %5184 = func.call @cc_errorp(%5140) : (i64) -> i64
      %5185 = arith.cmpi ne, %5184, %5153 : i64
      %5186 = arith.cmpi eq, %5183, %5153 : i64
      %5187 = arith.andi %5185, %5186 : i1
      %5188 = scf.if %5187 -> (i64) {
        scf.yield %5140 : i64
      } else {
        scf.yield %5183 : i64
      }
      %5189 = func.call @cc_errorp(%5152) : (i64) -> i64
      %5190 = arith.cmpi ne, %5189, %5153 : i64
      %5191 = arith.cmpi eq, %5188, %5153 : i64
      %5192 = arith.andi %5190, %5191 : i1
      %5193 = scf.if %5192 -> (i64) {
        scf.yield %5152 : i64
      } else {
        scf.yield %5188 : i64
      }
      %5194 = arith.cmpi ne, %5193, %5153 : i64
      scf.if %5194 {
        func.call @stack_push_pointer(%5193) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4788) : (i64) -> ()
        func.call @stack_push_pointer(%5004) : (i64) -> ()
        func.call @stack_push_pointer(%5110) : (i64) -> ()
        func.call @stack_push_pointer(%5122) : (i64) -> ()
        func.call @stack_push_pointer(%5129) : (i64) -> ()
        func.call @stack_push_pointer(%5133) : (i64) -> ()
        func.call @stack_push_pointer(%5140) : (i64) -> ()
        func.call @stack_push_pointer(%5152) : (i64) -> ()
        %5195 = llvm.mlir.addressof @str448 : !llvm.ptr
        %5196 = func.call @cc_make_function_ref_const(%5195) : (!llvm.ptr) -> i64
        %5197 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5196, %5197) : (i64, i64) -> ()
      }
      %5198 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5198 : i64
    }
    %5199 = func.call @cc_nil_value() : () -> i64
    %5200 = func.call @cc_errorp(%4779) : (i64) -> i64
    %5201 = arith.cmpi ne, %5200, %5199 : i64
    %5202 = scf.if %5201 -> (i64) {
      scf.yield %4779 : i64
    } else {
      %5203 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5204 = arith.constant 27 : i64
      %5205 = func.call @cc_make_string(%5203, %5204) : (!llvm.ptr, i64) -> i64
      %5206 = func.call @cc_nil_value() : () -> i64
      %5207 = func.call @cc_intern(%5205, %5206) : (i64, i64) -> i64
      %5208 = func.call @cc_nil_value() : () -> i64
      %5209 = func.call @cc_cons(%5207, %5208) : (i64, i64) -> i64
      %5210 = func.call @cc_values_pack(%5209) : (i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %5211 = arith.addi %5207, %__rlasp_stack_elide_zero_270 : i64
      %5212 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5213 = arith.constant 26 : i64
      %5214 = func.call @cc_make_string(%5212, %5213) : (!llvm.ptr, i64) -> i64
      %5215 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5216 = arith.constant 4 : i64
      %5217 = func.call @cc_make_string(%5215, %5216) : (!llvm.ptr, i64) -> i64
      %5218 = func.call @cc_intern(%5214, %5217) : (i64, i64) -> i64
      %5219 = func.call @cc_nil_value() : () -> i64
      %5220 = func.call @cc_cons(%5218, %5219) : (i64, i64) -> i64
      %5221 = func.call @cc_values_pack(%5220) : (i64) -> i64
      func.call @stack_push_pointer(%5218) : (i64) -> ()
      %5222 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5223 = arith.constant 10 : i64
      %5224 = func.call @cc_make_string(%5222, %5223) : (!llvm.ptr, i64) -> i64
      %5225 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5226 = arith.constant 11 : i64
      %5227 = func.call @cc_make_string(%5225, %5226) : (!llvm.ptr, i64) -> i64
      %5228 = func.call @cc_intern(%5224, %5227) : (i64, i64) -> i64
      %5229 = func.call @cc_nil_value() : () -> i64
      %5230 = func.call @cc_cons(%5228, %5229) : (i64, i64) -> i64
      %5231 = func.call @cc_values_pack(%5230) : (i64) -> i64
      func.call @stack_push_pointer(%5228) : (i64) -> ()
      %5232 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5232) : (i64) -> ()
      %5233 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5234 = arith.constant 12 : i64
      %5235 = func.call @cc_make_string(%5233, %5234) : (!llvm.ptr, i64) -> i64
      %5236 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5237 = arith.constant 7 : i64
      %5238 = func.call @cc_make_string(%5236, %5237) : (!llvm.ptr, i64) -> i64
      %5239 = func.call @cc_intern(%5235, %5238) : (i64, i64) -> i64
      %5240 = func.call @cc_nil_value() : () -> i64
      %5241 = func.call @cc_cons(%5239, %5240) : (i64, i64) -> i64
      %5242 = func.call @cc_values_pack(%5241) : (i64) -> i64
      func.call @stack_push_pointer(%5239) : (i64) -> ()
      %5243 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5243) : (i64) -> ()
      %5244 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5245 = arith.constant 9 : i64
      %5246 = func.call @cc_make_string(%5244, %5245) : (!llvm.ptr, i64) -> i64
      %5247 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5248 = arith.constant 11 : i64
      %5249 = func.call @cc_make_string(%5247, %5248) : (!llvm.ptr, i64) -> i64
      %5250 = func.call @cc_intern(%5246, %5249) : (i64, i64) -> i64
      %5251 = func.call @cc_nil_value() : () -> i64
      %5252 = func.call @cc_cons(%5250, %5251) : (i64, i64) -> i64
      %5253 = func.call @cc_values_pack(%5252) : (i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %5254 = arith.addi %5250, %__rlasp_stack_elide_zero_271 : i64
      %5255 = func.call @stack_pop_pointer() : () -> i64
      %5256 = func.call @cc_cons(%5254, %5255) : (i64, i64) -> i64
      %5257 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5258 = arith.constant 5 : i64
      %5259 = func.call @cc_make_string(%5257, %5258) : (!llvm.ptr, i64) -> i64
      %5260 = func.call @cc_nil_value() : () -> i64
      %5261 = func.call @cc_intern(%5259, %5260) : (i64, i64) -> i64
      %5262 = func.call @cc_nil_value() : () -> i64
      %5263 = func.call @cc_cons(%5261, %5262) : (i64, i64) -> i64
      %5264 = func.call @cc_values_pack(%5263) : (i64) -> i64
      %5265 = func.call @cc_cons(%5261, %5256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5265) : (i64) -> ()
      %5266 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5267 = arith.constant 10 : i64
      %5268 = func.call @cc_make_string(%5266, %5267) : (!llvm.ptr, i64) -> i64
      %5269 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5270 = arith.constant 7 : i64
      %5271 = func.call @cc_make_string(%5269, %5270) : (!llvm.ptr, i64) -> i64
      %5272 = func.call @cc_intern(%5268, %5271) : (i64, i64) -> i64
      %5273 = func.call @cc_nil_value() : () -> i64
      %5274 = func.call @cc_cons(%5272, %5273) : (i64, i64) -> i64
      %5275 = func.call @cc_values_pack(%5274) : (i64) -> i64
      func.call @stack_push_pointer(%5272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5276 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5277 = arith.constant 15 : i64
      %5278 = func.call @cc_make_string(%5276, %5277) : (!llvm.ptr, i64) -> i64
      %5279 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5280 = arith.constant 7 : i64
      %5281 = func.call @cc_make_string(%5279, %5280) : (!llvm.ptr, i64) -> i64
      %5282 = func.call @cc_intern(%5278, %5281) : (i64, i64) -> i64
      %5283 = func.call @cc_nil_value() : () -> i64
      %5284 = func.call @cc_cons(%5282, %5283) : (i64, i64) -> i64
      %5285 = func.call @cc_values_pack(%5284) : (i64) -> i64
      func.call @stack_push_pointer(%5282) : (i64) -> ()
      %5286 = arith.constant 67 : i64
      %5287 = func.call @cc_box_character(%5286) : (i64) -> i64
      func.call @stack_push_pointer(%5287) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5288 = func.call @stack_pop_pointer() : () -> i64
      %5289 = func.call @stack_pop_pointer() : () -> i64
      %5290 = func.call @cc_cons(%5289, %5288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %5291 = arith.addi %5290, %__rlasp_stack_elide_zero_272 : i64
      %5292 = func.call @stack_pop_pointer() : () -> i64
      %5293 = func.call @cc_cons(%5292, %5291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %5294 = arith.addi %5293, %__rlasp_stack_elide_zero_273 : i64
      %5295 = func.call @stack_pop_pointer() : () -> i64
      %5296 = func.call @cc_cons(%5295, %5294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %5297 = arith.addi %5296, %__rlasp_stack_elide_zero_274 : i64
      %5298 = func.call @stack_pop_pointer() : () -> i64
      %5299 = func.call @cc_cons(%5298, %5297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %5300 = arith.addi %5299, %__rlasp_stack_elide_zero_275 : i64
      %5301 = func.call @stack_pop_pointer() : () -> i64
      %5302 = func.call @cc_cons(%5301, %5300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %5303 = arith.addi %5302, %__rlasp_stack_elide_zero_276 : i64
      %5304 = func.call @stack_pop_pointer() : () -> i64
      %5305 = func.call @cc_cons(%5304, %5303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %5306 = arith.addi %5305, %__rlasp_stack_elide_zero_277 : i64
      %5307 = func.call @stack_pop_pointer() : () -> i64
      %5308 = func.call @cc_cons(%5307, %5306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %5309 = arith.addi %5308, %__rlasp_stack_elide_zero_278 : i64
      %5310 = func.call @stack_pop_pointer() : () -> i64
      %5311 = func.call @cc_cons(%5310, %5309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5312 = func.call @stack_pop_pointer() : () -> i64
      %5313 = func.call @stack_pop_pointer() : () -> i64
      %5314 = func.call @cc_cons(%5313, %5312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %5315 = arith.addi %5314, %__rlasp_stack_elide_zero_279 : i64
      %5316 = func.call @stack_pop_pointer() : () -> i64
      %5317 = func.call @cc_cons(%5316, %5315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %5318 = arith.addi %5317, %__rlasp_stack_elide_zero_280 : i64
      %5422 = arith.constant 122791386939415 : i64
      %5423 = arith.constant 0 : i64
      %5424 = func.call @cc_make_closure(%5422, %5423) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %5425 = arith.addi %5424, %__rlasp_stack_elide_zero_281 : i64
      %5426 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5427 = arith.constant 3 : i64
      %5428 = func.call @cc_make_string(%5426, %5427) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5429 = func.call @stack_pop_pointer() : () -> i64
      %5430 = func.call @stack_pop_pointer() : () -> i64
      %5431 = func.call @cc_cons(%5430, %5429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %5432 = arith.addi %5431, %__rlasp_stack_elide_zero_282 : i64
      %5433 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5434 = arith.constant 11 : i64
      %5435 = func.call @cc_make_string(%5433, %5434) : (!llvm.ptr, i64) -> i64
      %5436 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5437 = arith.constant 7 : i64
      %5438 = func.call @cc_make_string(%5436, %5437) : (!llvm.ptr, i64) -> i64
      %5439 = func.call @cc_intern(%5435, %5438) : (i64, i64) -> i64
      %5440 = func.call @cc_nil_value() : () -> i64
      %5441 = func.call @cc_cons(%5439, %5440) : (i64, i64) -> i64
      %5442 = func.call @cc_values_pack(%5441) : (i64) -> i64
      %5443 = func.call @cc_nil_value() : () -> i64
      %5444 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5445 = arith.constant 4 : i64
      %5446 = func.call @cc_make_string(%5444, %5445) : (!llvm.ptr, i64) -> i64
      %5447 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5448 = arith.constant 7 : i64
      %5449 = func.call @cc_make_string(%5447, %5448) : (!llvm.ptr, i64) -> i64
      %5450 = func.call @cc_intern(%5446, %5449) : (i64, i64) -> i64
      %5451 = func.call @cc_nil_value() : () -> i64
      %5452 = func.call @cc_cons(%5450, %5451) : (i64, i64) -> i64
      %5453 = func.call @cc_values_pack(%5452) : (i64) -> i64
      %5454 = llvm.mlir.addressof @str478 : !llvm.ptr
      %5455 = arith.constant 7 : i64
      %5456 = func.call @cc_make_string(%5454, %5455) : (!llvm.ptr, i64) -> i64
      %5457 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5458 = arith.constant 11 : i64
      %5459 = func.call @cc_make_string(%5457, %5458) : (!llvm.ptr, i64) -> i64
      %5460 = func.call @cc_intern(%5456, %5459) : (i64, i64) -> i64
      %5461 = func.call @cc_nil_value() : () -> i64
      %5462 = func.call @cc_cons(%5460, %5461) : (i64, i64) -> i64
      %5463 = func.call @cc_values_pack(%5462) : (i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %5464 = arith.addi %5460, %__rlasp_stack_elide_zero_283 : i64
      %5465 = func.call @cc_nil_value() : () -> i64
      %5466 = func.call @cc_errorp(%5211) : (i64) -> i64
      %5467 = arith.cmpi ne, %5466, %5465 : i64
      %5468 = arith.cmpi eq, %5465, %5465 : i64
      %5469 = arith.andi %5467, %5468 : i1
      %5470 = scf.if %5469 -> (i64) {
        scf.yield %5211 : i64
      } else {
        scf.yield %5465 : i64
      }
      %5471 = func.call @cc_errorp(%5318) : (i64) -> i64
      %5472 = arith.cmpi ne, %5471, %5465 : i64
      %5473 = arith.cmpi eq, %5470, %5465 : i64
      %5474 = arith.andi %5472, %5473 : i1
      %5475 = scf.if %5474 -> (i64) {
        scf.yield %5318 : i64
      } else {
        scf.yield %5470 : i64
      }
      %5476 = func.call @cc_errorp(%5425) : (i64) -> i64
      %5477 = arith.cmpi ne, %5476, %5465 : i64
      %5478 = arith.cmpi eq, %5475, %5465 : i64
      %5479 = arith.andi %5477, %5478 : i1
      %5480 = scf.if %5479 -> (i64) {
        scf.yield %5425 : i64
      } else {
        scf.yield %5475 : i64
      }
      %5481 = func.call @cc_errorp(%5432) : (i64) -> i64
      %5482 = arith.cmpi ne, %5481, %5465 : i64
      %5483 = arith.cmpi eq, %5480, %5465 : i64
      %5484 = arith.andi %5482, %5483 : i1
      %5485 = scf.if %5484 -> (i64) {
        scf.yield %5432 : i64
      } else {
        scf.yield %5480 : i64
      }
      %5486 = func.call @cc_errorp(%5439) : (i64) -> i64
      %5487 = arith.cmpi ne, %5486, %5465 : i64
      %5488 = arith.cmpi eq, %5485, %5465 : i64
      %5489 = arith.andi %5487, %5488 : i1
      %5490 = scf.if %5489 -> (i64) {
        scf.yield %5439 : i64
      } else {
        scf.yield %5485 : i64
      }
      %5491 = func.call @cc_errorp(%5443) : (i64) -> i64
      %5492 = arith.cmpi ne, %5491, %5465 : i64
      %5493 = arith.cmpi eq, %5490, %5465 : i64
      %5494 = arith.andi %5492, %5493 : i1
      %5495 = scf.if %5494 -> (i64) {
        scf.yield %5443 : i64
      } else {
        scf.yield %5490 : i64
      }
      %5496 = func.call @cc_errorp(%5450) : (i64) -> i64
      %5497 = arith.cmpi ne, %5496, %5465 : i64
      %5498 = arith.cmpi eq, %5495, %5465 : i64
      %5499 = arith.andi %5497, %5498 : i1
      %5500 = scf.if %5499 -> (i64) {
        scf.yield %5450 : i64
      } else {
        scf.yield %5495 : i64
      }
      %5501 = func.call @cc_errorp(%5464) : (i64) -> i64
      %5502 = arith.cmpi ne, %5501, %5465 : i64
      %5503 = arith.cmpi eq, %5500, %5465 : i64
      %5504 = arith.andi %5502, %5503 : i1
      %5505 = scf.if %5504 -> (i64) {
        scf.yield %5464 : i64
      } else {
        scf.yield %5500 : i64
      }
      %5506 = arith.cmpi ne, %5505, %5465 : i64
      scf.if %5506 {
        func.call @stack_push_pointer(%5505) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5211) : (i64) -> ()
        func.call @stack_push_pointer(%5318) : (i64) -> ()
        func.call @stack_push_pointer(%5425) : (i64) -> ()
        func.call @stack_push_pointer(%5432) : (i64) -> ()
        func.call @stack_push_pointer(%5439) : (i64) -> ()
        func.call @stack_push_pointer(%5443) : (i64) -> ()
        func.call @stack_push_pointer(%5450) : (i64) -> ()
        func.call @stack_push_pointer(%5464) : (i64) -> ()
        %5507 = llvm.mlir.addressof @str480 : !llvm.ptr
        %5508 = func.call @cc_make_function_ref_const(%5507) : (!llvm.ptr) -> i64
        %5509 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5508, %5509) : (i64, i64) -> ()
      }
      %5510 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5510 : i64
    }
    %5511 = func.call @cc_nil_value() : () -> i64
    %5512 = func.call @cc_errorp(%5202) : (i64) -> i64
    %5513 = arith.cmpi ne, %5512, %5511 : i64
    %5514 = scf.if %5513 -> (i64) {
      scf.yield %5202 : i64
    } else {
      %5515 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5516 = arith.constant 27 : i64
      %5517 = func.call @cc_make_string(%5515, %5516) : (!llvm.ptr, i64) -> i64
      %5518 = func.call @cc_nil_value() : () -> i64
      %5519 = func.call @cc_intern(%5517, %5518) : (i64, i64) -> i64
      %5520 = func.call @cc_nil_value() : () -> i64
      %5521 = func.call @cc_cons(%5519, %5520) : (i64, i64) -> i64
      %5522 = func.call @cc_values_pack(%5521) : (i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %5523 = arith.addi %5519, %__rlasp_stack_elide_zero_284 : i64
      %5524 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5525 = arith.constant 26 : i64
      %5526 = func.call @cc_make_string(%5524, %5525) : (!llvm.ptr, i64) -> i64
      %5527 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5528 = arith.constant 4 : i64
      %5529 = func.call @cc_make_string(%5527, %5528) : (!llvm.ptr, i64) -> i64
      %5530 = func.call @cc_intern(%5526, %5529) : (i64, i64) -> i64
      %5531 = func.call @cc_nil_value() : () -> i64
      %5532 = func.call @cc_cons(%5530, %5531) : (i64, i64) -> i64
      %5533 = func.call @cc_values_pack(%5532) : (i64) -> i64
      func.call @stack_push_pointer(%5530) : (i64) -> ()
      %5534 = llvm.mlir.addressof @str484 : !llvm.ptr
      %5535 = arith.constant 10 : i64
      %5536 = func.call @cc_make_string(%5534, %5535) : (!llvm.ptr, i64) -> i64
      %5537 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5538 = arith.constant 11 : i64
      %5539 = func.call @cc_make_string(%5537, %5538) : (!llvm.ptr, i64) -> i64
      %5540 = func.call @cc_intern(%5536, %5539) : (i64, i64) -> i64
      %5541 = func.call @cc_nil_value() : () -> i64
      %5542 = func.call @cc_cons(%5540, %5541) : (i64, i64) -> i64
      %5543 = func.call @cc_values_pack(%5542) : (i64) -> i64
      func.call @stack_push_pointer(%5540) : (i64) -> ()
      %5544 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5544) : (i64) -> ()
      %5545 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5546 = arith.constant 12 : i64
      %5547 = func.call @cc_make_string(%5545, %5546) : (!llvm.ptr, i64) -> i64
      %5548 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5549 = arith.constant 7 : i64
      %5550 = func.call @cc_make_string(%5548, %5549) : (!llvm.ptr, i64) -> i64
      %5551 = func.call @cc_intern(%5547, %5550) : (i64, i64) -> i64
      %5552 = func.call @cc_nil_value() : () -> i64
      %5553 = func.call @cc_cons(%5551, %5552) : (i64, i64) -> i64
      %5554 = func.call @cc_values_pack(%5553) : (i64) -> i64
      func.call @stack_push_pointer(%5551) : (i64) -> ()
      %5555 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5555) : (i64) -> ()
      %5556 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5557 = arith.constant 9 : i64
      %5558 = func.call @cc_make_string(%5556, %5557) : (!llvm.ptr, i64) -> i64
      %5559 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5560 = arith.constant 11 : i64
      %5561 = func.call @cc_make_string(%5559, %5560) : (!llvm.ptr, i64) -> i64
      %5562 = func.call @cc_intern(%5558, %5561) : (i64, i64) -> i64
      %5563 = func.call @cc_nil_value() : () -> i64
      %5564 = func.call @cc_cons(%5562, %5563) : (i64, i64) -> i64
      %5565 = func.call @cc_values_pack(%5564) : (i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %5566 = arith.addi %5562, %__rlasp_stack_elide_zero_285 : i64
      %5567 = func.call @stack_pop_pointer() : () -> i64
      %5568 = func.call @cc_cons(%5566, %5567) : (i64, i64) -> i64
      %5569 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5570 = arith.constant 5 : i64
      %5571 = func.call @cc_make_string(%5569, %5570) : (!llvm.ptr, i64) -> i64
      %5572 = func.call @cc_nil_value() : () -> i64
      %5573 = func.call @cc_intern(%5571, %5572) : (i64, i64) -> i64
      %5574 = func.call @cc_nil_value() : () -> i64
      %5575 = func.call @cc_cons(%5573, %5574) : (i64, i64) -> i64
      %5576 = func.call @cc_values_pack(%5575) : (i64) -> i64
      %5577 = func.call @cc_cons(%5573, %5568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5577) : (i64) -> ()
      %5578 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5579 = arith.constant 10 : i64
      %5580 = func.call @cc_make_string(%5578, %5579) : (!llvm.ptr, i64) -> i64
      %5581 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5582 = arith.constant 7 : i64
      %5583 = func.call @cc_make_string(%5581, %5582) : (!llvm.ptr, i64) -> i64
      %5584 = func.call @cc_intern(%5580, %5583) : (i64, i64) -> i64
      %5585 = func.call @cc_nil_value() : () -> i64
      %5586 = func.call @cc_cons(%5584, %5585) : (i64, i64) -> i64
      %5587 = func.call @cc_values_pack(%5586) : (i64) -> i64
      func.call @stack_push_pointer(%5584) : (i64) -> ()
      %5588 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%5588) : (i64) -> ()
      %5589 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5590 = arith.constant 15 : i64
      %5591 = func.call @cc_make_string(%5589, %5590) : (!llvm.ptr, i64) -> i64
      %5592 = llvm.mlir.addressof @str494 : !llvm.ptr
      %5593 = arith.constant 7 : i64
      %5594 = func.call @cc_make_string(%5592, %5593) : (!llvm.ptr, i64) -> i64
      %5595 = func.call @cc_intern(%5591, %5594) : (i64, i64) -> i64
      %5596 = func.call @cc_nil_value() : () -> i64
      %5597 = func.call @cc_cons(%5595, %5596) : (i64, i64) -> i64
      %5598 = func.call @cc_values_pack(%5597) : (i64) -> i64
      func.call @stack_push_pointer(%5595) : (i64) -> ()
      %5599 = arith.constant 67 : i64
      %5600 = func.call @cc_box_character(%5599) : (i64) -> i64
      func.call @stack_push_pointer(%5600) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5601 = func.call @stack_pop_pointer() : () -> i64
      %5602 = func.call @stack_pop_pointer() : () -> i64
      %5603 = func.call @cc_cons(%5602, %5601) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %5604 = arith.addi %5603, %__rlasp_stack_elide_zero_286 : i64
      %5605 = func.call @stack_pop_pointer() : () -> i64
      %5606 = func.call @cc_cons(%5605, %5604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %5607 = arith.addi %5606, %__rlasp_stack_elide_zero_287 : i64
      %5608 = func.call @stack_pop_pointer() : () -> i64
      %5609 = func.call @cc_cons(%5608, %5607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %5610 = arith.addi %5609, %__rlasp_stack_elide_zero_288 : i64
      %5611 = func.call @stack_pop_pointer() : () -> i64
      %5612 = func.call @cc_cons(%5611, %5610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %5613 = arith.addi %5612, %__rlasp_stack_elide_zero_289 : i64
      %5614 = func.call @stack_pop_pointer() : () -> i64
      %5615 = func.call @cc_cons(%5614, %5613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %5616 = arith.addi %5615, %__rlasp_stack_elide_zero_290 : i64
      %5617 = func.call @stack_pop_pointer() : () -> i64
      %5618 = func.call @cc_cons(%5617, %5616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %5619 = arith.addi %5618, %__rlasp_stack_elide_zero_291 : i64
      %5620 = func.call @stack_pop_pointer() : () -> i64
      %5621 = func.call @cc_cons(%5620, %5619) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %5622 = arith.addi %5621, %__rlasp_stack_elide_zero_292 : i64
      %5623 = func.call @stack_pop_pointer() : () -> i64
      %5624 = func.call @cc_cons(%5623, %5622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5624) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5625 = func.call @stack_pop_pointer() : () -> i64
      %5626 = func.call @stack_pop_pointer() : () -> i64
      %5627 = func.call @cc_cons(%5626, %5625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %5628 = arith.addi %5627, %__rlasp_stack_elide_zero_293 : i64
      %5629 = func.call @stack_pop_pointer() : () -> i64
      %5630 = func.call @cc_cons(%5629, %5628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %5631 = arith.addi %5630, %__rlasp_stack_elide_zero_294 : i64
      %5735 = arith.constant 122791386939416 : i64
      %5736 = arith.constant 0 : i64
      %5737 = func.call @cc_make_closure(%5735, %5736) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %5738 = arith.addi %5737, %__rlasp_stack_elide_zero_295 : i64
      %5739 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5740 = arith.constant 3 : i64
      %5741 = func.call @cc_make_string(%5739, %5740) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5742 = func.call @stack_pop_pointer() : () -> i64
      %5743 = func.call @stack_pop_pointer() : () -> i64
      %5744 = func.call @cc_cons(%5743, %5742) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %5745 = arith.addi %5744, %__rlasp_stack_elide_zero_296 : i64
      %5746 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5747 = arith.constant 11 : i64
      %5748 = func.call @cc_make_string(%5746, %5747) : (!llvm.ptr, i64) -> i64
      %5749 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5750 = arith.constant 7 : i64
      %5751 = func.call @cc_make_string(%5749, %5750) : (!llvm.ptr, i64) -> i64
      %5752 = func.call @cc_intern(%5748, %5751) : (i64, i64) -> i64
      %5753 = func.call @cc_nil_value() : () -> i64
      %5754 = func.call @cc_cons(%5752, %5753) : (i64, i64) -> i64
      %5755 = func.call @cc_values_pack(%5754) : (i64) -> i64
      %5756 = func.call @cc_nil_value() : () -> i64
      %5757 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5758 = arith.constant 4 : i64
      %5759 = func.call @cc_make_string(%5757, %5758) : (!llvm.ptr, i64) -> i64
      %5760 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5761 = arith.constant 7 : i64
      %5762 = func.call @cc_make_string(%5760, %5761) : (!llvm.ptr, i64) -> i64
      %5763 = func.call @cc_intern(%5759, %5762) : (i64, i64) -> i64
      %5764 = func.call @cc_nil_value() : () -> i64
      %5765 = func.call @cc_cons(%5763, %5764) : (i64, i64) -> i64
      %5766 = func.call @cc_values_pack(%5765) : (i64) -> i64
      %5767 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5768 = arith.constant 7 : i64
      %5769 = func.call @cc_make_string(%5767, %5768) : (!llvm.ptr, i64) -> i64
      %5770 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5771 = arith.constant 11 : i64
      %5772 = func.call @cc_make_string(%5770, %5771) : (!llvm.ptr, i64) -> i64
      %5773 = func.call @cc_intern(%5769, %5772) : (i64, i64) -> i64
      %5774 = func.call @cc_nil_value() : () -> i64
      %5775 = func.call @cc_cons(%5773, %5774) : (i64, i64) -> i64
      %5776 = func.call @cc_values_pack(%5775) : (i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %5777 = arith.addi %5773, %__rlasp_stack_elide_zero_297 : i64
      %5778 = func.call @cc_nil_value() : () -> i64
      %5779 = func.call @cc_errorp(%5523) : (i64) -> i64
      %5780 = arith.cmpi ne, %5779, %5778 : i64
      %5781 = arith.cmpi eq, %5778, %5778 : i64
      %5782 = arith.andi %5780, %5781 : i1
      %5783 = scf.if %5782 -> (i64) {
        scf.yield %5523 : i64
      } else {
        scf.yield %5778 : i64
      }
      %5784 = func.call @cc_errorp(%5631) : (i64) -> i64
      %5785 = arith.cmpi ne, %5784, %5778 : i64
      %5786 = arith.cmpi eq, %5783, %5778 : i64
      %5787 = arith.andi %5785, %5786 : i1
      %5788 = scf.if %5787 -> (i64) {
        scf.yield %5631 : i64
      } else {
        scf.yield %5783 : i64
      }
      %5789 = func.call @cc_errorp(%5738) : (i64) -> i64
      %5790 = arith.cmpi ne, %5789, %5778 : i64
      %5791 = arith.cmpi eq, %5788, %5778 : i64
      %5792 = arith.andi %5790, %5791 : i1
      %5793 = scf.if %5792 -> (i64) {
        scf.yield %5738 : i64
      } else {
        scf.yield %5788 : i64
      }
      %5794 = func.call @cc_errorp(%5745) : (i64) -> i64
      %5795 = arith.cmpi ne, %5794, %5778 : i64
      %5796 = arith.cmpi eq, %5793, %5778 : i64
      %5797 = arith.andi %5795, %5796 : i1
      %5798 = scf.if %5797 -> (i64) {
        scf.yield %5745 : i64
      } else {
        scf.yield %5793 : i64
      }
      %5799 = func.call @cc_errorp(%5752) : (i64) -> i64
      %5800 = arith.cmpi ne, %5799, %5778 : i64
      %5801 = arith.cmpi eq, %5798, %5778 : i64
      %5802 = arith.andi %5800, %5801 : i1
      %5803 = scf.if %5802 -> (i64) {
        scf.yield %5752 : i64
      } else {
        scf.yield %5798 : i64
      }
      %5804 = func.call @cc_errorp(%5756) : (i64) -> i64
      %5805 = arith.cmpi ne, %5804, %5778 : i64
      %5806 = arith.cmpi eq, %5803, %5778 : i64
      %5807 = arith.andi %5805, %5806 : i1
      %5808 = scf.if %5807 -> (i64) {
        scf.yield %5756 : i64
      } else {
        scf.yield %5803 : i64
      }
      %5809 = func.call @cc_errorp(%5763) : (i64) -> i64
      %5810 = arith.cmpi ne, %5809, %5778 : i64
      %5811 = arith.cmpi eq, %5808, %5778 : i64
      %5812 = arith.andi %5810, %5811 : i1
      %5813 = scf.if %5812 -> (i64) {
        scf.yield %5763 : i64
      } else {
        scf.yield %5808 : i64
      }
      %5814 = func.call @cc_errorp(%5777) : (i64) -> i64
      %5815 = arith.cmpi ne, %5814, %5778 : i64
      %5816 = arith.cmpi eq, %5813, %5778 : i64
      %5817 = arith.andi %5815, %5816 : i1
      %5818 = scf.if %5817 -> (i64) {
        scf.yield %5777 : i64
      } else {
        scf.yield %5813 : i64
      }
      %5819 = arith.cmpi ne, %5818, %5778 : i64
      scf.if %5819 {
        func.call @stack_push_pointer(%5818) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5523) : (i64) -> ()
        func.call @stack_push_pointer(%5631) : (i64) -> ()
        func.call @stack_push_pointer(%5738) : (i64) -> ()
        func.call @stack_push_pointer(%5745) : (i64) -> ()
        func.call @stack_push_pointer(%5752) : (i64) -> ()
        func.call @stack_push_pointer(%5756) : (i64) -> ()
        func.call @stack_push_pointer(%5763) : (i64) -> ()
        func.call @stack_push_pointer(%5777) : (i64) -> ()
        %5820 = llvm.mlir.addressof @str512 : !llvm.ptr
        %5821 = func.call @cc_make_function_ref_const(%5820) : (!llvm.ptr) -> i64
        %5822 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5821, %5822) : (i64, i64) -> ()
      }
      %5823 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5823 : i64
    }
    %5824 = func.call @cc_nil_value() : () -> i64
    %5825 = func.call @cc_errorp(%5514) : (i64) -> i64
    %5826 = arith.cmpi ne, %5825, %5824 : i64
    %5827 = scf.if %5826 -> (i64) {
      scf.yield %5514 : i64
    } else {
      %5828 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5829 = arith.constant 27 : i64
      %5830 = func.call @cc_make_string(%5828, %5829) : (!llvm.ptr, i64) -> i64
      %5831 = func.call @cc_nil_value() : () -> i64
      %5832 = func.call @cc_intern(%5830, %5831) : (i64, i64) -> i64
      %5833 = func.call @cc_nil_value() : () -> i64
      %5834 = func.call @cc_cons(%5832, %5833) : (i64, i64) -> i64
      %5835 = func.call @cc_values_pack(%5834) : (i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %5836 = arith.addi %5832, %__rlasp_stack_elide_zero_298 : i64
      %5837 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5838 = arith.constant 26 : i64
      %5839 = func.call @cc_make_string(%5837, %5838) : (!llvm.ptr, i64) -> i64
      %5840 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5841 = arith.constant 4 : i64
      %5842 = func.call @cc_make_string(%5840, %5841) : (!llvm.ptr, i64) -> i64
      %5843 = func.call @cc_intern(%5839, %5842) : (i64, i64) -> i64
      %5844 = func.call @cc_nil_value() : () -> i64
      %5845 = func.call @cc_cons(%5843, %5844) : (i64, i64) -> i64
      %5846 = func.call @cc_values_pack(%5845) : (i64) -> i64
      func.call @stack_push_pointer(%5843) : (i64) -> ()
      %5847 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5848 = arith.constant 10 : i64
      %5849 = func.call @cc_make_string(%5847, %5848) : (!llvm.ptr, i64) -> i64
      %5850 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5851 = arith.constant 11 : i64
      %5852 = func.call @cc_make_string(%5850, %5851) : (!llvm.ptr, i64) -> i64
      %5853 = func.call @cc_intern(%5849, %5852) : (i64, i64) -> i64
      %5854 = func.call @cc_nil_value() : () -> i64
      %5855 = func.call @cc_cons(%5853, %5854) : (i64, i64) -> i64
      %5856 = func.call @cc_values_pack(%5855) : (i64) -> i64
      func.call @stack_push_pointer(%5853) : (i64) -> ()
      %5857 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5857) : (i64) -> ()
      %5858 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5859 = arith.constant 12 : i64
      %5860 = func.call @cc_make_string(%5858, %5859) : (!llvm.ptr, i64) -> i64
      %5861 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5862 = arith.constant 7 : i64
      %5863 = func.call @cc_make_string(%5861, %5862) : (!llvm.ptr, i64) -> i64
      %5864 = func.call @cc_intern(%5860, %5863) : (i64, i64) -> i64
      %5865 = func.call @cc_nil_value() : () -> i64
      %5866 = func.call @cc_cons(%5864, %5865) : (i64, i64) -> i64
      %5867 = func.call @cc_values_pack(%5866) : (i64) -> i64
      func.call @stack_push_pointer(%5864) : (i64) -> ()
      %5868 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5868) : (i64) -> ()
      %5869 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5870 = arith.constant 9 : i64
      %5871 = func.call @cc_make_string(%5869, %5870) : (!llvm.ptr, i64) -> i64
      %5872 = llvm.mlir.addressof @str521 : !llvm.ptr
      %5873 = arith.constant 11 : i64
      %5874 = func.call @cc_make_string(%5872, %5873) : (!llvm.ptr, i64) -> i64
      %5875 = func.call @cc_intern(%5871, %5874) : (i64, i64) -> i64
      %5876 = func.call @cc_nil_value() : () -> i64
      %5877 = func.call @cc_cons(%5875, %5876) : (i64, i64) -> i64
      %5878 = func.call @cc_values_pack(%5877) : (i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %5879 = arith.addi %5875, %__rlasp_stack_elide_zero_299 : i64
      %5880 = func.call @stack_pop_pointer() : () -> i64
      %5881 = func.call @cc_cons(%5879, %5880) : (i64, i64) -> i64
      %5882 = llvm.mlir.addressof @str522 : !llvm.ptr
      %5883 = arith.constant 5 : i64
      %5884 = func.call @cc_make_string(%5882, %5883) : (!llvm.ptr, i64) -> i64
      %5885 = func.call @cc_nil_value() : () -> i64
      %5886 = func.call @cc_intern(%5884, %5885) : (i64, i64) -> i64
      %5887 = func.call @cc_nil_value() : () -> i64
      %5888 = func.call @cc_cons(%5886, %5887) : (i64, i64) -> i64
      %5889 = func.call @cc_values_pack(%5888) : (i64) -> i64
      %5890 = func.call @cc_cons(%5886, %5881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5890) : (i64) -> ()
      %5891 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5892 = arith.constant 10 : i64
      %5893 = func.call @cc_make_string(%5891, %5892) : (!llvm.ptr, i64) -> i64
      %5894 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5895 = arith.constant 7 : i64
      %5896 = func.call @cc_make_string(%5894, %5895) : (!llvm.ptr, i64) -> i64
      %5897 = func.call @cc_intern(%5893, %5896) : (i64, i64) -> i64
      %5898 = func.call @cc_nil_value() : () -> i64
      %5899 = func.call @cc_cons(%5897, %5898) : (i64, i64) -> i64
      %5900 = func.call @cc_values_pack(%5899) : (i64) -> i64
      func.call @stack_push_pointer(%5897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5901 = llvm.mlir.addressof @str525 : !llvm.ptr
      %5902 = arith.constant 15 : i64
      %5903 = func.call @cc_make_string(%5901, %5902) : (!llvm.ptr, i64) -> i64
      %5904 = llvm.mlir.addressof @str526 : !llvm.ptr
      %5905 = arith.constant 7 : i64
      %5906 = func.call @cc_make_string(%5904, %5905) : (!llvm.ptr, i64) -> i64
      %5907 = func.call @cc_intern(%5903, %5906) : (i64, i64) -> i64
      %5908 = func.call @cc_nil_value() : () -> i64
      %5909 = func.call @cc_cons(%5907, %5908) : (i64, i64) -> i64
      %5910 = func.call @cc_values_pack(%5909) : (i64) -> i64
      func.call @stack_push_pointer(%5907) : (i64) -> ()
      %5911 = arith.constant 67 : i64
      %5912 = func.call @cc_box_character(%5911) : (i64) -> i64
      func.call @stack_push_pointer(%5912) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5913 = func.call @stack_pop_pointer() : () -> i64
      %5914 = func.call @stack_pop_pointer() : () -> i64
      %5915 = func.call @cc_cons(%5914, %5913) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %5916 = arith.addi %5915, %__rlasp_stack_elide_zero_300 : i64
      %5917 = func.call @stack_pop_pointer() : () -> i64
      %5918 = func.call @cc_cons(%5917, %5916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %5919 = arith.addi %5918, %__rlasp_stack_elide_zero_301 : i64
      %5920 = func.call @stack_pop_pointer() : () -> i64
      %5921 = func.call @cc_cons(%5920, %5919) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %5922 = arith.addi %5921, %__rlasp_stack_elide_zero_302 : i64
      %5923 = func.call @stack_pop_pointer() : () -> i64
      %5924 = func.call @cc_cons(%5923, %5922) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %5925 = arith.addi %5924, %__rlasp_stack_elide_zero_303 : i64
      %5926 = func.call @stack_pop_pointer() : () -> i64
      %5927 = func.call @cc_cons(%5926, %5925) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %5928 = arith.addi %5927, %__rlasp_stack_elide_zero_304 : i64
      %5929 = func.call @stack_pop_pointer() : () -> i64
      %5930 = func.call @cc_cons(%5929, %5928) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %5931 = arith.addi %5930, %__rlasp_stack_elide_zero_305 : i64
      %5932 = func.call @stack_pop_pointer() : () -> i64
      %5933 = func.call @cc_cons(%5932, %5931) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %5934 = arith.addi %5933, %__rlasp_stack_elide_zero_306 : i64
      %5935 = func.call @stack_pop_pointer() : () -> i64
      %5936 = func.call @cc_cons(%5935, %5934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5937 = func.call @stack_pop_pointer() : () -> i64
      %5938 = func.call @stack_pop_pointer() : () -> i64
      %5939 = func.call @cc_cons(%5938, %5937) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %5940 = arith.addi %5939, %__rlasp_stack_elide_zero_307 : i64
      %5941 = func.call @stack_pop_pointer() : () -> i64
      %5942 = func.call @cc_cons(%5941, %5940) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %5943 = arith.addi %5942, %__rlasp_stack_elide_zero_308 : i64
      %6047 = arith.constant 122791386939417 : i64
      %6048 = arith.constant 0 : i64
      %6049 = func.call @cc_make_closure(%6047, %6048) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %6050 = arith.addi %6049, %__rlasp_stack_elide_zero_309 : i64
      %6051 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6052 = arith.constant 3 : i64
      %6053 = func.call @cc_make_string(%6051, %6052) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6053) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6054 = func.call @stack_pop_pointer() : () -> i64
      %6055 = func.call @stack_pop_pointer() : () -> i64
      %6056 = func.call @cc_cons(%6055, %6054) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %6057 = arith.addi %6056, %__rlasp_stack_elide_zero_310 : i64
      %6058 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6059 = arith.constant 11 : i64
      %6060 = func.call @cc_make_string(%6058, %6059) : (!llvm.ptr, i64) -> i64
      %6061 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6062 = arith.constant 7 : i64
      %6063 = func.call @cc_make_string(%6061, %6062) : (!llvm.ptr, i64) -> i64
      %6064 = func.call @cc_intern(%6060, %6063) : (i64, i64) -> i64
      %6065 = func.call @cc_nil_value() : () -> i64
      %6066 = func.call @cc_cons(%6064, %6065) : (i64, i64) -> i64
      %6067 = func.call @cc_values_pack(%6066) : (i64) -> i64
      %6068 = func.call @cc_nil_value() : () -> i64
      %6069 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6070 = arith.constant 4 : i64
      %6071 = func.call @cc_make_string(%6069, %6070) : (!llvm.ptr, i64) -> i64
      %6072 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6073 = arith.constant 7 : i64
      %6074 = func.call @cc_make_string(%6072, %6073) : (!llvm.ptr, i64) -> i64
      %6075 = func.call @cc_intern(%6071, %6074) : (i64, i64) -> i64
      %6076 = func.call @cc_nil_value() : () -> i64
      %6077 = func.call @cc_cons(%6075, %6076) : (i64, i64) -> i64
      %6078 = func.call @cc_values_pack(%6077) : (i64) -> i64
      %6079 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6080 = arith.constant 7 : i64
      %6081 = func.call @cc_make_string(%6079, %6080) : (!llvm.ptr, i64) -> i64
      %6082 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6083 = arith.constant 11 : i64
      %6084 = func.call @cc_make_string(%6082, %6083) : (!llvm.ptr, i64) -> i64
      %6085 = func.call @cc_intern(%6081, %6084) : (i64, i64) -> i64
      %6086 = func.call @cc_nil_value() : () -> i64
      %6087 = func.call @cc_cons(%6085, %6086) : (i64, i64) -> i64
      %6088 = func.call @cc_values_pack(%6087) : (i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %6089 = arith.addi %6085, %__rlasp_stack_elide_zero_311 : i64
      %6090 = func.call @cc_nil_value() : () -> i64
      %6091 = func.call @cc_errorp(%5836) : (i64) -> i64
      %6092 = arith.cmpi ne, %6091, %6090 : i64
      %6093 = arith.cmpi eq, %6090, %6090 : i64
      %6094 = arith.andi %6092, %6093 : i1
      %6095 = scf.if %6094 -> (i64) {
        scf.yield %5836 : i64
      } else {
        scf.yield %6090 : i64
      }
      %6096 = func.call @cc_errorp(%5943) : (i64) -> i64
      %6097 = arith.cmpi ne, %6096, %6090 : i64
      %6098 = arith.cmpi eq, %6095, %6090 : i64
      %6099 = arith.andi %6097, %6098 : i1
      %6100 = scf.if %6099 -> (i64) {
        scf.yield %5943 : i64
      } else {
        scf.yield %6095 : i64
      }
      %6101 = func.call @cc_errorp(%6050) : (i64) -> i64
      %6102 = arith.cmpi ne, %6101, %6090 : i64
      %6103 = arith.cmpi eq, %6100, %6090 : i64
      %6104 = arith.andi %6102, %6103 : i1
      %6105 = scf.if %6104 -> (i64) {
        scf.yield %6050 : i64
      } else {
        scf.yield %6100 : i64
      }
      %6106 = func.call @cc_errorp(%6057) : (i64) -> i64
      %6107 = arith.cmpi ne, %6106, %6090 : i64
      %6108 = arith.cmpi eq, %6105, %6090 : i64
      %6109 = arith.andi %6107, %6108 : i1
      %6110 = scf.if %6109 -> (i64) {
        scf.yield %6057 : i64
      } else {
        scf.yield %6105 : i64
      }
      %6111 = func.call @cc_errorp(%6064) : (i64) -> i64
      %6112 = arith.cmpi ne, %6111, %6090 : i64
      %6113 = arith.cmpi eq, %6110, %6090 : i64
      %6114 = arith.andi %6112, %6113 : i1
      %6115 = scf.if %6114 -> (i64) {
        scf.yield %6064 : i64
      } else {
        scf.yield %6110 : i64
      }
      %6116 = func.call @cc_errorp(%6068) : (i64) -> i64
      %6117 = arith.cmpi ne, %6116, %6090 : i64
      %6118 = arith.cmpi eq, %6115, %6090 : i64
      %6119 = arith.andi %6117, %6118 : i1
      %6120 = scf.if %6119 -> (i64) {
        scf.yield %6068 : i64
      } else {
        scf.yield %6115 : i64
      }
      %6121 = func.call @cc_errorp(%6075) : (i64) -> i64
      %6122 = arith.cmpi ne, %6121, %6090 : i64
      %6123 = arith.cmpi eq, %6120, %6090 : i64
      %6124 = arith.andi %6122, %6123 : i1
      %6125 = scf.if %6124 -> (i64) {
        scf.yield %6075 : i64
      } else {
        scf.yield %6120 : i64
      }
      %6126 = func.call @cc_errorp(%6089) : (i64) -> i64
      %6127 = arith.cmpi ne, %6126, %6090 : i64
      %6128 = arith.cmpi eq, %6125, %6090 : i64
      %6129 = arith.andi %6127, %6128 : i1
      %6130 = scf.if %6129 -> (i64) {
        scf.yield %6089 : i64
      } else {
        scf.yield %6125 : i64
      }
      %6131 = arith.cmpi ne, %6130, %6090 : i64
      scf.if %6131 {
        func.call @stack_push_pointer(%6130) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5836) : (i64) -> ()
        func.call @stack_push_pointer(%5943) : (i64) -> ()
        func.call @stack_push_pointer(%6050) : (i64) -> ()
        func.call @stack_push_pointer(%6057) : (i64) -> ()
        func.call @stack_push_pointer(%6064) : (i64) -> ()
        func.call @stack_push_pointer(%6068) : (i64) -> ()
        func.call @stack_push_pointer(%6075) : (i64) -> ()
        func.call @stack_push_pointer(%6089) : (i64) -> ()
        %6132 = llvm.mlir.addressof @str544 : !llvm.ptr
        %6133 = func.call @cc_make_function_ref_const(%6132) : (!llvm.ptr) -> i64
        %6134 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6133, %6134) : (i64, i64) -> ()
      }
      %6135 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6135 : i64
    }
    %6136 = func.call @cc_nil_value() : () -> i64
    %6137 = func.call @cc_errorp(%5827) : (i64) -> i64
    %6138 = arith.cmpi ne, %6137, %6136 : i64
    %6139 = scf.if %6138 -> (i64) {
      scf.yield %5827 : i64
    } else {
      %6140 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6141 = arith.constant 27 : i64
      %6142 = func.call @cc_make_string(%6140, %6141) : (!llvm.ptr, i64) -> i64
      %6143 = func.call @cc_nil_value() : () -> i64
      %6144 = func.call @cc_intern(%6142, %6143) : (i64, i64) -> i64
      %6145 = func.call @cc_nil_value() : () -> i64
      %6146 = func.call @cc_cons(%6144, %6145) : (i64, i64) -> i64
      %6147 = func.call @cc_values_pack(%6146) : (i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %6148 = arith.addi %6144, %__rlasp_stack_elide_zero_312 : i64
      %6149 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6150 = arith.constant 26 : i64
      %6151 = func.call @cc_make_string(%6149, %6150) : (!llvm.ptr, i64) -> i64
      %6152 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6153 = arith.constant 4 : i64
      %6154 = func.call @cc_make_string(%6152, %6153) : (!llvm.ptr, i64) -> i64
      %6155 = func.call @cc_intern(%6151, %6154) : (i64, i64) -> i64
      %6156 = func.call @cc_nil_value() : () -> i64
      %6157 = func.call @cc_cons(%6155, %6156) : (i64, i64) -> i64
      %6158 = func.call @cc_values_pack(%6157) : (i64) -> i64
      func.call @stack_push_pointer(%6155) : (i64) -> ()
      %6159 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6160 = arith.constant 10 : i64
      %6161 = func.call @cc_make_string(%6159, %6160) : (!llvm.ptr, i64) -> i64
      %6162 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6163 = arith.constant 11 : i64
      %6164 = func.call @cc_make_string(%6162, %6163) : (!llvm.ptr, i64) -> i64
      %6165 = func.call @cc_intern(%6161, %6164) : (i64, i64) -> i64
      %6166 = func.call @cc_nil_value() : () -> i64
      %6167 = func.call @cc_cons(%6165, %6166) : (i64, i64) -> i64
      %6168 = func.call @cc_values_pack(%6167) : (i64) -> i64
      func.call @stack_push_pointer(%6165) : (i64) -> ()
      %6169 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6169) : (i64) -> ()
      %6170 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6171 = arith.constant 12 : i64
      %6172 = func.call @cc_make_string(%6170, %6171) : (!llvm.ptr, i64) -> i64
      %6173 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6174 = arith.constant 7 : i64
      %6175 = func.call @cc_make_string(%6173, %6174) : (!llvm.ptr, i64) -> i64
      %6176 = func.call @cc_intern(%6172, %6175) : (i64, i64) -> i64
      %6177 = func.call @cc_nil_value() : () -> i64
      %6178 = func.call @cc_cons(%6176, %6177) : (i64, i64) -> i64
      %6179 = func.call @cc_values_pack(%6178) : (i64) -> i64
      func.call @stack_push_pointer(%6176) : (i64) -> ()
      %6180 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6180) : (i64) -> ()
      %6181 = llvm.mlir.addressof @str552 : !llvm.ptr
      %6182 = arith.constant 9 : i64
      %6183 = func.call @cc_make_string(%6181, %6182) : (!llvm.ptr, i64) -> i64
      %6184 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6185 = arith.constant 11 : i64
      %6186 = func.call @cc_make_string(%6184, %6185) : (!llvm.ptr, i64) -> i64
      %6187 = func.call @cc_intern(%6183, %6186) : (i64, i64) -> i64
      %6188 = func.call @cc_nil_value() : () -> i64
      %6189 = func.call @cc_cons(%6187, %6188) : (i64, i64) -> i64
      %6190 = func.call @cc_values_pack(%6189) : (i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %6191 = arith.addi %6187, %__rlasp_stack_elide_zero_313 : i64
      %6192 = func.call @stack_pop_pointer() : () -> i64
      %6193 = func.call @cc_cons(%6191, %6192) : (i64, i64) -> i64
      %6194 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6195 = arith.constant 5 : i64
      %6196 = func.call @cc_make_string(%6194, %6195) : (!llvm.ptr, i64) -> i64
      %6197 = func.call @cc_nil_value() : () -> i64
      %6198 = func.call @cc_intern(%6196, %6197) : (i64, i64) -> i64
      %6199 = func.call @cc_nil_value() : () -> i64
      %6200 = func.call @cc_cons(%6198, %6199) : (i64, i64) -> i64
      %6201 = func.call @cc_values_pack(%6200) : (i64) -> i64
      %6202 = func.call @cc_cons(%6198, %6193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6202) : (i64) -> ()
      %6203 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6204 = arith.constant 10 : i64
      %6205 = func.call @cc_make_string(%6203, %6204) : (!llvm.ptr, i64) -> i64
      %6206 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6207 = arith.constant 7 : i64
      %6208 = func.call @cc_make_string(%6206, %6207) : (!llvm.ptr, i64) -> i64
      %6209 = func.call @cc_intern(%6205, %6208) : (i64, i64) -> i64
      %6210 = func.call @cc_nil_value() : () -> i64
      %6211 = func.call @cc_cons(%6209, %6210) : (i64, i64) -> i64
      %6212 = func.call @cc_values_pack(%6211) : (i64) -> i64
      func.call @stack_push_pointer(%6209) : (i64) -> ()
      %6213 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%6213) : (i64) -> ()
      %6214 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6215 = arith.constant 15 : i64
      %6216 = func.call @cc_make_string(%6214, %6215) : (!llvm.ptr, i64) -> i64
      %6217 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6218 = arith.constant 7 : i64
      %6219 = func.call @cc_make_string(%6217, %6218) : (!llvm.ptr, i64) -> i64
      %6220 = func.call @cc_intern(%6216, %6219) : (i64, i64) -> i64
      %6221 = func.call @cc_nil_value() : () -> i64
      %6222 = func.call @cc_cons(%6220, %6221) : (i64, i64) -> i64
      %6223 = func.call @cc_values_pack(%6222) : (i64) -> i64
      func.call @stack_push_pointer(%6220) : (i64) -> ()
      %6224 = arith.constant 67 : i64
      %6225 = func.call @cc_box_character(%6224) : (i64) -> i64
      func.call @stack_push_pointer(%6225) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6226 = func.call @stack_pop_pointer() : () -> i64
      %6227 = func.call @stack_pop_pointer() : () -> i64
      %6228 = func.call @cc_cons(%6227, %6226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %6229 = arith.addi %6228, %__rlasp_stack_elide_zero_314 : i64
      %6230 = func.call @stack_pop_pointer() : () -> i64
      %6231 = func.call @cc_cons(%6230, %6229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %6232 = arith.addi %6231, %__rlasp_stack_elide_zero_315 : i64
      %6233 = func.call @stack_pop_pointer() : () -> i64
      %6234 = func.call @cc_cons(%6233, %6232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %6235 = arith.addi %6234, %__rlasp_stack_elide_zero_316 : i64
      %6236 = func.call @stack_pop_pointer() : () -> i64
      %6237 = func.call @cc_cons(%6236, %6235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %6238 = arith.addi %6237, %__rlasp_stack_elide_zero_317 : i64
      %6239 = func.call @stack_pop_pointer() : () -> i64
      %6240 = func.call @cc_cons(%6239, %6238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %6241 = arith.addi %6240, %__rlasp_stack_elide_zero_318 : i64
      %6242 = func.call @stack_pop_pointer() : () -> i64
      %6243 = func.call @cc_cons(%6242, %6241) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %6244 = arith.addi %6243, %__rlasp_stack_elide_zero_319 : i64
      %6245 = func.call @stack_pop_pointer() : () -> i64
      %6246 = func.call @cc_cons(%6245, %6244) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %6247 = arith.addi %6246, %__rlasp_stack_elide_zero_320 : i64
      %6248 = func.call @stack_pop_pointer() : () -> i64
      %6249 = func.call @cc_cons(%6248, %6247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6249) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6250 = func.call @stack_pop_pointer() : () -> i64
      %6251 = func.call @stack_pop_pointer() : () -> i64
      %6252 = func.call @cc_cons(%6251, %6250) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %6253 = arith.addi %6252, %__rlasp_stack_elide_zero_321 : i64
      %6254 = func.call @stack_pop_pointer() : () -> i64
      %6255 = func.call @cc_cons(%6254, %6253) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %6256 = arith.addi %6255, %__rlasp_stack_elide_zero_322 : i64
      %6360 = arith.constant 122791386939418 : i64
      %6361 = arith.constant 0 : i64
      %6362 = func.call @cc_make_closure(%6360, %6361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %6363 = arith.addi %6362, %__rlasp_stack_elide_zero_323 : i64
      %6364 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6365 = arith.constant 3 : i64
      %6366 = func.call @cc_make_string(%6364, %6365) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6366) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6367 = func.call @stack_pop_pointer() : () -> i64
      %6368 = func.call @stack_pop_pointer() : () -> i64
      %6369 = func.call @cc_cons(%6368, %6367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %6370 = arith.addi %6369, %__rlasp_stack_elide_zero_324 : i64
      %6371 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6372 = arith.constant 11 : i64
      %6373 = func.call @cc_make_string(%6371, %6372) : (!llvm.ptr, i64) -> i64
      %6374 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6375 = arith.constant 7 : i64
      %6376 = func.call @cc_make_string(%6374, %6375) : (!llvm.ptr, i64) -> i64
      %6377 = func.call @cc_intern(%6373, %6376) : (i64, i64) -> i64
      %6378 = func.call @cc_nil_value() : () -> i64
      %6379 = func.call @cc_cons(%6377, %6378) : (i64, i64) -> i64
      %6380 = func.call @cc_values_pack(%6379) : (i64) -> i64
      %6381 = func.call @cc_nil_value() : () -> i64
      %6382 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6383 = arith.constant 4 : i64
      %6384 = func.call @cc_make_string(%6382, %6383) : (!llvm.ptr, i64) -> i64
      %6385 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6386 = arith.constant 7 : i64
      %6387 = func.call @cc_make_string(%6385, %6386) : (!llvm.ptr, i64) -> i64
      %6388 = func.call @cc_intern(%6384, %6387) : (i64, i64) -> i64
      %6389 = func.call @cc_nil_value() : () -> i64
      %6390 = func.call @cc_cons(%6388, %6389) : (i64, i64) -> i64
      %6391 = func.call @cc_values_pack(%6390) : (i64) -> i64
      %6392 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6393 = arith.constant 7 : i64
      %6394 = func.call @cc_make_string(%6392, %6393) : (!llvm.ptr, i64) -> i64
      %6395 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6396 = arith.constant 11 : i64
      %6397 = func.call @cc_make_string(%6395, %6396) : (!llvm.ptr, i64) -> i64
      %6398 = func.call @cc_intern(%6394, %6397) : (i64, i64) -> i64
      %6399 = func.call @cc_nil_value() : () -> i64
      %6400 = func.call @cc_cons(%6398, %6399) : (i64, i64) -> i64
      %6401 = func.call @cc_values_pack(%6400) : (i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %6402 = arith.addi %6398, %__rlasp_stack_elide_zero_325 : i64
      %6403 = func.call @cc_nil_value() : () -> i64
      %6404 = func.call @cc_errorp(%6148) : (i64) -> i64
      %6405 = arith.cmpi ne, %6404, %6403 : i64
      %6406 = arith.cmpi eq, %6403, %6403 : i64
      %6407 = arith.andi %6405, %6406 : i1
      %6408 = scf.if %6407 -> (i64) {
        scf.yield %6148 : i64
      } else {
        scf.yield %6403 : i64
      }
      %6409 = func.call @cc_errorp(%6256) : (i64) -> i64
      %6410 = arith.cmpi ne, %6409, %6403 : i64
      %6411 = arith.cmpi eq, %6408, %6403 : i64
      %6412 = arith.andi %6410, %6411 : i1
      %6413 = scf.if %6412 -> (i64) {
        scf.yield %6256 : i64
      } else {
        scf.yield %6408 : i64
      }
      %6414 = func.call @cc_errorp(%6363) : (i64) -> i64
      %6415 = arith.cmpi ne, %6414, %6403 : i64
      %6416 = arith.cmpi eq, %6413, %6403 : i64
      %6417 = arith.andi %6415, %6416 : i1
      %6418 = scf.if %6417 -> (i64) {
        scf.yield %6363 : i64
      } else {
        scf.yield %6413 : i64
      }
      %6419 = func.call @cc_errorp(%6370) : (i64) -> i64
      %6420 = arith.cmpi ne, %6419, %6403 : i64
      %6421 = arith.cmpi eq, %6418, %6403 : i64
      %6422 = arith.andi %6420, %6421 : i1
      %6423 = scf.if %6422 -> (i64) {
        scf.yield %6370 : i64
      } else {
        scf.yield %6418 : i64
      }
      %6424 = func.call @cc_errorp(%6377) : (i64) -> i64
      %6425 = arith.cmpi ne, %6424, %6403 : i64
      %6426 = arith.cmpi eq, %6423, %6403 : i64
      %6427 = arith.andi %6425, %6426 : i1
      %6428 = scf.if %6427 -> (i64) {
        scf.yield %6377 : i64
      } else {
        scf.yield %6423 : i64
      }
      %6429 = func.call @cc_errorp(%6381) : (i64) -> i64
      %6430 = arith.cmpi ne, %6429, %6403 : i64
      %6431 = arith.cmpi eq, %6428, %6403 : i64
      %6432 = arith.andi %6430, %6431 : i1
      %6433 = scf.if %6432 -> (i64) {
        scf.yield %6381 : i64
      } else {
        scf.yield %6428 : i64
      }
      %6434 = func.call @cc_errorp(%6388) : (i64) -> i64
      %6435 = arith.cmpi ne, %6434, %6403 : i64
      %6436 = arith.cmpi eq, %6433, %6403 : i64
      %6437 = arith.andi %6435, %6436 : i1
      %6438 = scf.if %6437 -> (i64) {
        scf.yield %6388 : i64
      } else {
        scf.yield %6433 : i64
      }
      %6439 = func.call @cc_errorp(%6402) : (i64) -> i64
      %6440 = arith.cmpi ne, %6439, %6403 : i64
      %6441 = arith.cmpi eq, %6438, %6403 : i64
      %6442 = arith.andi %6440, %6441 : i1
      %6443 = scf.if %6442 -> (i64) {
        scf.yield %6402 : i64
      } else {
        scf.yield %6438 : i64
      }
      %6444 = arith.cmpi ne, %6443, %6403 : i64
      scf.if %6444 {
        func.call @stack_push_pointer(%6443) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6148) : (i64) -> ()
        func.call @stack_push_pointer(%6256) : (i64) -> ()
        func.call @stack_push_pointer(%6363) : (i64) -> ()
        func.call @stack_push_pointer(%6370) : (i64) -> ()
        func.call @stack_push_pointer(%6377) : (i64) -> ()
        func.call @stack_push_pointer(%6381) : (i64) -> ()
        func.call @stack_push_pointer(%6388) : (i64) -> ()
        func.call @stack_push_pointer(%6402) : (i64) -> ()
        %6445 = llvm.mlir.addressof @str576 : !llvm.ptr
        %6446 = func.call @cc_make_function_ref_const(%6445) : (!llvm.ptr) -> i64
        %6447 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6446, %6447) : (i64, i64) -> ()
      }
      %6448 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6448 : i64
    }
    %6449 = func.call @cc_nil_value() : () -> i64
    %6450 = func.call @cc_errorp(%6139) : (i64) -> i64
    %6451 = arith.cmpi ne, %6450, %6449 : i64
    %6452 = scf.if %6451 -> (i64) {
      scf.yield %6139 : i64
    } else {
      %6453 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6454 = arith.constant 27 : i64
      %6455 = func.call @cc_make_string(%6453, %6454) : (!llvm.ptr, i64) -> i64
      %6456 = func.call @cc_nil_value() : () -> i64
      %6457 = func.call @cc_intern(%6455, %6456) : (i64, i64) -> i64
      %6458 = func.call @cc_nil_value() : () -> i64
      %6459 = func.call @cc_cons(%6457, %6458) : (i64, i64) -> i64
      %6460 = func.call @cc_values_pack(%6459) : (i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %6461 = arith.addi %6457, %__rlasp_stack_elide_zero_326 : i64
      %6462 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6463 = arith.constant 26 : i64
      %6464 = func.call @cc_make_string(%6462, %6463) : (!llvm.ptr, i64) -> i64
      %6465 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6466 = arith.constant 4 : i64
      %6467 = func.call @cc_make_string(%6465, %6466) : (!llvm.ptr, i64) -> i64
      %6468 = func.call @cc_intern(%6464, %6467) : (i64, i64) -> i64
      %6469 = func.call @cc_nil_value() : () -> i64
      %6470 = func.call @cc_cons(%6468, %6469) : (i64, i64) -> i64
      %6471 = func.call @cc_values_pack(%6470) : (i64) -> i64
      func.call @stack_push_pointer(%6468) : (i64) -> ()
      %6472 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6473 = arith.constant 3 : i64
      %6474 = func.call @cc_make_string(%6472, %6473) : (!llvm.ptr, i64) -> i64
      %6475 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6476 = arith.constant 7 : i64
      %6477 = func.call @cc_make_string(%6475, %6476) : (!llvm.ptr, i64) -> i64
      %6478 = func.call @cc_intern(%6474, %6477) : (i64, i64) -> i64
      %6479 = func.call @cc_nil_value() : () -> i64
      %6480 = func.call @cc_cons(%6478, %6479) : (i64, i64) -> i64
      %6481 = func.call @cc_values_pack(%6480) : (i64) -> i64
      func.call @stack_push_pointer(%6478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6482 = func.call @stack_pop_pointer() : () -> i64
      %6483 = func.call @stack_pop_pointer() : () -> i64
      %6484 = func.call @cc_cons(%6483, %6482) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %6485 = arith.addi %6484, %__rlasp_stack_elide_zero_327 : i64
      %6486 = func.call @stack_pop_pointer() : () -> i64
      %6487 = func.call @cc_cons(%6486, %6485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %6488 = arith.addi %6487, %__rlasp_stack_elide_zero_328 : i64
      %6515 = arith.constant 122791386939419 : i64
      %6516 = arith.constant 0 : i64
      %6517 = func.call @cc_make_closure(%6515, %6516) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %6518 = arith.addi %6517, %__rlasp_stack_elide_zero_329 : i64
      %6519 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6520 = arith.constant 3 : i64
      %6521 = func.call @cc_make_string(%6519, %6520) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6521) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6522 = func.call @stack_pop_pointer() : () -> i64
      %6523 = func.call @stack_pop_pointer() : () -> i64
      %6524 = func.call @cc_cons(%6523, %6522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %6525 = arith.addi %6524, %__rlasp_stack_elide_zero_330 : i64
      %6526 = llvm.mlir.addressof @str586 : !llvm.ptr
      %6527 = arith.constant 11 : i64
      %6528 = func.call @cc_make_string(%6526, %6527) : (!llvm.ptr, i64) -> i64
      %6529 = llvm.mlir.addressof @str587 : !llvm.ptr
      %6530 = arith.constant 7 : i64
      %6531 = func.call @cc_make_string(%6529, %6530) : (!llvm.ptr, i64) -> i64
      %6532 = func.call @cc_intern(%6528, %6531) : (i64, i64) -> i64
      %6533 = func.call @cc_nil_value() : () -> i64
      %6534 = func.call @cc_cons(%6532, %6533) : (i64, i64) -> i64
      %6535 = func.call @cc_values_pack(%6534) : (i64) -> i64
      %6536 = func.call @cc_nil_value() : () -> i64
      %6537 = llvm.mlir.addressof @str588 : !llvm.ptr
      %6538 = arith.constant 4 : i64
      %6539 = func.call @cc_make_string(%6537, %6538) : (!llvm.ptr, i64) -> i64
      %6540 = llvm.mlir.addressof @str589 : !llvm.ptr
      %6541 = arith.constant 7 : i64
      %6542 = func.call @cc_make_string(%6540, %6541) : (!llvm.ptr, i64) -> i64
      %6543 = func.call @cc_intern(%6539, %6542) : (i64, i64) -> i64
      %6544 = func.call @cc_nil_value() : () -> i64
      %6545 = func.call @cc_cons(%6543, %6544) : (i64, i64) -> i64
      %6546 = func.call @cc_values_pack(%6545) : (i64) -> i64
      %6547 = llvm.mlir.addressof @str590 : !llvm.ptr
      %6548 = arith.constant 7 : i64
      %6549 = func.call @cc_make_string(%6547, %6548) : (!llvm.ptr, i64) -> i64
      %6550 = llvm.mlir.addressof @str591 : !llvm.ptr
      %6551 = arith.constant 11 : i64
      %6552 = func.call @cc_make_string(%6550, %6551) : (!llvm.ptr, i64) -> i64
      %6553 = func.call @cc_intern(%6549, %6552) : (i64, i64) -> i64
      %6554 = func.call @cc_nil_value() : () -> i64
      %6555 = func.call @cc_cons(%6553, %6554) : (i64, i64) -> i64
      %6556 = func.call @cc_values_pack(%6555) : (i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %6557 = arith.addi %6553, %__rlasp_stack_elide_zero_331 : i64
      %6558 = func.call @cc_nil_value() : () -> i64
      %6559 = func.call @cc_errorp(%6461) : (i64) -> i64
      %6560 = arith.cmpi ne, %6559, %6558 : i64
      %6561 = arith.cmpi eq, %6558, %6558 : i64
      %6562 = arith.andi %6560, %6561 : i1
      %6563 = scf.if %6562 -> (i64) {
        scf.yield %6461 : i64
      } else {
        scf.yield %6558 : i64
      }
      %6564 = func.call @cc_errorp(%6488) : (i64) -> i64
      %6565 = arith.cmpi ne, %6564, %6558 : i64
      %6566 = arith.cmpi eq, %6563, %6558 : i64
      %6567 = arith.andi %6565, %6566 : i1
      %6568 = scf.if %6567 -> (i64) {
        scf.yield %6488 : i64
      } else {
        scf.yield %6563 : i64
      }
      %6569 = func.call @cc_errorp(%6518) : (i64) -> i64
      %6570 = arith.cmpi ne, %6569, %6558 : i64
      %6571 = arith.cmpi eq, %6568, %6558 : i64
      %6572 = arith.andi %6570, %6571 : i1
      %6573 = scf.if %6572 -> (i64) {
        scf.yield %6518 : i64
      } else {
        scf.yield %6568 : i64
      }
      %6574 = func.call @cc_errorp(%6525) : (i64) -> i64
      %6575 = arith.cmpi ne, %6574, %6558 : i64
      %6576 = arith.cmpi eq, %6573, %6558 : i64
      %6577 = arith.andi %6575, %6576 : i1
      %6578 = scf.if %6577 -> (i64) {
        scf.yield %6525 : i64
      } else {
        scf.yield %6573 : i64
      }
      %6579 = func.call @cc_errorp(%6532) : (i64) -> i64
      %6580 = arith.cmpi ne, %6579, %6558 : i64
      %6581 = arith.cmpi eq, %6578, %6558 : i64
      %6582 = arith.andi %6580, %6581 : i1
      %6583 = scf.if %6582 -> (i64) {
        scf.yield %6532 : i64
      } else {
        scf.yield %6578 : i64
      }
      %6584 = func.call @cc_errorp(%6536) : (i64) -> i64
      %6585 = arith.cmpi ne, %6584, %6558 : i64
      %6586 = arith.cmpi eq, %6583, %6558 : i64
      %6587 = arith.andi %6585, %6586 : i1
      %6588 = scf.if %6587 -> (i64) {
        scf.yield %6536 : i64
      } else {
        scf.yield %6583 : i64
      }
      %6589 = func.call @cc_errorp(%6543) : (i64) -> i64
      %6590 = arith.cmpi ne, %6589, %6558 : i64
      %6591 = arith.cmpi eq, %6588, %6558 : i64
      %6592 = arith.andi %6590, %6591 : i1
      %6593 = scf.if %6592 -> (i64) {
        scf.yield %6543 : i64
      } else {
        scf.yield %6588 : i64
      }
      %6594 = func.call @cc_errorp(%6557) : (i64) -> i64
      %6595 = arith.cmpi ne, %6594, %6558 : i64
      %6596 = arith.cmpi eq, %6593, %6558 : i64
      %6597 = arith.andi %6595, %6596 : i1
      %6598 = scf.if %6597 -> (i64) {
        scf.yield %6557 : i64
      } else {
        scf.yield %6593 : i64
      }
      %6599 = arith.cmpi ne, %6598, %6558 : i64
      scf.if %6599 {
        func.call @stack_push_pointer(%6598) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6461) : (i64) -> ()
        func.call @stack_push_pointer(%6488) : (i64) -> ()
        func.call @stack_push_pointer(%6518) : (i64) -> ()
        func.call @stack_push_pointer(%6525) : (i64) -> ()
        func.call @stack_push_pointer(%6532) : (i64) -> ()
        func.call @stack_push_pointer(%6536) : (i64) -> ()
        func.call @stack_push_pointer(%6543) : (i64) -> ()
        func.call @stack_push_pointer(%6557) : (i64) -> ()
        %6600 = llvm.mlir.addressof @str592 : !llvm.ptr
        %6601 = func.call @cc_make_function_ref_const(%6600) : (!llvm.ptr) -> i64
        %6602 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6601, %6602) : (i64, i64) -> ()
      }
      %6603 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6603 : i64
    }
    %6604 = func.call @cc_nil_value() : () -> i64
    %6605 = func.call @cc_errorp(%6452) : (i64) -> i64
    %6606 = arith.cmpi ne, %6605, %6604 : i64
    %6607 = scf.if %6606 -> (i64) {
      scf.yield %6452 : i64
    } else {
      %6608 = llvm.mlir.addressof @str593 : !llvm.ptr
      %6609 = arith.constant 27 : i64
      %6610 = func.call @cc_make_string(%6608, %6609) : (!llvm.ptr, i64) -> i64
      %6611 = func.call @cc_nil_value() : () -> i64
      %6612 = func.call @cc_intern(%6610, %6611) : (i64, i64) -> i64
      %6613 = func.call @cc_nil_value() : () -> i64
      %6614 = func.call @cc_cons(%6612, %6613) : (i64, i64) -> i64
      %6615 = func.call @cc_values_pack(%6614) : (i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %6616 = arith.addi %6612, %__rlasp_stack_elide_zero_332 : i64
      %6617 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6618 = arith.constant 26 : i64
      %6619 = func.call @cc_make_string(%6617, %6618) : (!llvm.ptr, i64) -> i64
      %6620 = llvm.mlir.addressof @str595 : !llvm.ptr
      %6621 = arith.constant 4 : i64
      %6622 = func.call @cc_make_string(%6620, %6621) : (!llvm.ptr, i64) -> i64
      %6623 = func.call @cc_intern(%6619, %6622) : (i64, i64) -> i64
      %6624 = func.call @cc_nil_value() : () -> i64
      %6625 = func.call @cc_cons(%6623, %6624) : (i64, i64) -> i64
      %6626 = func.call @cc_values_pack(%6625) : (i64) -> i64
      func.call @stack_push_pointer(%6623) : (i64) -> ()
      %6627 = arith.constant 67 : i64
      %6628 = func.call @cc_box_character(%6627) : (i64) -> i64
      func.call @stack_push_pointer(%6628) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6629 = func.call @stack_pop_pointer() : () -> i64
      %6630 = func.call @stack_pop_pointer() : () -> i64
      %6631 = func.call @cc_cons(%6630, %6629) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %6632 = arith.addi %6631, %__rlasp_stack_elide_zero_333 : i64
      %6633 = func.call @stack_pop_pointer() : () -> i64
      %6634 = func.call @cc_cons(%6633, %6632) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %6635 = arith.addi %6634, %__rlasp_stack_elide_zero_334 : i64
      %6654 = arith.constant 122791386939420 : i64
      %6655 = arith.constant 0 : i64
      %6656 = func.call @cc_make_closure(%6654, %6655) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %6657 = arith.addi %6656, %__rlasp_stack_elide_zero_335 : i64
      %6658 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6659 = arith.constant 1 : i64
      %6660 = func.call @cc_make_string(%6658, %6659) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6660) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6661 = func.call @stack_pop_pointer() : () -> i64
      %6662 = func.call @stack_pop_pointer() : () -> i64
      %6663 = func.call @cc_cons(%6662, %6661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %6664 = arith.addi %6663, %__rlasp_stack_elide_zero_336 : i64
      %6665 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6666 = arith.constant 11 : i64
      %6667 = func.call @cc_make_string(%6665, %6666) : (!llvm.ptr, i64) -> i64
      %6668 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6669 = arith.constant 7 : i64
      %6670 = func.call @cc_make_string(%6668, %6669) : (!llvm.ptr, i64) -> i64
      %6671 = func.call @cc_intern(%6667, %6670) : (i64, i64) -> i64
      %6672 = func.call @cc_nil_value() : () -> i64
      %6673 = func.call @cc_cons(%6671, %6672) : (i64, i64) -> i64
      %6674 = func.call @cc_values_pack(%6673) : (i64) -> i64
      %6675 = func.call @cc_nil_value() : () -> i64
      %6676 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6677 = arith.constant 4 : i64
      %6678 = func.call @cc_make_string(%6676, %6677) : (!llvm.ptr, i64) -> i64
      %6679 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6680 = arith.constant 7 : i64
      %6681 = func.call @cc_make_string(%6679, %6680) : (!llvm.ptr, i64) -> i64
      %6682 = func.call @cc_intern(%6678, %6681) : (i64, i64) -> i64
      %6683 = func.call @cc_nil_value() : () -> i64
      %6684 = func.call @cc_cons(%6682, %6683) : (i64, i64) -> i64
      %6685 = func.call @cc_values_pack(%6684) : (i64) -> i64
      %6686 = llvm.mlir.addressof @str602 : !llvm.ptr
      %6687 = arith.constant 7 : i64
      %6688 = func.call @cc_make_string(%6686, %6687) : (!llvm.ptr, i64) -> i64
      %6689 = llvm.mlir.addressof @str603 : !llvm.ptr
      %6690 = arith.constant 11 : i64
      %6691 = func.call @cc_make_string(%6689, %6690) : (!llvm.ptr, i64) -> i64
      %6692 = func.call @cc_intern(%6688, %6691) : (i64, i64) -> i64
      %6693 = func.call @cc_nil_value() : () -> i64
      %6694 = func.call @cc_cons(%6692, %6693) : (i64, i64) -> i64
      %6695 = func.call @cc_values_pack(%6694) : (i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %6696 = arith.addi %6692, %__rlasp_stack_elide_zero_337 : i64
      %6697 = func.call @cc_nil_value() : () -> i64
      %6698 = func.call @cc_errorp(%6616) : (i64) -> i64
      %6699 = arith.cmpi ne, %6698, %6697 : i64
      %6700 = arith.cmpi eq, %6697, %6697 : i64
      %6701 = arith.andi %6699, %6700 : i1
      %6702 = scf.if %6701 -> (i64) {
        scf.yield %6616 : i64
      } else {
        scf.yield %6697 : i64
      }
      %6703 = func.call @cc_errorp(%6635) : (i64) -> i64
      %6704 = arith.cmpi ne, %6703, %6697 : i64
      %6705 = arith.cmpi eq, %6702, %6697 : i64
      %6706 = arith.andi %6704, %6705 : i1
      %6707 = scf.if %6706 -> (i64) {
        scf.yield %6635 : i64
      } else {
        scf.yield %6702 : i64
      }
      %6708 = func.call @cc_errorp(%6657) : (i64) -> i64
      %6709 = arith.cmpi ne, %6708, %6697 : i64
      %6710 = arith.cmpi eq, %6707, %6697 : i64
      %6711 = arith.andi %6709, %6710 : i1
      %6712 = scf.if %6711 -> (i64) {
        scf.yield %6657 : i64
      } else {
        scf.yield %6707 : i64
      }
      %6713 = func.call @cc_errorp(%6664) : (i64) -> i64
      %6714 = arith.cmpi ne, %6713, %6697 : i64
      %6715 = arith.cmpi eq, %6712, %6697 : i64
      %6716 = arith.andi %6714, %6715 : i1
      %6717 = scf.if %6716 -> (i64) {
        scf.yield %6664 : i64
      } else {
        scf.yield %6712 : i64
      }
      %6718 = func.call @cc_errorp(%6671) : (i64) -> i64
      %6719 = arith.cmpi ne, %6718, %6697 : i64
      %6720 = arith.cmpi eq, %6717, %6697 : i64
      %6721 = arith.andi %6719, %6720 : i1
      %6722 = scf.if %6721 -> (i64) {
        scf.yield %6671 : i64
      } else {
        scf.yield %6717 : i64
      }
      %6723 = func.call @cc_errorp(%6675) : (i64) -> i64
      %6724 = arith.cmpi ne, %6723, %6697 : i64
      %6725 = arith.cmpi eq, %6722, %6697 : i64
      %6726 = arith.andi %6724, %6725 : i1
      %6727 = scf.if %6726 -> (i64) {
        scf.yield %6675 : i64
      } else {
        scf.yield %6722 : i64
      }
      %6728 = func.call @cc_errorp(%6682) : (i64) -> i64
      %6729 = arith.cmpi ne, %6728, %6697 : i64
      %6730 = arith.cmpi eq, %6727, %6697 : i64
      %6731 = arith.andi %6729, %6730 : i1
      %6732 = scf.if %6731 -> (i64) {
        scf.yield %6682 : i64
      } else {
        scf.yield %6727 : i64
      }
      %6733 = func.call @cc_errorp(%6696) : (i64) -> i64
      %6734 = arith.cmpi ne, %6733, %6697 : i64
      %6735 = arith.cmpi eq, %6732, %6697 : i64
      %6736 = arith.andi %6734, %6735 : i1
      %6737 = scf.if %6736 -> (i64) {
        scf.yield %6696 : i64
      } else {
        scf.yield %6732 : i64
      }
      %6738 = arith.cmpi ne, %6737, %6697 : i64
      scf.if %6738 {
        func.call @stack_push_pointer(%6737) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6616) : (i64) -> ()
        func.call @stack_push_pointer(%6635) : (i64) -> ()
        func.call @stack_push_pointer(%6657) : (i64) -> ()
        func.call @stack_push_pointer(%6664) : (i64) -> ()
        func.call @stack_push_pointer(%6671) : (i64) -> ()
        func.call @stack_push_pointer(%6675) : (i64) -> ()
        func.call @stack_push_pointer(%6682) : (i64) -> ()
        func.call @stack_push_pointer(%6696) : (i64) -> ()
        %6739 = llvm.mlir.addressof @str604 : !llvm.ptr
        %6740 = func.call @cc_make_function_ref_const(%6739) : (!llvm.ptr) -> i64
        %6741 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6740, %6741) : (i64, i64) -> ()
      }
      %6742 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6742 : i64
    }
    %6743 = func.call @cc_nil_value() : () -> i64
    %6744 = func.call @cc_errorp(%6607) : (i64) -> i64
    %6745 = arith.cmpi ne, %6744, %6743 : i64
    %6746 = scf.if %6745 -> (i64) {
      scf.yield %6607 : i64
    } else {
      %6747 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6748 = arith.constant 22 : i64
      %6749 = func.call @cc_make_string(%6747, %6748) : (!llvm.ptr, i64) -> i64
      %6750 = func.call @cc_nil_value() : () -> i64
      %6751 = func.call @cc_intern(%6749, %6750) : (i64, i64) -> i64
      %6752 = func.call @cc_nil_value() : () -> i64
      %6753 = func.call @cc_cons(%6751, %6752) : (i64, i64) -> i64
      %6754 = func.call @cc_values_pack(%6753) : (i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %6755 = arith.addi %6751, %__rlasp_stack_elide_zero_338 : i64
      %6756 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6757 = arith.constant 6 : i64
      %6758 = func.call @cc_make_string(%6756, %6757) : (!llvm.ptr, i64) -> i64
      %6759 = func.call @cc_nil_value() : () -> i64
      %6760 = func.call @cc_intern(%6758, %6759) : (i64, i64) -> i64
      %6761 = func.call @cc_nil_value() : () -> i64
      %6762 = func.call @cc_cons(%6760, %6761) : (i64, i64) -> i64
      %6763 = func.call @cc_values_pack(%6762) : (i64) -> i64
      func.call @stack_push_pointer(%6760) : (i64) -> ()
      %6764 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6765 = arith.constant 13 : i64
      %6766 = func.call @cc_make_string(%6764, %6765) : (!llvm.ptr, i64) -> i64
      %6767 = llvm.mlir.addressof @str608 : !llvm.ptr
      %6768 = arith.constant 11 : i64
      %6769 = func.call @cc_make_string(%6767, %6768) : (!llvm.ptr, i64) -> i64
      %6770 = func.call @cc_intern(%6766, %6769) : (i64, i64) -> i64
      %6771 = func.call @cc_nil_value() : () -> i64
      %6772 = func.call @cc_cons(%6770, %6771) : (i64, i64) -> i64
      %6773 = func.call @cc_values_pack(%6772) : (i64) -> i64
      func.call @stack_push_pointer(%6770) : (i64) -> ()
      %6774 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6774) : (i64) -> ()
      %6775 = llvm.mlir.addressof @str609 : !llvm.ptr
      %6776 = arith.constant 18 : i64
      %6777 = func.call @cc_make_string(%6775, %6776) : (!llvm.ptr, i64) -> i64
      %6778 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6779 = arith.constant 11 : i64
      %6780 = func.call @cc_make_string(%6778, %6779) : (!llvm.ptr, i64) -> i64
      %6781 = func.call @cc_intern(%6777, %6780) : (i64, i64) -> i64
      %6782 = func.call @cc_nil_value() : () -> i64
      %6783 = func.call @cc_cons(%6781, %6782) : (i64, i64) -> i64
      %6784 = func.call @cc_values_pack(%6783) : (i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %6785 = arith.addi %6781, %__rlasp_stack_elide_zero_339 : i64
      %6786 = func.call @stack_pop_pointer() : () -> i64
      %6787 = func.call @cc_cons(%6785, %6786) : (i64, i64) -> i64
      %6788 = llvm.mlir.addressof @str611 : !llvm.ptr
      %6789 = arith.constant 5 : i64
      %6790 = func.call @cc_make_string(%6788, %6789) : (!llvm.ptr, i64) -> i64
      %6791 = func.call @cc_nil_value() : () -> i64
      %6792 = func.call @cc_intern(%6790, %6791) : (i64, i64) -> i64
      %6793 = func.call @cc_nil_value() : () -> i64
      %6794 = func.call @cc_cons(%6792, %6793) : (i64, i64) -> i64
      %6795 = func.call @cc_values_pack(%6794) : (i64) -> i64
      %6796 = func.call @cc_cons(%6792, %6787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6796) : (i64) -> ()
      %6797 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6797) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6798 = func.call @stack_pop_pointer() : () -> i64
      %6799 = func.call @stack_pop_pointer() : () -> i64
      %6800 = func.call @cc_cons(%6799, %6798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %6801 = arith.addi %6800, %__rlasp_stack_elide_zero_340 : i64
      %6802 = func.call @stack_pop_pointer() : () -> i64
      %6803 = func.call @cc_cons(%6802, %6801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %6804 = arith.addi %6803, %__rlasp_stack_elide_zero_341 : i64
      %6805 = func.call @stack_pop_pointer() : () -> i64
      %6806 = func.call @cc_cons(%6805, %6804) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6806) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6807 = func.call @stack_pop_pointer() : () -> i64
      %6808 = func.call @stack_pop_pointer() : () -> i64
      %6809 = func.call @cc_cons(%6808, %6807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %6810 = arith.addi %6809, %__rlasp_stack_elide_zero_342 : i64
      %6811 = func.call @stack_pop_pointer() : () -> i64
      %6812 = func.call @cc_cons(%6811, %6810) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %6813 = arith.addi %6812, %__rlasp_stack_elide_zero_343 : i64
      %6853 = arith.constant 122791386939421 : i64
      %6854 = arith.constant 0 : i64
      %6855 = func.call @cc_make_closure(%6853, %6854) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %6856 = arith.addi %6855, %__rlasp_stack_elide_zero_344 : i64
      %6857 = llvm.mlir.addressof @str615 : !llvm.ptr
      %6858 = arith.constant 6 : i64
      %6859 = func.call @cc_make_string(%6857, %6858) : (!llvm.ptr, i64) -> i64
      %6860 = llvm.mlir.addressof @str616 : !llvm.ptr
      %6861 = arith.constant 11 : i64
      %6862 = func.call @cc_make_string(%6860, %6861) : (!llvm.ptr, i64) -> i64
      %6863 = func.call @cc_intern(%6859, %6862) : (i64, i64) -> i64
      %6864 = func.call @cc_nil_value() : () -> i64
      %6865 = func.call @cc_cons(%6863, %6864) : (i64, i64) -> i64
      %6866 = func.call @cc_values_pack(%6865) : (i64) -> i64
      func.call @stack_push_pointer(%6863) : (i64) -> ()
      %6867 = llvm.mlir.addressof @str617 : !llvm.ptr
      %6868 = arith.constant 9 : i64
      %6869 = func.call @cc_make_string(%6867, %6868) : (!llvm.ptr, i64) -> i64
      %6870 = llvm.mlir.addressof @str618 : !llvm.ptr
      %6871 = arith.constant 11 : i64
      %6872 = func.call @cc_make_string(%6870, %6871) : (!llvm.ptr, i64) -> i64
      %6873 = func.call @cc_intern(%6869, %6872) : (i64, i64) -> i64
      %6874 = func.call @cc_nil_value() : () -> i64
      %6875 = func.call @cc_cons(%6873, %6874) : (i64, i64) -> i64
      %6876 = func.call @cc_values_pack(%6875) : (i64) -> i64
      func.call @stack_push_pointer(%6873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6877 = func.call @stack_pop_pointer() : () -> i64
      %6878 = func.call @stack_pop_pointer() : () -> i64
      %6879 = func.call @cc_cons(%6878, %6877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %6880 = arith.addi %6879, %__rlasp_stack_elide_zero_345 : i64
      %6881 = func.call @stack_pop_pointer() : () -> i64
      %6882 = func.call @cc_cons(%6881, %6880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6883 = func.call @stack_pop_pointer() : () -> i64
      %6884 = func.call @stack_pop_pointer() : () -> i64
      %6885 = func.call @cc_cons(%6884, %6883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %6886 = arith.addi %6885, %__rlasp_stack_elide_zero_346 : i64
      %6887 = llvm.mlir.addressof @str619 : !llvm.ptr
      %6888 = arith.constant 11 : i64
      %6889 = func.call @cc_make_string(%6887, %6888) : (!llvm.ptr, i64) -> i64
      %6890 = llvm.mlir.addressof @str620 : !llvm.ptr
      %6891 = arith.constant 7 : i64
      %6892 = func.call @cc_make_string(%6890, %6891) : (!llvm.ptr, i64) -> i64
      %6893 = func.call @cc_intern(%6889, %6892) : (i64, i64) -> i64
      %6894 = func.call @cc_nil_value() : () -> i64
      %6895 = func.call @cc_cons(%6893, %6894) : (i64, i64) -> i64
      %6896 = func.call @cc_values_pack(%6895) : (i64) -> i64
      %6897 = func.call @cc_nil_value() : () -> i64
      %6898 = llvm.mlir.addressof @str621 : !llvm.ptr
      %6899 = arith.constant 4 : i64
      %6900 = func.call @cc_make_string(%6898, %6899) : (!llvm.ptr, i64) -> i64
      %6901 = llvm.mlir.addressof @str622 : !llvm.ptr
      %6902 = arith.constant 7 : i64
      %6903 = func.call @cc_make_string(%6901, %6902) : (!llvm.ptr, i64) -> i64
      %6904 = func.call @cc_intern(%6900, %6903) : (i64, i64) -> i64
      %6905 = func.call @cc_nil_value() : () -> i64
      %6906 = func.call @cc_cons(%6904, %6905) : (i64, i64) -> i64
      %6907 = func.call @cc_values_pack(%6906) : (i64) -> i64
      %6908 = llvm.mlir.addressof @str623 : !llvm.ptr
      %6909 = arith.constant 5 : i64
      %6910 = func.call @cc_make_string(%6908, %6909) : (!llvm.ptr, i64) -> i64
      %6911 = func.call @cc_nil_value() : () -> i64
      %6912 = func.call @cc_intern(%6910, %6911) : (i64, i64) -> i64
      %6913 = func.call @cc_nil_value() : () -> i64
      %6914 = func.call @cc_cons(%6912, %6913) : (i64, i64) -> i64
      %6915 = func.call @cc_values_pack(%6914) : (i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %6916 = arith.addi %6912, %__rlasp_stack_elide_zero_347 : i64
      %6917 = func.call @cc_nil_value() : () -> i64
      %6918 = func.call @cc_errorp(%6755) : (i64) -> i64
      %6919 = arith.cmpi ne, %6918, %6917 : i64
      %6920 = arith.cmpi eq, %6917, %6917 : i64
      %6921 = arith.andi %6919, %6920 : i1
      %6922 = scf.if %6921 -> (i64) {
        scf.yield %6755 : i64
      } else {
        scf.yield %6917 : i64
      }
      %6923 = func.call @cc_errorp(%6813) : (i64) -> i64
      %6924 = arith.cmpi ne, %6923, %6917 : i64
      %6925 = arith.cmpi eq, %6922, %6917 : i64
      %6926 = arith.andi %6924, %6925 : i1
      %6927 = scf.if %6926 -> (i64) {
        scf.yield %6813 : i64
      } else {
        scf.yield %6922 : i64
      }
      %6928 = func.call @cc_errorp(%6856) : (i64) -> i64
      %6929 = arith.cmpi ne, %6928, %6917 : i64
      %6930 = arith.cmpi eq, %6927, %6917 : i64
      %6931 = arith.andi %6929, %6930 : i1
      %6932 = scf.if %6931 -> (i64) {
        scf.yield %6856 : i64
      } else {
        scf.yield %6927 : i64
      }
      %6933 = func.call @cc_errorp(%6886) : (i64) -> i64
      %6934 = arith.cmpi ne, %6933, %6917 : i64
      %6935 = arith.cmpi eq, %6932, %6917 : i64
      %6936 = arith.andi %6934, %6935 : i1
      %6937 = scf.if %6936 -> (i64) {
        scf.yield %6886 : i64
      } else {
        scf.yield %6932 : i64
      }
      %6938 = func.call @cc_errorp(%6893) : (i64) -> i64
      %6939 = arith.cmpi ne, %6938, %6917 : i64
      %6940 = arith.cmpi eq, %6937, %6917 : i64
      %6941 = arith.andi %6939, %6940 : i1
      %6942 = scf.if %6941 -> (i64) {
        scf.yield %6893 : i64
      } else {
        scf.yield %6937 : i64
      }
      %6943 = func.call @cc_errorp(%6897) : (i64) -> i64
      %6944 = arith.cmpi ne, %6943, %6917 : i64
      %6945 = arith.cmpi eq, %6942, %6917 : i64
      %6946 = arith.andi %6944, %6945 : i1
      %6947 = scf.if %6946 -> (i64) {
        scf.yield %6897 : i64
      } else {
        scf.yield %6942 : i64
      }
      %6948 = func.call @cc_errorp(%6904) : (i64) -> i64
      %6949 = arith.cmpi ne, %6948, %6917 : i64
      %6950 = arith.cmpi eq, %6947, %6917 : i64
      %6951 = arith.andi %6949, %6950 : i1
      %6952 = scf.if %6951 -> (i64) {
        scf.yield %6904 : i64
      } else {
        scf.yield %6947 : i64
      }
      %6953 = func.call @cc_errorp(%6916) : (i64) -> i64
      %6954 = arith.cmpi ne, %6953, %6917 : i64
      %6955 = arith.cmpi eq, %6952, %6917 : i64
      %6956 = arith.andi %6954, %6955 : i1
      %6957 = scf.if %6956 -> (i64) {
        scf.yield %6916 : i64
      } else {
        scf.yield %6952 : i64
      }
      %6958 = arith.cmpi ne, %6957, %6917 : i64
      scf.if %6958 {
        func.call @stack_push_pointer(%6957) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6755) : (i64) -> ()
        func.call @stack_push_pointer(%6813) : (i64) -> ()
        func.call @stack_push_pointer(%6856) : (i64) -> ()
        func.call @stack_push_pointer(%6886) : (i64) -> ()
        func.call @stack_push_pointer(%6893) : (i64) -> ()
        func.call @stack_push_pointer(%6897) : (i64) -> ()
        func.call @stack_push_pointer(%6904) : (i64) -> ()
        func.call @stack_push_pointer(%6916) : (i64) -> ()
        %6959 = llvm.mlir.addressof @str624 : !llvm.ptr
        %6960 = func.call @cc_make_function_ref_const(%6959) : (!llvm.ptr) -> i64
        %6961 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6960, %6961) : (i64, i64) -> ()
      }
      %6962 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6962 : i64
    }
    %6963 = func.call @cc_nil_value() : () -> i64
    %6964 = func.call @cc_errorp(%6746) : (i64) -> i64
    %6965 = arith.cmpi ne, %6964, %6963 : i64
    %6966 = scf.if %6965 -> (i64) {
      scf.yield %6746 : i64
    } else {
      %6967 = llvm.mlir.addressof @str625 : !llvm.ptr
      %6968 = arith.constant 22 : i64
      %6969 = func.call @cc_make_string(%6967, %6968) : (!llvm.ptr, i64) -> i64
      %6970 = func.call @cc_nil_value() : () -> i64
      %6971 = func.call @cc_intern(%6969, %6970) : (i64, i64) -> i64
      %6972 = func.call @cc_nil_value() : () -> i64
      %6973 = func.call @cc_cons(%6971, %6972) : (i64, i64) -> i64
      %6974 = func.call @cc_values_pack(%6973) : (i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %6975 = arith.addi %6971, %__rlasp_stack_elide_zero_348 : i64
      %6976 = llvm.mlir.addressof @str626 : !llvm.ptr
      %6977 = arith.constant 6 : i64
      %6978 = func.call @cc_make_string(%6976, %6977) : (!llvm.ptr, i64) -> i64
      %6979 = func.call @cc_nil_value() : () -> i64
      %6980 = func.call @cc_intern(%6978, %6979) : (i64, i64) -> i64
      %6981 = func.call @cc_nil_value() : () -> i64
      %6982 = func.call @cc_cons(%6980, %6981) : (i64, i64) -> i64
      %6983 = func.call @cc_values_pack(%6982) : (i64) -> i64
      func.call @stack_push_pointer(%6980) : (i64) -> ()
      %6984 = llvm.mlir.addressof @str627 : !llvm.ptr
      %6985 = arith.constant 13 : i64
      %6986 = func.call @cc_make_string(%6984, %6985) : (!llvm.ptr, i64) -> i64
      %6987 = llvm.mlir.addressof @str628 : !llvm.ptr
      %6988 = arith.constant 11 : i64
      %6989 = func.call @cc_make_string(%6987, %6988) : (!llvm.ptr, i64) -> i64
      %6990 = func.call @cc_intern(%6986, %6989) : (i64, i64) -> i64
      %6991 = func.call @cc_nil_value() : () -> i64
      %6992 = func.call @cc_cons(%6990, %6991) : (i64, i64) -> i64
      %6993 = func.call @cc_values_pack(%6992) : (i64) -> i64
      func.call @stack_push_pointer(%6990) : (i64) -> ()
      %6994 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6994) : (i64) -> ()
      %6995 = llvm.mlir.addressof @str629 : !llvm.ptr
      %6996 = arith.constant 13 : i64
      %6997 = func.call @cc_make_string(%6995, %6996) : (!llvm.ptr, i64) -> i64
      %6998 = llvm.mlir.addressof @str630 : !llvm.ptr
      %6999 = arith.constant 11 : i64
      %7000 = func.call @cc_make_string(%6998, %6999) : (!llvm.ptr, i64) -> i64
      %7001 = func.call @cc_intern(%6997, %7000) : (i64, i64) -> i64
      %7002 = func.call @cc_nil_value() : () -> i64
      %7003 = func.call @cc_cons(%7001, %7002) : (i64, i64) -> i64
      %7004 = func.call @cc_values_pack(%7003) : (i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %7005 = arith.addi %7001, %__rlasp_stack_elide_zero_349 : i64
      %7006 = func.call @stack_pop_pointer() : () -> i64
      %7007 = func.call @cc_cons(%7005, %7006) : (i64, i64) -> i64
      %7008 = llvm.mlir.addressof @str631 : !llvm.ptr
      %7009 = arith.constant 5 : i64
      %7010 = func.call @cc_make_string(%7008, %7009) : (!llvm.ptr, i64) -> i64
      %7011 = func.call @cc_nil_value() : () -> i64
      %7012 = func.call @cc_intern(%7010, %7011) : (i64, i64) -> i64
      %7013 = func.call @cc_nil_value() : () -> i64
      %7014 = func.call @cc_cons(%7012, %7013) : (i64, i64) -> i64
      %7015 = func.call @cc_values_pack(%7014) : (i64) -> i64
      %7016 = func.call @cc_cons(%7012, %7007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7016) : (i64) -> ()
      %7017 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7017) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7018 = func.call @stack_pop_pointer() : () -> i64
      %7019 = func.call @stack_pop_pointer() : () -> i64
      %7020 = func.call @cc_cons(%7019, %7018) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %7021 = arith.addi %7020, %__rlasp_stack_elide_zero_350 : i64
      %7022 = func.call @stack_pop_pointer() : () -> i64
      %7023 = func.call @cc_cons(%7022, %7021) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %7024 = arith.addi %7023, %__rlasp_stack_elide_zero_351 : i64
      %7025 = func.call @stack_pop_pointer() : () -> i64
      %7026 = func.call @cc_cons(%7025, %7024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7026) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7027 = func.call @stack_pop_pointer() : () -> i64
      %7028 = func.call @stack_pop_pointer() : () -> i64
      %7029 = func.call @cc_cons(%7028, %7027) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %7030 = arith.addi %7029, %__rlasp_stack_elide_zero_352 : i64
      %7031 = func.call @stack_pop_pointer() : () -> i64
      %7032 = func.call @cc_cons(%7031, %7030) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %7033 = arith.addi %7032, %__rlasp_stack_elide_zero_353 : i64
      %7073 = arith.constant 122791386939422 : i64
      %7074 = arith.constant 0 : i64
      %7075 = func.call @cc_make_closure(%7073, %7074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %7076 = arith.addi %7075, %__rlasp_stack_elide_zero_354 : i64
      %7077 = llvm.mlir.addressof @str635 : !llvm.ptr
      %7078 = arith.constant 6 : i64
      %7079 = func.call @cc_make_string(%7077, %7078) : (!llvm.ptr, i64) -> i64
      %7080 = llvm.mlir.addressof @str636 : !llvm.ptr
      %7081 = arith.constant 11 : i64
      %7082 = func.call @cc_make_string(%7080, %7081) : (!llvm.ptr, i64) -> i64
      %7083 = func.call @cc_intern(%7079, %7082) : (i64, i64) -> i64
      %7084 = func.call @cc_nil_value() : () -> i64
      %7085 = func.call @cc_cons(%7083, %7084) : (i64, i64) -> i64
      %7086 = func.call @cc_values_pack(%7085) : (i64) -> i64
      func.call @stack_push_pointer(%7083) : (i64) -> ()
      %7087 = llvm.mlir.addressof @str637 : !llvm.ptr
      %7088 = arith.constant 9 : i64
      %7089 = func.call @cc_make_string(%7087, %7088) : (!llvm.ptr, i64) -> i64
      %7090 = llvm.mlir.addressof @str638 : !llvm.ptr
      %7091 = arith.constant 11 : i64
      %7092 = func.call @cc_make_string(%7090, %7091) : (!llvm.ptr, i64) -> i64
      %7093 = func.call @cc_intern(%7089, %7092) : (i64, i64) -> i64
      %7094 = func.call @cc_nil_value() : () -> i64
      %7095 = func.call @cc_cons(%7093, %7094) : (i64, i64) -> i64
      %7096 = func.call @cc_values_pack(%7095) : (i64) -> i64
      func.call @stack_push_pointer(%7093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7097 = func.call @stack_pop_pointer() : () -> i64
      %7098 = func.call @stack_pop_pointer() : () -> i64
      %7099 = func.call @cc_cons(%7098, %7097) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %7100 = arith.addi %7099, %__rlasp_stack_elide_zero_355 : i64
      %7101 = func.call @stack_pop_pointer() : () -> i64
      %7102 = func.call @cc_cons(%7101, %7100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7102) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7103 = func.call @stack_pop_pointer() : () -> i64
      %7104 = func.call @stack_pop_pointer() : () -> i64
      %7105 = func.call @cc_cons(%7104, %7103) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %7106 = arith.addi %7105, %__rlasp_stack_elide_zero_356 : i64
      %7107 = llvm.mlir.addressof @str639 : !llvm.ptr
      %7108 = arith.constant 11 : i64
      %7109 = func.call @cc_make_string(%7107, %7108) : (!llvm.ptr, i64) -> i64
      %7110 = llvm.mlir.addressof @str640 : !llvm.ptr
      %7111 = arith.constant 7 : i64
      %7112 = func.call @cc_make_string(%7110, %7111) : (!llvm.ptr, i64) -> i64
      %7113 = func.call @cc_intern(%7109, %7112) : (i64, i64) -> i64
      %7114 = func.call @cc_nil_value() : () -> i64
      %7115 = func.call @cc_cons(%7113, %7114) : (i64, i64) -> i64
      %7116 = func.call @cc_values_pack(%7115) : (i64) -> i64
      %7117 = func.call @cc_nil_value() : () -> i64
      %7118 = llvm.mlir.addressof @str641 : !llvm.ptr
      %7119 = arith.constant 4 : i64
      %7120 = func.call @cc_make_string(%7118, %7119) : (!llvm.ptr, i64) -> i64
      %7121 = llvm.mlir.addressof @str642 : !llvm.ptr
      %7122 = arith.constant 7 : i64
      %7123 = func.call @cc_make_string(%7121, %7122) : (!llvm.ptr, i64) -> i64
      %7124 = func.call @cc_intern(%7120, %7123) : (i64, i64) -> i64
      %7125 = func.call @cc_nil_value() : () -> i64
      %7126 = func.call @cc_cons(%7124, %7125) : (i64, i64) -> i64
      %7127 = func.call @cc_values_pack(%7126) : (i64) -> i64
      %7128 = llvm.mlir.addressof @str643 : !llvm.ptr
      %7129 = arith.constant 5 : i64
      %7130 = func.call @cc_make_string(%7128, %7129) : (!llvm.ptr, i64) -> i64
      %7131 = func.call @cc_nil_value() : () -> i64
      %7132 = func.call @cc_intern(%7130, %7131) : (i64, i64) -> i64
      %7133 = func.call @cc_nil_value() : () -> i64
      %7134 = func.call @cc_cons(%7132, %7133) : (i64, i64) -> i64
      %7135 = func.call @cc_values_pack(%7134) : (i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %7136 = arith.addi %7132, %__rlasp_stack_elide_zero_357 : i64
      %7137 = func.call @cc_nil_value() : () -> i64
      %7138 = func.call @cc_errorp(%6975) : (i64) -> i64
      %7139 = arith.cmpi ne, %7138, %7137 : i64
      %7140 = arith.cmpi eq, %7137, %7137 : i64
      %7141 = arith.andi %7139, %7140 : i1
      %7142 = scf.if %7141 -> (i64) {
        scf.yield %6975 : i64
      } else {
        scf.yield %7137 : i64
      }
      %7143 = func.call @cc_errorp(%7033) : (i64) -> i64
      %7144 = arith.cmpi ne, %7143, %7137 : i64
      %7145 = arith.cmpi eq, %7142, %7137 : i64
      %7146 = arith.andi %7144, %7145 : i1
      %7147 = scf.if %7146 -> (i64) {
        scf.yield %7033 : i64
      } else {
        scf.yield %7142 : i64
      }
      %7148 = func.call @cc_errorp(%7076) : (i64) -> i64
      %7149 = arith.cmpi ne, %7148, %7137 : i64
      %7150 = arith.cmpi eq, %7147, %7137 : i64
      %7151 = arith.andi %7149, %7150 : i1
      %7152 = scf.if %7151 -> (i64) {
        scf.yield %7076 : i64
      } else {
        scf.yield %7147 : i64
      }
      %7153 = func.call @cc_errorp(%7106) : (i64) -> i64
      %7154 = arith.cmpi ne, %7153, %7137 : i64
      %7155 = arith.cmpi eq, %7152, %7137 : i64
      %7156 = arith.andi %7154, %7155 : i1
      %7157 = scf.if %7156 -> (i64) {
        scf.yield %7106 : i64
      } else {
        scf.yield %7152 : i64
      }
      %7158 = func.call @cc_errorp(%7113) : (i64) -> i64
      %7159 = arith.cmpi ne, %7158, %7137 : i64
      %7160 = arith.cmpi eq, %7157, %7137 : i64
      %7161 = arith.andi %7159, %7160 : i1
      %7162 = scf.if %7161 -> (i64) {
        scf.yield %7113 : i64
      } else {
        scf.yield %7157 : i64
      }
      %7163 = func.call @cc_errorp(%7117) : (i64) -> i64
      %7164 = arith.cmpi ne, %7163, %7137 : i64
      %7165 = arith.cmpi eq, %7162, %7137 : i64
      %7166 = arith.andi %7164, %7165 : i1
      %7167 = scf.if %7166 -> (i64) {
        scf.yield %7117 : i64
      } else {
        scf.yield %7162 : i64
      }
      %7168 = func.call @cc_errorp(%7124) : (i64) -> i64
      %7169 = arith.cmpi ne, %7168, %7137 : i64
      %7170 = arith.cmpi eq, %7167, %7137 : i64
      %7171 = arith.andi %7169, %7170 : i1
      %7172 = scf.if %7171 -> (i64) {
        scf.yield %7124 : i64
      } else {
        scf.yield %7167 : i64
      }
      %7173 = func.call @cc_errorp(%7136) : (i64) -> i64
      %7174 = arith.cmpi ne, %7173, %7137 : i64
      %7175 = arith.cmpi eq, %7172, %7137 : i64
      %7176 = arith.andi %7174, %7175 : i1
      %7177 = scf.if %7176 -> (i64) {
        scf.yield %7136 : i64
      } else {
        scf.yield %7172 : i64
      }
      %7178 = arith.cmpi ne, %7177, %7137 : i64
      scf.if %7178 {
        func.call @stack_push_pointer(%7177) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6975) : (i64) -> ()
        func.call @stack_push_pointer(%7033) : (i64) -> ()
        func.call @stack_push_pointer(%7076) : (i64) -> ()
        func.call @stack_push_pointer(%7106) : (i64) -> ()
        func.call @stack_push_pointer(%7113) : (i64) -> ()
        func.call @stack_push_pointer(%7117) : (i64) -> ()
        func.call @stack_push_pointer(%7124) : (i64) -> ()
        func.call @stack_push_pointer(%7136) : (i64) -> ()
        %7179 = llvm.mlir.addressof @str644 : !llvm.ptr
        %7180 = func.call @cc_make_function_ref_const(%7179) : (!llvm.ptr) -> i64
        %7181 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7180, %7181) : (i64, i64) -> ()
      }
      %7182 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7182 : i64
    }
    %7183 = func.call @cc_nil_value() : () -> i64
    %7184 = func.call @cc_errorp(%6966) : (i64) -> i64
    %7185 = arith.cmpi ne, %7184, %7183 : i64
    %7186 = scf.if %7185 -> (i64) {
      scf.yield %6966 : i64
    } else {
      %7187 = llvm.mlir.addressof @str645 : !llvm.ptr
      %7188 = arith.constant 5 : i64
      %7189 = func.call @cc_make_string(%7187, %7188) : (!llvm.ptr, i64) -> i64
      %7190 = func.call @cc_nil_value() : () -> i64
      %7191 = func.call @cc_intern(%7189, %7190) : (i64, i64) -> i64
      %7192 = func.call @cc_nil_value() : () -> i64
      %7193 = func.call @cc_cons(%7191, %7192) : (i64, i64) -> i64
      %7194 = func.call @cc_values_pack(%7193) : (i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %7195 = arith.addi %7191, %__rlasp_stack_elide_zero_358 : i64
      %7196 = llvm.mlir.addressof @str646 : !llvm.ptr
      %7197 = arith.constant 8 : i64
      %7198 = func.call @cc_make_string(%7196, %7197) : (!llvm.ptr, i64) -> i64
      %7199 = llvm.mlir.addressof @str647 : !llvm.ptr
      %7200 = arith.constant 11 : i64
      %7201 = func.call @cc_make_string(%7199, %7200) : (!llvm.ptr, i64) -> i64
      %7202 = func.call @cc_intern(%7198, %7201) : (i64, i64) -> i64
      %7203 = func.call @cc_nil_value() : () -> i64
      %7204 = func.call @cc_cons(%7202, %7203) : (i64, i64) -> i64
      %7205 = func.call @cc_values_pack(%7204) : (i64) -> i64
      func.call @stack_push_pointer(%7202) : (i64) -> ()
      %7206 = llvm.mlir.addressof @str648 : !llvm.ptr
      %7207 = arith.constant 1 : i64
      %7208 = func.call @cc_make_string(%7206, %7207) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7208) : (i64) -> ()
      %7209 = llvm.mlir.addressof @str649 : !llvm.ptr
      %7210 = arith.constant 1 : i64
      %7211 = func.call @cc_make_string(%7209, %7210) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7212 = func.call @stack_pop_pointer() : () -> i64
      %7213 = func.call @stack_pop_pointer() : () -> i64
      %7214 = func.call @cc_cons(%7213, %7212) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %7215 = arith.addi %7214, %__rlasp_stack_elide_zero_359 : i64
      %7216 = func.call @stack_pop_pointer() : () -> i64
      %7217 = func.call @cc_cons(%7216, %7215) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %7218 = arith.addi %7217, %__rlasp_stack_elide_zero_360 : i64
      %7219 = func.call @stack_pop_pointer() : () -> i64
      %7220 = func.call @cc_cons(%7219, %7218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %7221 = arith.addi %7220, %__rlasp_stack_elide_zero_361 : i64
      %7245 = arith.constant 122791386939423 : i64
      %7246 = arith.constant 0 : i64
      %7247 = func.call @cc_make_closure(%7245, %7246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %7248 = arith.addi %7247, %__rlasp_stack_elide_zero_362 : i64
      %7249 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7249) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7250 = func.call @stack_pop_pointer() : () -> i64
      %7251 = func.call @stack_pop_pointer() : () -> i64
      %7252 = func.call @cc_cons(%7251, %7250) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %7253 = arith.addi %7252, %__rlasp_stack_elide_zero_363 : i64
      %7254 = llvm.mlir.addressof @str654 : !llvm.ptr
      %7255 = arith.constant 11 : i64
      %7256 = func.call @cc_make_string(%7254, %7255) : (!llvm.ptr, i64) -> i64
      %7257 = llvm.mlir.addressof @str655 : !llvm.ptr
      %7258 = arith.constant 7 : i64
      %7259 = func.call @cc_make_string(%7257, %7258) : (!llvm.ptr, i64) -> i64
      %7260 = func.call @cc_intern(%7256, %7259) : (i64, i64) -> i64
      %7261 = func.call @cc_nil_value() : () -> i64
      %7262 = func.call @cc_cons(%7260, %7261) : (i64, i64) -> i64
      %7263 = func.call @cc_values_pack(%7262) : (i64) -> i64
      %7264 = func.call @cc_nil_value() : () -> i64
      %7265 = llvm.mlir.addressof @str656 : !llvm.ptr
      %7266 = arith.constant 4 : i64
      %7267 = func.call @cc_make_string(%7265, %7266) : (!llvm.ptr, i64) -> i64
      %7268 = llvm.mlir.addressof @str657 : !llvm.ptr
      %7269 = arith.constant 7 : i64
      %7270 = func.call @cc_make_string(%7268, %7269) : (!llvm.ptr, i64) -> i64
      %7271 = func.call @cc_intern(%7267, %7270) : (i64, i64) -> i64
      %7272 = func.call @cc_nil_value() : () -> i64
      %7273 = func.call @cc_cons(%7271, %7272) : (i64, i64) -> i64
      %7274 = func.call @cc_values_pack(%7273) : (i64) -> i64
      %7275 = llvm.mlir.addressof @str658 : !llvm.ptr
      %7276 = arith.constant 6 : i64
      %7277 = func.call @cc_make_string(%7275, %7276) : (!llvm.ptr, i64) -> i64
      %7278 = func.call @cc_nil_value() : () -> i64
      %7279 = func.call @cc_intern(%7277, %7278) : (i64, i64) -> i64
      %7280 = func.call @cc_nil_value() : () -> i64
      %7281 = func.call @cc_cons(%7279, %7280) : (i64, i64) -> i64
      %7282 = func.call @cc_values_pack(%7281) : (i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %7283 = arith.addi %7279, %__rlasp_stack_elide_zero_364 : i64
      %7284 = func.call @cc_nil_value() : () -> i64
      %7285 = func.call @cc_errorp(%7195) : (i64) -> i64
      %7286 = arith.cmpi ne, %7285, %7284 : i64
      %7287 = arith.cmpi eq, %7284, %7284 : i64
      %7288 = arith.andi %7286, %7287 : i1
      %7289 = scf.if %7288 -> (i64) {
        scf.yield %7195 : i64
      } else {
        scf.yield %7284 : i64
      }
      %7290 = func.call @cc_errorp(%7221) : (i64) -> i64
      %7291 = arith.cmpi ne, %7290, %7284 : i64
      %7292 = arith.cmpi eq, %7289, %7284 : i64
      %7293 = arith.andi %7291, %7292 : i1
      %7294 = scf.if %7293 -> (i64) {
        scf.yield %7221 : i64
      } else {
        scf.yield %7289 : i64
      }
      %7295 = func.call @cc_errorp(%7248) : (i64) -> i64
      %7296 = arith.cmpi ne, %7295, %7284 : i64
      %7297 = arith.cmpi eq, %7294, %7284 : i64
      %7298 = arith.andi %7296, %7297 : i1
      %7299 = scf.if %7298 -> (i64) {
        scf.yield %7248 : i64
      } else {
        scf.yield %7294 : i64
      }
      %7300 = func.call @cc_errorp(%7253) : (i64) -> i64
      %7301 = arith.cmpi ne, %7300, %7284 : i64
      %7302 = arith.cmpi eq, %7299, %7284 : i64
      %7303 = arith.andi %7301, %7302 : i1
      %7304 = scf.if %7303 -> (i64) {
        scf.yield %7253 : i64
      } else {
        scf.yield %7299 : i64
      }
      %7305 = func.call @cc_errorp(%7260) : (i64) -> i64
      %7306 = arith.cmpi ne, %7305, %7284 : i64
      %7307 = arith.cmpi eq, %7304, %7284 : i64
      %7308 = arith.andi %7306, %7307 : i1
      %7309 = scf.if %7308 -> (i64) {
        scf.yield %7260 : i64
      } else {
        scf.yield %7304 : i64
      }
      %7310 = func.call @cc_errorp(%7264) : (i64) -> i64
      %7311 = arith.cmpi ne, %7310, %7284 : i64
      %7312 = arith.cmpi eq, %7309, %7284 : i64
      %7313 = arith.andi %7311, %7312 : i1
      %7314 = scf.if %7313 -> (i64) {
        scf.yield %7264 : i64
      } else {
        scf.yield %7309 : i64
      }
      %7315 = func.call @cc_errorp(%7271) : (i64) -> i64
      %7316 = arith.cmpi ne, %7315, %7284 : i64
      %7317 = arith.cmpi eq, %7314, %7284 : i64
      %7318 = arith.andi %7316, %7317 : i1
      %7319 = scf.if %7318 -> (i64) {
        scf.yield %7271 : i64
      } else {
        scf.yield %7314 : i64
      }
      %7320 = func.call @cc_errorp(%7283) : (i64) -> i64
      %7321 = arith.cmpi ne, %7320, %7284 : i64
      %7322 = arith.cmpi eq, %7319, %7284 : i64
      %7323 = arith.andi %7321, %7322 : i1
      %7324 = scf.if %7323 -> (i64) {
        scf.yield %7283 : i64
      } else {
        scf.yield %7319 : i64
      }
      %7325 = arith.cmpi ne, %7324, %7284 : i64
      scf.if %7325 {
        func.call @stack_push_pointer(%7324) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7195) : (i64) -> ()
        func.call @stack_push_pointer(%7221) : (i64) -> ()
        func.call @stack_push_pointer(%7248) : (i64) -> ()
        func.call @stack_push_pointer(%7253) : (i64) -> ()
        func.call @stack_push_pointer(%7260) : (i64) -> ()
        func.call @stack_push_pointer(%7264) : (i64) -> ()
        func.call @stack_push_pointer(%7271) : (i64) -> ()
        func.call @stack_push_pointer(%7283) : (i64) -> ()
        %7326 = llvm.mlir.addressof @str659 : !llvm.ptr
        %7327 = func.call @cc_make_function_ref_const(%7326) : (!llvm.ptr) -> i64
        %7328 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7327, %7328) : (i64, i64) -> ()
      }
      %7329 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7329 : i64
    }
    %7330 = func.call @cc_nil_value() : () -> i64
    %7331 = func.call @cc_errorp(%7186) : (i64) -> i64
    %7332 = arith.cmpi ne, %7331, %7330 : i64
    %7333 = scf.if %7332 -> (i64) {
      scf.yield %7186 : i64
    } else {
      %7334 = llvm.mlir.addressof @str660 : !llvm.ptr
      %7335 = arith.constant 5 : i64
      %7336 = func.call @cc_make_string(%7334, %7335) : (!llvm.ptr, i64) -> i64
      %7337 = func.call @cc_nil_value() : () -> i64
      %7338 = func.call @cc_intern(%7336, %7337) : (i64, i64) -> i64
      %7339 = func.call @cc_nil_value() : () -> i64
      %7340 = func.call @cc_cons(%7338, %7339) : (i64, i64) -> i64
      %7341 = func.call @cc_values_pack(%7340) : (i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %7342 = arith.addi %7338, %__rlasp_stack_elide_zero_365 : i64
      %7343 = llvm.mlir.addressof @str661 : !llvm.ptr
      %7344 = arith.constant 16 : i64
      %7345 = func.call @cc_make_string(%7343, %7344) : (!llvm.ptr, i64) -> i64
      %7346 = llvm.mlir.addressof @str662 : !llvm.ptr
      %7347 = arith.constant 11 : i64
      %7348 = func.call @cc_make_string(%7346, %7347) : (!llvm.ptr, i64) -> i64
      %7349 = func.call @cc_intern(%7345, %7348) : (i64, i64) -> i64
      %7350 = func.call @cc_nil_value() : () -> i64
      %7351 = func.call @cc_cons(%7349, %7350) : (i64, i64) -> i64
      %7352 = func.call @cc_values_pack(%7351) : (i64) -> i64
      func.call @stack_push_pointer(%7349) : (i64) -> ()
      %7353 = llvm.mlir.addressof @str663 : !llvm.ptr
      %7354 = arith.constant 1 : i64
      %7355 = func.call @cc_make_string(%7353, %7354) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7355) : (i64) -> ()
      %7356 = llvm.mlir.addressof @str664 : !llvm.ptr
      %7357 = arith.constant 1 : i64
      %7358 = func.call @cc_make_string(%7356, %7357) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7358) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7359 = func.call @stack_pop_pointer() : () -> i64
      %7360 = func.call @stack_pop_pointer() : () -> i64
      %7361 = func.call @cc_cons(%7360, %7359) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %7362 = arith.addi %7361, %__rlasp_stack_elide_zero_366 : i64
      %7363 = func.call @stack_pop_pointer() : () -> i64
      %7364 = func.call @cc_cons(%7363, %7362) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %7365 = arith.addi %7364, %__rlasp_stack_elide_zero_367 : i64
      %7366 = func.call @stack_pop_pointer() : () -> i64
      %7367 = func.call @cc_cons(%7366, %7365) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %7368 = arith.addi %7367, %__rlasp_stack_elide_zero_368 : i64
      %7392 = arith.constant 122791386939424 : i64
      %7393 = arith.constant 0 : i64
      %7394 = func.call @cc_make_closure(%7392, %7393) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %7395 = arith.addi %7394, %__rlasp_stack_elide_zero_369 : i64
      %7396 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7396) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7397 = func.call @stack_pop_pointer() : () -> i64
      %7398 = func.call @stack_pop_pointer() : () -> i64
      %7399 = func.call @cc_cons(%7398, %7397) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %7400 = arith.addi %7399, %__rlasp_stack_elide_zero_370 : i64
      %7401 = llvm.mlir.addressof @str669 : !llvm.ptr
      %7402 = arith.constant 11 : i64
      %7403 = func.call @cc_make_string(%7401, %7402) : (!llvm.ptr, i64) -> i64
      %7404 = llvm.mlir.addressof @str670 : !llvm.ptr
      %7405 = arith.constant 7 : i64
      %7406 = func.call @cc_make_string(%7404, %7405) : (!llvm.ptr, i64) -> i64
      %7407 = func.call @cc_intern(%7403, %7406) : (i64, i64) -> i64
      %7408 = func.call @cc_nil_value() : () -> i64
      %7409 = func.call @cc_cons(%7407, %7408) : (i64, i64) -> i64
      %7410 = func.call @cc_values_pack(%7409) : (i64) -> i64
      %7411 = func.call @cc_nil_value() : () -> i64
      %7412 = llvm.mlir.addressof @str671 : !llvm.ptr
      %7413 = arith.constant 4 : i64
      %7414 = func.call @cc_make_string(%7412, %7413) : (!llvm.ptr, i64) -> i64
      %7415 = llvm.mlir.addressof @str672 : !llvm.ptr
      %7416 = arith.constant 7 : i64
      %7417 = func.call @cc_make_string(%7415, %7416) : (!llvm.ptr, i64) -> i64
      %7418 = func.call @cc_intern(%7414, %7417) : (i64, i64) -> i64
      %7419 = func.call @cc_nil_value() : () -> i64
      %7420 = func.call @cc_cons(%7418, %7419) : (i64, i64) -> i64
      %7421 = func.call @cc_values_pack(%7420) : (i64) -> i64
      %7422 = llvm.mlir.addressof @str673 : !llvm.ptr
      %7423 = arith.constant 6 : i64
      %7424 = func.call @cc_make_string(%7422, %7423) : (!llvm.ptr, i64) -> i64
      %7425 = func.call @cc_nil_value() : () -> i64
      %7426 = func.call @cc_intern(%7424, %7425) : (i64, i64) -> i64
      %7427 = func.call @cc_nil_value() : () -> i64
      %7428 = func.call @cc_cons(%7426, %7427) : (i64, i64) -> i64
      %7429 = func.call @cc_values_pack(%7428) : (i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %7430 = arith.addi %7426, %__rlasp_stack_elide_zero_371 : i64
      %7431 = func.call @cc_nil_value() : () -> i64
      %7432 = func.call @cc_errorp(%7342) : (i64) -> i64
      %7433 = arith.cmpi ne, %7432, %7431 : i64
      %7434 = arith.cmpi eq, %7431, %7431 : i64
      %7435 = arith.andi %7433, %7434 : i1
      %7436 = scf.if %7435 -> (i64) {
        scf.yield %7342 : i64
      } else {
        scf.yield %7431 : i64
      }
      %7437 = func.call @cc_errorp(%7368) : (i64) -> i64
      %7438 = arith.cmpi ne, %7437, %7431 : i64
      %7439 = arith.cmpi eq, %7436, %7431 : i64
      %7440 = arith.andi %7438, %7439 : i1
      %7441 = scf.if %7440 -> (i64) {
        scf.yield %7368 : i64
      } else {
        scf.yield %7436 : i64
      }
      %7442 = func.call @cc_errorp(%7395) : (i64) -> i64
      %7443 = arith.cmpi ne, %7442, %7431 : i64
      %7444 = arith.cmpi eq, %7441, %7431 : i64
      %7445 = arith.andi %7443, %7444 : i1
      %7446 = scf.if %7445 -> (i64) {
        scf.yield %7395 : i64
      } else {
        scf.yield %7441 : i64
      }
      %7447 = func.call @cc_errorp(%7400) : (i64) -> i64
      %7448 = arith.cmpi ne, %7447, %7431 : i64
      %7449 = arith.cmpi eq, %7446, %7431 : i64
      %7450 = arith.andi %7448, %7449 : i1
      %7451 = scf.if %7450 -> (i64) {
        scf.yield %7400 : i64
      } else {
        scf.yield %7446 : i64
      }
      %7452 = func.call @cc_errorp(%7407) : (i64) -> i64
      %7453 = arith.cmpi ne, %7452, %7431 : i64
      %7454 = arith.cmpi eq, %7451, %7431 : i64
      %7455 = arith.andi %7453, %7454 : i1
      %7456 = scf.if %7455 -> (i64) {
        scf.yield %7407 : i64
      } else {
        scf.yield %7451 : i64
      }
      %7457 = func.call @cc_errorp(%7411) : (i64) -> i64
      %7458 = arith.cmpi ne, %7457, %7431 : i64
      %7459 = arith.cmpi eq, %7456, %7431 : i64
      %7460 = arith.andi %7458, %7459 : i1
      %7461 = scf.if %7460 -> (i64) {
        scf.yield %7411 : i64
      } else {
        scf.yield %7456 : i64
      }
      %7462 = func.call @cc_errorp(%7418) : (i64) -> i64
      %7463 = arith.cmpi ne, %7462, %7431 : i64
      %7464 = arith.cmpi eq, %7461, %7431 : i64
      %7465 = arith.andi %7463, %7464 : i1
      %7466 = scf.if %7465 -> (i64) {
        scf.yield %7418 : i64
      } else {
        scf.yield %7461 : i64
      }
      %7467 = func.call @cc_errorp(%7430) : (i64) -> i64
      %7468 = arith.cmpi ne, %7467, %7431 : i64
      %7469 = arith.cmpi eq, %7466, %7431 : i64
      %7470 = arith.andi %7468, %7469 : i1
      %7471 = scf.if %7470 -> (i64) {
        scf.yield %7430 : i64
      } else {
        scf.yield %7466 : i64
      }
      %7472 = arith.cmpi ne, %7471, %7431 : i64
      scf.if %7472 {
        func.call @stack_push_pointer(%7471) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7342) : (i64) -> ()
        func.call @stack_push_pointer(%7368) : (i64) -> ()
        func.call @stack_push_pointer(%7395) : (i64) -> ()
        func.call @stack_push_pointer(%7400) : (i64) -> ()
        func.call @stack_push_pointer(%7407) : (i64) -> ()
        func.call @stack_push_pointer(%7411) : (i64) -> ()
        func.call @stack_push_pointer(%7418) : (i64) -> ()
        func.call @stack_push_pointer(%7430) : (i64) -> ()
        %7473 = llvm.mlir.addressof @str674 : !llvm.ptr
        %7474 = func.call @cc_make_function_ref_const(%7473) : (!llvm.ptr) -> i64
        %7475 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7474, %7475) : (i64, i64) -> ()
      }
      %7476 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7476 : i64
    }
    %7477 = func.call @cc_nil_value() : () -> i64
    %7478 = func.call @cc_errorp(%7333) : (i64) -> i64
    %7479 = arith.cmpi ne, %7478, %7477 : i64
    %7480 = scf.if %7479 -> (i64) {
      scf.yield %7333 : i64
    } else {
      %7481 = llvm.mlir.addressof @str675 : !llvm.ptr
      %7482 = arith.constant 22 : i64
      %7483 = func.call @cc_make_string(%7481, %7482) : (!llvm.ptr, i64) -> i64
      %7484 = func.call @cc_nil_value() : () -> i64
      %7485 = func.call @cc_intern(%7483, %7484) : (i64, i64) -> i64
      %7486 = func.call @cc_nil_value() : () -> i64
      %7487 = func.call @cc_cons(%7485, %7486) : (i64, i64) -> i64
      %7488 = func.call @cc_values_pack(%7487) : (i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %7489 = arith.addi %7485, %__rlasp_stack_elide_zero_372 : i64
      %7490 = llvm.mlir.addressof @str676 : !llvm.ptr
      %7491 = arith.constant 3 : i64
      %7492 = func.call @cc_make_string(%7490, %7491) : (!llvm.ptr, i64) -> i64
      %7493 = func.call @cc_nil_value() : () -> i64
      %7494 = func.call @cc_intern(%7492, %7493) : (i64, i64) -> i64
      %7495 = func.call @cc_nil_value() : () -> i64
      %7496 = func.call @cc_cons(%7494, %7495) : (i64, i64) -> i64
      %7497 = func.call @cc_values_pack(%7496) : (i64) -> i64
      func.call @stack_push_pointer(%7494) : (i64) -> ()
      %7498 = llvm.mlir.addressof @str677 : !llvm.ptr
      %7499 = arith.constant 3 : i64
      %7500 = func.call @cc_make_string(%7498, %7499) : (!llvm.ptr, i64) -> i64
      %7501 = func.call @cc_nil_value() : () -> i64
      %7502 = func.call @cc_intern(%7500, %7501) : (i64, i64) -> i64
      %7503 = func.call @cc_nil_value() : () -> i64
      %7504 = func.call @cc_cons(%7502, %7503) : (i64, i64) -> i64
      %7505 = func.call @cc_values_pack(%7504) : (i64) -> i64
      func.call @stack_push_pointer(%7502) : (i64) -> ()
      %7506 = llvm.mlir.addressof @str678 : !llvm.ptr
      %7507 = arith.constant 12 : i64
      %7508 = func.call @cc_make_string(%7506, %7507) : (!llvm.ptr, i64) -> i64
      %7509 = llvm.mlir.addressof @str679 : !llvm.ptr
      %7510 = arith.constant 11 : i64
      %7511 = func.call @cc_make_string(%7509, %7510) : (!llvm.ptr, i64) -> i64
      %7512 = func.call @cc_intern(%7508, %7511) : (i64, i64) -> i64
      %7513 = func.call @cc_nil_value() : () -> i64
      %7514 = func.call @cc_cons(%7512, %7513) : (i64, i64) -> i64
      %7515 = func.call @cc_values_pack(%7514) : (i64) -> i64
      func.call @stack_push_pointer(%7512) : (i64) -> ()
      %7516 = llvm.mlir.addressof @str680 : !llvm.ptr
      %7517 = arith.constant 10 : i64
      %7518 = func.call @cc_make_string(%7516, %7517) : (!llvm.ptr, i64) -> i64
      %7519 = llvm.mlir.addressof @str681 : !llvm.ptr
      %7520 = arith.constant 11 : i64
      %7521 = func.call @cc_make_string(%7519, %7520) : (!llvm.ptr, i64) -> i64
      %7522 = func.call @cc_intern(%7518, %7521) : (i64, i64) -> i64
      %7523 = func.call @cc_nil_value() : () -> i64
      %7524 = func.call @cc_cons(%7522, %7523) : (i64, i64) -> i64
      %7525 = func.call @cc_values_pack(%7524) : (i64) -> i64
      func.call @stack_push_pointer(%7522) : (i64) -> ()
      %7526 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%7526) : (i64) -> ()
      %7527 = llvm.mlir.addressof @str682 : !llvm.ptr
      %7528 = arith.constant 12 : i64
      %7529 = func.call @cc_make_string(%7527, %7528) : (!llvm.ptr, i64) -> i64
      %7530 = llvm.mlir.addressof @str683 : !llvm.ptr
      %7531 = arith.constant 7 : i64
      %7532 = func.call @cc_make_string(%7530, %7531) : (!llvm.ptr, i64) -> i64
      %7533 = func.call @cc_intern(%7529, %7532) : (i64, i64) -> i64
      %7534 = func.call @cc_nil_value() : () -> i64
      %7535 = func.call @cc_cons(%7533, %7534) : (i64, i64) -> i64
      %7536 = func.call @cc_values_pack(%7535) : (i64) -> i64
      func.call @stack_push_pointer(%7533) : (i64) -> ()
      %7537 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7537) : (i64) -> ()
      %7538 = llvm.mlir.addressof @str684 : !llvm.ptr
      %7539 = arith.constant 9 : i64
      %7540 = func.call @cc_make_string(%7538, %7539) : (!llvm.ptr, i64) -> i64
      %7541 = llvm.mlir.addressof @str685 : !llvm.ptr
      %7542 = arith.constant 11 : i64
      %7543 = func.call @cc_make_string(%7541, %7542) : (!llvm.ptr, i64) -> i64
      %7544 = func.call @cc_intern(%7540, %7543) : (i64, i64) -> i64
      %7545 = func.call @cc_nil_value() : () -> i64
      %7546 = func.call @cc_cons(%7544, %7545) : (i64, i64) -> i64
      %7547 = func.call @cc_values_pack(%7546) : (i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %7548 = arith.addi %7544, %__rlasp_stack_elide_zero_373 : i64
      %7549 = func.call @stack_pop_pointer() : () -> i64
      %7550 = func.call @cc_cons(%7548, %7549) : (i64, i64) -> i64
      %7551 = llvm.mlir.addressof @str686 : !llvm.ptr
      %7552 = arith.constant 5 : i64
      %7553 = func.call @cc_make_string(%7551, %7552) : (!llvm.ptr, i64) -> i64
      %7554 = func.call @cc_nil_value() : () -> i64
      %7555 = func.call @cc_intern(%7553, %7554) : (i64, i64) -> i64
      %7556 = func.call @cc_nil_value() : () -> i64
      %7557 = func.call @cc_cons(%7555, %7556) : (i64, i64) -> i64
      %7558 = func.call @cc_values_pack(%7557) : (i64) -> i64
      %7559 = func.call @cc_cons(%7555, %7550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7559) : (i64) -> ()
      %7560 = llvm.mlir.addressof @str687 : !llvm.ptr
      %7561 = arith.constant 16 : i64
      %7562 = func.call @cc_make_string(%7560, %7561) : (!llvm.ptr, i64) -> i64
      %7563 = llvm.mlir.addressof @str688 : !llvm.ptr
      %7564 = arith.constant 7 : i64
      %7565 = func.call @cc_make_string(%7563, %7564) : (!llvm.ptr, i64) -> i64
      %7566 = func.call @cc_intern(%7562, %7565) : (i64, i64) -> i64
      %7567 = func.call @cc_nil_value() : () -> i64
      %7568 = func.call @cc_cons(%7566, %7567) : (i64, i64) -> i64
      %7569 = func.call @cc_values_pack(%7568) : (i64) -> i64
      func.call @stack_push_pointer(%7566) : (i64) -> ()
      %7570 = llvm.mlir.addressof @str689 : !llvm.ptr
      %7571 = arith.constant 4 : i64
      %7572 = func.call @cc_make_string(%7570, %7571) : (!llvm.ptr, i64) -> i64
      %7573 = llvm.mlir.addressof @str690 : !llvm.ptr
      %7574 = arith.constant 11 : i64
      %7575 = func.call @cc_make_string(%7573, %7574) : (!llvm.ptr, i64) -> i64
      %7576 = func.call @cc_intern(%7572, %7575) : (i64, i64) -> i64
      %7577 = func.call @cc_nil_value() : () -> i64
      %7578 = func.call @cc_cons(%7576, %7577) : (i64, i64) -> i64
      %7579 = func.call @cc_values_pack(%7578) : (i64) -> i64
      func.call @stack_push_pointer(%7576) : (i64) -> ()
      %7580 = arith.constant 63 : i64
      %7581 = func.call @cc_box_character(%7580) : (i64) -> i64
      func.call @stack_push_pointer(%7581) : (i64) -> ()
      %7582 = llvm.mlir.addressof @str691 : !llvm.ptr
      %7583 = arith.constant 9 : i64
      %7584 = func.call @cc_make_string(%7582, %7583) : (!llvm.ptr, i64) -> i64
      %7585 = llvm.mlir.addressof @str692 : !llvm.ptr
      %7586 = arith.constant 11 : i64
      %7587 = func.call @cc_make_string(%7585, %7586) : (!llvm.ptr, i64) -> i64
      %7588 = func.call @cc_intern(%7584, %7587) : (i64, i64) -> i64
      %7589 = func.call @cc_nil_value() : () -> i64
      %7590 = func.call @cc_cons(%7588, %7589) : (i64, i64) -> i64
      %7591 = func.call @cc_values_pack(%7590) : (i64) -> i64
      func.call @stack_push_pointer(%7588) : (i64) -> ()
      %7592 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%7592) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7593 = func.call @stack_pop_pointer() : () -> i64
      %7594 = func.call @stack_pop_pointer() : () -> i64
      %7595 = func.call @cc_cons(%7594, %7593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %7596 = arith.addi %7595, %__rlasp_stack_elide_zero_374 : i64
      %7597 = func.call @stack_pop_pointer() : () -> i64
      %7598 = func.call @cc_cons(%7597, %7596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7598) : (i64) -> ()
      %7599 = arith.constant 63 : i64
      %7600 = func.call @cc_box_character(%7599) : (i64) -> i64
      func.call @stack_push_pointer(%7600) : (i64) -> ()
      %7601 = arith.constant 63 : i64
      %7602 = func.call @cc_box_character(%7601) : (i64) -> i64
      func.call @stack_push_pointer(%7602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7603 = func.call @stack_pop_pointer() : () -> i64
      %7604 = func.call @stack_pop_pointer() : () -> i64
      %7605 = func.call @cc_cons(%7604, %7603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %7606 = arith.addi %7605, %__rlasp_stack_elide_zero_375 : i64
      %7607 = func.call @stack_pop_pointer() : () -> i64
      %7608 = func.call @cc_cons(%7607, %7606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %7609 = arith.addi %7608, %__rlasp_stack_elide_zero_376 : i64
      %7610 = func.call @stack_pop_pointer() : () -> i64
      %7611 = func.call @cc_cons(%7610, %7609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %7612 = arith.addi %7611, %__rlasp_stack_elide_zero_377 : i64
      %7613 = func.call @stack_pop_pointer() : () -> i64
      %7614 = func.call @cc_cons(%7613, %7612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %7615 = arith.addi %7614, %__rlasp_stack_elide_zero_378 : i64
      %7616 = func.call @stack_pop_pointer() : () -> i64
      %7617 = func.call @cc_cons(%7616, %7615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7618 = func.call @stack_pop_pointer() : () -> i64
      %7619 = func.call @stack_pop_pointer() : () -> i64
      %7620 = func.call @cc_cons(%7619, %7618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %7621 = arith.addi %7620, %__rlasp_stack_elide_zero_379 : i64
      %7622 = func.call @stack_pop_pointer() : () -> i64
      %7623 = func.call @cc_cons(%7622, %7621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %7624 = arith.addi %7623, %__rlasp_stack_elide_zero_380 : i64
      %7625 = func.call @stack_pop_pointer() : () -> i64
      %7626 = func.call @cc_cons(%7625, %7624) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
      %7627 = arith.addi %7626, %__rlasp_stack_elide_zero_381 : i64
      %7628 = func.call @stack_pop_pointer() : () -> i64
      %7629 = func.call @cc_cons(%7628, %7627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
      %7630 = arith.addi %7629, %__rlasp_stack_elide_zero_382 : i64
      %7631 = func.call @stack_pop_pointer() : () -> i64
      %7632 = func.call @cc_cons(%7631, %7630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
      %7633 = arith.addi %7632, %__rlasp_stack_elide_zero_383 : i64
      %7634 = func.call @stack_pop_pointer() : () -> i64
      %7635 = func.call @cc_cons(%7634, %7633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7635) : (i64) -> ()
      %7636 = llvm.mlir.addressof @str693 : !llvm.ptr
      %7637 = arith.constant 3 : i64
      %7638 = func.call @cc_make_string(%7636, %7637) : (!llvm.ptr, i64) -> i64
      %7639 = func.call @cc_nil_value() : () -> i64
      %7640 = func.call @cc_intern(%7638, %7639) : (i64, i64) -> i64
      %7641 = func.call @cc_nil_value() : () -> i64
      %7642 = func.call @cc_cons(%7640, %7641) : (i64, i64) -> i64
      %7643 = func.call @cc_values_pack(%7642) : (i64) -> i64
      func.call @stack_push_pointer(%7640) : (i64) -> ()
      %7644 = llvm.mlir.addressof @str694 : !llvm.ptr
      %7645 = arith.constant 3 : i64
      %7646 = func.call @cc_make_string(%7644, %7645) : (!llvm.ptr, i64) -> i64
      %7647 = func.call @cc_nil_value() : () -> i64
      %7648 = func.call @cc_intern(%7646, %7647) : (i64, i64) -> i64
      %7649 = func.call @cc_nil_value() : () -> i64
      %7650 = func.call @cc_cons(%7648, %7649) : (i64, i64) -> i64
      %7651 = func.call @cc_values_pack(%7650) : (i64) -> i64
      func.call @stack_push_pointer(%7648) : (i64) -> ()
      %7652 = llvm.mlir.addressof @str695 : !llvm.ptr
      %7653 = arith.constant 8 : i64
      %7654 = func.call @cc_make_string(%7652, %7653) : (!llvm.ptr, i64) -> i64
      %7655 = llvm.mlir.addressof @str696 : !llvm.ptr
      %7656 = arith.constant 11 : i64
      %7657 = func.call @cc_make_string(%7655, %7656) : (!llvm.ptr, i64) -> i64
      %7658 = func.call @cc_intern(%7654, %7657) : (i64, i64) -> i64
      %7659 = func.call @cc_nil_value() : () -> i64
      %7660 = func.call @cc_cons(%7658, %7659) : (i64, i64) -> i64
      %7661 = func.call @cc_values_pack(%7660) : (i64) -> i64
      func.call @stack_push_pointer(%7658) : (i64) -> ()
      %7662 = llvm.mlir.addressof @str697 : !llvm.ptr
      %7663 = arith.constant 4 : i64
      %7664 = func.call @cc_make_string(%7662, %7663) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7664) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7665 = func.call @stack_pop_pointer() : () -> i64
      %7666 = func.call @stack_pop_pointer() : () -> i64
      %7667 = func.call @cc_cons(%7666, %7665) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
      %7668 = arith.addi %7667, %__rlasp_stack_elide_zero_384 : i64
      %7669 = func.call @stack_pop_pointer() : () -> i64
      %7670 = func.call @cc_cons(%7669, %7668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7670) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7671 = func.call @stack_pop_pointer() : () -> i64
      %7672 = func.call @stack_pop_pointer() : () -> i64
      %7673 = func.call @cc_cons(%7672, %7671) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
      %7674 = arith.addi %7673, %__rlasp_stack_elide_zero_385 : i64
      %7675 = func.call @stack_pop_pointer() : () -> i64
      %7676 = func.call @cc_cons(%7675, %7674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7677 = func.call @stack_pop_pointer() : () -> i64
      %7678 = func.call @stack_pop_pointer() : () -> i64
      %7679 = func.call @cc_cons(%7678, %7677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7679) : (i64) -> ()
      %7680 = llvm.mlir.addressof @str698 : !llvm.ptr
      %7681 = arith.constant 4 : i64
      %7682 = func.call @cc_make_string(%7680, %7681) : (!llvm.ptr, i64) -> i64
      %7683 = llvm.mlir.addressof @str699 : !llvm.ptr
      %7684 = arith.constant 11 : i64
      %7685 = func.call @cc_make_string(%7683, %7684) : (!llvm.ptr, i64) -> i64
      %7686 = func.call @cc_intern(%7682, %7685) : (i64, i64) -> i64
      %7687 = func.call @cc_nil_value() : () -> i64
      %7688 = func.call @cc_cons(%7686, %7687) : (i64, i64) -> i64
      %7689 = func.call @cc_values_pack(%7688) : (i64) -> i64
      func.call @stack_push_pointer(%7686) : (i64) -> ()
      %7690 = llvm.mlir.addressof @str700 : !llvm.ptr
      %7691 = arith.constant 4 : i64
      %7692 = func.call @cc_make_string(%7690, %7691) : (!llvm.ptr, i64) -> i64
      %7693 = llvm.mlir.addressof @str701 : !llvm.ptr
      %7694 = arith.constant 11 : i64
      %7695 = func.call @cc_make_string(%7693, %7694) : (!llvm.ptr, i64) -> i64
      %7696 = func.call @cc_intern(%7692, %7695) : (i64, i64) -> i64
      %7697 = func.call @cc_nil_value() : () -> i64
      %7698 = func.call @cc_cons(%7696, %7697) : (i64, i64) -> i64
      %7699 = func.call @cc_values_pack(%7698) : (i64) -> i64
      func.call @stack_push_pointer(%7696) : (i64) -> ()
      %7700 = llvm.mlir.addressof @str702 : !llvm.ptr
      %7701 = arith.constant 3 : i64
      %7702 = func.call @cc_make_string(%7700, %7701) : (!llvm.ptr, i64) -> i64
      %7703 = func.call @cc_nil_value() : () -> i64
      %7704 = func.call @cc_intern(%7702, %7703) : (i64, i64) -> i64
      %7705 = func.call @cc_nil_value() : () -> i64
      %7706 = func.call @cc_cons(%7704, %7705) : (i64, i64) -> i64
      %7707 = func.call @cc_values_pack(%7706) : (i64) -> i64
      func.call @stack_push_pointer(%7704) : (i64) -> ()
      %7708 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%7708) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7709 = func.call @stack_pop_pointer() : () -> i64
      %7710 = func.call @stack_pop_pointer() : () -> i64
      %7711 = func.call @cc_cons(%7710, %7709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
      %7712 = arith.addi %7711, %__rlasp_stack_elide_zero_386 : i64
      %7713 = func.call @stack_pop_pointer() : () -> i64
      %7714 = func.call @cc_cons(%7713, %7712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
      %7715 = arith.addi %7714, %__rlasp_stack_elide_zero_387 : i64
      %7716 = func.call @stack_pop_pointer() : () -> i64
      %7717 = func.call @cc_cons(%7716, %7715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7717) : (i64) -> ()
      %7718 = llvm.mlir.addressof @str703 : !llvm.ptr
      %7719 = arith.constant 9 : i64
      %7720 = func.call @cc_make_string(%7718, %7719) : (!llvm.ptr, i64) -> i64
      %7721 = llvm.mlir.addressof @str704 : !llvm.ptr
      %7722 = arith.constant 11 : i64
      %7723 = func.call @cc_make_string(%7721, %7722) : (!llvm.ptr, i64) -> i64
      %7724 = func.call @cc_intern(%7720, %7723) : (i64, i64) -> i64
      %7725 = func.call @cc_nil_value() : () -> i64
      %7726 = func.call @cc_cons(%7724, %7725) : (i64, i64) -> i64
      %7727 = func.call @cc_values_pack(%7726) : (i64) -> i64
      func.call @stack_push_pointer(%7724) : (i64) -> ()
      %7728 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%7728) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7729 = func.call @stack_pop_pointer() : () -> i64
      %7730 = func.call @stack_pop_pointer() : () -> i64
      %7731 = func.call @cc_cons(%7730, %7729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %7732 = arith.addi %7731, %__rlasp_stack_elide_zero_388 : i64
      %7733 = func.call @stack_pop_pointer() : () -> i64
      %7734 = func.call @cc_cons(%7733, %7732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7734) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7735 = func.call @stack_pop_pointer() : () -> i64
      %7736 = func.call @stack_pop_pointer() : () -> i64
      %7737 = func.call @cc_cons(%7736, %7735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
      %7738 = arith.addi %7737, %__rlasp_stack_elide_zero_389 : i64
      %7739 = func.call @stack_pop_pointer() : () -> i64
      %7740 = func.call @cc_cons(%7739, %7738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
      %7741 = arith.addi %7740, %__rlasp_stack_elide_zero_390 : i64
      %7742 = func.call @stack_pop_pointer() : () -> i64
      %7743 = func.call @cc_cons(%7742, %7741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7743) : (i64) -> ()
      %7744 = llvm.mlir.addressof @str705 : !llvm.ptr
      %7745 = arith.constant 3 : i64
      %7746 = func.call @cc_make_string(%7744, %7745) : (!llvm.ptr, i64) -> i64
      %7747 = func.call @cc_nil_value() : () -> i64
      %7748 = func.call @cc_intern(%7746, %7747) : (i64, i64) -> i64
      %7749 = func.call @cc_nil_value() : () -> i64
      %7750 = func.call @cc_cons(%7748, %7749) : (i64, i64) -> i64
      %7751 = func.call @cc_values_pack(%7750) : (i64) -> i64
      func.call @stack_push_pointer(%7748) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7752 = func.call @stack_pop_pointer() : () -> i64
      %7753 = func.call @stack_pop_pointer() : () -> i64
      %7754 = func.call @cc_cons(%7753, %7752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
      %7755 = arith.addi %7754, %__rlasp_stack_elide_zero_391 : i64
      %7756 = func.call @stack_pop_pointer() : () -> i64
      %7757 = func.call @cc_cons(%7756, %7755) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
      %7758 = arith.addi %7757, %__rlasp_stack_elide_zero_392 : i64
      %7759 = func.call @stack_pop_pointer() : () -> i64
      %7760 = func.call @cc_cons(%7759, %7758) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
      %7761 = arith.addi %7760, %__rlasp_stack_elide_zero_393 : i64
      %7762 = func.call @stack_pop_pointer() : () -> i64
      %7763 = func.call @cc_cons(%7762, %7761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7763) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7764 = func.call @stack_pop_pointer() : () -> i64
      %7765 = func.call @stack_pop_pointer() : () -> i64
      %7766 = func.call @cc_cons(%7765, %7764) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
      %7767 = arith.addi %7766, %__rlasp_stack_elide_zero_394 : i64
      %7768 = func.call @stack_pop_pointer() : () -> i64
      %7769 = func.call @cc_cons(%7768, %7767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %7770 = arith.addi %7769, %__rlasp_stack_elide_zero_395 : i64
      %7771 = func.call @stack_pop_pointer() : () -> i64
      %7772 = func.call @cc_cons(%7771, %7770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7773 = func.call @stack_pop_pointer() : () -> i64
      %7774 = func.call @stack_pop_pointer() : () -> i64
      %7775 = func.call @cc_cons(%7774, %7773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
      %7776 = arith.addi %7775, %__rlasp_stack_elide_zero_396 : i64
      %7777 = func.call @stack_pop_pointer() : () -> i64
      %7778 = func.call @cc_cons(%7777, %7776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7779 = func.call @stack_pop_pointer() : () -> i64
      %7780 = func.call @stack_pop_pointer() : () -> i64
      %7781 = func.call @cc_cons(%7780, %7779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
      %7782 = arith.addi %7781, %__rlasp_stack_elide_zero_397 : i64
      %7783 = func.call @stack_pop_pointer() : () -> i64
      %7784 = func.call @cc_cons(%7783, %7782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
      %7785 = arith.addi %7784, %__rlasp_stack_elide_zero_398 : i64
      %7946 = arith.constant 122791386939425 : i64
      %7947 = arith.constant 0 : i64
      %7948 = func.call @cc_make_closure(%7946, %7947) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
      %7949 = arith.addi %7948, %__rlasp_stack_elide_zero_399 : i64
      %7950 = llvm.mlir.addressof @str714 : !llvm.ptr
      %7951 = arith.constant 1 : i64
      %7952 = func.call @cc_make_string(%7950, %7951) : (!llvm.ptr, i64) -> i64
      %7953 = func.call @cc_nil_value() : () -> i64
      %7954 = func.call @cc_intern(%7952, %7953) : (i64, i64) -> i64
      %7955 = func.call @cc_nil_value() : () -> i64
      %7956 = func.call @cc_cons(%7954, %7955) : (i64, i64) -> i64
      %7957 = func.call @cc_values_pack(%7956) : (i64) -> i64
      func.call @stack_push_pointer(%7954) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7958 = func.call @stack_pop_pointer() : () -> i64
      %7959 = func.call @stack_pop_pointer() : () -> i64
      %7960 = func.call @cc_cons(%7959, %7958) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
      %7961 = arith.addi %7960, %__rlasp_stack_elide_zero_400 : i64
      %7962 = llvm.mlir.addressof @str715 : !llvm.ptr
      %7963 = arith.constant 11 : i64
      %7964 = func.call @cc_make_string(%7962, %7963) : (!llvm.ptr, i64) -> i64
      %7965 = llvm.mlir.addressof @str716 : !llvm.ptr
      %7966 = arith.constant 7 : i64
      %7967 = func.call @cc_make_string(%7965, %7966) : (!llvm.ptr, i64) -> i64
      %7968 = func.call @cc_intern(%7964, %7967) : (i64, i64) -> i64
      %7969 = func.call @cc_nil_value() : () -> i64
      %7970 = func.call @cc_cons(%7968, %7969) : (i64, i64) -> i64
      %7971 = func.call @cc_values_pack(%7970) : (i64) -> i64
      %7972 = func.call @cc_nil_value() : () -> i64
      %7973 = llvm.mlir.addressof @str717 : !llvm.ptr
      %7974 = arith.constant 4 : i64
      %7975 = func.call @cc_make_string(%7973, %7974) : (!llvm.ptr, i64) -> i64
      %7976 = llvm.mlir.addressof @str718 : !llvm.ptr
      %7977 = arith.constant 7 : i64
      %7978 = func.call @cc_make_string(%7976, %7977) : (!llvm.ptr, i64) -> i64
      %7979 = func.call @cc_intern(%7975, %7978) : (i64, i64) -> i64
      %7980 = func.call @cc_nil_value() : () -> i64
      %7981 = func.call @cc_cons(%7979, %7980) : (i64, i64) -> i64
      %7982 = func.call @cc_values_pack(%7981) : (i64) -> i64
      %7983 = llvm.mlir.addressof @str719 : !llvm.ptr
      %7984 = arith.constant 6 : i64
      %7985 = func.call @cc_make_string(%7983, %7984) : (!llvm.ptr, i64) -> i64
      %7986 = func.call @cc_nil_value() : () -> i64
      %7987 = func.call @cc_intern(%7985, %7986) : (i64, i64) -> i64
      %7988 = func.call @cc_nil_value() : () -> i64
      %7989 = func.call @cc_cons(%7987, %7988) : (i64, i64) -> i64
      %7990 = func.call @cc_values_pack(%7989) : (i64) -> i64
      %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
      %7991 = arith.addi %7987, %__rlasp_stack_elide_zero_401 : i64
      %7992 = func.call @cc_nil_value() : () -> i64
      %7993 = func.call @cc_errorp(%7489) : (i64) -> i64
      %7994 = arith.cmpi ne, %7993, %7992 : i64
      %7995 = arith.cmpi eq, %7992, %7992 : i64
      %7996 = arith.andi %7994, %7995 : i1
      %7997 = scf.if %7996 -> (i64) {
        scf.yield %7489 : i64
      } else {
        scf.yield %7992 : i64
      }
      %7998 = func.call @cc_errorp(%7785) : (i64) -> i64
      %7999 = arith.cmpi ne, %7998, %7992 : i64
      %8000 = arith.cmpi eq, %7997, %7992 : i64
      %8001 = arith.andi %7999, %8000 : i1
      %8002 = scf.if %8001 -> (i64) {
        scf.yield %7785 : i64
      } else {
        scf.yield %7997 : i64
      }
      %8003 = func.call @cc_errorp(%7949) : (i64) -> i64
      %8004 = arith.cmpi ne, %8003, %7992 : i64
      %8005 = arith.cmpi eq, %8002, %7992 : i64
      %8006 = arith.andi %8004, %8005 : i1
      %8007 = scf.if %8006 -> (i64) {
        scf.yield %7949 : i64
      } else {
        scf.yield %8002 : i64
      }
      %8008 = func.call @cc_errorp(%7961) : (i64) -> i64
      %8009 = arith.cmpi ne, %8008, %7992 : i64
      %8010 = arith.cmpi eq, %8007, %7992 : i64
      %8011 = arith.andi %8009, %8010 : i1
      %8012 = scf.if %8011 -> (i64) {
        scf.yield %7961 : i64
      } else {
        scf.yield %8007 : i64
      }
      %8013 = func.call @cc_errorp(%7968) : (i64) -> i64
      %8014 = arith.cmpi ne, %8013, %7992 : i64
      %8015 = arith.cmpi eq, %8012, %7992 : i64
      %8016 = arith.andi %8014, %8015 : i1
      %8017 = scf.if %8016 -> (i64) {
        scf.yield %7968 : i64
      } else {
        scf.yield %8012 : i64
      }
      %8018 = func.call @cc_errorp(%7972) : (i64) -> i64
      %8019 = arith.cmpi ne, %8018, %7992 : i64
      %8020 = arith.cmpi eq, %8017, %7992 : i64
      %8021 = arith.andi %8019, %8020 : i1
      %8022 = scf.if %8021 -> (i64) {
        scf.yield %7972 : i64
      } else {
        scf.yield %8017 : i64
      }
      %8023 = func.call @cc_errorp(%7979) : (i64) -> i64
      %8024 = arith.cmpi ne, %8023, %7992 : i64
      %8025 = arith.cmpi eq, %8022, %7992 : i64
      %8026 = arith.andi %8024, %8025 : i1
      %8027 = scf.if %8026 -> (i64) {
        scf.yield %7979 : i64
      } else {
        scf.yield %8022 : i64
      }
      %8028 = func.call @cc_errorp(%7991) : (i64) -> i64
      %8029 = arith.cmpi ne, %8028, %7992 : i64
      %8030 = arith.cmpi eq, %8027, %7992 : i64
      %8031 = arith.andi %8029, %8030 : i1
      %8032 = scf.if %8031 -> (i64) {
        scf.yield %7991 : i64
      } else {
        scf.yield %8027 : i64
      }
      %8033 = arith.cmpi ne, %8032, %7992 : i64
      scf.if %8033 {
        func.call @stack_push_pointer(%8032) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7489) : (i64) -> ()
        func.call @stack_push_pointer(%7785) : (i64) -> ()
        func.call @stack_push_pointer(%7949) : (i64) -> ()
        func.call @stack_push_pointer(%7961) : (i64) -> ()
        func.call @stack_push_pointer(%7968) : (i64) -> ()
        func.call @stack_push_pointer(%7972) : (i64) -> ()
        func.call @stack_push_pointer(%7979) : (i64) -> ()
        func.call @stack_push_pointer(%7991) : (i64) -> ()
        %8034 = llvm.mlir.addressof @str720 : !llvm.ptr
        %8035 = func.call @cc_make_function_ref_const(%8034) : (!llvm.ptr) -> i64
        %8036 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8035, %8036) : (i64, i64) -> ()
      }
      %8037 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8037 : i64
    }
    %8038 = func.call @cc_nil_value() : () -> i64
    %8039 = func.call @cc_errorp(%7480) : (i64) -> i64
    %8040 = arith.cmpi ne, %8039, %8038 : i64
    %8041 = scf.if %8040 -> (i64) {
      scf.yield %7480 : i64
    } else {
      %8042 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8043 = arith.constant 22 : i64
      %8044 = func.call @cc_make_string(%8042, %8043) : (!llvm.ptr, i64) -> i64
      %8045 = func.call @cc_nil_value() : () -> i64
      %8046 = func.call @cc_intern(%8044, %8045) : (i64, i64) -> i64
      %8047 = func.call @cc_nil_value() : () -> i64
      %8048 = func.call @cc_cons(%8046, %8047) : (i64, i64) -> i64
      %8049 = func.call @cc_values_pack(%8048) : (i64) -> i64
      %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
      %8050 = arith.addi %8046, %__rlasp_stack_elide_zero_402 : i64
      %8051 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8052 = arith.constant 3 : i64
      %8053 = func.call @cc_make_string(%8051, %8052) : (!llvm.ptr, i64) -> i64
      %8054 = func.call @cc_nil_value() : () -> i64
      %8055 = func.call @cc_intern(%8053, %8054) : (i64, i64) -> i64
      %8056 = func.call @cc_nil_value() : () -> i64
      %8057 = func.call @cc_cons(%8055, %8056) : (i64, i64) -> i64
      %8058 = func.call @cc_values_pack(%8057) : (i64) -> i64
      func.call @stack_push_pointer(%8055) : (i64) -> ()
      %8059 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8060 = arith.constant 3 : i64
      %8061 = func.call @cc_make_string(%8059, %8060) : (!llvm.ptr, i64) -> i64
      %8062 = func.call @cc_nil_value() : () -> i64
      %8063 = func.call @cc_intern(%8061, %8062) : (i64, i64) -> i64
      %8064 = func.call @cc_nil_value() : () -> i64
      %8065 = func.call @cc_cons(%8063, %8064) : (i64, i64) -> i64
      %8066 = func.call @cc_values_pack(%8065) : (i64) -> i64
      func.call @stack_push_pointer(%8063) : (i64) -> ()
      %8067 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8068 = arith.constant 5 : i64
      %8069 = func.call @cc_make_string(%8067, %8068) : (!llvm.ptr, i64) -> i64
      %8070 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8071 = arith.constant 11 : i64
      %8072 = func.call @cc_make_string(%8070, %8071) : (!llvm.ptr, i64) -> i64
      %8073 = func.call @cc_intern(%8069, %8072) : (i64, i64) -> i64
      %8074 = func.call @cc_nil_value() : () -> i64
      %8075 = func.call @cc_cons(%8073, %8074) : (i64, i64) -> i64
      %8076 = func.call @cc_values_pack(%8075) : (i64) -> i64
      func.call @stack_push_pointer(%8073) : (i64) -> ()
      %8077 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8078 = arith.constant 7 : i64
      %8079 = func.call @cc_make_string(%8077, %8078) : (!llvm.ptr, i64) -> i64
      %8080 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8081 = arith.constant 11 : i64
      %8082 = func.call @cc_make_string(%8080, %8081) : (!llvm.ptr, i64) -> i64
      %8083 = func.call @cc_intern(%8079, %8082) : (i64, i64) -> i64
      %8084 = func.call @cc_nil_value() : () -> i64
      %8085 = func.call @cc_cons(%8083, %8084) : (i64, i64) -> i64
      %8086 = func.call @cc_values_pack(%8085) : (i64) -> i64
      func.call @stack_push_pointer(%8083) : (i64) -> ()
      %8087 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8088 = arith.constant 26 : i64
      %8089 = func.call @cc_make_string(%8087, %8088) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8090 = func.call @stack_pop_pointer() : () -> i64
      %8091 = func.call @stack_pop_pointer() : () -> i64
      %8092 = func.call @cc_cons(%8091, %8090) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
      %8093 = arith.addi %8092, %__rlasp_stack_elide_zero_403 : i64
      %8094 = func.call @stack_pop_pointer() : () -> i64
      %8095 = func.call @cc_cons(%8094, %8093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8095) : (i64) -> ()
      %8096 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8096) : (i64) -> ()
      %8097 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8098 = arith.constant 12 : i64
      %8099 = func.call @cc_make_string(%8097, %8098) : (!llvm.ptr, i64) -> i64
      %8100 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8101 = arith.constant 11 : i64
      %8102 = func.call @cc_make_string(%8100, %8101) : (!llvm.ptr, i64) -> i64
      %8103 = func.call @cc_intern(%8099, %8102) : (i64, i64) -> i64
      %8104 = func.call @cc_nil_value() : () -> i64
      %8105 = func.call @cc_cons(%8103, %8104) : (i64, i64) -> i64
      %8106 = func.call @cc_values_pack(%8105) : (i64) -> i64
      func.call @stack_push_pointer(%8103) : (i64) -> ()
      %8107 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8108 = arith.constant 9 : i64
      %8109 = func.call @cc_make_string(%8107, %8108) : (!llvm.ptr, i64) -> i64
      %8110 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8111 = arith.constant 11 : i64
      %8112 = func.call @cc_make_string(%8110, %8111) : (!llvm.ptr, i64) -> i64
      %8113 = func.call @cc_intern(%8109, %8112) : (i64, i64) -> i64
      %8114 = func.call @cc_nil_value() : () -> i64
      %8115 = func.call @cc_cons(%8113, %8114) : (i64, i64) -> i64
      %8116 = func.call @cc_values_pack(%8115) : (i64) -> i64
      func.call @stack_push_pointer(%8113) : (i64) -> ()
      %8117 = arith.constant 17 : i64
      func.call @stack_push_fixnum(%8117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8118 = func.call @stack_pop_pointer() : () -> i64
      %8119 = func.call @stack_pop_pointer() : () -> i64
      %8120 = func.call @cc_cons(%8119, %8118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8121 = func.call @stack_pop_pointer() : () -> i64
      %8122 = func.call @stack_pop_pointer() : () -> i64
      %8123 = func.call @cc_cons(%8122, %8121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
      %8124 = arith.addi %8123, %__rlasp_stack_elide_zero_404 : i64
      %8125 = func.call @stack_pop_pointer() : () -> i64
      %8126 = func.call @cc_cons(%8125, %8124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
      %8127 = arith.addi %8126, %__rlasp_stack_elide_zero_405 : i64
      %8128 = func.call @stack_pop_pointer() : () -> i64
      %8129 = func.call @cc_cons(%8128, %8127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
      %8130 = arith.addi %8129, %__rlasp_stack_elide_zero_406 : i64
      %8131 = func.call @stack_pop_pointer() : () -> i64
      %8132 = func.call @cc_cons(%8130, %8131) : (i64, i64) -> i64
      %8133 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8134 = arith.constant 5 : i64
      %8135 = func.call @cc_make_string(%8133, %8134) : (!llvm.ptr, i64) -> i64
      %8136 = func.call @cc_nil_value() : () -> i64
      %8137 = func.call @cc_intern(%8135, %8136) : (i64, i64) -> i64
      %8138 = func.call @cc_nil_value() : () -> i64
      %8139 = func.call @cc_cons(%8137, %8138) : (i64, i64) -> i64
      %8140 = func.call @cc_values_pack(%8139) : (i64) -> i64
      %8141 = func.call @cc_cons(%8137, %8132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8142 = func.call @stack_pop_pointer() : () -> i64
      %8143 = func.call @stack_pop_pointer() : () -> i64
      %8144 = func.call @cc_cons(%8143, %8142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
      %8145 = arith.addi %8144, %__rlasp_stack_elide_zero_407 : i64
      %8146 = func.call @stack_pop_pointer() : () -> i64
      %8147 = func.call @cc_cons(%8146, %8145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
      %8148 = arith.addi %8147, %__rlasp_stack_elide_zero_408 : i64
      %8149 = func.call @stack_pop_pointer() : () -> i64
      %8150 = func.call @cc_cons(%8149, %8148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8151 = func.call @stack_pop_pointer() : () -> i64
      %8152 = func.call @stack_pop_pointer() : () -> i64
      %8153 = func.call @cc_cons(%8152, %8151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
      %8154 = arith.addi %8153, %__rlasp_stack_elide_zero_409 : i64
      %8155 = func.call @stack_pop_pointer() : () -> i64
      %8156 = func.call @cc_cons(%8155, %8154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8157 = func.call @stack_pop_pointer() : () -> i64
      %8158 = func.call @stack_pop_pointer() : () -> i64
      %8159 = func.call @cc_cons(%8158, %8157) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
      %8160 = arith.addi %8159, %__rlasp_stack_elide_zero_410 : i64
      %8161 = func.call @stack_pop_pointer() : () -> i64
      %8162 = func.call @cc_cons(%8161, %8160) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
      %8163 = arith.addi %8162, %__rlasp_stack_elide_zero_411 : i64
      %8219 = arith.constant 122791386939426 : i64
      %8220 = arith.constant 0 : i64
      %8221 = func.call @cc_make_closure(%8219, %8220) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
      %8222 = arith.addi %8221, %__rlasp_stack_elide_zero_412 : i64
      %8223 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8224 = arith.constant 1 : i64
      %8225 = func.call @cc_make_string(%8223, %8224) : (!llvm.ptr, i64) -> i64
      %8226 = func.call @cc_nil_value() : () -> i64
      %8227 = func.call @cc_intern(%8225, %8226) : (i64, i64) -> i64
      %8228 = func.call @cc_nil_value() : () -> i64
      %8229 = func.call @cc_cons(%8227, %8228) : (i64, i64) -> i64
      %8230 = func.call @cc_values_pack(%8229) : (i64) -> i64
      func.call @stack_push_pointer(%8227) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8231 = func.call @stack_pop_pointer() : () -> i64
      %8232 = func.call @stack_pop_pointer() : () -> i64
      %8233 = func.call @cc_cons(%8232, %8231) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
      %8234 = arith.addi %8233, %__rlasp_stack_elide_zero_413 : i64
      %8235 = llvm.mlir.addressof @str740 : !llvm.ptr
      %8236 = arith.constant 11 : i64
      %8237 = func.call @cc_make_string(%8235, %8236) : (!llvm.ptr, i64) -> i64
      %8238 = llvm.mlir.addressof @str741 : !llvm.ptr
      %8239 = arith.constant 7 : i64
      %8240 = func.call @cc_make_string(%8238, %8239) : (!llvm.ptr, i64) -> i64
      %8241 = func.call @cc_intern(%8237, %8240) : (i64, i64) -> i64
      %8242 = func.call @cc_nil_value() : () -> i64
      %8243 = func.call @cc_cons(%8241, %8242) : (i64, i64) -> i64
      %8244 = func.call @cc_values_pack(%8243) : (i64) -> i64
      %8245 = func.call @cc_nil_value() : () -> i64
      %8246 = llvm.mlir.addressof @str742 : !llvm.ptr
      %8247 = arith.constant 4 : i64
      %8248 = func.call @cc_make_string(%8246, %8247) : (!llvm.ptr, i64) -> i64
      %8249 = llvm.mlir.addressof @str743 : !llvm.ptr
      %8250 = arith.constant 7 : i64
      %8251 = func.call @cc_make_string(%8249, %8250) : (!llvm.ptr, i64) -> i64
      %8252 = func.call @cc_intern(%8248, %8251) : (i64, i64) -> i64
      %8253 = func.call @cc_nil_value() : () -> i64
      %8254 = func.call @cc_cons(%8252, %8253) : (i64, i64) -> i64
      %8255 = func.call @cc_values_pack(%8254) : (i64) -> i64
      %8256 = llvm.mlir.addressof @str744 : !llvm.ptr
      %8257 = arith.constant 6 : i64
      %8258 = func.call @cc_make_string(%8256, %8257) : (!llvm.ptr, i64) -> i64
      %8259 = func.call @cc_nil_value() : () -> i64
      %8260 = func.call @cc_intern(%8258, %8259) : (i64, i64) -> i64
      %8261 = func.call @cc_nil_value() : () -> i64
      %8262 = func.call @cc_cons(%8260, %8261) : (i64, i64) -> i64
      %8263 = func.call @cc_values_pack(%8262) : (i64) -> i64
      %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
      %8264 = arith.addi %8260, %__rlasp_stack_elide_zero_414 : i64
      %8265 = func.call @cc_nil_value() : () -> i64
      %8266 = func.call @cc_errorp(%8050) : (i64) -> i64
      %8267 = arith.cmpi ne, %8266, %8265 : i64
      %8268 = arith.cmpi eq, %8265, %8265 : i64
      %8269 = arith.andi %8267, %8268 : i1
      %8270 = scf.if %8269 -> (i64) {
        scf.yield %8050 : i64
      } else {
        scf.yield %8265 : i64
      }
      %8271 = func.call @cc_errorp(%8163) : (i64) -> i64
      %8272 = arith.cmpi ne, %8271, %8265 : i64
      %8273 = arith.cmpi eq, %8270, %8265 : i64
      %8274 = arith.andi %8272, %8273 : i1
      %8275 = scf.if %8274 -> (i64) {
        scf.yield %8163 : i64
      } else {
        scf.yield %8270 : i64
      }
      %8276 = func.call @cc_errorp(%8222) : (i64) -> i64
      %8277 = arith.cmpi ne, %8276, %8265 : i64
      %8278 = arith.cmpi eq, %8275, %8265 : i64
      %8279 = arith.andi %8277, %8278 : i1
      %8280 = scf.if %8279 -> (i64) {
        scf.yield %8222 : i64
      } else {
        scf.yield %8275 : i64
      }
      %8281 = func.call @cc_errorp(%8234) : (i64) -> i64
      %8282 = arith.cmpi ne, %8281, %8265 : i64
      %8283 = arith.cmpi eq, %8280, %8265 : i64
      %8284 = arith.andi %8282, %8283 : i1
      %8285 = scf.if %8284 -> (i64) {
        scf.yield %8234 : i64
      } else {
        scf.yield %8280 : i64
      }
      %8286 = func.call @cc_errorp(%8241) : (i64) -> i64
      %8287 = arith.cmpi ne, %8286, %8265 : i64
      %8288 = arith.cmpi eq, %8285, %8265 : i64
      %8289 = arith.andi %8287, %8288 : i1
      %8290 = scf.if %8289 -> (i64) {
        scf.yield %8241 : i64
      } else {
        scf.yield %8285 : i64
      }
      %8291 = func.call @cc_errorp(%8245) : (i64) -> i64
      %8292 = arith.cmpi ne, %8291, %8265 : i64
      %8293 = arith.cmpi eq, %8290, %8265 : i64
      %8294 = arith.andi %8292, %8293 : i1
      %8295 = scf.if %8294 -> (i64) {
        scf.yield %8245 : i64
      } else {
        scf.yield %8290 : i64
      }
      %8296 = func.call @cc_errorp(%8252) : (i64) -> i64
      %8297 = arith.cmpi ne, %8296, %8265 : i64
      %8298 = arith.cmpi eq, %8295, %8265 : i64
      %8299 = arith.andi %8297, %8298 : i1
      %8300 = scf.if %8299 -> (i64) {
        scf.yield %8252 : i64
      } else {
        scf.yield %8295 : i64
      }
      %8301 = func.call @cc_errorp(%8264) : (i64) -> i64
      %8302 = arith.cmpi ne, %8301, %8265 : i64
      %8303 = arith.cmpi eq, %8300, %8265 : i64
      %8304 = arith.andi %8302, %8303 : i1
      %8305 = scf.if %8304 -> (i64) {
        scf.yield %8264 : i64
      } else {
        scf.yield %8300 : i64
      }
      %8306 = arith.cmpi ne, %8305, %8265 : i64
      scf.if %8306 {
        func.call @stack_push_pointer(%8305) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8050) : (i64) -> ()
        func.call @stack_push_pointer(%8163) : (i64) -> ()
        func.call @stack_push_pointer(%8222) : (i64) -> ()
        func.call @stack_push_pointer(%8234) : (i64) -> ()
        func.call @stack_push_pointer(%8241) : (i64) -> ()
        func.call @stack_push_pointer(%8245) : (i64) -> ()
        func.call @stack_push_pointer(%8252) : (i64) -> ()
        func.call @stack_push_pointer(%8264) : (i64) -> ()
        %8307 = llvm.mlir.addressof @str745 : !llvm.ptr
        %8308 = func.call @cc_make_function_ref_const(%8307) : (!llvm.ptr) -> i64
        %8309 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8308, %8309) : (i64, i64) -> ()
      }
      %8310 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8310 : i64
    }
    %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
    %8311 = arith.addi %8041, %__rlasp_stack_elide_zero_415 : i64
    %8312 = func.call @cc_multiple_value_list(%8311) : (i64) -> i64
    %8313 = llvm.mlir.addressof @str746 : !llvm.ptr
    %8314 = arith.constant 38 : i64
    %8315 = func.call @cc_make_string(%8313, %8314) : (!llvm.ptr, i64) -> i64
    %8316 = func.call @cc_nil_value() : () -> i64
    %8317 = func.call @cc_intern(%8315, %8316) : (i64, i64) -> i64
    %8318 = func.call @cc_nil_value() : () -> i64
    %8319 = func.call @cc_cons(%8317, %8318) : (i64, i64) -> i64
    %8320 = func.call @cc_values_pack(%8319) : (i64) -> i64
    %8321 = func.call @cc_symbol_value(%8317) : (i64) -> i64
    %8322 = llvm.mlir.addressof @str747 : !llvm.ptr
    %8323 = arith.constant 40 : i64
    %8324 = func.call @cc_make_string(%8322, %8323) : (!llvm.ptr, i64) -> i64
    %8325 = func.call @cc_nil_value() : () -> i64
    %8326 = func.call @cc_intern(%8324, %8325) : (i64, i64) -> i64
    %8327 = func.call @cc_nil_value() : () -> i64
    %8328 = func.call @cc_cons(%8326, %8327) : (i64, i64) -> i64
    %8329 = func.call @cc_values_pack(%8328) : (i64) -> i64
    %8330 = func.call @cc_symbol_value(%8326) : (i64) -> i64
    %8331 = func.call @cc_nil_value() : () -> i64
    %8332 = arith.cmpi ne, %8321, %8331 : i64
    %8333 = scf.if %8332 -> (i64) {
      scf.yield %8330 : i64
    } else {
      scf.yield %8312 : i64
    }
    %8334 = func.call @cc_values_pack(%8333) : (i64) -> i64
    func.call @stack_push_pointer(%8334) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939393"() {
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_errorp(%127) : (i64) -> i64
    %130 = arith.cmpi ne, %129, %128 : i64
    %131 = scf.if %130 -> (i64) {
      scf.yield %127 : i64
    } else {
      %132 = llvm.mlir.addressof @str12 : !llvm.ptr
      %133 = arith.constant 3 : i64
      %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
      %135 = func.call @cc_nil_value() : () -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_errorp(%135) : (i64) -> i64
      %138 = arith.cmpi ne, %137, %136 : i64
      %139 = scf.if %138 -> (i64) {
        scf.yield %135 : i64
      } else {
        %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
        %140 = arith.addi %134, %__rlasp_stack_elide_zero_416 : i64
        %141 = func.call @cc_reverse(%140) : (i64) -> i64
        %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
        %142 = arith.addi %141, %__rlasp_stack_elide_zero_417 : i64
        scf.yield %142 : i64
      }
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %143 = arith.addi %139, %__rlasp_stack_elide_zero_418 : i64
      scf.yield %143 : i64
    }
    func.call @stack_push_pointer(%131) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939394"() {
    %321 = func.call @cc_nil_value() : () -> i64
    %322 = func.call @cc_nil_value() : () -> i64
    %323 = func.call @cc_errorp(%321) : (i64) -> i64
    %324 = arith.cmpi ne, %323, %322 : i64
    %325 = scf.if %324 -> (i64) {
      scf.yield %321 : i64
    } else {
      %326 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_nil_value() : () -> i64
      %329 = func.call @cc_errorp(%327) : (i64) -> i64
      %330 = arith.cmpi ne, %329, %328 : i64
      %331 = scf.if %330 -> (i64) {
        scf.yield %327 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %332 = llvm.mlir.addressof @str29 : !llvm.ptr
        %333 = arith.constant 3 : i64
        %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%334) : (i64) -> ()
        %335 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%335) : (i64) -> ()
        %336 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%336) : (i64) -> ()
        %337 = func.call @stack_pop_pointer() : () -> i64
        %338 = func.call @stack_pop_pointer() : () -> i64
        %339 = func.call @stack_pop_pointer() : () -> i64
        %340 = func.call @cc_subseq(%339, %338, %337) : (i64, i64, i64) -> i64
        %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
        %341 = arith.addi %340, %__rlasp_stack_elide_zero_419 : i64
        %342 = func.call @cc_errorp(%341) : (i64) -> i64
        %343 = func.call @cc_nil_value() : () -> i64
        %344 = arith.cmpi ne, %342, %343 : i64
        scf.if %344 {
          func.call @stack_push_pointer(%341) : (i64) -> ()
        } else {
          %345 = func.call @cc_multiple_value_list(%341) : (i64) -> i64
          func.call @stack_push_pointer(%345) : (i64) -> ()
        }
        %346 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %347 = func.call @stack_pop_pointer() : () -> i64
        %348 = func.call @cc_nil_value() : () -> i64
        %349 = func.call @cc_maybe_error_from_multiple_value_list(%346) : (i64) -> i64
        %350 = func.call @cc_errorp(%349) : (i64) -> i64
        %351 = arith.cmpi ne, %350, %348 : i64
        %352 = arith.cmpi eq, %348, %348 : i64
        %353 = arith.andi %351, %352 : i1
        %354 = scf.if %353 -> (i64) {
          scf.yield %349 : i64
        } else {
          scf.yield %348 : i64
        }
        %355 = arith.cmpi ne, %354, %348 : i64
        scf.if %355 {
          func.call @stack_push_pointer(%354) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %356 = func.call @stack_pop_pointer() : () -> i64
          %357 = func.call @cc_cons(%347, %356) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
          %358 = arith.addi %357, %__rlasp_stack_elide_zero_420 : i64
          %359 = func.call @cc_cons(%346, %358) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
          %360 = arith.addi %359, %__rlasp_stack_elide_zero_421 : i64
          %361 = func.call @cc_values_pack(%360) : (i64) -> i64
          func.call @stack_push_pointer(%361) : (i64) -> ()
        }
        %362 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %362 : i64
      }
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %363 = arith.addi %331, %__rlasp_stack_elide_zero_422 : i64
      %364 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %365 = func.call @cc_errorp(%363) : (i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = arith.cmpi ne, %365, %366 : i64
      scf.if %367 {
        %368 = func.call @cc_condition_value(%363) : (i64) -> i64
        %369 = func.call @cc_values2(%366, %368) : (i64, i64) -> i64
        func.call @stack_push_pointer(%369) : (i64) -> ()
      } else {
        %370 = func.call @cc_multiple_value_list(%363) : (i64) -> i64
        %371 = func.call @cc_values_pack(%370) : (i64) -> i64
        func.call @stack_push_pointer(%371) : (i64) -> ()
      }
      %372 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %372 : i64
    }
    func.call @stack_push_pointer(%325) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939395"() {
    %567 = func.call @cc_nil_value() : () -> i64
    %568 = func.call @cc_nil_value() : () -> i64
    %569 = func.call @cc_errorp(%567) : (i64) -> i64
    %570 = arith.cmpi ne, %569, %568 : i64
    %571 = scf.if %570 -> (i64) {
      scf.yield %567 : i64
    } else {
      %572 = arith.constant 97 : i64
      %573 = func.call @cc_box_character(%572) : (i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      %574 = arith.constant 0 : i64
      %575 = func.call @cc_box_character(%574) : (i64) -> i64
      func.call @stack_push_pointer(%575) : (i64) -> ()
      %576 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%576) : (i64) -> ()
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = arith.constant 0 : i64
      %579 = func.call @cc_box_character(%578) : (i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %580 = arith.addi %579, %__rlasp_stack_elide_zero_423 : i64
      %581 = func.call @cc_make_string_repeat(%577, %580) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %582 = arith.addi %581, %__rlasp_stack_elide_zero_424 : i64
      func.call @stack_push_pointer(%582) : (i64) -> ()
      %583 = llvm.mlir.addressof @str47 : !llvm.ptr
      %584 = func.call @cc_make_function_ref_const(%583) : (!llvm.ptr) -> i64
      %585 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%584, %585) : (i64, i64) -> ()
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @stack_pop_pointer() : () -> i64
      %588 = func.call @stack_pop_pointer() : () -> i64
      %589 = func.call @cc_substitute(%588, %587, %586) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
      %590 = arith.addi %589, %__rlasp_stack_elide_zero_425 : i64
      scf.yield %590 : i64
    }
    func.call @stack_push_pointer(%571) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939396"() {
    %812 = func.call @cc_nil_value() : () -> i64
    %813 = func.call @cc_nil_value() : () -> i64
    %814 = func.call @cc_errorp(%812) : (i64) -> i64
    %815 = arith.cmpi ne, %814, %813 : i64
    %816 = scf.if %815 -> (i64) {
      scf.yield %812 : i64
    } else {
      %817 = arith.constant 88 : i64
      %818 = func.call @cc_box_character(%817) : (i64) -> i64
      func.call @stack_push_pointer(%818) : (i64) -> ()
      %819 = arith.constant 0 : i64
      %820 = func.call @cc_box_character(%819) : (i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %821 = func.call @cc_make_string_output_stream() : () -> i64
      %822 = arith.constant 0 : i64
      %823 = func.call @cc_box_character(%822) : (i64) -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_errorp(%823) : (i64) -> i64
      %826 = arith.cmpi ne, %825, %824 : i64
      %827 = arith.cmpi eq, %824, %824 : i64
      %828 = arith.andi %826, %827 : i1
      %829 = scf.if %828 -> (i64) {
        scf.yield %823 : i64
      } else {
        scf.yield %824 : i64
      }
      %830 = func.call @cc_errorp(%821) : (i64) -> i64
      %831 = arith.cmpi ne, %830, %824 : i64
      %832 = arith.cmpi eq, %829, %824 : i64
      %833 = arith.andi %831, %832 : i1
      %834 = scf.if %833 -> (i64) {
        scf.yield %821 : i64
      } else {
        scf.yield %829 : i64
      }
      %835 = arith.cmpi ne, %834, %824 : i64
      scf.if %835 {
        func.call @stack_push_pointer(%834) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%823) : (i64) -> ()
        func.call @stack_push_pointer(%821) : (i64) -> ()
        %836 = llvm.mlir.addressof @str69 : !llvm.ptr
        %837 = func.call @cc_make_function_ref_const(%836) : (!llvm.ptr) -> i64
        %838 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%837, %838) : (i64, i64) -> ()
      }
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @cc_nil_value() : () -> i64
      %841 = func.call @cc_errorp(%839) : (i64) -> i64
      %842 = arith.cmpi ne, %841, %840 : i64
      %843 = scf.if %842 -> (i64) {
        scf.yield %839 : i64
      } else {
        %844 = llvm.mlir.addressof @str70 : !llvm.ptr
        %845 = arith.constant 3 : i64
        %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
        %847 = func.call @cc_nil_value() : () -> i64
        %848 = func.call @cc_errorp(%846) : (i64) -> i64
        %849 = arith.cmpi ne, %848, %847 : i64
        %850 = arith.cmpi eq, %847, %847 : i64
        %851 = arith.andi %849, %850 : i1
        %852 = scf.if %851 -> (i64) {
          scf.yield %846 : i64
        } else {
          scf.yield %847 : i64
        }
        %853 = func.call @cc_errorp(%821) : (i64) -> i64
        %854 = arith.cmpi ne, %853, %847 : i64
        %855 = arith.cmpi eq, %852, %847 : i64
        %856 = arith.andi %854, %855 : i1
        %857 = scf.if %856 -> (i64) {
          scf.yield %821 : i64
        } else {
          scf.yield %852 : i64
        }
        %858 = arith.cmpi ne, %857, %847 : i64
        scf.if %858 {
          func.call @stack_push_pointer(%857) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%846) : (i64) -> ()
          func.call @stack_push_pointer(%821) : (i64) -> ()
          %859 = llvm.mlir.addressof @str71 : !llvm.ptr
          %860 = func.call @cc_make_function_ref_const(%859) : (!llvm.ptr) -> i64
          %861 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%860, %861) : (i64, i64) -> ()
        }
        %862 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %862 : i64
      }
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = func.call @cc_errorp(%843) : (i64) -> i64
      %865 = arith.cmpi ne, %864, %863 : i64
      %866 = scf.if %865 -> (i64) {
        scf.yield %843 : i64
      } else {
        %867 = func.call @cc_get_output_stream_string(%821) : (i64) -> i64
        scf.yield %867 : i64
      }
      %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
      %868 = arith.addi %866, %__rlasp_stack_elide_zero_426 : i64
      %869 = func.call @stack_pop_pointer() : () -> i64
      %870 = func.call @stack_pop_pointer() : () -> i64
      %871 = func.call @cc_substitute(%870, %869, %868) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
      %872 = arith.addi %871, %__rlasp_stack_elide_zero_427 : i64
      scf.yield %872 : i64
    }
    func.call @stack_push_pointer(%816) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939397"() {
    %1087 = func.call @cc_nil_value() : () -> i64
    %1088 = func.call @cc_nil_value() : () -> i64
    %1089 = func.call @cc_errorp(%1087) : (i64) -> i64
    %1090 = arith.cmpi ne, %1089, %1088 : i64
    %1091 = scf.if %1090 -> (i64) {
      scf.yield %1087 : i64
    } else {
      %1092 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1093 = arith.constant 6 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1096 = arith.constant 11 : i64
      %1097 = func.call @cc_make_string(%1095, %1096) : (!llvm.ptr, i64) -> i64
      %1098 = func.call @cc_intern(%1094, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_cons(%1098, %1099) : (i64, i64) -> i64
      %1101 = func.call @cc_values_pack(%1100) : (i64) -> i64
      %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
      %1102 = arith.addi %1098, %__rlasp_stack_elide_zero_428 : i64
      %1103 = func.call @cc_nil_value() : () -> i64
      %1104 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1105 = arith.constant 3 : i64
      %1106 = func.call @cc_make_string(%1104, %1105) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
      %1107 = arith.addi %1106, %__rlasp_stack_elide_zero_429 : i64
      %1108 = func.call @cc_cons(%1107, %1103) : (i64, i64) -> i64
      %1109 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1109) : (i64) -> ()
      %1110 = func.call @stack_pop_pointer() : () -> i64
      %1111 = arith.constant 0 : i64
      %1112 = func.call @cc_box_character(%1111) : (i64) -> i64
      %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
      %1113 = arith.addi %1112, %__rlasp_stack_elide_zero_430 : i64
      %1114 = func.call @cc_make_string_repeat(%1110, %1113) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
      %1115 = arith.addi %1114, %__rlasp_stack_elide_zero_431 : i64
      %1116 = func.call @cc_cons(%1115, %1108) : (i64, i64) -> i64
      %1117 = func.call @cc_concatenate(%1102, %1116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
      %1118 = arith.addi %1117, %__rlasp_stack_elide_zero_432 : i64
      %1119 = func.call @cc_nil_value() : () -> i64
      %1120 = func.call @cc_cons(%1118, %1119) : (i64, i64) -> i64
      %1121 = func.call @cc_not(%1120) : (i64) -> i64
      %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
      %1122 = arith.addi %1121, %__rlasp_stack_elide_zero_433 : i64
      %1123 = func.call @cc_nil_value() : () -> i64
      %1124 = func.call @cc_cons(%1122, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_not(%1124) : (i64) -> i64
      %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
      %1126 = arith.addi %1125, %__rlasp_stack_elide_zero_434 : i64
      scf.yield %1126 : i64
    }
    func.call @stack_push_pointer(%1091) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939398"() {
    %1400 = func.call @cc_nil_value() : () -> i64
    %1401 = func.call @cc_nil_value() : () -> i64
    %1402 = func.call @cc_errorp(%1400) : (i64) -> i64
    %1403 = arith.cmpi ne, %1402, %1401 : i64
    %1404 = scf.if %1403 -> (i64) {
      scf.yield %1400 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1407 = arith.constant 9 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = arith.constant 0 : i64
      %1410 = func.call @cc_box_character(%1409) : (i64) -> i64
      %1411 = arith.constant 0 : i64
      %1412 = func.call @cc_box_character(%1411) : (i64) -> i64
      %1413 = arith.constant 0 : i64
      %1414 = func.call @cc_box_character(%1413) : (i64) -> i64
      func.call @stack_push_pointer(%1405) : (i64) -> ()
      func.call @stack_push_pointer(%1408) : (i64) -> ()
      func.call @stack_push_pointer(%1410) : (i64) -> ()
      func.call @stack_push_pointer(%1412) : (i64) -> ()
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      %1415 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1416 = func.call @cc_make_function_ref_const(%1415) : (!llvm.ptr) -> i64
      %1417 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1416, %1417) : (i64, i64) -> ()
      %1418 = func.call @stack_pop_pointer() : () -> i64
      %1419 = func.call @stack_pop_pointer() : () -> i64
      %1420 = func.call @cc_cons(%1418, %1419) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1420) : (i64) -> ()
      %1421 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1422 = arith.constant 6 : i64
      %1423 = func.call @cc_make_string(%1421, %1422) : (!llvm.ptr, i64) -> i64
      %1424 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1425 = arith.constant 11 : i64
      %1426 = func.call @cc_make_string(%1424, %1425) : (!llvm.ptr, i64) -> i64
      %1427 = func.call @cc_intern(%1423, %1426) : (i64, i64) -> i64
      %1428 = func.call @cc_nil_value() : () -> i64
      %1429 = func.call @cc_cons(%1427, %1428) : (i64, i64) -> i64
      %1430 = func.call @cc_values_pack(%1429) : (i64) -> i64
      %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
      %1431 = arith.addi %1427, %__rlasp_stack_elide_zero_435 : i64
      %1432 = func.call @cc_nil_value() : () -> i64
      %1433 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1434 = arith.constant 3 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %1436 = arith.addi %1435, %__rlasp_stack_elide_zero_436 : i64
      %1437 = func.call @cc_cons(%1436, %1432) : (i64, i64) -> i64
      %1438 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1438) : (i64) -> ()
      %1439 = func.call @stack_pop_pointer() : () -> i64
      %1440 = arith.constant 0 : i64
      %1441 = func.call @cc_box_character(%1440) : (i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %1442 = arith.addi %1441, %__rlasp_stack_elide_zero_437 : i64
      %1443 = func.call @cc_make_string_repeat(%1439, %1442) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %1444 = arith.addi %1443, %__rlasp_stack_elide_zero_438 : i64
      %1445 = func.call @cc_cons(%1444, %1437) : (i64, i64) -> i64
      %1446 = func.call @cc_concatenate(%1431, %1445) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %1447 = arith.addi %1446, %__rlasp_stack_elide_zero_439 : i64
      %1448 = func.call @stack_pop_pointer() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %1450 = arith.addi %1449, %__rlasp_stack_elide_zero_440 : i64
      %1451 = func.call @cc_string_equal_full(%1450) : (i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %1452 = arith.addi %1451, %__rlasp_stack_elide_zero_441 : i64
      %1453 = func.call @cc_nil_value() : () -> i64
      %1454 = func.call @cc_cons(%1452, %1453) : (i64, i64) -> i64
      %1455 = func.call @cc_not(%1454) : (i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %1456 = arith.addi %1455, %__rlasp_stack_elide_zero_442 : i64
      %1457 = func.call @cc_nil_value() : () -> i64
      %1458 = func.call @cc_cons(%1456, %1457) : (i64, i64) -> i64
      %1459 = func.call @cc_not(%1458) : (i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %1460 = arith.addi %1459, %__rlasp_stack_elide_zero_443 : i64
      scf.yield %1460 : i64
    }
    func.call @stack_push_pointer(%1404) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939399"() {
    %1750 = func.call @cc_nil_value() : () -> i64
    %1751 = func.call @cc_nil_value() : () -> i64
    %1752 = func.call @cc_errorp(%1750) : (i64) -> i64
    %1753 = arith.cmpi ne, %1752, %1751 : i64
    %1754 = scf.if %1753 -> (i64) {
      scf.yield %1750 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1755 = func.call @cc_nil_value() : () -> i64
      %1756 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1757 = arith.constant 9 : i64
      %1758 = func.call @cc_make_string(%1756, %1757) : (!llvm.ptr, i64) -> i64
      %1759 = arith.constant 0 : i64
      %1760 = func.call @cc_box_character(%1759) : (i64) -> i64
      %1761 = arith.constant 0 : i64
      %1762 = func.call @cc_box_character(%1761) : (i64) -> i64
      %1763 = arith.constant 0 : i64
      %1764 = func.call @cc_box_character(%1763) : (i64) -> i64
      func.call @stack_push_pointer(%1755) : (i64) -> ()
      func.call @stack_push_pointer(%1758) : (i64) -> ()
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      func.call @stack_push_pointer(%1762) : (i64) -> ()
      func.call @stack_push_pointer(%1764) : (i64) -> ()
      %1765 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1766 = func.call @cc_make_function_ref_const(%1765) : (!llvm.ptr) -> i64
      %1767 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1766, %1767) : (i64, i64) -> ()
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @stack_pop_pointer() : () -> i64
      %1770 = func.call @cc_cons(%1768, %1769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1770) : (i64) -> ()
      %1771 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1772 = arith.constant 6 : i64
      %1773 = func.call @cc_make_string(%1771, %1772) : (!llvm.ptr, i64) -> i64
      %1774 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1775 = arith.constant 11 : i64
      %1776 = func.call @cc_make_string(%1774, %1775) : (!llvm.ptr, i64) -> i64
      %1777 = func.call @cc_intern(%1773, %1776) : (i64, i64) -> i64
      %1778 = func.call @cc_nil_value() : () -> i64
      %1779 = func.call @cc_cons(%1777, %1778) : (i64, i64) -> i64
      %1780 = func.call @cc_values_pack(%1779) : (i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %1781 = arith.addi %1777, %__rlasp_stack_elide_zero_444 : i64
      %1782 = func.call @cc_nil_value() : () -> i64
      %1783 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1784 = arith.constant 3 : i64
      %1785 = func.call @cc_make_string(%1783, %1784) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %1786 = arith.addi %1785, %__rlasp_stack_elide_zero_445 : i64
      %1787 = func.call @cc_cons(%1786, %1782) : (i64, i64) -> i64
      %1788 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1788) : (i64) -> ()
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = arith.constant 0 : i64
      %1791 = func.call @cc_box_character(%1790) : (i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %1792 = arith.addi %1791, %__rlasp_stack_elide_zero_446 : i64
      %1793 = func.call @cc_make_string_repeat(%1789, %1792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %1794 = arith.addi %1793, %__rlasp_stack_elide_zero_447 : i64
      %1795 = func.call @cc_cons(%1794, %1787) : (i64, i64) -> i64
      %1796 = func.call @cc_concatenate(%1781, %1795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %1797 = arith.addi %1796, %__rlasp_stack_elide_zero_448 : i64
      %1798 = func.call @cc_copy_seq(%1797) : (i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %1799 = arith.addi %1798, %__rlasp_stack_elide_zero_449 : i64
      %1800 = func.call @stack_pop_pointer() : () -> i64
      %1801 = func.call @cc_cons(%1799, %1800) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %1802 = arith.addi %1801, %__rlasp_stack_elide_zero_450 : i64
      %1803 = func.call @cc_string_equal_full(%1802) : (i64) -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %1804 = arith.addi %1803, %__rlasp_stack_elide_zero_451 : i64
      %1805 = func.call @cc_nil_value() : () -> i64
      %1806 = func.call @cc_cons(%1804, %1805) : (i64, i64) -> i64
      %1807 = func.call @cc_not(%1806) : (i64) -> i64
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %1808 = arith.addi %1807, %__rlasp_stack_elide_zero_452 : i64
      %1809 = func.call @cc_nil_value() : () -> i64
      %1810 = func.call @cc_cons(%1808, %1809) : (i64, i64) -> i64
      %1811 = func.call @cc_not(%1810) : (i64) -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %1812 = arith.addi %1811, %__rlasp_stack_elide_zero_453 : i64
      scf.yield %1812 : i64
    }
    func.call @stack_push_pointer(%1754) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939400"() {
    %2054 = func.call @cc_nil_value() : () -> i64
    %2055 = func.call @cc_nil_value() : () -> i64
    %2056 = func.call @cc_errorp(%2054) : (i64) -> i64
    %2057 = arith.cmpi ne, %2056, %2055 : i64
    %2058 = scf.if %2057 -> (i64) {
      scf.yield %2054 : i64
    } else {
      %2059 = arith.constant 88 : i64
      %2060 = func.call @cc_box_character(%2059) : (i64) -> i64
      func.call @stack_push_pointer(%2060) : (i64) -> ()
      %2061 = arith.constant 0 : i64
      %2062 = func.call @cc_box_character(%2061) : (i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2063 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2064 = arith.constant 6 : i64
      %2065 = func.call @cc_make_string(%2063, %2064) : (!llvm.ptr, i64) -> i64
      %2066 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2067 = arith.constant 11 : i64
      %2068 = func.call @cc_make_string(%2066, %2067) : (!llvm.ptr, i64) -> i64
      %2069 = func.call @cc_intern(%2065, %2068) : (i64, i64) -> i64
      %2070 = func.call @cc_nil_value() : () -> i64
      %2071 = func.call @cc_cons(%2069, %2070) : (i64, i64) -> i64
      %2072 = func.call @cc_values_pack(%2071) : (i64) -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %2073 = arith.addi %2069, %__rlasp_stack_elide_zero_454 : i64
      %2074 = func.call @cc_nil_value() : () -> i64
      %2075 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2076 = arith.constant 3 : i64
      %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %2078 = arith.addi %2077, %__rlasp_stack_elide_zero_455 : i64
      %2079 = func.call @cc_cons(%2078, %2074) : (i64, i64) -> i64
      %2080 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2080) : (i64) -> ()
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2082 = arith.constant 0 : i64
      %2083 = func.call @cc_box_character(%2082) : (i64) -> i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %2084 = arith.addi %2083, %__rlasp_stack_elide_zero_456 : i64
      %2085 = func.call @cc_make_string_repeat(%2081, %2084) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %2086 = arith.addi %2085, %__rlasp_stack_elide_zero_457 : i64
      %2087 = func.call @cc_cons(%2086, %2079) : (i64, i64) -> i64
      %2088 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2089 = arith.constant 1 : i64
      %2090 = func.call @cc_make_string(%2088, %2089) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %2091 = arith.addi %2090, %__rlasp_stack_elide_zero_458 : i64
      %2092 = func.call @cc_cons(%2091, %2087) : (i64, i64) -> i64
      %2093 = func.call @cc_concatenate(%2073, %2092) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2093) : (i64) -> ()
      %2094 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2094) : (i64) -> ()
      %2095 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
      %2096 = arith.addi %2095, %__rlasp_stack_elide_zero_459 : i64
      %2097 = func.call @stack_pop_pointer() : () -> i64
      %2098 = func.call @stack_pop_pointer() : () -> i64
      %2099 = func.call @cc_subseq(%2098, %2097, %2096) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %2100 = arith.addi %2099, %__rlasp_stack_elide_zero_460 : i64
      %2101 = func.call @stack_pop_pointer() : () -> i64
      %2102 = func.call @stack_pop_pointer() : () -> i64
      %2103 = func.call @cc_substitute(%2102, %2101, %2100) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %2104 = arith.addi %2103, %__rlasp_stack_elide_zero_461 : i64
      scf.yield %2104 : i64
    }
    func.call @stack_push_pointer(%2058) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939401"() {
    %2274 = func.call @cc_nil_value() : () -> i64
    %2275 = func.call @cc_nil_value() : () -> i64
    %2276 = func.call @cc_errorp(%2274) : (i64) -> i64
    %2277 = arith.cmpi ne, %2276, %2275 : i64
    %2278 = scf.if %2277 -> (i64) {
      scf.yield %2274 : i64
    } else {
      %2279 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2280 = func.call @cc_nil_value() : () -> i64
      %2281 = func.call @cc_nil_value() : () -> i64
      %2282 = func.call @cc_errorp(%2280) : (i64) -> i64
      %2283 = arith.cmpi ne, %2282, %2281 : i64
      %2284 = scf.if %2283 -> (i64) {
        scf.yield %2280 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2285 = llvm.mlir.addressof @str201 : !llvm.ptr
        %2286 = arith.constant 7 : i64
        %2287 = func.call @cc_make_string(%2285, %2286) : (!llvm.ptr, i64) -> i64
        %2288 = func.call @cc_nil_value() : () -> i64
        %2289 = func.call @cc_errorp(%2287) : (i64) -> i64
        %2290 = arith.cmpi ne, %2289, %2288 : i64
        %2291 = arith.cmpi eq, %2288, %2288 : i64
        %2292 = arith.andi %2290, %2291 : i1
        %2293 = scf.if %2292 -> (i64) {
          scf.yield %2287 : i64
        } else {
          scf.yield %2288 : i64
        }
        %2294 = arith.cmpi ne, %2293, %2288 : i64
        scf.if %2294 {
          func.call @stack_push_pointer(%2293) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2287) : (i64) -> ()
          %2295 = llvm.mlir.addressof @str202 : !llvm.ptr
          %2296 = func.call @cc_make_function_ref_const(%2295) : (!llvm.ptr) -> i64
          %2297 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2296, %2297) : (i64, i64) -> ()
        }
        %2298 = func.call @stack_pop_pointer() : () -> i64
        %2299 = func.call @cc_errorp(%2298) : (i64) -> i64
        %2300 = func.call @cc_nil_value() : () -> i64
        %2301 = arith.cmpi ne, %2299, %2300 : i64
        scf.if %2301 {
          func.call @stack_push_pointer(%2298) : (i64) -> ()
        } else {
          %2302 = func.call @cc_multiple_value_list(%2298) : (i64) -> i64
          func.call @stack_push_pointer(%2302) : (i64) -> ()
        }
        %2303 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2304 = func.call @stack_pop_pointer() : () -> i64
        %2305 = func.call @cc_nil_value() : () -> i64
        %2306 = func.call @cc_maybe_error_from_multiple_value_list(%2303) : (i64) -> i64
        %2307 = func.call @cc_errorp(%2306) : (i64) -> i64
        %2308 = arith.cmpi ne, %2307, %2305 : i64
        %2309 = arith.cmpi eq, %2305, %2305 : i64
        %2310 = arith.andi %2308, %2309 : i1
        %2311 = scf.if %2310 -> (i64) {
          scf.yield %2306 : i64
        } else {
          scf.yield %2305 : i64
        }
        %2312 = arith.cmpi ne, %2311, %2305 : i64
        scf.if %2312 {
          func.call @stack_push_pointer(%2311) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2313 = func.call @stack_pop_pointer() : () -> i64
          %2314 = func.call @cc_cons(%2304, %2313) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
          %2315 = arith.addi %2314, %__rlasp_stack_elide_zero_462 : i64
          %2316 = func.call @cc_cons(%2303, %2315) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
          %2317 = arith.addi %2316, %__rlasp_stack_elide_zero_463 : i64
          %2318 = func.call @cc_values_pack(%2317) : (i64) -> i64
          func.call @stack_push_pointer(%2318) : (i64) -> ()
        }
        %2319 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2319 : i64
      }
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %2320 = arith.addi %2284, %__rlasp_stack_elide_zero_464 : i64
      %2321 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2322 = func.call @cc_errorp(%2320) : (i64) -> i64
      %2323 = func.call @cc_nil_value() : () -> i64
      %2324 = arith.cmpi ne, %2322, %2323 : i64
      scf.if %2324 {
        %2325 = func.call @cc_condition_value(%2320) : (i64) -> i64
        %2326 = func.call @cc_values2(%2323, %2325) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2326) : (i64) -> ()
      } else {
        %2327 = func.call @cc_multiple_value_list(%2320) : (i64) -> i64
        %2328 = func.call @cc_values_pack(%2327) : (i64) -> i64
        func.call @stack_push_pointer(%2328) : (i64) -> ()
      }
      %2329 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2329 : i64
    }
    func.call @stack_push_pointer(%2278) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939402"() {
    %2468 = func.call @cc_nil_value() : () -> i64
    %2469 = func.call @cc_nil_value() : () -> i64
    %2470 = func.call @cc_errorp(%2468) : (i64) -> i64
    %2471 = arith.cmpi ne, %2470, %2469 : i64
    %2472 = scf.if %2471 -> (i64) {
      scf.yield %2468 : i64
    } else {
      %2473 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2474 = arith.constant 5 : i64
      %2475 = func.call @cc_make_string(%2473, %2474) : (!llvm.ptr, i64) -> i64
      %2476 = func.call @cc_nil_value() : () -> i64
      %2477 = func.call @cc_errorp(%2475) : (i64) -> i64
      %2478 = arith.cmpi ne, %2477, %2476 : i64
      %2479 = arith.cmpi eq, %2476, %2476 : i64
      %2480 = arith.andi %2478, %2479 : i1
      %2481 = scf.if %2480 -> (i64) {
        scf.yield %2475 : i64
      } else {
        scf.yield %2476 : i64
      }
      %2482 = arith.cmpi ne, %2481, %2476 : i64
      scf.if %2482 {
        func.call @stack_push_pointer(%2481) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2475) : (i64) -> ()
        %2483 = llvm.mlir.addressof @str217 : !llvm.ptr
        %2484 = func.call @cc_make_function_ref_const(%2483) : (!llvm.ptr) -> i64
        %2485 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2484, %2485) : (i64, i64) -> ()
      }
      %2486 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2486 : i64
    }
    func.call @stack_push_pointer(%2472) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939403"() {
    %2656 = func.call @cc_nil_value() : () -> i64
    %2657 = func.call @cc_nil_value() : () -> i64
    %2658 = func.call @cc_errorp(%2656) : (i64) -> i64
    %2659 = arith.cmpi ne, %2658, %2657 : i64
    %2660 = scf.if %2659 -> (i64) {
      scf.yield %2656 : i64
    } else {
      %2661 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2662 = func.call @cc_nil_value() : () -> i64
      %2663 = func.call @cc_nil_value() : () -> i64
      %2664 = func.call @cc_errorp(%2662) : (i64) -> i64
      %2665 = arith.cmpi ne, %2664, %2663 : i64
      %2666 = scf.if %2665 -> (i64) {
        scf.yield %2662 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2667 = llvm.mlir.addressof @str232 : !llvm.ptr
        %2668 = arith.constant 7 : i64
        %2669 = func.call @cc_make_string(%2667, %2668) : (!llvm.ptr, i64) -> i64
        %2670 = func.call @cc_nil_value() : () -> i64
        %2671 = func.call @cc_errorp(%2669) : (i64) -> i64
        %2672 = arith.cmpi ne, %2671, %2670 : i64
        %2673 = arith.cmpi eq, %2670, %2670 : i64
        %2674 = arith.andi %2672, %2673 : i1
        %2675 = scf.if %2674 -> (i64) {
          scf.yield %2669 : i64
        } else {
          scf.yield %2670 : i64
        }
        %2676 = arith.cmpi ne, %2675, %2670 : i64
        scf.if %2676 {
          func.call @stack_push_pointer(%2675) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2669) : (i64) -> ()
          %2677 = llvm.mlir.addressof @str233 : !llvm.ptr
          %2678 = func.call @cc_make_function_ref_const(%2677) : (!llvm.ptr) -> i64
          %2679 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2678, %2679) : (i64, i64) -> ()
        }
        %2680 = func.call @stack_pop_pointer() : () -> i64
        %2681 = func.call @cc_errorp(%2680) : (i64) -> i64
        %2682 = func.call @cc_nil_value() : () -> i64
        %2683 = arith.cmpi ne, %2681, %2682 : i64
        scf.if %2683 {
          func.call @stack_push_pointer(%2680) : (i64) -> ()
        } else {
          %2684 = func.call @cc_multiple_value_list(%2680) : (i64) -> i64
          func.call @stack_push_pointer(%2684) : (i64) -> ()
        }
        %2685 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2686 = func.call @stack_pop_pointer() : () -> i64
        %2687 = func.call @cc_nil_value() : () -> i64
        %2688 = func.call @cc_maybe_error_from_multiple_value_list(%2685) : (i64) -> i64
        %2689 = func.call @cc_errorp(%2688) : (i64) -> i64
        %2690 = arith.cmpi ne, %2689, %2687 : i64
        %2691 = arith.cmpi eq, %2687, %2687 : i64
        %2692 = arith.andi %2690, %2691 : i1
        %2693 = scf.if %2692 -> (i64) {
          scf.yield %2688 : i64
        } else {
          scf.yield %2687 : i64
        }
        %2694 = arith.cmpi ne, %2693, %2687 : i64
        scf.if %2694 {
          func.call @stack_push_pointer(%2693) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2695 = func.call @stack_pop_pointer() : () -> i64
          %2696 = func.call @cc_cons(%2686, %2695) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
          %2697 = arith.addi %2696, %__rlasp_stack_elide_zero_465 : i64
          %2698 = func.call @cc_cons(%2685, %2697) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
          %2699 = arith.addi %2698, %__rlasp_stack_elide_zero_466 : i64
          %2700 = func.call @cc_values_pack(%2699) : (i64) -> i64
          func.call @stack_push_pointer(%2700) : (i64) -> ()
        }
        %2701 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2701 : i64
      }
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %2702 = arith.addi %2666, %__rlasp_stack_elide_zero_467 : i64
      %2703 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2704 = func.call @cc_errorp(%2702) : (i64) -> i64
      %2705 = func.call @cc_nil_value() : () -> i64
      %2706 = arith.cmpi ne, %2704, %2705 : i64
      scf.if %2706 {
        %2707 = func.call @cc_condition_value(%2702) : (i64) -> i64
        %2708 = func.call @cc_values2(%2705, %2707) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2708) : (i64) -> ()
      } else {
        %2709 = func.call @cc_multiple_value_list(%2702) : (i64) -> i64
        %2710 = func.call @cc_values_pack(%2709) : (i64) -> i64
        func.call @stack_push_pointer(%2710) : (i64) -> ()
      }
      %2711 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2711 : i64
    }
    func.call @stack_push_pointer(%2660) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939404"() {
    %2850 = func.call @cc_nil_value() : () -> i64
    %2851 = func.call @cc_nil_value() : () -> i64
    %2852 = func.call @cc_errorp(%2850) : (i64) -> i64
    %2853 = arith.cmpi ne, %2852, %2851 : i64
    %2854 = scf.if %2853 -> (i64) {
      scf.yield %2850 : i64
    } else {
      %2855 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2856 = arith.constant 6 : i64
      %2857 = func.call @cc_make_string(%2855, %2856) : (!llvm.ptr, i64) -> i64
      %2858 = func.call @cc_nil_value() : () -> i64
      %2859 = func.call @cc_errorp(%2857) : (i64) -> i64
      %2860 = arith.cmpi ne, %2859, %2858 : i64
      %2861 = arith.cmpi eq, %2858, %2858 : i64
      %2862 = arith.andi %2860, %2861 : i1
      %2863 = scf.if %2862 -> (i64) {
        scf.yield %2857 : i64
      } else {
        scf.yield %2858 : i64
      }
      %2864 = arith.cmpi ne, %2863, %2858 : i64
      scf.if %2864 {
        func.call @stack_push_pointer(%2863) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2857) : (i64) -> ()
        %2865 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2866 = func.call @cc_make_function_ref_const(%2865) : (!llvm.ptr) -> i64
        %2867 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2866, %2867) : (i64, i64) -> ()
      }
      %2868 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2868 : i64
    }
    func.call @stack_push_pointer(%2854) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939405"() {
    %2991 = func.call @cc_nil_value() : () -> i64
    %2992 = func.call @cc_nil_value() : () -> i64
    %2993 = func.call @cc_errorp(%2991) : (i64) -> i64
    %2994 = arith.cmpi ne, %2993, %2992 : i64
    %2995 = scf.if %2994 -> (i64) {
      scf.yield %2991 : i64
    } else {
      %2996 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2997 = arith.constant 6 : i64
      %2998 = func.call @cc_make_string(%2996, %2997) : (!llvm.ptr, i64) -> i64
      %2999 = func.call @cc_nil_value() : () -> i64
      %3000 = func.call @cc_errorp(%2998) : (i64) -> i64
      %3001 = arith.cmpi ne, %3000, %2999 : i64
      %3002 = arith.cmpi eq, %2999, %2999 : i64
      %3003 = arith.andi %3001, %3002 : i1
      %3004 = scf.if %3003 -> (i64) {
        scf.yield %2998 : i64
      } else {
        scf.yield %2999 : i64
      }
      %3005 = arith.cmpi ne, %3004, %2999 : i64
      scf.if %3005 {
        func.call @stack_push_pointer(%3004) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2998) : (i64) -> ()
        %3006 = llvm.mlir.addressof @str260 : !llvm.ptr
        %3007 = func.call @cc_make_function_ref_const(%3006) : (!llvm.ptr) -> i64
        %3008 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3007, %3008) : (i64, i64) -> ()
      }
      %3009 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3009 : i64
    }
    func.call @stack_push_pointer(%2995) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939406"() {
    %3179 = func.call @cc_nil_value() : () -> i64
    %3180 = func.call @cc_nil_value() : () -> i64
    %3181 = func.call @cc_errorp(%3179) : (i64) -> i64
    %3182 = arith.cmpi ne, %3181, %3180 : i64
    %3183 = scf.if %3182 -> (i64) {
      scf.yield %3179 : i64
    } else {
      %3184 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3185 = func.call @cc_nil_value() : () -> i64
      %3186 = func.call @cc_nil_value() : () -> i64
      %3187 = func.call @cc_errorp(%3185) : (i64) -> i64
      %3188 = arith.cmpi ne, %3187, %3186 : i64
      %3189 = scf.if %3188 -> (i64) {
        scf.yield %3185 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3190 = llvm.mlir.addressof @str275 : !llvm.ptr
        %3191 = arith.constant 7 : i64
        %3192 = func.call @cc_make_string(%3190, %3191) : (!llvm.ptr, i64) -> i64
        %3193 = func.call @cc_nil_value() : () -> i64
        %3194 = func.call @cc_errorp(%3192) : (i64) -> i64
        %3195 = arith.cmpi ne, %3194, %3193 : i64
        %3196 = arith.cmpi eq, %3193, %3193 : i64
        %3197 = arith.andi %3195, %3196 : i1
        %3198 = scf.if %3197 -> (i64) {
          scf.yield %3192 : i64
        } else {
          scf.yield %3193 : i64
        }
        %3199 = arith.cmpi ne, %3198, %3193 : i64
        scf.if %3199 {
          func.call @stack_push_pointer(%3198) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3192) : (i64) -> ()
          %3200 = llvm.mlir.addressof @str276 : !llvm.ptr
          %3201 = func.call @cc_make_function_ref_const(%3200) : (!llvm.ptr) -> i64
          %3202 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3201, %3202) : (i64, i64) -> ()
        }
        %3203 = func.call @stack_pop_pointer() : () -> i64
        %3204 = func.call @cc_errorp(%3203) : (i64) -> i64
        %3205 = func.call @cc_nil_value() : () -> i64
        %3206 = arith.cmpi ne, %3204, %3205 : i64
        scf.if %3206 {
          func.call @stack_push_pointer(%3203) : (i64) -> ()
        } else {
          %3207 = func.call @cc_multiple_value_list(%3203) : (i64) -> i64
          func.call @stack_push_pointer(%3207) : (i64) -> ()
        }
        %3208 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3209 = func.call @stack_pop_pointer() : () -> i64
        %3210 = func.call @cc_nil_value() : () -> i64
        %3211 = func.call @cc_maybe_error_from_multiple_value_list(%3208) : (i64) -> i64
        %3212 = func.call @cc_errorp(%3211) : (i64) -> i64
        %3213 = arith.cmpi ne, %3212, %3210 : i64
        %3214 = arith.cmpi eq, %3210, %3210 : i64
        %3215 = arith.andi %3213, %3214 : i1
        %3216 = scf.if %3215 -> (i64) {
          scf.yield %3211 : i64
        } else {
          scf.yield %3210 : i64
        }
        %3217 = arith.cmpi ne, %3216, %3210 : i64
        scf.if %3217 {
          func.call @stack_push_pointer(%3216) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3218 = func.call @stack_pop_pointer() : () -> i64
          %3219 = func.call @cc_cons(%3209, %3218) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
          %3220 = arith.addi %3219, %__rlasp_stack_elide_zero_468 : i64
          %3221 = func.call @cc_cons(%3208, %3220) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
          %3222 = arith.addi %3221, %__rlasp_stack_elide_zero_469 : i64
          %3223 = func.call @cc_values_pack(%3222) : (i64) -> i64
          func.call @stack_push_pointer(%3223) : (i64) -> ()
        }
        %3224 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3224 : i64
      }
      %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
      %3225 = arith.addi %3189, %__rlasp_stack_elide_zero_470 : i64
      %3226 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3227 = func.call @cc_errorp(%3225) : (i64) -> i64
      %3228 = func.call @cc_nil_value() : () -> i64
      %3229 = arith.cmpi ne, %3227, %3228 : i64
      scf.if %3229 {
        %3230 = func.call @cc_condition_value(%3225) : (i64) -> i64
        %3231 = func.call @cc_values2(%3228, %3230) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3231) : (i64) -> ()
      } else {
        %3232 = func.call @cc_multiple_value_list(%3225) : (i64) -> i64
        %3233 = func.call @cc_values_pack(%3232) : (i64) -> i64
        func.call @stack_push_pointer(%3233) : (i64) -> ()
      }
      %3234 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3234 : i64
    }
    func.call @stack_push_pointer(%3183) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939407"() {
    %3390 = func.call @cc_nil_value() : () -> i64
    %3391 = func.call @cc_nil_value() : () -> i64
    %3392 = func.call @cc_errorp(%3390) : (i64) -> i64
    %3393 = arith.cmpi ne, %3392, %3391 : i64
    %3394 = scf.if %3393 -> (i64) {
      scf.yield %3390 : i64
    } else {
      %3395 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3396 = arith.constant 5 : i64
      %3397 = func.call @cc_make_string(%3395, %3396) : (!llvm.ptr, i64) -> i64
      %3398 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3399 = arith.constant 12 : i64
      %3400 = func.call @cc_make_string(%3398, %3399) : (!llvm.ptr, i64) -> i64
      %3401 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3402 = arith.constant 7 : i64
      %3403 = func.call @cc_make_string(%3401, %3402) : (!llvm.ptr, i64) -> i64
      %3404 = func.call @cc_intern(%3400, %3403) : (i64, i64) -> i64
      %3405 = func.call @cc_nil_value() : () -> i64
      %3406 = func.call @cc_cons(%3404, %3405) : (i64, i64) -> i64
      %3407 = func.call @cc_values_pack(%3406) : (i64) -> i64
      %3408 = func.call @cc_t_value() : () -> i64
      %3409 = func.call @cc_nil_value() : () -> i64
      %3410 = func.call @cc_errorp(%3397) : (i64) -> i64
      %3411 = arith.cmpi ne, %3410, %3409 : i64
      %3412 = arith.cmpi eq, %3409, %3409 : i64
      %3413 = arith.andi %3411, %3412 : i1
      %3414 = scf.if %3413 -> (i64) {
        scf.yield %3397 : i64
      } else {
        scf.yield %3409 : i64
      }
      %3415 = func.call @cc_errorp(%3404) : (i64) -> i64
      %3416 = arith.cmpi ne, %3415, %3409 : i64
      %3417 = arith.cmpi eq, %3414, %3409 : i64
      %3418 = arith.andi %3416, %3417 : i1
      %3419 = scf.if %3418 -> (i64) {
        scf.yield %3404 : i64
      } else {
        scf.yield %3414 : i64
      }
      %3420 = func.call @cc_errorp(%3408) : (i64) -> i64
      %3421 = arith.cmpi ne, %3420, %3409 : i64
      %3422 = arith.cmpi eq, %3419, %3409 : i64
      %3423 = arith.andi %3421, %3422 : i1
      %3424 = scf.if %3423 -> (i64) {
        scf.yield %3408 : i64
      } else {
        scf.yield %3419 : i64
      }
      %3425 = arith.cmpi ne, %3424, %3409 : i64
      scf.if %3425 {
        func.call @stack_push_pointer(%3424) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3397) : (i64) -> ()
        func.call @stack_push_pointer(%3404) : (i64) -> ()
        func.call @stack_push_pointer(%3408) : (i64) -> ()
        %3426 = llvm.mlir.addressof @str295 : !llvm.ptr
        %3427 = func.call @cc_make_function_ref_const(%3426) : (!llvm.ptr) -> i64
        %3428 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%3427, %3428) : (i64, i64) -> ()
      }
      %3429 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3429 : i64
    }
    func.call @stack_push_pointer(%3394) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939408"() {
    %3599 = func.call @cc_nil_value() : () -> i64
    %3600 = func.call @cc_nil_value() : () -> i64
    %3601 = func.call @cc_errorp(%3599) : (i64) -> i64
    %3602 = arith.cmpi ne, %3601, %3600 : i64
    %3603 = scf.if %3602 -> (i64) {
      scf.yield %3599 : i64
    } else {
      %3604 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3605 = func.call @cc_nil_value() : () -> i64
      %3606 = func.call @cc_nil_value() : () -> i64
      %3607 = func.call @cc_errorp(%3605) : (i64) -> i64
      %3608 = arith.cmpi ne, %3607, %3606 : i64
      %3609 = scf.if %3608 -> (i64) {
        scf.yield %3605 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3610 = llvm.mlir.addressof @str310 : !llvm.ptr
        %3611 = arith.constant 1 : i64
        %3612 = func.call @cc_make_string(%3610, %3611) : (!llvm.ptr, i64) -> i64
        %3613 = func.call @cc_nil_value() : () -> i64
        %3614 = func.call @cc_errorp(%3612) : (i64) -> i64
        %3615 = arith.cmpi ne, %3614, %3613 : i64
        %3616 = arith.cmpi eq, %3613, %3613 : i64
        %3617 = arith.andi %3615, %3616 : i1
        %3618 = scf.if %3617 -> (i64) {
          scf.yield %3612 : i64
        } else {
          scf.yield %3613 : i64
        }
        %3619 = arith.cmpi ne, %3618, %3613 : i64
        scf.if %3619 {
          func.call @stack_push_pointer(%3618) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3612) : (i64) -> ()
          %3620 = llvm.mlir.addressof @str311 : !llvm.ptr
          %3621 = func.call @cc_make_function_ref_const(%3620) : (!llvm.ptr) -> i64
          %3622 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3621, %3622) : (i64, i64) -> ()
        }
        %3623 = func.call @stack_pop_pointer() : () -> i64
        %3624 = func.call @cc_errorp(%3623) : (i64) -> i64
        %3625 = func.call @cc_nil_value() : () -> i64
        %3626 = arith.cmpi ne, %3624, %3625 : i64
        scf.if %3626 {
          func.call @stack_push_pointer(%3623) : (i64) -> ()
        } else {
          %3627 = func.call @cc_multiple_value_list(%3623) : (i64) -> i64
          func.call @stack_push_pointer(%3627) : (i64) -> ()
        }
        %3628 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3629 = func.call @stack_pop_pointer() : () -> i64
        %3630 = func.call @cc_nil_value() : () -> i64
        %3631 = func.call @cc_maybe_error_from_multiple_value_list(%3628) : (i64) -> i64
        %3632 = func.call @cc_errorp(%3631) : (i64) -> i64
        %3633 = arith.cmpi ne, %3632, %3630 : i64
        %3634 = arith.cmpi eq, %3630, %3630 : i64
        %3635 = arith.andi %3633, %3634 : i1
        %3636 = scf.if %3635 -> (i64) {
          scf.yield %3631 : i64
        } else {
          scf.yield %3630 : i64
        }
        %3637 = arith.cmpi ne, %3636, %3630 : i64
        scf.if %3637 {
          func.call @stack_push_pointer(%3636) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3638 = func.call @stack_pop_pointer() : () -> i64
          %3639 = func.call @cc_cons(%3629, %3638) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
          %3640 = arith.addi %3639, %__rlasp_stack_elide_zero_471 : i64
          %3641 = func.call @cc_cons(%3628, %3640) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
          %3642 = arith.addi %3641, %__rlasp_stack_elide_zero_472 : i64
          %3643 = func.call @cc_values_pack(%3642) : (i64) -> i64
          func.call @stack_push_pointer(%3643) : (i64) -> ()
        }
        %3644 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3644 : i64
      }
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %3645 = arith.addi %3609, %__rlasp_stack_elide_zero_473 : i64
      %3646 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3647 = func.call @cc_errorp(%3645) : (i64) -> i64
      %3648 = func.call @cc_nil_value() : () -> i64
      %3649 = arith.cmpi ne, %3647, %3648 : i64
      scf.if %3649 {
        %3650 = func.call @cc_condition_value(%3645) : (i64) -> i64
        %3651 = func.call @cc_values2(%3648, %3650) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3651) : (i64) -> ()
      } else {
        %3652 = func.call @cc_multiple_value_list(%3645) : (i64) -> i64
        %3653 = func.call @cc_values_pack(%3652) : (i64) -> i64
        func.call @stack_push_pointer(%3653) : (i64) -> ()
      }
      %3654 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3654 : i64
    }
    func.call @stack_push_pointer(%3603) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939409"() {
    %3840 = func.call @cc_nil_value() : () -> i64
    %3841 = func.call @cc_nil_value() : () -> i64
    %3842 = func.call @cc_errorp(%3840) : (i64) -> i64
    %3843 = arith.cmpi ne, %3842, %3841 : i64
    %3844 = scf.if %3843 -> (i64) {
      scf.yield %3840 : i64
    } else {
      %3845 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3846 = func.call @cc_nil_value() : () -> i64
      %3847 = func.call @cc_nil_value() : () -> i64
      %3848 = func.call @cc_errorp(%3846) : (i64) -> i64
      %3849 = arith.cmpi ne, %3848, %3847 : i64
      %3850 = scf.if %3849 -> (i64) {
        scf.yield %3846 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3851 = llvm.mlir.addressof @str329 : !llvm.ptr
        %3852 = arith.constant 1 : i64
        %3853 = func.call @cc_make_string(%3851, %3852) : (!llvm.ptr, i64) -> i64
        %3854 = func.call @cc_nil_value() : () -> i64
        %3855 = func.call @cc_errorp(%3853) : (i64) -> i64
        %3856 = arith.cmpi ne, %3855, %3854 : i64
        %3857 = arith.cmpi eq, %3854, %3854 : i64
        %3858 = arith.andi %3856, %3857 : i1
        %3859 = scf.if %3858 -> (i64) {
          scf.yield %3853 : i64
        } else {
          scf.yield %3854 : i64
        }
        %3860 = arith.cmpi ne, %3859, %3854 : i64
        scf.if %3860 {
          func.call @stack_push_pointer(%3859) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3853) : (i64) -> ()
          %3861 = llvm.mlir.addressof @str330 : !llvm.ptr
          %3862 = func.call @cc_make_function_ref_const(%3861) : (!llvm.ptr) -> i64
          %3863 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3862, %3863) : (i64, i64) -> ()
        }
        %3864 = func.call @stack_pop_pointer() : () -> i64
        %3865 = func.call @cc_errorp(%3864) : (i64) -> i64
        %3866 = func.call @cc_nil_value() : () -> i64
        %3867 = arith.cmpi ne, %3865, %3866 : i64
        scf.if %3867 {
          func.call @stack_push_pointer(%3864) : (i64) -> ()
        } else {
          %3868 = func.call @cc_multiple_value_list(%3864) : (i64) -> i64
          func.call @stack_push_pointer(%3868) : (i64) -> ()
        }
        %3869 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3870 = func.call @stack_pop_pointer() : () -> i64
        %3871 = func.call @cc_nil_value() : () -> i64
        %3872 = func.call @cc_maybe_error_from_multiple_value_list(%3869) : (i64) -> i64
        %3873 = func.call @cc_errorp(%3872) : (i64) -> i64
        %3874 = arith.cmpi ne, %3873, %3871 : i64
        %3875 = arith.cmpi eq, %3871, %3871 : i64
        %3876 = arith.andi %3874, %3875 : i1
        %3877 = scf.if %3876 -> (i64) {
          scf.yield %3872 : i64
        } else {
          scf.yield %3871 : i64
        }
        %3878 = arith.cmpi ne, %3877, %3871 : i64
        scf.if %3878 {
          func.call @stack_push_pointer(%3877) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3879 = func.call @stack_pop_pointer() : () -> i64
          %3880 = func.call @cc_cons(%3870, %3879) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
          %3881 = arith.addi %3880, %__rlasp_stack_elide_zero_474 : i64
          %3882 = func.call @cc_cons(%3869, %3881) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
          %3883 = arith.addi %3882, %__rlasp_stack_elide_zero_475 : i64
          %3884 = func.call @cc_values_pack(%3883) : (i64) -> i64
          func.call @stack_push_pointer(%3884) : (i64) -> ()
        }
        %3885 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3885 : i64
      }
      %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
      %3886 = arith.addi %3850, %__rlasp_stack_elide_zero_476 : i64
      %3887 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3888 = func.call @cc_errorp(%3886) : (i64) -> i64
      %3889 = func.call @cc_nil_value() : () -> i64
      %3890 = arith.cmpi ne, %3888, %3889 : i64
      scf.if %3890 {
        %3891 = func.call @cc_condition_value(%3886) : (i64) -> i64
        %3892 = func.call @cc_values2(%3889, %3891) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3892) : (i64) -> ()
      } else {
        %3893 = func.call @cc_multiple_value_list(%3886) : (i64) -> i64
        %3894 = func.call @cc_values_pack(%3893) : (i64) -> i64
        func.call @stack_push_pointer(%3894) : (i64) -> ()
      }
      %3895 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3895 : i64
    }
    func.call @stack_push_pointer(%3844) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939410"() {
    %4081 = func.call @cc_nil_value() : () -> i64
    %4082 = func.call @cc_nil_value() : () -> i64
    %4083 = func.call @cc_errorp(%4081) : (i64) -> i64
    %4084 = arith.cmpi ne, %4083, %4082 : i64
    %4085 = scf.if %4084 -> (i64) {
      scf.yield %4081 : i64
    } else {
      %4086 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4087 = func.call @cc_nil_value() : () -> i64
      %4088 = func.call @cc_nil_value() : () -> i64
      %4089 = func.call @cc_errorp(%4087) : (i64) -> i64
      %4090 = arith.cmpi ne, %4089, %4088 : i64
      %4091 = scf.if %4090 -> (i64) {
        scf.yield %4087 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4092 = llvm.mlir.addressof @str348 : !llvm.ptr
        %4093 = arith.constant 0 : i64
        %4094 = func.call @cc_make_string(%4092, %4093) : (!llvm.ptr, i64) -> i64
        %4095 = func.call @cc_nil_value() : () -> i64
        %4096 = func.call @cc_errorp(%4094) : (i64) -> i64
        %4097 = arith.cmpi ne, %4096, %4095 : i64
        %4098 = arith.cmpi eq, %4095, %4095 : i64
        %4099 = arith.andi %4097, %4098 : i1
        %4100 = scf.if %4099 -> (i64) {
          scf.yield %4094 : i64
        } else {
          scf.yield %4095 : i64
        }
        %4101 = arith.cmpi ne, %4100, %4095 : i64
        scf.if %4101 {
          func.call @stack_push_pointer(%4100) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4094) : (i64) -> ()
          %4102 = llvm.mlir.addressof @str349 : !llvm.ptr
          %4103 = func.call @cc_make_function_ref_const(%4102) : (!llvm.ptr) -> i64
          %4104 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4103, %4104) : (i64, i64) -> ()
        }
        %4105 = func.call @stack_pop_pointer() : () -> i64
        %4106 = func.call @cc_errorp(%4105) : (i64) -> i64
        %4107 = func.call @cc_nil_value() : () -> i64
        %4108 = arith.cmpi ne, %4106, %4107 : i64
        scf.if %4108 {
          func.call @stack_push_pointer(%4105) : (i64) -> ()
        } else {
          %4109 = func.call @cc_multiple_value_list(%4105) : (i64) -> i64
          func.call @stack_push_pointer(%4109) : (i64) -> ()
        }
        %4110 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4111 = func.call @stack_pop_pointer() : () -> i64
        %4112 = func.call @cc_nil_value() : () -> i64
        %4113 = func.call @cc_maybe_error_from_multiple_value_list(%4110) : (i64) -> i64
        %4114 = func.call @cc_errorp(%4113) : (i64) -> i64
        %4115 = arith.cmpi ne, %4114, %4112 : i64
        %4116 = arith.cmpi eq, %4112, %4112 : i64
        %4117 = arith.andi %4115, %4116 : i1
        %4118 = scf.if %4117 -> (i64) {
          scf.yield %4113 : i64
        } else {
          scf.yield %4112 : i64
        }
        %4119 = arith.cmpi ne, %4118, %4112 : i64
        scf.if %4119 {
          func.call @stack_push_pointer(%4118) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4120 = func.call @stack_pop_pointer() : () -> i64
          %4121 = func.call @cc_cons(%4111, %4120) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
          %4122 = arith.addi %4121, %__rlasp_stack_elide_zero_477 : i64
          %4123 = func.call @cc_cons(%4110, %4122) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
          %4124 = arith.addi %4123, %__rlasp_stack_elide_zero_478 : i64
          %4125 = func.call @cc_values_pack(%4124) : (i64) -> i64
          func.call @stack_push_pointer(%4125) : (i64) -> ()
        }
        %4126 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4126 : i64
      }
      %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
      %4127 = arith.addi %4091, %__rlasp_stack_elide_zero_479 : i64
      %4128 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4129 = func.call @cc_errorp(%4127) : (i64) -> i64
      %4130 = func.call @cc_nil_value() : () -> i64
      %4131 = arith.cmpi ne, %4129, %4130 : i64
      scf.if %4131 {
        %4132 = func.call @cc_condition_value(%4127) : (i64) -> i64
        %4133 = func.call @cc_values2(%4130, %4132) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4133) : (i64) -> ()
      } else {
        %4134 = func.call @cc_multiple_value_list(%4127) : (i64) -> i64
        %4135 = func.call @cc_values_pack(%4134) : (i64) -> i64
        func.call @stack_push_pointer(%4135) : (i64) -> ()
      }
      %4136 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4136 : i64
    }
    func.call @stack_push_pointer(%4085) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939411"() {
    %4292 = func.call @cc_nil_value() : () -> i64
    %4293 = func.call @cc_nil_value() : () -> i64
    %4294 = func.call @cc_errorp(%4292) : (i64) -> i64
    %4295 = arith.cmpi ne, %4294, %4293 : i64
    %4296 = scf.if %4295 -> (i64) {
      scf.yield %4292 : i64
    } else {
      %4297 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4298 = arith.constant 1 : i64
      %4299 = func.call @cc_make_string(%4297, %4298) : (!llvm.ptr, i64) -> i64
      %4300 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4301 = arith.constant 12 : i64
      %4302 = func.call @cc_make_string(%4300, %4301) : (!llvm.ptr, i64) -> i64
      %4303 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4304 = arith.constant 7 : i64
      %4305 = func.call @cc_make_string(%4303, %4304) : (!llvm.ptr, i64) -> i64
      %4306 = func.call @cc_intern(%4302, %4305) : (i64, i64) -> i64
      %4307 = func.call @cc_nil_value() : () -> i64
      %4308 = func.call @cc_cons(%4306, %4307) : (i64, i64) -> i64
      %4309 = func.call @cc_values_pack(%4308) : (i64) -> i64
      %4310 = func.call @cc_t_value() : () -> i64
      %4311 = func.call @cc_nil_value() : () -> i64
      %4312 = func.call @cc_errorp(%4299) : (i64) -> i64
      %4313 = arith.cmpi ne, %4312, %4311 : i64
      %4314 = arith.cmpi eq, %4311, %4311 : i64
      %4315 = arith.andi %4313, %4314 : i1
      %4316 = scf.if %4315 -> (i64) {
        scf.yield %4299 : i64
      } else {
        scf.yield %4311 : i64
      }
      %4317 = func.call @cc_errorp(%4306) : (i64) -> i64
      %4318 = arith.cmpi ne, %4317, %4311 : i64
      %4319 = arith.cmpi eq, %4316, %4311 : i64
      %4320 = arith.andi %4318, %4319 : i1
      %4321 = scf.if %4320 -> (i64) {
        scf.yield %4306 : i64
      } else {
        scf.yield %4316 : i64
      }
      %4322 = func.call @cc_errorp(%4310) : (i64) -> i64
      %4323 = arith.cmpi ne, %4322, %4311 : i64
      %4324 = arith.cmpi eq, %4321, %4311 : i64
      %4325 = arith.andi %4323, %4324 : i1
      %4326 = scf.if %4325 -> (i64) {
        scf.yield %4310 : i64
      } else {
        scf.yield %4321 : i64
      }
      %4327 = arith.cmpi ne, %4326, %4311 : i64
      scf.if %4327 {
        func.call @stack_push_pointer(%4326) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4299) : (i64) -> ()
        func.call @stack_push_pointer(%4306) : (i64) -> ()
        func.call @stack_push_pointer(%4310) : (i64) -> ()
        %4328 = llvm.mlir.addressof @str368 : !llvm.ptr
        %4329 = func.call @cc_make_function_ref_const(%4328) : (!llvm.ptr) -> i64
        %4330 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4329, %4330) : (i64, i64) -> ()
      }
      %4331 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4331 : i64
    }
    func.call @stack_push_pointer(%4296) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939412"() {
    %4470 = func.call @cc_nil_value() : () -> i64
    %4471 = func.call @cc_nil_value() : () -> i64
    %4472 = func.call @cc_errorp(%4470) : (i64) -> i64
    %4473 = arith.cmpi ne, %4472, %4471 : i64
    %4474 = scf.if %4473 -> (i64) {
      scf.yield %4470 : i64
    } else {
      %4475 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4476 = arith.constant 1 : i64
      %4477 = func.call @cc_make_string(%4475, %4476) : (!llvm.ptr, i64) -> i64
      %4478 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4479 = arith.constant 12 : i64
      %4480 = func.call @cc_make_string(%4478, %4479) : (!llvm.ptr, i64) -> i64
      %4481 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4482 = arith.constant 7 : i64
      %4483 = func.call @cc_make_string(%4481, %4482) : (!llvm.ptr, i64) -> i64
      %4484 = func.call @cc_intern(%4480, %4483) : (i64, i64) -> i64
      %4485 = func.call @cc_nil_value() : () -> i64
      %4486 = func.call @cc_cons(%4484, %4485) : (i64, i64) -> i64
      %4487 = func.call @cc_values_pack(%4486) : (i64) -> i64
      %4488 = func.call @cc_t_value() : () -> i64
      %4489 = func.call @cc_nil_value() : () -> i64
      %4490 = func.call @cc_errorp(%4477) : (i64) -> i64
      %4491 = arith.cmpi ne, %4490, %4489 : i64
      %4492 = arith.cmpi eq, %4489, %4489 : i64
      %4493 = arith.andi %4491, %4492 : i1
      %4494 = scf.if %4493 -> (i64) {
        scf.yield %4477 : i64
      } else {
        scf.yield %4489 : i64
      }
      %4495 = func.call @cc_errorp(%4484) : (i64) -> i64
      %4496 = arith.cmpi ne, %4495, %4489 : i64
      %4497 = arith.cmpi eq, %4494, %4489 : i64
      %4498 = arith.andi %4496, %4497 : i1
      %4499 = scf.if %4498 -> (i64) {
        scf.yield %4484 : i64
      } else {
        scf.yield %4494 : i64
      }
      %4500 = func.call @cc_errorp(%4488) : (i64) -> i64
      %4501 = arith.cmpi ne, %4500, %4489 : i64
      %4502 = arith.cmpi eq, %4499, %4489 : i64
      %4503 = arith.andi %4501, %4502 : i1
      %4504 = scf.if %4503 -> (i64) {
        scf.yield %4488 : i64
      } else {
        scf.yield %4499 : i64
      }
      %4505 = arith.cmpi ne, %4504, %4489 : i64
      scf.if %4505 {
        func.call @stack_push_pointer(%4504) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4477) : (i64) -> ()
        func.call @stack_push_pointer(%4484) : (i64) -> ()
        func.call @stack_push_pointer(%4488) : (i64) -> ()
        %4506 = llvm.mlir.addressof @str384 : !llvm.ptr
        %4507 = func.call @cc_make_function_ref_const(%4506) : (!llvm.ptr) -> i64
        %4508 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4507, %4508) : (i64, i64) -> ()
      }
      %4509 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4509 : i64
    }
    func.call @stack_push_pointer(%4474) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939413"() {
    %4648 = func.call @cc_nil_value() : () -> i64
    %4649 = func.call @cc_nil_value() : () -> i64
    %4650 = func.call @cc_errorp(%4648) : (i64) -> i64
    %4651 = arith.cmpi ne, %4650, %4649 : i64
    %4652 = scf.if %4651 -> (i64) {
      scf.yield %4648 : i64
    } else {
      %4653 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4654 = arith.constant 0 : i64
      %4655 = func.call @cc_make_string(%4653, %4654) : (!llvm.ptr, i64) -> i64
      %4656 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4657 = arith.constant 12 : i64
      %4658 = func.call @cc_make_string(%4656, %4657) : (!llvm.ptr, i64) -> i64
      %4659 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4660 = arith.constant 7 : i64
      %4661 = func.call @cc_make_string(%4659, %4660) : (!llvm.ptr, i64) -> i64
      %4662 = func.call @cc_intern(%4658, %4661) : (i64, i64) -> i64
      %4663 = func.call @cc_nil_value() : () -> i64
      %4664 = func.call @cc_cons(%4662, %4663) : (i64, i64) -> i64
      %4665 = func.call @cc_values_pack(%4664) : (i64) -> i64
      %4666 = func.call @cc_t_value() : () -> i64
      %4667 = func.call @cc_nil_value() : () -> i64
      %4668 = func.call @cc_errorp(%4655) : (i64) -> i64
      %4669 = arith.cmpi ne, %4668, %4667 : i64
      %4670 = arith.cmpi eq, %4667, %4667 : i64
      %4671 = arith.andi %4669, %4670 : i1
      %4672 = scf.if %4671 -> (i64) {
        scf.yield %4655 : i64
      } else {
        scf.yield %4667 : i64
      }
      %4673 = func.call @cc_errorp(%4662) : (i64) -> i64
      %4674 = arith.cmpi ne, %4673, %4667 : i64
      %4675 = arith.cmpi eq, %4672, %4667 : i64
      %4676 = arith.andi %4674, %4675 : i1
      %4677 = scf.if %4676 -> (i64) {
        scf.yield %4662 : i64
      } else {
        scf.yield %4672 : i64
      }
      %4678 = func.call @cc_errorp(%4666) : (i64) -> i64
      %4679 = arith.cmpi ne, %4678, %4667 : i64
      %4680 = arith.cmpi eq, %4677, %4667 : i64
      %4681 = arith.andi %4679, %4680 : i1
      %4682 = scf.if %4681 -> (i64) {
        scf.yield %4666 : i64
      } else {
        scf.yield %4677 : i64
      }
      %4683 = arith.cmpi ne, %4682, %4667 : i64
      scf.if %4683 {
        func.call @stack_push_pointer(%4682) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4655) : (i64) -> ()
        func.call @stack_push_pointer(%4662) : (i64) -> ()
        func.call @stack_push_pointer(%4666) : (i64) -> ()
        %4684 = llvm.mlir.addressof @str400 : !llvm.ptr
        %4685 = func.call @cc_make_function_ref_const(%4684) : (!llvm.ptr) -> i64
        %4686 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4685, %4686) : (i64, i64) -> ()
      }
      %4687 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4687 : i64
    }
    func.call @stack_push_pointer(%4652) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939414"() {
    %5005 = func.call @cc_nil_value() : () -> i64
    %5006 = func.call @cc_nil_value() : () -> i64
    %5007 = func.call @cc_errorp(%5005) : (i64) -> i64
    %5008 = arith.cmpi ne, %5007, %5006 : i64
    %5009 = scf.if %5008 -> (i64) {
      scf.yield %5005 : i64
    } else {
      %5010 = func.call @cc_nil_value() : () -> i64
      %5011 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5012 = arith.constant 3 : i64
      %5013 = func.call @cc_make_string(%5011, %5012) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
      %5014 = arith.addi %5013, %__rlasp_stack_elide_zero_480 : i64
      %5015 = func.call @cc_type_of(%5014) : (i64) -> i64
      func.call @stack_push_pointer(%5015) : (i64) -> ()
      %5016 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5017 = arith.constant 12 : i64
      %5018 = func.call @cc_make_string(%5016, %5017) : (!llvm.ptr, i64) -> i64
      %5019 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5020 = arith.constant 11 : i64
      %5021 = func.call @cc_make_string(%5019, %5020) : (!llvm.ptr, i64) -> i64
      %5022 = func.call @cc_intern(%5018, %5021) : (i64, i64) -> i64
      %5023 = func.call @cc_nil_value() : () -> i64
      %5024 = func.call @cc_cons(%5022, %5023) : (i64, i64) -> i64
      %5025 = func.call @cc_values_pack(%5024) : (i64) -> i64
      func.call @stack_push_pointer(%5022) : (i64) -> ()
      %5026 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5027 = arith.constant 9 : i64
      %5028 = func.call @cc_make_string(%5026, %5027) : (!llvm.ptr, i64) -> i64
      %5029 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5030 = arith.constant 11 : i64
      %5031 = func.call @cc_make_string(%5029, %5030) : (!llvm.ptr, i64) -> i64
      %5032 = func.call @cc_intern(%5028, %5031) : (i64, i64) -> i64
      %5033 = func.call @cc_nil_value() : () -> i64
      %5034 = func.call @cc_cons(%5032, %5033) : (i64, i64) -> i64
      %5035 = func.call @cc_values_pack(%5034) : (i64) -> i64
      func.call @stack_push_pointer(%5032) : (i64) -> ()
      %5036 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5037 = func.call @stack_pop_pointer() : () -> i64
      %5038 = func.call @stack_pop_pointer() : () -> i64
      %5039 = func.call @cc_cons(%5038, %5037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5040 = func.call @stack_pop_pointer() : () -> i64
      %5041 = func.call @stack_pop_pointer() : () -> i64
      %5042 = func.call @cc_cons(%5041, %5040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
      %5043 = arith.addi %5042, %__rlasp_stack_elide_zero_481 : i64
      %5044 = func.call @stack_pop_pointer() : () -> i64
      %5045 = func.call @cc_cons(%5044, %5043) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
      %5046 = arith.addi %5045, %__rlasp_stack_elide_zero_482 : i64
      %5047 = func.call @stack_pop_pointer() : () -> i64
      %5048 = func.call @cc_cons(%5047, %5046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
      %5049 = arith.addi %5048, %__rlasp_stack_elide_zero_483 : i64
      %5050 = func.call @stack_pop_pointer() : () -> i64
      %5051 = func.call @cc_subtypep(%5050, %5049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
      %5052 = arith.addi %5051, %__rlasp_stack_elide_zero_484 : i64
      %5053 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5054 = arith.constant 3 : i64
      %5055 = func.call @cc_make_string(%5053, %5054) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
      %5056 = arith.addi %5055, %__rlasp_stack_elide_zero_485 : i64
      %5057 = func.call @cc_type_of(%5056) : (i64) -> i64
      func.call @stack_push_pointer(%5057) : (i64) -> ()
      %5058 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5059 = arith.constant 12 : i64
      %5060 = func.call @cc_make_string(%5058, %5059) : (!llvm.ptr, i64) -> i64
      %5061 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5062 = arith.constant 11 : i64
      %5063 = func.call @cc_make_string(%5061, %5062) : (!llvm.ptr, i64) -> i64
      %5064 = func.call @cc_intern(%5060, %5063) : (i64, i64) -> i64
      %5065 = func.call @cc_nil_value() : () -> i64
      %5066 = func.call @cc_cons(%5064, %5065) : (i64, i64) -> i64
      %5067 = func.call @cc_values_pack(%5066) : (i64) -> i64
      func.call @stack_push_pointer(%5064) : (i64) -> ()
      %5068 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5069 = arith.constant 9 : i64
      %5070 = func.call @cc_make_string(%5068, %5069) : (!llvm.ptr, i64) -> i64
      %5071 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5072 = arith.constant 11 : i64
      %5073 = func.call @cc_make_string(%5071, %5072) : (!llvm.ptr, i64) -> i64
      %5074 = func.call @cc_intern(%5070, %5073) : (i64, i64) -> i64
      %5075 = func.call @cc_nil_value() : () -> i64
      %5076 = func.call @cc_cons(%5074, %5075) : (i64, i64) -> i64
      %5077 = func.call @cc_values_pack(%5076) : (i64) -> i64
      func.call @stack_push_pointer(%5074) : (i64) -> ()
      %5078 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5079 = func.call @stack_pop_pointer() : () -> i64
      %5080 = func.call @stack_pop_pointer() : () -> i64
      %5081 = func.call @cc_cons(%5080, %5079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5082 = func.call @stack_pop_pointer() : () -> i64
      %5083 = func.call @stack_pop_pointer() : () -> i64
      %5084 = func.call @cc_cons(%5083, %5082) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
      %5085 = arith.addi %5084, %__rlasp_stack_elide_zero_486 : i64
      %5086 = func.call @stack_pop_pointer() : () -> i64
      %5087 = func.call @cc_cons(%5086, %5085) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
      %5088 = arith.addi %5087, %__rlasp_stack_elide_zero_487 : i64
      %5089 = func.call @stack_pop_pointer() : () -> i64
      %5090 = func.call @cc_cons(%5089, %5088) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
      %5091 = arith.addi %5090, %__rlasp_stack_elide_zero_488 : i64
      %5092 = func.call @stack_pop_pointer() : () -> i64
      %5093 = func.call @cc_subtypep(%5092, %5091) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
      %5094 = arith.addi %5093, %__rlasp_stack_elide_zero_489 : i64
      %5095 = func.call @cc_cons(%5094, %5010) : (i64, i64) -> i64
      %5096 = func.call @cc_cons(%5052, %5095) : (i64, i64) -> i64
      %5097 = func.call @cc_or(%5096) : (i64) -> i64
      %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
      %5098 = arith.addi %5097, %__rlasp_stack_elide_zero_490 : i64
      %5099 = func.call @cc_nil_value() : () -> i64
      %5100 = func.call @cc_cons(%5098, %5099) : (i64, i64) -> i64
      %5101 = func.call @cc_not(%5100) : (i64) -> i64
      %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
      %5102 = arith.addi %5101, %__rlasp_stack_elide_zero_491 : i64
      %5103 = func.call @cc_nil_value() : () -> i64
      %5104 = func.call @cc_cons(%5102, %5103) : (i64, i64) -> i64
      %5105 = func.call @cc_not(%5104) : (i64) -> i64
      %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
      %5106 = arith.addi %5105, %__rlasp_stack_elide_zero_492 : i64
      scf.yield %5106 : i64
    }
    func.call @stack_push_pointer(%5009) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939415"() {
    %5319 = func.call @cc_nil_value() : () -> i64
    %5320 = func.call @cc_nil_value() : () -> i64
    %5321 = func.call @cc_errorp(%5319) : (i64) -> i64
    %5322 = arith.cmpi ne, %5321, %5320 : i64
    %5323 = scf.if %5322 -> (i64) {
      scf.yield %5319 : i64
    } else {
      %5324 = arith.constant 3 : i64
      %5325 = func.call @cc_box_fixnum(%5324) : (i64) -> i64
      %5326 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5327 = arith.constant 12 : i64
      %5328 = func.call @cc_make_string(%5326, %5327) : (!llvm.ptr, i64) -> i64
      %5329 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5330 = arith.constant 7 : i64
      %5331 = func.call @cc_make_string(%5329, %5330) : (!llvm.ptr, i64) -> i64
      %5332 = func.call @cc_intern(%5328, %5331) : (i64, i64) -> i64
      %5333 = func.call @cc_nil_value() : () -> i64
      %5334 = func.call @cc_cons(%5332, %5333) : (i64, i64) -> i64
      %5335 = func.call @cc_values_pack(%5334) : (i64) -> i64
      %5336 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5337 = arith.constant 9 : i64
      %5338 = func.call @cc_make_string(%5336, %5337) : (!llvm.ptr, i64) -> i64
      %5339 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5340 = arith.constant 11 : i64
      %5341 = func.call @cc_make_string(%5339, %5340) : (!llvm.ptr, i64) -> i64
      %5342 = func.call @cc_intern(%5338, %5341) : (i64, i64) -> i64
      %5343 = func.call @cc_nil_value() : () -> i64
      %5344 = func.call @cc_cons(%5342, %5343) : (i64, i64) -> i64
      %5345 = func.call @cc_values_pack(%5344) : (i64) -> i64
      %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
      %5346 = arith.addi %5342, %__rlasp_stack_elide_zero_493 : i64
      %5347 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5348 = arith.constant 10 : i64
      %5349 = func.call @cc_make_string(%5347, %5348) : (!llvm.ptr, i64) -> i64
      %5350 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5351 = arith.constant 7 : i64
      %5352 = func.call @cc_make_string(%5350, %5351) : (!llvm.ptr, i64) -> i64
      %5353 = func.call @cc_intern(%5349, %5352) : (i64, i64) -> i64
      %5354 = func.call @cc_nil_value() : () -> i64
      %5355 = func.call @cc_cons(%5353, %5354) : (i64, i64) -> i64
      %5356 = func.call @cc_values_pack(%5355) : (i64) -> i64
      %5357 = func.call @cc_nil_value() : () -> i64
      %5358 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5359 = arith.constant 15 : i64
      %5360 = func.call @cc_make_string(%5358, %5359) : (!llvm.ptr, i64) -> i64
      %5361 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5362 = arith.constant 7 : i64
      %5363 = func.call @cc_make_string(%5361, %5362) : (!llvm.ptr, i64) -> i64
      %5364 = func.call @cc_intern(%5360, %5363) : (i64, i64) -> i64
      %5365 = func.call @cc_nil_value() : () -> i64
      %5366 = func.call @cc_cons(%5364, %5365) : (i64, i64) -> i64
      %5367 = func.call @cc_values_pack(%5366) : (i64) -> i64
      %5368 = arith.constant 67 : i64
      %5369 = func.call @cc_box_character(%5368) : (i64) -> i64
      %5370 = func.call @cc_nil_value() : () -> i64
      %5371 = func.call @cc_errorp(%5325) : (i64) -> i64
      %5372 = arith.cmpi ne, %5371, %5370 : i64
      %5373 = arith.cmpi eq, %5370, %5370 : i64
      %5374 = arith.andi %5372, %5373 : i1
      %5375 = scf.if %5374 -> (i64) {
        scf.yield %5325 : i64
      } else {
        scf.yield %5370 : i64
      }
      %5376 = func.call @cc_errorp(%5332) : (i64) -> i64
      %5377 = arith.cmpi ne, %5376, %5370 : i64
      %5378 = arith.cmpi eq, %5375, %5370 : i64
      %5379 = arith.andi %5377, %5378 : i1
      %5380 = scf.if %5379 -> (i64) {
        scf.yield %5332 : i64
      } else {
        scf.yield %5375 : i64
      }
      %5381 = func.call @cc_errorp(%5346) : (i64) -> i64
      %5382 = arith.cmpi ne, %5381, %5370 : i64
      %5383 = arith.cmpi eq, %5380, %5370 : i64
      %5384 = arith.andi %5382, %5383 : i1
      %5385 = scf.if %5384 -> (i64) {
        scf.yield %5346 : i64
      } else {
        scf.yield %5380 : i64
      }
      %5386 = func.call @cc_errorp(%5353) : (i64) -> i64
      %5387 = arith.cmpi ne, %5386, %5370 : i64
      %5388 = arith.cmpi eq, %5385, %5370 : i64
      %5389 = arith.andi %5387, %5388 : i1
      %5390 = scf.if %5389 -> (i64) {
        scf.yield %5353 : i64
      } else {
        scf.yield %5385 : i64
      }
      %5391 = func.call @cc_errorp(%5357) : (i64) -> i64
      %5392 = arith.cmpi ne, %5391, %5370 : i64
      %5393 = arith.cmpi eq, %5390, %5370 : i64
      %5394 = arith.andi %5392, %5393 : i1
      %5395 = scf.if %5394 -> (i64) {
        scf.yield %5357 : i64
      } else {
        scf.yield %5390 : i64
      }
      %5396 = func.call @cc_errorp(%5364) : (i64) -> i64
      %5397 = arith.cmpi ne, %5396, %5370 : i64
      %5398 = arith.cmpi eq, %5395, %5370 : i64
      %5399 = arith.andi %5397, %5398 : i1
      %5400 = scf.if %5399 -> (i64) {
        scf.yield %5364 : i64
      } else {
        scf.yield %5395 : i64
      }
      %5401 = func.call @cc_errorp(%5369) : (i64) -> i64
      %5402 = arith.cmpi ne, %5401, %5370 : i64
      %5403 = arith.cmpi eq, %5400, %5370 : i64
      %5404 = arith.andi %5402, %5403 : i1
      %5405 = scf.if %5404 -> (i64) {
        scf.yield %5369 : i64
      } else {
        scf.yield %5400 : i64
      }
      %5406 = arith.cmpi ne, %5405, %5370 : i64
      scf.if %5406 {
        func.call @stack_push_pointer(%5405) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5325) : (i64) -> ()
        func.call @stack_push_pointer(%5332) : (i64) -> ()
        func.call @stack_push_pointer(%5346) : (i64) -> ()
        func.call @stack_push_pointer(%5353) : (i64) -> ()
        func.call @stack_push_pointer(%5357) : (i64) -> ()
        func.call @stack_push_pointer(%5364) : (i64) -> ()
        func.call @stack_push_pointer(%5369) : (i64) -> ()
        %5407 = llvm.mlir.addressof @str471 : !llvm.ptr
        %5408 = func.call @cc_make_function_ref_const(%5407) : (!llvm.ptr) -> i64
        %5409 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%5408, %5409) : (i64, i64) -> ()
      }
      %5410 = func.call @stack_pop_pointer() : () -> i64
      %5411 = func.call @cc_nil_value() : () -> i64
      %5412 = func.call @cc_errorp(%5410) : (i64) -> i64
      %5413 = arith.cmpi ne, %5412, %5411 : i64
      %5414 = arith.cmpi eq, %5411, %5411 : i64
      %5415 = arith.andi %5413, %5414 : i1
      %5416 = scf.if %5415 -> (i64) {
        scf.yield %5410 : i64
      } else {
        scf.yield %5411 : i64
      }
      %5417 = arith.cmpi ne, %5416, %5411 : i64
      scf.if %5417 {
        func.call @stack_push_pointer(%5416) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5410) : (i64) -> ()
        %5418 = llvm.mlir.addressof @str472 : !llvm.ptr
        %5419 = func.call @cc_make_function_ref_const(%5418) : (!llvm.ptr) -> i64
        %5420 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5419, %5420) : (i64, i64) -> ()
      }
      %5421 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5421 : i64
    }
    func.call @stack_push_pointer(%5323) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939416"() {
    %5632 = func.call @cc_nil_value() : () -> i64
    %5633 = func.call @cc_nil_value() : () -> i64
    %5634 = func.call @cc_errorp(%5632) : (i64) -> i64
    %5635 = arith.cmpi ne, %5634, %5633 : i64
    %5636 = scf.if %5635 -> (i64) {
      scf.yield %5632 : i64
    } else {
      %5637 = arith.constant 3 : i64
      %5638 = func.call @cc_box_fixnum(%5637) : (i64) -> i64
      %5639 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5640 = arith.constant 12 : i64
      %5641 = func.call @cc_make_string(%5639, %5640) : (!llvm.ptr, i64) -> i64
      %5642 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5643 = arith.constant 7 : i64
      %5644 = func.call @cc_make_string(%5642, %5643) : (!llvm.ptr, i64) -> i64
      %5645 = func.call @cc_intern(%5641, %5644) : (i64, i64) -> i64
      %5646 = func.call @cc_nil_value() : () -> i64
      %5647 = func.call @cc_cons(%5645, %5646) : (i64, i64) -> i64
      %5648 = func.call @cc_values_pack(%5647) : (i64) -> i64
      %5649 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5650 = arith.constant 9 : i64
      %5651 = func.call @cc_make_string(%5649, %5650) : (!llvm.ptr, i64) -> i64
      %5652 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5653 = arith.constant 11 : i64
      %5654 = func.call @cc_make_string(%5652, %5653) : (!llvm.ptr, i64) -> i64
      %5655 = func.call @cc_intern(%5651, %5654) : (i64, i64) -> i64
      %5656 = func.call @cc_nil_value() : () -> i64
      %5657 = func.call @cc_cons(%5655, %5656) : (i64, i64) -> i64
      %5658 = func.call @cc_values_pack(%5657) : (i64) -> i64
      %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
      %5659 = arith.addi %5655, %__rlasp_stack_elide_zero_494 : i64
      %5660 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5661 = arith.constant 10 : i64
      %5662 = func.call @cc_make_string(%5660, %5661) : (!llvm.ptr, i64) -> i64
      %5663 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5664 = arith.constant 7 : i64
      %5665 = func.call @cc_make_string(%5663, %5664) : (!llvm.ptr, i64) -> i64
      %5666 = func.call @cc_intern(%5662, %5665) : (i64, i64) -> i64
      %5667 = func.call @cc_nil_value() : () -> i64
      %5668 = func.call @cc_cons(%5666, %5667) : (i64, i64) -> i64
      %5669 = func.call @cc_values_pack(%5668) : (i64) -> i64
      %5670 = func.call @cc_t_value() : () -> i64
      %5671 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5672 = arith.constant 15 : i64
      %5673 = func.call @cc_make_string(%5671, %5672) : (!llvm.ptr, i64) -> i64
      %5674 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5675 = arith.constant 7 : i64
      %5676 = func.call @cc_make_string(%5674, %5675) : (!llvm.ptr, i64) -> i64
      %5677 = func.call @cc_intern(%5673, %5676) : (i64, i64) -> i64
      %5678 = func.call @cc_nil_value() : () -> i64
      %5679 = func.call @cc_cons(%5677, %5678) : (i64, i64) -> i64
      %5680 = func.call @cc_values_pack(%5679) : (i64) -> i64
      %5681 = arith.constant 67 : i64
      %5682 = func.call @cc_box_character(%5681) : (i64) -> i64
      %5683 = func.call @cc_nil_value() : () -> i64
      %5684 = func.call @cc_errorp(%5638) : (i64) -> i64
      %5685 = arith.cmpi ne, %5684, %5683 : i64
      %5686 = arith.cmpi eq, %5683, %5683 : i64
      %5687 = arith.andi %5685, %5686 : i1
      %5688 = scf.if %5687 -> (i64) {
        scf.yield %5638 : i64
      } else {
        scf.yield %5683 : i64
      }
      %5689 = func.call @cc_errorp(%5645) : (i64) -> i64
      %5690 = arith.cmpi ne, %5689, %5683 : i64
      %5691 = arith.cmpi eq, %5688, %5683 : i64
      %5692 = arith.andi %5690, %5691 : i1
      %5693 = scf.if %5692 -> (i64) {
        scf.yield %5645 : i64
      } else {
        scf.yield %5688 : i64
      }
      %5694 = func.call @cc_errorp(%5659) : (i64) -> i64
      %5695 = arith.cmpi ne, %5694, %5683 : i64
      %5696 = arith.cmpi eq, %5693, %5683 : i64
      %5697 = arith.andi %5695, %5696 : i1
      %5698 = scf.if %5697 -> (i64) {
        scf.yield %5659 : i64
      } else {
        scf.yield %5693 : i64
      }
      %5699 = func.call @cc_errorp(%5666) : (i64) -> i64
      %5700 = arith.cmpi ne, %5699, %5683 : i64
      %5701 = arith.cmpi eq, %5698, %5683 : i64
      %5702 = arith.andi %5700, %5701 : i1
      %5703 = scf.if %5702 -> (i64) {
        scf.yield %5666 : i64
      } else {
        scf.yield %5698 : i64
      }
      %5704 = func.call @cc_errorp(%5670) : (i64) -> i64
      %5705 = arith.cmpi ne, %5704, %5683 : i64
      %5706 = arith.cmpi eq, %5703, %5683 : i64
      %5707 = arith.andi %5705, %5706 : i1
      %5708 = scf.if %5707 -> (i64) {
        scf.yield %5670 : i64
      } else {
        scf.yield %5703 : i64
      }
      %5709 = func.call @cc_errorp(%5677) : (i64) -> i64
      %5710 = arith.cmpi ne, %5709, %5683 : i64
      %5711 = arith.cmpi eq, %5708, %5683 : i64
      %5712 = arith.andi %5710, %5711 : i1
      %5713 = scf.if %5712 -> (i64) {
        scf.yield %5677 : i64
      } else {
        scf.yield %5708 : i64
      }
      %5714 = func.call @cc_errorp(%5682) : (i64) -> i64
      %5715 = arith.cmpi ne, %5714, %5683 : i64
      %5716 = arith.cmpi eq, %5713, %5683 : i64
      %5717 = arith.andi %5715, %5716 : i1
      %5718 = scf.if %5717 -> (i64) {
        scf.yield %5682 : i64
      } else {
        scf.yield %5713 : i64
      }
      %5719 = arith.cmpi ne, %5718, %5683 : i64
      scf.if %5719 {
        func.call @stack_push_pointer(%5718) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5638) : (i64) -> ()
        func.call @stack_push_pointer(%5645) : (i64) -> ()
        func.call @stack_push_pointer(%5659) : (i64) -> ()
        func.call @stack_push_pointer(%5666) : (i64) -> ()
        func.call @stack_push_pointer(%5670) : (i64) -> ()
        func.call @stack_push_pointer(%5677) : (i64) -> ()
        func.call @stack_push_pointer(%5682) : (i64) -> ()
        %5720 = llvm.mlir.addressof @str503 : !llvm.ptr
        %5721 = func.call @cc_make_function_ref_const(%5720) : (!llvm.ptr) -> i64
        %5722 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%5721, %5722) : (i64, i64) -> ()
      }
      %5723 = func.call @stack_pop_pointer() : () -> i64
      %5724 = func.call @cc_nil_value() : () -> i64
      %5725 = func.call @cc_errorp(%5723) : (i64) -> i64
      %5726 = arith.cmpi ne, %5725, %5724 : i64
      %5727 = arith.cmpi eq, %5724, %5724 : i64
      %5728 = arith.andi %5726, %5727 : i1
      %5729 = scf.if %5728 -> (i64) {
        scf.yield %5723 : i64
      } else {
        scf.yield %5724 : i64
      }
      %5730 = arith.cmpi ne, %5729, %5724 : i64
      scf.if %5730 {
        func.call @stack_push_pointer(%5729) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5723) : (i64) -> ()
        %5731 = llvm.mlir.addressof @str504 : !llvm.ptr
        %5732 = func.call @cc_make_function_ref_const(%5731) : (!llvm.ptr) -> i64
        %5733 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5732, %5733) : (i64, i64) -> ()
      }
      %5734 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5734 : i64
    }
    func.call @stack_push_pointer(%5636) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939417"() {
    %5944 = func.call @cc_nil_value() : () -> i64
    %5945 = func.call @cc_nil_value() : () -> i64
    %5946 = func.call @cc_errorp(%5944) : (i64) -> i64
    %5947 = arith.cmpi ne, %5946, %5945 : i64
    %5948 = scf.if %5947 -> (i64) {
      scf.yield %5944 : i64
    } else {
      %5949 = arith.constant 3 : i64
      %5950 = func.call @cc_box_fixnum(%5949) : (i64) -> i64
      %5951 = llvm.mlir.addressof @str527 : !llvm.ptr
      %5952 = arith.constant 12 : i64
      %5953 = func.call @cc_make_string(%5951, %5952) : (!llvm.ptr, i64) -> i64
      %5954 = llvm.mlir.addressof @str528 : !llvm.ptr
      %5955 = arith.constant 7 : i64
      %5956 = func.call @cc_make_string(%5954, %5955) : (!llvm.ptr, i64) -> i64
      %5957 = func.call @cc_intern(%5953, %5956) : (i64, i64) -> i64
      %5958 = func.call @cc_nil_value() : () -> i64
      %5959 = func.call @cc_cons(%5957, %5958) : (i64, i64) -> i64
      %5960 = func.call @cc_values_pack(%5959) : (i64) -> i64
      %5961 = llvm.mlir.addressof @str529 : !llvm.ptr
      %5962 = arith.constant 9 : i64
      %5963 = func.call @cc_make_string(%5961, %5962) : (!llvm.ptr, i64) -> i64
      %5964 = llvm.mlir.addressof @str530 : !llvm.ptr
      %5965 = arith.constant 11 : i64
      %5966 = func.call @cc_make_string(%5964, %5965) : (!llvm.ptr, i64) -> i64
      %5967 = func.call @cc_intern(%5963, %5966) : (i64, i64) -> i64
      %5968 = func.call @cc_nil_value() : () -> i64
      %5969 = func.call @cc_cons(%5967, %5968) : (i64, i64) -> i64
      %5970 = func.call @cc_values_pack(%5969) : (i64) -> i64
      %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
      %5971 = arith.addi %5967, %__rlasp_stack_elide_zero_495 : i64
      %5972 = llvm.mlir.addressof @str531 : !llvm.ptr
      %5973 = arith.constant 10 : i64
      %5974 = func.call @cc_make_string(%5972, %5973) : (!llvm.ptr, i64) -> i64
      %5975 = llvm.mlir.addressof @str532 : !llvm.ptr
      %5976 = arith.constant 7 : i64
      %5977 = func.call @cc_make_string(%5975, %5976) : (!llvm.ptr, i64) -> i64
      %5978 = func.call @cc_intern(%5974, %5977) : (i64, i64) -> i64
      %5979 = func.call @cc_nil_value() : () -> i64
      %5980 = func.call @cc_cons(%5978, %5979) : (i64, i64) -> i64
      %5981 = func.call @cc_values_pack(%5980) : (i64) -> i64
      %5982 = func.call @cc_nil_value() : () -> i64
      %5983 = llvm.mlir.addressof @str533 : !llvm.ptr
      %5984 = arith.constant 15 : i64
      %5985 = func.call @cc_make_string(%5983, %5984) : (!llvm.ptr, i64) -> i64
      %5986 = llvm.mlir.addressof @str534 : !llvm.ptr
      %5987 = arith.constant 7 : i64
      %5988 = func.call @cc_make_string(%5986, %5987) : (!llvm.ptr, i64) -> i64
      %5989 = func.call @cc_intern(%5985, %5988) : (i64, i64) -> i64
      %5990 = func.call @cc_nil_value() : () -> i64
      %5991 = func.call @cc_cons(%5989, %5990) : (i64, i64) -> i64
      %5992 = func.call @cc_values_pack(%5991) : (i64) -> i64
      %5993 = arith.constant 67 : i64
      %5994 = func.call @cc_box_character(%5993) : (i64) -> i64
      %5995 = func.call @cc_nil_value() : () -> i64
      %5996 = func.call @cc_errorp(%5950) : (i64) -> i64
      %5997 = arith.cmpi ne, %5996, %5995 : i64
      %5998 = arith.cmpi eq, %5995, %5995 : i64
      %5999 = arith.andi %5997, %5998 : i1
      %6000 = scf.if %5999 -> (i64) {
        scf.yield %5950 : i64
      } else {
        scf.yield %5995 : i64
      }
      %6001 = func.call @cc_errorp(%5957) : (i64) -> i64
      %6002 = arith.cmpi ne, %6001, %5995 : i64
      %6003 = arith.cmpi eq, %6000, %5995 : i64
      %6004 = arith.andi %6002, %6003 : i1
      %6005 = scf.if %6004 -> (i64) {
        scf.yield %5957 : i64
      } else {
        scf.yield %6000 : i64
      }
      %6006 = func.call @cc_errorp(%5971) : (i64) -> i64
      %6007 = arith.cmpi ne, %6006, %5995 : i64
      %6008 = arith.cmpi eq, %6005, %5995 : i64
      %6009 = arith.andi %6007, %6008 : i1
      %6010 = scf.if %6009 -> (i64) {
        scf.yield %5971 : i64
      } else {
        scf.yield %6005 : i64
      }
      %6011 = func.call @cc_errorp(%5978) : (i64) -> i64
      %6012 = arith.cmpi ne, %6011, %5995 : i64
      %6013 = arith.cmpi eq, %6010, %5995 : i64
      %6014 = arith.andi %6012, %6013 : i1
      %6015 = scf.if %6014 -> (i64) {
        scf.yield %5978 : i64
      } else {
        scf.yield %6010 : i64
      }
      %6016 = func.call @cc_errorp(%5982) : (i64) -> i64
      %6017 = arith.cmpi ne, %6016, %5995 : i64
      %6018 = arith.cmpi eq, %6015, %5995 : i64
      %6019 = arith.andi %6017, %6018 : i1
      %6020 = scf.if %6019 -> (i64) {
        scf.yield %5982 : i64
      } else {
        scf.yield %6015 : i64
      }
      %6021 = func.call @cc_errorp(%5989) : (i64) -> i64
      %6022 = arith.cmpi ne, %6021, %5995 : i64
      %6023 = arith.cmpi eq, %6020, %5995 : i64
      %6024 = arith.andi %6022, %6023 : i1
      %6025 = scf.if %6024 -> (i64) {
        scf.yield %5989 : i64
      } else {
        scf.yield %6020 : i64
      }
      %6026 = func.call @cc_errorp(%5994) : (i64) -> i64
      %6027 = arith.cmpi ne, %6026, %5995 : i64
      %6028 = arith.cmpi eq, %6025, %5995 : i64
      %6029 = arith.andi %6027, %6028 : i1
      %6030 = scf.if %6029 -> (i64) {
        scf.yield %5994 : i64
      } else {
        scf.yield %6025 : i64
      }
      %6031 = arith.cmpi ne, %6030, %5995 : i64
      scf.if %6031 {
        func.call @stack_push_pointer(%6030) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5950) : (i64) -> ()
        func.call @stack_push_pointer(%5957) : (i64) -> ()
        func.call @stack_push_pointer(%5971) : (i64) -> ()
        func.call @stack_push_pointer(%5978) : (i64) -> ()
        func.call @stack_push_pointer(%5982) : (i64) -> ()
        func.call @stack_push_pointer(%5989) : (i64) -> ()
        func.call @stack_push_pointer(%5994) : (i64) -> ()
        %6032 = llvm.mlir.addressof @str535 : !llvm.ptr
        %6033 = func.call @cc_make_function_ref_const(%6032) : (!llvm.ptr) -> i64
        %6034 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%6033, %6034) : (i64, i64) -> ()
      }
      %6035 = func.call @stack_pop_pointer() : () -> i64
      %6036 = func.call @cc_nil_value() : () -> i64
      %6037 = func.call @cc_errorp(%6035) : (i64) -> i64
      %6038 = arith.cmpi ne, %6037, %6036 : i64
      %6039 = arith.cmpi eq, %6036, %6036 : i64
      %6040 = arith.andi %6038, %6039 : i1
      %6041 = scf.if %6040 -> (i64) {
        scf.yield %6035 : i64
      } else {
        scf.yield %6036 : i64
      }
      %6042 = arith.cmpi ne, %6041, %6036 : i64
      scf.if %6042 {
        func.call @stack_push_pointer(%6041) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6035) : (i64) -> ()
        %6043 = llvm.mlir.addressof @str536 : !llvm.ptr
        %6044 = func.call @cc_make_function_ref_const(%6043) : (!llvm.ptr) -> i64
        %6045 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6044, %6045) : (i64, i64) -> ()
      }
      %6046 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6046 : i64
    }
    func.call @stack_push_pointer(%5948) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939418"() {
    %6257 = func.call @cc_nil_value() : () -> i64
    %6258 = func.call @cc_nil_value() : () -> i64
    %6259 = func.call @cc_errorp(%6257) : (i64) -> i64
    %6260 = arith.cmpi ne, %6259, %6258 : i64
    %6261 = scf.if %6260 -> (i64) {
      scf.yield %6257 : i64
    } else {
      %6262 = arith.constant 3 : i64
      %6263 = func.call @cc_box_fixnum(%6262) : (i64) -> i64
      %6264 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6265 = arith.constant 12 : i64
      %6266 = func.call @cc_make_string(%6264, %6265) : (!llvm.ptr, i64) -> i64
      %6267 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6268 = arith.constant 7 : i64
      %6269 = func.call @cc_make_string(%6267, %6268) : (!llvm.ptr, i64) -> i64
      %6270 = func.call @cc_intern(%6266, %6269) : (i64, i64) -> i64
      %6271 = func.call @cc_nil_value() : () -> i64
      %6272 = func.call @cc_cons(%6270, %6271) : (i64, i64) -> i64
      %6273 = func.call @cc_values_pack(%6272) : (i64) -> i64
      %6274 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6275 = arith.constant 9 : i64
      %6276 = func.call @cc_make_string(%6274, %6275) : (!llvm.ptr, i64) -> i64
      %6277 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6278 = arith.constant 11 : i64
      %6279 = func.call @cc_make_string(%6277, %6278) : (!llvm.ptr, i64) -> i64
      %6280 = func.call @cc_intern(%6276, %6279) : (i64, i64) -> i64
      %6281 = func.call @cc_nil_value() : () -> i64
      %6282 = func.call @cc_cons(%6280, %6281) : (i64, i64) -> i64
      %6283 = func.call @cc_values_pack(%6282) : (i64) -> i64
      %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
      %6284 = arith.addi %6280, %__rlasp_stack_elide_zero_496 : i64
      %6285 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6286 = arith.constant 10 : i64
      %6287 = func.call @cc_make_string(%6285, %6286) : (!llvm.ptr, i64) -> i64
      %6288 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6289 = arith.constant 7 : i64
      %6290 = func.call @cc_make_string(%6288, %6289) : (!llvm.ptr, i64) -> i64
      %6291 = func.call @cc_intern(%6287, %6290) : (i64, i64) -> i64
      %6292 = func.call @cc_nil_value() : () -> i64
      %6293 = func.call @cc_cons(%6291, %6292) : (i64, i64) -> i64
      %6294 = func.call @cc_values_pack(%6293) : (i64) -> i64
      %6295 = func.call @cc_t_value() : () -> i64
      %6296 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6297 = arith.constant 15 : i64
      %6298 = func.call @cc_make_string(%6296, %6297) : (!llvm.ptr, i64) -> i64
      %6299 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6300 = arith.constant 7 : i64
      %6301 = func.call @cc_make_string(%6299, %6300) : (!llvm.ptr, i64) -> i64
      %6302 = func.call @cc_intern(%6298, %6301) : (i64, i64) -> i64
      %6303 = func.call @cc_nil_value() : () -> i64
      %6304 = func.call @cc_cons(%6302, %6303) : (i64, i64) -> i64
      %6305 = func.call @cc_values_pack(%6304) : (i64) -> i64
      %6306 = arith.constant 67 : i64
      %6307 = func.call @cc_box_character(%6306) : (i64) -> i64
      %6308 = func.call @cc_nil_value() : () -> i64
      %6309 = func.call @cc_errorp(%6263) : (i64) -> i64
      %6310 = arith.cmpi ne, %6309, %6308 : i64
      %6311 = arith.cmpi eq, %6308, %6308 : i64
      %6312 = arith.andi %6310, %6311 : i1
      %6313 = scf.if %6312 -> (i64) {
        scf.yield %6263 : i64
      } else {
        scf.yield %6308 : i64
      }
      %6314 = func.call @cc_errorp(%6270) : (i64) -> i64
      %6315 = arith.cmpi ne, %6314, %6308 : i64
      %6316 = arith.cmpi eq, %6313, %6308 : i64
      %6317 = arith.andi %6315, %6316 : i1
      %6318 = scf.if %6317 -> (i64) {
        scf.yield %6270 : i64
      } else {
        scf.yield %6313 : i64
      }
      %6319 = func.call @cc_errorp(%6284) : (i64) -> i64
      %6320 = arith.cmpi ne, %6319, %6308 : i64
      %6321 = arith.cmpi eq, %6318, %6308 : i64
      %6322 = arith.andi %6320, %6321 : i1
      %6323 = scf.if %6322 -> (i64) {
        scf.yield %6284 : i64
      } else {
        scf.yield %6318 : i64
      }
      %6324 = func.call @cc_errorp(%6291) : (i64) -> i64
      %6325 = arith.cmpi ne, %6324, %6308 : i64
      %6326 = arith.cmpi eq, %6323, %6308 : i64
      %6327 = arith.andi %6325, %6326 : i1
      %6328 = scf.if %6327 -> (i64) {
        scf.yield %6291 : i64
      } else {
        scf.yield %6323 : i64
      }
      %6329 = func.call @cc_errorp(%6295) : (i64) -> i64
      %6330 = arith.cmpi ne, %6329, %6308 : i64
      %6331 = arith.cmpi eq, %6328, %6308 : i64
      %6332 = arith.andi %6330, %6331 : i1
      %6333 = scf.if %6332 -> (i64) {
        scf.yield %6295 : i64
      } else {
        scf.yield %6328 : i64
      }
      %6334 = func.call @cc_errorp(%6302) : (i64) -> i64
      %6335 = arith.cmpi ne, %6334, %6308 : i64
      %6336 = arith.cmpi eq, %6333, %6308 : i64
      %6337 = arith.andi %6335, %6336 : i1
      %6338 = scf.if %6337 -> (i64) {
        scf.yield %6302 : i64
      } else {
        scf.yield %6333 : i64
      }
      %6339 = func.call @cc_errorp(%6307) : (i64) -> i64
      %6340 = arith.cmpi ne, %6339, %6308 : i64
      %6341 = arith.cmpi eq, %6338, %6308 : i64
      %6342 = arith.andi %6340, %6341 : i1
      %6343 = scf.if %6342 -> (i64) {
        scf.yield %6307 : i64
      } else {
        scf.yield %6338 : i64
      }
      %6344 = arith.cmpi ne, %6343, %6308 : i64
      scf.if %6344 {
        func.call @stack_push_pointer(%6343) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6263) : (i64) -> ()
        func.call @stack_push_pointer(%6270) : (i64) -> ()
        func.call @stack_push_pointer(%6284) : (i64) -> ()
        func.call @stack_push_pointer(%6291) : (i64) -> ()
        func.call @stack_push_pointer(%6295) : (i64) -> ()
        func.call @stack_push_pointer(%6302) : (i64) -> ()
        func.call @stack_push_pointer(%6307) : (i64) -> ()
        %6345 = llvm.mlir.addressof @str567 : !llvm.ptr
        %6346 = func.call @cc_make_function_ref_const(%6345) : (!llvm.ptr) -> i64
        %6347 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%6346, %6347) : (i64, i64) -> ()
      }
      %6348 = func.call @stack_pop_pointer() : () -> i64
      %6349 = func.call @cc_nil_value() : () -> i64
      %6350 = func.call @cc_errorp(%6348) : (i64) -> i64
      %6351 = arith.cmpi ne, %6350, %6349 : i64
      %6352 = arith.cmpi eq, %6349, %6349 : i64
      %6353 = arith.andi %6351, %6352 : i1
      %6354 = scf.if %6353 -> (i64) {
        scf.yield %6348 : i64
      } else {
        scf.yield %6349 : i64
      }
      %6355 = arith.cmpi ne, %6354, %6349 : i64
      scf.if %6355 {
        func.call @stack_push_pointer(%6354) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6348) : (i64) -> ()
        %6356 = llvm.mlir.addressof @str568 : !llvm.ptr
        %6357 = func.call @cc_make_function_ref_const(%6356) : (!llvm.ptr) -> i64
        %6358 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6357, %6358) : (i64, i64) -> ()
      }
      %6359 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6359 : i64
    }
    func.call @stack_push_pointer(%6261) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939419"() {
    %6489 = func.call @cc_nil_value() : () -> i64
    %6490 = func.call @cc_nil_value() : () -> i64
    %6491 = func.call @cc_errorp(%6489) : (i64) -> i64
    %6492 = arith.cmpi ne, %6491, %6490 : i64
    %6493 = scf.if %6492 -> (i64) {
      scf.yield %6489 : i64
    } else {
      %6494 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6495 = arith.constant 3 : i64
      %6496 = func.call @cc_make_string(%6494, %6495) : (!llvm.ptr, i64) -> i64
      %6497 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6498 = arith.constant 7 : i64
      %6499 = func.call @cc_make_string(%6497, %6498) : (!llvm.ptr, i64) -> i64
      %6500 = func.call @cc_intern(%6496, %6499) : (i64, i64) -> i64
      %6501 = func.call @cc_nil_value() : () -> i64
      %6502 = func.call @cc_cons(%6500, %6501) : (i64, i64) -> i64
      %6503 = func.call @cc_values_pack(%6502) : (i64) -> i64
      %6504 = func.call @cc_nil_value() : () -> i64
      %6505 = func.call @cc_errorp(%6500) : (i64) -> i64
      %6506 = arith.cmpi ne, %6505, %6504 : i64
      %6507 = arith.cmpi eq, %6504, %6504 : i64
      %6508 = arith.andi %6506, %6507 : i1
      %6509 = scf.if %6508 -> (i64) {
        scf.yield %6500 : i64
      } else {
        scf.yield %6504 : i64
      }
      %6510 = arith.cmpi ne, %6509, %6504 : i64
      scf.if %6510 {
        func.call @stack_push_pointer(%6509) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6500) : (i64) -> ()
        %6511 = llvm.mlir.addressof @str584 : !llvm.ptr
        %6512 = func.call @cc_make_function_ref_const(%6511) : (!llvm.ptr) -> i64
        %6513 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6512, %6513) : (i64, i64) -> ()
      }
      %6514 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6514 : i64
    }
    func.call @stack_push_pointer(%6493) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939420"() {
    %6636 = func.call @cc_nil_value() : () -> i64
    %6637 = func.call @cc_nil_value() : () -> i64
    %6638 = func.call @cc_errorp(%6636) : (i64) -> i64
    %6639 = arith.cmpi ne, %6638, %6637 : i64
    %6640 = scf.if %6639 -> (i64) {
      scf.yield %6636 : i64
    } else {
      %6641 = arith.constant 67 : i64
      %6642 = func.call @cc_box_character(%6641) : (i64) -> i64
      %6643 = func.call @cc_nil_value() : () -> i64
      %6644 = func.call @cc_errorp(%6642) : (i64) -> i64
      %6645 = arith.cmpi ne, %6644, %6643 : i64
      %6646 = arith.cmpi eq, %6643, %6643 : i64
      %6647 = arith.andi %6645, %6646 : i1
      %6648 = scf.if %6647 -> (i64) {
        scf.yield %6642 : i64
      } else {
        scf.yield %6643 : i64
      }
      %6649 = arith.cmpi ne, %6648, %6643 : i64
      scf.if %6649 {
        func.call @stack_push_pointer(%6648) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6642) : (i64) -> ()
        %6650 = llvm.mlir.addressof @str596 : !llvm.ptr
        %6651 = func.call @cc_make_function_ref_const(%6650) : (!llvm.ptr) -> i64
        %6652 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6651, %6652) : (i64, i64) -> ()
      }
      %6653 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6653 : i64
    }
    func.call @stack_push_pointer(%6640) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939421"() {
    %6814 = func.call @cc_nil_value() : () -> i64
    %6815 = func.call @cc_nil_value() : () -> i64
    %6816 = func.call @cc_errorp(%6814) : (i64) -> i64
    %6817 = arith.cmpi ne, %6816, %6815 : i64
    %6818 = scf.if %6817 -> (i64) {
      scf.yield %6814 : i64
    } else {
      %6819 = llvm.mlir.addressof @str612 : !llvm.ptr
      %6820 = arith.constant 18 : i64
      %6821 = func.call @cc_make_string(%6819, %6820) : (!llvm.ptr, i64) -> i64
      %6822 = llvm.mlir.addressof @str613 : !llvm.ptr
      %6823 = arith.constant 11 : i64
      %6824 = func.call @cc_make_string(%6822, %6823) : (!llvm.ptr, i64) -> i64
      %6825 = func.call @cc_intern(%6821, %6824) : (i64, i64) -> i64
      %6826 = func.call @cc_nil_value() : () -> i64
      %6827 = func.call @cc_cons(%6825, %6826) : (i64, i64) -> i64
      %6828 = func.call @cc_values_pack(%6827) : (i64) -> i64
      %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
      %6829 = arith.addi %6825, %__rlasp_stack_elide_zero_497 : i64
      %6830 = arith.constant 0 : i64
      %6831 = func.call @cc_box_fixnum(%6830) : (i64) -> i64
      %6832 = func.call @cc_nil_value() : () -> i64
      %6833 = func.call @cc_errorp(%6829) : (i64) -> i64
      %6834 = arith.cmpi ne, %6833, %6832 : i64
      %6835 = arith.cmpi eq, %6832, %6832 : i64
      %6836 = arith.andi %6834, %6835 : i1
      %6837 = scf.if %6836 -> (i64) {
        scf.yield %6829 : i64
      } else {
        scf.yield %6832 : i64
      }
      %6838 = func.call @cc_errorp(%6831) : (i64) -> i64
      %6839 = arith.cmpi ne, %6838, %6832 : i64
      %6840 = arith.cmpi eq, %6837, %6832 : i64
      %6841 = arith.andi %6839, %6840 : i1
      %6842 = scf.if %6841 -> (i64) {
        scf.yield %6831 : i64
      } else {
        scf.yield %6837 : i64
      }
      %6843 = arith.cmpi ne, %6842, %6832 : i64
      scf.if %6843 {
        func.call @stack_push_pointer(%6842) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6829) : (i64) -> ()
        func.call @stack_push_pointer(%6831) : (i64) -> ()
        %6844 = llvm.mlir.addressof @str614 : !llvm.ptr
        %6845 = func.call @cc_make_function_ref_const(%6844) : (!llvm.ptr) -> i64
        %6846 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%6845, %6846) : (i64, i64) -> ()
      }
      %6847 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6848 = func.call @stack_pop_pointer() : () -> i64
      %6849 = func.call @cc_cons(%6847, %6848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
      %6850 = arith.addi %6849, %__rlasp_stack_elide_zero_498 : i64
      %6851 = func.call @cc_values_pack(%6850) : (i64) -> i64
      %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
      %6852 = arith.addi %6851, %__rlasp_stack_elide_zero_499 : i64
      scf.yield %6852 : i64
    }
    func.call @stack_push_pointer(%6818) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939422"() {
    %7034 = func.call @cc_nil_value() : () -> i64
    %7035 = func.call @cc_nil_value() : () -> i64
    %7036 = func.call @cc_errorp(%7034) : (i64) -> i64
    %7037 = arith.cmpi ne, %7036, %7035 : i64
    %7038 = scf.if %7037 -> (i64) {
      scf.yield %7034 : i64
    } else {
      %7039 = llvm.mlir.addressof @str632 : !llvm.ptr
      %7040 = arith.constant 13 : i64
      %7041 = func.call @cc_make_string(%7039, %7040) : (!llvm.ptr, i64) -> i64
      %7042 = llvm.mlir.addressof @str633 : !llvm.ptr
      %7043 = arith.constant 11 : i64
      %7044 = func.call @cc_make_string(%7042, %7043) : (!llvm.ptr, i64) -> i64
      %7045 = func.call @cc_intern(%7041, %7044) : (i64, i64) -> i64
      %7046 = func.call @cc_nil_value() : () -> i64
      %7047 = func.call @cc_cons(%7045, %7046) : (i64, i64) -> i64
      %7048 = func.call @cc_values_pack(%7047) : (i64) -> i64
      %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
      %7049 = arith.addi %7045, %__rlasp_stack_elide_zero_500 : i64
      %7050 = arith.constant 0 : i64
      %7051 = func.call @cc_box_fixnum(%7050) : (i64) -> i64
      %7052 = func.call @cc_nil_value() : () -> i64
      %7053 = func.call @cc_errorp(%7049) : (i64) -> i64
      %7054 = arith.cmpi ne, %7053, %7052 : i64
      %7055 = arith.cmpi eq, %7052, %7052 : i64
      %7056 = arith.andi %7054, %7055 : i1
      %7057 = scf.if %7056 -> (i64) {
        scf.yield %7049 : i64
      } else {
        scf.yield %7052 : i64
      }
      %7058 = func.call @cc_errorp(%7051) : (i64) -> i64
      %7059 = arith.cmpi ne, %7058, %7052 : i64
      %7060 = arith.cmpi eq, %7057, %7052 : i64
      %7061 = arith.andi %7059, %7060 : i1
      %7062 = scf.if %7061 -> (i64) {
        scf.yield %7051 : i64
      } else {
        scf.yield %7057 : i64
      }
      %7063 = arith.cmpi ne, %7062, %7052 : i64
      scf.if %7063 {
        func.call @stack_push_pointer(%7062) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7049) : (i64) -> ()
        func.call @stack_push_pointer(%7051) : (i64) -> ()
        %7064 = llvm.mlir.addressof @str634 : !llvm.ptr
        %7065 = func.call @cc_make_function_ref_const(%7064) : (!llvm.ptr) -> i64
        %7066 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%7065, %7066) : (i64, i64) -> ()
      }
      %7067 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7068 = func.call @stack_pop_pointer() : () -> i64
      %7069 = func.call @cc_cons(%7067, %7068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
      %7070 = arith.addi %7069, %__rlasp_stack_elide_zero_501 : i64
      %7071 = func.call @cc_values_pack(%7070) : (i64) -> i64
      %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
      %7072 = arith.addi %7071, %__rlasp_stack_elide_zero_502 : i64
      scf.yield %7072 : i64
    }
    func.call @stack_push_pointer(%7038) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939423"() {
    %7222 = func.call @cc_nil_value() : () -> i64
    %7223 = func.call @cc_nil_value() : () -> i64
    %7224 = func.call @cc_errorp(%7222) : (i64) -> i64
    %7225 = arith.cmpi ne, %7224, %7223 : i64
    %7226 = scf.if %7225 -> (i64) {
      scf.yield %7222 : i64
    } else {
      %7227 = llvm.mlir.addressof @str650 : !llvm.ptr
      %7228 = arith.constant 1 : i64
      %7229 = func.call @cc_make_string(%7227, %7228) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7229) : (i64) -> ()
      %7230 = llvm.mlir.addressof @str651 : !llvm.ptr
      %7231 = arith.constant 1 : i64
      %7232 = func.call @cc_make_string(%7230, %7231) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7232) : (i64) -> ()
      %7233 = llvm.mlir.addressof @str652 : !llvm.ptr
      %7234 = arith.constant 8 : i64
      %7235 = func.call @cc_make_string(%7233, %7234) : (!llvm.ptr, i64) -> i64
      %7236 = llvm.mlir.addressof @str653 : !llvm.ptr
      %7237 = arith.constant 11 : i64
      %7238 = func.call @cc_make_string(%7236, %7237) : (!llvm.ptr, i64) -> i64
      %7239 = func.call @cc_intern(%7235, %7238) : (i64, i64) -> i64
      %7240 = func.call @cc_nil_value() : () -> i64
      %7241 = func.call @cc_cons(%7239, %7240) : (i64, i64) -> i64
      %7242 = func.call @cc_values_pack(%7241) : (i64) -> i64
      %7243 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%7239, %7243) : (i64, i64) -> ()
      %7244 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7244 : i64
    }
    func.call @stack_push_pointer(%7226) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939424"() {
    %7369 = func.call @cc_nil_value() : () -> i64
    %7370 = func.call @cc_nil_value() : () -> i64
    %7371 = func.call @cc_errorp(%7369) : (i64) -> i64
    %7372 = arith.cmpi ne, %7371, %7370 : i64
    %7373 = scf.if %7372 -> (i64) {
      scf.yield %7369 : i64
    } else {
      %7374 = llvm.mlir.addressof @str665 : !llvm.ptr
      %7375 = arith.constant 1 : i64
      %7376 = func.call @cc_make_string(%7374, %7375) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7376) : (i64) -> ()
      %7377 = llvm.mlir.addressof @str666 : !llvm.ptr
      %7378 = arith.constant 1 : i64
      %7379 = func.call @cc_make_string(%7377, %7378) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7379) : (i64) -> ()
      %7380 = llvm.mlir.addressof @str667 : !llvm.ptr
      %7381 = arith.constant 16 : i64
      %7382 = func.call @cc_make_string(%7380, %7381) : (!llvm.ptr, i64) -> i64
      %7383 = llvm.mlir.addressof @str668 : !llvm.ptr
      %7384 = arith.constant 11 : i64
      %7385 = func.call @cc_make_string(%7383, %7384) : (!llvm.ptr, i64) -> i64
      %7386 = func.call @cc_intern(%7382, %7385) : (i64, i64) -> i64
      %7387 = func.call @cc_nil_value() : () -> i64
      %7388 = func.call @cc_cons(%7386, %7387) : (i64, i64) -> i64
      %7389 = func.call @cc_values_pack(%7388) : (i64) -> i64
      %7390 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%7386, %7390) : (i64, i64) -> ()
      %7391 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7391 : i64
    }
    func.call @stack_push_pointer(%7373) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939425"() {
    %7786 = func.call @cc_nil_value() : () -> i64
    %7787 = func.call @cc_nil_value() : () -> i64
    %7788 = func.call @cc_errorp(%7786) : (i64) -> i64
    %7789 = arith.cmpi ne, %7788, %7787 : i64
    %7790 = scf.if %7789 -> (i64) {
      scf.yield %7786 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %7791 = llvm.mlir.addressof @str706 : !llvm.ptr
      %7792 = arith.constant 4 : i64
      %7793 = func.call @cc_make_string(%7791, %7792) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
      %7794 = arith.addi %7793, %__rlasp_stack_elide_zero_503 : i64
      %7795 = func.call @cc_copy_seq(%7794) : (i64) -> i64
      %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
      %7796 = arith.addi %7795, %__rlasp_stack_elide_zero_504 : i64
      %7797 = func.call @cc_nil_value() : () -> i64
      %7798 = func.call @cc_nil_value() : () -> i64
      %7799 = func.call @cc_errorp(%7797) : (i64) -> i64
      %7800 = arith.cmpi ne, %7799, %7798 : i64
      %7801 = scf.if %7800 -> (i64) {
        scf.yield %7797 : i64
      } else {
        func.call @stack_push_pointer(%7796) : (i64) -> ()
        %7802 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%7802) : (i64) -> ()
        %7803 = func.call @stack_pop_pointer() : () -> i64
        %7804 = func.call @stack_pop_pointer() : () -> i64
        %7806 = arith.constant 256 : i64
        func.call @stack_push_fixnum(%7806) : (i64) -> ()
        %7807 = func.call @stack_pop_pointer() : () -> i64
        %7808 = func.call @cc_unbox_fixnum(%7807) : (i64) -> i64
        %7805 = func.call @cc_box_character(%7808) : (i64) -> i64
        %7809 = func.call @cc_set_char(%7804, %7803, %7805) : (i64, i64, i64) -> i64
        %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
        %7810 = arith.addi %7809, %__rlasp_stack_elide_zero_505 : i64
        scf.yield %7810 : i64
      }
      %7811 = func.call @cc_nil_value() : () -> i64
      %7812 = func.call @cc_errorp(%7801) : (i64) -> i64
      %7813 = arith.cmpi ne, %7812, %7811 : i64
      %7814 = scf.if %7813 -> (i64) {
        scf.yield %7801 : i64
      } else {
        %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
        %7815 = arith.addi %7796, %__rlasp_stack_elide_zero_506 : i64
        scf.yield %7815 : i64
      }
      %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
      %7816 = arith.addi %7814, %__rlasp_stack_elide_zero_507 : i64
      %7817 = func.call @stack_pop_pointer() : () -> i64
      %7818 = func.call @cc_cons(%7816, %7817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7818) : (i64) -> ()
      %7819 = arith.constant 4 : i64
      %7820 = func.call @cc_box_fixnum(%7819) : (i64) -> i64
      %7821 = llvm.mlir.addressof @str707 : !llvm.ptr
      %7822 = arith.constant 12 : i64
      %7823 = func.call @cc_make_string(%7821, %7822) : (!llvm.ptr, i64) -> i64
      %7824 = llvm.mlir.addressof @str708 : !llvm.ptr
      %7825 = arith.constant 7 : i64
      %7826 = func.call @cc_make_string(%7824, %7825) : (!llvm.ptr, i64) -> i64
      %7827 = func.call @cc_intern(%7823, %7826) : (i64, i64) -> i64
      %7828 = func.call @cc_nil_value() : () -> i64
      %7829 = func.call @cc_cons(%7827, %7828) : (i64, i64) -> i64
      %7830 = func.call @cc_values_pack(%7829) : (i64) -> i64
      %7831 = llvm.mlir.addressof @str709 : !llvm.ptr
      %7832 = arith.constant 9 : i64
      %7833 = func.call @cc_make_string(%7831, %7832) : (!llvm.ptr, i64) -> i64
      %7834 = llvm.mlir.addressof @str710 : !llvm.ptr
      %7835 = arith.constant 11 : i64
      %7836 = func.call @cc_make_string(%7834, %7835) : (!llvm.ptr, i64) -> i64
      %7837 = func.call @cc_intern(%7833, %7836) : (i64, i64) -> i64
      %7838 = func.call @cc_nil_value() : () -> i64
      %7839 = func.call @cc_cons(%7837, %7838) : (i64, i64) -> i64
      %7840 = func.call @cc_values_pack(%7839) : (i64) -> i64
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %7841 = arith.addi %7837, %__rlasp_stack_elide_zero_508 : i64
      %7842 = llvm.mlir.addressof @str711 : !llvm.ptr
      %7843 = arith.constant 16 : i64
      %7844 = func.call @cc_make_string(%7842, %7843) : (!llvm.ptr, i64) -> i64
      %7845 = llvm.mlir.addressof @str712 : !llvm.ptr
      %7846 = arith.constant 7 : i64
      %7847 = func.call @cc_make_string(%7845, %7846) : (!llvm.ptr, i64) -> i64
      %7848 = func.call @cc_intern(%7844, %7847) : (i64, i64) -> i64
      %7849 = func.call @cc_nil_value() : () -> i64
      %7850 = func.call @cc_cons(%7848, %7849) : (i64, i64) -> i64
      %7851 = func.call @cc_values_pack(%7850) : (i64) -> i64
      %7852 = arith.constant 63 : i64
      %7853 = func.call @cc_box_character(%7852) : (i64) -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %7854 = arith.addi %7853, %__rlasp_stack_elide_zero_509 : i64
      %7855 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%7855) : (i64) -> ()
      %7856 = func.call @stack_pop_pointer() : () -> i64
      %7857 = func.call @cc_unbox_fixnum(%7856) : (i64) -> i64
      %7858 = func.call @cc_box_character(%7857) : (i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %7859 = arith.addi %7858, %__rlasp_stack_elide_zero_510 : i64
      %7860 = arith.constant 63 : i64
      %7861 = func.call @cc_box_character(%7860) : (i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %7862 = arith.addi %7861, %__rlasp_stack_elide_zero_511 : i64
      %7863 = arith.constant 63 : i64
      %7864 = func.call @cc_box_character(%7863) : (i64) -> i64
      %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
      %7865 = arith.addi %7864, %__rlasp_stack_elide_zero_512 : i64
      %7866 = func.call @cc_nil_value() : () -> i64
      %7867 = func.call @cc_errorp(%7854) : (i64) -> i64
      %7868 = arith.cmpi ne, %7867, %7866 : i64
      %7869 = arith.cmpi eq, %7866, %7866 : i64
      %7870 = arith.andi %7868, %7869 : i1
      %7871 = scf.if %7870 -> (i64) {
        scf.yield %7854 : i64
      } else {
        scf.yield %7866 : i64
      }
      %7872 = func.call @cc_errorp(%7859) : (i64) -> i64
      %7873 = arith.cmpi ne, %7872, %7866 : i64
      %7874 = arith.cmpi eq, %7871, %7866 : i64
      %7875 = arith.andi %7873, %7874 : i1
      %7876 = scf.if %7875 -> (i64) {
        scf.yield %7859 : i64
      } else {
        scf.yield %7871 : i64
      }
      %7877 = func.call @cc_errorp(%7862) : (i64) -> i64
      %7878 = arith.cmpi ne, %7877, %7866 : i64
      %7879 = arith.cmpi eq, %7876, %7866 : i64
      %7880 = arith.andi %7878, %7879 : i1
      %7881 = scf.if %7880 -> (i64) {
        scf.yield %7862 : i64
      } else {
        scf.yield %7876 : i64
      }
      %7882 = func.call @cc_errorp(%7865) : (i64) -> i64
      %7883 = arith.cmpi ne, %7882, %7866 : i64
      %7884 = arith.cmpi eq, %7881, %7866 : i64
      %7885 = arith.andi %7883, %7884 : i1
      %7886 = scf.if %7885 -> (i64) {
        scf.yield %7865 : i64
      } else {
        scf.yield %7881 : i64
      }
      %7887 = arith.cmpi ne, %7886, %7866 : i64
      scf.if %7887 {
        func.call @stack_push_pointer(%7886) : (i64) -> ()
      } else {
        %7888 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%7888) : (i64) -> ()
        %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
        %7889 = arith.addi %7865, %__rlasp_stack_elide_zero_513 : i64
        %7890 = func.call @stack_pop_pointer() : () -> i64
        %7891 = func.call @cc_cons(%7889, %7890) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7891) : (i64) -> ()
        %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
        %7892 = arith.addi %7862, %__rlasp_stack_elide_zero_514 : i64
        %7893 = func.call @stack_pop_pointer() : () -> i64
        %7894 = func.call @cc_cons(%7892, %7893) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7894) : (i64) -> ()
        %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
        %7895 = arith.addi %7859, %__rlasp_stack_elide_zero_515 : i64
        %7896 = func.call @stack_pop_pointer() : () -> i64
        %7897 = func.call @cc_cons(%7895, %7896) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7897) : (i64) -> ()
        %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
        %7898 = arith.addi %7854, %__rlasp_stack_elide_zero_516 : i64
        %7899 = func.call @stack_pop_pointer() : () -> i64
        %7900 = func.call @cc_cons(%7898, %7899) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7900) : (i64) -> ()
      }
      %7901 = func.call @stack_pop_pointer() : () -> i64
      %7902 = func.call @cc_nil_value() : () -> i64
      %7903 = func.call @cc_errorp(%7820) : (i64) -> i64
      %7904 = arith.cmpi ne, %7903, %7902 : i64
      %7905 = arith.cmpi eq, %7902, %7902 : i64
      %7906 = arith.andi %7904, %7905 : i1
      %7907 = scf.if %7906 -> (i64) {
        scf.yield %7820 : i64
      } else {
        scf.yield %7902 : i64
      }
      %7908 = func.call @cc_errorp(%7827) : (i64) -> i64
      %7909 = arith.cmpi ne, %7908, %7902 : i64
      %7910 = arith.cmpi eq, %7907, %7902 : i64
      %7911 = arith.andi %7909, %7910 : i1
      %7912 = scf.if %7911 -> (i64) {
        scf.yield %7827 : i64
      } else {
        scf.yield %7907 : i64
      }
      %7913 = func.call @cc_errorp(%7841) : (i64) -> i64
      %7914 = arith.cmpi ne, %7913, %7902 : i64
      %7915 = arith.cmpi eq, %7912, %7902 : i64
      %7916 = arith.andi %7914, %7915 : i1
      %7917 = scf.if %7916 -> (i64) {
        scf.yield %7841 : i64
      } else {
        scf.yield %7912 : i64
      }
      %7918 = func.call @cc_errorp(%7848) : (i64) -> i64
      %7919 = arith.cmpi ne, %7918, %7902 : i64
      %7920 = arith.cmpi eq, %7917, %7902 : i64
      %7921 = arith.andi %7919, %7920 : i1
      %7922 = scf.if %7921 -> (i64) {
        scf.yield %7848 : i64
      } else {
        scf.yield %7917 : i64
      }
      %7923 = func.call @cc_errorp(%7901) : (i64) -> i64
      %7924 = arith.cmpi ne, %7923, %7902 : i64
      %7925 = arith.cmpi eq, %7922, %7902 : i64
      %7926 = arith.andi %7924, %7925 : i1
      %7927 = scf.if %7926 -> (i64) {
        scf.yield %7901 : i64
      } else {
        scf.yield %7922 : i64
      }
      %7928 = arith.cmpi ne, %7927, %7902 : i64
      scf.if %7928 {
        func.call @stack_push_pointer(%7927) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7820) : (i64) -> ()
        func.call @stack_push_pointer(%7827) : (i64) -> ()
        func.call @stack_push_pointer(%7841) : (i64) -> ()
        func.call @stack_push_pointer(%7848) : (i64) -> ()
        func.call @stack_push_pointer(%7901) : (i64) -> ()
        %7929 = llvm.mlir.addressof @str713 : !llvm.ptr
        %7930 = func.call @cc_make_function_ref_const(%7929) : (!llvm.ptr) -> i64
        %7931 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%7930, %7931) : (i64, i64) -> ()
      }
      %7932 = func.call @stack_pop_pointer() : () -> i64
      %7933 = func.call @stack_pop_pointer() : () -> i64
      %7934 = func.call @cc_cons(%7932, %7933) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
      %7935 = arith.addi %7934, %__rlasp_stack_elide_zero_517 : i64
      %7936 = func.call @cc_string_equal_full(%7935) : (i64) -> i64
      %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
      %7937 = arith.addi %7936, %__rlasp_stack_elide_zero_518 : i64
      %7938 = func.call @cc_nil_value() : () -> i64
      %7939 = func.call @cc_cons(%7937, %7938) : (i64, i64) -> i64
      %7940 = func.call @cc_not(%7939) : (i64) -> i64
      %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
      %7941 = arith.addi %7940, %__rlasp_stack_elide_zero_519 : i64
      %7942 = func.call @cc_nil_value() : () -> i64
      %7943 = func.call @cc_cons(%7941, %7942) : (i64, i64) -> i64
      %7944 = func.call @cc_not(%7943) : (i64) -> i64
      %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
      %7945 = arith.addi %7944, %__rlasp_stack_elide_zero_520 : i64
      scf.yield %7945 : i64
    }
    func.call @stack_push_pointer(%7790) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939426"() {
    %8164 = func.call @cc_nil_value() : () -> i64
    %8165 = func.call @cc_nil_value() : () -> i64
    %8166 = func.call @cc_errorp(%8164) : (i64) -> i64
    %8167 = arith.cmpi ne, %8166, %8165 : i64
    %8168 = scf.if %8167 -> (i64) {
      scf.yield %8164 : i64
    } else {
      %8169 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8170 = arith.constant 26 : i64
      %8171 = func.call @cc_make_string(%8169, %8170) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %8172 = arith.addi %8171, %__rlasp_stack_elide_zero_521 : i64
      %8173 = func.call @cc_type_of(%8172) : (i64) -> i64
      func.call @stack_push_pointer(%8173) : (i64) -> ()
      %8174 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8175 = arith.constant 12 : i64
      %8176 = func.call @cc_make_string(%8174, %8175) : (!llvm.ptr, i64) -> i64
      %8177 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8178 = arith.constant 11 : i64
      %8179 = func.call @cc_make_string(%8177, %8178) : (!llvm.ptr, i64) -> i64
      %8180 = func.call @cc_intern(%8176, %8179) : (i64, i64) -> i64
      %8181 = func.call @cc_nil_value() : () -> i64
      %8182 = func.call @cc_cons(%8180, %8181) : (i64, i64) -> i64
      %8183 = func.call @cc_values_pack(%8182) : (i64) -> i64
      func.call @stack_push_pointer(%8180) : (i64) -> ()
      %8184 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8185 = arith.constant 9 : i64
      %8186 = func.call @cc_make_string(%8184, %8185) : (!llvm.ptr, i64) -> i64
      %8187 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8188 = arith.constant 11 : i64
      %8189 = func.call @cc_make_string(%8187, %8188) : (!llvm.ptr, i64) -> i64
      %8190 = func.call @cc_intern(%8186, %8189) : (i64, i64) -> i64
      %8191 = func.call @cc_nil_value() : () -> i64
      %8192 = func.call @cc_cons(%8190, %8191) : (i64, i64) -> i64
      %8193 = func.call @cc_values_pack(%8192) : (i64) -> i64
      func.call @stack_push_pointer(%8190) : (i64) -> ()
      %8194 = arith.constant 17 : i64
      func.call @stack_push_fixnum(%8194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8195 = func.call @stack_pop_pointer() : () -> i64
      %8196 = func.call @stack_pop_pointer() : () -> i64
      %8197 = func.call @cc_cons(%8196, %8195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8197) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8198 = func.call @stack_pop_pointer() : () -> i64
      %8199 = func.call @stack_pop_pointer() : () -> i64
      %8200 = func.call @cc_cons(%8199, %8198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
      %8201 = arith.addi %8200, %__rlasp_stack_elide_zero_522 : i64
      %8202 = func.call @stack_pop_pointer() : () -> i64
      %8203 = func.call @cc_cons(%8202, %8201) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
      %8204 = arith.addi %8203, %__rlasp_stack_elide_zero_523 : i64
      %8205 = func.call @stack_pop_pointer() : () -> i64
      %8206 = func.call @cc_cons(%8205, %8204) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
      %8207 = arith.addi %8206, %__rlasp_stack_elide_zero_524 : i64
      %8208 = func.call @stack_pop_pointer() : () -> i64
      %8209 = func.call @cc_equal(%8208, %8207) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %8210 = arith.addi %8209, %__rlasp_stack_elide_zero_525 : i64
      %8211 = func.call @cc_nil_value() : () -> i64
      %8212 = func.call @cc_cons(%8210, %8211) : (i64, i64) -> i64
      %8213 = func.call @cc_not(%8212) : (i64) -> i64
      %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
      %8214 = arith.addi %8213, %__rlasp_stack_elide_zero_526 : i64
      %8215 = func.call @cc_nil_value() : () -> i64
      %8216 = func.call @cc_cons(%8214, %8215) : (i64, i64) -> i64
      %8217 = func.call @cc_not(%8216) : (i64) -> i64
      %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
      %8218 = arith.addi %8217, %__rlasp_stack_elide_zero_527 : i64
      scf.yield %8218 : i64
    }
    func.call @stack_push_pointer(%8168) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_122791386939392*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_122791386939392*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_122791386939392*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("REVERSE-STRING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str8("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str9("REVERSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str12("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str13("cba\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str21("SUBSEQ-OOB\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str22("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str26("SUBSEQ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str31("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str38("STRINGS-WITH-NUL0\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str39("SUBSTITUTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("PRIN1-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("PRIN1-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str48("\22aaa\22\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str49("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str51("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str52("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str53("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str56("STRINGS-WITH-NUL1\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str57("SUBSTITUTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("STR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("STR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str65("PRINC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("123\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str68("STR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str69("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str70("123\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str71("PRINC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("X123\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str73("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str80("CONCATENATE-WITH-NUL0\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str81("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str82("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str83("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str86("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str88("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str91("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str92("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str96("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str97("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str100("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str101("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str103("CONCATENATE-WITH-NUL1\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str104("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str105("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str106("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str113("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str118("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str121("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str122("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str123("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str126("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str127("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str129("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str130("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str131("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str132("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str133("COPY-SEQ-WITH-NUL0\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str134("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str135("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str136("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("COPY-SEQ\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str145("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str148("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str149("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str150("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str153("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str154("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str155("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str158("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str159("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str162("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str163("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str164("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str165("STRING=-WITH-NUL0\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str166("SUBSTITUTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str167("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("SUBSEQ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str175("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str176("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("bcd\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str181("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("bcd\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str184("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str185("aXXXbcd\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str193("PARSE-INTEGER0\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str194("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str195("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str197("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str198("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("123 456\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str201("123 456\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str202("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str203("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str208("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str209("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str210("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str211("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str212("PARSE-INTEGER1\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str213("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str214("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215(" 123 \00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str216(" 123 \00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str217("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str218("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str223("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str224("PARSE-INTEGER2\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str225("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str226("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str228("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str229("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("   123a\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str232("   123a\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str233("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str234("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str239("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str240("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str241("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str242("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str243("PARSE-INTEGER3\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str244("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246(" +123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str247(" +123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str248("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str249("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str250("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str251("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str252("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str253("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str254("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str255("PARSE-INTEGER3A\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str256("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str257("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258(" -123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str259(" -123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str261("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str262("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str263("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str266("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str267("PARSE-INTEGER4\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str268("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str269("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str271("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str272("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274(" +-123 \00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str275(" +-123 \00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str276("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str277("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str278("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str282("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str283("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str284("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str285("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str286("PARSE-INTEGER5\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str287("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289(" 123a\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str290("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str291("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str292(" 123a\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str293("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str294("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str295("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str296("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str298("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str299("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str300("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str301("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str302("PARSE-INTEGER6\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str303("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str304("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str306("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str307("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str308("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str310("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str311("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str312("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str313("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str317("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str318("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str319("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str320("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str321("PARSE-INTEGER7\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str322("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str323("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str325("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str326("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str329("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str330("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str331("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str332("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str336("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str339("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str340("PARSE-INTEGER8\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str341("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str342("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str343("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str344("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str345("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str348("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str349("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str350("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str351("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str352("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str353("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str354("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str355("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str356("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str357("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str358("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str359("PARSE-INTEGER9\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str360("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str361("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str362("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str363("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str364("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str365("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str366("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str367("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str368("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str369("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str370("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str371("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str373("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str375("PARSE-INTEGER10\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str376("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str377("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str378("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str379("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str380("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str381("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str382("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str383("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str384("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str385("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str386("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str387("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str388("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str389("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str390("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str391("PARSE-INTEGER11\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str392("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str393("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str394("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str395("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str396("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str397("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str398("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str399("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str400("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str401("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str402("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str403("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str404("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str405("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str406("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str407("TYPE-OF-STRING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str408("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str409("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str410("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str411("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str412("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str413("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str414("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str415("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str417("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str418("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str419("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str422("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str427("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str428("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str429("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str430("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str431("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str432("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str433("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str434("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str436("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str438("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str439("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str440("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str441("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str443("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str445("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str446("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str447("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str448("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str449("COPY-TO-SIMPLE-BASE-STRING0\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str450("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str451("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str452("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str455("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str456("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str457("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str458("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str459("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str460("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str461("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str462("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str463("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str464("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str465("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str468("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str469("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str470("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str471("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str472("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str473("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str474("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str475("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str476("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str477("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str478("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str479("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str481("COPY-TO-SIMPLE-BASE-STRING1\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str482("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str483("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str484("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str485("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str487("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str488("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str489("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str490("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str491("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str492("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str493("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str494("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str495("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str496("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str497("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str498("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str499("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str500("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str501("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str502("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str503("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str504("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str505("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str506("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str507("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str508("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str509("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str510("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str511("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str512("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str513("COPY-TO-SIMPLE-BASE-STRING2\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str514("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str515("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str516("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str517("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str518("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str519("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str520("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str521("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str522("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str523("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str524("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str525("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str526("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str527("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str528("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str529("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str530("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str531("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str532("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str533("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str534("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str535("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str536("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str537("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str538("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str539("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str540("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str541("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str542("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str545("COPY-TO-SIMPLE-BASE-STRING3\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str546("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str547("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str548("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str549("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str550("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str551("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str552("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str553("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str554("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str555("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str556("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str557("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str558("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str559("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str560("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str561("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str564("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str565("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str566("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str567("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str568("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str569("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str570("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str571("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str572("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str573("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str574("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str575("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str577("COPY-TO-SIMPLE-BASE-STRING4\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str578("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str579("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str580("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str581("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str582("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str583("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str584("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str585("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str586("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str587("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str588("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str589("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str590("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str591("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str593("COPY-TO-SIMPLE-BASE-STRING5\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str594("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str595("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str596("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str597("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str598("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str599("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str600("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str601("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str602("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str603("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str604("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str605("CLOSEST-SEQUENCE-TYPE0\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str606("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str607("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str608("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str609("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str610("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str611("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str612("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str613("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str614("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str615("VECTOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str616("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str617("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str618("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str619("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str620("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str621("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str622("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str623("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str624("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str625("CLOSEST-SEQUENCE-TYPE1\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str626("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str627("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str628("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str630("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str632("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str633("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str634("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str635("VECTOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str636("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str637("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str638("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str639("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str640("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str641("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str642("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str643("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str644("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str645("EQL-1\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str646("STRING/=\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str647("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str649("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str650("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str651("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str652("STRING/=\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str655("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str656("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str657("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str658("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str659("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str660("EQL-2\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str661("STRING-NOT-EQUAL\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str662("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str663("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str664("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str665("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str666("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str667("STRING-NOT-EQUAL\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str668("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str669("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str670("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str671("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str672("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str673("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str674("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str675("BABEL-SIMPLE-STRINGS-1\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str676("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str677("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str678("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str679("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str680("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str681("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str683("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str684("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str685("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str687("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str688("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str689("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str690("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str691("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str692("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str693("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str694("VAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str695("COPY-SEQ\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str696("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str697("????\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str698("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str699("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str700("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str701("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str702("VAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str703("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str704("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str705("VAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str706("????\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str707("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str708("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str709("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str710("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str711("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str712("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str713("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str714("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str715("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str716("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str717("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str718("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str719("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str720("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str721("BABEL-SIMPLE-STRINGS-2\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str722("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str723("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str724("EQUAL\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("za\C5\BC\C3\B3\C5\82\C4\87 g\C4\99\C5\9Bl\C4\85 ja\C5\BA\C5\84\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str729("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str730("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str731("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str732("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str733("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str734("za\C5\BC\C3\B3\C5\82\C4\87 g\C4\99\C5\9Bl\C4\85 ja\C5\BA\C5\84\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str735("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str736("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str737("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str738("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str739("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str740("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str741("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str742("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str743("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str744("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str745("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str746("*__MLIR_BLOCK_RETFLAG_122791386939392*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str747("*__MLIR_BLOCK_RETMVLIST_122791386939392*\00") : !llvm.array<41 x i8>
}
