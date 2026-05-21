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
      %42 = arith.constant 16 : i64
      %43 = func.call @cc_make_string(%41, %42) : (!llvm.ptr, i64) -> i64
      %44 = func.call @cc_nil_value() : () -> i64
      %45 = func.call @cc_intern(%43, %44) : (i64, i64) -> i64
      %46 = func.call @cc_nil_value() : () -> i64
      %47 = func.call @cc_cons(%45, %46) : (i64, i64) -> i64
      %48 = func.call @cc_values_pack(%47) : (i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %49 = arith.addi %45, %__rlasp_stack_elide_zero_0 : i64
      %50 = llvm.mlir.addressof @str5 : !llvm.ptr
      %51 = arith.constant 3 : i64
      %52 = func.call @cc_make_string(%50, %51) : (!llvm.ptr, i64) -> i64
      %53 = func.call @cc_nil_value() : () -> i64
      %54 = func.call @cc_intern(%52, %53) : (i64, i64) -> i64
      %55 = func.call @cc_nil_value() : () -> i64
      %56 = func.call @cc_cons(%54, %55) : (i64, i64) -> i64
      %57 = func.call @cc_values_pack(%56) : (i64) -> i64
      func.call @stack_push_pointer(%54) : (i64) -> ()
      %58 = llvm.mlir.addressof @str6 : !llvm.ptr
      %59 = arith.constant 3 : i64
      %60 = func.call @cc_make_string(%58, %59) : (!llvm.ptr, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_intern(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_nil_value() : () -> i64
      %64 = func.call @cc_cons(%62, %63) : (i64, i64) -> i64
      %65 = func.call @cc_values_pack(%64) : (i64) -> i64
      func.call @stack_push_pointer(%62) : (i64) -> ()
      %66 = llvm.mlir.addressof @str7 : !llvm.ptr
      %67 = arith.constant 22 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = llvm.mlir.addressof @str8 : !llvm.ptr
      %70 = arith.constant 4 : i64
      %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
      %72 = func.call @cc_intern(%68, %71) : (i64, i64) -> i64
      %73 = func.call @cc_nil_value() : () -> i64
      %74 = func.call @cc_cons(%72, %73) : (i64, i64) -> i64
      %75 = func.call @cc_values_pack(%74) : (i64) -> i64
      func.call @stack_push_pointer(%72) : (i64) -> ()
      %76 = llvm.mlir.addressof @str9 : !llvm.ptr
      %77 = arith.constant 15 : i64
      %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
      %79 = llvm.mlir.addressof @str10 : !llvm.ptr
      %80 = arith.constant 4 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
      %83 = func.call @cc_nil_value() : () -> i64
      %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
      %85 = func.call @cc_values_pack(%84) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %86 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %87 = llvm.mlir.addressof @str11 : !llvm.ptr
      %88 = arith.constant 14 : i64
      %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
      %90 = llvm.mlir.addressof @str12 : !llvm.ptr
      %91 = arith.constant 11 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_intern(%89, %92) : (i64, i64) -> i64
      %94 = func.call @cc_nil_value() : () -> i64
      %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
      %96 = func.call @cc_values_pack(%95) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %97 = arith.addi %93, %__rlasp_stack_elide_zero_1 : i64
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
      %100 = llvm.mlir.addressof @str13 : !llvm.ptr
      %101 = arith.constant 5 : i64
      %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_intern(%102, %103) : (i64, i64) -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
      %107 = func.call @cc_values_pack(%106) : (i64) -> i64
      %108 = func.call @cc_cons(%104, %99) : (i64, i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @cc_cons(%110, %109) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %112 = arith.addi %111, %__rlasp_stack_elide_zero_2 : i64
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @cc_cons(%113, %112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%114) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @cc_cons(%116, %115) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %118 = arith.addi %117, %__rlasp_stack_elide_zero_3 : i64
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @cc_cons(%119, %118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%122, %121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %124 = arith.addi %123, %__rlasp_stack_elide_zero_4 : i64
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @cc_cons(%125, %124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %127 = func.call @stack_pop_pointer() : () -> i64
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = func.call @cc_cons(%128, %127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %130 = arith.addi %129, %__rlasp_stack_elide_zero_5 : i64
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @cc_cons(%131, %130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %133 = arith.addi %132, %__rlasp_stack_elide_zero_6 : i64
      %180 = arith.constant 108321407238145 : i64
      %181 = arith.constant 0 : i64
      %182 = func.call @cc_make_closure(%180, %181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %183 = arith.addi %182, %__rlasp_stack_elide_zero_7 : i64
      %184 = llvm.mlir.addressof @str18 : !llvm.ptr
      %185 = arith.constant 1 : i64
      %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_intern(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_nil_value() : () -> i64
      %190 = func.call @cc_cons(%188, %189) : (i64, i64) -> i64
      %191 = func.call @cc_values_pack(%190) : (i64) -> i64
      func.call @stack_push_pointer(%188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %192 = func.call @stack_pop_pointer() : () -> i64
      %193 = func.call @stack_pop_pointer() : () -> i64
      %194 = func.call @cc_cons(%193, %192) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %195 = arith.addi %194, %__rlasp_stack_elide_zero_8 : i64
      %196 = llvm.mlir.addressof @str19 : !llvm.ptr
      %197 = arith.constant 11 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = llvm.mlir.addressof @str20 : !llvm.ptr
      %200 = arith.constant 7 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = func.call @cc_intern(%198, %201) : (i64, i64) -> i64
      %203 = func.call @cc_nil_value() : () -> i64
      %204 = func.call @cc_cons(%202, %203) : (i64, i64) -> i64
      %205 = func.call @cc_values_pack(%204) : (i64) -> i64
      %206 = llvm.mlir.addressof @str21 : !llvm.ptr
      %207 = arith.constant 351 : i64
      %208 = func.call @cc_make_string(%206, %207) : (!llvm.ptr, i64) -> i64
      %209 = llvm.mlir.addressof @str22 : !llvm.ptr
      %210 = arith.constant 4 : i64
      %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
      %212 = llvm.mlir.addressof @str23 : !llvm.ptr
      %213 = arith.constant 7 : i64
      %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
      %215 = func.call @cc_intern(%211, %214) : (i64, i64) -> i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_cons(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_values_pack(%217) : (i64) -> i64
      %219 = llvm.mlir.addressof @str24 : !llvm.ptr
      %220 = arith.constant 6 : i64
      %221 = func.call @cc_make_string(%219, %220) : (!llvm.ptr, i64) -> i64
      %222 = func.call @cc_nil_value() : () -> i64
      %223 = func.call @cc_intern(%221, %222) : (i64, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_cons(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_values_pack(%225) : (i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %227 = arith.addi %223, %__rlasp_stack_elide_zero_9 : i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_errorp(%49) : (i64) -> i64
      %230 = arith.cmpi ne, %229, %228 : i64
      %231 = arith.cmpi eq, %228, %228 : i64
      %232 = arith.andi %230, %231 : i1
      %233 = scf.if %232 -> (i64) {
        scf.yield %49 : i64
      } else {
        scf.yield %228 : i64
      }
      %234 = func.call @cc_errorp(%133) : (i64) -> i64
      %235 = arith.cmpi ne, %234, %228 : i64
      %236 = arith.cmpi eq, %233, %228 : i64
      %237 = arith.andi %235, %236 : i1
      %238 = scf.if %237 -> (i64) {
        scf.yield %133 : i64
      } else {
        scf.yield %233 : i64
      }
      %239 = func.call @cc_errorp(%183) : (i64) -> i64
      %240 = arith.cmpi ne, %239, %228 : i64
      %241 = arith.cmpi eq, %238, %228 : i64
      %242 = arith.andi %240, %241 : i1
      %243 = scf.if %242 -> (i64) {
        scf.yield %183 : i64
      } else {
        scf.yield %238 : i64
      }
      %244 = func.call @cc_errorp(%195) : (i64) -> i64
      %245 = arith.cmpi ne, %244, %228 : i64
      %246 = arith.cmpi eq, %243, %228 : i64
      %247 = arith.andi %245, %246 : i1
      %248 = scf.if %247 -> (i64) {
        scf.yield %195 : i64
      } else {
        scf.yield %243 : i64
      }
      %249 = func.call @cc_errorp(%202) : (i64) -> i64
      %250 = arith.cmpi ne, %249, %228 : i64
      %251 = arith.cmpi eq, %248, %228 : i64
      %252 = arith.andi %250, %251 : i1
      %253 = scf.if %252 -> (i64) {
        scf.yield %202 : i64
      } else {
        scf.yield %248 : i64
      }
      %254 = func.call @cc_errorp(%208) : (i64) -> i64
      %255 = arith.cmpi ne, %254, %228 : i64
      %256 = arith.cmpi eq, %253, %228 : i64
      %257 = arith.andi %255, %256 : i1
      %258 = scf.if %257 -> (i64) {
        scf.yield %208 : i64
      } else {
        scf.yield %253 : i64
      }
      %259 = func.call @cc_errorp(%215) : (i64) -> i64
      %260 = arith.cmpi ne, %259, %228 : i64
      %261 = arith.cmpi eq, %258, %228 : i64
      %262 = arith.andi %260, %261 : i1
      %263 = scf.if %262 -> (i64) {
        scf.yield %215 : i64
      } else {
        scf.yield %258 : i64
      }
      %264 = func.call @cc_errorp(%227) : (i64) -> i64
      %265 = arith.cmpi ne, %264, %228 : i64
      %266 = arith.cmpi eq, %263, %228 : i64
      %267 = arith.andi %265, %266 : i1
      %268 = scf.if %267 -> (i64) {
        scf.yield %227 : i64
      } else {
        scf.yield %263 : i64
      }
      %269 = arith.cmpi ne, %268, %228 : i64
      scf.if %269 {
        func.call @stack_push_pointer(%268) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%49) : (i64) -> ()
        func.call @stack_push_pointer(%133) : (i64) -> ()
        func.call @stack_push_pointer(%183) : (i64) -> ()
        func.call @stack_push_pointer(%195) : (i64) -> ()
        func.call @stack_push_pointer(%202) : (i64) -> ()
        func.call @stack_push_pointer(%208) : (i64) -> ()
        func.call @stack_push_pointer(%215) : (i64) -> ()
        func.call @stack_push_pointer(%227) : (i64) -> ()
        %270 = llvm.mlir.addressof @str25 : !llvm.ptr
        %271 = func.call @cc_make_function_ref_const(%270) : (!llvm.ptr) -> i64
        %272 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%271, %272) : (i64, i64) -> ()
      }
      %273 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %273 : i64
    }
    %274 = func.call @cc_nil_value() : () -> i64
    %275 = func.call @cc_errorp(%40) : (i64) -> i64
    %276 = arith.cmpi ne, %275, %274 : i64
    %277 = scf.if %276 -> (i64) {
      scf.yield %40 : i64
    } else {
      %278 = llvm.mlir.addressof @str26 : !llvm.ptr
      %279 = arith.constant 16 : i64
      %280 = func.call @cc_make_string(%278, %279) : (!llvm.ptr, i64) -> i64
      %281 = func.call @cc_nil_value() : () -> i64
      %282 = func.call @cc_intern(%280, %281) : (i64, i64) -> i64
      %283 = func.call @cc_nil_value() : () -> i64
      %284 = func.call @cc_cons(%282, %283) : (i64, i64) -> i64
      %285 = func.call @cc_values_pack(%284) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %286 = arith.addi %282, %__rlasp_stack_elide_zero_10 : i64
      %287 = llvm.mlir.addressof @str27 : !llvm.ptr
      %288 = arith.constant 10 : i64
      %289 = func.call @cc_make_string(%287, %288) : (!llvm.ptr, i64) -> i64
      %290 = llvm.mlir.addressof @str28 : !llvm.ptr
      %291 = arith.constant 11 : i64
      %292 = func.call @cc_make_string(%290, %291) : (!llvm.ptr, i64) -> i64
      %293 = func.call @cc_intern(%289, %292) : (i64, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_values_pack(%295) : (i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %297 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%297) : (i64) -> ()
      %298 = llvm.mlir.addressof @str29 : !llvm.ptr
      %299 = arith.constant 12 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = llvm.mlir.addressof @str30 : !llvm.ptr
      %302 = arith.constant 7 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = func.call @cc_intern(%300, %303) : (i64, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_values_pack(%306) : (i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      %308 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %309 = llvm.mlir.addressof @str31 : !llvm.ptr
      %310 = arith.constant 3 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = llvm.mlir.addressof @str32 : !llvm.ptr
      %313 = arith.constant 11 : i64
      %314 = func.call @cc_make_string(%312, %313) : (!llvm.ptr, i64) -> i64
      %315 = func.call @cc_intern(%311, %314) : (i64, i64) -> i64
      %316 = func.call @cc_nil_value() : () -> i64
      %317 = func.call @cc_cons(%315, %316) : (i64, i64) -> i64
      %318 = func.call @cc_values_pack(%317) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %319 = arith.addi %315, %__rlasp_stack_elide_zero_11 : i64
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = llvm.mlir.addressof @str33 : !llvm.ptr
      %323 = arith.constant 5 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      %325 = func.call @cc_nil_value() : () -> i64
      %326 = func.call @cc_intern(%324, %325) : (i64, i64) -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_values_pack(%328) : (i64) -> i64
      %330 = func.call @cc_cons(%326, %321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%330) : (i64) -> ()
      %331 = llvm.mlir.addressof @str34 : !llvm.ptr
      %332 = arith.constant 16 : i64
      %333 = func.call @cc_make_string(%331, %332) : (!llvm.ptr, i64) -> i64
      %334 = llvm.mlir.addressof @str35 : !llvm.ptr
      %335 = arith.constant 7 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = func.call @cc_intern(%333, %336) : (i64, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_cons(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_values_pack(%339) : (i64) -> i64
      func.call @stack_push_pointer(%337) : (i64) -> ()
      %341 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %342 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%342) : (i64) -> ()
      %343 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%343) : (i64) -> ()
      %344 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %345 = func.call @stack_pop_pointer() : () -> i64
      %346 = func.call @stack_pop_pointer() : () -> i64
      %347 = func.call @cc_cons(%346, %345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %348 = arith.addi %347, %__rlasp_stack_elide_zero_12 : i64
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @cc_cons(%349, %348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %351 = arith.addi %350, %__rlasp_stack_elide_zero_13 : i64
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%352, %351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %354 = arith.addi %353, %__rlasp_stack_elide_zero_14 : i64
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
      %357 = llvm.mlir.addressof @str36 : !llvm.ptr
      %358 = arith.constant 5 : i64
      %359 = func.call @cc_make_string(%357, %358) : (!llvm.ptr, i64) -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_intern(%359, %360) : (i64, i64) -> i64
      %362 = func.call @cc_nil_value() : () -> i64
      %363 = func.call @cc_cons(%361, %362) : (i64, i64) -> i64
      %364 = func.call @cc_values_pack(%363) : (i64) -> i64
      %365 = func.call @cc_cons(%361, %356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @cc_cons(%367, %366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %369 = arith.addi %368, %__rlasp_stack_elide_zero_15 : i64
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = func.call @cc_cons(%370, %369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %372 = arith.addi %371, %__rlasp_stack_elide_zero_16 : i64
      %373 = func.call @stack_pop_pointer() : () -> i64
      %374 = func.call @cc_cons(%373, %372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %375 = arith.addi %374, %__rlasp_stack_elide_zero_17 : i64
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = func.call @cc_cons(%376, %375) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %378 = arith.addi %377, %__rlasp_stack_elide_zero_18 : i64
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @cc_cons(%379, %378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %381 = arith.addi %380, %__rlasp_stack_elide_zero_19 : i64
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @cc_cons(%382, %381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %384 = arith.addi %383, %__rlasp_stack_elide_zero_20 : i64
      %467 = arith.constant 108321407238146 : i64
      %468 = arith.constant 0 : i64
      %469 = func.call @cc_make_closure(%467, %468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %470 = arith.addi %469, %__rlasp_stack_elide_zero_21 : i64
      %471 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%471) : (i64) -> ()
      %472 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%472) : (i64) -> ()
      %473 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%473) : (i64) -> ()
      %474 = arith.constant 3 : i64
      %475 = func.call @cc_box_fixnum(%474) : (i64) -> i64
      %476 = func.call @cc_make_vector(%475) : (i64) -> i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = arith.constant 2 : i64
      %479 = func.call @cc_box_fixnum(%478) : (i64) -> i64
      %480 = func.call @cc_svset(%476, %479, %477) : (i64, i64, i64) -> i64
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = arith.constant 1 : i64
      %483 = func.call @cc_box_fixnum(%482) : (i64) -> i64
      %484 = func.call @cc_svset(%476, %483, %481) : (i64, i64, i64) -> i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = arith.constant 0 : i64
      %487 = func.call @cc_box_fixnum(%486) : (i64) -> i64
      %488 = func.call @cc_svset(%476, %487, %485) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @stack_pop_pointer() : () -> i64
      %491 = func.call @cc_cons(%490, %489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %492 = arith.addi %491, %__rlasp_stack_elide_zero_22 : i64
      %493 = llvm.mlir.addressof @str44 : !llvm.ptr
      %494 = arith.constant 11 : i64
      %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
      %496 = llvm.mlir.addressof @str45 : !llvm.ptr
      %497 = arith.constant 7 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = func.call @cc_intern(%495, %498) : (i64, i64) -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = func.call @cc_values_pack(%501) : (i64) -> i64
      %503 = func.call @cc_nil_value() : () -> i64
      %504 = llvm.mlir.addressof @str46 : !llvm.ptr
      %505 = arith.constant 4 : i64
      %506 = func.call @cc_make_string(%504, %505) : (!llvm.ptr, i64) -> i64
      %507 = llvm.mlir.addressof @str47 : !llvm.ptr
      %508 = arith.constant 7 : i64
      %509 = func.call @cc_make_string(%507, %508) : (!llvm.ptr, i64) -> i64
      %510 = func.call @cc_intern(%506, %509) : (i64, i64) -> i64
      %511 = func.call @cc_nil_value() : () -> i64
      %512 = func.call @cc_cons(%510, %511) : (i64, i64) -> i64
      %513 = func.call @cc_values_pack(%512) : (i64) -> i64
      %514 = llvm.mlir.addressof @str48 : !llvm.ptr
      %515 = arith.constant 5 : i64
      %516 = func.call @cc_make_string(%514, %515) : (!llvm.ptr, i64) -> i64
      %517 = llvm.mlir.addressof @str49 : !llvm.ptr
      %518 = arith.constant 11 : i64
      %519 = func.call @cc_make_string(%517, %518) : (!llvm.ptr, i64) -> i64
      %520 = func.call @cc_intern(%516, %519) : (i64, i64) -> i64
      %521 = func.call @cc_nil_value() : () -> i64
      %522 = func.call @cc_cons(%520, %521) : (i64, i64) -> i64
      %523 = func.call @cc_values_pack(%522) : (i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %524 = arith.addi %520, %__rlasp_stack_elide_zero_23 : i64
      %525 = func.call @cc_nil_value() : () -> i64
      %526 = func.call @cc_errorp(%286) : (i64) -> i64
      %527 = arith.cmpi ne, %526, %525 : i64
      %528 = arith.cmpi eq, %525, %525 : i64
      %529 = arith.andi %527, %528 : i1
      %530 = scf.if %529 -> (i64) {
        scf.yield %286 : i64
      } else {
        scf.yield %525 : i64
      }
      %531 = func.call @cc_errorp(%384) : (i64) -> i64
      %532 = arith.cmpi ne, %531, %525 : i64
      %533 = arith.cmpi eq, %530, %525 : i64
      %534 = arith.andi %532, %533 : i1
      %535 = scf.if %534 -> (i64) {
        scf.yield %384 : i64
      } else {
        scf.yield %530 : i64
      }
      %536 = func.call @cc_errorp(%470) : (i64) -> i64
      %537 = arith.cmpi ne, %536, %525 : i64
      %538 = arith.cmpi eq, %535, %525 : i64
      %539 = arith.andi %537, %538 : i1
      %540 = scf.if %539 -> (i64) {
        scf.yield %470 : i64
      } else {
        scf.yield %535 : i64
      }
      %541 = func.call @cc_errorp(%492) : (i64) -> i64
      %542 = arith.cmpi ne, %541, %525 : i64
      %543 = arith.cmpi eq, %540, %525 : i64
      %544 = arith.andi %542, %543 : i1
      %545 = scf.if %544 -> (i64) {
        scf.yield %492 : i64
      } else {
        scf.yield %540 : i64
      }
      %546 = func.call @cc_errorp(%499) : (i64) -> i64
      %547 = arith.cmpi ne, %546, %525 : i64
      %548 = arith.cmpi eq, %545, %525 : i64
      %549 = arith.andi %547, %548 : i1
      %550 = scf.if %549 -> (i64) {
        scf.yield %499 : i64
      } else {
        scf.yield %545 : i64
      }
      %551 = func.call @cc_errorp(%503) : (i64) -> i64
      %552 = arith.cmpi ne, %551, %525 : i64
      %553 = arith.cmpi eq, %550, %525 : i64
      %554 = arith.andi %552, %553 : i1
      %555 = scf.if %554 -> (i64) {
        scf.yield %503 : i64
      } else {
        scf.yield %550 : i64
      }
      %556 = func.call @cc_errorp(%510) : (i64) -> i64
      %557 = arith.cmpi ne, %556, %525 : i64
      %558 = arith.cmpi eq, %555, %525 : i64
      %559 = arith.andi %557, %558 : i1
      %560 = scf.if %559 -> (i64) {
        scf.yield %510 : i64
      } else {
        scf.yield %555 : i64
      }
      %561 = func.call @cc_errorp(%524) : (i64) -> i64
      %562 = arith.cmpi ne, %561, %525 : i64
      %563 = arith.cmpi eq, %560, %525 : i64
      %564 = arith.andi %562, %563 : i1
      %565 = scf.if %564 -> (i64) {
        scf.yield %524 : i64
      } else {
        scf.yield %560 : i64
      }
      %566 = arith.cmpi ne, %565, %525 : i64
      scf.if %566 {
        func.call @stack_push_pointer(%565) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%286) : (i64) -> ()
        func.call @stack_push_pointer(%384) : (i64) -> ()
        func.call @stack_push_pointer(%470) : (i64) -> ()
        func.call @stack_push_pointer(%492) : (i64) -> ()
        func.call @stack_push_pointer(%499) : (i64) -> ()
        func.call @stack_push_pointer(%503) : (i64) -> ()
        func.call @stack_push_pointer(%510) : (i64) -> ()
        func.call @stack_push_pointer(%524) : (i64) -> ()
        %567 = llvm.mlir.addressof @str50 : !llvm.ptr
        %568 = func.call @cc_make_function_ref_const(%567) : (!llvm.ptr) -> i64
        %569 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%568, %569) : (i64, i64) -> ()
      }
      %570 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %570 : i64
    }
    %571 = func.call @cc_nil_value() : () -> i64
    %572 = func.call @cc_errorp(%277) : (i64) -> i64
    %573 = arith.cmpi ne, %572, %571 : i64
    %574 = scf.if %573 -> (i64) {
      scf.yield %277 : i64
    } else {
      %575 = llvm.mlir.addressof @str51 : !llvm.ptr
      %576 = arith.constant 17 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_nil_value() : () -> i64
      %579 = func.call @cc_intern(%577, %578) : (i64, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_values_pack(%581) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %583 = arith.addi %579, %__rlasp_stack_elide_zero_24 : i64
      %584 = llvm.mlir.addressof @str52 : !llvm.ptr
      %585 = arith.constant 10 : i64
      %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
      %587 = llvm.mlir.addressof @str53 : !llvm.ptr
      %588 = arith.constant 11 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = func.call @cc_intern(%586, %589) : (i64, i64) -> i64
      %591 = func.call @cc_nil_value() : () -> i64
      %592 = func.call @cc_cons(%590, %591) : (i64, i64) -> i64
      %593 = func.call @cc_values_pack(%592) : (i64) -> i64
      func.call @stack_push_pointer(%590) : (i64) -> ()
      %594 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%594) : (i64) -> ()
      %595 = llvm.mlir.addressof @str54 : !llvm.ptr
      %596 = arith.constant 12 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = llvm.mlir.addressof @str55 : !llvm.ptr
      %599 = arith.constant 7 : i64
      %600 = func.call @cc_make_string(%598, %599) : (!llvm.ptr, i64) -> i64
      %601 = func.call @cc_intern(%597, %600) : (i64, i64) -> i64
      %602 = func.call @cc_nil_value() : () -> i64
      %603 = func.call @cc_cons(%601, %602) : (i64, i64) -> i64
      %604 = func.call @cc_values_pack(%603) : (i64) -> i64
      func.call @stack_push_pointer(%601) : (i64) -> ()
      %605 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%605) : (i64) -> ()
      %606 = llvm.mlir.addressof @str56 : !llvm.ptr
      %607 = arith.constant 13 : i64
      %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
      %609 = llvm.mlir.addressof @str57 : !llvm.ptr
      %610 = arith.constant 11 : i64
      %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
      %612 = func.call @cc_intern(%608, %611) : (i64, i64) -> i64
      %613 = func.call @cc_nil_value() : () -> i64
      %614 = func.call @cc_cons(%612, %613) : (i64, i64) -> i64
      %615 = func.call @cc_values_pack(%614) : (i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %616 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%616) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = func.call @stack_pop_pointer() : () -> i64
      %619 = func.call @cc_cons(%618, %617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %620 = arith.addi %619, %__rlasp_stack_elide_zero_25 : i64
      %621 = func.call @stack_pop_pointer() : () -> i64
      %622 = func.call @cc_cons(%621, %620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %623 = arith.addi %622, %__rlasp_stack_elide_zero_26 : i64
      %624 = func.call @stack_pop_pointer() : () -> i64
      %625 = func.call @cc_cons(%623, %624) : (i64, i64) -> i64
      %626 = llvm.mlir.addressof @str58 : !llvm.ptr
      %627 = arith.constant 5 : i64
      %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
      %629 = func.call @cc_nil_value() : () -> i64
      %630 = func.call @cc_intern(%628, %629) : (i64, i64) -> i64
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_cons(%630, %631) : (i64, i64) -> i64
      %633 = func.call @cc_values_pack(%632) : (i64) -> i64
      %634 = func.call @cc_cons(%630, %625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%634) : (i64) -> ()
      %635 = llvm.mlir.addressof @str59 : !llvm.ptr
      %636 = arith.constant 16 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = llvm.mlir.addressof @str60 : !llvm.ptr
      %639 = arith.constant 7 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = func.call @cc_intern(%637, %640) : (i64, i64) -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_values_pack(%643) : (i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      %645 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%645) : (i64) -> ()
      %646 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%646) : (i64) -> ()
      %647 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%647) : (i64) -> ()
      %648 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @cc_cons(%650, %649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %652 = arith.addi %651, %__rlasp_stack_elide_zero_27 : i64
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = func.call @cc_cons(%653, %652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %655 = arith.addi %654, %__rlasp_stack_elide_zero_28 : i64
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @cc_cons(%656, %655) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %658 = arith.addi %657, %__rlasp_stack_elide_zero_29 : i64
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @cc_cons(%658, %659) : (i64, i64) -> i64
      %661 = llvm.mlir.addressof @str61 : !llvm.ptr
      %662 = arith.constant 5 : i64
      %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
      %664 = func.call @cc_nil_value() : () -> i64
      %665 = func.call @cc_intern(%663, %664) : (i64, i64) -> i64
      %666 = func.call @cc_nil_value() : () -> i64
      %667 = func.call @cc_cons(%665, %666) : (i64, i64) -> i64
      %668 = func.call @cc_values_pack(%667) : (i64) -> i64
      %669 = func.call @cc_cons(%665, %660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = func.call @cc_cons(%671, %670) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %673 = arith.addi %672, %__rlasp_stack_elide_zero_30 : i64
      %674 = func.call @stack_pop_pointer() : () -> i64
      %675 = func.call @cc_cons(%674, %673) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %676 = arith.addi %675, %__rlasp_stack_elide_zero_31 : i64
      %677 = func.call @stack_pop_pointer() : () -> i64
      %678 = func.call @cc_cons(%677, %676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %679 = arith.addi %678, %__rlasp_stack_elide_zero_32 : i64
      %680 = func.call @stack_pop_pointer() : () -> i64
      %681 = func.call @cc_cons(%680, %679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %682 = arith.addi %681, %__rlasp_stack_elide_zero_33 : i64
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @cc_cons(%683, %682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %685 = arith.addi %684, %__rlasp_stack_elide_zero_34 : i64
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @cc_cons(%686, %685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %688 = arith.addi %687, %__rlasp_stack_elide_zero_35 : i64
      %778 = arith.constant 108321407238147 : i64
      %779 = arith.constant 0 : i64
      %780 = func.call @cc_make_closure(%778, %779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %781 = arith.addi %780, %__rlasp_stack_elide_zero_36 : i64
      %782 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%782) : (i64) -> ()
      %783 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%783) : (i64) -> ()
      %784 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%784) : (i64) -> ()
      %785 = arith.constant 3 : i64
      %786 = func.call @cc_box_fixnum(%785) : (i64) -> i64
      %787 = func.call @cc_make_vector(%786) : (i64) -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = arith.constant 2 : i64
      %790 = func.call @cc_box_fixnum(%789) : (i64) -> i64
      %791 = func.call @cc_svset(%787, %790, %788) : (i64, i64, i64) -> i64
      %792 = func.call @stack_pop_pointer() : () -> i64
      %793 = arith.constant 1 : i64
      %794 = func.call @cc_box_fixnum(%793) : (i64) -> i64
      %795 = func.call @cc_svset(%787, %794, %792) : (i64, i64, i64) -> i64
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = arith.constant 0 : i64
      %798 = func.call @cc_box_fixnum(%797) : (i64) -> i64
      %799 = func.call @cc_svset(%787, %798, %796) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @stack_pop_pointer() : () -> i64
      %802 = func.call @cc_cons(%801, %800) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %803 = arith.addi %802, %__rlasp_stack_elide_zero_37 : i64
      %804 = llvm.mlir.addressof @str69 : !llvm.ptr
      %805 = arith.constant 11 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = llvm.mlir.addressof @str70 : !llvm.ptr
      %808 = arith.constant 7 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_intern(%806, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      %814 = func.call @cc_nil_value() : () -> i64
      %815 = llvm.mlir.addressof @str71 : !llvm.ptr
      %816 = arith.constant 4 : i64
      %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
      %818 = llvm.mlir.addressof @str72 : !llvm.ptr
      %819 = arith.constant 7 : i64
      %820 = func.call @cc_make_string(%818, %819) : (!llvm.ptr, i64) -> i64
      %821 = func.call @cc_intern(%817, %820) : (i64, i64) -> i64
      %822 = func.call @cc_nil_value() : () -> i64
      %823 = func.call @cc_cons(%821, %822) : (i64, i64) -> i64
      %824 = func.call @cc_values_pack(%823) : (i64) -> i64
      %825 = llvm.mlir.addressof @str73 : !llvm.ptr
      %826 = arith.constant 6 : i64
      %827 = func.call @cc_make_string(%825, %826) : (!llvm.ptr, i64) -> i64
      %828 = func.call @cc_nil_value() : () -> i64
      %829 = func.call @cc_intern(%827, %828) : (i64, i64) -> i64
      %830 = func.call @cc_nil_value() : () -> i64
      %831 = func.call @cc_cons(%829, %830) : (i64, i64) -> i64
      %832 = func.call @cc_values_pack(%831) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %833 = arith.addi %829, %__rlasp_stack_elide_zero_38 : i64
      %834 = func.call @cc_nil_value() : () -> i64
      %835 = func.call @cc_errorp(%583) : (i64) -> i64
      %836 = arith.cmpi ne, %835, %834 : i64
      %837 = arith.cmpi eq, %834, %834 : i64
      %838 = arith.andi %836, %837 : i1
      %839 = scf.if %838 -> (i64) {
        scf.yield %583 : i64
      } else {
        scf.yield %834 : i64
      }
      %840 = func.call @cc_errorp(%688) : (i64) -> i64
      %841 = arith.cmpi ne, %840, %834 : i64
      %842 = arith.cmpi eq, %839, %834 : i64
      %843 = arith.andi %841, %842 : i1
      %844 = scf.if %843 -> (i64) {
        scf.yield %688 : i64
      } else {
        scf.yield %839 : i64
      }
      %845 = func.call @cc_errorp(%781) : (i64) -> i64
      %846 = arith.cmpi ne, %845, %834 : i64
      %847 = arith.cmpi eq, %844, %834 : i64
      %848 = arith.andi %846, %847 : i1
      %849 = scf.if %848 -> (i64) {
        scf.yield %781 : i64
      } else {
        scf.yield %844 : i64
      }
      %850 = func.call @cc_errorp(%803) : (i64) -> i64
      %851 = arith.cmpi ne, %850, %834 : i64
      %852 = arith.cmpi eq, %849, %834 : i64
      %853 = arith.andi %851, %852 : i1
      %854 = scf.if %853 -> (i64) {
        scf.yield %803 : i64
      } else {
        scf.yield %849 : i64
      }
      %855 = func.call @cc_errorp(%810) : (i64) -> i64
      %856 = arith.cmpi ne, %855, %834 : i64
      %857 = arith.cmpi eq, %854, %834 : i64
      %858 = arith.andi %856, %857 : i1
      %859 = scf.if %858 -> (i64) {
        scf.yield %810 : i64
      } else {
        scf.yield %854 : i64
      }
      %860 = func.call @cc_errorp(%814) : (i64) -> i64
      %861 = arith.cmpi ne, %860, %834 : i64
      %862 = arith.cmpi eq, %859, %834 : i64
      %863 = arith.andi %861, %862 : i1
      %864 = scf.if %863 -> (i64) {
        scf.yield %814 : i64
      } else {
        scf.yield %859 : i64
      }
      %865 = func.call @cc_errorp(%821) : (i64) -> i64
      %866 = arith.cmpi ne, %865, %834 : i64
      %867 = arith.cmpi eq, %864, %834 : i64
      %868 = arith.andi %866, %867 : i1
      %869 = scf.if %868 -> (i64) {
        scf.yield %821 : i64
      } else {
        scf.yield %864 : i64
      }
      %870 = func.call @cc_errorp(%833) : (i64) -> i64
      %871 = arith.cmpi ne, %870, %834 : i64
      %872 = arith.cmpi eq, %869, %834 : i64
      %873 = arith.andi %871, %872 : i1
      %874 = scf.if %873 -> (i64) {
        scf.yield %833 : i64
      } else {
        scf.yield %869 : i64
      }
      %875 = arith.cmpi ne, %874, %834 : i64
      scf.if %875 {
        func.call @stack_push_pointer(%874) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%583) : (i64) -> ()
        func.call @stack_push_pointer(%688) : (i64) -> ()
        func.call @stack_push_pointer(%781) : (i64) -> ()
        func.call @stack_push_pointer(%803) : (i64) -> ()
        func.call @stack_push_pointer(%810) : (i64) -> ()
        func.call @stack_push_pointer(%814) : (i64) -> ()
        func.call @stack_push_pointer(%821) : (i64) -> ()
        func.call @stack_push_pointer(%833) : (i64) -> ()
        %876 = llvm.mlir.addressof @str74 : !llvm.ptr
        %877 = func.call @cc_make_function_ref_const(%876) : (!llvm.ptr) -> i64
        %878 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%877, %878) : (i64, i64) -> ()
      }
      %879 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %879 : i64
    }
    %880 = func.call @cc_nil_value() : () -> i64
    %881 = func.call @cc_errorp(%574) : (i64) -> i64
    %882 = arith.cmpi ne, %881, %880 : i64
    %883 = scf.if %882 -> (i64) {
      scf.yield %574 : i64
    } else {
      %884 = llvm.mlir.addressof @str75 : !llvm.ptr
      %885 = arith.constant 8 : i64
      %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
      %887 = func.call @cc_nil_value() : () -> i64
      %888 = func.call @cc_intern(%886, %887) : (i64, i64) -> i64
      %889 = func.call @cc_nil_value() : () -> i64
      %890 = func.call @cc_cons(%888, %889) : (i64, i64) -> i64
      %891 = func.call @cc_values_pack(%890) : (i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %892 = arith.addi %888, %__rlasp_stack_elide_zero_39 : i64
      %893 = llvm.mlir.addressof @str76 : !llvm.ptr
      %894 = arith.constant 10 : i64
      %895 = func.call @cc_make_string(%893, %894) : (!llvm.ptr, i64) -> i64
      %896 = llvm.mlir.addressof @str77 : !llvm.ptr
      %897 = arith.constant 11 : i64
      %898 = func.call @cc_make_string(%896, %897) : (!llvm.ptr, i64) -> i64
      %899 = func.call @cc_intern(%895, %898) : (i64, i64) -> i64
      %900 = func.call @cc_nil_value() : () -> i64
      %901 = func.call @cc_cons(%899, %900) : (i64, i64) -> i64
      %902 = func.call @cc_values_pack(%901) : (i64) -> i64
      func.call @stack_push_pointer(%899) : (i64) -> ()
      %903 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%903) : (i64) -> ()
      %904 = llvm.mlir.addressof @str78 : !llvm.ptr
      %905 = arith.constant 12 : i64
      %906 = func.call @cc_make_string(%904, %905) : (!llvm.ptr, i64) -> i64
      %907 = llvm.mlir.addressof @str79 : !llvm.ptr
      %908 = arith.constant 7 : i64
      %909 = func.call @cc_make_string(%907, %908) : (!llvm.ptr, i64) -> i64
      %910 = func.call @cc_intern(%906, %909) : (i64, i64) -> i64
      %911 = func.call @cc_nil_value() : () -> i64
      %912 = func.call @cc_cons(%910, %911) : (i64, i64) -> i64
      %913 = func.call @cc_values_pack(%912) : (i64) -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %914 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %915 = llvm.mlir.addressof @str80 : !llvm.ptr
      %916 = arith.constant 9 : i64
      %917 = func.call @cc_make_string(%915, %916) : (!llvm.ptr, i64) -> i64
      %918 = llvm.mlir.addressof @str81 : !llvm.ptr
      %919 = arith.constant 11 : i64
      %920 = func.call @cc_make_string(%918, %919) : (!llvm.ptr, i64) -> i64
      %921 = func.call @cc_intern(%917, %920) : (i64, i64) -> i64
      %922 = func.call @cc_nil_value() : () -> i64
      %923 = func.call @cc_cons(%921, %922) : (i64, i64) -> i64
      %924 = func.call @cc_values_pack(%923) : (i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %925 = arith.addi %921, %__rlasp_stack_elide_zero_40 : i64
      %926 = func.call @stack_pop_pointer() : () -> i64
      %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
      %928 = llvm.mlir.addressof @str82 : !llvm.ptr
      %929 = arith.constant 5 : i64
      %930 = func.call @cc_make_string(%928, %929) : (!llvm.ptr, i64) -> i64
      %931 = func.call @cc_nil_value() : () -> i64
      %932 = func.call @cc_intern(%930, %931) : (i64, i64) -> i64
      %933 = func.call @cc_nil_value() : () -> i64
      %934 = func.call @cc_cons(%932, %933) : (i64, i64) -> i64
      %935 = func.call @cc_values_pack(%934) : (i64) -> i64
      %936 = func.call @cc_cons(%932, %927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      %937 = llvm.mlir.addressof @str83 : !llvm.ptr
      %938 = arith.constant 15 : i64
      %939 = func.call @cc_make_string(%937, %938) : (!llvm.ptr, i64) -> i64
      %940 = llvm.mlir.addressof @str84 : !llvm.ptr
      %941 = arith.constant 7 : i64
      %942 = func.call @cc_make_string(%940, %941) : (!llvm.ptr, i64) -> i64
      %943 = func.call @cc_intern(%939, %942) : (i64, i64) -> i64
      %944 = func.call @cc_nil_value() : () -> i64
      %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
      %946 = func.call @cc_values_pack(%945) : (i64) -> i64
      func.call @stack_push_pointer(%943) : (i64) -> ()
      %947 = arith.constant 97 : i64
      %948 = func.call @cc_box_character(%947) : (i64) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %949 = func.call @stack_pop_pointer() : () -> i64
      %950 = func.call @stack_pop_pointer() : () -> i64
      %951 = func.call @cc_cons(%950, %949) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %952 = arith.addi %951, %__rlasp_stack_elide_zero_41 : i64
      %953 = func.call @stack_pop_pointer() : () -> i64
      %954 = func.call @cc_cons(%953, %952) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %955 = arith.addi %954, %__rlasp_stack_elide_zero_42 : i64
      %956 = func.call @stack_pop_pointer() : () -> i64
      %957 = func.call @cc_cons(%956, %955) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %958 = arith.addi %957, %__rlasp_stack_elide_zero_43 : i64
      %959 = func.call @stack_pop_pointer() : () -> i64
      %960 = func.call @cc_cons(%959, %958) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %961 = arith.addi %960, %__rlasp_stack_elide_zero_44 : i64
      %962 = func.call @stack_pop_pointer() : () -> i64
      %963 = func.call @cc_cons(%962, %961) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %964 = arith.addi %963, %__rlasp_stack_elide_zero_45 : i64
      %965 = func.call @stack_pop_pointer() : () -> i64
      %966 = func.call @cc_cons(%965, %964) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %967 = arith.addi %966, %__rlasp_stack_elide_zero_46 : i64
      %1039 = arith.constant 108321407238148 : i64
      %1040 = arith.constant 0 : i64
      %1041 = func.call @cc_make_closure(%1039, %1040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1042 = arith.addi %1041, %__rlasp_stack_elide_zero_47 : i64
      %1043 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1044 = arith.constant 3 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @cc_cons(%1047, %1046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1049 = arith.addi %1048, %__rlasp_stack_elide_zero_48 : i64
      %1050 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1051 = arith.constant 11 : i64
      %1052 = func.call @cc_make_string(%1050, %1051) : (!llvm.ptr, i64) -> i64
      %1053 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1054 = arith.constant 7 : i64
      %1055 = func.call @cc_make_string(%1053, %1054) : (!llvm.ptr, i64) -> i64
      %1056 = func.call @cc_intern(%1052, %1055) : (i64, i64) -> i64
      %1057 = func.call @cc_nil_value() : () -> i64
      %1058 = func.call @cc_cons(%1056, %1057) : (i64, i64) -> i64
      %1059 = func.call @cc_values_pack(%1058) : (i64) -> i64
      %1060 = func.call @cc_nil_value() : () -> i64
      %1061 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1062 = arith.constant 4 : i64
      %1063 = func.call @cc_make_string(%1061, %1062) : (!llvm.ptr, i64) -> i64
      %1064 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1065 = arith.constant 7 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = func.call @cc_intern(%1063, %1066) : (i64, i64) -> i64
      %1068 = func.call @cc_nil_value() : () -> i64
      %1069 = func.call @cc_cons(%1067, %1068) : (i64, i64) -> i64
      %1070 = func.call @cc_values_pack(%1069) : (i64) -> i64
      %1071 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1072 = arith.constant 7 : i64
      %1073 = func.call @cc_make_string(%1071, %1072) : (!llvm.ptr, i64) -> i64
      %1074 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1075 = arith.constant 11 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      %1077 = func.call @cc_intern(%1073, %1076) : (i64, i64) -> i64
      %1078 = func.call @cc_nil_value() : () -> i64
      %1079 = func.call @cc_cons(%1077, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_values_pack(%1079) : (i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1081 = arith.addi %1077, %__rlasp_stack_elide_zero_49 : i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_errorp(%892) : (i64) -> i64
      %1084 = arith.cmpi ne, %1083, %1082 : i64
      %1085 = arith.cmpi eq, %1082, %1082 : i64
      %1086 = arith.andi %1084, %1085 : i1
      %1087 = scf.if %1086 -> (i64) {
        scf.yield %892 : i64
      } else {
        scf.yield %1082 : i64
      }
      %1088 = func.call @cc_errorp(%967) : (i64) -> i64
      %1089 = arith.cmpi ne, %1088, %1082 : i64
      %1090 = arith.cmpi eq, %1087, %1082 : i64
      %1091 = arith.andi %1089, %1090 : i1
      %1092 = scf.if %1091 -> (i64) {
        scf.yield %967 : i64
      } else {
        scf.yield %1087 : i64
      }
      %1093 = func.call @cc_errorp(%1042) : (i64) -> i64
      %1094 = arith.cmpi ne, %1093, %1082 : i64
      %1095 = arith.cmpi eq, %1092, %1082 : i64
      %1096 = arith.andi %1094, %1095 : i1
      %1097 = scf.if %1096 -> (i64) {
        scf.yield %1042 : i64
      } else {
        scf.yield %1092 : i64
      }
      %1098 = func.call @cc_errorp(%1049) : (i64) -> i64
      %1099 = arith.cmpi ne, %1098, %1082 : i64
      %1100 = arith.cmpi eq, %1097, %1082 : i64
      %1101 = arith.andi %1099, %1100 : i1
      %1102 = scf.if %1101 -> (i64) {
        scf.yield %1049 : i64
      } else {
        scf.yield %1097 : i64
      }
      %1103 = func.call @cc_errorp(%1056) : (i64) -> i64
      %1104 = arith.cmpi ne, %1103, %1082 : i64
      %1105 = arith.cmpi eq, %1102, %1082 : i64
      %1106 = arith.andi %1104, %1105 : i1
      %1107 = scf.if %1106 -> (i64) {
        scf.yield %1056 : i64
      } else {
        scf.yield %1102 : i64
      }
      %1108 = func.call @cc_errorp(%1060) : (i64) -> i64
      %1109 = arith.cmpi ne, %1108, %1082 : i64
      %1110 = arith.cmpi eq, %1107, %1082 : i64
      %1111 = arith.andi %1109, %1110 : i1
      %1112 = scf.if %1111 -> (i64) {
        scf.yield %1060 : i64
      } else {
        scf.yield %1107 : i64
      }
      %1113 = func.call @cc_errorp(%1067) : (i64) -> i64
      %1114 = arith.cmpi ne, %1113, %1082 : i64
      %1115 = arith.cmpi eq, %1112, %1082 : i64
      %1116 = arith.andi %1114, %1115 : i1
      %1117 = scf.if %1116 -> (i64) {
        scf.yield %1067 : i64
      } else {
        scf.yield %1112 : i64
      }
      %1118 = func.call @cc_errorp(%1081) : (i64) -> i64
      %1119 = arith.cmpi ne, %1118, %1082 : i64
      %1120 = arith.cmpi eq, %1117, %1082 : i64
      %1121 = arith.andi %1119, %1120 : i1
      %1122 = scf.if %1121 -> (i64) {
        scf.yield %1081 : i64
      } else {
        scf.yield %1117 : i64
      }
      %1123 = arith.cmpi ne, %1122, %1082 : i64
      scf.if %1123 {
        func.call @stack_push_pointer(%1122) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%892) : (i64) -> ()
        func.call @stack_push_pointer(%967) : (i64) -> ()
        func.call @stack_push_pointer(%1042) : (i64) -> ()
        func.call @stack_push_pointer(%1049) : (i64) -> ()
        func.call @stack_push_pointer(%1056) : (i64) -> ()
        func.call @stack_push_pointer(%1060) : (i64) -> ()
        func.call @stack_push_pointer(%1067) : (i64) -> ()
        func.call @stack_push_pointer(%1081) : (i64) -> ()
        %1124 = llvm.mlir.addressof @str99 : !llvm.ptr
        %1125 = func.call @cc_make_function_ref_const(%1124) : (!llvm.ptr) -> i64
        %1126 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1125, %1126) : (i64, i64) -> ()
      }
      %1127 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1127 : i64
    }
    %1128 = func.call @cc_nil_value() : () -> i64
    %1129 = func.call @cc_errorp(%883) : (i64) -> i64
    %1130 = arith.cmpi ne, %1129, %1128 : i64
    %1131 = scf.if %1130 -> (i64) {
      scf.yield %883 : i64
    } else {
      %1132 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1133 = arith.constant 8 : i64
      %1134 = func.call @cc_make_string(%1132, %1133) : (!llvm.ptr, i64) -> i64
      %1135 = func.call @cc_nil_value() : () -> i64
      %1136 = func.call @cc_intern(%1134, %1135) : (i64, i64) -> i64
      %1137 = func.call @cc_nil_value() : () -> i64
      %1138 = func.call @cc_cons(%1136, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_values_pack(%1138) : (i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1140 = arith.addi %1136, %__rlasp_stack_elide_zero_50 : i64
      %1141 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1142 = arith.constant 10 : i64
      %1143 = func.call @cc_make_string(%1141, %1142) : (!llvm.ptr, i64) -> i64
      %1144 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1145 = arith.constant 11 : i64
      %1146 = func.call @cc_make_string(%1144, %1145) : (!llvm.ptr, i64) -> i64
      %1147 = func.call @cc_intern(%1143, %1146) : (i64, i64) -> i64
      %1148 = func.call @cc_nil_value() : () -> i64
      %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_values_pack(%1149) : (i64) -> i64
      func.call @stack_push_pointer(%1147) : (i64) -> ()
      %1151 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1151) : (i64) -> ()
      %1152 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1153 = arith.constant 12 : i64
      %1154 = func.call @cc_make_string(%1152, %1153) : (!llvm.ptr, i64) -> i64
      %1155 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1156 = arith.constant 7 : i64
      %1157 = func.call @cc_make_string(%1155, %1156) : (!llvm.ptr, i64) -> i64
      %1158 = func.call @cc_intern(%1154, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = func.call @cc_cons(%1158, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_values_pack(%1160) : (i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1162 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      %1163 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1164 = arith.constant 9 : i64
      %1165 = func.call @cc_make_string(%1163, %1164) : (!llvm.ptr, i64) -> i64
      %1166 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1167 = arith.constant 11 : i64
      %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
      %1169 = func.call @cc_intern(%1165, %1168) : (i64, i64) -> i64
      %1170 = func.call @cc_nil_value() : () -> i64
      %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
      %1172 = func.call @cc_values_pack(%1171) : (i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1173 = arith.addi %1169, %__rlasp_stack_elide_zero_51 : i64
      %1174 = func.call @stack_pop_pointer() : () -> i64
      %1175 = func.call @cc_cons(%1173, %1174) : (i64, i64) -> i64
      %1176 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1177 = arith.constant 5 : i64
      %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
      %1179 = func.call @cc_nil_value() : () -> i64
      %1180 = func.call @cc_intern(%1178, %1179) : (i64, i64) -> i64
      %1181 = func.call @cc_nil_value() : () -> i64
      %1182 = func.call @cc_cons(%1180, %1181) : (i64, i64) -> i64
      %1183 = func.call @cc_values_pack(%1182) : (i64) -> i64
      %1184 = func.call @cc_cons(%1180, %1175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      %1185 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1186 = arith.constant 16 : i64
      %1187 = func.call @cc_make_string(%1185, %1186) : (!llvm.ptr, i64) -> i64
      %1188 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1189 = arith.constant 7 : i64
      %1190 = func.call @cc_make_string(%1188, %1189) : (!llvm.ptr, i64) -> i64
      %1191 = func.call @cc_intern(%1187, %1190) : (i64, i64) -> i64
      %1192 = func.call @cc_nil_value() : () -> i64
      %1193 = func.call @cc_cons(%1191, %1192) : (i64, i64) -> i64
      %1194 = func.call @cc_values_pack(%1193) : (i64) -> i64
      func.call @stack_push_pointer(%1191) : (i64) -> ()
      %1195 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1195) : (i64) -> ()
      %1196 = arith.constant 97 : i64
      %1197 = func.call @cc_box_character(%1196) : (i64) -> i64
      func.call @stack_push_pointer(%1197) : (i64) -> ()
      %1198 = arith.constant 98 : i64
      %1199 = func.call @cc_box_character(%1198) : (i64) -> i64
      func.call @stack_push_pointer(%1199) : (i64) -> ()
      %1200 = arith.constant 99 : i64
      %1201 = func.call @cc_box_character(%1200) : (i64) -> i64
      func.call @stack_push_pointer(%1201) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1202 = func.call @stack_pop_pointer() : () -> i64
      %1203 = func.call @stack_pop_pointer() : () -> i64
      %1204 = func.call @cc_cons(%1203, %1202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1205 = arith.addi %1204, %__rlasp_stack_elide_zero_52 : i64
      %1206 = func.call @stack_pop_pointer() : () -> i64
      %1207 = func.call @cc_cons(%1206, %1205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1208 = arith.addi %1207, %__rlasp_stack_elide_zero_53 : i64
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @cc_cons(%1209, %1208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1211 = arith.addi %1210, %__rlasp_stack_elide_zero_54 : i64
      %1212 = func.call @stack_pop_pointer() : () -> i64
      %1213 = func.call @cc_cons(%1211, %1212) : (i64, i64) -> i64
      %1214 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1215 = arith.constant 5 : i64
      %1216 = func.call @cc_make_string(%1214, %1215) : (!llvm.ptr, i64) -> i64
      %1217 = func.call @cc_nil_value() : () -> i64
      %1218 = func.call @cc_intern(%1216, %1217) : (i64, i64) -> i64
      %1219 = func.call @cc_nil_value() : () -> i64
      %1220 = func.call @cc_cons(%1218, %1219) : (i64, i64) -> i64
      %1221 = func.call @cc_values_pack(%1220) : (i64) -> i64
      %1222 = func.call @cc_cons(%1218, %1213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @stack_pop_pointer() : () -> i64
      %1225 = func.call @cc_cons(%1224, %1223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1226 = arith.addi %1225, %__rlasp_stack_elide_zero_55 : i64
      %1227 = func.call @stack_pop_pointer() : () -> i64
      %1228 = func.call @cc_cons(%1227, %1226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1229 = arith.addi %1228, %__rlasp_stack_elide_zero_56 : i64
      %1230 = func.call @stack_pop_pointer() : () -> i64
      %1231 = func.call @cc_cons(%1230, %1229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1232 = arith.addi %1231, %__rlasp_stack_elide_zero_57 : i64
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @cc_cons(%1233, %1232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1235 = arith.addi %1234, %__rlasp_stack_elide_zero_58 : i64
      %1236 = func.call @stack_pop_pointer() : () -> i64
      %1237 = func.call @cc_cons(%1236, %1235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1238 = arith.addi %1237, %__rlasp_stack_elide_zero_59 : i64
      %1239 = func.call @stack_pop_pointer() : () -> i64
      %1240 = func.call @cc_cons(%1239, %1238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1241 = arith.addi %1240, %__rlasp_stack_elide_zero_60 : i64
      %1327 = arith.constant 108321407238149 : i64
      %1328 = arith.constant 0 : i64
      %1329 = func.call @cc_make_closure(%1327, %1328) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1330 = arith.addi %1329, %__rlasp_stack_elide_zero_61 : i64
      %1331 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1332 = arith.constant 3 : i64
      %1333 = func.call @cc_make_string(%1331, %1332) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1333) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1334 = func.call @stack_pop_pointer() : () -> i64
      %1335 = func.call @stack_pop_pointer() : () -> i64
      %1336 = func.call @cc_cons(%1335, %1334) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1337 = arith.addi %1336, %__rlasp_stack_elide_zero_62 : i64
      %1338 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1339 = arith.constant 11 : i64
      %1340 = func.call @cc_make_string(%1338, %1339) : (!llvm.ptr, i64) -> i64
      %1341 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1342 = arith.constant 7 : i64
      %1343 = func.call @cc_make_string(%1341, %1342) : (!llvm.ptr, i64) -> i64
      %1344 = func.call @cc_intern(%1340, %1343) : (i64, i64) -> i64
      %1345 = func.call @cc_nil_value() : () -> i64
      %1346 = func.call @cc_cons(%1344, %1345) : (i64, i64) -> i64
      %1347 = func.call @cc_values_pack(%1346) : (i64) -> i64
      %1348 = func.call @cc_nil_value() : () -> i64
      %1349 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1350 = arith.constant 4 : i64
      %1351 = func.call @cc_make_string(%1349, %1350) : (!llvm.ptr, i64) -> i64
      %1352 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1353 = arith.constant 7 : i64
      %1354 = func.call @cc_make_string(%1352, %1353) : (!llvm.ptr, i64) -> i64
      %1355 = func.call @cc_intern(%1351, %1354) : (i64, i64) -> i64
      %1356 = func.call @cc_nil_value() : () -> i64
      %1357 = func.call @cc_cons(%1355, %1356) : (i64, i64) -> i64
      %1358 = func.call @cc_values_pack(%1357) : (i64) -> i64
      %1359 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1360 = arith.constant 7 : i64
      %1361 = func.call @cc_make_string(%1359, %1360) : (!llvm.ptr, i64) -> i64
      %1362 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1363 = arith.constant 11 : i64
      %1364 = func.call @cc_make_string(%1362, %1363) : (!llvm.ptr, i64) -> i64
      %1365 = func.call @cc_intern(%1361, %1364) : (i64, i64) -> i64
      %1366 = func.call @cc_nil_value() : () -> i64
      %1367 = func.call @cc_cons(%1365, %1366) : (i64, i64) -> i64
      %1368 = func.call @cc_values_pack(%1367) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1369 = arith.addi %1365, %__rlasp_stack_elide_zero_63 : i64
      %1370 = func.call @cc_nil_value() : () -> i64
      %1371 = func.call @cc_errorp(%1140) : (i64) -> i64
      %1372 = arith.cmpi ne, %1371, %1370 : i64
      %1373 = arith.cmpi eq, %1370, %1370 : i64
      %1374 = arith.andi %1372, %1373 : i1
      %1375 = scf.if %1374 -> (i64) {
        scf.yield %1140 : i64
      } else {
        scf.yield %1370 : i64
      }
      %1376 = func.call @cc_errorp(%1241) : (i64) -> i64
      %1377 = arith.cmpi ne, %1376, %1370 : i64
      %1378 = arith.cmpi eq, %1375, %1370 : i64
      %1379 = arith.andi %1377, %1378 : i1
      %1380 = scf.if %1379 -> (i64) {
        scf.yield %1241 : i64
      } else {
        scf.yield %1375 : i64
      }
      %1381 = func.call @cc_errorp(%1330) : (i64) -> i64
      %1382 = arith.cmpi ne, %1381, %1370 : i64
      %1383 = arith.cmpi eq, %1380, %1370 : i64
      %1384 = arith.andi %1382, %1383 : i1
      %1385 = scf.if %1384 -> (i64) {
        scf.yield %1330 : i64
      } else {
        scf.yield %1380 : i64
      }
      %1386 = func.call @cc_errorp(%1337) : (i64) -> i64
      %1387 = arith.cmpi ne, %1386, %1370 : i64
      %1388 = arith.cmpi eq, %1385, %1370 : i64
      %1389 = arith.andi %1387, %1388 : i1
      %1390 = scf.if %1389 -> (i64) {
        scf.yield %1337 : i64
      } else {
        scf.yield %1385 : i64
      }
      %1391 = func.call @cc_errorp(%1344) : (i64) -> i64
      %1392 = arith.cmpi ne, %1391, %1370 : i64
      %1393 = arith.cmpi eq, %1390, %1370 : i64
      %1394 = arith.andi %1392, %1393 : i1
      %1395 = scf.if %1394 -> (i64) {
        scf.yield %1344 : i64
      } else {
        scf.yield %1390 : i64
      }
      %1396 = func.call @cc_errorp(%1348) : (i64) -> i64
      %1397 = arith.cmpi ne, %1396, %1370 : i64
      %1398 = arith.cmpi eq, %1395, %1370 : i64
      %1399 = arith.andi %1397, %1398 : i1
      %1400 = scf.if %1399 -> (i64) {
        scf.yield %1348 : i64
      } else {
        scf.yield %1395 : i64
      }
      %1401 = func.call @cc_errorp(%1355) : (i64) -> i64
      %1402 = arith.cmpi ne, %1401, %1370 : i64
      %1403 = arith.cmpi eq, %1400, %1370 : i64
      %1404 = arith.andi %1402, %1403 : i1
      %1405 = scf.if %1404 -> (i64) {
        scf.yield %1355 : i64
      } else {
        scf.yield %1400 : i64
      }
      %1406 = func.call @cc_errorp(%1369) : (i64) -> i64
      %1407 = arith.cmpi ne, %1406, %1370 : i64
      %1408 = arith.cmpi eq, %1405, %1370 : i64
      %1409 = arith.andi %1407, %1408 : i1
      %1410 = scf.if %1409 -> (i64) {
        scf.yield %1369 : i64
      } else {
        scf.yield %1405 : i64
      }
      %1411 = arith.cmpi ne, %1410, %1370 : i64
      scf.if %1411 {
        func.call @stack_push_pointer(%1410) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1140) : (i64) -> ()
        func.call @stack_push_pointer(%1241) : (i64) -> ()
        func.call @stack_push_pointer(%1330) : (i64) -> ()
        func.call @stack_push_pointer(%1337) : (i64) -> ()
        func.call @stack_push_pointer(%1344) : (i64) -> ()
        func.call @stack_push_pointer(%1348) : (i64) -> ()
        func.call @stack_push_pointer(%1355) : (i64) -> ()
        func.call @stack_push_pointer(%1369) : (i64) -> ()
        %1412 = llvm.mlir.addressof @str125 : !llvm.ptr
        %1413 = func.call @cc_make_function_ref_const(%1412) : (!llvm.ptr) -> i64
        %1414 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1413, %1414) : (i64, i64) -> ()
      }
      %1415 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1415 : i64
    }
    %1416 = func.call @cc_nil_value() : () -> i64
    %1417 = func.call @cc_errorp(%1131) : (i64) -> i64
    %1418 = arith.cmpi ne, %1417, %1416 : i64
    %1419 = scf.if %1418 -> (i64) {
      scf.yield %1131 : i64
    } else {
      %1420 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1421 = arith.constant 8 : i64
      %1422 = func.call @cc_make_string(%1420, %1421) : (!llvm.ptr, i64) -> i64
      %1423 = func.call @cc_nil_value() : () -> i64
      %1424 = func.call @cc_intern(%1422, %1423) : (i64, i64) -> i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_cons(%1424, %1425) : (i64, i64) -> i64
      %1427 = func.call @cc_values_pack(%1426) : (i64) -> i64
      %1428 = arith.constant 10 : i64
      %1429 = func.call @cc_box_fixnum(%1428) : (i64) -> i64
      %1430 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1431 = arith.constant 12 : i64
      %1432 = func.call @cc_make_string(%1430, %1431) : (!llvm.ptr, i64) -> i64
      %1433 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1434 = arith.constant 7 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %1436 = func.call @cc_intern(%1432, %1435) : (i64, i64) -> i64
      %1437 = func.call @cc_nil_value() : () -> i64
      %1438 = func.call @cc_cons(%1436, %1437) : (i64, i64) -> i64
      %1439 = func.call @cc_values_pack(%1438) : (i64) -> i64
      %1440 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1441 = arith.constant 3 : i64
      %1442 = func.call @cc_make_string(%1440, %1441) : (!llvm.ptr, i64) -> i64
      %1443 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1444 = arith.constant 11 : i64
      %1445 = func.call @cc_make_string(%1443, %1444) : (!llvm.ptr, i64) -> i64
      %1446 = func.call @cc_intern(%1442, %1445) : (i64, i64) -> i64
      %1447 = func.call @cc_nil_value() : () -> i64
      %1448 = func.call @cc_cons(%1446, %1447) : (i64, i64) -> i64
      %1449 = func.call @cc_values_pack(%1448) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1450 = arith.addi %1446, %__rlasp_stack_elide_zero_64 : i64
      %1451 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1452 = arith.constant 15 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1455 = arith.constant 7 : i64
      %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
      %1457 = func.call @cc_intern(%1453, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_nil_value() : () -> i64
      %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
      %1460 = func.call @cc_values_pack(%1459) : (i64) -> i64
      %1461 = arith.constant 1 : i64
      %1462 = func.call @cc_box_fixnum(%1461) : (i64) -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_errorp(%1429) : (i64) -> i64
      %1465 = arith.cmpi ne, %1464, %1463 : i64
      %1466 = arith.cmpi eq, %1463, %1463 : i64
      %1467 = arith.andi %1465, %1466 : i1
      %1468 = scf.if %1467 -> (i64) {
        scf.yield %1429 : i64
      } else {
        scf.yield %1463 : i64
      }
      %1469 = func.call @cc_errorp(%1436) : (i64) -> i64
      %1470 = arith.cmpi ne, %1469, %1463 : i64
      %1471 = arith.cmpi eq, %1468, %1463 : i64
      %1472 = arith.andi %1470, %1471 : i1
      %1473 = scf.if %1472 -> (i64) {
        scf.yield %1436 : i64
      } else {
        scf.yield %1468 : i64
      }
      %1474 = func.call @cc_errorp(%1450) : (i64) -> i64
      %1475 = arith.cmpi ne, %1474, %1463 : i64
      %1476 = arith.cmpi eq, %1473, %1463 : i64
      %1477 = arith.andi %1475, %1476 : i1
      %1478 = scf.if %1477 -> (i64) {
        scf.yield %1450 : i64
      } else {
        scf.yield %1473 : i64
      }
      %1479 = func.call @cc_errorp(%1457) : (i64) -> i64
      %1480 = arith.cmpi ne, %1479, %1463 : i64
      %1481 = arith.cmpi eq, %1478, %1463 : i64
      %1482 = arith.andi %1480, %1481 : i1
      %1483 = scf.if %1482 -> (i64) {
        scf.yield %1457 : i64
      } else {
        scf.yield %1478 : i64
      }
      %1484 = func.call @cc_errorp(%1462) : (i64) -> i64
      %1485 = arith.cmpi ne, %1484, %1463 : i64
      %1486 = arith.cmpi eq, %1483, %1463 : i64
      %1487 = arith.andi %1485, %1486 : i1
      %1488 = scf.if %1487 -> (i64) {
        scf.yield %1462 : i64
      } else {
        scf.yield %1483 : i64
      }
      %1489 = arith.cmpi ne, %1488, %1463 : i64
      scf.if %1489 {
        func.call @stack_push_pointer(%1488) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1429) : (i64) -> ()
        func.call @stack_push_pointer(%1436) : (i64) -> ()
        func.call @stack_push_pointer(%1450) : (i64) -> ()
        func.call @stack_push_pointer(%1457) : (i64) -> ()
        func.call @stack_push_pointer(%1462) : (i64) -> ()
        %1490 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1491 = func.call @cc_make_function_ref_const(%1490) : (!llvm.ptr) -> i64
        %1492 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1491, %1492) : (i64, i64) -> ()
      }
      %1493 = func.call @stack_pop_pointer() : () -> i64
      %1494 = func.call @cc_set_symbol_value(%1424, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_errorp(%1494) : (i64) -> i64
      %1496 = func.call @cc_nil_value() : () -> i64
      %1497 = arith.cmpi ne, %1495, %1496 : i64
      scf.if %1497 {
        func.call @stack_push_pointer(%1494) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1424) : (i64) -> ()
      }
      %1498 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1498 : i64
    }
    %1499 = func.call @cc_nil_value() : () -> i64
    %1500 = func.call @cc_errorp(%1419) : (i64) -> i64
    %1501 = arith.cmpi ne, %1500, %1499 : i64
    %1502 = scf.if %1501 -> (i64) {
      scf.yield %1419 : i64
    } else {
      %1503 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1504 = arith.constant 17 : i64
      %1505 = func.call @cc_make_string(%1503, %1504) : (!llvm.ptr, i64) -> i64
      %1506 = func.call @cc_nil_value() : () -> i64
      %1507 = func.call @cc_intern(%1505, %1506) : (i64, i64) -> i64
      %1508 = func.call @cc_nil_value() : () -> i64
      %1509 = func.call @cc_cons(%1507, %1508) : (i64, i64) -> i64
      %1510 = func.call @cc_values_pack(%1509) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1511 = arith.addi %1507, %__rlasp_stack_elide_zero_65 : i64
      %1512 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1513 = arith.constant 8 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = func.call @cc_nil_value() : () -> i64
      %1516 = func.call @cc_intern(%1514, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_values_pack(%1518) : (i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1520 = arith.addi %1516, %__rlasp_stack_elide_zero_66 : i64
      %1536 = arith.constant 108321407238150 : i64
      %1537 = arith.constant 0 : i64
      %1538 = func.call @cc_make_closure(%1536, %1537) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1539 = arith.addi %1538, %__rlasp_stack_elide_zero_67 : i64
      %1540 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1540) : (i64) -> ()
      %1541 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1541) : (i64) -> ()
      %1542 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1542) : (i64) -> ()
      %1543 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1543) : (i64) -> ()
      %1544 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1544) : (i64) -> ()
      %1545 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1545) : (i64) -> ()
      %1546 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1546) : (i64) -> ()
      %1547 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1547) : (i64) -> ()
      %1548 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1548) : (i64) -> ()
      %1549 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1549) : (i64) -> ()
      %1550 = arith.constant 10 : i64
      %1551 = func.call @cc_box_fixnum(%1550) : (i64) -> i64
      %1552 = func.call @cc_make_vector(%1551) : (i64) -> i64
      %1553 = func.call @stack_pop_pointer() : () -> i64
      %1554 = arith.constant 9 : i64
      %1555 = func.call @cc_box_fixnum(%1554) : (i64) -> i64
      %1556 = func.call @cc_svset(%1552, %1555, %1553) : (i64, i64, i64) -> i64
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = arith.constant 8 : i64
      %1559 = func.call @cc_box_fixnum(%1558) : (i64) -> i64
      %1560 = func.call @cc_svset(%1552, %1559, %1557) : (i64, i64, i64) -> i64
      %1561 = func.call @stack_pop_pointer() : () -> i64
      %1562 = arith.constant 7 : i64
      %1563 = func.call @cc_box_fixnum(%1562) : (i64) -> i64
      %1564 = func.call @cc_svset(%1552, %1563, %1561) : (i64, i64, i64) -> i64
      %1565 = func.call @stack_pop_pointer() : () -> i64
      %1566 = arith.constant 6 : i64
      %1567 = func.call @cc_box_fixnum(%1566) : (i64) -> i64
      %1568 = func.call @cc_svset(%1552, %1567, %1565) : (i64, i64, i64) -> i64
      %1569 = func.call @stack_pop_pointer() : () -> i64
      %1570 = arith.constant 5 : i64
      %1571 = func.call @cc_box_fixnum(%1570) : (i64) -> i64
      %1572 = func.call @cc_svset(%1552, %1571, %1569) : (i64, i64, i64) -> i64
      %1573 = func.call @stack_pop_pointer() : () -> i64
      %1574 = arith.constant 4 : i64
      %1575 = func.call @cc_box_fixnum(%1574) : (i64) -> i64
      %1576 = func.call @cc_svset(%1552, %1575, %1573) : (i64, i64, i64) -> i64
      %1577 = func.call @stack_pop_pointer() : () -> i64
      %1578 = arith.constant 3 : i64
      %1579 = func.call @cc_box_fixnum(%1578) : (i64) -> i64
      %1580 = func.call @cc_svset(%1552, %1579, %1577) : (i64, i64, i64) -> i64
      %1581 = func.call @stack_pop_pointer() : () -> i64
      %1582 = arith.constant 2 : i64
      %1583 = func.call @cc_box_fixnum(%1582) : (i64) -> i64
      %1584 = func.call @cc_svset(%1552, %1583, %1581) : (i64, i64, i64) -> i64
      %1585 = func.call @stack_pop_pointer() : () -> i64
      %1586 = arith.constant 1 : i64
      %1587 = func.call @cc_box_fixnum(%1586) : (i64) -> i64
      %1588 = func.call @cc_svset(%1552, %1587, %1585) : (i64, i64, i64) -> i64
      %1589 = func.call @stack_pop_pointer() : () -> i64
      %1590 = arith.constant 0 : i64
      %1591 = func.call @cc_box_fixnum(%1590) : (i64) -> i64
      %1592 = func.call @cc_svset(%1552, %1591, %1589) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%1552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1593 = func.call @stack_pop_pointer() : () -> i64
      %1594 = func.call @stack_pop_pointer() : () -> i64
      %1595 = func.call @cc_cons(%1594, %1593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1596 = arith.addi %1595, %__rlasp_stack_elide_zero_68 : i64
      %1597 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1598 = arith.constant 11 : i64
      %1599 = func.call @cc_make_string(%1597, %1598) : (!llvm.ptr, i64) -> i64
      %1600 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1601 = arith.constant 7 : i64
      %1602 = func.call @cc_make_string(%1600, %1601) : (!llvm.ptr, i64) -> i64
      %1603 = func.call @cc_intern(%1599, %1602) : (i64, i64) -> i64
      %1604 = func.call @cc_nil_value() : () -> i64
      %1605 = func.call @cc_cons(%1603, %1604) : (i64, i64) -> i64
      %1606 = func.call @cc_values_pack(%1605) : (i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1609 = arith.constant 4 : i64
      %1610 = func.call @cc_make_string(%1608, %1609) : (!llvm.ptr, i64) -> i64
      %1611 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1612 = arith.constant 7 : i64
      %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
      %1614 = func.call @cc_intern(%1610, %1613) : (i64, i64) -> i64
      %1615 = func.call @cc_nil_value() : () -> i64
      %1616 = func.call @cc_cons(%1614, %1615) : (i64, i64) -> i64
      %1617 = func.call @cc_values_pack(%1616) : (i64) -> i64
      %1618 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1619 = arith.constant 6 : i64
      %1620 = func.call @cc_make_string(%1618, %1619) : (!llvm.ptr, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_intern(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_nil_value() : () -> i64
      %1624 = func.call @cc_cons(%1622, %1623) : (i64, i64) -> i64
      %1625 = func.call @cc_values_pack(%1624) : (i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1626 = arith.addi %1622, %__rlasp_stack_elide_zero_69 : i64
      %1627 = func.call @cc_nil_value() : () -> i64
      %1628 = func.call @cc_errorp(%1511) : (i64) -> i64
      %1629 = arith.cmpi ne, %1628, %1627 : i64
      %1630 = arith.cmpi eq, %1627, %1627 : i64
      %1631 = arith.andi %1629, %1630 : i1
      %1632 = scf.if %1631 -> (i64) {
        scf.yield %1511 : i64
      } else {
        scf.yield %1627 : i64
      }
      %1633 = func.call @cc_errorp(%1520) : (i64) -> i64
      %1634 = arith.cmpi ne, %1633, %1627 : i64
      %1635 = arith.cmpi eq, %1632, %1627 : i64
      %1636 = arith.andi %1634, %1635 : i1
      %1637 = scf.if %1636 -> (i64) {
        scf.yield %1520 : i64
      } else {
        scf.yield %1632 : i64
      }
      %1638 = func.call @cc_errorp(%1539) : (i64) -> i64
      %1639 = arith.cmpi ne, %1638, %1627 : i64
      %1640 = arith.cmpi eq, %1637, %1627 : i64
      %1641 = arith.andi %1639, %1640 : i1
      %1642 = scf.if %1641 -> (i64) {
        scf.yield %1539 : i64
      } else {
        scf.yield %1637 : i64
      }
      %1643 = func.call @cc_errorp(%1596) : (i64) -> i64
      %1644 = arith.cmpi ne, %1643, %1627 : i64
      %1645 = arith.cmpi eq, %1642, %1627 : i64
      %1646 = arith.andi %1644, %1645 : i1
      %1647 = scf.if %1646 -> (i64) {
        scf.yield %1596 : i64
      } else {
        scf.yield %1642 : i64
      }
      %1648 = func.call @cc_errorp(%1603) : (i64) -> i64
      %1649 = arith.cmpi ne, %1648, %1627 : i64
      %1650 = arith.cmpi eq, %1647, %1627 : i64
      %1651 = arith.andi %1649, %1650 : i1
      %1652 = scf.if %1651 -> (i64) {
        scf.yield %1603 : i64
      } else {
        scf.yield %1647 : i64
      }
      %1653 = func.call @cc_errorp(%1607) : (i64) -> i64
      %1654 = arith.cmpi ne, %1653, %1627 : i64
      %1655 = arith.cmpi eq, %1652, %1627 : i64
      %1656 = arith.andi %1654, %1655 : i1
      %1657 = scf.if %1656 -> (i64) {
        scf.yield %1607 : i64
      } else {
        scf.yield %1652 : i64
      }
      %1658 = func.call @cc_errorp(%1614) : (i64) -> i64
      %1659 = arith.cmpi ne, %1658, %1627 : i64
      %1660 = arith.cmpi eq, %1657, %1627 : i64
      %1661 = arith.andi %1659, %1660 : i1
      %1662 = scf.if %1661 -> (i64) {
        scf.yield %1614 : i64
      } else {
        scf.yield %1657 : i64
      }
      %1663 = func.call @cc_errorp(%1626) : (i64) -> i64
      %1664 = arith.cmpi ne, %1663, %1627 : i64
      %1665 = arith.cmpi eq, %1662, %1627 : i64
      %1666 = arith.andi %1664, %1665 : i1
      %1667 = scf.if %1666 -> (i64) {
        scf.yield %1626 : i64
      } else {
        scf.yield %1662 : i64
      }
      %1668 = arith.cmpi ne, %1667, %1627 : i64
      scf.if %1668 {
        func.call @stack_push_pointer(%1667) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1511) : (i64) -> ()
        func.call @stack_push_pointer(%1520) : (i64) -> ()
        func.call @stack_push_pointer(%1539) : (i64) -> ()
        func.call @stack_push_pointer(%1596) : (i64) -> ()
        func.call @stack_push_pointer(%1603) : (i64) -> ()
        func.call @stack_push_pointer(%1607) : (i64) -> ()
        func.call @stack_push_pointer(%1614) : (i64) -> ()
        func.call @stack_push_pointer(%1626) : (i64) -> ()
        %1669 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1670 = func.call @cc_make_function_ref_const(%1669) : (!llvm.ptr) -> i64
        %1671 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1670, %1671) : (i64, i64) -> ()
      }
      %1672 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1672 : i64
    }
    %1673 = func.call @cc_nil_value() : () -> i64
    %1674 = func.call @cc_errorp(%1502) : (i64) -> i64
    %1675 = arith.cmpi ne, %1674, %1673 : i64
    %1676 = scf.if %1675 -> (i64) {
      scf.yield %1502 : i64
    } else {
      %1677 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1678 = arith.constant 8 : i64
      %1679 = func.call @cc_make_string(%1677, %1678) : (!llvm.ptr, i64) -> i64
      %1680 = func.call @cc_nil_value() : () -> i64
      %1681 = func.call @cc_intern(%1679, %1680) : (i64, i64) -> i64
      %1682 = func.call @cc_nil_value() : () -> i64
      %1683 = func.call @cc_cons(%1681, %1682) : (i64, i64) -> i64
      %1684 = func.call @cc_values_pack(%1683) : (i64) -> i64
      %1685 = func.call @cc_symbol_value(%1681) : (i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      %1686 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1686) : (i64) -> ()
      %1687 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1687) : (i64) -> ()
      %1688 = func.call @stack_pop_pointer() : () -> i64
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @cc_set_elt(%1690, %1689, %1688) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1692 = arith.addi %1691, %__rlasp_stack_elide_zero_70 : i64
      scf.yield %1692 : i64
    }
    %1693 = func.call @cc_nil_value() : () -> i64
    %1694 = func.call @cc_errorp(%1676) : (i64) -> i64
    %1695 = arith.cmpi ne, %1694, %1693 : i64
    %1696 = scf.if %1695 -> (i64) {
      scf.yield %1676 : i64
    } else {
      %1697 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1698 = arith.constant 4 : i64
      %1699 = func.call @cc_make_string(%1697, %1698) : (!llvm.ptr, i64) -> i64
      %1700 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1701 = arith.constant 11 : i64
      %1702 = func.call @cc_make_string(%1700, %1701) : (!llvm.ptr, i64) -> i64
      %1703 = func.call @cc_intern(%1699, %1702) : (i64, i64) -> i64
      %1704 = func.call @cc_nil_value() : () -> i64
      %1705 = func.call @cc_cons(%1703, %1704) : (i64, i64) -> i64
      %1706 = func.call @cc_values_pack(%1705) : (i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1707 = arith.addi %1703, %__rlasp_stack_elide_zero_71 : i64
      %1708 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1709 = arith.constant 8 : i64
      %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_intern(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_cons(%1712, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_values_pack(%1714) : (i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1716 = arith.addi %1712, %__rlasp_stack_elide_zero_72 : i64
      %1732 = arith.constant 108321407238151 : i64
      %1733 = arith.constant 0 : i64
      %1734 = func.call @cc_make_closure(%1732, %1733) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1735 = arith.addi %1734, %__rlasp_stack_elide_zero_73 : i64
      %1736 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1736) : (i64) -> ()
      %1737 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1737) : (i64) -> ()
      %1738 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1738) : (i64) -> ()
      %1739 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1739) : (i64) -> ()
      %1740 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1740) : (i64) -> ()
      %1741 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1741) : (i64) -> ()
      %1742 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1742) : (i64) -> ()
      %1743 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1743) : (i64) -> ()
      %1744 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1744) : (i64) -> ()
      %1745 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1745) : (i64) -> ()
      %1746 = arith.constant 10 : i64
      %1747 = func.call @cc_box_fixnum(%1746) : (i64) -> i64
      %1748 = func.call @cc_make_vector(%1747) : (i64) -> i64
      %1749 = func.call @stack_pop_pointer() : () -> i64
      %1750 = arith.constant 9 : i64
      %1751 = func.call @cc_box_fixnum(%1750) : (i64) -> i64
      %1752 = func.call @cc_svset(%1748, %1751, %1749) : (i64, i64, i64) -> i64
      %1753 = func.call @stack_pop_pointer() : () -> i64
      %1754 = arith.constant 8 : i64
      %1755 = func.call @cc_box_fixnum(%1754) : (i64) -> i64
      %1756 = func.call @cc_svset(%1748, %1755, %1753) : (i64, i64, i64) -> i64
      %1757 = func.call @stack_pop_pointer() : () -> i64
      %1758 = arith.constant 7 : i64
      %1759 = func.call @cc_box_fixnum(%1758) : (i64) -> i64
      %1760 = func.call @cc_svset(%1748, %1759, %1757) : (i64, i64, i64) -> i64
      %1761 = func.call @stack_pop_pointer() : () -> i64
      %1762 = arith.constant 6 : i64
      %1763 = func.call @cc_box_fixnum(%1762) : (i64) -> i64
      %1764 = func.call @cc_svset(%1748, %1763, %1761) : (i64, i64, i64) -> i64
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = arith.constant 5 : i64
      %1767 = func.call @cc_box_fixnum(%1766) : (i64) -> i64
      %1768 = func.call @cc_svset(%1748, %1767, %1765) : (i64, i64, i64) -> i64
      %1769 = func.call @stack_pop_pointer() : () -> i64
      %1770 = arith.constant 4 : i64
      %1771 = func.call @cc_box_fixnum(%1770) : (i64) -> i64
      %1772 = func.call @cc_svset(%1748, %1771, %1769) : (i64, i64, i64) -> i64
      %1773 = func.call @stack_pop_pointer() : () -> i64
      %1774 = arith.constant 3 : i64
      %1775 = func.call @cc_box_fixnum(%1774) : (i64) -> i64
      %1776 = func.call @cc_svset(%1748, %1775, %1773) : (i64, i64, i64) -> i64
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = arith.constant 2 : i64
      %1779 = func.call @cc_box_fixnum(%1778) : (i64) -> i64
      %1780 = func.call @cc_svset(%1748, %1779, %1777) : (i64, i64, i64) -> i64
      %1781 = func.call @stack_pop_pointer() : () -> i64
      %1782 = arith.constant 1 : i64
      %1783 = func.call @cc_box_fixnum(%1782) : (i64) -> i64
      %1784 = func.call @cc_svset(%1748, %1783, %1781) : (i64, i64, i64) -> i64
      %1785 = func.call @stack_pop_pointer() : () -> i64
      %1786 = arith.constant 0 : i64
      %1787 = func.call @cc_box_fixnum(%1786) : (i64) -> i64
      %1788 = func.call @cc_svset(%1748, %1787, %1785) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%1748) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @cc_cons(%1790, %1789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1792 = arith.addi %1791, %__rlasp_stack_elide_zero_74 : i64
      %1793 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1794 = arith.constant 11 : i64
      %1795 = func.call @cc_make_string(%1793, %1794) : (!llvm.ptr, i64) -> i64
      %1796 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1797 = arith.constant 7 : i64
      %1798 = func.call @cc_make_string(%1796, %1797) : (!llvm.ptr, i64) -> i64
      %1799 = func.call @cc_intern(%1795, %1798) : (i64, i64) -> i64
      %1800 = func.call @cc_nil_value() : () -> i64
      %1801 = func.call @cc_cons(%1799, %1800) : (i64, i64) -> i64
      %1802 = func.call @cc_values_pack(%1801) : (i64) -> i64
      %1803 = func.call @cc_nil_value() : () -> i64
      %1804 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1805 = arith.constant 4 : i64
      %1806 = func.call @cc_make_string(%1804, %1805) : (!llvm.ptr, i64) -> i64
      %1807 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1808 = arith.constant 7 : i64
      %1809 = func.call @cc_make_string(%1807, %1808) : (!llvm.ptr, i64) -> i64
      %1810 = func.call @cc_intern(%1806, %1809) : (i64, i64) -> i64
      %1811 = func.call @cc_nil_value() : () -> i64
      %1812 = func.call @cc_cons(%1810, %1811) : (i64, i64) -> i64
      %1813 = func.call @cc_values_pack(%1812) : (i64) -> i64
      %1814 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1815 = arith.constant 6 : i64
      %1816 = func.call @cc_make_string(%1814, %1815) : (!llvm.ptr, i64) -> i64
      %1817 = func.call @cc_nil_value() : () -> i64
      %1818 = func.call @cc_intern(%1816, %1817) : (i64, i64) -> i64
      %1819 = func.call @cc_nil_value() : () -> i64
      %1820 = func.call @cc_cons(%1818, %1819) : (i64, i64) -> i64
      %1821 = func.call @cc_values_pack(%1820) : (i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1822 = arith.addi %1818, %__rlasp_stack_elide_zero_75 : i64
      %1823 = func.call @cc_nil_value() : () -> i64
      %1824 = func.call @cc_errorp(%1707) : (i64) -> i64
      %1825 = arith.cmpi ne, %1824, %1823 : i64
      %1826 = arith.cmpi eq, %1823, %1823 : i64
      %1827 = arith.andi %1825, %1826 : i1
      %1828 = scf.if %1827 -> (i64) {
        scf.yield %1707 : i64
      } else {
        scf.yield %1823 : i64
      }
      %1829 = func.call @cc_errorp(%1716) : (i64) -> i64
      %1830 = arith.cmpi ne, %1829, %1823 : i64
      %1831 = arith.cmpi eq, %1828, %1823 : i64
      %1832 = arith.andi %1830, %1831 : i1
      %1833 = scf.if %1832 -> (i64) {
        scf.yield %1716 : i64
      } else {
        scf.yield %1828 : i64
      }
      %1834 = func.call @cc_errorp(%1735) : (i64) -> i64
      %1835 = arith.cmpi ne, %1834, %1823 : i64
      %1836 = arith.cmpi eq, %1833, %1823 : i64
      %1837 = arith.andi %1835, %1836 : i1
      %1838 = scf.if %1837 -> (i64) {
        scf.yield %1735 : i64
      } else {
        scf.yield %1833 : i64
      }
      %1839 = func.call @cc_errorp(%1792) : (i64) -> i64
      %1840 = arith.cmpi ne, %1839, %1823 : i64
      %1841 = arith.cmpi eq, %1838, %1823 : i64
      %1842 = arith.andi %1840, %1841 : i1
      %1843 = scf.if %1842 -> (i64) {
        scf.yield %1792 : i64
      } else {
        scf.yield %1838 : i64
      }
      %1844 = func.call @cc_errorp(%1799) : (i64) -> i64
      %1845 = arith.cmpi ne, %1844, %1823 : i64
      %1846 = arith.cmpi eq, %1843, %1823 : i64
      %1847 = arith.andi %1845, %1846 : i1
      %1848 = scf.if %1847 -> (i64) {
        scf.yield %1799 : i64
      } else {
        scf.yield %1843 : i64
      }
      %1849 = func.call @cc_errorp(%1803) : (i64) -> i64
      %1850 = arith.cmpi ne, %1849, %1823 : i64
      %1851 = arith.cmpi eq, %1848, %1823 : i64
      %1852 = arith.andi %1850, %1851 : i1
      %1853 = scf.if %1852 -> (i64) {
        scf.yield %1803 : i64
      } else {
        scf.yield %1848 : i64
      }
      %1854 = func.call @cc_errorp(%1810) : (i64) -> i64
      %1855 = arith.cmpi ne, %1854, %1823 : i64
      %1856 = arith.cmpi eq, %1853, %1823 : i64
      %1857 = arith.andi %1855, %1856 : i1
      %1858 = scf.if %1857 -> (i64) {
        scf.yield %1810 : i64
      } else {
        scf.yield %1853 : i64
      }
      %1859 = func.call @cc_errorp(%1822) : (i64) -> i64
      %1860 = arith.cmpi ne, %1859, %1823 : i64
      %1861 = arith.cmpi eq, %1858, %1823 : i64
      %1862 = arith.andi %1860, %1861 : i1
      %1863 = scf.if %1862 -> (i64) {
        scf.yield %1822 : i64
      } else {
        scf.yield %1858 : i64
      }
      %1864 = arith.cmpi ne, %1863, %1823 : i64
      scf.if %1864 {
        func.call @stack_push_pointer(%1863) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1707) : (i64) -> ()
        func.call @stack_push_pointer(%1716) : (i64) -> ()
        func.call @stack_push_pointer(%1735) : (i64) -> ()
        func.call @stack_push_pointer(%1792) : (i64) -> ()
        func.call @stack_push_pointer(%1799) : (i64) -> ()
        func.call @stack_push_pointer(%1803) : (i64) -> ()
        func.call @stack_push_pointer(%1810) : (i64) -> ()
        func.call @stack_push_pointer(%1822) : (i64) -> ()
        %1865 = llvm.mlir.addressof @str153 : !llvm.ptr
        %1866 = func.call @cc_make_function_ref_const(%1865) : (!llvm.ptr) -> i64
        %1867 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1866, %1867) : (i64, i64) -> ()
      }
      %1868 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1868 : i64
    }
    %1869 = func.call @cc_nil_value() : () -> i64
    %1870 = func.call @cc_errorp(%1696) : (i64) -> i64
    %1871 = arith.cmpi ne, %1870, %1869 : i64
    %1872 = scf.if %1871 -> (i64) {
      scf.yield %1696 : i64
    } else {
      %1873 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1874 = arith.constant 4 : i64
      %1875 = func.call @cc_make_string(%1873, %1874) : (!llvm.ptr, i64) -> i64
      %1876 = func.call @cc_nil_value() : () -> i64
      %1877 = func.call @cc_intern(%1875, %1876) : (i64, i64) -> i64
      %1878 = func.call @cc_nil_value() : () -> i64
      %1879 = func.call @cc_cons(%1877, %1878) : (i64, i64) -> i64
      %1880 = func.call @cc_values_pack(%1879) : (i64) -> i64
      %1881 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1882 = arith.constant 44 : i64
      %1883 = func.call @cc_parse_bignum(%1881, %1882) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1884 = arith.addi %1883, %__rlasp_stack_elide_zero_76 : i64
      %1885 = func.call @cc_set_symbol_value(%1877, %1884) : (i64, i64) -> i64
      %1886 = func.call @cc_errorp(%1885) : (i64) -> i64
      %1887 = func.call @cc_nil_value() : () -> i64
      %1888 = arith.cmpi ne, %1886, %1887 : i64
      scf.if %1888 {
        func.call @stack_push_pointer(%1885) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1877) : (i64) -> ()
      }
      %1889 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1889 : i64
    }
    %1890 = func.call @cc_nil_value() : () -> i64
    %1891 = func.call @cc_errorp(%1872) : (i64) -> i64
    %1892 = arith.cmpi ne, %1891, %1890 : i64
    %1893 = scf.if %1892 -> (i64) {
      scf.yield %1872 : i64
    } else {
      %1894 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1895 = arith.constant 3 : i64
      %1896 = func.call @cc_make_string(%1894, %1895) : (!llvm.ptr, i64) -> i64
      %1897 = func.call @cc_nil_value() : () -> i64
      %1898 = func.call @cc_intern(%1896, %1897) : (i64, i64) -> i64
      %1899 = func.call @cc_nil_value() : () -> i64
      %1900 = func.call @cc_cons(%1898, %1899) : (i64, i64) -> i64
      %1901 = func.call @cc_values_pack(%1900) : (i64) -> i64
      %1902 = arith.constant 256 : i64
      %1903 = func.call @cc_box_fixnum(%1902) : (i64) -> i64
      %1904 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1905 = arith.constant 12 : i64
      %1906 = func.call @cc_make_string(%1904, %1905) : (!llvm.ptr, i64) -> i64
      %1907 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1908 = arith.constant 7 : i64
      %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
      %1910 = func.call @cc_intern(%1906, %1909) : (i64, i64) -> i64
      %1911 = func.call @cc_nil_value() : () -> i64
      %1912 = func.call @cc_cons(%1910, %1911) : (i64, i64) -> i64
      %1913 = func.call @cc_values_pack(%1912) : (i64) -> i64
      %1914 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1915 = arith.constant 9 : i64
      %1916 = func.call @cc_make_string(%1914, %1915) : (!llvm.ptr, i64) -> i64
      %1917 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1918 = arith.constant 11 : i64
      %1919 = func.call @cc_make_string(%1917, %1918) : (!llvm.ptr, i64) -> i64
      %1920 = func.call @cc_intern(%1916, %1919) : (i64, i64) -> i64
      %1921 = func.call @cc_nil_value() : () -> i64
      %1922 = func.call @cc_cons(%1920, %1921) : (i64, i64) -> i64
      %1923 = func.call @cc_values_pack(%1922) : (i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1924 = arith.addi %1920, %__rlasp_stack_elide_zero_77 : i64
      %1925 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1926 = arith.constant 12 : i64
      %1927 = func.call @cc_make_string(%1925, %1926) : (!llvm.ptr, i64) -> i64
      %1928 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1929 = arith.constant 7 : i64
      %1930 = func.call @cc_make_string(%1928, %1929) : (!llvm.ptr, i64) -> i64
      %1931 = func.call @cc_intern(%1927, %1930) : (i64, i64) -> i64
      %1932 = func.call @cc_nil_value() : () -> i64
      %1933 = func.call @cc_cons(%1931, %1932) : (i64, i64) -> i64
      %1934 = func.call @cc_values_pack(%1933) : (i64) -> i64
      %1935 = arith.constant 0 : i64
      %1936 = func.call @cc_box_fixnum(%1935) : (i64) -> i64
      %1937 = func.call @cc_nil_value() : () -> i64
      %1938 = func.call @cc_errorp(%1903) : (i64) -> i64
      %1939 = arith.cmpi ne, %1938, %1937 : i64
      %1940 = arith.cmpi eq, %1937, %1937 : i64
      %1941 = arith.andi %1939, %1940 : i1
      %1942 = scf.if %1941 -> (i64) {
        scf.yield %1903 : i64
      } else {
        scf.yield %1937 : i64
      }
      %1943 = func.call @cc_errorp(%1910) : (i64) -> i64
      %1944 = arith.cmpi ne, %1943, %1937 : i64
      %1945 = arith.cmpi eq, %1942, %1937 : i64
      %1946 = arith.andi %1944, %1945 : i1
      %1947 = scf.if %1946 -> (i64) {
        scf.yield %1910 : i64
      } else {
        scf.yield %1942 : i64
      }
      %1948 = func.call @cc_errorp(%1924) : (i64) -> i64
      %1949 = arith.cmpi ne, %1948, %1937 : i64
      %1950 = arith.cmpi eq, %1947, %1937 : i64
      %1951 = arith.andi %1949, %1950 : i1
      %1952 = scf.if %1951 -> (i64) {
        scf.yield %1924 : i64
      } else {
        scf.yield %1947 : i64
      }
      %1953 = func.call @cc_errorp(%1931) : (i64) -> i64
      %1954 = arith.cmpi ne, %1953, %1937 : i64
      %1955 = arith.cmpi eq, %1952, %1937 : i64
      %1956 = arith.andi %1954, %1955 : i1
      %1957 = scf.if %1956 -> (i64) {
        scf.yield %1931 : i64
      } else {
        scf.yield %1952 : i64
      }
      %1958 = func.call @cc_errorp(%1936) : (i64) -> i64
      %1959 = arith.cmpi ne, %1958, %1937 : i64
      %1960 = arith.cmpi eq, %1957, %1937 : i64
      %1961 = arith.andi %1959, %1960 : i1
      %1962 = scf.if %1961 -> (i64) {
        scf.yield %1936 : i64
      } else {
        scf.yield %1957 : i64
      }
      %1963 = arith.cmpi ne, %1962, %1937 : i64
      scf.if %1963 {
        func.call @stack_push_pointer(%1962) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1903) : (i64) -> ()
        func.call @stack_push_pointer(%1910) : (i64) -> ()
        func.call @stack_push_pointer(%1924) : (i64) -> ()
        func.call @stack_push_pointer(%1931) : (i64) -> ()
        func.call @stack_push_pointer(%1936) : (i64) -> ()
        %1964 = llvm.mlir.addressof @str163 : !llvm.ptr
        %1965 = func.call @cc_make_function_ref_const(%1964) : (!llvm.ptr) -> i64
        %1966 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1965, %1966) : (i64, i64) -> ()
      }
      %1967 = func.call @stack_pop_pointer() : () -> i64
      %1968 = func.call @cc_set_symbol_value(%1898, %1967) : (i64, i64) -> i64
      %1969 = func.call @cc_errorp(%1968) : (i64) -> i64
      %1970 = func.call @cc_nil_value() : () -> i64
      %1971 = arith.cmpi ne, %1969, %1970 : i64
      scf.if %1971 {
        func.call @stack_push_pointer(%1968) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1898) : (i64) -> ()
      }
      %1972 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1972 : i64
    }
    %1973 = func.call @cc_nil_value() : () -> i64
    %1974 = func.call @cc_errorp(%1893) : (i64) -> i64
    %1975 = arith.cmpi ne, %1974, %1973 : i64
    %1976 = scf.if %1975 -> (i64) {
      scf.yield %1893 : i64
    } else {
      %1977 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1978 = arith.constant 3 : i64
      %1979 = func.call @cc_make_string(%1977, %1978) : (!llvm.ptr, i64) -> i64
      %1980 = func.call @cc_nil_value() : () -> i64
      %1981 = func.call @cc_intern(%1979, %1980) : (i64, i64) -> i64
      %1982 = func.call @cc_nil_value() : () -> i64
      %1983 = func.call @cc_cons(%1981, %1982) : (i64, i64) -> i64
      %1984 = func.call @cc_values_pack(%1983) : (i64) -> i64
      %1985 = func.call @cc_symbol_value(%1981) : (i64) -> i64
      %1986 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1987 = arith.constant 4 : i64
      %1988 = func.call @cc_make_string(%1986, %1987) : (!llvm.ptr, i64) -> i64
      %1989 = func.call @cc_nil_value() : () -> i64
      %1990 = func.call @cc_intern(%1988, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_cons(%1990, %1991) : (i64, i64) -> i64
      %1993 = func.call @cc_values_pack(%1992) : (i64) -> i64
      %1994 = func.call @cc_symbol_value(%1990) : (i64) -> i64
      %1995 = arith.constant 10 : i64
      %1996 = func.call @cc_box_fixnum(%1995) : (i64) -> i64
      %1997 = func.call @cc_nil_value() : () -> i64
      %1998 = func.call @cc_nil_value() : () -> i64
      %1999 = func.call @cc_nil_value() : () -> i64
      %2000 = func.call @cc_errorp(%1985) : (i64) -> i64
      %2001 = arith.cmpi ne, %2000, %1999 : i64
      %2002 = arith.cmpi eq, %1999, %1999 : i64
      %2003 = arith.andi %2001, %2002 : i1
      %2004 = scf.if %2003 -> (i64) {
        scf.yield %1985 : i64
      } else {
        scf.yield %1999 : i64
      }
      %2005 = func.call @cc_errorp(%1994) : (i64) -> i64
      %2006 = arith.cmpi ne, %2005, %1999 : i64
      %2007 = arith.cmpi eq, %2004, %1999 : i64
      %2008 = arith.andi %2006, %2007 : i1
      %2009 = scf.if %2008 -> (i64) {
        scf.yield %1994 : i64
      } else {
        scf.yield %2004 : i64
      }
      %2010 = func.call @cc_errorp(%1996) : (i64) -> i64
      %2011 = arith.cmpi ne, %2010, %1999 : i64
      %2012 = arith.cmpi eq, %2009, %1999 : i64
      %2013 = arith.andi %2011, %2012 : i1
      %2014 = scf.if %2013 -> (i64) {
        scf.yield %1996 : i64
      } else {
        scf.yield %2009 : i64
      }
      %2015 = func.call @cc_errorp(%1997) : (i64) -> i64
      %2016 = arith.cmpi ne, %2015, %1999 : i64
      %2017 = arith.cmpi eq, %2014, %1999 : i64
      %2018 = arith.andi %2016, %2017 : i1
      %2019 = scf.if %2018 -> (i64) {
        scf.yield %1997 : i64
      } else {
        scf.yield %2014 : i64
      }
      %2020 = func.call @cc_errorp(%1998) : (i64) -> i64
      %2021 = arith.cmpi ne, %2020, %1999 : i64
      %2022 = arith.cmpi eq, %2019, %1999 : i64
      %2023 = arith.andi %2021, %2022 : i1
      %2024 = scf.if %2023 -> (i64) {
        scf.yield %1998 : i64
      } else {
        scf.yield %2019 : i64
      }
      %2025 = arith.cmpi ne, %2024, %1999 : i64
      scf.if %2025 {
        func.call @stack_push_pointer(%2024) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1985) : (i64) -> ()
        func.call @stack_push_pointer(%1994) : (i64) -> ()
        func.call @stack_push_pointer(%1996) : (i64) -> ()
        func.call @stack_push_pointer(%1997) : (i64) -> ()
        func.call @stack_push_pointer(%1998) : (i64) -> ()
        %2026 = llvm.mlir.addressof @str166 : !llvm.ptr
        %2027 = func.call @cc_make_function_ref_const(%2026) : (!llvm.ptr) -> i64
        %2028 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2027, %2028) : (i64, i64) -> ()
      }
      %2029 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2029 : i64
    }
    %2030 = func.call @cc_nil_value() : () -> i64
    %2031 = func.call @cc_errorp(%1976) : (i64) -> i64
    %2032 = arith.cmpi ne, %2031, %2030 : i64
    %2033 = scf.if %2032 -> (i64) {
      scf.yield %1976 : i64
    } else {
      %2034 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2035 = arith.constant 26 : i64
      %2036 = func.call @cc_make_string(%2034, %2035) : (!llvm.ptr, i64) -> i64
      %2037 = func.call @cc_nil_value() : () -> i64
      %2038 = func.call @cc_intern(%2036, %2037) : (i64, i64) -> i64
      %2039 = func.call @cc_nil_value() : () -> i64
      %2040 = func.call @cc_cons(%2038, %2039) : (i64, i64) -> i64
      %2041 = func.call @cc_values_pack(%2040) : (i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %2042 = arith.addi %2038, %__rlasp_stack_elide_zero_78 : i64
      %2043 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2044 = arith.constant 3 : i64
      %2045 = func.call @cc_make_string(%2043, %2044) : (!llvm.ptr, i64) -> i64
      %2046 = func.call @cc_nil_value() : () -> i64
      %2047 = func.call @cc_intern(%2045, %2046) : (i64, i64) -> i64
      %2048 = func.call @cc_nil_value() : () -> i64
      %2049 = func.call @cc_cons(%2047, %2048) : (i64, i64) -> i64
      %2050 = func.call @cc_values_pack(%2049) : (i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %2051 = arith.addi %2047, %__rlasp_stack_elide_zero_79 : i64
      %2067 = arith.constant 108321407238152 : i64
      %2068 = arith.constant 0 : i64
      %2069 = func.call @cc_make_closure(%2067, %2068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %2070 = arith.addi %2069, %__rlasp_stack_elide_zero_80 : i64
      %2071 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2072 = arith.constant 44 : i64
      %2073 = func.call @cc_make_string(%2071, %2072) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2073) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @stack_pop_pointer() : () -> i64
      %2076 = func.call @cc_cons(%2075, %2074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %2077 = arith.addi %2076, %__rlasp_stack_elide_zero_81 : i64
      %2078 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2079 = arith.constant 11 : i64
      %2080 = func.call @cc_make_string(%2078, %2079) : (!llvm.ptr, i64) -> i64
      %2081 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2082 = arith.constant 7 : i64
      %2083 = func.call @cc_make_string(%2081, %2082) : (!llvm.ptr, i64) -> i64
      %2084 = func.call @cc_intern(%2080, %2083) : (i64, i64) -> i64
      %2085 = func.call @cc_nil_value() : () -> i64
      %2086 = func.call @cc_cons(%2084, %2085) : (i64, i64) -> i64
      %2087 = func.call @cc_values_pack(%2086) : (i64) -> i64
      %2088 = func.call @cc_nil_value() : () -> i64
      %2089 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2090 = arith.constant 4 : i64
      %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
      %2092 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2093 = arith.constant 7 : i64
      %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
      %2095 = func.call @cc_intern(%2091, %2094) : (i64, i64) -> i64
      %2096 = func.call @cc_nil_value() : () -> i64
      %2097 = func.call @cc_cons(%2095, %2096) : (i64, i64) -> i64
      %2098 = func.call @cc_values_pack(%2097) : (i64) -> i64
      %2099 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2100 = arith.constant 7 : i64
      %2101 = func.call @cc_make_string(%2099, %2100) : (!llvm.ptr, i64) -> i64
      %2102 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2103 = arith.constant 11 : i64
      %2104 = func.call @cc_make_string(%2102, %2103) : (!llvm.ptr, i64) -> i64
      %2105 = func.call @cc_intern(%2101, %2104) : (i64, i64) -> i64
      %2106 = func.call @cc_nil_value() : () -> i64
      %2107 = func.call @cc_cons(%2105, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_values_pack(%2107) : (i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %2109 = arith.addi %2105, %__rlasp_stack_elide_zero_82 : i64
      %2110 = func.call @cc_nil_value() : () -> i64
      %2111 = func.call @cc_errorp(%2042) : (i64) -> i64
      %2112 = arith.cmpi ne, %2111, %2110 : i64
      %2113 = arith.cmpi eq, %2110, %2110 : i64
      %2114 = arith.andi %2112, %2113 : i1
      %2115 = scf.if %2114 -> (i64) {
        scf.yield %2042 : i64
      } else {
        scf.yield %2110 : i64
      }
      %2116 = func.call @cc_errorp(%2051) : (i64) -> i64
      %2117 = arith.cmpi ne, %2116, %2110 : i64
      %2118 = arith.cmpi eq, %2115, %2110 : i64
      %2119 = arith.andi %2117, %2118 : i1
      %2120 = scf.if %2119 -> (i64) {
        scf.yield %2051 : i64
      } else {
        scf.yield %2115 : i64
      }
      %2121 = func.call @cc_errorp(%2070) : (i64) -> i64
      %2122 = arith.cmpi ne, %2121, %2110 : i64
      %2123 = arith.cmpi eq, %2120, %2110 : i64
      %2124 = arith.andi %2122, %2123 : i1
      %2125 = scf.if %2124 -> (i64) {
        scf.yield %2070 : i64
      } else {
        scf.yield %2120 : i64
      }
      %2126 = func.call @cc_errorp(%2077) : (i64) -> i64
      %2127 = arith.cmpi ne, %2126, %2110 : i64
      %2128 = arith.cmpi eq, %2125, %2110 : i64
      %2129 = arith.andi %2127, %2128 : i1
      %2130 = scf.if %2129 -> (i64) {
        scf.yield %2077 : i64
      } else {
        scf.yield %2125 : i64
      }
      %2131 = func.call @cc_errorp(%2084) : (i64) -> i64
      %2132 = arith.cmpi ne, %2131, %2110 : i64
      %2133 = arith.cmpi eq, %2130, %2110 : i64
      %2134 = arith.andi %2132, %2133 : i1
      %2135 = scf.if %2134 -> (i64) {
        scf.yield %2084 : i64
      } else {
        scf.yield %2130 : i64
      }
      %2136 = func.call @cc_errorp(%2088) : (i64) -> i64
      %2137 = arith.cmpi ne, %2136, %2110 : i64
      %2138 = arith.cmpi eq, %2135, %2110 : i64
      %2139 = arith.andi %2137, %2138 : i1
      %2140 = scf.if %2139 -> (i64) {
        scf.yield %2088 : i64
      } else {
        scf.yield %2135 : i64
      }
      %2141 = func.call @cc_errorp(%2095) : (i64) -> i64
      %2142 = arith.cmpi ne, %2141, %2110 : i64
      %2143 = arith.cmpi eq, %2140, %2110 : i64
      %2144 = arith.andi %2142, %2143 : i1
      %2145 = scf.if %2144 -> (i64) {
        scf.yield %2095 : i64
      } else {
        scf.yield %2140 : i64
      }
      %2146 = func.call @cc_errorp(%2109) : (i64) -> i64
      %2147 = arith.cmpi ne, %2146, %2110 : i64
      %2148 = arith.cmpi eq, %2145, %2110 : i64
      %2149 = arith.andi %2147, %2148 : i1
      %2150 = scf.if %2149 -> (i64) {
        scf.yield %2109 : i64
      } else {
        scf.yield %2145 : i64
      }
      %2151 = arith.cmpi ne, %2150, %2110 : i64
      scf.if %2151 {
        func.call @stack_push_pointer(%2150) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2042) : (i64) -> ()
        func.call @stack_push_pointer(%2051) : (i64) -> ()
        func.call @stack_push_pointer(%2070) : (i64) -> ()
        func.call @stack_push_pointer(%2077) : (i64) -> ()
        func.call @stack_push_pointer(%2084) : (i64) -> ()
        func.call @stack_push_pointer(%2088) : (i64) -> ()
        func.call @stack_push_pointer(%2095) : (i64) -> ()
        func.call @stack_push_pointer(%2109) : (i64) -> ()
        %2152 = llvm.mlir.addressof @str177 : !llvm.ptr
        %2153 = func.call @cc_make_function_ref_const(%2152) : (!llvm.ptr) -> i64
        %2154 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2153, %2154) : (i64, i64) -> ()
      }
      %2155 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2155 : i64
    }
    %2156 = func.call @cc_nil_value() : () -> i64
    %2157 = func.call @cc_errorp(%2033) : (i64) -> i64
    %2158 = arith.cmpi ne, %2157, %2156 : i64
    %2159 = scf.if %2158 -> (i64) {
      scf.yield %2033 : i64
    } else {
      %2160 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2161 = arith.constant 3 : i64
      %2162 = func.call @cc_make_string(%2160, %2161) : (!llvm.ptr, i64) -> i64
      %2163 = func.call @cc_nil_value() : () -> i64
      %2164 = func.call @cc_intern(%2162, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_nil_value() : () -> i64
      %2166 = func.call @cc_cons(%2164, %2165) : (i64, i64) -> i64
      %2167 = func.call @cc_values_pack(%2166) : (i64) -> i64
      %2168 = arith.constant 256 : i64
      %2169 = func.call @cc_box_fixnum(%2168) : (i64) -> i64
      %2170 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2171 = arith.constant 12 : i64
      %2172 = func.call @cc_make_string(%2170, %2171) : (!llvm.ptr, i64) -> i64
      %2173 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2174 = arith.constant 7 : i64
      %2175 = func.call @cc_make_string(%2173, %2174) : (!llvm.ptr, i64) -> i64
      %2176 = func.call @cc_intern(%2172, %2175) : (i64, i64) -> i64
      %2177 = func.call @cc_nil_value() : () -> i64
      %2178 = func.call @cc_cons(%2176, %2177) : (i64, i64) -> i64
      %2179 = func.call @cc_values_pack(%2178) : (i64) -> i64
      %2180 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2181 = arith.constant 9 : i64
      %2182 = func.call @cc_make_string(%2180, %2181) : (!llvm.ptr, i64) -> i64
      %2183 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2184 = arith.constant 11 : i64
      %2185 = func.call @cc_make_string(%2183, %2184) : (!llvm.ptr, i64) -> i64
      %2186 = func.call @cc_intern(%2182, %2185) : (i64, i64) -> i64
      %2187 = func.call @cc_nil_value() : () -> i64
      %2188 = func.call @cc_cons(%2186, %2187) : (i64, i64) -> i64
      %2189 = func.call @cc_values_pack(%2188) : (i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %2190 = arith.addi %2186, %__rlasp_stack_elide_zero_83 : i64
      %2191 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2192 = arith.constant 12 : i64
      %2193 = func.call @cc_make_string(%2191, %2192) : (!llvm.ptr, i64) -> i64
      %2194 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2195 = arith.constant 7 : i64
      %2196 = func.call @cc_make_string(%2194, %2195) : (!llvm.ptr, i64) -> i64
      %2197 = func.call @cc_intern(%2193, %2196) : (i64, i64) -> i64
      %2198 = func.call @cc_nil_value() : () -> i64
      %2199 = func.call @cc_cons(%2197, %2198) : (i64, i64) -> i64
      %2200 = func.call @cc_values_pack(%2199) : (i64) -> i64
      %2201 = arith.constant 0 : i64
      %2202 = func.call @cc_box_fixnum(%2201) : (i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_errorp(%2169) : (i64) -> i64
      %2205 = arith.cmpi ne, %2204, %2203 : i64
      %2206 = arith.cmpi eq, %2203, %2203 : i64
      %2207 = arith.andi %2205, %2206 : i1
      %2208 = scf.if %2207 -> (i64) {
        scf.yield %2169 : i64
      } else {
        scf.yield %2203 : i64
      }
      %2209 = func.call @cc_errorp(%2176) : (i64) -> i64
      %2210 = arith.cmpi ne, %2209, %2203 : i64
      %2211 = arith.cmpi eq, %2208, %2203 : i64
      %2212 = arith.andi %2210, %2211 : i1
      %2213 = scf.if %2212 -> (i64) {
        scf.yield %2176 : i64
      } else {
        scf.yield %2208 : i64
      }
      %2214 = func.call @cc_errorp(%2190) : (i64) -> i64
      %2215 = arith.cmpi ne, %2214, %2203 : i64
      %2216 = arith.cmpi eq, %2213, %2203 : i64
      %2217 = arith.andi %2215, %2216 : i1
      %2218 = scf.if %2217 -> (i64) {
        scf.yield %2190 : i64
      } else {
        scf.yield %2213 : i64
      }
      %2219 = func.call @cc_errorp(%2197) : (i64) -> i64
      %2220 = arith.cmpi ne, %2219, %2203 : i64
      %2221 = arith.cmpi eq, %2218, %2203 : i64
      %2222 = arith.andi %2220, %2221 : i1
      %2223 = scf.if %2222 -> (i64) {
        scf.yield %2197 : i64
      } else {
        scf.yield %2218 : i64
      }
      %2224 = func.call @cc_errorp(%2202) : (i64) -> i64
      %2225 = arith.cmpi ne, %2224, %2203 : i64
      %2226 = arith.cmpi eq, %2223, %2203 : i64
      %2227 = arith.andi %2225, %2226 : i1
      %2228 = scf.if %2227 -> (i64) {
        scf.yield %2202 : i64
      } else {
        scf.yield %2223 : i64
      }
      %2229 = arith.cmpi ne, %2228, %2203 : i64
      scf.if %2229 {
        func.call @stack_push_pointer(%2228) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2169) : (i64) -> ()
        func.call @stack_push_pointer(%2176) : (i64) -> ()
        func.call @stack_push_pointer(%2190) : (i64) -> ()
        func.call @stack_push_pointer(%2197) : (i64) -> ()
        func.call @stack_push_pointer(%2202) : (i64) -> ()
        %2230 = llvm.mlir.addressof @str185 : !llvm.ptr
        %2231 = func.call @cc_make_function_ref_const(%2230) : (!llvm.ptr) -> i64
        %2232 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2231, %2232) : (i64, i64) -> ()
      }
      %2233 = func.call @stack_pop_pointer() : () -> i64
      %2234 = func.call @cc_set_symbol_value(%2164, %2233) : (i64, i64) -> i64
      %2235 = func.call @cc_errorp(%2234) : (i64) -> i64
      %2236 = func.call @cc_nil_value() : () -> i64
      %2237 = arith.cmpi ne, %2235, %2236 : i64
      scf.if %2237 {
        func.call @stack_push_pointer(%2234) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2164) : (i64) -> ()
      }
      %2238 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2238 : i64
    }
    %2239 = func.call @cc_nil_value() : () -> i64
    %2240 = func.call @cc_errorp(%2159) : (i64) -> i64
    %2241 = arith.cmpi ne, %2240, %2239 : i64
    %2242 = scf.if %2241 -> (i64) {
      scf.yield %2159 : i64
    } else {
      %2243 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2244 = arith.constant 3 : i64
      %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
      %2246 = func.call @cc_nil_value() : () -> i64
      %2247 = func.call @cc_intern(%2245, %2246) : (i64, i64) -> i64
      %2248 = func.call @cc_nil_value() : () -> i64
      %2249 = func.call @cc_cons(%2247, %2248) : (i64, i64) -> i64
      %2250 = func.call @cc_values_pack(%2249) : (i64) -> i64
      %2251 = func.call @cc_symbol_value(%2247) : (i64) -> i64
      %2252 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2253 = arith.constant 4 : i64
      %2254 = func.call @cc_make_string(%2252, %2253) : (!llvm.ptr, i64) -> i64
      %2255 = func.call @cc_nil_value() : () -> i64
      %2256 = func.call @cc_intern(%2254, %2255) : (i64, i64) -> i64
      %2257 = func.call @cc_nil_value() : () -> i64
      %2258 = func.call @cc_cons(%2256, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_values_pack(%2258) : (i64) -> i64
      %2260 = func.call @cc_symbol_value(%2256) : (i64) -> i64
      %2261 = arith.constant 0 : i64
      %2262 = func.call @cc_box_fixnum(%2261) : (i64) -> i64
      %2264 = arith.constant 3 : i64
      %2263 = arith.andi %2262, %2264 : i64
      %2265 = arith.constant 0 : i64
      %2266 = arith.cmpi eq, %2263, %2265 : i64
      %2268 = arith.constant 3 : i64
      %2267 = arith.andi %2260, %2268 : i64
      %2269 = arith.constant 0 : i64
      %2270 = arith.cmpi eq, %2267, %2269 : i64
      %2271 = arith.andi %2266, %2270 : i1
      %2272 = scf.if %2271 -> (i64) {
        %2273 = arith.constant 2 : i64
        %2274 = arith.shrsi %2262, %2273 : i64
        %2275 = arith.constant 2 : i64
        %2276 = arith.shrsi %2260, %2275 : i64
        %2277 = arith.subi %2274, %2276 : i64
        %2278 = arith.constant -2305843009213693952 : i64
        %2279 = arith.constant 2305843009213693951 : i64
        %2280 = arith.cmpi sge, %2277, %2278 : i64
        %2281 = arith.cmpi sle, %2277, %2279 : i64
        %2282 = arith.andi %2280, %2281 : i1
        %2283 = scf.if %2282 -> (i64) {
          %2284 = arith.constant 2 : i64
          %2285 = arith.shli %2277, %2284 : i64
          scf.yield %2285 : i64
        } else {
          %2286 = func.call @cc_sub(%2262, %2260) : (i64, i64) -> i64
          scf.yield %2286 : i64
        }
        scf.yield %2283 : i64
      } else {
        %2287 = func.call @cc_sub(%2262, %2260) : (i64, i64) -> i64
        scf.yield %2287 : i64
      }
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %2288 = arith.addi %2272, %__rlasp_stack_elide_zero_84 : i64
      %2289 = arith.constant 10 : i64
      %2290 = func.call @cc_box_fixnum(%2289) : (i64) -> i64
      %2291 = func.call @cc_nil_value() : () -> i64
      %2292 = func.call @cc_nil_value() : () -> i64
      %2293 = func.call @cc_nil_value() : () -> i64
      %2294 = func.call @cc_errorp(%2251) : (i64) -> i64
      %2295 = arith.cmpi ne, %2294, %2293 : i64
      %2296 = arith.cmpi eq, %2293, %2293 : i64
      %2297 = arith.andi %2295, %2296 : i1
      %2298 = scf.if %2297 -> (i64) {
        scf.yield %2251 : i64
      } else {
        scf.yield %2293 : i64
      }
      %2299 = func.call @cc_errorp(%2288) : (i64) -> i64
      %2300 = arith.cmpi ne, %2299, %2293 : i64
      %2301 = arith.cmpi eq, %2298, %2293 : i64
      %2302 = arith.andi %2300, %2301 : i1
      %2303 = scf.if %2302 -> (i64) {
        scf.yield %2288 : i64
      } else {
        scf.yield %2298 : i64
      }
      %2304 = func.call @cc_errorp(%2290) : (i64) -> i64
      %2305 = arith.cmpi ne, %2304, %2293 : i64
      %2306 = arith.cmpi eq, %2303, %2293 : i64
      %2307 = arith.andi %2305, %2306 : i1
      %2308 = scf.if %2307 -> (i64) {
        scf.yield %2290 : i64
      } else {
        scf.yield %2303 : i64
      }
      %2309 = func.call @cc_errorp(%2291) : (i64) -> i64
      %2310 = arith.cmpi ne, %2309, %2293 : i64
      %2311 = arith.cmpi eq, %2308, %2293 : i64
      %2312 = arith.andi %2310, %2311 : i1
      %2313 = scf.if %2312 -> (i64) {
        scf.yield %2291 : i64
      } else {
        scf.yield %2308 : i64
      }
      %2314 = func.call @cc_errorp(%2292) : (i64) -> i64
      %2315 = arith.cmpi ne, %2314, %2293 : i64
      %2316 = arith.cmpi eq, %2313, %2293 : i64
      %2317 = arith.andi %2315, %2316 : i1
      %2318 = scf.if %2317 -> (i64) {
        scf.yield %2292 : i64
      } else {
        scf.yield %2313 : i64
      }
      %2319 = arith.cmpi ne, %2318, %2293 : i64
      scf.if %2319 {
        func.call @stack_push_pointer(%2318) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2251) : (i64) -> ()
        func.call @stack_push_pointer(%2288) : (i64) -> ()
        func.call @stack_push_pointer(%2290) : (i64) -> ()
        func.call @stack_push_pointer(%2291) : (i64) -> ()
        func.call @stack_push_pointer(%2292) : (i64) -> ()
        %2320 = llvm.mlir.addressof @str188 : !llvm.ptr
        %2321 = func.call @cc_make_function_ref_const(%2320) : (!llvm.ptr) -> i64
        %2322 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2321, %2322) : (i64, i64) -> ()
      }
      %2323 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2323 : i64
    }
    %2324 = func.call @cc_nil_value() : () -> i64
    %2325 = func.call @cc_errorp(%2242) : (i64) -> i64
    %2326 = arith.cmpi ne, %2325, %2324 : i64
    %2327 = scf.if %2326 -> (i64) {
      scf.yield %2242 : i64
    } else {
      %2328 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2329 = arith.constant 26 : i64
      %2330 = func.call @cc_make_string(%2328, %2329) : (!llvm.ptr, i64) -> i64
      %2331 = func.call @cc_nil_value() : () -> i64
      %2332 = func.call @cc_intern(%2330, %2331) : (i64, i64) -> i64
      %2333 = func.call @cc_nil_value() : () -> i64
      %2334 = func.call @cc_cons(%2332, %2333) : (i64, i64) -> i64
      %2335 = func.call @cc_values_pack(%2334) : (i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %2336 = arith.addi %2332, %__rlasp_stack_elide_zero_85 : i64
      %2337 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2338 = arith.constant 3 : i64
      %2339 = func.call @cc_make_string(%2337, %2338) : (!llvm.ptr, i64) -> i64
      %2340 = func.call @cc_nil_value() : () -> i64
      %2341 = func.call @cc_intern(%2339, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_cons(%2341, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_values_pack(%2343) : (i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %2345 = arith.addi %2341, %__rlasp_stack_elide_zero_86 : i64
      %2361 = arith.constant 108321407238153 : i64
      %2362 = arith.constant 0 : i64
      %2363 = func.call @cc_make_closure(%2361, %2362) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %2364 = arith.addi %2363, %__rlasp_stack_elide_zero_87 : i64
      %2365 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2366 = arith.constant 45 : i64
      %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @stack_pop_pointer() : () -> i64
      %2370 = func.call @cc_cons(%2369, %2368) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2371 = arith.addi %2370, %__rlasp_stack_elide_zero_88 : i64
      %2372 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2373 = arith.constant 11 : i64
      %2374 = func.call @cc_make_string(%2372, %2373) : (!llvm.ptr, i64) -> i64
      %2375 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2376 = arith.constant 7 : i64
      %2377 = func.call @cc_make_string(%2375, %2376) : (!llvm.ptr, i64) -> i64
      %2378 = func.call @cc_intern(%2374, %2377) : (i64, i64) -> i64
      %2379 = func.call @cc_nil_value() : () -> i64
      %2380 = func.call @cc_cons(%2378, %2379) : (i64, i64) -> i64
      %2381 = func.call @cc_values_pack(%2380) : (i64) -> i64
      %2382 = func.call @cc_nil_value() : () -> i64
      %2383 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2384 = arith.constant 4 : i64
      %2385 = func.call @cc_make_string(%2383, %2384) : (!llvm.ptr, i64) -> i64
      %2386 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2387 = arith.constant 7 : i64
      %2388 = func.call @cc_make_string(%2386, %2387) : (!llvm.ptr, i64) -> i64
      %2389 = func.call @cc_intern(%2385, %2388) : (i64, i64) -> i64
      %2390 = func.call @cc_nil_value() : () -> i64
      %2391 = func.call @cc_cons(%2389, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_values_pack(%2391) : (i64) -> i64
      %2393 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2394 = arith.constant 7 : i64
      %2395 = func.call @cc_make_string(%2393, %2394) : (!llvm.ptr, i64) -> i64
      %2396 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2397 = arith.constant 11 : i64
      %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
      %2399 = func.call @cc_intern(%2395, %2398) : (i64, i64) -> i64
      %2400 = func.call @cc_nil_value() : () -> i64
      %2401 = func.call @cc_cons(%2399, %2400) : (i64, i64) -> i64
      %2402 = func.call @cc_values_pack(%2401) : (i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2403 = arith.addi %2399, %__rlasp_stack_elide_zero_89 : i64
      %2404 = func.call @cc_nil_value() : () -> i64
      %2405 = func.call @cc_errorp(%2336) : (i64) -> i64
      %2406 = arith.cmpi ne, %2405, %2404 : i64
      %2407 = arith.cmpi eq, %2404, %2404 : i64
      %2408 = arith.andi %2406, %2407 : i1
      %2409 = scf.if %2408 -> (i64) {
        scf.yield %2336 : i64
      } else {
        scf.yield %2404 : i64
      }
      %2410 = func.call @cc_errorp(%2345) : (i64) -> i64
      %2411 = arith.cmpi ne, %2410, %2404 : i64
      %2412 = arith.cmpi eq, %2409, %2404 : i64
      %2413 = arith.andi %2411, %2412 : i1
      %2414 = scf.if %2413 -> (i64) {
        scf.yield %2345 : i64
      } else {
        scf.yield %2409 : i64
      }
      %2415 = func.call @cc_errorp(%2364) : (i64) -> i64
      %2416 = arith.cmpi ne, %2415, %2404 : i64
      %2417 = arith.cmpi eq, %2414, %2404 : i64
      %2418 = arith.andi %2416, %2417 : i1
      %2419 = scf.if %2418 -> (i64) {
        scf.yield %2364 : i64
      } else {
        scf.yield %2414 : i64
      }
      %2420 = func.call @cc_errorp(%2371) : (i64) -> i64
      %2421 = arith.cmpi ne, %2420, %2404 : i64
      %2422 = arith.cmpi eq, %2419, %2404 : i64
      %2423 = arith.andi %2421, %2422 : i1
      %2424 = scf.if %2423 -> (i64) {
        scf.yield %2371 : i64
      } else {
        scf.yield %2419 : i64
      }
      %2425 = func.call @cc_errorp(%2378) : (i64) -> i64
      %2426 = arith.cmpi ne, %2425, %2404 : i64
      %2427 = arith.cmpi eq, %2424, %2404 : i64
      %2428 = arith.andi %2426, %2427 : i1
      %2429 = scf.if %2428 -> (i64) {
        scf.yield %2378 : i64
      } else {
        scf.yield %2424 : i64
      }
      %2430 = func.call @cc_errorp(%2382) : (i64) -> i64
      %2431 = arith.cmpi ne, %2430, %2404 : i64
      %2432 = arith.cmpi eq, %2429, %2404 : i64
      %2433 = arith.andi %2431, %2432 : i1
      %2434 = scf.if %2433 -> (i64) {
        scf.yield %2382 : i64
      } else {
        scf.yield %2429 : i64
      }
      %2435 = func.call @cc_errorp(%2389) : (i64) -> i64
      %2436 = arith.cmpi ne, %2435, %2404 : i64
      %2437 = arith.cmpi eq, %2434, %2404 : i64
      %2438 = arith.andi %2436, %2437 : i1
      %2439 = scf.if %2438 -> (i64) {
        scf.yield %2389 : i64
      } else {
        scf.yield %2434 : i64
      }
      %2440 = func.call @cc_errorp(%2403) : (i64) -> i64
      %2441 = arith.cmpi ne, %2440, %2404 : i64
      %2442 = arith.cmpi eq, %2439, %2404 : i64
      %2443 = arith.andi %2441, %2442 : i1
      %2444 = scf.if %2443 -> (i64) {
        scf.yield %2403 : i64
      } else {
        scf.yield %2439 : i64
      }
      %2445 = arith.cmpi ne, %2444, %2404 : i64
      scf.if %2445 {
        func.call @stack_push_pointer(%2444) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2336) : (i64) -> ()
        func.call @stack_push_pointer(%2345) : (i64) -> ()
        func.call @stack_push_pointer(%2364) : (i64) -> ()
        func.call @stack_push_pointer(%2371) : (i64) -> ()
        func.call @stack_push_pointer(%2378) : (i64) -> ()
        func.call @stack_push_pointer(%2382) : (i64) -> ()
        func.call @stack_push_pointer(%2389) : (i64) -> ()
        func.call @stack_push_pointer(%2403) : (i64) -> ()
        %2446 = llvm.mlir.addressof @str199 : !llvm.ptr
        %2447 = func.call @cc_make_function_ref_const(%2446) : (!llvm.ptr) -> i64
        %2448 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2447, %2448) : (i64, i64) -> ()
      }
      %2449 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2449 : i64
    }
    %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
    %2450 = arith.addi %2327, %__rlasp_stack_elide_zero_90 : i64
    %2451 = func.call @cc_multiple_value_list(%2450) : (i64) -> i64
    %2452 = llvm.mlir.addressof @str200 : !llvm.ptr
    %2453 = arith.constant 38 : i64
    %2454 = func.call @cc_make_string(%2452, %2453) : (!llvm.ptr, i64) -> i64
    %2455 = func.call @cc_nil_value() : () -> i64
    %2456 = func.call @cc_intern(%2454, %2455) : (i64, i64) -> i64
    %2457 = func.call @cc_nil_value() : () -> i64
    %2458 = func.call @cc_cons(%2456, %2457) : (i64, i64) -> i64
    %2459 = func.call @cc_values_pack(%2458) : (i64) -> i64
    %2460 = func.call @cc_symbol_value(%2456) : (i64) -> i64
    %2461 = llvm.mlir.addressof @str201 : !llvm.ptr
    %2462 = arith.constant 40 : i64
    %2463 = func.call @cc_make_string(%2461, %2462) : (!llvm.ptr, i64) -> i64
    %2464 = func.call @cc_nil_value() : () -> i64
    %2465 = func.call @cc_intern(%2463, %2464) : (i64, i64) -> i64
    %2466 = func.call @cc_nil_value() : () -> i64
    %2467 = func.call @cc_cons(%2465, %2466) : (i64, i64) -> i64
    %2468 = func.call @cc_values_pack(%2467) : (i64) -> i64
    %2469 = func.call @cc_symbol_value(%2465) : (i64) -> i64
    %2470 = func.call @cc_nil_value() : () -> i64
    %2471 = arith.cmpi ne, %2460, %2470 : i64
    %2472 = scf.if %2471 -> (i64) {
      scf.yield %2469 : i64
    } else {
      scf.yield %2451 : i64
    }
    %2473 = func.call @cc_values_pack(%2472) : (i64) -> i64
    func.call @stack_push_pointer(%2473) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238145"() {
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = func.call @cc_errorp(%134) : (i64) -> i64
    %137 = arith.cmpi ne, %136, %135 : i64
    %138 = scf.if %137 -> (i64) {
      scf.yield %134 : i64
    } else {
      %139 = llvm.mlir.addressof @str14 : !llvm.ptr
      %140 = arith.constant 14 : i64
      %141 = func.call @cc_make_string(%139, %140) : (!llvm.ptr, i64) -> i64
      %142 = llvm.mlir.addressof @str15 : !llvm.ptr
      %143 = arith.constant 11 : i64
      %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
      %145 = func.call @cc_intern(%141, %144) : (i64, i64) -> i64
      %146 = func.call @cc_nil_value() : () -> i64
      %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
      %148 = func.call @cc_values_pack(%147) : (i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %149 = arith.addi %145, %__rlasp_stack_elide_zero_91 : i64
      %150 = func.call @cc_nil_value() : () -> i64
      %151 = func.call @cc_errorp(%149) : (i64) -> i64
      %152 = arith.cmpi ne, %151, %150 : i64
      %153 = arith.cmpi eq, %150, %150 : i64
      %154 = arith.andi %152, %153 : i1
      %155 = scf.if %154 -> (i64) {
        scf.yield %149 : i64
      } else {
        scf.yield %150 : i64
      }
      %156 = arith.cmpi ne, %155, %150 : i64
      scf.if %156 {
        func.call @stack_push_pointer(%155) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%149) : (i64) -> ()
        %157 = llvm.mlir.addressof @str16 : !llvm.ptr
        %158 = func.call @cc_make_function_ref_const(%157) : (!llvm.ptr) -> i64
        %159 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%158, %159) : (i64, i64) -> ()
      }
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_errorp(%160) : (i64) -> i64
      %163 = arith.cmpi ne, %162, %161 : i64
      %164 = arith.cmpi eq, %161, %161 : i64
      %165 = arith.andi %163, %164 : i1
      %166 = scf.if %165 -> (i64) {
        scf.yield %160 : i64
      } else {
        scf.yield %161 : i64
      }
      %167 = arith.cmpi ne, %166, %161 : i64
      scf.if %167 {
        func.call @stack_push_pointer(%166) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%160) : (i64) -> ()
        %168 = llvm.mlir.addressof @str17 : !llvm.ptr
        %169 = func.call @cc_make_function_ref_const(%168) : (!llvm.ptr) -> i64
        %170 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%169, %170) : (i64, i64) -> ()
      }
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      %173 = func.call @cc_cons(%171, %172) : (i64, i64) -> i64
      %174 = func.call @cc_not(%173) : (i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %175 = arith.addi %174, %__rlasp_stack_elide_zero_92 : i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_cons(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_not(%177) : (i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %179 = arith.addi %178, %__rlasp_stack_elide_zero_93 : i64
      scf.yield %179 : i64
    }
    func.call @stack_push_pointer(%138) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238146"() {
    %385 = func.call @cc_nil_value() : () -> i64
    %386 = func.call @cc_nil_value() : () -> i64
    %387 = func.call @cc_errorp(%385) : (i64) -> i64
    %388 = arith.cmpi ne, %387, %386 : i64
    %389 = scf.if %388 -> (i64) {
      scf.yield %385 : i64
    } else {
      %390 = arith.constant 3 : i64
      %391 = func.call @cc_box_fixnum(%390) : (i64) -> i64
      %392 = llvm.mlir.addressof @str37 : !llvm.ptr
      %393 = arith.constant 12 : i64
      %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
      %395 = llvm.mlir.addressof @str38 : !llvm.ptr
      %396 = arith.constant 7 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = func.call @cc_intern(%394, %397) : (i64, i64) -> i64
      %399 = func.call @cc_nil_value() : () -> i64
      %400 = func.call @cc_cons(%398, %399) : (i64, i64) -> i64
      %401 = func.call @cc_values_pack(%400) : (i64) -> i64
      %402 = llvm.mlir.addressof @str39 : !llvm.ptr
      %403 = arith.constant 3 : i64
      %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
      %405 = llvm.mlir.addressof @str40 : !llvm.ptr
      %406 = arith.constant 11 : i64
      %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
      %408 = func.call @cc_intern(%404, %407) : (i64, i64) -> i64
      %409 = func.call @cc_nil_value() : () -> i64
      %410 = func.call @cc_cons(%408, %409) : (i64, i64) -> i64
      %411 = func.call @cc_values_pack(%410) : (i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %412 = arith.addi %408, %__rlasp_stack_elide_zero_94 : i64
      %413 = llvm.mlir.addressof @str41 : !llvm.ptr
      %414 = arith.constant 16 : i64
      %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
      %416 = llvm.mlir.addressof @str42 : !llvm.ptr
      %417 = arith.constant 7 : i64
      %418 = func.call @cc_make_string(%416, %417) : (!llvm.ptr, i64) -> i64
      %419 = func.call @cc_intern(%415, %418) : (i64, i64) -> i64
      %420 = func.call @cc_nil_value() : () -> i64
      %421 = func.call @cc_cons(%419, %420) : (i64, i64) -> i64
      %422 = func.call @cc_values_pack(%421) : (i64) -> i64
      %423 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%423) : (i64) -> ()
      %424 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%424) : (i64) -> ()
      %425 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%427, %426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %429 = arith.addi %428, %__rlasp_stack_elide_zero_95 : i64
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @cc_cons(%430, %429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %432 = arith.addi %431, %__rlasp_stack_elide_zero_96 : i64
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @cc_cons(%433, %432) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %435 = arith.addi %434, %__rlasp_stack_elide_zero_97 : i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_errorp(%391) : (i64) -> i64
      %438 = arith.cmpi ne, %437, %436 : i64
      %439 = arith.cmpi eq, %436, %436 : i64
      %440 = arith.andi %438, %439 : i1
      %441 = scf.if %440 -> (i64) {
        scf.yield %391 : i64
      } else {
        scf.yield %436 : i64
      }
      %442 = func.call @cc_errorp(%398) : (i64) -> i64
      %443 = arith.cmpi ne, %442, %436 : i64
      %444 = arith.cmpi eq, %441, %436 : i64
      %445 = arith.andi %443, %444 : i1
      %446 = scf.if %445 -> (i64) {
        scf.yield %398 : i64
      } else {
        scf.yield %441 : i64
      }
      %447 = func.call @cc_errorp(%412) : (i64) -> i64
      %448 = arith.cmpi ne, %447, %436 : i64
      %449 = arith.cmpi eq, %446, %436 : i64
      %450 = arith.andi %448, %449 : i1
      %451 = scf.if %450 -> (i64) {
        scf.yield %412 : i64
      } else {
        scf.yield %446 : i64
      }
      %452 = func.call @cc_errorp(%419) : (i64) -> i64
      %453 = arith.cmpi ne, %452, %436 : i64
      %454 = arith.cmpi eq, %451, %436 : i64
      %455 = arith.andi %453, %454 : i1
      %456 = scf.if %455 -> (i64) {
        scf.yield %419 : i64
      } else {
        scf.yield %451 : i64
      }
      %457 = func.call @cc_errorp(%435) : (i64) -> i64
      %458 = arith.cmpi ne, %457, %436 : i64
      %459 = arith.cmpi eq, %456, %436 : i64
      %460 = arith.andi %458, %459 : i1
      %461 = scf.if %460 -> (i64) {
        scf.yield %435 : i64
      } else {
        scf.yield %456 : i64
      }
      %462 = arith.cmpi ne, %461, %436 : i64
      scf.if %462 {
        func.call @stack_push_pointer(%461) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%391) : (i64) -> ()
        func.call @stack_push_pointer(%398) : (i64) -> ()
        func.call @stack_push_pointer(%412) : (i64) -> ()
        func.call @stack_push_pointer(%419) : (i64) -> ()
        func.call @stack_push_pointer(%435) : (i64) -> ()
        %463 = llvm.mlir.addressof @str43 : !llvm.ptr
        %464 = func.call @cc_make_function_ref_const(%463) : (!llvm.ptr) -> i64
        %465 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%464, %465) : (i64, i64) -> ()
      }
      %466 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %466 : i64
    }
    func.call @stack_push_pointer(%389) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238147"() {
    %689 = func.call @cc_nil_value() : () -> i64
    %690 = func.call @cc_nil_value() : () -> i64
    %691 = func.call @cc_errorp(%689) : (i64) -> i64
    %692 = arith.cmpi ne, %691, %690 : i64
    %693 = scf.if %692 -> (i64) {
      scf.yield %689 : i64
    } else {
      %694 = arith.constant 3 : i64
      %695 = func.call @cc_box_fixnum(%694) : (i64) -> i64
      %696 = llvm.mlir.addressof @str62 : !llvm.ptr
      %697 = arith.constant 12 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = llvm.mlir.addressof @str63 : !llvm.ptr
      %700 = arith.constant 7 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_intern(%698, %701) : (i64, i64) -> i64
      %703 = func.call @cc_nil_value() : () -> i64
      %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
      %705 = func.call @cc_values_pack(%704) : (i64) -> i64
      %706 = llvm.mlir.addressof @str64 : !llvm.ptr
      %707 = arith.constant 13 : i64
      %708 = func.call @cc_make_string(%706, %707) : (!llvm.ptr, i64) -> i64
      %709 = llvm.mlir.addressof @str65 : !llvm.ptr
      %710 = arith.constant 11 : i64
      %711 = func.call @cc_make_string(%709, %710) : (!llvm.ptr, i64) -> i64
      %712 = func.call @cc_intern(%708, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %716 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%716) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @cc_cons(%718, %717) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %720 = arith.addi %719, %__rlasp_stack_elide_zero_98 : i64
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_cons(%721, %720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %723 = arith.addi %722, %__rlasp_stack_elide_zero_99 : i64
      %724 = llvm.mlir.addressof @str66 : !llvm.ptr
      %725 = arith.constant 16 : i64
      %726 = func.call @cc_make_string(%724, %725) : (!llvm.ptr, i64) -> i64
      %727 = llvm.mlir.addressof @str67 : !llvm.ptr
      %728 = arith.constant 7 : i64
      %729 = func.call @cc_make_string(%727, %728) : (!llvm.ptr, i64) -> i64
      %730 = func.call @cc_intern(%726, %729) : (i64, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_values_pack(%732) : (i64) -> i64
      %734 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%734) : (i64) -> ()
      %735 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%735) : (i64) -> ()
      %736 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%736) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @cc_cons(%738, %737) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %740 = arith.addi %739, %__rlasp_stack_elide_zero_100 : i64
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @cc_cons(%741, %740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %743 = arith.addi %742, %__rlasp_stack_elide_zero_101 : i64
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @cc_cons(%744, %743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %746 = arith.addi %745, %__rlasp_stack_elide_zero_102 : i64
      %747 = func.call @cc_nil_value() : () -> i64
      %748 = func.call @cc_errorp(%695) : (i64) -> i64
      %749 = arith.cmpi ne, %748, %747 : i64
      %750 = arith.cmpi eq, %747, %747 : i64
      %751 = arith.andi %749, %750 : i1
      %752 = scf.if %751 -> (i64) {
        scf.yield %695 : i64
      } else {
        scf.yield %747 : i64
      }
      %753 = func.call @cc_errorp(%702) : (i64) -> i64
      %754 = arith.cmpi ne, %753, %747 : i64
      %755 = arith.cmpi eq, %752, %747 : i64
      %756 = arith.andi %754, %755 : i1
      %757 = scf.if %756 -> (i64) {
        scf.yield %702 : i64
      } else {
        scf.yield %752 : i64
      }
      %758 = func.call @cc_errorp(%723) : (i64) -> i64
      %759 = arith.cmpi ne, %758, %747 : i64
      %760 = arith.cmpi eq, %757, %747 : i64
      %761 = arith.andi %759, %760 : i1
      %762 = scf.if %761 -> (i64) {
        scf.yield %723 : i64
      } else {
        scf.yield %757 : i64
      }
      %763 = func.call @cc_errorp(%730) : (i64) -> i64
      %764 = arith.cmpi ne, %763, %747 : i64
      %765 = arith.cmpi eq, %762, %747 : i64
      %766 = arith.andi %764, %765 : i1
      %767 = scf.if %766 -> (i64) {
        scf.yield %730 : i64
      } else {
        scf.yield %762 : i64
      }
      %768 = func.call @cc_errorp(%746) : (i64) -> i64
      %769 = arith.cmpi ne, %768, %747 : i64
      %770 = arith.cmpi eq, %767, %747 : i64
      %771 = arith.andi %769, %770 : i1
      %772 = scf.if %771 -> (i64) {
        scf.yield %746 : i64
      } else {
        scf.yield %767 : i64
      }
      %773 = arith.cmpi ne, %772, %747 : i64
      scf.if %773 {
        func.call @stack_push_pointer(%772) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%695) : (i64) -> ()
        func.call @stack_push_pointer(%702) : (i64) -> ()
        func.call @stack_push_pointer(%723) : (i64) -> ()
        func.call @stack_push_pointer(%730) : (i64) -> ()
        func.call @stack_push_pointer(%746) : (i64) -> ()
        %774 = llvm.mlir.addressof @str68 : !llvm.ptr
        %775 = func.call @cc_make_function_ref_const(%774) : (!llvm.ptr) -> i64
        %776 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%775, %776) : (i64, i64) -> ()
      }
      %777 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %777 : i64
    }
    func.call @stack_push_pointer(%693) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238148"() {
    %968 = func.call @cc_nil_value() : () -> i64
    %969 = func.call @cc_nil_value() : () -> i64
    %970 = func.call @cc_errorp(%968) : (i64) -> i64
    %971 = arith.cmpi ne, %970, %969 : i64
    %972 = scf.if %971 -> (i64) {
      scf.yield %968 : i64
    } else {
      %973 = arith.constant 3 : i64
      %974 = func.call @cc_box_fixnum(%973) : (i64) -> i64
      %975 = llvm.mlir.addressof @str85 : !llvm.ptr
      %976 = arith.constant 12 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = llvm.mlir.addressof @str86 : !llvm.ptr
      %979 = arith.constant 7 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_intern(%977, %980) : (i64, i64) -> i64
      %982 = func.call @cc_nil_value() : () -> i64
      %983 = func.call @cc_cons(%981, %982) : (i64, i64) -> i64
      %984 = func.call @cc_values_pack(%983) : (i64) -> i64
      %985 = llvm.mlir.addressof @str87 : !llvm.ptr
      %986 = arith.constant 9 : i64
      %987 = func.call @cc_make_string(%985, %986) : (!llvm.ptr, i64) -> i64
      %988 = llvm.mlir.addressof @str88 : !llvm.ptr
      %989 = arith.constant 11 : i64
      %990 = func.call @cc_make_string(%988, %989) : (!llvm.ptr, i64) -> i64
      %991 = func.call @cc_intern(%987, %990) : (i64, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_values_pack(%993) : (i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %995 = arith.addi %991, %__rlasp_stack_elide_zero_103 : i64
      %996 = llvm.mlir.addressof @str89 : !llvm.ptr
      %997 = arith.constant 15 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1000 = arith.constant 7 : i64
      %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
      %1002 = func.call @cc_intern(%998, %1001) : (i64, i64) -> i64
      %1003 = func.call @cc_nil_value() : () -> i64
      %1004 = func.call @cc_cons(%1002, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_values_pack(%1004) : (i64) -> i64
      %1006 = arith.constant 97 : i64
      %1007 = func.call @cc_box_character(%1006) : (i64) -> i64
      %1008 = func.call @cc_nil_value() : () -> i64
      %1009 = func.call @cc_errorp(%974) : (i64) -> i64
      %1010 = arith.cmpi ne, %1009, %1008 : i64
      %1011 = arith.cmpi eq, %1008, %1008 : i64
      %1012 = arith.andi %1010, %1011 : i1
      %1013 = scf.if %1012 -> (i64) {
        scf.yield %974 : i64
      } else {
        scf.yield %1008 : i64
      }
      %1014 = func.call @cc_errorp(%981) : (i64) -> i64
      %1015 = arith.cmpi ne, %1014, %1008 : i64
      %1016 = arith.cmpi eq, %1013, %1008 : i64
      %1017 = arith.andi %1015, %1016 : i1
      %1018 = scf.if %1017 -> (i64) {
        scf.yield %981 : i64
      } else {
        scf.yield %1013 : i64
      }
      %1019 = func.call @cc_errorp(%995) : (i64) -> i64
      %1020 = arith.cmpi ne, %1019, %1008 : i64
      %1021 = arith.cmpi eq, %1018, %1008 : i64
      %1022 = arith.andi %1020, %1021 : i1
      %1023 = scf.if %1022 -> (i64) {
        scf.yield %995 : i64
      } else {
        scf.yield %1018 : i64
      }
      %1024 = func.call @cc_errorp(%1002) : (i64) -> i64
      %1025 = arith.cmpi ne, %1024, %1008 : i64
      %1026 = arith.cmpi eq, %1023, %1008 : i64
      %1027 = arith.andi %1025, %1026 : i1
      %1028 = scf.if %1027 -> (i64) {
        scf.yield %1002 : i64
      } else {
        scf.yield %1023 : i64
      }
      %1029 = func.call @cc_errorp(%1007) : (i64) -> i64
      %1030 = arith.cmpi ne, %1029, %1008 : i64
      %1031 = arith.cmpi eq, %1028, %1008 : i64
      %1032 = arith.andi %1030, %1031 : i1
      %1033 = scf.if %1032 -> (i64) {
        scf.yield %1007 : i64
      } else {
        scf.yield %1028 : i64
      }
      %1034 = arith.cmpi ne, %1033, %1008 : i64
      scf.if %1034 {
        func.call @stack_push_pointer(%1033) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%974) : (i64) -> ()
        func.call @stack_push_pointer(%981) : (i64) -> ()
        func.call @stack_push_pointer(%995) : (i64) -> ()
        func.call @stack_push_pointer(%1002) : (i64) -> ()
        func.call @stack_push_pointer(%1007) : (i64) -> ()
        %1035 = llvm.mlir.addressof @str91 : !llvm.ptr
        %1036 = func.call @cc_make_function_ref_const(%1035) : (!llvm.ptr) -> i64
        %1037 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1036, %1037) : (i64, i64) -> ()
      }
      %1038 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1038 : i64
    }
    func.call @stack_push_pointer(%972) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238149"() {
    %1242 = func.call @cc_nil_value() : () -> i64
    %1243 = func.call @cc_nil_value() : () -> i64
    %1244 = func.call @cc_errorp(%1242) : (i64) -> i64
    %1245 = arith.cmpi ne, %1244, %1243 : i64
    %1246 = scf.if %1245 -> (i64) {
      scf.yield %1242 : i64
    } else {
      %1247 = arith.constant 3 : i64
      %1248 = func.call @cc_box_fixnum(%1247) : (i64) -> i64
      %1249 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1250 = arith.constant 12 : i64
      %1251 = func.call @cc_make_string(%1249, %1250) : (!llvm.ptr, i64) -> i64
      %1252 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1253 = arith.constant 7 : i64
      %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
      %1255 = func.call @cc_intern(%1251, %1254) : (i64, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
      %1259 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1260 = arith.constant 9 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1263 = arith.constant 11 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = func.call @cc_intern(%1261, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_nil_value() : () -> i64
      %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
      %1268 = func.call @cc_values_pack(%1267) : (i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %1269 = arith.addi %1265, %__rlasp_stack_elide_zero_104 : i64
      %1270 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1271 = arith.constant 16 : i64
      %1272 = func.call @cc_make_string(%1270, %1271) : (!llvm.ptr, i64) -> i64
      %1273 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1274 = arith.constant 7 : i64
      %1275 = func.call @cc_make_string(%1273, %1274) : (!llvm.ptr, i64) -> i64
      %1276 = func.call @cc_intern(%1272, %1275) : (i64, i64) -> i64
      %1277 = func.call @cc_nil_value() : () -> i64
      %1278 = func.call @cc_cons(%1276, %1277) : (i64, i64) -> i64
      %1279 = func.call @cc_values_pack(%1278) : (i64) -> i64
      %1280 = arith.constant 97 : i64
      %1281 = func.call @cc_box_character(%1280) : (i64) -> i64
      func.call @stack_push_pointer(%1281) : (i64) -> ()
      %1282 = arith.constant 98 : i64
      %1283 = func.call @cc_box_character(%1282) : (i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      %1284 = arith.constant 99 : i64
      %1285 = func.call @cc_box_character(%1284) : (i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = func.call @cc_cons(%1287, %1286) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %1289 = arith.addi %1288, %__rlasp_stack_elide_zero_105 : i64
      %1290 = func.call @stack_pop_pointer() : () -> i64
      %1291 = func.call @cc_cons(%1290, %1289) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %1292 = arith.addi %1291, %__rlasp_stack_elide_zero_106 : i64
      %1293 = func.call @stack_pop_pointer() : () -> i64
      %1294 = func.call @cc_cons(%1293, %1292) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %1295 = arith.addi %1294, %__rlasp_stack_elide_zero_107 : i64
      %1296 = func.call @cc_nil_value() : () -> i64
      %1297 = func.call @cc_errorp(%1248) : (i64) -> i64
      %1298 = arith.cmpi ne, %1297, %1296 : i64
      %1299 = arith.cmpi eq, %1296, %1296 : i64
      %1300 = arith.andi %1298, %1299 : i1
      %1301 = scf.if %1300 -> (i64) {
        scf.yield %1248 : i64
      } else {
        scf.yield %1296 : i64
      }
      %1302 = func.call @cc_errorp(%1255) : (i64) -> i64
      %1303 = arith.cmpi ne, %1302, %1296 : i64
      %1304 = arith.cmpi eq, %1301, %1296 : i64
      %1305 = arith.andi %1303, %1304 : i1
      %1306 = scf.if %1305 -> (i64) {
        scf.yield %1255 : i64
      } else {
        scf.yield %1301 : i64
      }
      %1307 = func.call @cc_errorp(%1269) : (i64) -> i64
      %1308 = arith.cmpi ne, %1307, %1296 : i64
      %1309 = arith.cmpi eq, %1306, %1296 : i64
      %1310 = arith.andi %1308, %1309 : i1
      %1311 = scf.if %1310 -> (i64) {
        scf.yield %1269 : i64
      } else {
        scf.yield %1306 : i64
      }
      %1312 = func.call @cc_errorp(%1276) : (i64) -> i64
      %1313 = arith.cmpi ne, %1312, %1296 : i64
      %1314 = arith.cmpi eq, %1311, %1296 : i64
      %1315 = arith.andi %1313, %1314 : i1
      %1316 = scf.if %1315 -> (i64) {
        scf.yield %1276 : i64
      } else {
        scf.yield %1311 : i64
      }
      %1317 = func.call @cc_errorp(%1295) : (i64) -> i64
      %1318 = arith.cmpi ne, %1317, %1296 : i64
      %1319 = arith.cmpi eq, %1316, %1296 : i64
      %1320 = arith.andi %1318, %1319 : i1
      %1321 = scf.if %1320 -> (i64) {
        scf.yield %1295 : i64
      } else {
        scf.yield %1316 : i64
      }
      %1322 = arith.cmpi ne, %1321, %1296 : i64
      scf.if %1322 {
        func.call @stack_push_pointer(%1321) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1248) : (i64) -> ()
        func.call @stack_push_pointer(%1255) : (i64) -> ()
        func.call @stack_push_pointer(%1269) : (i64) -> ()
        func.call @stack_push_pointer(%1276) : (i64) -> ()
        func.call @stack_push_pointer(%1295) : (i64) -> ()
        %1323 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1324 = func.call @cc_make_function_ref_const(%1323) : (!llvm.ptr) -> i64
        %1325 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1324, %1325) : (i64, i64) -> ()
      }
      %1326 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1326 : i64
    }
    func.call @stack_push_pointer(%1246) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238150"() {
    %1521 = func.call @cc_nil_value() : () -> i64
    %1522 = func.call @cc_nil_value() : () -> i64
    %1523 = func.call @cc_errorp(%1521) : (i64) -> i64
    %1524 = arith.cmpi ne, %1523, %1522 : i64
    %1525 = scf.if %1524 -> (i64) {
      scf.yield %1521 : i64
    } else {
      %1526 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1527 = arith.constant 8 : i64
      %1528 = func.call @cc_make_string(%1526, %1527) : (!llvm.ptr, i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_intern(%1528, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_cons(%1530, %1531) : (i64, i64) -> i64
      %1533 = func.call @cc_values_pack(%1532) : (i64) -> i64
      %1534 = func.call @cc_symbol_value(%1530) : (i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %1535 = arith.addi %1534, %__rlasp_stack_elide_zero_108 : i64
      scf.yield %1535 : i64
    }
    func.call @stack_push_pointer(%1525) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238151"() {
    %1717 = func.call @cc_nil_value() : () -> i64
    %1718 = func.call @cc_nil_value() : () -> i64
    %1719 = func.call @cc_errorp(%1717) : (i64) -> i64
    %1720 = arith.cmpi ne, %1719, %1718 : i64
    %1721 = scf.if %1720 -> (i64) {
      scf.yield %1717 : i64
    } else {
      %1722 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1723 = arith.constant 8 : i64
      %1724 = func.call @cc_make_string(%1722, %1723) : (!llvm.ptr, i64) -> i64
      %1725 = func.call @cc_nil_value() : () -> i64
      %1726 = func.call @cc_intern(%1724, %1725) : (i64, i64) -> i64
      %1727 = func.call @cc_nil_value() : () -> i64
      %1728 = func.call @cc_cons(%1726, %1727) : (i64, i64) -> i64
      %1729 = func.call @cc_values_pack(%1728) : (i64) -> i64
      %1730 = func.call @cc_symbol_value(%1726) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %1731 = arith.addi %1730, %__rlasp_stack_elide_zero_109 : i64
      scf.yield %1731 : i64
    }
    func.call @stack_push_pointer(%1721) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238152"() {
    %2052 = func.call @cc_nil_value() : () -> i64
    %2053 = func.call @cc_nil_value() : () -> i64
    %2054 = func.call @cc_errorp(%2052) : (i64) -> i64
    %2055 = arith.cmpi ne, %2054, %2053 : i64
    %2056 = scf.if %2055 -> (i64) {
      scf.yield %2052 : i64
    } else {
      %2057 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2058 = arith.constant 3 : i64
      %2059 = func.call @cc_make_string(%2057, %2058) : (!llvm.ptr, i64) -> i64
      %2060 = func.call @cc_nil_value() : () -> i64
      %2061 = func.call @cc_intern(%2059, %2060) : (i64, i64) -> i64
      %2062 = func.call @cc_nil_value() : () -> i64
      %2063 = func.call @cc_cons(%2061, %2062) : (i64, i64) -> i64
      %2064 = func.call @cc_values_pack(%2063) : (i64) -> i64
      %2065 = func.call @cc_symbol_value(%2061) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2066 = arith.addi %2065, %__rlasp_stack_elide_zero_110 : i64
      scf.yield %2066 : i64
    }
    func.call @stack_push_pointer(%2056) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238153"() {
    %2346 = func.call @cc_nil_value() : () -> i64
    %2347 = func.call @cc_nil_value() : () -> i64
    %2348 = func.call @cc_errorp(%2346) : (i64) -> i64
    %2349 = arith.cmpi ne, %2348, %2347 : i64
    %2350 = scf.if %2349 -> (i64) {
      scf.yield %2346 : i64
    } else {
      %2351 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2352 = arith.constant 3 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = func.call @cc_intern(%2353, %2354) : (i64, i64) -> i64
      %2356 = func.call @cc_nil_value() : () -> i64
      %2357 = func.call @cc_cons(%2355, %2356) : (i64, i64) -> i64
      %2358 = func.call @cc_values_pack(%2357) : (i64) -> i64
      %2359 = func.call @cc_symbol_value(%2355) : (i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2360 = arith.addi %2359, %__rlasp_stack_elide_zero_111 : i64
      scf.yield %2360 : i64
    }
    func.call @stack_push_pointer(%2350) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_108321407238144*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_108321407238144*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_108321407238144*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CXX-DERIVABILITY\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str5("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("INHERITS-FROM-INSTANCE\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str8("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str9("MAKE-CXX-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str10("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str11("MATCH-CALLBACK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str12("AST-TOOLING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str13("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str14("MATCH-CALLBACK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str15("AST-TOOLING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("CORE:MAKE-CXX-OBJECT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str17("CORE:INHERITS-FROM-INSTANCE\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str18("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str19("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("A derivable class is a CLOS class that derives from a C++ class.\0AThey are defined in the clbind library using Derivable<Foo>.\0AThey must be seen as inheriting from the Instance_O class.\0AIf they don't then any code that uses them won't work properly.\0ACheck clasp/include/clasp/core/instance.h header file for the \0AInstance_O specialization of TaggedCast\00") : !llvm.array<352 x i8>
  llvm.mlir.global private constant @str22("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str23("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str24("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str26("EQUAL-BIT-VECTOR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str27("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str44("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("EQUAL\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str49("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str51("EQUALP-UB8-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str52("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str59("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str62("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str63("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str64("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str67("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str68("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str69("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str75("STRING=0\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str76("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str83("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str84("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str86("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str90("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str92("aaa\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str100("STRING=1\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str101("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str108("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str109("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str111("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str118("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str119("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str126("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str127("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str128("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str129("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str132("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str134("EQUALP-BIT-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str135("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str136("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str137("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str143("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str144("SBIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str147("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str148("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str153("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str154("*BN*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("23482395823512381241927312749127418274918273\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str156("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str157("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str160("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str162("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str163("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str164("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("*BN*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str166("core:integer-to-string\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str167("INTEGER-TO-STRING-POSITIVE\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str168("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str169("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str170("23482395823512381241927312749127418274918273\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str171("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str173("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str174("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str175("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str178("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str179("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str186("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str187("*BN*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("core:integer-to-string\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str189("INTEGER-TO-STRING-NEGATIVE\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str190("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str191("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str192("-23482395823512381241927312749127418274918273\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str200("*__MLIR_BLOCK_RETFLAG_108321407238144*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str201("*__MLIR_BLOCK_RETMVLIST_108321407238144*\00") : !llvm.array<41 x i8>
}
