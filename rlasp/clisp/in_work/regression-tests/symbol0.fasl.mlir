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
      %57 = arith.constant 24 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 13 : i64
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
      %76 = arith.constant 6 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      %79 = func.call @cc_intern(%77, %78) : (i64, i64) -> i64
      %80 = func.call @cc_nil_value() : () -> i64
      %81 = func.call @cc_cons(%79, %80) : (i64, i64) -> i64
      %82 = func.call @cc_values_pack(%81) : (i64) -> i64
      func.call @stack_push_pointer(%79) : (i64) -> ()
      %83 = llvm.mlir.addressof @str9 : !llvm.ptr
      %84 = arith.constant 19 : i64
      %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = func.call @cc_intern(%85, %86) : (i64, i64) -> i64
      %88 = func.call @cc_nil_value() : () -> i64
      %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
      %90 = func.call @cc_values_pack(%89) : (i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %91 = llvm.mlir.addressof @str10 : !llvm.ptr
      %92 = arith.constant 11 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = llvm.mlir.addressof @str11 : !llvm.ptr
      %95 = arith.constant 11 : i64
      %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
      %97 = func.call @cc_intern(%93, %96) : (i64, i64) -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
      %100 = func.call @cc_values_pack(%99) : (i64) -> i64
      func.call @stack_push_pointer(%97) : (i64) -> ()
      %101 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%101) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = func.call @cc_cons(%103, %102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %105 = arith.addi %104, %__rlasp_stack_elide_zero_3 : i64
      %106 = func.call @stack_pop_pointer() : () -> i64
      %107 = func.call @cc_cons(%106, %105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @cc_cons(%109, %108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %111 = arith.addi %110, %__rlasp_stack_elide_zero_4 : i64
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @cc_cons(%112, %111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %114 = func.call @stack_pop_pointer() : () -> i64
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @cc_cons(%115, %114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %117 = arith.addi %116, %__rlasp_stack_elide_zero_5 : i64
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @cc_cons(%118, %117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %120 = arith.addi %119, %__rlasp_stack_elide_zero_6 : i64
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @cc_cons(%121, %120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @stack_pop_pointer() : () -> i64
      %125 = func.call @cc_cons(%124, %123) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %126 = arith.addi %125, %__rlasp_stack_elide_zero_7 : i64
      %127 = func.call @stack_pop_pointer() : () -> i64
      %128 = func.call @cc_cons(%127, %126) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %129 = arith.addi %128, %__rlasp_stack_elide_zero_8 : i64
      %176 = arith.constant 116254966808577 : i64
      %177 = arith.constant 0 : i64
      %178 = func.call @cc_make_closure(%176, %177) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %179 = arith.addi %178, %__rlasp_stack_elide_zero_9 : i64
      %180 = llvm.mlir.addressof @str12 : !llvm.ptr
      %181 = arith.constant 4 : i64
      %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
      %183 = func.call @cc_nil_value() : () -> i64
      %184 = func.call @cc_intern(%182, %183) : (i64, i64) -> i64
      %185 = func.call @cc_nil_value() : () -> i64
      %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
      %187 = func.call @cc_values_pack(%186) : (i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %188 = llvm.mlir.addressof @str13 : !llvm.ptr
      %189 = arith.constant 10 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = llvm.mlir.addressof @str14 : !llvm.ptr
      %192 = arith.constant 11 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = func.call @cc_intern(%190, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %198 = func.call @stack_pop_pointer() : () -> i64
      %199 = func.call @stack_pop_pointer() : () -> i64
      %200 = func.call @cc_cons(%199, %198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %201 = arith.addi %200, %__rlasp_stack_elide_zero_10 : i64
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @cc_cons(%202, %201) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %204 = arith.addi %203, %__rlasp_stack_elide_zero_11 : i64
      %205 = llvm.mlir.addressof @str15 : !llvm.ptr
      %206 = arith.constant 11 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = llvm.mlir.addressof @str16 : !llvm.ptr
      %209 = arith.constant 7 : i64
      %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
      %211 = func.call @cc_intern(%207, %210) : (i64, i64) -> i64
      %212 = func.call @cc_nil_value() : () -> i64
      %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
      %214 = func.call @cc_values_pack(%213) : (i64) -> i64
      %215 = func.call @cc_nil_value() : () -> i64
      %216 = llvm.mlir.addressof @str17 : !llvm.ptr
      %217 = arith.constant 4 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = llvm.mlir.addressof @str18 : !llvm.ptr
      %220 = arith.constant 7 : i64
      %221 = func.call @cc_make_string(%219, %220) : (!llvm.ptr, i64) -> i64
      %222 = func.call @cc_intern(%218, %221) : (i64, i64) -> i64
      %223 = func.call @cc_nil_value() : () -> i64
      %224 = func.call @cc_cons(%222, %223) : (i64, i64) -> i64
      %225 = func.call @cc_values_pack(%224) : (i64) -> i64
      %226 = llvm.mlir.addressof @str19 : !llvm.ptr
      %227 = arith.constant 5 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_nil_value() : () -> i64
      %230 = func.call @cc_intern(%228, %229) : (i64, i64) -> i64
      %231 = func.call @cc_nil_value() : () -> i64
      %232 = func.call @cc_cons(%230, %231) : (i64, i64) -> i64
      %233 = func.call @cc_values_pack(%232) : (i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %234 = arith.addi %230, %__rlasp_stack_elide_zero_12 : i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_errorp(%64) : (i64) -> i64
      %237 = arith.cmpi ne, %236, %235 : i64
      %238 = arith.cmpi eq, %235, %235 : i64
      %239 = arith.andi %237, %238 : i1
      %240 = scf.if %239 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %235 : i64
      }
      %241 = func.call @cc_errorp(%129) : (i64) -> i64
      %242 = arith.cmpi ne, %241, %235 : i64
      %243 = arith.cmpi eq, %240, %235 : i64
      %244 = arith.andi %242, %243 : i1
      %245 = scf.if %244 -> (i64) {
        scf.yield %129 : i64
      } else {
        scf.yield %240 : i64
      }
      %246 = func.call @cc_errorp(%179) : (i64) -> i64
      %247 = arith.cmpi ne, %246, %235 : i64
      %248 = arith.cmpi eq, %245, %235 : i64
      %249 = arith.andi %247, %248 : i1
      %250 = scf.if %249 -> (i64) {
        scf.yield %179 : i64
      } else {
        scf.yield %245 : i64
      }
      %251 = func.call @cc_errorp(%204) : (i64) -> i64
      %252 = arith.cmpi ne, %251, %235 : i64
      %253 = arith.cmpi eq, %250, %235 : i64
      %254 = arith.andi %252, %253 : i1
      %255 = scf.if %254 -> (i64) {
        scf.yield %204 : i64
      } else {
        scf.yield %250 : i64
      }
      %256 = func.call @cc_errorp(%211) : (i64) -> i64
      %257 = arith.cmpi ne, %256, %235 : i64
      %258 = arith.cmpi eq, %255, %235 : i64
      %259 = arith.andi %257, %258 : i1
      %260 = scf.if %259 -> (i64) {
        scf.yield %211 : i64
      } else {
        scf.yield %255 : i64
      }
      %261 = func.call @cc_errorp(%215) : (i64) -> i64
      %262 = arith.cmpi ne, %261, %235 : i64
      %263 = arith.cmpi eq, %260, %235 : i64
      %264 = arith.andi %262, %263 : i1
      %265 = scf.if %264 -> (i64) {
        scf.yield %215 : i64
      } else {
        scf.yield %260 : i64
      }
      %266 = func.call @cc_errorp(%222) : (i64) -> i64
      %267 = arith.cmpi ne, %266, %235 : i64
      %268 = arith.cmpi eq, %265, %235 : i64
      %269 = arith.andi %267, %268 : i1
      %270 = scf.if %269 -> (i64) {
        scf.yield %222 : i64
      } else {
        scf.yield %265 : i64
      }
      %271 = func.call @cc_errorp(%234) : (i64) -> i64
      %272 = arith.cmpi ne, %271, %235 : i64
      %273 = arith.cmpi eq, %270, %235 : i64
      %274 = arith.andi %272, %273 : i1
      %275 = scf.if %274 -> (i64) {
        scf.yield %234 : i64
      } else {
        scf.yield %270 : i64
      }
      %276 = arith.cmpi ne, %275, %235 : i64
      scf.if %276 {
        func.call @stack_push_pointer(%275) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%129) : (i64) -> ()
        func.call @stack_push_pointer(%179) : (i64) -> ()
        func.call @stack_push_pointer(%204) : (i64) -> ()
        func.call @stack_push_pointer(%211) : (i64) -> ()
        func.call @stack_push_pointer(%215) : (i64) -> ()
        func.call @stack_push_pointer(%222) : (i64) -> ()
        func.call @stack_push_pointer(%234) : (i64) -> ()
        %277 = llvm.mlir.addressof @str20 : !llvm.ptr
        %278 = func.call @cc_make_function_ref_const(%277) : (!llvm.ptr) -> i64
        %279 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%278, %279) : (i64, i64) -> ()
      }
      %280 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %280 : i64
    }
    %281 = func.call @cc_nil_value() : () -> i64
    %282 = func.call @cc_errorp(%55) : (i64) -> i64
    %283 = arith.cmpi ne, %282, %281 : i64
    %284 = scf.if %283 -> (i64) {
      scf.yield %55 : i64
    } else {
      %285 = llvm.mlir.addressof @str21 : !llvm.ptr
      %286 = arith.constant 24 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_intern(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_values_pack(%291) : (i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %293 = arith.addi %289, %__rlasp_stack_elide_zero_13 : i64
      %294 = llvm.mlir.addressof @str22 : !llvm.ptr
      %295 = arith.constant 13 : i64
      %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
      %297 = llvm.mlir.addressof @str23 : !llvm.ptr
      %298 = arith.constant 11 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = func.call @cc_intern(%296, %299) : (i64, i64) -> i64
      %301 = func.call @cc_nil_value() : () -> i64
      %302 = func.call @cc_cons(%300, %301) : (i64, i64) -> i64
      %303 = func.call @cc_values_pack(%302) : (i64) -> i64
      func.call @stack_push_pointer(%300) : (i64) -> ()
      %304 = llvm.mlir.addressof @str24 : !llvm.ptr
      %305 = arith.constant 6 : i64
      %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_intern(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_nil_value() : () -> i64
      %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
      %311 = func.call @cc_values_pack(%310) : (i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %312 = llvm.mlir.addressof @str25 : !llvm.ptr
      %313 = arith.constant 19 : i64
      %314 = func.call @cc_make_string(%312, %313) : (!llvm.ptr, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_intern(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_nil_value() : () -> i64
      %318 = func.call @cc_cons(%316, %317) : (i64, i64) -> i64
      %319 = func.call @cc_values_pack(%318) : (i64) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      %320 = llvm.mlir.addressof @str26 : !llvm.ptr
      %321 = arith.constant 11 : i64
      %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
      %323 = llvm.mlir.addressof @str27 : !llvm.ptr
      %324 = arith.constant 11 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = func.call @cc_intern(%322, %325) : (i64, i64) -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_values_pack(%328) : (i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      %330 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%330) : (i64) -> ()
      %331 = llvm.mlir.addressof @str28 : !llvm.ptr
      %332 = arith.constant 5 : i64
      %333 = func.call @cc_make_string(%331, %332) : (!llvm.ptr, i64) -> i64
      %334 = llvm.mlir.addressof @str29 : !llvm.ptr
      %335 = arith.constant 11 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = func.call @cc_intern(%333, %336) : (i64, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_cons(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_values_pack(%339) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %341 = arith.addi %337, %__rlasp_stack_elide_zero_14 : i64
      %342 = func.call @stack_pop_pointer() : () -> i64
      %343 = func.call @cc_cons(%341, %342) : (i64, i64) -> i64
      %344 = llvm.mlir.addressof @str30 : !llvm.ptr
      %345 = arith.constant 5 : i64
      %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
      %347 = func.call @cc_nil_value() : () -> i64
      %348 = func.call @cc_intern(%346, %347) : (i64, i64) -> i64
      %349 = func.call @cc_nil_value() : () -> i64
      %350 = func.call @cc_cons(%348, %349) : (i64, i64) -> i64
      %351 = func.call @cc_values_pack(%350) : (i64) -> i64
      %352 = func.call @cc_cons(%348, %343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%352) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %353 = func.call @stack_pop_pointer() : () -> i64
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_cons(%354, %353) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %356 = arith.addi %355, %__rlasp_stack_elide_zero_15 : i64
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @cc_cons(%357, %356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%358) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @cc_cons(%360, %359) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %362 = arith.addi %361, %__rlasp_stack_elide_zero_16 : i64
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = func.call @cc_cons(%363, %362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_cons(%366, %365) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %368 = arith.addi %367, %__rlasp_stack_elide_zero_17 : i64
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @cc_cons(%369, %368) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %371 = arith.addi %370, %__rlasp_stack_elide_zero_18 : i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%372, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @stack_pop_pointer() : () -> i64
      %376 = func.call @cc_cons(%375, %374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %377 = arith.addi %376, %__rlasp_stack_elide_zero_19 : i64
      %378 = func.call @stack_pop_pointer() : () -> i64
      %379 = func.call @cc_cons(%378, %377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %380 = arith.addi %379, %__rlasp_stack_elide_zero_20 : i64
      %436 = arith.constant 116254966808578 : i64
      %437 = arith.constant 0 : i64
      %438 = func.call @cc_make_closure(%436, %437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %439 = arith.addi %438, %__rlasp_stack_elide_zero_21 : i64
      %440 = llvm.mlir.addressof @str33 : !llvm.ptr
      %441 = arith.constant 4 : i64
      %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
      %443 = func.call @cc_nil_value() : () -> i64
      %444 = func.call @cc_intern(%442, %443) : (i64, i64) -> i64
      %445 = func.call @cc_nil_value() : () -> i64
      %446 = func.call @cc_cons(%444, %445) : (i64, i64) -> i64
      %447 = func.call @cc_values_pack(%446) : (i64) -> i64
      func.call @stack_push_pointer(%444) : (i64) -> ()
      %448 = llvm.mlir.addressof @str34 : !llvm.ptr
      %449 = arith.constant 10 : i64
      %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
      %451 = llvm.mlir.addressof @str35 : !llvm.ptr
      %452 = arith.constant 11 : i64
      %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
      %454 = func.call @cc_intern(%450, %453) : (i64, i64) -> i64
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
      %465 = llvm.mlir.addressof @str36 : !llvm.ptr
      %466 = arith.constant 11 : i64
      %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
      %468 = llvm.mlir.addressof @str37 : !llvm.ptr
      %469 = arith.constant 7 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = func.call @cc_intern(%467, %470) : (i64, i64) -> i64
      %472 = func.call @cc_nil_value() : () -> i64
      %473 = func.call @cc_cons(%471, %472) : (i64, i64) -> i64
      %474 = func.call @cc_values_pack(%473) : (i64) -> i64
      %475 = func.call @cc_nil_value() : () -> i64
      %476 = llvm.mlir.addressof @str38 : !llvm.ptr
      %477 = arith.constant 4 : i64
      %478 = func.call @cc_make_string(%476, %477) : (!llvm.ptr, i64) -> i64
      %479 = llvm.mlir.addressof @str39 : !llvm.ptr
      %480 = arith.constant 7 : i64
      %481 = func.call @cc_make_string(%479, %480) : (!llvm.ptr, i64) -> i64
      %482 = func.call @cc_intern(%478, %481) : (i64, i64) -> i64
      %483 = func.call @cc_nil_value() : () -> i64
      %484 = func.call @cc_cons(%482, %483) : (i64, i64) -> i64
      %485 = func.call @cc_values_pack(%484) : (i64) -> i64
      %486 = llvm.mlir.addressof @str40 : !llvm.ptr
      %487 = arith.constant 5 : i64
      %488 = func.call @cc_make_string(%486, %487) : (!llvm.ptr, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_intern(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_nil_value() : () -> i64
      %492 = func.call @cc_cons(%490, %491) : (i64, i64) -> i64
      %493 = func.call @cc_values_pack(%492) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %494 = arith.addi %490, %__rlasp_stack_elide_zero_24 : i64
      %495 = func.call @cc_nil_value() : () -> i64
      %496 = func.call @cc_errorp(%293) : (i64) -> i64
      %497 = arith.cmpi ne, %496, %495 : i64
      %498 = arith.cmpi eq, %495, %495 : i64
      %499 = arith.andi %497, %498 : i1
      %500 = scf.if %499 -> (i64) {
        scf.yield %293 : i64
      } else {
        scf.yield %495 : i64
      }
      %501 = func.call @cc_errorp(%380) : (i64) -> i64
      %502 = arith.cmpi ne, %501, %495 : i64
      %503 = arith.cmpi eq, %500, %495 : i64
      %504 = arith.andi %502, %503 : i1
      %505 = scf.if %504 -> (i64) {
        scf.yield %380 : i64
      } else {
        scf.yield %500 : i64
      }
      %506 = func.call @cc_errorp(%439) : (i64) -> i64
      %507 = arith.cmpi ne, %506, %495 : i64
      %508 = arith.cmpi eq, %505, %495 : i64
      %509 = arith.andi %507, %508 : i1
      %510 = scf.if %509 -> (i64) {
        scf.yield %439 : i64
      } else {
        scf.yield %505 : i64
      }
      %511 = func.call @cc_errorp(%464) : (i64) -> i64
      %512 = arith.cmpi ne, %511, %495 : i64
      %513 = arith.cmpi eq, %510, %495 : i64
      %514 = arith.andi %512, %513 : i1
      %515 = scf.if %514 -> (i64) {
        scf.yield %464 : i64
      } else {
        scf.yield %510 : i64
      }
      %516 = func.call @cc_errorp(%471) : (i64) -> i64
      %517 = arith.cmpi ne, %516, %495 : i64
      %518 = arith.cmpi eq, %515, %495 : i64
      %519 = arith.andi %517, %518 : i1
      %520 = scf.if %519 -> (i64) {
        scf.yield %471 : i64
      } else {
        scf.yield %515 : i64
      }
      %521 = func.call @cc_errorp(%475) : (i64) -> i64
      %522 = arith.cmpi ne, %521, %495 : i64
      %523 = arith.cmpi eq, %520, %495 : i64
      %524 = arith.andi %522, %523 : i1
      %525 = scf.if %524 -> (i64) {
        scf.yield %475 : i64
      } else {
        scf.yield %520 : i64
      }
      %526 = func.call @cc_errorp(%482) : (i64) -> i64
      %527 = arith.cmpi ne, %526, %495 : i64
      %528 = arith.cmpi eq, %525, %495 : i64
      %529 = arith.andi %527, %528 : i1
      %530 = scf.if %529 -> (i64) {
        scf.yield %482 : i64
      } else {
        scf.yield %525 : i64
      }
      %531 = func.call @cc_errorp(%494) : (i64) -> i64
      %532 = arith.cmpi ne, %531, %495 : i64
      %533 = arith.cmpi eq, %530, %495 : i64
      %534 = arith.andi %532, %533 : i1
      %535 = scf.if %534 -> (i64) {
        scf.yield %494 : i64
      } else {
        scf.yield %530 : i64
      }
      %536 = arith.cmpi ne, %535, %495 : i64
      scf.if %536 {
        func.call @stack_push_pointer(%535) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%293) : (i64) -> ()
        func.call @stack_push_pointer(%380) : (i64) -> ()
        func.call @stack_push_pointer(%439) : (i64) -> ()
        func.call @stack_push_pointer(%464) : (i64) -> ()
        func.call @stack_push_pointer(%471) : (i64) -> ()
        func.call @stack_push_pointer(%475) : (i64) -> ()
        func.call @stack_push_pointer(%482) : (i64) -> ()
        func.call @stack_push_pointer(%494) : (i64) -> ()
        %537 = llvm.mlir.addressof @str41 : !llvm.ptr
        %538 = func.call @cc_make_function_ref_const(%537) : (!llvm.ptr) -> i64
        %539 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%538, %539) : (i64, i64) -> ()
      }
      %540 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %540 : i64
    }
    %541 = func.call @cc_nil_value() : () -> i64
    %542 = func.call @cc_errorp(%284) : (i64) -> i64
    %543 = arith.cmpi ne, %542, %541 : i64
    %544 = scf.if %543 -> (i64) {
      scf.yield %284 : i64
    } else {
      %545 = llvm.mlir.addressof @str42 : !llvm.ptr
      %546 = arith.constant 24 : i64
      %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
      %548 = func.call @cc_nil_value() : () -> i64
      %549 = func.call @cc_intern(%547, %548) : (i64, i64) -> i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_values_pack(%551) : (i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %553 = arith.addi %549, %__rlasp_stack_elide_zero_25 : i64
      %554 = llvm.mlir.addressof @str43 : !llvm.ptr
      %555 = arith.constant 13 : i64
      %556 = func.call @cc_make_string(%554, %555) : (!llvm.ptr, i64) -> i64
      %557 = llvm.mlir.addressof @str44 : !llvm.ptr
      %558 = arith.constant 11 : i64
      %559 = func.call @cc_make_string(%557, %558) : (!llvm.ptr, i64) -> i64
      %560 = func.call @cc_intern(%556, %559) : (i64, i64) -> i64
      %561 = func.call @cc_nil_value() : () -> i64
      %562 = func.call @cc_cons(%560, %561) : (i64, i64) -> i64
      %563 = func.call @cc_values_pack(%562) : (i64) -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      %564 = llvm.mlir.addressof @str45 : !llvm.ptr
      %565 = arith.constant 6 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = func.call @cc_nil_value() : () -> i64
      %568 = func.call @cc_intern(%566, %567) : (i64, i64) -> i64
      %569 = func.call @cc_nil_value() : () -> i64
      %570 = func.call @cc_cons(%568, %569) : (i64, i64) -> i64
      %571 = func.call @cc_values_pack(%570) : (i64) -> i64
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %572 = llvm.mlir.addressof @str46 : !llvm.ptr
      %573 = arith.constant 19 : i64
      %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
      %575 = func.call @cc_nil_value() : () -> i64
      %576 = func.call @cc_intern(%574, %575) : (i64, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_cons(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_values_pack(%578) : (i64) -> i64
      func.call @stack_push_pointer(%576) : (i64) -> ()
      %580 = llvm.mlir.addressof @str47 : !llvm.ptr
      %581 = arith.constant 11 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = llvm.mlir.addressof @str48 : !llvm.ptr
      %584 = arith.constant 11 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_intern(%582, %585) : (i64, i64) -> i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = func.call @cc_cons(%586, %587) : (i64, i64) -> i64
      %589 = func.call @cc_values_pack(%588) : (i64) -> i64
      func.call @stack_push_pointer(%586) : (i64) -> ()
      %590 = arith.constant 65 : i64
      %591 = func.call @cc_box_character(%590) : (i64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = func.call @stack_pop_pointer() : () -> i64
      %594 = func.call @cc_cons(%593, %592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %595 = arith.addi %594, %__rlasp_stack_elide_zero_26 : i64
      %596 = func.call @stack_pop_pointer() : () -> i64
      %597 = func.call @cc_cons(%596, %595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = func.call @stack_pop_pointer() : () -> i64
      %600 = func.call @cc_cons(%599, %598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %601 = arith.addi %600, %__rlasp_stack_elide_zero_27 : i64
      %602 = func.call @stack_pop_pointer() : () -> i64
      %603 = func.call @cc_cons(%602, %601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @stack_pop_pointer() : () -> i64
      %606 = func.call @cc_cons(%605, %604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %607 = arith.addi %606, %__rlasp_stack_elide_zero_28 : i64
      %608 = func.call @stack_pop_pointer() : () -> i64
      %609 = func.call @cc_cons(%608, %607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %610 = arith.addi %609, %__rlasp_stack_elide_zero_29 : i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %616 = arith.addi %615, %__rlasp_stack_elide_zero_30 : i64
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = func.call @cc_cons(%617, %616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %619 = arith.addi %618, %__rlasp_stack_elide_zero_31 : i64
      %667 = arith.constant 116254966808579 : i64
      %668 = arith.constant 0 : i64
      %669 = func.call @cc_make_closure(%667, %668) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %670 = arith.addi %669, %__rlasp_stack_elide_zero_32 : i64
      %671 = llvm.mlir.addressof @str49 : !llvm.ptr
      %672 = arith.constant 4 : i64
      %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
      %674 = func.call @cc_nil_value() : () -> i64
      %675 = func.call @cc_intern(%673, %674) : (i64, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_values_pack(%677) : (i64) -> i64
      func.call @stack_push_pointer(%675) : (i64) -> ()
      %679 = llvm.mlir.addressof @str50 : !llvm.ptr
      %680 = arith.constant 10 : i64
      %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
      %682 = llvm.mlir.addressof @str51 : !llvm.ptr
      %683 = arith.constant 11 : i64
      %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
      %685 = func.call @cc_intern(%681, %684) : (i64, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_values_pack(%687) : (i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %689 = func.call @stack_pop_pointer() : () -> i64
      %690 = func.call @stack_pop_pointer() : () -> i64
      %691 = func.call @cc_cons(%690, %689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %692 = arith.addi %691, %__rlasp_stack_elide_zero_33 : i64
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @cc_cons(%693, %692) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %695 = arith.addi %694, %__rlasp_stack_elide_zero_34 : i64
      %696 = llvm.mlir.addressof @str52 : !llvm.ptr
      %697 = arith.constant 11 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = llvm.mlir.addressof @str53 : !llvm.ptr
      %700 = arith.constant 7 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_intern(%698, %701) : (i64, i64) -> i64
      %703 = func.call @cc_nil_value() : () -> i64
      %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
      %705 = func.call @cc_values_pack(%704) : (i64) -> i64
      %706 = func.call @cc_nil_value() : () -> i64
      %707 = llvm.mlir.addressof @str54 : !llvm.ptr
      %708 = arith.constant 4 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = llvm.mlir.addressof @str55 : !llvm.ptr
      %711 = arith.constant 7 : i64
      %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
      %713 = func.call @cc_intern(%709, %712) : (i64, i64) -> i64
      %714 = func.call @cc_nil_value() : () -> i64
      %715 = func.call @cc_cons(%713, %714) : (i64, i64) -> i64
      %716 = func.call @cc_values_pack(%715) : (i64) -> i64
      %717 = llvm.mlir.addressof @str56 : !llvm.ptr
      %718 = arith.constant 5 : i64
      %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_intern(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_values_pack(%723) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %725 = arith.addi %721, %__rlasp_stack_elide_zero_35 : i64
      %726 = func.call @cc_nil_value() : () -> i64
      %727 = func.call @cc_errorp(%553) : (i64) -> i64
      %728 = arith.cmpi ne, %727, %726 : i64
      %729 = arith.cmpi eq, %726, %726 : i64
      %730 = arith.andi %728, %729 : i1
      %731 = scf.if %730 -> (i64) {
        scf.yield %553 : i64
      } else {
        scf.yield %726 : i64
      }
      %732 = func.call @cc_errorp(%619) : (i64) -> i64
      %733 = arith.cmpi ne, %732, %726 : i64
      %734 = arith.cmpi eq, %731, %726 : i64
      %735 = arith.andi %733, %734 : i1
      %736 = scf.if %735 -> (i64) {
        scf.yield %619 : i64
      } else {
        scf.yield %731 : i64
      }
      %737 = func.call @cc_errorp(%670) : (i64) -> i64
      %738 = arith.cmpi ne, %737, %726 : i64
      %739 = arith.cmpi eq, %736, %726 : i64
      %740 = arith.andi %738, %739 : i1
      %741 = scf.if %740 -> (i64) {
        scf.yield %670 : i64
      } else {
        scf.yield %736 : i64
      }
      %742 = func.call @cc_errorp(%695) : (i64) -> i64
      %743 = arith.cmpi ne, %742, %726 : i64
      %744 = arith.cmpi eq, %741, %726 : i64
      %745 = arith.andi %743, %744 : i1
      %746 = scf.if %745 -> (i64) {
        scf.yield %695 : i64
      } else {
        scf.yield %741 : i64
      }
      %747 = func.call @cc_errorp(%702) : (i64) -> i64
      %748 = arith.cmpi ne, %747, %726 : i64
      %749 = arith.cmpi eq, %746, %726 : i64
      %750 = arith.andi %748, %749 : i1
      %751 = scf.if %750 -> (i64) {
        scf.yield %702 : i64
      } else {
        scf.yield %746 : i64
      }
      %752 = func.call @cc_errorp(%706) : (i64) -> i64
      %753 = arith.cmpi ne, %752, %726 : i64
      %754 = arith.cmpi eq, %751, %726 : i64
      %755 = arith.andi %753, %754 : i1
      %756 = scf.if %755 -> (i64) {
        scf.yield %706 : i64
      } else {
        scf.yield %751 : i64
      }
      %757 = func.call @cc_errorp(%713) : (i64) -> i64
      %758 = arith.cmpi ne, %757, %726 : i64
      %759 = arith.cmpi eq, %756, %726 : i64
      %760 = arith.andi %758, %759 : i1
      %761 = scf.if %760 -> (i64) {
        scf.yield %713 : i64
      } else {
        scf.yield %756 : i64
      }
      %762 = func.call @cc_errorp(%725) : (i64) -> i64
      %763 = arith.cmpi ne, %762, %726 : i64
      %764 = arith.cmpi eq, %761, %726 : i64
      %765 = arith.andi %763, %764 : i1
      %766 = scf.if %765 -> (i64) {
        scf.yield %725 : i64
      } else {
        scf.yield %761 : i64
      }
      %767 = arith.cmpi ne, %766, %726 : i64
      scf.if %767 {
        func.call @stack_push_pointer(%766) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%553) : (i64) -> ()
        func.call @stack_push_pointer(%619) : (i64) -> ()
        func.call @stack_push_pointer(%670) : (i64) -> ()
        func.call @stack_push_pointer(%695) : (i64) -> ()
        func.call @stack_push_pointer(%702) : (i64) -> ()
        func.call @stack_push_pointer(%706) : (i64) -> ()
        func.call @stack_push_pointer(%713) : (i64) -> ()
        func.call @stack_push_pointer(%725) : (i64) -> ()
        %768 = llvm.mlir.addressof @str57 : !llvm.ptr
        %769 = func.call @cc_make_function_ref_const(%768) : (!llvm.ptr) -> i64
        %770 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%769, %770) : (i64, i64) -> ()
      }
      %771 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %771 : i64
    }
    %772 = func.call @cc_nil_value() : () -> i64
    %773 = func.call @cc_errorp(%544) : (i64) -> i64
    %774 = arith.cmpi ne, %773, %772 : i64
    %775 = scf.if %774 -> (i64) {
      scf.yield %544 : i64
    } else {
      %776 = llvm.mlir.addressof @str58 : !llvm.ptr
      %777 = arith.constant 18 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      %779 = func.call @cc_nil_value() : () -> i64
      %780 = func.call @cc_intern(%778, %779) : (i64, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_cons(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_values_pack(%782) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %784 = arith.addi %780, %__rlasp_stack_elide_zero_36 : i64
      %785 = llvm.mlir.addressof @str59 : !llvm.ptr
      %786 = arith.constant 6 : i64
      %787 = func.call @cc_make_string(%785, %786) : (!llvm.ptr, i64) -> i64
      %788 = func.call @cc_nil_value() : () -> i64
      %789 = func.call @cc_intern(%787, %788) : (i64, i64) -> i64
      %790 = func.call @cc_nil_value() : () -> i64
      %791 = func.call @cc_cons(%789, %790) : (i64, i64) -> i64
      %792 = func.call @cc_values_pack(%791) : (i64) -> i64
      func.call @stack_push_pointer(%789) : (i64) -> ()
      %793 = llvm.mlir.addressof @str60 : !llvm.ptr
      %794 = arith.constant 11 : i64
      %795 = func.call @cc_make_string(%793, %794) : (!llvm.ptr, i64) -> i64
      %796 = llvm.mlir.addressof @str61 : !llvm.ptr
      %797 = arith.constant 11 : i64
      %798 = func.call @cc_make_string(%796, %797) : (!llvm.ptr, i64) -> i64
      %799 = func.call @cc_intern(%795, %798) : (i64, i64) -> i64
      %800 = func.call @cc_nil_value() : () -> i64
      %801 = func.call @cc_cons(%799, %800) : (i64, i64) -> i64
      %802 = func.call @cc_values_pack(%801) : (i64) -> i64
      func.call @stack_push_pointer(%799) : (i64) -> ()
      %803 = llvm.mlir.addressof @str62 : !llvm.ptr
      %804 = arith.constant 5 : i64
      %805 = func.call @cc_make_string(%803, %804) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = func.call @stack_pop_pointer() : () -> i64
      %808 = func.call @cc_cons(%807, %806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %809 = arith.addi %808, %__rlasp_stack_elide_zero_37 : i64
      %810 = func.call @stack_pop_pointer() : () -> i64
      %811 = func.call @cc_cons(%810, %809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%811) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %812 = func.call @stack_pop_pointer() : () -> i64
      %813 = func.call @stack_pop_pointer() : () -> i64
      %814 = func.call @cc_cons(%813, %812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %815 = arith.addi %814, %__rlasp_stack_elide_zero_38 : i64
      %816 = func.call @stack_pop_pointer() : () -> i64
      %817 = func.call @cc_cons(%816, %815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %818 = arith.addi %817, %__rlasp_stack_elide_zero_39 : i64
      %835 = arith.constant 116254966808580 : i64
      %836 = arith.constant 0 : i64
      %837 = func.call @cc_make_closure(%835, %836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %838 = arith.addi %837, %__rlasp_stack_elide_zero_40 : i64
      %839 = llvm.mlir.addressof @str64 : !llvm.ptr
      %840 = arith.constant 6 : i64
      %841 = func.call @cc_make_string(%839, %840) : (!llvm.ptr, i64) -> i64
      %842 = llvm.mlir.addressof @str65 : !llvm.ptr
      %843 = arith.constant 11 : i64
      %844 = func.call @cc_make_string(%842, %843) : (!llvm.ptr, i64) -> i64
      %845 = func.call @cc_intern(%841, %844) : (i64, i64) -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
      %848 = func.call @cc_values_pack(%847) : (i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_cons(%850, %849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %852 = arith.addi %851, %__rlasp_stack_elide_zero_41 : i64
      %853 = llvm.mlir.addressof @str66 : !llvm.ptr
      %854 = arith.constant 11 : i64
      %855 = func.call @cc_make_string(%853, %854) : (!llvm.ptr, i64) -> i64
      %856 = llvm.mlir.addressof @str67 : !llvm.ptr
      %857 = arith.constant 7 : i64
      %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
      %859 = func.call @cc_intern(%855, %858) : (i64, i64) -> i64
      %860 = func.call @cc_nil_value() : () -> i64
      %861 = func.call @cc_cons(%859, %860) : (i64, i64) -> i64
      %862 = func.call @cc_values_pack(%861) : (i64) -> i64
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = llvm.mlir.addressof @str68 : !llvm.ptr
      %865 = arith.constant 4 : i64
      %866 = func.call @cc_make_string(%864, %865) : (!llvm.ptr, i64) -> i64
      %867 = llvm.mlir.addressof @str69 : !llvm.ptr
      %868 = arith.constant 7 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = func.call @cc_intern(%866, %869) : (i64, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_cons(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_values_pack(%872) : (i64) -> i64
      %874 = llvm.mlir.addressof @str70 : !llvm.ptr
      %875 = arith.constant 5 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = func.call @cc_nil_value() : () -> i64
      %878 = func.call @cc_intern(%876, %877) : (i64, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_values_pack(%880) : (i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %882 = arith.addi %878, %__rlasp_stack_elide_zero_42 : i64
      %883 = func.call @cc_nil_value() : () -> i64
      %884 = func.call @cc_errorp(%784) : (i64) -> i64
      %885 = arith.cmpi ne, %884, %883 : i64
      %886 = arith.cmpi eq, %883, %883 : i64
      %887 = arith.andi %885, %886 : i1
      %888 = scf.if %887 -> (i64) {
        scf.yield %784 : i64
      } else {
        scf.yield %883 : i64
      }
      %889 = func.call @cc_errorp(%818) : (i64) -> i64
      %890 = arith.cmpi ne, %889, %883 : i64
      %891 = arith.cmpi eq, %888, %883 : i64
      %892 = arith.andi %890, %891 : i1
      %893 = scf.if %892 -> (i64) {
        scf.yield %818 : i64
      } else {
        scf.yield %888 : i64
      }
      %894 = func.call @cc_errorp(%838) : (i64) -> i64
      %895 = arith.cmpi ne, %894, %883 : i64
      %896 = arith.cmpi eq, %893, %883 : i64
      %897 = arith.andi %895, %896 : i1
      %898 = scf.if %897 -> (i64) {
        scf.yield %838 : i64
      } else {
        scf.yield %893 : i64
      }
      %899 = func.call @cc_errorp(%852) : (i64) -> i64
      %900 = arith.cmpi ne, %899, %883 : i64
      %901 = arith.cmpi eq, %898, %883 : i64
      %902 = arith.andi %900, %901 : i1
      %903 = scf.if %902 -> (i64) {
        scf.yield %852 : i64
      } else {
        scf.yield %898 : i64
      }
      %904 = func.call @cc_errorp(%859) : (i64) -> i64
      %905 = arith.cmpi ne, %904, %883 : i64
      %906 = arith.cmpi eq, %903, %883 : i64
      %907 = arith.andi %905, %906 : i1
      %908 = scf.if %907 -> (i64) {
        scf.yield %859 : i64
      } else {
        scf.yield %903 : i64
      }
      %909 = func.call @cc_errorp(%863) : (i64) -> i64
      %910 = arith.cmpi ne, %909, %883 : i64
      %911 = arith.cmpi eq, %908, %883 : i64
      %912 = arith.andi %910, %911 : i1
      %913 = scf.if %912 -> (i64) {
        scf.yield %863 : i64
      } else {
        scf.yield %908 : i64
      }
      %914 = func.call @cc_errorp(%870) : (i64) -> i64
      %915 = arith.cmpi ne, %914, %883 : i64
      %916 = arith.cmpi eq, %913, %883 : i64
      %917 = arith.andi %915, %916 : i1
      %918 = scf.if %917 -> (i64) {
        scf.yield %870 : i64
      } else {
        scf.yield %913 : i64
      }
      %919 = func.call @cc_errorp(%882) : (i64) -> i64
      %920 = arith.cmpi ne, %919, %883 : i64
      %921 = arith.cmpi eq, %918, %883 : i64
      %922 = arith.andi %920, %921 : i1
      %923 = scf.if %922 -> (i64) {
        scf.yield %882 : i64
      } else {
        scf.yield %918 : i64
      }
      %924 = arith.cmpi ne, %923, %883 : i64
      scf.if %924 {
        func.call @stack_push_pointer(%923) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%784) : (i64) -> ()
        func.call @stack_push_pointer(%818) : (i64) -> ()
        func.call @stack_push_pointer(%838) : (i64) -> ()
        func.call @stack_push_pointer(%852) : (i64) -> ()
        func.call @stack_push_pointer(%859) : (i64) -> ()
        func.call @stack_push_pointer(%863) : (i64) -> ()
        func.call @stack_push_pointer(%870) : (i64) -> ()
        func.call @stack_push_pointer(%882) : (i64) -> ()
        %925 = llvm.mlir.addressof @str71 : !llvm.ptr
        %926 = func.call @cc_make_function_ref_const(%925) : (!llvm.ptr) -> i64
        %927 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%926, %927) : (i64, i64) -> ()
      }
      %928 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %928 : i64
    }
    %929 = func.call @cc_nil_value() : () -> i64
    %930 = func.call @cc_errorp(%775) : (i64) -> i64
    %931 = arith.cmpi ne, %930, %929 : i64
    %932 = scf.if %931 -> (i64) {
      scf.yield %775 : i64
    } else {
      %933 = llvm.mlir.addressof @str72 : !llvm.ptr
      %934 = arith.constant 18 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = func.call @cc_nil_value() : () -> i64
      %937 = func.call @cc_intern(%935, %936) : (i64, i64) -> i64
      %938 = func.call @cc_nil_value() : () -> i64
      %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
      %940 = func.call @cc_values_pack(%939) : (i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %941 = arith.addi %937, %__rlasp_stack_elide_zero_43 : i64
      %942 = llvm.mlir.addressof @str73 : !llvm.ptr
      %943 = arith.constant 6 : i64
      %944 = func.call @cc_make_string(%942, %943) : (!llvm.ptr, i64) -> i64
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_intern(%944, %945) : (i64, i64) -> i64
      %947 = func.call @cc_nil_value() : () -> i64
      %948 = func.call @cc_cons(%946, %947) : (i64, i64) -> i64
      %949 = func.call @cc_values_pack(%948) : (i64) -> i64
      func.call @stack_push_pointer(%946) : (i64) -> ()
      %950 = llvm.mlir.addressof @str74 : !llvm.ptr
      %951 = arith.constant 11 : i64
      %952 = func.call @cc_make_string(%950, %951) : (!llvm.ptr, i64) -> i64
      %953 = llvm.mlir.addressof @str75 : !llvm.ptr
      %954 = arith.constant 11 : i64
      %955 = func.call @cc_make_string(%953, %954) : (!llvm.ptr, i64) -> i64
      %956 = func.call @cc_intern(%952, %955) : (i64, i64) -> i64
      %957 = func.call @cc_nil_value() : () -> i64
      %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
      %959 = func.call @cc_values_pack(%958) : (i64) -> i64
      func.call @stack_push_pointer(%956) : (i64) -> ()
      %960 = llvm.mlir.addressof @str76 : !llvm.ptr
      %961 = arith.constant 10 : i64
      %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
      %963 = llvm.mlir.addressof @str77 : !llvm.ptr
      %964 = arith.constant 11 : i64
      %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
      %966 = func.call @cc_intern(%962, %965) : (i64, i64) -> i64
      %967 = func.call @cc_nil_value() : () -> i64
      %968 = func.call @cc_cons(%966, %967) : (i64, i64) -> i64
      %969 = func.call @cc_values_pack(%968) : (i64) -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      %970 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%970) : (i64) -> ()
      %971 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %972 = func.call @stack_pop_pointer() : () -> i64
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @cc_cons(%973, %972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %975 = arith.addi %974, %__rlasp_stack_elide_zero_44 : i64
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @cc_cons(%975, %976) : (i64, i64) -> i64
      %978 = llvm.mlir.addressof @str78 : !llvm.ptr
      %979 = arith.constant 5 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_intern(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      %986 = func.call @cc_cons(%982, %977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %987 = llvm.mlir.addressof @str79 : !llvm.ptr
      %988 = arith.constant 16 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = llvm.mlir.addressof @str80 : !llvm.ptr
      %991 = arith.constant 7 : i64
      %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
      %993 = func.call @cc_intern(%989, %992) : (i64, i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
      %996 = func.call @cc_values_pack(%995) : (i64) -> i64
      func.call @stack_push_pointer(%993) : (i64) -> ()
      %997 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %998 = arith.constant 65 : i64
      %999 = func.call @cc_box_character(%998) : (i64) -> i64
      func.call @stack_push_pointer(%999) : (i64) -> ()
      %1000 = arith.constant 66 : i64
      %1001 = func.call @cc_box_character(%1000) : (i64) -> i64
      func.call @stack_push_pointer(%1001) : (i64) -> ()
      %1002 = arith.constant 67 : i64
      %1003 = func.call @cc_box_character(%1002) : (i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1004 = arith.constant 68 : i64
      %1005 = func.call @cc_box_character(%1004) : (i64) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1006 = arith.constant 69 : i64
      %1007 = func.call @cc_box_character(%1006) : (i64) -> i64
      func.call @stack_push_pointer(%1007) : (i64) -> ()
      %1008 = arith.constant 70 : i64
      %1009 = func.call @cc_box_character(%1008) : (i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @cc_cons(%1011, %1010) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1013 = arith.addi %1012, %__rlasp_stack_elide_zero_45 : i64
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @cc_cons(%1014, %1013) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1016 = arith.addi %1015, %__rlasp_stack_elide_zero_46 : i64
      %1017 = func.call @stack_pop_pointer() : () -> i64
      %1018 = func.call @cc_cons(%1017, %1016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1019 = arith.addi %1018, %__rlasp_stack_elide_zero_47 : i64
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @cc_cons(%1020, %1019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1022 = arith.addi %1021, %__rlasp_stack_elide_zero_48 : i64
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = func.call @cc_cons(%1023, %1022) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1025 = arith.addi %1024, %__rlasp_stack_elide_zero_49 : i64
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @cc_cons(%1026, %1025) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1028 = arith.addi %1027, %__rlasp_stack_elide_zero_50 : i64
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @cc_cons(%1028, %1029) : (i64, i64) -> i64
      %1031 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1032 = arith.constant 5 : i64
      %1033 = func.call @cc_make_string(%1031, %1032) : (!llvm.ptr, i64) -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_intern(%1033, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_cons(%1035, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_values_pack(%1037) : (i64) -> i64
      %1039 = func.call @cc_cons(%1035, %1030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1039) : (i64) -> ()
      %1040 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1041 = arith.constant 12 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1044 = arith.constant 7 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = func.call @cc_intern(%1042, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1050 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      %1051 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1052 = arith.constant 9 : i64
      %1053 = func.call @cc_make_string(%1051, %1052) : (!llvm.ptr, i64) -> i64
      %1054 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1055 = arith.constant 11 : i64
      %1056 = func.call @cc_make_string(%1054, %1055) : (!llvm.ptr, i64) -> i64
      %1057 = func.call @cc_intern(%1053, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_nil_value() : () -> i64
      %1059 = func.call @cc_cons(%1057, %1058) : (i64, i64) -> i64
      %1060 = func.call @cc_values_pack(%1059) : (i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1061 = arith.addi %1057, %__rlasp_stack_elide_zero_51 : i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1061, %1062) : (i64, i64) -> i64
      %1064 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1065 = arith.constant 5 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = func.call @cc_nil_value() : () -> i64
      %1068 = func.call @cc_intern(%1066, %1067) : (i64, i64) -> i64
      %1069 = func.call @cc_nil_value() : () -> i64
      %1070 = func.call @cc_cons(%1068, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_values_pack(%1070) : (i64) -> i64
      %1072 = func.call @cc_cons(%1068, %1063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1073 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1074 = arith.constant 12 : i64
      %1075 = func.call @cc_make_string(%1073, %1074) : (!llvm.ptr, i64) -> i64
      %1076 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1077 = arith.constant 7 : i64
      %1078 = func.call @cc_make_string(%1076, %1077) : (!llvm.ptr, i64) -> i64
      %1079 = func.call @cc_intern(%1075, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_cons(%1079, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_values_pack(%1081) : (i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      %1083 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1084 = func.call @stack_pop_pointer() : () -> i64
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @cc_cons(%1085, %1084) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1087 = arith.addi %1086, %__rlasp_stack_elide_zero_52 : i64
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @cc_cons(%1088, %1087) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1090 = arith.addi %1089, %__rlasp_stack_elide_zero_53 : i64
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @cc_cons(%1091, %1090) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1093 = arith.addi %1092, %__rlasp_stack_elide_zero_54 : i64
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @cc_cons(%1094, %1093) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1096 = arith.addi %1095, %__rlasp_stack_elide_zero_55 : i64
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_cons(%1097, %1096) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1099 = arith.addi %1098, %__rlasp_stack_elide_zero_56 : i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1100, %1099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1102 = arith.addi %1101, %__rlasp_stack_elide_zero_57 : i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1103, %1102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1105 = arith.addi %1104, %__rlasp_stack_elide_zero_58 : i64
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @cc_cons(%1106, %1105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1108 = func.call @stack_pop_pointer() : () -> i64
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @cc_cons(%1109, %1108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1111 = arith.addi %1110, %__rlasp_stack_elide_zero_59 : i64
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @cc_cons(%1112, %1111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1114 = func.call @stack_pop_pointer() : () -> i64
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @cc_cons(%1115, %1114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1117 = arith.addi %1116, %__rlasp_stack_elide_zero_60 : i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1118, %1117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1120 = arith.addi %1119, %__rlasp_stack_elide_zero_61 : i64
      %1253 = arith.constant 116254966808581 : i64
      %1254 = arith.constant 0 : i64
      %1255 = func.call @cc_make_closure(%1253, %1254) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1256 = arith.addi %1255, %__rlasp_stack_elide_zero_62 : i64
      %1257 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1258 = arith.constant 6 : i64
      %1259 = func.call @cc_make_string(%1257, %1258) : (!llvm.ptr, i64) -> i64
      %1260 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1261 = arith.constant 11 : i64
      %1262 = func.call @cc_make_string(%1260, %1261) : (!llvm.ptr, i64) -> i64
      %1263 = func.call @cc_intern(%1259, %1262) : (i64, i64) -> i64
      %1264 = func.call @cc_nil_value() : () -> i64
      %1265 = func.call @cc_cons(%1263, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_values_pack(%1265) : (i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1268, %1267) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1270 = arith.addi %1269, %__rlasp_stack_elide_zero_63 : i64
      %1271 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1272 = arith.constant 11 : i64
      %1273 = func.call @cc_make_string(%1271, %1272) : (!llvm.ptr, i64) -> i64
      %1274 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1275 = arith.constant 7 : i64
      %1276 = func.call @cc_make_string(%1274, %1275) : (!llvm.ptr, i64) -> i64
      %1277 = func.call @cc_intern(%1273, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_nil_value() : () -> i64
      %1279 = func.call @cc_cons(%1277, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_values_pack(%1279) : (i64) -> i64
      %1281 = func.call @cc_nil_value() : () -> i64
      %1282 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1283 = arith.constant 4 : i64
      %1284 = func.call @cc_make_string(%1282, %1283) : (!llvm.ptr, i64) -> i64
      %1285 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1286 = arith.constant 7 : i64
      %1287 = func.call @cc_make_string(%1285, %1286) : (!llvm.ptr, i64) -> i64
      %1288 = func.call @cc_intern(%1284, %1287) : (i64, i64) -> i64
      %1289 = func.call @cc_nil_value() : () -> i64
      %1290 = func.call @cc_cons(%1288, %1289) : (i64, i64) -> i64
      %1291 = func.call @cc_values_pack(%1290) : (i64) -> i64
      %1292 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1293 = arith.constant 5 : i64
      %1294 = func.call @cc_make_string(%1292, %1293) : (!llvm.ptr, i64) -> i64
      %1295 = func.call @cc_nil_value() : () -> i64
      %1296 = func.call @cc_intern(%1294, %1295) : (i64, i64) -> i64
      %1297 = func.call @cc_nil_value() : () -> i64
      %1298 = func.call @cc_cons(%1296, %1297) : (i64, i64) -> i64
      %1299 = func.call @cc_values_pack(%1298) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1300 = arith.addi %1296, %__rlasp_stack_elide_zero_64 : i64
      %1301 = func.call @cc_nil_value() : () -> i64
      %1302 = func.call @cc_errorp(%941) : (i64) -> i64
      %1303 = arith.cmpi ne, %1302, %1301 : i64
      %1304 = arith.cmpi eq, %1301, %1301 : i64
      %1305 = arith.andi %1303, %1304 : i1
      %1306 = scf.if %1305 -> (i64) {
        scf.yield %941 : i64
      } else {
        scf.yield %1301 : i64
      }
      %1307 = func.call @cc_errorp(%1120) : (i64) -> i64
      %1308 = arith.cmpi ne, %1307, %1301 : i64
      %1309 = arith.cmpi eq, %1306, %1301 : i64
      %1310 = arith.andi %1308, %1309 : i1
      %1311 = scf.if %1310 -> (i64) {
        scf.yield %1120 : i64
      } else {
        scf.yield %1306 : i64
      }
      %1312 = func.call @cc_errorp(%1256) : (i64) -> i64
      %1313 = arith.cmpi ne, %1312, %1301 : i64
      %1314 = arith.cmpi eq, %1311, %1301 : i64
      %1315 = arith.andi %1313, %1314 : i1
      %1316 = scf.if %1315 -> (i64) {
        scf.yield %1256 : i64
      } else {
        scf.yield %1311 : i64
      }
      %1317 = func.call @cc_errorp(%1270) : (i64) -> i64
      %1318 = arith.cmpi ne, %1317, %1301 : i64
      %1319 = arith.cmpi eq, %1316, %1301 : i64
      %1320 = arith.andi %1318, %1319 : i1
      %1321 = scf.if %1320 -> (i64) {
        scf.yield %1270 : i64
      } else {
        scf.yield %1316 : i64
      }
      %1322 = func.call @cc_errorp(%1277) : (i64) -> i64
      %1323 = arith.cmpi ne, %1322, %1301 : i64
      %1324 = arith.cmpi eq, %1321, %1301 : i64
      %1325 = arith.andi %1323, %1324 : i1
      %1326 = scf.if %1325 -> (i64) {
        scf.yield %1277 : i64
      } else {
        scf.yield %1321 : i64
      }
      %1327 = func.call @cc_errorp(%1281) : (i64) -> i64
      %1328 = arith.cmpi ne, %1327, %1301 : i64
      %1329 = arith.cmpi eq, %1326, %1301 : i64
      %1330 = arith.andi %1328, %1329 : i1
      %1331 = scf.if %1330 -> (i64) {
        scf.yield %1281 : i64
      } else {
        scf.yield %1326 : i64
      }
      %1332 = func.call @cc_errorp(%1288) : (i64) -> i64
      %1333 = arith.cmpi ne, %1332, %1301 : i64
      %1334 = arith.cmpi eq, %1331, %1301 : i64
      %1335 = arith.andi %1333, %1334 : i1
      %1336 = scf.if %1335 -> (i64) {
        scf.yield %1288 : i64
      } else {
        scf.yield %1331 : i64
      }
      %1337 = func.call @cc_errorp(%1300) : (i64) -> i64
      %1338 = arith.cmpi ne, %1337, %1301 : i64
      %1339 = arith.cmpi eq, %1336, %1301 : i64
      %1340 = arith.andi %1338, %1339 : i1
      %1341 = scf.if %1340 -> (i64) {
        scf.yield %1300 : i64
      } else {
        scf.yield %1336 : i64
      }
      %1342 = arith.cmpi ne, %1341, %1301 : i64
      scf.if %1342 {
        func.call @stack_push_pointer(%1341) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%941) : (i64) -> ()
        func.call @stack_push_pointer(%1120) : (i64) -> ()
        func.call @stack_push_pointer(%1256) : (i64) -> ()
        func.call @stack_push_pointer(%1270) : (i64) -> ()
        func.call @stack_push_pointer(%1277) : (i64) -> ()
        func.call @stack_push_pointer(%1281) : (i64) -> ()
        func.call @stack_push_pointer(%1288) : (i64) -> ()
        func.call @stack_push_pointer(%1300) : (i64) -> ()
        %1343 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1344 = func.call @cc_make_function_ref_const(%1343) : (!llvm.ptr) -> i64
        %1345 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1344, %1345) : (i64, i64) -> ()
      }
      %1346 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1346 : i64
    }
    %1347 = func.call @cc_nil_value() : () -> i64
    %1348 = func.call @cc_errorp(%932) : (i64) -> i64
    %1349 = arith.cmpi ne, %1348, %1347 : i64
    %1350 = scf.if %1349 -> (i64) {
      scf.yield %932 : i64
    } else {
      %1351 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1352 = arith.constant 12 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      %1354 = func.call @cc_nil_value() : () -> i64
      %1355 = func.call @cc_intern(%1353, %1354) : (i64, i64) -> i64
      %1356 = func.call @cc_nil_value() : () -> i64
      %1357 = func.call @cc_cons(%1355, %1356) : (i64, i64) -> i64
      %1358 = func.call @cc_values_pack(%1357) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1359 = arith.addi %1355, %__rlasp_stack_elide_zero_65 : i64
      %1360 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1361 = arith.constant 13 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1364 = arith.constant 11 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      %1366 = func.call @cc_intern(%1362, %1365) : (i64, i64) -> i64
      %1367 = func.call @cc_nil_value() : () -> i64
      %1368 = func.call @cc_cons(%1366, %1367) : (i64, i64) -> i64
      %1369 = func.call @cc_values_pack(%1368) : (i64) -> i64
      func.call @stack_push_pointer(%1366) : (i64) -> ()
      %1370 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1371 = arith.constant 6 : i64
      %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
      %1373 = func.call @cc_nil_value() : () -> i64
      %1374 = func.call @cc_intern(%1372, %1373) : (i64, i64) -> i64
      %1375 = func.call @cc_nil_value() : () -> i64
      %1376 = func.call @cc_cons(%1374, %1375) : (i64, i64) -> i64
      %1377 = func.call @cc_values_pack(%1376) : (i64) -> i64
      func.call @stack_push_pointer(%1374) : (i64) -> ()
      %1378 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1379 = arith.constant 19 : i64
      %1380 = func.call @cc_make_string(%1378, %1379) : (!llvm.ptr, i64) -> i64
      %1381 = func.call @cc_nil_value() : () -> i64
      %1382 = func.call @cc_intern(%1380, %1381) : (i64, i64) -> i64
      %1383 = func.call @cc_nil_value() : () -> i64
      %1384 = func.call @cc_cons(%1382, %1383) : (i64, i64) -> i64
      %1385 = func.call @cc_values_pack(%1384) : (i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      %1386 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1387 = arith.constant 3 : i64
      %1388 = func.call @cc_make_string(%1386, %1387) : (!llvm.ptr, i64) -> i64
      %1389 = func.call @cc_nil_value() : () -> i64
      %1390 = func.call @cc_intern(%1388, %1389) : (i64, i64) -> i64
      %1391 = func.call @cc_nil_value() : () -> i64
      %1392 = func.call @cc_cons(%1390, %1391) : (i64, i64) -> i64
      %1393 = func.call @cc_values_pack(%1392) : (i64) -> i64
      func.call @stack_push_pointer(%1390) : (i64) -> ()
      %1394 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1395 = arith.constant 3 : i64
      %1396 = func.call @cc_make_string(%1394, %1395) : (!llvm.ptr, i64) -> i64
      %1397 = func.call @cc_nil_value() : () -> i64
      %1398 = func.call @cc_intern(%1396, %1397) : (i64, i64) -> i64
      %1399 = func.call @cc_nil_value() : () -> i64
      %1400 = func.call @cc_cons(%1398, %1399) : (i64, i64) -> i64
      %1401 = func.call @cc_values_pack(%1400) : (i64) -> i64
      func.call @stack_push_pointer(%1398) : (i64) -> ()
      %1402 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1402) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1403 = func.call @stack_pop_pointer() : () -> i64
      %1404 = func.call @stack_pop_pointer() : () -> i64
      %1405 = func.call @cc_cons(%1404, %1403) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1406 = arith.addi %1405, %__rlasp_stack_elide_zero_66 : i64
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = func.call @cc_cons(%1407, %1406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1408) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1409 = func.call @stack_pop_pointer() : () -> i64
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = func.call @cc_cons(%1410, %1409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1411) : (i64) -> ()
      %1412 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1413 = arith.constant 10 : i64
      %1414 = func.call @cc_make_string(%1412, %1413) : (!llvm.ptr, i64) -> i64
      %1415 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1416 = arith.constant 11 : i64
      %1417 = func.call @cc_make_string(%1415, %1416) : (!llvm.ptr, i64) -> i64
      %1418 = func.call @cc_intern(%1414, %1417) : (i64, i64) -> i64
      %1419 = func.call @cc_nil_value() : () -> i64
      %1420 = func.call @cc_cons(%1418, %1419) : (i64, i64) -> i64
      %1421 = func.call @cc_values_pack(%1420) : (i64) -> i64
      func.call @stack_push_pointer(%1418) : (i64) -> ()
      %1422 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1423 = arith.constant 3 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_intern(%1424, %1425) : (i64, i64) -> i64
      %1427 = func.call @cc_nil_value() : () -> i64
      %1428 = func.call @cc_cons(%1426, %1427) : (i64, i64) -> i64
      %1429 = func.call @cc_values_pack(%1428) : (i64) -> i64
      func.call @stack_push_pointer(%1426) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1430 = func.call @stack_pop_pointer() : () -> i64
      %1431 = func.call @stack_pop_pointer() : () -> i64
      %1432 = func.call @cc_cons(%1431, %1430) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1433 = arith.addi %1432, %__rlasp_stack_elide_zero_67 : i64
      %1434 = func.call @stack_pop_pointer() : () -> i64
      %1435 = func.call @cc_cons(%1434, %1433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1435) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1436 = func.call @stack_pop_pointer() : () -> i64
      %1437 = func.call @stack_pop_pointer() : () -> i64
      %1438 = func.call @cc_cons(%1437, %1436) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1439 = arith.addi %1438, %__rlasp_stack_elide_zero_68 : i64
      %1440 = func.call @stack_pop_pointer() : () -> i64
      %1441 = func.call @cc_cons(%1440, %1439) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1442 = arith.addi %1441, %__rlasp_stack_elide_zero_69 : i64
      %1443 = func.call @stack_pop_pointer() : () -> i64
      %1444 = func.call @cc_cons(%1443, %1442) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1444) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1445 = func.call @stack_pop_pointer() : () -> i64
      %1446 = func.call @stack_pop_pointer() : () -> i64
      %1447 = func.call @cc_cons(%1446, %1445) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1448 = arith.addi %1447, %__rlasp_stack_elide_zero_70 : i64
      %1449 = func.call @stack_pop_pointer() : () -> i64
      %1450 = func.call @cc_cons(%1449, %1448) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1450) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @stack_pop_pointer() : () -> i64
      %1453 = func.call @cc_cons(%1452, %1451) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1454 = arith.addi %1453, %__rlasp_stack_elide_zero_71 : i64
      %1455 = func.call @stack_pop_pointer() : () -> i64
      %1456 = func.call @cc_cons(%1455, %1454) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1457 = arith.addi %1456, %__rlasp_stack_elide_zero_72 : i64
      %1458 = func.call @stack_pop_pointer() : () -> i64
      %1459 = func.call @cc_cons(%1458, %1457) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = func.call @stack_pop_pointer() : () -> i64
      %1462 = func.call @cc_cons(%1461, %1460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1463 = arith.addi %1462, %__rlasp_stack_elide_zero_73 : i64
      %1464 = func.call @stack_pop_pointer() : () -> i64
      %1465 = func.call @cc_cons(%1464, %1463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1466 = arith.addi %1465, %__rlasp_stack_elide_zero_74 : i64
      %1520 = arith.constant 116254966808582 : i64
      %1521 = arith.constant 0 : i64
      %1522 = func.call @cc_make_closure(%1520, %1521) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1523 = arith.addi %1522, %__rlasp_stack_elide_zero_75 : i64
      %1524 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1525 = arith.constant 4 : i64
      %1526 = func.call @cc_make_string(%1524, %1525) : (!llvm.ptr, i64) -> i64
      %1527 = func.call @cc_nil_value() : () -> i64
      %1528 = func.call @cc_intern(%1526, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_cons(%1528, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_values_pack(%1530) : (i64) -> i64
      func.call @stack_push_pointer(%1528) : (i64) -> ()
      %1532 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1533 = arith.constant 10 : i64
      %1534 = func.call @cc_make_string(%1532, %1533) : (!llvm.ptr, i64) -> i64
      %1535 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1536 = arith.constant 11 : i64
      %1537 = func.call @cc_make_string(%1535, %1536) : (!llvm.ptr, i64) -> i64
      %1538 = func.call @cc_intern(%1534, %1537) : (i64, i64) -> i64
      %1539 = func.call @cc_nil_value() : () -> i64
      %1540 = func.call @cc_cons(%1538, %1539) : (i64, i64) -> i64
      %1541 = func.call @cc_values_pack(%1540) : (i64) -> i64
      func.call @stack_push_pointer(%1538) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1542 = func.call @stack_pop_pointer() : () -> i64
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1544 = func.call @cc_cons(%1543, %1542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1545 = arith.addi %1544, %__rlasp_stack_elide_zero_76 : i64
      %1546 = func.call @stack_pop_pointer() : () -> i64
      %1547 = func.call @cc_cons(%1546, %1545) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1548 = arith.addi %1547, %__rlasp_stack_elide_zero_77 : i64
      %1549 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1550 = arith.constant 11 : i64
      %1551 = func.call @cc_make_string(%1549, %1550) : (!llvm.ptr, i64) -> i64
      %1552 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1553 = arith.constant 7 : i64
      %1554 = func.call @cc_make_string(%1552, %1553) : (!llvm.ptr, i64) -> i64
      %1555 = func.call @cc_intern(%1551, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_nil_value() : () -> i64
      %1557 = func.call @cc_cons(%1555, %1556) : (i64, i64) -> i64
      %1558 = func.call @cc_values_pack(%1557) : (i64) -> i64
      %1559 = func.call @cc_nil_value() : () -> i64
      %1560 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1561 = arith.constant 4 : i64
      %1562 = func.call @cc_make_string(%1560, %1561) : (!llvm.ptr, i64) -> i64
      %1563 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1564 = arith.constant 7 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = func.call @cc_intern(%1562, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_nil_value() : () -> i64
      %1568 = func.call @cc_cons(%1566, %1567) : (i64, i64) -> i64
      %1569 = func.call @cc_values_pack(%1568) : (i64) -> i64
      %1570 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1571 = arith.constant 5 : i64
      %1572 = func.call @cc_make_string(%1570, %1571) : (!llvm.ptr, i64) -> i64
      %1573 = func.call @cc_nil_value() : () -> i64
      %1574 = func.call @cc_intern(%1572, %1573) : (i64, i64) -> i64
      %1575 = func.call @cc_nil_value() : () -> i64
      %1576 = func.call @cc_cons(%1574, %1575) : (i64, i64) -> i64
      %1577 = func.call @cc_values_pack(%1576) : (i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1578 = arith.addi %1574, %__rlasp_stack_elide_zero_78 : i64
      %1579 = func.call @cc_nil_value() : () -> i64
      %1580 = func.call @cc_errorp(%1359) : (i64) -> i64
      %1581 = arith.cmpi ne, %1580, %1579 : i64
      %1582 = arith.cmpi eq, %1579, %1579 : i64
      %1583 = arith.andi %1581, %1582 : i1
      %1584 = scf.if %1583 -> (i64) {
        scf.yield %1359 : i64
      } else {
        scf.yield %1579 : i64
      }
      %1585 = func.call @cc_errorp(%1466) : (i64) -> i64
      %1586 = arith.cmpi ne, %1585, %1579 : i64
      %1587 = arith.cmpi eq, %1584, %1579 : i64
      %1588 = arith.andi %1586, %1587 : i1
      %1589 = scf.if %1588 -> (i64) {
        scf.yield %1466 : i64
      } else {
        scf.yield %1584 : i64
      }
      %1590 = func.call @cc_errorp(%1523) : (i64) -> i64
      %1591 = arith.cmpi ne, %1590, %1579 : i64
      %1592 = arith.cmpi eq, %1589, %1579 : i64
      %1593 = arith.andi %1591, %1592 : i1
      %1594 = scf.if %1593 -> (i64) {
        scf.yield %1523 : i64
      } else {
        scf.yield %1589 : i64
      }
      %1595 = func.call @cc_errorp(%1548) : (i64) -> i64
      %1596 = arith.cmpi ne, %1595, %1579 : i64
      %1597 = arith.cmpi eq, %1594, %1579 : i64
      %1598 = arith.andi %1596, %1597 : i1
      %1599 = scf.if %1598 -> (i64) {
        scf.yield %1548 : i64
      } else {
        scf.yield %1594 : i64
      }
      %1600 = func.call @cc_errorp(%1555) : (i64) -> i64
      %1601 = arith.cmpi ne, %1600, %1579 : i64
      %1602 = arith.cmpi eq, %1599, %1579 : i64
      %1603 = arith.andi %1601, %1602 : i1
      %1604 = scf.if %1603 -> (i64) {
        scf.yield %1555 : i64
      } else {
        scf.yield %1599 : i64
      }
      %1605 = func.call @cc_errorp(%1559) : (i64) -> i64
      %1606 = arith.cmpi ne, %1605, %1579 : i64
      %1607 = arith.cmpi eq, %1604, %1579 : i64
      %1608 = arith.andi %1606, %1607 : i1
      %1609 = scf.if %1608 -> (i64) {
        scf.yield %1559 : i64
      } else {
        scf.yield %1604 : i64
      }
      %1610 = func.call @cc_errorp(%1566) : (i64) -> i64
      %1611 = arith.cmpi ne, %1610, %1579 : i64
      %1612 = arith.cmpi eq, %1609, %1579 : i64
      %1613 = arith.andi %1611, %1612 : i1
      %1614 = scf.if %1613 -> (i64) {
        scf.yield %1566 : i64
      } else {
        scf.yield %1609 : i64
      }
      %1615 = func.call @cc_errorp(%1578) : (i64) -> i64
      %1616 = arith.cmpi ne, %1615, %1579 : i64
      %1617 = arith.cmpi eq, %1614, %1579 : i64
      %1618 = arith.andi %1616, %1617 : i1
      %1619 = scf.if %1618 -> (i64) {
        scf.yield %1578 : i64
      } else {
        scf.yield %1614 : i64
      }
      %1620 = arith.cmpi ne, %1619, %1579 : i64
      scf.if %1620 {
        func.call @stack_push_pointer(%1619) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1359) : (i64) -> ()
        func.call @stack_push_pointer(%1466) : (i64) -> ()
        func.call @stack_push_pointer(%1523) : (i64) -> ()
        func.call @stack_push_pointer(%1548) : (i64) -> ()
        func.call @stack_push_pointer(%1555) : (i64) -> ()
        func.call @stack_push_pointer(%1559) : (i64) -> ()
        func.call @stack_push_pointer(%1566) : (i64) -> ()
        func.call @stack_push_pointer(%1578) : (i64) -> ()
        %1621 = llvm.mlir.addressof @str124 : !llvm.ptr
        %1622 = func.call @cc_make_function_ref_const(%1621) : (!llvm.ptr) -> i64
        %1623 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1622, %1623) : (i64, i64) -> ()
      }
      %1624 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1624 : i64
    }
    %1625 = func.call @cc_nil_value() : () -> i64
    %1626 = func.call @cc_errorp(%1350) : (i64) -> i64
    %1627 = arith.cmpi ne, %1626, %1625 : i64
    %1628 = scf.if %1627 -> (i64) {
      scf.yield %1350 : i64
    } else {
      %1629 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1630 = arith.constant 8 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_intern(%1631, %1632) : (i64, i64) -> i64
      %1634 = func.call @cc_nil_value() : () -> i64
      %1635 = func.call @cc_cons(%1633, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_values_pack(%1635) : (i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1637 = arith.addi %1633, %__rlasp_stack_elide_zero_79 : i64
      %1638 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1639 = arith.constant 13 : i64
      %1640 = func.call @cc_make_string(%1638, %1639) : (!llvm.ptr, i64) -> i64
      %1641 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1642 = arith.constant 11 : i64
      %1643 = func.call @cc_make_string(%1641, %1642) : (!llvm.ptr, i64) -> i64
      %1644 = func.call @cc_intern(%1640, %1643) : (i64, i64) -> i64
      %1645 = func.call @cc_nil_value() : () -> i64
      %1646 = func.call @cc_cons(%1644, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_values_pack(%1646) : (i64) -> i64
      func.call @stack_push_pointer(%1644) : (i64) -> ()
      %1648 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1649 = arith.constant 6 : i64
      %1650 = func.call @cc_make_string(%1648, %1649) : (!llvm.ptr, i64) -> i64
      %1651 = func.call @cc_nil_value() : () -> i64
      %1652 = func.call @cc_intern(%1650, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      func.call @stack_push_pointer(%1652) : (i64) -> ()
      %1656 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1657 = arith.constant 19 : i64
      %1658 = func.call @cc_make_string(%1656, %1657) : (!llvm.ptr, i64) -> i64
      %1659 = func.call @cc_nil_value() : () -> i64
      %1660 = func.call @cc_intern(%1658, %1659) : (i64, i64) -> i64
      %1661 = func.call @cc_nil_value() : () -> i64
      %1662 = func.call @cc_cons(%1660, %1661) : (i64, i64) -> i64
      %1663 = func.call @cc_values_pack(%1662) : (i64) -> i64
      func.call @stack_push_pointer(%1660) : (i64) -> ()
      %1664 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1665 = arith.constant 6 : i64
      %1666 = func.call @cc_make_string(%1664, %1665) : (!llvm.ptr, i64) -> i64
      %1667 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1668 = arith.constant 11 : i64
      %1669 = func.call @cc_make_string(%1667, %1668) : (!llvm.ptr, i64) -> i64
      %1670 = func.call @cc_intern(%1666, %1669) : (i64, i64) -> i64
      %1671 = func.call @cc_nil_value() : () -> i64
      %1672 = func.call @cc_cons(%1670, %1671) : (i64, i64) -> i64
      %1673 = func.call @cc_values_pack(%1672) : (i64) -> i64
      func.call @stack_push_pointer(%1670) : (i64) -> ()
      %1674 = arith.constant -1 : i64
      func.call @stack_push_fixnum(%1674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1675 = func.call @stack_pop_pointer() : () -> i64
      %1676 = func.call @stack_pop_pointer() : () -> i64
      %1677 = func.call @cc_cons(%1676, %1675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1678 = arith.addi %1677, %__rlasp_stack_elide_zero_80 : i64
      %1679 = func.call @stack_pop_pointer() : () -> i64
      %1680 = func.call @cc_cons(%1679, %1678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1680) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @cc_cons(%1682, %1681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1684 = arith.addi %1683, %__rlasp_stack_elide_zero_81 : i64
      %1685 = func.call @stack_pop_pointer() : () -> i64
      %1686 = func.call @cc_cons(%1685, %1684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @stack_pop_pointer() : () -> i64
      %1689 = func.call @cc_cons(%1688, %1687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1690 = arith.addi %1689, %__rlasp_stack_elide_zero_82 : i64
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @cc_cons(%1691, %1690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1693 = arith.addi %1692, %__rlasp_stack_elide_zero_83 : i64
      %1694 = func.call @stack_pop_pointer() : () -> i64
      %1695 = func.call @cc_cons(%1694, %1693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @stack_pop_pointer() : () -> i64
      %1698 = func.call @cc_cons(%1697, %1696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1699 = arith.addi %1698, %__rlasp_stack_elide_zero_84 : i64
      %1700 = func.call @stack_pop_pointer() : () -> i64
      %1701 = func.call @cc_cons(%1700, %1699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1702 = arith.addi %1701, %__rlasp_stack_elide_zero_85 : i64
      %1749 = arith.constant 116254966808583 : i64
      %1750 = arith.constant 0 : i64
      %1751 = func.call @cc_make_closure(%1749, %1750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1752 = arith.addi %1751, %__rlasp_stack_elide_zero_86 : i64
      %1753 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1754 = arith.constant 4 : i64
      %1755 = func.call @cc_make_string(%1753, %1754) : (!llvm.ptr, i64) -> i64
      %1756 = func.call @cc_nil_value() : () -> i64
      %1757 = func.call @cc_intern(%1755, %1756) : (i64, i64) -> i64
      %1758 = func.call @cc_nil_value() : () -> i64
      %1759 = func.call @cc_cons(%1757, %1758) : (i64, i64) -> i64
      %1760 = func.call @cc_values_pack(%1759) : (i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      %1761 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1762 = arith.constant 10 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1765 = arith.constant 11 : i64
      %1766 = func.call @cc_make_string(%1764, %1765) : (!llvm.ptr, i64) -> i64
      %1767 = func.call @cc_intern(%1763, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_nil_value() : () -> i64
      %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
      %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @stack_pop_pointer() : () -> i64
      %1773 = func.call @cc_cons(%1772, %1771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1774 = arith.addi %1773, %__rlasp_stack_elide_zero_87 : i64
      %1775 = func.call @stack_pop_pointer() : () -> i64
      %1776 = func.call @cc_cons(%1775, %1774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1777 = arith.addi %1776, %__rlasp_stack_elide_zero_88 : i64
      %1778 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1779 = arith.constant 11 : i64
      %1780 = func.call @cc_make_string(%1778, %1779) : (!llvm.ptr, i64) -> i64
      %1781 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1782 = arith.constant 7 : i64
      %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
      %1784 = func.call @cc_intern(%1780, %1783) : (i64, i64) -> i64
      %1785 = func.call @cc_nil_value() : () -> i64
      %1786 = func.call @cc_cons(%1784, %1785) : (i64, i64) -> i64
      %1787 = func.call @cc_values_pack(%1786) : (i64) -> i64
      %1788 = func.call @cc_nil_value() : () -> i64
      %1789 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1790 = arith.constant 4 : i64
      %1791 = func.call @cc_make_string(%1789, %1790) : (!llvm.ptr, i64) -> i64
      %1792 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1793 = arith.constant 7 : i64
      %1794 = func.call @cc_make_string(%1792, %1793) : (!llvm.ptr, i64) -> i64
      %1795 = func.call @cc_intern(%1791, %1794) : (i64, i64) -> i64
      %1796 = func.call @cc_nil_value() : () -> i64
      %1797 = func.call @cc_cons(%1795, %1796) : (i64, i64) -> i64
      %1798 = func.call @cc_values_pack(%1797) : (i64) -> i64
      %1799 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1800 = arith.constant 5 : i64
      %1801 = func.call @cc_make_string(%1799, %1800) : (!llvm.ptr, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_intern(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_cons(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_values_pack(%1805) : (i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1807 = arith.addi %1803, %__rlasp_stack_elide_zero_89 : i64
      %1808 = func.call @cc_nil_value() : () -> i64
      %1809 = func.call @cc_errorp(%1637) : (i64) -> i64
      %1810 = arith.cmpi ne, %1809, %1808 : i64
      %1811 = arith.cmpi eq, %1808, %1808 : i64
      %1812 = arith.andi %1810, %1811 : i1
      %1813 = scf.if %1812 -> (i64) {
        scf.yield %1637 : i64
      } else {
        scf.yield %1808 : i64
      }
      %1814 = func.call @cc_errorp(%1702) : (i64) -> i64
      %1815 = arith.cmpi ne, %1814, %1808 : i64
      %1816 = arith.cmpi eq, %1813, %1808 : i64
      %1817 = arith.andi %1815, %1816 : i1
      %1818 = scf.if %1817 -> (i64) {
        scf.yield %1702 : i64
      } else {
        scf.yield %1813 : i64
      }
      %1819 = func.call @cc_errorp(%1752) : (i64) -> i64
      %1820 = arith.cmpi ne, %1819, %1808 : i64
      %1821 = arith.cmpi eq, %1818, %1808 : i64
      %1822 = arith.andi %1820, %1821 : i1
      %1823 = scf.if %1822 -> (i64) {
        scf.yield %1752 : i64
      } else {
        scf.yield %1818 : i64
      }
      %1824 = func.call @cc_errorp(%1777) : (i64) -> i64
      %1825 = arith.cmpi ne, %1824, %1808 : i64
      %1826 = arith.cmpi eq, %1823, %1808 : i64
      %1827 = arith.andi %1825, %1826 : i1
      %1828 = scf.if %1827 -> (i64) {
        scf.yield %1777 : i64
      } else {
        scf.yield %1823 : i64
      }
      %1829 = func.call @cc_errorp(%1784) : (i64) -> i64
      %1830 = arith.cmpi ne, %1829, %1808 : i64
      %1831 = arith.cmpi eq, %1828, %1808 : i64
      %1832 = arith.andi %1830, %1831 : i1
      %1833 = scf.if %1832 -> (i64) {
        scf.yield %1784 : i64
      } else {
        scf.yield %1828 : i64
      }
      %1834 = func.call @cc_errorp(%1788) : (i64) -> i64
      %1835 = arith.cmpi ne, %1834, %1808 : i64
      %1836 = arith.cmpi eq, %1833, %1808 : i64
      %1837 = arith.andi %1835, %1836 : i1
      %1838 = scf.if %1837 -> (i64) {
        scf.yield %1788 : i64
      } else {
        scf.yield %1833 : i64
      }
      %1839 = func.call @cc_errorp(%1795) : (i64) -> i64
      %1840 = arith.cmpi ne, %1839, %1808 : i64
      %1841 = arith.cmpi eq, %1838, %1808 : i64
      %1842 = arith.andi %1840, %1841 : i1
      %1843 = scf.if %1842 -> (i64) {
        scf.yield %1795 : i64
      } else {
        scf.yield %1838 : i64
      }
      %1844 = func.call @cc_errorp(%1807) : (i64) -> i64
      %1845 = arith.cmpi ne, %1844, %1808 : i64
      %1846 = arith.cmpi eq, %1843, %1808 : i64
      %1847 = arith.andi %1845, %1846 : i1
      %1848 = scf.if %1847 -> (i64) {
        scf.yield %1807 : i64
      } else {
        scf.yield %1843 : i64
      }
      %1849 = arith.cmpi ne, %1848, %1808 : i64
      scf.if %1849 {
        func.call @stack_push_pointer(%1848) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1637) : (i64) -> ()
        func.call @stack_push_pointer(%1702) : (i64) -> ()
        func.call @stack_push_pointer(%1752) : (i64) -> ()
        func.call @stack_push_pointer(%1777) : (i64) -> ()
        func.call @stack_push_pointer(%1784) : (i64) -> ()
        func.call @stack_push_pointer(%1788) : (i64) -> ()
        func.call @stack_push_pointer(%1795) : (i64) -> ()
        func.call @stack_push_pointer(%1807) : (i64) -> ()
        %1850 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1851 = func.call @cc_make_function_ref_const(%1850) : (!llvm.ptr) -> i64
        %1852 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1851, %1852) : (i64, i64) -> ()
      }
      %1853 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1853 : i64
    }
    %1854 = func.call @cc_nil_value() : () -> i64
    %1855 = func.call @cc_errorp(%1628) : (i64) -> i64
    %1856 = arith.cmpi ne, %1855, %1854 : i64
    %1857 = scf.if %1856 -> (i64) {
      scf.yield %1628 : i64
    } else {
      %1858 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1859 = arith.constant 8 : i64
      %1860 = func.call @cc_make_string(%1858, %1859) : (!llvm.ptr, i64) -> i64
      %1861 = func.call @cc_nil_value() : () -> i64
      %1862 = func.call @cc_intern(%1860, %1861) : (i64, i64) -> i64
      %1863 = func.call @cc_nil_value() : () -> i64
      %1864 = func.call @cc_cons(%1862, %1863) : (i64, i64) -> i64
      %1865 = func.call @cc_values_pack(%1864) : (i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1866 = arith.addi %1862, %__rlasp_stack_elide_zero_90 : i64
      %1867 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1868 = arith.constant 13 : i64
      %1869 = func.call @cc_make_string(%1867, %1868) : (!llvm.ptr, i64) -> i64
      %1870 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1871 = arith.constant 11 : i64
      %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
      %1873 = func.call @cc_intern(%1869, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_nil_value() : () -> i64
      %1875 = func.call @cc_cons(%1873, %1874) : (i64, i64) -> i64
      %1876 = func.call @cc_values_pack(%1875) : (i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      %1877 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1878 = arith.constant 6 : i64
      %1879 = func.call @cc_make_string(%1877, %1878) : (!llvm.ptr, i64) -> i64
      %1880 = func.call @cc_nil_value() : () -> i64
      %1881 = func.call @cc_intern(%1879, %1880) : (i64, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_cons(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_values_pack(%1883) : (i64) -> i64
      func.call @stack_push_pointer(%1881) : (i64) -> ()
      %1885 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1886 = arith.constant 19 : i64
      %1887 = func.call @cc_make_string(%1885, %1886) : (!llvm.ptr, i64) -> i64
      %1888 = func.call @cc_nil_value() : () -> i64
      %1889 = func.call @cc_intern(%1887, %1888) : (i64, i64) -> i64
      %1890 = func.call @cc_nil_value() : () -> i64
      %1891 = func.call @cc_cons(%1889, %1890) : (i64, i64) -> i64
      %1892 = func.call @cc_values_pack(%1891) : (i64) -> i64
      func.call @stack_push_pointer(%1889) : (i64) -> ()
      %1893 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1894 = arith.constant 6 : i64
      %1895 = func.call @cc_make_string(%1893, %1894) : (!llvm.ptr, i64) -> i64
      %1896 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1897 = arith.constant 11 : i64
      %1898 = func.call @cc_make_string(%1896, %1897) : (!llvm.ptr, i64) -> i64
      %1899 = func.call @cc_intern(%1895, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_cons(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_values_pack(%1901) : (i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      %1903 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1904 = arith.constant 2 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1907 = arith.constant 11 : i64
      %1908 = func.call @cc_make_string(%1906, %1907) : (!llvm.ptr, i64) -> i64
      %1909 = func.call @cc_intern(%1905, %1908) : (i64, i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = func.call @cc_cons(%1909, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_values_pack(%1911) : (i64) -> i64
      func.call @stack_push_pointer(%1909) : (i64) -> ()
      %1913 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1914 = arith.constant 20 : i64
      %1915 = func.call @cc_make_string(%1913, %1914) : (!llvm.ptr, i64) -> i64
      %1916 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1917 = arith.constant 11 : i64
      %1918 = func.call @cc_make_string(%1916, %1917) : (!llvm.ptr, i64) -> i64
      %1919 = func.call @cc_intern(%1915, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_nil_value() : () -> i64
      %1921 = func.call @cc_cons(%1919, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_values_pack(%1921) : (i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @cc_cons(%1924, %1923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1926 = arith.addi %1925, %__rlasp_stack_elide_zero_91 : i64
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @cc_cons(%1927, %1926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1928) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1929 = func.call @stack_pop_pointer() : () -> i64
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @cc_cons(%1930, %1929) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1932 = arith.addi %1931, %__rlasp_stack_elide_zero_92 : i64
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @cc_cons(%1933, %1932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1935 = func.call @stack_pop_pointer() : () -> i64
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_cons(%1936, %1935) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1938 = arith.addi %1937, %__rlasp_stack_elide_zero_93 : i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1939, %1938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1940) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_cons(%1942, %1941) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1944 = arith.addi %1943, %__rlasp_stack_elide_zero_94 : i64
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_cons(%1945, %1944) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1947 = arith.addi %1946, %__rlasp_stack_elide_zero_95 : i64
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @cc_cons(%1948, %1947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1950 = func.call @stack_pop_pointer() : () -> i64
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_cons(%1951, %1950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1953 = arith.addi %1952, %__rlasp_stack_elide_zero_96 : i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1956 = arith.addi %1955, %__rlasp_stack_elide_zero_97 : i64
      %2040 = arith.constant 116254966808584 : i64
      %2041 = arith.constant 0 : i64
      %2042 = func.call @cc_make_closure(%2040, %2041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2043 = arith.addi %2042, %__rlasp_stack_elide_zero_98 : i64
      %2044 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2045 = arith.constant 4 : i64
      %2046 = func.call @cc_make_string(%2044, %2045) : (!llvm.ptr, i64) -> i64
      %2047 = func.call @cc_nil_value() : () -> i64
      %2048 = func.call @cc_intern(%2046, %2047) : (i64, i64) -> i64
      %2049 = func.call @cc_nil_value() : () -> i64
      %2050 = func.call @cc_cons(%2048, %2049) : (i64, i64) -> i64
      %2051 = func.call @cc_values_pack(%2050) : (i64) -> i64
      func.call @stack_push_pointer(%2048) : (i64) -> ()
      %2052 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2053 = arith.constant 10 : i64
      %2054 = func.call @cc_make_string(%2052, %2053) : (!llvm.ptr, i64) -> i64
      %2055 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2056 = arith.constant 11 : i64
      %2057 = func.call @cc_make_string(%2055, %2056) : (!llvm.ptr, i64) -> i64
      %2058 = func.call @cc_intern(%2054, %2057) : (i64, i64) -> i64
      %2059 = func.call @cc_nil_value() : () -> i64
      %2060 = func.call @cc_cons(%2058, %2059) : (i64, i64) -> i64
      %2061 = func.call @cc_values_pack(%2060) : (i64) -> i64
      func.call @stack_push_pointer(%2058) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2062 = func.call @stack_pop_pointer() : () -> i64
      %2063 = func.call @stack_pop_pointer() : () -> i64
      %2064 = func.call @cc_cons(%2063, %2062) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2065 = arith.addi %2064, %__rlasp_stack_elide_zero_99 : i64
      %2066 = func.call @stack_pop_pointer() : () -> i64
      %2067 = func.call @cc_cons(%2066, %2065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2068 = arith.addi %2067, %__rlasp_stack_elide_zero_100 : i64
      %2069 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2070 = arith.constant 11 : i64
      %2071 = func.call @cc_make_string(%2069, %2070) : (!llvm.ptr, i64) -> i64
      %2072 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2073 = arith.constant 7 : i64
      %2074 = func.call @cc_make_string(%2072, %2073) : (!llvm.ptr, i64) -> i64
      %2075 = func.call @cc_intern(%2071, %2074) : (i64, i64) -> i64
      %2076 = func.call @cc_nil_value() : () -> i64
      %2077 = func.call @cc_cons(%2075, %2076) : (i64, i64) -> i64
      %2078 = func.call @cc_values_pack(%2077) : (i64) -> i64
      %2079 = func.call @cc_nil_value() : () -> i64
      %2080 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2081 = arith.constant 4 : i64
      %2082 = func.call @cc_make_string(%2080, %2081) : (!llvm.ptr, i64) -> i64
      %2083 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2084 = arith.constant 7 : i64
      %2085 = func.call @cc_make_string(%2083, %2084) : (!llvm.ptr, i64) -> i64
      %2086 = func.call @cc_intern(%2082, %2085) : (i64, i64) -> i64
      %2087 = func.call @cc_nil_value() : () -> i64
      %2088 = func.call @cc_cons(%2086, %2087) : (i64, i64) -> i64
      %2089 = func.call @cc_values_pack(%2088) : (i64) -> i64
      %2090 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2091 = arith.constant 5 : i64
      %2092 = func.call @cc_make_string(%2090, %2091) : (!llvm.ptr, i64) -> i64
      %2093 = func.call @cc_nil_value() : () -> i64
      %2094 = func.call @cc_intern(%2092, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_nil_value() : () -> i64
      %2096 = func.call @cc_cons(%2094, %2095) : (i64, i64) -> i64
      %2097 = func.call @cc_values_pack(%2096) : (i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2098 = arith.addi %2094, %__rlasp_stack_elide_zero_101 : i64
      %2099 = func.call @cc_nil_value() : () -> i64
      %2100 = func.call @cc_errorp(%1866) : (i64) -> i64
      %2101 = arith.cmpi ne, %2100, %2099 : i64
      %2102 = arith.cmpi eq, %2099, %2099 : i64
      %2103 = arith.andi %2101, %2102 : i1
      %2104 = scf.if %2103 -> (i64) {
        scf.yield %1866 : i64
      } else {
        scf.yield %2099 : i64
      }
      %2105 = func.call @cc_errorp(%1956) : (i64) -> i64
      %2106 = arith.cmpi ne, %2105, %2099 : i64
      %2107 = arith.cmpi eq, %2104, %2099 : i64
      %2108 = arith.andi %2106, %2107 : i1
      %2109 = scf.if %2108 -> (i64) {
        scf.yield %1956 : i64
      } else {
        scf.yield %2104 : i64
      }
      %2110 = func.call @cc_errorp(%2043) : (i64) -> i64
      %2111 = arith.cmpi ne, %2110, %2099 : i64
      %2112 = arith.cmpi eq, %2109, %2099 : i64
      %2113 = arith.andi %2111, %2112 : i1
      %2114 = scf.if %2113 -> (i64) {
        scf.yield %2043 : i64
      } else {
        scf.yield %2109 : i64
      }
      %2115 = func.call @cc_errorp(%2068) : (i64) -> i64
      %2116 = arith.cmpi ne, %2115, %2099 : i64
      %2117 = arith.cmpi eq, %2114, %2099 : i64
      %2118 = arith.andi %2116, %2117 : i1
      %2119 = scf.if %2118 -> (i64) {
        scf.yield %2068 : i64
      } else {
        scf.yield %2114 : i64
      }
      %2120 = func.call @cc_errorp(%2075) : (i64) -> i64
      %2121 = arith.cmpi ne, %2120, %2099 : i64
      %2122 = arith.cmpi eq, %2119, %2099 : i64
      %2123 = arith.andi %2121, %2122 : i1
      %2124 = scf.if %2123 -> (i64) {
        scf.yield %2075 : i64
      } else {
        scf.yield %2119 : i64
      }
      %2125 = func.call @cc_errorp(%2079) : (i64) -> i64
      %2126 = arith.cmpi ne, %2125, %2099 : i64
      %2127 = arith.cmpi eq, %2124, %2099 : i64
      %2128 = arith.andi %2126, %2127 : i1
      %2129 = scf.if %2128 -> (i64) {
        scf.yield %2079 : i64
      } else {
        scf.yield %2124 : i64
      }
      %2130 = func.call @cc_errorp(%2086) : (i64) -> i64
      %2131 = arith.cmpi ne, %2130, %2099 : i64
      %2132 = arith.cmpi eq, %2129, %2099 : i64
      %2133 = arith.andi %2131, %2132 : i1
      %2134 = scf.if %2133 -> (i64) {
        scf.yield %2086 : i64
      } else {
        scf.yield %2129 : i64
      }
      %2135 = func.call @cc_errorp(%2098) : (i64) -> i64
      %2136 = arith.cmpi ne, %2135, %2099 : i64
      %2137 = arith.cmpi eq, %2134, %2099 : i64
      %2138 = arith.andi %2136, %2137 : i1
      %2139 = scf.if %2138 -> (i64) {
        scf.yield %2098 : i64
      } else {
        scf.yield %2134 : i64
      }
      %2140 = arith.cmpi ne, %2139, %2099 : i64
      scf.if %2140 {
        func.call @stack_push_pointer(%2139) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1866) : (i64) -> ()
        func.call @stack_push_pointer(%1956) : (i64) -> ()
        func.call @stack_push_pointer(%2043) : (i64) -> ()
        func.call @stack_push_pointer(%2068) : (i64) -> ()
        func.call @stack_push_pointer(%2075) : (i64) -> ()
        func.call @stack_push_pointer(%2079) : (i64) -> ()
        func.call @stack_push_pointer(%2086) : (i64) -> ()
        func.call @stack_push_pointer(%2098) : (i64) -> ()
        %2141 = llvm.mlir.addressof @str162 : !llvm.ptr
        %2142 = func.call @cc_make_function_ref_const(%2141) : (!llvm.ptr) -> i64
        %2143 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2142, %2143) : (i64, i64) -> ()
      }
      %2144 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2144 : i64
    }
    %2145 = func.call @cc_nil_value() : () -> i64
    %2146 = func.call @cc_errorp(%1857) : (i64) -> i64
    %2147 = arith.cmpi ne, %2146, %2145 : i64
    %2148 = scf.if %2147 -> (i64) {
      scf.yield %1857 : i64
    } else {
      %2149 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2150 = arith.constant 8 : i64
      %2151 = func.call @cc_make_string(%2149, %2150) : (!llvm.ptr, i64) -> i64
      %2152 = func.call @cc_nil_value() : () -> i64
      %2153 = func.call @cc_intern(%2151, %2152) : (i64, i64) -> i64
      %2154 = func.call @cc_nil_value() : () -> i64
      %2155 = func.call @cc_cons(%2153, %2154) : (i64, i64) -> i64
      %2156 = func.call @cc_values_pack(%2155) : (i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2157 = arith.addi %2153, %__rlasp_stack_elide_zero_102 : i64
      %2158 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2159 = arith.constant 13 : i64
      %2160 = func.call @cc_make_string(%2158, %2159) : (!llvm.ptr, i64) -> i64
      %2161 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2162 = arith.constant 11 : i64
      %2163 = func.call @cc_make_string(%2161, %2162) : (!llvm.ptr, i64) -> i64
      %2164 = func.call @cc_intern(%2160, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_nil_value() : () -> i64
      %2166 = func.call @cc_cons(%2164, %2165) : (i64, i64) -> i64
      %2167 = func.call @cc_values_pack(%2166) : (i64) -> i64
      func.call @stack_push_pointer(%2164) : (i64) -> ()
      %2168 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2169 = arith.constant 6 : i64
      %2170 = func.call @cc_make_string(%2168, %2169) : (!llvm.ptr, i64) -> i64
      %2171 = func.call @cc_nil_value() : () -> i64
      %2172 = func.call @cc_intern(%2170, %2171) : (i64, i64) -> i64
      %2173 = func.call @cc_nil_value() : () -> i64
      %2174 = func.call @cc_cons(%2172, %2173) : (i64, i64) -> i64
      %2175 = func.call @cc_values_pack(%2174) : (i64) -> i64
      func.call @stack_push_pointer(%2172) : (i64) -> ()
      %2176 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2177 = arith.constant 19 : i64
      %2178 = func.call @cc_make_string(%2176, %2177) : (!llvm.ptr, i64) -> i64
      %2179 = func.call @cc_nil_value() : () -> i64
      %2180 = func.call @cc_intern(%2178, %2179) : (i64, i64) -> i64
      %2181 = func.call @cc_nil_value() : () -> i64
      %2182 = func.call @cc_cons(%2180, %2181) : (i64, i64) -> i64
      %2183 = func.call @cc_values_pack(%2182) : (i64) -> i64
      func.call @stack_push_pointer(%2180) : (i64) -> ()
      %2184 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2185 = arith.constant 6 : i64
      %2186 = func.call @cc_make_string(%2184, %2185) : (!llvm.ptr, i64) -> i64
      %2187 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2188 = arith.constant 11 : i64
      %2189 = func.call @cc_make_string(%2187, %2188) : (!llvm.ptr, i64) -> i64
      %2190 = func.call @cc_intern(%2186, %2189) : (i64, i64) -> i64
      %2191 = func.call @cc_nil_value() : () -> i64
      %2192 = func.call @cc_cons(%2190, %2191) : (i64, i64) -> i64
      %2193 = func.call @cc_values_pack(%2192) : (i64) -> i64
      func.call @stack_push_pointer(%2190) : (i64) -> ()
      %2194 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      %2195 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2196 = arith.constant 5 : i64
      %2197 = func.call @cc_make_string(%2195, %2196) : (!llvm.ptr, i64) -> i64
      %2198 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2199 = arith.constant 11 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = func.call @cc_intern(%2197, %2200) : (i64, i64) -> i64
      %2202 = func.call @cc_nil_value() : () -> i64
      %2203 = func.call @cc_cons(%2201, %2202) : (i64, i64) -> i64
      %2204 = func.call @cc_values_pack(%2203) : (i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2205 = arith.addi %2201, %__rlasp_stack_elide_zero_103 : i64
      %2206 = func.call @stack_pop_pointer() : () -> i64
      %2207 = func.call @cc_cons(%2205, %2206) : (i64, i64) -> i64
      %2208 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2209 = arith.constant 5 : i64
      %2210 = func.call @cc_make_string(%2208, %2209) : (!llvm.ptr, i64) -> i64
      %2211 = func.call @cc_nil_value() : () -> i64
      %2212 = func.call @cc_intern(%2210, %2211) : (i64, i64) -> i64
      %2213 = func.call @cc_nil_value() : () -> i64
      %2214 = func.call @cc_cons(%2212, %2213) : (i64, i64) -> i64
      %2215 = func.call @cc_values_pack(%2214) : (i64) -> i64
      %2216 = func.call @cc_cons(%2212, %2207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2217 = func.call @stack_pop_pointer() : () -> i64
      %2218 = func.call @stack_pop_pointer() : () -> i64
      %2219 = func.call @cc_cons(%2218, %2217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2220 = arith.addi %2219, %__rlasp_stack_elide_zero_104 : i64
      %2221 = func.call @stack_pop_pointer() : () -> i64
      %2222 = func.call @cc_cons(%2221, %2220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2223 = func.call @stack_pop_pointer() : () -> i64
      %2224 = func.call @stack_pop_pointer() : () -> i64
      %2225 = func.call @cc_cons(%2224, %2223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2226 = arith.addi %2225, %__rlasp_stack_elide_zero_105 : i64
      %2227 = func.call @stack_pop_pointer() : () -> i64
      %2228 = func.call @cc_cons(%2227, %2226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2229 = func.call @stack_pop_pointer() : () -> i64
      %2230 = func.call @stack_pop_pointer() : () -> i64
      %2231 = func.call @cc_cons(%2230, %2229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2232 = arith.addi %2231, %__rlasp_stack_elide_zero_106 : i64
      %2233 = func.call @stack_pop_pointer() : () -> i64
      %2234 = func.call @cc_cons(%2233, %2232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2235 = arith.addi %2234, %__rlasp_stack_elide_zero_107 : i64
      %2236 = func.call @stack_pop_pointer() : () -> i64
      %2237 = func.call @cc_cons(%2236, %2235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2238 = func.call @stack_pop_pointer() : () -> i64
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @cc_cons(%2239, %2238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2241 = arith.addi %2240, %__rlasp_stack_elide_zero_108 : i64
      %2242 = func.call @stack_pop_pointer() : () -> i64
      %2243 = func.call @cc_cons(%2242, %2241) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2244 = arith.addi %2243, %__rlasp_stack_elide_zero_109 : i64
      %2300 = arith.constant 116254966808585 : i64
      %2301 = arith.constant 0 : i64
      %2302 = func.call @cc_make_closure(%2300, %2301) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2303 = arith.addi %2302, %__rlasp_stack_elide_zero_110 : i64
      %2304 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2305 = arith.constant 4 : i64
      %2306 = func.call @cc_make_string(%2304, %2305) : (!llvm.ptr, i64) -> i64
      %2307 = func.call @cc_nil_value() : () -> i64
      %2308 = func.call @cc_intern(%2306, %2307) : (i64, i64) -> i64
      %2309 = func.call @cc_nil_value() : () -> i64
      %2310 = func.call @cc_cons(%2308, %2309) : (i64, i64) -> i64
      %2311 = func.call @cc_values_pack(%2310) : (i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      %2312 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2313 = arith.constant 10 : i64
      %2314 = func.call @cc_make_string(%2312, %2313) : (!llvm.ptr, i64) -> i64
      %2315 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2316 = arith.constant 11 : i64
      %2317 = func.call @cc_make_string(%2315, %2316) : (!llvm.ptr, i64) -> i64
      %2318 = func.call @cc_intern(%2314, %2317) : (i64, i64) -> i64
      %2319 = func.call @cc_nil_value() : () -> i64
      %2320 = func.call @cc_cons(%2318, %2319) : (i64, i64) -> i64
      %2321 = func.call @cc_values_pack(%2320) : (i64) -> i64
      func.call @stack_push_pointer(%2318) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2322 = func.call @stack_pop_pointer() : () -> i64
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @cc_cons(%2323, %2322) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2325 = arith.addi %2324, %__rlasp_stack_elide_zero_111 : i64
      %2326 = func.call @stack_pop_pointer() : () -> i64
      %2327 = func.call @cc_cons(%2326, %2325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2328 = arith.addi %2327, %__rlasp_stack_elide_zero_112 : i64
      %2329 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2330 = arith.constant 11 : i64
      %2331 = func.call @cc_make_string(%2329, %2330) : (!llvm.ptr, i64) -> i64
      %2332 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2333 = arith.constant 7 : i64
      %2334 = func.call @cc_make_string(%2332, %2333) : (!llvm.ptr, i64) -> i64
      %2335 = func.call @cc_intern(%2331, %2334) : (i64, i64) -> i64
      %2336 = func.call @cc_nil_value() : () -> i64
      %2337 = func.call @cc_cons(%2335, %2336) : (i64, i64) -> i64
      %2338 = func.call @cc_values_pack(%2337) : (i64) -> i64
      %2339 = func.call @cc_nil_value() : () -> i64
      %2340 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2341 = arith.constant 4 : i64
      %2342 = func.call @cc_make_string(%2340, %2341) : (!llvm.ptr, i64) -> i64
      %2343 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2344 = arith.constant 7 : i64
      %2345 = func.call @cc_make_string(%2343, %2344) : (!llvm.ptr, i64) -> i64
      %2346 = func.call @cc_intern(%2342, %2345) : (i64, i64) -> i64
      %2347 = func.call @cc_nil_value() : () -> i64
      %2348 = func.call @cc_cons(%2346, %2347) : (i64, i64) -> i64
      %2349 = func.call @cc_values_pack(%2348) : (i64) -> i64
      %2350 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2351 = arith.constant 5 : i64
      %2352 = func.call @cc_make_string(%2350, %2351) : (!llvm.ptr, i64) -> i64
      %2353 = func.call @cc_nil_value() : () -> i64
      %2354 = func.call @cc_intern(%2352, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_nil_value() : () -> i64
      %2356 = func.call @cc_cons(%2354, %2355) : (i64, i64) -> i64
      %2357 = func.call @cc_values_pack(%2356) : (i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2358 = arith.addi %2354, %__rlasp_stack_elide_zero_113 : i64
      %2359 = func.call @cc_nil_value() : () -> i64
      %2360 = func.call @cc_errorp(%2157) : (i64) -> i64
      %2361 = arith.cmpi ne, %2360, %2359 : i64
      %2362 = arith.cmpi eq, %2359, %2359 : i64
      %2363 = arith.andi %2361, %2362 : i1
      %2364 = scf.if %2363 -> (i64) {
        scf.yield %2157 : i64
      } else {
        scf.yield %2359 : i64
      }
      %2365 = func.call @cc_errorp(%2244) : (i64) -> i64
      %2366 = arith.cmpi ne, %2365, %2359 : i64
      %2367 = arith.cmpi eq, %2364, %2359 : i64
      %2368 = arith.andi %2366, %2367 : i1
      %2369 = scf.if %2368 -> (i64) {
        scf.yield %2244 : i64
      } else {
        scf.yield %2364 : i64
      }
      %2370 = func.call @cc_errorp(%2303) : (i64) -> i64
      %2371 = arith.cmpi ne, %2370, %2359 : i64
      %2372 = arith.cmpi eq, %2369, %2359 : i64
      %2373 = arith.andi %2371, %2372 : i1
      %2374 = scf.if %2373 -> (i64) {
        scf.yield %2303 : i64
      } else {
        scf.yield %2369 : i64
      }
      %2375 = func.call @cc_errorp(%2328) : (i64) -> i64
      %2376 = arith.cmpi ne, %2375, %2359 : i64
      %2377 = arith.cmpi eq, %2374, %2359 : i64
      %2378 = arith.andi %2376, %2377 : i1
      %2379 = scf.if %2378 -> (i64) {
        scf.yield %2328 : i64
      } else {
        scf.yield %2374 : i64
      }
      %2380 = func.call @cc_errorp(%2335) : (i64) -> i64
      %2381 = arith.cmpi ne, %2380, %2359 : i64
      %2382 = arith.cmpi eq, %2379, %2359 : i64
      %2383 = arith.andi %2381, %2382 : i1
      %2384 = scf.if %2383 -> (i64) {
        scf.yield %2335 : i64
      } else {
        scf.yield %2379 : i64
      }
      %2385 = func.call @cc_errorp(%2339) : (i64) -> i64
      %2386 = arith.cmpi ne, %2385, %2359 : i64
      %2387 = arith.cmpi eq, %2384, %2359 : i64
      %2388 = arith.andi %2386, %2387 : i1
      %2389 = scf.if %2388 -> (i64) {
        scf.yield %2339 : i64
      } else {
        scf.yield %2384 : i64
      }
      %2390 = func.call @cc_errorp(%2346) : (i64) -> i64
      %2391 = arith.cmpi ne, %2390, %2359 : i64
      %2392 = arith.cmpi eq, %2389, %2359 : i64
      %2393 = arith.andi %2391, %2392 : i1
      %2394 = scf.if %2393 -> (i64) {
        scf.yield %2346 : i64
      } else {
        scf.yield %2389 : i64
      }
      %2395 = func.call @cc_errorp(%2358) : (i64) -> i64
      %2396 = arith.cmpi ne, %2395, %2359 : i64
      %2397 = arith.cmpi eq, %2394, %2359 : i64
      %2398 = arith.andi %2396, %2397 : i1
      %2399 = scf.if %2398 -> (i64) {
        scf.yield %2358 : i64
      } else {
        scf.yield %2394 : i64
      }
      %2400 = arith.cmpi ne, %2399, %2359 : i64
      scf.if %2400 {
        func.call @stack_push_pointer(%2399) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2157) : (i64) -> ()
        func.call @stack_push_pointer(%2244) : (i64) -> ()
        func.call @stack_push_pointer(%2303) : (i64) -> ()
        func.call @stack_push_pointer(%2328) : (i64) -> ()
        func.call @stack_push_pointer(%2335) : (i64) -> ()
        func.call @stack_push_pointer(%2339) : (i64) -> ()
        func.call @stack_push_pointer(%2346) : (i64) -> ()
        func.call @stack_push_pointer(%2358) : (i64) -> ()
        %2401 = llvm.mlir.addressof @str183 : !llvm.ptr
        %2402 = func.call @cc_make_function_ref_const(%2401) : (!llvm.ptr) -> i64
        %2403 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2402, %2403) : (i64, i64) -> ()
      }
      %2404 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2404 : i64
    }
    %2405 = func.call @cc_nil_value() : () -> i64
    %2406 = func.call @cc_errorp(%2148) : (i64) -> i64
    %2407 = arith.cmpi ne, %2406, %2405 : i64
    %2408 = scf.if %2407 -> (i64) {
      scf.yield %2148 : i64
    } else {
      %2409 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2410 = arith.constant 8 : i64
      %2411 = func.call @cc_make_string(%2409, %2410) : (!llvm.ptr, i64) -> i64
      %2412 = func.call @cc_nil_value() : () -> i64
      %2413 = func.call @cc_intern(%2411, %2412) : (i64, i64) -> i64
      %2414 = func.call @cc_nil_value() : () -> i64
      %2415 = func.call @cc_cons(%2413, %2414) : (i64, i64) -> i64
      %2416 = func.call @cc_values_pack(%2415) : (i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2417 = arith.addi %2413, %__rlasp_stack_elide_zero_114 : i64
      %2418 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2419 = arith.constant 3 : i64
      %2420 = func.call @cc_make_string(%2418, %2419) : (!llvm.ptr, i64) -> i64
      %2421 = func.call @cc_nil_value() : () -> i64
      %2422 = func.call @cc_intern(%2420, %2421) : (i64, i64) -> i64
      %2423 = func.call @cc_nil_value() : () -> i64
      %2424 = func.call @cc_cons(%2422, %2423) : (i64, i64) -> i64
      %2425 = func.call @cc_values_pack(%2424) : (i64) -> i64
      func.call @stack_push_pointer(%2422) : (i64) -> ()
      %2426 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2427 = arith.constant 3 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_intern(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      %2434 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2435 = arith.constant 6 : i64
      %2436 = func.call @cc_make_string(%2434, %2435) : (!llvm.ptr, i64) -> i64
      %2437 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2438 = arith.constant 11 : i64
      %2439 = func.call @cc_make_string(%2437, %2438) : (!llvm.ptr, i64) -> i64
      %2440 = func.call @cc_intern(%2436, %2439) : (i64, i64) -> i64
      %2441 = func.call @cc_nil_value() : () -> i64
      %2442 = func.call @cc_cons(%2440, %2441) : (i64, i64) -> i64
      %2443 = func.call @cc_values_pack(%2442) : (i64) -> i64
      func.call @stack_push_pointer(%2440) : (i64) -> ()
      %2444 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2445 = arith.constant 1 : i64
      %2446 = func.call @cc_make_string(%2444, %2445) : (!llvm.ptr, i64) -> i64
      %2447 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2448 = arith.constant 11 : i64
      %2449 = func.call @cc_make_string(%2447, %2448) : (!llvm.ptr, i64) -> i64
      %2450 = func.call @cc_intern(%2446, %2449) : (i64, i64) -> i64
      %2451 = func.call @cc_nil_value() : () -> i64
      %2452 = func.call @cc_cons(%2450, %2451) : (i64, i64) -> i64
      %2453 = func.call @cc_values_pack(%2452) : (i64) -> i64
      func.call @stack_push_pointer(%2450) : (i64) -> ()
      %2454 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2455 = arith.constant 20 : i64
      %2456 = func.call @cc_make_string(%2454, %2455) : (!llvm.ptr, i64) -> i64
      %2457 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2458 = arith.constant 11 : i64
      %2459 = func.call @cc_make_string(%2457, %2458) : (!llvm.ptr, i64) -> i64
      %2460 = func.call @cc_intern(%2456, %2459) : (i64, i64) -> i64
      %2461 = func.call @cc_nil_value() : () -> i64
      %2462 = func.call @cc_cons(%2460, %2461) : (i64, i64) -> i64
      %2463 = func.call @cc_values_pack(%2462) : (i64) -> i64
      func.call @stack_push_pointer(%2460) : (i64) -> ()
      %2464 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2465 = arith.constant 20 : i64
      %2466 = func.call @cc_make_string(%2464, %2465) : (!llvm.ptr, i64) -> i64
      %2467 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2468 = arith.constant 11 : i64
      %2469 = func.call @cc_make_string(%2467, %2468) : (!llvm.ptr, i64) -> i64
      %2470 = func.call @cc_intern(%2466, %2469) : (i64, i64) -> i64
      %2471 = func.call @cc_nil_value() : () -> i64
      %2472 = func.call @cc_cons(%2470, %2471) : (i64, i64) -> i64
      %2473 = func.call @cc_values_pack(%2472) : (i64) -> i64
      func.call @stack_push_pointer(%2470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2474 = func.call @stack_pop_pointer() : () -> i64
      %2475 = func.call @stack_pop_pointer() : () -> i64
      %2476 = func.call @cc_cons(%2475, %2474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2477 = arith.addi %2476, %__rlasp_stack_elide_zero_115 : i64
      %2478 = func.call @stack_pop_pointer() : () -> i64
      %2479 = func.call @cc_cons(%2478, %2477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2480 = arith.addi %2479, %__rlasp_stack_elide_zero_116 : i64
      %2481 = func.call @stack_pop_pointer() : () -> i64
      %2482 = func.call @cc_cons(%2481, %2480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2483 = func.call @stack_pop_pointer() : () -> i64
      %2484 = func.call @stack_pop_pointer() : () -> i64
      %2485 = func.call @cc_cons(%2484, %2483) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2486 = arith.addi %2485, %__rlasp_stack_elide_zero_117 : i64
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = func.call @cc_cons(%2487, %2486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2489 = func.call @stack_pop_pointer() : () -> i64
      %2490 = func.call @stack_pop_pointer() : () -> i64
      %2491 = func.call @cc_cons(%2490, %2489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2492 = arith.addi %2491, %__rlasp_stack_elide_zero_118 : i64
      %2493 = func.call @stack_pop_pointer() : () -> i64
      %2494 = func.call @cc_cons(%2493, %2492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2494) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2495 = func.call @stack_pop_pointer() : () -> i64
      %2496 = func.call @stack_pop_pointer() : () -> i64
      %2497 = func.call @cc_cons(%2496, %2495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2498 = arith.addi %2497, %__rlasp_stack_elide_zero_119 : i64
      %2499 = func.call @stack_pop_pointer() : () -> i64
      %2500 = func.call @cc_cons(%2499, %2498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2501 = arith.addi %2500, %__rlasp_stack_elide_zero_120 : i64
      %2565 = arith.constant 116254966808586 : i64
      %2566 = arith.constant 0 : i64
      %2567 = func.call @cc_make_closure(%2565, %2566) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2568 = arith.addi %2567, %__rlasp_stack_elide_zero_121 : i64
      %2569 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2570 = arith.constant 1 : i64
      %2571 = func.call @cc_make_string(%2569, %2570) : (!llvm.ptr, i64) -> i64
      %2572 = func.call @cc_nil_value() : () -> i64
      %2573 = func.call @cc_intern(%2571, %2572) : (i64, i64) -> i64
      %2574 = func.call @cc_nil_value() : () -> i64
      %2575 = func.call @cc_cons(%2573, %2574) : (i64, i64) -> i64
      %2576 = func.call @cc_values_pack(%2575) : (i64) -> i64
      func.call @stack_push_pointer(%2573) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2577 = func.call @stack_pop_pointer() : () -> i64
      %2578 = func.call @stack_pop_pointer() : () -> i64
      %2579 = func.call @cc_cons(%2578, %2577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2580 = arith.addi %2579, %__rlasp_stack_elide_zero_122 : i64
      %2581 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2582 = arith.constant 11 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2585 = arith.constant 7 : i64
      %2586 = func.call @cc_make_string(%2584, %2585) : (!llvm.ptr, i64) -> i64
      %2587 = func.call @cc_intern(%2583, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_nil_value() : () -> i64
      %2589 = func.call @cc_cons(%2587, %2588) : (i64, i64) -> i64
      %2590 = func.call @cc_values_pack(%2589) : (i64) -> i64
      %2591 = func.call @cc_nil_value() : () -> i64
      %2592 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2593 = arith.constant 4 : i64
      %2594 = func.call @cc_make_string(%2592, %2593) : (!llvm.ptr, i64) -> i64
      %2595 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2596 = arith.constant 7 : i64
      %2597 = func.call @cc_make_string(%2595, %2596) : (!llvm.ptr, i64) -> i64
      %2598 = func.call @cc_intern(%2594, %2597) : (i64, i64) -> i64
      %2599 = func.call @cc_nil_value() : () -> i64
      %2600 = func.call @cc_cons(%2598, %2599) : (i64, i64) -> i64
      %2601 = func.call @cc_values_pack(%2600) : (i64) -> i64
      %2602 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2603 = arith.constant 6 : i64
      %2604 = func.call @cc_make_string(%2602, %2603) : (!llvm.ptr, i64) -> i64
      %2605 = func.call @cc_nil_value() : () -> i64
      %2606 = func.call @cc_intern(%2604, %2605) : (i64, i64) -> i64
      %2607 = func.call @cc_nil_value() : () -> i64
      %2608 = func.call @cc_cons(%2606, %2607) : (i64, i64) -> i64
      %2609 = func.call @cc_values_pack(%2608) : (i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2610 = arith.addi %2606, %__rlasp_stack_elide_zero_123 : i64
      %2611 = func.call @cc_nil_value() : () -> i64
      %2612 = func.call @cc_errorp(%2417) : (i64) -> i64
      %2613 = arith.cmpi ne, %2612, %2611 : i64
      %2614 = arith.cmpi eq, %2611, %2611 : i64
      %2615 = arith.andi %2613, %2614 : i1
      %2616 = scf.if %2615 -> (i64) {
        scf.yield %2417 : i64
      } else {
        scf.yield %2611 : i64
      }
      %2617 = func.call @cc_errorp(%2501) : (i64) -> i64
      %2618 = arith.cmpi ne, %2617, %2611 : i64
      %2619 = arith.cmpi eq, %2616, %2611 : i64
      %2620 = arith.andi %2618, %2619 : i1
      %2621 = scf.if %2620 -> (i64) {
        scf.yield %2501 : i64
      } else {
        scf.yield %2616 : i64
      }
      %2622 = func.call @cc_errorp(%2568) : (i64) -> i64
      %2623 = arith.cmpi ne, %2622, %2611 : i64
      %2624 = arith.cmpi eq, %2621, %2611 : i64
      %2625 = arith.andi %2623, %2624 : i1
      %2626 = scf.if %2625 -> (i64) {
        scf.yield %2568 : i64
      } else {
        scf.yield %2621 : i64
      }
      %2627 = func.call @cc_errorp(%2580) : (i64) -> i64
      %2628 = arith.cmpi ne, %2627, %2611 : i64
      %2629 = arith.cmpi eq, %2626, %2611 : i64
      %2630 = arith.andi %2628, %2629 : i1
      %2631 = scf.if %2630 -> (i64) {
        scf.yield %2580 : i64
      } else {
        scf.yield %2626 : i64
      }
      %2632 = func.call @cc_errorp(%2587) : (i64) -> i64
      %2633 = arith.cmpi ne, %2632, %2611 : i64
      %2634 = arith.cmpi eq, %2631, %2611 : i64
      %2635 = arith.andi %2633, %2634 : i1
      %2636 = scf.if %2635 -> (i64) {
        scf.yield %2587 : i64
      } else {
        scf.yield %2631 : i64
      }
      %2637 = func.call @cc_errorp(%2591) : (i64) -> i64
      %2638 = arith.cmpi ne, %2637, %2611 : i64
      %2639 = arith.cmpi eq, %2636, %2611 : i64
      %2640 = arith.andi %2638, %2639 : i1
      %2641 = scf.if %2640 -> (i64) {
        scf.yield %2591 : i64
      } else {
        scf.yield %2636 : i64
      }
      %2642 = func.call @cc_errorp(%2598) : (i64) -> i64
      %2643 = arith.cmpi ne, %2642, %2611 : i64
      %2644 = arith.cmpi eq, %2641, %2611 : i64
      %2645 = arith.andi %2643, %2644 : i1
      %2646 = scf.if %2645 -> (i64) {
        scf.yield %2598 : i64
      } else {
        scf.yield %2641 : i64
      }
      %2647 = func.call @cc_errorp(%2610) : (i64) -> i64
      %2648 = arith.cmpi ne, %2647, %2611 : i64
      %2649 = arith.cmpi eq, %2646, %2611 : i64
      %2650 = arith.andi %2648, %2649 : i1
      %2651 = scf.if %2650 -> (i64) {
        scf.yield %2610 : i64
      } else {
        scf.yield %2646 : i64
      }
      %2652 = arith.cmpi ne, %2651, %2611 : i64
      scf.if %2652 {
        func.call @stack_push_pointer(%2651) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2417) : (i64) -> ()
        func.call @stack_push_pointer(%2501) : (i64) -> ()
        func.call @stack_push_pointer(%2568) : (i64) -> ()
        func.call @stack_push_pointer(%2580) : (i64) -> ()
        func.call @stack_push_pointer(%2587) : (i64) -> ()
        func.call @stack_push_pointer(%2591) : (i64) -> ()
        func.call @stack_push_pointer(%2598) : (i64) -> ()
        func.call @stack_push_pointer(%2610) : (i64) -> ()
        %2653 = llvm.mlir.addressof @str205 : !llvm.ptr
        %2654 = func.call @cc_make_function_ref_const(%2653) : (!llvm.ptr) -> i64
        %2655 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2654, %2655) : (i64, i64) -> ()
      }
      %2656 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2656 : i64
    }
    %2657 = func.call @cc_nil_value() : () -> i64
    %2658 = func.call @cc_errorp(%2408) : (i64) -> i64
    %2659 = arith.cmpi ne, %2658, %2657 : i64
    %2660 = scf.if %2659 -> (i64) {
      scf.yield %2408 : i64
    } else {
      %2661 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2662 = arith.constant 8 : i64
      %2663 = func.call @cc_make_string(%2661, %2662) : (!llvm.ptr, i64) -> i64
      %2664 = func.call @cc_nil_value() : () -> i64
      %2665 = func.call @cc_intern(%2663, %2664) : (i64, i64) -> i64
      %2666 = func.call @cc_nil_value() : () -> i64
      %2667 = func.call @cc_cons(%2665, %2666) : (i64, i64) -> i64
      %2668 = func.call @cc_values_pack(%2667) : (i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2669 = arith.addi %2665, %__rlasp_stack_elide_zero_124 : i64
      %2670 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2671 = arith.constant 3 : i64
      %2672 = func.call @cc_make_string(%2670, %2671) : (!llvm.ptr, i64) -> i64
      %2673 = func.call @cc_nil_value() : () -> i64
      %2674 = func.call @cc_intern(%2672, %2673) : (i64, i64) -> i64
      %2675 = func.call @cc_nil_value() : () -> i64
      %2676 = func.call @cc_cons(%2674, %2675) : (i64, i64) -> i64
      %2677 = func.call @cc_values_pack(%2676) : (i64) -> i64
      func.call @stack_push_pointer(%2674) : (i64) -> ()
      %2678 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2679 = arith.constant 3 : i64
      %2680 = func.call @cc_make_string(%2678, %2679) : (!llvm.ptr, i64) -> i64
      %2681 = func.call @cc_nil_value() : () -> i64
      %2682 = func.call @cc_intern(%2680, %2681) : (i64, i64) -> i64
      %2683 = func.call @cc_nil_value() : () -> i64
      %2684 = func.call @cc_cons(%2682, %2683) : (i64, i64) -> i64
      %2685 = func.call @cc_values_pack(%2684) : (i64) -> i64
      func.call @stack_push_pointer(%2682) : (i64) -> ()
      %2686 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2687 = arith.constant 3 : i64
      %2688 = func.call @cc_make_string(%2686, %2687) : (!llvm.ptr, i64) -> i64
      %2689 = func.call @cc_nil_value() : () -> i64
      %2690 = func.call @cc_intern(%2688, %2689) : (i64, i64) -> i64
      %2691 = func.call @cc_nil_value() : () -> i64
      %2692 = func.call @cc_cons(%2690, %2691) : (i64, i64) -> i64
      %2693 = func.call @cc_values_pack(%2692) : (i64) -> i64
      func.call @stack_push_pointer(%2690) : (i64) -> ()
      %2694 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2695 = arith.constant 6 : i64
      %2696 = func.call @cc_make_string(%2694, %2695) : (!llvm.ptr, i64) -> i64
      %2697 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2698 = arith.constant 11 : i64
      %2699 = func.call @cc_make_string(%2697, %2698) : (!llvm.ptr, i64) -> i64
      %2700 = func.call @cc_intern(%2696, %2699) : (i64, i64) -> i64
      %2701 = func.call @cc_nil_value() : () -> i64
      %2702 = func.call @cc_cons(%2700, %2701) : (i64, i64) -> i64
      %2703 = func.call @cc_values_pack(%2702) : (i64) -> i64
      func.call @stack_push_pointer(%2700) : (i64) -> ()
      %2704 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2705 = arith.constant 50 : i64
      %2706 = func.call @cc_parse_bignum(%2704, %2705) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2707 = func.call @stack_pop_pointer() : () -> i64
      %2708 = func.call @stack_pop_pointer() : () -> i64
      %2709 = func.call @cc_cons(%2708, %2707) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2710 = arith.addi %2709, %__rlasp_stack_elide_zero_125 : i64
      %2711 = func.call @stack_pop_pointer() : () -> i64
      %2712 = func.call @cc_cons(%2711, %2710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2713 = func.call @stack_pop_pointer() : () -> i64
      %2714 = func.call @stack_pop_pointer() : () -> i64
      %2715 = func.call @cc_cons(%2714, %2713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2715) : (i64) -> ()
      %2716 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2717 = arith.constant 1 : i64
      %2718 = func.call @cc_make_string(%2716, %2717) : (!llvm.ptr, i64) -> i64
      %2719 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2720 = arith.constant 11 : i64
      %2721 = func.call @cc_make_string(%2719, %2720) : (!llvm.ptr, i64) -> i64
      %2722 = func.call @cc_intern(%2718, %2721) : (i64, i64) -> i64
      %2723 = func.call @cc_nil_value() : () -> i64
      %2724 = func.call @cc_cons(%2722, %2723) : (i64, i64) -> i64
      %2725 = func.call @cc_values_pack(%2724) : (i64) -> i64
      func.call @stack_push_pointer(%2722) : (i64) -> ()
      %2726 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2727 = arith.constant 2 : i64
      %2728 = func.call @cc_make_string(%2726, %2727) : (!llvm.ptr, i64) -> i64
      %2729 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2730 = arith.constant 11 : i64
      %2731 = func.call @cc_make_string(%2729, %2730) : (!llvm.ptr, i64) -> i64
      %2732 = func.call @cc_intern(%2728, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_nil_value() : () -> i64
      %2734 = func.call @cc_cons(%2732, %2733) : (i64, i64) -> i64
      %2735 = func.call @cc_values_pack(%2734) : (i64) -> i64
      func.call @stack_push_pointer(%2732) : (i64) -> ()
      %2736 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2737 = arith.constant 6 : i64
      %2738 = func.call @cc_make_string(%2736, %2737) : (!llvm.ptr, i64) -> i64
      %2739 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2740 = arith.constant 11 : i64
      %2741 = func.call @cc_make_string(%2739, %2740) : (!llvm.ptr, i64) -> i64
      %2742 = func.call @cc_intern(%2738, %2741) : (i64, i64) -> i64
      %2743 = func.call @cc_nil_value() : () -> i64
      %2744 = func.call @cc_cons(%2742, %2743) : (i64, i64) -> i64
      %2745 = func.call @cc_values_pack(%2744) : (i64) -> i64
      func.call @stack_push_pointer(%2742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2746 = func.call @stack_pop_pointer() : () -> i64
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @cc_cons(%2747, %2746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2749 = arith.addi %2748, %__rlasp_stack_elide_zero_126 : i64
      %2750 = func.call @stack_pop_pointer() : () -> i64
      %2751 = func.call @cc_cons(%2750, %2749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      %2752 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2753 = arith.constant 3 : i64
      %2754 = func.call @cc_make_string(%2752, %2753) : (!llvm.ptr, i64) -> i64
      %2755 = func.call @cc_nil_value() : () -> i64
      %2756 = func.call @cc_intern(%2754, %2755) : (i64, i64) -> i64
      %2757 = func.call @cc_nil_value() : () -> i64
      %2758 = func.call @cc_cons(%2756, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_values_pack(%2758) : (i64) -> i64
      func.call @stack_push_pointer(%2756) : (i64) -> ()
      %2760 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2761 = arith.constant 16 : i64
      %2762 = func.call @cc_make_string(%2760, %2761) : (!llvm.ptr, i64) -> i64
      %2763 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2764 = arith.constant 11 : i64
      %2765 = func.call @cc_make_string(%2763, %2764) : (!llvm.ptr, i64) -> i64
      %2766 = func.call @cc_intern(%2762, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_nil_value() : () -> i64
      %2768 = func.call @cc_cons(%2766, %2767) : (i64, i64) -> i64
      %2769 = func.call @cc_values_pack(%2768) : (i64) -> i64
      func.call @stack_push_pointer(%2766) : (i64) -> ()
      %2770 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2771 = arith.constant 6 : i64
      %2772 = func.call @cc_make_string(%2770, %2771) : (!llvm.ptr, i64) -> i64
      %2773 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2774 = arith.constant 11 : i64
      %2775 = func.call @cc_make_string(%2773, %2774) : (!llvm.ptr, i64) -> i64
      %2776 = func.call @cc_intern(%2772, %2775) : (i64, i64) -> i64
      %2777 = func.call @cc_nil_value() : () -> i64
      %2778 = func.call @cc_cons(%2776, %2777) : (i64, i64) -> i64
      %2779 = func.call @cc_values_pack(%2778) : (i64) -> i64
      func.call @stack_push_pointer(%2776) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2780 = func.call @stack_pop_pointer() : () -> i64
      %2781 = func.call @stack_pop_pointer() : () -> i64
      %2782 = func.call @cc_cons(%2781, %2780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2783 = arith.addi %2782, %__rlasp_stack_elide_zero_127 : i64
      %2784 = func.call @stack_pop_pointer() : () -> i64
      %2785 = func.call @cc_cons(%2784, %2783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2785) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2786 = func.call @stack_pop_pointer() : () -> i64
      %2787 = func.call @stack_pop_pointer() : () -> i64
      %2788 = func.call @cc_cons(%2787, %2786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2788) : (i64) -> ()
      %2789 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2790 = arith.constant 6 : i64
      %2791 = func.call @cc_make_string(%2789, %2790) : (!llvm.ptr, i64) -> i64
      %2792 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2793 = arith.constant 11 : i64
      %2794 = func.call @cc_make_string(%2792, %2793) : (!llvm.ptr, i64) -> i64
      %2795 = func.call @cc_intern(%2791, %2794) : (i64, i64) -> i64
      %2796 = func.call @cc_nil_value() : () -> i64
      %2797 = func.call @cc_cons(%2795, %2796) : (i64, i64) -> i64
      %2798 = func.call @cc_values_pack(%2797) : (i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @cc_cons(%2800, %2799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2801) : (i64) -> ()
      %2802 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2803 = arith.constant 16 : i64
      %2804 = func.call @cc_make_string(%2802, %2803) : (!llvm.ptr, i64) -> i64
      %2805 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2806 = arith.constant 11 : i64
      %2807 = func.call @cc_make_string(%2805, %2806) : (!llvm.ptr, i64) -> i64
      %2808 = func.call @cc_intern(%2804, %2807) : (i64, i64) -> i64
      %2809 = func.call @cc_nil_value() : () -> i64
      %2810 = func.call @cc_cons(%2808, %2809) : (i64, i64) -> i64
      %2811 = func.call @cc_values_pack(%2810) : (i64) -> i64
      func.call @stack_push_pointer(%2808) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2812 = func.call @stack_pop_pointer() : () -> i64
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @cc_cons(%2813, %2812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2815 = arith.addi %2814, %__rlasp_stack_elide_zero_128 : i64
      %2816 = func.call @stack_pop_pointer() : () -> i64
      %2817 = func.call @cc_cons(%2816, %2815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2818 = arith.addi %2817, %__rlasp_stack_elide_zero_129 : i64
      %2819 = func.call @stack_pop_pointer() : () -> i64
      %2820 = func.call @cc_cons(%2819, %2818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2821 = arith.addi %2820, %__rlasp_stack_elide_zero_130 : i64
      %2822 = func.call @stack_pop_pointer() : () -> i64
      %2823 = func.call @cc_cons(%2822, %2821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2824 = func.call @stack_pop_pointer() : () -> i64
      %2825 = func.call @stack_pop_pointer() : () -> i64
      %2826 = func.call @cc_cons(%2825, %2824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2827 = arith.addi %2826, %__rlasp_stack_elide_zero_131 : i64
      %2828 = func.call @stack_pop_pointer() : () -> i64
      %2829 = func.call @cc_cons(%2828, %2827) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2830 = arith.addi %2829, %__rlasp_stack_elide_zero_132 : i64
      %2831 = func.call @stack_pop_pointer() : () -> i64
      %2832 = func.call @cc_cons(%2831, %2830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2832) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2833 = func.call @stack_pop_pointer() : () -> i64
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @cc_cons(%2834, %2833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2836 = arith.addi %2835, %__rlasp_stack_elide_zero_133 : i64
      %2837 = func.call @stack_pop_pointer() : () -> i64
      %2838 = func.call @cc_cons(%2837, %2836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2839 = arith.addi %2838, %__rlasp_stack_elide_zero_134 : i64
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @cc_cons(%2840, %2839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2841) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = func.call @stack_pop_pointer() : () -> i64
      %2844 = func.call @cc_cons(%2843, %2842) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2845 = arith.addi %2844, %__rlasp_stack_elide_zero_135 : i64
      %2846 = func.call @stack_pop_pointer() : () -> i64
      %2847 = func.call @cc_cons(%2846, %2845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2848 = func.call @stack_pop_pointer() : () -> i64
      %2849 = func.call @stack_pop_pointer() : () -> i64
      %2850 = func.call @cc_cons(%2849, %2848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2851 = arith.addi %2850, %__rlasp_stack_elide_zero_136 : i64
      %2852 = func.call @stack_pop_pointer() : () -> i64
      %2853 = func.call @cc_cons(%2852, %2851) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2854 = arith.addi %2853, %__rlasp_stack_elide_zero_137 : i64
      %2961 = arith.constant 116254966808587 : i64
      %2962 = arith.constant 0 : i64
      %2963 = func.call @cc_make_closure(%2961, %2962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2964 = arith.addi %2963, %__rlasp_stack_elide_zero_138 : i64
      %2965 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2966 = arith.constant 1 : i64
      %2967 = func.call @cc_make_string(%2965, %2966) : (!llvm.ptr, i64) -> i64
      %2968 = func.call @cc_nil_value() : () -> i64
      %2969 = func.call @cc_intern(%2967, %2968) : (i64, i64) -> i64
      %2970 = func.call @cc_nil_value() : () -> i64
      %2971 = func.call @cc_cons(%2969, %2970) : (i64, i64) -> i64
      %2972 = func.call @cc_values_pack(%2971) : (i64) -> i64
      func.call @stack_push_pointer(%2969) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @stack_pop_pointer() : () -> i64
      %2975 = func.call @cc_cons(%2974, %2973) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2976 = arith.addi %2975, %__rlasp_stack_elide_zero_139 : i64
      %2977 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2978 = arith.constant 11 : i64
      %2979 = func.call @cc_make_string(%2977, %2978) : (!llvm.ptr, i64) -> i64
      %2980 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2981 = arith.constant 7 : i64
      %2982 = func.call @cc_make_string(%2980, %2981) : (!llvm.ptr, i64) -> i64
      %2983 = func.call @cc_intern(%2979, %2982) : (i64, i64) -> i64
      %2984 = func.call @cc_nil_value() : () -> i64
      %2985 = func.call @cc_cons(%2983, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_values_pack(%2985) : (i64) -> i64
      %2987 = func.call @cc_nil_value() : () -> i64
      %2988 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2989 = arith.constant 4 : i64
      %2990 = func.call @cc_make_string(%2988, %2989) : (!llvm.ptr, i64) -> i64
      %2991 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2992 = arith.constant 7 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = func.call @cc_intern(%2990, %2993) : (i64, i64) -> i64
      %2995 = func.call @cc_nil_value() : () -> i64
      %2996 = func.call @cc_cons(%2994, %2995) : (i64, i64) -> i64
      %2997 = func.call @cc_values_pack(%2996) : (i64) -> i64
      %2998 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2999 = arith.constant 6 : i64
      %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
      %3001 = func.call @cc_nil_value() : () -> i64
      %3002 = func.call @cc_intern(%3000, %3001) : (i64, i64) -> i64
      %3003 = func.call @cc_nil_value() : () -> i64
      %3004 = func.call @cc_cons(%3002, %3003) : (i64, i64) -> i64
      %3005 = func.call @cc_values_pack(%3004) : (i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3006 = arith.addi %3002, %__rlasp_stack_elide_zero_140 : i64
      %3007 = func.call @cc_nil_value() : () -> i64
      %3008 = func.call @cc_errorp(%2669) : (i64) -> i64
      %3009 = arith.cmpi ne, %3008, %3007 : i64
      %3010 = arith.cmpi eq, %3007, %3007 : i64
      %3011 = arith.andi %3009, %3010 : i1
      %3012 = scf.if %3011 -> (i64) {
        scf.yield %2669 : i64
      } else {
        scf.yield %3007 : i64
      }
      %3013 = func.call @cc_errorp(%2854) : (i64) -> i64
      %3014 = arith.cmpi ne, %3013, %3007 : i64
      %3015 = arith.cmpi eq, %3012, %3007 : i64
      %3016 = arith.andi %3014, %3015 : i1
      %3017 = scf.if %3016 -> (i64) {
        scf.yield %2854 : i64
      } else {
        scf.yield %3012 : i64
      }
      %3018 = func.call @cc_errorp(%2964) : (i64) -> i64
      %3019 = arith.cmpi ne, %3018, %3007 : i64
      %3020 = arith.cmpi eq, %3017, %3007 : i64
      %3021 = arith.andi %3019, %3020 : i1
      %3022 = scf.if %3021 -> (i64) {
        scf.yield %2964 : i64
      } else {
        scf.yield %3017 : i64
      }
      %3023 = func.call @cc_errorp(%2976) : (i64) -> i64
      %3024 = arith.cmpi ne, %3023, %3007 : i64
      %3025 = arith.cmpi eq, %3022, %3007 : i64
      %3026 = arith.andi %3024, %3025 : i1
      %3027 = scf.if %3026 -> (i64) {
        scf.yield %2976 : i64
      } else {
        scf.yield %3022 : i64
      }
      %3028 = func.call @cc_errorp(%2983) : (i64) -> i64
      %3029 = arith.cmpi ne, %3028, %3007 : i64
      %3030 = arith.cmpi eq, %3027, %3007 : i64
      %3031 = arith.andi %3029, %3030 : i1
      %3032 = scf.if %3031 -> (i64) {
        scf.yield %2983 : i64
      } else {
        scf.yield %3027 : i64
      }
      %3033 = func.call @cc_errorp(%2987) : (i64) -> i64
      %3034 = arith.cmpi ne, %3033, %3007 : i64
      %3035 = arith.cmpi eq, %3032, %3007 : i64
      %3036 = arith.andi %3034, %3035 : i1
      %3037 = scf.if %3036 -> (i64) {
        scf.yield %2987 : i64
      } else {
        scf.yield %3032 : i64
      }
      %3038 = func.call @cc_errorp(%2994) : (i64) -> i64
      %3039 = arith.cmpi ne, %3038, %3007 : i64
      %3040 = arith.cmpi eq, %3037, %3007 : i64
      %3041 = arith.andi %3039, %3040 : i1
      %3042 = scf.if %3041 -> (i64) {
        scf.yield %2994 : i64
      } else {
        scf.yield %3037 : i64
      }
      %3043 = func.call @cc_errorp(%3006) : (i64) -> i64
      %3044 = arith.cmpi ne, %3043, %3007 : i64
      %3045 = arith.cmpi eq, %3042, %3007 : i64
      %3046 = arith.andi %3044, %3045 : i1
      %3047 = scf.if %3046 -> (i64) {
        scf.yield %3006 : i64
      } else {
        scf.yield %3042 : i64
      }
      %3048 = arith.cmpi ne, %3047, %3007 : i64
      scf.if %3048 {
        func.call @stack_push_pointer(%3047) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2669) : (i64) -> ()
        func.call @stack_push_pointer(%2854) : (i64) -> ()
        func.call @stack_push_pointer(%2964) : (i64) -> ()
        func.call @stack_push_pointer(%2976) : (i64) -> ()
        func.call @stack_push_pointer(%2983) : (i64) -> ()
        func.call @stack_push_pointer(%2987) : (i64) -> ()
        func.call @stack_push_pointer(%2994) : (i64) -> ()
        func.call @stack_push_pointer(%3006) : (i64) -> ()
        %3049 = llvm.mlir.addressof @str238 : !llvm.ptr
        %3050 = func.call @cc_make_function_ref_const(%3049) : (!llvm.ptr) -> i64
        %3051 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3050, %3051) : (i64, i64) -> ()
      }
      %3052 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3052 : i64
    }
    %3053 = func.call @cc_nil_value() : () -> i64
    %3054 = func.call @cc_errorp(%2660) : (i64) -> i64
    %3055 = arith.cmpi ne, %3054, %3053 : i64
    %3056 = scf.if %3055 -> (i64) {
      scf.yield %2660 : i64
    } else {
      %3057 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3058 = arith.constant 8 : i64
      %3059 = func.call @cc_make_string(%3057, %3058) : (!llvm.ptr, i64) -> i64
      %3060 = func.call @cc_nil_value() : () -> i64
      %3061 = func.call @cc_intern(%3059, %3060) : (i64, i64) -> i64
      %3062 = func.call @cc_nil_value() : () -> i64
      %3063 = func.call @cc_cons(%3061, %3062) : (i64, i64) -> i64
      %3064 = func.call @cc_values_pack(%3063) : (i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3065 = arith.addi %3061, %__rlasp_stack_elide_zero_141 : i64
      %3066 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3067 = arith.constant 3 : i64
      %3068 = func.call @cc_make_string(%3066, %3067) : (!llvm.ptr, i64) -> i64
      %3069 = func.call @cc_nil_value() : () -> i64
      %3070 = func.call @cc_intern(%3068, %3069) : (i64, i64) -> i64
      %3071 = func.call @cc_nil_value() : () -> i64
      %3072 = func.call @cc_cons(%3070, %3071) : (i64, i64) -> i64
      %3073 = func.call @cc_values_pack(%3072) : (i64) -> i64
      func.call @stack_push_pointer(%3070) : (i64) -> ()
      %3074 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3075 = arith.constant 3 : i64
      %3076 = func.call @cc_make_string(%3074, %3075) : (!llvm.ptr, i64) -> i64
      %3077 = func.call @cc_nil_value() : () -> i64
      %3078 = func.call @cc_intern(%3076, %3077) : (i64, i64) -> i64
      %3079 = func.call @cc_nil_value() : () -> i64
      %3080 = func.call @cc_cons(%3078, %3079) : (i64, i64) -> i64
      %3081 = func.call @cc_values_pack(%3080) : (i64) -> i64
      func.call @stack_push_pointer(%3078) : (i64) -> ()
      %3082 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3083 = arith.constant 1 : i64
      %3084 = func.call @cc_make_string(%3082, %3083) : (!llvm.ptr, i64) -> i64
      %3085 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3086 = arith.constant 11 : i64
      %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
      %3088 = func.call @cc_intern(%3084, %3087) : (i64, i64) -> i64
      %3089 = func.call @cc_nil_value() : () -> i64
      %3090 = func.call @cc_cons(%3088, %3089) : (i64, i64) -> i64
      %3091 = func.call @cc_values_pack(%3090) : (i64) -> i64
      func.call @stack_push_pointer(%3088) : (i64) -> ()
      %3092 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3093 = arith.constant 2 : i64
      %3094 = func.call @cc_make_string(%3092, %3093) : (!llvm.ptr, i64) -> i64
      %3095 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3096 = arith.constant 11 : i64
      %3097 = func.call @cc_make_string(%3095, %3096) : (!llvm.ptr, i64) -> i64
      %3098 = func.call @cc_intern(%3094, %3097) : (i64, i64) -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_cons(%3098, %3099) : (i64, i64) -> i64
      %3101 = func.call @cc_values_pack(%3100) : (i64) -> i64
      func.call @stack_push_pointer(%3098) : (i64) -> ()
      %3102 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3103 = arith.constant 20 : i64
      %3104 = func.call @cc_make_string(%3102, %3103) : (!llvm.ptr, i64) -> i64
      %3105 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3106 = arith.constant 11 : i64
      %3107 = func.call @cc_make_string(%3105, %3106) : (!llvm.ptr, i64) -> i64
      %3108 = func.call @cc_intern(%3104, %3107) : (i64, i64) -> i64
      %3109 = func.call @cc_nil_value() : () -> i64
      %3110 = func.call @cc_cons(%3108, %3109) : (i64, i64) -> i64
      %3111 = func.call @cc_values_pack(%3110) : (i64) -> i64
      func.call @stack_push_pointer(%3108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3112 = func.call @stack_pop_pointer() : () -> i64
      %3113 = func.call @stack_pop_pointer() : () -> i64
      %3114 = func.call @cc_cons(%3113, %3112) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3115 = arith.addi %3114, %__rlasp_stack_elide_zero_142 : i64
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @cc_cons(%3116, %3115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3117) : (i64) -> ()
      %3118 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3119 = arith.constant 3 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = func.call @cc_nil_value() : () -> i64
      %3122 = func.call @cc_intern(%3120, %3121) : (i64, i64) -> i64
      %3123 = func.call @cc_nil_value() : () -> i64
      %3124 = func.call @cc_cons(%3122, %3123) : (i64, i64) -> i64
      %3125 = func.call @cc_values_pack(%3124) : (i64) -> i64
      func.call @stack_push_pointer(%3122) : (i64) -> ()
      %3126 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3127 = arith.constant 16 : i64
      %3128 = func.call @cc_make_string(%3126, %3127) : (!llvm.ptr, i64) -> i64
      %3129 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3130 = arith.constant 11 : i64
      %3131 = func.call @cc_make_string(%3129, %3130) : (!llvm.ptr, i64) -> i64
      %3132 = func.call @cc_intern(%3128, %3131) : (i64, i64) -> i64
      %3133 = func.call @cc_nil_value() : () -> i64
      %3134 = func.call @cc_cons(%3132, %3133) : (i64, i64) -> i64
      %3135 = func.call @cc_values_pack(%3134) : (i64) -> i64
      func.call @stack_push_pointer(%3132) : (i64) -> ()
      %3136 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3137 = arith.constant 20 : i64
      %3138 = func.call @cc_make_string(%3136, %3137) : (!llvm.ptr, i64) -> i64
      %3139 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3140 = arith.constant 11 : i64
      %3141 = func.call @cc_make_string(%3139, %3140) : (!llvm.ptr, i64) -> i64
      %3142 = func.call @cc_intern(%3138, %3141) : (i64, i64) -> i64
      %3143 = func.call @cc_nil_value() : () -> i64
      %3144 = func.call @cc_cons(%3142, %3143) : (i64, i64) -> i64
      %3145 = func.call @cc_values_pack(%3144) : (i64) -> i64
      func.call @stack_push_pointer(%3142) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @cc_cons(%3147, %3146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3149 = arith.addi %3148, %__rlasp_stack_elide_zero_143 : i64
      %3150 = func.call @stack_pop_pointer() : () -> i64
      %3151 = func.call @cc_cons(%3150, %3149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = func.call @stack_pop_pointer() : () -> i64
      %3154 = func.call @cc_cons(%3153, %3152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3154) : (i64) -> ()
      %3155 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3156 = arith.constant 6 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3159 = arith.constant 11 : i64
      %3160 = func.call @cc_make_string(%3158, %3159) : (!llvm.ptr, i64) -> i64
      %3161 = func.call @cc_intern(%3157, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_nil_value() : () -> i64
      %3163 = func.call @cc_cons(%3161, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_values_pack(%3163) : (i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3165 = func.call @stack_pop_pointer() : () -> i64
      %3166 = func.call @stack_pop_pointer() : () -> i64
      %3167 = func.call @cc_cons(%3166, %3165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3167) : (i64) -> ()
      %3168 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3169 = arith.constant 16 : i64
      %3170 = func.call @cc_make_string(%3168, %3169) : (!llvm.ptr, i64) -> i64
      %3171 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3172 = arith.constant 11 : i64
      %3173 = func.call @cc_make_string(%3171, %3172) : (!llvm.ptr, i64) -> i64
      %3174 = func.call @cc_intern(%3170, %3173) : (i64, i64) -> i64
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_cons(%3174, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_values_pack(%3176) : (i64) -> i64
      func.call @stack_push_pointer(%3174) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3178 = func.call @stack_pop_pointer() : () -> i64
      %3179 = func.call @stack_pop_pointer() : () -> i64
      %3180 = func.call @cc_cons(%3179, %3178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3181 = arith.addi %3180, %__rlasp_stack_elide_zero_144 : i64
      %3182 = func.call @stack_pop_pointer() : () -> i64
      %3183 = func.call @cc_cons(%3182, %3181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3184 = arith.addi %3183, %__rlasp_stack_elide_zero_145 : i64
      %3185 = func.call @stack_pop_pointer() : () -> i64
      %3186 = func.call @cc_cons(%3185, %3184) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3187 = arith.addi %3186, %__rlasp_stack_elide_zero_146 : i64
      %3188 = func.call @stack_pop_pointer() : () -> i64
      %3189 = func.call @cc_cons(%3188, %3187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3190 = func.call @stack_pop_pointer() : () -> i64
      %3191 = func.call @stack_pop_pointer() : () -> i64
      %3192 = func.call @cc_cons(%3191, %3190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3193 = arith.addi %3192, %__rlasp_stack_elide_zero_147 : i64
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = func.call @cc_cons(%3194, %3193) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3196 = arith.addi %3195, %__rlasp_stack_elide_zero_148 : i64
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3199 = func.call @stack_pop_pointer() : () -> i64
      %3200 = func.call @stack_pop_pointer() : () -> i64
      %3201 = func.call @cc_cons(%3200, %3199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3202 = arith.addi %3201, %__rlasp_stack_elide_zero_149 : i64
      %3203 = func.call @stack_pop_pointer() : () -> i64
      %3204 = func.call @cc_cons(%3203, %3202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3204) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @stack_pop_pointer() : () -> i64
      %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3208 = arith.addi %3207, %__rlasp_stack_elide_zero_150 : i64
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @cc_cons(%3209, %3208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3211 = arith.addi %3210, %__rlasp_stack_elide_zero_151 : i64
      %3330 = arith.constant 116254966808588 : i64
      %3331 = arith.constant 0 : i64
      %3332 = func.call @cc_make_closure(%3330, %3331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3333 = arith.addi %3332, %__rlasp_stack_elide_zero_152 : i64
      %3334 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3335 = arith.constant 1 : i64
      %3336 = func.call @cc_make_string(%3334, %3335) : (!llvm.ptr, i64) -> i64
      %3337 = func.call @cc_nil_value() : () -> i64
      %3338 = func.call @cc_intern(%3336, %3337) : (i64, i64) -> i64
      %3339 = func.call @cc_nil_value() : () -> i64
      %3340 = func.call @cc_cons(%3338, %3339) : (i64, i64) -> i64
      %3341 = func.call @cc_values_pack(%3340) : (i64) -> i64
      func.call @stack_push_pointer(%3338) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3342 = func.call @stack_pop_pointer() : () -> i64
      %3343 = func.call @stack_pop_pointer() : () -> i64
      %3344 = func.call @cc_cons(%3343, %3342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3345 = arith.addi %3344, %__rlasp_stack_elide_zero_153 : i64
      %3346 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3347 = arith.constant 11 : i64
      %3348 = func.call @cc_make_string(%3346, %3347) : (!llvm.ptr, i64) -> i64
      %3349 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3350 = arith.constant 7 : i64
      %3351 = func.call @cc_make_string(%3349, %3350) : (!llvm.ptr, i64) -> i64
      %3352 = func.call @cc_intern(%3348, %3351) : (i64, i64) -> i64
      %3353 = func.call @cc_nil_value() : () -> i64
      %3354 = func.call @cc_cons(%3352, %3353) : (i64, i64) -> i64
      %3355 = func.call @cc_values_pack(%3354) : (i64) -> i64
      %3356 = func.call @cc_nil_value() : () -> i64
      %3357 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3358 = arith.constant 4 : i64
      %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
      %3360 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3361 = arith.constant 7 : i64
      %3362 = func.call @cc_make_string(%3360, %3361) : (!llvm.ptr, i64) -> i64
      %3363 = func.call @cc_intern(%3359, %3362) : (i64, i64) -> i64
      %3364 = func.call @cc_nil_value() : () -> i64
      %3365 = func.call @cc_cons(%3363, %3364) : (i64, i64) -> i64
      %3366 = func.call @cc_values_pack(%3365) : (i64) -> i64
      %3367 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3368 = arith.constant 6 : i64
      %3369 = func.call @cc_make_string(%3367, %3368) : (!llvm.ptr, i64) -> i64
      %3370 = func.call @cc_nil_value() : () -> i64
      %3371 = func.call @cc_intern(%3369, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_nil_value() : () -> i64
      %3373 = func.call @cc_cons(%3371, %3372) : (i64, i64) -> i64
      %3374 = func.call @cc_values_pack(%3373) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3375 = arith.addi %3371, %__rlasp_stack_elide_zero_154 : i64
      %3376 = func.call @cc_nil_value() : () -> i64
      %3377 = func.call @cc_errorp(%3065) : (i64) -> i64
      %3378 = arith.cmpi ne, %3377, %3376 : i64
      %3379 = arith.cmpi eq, %3376, %3376 : i64
      %3380 = arith.andi %3378, %3379 : i1
      %3381 = scf.if %3380 -> (i64) {
        scf.yield %3065 : i64
      } else {
        scf.yield %3376 : i64
      }
      %3382 = func.call @cc_errorp(%3211) : (i64) -> i64
      %3383 = arith.cmpi ne, %3382, %3376 : i64
      %3384 = arith.cmpi eq, %3381, %3376 : i64
      %3385 = arith.andi %3383, %3384 : i1
      %3386 = scf.if %3385 -> (i64) {
        scf.yield %3211 : i64
      } else {
        scf.yield %3381 : i64
      }
      %3387 = func.call @cc_errorp(%3333) : (i64) -> i64
      %3388 = arith.cmpi ne, %3387, %3376 : i64
      %3389 = arith.cmpi eq, %3386, %3376 : i64
      %3390 = arith.andi %3388, %3389 : i1
      %3391 = scf.if %3390 -> (i64) {
        scf.yield %3333 : i64
      } else {
        scf.yield %3386 : i64
      }
      %3392 = func.call @cc_errorp(%3345) : (i64) -> i64
      %3393 = arith.cmpi ne, %3392, %3376 : i64
      %3394 = arith.cmpi eq, %3391, %3376 : i64
      %3395 = arith.andi %3393, %3394 : i1
      %3396 = scf.if %3395 -> (i64) {
        scf.yield %3345 : i64
      } else {
        scf.yield %3391 : i64
      }
      %3397 = func.call @cc_errorp(%3352) : (i64) -> i64
      %3398 = arith.cmpi ne, %3397, %3376 : i64
      %3399 = arith.cmpi eq, %3396, %3376 : i64
      %3400 = arith.andi %3398, %3399 : i1
      %3401 = scf.if %3400 -> (i64) {
        scf.yield %3352 : i64
      } else {
        scf.yield %3396 : i64
      }
      %3402 = func.call @cc_errorp(%3356) : (i64) -> i64
      %3403 = arith.cmpi ne, %3402, %3376 : i64
      %3404 = arith.cmpi eq, %3401, %3376 : i64
      %3405 = arith.andi %3403, %3404 : i1
      %3406 = scf.if %3405 -> (i64) {
        scf.yield %3356 : i64
      } else {
        scf.yield %3401 : i64
      }
      %3407 = func.call @cc_errorp(%3363) : (i64) -> i64
      %3408 = arith.cmpi ne, %3407, %3376 : i64
      %3409 = arith.cmpi eq, %3406, %3376 : i64
      %3410 = arith.andi %3408, %3409 : i1
      %3411 = scf.if %3410 -> (i64) {
        scf.yield %3363 : i64
      } else {
        scf.yield %3406 : i64
      }
      %3412 = func.call @cc_errorp(%3375) : (i64) -> i64
      %3413 = arith.cmpi ne, %3412, %3376 : i64
      %3414 = arith.cmpi eq, %3411, %3376 : i64
      %3415 = arith.andi %3413, %3414 : i1
      %3416 = scf.if %3415 -> (i64) {
        scf.yield %3375 : i64
      } else {
        scf.yield %3411 : i64
      }
      %3417 = arith.cmpi ne, %3416, %3376 : i64
      scf.if %3417 {
        func.call @stack_push_pointer(%3416) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3065) : (i64) -> ()
        func.call @stack_push_pointer(%3211) : (i64) -> ()
        func.call @stack_push_pointer(%3333) : (i64) -> ()
        func.call @stack_push_pointer(%3345) : (i64) -> ()
        func.call @stack_push_pointer(%3352) : (i64) -> ()
        func.call @stack_push_pointer(%3356) : (i64) -> ()
        func.call @stack_push_pointer(%3363) : (i64) -> ()
        func.call @stack_push_pointer(%3375) : (i64) -> ()
        %3418 = llvm.mlir.addressof @str270 : !llvm.ptr
        %3419 = func.call @cc_make_function_ref_const(%3418) : (!llvm.ptr) -> i64
        %3420 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3419, %3420) : (i64, i64) -> ()
      }
      %3421 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3421 : i64
    }
    %3422 = func.call @cc_nil_value() : () -> i64
    %3423 = func.call @cc_errorp(%3056) : (i64) -> i64
    %3424 = arith.cmpi ne, %3423, %3422 : i64
    %3425 = scf.if %3424 -> (i64) {
      scf.yield %3056 : i64
    } else {
      %3426 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3427 = arith.constant 8 : i64
      %3428 = func.call @cc_make_string(%3426, %3427) : (!llvm.ptr, i64) -> i64
      %3429 = func.call @cc_nil_value() : () -> i64
      %3430 = func.call @cc_intern(%3428, %3429) : (i64, i64) -> i64
      %3431 = func.call @cc_nil_value() : () -> i64
      %3432 = func.call @cc_cons(%3430, %3431) : (i64, i64) -> i64
      %3433 = func.call @cc_values_pack(%3432) : (i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3434 = arith.addi %3430, %__rlasp_stack_elide_zero_155 : i64
      %3435 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3436 = arith.constant 13 : i64
      %3437 = func.call @cc_make_string(%3435, %3436) : (!llvm.ptr, i64) -> i64
      %3438 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3439 = arith.constant 11 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = func.call @cc_intern(%3437, %3440) : (i64, i64) -> i64
      %3442 = func.call @cc_nil_value() : () -> i64
      %3443 = func.call @cc_cons(%3441, %3442) : (i64, i64) -> i64
      %3444 = func.call @cc_values_pack(%3443) : (i64) -> i64
      func.call @stack_push_pointer(%3441) : (i64) -> ()
      %3445 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3446 = arith.constant 6 : i64
      %3447 = func.call @cc_make_string(%3445, %3446) : (!llvm.ptr, i64) -> i64
      %3448 = func.call @cc_nil_value() : () -> i64
      %3449 = func.call @cc_intern(%3447, %3448) : (i64, i64) -> i64
      %3450 = func.call @cc_nil_value() : () -> i64
      %3451 = func.call @cc_cons(%3449, %3450) : (i64, i64) -> i64
      %3452 = func.call @cc_values_pack(%3451) : (i64) -> i64
      func.call @stack_push_pointer(%3449) : (i64) -> ()
      %3453 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3454 = arith.constant 19 : i64
      %3455 = func.call @cc_make_string(%3453, %3454) : (!llvm.ptr, i64) -> i64
      %3456 = func.call @cc_nil_value() : () -> i64
      %3457 = func.call @cc_intern(%3455, %3456) : (i64, i64) -> i64
      %3458 = func.call @cc_nil_value() : () -> i64
      %3459 = func.call @cc_cons(%3457, %3458) : (i64, i64) -> i64
      %3460 = func.call @cc_values_pack(%3459) : (i64) -> i64
      func.call @stack_push_pointer(%3457) : (i64) -> ()
      %3461 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3462 = arith.constant 3 : i64
      %3463 = func.call @cc_make_string(%3461, %3462) : (!llvm.ptr, i64) -> i64
      %3464 = func.call @cc_nil_value() : () -> i64
      %3465 = func.call @cc_intern(%3463, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3470 = arith.constant 16 : i64
      %3471 = func.call @cc_make_string(%3469, %3470) : (!llvm.ptr, i64) -> i64
      %3472 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3473 = arith.constant 11 : i64
      %3474 = func.call @cc_make_string(%3472, %3473) : (!llvm.ptr, i64) -> i64
      %3475 = func.call @cc_intern(%3471, %3474) : (i64, i64) -> i64
      %3476 = func.call @cc_nil_value() : () -> i64
      %3477 = func.call @cc_cons(%3475, %3476) : (i64, i64) -> i64
      %3478 = func.call @cc_values_pack(%3477) : (i64) -> i64
      func.call @stack_push_pointer(%3475) : (i64) -> ()
      %3479 = arith.constant -1 : i64
      func.call @stack_push_fixnum(%3479) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3480 = func.call @stack_pop_pointer() : () -> i64
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @cc_cons(%3481, %3480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3483 = arith.addi %3482, %__rlasp_stack_elide_zero_156 : i64
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @cc_cons(%3484, %3483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3486 = func.call @stack_pop_pointer() : () -> i64
      %3487 = func.call @stack_pop_pointer() : () -> i64
      %3488 = func.call @cc_cons(%3487, %3486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3488) : (i64) -> ()
      %3489 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3490 = arith.constant 6 : i64
      %3491 = func.call @cc_make_string(%3489, %3490) : (!llvm.ptr, i64) -> i64
      %3492 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3493 = arith.constant 11 : i64
      %3494 = func.call @cc_make_string(%3492, %3493) : (!llvm.ptr, i64) -> i64
      %3495 = func.call @cc_intern(%3491, %3494) : (i64, i64) -> i64
      %3496 = func.call @cc_nil_value() : () -> i64
      %3497 = func.call @cc_cons(%3495, %3496) : (i64, i64) -> i64
      %3498 = func.call @cc_values_pack(%3497) : (i64) -> i64
      func.call @stack_push_pointer(%3495) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3499 = func.call @stack_pop_pointer() : () -> i64
      %3500 = func.call @stack_pop_pointer() : () -> i64
      %3501 = func.call @cc_cons(%3500, %3499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3502 = func.call @stack_pop_pointer() : () -> i64
      %3503 = func.call @stack_pop_pointer() : () -> i64
      %3504 = func.call @cc_cons(%3503, %3502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3505 = arith.addi %3504, %__rlasp_stack_elide_zero_157 : i64
      %3506 = func.call @stack_pop_pointer() : () -> i64
      %3507 = func.call @cc_cons(%3506, %3505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3508 = arith.addi %3507, %__rlasp_stack_elide_zero_158 : i64
      %3509 = func.call @stack_pop_pointer() : () -> i64
      %3510 = func.call @cc_cons(%3509, %3508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = func.call @stack_pop_pointer() : () -> i64
      %3513 = func.call @cc_cons(%3512, %3511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3514 = arith.addi %3513, %__rlasp_stack_elide_zero_159 : i64
      %3515 = func.call @stack_pop_pointer() : () -> i64
      %3516 = func.call @cc_cons(%3515, %3514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3516) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3517 = func.call @stack_pop_pointer() : () -> i64
      %3518 = func.call @stack_pop_pointer() : () -> i64
      %3519 = func.call @cc_cons(%3518, %3517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3520 = arith.addi %3519, %__rlasp_stack_elide_zero_160 : i64
      %3521 = func.call @stack_pop_pointer() : () -> i64
      %3522 = func.call @cc_cons(%3521, %3520) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3523 = arith.addi %3522, %__rlasp_stack_elide_zero_161 : i64
      %3524 = func.call @stack_pop_pointer() : () -> i64
      %3525 = func.call @cc_cons(%3524, %3523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3525) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3526 = func.call @stack_pop_pointer() : () -> i64
      %3527 = func.call @stack_pop_pointer() : () -> i64
      %3528 = func.call @cc_cons(%3527, %3526) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3529 = arith.addi %3528, %__rlasp_stack_elide_zero_162 : i64
      %3530 = func.call @stack_pop_pointer() : () -> i64
      %3531 = func.call @cc_cons(%3530, %3529) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3532 = arith.addi %3531, %__rlasp_stack_elide_zero_163 : i64
      %3592 = arith.constant 116254966808589 : i64
      %3593 = arith.constant 0 : i64
      %3594 = func.call @cc_make_closure(%3592, %3593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3595 = arith.addi %3594, %__rlasp_stack_elide_zero_164 : i64
      %3596 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3597 = arith.constant 4 : i64
      %3598 = func.call @cc_make_string(%3596, %3597) : (!llvm.ptr, i64) -> i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_intern(%3598, %3599) : (i64, i64) -> i64
      %3601 = func.call @cc_nil_value() : () -> i64
      %3602 = func.call @cc_cons(%3600, %3601) : (i64, i64) -> i64
      %3603 = func.call @cc_values_pack(%3602) : (i64) -> i64
      func.call @stack_push_pointer(%3600) : (i64) -> ()
      %3604 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3605 = arith.constant 10 : i64
      %3606 = func.call @cc_make_string(%3604, %3605) : (!llvm.ptr, i64) -> i64
      %3607 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3608 = arith.constant 11 : i64
      %3609 = func.call @cc_make_string(%3607, %3608) : (!llvm.ptr, i64) -> i64
      %3610 = func.call @cc_intern(%3606, %3609) : (i64, i64) -> i64
      %3611 = func.call @cc_nil_value() : () -> i64
      %3612 = func.call @cc_cons(%3610, %3611) : (i64, i64) -> i64
      %3613 = func.call @cc_values_pack(%3612) : (i64) -> i64
      func.call @stack_push_pointer(%3610) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3614 = func.call @stack_pop_pointer() : () -> i64
      %3615 = func.call @stack_pop_pointer() : () -> i64
      %3616 = func.call @cc_cons(%3615, %3614) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3617 = arith.addi %3616, %__rlasp_stack_elide_zero_165 : i64
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @cc_cons(%3618, %3617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3620 = arith.addi %3619, %__rlasp_stack_elide_zero_166 : i64
      %3621 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3622 = arith.constant 11 : i64
      %3623 = func.call @cc_make_string(%3621, %3622) : (!llvm.ptr, i64) -> i64
      %3624 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3625 = arith.constant 7 : i64
      %3626 = func.call @cc_make_string(%3624, %3625) : (!llvm.ptr, i64) -> i64
      %3627 = func.call @cc_intern(%3623, %3626) : (i64, i64) -> i64
      %3628 = func.call @cc_nil_value() : () -> i64
      %3629 = func.call @cc_cons(%3627, %3628) : (i64, i64) -> i64
      %3630 = func.call @cc_values_pack(%3629) : (i64) -> i64
      %3631 = func.call @cc_nil_value() : () -> i64
      %3632 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3633 = arith.constant 4 : i64
      %3634 = func.call @cc_make_string(%3632, %3633) : (!llvm.ptr, i64) -> i64
      %3635 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3636 = arith.constant 7 : i64
      %3637 = func.call @cc_make_string(%3635, %3636) : (!llvm.ptr, i64) -> i64
      %3638 = func.call @cc_intern(%3634, %3637) : (i64, i64) -> i64
      %3639 = func.call @cc_nil_value() : () -> i64
      %3640 = func.call @cc_cons(%3638, %3639) : (i64, i64) -> i64
      %3641 = func.call @cc_values_pack(%3640) : (i64) -> i64
      %3642 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3643 = arith.constant 5 : i64
      %3644 = func.call @cc_make_string(%3642, %3643) : (!llvm.ptr, i64) -> i64
      %3645 = func.call @cc_nil_value() : () -> i64
      %3646 = func.call @cc_intern(%3644, %3645) : (i64, i64) -> i64
      %3647 = func.call @cc_nil_value() : () -> i64
      %3648 = func.call @cc_cons(%3646, %3647) : (i64, i64) -> i64
      %3649 = func.call @cc_values_pack(%3648) : (i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3650 = arith.addi %3646, %__rlasp_stack_elide_zero_167 : i64
      %3651 = func.call @cc_nil_value() : () -> i64
      %3652 = func.call @cc_errorp(%3434) : (i64) -> i64
      %3653 = arith.cmpi ne, %3652, %3651 : i64
      %3654 = arith.cmpi eq, %3651, %3651 : i64
      %3655 = arith.andi %3653, %3654 : i1
      %3656 = scf.if %3655 -> (i64) {
        scf.yield %3434 : i64
      } else {
        scf.yield %3651 : i64
      }
      %3657 = func.call @cc_errorp(%3532) : (i64) -> i64
      %3658 = arith.cmpi ne, %3657, %3651 : i64
      %3659 = arith.cmpi eq, %3656, %3651 : i64
      %3660 = arith.andi %3658, %3659 : i1
      %3661 = scf.if %3660 -> (i64) {
        scf.yield %3532 : i64
      } else {
        scf.yield %3656 : i64
      }
      %3662 = func.call @cc_errorp(%3595) : (i64) -> i64
      %3663 = arith.cmpi ne, %3662, %3651 : i64
      %3664 = arith.cmpi eq, %3661, %3651 : i64
      %3665 = arith.andi %3663, %3664 : i1
      %3666 = scf.if %3665 -> (i64) {
        scf.yield %3595 : i64
      } else {
        scf.yield %3661 : i64
      }
      %3667 = func.call @cc_errorp(%3620) : (i64) -> i64
      %3668 = arith.cmpi ne, %3667, %3651 : i64
      %3669 = arith.cmpi eq, %3666, %3651 : i64
      %3670 = arith.andi %3668, %3669 : i1
      %3671 = scf.if %3670 -> (i64) {
        scf.yield %3620 : i64
      } else {
        scf.yield %3666 : i64
      }
      %3672 = func.call @cc_errorp(%3627) : (i64) -> i64
      %3673 = arith.cmpi ne, %3672, %3651 : i64
      %3674 = arith.cmpi eq, %3671, %3651 : i64
      %3675 = arith.andi %3673, %3674 : i1
      %3676 = scf.if %3675 -> (i64) {
        scf.yield %3627 : i64
      } else {
        scf.yield %3671 : i64
      }
      %3677 = func.call @cc_errorp(%3631) : (i64) -> i64
      %3678 = arith.cmpi ne, %3677, %3651 : i64
      %3679 = arith.cmpi eq, %3676, %3651 : i64
      %3680 = arith.andi %3678, %3679 : i1
      %3681 = scf.if %3680 -> (i64) {
        scf.yield %3631 : i64
      } else {
        scf.yield %3676 : i64
      }
      %3682 = func.call @cc_errorp(%3638) : (i64) -> i64
      %3683 = arith.cmpi ne, %3682, %3651 : i64
      %3684 = arith.cmpi eq, %3681, %3651 : i64
      %3685 = arith.andi %3683, %3684 : i1
      %3686 = scf.if %3685 -> (i64) {
        scf.yield %3638 : i64
      } else {
        scf.yield %3681 : i64
      }
      %3687 = func.call @cc_errorp(%3650) : (i64) -> i64
      %3688 = arith.cmpi ne, %3687, %3651 : i64
      %3689 = arith.cmpi eq, %3686, %3651 : i64
      %3690 = arith.andi %3688, %3689 : i1
      %3691 = scf.if %3690 -> (i64) {
        scf.yield %3650 : i64
      } else {
        scf.yield %3686 : i64
      }
      %3692 = arith.cmpi ne, %3691, %3651 : i64
      scf.if %3692 {
        func.call @stack_push_pointer(%3691) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3434) : (i64) -> ()
        func.call @stack_push_pointer(%3532) : (i64) -> ()
        func.call @stack_push_pointer(%3595) : (i64) -> ()
        func.call @stack_push_pointer(%3620) : (i64) -> ()
        func.call @stack_push_pointer(%3627) : (i64) -> ()
        func.call @stack_push_pointer(%3631) : (i64) -> ()
        func.call @stack_push_pointer(%3638) : (i64) -> ()
        func.call @stack_push_pointer(%3650) : (i64) -> ()
        %3693 = llvm.mlir.addressof @str290 : !llvm.ptr
        %3694 = func.call @cc_make_function_ref_const(%3693) : (!llvm.ptr) -> i64
        %3695 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3694, %3695) : (i64, i64) -> ()
      }
      %3696 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3696 : i64
    }
    %3697 = func.call @cc_nil_value() : () -> i64
    %3698 = func.call @cc_errorp(%3425) : (i64) -> i64
    %3699 = arith.cmpi ne, %3698, %3697 : i64
    %3700 = scf.if %3699 -> (i64) {
      scf.yield %3425 : i64
    } else {
      %3701 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3702 = arith.constant 8 : i64
      %3703 = func.call @cc_make_string(%3701, %3702) : (!llvm.ptr, i64) -> i64
      %3704 = func.call @cc_nil_value() : () -> i64
      %3705 = func.call @cc_intern(%3703, %3704) : (i64, i64) -> i64
      %3706 = func.call @cc_nil_value() : () -> i64
      %3707 = func.call @cc_cons(%3705, %3706) : (i64, i64) -> i64
      %3708 = func.call @cc_values_pack(%3707) : (i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3709 = arith.addi %3705, %__rlasp_stack_elide_zero_168 : i64
      %3710 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3711 = arith.constant 13 : i64
      %3712 = func.call @cc_make_string(%3710, %3711) : (!llvm.ptr, i64) -> i64
      %3713 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3714 = arith.constant 11 : i64
      %3715 = func.call @cc_make_string(%3713, %3714) : (!llvm.ptr, i64) -> i64
      %3716 = func.call @cc_intern(%3712, %3715) : (i64, i64) -> i64
      %3717 = func.call @cc_nil_value() : () -> i64
      %3718 = func.call @cc_cons(%3716, %3717) : (i64, i64) -> i64
      %3719 = func.call @cc_values_pack(%3718) : (i64) -> i64
      func.call @stack_push_pointer(%3716) : (i64) -> ()
      %3720 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3721 = arith.constant 6 : i64
      %3722 = func.call @cc_make_string(%3720, %3721) : (!llvm.ptr, i64) -> i64
      %3723 = func.call @cc_nil_value() : () -> i64
      %3724 = func.call @cc_intern(%3722, %3723) : (i64, i64) -> i64
      %3725 = func.call @cc_nil_value() : () -> i64
      %3726 = func.call @cc_cons(%3724, %3725) : (i64, i64) -> i64
      %3727 = func.call @cc_values_pack(%3726) : (i64) -> i64
      func.call @stack_push_pointer(%3724) : (i64) -> ()
      %3728 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3729 = arith.constant 19 : i64
      %3730 = func.call @cc_make_string(%3728, %3729) : (!llvm.ptr, i64) -> i64
      %3731 = func.call @cc_nil_value() : () -> i64
      %3732 = func.call @cc_intern(%3730, %3731) : (i64, i64) -> i64
      %3733 = func.call @cc_nil_value() : () -> i64
      %3734 = func.call @cc_cons(%3732, %3733) : (i64, i64) -> i64
      %3735 = func.call @cc_values_pack(%3734) : (i64) -> i64
      func.call @stack_push_pointer(%3732) : (i64) -> ()
      %3736 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3737 = arith.constant 3 : i64
      %3738 = func.call @cc_make_string(%3736, %3737) : (!llvm.ptr, i64) -> i64
      %3739 = func.call @cc_nil_value() : () -> i64
      %3740 = func.call @cc_intern(%3738, %3739) : (i64, i64) -> i64
      %3741 = func.call @cc_nil_value() : () -> i64
      %3742 = func.call @cc_cons(%3740, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_values_pack(%3742) : (i64) -> i64
      func.call @stack_push_pointer(%3740) : (i64) -> ()
      %3744 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3745 = arith.constant 16 : i64
      %3746 = func.call @cc_make_string(%3744, %3745) : (!llvm.ptr, i64) -> i64
      %3747 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3748 = arith.constant 11 : i64
      %3749 = func.call @cc_make_string(%3747, %3748) : (!llvm.ptr, i64) -> i64
      %3750 = func.call @cc_intern(%3746, %3749) : (i64, i64) -> i64
      %3751 = func.call @cc_nil_value() : () -> i64
      %3752 = func.call @cc_cons(%3750, %3751) : (i64, i64) -> i64
      %3753 = func.call @cc_values_pack(%3752) : (i64) -> i64
      func.call @stack_push_pointer(%3750) : (i64) -> ()
      %3754 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3755 = arith.constant 2 : i64
      %3756 = func.call @cc_make_string(%3754, %3755) : (!llvm.ptr, i64) -> i64
      %3757 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3758 = arith.constant 11 : i64
      %3759 = func.call @cc_make_string(%3757, %3758) : (!llvm.ptr, i64) -> i64
      %3760 = func.call @cc_intern(%3756, %3759) : (i64, i64) -> i64
      %3761 = func.call @cc_nil_value() : () -> i64
      %3762 = func.call @cc_cons(%3760, %3761) : (i64, i64) -> i64
      %3763 = func.call @cc_values_pack(%3762) : (i64) -> i64
      func.call @stack_push_pointer(%3760) : (i64) -> ()
      %3764 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3765 = arith.constant 20 : i64
      %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
      %3767 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3768 = arith.constant 11 : i64
      %3769 = func.call @cc_make_string(%3767, %3768) : (!llvm.ptr, i64) -> i64
      %3770 = func.call @cc_intern(%3766, %3769) : (i64, i64) -> i64
      %3771 = func.call @cc_nil_value() : () -> i64
      %3772 = func.call @cc_cons(%3770, %3771) : (i64, i64) -> i64
      %3773 = func.call @cc_values_pack(%3772) : (i64) -> i64
      func.call @stack_push_pointer(%3770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = func.call @stack_pop_pointer() : () -> i64
      %3776 = func.call @cc_cons(%3775, %3774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3777 = arith.addi %3776, %__rlasp_stack_elide_zero_169 : i64
      %3778 = func.call @stack_pop_pointer() : () -> i64
      %3779 = func.call @cc_cons(%3778, %3777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3779) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3780 = func.call @stack_pop_pointer() : () -> i64
      %3781 = func.call @stack_pop_pointer() : () -> i64
      %3782 = func.call @cc_cons(%3781, %3780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3783 = arith.addi %3782, %__rlasp_stack_elide_zero_170 : i64
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = func.call @cc_cons(%3784, %3783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3785) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3786 = func.call @stack_pop_pointer() : () -> i64
      %3787 = func.call @stack_pop_pointer() : () -> i64
      %3788 = func.call @cc_cons(%3787, %3786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3788) : (i64) -> ()
      %3789 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3790 = arith.constant 6 : i64
      %3791 = func.call @cc_make_string(%3789, %3790) : (!llvm.ptr, i64) -> i64
      %3792 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3793 = arith.constant 11 : i64
      %3794 = func.call @cc_make_string(%3792, %3793) : (!llvm.ptr, i64) -> i64
      %3795 = func.call @cc_intern(%3791, %3794) : (i64, i64) -> i64
      %3796 = func.call @cc_nil_value() : () -> i64
      %3797 = func.call @cc_cons(%3795, %3796) : (i64, i64) -> i64
      %3798 = func.call @cc_values_pack(%3797) : (i64) -> i64
      func.call @stack_push_pointer(%3795) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3799 = func.call @stack_pop_pointer() : () -> i64
      %3800 = func.call @stack_pop_pointer() : () -> i64
      %3801 = func.call @cc_cons(%3800, %3799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3802 = func.call @stack_pop_pointer() : () -> i64
      %3803 = func.call @stack_pop_pointer() : () -> i64
      %3804 = func.call @cc_cons(%3803, %3802) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3805 = arith.addi %3804, %__rlasp_stack_elide_zero_171 : i64
      %3806 = func.call @stack_pop_pointer() : () -> i64
      %3807 = func.call @cc_cons(%3806, %3805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3808 = arith.addi %3807, %__rlasp_stack_elide_zero_172 : i64
      %3809 = func.call @stack_pop_pointer() : () -> i64
      %3810 = func.call @cc_cons(%3809, %3808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3810) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3811 = func.call @stack_pop_pointer() : () -> i64
      %3812 = func.call @stack_pop_pointer() : () -> i64
      %3813 = func.call @cc_cons(%3812, %3811) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3814 = arith.addi %3813, %__rlasp_stack_elide_zero_173 : i64
      %3815 = func.call @stack_pop_pointer() : () -> i64
      %3816 = func.call @cc_cons(%3815, %3814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3816) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3817 = func.call @stack_pop_pointer() : () -> i64
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = func.call @cc_cons(%3818, %3817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3820 = arith.addi %3819, %__rlasp_stack_elide_zero_174 : i64
      %3821 = func.call @stack_pop_pointer() : () -> i64
      %3822 = func.call @cc_cons(%3821, %3820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3823 = arith.addi %3822, %__rlasp_stack_elide_zero_175 : i64
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = func.call @cc_cons(%3824, %3823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3826 = func.call @stack_pop_pointer() : () -> i64
      %3827 = func.call @stack_pop_pointer() : () -> i64
      %3828 = func.call @cc_cons(%3827, %3826) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3829 = arith.addi %3828, %__rlasp_stack_elide_zero_176 : i64
      %3830 = func.call @stack_pop_pointer() : () -> i64
      %3831 = func.call @cc_cons(%3830, %3829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3832 = arith.addi %3831, %__rlasp_stack_elide_zero_177 : i64
      %3929 = arith.constant 116254966808590 : i64
      %3930 = arith.constant 0 : i64
      %3931 = func.call @cc_make_closure(%3929, %3930) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3932 = arith.addi %3931, %__rlasp_stack_elide_zero_178 : i64
      %3933 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3934 = arith.constant 4 : i64
      %3935 = func.call @cc_make_string(%3933, %3934) : (!llvm.ptr, i64) -> i64
      %3936 = func.call @cc_nil_value() : () -> i64
      %3937 = func.call @cc_intern(%3935, %3936) : (i64, i64) -> i64
      %3938 = func.call @cc_nil_value() : () -> i64
      %3939 = func.call @cc_cons(%3937, %3938) : (i64, i64) -> i64
      %3940 = func.call @cc_values_pack(%3939) : (i64) -> i64
      func.call @stack_push_pointer(%3937) : (i64) -> ()
      %3941 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3942 = arith.constant 10 : i64
      %3943 = func.call @cc_make_string(%3941, %3942) : (!llvm.ptr, i64) -> i64
      %3944 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3945 = arith.constant 11 : i64
      %3946 = func.call @cc_make_string(%3944, %3945) : (!llvm.ptr, i64) -> i64
      %3947 = func.call @cc_intern(%3943, %3946) : (i64, i64) -> i64
      %3948 = func.call @cc_nil_value() : () -> i64
      %3949 = func.call @cc_cons(%3947, %3948) : (i64, i64) -> i64
      %3950 = func.call @cc_values_pack(%3949) : (i64) -> i64
      func.call @stack_push_pointer(%3947) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3951 = func.call @stack_pop_pointer() : () -> i64
      %3952 = func.call @stack_pop_pointer() : () -> i64
      %3953 = func.call @cc_cons(%3952, %3951) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3954 = arith.addi %3953, %__rlasp_stack_elide_zero_179 : i64
      %3955 = func.call @stack_pop_pointer() : () -> i64
      %3956 = func.call @cc_cons(%3955, %3954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3957 = arith.addi %3956, %__rlasp_stack_elide_zero_180 : i64
      %3958 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3959 = arith.constant 11 : i64
      %3960 = func.call @cc_make_string(%3958, %3959) : (!llvm.ptr, i64) -> i64
      %3961 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3962 = arith.constant 7 : i64
      %3963 = func.call @cc_make_string(%3961, %3962) : (!llvm.ptr, i64) -> i64
      %3964 = func.call @cc_intern(%3960, %3963) : (i64, i64) -> i64
      %3965 = func.call @cc_nil_value() : () -> i64
      %3966 = func.call @cc_cons(%3964, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_values_pack(%3966) : (i64) -> i64
      %3968 = func.call @cc_nil_value() : () -> i64
      %3969 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3970 = arith.constant 4 : i64
      %3971 = func.call @cc_make_string(%3969, %3970) : (!llvm.ptr, i64) -> i64
      %3972 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3973 = arith.constant 7 : i64
      %3974 = func.call @cc_make_string(%3972, %3973) : (!llvm.ptr, i64) -> i64
      %3975 = func.call @cc_intern(%3971, %3974) : (i64, i64) -> i64
      %3976 = func.call @cc_nil_value() : () -> i64
      %3977 = func.call @cc_cons(%3975, %3976) : (i64, i64) -> i64
      %3978 = func.call @cc_values_pack(%3977) : (i64) -> i64
      %3979 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3980 = arith.constant 5 : i64
      %3981 = func.call @cc_make_string(%3979, %3980) : (!llvm.ptr, i64) -> i64
      %3982 = func.call @cc_nil_value() : () -> i64
      %3983 = func.call @cc_intern(%3981, %3982) : (i64, i64) -> i64
      %3984 = func.call @cc_nil_value() : () -> i64
      %3985 = func.call @cc_cons(%3983, %3984) : (i64, i64) -> i64
      %3986 = func.call @cc_values_pack(%3985) : (i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3987 = arith.addi %3983, %__rlasp_stack_elide_zero_181 : i64
      %3988 = func.call @cc_nil_value() : () -> i64
      %3989 = func.call @cc_errorp(%3709) : (i64) -> i64
      %3990 = arith.cmpi ne, %3989, %3988 : i64
      %3991 = arith.cmpi eq, %3988, %3988 : i64
      %3992 = arith.andi %3990, %3991 : i1
      %3993 = scf.if %3992 -> (i64) {
        scf.yield %3709 : i64
      } else {
        scf.yield %3988 : i64
      }
      %3994 = func.call @cc_errorp(%3832) : (i64) -> i64
      %3995 = arith.cmpi ne, %3994, %3988 : i64
      %3996 = arith.cmpi eq, %3993, %3988 : i64
      %3997 = arith.andi %3995, %3996 : i1
      %3998 = scf.if %3997 -> (i64) {
        scf.yield %3832 : i64
      } else {
        scf.yield %3993 : i64
      }
      %3999 = func.call @cc_errorp(%3932) : (i64) -> i64
      %4000 = arith.cmpi ne, %3999, %3988 : i64
      %4001 = arith.cmpi eq, %3998, %3988 : i64
      %4002 = arith.andi %4000, %4001 : i1
      %4003 = scf.if %4002 -> (i64) {
        scf.yield %3932 : i64
      } else {
        scf.yield %3998 : i64
      }
      %4004 = func.call @cc_errorp(%3957) : (i64) -> i64
      %4005 = arith.cmpi ne, %4004, %3988 : i64
      %4006 = arith.cmpi eq, %4003, %3988 : i64
      %4007 = arith.andi %4005, %4006 : i1
      %4008 = scf.if %4007 -> (i64) {
        scf.yield %3957 : i64
      } else {
        scf.yield %4003 : i64
      }
      %4009 = func.call @cc_errorp(%3964) : (i64) -> i64
      %4010 = arith.cmpi ne, %4009, %3988 : i64
      %4011 = arith.cmpi eq, %4008, %3988 : i64
      %4012 = arith.andi %4010, %4011 : i1
      %4013 = scf.if %4012 -> (i64) {
        scf.yield %3964 : i64
      } else {
        scf.yield %4008 : i64
      }
      %4014 = func.call @cc_errorp(%3968) : (i64) -> i64
      %4015 = arith.cmpi ne, %4014, %3988 : i64
      %4016 = arith.cmpi eq, %4013, %3988 : i64
      %4017 = arith.andi %4015, %4016 : i1
      %4018 = scf.if %4017 -> (i64) {
        scf.yield %3968 : i64
      } else {
        scf.yield %4013 : i64
      }
      %4019 = func.call @cc_errorp(%3975) : (i64) -> i64
      %4020 = arith.cmpi ne, %4019, %3988 : i64
      %4021 = arith.cmpi eq, %4018, %3988 : i64
      %4022 = arith.andi %4020, %4021 : i1
      %4023 = scf.if %4022 -> (i64) {
        scf.yield %3975 : i64
      } else {
        scf.yield %4018 : i64
      }
      %4024 = func.call @cc_errorp(%3987) : (i64) -> i64
      %4025 = arith.cmpi ne, %4024, %3988 : i64
      %4026 = arith.cmpi eq, %4023, %3988 : i64
      %4027 = arith.andi %4025, %4026 : i1
      %4028 = scf.if %4027 -> (i64) {
        scf.yield %3987 : i64
      } else {
        scf.yield %4023 : i64
      }
      %4029 = arith.cmpi ne, %4028, %3988 : i64
      scf.if %4029 {
        func.call @stack_push_pointer(%4028) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3709) : (i64) -> ()
        func.call @stack_push_pointer(%3832) : (i64) -> ()
        func.call @stack_push_pointer(%3932) : (i64) -> ()
        func.call @stack_push_pointer(%3957) : (i64) -> ()
        func.call @stack_push_pointer(%3964) : (i64) -> ()
        func.call @stack_push_pointer(%3968) : (i64) -> ()
        func.call @stack_push_pointer(%3975) : (i64) -> ()
        func.call @stack_push_pointer(%3987) : (i64) -> ()
        %4030 = llvm.mlir.addressof @str316 : !llvm.ptr
        %4031 = func.call @cc_make_function_ref_const(%4030) : (!llvm.ptr) -> i64
        %4032 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4031, %4032) : (i64, i64) -> ()
      }
      %4033 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4033 : i64
    }
    %4034 = func.call @cc_nil_value() : () -> i64
    %4035 = func.call @cc_errorp(%3700) : (i64) -> i64
    %4036 = arith.cmpi ne, %4035, %4034 : i64
    %4037 = scf.if %4036 -> (i64) {
      scf.yield %3700 : i64
    } else {
      %4038 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4039 = arith.constant 9 : i64
      %4040 = func.call @cc_make_string(%4038, %4039) : (!llvm.ptr, i64) -> i64
      %4041 = func.call @cc_nil_value() : () -> i64
      %4042 = func.call @cc_intern(%4040, %4041) : (i64, i64) -> i64
      %4043 = func.call @cc_nil_value() : () -> i64
      %4044 = func.call @cc_cons(%4042, %4043) : (i64, i64) -> i64
      %4045 = func.call @cc_values_pack(%4044) : (i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %4046 = arith.addi %4042, %__rlasp_stack_elide_zero_182 : i64
      %4047 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4048 = arith.constant 13 : i64
      %4049 = func.call @cc_make_string(%4047, %4048) : (!llvm.ptr, i64) -> i64
      %4050 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4051 = arith.constant 11 : i64
      %4052 = func.call @cc_make_string(%4050, %4051) : (!llvm.ptr, i64) -> i64
      %4053 = func.call @cc_intern(%4049, %4052) : (i64, i64) -> i64
      %4054 = func.call @cc_nil_value() : () -> i64
      %4055 = func.call @cc_cons(%4053, %4054) : (i64, i64) -> i64
      %4056 = func.call @cc_values_pack(%4055) : (i64) -> i64
      func.call @stack_push_pointer(%4053) : (i64) -> ()
      %4057 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4058 = arith.constant 6 : i64
      %4059 = func.call @cc_make_string(%4057, %4058) : (!llvm.ptr, i64) -> i64
      %4060 = func.call @cc_nil_value() : () -> i64
      %4061 = func.call @cc_intern(%4059, %4060) : (i64, i64) -> i64
      %4062 = func.call @cc_nil_value() : () -> i64
      %4063 = func.call @cc_cons(%4061, %4062) : (i64, i64) -> i64
      %4064 = func.call @cc_values_pack(%4063) : (i64) -> i64
      func.call @stack_push_pointer(%4061) : (i64) -> ()
      %4065 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4066 = arith.constant 19 : i64
      %4067 = func.call @cc_make_string(%4065, %4066) : (!llvm.ptr, i64) -> i64
      %4068 = func.call @cc_nil_value() : () -> i64
      %4069 = func.call @cc_intern(%4067, %4068) : (i64, i64) -> i64
      %4070 = func.call @cc_nil_value() : () -> i64
      %4071 = func.call @cc_cons(%4069, %4070) : (i64, i64) -> i64
      %4072 = func.call @cc_values_pack(%4071) : (i64) -> i64
      func.call @stack_push_pointer(%4069) : (i64) -> ()
      %4073 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4074 = arith.constant 3 : i64
      %4075 = func.call @cc_make_string(%4073, %4074) : (!llvm.ptr, i64) -> i64
      %4076 = func.call @cc_nil_value() : () -> i64
      %4077 = func.call @cc_intern(%4075, %4076) : (i64, i64) -> i64
      %4078 = func.call @cc_nil_value() : () -> i64
      %4079 = func.call @cc_cons(%4077, %4078) : (i64, i64) -> i64
      %4080 = func.call @cc_values_pack(%4079) : (i64) -> i64
      func.call @stack_push_pointer(%4077) : (i64) -> ()
      %4081 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4082 = arith.constant 16 : i64
      %4083 = func.call @cc_make_string(%4081, %4082) : (!llvm.ptr, i64) -> i64
      %4084 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4085 = arith.constant 11 : i64
      %4086 = func.call @cc_make_string(%4084, %4085) : (!llvm.ptr, i64) -> i64
      %4087 = func.call @cc_intern(%4083, %4086) : (i64, i64) -> i64
      %4088 = func.call @cc_nil_value() : () -> i64
      %4089 = func.call @cc_cons(%4087, %4088) : (i64, i64) -> i64
      %4090 = func.call @cc_values_pack(%4089) : (i64) -> i64
      func.call @stack_push_pointer(%4087) : (i64) -> ()
      %4091 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4091) : (i64) -> ()
      %4092 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4093 = arith.constant 5 : i64
      %4094 = func.call @cc_make_string(%4092, %4093) : (!llvm.ptr, i64) -> i64
      %4095 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4096 = arith.constant 11 : i64
      %4097 = func.call @cc_make_string(%4095, %4096) : (!llvm.ptr, i64) -> i64
      %4098 = func.call @cc_intern(%4094, %4097) : (i64, i64) -> i64
      %4099 = func.call @cc_nil_value() : () -> i64
      %4100 = func.call @cc_cons(%4098, %4099) : (i64, i64) -> i64
      %4101 = func.call @cc_values_pack(%4100) : (i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %4102 = arith.addi %4098, %__rlasp_stack_elide_zero_183 : i64
      %4103 = func.call @stack_pop_pointer() : () -> i64
      %4104 = func.call @cc_cons(%4102, %4103) : (i64, i64) -> i64
      %4105 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4106 = arith.constant 5 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_nil_value() : () -> i64
      %4109 = func.call @cc_intern(%4107, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_cons(%4109, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_values_pack(%4111) : (i64) -> i64
      %4113 = func.call @cc_cons(%4109, %4104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4114 = func.call @stack_pop_pointer() : () -> i64
      %4115 = func.call @stack_pop_pointer() : () -> i64
      %4116 = func.call @cc_cons(%4115, %4114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %4117 = arith.addi %4116, %__rlasp_stack_elide_zero_184 : i64
      %4118 = func.call @stack_pop_pointer() : () -> i64
      %4119 = func.call @cc_cons(%4118, %4117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4119) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4120 = func.call @stack_pop_pointer() : () -> i64
      %4121 = func.call @stack_pop_pointer() : () -> i64
      %4122 = func.call @cc_cons(%4121, %4120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4122) : (i64) -> ()
      %4123 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4124 = arith.constant 6 : i64
      %4125 = func.call @cc_make_string(%4123, %4124) : (!llvm.ptr, i64) -> i64
      %4126 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4127 = arith.constant 11 : i64
      %4128 = func.call @cc_make_string(%4126, %4127) : (!llvm.ptr, i64) -> i64
      %4129 = func.call @cc_intern(%4125, %4128) : (i64, i64) -> i64
      %4130 = func.call @cc_nil_value() : () -> i64
      %4131 = func.call @cc_cons(%4129, %4130) : (i64, i64) -> i64
      %4132 = func.call @cc_values_pack(%4131) : (i64) -> i64
      func.call @stack_push_pointer(%4129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4133 = func.call @stack_pop_pointer() : () -> i64
      %4134 = func.call @stack_pop_pointer() : () -> i64
      %4135 = func.call @cc_cons(%4134, %4133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4135) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = func.call @stack_pop_pointer() : () -> i64
      %4138 = func.call @cc_cons(%4137, %4136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %4139 = arith.addi %4138, %__rlasp_stack_elide_zero_185 : i64
      %4140 = func.call @stack_pop_pointer() : () -> i64
      %4141 = func.call @cc_cons(%4140, %4139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %4142 = arith.addi %4141, %__rlasp_stack_elide_zero_186 : i64
      %4143 = func.call @stack_pop_pointer() : () -> i64
      %4144 = func.call @cc_cons(%4143, %4142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4144) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4145 = func.call @stack_pop_pointer() : () -> i64
      %4146 = func.call @stack_pop_pointer() : () -> i64
      %4147 = func.call @cc_cons(%4146, %4145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %4148 = arith.addi %4147, %__rlasp_stack_elide_zero_187 : i64
      %4149 = func.call @stack_pop_pointer() : () -> i64
      %4150 = func.call @cc_cons(%4149, %4148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4151 = func.call @stack_pop_pointer() : () -> i64
      %4152 = func.call @stack_pop_pointer() : () -> i64
      %4153 = func.call @cc_cons(%4152, %4151) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %4154 = arith.addi %4153, %__rlasp_stack_elide_zero_188 : i64
      %4155 = func.call @stack_pop_pointer() : () -> i64
      %4156 = func.call @cc_cons(%4155, %4154) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %4157 = arith.addi %4156, %__rlasp_stack_elide_zero_189 : i64
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = func.call @cc_cons(%4158, %4157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4160 = func.call @stack_pop_pointer() : () -> i64
      %4161 = func.call @stack_pop_pointer() : () -> i64
      %4162 = func.call @cc_cons(%4161, %4160) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %4163 = arith.addi %4162, %__rlasp_stack_elide_zero_190 : i64
      %4164 = func.call @stack_pop_pointer() : () -> i64
      %4165 = func.call @cc_cons(%4164, %4163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %4166 = arith.addi %4165, %__rlasp_stack_elide_zero_191 : i64
      %4235 = arith.constant 116254966808591 : i64
      %4236 = arith.constant 0 : i64
      %4237 = func.call @cc_make_closure(%4235, %4236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %4238 = arith.addi %4237, %__rlasp_stack_elide_zero_192 : i64
      %4239 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4240 = arith.constant 4 : i64
      %4241 = func.call @cc_make_string(%4239, %4240) : (!llvm.ptr, i64) -> i64
      %4242 = func.call @cc_nil_value() : () -> i64
      %4243 = func.call @cc_intern(%4241, %4242) : (i64, i64) -> i64
      %4244 = func.call @cc_nil_value() : () -> i64
      %4245 = func.call @cc_cons(%4243, %4244) : (i64, i64) -> i64
      %4246 = func.call @cc_values_pack(%4245) : (i64) -> i64
      func.call @stack_push_pointer(%4243) : (i64) -> ()
      %4247 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4248 = arith.constant 10 : i64
      %4249 = func.call @cc_make_string(%4247, %4248) : (!llvm.ptr, i64) -> i64
      %4250 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4251 = arith.constant 11 : i64
      %4252 = func.call @cc_make_string(%4250, %4251) : (!llvm.ptr, i64) -> i64
      %4253 = func.call @cc_intern(%4249, %4252) : (i64, i64) -> i64
      %4254 = func.call @cc_nil_value() : () -> i64
      %4255 = func.call @cc_cons(%4253, %4254) : (i64, i64) -> i64
      %4256 = func.call @cc_values_pack(%4255) : (i64) -> i64
      func.call @stack_push_pointer(%4253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4257 = func.call @stack_pop_pointer() : () -> i64
      %4258 = func.call @stack_pop_pointer() : () -> i64
      %4259 = func.call @cc_cons(%4258, %4257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %4260 = arith.addi %4259, %__rlasp_stack_elide_zero_193 : i64
      %4261 = func.call @stack_pop_pointer() : () -> i64
      %4262 = func.call @cc_cons(%4261, %4260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %4263 = arith.addi %4262, %__rlasp_stack_elide_zero_194 : i64
      %4264 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4265 = arith.constant 11 : i64
      %4266 = func.call @cc_make_string(%4264, %4265) : (!llvm.ptr, i64) -> i64
      %4267 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4268 = arith.constant 7 : i64
      %4269 = func.call @cc_make_string(%4267, %4268) : (!llvm.ptr, i64) -> i64
      %4270 = func.call @cc_intern(%4266, %4269) : (i64, i64) -> i64
      %4271 = func.call @cc_nil_value() : () -> i64
      %4272 = func.call @cc_cons(%4270, %4271) : (i64, i64) -> i64
      %4273 = func.call @cc_values_pack(%4272) : (i64) -> i64
      %4274 = func.call @cc_nil_value() : () -> i64
      %4275 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4276 = arith.constant 4 : i64
      %4277 = func.call @cc_make_string(%4275, %4276) : (!llvm.ptr, i64) -> i64
      %4278 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4279 = arith.constant 7 : i64
      %4280 = func.call @cc_make_string(%4278, %4279) : (!llvm.ptr, i64) -> i64
      %4281 = func.call @cc_intern(%4277, %4280) : (i64, i64) -> i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_cons(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_values_pack(%4283) : (i64) -> i64
      %4285 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4286 = arith.constant 5 : i64
      %4287 = func.call @cc_make_string(%4285, %4286) : (!llvm.ptr, i64) -> i64
      %4288 = func.call @cc_nil_value() : () -> i64
      %4289 = func.call @cc_intern(%4287, %4288) : (i64, i64) -> i64
      %4290 = func.call @cc_nil_value() : () -> i64
      %4291 = func.call @cc_cons(%4289, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_values_pack(%4291) : (i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4293 = arith.addi %4289, %__rlasp_stack_elide_zero_195 : i64
      %4294 = func.call @cc_nil_value() : () -> i64
      %4295 = func.call @cc_errorp(%4046) : (i64) -> i64
      %4296 = arith.cmpi ne, %4295, %4294 : i64
      %4297 = arith.cmpi eq, %4294, %4294 : i64
      %4298 = arith.andi %4296, %4297 : i1
      %4299 = scf.if %4298 -> (i64) {
        scf.yield %4046 : i64
      } else {
        scf.yield %4294 : i64
      }
      %4300 = func.call @cc_errorp(%4166) : (i64) -> i64
      %4301 = arith.cmpi ne, %4300, %4294 : i64
      %4302 = arith.cmpi eq, %4299, %4294 : i64
      %4303 = arith.andi %4301, %4302 : i1
      %4304 = scf.if %4303 -> (i64) {
        scf.yield %4166 : i64
      } else {
        scf.yield %4299 : i64
      }
      %4305 = func.call @cc_errorp(%4238) : (i64) -> i64
      %4306 = arith.cmpi ne, %4305, %4294 : i64
      %4307 = arith.cmpi eq, %4304, %4294 : i64
      %4308 = arith.andi %4306, %4307 : i1
      %4309 = scf.if %4308 -> (i64) {
        scf.yield %4238 : i64
      } else {
        scf.yield %4304 : i64
      }
      %4310 = func.call @cc_errorp(%4263) : (i64) -> i64
      %4311 = arith.cmpi ne, %4310, %4294 : i64
      %4312 = arith.cmpi eq, %4309, %4294 : i64
      %4313 = arith.andi %4311, %4312 : i1
      %4314 = scf.if %4313 -> (i64) {
        scf.yield %4263 : i64
      } else {
        scf.yield %4309 : i64
      }
      %4315 = func.call @cc_errorp(%4270) : (i64) -> i64
      %4316 = arith.cmpi ne, %4315, %4294 : i64
      %4317 = arith.cmpi eq, %4314, %4294 : i64
      %4318 = arith.andi %4316, %4317 : i1
      %4319 = scf.if %4318 -> (i64) {
        scf.yield %4270 : i64
      } else {
        scf.yield %4314 : i64
      }
      %4320 = func.call @cc_errorp(%4274) : (i64) -> i64
      %4321 = arith.cmpi ne, %4320, %4294 : i64
      %4322 = arith.cmpi eq, %4319, %4294 : i64
      %4323 = arith.andi %4321, %4322 : i1
      %4324 = scf.if %4323 -> (i64) {
        scf.yield %4274 : i64
      } else {
        scf.yield %4319 : i64
      }
      %4325 = func.call @cc_errorp(%4281) : (i64) -> i64
      %4326 = arith.cmpi ne, %4325, %4294 : i64
      %4327 = arith.cmpi eq, %4324, %4294 : i64
      %4328 = arith.andi %4326, %4327 : i1
      %4329 = scf.if %4328 -> (i64) {
        scf.yield %4281 : i64
      } else {
        scf.yield %4324 : i64
      }
      %4330 = func.call @cc_errorp(%4293) : (i64) -> i64
      %4331 = arith.cmpi ne, %4330, %4294 : i64
      %4332 = arith.cmpi eq, %4329, %4294 : i64
      %4333 = arith.andi %4331, %4332 : i1
      %4334 = scf.if %4333 -> (i64) {
        scf.yield %4293 : i64
      } else {
        scf.yield %4329 : i64
      }
      %4335 = arith.cmpi ne, %4334, %4294 : i64
      scf.if %4335 {
        func.call @stack_push_pointer(%4334) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4046) : (i64) -> ()
        func.call @stack_push_pointer(%4166) : (i64) -> ()
        func.call @stack_push_pointer(%4238) : (i64) -> ()
        func.call @stack_push_pointer(%4263) : (i64) -> ()
        func.call @stack_push_pointer(%4270) : (i64) -> ()
        func.call @stack_push_pointer(%4274) : (i64) -> ()
        func.call @stack_push_pointer(%4281) : (i64) -> ()
        func.call @stack_push_pointer(%4293) : (i64) -> ()
        %4336 = llvm.mlir.addressof @str341 : !llvm.ptr
        %4337 = func.call @cc_make_function_ref_const(%4336) : (!llvm.ptr) -> i64
        %4338 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4337, %4338) : (i64, i64) -> ()
      }
      %4339 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4339 : i64
    }
    %4340 = func.call @cc_nil_value() : () -> i64
    %4341 = func.call @cc_errorp(%4037) : (i64) -> i64
    %4342 = arith.cmpi ne, %4341, %4340 : i64
    %4343 = scf.if %4342 -> (i64) {
      scf.yield %4037 : i64
    } else {
      %4344 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4345 = arith.constant 9 : i64
      %4346 = func.call @cc_make_string(%4344, %4345) : (!llvm.ptr, i64) -> i64
      %4347 = func.call @cc_nil_value() : () -> i64
      %4348 = func.call @cc_intern(%4346, %4347) : (i64, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_cons(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_values_pack(%4350) : (i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %4352 = arith.addi %4348, %__rlasp_stack_elide_zero_196 : i64
      %4353 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4354 = arith.constant 13 : i64
      %4355 = func.call @cc_make_string(%4353, %4354) : (!llvm.ptr, i64) -> i64
      %4356 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4357 = arith.constant 11 : i64
      %4358 = func.call @cc_make_string(%4356, %4357) : (!llvm.ptr, i64) -> i64
      %4359 = func.call @cc_intern(%4355, %4358) : (i64, i64) -> i64
      %4360 = func.call @cc_nil_value() : () -> i64
      %4361 = func.call @cc_cons(%4359, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_values_pack(%4361) : (i64) -> i64
      func.call @stack_push_pointer(%4359) : (i64) -> ()
      %4363 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4364 = arith.constant 6 : i64
      %4365 = func.call @cc_make_string(%4363, %4364) : (!llvm.ptr, i64) -> i64
      %4366 = func.call @cc_nil_value() : () -> i64
      %4367 = func.call @cc_intern(%4365, %4366) : (i64, i64) -> i64
      %4368 = func.call @cc_nil_value() : () -> i64
      %4369 = func.call @cc_cons(%4367, %4368) : (i64, i64) -> i64
      %4370 = func.call @cc_values_pack(%4369) : (i64) -> i64
      func.call @stack_push_pointer(%4367) : (i64) -> ()
      %4371 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4372 = arith.constant 19 : i64
      %4373 = func.call @cc_make_string(%4371, %4372) : (!llvm.ptr, i64) -> i64
      %4374 = func.call @cc_nil_value() : () -> i64
      %4375 = func.call @cc_intern(%4373, %4374) : (i64, i64) -> i64
      %4376 = func.call @cc_nil_value() : () -> i64
      %4377 = func.call @cc_cons(%4375, %4376) : (i64, i64) -> i64
      %4378 = func.call @cc_values_pack(%4377) : (i64) -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      %4379 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4380 = arith.constant 7 : i64
      %4381 = func.call @cc_make_string(%4379, %4380) : (!llvm.ptr, i64) -> i64
      %4382 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4383 = arith.constant 11 : i64
      %4384 = func.call @cc_make_string(%4382, %4383) : (!llvm.ptr, i64) -> i64
      %4385 = func.call @cc_intern(%4381, %4384) : (i64, i64) -> i64
      %4386 = func.call @cc_nil_value() : () -> i64
      %4387 = func.call @cc_cons(%4385, %4386) : (i64, i64) -> i64
      %4388 = func.call @cc_values_pack(%4387) : (i64) -> i64
      func.call @stack_push_pointer(%4385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4389 = func.call @stack_pop_pointer() : () -> i64
      %4390 = func.call @stack_pop_pointer() : () -> i64
      %4391 = func.call @cc_cons(%4390, %4389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %4392 = arith.addi %4391, %__rlasp_stack_elide_zero_197 : i64
      %4393 = func.call @stack_pop_pointer() : () -> i64
      %4394 = func.call @cc_cons(%4393, %4392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4394) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4395 = func.call @stack_pop_pointer() : () -> i64
      %4396 = func.call @stack_pop_pointer() : () -> i64
      %4397 = func.call @cc_cons(%4396, %4395) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4398 = arith.addi %4397, %__rlasp_stack_elide_zero_198 : i64
      %4399 = func.call @stack_pop_pointer() : () -> i64
      %4400 = func.call @cc_cons(%4399, %4398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4401 = func.call @stack_pop_pointer() : () -> i64
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @cc_cons(%4402, %4401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4404 = arith.addi %4403, %__rlasp_stack_elide_zero_199 : i64
      %4405 = func.call @stack_pop_pointer() : () -> i64
      %4406 = func.call @cc_cons(%4405, %4404) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4407 = arith.addi %4406, %__rlasp_stack_elide_zero_200 : i64
      %4408 = func.call @stack_pop_pointer() : () -> i64
      %4409 = func.call @cc_cons(%4408, %4407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4410 = func.call @stack_pop_pointer() : () -> i64
      %4411 = func.call @stack_pop_pointer() : () -> i64
      %4412 = func.call @cc_cons(%4411, %4410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4413 = arith.addi %4412, %__rlasp_stack_elide_zero_201 : i64
      %4414 = func.call @stack_pop_pointer() : () -> i64
      %4415 = func.call @cc_cons(%4414, %4413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4416 = arith.addi %4415, %__rlasp_stack_elide_zero_202 : i64
      %4463 = arith.constant 116254966808592 : i64
      %4464 = arith.constant 0 : i64
      %4465 = func.call @cc_make_closure(%4463, %4464) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4466 = arith.addi %4465, %__rlasp_stack_elide_zero_203 : i64
      %4467 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4468 = arith.constant 4 : i64
      %4469 = func.call @cc_make_string(%4467, %4468) : (!llvm.ptr, i64) -> i64
      %4470 = func.call @cc_nil_value() : () -> i64
      %4471 = func.call @cc_intern(%4469, %4470) : (i64, i64) -> i64
      %4472 = func.call @cc_nil_value() : () -> i64
      %4473 = func.call @cc_cons(%4471, %4472) : (i64, i64) -> i64
      %4474 = func.call @cc_values_pack(%4473) : (i64) -> i64
      func.call @stack_push_pointer(%4471) : (i64) -> ()
      %4475 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4476 = arith.constant 10 : i64
      %4477 = func.call @cc_make_string(%4475, %4476) : (!llvm.ptr, i64) -> i64
      %4478 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4479 = arith.constant 11 : i64
      %4480 = func.call @cc_make_string(%4478, %4479) : (!llvm.ptr, i64) -> i64
      %4481 = func.call @cc_intern(%4477, %4480) : (i64, i64) -> i64
      %4482 = func.call @cc_nil_value() : () -> i64
      %4483 = func.call @cc_cons(%4481, %4482) : (i64, i64) -> i64
      %4484 = func.call @cc_values_pack(%4483) : (i64) -> i64
      func.call @stack_push_pointer(%4481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @stack_pop_pointer() : () -> i64
      %4487 = func.call @cc_cons(%4486, %4485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4488 = arith.addi %4487, %__rlasp_stack_elide_zero_204 : i64
      %4489 = func.call @stack_pop_pointer() : () -> i64
      %4490 = func.call @cc_cons(%4489, %4488) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4491 = arith.addi %4490, %__rlasp_stack_elide_zero_205 : i64
      %4492 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4493 = arith.constant 11 : i64
      %4494 = func.call @cc_make_string(%4492, %4493) : (!llvm.ptr, i64) -> i64
      %4495 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4496 = arith.constant 7 : i64
      %4497 = func.call @cc_make_string(%4495, %4496) : (!llvm.ptr, i64) -> i64
      %4498 = func.call @cc_intern(%4494, %4497) : (i64, i64) -> i64
      %4499 = func.call @cc_nil_value() : () -> i64
      %4500 = func.call @cc_cons(%4498, %4499) : (i64, i64) -> i64
      %4501 = func.call @cc_values_pack(%4500) : (i64) -> i64
      %4502 = func.call @cc_nil_value() : () -> i64
      %4503 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4504 = arith.constant 4 : i64
      %4505 = func.call @cc_make_string(%4503, %4504) : (!llvm.ptr, i64) -> i64
      %4506 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4507 = arith.constant 7 : i64
      %4508 = func.call @cc_make_string(%4506, %4507) : (!llvm.ptr, i64) -> i64
      %4509 = func.call @cc_intern(%4505, %4508) : (i64, i64) -> i64
      %4510 = func.call @cc_nil_value() : () -> i64
      %4511 = func.call @cc_cons(%4509, %4510) : (i64, i64) -> i64
      %4512 = func.call @cc_values_pack(%4511) : (i64) -> i64
      %4513 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4514 = arith.constant 5 : i64
      %4515 = func.call @cc_make_string(%4513, %4514) : (!llvm.ptr, i64) -> i64
      %4516 = func.call @cc_nil_value() : () -> i64
      %4517 = func.call @cc_intern(%4515, %4516) : (i64, i64) -> i64
      %4518 = func.call @cc_nil_value() : () -> i64
      %4519 = func.call @cc_cons(%4517, %4518) : (i64, i64) -> i64
      %4520 = func.call @cc_values_pack(%4519) : (i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4521 = arith.addi %4517, %__rlasp_stack_elide_zero_206 : i64
      %4522 = func.call @cc_nil_value() : () -> i64
      %4523 = func.call @cc_errorp(%4352) : (i64) -> i64
      %4524 = arith.cmpi ne, %4523, %4522 : i64
      %4525 = arith.cmpi eq, %4522, %4522 : i64
      %4526 = arith.andi %4524, %4525 : i1
      %4527 = scf.if %4526 -> (i64) {
        scf.yield %4352 : i64
      } else {
        scf.yield %4522 : i64
      }
      %4528 = func.call @cc_errorp(%4416) : (i64) -> i64
      %4529 = arith.cmpi ne, %4528, %4522 : i64
      %4530 = arith.cmpi eq, %4527, %4522 : i64
      %4531 = arith.andi %4529, %4530 : i1
      %4532 = scf.if %4531 -> (i64) {
        scf.yield %4416 : i64
      } else {
        scf.yield %4527 : i64
      }
      %4533 = func.call @cc_errorp(%4466) : (i64) -> i64
      %4534 = arith.cmpi ne, %4533, %4522 : i64
      %4535 = arith.cmpi eq, %4532, %4522 : i64
      %4536 = arith.andi %4534, %4535 : i1
      %4537 = scf.if %4536 -> (i64) {
        scf.yield %4466 : i64
      } else {
        scf.yield %4532 : i64
      }
      %4538 = func.call @cc_errorp(%4491) : (i64) -> i64
      %4539 = arith.cmpi ne, %4538, %4522 : i64
      %4540 = arith.cmpi eq, %4537, %4522 : i64
      %4541 = arith.andi %4539, %4540 : i1
      %4542 = scf.if %4541 -> (i64) {
        scf.yield %4491 : i64
      } else {
        scf.yield %4537 : i64
      }
      %4543 = func.call @cc_errorp(%4498) : (i64) -> i64
      %4544 = arith.cmpi ne, %4543, %4522 : i64
      %4545 = arith.cmpi eq, %4542, %4522 : i64
      %4546 = arith.andi %4544, %4545 : i1
      %4547 = scf.if %4546 -> (i64) {
        scf.yield %4498 : i64
      } else {
        scf.yield %4542 : i64
      }
      %4548 = func.call @cc_errorp(%4502) : (i64) -> i64
      %4549 = arith.cmpi ne, %4548, %4522 : i64
      %4550 = arith.cmpi eq, %4547, %4522 : i64
      %4551 = arith.andi %4549, %4550 : i1
      %4552 = scf.if %4551 -> (i64) {
        scf.yield %4502 : i64
      } else {
        scf.yield %4547 : i64
      }
      %4553 = func.call @cc_errorp(%4509) : (i64) -> i64
      %4554 = arith.cmpi ne, %4553, %4522 : i64
      %4555 = arith.cmpi eq, %4552, %4522 : i64
      %4556 = arith.andi %4554, %4555 : i1
      %4557 = scf.if %4556 -> (i64) {
        scf.yield %4509 : i64
      } else {
        scf.yield %4552 : i64
      }
      %4558 = func.call @cc_errorp(%4521) : (i64) -> i64
      %4559 = arith.cmpi ne, %4558, %4522 : i64
      %4560 = arith.cmpi eq, %4557, %4522 : i64
      %4561 = arith.andi %4559, %4560 : i1
      %4562 = scf.if %4561 -> (i64) {
        scf.yield %4521 : i64
      } else {
        scf.yield %4557 : i64
      }
      %4563 = arith.cmpi ne, %4562, %4522 : i64
      scf.if %4563 {
        func.call @stack_push_pointer(%4562) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4352) : (i64) -> ()
        func.call @stack_push_pointer(%4416) : (i64) -> ()
        func.call @stack_push_pointer(%4466) : (i64) -> ()
        func.call @stack_push_pointer(%4491) : (i64) -> ()
        func.call @stack_push_pointer(%4498) : (i64) -> ()
        func.call @stack_push_pointer(%4502) : (i64) -> ()
        func.call @stack_push_pointer(%4509) : (i64) -> ()
        func.call @stack_push_pointer(%4521) : (i64) -> ()
        %4564 = llvm.mlir.addressof @str357 : !llvm.ptr
        %4565 = func.call @cc_make_function_ref_const(%4564) : (!llvm.ptr) -> i64
        %4566 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4565, %4566) : (i64, i64) -> ()
      }
      %4567 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4567 : i64
    }
    %4568 = func.call @cc_nil_value() : () -> i64
    %4569 = func.call @cc_errorp(%4343) : (i64) -> i64
    %4570 = arith.cmpi ne, %4569, %4568 : i64
    %4571 = scf.if %4570 -> (i64) {
      scf.yield %4343 : i64
    } else {
      %4572 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4573 = arith.constant 12 : i64
      %4574 = func.call @cc_make_string(%4572, %4573) : (!llvm.ptr, i64) -> i64
      %4575 = func.call @cc_nil_value() : () -> i64
      %4576 = func.call @cc_intern(%4574, %4575) : (i64, i64) -> i64
      %4577 = func.call @cc_nil_value() : () -> i64
      %4578 = func.call @cc_cons(%4576, %4577) : (i64, i64) -> i64
      %4579 = func.call @cc_values_pack(%4578) : (i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4580 = arith.addi %4576, %__rlasp_stack_elide_zero_207 : i64
      %4581 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4582 = arith.constant 3 : i64
      %4583 = func.call @cc_make_string(%4581, %4582) : (!llvm.ptr, i64) -> i64
      %4584 = func.call @cc_nil_value() : () -> i64
      %4585 = func.call @cc_intern(%4583, %4584) : (i64, i64) -> i64
      %4586 = func.call @cc_nil_value() : () -> i64
      %4587 = func.call @cc_cons(%4585, %4586) : (i64, i64) -> i64
      %4588 = func.call @cc_values_pack(%4587) : (i64) -> i64
      func.call @stack_push_pointer(%4585) : (i64) -> ()
      %4589 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4590 = arith.constant 3 : i64
      %4591 = func.call @cc_make_string(%4589, %4590) : (!llvm.ptr, i64) -> i64
      %4592 = func.call @cc_nil_value() : () -> i64
      %4593 = func.call @cc_intern(%4591, %4592) : (i64, i64) -> i64
      %4594 = func.call @cc_nil_value() : () -> i64
      %4595 = func.call @cc_cons(%4593, %4594) : (i64, i64) -> i64
      %4596 = func.call @cc_values_pack(%4595) : (i64) -> i64
      func.call @stack_push_pointer(%4593) : (i64) -> ()
      %4597 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4598 = arith.constant 4 : i64
      %4599 = func.call @cc_make_string(%4597, %4598) : (!llvm.ptr, i64) -> i64
      %4600 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4601 = arith.constant 11 : i64
      %4602 = func.call @cc_make_string(%4600, %4601) : (!llvm.ptr, i64) -> i64
      %4603 = func.call @cc_intern(%4599, %4602) : (i64, i64) -> i64
      %4604 = func.call @cc_nil_value() : () -> i64
      %4605 = func.call @cc_cons(%4603, %4604) : (i64, i64) -> i64
      %4606 = func.call @cc_values_pack(%4605) : (i64) -> i64
      func.call @stack_push_pointer(%4603) : (i64) -> ()
      %4607 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4608 = arith.constant 12 : i64
      %4609 = func.call @cc_make_string(%4607, %4608) : (!llvm.ptr, i64) -> i64
      %4610 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4611 = arith.constant 11 : i64
      %4612 = func.call @cc_make_string(%4610, %4611) : (!llvm.ptr, i64) -> i64
      %4613 = func.call @cc_intern(%4609, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_nil_value() : () -> i64
      %4615 = func.call @cc_cons(%4613, %4614) : (i64, i64) -> i64
      %4616 = func.call @cc_values_pack(%4615) : (i64) -> i64
      func.call @stack_push_pointer(%4613) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4617 = func.call @stack_pop_pointer() : () -> i64
      %4618 = func.call @stack_pop_pointer() : () -> i64
      %4619 = func.call @cc_cons(%4618, %4617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4620 = arith.addi %4619, %__rlasp_stack_elide_zero_208 : i64
      %4621 = func.call @stack_pop_pointer() : () -> i64
      %4622 = func.call @cc_cons(%4621, %4620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4622) : (i64) -> ()
      %4623 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4624 = arith.constant 4 : i64
      %4625 = func.call @cc_make_string(%4623, %4624) : (!llvm.ptr, i64) -> i64
      %4626 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4627 = arith.constant 11 : i64
      %4628 = func.call @cc_make_string(%4626, %4627) : (!llvm.ptr, i64) -> i64
      %4629 = func.call @cc_intern(%4625, %4628) : (i64, i64) -> i64
      %4630 = func.call @cc_nil_value() : () -> i64
      %4631 = func.call @cc_cons(%4629, %4630) : (i64, i64) -> i64
      %4632 = func.call @cc_values_pack(%4631) : (i64) -> i64
      func.call @stack_push_pointer(%4629) : (i64) -> ()
      %4633 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4633) : (i64) -> ()
      %4634 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4635 = func.call @stack_pop_pointer() : () -> i64
      %4636 = func.call @stack_pop_pointer() : () -> i64
      %4637 = func.call @cc_cons(%4636, %4635) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4638 = arith.addi %4637, %__rlasp_stack_elide_zero_209 : i64
      %4639 = func.call @stack_pop_pointer() : () -> i64
      %4640 = func.call @cc_cons(%4639, %4638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4641 = arith.addi %4640, %__rlasp_stack_elide_zero_210 : i64
      %4642 = func.call @stack_pop_pointer() : () -> i64
      %4643 = func.call @cc_cons(%4642, %4641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @stack_pop_pointer() : () -> i64
      %4646 = func.call @cc_cons(%4645, %4644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4647 = arith.addi %4646, %__rlasp_stack_elide_zero_211 : i64
      %4648 = func.call @stack_pop_pointer() : () -> i64
      %4649 = func.call @cc_cons(%4648, %4647) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4650 = arith.addi %4649, %__rlasp_stack_elide_zero_212 : i64
      %4651 = func.call @stack_pop_pointer() : () -> i64
      %4652 = func.call @cc_cons(%4651, %4650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @stack_pop_pointer() : () -> i64
      %4655 = func.call @cc_cons(%4654, %4653) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4656 = arith.addi %4655, %__rlasp_stack_elide_zero_213 : i64
      %4657 = func.call @stack_pop_pointer() : () -> i64
      %4658 = func.call @cc_cons(%4657, %4656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4658) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4659 = func.call @stack_pop_pointer() : () -> i64
      %4660 = func.call @stack_pop_pointer() : () -> i64
      %4661 = func.call @cc_cons(%4660, %4659) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4662 = arith.addi %4661, %__rlasp_stack_elide_zero_214 : i64
      %4663 = func.call @stack_pop_pointer() : () -> i64
      %4664 = func.call @cc_cons(%4663, %4662) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4665 = arith.addi %4664, %__rlasp_stack_elide_zero_215 : i64
      %4708 = arith.constant 116254966808593 : i64
      %4709 = arith.constant 0 : i64
      %4710 = func.call @cc_make_closure(%4708, %4709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4711 = arith.addi %4710, %__rlasp_stack_elide_zero_216 : i64
      %4712 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4713 = arith.constant 1 : i64
      %4714 = func.call @cc_make_string(%4712, %4713) : (!llvm.ptr, i64) -> i64
      %4715 = func.call @cc_nil_value() : () -> i64
      %4716 = func.call @cc_intern(%4714, %4715) : (i64, i64) -> i64
      %4717 = func.call @cc_nil_value() : () -> i64
      %4718 = func.call @cc_cons(%4716, %4717) : (i64, i64) -> i64
      %4719 = func.call @cc_values_pack(%4718) : (i64) -> i64
      func.call @stack_push_pointer(%4716) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4720 = func.call @stack_pop_pointer() : () -> i64
      %4721 = func.call @stack_pop_pointer() : () -> i64
      %4722 = func.call @cc_cons(%4721, %4720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4723 = arith.addi %4722, %__rlasp_stack_elide_zero_217 : i64
      %4724 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4725 = arith.constant 11 : i64
      %4726 = func.call @cc_make_string(%4724, %4725) : (!llvm.ptr, i64) -> i64
      %4727 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4728 = arith.constant 7 : i64
      %4729 = func.call @cc_make_string(%4727, %4728) : (!llvm.ptr, i64) -> i64
      %4730 = func.call @cc_intern(%4726, %4729) : (i64, i64) -> i64
      %4731 = func.call @cc_nil_value() : () -> i64
      %4732 = func.call @cc_cons(%4730, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_values_pack(%4732) : (i64) -> i64
      %4734 = func.call @cc_nil_value() : () -> i64
      %4735 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4736 = arith.constant 4 : i64
      %4737 = func.call @cc_make_string(%4735, %4736) : (!llvm.ptr, i64) -> i64
      %4738 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4739 = arith.constant 7 : i64
      %4740 = func.call @cc_make_string(%4738, %4739) : (!llvm.ptr, i64) -> i64
      %4741 = func.call @cc_intern(%4737, %4740) : (i64, i64) -> i64
      %4742 = func.call @cc_nil_value() : () -> i64
      %4743 = func.call @cc_cons(%4741, %4742) : (i64, i64) -> i64
      %4744 = func.call @cc_values_pack(%4743) : (i64) -> i64
      %4745 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4746 = arith.constant 6 : i64
      %4747 = func.call @cc_make_string(%4745, %4746) : (!llvm.ptr, i64) -> i64
      %4748 = func.call @cc_nil_value() : () -> i64
      %4749 = func.call @cc_intern(%4747, %4748) : (i64, i64) -> i64
      %4750 = func.call @cc_nil_value() : () -> i64
      %4751 = func.call @cc_cons(%4749, %4750) : (i64, i64) -> i64
      %4752 = func.call @cc_values_pack(%4751) : (i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4753 = arith.addi %4749, %__rlasp_stack_elide_zero_218 : i64
      %4754 = func.call @cc_nil_value() : () -> i64
      %4755 = func.call @cc_errorp(%4580) : (i64) -> i64
      %4756 = arith.cmpi ne, %4755, %4754 : i64
      %4757 = arith.cmpi eq, %4754, %4754 : i64
      %4758 = arith.andi %4756, %4757 : i1
      %4759 = scf.if %4758 -> (i64) {
        scf.yield %4580 : i64
      } else {
        scf.yield %4754 : i64
      }
      %4760 = func.call @cc_errorp(%4665) : (i64) -> i64
      %4761 = arith.cmpi ne, %4760, %4754 : i64
      %4762 = arith.cmpi eq, %4759, %4754 : i64
      %4763 = arith.andi %4761, %4762 : i1
      %4764 = scf.if %4763 -> (i64) {
        scf.yield %4665 : i64
      } else {
        scf.yield %4759 : i64
      }
      %4765 = func.call @cc_errorp(%4711) : (i64) -> i64
      %4766 = arith.cmpi ne, %4765, %4754 : i64
      %4767 = arith.cmpi eq, %4764, %4754 : i64
      %4768 = arith.andi %4766, %4767 : i1
      %4769 = scf.if %4768 -> (i64) {
        scf.yield %4711 : i64
      } else {
        scf.yield %4764 : i64
      }
      %4770 = func.call @cc_errorp(%4723) : (i64) -> i64
      %4771 = arith.cmpi ne, %4770, %4754 : i64
      %4772 = arith.cmpi eq, %4769, %4754 : i64
      %4773 = arith.andi %4771, %4772 : i1
      %4774 = scf.if %4773 -> (i64) {
        scf.yield %4723 : i64
      } else {
        scf.yield %4769 : i64
      }
      %4775 = func.call @cc_errorp(%4730) : (i64) -> i64
      %4776 = arith.cmpi ne, %4775, %4754 : i64
      %4777 = arith.cmpi eq, %4774, %4754 : i64
      %4778 = arith.andi %4776, %4777 : i1
      %4779 = scf.if %4778 -> (i64) {
        scf.yield %4730 : i64
      } else {
        scf.yield %4774 : i64
      }
      %4780 = func.call @cc_errorp(%4734) : (i64) -> i64
      %4781 = arith.cmpi ne, %4780, %4754 : i64
      %4782 = arith.cmpi eq, %4779, %4754 : i64
      %4783 = arith.andi %4781, %4782 : i1
      %4784 = scf.if %4783 -> (i64) {
        scf.yield %4734 : i64
      } else {
        scf.yield %4779 : i64
      }
      %4785 = func.call @cc_errorp(%4741) : (i64) -> i64
      %4786 = arith.cmpi ne, %4785, %4754 : i64
      %4787 = arith.cmpi eq, %4784, %4754 : i64
      %4788 = arith.andi %4786, %4787 : i1
      %4789 = scf.if %4788 -> (i64) {
        scf.yield %4741 : i64
      } else {
        scf.yield %4784 : i64
      }
      %4790 = func.call @cc_errorp(%4753) : (i64) -> i64
      %4791 = arith.cmpi ne, %4790, %4754 : i64
      %4792 = arith.cmpi eq, %4789, %4754 : i64
      %4793 = arith.andi %4791, %4792 : i1
      %4794 = scf.if %4793 -> (i64) {
        scf.yield %4753 : i64
      } else {
        scf.yield %4789 : i64
      }
      %4795 = arith.cmpi ne, %4794, %4754 : i64
      scf.if %4795 {
        func.call @stack_push_pointer(%4794) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4580) : (i64) -> ()
        func.call @stack_push_pointer(%4665) : (i64) -> ()
        func.call @stack_push_pointer(%4711) : (i64) -> ()
        func.call @stack_push_pointer(%4723) : (i64) -> ()
        func.call @stack_push_pointer(%4730) : (i64) -> ()
        func.call @stack_push_pointer(%4734) : (i64) -> ()
        func.call @stack_push_pointer(%4741) : (i64) -> ()
        func.call @stack_push_pointer(%4753) : (i64) -> ()
        %4796 = llvm.mlir.addressof @str374 : !llvm.ptr
        %4797 = func.call @cc_make_function_ref_const(%4796) : (!llvm.ptr) -> i64
        %4798 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4797, %4798) : (i64, i64) -> ()
      }
      %4799 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4799 : i64
    }
    %4800 = func.call @cc_nil_value() : () -> i64
    %4801 = func.call @cc_errorp(%4571) : (i64) -> i64
    %4802 = arith.cmpi ne, %4801, %4800 : i64
    %4803 = scf.if %4802 -> (i64) {
      scf.yield %4571 : i64
    } else {
      %4804 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4805 = arith.constant 12 : i64
      %4806 = func.call @cc_make_string(%4804, %4805) : (!llvm.ptr, i64) -> i64
      %4807 = func.call @cc_nil_value() : () -> i64
      %4808 = func.call @cc_intern(%4806, %4807) : (i64, i64) -> i64
      %4809 = func.call @cc_nil_value() : () -> i64
      %4810 = func.call @cc_cons(%4808, %4809) : (i64, i64) -> i64
      %4811 = func.call @cc_values_pack(%4810) : (i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4812 = arith.addi %4808, %__rlasp_stack_elide_zero_219 : i64
      %4813 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4814 = arith.constant 3 : i64
      %4815 = func.call @cc_make_string(%4813, %4814) : (!llvm.ptr, i64) -> i64
      %4816 = func.call @cc_nil_value() : () -> i64
      %4817 = func.call @cc_intern(%4815, %4816) : (i64, i64) -> i64
      %4818 = func.call @cc_nil_value() : () -> i64
      %4819 = func.call @cc_cons(%4817, %4818) : (i64, i64) -> i64
      %4820 = func.call @cc_values_pack(%4819) : (i64) -> i64
      func.call @stack_push_pointer(%4817) : (i64) -> ()
      %4821 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4822 = arith.constant 3 : i64
      %4823 = func.call @cc_make_string(%4821, %4822) : (!llvm.ptr, i64) -> i64
      %4824 = func.call @cc_nil_value() : () -> i64
      %4825 = func.call @cc_intern(%4823, %4824) : (i64, i64) -> i64
      %4826 = func.call @cc_nil_value() : () -> i64
      %4827 = func.call @cc_cons(%4825, %4826) : (i64, i64) -> i64
      %4828 = func.call @cc_values_pack(%4827) : (i64) -> i64
      func.call @stack_push_pointer(%4825) : (i64) -> ()
      %4829 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4830 = arith.constant 4 : i64
      %4831 = func.call @cc_make_string(%4829, %4830) : (!llvm.ptr, i64) -> i64
      %4832 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4833 = arith.constant 11 : i64
      %4834 = func.call @cc_make_string(%4832, %4833) : (!llvm.ptr, i64) -> i64
      %4835 = func.call @cc_intern(%4831, %4834) : (i64, i64) -> i64
      %4836 = func.call @cc_nil_value() : () -> i64
      %4837 = func.call @cc_cons(%4835, %4836) : (i64, i64) -> i64
      %4838 = func.call @cc_values_pack(%4837) : (i64) -> i64
      func.call @stack_push_pointer(%4835) : (i64) -> ()
      %4839 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4840 = arith.constant 3 : i64
      %4841 = func.call @cc_make_string(%4839, %4840) : (!llvm.ptr, i64) -> i64
      %4842 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4843 = arith.constant 11 : i64
      %4844 = func.call @cc_make_string(%4842, %4843) : (!llvm.ptr, i64) -> i64
      %4845 = func.call @cc_intern(%4841, %4844) : (i64, i64) -> i64
      %4846 = func.call @cc_nil_value() : () -> i64
      %4847 = func.call @cc_cons(%4845, %4846) : (i64, i64) -> i64
      %4848 = func.call @cc_values_pack(%4847) : (i64) -> i64
      func.call @stack_push_pointer(%4845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4849 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4849) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4850 = func.call @stack_pop_pointer() : () -> i64
      %4851 = func.call @stack_pop_pointer() : () -> i64
      %4852 = func.call @cc_cons(%4851, %4850) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4853 = arith.addi %4852, %__rlasp_stack_elide_zero_220 : i64
      %4854 = func.call @stack_pop_pointer() : () -> i64
      %4855 = func.call @cc_cons(%4854, %4853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4856 = arith.addi %4855, %__rlasp_stack_elide_zero_221 : i64
      %4857 = func.call @stack_pop_pointer() : () -> i64
      %4858 = func.call @cc_cons(%4857, %4856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4858) : (i64) -> ()
      %4859 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4859) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4860 = func.call @stack_pop_pointer() : () -> i64
      %4861 = func.call @stack_pop_pointer() : () -> i64
      %4862 = func.call @cc_cons(%4861, %4860) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4863 = arith.addi %4862, %__rlasp_stack_elide_zero_222 : i64
      %4864 = func.call @stack_pop_pointer() : () -> i64
      %4865 = func.call @cc_cons(%4864, %4863) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4866 = arith.addi %4865, %__rlasp_stack_elide_zero_223 : i64
      %4867 = func.call @stack_pop_pointer() : () -> i64
      %4868 = func.call @cc_cons(%4867, %4866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4868) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4869 = func.call @stack_pop_pointer() : () -> i64
      %4870 = func.call @stack_pop_pointer() : () -> i64
      %4871 = func.call @cc_cons(%4870, %4869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4872 = arith.addi %4871, %__rlasp_stack_elide_zero_224 : i64
      %4873 = func.call @stack_pop_pointer() : () -> i64
      %4874 = func.call @cc_cons(%4873, %4872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4875 = func.call @stack_pop_pointer() : () -> i64
      %4876 = func.call @stack_pop_pointer() : () -> i64
      %4877 = func.call @cc_cons(%4876, %4875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4878 = arith.addi %4877, %__rlasp_stack_elide_zero_225 : i64
      %4879 = func.call @stack_pop_pointer() : () -> i64
      %4880 = func.call @cc_cons(%4879, %4878) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4881 = arith.addi %4880, %__rlasp_stack_elide_zero_226 : i64
      %4904 = arith.constant 116254966808594 : i64
      %4905 = arith.constant 0 : i64
      %4906 = func.call @cc_make_closure(%4904, %4905) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4907 = arith.addi %4906, %__rlasp_stack_elide_zero_227 : i64
      %4908 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4909 = arith.constant 1 : i64
      %4910 = func.call @cc_make_string(%4908, %4909) : (!llvm.ptr, i64) -> i64
      %4911 = func.call @cc_nil_value() : () -> i64
      %4912 = func.call @cc_intern(%4910, %4911) : (i64, i64) -> i64
      %4913 = func.call @cc_nil_value() : () -> i64
      %4914 = func.call @cc_cons(%4912, %4913) : (i64, i64) -> i64
      %4915 = func.call @cc_values_pack(%4914) : (i64) -> i64
      func.call @stack_push_pointer(%4912) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4916 = func.call @stack_pop_pointer() : () -> i64
      %4917 = func.call @stack_pop_pointer() : () -> i64
      %4918 = func.call @cc_cons(%4917, %4916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4919 = arith.addi %4918, %__rlasp_stack_elide_zero_228 : i64
      %4920 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4921 = arith.constant 11 : i64
      %4922 = func.call @cc_make_string(%4920, %4921) : (!llvm.ptr, i64) -> i64
      %4923 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4924 = arith.constant 7 : i64
      %4925 = func.call @cc_make_string(%4923, %4924) : (!llvm.ptr, i64) -> i64
      %4926 = func.call @cc_intern(%4922, %4925) : (i64, i64) -> i64
      %4927 = func.call @cc_nil_value() : () -> i64
      %4928 = func.call @cc_cons(%4926, %4927) : (i64, i64) -> i64
      %4929 = func.call @cc_values_pack(%4928) : (i64) -> i64
      %4930 = func.call @cc_nil_value() : () -> i64
      %4931 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4932 = arith.constant 4 : i64
      %4933 = func.call @cc_make_string(%4931, %4932) : (!llvm.ptr, i64) -> i64
      %4934 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4935 = arith.constant 7 : i64
      %4936 = func.call @cc_make_string(%4934, %4935) : (!llvm.ptr, i64) -> i64
      %4937 = func.call @cc_intern(%4933, %4936) : (i64, i64) -> i64
      %4938 = func.call @cc_nil_value() : () -> i64
      %4939 = func.call @cc_cons(%4937, %4938) : (i64, i64) -> i64
      %4940 = func.call @cc_values_pack(%4939) : (i64) -> i64
      %4941 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4942 = arith.constant 6 : i64
      %4943 = func.call @cc_make_string(%4941, %4942) : (!llvm.ptr, i64) -> i64
      %4944 = func.call @cc_nil_value() : () -> i64
      %4945 = func.call @cc_intern(%4943, %4944) : (i64, i64) -> i64
      %4946 = func.call @cc_nil_value() : () -> i64
      %4947 = func.call @cc_cons(%4945, %4946) : (i64, i64) -> i64
      %4948 = func.call @cc_values_pack(%4947) : (i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %4949 = arith.addi %4945, %__rlasp_stack_elide_zero_229 : i64
      %4950 = func.call @cc_nil_value() : () -> i64
      %4951 = func.call @cc_errorp(%4812) : (i64) -> i64
      %4952 = arith.cmpi ne, %4951, %4950 : i64
      %4953 = arith.cmpi eq, %4950, %4950 : i64
      %4954 = arith.andi %4952, %4953 : i1
      %4955 = scf.if %4954 -> (i64) {
        scf.yield %4812 : i64
      } else {
        scf.yield %4950 : i64
      }
      %4956 = func.call @cc_errorp(%4881) : (i64) -> i64
      %4957 = arith.cmpi ne, %4956, %4950 : i64
      %4958 = arith.cmpi eq, %4955, %4950 : i64
      %4959 = arith.andi %4957, %4958 : i1
      %4960 = scf.if %4959 -> (i64) {
        scf.yield %4881 : i64
      } else {
        scf.yield %4955 : i64
      }
      %4961 = func.call @cc_errorp(%4907) : (i64) -> i64
      %4962 = arith.cmpi ne, %4961, %4950 : i64
      %4963 = arith.cmpi eq, %4960, %4950 : i64
      %4964 = arith.andi %4962, %4963 : i1
      %4965 = scf.if %4964 -> (i64) {
        scf.yield %4907 : i64
      } else {
        scf.yield %4960 : i64
      }
      %4966 = func.call @cc_errorp(%4919) : (i64) -> i64
      %4967 = arith.cmpi ne, %4966, %4950 : i64
      %4968 = arith.cmpi eq, %4965, %4950 : i64
      %4969 = arith.andi %4967, %4968 : i1
      %4970 = scf.if %4969 -> (i64) {
        scf.yield %4919 : i64
      } else {
        scf.yield %4965 : i64
      }
      %4971 = func.call @cc_errorp(%4926) : (i64) -> i64
      %4972 = arith.cmpi ne, %4971, %4950 : i64
      %4973 = arith.cmpi eq, %4970, %4950 : i64
      %4974 = arith.andi %4972, %4973 : i1
      %4975 = scf.if %4974 -> (i64) {
        scf.yield %4926 : i64
      } else {
        scf.yield %4970 : i64
      }
      %4976 = func.call @cc_errorp(%4930) : (i64) -> i64
      %4977 = arith.cmpi ne, %4976, %4950 : i64
      %4978 = arith.cmpi eq, %4975, %4950 : i64
      %4979 = arith.andi %4977, %4978 : i1
      %4980 = scf.if %4979 -> (i64) {
        scf.yield %4930 : i64
      } else {
        scf.yield %4975 : i64
      }
      %4981 = func.call @cc_errorp(%4937) : (i64) -> i64
      %4982 = arith.cmpi ne, %4981, %4950 : i64
      %4983 = arith.cmpi eq, %4980, %4950 : i64
      %4984 = arith.andi %4982, %4983 : i1
      %4985 = scf.if %4984 -> (i64) {
        scf.yield %4937 : i64
      } else {
        scf.yield %4980 : i64
      }
      %4986 = func.call @cc_errorp(%4949) : (i64) -> i64
      %4987 = arith.cmpi ne, %4986, %4950 : i64
      %4988 = arith.cmpi eq, %4985, %4950 : i64
      %4989 = arith.andi %4987, %4988 : i1
      %4990 = scf.if %4989 -> (i64) {
        scf.yield %4949 : i64
      } else {
        scf.yield %4985 : i64
      }
      %4991 = arith.cmpi ne, %4990, %4950 : i64
      scf.if %4991 {
        func.call @stack_push_pointer(%4990) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4812) : (i64) -> ()
        func.call @stack_push_pointer(%4881) : (i64) -> ()
        func.call @stack_push_pointer(%4907) : (i64) -> ()
        func.call @stack_push_pointer(%4919) : (i64) -> ()
        func.call @stack_push_pointer(%4926) : (i64) -> ()
        func.call @stack_push_pointer(%4930) : (i64) -> ()
        func.call @stack_push_pointer(%4937) : (i64) -> ()
        func.call @stack_push_pointer(%4949) : (i64) -> ()
        %4992 = llvm.mlir.addressof @str389 : !llvm.ptr
        %4993 = func.call @cc_make_function_ref_const(%4992) : (!llvm.ptr) -> i64
        %4994 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4993, %4994) : (i64, i64) -> ()
      }
      %4995 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4995 : i64
    }
    %4996 = func.call @cc_nil_value() : () -> i64
    %4997 = func.call @cc_errorp(%4803) : (i64) -> i64
    %4998 = arith.cmpi ne, %4997, %4996 : i64
    %4999 = scf.if %4998 -> (i64) {
      scf.yield %4803 : i64
    } else {
      %5000 = llvm.mlir.addressof @str390 : !llvm.ptr
      %5001 = arith.constant 32 : i64
      %5002 = func.call @cc_make_string(%5000, %5001) : (!llvm.ptr, i64) -> i64
      %5003 = func.call @cc_nil_value() : () -> i64
      %5004 = func.call @cc_intern(%5002, %5003) : (i64, i64) -> i64
      %5005 = func.call @cc_nil_value() : () -> i64
      %5006 = func.call @cc_cons(%5004, %5005) : (i64, i64) -> i64
      %5007 = func.call @cc_values_pack(%5006) : (i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %5008 = arith.addi %5004, %__rlasp_stack_elide_zero_230 : i64
      %5009 = llvm.mlir.addressof @str391 : !llvm.ptr
      %5010 = arith.constant 3 : i64
      %5011 = func.call @cc_make_string(%5009, %5010) : (!llvm.ptr, i64) -> i64
      %5012 = func.call @cc_nil_value() : () -> i64
      %5013 = func.call @cc_intern(%5011, %5012) : (i64, i64) -> i64
      %5014 = func.call @cc_nil_value() : () -> i64
      %5015 = func.call @cc_cons(%5013, %5014) : (i64, i64) -> i64
      %5016 = func.call @cc_values_pack(%5015) : (i64) -> i64
      func.call @stack_push_pointer(%5013) : (i64) -> ()
      %5017 = llvm.mlir.addressof @str392 : !llvm.ptr
      %5018 = arith.constant 3 : i64
      %5019 = func.call @cc_make_string(%5017, %5018) : (!llvm.ptr, i64) -> i64
      %5020 = func.call @cc_nil_value() : () -> i64
      %5021 = func.call @cc_intern(%5019, %5020) : (i64, i64) -> i64
      %5022 = func.call @cc_nil_value() : () -> i64
      %5023 = func.call @cc_cons(%5021, %5022) : (i64, i64) -> i64
      %5024 = func.call @cc_values_pack(%5023) : (i64) -> i64
      func.call @stack_push_pointer(%5021) : (i64) -> ()
      %5025 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%5025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5026 = func.call @stack_pop_pointer() : () -> i64
      %5027 = func.call @stack_pop_pointer() : () -> i64
      %5028 = func.call @cc_cons(%5027, %5026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %5029 = arith.addi %5028, %__rlasp_stack_elide_zero_231 : i64
      %5030 = func.call @stack_pop_pointer() : () -> i64
      %5031 = func.call @cc_cons(%5030, %5029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5032 = func.call @stack_pop_pointer() : () -> i64
      %5033 = func.call @stack_pop_pointer() : () -> i64
      %5034 = func.call @cc_cons(%5033, %5032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5034) : (i64) -> ()
      %5035 = llvm.mlir.addressof @str393 : !llvm.ptr
      %5036 = arith.constant 19 : i64
      %5037 = func.call @cc_make_string(%5035, %5036) : (!llvm.ptr, i64) -> i64
      %5038 = llvm.mlir.addressof @str394 : !llvm.ptr
      %5039 = arith.constant 11 : i64
      %5040 = func.call @cc_make_string(%5038, %5039) : (!llvm.ptr, i64) -> i64
      %5041 = func.call @cc_intern(%5037, %5040) : (i64, i64) -> i64
      %5042 = func.call @cc_nil_value() : () -> i64
      %5043 = func.call @cc_cons(%5041, %5042) : (i64, i64) -> i64
      %5044 = func.call @cc_values_pack(%5043) : (i64) -> i64
      func.call @stack_push_pointer(%5041) : (i64) -> ()
      %5045 = llvm.mlir.addressof @str395 : !llvm.ptr
      %5046 = arith.constant 3 : i64
      %5047 = func.call @cc_make_string(%5045, %5046) : (!llvm.ptr, i64) -> i64
      %5048 = func.call @cc_nil_value() : () -> i64
      %5049 = func.call @cc_intern(%5047, %5048) : (i64, i64) -> i64
      %5050 = func.call @cc_nil_value() : () -> i64
      %5051 = func.call @cc_cons(%5049, %5050) : (i64, i64) -> i64
      %5052 = func.call @cc_values_pack(%5051) : (i64) -> i64
      func.call @stack_push_pointer(%5049) : (i64) -> ()
      %5053 = llvm.mlir.addressof @str396 : !llvm.ptr
      %5054 = arith.constant 12 : i64
      %5055 = func.call @cc_make_string(%5053, %5054) : (!llvm.ptr, i64) -> i64
      %5056 = llvm.mlir.addressof @str397 : !llvm.ptr
      %5057 = arith.constant 11 : i64
      %5058 = func.call @cc_make_string(%5056, %5057) : (!llvm.ptr, i64) -> i64
      %5059 = func.call @cc_intern(%5055, %5058) : (i64, i64) -> i64
      %5060 = func.call @cc_nil_value() : () -> i64
      %5061 = func.call @cc_cons(%5059, %5060) : (i64, i64) -> i64
      %5062 = func.call @cc_values_pack(%5061) : (i64) -> i64
      func.call @stack_push_pointer(%5059) : (i64) -> ()
      %5063 = llvm.mlir.addressof @str398 : !llvm.ptr
      %5064 = arith.constant 2 : i64
      %5065 = func.call @cc_make_string(%5063, %5064) : (!llvm.ptr, i64) -> i64
      %5066 = llvm.mlir.addressof @str399 : !llvm.ptr
      %5067 = arith.constant 7 : i64
      %5068 = func.call @cc_make_string(%5066, %5067) : (!llvm.ptr, i64) -> i64
      %5069 = func.call @cc_intern(%5065, %5068) : (i64, i64) -> i64
      %5070 = func.call @cc_nil_value() : () -> i64
      %5071 = func.call @cc_cons(%5069, %5070) : (i64, i64) -> i64
      %5072 = func.call @cc_values_pack(%5071) : (i64) -> i64
      func.call @stack_push_pointer(%5069) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5073 = func.call @stack_pop_pointer() : () -> i64
      %5074 = func.call @stack_pop_pointer() : () -> i64
      %5075 = func.call @cc_cons(%5074, %5073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %5076 = arith.addi %5075, %__rlasp_stack_elide_zero_232 : i64
      %5077 = func.call @stack_pop_pointer() : () -> i64
      %5078 = func.call @cc_cons(%5077, %5076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5078) : (i64) -> ()
      %5079 = llvm.mlir.addressof @str400 : !llvm.ptr
      %5080 = arith.constant 3 : i64
      %5081 = func.call @cc_make_string(%5079, %5080) : (!llvm.ptr, i64) -> i64
      %5082 = func.call @cc_nil_value() : () -> i64
      %5083 = func.call @cc_intern(%5081, %5082) : (i64, i64) -> i64
      %5084 = func.call @cc_nil_value() : () -> i64
      %5085 = func.call @cc_cons(%5083, %5084) : (i64, i64) -> i64
      %5086 = func.call @cc_values_pack(%5085) : (i64) -> i64
      func.call @stack_push_pointer(%5083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5087 = func.call @stack_pop_pointer() : () -> i64
      %5088 = func.call @stack_pop_pointer() : () -> i64
      %5089 = func.call @cc_cons(%5088, %5087) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %5090 = arith.addi %5089, %__rlasp_stack_elide_zero_233 : i64
      %5091 = func.call @stack_pop_pointer() : () -> i64
      %5092 = func.call @cc_cons(%5091, %5090) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %5093 = arith.addi %5092, %__rlasp_stack_elide_zero_234 : i64
      %5094 = func.call @stack_pop_pointer() : () -> i64
      %5095 = func.call @cc_cons(%5094, %5093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5095) : (i64) -> ()
      %5096 = llvm.mlir.addressof @str401 : !llvm.ptr
      %5097 = arith.constant 7 : i64
      %5098 = func.call @cc_make_string(%5096, %5097) : (!llvm.ptr, i64) -> i64
      %5099 = llvm.mlir.addressof @str402 : !llvm.ptr
      %5100 = arith.constant 11 : i64
      %5101 = func.call @cc_make_string(%5099, %5100) : (!llvm.ptr, i64) -> i64
      %5102 = func.call @cc_intern(%5098, %5101) : (i64, i64) -> i64
      %5103 = func.call @cc_nil_value() : () -> i64
      %5104 = func.call @cc_cons(%5102, %5103) : (i64, i64) -> i64
      %5105 = func.call @cc_values_pack(%5104) : (i64) -> i64
      func.call @stack_push_pointer(%5102) : (i64) -> ()
      %5106 = llvm.mlir.addressof @str403 : !llvm.ptr
      %5107 = arith.constant 6 : i64
      %5108 = func.call @cc_make_string(%5106, %5107) : (!llvm.ptr, i64) -> i64
      %5109 = llvm.mlir.addressof @str404 : !llvm.ptr
      %5110 = arith.constant 11 : i64
      %5111 = func.call @cc_make_string(%5109, %5110) : (!llvm.ptr, i64) -> i64
      %5112 = func.call @cc_intern(%5108, %5111) : (i64, i64) -> i64
      %5113 = func.call @cc_nil_value() : () -> i64
      %5114 = func.call @cc_cons(%5112, %5113) : (i64, i64) -> i64
      %5115 = func.call @cc_values_pack(%5114) : (i64) -> i64
      func.call @stack_push_pointer(%5112) : (i64) -> ()
      %5116 = llvm.mlir.addressof @str405 : !llvm.ptr
      %5117 = arith.constant 3 : i64
      %5118 = func.call @cc_make_string(%5116, %5117) : (!llvm.ptr, i64) -> i64
      %5119 = func.call @cc_nil_value() : () -> i64
      %5120 = func.call @cc_intern(%5118, %5119) : (i64, i64) -> i64
      %5121 = func.call @cc_nil_value() : () -> i64
      %5122 = func.call @cc_cons(%5120, %5121) : (i64, i64) -> i64
      %5123 = func.call @cc_values_pack(%5122) : (i64) -> i64
      func.call @stack_push_pointer(%5120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5124 = func.call @stack_pop_pointer() : () -> i64
      %5125 = func.call @stack_pop_pointer() : () -> i64
      %5126 = func.call @cc_cons(%5125, %5124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %5127 = arith.addi %5126, %__rlasp_stack_elide_zero_235 : i64
      %5128 = func.call @stack_pop_pointer() : () -> i64
      %5129 = func.call @cc_cons(%5128, %5127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5130 = func.call @stack_pop_pointer() : () -> i64
      %5131 = func.call @stack_pop_pointer() : () -> i64
      %5132 = func.call @cc_cons(%5131, %5130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %5133 = arith.addi %5132, %__rlasp_stack_elide_zero_236 : i64
      %5134 = func.call @stack_pop_pointer() : () -> i64
      %5135 = func.call @cc_cons(%5134, %5133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5135) : (i64) -> ()
      %5136 = llvm.mlir.addressof @str406 : !llvm.ptr
      %5137 = arith.constant 4 : i64
      %5138 = func.call @cc_make_string(%5136, %5137) : (!llvm.ptr, i64) -> i64
      %5139 = llvm.mlir.addressof @str407 : !llvm.ptr
      %5140 = arith.constant 11 : i64
      %5141 = func.call @cc_make_string(%5139, %5140) : (!llvm.ptr, i64) -> i64
      %5142 = func.call @cc_intern(%5138, %5141) : (i64, i64) -> i64
      %5143 = func.call @cc_nil_value() : () -> i64
      %5144 = func.call @cc_cons(%5142, %5143) : (i64, i64) -> i64
      %5145 = func.call @cc_values_pack(%5144) : (i64) -> i64
      func.call @stack_push_pointer(%5142) : (i64) -> ()
      %5146 = llvm.mlir.addressof @str408 : !llvm.ptr
      %5147 = arith.constant 3 : i64
      %5148 = func.call @cc_make_string(%5146, %5147) : (!llvm.ptr, i64) -> i64
      %5149 = func.call @cc_nil_value() : () -> i64
      %5150 = func.call @cc_intern(%5148, %5149) : (i64, i64) -> i64
      %5151 = func.call @cc_nil_value() : () -> i64
      %5152 = func.call @cc_cons(%5150, %5151) : (i64, i64) -> i64
      %5153 = func.call @cc_values_pack(%5152) : (i64) -> i64
      func.call @stack_push_pointer(%5150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5154 = func.call @stack_pop_pointer() : () -> i64
      %5155 = func.call @stack_pop_pointer() : () -> i64
      %5156 = func.call @cc_cons(%5155, %5154) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %5157 = arith.addi %5156, %__rlasp_stack_elide_zero_237 : i64
      %5158 = func.call @stack_pop_pointer() : () -> i64
      %5159 = func.call @cc_cons(%5158, %5157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5160 = func.call @stack_pop_pointer() : () -> i64
      %5161 = func.call @stack_pop_pointer() : () -> i64
      %5162 = func.call @cc_cons(%5161, %5160) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %5163 = arith.addi %5162, %__rlasp_stack_elide_zero_238 : i64
      %5164 = func.call @stack_pop_pointer() : () -> i64
      %5165 = func.call @cc_cons(%5164, %5163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %5166 = arith.addi %5165, %__rlasp_stack_elide_zero_239 : i64
      %5167 = func.call @stack_pop_pointer() : () -> i64
      %5168 = func.call @cc_cons(%5167, %5166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %5169 = arith.addi %5168, %__rlasp_stack_elide_zero_240 : i64
      %5170 = func.call @stack_pop_pointer() : () -> i64
      %5171 = func.call @cc_cons(%5170, %5169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5172 = func.call @stack_pop_pointer() : () -> i64
      %5173 = func.call @stack_pop_pointer() : () -> i64
      %5174 = func.call @cc_cons(%5173, %5172) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %5175 = arith.addi %5174, %__rlasp_stack_elide_zero_241 : i64
      %5176 = func.call @stack_pop_pointer() : () -> i64
      %5177 = func.call @cc_cons(%5176, %5175) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %5178 = arith.addi %5177, %__rlasp_stack_elide_zero_242 : i64
      %5179 = func.call @stack_pop_pointer() : () -> i64
      %5180 = func.call @cc_cons(%5179, %5178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %5181 = arith.addi %5180, %__rlasp_stack_elide_zero_243 : i64
      %5264 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5265 = arith.constant 32 : i64
      %5266 = func.call @cc_make_symbol(%5264, %5265) : (!llvm.ptr, i64) -> i64
      %5267 = func.call @cc_persistent_root_value(%5266) : (i64) -> i64
      func.call @stack_push_pointer(%5267) : (i64) -> ()
      %5268 = arith.constant 116254966808595 : i64
      %5269 = arith.constant 1 : i64
      %5270 = func.call @cc_make_closure(%5268, %5269) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %5271 = arith.addi %5270, %__rlasp_stack_elide_zero_244 : i64
      %5272 = arith.constant 978 : i64
      func.call @stack_push_fixnum(%5272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5273 = func.call @stack_pop_pointer() : () -> i64
      %5274 = func.call @stack_pop_pointer() : () -> i64
      %5275 = func.call @cc_cons(%5274, %5273) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %5276 = arith.addi %5275, %__rlasp_stack_elide_zero_245 : i64
      %5277 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5278 = arith.constant 11 : i64
      %5279 = func.call @cc_make_string(%5277, %5278) : (!llvm.ptr, i64) -> i64
      %5280 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5281 = arith.constant 7 : i64
      %5282 = func.call @cc_make_string(%5280, %5281) : (!llvm.ptr, i64) -> i64
      %5283 = func.call @cc_intern(%5279, %5282) : (i64, i64) -> i64
      %5284 = func.call @cc_nil_value() : () -> i64
      %5285 = func.call @cc_cons(%5283, %5284) : (i64, i64) -> i64
      %5286 = func.call @cc_values_pack(%5285) : (i64) -> i64
      %5287 = func.call @cc_nil_value() : () -> i64
      %5288 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5289 = arith.constant 4 : i64
      %5290 = func.call @cc_make_string(%5288, %5289) : (!llvm.ptr, i64) -> i64
      %5291 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5292 = arith.constant 7 : i64
      %5293 = func.call @cc_make_string(%5291, %5292) : (!llvm.ptr, i64) -> i64
      %5294 = func.call @cc_intern(%5290, %5293) : (i64, i64) -> i64
      %5295 = func.call @cc_nil_value() : () -> i64
      %5296 = func.call @cc_cons(%5294, %5295) : (i64, i64) -> i64
      %5297 = func.call @cc_values_pack(%5296) : (i64) -> i64
      %5298 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5299 = arith.constant 6 : i64
      %5300 = func.call @cc_make_string(%5298, %5299) : (!llvm.ptr, i64) -> i64
      %5301 = func.call @cc_nil_value() : () -> i64
      %5302 = func.call @cc_intern(%5300, %5301) : (i64, i64) -> i64
      %5303 = func.call @cc_nil_value() : () -> i64
      %5304 = func.call @cc_cons(%5302, %5303) : (i64, i64) -> i64
      %5305 = func.call @cc_values_pack(%5304) : (i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %5306 = arith.addi %5302, %__rlasp_stack_elide_zero_246 : i64
      %5307 = func.call @cc_nil_value() : () -> i64
      %5308 = func.call @cc_errorp(%5008) : (i64) -> i64
      %5309 = arith.cmpi ne, %5308, %5307 : i64
      %5310 = arith.cmpi eq, %5307, %5307 : i64
      %5311 = arith.andi %5309, %5310 : i1
      %5312 = scf.if %5311 -> (i64) {
        scf.yield %5008 : i64
      } else {
        scf.yield %5307 : i64
      }
      %5313 = func.call @cc_errorp(%5181) : (i64) -> i64
      %5314 = arith.cmpi ne, %5313, %5307 : i64
      %5315 = arith.cmpi eq, %5312, %5307 : i64
      %5316 = arith.andi %5314, %5315 : i1
      %5317 = scf.if %5316 -> (i64) {
        scf.yield %5181 : i64
      } else {
        scf.yield %5312 : i64
      }
      %5318 = func.call @cc_errorp(%5271) : (i64) -> i64
      %5319 = arith.cmpi ne, %5318, %5307 : i64
      %5320 = arith.cmpi eq, %5317, %5307 : i64
      %5321 = arith.andi %5319, %5320 : i1
      %5322 = scf.if %5321 -> (i64) {
        scf.yield %5271 : i64
      } else {
        scf.yield %5317 : i64
      }
      %5323 = func.call @cc_errorp(%5276) : (i64) -> i64
      %5324 = arith.cmpi ne, %5323, %5307 : i64
      %5325 = arith.cmpi eq, %5322, %5307 : i64
      %5326 = arith.andi %5324, %5325 : i1
      %5327 = scf.if %5326 -> (i64) {
        scf.yield %5276 : i64
      } else {
        scf.yield %5322 : i64
      }
      %5328 = func.call @cc_errorp(%5283) : (i64) -> i64
      %5329 = arith.cmpi ne, %5328, %5307 : i64
      %5330 = arith.cmpi eq, %5327, %5307 : i64
      %5331 = arith.andi %5329, %5330 : i1
      %5332 = scf.if %5331 -> (i64) {
        scf.yield %5283 : i64
      } else {
        scf.yield %5327 : i64
      }
      %5333 = func.call @cc_errorp(%5287) : (i64) -> i64
      %5334 = arith.cmpi ne, %5333, %5307 : i64
      %5335 = arith.cmpi eq, %5332, %5307 : i64
      %5336 = arith.andi %5334, %5335 : i1
      %5337 = scf.if %5336 -> (i64) {
        scf.yield %5287 : i64
      } else {
        scf.yield %5332 : i64
      }
      %5338 = func.call @cc_errorp(%5294) : (i64) -> i64
      %5339 = arith.cmpi ne, %5338, %5307 : i64
      %5340 = arith.cmpi eq, %5337, %5307 : i64
      %5341 = arith.andi %5339, %5340 : i1
      %5342 = scf.if %5341 -> (i64) {
        scf.yield %5294 : i64
      } else {
        scf.yield %5337 : i64
      }
      %5343 = func.call @cc_errorp(%5306) : (i64) -> i64
      %5344 = arith.cmpi ne, %5343, %5307 : i64
      %5345 = arith.cmpi eq, %5342, %5307 : i64
      %5346 = arith.andi %5344, %5345 : i1
      %5347 = scf.if %5346 -> (i64) {
        scf.yield %5306 : i64
      } else {
        scf.yield %5342 : i64
      }
      %5348 = arith.cmpi ne, %5347, %5307 : i64
      scf.if %5348 {
        func.call @stack_push_pointer(%5347) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5008) : (i64) -> ()
        func.call @stack_push_pointer(%5181) : (i64) -> ()
        func.call @stack_push_pointer(%5271) : (i64) -> ()
        func.call @stack_push_pointer(%5276) : (i64) -> ()
        func.call @stack_push_pointer(%5283) : (i64) -> ()
        func.call @stack_push_pointer(%5287) : (i64) -> ()
        func.call @stack_push_pointer(%5294) : (i64) -> ()
        func.call @stack_push_pointer(%5306) : (i64) -> ()
        %5349 = llvm.mlir.addressof @str418 : !llvm.ptr
        %5350 = func.call @cc_make_function_ref_const(%5349) : (!llvm.ptr) -> i64
        %5351 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5350, %5351) : (i64, i64) -> ()
      }
      %5352 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5352 : i64
    }
    %5353 = func.call @cc_nil_value() : () -> i64
    %5354 = func.call @cc_errorp(%4999) : (i64) -> i64
    %5355 = arith.cmpi ne, %5354, %5353 : i64
    %5356 = scf.if %5355 -> (i64) {
      scf.yield %4999 : i64
    } else {
      %5357 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5358 = arith.constant 9 : i64
      %5359 = func.call @cc_make_string(%5357, %5358) : (!llvm.ptr, i64) -> i64
      %5360 = func.call @cc_nil_value() : () -> i64
      %5361 = func.call @cc_intern(%5359, %5360) : (i64, i64) -> i64
      %5362 = func.call @cc_nil_value() : () -> i64
      %5363 = func.call @cc_cons(%5361, %5362) : (i64, i64) -> i64
      %5364 = func.call @cc_values_pack(%5363) : (i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %5365 = arith.addi %5361, %__rlasp_stack_elide_zero_247 : i64
      %5366 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5367 = arith.constant 3 : i64
      %5368 = func.call @cc_make_string(%5366, %5367) : (!llvm.ptr, i64) -> i64
      %5369 = func.call @cc_nil_value() : () -> i64
      %5370 = func.call @cc_intern(%5368, %5369) : (i64, i64) -> i64
      %5371 = func.call @cc_nil_value() : () -> i64
      %5372 = func.call @cc_cons(%5370, %5371) : (i64, i64) -> i64
      %5373 = func.call @cc_values_pack(%5372) : (i64) -> i64
      func.call @stack_push_pointer(%5370) : (i64) -> ()
      %5374 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5375 = arith.constant 46 : i64
      %5376 = func.call @cc_make_string(%5374, %5375) : (!llvm.ptr, i64) -> i64
      %5377 = func.call @cc_nil_value() : () -> i64
      %5378 = func.call @cc_intern(%5376, %5377) : (i64, i64) -> i64
      %5379 = func.call @cc_nil_value() : () -> i64
      %5380 = func.call @cc_cons(%5378, %5379) : (i64, i64) -> i64
      %5381 = func.call @cc_values_pack(%5380) : (i64) -> i64
      func.call @stack_push_pointer(%5378) : (i64) -> ()
      %5382 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5382) : (i64) -> ()
      %5383 = llvm.mlir.addressof @str422 : !llvm.ptr
      %5384 = arith.constant 17 : i64
      %5385 = func.call @cc_make_string(%5383, %5384) : (!llvm.ptr, i64) -> i64
      %5386 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5387 = arith.constant 11 : i64
      %5388 = func.call @cc_make_string(%5386, %5387) : (!llvm.ptr, i64) -> i64
      %5389 = func.call @cc_intern(%5385, %5388) : (i64, i64) -> i64
      %5390 = func.call @cc_nil_value() : () -> i64
      %5391 = func.call @cc_cons(%5389, %5390) : (i64, i64) -> i64
      %5392 = func.call @cc_values_pack(%5391) : (i64) -> i64
      func.call @stack_push_pointer(%5389) : (i64) -> ()
      %5393 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5394 = arith.constant 4 : i64
      %5395 = func.call @cc_make_string(%5393, %5394) : (!llvm.ptr, i64) -> i64
      %5396 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5397 = arith.constant 11 : i64
      %5398 = func.call @cc_make_string(%5396, %5397) : (!llvm.ptr, i64) -> i64
      %5399 = func.call @cc_intern(%5395, %5398) : (i64, i64) -> i64
      %5400 = func.call @cc_nil_value() : () -> i64
      %5401 = func.call @cc_cons(%5399, %5400) : (i64, i64) -> i64
      %5402 = func.call @cc_values_pack(%5401) : (i64) -> i64
      func.call @stack_push_pointer(%5399) : (i64) -> ()
      %5403 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5404 = arith.constant 5 : i64
      %5405 = func.call @cc_make_string(%5403, %5404) : (!llvm.ptr, i64) -> i64
      %5406 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5407 = arith.constant 11 : i64
      %5408 = func.call @cc_make_string(%5406, %5407) : (!llvm.ptr, i64) -> i64
      %5409 = func.call @cc_intern(%5405, %5408) : (i64, i64) -> i64
      %5410 = func.call @cc_nil_value() : () -> i64
      %5411 = func.call @cc_cons(%5409, %5410) : (i64, i64) -> i64
      %5412 = func.call @cc_values_pack(%5411) : (i64) -> i64
      func.call @stack_push_pointer(%5409) : (i64) -> ()
      %5413 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5414 = arith.constant 12 : i64
      %5415 = func.call @cc_make_string(%5413, %5414) : (!llvm.ptr, i64) -> i64
      %5416 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5417 = arith.constant 11 : i64
      %5418 = func.call @cc_make_string(%5416, %5417) : (!llvm.ptr, i64) -> i64
      %5419 = func.call @cc_intern(%5415, %5418) : (i64, i64) -> i64
      %5420 = func.call @cc_nil_value() : () -> i64
      %5421 = func.call @cc_cons(%5419, %5420) : (i64, i64) -> i64
      %5422 = func.call @cc_values_pack(%5421) : (i64) -> i64
      func.call @stack_push_pointer(%5419) : (i64) -> ()
      %5423 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5424 = arith.constant 4 : i64
      %5425 = func.call @cc_make_string(%5423, %5424) : (!llvm.ptr, i64) -> i64
      %5426 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5427 = arith.constant 11 : i64
      %5428 = func.call @cc_make_string(%5426, %5427) : (!llvm.ptr, i64) -> i64
      %5429 = func.call @cc_intern(%5425, %5428) : (i64, i64) -> i64
      %5430 = func.call @cc_nil_value() : () -> i64
      %5431 = func.call @cc_cons(%5429, %5430) : (i64, i64) -> i64
      %5432 = func.call @cc_values_pack(%5431) : (i64) -> i64
      func.call @stack_push_pointer(%5429) : (i64) -> ()
      %5433 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5434 = arith.constant 9 : i64
      %5435 = func.call @cc_make_string(%5433, %5434) : (!llvm.ptr, i64) -> i64
      %5436 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5437 = arith.constant 11 : i64
      %5438 = func.call @cc_make_string(%5436, %5437) : (!llvm.ptr, i64) -> i64
      %5439 = func.call @cc_intern(%5435, %5438) : (i64, i64) -> i64
      %5440 = func.call @cc_nil_value() : () -> i64
      %5441 = func.call @cc_cons(%5439, %5440) : (i64, i64) -> i64
      %5442 = func.call @cc_values_pack(%5441) : (i64) -> i64
      func.call @stack_push_pointer(%5439) : (i64) -> ()
      %5443 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5444 = arith.constant 5 : i64
      %5445 = func.call @cc_make_string(%5443, %5444) : (!llvm.ptr, i64) -> i64
      %5446 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5447 = arith.constant 11 : i64
      %5448 = func.call @cc_make_string(%5446, %5447) : (!llvm.ptr, i64) -> i64
      %5449 = func.call @cc_intern(%5445, %5448) : (i64, i64) -> i64
      %5450 = func.call @cc_nil_value() : () -> i64
      %5451 = func.call @cc_cons(%5449, %5450) : (i64, i64) -> i64
      %5452 = func.call @cc_values_pack(%5451) : (i64) -> i64
      func.call @stack_push_pointer(%5449) : (i64) -> ()
      %5453 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5454 = arith.constant 6 : i64
      %5455 = func.call @cc_make_string(%5453, %5454) : (!llvm.ptr, i64) -> i64
      %5456 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5457 = arith.constant 11 : i64
      %5458 = func.call @cc_make_string(%5456, %5457) : (!llvm.ptr, i64) -> i64
      %5459 = func.call @cc_intern(%5455, %5458) : (i64, i64) -> i64
      %5460 = func.call @cc_nil_value() : () -> i64
      %5461 = func.call @cc_cons(%5459, %5460) : (i64, i64) -> i64
      %5462 = func.call @cc_values_pack(%5461) : (i64) -> i64
      func.call @stack_push_pointer(%5459) : (i64) -> ()
      %5463 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5464 = arith.constant 2 : i64
      %5465 = func.call @cc_make_string(%5463, %5464) : (!llvm.ptr, i64) -> i64
      %5466 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5467 = arith.constant 11 : i64
      %5468 = func.call @cc_make_string(%5466, %5467) : (!llvm.ptr, i64) -> i64
      %5469 = func.call @cc_intern(%5465, %5468) : (i64, i64) -> i64
      %5470 = func.call @cc_nil_value() : () -> i64
      %5471 = func.call @cc_cons(%5469, %5470) : (i64, i64) -> i64
      %5472 = func.call @cc_values_pack(%5471) : (i64) -> i64
      func.call @stack_push_pointer(%5469) : (i64) -> ()
      %5473 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5474 = arith.constant 3 : i64
      %5475 = func.call @cc_make_string(%5473, %5474) : (!llvm.ptr, i64) -> i64
      %5476 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5477 = arith.constant 11 : i64
      %5478 = func.call @cc_make_string(%5476, %5477) : (!llvm.ptr, i64) -> i64
      %5479 = func.call @cc_intern(%5475, %5478) : (i64, i64) -> i64
      %5480 = func.call @cc_nil_value() : () -> i64
      %5481 = func.call @cc_cons(%5479, %5480) : (i64, i64) -> i64
      %5482 = func.call @cc_values_pack(%5481) : (i64) -> i64
      func.call @stack_push_pointer(%5479) : (i64) -> ()
      %5483 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5484 = arith.constant 18 : i64
      %5485 = func.call @cc_make_string(%5483, %5484) : (!llvm.ptr, i64) -> i64
      %5486 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5487 = arith.constant 11 : i64
      %5488 = func.call @cc_make_string(%5486, %5487) : (!llvm.ptr, i64) -> i64
      %5489 = func.call @cc_intern(%5485, %5488) : (i64, i64) -> i64
      %5490 = func.call @cc_nil_value() : () -> i64
      %5491 = func.call @cc_cons(%5489, %5490) : (i64, i64) -> i64
      %5492 = func.call @cc_values_pack(%5491) : (i64) -> i64
      func.call @stack_push_pointer(%5489) : (i64) -> ()
      %5493 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5494 = arith.constant 23 : i64
      %5495 = func.call @cc_make_string(%5493, %5494) : (!llvm.ptr, i64) -> i64
      %5496 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5497 = arith.constant 11 : i64
      %5498 = func.call @cc_make_string(%5496, %5497) : (!llvm.ptr, i64) -> i64
      %5499 = func.call @cc_intern(%5495, %5498) : (i64, i64) -> i64
      %5500 = func.call @cc_nil_value() : () -> i64
      %5501 = func.call @cc_cons(%5499, %5500) : (i64, i64) -> i64
      %5502 = func.call @cc_values_pack(%5501) : (i64) -> i64
      func.call @stack_push_pointer(%5499) : (i64) -> ()
      %5503 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5504 = arith.constant 23 : i64
      %5505 = func.call @cc_make_string(%5503, %5504) : (!llvm.ptr, i64) -> i64
      %5506 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5507 = arith.constant 11 : i64
      %5508 = func.call @cc_make_string(%5506, %5507) : (!llvm.ptr, i64) -> i64
      %5509 = func.call @cc_intern(%5505, %5508) : (i64, i64) -> i64
      %5510 = func.call @cc_nil_value() : () -> i64
      %5511 = func.call @cc_cons(%5509, %5510) : (i64, i64) -> i64
      %5512 = func.call @cc_values_pack(%5511) : (i64) -> i64
      func.call @stack_push_pointer(%5509) : (i64) -> ()
      %5513 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5514 = arith.constant 15 : i64
      %5515 = func.call @cc_make_string(%5513, %5514) : (!llvm.ptr, i64) -> i64
      %5516 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5517 = arith.constant 11 : i64
      %5518 = func.call @cc_make_string(%5516, %5517) : (!llvm.ptr, i64) -> i64
      %5519 = func.call @cc_intern(%5515, %5518) : (i64, i64) -> i64
      %5520 = func.call @cc_nil_value() : () -> i64
      %5521 = func.call @cc_cons(%5519, %5520) : (i64, i64) -> i64
      %5522 = func.call @cc_values_pack(%5521) : (i64) -> i64
      func.call @stack_push_pointer(%5519) : (i64) -> ()
      %5523 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5524 = arith.constant 17 : i64
      %5525 = func.call @cc_make_string(%5523, %5524) : (!llvm.ptr, i64) -> i64
      %5526 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5527 = arith.constant 11 : i64
      %5528 = func.call @cc_make_string(%5526, %5527) : (!llvm.ptr, i64) -> i64
      %5529 = func.call @cc_intern(%5525, %5528) : (i64, i64) -> i64
      %5530 = func.call @cc_nil_value() : () -> i64
      %5531 = func.call @cc_cons(%5529, %5530) : (i64, i64) -> i64
      %5532 = func.call @cc_values_pack(%5531) : (i64) -> i64
      func.call @stack_push_pointer(%5529) : (i64) -> ()
      %5533 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5534 = arith.constant 10 : i64
      %5535 = func.call @cc_make_string(%5533, %5534) : (!llvm.ptr, i64) -> i64
      %5536 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5537 = arith.constant 11 : i64
      %5538 = func.call @cc_make_string(%5536, %5537) : (!llvm.ptr, i64) -> i64
      %5539 = func.call @cc_intern(%5535, %5538) : (i64, i64) -> i64
      %5540 = func.call @cc_nil_value() : () -> i64
      %5541 = func.call @cc_cons(%5539, %5540) : (i64, i64) -> i64
      %5542 = func.call @cc_values_pack(%5541) : (i64) -> i64
      func.call @stack_push_pointer(%5539) : (i64) -> ()
      %5543 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5544 = arith.constant 15 : i64
      %5545 = func.call @cc_make_string(%5543, %5544) : (!llvm.ptr, i64) -> i64
      %5546 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5547 = arith.constant 11 : i64
      %5548 = func.call @cc_make_string(%5546, %5547) : (!llvm.ptr, i64) -> i64
      %5549 = func.call @cc_intern(%5545, %5548) : (i64, i64) -> i64
      %5550 = func.call @cc_nil_value() : () -> i64
      %5551 = func.call @cc_cons(%5549, %5550) : (i64, i64) -> i64
      %5552 = func.call @cc_values_pack(%5551) : (i64) -> i64
      func.call @stack_push_pointer(%5549) : (i64) -> ()
      %5553 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5554 = arith.constant 27 : i64
      %5555 = func.call @cc_make_string(%5553, %5554) : (!llvm.ptr, i64) -> i64
      %5556 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5557 = arith.constant 11 : i64
      %5558 = func.call @cc_make_string(%5556, %5557) : (!llvm.ptr, i64) -> i64
      %5559 = func.call @cc_intern(%5555, %5558) : (i64, i64) -> i64
      %5560 = func.call @cc_nil_value() : () -> i64
      %5561 = func.call @cc_cons(%5559, %5560) : (i64, i64) -> i64
      %5562 = func.call @cc_values_pack(%5561) : (i64) -> i64
      func.call @stack_push_pointer(%5559) : (i64) -> ()
      %5563 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5564 = arith.constant 14 : i64
      %5565 = func.call @cc_make_string(%5563, %5564) : (!llvm.ptr, i64) -> i64
      %5566 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5567 = arith.constant 11 : i64
      %5568 = func.call @cc_make_string(%5566, %5567) : (!llvm.ptr, i64) -> i64
      %5569 = func.call @cc_intern(%5565, %5568) : (i64, i64) -> i64
      %5570 = func.call @cc_nil_value() : () -> i64
      %5571 = func.call @cc_cons(%5569, %5570) : (i64, i64) -> i64
      %5572 = func.call @cc_values_pack(%5571) : (i64) -> i64
      func.call @stack_push_pointer(%5569) : (i64) -> ()
      %5573 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5574 = arith.constant 10 : i64
      %5575 = func.call @cc_make_string(%5573, %5574) : (!llvm.ptr, i64) -> i64
      %5576 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5577 = arith.constant 11 : i64
      %5578 = func.call @cc_make_string(%5576, %5577) : (!llvm.ptr, i64) -> i64
      %5579 = func.call @cc_intern(%5575, %5578) : (i64, i64) -> i64
      %5580 = func.call @cc_nil_value() : () -> i64
      %5581 = func.call @cc_cons(%5579, %5580) : (i64, i64) -> i64
      %5582 = func.call @cc_values_pack(%5581) : (i64) -> i64
      func.call @stack_push_pointer(%5579) : (i64) -> ()
      %5583 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5584 = arith.constant 16 : i64
      %5585 = func.call @cc_make_string(%5583, %5584) : (!llvm.ptr, i64) -> i64
      %5586 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5587 = arith.constant 11 : i64
      %5588 = func.call @cc_make_string(%5586, %5587) : (!llvm.ptr, i64) -> i64
      %5589 = func.call @cc_intern(%5585, %5588) : (i64, i64) -> i64
      %5590 = func.call @cc_nil_value() : () -> i64
      %5591 = func.call @cc_cons(%5589, %5590) : (i64, i64) -> i64
      %5592 = func.call @cc_values_pack(%5591) : (i64) -> i64
      func.call @stack_push_pointer(%5589) : (i64) -> ()
      %5593 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5594 = arith.constant 15 : i64
      %5595 = func.call @cc_make_string(%5593, %5594) : (!llvm.ptr, i64) -> i64
      %5596 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5597 = arith.constant 11 : i64
      %5598 = func.call @cc_make_string(%5596, %5597) : (!llvm.ptr, i64) -> i64
      %5599 = func.call @cc_intern(%5595, %5598) : (i64, i64) -> i64
      %5600 = func.call @cc_nil_value() : () -> i64
      %5601 = func.call @cc_cons(%5599, %5600) : (i64, i64) -> i64
      %5602 = func.call @cc_values_pack(%5601) : (i64) -> i64
      func.call @stack_push_pointer(%5599) : (i64) -> ()
      %5603 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5604 = arith.constant 12 : i64
      %5605 = func.call @cc_make_string(%5603, %5604) : (!llvm.ptr, i64) -> i64
      %5606 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5607 = arith.constant 11 : i64
      %5608 = func.call @cc_make_string(%5606, %5607) : (!llvm.ptr, i64) -> i64
      %5609 = func.call @cc_intern(%5605, %5608) : (i64, i64) -> i64
      %5610 = func.call @cc_nil_value() : () -> i64
      %5611 = func.call @cc_cons(%5609, %5610) : (i64, i64) -> i64
      %5612 = func.call @cc_values_pack(%5611) : (i64) -> i64
      func.call @stack_push_pointer(%5609) : (i64) -> ()
      %5613 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5614 = arith.constant 15 : i64
      %5615 = func.call @cc_make_string(%5613, %5614) : (!llvm.ptr, i64) -> i64
      %5616 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5617 = arith.constant 11 : i64
      %5618 = func.call @cc_make_string(%5616, %5617) : (!llvm.ptr, i64) -> i64
      %5619 = func.call @cc_intern(%5615, %5618) : (i64, i64) -> i64
      %5620 = func.call @cc_nil_value() : () -> i64
      %5621 = func.call @cc_cons(%5619, %5620) : (i64, i64) -> i64
      %5622 = func.call @cc_values_pack(%5621) : (i64) -> i64
      func.call @stack_push_pointer(%5619) : (i64) -> ()
      %5623 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5624 = arith.constant 14 : i64
      %5625 = func.call @cc_make_string(%5623, %5624) : (!llvm.ptr, i64) -> i64
      %5626 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5627 = arith.constant 11 : i64
      %5628 = func.call @cc_make_string(%5626, %5627) : (!llvm.ptr, i64) -> i64
      %5629 = func.call @cc_intern(%5625, %5628) : (i64, i64) -> i64
      %5630 = func.call @cc_nil_value() : () -> i64
      %5631 = func.call @cc_cons(%5629, %5630) : (i64, i64) -> i64
      %5632 = func.call @cc_values_pack(%5631) : (i64) -> i64
      func.call @stack_push_pointer(%5629) : (i64) -> ()
      %5633 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5634 = arith.constant 18 : i64
      %5635 = func.call @cc_make_string(%5633, %5634) : (!llvm.ptr, i64) -> i64
      %5636 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5637 = arith.constant 11 : i64
      %5638 = func.call @cc_make_string(%5636, %5637) : (!llvm.ptr, i64) -> i64
      %5639 = func.call @cc_intern(%5635, %5638) : (i64, i64) -> i64
      %5640 = func.call @cc_nil_value() : () -> i64
      %5641 = func.call @cc_cons(%5639, %5640) : (i64, i64) -> i64
      %5642 = func.call @cc_values_pack(%5641) : (i64) -> i64
      func.call @stack_push_pointer(%5639) : (i64) -> ()
      %5643 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5644 = arith.constant 9 : i64
      %5645 = func.call @cc_make_string(%5643, %5644) : (!llvm.ptr, i64) -> i64
      %5646 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5647 = arith.constant 11 : i64
      %5648 = func.call @cc_make_string(%5646, %5647) : (!llvm.ptr, i64) -> i64
      %5649 = func.call @cc_intern(%5645, %5648) : (i64, i64) -> i64
      %5650 = func.call @cc_nil_value() : () -> i64
      %5651 = func.call @cc_cons(%5649, %5650) : (i64, i64) -> i64
      %5652 = func.call @cc_values_pack(%5651) : (i64) -> i64
      func.call @stack_push_pointer(%5649) : (i64) -> ()
      %5653 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5654 = arith.constant 9 : i64
      %5655 = func.call @cc_make_string(%5653, %5654) : (!llvm.ptr, i64) -> i64
      %5656 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5657 = arith.constant 11 : i64
      %5658 = func.call @cc_make_string(%5656, %5657) : (!llvm.ptr, i64) -> i64
      %5659 = func.call @cc_intern(%5655, %5658) : (i64, i64) -> i64
      %5660 = func.call @cc_nil_value() : () -> i64
      %5661 = func.call @cc_cons(%5659, %5660) : (i64, i64) -> i64
      %5662 = func.call @cc_values_pack(%5661) : (i64) -> i64
      func.call @stack_push_pointer(%5659) : (i64) -> ()
      %5663 = llvm.mlir.addressof @str478 : !llvm.ptr
      %5664 = arith.constant 13 : i64
      %5665 = func.call @cc_make_string(%5663, %5664) : (!llvm.ptr, i64) -> i64
      %5666 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5667 = arith.constant 11 : i64
      %5668 = func.call @cc_make_string(%5666, %5667) : (!llvm.ptr, i64) -> i64
      %5669 = func.call @cc_intern(%5665, %5668) : (i64, i64) -> i64
      %5670 = func.call @cc_nil_value() : () -> i64
      %5671 = func.call @cc_cons(%5669, %5670) : (i64, i64) -> i64
      %5672 = func.call @cc_values_pack(%5671) : (i64) -> i64
      func.call @stack_push_pointer(%5669) : (i64) -> ()
      %5673 = llvm.mlir.addressof @str480 : !llvm.ptr
      %5674 = arith.constant 12 : i64
      %5675 = func.call @cc_make_string(%5673, %5674) : (!llvm.ptr, i64) -> i64
      %5676 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5677 = arith.constant 11 : i64
      %5678 = func.call @cc_make_string(%5676, %5677) : (!llvm.ptr, i64) -> i64
      %5679 = func.call @cc_intern(%5675, %5678) : (i64, i64) -> i64
      %5680 = func.call @cc_nil_value() : () -> i64
      %5681 = func.call @cc_cons(%5679, %5680) : (i64, i64) -> i64
      %5682 = func.call @cc_values_pack(%5681) : (i64) -> i64
      func.call @stack_push_pointer(%5679) : (i64) -> ()
      %5683 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5684 = arith.constant 12 : i64
      %5685 = func.call @cc_make_string(%5683, %5684) : (!llvm.ptr, i64) -> i64
      %5686 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5687 = arith.constant 11 : i64
      %5688 = func.call @cc_make_string(%5686, %5687) : (!llvm.ptr, i64) -> i64
      %5689 = func.call @cc_intern(%5685, %5688) : (i64, i64) -> i64
      %5690 = func.call @cc_nil_value() : () -> i64
      %5691 = func.call @cc_cons(%5689, %5690) : (i64, i64) -> i64
      %5692 = func.call @cc_values_pack(%5691) : (i64) -> i64
      func.call @stack_push_pointer(%5689) : (i64) -> ()
      %5693 = llvm.mlir.addressof @str484 : !llvm.ptr
      %5694 = arith.constant 14 : i64
      %5695 = func.call @cc_make_string(%5693, %5694) : (!llvm.ptr, i64) -> i64
      %5696 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5697 = arith.constant 11 : i64
      %5698 = func.call @cc_make_string(%5696, %5697) : (!llvm.ptr, i64) -> i64
      %5699 = func.call @cc_intern(%5695, %5698) : (i64, i64) -> i64
      %5700 = func.call @cc_nil_value() : () -> i64
      %5701 = func.call @cc_cons(%5699, %5700) : (i64, i64) -> i64
      %5702 = func.call @cc_values_pack(%5701) : (i64) -> i64
      func.call @stack_push_pointer(%5699) : (i64) -> ()
      %5703 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5704 = arith.constant 14 : i64
      %5705 = func.call @cc_make_string(%5703, %5704) : (!llvm.ptr, i64) -> i64
      %5706 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5707 = arith.constant 11 : i64
      %5708 = func.call @cc_make_string(%5706, %5707) : (!llvm.ptr, i64) -> i64
      %5709 = func.call @cc_intern(%5705, %5708) : (i64, i64) -> i64
      %5710 = func.call @cc_nil_value() : () -> i64
      %5711 = func.call @cc_cons(%5709, %5710) : (i64, i64) -> i64
      %5712 = func.call @cc_values_pack(%5711) : (i64) -> i64
      func.call @stack_push_pointer(%5709) : (i64) -> ()
      %5713 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5714 = arith.constant 14 : i64
      %5715 = func.call @cc_make_string(%5713, %5714) : (!llvm.ptr, i64) -> i64
      %5716 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5717 = arith.constant 11 : i64
      %5718 = func.call @cc_make_string(%5716, %5717) : (!llvm.ptr, i64) -> i64
      %5719 = func.call @cc_intern(%5715, %5718) : (i64, i64) -> i64
      %5720 = func.call @cc_nil_value() : () -> i64
      %5721 = func.call @cc_cons(%5719, %5720) : (i64, i64) -> i64
      %5722 = func.call @cc_values_pack(%5721) : (i64) -> i64
      func.call @stack_push_pointer(%5719) : (i64) -> ()
      %5723 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5724 = arith.constant 14 : i64
      %5725 = func.call @cc_make_string(%5723, %5724) : (!llvm.ptr, i64) -> i64
      %5726 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5727 = arith.constant 11 : i64
      %5728 = func.call @cc_make_string(%5726, %5727) : (!llvm.ptr, i64) -> i64
      %5729 = func.call @cc_intern(%5725, %5728) : (i64, i64) -> i64
      %5730 = func.call @cc_nil_value() : () -> i64
      %5731 = func.call @cc_cons(%5729, %5730) : (i64, i64) -> i64
      %5732 = func.call @cc_values_pack(%5731) : (i64) -> i64
      func.call @stack_push_pointer(%5729) : (i64) -> ()
      %5733 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5734 = arith.constant 13 : i64
      %5735 = func.call @cc_make_string(%5733, %5734) : (!llvm.ptr, i64) -> i64
      %5736 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5737 = arith.constant 11 : i64
      %5738 = func.call @cc_make_string(%5736, %5737) : (!llvm.ptr, i64) -> i64
      %5739 = func.call @cc_intern(%5735, %5738) : (i64, i64) -> i64
      %5740 = func.call @cc_nil_value() : () -> i64
      %5741 = func.call @cc_cons(%5739, %5740) : (i64, i64) -> i64
      %5742 = func.call @cc_values_pack(%5741) : (i64) -> i64
      func.call @stack_push_pointer(%5739) : (i64) -> ()
      %5743 = llvm.mlir.addressof @str494 : !llvm.ptr
      %5744 = arith.constant 13 : i64
      %5745 = func.call @cc_make_string(%5743, %5744) : (!llvm.ptr, i64) -> i64
      %5746 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5747 = arith.constant 11 : i64
      %5748 = func.call @cc_make_string(%5746, %5747) : (!llvm.ptr, i64) -> i64
      %5749 = func.call @cc_intern(%5745, %5748) : (i64, i64) -> i64
      %5750 = func.call @cc_nil_value() : () -> i64
      %5751 = func.call @cc_cons(%5749, %5750) : (i64, i64) -> i64
      %5752 = func.call @cc_values_pack(%5751) : (i64) -> i64
      func.call @stack_push_pointer(%5749) : (i64) -> ()
      %5753 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5754 = arith.constant 19 : i64
      %5755 = func.call @cc_make_string(%5753, %5754) : (!llvm.ptr, i64) -> i64
      %5756 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5757 = arith.constant 11 : i64
      %5758 = func.call @cc_make_string(%5756, %5757) : (!llvm.ptr, i64) -> i64
      %5759 = func.call @cc_intern(%5755, %5758) : (i64, i64) -> i64
      %5760 = func.call @cc_nil_value() : () -> i64
      %5761 = func.call @cc_cons(%5759, %5760) : (i64, i64) -> i64
      %5762 = func.call @cc_values_pack(%5761) : (i64) -> i64
      func.call @stack_push_pointer(%5759) : (i64) -> ()
      %5763 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5764 = arith.constant 23 : i64
      %5765 = func.call @cc_make_string(%5763, %5764) : (!llvm.ptr, i64) -> i64
      %5766 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5767 = arith.constant 11 : i64
      %5768 = func.call @cc_make_string(%5766, %5767) : (!llvm.ptr, i64) -> i64
      %5769 = func.call @cc_intern(%5765, %5768) : (i64, i64) -> i64
      %5770 = func.call @cc_nil_value() : () -> i64
      %5771 = func.call @cc_cons(%5769, %5770) : (i64, i64) -> i64
      %5772 = func.call @cc_values_pack(%5771) : (i64) -> i64
      func.call @stack_push_pointer(%5769) : (i64) -> ()
      %5773 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5774 = arith.constant 14 : i64
      %5775 = func.call @cc_make_string(%5773, %5774) : (!llvm.ptr, i64) -> i64
      %5776 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5777 = arith.constant 11 : i64
      %5778 = func.call @cc_make_string(%5776, %5777) : (!llvm.ptr, i64) -> i64
      %5779 = func.call @cc_intern(%5775, %5778) : (i64, i64) -> i64
      %5780 = func.call @cc_nil_value() : () -> i64
      %5781 = func.call @cc_cons(%5779, %5780) : (i64, i64) -> i64
      %5782 = func.call @cc_values_pack(%5781) : (i64) -> i64
      func.call @stack_push_pointer(%5779) : (i64) -> ()
      %5783 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5784 = arith.constant 13 : i64
      %5785 = func.call @cc_make_string(%5783, %5784) : (!llvm.ptr, i64) -> i64
      %5786 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5787 = arith.constant 11 : i64
      %5788 = func.call @cc_make_string(%5786, %5787) : (!llvm.ptr, i64) -> i64
      %5789 = func.call @cc_intern(%5785, %5788) : (i64, i64) -> i64
      %5790 = func.call @cc_nil_value() : () -> i64
      %5791 = func.call @cc_cons(%5789, %5790) : (i64, i64) -> i64
      %5792 = func.call @cc_values_pack(%5791) : (i64) -> i64
      func.call @stack_push_pointer(%5789) : (i64) -> ()
      %5793 = llvm.mlir.addressof @str504 : !llvm.ptr
      %5794 = arith.constant 16 : i64
      %5795 = func.call @cc_make_string(%5793, %5794) : (!llvm.ptr, i64) -> i64
      %5796 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5797 = arith.constant 11 : i64
      %5798 = func.call @cc_make_string(%5796, %5797) : (!llvm.ptr, i64) -> i64
      %5799 = func.call @cc_intern(%5795, %5798) : (i64, i64) -> i64
      %5800 = func.call @cc_nil_value() : () -> i64
      %5801 = func.call @cc_cons(%5799, %5800) : (i64, i64) -> i64
      %5802 = func.call @cc_values_pack(%5801) : (i64) -> i64
      func.call @stack_push_pointer(%5799) : (i64) -> ()
      %5803 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5804 = arith.constant 20 : i64
      %5805 = func.call @cc_make_string(%5803, %5804) : (!llvm.ptr, i64) -> i64
      %5806 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5807 = arith.constant 11 : i64
      %5808 = func.call @cc_make_string(%5806, %5807) : (!llvm.ptr, i64) -> i64
      %5809 = func.call @cc_intern(%5805, %5808) : (i64, i64) -> i64
      %5810 = func.call @cc_nil_value() : () -> i64
      %5811 = func.call @cc_cons(%5809, %5810) : (i64, i64) -> i64
      %5812 = func.call @cc_values_pack(%5811) : (i64) -> i64
      func.call @stack_push_pointer(%5809) : (i64) -> ()
      %5813 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5814 = arith.constant 10 : i64
      %5815 = func.call @cc_make_string(%5813, %5814) : (!llvm.ptr, i64) -> i64
      %5816 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5817 = arith.constant 11 : i64
      %5818 = func.call @cc_make_string(%5816, %5817) : (!llvm.ptr, i64) -> i64
      %5819 = func.call @cc_intern(%5815, %5818) : (i64, i64) -> i64
      %5820 = func.call @cc_nil_value() : () -> i64
      %5821 = func.call @cc_cons(%5819, %5820) : (i64, i64) -> i64
      %5822 = func.call @cc_values_pack(%5821) : (i64) -> i64
      func.call @stack_push_pointer(%5819) : (i64) -> ()
      %5823 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5824 = arith.constant 14 : i64
      %5825 = func.call @cc_make_string(%5823, %5824) : (!llvm.ptr, i64) -> i64
      %5826 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5827 = arith.constant 11 : i64
      %5828 = func.call @cc_make_string(%5826, %5827) : (!llvm.ptr, i64) -> i64
      %5829 = func.call @cc_intern(%5825, %5828) : (i64, i64) -> i64
      %5830 = func.call @cc_nil_value() : () -> i64
      %5831 = func.call @cc_cons(%5829, %5830) : (i64, i64) -> i64
      %5832 = func.call @cc_values_pack(%5831) : (i64) -> i64
      func.call @stack_push_pointer(%5829) : (i64) -> ()
      %5833 = llvm.mlir.addressof @str512 : !llvm.ptr
      %5834 = arith.constant 11 : i64
      %5835 = func.call @cc_make_string(%5833, %5834) : (!llvm.ptr, i64) -> i64
      %5836 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5837 = arith.constant 11 : i64
      %5838 = func.call @cc_make_string(%5836, %5837) : (!llvm.ptr, i64) -> i64
      %5839 = func.call @cc_intern(%5835, %5838) : (i64, i64) -> i64
      %5840 = func.call @cc_nil_value() : () -> i64
      %5841 = func.call @cc_cons(%5839, %5840) : (i64, i64) -> i64
      %5842 = func.call @cc_values_pack(%5841) : (i64) -> i64
      func.call @stack_push_pointer(%5839) : (i64) -> ()
      %5843 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5844 = arith.constant 27 : i64
      %5845 = func.call @cc_make_string(%5843, %5844) : (!llvm.ptr, i64) -> i64
      %5846 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5847 = arith.constant 11 : i64
      %5848 = func.call @cc_make_string(%5846, %5847) : (!llvm.ptr, i64) -> i64
      %5849 = func.call @cc_intern(%5845, %5848) : (i64, i64) -> i64
      %5850 = func.call @cc_nil_value() : () -> i64
      %5851 = func.call @cc_cons(%5849, %5850) : (i64, i64) -> i64
      %5852 = func.call @cc_values_pack(%5851) : (i64) -> i64
      func.call @stack_push_pointer(%5849) : (i64) -> ()
      %5853 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5854 = arith.constant 11 : i64
      %5855 = func.call @cc_make_string(%5853, %5854) : (!llvm.ptr, i64) -> i64
      %5856 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5857 = arith.constant 11 : i64
      %5858 = func.call @cc_make_string(%5856, %5857) : (!llvm.ptr, i64) -> i64
      %5859 = func.call @cc_intern(%5855, %5858) : (i64, i64) -> i64
      %5860 = func.call @cc_nil_value() : () -> i64
      %5861 = func.call @cc_cons(%5859, %5860) : (i64, i64) -> i64
      %5862 = func.call @cc_values_pack(%5861) : (i64) -> i64
      func.call @stack_push_pointer(%5859) : (i64) -> ()
      %5863 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5864 = arith.constant 15 : i64
      %5865 = func.call @cc_make_string(%5863, %5864) : (!llvm.ptr, i64) -> i64
      %5866 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5867 = arith.constant 11 : i64
      %5868 = func.call @cc_make_string(%5866, %5867) : (!llvm.ptr, i64) -> i64
      %5869 = func.call @cc_intern(%5865, %5868) : (i64, i64) -> i64
      %5870 = func.call @cc_nil_value() : () -> i64
      %5871 = func.call @cc_cons(%5869, %5870) : (i64, i64) -> i64
      %5872 = func.call @cc_values_pack(%5871) : (i64) -> i64
      func.call @stack_push_pointer(%5869) : (i64) -> ()
      %5873 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5874 = arith.constant 11 : i64
      %5875 = func.call @cc_make_string(%5873, %5874) : (!llvm.ptr, i64) -> i64
      %5876 = llvm.mlir.addressof @str521 : !llvm.ptr
      %5877 = arith.constant 11 : i64
      %5878 = func.call @cc_make_string(%5876, %5877) : (!llvm.ptr, i64) -> i64
      %5879 = func.call @cc_intern(%5875, %5878) : (i64, i64) -> i64
      %5880 = func.call @cc_nil_value() : () -> i64
      %5881 = func.call @cc_cons(%5879, %5880) : (i64, i64) -> i64
      %5882 = func.call @cc_values_pack(%5881) : (i64) -> i64
      func.call @stack_push_pointer(%5879) : (i64) -> ()
      %5883 = llvm.mlir.addressof @str522 : !llvm.ptr
      %5884 = arith.constant 16 : i64
      %5885 = func.call @cc_make_string(%5883, %5884) : (!llvm.ptr, i64) -> i64
      %5886 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5887 = arith.constant 11 : i64
      %5888 = func.call @cc_make_string(%5886, %5887) : (!llvm.ptr, i64) -> i64
      %5889 = func.call @cc_intern(%5885, %5888) : (i64, i64) -> i64
      %5890 = func.call @cc_nil_value() : () -> i64
      %5891 = func.call @cc_cons(%5889, %5890) : (i64, i64) -> i64
      %5892 = func.call @cc_values_pack(%5891) : (i64) -> i64
      func.call @stack_push_pointer(%5889) : (i64) -> ()
      %5893 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5894 = arith.constant 17 : i64
      %5895 = func.call @cc_make_string(%5893, %5894) : (!llvm.ptr, i64) -> i64
      %5896 = llvm.mlir.addressof @str525 : !llvm.ptr
      %5897 = arith.constant 11 : i64
      %5898 = func.call @cc_make_string(%5896, %5897) : (!llvm.ptr, i64) -> i64
      %5899 = func.call @cc_intern(%5895, %5898) : (i64, i64) -> i64
      %5900 = func.call @cc_nil_value() : () -> i64
      %5901 = func.call @cc_cons(%5899, %5900) : (i64, i64) -> i64
      %5902 = func.call @cc_values_pack(%5901) : (i64) -> i64
      func.call @stack_push_pointer(%5899) : (i64) -> ()
      %5903 = llvm.mlir.addressof @str526 : !llvm.ptr
      %5904 = arith.constant 13 : i64
      %5905 = func.call @cc_make_string(%5903, %5904) : (!llvm.ptr, i64) -> i64
      %5906 = llvm.mlir.addressof @str527 : !llvm.ptr
      %5907 = arith.constant 11 : i64
      %5908 = func.call @cc_make_string(%5906, %5907) : (!llvm.ptr, i64) -> i64
      %5909 = func.call @cc_intern(%5905, %5908) : (i64, i64) -> i64
      %5910 = func.call @cc_nil_value() : () -> i64
      %5911 = func.call @cc_cons(%5909, %5910) : (i64, i64) -> i64
      %5912 = func.call @cc_values_pack(%5911) : (i64) -> i64
      func.call @stack_push_pointer(%5909) : (i64) -> ()
      %5913 = llvm.mlir.addressof @str528 : !llvm.ptr
      %5914 = arith.constant 14 : i64
      %5915 = func.call @cc_make_string(%5913, %5914) : (!llvm.ptr, i64) -> i64
      %5916 = llvm.mlir.addressof @str529 : !llvm.ptr
      %5917 = arith.constant 11 : i64
      %5918 = func.call @cc_make_string(%5916, %5917) : (!llvm.ptr, i64) -> i64
      %5919 = func.call @cc_intern(%5915, %5918) : (i64, i64) -> i64
      %5920 = func.call @cc_nil_value() : () -> i64
      %5921 = func.call @cc_cons(%5919, %5920) : (i64, i64) -> i64
      %5922 = func.call @cc_values_pack(%5921) : (i64) -> i64
      func.call @stack_push_pointer(%5919) : (i64) -> ()
      %5923 = llvm.mlir.addressof @str530 : !llvm.ptr
      %5924 = arith.constant 2 : i64
      %5925 = func.call @cc_make_string(%5923, %5924) : (!llvm.ptr, i64) -> i64
      %5926 = llvm.mlir.addressof @str531 : !llvm.ptr
      %5927 = arith.constant 11 : i64
      %5928 = func.call @cc_make_string(%5926, %5927) : (!llvm.ptr, i64) -> i64
      %5929 = func.call @cc_intern(%5925, %5928) : (i64, i64) -> i64
      %5930 = func.call @cc_nil_value() : () -> i64
      %5931 = func.call @cc_cons(%5929, %5930) : (i64, i64) -> i64
      %5932 = func.call @cc_values_pack(%5931) : (i64) -> i64
      func.call @stack_push_pointer(%5929) : (i64) -> ()
      %5933 = llvm.mlir.addressof @str532 : !llvm.ptr
      %5934 = arith.constant 3 : i64
      %5935 = func.call @cc_make_string(%5933, %5934) : (!llvm.ptr, i64) -> i64
      %5936 = llvm.mlir.addressof @str533 : !llvm.ptr
      %5937 = arith.constant 11 : i64
      %5938 = func.call @cc_make_string(%5936, %5937) : (!llvm.ptr, i64) -> i64
      %5939 = func.call @cc_intern(%5935, %5938) : (i64, i64) -> i64
      %5940 = func.call @cc_nil_value() : () -> i64
      %5941 = func.call @cc_cons(%5939, %5940) : (i64, i64) -> i64
      %5942 = func.call @cc_values_pack(%5941) : (i64) -> i64
      func.call @stack_push_pointer(%5939) : (i64) -> ()
      %5943 = llvm.mlir.addressof @str534 : !llvm.ptr
      %5944 = arith.constant 2 : i64
      %5945 = func.call @cc_make_string(%5943, %5944) : (!llvm.ptr, i64) -> i64
      %5946 = llvm.mlir.addressof @str535 : !llvm.ptr
      %5947 = arith.constant 11 : i64
      %5948 = func.call @cc_make_string(%5946, %5947) : (!llvm.ptr, i64) -> i64
      %5949 = func.call @cc_intern(%5945, %5948) : (i64, i64) -> i64
      %5950 = func.call @cc_nil_value() : () -> i64
      %5951 = func.call @cc_cons(%5949, %5950) : (i64, i64) -> i64
      %5952 = func.call @cc_values_pack(%5951) : (i64) -> i64
      func.call @stack_push_pointer(%5949) : (i64) -> ()
      %5953 = llvm.mlir.addressof @str536 : !llvm.ptr
      %5954 = arith.constant 3 : i64
      %5955 = func.call @cc_make_string(%5953, %5954) : (!llvm.ptr, i64) -> i64
      %5956 = llvm.mlir.addressof @str537 : !llvm.ptr
      %5957 = arith.constant 11 : i64
      %5958 = func.call @cc_make_string(%5956, %5957) : (!llvm.ptr, i64) -> i64
      %5959 = func.call @cc_intern(%5955, %5958) : (i64, i64) -> i64
      %5960 = func.call @cc_nil_value() : () -> i64
      %5961 = func.call @cc_cons(%5959, %5960) : (i64, i64) -> i64
      %5962 = func.call @cc_values_pack(%5961) : (i64) -> i64
      func.call @stack_push_pointer(%5959) : (i64) -> ()
      %5963 = llvm.mlir.addressof @str538 : !llvm.ptr
      %5964 = arith.constant 16 : i64
      %5965 = func.call @cc_make_string(%5963, %5964) : (!llvm.ptr, i64) -> i64
      %5966 = llvm.mlir.addressof @str539 : !llvm.ptr
      %5967 = arith.constant 11 : i64
      %5968 = func.call @cc_make_string(%5966, %5967) : (!llvm.ptr, i64) -> i64
      %5969 = func.call @cc_intern(%5965, %5968) : (i64, i64) -> i64
      %5970 = func.call @cc_nil_value() : () -> i64
      %5971 = func.call @cc_cons(%5969, %5970) : (i64, i64) -> i64
      %5972 = func.call @cc_values_pack(%5971) : (i64) -> i64
      func.call @stack_push_pointer(%5969) : (i64) -> ()
      %5973 = llvm.mlir.addressof @str540 : !llvm.ptr
      %5974 = arith.constant 5 : i64
      %5975 = func.call @cc_make_string(%5973, %5974) : (!llvm.ptr, i64) -> i64
      %5976 = llvm.mlir.addressof @str541 : !llvm.ptr
      %5977 = arith.constant 11 : i64
      %5978 = func.call @cc_make_string(%5976, %5977) : (!llvm.ptr, i64) -> i64
      %5979 = func.call @cc_intern(%5975, %5978) : (i64, i64) -> i64
      %5980 = func.call @cc_nil_value() : () -> i64
      %5981 = func.call @cc_cons(%5979, %5980) : (i64, i64) -> i64
      %5982 = func.call @cc_values_pack(%5981) : (i64) -> i64
      func.call @stack_push_pointer(%5979) : (i64) -> ()
      %5983 = llvm.mlir.addressof @str542 : !llvm.ptr
      %5984 = arith.constant 21 : i64
      %5985 = func.call @cc_make_string(%5983, %5984) : (!llvm.ptr, i64) -> i64
      %5986 = llvm.mlir.addressof @str543 : !llvm.ptr
      %5987 = arith.constant 11 : i64
      %5988 = func.call @cc_make_string(%5986, %5987) : (!llvm.ptr, i64) -> i64
      %5989 = func.call @cc_intern(%5985, %5988) : (i64, i64) -> i64
      %5990 = func.call @cc_nil_value() : () -> i64
      %5991 = func.call @cc_cons(%5989, %5990) : (i64, i64) -> i64
      %5992 = func.call @cc_values_pack(%5991) : (i64) -> i64
      func.call @stack_push_pointer(%5989) : (i64) -> ()
      %5993 = llvm.mlir.addressof @str544 : !llvm.ptr
      %5994 = arith.constant 16 : i64
      %5995 = func.call @cc_make_string(%5993, %5994) : (!llvm.ptr, i64) -> i64
      %5996 = llvm.mlir.addressof @str545 : !llvm.ptr
      %5997 = arith.constant 11 : i64
      %5998 = func.call @cc_make_string(%5996, %5997) : (!llvm.ptr, i64) -> i64
      %5999 = func.call @cc_intern(%5995, %5998) : (i64, i64) -> i64
      %6000 = func.call @cc_nil_value() : () -> i64
      %6001 = func.call @cc_cons(%5999, %6000) : (i64, i64) -> i64
      %6002 = func.call @cc_values_pack(%6001) : (i64) -> i64
      func.call @stack_push_pointer(%5999) : (i64) -> ()
      %6003 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6004 = arith.constant 22 : i64
      %6005 = func.call @cc_make_string(%6003, %6004) : (!llvm.ptr, i64) -> i64
      %6006 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6007 = arith.constant 11 : i64
      %6008 = func.call @cc_make_string(%6006, %6007) : (!llvm.ptr, i64) -> i64
      %6009 = func.call @cc_intern(%6005, %6008) : (i64, i64) -> i64
      %6010 = func.call @cc_nil_value() : () -> i64
      %6011 = func.call @cc_cons(%6009, %6010) : (i64, i64) -> i64
      %6012 = func.call @cc_values_pack(%6011) : (i64) -> i64
      func.call @stack_push_pointer(%6009) : (i64) -> ()
      %6013 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6014 = arith.constant 9 : i64
      %6015 = func.call @cc_make_string(%6013, %6014) : (!llvm.ptr, i64) -> i64
      %6016 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6017 = arith.constant 11 : i64
      %6018 = func.call @cc_make_string(%6016, %6017) : (!llvm.ptr, i64) -> i64
      %6019 = func.call @cc_intern(%6015, %6018) : (i64, i64) -> i64
      %6020 = func.call @cc_nil_value() : () -> i64
      %6021 = func.call @cc_cons(%6019, %6020) : (i64, i64) -> i64
      %6022 = func.call @cc_values_pack(%6021) : (i64) -> i64
      func.call @stack_push_pointer(%6019) : (i64) -> ()
      %6023 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6024 = arith.constant 11 : i64
      %6025 = func.call @cc_make_string(%6023, %6024) : (!llvm.ptr, i64) -> i64
      %6026 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6027 = arith.constant 11 : i64
      %6028 = func.call @cc_make_string(%6026, %6027) : (!llvm.ptr, i64) -> i64
      %6029 = func.call @cc_intern(%6025, %6028) : (i64, i64) -> i64
      %6030 = func.call @cc_nil_value() : () -> i64
      %6031 = func.call @cc_cons(%6029, %6030) : (i64, i64) -> i64
      %6032 = func.call @cc_values_pack(%6031) : (i64) -> i64
      func.call @stack_push_pointer(%6029) : (i64) -> ()
      %6033 = llvm.mlir.addressof @str552 : !llvm.ptr
      %6034 = arith.constant 6 : i64
      %6035 = func.call @cc_make_string(%6033, %6034) : (!llvm.ptr, i64) -> i64
      %6036 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6037 = arith.constant 11 : i64
      %6038 = func.call @cc_make_string(%6036, %6037) : (!llvm.ptr, i64) -> i64
      %6039 = func.call @cc_intern(%6035, %6038) : (i64, i64) -> i64
      %6040 = func.call @cc_nil_value() : () -> i64
      %6041 = func.call @cc_cons(%6039, %6040) : (i64, i64) -> i64
      %6042 = func.call @cc_values_pack(%6041) : (i64) -> i64
      func.call @stack_push_pointer(%6039) : (i64) -> ()
      %6043 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6044 = arith.constant 10 : i64
      %6045 = func.call @cc_make_string(%6043, %6044) : (!llvm.ptr, i64) -> i64
      %6046 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6047 = arith.constant 11 : i64
      %6048 = func.call @cc_make_string(%6046, %6047) : (!llvm.ptr, i64) -> i64
      %6049 = func.call @cc_intern(%6045, %6048) : (i64, i64) -> i64
      %6050 = func.call @cc_nil_value() : () -> i64
      %6051 = func.call @cc_cons(%6049, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_values_pack(%6051) : (i64) -> i64
      func.call @stack_push_pointer(%6049) : (i64) -> ()
      %6053 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6054 = arith.constant 7 : i64
      %6055 = func.call @cc_make_string(%6053, %6054) : (!llvm.ptr, i64) -> i64
      %6056 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6057 = arith.constant 11 : i64
      %6058 = func.call @cc_make_string(%6056, %6057) : (!llvm.ptr, i64) -> i64
      %6059 = func.call @cc_intern(%6055, %6058) : (i64, i64) -> i64
      %6060 = func.call @cc_nil_value() : () -> i64
      %6061 = func.call @cc_cons(%6059, %6060) : (i64, i64) -> i64
      %6062 = func.call @cc_values_pack(%6061) : (i64) -> i64
      func.call @stack_push_pointer(%6059) : (i64) -> ()
      %6063 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6064 = arith.constant 7 : i64
      %6065 = func.call @cc_make_string(%6063, %6064) : (!llvm.ptr, i64) -> i64
      %6066 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6067 = arith.constant 11 : i64
      %6068 = func.call @cc_make_string(%6066, %6067) : (!llvm.ptr, i64) -> i64
      %6069 = func.call @cc_intern(%6065, %6068) : (i64, i64) -> i64
      %6070 = func.call @cc_nil_value() : () -> i64
      %6071 = func.call @cc_cons(%6069, %6070) : (i64, i64) -> i64
      %6072 = func.call @cc_values_pack(%6071) : (i64) -> i64
      func.call @stack_push_pointer(%6069) : (i64) -> ()
      %6073 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6074 = arith.constant 9 : i64
      %6075 = func.call @cc_make_string(%6073, %6074) : (!llvm.ptr, i64) -> i64
      %6076 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6077 = arith.constant 11 : i64
      %6078 = func.call @cc_make_string(%6076, %6077) : (!llvm.ptr, i64) -> i64
      %6079 = func.call @cc_intern(%6075, %6078) : (i64, i64) -> i64
      %6080 = func.call @cc_nil_value() : () -> i64
      %6081 = func.call @cc_cons(%6079, %6080) : (i64, i64) -> i64
      %6082 = func.call @cc_values_pack(%6081) : (i64) -> i64
      func.call @stack_push_pointer(%6079) : (i64) -> ()
      %6083 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6084 = arith.constant 11 : i64
      %6085 = func.call @cc_make_string(%6083, %6084) : (!llvm.ptr, i64) -> i64
      %6086 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6087 = arith.constant 11 : i64
      %6088 = func.call @cc_make_string(%6086, %6087) : (!llvm.ptr, i64) -> i64
      %6089 = func.call @cc_intern(%6085, %6088) : (i64, i64) -> i64
      %6090 = func.call @cc_nil_value() : () -> i64
      %6091 = func.call @cc_cons(%6089, %6090) : (i64, i64) -> i64
      %6092 = func.call @cc_values_pack(%6091) : (i64) -> i64
      func.call @stack_push_pointer(%6089) : (i64) -> ()
      %6093 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6094 = arith.constant 11 : i64
      %6095 = func.call @cc_make_string(%6093, %6094) : (!llvm.ptr, i64) -> i64
      %6096 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6097 = arith.constant 11 : i64
      %6098 = func.call @cc_make_string(%6096, %6097) : (!llvm.ptr, i64) -> i64
      %6099 = func.call @cc_intern(%6095, %6098) : (i64, i64) -> i64
      %6100 = func.call @cc_nil_value() : () -> i64
      %6101 = func.call @cc_cons(%6099, %6100) : (i64, i64) -> i64
      %6102 = func.call @cc_values_pack(%6101) : (i64) -> i64
      func.call @stack_push_pointer(%6099) : (i64) -> ()
      %6103 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6104 = arith.constant 8 : i64
      %6105 = func.call @cc_make_string(%6103, %6104) : (!llvm.ptr, i64) -> i64
      %6106 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6107 = arith.constant 11 : i64
      %6108 = func.call @cc_make_string(%6106, %6107) : (!llvm.ptr, i64) -> i64
      %6109 = func.call @cc_intern(%6105, %6108) : (i64, i64) -> i64
      %6110 = func.call @cc_nil_value() : () -> i64
      %6111 = func.call @cc_cons(%6109, %6110) : (i64, i64) -> i64
      %6112 = func.call @cc_values_pack(%6111) : (i64) -> i64
      func.call @stack_push_pointer(%6109) : (i64) -> ()
      %6113 = llvm.mlir.addressof @str568 : !llvm.ptr
      %6114 = arith.constant 8 : i64
      %6115 = func.call @cc_make_string(%6113, %6114) : (!llvm.ptr, i64) -> i64
      %6116 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6117 = arith.constant 11 : i64
      %6118 = func.call @cc_make_string(%6116, %6117) : (!llvm.ptr, i64) -> i64
      %6119 = func.call @cc_intern(%6115, %6118) : (i64, i64) -> i64
      %6120 = func.call @cc_nil_value() : () -> i64
      %6121 = func.call @cc_cons(%6119, %6120) : (i64, i64) -> i64
      %6122 = func.call @cc_values_pack(%6121) : (i64) -> i64
      func.call @stack_push_pointer(%6119) : (i64) -> ()
      %6123 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6124 = arith.constant 9 : i64
      %6125 = func.call @cc_make_string(%6123, %6124) : (!llvm.ptr, i64) -> i64
      %6126 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6127 = arith.constant 11 : i64
      %6128 = func.call @cc_make_string(%6126, %6127) : (!llvm.ptr, i64) -> i64
      %6129 = func.call @cc_intern(%6125, %6128) : (i64, i64) -> i64
      %6130 = func.call @cc_nil_value() : () -> i64
      %6131 = func.call @cc_cons(%6129, %6130) : (i64, i64) -> i64
      %6132 = func.call @cc_values_pack(%6131) : (i64) -> i64
      func.call @stack_push_pointer(%6129) : (i64) -> ()
      %6133 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6134 = arith.constant 9 : i64
      %6135 = func.call @cc_make_string(%6133, %6134) : (!llvm.ptr, i64) -> i64
      %6136 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6137 = arith.constant 11 : i64
      %6138 = func.call @cc_make_string(%6136, %6137) : (!llvm.ptr, i64) -> i64
      %6139 = func.call @cc_intern(%6135, %6138) : (i64, i64) -> i64
      %6140 = func.call @cc_nil_value() : () -> i64
      %6141 = func.call @cc_cons(%6139, %6140) : (i64, i64) -> i64
      %6142 = func.call @cc_values_pack(%6141) : (i64) -> i64
      func.call @stack_push_pointer(%6139) : (i64) -> ()
      %6143 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6144 = arith.constant 9 : i64
      %6145 = func.call @cc_make_string(%6143, %6144) : (!llvm.ptr, i64) -> i64
      %6146 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6147 = arith.constant 11 : i64
      %6148 = func.call @cc_make_string(%6146, %6147) : (!llvm.ptr, i64) -> i64
      %6149 = func.call @cc_intern(%6145, %6148) : (i64, i64) -> i64
      %6150 = func.call @cc_nil_value() : () -> i64
      %6151 = func.call @cc_cons(%6149, %6150) : (i64, i64) -> i64
      %6152 = func.call @cc_values_pack(%6151) : (i64) -> i64
      func.call @stack_push_pointer(%6149) : (i64) -> ()
      %6153 = llvm.mlir.addressof @str576 : !llvm.ptr
      %6154 = arith.constant 10 : i64
      %6155 = func.call @cc_make_string(%6153, %6154) : (!llvm.ptr, i64) -> i64
      %6156 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6157 = arith.constant 11 : i64
      %6158 = func.call @cc_make_string(%6156, %6157) : (!llvm.ptr, i64) -> i64
      %6159 = func.call @cc_intern(%6155, %6158) : (i64, i64) -> i64
      %6160 = func.call @cc_nil_value() : () -> i64
      %6161 = func.call @cc_cons(%6159, %6160) : (i64, i64) -> i64
      %6162 = func.call @cc_values_pack(%6161) : (i64) -> i64
      func.call @stack_push_pointer(%6159) : (i64) -> ()
      %6163 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6164 = arith.constant 9 : i64
      %6165 = func.call @cc_make_string(%6163, %6164) : (!llvm.ptr, i64) -> i64
      %6166 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6167 = arith.constant 11 : i64
      %6168 = func.call @cc_make_string(%6166, %6167) : (!llvm.ptr, i64) -> i64
      %6169 = func.call @cc_intern(%6165, %6168) : (i64, i64) -> i64
      %6170 = func.call @cc_nil_value() : () -> i64
      %6171 = func.call @cc_cons(%6169, %6170) : (i64, i64) -> i64
      %6172 = func.call @cc_values_pack(%6171) : (i64) -> i64
      func.call @stack_push_pointer(%6169) : (i64) -> ()
      %6173 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6174 = arith.constant 10 : i64
      %6175 = func.call @cc_make_string(%6173, %6174) : (!llvm.ptr, i64) -> i64
      %6176 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6177 = arith.constant 11 : i64
      %6178 = func.call @cc_make_string(%6176, %6177) : (!llvm.ptr, i64) -> i64
      %6179 = func.call @cc_intern(%6175, %6178) : (i64, i64) -> i64
      %6180 = func.call @cc_nil_value() : () -> i64
      %6181 = func.call @cc_cons(%6179, %6180) : (i64, i64) -> i64
      %6182 = func.call @cc_values_pack(%6181) : (i64) -> i64
      func.call @stack_push_pointer(%6179) : (i64) -> ()
      %6183 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6184 = arith.constant 10 : i64
      %6185 = func.call @cc_make_string(%6183, %6184) : (!llvm.ptr, i64) -> i64
      %6186 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6187 = arith.constant 11 : i64
      %6188 = func.call @cc_make_string(%6186, %6187) : (!llvm.ptr, i64) -> i64
      %6189 = func.call @cc_intern(%6185, %6188) : (i64, i64) -> i64
      %6190 = func.call @cc_nil_value() : () -> i64
      %6191 = func.call @cc_cons(%6189, %6190) : (i64, i64) -> i64
      %6192 = func.call @cc_values_pack(%6191) : (i64) -> i64
      func.call @stack_push_pointer(%6189) : (i64) -> ()
      %6193 = llvm.mlir.addressof @str584 : !llvm.ptr
      %6194 = arith.constant 9 : i64
      %6195 = func.call @cc_make_string(%6193, %6194) : (!llvm.ptr, i64) -> i64
      %6196 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6197 = arith.constant 11 : i64
      %6198 = func.call @cc_make_string(%6196, %6197) : (!llvm.ptr, i64) -> i64
      %6199 = func.call @cc_intern(%6195, %6198) : (i64, i64) -> i64
      %6200 = func.call @cc_nil_value() : () -> i64
      %6201 = func.call @cc_cons(%6199, %6200) : (i64, i64) -> i64
      %6202 = func.call @cc_values_pack(%6201) : (i64) -> i64
      func.call @stack_push_pointer(%6199) : (i64) -> ()
      %6203 = llvm.mlir.addressof @str586 : !llvm.ptr
      %6204 = arith.constant 9 : i64
      %6205 = func.call @cc_make_string(%6203, %6204) : (!llvm.ptr, i64) -> i64
      %6206 = llvm.mlir.addressof @str587 : !llvm.ptr
      %6207 = arith.constant 11 : i64
      %6208 = func.call @cc_make_string(%6206, %6207) : (!llvm.ptr, i64) -> i64
      %6209 = func.call @cc_intern(%6205, %6208) : (i64, i64) -> i64
      %6210 = func.call @cc_nil_value() : () -> i64
      %6211 = func.call @cc_cons(%6209, %6210) : (i64, i64) -> i64
      %6212 = func.call @cc_values_pack(%6211) : (i64) -> i64
      func.call @stack_push_pointer(%6209) : (i64) -> ()
      %6213 = llvm.mlir.addressof @str588 : !llvm.ptr
      %6214 = arith.constant 7 : i64
      %6215 = func.call @cc_make_string(%6213, %6214) : (!llvm.ptr, i64) -> i64
      %6216 = llvm.mlir.addressof @str589 : !llvm.ptr
      %6217 = arith.constant 11 : i64
      %6218 = func.call @cc_make_string(%6216, %6217) : (!llvm.ptr, i64) -> i64
      %6219 = func.call @cc_intern(%6215, %6218) : (i64, i64) -> i64
      %6220 = func.call @cc_nil_value() : () -> i64
      %6221 = func.call @cc_cons(%6219, %6220) : (i64, i64) -> i64
      %6222 = func.call @cc_values_pack(%6221) : (i64) -> i64
      func.call @stack_push_pointer(%6219) : (i64) -> ()
      %6223 = llvm.mlir.addressof @str590 : !llvm.ptr
      %6224 = arith.constant 16 : i64
      %6225 = func.call @cc_make_string(%6223, %6224) : (!llvm.ptr, i64) -> i64
      %6226 = llvm.mlir.addressof @str591 : !llvm.ptr
      %6227 = arith.constant 11 : i64
      %6228 = func.call @cc_make_string(%6226, %6227) : (!llvm.ptr, i64) -> i64
      %6229 = func.call @cc_intern(%6225, %6228) : (i64, i64) -> i64
      %6230 = func.call @cc_nil_value() : () -> i64
      %6231 = func.call @cc_cons(%6229, %6230) : (i64, i64) -> i64
      %6232 = func.call @cc_values_pack(%6231) : (i64) -> i64
      func.call @stack_push_pointer(%6229) : (i64) -> ()
      %6233 = llvm.mlir.addressof @str592 : !llvm.ptr
      %6234 = arith.constant 14 : i64
      %6235 = func.call @cc_make_string(%6233, %6234) : (!llvm.ptr, i64) -> i64
      %6236 = llvm.mlir.addressof @str593 : !llvm.ptr
      %6237 = arith.constant 11 : i64
      %6238 = func.call @cc_make_string(%6236, %6237) : (!llvm.ptr, i64) -> i64
      %6239 = func.call @cc_intern(%6235, %6238) : (i64, i64) -> i64
      %6240 = func.call @cc_nil_value() : () -> i64
      %6241 = func.call @cc_cons(%6239, %6240) : (i64, i64) -> i64
      %6242 = func.call @cc_values_pack(%6241) : (i64) -> i64
      func.call @stack_push_pointer(%6239) : (i64) -> ()
      %6243 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6244 = arith.constant 20 : i64
      %6245 = func.call @cc_make_string(%6243, %6244) : (!llvm.ptr, i64) -> i64
      %6246 = llvm.mlir.addressof @str595 : !llvm.ptr
      %6247 = arith.constant 11 : i64
      %6248 = func.call @cc_make_string(%6246, %6247) : (!llvm.ptr, i64) -> i64
      %6249 = func.call @cc_intern(%6245, %6248) : (i64, i64) -> i64
      %6250 = func.call @cc_nil_value() : () -> i64
      %6251 = func.call @cc_cons(%6249, %6250) : (i64, i64) -> i64
      %6252 = func.call @cc_values_pack(%6251) : (i64) -> i64
      func.call @stack_push_pointer(%6249) : (i64) -> ()
      %6253 = llvm.mlir.addressof @str596 : !llvm.ptr
      %6254 = arith.constant 10 : i64
      %6255 = func.call @cc_make_string(%6253, %6254) : (!llvm.ptr, i64) -> i64
      %6256 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6257 = arith.constant 11 : i64
      %6258 = func.call @cc_make_string(%6256, %6257) : (!llvm.ptr, i64) -> i64
      %6259 = func.call @cc_intern(%6255, %6258) : (i64, i64) -> i64
      %6260 = func.call @cc_nil_value() : () -> i64
      %6261 = func.call @cc_cons(%6259, %6260) : (i64, i64) -> i64
      %6262 = func.call @cc_values_pack(%6261) : (i64) -> i64
      func.call @stack_push_pointer(%6259) : (i64) -> ()
      %6263 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6264 = arith.constant 15 : i64
      %6265 = func.call @cc_make_string(%6263, %6264) : (!llvm.ptr, i64) -> i64
      %6266 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6267 = arith.constant 11 : i64
      %6268 = func.call @cc_make_string(%6266, %6267) : (!llvm.ptr, i64) -> i64
      %6269 = func.call @cc_intern(%6265, %6268) : (i64, i64) -> i64
      %6270 = func.call @cc_nil_value() : () -> i64
      %6271 = func.call @cc_cons(%6269, %6270) : (i64, i64) -> i64
      %6272 = func.call @cc_values_pack(%6271) : (i64) -> i64
      func.call @stack_push_pointer(%6269) : (i64) -> ()
      %6273 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6274 = arith.constant 5 : i64
      %6275 = func.call @cc_make_string(%6273, %6274) : (!llvm.ptr, i64) -> i64
      %6276 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6277 = arith.constant 11 : i64
      %6278 = func.call @cc_make_string(%6276, %6277) : (!llvm.ptr, i64) -> i64
      %6279 = func.call @cc_intern(%6275, %6278) : (i64, i64) -> i64
      %6280 = func.call @cc_nil_value() : () -> i64
      %6281 = func.call @cc_cons(%6279, %6280) : (i64, i64) -> i64
      %6282 = func.call @cc_values_pack(%6281) : (i64) -> i64
      func.call @stack_push_pointer(%6279) : (i64) -> ()
      %6283 = llvm.mlir.addressof @str602 : !llvm.ptr
      %6284 = arith.constant 17 : i64
      %6285 = func.call @cc_make_string(%6283, %6284) : (!llvm.ptr, i64) -> i64
      %6286 = llvm.mlir.addressof @str603 : !llvm.ptr
      %6287 = arith.constant 11 : i64
      %6288 = func.call @cc_make_string(%6286, %6287) : (!llvm.ptr, i64) -> i64
      %6289 = func.call @cc_intern(%6285, %6288) : (i64, i64) -> i64
      %6290 = func.call @cc_nil_value() : () -> i64
      %6291 = func.call @cc_cons(%6289, %6290) : (i64, i64) -> i64
      %6292 = func.call @cc_values_pack(%6291) : (i64) -> i64
      func.call @stack_push_pointer(%6289) : (i64) -> ()
      %6293 = llvm.mlir.addressof @str604 : !llvm.ptr
      %6294 = arith.constant 17 : i64
      %6295 = func.call @cc_make_string(%6293, %6294) : (!llvm.ptr, i64) -> i64
      %6296 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6297 = arith.constant 11 : i64
      %6298 = func.call @cc_make_string(%6296, %6297) : (!llvm.ptr, i64) -> i64
      %6299 = func.call @cc_intern(%6295, %6298) : (i64, i64) -> i64
      %6300 = func.call @cc_nil_value() : () -> i64
      %6301 = func.call @cc_cons(%6299, %6300) : (i64, i64) -> i64
      %6302 = func.call @cc_values_pack(%6301) : (i64) -> i64
      func.call @stack_push_pointer(%6299) : (i64) -> ()
      %6303 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6304 = arith.constant 14 : i64
      %6305 = func.call @cc_make_string(%6303, %6304) : (!llvm.ptr, i64) -> i64
      %6306 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6307 = arith.constant 11 : i64
      %6308 = func.call @cc_make_string(%6306, %6307) : (!llvm.ptr, i64) -> i64
      %6309 = func.call @cc_intern(%6305, %6308) : (i64, i64) -> i64
      %6310 = func.call @cc_nil_value() : () -> i64
      %6311 = func.call @cc_cons(%6309, %6310) : (i64, i64) -> i64
      %6312 = func.call @cc_values_pack(%6311) : (i64) -> i64
      func.call @stack_push_pointer(%6309) : (i64) -> ()
      %6313 = llvm.mlir.addressof @str608 : !llvm.ptr
      %6314 = arith.constant 19 : i64
      %6315 = func.call @cc_make_string(%6313, %6314) : (!llvm.ptr, i64) -> i64
      %6316 = llvm.mlir.addressof @str609 : !llvm.ptr
      %6317 = arith.constant 11 : i64
      %6318 = func.call @cc_make_string(%6316, %6317) : (!llvm.ptr, i64) -> i64
      %6319 = func.call @cc_intern(%6315, %6318) : (i64, i64) -> i64
      %6320 = func.call @cc_nil_value() : () -> i64
      %6321 = func.call @cc_cons(%6319, %6320) : (i64, i64) -> i64
      %6322 = func.call @cc_values_pack(%6321) : (i64) -> i64
      func.call @stack_push_pointer(%6319) : (i64) -> ()
      %6323 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6324 = arith.constant 9 : i64
      %6325 = func.call @cc_make_string(%6323, %6324) : (!llvm.ptr, i64) -> i64
      %6326 = llvm.mlir.addressof @str611 : !llvm.ptr
      %6327 = arith.constant 11 : i64
      %6328 = func.call @cc_make_string(%6326, %6327) : (!llvm.ptr, i64) -> i64
      %6329 = func.call @cc_intern(%6325, %6328) : (i64, i64) -> i64
      %6330 = func.call @cc_nil_value() : () -> i64
      %6331 = func.call @cc_cons(%6329, %6330) : (i64, i64) -> i64
      %6332 = func.call @cc_values_pack(%6331) : (i64) -> i64
      func.call @stack_push_pointer(%6329) : (i64) -> ()
      %6333 = llvm.mlir.addressof @str612 : !llvm.ptr
      %6334 = arith.constant 13 : i64
      %6335 = func.call @cc_make_string(%6333, %6334) : (!llvm.ptr, i64) -> i64
      %6336 = llvm.mlir.addressof @str613 : !llvm.ptr
      %6337 = arith.constant 11 : i64
      %6338 = func.call @cc_make_string(%6336, %6337) : (!llvm.ptr, i64) -> i64
      %6339 = func.call @cc_intern(%6335, %6338) : (i64, i64) -> i64
      %6340 = func.call @cc_nil_value() : () -> i64
      %6341 = func.call @cc_cons(%6339, %6340) : (i64, i64) -> i64
      %6342 = func.call @cc_values_pack(%6341) : (i64) -> i64
      func.call @stack_push_pointer(%6339) : (i64) -> ()
      %6343 = llvm.mlir.addressof @str614 : !llvm.ptr
      %6344 = arith.constant 5 : i64
      %6345 = func.call @cc_make_string(%6343, %6344) : (!llvm.ptr, i64) -> i64
      %6346 = llvm.mlir.addressof @str615 : !llvm.ptr
      %6347 = arith.constant 11 : i64
      %6348 = func.call @cc_make_string(%6346, %6347) : (!llvm.ptr, i64) -> i64
      %6349 = func.call @cc_intern(%6345, %6348) : (i64, i64) -> i64
      %6350 = func.call @cc_nil_value() : () -> i64
      %6351 = func.call @cc_cons(%6349, %6350) : (i64, i64) -> i64
      %6352 = func.call @cc_values_pack(%6351) : (i64) -> i64
      func.call @stack_push_pointer(%6349) : (i64) -> ()
      %6353 = llvm.mlir.addressof @str616 : !llvm.ptr
      %6354 = arith.constant 11 : i64
      %6355 = func.call @cc_make_string(%6353, %6354) : (!llvm.ptr, i64) -> i64
      %6356 = llvm.mlir.addressof @str617 : !llvm.ptr
      %6357 = arith.constant 11 : i64
      %6358 = func.call @cc_make_string(%6356, %6357) : (!llvm.ptr, i64) -> i64
      %6359 = func.call @cc_intern(%6355, %6358) : (i64, i64) -> i64
      %6360 = func.call @cc_nil_value() : () -> i64
      %6361 = func.call @cc_cons(%6359, %6360) : (i64, i64) -> i64
      %6362 = func.call @cc_values_pack(%6361) : (i64) -> i64
      func.call @stack_push_pointer(%6359) : (i64) -> ()
      %6363 = llvm.mlir.addressof @str618 : !llvm.ptr
      %6364 = arith.constant 16 : i64
      %6365 = func.call @cc_make_string(%6363, %6364) : (!llvm.ptr, i64) -> i64
      %6366 = llvm.mlir.addressof @str619 : !llvm.ptr
      %6367 = arith.constant 11 : i64
      %6368 = func.call @cc_make_string(%6366, %6367) : (!llvm.ptr, i64) -> i64
      %6369 = func.call @cc_intern(%6365, %6368) : (i64, i64) -> i64
      %6370 = func.call @cc_nil_value() : () -> i64
      %6371 = func.call @cc_cons(%6369, %6370) : (i64, i64) -> i64
      %6372 = func.call @cc_values_pack(%6371) : (i64) -> i64
      func.call @stack_push_pointer(%6369) : (i64) -> ()
      %6373 = llvm.mlir.addressof @str620 : !llvm.ptr
      %6374 = arith.constant 12 : i64
      %6375 = func.call @cc_make_string(%6373, %6374) : (!llvm.ptr, i64) -> i64
      %6376 = llvm.mlir.addressof @str621 : !llvm.ptr
      %6377 = arith.constant 11 : i64
      %6378 = func.call @cc_make_string(%6376, %6377) : (!llvm.ptr, i64) -> i64
      %6379 = func.call @cc_intern(%6375, %6378) : (i64, i64) -> i64
      %6380 = func.call @cc_nil_value() : () -> i64
      %6381 = func.call @cc_cons(%6379, %6380) : (i64, i64) -> i64
      %6382 = func.call @cc_values_pack(%6381) : (i64) -> i64
      func.call @stack_push_pointer(%6379) : (i64) -> ()
      %6383 = llvm.mlir.addressof @str622 : !llvm.ptr
      %6384 = arith.constant 20 : i64
      %6385 = func.call @cc_make_string(%6383, %6384) : (!llvm.ptr, i64) -> i64
      %6386 = llvm.mlir.addressof @str623 : !llvm.ptr
      %6387 = arith.constant 11 : i64
      %6388 = func.call @cc_make_string(%6386, %6387) : (!llvm.ptr, i64) -> i64
      %6389 = func.call @cc_intern(%6385, %6388) : (i64, i64) -> i64
      %6390 = func.call @cc_nil_value() : () -> i64
      %6391 = func.call @cc_cons(%6389, %6390) : (i64, i64) -> i64
      %6392 = func.call @cc_values_pack(%6391) : (i64) -> i64
      func.call @stack_push_pointer(%6389) : (i64) -> ()
      %6393 = llvm.mlir.addressof @str624 : !llvm.ptr
      %6394 = arith.constant 29 : i64
      %6395 = func.call @cc_make_string(%6393, %6394) : (!llvm.ptr, i64) -> i64
      %6396 = llvm.mlir.addressof @str625 : !llvm.ptr
      %6397 = arith.constant 11 : i64
      %6398 = func.call @cc_make_string(%6396, %6397) : (!llvm.ptr, i64) -> i64
      %6399 = func.call @cc_intern(%6395, %6398) : (i64, i64) -> i64
      %6400 = func.call @cc_nil_value() : () -> i64
      %6401 = func.call @cc_cons(%6399, %6400) : (i64, i64) -> i64
      %6402 = func.call @cc_values_pack(%6401) : (i64) -> i64
      func.call @stack_push_pointer(%6399) : (i64) -> ()
      %6403 = llvm.mlir.addressof @str626 : !llvm.ptr
      %6404 = arith.constant 14 : i64
      %6405 = func.call @cc_make_string(%6403, %6404) : (!llvm.ptr, i64) -> i64
      %6406 = llvm.mlir.addressof @str627 : !llvm.ptr
      %6407 = arith.constant 11 : i64
      %6408 = func.call @cc_make_string(%6406, %6407) : (!llvm.ptr, i64) -> i64
      %6409 = func.call @cc_intern(%6405, %6408) : (i64, i64) -> i64
      %6410 = func.call @cc_nil_value() : () -> i64
      %6411 = func.call @cc_cons(%6409, %6410) : (i64, i64) -> i64
      %6412 = func.call @cc_values_pack(%6411) : (i64) -> i64
      func.call @stack_push_pointer(%6409) : (i64) -> ()
      %6413 = llvm.mlir.addressof @str628 : !llvm.ptr
      %6414 = arith.constant 11 : i64
      %6415 = func.call @cc_make_string(%6413, %6414) : (!llvm.ptr, i64) -> i64
      %6416 = llvm.mlir.addressof @str629 : !llvm.ptr
      %6417 = arith.constant 11 : i64
      %6418 = func.call @cc_make_string(%6416, %6417) : (!llvm.ptr, i64) -> i64
      %6419 = func.call @cc_intern(%6415, %6418) : (i64, i64) -> i64
      %6420 = func.call @cc_nil_value() : () -> i64
      %6421 = func.call @cc_cons(%6419, %6420) : (i64, i64) -> i64
      %6422 = func.call @cc_values_pack(%6421) : (i64) -> i64
      func.call @stack_push_pointer(%6419) : (i64) -> ()
      %6423 = llvm.mlir.addressof @str630 : !llvm.ptr
      %6424 = arith.constant 11 : i64
      %6425 = func.call @cc_make_string(%6423, %6424) : (!llvm.ptr, i64) -> i64
      %6426 = llvm.mlir.addressof @str631 : !llvm.ptr
      %6427 = arith.constant 11 : i64
      %6428 = func.call @cc_make_string(%6426, %6427) : (!llvm.ptr, i64) -> i64
      %6429 = func.call @cc_intern(%6425, %6428) : (i64, i64) -> i64
      %6430 = func.call @cc_nil_value() : () -> i64
      %6431 = func.call @cc_cons(%6429, %6430) : (i64, i64) -> i64
      %6432 = func.call @cc_values_pack(%6431) : (i64) -> i64
      func.call @stack_push_pointer(%6429) : (i64) -> ()
      %6433 = llvm.mlir.addressof @str632 : !llvm.ptr
      %6434 = arith.constant 13 : i64
      %6435 = func.call @cc_make_string(%6433, %6434) : (!llvm.ptr, i64) -> i64
      %6436 = llvm.mlir.addressof @str633 : !llvm.ptr
      %6437 = arith.constant 11 : i64
      %6438 = func.call @cc_make_string(%6436, %6437) : (!llvm.ptr, i64) -> i64
      %6439 = func.call @cc_intern(%6435, %6438) : (i64, i64) -> i64
      %6440 = func.call @cc_nil_value() : () -> i64
      %6441 = func.call @cc_cons(%6439, %6440) : (i64, i64) -> i64
      %6442 = func.call @cc_values_pack(%6441) : (i64) -> i64
      func.call @stack_push_pointer(%6439) : (i64) -> ()
      %6443 = llvm.mlir.addressof @str634 : !llvm.ptr
      %6444 = arith.constant 10 : i64
      %6445 = func.call @cc_make_string(%6443, %6444) : (!llvm.ptr, i64) -> i64
      %6446 = llvm.mlir.addressof @str635 : !llvm.ptr
      %6447 = arith.constant 11 : i64
      %6448 = func.call @cc_make_string(%6446, %6447) : (!llvm.ptr, i64) -> i64
      %6449 = func.call @cc_intern(%6445, %6448) : (i64, i64) -> i64
      %6450 = func.call @cc_nil_value() : () -> i64
      %6451 = func.call @cc_cons(%6449, %6450) : (i64, i64) -> i64
      %6452 = func.call @cc_values_pack(%6451) : (i64) -> i64
      func.call @stack_push_pointer(%6449) : (i64) -> ()
      %6453 = llvm.mlir.addressof @str636 : !llvm.ptr
      %6454 = arith.constant 11 : i64
      %6455 = func.call @cc_make_string(%6453, %6454) : (!llvm.ptr, i64) -> i64
      %6456 = llvm.mlir.addressof @str637 : !llvm.ptr
      %6457 = arith.constant 11 : i64
      %6458 = func.call @cc_make_string(%6456, %6457) : (!llvm.ptr, i64) -> i64
      %6459 = func.call @cc_intern(%6455, %6458) : (i64, i64) -> i64
      %6460 = func.call @cc_nil_value() : () -> i64
      %6461 = func.call @cc_cons(%6459, %6460) : (i64, i64) -> i64
      %6462 = func.call @cc_values_pack(%6461) : (i64) -> i64
      func.call @stack_push_pointer(%6459) : (i64) -> ()
      %6463 = llvm.mlir.addressof @str638 : !llvm.ptr
      %6464 = arith.constant 6 : i64
      %6465 = func.call @cc_make_string(%6463, %6464) : (!llvm.ptr, i64) -> i64
      %6466 = llvm.mlir.addressof @str639 : !llvm.ptr
      %6467 = arith.constant 11 : i64
      %6468 = func.call @cc_make_string(%6466, %6467) : (!llvm.ptr, i64) -> i64
      %6469 = func.call @cc_intern(%6465, %6468) : (i64, i64) -> i64
      %6470 = func.call @cc_nil_value() : () -> i64
      %6471 = func.call @cc_cons(%6469, %6470) : (i64, i64) -> i64
      %6472 = func.call @cc_values_pack(%6471) : (i64) -> i64
      func.call @stack_push_pointer(%6469) : (i64) -> ()
      %6473 = llvm.mlir.addressof @str640 : !llvm.ptr
      %6474 = arith.constant 22 : i64
      %6475 = func.call @cc_make_string(%6473, %6474) : (!llvm.ptr, i64) -> i64
      %6476 = llvm.mlir.addressof @str641 : !llvm.ptr
      %6477 = arith.constant 11 : i64
      %6478 = func.call @cc_make_string(%6476, %6477) : (!llvm.ptr, i64) -> i64
      %6479 = func.call @cc_intern(%6475, %6478) : (i64, i64) -> i64
      %6480 = func.call @cc_nil_value() : () -> i64
      %6481 = func.call @cc_cons(%6479, %6480) : (i64, i64) -> i64
      %6482 = func.call @cc_values_pack(%6481) : (i64) -> i64
      func.call @stack_push_pointer(%6479) : (i64) -> ()
      %6483 = llvm.mlir.addressof @str642 : !llvm.ptr
      %6484 = arith.constant 32 : i64
      %6485 = func.call @cc_make_string(%6483, %6484) : (!llvm.ptr, i64) -> i64
      %6486 = llvm.mlir.addressof @str643 : !llvm.ptr
      %6487 = arith.constant 11 : i64
      %6488 = func.call @cc_make_string(%6486, %6487) : (!llvm.ptr, i64) -> i64
      %6489 = func.call @cc_intern(%6485, %6488) : (i64, i64) -> i64
      %6490 = func.call @cc_nil_value() : () -> i64
      %6491 = func.call @cc_cons(%6489, %6490) : (i64, i64) -> i64
      %6492 = func.call @cc_values_pack(%6491) : (i64) -> i64
      func.call @stack_push_pointer(%6489) : (i64) -> ()
      %6493 = llvm.mlir.addressof @str644 : !llvm.ptr
      %6494 = arith.constant 23 : i64
      %6495 = func.call @cc_make_string(%6493, %6494) : (!llvm.ptr, i64) -> i64
      %6496 = llvm.mlir.addressof @str645 : !llvm.ptr
      %6497 = arith.constant 11 : i64
      %6498 = func.call @cc_make_string(%6496, %6497) : (!llvm.ptr, i64) -> i64
      %6499 = func.call @cc_intern(%6495, %6498) : (i64, i64) -> i64
      %6500 = func.call @cc_nil_value() : () -> i64
      %6501 = func.call @cc_cons(%6499, %6500) : (i64, i64) -> i64
      %6502 = func.call @cc_values_pack(%6501) : (i64) -> i64
      func.call @stack_push_pointer(%6499) : (i64) -> ()
      %6503 = llvm.mlir.addressof @str646 : !llvm.ptr
      %6504 = arith.constant 24 : i64
      %6505 = func.call @cc_make_string(%6503, %6504) : (!llvm.ptr, i64) -> i64
      %6506 = llvm.mlir.addressof @str647 : !llvm.ptr
      %6507 = arith.constant 11 : i64
      %6508 = func.call @cc_make_string(%6506, %6507) : (!llvm.ptr, i64) -> i64
      %6509 = func.call @cc_intern(%6505, %6508) : (i64, i64) -> i64
      %6510 = func.call @cc_nil_value() : () -> i64
      %6511 = func.call @cc_cons(%6509, %6510) : (i64, i64) -> i64
      %6512 = func.call @cc_values_pack(%6511) : (i64) -> i64
      func.call @stack_push_pointer(%6509) : (i64) -> ()
      %6513 = llvm.mlir.addressof @str648 : !llvm.ptr
      %6514 = arith.constant 5 : i64
      %6515 = func.call @cc_make_string(%6513, %6514) : (!llvm.ptr, i64) -> i64
      %6516 = llvm.mlir.addressof @str649 : !llvm.ptr
      %6517 = arith.constant 11 : i64
      %6518 = func.call @cc_make_string(%6516, %6517) : (!llvm.ptr, i64) -> i64
      %6519 = func.call @cc_intern(%6515, %6518) : (i64, i64) -> i64
      %6520 = func.call @cc_nil_value() : () -> i64
      %6521 = func.call @cc_cons(%6519, %6520) : (i64, i64) -> i64
      %6522 = func.call @cc_values_pack(%6521) : (i64) -> i64
      func.call @stack_push_pointer(%6519) : (i64) -> ()
      %6523 = llvm.mlir.addressof @str650 : !llvm.ptr
      %6524 = arith.constant 16 : i64
      %6525 = func.call @cc_make_string(%6523, %6524) : (!llvm.ptr, i64) -> i64
      %6526 = llvm.mlir.addressof @str651 : !llvm.ptr
      %6527 = arith.constant 11 : i64
      %6528 = func.call @cc_make_string(%6526, %6527) : (!llvm.ptr, i64) -> i64
      %6529 = func.call @cc_intern(%6525, %6528) : (i64, i64) -> i64
      %6530 = func.call @cc_nil_value() : () -> i64
      %6531 = func.call @cc_cons(%6529, %6530) : (i64, i64) -> i64
      %6532 = func.call @cc_values_pack(%6531) : (i64) -> i64
      func.call @stack_push_pointer(%6529) : (i64) -> ()
      %6533 = llvm.mlir.addressof @str652 : !llvm.ptr
      %6534 = arith.constant 10 : i64
      %6535 = func.call @cc_make_string(%6533, %6534) : (!llvm.ptr, i64) -> i64
      %6536 = llvm.mlir.addressof @str653 : !llvm.ptr
      %6537 = arith.constant 11 : i64
      %6538 = func.call @cc_make_string(%6536, %6537) : (!llvm.ptr, i64) -> i64
      %6539 = func.call @cc_intern(%6535, %6538) : (i64, i64) -> i64
      %6540 = func.call @cc_nil_value() : () -> i64
      %6541 = func.call @cc_cons(%6539, %6540) : (i64, i64) -> i64
      %6542 = func.call @cc_values_pack(%6541) : (i64) -> i64
      func.call @stack_push_pointer(%6539) : (i64) -> ()
      %6543 = llvm.mlir.addressof @str654 : !llvm.ptr
      %6544 = arith.constant 9 : i64
      %6545 = func.call @cc_make_string(%6543, %6544) : (!llvm.ptr, i64) -> i64
      %6546 = llvm.mlir.addressof @str655 : !llvm.ptr
      %6547 = arith.constant 11 : i64
      %6548 = func.call @cc_make_string(%6546, %6547) : (!llvm.ptr, i64) -> i64
      %6549 = func.call @cc_intern(%6545, %6548) : (i64, i64) -> i64
      %6550 = func.call @cc_nil_value() : () -> i64
      %6551 = func.call @cc_cons(%6549, %6550) : (i64, i64) -> i64
      %6552 = func.call @cc_values_pack(%6551) : (i64) -> i64
      func.call @stack_push_pointer(%6549) : (i64) -> ()
      %6553 = llvm.mlir.addressof @str656 : !llvm.ptr
      %6554 = arith.constant 6 : i64
      %6555 = func.call @cc_make_string(%6553, %6554) : (!llvm.ptr, i64) -> i64
      %6556 = llvm.mlir.addressof @str657 : !llvm.ptr
      %6557 = arith.constant 11 : i64
      %6558 = func.call @cc_make_string(%6556, %6557) : (!llvm.ptr, i64) -> i64
      %6559 = func.call @cc_intern(%6555, %6558) : (i64, i64) -> i64
      %6560 = func.call @cc_nil_value() : () -> i64
      %6561 = func.call @cc_cons(%6559, %6560) : (i64, i64) -> i64
      %6562 = func.call @cc_values_pack(%6561) : (i64) -> i64
      func.call @stack_push_pointer(%6559) : (i64) -> ()
      %6563 = llvm.mlir.addressof @str658 : !llvm.ptr
      %6564 = arith.constant 6 : i64
      %6565 = func.call @cc_make_string(%6563, %6564) : (!llvm.ptr, i64) -> i64
      %6566 = llvm.mlir.addressof @str659 : !llvm.ptr
      %6567 = arith.constant 11 : i64
      %6568 = func.call @cc_make_string(%6566, %6567) : (!llvm.ptr, i64) -> i64
      %6569 = func.call @cc_intern(%6565, %6568) : (i64, i64) -> i64
      %6570 = func.call @cc_nil_value() : () -> i64
      %6571 = func.call @cc_cons(%6569, %6570) : (i64, i64) -> i64
      %6572 = func.call @cc_values_pack(%6571) : (i64) -> i64
      func.call @stack_push_pointer(%6569) : (i64) -> ()
      %6573 = llvm.mlir.addressof @str660 : !llvm.ptr
      %6574 = arith.constant 7 : i64
      %6575 = func.call @cc_make_string(%6573, %6574) : (!llvm.ptr, i64) -> i64
      %6576 = llvm.mlir.addressof @str661 : !llvm.ptr
      %6577 = arith.constant 11 : i64
      %6578 = func.call @cc_make_string(%6576, %6577) : (!llvm.ptr, i64) -> i64
      %6579 = func.call @cc_intern(%6575, %6578) : (i64, i64) -> i64
      %6580 = func.call @cc_nil_value() : () -> i64
      %6581 = func.call @cc_cons(%6579, %6580) : (i64, i64) -> i64
      %6582 = func.call @cc_values_pack(%6581) : (i64) -> i64
      func.call @stack_push_pointer(%6579) : (i64) -> ()
      %6583 = llvm.mlir.addressof @str662 : !llvm.ptr
      %6584 = arith.constant 30 : i64
      %6585 = func.call @cc_make_string(%6583, %6584) : (!llvm.ptr, i64) -> i64
      %6586 = llvm.mlir.addressof @str663 : !llvm.ptr
      %6587 = arith.constant 11 : i64
      %6588 = func.call @cc_make_string(%6586, %6587) : (!llvm.ptr, i64) -> i64
      %6589 = func.call @cc_intern(%6585, %6588) : (i64, i64) -> i64
      %6590 = func.call @cc_nil_value() : () -> i64
      %6591 = func.call @cc_cons(%6589, %6590) : (i64, i64) -> i64
      %6592 = func.call @cc_values_pack(%6591) : (i64) -> i64
      func.call @stack_push_pointer(%6589) : (i64) -> ()
      %6593 = llvm.mlir.addressof @str664 : !llvm.ptr
      %6594 = arith.constant 7 : i64
      %6595 = func.call @cc_make_string(%6593, %6594) : (!llvm.ptr, i64) -> i64
      %6596 = llvm.mlir.addressof @str665 : !llvm.ptr
      %6597 = arith.constant 11 : i64
      %6598 = func.call @cc_make_string(%6596, %6597) : (!llvm.ptr, i64) -> i64
      %6599 = func.call @cc_intern(%6595, %6598) : (i64, i64) -> i64
      %6600 = func.call @cc_nil_value() : () -> i64
      %6601 = func.call @cc_cons(%6599, %6600) : (i64, i64) -> i64
      %6602 = func.call @cc_values_pack(%6601) : (i64) -> i64
      func.call @stack_push_pointer(%6599) : (i64) -> ()
      %6603 = llvm.mlir.addressof @str666 : !llvm.ptr
      %6604 = arith.constant 20 : i64
      %6605 = func.call @cc_make_string(%6603, %6604) : (!llvm.ptr, i64) -> i64
      %6606 = llvm.mlir.addressof @str667 : !llvm.ptr
      %6607 = arith.constant 11 : i64
      %6608 = func.call @cc_make_string(%6606, %6607) : (!llvm.ptr, i64) -> i64
      %6609 = func.call @cc_intern(%6605, %6608) : (i64, i64) -> i64
      %6610 = func.call @cc_nil_value() : () -> i64
      %6611 = func.call @cc_cons(%6609, %6610) : (i64, i64) -> i64
      %6612 = func.call @cc_values_pack(%6611) : (i64) -> i64
      func.call @stack_push_pointer(%6609) : (i64) -> ()
      %6613 = llvm.mlir.addressof @str668 : !llvm.ptr
      %6614 = arith.constant 23 : i64
      %6615 = func.call @cc_make_string(%6613, %6614) : (!llvm.ptr, i64) -> i64
      %6616 = llvm.mlir.addressof @str669 : !llvm.ptr
      %6617 = arith.constant 11 : i64
      %6618 = func.call @cc_make_string(%6616, %6617) : (!llvm.ptr, i64) -> i64
      %6619 = func.call @cc_intern(%6615, %6618) : (i64, i64) -> i64
      %6620 = func.call @cc_nil_value() : () -> i64
      %6621 = func.call @cc_cons(%6619, %6620) : (i64, i64) -> i64
      %6622 = func.call @cc_values_pack(%6621) : (i64) -> i64
      func.call @stack_push_pointer(%6619) : (i64) -> ()
      %6623 = llvm.mlir.addressof @str670 : !llvm.ptr
      %6624 = arith.constant 27 : i64
      %6625 = func.call @cc_make_string(%6623, %6624) : (!llvm.ptr, i64) -> i64
      %6626 = llvm.mlir.addressof @str671 : !llvm.ptr
      %6627 = arith.constant 11 : i64
      %6628 = func.call @cc_make_string(%6626, %6627) : (!llvm.ptr, i64) -> i64
      %6629 = func.call @cc_intern(%6625, %6628) : (i64, i64) -> i64
      %6630 = func.call @cc_nil_value() : () -> i64
      %6631 = func.call @cc_cons(%6629, %6630) : (i64, i64) -> i64
      %6632 = func.call @cc_values_pack(%6631) : (i64) -> i64
      func.call @stack_push_pointer(%6629) : (i64) -> ()
      %6633 = llvm.mlir.addressof @str672 : !llvm.ptr
      %6634 = arith.constant 25 : i64
      %6635 = func.call @cc_make_string(%6633, %6634) : (!llvm.ptr, i64) -> i64
      %6636 = llvm.mlir.addressof @str673 : !llvm.ptr
      %6637 = arith.constant 11 : i64
      %6638 = func.call @cc_make_string(%6636, %6637) : (!llvm.ptr, i64) -> i64
      %6639 = func.call @cc_intern(%6635, %6638) : (i64, i64) -> i64
      %6640 = func.call @cc_nil_value() : () -> i64
      %6641 = func.call @cc_cons(%6639, %6640) : (i64, i64) -> i64
      %6642 = func.call @cc_values_pack(%6641) : (i64) -> i64
      func.call @stack_push_pointer(%6639) : (i64) -> ()
      %6643 = llvm.mlir.addressof @str674 : !llvm.ptr
      %6644 = arith.constant 38 : i64
      %6645 = func.call @cc_make_string(%6643, %6644) : (!llvm.ptr, i64) -> i64
      %6646 = llvm.mlir.addressof @str675 : !llvm.ptr
      %6647 = arith.constant 11 : i64
      %6648 = func.call @cc_make_string(%6646, %6647) : (!llvm.ptr, i64) -> i64
      %6649 = func.call @cc_intern(%6645, %6648) : (i64, i64) -> i64
      %6650 = func.call @cc_nil_value() : () -> i64
      %6651 = func.call @cc_cons(%6649, %6650) : (i64, i64) -> i64
      %6652 = func.call @cc_values_pack(%6651) : (i64) -> i64
      func.call @stack_push_pointer(%6649) : (i64) -> ()
      %6653 = llvm.mlir.addressof @str676 : !llvm.ptr
      %6654 = arith.constant 36 : i64
      %6655 = func.call @cc_make_string(%6653, %6654) : (!llvm.ptr, i64) -> i64
      %6656 = llvm.mlir.addressof @str677 : !llvm.ptr
      %6657 = arith.constant 11 : i64
      %6658 = func.call @cc_make_string(%6656, %6657) : (!llvm.ptr, i64) -> i64
      %6659 = func.call @cc_intern(%6655, %6658) : (i64, i64) -> i64
      %6660 = func.call @cc_nil_value() : () -> i64
      %6661 = func.call @cc_cons(%6659, %6660) : (i64, i64) -> i64
      %6662 = func.call @cc_values_pack(%6661) : (i64) -> i64
      func.call @stack_push_pointer(%6659) : (i64) -> ()
      %6663 = llvm.mlir.addressof @str678 : !llvm.ptr
      %6664 = arith.constant 37 : i64
      %6665 = func.call @cc_make_string(%6663, %6664) : (!llvm.ptr, i64) -> i64
      %6666 = llvm.mlir.addressof @str679 : !llvm.ptr
      %6667 = arith.constant 11 : i64
      %6668 = func.call @cc_make_string(%6666, %6667) : (!llvm.ptr, i64) -> i64
      %6669 = func.call @cc_intern(%6665, %6668) : (i64, i64) -> i64
      %6670 = func.call @cc_nil_value() : () -> i64
      %6671 = func.call @cc_cons(%6669, %6670) : (i64, i64) -> i64
      %6672 = func.call @cc_values_pack(%6671) : (i64) -> i64
      func.call @stack_push_pointer(%6669) : (i64) -> ()
      %6673 = llvm.mlir.addressof @str680 : !llvm.ptr
      %6674 = arith.constant 38 : i64
      %6675 = func.call @cc_make_string(%6673, %6674) : (!llvm.ptr, i64) -> i64
      %6676 = llvm.mlir.addressof @str681 : !llvm.ptr
      %6677 = arith.constant 11 : i64
      %6678 = func.call @cc_make_string(%6676, %6677) : (!llvm.ptr, i64) -> i64
      %6679 = func.call @cc_intern(%6675, %6678) : (i64, i64) -> i64
      %6680 = func.call @cc_nil_value() : () -> i64
      %6681 = func.call @cc_cons(%6679, %6680) : (i64, i64) -> i64
      %6682 = func.call @cc_values_pack(%6681) : (i64) -> i64
      func.call @stack_push_pointer(%6679) : (i64) -> ()
      %6683 = llvm.mlir.addressof @str682 : !llvm.ptr
      %6684 = arith.constant 26 : i64
      %6685 = func.call @cc_make_string(%6683, %6684) : (!llvm.ptr, i64) -> i64
      %6686 = llvm.mlir.addressof @str683 : !llvm.ptr
      %6687 = arith.constant 11 : i64
      %6688 = func.call @cc_make_string(%6686, %6687) : (!llvm.ptr, i64) -> i64
      %6689 = func.call @cc_intern(%6685, %6688) : (i64, i64) -> i64
      %6690 = func.call @cc_nil_value() : () -> i64
      %6691 = func.call @cc_cons(%6689, %6690) : (i64, i64) -> i64
      %6692 = func.call @cc_values_pack(%6691) : (i64) -> i64
      func.call @stack_push_pointer(%6689) : (i64) -> ()
      %6693 = llvm.mlir.addressof @str684 : !llvm.ptr
      %6694 = arith.constant 27 : i64
      %6695 = func.call @cc_make_string(%6693, %6694) : (!llvm.ptr, i64) -> i64
      %6696 = llvm.mlir.addressof @str685 : !llvm.ptr
      %6697 = arith.constant 11 : i64
      %6698 = func.call @cc_make_string(%6696, %6697) : (!llvm.ptr, i64) -> i64
      %6699 = func.call @cc_intern(%6695, %6698) : (i64, i64) -> i64
      %6700 = func.call @cc_nil_value() : () -> i64
      %6701 = func.call @cc_cons(%6699, %6700) : (i64, i64) -> i64
      %6702 = func.call @cc_values_pack(%6701) : (i64) -> i64
      func.call @stack_push_pointer(%6699) : (i64) -> ()
      %6703 = llvm.mlir.addressof @str686 : !llvm.ptr
      %6704 = arith.constant 27 : i64
      %6705 = func.call @cc_make_string(%6703, %6704) : (!llvm.ptr, i64) -> i64
      %6706 = llvm.mlir.addressof @str687 : !llvm.ptr
      %6707 = arith.constant 11 : i64
      %6708 = func.call @cc_make_string(%6706, %6707) : (!llvm.ptr, i64) -> i64
      %6709 = func.call @cc_intern(%6705, %6708) : (i64, i64) -> i64
      %6710 = func.call @cc_nil_value() : () -> i64
      %6711 = func.call @cc_cons(%6709, %6710) : (i64, i64) -> i64
      %6712 = func.call @cc_values_pack(%6711) : (i64) -> i64
      func.call @stack_push_pointer(%6709) : (i64) -> ()
      %6713 = llvm.mlir.addressof @str688 : !llvm.ptr
      %6714 = arith.constant 25 : i64
      %6715 = func.call @cc_make_string(%6713, %6714) : (!llvm.ptr, i64) -> i64
      %6716 = llvm.mlir.addressof @str689 : !llvm.ptr
      %6717 = arith.constant 11 : i64
      %6718 = func.call @cc_make_string(%6716, %6717) : (!llvm.ptr, i64) -> i64
      %6719 = func.call @cc_intern(%6715, %6718) : (i64, i64) -> i64
      %6720 = func.call @cc_nil_value() : () -> i64
      %6721 = func.call @cc_cons(%6719, %6720) : (i64, i64) -> i64
      %6722 = func.call @cc_values_pack(%6721) : (i64) -> i64
      func.call @stack_push_pointer(%6719) : (i64) -> ()
      %6723 = llvm.mlir.addressof @str690 : !llvm.ptr
      %6724 = arith.constant 38 : i64
      %6725 = func.call @cc_make_string(%6723, %6724) : (!llvm.ptr, i64) -> i64
      %6726 = llvm.mlir.addressof @str691 : !llvm.ptr
      %6727 = arith.constant 11 : i64
      %6728 = func.call @cc_make_string(%6726, %6727) : (!llvm.ptr, i64) -> i64
      %6729 = func.call @cc_intern(%6725, %6728) : (i64, i64) -> i64
      %6730 = func.call @cc_nil_value() : () -> i64
      %6731 = func.call @cc_cons(%6729, %6730) : (i64, i64) -> i64
      %6732 = func.call @cc_values_pack(%6731) : (i64) -> i64
      func.call @stack_push_pointer(%6729) : (i64) -> ()
      %6733 = llvm.mlir.addressof @str692 : !llvm.ptr
      %6734 = arith.constant 36 : i64
      %6735 = func.call @cc_make_string(%6733, %6734) : (!llvm.ptr, i64) -> i64
      %6736 = llvm.mlir.addressof @str693 : !llvm.ptr
      %6737 = arith.constant 11 : i64
      %6738 = func.call @cc_make_string(%6736, %6737) : (!llvm.ptr, i64) -> i64
      %6739 = func.call @cc_intern(%6735, %6738) : (i64, i64) -> i64
      %6740 = func.call @cc_nil_value() : () -> i64
      %6741 = func.call @cc_cons(%6739, %6740) : (i64, i64) -> i64
      %6742 = func.call @cc_values_pack(%6741) : (i64) -> i64
      func.call @stack_push_pointer(%6739) : (i64) -> ()
      %6743 = llvm.mlir.addressof @str694 : !llvm.ptr
      %6744 = arith.constant 37 : i64
      %6745 = func.call @cc_make_string(%6743, %6744) : (!llvm.ptr, i64) -> i64
      %6746 = llvm.mlir.addressof @str695 : !llvm.ptr
      %6747 = arith.constant 11 : i64
      %6748 = func.call @cc_make_string(%6746, %6747) : (!llvm.ptr, i64) -> i64
      %6749 = func.call @cc_intern(%6745, %6748) : (i64, i64) -> i64
      %6750 = func.call @cc_nil_value() : () -> i64
      %6751 = func.call @cc_cons(%6749, %6750) : (i64, i64) -> i64
      %6752 = func.call @cc_values_pack(%6751) : (i64) -> i64
      func.call @stack_push_pointer(%6749) : (i64) -> ()
      %6753 = llvm.mlir.addressof @str696 : !llvm.ptr
      %6754 = arith.constant 38 : i64
      %6755 = func.call @cc_make_string(%6753, %6754) : (!llvm.ptr, i64) -> i64
      %6756 = llvm.mlir.addressof @str697 : !llvm.ptr
      %6757 = arith.constant 11 : i64
      %6758 = func.call @cc_make_string(%6756, %6757) : (!llvm.ptr, i64) -> i64
      %6759 = func.call @cc_intern(%6755, %6758) : (i64, i64) -> i64
      %6760 = func.call @cc_nil_value() : () -> i64
      %6761 = func.call @cc_cons(%6759, %6760) : (i64, i64) -> i64
      %6762 = func.call @cc_values_pack(%6761) : (i64) -> i64
      func.call @stack_push_pointer(%6759) : (i64) -> ()
      %6763 = llvm.mlir.addressof @str698 : !llvm.ptr
      %6764 = arith.constant 26 : i64
      %6765 = func.call @cc_make_string(%6763, %6764) : (!llvm.ptr, i64) -> i64
      %6766 = llvm.mlir.addressof @str699 : !llvm.ptr
      %6767 = arith.constant 11 : i64
      %6768 = func.call @cc_make_string(%6766, %6767) : (!llvm.ptr, i64) -> i64
      %6769 = func.call @cc_intern(%6765, %6768) : (i64, i64) -> i64
      %6770 = func.call @cc_nil_value() : () -> i64
      %6771 = func.call @cc_cons(%6769, %6770) : (i64, i64) -> i64
      %6772 = func.call @cc_values_pack(%6771) : (i64) -> i64
      func.call @stack_push_pointer(%6769) : (i64) -> ()
      %6773 = llvm.mlir.addressof @str700 : !llvm.ptr
      %6774 = arith.constant 27 : i64
      %6775 = func.call @cc_make_string(%6773, %6774) : (!llvm.ptr, i64) -> i64
      %6776 = llvm.mlir.addressof @str701 : !llvm.ptr
      %6777 = arith.constant 11 : i64
      %6778 = func.call @cc_make_string(%6776, %6777) : (!llvm.ptr, i64) -> i64
      %6779 = func.call @cc_intern(%6775, %6778) : (i64, i64) -> i64
      %6780 = func.call @cc_nil_value() : () -> i64
      %6781 = func.call @cc_cons(%6779, %6780) : (i64, i64) -> i64
      %6782 = func.call @cc_values_pack(%6781) : (i64) -> i64
      func.call @stack_push_pointer(%6779) : (i64) -> ()
      %6783 = llvm.mlir.addressof @str702 : !llvm.ptr
      %6784 = arith.constant 10 : i64
      %6785 = func.call @cc_make_string(%6783, %6784) : (!llvm.ptr, i64) -> i64
      %6786 = llvm.mlir.addressof @str703 : !llvm.ptr
      %6787 = arith.constant 11 : i64
      %6788 = func.call @cc_make_string(%6786, %6787) : (!llvm.ptr, i64) -> i64
      %6789 = func.call @cc_intern(%6785, %6788) : (i64, i64) -> i64
      %6790 = func.call @cc_nil_value() : () -> i64
      %6791 = func.call @cc_cons(%6789, %6790) : (i64, i64) -> i64
      %6792 = func.call @cc_values_pack(%6791) : (i64) -> i64
      func.call @stack_push_pointer(%6789) : (i64) -> ()
      %6793 = llvm.mlir.addressof @str704 : !llvm.ptr
      %6794 = arith.constant 18 : i64
      %6795 = func.call @cc_make_string(%6793, %6794) : (!llvm.ptr, i64) -> i64
      %6796 = llvm.mlir.addressof @str705 : !llvm.ptr
      %6797 = arith.constant 11 : i64
      %6798 = func.call @cc_make_string(%6796, %6797) : (!llvm.ptr, i64) -> i64
      %6799 = func.call @cc_intern(%6795, %6798) : (i64, i64) -> i64
      %6800 = func.call @cc_nil_value() : () -> i64
      %6801 = func.call @cc_cons(%6799, %6800) : (i64, i64) -> i64
      %6802 = func.call @cc_values_pack(%6801) : (i64) -> i64
      func.call @stack_push_pointer(%6799) : (i64) -> ()
      %6803 = llvm.mlir.addressof @str706 : !llvm.ptr
      %6804 = arith.constant 27 : i64
      %6805 = func.call @cc_make_string(%6803, %6804) : (!llvm.ptr, i64) -> i64
      %6806 = llvm.mlir.addressof @str707 : !llvm.ptr
      %6807 = arith.constant 11 : i64
      %6808 = func.call @cc_make_string(%6806, %6807) : (!llvm.ptr, i64) -> i64
      %6809 = func.call @cc_intern(%6805, %6808) : (i64, i64) -> i64
      %6810 = func.call @cc_nil_value() : () -> i64
      %6811 = func.call @cc_cons(%6809, %6810) : (i64, i64) -> i64
      %6812 = func.call @cc_values_pack(%6811) : (i64) -> i64
      func.call @stack_push_pointer(%6809) : (i64) -> ()
      %6813 = llvm.mlir.addressof @str708 : !llvm.ptr
      %6814 = arith.constant 6 : i64
      %6815 = func.call @cc_make_string(%6813, %6814) : (!llvm.ptr, i64) -> i64
      %6816 = llvm.mlir.addressof @str709 : !llvm.ptr
      %6817 = arith.constant 11 : i64
      %6818 = func.call @cc_make_string(%6816, %6817) : (!llvm.ptr, i64) -> i64
      %6819 = func.call @cc_intern(%6815, %6818) : (i64, i64) -> i64
      %6820 = func.call @cc_nil_value() : () -> i64
      %6821 = func.call @cc_cons(%6819, %6820) : (i64, i64) -> i64
      %6822 = func.call @cc_values_pack(%6821) : (i64) -> i64
      func.call @stack_push_pointer(%6819) : (i64) -> ()
      %6823 = llvm.mlir.addressof @str710 : !llvm.ptr
      %6824 = arith.constant 18 : i64
      %6825 = func.call @cc_make_string(%6823, %6824) : (!llvm.ptr, i64) -> i64
      %6826 = llvm.mlir.addressof @str711 : !llvm.ptr
      %6827 = arith.constant 11 : i64
      %6828 = func.call @cc_make_string(%6826, %6827) : (!llvm.ptr, i64) -> i64
      %6829 = func.call @cc_intern(%6825, %6828) : (i64, i64) -> i64
      %6830 = func.call @cc_nil_value() : () -> i64
      %6831 = func.call @cc_cons(%6829, %6830) : (i64, i64) -> i64
      %6832 = func.call @cc_values_pack(%6831) : (i64) -> i64
      func.call @stack_push_pointer(%6829) : (i64) -> ()
      %6833 = llvm.mlir.addressof @str712 : !llvm.ptr
      %6834 = arith.constant 26 : i64
      %6835 = func.call @cc_make_string(%6833, %6834) : (!llvm.ptr, i64) -> i64
      %6836 = llvm.mlir.addressof @str713 : !llvm.ptr
      %6837 = arith.constant 11 : i64
      %6838 = func.call @cc_make_string(%6836, %6837) : (!llvm.ptr, i64) -> i64
      %6839 = func.call @cc_intern(%6835, %6838) : (i64, i64) -> i64
      %6840 = func.call @cc_nil_value() : () -> i64
      %6841 = func.call @cc_cons(%6839, %6840) : (i64, i64) -> i64
      %6842 = func.call @cc_values_pack(%6841) : (i64) -> i64
      func.call @stack_push_pointer(%6839) : (i64) -> ()
      %6843 = llvm.mlir.addressof @str714 : !llvm.ptr
      %6844 = arith.constant 20 : i64
      %6845 = func.call @cc_make_string(%6843, %6844) : (!llvm.ptr, i64) -> i64
      %6846 = llvm.mlir.addressof @str715 : !llvm.ptr
      %6847 = arith.constant 11 : i64
      %6848 = func.call @cc_make_string(%6846, %6847) : (!llvm.ptr, i64) -> i64
      %6849 = func.call @cc_intern(%6845, %6848) : (i64, i64) -> i64
      %6850 = func.call @cc_nil_value() : () -> i64
      %6851 = func.call @cc_cons(%6849, %6850) : (i64, i64) -> i64
      %6852 = func.call @cc_values_pack(%6851) : (i64) -> i64
      func.call @stack_push_pointer(%6849) : (i64) -> ()
      %6853 = llvm.mlir.addressof @str716 : !llvm.ptr
      %6854 = arith.constant 24 : i64
      %6855 = func.call @cc_make_string(%6853, %6854) : (!llvm.ptr, i64) -> i64
      %6856 = llvm.mlir.addressof @str717 : !llvm.ptr
      %6857 = arith.constant 11 : i64
      %6858 = func.call @cc_make_string(%6856, %6857) : (!llvm.ptr, i64) -> i64
      %6859 = func.call @cc_intern(%6855, %6858) : (i64, i64) -> i64
      %6860 = func.call @cc_nil_value() : () -> i64
      %6861 = func.call @cc_cons(%6859, %6860) : (i64, i64) -> i64
      %6862 = func.call @cc_values_pack(%6861) : (i64) -> i64
      func.call @stack_push_pointer(%6859) : (i64) -> ()
      %6863 = llvm.mlir.addressof @str718 : !llvm.ptr
      %6864 = arith.constant 25 : i64
      %6865 = func.call @cc_make_string(%6863, %6864) : (!llvm.ptr, i64) -> i64
      %6866 = llvm.mlir.addressof @str719 : !llvm.ptr
      %6867 = arith.constant 11 : i64
      %6868 = func.call @cc_make_string(%6866, %6867) : (!llvm.ptr, i64) -> i64
      %6869 = func.call @cc_intern(%6865, %6868) : (i64, i64) -> i64
      %6870 = func.call @cc_nil_value() : () -> i64
      %6871 = func.call @cc_cons(%6869, %6870) : (i64, i64) -> i64
      %6872 = func.call @cc_values_pack(%6871) : (i64) -> i64
      func.call @stack_push_pointer(%6869) : (i64) -> ()
      %6873 = llvm.mlir.addressof @str720 : !llvm.ptr
      %6874 = arith.constant 26 : i64
      %6875 = func.call @cc_make_string(%6873, %6874) : (!llvm.ptr, i64) -> i64
      %6876 = llvm.mlir.addressof @str721 : !llvm.ptr
      %6877 = arith.constant 11 : i64
      %6878 = func.call @cc_make_string(%6876, %6877) : (!llvm.ptr, i64) -> i64
      %6879 = func.call @cc_intern(%6875, %6878) : (i64, i64) -> i64
      %6880 = func.call @cc_nil_value() : () -> i64
      %6881 = func.call @cc_cons(%6879, %6880) : (i64, i64) -> i64
      %6882 = func.call @cc_values_pack(%6881) : (i64) -> i64
      func.call @stack_push_pointer(%6879) : (i64) -> ()
      %6883 = llvm.mlir.addressof @str722 : !llvm.ptr
      %6884 = arith.constant 26 : i64
      %6885 = func.call @cc_make_string(%6883, %6884) : (!llvm.ptr, i64) -> i64
      %6886 = llvm.mlir.addressof @str723 : !llvm.ptr
      %6887 = arith.constant 11 : i64
      %6888 = func.call @cc_make_string(%6886, %6887) : (!llvm.ptr, i64) -> i64
      %6889 = func.call @cc_intern(%6885, %6888) : (i64, i64) -> i64
      %6890 = func.call @cc_nil_value() : () -> i64
      %6891 = func.call @cc_cons(%6889, %6890) : (i64, i64) -> i64
      %6892 = func.call @cc_values_pack(%6891) : (i64) -> i64
      func.call @stack_push_pointer(%6889) : (i64) -> ()
      %6893 = llvm.mlir.addressof @str724 : !llvm.ptr
      %6894 = arith.constant 20 : i64
      %6895 = func.call @cc_make_string(%6893, %6894) : (!llvm.ptr, i64) -> i64
      %6896 = llvm.mlir.addressof @str725 : !llvm.ptr
      %6897 = arith.constant 11 : i64
      %6898 = func.call @cc_make_string(%6896, %6897) : (!llvm.ptr, i64) -> i64
      %6899 = func.call @cc_intern(%6895, %6898) : (i64, i64) -> i64
      %6900 = func.call @cc_nil_value() : () -> i64
      %6901 = func.call @cc_cons(%6899, %6900) : (i64, i64) -> i64
      %6902 = func.call @cc_values_pack(%6901) : (i64) -> i64
      func.call @stack_push_pointer(%6899) : (i64) -> ()
      %6903 = llvm.mlir.addressof @str726 : !llvm.ptr
      %6904 = arith.constant 24 : i64
      %6905 = func.call @cc_make_string(%6903, %6904) : (!llvm.ptr, i64) -> i64
      %6906 = llvm.mlir.addressof @str727 : !llvm.ptr
      %6907 = arith.constant 11 : i64
      %6908 = func.call @cc_make_string(%6906, %6907) : (!llvm.ptr, i64) -> i64
      %6909 = func.call @cc_intern(%6905, %6908) : (i64, i64) -> i64
      %6910 = func.call @cc_nil_value() : () -> i64
      %6911 = func.call @cc_cons(%6909, %6910) : (i64, i64) -> i64
      %6912 = func.call @cc_values_pack(%6911) : (i64) -> i64
      func.call @stack_push_pointer(%6909) : (i64) -> ()
      %6913 = llvm.mlir.addressof @str728 : !llvm.ptr
      %6914 = arith.constant 25 : i64
      %6915 = func.call @cc_make_string(%6913, %6914) : (!llvm.ptr, i64) -> i64
      %6916 = llvm.mlir.addressof @str729 : !llvm.ptr
      %6917 = arith.constant 11 : i64
      %6918 = func.call @cc_make_string(%6916, %6917) : (!llvm.ptr, i64) -> i64
      %6919 = func.call @cc_intern(%6915, %6918) : (i64, i64) -> i64
      %6920 = func.call @cc_nil_value() : () -> i64
      %6921 = func.call @cc_cons(%6919, %6920) : (i64, i64) -> i64
      %6922 = func.call @cc_values_pack(%6921) : (i64) -> i64
      func.call @stack_push_pointer(%6919) : (i64) -> ()
      %6923 = llvm.mlir.addressof @str730 : !llvm.ptr
      %6924 = arith.constant 26 : i64
      %6925 = func.call @cc_make_string(%6923, %6924) : (!llvm.ptr, i64) -> i64
      %6926 = llvm.mlir.addressof @str731 : !llvm.ptr
      %6927 = arith.constant 11 : i64
      %6928 = func.call @cc_make_string(%6926, %6927) : (!llvm.ptr, i64) -> i64
      %6929 = func.call @cc_intern(%6925, %6928) : (i64, i64) -> i64
      %6930 = func.call @cc_nil_value() : () -> i64
      %6931 = func.call @cc_cons(%6929, %6930) : (i64, i64) -> i64
      %6932 = func.call @cc_values_pack(%6931) : (i64) -> i64
      func.call @stack_push_pointer(%6929) : (i64) -> ()
      %6933 = llvm.mlir.addressof @str732 : !llvm.ptr
      %6934 = arith.constant 21 : i64
      %6935 = func.call @cc_make_string(%6933, %6934) : (!llvm.ptr, i64) -> i64
      %6936 = llvm.mlir.addressof @str733 : !llvm.ptr
      %6937 = arith.constant 11 : i64
      %6938 = func.call @cc_make_string(%6936, %6937) : (!llvm.ptr, i64) -> i64
      %6939 = func.call @cc_intern(%6935, %6938) : (i64, i64) -> i64
      %6940 = func.call @cc_nil_value() : () -> i64
      %6941 = func.call @cc_cons(%6939, %6940) : (i64, i64) -> i64
      %6942 = func.call @cc_values_pack(%6941) : (i64) -> i64
      func.call @stack_push_pointer(%6939) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6943 = llvm.mlir.addressof @str734 : !llvm.ptr
      %6944 = arith.constant 9 : i64
      %6945 = func.call @cc_make_string(%6943, %6944) : (!llvm.ptr, i64) -> i64
      %6946 = llvm.mlir.addressof @str735 : !llvm.ptr
      %6947 = arith.constant 11 : i64
      %6948 = func.call @cc_make_string(%6946, %6947) : (!llvm.ptr, i64) -> i64
      %6949 = func.call @cc_intern(%6945, %6948) : (i64, i64) -> i64
      %6950 = func.call @cc_nil_value() : () -> i64
      %6951 = func.call @cc_cons(%6949, %6950) : (i64, i64) -> i64
      %6952 = func.call @cc_values_pack(%6951) : (i64) -> i64
      func.call @stack_push_pointer(%6949) : (i64) -> ()
      %6953 = llvm.mlir.addressof @str736 : !llvm.ptr
      %6954 = arith.constant 6 : i64
      %6955 = func.call @cc_make_string(%6953, %6954) : (!llvm.ptr, i64) -> i64
      %6956 = llvm.mlir.addressof @str737 : !llvm.ptr
      %6957 = arith.constant 11 : i64
      %6958 = func.call @cc_make_string(%6956, %6957) : (!llvm.ptr, i64) -> i64
      %6959 = func.call @cc_intern(%6955, %6958) : (i64, i64) -> i64
      %6960 = func.call @cc_nil_value() : () -> i64
      %6961 = func.call @cc_cons(%6959, %6960) : (i64, i64) -> i64
      %6962 = func.call @cc_values_pack(%6961) : (i64) -> i64
      func.call @stack_push_pointer(%6959) : (i64) -> ()
      %6963 = llvm.mlir.addressof @str738 : !llvm.ptr
      %6964 = arith.constant 8 : i64
      %6965 = func.call @cc_make_string(%6963, %6964) : (!llvm.ptr, i64) -> i64
      %6966 = llvm.mlir.addressof @str739 : !llvm.ptr
      %6967 = arith.constant 11 : i64
      %6968 = func.call @cc_make_string(%6966, %6967) : (!llvm.ptr, i64) -> i64
      %6969 = func.call @cc_intern(%6965, %6968) : (i64, i64) -> i64
      %6970 = func.call @cc_nil_value() : () -> i64
      %6971 = func.call @cc_cons(%6969, %6970) : (i64, i64) -> i64
      %6972 = func.call @cc_values_pack(%6971) : (i64) -> i64
      func.call @stack_push_pointer(%6969) : (i64) -> ()
      %6973 = llvm.mlir.addressof @str740 : !llvm.ptr
      %6974 = arith.constant 9 : i64
      %6975 = func.call @cc_make_string(%6973, %6974) : (!llvm.ptr, i64) -> i64
      %6976 = llvm.mlir.addressof @str741 : !llvm.ptr
      %6977 = arith.constant 11 : i64
      %6978 = func.call @cc_make_string(%6976, %6977) : (!llvm.ptr, i64) -> i64
      %6979 = func.call @cc_intern(%6975, %6978) : (i64, i64) -> i64
      %6980 = func.call @cc_nil_value() : () -> i64
      %6981 = func.call @cc_cons(%6979, %6980) : (i64, i64) -> i64
      %6982 = func.call @cc_values_pack(%6981) : (i64) -> i64
      func.call @stack_push_pointer(%6979) : (i64) -> ()
      %6983 = llvm.mlir.addressof @str742 : !llvm.ptr
      %6984 = arith.constant 7 : i64
      %6985 = func.call @cc_make_string(%6983, %6984) : (!llvm.ptr, i64) -> i64
      %6986 = llvm.mlir.addressof @str743 : !llvm.ptr
      %6987 = arith.constant 11 : i64
      %6988 = func.call @cc_make_string(%6986, %6987) : (!llvm.ptr, i64) -> i64
      %6989 = func.call @cc_intern(%6985, %6988) : (i64, i64) -> i64
      %6990 = func.call @cc_nil_value() : () -> i64
      %6991 = func.call @cc_cons(%6989, %6990) : (i64, i64) -> i64
      %6992 = func.call @cc_values_pack(%6991) : (i64) -> i64
      func.call @stack_push_pointer(%6989) : (i64) -> ()
      %6993 = llvm.mlir.addressof @str744 : !llvm.ptr
      %6994 = arith.constant 13 : i64
      %6995 = func.call @cc_make_string(%6993, %6994) : (!llvm.ptr, i64) -> i64
      %6996 = llvm.mlir.addressof @str745 : !llvm.ptr
      %6997 = arith.constant 11 : i64
      %6998 = func.call @cc_make_string(%6996, %6997) : (!llvm.ptr, i64) -> i64
      %6999 = func.call @cc_intern(%6995, %6998) : (i64, i64) -> i64
      %7000 = func.call @cc_nil_value() : () -> i64
      %7001 = func.call @cc_cons(%6999, %7000) : (i64, i64) -> i64
      %7002 = func.call @cc_values_pack(%7001) : (i64) -> i64
      func.call @stack_push_pointer(%6999) : (i64) -> ()
      %7003 = llvm.mlir.addressof @str746 : !llvm.ptr
      %7004 = arith.constant 11 : i64
      %7005 = func.call @cc_make_string(%7003, %7004) : (!llvm.ptr, i64) -> i64
      %7006 = llvm.mlir.addressof @str747 : !llvm.ptr
      %7007 = arith.constant 11 : i64
      %7008 = func.call @cc_make_string(%7006, %7007) : (!llvm.ptr, i64) -> i64
      %7009 = func.call @cc_intern(%7005, %7008) : (i64, i64) -> i64
      %7010 = func.call @cc_nil_value() : () -> i64
      %7011 = func.call @cc_cons(%7009, %7010) : (i64, i64) -> i64
      %7012 = func.call @cc_values_pack(%7011) : (i64) -> i64
      func.call @stack_push_pointer(%7009) : (i64) -> ()
      %7013 = llvm.mlir.addressof @str748 : !llvm.ptr
      %7014 = arith.constant 2 : i64
      %7015 = func.call @cc_make_string(%7013, %7014) : (!llvm.ptr, i64) -> i64
      %7016 = llvm.mlir.addressof @str749 : !llvm.ptr
      %7017 = arith.constant 11 : i64
      %7018 = func.call @cc_make_string(%7016, %7017) : (!llvm.ptr, i64) -> i64
      %7019 = func.call @cc_intern(%7015, %7018) : (i64, i64) -> i64
      %7020 = func.call @cc_nil_value() : () -> i64
      %7021 = func.call @cc_cons(%7019, %7020) : (i64, i64) -> i64
      %7022 = func.call @cc_values_pack(%7021) : (i64) -> i64
      func.call @stack_push_pointer(%7019) : (i64) -> ()
      %7023 = llvm.mlir.addressof @str750 : !llvm.ptr
      %7024 = arith.constant 18 : i64
      %7025 = func.call @cc_make_string(%7023, %7024) : (!llvm.ptr, i64) -> i64
      %7026 = llvm.mlir.addressof @str751 : !llvm.ptr
      %7027 = arith.constant 11 : i64
      %7028 = func.call @cc_make_string(%7026, %7027) : (!llvm.ptr, i64) -> i64
      %7029 = func.call @cc_intern(%7025, %7028) : (i64, i64) -> i64
      %7030 = func.call @cc_nil_value() : () -> i64
      %7031 = func.call @cc_cons(%7029, %7030) : (i64, i64) -> i64
      %7032 = func.call @cc_values_pack(%7031) : (i64) -> i64
      func.call @stack_push_pointer(%7029) : (i64) -> ()
      %7033 = llvm.mlir.addressof @str752 : !llvm.ptr
      %7034 = arith.constant 13 : i64
      %7035 = func.call @cc_make_string(%7033, %7034) : (!llvm.ptr, i64) -> i64
      %7036 = llvm.mlir.addressof @str753 : !llvm.ptr
      %7037 = arith.constant 11 : i64
      %7038 = func.call @cc_make_string(%7036, %7037) : (!llvm.ptr, i64) -> i64
      %7039 = func.call @cc_intern(%7035, %7038) : (i64, i64) -> i64
      %7040 = func.call @cc_nil_value() : () -> i64
      %7041 = func.call @cc_cons(%7039, %7040) : (i64, i64) -> i64
      %7042 = func.call @cc_values_pack(%7041) : (i64) -> i64
      func.call @stack_push_pointer(%7039) : (i64) -> ()
      %7043 = llvm.mlir.addressof @str754 : !llvm.ptr
      %7044 = arith.constant 12 : i64
      %7045 = func.call @cc_make_string(%7043, %7044) : (!llvm.ptr, i64) -> i64
      %7046 = llvm.mlir.addressof @str755 : !llvm.ptr
      %7047 = arith.constant 11 : i64
      %7048 = func.call @cc_make_string(%7046, %7047) : (!llvm.ptr, i64) -> i64
      %7049 = func.call @cc_intern(%7045, %7048) : (i64, i64) -> i64
      %7050 = func.call @cc_nil_value() : () -> i64
      %7051 = func.call @cc_cons(%7049, %7050) : (i64, i64) -> i64
      %7052 = func.call @cc_values_pack(%7051) : (i64) -> i64
      func.call @stack_push_pointer(%7049) : (i64) -> ()
      %7053 = llvm.mlir.addressof @str756 : !llvm.ptr
      %7054 = arith.constant 5 : i64
      %7055 = func.call @cc_make_string(%7053, %7054) : (!llvm.ptr, i64) -> i64
      %7056 = llvm.mlir.addressof @str757 : !llvm.ptr
      %7057 = arith.constant 11 : i64
      %7058 = func.call @cc_make_string(%7056, %7057) : (!llvm.ptr, i64) -> i64
      %7059 = func.call @cc_intern(%7055, %7058) : (i64, i64) -> i64
      %7060 = func.call @cc_nil_value() : () -> i64
      %7061 = func.call @cc_cons(%7059, %7060) : (i64, i64) -> i64
      %7062 = func.call @cc_values_pack(%7061) : (i64) -> i64
      func.call @stack_push_pointer(%7059) : (i64) -> ()
      %7063 = llvm.mlir.addressof @str758 : !llvm.ptr
      %7064 = arith.constant 12 : i64
      %7065 = func.call @cc_make_string(%7063, %7064) : (!llvm.ptr, i64) -> i64
      %7066 = llvm.mlir.addressof @str759 : !llvm.ptr
      %7067 = arith.constant 11 : i64
      %7068 = func.call @cc_make_string(%7066, %7067) : (!llvm.ptr, i64) -> i64
      %7069 = func.call @cc_intern(%7065, %7068) : (i64, i64) -> i64
      %7070 = func.call @cc_nil_value() : () -> i64
      %7071 = func.call @cc_cons(%7069, %7070) : (i64, i64) -> i64
      %7072 = func.call @cc_values_pack(%7071) : (i64) -> i64
      func.call @stack_push_pointer(%7069) : (i64) -> ()
      %7073 = llvm.mlir.addressof @str760 : !llvm.ptr
      %7074 = arith.constant 9 : i64
      %7075 = func.call @cc_make_string(%7073, %7074) : (!llvm.ptr, i64) -> i64
      %7076 = llvm.mlir.addressof @str761 : !llvm.ptr
      %7077 = arith.constant 11 : i64
      %7078 = func.call @cc_make_string(%7076, %7077) : (!llvm.ptr, i64) -> i64
      %7079 = func.call @cc_intern(%7075, %7078) : (i64, i64) -> i64
      %7080 = func.call @cc_nil_value() : () -> i64
      %7081 = func.call @cc_cons(%7079, %7080) : (i64, i64) -> i64
      %7082 = func.call @cc_values_pack(%7081) : (i64) -> i64
      func.call @stack_push_pointer(%7079) : (i64) -> ()
      %7083 = llvm.mlir.addressof @str762 : !llvm.ptr
      %7084 = arith.constant 4 : i64
      %7085 = func.call @cc_make_string(%7083, %7084) : (!llvm.ptr, i64) -> i64
      %7086 = llvm.mlir.addressof @str763 : !llvm.ptr
      %7087 = arith.constant 11 : i64
      %7088 = func.call @cc_make_string(%7086, %7087) : (!llvm.ptr, i64) -> i64
      %7089 = func.call @cc_intern(%7085, %7088) : (i64, i64) -> i64
      %7090 = func.call @cc_nil_value() : () -> i64
      %7091 = func.call @cc_cons(%7089, %7090) : (i64, i64) -> i64
      %7092 = func.call @cc_values_pack(%7091) : (i64) -> i64
      func.call @stack_push_pointer(%7089) : (i64) -> ()
      %7093 = llvm.mlir.addressof @str764 : !llvm.ptr
      %7094 = arith.constant 7 : i64
      %7095 = func.call @cc_make_string(%7093, %7094) : (!llvm.ptr, i64) -> i64
      %7096 = llvm.mlir.addressof @str765 : !llvm.ptr
      %7097 = arith.constant 11 : i64
      %7098 = func.call @cc_make_string(%7096, %7097) : (!llvm.ptr, i64) -> i64
      %7099 = func.call @cc_intern(%7095, %7098) : (i64, i64) -> i64
      %7100 = func.call @cc_nil_value() : () -> i64
      %7101 = func.call @cc_cons(%7099, %7100) : (i64, i64) -> i64
      %7102 = func.call @cc_values_pack(%7101) : (i64) -> i64
      func.call @stack_push_pointer(%7099) : (i64) -> ()
      %7103 = llvm.mlir.addressof @str766 : !llvm.ptr
      %7104 = arith.constant 6 : i64
      %7105 = func.call @cc_make_string(%7103, %7104) : (!llvm.ptr, i64) -> i64
      %7106 = llvm.mlir.addressof @str767 : !llvm.ptr
      %7107 = arith.constant 11 : i64
      %7108 = func.call @cc_make_string(%7106, %7107) : (!llvm.ptr, i64) -> i64
      %7109 = func.call @cc_intern(%7105, %7108) : (i64, i64) -> i64
      %7110 = func.call @cc_nil_value() : () -> i64
      %7111 = func.call @cc_cons(%7109, %7110) : (i64, i64) -> i64
      %7112 = func.call @cc_values_pack(%7111) : (i64) -> i64
      func.call @stack_push_pointer(%7109) : (i64) -> ()
      %7113 = llvm.mlir.addressof @str768 : !llvm.ptr
      %7114 = arith.constant 9 : i64
      %7115 = func.call @cc_make_string(%7113, %7114) : (!llvm.ptr, i64) -> i64
      %7116 = llvm.mlir.addressof @str769 : !llvm.ptr
      %7117 = arith.constant 11 : i64
      %7118 = func.call @cc_make_string(%7116, %7117) : (!llvm.ptr, i64) -> i64
      %7119 = func.call @cc_intern(%7115, %7118) : (i64, i64) -> i64
      %7120 = func.call @cc_nil_value() : () -> i64
      %7121 = func.call @cc_cons(%7119, %7120) : (i64, i64) -> i64
      %7122 = func.call @cc_values_pack(%7121) : (i64) -> i64
      func.call @stack_push_pointer(%7119) : (i64) -> ()
      %7123 = llvm.mlir.addressof @str770 : !llvm.ptr
      %7124 = arith.constant 8 : i64
      %7125 = func.call @cc_make_string(%7123, %7124) : (!llvm.ptr, i64) -> i64
      %7126 = llvm.mlir.addressof @str771 : !llvm.ptr
      %7127 = arith.constant 11 : i64
      %7128 = func.call @cc_make_string(%7126, %7127) : (!llvm.ptr, i64) -> i64
      %7129 = func.call @cc_intern(%7125, %7128) : (i64, i64) -> i64
      %7130 = func.call @cc_nil_value() : () -> i64
      %7131 = func.call @cc_cons(%7129, %7130) : (i64, i64) -> i64
      %7132 = func.call @cc_values_pack(%7131) : (i64) -> i64
      func.call @stack_push_pointer(%7129) : (i64) -> ()
      %7133 = llvm.mlir.addressof @str772 : !llvm.ptr
      %7134 = arith.constant 17 : i64
      %7135 = func.call @cc_make_string(%7133, %7134) : (!llvm.ptr, i64) -> i64
      %7136 = llvm.mlir.addressof @str773 : !llvm.ptr
      %7137 = arith.constant 11 : i64
      %7138 = func.call @cc_make_string(%7136, %7137) : (!llvm.ptr, i64) -> i64
      %7139 = func.call @cc_intern(%7135, %7138) : (i64, i64) -> i64
      %7140 = func.call @cc_nil_value() : () -> i64
      %7141 = func.call @cc_cons(%7139, %7140) : (i64, i64) -> i64
      %7142 = func.call @cc_values_pack(%7141) : (i64) -> i64
      func.call @stack_push_pointer(%7139) : (i64) -> ()
      %7143 = llvm.mlir.addressof @str774 : !llvm.ptr
      %7144 = arith.constant 11 : i64
      %7145 = func.call @cc_make_string(%7143, %7144) : (!llvm.ptr, i64) -> i64
      %7146 = llvm.mlir.addressof @str775 : !llvm.ptr
      %7147 = arith.constant 11 : i64
      %7148 = func.call @cc_make_string(%7146, %7147) : (!llvm.ptr, i64) -> i64
      %7149 = func.call @cc_intern(%7145, %7148) : (i64, i64) -> i64
      %7150 = func.call @cc_nil_value() : () -> i64
      %7151 = func.call @cc_cons(%7149, %7150) : (i64, i64) -> i64
      %7152 = func.call @cc_values_pack(%7151) : (i64) -> i64
      func.call @stack_push_pointer(%7149) : (i64) -> ()
      %7153 = llvm.mlir.addressof @str776 : !llvm.ptr
      %7154 = arith.constant 19 : i64
      %7155 = func.call @cc_make_string(%7153, %7154) : (!llvm.ptr, i64) -> i64
      %7156 = llvm.mlir.addressof @str777 : !llvm.ptr
      %7157 = arith.constant 11 : i64
      %7158 = func.call @cc_make_string(%7156, %7157) : (!llvm.ptr, i64) -> i64
      %7159 = func.call @cc_intern(%7155, %7158) : (i64, i64) -> i64
      %7160 = func.call @cc_nil_value() : () -> i64
      %7161 = func.call @cc_cons(%7159, %7160) : (i64, i64) -> i64
      %7162 = func.call @cc_values_pack(%7161) : (i64) -> i64
      func.call @stack_push_pointer(%7159) : (i64) -> ()
      %7163 = llvm.mlir.addressof @str778 : !llvm.ptr
      %7164 = arith.constant 28 : i64
      %7165 = func.call @cc_make_string(%7163, %7164) : (!llvm.ptr, i64) -> i64
      %7166 = llvm.mlir.addressof @str779 : !llvm.ptr
      %7167 = arith.constant 11 : i64
      %7168 = func.call @cc_make_string(%7166, %7167) : (!llvm.ptr, i64) -> i64
      %7169 = func.call @cc_intern(%7165, %7168) : (i64, i64) -> i64
      %7170 = func.call @cc_nil_value() : () -> i64
      %7171 = func.call @cc_cons(%7169, %7170) : (i64, i64) -> i64
      %7172 = func.call @cc_values_pack(%7171) : (i64) -> i64
      func.call @stack_push_pointer(%7169) : (i64) -> ()
      %7173 = llvm.mlir.addressof @str780 : !llvm.ptr
      %7174 = arith.constant 11 : i64
      %7175 = func.call @cc_make_string(%7173, %7174) : (!llvm.ptr, i64) -> i64
      %7176 = llvm.mlir.addressof @str781 : !llvm.ptr
      %7177 = arith.constant 11 : i64
      %7178 = func.call @cc_make_string(%7176, %7177) : (!llvm.ptr, i64) -> i64
      %7179 = func.call @cc_intern(%7175, %7178) : (i64, i64) -> i64
      %7180 = func.call @cc_nil_value() : () -> i64
      %7181 = func.call @cc_cons(%7179, %7180) : (i64, i64) -> i64
      %7182 = func.call @cc_values_pack(%7181) : (i64) -> i64
      func.call @stack_push_pointer(%7179) : (i64) -> ()
      %7183 = llvm.mlir.addressof @str782 : !llvm.ptr
      %7184 = arith.constant 12 : i64
      %7185 = func.call @cc_make_string(%7183, %7184) : (!llvm.ptr, i64) -> i64
      %7186 = llvm.mlir.addressof @str783 : !llvm.ptr
      %7187 = arith.constant 11 : i64
      %7188 = func.call @cc_make_string(%7186, %7187) : (!llvm.ptr, i64) -> i64
      %7189 = func.call @cc_intern(%7185, %7188) : (i64, i64) -> i64
      %7190 = func.call @cc_nil_value() : () -> i64
      %7191 = func.call @cc_cons(%7189, %7190) : (i64, i64) -> i64
      %7192 = func.call @cc_values_pack(%7191) : (i64) -> i64
      func.call @stack_push_pointer(%7189) : (i64) -> ()
      %7193 = llvm.mlir.addressof @str784 : !llvm.ptr
      %7194 = arith.constant 18 : i64
      %7195 = func.call @cc_make_string(%7193, %7194) : (!llvm.ptr, i64) -> i64
      %7196 = llvm.mlir.addressof @str785 : !llvm.ptr
      %7197 = arith.constant 11 : i64
      %7198 = func.call @cc_make_string(%7196, %7197) : (!llvm.ptr, i64) -> i64
      %7199 = func.call @cc_intern(%7195, %7198) : (i64, i64) -> i64
      %7200 = func.call @cc_nil_value() : () -> i64
      %7201 = func.call @cc_cons(%7199, %7200) : (i64, i64) -> i64
      %7202 = func.call @cc_values_pack(%7201) : (i64) -> i64
      func.call @stack_push_pointer(%7199) : (i64) -> ()
      %7203 = llvm.mlir.addressof @str786 : !llvm.ptr
      %7204 = arith.constant 17 : i64
      %7205 = func.call @cc_make_string(%7203, %7204) : (!llvm.ptr, i64) -> i64
      %7206 = llvm.mlir.addressof @str787 : !llvm.ptr
      %7207 = arith.constant 11 : i64
      %7208 = func.call @cc_make_string(%7206, %7207) : (!llvm.ptr, i64) -> i64
      %7209 = func.call @cc_intern(%7205, %7208) : (i64, i64) -> i64
      %7210 = func.call @cc_nil_value() : () -> i64
      %7211 = func.call @cc_cons(%7209, %7210) : (i64, i64) -> i64
      %7212 = func.call @cc_values_pack(%7211) : (i64) -> i64
      func.call @stack_push_pointer(%7209) : (i64) -> ()
      %7213 = llvm.mlir.addressof @str788 : !llvm.ptr
      %7214 = arith.constant 16 : i64
      %7215 = func.call @cc_make_string(%7213, %7214) : (!llvm.ptr, i64) -> i64
      %7216 = llvm.mlir.addressof @str789 : !llvm.ptr
      %7217 = arith.constant 11 : i64
      %7218 = func.call @cc_make_string(%7216, %7217) : (!llvm.ptr, i64) -> i64
      %7219 = func.call @cc_intern(%7215, %7218) : (i64, i64) -> i64
      %7220 = func.call @cc_nil_value() : () -> i64
      %7221 = func.call @cc_cons(%7219, %7220) : (i64, i64) -> i64
      %7222 = func.call @cc_values_pack(%7221) : (i64) -> i64
      func.call @stack_push_pointer(%7219) : (i64) -> ()
      %7223 = llvm.mlir.addressof @str790 : !llvm.ptr
      %7224 = arith.constant 12 : i64
      %7225 = func.call @cc_make_string(%7223, %7224) : (!llvm.ptr, i64) -> i64
      %7226 = llvm.mlir.addressof @str791 : !llvm.ptr
      %7227 = arith.constant 11 : i64
      %7228 = func.call @cc_make_string(%7226, %7227) : (!llvm.ptr, i64) -> i64
      %7229 = func.call @cc_intern(%7225, %7228) : (i64, i64) -> i64
      %7230 = func.call @cc_nil_value() : () -> i64
      %7231 = func.call @cc_cons(%7229, %7230) : (i64, i64) -> i64
      %7232 = func.call @cc_values_pack(%7231) : (i64) -> i64
      func.call @stack_push_pointer(%7229) : (i64) -> ()
      %7233 = llvm.mlir.addressof @str792 : !llvm.ptr
      %7234 = arith.constant 13 : i64
      %7235 = func.call @cc_make_string(%7233, %7234) : (!llvm.ptr, i64) -> i64
      %7236 = llvm.mlir.addressof @str793 : !llvm.ptr
      %7237 = arith.constant 11 : i64
      %7238 = func.call @cc_make_string(%7236, %7237) : (!llvm.ptr, i64) -> i64
      %7239 = func.call @cc_intern(%7235, %7238) : (i64, i64) -> i64
      %7240 = func.call @cc_nil_value() : () -> i64
      %7241 = func.call @cc_cons(%7239, %7240) : (i64, i64) -> i64
      %7242 = func.call @cc_values_pack(%7241) : (i64) -> i64
      func.call @stack_push_pointer(%7239) : (i64) -> ()
      %7243 = llvm.mlir.addressof @str794 : !llvm.ptr
      %7244 = arith.constant 17 : i64
      %7245 = func.call @cc_make_string(%7243, %7244) : (!llvm.ptr, i64) -> i64
      %7246 = llvm.mlir.addressof @str795 : !llvm.ptr
      %7247 = arith.constant 11 : i64
      %7248 = func.call @cc_make_string(%7246, %7247) : (!llvm.ptr, i64) -> i64
      %7249 = func.call @cc_intern(%7245, %7248) : (i64, i64) -> i64
      %7250 = func.call @cc_nil_value() : () -> i64
      %7251 = func.call @cc_cons(%7249, %7250) : (i64, i64) -> i64
      %7252 = func.call @cc_values_pack(%7251) : (i64) -> i64
      func.call @stack_push_pointer(%7249) : (i64) -> ()
      %7253 = llvm.mlir.addressof @str796 : !llvm.ptr
      %7254 = arith.constant 13 : i64
      %7255 = func.call @cc_make_string(%7253, %7254) : (!llvm.ptr, i64) -> i64
      %7256 = llvm.mlir.addressof @str797 : !llvm.ptr
      %7257 = arith.constant 11 : i64
      %7258 = func.call @cc_make_string(%7256, %7257) : (!llvm.ptr, i64) -> i64
      %7259 = func.call @cc_intern(%7255, %7258) : (i64, i64) -> i64
      %7260 = func.call @cc_nil_value() : () -> i64
      %7261 = func.call @cc_cons(%7259, %7260) : (i64, i64) -> i64
      %7262 = func.call @cc_values_pack(%7261) : (i64) -> i64
      func.call @stack_push_pointer(%7259) : (i64) -> ()
      %7263 = llvm.mlir.addressof @str798 : !llvm.ptr
      %7264 = arith.constant 14 : i64
      %7265 = func.call @cc_make_string(%7263, %7264) : (!llvm.ptr, i64) -> i64
      %7266 = llvm.mlir.addressof @str799 : !llvm.ptr
      %7267 = arith.constant 11 : i64
      %7268 = func.call @cc_make_string(%7266, %7267) : (!llvm.ptr, i64) -> i64
      %7269 = func.call @cc_intern(%7265, %7268) : (i64, i64) -> i64
      %7270 = func.call @cc_nil_value() : () -> i64
      %7271 = func.call @cc_cons(%7269, %7270) : (i64, i64) -> i64
      %7272 = func.call @cc_values_pack(%7271) : (i64) -> i64
      func.call @stack_push_pointer(%7269) : (i64) -> ()
      %7273 = llvm.mlir.addressof @str800 : !llvm.ptr
      %7274 = arith.constant 12 : i64
      %7275 = func.call @cc_make_string(%7273, %7274) : (!llvm.ptr, i64) -> i64
      %7276 = llvm.mlir.addressof @str801 : !llvm.ptr
      %7277 = arith.constant 11 : i64
      %7278 = func.call @cc_make_string(%7276, %7277) : (!llvm.ptr, i64) -> i64
      %7279 = func.call @cc_intern(%7275, %7278) : (i64, i64) -> i64
      %7280 = func.call @cc_nil_value() : () -> i64
      %7281 = func.call @cc_cons(%7279, %7280) : (i64, i64) -> i64
      %7282 = func.call @cc_values_pack(%7281) : (i64) -> i64
      func.call @stack_push_pointer(%7279) : (i64) -> ()
      %7283 = llvm.mlir.addressof @str802 : !llvm.ptr
      %7284 = arith.constant 20 : i64
      %7285 = func.call @cc_make_string(%7283, %7284) : (!llvm.ptr, i64) -> i64
      %7286 = llvm.mlir.addressof @str803 : !llvm.ptr
      %7287 = arith.constant 11 : i64
      %7288 = func.call @cc_make_string(%7286, %7287) : (!llvm.ptr, i64) -> i64
      %7289 = func.call @cc_intern(%7285, %7288) : (i64, i64) -> i64
      %7290 = func.call @cc_nil_value() : () -> i64
      %7291 = func.call @cc_cons(%7289, %7290) : (i64, i64) -> i64
      %7292 = func.call @cc_values_pack(%7291) : (i64) -> i64
      func.call @stack_push_pointer(%7289) : (i64) -> ()
      %7293 = llvm.mlir.addressof @str804 : !llvm.ptr
      %7294 = arith.constant 29 : i64
      %7295 = func.call @cc_make_string(%7293, %7294) : (!llvm.ptr, i64) -> i64
      %7296 = llvm.mlir.addressof @str805 : !llvm.ptr
      %7297 = arith.constant 11 : i64
      %7298 = func.call @cc_make_string(%7296, %7297) : (!llvm.ptr, i64) -> i64
      %7299 = func.call @cc_intern(%7295, %7298) : (i64, i64) -> i64
      %7300 = func.call @cc_nil_value() : () -> i64
      %7301 = func.call @cc_cons(%7299, %7300) : (i64, i64) -> i64
      %7302 = func.call @cc_values_pack(%7301) : (i64) -> i64
      func.call @stack_push_pointer(%7299) : (i64) -> ()
      %7303 = llvm.mlir.addressof @str806 : !llvm.ptr
      %7304 = arith.constant 5 : i64
      %7305 = func.call @cc_make_string(%7303, %7304) : (!llvm.ptr, i64) -> i64
      %7306 = llvm.mlir.addressof @str807 : !llvm.ptr
      %7307 = arith.constant 11 : i64
      %7308 = func.call @cc_make_string(%7306, %7307) : (!llvm.ptr, i64) -> i64
      %7309 = func.call @cc_intern(%7305, %7308) : (i64, i64) -> i64
      %7310 = func.call @cc_nil_value() : () -> i64
      %7311 = func.call @cc_cons(%7309, %7310) : (i64, i64) -> i64
      %7312 = func.call @cc_values_pack(%7311) : (i64) -> i64
      func.call @stack_push_pointer(%7309) : (i64) -> ()
      %7313 = llvm.mlir.addressof @str808 : !llvm.ptr
      %7314 = arith.constant 7 : i64
      %7315 = func.call @cc_make_string(%7313, %7314) : (!llvm.ptr, i64) -> i64
      %7316 = llvm.mlir.addressof @str809 : !llvm.ptr
      %7317 = arith.constant 11 : i64
      %7318 = func.call @cc_make_string(%7316, %7317) : (!llvm.ptr, i64) -> i64
      %7319 = func.call @cc_intern(%7315, %7318) : (i64, i64) -> i64
      %7320 = func.call @cc_nil_value() : () -> i64
      %7321 = func.call @cc_cons(%7319, %7320) : (i64, i64) -> i64
      %7322 = func.call @cc_values_pack(%7321) : (i64) -> i64
      func.call @stack_push_pointer(%7319) : (i64) -> ()
      %7323 = llvm.mlir.addressof @str810 : !llvm.ptr
      %7324 = arith.constant 5 : i64
      %7325 = func.call @cc_make_string(%7323, %7324) : (!llvm.ptr, i64) -> i64
      %7326 = llvm.mlir.addressof @str811 : !llvm.ptr
      %7327 = arith.constant 11 : i64
      %7328 = func.call @cc_make_string(%7326, %7327) : (!llvm.ptr, i64) -> i64
      %7329 = func.call @cc_intern(%7325, %7328) : (i64, i64) -> i64
      %7330 = func.call @cc_nil_value() : () -> i64
      %7331 = func.call @cc_cons(%7329, %7330) : (i64, i64) -> i64
      %7332 = func.call @cc_values_pack(%7331) : (i64) -> i64
      func.call @stack_push_pointer(%7329) : (i64) -> ()
      %7333 = llvm.mlir.addressof @str812 : !llvm.ptr
      %7334 = arith.constant 8 : i64
      %7335 = func.call @cc_make_string(%7333, %7334) : (!llvm.ptr, i64) -> i64
      %7336 = llvm.mlir.addressof @str813 : !llvm.ptr
      %7337 = arith.constant 11 : i64
      %7338 = func.call @cc_make_string(%7336, %7337) : (!llvm.ptr, i64) -> i64
      %7339 = func.call @cc_intern(%7335, %7338) : (i64, i64) -> i64
      %7340 = func.call @cc_nil_value() : () -> i64
      %7341 = func.call @cc_cons(%7339, %7340) : (i64, i64) -> i64
      %7342 = func.call @cc_values_pack(%7341) : (i64) -> i64
      func.call @stack_push_pointer(%7339) : (i64) -> ()
      %7343 = llvm.mlir.addressof @str814 : !llvm.ptr
      %7344 = arith.constant 13 : i64
      %7345 = func.call @cc_make_string(%7343, %7344) : (!llvm.ptr, i64) -> i64
      %7346 = llvm.mlir.addressof @str815 : !llvm.ptr
      %7347 = arith.constant 11 : i64
      %7348 = func.call @cc_make_string(%7346, %7347) : (!llvm.ptr, i64) -> i64
      %7349 = func.call @cc_intern(%7345, %7348) : (i64, i64) -> i64
      %7350 = func.call @cc_nil_value() : () -> i64
      %7351 = func.call @cc_cons(%7349, %7350) : (i64, i64) -> i64
      %7352 = func.call @cc_values_pack(%7351) : (i64) -> i64
      func.call @stack_push_pointer(%7349) : (i64) -> ()
      %7353 = llvm.mlir.addressof @str816 : !llvm.ptr
      %7354 = arith.constant 14 : i64
      %7355 = func.call @cc_make_string(%7353, %7354) : (!llvm.ptr, i64) -> i64
      %7356 = llvm.mlir.addressof @str817 : !llvm.ptr
      %7357 = arith.constant 11 : i64
      %7358 = func.call @cc_make_string(%7356, %7357) : (!llvm.ptr, i64) -> i64
      %7359 = func.call @cc_intern(%7355, %7358) : (i64, i64) -> i64
      %7360 = func.call @cc_nil_value() : () -> i64
      %7361 = func.call @cc_cons(%7359, %7360) : (i64, i64) -> i64
      %7362 = func.call @cc_values_pack(%7361) : (i64) -> i64
      func.call @stack_push_pointer(%7359) : (i64) -> ()
      %7363 = llvm.mlir.addressof @str818 : !llvm.ptr
      %7364 = arith.constant 25 : i64
      %7365 = func.call @cc_make_string(%7363, %7364) : (!llvm.ptr, i64) -> i64
      %7366 = llvm.mlir.addressof @str819 : !llvm.ptr
      %7367 = arith.constant 11 : i64
      %7368 = func.call @cc_make_string(%7366, %7367) : (!llvm.ptr, i64) -> i64
      %7369 = func.call @cc_intern(%7365, %7368) : (i64, i64) -> i64
      %7370 = func.call @cc_nil_value() : () -> i64
      %7371 = func.call @cc_cons(%7369, %7370) : (i64, i64) -> i64
      %7372 = func.call @cc_values_pack(%7371) : (i64) -> i64
      func.call @stack_push_pointer(%7369) : (i64) -> ()
      %7373 = llvm.mlir.addressof @str820 : !llvm.ptr
      %7374 = arith.constant 15 : i64
      %7375 = func.call @cc_make_string(%7373, %7374) : (!llvm.ptr, i64) -> i64
      %7376 = llvm.mlir.addressof @str821 : !llvm.ptr
      %7377 = arith.constant 11 : i64
      %7378 = func.call @cc_make_string(%7376, %7377) : (!llvm.ptr, i64) -> i64
      %7379 = func.call @cc_intern(%7375, %7378) : (i64, i64) -> i64
      %7380 = func.call @cc_nil_value() : () -> i64
      %7381 = func.call @cc_cons(%7379, %7380) : (i64, i64) -> i64
      %7382 = func.call @cc_values_pack(%7381) : (i64) -> i64
      func.call @stack_push_pointer(%7379) : (i64) -> ()
      %7383 = llvm.mlir.addressof @str822 : !llvm.ptr
      %7384 = arith.constant 15 : i64
      %7385 = func.call @cc_make_string(%7383, %7384) : (!llvm.ptr, i64) -> i64
      %7386 = llvm.mlir.addressof @str823 : !llvm.ptr
      %7387 = arith.constant 11 : i64
      %7388 = func.call @cc_make_string(%7386, %7387) : (!llvm.ptr, i64) -> i64
      %7389 = func.call @cc_intern(%7385, %7388) : (i64, i64) -> i64
      %7390 = func.call @cc_nil_value() : () -> i64
      %7391 = func.call @cc_cons(%7389, %7390) : (i64, i64) -> i64
      %7392 = func.call @cc_values_pack(%7391) : (i64) -> i64
      func.call @stack_push_pointer(%7389) : (i64) -> ()
      %7393 = llvm.mlir.addressof @str824 : !llvm.ptr
      %7394 = arith.constant 17 : i64
      %7395 = func.call @cc_make_string(%7393, %7394) : (!llvm.ptr, i64) -> i64
      %7396 = llvm.mlir.addressof @str825 : !llvm.ptr
      %7397 = arith.constant 11 : i64
      %7398 = func.call @cc_make_string(%7396, %7397) : (!llvm.ptr, i64) -> i64
      %7399 = func.call @cc_intern(%7395, %7398) : (i64, i64) -> i64
      %7400 = func.call @cc_nil_value() : () -> i64
      %7401 = func.call @cc_cons(%7399, %7400) : (i64, i64) -> i64
      %7402 = func.call @cc_values_pack(%7401) : (i64) -> i64
      func.call @stack_push_pointer(%7399) : (i64) -> ()
      %7403 = llvm.mlir.addressof @str826 : !llvm.ptr
      %7404 = arith.constant 6 : i64
      %7405 = func.call @cc_make_string(%7403, %7404) : (!llvm.ptr, i64) -> i64
      %7406 = llvm.mlir.addressof @str827 : !llvm.ptr
      %7407 = arith.constant 11 : i64
      %7408 = func.call @cc_make_string(%7406, %7407) : (!llvm.ptr, i64) -> i64
      %7409 = func.call @cc_intern(%7405, %7408) : (i64, i64) -> i64
      %7410 = func.call @cc_nil_value() : () -> i64
      %7411 = func.call @cc_cons(%7409, %7410) : (i64, i64) -> i64
      %7412 = func.call @cc_values_pack(%7411) : (i64) -> i64
      func.call @stack_push_pointer(%7409) : (i64) -> ()
      %7413 = llvm.mlir.addressof @str828 : !llvm.ptr
      %7414 = arith.constant 12 : i64
      %7415 = func.call @cc_make_string(%7413, %7414) : (!llvm.ptr, i64) -> i64
      %7416 = llvm.mlir.addressof @str829 : !llvm.ptr
      %7417 = arith.constant 11 : i64
      %7418 = func.call @cc_make_string(%7416, %7417) : (!llvm.ptr, i64) -> i64
      %7419 = func.call @cc_intern(%7415, %7418) : (i64, i64) -> i64
      %7420 = func.call @cc_nil_value() : () -> i64
      %7421 = func.call @cc_cons(%7419, %7420) : (i64, i64) -> i64
      %7422 = func.call @cc_values_pack(%7421) : (i64) -> i64
      func.call @stack_push_pointer(%7419) : (i64) -> ()
      %7423 = llvm.mlir.addressof @str830 : !llvm.ptr
      %7424 = arith.constant 13 : i64
      %7425 = func.call @cc_make_string(%7423, %7424) : (!llvm.ptr, i64) -> i64
      %7426 = llvm.mlir.addressof @str831 : !llvm.ptr
      %7427 = arith.constant 11 : i64
      %7428 = func.call @cc_make_string(%7426, %7427) : (!llvm.ptr, i64) -> i64
      %7429 = func.call @cc_intern(%7425, %7428) : (i64, i64) -> i64
      %7430 = func.call @cc_nil_value() : () -> i64
      %7431 = func.call @cc_cons(%7429, %7430) : (i64, i64) -> i64
      %7432 = func.call @cc_values_pack(%7431) : (i64) -> i64
      func.call @stack_push_pointer(%7429) : (i64) -> ()
      %7433 = llvm.mlir.addressof @str832 : !llvm.ptr
      %7434 = arith.constant 9 : i64
      %7435 = func.call @cc_make_string(%7433, %7434) : (!llvm.ptr, i64) -> i64
      %7436 = llvm.mlir.addressof @str833 : !llvm.ptr
      %7437 = arith.constant 11 : i64
      %7438 = func.call @cc_make_string(%7436, %7437) : (!llvm.ptr, i64) -> i64
      %7439 = func.call @cc_intern(%7435, %7438) : (i64, i64) -> i64
      %7440 = func.call @cc_nil_value() : () -> i64
      %7441 = func.call @cc_cons(%7439, %7440) : (i64, i64) -> i64
      %7442 = func.call @cc_values_pack(%7441) : (i64) -> i64
      func.call @stack_push_pointer(%7439) : (i64) -> ()
      %7443 = llvm.mlir.addressof @str834 : !llvm.ptr
      %7444 = arith.constant 15 : i64
      %7445 = func.call @cc_make_string(%7443, %7444) : (!llvm.ptr, i64) -> i64
      %7446 = llvm.mlir.addressof @str835 : !llvm.ptr
      %7447 = arith.constant 11 : i64
      %7448 = func.call @cc_make_string(%7446, %7447) : (!llvm.ptr, i64) -> i64
      %7449 = func.call @cc_intern(%7445, %7448) : (i64, i64) -> i64
      %7450 = func.call @cc_nil_value() : () -> i64
      %7451 = func.call @cc_cons(%7449, %7450) : (i64, i64) -> i64
      %7452 = func.call @cc_values_pack(%7451) : (i64) -> i64
      func.call @stack_push_pointer(%7449) : (i64) -> ()
      %7453 = llvm.mlir.addressof @str836 : !llvm.ptr
      %7454 = arith.constant 16 : i64
      %7455 = func.call @cc_make_string(%7453, %7454) : (!llvm.ptr, i64) -> i64
      %7456 = llvm.mlir.addressof @str837 : !llvm.ptr
      %7457 = arith.constant 11 : i64
      %7458 = func.call @cc_make_string(%7456, %7457) : (!llvm.ptr, i64) -> i64
      %7459 = func.call @cc_intern(%7455, %7458) : (i64, i64) -> i64
      %7460 = func.call @cc_nil_value() : () -> i64
      %7461 = func.call @cc_cons(%7459, %7460) : (i64, i64) -> i64
      %7462 = func.call @cc_values_pack(%7461) : (i64) -> i64
      func.call @stack_push_pointer(%7459) : (i64) -> ()
      %7463 = llvm.mlir.addressof @str838 : !llvm.ptr
      %7464 = arith.constant 13 : i64
      %7465 = func.call @cc_make_string(%7463, %7464) : (!llvm.ptr, i64) -> i64
      %7466 = llvm.mlir.addressof @str839 : !llvm.ptr
      %7467 = arith.constant 11 : i64
      %7468 = func.call @cc_make_string(%7466, %7467) : (!llvm.ptr, i64) -> i64
      %7469 = func.call @cc_intern(%7465, %7468) : (i64, i64) -> i64
      %7470 = func.call @cc_nil_value() : () -> i64
      %7471 = func.call @cc_cons(%7469, %7470) : (i64, i64) -> i64
      %7472 = func.call @cc_values_pack(%7471) : (i64) -> i64
      func.call @stack_push_pointer(%7469) : (i64) -> ()
      %7473 = llvm.mlir.addressof @str840 : !llvm.ptr
      %7474 = arith.constant 6 : i64
      %7475 = func.call @cc_make_string(%7473, %7474) : (!llvm.ptr, i64) -> i64
      %7476 = llvm.mlir.addressof @str841 : !llvm.ptr
      %7477 = arith.constant 11 : i64
      %7478 = func.call @cc_make_string(%7476, %7477) : (!llvm.ptr, i64) -> i64
      %7479 = func.call @cc_intern(%7475, %7478) : (i64, i64) -> i64
      %7480 = func.call @cc_nil_value() : () -> i64
      %7481 = func.call @cc_cons(%7479, %7480) : (i64, i64) -> i64
      %7482 = func.call @cc_values_pack(%7481) : (i64) -> i64
      func.call @stack_push_pointer(%7479) : (i64) -> ()
      %7483 = llvm.mlir.addressof @str842 : !llvm.ptr
      %7484 = arith.constant 14 : i64
      %7485 = func.call @cc_make_string(%7483, %7484) : (!llvm.ptr, i64) -> i64
      %7486 = llvm.mlir.addressof @str843 : !llvm.ptr
      %7487 = arith.constant 11 : i64
      %7488 = func.call @cc_make_string(%7486, %7487) : (!llvm.ptr, i64) -> i64
      %7489 = func.call @cc_intern(%7485, %7488) : (i64, i64) -> i64
      %7490 = func.call @cc_nil_value() : () -> i64
      %7491 = func.call @cc_cons(%7489, %7490) : (i64, i64) -> i64
      %7492 = func.call @cc_values_pack(%7491) : (i64) -> i64
      func.call @stack_push_pointer(%7489) : (i64) -> ()
      %7493 = llvm.mlir.addressof @str844 : !llvm.ptr
      %7494 = arith.constant 1 : i64
      %7495 = func.call @cc_make_string(%7493, %7494) : (!llvm.ptr, i64) -> i64
      %7496 = func.call @cc_nil_value() : () -> i64
      %7497 = func.call @cc_intern(%7495, %7496) : (i64, i64) -> i64
      %7498 = func.call @cc_nil_value() : () -> i64
      %7499 = func.call @cc_cons(%7497, %7498) : (i64, i64) -> i64
      %7500 = func.call @cc_values_pack(%7499) : (i64) -> i64
      func.call @stack_push_pointer(%7497) : (i64) -> ()
      %7501 = llvm.mlir.addressof @str845 : !llvm.ptr
      %7502 = arith.constant 14 : i64
      %7503 = func.call @cc_make_string(%7501, %7502) : (!llvm.ptr, i64) -> i64
      %7504 = llvm.mlir.addressof @str846 : !llvm.ptr
      %7505 = arith.constant 11 : i64
      %7506 = func.call @cc_make_string(%7504, %7505) : (!llvm.ptr, i64) -> i64
      %7507 = func.call @cc_intern(%7503, %7506) : (i64, i64) -> i64
      %7508 = func.call @cc_nil_value() : () -> i64
      %7509 = func.call @cc_cons(%7507, %7508) : (i64, i64) -> i64
      %7510 = func.call @cc_values_pack(%7509) : (i64) -> i64
      func.call @stack_push_pointer(%7507) : (i64) -> ()
      %7511 = llvm.mlir.addressof @str847 : !llvm.ptr
      %7512 = arith.constant 4 : i64
      %7513 = func.call @cc_make_string(%7511, %7512) : (!llvm.ptr, i64) -> i64
      %7514 = llvm.mlir.addressof @str848 : !llvm.ptr
      %7515 = arith.constant 11 : i64
      %7516 = func.call @cc_make_string(%7514, %7515) : (!llvm.ptr, i64) -> i64
      %7517 = func.call @cc_intern(%7513, %7516) : (i64, i64) -> i64
      %7518 = func.call @cc_nil_value() : () -> i64
      %7519 = func.call @cc_cons(%7517, %7518) : (i64, i64) -> i64
      %7520 = func.call @cc_values_pack(%7519) : (i64) -> i64
      func.call @stack_push_pointer(%7517) : (i64) -> ()
      %7521 = llvm.mlir.addressof @str849 : !llvm.ptr
      %7522 = arith.constant 10 : i64
      %7523 = func.call @cc_make_string(%7521, %7522) : (!llvm.ptr, i64) -> i64
      %7524 = llvm.mlir.addressof @str850 : !llvm.ptr
      %7525 = arith.constant 11 : i64
      %7526 = func.call @cc_make_string(%7524, %7525) : (!llvm.ptr, i64) -> i64
      %7527 = func.call @cc_intern(%7523, %7526) : (i64, i64) -> i64
      %7528 = func.call @cc_nil_value() : () -> i64
      %7529 = func.call @cc_cons(%7527, %7528) : (i64, i64) -> i64
      %7530 = func.call @cc_values_pack(%7529) : (i64) -> i64
      func.call @stack_push_pointer(%7527) : (i64) -> ()
      %7531 = llvm.mlir.addressof @str851 : !llvm.ptr
      %7532 = arith.constant 12 : i64
      %7533 = func.call @cc_make_string(%7531, %7532) : (!llvm.ptr, i64) -> i64
      %7534 = llvm.mlir.addressof @str852 : !llvm.ptr
      %7535 = arith.constant 11 : i64
      %7536 = func.call @cc_make_string(%7534, %7535) : (!llvm.ptr, i64) -> i64
      %7537 = func.call @cc_intern(%7533, %7536) : (i64, i64) -> i64
      %7538 = func.call @cc_nil_value() : () -> i64
      %7539 = func.call @cc_cons(%7537, %7538) : (i64, i64) -> i64
      %7540 = func.call @cc_values_pack(%7539) : (i64) -> i64
      func.call @stack_push_pointer(%7537) : (i64) -> ()
      %7541 = llvm.mlir.addressof @str853 : !llvm.ptr
      %7542 = arith.constant 16 : i64
      %7543 = func.call @cc_make_string(%7541, %7542) : (!llvm.ptr, i64) -> i64
      %7544 = llvm.mlir.addressof @str854 : !llvm.ptr
      %7545 = arith.constant 11 : i64
      %7546 = func.call @cc_make_string(%7544, %7545) : (!llvm.ptr, i64) -> i64
      %7547 = func.call @cc_intern(%7543, %7546) : (i64, i64) -> i64
      %7548 = func.call @cc_nil_value() : () -> i64
      %7549 = func.call @cc_cons(%7547, %7548) : (i64, i64) -> i64
      %7550 = func.call @cc_values_pack(%7549) : (i64) -> i64
      func.call @stack_push_pointer(%7547) : (i64) -> ()
      %7551 = llvm.mlir.addressof @str855 : !llvm.ptr
      %7552 = arith.constant 18 : i64
      %7553 = func.call @cc_make_string(%7551, %7552) : (!llvm.ptr, i64) -> i64
      %7554 = llvm.mlir.addressof @str856 : !llvm.ptr
      %7555 = arith.constant 11 : i64
      %7556 = func.call @cc_make_string(%7554, %7555) : (!llvm.ptr, i64) -> i64
      %7557 = func.call @cc_intern(%7553, %7556) : (i64, i64) -> i64
      %7558 = func.call @cc_nil_value() : () -> i64
      %7559 = func.call @cc_cons(%7557, %7558) : (i64, i64) -> i64
      %7560 = func.call @cc_values_pack(%7559) : (i64) -> i64
      func.call @stack_push_pointer(%7557) : (i64) -> ()
      %7561 = llvm.mlir.addressof @str857 : !llvm.ptr
      %7562 = arith.constant 13 : i64
      %7563 = func.call @cc_make_string(%7561, %7562) : (!llvm.ptr, i64) -> i64
      %7564 = llvm.mlir.addressof @str858 : !llvm.ptr
      %7565 = arith.constant 11 : i64
      %7566 = func.call @cc_make_string(%7564, %7565) : (!llvm.ptr, i64) -> i64
      %7567 = func.call @cc_intern(%7563, %7566) : (i64, i64) -> i64
      %7568 = func.call @cc_nil_value() : () -> i64
      %7569 = func.call @cc_cons(%7567, %7568) : (i64, i64) -> i64
      %7570 = func.call @cc_values_pack(%7569) : (i64) -> i64
      func.call @stack_push_pointer(%7567) : (i64) -> ()
      %7571 = llvm.mlir.addressof @str859 : !llvm.ptr
      %7572 = arith.constant 8 : i64
      %7573 = func.call @cc_make_string(%7571, %7572) : (!llvm.ptr, i64) -> i64
      %7574 = llvm.mlir.addressof @str860 : !llvm.ptr
      %7575 = arith.constant 11 : i64
      %7576 = func.call @cc_make_string(%7574, %7575) : (!llvm.ptr, i64) -> i64
      %7577 = func.call @cc_intern(%7573, %7576) : (i64, i64) -> i64
      %7578 = func.call @cc_nil_value() : () -> i64
      %7579 = func.call @cc_cons(%7577, %7578) : (i64, i64) -> i64
      %7580 = func.call @cc_values_pack(%7579) : (i64) -> i64
      func.call @stack_push_pointer(%7577) : (i64) -> ()
      %7581 = llvm.mlir.addressof @str861 : !llvm.ptr
      %7582 = arith.constant 7 : i64
      %7583 = func.call @cc_make_string(%7581, %7582) : (!llvm.ptr, i64) -> i64
      %7584 = llvm.mlir.addressof @str862 : !llvm.ptr
      %7585 = arith.constant 11 : i64
      %7586 = func.call @cc_make_string(%7584, %7585) : (!llvm.ptr, i64) -> i64
      %7587 = func.call @cc_intern(%7583, %7586) : (i64, i64) -> i64
      %7588 = func.call @cc_nil_value() : () -> i64
      %7589 = func.call @cc_cons(%7587, %7588) : (i64, i64) -> i64
      %7590 = func.call @cc_values_pack(%7589) : (i64) -> i64
      func.call @stack_push_pointer(%7587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7591 = func.call @stack_pop_pointer() : () -> i64
      %7592 = func.call @stack_pop_pointer() : () -> i64
      %7593 = func.call @cc_cons(%7592, %7591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %7594 = arith.addi %7593, %__rlasp_stack_elide_zero_248 : i64
      %7595 = func.call @stack_pop_pointer() : () -> i64
      %7596 = func.call @cc_cons(%7595, %7594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %7597 = arith.addi %7596, %__rlasp_stack_elide_zero_249 : i64
      %7598 = func.call @stack_pop_pointer() : () -> i64
      %7599 = func.call @cc_cons(%7598, %7597) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %7600 = arith.addi %7599, %__rlasp_stack_elide_zero_250 : i64
      %7601 = func.call @stack_pop_pointer() : () -> i64
      %7602 = func.call @cc_cons(%7601, %7600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %7603 = arith.addi %7602, %__rlasp_stack_elide_zero_251 : i64
      %7604 = func.call @stack_pop_pointer() : () -> i64
      %7605 = func.call @cc_cons(%7604, %7603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %7606 = arith.addi %7605, %__rlasp_stack_elide_zero_252 : i64
      %7607 = func.call @stack_pop_pointer() : () -> i64
      %7608 = func.call @cc_cons(%7607, %7606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %7609 = arith.addi %7608, %__rlasp_stack_elide_zero_253 : i64
      %7610 = func.call @stack_pop_pointer() : () -> i64
      %7611 = func.call @cc_cons(%7610, %7609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %7612 = arith.addi %7611, %__rlasp_stack_elide_zero_254 : i64
      %7613 = func.call @stack_pop_pointer() : () -> i64
      %7614 = func.call @cc_cons(%7613, %7612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %7615 = arith.addi %7614, %__rlasp_stack_elide_zero_255 : i64
      %7616 = func.call @stack_pop_pointer() : () -> i64
      %7617 = func.call @cc_cons(%7616, %7615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %7618 = arith.addi %7617, %__rlasp_stack_elide_zero_256 : i64
      %7619 = func.call @stack_pop_pointer() : () -> i64
      %7620 = func.call @cc_cons(%7619, %7618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %7621 = arith.addi %7620, %__rlasp_stack_elide_zero_257 : i64
      %7622 = func.call @stack_pop_pointer() : () -> i64
      %7623 = func.call @cc_cons(%7622, %7621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %7624 = arith.addi %7623, %__rlasp_stack_elide_zero_258 : i64
      %7625 = func.call @stack_pop_pointer() : () -> i64
      %7626 = func.call @cc_cons(%7625, %7624) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %7627 = arith.addi %7626, %__rlasp_stack_elide_zero_259 : i64
      %7628 = func.call @stack_pop_pointer() : () -> i64
      %7629 = func.call @cc_cons(%7628, %7627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %7630 = arith.addi %7629, %__rlasp_stack_elide_zero_260 : i64
      %7631 = func.call @stack_pop_pointer() : () -> i64
      %7632 = func.call @cc_cons(%7631, %7630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %7633 = arith.addi %7632, %__rlasp_stack_elide_zero_261 : i64
      %7634 = func.call @stack_pop_pointer() : () -> i64
      %7635 = func.call @cc_cons(%7634, %7633) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %7636 = arith.addi %7635, %__rlasp_stack_elide_zero_262 : i64
      %7637 = func.call @stack_pop_pointer() : () -> i64
      %7638 = func.call @cc_cons(%7637, %7636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %7639 = arith.addi %7638, %__rlasp_stack_elide_zero_263 : i64
      %7640 = func.call @stack_pop_pointer() : () -> i64
      %7641 = func.call @cc_cons(%7640, %7639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %7642 = arith.addi %7641, %__rlasp_stack_elide_zero_264 : i64
      %7643 = func.call @stack_pop_pointer() : () -> i64
      %7644 = func.call @cc_cons(%7643, %7642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %7645 = arith.addi %7644, %__rlasp_stack_elide_zero_265 : i64
      %7646 = func.call @stack_pop_pointer() : () -> i64
      %7647 = func.call @cc_cons(%7646, %7645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %7648 = arith.addi %7647, %__rlasp_stack_elide_zero_266 : i64
      %7649 = func.call @stack_pop_pointer() : () -> i64
      %7650 = func.call @cc_cons(%7649, %7648) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %7651 = arith.addi %7650, %__rlasp_stack_elide_zero_267 : i64
      %7652 = func.call @stack_pop_pointer() : () -> i64
      %7653 = func.call @cc_cons(%7652, %7651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %7654 = arith.addi %7653, %__rlasp_stack_elide_zero_268 : i64
      %7655 = func.call @stack_pop_pointer() : () -> i64
      %7656 = func.call @cc_cons(%7655, %7654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %7657 = arith.addi %7656, %__rlasp_stack_elide_zero_269 : i64
      %7658 = func.call @stack_pop_pointer() : () -> i64
      %7659 = func.call @cc_cons(%7658, %7657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %7660 = arith.addi %7659, %__rlasp_stack_elide_zero_270 : i64
      %7661 = func.call @stack_pop_pointer() : () -> i64
      %7662 = func.call @cc_cons(%7661, %7660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %7663 = arith.addi %7662, %__rlasp_stack_elide_zero_271 : i64
      %7664 = func.call @stack_pop_pointer() : () -> i64
      %7665 = func.call @cc_cons(%7664, %7663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %7666 = arith.addi %7665, %__rlasp_stack_elide_zero_272 : i64
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = func.call @cc_cons(%7667, %7666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %7669 = arith.addi %7668, %__rlasp_stack_elide_zero_273 : i64
      %7670 = func.call @stack_pop_pointer() : () -> i64
      %7671 = func.call @cc_cons(%7670, %7669) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %7672 = arith.addi %7671, %__rlasp_stack_elide_zero_274 : i64
      %7673 = func.call @stack_pop_pointer() : () -> i64
      %7674 = func.call @cc_cons(%7673, %7672) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %7675 = arith.addi %7674, %__rlasp_stack_elide_zero_275 : i64
      %7676 = func.call @stack_pop_pointer() : () -> i64
      %7677 = func.call @cc_cons(%7676, %7675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %7678 = arith.addi %7677, %__rlasp_stack_elide_zero_276 : i64
      %7679 = func.call @stack_pop_pointer() : () -> i64
      %7680 = func.call @cc_cons(%7679, %7678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %7681 = arith.addi %7680, %__rlasp_stack_elide_zero_277 : i64
      %7682 = func.call @stack_pop_pointer() : () -> i64
      %7683 = func.call @cc_cons(%7682, %7681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %7684 = arith.addi %7683, %__rlasp_stack_elide_zero_278 : i64
      %7685 = func.call @stack_pop_pointer() : () -> i64
      %7686 = func.call @cc_cons(%7685, %7684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %7687 = arith.addi %7686, %__rlasp_stack_elide_zero_279 : i64
      %7688 = func.call @stack_pop_pointer() : () -> i64
      %7689 = func.call @cc_cons(%7688, %7687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %7690 = arith.addi %7689, %__rlasp_stack_elide_zero_280 : i64
      %7691 = func.call @stack_pop_pointer() : () -> i64
      %7692 = func.call @cc_cons(%7691, %7690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %7693 = arith.addi %7692, %__rlasp_stack_elide_zero_281 : i64
      %7694 = func.call @stack_pop_pointer() : () -> i64
      %7695 = func.call @cc_cons(%7694, %7693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %7696 = arith.addi %7695, %__rlasp_stack_elide_zero_282 : i64
      %7697 = func.call @stack_pop_pointer() : () -> i64
      %7698 = func.call @cc_cons(%7697, %7696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %7699 = arith.addi %7698, %__rlasp_stack_elide_zero_283 : i64
      %7700 = func.call @stack_pop_pointer() : () -> i64
      %7701 = func.call @cc_cons(%7700, %7699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %7702 = arith.addi %7701, %__rlasp_stack_elide_zero_284 : i64
      %7703 = func.call @stack_pop_pointer() : () -> i64
      %7704 = func.call @cc_cons(%7703, %7702) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %7705 = arith.addi %7704, %__rlasp_stack_elide_zero_285 : i64
      %7706 = func.call @stack_pop_pointer() : () -> i64
      %7707 = func.call @cc_cons(%7706, %7705) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %7708 = arith.addi %7707, %__rlasp_stack_elide_zero_286 : i64
      %7709 = func.call @stack_pop_pointer() : () -> i64
      %7710 = func.call @cc_cons(%7709, %7708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %7711 = arith.addi %7710, %__rlasp_stack_elide_zero_287 : i64
      %7712 = func.call @stack_pop_pointer() : () -> i64
      %7713 = func.call @cc_cons(%7712, %7711) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %7714 = arith.addi %7713, %__rlasp_stack_elide_zero_288 : i64
      %7715 = func.call @stack_pop_pointer() : () -> i64
      %7716 = func.call @cc_cons(%7715, %7714) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %7717 = arith.addi %7716, %__rlasp_stack_elide_zero_289 : i64
      %7718 = func.call @stack_pop_pointer() : () -> i64
      %7719 = func.call @cc_cons(%7718, %7717) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %7720 = arith.addi %7719, %__rlasp_stack_elide_zero_290 : i64
      %7721 = func.call @stack_pop_pointer() : () -> i64
      %7722 = func.call @cc_cons(%7721, %7720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %7723 = arith.addi %7722, %__rlasp_stack_elide_zero_291 : i64
      %7724 = func.call @stack_pop_pointer() : () -> i64
      %7725 = func.call @cc_cons(%7724, %7723) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %7726 = arith.addi %7725, %__rlasp_stack_elide_zero_292 : i64
      %7727 = func.call @stack_pop_pointer() : () -> i64
      %7728 = func.call @cc_cons(%7727, %7726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %7729 = arith.addi %7728, %__rlasp_stack_elide_zero_293 : i64
      %7730 = func.call @stack_pop_pointer() : () -> i64
      %7731 = func.call @cc_cons(%7730, %7729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %7732 = arith.addi %7731, %__rlasp_stack_elide_zero_294 : i64
      %7733 = func.call @stack_pop_pointer() : () -> i64
      %7734 = func.call @cc_cons(%7733, %7732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %7735 = arith.addi %7734, %__rlasp_stack_elide_zero_295 : i64
      %7736 = func.call @stack_pop_pointer() : () -> i64
      %7737 = func.call @cc_cons(%7736, %7735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %7738 = arith.addi %7737, %__rlasp_stack_elide_zero_296 : i64
      %7739 = func.call @stack_pop_pointer() : () -> i64
      %7740 = func.call @cc_cons(%7739, %7738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %7741 = arith.addi %7740, %__rlasp_stack_elide_zero_297 : i64
      %7742 = func.call @stack_pop_pointer() : () -> i64
      %7743 = func.call @cc_cons(%7742, %7741) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %7744 = arith.addi %7743, %__rlasp_stack_elide_zero_298 : i64
      %7745 = func.call @stack_pop_pointer() : () -> i64
      %7746 = func.call @cc_cons(%7745, %7744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %7747 = arith.addi %7746, %__rlasp_stack_elide_zero_299 : i64
      %7748 = func.call @stack_pop_pointer() : () -> i64
      %7749 = func.call @cc_cons(%7748, %7747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %7750 = arith.addi %7749, %__rlasp_stack_elide_zero_300 : i64
      %7751 = func.call @stack_pop_pointer() : () -> i64
      %7752 = func.call @cc_cons(%7751, %7750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %7753 = arith.addi %7752, %__rlasp_stack_elide_zero_301 : i64
      %7754 = func.call @stack_pop_pointer() : () -> i64
      %7755 = func.call @cc_cons(%7754, %7753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %7756 = arith.addi %7755, %__rlasp_stack_elide_zero_302 : i64
      %7757 = func.call @stack_pop_pointer() : () -> i64
      %7758 = func.call @cc_cons(%7757, %7756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %7759 = arith.addi %7758, %__rlasp_stack_elide_zero_303 : i64
      %7760 = func.call @stack_pop_pointer() : () -> i64
      %7761 = func.call @cc_cons(%7760, %7759) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %7762 = arith.addi %7761, %__rlasp_stack_elide_zero_304 : i64
      %7763 = func.call @stack_pop_pointer() : () -> i64
      %7764 = func.call @cc_cons(%7763, %7762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %7765 = arith.addi %7764, %__rlasp_stack_elide_zero_305 : i64
      %7766 = func.call @stack_pop_pointer() : () -> i64
      %7767 = func.call @cc_cons(%7766, %7765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %7768 = arith.addi %7767, %__rlasp_stack_elide_zero_306 : i64
      %7769 = func.call @stack_pop_pointer() : () -> i64
      %7770 = func.call @cc_cons(%7769, %7768) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %7771 = arith.addi %7770, %__rlasp_stack_elide_zero_307 : i64
      %7772 = func.call @stack_pop_pointer() : () -> i64
      %7773 = func.call @cc_cons(%7772, %7771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %7774 = arith.addi %7773, %__rlasp_stack_elide_zero_308 : i64
      %7775 = func.call @stack_pop_pointer() : () -> i64
      %7776 = func.call @cc_cons(%7775, %7774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %7777 = arith.addi %7776, %__rlasp_stack_elide_zero_309 : i64
      %7778 = func.call @stack_pop_pointer() : () -> i64
      %7779 = func.call @cc_cons(%7778, %7777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %7780 = arith.addi %7779, %__rlasp_stack_elide_zero_310 : i64
      %7781 = func.call @stack_pop_pointer() : () -> i64
      %7782 = func.call @cc_cons(%7781, %7780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %7783 = arith.addi %7782, %__rlasp_stack_elide_zero_311 : i64
      %7784 = func.call @stack_pop_pointer() : () -> i64
      %7785 = func.call @cc_cons(%7784, %7783) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %7786 = arith.addi %7785, %__rlasp_stack_elide_zero_312 : i64
      %7787 = func.call @stack_pop_pointer() : () -> i64
      %7788 = func.call @cc_cons(%7787, %7786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %7789 = arith.addi %7788, %__rlasp_stack_elide_zero_313 : i64
      %7790 = func.call @stack_pop_pointer() : () -> i64
      %7791 = func.call @cc_cons(%7790, %7789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %7792 = arith.addi %7791, %__rlasp_stack_elide_zero_314 : i64
      %7793 = func.call @stack_pop_pointer() : () -> i64
      %7794 = func.call @cc_cons(%7793, %7792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %7795 = arith.addi %7794, %__rlasp_stack_elide_zero_315 : i64
      %7796 = func.call @stack_pop_pointer() : () -> i64
      %7797 = func.call @cc_cons(%7796, %7795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %7798 = arith.addi %7797, %__rlasp_stack_elide_zero_316 : i64
      %7799 = func.call @stack_pop_pointer() : () -> i64
      %7800 = func.call @cc_cons(%7799, %7798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %7801 = arith.addi %7800, %__rlasp_stack_elide_zero_317 : i64
      %7802 = func.call @stack_pop_pointer() : () -> i64
      %7803 = func.call @cc_cons(%7802, %7801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %7804 = arith.addi %7803, %__rlasp_stack_elide_zero_318 : i64
      %7805 = func.call @stack_pop_pointer() : () -> i64
      %7806 = func.call @cc_cons(%7805, %7804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %7807 = arith.addi %7806, %__rlasp_stack_elide_zero_319 : i64
      %7808 = func.call @stack_pop_pointer() : () -> i64
      %7809 = func.call @cc_cons(%7808, %7807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %7810 = arith.addi %7809, %__rlasp_stack_elide_zero_320 : i64
      %7811 = func.call @stack_pop_pointer() : () -> i64
      %7812 = func.call @cc_cons(%7811, %7810) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %7813 = arith.addi %7812, %__rlasp_stack_elide_zero_321 : i64
      %7814 = func.call @stack_pop_pointer() : () -> i64
      %7815 = func.call @cc_cons(%7814, %7813) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %7816 = arith.addi %7815, %__rlasp_stack_elide_zero_322 : i64
      %7817 = func.call @stack_pop_pointer() : () -> i64
      %7818 = func.call @cc_cons(%7817, %7816) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %7819 = arith.addi %7818, %__rlasp_stack_elide_zero_323 : i64
      %7820 = func.call @stack_pop_pointer() : () -> i64
      %7821 = func.call @cc_cons(%7820, %7819) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %7822 = arith.addi %7821, %__rlasp_stack_elide_zero_324 : i64
      %7823 = func.call @stack_pop_pointer() : () -> i64
      %7824 = func.call @cc_cons(%7823, %7822) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %7825 = arith.addi %7824, %__rlasp_stack_elide_zero_325 : i64
      %7826 = func.call @stack_pop_pointer() : () -> i64
      %7827 = func.call @cc_cons(%7826, %7825) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %7828 = arith.addi %7827, %__rlasp_stack_elide_zero_326 : i64
      %7829 = func.call @stack_pop_pointer() : () -> i64
      %7830 = func.call @cc_cons(%7829, %7828) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %7831 = arith.addi %7830, %__rlasp_stack_elide_zero_327 : i64
      %7832 = func.call @stack_pop_pointer() : () -> i64
      %7833 = func.call @cc_cons(%7832, %7831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %7834 = arith.addi %7833, %__rlasp_stack_elide_zero_328 : i64
      %7835 = func.call @stack_pop_pointer() : () -> i64
      %7836 = func.call @cc_cons(%7835, %7834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %7837 = arith.addi %7836, %__rlasp_stack_elide_zero_329 : i64
      %7838 = func.call @stack_pop_pointer() : () -> i64
      %7839 = func.call @cc_cons(%7838, %7837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %7840 = arith.addi %7839, %__rlasp_stack_elide_zero_330 : i64
      %7841 = func.call @stack_pop_pointer() : () -> i64
      %7842 = func.call @cc_cons(%7841, %7840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %7843 = arith.addi %7842, %__rlasp_stack_elide_zero_331 : i64
      %7844 = func.call @stack_pop_pointer() : () -> i64
      %7845 = func.call @cc_cons(%7844, %7843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %7846 = arith.addi %7845, %__rlasp_stack_elide_zero_332 : i64
      %7847 = func.call @stack_pop_pointer() : () -> i64
      %7848 = func.call @cc_cons(%7847, %7846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %7849 = arith.addi %7848, %__rlasp_stack_elide_zero_333 : i64
      %7850 = func.call @stack_pop_pointer() : () -> i64
      %7851 = func.call @cc_cons(%7850, %7849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %7852 = arith.addi %7851, %__rlasp_stack_elide_zero_334 : i64
      %7853 = func.call @stack_pop_pointer() : () -> i64
      %7854 = func.call @cc_cons(%7853, %7852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %7855 = arith.addi %7854, %__rlasp_stack_elide_zero_335 : i64
      %7856 = func.call @stack_pop_pointer() : () -> i64
      %7857 = func.call @cc_cons(%7856, %7855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %7858 = arith.addi %7857, %__rlasp_stack_elide_zero_336 : i64
      %7859 = func.call @stack_pop_pointer() : () -> i64
      %7860 = func.call @cc_cons(%7859, %7858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %7861 = arith.addi %7860, %__rlasp_stack_elide_zero_337 : i64
      %7862 = func.call @stack_pop_pointer() : () -> i64
      %7863 = func.call @cc_cons(%7862, %7861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %7864 = arith.addi %7863, %__rlasp_stack_elide_zero_338 : i64
      %7865 = func.call @stack_pop_pointer() : () -> i64
      %7866 = func.call @cc_cons(%7865, %7864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %7867 = arith.addi %7866, %__rlasp_stack_elide_zero_339 : i64
      %7868 = func.call @stack_pop_pointer() : () -> i64
      %7869 = func.call @cc_cons(%7868, %7867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %7870 = arith.addi %7869, %__rlasp_stack_elide_zero_340 : i64
      %7871 = func.call @stack_pop_pointer() : () -> i64
      %7872 = func.call @cc_cons(%7871, %7870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %7873 = arith.addi %7872, %__rlasp_stack_elide_zero_341 : i64
      %7874 = func.call @stack_pop_pointer() : () -> i64
      %7875 = func.call @cc_cons(%7874, %7873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %7876 = arith.addi %7875, %__rlasp_stack_elide_zero_342 : i64
      %7877 = func.call @stack_pop_pointer() : () -> i64
      %7878 = func.call @cc_cons(%7877, %7876) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %7879 = arith.addi %7878, %__rlasp_stack_elide_zero_343 : i64
      %7880 = func.call @stack_pop_pointer() : () -> i64
      %7881 = func.call @cc_cons(%7880, %7879) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %7882 = arith.addi %7881, %__rlasp_stack_elide_zero_344 : i64
      %7883 = func.call @stack_pop_pointer() : () -> i64
      %7884 = func.call @cc_cons(%7883, %7882) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %7885 = arith.addi %7884, %__rlasp_stack_elide_zero_345 : i64
      %7886 = func.call @stack_pop_pointer() : () -> i64
      %7887 = func.call @cc_cons(%7886, %7885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %7888 = arith.addi %7887, %__rlasp_stack_elide_zero_346 : i64
      %7889 = func.call @stack_pop_pointer() : () -> i64
      %7890 = func.call @cc_cons(%7889, %7888) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %7891 = arith.addi %7890, %__rlasp_stack_elide_zero_347 : i64
      %7892 = func.call @stack_pop_pointer() : () -> i64
      %7893 = func.call @cc_cons(%7892, %7891) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %7894 = arith.addi %7893, %__rlasp_stack_elide_zero_348 : i64
      %7895 = func.call @stack_pop_pointer() : () -> i64
      %7896 = func.call @cc_cons(%7895, %7894) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %7897 = arith.addi %7896, %__rlasp_stack_elide_zero_349 : i64
      %7898 = func.call @stack_pop_pointer() : () -> i64
      %7899 = func.call @cc_cons(%7898, %7897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %7900 = arith.addi %7899, %__rlasp_stack_elide_zero_350 : i64
      %7901 = func.call @stack_pop_pointer() : () -> i64
      %7902 = func.call @cc_cons(%7901, %7900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %7903 = arith.addi %7902, %__rlasp_stack_elide_zero_351 : i64
      %7904 = func.call @stack_pop_pointer() : () -> i64
      %7905 = func.call @cc_cons(%7904, %7903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %7906 = arith.addi %7905, %__rlasp_stack_elide_zero_352 : i64
      %7907 = func.call @stack_pop_pointer() : () -> i64
      %7908 = func.call @cc_cons(%7907, %7906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %7909 = arith.addi %7908, %__rlasp_stack_elide_zero_353 : i64
      %7910 = func.call @stack_pop_pointer() : () -> i64
      %7911 = func.call @cc_cons(%7910, %7909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %7912 = arith.addi %7911, %__rlasp_stack_elide_zero_354 : i64
      %7913 = func.call @stack_pop_pointer() : () -> i64
      %7914 = func.call @cc_cons(%7913, %7912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %7915 = arith.addi %7914, %__rlasp_stack_elide_zero_355 : i64
      %7916 = func.call @stack_pop_pointer() : () -> i64
      %7917 = func.call @cc_cons(%7916, %7915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %7918 = arith.addi %7917, %__rlasp_stack_elide_zero_356 : i64
      %7919 = func.call @stack_pop_pointer() : () -> i64
      %7920 = func.call @cc_cons(%7919, %7918) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %7921 = arith.addi %7920, %__rlasp_stack_elide_zero_357 : i64
      %7922 = func.call @stack_pop_pointer() : () -> i64
      %7923 = func.call @cc_cons(%7922, %7921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %7924 = arith.addi %7923, %__rlasp_stack_elide_zero_358 : i64
      %7925 = func.call @stack_pop_pointer() : () -> i64
      %7926 = func.call @cc_cons(%7925, %7924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %7927 = arith.addi %7926, %__rlasp_stack_elide_zero_359 : i64
      %7928 = func.call @stack_pop_pointer() : () -> i64
      %7929 = func.call @cc_cons(%7928, %7927) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %7930 = arith.addi %7929, %__rlasp_stack_elide_zero_360 : i64
      %7931 = func.call @stack_pop_pointer() : () -> i64
      %7932 = func.call @cc_cons(%7931, %7930) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %7933 = arith.addi %7932, %__rlasp_stack_elide_zero_361 : i64
      %7934 = func.call @stack_pop_pointer() : () -> i64
      %7935 = func.call @cc_cons(%7934, %7933) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %7936 = arith.addi %7935, %__rlasp_stack_elide_zero_362 : i64
      %7937 = func.call @stack_pop_pointer() : () -> i64
      %7938 = func.call @cc_cons(%7937, %7936) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %7939 = arith.addi %7938, %__rlasp_stack_elide_zero_363 : i64
      %7940 = func.call @stack_pop_pointer() : () -> i64
      %7941 = func.call @cc_cons(%7940, %7939) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %7942 = arith.addi %7941, %__rlasp_stack_elide_zero_364 : i64
      %7943 = func.call @stack_pop_pointer() : () -> i64
      %7944 = func.call @cc_cons(%7943, %7942) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %7945 = arith.addi %7944, %__rlasp_stack_elide_zero_365 : i64
      %7946 = func.call @stack_pop_pointer() : () -> i64
      %7947 = func.call @cc_cons(%7946, %7945) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %7948 = arith.addi %7947, %__rlasp_stack_elide_zero_366 : i64
      %7949 = func.call @stack_pop_pointer() : () -> i64
      %7950 = func.call @cc_cons(%7949, %7948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %7951 = arith.addi %7950, %__rlasp_stack_elide_zero_367 : i64
      %7952 = func.call @stack_pop_pointer() : () -> i64
      %7953 = func.call @cc_cons(%7952, %7951) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %7954 = arith.addi %7953, %__rlasp_stack_elide_zero_368 : i64
      %7955 = func.call @stack_pop_pointer() : () -> i64
      %7956 = func.call @cc_cons(%7955, %7954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %7957 = arith.addi %7956, %__rlasp_stack_elide_zero_369 : i64
      %7958 = func.call @stack_pop_pointer() : () -> i64
      %7959 = func.call @cc_cons(%7958, %7957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %7960 = arith.addi %7959, %__rlasp_stack_elide_zero_370 : i64
      %7961 = func.call @stack_pop_pointer() : () -> i64
      %7962 = func.call @cc_cons(%7961, %7960) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %7963 = arith.addi %7962, %__rlasp_stack_elide_zero_371 : i64
      %7964 = func.call @stack_pop_pointer() : () -> i64
      %7965 = func.call @cc_cons(%7964, %7963) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %7966 = arith.addi %7965, %__rlasp_stack_elide_zero_372 : i64
      %7967 = func.call @stack_pop_pointer() : () -> i64
      %7968 = func.call @cc_cons(%7967, %7966) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %7969 = arith.addi %7968, %__rlasp_stack_elide_zero_373 : i64
      %7970 = func.call @stack_pop_pointer() : () -> i64
      %7971 = func.call @cc_cons(%7970, %7969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %7972 = arith.addi %7971, %__rlasp_stack_elide_zero_374 : i64
      %7973 = func.call @stack_pop_pointer() : () -> i64
      %7974 = func.call @cc_cons(%7973, %7972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %7975 = arith.addi %7974, %__rlasp_stack_elide_zero_375 : i64
      %7976 = func.call @stack_pop_pointer() : () -> i64
      %7977 = func.call @cc_cons(%7976, %7975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %7978 = arith.addi %7977, %__rlasp_stack_elide_zero_376 : i64
      %7979 = func.call @stack_pop_pointer() : () -> i64
      %7980 = func.call @cc_cons(%7979, %7978) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %7981 = arith.addi %7980, %__rlasp_stack_elide_zero_377 : i64
      %7982 = func.call @stack_pop_pointer() : () -> i64
      %7983 = func.call @cc_cons(%7982, %7981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %7984 = arith.addi %7983, %__rlasp_stack_elide_zero_378 : i64
      %7985 = func.call @stack_pop_pointer() : () -> i64
      %7986 = func.call @cc_cons(%7985, %7984) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %7987 = arith.addi %7986, %__rlasp_stack_elide_zero_379 : i64
      %7988 = func.call @stack_pop_pointer() : () -> i64
      %7989 = func.call @cc_cons(%7988, %7987) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %7990 = arith.addi %7989, %__rlasp_stack_elide_zero_380 : i64
      %7991 = func.call @stack_pop_pointer() : () -> i64
      %7992 = func.call @cc_cons(%7991, %7990) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
      %7993 = arith.addi %7992, %__rlasp_stack_elide_zero_381 : i64
      %7994 = func.call @stack_pop_pointer() : () -> i64
      %7995 = func.call @cc_cons(%7994, %7993) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
      %7996 = arith.addi %7995, %__rlasp_stack_elide_zero_382 : i64
      %7997 = func.call @stack_pop_pointer() : () -> i64
      %7998 = func.call @cc_cons(%7997, %7996) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
      %7999 = arith.addi %7998, %__rlasp_stack_elide_zero_383 : i64
      %8000 = func.call @stack_pop_pointer() : () -> i64
      %8001 = func.call @cc_cons(%8000, %7999) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
      %8002 = arith.addi %8001, %__rlasp_stack_elide_zero_384 : i64
      %8003 = func.call @stack_pop_pointer() : () -> i64
      %8004 = func.call @cc_cons(%8003, %8002) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
      %8005 = arith.addi %8004, %__rlasp_stack_elide_zero_385 : i64
      %8006 = func.call @stack_pop_pointer() : () -> i64
      %8007 = func.call @cc_cons(%8006, %8005) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
      %8008 = arith.addi %8007, %__rlasp_stack_elide_zero_386 : i64
      %8009 = func.call @stack_pop_pointer() : () -> i64
      %8010 = func.call @cc_cons(%8009, %8008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
      %8011 = arith.addi %8010, %__rlasp_stack_elide_zero_387 : i64
      %8012 = func.call @stack_pop_pointer() : () -> i64
      %8013 = func.call @cc_cons(%8012, %8011) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %8014 = arith.addi %8013, %__rlasp_stack_elide_zero_388 : i64
      %8015 = func.call @stack_pop_pointer() : () -> i64
      %8016 = func.call @cc_cons(%8015, %8014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
      %8017 = arith.addi %8016, %__rlasp_stack_elide_zero_389 : i64
      %8018 = func.call @stack_pop_pointer() : () -> i64
      %8019 = func.call @cc_cons(%8018, %8017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
      %8020 = arith.addi %8019, %__rlasp_stack_elide_zero_390 : i64
      %8021 = func.call @stack_pop_pointer() : () -> i64
      %8022 = func.call @cc_cons(%8021, %8020) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
      %8023 = arith.addi %8022, %__rlasp_stack_elide_zero_391 : i64
      %8024 = func.call @stack_pop_pointer() : () -> i64
      %8025 = func.call @cc_cons(%8024, %8023) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
      %8026 = arith.addi %8025, %__rlasp_stack_elide_zero_392 : i64
      %8027 = func.call @stack_pop_pointer() : () -> i64
      %8028 = func.call @cc_cons(%8027, %8026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
      %8029 = arith.addi %8028, %__rlasp_stack_elide_zero_393 : i64
      %8030 = func.call @stack_pop_pointer() : () -> i64
      %8031 = func.call @cc_cons(%8030, %8029) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
      %8032 = arith.addi %8031, %__rlasp_stack_elide_zero_394 : i64
      %8033 = func.call @stack_pop_pointer() : () -> i64
      %8034 = func.call @cc_cons(%8033, %8032) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %8035 = arith.addi %8034, %__rlasp_stack_elide_zero_395 : i64
      %8036 = func.call @stack_pop_pointer() : () -> i64
      %8037 = func.call @cc_cons(%8036, %8035) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
      %8038 = arith.addi %8037, %__rlasp_stack_elide_zero_396 : i64
      %8039 = func.call @stack_pop_pointer() : () -> i64
      %8040 = func.call @cc_cons(%8039, %8038) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
      %8041 = arith.addi %8040, %__rlasp_stack_elide_zero_397 : i64
      %8042 = func.call @stack_pop_pointer() : () -> i64
      %8043 = func.call @cc_cons(%8042, %8041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
      %8044 = arith.addi %8043, %__rlasp_stack_elide_zero_398 : i64
      %8045 = func.call @stack_pop_pointer() : () -> i64
      %8046 = func.call @cc_cons(%8045, %8044) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
      %8047 = arith.addi %8046, %__rlasp_stack_elide_zero_399 : i64
      %8048 = func.call @stack_pop_pointer() : () -> i64
      %8049 = func.call @cc_cons(%8048, %8047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
      %8050 = arith.addi %8049, %__rlasp_stack_elide_zero_400 : i64
      %8051 = func.call @stack_pop_pointer() : () -> i64
      %8052 = func.call @cc_cons(%8051, %8050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
      %8053 = arith.addi %8052, %__rlasp_stack_elide_zero_401 : i64
      %8054 = func.call @stack_pop_pointer() : () -> i64
      %8055 = func.call @cc_cons(%8054, %8053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
      %8056 = arith.addi %8055, %__rlasp_stack_elide_zero_402 : i64
      %8057 = func.call @stack_pop_pointer() : () -> i64
      %8058 = func.call @cc_cons(%8057, %8056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
      %8059 = arith.addi %8058, %__rlasp_stack_elide_zero_403 : i64
      %8060 = func.call @stack_pop_pointer() : () -> i64
      %8061 = func.call @cc_cons(%8060, %8059) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
      %8062 = arith.addi %8061, %__rlasp_stack_elide_zero_404 : i64
      %8063 = func.call @stack_pop_pointer() : () -> i64
      %8064 = func.call @cc_cons(%8063, %8062) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
      %8065 = arith.addi %8064, %__rlasp_stack_elide_zero_405 : i64
      %8066 = func.call @stack_pop_pointer() : () -> i64
      %8067 = func.call @cc_cons(%8066, %8065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
      %8068 = arith.addi %8067, %__rlasp_stack_elide_zero_406 : i64
      %8069 = func.call @stack_pop_pointer() : () -> i64
      %8070 = func.call @cc_cons(%8069, %8068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
      %8071 = arith.addi %8070, %__rlasp_stack_elide_zero_407 : i64
      %8072 = func.call @stack_pop_pointer() : () -> i64
      %8073 = func.call @cc_cons(%8072, %8071) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
      %8074 = arith.addi %8073, %__rlasp_stack_elide_zero_408 : i64
      %8075 = func.call @stack_pop_pointer() : () -> i64
      %8076 = func.call @cc_cons(%8075, %8074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
      %8077 = arith.addi %8076, %__rlasp_stack_elide_zero_409 : i64
      %8078 = func.call @stack_pop_pointer() : () -> i64
      %8079 = func.call @cc_cons(%8078, %8077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
      %8080 = arith.addi %8079, %__rlasp_stack_elide_zero_410 : i64
      %8081 = func.call @stack_pop_pointer() : () -> i64
      %8082 = func.call @cc_cons(%8081, %8080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
      %8083 = arith.addi %8082, %__rlasp_stack_elide_zero_411 : i64
      %8084 = func.call @stack_pop_pointer() : () -> i64
      %8085 = func.call @cc_cons(%8084, %8083) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
      %8086 = arith.addi %8085, %__rlasp_stack_elide_zero_412 : i64
      %8087 = func.call @stack_pop_pointer() : () -> i64
      %8088 = func.call @cc_cons(%8087, %8086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
      %8089 = arith.addi %8088, %__rlasp_stack_elide_zero_413 : i64
      %8090 = func.call @stack_pop_pointer() : () -> i64
      %8091 = func.call @cc_cons(%8090, %8089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
      %8092 = arith.addi %8091, %__rlasp_stack_elide_zero_414 : i64
      %8093 = func.call @stack_pop_pointer() : () -> i64
      %8094 = func.call @cc_cons(%8093, %8092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
      %8095 = arith.addi %8094, %__rlasp_stack_elide_zero_415 : i64
      %8096 = func.call @stack_pop_pointer() : () -> i64
      %8097 = func.call @cc_cons(%8096, %8095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
      %8098 = arith.addi %8097, %__rlasp_stack_elide_zero_416 : i64
      %8099 = func.call @stack_pop_pointer() : () -> i64
      %8100 = func.call @cc_cons(%8099, %8098) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
      %8101 = arith.addi %8100, %__rlasp_stack_elide_zero_417 : i64
      %8102 = func.call @stack_pop_pointer() : () -> i64
      %8103 = func.call @cc_cons(%8102, %8101) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %8104 = arith.addi %8103, %__rlasp_stack_elide_zero_418 : i64
      %8105 = func.call @stack_pop_pointer() : () -> i64
      %8106 = func.call @cc_cons(%8105, %8104) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
      %8107 = arith.addi %8106, %__rlasp_stack_elide_zero_419 : i64
      %8108 = func.call @stack_pop_pointer() : () -> i64
      %8109 = func.call @cc_cons(%8108, %8107) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
      %8110 = arith.addi %8109, %__rlasp_stack_elide_zero_420 : i64
      %8111 = func.call @stack_pop_pointer() : () -> i64
      %8112 = func.call @cc_cons(%8111, %8110) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
      %8113 = arith.addi %8112, %__rlasp_stack_elide_zero_421 : i64
      %8114 = func.call @stack_pop_pointer() : () -> i64
      %8115 = func.call @cc_cons(%8114, %8113) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %8116 = arith.addi %8115, %__rlasp_stack_elide_zero_422 : i64
      %8117 = func.call @stack_pop_pointer() : () -> i64
      %8118 = func.call @cc_cons(%8117, %8116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %8119 = arith.addi %8118, %__rlasp_stack_elide_zero_423 : i64
      %8120 = func.call @stack_pop_pointer() : () -> i64
      %8121 = func.call @cc_cons(%8120, %8119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %8122 = arith.addi %8121, %__rlasp_stack_elide_zero_424 : i64
      %8123 = func.call @stack_pop_pointer() : () -> i64
      %8124 = func.call @cc_cons(%8123, %8122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
      %8125 = arith.addi %8124, %__rlasp_stack_elide_zero_425 : i64
      %8126 = func.call @stack_pop_pointer() : () -> i64
      %8127 = func.call @cc_cons(%8126, %8125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
      %8128 = arith.addi %8127, %__rlasp_stack_elide_zero_426 : i64
      %8129 = func.call @stack_pop_pointer() : () -> i64
      %8130 = func.call @cc_cons(%8129, %8128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
      %8131 = arith.addi %8130, %__rlasp_stack_elide_zero_427 : i64
      %8132 = func.call @stack_pop_pointer() : () -> i64
      %8133 = func.call @cc_cons(%8132, %8131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
      %8134 = arith.addi %8133, %__rlasp_stack_elide_zero_428 : i64
      %8135 = func.call @stack_pop_pointer() : () -> i64
      %8136 = func.call @cc_cons(%8135, %8134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
      %8137 = arith.addi %8136, %__rlasp_stack_elide_zero_429 : i64
      %8138 = func.call @stack_pop_pointer() : () -> i64
      %8139 = func.call @cc_cons(%8138, %8137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
      %8140 = arith.addi %8139, %__rlasp_stack_elide_zero_430 : i64
      %8141 = func.call @stack_pop_pointer() : () -> i64
      %8142 = func.call @cc_cons(%8141, %8140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
      %8143 = arith.addi %8142, %__rlasp_stack_elide_zero_431 : i64
      %8144 = func.call @stack_pop_pointer() : () -> i64
      %8145 = func.call @cc_cons(%8144, %8143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
      %8146 = arith.addi %8145, %__rlasp_stack_elide_zero_432 : i64
      %8147 = func.call @stack_pop_pointer() : () -> i64
      %8148 = func.call @cc_cons(%8147, %8146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
      %8149 = arith.addi %8148, %__rlasp_stack_elide_zero_433 : i64
      %8150 = func.call @stack_pop_pointer() : () -> i64
      %8151 = func.call @cc_cons(%8150, %8149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
      %8152 = arith.addi %8151, %__rlasp_stack_elide_zero_434 : i64
      %8153 = func.call @stack_pop_pointer() : () -> i64
      %8154 = func.call @cc_cons(%8153, %8152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
      %8155 = arith.addi %8154, %__rlasp_stack_elide_zero_435 : i64
      %8156 = func.call @stack_pop_pointer() : () -> i64
      %8157 = func.call @cc_cons(%8156, %8155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %8158 = arith.addi %8157, %__rlasp_stack_elide_zero_436 : i64
      %8159 = func.call @stack_pop_pointer() : () -> i64
      %8160 = func.call @cc_cons(%8159, %8158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %8161 = arith.addi %8160, %__rlasp_stack_elide_zero_437 : i64
      %8162 = func.call @stack_pop_pointer() : () -> i64
      %8163 = func.call @cc_cons(%8162, %8161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %8164 = arith.addi %8163, %__rlasp_stack_elide_zero_438 : i64
      %8165 = func.call @stack_pop_pointer() : () -> i64
      %8166 = func.call @cc_cons(%8165, %8164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %8167 = arith.addi %8166, %__rlasp_stack_elide_zero_439 : i64
      %8168 = func.call @stack_pop_pointer() : () -> i64
      %8169 = func.call @cc_cons(%8168, %8167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %8170 = arith.addi %8169, %__rlasp_stack_elide_zero_440 : i64
      %8171 = func.call @stack_pop_pointer() : () -> i64
      %8172 = func.call @cc_cons(%8171, %8170) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %8173 = arith.addi %8172, %__rlasp_stack_elide_zero_441 : i64
      %8174 = func.call @stack_pop_pointer() : () -> i64
      %8175 = func.call @cc_cons(%8174, %8173) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %8176 = arith.addi %8175, %__rlasp_stack_elide_zero_442 : i64
      %8177 = func.call @stack_pop_pointer() : () -> i64
      %8178 = func.call @cc_cons(%8177, %8176) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %8179 = arith.addi %8178, %__rlasp_stack_elide_zero_443 : i64
      %8180 = func.call @stack_pop_pointer() : () -> i64
      %8181 = func.call @cc_cons(%8180, %8179) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %8182 = arith.addi %8181, %__rlasp_stack_elide_zero_444 : i64
      %8183 = func.call @stack_pop_pointer() : () -> i64
      %8184 = func.call @cc_cons(%8183, %8182) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %8185 = arith.addi %8184, %__rlasp_stack_elide_zero_445 : i64
      %8186 = func.call @stack_pop_pointer() : () -> i64
      %8187 = func.call @cc_cons(%8186, %8185) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %8188 = arith.addi %8187, %__rlasp_stack_elide_zero_446 : i64
      %8189 = func.call @stack_pop_pointer() : () -> i64
      %8190 = func.call @cc_cons(%8189, %8188) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %8191 = arith.addi %8190, %__rlasp_stack_elide_zero_447 : i64
      %8192 = func.call @stack_pop_pointer() : () -> i64
      %8193 = func.call @cc_cons(%8192, %8191) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %8194 = arith.addi %8193, %__rlasp_stack_elide_zero_448 : i64
      %8195 = func.call @stack_pop_pointer() : () -> i64
      %8196 = func.call @cc_cons(%8195, %8194) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %8197 = arith.addi %8196, %__rlasp_stack_elide_zero_449 : i64
      %8198 = func.call @stack_pop_pointer() : () -> i64
      %8199 = func.call @cc_cons(%8198, %8197) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %8200 = arith.addi %8199, %__rlasp_stack_elide_zero_450 : i64
      %8201 = func.call @stack_pop_pointer() : () -> i64
      %8202 = func.call @cc_cons(%8201, %8200) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %8203 = arith.addi %8202, %__rlasp_stack_elide_zero_451 : i64
      %8204 = func.call @stack_pop_pointer() : () -> i64
      %8205 = func.call @cc_cons(%8204, %8203) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %8206 = arith.addi %8205, %__rlasp_stack_elide_zero_452 : i64
      %8207 = func.call @stack_pop_pointer() : () -> i64
      %8208 = func.call @cc_cons(%8207, %8206) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %8209 = arith.addi %8208, %__rlasp_stack_elide_zero_453 : i64
      %8210 = func.call @stack_pop_pointer() : () -> i64
      %8211 = func.call @cc_cons(%8210, %8209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %8212 = arith.addi %8211, %__rlasp_stack_elide_zero_454 : i64
      %8213 = func.call @stack_pop_pointer() : () -> i64
      %8214 = func.call @cc_cons(%8213, %8212) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %8215 = arith.addi %8214, %__rlasp_stack_elide_zero_455 : i64
      %8216 = func.call @stack_pop_pointer() : () -> i64
      %8217 = func.call @cc_cons(%8216, %8215) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %8218 = arith.addi %8217, %__rlasp_stack_elide_zero_456 : i64
      %8219 = func.call @stack_pop_pointer() : () -> i64
      %8220 = func.call @cc_cons(%8219, %8218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %8221 = arith.addi %8220, %__rlasp_stack_elide_zero_457 : i64
      %8222 = func.call @stack_pop_pointer() : () -> i64
      %8223 = func.call @cc_cons(%8222, %8221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %8224 = arith.addi %8223, %__rlasp_stack_elide_zero_458 : i64
      %8225 = func.call @stack_pop_pointer() : () -> i64
      %8226 = func.call @cc_cons(%8225, %8224) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
      %8227 = arith.addi %8226, %__rlasp_stack_elide_zero_459 : i64
      %8228 = func.call @stack_pop_pointer() : () -> i64
      %8229 = func.call @cc_cons(%8228, %8227) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %8230 = arith.addi %8229, %__rlasp_stack_elide_zero_460 : i64
      %8231 = func.call @stack_pop_pointer() : () -> i64
      %8232 = func.call @cc_cons(%8231, %8230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %8233 = arith.addi %8232, %__rlasp_stack_elide_zero_461 : i64
      %8234 = func.call @stack_pop_pointer() : () -> i64
      %8235 = func.call @cc_cons(%8234, %8233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
      %8236 = arith.addi %8235, %__rlasp_stack_elide_zero_462 : i64
      %8237 = func.call @stack_pop_pointer() : () -> i64
      %8238 = func.call @cc_cons(%8237, %8236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
      %8239 = arith.addi %8238, %__rlasp_stack_elide_zero_463 : i64
      %8240 = func.call @stack_pop_pointer() : () -> i64
      %8241 = func.call @cc_cons(%8240, %8239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %8242 = arith.addi %8241, %__rlasp_stack_elide_zero_464 : i64
      %8243 = func.call @stack_pop_pointer() : () -> i64
      %8244 = func.call @cc_cons(%8243, %8242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
      %8245 = arith.addi %8244, %__rlasp_stack_elide_zero_465 : i64
      %8246 = func.call @stack_pop_pointer() : () -> i64
      %8247 = func.call @cc_cons(%8246, %8245) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
      %8248 = arith.addi %8247, %__rlasp_stack_elide_zero_466 : i64
      %8249 = func.call @stack_pop_pointer() : () -> i64
      %8250 = func.call @cc_cons(%8249, %8248) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %8251 = arith.addi %8250, %__rlasp_stack_elide_zero_467 : i64
      %8252 = func.call @stack_pop_pointer() : () -> i64
      %8253 = func.call @cc_cons(%8252, %8251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
      %8254 = arith.addi %8253, %__rlasp_stack_elide_zero_468 : i64
      %8255 = func.call @stack_pop_pointer() : () -> i64
      %8256 = func.call @cc_cons(%8255, %8254) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
      %8257 = arith.addi %8256, %__rlasp_stack_elide_zero_469 : i64
      %8258 = func.call @stack_pop_pointer() : () -> i64
      %8259 = func.call @cc_cons(%8257, %8258) : (i64, i64) -> i64
      %8260 = llvm.mlir.addressof @str863 : !llvm.ptr
      %8261 = arith.constant 5 : i64
      %8262 = func.call @cc_make_string(%8260, %8261) : (!llvm.ptr, i64) -> i64
      %8263 = func.call @cc_nil_value() : () -> i64
      %8264 = func.call @cc_intern(%8262, %8263) : (i64, i64) -> i64
      %8265 = func.call @cc_nil_value() : () -> i64
      %8266 = func.call @cc_cons(%8264, %8265) : (i64, i64) -> i64
      %8267 = func.call @cc_values_pack(%8266) : (i64) -> i64
      %8268 = func.call @cc_cons(%8264, %8259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8269 = func.call @stack_pop_pointer() : () -> i64
      %8270 = func.call @stack_pop_pointer() : () -> i64
      %8271 = func.call @cc_cons(%8270, %8269) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
      %8272 = arith.addi %8271, %__rlasp_stack_elide_zero_470 : i64
      %8273 = func.call @stack_pop_pointer() : () -> i64
      %8274 = func.call @cc_cons(%8273, %8272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8274) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8275 = func.call @stack_pop_pointer() : () -> i64
      %8276 = func.call @stack_pop_pointer() : () -> i64
      %8277 = func.call @cc_cons(%8276, %8275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8277) : (i64) -> ()
      %8278 = llvm.mlir.addressof @str864 : !llvm.ptr
      %8279 = arith.constant 4 : i64
      %8280 = func.call @cc_make_string(%8278, %8279) : (!llvm.ptr, i64) -> i64
      %8281 = func.call @cc_nil_value() : () -> i64
      %8282 = func.call @cc_intern(%8280, %8281) : (i64, i64) -> i64
      %8283 = func.call @cc_nil_value() : () -> i64
      %8284 = func.call @cc_cons(%8282, %8283) : (i64, i64) -> i64
      %8285 = func.call @cc_values_pack(%8284) : (i64) -> i64
      func.call @stack_push_pointer(%8282) : (i64) -> ()
      %8286 = llvm.mlir.addressof @str865 : !llvm.ptr
      %8287 = arith.constant 3 : i64
      %8288 = func.call @cc_make_string(%8286, %8287) : (!llvm.ptr, i64) -> i64
      %8289 = func.call @cc_nil_value() : () -> i64
      %8290 = func.call @cc_intern(%8288, %8289) : (i64, i64) -> i64
      %8291 = func.call @cc_nil_value() : () -> i64
      %8292 = func.call @cc_cons(%8290, %8291) : (i64, i64) -> i64
      %8293 = func.call @cc_values_pack(%8292) : (i64) -> i64
      func.call @stack_push_pointer(%8290) : (i64) -> ()
      %8294 = llvm.mlir.addressof @str866 : !llvm.ptr
      %8295 = arith.constant 1 : i64
      %8296 = func.call @cc_make_string(%8294, %8295) : (!llvm.ptr, i64) -> i64
      %8297 = func.call @cc_nil_value() : () -> i64
      %8298 = func.call @cc_intern(%8296, %8297) : (i64, i64) -> i64
      %8299 = func.call @cc_nil_value() : () -> i64
      %8300 = func.call @cc_cons(%8298, %8299) : (i64, i64) -> i64
      %8301 = func.call @cc_values_pack(%8300) : (i64) -> i64
      func.call @stack_push_pointer(%8298) : (i64) -> ()
      %8302 = llvm.mlir.addressof @str867 : !llvm.ptr
      %8303 = arith.constant 2 : i64
      %8304 = func.call @cc_make_string(%8302, %8303) : (!llvm.ptr, i64) -> i64
      %8305 = func.call @cc_nil_value() : () -> i64
      %8306 = func.call @cc_intern(%8304, %8305) : (i64, i64) -> i64
      %8307 = func.call @cc_nil_value() : () -> i64
      %8308 = func.call @cc_cons(%8306, %8307) : (i64, i64) -> i64
      %8309 = func.call @cc_values_pack(%8308) : (i64) -> i64
      func.call @stack_push_pointer(%8306) : (i64) -> ()
      %8310 = llvm.mlir.addressof @str868 : !llvm.ptr
      %8311 = arith.constant 46 : i64
      %8312 = func.call @cc_make_string(%8310, %8311) : (!llvm.ptr, i64) -> i64
      %8313 = func.call @cc_nil_value() : () -> i64
      %8314 = func.call @cc_intern(%8312, %8313) : (i64, i64) -> i64
      %8315 = func.call @cc_nil_value() : () -> i64
      %8316 = func.call @cc_cons(%8314, %8315) : (i64, i64) -> i64
      %8317 = func.call @cc_values_pack(%8316) : (i64) -> i64
      func.call @stack_push_pointer(%8314) : (i64) -> ()
      %8318 = llvm.mlir.addressof @str869 : !llvm.ptr
      %8319 = arith.constant 4 : i64
      %8320 = func.call @cc_make_string(%8318, %8319) : (!llvm.ptr, i64) -> i64
      %8321 = llvm.mlir.addressof @str870 : !llvm.ptr
      %8322 = arith.constant 11 : i64
      %8323 = func.call @cc_make_string(%8321, %8322) : (!llvm.ptr, i64) -> i64
      %8324 = func.call @cc_intern(%8320, %8323) : (i64, i64) -> i64
      %8325 = func.call @cc_nil_value() : () -> i64
      %8326 = func.call @cc_cons(%8324, %8325) : (i64, i64) -> i64
      %8327 = func.call @cc_values_pack(%8326) : (i64) -> i64
      func.call @stack_push_pointer(%8324) : (i64) -> ()
      %8328 = llvm.mlir.addressof @str871 : !llvm.ptr
      %8329 = arith.constant 7 : i64
      %8330 = func.call @cc_make_string(%8328, %8329) : (!llvm.ptr, i64) -> i64
      %8331 = llvm.mlir.addressof @str872 : !llvm.ptr
      %8332 = arith.constant 11 : i64
      %8333 = func.call @cc_make_string(%8331, %8332) : (!llvm.ptr, i64) -> i64
      %8334 = func.call @cc_intern(%8330, %8333) : (i64, i64) -> i64
      %8335 = func.call @cc_nil_value() : () -> i64
      %8336 = func.call @cc_cons(%8334, %8335) : (i64, i64) -> i64
      %8337 = func.call @cc_values_pack(%8336) : (i64) -> i64
      func.call @stack_push_pointer(%8334) : (i64) -> ()
      %8338 = llvm.mlir.addressof @str873 : !llvm.ptr
      %8339 = arith.constant 1 : i64
      %8340 = func.call @cc_make_string(%8338, %8339) : (!llvm.ptr, i64) -> i64
      %8341 = func.call @cc_nil_value() : () -> i64
      %8342 = func.call @cc_intern(%8340, %8341) : (i64, i64) -> i64
      %8343 = func.call @cc_nil_value() : () -> i64
      %8344 = func.call @cc_cons(%8342, %8343) : (i64, i64) -> i64
      %8345 = func.call @cc_values_pack(%8344) : (i64) -> i64
      func.call @stack_push_pointer(%8342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8346 = func.call @stack_pop_pointer() : () -> i64
      %8347 = func.call @stack_pop_pointer() : () -> i64
      %8348 = func.call @cc_cons(%8347, %8346) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
      %8349 = arith.addi %8348, %__rlasp_stack_elide_zero_471 : i64
      %8350 = func.call @stack_pop_pointer() : () -> i64
      %8351 = func.call @cc_cons(%8350, %8349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8351) : (i64) -> ()
      %8352 = llvm.mlir.addressof @str874 : !llvm.ptr
      %8353 = arith.constant 7 : i64
      %8354 = func.call @cc_make_string(%8352, %8353) : (!llvm.ptr, i64) -> i64
      %8355 = func.call @cc_nil_value() : () -> i64
      %8356 = func.call @cc_intern(%8354, %8355) : (i64, i64) -> i64
      %8357 = func.call @cc_nil_value() : () -> i64
      %8358 = func.call @cc_cons(%8356, %8357) : (i64, i64) -> i64
      %8359 = func.call @cc_values_pack(%8358) : (i64) -> i64
      func.call @stack_push_pointer(%8356) : (i64) -> ()
      %8360 = llvm.mlir.addressof @str875 : !llvm.ptr
      %8361 = arith.constant 1 : i64
      %8362 = func.call @cc_make_string(%8360, %8361) : (!llvm.ptr, i64) -> i64
      %8363 = func.call @cc_nil_value() : () -> i64
      %8364 = func.call @cc_intern(%8362, %8363) : (i64, i64) -> i64
      %8365 = func.call @cc_nil_value() : () -> i64
      %8366 = func.call @cc_cons(%8364, %8365) : (i64, i64) -> i64
      %8367 = func.call @cc_values_pack(%8366) : (i64) -> i64
      func.call @stack_push_pointer(%8364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8368 = func.call @stack_pop_pointer() : () -> i64
      %8369 = func.call @stack_pop_pointer() : () -> i64
      %8370 = func.call @cc_cons(%8369, %8368) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
      %8371 = arith.addi %8370, %__rlasp_stack_elide_zero_472 : i64
      %8372 = func.call @stack_pop_pointer() : () -> i64
      %8373 = func.call @cc_cons(%8372, %8371) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %8374 = arith.addi %8373, %__rlasp_stack_elide_zero_473 : i64
      %8375 = func.call @stack_pop_pointer() : () -> i64
      %8376 = func.call @cc_cons(%8375, %8374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
      %8377 = arith.addi %8376, %__rlasp_stack_elide_zero_474 : i64
      %8378 = func.call @stack_pop_pointer() : () -> i64
      %8379 = func.call @cc_cons(%8378, %8377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
      %8380 = arith.addi %8379, %__rlasp_stack_elide_zero_475 : i64
      %8381 = func.call @stack_pop_pointer() : () -> i64
      %8382 = func.call @cc_cons(%8381, %8380) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
      %8383 = arith.addi %8382, %__rlasp_stack_elide_zero_476 : i64
      %8384 = func.call @stack_pop_pointer() : () -> i64
      %8385 = func.call @cc_cons(%8384, %8383) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
      %8386 = arith.addi %8385, %__rlasp_stack_elide_zero_477 : i64
      %8387 = func.call @stack_pop_pointer() : () -> i64
      %8388 = func.call @cc_cons(%8387, %8386) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
      %8389 = arith.addi %8388, %__rlasp_stack_elide_zero_478 : i64
      %8390 = func.call @stack_pop_pointer() : () -> i64
      %8391 = func.call @cc_cons(%8390, %8389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
      %8392 = arith.addi %8391, %__rlasp_stack_elide_zero_479 : i64
      %8393 = func.call @stack_pop_pointer() : () -> i64
      %8394 = func.call @cc_cons(%8393, %8392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8394) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8395 = func.call @stack_pop_pointer() : () -> i64
      %8396 = func.call @stack_pop_pointer() : () -> i64
      %8397 = func.call @cc_cons(%8396, %8395) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
      %8398 = arith.addi %8397, %__rlasp_stack_elide_zero_480 : i64
      %8399 = func.call @stack_pop_pointer() : () -> i64
      %8400 = func.call @cc_cons(%8399, %8398) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
      %8401 = arith.addi %8400, %__rlasp_stack_elide_zero_481 : i64
      %8402 = func.call @stack_pop_pointer() : () -> i64
      %8403 = func.call @cc_cons(%8402, %8401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
      %8404 = arith.addi %8403, %__rlasp_stack_elide_zero_482 : i64
      %11532 = arith.constant 116254966808597 : i64
      %11533 = arith.constant 0 : i64
      %11534 = func.call @cc_make_closure(%11532, %11533) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
      %11535 = arith.addi %11534, %__rlasp_stack_elide_zero_483 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %11536 = func.call @stack_pop_pointer() : () -> i64
      %11537 = func.call @stack_pop_pointer() : () -> i64
      %11538 = func.call @cc_cons(%11537, %11536) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
      %11539 = arith.addi %11538, %__rlasp_stack_elide_zero_484 : i64
      %11540 = llvm.mlir.addressof @str1330 : !llvm.ptr
      %11541 = arith.constant 11 : i64
      %11542 = func.call @cc_make_string(%11540, %11541) : (!llvm.ptr, i64) -> i64
      %11543 = llvm.mlir.addressof @str1331 : !llvm.ptr
      %11544 = arith.constant 7 : i64
      %11545 = func.call @cc_make_string(%11543, %11544) : (!llvm.ptr, i64) -> i64
      %11546 = func.call @cc_intern(%11542, %11545) : (i64, i64) -> i64
      %11547 = func.call @cc_nil_value() : () -> i64
      %11548 = func.call @cc_cons(%11546, %11547) : (i64, i64) -> i64
      %11549 = func.call @cc_values_pack(%11548) : (i64) -> i64
      %11550 = func.call @cc_nil_value() : () -> i64
      %11551 = llvm.mlir.addressof @str1332 : !llvm.ptr
      %11552 = arith.constant 4 : i64
      %11553 = func.call @cc_make_string(%11551, %11552) : (!llvm.ptr, i64) -> i64
      %11554 = llvm.mlir.addressof @str1333 : !llvm.ptr
      %11555 = arith.constant 7 : i64
      %11556 = func.call @cc_make_string(%11554, %11555) : (!llvm.ptr, i64) -> i64
      %11557 = func.call @cc_intern(%11553, %11556) : (i64, i64) -> i64
      %11558 = func.call @cc_nil_value() : () -> i64
      %11559 = func.call @cc_cons(%11557, %11558) : (i64, i64) -> i64
      %11560 = func.call @cc_values_pack(%11559) : (i64) -> i64
      %11561 = llvm.mlir.addressof @str1334 : !llvm.ptr
      %11562 = arith.constant 6 : i64
      %11563 = func.call @cc_make_string(%11561, %11562) : (!llvm.ptr, i64) -> i64
      %11564 = func.call @cc_nil_value() : () -> i64
      %11565 = func.call @cc_intern(%11563, %11564) : (i64, i64) -> i64
      %11566 = func.call @cc_nil_value() : () -> i64
      %11567 = func.call @cc_cons(%11565, %11566) : (i64, i64) -> i64
      %11568 = func.call @cc_values_pack(%11567) : (i64) -> i64
      %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
      %11569 = arith.addi %11565, %__rlasp_stack_elide_zero_485 : i64
      %11570 = func.call @cc_nil_value() : () -> i64
      %11571 = func.call @cc_errorp(%5365) : (i64) -> i64
      %11572 = arith.cmpi ne, %11571, %11570 : i64
      %11573 = arith.cmpi eq, %11570, %11570 : i64
      %11574 = arith.andi %11572, %11573 : i1
      %11575 = scf.if %11574 -> (i64) {
        scf.yield %5365 : i64
      } else {
        scf.yield %11570 : i64
      }
      %11576 = func.call @cc_errorp(%8404) : (i64) -> i64
      %11577 = arith.cmpi ne, %11576, %11570 : i64
      %11578 = arith.cmpi eq, %11575, %11570 : i64
      %11579 = arith.andi %11577, %11578 : i1
      %11580 = scf.if %11579 -> (i64) {
        scf.yield %8404 : i64
      } else {
        scf.yield %11575 : i64
      }
      %11581 = func.call @cc_errorp(%11535) : (i64) -> i64
      %11582 = arith.cmpi ne, %11581, %11570 : i64
      %11583 = arith.cmpi eq, %11580, %11570 : i64
      %11584 = arith.andi %11582, %11583 : i1
      %11585 = scf.if %11584 -> (i64) {
        scf.yield %11535 : i64
      } else {
        scf.yield %11580 : i64
      }
      %11586 = func.call @cc_errorp(%11539) : (i64) -> i64
      %11587 = arith.cmpi ne, %11586, %11570 : i64
      %11588 = arith.cmpi eq, %11585, %11570 : i64
      %11589 = arith.andi %11587, %11588 : i1
      %11590 = scf.if %11589 -> (i64) {
        scf.yield %11539 : i64
      } else {
        scf.yield %11585 : i64
      }
      %11591 = func.call @cc_errorp(%11546) : (i64) -> i64
      %11592 = arith.cmpi ne, %11591, %11570 : i64
      %11593 = arith.cmpi eq, %11590, %11570 : i64
      %11594 = arith.andi %11592, %11593 : i1
      %11595 = scf.if %11594 -> (i64) {
        scf.yield %11546 : i64
      } else {
        scf.yield %11590 : i64
      }
      %11596 = func.call @cc_errorp(%11550) : (i64) -> i64
      %11597 = arith.cmpi ne, %11596, %11570 : i64
      %11598 = arith.cmpi eq, %11595, %11570 : i64
      %11599 = arith.andi %11597, %11598 : i1
      %11600 = scf.if %11599 -> (i64) {
        scf.yield %11550 : i64
      } else {
        scf.yield %11595 : i64
      }
      %11601 = func.call @cc_errorp(%11557) : (i64) -> i64
      %11602 = arith.cmpi ne, %11601, %11570 : i64
      %11603 = arith.cmpi eq, %11600, %11570 : i64
      %11604 = arith.andi %11602, %11603 : i1
      %11605 = scf.if %11604 -> (i64) {
        scf.yield %11557 : i64
      } else {
        scf.yield %11600 : i64
      }
      %11606 = func.call @cc_errorp(%11569) : (i64) -> i64
      %11607 = arith.cmpi ne, %11606, %11570 : i64
      %11608 = arith.cmpi eq, %11605, %11570 : i64
      %11609 = arith.andi %11607, %11608 : i1
      %11610 = scf.if %11609 -> (i64) {
        scf.yield %11569 : i64
      } else {
        scf.yield %11605 : i64
      }
      %11611 = arith.cmpi ne, %11610, %11570 : i64
      scf.if %11611 {
        func.call @stack_push_pointer(%11610) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5365) : (i64) -> ()
        func.call @stack_push_pointer(%8404) : (i64) -> ()
        func.call @stack_push_pointer(%11535) : (i64) -> ()
        func.call @stack_push_pointer(%11539) : (i64) -> ()
        func.call @stack_push_pointer(%11546) : (i64) -> ()
        func.call @stack_push_pointer(%11550) : (i64) -> ()
        func.call @stack_push_pointer(%11557) : (i64) -> ()
        func.call @stack_push_pointer(%11569) : (i64) -> ()
        %11612 = llvm.mlir.addressof @str1335 : !llvm.ptr
        %11613 = func.call @cc_make_function_ref_const(%11612) : (!llvm.ptr) -> i64
        %11614 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11613, %11614) : (i64, i64) -> ()
      }
      %11615 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11615 : i64
    }
    %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
    %11616 = arith.addi %5356, %__rlasp_stack_elide_zero_486 : i64
    %11617 = func.call @cc_multiple_value_list(%11616) : (i64) -> i64
    %11618 = llvm.mlir.addressof @str1336 : !llvm.ptr
    %11619 = arith.constant 38 : i64
    %11620 = func.call @cc_make_string(%11618, %11619) : (!llvm.ptr, i64) -> i64
    %11621 = func.call @cc_nil_value() : () -> i64
    %11622 = func.call @cc_intern(%11620, %11621) : (i64, i64) -> i64
    %11623 = func.call @cc_nil_value() : () -> i64
    %11624 = func.call @cc_cons(%11622, %11623) : (i64, i64) -> i64
    %11625 = func.call @cc_values_pack(%11624) : (i64) -> i64
    %11626 = func.call @cc_symbol_value(%11622) : (i64) -> i64
    %11627 = llvm.mlir.addressof @str1337 : !llvm.ptr
    %11628 = arith.constant 40 : i64
    %11629 = func.call @cc_make_string(%11627, %11628) : (!llvm.ptr, i64) -> i64
    %11630 = func.call @cc_nil_value() : () -> i64
    %11631 = func.call @cc_intern(%11629, %11630) : (i64, i64) -> i64
    %11632 = func.call @cc_nil_value() : () -> i64
    %11633 = func.call @cc_cons(%11631, %11632) : (i64, i64) -> i64
    %11634 = func.call @cc_values_pack(%11633) : (i64) -> i64
    %11635 = func.call @cc_symbol_value(%11631) : (i64) -> i64
    %11636 = func.call @cc_nil_value() : () -> i64
    %11637 = arith.cmpi ne, %11626, %11636 : i64
    %11638 = scf.if %11637 -> (i64) {
      scf.yield %11635 : i64
    } else {
      scf.yield %11617 : i64
    }
    %11639 = func.call @cc_values_pack(%11638) : (i64) -> i64
    func.call @stack_push_pointer(%11639) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808577"() {
    %130 = func.call @cc_nil_value() : () -> i64
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = func.call @cc_errorp(%130) : (i64) -> i64
    %133 = arith.cmpi ne, %132, %131 : i64
    %134 = scf.if %133 -> (i64) {
      scf.yield %130 : i64
    } else {
      %135 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_errorp(%136) : (i64) -> i64
      %139 = arith.cmpi ne, %138, %137 : i64
      %140 = scf.if %139 -> (i64) {
        scf.yield %136 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %141 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%141) : (i64) -> ()
        %142 = func.call @stack_pop_pointer() : () -> i64
        %143 = func.call @cc_make_symbol_from_name(%142) : (i64) -> i64
        %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
        %144 = arith.addi %143, %__rlasp_stack_elide_zero_487 : i64
        %145 = func.call @cc_errorp(%144) : (i64) -> i64
        %146 = func.call @cc_nil_value() : () -> i64
        %147 = arith.cmpi ne, %145, %146 : i64
        scf.if %147 {
          func.call @stack_push_pointer(%144) : (i64) -> ()
        } else {
          %148 = func.call @cc_multiple_value_list(%144) : (i64) -> i64
          func.call @stack_push_pointer(%148) : (i64) -> ()
        }
        %149 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %150 = func.call @stack_pop_pointer() : () -> i64
        %151 = func.call @cc_nil_value() : () -> i64
        %152 = func.call @cc_maybe_error_from_multiple_value_list(%149) : (i64) -> i64
        %153 = func.call @cc_errorp(%152) : (i64) -> i64
        %154 = arith.cmpi ne, %153, %151 : i64
        %155 = arith.cmpi eq, %151, %151 : i64
        %156 = arith.andi %154, %155 : i1
        %157 = scf.if %156 -> (i64) {
          scf.yield %152 : i64
        } else {
          scf.yield %151 : i64
        }
        %158 = arith.cmpi ne, %157, %151 : i64
        scf.if %158 {
          func.call @stack_push_pointer(%157) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %159 = func.call @stack_pop_pointer() : () -> i64
          %160 = func.call @cc_cons(%150, %159) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
          %161 = arith.addi %160, %__rlasp_stack_elide_zero_488 : i64
          %162 = func.call @cc_cons(%149, %161) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
          %163 = arith.addi %162, %__rlasp_stack_elide_zero_489 : i64
          %164 = func.call @cc_values_pack(%163) : (i64) -> i64
          func.call @stack_push_pointer(%164) : (i64) -> ()
        }
        %165 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %165 : i64
      }
      %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
      %166 = arith.addi %140, %__rlasp_stack_elide_zero_490 : i64
      %167 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %168 = func.call @cc_errorp(%166) : (i64) -> i64
      %169 = func.call @cc_nil_value() : () -> i64
      %170 = arith.cmpi ne, %168, %169 : i64
      scf.if %170 {
        %171 = func.call @cc_condition_value(%166) : (i64) -> i64
        %172 = func.call @cc_values2(%169, %171) : (i64, i64) -> i64
        func.call @stack_push_pointer(%172) : (i64) -> ()
      } else {
        %173 = func.call @cc_multiple_value_list(%166) : (i64) -> i64
        %174 = func.call @cc_values_pack(%173) : (i64) -> i64
        func.call @stack_push_pointer(%174) : (i64) -> ()
      }
      %175 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %175 : i64
    }
    func.call @stack_push_pointer(%134) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808578"() {
    %381 = func.call @cc_nil_value() : () -> i64
    %382 = func.call @cc_nil_value() : () -> i64
    %383 = func.call @cc_errorp(%381) : (i64) -> i64
    %384 = arith.cmpi ne, %383, %382 : i64
    %385 = scf.if %384 -> (i64) {
      scf.yield %381 : i64
    } else {
      %386 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_errorp(%387) : (i64) -> i64
      %390 = arith.cmpi ne, %389, %388 : i64
      %391 = scf.if %390 -> (i64) {
        scf.yield %387 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %392 = llvm.mlir.addressof @str31 : !llvm.ptr
        %393 = arith.constant 5 : i64
        %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
        %395 = llvm.mlir.addressof @str32 : !llvm.ptr
        %396 = arith.constant 11 : i64
        %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
        %398 = func.call @cc_intern(%394, %397) : (i64, i64) -> i64
        %399 = func.call @cc_nil_value() : () -> i64
        %400 = func.call @cc_cons(%398, %399) : (i64, i64) -> i64
        %401 = func.call @cc_values_pack(%400) : (i64) -> i64
        %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
        %402 = arith.addi %398, %__rlasp_stack_elide_zero_491 : i64
        %403 = func.call @cc_make_symbol_from_name(%402) : (i64) -> i64
        %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
        %404 = arith.addi %403, %__rlasp_stack_elide_zero_492 : i64
        %405 = func.call @cc_errorp(%404) : (i64) -> i64
        %406 = func.call @cc_nil_value() : () -> i64
        %407 = arith.cmpi ne, %405, %406 : i64
        scf.if %407 {
          func.call @stack_push_pointer(%404) : (i64) -> ()
        } else {
          %408 = func.call @cc_multiple_value_list(%404) : (i64) -> i64
          func.call @stack_push_pointer(%408) : (i64) -> ()
        }
        %409 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %410 = func.call @stack_pop_pointer() : () -> i64
        %411 = func.call @cc_nil_value() : () -> i64
        %412 = func.call @cc_maybe_error_from_multiple_value_list(%409) : (i64) -> i64
        %413 = func.call @cc_errorp(%412) : (i64) -> i64
        %414 = arith.cmpi ne, %413, %411 : i64
        %415 = arith.cmpi eq, %411, %411 : i64
        %416 = arith.andi %414, %415 : i1
        %417 = scf.if %416 -> (i64) {
          scf.yield %412 : i64
        } else {
          scf.yield %411 : i64
        }
        %418 = arith.cmpi ne, %417, %411 : i64
        scf.if %418 {
          func.call @stack_push_pointer(%417) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %419 = func.call @stack_pop_pointer() : () -> i64
          %420 = func.call @cc_cons(%410, %419) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
          %421 = arith.addi %420, %__rlasp_stack_elide_zero_493 : i64
          %422 = func.call @cc_cons(%409, %421) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
          %423 = arith.addi %422, %__rlasp_stack_elide_zero_494 : i64
          %424 = func.call @cc_values_pack(%423) : (i64) -> i64
          func.call @stack_push_pointer(%424) : (i64) -> ()
        }
        %425 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %425 : i64
      }
      %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
      %426 = arith.addi %391, %__rlasp_stack_elide_zero_495 : i64
      %427 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %428 = func.call @cc_errorp(%426) : (i64) -> i64
      %429 = func.call @cc_nil_value() : () -> i64
      %430 = arith.cmpi ne, %428, %429 : i64
      scf.if %430 {
        %431 = func.call @cc_condition_value(%426) : (i64) -> i64
        %432 = func.call @cc_values2(%429, %431) : (i64, i64) -> i64
        func.call @stack_push_pointer(%432) : (i64) -> ()
      } else {
        %433 = func.call @cc_multiple_value_list(%426) : (i64) -> i64
        %434 = func.call @cc_values_pack(%433) : (i64) -> i64
        func.call @stack_push_pointer(%434) : (i64) -> ()
      }
      %435 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %435 : i64
    }
    func.call @stack_push_pointer(%385) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808579"() {
    %620 = func.call @cc_nil_value() : () -> i64
    %621 = func.call @cc_nil_value() : () -> i64
    %622 = func.call @cc_errorp(%620) : (i64) -> i64
    %623 = arith.cmpi ne, %622, %621 : i64
    %624 = scf.if %623 -> (i64) {
      scf.yield %620 : i64
    } else {
      %625 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %626 = func.call @cc_nil_value() : () -> i64
      %627 = func.call @cc_nil_value() : () -> i64
      %628 = func.call @cc_errorp(%626) : (i64) -> i64
      %629 = arith.cmpi ne, %628, %627 : i64
      %630 = scf.if %629 -> (i64) {
        scf.yield %626 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %631 = arith.constant 65 : i64
        %632 = func.call @cc_box_character(%631) : (i64) -> i64
        %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
        %633 = arith.addi %632, %__rlasp_stack_elide_zero_496 : i64
        %634 = func.call @cc_make_symbol_from_name(%633) : (i64) -> i64
        %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
        %635 = arith.addi %634, %__rlasp_stack_elide_zero_497 : i64
        %636 = func.call @cc_errorp(%635) : (i64) -> i64
        %637 = func.call @cc_nil_value() : () -> i64
        %638 = arith.cmpi ne, %636, %637 : i64
        scf.if %638 {
          func.call @stack_push_pointer(%635) : (i64) -> ()
        } else {
          %639 = func.call @cc_multiple_value_list(%635) : (i64) -> i64
          func.call @stack_push_pointer(%639) : (i64) -> ()
        }
        %640 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %641 = func.call @stack_pop_pointer() : () -> i64
        %642 = func.call @cc_nil_value() : () -> i64
        %643 = func.call @cc_maybe_error_from_multiple_value_list(%640) : (i64) -> i64
        %644 = func.call @cc_errorp(%643) : (i64) -> i64
        %645 = arith.cmpi ne, %644, %642 : i64
        %646 = arith.cmpi eq, %642, %642 : i64
        %647 = arith.andi %645, %646 : i1
        %648 = scf.if %647 -> (i64) {
          scf.yield %643 : i64
        } else {
          scf.yield %642 : i64
        }
        %649 = arith.cmpi ne, %648, %642 : i64
        scf.if %649 {
          func.call @stack_push_pointer(%648) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %650 = func.call @stack_pop_pointer() : () -> i64
          %651 = func.call @cc_cons(%641, %650) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
          %652 = arith.addi %651, %__rlasp_stack_elide_zero_498 : i64
          %653 = func.call @cc_cons(%640, %652) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
          %654 = arith.addi %653, %__rlasp_stack_elide_zero_499 : i64
          %655 = func.call @cc_values_pack(%654) : (i64) -> i64
          func.call @stack_push_pointer(%655) : (i64) -> ()
        }
        %656 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %656 : i64
      }
      %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
      %657 = arith.addi %630, %__rlasp_stack_elide_zero_500 : i64
      %658 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %659 = func.call @cc_errorp(%657) : (i64) -> i64
      %660 = func.call @cc_nil_value() : () -> i64
      %661 = arith.cmpi ne, %659, %660 : i64
      scf.if %661 {
        %662 = func.call @cc_condition_value(%657) : (i64) -> i64
        %663 = func.call @cc_values2(%660, %662) : (i64, i64) -> i64
        func.call @stack_push_pointer(%663) : (i64) -> ()
      } else {
        %664 = func.call @cc_multiple_value_list(%657) : (i64) -> i64
        %665 = func.call @cc_values_pack(%664) : (i64) -> i64
        func.call @stack_push_pointer(%665) : (i64) -> ()
      }
      %666 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %666 : i64
    }
    func.call @stack_push_pointer(%624) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808580"() {
    %819 = func.call @cc_nil_value() : () -> i64
    %820 = func.call @cc_nil_value() : () -> i64
    %821 = func.call @cc_errorp(%819) : (i64) -> i64
    %822 = arith.cmpi ne, %821, %820 : i64
    %823 = scf.if %822 -> (i64) {
      scf.yield %819 : i64
    } else {
      %824 = llvm.mlir.addressof @str63 : !llvm.ptr
      %825 = arith.constant 5 : i64
      %826 = func.call @cc_make_string(%824, %825) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
      %827 = arith.addi %826, %__rlasp_stack_elide_zero_501 : i64
      %828 = func.call @cc_make_symbol_from_name(%827) : (i64) -> i64
      %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
      %829 = arith.addi %828, %__rlasp_stack_elide_zero_502 : i64
      func.call @stack_push_nil() : () -> ()
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @cc_cons(%829, %830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
      %832 = arith.addi %831, %__rlasp_stack_elide_zero_503 : i64
      %833 = func.call @cc_values_pack(%832) : (i64) -> i64
      %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
      %834 = arith.addi %833, %__rlasp_stack_elide_zero_504 : i64
      scf.yield %834 : i64
    }
    func.call @stack_push_pointer(%823) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808581"() {
    %1121 = func.call @cc_nil_value() : () -> i64
    %1122 = func.call @cc_nil_value() : () -> i64
    %1123 = func.call @cc_errorp(%1121) : (i64) -> i64
    %1124 = arith.cmpi ne, %1123, %1122 : i64
    %1125 = scf.if %1124 -> (i64) {
      scf.yield %1121 : i64
    } else {
      %1126 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%1126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @stack_pop_pointer() : () -> i64
      %1129 = func.call @cc_cons(%1128, %1127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
      %1130 = arith.addi %1129, %__rlasp_stack_elide_zero_505 : i64
      %1131 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1132 = arith.constant 16 : i64
      %1133 = func.call @cc_make_string(%1131, %1132) : (!llvm.ptr, i64) -> i64
      %1134 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1135 = arith.constant 7 : i64
      %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
      %1137 = func.call @cc_intern(%1133, %1136) : (i64, i64) -> i64
      %1138 = func.call @cc_nil_value() : () -> i64
      %1139 = func.call @cc_cons(%1137, %1138) : (i64, i64) -> i64
      %1140 = func.call @cc_values_pack(%1139) : (i64) -> i64
      %1141 = arith.constant 65 : i64
      %1142 = func.call @cc_box_character(%1141) : (i64) -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      %1143 = arith.constant 66 : i64
      %1144 = func.call @cc_box_character(%1143) : (i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      %1145 = arith.constant 67 : i64
      %1146 = func.call @cc_box_character(%1145) : (i64) -> i64
      func.call @stack_push_pointer(%1146) : (i64) -> ()
      %1147 = arith.constant 68 : i64
      %1148 = func.call @cc_box_character(%1147) : (i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      %1149 = arith.constant 69 : i64
      %1150 = func.call @cc_box_character(%1149) : (i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1151 = arith.constant 70 : i64
      %1152 = func.call @cc_box_character(%1151) : (i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1154, %1153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
      %1156 = arith.addi %1155, %__rlasp_stack_elide_zero_506 : i64
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @cc_cons(%1157, %1156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
      %1159 = arith.addi %1158, %__rlasp_stack_elide_zero_507 : i64
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @cc_cons(%1160, %1159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %1162 = arith.addi %1161, %__rlasp_stack_elide_zero_508 : i64
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @cc_cons(%1163, %1162) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %1165 = arith.addi %1164, %__rlasp_stack_elide_zero_509 : i64
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @cc_cons(%1166, %1165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %1168 = arith.addi %1167, %__rlasp_stack_elide_zero_510 : i64
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @cc_cons(%1169, %1168) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %1171 = arith.addi %1170, %__rlasp_stack_elide_zero_511 : i64
      %1172 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1173 = arith.constant 12 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1176 = arith.constant 7 : i64
      %1177 = func.call @cc_make_string(%1175, %1176) : (!llvm.ptr, i64) -> i64
      %1178 = func.call @cc_intern(%1174, %1177) : (i64, i64) -> i64
      %1179 = func.call @cc_nil_value() : () -> i64
      %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
      %1181 = func.call @cc_values_pack(%1180) : (i64) -> i64
      %1182 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1183 = arith.constant 9 : i64
      %1184 = func.call @cc_make_string(%1182, %1183) : (!llvm.ptr, i64) -> i64
      %1185 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1186 = arith.constant 11 : i64
      %1187 = func.call @cc_make_string(%1185, %1186) : (!llvm.ptr, i64) -> i64
      %1188 = func.call @cc_intern(%1184, %1187) : (i64, i64) -> i64
      %1189 = func.call @cc_nil_value() : () -> i64
      %1190 = func.call @cc_cons(%1188, %1189) : (i64, i64) -> i64
      %1191 = func.call @cc_values_pack(%1190) : (i64) -> i64
      %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
      %1192 = arith.addi %1188, %__rlasp_stack_elide_zero_512 : i64
      %1193 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1194 = arith.constant 12 : i64
      %1195 = func.call @cc_make_string(%1193, %1194) : (!llvm.ptr, i64) -> i64
      %1196 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1197 = arith.constant 7 : i64
      %1198 = func.call @cc_make_string(%1196, %1197) : (!llvm.ptr, i64) -> i64
      %1199 = func.call @cc_intern(%1195, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_nil_value() : () -> i64
      %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
      %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
      %1203 = arith.constant 4 : i64
      %1204 = func.call @cc_box_fixnum(%1203) : (i64) -> i64
      %1205 = func.call @cc_nil_value() : () -> i64
      %1206 = func.call @cc_errorp(%1130) : (i64) -> i64
      %1207 = arith.cmpi ne, %1206, %1205 : i64
      %1208 = arith.cmpi eq, %1205, %1205 : i64
      %1209 = arith.andi %1207, %1208 : i1
      %1210 = scf.if %1209 -> (i64) {
        scf.yield %1130 : i64
      } else {
        scf.yield %1205 : i64
      }
      %1211 = func.call @cc_errorp(%1137) : (i64) -> i64
      %1212 = arith.cmpi ne, %1211, %1205 : i64
      %1213 = arith.cmpi eq, %1210, %1205 : i64
      %1214 = arith.andi %1212, %1213 : i1
      %1215 = scf.if %1214 -> (i64) {
        scf.yield %1137 : i64
      } else {
        scf.yield %1210 : i64
      }
      %1216 = func.call @cc_errorp(%1171) : (i64) -> i64
      %1217 = arith.cmpi ne, %1216, %1205 : i64
      %1218 = arith.cmpi eq, %1215, %1205 : i64
      %1219 = arith.andi %1217, %1218 : i1
      %1220 = scf.if %1219 -> (i64) {
        scf.yield %1171 : i64
      } else {
        scf.yield %1215 : i64
      }
      %1221 = func.call @cc_errorp(%1178) : (i64) -> i64
      %1222 = arith.cmpi ne, %1221, %1205 : i64
      %1223 = arith.cmpi eq, %1220, %1205 : i64
      %1224 = arith.andi %1222, %1223 : i1
      %1225 = scf.if %1224 -> (i64) {
        scf.yield %1178 : i64
      } else {
        scf.yield %1220 : i64
      }
      %1226 = func.call @cc_errorp(%1192) : (i64) -> i64
      %1227 = arith.cmpi ne, %1226, %1205 : i64
      %1228 = arith.cmpi eq, %1225, %1205 : i64
      %1229 = arith.andi %1227, %1228 : i1
      %1230 = scf.if %1229 -> (i64) {
        scf.yield %1192 : i64
      } else {
        scf.yield %1225 : i64
      }
      %1231 = func.call @cc_errorp(%1199) : (i64) -> i64
      %1232 = arith.cmpi ne, %1231, %1205 : i64
      %1233 = arith.cmpi eq, %1230, %1205 : i64
      %1234 = arith.andi %1232, %1233 : i1
      %1235 = scf.if %1234 -> (i64) {
        scf.yield %1199 : i64
      } else {
        scf.yield %1230 : i64
      }
      %1236 = func.call @cc_errorp(%1204) : (i64) -> i64
      %1237 = arith.cmpi ne, %1236, %1205 : i64
      %1238 = arith.cmpi eq, %1235, %1205 : i64
      %1239 = arith.andi %1237, %1238 : i1
      %1240 = scf.if %1239 -> (i64) {
        scf.yield %1204 : i64
      } else {
        scf.yield %1235 : i64
      }
      %1241 = arith.cmpi ne, %1240, %1205 : i64
      scf.if %1241 {
        func.call @stack_push_pointer(%1240) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1130) : (i64) -> ()
        func.call @stack_push_pointer(%1137) : (i64) -> ()
        func.call @stack_push_pointer(%1171) : (i64) -> ()
        func.call @stack_push_pointer(%1178) : (i64) -> ()
        func.call @stack_push_pointer(%1192) : (i64) -> ()
        func.call @stack_push_pointer(%1199) : (i64) -> ()
        func.call @stack_push_pointer(%1204) : (i64) -> ()
        %1242 = llvm.mlir.addressof @str97 : !llvm.ptr
        %1243 = func.call @cc_make_function_ref_const(%1242) : (!llvm.ptr) -> i64
        %1244 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%1243, %1244) : (i64, i64) -> ()
      }
      %1245 = func.call @stack_pop_pointer() : () -> i64
      %1246 = func.call @cc_make_symbol_from_name(%1245) : (i64) -> i64
      %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
      %1247 = arith.addi %1246, %__rlasp_stack_elide_zero_513 : i64
      func.call @stack_push_nil() : () -> ()
      %1248 = func.call @stack_pop_pointer() : () -> i64
      %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
      %1250 = arith.addi %1249, %__rlasp_stack_elide_zero_514 : i64
      %1251 = func.call @cc_values_pack(%1250) : (i64) -> i64
      %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
      %1252 = arith.addi %1251, %__rlasp_stack_elide_zero_515 : i64
      scf.yield %1252 : i64
    }
    func.call @stack_push_pointer(%1125) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808582"() {
    %1467 = func.call @cc_nil_value() : () -> i64
    %1468 = func.call @cc_nil_value() : () -> i64
    %1469 = func.call @cc_errorp(%1467) : (i64) -> i64
    %1470 = arith.cmpi ne, %1469, %1468 : i64
    %1471 = scf.if %1470 -> (i64) {
      scf.yield %1467 : i64
    } else {
      %1472 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1473 = func.call @cc_nil_value() : () -> i64
      %1474 = func.call @cc_nil_value() : () -> i64
      %1475 = func.call @cc_errorp(%1473) : (i64) -> i64
      %1476 = arith.cmpi ne, %1475, %1474 : i64
      %1477 = scf.if %1476 -> (i64) {
        scf.yield %1473 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1478 = arith.constant 23 : i64
        %1479 = func.call @cc_box_fixnum(%1478) : (i64) -> i64
        %1480 = func.call @cc_nil_value() : () -> i64
        %1481 = func.call @cc_nil_value() : () -> i64
        %1482 = func.call @cc_errorp(%1480) : (i64) -> i64
        %1483 = arith.cmpi ne, %1482, %1481 : i64
        %1484 = scf.if %1483 -> (i64) {
          scf.yield %1480 : i64
        } else {
          %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
          %1485 = arith.addi %1479, %__rlasp_stack_elide_zero_516 : i64
          %1486 = func.call @cc_makunbound(%1485) : (i64) -> i64
          %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
          %1487 = arith.addi %1486, %__rlasp_stack_elide_zero_517 : i64
          scf.yield %1487 : i64
        }
        %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
        %1488 = arith.addi %1484, %__rlasp_stack_elide_zero_518 : i64
        %1489 = func.call @cc_errorp(%1488) : (i64) -> i64
        %1490 = func.call @cc_nil_value() : () -> i64
        %1491 = arith.cmpi ne, %1489, %1490 : i64
        scf.if %1491 {
          func.call @stack_push_pointer(%1488) : (i64) -> ()
        } else {
          %1492 = func.call @cc_multiple_value_list(%1488) : (i64) -> i64
          func.call @stack_push_pointer(%1492) : (i64) -> ()
        }
        %1493 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1494 = func.call @stack_pop_pointer() : () -> i64
        %1495 = func.call @cc_nil_value() : () -> i64
        %1496 = func.call @cc_maybe_error_from_multiple_value_list(%1493) : (i64) -> i64
        %1497 = func.call @cc_errorp(%1496) : (i64) -> i64
        %1498 = arith.cmpi ne, %1497, %1495 : i64
        %1499 = arith.cmpi eq, %1495, %1495 : i64
        %1500 = arith.andi %1498, %1499 : i1
        %1501 = scf.if %1500 -> (i64) {
          scf.yield %1496 : i64
        } else {
          scf.yield %1495 : i64
        }
        %1502 = arith.cmpi ne, %1501, %1495 : i64
        scf.if %1502 {
          func.call @stack_push_pointer(%1501) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1503 = func.call @stack_pop_pointer() : () -> i64
          %1504 = func.call @cc_cons(%1494, %1503) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
          %1505 = arith.addi %1504, %__rlasp_stack_elide_zero_519 : i64
          %1506 = func.call @cc_cons(%1493, %1505) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
          %1507 = arith.addi %1506, %__rlasp_stack_elide_zero_520 : i64
          %1508 = func.call @cc_values_pack(%1507) : (i64) -> i64
          func.call @stack_push_pointer(%1508) : (i64) -> ()
        }
        %1509 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1509 : i64
      }
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %1510 = arith.addi %1477, %__rlasp_stack_elide_zero_521 : i64
      %1511 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1512 = func.call @cc_errorp(%1510) : (i64) -> i64
      %1513 = func.call @cc_nil_value() : () -> i64
      %1514 = arith.cmpi ne, %1512, %1513 : i64
      scf.if %1514 {
        %1515 = func.call @cc_condition_value(%1510) : (i64) -> i64
        %1516 = func.call @cc_values2(%1513, %1515) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1516) : (i64) -> ()
      } else {
        %1517 = func.call @cc_multiple_value_list(%1510) : (i64) -> i64
        %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
        func.call @stack_push_pointer(%1518) : (i64) -> ()
      }
      %1519 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1519 : i64
    }
    func.call @stack_push_pointer(%1471) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808583"() {
    %1703 = func.call @cc_nil_value() : () -> i64
    %1704 = func.call @cc_nil_value() : () -> i64
    %1705 = func.call @cc_errorp(%1703) : (i64) -> i64
    %1706 = arith.cmpi ne, %1705, %1704 : i64
    %1707 = scf.if %1706 -> (i64) {
      scf.yield %1703 : i64
    } else {
      %1708 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1709 = func.call @cc_nil_value() : () -> i64
      %1710 = func.call @cc_nil_value() : () -> i64
      %1711 = func.call @cc_errorp(%1709) : (i64) -> i64
      %1712 = arith.cmpi ne, %1711, %1710 : i64
      %1713 = scf.if %1712 -> (i64) {
        scf.yield %1709 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1714 = arith.constant -1 : i64
        func.call @stack_push_fixnum(%1714) : (i64) -> ()
        %1715 = func.call @stack_pop_pointer() : () -> i64
        %1716 = func.call @cc_gensym(%1715) : (i64) -> i64
        %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
        %1717 = arith.addi %1716, %__rlasp_stack_elide_zero_522 : i64
        %1718 = func.call @cc_errorp(%1717) : (i64) -> i64
        %1719 = func.call @cc_nil_value() : () -> i64
        %1720 = arith.cmpi ne, %1718, %1719 : i64
        scf.if %1720 {
          func.call @stack_push_pointer(%1717) : (i64) -> ()
        } else {
          %1721 = func.call @cc_multiple_value_list(%1717) : (i64) -> i64
          func.call @stack_push_pointer(%1721) : (i64) -> ()
        }
        %1722 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1723 = func.call @stack_pop_pointer() : () -> i64
        %1724 = func.call @cc_nil_value() : () -> i64
        %1725 = func.call @cc_maybe_error_from_multiple_value_list(%1722) : (i64) -> i64
        %1726 = func.call @cc_errorp(%1725) : (i64) -> i64
        %1727 = arith.cmpi ne, %1726, %1724 : i64
        %1728 = arith.cmpi eq, %1724, %1724 : i64
        %1729 = arith.andi %1727, %1728 : i1
        %1730 = scf.if %1729 -> (i64) {
          scf.yield %1725 : i64
        } else {
          scf.yield %1724 : i64
        }
        %1731 = arith.cmpi ne, %1730, %1724 : i64
        scf.if %1731 {
          func.call @stack_push_pointer(%1730) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1732 = func.call @stack_pop_pointer() : () -> i64
          %1733 = func.call @cc_cons(%1723, %1732) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
          %1734 = arith.addi %1733, %__rlasp_stack_elide_zero_523 : i64
          %1735 = func.call @cc_cons(%1722, %1734) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
          %1736 = arith.addi %1735, %__rlasp_stack_elide_zero_524 : i64
          %1737 = func.call @cc_values_pack(%1736) : (i64) -> i64
          func.call @stack_push_pointer(%1737) : (i64) -> ()
        }
        %1738 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1738 : i64
      }
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %1739 = arith.addi %1713, %__rlasp_stack_elide_zero_525 : i64
      %1740 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1741 = func.call @cc_errorp(%1739) : (i64) -> i64
      %1742 = func.call @cc_nil_value() : () -> i64
      %1743 = arith.cmpi ne, %1741, %1742 : i64
      scf.if %1743 {
        %1744 = func.call @cc_condition_value(%1739) : (i64) -> i64
        %1745 = func.call @cc_values2(%1742, %1744) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1745) : (i64) -> ()
      } else {
        %1746 = func.call @cc_multiple_value_list(%1739) : (i64) -> i64
        %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
        func.call @stack_push_pointer(%1747) : (i64) -> ()
      }
      %1748 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1748 : i64
    }
    func.call @stack_push_pointer(%1707) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808584"() {
    %1957 = func.call @cc_nil_value() : () -> i64
    %1958 = func.call @cc_nil_value() : () -> i64
    %1959 = func.call @cc_errorp(%1957) : (i64) -> i64
    %1960 = arith.cmpi ne, %1959, %1958 : i64
    %1961 = scf.if %1960 -> (i64) {
      scf.yield %1957 : i64
    } else {
      %1962 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1963 = func.call @cc_nil_value() : () -> i64
      %1964 = func.call @cc_nil_value() : () -> i64
      %1965 = func.call @cc_errorp(%1963) : (i64) -> i64
      %1966 = arith.cmpi ne, %1965, %1964 : i64
      %1967 = scf.if %1966 -> (i64) {
        scf.yield %1963 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1968 = llvm.mlir.addressof @str152 : !llvm.ptr
        %1969 = arith.constant 20 : i64
        %1970 = func.call @cc_make_string(%1968, %1969) : (!llvm.ptr, i64) -> i64
        %1971 = llvm.mlir.addressof @str153 : !llvm.ptr
        %1972 = arith.constant 11 : i64
        %1973 = func.call @cc_make_string(%1971, %1972) : (!llvm.ptr, i64) -> i64
        %1974 = func.call @cc_intern(%1970, %1973) : (i64, i64) -> i64
        %1975 = func.call @cc_nil_value() : () -> i64
        %1976 = func.call @cc_cons(%1974, %1975) : (i64, i64) -> i64
        %1977 = func.call @cc_values_pack(%1976) : (i64) -> i64
        %1978 = func.call @cc_symbol_value(%1974) : (i64) -> i64
        %1979 = arith.constant 1 : i64
        %1980 = func.call @cc_box_fixnum(%1979) : (i64) -> i64
        %1982 = arith.constant 3 : i64
        %1981 = arith.andi %1978, %1982 : i64
        %1983 = arith.constant 0 : i64
        %1984 = arith.cmpi eq, %1981, %1983 : i64
        %1986 = arith.constant 3 : i64
        %1985 = arith.andi %1980, %1986 : i64
        %1987 = arith.constant 0 : i64
        %1988 = arith.cmpi eq, %1985, %1987 : i64
        %1989 = arith.andi %1984, %1988 : i1
        %1990 = scf.if %1989 -> (i64) {
          %1991 = arith.constant 2 : i64
          %1992 = arith.shrsi %1978, %1991 : i64
          %1993 = arith.constant 2 : i64
          %1994 = arith.shrsi %1980, %1993 : i64
          %1995 = arith.subi %1992, %1994 : i64
          %1996 = arith.constant -2305843009213693952 : i64
          %1997 = arith.constant 2305843009213693951 : i64
          %1998 = arith.cmpi sge, %1995, %1996 : i64
          %1999 = arith.cmpi sle, %1995, %1997 : i64
          %2000 = arith.andi %1998, %1999 : i1
          %2001 = scf.if %2000 -> (i64) {
            %2002 = arith.constant 2 : i64
            %2003 = arith.shli %1995, %2002 : i64
            scf.yield %2003 : i64
          } else {
            %2004 = func.call @cc_sub(%1978, %1980) : (i64, i64) -> i64
            scf.yield %2004 : i64
          }
          scf.yield %2001 : i64
        } else {
          %2005 = func.call @cc_sub(%1978, %1980) : (i64, i64) -> i64
          scf.yield %2005 : i64
        }
        %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
        %2006 = arith.addi %1990, %__rlasp_stack_elide_zero_526 : i64
        %2007 = func.call @cc_gensym(%2006) : (i64) -> i64
        %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
        %2008 = arith.addi %2007, %__rlasp_stack_elide_zero_527 : i64
        %2009 = func.call @cc_errorp(%2008) : (i64) -> i64
        %2010 = func.call @cc_nil_value() : () -> i64
        %2011 = arith.cmpi ne, %2009, %2010 : i64
        scf.if %2011 {
          func.call @stack_push_pointer(%2008) : (i64) -> ()
        } else {
          %2012 = func.call @cc_multiple_value_list(%2008) : (i64) -> i64
          func.call @stack_push_pointer(%2012) : (i64) -> ()
        }
        %2013 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2014 = func.call @stack_pop_pointer() : () -> i64
        %2015 = func.call @cc_nil_value() : () -> i64
        %2016 = func.call @cc_maybe_error_from_multiple_value_list(%2013) : (i64) -> i64
        %2017 = func.call @cc_errorp(%2016) : (i64) -> i64
        %2018 = arith.cmpi ne, %2017, %2015 : i64
        %2019 = arith.cmpi eq, %2015, %2015 : i64
        %2020 = arith.andi %2018, %2019 : i1
        %2021 = scf.if %2020 -> (i64) {
          scf.yield %2016 : i64
        } else {
          scf.yield %2015 : i64
        }
        %2022 = arith.cmpi ne, %2021, %2015 : i64
        scf.if %2022 {
          func.call @stack_push_pointer(%2021) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2023 = func.call @stack_pop_pointer() : () -> i64
          %2024 = func.call @cc_cons(%2014, %2023) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_528 = arith.constant 0 : i64
          %2025 = arith.addi %2024, %__rlasp_stack_elide_zero_528 : i64
          %2026 = func.call @cc_cons(%2013, %2025) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_529 = arith.constant 0 : i64
          %2027 = arith.addi %2026, %__rlasp_stack_elide_zero_529 : i64
          %2028 = func.call @cc_values_pack(%2027) : (i64) -> i64
          func.call @stack_push_pointer(%2028) : (i64) -> ()
        }
        %2029 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2029 : i64
      }
      %__rlasp_stack_elide_zero_530 = arith.constant 0 : i64
      %2030 = arith.addi %1967, %__rlasp_stack_elide_zero_530 : i64
      %2031 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2032 = func.call @cc_errorp(%2030) : (i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = arith.cmpi ne, %2032, %2033 : i64
      scf.if %2034 {
        %2035 = func.call @cc_condition_value(%2030) : (i64) -> i64
        %2036 = func.call @cc_values2(%2033, %2035) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2036) : (i64) -> ()
      } else {
        %2037 = func.call @cc_multiple_value_list(%2030) : (i64) -> i64
        %2038 = func.call @cc_values_pack(%2037) : (i64) -> i64
        func.call @stack_push_pointer(%2038) : (i64) -> ()
      }
      %2039 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2039 : i64
    }
    func.call @stack_push_pointer(%1961) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808585"() {
    %2245 = func.call @cc_nil_value() : () -> i64
    %2246 = func.call @cc_nil_value() : () -> i64
    %2247 = func.call @cc_errorp(%2245) : (i64) -> i64
    %2248 = arith.cmpi ne, %2247, %2246 : i64
    %2249 = scf.if %2248 -> (i64) {
      scf.yield %2245 : i64
    } else {
      %2250 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_errorp(%2251) : (i64) -> i64
      %2254 = arith.cmpi ne, %2253, %2252 : i64
      %2255 = scf.if %2254 -> (i64) {
        scf.yield %2251 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2256 = llvm.mlir.addressof @str173 : !llvm.ptr
        %2257 = arith.constant 5 : i64
        %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
        %2259 = llvm.mlir.addressof @str174 : !llvm.ptr
        %2260 = arith.constant 11 : i64
        %2261 = func.call @cc_make_string(%2259, %2260) : (!llvm.ptr, i64) -> i64
        %2262 = func.call @cc_intern(%2258, %2261) : (i64, i64) -> i64
        %2263 = func.call @cc_nil_value() : () -> i64
        %2264 = func.call @cc_cons(%2262, %2263) : (i64, i64) -> i64
        %2265 = func.call @cc_values_pack(%2264) : (i64) -> i64
        %__rlasp_stack_elide_zero_531 = arith.constant 0 : i64
        %2266 = arith.addi %2262, %__rlasp_stack_elide_zero_531 : i64
        %2267 = func.call @cc_gensym(%2266) : (i64) -> i64
        %__rlasp_stack_elide_zero_532 = arith.constant 0 : i64
        %2268 = arith.addi %2267, %__rlasp_stack_elide_zero_532 : i64
        %2269 = func.call @cc_errorp(%2268) : (i64) -> i64
        %2270 = func.call @cc_nil_value() : () -> i64
        %2271 = arith.cmpi ne, %2269, %2270 : i64
        scf.if %2271 {
          func.call @stack_push_pointer(%2268) : (i64) -> ()
        } else {
          %2272 = func.call @cc_multiple_value_list(%2268) : (i64) -> i64
          func.call @stack_push_pointer(%2272) : (i64) -> ()
        }
        %2273 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2274 = func.call @stack_pop_pointer() : () -> i64
        %2275 = func.call @cc_nil_value() : () -> i64
        %2276 = func.call @cc_maybe_error_from_multiple_value_list(%2273) : (i64) -> i64
        %2277 = func.call @cc_errorp(%2276) : (i64) -> i64
        %2278 = arith.cmpi ne, %2277, %2275 : i64
        %2279 = arith.cmpi eq, %2275, %2275 : i64
        %2280 = arith.andi %2278, %2279 : i1
        %2281 = scf.if %2280 -> (i64) {
          scf.yield %2276 : i64
        } else {
          scf.yield %2275 : i64
        }
        %2282 = arith.cmpi ne, %2281, %2275 : i64
        scf.if %2282 {
          func.call @stack_push_pointer(%2281) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2283 = func.call @stack_pop_pointer() : () -> i64
          %2284 = func.call @cc_cons(%2274, %2283) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_533 = arith.constant 0 : i64
          %2285 = arith.addi %2284, %__rlasp_stack_elide_zero_533 : i64
          %2286 = func.call @cc_cons(%2273, %2285) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_534 = arith.constant 0 : i64
          %2287 = arith.addi %2286, %__rlasp_stack_elide_zero_534 : i64
          %2288 = func.call @cc_values_pack(%2287) : (i64) -> i64
          func.call @stack_push_pointer(%2288) : (i64) -> ()
        }
        %2289 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2289 : i64
      }
      %__rlasp_stack_elide_zero_535 = arith.constant 0 : i64
      %2290 = arith.addi %2255, %__rlasp_stack_elide_zero_535 : i64
      %2291 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2292 = func.call @cc_errorp(%2290) : (i64) -> i64
      %2293 = func.call @cc_nil_value() : () -> i64
      %2294 = arith.cmpi ne, %2292, %2293 : i64
      scf.if %2294 {
        %2295 = func.call @cc_condition_value(%2290) : (i64) -> i64
        %2296 = func.call @cc_values2(%2293, %2295) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2296) : (i64) -> ()
      } else {
        %2297 = func.call @cc_multiple_value_list(%2290) : (i64) -> i64
        %2298 = func.call @cc_values_pack(%2297) : (i64) -> i64
        func.call @stack_push_pointer(%2298) : (i64) -> ()
      }
      %2299 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2299 : i64
    }
    func.call @stack_push_pointer(%2249) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808586"() {
    %2502 = func.call @cc_nil_value() : () -> i64
    %2503 = func.call @cc_nil_value() : () -> i64
    %2504 = func.call @cc_errorp(%2502) : (i64) -> i64
    %2505 = arith.cmpi ne, %2504, %2503 : i64
    %2506 = scf.if %2505 -> (i64) {
      scf.yield %2502 : i64
    } else {
      %2507 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2508 = arith.constant 20 : i64
      %2509 = func.call @cc_make_string(%2507, %2508) : (!llvm.ptr, i64) -> i64
      %2510 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2511 = arith.constant 11 : i64
      %2512 = func.call @cc_make_string(%2510, %2511) : (!llvm.ptr, i64) -> i64
      %2513 = func.call @cc_intern(%2509, %2512) : (i64, i64) -> i64
      %2514 = func.call @cc_nil_value() : () -> i64
      %2515 = func.call @cc_cons(%2513, %2514) : (i64, i64) -> i64
      %2516 = func.call @cc_values_pack(%2515) : (i64) -> i64
      %2517 = func.call @cc_symbol_value(%2513) : (i64) -> i64
      %2518 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2519 = arith.constant 20 : i64
      %2520 = func.call @cc_make_string(%2518, %2519) : (!llvm.ptr, i64) -> i64
      %2521 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2522 = arith.constant 11 : i64
      %2523 = func.call @cc_make_string(%2521, %2522) : (!llvm.ptr, i64) -> i64
      %2524 = func.call @cc_intern(%2520, %2523) : (i64, i64) -> i64
      %2525 = func.call @cc_nil_value() : () -> i64
      %2526 = func.call @cc_cons(%2524, %2525) : (i64, i64) -> i64
      %2527 = func.call @cc_values_pack(%2526) : (i64) -> i64
      %2528 = func.call @cc_symbol_value(%2524) : (i64) -> i64
      %2530 = arith.constant 3 : i64
      %2529 = arith.andi %2517, %2530 : i64
      %2531 = arith.constant 0 : i64
      %2532 = arith.cmpi eq, %2529, %2531 : i64
      %2534 = arith.constant 3 : i64
      %2533 = arith.andi %2528, %2534 : i64
      %2535 = arith.constant 0 : i64
      %2536 = arith.cmpi eq, %2533, %2535 : i64
      %2537 = arith.andi %2532, %2536 : i1
      %2538 = scf.if %2537 -> (i64) {
        %2539 = arith.constant 2 : i64
        %2540 = arith.shrsi %2517, %2539 : i64
        %2541 = arith.constant 2 : i64
        %2542 = arith.shrsi %2528, %2541 : i64
        %2543 = arith.addi %2540, %2542 : i64
        %2544 = arith.constant -2305843009213693952 : i64
        %2545 = arith.constant 2305843009213693951 : i64
        %2546 = arith.cmpi sge, %2543, %2544 : i64
        %2547 = arith.cmpi sle, %2543, %2545 : i64
        %2548 = arith.andi %2546, %2547 : i1
        %2549 = scf.if %2548 -> (i64) {
          %2550 = arith.constant 2 : i64
          %2551 = arith.shli %2543, %2550 : i64
          scf.yield %2551 : i64
        } else {
          %2552 = func.call @cc_add(%2517, %2528) : (i64, i64) -> i64
          scf.yield %2552 : i64
        }
        scf.yield %2549 : i64
      } else {
        %2553 = func.call @cc_add(%2517, %2528) : (i64, i64) -> i64
        scf.yield %2553 : i64
      }
      %__rlasp_stack_elide_zero_536 = arith.constant 0 : i64
      %2554 = arith.addi %2538, %__rlasp_stack_elide_zero_536 : i64
      %2555 = func.call @cc_gensym(%2554) : (i64) -> i64
      %__rlasp_stack_elide_zero_537 = arith.constant 0 : i64
      %2556 = arith.addi %2555, %__rlasp_stack_elide_zero_537 : i64
      %2557 = func.call @cc_nil_value() : () -> i64
      %2558 = func.call @cc_cons(%2556, %2557) : (i64, i64) -> i64
      %2559 = func.call @cc_not(%2558) : (i64) -> i64
      %__rlasp_stack_elide_zero_538 = arith.constant 0 : i64
      %2560 = arith.addi %2559, %__rlasp_stack_elide_zero_538 : i64
      %2561 = func.call @cc_nil_value() : () -> i64
      %2562 = func.call @cc_cons(%2560, %2561) : (i64, i64) -> i64
      %2563 = func.call @cc_not(%2562) : (i64) -> i64
      %__rlasp_stack_elide_zero_539 = arith.constant 0 : i64
      %2564 = arith.addi %2563, %__rlasp_stack_elide_zero_539 : i64
      scf.yield %2564 : i64
    }
    func.call @stack_push_pointer(%2506) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808587"() {
    %2855 = func.call @cc_nil_value() : () -> i64
    %2856 = func.call @cc_nil_value() : () -> i64
    %2857 = func.call @cc_errorp(%2855) : (i64) -> i64
    %2858 = arith.cmpi ne, %2857, %2856 : i64
    %2859 = scf.if %2858 -> (i64) {
      scf.yield %2855 : i64
    } else {
      %2860 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2861 = arith.constant 50 : i64
      %2862 = func.call @cc_parse_bignum(%2860, %2861) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_540 = arith.constant 0 : i64
      %2863 = arith.addi %2862, %__rlasp_stack_elide_zero_540 : i64
      %2864 = func.call @cc_nil_value() : () -> i64
      %2865 = func.call @cc_nil_value() : () -> i64
      %2866 = func.call @cc_errorp(%2864) : (i64) -> i64
      %2867 = arith.cmpi ne, %2866, %2865 : i64
      %2868 = scf.if %2867 -> (i64) {
        scf.yield %2864 : i64
      } else {
        %2869 = arith.constant 1 : i64
        %2870 = func.call @cc_box_fixnum(%2869) : (i64) -> i64
        %2872 = arith.constant 3 : i64
        %2871 = arith.andi %2863, %2872 : i64
        %2873 = arith.constant 0 : i64
        %2874 = arith.cmpi eq, %2871, %2873 : i64
        %2876 = arith.constant 3 : i64
        %2875 = arith.andi %2870, %2876 : i64
        %2877 = arith.constant 0 : i64
        %2878 = arith.cmpi eq, %2875, %2877 : i64
        %2879 = arith.andi %2874, %2878 : i1
        %2880 = scf.if %2879 -> (i64) {
          %2881 = arith.constant 2 : i64
          %2882 = arith.shrsi %2863, %2881 : i64
          %2883 = arith.constant 2 : i64
          %2884 = arith.shrsi %2870, %2883 : i64
          %2885 = arith.addi %2882, %2884 : i64
          %2886 = arith.constant -2305843009213693952 : i64
          %2887 = arith.constant 2305843009213693951 : i64
          %2888 = arith.cmpi sge, %2885, %2886 : i64
          %2889 = arith.cmpi sle, %2885, %2887 : i64
          %2890 = arith.andi %2888, %2889 : i1
          %2891 = scf.if %2890 -> (i64) {
            %2892 = arith.constant 2 : i64
            %2893 = arith.shli %2885, %2892 : i64
            scf.yield %2893 : i64
          } else {
            %2894 = func.call @cc_add(%2863, %2870) : (i64, i64) -> i64
            scf.yield %2894 : i64
          }
          scf.yield %2891 : i64
        } else {
          %2895 = func.call @cc_add(%2863, %2870) : (i64, i64) -> i64
          scf.yield %2895 : i64
        }
        %__rlasp_stack_elide_zero_541 = arith.constant 0 : i64
        %2896 = arith.addi %2880, %__rlasp_stack_elide_zero_541 : i64
        %2897 = llvm.mlir.addressof @str229 : !llvm.ptr
        %2898 = arith.constant 28 : i64
        %2899 = func.call @cc_make_symbol(%2897, %2898) : (!llvm.ptr, i64) -> i64
        %2900 = func.call @cc_symbol_value(%2899) : (i64) -> i64
        %2901 = func.call @cc_set_symbol_value(%2899, %2863) : (i64, i64) -> i64
        %2902 = func.call @cc_nil_value() : () -> i64
        %2903 = func.call @cc_nil_value() : () -> i64
        %2904 = func.call @cc_errorp(%2902) : (i64) -> i64
        %2905 = arith.cmpi ne, %2904, %2903 : i64
        %2906 = scf.if %2905 -> (i64) {
          scf.yield %2902 : i64
        } else {
          %2907 = func.call @cc_nil_value() : () -> i64
          %2908 = func.call @cc_gensym(%2907) : (i64) -> i64
          %__rlasp_stack_elide_zero_542 = arith.constant 0 : i64
          %2909 = arith.addi %2908, %__rlasp_stack_elide_zero_542 : i64
          scf.yield %2909 : i64
        }
        %2910 = func.call @cc_nil_value() : () -> i64
        %2911 = func.call @cc_errorp(%2906) : (i64) -> i64
        %2912 = arith.cmpi ne, %2911, %2910 : i64
        %2913 = scf.if %2912 -> (i64) {
          scf.yield %2906 : i64
        } else {
          %2914 = llvm.mlir.addressof @str230 : !llvm.ptr
          %2915 = arith.constant 16 : i64
          %2916 = func.call @cc_make_string(%2914, %2915) : (!llvm.ptr, i64) -> i64
          %2917 = llvm.mlir.addressof @str231 : !llvm.ptr
          %2918 = arith.constant 11 : i64
          %2919 = func.call @cc_make_string(%2917, %2918) : (!llvm.ptr, i64) -> i64
          %2920 = func.call @cc_intern(%2916, %2919) : (i64, i64) -> i64
          %2921 = func.call @cc_nil_value() : () -> i64
          %2922 = func.call @cc_cons(%2920, %2921) : (i64, i64) -> i64
          %2923 = func.call @cc_values_pack(%2922) : (i64) -> i64
          %2924 = func.call @cc_symbol_value(%2920) : (i64) -> i64
          %__rlasp_stack_elide_zero_543 = arith.constant 0 : i64
          %2925 = arith.addi %2924, %__rlasp_stack_elide_zero_543 : i64
          scf.yield %2925 : i64
        }
        func.call @stack_push_pointer(%2913) : (i64) -> ()
        %2926 = func.call @cc_restore_symbol_value(%2899, %2900) : (i64, i64) -> i64
        %2927 = func.call @stack_pop_pointer() : () -> i64
        %2928 = arith.constant 1 : i1
        %2930 = arith.constant 3 : i64
        %2929 = arith.andi %2896, %2930 : i64
        %2931 = arith.constant 0 : i64
        %2932 = arith.cmpi eq, %2929, %2931 : i64
        %2934 = arith.constant 3 : i64
        %2933 = arith.andi %2927, %2934 : i64
        %2935 = arith.constant 0 : i64
        %2936 = arith.cmpi eq, %2933, %2935 : i64
        %2937 = arith.andi %2932, %2936 : i1
        %2938 = scf.if %2937 -> (i1) {
          %2939 = arith.constant 2 : i64
          %2940 = arith.shrsi %2896, %2939 : i64
          %2941 = arith.constant 2 : i64
          %2942 = arith.shrsi %2927, %2941 : i64
          %2943 = arith.cmpi eq, %2940, %2942 : i64
          scf.yield %2943 : i1
        } else {
          %2944 = func.call @cc_eq(%2896, %2927) : (i64, i64) -> i64
          %2945 = func.call @cc_nil_value() : () -> i64
          %2946 = arith.cmpi ne, %2944, %2945 : i64
          scf.yield %2946 : i1
        }
        %2947 = arith.andi %2928, %2938 : i1
        %2948 = func.call @cc_nil_value() : () -> i64
        %2949 = func.call @cc_t_value() : () -> i64
        %2950 = scf.if %2947 -> (i64) {
          scf.yield %2949 : i64
        } else {
          scf.yield %2948 : i64
        }
        %__rlasp_stack_elide_zero_544 = arith.constant 0 : i64
        %2951 = arith.addi %2950, %__rlasp_stack_elide_zero_544 : i64
        scf.yield %2951 : i64
      }
      %__rlasp_stack_elide_zero_545 = arith.constant 0 : i64
      %2952 = arith.addi %2868, %__rlasp_stack_elide_zero_545 : i64
      %2953 = func.call @cc_nil_value() : () -> i64
      %2954 = func.call @cc_cons(%2952, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_not(%2954) : (i64) -> i64
      %__rlasp_stack_elide_zero_546 = arith.constant 0 : i64
      %2956 = arith.addi %2955, %__rlasp_stack_elide_zero_546 : i64
      %2957 = func.call @cc_nil_value() : () -> i64
      %2958 = func.call @cc_cons(%2956, %2957) : (i64, i64) -> i64
      %2959 = func.call @cc_not(%2958) : (i64) -> i64
      %__rlasp_stack_elide_zero_547 = arith.constant 0 : i64
      %2960 = arith.addi %2959, %__rlasp_stack_elide_zero_547 : i64
      scf.yield %2960 : i64
    }
    func.call @stack_push_pointer(%2859) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808588"() {
    %3212 = func.call @cc_nil_value() : () -> i64
    %3213 = func.call @cc_nil_value() : () -> i64
    %3214 = func.call @cc_errorp(%3212) : (i64) -> i64
    %3215 = arith.cmpi ne, %3214, %3213 : i64
    %3216 = scf.if %3215 -> (i64) {
      scf.yield %3212 : i64
    } else {
      %3217 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3218 = arith.constant 20 : i64
      %3219 = func.call @cc_make_string(%3217, %3218) : (!llvm.ptr, i64) -> i64
      %3220 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3221 = arith.constant 11 : i64
      %3222 = func.call @cc_make_string(%3220, %3221) : (!llvm.ptr, i64) -> i64
      %3223 = func.call @cc_intern(%3219, %3222) : (i64, i64) -> i64
      %3224 = func.call @cc_nil_value() : () -> i64
      %3225 = func.call @cc_cons(%3223, %3224) : (i64, i64) -> i64
      %3226 = func.call @cc_values_pack(%3225) : (i64) -> i64
      %3227 = func.call @cc_symbol_value(%3223) : (i64) -> i64
      %3228 = arith.constant 1 : i64
      %3229 = func.call @cc_box_fixnum(%3228) : (i64) -> i64
      %3231 = arith.constant 3 : i64
      %3230 = arith.andi %3227, %3231 : i64
      %3232 = arith.constant 0 : i64
      %3233 = arith.cmpi eq, %3230, %3232 : i64
      %3235 = arith.constant 3 : i64
      %3234 = arith.andi %3229, %3235 : i64
      %3236 = arith.constant 0 : i64
      %3237 = arith.cmpi eq, %3234, %3236 : i64
      %3238 = arith.andi %3233, %3237 : i1
      %3239 = scf.if %3238 -> (i64) {
        %3240 = arith.constant 2 : i64
        %3241 = arith.shrsi %3227, %3240 : i64
        %3242 = arith.constant 2 : i64
        %3243 = arith.shrsi %3229, %3242 : i64
        %3244 = arith.addi %3241, %3243 : i64
        %3245 = arith.constant -2305843009213693952 : i64
        %3246 = arith.constant 2305843009213693951 : i64
        %3247 = arith.cmpi sge, %3244, %3245 : i64
        %3248 = arith.cmpi sle, %3244, %3246 : i64
        %3249 = arith.andi %3247, %3248 : i1
        %3250 = scf.if %3249 -> (i64) {
          %3251 = arith.constant 2 : i64
          %3252 = arith.shli %3244, %3251 : i64
          scf.yield %3252 : i64
        } else {
          %3253 = func.call @cc_add(%3227, %3229) : (i64, i64) -> i64
          scf.yield %3253 : i64
        }
        scf.yield %3250 : i64
      } else {
        %3254 = func.call @cc_add(%3227, %3229) : (i64, i64) -> i64
        scf.yield %3254 : i64
      }
      %__rlasp_stack_elide_zero_548 = arith.constant 0 : i64
      %3255 = arith.addi %3239, %__rlasp_stack_elide_zero_548 : i64
      %3256 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3257 = arith.constant 20 : i64
      %3258 = func.call @cc_make_string(%3256, %3257) : (!llvm.ptr, i64) -> i64
      %3259 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3260 = arith.constant 11 : i64
      %3261 = func.call @cc_make_string(%3259, %3260) : (!llvm.ptr, i64) -> i64
      %3262 = func.call @cc_intern(%3258, %3261) : (i64, i64) -> i64
      %3263 = func.call @cc_nil_value() : () -> i64
      %3264 = func.call @cc_cons(%3262, %3263) : (i64, i64) -> i64
      %3265 = func.call @cc_values_pack(%3264) : (i64) -> i64
      %3266 = func.call @cc_symbol_value(%3262) : (i64) -> i64
      %3267 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3268 = arith.constant 28 : i64
      %3269 = func.call @cc_make_symbol(%3267, %3268) : (!llvm.ptr, i64) -> i64
      %3270 = func.call @cc_symbol_value(%3269) : (i64) -> i64
      %3271 = func.call @cc_set_symbol_value(%3269, %3266) : (i64, i64) -> i64
      %3272 = func.call @cc_nil_value() : () -> i64
      %3273 = func.call @cc_nil_value() : () -> i64
      %3274 = func.call @cc_errorp(%3272) : (i64) -> i64
      %3275 = arith.cmpi ne, %3274, %3273 : i64
      %3276 = scf.if %3275 -> (i64) {
        scf.yield %3272 : i64
      } else {
        %3277 = func.call @cc_nil_value() : () -> i64
        %3278 = func.call @cc_gensym(%3277) : (i64) -> i64
        %__rlasp_stack_elide_zero_549 = arith.constant 0 : i64
        %3279 = arith.addi %3278, %__rlasp_stack_elide_zero_549 : i64
        scf.yield %3279 : i64
      }
      %3280 = func.call @cc_nil_value() : () -> i64
      %3281 = func.call @cc_errorp(%3276) : (i64) -> i64
      %3282 = arith.cmpi ne, %3281, %3280 : i64
      %3283 = scf.if %3282 -> (i64) {
        scf.yield %3276 : i64
      } else {
        %3284 = llvm.mlir.addressof @str262 : !llvm.ptr
        %3285 = arith.constant 16 : i64
        %3286 = func.call @cc_make_string(%3284, %3285) : (!llvm.ptr, i64) -> i64
        %3287 = llvm.mlir.addressof @str263 : !llvm.ptr
        %3288 = arith.constant 11 : i64
        %3289 = func.call @cc_make_string(%3287, %3288) : (!llvm.ptr, i64) -> i64
        %3290 = func.call @cc_intern(%3286, %3289) : (i64, i64) -> i64
        %3291 = func.call @cc_nil_value() : () -> i64
        %3292 = func.call @cc_cons(%3290, %3291) : (i64, i64) -> i64
        %3293 = func.call @cc_values_pack(%3292) : (i64) -> i64
        %3294 = func.call @cc_symbol_value(%3290) : (i64) -> i64
        %__rlasp_stack_elide_zero_550 = arith.constant 0 : i64
        %3295 = arith.addi %3294, %__rlasp_stack_elide_zero_550 : i64
        scf.yield %3295 : i64
      }
      func.call @stack_push_pointer(%3283) : (i64) -> ()
      %3296 = func.call @cc_restore_symbol_value(%3269, %3270) : (i64, i64) -> i64
      %3297 = func.call @stack_pop_pointer() : () -> i64
      %3298 = arith.constant 1 : i1
      %3300 = arith.constant 3 : i64
      %3299 = arith.andi %3255, %3300 : i64
      %3301 = arith.constant 0 : i64
      %3302 = arith.cmpi eq, %3299, %3301 : i64
      %3304 = arith.constant 3 : i64
      %3303 = arith.andi %3297, %3304 : i64
      %3305 = arith.constant 0 : i64
      %3306 = arith.cmpi eq, %3303, %3305 : i64
      %3307 = arith.andi %3302, %3306 : i1
      %3308 = scf.if %3307 -> (i1) {
        %3309 = arith.constant 2 : i64
        %3310 = arith.shrsi %3255, %3309 : i64
        %3311 = arith.constant 2 : i64
        %3312 = arith.shrsi %3297, %3311 : i64
        %3313 = arith.cmpi eq, %3310, %3312 : i64
        scf.yield %3313 : i1
      } else {
        %3314 = func.call @cc_eq(%3255, %3297) : (i64, i64) -> i64
        %3315 = func.call @cc_nil_value() : () -> i64
        %3316 = arith.cmpi ne, %3314, %3315 : i64
        scf.yield %3316 : i1
      }
      %3317 = arith.andi %3298, %3308 : i1
      %3318 = func.call @cc_nil_value() : () -> i64
      %3319 = func.call @cc_t_value() : () -> i64
      %3320 = scf.if %3317 -> (i64) {
        scf.yield %3319 : i64
      } else {
        scf.yield %3318 : i64
      }
      %__rlasp_stack_elide_zero_551 = arith.constant 0 : i64
      %3321 = arith.addi %3320, %__rlasp_stack_elide_zero_551 : i64
      %3322 = func.call @cc_nil_value() : () -> i64
      %3323 = func.call @cc_cons(%3321, %3322) : (i64, i64) -> i64
      %3324 = func.call @cc_not(%3323) : (i64) -> i64
      %__rlasp_stack_elide_zero_552 = arith.constant 0 : i64
      %3325 = arith.addi %3324, %__rlasp_stack_elide_zero_552 : i64
      %3326 = func.call @cc_nil_value() : () -> i64
      %3327 = func.call @cc_cons(%3325, %3326) : (i64, i64) -> i64
      %3328 = func.call @cc_not(%3327) : (i64) -> i64
      %__rlasp_stack_elide_zero_553 = arith.constant 0 : i64
      %3329 = arith.addi %3328, %__rlasp_stack_elide_zero_553 : i64
      scf.yield %3329 : i64
    }
    func.call @stack_push_pointer(%3216) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808589"() {
    %3533 = func.call @cc_nil_value() : () -> i64
    %3534 = func.call @cc_nil_value() : () -> i64
    %3535 = func.call @cc_errorp(%3533) : (i64) -> i64
    %3536 = arith.cmpi ne, %3535, %3534 : i64
    %3537 = scf.if %3536 -> (i64) {
      scf.yield %3533 : i64
    } else {
      %3538 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3539 = func.call @cc_nil_value() : () -> i64
      %3540 = func.call @cc_nil_value() : () -> i64
      %3541 = func.call @cc_errorp(%3539) : (i64) -> i64
      %3542 = arith.cmpi ne, %3541, %3540 : i64
      %3543 = scf.if %3542 -> (i64) {
        scf.yield %3539 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3544 = arith.constant -1 : i64
        %3545 = func.call @cc_box_fixnum(%3544) : (i64) -> i64
        %3546 = llvm.mlir.addressof @str281 : !llvm.ptr
        %3547 = arith.constant 28 : i64
        %3548 = func.call @cc_make_symbol(%3546, %3547) : (!llvm.ptr, i64) -> i64
        %3549 = func.call @cc_symbol_value(%3548) : (i64) -> i64
        %3550 = func.call @cc_set_symbol_value(%3548, %3545) : (i64, i64) -> i64
        %3551 = func.call @cc_nil_value() : () -> i64
        %3552 = func.call @cc_nil_value() : () -> i64
        %3553 = func.call @cc_errorp(%3551) : (i64) -> i64
        %3554 = arith.cmpi ne, %3553, %3552 : i64
        %3555 = scf.if %3554 -> (i64) {
          scf.yield %3551 : i64
        } else {
          %3556 = func.call @cc_nil_value() : () -> i64
          %3557 = func.call @cc_gensym(%3556) : (i64) -> i64
          %__rlasp_stack_elide_zero_554 = arith.constant 0 : i64
          %3558 = arith.addi %3557, %__rlasp_stack_elide_zero_554 : i64
          scf.yield %3558 : i64
        }
        func.call @stack_push_pointer(%3555) : (i64) -> ()
        %3559 = func.call @cc_restore_symbol_value(%3548, %3549) : (i64, i64) -> i64
        %3560 = func.call @stack_pop_pointer() : () -> i64
        %3561 = func.call @cc_errorp(%3560) : (i64) -> i64
        %3562 = func.call @cc_nil_value() : () -> i64
        %3563 = arith.cmpi ne, %3561, %3562 : i64
        scf.if %3563 {
          func.call @stack_push_pointer(%3560) : (i64) -> ()
        } else {
          %3564 = func.call @cc_multiple_value_list(%3560) : (i64) -> i64
          func.call @stack_push_pointer(%3564) : (i64) -> ()
        }
        %3565 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3566 = func.call @stack_pop_pointer() : () -> i64
        %3567 = func.call @cc_nil_value() : () -> i64
        %3568 = func.call @cc_maybe_error_from_multiple_value_list(%3565) : (i64) -> i64
        %3569 = func.call @cc_errorp(%3568) : (i64) -> i64
        %3570 = arith.cmpi ne, %3569, %3567 : i64
        %3571 = arith.cmpi eq, %3567, %3567 : i64
        %3572 = arith.andi %3570, %3571 : i1
        %3573 = scf.if %3572 -> (i64) {
          scf.yield %3568 : i64
        } else {
          scf.yield %3567 : i64
        }
        %3574 = arith.cmpi ne, %3573, %3567 : i64
        scf.if %3574 {
          func.call @stack_push_pointer(%3573) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3575 = func.call @stack_pop_pointer() : () -> i64
          %3576 = func.call @cc_cons(%3566, %3575) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_555 = arith.constant 0 : i64
          %3577 = arith.addi %3576, %__rlasp_stack_elide_zero_555 : i64
          %3578 = func.call @cc_cons(%3565, %3577) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_556 = arith.constant 0 : i64
          %3579 = arith.addi %3578, %__rlasp_stack_elide_zero_556 : i64
          %3580 = func.call @cc_values_pack(%3579) : (i64) -> i64
          func.call @stack_push_pointer(%3580) : (i64) -> ()
        }
        %3581 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3581 : i64
      }
      %__rlasp_stack_elide_zero_557 = arith.constant 0 : i64
      %3582 = arith.addi %3543, %__rlasp_stack_elide_zero_557 : i64
      %3583 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3584 = func.call @cc_errorp(%3582) : (i64) -> i64
      %3585 = func.call @cc_nil_value() : () -> i64
      %3586 = arith.cmpi ne, %3584, %3585 : i64
      scf.if %3586 {
        %3587 = func.call @cc_condition_value(%3582) : (i64) -> i64
        %3588 = func.call @cc_values2(%3585, %3587) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3588) : (i64) -> ()
      } else {
        %3589 = func.call @cc_multiple_value_list(%3582) : (i64) -> i64
        %3590 = func.call @cc_values_pack(%3589) : (i64) -> i64
        func.call @stack_push_pointer(%3590) : (i64) -> ()
      }
      %3591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3591 : i64
    }
    func.call @stack_push_pointer(%3537) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808590"() {
    %3833 = func.call @cc_nil_value() : () -> i64
    %3834 = func.call @cc_nil_value() : () -> i64
    %3835 = func.call @cc_errorp(%3833) : (i64) -> i64
    %3836 = arith.cmpi ne, %3835, %3834 : i64
    %3837 = scf.if %3836 -> (i64) {
      scf.yield %3833 : i64
    } else {
      %3838 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3839 = func.call @cc_nil_value() : () -> i64
      %3840 = func.call @cc_nil_value() : () -> i64
      %3841 = func.call @cc_errorp(%3839) : (i64) -> i64
      %3842 = arith.cmpi ne, %3841, %3840 : i64
      %3843 = scf.if %3842 -> (i64) {
        scf.yield %3839 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3844 = llvm.mlir.addressof @str305 : !llvm.ptr
        %3845 = arith.constant 20 : i64
        %3846 = func.call @cc_make_string(%3844, %3845) : (!llvm.ptr, i64) -> i64
        %3847 = llvm.mlir.addressof @str306 : !llvm.ptr
        %3848 = arith.constant 11 : i64
        %3849 = func.call @cc_make_string(%3847, %3848) : (!llvm.ptr, i64) -> i64
        %3850 = func.call @cc_intern(%3846, %3849) : (i64, i64) -> i64
        %3851 = func.call @cc_nil_value() : () -> i64
        %3852 = func.call @cc_cons(%3850, %3851) : (i64, i64) -> i64
        %3853 = func.call @cc_values_pack(%3852) : (i64) -> i64
        %3854 = func.call @cc_symbol_value(%3850) : (i64) -> i64
        %3855 = arith.constant 1 : i64
        %3856 = func.call @cc_box_fixnum(%3855) : (i64) -> i64
        %3858 = arith.constant 3 : i64
        %3857 = arith.andi %3854, %3858 : i64
        %3859 = arith.constant 0 : i64
        %3860 = arith.cmpi eq, %3857, %3859 : i64
        %3862 = arith.constant 3 : i64
        %3861 = arith.andi %3856, %3862 : i64
        %3863 = arith.constant 0 : i64
        %3864 = arith.cmpi eq, %3861, %3863 : i64
        %3865 = arith.andi %3860, %3864 : i1
        %3866 = scf.if %3865 -> (i64) {
          %3867 = arith.constant 2 : i64
          %3868 = arith.shrsi %3854, %3867 : i64
          %3869 = arith.constant 2 : i64
          %3870 = arith.shrsi %3856, %3869 : i64
          %3871 = arith.subi %3868, %3870 : i64
          %3872 = arith.constant -2305843009213693952 : i64
          %3873 = arith.constant 2305843009213693951 : i64
          %3874 = arith.cmpi sge, %3871, %3872 : i64
          %3875 = arith.cmpi sle, %3871, %3873 : i64
          %3876 = arith.andi %3874, %3875 : i1
          %3877 = scf.if %3876 -> (i64) {
            %3878 = arith.constant 2 : i64
            %3879 = arith.shli %3871, %3878 : i64
            scf.yield %3879 : i64
          } else {
            %3880 = func.call @cc_sub(%3854, %3856) : (i64, i64) -> i64
            scf.yield %3880 : i64
          }
          scf.yield %3877 : i64
        } else {
          %3881 = func.call @cc_sub(%3854, %3856) : (i64, i64) -> i64
          scf.yield %3881 : i64
        }
        %__rlasp_stack_elide_zero_558 = arith.constant 0 : i64
        %3882 = arith.addi %3866, %__rlasp_stack_elide_zero_558 : i64
        %3883 = llvm.mlir.addressof @str307 : !llvm.ptr
        %3884 = arith.constant 28 : i64
        %3885 = func.call @cc_make_symbol(%3883, %3884) : (!llvm.ptr, i64) -> i64
        %3886 = func.call @cc_symbol_value(%3885) : (i64) -> i64
        %3887 = func.call @cc_set_symbol_value(%3885, %3882) : (i64, i64) -> i64
        %3888 = func.call @cc_nil_value() : () -> i64
        %3889 = func.call @cc_nil_value() : () -> i64
        %3890 = func.call @cc_errorp(%3888) : (i64) -> i64
        %3891 = arith.cmpi ne, %3890, %3889 : i64
        %3892 = scf.if %3891 -> (i64) {
          scf.yield %3888 : i64
        } else {
          %3893 = func.call @cc_nil_value() : () -> i64
          %3894 = func.call @cc_gensym(%3893) : (i64) -> i64
          %__rlasp_stack_elide_zero_559 = arith.constant 0 : i64
          %3895 = arith.addi %3894, %__rlasp_stack_elide_zero_559 : i64
          scf.yield %3895 : i64
        }
        func.call @stack_push_pointer(%3892) : (i64) -> ()
        %3896 = func.call @cc_restore_symbol_value(%3885, %3886) : (i64, i64) -> i64
        %3897 = func.call @stack_pop_pointer() : () -> i64
        %3898 = func.call @cc_errorp(%3897) : (i64) -> i64
        %3899 = func.call @cc_nil_value() : () -> i64
        %3900 = arith.cmpi ne, %3898, %3899 : i64
        scf.if %3900 {
          func.call @stack_push_pointer(%3897) : (i64) -> ()
        } else {
          %3901 = func.call @cc_multiple_value_list(%3897) : (i64) -> i64
          func.call @stack_push_pointer(%3901) : (i64) -> ()
        }
        %3902 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3903 = func.call @stack_pop_pointer() : () -> i64
        %3904 = func.call @cc_nil_value() : () -> i64
        %3905 = func.call @cc_maybe_error_from_multiple_value_list(%3902) : (i64) -> i64
        %3906 = func.call @cc_errorp(%3905) : (i64) -> i64
        %3907 = arith.cmpi ne, %3906, %3904 : i64
        %3908 = arith.cmpi eq, %3904, %3904 : i64
        %3909 = arith.andi %3907, %3908 : i1
        %3910 = scf.if %3909 -> (i64) {
          scf.yield %3905 : i64
        } else {
          scf.yield %3904 : i64
        }
        %3911 = arith.cmpi ne, %3910, %3904 : i64
        scf.if %3911 {
          func.call @stack_push_pointer(%3910) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3912 = func.call @stack_pop_pointer() : () -> i64
          %3913 = func.call @cc_cons(%3903, %3912) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_560 = arith.constant 0 : i64
          %3914 = arith.addi %3913, %__rlasp_stack_elide_zero_560 : i64
          %3915 = func.call @cc_cons(%3902, %3914) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_561 = arith.constant 0 : i64
          %3916 = arith.addi %3915, %__rlasp_stack_elide_zero_561 : i64
          %3917 = func.call @cc_values_pack(%3916) : (i64) -> i64
          func.call @stack_push_pointer(%3917) : (i64) -> ()
        }
        %3918 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3918 : i64
      }
      %__rlasp_stack_elide_zero_562 = arith.constant 0 : i64
      %3919 = arith.addi %3843, %__rlasp_stack_elide_zero_562 : i64
      %3920 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3921 = func.call @cc_errorp(%3919) : (i64) -> i64
      %3922 = func.call @cc_nil_value() : () -> i64
      %3923 = arith.cmpi ne, %3921, %3922 : i64
      scf.if %3923 {
        %3924 = func.call @cc_condition_value(%3919) : (i64) -> i64
        %3925 = func.call @cc_values2(%3922, %3924) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3925) : (i64) -> ()
      } else {
        %3926 = func.call @cc_multiple_value_list(%3919) : (i64) -> i64
        %3927 = func.call @cc_values_pack(%3926) : (i64) -> i64
        func.call @stack_push_pointer(%3927) : (i64) -> ()
      }
      %3928 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3928 : i64
    }
    func.call @stack_push_pointer(%3837) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808591"() {
    %4167 = func.call @cc_nil_value() : () -> i64
    %4168 = func.call @cc_nil_value() : () -> i64
    %4169 = func.call @cc_errorp(%4167) : (i64) -> i64
    %4170 = arith.cmpi ne, %4169, %4168 : i64
    %4171 = scf.if %4170 -> (i64) {
      scf.yield %4167 : i64
    } else {
      %4172 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4173 = func.call @cc_nil_value() : () -> i64
      %4174 = func.call @cc_nil_value() : () -> i64
      %4175 = func.call @cc_errorp(%4173) : (i64) -> i64
      %4176 = arith.cmpi ne, %4175, %4174 : i64
      %4177 = scf.if %4176 -> (i64) {
        scf.yield %4173 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4178 = llvm.mlir.addressof @str330 : !llvm.ptr
        %4179 = arith.constant 5 : i64
        %4180 = func.call @cc_make_string(%4178, %4179) : (!llvm.ptr, i64) -> i64
        %4181 = llvm.mlir.addressof @str331 : !llvm.ptr
        %4182 = arith.constant 11 : i64
        %4183 = func.call @cc_make_string(%4181, %4182) : (!llvm.ptr, i64) -> i64
        %4184 = func.call @cc_intern(%4180, %4183) : (i64, i64) -> i64
        %4185 = func.call @cc_nil_value() : () -> i64
        %4186 = func.call @cc_cons(%4184, %4185) : (i64, i64) -> i64
        %4187 = func.call @cc_values_pack(%4186) : (i64) -> i64
        %__rlasp_stack_elide_zero_563 = arith.constant 0 : i64
        %4188 = arith.addi %4184, %__rlasp_stack_elide_zero_563 : i64
        %4189 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4190 = arith.constant 28 : i64
        %4191 = func.call @cc_make_symbol(%4189, %4190) : (!llvm.ptr, i64) -> i64
        %4192 = func.call @cc_symbol_value(%4191) : (i64) -> i64
        %4193 = func.call @cc_set_symbol_value(%4191, %4188) : (i64, i64) -> i64
        %4194 = func.call @cc_nil_value() : () -> i64
        %4195 = func.call @cc_nil_value() : () -> i64
        %4196 = func.call @cc_errorp(%4194) : (i64) -> i64
        %4197 = arith.cmpi ne, %4196, %4195 : i64
        %4198 = scf.if %4197 -> (i64) {
          scf.yield %4194 : i64
        } else {
          %4199 = func.call @cc_nil_value() : () -> i64
          %4200 = func.call @cc_gensym(%4199) : (i64) -> i64
          %__rlasp_stack_elide_zero_564 = arith.constant 0 : i64
          %4201 = arith.addi %4200, %__rlasp_stack_elide_zero_564 : i64
          scf.yield %4201 : i64
        }
        func.call @stack_push_pointer(%4198) : (i64) -> ()
        %4202 = func.call @cc_restore_symbol_value(%4191, %4192) : (i64, i64) -> i64
        %4203 = func.call @stack_pop_pointer() : () -> i64
        %4204 = func.call @cc_errorp(%4203) : (i64) -> i64
        %4205 = func.call @cc_nil_value() : () -> i64
        %4206 = arith.cmpi ne, %4204, %4205 : i64
        scf.if %4206 {
          func.call @stack_push_pointer(%4203) : (i64) -> ()
        } else {
          %4207 = func.call @cc_multiple_value_list(%4203) : (i64) -> i64
          func.call @stack_push_pointer(%4207) : (i64) -> ()
        }
        %4208 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4209 = func.call @stack_pop_pointer() : () -> i64
        %4210 = func.call @cc_nil_value() : () -> i64
        %4211 = func.call @cc_maybe_error_from_multiple_value_list(%4208) : (i64) -> i64
        %4212 = func.call @cc_errorp(%4211) : (i64) -> i64
        %4213 = arith.cmpi ne, %4212, %4210 : i64
        %4214 = arith.cmpi eq, %4210, %4210 : i64
        %4215 = arith.andi %4213, %4214 : i1
        %4216 = scf.if %4215 -> (i64) {
          scf.yield %4211 : i64
        } else {
          scf.yield %4210 : i64
        }
        %4217 = arith.cmpi ne, %4216, %4210 : i64
        scf.if %4217 {
          func.call @stack_push_pointer(%4216) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4218 = func.call @stack_pop_pointer() : () -> i64
          %4219 = func.call @cc_cons(%4209, %4218) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_565 = arith.constant 0 : i64
          %4220 = arith.addi %4219, %__rlasp_stack_elide_zero_565 : i64
          %4221 = func.call @cc_cons(%4208, %4220) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_566 = arith.constant 0 : i64
          %4222 = arith.addi %4221, %__rlasp_stack_elide_zero_566 : i64
          %4223 = func.call @cc_values_pack(%4222) : (i64) -> i64
          func.call @stack_push_pointer(%4223) : (i64) -> ()
        }
        %4224 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4224 : i64
      }
      %__rlasp_stack_elide_zero_567 = arith.constant 0 : i64
      %4225 = arith.addi %4177, %__rlasp_stack_elide_zero_567 : i64
      %4226 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4227 = func.call @cc_errorp(%4225) : (i64) -> i64
      %4228 = func.call @cc_nil_value() : () -> i64
      %4229 = arith.cmpi ne, %4227, %4228 : i64
      scf.if %4229 {
        %4230 = func.call @cc_condition_value(%4225) : (i64) -> i64
        %4231 = func.call @cc_values2(%4228, %4230) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4231) : (i64) -> ()
      } else {
        %4232 = func.call @cc_multiple_value_list(%4225) : (i64) -> i64
        %4233 = func.call @cc_values_pack(%4232) : (i64) -> i64
        func.call @stack_push_pointer(%4233) : (i64) -> ()
      }
      %4234 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4234 : i64
    }
    func.call @stack_push_pointer(%4171) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808592"() {
    %4417 = func.call @cc_nil_value() : () -> i64
    %4418 = func.call @cc_nil_value() : () -> i64
    %4419 = func.call @cc_errorp(%4417) : (i64) -> i64
    %4420 = arith.cmpi ne, %4419, %4418 : i64
    %4421 = scf.if %4420 -> (i64) {
      scf.yield %4417 : i64
    } else {
      %4422 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4423 = func.call @cc_nil_value() : () -> i64
      %4424 = func.call @cc_nil_value() : () -> i64
      %4425 = func.call @cc_errorp(%4423) : (i64) -> i64
      %4426 = arith.cmpi ne, %4425, %4424 : i64
      %4427 = scf.if %4426 -> (i64) {
        scf.yield %4423 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %4428 = func.call @stack_pop_pointer() : () -> i64
        %4429 = func.call @cc_nil_value() : () -> i64
        %4430 = func.call @cc_gentemp(%4428, %4429) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_568 = arith.constant 0 : i64
        %4431 = arith.addi %4430, %__rlasp_stack_elide_zero_568 : i64
        %4432 = func.call @cc_errorp(%4431) : (i64) -> i64
        %4433 = func.call @cc_nil_value() : () -> i64
        %4434 = arith.cmpi ne, %4432, %4433 : i64
        scf.if %4434 {
          func.call @stack_push_pointer(%4431) : (i64) -> ()
        } else {
          %4435 = func.call @cc_multiple_value_list(%4431) : (i64) -> i64
          func.call @stack_push_pointer(%4435) : (i64) -> ()
        }
        %4436 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4437 = func.call @stack_pop_pointer() : () -> i64
        %4438 = func.call @cc_nil_value() : () -> i64
        %4439 = func.call @cc_maybe_error_from_multiple_value_list(%4436) : (i64) -> i64
        %4440 = func.call @cc_errorp(%4439) : (i64) -> i64
        %4441 = arith.cmpi ne, %4440, %4438 : i64
        %4442 = arith.cmpi eq, %4438, %4438 : i64
        %4443 = arith.andi %4441, %4442 : i1
        %4444 = scf.if %4443 -> (i64) {
          scf.yield %4439 : i64
        } else {
          scf.yield %4438 : i64
        }
        %4445 = arith.cmpi ne, %4444, %4438 : i64
        scf.if %4445 {
          func.call @stack_push_pointer(%4444) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4446 = func.call @stack_pop_pointer() : () -> i64
          %4447 = func.call @cc_cons(%4437, %4446) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_569 = arith.constant 0 : i64
          %4448 = arith.addi %4447, %__rlasp_stack_elide_zero_569 : i64
          %4449 = func.call @cc_cons(%4436, %4448) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_570 = arith.constant 0 : i64
          %4450 = arith.addi %4449, %__rlasp_stack_elide_zero_570 : i64
          %4451 = func.call @cc_values_pack(%4450) : (i64) -> i64
          func.call @stack_push_pointer(%4451) : (i64) -> ()
        }
        %4452 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4452 : i64
      }
      %__rlasp_stack_elide_zero_571 = arith.constant 0 : i64
      %4453 = arith.addi %4427, %__rlasp_stack_elide_zero_571 : i64
      %4454 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4455 = func.call @cc_errorp(%4453) : (i64) -> i64
      %4456 = func.call @cc_nil_value() : () -> i64
      %4457 = arith.cmpi ne, %4455, %4456 : i64
      scf.if %4457 {
        %4458 = func.call @cc_condition_value(%4453) : (i64) -> i64
        %4459 = func.call @cc_values2(%4456, %4458) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4459) : (i64) -> ()
      } else {
        %4460 = func.call @cc_multiple_value_list(%4453) : (i64) -> i64
        %4461 = func.call @cc_values_pack(%4460) : (i64) -> i64
        func.call @stack_push_pointer(%4461) : (i64) -> ()
      }
      %4462 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4462 : i64
    }
    func.call @stack_push_pointer(%4421) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808593"() {
    %4666 = func.call @cc_nil_value() : () -> i64
    %4667 = func.call @cc_nil_value() : () -> i64
    %4668 = func.call @cc_errorp(%4666) : (i64) -> i64
    %4669 = arith.cmpi ne, %4668, %4667 : i64
    %4670 = scf.if %4669 -> (i64) {
      scf.yield %4666 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %4671 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4671) : (i64) -> ()
      %4672 = func.call @stack_pop_pointer() : () -> i64
      %4673 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4673) : (i64) -> ()
      %4674 = func.call @stack_pop_pointer() : () -> i64
      %4675 = func.call @cc_nil_value() : () -> i64
      %4676 = func.call @cc_errorp(%4672) : (i64) -> i64
      %4677 = arith.cmpi ne, %4676, %4675 : i64
      %4678 = arith.cmpi eq, %4675, %4675 : i64
      %4679 = arith.andi %4677, %4678 : i1
      %4680 = scf.if %4679 -> (i64) {
        scf.yield %4672 : i64
      } else {
        scf.yield %4675 : i64
      }
      %4681 = func.call @cc_errorp(%4674) : (i64) -> i64
      %4682 = arith.cmpi ne, %4681, %4675 : i64
      %4683 = arith.cmpi eq, %4680, %4675 : i64
      %4684 = arith.andi %4682, %4683 : i1
      %4685 = scf.if %4684 -> (i64) {
        scf.yield %4674 : i64
      } else {
        scf.yield %4680 : i64
      }
      %4686 = arith.cmpi ne, %4685, %4675 : i64
      scf.if %4686 {
        func.call @stack_push_pointer(%4685) : (i64) -> ()
      } else {
        %4687 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4687) : (i64) -> ()
        %__rlasp_stack_elide_zero_572 = arith.constant 0 : i64
        %4688 = arith.addi %4674, %__rlasp_stack_elide_zero_572 : i64
        %4689 = func.call @stack_pop_pointer() : () -> i64
        %4690 = func.call @cc_cons(%4688, %4689) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4690) : (i64) -> ()
        %__rlasp_stack_elide_zero_573 = arith.constant 0 : i64
        %4691 = arith.addi %4672, %__rlasp_stack_elide_zero_573 : i64
        %4692 = func.call @stack_pop_pointer() : () -> i64
        %4693 = func.call @cc_cons(%4691, %4692) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4693) : (i64) -> ()
      }
      %4694 = func.call @stack_pop_pointer() : () -> i64
      %4695 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4694) : (i64) -> ()
      func.call @stack_push_pointer(%4695) : (i64) -> ()
      %4696 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4697 = func.call @cc_make_function_ref_const(%4696) : (!llvm.ptr) -> i64
      %4698 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%4697, %4698) : (i64, i64) -> ()
      %4699 = func.call @stack_pop_pointer() : () -> i64
      %4700 = func.call @cc_nil_value() : () -> i64
      %4701 = func.call @cc_cons(%4699, %4700) : (i64, i64) -> i64
      %4702 = func.call @cc_not(%4701) : (i64) -> i64
      %__rlasp_stack_elide_zero_574 = arith.constant 0 : i64
      %4703 = arith.addi %4702, %__rlasp_stack_elide_zero_574 : i64
      %4704 = func.call @cc_nil_value() : () -> i64
      %4705 = func.call @cc_cons(%4703, %4704) : (i64, i64) -> i64
      %4706 = func.call @cc_not(%4705) : (i64) -> i64
      %__rlasp_stack_elide_zero_575 = arith.constant 0 : i64
      %4707 = arith.addi %4706, %__rlasp_stack_elide_zero_575 : i64
      scf.yield %4707 : i64
    }
    func.call @stack_push_pointer(%4670) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808594"() {
    %4882 = func.call @cc_nil_value() : () -> i64
    %4883 = func.call @cc_nil_value() : () -> i64
    %4884 = func.call @cc_errorp(%4882) : (i64) -> i64
    %4885 = arith.cmpi ne, %4884, %4883 : i64
    %4886 = scf.if %4885 -> (i64) {
      scf.yield %4882 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %4887 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4887) : (i64) -> ()
      %4888 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4888) : (i64) -> ()
      %4889 = func.call @stack_pop_pointer() : () -> i64
      %4890 = func.call @stack_pop_pointer() : () -> i64
      %4891 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4889) : (i64) -> ()
      func.call @stack_push_pointer(%4891) : (i64) -> ()
      func.call @stack_push_pointer(%4890) : (i64) -> ()
      %4892 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4893 = func.call @cc_make_function_ref_const(%4892) : (!llvm.ptr) -> i64
      %4894 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%4893, %4894) : (i64, i64) -> ()
      %4895 = func.call @stack_pop_pointer() : () -> i64
      %4896 = func.call @cc_nil_value() : () -> i64
      %4897 = func.call @cc_cons(%4895, %4896) : (i64, i64) -> i64
      %4898 = func.call @cc_not(%4897) : (i64) -> i64
      %__rlasp_stack_elide_zero_576 = arith.constant 0 : i64
      %4899 = arith.addi %4898, %__rlasp_stack_elide_zero_576 : i64
      %4900 = func.call @cc_nil_value() : () -> i64
      %4901 = func.call @cc_cons(%4899, %4900) : (i64, i64) -> i64
      %4902 = func.call @cc_not(%4901) : (i64) -> i64
      %__rlasp_stack_elide_zero_577 = arith.constant 0 : i64
      %4903 = arith.addi %4902, %__rlasp_stack_elide_zero_577 : i64
      scf.yield %4903 : i64
    }
    func.call @stack_push_pointer(%4886) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808595"() {
    %5182 = func.call @stack_pop_pointer() : () -> i64
    %5183 = func.call @cc_nil_value() : () -> i64
    %5184 = func.call @cc_nil_value() : () -> i64
    %5185 = func.call @cc_errorp(%5183) : (i64) -> i64
    %5186 = arith.cmpi ne, %5185, %5184 : i64
    %5187 = scf.if %5186 -> (i64) {
      scf.yield %5183 : i64
    } else {
      %5188 = arith.constant 0 : i64
      %5189 = func.call @cc_box_fixnum(%5188) : (i64) -> i64
      %5190 = func.call @cc_nil_value() : () -> i64
      %5191 = func.call @cc_nil_value() : () -> i64
      %5192 = func.call @cc_errorp(%5190) : (i64) -> i64
      %5193 = arith.cmpi ne, %5192, %5191 : i64
      %5194:2 = scf.if %5193 -> (i64, i64) {
        scf.yield %5190, %5189 : i64, i64
      } else {
        %5195 = llvm.mlir.addressof @str409 : !llvm.ptr
        %5196 = arith.constant 2 : i64
        %5197 = func.call @cc_make_string(%5195, %5196) : (!llvm.ptr, i64) -> i64
        %5198 = llvm.mlir.addressof @str410 : !llvm.ptr
        %5199 = arith.constant 7 : i64
        %5200 = func.call @cc_make_string(%5198, %5199) : (!llvm.ptr, i64) -> i64
        %5201 = func.call @cc_intern(%5197, %5200) : (i64, i64) -> i64
        %5202 = func.call @cc_nil_value() : () -> i64
        %5203 = func.call @cc_cons(%5201, %5202) : (i64, i64) -> i64
        %5204 = func.call @cc_values_pack(%5203) : (i64) -> i64
        %5205 = func.call @cc_nil_value() : () -> i64
        %5206 = func.call @cc_errorp(%5201) : (i64) -> i64
        %5207 = arith.cmpi ne, %5206, %5205 : i64
        %5208 = arith.cmpi eq, %5205, %5205 : i64
        %5209 = arith.andi %5207, %5208 : i1
        %5210 = scf.if %5209 -> (i64) {
          scf.yield %5201 : i64
        } else {
          scf.yield %5205 : i64
        }
        %5211 = arith.cmpi ne, %5210, %5205 : i64
        scf.if %5211 {
          func.call @stack_push_pointer(%5210) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5201) : (i64) -> ()
          %5212 = llvm.mlir.addressof @str411 : !llvm.ptr
          %5213 = func.call @cc_make_function_ref_const(%5212) : (!llvm.ptr) -> i64
          %5214 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5213, %5214) : (i64, i64) -> ()
        }
        %5215 = func.call @stack_pop_pointer() : () -> i64
        %5216 = func.call @cc_package_external_symbols(%5215) : (i64) -> i64
        %5217:2 = scf.while (%arg0 = %5216, %arg1 = %5189) : (i64, i64) -> (i64, i64) {
          %5218 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %5219 = arith.constant 0 : i32
          %5220 = arith.cmpi ne, %5218, %5219 : i32
          scf.condition(%5220) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%5221: i64, %5222: i64):
          %5223 = func.call @cc_car(%5221) : (i64) -> i64
          func.call @stack_push_nil() : () -> ()
          %5224 = func.call @stack_depth() : () -> i64
          %5225 = arith.constant 0 : i64
          %5226 = arith.cmpi sgt, %5224, %5225 : i64
          scf.if %5226 {
            %5227 = func.call @stack_pop_pointer() : () -> i64
          }
          %5228 = arith.constant 1 : i64
          %5229 = func.call @cc_box_fixnum(%5228) : (i64) -> i64
          %5231 = arith.constant 3 : i64
          %5230 = arith.andi %5222, %5231 : i64
          %5232 = arith.constant 0 : i64
          %5233 = arith.cmpi eq, %5230, %5232 : i64
          %5235 = arith.constant 3 : i64
          %5234 = arith.andi %5229, %5235 : i64
          %5236 = arith.constant 0 : i64
          %5237 = arith.cmpi eq, %5234, %5236 : i64
          %5238 = arith.andi %5233, %5237 : i1
          %5239 = scf.if %5238 -> (i64) {
            %5240 = arith.constant 2 : i64
            %5241 = arith.shrsi %5222, %5240 : i64
            %5242 = arith.constant 2 : i64
            %5243 = arith.shrsi %5229, %5242 : i64
            %5244 = arith.addi %5241, %5243 : i64
            %5245 = arith.constant -2305843009213693952 : i64
            %5246 = arith.constant 2305843009213693951 : i64
            %5247 = arith.cmpi sge, %5244, %5245 : i64
            %5248 = arith.cmpi sle, %5244, %5246 : i64
            %5249 = arith.andi %5247, %5248 : i1
            %5250 = scf.if %5249 -> (i64) {
              %5251 = arith.constant 2 : i64
              %5252 = arith.shli %5244, %5251 : i64
              scf.yield %5252 : i64
            } else {
              %5253 = func.call @cc_add(%5222, %5229) : (i64, i64) -> i64
              scf.yield %5253 : i64
            }
            scf.yield %5250 : i64
          } else {
            %5254 = func.call @cc_add(%5222, %5229) : (i64, i64) -> i64
            scf.yield %5254 : i64
          }
          %__rlasp_stack_elide_zero_578 = arith.constant 0 : i64
          %5255 = arith.addi %5239, %__rlasp_stack_elide_zero_578 : i64
          func.call @stack_push_pointer(%5255) : (i64) -> ()
          %5256 = func.call @stack_depth() : () -> i64
          %5257 = arith.constant 0 : i64
          %5258 = arith.cmpi sgt, %5256, %5257 : i64
          scf.if %5258 {
            %5259 = func.call @stack_pop_pointer() : () -> i64
          }
          %5260 = func.call @cc_cdr(%5221) : (i64) -> i64
          scf.yield %5260, %5255 : i64, i64
        }
        %5261 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_579 = arith.constant 0 : i64
        %5262 = arith.addi %5217#1, %__rlasp_stack_elide_zero_579 : i64
        scf.yield %5262, %5217#1 : i64, i64
      }
      %__rlasp_stack_elide_zero_580 = arith.constant 0 : i64
      %5263 = arith.addi %5194#0, %__rlasp_stack_elide_zero_580 : i64
      scf.yield %5263 : i64
    }
    func.call @stack_push_pointer(%5187) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808597"() {
    %8405 = func.call @cc_nil_value() : () -> i64
    %8406 = func.call @cc_nil_value() : () -> i64
    %8407 = func.call @cc_errorp(%8405) : (i64) -> i64
    %8408 = arith.cmpi ne, %8407, %8406 : i64
    %8409 = scf.if %8408 -> (i64) {
      scf.yield %8405 : i64
    } else {
      %8410 = llvm.mlir.addressof @str876 : !llvm.ptr
      %8411 = arith.constant 17 : i64
      %8412 = func.call @cc_make_string(%8410, %8411) : (!llvm.ptr, i64) -> i64
      %8413 = llvm.mlir.addressof @str877 : !llvm.ptr
      %8414 = arith.constant 11 : i64
      %8415 = func.call @cc_make_string(%8413, %8414) : (!llvm.ptr, i64) -> i64
      %8416 = func.call @cc_intern(%8412, %8415) : (i64, i64) -> i64
      %8417 = func.call @cc_nil_value() : () -> i64
      %8418 = func.call @cc_cons(%8416, %8417) : (i64, i64) -> i64
      %8419 = func.call @cc_values_pack(%8418) : (i64) -> i64
      func.call @stack_push_pointer(%8416) : (i64) -> ()
      %8420 = llvm.mlir.addressof @str878 : !llvm.ptr
      %8421 = arith.constant 4 : i64
      %8422 = func.call @cc_make_string(%8420, %8421) : (!llvm.ptr, i64) -> i64
      %8423 = llvm.mlir.addressof @str879 : !llvm.ptr
      %8424 = arith.constant 11 : i64
      %8425 = func.call @cc_make_string(%8423, %8424) : (!llvm.ptr, i64) -> i64
      %8426 = func.call @cc_intern(%8422, %8425) : (i64, i64) -> i64
      %8427 = func.call @cc_nil_value() : () -> i64
      %8428 = func.call @cc_cons(%8426, %8427) : (i64, i64) -> i64
      %8429 = func.call @cc_values_pack(%8428) : (i64) -> i64
      func.call @stack_push_pointer(%8426) : (i64) -> ()
      %8430 = llvm.mlir.addressof @str880 : !llvm.ptr
      %8431 = arith.constant 5 : i64
      %8432 = func.call @cc_make_string(%8430, %8431) : (!llvm.ptr, i64) -> i64
      %8433 = llvm.mlir.addressof @str881 : !llvm.ptr
      %8434 = arith.constant 11 : i64
      %8435 = func.call @cc_make_string(%8433, %8434) : (!llvm.ptr, i64) -> i64
      %8436 = func.call @cc_intern(%8432, %8435) : (i64, i64) -> i64
      %8437 = func.call @cc_nil_value() : () -> i64
      %8438 = func.call @cc_cons(%8436, %8437) : (i64, i64) -> i64
      %8439 = func.call @cc_values_pack(%8438) : (i64) -> i64
      func.call @stack_push_pointer(%8436) : (i64) -> ()
      %8440 = llvm.mlir.addressof @str882 : !llvm.ptr
      %8441 = arith.constant 12 : i64
      %8442 = func.call @cc_make_string(%8440, %8441) : (!llvm.ptr, i64) -> i64
      %8443 = llvm.mlir.addressof @str883 : !llvm.ptr
      %8444 = arith.constant 11 : i64
      %8445 = func.call @cc_make_string(%8443, %8444) : (!llvm.ptr, i64) -> i64
      %8446 = func.call @cc_intern(%8442, %8445) : (i64, i64) -> i64
      %8447 = func.call @cc_nil_value() : () -> i64
      %8448 = func.call @cc_cons(%8446, %8447) : (i64, i64) -> i64
      %8449 = func.call @cc_values_pack(%8448) : (i64) -> i64
      func.call @stack_push_pointer(%8446) : (i64) -> ()
      %8450 = llvm.mlir.addressof @str884 : !llvm.ptr
      %8451 = arith.constant 4 : i64
      %8452 = func.call @cc_make_string(%8450, %8451) : (!llvm.ptr, i64) -> i64
      %8453 = llvm.mlir.addressof @str885 : !llvm.ptr
      %8454 = arith.constant 11 : i64
      %8455 = func.call @cc_make_string(%8453, %8454) : (!llvm.ptr, i64) -> i64
      %8456 = func.call @cc_intern(%8452, %8455) : (i64, i64) -> i64
      %8457 = func.call @cc_nil_value() : () -> i64
      %8458 = func.call @cc_cons(%8456, %8457) : (i64, i64) -> i64
      %8459 = func.call @cc_values_pack(%8458) : (i64) -> i64
      func.call @stack_push_pointer(%8456) : (i64) -> ()
      %8460 = llvm.mlir.addressof @str886 : !llvm.ptr
      %8461 = arith.constant 9 : i64
      %8462 = func.call @cc_make_string(%8460, %8461) : (!llvm.ptr, i64) -> i64
      %8463 = llvm.mlir.addressof @str887 : !llvm.ptr
      %8464 = arith.constant 11 : i64
      %8465 = func.call @cc_make_string(%8463, %8464) : (!llvm.ptr, i64) -> i64
      %8466 = func.call @cc_intern(%8462, %8465) : (i64, i64) -> i64
      %8467 = func.call @cc_nil_value() : () -> i64
      %8468 = func.call @cc_cons(%8466, %8467) : (i64, i64) -> i64
      %8469 = func.call @cc_values_pack(%8468) : (i64) -> i64
      func.call @stack_push_pointer(%8466) : (i64) -> ()
      %8470 = llvm.mlir.addressof @str888 : !llvm.ptr
      %8471 = arith.constant 5 : i64
      %8472 = func.call @cc_make_string(%8470, %8471) : (!llvm.ptr, i64) -> i64
      %8473 = llvm.mlir.addressof @str889 : !llvm.ptr
      %8474 = arith.constant 11 : i64
      %8475 = func.call @cc_make_string(%8473, %8474) : (!llvm.ptr, i64) -> i64
      %8476 = func.call @cc_intern(%8472, %8475) : (i64, i64) -> i64
      %8477 = func.call @cc_nil_value() : () -> i64
      %8478 = func.call @cc_cons(%8476, %8477) : (i64, i64) -> i64
      %8479 = func.call @cc_values_pack(%8478) : (i64) -> i64
      func.call @stack_push_pointer(%8476) : (i64) -> ()
      %8480 = llvm.mlir.addressof @str890 : !llvm.ptr
      %8481 = arith.constant 6 : i64
      %8482 = func.call @cc_make_string(%8480, %8481) : (!llvm.ptr, i64) -> i64
      %8483 = llvm.mlir.addressof @str891 : !llvm.ptr
      %8484 = arith.constant 11 : i64
      %8485 = func.call @cc_make_string(%8483, %8484) : (!llvm.ptr, i64) -> i64
      %8486 = func.call @cc_intern(%8482, %8485) : (i64, i64) -> i64
      %8487 = func.call @cc_nil_value() : () -> i64
      %8488 = func.call @cc_cons(%8486, %8487) : (i64, i64) -> i64
      %8489 = func.call @cc_values_pack(%8488) : (i64) -> i64
      func.call @stack_push_pointer(%8486) : (i64) -> ()
      %8490 = llvm.mlir.addressof @str892 : !llvm.ptr
      %8491 = arith.constant 2 : i64
      %8492 = func.call @cc_make_string(%8490, %8491) : (!llvm.ptr, i64) -> i64
      %8493 = llvm.mlir.addressof @str893 : !llvm.ptr
      %8494 = arith.constant 11 : i64
      %8495 = func.call @cc_make_string(%8493, %8494) : (!llvm.ptr, i64) -> i64
      %8496 = func.call @cc_intern(%8492, %8495) : (i64, i64) -> i64
      %8497 = func.call @cc_nil_value() : () -> i64
      %8498 = func.call @cc_cons(%8496, %8497) : (i64, i64) -> i64
      %8499 = func.call @cc_values_pack(%8498) : (i64) -> i64
      func.call @stack_push_pointer(%8496) : (i64) -> ()
      %8500 = llvm.mlir.addressof @str894 : !llvm.ptr
      %8501 = arith.constant 3 : i64
      %8502 = func.call @cc_make_string(%8500, %8501) : (!llvm.ptr, i64) -> i64
      %8503 = llvm.mlir.addressof @str895 : !llvm.ptr
      %8504 = arith.constant 11 : i64
      %8505 = func.call @cc_make_string(%8503, %8504) : (!llvm.ptr, i64) -> i64
      %8506 = func.call @cc_intern(%8502, %8505) : (i64, i64) -> i64
      %8507 = func.call @cc_nil_value() : () -> i64
      %8508 = func.call @cc_cons(%8506, %8507) : (i64, i64) -> i64
      %8509 = func.call @cc_values_pack(%8508) : (i64) -> i64
      func.call @stack_push_pointer(%8506) : (i64) -> ()
      %8510 = llvm.mlir.addressof @str896 : !llvm.ptr
      %8511 = arith.constant 18 : i64
      %8512 = func.call @cc_make_string(%8510, %8511) : (!llvm.ptr, i64) -> i64
      %8513 = llvm.mlir.addressof @str897 : !llvm.ptr
      %8514 = arith.constant 11 : i64
      %8515 = func.call @cc_make_string(%8513, %8514) : (!llvm.ptr, i64) -> i64
      %8516 = func.call @cc_intern(%8512, %8515) : (i64, i64) -> i64
      %8517 = func.call @cc_nil_value() : () -> i64
      %8518 = func.call @cc_cons(%8516, %8517) : (i64, i64) -> i64
      %8519 = func.call @cc_values_pack(%8518) : (i64) -> i64
      func.call @stack_push_pointer(%8516) : (i64) -> ()
      %8520 = llvm.mlir.addressof @str898 : !llvm.ptr
      %8521 = arith.constant 23 : i64
      %8522 = func.call @cc_make_string(%8520, %8521) : (!llvm.ptr, i64) -> i64
      %8523 = llvm.mlir.addressof @str899 : !llvm.ptr
      %8524 = arith.constant 11 : i64
      %8525 = func.call @cc_make_string(%8523, %8524) : (!llvm.ptr, i64) -> i64
      %8526 = func.call @cc_intern(%8522, %8525) : (i64, i64) -> i64
      %8527 = func.call @cc_nil_value() : () -> i64
      %8528 = func.call @cc_cons(%8526, %8527) : (i64, i64) -> i64
      %8529 = func.call @cc_values_pack(%8528) : (i64) -> i64
      func.call @stack_push_pointer(%8526) : (i64) -> ()
      %8530 = llvm.mlir.addressof @str900 : !llvm.ptr
      %8531 = arith.constant 23 : i64
      %8532 = func.call @cc_make_string(%8530, %8531) : (!llvm.ptr, i64) -> i64
      %8533 = llvm.mlir.addressof @str901 : !llvm.ptr
      %8534 = arith.constant 11 : i64
      %8535 = func.call @cc_make_string(%8533, %8534) : (!llvm.ptr, i64) -> i64
      %8536 = func.call @cc_intern(%8532, %8535) : (i64, i64) -> i64
      %8537 = func.call @cc_nil_value() : () -> i64
      %8538 = func.call @cc_cons(%8536, %8537) : (i64, i64) -> i64
      %8539 = func.call @cc_values_pack(%8538) : (i64) -> i64
      func.call @stack_push_pointer(%8536) : (i64) -> ()
      %8540 = llvm.mlir.addressof @str902 : !llvm.ptr
      %8541 = arith.constant 15 : i64
      %8542 = func.call @cc_make_string(%8540, %8541) : (!llvm.ptr, i64) -> i64
      %8543 = llvm.mlir.addressof @str903 : !llvm.ptr
      %8544 = arith.constant 11 : i64
      %8545 = func.call @cc_make_string(%8543, %8544) : (!llvm.ptr, i64) -> i64
      %8546 = func.call @cc_intern(%8542, %8545) : (i64, i64) -> i64
      %8547 = func.call @cc_nil_value() : () -> i64
      %8548 = func.call @cc_cons(%8546, %8547) : (i64, i64) -> i64
      %8549 = func.call @cc_values_pack(%8548) : (i64) -> i64
      func.call @stack_push_pointer(%8546) : (i64) -> ()
      %8550 = llvm.mlir.addressof @str904 : !llvm.ptr
      %8551 = arith.constant 17 : i64
      %8552 = func.call @cc_make_string(%8550, %8551) : (!llvm.ptr, i64) -> i64
      %8553 = llvm.mlir.addressof @str905 : !llvm.ptr
      %8554 = arith.constant 11 : i64
      %8555 = func.call @cc_make_string(%8553, %8554) : (!llvm.ptr, i64) -> i64
      %8556 = func.call @cc_intern(%8552, %8555) : (i64, i64) -> i64
      %8557 = func.call @cc_nil_value() : () -> i64
      %8558 = func.call @cc_cons(%8556, %8557) : (i64, i64) -> i64
      %8559 = func.call @cc_values_pack(%8558) : (i64) -> i64
      func.call @stack_push_pointer(%8556) : (i64) -> ()
      %8560 = llvm.mlir.addressof @str906 : !llvm.ptr
      %8561 = arith.constant 10 : i64
      %8562 = func.call @cc_make_string(%8560, %8561) : (!llvm.ptr, i64) -> i64
      %8563 = llvm.mlir.addressof @str907 : !llvm.ptr
      %8564 = arith.constant 11 : i64
      %8565 = func.call @cc_make_string(%8563, %8564) : (!llvm.ptr, i64) -> i64
      %8566 = func.call @cc_intern(%8562, %8565) : (i64, i64) -> i64
      %8567 = func.call @cc_nil_value() : () -> i64
      %8568 = func.call @cc_cons(%8566, %8567) : (i64, i64) -> i64
      %8569 = func.call @cc_values_pack(%8568) : (i64) -> i64
      func.call @stack_push_pointer(%8566) : (i64) -> ()
      %8570 = llvm.mlir.addressof @str908 : !llvm.ptr
      %8571 = arith.constant 15 : i64
      %8572 = func.call @cc_make_string(%8570, %8571) : (!llvm.ptr, i64) -> i64
      %8573 = llvm.mlir.addressof @str909 : !llvm.ptr
      %8574 = arith.constant 11 : i64
      %8575 = func.call @cc_make_string(%8573, %8574) : (!llvm.ptr, i64) -> i64
      %8576 = func.call @cc_intern(%8572, %8575) : (i64, i64) -> i64
      %8577 = func.call @cc_nil_value() : () -> i64
      %8578 = func.call @cc_cons(%8576, %8577) : (i64, i64) -> i64
      %8579 = func.call @cc_values_pack(%8578) : (i64) -> i64
      func.call @stack_push_pointer(%8576) : (i64) -> ()
      %8580 = llvm.mlir.addressof @str910 : !llvm.ptr
      %8581 = arith.constant 27 : i64
      %8582 = func.call @cc_make_string(%8580, %8581) : (!llvm.ptr, i64) -> i64
      %8583 = llvm.mlir.addressof @str911 : !llvm.ptr
      %8584 = arith.constant 11 : i64
      %8585 = func.call @cc_make_string(%8583, %8584) : (!llvm.ptr, i64) -> i64
      %8586 = func.call @cc_intern(%8582, %8585) : (i64, i64) -> i64
      %8587 = func.call @cc_nil_value() : () -> i64
      %8588 = func.call @cc_cons(%8586, %8587) : (i64, i64) -> i64
      %8589 = func.call @cc_values_pack(%8588) : (i64) -> i64
      func.call @stack_push_pointer(%8586) : (i64) -> ()
      %8590 = llvm.mlir.addressof @str912 : !llvm.ptr
      %8591 = arith.constant 14 : i64
      %8592 = func.call @cc_make_string(%8590, %8591) : (!llvm.ptr, i64) -> i64
      %8593 = llvm.mlir.addressof @str913 : !llvm.ptr
      %8594 = arith.constant 11 : i64
      %8595 = func.call @cc_make_string(%8593, %8594) : (!llvm.ptr, i64) -> i64
      %8596 = func.call @cc_intern(%8592, %8595) : (i64, i64) -> i64
      %8597 = func.call @cc_nil_value() : () -> i64
      %8598 = func.call @cc_cons(%8596, %8597) : (i64, i64) -> i64
      %8599 = func.call @cc_values_pack(%8598) : (i64) -> i64
      func.call @stack_push_pointer(%8596) : (i64) -> ()
      %8600 = llvm.mlir.addressof @str914 : !llvm.ptr
      %8601 = arith.constant 10 : i64
      %8602 = func.call @cc_make_string(%8600, %8601) : (!llvm.ptr, i64) -> i64
      %8603 = llvm.mlir.addressof @str915 : !llvm.ptr
      %8604 = arith.constant 11 : i64
      %8605 = func.call @cc_make_string(%8603, %8604) : (!llvm.ptr, i64) -> i64
      %8606 = func.call @cc_intern(%8602, %8605) : (i64, i64) -> i64
      %8607 = func.call @cc_nil_value() : () -> i64
      %8608 = func.call @cc_cons(%8606, %8607) : (i64, i64) -> i64
      %8609 = func.call @cc_values_pack(%8608) : (i64) -> i64
      func.call @stack_push_pointer(%8606) : (i64) -> ()
      %8610 = llvm.mlir.addressof @str916 : !llvm.ptr
      %8611 = arith.constant 16 : i64
      %8612 = func.call @cc_make_string(%8610, %8611) : (!llvm.ptr, i64) -> i64
      %8613 = llvm.mlir.addressof @str917 : !llvm.ptr
      %8614 = arith.constant 11 : i64
      %8615 = func.call @cc_make_string(%8613, %8614) : (!llvm.ptr, i64) -> i64
      %8616 = func.call @cc_intern(%8612, %8615) : (i64, i64) -> i64
      %8617 = func.call @cc_nil_value() : () -> i64
      %8618 = func.call @cc_cons(%8616, %8617) : (i64, i64) -> i64
      %8619 = func.call @cc_values_pack(%8618) : (i64) -> i64
      func.call @stack_push_pointer(%8616) : (i64) -> ()
      %8620 = llvm.mlir.addressof @str918 : !llvm.ptr
      %8621 = arith.constant 15 : i64
      %8622 = func.call @cc_make_string(%8620, %8621) : (!llvm.ptr, i64) -> i64
      %8623 = llvm.mlir.addressof @str919 : !llvm.ptr
      %8624 = arith.constant 11 : i64
      %8625 = func.call @cc_make_string(%8623, %8624) : (!llvm.ptr, i64) -> i64
      %8626 = func.call @cc_intern(%8622, %8625) : (i64, i64) -> i64
      %8627 = func.call @cc_nil_value() : () -> i64
      %8628 = func.call @cc_cons(%8626, %8627) : (i64, i64) -> i64
      %8629 = func.call @cc_values_pack(%8628) : (i64) -> i64
      func.call @stack_push_pointer(%8626) : (i64) -> ()
      %8630 = llvm.mlir.addressof @str920 : !llvm.ptr
      %8631 = arith.constant 12 : i64
      %8632 = func.call @cc_make_string(%8630, %8631) : (!llvm.ptr, i64) -> i64
      %8633 = llvm.mlir.addressof @str921 : !llvm.ptr
      %8634 = arith.constant 11 : i64
      %8635 = func.call @cc_make_string(%8633, %8634) : (!llvm.ptr, i64) -> i64
      %8636 = func.call @cc_intern(%8632, %8635) : (i64, i64) -> i64
      %8637 = func.call @cc_nil_value() : () -> i64
      %8638 = func.call @cc_cons(%8636, %8637) : (i64, i64) -> i64
      %8639 = func.call @cc_values_pack(%8638) : (i64) -> i64
      func.call @stack_push_pointer(%8636) : (i64) -> ()
      %8640 = llvm.mlir.addressof @str922 : !llvm.ptr
      %8641 = arith.constant 15 : i64
      %8642 = func.call @cc_make_string(%8640, %8641) : (!llvm.ptr, i64) -> i64
      %8643 = llvm.mlir.addressof @str923 : !llvm.ptr
      %8644 = arith.constant 11 : i64
      %8645 = func.call @cc_make_string(%8643, %8644) : (!llvm.ptr, i64) -> i64
      %8646 = func.call @cc_intern(%8642, %8645) : (i64, i64) -> i64
      %8647 = func.call @cc_nil_value() : () -> i64
      %8648 = func.call @cc_cons(%8646, %8647) : (i64, i64) -> i64
      %8649 = func.call @cc_values_pack(%8648) : (i64) -> i64
      func.call @stack_push_pointer(%8646) : (i64) -> ()
      %8650 = llvm.mlir.addressof @str924 : !llvm.ptr
      %8651 = arith.constant 14 : i64
      %8652 = func.call @cc_make_string(%8650, %8651) : (!llvm.ptr, i64) -> i64
      %8653 = llvm.mlir.addressof @str925 : !llvm.ptr
      %8654 = arith.constant 11 : i64
      %8655 = func.call @cc_make_string(%8653, %8654) : (!llvm.ptr, i64) -> i64
      %8656 = func.call @cc_intern(%8652, %8655) : (i64, i64) -> i64
      %8657 = func.call @cc_nil_value() : () -> i64
      %8658 = func.call @cc_cons(%8656, %8657) : (i64, i64) -> i64
      %8659 = func.call @cc_values_pack(%8658) : (i64) -> i64
      func.call @stack_push_pointer(%8656) : (i64) -> ()
      %8660 = llvm.mlir.addressof @str926 : !llvm.ptr
      %8661 = arith.constant 18 : i64
      %8662 = func.call @cc_make_string(%8660, %8661) : (!llvm.ptr, i64) -> i64
      %8663 = llvm.mlir.addressof @str927 : !llvm.ptr
      %8664 = arith.constant 11 : i64
      %8665 = func.call @cc_make_string(%8663, %8664) : (!llvm.ptr, i64) -> i64
      %8666 = func.call @cc_intern(%8662, %8665) : (i64, i64) -> i64
      %8667 = func.call @cc_nil_value() : () -> i64
      %8668 = func.call @cc_cons(%8666, %8667) : (i64, i64) -> i64
      %8669 = func.call @cc_values_pack(%8668) : (i64) -> i64
      func.call @stack_push_pointer(%8666) : (i64) -> ()
      %8670 = llvm.mlir.addressof @str928 : !llvm.ptr
      %8671 = arith.constant 9 : i64
      %8672 = func.call @cc_make_string(%8670, %8671) : (!llvm.ptr, i64) -> i64
      %8673 = llvm.mlir.addressof @str929 : !llvm.ptr
      %8674 = arith.constant 11 : i64
      %8675 = func.call @cc_make_string(%8673, %8674) : (!llvm.ptr, i64) -> i64
      %8676 = func.call @cc_intern(%8672, %8675) : (i64, i64) -> i64
      %8677 = func.call @cc_nil_value() : () -> i64
      %8678 = func.call @cc_cons(%8676, %8677) : (i64, i64) -> i64
      %8679 = func.call @cc_values_pack(%8678) : (i64) -> i64
      func.call @stack_push_pointer(%8676) : (i64) -> ()
      %8680 = llvm.mlir.addressof @str930 : !llvm.ptr
      %8681 = arith.constant 9 : i64
      %8682 = func.call @cc_make_string(%8680, %8681) : (!llvm.ptr, i64) -> i64
      %8683 = llvm.mlir.addressof @str931 : !llvm.ptr
      %8684 = arith.constant 11 : i64
      %8685 = func.call @cc_make_string(%8683, %8684) : (!llvm.ptr, i64) -> i64
      %8686 = func.call @cc_intern(%8682, %8685) : (i64, i64) -> i64
      %8687 = func.call @cc_nil_value() : () -> i64
      %8688 = func.call @cc_cons(%8686, %8687) : (i64, i64) -> i64
      %8689 = func.call @cc_values_pack(%8688) : (i64) -> i64
      func.call @stack_push_pointer(%8686) : (i64) -> ()
      %8690 = llvm.mlir.addressof @str932 : !llvm.ptr
      %8691 = arith.constant 13 : i64
      %8692 = func.call @cc_make_string(%8690, %8691) : (!llvm.ptr, i64) -> i64
      %8693 = llvm.mlir.addressof @str933 : !llvm.ptr
      %8694 = arith.constant 11 : i64
      %8695 = func.call @cc_make_string(%8693, %8694) : (!llvm.ptr, i64) -> i64
      %8696 = func.call @cc_intern(%8692, %8695) : (i64, i64) -> i64
      %8697 = func.call @cc_nil_value() : () -> i64
      %8698 = func.call @cc_cons(%8696, %8697) : (i64, i64) -> i64
      %8699 = func.call @cc_values_pack(%8698) : (i64) -> i64
      func.call @stack_push_pointer(%8696) : (i64) -> ()
      %8700 = llvm.mlir.addressof @str934 : !llvm.ptr
      %8701 = arith.constant 12 : i64
      %8702 = func.call @cc_make_string(%8700, %8701) : (!llvm.ptr, i64) -> i64
      %8703 = llvm.mlir.addressof @str935 : !llvm.ptr
      %8704 = arith.constant 11 : i64
      %8705 = func.call @cc_make_string(%8703, %8704) : (!llvm.ptr, i64) -> i64
      %8706 = func.call @cc_intern(%8702, %8705) : (i64, i64) -> i64
      %8707 = func.call @cc_nil_value() : () -> i64
      %8708 = func.call @cc_cons(%8706, %8707) : (i64, i64) -> i64
      %8709 = func.call @cc_values_pack(%8708) : (i64) -> i64
      func.call @stack_push_pointer(%8706) : (i64) -> ()
      %8710 = llvm.mlir.addressof @str936 : !llvm.ptr
      %8711 = arith.constant 12 : i64
      %8712 = func.call @cc_make_string(%8710, %8711) : (!llvm.ptr, i64) -> i64
      %8713 = llvm.mlir.addressof @str937 : !llvm.ptr
      %8714 = arith.constant 11 : i64
      %8715 = func.call @cc_make_string(%8713, %8714) : (!llvm.ptr, i64) -> i64
      %8716 = func.call @cc_intern(%8712, %8715) : (i64, i64) -> i64
      %8717 = func.call @cc_nil_value() : () -> i64
      %8718 = func.call @cc_cons(%8716, %8717) : (i64, i64) -> i64
      %8719 = func.call @cc_values_pack(%8718) : (i64) -> i64
      func.call @stack_push_pointer(%8716) : (i64) -> ()
      %8720 = llvm.mlir.addressof @str938 : !llvm.ptr
      %8721 = arith.constant 14 : i64
      %8722 = func.call @cc_make_string(%8720, %8721) : (!llvm.ptr, i64) -> i64
      %8723 = llvm.mlir.addressof @str939 : !llvm.ptr
      %8724 = arith.constant 11 : i64
      %8725 = func.call @cc_make_string(%8723, %8724) : (!llvm.ptr, i64) -> i64
      %8726 = func.call @cc_intern(%8722, %8725) : (i64, i64) -> i64
      %8727 = func.call @cc_nil_value() : () -> i64
      %8728 = func.call @cc_cons(%8726, %8727) : (i64, i64) -> i64
      %8729 = func.call @cc_values_pack(%8728) : (i64) -> i64
      func.call @stack_push_pointer(%8726) : (i64) -> ()
      %8730 = llvm.mlir.addressof @str940 : !llvm.ptr
      %8731 = arith.constant 14 : i64
      %8732 = func.call @cc_make_string(%8730, %8731) : (!llvm.ptr, i64) -> i64
      %8733 = llvm.mlir.addressof @str941 : !llvm.ptr
      %8734 = arith.constant 11 : i64
      %8735 = func.call @cc_make_string(%8733, %8734) : (!llvm.ptr, i64) -> i64
      %8736 = func.call @cc_intern(%8732, %8735) : (i64, i64) -> i64
      %8737 = func.call @cc_nil_value() : () -> i64
      %8738 = func.call @cc_cons(%8736, %8737) : (i64, i64) -> i64
      %8739 = func.call @cc_values_pack(%8738) : (i64) -> i64
      func.call @stack_push_pointer(%8736) : (i64) -> ()
      %8740 = llvm.mlir.addressof @str942 : !llvm.ptr
      %8741 = arith.constant 14 : i64
      %8742 = func.call @cc_make_string(%8740, %8741) : (!llvm.ptr, i64) -> i64
      %8743 = llvm.mlir.addressof @str943 : !llvm.ptr
      %8744 = arith.constant 11 : i64
      %8745 = func.call @cc_make_string(%8743, %8744) : (!llvm.ptr, i64) -> i64
      %8746 = func.call @cc_intern(%8742, %8745) : (i64, i64) -> i64
      %8747 = func.call @cc_nil_value() : () -> i64
      %8748 = func.call @cc_cons(%8746, %8747) : (i64, i64) -> i64
      %8749 = func.call @cc_values_pack(%8748) : (i64) -> i64
      func.call @stack_push_pointer(%8746) : (i64) -> ()
      %8750 = llvm.mlir.addressof @str944 : !llvm.ptr
      %8751 = arith.constant 14 : i64
      %8752 = func.call @cc_make_string(%8750, %8751) : (!llvm.ptr, i64) -> i64
      %8753 = llvm.mlir.addressof @str945 : !llvm.ptr
      %8754 = arith.constant 11 : i64
      %8755 = func.call @cc_make_string(%8753, %8754) : (!llvm.ptr, i64) -> i64
      %8756 = func.call @cc_intern(%8752, %8755) : (i64, i64) -> i64
      %8757 = func.call @cc_nil_value() : () -> i64
      %8758 = func.call @cc_cons(%8756, %8757) : (i64, i64) -> i64
      %8759 = func.call @cc_values_pack(%8758) : (i64) -> i64
      func.call @stack_push_pointer(%8756) : (i64) -> ()
      %8760 = llvm.mlir.addressof @str946 : !llvm.ptr
      %8761 = arith.constant 13 : i64
      %8762 = func.call @cc_make_string(%8760, %8761) : (!llvm.ptr, i64) -> i64
      %8763 = llvm.mlir.addressof @str947 : !llvm.ptr
      %8764 = arith.constant 11 : i64
      %8765 = func.call @cc_make_string(%8763, %8764) : (!llvm.ptr, i64) -> i64
      %8766 = func.call @cc_intern(%8762, %8765) : (i64, i64) -> i64
      %8767 = func.call @cc_nil_value() : () -> i64
      %8768 = func.call @cc_cons(%8766, %8767) : (i64, i64) -> i64
      %8769 = func.call @cc_values_pack(%8768) : (i64) -> i64
      func.call @stack_push_pointer(%8766) : (i64) -> ()
      %8770 = llvm.mlir.addressof @str948 : !llvm.ptr
      %8771 = arith.constant 13 : i64
      %8772 = func.call @cc_make_string(%8770, %8771) : (!llvm.ptr, i64) -> i64
      %8773 = llvm.mlir.addressof @str949 : !llvm.ptr
      %8774 = arith.constant 11 : i64
      %8775 = func.call @cc_make_string(%8773, %8774) : (!llvm.ptr, i64) -> i64
      %8776 = func.call @cc_intern(%8772, %8775) : (i64, i64) -> i64
      %8777 = func.call @cc_nil_value() : () -> i64
      %8778 = func.call @cc_cons(%8776, %8777) : (i64, i64) -> i64
      %8779 = func.call @cc_values_pack(%8778) : (i64) -> i64
      func.call @stack_push_pointer(%8776) : (i64) -> ()
      %8780 = llvm.mlir.addressof @str950 : !llvm.ptr
      %8781 = arith.constant 19 : i64
      %8782 = func.call @cc_make_string(%8780, %8781) : (!llvm.ptr, i64) -> i64
      %8783 = llvm.mlir.addressof @str951 : !llvm.ptr
      %8784 = arith.constant 11 : i64
      %8785 = func.call @cc_make_string(%8783, %8784) : (!llvm.ptr, i64) -> i64
      %8786 = func.call @cc_intern(%8782, %8785) : (i64, i64) -> i64
      %8787 = func.call @cc_nil_value() : () -> i64
      %8788 = func.call @cc_cons(%8786, %8787) : (i64, i64) -> i64
      %8789 = func.call @cc_values_pack(%8788) : (i64) -> i64
      func.call @stack_push_pointer(%8786) : (i64) -> ()
      %8790 = llvm.mlir.addressof @str952 : !llvm.ptr
      %8791 = arith.constant 23 : i64
      %8792 = func.call @cc_make_string(%8790, %8791) : (!llvm.ptr, i64) -> i64
      %8793 = llvm.mlir.addressof @str953 : !llvm.ptr
      %8794 = arith.constant 11 : i64
      %8795 = func.call @cc_make_string(%8793, %8794) : (!llvm.ptr, i64) -> i64
      %8796 = func.call @cc_intern(%8792, %8795) : (i64, i64) -> i64
      %8797 = func.call @cc_nil_value() : () -> i64
      %8798 = func.call @cc_cons(%8796, %8797) : (i64, i64) -> i64
      %8799 = func.call @cc_values_pack(%8798) : (i64) -> i64
      func.call @stack_push_pointer(%8796) : (i64) -> ()
      %8800 = llvm.mlir.addressof @str954 : !llvm.ptr
      %8801 = arith.constant 14 : i64
      %8802 = func.call @cc_make_string(%8800, %8801) : (!llvm.ptr, i64) -> i64
      %8803 = llvm.mlir.addressof @str955 : !llvm.ptr
      %8804 = arith.constant 11 : i64
      %8805 = func.call @cc_make_string(%8803, %8804) : (!llvm.ptr, i64) -> i64
      %8806 = func.call @cc_intern(%8802, %8805) : (i64, i64) -> i64
      %8807 = func.call @cc_nil_value() : () -> i64
      %8808 = func.call @cc_cons(%8806, %8807) : (i64, i64) -> i64
      %8809 = func.call @cc_values_pack(%8808) : (i64) -> i64
      func.call @stack_push_pointer(%8806) : (i64) -> ()
      %8810 = llvm.mlir.addressof @str956 : !llvm.ptr
      %8811 = arith.constant 13 : i64
      %8812 = func.call @cc_make_string(%8810, %8811) : (!llvm.ptr, i64) -> i64
      %8813 = llvm.mlir.addressof @str957 : !llvm.ptr
      %8814 = arith.constant 11 : i64
      %8815 = func.call @cc_make_string(%8813, %8814) : (!llvm.ptr, i64) -> i64
      %8816 = func.call @cc_intern(%8812, %8815) : (i64, i64) -> i64
      %8817 = func.call @cc_nil_value() : () -> i64
      %8818 = func.call @cc_cons(%8816, %8817) : (i64, i64) -> i64
      %8819 = func.call @cc_values_pack(%8818) : (i64) -> i64
      func.call @stack_push_pointer(%8816) : (i64) -> ()
      %8820 = llvm.mlir.addressof @str958 : !llvm.ptr
      %8821 = arith.constant 16 : i64
      %8822 = func.call @cc_make_string(%8820, %8821) : (!llvm.ptr, i64) -> i64
      %8823 = llvm.mlir.addressof @str959 : !llvm.ptr
      %8824 = arith.constant 11 : i64
      %8825 = func.call @cc_make_string(%8823, %8824) : (!llvm.ptr, i64) -> i64
      %8826 = func.call @cc_intern(%8822, %8825) : (i64, i64) -> i64
      %8827 = func.call @cc_nil_value() : () -> i64
      %8828 = func.call @cc_cons(%8826, %8827) : (i64, i64) -> i64
      %8829 = func.call @cc_values_pack(%8828) : (i64) -> i64
      func.call @stack_push_pointer(%8826) : (i64) -> ()
      %8830 = llvm.mlir.addressof @str960 : !llvm.ptr
      %8831 = arith.constant 20 : i64
      %8832 = func.call @cc_make_string(%8830, %8831) : (!llvm.ptr, i64) -> i64
      %8833 = llvm.mlir.addressof @str961 : !llvm.ptr
      %8834 = arith.constant 11 : i64
      %8835 = func.call @cc_make_string(%8833, %8834) : (!llvm.ptr, i64) -> i64
      %8836 = func.call @cc_intern(%8832, %8835) : (i64, i64) -> i64
      %8837 = func.call @cc_nil_value() : () -> i64
      %8838 = func.call @cc_cons(%8836, %8837) : (i64, i64) -> i64
      %8839 = func.call @cc_values_pack(%8838) : (i64) -> i64
      func.call @stack_push_pointer(%8836) : (i64) -> ()
      %8840 = llvm.mlir.addressof @str962 : !llvm.ptr
      %8841 = arith.constant 10 : i64
      %8842 = func.call @cc_make_string(%8840, %8841) : (!llvm.ptr, i64) -> i64
      %8843 = llvm.mlir.addressof @str963 : !llvm.ptr
      %8844 = arith.constant 11 : i64
      %8845 = func.call @cc_make_string(%8843, %8844) : (!llvm.ptr, i64) -> i64
      %8846 = func.call @cc_intern(%8842, %8845) : (i64, i64) -> i64
      %8847 = func.call @cc_nil_value() : () -> i64
      %8848 = func.call @cc_cons(%8846, %8847) : (i64, i64) -> i64
      %8849 = func.call @cc_values_pack(%8848) : (i64) -> i64
      func.call @stack_push_pointer(%8846) : (i64) -> ()
      %8850 = llvm.mlir.addressof @str964 : !llvm.ptr
      %8851 = arith.constant 14 : i64
      %8852 = func.call @cc_make_string(%8850, %8851) : (!llvm.ptr, i64) -> i64
      %8853 = llvm.mlir.addressof @str965 : !llvm.ptr
      %8854 = arith.constant 11 : i64
      %8855 = func.call @cc_make_string(%8853, %8854) : (!llvm.ptr, i64) -> i64
      %8856 = func.call @cc_intern(%8852, %8855) : (i64, i64) -> i64
      %8857 = func.call @cc_nil_value() : () -> i64
      %8858 = func.call @cc_cons(%8856, %8857) : (i64, i64) -> i64
      %8859 = func.call @cc_values_pack(%8858) : (i64) -> i64
      func.call @stack_push_pointer(%8856) : (i64) -> ()
      %8860 = llvm.mlir.addressof @str966 : !llvm.ptr
      %8861 = arith.constant 11 : i64
      %8862 = func.call @cc_make_string(%8860, %8861) : (!llvm.ptr, i64) -> i64
      %8863 = llvm.mlir.addressof @str967 : !llvm.ptr
      %8864 = arith.constant 11 : i64
      %8865 = func.call @cc_make_string(%8863, %8864) : (!llvm.ptr, i64) -> i64
      %8866 = func.call @cc_intern(%8862, %8865) : (i64, i64) -> i64
      %8867 = func.call @cc_nil_value() : () -> i64
      %8868 = func.call @cc_cons(%8866, %8867) : (i64, i64) -> i64
      %8869 = func.call @cc_values_pack(%8868) : (i64) -> i64
      func.call @stack_push_pointer(%8866) : (i64) -> ()
      %8870 = llvm.mlir.addressof @str968 : !llvm.ptr
      %8871 = arith.constant 27 : i64
      %8872 = func.call @cc_make_string(%8870, %8871) : (!llvm.ptr, i64) -> i64
      %8873 = llvm.mlir.addressof @str969 : !llvm.ptr
      %8874 = arith.constant 11 : i64
      %8875 = func.call @cc_make_string(%8873, %8874) : (!llvm.ptr, i64) -> i64
      %8876 = func.call @cc_intern(%8872, %8875) : (i64, i64) -> i64
      %8877 = func.call @cc_nil_value() : () -> i64
      %8878 = func.call @cc_cons(%8876, %8877) : (i64, i64) -> i64
      %8879 = func.call @cc_values_pack(%8878) : (i64) -> i64
      func.call @stack_push_pointer(%8876) : (i64) -> ()
      %8880 = llvm.mlir.addressof @str970 : !llvm.ptr
      %8881 = arith.constant 11 : i64
      %8882 = func.call @cc_make_string(%8880, %8881) : (!llvm.ptr, i64) -> i64
      %8883 = llvm.mlir.addressof @str971 : !llvm.ptr
      %8884 = arith.constant 11 : i64
      %8885 = func.call @cc_make_string(%8883, %8884) : (!llvm.ptr, i64) -> i64
      %8886 = func.call @cc_intern(%8882, %8885) : (i64, i64) -> i64
      %8887 = func.call @cc_nil_value() : () -> i64
      %8888 = func.call @cc_cons(%8886, %8887) : (i64, i64) -> i64
      %8889 = func.call @cc_values_pack(%8888) : (i64) -> i64
      func.call @stack_push_pointer(%8886) : (i64) -> ()
      %8890 = llvm.mlir.addressof @str972 : !llvm.ptr
      %8891 = arith.constant 15 : i64
      %8892 = func.call @cc_make_string(%8890, %8891) : (!llvm.ptr, i64) -> i64
      %8893 = llvm.mlir.addressof @str973 : !llvm.ptr
      %8894 = arith.constant 11 : i64
      %8895 = func.call @cc_make_string(%8893, %8894) : (!llvm.ptr, i64) -> i64
      %8896 = func.call @cc_intern(%8892, %8895) : (i64, i64) -> i64
      %8897 = func.call @cc_nil_value() : () -> i64
      %8898 = func.call @cc_cons(%8896, %8897) : (i64, i64) -> i64
      %8899 = func.call @cc_values_pack(%8898) : (i64) -> i64
      func.call @stack_push_pointer(%8896) : (i64) -> ()
      %8900 = llvm.mlir.addressof @str974 : !llvm.ptr
      %8901 = arith.constant 11 : i64
      %8902 = func.call @cc_make_string(%8900, %8901) : (!llvm.ptr, i64) -> i64
      %8903 = llvm.mlir.addressof @str975 : !llvm.ptr
      %8904 = arith.constant 11 : i64
      %8905 = func.call @cc_make_string(%8903, %8904) : (!llvm.ptr, i64) -> i64
      %8906 = func.call @cc_intern(%8902, %8905) : (i64, i64) -> i64
      %8907 = func.call @cc_nil_value() : () -> i64
      %8908 = func.call @cc_cons(%8906, %8907) : (i64, i64) -> i64
      %8909 = func.call @cc_values_pack(%8908) : (i64) -> i64
      func.call @stack_push_pointer(%8906) : (i64) -> ()
      %8910 = llvm.mlir.addressof @str976 : !llvm.ptr
      %8911 = arith.constant 16 : i64
      %8912 = func.call @cc_make_string(%8910, %8911) : (!llvm.ptr, i64) -> i64
      %8913 = llvm.mlir.addressof @str977 : !llvm.ptr
      %8914 = arith.constant 11 : i64
      %8915 = func.call @cc_make_string(%8913, %8914) : (!llvm.ptr, i64) -> i64
      %8916 = func.call @cc_intern(%8912, %8915) : (i64, i64) -> i64
      %8917 = func.call @cc_nil_value() : () -> i64
      %8918 = func.call @cc_cons(%8916, %8917) : (i64, i64) -> i64
      %8919 = func.call @cc_values_pack(%8918) : (i64) -> i64
      func.call @stack_push_pointer(%8916) : (i64) -> ()
      %8920 = llvm.mlir.addressof @str978 : !llvm.ptr
      %8921 = arith.constant 17 : i64
      %8922 = func.call @cc_make_string(%8920, %8921) : (!llvm.ptr, i64) -> i64
      %8923 = llvm.mlir.addressof @str979 : !llvm.ptr
      %8924 = arith.constant 11 : i64
      %8925 = func.call @cc_make_string(%8923, %8924) : (!llvm.ptr, i64) -> i64
      %8926 = func.call @cc_intern(%8922, %8925) : (i64, i64) -> i64
      %8927 = func.call @cc_nil_value() : () -> i64
      %8928 = func.call @cc_cons(%8926, %8927) : (i64, i64) -> i64
      %8929 = func.call @cc_values_pack(%8928) : (i64) -> i64
      func.call @stack_push_pointer(%8926) : (i64) -> ()
      %8930 = llvm.mlir.addressof @str980 : !llvm.ptr
      %8931 = arith.constant 13 : i64
      %8932 = func.call @cc_make_string(%8930, %8931) : (!llvm.ptr, i64) -> i64
      %8933 = llvm.mlir.addressof @str981 : !llvm.ptr
      %8934 = arith.constant 11 : i64
      %8935 = func.call @cc_make_string(%8933, %8934) : (!llvm.ptr, i64) -> i64
      %8936 = func.call @cc_intern(%8932, %8935) : (i64, i64) -> i64
      %8937 = func.call @cc_nil_value() : () -> i64
      %8938 = func.call @cc_cons(%8936, %8937) : (i64, i64) -> i64
      %8939 = func.call @cc_values_pack(%8938) : (i64) -> i64
      func.call @stack_push_pointer(%8936) : (i64) -> ()
      %8940 = llvm.mlir.addressof @str982 : !llvm.ptr
      %8941 = arith.constant 14 : i64
      %8942 = func.call @cc_make_string(%8940, %8941) : (!llvm.ptr, i64) -> i64
      %8943 = llvm.mlir.addressof @str983 : !llvm.ptr
      %8944 = arith.constant 11 : i64
      %8945 = func.call @cc_make_string(%8943, %8944) : (!llvm.ptr, i64) -> i64
      %8946 = func.call @cc_intern(%8942, %8945) : (i64, i64) -> i64
      %8947 = func.call @cc_nil_value() : () -> i64
      %8948 = func.call @cc_cons(%8946, %8947) : (i64, i64) -> i64
      %8949 = func.call @cc_values_pack(%8948) : (i64) -> i64
      func.call @stack_push_pointer(%8946) : (i64) -> ()
      %8950 = llvm.mlir.addressof @str984 : !llvm.ptr
      %8951 = arith.constant 2 : i64
      %8952 = func.call @cc_make_string(%8950, %8951) : (!llvm.ptr, i64) -> i64
      %8953 = llvm.mlir.addressof @str985 : !llvm.ptr
      %8954 = arith.constant 11 : i64
      %8955 = func.call @cc_make_string(%8953, %8954) : (!llvm.ptr, i64) -> i64
      %8956 = func.call @cc_intern(%8952, %8955) : (i64, i64) -> i64
      %8957 = func.call @cc_nil_value() : () -> i64
      %8958 = func.call @cc_cons(%8956, %8957) : (i64, i64) -> i64
      %8959 = func.call @cc_values_pack(%8958) : (i64) -> i64
      func.call @stack_push_pointer(%8956) : (i64) -> ()
      %8960 = llvm.mlir.addressof @str986 : !llvm.ptr
      %8961 = arith.constant 3 : i64
      %8962 = func.call @cc_make_string(%8960, %8961) : (!llvm.ptr, i64) -> i64
      %8963 = llvm.mlir.addressof @str987 : !llvm.ptr
      %8964 = arith.constant 11 : i64
      %8965 = func.call @cc_make_string(%8963, %8964) : (!llvm.ptr, i64) -> i64
      %8966 = func.call @cc_intern(%8962, %8965) : (i64, i64) -> i64
      %8967 = func.call @cc_nil_value() : () -> i64
      %8968 = func.call @cc_cons(%8966, %8967) : (i64, i64) -> i64
      %8969 = func.call @cc_values_pack(%8968) : (i64) -> i64
      func.call @stack_push_pointer(%8966) : (i64) -> ()
      %8970 = llvm.mlir.addressof @str988 : !llvm.ptr
      %8971 = arith.constant 2 : i64
      %8972 = func.call @cc_make_string(%8970, %8971) : (!llvm.ptr, i64) -> i64
      %8973 = llvm.mlir.addressof @str989 : !llvm.ptr
      %8974 = arith.constant 11 : i64
      %8975 = func.call @cc_make_string(%8973, %8974) : (!llvm.ptr, i64) -> i64
      %8976 = func.call @cc_intern(%8972, %8975) : (i64, i64) -> i64
      %8977 = func.call @cc_nil_value() : () -> i64
      %8978 = func.call @cc_cons(%8976, %8977) : (i64, i64) -> i64
      %8979 = func.call @cc_values_pack(%8978) : (i64) -> i64
      func.call @stack_push_pointer(%8976) : (i64) -> ()
      %8980 = llvm.mlir.addressof @str990 : !llvm.ptr
      %8981 = arith.constant 3 : i64
      %8982 = func.call @cc_make_string(%8980, %8981) : (!llvm.ptr, i64) -> i64
      %8983 = llvm.mlir.addressof @str991 : !llvm.ptr
      %8984 = arith.constant 11 : i64
      %8985 = func.call @cc_make_string(%8983, %8984) : (!llvm.ptr, i64) -> i64
      %8986 = func.call @cc_intern(%8982, %8985) : (i64, i64) -> i64
      %8987 = func.call @cc_nil_value() : () -> i64
      %8988 = func.call @cc_cons(%8986, %8987) : (i64, i64) -> i64
      %8989 = func.call @cc_values_pack(%8988) : (i64) -> i64
      func.call @stack_push_pointer(%8986) : (i64) -> ()
      %8990 = llvm.mlir.addressof @str992 : !llvm.ptr
      %8991 = arith.constant 16 : i64
      %8992 = func.call @cc_make_string(%8990, %8991) : (!llvm.ptr, i64) -> i64
      %8993 = llvm.mlir.addressof @str993 : !llvm.ptr
      %8994 = arith.constant 11 : i64
      %8995 = func.call @cc_make_string(%8993, %8994) : (!llvm.ptr, i64) -> i64
      %8996 = func.call @cc_intern(%8992, %8995) : (i64, i64) -> i64
      %8997 = func.call @cc_nil_value() : () -> i64
      %8998 = func.call @cc_cons(%8996, %8997) : (i64, i64) -> i64
      %8999 = func.call @cc_values_pack(%8998) : (i64) -> i64
      func.call @stack_push_pointer(%8996) : (i64) -> ()
      %9000 = llvm.mlir.addressof @str994 : !llvm.ptr
      %9001 = arith.constant 5 : i64
      %9002 = func.call @cc_make_string(%9000, %9001) : (!llvm.ptr, i64) -> i64
      %9003 = llvm.mlir.addressof @str995 : !llvm.ptr
      %9004 = arith.constant 11 : i64
      %9005 = func.call @cc_make_string(%9003, %9004) : (!llvm.ptr, i64) -> i64
      %9006 = func.call @cc_intern(%9002, %9005) : (i64, i64) -> i64
      %9007 = func.call @cc_nil_value() : () -> i64
      %9008 = func.call @cc_cons(%9006, %9007) : (i64, i64) -> i64
      %9009 = func.call @cc_values_pack(%9008) : (i64) -> i64
      func.call @stack_push_pointer(%9006) : (i64) -> ()
      %9010 = llvm.mlir.addressof @str996 : !llvm.ptr
      %9011 = arith.constant 21 : i64
      %9012 = func.call @cc_make_string(%9010, %9011) : (!llvm.ptr, i64) -> i64
      %9013 = llvm.mlir.addressof @str997 : !llvm.ptr
      %9014 = arith.constant 11 : i64
      %9015 = func.call @cc_make_string(%9013, %9014) : (!llvm.ptr, i64) -> i64
      %9016 = func.call @cc_intern(%9012, %9015) : (i64, i64) -> i64
      %9017 = func.call @cc_nil_value() : () -> i64
      %9018 = func.call @cc_cons(%9016, %9017) : (i64, i64) -> i64
      %9019 = func.call @cc_values_pack(%9018) : (i64) -> i64
      func.call @stack_push_pointer(%9016) : (i64) -> ()
      %9020 = llvm.mlir.addressof @str998 : !llvm.ptr
      %9021 = arith.constant 16 : i64
      %9022 = func.call @cc_make_string(%9020, %9021) : (!llvm.ptr, i64) -> i64
      %9023 = llvm.mlir.addressof @str999 : !llvm.ptr
      %9024 = arith.constant 11 : i64
      %9025 = func.call @cc_make_string(%9023, %9024) : (!llvm.ptr, i64) -> i64
      %9026 = func.call @cc_intern(%9022, %9025) : (i64, i64) -> i64
      %9027 = func.call @cc_nil_value() : () -> i64
      %9028 = func.call @cc_cons(%9026, %9027) : (i64, i64) -> i64
      %9029 = func.call @cc_values_pack(%9028) : (i64) -> i64
      func.call @stack_push_pointer(%9026) : (i64) -> ()
      %9030 = llvm.mlir.addressof @str1000 : !llvm.ptr
      %9031 = arith.constant 22 : i64
      %9032 = func.call @cc_make_string(%9030, %9031) : (!llvm.ptr, i64) -> i64
      %9033 = llvm.mlir.addressof @str1001 : !llvm.ptr
      %9034 = arith.constant 11 : i64
      %9035 = func.call @cc_make_string(%9033, %9034) : (!llvm.ptr, i64) -> i64
      %9036 = func.call @cc_intern(%9032, %9035) : (i64, i64) -> i64
      %9037 = func.call @cc_nil_value() : () -> i64
      %9038 = func.call @cc_cons(%9036, %9037) : (i64, i64) -> i64
      %9039 = func.call @cc_values_pack(%9038) : (i64) -> i64
      func.call @stack_push_pointer(%9036) : (i64) -> ()
      %9040 = llvm.mlir.addressof @str1002 : !llvm.ptr
      %9041 = arith.constant 9 : i64
      %9042 = func.call @cc_make_string(%9040, %9041) : (!llvm.ptr, i64) -> i64
      %9043 = llvm.mlir.addressof @str1003 : !llvm.ptr
      %9044 = arith.constant 11 : i64
      %9045 = func.call @cc_make_string(%9043, %9044) : (!llvm.ptr, i64) -> i64
      %9046 = func.call @cc_intern(%9042, %9045) : (i64, i64) -> i64
      %9047 = func.call @cc_nil_value() : () -> i64
      %9048 = func.call @cc_cons(%9046, %9047) : (i64, i64) -> i64
      %9049 = func.call @cc_values_pack(%9048) : (i64) -> i64
      func.call @stack_push_pointer(%9046) : (i64) -> ()
      %9050 = llvm.mlir.addressof @str1004 : !llvm.ptr
      %9051 = arith.constant 11 : i64
      %9052 = func.call @cc_make_string(%9050, %9051) : (!llvm.ptr, i64) -> i64
      %9053 = llvm.mlir.addressof @str1005 : !llvm.ptr
      %9054 = arith.constant 11 : i64
      %9055 = func.call @cc_make_string(%9053, %9054) : (!llvm.ptr, i64) -> i64
      %9056 = func.call @cc_intern(%9052, %9055) : (i64, i64) -> i64
      %9057 = func.call @cc_nil_value() : () -> i64
      %9058 = func.call @cc_cons(%9056, %9057) : (i64, i64) -> i64
      %9059 = func.call @cc_values_pack(%9058) : (i64) -> i64
      func.call @stack_push_pointer(%9056) : (i64) -> ()
      %9060 = llvm.mlir.addressof @str1006 : !llvm.ptr
      %9061 = arith.constant 6 : i64
      %9062 = func.call @cc_make_string(%9060, %9061) : (!llvm.ptr, i64) -> i64
      %9063 = llvm.mlir.addressof @str1007 : !llvm.ptr
      %9064 = arith.constant 11 : i64
      %9065 = func.call @cc_make_string(%9063, %9064) : (!llvm.ptr, i64) -> i64
      %9066 = func.call @cc_intern(%9062, %9065) : (i64, i64) -> i64
      %9067 = func.call @cc_nil_value() : () -> i64
      %9068 = func.call @cc_cons(%9066, %9067) : (i64, i64) -> i64
      %9069 = func.call @cc_values_pack(%9068) : (i64) -> i64
      func.call @stack_push_pointer(%9066) : (i64) -> ()
      %9070 = llvm.mlir.addressof @str1008 : !llvm.ptr
      %9071 = arith.constant 10 : i64
      %9072 = func.call @cc_make_string(%9070, %9071) : (!llvm.ptr, i64) -> i64
      %9073 = llvm.mlir.addressof @str1009 : !llvm.ptr
      %9074 = arith.constant 11 : i64
      %9075 = func.call @cc_make_string(%9073, %9074) : (!llvm.ptr, i64) -> i64
      %9076 = func.call @cc_intern(%9072, %9075) : (i64, i64) -> i64
      %9077 = func.call @cc_nil_value() : () -> i64
      %9078 = func.call @cc_cons(%9076, %9077) : (i64, i64) -> i64
      %9079 = func.call @cc_values_pack(%9078) : (i64) -> i64
      func.call @stack_push_pointer(%9076) : (i64) -> ()
      %9080 = llvm.mlir.addressof @str1010 : !llvm.ptr
      %9081 = arith.constant 7 : i64
      %9082 = func.call @cc_make_string(%9080, %9081) : (!llvm.ptr, i64) -> i64
      %9083 = llvm.mlir.addressof @str1011 : !llvm.ptr
      %9084 = arith.constant 11 : i64
      %9085 = func.call @cc_make_string(%9083, %9084) : (!llvm.ptr, i64) -> i64
      %9086 = func.call @cc_intern(%9082, %9085) : (i64, i64) -> i64
      %9087 = func.call @cc_nil_value() : () -> i64
      %9088 = func.call @cc_cons(%9086, %9087) : (i64, i64) -> i64
      %9089 = func.call @cc_values_pack(%9088) : (i64) -> i64
      func.call @stack_push_pointer(%9086) : (i64) -> ()
      %9090 = llvm.mlir.addressof @str1012 : !llvm.ptr
      %9091 = arith.constant 7 : i64
      %9092 = func.call @cc_make_string(%9090, %9091) : (!llvm.ptr, i64) -> i64
      %9093 = llvm.mlir.addressof @str1013 : !llvm.ptr
      %9094 = arith.constant 11 : i64
      %9095 = func.call @cc_make_string(%9093, %9094) : (!llvm.ptr, i64) -> i64
      %9096 = func.call @cc_intern(%9092, %9095) : (i64, i64) -> i64
      %9097 = func.call @cc_nil_value() : () -> i64
      %9098 = func.call @cc_cons(%9096, %9097) : (i64, i64) -> i64
      %9099 = func.call @cc_values_pack(%9098) : (i64) -> i64
      func.call @stack_push_pointer(%9096) : (i64) -> ()
      %9100 = llvm.mlir.addressof @str1014 : !llvm.ptr
      %9101 = arith.constant 9 : i64
      %9102 = func.call @cc_make_string(%9100, %9101) : (!llvm.ptr, i64) -> i64
      %9103 = llvm.mlir.addressof @str1015 : !llvm.ptr
      %9104 = arith.constant 11 : i64
      %9105 = func.call @cc_make_string(%9103, %9104) : (!llvm.ptr, i64) -> i64
      %9106 = func.call @cc_intern(%9102, %9105) : (i64, i64) -> i64
      %9107 = func.call @cc_nil_value() : () -> i64
      %9108 = func.call @cc_cons(%9106, %9107) : (i64, i64) -> i64
      %9109 = func.call @cc_values_pack(%9108) : (i64) -> i64
      func.call @stack_push_pointer(%9106) : (i64) -> ()
      %9110 = llvm.mlir.addressof @str1016 : !llvm.ptr
      %9111 = arith.constant 11 : i64
      %9112 = func.call @cc_make_string(%9110, %9111) : (!llvm.ptr, i64) -> i64
      %9113 = llvm.mlir.addressof @str1017 : !llvm.ptr
      %9114 = arith.constant 11 : i64
      %9115 = func.call @cc_make_string(%9113, %9114) : (!llvm.ptr, i64) -> i64
      %9116 = func.call @cc_intern(%9112, %9115) : (i64, i64) -> i64
      %9117 = func.call @cc_nil_value() : () -> i64
      %9118 = func.call @cc_cons(%9116, %9117) : (i64, i64) -> i64
      %9119 = func.call @cc_values_pack(%9118) : (i64) -> i64
      func.call @stack_push_pointer(%9116) : (i64) -> ()
      %9120 = llvm.mlir.addressof @str1018 : !llvm.ptr
      %9121 = arith.constant 11 : i64
      %9122 = func.call @cc_make_string(%9120, %9121) : (!llvm.ptr, i64) -> i64
      %9123 = llvm.mlir.addressof @str1019 : !llvm.ptr
      %9124 = arith.constant 11 : i64
      %9125 = func.call @cc_make_string(%9123, %9124) : (!llvm.ptr, i64) -> i64
      %9126 = func.call @cc_intern(%9122, %9125) : (i64, i64) -> i64
      %9127 = func.call @cc_nil_value() : () -> i64
      %9128 = func.call @cc_cons(%9126, %9127) : (i64, i64) -> i64
      %9129 = func.call @cc_values_pack(%9128) : (i64) -> i64
      func.call @stack_push_pointer(%9126) : (i64) -> ()
      %9130 = llvm.mlir.addressof @str1020 : !llvm.ptr
      %9131 = arith.constant 8 : i64
      %9132 = func.call @cc_make_string(%9130, %9131) : (!llvm.ptr, i64) -> i64
      %9133 = llvm.mlir.addressof @str1021 : !llvm.ptr
      %9134 = arith.constant 11 : i64
      %9135 = func.call @cc_make_string(%9133, %9134) : (!llvm.ptr, i64) -> i64
      %9136 = func.call @cc_intern(%9132, %9135) : (i64, i64) -> i64
      %9137 = func.call @cc_nil_value() : () -> i64
      %9138 = func.call @cc_cons(%9136, %9137) : (i64, i64) -> i64
      %9139 = func.call @cc_values_pack(%9138) : (i64) -> i64
      func.call @stack_push_pointer(%9136) : (i64) -> ()
      %9140 = llvm.mlir.addressof @str1022 : !llvm.ptr
      %9141 = arith.constant 8 : i64
      %9142 = func.call @cc_make_string(%9140, %9141) : (!llvm.ptr, i64) -> i64
      %9143 = llvm.mlir.addressof @str1023 : !llvm.ptr
      %9144 = arith.constant 11 : i64
      %9145 = func.call @cc_make_string(%9143, %9144) : (!llvm.ptr, i64) -> i64
      %9146 = func.call @cc_intern(%9142, %9145) : (i64, i64) -> i64
      %9147 = func.call @cc_nil_value() : () -> i64
      %9148 = func.call @cc_cons(%9146, %9147) : (i64, i64) -> i64
      %9149 = func.call @cc_values_pack(%9148) : (i64) -> i64
      func.call @stack_push_pointer(%9146) : (i64) -> ()
      %9150 = llvm.mlir.addressof @str1024 : !llvm.ptr
      %9151 = arith.constant 9 : i64
      %9152 = func.call @cc_make_string(%9150, %9151) : (!llvm.ptr, i64) -> i64
      %9153 = llvm.mlir.addressof @str1025 : !llvm.ptr
      %9154 = arith.constant 11 : i64
      %9155 = func.call @cc_make_string(%9153, %9154) : (!llvm.ptr, i64) -> i64
      %9156 = func.call @cc_intern(%9152, %9155) : (i64, i64) -> i64
      %9157 = func.call @cc_nil_value() : () -> i64
      %9158 = func.call @cc_cons(%9156, %9157) : (i64, i64) -> i64
      %9159 = func.call @cc_values_pack(%9158) : (i64) -> i64
      func.call @stack_push_pointer(%9156) : (i64) -> ()
      %9160 = llvm.mlir.addressof @str1026 : !llvm.ptr
      %9161 = arith.constant 9 : i64
      %9162 = func.call @cc_make_string(%9160, %9161) : (!llvm.ptr, i64) -> i64
      %9163 = llvm.mlir.addressof @str1027 : !llvm.ptr
      %9164 = arith.constant 11 : i64
      %9165 = func.call @cc_make_string(%9163, %9164) : (!llvm.ptr, i64) -> i64
      %9166 = func.call @cc_intern(%9162, %9165) : (i64, i64) -> i64
      %9167 = func.call @cc_nil_value() : () -> i64
      %9168 = func.call @cc_cons(%9166, %9167) : (i64, i64) -> i64
      %9169 = func.call @cc_values_pack(%9168) : (i64) -> i64
      func.call @stack_push_pointer(%9166) : (i64) -> ()
      %9170 = llvm.mlir.addressof @str1028 : !llvm.ptr
      %9171 = arith.constant 9 : i64
      %9172 = func.call @cc_make_string(%9170, %9171) : (!llvm.ptr, i64) -> i64
      %9173 = llvm.mlir.addressof @str1029 : !llvm.ptr
      %9174 = arith.constant 11 : i64
      %9175 = func.call @cc_make_string(%9173, %9174) : (!llvm.ptr, i64) -> i64
      %9176 = func.call @cc_intern(%9172, %9175) : (i64, i64) -> i64
      %9177 = func.call @cc_nil_value() : () -> i64
      %9178 = func.call @cc_cons(%9176, %9177) : (i64, i64) -> i64
      %9179 = func.call @cc_values_pack(%9178) : (i64) -> i64
      func.call @stack_push_pointer(%9176) : (i64) -> ()
      %9180 = llvm.mlir.addressof @str1030 : !llvm.ptr
      %9181 = arith.constant 10 : i64
      %9182 = func.call @cc_make_string(%9180, %9181) : (!llvm.ptr, i64) -> i64
      %9183 = llvm.mlir.addressof @str1031 : !llvm.ptr
      %9184 = arith.constant 11 : i64
      %9185 = func.call @cc_make_string(%9183, %9184) : (!llvm.ptr, i64) -> i64
      %9186 = func.call @cc_intern(%9182, %9185) : (i64, i64) -> i64
      %9187 = func.call @cc_nil_value() : () -> i64
      %9188 = func.call @cc_cons(%9186, %9187) : (i64, i64) -> i64
      %9189 = func.call @cc_values_pack(%9188) : (i64) -> i64
      func.call @stack_push_pointer(%9186) : (i64) -> ()
      %9190 = llvm.mlir.addressof @str1032 : !llvm.ptr
      %9191 = arith.constant 9 : i64
      %9192 = func.call @cc_make_string(%9190, %9191) : (!llvm.ptr, i64) -> i64
      %9193 = llvm.mlir.addressof @str1033 : !llvm.ptr
      %9194 = arith.constant 11 : i64
      %9195 = func.call @cc_make_string(%9193, %9194) : (!llvm.ptr, i64) -> i64
      %9196 = func.call @cc_intern(%9192, %9195) : (i64, i64) -> i64
      %9197 = func.call @cc_nil_value() : () -> i64
      %9198 = func.call @cc_cons(%9196, %9197) : (i64, i64) -> i64
      %9199 = func.call @cc_values_pack(%9198) : (i64) -> i64
      func.call @stack_push_pointer(%9196) : (i64) -> ()
      %9200 = llvm.mlir.addressof @str1034 : !llvm.ptr
      %9201 = arith.constant 10 : i64
      %9202 = func.call @cc_make_string(%9200, %9201) : (!llvm.ptr, i64) -> i64
      %9203 = llvm.mlir.addressof @str1035 : !llvm.ptr
      %9204 = arith.constant 11 : i64
      %9205 = func.call @cc_make_string(%9203, %9204) : (!llvm.ptr, i64) -> i64
      %9206 = func.call @cc_intern(%9202, %9205) : (i64, i64) -> i64
      %9207 = func.call @cc_nil_value() : () -> i64
      %9208 = func.call @cc_cons(%9206, %9207) : (i64, i64) -> i64
      %9209 = func.call @cc_values_pack(%9208) : (i64) -> i64
      func.call @stack_push_pointer(%9206) : (i64) -> ()
      %9210 = llvm.mlir.addressof @str1036 : !llvm.ptr
      %9211 = arith.constant 10 : i64
      %9212 = func.call @cc_make_string(%9210, %9211) : (!llvm.ptr, i64) -> i64
      %9213 = llvm.mlir.addressof @str1037 : !llvm.ptr
      %9214 = arith.constant 11 : i64
      %9215 = func.call @cc_make_string(%9213, %9214) : (!llvm.ptr, i64) -> i64
      %9216 = func.call @cc_intern(%9212, %9215) : (i64, i64) -> i64
      %9217 = func.call @cc_nil_value() : () -> i64
      %9218 = func.call @cc_cons(%9216, %9217) : (i64, i64) -> i64
      %9219 = func.call @cc_values_pack(%9218) : (i64) -> i64
      func.call @stack_push_pointer(%9216) : (i64) -> ()
      %9220 = llvm.mlir.addressof @str1038 : !llvm.ptr
      %9221 = arith.constant 9 : i64
      %9222 = func.call @cc_make_string(%9220, %9221) : (!llvm.ptr, i64) -> i64
      %9223 = llvm.mlir.addressof @str1039 : !llvm.ptr
      %9224 = arith.constant 11 : i64
      %9225 = func.call @cc_make_string(%9223, %9224) : (!llvm.ptr, i64) -> i64
      %9226 = func.call @cc_intern(%9222, %9225) : (i64, i64) -> i64
      %9227 = func.call @cc_nil_value() : () -> i64
      %9228 = func.call @cc_cons(%9226, %9227) : (i64, i64) -> i64
      %9229 = func.call @cc_values_pack(%9228) : (i64) -> i64
      func.call @stack_push_pointer(%9226) : (i64) -> ()
      %9230 = llvm.mlir.addressof @str1040 : !llvm.ptr
      %9231 = arith.constant 9 : i64
      %9232 = func.call @cc_make_string(%9230, %9231) : (!llvm.ptr, i64) -> i64
      %9233 = llvm.mlir.addressof @str1041 : !llvm.ptr
      %9234 = arith.constant 11 : i64
      %9235 = func.call @cc_make_string(%9233, %9234) : (!llvm.ptr, i64) -> i64
      %9236 = func.call @cc_intern(%9232, %9235) : (i64, i64) -> i64
      %9237 = func.call @cc_nil_value() : () -> i64
      %9238 = func.call @cc_cons(%9236, %9237) : (i64, i64) -> i64
      %9239 = func.call @cc_values_pack(%9238) : (i64) -> i64
      func.call @stack_push_pointer(%9236) : (i64) -> ()
      %9240 = llvm.mlir.addressof @str1042 : !llvm.ptr
      %9241 = arith.constant 7 : i64
      %9242 = func.call @cc_make_string(%9240, %9241) : (!llvm.ptr, i64) -> i64
      %9243 = llvm.mlir.addressof @str1043 : !llvm.ptr
      %9244 = arith.constant 11 : i64
      %9245 = func.call @cc_make_string(%9243, %9244) : (!llvm.ptr, i64) -> i64
      %9246 = func.call @cc_intern(%9242, %9245) : (i64, i64) -> i64
      %9247 = func.call @cc_nil_value() : () -> i64
      %9248 = func.call @cc_cons(%9246, %9247) : (i64, i64) -> i64
      %9249 = func.call @cc_values_pack(%9248) : (i64) -> i64
      func.call @stack_push_pointer(%9246) : (i64) -> ()
      %9250 = llvm.mlir.addressof @str1044 : !llvm.ptr
      %9251 = arith.constant 16 : i64
      %9252 = func.call @cc_make_string(%9250, %9251) : (!llvm.ptr, i64) -> i64
      %9253 = llvm.mlir.addressof @str1045 : !llvm.ptr
      %9254 = arith.constant 11 : i64
      %9255 = func.call @cc_make_string(%9253, %9254) : (!llvm.ptr, i64) -> i64
      %9256 = func.call @cc_intern(%9252, %9255) : (i64, i64) -> i64
      %9257 = func.call @cc_nil_value() : () -> i64
      %9258 = func.call @cc_cons(%9256, %9257) : (i64, i64) -> i64
      %9259 = func.call @cc_values_pack(%9258) : (i64) -> i64
      func.call @stack_push_pointer(%9256) : (i64) -> ()
      %9260 = llvm.mlir.addressof @str1046 : !llvm.ptr
      %9261 = arith.constant 14 : i64
      %9262 = func.call @cc_make_string(%9260, %9261) : (!llvm.ptr, i64) -> i64
      %9263 = llvm.mlir.addressof @str1047 : !llvm.ptr
      %9264 = arith.constant 11 : i64
      %9265 = func.call @cc_make_string(%9263, %9264) : (!llvm.ptr, i64) -> i64
      %9266 = func.call @cc_intern(%9262, %9265) : (i64, i64) -> i64
      %9267 = func.call @cc_nil_value() : () -> i64
      %9268 = func.call @cc_cons(%9266, %9267) : (i64, i64) -> i64
      %9269 = func.call @cc_values_pack(%9268) : (i64) -> i64
      func.call @stack_push_pointer(%9266) : (i64) -> ()
      %9270 = llvm.mlir.addressof @str1048 : !llvm.ptr
      %9271 = arith.constant 20 : i64
      %9272 = func.call @cc_make_string(%9270, %9271) : (!llvm.ptr, i64) -> i64
      %9273 = llvm.mlir.addressof @str1049 : !llvm.ptr
      %9274 = arith.constant 11 : i64
      %9275 = func.call @cc_make_string(%9273, %9274) : (!llvm.ptr, i64) -> i64
      %9276 = func.call @cc_intern(%9272, %9275) : (i64, i64) -> i64
      %9277 = func.call @cc_nil_value() : () -> i64
      %9278 = func.call @cc_cons(%9276, %9277) : (i64, i64) -> i64
      %9279 = func.call @cc_values_pack(%9278) : (i64) -> i64
      func.call @stack_push_pointer(%9276) : (i64) -> ()
      %9280 = llvm.mlir.addressof @str1050 : !llvm.ptr
      %9281 = arith.constant 10 : i64
      %9282 = func.call @cc_make_string(%9280, %9281) : (!llvm.ptr, i64) -> i64
      %9283 = llvm.mlir.addressof @str1051 : !llvm.ptr
      %9284 = arith.constant 11 : i64
      %9285 = func.call @cc_make_string(%9283, %9284) : (!llvm.ptr, i64) -> i64
      %9286 = func.call @cc_intern(%9282, %9285) : (i64, i64) -> i64
      %9287 = func.call @cc_nil_value() : () -> i64
      %9288 = func.call @cc_cons(%9286, %9287) : (i64, i64) -> i64
      %9289 = func.call @cc_values_pack(%9288) : (i64) -> i64
      func.call @stack_push_pointer(%9286) : (i64) -> ()
      %9290 = llvm.mlir.addressof @str1052 : !llvm.ptr
      %9291 = arith.constant 15 : i64
      %9292 = func.call @cc_make_string(%9290, %9291) : (!llvm.ptr, i64) -> i64
      %9293 = llvm.mlir.addressof @str1053 : !llvm.ptr
      %9294 = arith.constant 11 : i64
      %9295 = func.call @cc_make_string(%9293, %9294) : (!llvm.ptr, i64) -> i64
      %9296 = func.call @cc_intern(%9292, %9295) : (i64, i64) -> i64
      %9297 = func.call @cc_nil_value() : () -> i64
      %9298 = func.call @cc_cons(%9296, %9297) : (i64, i64) -> i64
      %9299 = func.call @cc_values_pack(%9298) : (i64) -> i64
      func.call @stack_push_pointer(%9296) : (i64) -> ()
      %9300 = llvm.mlir.addressof @str1054 : !llvm.ptr
      %9301 = arith.constant 5 : i64
      %9302 = func.call @cc_make_string(%9300, %9301) : (!llvm.ptr, i64) -> i64
      %9303 = llvm.mlir.addressof @str1055 : !llvm.ptr
      %9304 = arith.constant 11 : i64
      %9305 = func.call @cc_make_string(%9303, %9304) : (!llvm.ptr, i64) -> i64
      %9306 = func.call @cc_intern(%9302, %9305) : (i64, i64) -> i64
      %9307 = func.call @cc_nil_value() : () -> i64
      %9308 = func.call @cc_cons(%9306, %9307) : (i64, i64) -> i64
      %9309 = func.call @cc_values_pack(%9308) : (i64) -> i64
      func.call @stack_push_pointer(%9306) : (i64) -> ()
      %9310 = llvm.mlir.addressof @str1056 : !llvm.ptr
      %9311 = arith.constant 17 : i64
      %9312 = func.call @cc_make_string(%9310, %9311) : (!llvm.ptr, i64) -> i64
      %9313 = llvm.mlir.addressof @str1057 : !llvm.ptr
      %9314 = arith.constant 11 : i64
      %9315 = func.call @cc_make_string(%9313, %9314) : (!llvm.ptr, i64) -> i64
      %9316 = func.call @cc_intern(%9312, %9315) : (i64, i64) -> i64
      %9317 = func.call @cc_nil_value() : () -> i64
      %9318 = func.call @cc_cons(%9316, %9317) : (i64, i64) -> i64
      %9319 = func.call @cc_values_pack(%9318) : (i64) -> i64
      func.call @stack_push_pointer(%9316) : (i64) -> ()
      %9320 = llvm.mlir.addressof @str1058 : !llvm.ptr
      %9321 = arith.constant 17 : i64
      %9322 = func.call @cc_make_string(%9320, %9321) : (!llvm.ptr, i64) -> i64
      %9323 = llvm.mlir.addressof @str1059 : !llvm.ptr
      %9324 = arith.constant 11 : i64
      %9325 = func.call @cc_make_string(%9323, %9324) : (!llvm.ptr, i64) -> i64
      %9326 = func.call @cc_intern(%9322, %9325) : (i64, i64) -> i64
      %9327 = func.call @cc_nil_value() : () -> i64
      %9328 = func.call @cc_cons(%9326, %9327) : (i64, i64) -> i64
      %9329 = func.call @cc_values_pack(%9328) : (i64) -> i64
      func.call @stack_push_pointer(%9326) : (i64) -> ()
      %9330 = llvm.mlir.addressof @str1060 : !llvm.ptr
      %9331 = arith.constant 14 : i64
      %9332 = func.call @cc_make_string(%9330, %9331) : (!llvm.ptr, i64) -> i64
      %9333 = llvm.mlir.addressof @str1061 : !llvm.ptr
      %9334 = arith.constant 11 : i64
      %9335 = func.call @cc_make_string(%9333, %9334) : (!llvm.ptr, i64) -> i64
      %9336 = func.call @cc_intern(%9332, %9335) : (i64, i64) -> i64
      %9337 = func.call @cc_nil_value() : () -> i64
      %9338 = func.call @cc_cons(%9336, %9337) : (i64, i64) -> i64
      %9339 = func.call @cc_values_pack(%9338) : (i64) -> i64
      func.call @stack_push_pointer(%9336) : (i64) -> ()
      %9340 = llvm.mlir.addressof @str1062 : !llvm.ptr
      %9341 = arith.constant 19 : i64
      %9342 = func.call @cc_make_string(%9340, %9341) : (!llvm.ptr, i64) -> i64
      %9343 = llvm.mlir.addressof @str1063 : !llvm.ptr
      %9344 = arith.constant 11 : i64
      %9345 = func.call @cc_make_string(%9343, %9344) : (!llvm.ptr, i64) -> i64
      %9346 = func.call @cc_intern(%9342, %9345) : (i64, i64) -> i64
      %9347 = func.call @cc_nil_value() : () -> i64
      %9348 = func.call @cc_cons(%9346, %9347) : (i64, i64) -> i64
      %9349 = func.call @cc_values_pack(%9348) : (i64) -> i64
      func.call @stack_push_pointer(%9346) : (i64) -> ()
      %9350 = llvm.mlir.addressof @str1064 : !llvm.ptr
      %9351 = arith.constant 9 : i64
      %9352 = func.call @cc_make_string(%9350, %9351) : (!llvm.ptr, i64) -> i64
      %9353 = llvm.mlir.addressof @str1065 : !llvm.ptr
      %9354 = arith.constant 11 : i64
      %9355 = func.call @cc_make_string(%9353, %9354) : (!llvm.ptr, i64) -> i64
      %9356 = func.call @cc_intern(%9352, %9355) : (i64, i64) -> i64
      %9357 = func.call @cc_nil_value() : () -> i64
      %9358 = func.call @cc_cons(%9356, %9357) : (i64, i64) -> i64
      %9359 = func.call @cc_values_pack(%9358) : (i64) -> i64
      func.call @stack_push_pointer(%9356) : (i64) -> ()
      %9360 = llvm.mlir.addressof @str1066 : !llvm.ptr
      %9361 = arith.constant 13 : i64
      %9362 = func.call @cc_make_string(%9360, %9361) : (!llvm.ptr, i64) -> i64
      %9363 = llvm.mlir.addressof @str1067 : !llvm.ptr
      %9364 = arith.constant 11 : i64
      %9365 = func.call @cc_make_string(%9363, %9364) : (!llvm.ptr, i64) -> i64
      %9366 = func.call @cc_intern(%9362, %9365) : (i64, i64) -> i64
      %9367 = func.call @cc_nil_value() : () -> i64
      %9368 = func.call @cc_cons(%9366, %9367) : (i64, i64) -> i64
      %9369 = func.call @cc_values_pack(%9368) : (i64) -> i64
      func.call @stack_push_pointer(%9366) : (i64) -> ()
      %9370 = llvm.mlir.addressof @str1068 : !llvm.ptr
      %9371 = arith.constant 5 : i64
      %9372 = func.call @cc_make_string(%9370, %9371) : (!llvm.ptr, i64) -> i64
      %9373 = llvm.mlir.addressof @str1069 : !llvm.ptr
      %9374 = arith.constant 11 : i64
      %9375 = func.call @cc_make_string(%9373, %9374) : (!llvm.ptr, i64) -> i64
      %9376 = func.call @cc_intern(%9372, %9375) : (i64, i64) -> i64
      %9377 = func.call @cc_nil_value() : () -> i64
      %9378 = func.call @cc_cons(%9376, %9377) : (i64, i64) -> i64
      %9379 = func.call @cc_values_pack(%9378) : (i64) -> i64
      func.call @stack_push_pointer(%9376) : (i64) -> ()
      %9380 = llvm.mlir.addressof @str1070 : !llvm.ptr
      %9381 = arith.constant 11 : i64
      %9382 = func.call @cc_make_string(%9380, %9381) : (!llvm.ptr, i64) -> i64
      %9383 = llvm.mlir.addressof @str1071 : !llvm.ptr
      %9384 = arith.constant 11 : i64
      %9385 = func.call @cc_make_string(%9383, %9384) : (!llvm.ptr, i64) -> i64
      %9386 = func.call @cc_intern(%9382, %9385) : (i64, i64) -> i64
      %9387 = func.call @cc_nil_value() : () -> i64
      %9388 = func.call @cc_cons(%9386, %9387) : (i64, i64) -> i64
      %9389 = func.call @cc_values_pack(%9388) : (i64) -> i64
      func.call @stack_push_pointer(%9386) : (i64) -> ()
      %9390 = llvm.mlir.addressof @str1072 : !llvm.ptr
      %9391 = arith.constant 16 : i64
      %9392 = func.call @cc_make_string(%9390, %9391) : (!llvm.ptr, i64) -> i64
      %9393 = llvm.mlir.addressof @str1073 : !llvm.ptr
      %9394 = arith.constant 11 : i64
      %9395 = func.call @cc_make_string(%9393, %9394) : (!llvm.ptr, i64) -> i64
      %9396 = func.call @cc_intern(%9392, %9395) : (i64, i64) -> i64
      %9397 = func.call @cc_nil_value() : () -> i64
      %9398 = func.call @cc_cons(%9396, %9397) : (i64, i64) -> i64
      %9399 = func.call @cc_values_pack(%9398) : (i64) -> i64
      func.call @stack_push_pointer(%9396) : (i64) -> ()
      %9400 = llvm.mlir.addressof @str1074 : !llvm.ptr
      %9401 = arith.constant 12 : i64
      %9402 = func.call @cc_make_string(%9400, %9401) : (!llvm.ptr, i64) -> i64
      %9403 = llvm.mlir.addressof @str1075 : !llvm.ptr
      %9404 = arith.constant 11 : i64
      %9405 = func.call @cc_make_string(%9403, %9404) : (!llvm.ptr, i64) -> i64
      %9406 = func.call @cc_intern(%9402, %9405) : (i64, i64) -> i64
      %9407 = func.call @cc_nil_value() : () -> i64
      %9408 = func.call @cc_cons(%9406, %9407) : (i64, i64) -> i64
      %9409 = func.call @cc_values_pack(%9408) : (i64) -> i64
      func.call @stack_push_pointer(%9406) : (i64) -> ()
      %9410 = llvm.mlir.addressof @str1076 : !llvm.ptr
      %9411 = arith.constant 20 : i64
      %9412 = func.call @cc_make_string(%9410, %9411) : (!llvm.ptr, i64) -> i64
      %9413 = llvm.mlir.addressof @str1077 : !llvm.ptr
      %9414 = arith.constant 11 : i64
      %9415 = func.call @cc_make_string(%9413, %9414) : (!llvm.ptr, i64) -> i64
      %9416 = func.call @cc_intern(%9412, %9415) : (i64, i64) -> i64
      %9417 = func.call @cc_nil_value() : () -> i64
      %9418 = func.call @cc_cons(%9416, %9417) : (i64, i64) -> i64
      %9419 = func.call @cc_values_pack(%9418) : (i64) -> i64
      func.call @stack_push_pointer(%9416) : (i64) -> ()
      %9420 = llvm.mlir.addressof @str1078 : !llvm.ptr
      %9421 = arith.constant 29 : i64
      %9422 = func.call @cc_make_string(%9420, %9421) : (!llvm.ptr, i64) -> i64
      %9423 = llvm.mlir.addressof @str1079 : !llvm.ptr
      %9424 = arith.constant 11 : i64
      %9425 = func.call @cc_make_string(%9423, %9424) : (!llvm.ptr, i64) -> i64
      %9426 = func.call @cc_intern(%9422, %9425) : (i64, i64) -> i64
      %9427 = func.call @cc_nil_value() : () -> i64
      %9428 = func.call @cc_cons(%9426, %9427) : (i64, i64) -> i64
      %9429 = func.call @cc_values_pack(%9428) : (i64) -> i64
      func.call @stack_push_pointer(%9426) : (i64) -> ()
      %9430 = llvm.mlir.addressof @str1080 : !llvm.ptr
      %9431 = arith.constant 14 : i64
      %9432 = func.call @cc_make_string(%9430, %9431) : (!llvm.ptr, i64) -> i64
      %9433 = llvm.mlir.addressof @str1081 : !llvm.ptr
      %9434 = arith.constant 11 : i64
      %9435 = func.call @cc_make_string(%9433, %9434) : (!llvm.ptr, i64) -> i64
      %9436 = func.call @cc_intern(%9432, %9435) : (i64, i64) -> i64
      %9437 = func.call @cc_nil_value() : () -> i64
      %9438 = func.call @cc_cons(%9436, %9437) : (i64, i64) -> i64
      %9439 = func.call @cc_values_pack(%9438) : (i64) -> i64
      func.call @stack_push_pointer(%9436) : (i64) -> ()
      %9440 = llvm.mlir.addressof @str1082 : !llvm.ptr
      %9441 = arith.constant 11 : i64
      %9442 = func.call @cc_make_string(%9440, %9441) : (!llvm.ptr, i64) -> i64
      %9443 = llvm.mlir.addressof @str1083 : !llvm.ptr
      %9444 = arith.constant 11 : i64
      %9445 = func.call @cc_make_string(%9443, %9444) : (!llvm.ptr, i64) -> i64
      %9446 = func.call @cc_intern(%9442, %9445) : (i64, i64) -> i64
      %9447 = func.call @cc_nil_value() : () -> i64
      %9448 = func.call @cc_cons(%9446, %9447) : (i64, i64) -> i64
      %9449 = func.call @cc_values_pack(%9448) : (i64) -> i64
      func.call @stack_push_pointer(%9446) : (i64) -> ()
      %9450 = llvm.mlir.addressof @str1084 : !llvm.ptr
      %9451 = arith.constant 11 : i64
      %9452 = func.call @cc_make_string(%9450, %9451) : (!llvm.ptr, i64) -> i64
      %9453 = llvm.mlir.addressof @str1085 : !llvm.ptr
      %9454 = arith.constant 11 : i64
      %9455 = func.call @cc_make_string(%9453, %9454) : (!llvm.ptr, i64) -> i64
      %9456 = func.call @cc_intern(%9452, %9455) : (i64, i64) -> i64
      %9457 = func.call @cc_nil_value() : () -> i64
      %9458 = func.call @cc_cons(%9456, %9457) : (i64, i64) -> i64
      %9459 = func.call @cc_values_pack(%9458) : (i64) -> i64
      func.call @stack_push_pointer(%9456) : (i64) -> ()
      %9460 = llvm.mlir.addressof @str1086 : !llvm.ptr
      %9461 = arith.constant 13 : i64
      %9462 = func.call @cc_make_string(%9460, %9461) : (!llvm.ptr, i64) -> i64
      %9463 = llvm.mlir.addressof @str1087 : !llvm.ptr
      %9464 = arith.constant 11 : i64
      %9465 = func.call @cc_make_string(%9463, %9464) : (!llvm.ptr, i64) -> i64
      %9466 = func.call @cc_intern(%9462, %9465) : (i64, i64) -> i64
      %9467 = func.call @cc_nil_value() : () -> i64
      %9468 = func.call @cc_cons(%9466, %9467) : (i64, i64) -> i64
      %9469 = func.call @cc_values_pack(%9468) : (i64) -> i64
      func.call @stack_push_pointer(%9466) : (i64) -> ()
      %9470 = llvm.mlir.addressof @str1088 : !llvm.ptr
      %9471 = arith.constant 10 : i64
      %9472 = func.call @cc_make_string(%9470, %9471) : (!llvm.ptr, i64) -> i64
      %9473 = llvm.mlir.addressof @str1089 : !llvm.ptr
      %9474 = arith.constant 11 : i64
      %9475 = func.call @cc_make_string(%9473, %9474) : (!llvm.ptr, i64) -> i64
      %9476 = func.call @cc_intern(%9472, %9475) : (i64, i64) -> i64
      %9477 = func.call @cc_nil_value() : () -> i64
      %9478 = func.call @cc_cons(%9476, %9477) : (i64, i64) -> i64
      %9479 = func.call @cc_values_pack(%9478) : (i64) -> i64
      func.call @stack_push_pointer(%9476) : (i64) -> ()
      %9480 = llvm.mlir.addressof @str1090 : !llvm.ptr
      %9481 = arith.constant 11 : i64
      %9482 = func.call @cc_make_string(%9480, %9481) : (!llvm.ptr, i64) -> i64
      %9483 = llvm.mlir.addressof @str1091 : !llvm.ptr
      %9484 = arith.constant 11 : i64
      %9485 = func.call @cc_make_string(%9483, %9484) : (!llvm.ptr, i64) -> i64
      %9486 = func.call @cc_intern(%9482, %9485) : (i64, i64) -> i64
      %9487 = func.call @cc_nil_value() : () -> i64
      %9488 = func.call @cc_cons(%9486, %9487) : (i64, i64) -> i64
      %9489 = func.call @cc_values_pack(%9488) : (i64) -> i64
      func.call @stack_push_pointer(%9486) : (i64) -> ()
      %9490 = llvm.mlir.addressof @str1092 : !llvm.ptr
      %9491 = arith.constant 6 : i64
      %9492 = func.call @cc_make_string(%9490, %9491) : (!llvm.ptr, i64) -> i64
      %9493 = llvm.mlir.addressof @str1093 : !llvm.ptr
      %9494 = arith.constant 11 : i64
      %9495 = func.call @cc_make_string(%9493, %9494) : (!llvm.ptr, i64) -> i64
      %9496 = func.call @cc_intern(%9492, %9495) : (i64, i64) -> i64
      %9497 = func.call @cc_nil_value() : () -> i64
      %9498 = func.call @cc_cons(%9496, %9497) : (i64, i64) -> i64
      %9499 = func.call @cc_values_pack(%9498) : (i64) -> i64
      func.call @stack_push_pointer(%9496) : (i64) -> ()
      %9500 = llvm.mlir.addressof @str1094 : !llvm.ptr
      %9501 = arith.constant 22 : i64
      %9502 = func.call @cc_make_string(%9500, %9501) : (!llvm.ptr, i64) -> i64
      %9503 = llvm.mlir.addressof @str1095 : !llvm.ptr
      %9504 = arith.constant 11 : i64
      %9505 = func.call @cc_make_string(%9503, %9504) : (!llvm.ptr, i64) -> i64
      %9506 = func.call @cc_intern(%9502, %9505) : (i64, i64) -> i64
      %9507 = func.call @cc_nil_value() : () -> i64
      %9508 = func.call @cc_cons(%9506, %9507) : (i64, i64) -> i64
      %9509 = func.call @cc_values_pack(%9508) : (i64) -> i64
      func.call @stack_push_pointer(%9506) : (i64) -> ()
      %9510 = llvm.mlir.addressof @str1096 : !llvm.ptr
      %9511 = arith.constant 32 : i64
      %9512 = func.call @cc_make_string(%9510, %9511) : (!llvm.ptr, i64) -> i64
      %9513 = llvm.mlir.addressof @str1097 : !llvm.ptr
      %9514 = arith.constant 11 : i64
      %9515 = func.call @cc_make_string(%9513, %9514) : (!llvm.ptr, i64) -> i64
      %9516 = func.call @cc_intern(%9512, %9515) : (i64, i64) -> i64
      %9517 = func.call @cc_nil_value() : () -> i64
      %9518 = func.call @cc_cons(%9516, %9517) : (i64, i64) -> i64
      %9519 = func.call @cc_values_pack(%9518) : (i64) -> i64
      func.call @stack_push_pointer(%9516) : (i64) -> ()
      %9520 = llvm.mlir.addressof @str1098 : !llvm.ptr
      %9521 = arith.constant 23 : i64
      %9522 = func.call @cc_make_string(%9520, %9521) : (!llvm.ptr, i64) -> i64
      %9523 = llvm.mlir.addressof @str1099 : !llvm.ptr
      %9524 = arith.constant 11 : i64
      %9525 = func.call @cc_make_string(%9523, %9524) : (!llvm.ptr, i64) -> i64
      %9526 = func.call @cc_intern(%9522, %9525) : (i64, i64) -> i64
      %9527 = func.call @cc_nil_value() : () -> i64
      %9528 = func.call @cc_cons(%9526, %9527) : (i64, i64) -> i64
      %9529 = func.call @cc_values_pack(%9528) : (i64) -> i64
      func.call @stack_push_pointer(%9526) : (i64) -> ()
      %9530 = llvm.mlir.addressof @str1100 : !llvm.ptr
      %9531 = arith.constant 24 : i64
      %9532 = func.call @cc_make_string(%9530, %9531) : (!llvm.ptr, i64) -> i64
      %9533 = llvm.mlir.addressof @str1101 : !llvm.ptr
      %9534 = arith.constant 11 : i64
      %9535 = func.call @cc_make_string(%9533, %9534) : (!llvm.ptr, i64) -> i64
      %9536 = func.call @cc_intern(%9532, %9535) : (i64, i64) -> i64
      %9537 = func.call @cc_nil_value() : () -> i64
      %9538 = func.call @cc_cons(%9536, %9537) : (i64, i64) -> i64
      %9539 = func.call @cc_values_pack(%9538) : (i64) -> i64
      func.call @stack_push_pointer(%9536) : (i64) -> ()
      %9540 = llvm.mlir.addressof @str1102 : !llvm.ptr
      %9541 = arith.constant 5 : i64
      %9542 = func.call @cc_make_string(%9540, %9541) : (!llvm.ptr, i64) -> i64
      %9543 = llvm.mlir.addressof @str1103 : !llvm.ptr
      %9544 = arith.constant 11 : i64
      %9545 = func.call @cc_make_string(%9543, %9544) : (!llvm.ptr, i64) -> i64
      %9546 = func.call @cc_intern(%9542, %9545) : (i64, i64) -> i64
      %9547 = func.call @cc_nil_value() : () -> i64
      %9548 = func.call @cc_cons(%9546, %9547) : (i64, i64) -> i64
      %9549 = func.call @cc_values_pack(%9548) : (i64) -> i64
      func.call @stack_push_pointer(%9546) : (i64) -> ()
      %9550 = llvm.mlir.addressof @str1104 : !llvm.ptr
      %9551 = arith.constant 16 : i64
      %9552 = func.call @cc_make_string(%9550, %9551) : (!llvm.ptr, i64) -> i64
      %9553 = llvm.mlir.addressof @str1105 : !llvm.ptr
      %9554 = arith.constant 11 : i64
      %9555 = func.call @cc_make_string(%9553, %9554) : (!llvm.ptr, i64) -> i64
      %9556 = func.call @cc_intern(%9552, %9555) : (i64, i64) -> i64
      %9557 = func.call @cc_nil_value() : () -> i64
      %9558 = func.call @cc_cons(%9556, %9557) : (i64, i64) -> i64
      %9559 = func.call @cc_values_pack(%9558) : (i64) -> i64
      func.call @stack_push_pointer(%9556) : (i64) -> ()
      %9560 = llvm.mlir.addressof @str1106 : !llvm.ptr
      %9561 = arith.constant 10 : i64
      %9562 = func.call @cc_make_string(%9560, %9561) : (!llvm.ptr, i64) -> i64
      %9563 = llvm.mlir.addressof @str1107 : !llvm.ptr
      %9564 = arith.constant 11 : i64
      %9565 = func.call @cc_make_string(%9563, %9564) : (!llvm.ptr, i64) -> i64
      %9566 = func.call @cc_intern(%9562, %9565) : (i64, i64) -> i64
      %9567 = func.call @cc_nil_value() : () -> i64
      %9568 = func.call @cc_cons(%9566, %9567) : (i64, i64) -> i64
      %9569 = func.call @cc_values_pack(%9568) : (i64) -> i64
      func.call @stack_push_pointer(%9566) : (i64) -> ()
      %9570 = llvm.mlir.addressof @str1108 : !llvm.ptr
      %9571 = arith.constant 9 : i64
      %9572 = func.call @cc_make_string(%9570, %9571) : (!llvm.ptr, i64) -> i64
      %9573 = llvm.mlir.addressof @str1109 : !llvm.ptr
      %9574 = arith.constant 11 : i64
      %9575 = func.call @cc_make_string(%9573, %9574) : (!llvm.ptr, i64) -> i64
      %9576 = func.call @cc_intern(%9572, %9575) : (i64, i64) -> i64
      %9577 = func.call @cc_nil_value() : () -> i64
      %9578 = func.call @cc_cons(%9576, %9577) : (i64, i64) -> i64
      %9579 = func.call @cc_values_pack(%9578) : (i64) -> i64
      func.call @stack_push_pointer(%9576) : (i64) -> ()
      %9580 = llvm.mlir.addressof @str1110 : !llvm.ptr
      %9581 = arith.constant 6 : i64
      %9582 = func.call @cc_make_string(%9580, %9581) : (!llvm.ptr, i64) -> i64
      %9583 = llvm.mlir.addressof @str1111 : !llvm.ptr
      %9584 = arith.constant 11 : i64
      %9585 = func.call @cc_make_string(%9583, %9584) : (!llvm.ptr, i64) -> i64
      %9586 = func.call @cc_intern(%9582, %9585) : (i64, i64) -> i64
      %9587 = func.call @cc_nil_value() : () -> i64
      %9588 = func.call @cc_cons(%9586, %9587) : (i64, i64) -> i64
      %9589 = func.call @cc_values_pack(%9588) : (i64) -> i64
      func.call @stack_push_pointer(%9586) : (i64) -> ()
      %9590 = llvm.mlir.addressof @str1112 : !llvm.ptr
      %9591 = arith.constant 6 : i64
      %9592 = func.call @cc_make_string(%9590, %9591) : (!llvm.ptr, i64) -> i64
      %9593 = llvm.mlir.addressof @str1113 : !llvm.ptr
      %9594 = arith.constant 11 : i64
      %9595 = func.call @cc_make_string(%9593, %9594) : (!llvm.ptr, i64) -> i64
      %9596 = func.call @cc_intern(%9592, %9595) : (i64, i64) -> i64
      %9597 = func.call @cc_nil_value() : () -> i64
      %9598 = func.call @cc_cons(%9596, %9597) : (i64, i64) -> i64
      %9599 = func.call @cc_values_pack(%9598) : (i64) -> i64
      func.call @stack_push_pointer(%9596) : (i64) -> ()
      %9600 = llvm.mlir.addressof @str1114 : !llvm.ptr
      %9601 = arith.constant 7 : i64
      %9602 = func.call @cc_make_string(%9600, %9601) : (!llvm.ptr, i64) -> i64
      %9603 = llvm.mlir.addressof @str1115 : !llvm.ptr
      %9604 = arith.constant 11 : i64
      %9605 = func.call @cc_make_string(%9603, %9604) : (!llvm.ptr, i64) -> i64
      %9606 = func.call @cc_intern(%9602, %9605) : (i64, i64) -> i64
      %9607 = func.call @cc_nil_value() : () -> i64
      %9608 = func.call @cc_cons(%9606, %9607) : (i64, i64) -> i64
      %9609 = func.call @cc_values_pack(%9608) : (i64) -> i64
      func.call @stack_push_pointer(%9606) : (i64) -> ()
      %9610 = llvm.mlir.addressof @str1116 : !llvm.ptr
      %9611 = arith.constant 30 : i64
      %9612 = func.call @cc_make_string(%9610, %9611) : (!llvm.ptr, i64) -> i64
      %9613 = llvm.mlir.addressof @str1117 : !llvm.ptr
      %9614 = arith.constant 11 : i64
      %9615 = func.call @cc_make_string(%9613, %9614) : (!llvm.ptr, i64) -> i64
      %9616 = func.call @cc_intern(%9612, %9615) : (i64, i64) -> i64
      %9617 = func.call @cc_nil_value() : () -> i64
      %9618 = func.call @cc_cons(%9616, %9617) : (i64, i64) -> i64
      %9619 = func.call @cc_values_pack(%9618) : (i64) -> i64
      func.call @stack_push_pointer(%9616) : (i64) -> ()
      %9620 = llvm.mlir.addressof @str1118 : !llvm.ptr
      %9621 = arith.constant 7 : i64
      %9622 = func.call @cc_make_string(%9620, %9621) : (!llvm.ptr, i64) -> i64
      %9623 = llvm.mlir.addressof @str1119 : !llvm.ptr
      %9624 = arith.constant 11 : i64
      %9625 = func.call @cc_make_string(%9623, %9624) : (!llvm.ptr, i64) -> i64
      %9626 = func.call @cc_intern(%9622, %9625) : (i64, i64) -> i64
      %9627 = func.call @cc_nil_value() : () -> i64
      %9628 = func.call @cc_cons(%9626, %9627) : (i64, i64) -> i64
      %9629 = func.call @cc_values_pack(%9628) : (i64) -> i64
      func.call @stack_push_pointer(%9626) : (i64) -> ()
      %9630 = llvm.mlir.addressof @str1120 : !llvm.ptr
      %9631 = arith.constant 20 : i64
      %9632 = func.call @cc_make_string(%9630, %9631) : (!llvm.ptr, i64) -> i64
      %9633 = llvm.mlir.addressof @str1121 : !llvm.ptr
      %9634 = arith.constant 11 : i64
      %9635 = func.call @cc_make_string(%9633, %9634) : (!llvm.ptr, i64) -> i64
      %9636 = func.call @cc_intern(%9632, %9635) : (i64, i64) -> i64
      %9637 = func.call @cc_nil_value() : () -> i64
      %9638 = func.call @cc_cons(%9636, %9637) : (i64, i64) -> i64
      %9639 = func.call @cc_values_pack(%9638) : (i64) -> i64
      func.call @stack_push_pointer(%9636) : (i64) -> ()
      %9640 = llvm.mlir.addressof @str1122 : !llvm.ptr
      %9641 = arith.constant 23 : i64
      %9642 = func.call @cc_make_string(%9640, %9641) : (!llvm.ptr, i64) -> i64
      %9643 = llvm.mlir.addressof @str1123 : !llvm.ptr
      %9644 = arith.constant 11 : i64
      %9645 = func.call @cc_make_string(%9643, %9644) : (!llvm.ptr, i64) -> i64
      %9646 = func.call @cc_intern(%9642, %9645) : (i64, i64) -> i64
      %9647 = func.call @cc_nil_value() : () -> i64
      %9648 = func.call @cc_cons(%9646, %9647) : (i64, i64) -> i64
      %9649 = func.call @cc_values_pack(%9648) : (i64) -> i64
      func.call @stack_push_pointer(%9646) : (i64) -> ()
      %9650 = llvm.mlir.addressof @str1124 : !llvm.ptr
      %9651 = arith.constant 27 : i64
      %9652 = func.call @cc_make_string(%9650, %9651) : (!llvm.ptr, i64) -> i64
      %9653 = llvm.mlir.addressof @str1125 : !llvm.ptr
      %9654 = arith.constant 11 : i64
      %9655 = func.call @cc_make_string(%9653, %9654) : (!llvm.ptr, i64) -> i64
      %9656 = func.call @cc_intern(%9652, %9655) : (i64, i64) -> i64
      %9657 = func.call @cc_nil_value() : () -> i64
      %9658 = func.call @cc_cons(%9656, %9657) : (i64, i64) -> i64
      %9659 = func.call @cc_values_pack(%9658) : (i64) -> i64
      func.call @stack_push_pointer(%9656) : (i64) -> ()
      %9660 = llvm.mlir.addressof @str1126 : !llvm.ptr
      %9661 = arith.constant 25 : i64
      %9662 = func.call @cc_make_string(%9660, %9661) : (!llvm.ptr, i64) -> i64
      %9663 = llvm.mlir.addressof @str1127 : !llvm.ptr
      %9664 = arith.constant 11 : i64
      %9665 = func.call @cc_make_string(%9663, %9664) : (!llvm.ptr, i64) -> i64
      %9666 = func.call @cc_intern(%9662, %9665) : (i64, i64) -> i64
      %9667 = func.call @cc_nil_value() : () -> i64
      %9668 = func.call @cc_cons(%9666, %9667) : (i64, i64) -> i64
      %9669 = func.call @cc_values_pack(%9668) : (i64) -> i64
      func.call @stack_push_pointer(%9666) : (i64) -> ()
      %9670 = llvm.mlir.addressof @str1128 : !llvm.ptr
      %9671 = arith.constant 38 : i64
      %9672 = func.call @cc_make_string(%9670, %9671) : (!llvm.ptr, i64) -> i64
      %9673 = llvm.mlir.addressof @str1129 : !llvm.ptr
      %9674 = arith.constant 11 : i64
      %9675 = func.call @cc_make_string(%9673, %9674) : (!llvm.ptr, i64) -> i64
      %9676 = func.call @cc_intern(%9672, %9675) : (i64, i64) -> i64
      %9677 = func.call @cc_nil_value() : () -> i64
      %9678 = func.call @cc_cons(%9676, %9677) : (i64, i64) -> i64
      %9679 = func.call @cc_values_pack(%9678) : (i64) -> i64
      func.call @stack_push_pointer(%9676) : (i64) -> ()
      %9680 = llvm.mlir.addressof @str1130 : !llvm.ptr
      %9681 = arith.constant 36 : i64
      %9682 = func.call @cc_make_string(%9680, %9681) : (!llvm.ptr, i64) -> i64
      %9683 = llvm.mlir.addressof @str1131 : !llvm.ptr
      %9684 = arith.constant 11 : i64
      %9685 = func.call @cc_make_string(%9683, %9684) : (!llvm.ptr, i64) -> i64
      %9686 = func.call @cc_intern(%9682, %9685) : (i64, i64) -> i64
      %9687 = func.call @cc_nil_value() : () -> i64
      %9688 = func.call @cc_cons(%9686, %9687) : (i64, i64) -> i64
      %9689 = func.call @cc_values_pack(%9688) : (i64) -> i64
      func.call @stack_push_pointer(%9686) : (i64) -> ()
      %9690 = llvm.mlir.addressof @str1132 : !llvm.ptr
      %9691 = arith.constant 37 : i64
      %9692 = func.call @cc_make_string(%9690, %9691) : (!llvm.ptr, i64) -> i64
      %9693 = llvm.mlir.addressof @str1133 : !llvm.ptr
      %9694 = arith.constant 11 : i64
      %9695 = func.call @cc_make_string(%9693, %9694) : (!llvm.ptr, i64) -> i64
      %9696 = func.call @cc_intern(%9692, %9695) : (i64, i64) -> i64
      %9697 = func.call @cc_nil_value() : () -> i64
      %9698 = func.call @cc_cons(%9696, %9697) : (i64, i64) -> i64
      %9699 = func.call @cc_values_pack(%9698) : (i64) -> i64
      func.call @stack_push_pointer(%9696) : (i64) -> ()
      %9700 = llvm.mlir.addressof @str1134 : !llvm.ptr
      %9701 = arith.constant 38 : i64
      %9702 = func.call @cc_make_string(%9700, %9701) : (!llvm.ptr, i64) -> i64
      %9703 = llvm.mlir.addressof @str1135 : !llvm.ptr
      %9704 = arith.constant 11 : i64
      %9705 = func.call @cc_make_string(%9703, %9704) : (!llvm.ptr, i64) -> i64
      %9706 = func.call @cc_intern(%9702, %9705) : (i64, i64) -> i64
      %9707 = func.call @cc_nil_value() : () -> i64
      %9708 = func.call @cc_cons(%9706, %9707) : (i64, i64) -> i64
      %9709 = func.call @cc_values_pack(%9708) : (i64) -> i64
      func.call @stack_push_pointer(%9706) : (i64) -> ()
      %9710 = llvm.mlir.addressof @str1136 : !llvm.ptr
      %9711 = arith.constant 26 : i64
      %9712 = func.call @cc_make_string(%9710, %9711) : (!llvm.ptr, i64) -> i64
      %9713 = llvm.mlir.addressof @str1137 : !llvm.ptr
      %9714 = arith.constant 11 : i64
      %9715 = func.call @cc_make_string(%9713, %9714) : (!llvm.ptr, i64) -> i64
      %9716 = func.call @cc_intern(%9712, %9715) : (i64, i64) -> i64
      %9717 = func.call @cc_nil_value() : () -> i64
      %9718 = func.call @cc_cons(%9716, %9717) : (i64, i64) -> i64
      %9719 = func.call @cc_values_pack(%9718) : (i64) -> i64
      func.call @stack_push_pointer(%9716) : (i64) -> ()
      %9720 = llvm.mlir.addressof @str1138 : !llvm.ptr
      %9721 = arith.constant 27 : i64
      %9722 = func.call @cc_make_string(%9720, %9721) : (!llvm.ptr, i64) -> i64
      %9723 = llvm.mlir.addressof @str1139 : !llvm.ptr
      %9724 = arith.constant 11 : i64
      %9725 = func.call @cc_make_string(%9723, %9724) : (!llvm.ptr, i64) -> i64
      %9726 = func.call @cc_intern(%9722, %9725) : (i64, i64) -> i64
      %9727 = func.call @cc_nil_value() : () -> i64
      %9728 = func.call @cc_cons(%9726, %9727) : (i64, i64) -> i64
      %9729 = func.call @cc_values_pack(%9728) : (i64) -> i64
      func.call @stack_push_pointer(%9726) : (i64) -> ()
      %9730 = llvm.mlir.addressof @str1140 : !llvm.ptr
      %9731 = arith.constant 27 : i64
      %9732 = func.call @cc_make_string(%9730, %9731) : (!llvm.ptr, i64) -> i64
      %9733 = llvm.mlir.addressof @str1141 : !llvm.ptr
      %9734 = arith.constant 11 : i64
      %9735 = func.call @cc_make_string(%9733, %9734) : (!llvm.ptr, i64) -> i64
      %9736 = func.call @cc_intern(%9732, %9735) : (i64, i64) -> i64
      %9737 = func.call @cc_nil_value() : () -> i64
      %9738 = func.call @cc_cons(%9736, %9737) : (i64, i64) -> i64
      %9739 = func.call @cc_values_pack(%9738) : (i64) -> i64
      func.call @stack_push_pointer(%9736) : (i64) -> ()
      %9740 = llvm.mlir.addressof @str1142 : !llvm.ptr
      %9741 = arith.constant 25 : i64
      %9742 = func.call @cc_make_string(%9740, %9741) : (!llvm.ptr, i64) -> i64
      %9743 = llvm.mlir.addressof @str1143 : !llvm.ptr
      %9744 = arith.constant 11 : i64
      %9745 = func.call @cc_make_string(%9743, %9744) : (!llvm.ptr, i64) -> i64
      %9746 = func.call @cc_intern(%9742, %9745) : (i64, i64) -> i64
      %9747 = func.call @cc_nil_value() : () -> i64
      %9748 = func.call @cc_cons(%9746, %9747) : (i64, i64) -> i64
      %9749 = func.call @cc_values_pack(%9748) : (i64) -> i64
      func.call @stack_push_pointer(%9746) : (i64) -> ()
      %9750 = llvm.mlir.addressof @str1144 : !llvm.ptr
      %9751 = arith.constant 38 : i64
      %9752 = func.call @cc_make_string(%9750, %9751) : (!llvm.ptr, i64) -> i64
      %9753 = llvm.mlir.addressof @str1145 : !llvm.ptr
      %9754 = arith.constant 11 : i64
      %9755 = func.call @cc_make_string(%9753, %9754) : (!llvm.ptr, i64) -> i64
      %9756 = func.call @cc_intern(%9752, %9755) : (i64, i64) -> i64
      %9757 = func.call @cc_nil_value() : () -> i64
      %9758 = func.call @cc_cons(%9756, %9757) : (i64, i64) -> i64
      %9759 = func.call @cc_values_pack(%9758) : (i64) -> i64
      func.call @stack_push_pointer(%9756) : (i64) -> ()
      %9760 = llvm.mlir.addressof @str1146 : !llvm.ptr
      %9761 = arith.constant 36 : i64
      %9762 = func.call @cc_make_string(%9760, %9761) : (!llvm.ptr, i64) -> i64
      %9763 = llvm.mlir.addressof @str1147 : !llvm.ptr
      %9764 = arith.constant 11 : i64
      %9765 = func.call @cc_make_string(%9763, %9764) : (!llvm.ptr, i64) -> i64
      %9766 = func.call @cc_intern(%9762, %9765) : (i64, i64) -> i64
      %9767 = func.call @cc_nil_value() : () -> i64
      %9768 = func.call @cc_cons(%9766, %9767) : (i64, i64) -> i64
      %9769 = func.call @cc_values_pack(%9768) : (i64) -> i64
      func.call @stack_push_pointer(%9766) : (i64) -> ()
      %9770 = llvm.mlir.addressof @str1148 : !llvm.ptr
      %9771 = arith.constant 37 : i64
      %9772 = func.call @cc_make_string(%9770, %9771) : (!llvm.ptr, i64) -> i64
      %9773 = llvm.mlir.addressof @str1149 : !llvm.ptr
      %9774 = arith.constant 11 : i64
      %9775 = func.call @cc_make_string(%9773, %9774) : (!llvm.ptr, i64) -> i64
      %9776 = func.call @cc_intern(%9772, %9775) : (i64, i64) -> i64
      %9777 = func.call @cc_nil_value() : () -> i64
      %9778 = func.call @cc_cons(%9776, %9777) : (i64, i64) -> i64
      %9779 = func.call @cc_values_pack(%9778) : (i64) -> i64
      func.call @stack_push_pointer(%9776) : (i64) -> ()
      %9780 = llvm.mlir.addressof @str1150 : !llvm.ptr
      %9781 = arith.constant 38 : i64
      %9782 = func.call @cc_make_string(%9780, %9781) : (!llvm.ptr, i64) -> i64
      %9783 = llvm.mlir.addressof @str1151 : !llvm.ptr
      %9784 = arith.constant 11 : i64
      %9785 = func.call @cc_make_string(%9783, %9784) : (!llvm.ptr, i64) -> i64
      %9786 = func.call @cc_intern(%9782, %9785) : (i64, i64) -> i64
      %9787 = func.call @cc_nil_value() : () -> i64
      %9788 = func.call @cc_cons(%9786, %9787) : (i64, i64) -> i64
      %9789 = func.call @cc_values_pack(%9788) : (i64) -> i64
      func.call @stack_push_pointer(%9786) : (i64) -> ()
      %9790 = llvm.mlir.addressof @str1152 : !llvm.ptr
      %9791 = arith.constant 26 : i64
      %9792 = func.call @cc_make_string(%9790, %9791) : (!llvm.ptr, i64) -> i64
      %9793 = llvm.mlir.addressof @str1153 : !llvm.ptr
      %9794 = arith.constant 11 : i64
      %9795 = func.call @cc_make_string(%9793, %9794) : (!llvm.ptr, i64) -> i64
      %9796 = func.call @cc_intern(%9792, %9795) : (i64, i64) -> i64
      %9797 = func.call @cc_nil_value() : () -> i64
      %9798 = func.call @cc_cons(%9796, %9797) : (i64, i64) -> i64
      %9799 = func.call @cc_values_pack(%9798) : (i64) -> i64
      func.call @stack_push_pointer(%9796) : (i64) -> ()
      %9800 = llvm.mlir.addressof @str1154 : !llvm.ptr
      %9801 = arith.constant 27 : i64
      %9802 = func.call @cc_make_string(%9800, %9801) : (!llvm.ptr, i64) -> i64
      %9803 = llvm.mlir.addressof @str1155 : !llvm.ptr
      %9804 = arith.constant 11 : i64
      %9805 = func.call @cc_make_string(%9803, %9804) : (!llvm.ptr, i64) -> i64
      %9806 = func.call @cc_intern(%9802, %9805) : (i64, i64) -> i64
      %9807 = func.call @cc_nil_value() : () -> i64
      %9808 = func.call @cc_cons(%9806, %9807) : (i64, i64) -> i64
      %9809 = func.call @cc_values_pack(%9808) : (i64) -> i64
      func.call @stack_push_pointer(%9806) : (i64) -> ()
      %9810 = llvm.mlir.addressof @str1156 : !llvm.ptr
      %9811 = arith.constant 10 : i64
      %9812 = func.call @cc_make_string(%9810, %9811) : (!llvm.ptr, i64) -> i64
      %9813 = llvm.mlir.addressof @str1157 : !llvm.ptr
      %9814 = arith.constant 11 : i64
      %9815 = func.call @cc_make_string(%9813, %9814) : (!llvm.ptr, i64) -> i64
      %9816 = func.call @cc_intern(%9812, %9815) : (i64, i64) -> i64
      %9817 = func.call @cc_nil_value() : () -> i64
      %9818 = func.call @cc_cons(%9816, %9817) : (i64, i64) -> i64
      %9819 = func.call @cc_values_pack(%9818) : (i64) -> i64
      func.call @stack_push_pointer(%9816) : (i64) -> ()
      %9820 = llvm.mlir.addressof @str1158 : !llvm.ptr
      %9821 = arith.constant 18 : i64
      %9822 = func.call @cc_make_string(%9820, %9821) : (!llvm.ptr, i64) -> i64
      %9823 = llvm.mlir.addressof @str1159 : !llvm.ptr
      %9824 = arith.constant 11 : i64
      %9825 = func.call @cc_make_string(%9823, %9824) : (!llvm.ptr, i64) -> i64
      %9826 = func.call @cc_intern(%9822, %9825) : (i64, i64) -> i64
      %9827 = func.call @cc_nil_value() : () -> i64
      %9828 = func.call @cc_cons(%9826, %9827) : (i64, i64) -> i64
      %9829 = func.call @cc_values_pack(%9828) : (i64) -> i64
      func.call @stack_push_pointer(%9826) : (i64) -> ()
      %9830 = llvm.mlir.addressof @str1160 : !llvm.ptr
      %9831 = arith.constant 27 : i64
      %9832 = func.call @cc_make_string(%9830, %9831) : (!llvm.ptr, i64) -> i64
      %9833 = llvm.mlir.addressof @str1161 : !llvm.ptr
      %9834 = arith.constant 11 : i64
      %9835 = func.call @cc_make_string(%9833, %9834) : (!llvm.ptr, i64) -> i64
      %9836 = func.call @cc_intern(%9832, %9835) : (i64, i64) -> i64
      %9837 = func.call @cc_nil_value() : () -> i64
      %9838 = func.call @cc_cons(%9836, %9837) : (i64, i64) -> i64
      %9839 = func.call @cc_values_pack(%9838) : (i64) -> i64
      func.call @stack_push_pointer(%9836) : (i64) -> ()
      %9840 = llvm.mlir.addressof @str1162 : !llvm.ptr
      %9841 = arith.constant 6 : i64
      %9842 = func.call @cc_make_string(%9840, %9841) : (!llvm.ptr, i64) -> i64
      %9843 = llvm.mlir.addressof @str1163 : !llvm.ptr
      %9844 = arith.constant 11 : i64
      %9845 = func.call @cc_make_string(%9843, %9844) : (!llvm.ptr, i64) -> i64
      %9846 = func.call @cc_intern(%9842, %9845) : (i64, i64) -> i64
      %9847 = func.call @cc_nil_value() : () -> i64
      %9848 = func.call @cc_cons(%9846, %9847) : (i64, i64) -> i64
      %9849 = func.call @cc_values_pack(%9848) : (i64) -> i64
      func.call @stack_push_pointer(%9846) : (i64) -> ()
      %9850 = llvm.mlir.addressof @str1164 : !llvm.ptr
      %9851 = arith.constant 18 : i64
      %9852 = func.call @cc_make_string(%9850, %9851) : (!llvm.ptr, i64) -> i64
      %9853 = llvm.mlir.addressof @str1165 : !llvm.ptr
      %9854 = arith.constant 11 : i64
      %9855 = func.call @cc_make_string(%9853, %9854) : (!llvm.ptr, i64) -> i64
      %9856 = func.call @cc_intern(%9852, %9855) : (i64, i64) -> i64
      %9857 = func.call @cc_nil_value() : () -> i64
      %9858 = func.call @cc_cons(%9856, %9857) : (i64, i64) -> i64
      %9859 = func.call @cc_values_pack(%9858) : (i64) -> i64
      func.call @stack_push_pointer(%9856) : (i64) -> ()
      %9860 = llvm.mlir.addressof @str1166 : !llvm.ptr
      %9861 = arith.constant 26 : i64
      %9862 = func.call @cc_make_string(%9860, %9861) : (!llvm.ptr, i64) -> i64
      %9863 = llvm.mlir.addressof @str1167 : !llvm.ptr
      %9864 = arith.constant 11 : i64
      %9865 = func.call @cc_make_string(%9863, %9864) : (!llvm.ptr, i64) -> i64
      %9866 = func.call @cc_intern(%9862, %9865) : (i64, i64) -> i64
      %9867 = func.call @cc_nil_value() : () -> i64
      %9868 = func.call @cc_cons(%9866, %9867) : (i64, i64) -> i64
      %9869 = func.call @cc_values_pack(%9868) : (i64) -> i64
      func.call @stack_push_pointer(%9866) : (i64) -> ()
      %9870 = llvm.mlir.addressof @str1168 : !llvm.ptr
      %9871 = arith.constant 20 : i64
      %9872 = func.call @cc_make_string(%9870, %9871) : (!llvm.ptr, i64) -> i64
      %9873 = llvm.mlir.addressof @str1169 : !llvm.ptr
      %9874 = arith.constant 11 : i64
      %9875 = func.call @cc_make_string(%9873, %9874) : (!llvm.ptr, i64) -> i64
      %9876 = func.call @cc_intern(%9872, %9875) : (i64, i64) -> i64
      %9877 = func.call @cc_nil_value() : () -> i64
      %9878 = func.call @cc_cons(%9876, %9877) : (i64, i64) -> i64
      %9879 = func.call @cc_values_pack(%9878) : (i64) -> i64
      func.call @stack_push_pointer(%9876) : (i64) -> ()
      %9880 = llvm.mlir.addressof @str1170 : !llvm.ptr
      %9881 = arith.constant 24 : i64
      %9882 = func.call @cc_make_string(%9880, %9881) : (!llvm.ptr, i64) -> i64
      %9883 = llvm.mlir.addressof @str1171 : !llvm.ptr
      %9884 = arith.constant 11 : i64
      %9885 = func.call @cc_make_string(%9883, %9884) : (!llvm.ptr, i64) -> i64
      %9886 = func.call @cc_intern(%9882, %9885) : (i64, i64) -> i64
      %9887 = func.call @cc_nil_value() : () -> i64
      %9888 = func.call @cc_cons(%9886, %9887) : (i64, i64) -> i64
      %9889 = func.call @cc_values_pack(%9888) : (i64) -> i64
      func.call @stack_push_pointer(%9886) : (i64) -> ()
      %9890 = llvm.mlir.addressof @str1172 : !llvm.ptr
      %9891 = arith.constant 25 : i64
      %9892 = func.call @cc_make_string(%9890, %9891) : (!llvm.ptr, i64) -> i64
      %9893 = llvm.mlir.addressof @str1173 : !llvm.ptr
      %9894 = arith.constant 11 : i64
      %9895 = func.call @cc_make_string(%9893, %9894) : (!llvm.ptr, i64) -> i64
      %9896 = func.call @cc_intern(%9892, %9895) : (i64, i64) -> i64
      %9897 = func.call @cc_nil_value() : () -> i64
      %9898 = func.call @cc_cons(%9896, %9897) : (i64, i64) -> i64
      %9899 = func.call @cc_values_pack(%9898) : (i64) -> i64
      func.call @stack_push_pointer(%9896) : (i64) -> ()
      %9900 = llvm.mlir.addressof @str1174 : !llvm.ptr
      %9901 = arith.constant 26 : i64
      %9902 = func.call @cc_make_string(%9900, %9901) : (!llvm.ptr, i64) -> i64
      %9903 = llvm.mlir.addressof @str1175 : !llvm.ptr
      %9904 = arith.constant 11 : i64
      %9905 = func.call @cc_make_string(%9903, %9904) : (!llvm.ptr, i64) -> i64
      %9906 = func.call @cc_intern(%9902, %9905) : (i64, i64) -> i64
      %9907 = func.call @cc_nil_value() : () -> i64
      %9908 = func.call @cc_cons(%9906, %9907) : (i64, i64) -> i64
      %9909 = func.call @cc_values_pack(%9908) : (i64) -> i64
      func.call @stack_push_pointer(%9906) : (i64) -> ()
      %9910 = llvm.mlir.addressof @str1176 : !llvm.ptr
      %9911 = arith.constant 26 : i64
      %9912 = func.call @cc_make_string(%9910, %9911) : (!llvm.ptr, i64) -> i64
      %9913 = llvm.mlir.addressof @str1177 : !llvm.ptr
      %9914 = arith.constant 11 : i64
      %9915 = func.call @cc_make_string(%9913, %9914) : (!llvm.ptr, i64) -> i64
      %9916 = func.call @cc_intern(%9912, %9915) : (i64, i64) -> i64
      %9917 = func.call @cc_nil_value() : () -> i64
      %9918 = func.call @cc_cons(%9916, %9917) : (i64, i64) -> i64
      %9919 = func.call @cc_values_pack(%9918) : (i64) -> i64
      func.call @stack_push_pointer(%9916) : (i64) -> ()
      %9920 = llvm.mlir.addressof @str1178 : !llvm.ptr
      %9921 = arith.constant 20 : i64
      %9922 = func.call @cc_make_string(%9920, %9921) : (!llvm.ptr, i64) -> i64
      %9923 = llvm.mlir.addressof @str1179 : !llvm.ptr
      %9924 = arith.constant 11 : i64
      %9925 = func.call @cc_make_string(%9923, %9924) : (!llvm.ptr, i64) -> i64
      %9926 = func.call @cc_intern(%9922, %9925) : (i64, i64) -> i64
      %9927 = func.call @cc_nil_value() : () -> i64
      %9928 = func.call @cc_cons(%9926, %9927) : (i64, i64) -> i64
      %9929 = func.call @cc_values_pack(%9928) : (i64) -> i64
      func.call @stack_push_pointer(%9926) : (i64) -> ()
      %9930 = llvm.mlir.addressof @str1180 : !llvm.ptr
      %9931 = arith.constant 24 : i64
      %9932 = func.call @cc_make_string(%9930, %9931) : (!llvm.ptr, i64) -> i64
      %9933 = llvm.mlir.addressof @str1181 : !llvm.ptr
      %9934 = arith.constant 11 : i64
      %9935 = func.call @cc_make_string(%9933, %9934) : (!llvm.ptr, i64) -> i64
      %9936 = func.call @cc_intern(%9932, %9935) : (i64, i64) -> i64
      %9937 = func.call @cc_nil_value() : () -> i64
      %9938 = func.call @cc_cons(%9936, %9937) : (i64, i64) -> i64
      %9939 = func.call @cc_values_pack(%9938) : (i64) -> i64
      func.call @stack_push_pointer(%9936) : (i64) -> ()
      %9940 = llvm.mlir.addressof @str1182 : !llvm.ptr
      %9941 = arith.constant 25 : i64
      %9942 = func.call @cc_make_string(%9940, %9941) : (!llvm.ptr, i64) -> i64
      %9943 = llvm.mlir.addressof @str1183 : !llvm.ptr
      %9944 = arith.constant 11 : i64
      %9945 = func.call @cc_make_string(%9943, %9944) : (!llvm.ptr, i64) -> i64
      %9946 = func.call @cc_intern(%9942, %9945) : (i64, i64) -> i64
      %9947 = func.call @cc_nil_value() : () -> i64
      %9948 = func.call @cc_cons(%9946, %9947) : (i64, i64) -> i64
      %9949 = func.call @cc_values_pack(%9948) : (i64) -> i64
      func.call @stack_push_pointer(%9946) : (i64) -> ()
      %9950 = llvm.mlir.addressof @str1184 : !llvm.ptr
      %9951 = arith.constant 26 : i64
      %9952 = func.call @cc_make_string(%9950, %9951) : (!llvm.ptr, i64) -> i64
      %9953 = llvm.mlir.addressof @str1185 : !llvm.ptr
      %9954 = arith.constant 11 : i64
      %9955 = func.call @cc_make_string(%9953, %9954) : (!llvm.ptr, i64) -> i64
      %9956 = func.call @cc_intern(%9952, %9955) : (i64, i64) -> i64
      %9957 = func.call @cc_nil_value() : () -> i64
      %9958 = func.call @cc_cons(%9956, %9957) : (i64, i64) -> i64
      %9959 = func.call @cc_values_pack(%9958) : (i64) -> i64
      func.call @stack_push_pointer(%9956) : (i64) -> ()
      %9960 = llvm.mlir.addressof @str1186 : !llvm.ptr
      %9961 = arith.constant 21 : i64
      %9962 = func.call @cc_make_string(%9960, %9961) : (!llvm.ptr, i64) -> i64
      %9963 = llvm.mlir.addressof @str1187 : !llvm.ptr
      %9964 = arith.constant 11 : i64
      %9965 = func.call @cc_make_string(%9963, %9964) : (!llvm.ptr, i64) -> i64
      %9966 = func.call @cc_intern(%9962, %9965) : (i64, i64) -> i64
      %9967 = func.call @cc_nil_value() : () -> i64
      %9968 = func.call @cc_cons(%9966, %9967) : (i64, i64) -> i64
      %9969 = func.call @cc_values_pack(%9968) : (i64) -> i64
      func.call @stack_push_pointer(%9966) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9970 = llvm.mlir.addressof @str1188 : !llvm.ptr
      %9971 = arith.constant 9 : i64
      %9972 = func.call @cc_make_string(%9970, %9971) : (!llvm.ptr, i64) -> i64
      %9973 = llvm.mlir.addressof @str1189 : !llvm.ptr
      %9974 = arith.constant 11 : i64
      %9975 = func.call @cc_make_string(%9973, %9974) : (!llvm.ptr, i64) -> i64
      %9976 = func.call @cc_intern(%9972, %9975) : (i64, i64) -> i64
      %9977 = func.call @cc_nil_value() : () -> i64
      %9978 = func.call @cc_cons(%9976, %9977) : (i64, i64) -> i64
      %9979 = func.call @cc_values_pack(%9978) : (i64) -> i64
      func.call @stack_push_pointer(%9976) : (i64) -> ()
      %9980 = llvm.mlir.addressof @str1190 : !llvm.ptr
      %9981 = arith.constant 6 : i64
      %9982 = func.call @cc_make_string(%9980, %9981) : (!llvm.ptr, i64) -> i64
      %9983 = llvm.mlir.addressof @str1191 : !llvm.ptr
      %9984 = arith.constant 11 : i64
      %9985 = func.call @cc_make_string(%9983, %9984) : (!llvm.ptr, i64) -> i64
      %9986 = func.call @cc_intern(%9982, %9985) : (i64, i64) -> i64
      %9987 = func.call @cc_nil_value() : () -> i64
      %9988 = func.call @cc_cons(%9986, %9987) : (i64, i64) -> i64
      %9989 = func.call @cc_values_pack(%9988) : (i64) -> i64
      func.call @stack_push_pointer(%9986) : (i64) -> ()
      %9990 = llvm.mlir.addressof @str1192 : !llvm.ptr
      %9991 = arith.constant 8 : i64
      %9992 = func.call @cc_make_string(%9990, %9991) : (!llvm.ptr, i64) -> i64
      %9993 = llvm.mlir.addressof @str1193 : !llvm.ptr
      %9994 = arith.constant 11 : i64
      %9995 = func.call @cc_make_string(%9993, %9994) : (!llvm.ptr, i64) -> i64
      %9996 = func.call @cc_intern(%9992, %9995) : (i64, i64) -> i64
      %9997 = func.call @cc_nil_value() : () -> i64
      %9998 = func.call @cc_cons(%9996, %9997) : (i64, i64) -> i64
      %9999 = func.call @cc_values_pack(%9998) : (i64) -> i64
      func.call @stack_push_pointer(%9996) : (i64) -> ()
      %10000 = llvm.mlir.addressof @str1194 : !llvm.ptr
      %10001 = arith.constant 9 : i64
      %10002 = func.call @cc_make_string(%10000, %10001) : (!llvm.ptr, i64) -> i64
      %10003 = llvm.mlir.addressof @str1195 : !llvm.ptr
      %10004 = arith.constant 11 : i64
      %10005 = func.call @cc_make_string(%10003, %10004) : (!llvm.ptr, i64) -> i64
      %10006 = func.call @cc_intern(%10002, %10005) : (i64, i64) -> i64
      %10007 = func.call @cc_nil_value() : () -> i64
      %10008 = func.call @cc_cons(%10006, %10007) : (i64, i64) -> i64
      %10009 = func.call @cc_values_pack(%10008) : (i64) -> i64
      func.call @stack_push_pointer(%10006) : (i64) -> ()
      %10010 = llvm.mlir.addressof @str1196 : !llvm.ptr
      %10011 = arith.constant 7 : i64
      %10012 = func.call @cc_make_string(%10010, %10011) : (!llvm.ptr, i64) -> i64
      %10013 = llvm.mlir.addressof @str1197 : !llvm.ptr
      %10014 = arith.constant 11 : i64
      %10015 = func.call @cc_make_string(%10013, %10014) : (!llvm.ptr, i64) -> i64
      %10016 = func.call @cc_intern(%10012, %10015) : (i64, i64) -> i64
      %10017 = func.call @cc_nil_value() : () -> i64
      %10018 = func.call @cc_cons(%10016, %10017) : (i64, i64) -> i64
      %10019 = func.call @cc_values_pack(%10018) : (i64) -> i64
      func.call @stack_push_pointer(%10016) : (i64) -> ()
      %10020 = llvm.mlir.addressof @str1198 : !llvm.ptr
      %10021 = arith.constant 13 : i64
      %10022 = func.call @cc_make_string(%10020, %10021) : (!llvm.ptr, i64) -> i64
      %10023 = llvm.mlir.addressof @str1199 : !llvm.ptr
      %10024 = arith.constant 11 : i64
      %10025 = func.call @cc_make_string(%10023, %10024) : (!llvm.ptr, i64) -> i64
      %10026 = func.call @cc_intern(%10022, %10025) : (i64, i64) -> i64
      %10027 = func.call @cc_nil_value() : () -> i64
      %10028 = func.call @cc_cons(%10026, %10027) : (i64, i64) -> i64
      %10029 = func.call @cc_values_pack(%10028) : (i64) -> i64
      func.call @stack_push_pointer(%10026) : (i64) -> ()
      %10030 = llvm.mlir.addressof @str1200 : !llvm.ptr
      %10031 = arith.constant 11 : i64
      %10032 = func.call @cc_make_string(%10030, %10031) : (!llvm.ptr, i64) -> i64
      %10033 = llvm.mlir.addressof @str1201 : !llvm.ptr
      %10034 = arith.constant 11 : i64
      %10035 = func.call @cc_make_string(%10033, %10034) : (!llvm.ptr, i64) -> i64
      %10036 = func.call @cc_intern(%10032, %10035) : (i64, i64) -> i64
      %10037 = func.call @cc_nil_value() : () -> i64
      %10038 = func.call @cc_cons(%10036, %10037) : (i64, i64) -> i64
      %10039 = func.call @cc_values_pack(%10038) : (i64) -> i64
      func.call @stack_push_pointer(%10036) : (i64) -> ()
      %10040 = llvm.mlir.addressof @str1202 : !llvm.ptr
      %10041 = arith.constant 2 : i64
      %10042 = func.call @cc_make_string(%10040, %10041) : (!llvm.ptr, i64) -> i64
      %10043 = llvm.mlir.addressof @str1203 : !llvm.ptr
      %10044 = arith.constant 11 : i64
      %10045 = func.call @cc_make_string(%10043, %10044) : (!llvm.ptr, i64) -> i64
      %10046 = func.call @cc_intern(%10042, %10045) : (i64, i64) -> i64
      %10047 = func.call @cc_nil_value() : () -> i64
      %10048 = func.call @cc_cons(%10046, %10047) : (i64, i64) -> i64
      %10049 = func.call @cc_values_pack(%10048) : (i64) -> i64
      func.call @stack_push_pointer(%10046) : (i64) -> ()
      %10050 = llvm.mlir.addressof @str1204 : !llvm.ptr
      %10051 = arith.constant 18 : i64
      %10052 = func.call @cc_make_string(%10050, %10051) : (!llvm.ptr, i64) -> i64
      %10053 = llvm.mlir.addressof @str1205 : !llvm.ptr
      %10054 = arith.constant 11 : i64
      %10055 = func.call @cc_make_string(%10053, %10054) : (!llvm.ptr, i64) -> i64
      %10056 = func.call @cc_intern(%10052, %10055) : (i64, i64) -> i64
      %10057 = func.call @cc_nil_value() : () -> i64
      %10058 = func.call @cc_cons(%10056, %10057) : (i64, i64) -> i64
      %10059 = func.call @cc_values_pack(%10058) : (i64) -> i64
      func.call @stack_push_pointer(%10056) : (i64) -> ()
      %10060 = llvm.mlir.addressof @str1206 : !llvm.ptr
      %10061 = arith.constant 13 : i64
      %10062 = func.call @cc_make_string(%10060, %10061) : (!llvm.ptr, i64) -> i64
      %10063 = llvm.mlir.addressof @str1207 : !llvm.ptr
      %10064 = arith.constant 11 : i64
      %10065 = func.call @cc_make_string(%10063, %10064) : (!llvm.ptr, i64) -> i64
      %10066 = func.call @cc_intern(%10062, %10065) : (i64, i64) -> i64
      %10067 = func.call @cc_nil_value() : () -> i64
      %10068 = func.call @cc_cons(%10066, %10067) : (i64, i64) -> i64
      %10069 = func.call @cc_values_pack(%10068) : (i64) -> i64
      func.call @stack_push_pointer(%10066) : (i64) -> ()
      %10070 = llvm.mlir.addressof @str1208 : !llvm.ptr
      %10071 = arith.constant 12 : i64
      %10072 = func.call @cc_make_string(%10070, %10071) : (!llvm.ptr, i64) -> i64
      %10073 = llvm.mlir.addressof @str1209 : !llvm.ptr
      %10074 = arith.constant 11 : i64
      %10075 = func.call @cc_make_string(%10073, %10074) : (!llvm.ptr, i64) -> i64
      %10076 = func.call @cc_intern(%10072, %10075) : (i64, i64) -> i64
      %10077 = func.call @cc_nil_value() : () -> i64
      %10078 = func.call @cc_cons(%10076, %10077) : (i64, i64) -> i64
      %10079 = func.call @cc_values_pack(%10078) : (i64) -> i64
      func.call @stack_push_pointer(%10076) : (i64) -> ()
      %10080 = llvm.mlir.addressof @str1210 : !llvm.ptr
      %10081 = arith.constant 5 : i64
      %10082 = func.call @cc_make_string(%10080, %10081) : (!llvm.ptr, i64) -> i64
      %10083 = llvm.mlir.addressof @str1211 : !llvm.ptr
      %10084 = arith.constant 11 : i64
      %10085 = func.call @cc_make_string(%10083, %10084) : (!llvm.ptr, i64) -> i64
      %10086 = func.call @cc_intern(%10082, %10085) : (i64, i64) -> i64
      %10087 = func.call @cc_nil_value() : () -> i64
      %10088 = func.call @cc_cons(%10086, %10087) : (i64, i64) -> i64
      %10089 = func.call @cc_values_pack(%10088) : (i64) -> i64
      func.call @stack_push_pointer(%10086) : (i64) -> ()
      %10090 = llvm.mlir.addressof @str1212 : !llvm.ptr
      %10091 = arith.constant 12 : i64
      %10092 = func.call @cc_make_string(%10090, %10091) : (!llvm.ptr, i64) -> i64
      %10093 = llvm.mlir.addressof @str1213 : !llvm.ptr
      %10094 = arith.constant 11 : i64
      %10095 = func.call @cc_make_string(%10093, %10094) : (!llvm.ptr, i64) -> i64
      %10096 = func.call @cc_intern(%10092, %10095) : (i64, i64) -> i64
      %10097 = func.call @cc_nil_value() : () -> i64
      %10098 = func.call @cc_cons(%10096, %10097) : (i64, i64) -> i64
      %10099 = func.call @cc_values_pack(%10098) : (i64) -> i64
      func.call @stack_push_pointer(%10096) : (i64) -> ()
      %10100 = llvm.mlir.addressof @str1214 : !llvm.ptr
      %10101 = arith.constant 9 : i64
      %10102 = func.call @cc_make_string(%10100, %10101) : (!llvm.ptr, i64) -> i64
      %10103 = llvm.mlir.addressof @str1215 : !llvm.ptr
      %10104 = arith.constant 11 : i64
      %10105 = func.call @cc_make_string(%10103, %10104) : (!llvm.ptr, i64) -> i64
      %10106 = func.call @cc_intern(%10102, %10105) : (i64, i64) -> i64
      %10107 = func.call @cc_nil_value() : () -> i64
      %10108 = func.call @cc_cons(%10106, %10107) : (i64, i64) -> i64
      %10109 = func.call @cc_values_pack(%10108) : (i64) -> i64
      func.call @stack_push_pointer(%10106) : (i64) -> ()
      %10110 = llvm.mlir.addressof @str1216 : !llvm.ptr
      %10111 = arith.constant 4 : i64
      %10112 = func.call @cc_make_string(%10110, %10111) : (!llvm.ptr, i64) -> i64
      %10113 = llvm.mlir.addressof @str1217 : !llvm.ptr
      %10114 = arith.constant 11 : i64
      %10115 = func.call @cc_make_string(%10113, %10114) : (!llvm.ptr, i64) -> i64
      %10116 = func.call @cc_intern(%10112, %10115) : (i64, i64) -> i64
      %10117 = func.call @cc_nil_value() : () -> i64
      %10118 = func.call @cc_cons(%10116, %10117) : (i64, i64) -> i64
      %10119 = func.call @cc_values_pack(%10118) : (i64) -> i64
      func.call @stack_push_pointer(%10116) : (i64) -> ()
      %10120 = llvm.mlir.addressof @str1218 : !llvm.ptr
      %10121 = arith.constant 7 : i64
      %10122 = func.call @cc_make_string(%10120, %10121) : (!llvm.ptr, i64) -> i64
      %10123 = llvm.mlir.addressof @str1219 : !llvm.ptr
      %10124 = arith.constant 11 : i64
      %10125 = func.call @cc_make_string(%10123, %10124) : (!llvm.ptr, i64) -> i64
      %10126 = func.call @cc_intern(%10122, %10125) : (i64, i64) -> i64
      %10127 = func.call @cc_nil_value() : () -> i64
      %10128 = func.call @cc_cons(%10126, %10127) : (i64, i64) -> i64
      %10129 = func.call @cc_values_pack(%10128) : (i64) -> i64
      func.call @stack_push_pointer(%10126) : (i64) -> ()
      %10130 = llvm.mlir.addressof @str1220 : !llvm.ptr
      %10131 = arith.constant 6 : i64
      %10132 = func.call @cc_make_string(%10130, %10131) : (!llvm.ptr, i64) -> i64
      %10133 = llvm.mlir.addressof @str1221 : !llvm.ptr
      %10134 = arith.constant 11 : i64
      %10135 = func.call @cc_make_string(%10133, %10134) : (!llvm.ptr, i64) -> i64
      %10136 = func.call @cc_intern(%10132, %10135) : (i64, i64) -> i64
      %10137 = func.call @cc_nil_value() : () -> i64
      %10138 = func.call @cc_cons(%10136, %10137) : (i64, i64) -> i64
      %10139 = func.call @cc_values_pack(%10138) : (i64) -> i64
      func.call @stack_push_pointer(%10136) : (i64) -> ()
      %10140 = llvm.mlir.addressof @str1222 : !llvm.ptr
      %10141 = arith.constant 9 : i64
      %10142 = func.call @cc_make_string(%10140, %10141) : (!llvm.ptr, i64) -> i64
      %10143 = llvm.mlir.addressof @str1223 : !llvm.ptr
      %10144 = arith.constant 11 : i64
      %10145 = func.call @cc_make_string(%10143, %10144) : (!llvm.ptr, i64) -> i64
      %10146 = func.call @cc_intern(%10142, %10145) : (i64, i64) -> i64
      %10147 = func.call @cc_nil_value() : () -> i64
      %10148 = func.call @cc_cons(%10146, %10147) : (i64, i64) -> i64
      %10149 = func.call @cc_values_pack(%10148) : (i64) -> i64
      func.call @stack_push_pointer(%10146) : (i64) -> ()
      %10150 = llvm.mlir.addressof @str1224 : !llvm.ptr
      %10151 = arith.constant 8 : i64
      %10152 = func.call @cc_make_string(%10150, %10151) : (!llvm.ptr, i64) -> i64
      %10153 = llvm.mlir.addressof @str1225 : !llvm.ptr
      %10154 = arith.constant 11 : i64
      %10155 = func.call @cc_make_string(%10153, %10154) : (!llvm.ptr, i64) -> i64
      %10156 = func.call @cc_intern(%10152, %10155) : (i64, i64) -> i64
      %10157 = func.call @cc_nil_value() : () -> i64
      %10158 = func.call @cc_cons(%10156, %10157) : (i64, i64) -> i64
      %10159 = func.call @cc_values_pack(%10158) : (i64) -> i64
      func.call @stack_push_pointer(%10156) : (i64) -> ()
      %10160 = llvm.mlir.addressof @str1226 : !llvm.ptr
      %10161 = arith.constant 17 : i64
      %10162 = func.call @cc_make_string(%10160, %10161) : (!llvm.ptr, i64) -> i64
      %10163 = llvm.mlir.addressof @str1227 : !llvm.ptr
      %10164 = arith.constant 11 : i64
      %10165 = func.call @cc_make_string(%10163, %10164) : (!llvm.ptr, i64) -> i64
      %10166 = func.call @cc_intern(%10162, %10165) : (i64, i64) -> i64
      %10167 = func.call @cc_nil_value() : () -> i64
      %10168 = func.call @cc_cons(%10166, %10167) : (i64, i64) -> i64
      %10169 = func.call @cc_values_pack(%10168) : (i64) -> i64
      func.call @stack_push_pointer(%10166) : (i64) -> ()
      %10170 = llvm.mlir.addressof @str1228 : !llvm.ptr
      %10171 = arith.constant 11 : i64
      %10172 = func.call @cc_make_string(%10170, %10171) : (!llvm.ptr, i64) -> i64
      %10173 = llvm.mlir.addressof @str1229 : !llvm.ptr
      %10174 = arith.constant 11 : i64
      %10175 = func.call @cc_make_string(%10173, %10174) : (!llvm.ptr, i64) -> i64
      %10176 = func.call @cc_intern(%10172, %10175) : (i64, i64) -> i64
      %10177 = func.call @cc_nil_value() : () -> i64
      %10178 = func.call @cc_cons(%10176, %10177) : (i64, i64) -> i64
      %10179 = func.call @cc_values_pack(%10178) : (i64) -> i64
      func.call @stack_push_pointer(%10176) : (i64) -> ()
      %10180 = llvm.mlir.addressof @str1230 : !llvm.ptr
      %10181 = arith.constant 19 : i64
      %10182 = func.call @cc_make_string(%10180, %10181) : (!llvm.ptr, i64) -> i64
      %10183 = llvm.mlir.addressof @str1231 : !llvm.ptr
      %10184 = arith.constant 11 : i64
      %10185 = func.call @cc_make_string(%10183, %10184) : (!llvm.ptr, i64) -> i64
      %10186 = func.call @cc_intern(%10182, %10185) : (i64, i64) -> i64
      %10187 = func.call @cc_nil_value() : () -> i64
      %10188 = func.call @cc_cons(%10186, %10187) : (i64, i64) -> i64
      %10189 = func.call @cc_values_pack(%10188) : (i64) -> i64
      func.call @stack_push_pointer(%10186) : (i64) -> ()
      %10190 = llvm.mlir.addressof @str1232 : !llvm.ptr
      %10191 = arith.constant 28 : i64
      %10192 = func.call @cc_make_string(%10190, %10191) : (!llvm.ptr, i64) -> i64
      %10193 = llvm.mlir.addressof @str1233 : !llvm.ptr
      %10194 = arith.constant 11 : i64
      %10195 = func.call @cc_make_string(%10193, %10194) : (!llvm.ptr, i64) -> i64
      %10196 = func.call @cc_intern(%10192, %10195) : (i64, i64) -> i64
      %10197 = func.call @cc_nil_value() : () -> i64
      %10198 = func.call @cc_cons(%10196, %10197) : (i64, i64) -> i64
      %10199 = func.call @cc_values_pack(%10198) : (i64) -> i64
      func.call @stack_push_pointer(%10196) : (i64) -> ()
      %10200 = llvm.mlir.addressof @str1234 : !llvm.ptr
      %10201 = arith.constant 11 : i64
      %10202 = func.call @cc_make_string(%10200, %10201) : (!llvm.ptr, i64) -> i64
      %10203 = llvm.mlir.addressof @str1235 : !llvm.ptr
      %10204 = arith.constant 11 : i64
      %10205 = func.call @cc_make_string(%10203, %10204) : (!llvm.ptr, i64) -> i64
      %10206 = func.call @cc_intern(%10202, %10205) : (i64, i64) -> i64
      %10207 = func.call @cc_nil_value() : () -> i64
      %10208 = func.call @cc_cons(%10206, %10207) : (i64, i64) -> i64
      %10209 = func.call @cc_values_pack(%10208) : (i64) -> i64
      func.call @stack_push_pointer(%10206) : (i64) -> ()
      %10210 = llvm.mlir.addressof @str1236 : !llvm.ptr
      %10211 = arith.constant 12 : i64
      %10212 = func.call @cc_make_string(%10210, %10211) : (!llvm.ptr, i64) -> i64
      %10213 = llvm.mlir.addressof @str1237 : !llvm.ptr
      %10214 = arith.constant 11 : i64
      %10215 = func.call @cc_make_string(%10213, %10214) : (!llvm.ptr, i64) -> i64
      %10216 = func.call @cc_intern(%10212, %10215) : (i64, i64) -> i64
      %10217 = func.call @cc_nil_value() : () -> i64
      %10218 = func.call @cc_cons(%10216, %10217) : (i64, i64) -> i64
      %10219 = func.call @cc_values_pack(%10218) : (i64) -> i64
      func.call @stack_push_pointer(%10216) : (i64) -> ()
      %10220 = llvm.mlir.addressof @str1238 : !llvm.ptr
      %10221 = arith.constant 18 : i64
      %10222 = func.call @cc_make_string(%10220, %10221) : (!llvm.ptr, i64) -> i64
      %10223 = llvm.mlir.addressof @str1239 : !llvm.ptr
      %10224 = arith.constant 11 : i64
      %10225 = func.call @cc_make_string(%10223, %10224) : (!llvm.ptr, i64) -> i64
      %10226 = func.call @cc_intern(%10222, %10225) : (i64, i64) -> i64
      %10227 = func.call @cc_nil_value() : () -> i64
      %10228 = func.call @cc_cons(%10226, %10227) : (i64, i64) -> i64
      %10229 = func.call @cc_values_pack(%10228) : (i64) -> i64
      func.call @stack_push_pointer(%10226) : (i64) -> ()
      %10230 = llvm.mlir.addressof @str1240 : !llvm.ptr
      %10231 = arith.constant 17 : i64
      %10232 = func.call @cc_make_string(%10230, %10231) : (!llvm.ptr, i64) -> i64
      %10233 = llvm.mlir.addressof @str1241 : !llvm.ptr
      %10234 = arith.constant 11 : i64
      %10235 = func.call @cc_make_string(%10233, %10234) : (!llvm.ptr, i64) -> i64
      %10236 = func.call @cc_intern(%10232, %10235) : (i64, i64) -> i64
      %10237 = func.call @cc_nil_value() : () -> i64
      %10238 = func.call @cc_cons(%10236, %10237) : (i64, i64) -> i64
      %10239 = func.call @cc_values_pack(%10238) : (i64) -> i64
      func.call @stack_push_pointer(%10236) : (i64) -> ()
      %10240 = llvm.mlir.addressof @str1242 : !llvm.ptr
      %10241 = arith.constant 16 : i64
      %10242 = func.call @cc_make_string(%10240, %10241) : (!llvm.ptr, i64) -> i64
      %10243 = llvm.mlir.addressof @str1243 : !llvm.ptr
      %10244 = arith.constant 11 : i64
      %10245 = func.call @cc_make_string(%10243, %10244) : (!llvm.ptr, i64) -> i64
      %10246 = func.call @cc_intern(%10242, %10245) : (i64, i64) -> i64
      %10247 = func.call @cc_nil_value() : () -> i64
      %10248 = func.call @cc_cons(%10246, %10247) : (i64, i64) -> i64
      %10249 = func.call @cc_values_pack(%10248) : (i64) -> i64
      func.call @stack_push_pointer(%10246) : (i64) -> ()
      %10250 = llvm.mlir.addressof @str1244 : !llvm.ptr
      %10251 = arith.constant 12 : i64
      %10252 = func.call @cc_make_string(%10250, %10251) : (!llvm.ptr, i64) -> i64
      %10253 = llvm.mlir.addressof @str1245 : !llvm.ptr
      %10254 = arith.constant 11 : i64
      %10255 = func.call @cc_make_string(%10253, %10254) : (!llvm.ptr, i64) -> i64
      %10256 = func.call @cc_intern(%10252, %10255) : (i64, i64) -> i64
      %10257 = func.call @cc_nil_value() : () -> i64
      %10258 = func.call @cc_cons(%10256, %10257) : (i64, i64) -> i64
      %10259 = func.call @cc_values_pack(%10258) : (i64) -> i64
      func.call @stack_push_pointer(%10256) : (i64) -> ()
      %10260 = llvm.mlir.addressof @str1246 : !llvm.ptr
      %10261 = arith.constant 13 : i64
      %10262 = func.call @cc_make_string(%10260, %10261) : (!llvm.ptr, i64) -> i64
      %10263 = llvm.mlir.addressof @str1247 : !llvm.ptr
      %10264 = arith.constant 11 : i64
      %10265 = func.call @cc_make_string(%10263, %10264) : (!llvm.ptr, i64) -> i64
      %10266 = func.call @cc_intern(%10262, %10265) : (i64, i64) -> i64
      %10267 = func.call @cc_nil_value() : () -> i64
      %10268 = func.call @cc_cons(%10266, %10267) : (i64, i64) -> i64
      %10269 = func.call @cc_values_pack(%10268) : (i64) -> i64
      func.call @stack_push_pointer(%10266) : (i64) -> ()
      %10270 = llvm.mlir.addressof @str1248 : !llvm.ptr
      %10271 = arith.constant 17 : i64
      %10272 = func.call @cc_make_string(%10270, %10271) : (!llvm.ptr, i64) -> i64
      %10273 = llvm.mlir.addressof @str1249 : !llvm.ptr
      %10274 = arith.constant 11 : i64
      %10275 = func.call @cc_make_string(%10273, %10274) : (!llvm.ptr, i64) -> i64
      %10276 = func.call @cc_intern(%10272, %10275) : (i64, i64) -> i64
      %10277 = func.call @cc_nil_value() : () -> i64
      %10278 = func.call @cc_cons(%10276, %10277) : (i64, i64) -> i64
      %10279 = func.call @cc_values_pack(%10278) : (i64) -> i64
      func.call @stack_push_pointer(%10276) : (i64) -> ()
      %10280 = llvm.mlir.addressof @str1250 : !llvm.ptr
      %10281 = arith.constant 13 : i64
      %10282 = func.call @cc_make_string(%10280, %10281) : (!llvm.ptr, i64) -> i64
      %10283 = llvm.mlir.addressof @str1251 : !llvm.ptr
      %10284 = arith.constant 11 : i64
      %10285 = func.call @cc_make_string(%10283, %10284) : (!llvm.ptr, i64) -> i64
      %10286 = func.call @cc_intern(%10282, %10285) : (i64, i64) -> i64
      %10287 = func.call @cc_nil_value() : () -> i64
      %10288 = func.call @cc_cons(%10286, %10287) : (i64, i64) -> i64
      %10289 = func.call @cc_values_pack(%10288) : (i64) -> i64
      func.call @stack_push_pointer(%10286) : (i64) -> ()
      %10290 = llvm.mlir.addressof @str1252 : !llvm.ptr
      %10291 = arith.constant 14 : i64
      %10292 = func.call @cc_make_string(%10290, %10291) : (!llvm.ptr, i64) -> i64
      %10293 = llvm.mlir.addressof @str1253 : !llvm.ptr
      %10294 = arith.constant 11 : i64
      %10295 = func.call @cc_make_string(%10293, %10294) : (!llvm.ptr, i64) -> i64
      %10296 = func.call @cc_intern(%10292, %10295) : (i64, i64) -> i64
      %10297 = func.call @cc_nil_value() : () -> i64
      %10298 = func.call @cc_cons(%10296, %10297) : (i64, i64) -> i64
      %10299 = func.call @cc_values_pack(%10298) : (i64) -> i64
      func.call @stack_push_pointer(%10296) : (i64) -> ()
      %10300 = llvm.mlir.addressof @str1254 : !llvm.ptr
      %10301 = arith.constant 12 : i64
      %10302 = func.call @cc_make_string(%10300, %10301) : (!llvm.ptr, i64) -> i64
      %10303 = llvm.mlir.addressof @str1255 : !llvm.ptr
      %10304 = arith.constant 11 : i64
      %10305 = func.call @cc_make_string(%10303, %10304) : (!llvm.ptr, i64) -> i64
      %10306 = func.call @cc_intern(%10302, %10305) : (i64, i64) -> i64
      %10307 = func.call @cc_nil_value() : () -> i64
      %10308 = func.call @cc_cons(%10306, %10307) : (i64, i64) -> i64
      %10309 = func.call @cc_values_pack(%10308) : (i64) -> i64
      func.call @stack_push_pointer(%10306) : (i64) -> ()
      %10310 = llvm.mlir.addressof @str1256 : !llvm.ptr
      %10311 = arith.constant 20 : i64
      %10312 = func.call @cc_make_string(%10310, %10311) : (!llvm.ptr, i64) -> i64
      %10313 = llvm.mlir.addressof @str1257 : !llvm.ptr
      %10314 = arith.constant 11 : i64
      %10315 = func.call @cc_make_string(%10313, %10314) : (!llvm.ptr, i64) -> i64
      %10316 = func.call @cc_intern(%10312, %10315) : (i64, i64) -> i64
      %10317 = func.call @cc_nil_value() : () -> i64
      %10318 = func.call @cc_cons(%10316, %10317) : (i64, i64) -> i64
      %10319 = func.call @cc_values_pack(%10318) : (i64) -> i64
      func.call @stack_push_pointer(%10316) : (i64) -> ()
      %10320 = llvm.mlir.addressof @str1258 : !llvm.ptr
      %10321 = arith.constant 29 : i64
      %10322 = func.call @cc_make_string(%10320, %10321) : (!llvm.ptr, i64) -> i64
      %10323 = llvm.mlir.addressof @str1259 : !llvm.ptr
      %10324 = arith.constant 11 : i64
      %10325 = func.call @cc_make_string(%10323, %10324) : (!llvm.ptr, i64) -> i64
      %10326 = func.call @cc_intern(%10322, %10325) : (i64, i64) -> i64
      %10327 = func.call @cc_nil_value() : () -> i64
      %10328 = func.call @cc_cons(%10326, %10327) : (i64, i64) -> i64
      %10329 = func.call @cc_values_pack(%10328) : (i64) -> i64
      func.call @stack_push_pointer(%10326) : (i64) -> ()
      %10330 = llvm.mlir.addressof @str1260 : !llvm.ptr
      %10331 = arith.constant 5 : i64
      %10332 = func.call @cc_make_string(%10330, %10331) : (!llvm.ptr, i64) -> i64
      %10333 = llvm.mlir.addressof @str1261 : !llvm.ptr
      %10334 = arith.constant 11 : i64
      %10335 = func.call @cc_make_string(%10333, %10334) : (!llvm.ptr, i64) -> i64
      %10336 = func.call @cc_intern(%10332, %10335) : (i64, i64) -> i64
      %10337 = func.call @cc_nil_value() : () -> i64
      %10338 = func.call @cc_cons(%10336, %10337) : (i64, i64) -> i64
      %10339 = func.call @cc_values_pack(%10338) : (i64) -> i64
      func.call @stack_push_pointer(%10336) : (i64) -> ()
      %10340 = llvm.mlir.addressof @str1262 : !llvm.ptr
      %10341 = arith.constant 7 : i64
      %10342 = func.call @cc_make_string(%10340, %10341) : (!llvm.ptr, i64) -> i64
      %10343 = llvm.mlir.addressof @str1263 : !llvm.ptr
      %10344 = arith.constant 11 : i64
      %10345 = func.call @cc_make_string(%10343, %10344) : (!llvm.ptr, i64) -> i64
      %10346 = func.call @cc_intern(%10342, %10345) : (i64, i64) -> i64
      %10347 = func.call @cc_nil_value() : () -> i64
      %10348 = func.call @cc_cons(%10346, %10347) : (i64, i64) -> i64
      %10349 = func.call @cc_values_pack(%10348) : (i64) -> i64
      func.call @stack_push_pointer(%10346) : (i64) -> ()
      %10350 = llvm.mlir.addressof @str1264 : !llvm.ptr
      %10351 = arith.constant 5 : i64
      %10352 = func.call @cc_make_string(%10350, %10351) : (!llvm.ptr, i64) -> i64
      %10353 = llvm.mlir.addressof @str1265 : !llvm.ptr
      %10354 = arith.constant 11 : i64
      %10355 = func.call @cc_make_string(%10353, %10354) : (!llvm.ptr, i64) -> i64
      %10356 = func.call @cc_intern(%10352, %10355) : (i64, i64) -> i64
      %10357 = func.call @cc_nil_value() : () -> i64
      %10358 = func.call @cc_cons(%10356, %10357) : (i64, i64) -> i64
      %10359 = func.call @cc_values_pack(%10358) : (i64) -> i64
      func.call @stack_push_pointer(%10356) : (i64) -> ()
      %10360 = llvm.mlir.addressof @str1266 : !llvm.ptr
      %10361 = arith.constant 8 : i64
      %10362 = func.call @cc_make_string(%10360, %10361) : (!llvm.ptr, i64) -> i64
      %10363 = llvm.mlir.addressof @str1267 : !llvm.ptr
      %10364 = arith.constant 11 : i64
      %10365 = func.call @cc_make_string(%10363, %10364) : (!llvm.ptr, i64) -> i64
      %10366 = func.call @cc_intern(%10362, %10365) : (i64, i64) -> i64
      %10367 = func.call @cc_nil_value() : () -> i64
      %10368 = func.call @cc_cons(%10366, %10367) : (i64, i64) -> i64
      %10369 = func.call @cc_values_pack(%10368) : (i64) -> i64
      func.call @stack_push_pointer(%10366) : (i64) -> ()
      %10370 = llvm.mlir.addressof @str1268 : !llvm.ptr
      %10371 = arith.constant 13 : i64
      %10372 = func.call @cc_make_string(%10370, %10371) : (!llvm.ptr, i64) -> i64
      %10373 = llvm.mlir.addressof @str1269 : !llvm.ptr
      %10374 = arith.constant 11 : i64
      %10375 = func.call @cc_make_string(%10373, %10374) : (!llvm.ptr, i64) -> i64
      %10376 = func.call @cc_intern(%10372, %10375) : (i64, i64) -> i64
      %10377 = func.call @cc_nil_value() : () -> i64
      %10378 = func.call @cc_cons(%10376, %10377) : (i64, i64) -> i64
      %10379 = func.call @cc_values_pack(%10378) : (i64) -> i64
      func.call @stack_push_pointer(%10376) : (i64) -> ()
      %10380 = llvm.mlir.addressof @str1270 : !llvm.ptr
      %10381 = arith.constant 14 : i64
      %10382 = func.call @cc_make_string(%10380, %10381) : (!llvm.ptr, i64) -> i64
      %10383 = llvm.mlir.addressof @str1271 : !llvm.ptr
      %10384 = arith.constant 11 : i64
      %10385 = func.call @cc_make_string(%10383, %10384) : (!llvm.ptr, i64) -> i64
      %10386 = func.call @cc_intern(%10382, %10385) : (i64, i64) -> i64
      %10387 = func.call @cc_nil_value() : () -> i64
      %10388 = func.call @cc_cons(%10386, %10387) : (i64, i64) -> i64
      %10389 = func.call @cc_values_pack(%10388) : (i64) -> i64
      func.call @stack_push_pointer(%10386) : (i64) -> ()
      %10390 = llvm.mlir.addressof @str1272 : !llvm.ptr
      %10391 = arith.constant 25 : i64
      %10392 = func.call @cc_make_string(%10390, %10391) : (!llvm.ptr, i64) -> i64
      %10393 = llvm.mlir.addressof @str1273 : !llvm.ptr
      %10394 = arith.constant 11 : i64
      %10395 = func.call @cc_make_string(%10393, %10394) : (!llvm.ptr, i64) -> i64
      %10396 = func.call @cc_intern(%10392, %10395) : (i64, i64) -> i64
      %10397 = func.call @cc_nil_value() : () -> i64
      %10398 = func.call @cc_cons(%10396, %10397) : (i64, i64) -> i64
      %10399 = func.call @cc_values_pack(%10398) : (i64) -> i64
      func.call @stack_push_pointer(%10396) : (i64) -> ()
      %10400 = llvm.mlir.addressof @str1274 : !llvm.ptr
      %10401 = arith.constant 15 : i64
      %10402 = func.call @cc_make_string(%10400, %10401) : (!llvm.ptr, i64) -> i64
      %10403 = llvm.mlir.addressof @str1275 : !llvm.ptr
      %10404 = arith.constant 11 : i64
      %10405 = func.call @cc_make_string(%10403, %10404) : (!llvm.ptr, i64) -> i64
      %10406 = func.call @cc_intern(%10402, %10405) : (i64, i64) -> i64
      %10407 = func.call @cc_nil_value() : () -> i64
      %10408 = func.call @cc_cons(%10406, %10407) : (i64, i64) -> i64
      %10409 = func.call @cc_values_pack(%10408) : (i64) -> i64
      func.call @stack_push_pointer(%10406) : (i64) -> ()
      %10410 = llvm.mlir.addressof @str1276 : !llvm.ptr
      %10411 = arith.constant 15 : i64
      %10412 = func.call @cc_make_string(%10410, %10411) : (!llvm.ptr, i64) -> i64
      %10413 = llvm.mlir.addressof @str1277 : !llvm.ptr
      %10414 = arith.constant 11 : i64
      %10415 = func.call @cc_make_string(%10413, %10414) : (!llvm.ptr, i64) -> i64
      %10416 = func.call @cc_intern(%10412, %10415) : (i64, i64) -> i64
      %10417 = func.call @cc_nil_value() : () -> i64
      %10418 = func.call @cc_cons(%10416, %10417) : (i64, i64) -> i64
      %10419 = func.call @cc_values_pack(%10418) : (i64) -> i64
      func.call @stack_push_pointer(%10416) : (i64) -> ()
      %10420 = llvm.mlir.addressof @str1278 : !llvm.ptr
      %10421 = arith.constant 17 : i64
      %10422 = func.call @cc_make_string(%10420, %10421) : (!llvm.ptr, i64) -> i64
      %10423 = llvm.mlir.addressof @str1279 : !llvm.ptr
      %10424 = arith.constant 11 : i64
      %10425 = func.call @cc_make_string(%10423, %10424) : (!llvm.ptr, i64) -> i64
      %10426 = func.call @cc_intern(%10422, %10425) : (i64, i64) -> i64
      %10427 = func.call @cc_nil_value() : () -> i64
      %10428 = func.call @cc_cons(%10426, %10427) : (i64, i64) -> i64
      %10429 = func.call @cc_values_pack(%10428) : (i64) -> i64
      func.call @stack_push_pointer(%10426) : (i64) -> ()
      %10430 = llvm.mlir.addressof @str1280 : !llvm.ptr
      %10431 = arith.constant 6 : i64
      %10432 = func.call @cc_make_string(%10430, %10431) : (!llvm.ptr, i64) -> i64
      %10433 = llvm.mlir.addressof @str1281 : !llvm.ptr
      %10434 = arith.constant 11 : i64
      %10435 = func.call @cc_make_string(%10433, %10434) : (!llvm.ptr, i64) -> i64
      %10436 = func.call @cc_intern(%10432, %10435) : (i64, i64) -> i64
      %10437 = func.call @cc_nil_value() : () -> i64
      %10438 = func.call @cc_cons(%10436, %10437) : (i64, i64) -> i64
      %10439 = func.call @cc_values_pack(%10438) : (i64) -> i64
      func.call @stack_push_pointer(%10436) : (i64) -> ()
      %10440 = llvm.mlir.addressof @str1282 : !llvm.ptr
      %10441 = arith.constant 12 : i64
      %10442 = func.call @cc_make_string(%10440, %10441) : (!llvm.ptr, i64) -> i64
      %10443 = llvm.mlir.addressof @str1283 : !llvm.ptr
      %10444 = arith.constant 11 : i64
      %10445 = func.call @cc_make_string(%10443, %10444) : (!llvm.ptr, i64) -> i64
      %10446 = func.call @cc_intern(%10442, %10445) : (i64, i64) -> i64
      %10447 = func.call @cc_nil_value() : () -> i64
      %10448 = func.call @cc_cons(%10446, %10447) : (i64, i64) -> i64
      %10449 = func.call @cc_values_pack(%10448) : (i64) -> i64
      func.call @stack_push_pointer(%10446) : (i64) -> ()
      %10450 = llvm.mlir.addressof @str1284 : !llvm.ptr
      %10451 = arith.constant 13 : i64
      %10452 = func.call @cc_make_string(%10450, %10451) : (!llvm.ptr, i64) -> i64
      %10453 = llvm.mlir.addressof @str1285 : !llvm.ptr
      %10454 = arith.constant 11 : i64
      %10455 = func.call @cc_make_string(%10453, %10454) : (!llvm.ptr, i64) -> i64
      %10456 = func.call @cc_intern(%10452, %10455) : (i64, i64) -> i64
      %10457 = func.call @cc_nil_value() : () -> i64
      %10458 = func.call @cc_cons(%10456, %10457) : (i64, i64) -> i64
      %10459 = func.call @cc_values_pack(%10458) : (i64) -> i64
      func.call @stack_push_pointer(%10456) : (i64) -> ()
      %10460 = llvm.mlir.addressof @str1286 : !llvm.ptr
      %10461 = arith.constant 9 : i64
      %10462 = func.call @cc_make_string(%10460, %10461) : (!llvm.ptr, i64) -> i64
      %10463 = llvm.mlir.addressof @str1287 : !llvm.ptr
      %10464 = arith.constant 11 : i64
      %10465 = func.call @cc_make_string(%10463, %10464) : (!llvm.ptr, i64) -> i64
      %10466 = func.call @cc_intern(%10462, %10465) : (i64, i64) -> i64
      %10467 = func.call @cc_nil_value() : () -> i64
      %10468 = func.call @cc_cons(%10466, %10467) : (i64, i64) -> i64
      %10469 = func.call @cc_values_pack(%10468) : (i64) -> i64
      func.call @stack_push_pointer(%10466) : (i64) -> ()
      %10470 = llvm.mlir.addressof @str1288 : !llvm.ptr
      %10471 = arith.constant 15 : i64
      %10472 = func.call @cc_make_string(%10470, %10471) : (!llvm.ptr, i64) -> i64
      %10473 = llvm.mlir.addressof @str1289 : !llvm.ptr
      %10474 = arith.constant 11 : i64
      %10475 = func.call @cc_make_string(%10473, %10474) : (!llvm.ptr, i64) -> i64
      %10476 = func.call @cc_intern(%10472, %10475) : (i64, i64) -> i64
      %10477 = func.call @cc_nil_value() : () -> i64
      %10478 = func.call @cc_cons(%10476, %10477) : (i64, i64) -> i64
      %10479 = func.call @cc_values_pack(%10478) : (i64) -> i64
      func.call @stack_push_pointer(%10476) : (i64) -> ()
      %10480 = llvm.mlir.addressof @str1290 : !llvm.ptr
      %10481 = arith.constant 16 : i64
      %10482 = func.call @cc_make_string(%10480, %10481) : (!llvm.ptr, i64) -> i64
      %10483 = llvm.mlir.addressof @str1291 : !llvm.ptr
      %10484 = arith.constant 11 : i64
      %10485 = func.call @cc_make_string(%10483, %10484) : (!llvm.ptr, i64) -> i64
      %10486 = func.call @cc_intern(%10482, %10485) : (i64, i64) -> i64
      %10487 = func.call @cc_nil_value() : () -> i64
      %10488 = func.call @cc_cons(%10486, %10487) : (i64, i64) -> i64
      %10489 = func.call @cc_values_pack(%10488) : (i64) -> i64
      func.call @stack_push_pointer(%10486) : (i64) -> ()
      %10490 = llvm.mlir.addressof @str1292 : !llvm.ptr
      %10491 = arith.constant 13 : i64
      %10492 = func.call @cc_make_string(%10490, %10491) : (!llvm.ptr, i64) -> i64
      %10493 = llvm.mlir.addressof @str1293 : !llvm.ptr
      %10494 = arith.constant 11 : i64
      %10495 = func.call @cc_make_string(%10493, %10494) : (!llvm.ptr, i64) -> i64
      %10496 = func.call @cc_intern(%10492, %10495) : (i64, i64) -> i64
      %10497 = func.call @cc_nil_value() : () -> i64
      %10498 = func.call @cc_cons(%10496, %10497) : (i64, i64) -> i64
      %10499 = func.call @cc_values_pack(%10498) : (i64) -> i64
      func.call @stack_push_pointer(%10496) : (i64) -> ()
      %10500 = llvm.mlir.addressof @str1294 : !llvm.ptr
      %10501 = arith.constant 6 : i64
      %10502 = func.call @cc_make_string(%10500, %10501) : (!llvm.ptr, i64) -> i64
      %10503 = llvm.mlir.addressof @str1295 : !llvm.ptr
      %10504 = arith.constant 11 : i64
      %10505 = func.call @cc_make_string(%10503, %10504) : (!llvm.ptr, i64) -> i64
      %10506 = func.call @cc_intern(%10502, %10505) : (i64, i64) -> i64
      %10507 = func.call @cc_nil_value() : () -> i64
      %10508 = func.call @cc_cons(%10506, %10507) : (i64, i64) -> i64
      %10509 = func.call @cc_values_pack(%10508) : (i64) -> i64
      func.call @stack_push_pointer(%10506) : (i64) -> ()
      %10510 = llvm.mlir.addressof @str1296 : !llvm.ptr
      %10511 = arith.constant 14 : i64
      %10512 = func.call @cc_make_string(%10510, %10511) : (!llvm.ptr, i64) -> i64
      %10513 = llvm.mlir.addressof @str1297 : !llvm.ptr
      %10514 = arith.constant 11 : i64
      %10515 = func.call @cc_make_string(%10513, %10514) : (!llvm.ptr, i64) -> i64
      %10516 = func.call @cc_intern(%10512, %10515) : (i64, i64) -> i64
      %10517 = func.call @cc_nil_value() : () -> i64
      %10518 = func.call @cc_cons(%10516, %10517) : (i64, i64) -> i64
      %10519 = func.call @cc_values_pack(%10518) : (i64) -> i64
      func.call @stack_push_pointer(%10516) : (i64) -> ()
      %10520 = llvm.mlir.addressof @str1298 : !llvm.ptr
      %10521 = arith.constant 1 : i64
      %10522 = func.call @cc_make_string(%10520, %10521) : (!llvm.ptr, i64) -> i64
      %10523 = func.call @cc_nil_value() : () -> i64
      %10524 = func.call @cc_intern(%10522, %10523) : (i64, i64) -> i64
      %10525 = func.call @cc_nil_value() : () -> i64
      %10526 = func.call @cc_cons(%10524, %10525) : (i64, i64) -> i64
      %10527 = func.call @cc_values_pack(%10526) : (i64) -> i64
      func.call @stack_push_pointer(%10524) : (i64) -> ()
      %10528 = llvm.mlir.addressof @str1299 : !llvm.ptr
      %10529 = arith.constant 14 : i64
      %10530 = func.call @cc_make_string(%10528, %10529) : (!llvm.ptr, i64) -> i64
      %10531 = llvm.mlir.addressof @str1300 : !llvm.ptr
      %10532 = arith.constant 11 : i64
      %10533 = func.call @cc_make_string(%10531, %10532) : (!llvm.ptr, i64) -> i64
      %10534 = func.call @cc_intern(%10530, %10533) : (i64, i64) -> i64
      %10535 = func.call @cc_nil_value() : () -> i64
      %10536 = func.call @cc_cons(%10534, %10535) : (i64, i64) -> i64
      %10537 = func.call @cc_values_pack(%10536) : (i64) -> i64
      func.call @stack_push_pointer(%10534) : (i64) -> ()
      %10538 = llvm.mlir.addressof @str1301 : !llvm.ptr
      %10539 = arith.constant 4 : i64
      %10540 = func.call @cc_make_string(%10538, %10539) : (!llvm.ptr, i64) -> i64
      %10541 = llvm.mlir.addressof @str1302 : !llvm.ptr
      %10542 = arith.constant 11 : i64
      %10543 = func.call @cc_make_string(%10541, %10542) : (!llvm.ptr, i64) -> i64
      %10544 = func.call @cc_intern(%10540, %10543) : (i64, i64) -> i64
      %10545 = func.call @cc_nil_value() : () -> i64
      %10546 = func.call @cc_cons(%10544, %10545) : (i64, i64) -> i64
      %10547 = func.call @cc_values_pack(%10546) : (i64) -> i64
      func.call @stack_push_pointer(%10544) : (i64) -> ()
      %10548 = llvm.mlir.addressof @str1303 : !llvm.ptr
      %10549 = arith.constant 10 : i64
      %10550 = func.call @cc_make_string(%10548, %10549) : (!llvm.ptr, i64) -> i64
      %10551 = llvm.mlir.addressof @str1304 : !llvm.ptr
      %10552 = arith.constant 11 : i64
      %10553 = func.call @cc_make_string(%10551, %10552) : (!llvm.ptr, i64) -> i64
      %10554 = func.call @cc_intern(%10550, %10553) : (i64, i64) -> i64
      %10555 = func.call @cc_nil_value() : () -> i64
      %10556 = func.call @cc_cons(%10554, %10555) : (i64, i64) -> i64
      %10557 = func.call @cc_values_pack(%10556) : (i64) -> i64
      func.call @stack_push_pointer(%10554) : (i64) -> ()
      %10558 = llvm.mlir.addressof @str1305 : !llvm.ptr
      %10559 = arith.constant 12 : i64
      %10560 = func.call @cc_make_string(%10558, %10559) : (!llvm.ptr, i64) -> i64
      %10561 = llvm.mlir.addressof @str1306 : !llvm.ptr
      %10562 = arith.constant 11 : i64
      %10563 = func.call @cc_make_string(%10561, %10562) : (!llvm.ptr, i64) -> i64
      %10564 = func.call @cc_intern(%10560, %10563) : (i64, i64) -> i64
      %10565 = func.call @cc_nil_value() : () -> i64
      %10566 = func.call @cc_cons(%10564, %10565) : (i64, i64) -> i64
      %10567 = func.call @cc_values_pack(%10566) : (i64) -> i64
      func.call @stack_push_pointer(%10564) : (i64) -> ()
      %10568 = llvm.mlir.addressof @str1307 : !llvm.ptr
      %10569 = arith.constant 16 : i64
      %10570 = func.call @cc_make_string(%10568, %10569) : (!llvm.ptr, i64) -> i64
      %10571 = llvm.mlir.addressof @str1308 : !llvm.ptr
      %10572 = arith.constant 11 : i64
      %10573 = func.call @cc_make_string(%10571, %10572) : (!llvm.ptr, i64) -> i64
      %10574 = func.call @cc_intern(%10570, %10573) : (i64, i64) -> i64
      %10575 = func.call @cc_nil_value() : () -> i64
      %10576 = func.call @cc_cons(%10574, %10575) : (i64, i64) -> i64
      %10577 = func.call @cc_values_pack(%10576) : (i64) -> i64
      func.call @stack_push_pointer(%10574) : (i64) -> ()
      %10578 = llvm.mlir.addressof @str1309 : !llvm.ptr
      %10579 = arith.constant 18 : i64
      %10580 = func.call @cc_make_string(%10578, %10579) : (!llvm.ptr, i64) -> i64
      %10581 = llvm.mlir.addressof @str1310 : !llvm.ptr
      %10582 = arith.constant 11 : i64
      %10583 = func.call @cc_make_string(%10581, %10582) : (!llvm.ptr, i64) -> i64
      %10584 = func.call @cc_intern(%10580, %10583) : (i64, i64) -> i64
      %10585 = func.call @cc_nil_value() : () -> i64
      %10586 = func.call @cc_cons(%10584, %10585) : (i64, i64) -> i64
      %10587 = func.call @cc_values_pack(%10586) : (i64) -> i64
      func.call @stack_push_pointer(%10584) : (i64) -> ()
      %10588 = llvm.mlir.addressof @str1311 : !llvm.ptr
      %10589 = arith.constant 13 : i64
      %10590 = func.call @cc_make_string(%10588, %10589) : (!llvm.ptr, i64) -> i64
      %10591 = llvm.mlir.addressof @str1312 : !llvm.ptr
      %10592 = arith.constant 11 : i64
      %10593 = func.call @cc_make_string(%10591, %10592) : (!llvm.ptr, i64) -> i64
      %10594 = func.call @cc_intern(%10590, %10593) : (i64, i64) -> i64
      %10595 = func.call @cc_nil_value() : () -> i64
      %10596 = func.call @cc_cons(%10594, %10595) : (i64, i64) -> i64
      %10597 = func.call @cc_values_pack(%10596) : (i64) -> i64
      func.call @stack_push_pointer(%10594) : (i64) -> ()
      %10598 = llvm.mlir.addressof @str1313 : !llvm.ptr
      %10599 = arith.constant 8 : i64
      %10600 = func.call @cc_make_string(%10598, %10599) : (!llvm.ptr, i64) -> i64
      %10601 = llvm.mlir.addressof @str1314 : !llvm.ptr
      %10602 = arith.constant 11 : i64
      %10603 = func.call @cc_make_string(%10601, %10602) : (!llvm.ptr, i64) -> i64
      %10604 = func.call @cc_intern(%10600, %10603) : (i64, i64) -> i64
      %10605 = func.call @cc_nil_value() : () -> i64
      %10606 = func.call @cc_cons(%10604, %10605) : (i64, i64) -> i64
      %10607 = func.call @cc_values_pack(%10606) : (i64) -> i64
      func.call @stack_push_pointer(%10604) : (i64) -> ()
      %10608 = llvm.mlir.addressof @str1315 : !llvm.ptr
      %10609 = arith.constant 7 : i64
      %10610 = func.call @cc_make_string(%10608, %10609) : (!llvm.ptr, i64) -> i64
      %10611 = llvm.mlir.addressof @str1316 : !llvm.ptr
      %10612 = arith.constant 11 : i64
      %10613 = func.call @cc_make_string(%10611, %10612) : (!llvm.ptr, i64) -> i64
      %10614 = func.call @cc_intern(%10610, %10613) : (i64, i64) -> i64
      %10615 = func.call @cc_nil_value() : () -> i64
      %10616 = func.call @cc_cons(%10614, %10615) : (i64, i64) -> i64
      %10617 = func.call @cc_values_pack(%10616) : (i64) -> i64
      func.call @stack_push_pointer(%10614) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10618 = func.call @stack_pop_pointer() : () -> i64
      %10619 = func.call @stack_pop_pointer() : () -> i64
      %10620 = func.call @cc_cons(%10619, %10618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_581 = arith.constant 0 : i64
      %10621 = arith.addi %10620, %__rlasp_stack_elide_zero_581 : i64
      %10622 = func.call @stack_pop_pointer() : () -> i64
      %10623 = func.call @cc_cons(%10622, %10621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_582 = arith.constant 0 : i64
      %10624 = arith.addi %10623, %__rlasp_stack_elide_zero_582 : i64
      %10625 = func.call @stack_pop_pointer() : () -> i64
      %10626 = func.call @cc_cons(%10625, %10624) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_583 = arith.constant 0 : i64
      %10627 = arith.addi %10626, %__rlasp_stack_elide_zero_583 : i64
      %10628 = func.call @stack_pop_pointer() : () -> i64
      %10629 = func.call @cc_cons(%10628, %10627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_584 = arith.constant 0 : i64
      %10630 = arith.addi %10629, %__rlasp_stack_elide_zero_584 : i64
      %10631 = func.call @stack_pop_pointer() : () -> i64
      %10632 = func.call @cc_cons(%10631, %10630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_585 = arith.constant 0 : i64
      %10633 = arith.addi %10632, %__rlasp_stack_elide_zero_585 : i64
      %10634 = func.call @stack_pop_pointer() : () -> i64
      %10635 = func.call @cc_cons(%10634, %10633) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_586 = arith.constant 0 : i64
      %10636 = arith.addi %10635, %__rlasp_stack_elide_zero_586 : i64
      %10637 = func.call @stack_pop_pointer() : () -> i64
      %10638 = func.call @cc_cons(%10637, %10636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_587 = arith.constant 0 : i64
      %10639 = arith.addi %10638, %__rlasp_stack_elide_zero_587 : i64
      %10640 = func.call @stack_pop_pointer() : () -> i64
      %10641 = func.call @cc_cons(%10640, %10639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_588 = arith.constant 0 : i64
      %10642 = arith.addi %10641, %__rlasp_stack_elide_zero_588 : i64
      %10643 = func.call @stack_pop_pointer() : () -> i64
      %10644 = func.call @cc_cons(%10643, %10642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_589 = arith.constant 0 : i64
      %10645 = arith.addi %10644, %__rlasp_stack_elide_zero_589 : i64
      %10646 = func.call @stack_pop_pointer() : () -> i64
      %10647 = func.call @cc_cons(%10646, %10645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_590 = arith.constant 0 : i64
      %10648 = arith.addi %10647, %__rlasp_stack_elide_zero_590 : i64
      %10649 = func.call @stack_pop_pointer() : () -> i64
      %10650 = func.call @cc_cons(%10649, %10648) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_591 = arith.constant 0 : i64
      %10651 = arith.addi %10650, %__rlasp_stack_elide_zero_591 : i64
      %10652 = func.call @stack_pop_pointer() : () -> i64
      %10653 = func.call @cc_cons(%10652, %10651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_592 = arith.constant 0 : i64
      %10654 = arith.addi %10653, %__rlasp_stack_elide_zero_592 : i64
      %10655 = func.call @stack_pop_pointer() : () -> i64
      %10656 = func.call @cc_cons(%10655, %10654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_593 = arith.constant 0 : i64
      %10657 = arith.addi %10656, %__rlasp_stack_elide_zero_593 : i64
      %10658 = func.call @stack_pop_pointer() : () -> i64
      %10659 = func.call @cc_cons(%10658, %10657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_594 = arith.constant 0 : i64
      %10660 = arith.addi %10659, %__rlasp_stack_elide_zero_594 : i64
      %10661 = func.call @stack_pop_pointer() : () -> i64
      %10662 = func.call @cc_cons(%10661, %10660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_595 = arith.constant 0 : i64
      %10663 = arith.addi %10662, %__rlasp_stack_elide_zero_595 : i64
      %10664 = func.call @stack_pop_pointer() : () -> i64
      %10665 = func.call @cc_cons(%10664, %10663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_596 = arith.constant 0 : i64
      %10666 = arith.addi %10665, %__rlasp_stack_elide_zero_596 : i64
      %10667 = func.call @stack_pop_pointer() : () -> i64
      %10668 = func.call @cc_cons(%10667, %10666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_597 = arith.constant 0 : i64
      %10669 = arith.addi %10668, %__rlasp_stack_elide_zero_597 : i64
      %10670 = func.call @stack_pop_pointer() : () -> i64
      %10671 = func.call @cc_cons(%10670, %10669) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_598 = arith.constant 0 : i64
      %10672 = arith.addi %10671, %__rlasp_stack_elide_zero_598 : i64
      %10673 = func.call @stack_pop_pointer() : () -> i64
      %10674 = func.call @cc_cons(%10673, %10672) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_599 = arith.constant 0 : i64
      %10675 = arith.addi %10674, %__rlasp_stack_elide_zero_599 : i64
      %10676 = func.call @stack_pop_pointer() : () -> i64
      %10677 = func.call @cc_cons(%10676, %10675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_600 = arith.constant 0 : i64
      %10678 = arith.addi %10677, %__rlasp_stack_elide_zero_600 : i64
      %10679 = func.call @stack_pop_pointer() : () -> i64
      %10680 = func.call @cc_cons(%10679, %10678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_601 = arith.constant 0 : i64
      %10681 = arith.addi %10680, %__rlasp_stack_elide_zero_601 : i64
      %10682 = func.call @stack_pop_pointer() : () -> i64
      %10683 = func.call @cc_cons(%10682, %10681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_602 = arith.constant 0 : i64
      %10684 = arith.addi %10683, %__rlasp_stack_elide_zero_602 : i64
      %10685 = func.call @stack_pop_pointer() : () -> i64
      %10686 = func.call @cc_cons(%10685, %10684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_603 = arith.constant 0 : i64
      %10687 = arith.addi %10686, %__rlasp_stack_elide_zero_603 : i64
      %10688 = func.call @stack_pop_pointer() : () -> i64
      %10689 = func.call @cc_cons(%10688, %10687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_604 = arith.constant 0 : i64
      %10690 = arith.addi %10689, %__rlasp_stack_elide_zero_604 : i64
      %10691 = func.call @stack_pop_pointer() : () -> i64
      %10692 = func.call @cc_cons(%10691, %10690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_605 = arith.constant 0 : i64
      %10693 = arith.addi %10692, %__rlasp_stack_elide_zero_605 : i64
      %10694 = func.call @stack_pop_pointer() : () -> i64
      %10695 = func.call @cc_cons(%10694, %10693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_606 = arith.constant 0 : i64
      %10696 = arith.addi %10695, %__rlasp_stack_elide_zero_606 : i64
      %10697 = func.call @stack_pop_pointer() : () -> i64
      %10698 = func.call @cc_cons(%10697, %10696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_607 = arith.constant 0 : i64
      %10699 = arith.addi %10698, %__rlasp_stack_elide_zero_607 : i64
      %10700 = func.call @stack_pop_pointer() : () -> i64
      %10701 = func.call @cc_cons(%10700, %10699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_608 = arith.constant 0 : i64
      %10702 = arith.addi %10701, %__rlasp_stack_elide_zero_608 : i64
      %10703 = func.call @stack_pop_pointer() : () -> i64
      %10704 = func.call @cc_cons(%10703, %10702) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_609 = arith.constant 0 : i64
      %10705 = arith.addi %10704, %__rlasp_stack_elide_zero_609 : i64
      %10706 = func.call @stack_pop_pointer() : () -> i64
      %10707 = func.call @cc_cons(%10706, %10705) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_610 = arith.constant 0 : i64
      %10708 = arith.addi %10707, %__rlasp_stack_elide_zero_610 : i64
      %10709 = func.call @stack_pop_pointer() : () -> i64
      %10710 = func.call @cc_cons(%10709, %10708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_611 = arith.constant 0 : i64
      %10711 = arith.addi %10710, %__rlasp_stack_elide_zero_611 : i64
      %10712 = func.call @stack_pop_pointer() : () -> i64
      %10713 = func.call @cc_cons(%10712, %10711) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_612 = arith.constant 0 : i64
      %10714 = arith.addi %10713, %__rlasp_stack_elide_zero_612 : i64
      %10715 = func.call @stack_pop_pointer() : () -> i64
      %10716 = func.call @cc_cons(%10715, %10714) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_613 = arith.constant 0 : i64
      %10717 = arith.addi %10716, %__rlasp_stack_elide_zero_613 : i64
      %10718 = func.call @stack_pop_pointer() : () -> i64
      %10719 = func.call @cc_cons(%10718, %10717) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_614 = arith.constant 0 : i64
      %10720 = arith.addi %10719, %__rlasp_stack_elide_zero_614 : i64
      %10721 = func.call @stack_pop_pointer() : () -> i64
      %10722 = func.call @cc_cons(%10721, %10720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_615 = arith.constant 0 : i64
      %10723 = arith.addi %10722, %__rlasp_stack_elide_zero_615 : i64
      %10724 = func.call @stack_pop_pointer() : () -> i64
      %10725 = func.call @cc_cons(%10724, %10723) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_616 = arith.constant 0 : i64
      %10726 = arith.addi %10725, %__rlasp_stack_elide_zero_616 : i64
      %10727 = func.call @stack_pop_pointer() : () -> i64
      %10728 = func.call @cc_cons(%10727, %10726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_617 = arith.constant 0 : i64
      %10729 = arith.addi %10728, %__rlasp_stack_elide_zero_617 : i64
      %10730 = func.call @stack_pop_pointer() : () -> i64
      %10731 = func.call @cc_cons(%10730, %10729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_618 = arith.constant 0 : i64
      %10732 = arith.addi %10731, %__rlasp_stack_elide_zero_618 : i64
      %10733 = func.call @stack_pop_pointer() : () -> i64
      %10734 = func.call @cc_cons(%10733, %10732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_619 = arith.constant 0 : i64
      %10735 = arith.addi %10734, %__rlasp_stack_elide_zero_619 : i64
      %10736 = func.call @stack_pop_pointer() : () -> i64
      %10737 = func.call @cc_cons(%10736, %10735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_620 = arith.constant 0 : i64
      %10738 = arith.addi %10737, %__rlasp_stack_elide_zero_620 : i64
      %10739 = func.call @stack_pop_pointer() : () -> i64
      %10740 = func.call @cc_cons(%10739, %10738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_621 = arith.constant 0 : i64
      %10741 = arith.addi %10740, %__rlasp_stack_elide_zero_621 : i64
      %10742 = func.call @stack_pop_pointer() : () -> i64
      %10743 = func.call @cc_cons(%10742, %10741) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_622 = arith.constant 0 : i64
      %10744 = arith.addi %10743, %__rlasp_stack_elide_zero_622 : i64
      %10745 = func.call @stack_pop_pointer() : () -> i64
      %10746 = func.call @cc_cons(%10745, %10744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_623 = arith.constant 0 : i64
      %10747 = arith.addi %10746, %__rlasp_stack_elide_zero_623 : i64
      %10748 = func.call @stack_pop_pointer() : () -> i64
      %10749 = func.call @cc_cons(%10748, %10747) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_624 = arith.constant 0 : i64
      %10750 = arith.addi %10749, %__rlasp_stack_elide_zero_624 : i64
      %10751 = func.call @stack_pop_pointer() : () -> i64
      %10752 = func.call @cc_cons(%10751, %10750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_625 = arith.constant 0 : i64
      %10753 = arith.addi %10752, %__rlasp_stack_elide_zero_625 : i64
      %10754 = func.call @stack_pop_pointer() : () -> i64
      %10755 = func.call @cc_cons(%10754, %10753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_626 = arith.constant 0 : i64
      %10756 = arith.addi %10755, %__rlasp_stack_elide_zero_626 : i64
      %10757 = func.call @stack_pop_pointer() : () -> i64
      %10758 = func.call @cc_cons(%10757, %10756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_627 = arith.constant 0 : i64
      %10759 = arith.addi %10758, %__rlasp_stack_elide_zero_627 : i64
      %10760 = func.call @stack_pop_pointer() : () -> i64
      %10761 = func.call @cc_cons(%10760, %10759) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_628 = arith.constant 0 : i64
      %10762 = arith.addi %10761, %__rlasp_stack_elide_zero_628 : i64
      %10763 = func.call @stack_pop_pointer() : () -> i64
      %10764 = func.call @cc_cons(%10763, %10762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_629 = arith.constant 0 : i64
      %10765 = arith.addi %10764, %__rlasp_stack_elide_zero_629 : i64
      %10766 = func.call @stack_pop_pointer() : () -> i64
      %10767 = func.call @cc_cons(%10766, %10765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_630 = arith.constant 0 : i64
      %10768 = arith.addi %10767, %__rlasp_stack_elide_zero_630 : i64
      %10769 = func.call @stack_pop_pointer() : () -> i64
      %10770 = func.call @cc_cons(%10769, %10768) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_631 = arith.constant 0 : i64
      %10771 = arith.addi %10770, %__rlasp_stack_elide_zero_631 : i64
      %10772 = func.call @stack_pop_pointer() : () -> i64
      %10773 = func.call @cc_cons(%10772, %10771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_632 = arith.constant 0 : i64
      %10774 = arith.addi %10773, %__rlasp_stack_elide_zero_632 : i64
      %10775 = func.call @stack_pop_pointer() : () -> i64
      %10776 = func.call @cc_cons(%10775, %10774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_633 = arith.constant 0 : i64
      %10777 = arith.addi %10776, %__rlasp_stack_elide_zero_633 : i64
      %10778 = func.call @stack_pop_pointer() : () -> i64
      %10779 = func.call @cc_cons(%10778, %10777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_634 = arith.constant 0 : i64
      %10780 = arith.addi %10779, %__rlasp_stack_elide_zero_634 : i64
      %10781 = func.call @stack_pop_pointer() : () -> i64
      %10782 = func.call @cc_cons(%10781, %10780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_635 = arith.constant 0 : i64
      %10783 = arith.addi %10782, %__rlasp_stack_elide_zero_635 : i64
      %10784 = func.call @stack_pop_pointer() : () -> i64
      %10785 = func.call @cc_cons(%10784, %10783) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_636 = arith.constant 0 : i64
      %10786 = arith.addi %10785, %__rlasp_stack_elide_zero_636 : i64
      %10787 = func.call @stack_pop_pointer() : () -> i64
      %10788 = func.call @cc_cons(%10787, %10786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_637 = arith.constant 0 : i64
      %10789 = arith.addi %10788, %__rlasp_stack_elide_zero_637 : i64
      %10790 = func.call @stack_pop_pointer() : () -> i64
      %10791 = func.call @cc_cons(%10790, %10789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_638 = arith.constant 0 : i64
      %10792 = arith.addi %10791, %__rlasp_stack_elide_zero_638 : i64
      %10793 = func.call @stack_pop_pointer() : () -> i64
      %10794 = func.call @cc_cons(%10793, %10792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_639 = arith.constant 0 : i64
      %10795 = arith.addi %10794, %__rlasp_stack_elide_zero_639 : i64
      %10796 = func.call @stack_pop_pointer() : () -> i64
      %10797 = func.call @cc_cons(%10796, %10795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_640 = arith.constant 0 : i64
      %10798 = arith.addi %10797, %__rlasp_stack_elide_zero_640 : i64
      %10799 = func.call @stack_pop_pointer() : () -> i64
      %10800 = func.call @cc_cons(%10799, %10798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_641 = arith.constant 0 : i64
      %10801 = arith.addi %10800, %__rlasp_stack_elide_zero_641 : i64
      %10802 = func.call @stack_pop_pointer() : () -> i64
      %10803 = func.call @cc_cons(%10802, %10801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_642 = arith.constant 0 : i64
      %10804 = arith.addi %10803, %__rlasp_stack_elide_zero_642 : i64
      %10805 = func.call @stack_pop_pointer() : () -> i64
      %10806 = func.call @cc_cons(%10805, %10804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_643 = arith.constant 0 : i64
      %10807 = arith.addi %10806, %__rlasp_stack_elide_zero_643 : i64
      %10808 = func.call @stack_pop_pointer() : () -> i64
      %10809 = func.call @cc_cons(%10808, %10807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_644 = arith.constant 0 : i64
      %10810 = arith.addi %10809, %__rlasp_stack_elide_zero_644 : i64
      %10811 = func.call @stack_pop_pointer() : () -> i64
      %10812 = func.call @cc_cons(%10811, %10810) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_645 = arith.constant 0 : i64
      %10813 = arith.addi %10812, %__rlasp_stack_elide_zero_645 : i64
      %10814 = func.call @stack_pop_pointer() : () -> i64
      %10815 = func.call @cc_cons(%10814, %10813) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_646 = arith.constant 0 : i64
      %10816 = arith.addi %10815, %__rlasp_stack_elide_zero_646 : i64
      %10817 = func.call @stack_pop_pointer() : () -> i64
      %10818 = func.call @cc_cons(%10817, %10816) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_647 = arith.constant 0 : i64
      %10819 = arith.addi %10818, %__rlasp_stack_elide_zero_647 : i64
      %10820 = func.call @stack_pop_pointer() : () -> i64
      %10821 = func.call @cc_cons(%10820, %10819) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_648 = arith.constant 0 : i64
      %10822 = arith.addi %10821, %__rlasp_stack_elide_zero_648 : i64
      %10823 = func.call @stack_pop_pointer() : () -> i64
      %10824 = func.call @cc_cons(%10823, %10822) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_649 = arith.constant 0 : i64
      %10825 = arith.addi %10824, %__rlasp_stack_elide_zero_649 : i64
      %10826 = func.call @stack_pop_pointer() : () -> i64
      %10827 = func.call @cc_cons(%10826, %10825) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_650 = arith.constant 0 : i64
      %10828 = arith.addi %10827, %__rlasp_stack_elide_zero_650 : i64
      %10829 = func.call @stack_pop_pointer() : () -> i64
      %10830 = func.call @cc_cons(%10829, %10828) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_651 = arith.constant 0 : i64
      %10831 = arith.addi %10830, %__rlasp_stack_elide_zero_651 : i64
      %10832 = func.call @stack_pop_pointer() : () -> i64
      %10833 = func.call @cc_cons(%10832, %10831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_652 = arith.constant 0 : i64
      %10834 = arith.addi %10833, %__rlasp_stack_elide_zero_652 : i64
      %10835 = func.call @stack_pop_pointer() : () -> i64
      %10836 = func.call @cc_cons(%10835, %10834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_653 = arith.constant 0 : i64
      %10837 = arith.addi %10836, %__rlasp_stack_elide_zero_653 : i64
      %10838 = func.call @stack_pop_pointer() : () -> i64
      %10839 = func.call @cc_cons(%10838, %10837) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_654 = arith.constant 0 : i64
      %10840 = arith.addi %10839, %__rlasp_stack_elide_zero_654 : i64
      %10841 = func.call @stack_pop_pointer() : () -> i64
      %10842 = func.call @cc_cons(%10841, %10840) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_655 = arith.constant 0 : i64
      %10843 = arith.addi %10842, %__rlasp_stack_elide_zero_655 : i64
      %10844 = func.call @stack_pop_pointer() : () -> i64
      %10845 = func.call @cc_cons(%10844, %10843) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_656 = arith.constant 0 : i64
      %10846 = arith.addi %10845, %__rlasp_stack_elide_zero_656 : i64
      %10847 = func.call @stack_pop_pointer() : () -> i64
      %10848 = func.call @cc_cons(%10847, %10846) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_657 = arith.constant 0 : i64
      %10849 = arith.addi %10848, %__rlasp_stack_elide_zero_657 : i64
      %10850 = func.call @stack_pop_pointer() : () -> i64
      %10851 = func.call @cc_cons(%10850, %10849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_658 = arith.constant 0 : i64
      %10852 = arith.addi %10851, %__rlasp_stack_elide_zero_658 : i64
      %10853 = func.call @stack_pop_pointer() : () -> i64
      %10854 = func.call @cc_cons(%10853, %10852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_659 = arith.constant 0 : i64
      %10855 = arith.addi %10854, %__rlasp_stack_elide_zero_659 : i64
      %10856 = func.call @stack_pop_pointer() : () -> i64
      %10857 = func.call @cc_cons(%10856, %10855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_660 = arith.constant 0 : i64
      %10858 = arith.addi %10857, %__rlasp_stack_elide_zero_660 : i64
      %10859 = func.call @stack_pop_pointer() : () -> i64
      %10860 = func.call @cc_cons(%10859, %10858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_661 = arith.constant 0 : i64
      %10861 = arith.addi %10860, %__rlasp_stack_elide_zero_661 : i64
      %10862 = func.call @stack_pop_pointer() : () -> i64
      %10863 = func.call @cc_cons(%10862, %10861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_662 = arith.constant 0 : i64
      %10864 = arith.addi %10863, %__rlasp_stack_elide_zero_662 : i64
      %10865 = func.call @stack_pop_pointer() : () -> i64
      %10866 = func.call @cc_cons(%10865, %10864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_663 = arith.constant 0 : i64
      %10867 = arith.addi %10866, %__rlasp_stack_elide_zero_663 : i64
      %10868 = func.call @stack_pop_pointer() : () -> i64
      %10869 = func.call @cc_cons(%10868, %10867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_664 = arith.constant 0 : i64
      %10870 = arith.addi %10869, %__rlasp_stack_elide_zero_664 : i64
      %10871 = func.call @stack_pop_pointer() : () -> i64
      %10872 = func.call @cc_cons(%10871, %10870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_665 = arith.constant 0 : i64
      %10873 = arith.addi %10872, %__rlasp_stack_elide_zero_665 : i64
      %10874 = func.call @stack_pop_pointer() : () -> i64
      %10875 = func.call @cc_cons(%10874, %10873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_666 = arith.constant 0 : i64
      %10876 = arith.addi %10875, %__rlasp_stack_elide_zero_666 : i64
      %10877 = func.call @stack_pop_pointer() : () -> i64
      %10878 = func.call @cc_cons(%10877, %10876) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_667 = arith.constant 0 : i64
      %10879 = arith.addi %10878, %__rlasp_stack_elide_zero_667 : i64
      %10880 = func.call @stack_pop_pointer() : () -> i64
      %10881 = func.call @cc_cons(%10880, %10879) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_668 = arith.constant 0 : i64
      %10882 = arith.addi %10881, %__rlasp_stack_elide_zero_668 : i64
      %10883 = func.call @stack_pop_pointer() : () -> i64
      %10884 = func.call @cc_cons(%10883, %10882) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_669 = arith.constant 0 : i64
      %10885 = arith.addi %10884, %__rlasp_stack_elide_zero_669 : i64
      %10886 = func.call @stack_pop_pointer() : () -> i64
      %10887 = func.call @cc_cons(%10886, %10885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_670 = arith.constant 0 : i64
      %10888 = arith.addi %10887, %__rlasp_stack_elide_zero_670 : i64
      %10889 = func.call @stack_pop_pointer() : () -> i64
      %10890 = func.call @cc_cons(%10889, %10888) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_671 = arith.constant 0 : i64
      %10891 = arith.addi %10890, %__rlasp_stack_elide_zero_671 : i64
      %10892 = func.call @stack_pop_pointer() : () -> i64
      %10893 = func.call @cc_cons(%10892, %10891) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_672 = arith.constant 0 : i64
      %10894 = arith.addi %10893, %__rlasp_stack_elide_zero_672 : i64
      %10895 = func.call @stack_pop_pointer() : () -> i64
      %10896 = func.call @cc_cons(%10895, %10894) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_673 = arith.constant 0 : i64
      %10897 = arith.addi %10896, %__rlasp_stack_elide_zero_673 : i64
      %10898 = func.call @stack_pop_pointer() : () -> i64
      %10899 = func.call @cc_cons(%10898, %10897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_674 = arith.constant 0 : i64
      %10900 = arith.addi %10899, %__rlasp_stack_elide_zero_674 : i64
      %10901 = func.call @stack_pop_pointer() : () -> i64
      %10902 = func.call @cc_cons(%10901, %10900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_675 = arith.constant 0 : i64
      %10903 = arith.addi %10902, %__rlasp_stack_elide_zero_675 : i64
      %10904 = func.call @stack_pop_pointer() : () -> i64
      %10905 = func.call @cc_cons(%10904, %10903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_676 = arith.constant 0 : i64
      %10906 = arith.addi %10905, %__rlasp_stack_elide_zero_676 : i64
      %10907 = func.call @stack_pop_pointer() : () -> i64
      %10908 = func.call @cc_cons(%10907, %10906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_677 = arith.constant 0 : i64
      %10909 = arith.addi %10908, %__rlasp_stack_elide_zero_677 : i64
      %10910 = func.call @stack_pop_pointer() : () -> i64
      %10911 = func.call @cc_cons(%10910, %10909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_678 = arith.constant 0 : i64
      %10912 = arith.addi %10911, %__rlasp_stack_elide_zero_678 : i64
      %10913 = func.call @stack_pop_pointer() : () -> i64
      %10914 = func.call @cc_cons(%10913, %10912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_679 = arith.constant 0 : i64
      %10915 = arith.addi %10914, %__rlasp_stack_elide_zero_679 : i64
      %10916 = func.call @stack_pop_pointer() : () -> i64
      %10917 = func.call @cc_cons(%10916, %10915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_680 = arith.constant 0 : i64
      %10918 = arith.addi %10917, %__rlasp_stack_elide_zero_680 : i64
      %10919 = func.call @stack_pop_pointer() : () -> i64
      %10920 = func.call @cc_cons(%10919, %10918) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_681 = arith.constant 0 : i64
      %10921 = arith.addi %10920, %__rlasp_stack_elide_zero_681 : i64
      %10922 = func.call @stack_pop_pointer() : () -> i64
      %10923 = func.call @cc_cons(%10922, %10921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_682 = arith.constant 0 : i64
      %10924 = arith.addi %10923, %__rlasp_stack_elide_zero_682 : i64
      %10925 = func.call @stack_pop_pointer() : () -> i64
      %10926 = func.call @cc_cons(%10925, %10924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_683 = arith.constant 0 : i64
      %10927 = arith.addi %10926, %__rlasp_stack_elide_zero_683 : i64
      %10928 = func.call @stack_pop_pointer() : () -> i64
      %10929 = func.call @cc_cons(%10928, %10927) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_684 = arith.constant 0 : i64
      %10930 = arith.addi %10929, %__rlasp_stack_elide_zero_684 : i64
      %10931 = func.call @stack_pop_pointer() : () -> i64
      %10932 = func.call @cc_cons(%10931, %10930) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_685 = arith.constant 0 : i64
      %10933 = arith.addi %10932, %__rlasp_stack_elide_zero_685 : i64
      %10934 = func.call @stack_pop_pointer() : () -> i64
      %10935 = func.call @cc_cons(%10934, %10933) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_686 = arith.constant 0 : i64
      %10936 = arith.addi %10935, %__rlasp_stack_elide_zero_686 : i64
      %10937 = func.call @stack_pop_pointer() : () -> i64
      %10938 = func.call @cc_cons(%10937, %10936) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_687 = arith.constant 0 : i64
      %10939 = arith.addi %10938, %__rlasp_stack_elide_zero_687 : i64
      %10940 = func.call @stack_pop_pointer() : () -> i64
      %10941 = func.call @cc_cons(%10940, %10939) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_688 = arith.constant 0 : i64
      %10942 = arith.addi %10941, %__rlasp_stack_elide_zero_688 : i64
      %10943 = func.call @stack_pop_pointer() : () -> i64
      %10944 = func.call @cc_cons(%10943, %10942) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_689 = arith.constant 0 : i64
      %10945 = arith.addi %10944, %__rlasp_stack_elide_zero_689 : i64
      %10946 = func.call @stack_pop_pointer() : () -> i64
      %10947 = func.call @cc_cons(%10946, %10945) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_690 = arith.constant 0 : i64
      %10948 = arith.addi %10947, %__rlasp_stack_elide_zero_690 : i64
      %10949 = func.call @stack_pop_pointer() : () -> i64
      %10950 = func.call @cc_cons(%10949, %10948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_691 = arith.constant 0 : i64
      %10951 = arith.addi %10950, %__rlasp_stack_elide_zero_691 : i64
      %10952 = func.call @stack_pop_pointer() : () -> i64
      %10953 = func.call @cc_cons(%10952, %10951) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_692 = arith.constant 0 : i64
      %10954 = arith.addi %10953, %__rlasp_stack_elide_zero_692 : i64
      %10955 = func.call @stack_pop_pointer() : () -> i64
      %10956 = func.call @cc_cons(%10955, %10954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_693 = arith.constant 0 : i64
      %10957 = arith.addi %10956, %__rlasp_stack_elide_zero_693 : i64
      %10958 = func.call @stack_pop_pointer() : () -> i64
      %10959 = func.call @cc_cons(%10958, %10957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_694 = arith.constant 0 : i64
      %10960 = arith.addi %10959, %__rlasp_stack_elide_zero_694 : i64
      %10961 = func.call @stack_pop_pointer() : () -> i64
      %10962 = func.call @cc_cons(%10961, %10960) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_695 = arith.constant 0 : i64
      %10963 = arith.addi %10962, %__rlasp_stack_elide_zero_695 : i64
      %10964 = func.call @stack_pop_pointer() : () -> i64
      %10965 = func.call @cc_cons(%10964, %10963) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_696 = arith.constant 0 : i64
      %10966 = arith.addi %10965, %__rlasp_stack_elide_zero_696 : i64
      %10967 = func.call @stack_pop_pointer() : () -> i64
      %10968 = func.call @cc_cons(%10967, %10966) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_697 = arith.constant 0 : i64
      %10969 = arith.addi %10968, %__rlasp_stack_elide_zero_697 : i64
      %10970 = func.call @stack_pop_pointer() : () -> i64
      %10971 = func.call @cc_cons(%10970, %10969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_698 = arith.constant 0 : i64
      %10972 = arith.addi %10971, %__rlasp_stack_elide_zero_698 : i64
      %10973 = func.call @stack_pop_pointer() : () -> i64
      %10974 = func.call @cc_cons(%10973, %10972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_699 = arith.constant 0 : i64
      %10975 = arith.addi %10974, %__rlasp_stack_elide_zero_699 : i64
      %10976 = func.call @stack_pop_pointer() : () -> i64
      %10977 = func.call @cc_cons(%10976, %10975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_700 = arith.constant 0 : i64
      %10978 = arith.addi %10977, %__rlasp_stack_elide_zero_700 : i64
      %10979 = func.call @stack_pop_pointer() : () -> i64
      %10980 = func.call @cc_cons(%10979, %10978) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_701 = arith.constant 0 : i64
      %10981 = arith.addi %10980, %__rlasp_stack_elide_zero_701 : i64
      %10982 = func.call @stack_pop_pointer() : () -> i64
      %10983 = func.call @cc_cons(%10982, %10981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_702 = arith.constant 0 : i64
      %10984 = arith.addi %10983, %__rlasp_stack_elide_zero_702 : i64
      %10985 = func.call @stack_pop_pointer() : () -> i64
      %10986 = func.call @cc_cons(%10985, %10984) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_703 = arith.constant 0 : i64
      %10987 = arith.addi %10986, %__rlasp_stack_elide_zero_703 : i64
      %10988 = func.call @stack_pop_pointer() : () -> i64
      %10989 = func.call @cc_cons(%10988, %10987) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_704 = arith.constant 0 : i64
      %10990 = arith.addi %10989, %__rlasp_stack_elide_zero_704 : i64
      %10991 = func.call @stack_pop_pointer() : () -> i64
      %10992 = func.call @cc_cons(%10991, %10990) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_705 = arith.constant 0 : i64
      %10993 = arith.addi %10992, %__rlasp_stack_elide_zero_705 : i64
      %10994 = func.call @stack_pop_pointer() : () -> i64
      %10995 = func.call @cc_cons(%10994, %10993) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_706 = arith.constant 0 : i64
      %10996 = arith.addi %10995, %__rlasp_stack_elide_zero_706 : i64
      %10997 = func.call @stack_pop_pointer() : () -> i64
      %10998 = func.call @cc_cons(%10997, %10996) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_707 = arith.constant 0 : i64
      %10999 = arith.addi %10998, %__rlasp_stack_elide_zero_707 : i64
      %11000 = func.call @stack_pop_pointer() : () -> i64
      %11001 = func.call @cc_cons(%11000, %10999) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_708 = arith.constant 0 : i64
      %11002 = arith.addi %11001, %__rlasp_stack_elide_zero_708 : i64
      %11003 = func.call @stack_pop_pointer() : () -> i64
      %11004 = func.call @cc_cons(%11003, %11002) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_709 = arith.constant 0 : i64
      %11005 = arith.addi %11004, %__rlasp_stack_elide_zero_709 : i64
      %11006 = func.call @stack_pop_pointer() : () -> i64
      %11007 = func.call @cc_cons(%11006, %11005) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_710 = arith.constant 0 : i64
      %11008 = arith.addi %11007, %__rlasp_stack_elide_zero_710 : i64
      %11009 = func.call @stack_pop_pointer() : () -> i64
      %11010 = func.call @cc_cons(%11009, %11008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_711 = arith.constant 0 : i64
      %11011 = arith.addi %11010, %__rlasp_stack_elide_zero_711 : i64
      %11012 = func.call @stack_pop_pointer() : () -> i64
      %11013 = func.call @cc_cons(%11012, %11011) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_712 = arith.constant 0 : i64
      %11014 = arith.addi %11013, %__rlasp_stack_elide_zero_712 : i64
      %11015 = func.call @stack_pop_pointer() : () -> i64
      %11016 = func.call @cc_cons(%11015, %11014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_713 = arith.constant 0 : i64
      %11017 = arith.addi %11016, %__rlasp_stack_elide_zero_713 : i64
      %11018 = func.call @stack_pop_pointer() : () -> i64
      %11019 = func.call @cc_cons(%11018, %11017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_714 = arith.constant 0 : i64
      %11020 = arith.addi %11019, %__rlasp_stack_elide_zero_714 : i64
      %11021 = func.call @stack_pop_pointer() : () -> i64
      %11022 = func.call @cc_cons(%11021, %11020) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_715 = arith.constant 0 : i64
      %11023 = arith.addi %11022, %__rlasp_stack_elide_zero_715 : i64
      %11024 = func.call @stack_pop_pointer() : () -> i64
      %11025 = func.call @cc_cons(%11024, %11023) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_716 = arith.constant 0 : i64
      %11026 = arith.addi %11025, %__rlasp_stack_elide_zero_716 : i64
      %11027 = func.call @stack_pop_pointer() : () -> i64
      %11028 = func.call @cc_cons(%11027, %11026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_717 = arith.constant 0 : i64
      %11029 = arith.addi %11028, %__rlasp_stack_elide_zero_717 : i64
      %11030 = func.call @stack_pop_pointer() : () -> i64
      %11031 = func.call @cc_cons(%11030, %11029) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_718 = arith.constant 0 : i64
      %11032 = arith.addi %11031, %__rlasp_stack_elide_zero_718 : i64
      %11033 = func.call @stack_pop_pointer() : () -> i64
      %11034 = func.call @cc_cons(%11033, %11032) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_719 = arith.constant 0 : i64
      %11035 = arith.addi %11034, %__rlasp_stack_elide_zero_719 : i64
      %11036 = func.call @stack_pop_pointer() : () -> i64
      %11037 = func.call @cc_cons(%11036, %11035) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_720 = arith.constant 0 : i64
      %11038 = arith.addi %11037, %__rlasp_stack_elide_zero_720 : i64
      %11039 = func.call @stack_pop_pointer() : () -> i64
      %11040 = func.call @cc_cons(%11039, %11038) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_721 = arith.constant 0 : i64
      %11041 = arith.addi %11040, %__rlasp_stack_elide_zero_721 : i64
      %11042 = func.call @stack_pop_pointer() : () -> i64
      %11043 = func.call @cc_cons(%11042, %11041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_722 = arith.constant 0 : i64
      %11044 = arith.addi %11043, %__rlasp_stack_elide_zero_722 : i64
      %11045 = func.call @stack_pop_pointer() : () -> i64
      %11046 = func.call @cc_cons(%11045, %11044) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_723 = arith.constant 0 : i64
      %11047 = arith.addi %11046, %__rlasp_stack_elide_zero_723 : i64
      %11048 = func.call @stack_pop_pointer() : () -> i64
      %11049 = func.call @cc_cons(%11048, %11047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_724 = arith.constant 0 : i64
      %11050 = arith.addi %11049, %__rlasp_stack_elide_zero_724 : i64
      %11051 = func.call @stack_pop_pointer() : () -> i64
      %11052 = func.call @cc_cons(%11051, %11050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_725 = arith.constant 0 : i64
      %11053 = arith.addi %11052, %__rlasp_stack_elide_zero_725 : i64
      %11054 = func.call @stack_pop_pointer() : () -> i64
      %11055 = func.call @cc_cons(%11054, %11053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_726 = arith.constant 0 : i64
      %11056 = arith.addi %11055, %__rlasp_stack_elide_zero_726 : i64
      %11057 = func.call @stack_pop_pointer() : () -> i64
      %11058 = func.call @cc_cons(%11057, %11056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_727 = arith.constant 0 : i64
      %11059 = arith.addi %11058, %__rlasp_stack_elide_zero_727 : i64
      %11060 = func.call @stack_pop_pointer() : () -> i64
      %11061 = func.call @cc_cons(%11060, %11059) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_728 = arith.constant 0 : i64
      %11062 = arith.addi %11061, %__rlasp_stack_elide_zero_728 : i64
      %11063 = func.call @stack_pop_pointer() : () -> i64
      %11064 = func.call @cc_cons(%11063, %11062) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_729 = arith.constant 0 : i64
      %11065 = arith.addi %11064, %__rlasp_stack_elide_zero_729 : i64
      %11066 = func.call @stack_pop_pointer() : () -> i64
      %11067 = func.call @cc_cons(%11066, %11065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_730 = arith.constant 0 : i64
      %11068 = arith.addi %11067, %__rlasp_stack_elide_zero_730 : i64
      %11069 = func.call @stack_pop_pointer() : () -> i64
      %11070 = func.call @cc_cons(%11069, %11068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_731 = arith.constant 0 : i64
      %11071 = arith.addi %11070, %__rlasp_stack_elide_zero_731 : i64
      %11072 = func.call @stack_pop_pointer() : () -> i64
      %11073 = func.call @cc_cons(%11072, %11071) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_732 = arith.constant 0 : i64
      %11074 = arith.addi %11073, %__rlasp_stack_elide_zero_732 : i64
      %11075 = func.call @stack_pop_pointer() : () -> i64
      %11076 = func.call @cc_cons(%11075, %11074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_733 = arith.constant 0 : i64
      %11077 = arith.addi %11076, %__rlasp_stack_elide_zero_733 : i64
      %11078 = func.call @stack_pop_pointer() : () -> i64
      %11079 = func.call @cc_cons(%11078, %11077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_734 = arith.constant 0 : i64
      %11080 = arith.addi %11079, %__rlasp_stack_elide_zero_734 : i64
      %11081 = func.call @stack_pop_pointer() : () -> i64
      %11082 = func.call @cc_cons(%11081, %11080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_735 = arith.constant 0 : i64
      %11083 = arith.addi %11082, %__rlasp_stack_elide_zero_735 : i64
      %11084 = func.call @stack_pop_pointer() : () -> i64
      %11085 = func.call @cc_cons(%11084, %11083) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_736 = arith.constant 0 : i64
      %11086 = arith.addi %11085, %__rlasp_stack_elide_zero_736 : i64
      %11087 = func.call @stack_pop_pointer() : () -> i64
      %11088 = func.call @cc_cons(%11087, %11086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_737 = arith.constant 0 : i64
      %11089 = arith.addi %11088, %__rlasp_stack_elide_zero_737 : i64
      %11090 = func.call @stack_pop_pointer() : () -> i64
      %11091 = func.call @cc_cons(%11090, %11089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_738 = arith.constant 0 : i64
      %11092 = arith.addi %11091, %__rlasp_stack_elide_zero_738 : i64
      %11093 = func.call @stack_pop_pointer() : () -> i64
      %11094 = func.call @cc_cons(%11093, %11092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_739 = arith.constant 0 : i64
      %11095 = arith.addi %11094, %__rlasp_stack_elide_zero_739 : i64
      %11096 = func.call @stack_pop_pointer() : () -> i64
      %11097 = func.call @cc_cons(%11096, %11095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_740 = arith.constant 0 : i64
      %11098 = arith.addi %11097, %__rlasp_stack_elide_zero_740 : i64
      %11099 = func.call @stack_pop_pointer() : () -> i64
      %11100 = func.call @cc_cons(%11099, %11098) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_741 = arith.constant 0 : i64
      %11101 = arith.addi %11100, %__rlasp_stack_elide_zero_741 : i64
      %11102 = func.call @stack_pop_pointer() : () -> i64
      %11103 = func.call @cc_cons(%11102, %11101) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_742 = arith.constant 0 : i64
      %11104 = arith.addi %11103, %__rlasp_stack_elide_zero_742 : i64
      %11105 = func.call @stack_pop_pointer() : () -> i64
      %11106 = func.call @cc_cons(%11105, %11104) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_743 = arith.constant 0 : i64
      %11107 = arith.addi %11106, %__rlasp_stack_elide_zero_743 : i64
      %11108 = func.call @stack_pop_pointer() : () -> i64
      %11109 = func.call @cc_cons(%11108, %11107) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_744 = arith.constant 0 : i64
      %11110 = arith.addi %11109, %__rlasp_stack_elide_zero_744 : i64
      %11111 = func.call @stack_pop_pointer() : () -> i64
      %11112 = func.call @cc_cons(%11111, %11110) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_745 = arith.constant 0 : i64
      %11113 = arith.addi %11112, %__rlasp_stack_elide_zero_745 : i64
      %11114 = func.call @stack_pop_pointer() : () -> i64
      %11115 = func.call @cc_cons(%11114, %11113) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_746 = arith.constant 0 : i64
      %11116 = arith.addi %11115, %__rlasp_stack_elide_zero_746 : i64
      %11117 = func.call @stack_pop_pointer() : () -> i64
      %11118 = func.call @cc_cons(%11117, %11116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_747 = arith.constant 0 : i64
      %11119 = arith.addi %11118, %__rlasp_stack_elide_zero_747 : i64
      %11120 = func.call @stack_pop_pointer() : () -> i64
      %11121 = func.call @cc_cons(%11120, %11119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_748 = arith.constant 0 : i64
      %11122 = arith.addi %11121, %__rlasp_stack_elide_zero_748 : i64
      %11123 = func.call @stack_pop_pointer() : () -> i64
      %11124 = func.call @cc_cons(%11123, %11122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_749 = arith.constant 0 : i64
      %11125 = arith.addi %11124, %__rlasp_stack_elide_zero_749 : i64
      %11126 = func.call @stack_pop_pointer() : () -> i64
      %11127 = func.call @cc_cons(%11126, %11125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_750 = arith.constant 0 : i64
      %11128 = arith.addi %11127, %__rlasp_stack_elide_zero_750 : i64
      %11129 = func.call @stack_pop_pointer() : () -> i64
      %11130 = func.call @cc_cons(%11129, %11128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_751 = arith.constant 0 : i64
      %11131 = arith.addi %11130, %__rlasp_stack_elide_zero_751 : i64
      %11132 = func.call @stack_pop_pointer() : () -> i64
      %11133 = func.call @cc_cons(%11132, %11131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_752 = arith.constant 0 : i64
      %11134 = arith.addi %11133, %__rlasp_stack_elide_zero_752 : i64
      %11135 = func.call @stack_pop_pointer() : () -> i64
      %11136 = func.call @cc_cons(%11135, %11134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_753 = arith.constant 0 : i64
      %11137 = arith.addi %11136, %__rlasp_stack_elide_zero_753 : i64
      %11138 = func.call @stack_pop_pointer() : () -> i64
      %11139 = func.call @cc_cons(%11138, %11137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_754 = arith.constant 0 : i64
      %11140 = arith.addi %11139, %__rlasp_stack_elide_zero_754 : i64
      %11141 = func.call @stack_pop_pointer() : () -> i64
      %11142 = func.call @cc_cons(%11141, %11140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_755 = arith.constant 0 : i64
      %11143 = arith.addi %11142, %__rlasp_stack_elide_zero_755 : i64
      %11144 = func.call @stack_pop_pointer() : () -> i64
      %11145 = func.call @cc_cons(%11144, %11143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_756 = arith.constant 0 : i64
      %11146 = arith.addi %11145, %__rlasp_stack_elide_zero_756 : i64
      %11147 = func.call @stack_pop_pointer() : () -> i64
      %11148 = func.call @cc_cons(%11147, %11146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_757 = arith.constant 0 : i64
      %11149 = arith.addi %11148, %__rlasp_stack_elide_zero_757 : i64
      %11150 = func.call @stack_pop_pointer() : () -> i64
      %11151 = func.call @cc_cons(%11150, %11149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_758 = arith.constant 0 : i64
      %11152 = arith.addi %11151, %__rlasp_stack_elide_zero_758 : i64
      %11153 = func.call @stack_pop_pointer() : () -> i64
      %11154 = func.call @cc_cons(%11153, %11152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_759 = arith.constant 0 : i64
      %11155 = arith.addi %11154, %__rlasp_stack_elide_zero_759 : i64
      %11156 = func.call @stack_pop_pointer() : () -> i64
      %11157 = func.call @cc_cons(%11156, %11155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_760 = arith.constant 0 : i64
      %11158 = arith.addi %11157, %__rlasp_stack_elide_zero_760 : i64
      %11159 = func.call @stack_pop_pointer() : () -> i64
      %11160 = func.call @cc_cons(%11159, %11158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_761 = arith.constant 0 : i64
      %11161 = arith.addi %11160, %__rlasp_stack_elide_zero_761 : i64
      %11162 = func.call @stack_pop_pointer() : () -> i64
      %11163 = func.call @cc_cons(%11162, %11161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_762 = arith.constant 0 : i64
      %11164 = arith.addi %11163, %__rlasp_stack_elide_zero_762 : i64
      %11165 = func.call @stack_pop_pointer() : () -> i64
      %11166 = func.call @cc_cons(%11165, %11164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_763 = arith.constant 0 : i64
      %11167 = arith.addi %11166, %__rlasp_stack_elide_zero_763 : i64
      %11168 = func.call @stack_pop_pointer() : () -> i64
      %11169 = func.call @cc_cons(%11168, %11167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_764 = arith.constant 0 : i64
      %11170 = arith.addi %11169, %__rlasp_stack_elide_zero_764 : i64
      %11171 = func.call @stack_pop_pointer() : () -> i64
      %11172 = func.call @cc_cons(%11171, %11170) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_765 = arith.constant 0 : i64
      %11173 = arith.addi %11172, %__rlasp_stack_elide_zero_765 : i64
      %11174 = func.call @stack_pop_pointer() : () -> i64
      %11175 = func.call @cc_cons(%11174, %11173) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_766 = arith.constant 0 : i64
      %11176 = arith.addi %11175, %__rlasp_stack_elide_zero_766 : i64
      %11177 = func.call @stack_pop_pointer() : () -> i64
      %11178 = func.call @cc_cons(%11177, %11176) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_767 = arith.constant 0 : i64
      %11179 = arith.addi %11178, %__rlasp_stack_elide_zero_767 : i64
      %11180 = func.call @stack_pop_pointer() : () -> i64
      %11181 = func.call @cc_cons(%11180, %11179) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_768 = arith.constant 0 : i64
      %11182 = arith.addi %11181, %__rlasp_stack_elide_zero_768 : i64
      %11183 = func.call @stack_pop_pointer() : () -> i64
      %11184 = func.call @cc_cons(%11183, %11182) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_769 = arith.constant 0 : i64
      %11185 = arith.addi %11184, %__rlasp_stack_elide_zero_769 : i64
      %11186 = func.call @stack_pop_pointer() : () -> i64
      %11187 = func.call @cc_cons(%11186, %11185) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_770 = arith.constant 0 : i64
      %11188 = arith.addi %11187, %__rlasp_stack_elide_zero_770 : i64
      %11189 = func.call @stack_pop_pointer() : () -> i64
      %11190 = func.call @cc_cons(%11189, %11188) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_771 = arith.constant 0 : i64
      %11191 = arith.addi %11190, %__rlasp_stack_elide_zero_771 : i64
      %11192 = func.call @stack_pop_pointer() : () -> i64
      %11193 = func.call @cc_cons(%11192, %11191) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_772 = arith.constant 0 : i64
      %11194 = arith.addi %11193, %__rlasp_stack_elide_zero_772 : i64
      %11195 = func.call @stack_pop_pointer() : () -> i64
      %11196 = func.call @cc_cons(%11195, %11194) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_773 = arith.constant 0 : i64
      %11197 = arith.addi %11196, %__rlasp_stack_elide_zero_773 : i64
      %11198 = func.call @stack_pop_pointer() : () -> i64
      %11199 = func.call @cc_cons(%11198, %11197) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_774 = arith.constant 0 : i64
      %11200 = arith.addi %11199, %__rlasp_stack_elide_zero_774 : i64
      %11201 = func.call @stack_pop_pointer() : () -> i64
      %11202 = func.call @cc_cons(%11201, %11200) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_775 = arith.constant 0 : i64
      %11203 = arith.addi %11202, %__rlasp_stack_elide_zero_775 : i64
      %11204 = func.call @stack_pop_pointer() : () -> i64
      %11205 = func.call @cc_cons(%11204, %11203) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_776 = arith.constant 0 : i64
      %11206 = arith.addi %11205, %__rlasp_stack_elide_zero_776 : i64
      %11207 = func.call @stack_pop_pointer() : () -> i64
      %11208 = func.call @cc_cons(%11207, %11206) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_777 = arith.constant 0 : i64
      %11209 = arith.addi %11208, %__rlasp_stack_elide_zero_777 : i64
      %11210 = func.call @stack_pop_pointer() : () -> i64
      %11211 = func.call @cc_cons(%11210, %11209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_778 = arith.constant 0 : i64
      %11212 = arith.addi %11211, %__rlasp_stack_elide_zero_778 : i64
      %11213 = func.call @stack_pop_pointer() : () -> i64
      %11214 = func.call @cc_cons(%11213, %11212) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_779 = arith.constant 0 : i64
      %11215 = arith.addi %11214, %__rlasp_stack_elide_zero_779 : i64
      %11216 = func.call @stack_pop_pointer() : () -> i64
      %11217 = func.call @cc_cons(%11216, %11215) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_780 = arith.constant 0 : i64
      %11218 = arith.addi %11217, %__rlasp_stack_elide_zero_780 : i64
      %11219 = func.call @stack_pop_pointer() : () -> i64
      %11220 = func.call @cc_cons(%11219, %11218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_781 = arith.constant 0 : i64
      %11221 = arith.addi %11220, %__rlasp_stack_elide_zero_781 : i64
      %11222 = func.call @stack_pop_pointer() : () -> i64
      %11223 = func.call @cc_cons(%11222, %11221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_782 = arith.constant 0 : i64
      %11224 = arith.addi %11223, %__rlasp_stack_elide_zero_782 : i64
      %11225 = func.call @stack_pop_pointer() : () -> i64
      %11226 = func.call @cc_cons(%11225, %11224) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_783 = arith.constant 0 : i64
      %11227 = arith.addi %11226, %__rlasp_stack_elide_zero_783 : i64
      %11228 = func.call @stack_pop_pointer() : () -> i64
      %11229 = func.call @cc_cons(%11228, %11227) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_784 = arith.constant 0 : i64
      %11230 = arith.addi %11229, %__rlasp_stack_elide_zero_784 : i64
      %11231 = func.call @stack_pop_pointer() : () -> i64
      %11232 = func.call @cc_cons(%11231, %11230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_785 = arith.constant 0 : i64
      %11233 = arith.addi %11232, %__rlasp_stack_elide_zero_785 : i64
      %11234 = func.call @stack_pop_pointer() : () -> i64
      %11235 = func.call @cc_cons(%11234, %11233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_786 = arith.constant 0 : i64
      %11236 = arith.addi %11235, %__rlasp_stack_elide_zero_786 : i64
      %11237 = func.call @stack_pop_pointer() : () -> i64
      %11238 = func.call @cc_cons(%11237, %11236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_787 = arith.constant 0 : i64
      %11239 = arith.addi %11238, %__rlasp_stack_elide_zero_787 : i64
      %11240 = func.call @stack_pop_pointer() : () -> i64
      %11241 = func.call @cc_cons(%11240, %11239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_788 = arith.constant 0 : i64
      %11242 = arith.addi %11241, %__rlasp_stack_elide_zero_788 : i64
      %11243 = func.call @stack_pop_pointer() : () -> i64
      %11244 = func.call @cc_cons(%11243, %11242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_789 = arith.constant 0 : i64
      %11245 = arith.addi %11244, %__rlasp_stack_elide_zero_789 : i64
      %11246 = func.call @stack_pop_pointer() : () -> i64
      %11247 = func.call @cc_cons(%11246, %11245) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_790 = arith.constant 0 : i64
      %11248 = arith.addi %11247, %__rlasp_stack_elide_zero_790 : i64
      %11249 = func.call @stack_pop_pointer() : () -> i64
      %11250 = func.call @cc_cons(%11249, %11248) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_791 = arith.constant 0 : i64
      %11251 = arith.addi %11250, %__rlasp_stack_elide_zero_791 : i64
      %11252 = func.call @stack_pop_pointer() : () -> i64
      %11253 = func.call @cc_cons(%11252, %11251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_792 = arith.constant 0 : i64
      %11254 = arith.addi %11253, %__rlasp_stack_elide_zero_792 : i64
      %11255 = func.call @stack_pop_pointer() : () -> i64
      %11256 = func.call @cc_cons(%11255, %11254) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_793 = arith.constant 0 : i64
      %11257 = arith.addi %11256, %__rlasp_stack_elide_zero_793 : i64
      %11258 = func.call @stack_pop_pointer() : () -> i64
      %11259 = func.call @cc_cons(%11258, %11257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_794 = arith.constant 0 : i64
      %11260 = arith.addi %11259, %__rlasp_stack_elide_zero_794 : i64
      %11261 = func.call @stack_pop_pointer() : () -> i64
      %11262 = func.call @cc_cons(%11261, %11260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_795 = arith.constant 0 : i64
      %11263 = arith.addi %11262, %__rlasp_stack_elide_zero_795 : i64
      %11264 = func.call @stack_pop_pointer() : () -> i64
      %11265 = func.call @cc_cons(%11264, %11263) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_796 = arith.constant 0 : i64
      %11266 = arith.addi %11265, %__rlasp_stack_elide_zero_796 : i64
      %11267 = func.call @stack_pop_pointer() : () -> i64
      %11268 = func.call @cc_cons(%11267, %11266) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_797 = arith.constant 0 : i64
      %11269 = arith.addi %11268, %__rlasp_stack_elide_zero_797 : i64
      %11270 = func.call @stack_pop_pointer() : () -> i64
      %11271 = func.call @cc_cons(%11270, %11269) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_798 = arith.constant 0 : i64
      %11272 = arith.addi %11271, %__rlasp_stack_elide_zero_798 : i64
      %11273 = func.call @stack_pop_pointer() : () -> i64
      %11274 = func.call @cc_cons(%11273, %11272) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_799 = arith.constant 0 : i64
      %11275 = arith.addi %11274, %__rlasp_stack_elide_zero_799 : i64
      %11276 = func.call @stack_pop_pointer() : () -> i64
      %11277 = func.call @cc_cons(%11276, %11275) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_800 = arith.constant 0 : i64
      %11278 = arith.addi %11277, %__rlasp_stack_elide_zero_800 : i64
      %11279 = func.call @stack_pop_pointer() : () -> i64
      %11280 = func.call @cc_cons(%11279, %11278) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_801 = arith.constant 0 : i64
      %11281 = arith.addi %11280, %__rlasp_stack_elide_zero_801 : i64
      %11282 = func.call @stack_pop_pointer() : () -> i64
      %11283 = func.call @cc_cons(%11282, %11281) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_802 = arith.constant 0 : i64
      %11284 = arith.addi %11283, %__rlasp_stack_elide_zero_802 : i64
      %11285 = func.call @cc_nil_value() : () -> i64
      %11286 = func.call @cc_nil_value() : () -> i64
      %11287 = func.call @cc_errorp(%11285) : (i64) -> i64
      %11288 = arith.cmpi ne, %11287, %11286 : i64
      %11289 = scf.if %11288 -> (i64) {
        scf.yield %11285 : i64
      } else {
        %11290 = func.call @cc_nil_value() : () -> i64
        %11291 = func.call @cc_nil_value() : () -> i64
        %11292 = func.call @cc_nil_value() : () -> i64
        %11293 = func.call @cc_nil_value() : () -> i64
        %11294 = func.call @cc_errorp(%11292) : (i64) -> i64
        %11295 = arith.cmpi ne, %11294, %11293 : i64
        %11296 = scf.if %11295 -> (i64) {
          scf.yield %11292 : i64
        } else {
          %11297 = func.call @cc_nil_value() : () -> i64
          %11298 = llvm.mlir.addressof @str1317 : !llvm.ptr
          %11299 = arith.constant 38 : i64
          %11300 = func.call @cc_make_string(%11298, %11299) : (!llvm.ptr, i64) -> i64
          %11301 = func.call @cc_nil_value() : () -> i64
          %11302 = func.call @cc_intern(%11300, %11301) : (i64, i64) -> i64
          %11303 = func.call @cc_nil_value() : () -> i64
          %11304 = func.call @cc_cons(%11302, %11303) : (i64, i64) -> i64
          %11305 = func.call @cc_values_pack(%11304) : (i64) -> i64
          %11306 = func.call @cc_set_symbol_value(%11302, %11297) : (i64, i64) -> i64
          %11307 = llvm.mlir.addressof @str1318 : !llvm.ptr
          %11308 = arith.constant 39 : i64
          %11309 = func.call @cc_make_string(%11307, %11308) : (!llvm.ptr, i64) -> i64
          %11310 = func.call @cc_nil_value() : () -> i64
          %11311 = func.call @cc_intern(%11309, %11310) : (i64, i64) -> i64
          %11312 = func.call @cc_nil_value() : () -> i64
          %11313 = func.call @cc_cons(%11311, %11312) : (i64, i64) -> i64
          %11314 = func.call @cc_values_pack(%11313) : (i64) -> i64
          %11315 = func.call @cc_set_symbol_value(%11311, %11297) : (i64, i64) -> i64
          %11316 = llvm.mlir.addressof @str1319 : !llvm.ptr
          %11317 = arith.constant 40 : i64
          %11318 = func.call @cc_make_string(%11316, %11317) : (!llvm.ptr, i64) -> i64
          %11319 = func.call @cc_nil_value() : () -> i64
          %11320 = func.call @cc_intern(%11318, %11319) : (i64, i64) -> i64
          %11321 = func.call @cc_nil_value() : () -> i64
          %11322 = func.call @cc_cons(%11320, %11321) : (i64, i64) -> i64
          %11323 = func.call @cc_values_pack(%11322) : (i64) -> i64
          %11324 = func.call @cc_set_symbol_value(%11320, %11297) : (i64, i64) -> i64
          %11325:3 = scf.while (%arg0 = %11290, %arg1 = %11291, %arg2 = %11284) : (i64, i64, i64) -> (i64, i64, i64) {
            %__rlasp_stack_elide_zero_803 = arith.constant 0 : i64
            %11326 = arith.addi %arg2, %__rlasp_stack_elide_zero_803 : i64
            %11327 = func.call @cc_nil_value() : () -> i64
            %11328 = arith.cmpi ne, %11326, %11327 : i64
            %11329 = func.call @cc_nil_value() : () -> i64
            %11330 = llvm.mlir.addressof @str1320 : !llvm.ptr
            %11331 = arith.constant 38 : i64
            %11332 = func.call @cc_make_string(%11330, %11331) : (!llvm.ptr, i64) -> i64
            %11333 = func.call @cc_nil_value() : () -> i64
            %11334 = func.call @cc_intern(%11332, %11333) : (i64, i64) -> i64
            %11335 = func.call @cc_nil_value() : () -> i64
            %11336 = func.call @cc_cons(%11334, %11335) : (i64, i64) -> i64
            %11337 = func.call @cc_values_pack(%11336) : (i64) -> i64
            %11338 = func.call @cc_symbol_value(%11334) : (i64) -> i64
            %11339 = arith.cmpi ne, %11338, %11329 : i64
            %11340 = llvm.mlir.addressof @str1321 : !llvm.ptr
            %11341 = arith.constant 38 : i64
            %11342 = func.call @cc_make_string(%11340, %11341) : (!llvm.ptr, i64) -> i64
            %11343 = func.call @cc_nil_value() : () -> i64
            %11344 = func.call @cc_intern(%11342, %11343) : (i64, i64) -> i64
            %11345 = func.call @cc_nil_value() : () -> i64
            %11346 = func.call @cc_cons(%11344, %11345) : (i64, i64) -> i64
            %11347 = func.call @cc_values_pack(%11346) : (i64) -> i64
            %11348 = func.call @cc_symbol_value(%11344) : (i64) -> i64
            %11349 = arith.cmpi ne, %11348, %11329 : i64
            %11350 = arith.ori %11339, %11349 : i1
            %11351 = arith.constant 0 : i1
            %11352 = arith.cmpi eq, %11350, %11351 : i1
            %11353 = arith.andi %11328, %11352 : i1
            scf.condition(%11353) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%11354: i64, %11355: i64, %11356: i64):
            %11357 = func.call @cc_nil_value() : () -> i64
            %11358 = func.call @cc_nil_value() : () -> i64
            %11359 = func.call @cc_errorp(%11357) : (i64) -> i64
            %11360 = arith.cmpi ne, %11359, %11358 : i64
            %11361:3 = scf.if %11360 -> (i64, i64, i64) {
              scf.yield %11357, %11355, %11354 : i64, i64, i64
            } else {
              %11362 = func.call @cc_nil_value() : () -> i64
              %__rlasp_stack_elide_zero_804 = arith.constant 0 : i64
              %11363 = arith.addi %11356, %__rlasp_stack_elide_zero_804 : i64
              %11364 = func.call @cc_nil_value() : () -> i64
              %11365 = arith.cmpi eq, %11363, %11364 : i64
              %11367 = func.call @cc_t_value() : () -> i64
              %11366 = arith.select %11365, %11367, %11364 : i64
              %__rlasp_stack_elide_zero_805 = arith.constant 0 : i64
              %11368 = arith.addi %11366, %__rlasp_stack_elide_zero_805 : i64
              %11369 = func.call @cc_nil_value() : () -> i64
              %11370 = func.call @cc_cons(%11368, %11369) : (i64, i64) -> i64
              %11371 = func.call @cc_not(%11370) : (i64) -> i64
              %__rlasp_stack_elide_zero_806 = arith.constant 0 : i64
              %11372 = arith.addi %11371, %__rlasp_stack_elide_zero_806 : i64
              %__rlasp_stack_elide_zero_807 = arith.constant 0 : i64
              %11373 = arith.addi %11356, %__rlasp_stack_elide_zero_807 : i64
              %11374 = func.call @cc_is_cons(%11373) : (i64) -> i32
              %11375 = arith.constant 0 : i32
              %11376 = arith.cmpi ne, %11374, %11375 : i32
              %11377 = func.call @cc_t_value() : () -> i64
              %11378 = func.call @cc_nil_value() : () -> i64
              %11379 = arith.select %11376, %11377, %11378 : i64
              %__rlasp_stack_elide_zero_808 = arith.constant 0 : i64
              %11380 = arith.addi %11379, %__rlasp_stack_elide_zero_808 : i64
              %11381 = func.call @cc_nil_value() : () -> i64
              %11382 = func.call @cc_cons(%11380, %11381) : (i64, i64) -> i64
              %11383 = func.call @cc_not(%11382) : (i64) -> i64
              %__rlasp_stack_elide_zero_809 = arith.constant 0 : i64
              %11384 = arith.addi %11383, %__rlasp_stack_elide_zero_809 : i64
              %11385 = func.call @cc_cons(%11384, %11362) : (i64, i64) -> i64
              %11386 = func.call @cc_cons(%11372, %11385) : (i64, i64) -> i64
              %11387 = func.call @cc_and(%11386) : (i64) -> i64
              %__rlasp_stack_elide_zero_810 = arith.constant 0 : i64
              %11388 = arith.addi %11387, %__rlasp_stack_elide_zero_810 : i64
              %11389 = func.call @cc_nil_value() : () -> i64
              %11390 = arith.cmpi ne, %11388, %11389 : i64
              scf.if %11390 {
                %11391 = llvm.mlir.addressof @str1322 : !llvm.ptr
                %11392 = arith.constant 10 : i64
                %11393 = func.call @cc_make_string(%11391, %11392) : (!llvm.ptr, i64) -> i64
                %11394 = func.call @cc_nil_value() : () -> i64
                %11395 = func.call @cc_intern(%11393, %11394) : (i64, i64) -> i64
                %11396 = func.call @cc_nil_value() : () -> i64
                %11397 = func.call @cc_cons(%11395, %11396) : (i64, i64) -> i64
                %11398 = func.call @cc_values_pack(%11397) : (i64) -> i64
                %__rlasp_stack_elide_zero_811 = arith.constant 0 : i64
                %11399 = arith.addi %11395, %__rlasp_stack_elide_zero_811 : i64
                %11400 = func.call @cc_nil_value() : () -> i64
                %11401 = func.call @cc_errorp(%11399) : (i64) -> i64
                %11402 = arith.cmpi ne, %11401, %11400 : i64
                %11403 = arith.cmpi eq, %11400, %11400 : i64
                %11404 = arith.andi %11402, %11403 : i1
                %11405 = scf.if %11404 -> (i64) {
                  scf.yield %11399 : i64
                } else {
                  scf.yield %11400 : i64
                }
                %11406 = arith.cmpi ne, %11405, %11400 : i64
                scf.if %11406 {
                  func.call @stack_push_pointer(%11405) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%11399) : (i64) -> ()
                  %11407 = llvm.mlir.addressof @str1323 : !llvm.ptr
                  %11408 = func.call @cc_make_function_ref_const(%11407) : (!llvm.ptr) -> i64
                  %11409 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%11408, %11409) : (i64, i64) -> ()
                }
                %11410 = func.call @stack_pop_pointer() : () -> i64
                %11411 = func.call @cc_multiple_value_list(%11410) : (i64) -> i64
                %11412 = func.call @cc_t_value() : () -> i64
                %11413 = llvm.mlir.addressof @str1324 : !llvm.ptr
                %11414 = arith.constant 38 : i64
                %11415 = func.call @cc_make_string(%11413, %11414) : (!llvm.ptr, i64) -> i64
                %11416 = func.call @cc_nil_value() : () -> i64
                %11417 = func.call @cc_intern(%11415, %11416) : (i64, i64) -> i64
                %11418 = func.call @cc_nil_value() : () -> i64
                %11419 = func.call @cc_cons(%11417, %11418) : (i64, i64) -> i64
                %11420 = func.call @cc_values_pack(%11419) : (i64) -> i64
                %11421 = func.call @cc_set_symbol_value(%11417, %11412) : (i64, i64) -> i64
                %11422 = llvm.mlir.addressof @str1325 : !llvm.ptr
                %11423 = arith.constant 39 : i64
                %11424 = func.call @cc_make_string(%11422, %11423) : (!llvm.ptr, i64) -> i64
                %11425 = func.call @cc_nil_value() : () -> i64
                %11426 = func.call @cc_intern(%11424, %11425) : (i64, i64) -> i64
                %11427 = func.call @cc_nil_value() : () -> i64
                %11428 = func.call @cc_cons(%11426, %11427) : (i64, i64) -> i64
                %11429 = func.call @cc_values_pack(%11428) : (i64) -> i64
                %11430 = func.call @cc_set_symbol_value(%11426, %11410) : (i64, i64) -> i64
                %11431 = llvm.mlir.addressof @str1326 : !llvm.ptr
                %11432 = arith.constant 40 : i64
                %11433 = func.call @cc_make_string(%11431, %11432) : (!llvm.ptr, i64) -> i64
                %11434 = func.call @cc_nil_value() : () -> i64
                %11435 = func.call @cc_intern(%11433, %11434) : (i64, i64) -> i64
                %11436 = func.call @cc_nil_value() : () -> i64
                %11437 = func.call @cc_cons(%11435, %11436) : (i64, i64) -> i64
                %11438 = func.call @cc_values_pack(%11437) : (i64) -> i64
                %11439 = func.call @cc_set_symbol_value(%11435, %11411) : (i64, i64) -> i64
                func.call @stack_push_pointer(%11410) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %11440 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %11440, %11355, %11354 : i64, i64, i64
            }
            %11441 = func.call @cc_nil_value() : () -> i64
            %11442 = func.call @cc_errorp(%11361#0) : (i64) -> i64
            %11443 = arith.cmpi ne, %11442, %11441 : i64
            %11444:3 = scf.if %11443 -> (i64, i64, i64) {
              scf.yield %11361#0, %11361#1, %11361#2 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_812 = arith.constant 0 : i64
              %11445 = arith.addi %11356, %__rlasp_stack_elide_zero_812 : i64
              %11446 = func.call @cc_car(%11445) : (i64) -> i64
              %__rlasp_stack_elide_zero_813 = arith.constant 0 : i64
              %11447 = arith.addi %11446, %__rlasp_stack_elide_zero_813 : i64
              %__rlasp_stack_elide_zero_814 = arith.constant 0 : i64
              %11448 = arith.addi %11447, %__rlasp_stack_elide_zero_814 : i64
              scf.yield %11448, %11361#1, %11447 : i64, i64, i64
            }
            %11449 = func.call @cc_nil_value() : () -> i64
            %11450 = func.call @cc_errorp(%11444#0) : (i64) -> i64
            %11451 = arith.cmpi ne, %11450, %11449 : i64
            %11452:3 = scf.if %11451 -> (i64, i64, i64) {
              scf.yield %11444#0, %11444#1, %11444#2 : i64, i64, i64
            } else {
              %__rlasp_stack_elide_zero_815 = arith.constant 0 : i64
              %11453 = arith.addi %11444#2, %__rlasp_stack_elide_zero_815 : i64
              %11454 = func.call @cc_fboundp(%11453) : (i64) -> i64
              %__rlasp_stack_elide_zero_816 = arith.constant 0 : i64
              %11455 = arith.addi %11454, %__rlasp_stack_elide_zero_816 : i64
              %11456 = func.call @cc_nil_value() : () -> i64
              %11457 = arith.cmpi ne, %11455, %11456 : i64
              %11458:2 = scf.if %11457 -> (i64, i64) {
                %11459 = func.call @cc_nil_value() : () -> i64
                %11460 = func.call @cc_nil_value() : () -> i64
                %11461 = func.call @cc_errorp(%11459) : (i64) -> i64
                %11462 = arith.cmpi ne, %11461, %11460 : i64
                %11463:2 = scf.if %11462 -> (i64, i64) {
                  scf.yield %11459, %11444#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%11444#1) : (i64) -> ()
                  %__rlasp_stack_elide_zero_817 = arith.constant 0 : i64
                  %11464 = arith.addi %11444#2, %__rlasp_stack_elide_zero_817 : i64
                  %11465 = func.call @cc_nil_value() : () -> i64
                  %11466 = func.call @cc_errorp(%11464) : (i64) -> i64
                  %11467 = arith.cmpi ne, %11466, %11465 : i64
                  %11468 = arith.cmpi eq, %11465, %11465 : i64
                  %11469 = arith.andi %11467, %11468 : i1
                  %11470 = scf.if %11469 -> (i64) {
                    scf.yield %11464 : i64
                  } else {
                    scf.yield %11465 : i64
                  }
                  %11471 = arith.cmpi ne, %11470, %11465 : i64
                  scf.if %11471 {
                    func.call @stack_push_pointer(%11470) : (i64) -> ()
                  } else {
                    %11472 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%11472) : (i64) -> ()
                    %__rlasp_stack_elide_zero_818 = arith.constant 0 : i64
                    %11473 = arith.addi %11464, %__rlasp_stack_elide_zero_818 : i64
                    %11474 = func.call @stack_pop_pointer() : () -> i64
                    %11475 = func.call @cc_cons(%11473, %11474) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%11475) : (i64) -> ()
                  }
                  %11476 = func.call @stack_pop_pointer() : () -> i64
                  %11477 = func.call @stack_pop_pointer() : () -> i64
                  %11478 = func.call @cc_append(%11477, %11476) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_819 = arith.constant 0 : i64
                  %11479 = arith.addi %11478, %__rlasp_stack_elide_zero_819 : i64
                  %__rlasp_stack_elide_zero_820 = arith.constant 0 : i64
                  %11480 = arith.addi %11479, %__rlasp_stack_elide_zero_820 : i64
                  scf.yield %11480, %11479 : i64, i64
                }
                %__rlasp_stack_elide_zero_821 = arith.constant 0 : i64
                %11481 = arith.addi %11463#0, %__rlasp_stack_elide_zero_821 : i64
                scf.yield %11481, %11463#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %11482 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %11482, %11444#1 : i64, i64
              }
              %__rlasp_stack_elide_zero_822 = arith.constant 0 : i64
              %11483 = arith.addi %11458#0, %__rlasp_stack_elide_zero_822 : i64
              scf.yield %11483, %11458#1, %11444#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%11452#0) : (i64) -> ()
            %11484 = func.call @stack_depth() : () -> i64
            %11485 = arith.constant 0 : i64
            %11486 = arith.cmpi sgt, %11484, %11485 : i64
            scf.if %11486 {
              %11487 = func.call @stack_pop_pointer() : () -> i64
            }
            %__rlasp_stack_elide_zero_823 = arith.constant 0 : i64
            %11488 = arith.addi %11356, %__rlasp_stack_elide_zero_823 : i64
            %11489 = func.call @cc_cdr(%11488) : (i64) -> i64
            %__rlasp_stack_elide_zero_824 = arith.constant 0 : i64
            %11490 = arith.addi %11489, %__rlasp_stack_elide_zero_824 : i64
            func.call @stack_push_pointer(%11490) : (i64) -> ()
            %11491 = func.call @stack_depth() : () -> i64
            %11492 = arith.constant 0 : i64
            %11493 = arith.cmpi sgt, %11491, %11492 : i64
            scf.if %11493 {
              %11494 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %11452#2, %11452#1, %11490 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %11495 = func.call @stack_pop_pointer() : () -> i64
          %__rlasp_stack_elide_zero_825 = arith.constant 0 : i64
          %11496 = arith.addi %11325#1, %__rlasp_stack_elide_zero_825 : i64
          %11497 = func.call @cc_multiple_value_list(%11496) : (i64) -> i64
          %11498 = llvm.mlir.addressof @str1327 : !llvm.ptr
          %11499 = arith.constant 38 : i64
          %11500 = func.call @cc_make_string(%11498, %11499) : (!llvm.ptr, i64) -> i64
          %11501 = func.call @cc_nil_value() : () -> i64
          %11502 = func.call @cc_intern(%11500, %11501) : (i64, i64) -> i64
          %11503 = func.call @cc_nil_value() : () -> i64
          %11504 = func.call @cc_cons(%11502, %11503) : (i64, i64) -> i64
          %11505 = func.call @cc_values_pack(%11504) : (i64) -> i64
          %11506 = func.call @cc_symbol_value(%11502) : (i64) -> i64
          %11507 = llvm.mlir.addressof @str1328 : !llvm.ptr
          %11508 = arith.constant 39 : i64
          %11509 = func.call @cc_make_string(%11507, %11508) : (!llvm.ptr, i64) -> i64
          %11510 = func.call @cc_nil_value() : () -> i64
          %11511 = func.call @cc_intern(%11509, %11510) : (i64, i64) -> i64
          %11512 = func.call @cc_nil_value() : () -> i64
          %11513 = func.call @cc_cons(%11511, %11512) : (i64, i64) -> i64
          %11514 = func.call @cc_values_pack(%11513) : (i64) -> i64
          %11515 = func.call @cc_symbol_value(%11511) : (i64) -> i64
          %11516 = llvm.mlir.addressof @str1329 : !llvm.ptr
          %11517 = arith.constant 40 : i64
          %11518 = func.call @cc_make_string(%11516, %11517) : (!llvm.ptr, i64) -> i64
          %11519 = func.call @cc_nil_value() : () -> i64
          %11520 = func.call @cc_intern(%11518, %11519) : (i64, i64) -> i64
          %11521 = func.call @cc_nil_value() : () -> i64
          %11522 = func.call @cc_cons(%11520, %11521) : (i64, i64) -> i64
          %11523 = func.call @cc_values_pack(%11522) : (i64) -> i64
          %11524 = func.call @cc_symbol_value(%11520) : (i64) -> i64
          %11525 = func.call @cc_nil_value() : () -> i64
          %11526 = arith.cmpi ne, %11506, %11525 : i64
          %11527 = scf.if %11526 -> (i64) {
            scf.yield %11524 : i64
          } else {
            scf.yield %11497 : i64
          }
          %11528 = func.call @cc_values_pack(%11527) : (i64) -> i64
          %__rlasp_stack_elide_zero_826 = arith.constant 0 : i64
          %11529 = arith.addi %11528, %__rlasp_stack_elide_zero_826 : i64
          scf.yield %11529 : i64
        }
        %__rlasp_stack_elide_zero_827 = arith.constant 0 : i64
        %11530 = arith.addi %11296, %__rlasp_stack_elide_zero_827 : i64
        scf.yield %11530 : i64
      }
      %__rlasp_stack_elide_zero_828 = arith.constant 0 : i64
      %11531 = arith.addi %11289, %__rlasp_stack_elide_zero_828 : i64
      scf.yield %11531 : i64
    }
    func.call @stack_push_pointer(%8409) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_116254966808576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_116254966808576*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_116254966808576*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("TEST-MAKE-SYMBOL-ERROR-0\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str6("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str9("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str10("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str20("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str21("TEST-MAKE-SYMBOL-ERROR-1\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str22("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str26("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str34("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str35("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str42("TEST-MAKE-SYMBOL-ERROR-2\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str43("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str44("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str47("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str58("TEST-MAKE-SYMBOL-0\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str59("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str60("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("ABCCC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str63("ABCCC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str64("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str68("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str69("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str70("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str71("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str72("TEST-MAKE-SYMBOL-1\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str73("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str88("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str90("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str98("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str102("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str103("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str104("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str105("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str106("MAKUNBOUND-1\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str107("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str108("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str111("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("MAKUNBOUND\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str116("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str118("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str124("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str125("GENSYM-2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str126("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str127("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str130("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str133("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str134("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str140("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str141("GENSYM-3\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str142("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str143("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str145("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str146("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str162("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str163("GENSYM-4\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str164("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str165("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str167("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str168("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str173("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str176("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str182("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str183("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str184("GENSYM-5\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str185("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str187("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str188("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str190("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str191("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str192("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str193("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str194("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str196("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str200("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str202("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str203("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str204("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str205("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str206("GENSYM-6\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str207("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str208("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str209("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str210("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str211("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("12345678901234567890123456789012345678901234567890\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str213("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str216("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str217("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str220("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("12345678901234567890123456789012345678901234567890\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str229("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str230("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str233("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str238("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str239("GENSYM-7\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str240("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str241("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str242("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str249("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str252("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str254("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str255("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str258("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str262("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str263("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str265("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str268("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str269("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str270("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str271("GENSYM-8\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str272("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str273("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str275("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str276("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str277("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str282("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str283("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str288("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str289("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str290("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str291("GENSYM-9\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str292("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str293("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str295("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str296("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str297("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str298("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str299("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str304("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str306("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str307("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str308("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str309("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str310("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str312("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str313("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str314("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str315("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str316("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str317("GENSYM-10\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str318("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str319("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str321("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str322("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str323("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str326("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str327("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str328("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str333("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str334("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str335("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str339("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str340("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str341("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str342("GENTEMP-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str343("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str344("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str345("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str346("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str347("GENTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str348("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str350("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str351("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str352("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str357("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str358("BUILD-SBCL-1\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str359("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str360("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str361("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str362("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str363("SYMBOL-PLIST\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("%FN%(setf COMMON-LISP::SYMBOL-PLIST)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str368("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str369("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str370("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str371("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str373("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str375("BUILD-SBCL-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str376("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str377("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str378("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str379("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str380("GET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str381("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str382("%FN%(setf COMMON-LISP::GET)\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str383("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str384("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str386("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str387("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str389("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str390("978-SYMBOLS-COMMON-LISP-EXPORTED\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str391("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str392("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str393("DO-EXTERNAL-SYMBOLS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str394("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str395("SYM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str396("FIND-PACKAGE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str397("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str398("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str399("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str400("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str401("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str404("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("SYM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str406("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str407("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str408("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str409("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str410("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str411("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str412("#:%%DYN-CELL-116254966808596-SYM\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str413("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str414("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str415("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str416("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str417("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str418("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str419("FBOUNDP.8\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str421("CL-NON-FUNCTION-MACRO-SPECIAL-OPERATOR-SYMBOLS\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str422("&ALLOW-OTHER-KEYS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("&AUX\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("&BODY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str427("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str428("&ENVIRONMENT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str430("&KEY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str431("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str432("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str433("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str434("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str435("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str436("&WHOLE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str437("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str438("**\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str439("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str440("***\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str441("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("*BREAK-ON-SIGNALS*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str443("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("*COMPILE-FILE-PATHNAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str445("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str446("*COMPILE-FILE-TRUENAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("*COMPILE-PRINT*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("*COMPILE-VERBOSE*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str451("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str452("*DEBUG-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("*DEBUGGER-HOOK*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str455("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str456("*DEFAULT-PATHNAME-DEFAULTS*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str457("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str458("*ERROR-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str459("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str460("*FEATURES*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str461("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str462("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str463("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str464("*LOAD-PATHNAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str465("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str466("*LOAD-PRINT*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("*LOAD-TRUENAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str470("*LOAD-VERBOSE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str471("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("*MACROEXPAND-HOOK*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("*MODULES*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str475("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str476("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str477("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str478("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str479("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str481("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str482("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str483("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str485("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str487("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str489("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str490("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str491("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str492("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str493("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str494("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str495("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str496("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str497("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str498("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str499("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str501("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str503("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str504("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str505("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str506("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str507("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str508("*QUERY-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str509("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("*RANDOM-STATE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str511("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str512("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str513("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str514("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str515("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str516("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str517("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str518("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str519("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str520("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str522("*STANDARD-INPUT*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str523("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str524("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str525("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str526("*TERMINAL-IO*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str527("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str528("*TRACE-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str529("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str530("++\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str531("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str532("+++\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("//\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str535("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str536("///\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str537("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str538("ARITHMETIC-ERROR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str539("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str541("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str542("ARRAY-DIMENSION-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("ARRAY-RANK-LIMIT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str549("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str550("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str551("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str552("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str553("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str554("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str555("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str556("BOOLE-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str557("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str558("BOOLE-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str559("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str560("BOOLE-AND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str561("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str562("BOOLE-ANDC1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str564("BOOLE-ANDC2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str565("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str566("BOOLE-C1\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str567("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str568("BOOLE-C2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str569("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str570("BOOLE-CLR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str571("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str572("BOOLE-EQV\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str573("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str574("BOOLE-IOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str575("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("BOOLE-NAND\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str577("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str578("BOOLE-NOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str579("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str580("BOOLE-ORC1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str581("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str582("BOOLE-ORC2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str583("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str584("BOOLE-SET\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str585("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str586("BOOLE-XOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str587("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str588("BOOLEAN\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str589("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str590("BROADCAST-STREAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str591("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("BUILT-IN-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str593("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str594("CALL-ARGUMENTS-LIMIT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str595("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str596("CELL-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str597("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str598("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str599("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str600("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str601("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str602("COMPILATION-SPEED\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str603("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str604("COMPILED-FUNCTION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str605("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str606("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str607("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str608("CONCATENATED-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str609("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str610("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str611("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str612("CONTROL-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str613("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str614("DEBUG\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str615("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str616("DECLARATION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str617("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str618("DIVISION-BY-ZERO\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str619("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str620("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str621("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str622("DOUBLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str623("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str624("DOUBLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str625("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str626("DYNAMIC-EXTENT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str627("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str628("ECHO-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str630("END-OF-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str632("EXTENDED-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str633("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str634("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str635("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str636("FILE-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str637("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str638("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str639("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str640("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str641("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str642("FLOATING-POINT-INVALID-OPERATION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str643("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str644("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str645("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str646("FLOATING-POINT-UNDERFLOW\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str647("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("FTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str649("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str650("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str651("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str652("HASH-TABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("IGNORABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str655("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str656("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str657("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str658("INLINE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str659("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str660("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str661("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str662("INTERNAL-TIME-UNITS-PER-SECOND\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str663("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str664("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str665("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str666("LAMBDA-LIST-KEYWORDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str667("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str668("LAMBDA-PARAMETERS-LIMIT\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str669("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str670("LEAST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str671("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str672("LEAST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str673("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str674("LEAST-NEGATIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str675("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str676("LEAST-NEGATIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str677("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str678("LEAST-NEGATIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str679("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str680("LEAST-NEGATIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str681("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("LEAST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str683("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str684("LEAST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str685("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("LEAST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str687("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str688("LEAST-POSITIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str689("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str690("LEAST-POSITIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str691("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("LEAST-POSITIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str693("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str694("LEAST-POSITIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str695("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str696("LEAST-POSITIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str697("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str698("LEAST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str699("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str700("LEAST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str701("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str702("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str703("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str704("LONG-FLOAT-EPSILON\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str705("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str706("LONG-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str707("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str708("METHOD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str709("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str710("METHOD-COMBINATION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str711("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str712("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str713("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str714("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str715("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str716("MOST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str717("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str718("MOST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str719("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str720("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str721("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str722("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str723("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str724("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("MOST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str729("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str730("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str731("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str732("MULTIPLE-VALUES-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str733("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str734("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str735("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str736("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str737("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str738("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str739("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str741("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str742("PACKAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str743("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str744("PACKAGE-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str745("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str746("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str747("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str748("PI\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str749("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str750("PRINT-NOT-READABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str751("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str752("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str753("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str754("RANDOM-STATE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str755("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str756("RATIO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str757("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str758("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str759("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str760("READTABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str761("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str762("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str763("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str764("RESTART\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str765("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str766("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str767("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str768("SATISFIES\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str769("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str770("SEQUENCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str771("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str772("SERIOUS-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str773("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str774("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str775("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str776("SHORT-FLOAT-EPSILON\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str777("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str778("SHORT-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str779("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str780("SIGNED-BYTE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str781("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str782("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str783("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str784("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str785("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str786("SIMPLE-BIT-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str787("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str788("SIMPLE-CONDITION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str789("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str790("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str791("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str792("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str793("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str794("SIMPLE-TYPE-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str795("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str796("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str797("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str798("SIMPLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str799("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str800("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str801("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str802("SINGLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str803("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str804("SINGLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str805("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str806("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str807("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str808("SPECIAL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str809("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str810("SPEED\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str811("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str812("STANDARD\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str813("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str814("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str815("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str816("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str817("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str818("STANDARD-GENERIC-FUNCTION\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str819("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str820("STANDARD-METHOD\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str821("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str822("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str823("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str824("STORAGE-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str825("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str826("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str827("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str828("STREAM-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str829("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str830("STRING-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str831("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str832("STRUCTURE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str833("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str834("STRUCTURE-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str835("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str836("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str837("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str838("STYLE-WARNING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str839("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str840("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str841("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str842("SYNONYM-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str843("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str844("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str845("TWO-WAY-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str846("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str847("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str848("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str849("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str850("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str851("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str852("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str853("UNBOUND-VARIABLE\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str854("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str855("UNDEFINED-FUNCTION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str856("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str857("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str858("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str859("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str860("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str861("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str862("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str863("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str864("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str865("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str866("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str867("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str868("CL-NON-FUNCTION-MACRO-SPECIAL-OPERATOR-SYMBOLS\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str869("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str870("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str871("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str872("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str873("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str874("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str875("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str876("&ALLOW-OTHER-KEYS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str877("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str878("&AUX\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str879("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str880("&BODY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str881("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str882("&ENVIRONMENT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str883("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str884("&KEY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str885("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str886("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str887("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str888("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str889("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str890("&WHOLE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str891("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str892("**\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str893("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str894("***\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str895("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str896("*BREAK-ON-SIGNALS*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str897("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str898("*COMPILE-FILE-PATHNAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str899("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str900("*COMPILE-FILE-TRUENAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str901("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str902("*COMPILE-PRINT*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str903("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str904("*COMPILE-VERBOSE*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str905("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str906("*DEBUG-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str907("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str908("*DEBUGGER-HOOK*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str909("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str910("*DEFAULT-PATHNAME-DEFAULTS*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str911("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str912("*ERROR-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str913("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str914("*FEATURES*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str915("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str916("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str917("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str918("*LOAD-PATHNAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str919("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str920("*LOAD-PRINT*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str921("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str922("*LOAD-TRUENAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str923("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str924("*LOAD-VERBOSE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str925("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str926("*MACROEXPAND-HOOK*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str927("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str928("*MODULES*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str929("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str930("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str931("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str932("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str933("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str934("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str935("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str936("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str937("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str938("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str939("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str940("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str941("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str942("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str943("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str944("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str945("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str946("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str947("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str948("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str949("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str950("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str951("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str952("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str953("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str954("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str955("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str956("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str957("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str958("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str959("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str960("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str961("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str962("*QUERY-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str963("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str964("*RANDOM-STATE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str965("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str966("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str967("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str968("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str969("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str970("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str971("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str972("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str973("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str974("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str975("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str976("*STANDARD-INPUT*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str977("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str978("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str979("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str980("*TERMINAL-IO*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str981("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str982("*TRACE-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str983("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str984("++\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str985("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str986("+++\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str987("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str988("//\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str989("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str990("///\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str991("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str992("ARITHMETIC-ERROR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str993("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str994("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str995("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str996("ARRAY-DIMENSION-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str997("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str998("ARRAY-RANK-LIMIT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str999("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1000("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str1001("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1002("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1003("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1004("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1005("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1006("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1007("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1008("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1009("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1010("BOOLE-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1011("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1012("BOOLE-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1013("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1014("BOOLE-AND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1015("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1016("BOOLE-ANDC1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1017("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1018("BOOLE-ANDC2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1019("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1020("BOOLE-C1\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1021("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1022("BOOLE-C2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1023("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1024("BOOLE-CLR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1025("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1026("BOOLE-EQV\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1027("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1028("BOOLE-IOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1029("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1030("BOOLE-NAND\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1031("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1032("BOOLE-NOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1033("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1034("BOOLE-ORC1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1035("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1036("BOOLE-ORC2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1037("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1038("BOOLE-SET\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1039("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1040("BOOLE-XOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1041("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1042("BOOLEAN\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1043("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1044("BROADCAST-STREAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1045("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1046("BUILT-IN-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1047("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1048("CALL-ARGUMENTS-LIMIT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1049("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1050("CELL-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1051("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1052("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1053("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1054("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1055("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1056("COMPILATION-SPEED\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1057("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1058("COMPILED-FUNCTION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1059("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1060("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1061("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1062("CONCATENATED-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str1063("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1064("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1065("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1066("CONTROL-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1067("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1068("DEBUG\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1069("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1070("DECLARATION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1071("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1072("DIVISION-BY-ZERO\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1073("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1074("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1075("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1076("DOUBLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1077("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1078("DOUBLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str1079("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1080("DYNAMIC-EXTENT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1081("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1082("ECHO-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1083("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1084("END-OF-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1085("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1086("EXTENDED-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1087("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1088("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1089("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1090("FILE-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1091("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1092("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1093("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1094("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str1095("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1096("FLOATING-POINT-INVALID-OPERATION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str1097("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1098("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str1099("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1100("FLOATING-POINT-UNDERFLOW\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str1101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1102("FTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1104("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1106("HASH-TABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1108("IGNORABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1110("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1112("INLINE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1114("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1116("INTERNAL-TIME-UNITS-PER-SECOND\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str1117("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1120("LAMBDA-LIST-KEYWORDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1122("LAMBDA-PARAMETERS-LIMIT\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str1123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1124("LEAST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1125("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1126("LEAST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1128("LEAST-NEGATIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1130("LEAST-NEGATIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str1131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1132("LEAST-NEGATIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1134("LEAST-NEGATIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1136("LEAST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1138("LEAST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1140("LEAST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1142("LEAST-POSITIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1144("LEAST-POSITIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1146("LEAST-POSITIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str1147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1148("LEAST-POSITIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1150("LEAST-POSITIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1152("LEAST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1154("LEAST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1155("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1156("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1157("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1158("LONG-FLOAT-EPSILON\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1159("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1160("LONG-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1161("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1162("METHOD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1163("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1164("METHOD-COMBINATION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1166("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1167("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1168("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1170("MOST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str1171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1172("MOST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1174("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1176("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1178("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1179("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1180("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str1181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1182("MOST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1183("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1184("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1185("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1186("MULTIPLE-VALUES-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str1187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1188("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1189("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1190("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1192("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1193("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1194("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1196("PACKAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1197("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1198("PACKAGE-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1200("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1201("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1202("PI\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str1203("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1204("PRINT-NOT-READABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1206("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1207("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1208("RANDOM-STATE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1209("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1210("RATIO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1211("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1212("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1213("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1214("READTABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1216("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1218("RESTART\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1220("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1222("SATISFIES\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1224("SEQUENCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1226("SERIOUS-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1228("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1229("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1230("SHORT-FLOAT-EPSILON\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str1231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1232("SHORT-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str1233("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1234("SIGNED-BYTE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1235("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1236("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1237("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1238("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1240("SIMPLE-BIT-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1242("SIMPLE-CONDITION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1244("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1246("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1248("SIMPLE-TYPE-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1249("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1250("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1251("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1252("SIMPLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1254("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1256("SINGLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1257("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1258("SINGLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str1259("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1260("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1261("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1262("SPECIAL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1263("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1264("SPEED\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1265("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1266("STANDARD\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1267("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1268("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1270("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1272("STANDARD-GENERIC-FUNCTION\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1274("STANDARD-METHOD\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1275("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1276("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1278("STORAGE-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1280("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1281("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1282("STREAM-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1284("STRING-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1285("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1286("STRUCTURE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1287("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1288("STRUCTURE-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1289("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1290("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1291("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1292("STYLE-WARNING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1293("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1294("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1295("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1296("SYNONYM-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1297("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1298("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1299("TWO-WAY-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1301("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1303("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1304("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1305("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1306("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1307("UNBOUND-VARIABLE\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1308("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1309("UNDEFINED-FUNCTION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1310("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1311("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1312("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1313("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1315("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1316("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1317("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1318("*__MLIR_BLOCK_RETVALUE_116254966808598*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1319("*__MLIR_BLOCK_RETMVLIST_116254966808598*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str1320("*__MLIR_BLOCK_RETFLAG_116254966808576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1321("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1322("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1323("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1324("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1325("*__MLIR_BLOCK_RETVALUE_116254966808598*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1326("*__MLIR_BLOCK_RETMVLIST_116254966808598*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str1327("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1328("*__MLIR_BLOCK_RETVALUE_116254966808598*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1329("*__MLIR_BLOCK_RETMVLIST_116254966808598*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str1330("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1331("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1332("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1333("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1334("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1335("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1336("*__MLIR_BLOCK_RETFLAG_116254966808576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1337("*__MLIR_BLOCK_RETMVLIST_116254966808576*\00") : !llvm.array<41 x i8>
}
