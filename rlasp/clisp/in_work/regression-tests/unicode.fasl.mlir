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
      %57 = arith.constant 18 : i64
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
      %75 = arith.constant 1024 : i64
      %76 = func.call @cc_box_character(%75) : (i64) -> i64
      func.call @stack_push_pointer(%76) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %77 = func.call @stack_pop_pointer() : () -> i64
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = func.call @cc_cons(%78, %77) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %80 = arith.addi %79, %__rlasp_stack_elide_zero_3 : i64
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @cc_cons(%81, %80) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %83 = arith.addi %82, %__rlasp_stack_elide_zero_4 : i64
      %102 = arith.constant 271595545296897 : i64
      %103 = arith.constant 0 : i64
      %104 = func.call @cc_make_closure(%102, %103) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %105 = arith.addi %104, %__rlasp_stack_elide_zero_5 : i64
      %106 = arith.constant 1104 : i64
      %107 = func.call @cc_box_character(%106) : (i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @cc_cons(%109, %108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %111 = arith.addi %110, %__rlasp_stack_elide_zero_6 : i64
      %112 = llvm.mlir.addressof @str9 : !llvm.ptr
      %113 = arith.constant 11 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = llvm.mlir.addressof @str10 : !llvm.ptr
      %116 = arith.constant 7 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = func.call @cc_intern(%114, %117) : (i64, i64) -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
      %121 = func.call @cc_values_pack(%120) : (i64) -> i64
      %122 = func.call @cc_nil_value() : () -> i64
      %123 = llvm.mlir.addressof @str11 : !llvm.ptr
      %124 = arith.constant 4 : i64
      %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
      %126 = llvm.mlir.addressof @str12 : !llvm.ptr
      %127 = arith.constant 7 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = func.call @cc_intern(%125, %128) : (i64, i64) -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
      %132 = func.call @cc_values_pack(%131) : (i64) -> i64
      %133 = llvm.mlir.addressof @str13 : !llvm.ptr
      %134 = arith.constant 6 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_intern(%135, %136) : (i64, i64) -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
      %140 = func.call @cc_values_pack(%139) : (i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %141 = arith.addi %137, %__rlasp_stack_elide_zero_7 : i64
      %142 = func.call @cc_nil_value() : () -> i64
      %143 = func.call @cc_errorp(%64) : (i64) -> i64
      %144 = arith.cmpi ne, %143, %142 : i64
      %145 = arith.cmpi eq, %142, %142 : i64
      %146 = arith.andi %144, %145 : i1
      %147 = scf.if %146 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %142 : i64
      }
      %148 = func.call @cc_errorp(%83) : (i64) -> i64
      %149 = arith.cmpi ne, %148, %142 : i64
      %150 = arith.cmpi eq, %147, %142 : i64
      %151 = arith.andi %149, %150 : i1
      %152 = scf.if %151 -> (i64) {
        scf.yield %83 : i64
      } else {
        scf.yield %147 : i64
      }
      %153 = func.call @cc_errorp(%105) : (i64) -> i64
      %154 = arith.cmpi ne, %153, %142 : i64
      %155 = arith.cmpi eq, %152, %142 : i64
      %156 = arith.andi %154, %155 : i1
      %157 = scf.if %156 -> (i64) {
        scf.yield %105 : i64
      } else {
        scf.yield %152 : i64
      }
      %158 = func.call @cc_errorp(%111) : (i64) -> i64
      %159 = arith.cmpi ne, %158, %142 : i64
      %160 = arith.cmpi eq, %157, %142 : i64
      %161 = arith.andi %159, %160 : i1
      %162 = scf.if %161 -> (i64) {
        scf.yield %111 : i64
      } else {
        scf.yield %157 : i64
      }
      %163 = func.call @cc_errorp(%118) : (i64) -> i64
      %164 = arith.cmpi ne, %163, %142 : i64
      %165 = arith.cmpi eq, %162, %142 : i64
      %166 = arith.andi %164, %165 : i1
      %167 = scf.if %166 -> (i64) {
        scf.yield %118 : i64
      } else {
        scf.yield %162 : i64
      }
      %168 = func.call @cc_errorp(%122) : (i64) -> i64
      %169 = arith.cmpi ne, %168, %142 : i64
      %170 = arith.cmpi eq, %167, %142 : i64
      %171 = arith.andi %169, %170 : i1
      %172 = scf.if %171 -> (i64) {
        scf.yield %122 : i64
      } else {
        scf.yield %167 : i64
      }
      %173 = func.call @cc_errorp(%129) : (i64) -> i64
      %174 = arith.cmpi ne, %173, %142 : i64
      %175 = arith.cmpi eq, %172, %142 : i64
      %176 = arith.andi %174, %175 : i1
      %177 = scf.if %176 -> (i64) {
        scf.yield %129 : i64
      } else {
        scf.yield %172 : i64
      }
      %178 = func.call @cc_errorp(%141) : (i64) -> i64
      %179 = arith.cmpi ne, %178, %142 : i64
      %180 = arith.cmpi eq, %177, %142 : i64
      %181 = arith.andi %179, %180 : i1
      %182 = scf.if %181 -> (i64) {
        scf.yield %141 : i64
      } else {
        scf.yield %177 : i64
      }
      %183 = arith.cmpi ne, %182, %142 : i64
      scf.if %183 {
        func.call @stack_push_pointer(%182) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%83) : (i64) -> ()
        func.call @stack_push_pointer(%105) : (i64) -> ()
        func.call @stack_push_pointer(%111) : (i64) -> ()
        func.call @stack_push_pointer(%118) : (i64) -> ()
        func.call @stack_push_pointer(%122) : (i64) -> ()
        func.call @stack_push_pointer(%129) : (i64) -> ()
        func.call @stack_push_pointer(%141) : (i64) -> ()
        %184 = llvm.mlir.addressof @str14 : !llvm.ptr
        %185 = func.call @cc_make_function_ref_const(%184) : (!llvm.ptr) -> i64
        %186 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%185, %186) : (i64, i64) -> ()
      }
      %187 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %187 : i64
    }
    %188 = func.call @cc_nil_value() : () -> i64
    %189 = func.call @cc_errorp(%55) : (i64) -> i64
    %190 = arith.cmpi ne, %189, %188 : i64
    %191 = scf.if %190 -> (i64) {
      scf.yield %55 : i64
    } else {
      %192 = llvm.mlir.addressof @str15 : !llvm.ptr
      %193 = arith.constant 16 : i64
      %194 = func.call @cc_make_string(%192, %193) : (!llvm.ptr, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_intern(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_nil_value() : () -> i64
      %198 = func.call @cc_cons(%196, %197) : (i64, i64) -> i64
      %199 = func.call @cc_values_pack(%198) : (i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %200 = arith.addi %196, %__rlasp_stack_elide_zero_8 : i64
      %201 = llvm.mlir.addressof @str16 : !llvm.ptr
      %202 = arith.constant 11 : i64
      %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
      %204 = llvm.mlir.addressof @str17 : !llvm.ptr
      %205 = arith.constant 11 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_intern(%203, %206) : (i64, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_values_pack(%209) : (i64) -> i64
      func.call @stack_push_pointer(%207) : (i64) -> ()
      %211 = arith.constant 1104 : i64
      %212 = func.call @cc_box_character(%211) : (i64) -> i64
      func.call @stack_push_pointer(%212) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @stack_pop_pointer() : () -> i64
      %215 = func.call @cc_cons(%214, %213) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %216 = arith.addi %215, %__rlasp_stack_elide_zero_9 : i64
      %217 = func.call @stack_pop_pointer() : () -> i64
      %218 = func.call @cc_cons(%217, %216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %219 = arith.addi %218, %__rlasp_stack_elide_zero_10 : i64
      %238 = arith.constant 271595545296898 : i64
      %239 = arith.constant 0 : i64
      %240 = func.call @cc_make_closure(%238, %239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %241 = arith.addi %240, %__rlasp_stack_elide_zero_11 : i64
      %242 = arith.constant 1024 : i64
      %243 = func.call @cc_box_character(%242) : (i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @stack_pop_pointer() : () -> i64
      %246 = func.call @cc_cons(%245, %244) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %247 = arith.addi %246, %__rlasp_stack_elide_zero_12 : i64
      %248 = llvm.mlir.addressof @str19 : !llvm.ptr
      %249 = arith.constant 11 : i64
      %250 = func.call @cc_make_string(%248, %249) : (!llvm.ptr, i64) -> i64
      %251 = llvm.mlir.addressof @str20 : !llvm.ptr
      %252 = arith.constant 7 : i64
      %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
      %254 = func.call @cc_intern(%250, %253) : (i64, i64) -> i64
      %255 = func.call @cc_nil_value() : () -> i64
      %256 = func.call @cc_cons(%254, %255) : (i64, i64) -> i64
      %257 = func.call @cc_values_pack(%256) : (i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = llvm.mlir.addressof @str21 : !llvm.ptr
      %260 = arith.constant 4 : i64
      %261 = func.call @cc_make_string(%259, %260) : (!llvm.ptr, i64) -> i64
      %262 = llvm.mlir.addressof @str22 : !llvm.ptr
      %263 = arith.constant 7 : i64
      %264 = func.call @cc_make_string(%262, %263) : (!llvm.ptr, i64) -> i64
      %265 = func.call @cc_intern(%261, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      %269 = llvm.mlir.addressof @str23 : !llvm.ptr
      %270 = arith.constant 6 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_intern(%271, %272) : (i64, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_cons(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_values_pack(%275) : (i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %277 = arith.addi %273, %__rlasp_stack_elide_zero_13 : i64
      %278 = func.call @cc_nil_value() : () -> i64
      %279 = func.call @cc_errorp(%200) : (i64) -> i64
      %280 = arith.cmpi ne, %279, %278 : i64
      %281 = arith.cmpi eq, %278, %278 : i64
      %282 = arith.andi %280, %281 : i1
      %283 = scf.if %282 -> (i64) {
        scf.yield %200 : i64
      } else {
        scf.yield %278 : i64
      }
      %284 = func.call @cc_errorp(%219) : (i64) -> i64
      %285 = arith.cmpi ne, %284, %278 : i64
      %286 = arith.cmpi eq, %283, %278 : i64
      %287 = arith.andi %285, %286 : i1
      %288 = scf.if %287 -> (i64) {
        scf.yield %219 : i64
      } else {
        scf.yield %283 : i64
      }
      %289 = func.call @cc_errorp(%241) : (i64) -> i64
      %290 = arith.cmpi ne, %289, %278 : i64
      %291 = arith.cmpi eq, %288, %278 : i64
      %292 = arith.andi %290, %291 : i1
      %293 = scf.if %292 -> (i64) {
        scf.yield %241 : i64
      } else {
        scf.yield %288 : i64
      }
      %294 = func.call @cc_errorp(%247) : (i64) -> i64
      %295 = arith.cmpi ne, %294, %278 : i64
      %296 = arith.cmpi eq, %293, %278 : i64
      %297 = arith.andi %295, %296 : i1
      %298 = scf.if %297 -> (i64) {
        scf.yield %247 : i64
      } else {
        scf.yield %293 : i64
      }
      %299 = func.call @cc_errorp(%254) : (i64) -> i64
      %300 = arith.cmpi ne, %299, %278 : i64
      %301 = arith.cmpi eq, %298, %278 : i64
      %302 = arith.andi %300, %301 : i1
      %303 = scf.if %302 -> (i64) {
        scf.yield %254 : i64
      } else {
        scf.yield %298 : i64
      }
      %304 = func.call @cc_errorp(%258) : (i64) -> i64
      %305 = arith.cmpi ne, %304, %278 : i64
      %306 = arith.cmpi eq, %303, %278 : i64
      %307 = arith.andi %305, %306 : i1
      %308 = scf.if %307 -> (i64) {
        scf.yield %258 : i64
      } else {
        scf.yield %303 : i64
      }
      %309 = func.call @cc_errorp(%265) : (i64) -> i64
      %310 = arith.cmpi ne, %309, %278 : i64
      %311 = arith.cmpi eq, %308, %278 : i64
      %312 = arith.andi %310, %311 : i1
      %313 = scf.if %312 -> (i64) {
        scf.yield %265 : i64
      } else {
        scf.yield %308 : i64
      }
      %314 = func.call @cc_errorp(%277) : (i64) -> i64
      %315 = arith.cmpi ne, %314, %278 : i64
      %316 = arith.cmpi eq, %313, %278 : i64
      %317 = arith.andi %315, %316 : i1
      %318 = scf.if %317 -> (i64) {
        scf.yield %277 : i64
      } else {
        scf.yield %313 : i64
      }
      %319 = arith.cmpi ne, %318, %278 : i64
      scf.if %319 {
        func.call @stack_push_pointer(%318) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%200) : (i64) -> ()
        func.call @stack_push_pointer(%219) : (i64) -> ()
        func.call @stack_push_pointer(%241) : (i64) -> ()
        func.call @stack_push_pointer(%247) : (i64) -> ()
        func.call @stack_push_pointer(%254) : (i64) -> ()
        func.call @stack_push_pointer(%258) : (i64) -> ()
        func.call @stack_push_pointer(%265) : (i64) -> ()
        func.call @stack_push_pointer(%277) : (i64) -> ()
        %320 = llvm.mlir.addressof @str24 : !llvm.ptr
        %321 = func.call @cc_make_function_ref_const(%320) : (!llvm.ptr) -> i64
        %322 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%321, %322) : (i64, i64) -> ()
      }
      %323 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %323 : i64
    }
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_errorp(%191) : (i64) -> i64
    %326 = arith.cmpi ne, %325, %324 : i64
    %327 = scf.if %326 -> (i64) {
      scf.yield %191 : i64
    } else {
      %328 = llvm.mlir.addressof @str25 : !llvm.ptr
      %329 = arith.constant 13 : i64
      %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
      %331 = func.call @cc_nil_value() : () -> i64
      %332 = func.call @cc_intern(%330, %331) : (i64, i64) -> i64
      %333 = func.call @cc_nil_value() : () -> i64
      %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
      %335 = func.call @cc_values_pack(%334) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %336 = arith.addi %332, %__rlasp_stack_elide_zero_14 : i64
      %337 = llvm.mlir.addressof @str26 : !llvm.ptr
      %338 = arith.constant 4 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_intern(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_cons(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_values_pack(%343) : (i64) -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %345 = llvm.mlir.addressof @str27 : !llvm.ptr
      %346 = arith.constant 1 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      %348 = func.call @cc_nil_value() : () -> i64
      %349 = func.call @cc_intern(%347, %348) : (i64, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_values_pack(%351) : (i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %353 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%353) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @cc_cons(%355, %354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %357 = arith.addi %356, %__rlasp_stack_elide_zero_15 : i64
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @cc_cons(%358, %357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      %360 = llvm.mlir.addressof @str28 : !llvm.ptr
      %361 = arith.constant 19 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = func.call @cc_intern(%362, %363) : (i64, i64) -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
      %367 = func.call @cc_values_pack(%366) : (i64) -> i64
      func.call @stack_push_pointer(%364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @cc_cons(%369, %368) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %371 = arith.addi %370, %__rlasp_stack_elide_zero_16 : i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%372, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = llvm.mlir.addressof @str29 : !llvm.ptr
      %375 = arith.constant 1 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_intern(%376, %377) : (i64, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_values_pack(%380) : (i64) -> i64
      func.call @stack_push_pointer(%378) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @stack_pop_pointer() : () -> i64
      %384 = func.call @cc_cons(%383, %382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %385 = arith.addi %384, %__rlasp_stack_elide_zero_17 : i64
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = func.call @cc_cons(%386, %385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = llvm.mlir.addressof @str30 : !llvm.ptr
      %389 = arith.constant 15 : i64
      %390 = func.call @cc_make_string(%388, %389) : (!llvm.ptr, i64) -> i64
      %391 = func.call @cc_nil_value() : () -> i64
      %392 = func.call @cc_intern(%390, %391) : (i64, i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_cons(%392, %393) : (i64, i64) -> i64
      %395 = func.call @cc_values_pack(%394) : (i64) -> i64
      func.call @stack_push_pointer(%392) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %396 = func.call @stack_pop_pointer() : () -> i64
      %397 = func.call @stack_pop_pointer() : () -> i64
      %398 = func.call @cc_cons(%397, %396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %399 = arith.addi %398, %__rlasp_stack_elide_zero_18 : i64
      %400 = func.call @stack_pop_pointer() : () -> i64
      %401 = func.call @cc_cons(%400, %399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %402 = llvm.mlir.addressof @str31 : !llvm.ptr
      %403 = arith.constant 17 : i64
      %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
      %405 = func.call @cc_nil_value() : () -> i64
      %406 = func.call @cc_intern(%404, %405) : (i64, i64) -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
      %409 = func.call @cc_values_pack(%408) : (i64) -> i64
      func.call @stack_push_pointer(%406) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %410 = func.call @stack_pop_pointer() : () -> i64
      %411 = func.call @stack_pop_pointer() : () -> i64
      %412 = func.call @cc_cons(%411, %410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %413 = arith.addi %412, %__rlasp_stack_elide_zero_19 : i64
      %414 = func.call @stack_pop_pointer() : () -> i64
      %415 = func.call @cc_cons(%414, %413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%415) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %416 = func.call @stack_pop_pointer() : () -> i64
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = func.call @cc_cons(%417, %416) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %419 = arith.addi %418, %__rlasp_stack_elide_zero_20 : i64
      %420 = func.call @stack_pop_pointer() : () -> i64
      %421 = func.call @cc_cons(%420, %419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %422 = arith.addi %421, %__rlasp_stack_elide_zero_21 : i64
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @cc_cons(%423, %422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %425 = arith.addi %424, %__rlasp_stack_elide_zero_22 : i64
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @cc_cons(%426, %425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %428 = arith.addi %427, %__rlasp_stack_elide_zero_23 : i64
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%430) : (i64) -> ()
      %431 = llvm.mlir.addressof @str32 : !llvm.ptr
      %432 = arith.constant 5 : i64
      %433 = func.call @cc_make_string(%431, %432) : (!llvm.ptr, i64) -> i64
      %434 = func.call @cc_nil_value() : () -> i64
      %435 = func.call @cc_intern(%433, %434) : (i64, i64) -> i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_cons(%435, %436) : (i64, i64) -> i64
      %438 = func.call @cc_values_pack(%437) : (i64) -> i64
      func.call @stack_push_pointer(%435) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %439 = llvm.mlir.addressof @str33 : !llvm.ptr
      %440 = arith.constant 5 : i64
      %441 = func.call @cc_make_string(%439, %440) : (!llvm.ptr, i64) -> i64
      %442 = llvm.mlir.addressof @str34 : !llvm.ptr
      %443 = arith.constant 3 : i64
      %444 = func.call @cc_make_string(%442, %443) : (!llvm.ptr, i64) -> i64
      %445 = func.call @cc_intern(%441, %444) : (i64, i64) -> i64
      %446 = func.call @cc_nil_value() : () -> i64
      %447 = func.call @cc_cons(%445, %446) : (i64, i64) -> i64
      %448 = func.call @cc_values_pack(%447) : (i64) -> i64
      func.call @stack_push_pointer(%445) : (i64) -> ()
      %449 = llvm.mlir.addressof @str35 : !llvm.ptr
      %450 = arith.constant 1 : i64
      %451 = func.call @cc_make_string(%449, %450) : (!llvm.ptr, i64) -> i64
      %452 = func.call @cc_nil_value() : () -> i64
      %453 = func.call @cc_intern(%451, %452) : (i64, i64) -> i64
      %454 = func.call @cc_nil_value() : () -> i64
      %455 = func.call @cc_cons(%453, %454) : (i64, i64) -> i64
      %456 = func.call @cc_values_pack(%455) : (i64) -> i64
      func.call @stack_push_pointer(%453) : (i64) -> ()
      %457 = llvm.mlir.addressof @str36 : !llvm.ptr
      %458 = arith.constant 1 : i64
      %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_intern(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
      %464 = func.call @cc_values_pack(%463) : (i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      %465 = llvm.mlir.addressof @str37 : !llvm.ptr
      %466 = arith.constant 15 : i64
      %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
      %468 = llvm.mlir.addressof @str38 : !llvm.ptr
      %469 = arith.constant 11 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = func.call @cc_intern(%467, %470) : (i64, i64) -> i64
      %472 = func.call @cc_nil_value() : () -> i64
      %473 = func.call @cc_cons(%471, %472) : (i64, i64) -> i64
      %474 = func.call @cc_values_pack(%473) : (i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %478 = arith.addi %477, %__rlasp_stack_elide_zero_24 : i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %481 = arith.addi %480, %__rlasp_stack_elide_zero_25 : i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      %484 = llvm.mlir.addressof @str39 : !llvm.ptr
      %485 = arith.constant 4 : i64
      %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_intern(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %492 = llvm.mlir.addressof @str40 : !llvm.ptr
      %493 = arith.constant 17 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = func.call @cc_nil_value() : () -> i64
      %496 = func.call @cc_intern(%494, %495) : (i64, i64) -> i64
      %497 = func.call @cc_nil_value() : () -> i64
      %498 = func.call @cc_cons(%496, %497) : (i64, i64) -> i64
      %499 = func.call @cc_values_pack(%498) : (i64) -> i64
      func.call @stack_push_pointer(%496) : (i64) -> ()
      %500 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%500) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %501 = func.call @stack_pop_pointer() : () -> i64
      %502 = func.call @stack_pop_pointer() : () -> i64
      %503 = func.call @cc_cons(%502, %501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %504 = arith.addi %503, %__rlasp_stack_elide_zero_26 : i64
      %505 = func.call @stack_pop_pointer() : () -> i64
      %506 = func.call @cc_cons(%505, %504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %507 = arith.addi %506, %__rlasp_stack_elide_zero_27 : i64
      %508 = func.call @stack_pop_pointer() : () -> i64
      %509 = func.call @cc_cons(%508, %507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %510 = llvm.mlir.addressof @str41 : !llvm.ptr
      %511 = arith.constant 4 : i64
      %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
      %513 = func.call @cc_nil_value() : () -> i64
      %514 = func.call @cc_intern(%512, %513) : (i64, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_values_pack(%516) : (i64) -> i64
      func.call @stack_push_pointer(%514) : (i64) -> ()
      %518 = llvm.mlir.addressof @str42 : !llvm.ptr
      %519 = arith.constant 19 : i64
      %520 = func.call @cc_make_string(%518, %519) : (!llvm.ptr, i64) -> i64
      %521 = func.call @cc_nil_value() : () -> i64
      %522 = func.call @cc_intern(%520, %521) : (i64, i64) -> i64
      %523 = func.call @cc_nil_value() : () -> i64
      %524 = func.call @cc_cons(%522, %523) : (i64, i64) -> i64
      %525 = func.call @cc_values_pack(%524) : (i64) -> i64
      func.call @stack_push_pointer(%522) : (i64) -> ()
      %526 = llvm.mlir.addressof @str43 : !llvm.ptr
      %527 = arith.constant 1 : i64
      %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
      %529 = func.call @cc_nil_value() : () -> i64
      %530 = func.call @cc_intern(%528, %529) : (i64, i64) -> i64
      %531 = func.call @cc_nil_value() : () -> i64
      %532 = func.call @cc_cons(%530, %531) : (i64, i64) -> i64
      %533 = func.call @cc_values_pack(%532) : (i64) -> i64
      func.call @stack_push_pointer(%530) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %534 = func.call @stack_pop_pointer() : () -> i64
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = func.call @cc_cons(%535, %534) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %537 = arith.addi %536, %__rlasp_stack_elide_zero_28 : i64
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @cc_cons(%538, %537) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %540 = arith.addi %539, %__rlasp_stack_elide_zero_29 : i64
      %541 = func.call @stack_pop_pointer() : () -> i64
      %542 = func.call @cc_cons(%541, %540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %543 = llvm.mlir.addressof @str44 : !llvm.ptr
      %544 = arith.constant 4 : i64
      %545 = func.call @cc_make_string(%543, %544) : (!llvm.ptr, i64) -> i64
      %546 = func.call @cc_nil_value() : () -> i64
      %547 = func.call @cc_intern(%545, %546) : (i64, i64) -> i64
      %548 = func.call @cc_nil_value() : () -> i64
      %549 = func.call @cc_cons(%547, %548) : (i64, i64) -> i64
      %550 = func.call @cc_values_pack(%549) : (i64) -> i64
      func.call @stack_push_pointer(%547) : (i64) -> ()
      %551 = llvm.mlir.addressof @str45 : !llvm.ptr
      %552 = arith.constant 1 : i64
      %553 = func.call @cc_make_string(%551, %552) : (!llvm.ptr, i64) -> i64
      %554 = func.call @cc_nil_value() : () -> i64
      %555 = func.call @cc_intern(%553, %554) : (i64, i64) -> i64
      %556 = func.call @cc_nil_value() : () -> i64
      %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
      %558 = func.call @cc_values_pack(%557) : (i64) -> i64
      func.call @stack_push_pointer(%555) : (i64) -> ()
      %559 = llvm.mlir.addressof @str46 : !llvm.ptr
      %560 = arith.constant 9 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      %562 = llvm.mlir.addressof @str47 : !llvm.ptr
      %563 = arith.constant 11 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = func.call @cc_intern(%561, %564) : (i64, i64) -> i64
      %566 = func.call @cc_nil_value() : () -> i64
      %567 = func.call @cc_cons(%565, %566) : (i64, i64) -> i64
      %568 = func.call @cc_values_pack(%567) : (i64) -> i64
      func.call @stack_push_pointer(%565) : (i64) -> ()
      %569 = llvm.mlir.addressof @str48 : !llvm.ptr
      %570 = arith.constant 1 : i64
      %571 = func.call @cc_make_string(%569, %570) : (!llvm.ptr, i64) -> i64
      %572 = func.call @cc_nil_value() : () -> i64
      %573 = func.call @cc_intern(%571, %572) : (i64, i64) -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_cons(%573, %574) : (i64, i64) -> i64
      %576 = func.call @cc_values_pack(%575) : (i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = func.call @cc_cons(%578, %577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %580 = arith.addi %579, %__rlasp_stack_elide_zero_30 : i64
      %581 = func.call @stack_pop_pointer() : () -> i64
      %582 = func.call @cc_cons(%581, %580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%582) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @stack_pop_pointer() : () -> i64
      %585 = func.call @cc_cons(%584, %583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %586 = arith.addi %585, %__rlasp_stack_elide_zero_31 : i64
      %587 = func.call @stack_pop_pointer() : () -> i64
      %588 = func.call @cc_cons(%587, %586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %589 = arith.addi %588, %__rlasp_stack_elide_zero_32 : i64
      %590 = func.call @stack_pop_pointer() : () -> i64
      %591 = func.call @cc_cons(%590, %589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %592 = llvm.mlir.addressof @str49 : !llvm.ptr
      %593 = arith.constant 2 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = func.call @cc_nil_value() : () -> i64
      %596 = func.call @cc_intern(%594, %595) : (i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_cons(%596, %597) : (i64, i64) -> i64
      %599 = func.call @cc_values_pack(%598) : (i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      %600 = llvm.mlir.addressof @str50 : !llvm.ptr
      %601 = arith.constant 3 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = func.call @cc_nil_value() : () -> i64
      %604 = func.call @cc_intern(%602, %603) : (i64, i64) -> i64
      %605 = func.call @cc_nil_value() : () -> i64
      %606 = func.call @cc_cons(%604, %605) : (i64, i64) -> i64
      %607 = func.call @cc_values_pack(%606) : (i64) -> i64
      func.call @stack_push_pointer(%604) : (i64) -> ()
      %608 = llvm.mlir.addressof @str51 : !llvm.ptr
      %609 = arith.constant 2 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = llvm.mlir.addressof @str52 : !llvm.ptr
      %612 = arith.constant 11 : i64
      %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
      %614 = func.call @cc_intern(%610, %613) : (i64, i64) -> i64
      %615 = func.call @cc_nil_value() : () -> i64
      %616 = func.call @cc_cons(%614, %615) : (i64, i64) -> i64
      %617 = func.call @cc_values_pack(%616) : (i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %618 = llvm.mlir.addressof @str53 : !llvm.ptr
      %619 = arith.constant 3 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = llvm.mlir.addressof @str54 : !llvm.ptr
      %622 = arith.constant 11 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = func.call @cc_intern(%620, %623) : (i64, i64) -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      %627 = func.call @cc_values_pack(%626) : (i64) -> i64
      func.call @stack_push_pointer(%624) : (i64) -> ()
      %628 = llvm.mlir.addressof @str55 : !llvm.ptr
      %629 = arith.constant 1 : i64
      %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_intern(%630, %631) : (i64, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_values_pack(%634) : (i64) -> i64
      func.call @stack_push_pointer(%632) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %636 = func.call @stack_pop_pointer() : () -> i64
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @cc_cons(%637, %636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %639 = arith.addi %638, %__rlasp_stack_elide_zero_33 : i64
      %640 = func.call @stack_pop_pointer() : () -> i64
      %641 = func.call @cc_cons(%640, %639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      %642 = llvm.mlir.addressof @str56 : !llvm.ptr
      %643 = arith.constant 3 : i64
      %644 = func.call @cc_make_string(%642, %643) : (!llvm.ptr, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_intern(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_nil_value() : () -> i64
      %648 = func.call @cc_cons(%646, %647) : (i64, i64) -> i64
      %649 = func.call @cc_values_pack(%648) : (i64) -> i64
      func.call @stack_push_pointer(%646) : (i64) -> ()
      %650 = llvm.mlir.addressof @str57 : !llvm.ptr
      %651 = arith.constant 1 : i64
      %652 = func.call @cc_make_string(%650, %651) : (!llvm.ptr, i64) -> i64
      %653 = func.call @cc_nil_value() : () -> i64
      %654 = func.call @cc_intern(%652, %653) : (i64, i64) -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
      %657 = func.call @cc_values_pack(%656) : (i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      %658 = llvm.mlir.addressof @str58 : !llvm.ptr
      %659 = arith.constant 11 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = llvm.mlir.addressof @str59 : !llvm.ptr
      %662 = arith.constant 11 : i64
      %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
      %664 = func.call @cc_intern(%660, %663) : (i64, i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = func.call @cc_cons(%664, %665) : (i64, i64) -> i64
      %667 = func.call @cc_values_pack(%666) : (i64) -> i64
      func.call @stack_push_pointer(%664) : (i64) -> ()
      %668 = llvm.mlir.addressof @str60 : !llvm.ptr
      %669 = arith.constant 1 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_intern(%670, %671) : (i64, i64) -> i64
      %673 = func.call @cc_nil_value() : () -> i64
      %674 = func.call @cc_cons(%672, %673) : (i64, i64) -> i64
      %675 = func.call @cc_values_pack(%674) : (i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @stack_pop_pointer() : () -> i64
      %678 = func.call @cc_cons(%677, %676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %679 = arith.addi %678, %__rlasp_stack_elide_zero_34 : i64
      %680 = func.call @stack_pop_pointer() : () -> i64
      %681 = func.call @cc_cons(%680, %679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @cc_cons(%683, %682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %685 = arith.addi %684, %__rlasp_stack_elide_zero_35 : i64
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @cc_cons(%686, %685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%687) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = func.call @stack_pop_pointer() : () -> i64
      %690 = func.call @cc_cons(%689, %688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      %691 = llvm.mlir.addressof @str61 : !llvm.ptr
      %692 = arith.constant 3 : i64
      %693 = func.call @cc_make_string(%691, %692) : (!llvm.ptr, i64) -> i64
      %694 = llvm.mlir.addressof @str62 : !llvm.ptr
      %695 = arith.constant 11 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      %697 = func.call @cc_intern(%693, %696) : (i64, i64) -> i64
      %698 = func.call @cc_nil_value() : () -> i64
      %699 = func.call @cc_cons(%697, %698) : (i64, i64) -> i64
      %700 = func.call @cc_values_pack(%699) : (i64) -> i64
      func.call @stack_push_pointer(%697) : (i64) -> ()
      %701 = llvm.mlir.addressof @str63 : !llvm.ptr
      %702 = arith.constant 2 : i64
      %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
      %704 = llvm.mlir.addressof @str64 : !llvm.ptr
      %705 = arith.constant 11 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = func.call @cc_intern(%703, %706) : (i64, i64) -> i64
      %708 = func.call @cc_nil_value() : () -> i64
      %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
      %710 = func.call @cc_values_pack(%709) : (i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %711 = llvm.mlir.addressof @str65 : !llvm.ptr
      %712 = arith.constant 12 : i64
      %713 = func.call @cc_make_string(%711, %712) : (!llvm.ptr, i64) -> i64
      %714 = llvm.mlir.addressof @str66 : !llvm.ptr
      %715 = arith.constant 11 : i64
      %716 = func.call @cc_make_string(%714, %715) : (!llvm.ptr, i64) -> i64
      %717 = func.call @cc_intern(%713, %716) : (i64, i64) -> i64
      %718 = func.call @cc_nil_value() : () -> i64
      %719 = func.call @cc_cons(%717, %718) : (i64, i64) -> i64
      %720 = func.call @cc_values_pack(%719) : (i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      %721 = llvm.mlir.addressof @str67 : !llvm.ptr
      %722 = arith.constant 1 : i64
      %723 = func.call @cc_make_string(%721, %722) : (!llvm.ptr, i64) -> i64
      %724 = func.call @cc_nil_value() : () -> i64
      %725 = func.call @cc_intern(%723, %724) : (i64, i64) -> i64
      %726 = func.call @cc_nil_value() : () -> i64
      %727 = func.call @cc_cons(%725, %726) : (i64, i64) -> i64
      %728 = func.call @cc_values_pack(%727) : (i64) -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %732 = arith.addi %731, %__rlasp_stack_elide_zero_36 : i64
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @cc_cons(%733, %732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %735 = llvm.mlir.addressof @str68 : !llvm.ptr
      %736 = arith.constant 5 : i64
      %737 = func.call @cc_make_string(%735, %736) : (!llvm.ptr, i64) -> i64
      %738 = llvm.mlir.addressof @str69 : !llvm.ptr
      %739 = arith.constant 11 : i64
      %740 = func.call @cc_make_string(%738, %739) : (!llvm.ptr, i64) -> i64
      %741 = func.call @cc_intern(%737, %740) : (i64, i64) -> i64
      %742 = func.call @cc_nil_value() : () -> i64
      %743 = func.call @cc_cons(%741, %742) : (i64, i64) -> i64
      %744 = func.call @cc_values_pack(%743) : (i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
      %745 = llvm.mlir.addressof @str70 : !llvm.ptr
      %746 = arith.constant 1 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = func.call @cc_nil_value() : () -> i64
      %749 = func.call @cc_intern(%747, %748) : (i64, i64) -> i64
      %750 = func.call @cc_nil_value() : () -> i64
      %751 = func.call @cc_cons(%749, %750) : (i64, i64) -> i64
      %752 = func.call @cc_values_pack(%751) : (i64) -> i64
      func.call @stack_push_pointer(%749) : (i64) -> ()
      %753 = llvm.mlir.addressof @str71 : !llvm.ptr
      %754 = arith.constant 1 : i64
      %755 = func.call @cc_make_string(%753, %754) : (!llvm.ptr, i64) -> i64
      %756 = func.call @cc_nil_value() : () -> i64
      %757 = func.call @cc_intern(%755, %756) : (i64, i64) -> i64
      %758 = func.call @cc_nil_value() : () -> i64
      %759 = func.call @cc_cons(%757, %758) : (i64, i64) -> i64
      %760 = func.call @cc_values_pack(%759) : (i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @cc_cons(%762, %761) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %764 = arith.addi %763, %__rlasp_stack_elide_zero_37 : i64
      %765 = func.call @stack_pop_pointer() : () -> i64
      %766 = func.call @cc_cons(%765, %764) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %767 = arith.addi %766, %__rlasp_stack_elide_zero_38 : i64
      %768 = func.call @stack_pop_pointer() : () -> i64
      %769 = func.call @cc_cons(%768, %767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @cc_cons(%771, %770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %773 = arith.addi %772, %__rlasp_stack_elide_zero_39 : i64
      %774 = func.call @stack_pop_pointer() : () -> i64
      %775 = func.call @cc_cons(%774, %773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %776 = arith.addi %775, %__rlasp_stack_elide_zero_40 : i64
      %777 = func.call @stack_pop_pointer() : () -> i64
      %778 = func.call @cc_cons(%777, %776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = llvm.mlir.addressof @str72 : !llvm.ptr
      %780 = arith.constant 5 : i64
      %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
      %782 = llvm.mlir.addressof @str73 : !llvm.ptr
      %783 = arith.constant 11 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = func.call @cc_intern(%781, %784) : (i64, i64) -> i64
      %786 = func.call @cc_nil_value() : () -> i64
      %787 = func.call @cc_cons(%785, %786) : (i64, i64) -> i64
      %788 = func.call @cc_values_pack(%787) : (i64) -> i64
      func.call @stack_push_pointer(%785) : (i64) -> ()
      %789 = llvm.mlir.addressof @str74 : !llvm.ptr
      %790 = arith.constant 1 : i64
      %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
      %792 = func.call @cc_nil_value() : () -> i64
      %793 = func.call @cc_intern(%791, %792) : (i64, i64) -> i64
      %794 = func.call @cc_nil_value() : () -> i64
      %795 = func.call @cc_cons(%793, %794) : (i64, i64) -> i64
      %796 = func.call @cc_values_pack(%795) : (i64) -> i64
      func.call @stack_push_pointer(%793) : (i64) -> ()
      %797 = llvm.mlir.addressof @str75 : !llvm.ptr
      %798 = arith.constant 11 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = llvm.mlir.addressof @str76 : !llvm.ptr
      %801 = arith.constant 11 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = func.call @cc_intern(%799, %802) : (i64, i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
      %806 = func.call @cc_values_pack(%805) : (i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %807 = llvm.mlir.addressof @str77 : !llvm.ptr
      %808 = arith.constant 1 : i64
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
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %818 = arith.addi %817, %__rlasp_stack_elide_zero_41 : i64
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @cc_cons(%819, %818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @cc_cons(%822, %821) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %824 = arith.addi %823, %__rlasp_stack_elide_zero_42 : i64
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %827 = arith.addi %826, %__rlasp_stack_elide_zero_43 : i64
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @cc_cons(%831, %830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %833 = arith.addi %832, %__rlasp_stack_elide_zero_44 : i64
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_cons(%834, %833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %836 = arith.addi %835, %__rlasp_stack_elide_zero_45 : i64
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @cc_cons(%837, %836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = func.call @cc_cons(%840, %839) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %842 = arith.addi %841, %__rlasp_stack_elide_zero_46 : i64
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @cc_cons(%843, %842) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %845 = arith.addi %844, %__rlasp_stack_elide_zero_47 : i64
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @cc_cons(%846, %845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @cc_cons(%849, %848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %851 = arith.addi %850, %__rlasp_stack_elide_zero_48 : i64
      %852 = func.call @stack_pop_pointer() : () -> i64
      %853 = func.call @cc_cons(%852, %851) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %854 = arith.addi %853, %__rlasp_stack_elide_zero_49 : i64
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = func.call @cc_cons(%855, %854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%856) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @stack_pop_pointer() : () -> i64
      %859 = func.call @cc_cons(%858, %857) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %860 = arith.addi %859, %__rlasp_stack_elide_zero_50 : i64
      %861 = func.call @stack_pop_pointer() : () -> i64
      %862 = func.call @cc_cons(%861, %860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%862) : (i64) -> ()
      %863 = llvm.mlir.addressof @str78 : !llvm.ptr
      %864 = arith.constant 5 : i64
      %865 = func.call @cc_make_string(%863, %864) : (!llvm.ptr, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_intern(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_nil_value() : () -> i64
      %869 = func.call @cc_cons(%867, %868) : (i64, i64) -> i64
      %870 = func.call @cc_values_pack(%869) : (i64) -> i64
      func.call @stack_push_pointer(%867) : (i64) -> ()
      %871 = llvm.mlir.addressof @str79 : !llvm.ptr
      %872 = arith.constant 4 : i64
      %873 = func.call @cc_make_string(%871, %872) : (!llvm.ptr, i64) -> i64
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_intern(%873, %874) : (i64, i64) -> i64
      %876 = func.call @cc_nil_value() : () -> i64
      %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
      %878 = func.call @cc_values_pack(%877) : (i64) -> i64
      func.call @stack_push_pointer(%875) : (i64) -> ()
      %879 = llvm.mlir.addressof @str80 : !llvm.ptr
      %880 = arith.constant 15 : i64
      %881 = func.call @cc_make_string(%879, %880) : (!llvm.ptr, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_intern(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_cons(%883, %884) : (i64, i64) -> i64
      %886 = func.call @cc_values_pack(%885) : (i64) -> i64
      func.call @stack_push_pointer(%883) : (i64) -> ()
      %887 = llvm.mlir.addressof @str81 : !llvm.ptr
      %888 = arith.constant 6 : i64
      %889 = func.call @cc_make_string(%887, %888) : (!llvm.ptr, i64) -> i64
      %890 = func.call @cc_nil_value() : () -> i64
      %891 = func.call @cc_intern(%889, %890) : (i64, i64) -> i64
      %892 = func.call @cc_nil_value() : () -> i64
      %893 = func.call @cc_cons(%891, %892) : (i64, i64) -> i64
      %894 = func.call @cc_values_pack(%893) : (i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      %895 = llvm.mlir.addressof @str82 : !llvm.ptr
      %896 = arith.constant 15 : i64
      %897 = func.call @cc_make_string(%895, %896) : (!llvm.ptr, i64) -> i64
      %898 = func.call @cc_nil_value() : () -> i64
      %899 = func.call @cc_intern(%897, %898) : (i64, i64) -> i64
      %900 = func.call @cc_nil_value() : () -> i64
      %901 = func.call @cc_cons(%899, %900) : (i64, i64) -> i64
      %902 = func.call @cc_values_pack(%901) : (i64) -> i64
      func.call @stack_push_pointer(%899) : (i64) -> ()
      %903 = llvm.mlir.addressof @str83 : !llvm.ptr
      %904 = arith.constant 4 : i64
      %905 = func.call @cc_make_string(%903, %904) : (!llvm.ptr, i64) -> i64
      %906 = func.call @cc_nil_value() : () -> i64
      %907 = func.call @cc_intern(%905, %906) : (i64, i64) -> i64
      %908 = func.call @cc_nil_value() : () -> i64
      %909 = func.call @cc_cons(%907, %908) : (i64, i64) -> i64
      %910 = func.call @cc_values_pack(%909) : (i64) -> i64
      func.call @stack_push_pointer(%907) : (i64) -> ()
      %911 = llvm.mlir.addressof @str84 : !llvm.ptr
      %912 = arith.constant 4 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      %914 = llvm.mlir.addressof @str85 : !llvm.ptr
      %915 = arith.constant 11 : i64
      %916 = func.call @cc_make_string(%914, %915) : (!llvm.ptr, i64) -> i64
      %917 = func.call @cc_intern(%913, %916) : (i64, i64) -> i64
      %918 = func.call @cc_nil_value() : () -> i64
      %919 = func.call @cc_cons(%917, %918) : (i64, i64) -> i64
      %920 = func.call @cc_values_pack(%919) : (i64) -> i64
      func.call @stack_push_pointer(%917) : (i64) -> ()
      %921 = llvm.mlir.addressof @str86 : !llvm.ptr
      %922 = arith.constant 1 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = func.call @cc_nil_value() : () -> i64
      %925 = func.call @cc_intern(%923, %924) : (i64, i64) -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
      %928 = func.call @cc_values_pack(%927) : (i64) -> i64
      func.call @stack_push_pointer(%925) : (i64) -> ()
      %929 = llvm.mlir.addressof @str87 : !llvm.ptr
      %930 = arith.constant 9 : i64
      %931 = func.call @cc_make_string(%929, %930) : (!llvm.ptr, i64) -> i64
      %932 = llvm.mlir.addressof @str88 : !llvm.ptr
      %933 = arith.constant 11 : i64
      %934 = func.call @cc_make_string(%932, %933) : (!llvm.ptr, i64) -> i64
      %935 = func.call @cc_intern(%931, %934) : (i64, i64) -> i64
      %936 = func.call @cc_nil_value() : () -> i64
      %937 = func.call @cc_cons(%935, %936) : (i64, i64) -> i64
      %938 = func.call @cc_values_pack(%937) : (i64) -> i64
      func.call @stack_push_pointer(%935) : (i64) -> ()
      %939 = llvm.mlir.addressof @str89 : !llvm.ptr
      %940 = arith.constant 1 : i64
      %941 = func.call @cc_make_string(%939, %940) : (!llvm.ptr, i64) -> i64
      %942 = func.call @cc_nil_value() : () -> i64
      %943 = func.call @cc_intern(%941, %942) : (i64, i64) -> i64
      %944 = func.call @cc_nil_value() : () -> i64
      %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
      %946 = func.call @cc_values_pack(%945) : (i64) -> i64
      func.call @stack_push_pointer(%943) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %947 = func.call @stack_pop_pointer() : () -> i64
      %948 = func.call @stack_pop_pointer() : () -> i64
      %949 = func.call @cc_cons(%948, %947) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %950 = arith.addi %949, %__rlasp_stack_elide_zero_51 : i64
      %951 = func.call @stack_pop_pointer() : () -> i64
      %952 = func.call @cc_cons(%951, %950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %953 = func.call @stack_pop_pointer() : () -> i64
      %954 = func.call @stack_pop_pointer() : () -> i64
      %955 = func.call @cc_cons(%954, %953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %956 = arith.addi %955, %__rlasp_stack_elide_zero_52 : i64
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @cc_cons(%957, %956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %959 = arith.addi %958, %__rlasp_stack_elide_zero_53 : i64
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @cc_cons(%960, %959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %962 = func.call @stack_pop_pointer() : () -> i64
      %963 = func.call @stack_pop_pointer() : () -> i64
      %964 = func.call @cc_cons(%963, %962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %965 = arith.addi %964, %__rlasp_stack_elide_zero_54 : i64
      %966 = func.call @stack_pop_pointer() : () -> i64
      %967 = func.call @cc_cons(%966, %965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %968 = func.call @stack_pop_pointer() : () -> i64
      %969 = func.call @stack_pop_pointer() : () -> i64
      %970 = func.call @cc_cons(%969, %968) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %971 = arith.addi %970, %__rlasp_stack_elide_zero_55 : i64
      %972 = func.call @stack_pop_pointer() : () -> i64
      %973 = func.call @cc_cons(%972, %971) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %974 = arith.addi %973, %__rlasp_stack_elide_zero_56 : i64
      %975 = func.call @stack_pop_pointer() : () -> i64
      %976 = func.call @cc_cons(%975, %974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %977 = func.call @stack_pop_pointer() : () -> i64
      %978 = func.call @stack_pop_pointer() : () -> i64
      %979 = func.call @cc_cons(%978, %977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %980 = arith.addi %979, %__rlasp_stack_elide_zero_57 : i64
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @cc_cons(%981, %980) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %983 = arith.addi %982, %__rlasp_stack_elide_zero_58 : i64
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @cc_cons(%984, %983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%985) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = func.call @cc_cons(%987, %986) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %989 = arith.addi %988, %__rlasp_stack_elide_zero_59 : i64
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @cc_cons(%990, %989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %992 = func.call @stack_pop_pointer() : () -> i64
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @cc_cons(%993, %992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %995 = arith.addi %994, %__rlasp_stack_elide_zero_60 : i64
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = func.call @cc_cons(%996, %995) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %998 = arith.addi %997, %__rlasp_stack_elide_zero_61 : i64
      %999 = func.call @stack_pop_pointer() : () -> i64
      %1000 = func.call @cc_cons(%999, %998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1001 = arith.addi %1000, %__rlasp_stack_elide_zero_62 : i64
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @cc_cons(%1002, %1001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1004 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1005 = arith.constant 4 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = func.call @cc_nil_value() : () -> i64
      %1008 = func.call @cc_intern(%1006, %1007) : (i64, i64) -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_cons(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_values_pack(%1010) : (i64) -> i64
      func.call @stack_push_pointer(%1008) : (i64) -> ()
      %1012 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1013 = arith.constant 1 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = func.call @cc_nil_value() : () -> i64
      %1016 = func.call @cc_intern(%1014, %1015) : (i64, i64) -> i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_cons(%1016, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_values_pack(%1018) : (i64) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      %1020 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1021 = arith.constant 1 : i64
      %1022 = func.call @cc_make_string(%1020, %1021) : (!llvm.ptr, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_intern(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_values_pack(%1026) : (i64) -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1028 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1029 = arith.constant 1 : i64
      %1030 = func.call @cc_make_string(%1028, %1029) : (!llvm.ptr, i64) -> i64
      %1031 = func.call @cc_nil_value() : () -> i64
      %1032 = func.call @cc_intern(%1030, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_cons(%1032, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_values_pack(%1034) : (i64) -> i64
      func.call @stack_push_pointer(%1032) : (i64) -> ()
      %1036 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = func.call @cc_cons(%1038, %1037) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1040 = arith.addi %1039, %__rlasp_stack_elide_zero_63 : i64
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = func.call @cc_cons(%1041, %1040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1043 = arith.addi %1042, %__rlasp_stack_elide_zero_64 : i64
      %1044 = func.call @stack_pop_pointer() : () -> i64
      %1045 = func.call @cc_cons(%1044, %1043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @cc_cons(%1047, %1046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1049 = arith.addi %1048, %__rlasp_stack_elide_zero_65 : i64
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @cc_cons(%1050, %1049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1052 = arith.addi %1051, %__rlasp_stack_elide_zero_66 : i64
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @cc_cons(%1053, %1052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @cc_cons(%1056, %1055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1058 = arith.addi %1057, %__rlasp_stack_elide_zero_67 : i64
      %1059 = func.call @stack_pop_pointer() : () -> i64
      %1060 = func.call @cc_cons(%1059, %1058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1061 = arith.addi %1060, %__rlasp_stack_elide_zero_68 : i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1062, %1061) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1064 = arith.addi %1063, %__rlasp_stack_elide_zero_69 : i64
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @cc_cons(%1065, %1064) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1067 = arith.addi %1066, %__rlasp_stack_elide_zero_70 : i64
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @cc_cons(%1068, %1067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1070 = arith.addi %1069, %__rlasp_stack_elide_zero_71 : i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1071, %1070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1073 = arith.addi %1072, %__rlasp_stack_elide_zero_72 : i64
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @cc_cons(%1074, %1073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1075) : (i64) -> ()
      %1076 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1077 = arith.constant 2 : i64
      %1078 = func.call @cc_make_string(%1076, %1077) : (!llvm.ptr, i64) -> i64
      %1079 = func.call @cc_nil_value() : () -> i64
      %1080 = func.call @cc_intern(%1078, %1079) : (i64, i64) -> i64
      %1081 = func.call @cc_nil_value() : () -> i64
      %1082 = func.call @cc_cons(%1080, %1081) : (i64, i64) -> i64
      %1083 = func.call @cc_values_pack(%1082) : (i64) -> i64
      func.call @stack_push_pointer(%1080) : (i64) -> ()
      %1084 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1085 = arith.constant 17 : i64
      %1086 = func.call @cc_make_string(%1084, %1085) : (!llvm.ptr, i64) -> i64
      %1087 = func.call @cc_nil_value() : () -> i64
      %1088 = func.call @cc_intern(%1086, %1087) : (i64, i64) -> i64
      %1089 = func.call @cc_nil_value() : () -> i64
      %1090 = func.call @cc_cons(%1088, %1089) : (i64, i64) -> i64
      %1091 = func.call @cc_values_pack(%1090) : (i64) -> i64
      func.call @stack_push_pointer(%1088) : (i64) -> ()
      %1092 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1093 = arith.constant 5 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_intern(%1094, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_nil_value() : () -> i64
      %1098 = func.call @cc_cons(%1096, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_values_pack(%1098) : (i64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      %1100 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1101 = arith.constant 4 : i64
      %1102 = func.call @cc_make_string(%1100, %1101) : (!llvm.ptr, i64) -> i64
      %1103 = func.call @cc_nil_value() : () -> i64
      %1104 = func.call @cc_intern(%1102, %1103) : (i64, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_cons(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_values_pack(%1106) : (i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      %1108 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1109 = arith.constant 1 : i64
      %1110 = func.call @cc_make_string(%1108, %1109) : (!llvm.ptr, i64) -> i64
      %1111 = func.call @cc_nil_value() : () -> i64
      %1112 = func.call @cc_intern(%1110, %1111) : (i64, i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_cons(%1112, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_values_pack(%1114) : (i64) -> i64
      func.call @stack_push_pointer(%1112) : (i64) -> ()
      %1116 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1117 = arith.constant 19 : i64
      %1118 = func.call @cc_make_string(%1116, %1117) : (!llvm.ptr, i64) -> i64
      %1119 = func.call @cc_nil_value() : () -> i64
      %1120 = func.call @cc_intern(%1118, %1119) : (i64, i64) -> i64
      %1121 = func.call @cc_nil_value() : () -> i64
      %1122 = func.call @cc_cons(%1120, %1121) : (i64, i64) -> i64
      %1123 = func.call @cc_values_pack(%1122) : (i64) -> i64
      func.call @stack_push_pointer(%1120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @stack_pop_pointer() : () -> i64
      %1126 = func.call @cc_cons(%1125, %1124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1127 = arith.addi %1126, %__rlasp_stack_elide_zero_73 : i64
      %1128 = func.call @stack_pop_pointer() : () -> i64
      %1129 = func.call @cc_cons(%1128, %1127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1130 = arith.addi %1129, %__rlasp_stack_elide_zero_74 : i64
      %1131 = func.call @stack_pop_pointer() : () -> i64
      %1132 = func.call @cc_cons(%1131, %1130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @stack_pop_pointer() : () -> i64
      %1135 = func.call @cc_cons(%1134, %1133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1136 = arith.addi %1135, %__rlasp_stack_elide_zero_75 : i64
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @cc_cons(%1137, %1136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @stack_pop_pointer() : () -> i64
      %1141 = func.call @cc_cons(%1140, %1139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1142 = arith.addi %1141, %__rlasp_stack_elide_zero_76 : i64
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @cc_cons(%1143, %1142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1145 = arith.addi %1144, %__rlasp_stack_elide_zero_77 : i64
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @cc_cons(%1146, %1145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1148 = arith.addi %1147, %__rlasp_stack_elide_zero_78 : i64
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @cc_cons(%1149, %1148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1151 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1152 = arith.constant 15 : i64
      %1153 = func.call @cc_make_string(%1151, %1152) : (!llvm.ptr, i64) -> i64
      %1154 = func.call @cc_nil_value() : () -> i64
      %1155 = func.call @cc_intern(%1153, %1154) : (i64, i64) -> i64
      %1156 = func.call @cc_nil_value() : () -> i64
      %1157 = func.call @cc_cons(%1155, %1156) : (i64, i64) -> i64
      %1158 = func.call @cc_values_pack(%1157) : (i64) -> i64
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @cc_cons(%1160, %1159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1162 = arith.addi %1161, %__rlasp_stack_elide_zero_79 : i64
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @cc_cons(%1163, %1162) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1165 = arith.addi %1164, %__rlasp_stack_elide_zero_80 : i64
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @cc_cons(%1166, %1165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1168 = arith.addi %1167, %__rlasp_stack_elide_zero_81 : i64
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @cc_cons(%1169, %1168) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1171 = arith.addi %1170, %__rlasp_stack_elide_zero_82 : i64
      %1172 = func.call @stack_pop_pointer() : () -> i64
      %1173 = func.call @cc_cons(%1172, %1171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1173) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1174 = func.call @stack_pop_pointer() : () -> i64
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @cc_cons(%1175, %1174) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1177 = arith.addi %1176, %__rlasp_stack_elide_zero_83 : i64
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @cc_cons(%1178, %1177) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1180 = arith.addi %1179, %__rlasp_stack_elide_zero_84 : i64
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_cons(%1181, %1180) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1183 = arith.addi %1182, %__rlasp_stack_elide_zero_85 : i64
      %1511 = arith.constant 271595545296899 : i64
      %1512 = arith.constant 0 : i64
      %1513 = func.call @cc_make_closure(%1511, %1512) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1514 = arith.addi %1513, %__rlasp_stack_elide_zero_86 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1515 = func.call @stack_pop_pointer() : () -> i64
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @cc_cons(%1516, %1515) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1518 = arith.addi %1517, %__rlasp_stack_elide_zero_87 : i64
      %1519 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1520 = arith.constant 11 : i64
      %1521 = func.call @cc_make_string(%1519, %1520) : (!llvm.ptr, i64) -> i64
      %1522 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1523 = arith.constant 7 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = func.call @cc_intern(%1521, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_nil_value() : () -> i64
      %1527 = func.call @cc_cons(%1525, %1526) : (i64, i64) -> i64
      %1528 = func.call @cc_values_pack(%1527) : (i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1531 = arith.constant 4 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1534 = arith.constant 7 : i64
      %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
      %1536 = func.call @cc_intern(%1532, %1535) : (i64, i64) -> i64
      %1537 = func.call @cc_nil_value() : () -> i64
      %1538 = func.call @cc_cons(%1536, %1537) : (i64, i64) -> i64
      %1539 = func.call @cc_values_pack(%1538) : (i64) -> i64
      %1540 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1541 = arith.constant 6 : i64
      %1542 = func.call @cc_make_string(%1540, %1541) : (!llvm.ptr, i64) -> i64
      %1543 = func.call @cc_nil_value() : () -> i64
      %1544 = func.call @cc_intern(%1542, %1543) : (i64, i64) -> i64
      %1545 = func.call @cc_nil_value() : () -> i64
      %1546 = func.call @cc_cons(%1544, %1545) : (i64, i64) -> i64
      %1547 = func.call @cc_values_pack(%1546) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1548 = arith.addi %1544, %__rlasp_stack_elide_zero_88 : i64
      %1549 = func.call @cc_nil_value() : () -> i64
      %1550 = func.call @cc_errorp(%336) : (i64) -> i64
      %1551 = arith.cmpi ne, %1550, %1549 : i64
      %1552 = arith.cmpi eq, %1549, %1549 : i64
      %1553 = arith.andi %1551, %1552 : i1
      %1554 = scf.if %1553 -> (i64) {
        scf.yield %336 : i64
      } else {
        scf.yield %1549 : i64
      }
      %1555 = func.call @cc_errorp(%1183) : (i64) -> i64
      %1556 = arith.cmpi ne, %1555, %1549 : i64
      %1557 = arith.cmpi eq, %1554, %1549 : i64
      %1558 = arith.andi %1556, %1557 : i1
      %1559 = scf.if %1558 -> (i64) {
        scf.yield %1183 : i64
      } else {
        scf.yield %1554 : i64
      }
      %1560 = func.call @cc_errorp(%1514) : (i64) -> i64
      %1561 = arith.cmpi ne, %1560, %1549 : i64
      %1562 = arith.cmpi eq, %1559, %1549 : i64
      %1563 = arith.andi %1561, %1562 : i1
      %1564 = scf.if %1563 -> (i64) {
        scf.yield %1514 : i64
      } else {
        scf.yield %1559 : i64
      }
      %1565 = func.call @cc_errorp(%1518) : (i64) -> i64
      %1566 = arith.cmpi ne, %1565, %1549 : i64
      %1567 = arith.cmpi eq, %1564, %1549 : i64
      %1568 = arith.andi %1566, %1567 : i1
      %1569 = scf.if %1568 -> (i64) {
        scf.yield %1518 : i64
      } else {
        scf.yield %1564 : i64
      }
      %1570 = func.call @cc_errorp(%1525) : (i64) -> i64
      %1571 = arith.cmpi ne, %1570, %1549 : i64
      %1572 = arith.cmpi eq, %1569, %1549 : i64
      %1573 = arith.andi %1571, %1572 : i1
      %1574 = scf.if %1573 -> (i64) {
        scf.yield %1525 : i64
      } else {
        scf.yield %1569 : i64
      }
      %1575 = func.call @cc_errorp(%1529) : (i64) -> i64
      %1576 = arith.cmpi ne, %1575, %1549 : i64
      %1577 = arith.cmpi eq, %1574, %1549 : i64
      %1578 = arith.andi %1576, %1577 : i1
      %1579 = scf.if %1578 -> (i64) {
        scf.yield %1529 : i64
      } else {
        scf.yield %1574 : i64
      }
      %1580 = func.call @cc_errorp(%1536) : (i64) -> i64
      %1581 = arith.cmpi ne, %1580, %1549 : i64
      %1582 = arith.cmpi eq, %1579, %1549 : i64
      %1583 = arith.andi %1581, %1582 : i1
      %1584 = scf.if %1583 -> (i64) {
        scf.yield %1536 : i64
      } else {
        scf.yield %1579 : i64
      }
      %1585 = func.call @cc_errorp(%1548) : (i64) -> i64
      %1586 = arith.cmpi ne, %1585, %1549 : i64
      %1587 = arith.cmpi eq, %1584, %1549 : i64
      %1588 = arith.andi %1586, %1587 : i1
      %1589 = scf.if %1588 -> (i64) {
        scf.yield %1548 : i64
      } else {
        scf.yield %1584 : i64
      }
      %1590 = arith.cmpi ne, %1589, %1549 : i64
      scf.if %1590 {
        func.call @stack_push_pointer(%1589) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%336) : (i64) -> ()
        func.call @stack_push_pointer(%1183) : (i64) -> ()
        func.call @stack_push_pointer(%1514) : (i64) -> ()
        func.call @stack_push_pointer(%1518) : (i64) -> ()
        func.call @stack_push_pointer(%1525) : (i64) -> ()
        func.call @stack_push_pointer(%1529) : (i64) -> ()
        func.call @stack_push_pointer(%1536) : (i64) -> ()
        func.call @stack_push_pointer(%1548) : (i64) -> ()
        %1591 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1592 = func.call @cc_make_function_ref_const(%1591) : (!llvm.ptr) -> i64
        %1593 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1592, %1593) : (i64, i64) -> ()
      }
      %1594 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1594 : i64
    }
    %1595 = func.call @cc_nil_value() : () -> i64
    %1596 = func.call @cc_errorp(%327) : (i64) -> i64
    %1597 = arith.cmpi ne, %1596, %1595 : i64
    %1598 = scf.if %1597 -> (i64) {
      scf.yield %327 : i64
    } else {
      %1599 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1600 = arith.constant 14 : i64
      %1601 = func.call @cc_make_string(%1599, %1600) : (!llvm.ptr, i64) -> i64
      %1602 = func.call @cc_nil_value() : () -> i64
      %1603 = func.call @cc_intern(%1601, %1602) : (i64, i64) -> i64
      %1604 = func.call @cc_nil_value() : () -> i64
      %1605 = func.call @cc_cons(%1603, %1604) : (i64, i64) -> i64
      %1606 = func.call @cc_values_pack(%1605) : (i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1607 = arith.addi %1603, %__rlasp_stack_elide_zero_89 : i64
      %1608 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1609 = arith.constant 4 : i64
      %1610 = func.call @cc_make_string(%1608, %1609) : (!llvm.ptr, i64) -> i64
      %1611 = func.call @cc_nil_value() : () -> i64
      %1612 = func.call @cc_intern(%1610, %1611) : (i64, i64) -> i64
      %1613 = func.call @cc_nil_value() : () -> i64
      %1614 = func.call @cc_cons(%1612, %1613) : (i64, i64) -> i64
      %1615 = func.call @cc_values_pack(%1614) : (i64) -> i64
      func.call @stack_push_pointer(%1612) : (i64) -> ()
      %1616 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1617 = arith.constant 1 : i64
      %1618 = func.call @cc_make_string(%1616, %1617) : (!llvm.ptr, i64) -> i64
      %1619 = func.call @cc_nil_value() : () -> i64
      %1620 = func.call @cc_intern(%1618, %1619) : (i64, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_cons(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_values_pack(%1622) : (i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1624 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1624) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @stack_pop_pointer() : () -> i64
      %1627 = func.call @cc_cons(%1626, %1625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1628 = arith.addi %1627, %__rlasp_stack_elide_zero_90 : i64
      %1629 = func.call @stack_pop_pointer() : () -> i64
      %1630 = func.call @cc_cons(%1629, %1628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1630) : (i64) -> ()
      %1631 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1632 = arith.constant 19 : i64
      %1633 = func.call @cc_make_string(%1631, %1632) : (!llvm.ptr, i64) -> i64
      %1634 = func.call @cc_nil_value() : () -> i64
      %1635 = func.call @cc_intern(%1633, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_values_pack(%1637) : (i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1639 = func.call @stack_pop_pointer() : () -> i64
      %1640 = func.call @stack_pop_pointer() : () -> i64
      %1641 = func.call @cc_cons(%1640, %1639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1642 = arith.addi %1641, %__rlasp_stack_elide_zero_91 : i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1644) : (i64) -> ()
      %1645 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1646 = arith.constant 1 : i64
      %1647 = func.call @cc_make_string(%1645, %1646) : (!llvm.ptr, i64) -> i64
      %1648 = func.call @cc_nil_value() : () -> i64
      %1649 = func.call @cc_intern(%1647, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_cons(%1649, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_values_pack(%1651) : (i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @cc_cons(%1654, %1653) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1656 = arith.addi %1655, %__rlasp_stack_elide_zero_92 : i64
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @cc_cons(%1657, %1656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1658) : (i64) -> ()
      %1659 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1660 = arith.constant 15 : i64
      %1661 = func.call @cc_make_string(%1659, %1660) : (!llvm.ptr, i64) -> i64
      %1662 = func.call @cc_nil_value() : () -> i64
      %1663 = func.call @cc_intern(%1661, %1662) : (i64, i64) -> i64
      %1664 = func.call @cc_nil_value() : () -> i64
      %1665 = func.call @cc_cons(%1663, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_values_pack(%1665) : (i64) -> i64
      func.call @stack_push_pointer(%1663) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1667 = func.call @stack_pop_pointer() : () -> i64
      %1668 = func.call @stack_pop_pointer() : () -> i64
      %1669 = func.call @cc_cons(%1668, %1667) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1670 = arith.addi %1669, %__rlasp_stack_elide_zero_93 : i64
      %1671 = func.call @stack_pop_pointer() : () -> i64
      %1672 = func.call @cc_cons(%1671, %1670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1672) : (i64) -> ()
      %1673 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1674 = arith.constant 17 : i64
      %1675 = func.call @cc_make_string(%1673, %1674) : (!llvm.ptr, i64) -> i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_intern(%1675, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_nil_value() : () -> i64
      %1679 = func.call @cc_cons(%1677, %1678) : (i64, i64) -> i64
      %1680 = func.call @cc_values_pack(%1679) : (i64) -> i64
      func.call @stack_push_pointer(%1677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @cc_cons(%1682, %1681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1684 = arith.addi %1683, %__rlasp_stack_elide_zero_94 : i64
      %1685 = func.call @stack_pop_pointer() : () -> i64
      %1686 = func.call @cc_cons(%1685, %1684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @stack_pop_pointer() : () -> i64
      %1689 = func.call @cc_cons(%1688, %1687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1690 = arith.addi %1689, %__rlasp_stack_elide_zero_95 : i64
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @cc_cons(%1691, %1690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1693 = arith.addi %1692, %__rlasp_stack_elide_zero_96 : i64
      %1694 = func.call @stack_pop_pointer() : () -> i64
      %1695 = func.call @cc_cons(%1694, %1693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1696 = arith.addi %1695, %__rlasp_stack_elide_zero_97 : i64
      %1697 = func.call @stack_pop_pointer() : () -> i64
      %1698 = func.call @cc_cons(%1697, %1696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1699 = arith.addi %1698, %__rlasp_stack_elide_zero_98 : i64
      %1700 = func.call @stack_pop_pointer() : () -> i64
      %1701 = func.call @cc_cons(%1700, %1699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1701) : (i64) -> ()
      %1702 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1703 = arith.constant 5 : i64
      %1704 = func.call @cc_make_string(%1702, %1703) : (!llvm.ptr, i64) -> i64
      %1705 = func.call @cc_nil_value() : () -> i64
      %1706 = func.call @cc_intern(%1704, %1705) : (i64, i64) -> i64
      %1707 = func.call @cc_nil_value() : () -> i64
      %1708 = func.call @cc_cons(%1706, %1707) : (i64, i64) -> i64
      %1709 = func.call @cc_values_pack(%1708) : (i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1710 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1711 = arith.constant 5 : i64
      %1712 = func.call @cc_make_string(%1710, %1711) : (!llvm.ptr, i64) -> i64
      %1713 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1714 = arith.constant 3 : i64
      %1715 = func.call @cc_make_string(%1713, %1714) : (!llvm.ptr, i64) -> i64
      %1716 = func.call @cc_intern(%1712, %1715) : (i64, i64) -> i64
      %1717 = func.call @cc_nil_value() : () -> i64
      %1718 = func.call @cc_cons(%1716, %1717) : (i64, i64) -> i64
      %1719 = func.call @cc_values_pack(%1718) : (i64) -> i64
      func.call @stack_push_pointer(%1716) : (i64) -> ()
      %1720 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1721 = arith.constant 1 : i64
      %1722 = func.call @cc_make_string(%1720, %1721) : (!llvm.ptr, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_intern(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_nil_value() : () -> i64
      %1726 = func.call @cc_cons(%1724, %1725) : (i64, i64) -> i64
      %1727 = func.call @cc_values_pack(%1726) : (i64) -> i64
      func.call @stack_push_pointer(%1724) : (i64) -> ()
      %1728 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1729 = arith.constant 1 : i64
      %1730 = func.call @cc_make_string(%1728, %1729) : (!llvm.ptr, i64) -> i64
      %1731 = func.call @cc_nil_value() : () -> i64
      %1732 = func.call @cc_intern(%1730, %1731) : (i64, i64) -> i64
      %1733 = func.call @cc_nil_value() : () -> i64
      %1734 = func.call @cc_cons(%1732, %1733) : (i64, i64) -> i64
      %1735 = func.call @cc_values_pack(%1734) : (i64) -> i64
      func.call @stack_push_pointer(%1732) : (i64) -> ()
      %1736 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1737 = arith.constant 15 : i64
      %1738 = func.call @cc_make_string(%1736, %1737) : (!llvm.ptr, i64) -> i64
      %1739 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1740 = arith.constant 11 : i64
      %1741 = func.call @cc_make_string(%1739, %1740) : (!llvm.ptr, i64) -> i64
      %1742 = func.call @cc_intern(%1738, %1741) : (i64, i64) -> i64
      %1743 = func.call @cc_nil_value() : () -> i64
      %1744 = func.call @cc_cons(%1742, %1743) : (i64, i64) -> i64
      %1745 = func.call @cc_values_pack(%1744) : (i64) -> i64
      func.call @stack_push_pointer(%1742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1746 = func.call @stack_pop_pointer() : () -> i64
      %1747 = func.call @stack_pop_pointer() : () -> i64
      %1748 = func.call @cc_cons(%1747, %1746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %1749 = arith.addi %1748, %__rlasp_stack_elide_zero_99 : i64
      %1750 = func.call @stack_pop_pointer() : () -> i64
      %1751 = func.call @cc_cons(%1750, %1749) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %1752 = arith.addi %1751, %__rlasp_stack_elide_zero_100 : i64
      %1753 = func.call @stack_pop_pointer() : () -> i64
      %1754 = func.call @cc_cons(%1753, %1752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1754) : (i64) -> ()
      %1755 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1756 = arith.constant 4 : i64
      %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
      %1758 = func.call @cc_nil_value() : () -> i64
      %1759 = func.call @cc_intern(%1757, %1758) : (i64, i64) -> i64
      %1760 = func.call @cc_nil_value() : () -> i64
      %1761 = func.call @cc_cons(%1759, %1760) : (i64, i64) -> i64
      %1762 = func.call @cc_values_pack(%1761) : (i64) -> i64
      func.call @stack_push_pointer(%1759) : (i64) -> ()
      %1763 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1764 = arith.constant 17 : i64
      %1765 = func.call @cc_make_string(%1763, %1764) : (!llvm.ptr, i64) -> i64
      %1766 = func.call @cc_nil_value() : () -> i64
      %1767 = func.call @cc_intern(%1765, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_nil_value() : () -> i64
      %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
      %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      %1771 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1771) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1772 = func.call @stack_pop_pointer() : () -> i64
      %1773 = func.call @stack_pop_pointer() : () -> i64
      %1774 = func.call @cc_cons(%1773, %1772) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %1775 = arith.addi %1774, %__rlasp_stack_elide_zero_101 : i64
      %1776 = func.call @stack_pop_pointer() : () -> i64
      %1777 = func.call @cc_cons(%1776, %1775) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %1778 = arith.addi %1777, %__rlasp_stack_elide_zero_102 : i64
      %1779 = func.call @stack_pop_pointer() : () -> i64
      %1780 = func.call @cc_cons(%1779, %1778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1780) : (i64) -> ()
      %1781 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1782 = arith.constant 4 : i64
      %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_intern(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_nil_value() : () -> i64
      %1787 = func.call @cc_cons(%1785, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_values_pack(%1787) : (i64) -> i64
      func.call @stack_push_pointer(%1785) : (i64) -> ()
      %1789 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1790 = arith.constant 19 : i64
      %1791 = func.call @cc_make_string(%1789, %1790) : (!llvm.ptr, i64) -> i64
      %1792 = func.call @cc_nil_value() : () -> i64
      %1793 = func.call @cc_intern(%1791, %1792) : (i64, i64) -> i64
      %1794 = func.call @cc_nil_value() : () -> i64
      %1795 = func.call @cc_cons(%1793, %1794) : (i64, i64) -> i64
      %1796 = func.call @cc_values_pack(%1795) : (i64) -> i64
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1797 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1798 = arith.constant 1 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = func.call @cc_nil_value() : () -> i64
      %1801 = func.call @cc_intern(%1799, %1800) : (i64, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_cons(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_values_pack(%1803) : (i64) -> i64
      func.call @stack_push_pointer(%1801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1805 = func.call @stack_pop_pointer() : () -> i64
      %1806 = func.call @stack_pop_pointer() : () -> i64
      %1807 = func.call @cc_cons(%1806, %1805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %1808 = arith.addi %1807, %__rlasp_stack_elide_zero_103 : i64
      %1809 = func.call @stack_pop_pointer() : () -> i64
      %1810 = func.call @cc_cons(%1809, %1808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %1811 = arith.addi %1810, %__rlasp_stack_elide_zero_104 : i64
      %1812 = func.call @stack_pop_pointer() : () -> i64
      %1813 = func.call @cc_cons(%1812, %1811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1813) : (i64) -> ()
      %1814 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1815 = arith.constant 4 : i64
      %1816 = func.call @cc_make_string(%1814, %1815) : (!llvm.ptr, i64) -> i64
      %1817 = func.call @cc_nil_value() : () -> i64
      %1818 = func.call @cc_intern(%1816, %1817) : (i64, i64) -> i64
      %1819 = func.call @cc_nil_value() : () -> i64
      %1820 = func.call @cc_cons(%1818, %1819) : (i64, i64) -> i64
      %1821 = func.call @cc_values_pack(%1820) : (i64) -> i64
      func.call @stack_push_pointer(%1818) : (i64) -> ()
      %1822 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1823 = arith.constant 1 : i64
      %1824 = func.call @cc_make_string(%1822, %1823) : (!llvm.ptr, i64) -> i64
      %1825 = func.call @cc_nil_value() : () -> i64
      %1826 = func.call @cc_intern(%1824, %1825) : (i64, i64) -> i64
      %1827 = func.call @cc_nil_value() : () -> i64
      %1828 = func.call @cc_cons(%1826, %1827) : (i64, i64) -> i64
      %1829 = func.call @cc_values_pack(%1828) : (i64) -> i64
      func.call @stack_push_pointer(%1826) : (i64) -> ()
      %1830 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1831 = arith.constant 9 : i64
      %1832 = func.call @cc_make_string(%1830, %1831) : (!llvm.ptr, i64) -> i64
      %1833 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1834 = arith.constant 11 : i64
      %1835 = func.call @cc_make_string(%1833, %1834) : (!llvm.ptr, i64) -> i64
      %1836 = func.call @cc_intern(%1832, %1835) : (i64, i64) -> i64
      %1837 = func.call @cc_nil_value() : () -> i64
      %1838 = func.call @cc_cons(%1836, %1837) : (i64, i64) -> i64
      %1839 = func.call @cc_values_pack(%1838) : (i64) -> i64
      func.call @stack_push_pointer(%1836) : (i64) -> ()
      %1840 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1841 = arith.constant 1 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = func.call @cc_nil_value() : () -> i64
      %1844 = func.call @cc_intern(%1842, %1843) : (i64, i64) -> i64
      %1845 = func.call @cc_nil_value() : () -> i64
      %1846 = func.call @cc_cons(%1844, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_values_pack(%1846) : (i64) -> i64
      func.call @stack_push_pointer(%1844) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @cc_cons(%1849, %1848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %1851 = arith.addi %1850, %__rlasp_stack_elide_zero_105 : i64
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @cc_cons(%1852, %1851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @cc_cons(%1855, %1854) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %1857 = arith.addi %1856, %__rlasp_stack_elide_zero_106 : i64
      %1858 = func.call @stack_pop_pointer() : () -> i64
      %1859 = func.call @cc_cons(%1858, %1857) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %1860 = arith.addi %1859, %__rlasp_stack_elide_zero_107 : i64
      %1861 = func.call @stack_pop_pointer() : () -> i64
      %1862 = func.call @cc_cons(%1861, %1860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1862) : (i64) -> ()
      %1863 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1864 = arith.constant 2 : i64
      %1865 = func.call @cc_make_string(%1863, %1864) : (!llvm.ptr, i64) -> i64
      %1866 = func.call @cc_nil_value() : () -> i64
      %1867 = func.call @cc_intern(%1865, %1866) : (i64, i64) -> i64
      %1868 = func.call @cc_nil_value() : () -> i64
      %1869 = func.call @cc_cons(%1867, %1868) : (i64, i64) -> i64
      %1870 = func.call @cc_values_pack(%1869) : (i64) -> i64
      func.call @stack_push_pointer(%1867) : (i64) -> ()
      %1871 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1872 = arith.constant 3 : i64
      %1873 = func.call @cc_make_string(%1871, %1872) : (!llvm.ptr, i64) -> i64
      %1874 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1875 = arith.constant 11 : i64
      %1876 = func.call @cc_make_string(%1874, %1875) : (!llvm.ptr, i64) -> i64
      %1877 = func.call @cc_intern(%1873, %1876) : (i64, i64) -> i64
      %1878 = func.call @cc_nil_value() : () -> i64
      %1879 = func.call @cc_cons(%1877, %1878) : (i64, i64) -> i64
      %1880 = func.call @cc_values_pack(%1879) : (i64) -> i64
      func.call @stack_push_pointer(%1877) : (i64) -> ()
      %1881 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1882 = arith.constant 1 : i64
      %1883 = func.call @cc_make_string(%1881, %1882) : (!llvm.ptr, i64) -> i64
      %1884 = func.call @cc_nil_value() : () -> i64
      %1885 = func.call @cc_intern(%1883, %1884) : (i64, i64) -> i64
      %1886 = func.call @cc_nil_value() : () -> i64
      %1887 = func.call @cc_cons(%1885, %1886) : (i64, i64) -> i64
      %1888 = func.call @cc_values_pack(%1887) : (i64) -> i64
      func.call @stack_push_pointer(%1885) : (i64) -> ()
      %1889 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1890 = arith.constant 12 : i64
      %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
      %1892 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1893 = arith.constant 11 : i64
      %1894 = func.call @cc_make_string(%1892, %1893) : (!llvm.ptr, i64) -> i64
      %1895 = func.call @cc_intern(%1891, %1894) : (i64, i64) -> i64
      %1896 = func.call @cc_nil_value() : () -> i64
      %1897 = func.call @cc_cons(%1895, %1896) : (i64, i64) -> i64
      %1898 = func.call @cc_values_pack(%1897) : (i64) -> i64
      func.call @stack_push_pointer(%1895) : (i64) -> ()
      %1899 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1900 = arith.constant 1 : i64
      %1901 = func.call @cc_make_string(%1899, %1900) : (!llvm.ptr, i64) -> i64
      %1902 = func.call @cc_nil_value() : () -> i64
      %1903 = func.call @cc_intern(%1901, %1902) : (i64, i64) -> i64
      %1904 = func.call @cc_nil_value() : () -> i64
      %1905 = func.call @cc_cons(%1903, %1904) : (i64, i64) -> i64
      %1906 = func.call @cc_values_pack(%1905) : (i64) -> i64
      func.call @stack_push_pointer(%1903) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1907 = func.call @stack_pop_pointer() : () -> i64
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @cc_cons(%1908, %1907) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %1910 = arith.addi %1909, %__rlasp_stack_elide_zero_108 : i64
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @cc_cons(%1911, %1910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1912) : (i64) -> ()
      %1913 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1914 = arith.constant 5 : i64
      %1915 = func.call @cc_make_string(%1913, %1914) : (!llvm.ptr, i64) -> i64
      %1916 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1917 = arith.constant 11 : i64
      %1918 = func.call @cc_make_string(%1916, %1917) : (!llvm.ptr, i64) -> i64
      %1919 = func.call @cc_intern(%1915, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_nil_value() : () -> i64
      %1921 = func.call @cc_cons(%1919, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_values_pack(%1921) : (i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      %1923 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1924 = arith.constant 1 : i64
      %1925 = func.call @cc_make_string(%1923, %1924) : (!llvm.ptr, i64) -> i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_intern(%1925, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_nil_value() : () -> i64
      %1929 = func.call @cc_cons(%1927, %1928) : (i64, i64) -> i64
      %1930 = func.call @cc_values_pack(%1929) : (i64) -> i64
      func.call @stack_push_pointer(%1927) : (i64) -> ()
      %1931 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1932 = arith.constant 11 : i64
      %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
      %1934 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1935 = arith.constant 11 : i64
      %1936 = func.call @cc_make_string(%1934, %1935) : (!llvm.ptr, i64) -> i64
      %1937 = func.call @cc_intern(%1933, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_nil_value() : () -> i64
      %1939 = func.call @cc_cons(%1937, %1938) : (i64, i64) -> i64
      %1940 = func.call @cc_values_pack(%1939) : (i64) -> i64
      func.call @stack_push_pointer(%1937) : (i64) -> ()
      %1941 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1942 = arith.constant 1 : i64
      %1943 = func.call @cc_make_string(%1941, %1942) : (!llvm.ptr, i64) -> i64
      %1944 = func.call @cc_nil_value() : () -> i64
      %1945 = func.call @cc_intern(%1943, %1944) : (i64, i64) -> i64
      %1946 = func.call @cc_nil_value() : () -> i64
      %1947 = func.call @cc_cons(%1945, %1946) : (i64, i64) -> i64
      %1948 = func.call @cc_values_pack(%1947) : (i64) -> i64
      func.call @stack_push_pointer(%1945) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1949 = func.call @stack_pop_pointer() : () -> i64
      %1950 = func.call @stack_pop_pointer() : () -> i64
      %1951 = func.call @cc_cons(%1950, %1949) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %1952 = arith.addi %1951, %__rlasp_stack_elide_zero_109 : i64
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @cc_cons(%1953, %1952) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1954) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1955 = func.call @stack_pop_pointer() : () -> i64
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @cc_cons(%1956, %1955) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %1958 = arith.addi %1957, %__rlasp_stack_elide_zero_110 : i64
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @cc_cons(%1959, %1958) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %1961 = arith.addi %1960, %__rlasp_stack_elide_zero_111 : i64
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @cc_cons(%1962, %1961) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1964 = func.call @stack_pop_pointer() : () -> i64
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @cc_cons(%1965, %1964) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %1967 = arith.addi %1966, %__rlasp_stack_elide_zero_112 : i64
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = func.call @cc_cons(%1968, %1967) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %1970 = arith.addi %1969, %__rlasp_stack_elide_zero_113 : i64
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = func.call @cc_cons(%1971, %1970) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %1973 = arith.addi %1972, %__rlasp_stack_elide_zero_114 : i64
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = func.call @cc_cons(%1974, %1973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1975) : (i64) -> ()
      %1976 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1977 = arith.constant 5 : i64
      %1978 = func.call @cc_make_string(%1976, %1977) : (!llvm.ptr, i64) -> i64
      %1979 = func.call @cc_nil_value() : () -> i64
      %1980 = func.call @cc_intern(%1978, %1979) : (i64, i64) -> i64
      %1981 = func.call @cc_nil_value() : () -> i64
      %1982 = func.call @cc_cons(%1980, %1981) : (i64, i64) -> i64
      %1983 = func.call @cc_values_pack(%1982) : (i64) -> i64
      func.call @stack_push_pointer(%1980) : (i64) -> ()
      %1984 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1985 = arith.constant 4 : i64
      %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
      %1987 = func.call @cc_nil_value() : () -> i64
      %1988 = func.call @cc_intern(%1986, %1987) : (i64, i64) -> i64
      %1989 = func.call @cc_nil_value() : () -> i64
      %1990 = func.call @cc_cons(%1988, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_values_pack(%1990) : (i64) -> i64
      func.call @stack_push_pointer(%1988) : (i64) -> ()
      %1992 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1993 = arith.constant 15 : i64
      %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
      %1995 = func.call @cc_nil_value() : () -> i64
      %1996 = func.call @cc_intern(%1994, %1995) : (i64, i64) -> i64
      %1997 = func.call @cc_nil_value() : () -> i64
      %1998 = func.call @cc_cons(%1996, %1997) : (i64, i64) -> i64
      %1999 = func.call @cc_values_pack(%1998) : (i64) -> i64
      func.call @stack_push_pointer(%1996) : (i64) -> ()
      %2000 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2001 = arith.constant 6 : i64
      %2002 = func.call @cc_make_string(%2000, %2001) : (!llvm.ptr, i64) -> i64
      %2003 = func.call @cc_nil_value() : () -> i64
      %2004 = func.call @cc_intern(%2002, %2003) : (i64, i64) -> i64
      %2005 = func.call @cc_nil_value() : () -> i64
      %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
      %2007 = func.call @cc_values_pack(%2006) : (i64) -> i64
      func.call @stack_push_pointer(%2004) : (i64) -> ()
      %2008 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2009 = arith.constant 15 : i64
      %2010 = func.call @cc_make_string(%2008, %2009) : (!llvm.ptr, i64) -> i64
      %2011 = func.call @cc_nil_value() : () -> i64
      %2012 = func.call @cc_intern(%2010, %2011) : (i64, i64) -> i64
      %2013 = func.call @cc_nil_value() : () -> i64
      %2014 = func.call @cc_cons(%2012, %2013) : (i64, i64) -> i64
      %2015 = func.call @cc_values_pack(%2014) : (i64) -> i64
      func.call @stack_push_pointer(%2012) : (i64) -> ()
      %2016 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2017 = arith.constant 4 : i64
      %2018 = func.call @cc_make_string(%2016, %2017) : (!llvm.ptr, i64) -> i64
      %2019 = func.call @cc_nil_value() : () -> i64
      %2020 = func.call @cc_intern(%2018, %2019) : (i64, i64) -> i64
      %2021 = func.call @cc_nil_value() : () -> i64
      %2022 = func.call @cc_cons(%2020, %2021) : (i64, i64) -> i64
      %2023 = func.call @cc_values_pack(%2022) : (i64) -> i64
      func.call @stack_push_pointer(%2020) : (i64) -> ()
      %2024 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2025 = arith.constant 4 : i64
      %2026 = func.call @cc_make_string(%2024, %2025) : (!llvm.ptr, i64) -> i64
      %2027 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2028 = arith.constant 11 : i64
      %2029 = func.call @cc_make_string(%2027, %2028) : (!llvm.ptr, i64) -> i64
      %2030 = func.call @cc_intern(%2026, %2029) : (i64, i64) -> i64
      %2031 = func.call @cc_nil_value() : () -> i64
      %2032 = func.call @cc_cons(%2030, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_values_pack(%2032) : (i64) -> i64
      func.call @stack_push_pointer(%2030) : (i64) -> ()
      %2034 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2035 = arith.constant 1 : i64
      %2036 = func.call @cc_make_string(%2034, %2035) : (!llvm.ptr, i64) -> i64
      %2037 = func.call @cc_nil_value() : () -> i64
      %2038 = func.call @cc_intern(%2036, %2037) : (i64, i64) -> i64
      %2039 = func.call @cc_nil_value() : () -> i64
      %2040 = func.call @cc_cons(%2038, %2039) : (i64, i64) -> i64
      %2041 = func.call @cc_values_pack(%2040) : (i64) -> i64
      func.call @stack_push_pointer(%2038) : (i64) -> ()
      %2042 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2043 = arith.constant 1 : i64
      %2044 = func.call @cc_make_string(%2042, %2043) : (!llvm.ptr, i64) -> i64
      %2045 = func.call @cc_nil_value() : () -> i64
      %2046 = func.call @cc_intern(%2044, %2045) : (i64, i64) -> i64
      %2047 = func.call @cc_nil_value() : () -> i64
      %2048 = func.call @cc_cons(%2046, %2047) : (i64, i64) -> i64
      %2049 = func.call @cc_values_pack(%2048) : (i64) -> i64
      func.call @stack_push_pointer(%2046) : (i64) -> ()
      %2050 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2051 = arith.constant 9 : i64
      %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
      %2053 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2054 = arith.constant 11 : i64
      %2055 = func.call @cc_make_string(%2053, %2054) : (!llvm.ptr, i64) -> i64
      %2056 = func.call @cc_intern(%2052, %2055) : (i64, i64) -> i64
      %2057 = func.call @cc_nil_value() : () -> i64
      %2058 = func.call @cc_cons(%2056, %2057) : (i64, i64) -> i64
      %2059 = func.call @cc_values_pack(%2058) : (i64) -> i64
      func.call @stack_push_pointer(%2056) : (i64) -> ()
      %2060 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2061 = arith.constant 1 : i64
      %2062 = func.call @cc_make_string(%2060, %2061) : (!llvm.ptr, i64) -> i64
      %2063 = func.call @cc_nil_value() : () -> i64
      %2064 = func.call @cc_intern(%2062, %2063) : (i64, i64) -> i64
      %2065 = func.call @cc_nil_value() : () -> i64
      %2066 = func.call @cc_cons(%2064, %2065) : (i64, i64) -> i64
      %2067 = func.call @cc_values_pack(%2066) : (i64) -> i64
      func.call @stack_push_pointer(%2064) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2068 = func.call @stack_pop_pointer() : () -> i64
      %2069 = func.call @stack_pop_pointer() : () -> i64
      %2070 = func.call @cc_cons(%2069, %2068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2071 = arith.addi %2070, %__rlasp_stack_elide_zero_115 : i64
      %2072 = func.call @stack_pop_pointer() : () -> i64
      %2073 = func.call @cc_cons(%2072, %2071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2073) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @stack_pop_pointer() : () -> i64
      %2076 = func.call @cc_cons(%2075, %2074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2077 = arith.addi %2076, %__rlasp_stack_elide_zero_116 : i64
      %2078 = func.call @stack_pop_pointer() : () -> i64
      %2079 = func.call @cc_cons(%2078, %2077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2080 = arith.addi %2079, %__rlasp_stack_elide_zero_117 : i64
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2082 = func.call @cc_cons(%2081, %2080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2083 = arith.addi %2082, %__rlasp_stack_elide_zero_118 : i64
      %2084 = func.call @stack_pop_pointer() : () -> i64
      %2085 = func.call @cc_cons(%2084, %2083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = func.call @stack_pop_pointer() : () -> i64
      %2088 = func.call @cc_cons(%2087, %2086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2089 = arith.addi %2088, %__rlasp_stack_elide_zero_119 : i64
      %2090 = func.call @stack_pop_pointer() : () -> i64
      %2091 = func.call @cc_cons(%2090, %2089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2091) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2092 = func.call @stack_pop_pointer() : () -> i64
      %2093 = func.call @stack_pop_pointer() : () -> i64
      %2094 = func.call @cc_cons(%2093, %2092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2095 = arith.addi %2094, %__rlasp_stack_elide_zero_120 : i64
      %2096 = func.call @stack_pop_pointer() : () -> i64
      %2097 = func.call @cc_cons(%2096, %2095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2098 = arith.addi %2097, %__rlasp_stack_elide_zero_121 : i64
      %2099 = func.call @stack_pop_pointer() : () -> i64
      %2100 = func.call @cc_cons(%2099, %2098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2101 = func.call @stack_pop_pointer() : () -> i64
      %2102 = func.call @stack_pop_pointer() : () -> i64
      %2103 = func.call @cc_cons(%2102, %2101) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2104 = arith.addi %2103, %__rlasp_stack_elide_zero_122 : i64
      %2105 = func.call @stack_pop_pointer() : () -> i64
      %2106 = func.call @cc_cons(%2105, %2104) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2107 = arith.addi %2106, %__rlasp_stack_elide_zero_123 : i64
      %2108 = func.call @stack_pop_pointer() : () -> i64
      %2109 = func.call @cc_cons(%2108, %2107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2109) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2110 = func.call @stack_pop_pointer() : () -> i64
      %2111 = func.call @stack_pop_pointer() : () -> i64
      %2112 = func.call @cc_cons(%2111, %2110) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2113 = arith.addi %2112, %__rlasp_stack_elide_zero_124 : i64
      %2114 = func.call @stack_pop_pointer() : () -> i64
      %2115 = func.call @cc_cons(%2114, %2113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2116 = func.call @stack_pop_pointer() : () -> i64
      %2117 = func.call @stack_pop_pointer() : () -> i64
      %2118 = func.call @cc_cons(%2117, %2116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2119 = arith.addi %2118, %__rlasp_stack_elide_zero_125 : i64
      %2120 = func.call @stack_pop_pointer() : () -> i64
      %2121 = func.call @cc_cons(%2120, %2119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2122 = arith.addi %2121, %__rlasp_stack_elide_zero_126 : i64
      %2123 = func.call @stack_pop_pointer() : () -> i64
      %2124 = func.call @cc_cons(%2123, %2122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2125 = arith.addi %2124, %__rlasp_stack_elide_zero_127 : i64
      %2126 = func.call @stack_pop_pointer() : () -> i64
      %2127 = func.call @cc_cons(%2126, %2125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2127) : (i64) -> ()
      %2128 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2129 = arith.constant 4 : i64
      %2130 = func.call @cc_make_string(%2128, %2129) : (!llvm.ptr, i64) -> i64
      %2131 = func.call @cc_nil_value() : () -> i64
      %2132 = func.call @cc_intern(%2130, %2131) : (i64, i64) -> i64
      %2133 = func.call @cc_nil_value() : () -> i64
      %2134 = func.call @cc_cons(%2132, %2133) : (i64, i64) -> i64
      %2135 = func.call @cc_values_pack(%2134) : (i64) -> i64
      func.call @stack_push_pointer(%2132) : (i64) -> ()
      %2136 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2137 = arith.constant 1 : i64
      %2138 = func.call @cc_make_string(%2136, %2137) : (!llvm.ptr, i64) -> i64
      %2139 = func.call @cc_nil_value() : () -> i64
      %2140 = func.call @cc_intern(%2138, %2139) : (i64, i64) -> i64
      %2141 = func.call @cc_nil_value() : () -> i64
      %2142 = func.call @cc_cons(%2140, %2141) : (i64, i64) -> i64
      %2143 = func.call @cc_values_pack(%2142) : (i64) -> i64
      func.call @stack_push_pointer(%2140) : (i64) -> ()
      %2144 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2145 = arith.constant 1 : i64
      %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
      %2147 = func.call @cc_nil_value() : () -> i64
      %2148 = func.call @cc_intern(%2146, %2147) : (i64, i64) -> i64
      %2149 = func.call @cc_nil_value() : () -> i64
      %2150 = func.call @cc_cons(%2148, %2149) : (i64, i64) -> i64
      %2151 = func.call @cc_values_pack(%2150) : (i64) -> i64
      func.call @stack_push_pointer(%2148) : (i64) -> ()
      %2152 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2153 = arith.constant 1 : i64
      %2154 = func.call @cc_make_string(%2152, %2153) : (!llvm.ptr, i64) -> i64
      %2155 = func.call @cc_nil_value() : () -> i64
      %2156 = func.call @cc_intern(%2154, %2155) : (i64, i64) -> i64
      %2157 = func.call @cc_nil_value() : () -> i64
      %2158 = func.call @cc_cons(%2156, %2157) : (i64, i64) -> i64
      %2159 = func.call @cc_values_pack(%2158) : (i64) -> i64
      func.call @stack_push_pointer(%2156) : (i64) -> ()
      %2160 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2161 = func.call @stack_pop_pointer() : () -> i64
      %2162 = func.call @stack_pop_pointer() : () -> i64
      %2163 = func.call @cc_cons(%2162, %2161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2164 = arith.addi %2163, %__rlasp_stack_elide_zero_128 : i64
      %2165 = func.call @stack_pop_pointer() : () -> i64
      %2166 = func.call @cc_cons(%2165, %2164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2167 = arith.addi %2166, %__rlasp_stack_elide_zero_129 : i64
      %2168 = func.call @stack_pop_pointer() : () -> i64
      %2169 = func.call @cc_cons(%2168, %2167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2169) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2170 = func.call @stack_pop_pointer() : () -> i64
      %2171 = func.call @stack_pop_pointer() : () -> i64
      %2172 = func.call @cc_cons(%2171, %2170) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2173 = arith.addi %2172, %__rlasp_stack_elide_zero_130 : i64
      %2174 = func.call @stack_pop_pointer() : () -> i64
      %2175 = func.call @cc_cons(%2174, %2173) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2176 = arith.addi %2175, %__rlasp_stack_elide_zero_131 : i64
      %2177 = func.call @stack_pop_pointer() : () -> i64
      %2178 = func.call @cc_cons(%2177, %2176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2178) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2179 = func.call @stack_pop_pointer() : () -> i64
      %2180 = func.call @stack_pop_pointer() : () -> i64
      %2181 = func.call @cc_cons(%2180, %2179) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2182 = arith.addi %2181, %__rlasp_stack_elide_zero_132 : i64
      %2183 = func.call @stack_pop_pointer() : () -> i64
      %2184 = func.call @cc_cons(%2183, %2182) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2185 = arith.addi %2184, %__rlasp_stack_elide_zero_133 : i64
      %2186 = func.call @stack_pop_pointer() : () -> i64
      %2187 = func.call @cc_cons(%2186, %2185) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2188 = arith.addi %2187, %__rlasp_stack_elide_zero_134 : i64
      %2189 = func.call @stack_pop_pointer() : () -> i64
      %2190 = func.call @cc_cons(%2189, %2188) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2191 = arith.addi %2190, %__rlasp_stack_elide_zero_135 : i64
      %2192 = func.call @stack_pop_pointer() : () -> i64
      %2193 = func.call @cc_cons(%2192, %2191) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2194 = arith.addi %2193, %__rlasp_stack_elide_zero_136 : i64
      %2195 = func.call @stack_pop_pointer() : () -> i64
      %2196 = func.call @cc_cons(%2195, %2194) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2197 = arith.addi %2196, %__rlasp_stack_elide_zero_137 : i64
      %2198 = func.call @stack_pop_pointer() : () -> i64
      %2199 = func.call @cc_cons(%2198, %2197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2199) : (i64) -> ()
      %2200 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2201 = arith.constant 2 : i64
      %2202 = func.call @cc_make_string(%2200, %2201) : (!llvm.ptr, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_intern(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_nil_value() : () -> i64
      %2206 = func.call @cc_cons(%2204, %2205) : (i64, i64) -> i64
      %2207 = func.call @cc_values_pack(%2206) : (i64) -> i64
      func.call @stack_push_pointer(%2204) : (i64) -> ()
      %2208 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2209 = arith.constant 17 : i64
      %2210 = func.call @cc_make_string(%2208, %2209) : (!llvm.ptr, i64) -> i64
      %2211 = func.call @cc_nil_value() : () -> i64
      %2212 = func.call @cc_intern(%2210, %2211) : (i64, i64) -> i64
      %2213 = func.call @cc_nil_value() : () -> i64
      %2214 = func.call @cc_cons(%2212, %2213) : (i64, i64) -> i64
      %2215 = func.call @cc_values_pack(%2214) : (i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      %2216 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2217 = arith.constant 5 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = func.call @cc_nil_value() : () -> i64
      %2220 = func.call @cc_intern(%2218, %2219) : (i64, i64) -> i64
      %2221 = func.call @cc_nil_value() : () -> i64
      %2222 = func.call @cc_cons(%2220, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_values_pack(%2222) : (i64) -> i64
      func.call @stack_push_pointer(%2220) : (i64) -> ()
      %2224 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2225 = arith.constant 4 : i64
      %2226 = func.call @cc_make_string(%2224, %2225) : (!llvm.ptr, i64) -> i64
      %2227 = func.call @cc_nil_value() : () -> i64
      %2228 = func.call @cc_intern(%2226, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_nil_value() : () -> i64
      %2230 = func.call @cc_cons(%2228, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_values_pack(%2230) : (i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      %2232 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2233 = arith.constant 1 : i64
      %2234 = func.call @cc_make_string(%2232, %2233) : (!llvm.ptr, i64) -> i64
      %2235 = func.call @cc_nil_value() : () -> i64
      %2236 = func.call @cc_intern(%2234, %2235) : (i64, i64) -> i64
      %2237 = func.call @cc_nil_value() : () -> i64
      %2238 = func.call @cc_cons(%2236, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_values_pack(%2238) : (i64) -> i64
      func.call @stack_push_pointer(%2236) : (i64) -> ()
      %2240 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2241 = arith.constant 19 : i64
      %2242 = func.call @cc_make_string(%2240, %2241) : (!llvm.ptr, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_intern(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_nil_value() : () -> i64
      %2246 = func.call @cc_cons(%2244, %2245) : (i64, i64) -> i64
      %2247 = func.call @cc_values_pack(%2246) : (i64) -> i64
      func.call @stack_push_pointer(%2244) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2248 = func.call @stack_pop_pointer() : () -> i64
      %2249 = func.call @stack_pop_pointer() : () -> i64
      %2250 = func.call @cc_cons(%2249, %2248) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2251 = arith.addi %2250, %__rlasp_stack_elide_zero_138 : i64
      %2252 = func.call @stack_pop_pointer() : () -> i64
      %2253 = func.call @cc_cons(%2252, %2251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2254 = arith.addi %2253, %__rlasp_stack_elide_zero_139 : i64
      %2255 = func.call @stack_pop_pointer() : () -> i64
      %2256 = func.call @cc_cons(%2255, %2254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2256) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2257 = func.call @stack_pop_pointer() : () -> i64
      %2258 = func.call @stack_pop_pointer() : () -> i64
      %2259 = func.call @cc_cons(%2258, %2257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2260 = arith.addi %2259, %__rlasp_stack_elide_zero_140 : i64
      %2261 = func.call @stack_pop_pointer() : () -> i64
      %2262 = func.call @cc_cons(%2261, %2260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2263 = func.call @stack_pop_pointer() : () -> i64
      %2264 = func.call @stack_pop_pointer() : () -> i64
      %2265 = func.call @cc_cons(%2264, %2263) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2266 = arith.addi %2265, %__rlasp_stack_elide_zero_141 : i64
      %2267 = func.call @stack_pop_pointer() : () -> i64
      %2268 = func.call @cc_cons(%2267, %2266) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2269 = arith.addi %2268, %__rlasp_stack_elide_zero_142 : i64
      %2270 = func.call @stack_pop_pointer() : () -> i64
      %2271 = func.call @cc_cons(%2270, %2269) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2272 = arith.addi %2271, %__rlasp_stack_elide_zero_143 : i64
      %2273 = func.call @stack_pop_pointer() : () -> i64
      %2274 = func.call @cc_cons(%2273, %2272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2274) : (i64) -> ()
      %2275 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2276 = arith.constant 15 : i64
      %2277 = func.call @cc_make_string(%2275, %2276) : (!llvm.ptr, i64) -> i64
      %2278 = func.call @cc_nil_value() : () -> i64
      %2279 = func.call @cc_intern(%2277, %2278) : (i64, i64) -> i64
      %2280 = func.call @cc_nil_value() : () -> i64
      %2281 = func.call @cc_cons(%2279, %2280) : (i64, i64) -> i64
      %2282 = func.call @cc_values_pack(%2281) : (i64) -> i64
      func.call @stack_push_pointer(%2279) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2283 = func.call @stack_pop_pointer() : () -> i64
      %2284 = func.call @stack_pop_pointer() : () -> i64
      %2285 = func.call @cc_cons(%2284, %2283) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2286 = arith.addi %2285, %__rlasp_stack_elide_zero_144 : i64
      %2287 = func.call @stack_pop_pointer() : () -> i64
      %2288 = func.call @cc_cons(%2287, %2286) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2289 = arith.addi %2288, %__rlasp_stack_elide_zero_145 : i64
      %2290 = func.call @stack_pop_pointer() : () -> i64
      %2291 = func.call @cc_cons(%2290, %2289) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2292 = arith.addi %2291, %__rlasp_stack_elide_zero_146 : i64
      %2293 = func.call @stack_pop_pointer() : () -> i64
      %2294 = func.call @cc_cons(%2293, %2292) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2295 = arith.addi %2294, %__rlasp_stack_elide_zero_147 : i64
      %2296 = func.call @stack_pop_pointer() : () -> i64
      %2297 = func.call @cc_cons(%2296, %2295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2297) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @stack_pop_pointer() : () -> i64
      %2300 = func.call @cc_cons(%2299, %2298) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2301 = arith.addi %2300, %__rlasp_stack_elide_zero_148 : i64
      %2302 = func.call @stack_pop_pointer() : () -> i64
      %2303 = func.call @cc_cons(%2302, %2301) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %2304 = arith.addi %2303, %__rlasp_stack_elide_zero_149 : i64
      %2305 = func.call @stack_pop_pointer() : () -> i64
      %2306 = func.call @cc_cons(%2305, %2304) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %2307 = arith.addi %2306, %__rlasp_stack_elide_zero_150 : i64
      %2606 = arith.constant 271595545296901 : i64
      %2607 = arith.constant 0 : i64
      %2608 = func.call @cc_make_closure(%2606, %2607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %2609 = arith.addi %2608, %__rlasp_stack_elide_zero_151 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @cc_cons(%2611, %2610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %2613 = arith.addi %2612, %__rlasp_stack_elide_zero_152 : i64
      %2614 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2615 = arith.constant 11 : i64
      %2616 = func.call @cc_make_string(%2614, %2615) : (!llvm.ptr, i64) -> i64
      %2617 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2618 = arith.constant 7 : i64
      %2619 = func.call @cc_make_string(%2617, %2618) : (!llvm.ptr, i64) -> i64
      %2620 = func.call @cc_intern(%2616, %2619) : (i64, i64) -> i64
      %2621 = func.call @cc_nil_value() : () -> i64
      %2622 = func.call @cc_cons(%2620, %2621) : (i64, i64) -> i64
      %2623 = func.call @cc_values_pack(%2622) : (i64) -> i64
      %2624 = func.call @cc_nil_value() : () -> i64
      %2625 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2626 = arith.constant 4 : i64
      %2627 = func.call @cc_make_string(%2625, %2626) : (!llvm.ptr, i64) -> i64
      %2628 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2629 = arith.constant 7 : i64
      %2630 = func.call @cc_make_string(%2628, %2629) : (!llvm.ptr, i64) -> i64
      %2631 = func.call @cc_intern(%2627, %2630) : (i64, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_cons(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_values_pack(%2633) : (i64) -> i64
      %2635 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2636 = arith.constant 6 : i64
      %2637 = func.call @cc_make_string(%2635, %2636) : (!llvm.ptr, i64) -> i64
      %2638 = func.call @cc_nil_value() : () -> i64
      %2639 = func.call @cc_intern(%2637, %2638) : (i64, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_cons(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_values_pack(%2641) : (i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %2643 = arith.addi %2639, %__rlasp_stack_elide_zero_153 : i64
      %2644 = func.call @cc_nil_value() : () -> i64
      %2645 = func.call @cc_errorp(%1607) : (i64) -> i64
      %2646 = arith.cmpi ne, %2645, %2644 : i64
      %2647 = arith.cmpi eq, %2644, %2644 : i64
      %2648 = arith.andi %2646, %2647 : i1
      %2649 = scf.if %2648 -> (i64) {
        scf.yield %1607 : i64
      } else {
        scf.yield %2644 : i64
      }
      %2650 = func.call @cc_errorp(%2307) : (i64) -> i64
      %2651 = arith.cmpi ne, %2650, %2644 : i64
      %2652 = arith.cmpi eq, %2649, %2644 : i64
      %2653 = arith.andi %2651, %2652 : i1
      %2654 = scf.if %2653 -> (i64) {
        scf.yield %2307 : i64
      } else {
        scf.yield %2649 : i64
      }
      %2655 = func.call @cc_errorp(%2609) : (i64) -> i64
      %2656 = arith.cmpi ne, %2655, %2644 : i64
      %2657 = arith.cmpi eq, %2654, %2644 : i64
      %2658 = arith.andi %2656, %2657 : i1
      %2659 = scf.if %2658 -> (i64) {
        scf.yield %2609 : i64
      } else {
        scf.yield %2654 : i64
      }
      %2660 = func.call @cc_errorp(%2613) : (i64) -> i64
      %2661 = arith.cmpi ne, %2660, %2644 : i64
      %2662 = arith.cmpi eq, %2659, %2644 : i64
      %2663 = arith.andi %2661, %2662 : i1
      %2664 = scf.if %2663 -> (i64) {
        scf.yield %2613 : i64
      } else {
        scf.yield %2659 : i64
      }
      %2665 = func.call @cc_errorp(%2620) : (i64) -> i64
      %2666 = arith.cmpi ne, %2665, %2644 : i64
      %2667 = arith.cmpi eq, %2664, %2644 : i64
      %2668 = arith.andi %2666, %2667 : i1
      %2669 = scf.if %2668 -> (i64) {
        scf.yield %2620 : i64
      } else {
        scf.yield %2664 : i64
      }
      %2670 = func.call @cc_errorp(%2624) : (i64) -> i64
      %2671 = arith.cmpi ne, %2670, %2644 : i64
      %2672 = arith.cmpi eq, %2669, %2644 : i64
      %2673 = arith.andi %2671, %2672 : i1
      %2674 = scf.if %2673 -> (i64) {
        scf.yield %2624 : i64
      } else {
        scf.yield %2669 : i64
      }
      %2675 = func.call @cc_errorp(%2631) : (i64) -> i64
      %2676 = arith.cmpi ne, %2675, %2644 : i64
      %2677 = arith.cmpi eq, %2674, %2644 : i64
      %2678 = arith.andi %2676, %2677 : i1
      %2679 = scf.if %2678 -> (i64) {
        scf.yield %2631 : i64
      } else {
        scf.yield %2674 : i64
      }
      %2680 = func.call @cc_errorp(%2643) : (i64) -> i64
      %2681 = arith.cmpi ne, %2680, %2644 : i64
      %2682 = arith.cmpi eq, %2679, %2644 : i64
      %2683 = arith.andi %2681, %2682 : i1
      %2684 = scf.if %2683 -> (i64) {
        scf.yield %2643 : i64
      } else {
        scf.yield %2679 : i64
      }
      %2685 = arith.cmpi ne, %2684, %2644 : i64
      scf.if %2685 {
        func.call @stack_push_pointer(%2684) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1607) : (i64) -> ()
        func.call @stack_push_pointer(%2307) : (i64) -> ()
        func.call @stack_push_pointer(%2609) : (i64) -> ()
        func.call @stack_push_pointer(%2613) : (i64) -> ()
        func.call @stack_push_pointer(%2620) : (i64) -> ()
        func.call @stack_push_pointer(%2624) : (i64) -> ()
        func.call @stack_push_pointer(%2631) : (i64) -> ()
        func.call @stack_push_pointer(%2643) : (i64) -> ()
        %2686 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2687 = func.call @cc_make_function_ref_const(%2686) : (!llvm.ptr) -> i64
        %2688 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2687, %2688) : (i64, i64) -> ()
      }
      %2689 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2689 : i64
    }
    %2690 = func.call @cc_nil_value() : () -> i64
    %2691 = func.call @cc_errorp(%1598) : (i64) -> i64
    %2692 = arith.cmpi ne, %2691, %2690 : i64
    %2693 = scf.if %2692 -> (i64) {
      scf.yield %1598 : i64
    } else {
      %2694 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2695 = arith.constant 15 : i64
      %2696 = func.call @cc_make_string(%2694, %2695) : (!llvm.ptr, i64) -> i64
      %2697 = func.call @cc_nil_value() : () -> i64
      %2698 = func.call @cc_intern(%2696, %2697) : (i64, i64) -> i64
      %2699 = func.call @cc_nil_value() : () -> i64
      %2700 = func.call @cc_cons(%2698, %2699) : (i64, i64) -> i64
      %2701 = func.call @cc_values_pack(%2700) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %2702 = arith.addi %2698, %__rlasp_stack_elide_zero_154 : i64
      %2703 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2704 = arith.constant 4 : i64
      %2705 = func.call @cc_make_string(%2703, %2704) : (!llvm.ptr, i64) -> i64
      %2706 = func.call @cc_nil_value() : () -> i64
      %2707 = func.call @cc_intern(%2705, %2706) : (i64, i64) -> i64
      %2708 = func.call @cc_nil_value() : () -> i64
      %2709 = func.call @cc_cons(%2707, %2708) : (i64, i64) -> i64
      %2710 = func.call @cc_values_pack(%2709) : (i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      %2711 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2712 = arith.constant 1 : i64
      %2713 = func.call @cc_make_string(%2711, %2712) : (!llvm.ptr, i64) -> i64
      %2714 = func.call @cc_nil_value() : () -> i64
      %2715 = func.call @cc_intern(%2713, %2714) : (i64, i64) -> i64
      %2716 = func.call @cc_nil_value() : () -> i64
      %2717 = func.call @cc_cons(%2715, %2716) : (i64, i64) -> i64
      %2718 = func.call @cc_values_pack(%2717) : (i64) -> i64
      func.call @stack_push_pointer(%2715) : (i64) -> ()
      %2719 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2720 = func.call @stack_pop_pointer() : () -> i64
      %2721 = func.call @stack_pop_pointer() : () -> i64
      %2722 = func.call @cc_cons(%2721, %2720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %2723 = arith.addi %2722, %__rlasp_stack_elide_zero_155 : i64
      %2724 = func.call @stack_pop_pointer() : () -> i64
      %2725 = func.call @cc_cons(%2724, %2723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2725) : (i64) -> ()
      %2726 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2727 = arith.constant 19 : i64
      %2728 = func.call @cc_make_string(%2726, %2727) : (!llvm.ptr, i64) -> i64
      %2729 = func.call @cc_nil_value() : () -> i64
      %2730 = func.call @cc_intern(%2728, %2729) : (i64, i64) -> i64
      %2731 = func.call @cc_nil_value() : () -> i64
      %2732 = func.call @cc_cons(%2730, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_values_pack(%2732) : (i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @cc_cons(%2735, %2734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %2737 = arith.addi %2736, %__rlasp_stack_elide_zero_156 : i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      %2740 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2741 = arith.constant 1 : i64
      %2742 = func.call @cc_make_string(%2740, %2741) : (!llvm.ptr, i64) -> i64
      %2743 = func.call @cc_nil_value() : () -> i64
      %2744 = func.call @cc_intern(%2742, %2743) : (i64, i64) -> i64
      %2745 = func.call @cc_nil_value() : () -> i64
      %2746 = func.call @cc_cons(%2744, %2745) : (i64, i64) -> i64
      %2747 = func.call @cc_values_pack(%2746) : (i64) -> i64
      func.call @stack_push_pointer(%2744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2748 = func.call @stack_pop_pointer() : () -> i64
      %2749 = func.call @stack_pop_pointer() : () -> i64
      %2750 = func.call @cc_cons(%2749, %2748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %2751 = arith.addi %2750, %__rlasp_stack_elide_zero_157 : i64
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2753 = func.call @cc_cons(%2752, %2751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2753) : (i64) -> ()
      %2754 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2755 = arith.constant 15 : i64
      %2756 = func.call @cc_make_string(%2754, %2755) : (!llvm.ptr, i64) -> i64
      %2757 = func.call @cc_nil_value() : () -> i64
      %2758 = func.call @cc_intern(%2756, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_nil_value() : () -> i64
      %2760 = func.call @cc_cons(%2758, %2759) : (i64, i64) -> i64
      %2761 = func.call @cc_values_pack(%2760) : (i64) -> i64
      func.call @stack_push_pointer(%2758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @stack_pop_pointer() : () -> i64
      %2764 = func.call @cc_cons(%2763, %2762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %2765 = arith.addi %2764, %__rlasp_stack_elide_zero_158 : i64
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @cc_cons(%2766, %2765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2767) : (i64) -> ()
      %2768 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2769 = arith.constant 17 : i64
      %2770 = func.call @cc_make_string(%2768, %2769) : (!llvm.ptr, i64) -> i64
      %2771 = func.call @cc_nil_value() : () -> i64
      %2772 = func.call @cc_intern(%2770, %2771) : (i64, i64) -> i64
      %2773 = func.call @cc_nil_value() : () -> i64
      %2774 = func.call @cc_cons(%2772, %2773) : (i64, i64) -> i64
      %2775 = func.call @cc_values_pack(%2774) : (i64) -> i64
      func.call @stack_push_pointer(%2772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = func.call @cc_cons(%2777, %2776) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %2779 = arith.addi %2778, %__rlasp_stack_elide_zero_159 : i64
      %2780 = func.call @stack_pop_pointer() : () -> i64
      %2781 = func.call @cc_cons(%2780, %2779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2781) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2782 = func.call @stack_pop_pointer() : () -> i64
      %2783 = func.call @stack_pop_pointer() : () -> i64
      %2784 = func.call @cc_cons(%2783, %2782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %2785 = arith.addi %2784, %__rlasp_stack_elide_zero_160 : i64
      %2786 = func.call @stack_pop_pointer() : () -> i64
      %2787 = func.call @cc_cons(%2786, %2785) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %2788 = arith.addi %2787, %__rlasp_stack_elide_zero_161 : i64
      %2789 = func.call @stack_pop_pointer() : () -> i64
      %2790 = func.call @cc_cons(%2789, %2788) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %2791 = arith.addi %2790, %__rlasp_stack_elide_zero_162 : i64
      %2792 = func.call @stack_pop_pointer() : () -> i64
      %2793 = func.call @cc_cons(%2792, %2791) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %2794 = arith.addi %2793, %__rlasp_stack_elide_zero_163 : i64
      %2795 = func.call @stack_pop_pointer() : () -> i64
      %2796 = func.call @cc_cons(%2795, %2794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2796) : (i64) -> ()
      %2797 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2798 = arith.constant 5 : i64
      %2799 = func.call @cc_make_string(%2797, %2798) : (!llvm.ptr, i64) -> i64
      %2800 = func.call @cc_nil_value() : () -> i64
      %2801 = func.call @cc_intern(%2799, %2800) : (i64, i64) -> i64
      %2802 = func.call @cc_nil_value() : () -> i64
      %2803 = func.call @cc_cons(%2801, %2802) : (i64, i64) -> i64
      %2804 = func.call @cc_values_pack(%2803) : (i64) -> i64
      func.call @stack_push_pointer(%2801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2805 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2806 = arith.constant 5 : i64
      %2807 = func.call @cc_make_string(%2805, %2806) : (!llvm.ptr, i64) -> i64
      %2808 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2809 = arith.constant 3 : i64
      %2810 = func.call @cc_make_string(%2808, %2809) : (!llvm.ptr, i64) -> i64
      %2811 = func.call @cc_intern(%2807, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_nil_value() : () -> i64
      %2813 = func.call @cc_cons(%2811, %2812) : (i64, i64) -> i64
      %2814 = func.call @cc_values_pack(%2813) : (i64) -> i64
      func.call @stack_push_pointer(%2811) : (i64) -> ()
      %2815 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2816 = arith.constant 1 : i64
      %2817 = func.call @cc_make_string(%2815, %2816) : (!llvm.ptr, i64) -> i64
      %2818 = func.call @cc_nil_value() : () -> i64
      %2819 = func.call @cc_intern(%2817, %2818) : (i64, i64) -> i64
      %2820 = func.call @cc_nil_value() : () -> i64
      %2821 = func.call @cc_cons(%2819, %2820) : (i64, i64) -> i64
      %2822 = func.call @cc_values_pack(%2821) : (i64) -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      %2823 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2824 = arith.constant 1 : i64
      %2825 = func.call @cc_make_string(%2823, %2824) : (!llvm.ptr, i64) -> i64
      %2826 = func.call @cc_nil_value() : () -> i64
      %2827 = func.call @cc_intern(%2825, %2826) : (i64, i64) -> i64
      %2828 = func.call @cc_nil_value() : () -> i64
      %2829 = func.call @cc_cons(%2827, %2828) : (i64, i64) -> i64
      %2830 = func.call @cc_values_pack(%2829) : (i64) -> i64
      func.call @stack_push_pointer(%2827) : (i64) -> ()
      %2831 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2832 = arith.constant 15 : i64
      %2833 = func.call @cc_make_string(%2831, %2832) : (!llvm.ptr, i64) -> i64
      %2834 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2835 = arith.constant 11 : i64
      %2836 = func.call @cc_make_string(%2834, %2835) : (!llvm.ptr, i64) -> i64
      %2837 = func.call @cc_intern(%2833, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_nil_value() : () -> i64
      %2839 = func.call @cc_cons(%2837, %2838) : (i64, i64) -> i64
      %2840 = func.call @cc_values_pack(%2839) : (i64) -> i64
      func.call @stack_push_pointer(%2837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2841 = func.call @stack_pop_pointer() : () -> i64
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = func.call @cc_cons(%2842, %2841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %2844 = arith.addi %2843, %__rlasp_stack_elide_zero_164 : i64
      %2845 = func.call @stack_pop_pointer() : () -> i64
      %2846 = func.call @cc_cons(%2845, %2844) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %2847 = arith.addi %2846, %__rlasp_stack_elide_zero_165 : i64
      %2848 = func.call @stack_pop_pointer() : () -> i64
      %2849 = func.call @cc_cons(%2848, %2847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2849) : (i64) -> ()
      %2850 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2851 = arith.constant 4 : i64
      %2852 = func.call @cc_make_string(%2850, %2851) : (!llvm.ptr, i64) -> i64
      %2853 = func.call @cc_nil_value() : () -> i64
      %2854 = func.call @cc_intern(%2852, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_nil_value() : () -> i64
      %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
      %2857 = func.call @cc_values_pack(%2856) : (i64) -> i64
      func.call @stack_push_pointer(%2854) : (i64) -> ()
      %2858 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2859 = arith.constant 17 : i64
      %2860 = func.call @cc_make_string(%2858, %2859) : (!llvm.ptr, i64) -> i64
      %2861 = func.call @cc_nil_value() : () -> i64
      %2862 = func.call @cc_intern(%2860, %2861) : (i64, i64) -> i64
      %2863 = func.call @cc_nil_value() : () -> i64
      %2864 = func.call @cc_cons(%2862, %2863) : (i64, i64) -> i64
      %2865 = func.call @cc_values_pack(%2864) : (i64) -> i64
      func.call @stack_push_pointer(%2862) : (i64) -> ()
      %2866 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2866) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @stack_pop_pointer() : () -> i64
      %2869 = func.call @cc_cons(%2868, %2867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %2870 = arith.addi %2869, %__rlasp_stack_elide_zero_166 : i64
      %2871 = func.call @stack_pop_pointer() : () -> i64
      %2872 = func.call @cc_cons(%2871, %2870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %2873 = arith.addi %2872, %__rlasp_stack_elide_zero_167 : i64
      %2874 = func.call @stack_pop_pointer() : () -> i64
      %2875 = func.call @cc_cons(%2874, %2873) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2875) : (i64) -> ()
      %2876 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2877 = arith.constant 4 : i64
      %2878 = func.call @cc_make_string(%2876, %2877) : (!llvm.ptr, i64) -> i64
      %2879 = func.call @cc_nil_value() : () -> i64
      %2880 = func.call @cc_intern(%2878, %2879) : (i64, i64) -> i64
      %2881 = func.call @cc_nil_value() : () -> i64
      %2882 = func.call @cc_cons(%2880, %2881) : (i64, i64) -> i64
      %2883 = func.call @cc_values_pack(%2882) : (i64) -> i64
      func.call @stack_push_pointer(%2880) : (i64) -> ()
      %2884 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2885 = arith.constant 19 : i64
      %2886 = func.call @cc_make_string(%2884, %2885) : (!llvm.ptr, i64) -> i64
      %2887 = func.call @cc_nil_value() : () -> i64
      %2888 = func.call @cc_intern(%2886, %2887) : (i64, i64) -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = func.call @cc_cons(%2888, %2889) : (i64, i64) -> i64
      %2891 = func.call @cc_values_pack(%2890) : (i64) -> i64
      func.call @stack_push_pointer(%2888) : (i64) -> ()
      %2892 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2893 = arith.constant 1 : i64
      %2894 = func.call @cc_make_string(%2892, %2893) : (!llvm.ptr, i64) -> i64
      %2895 = func.call @cc_nil_value() : () -> i64
      %2896 = func.call @cc_intern(%2894, %2895) : (i64, i64) -> i64
      %2897 = func.call @cc_nil_value() : () -> i64
      %2898 = func.call @cc_cons(%2896, %2897) : (i64, i64) -> i64
      %2899 = func.call @cc_values_pack(%2898) : (i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2900 = func.call @stack_pop_pointer() : () -> i64
      %2901 = func.call @stack_pop_pointer() : () -> i64
      %2902 = func.call @cc_cons(%2901, %2900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %2903 = arith.addi %2902, %__rlasp_stack_elide_zero_168 : i64
      %2904 = func.call @stack_pop_pointer() : () -> i64
      %2905 = func.call @cc_cons(%2904, %2903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %2906 = arith.addi %2905, %__rlasp_stack_elide_zero_169 : i64
      %2907 = func.call @stack_pop_pointer() : () -> i64
      %2908 = func.call @cc_cons(%2907, %2906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2908) : (i64) -> ()
      %2909 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2910 = arith.constant 4 : i64
      %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
      %2912 = func.call @cc_nil_value() : () -> i64
      %2913 = func.call @cc_intern(%2911, %2912) : (i64, i64) -> i64
      %2914 = func.call @cc_nil_value() : () -> i64
      %2915 = func.call @cc_cons(%2913, %2914) : (i64, i64) -> i64
      %2916 = func.call @cc_values_pack(%2915) : (i64) -> i64
      func.call @stack_push_pointer(%2913) : (i64) -> ()
      %2917 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2918 = arith.constant 1 : i64
      %2919 = func.call @cc_make_string(%2917, %2918) : (!llvm.ptr, i64) -> i64
      %2920 = func.call @cc_nil_value() : () -> i64
      %2921 = func.call @cc_intern(%2919, %2920) : (i64, i64) -> i64
      %2922 = func.call @cc_nil_value() : () -> i64
      %2923 = func.call @cc_cons(%2921, %2922) : (i64, i64) -> i64
      %2924 = func.call @cc_values_pack(%2923) : (i64) -> i64
      func.call @stack_push_pointer(%2921) : (i64) -> ()
      %2925 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2926 = arith.constant 9 : i64
      %2927 = func.call @cc_make_string(%2925, %2926) : (!llvm.ptr, i64) -> i64
      %2928 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2929 = arith.constant 11 : i64
      %2930 = func.call @cc_make_string(%2928, %2929) : (!llvm.ptr, i64) -> i64
      %2931 = func.call @cc_intern(%2927, %2930) : (i64, i64) -> i64
      %2932 = func.call @cc_nil_value() : () -> i64
      %2933 = func.call @cc_cons(%2931, %2932) : (i64, i64) -> i64
      %2934 = func.call @cc_values_pack(%2933) : (i64) -> i64
      func.call @stack_push_pointer(%2931) : (i64) -> ()
      %2935 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2936 = arith.constant 1 : i64
      %2937 = func.call @cc_make_string(%2935, %2936) : (!llvm.ptr, i64) -> i64
      %2938 = func.call @cc_nil_value() : () -> i64
      %2939 = func.call @cc_intern(%2937, %2938) : (i64, i64) -> i64
      %2940 = func.call @cc_nil_value() : () -> i64
      %2941 = func.call @cc_cons(%2939, %2940) : (i64, i64) -> i64
      %2942 = func.call @cc_values_pack(%2941) : (i64) -> i64
      func.call @stack_push_pointer(%2939) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2943 = func.call @stack_pop_pointer() : () -> i64
      %2944 = func.call @stack_pop_pointer() : () -> i64
      %2945 = func.call @cc_cons(%2944, %2943) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %2946 = arith.addi %2945, %__rlasp_stack_elide_zero_170 : i64
      %2947 = func.call @stack_pop_pointer() : () -> i64
      %2948 = func.call @cc_cons(%2947, %2946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2948) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2949 = func.call @stack_pop_pointer() : () -> i64
      %2950 = func.call @stack_pop_pointer() : () -> i64
      %2951 = func.call @cc_cons(%2950, %2949) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %2952 = arith.addi %2951, %__rlasp_stack_elide_zero_171 : i64
      %2953 = func.call @stack_pop_pointer() : () -> i64
      %2954 = func.call @cc_cons(%2953, %2952) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %2955 = arith.addi %2954, %__rlasp_stack_elide_zero_172 : i64
      %2956 = func.call @stack_pop_pointer() : () -> i64
      %2957 = func.call @cc_cons(%2956, %2955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2957) : (i64) -> ()
      %2958 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2959 = arith.constant 2 : i64
      %2960 = func.call @cc_make_string(%2958, %2959) : (!llvm.ptr, i64) -> i64
      %2961 = func.call @cc_nil_value() : () -> i64
      %2962 = func.call @cc_intern(%2960, %2961) : (i64, i64) -> i64
      %2963 = func.call @cc_nil_value() : () -> i64
      %2964 = func.call @cc_cons(%2962, %2963) : (i64, i64) -> i64
      %2965 = func.call @cc_values_pack(%2964) : (i64) -> i64
      func.call @stack_push_pointer(%2962) : (i64) -> ()
      %2966 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2967 = arith.constant 3 : i64
      %2968 = func.call @cc_make_string(%2966, %2967) : (!llvm.ptr, i64) -> i64
      %2969 = func.call @cc_nil_value() : () -> i64
      %2970 = func.call @cc_intern(%2968, %2969) : (i64, i64) -> i64
      %2971 = func.call @cc_nil_value() : () -> i64
      %2972 = func.call @cc_cons(%2970, %2971) : (i64, i64) -> i64
      %2973 = func.call @cc_values_pack(%2972) : (i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      %2974 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2975 = arith.constant 2 : i64
      %2976 = func.call @cc_make_string(%2974, %2975) : (!llvm.ptr, i64) -> i64
      %2977 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2978 = arith.constant 11 : i64
      %2979 = func.call @cc_make_string(%2977, %2978) : (!llvm.ptr, i64) -> i64
      %2980 = func.call @cc_intern(%2976, %2979) : (i64, i64) -> i64
      %2981 = func.call @cc_nil_value() : () -> i64
      %2982 = func.call @cc_cons(%2980, %2981) : (i64, i64) -> i64
      %2983 = func.call @cc_values_pack(%2982) : (i64) -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      %2984 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2985 = arith.constant 3 : i64
      %2986 = func.call @cc_make_string(%2984, %2985) : (!llvm.ptr, i64) -> i64
      %2987 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2988 = arith.constant 11 : i64
      %2989 = func.call @cc_make_string(%2987, %2988) : (!llvm.ptr, i64) -> i64
      %2990 = func.call @cc_intern(%2986, %2989) : (i64, i64) -> i64
      %2991 = func.call @cc_nil_value() : () -> i64
      %2992 = func.call @cc_cons(%2990, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_values_pack(%2992) : (i64) -> i64
      func.call @stack_push_pointer(%2990) : (i64) -> ()
      %2994 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2995 = arith.constant 1 : i64
      %2996 = func.call @cc_make_string(%2994, %2995) : (!llvm.ptr, i64) -> i64
      %2997 = func.call @cc_nil_value() : () -> i64
      %2998 = func.call @cc_intern(%2996, %2997) : (i64, i64) -> i64
      %2999 = func.call @cc_nil_value() : () -> i64
      %3000 = func.call @cc_cons(%2998, %2999) : (i64, i64) -> i64
      %3001 = func.call @cc_values_pack(%3000) : (i64) -> i64
      func.call @stack_push_pointer(%2998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3002 = func.call @stack_pop_pointer() : () -> i64
      %3003 = func.call @stack_pop_pointer() : () -> i64
      %3004 = func.call @cc_cons(%3003, %3002) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3005 = arith.addi %3004, %__rlasp_stack_elide_zero_173 : i64
      %3006 = func.call @stack_pop_pointer() : () -> i64
      %3007 = func.call @cc_cons(%3006, %3005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3007) : (i64) -> ()
      %3008 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3009 = arith.constant 3 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = func.call @cc_nil_value() : () -> i64
      %3012 = func.call @cc_intern(%3010, %3011) : (i64, i64) -> i64
      %3013 = func.call @cc_nil_value() : () -> i64
      %3014 = func.call @cc_cons(%3012, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_values_pack(%3014) : (i64) -> i64
      func.call @stack_push_pointer(%3012) : (i64) -> ()
      %3016 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3017 = arith.constant 1 : i64
      %3018 = func.call @cc_make_string(%3016, %3017) : (!llvm.ptr, i64) -> i64
      %3019 = func.call @cc_nil_value() : () -> i64
      %3020 = func.call @cc_intern(%3018, %3019) : (i64, i64) -> i64
      %3021 = func.call @cc_nil_value() : () -> i64
      %3022 = func.call @cc_cons(%3020, %3021) : (i64, i64) -> i64
      %3023 = func.call @cc_values_pack(%3022) : (i64) -> i64
      func.call @stack_push_pointer(%3020) : (i64) -> ()
      %3024 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3025 = arith.constant 13 : i64
      %3026 = func.call @cc_make_string(%3024, %3025) : (!llvm.ptr, i64) -> i64
      %3027 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3028 = arith.constant 11 : i64
      %3029 = func.call @cc_make_string(%3027, %3028) : (!llvm.ptr, i64) -> i64
      %3030 = func.call @cc_intern(%3026, %3029) : (i64, i64) -> i64
      %3031 = func.call @cc_nil_value() : () -> i64
      %3032 = func.call @cc_cons(%3030, %3031) : (i64, i64) -> i64
      %3033 = func.call @cc_values_pack(%3032) : (i64) -> i64
      func.call @stack_push_pointer(%3030) : (i64) -> ()
      %3034 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3035 = arith.constant 1 : i64
      %3036 = func.call @cc_make_string(%3034, %3035) : (!llvm.ptr, i64) -> i64
      %3037 = func.call @cc_nil_value() : () -> i64
      %3038 = func.call @cc_intern(%3036, %3037) : (i64, i64) -> i64
      %3039 = func.call @cc_nil_value() : () -> i64
      %3040 = func.call @cc_cons(%3038, %3039) : (i64, i64) -> i64
      %3041 = func.call @cc_values_pack(%3040) : (i64) -> i64
      func.call @stack_push_pointer(%3038) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3042 = func.call @stack_pop_pointer() : () -> i64
      %3043 = func.call @stack_pop_pointer() : () -> i64
      %3044 = func.call @cc_cons(%3043, %3042) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3045 = arith.addi %3044, %__rlasp_stack_elide_zero_174 : i64
      %3046 = func.call @stack_pop_pointer() : () -> i64
      %3047 = func.call @cc_cons(%3046, %3045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3047) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3048 = func.call @stack_pop_pointer() : () -> i64
      %3049 = func.call @stack_pop_pointer() : () -> i64
      %3050 = func.call @cc_cons(%3049, %3048) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3051 = arith.addi %3050, %__rlasp_stack_elide_zero_175 : i64
      %3052 = func.call @stack_pop_pointer() : () -> i64
      %3053 = func.call @cc_cons(%3052, %3051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3053) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3054 = func.call @stack_pop_pointer() : () -> i64
      %3055 = func.call @stack_pop_pointer() : () -> i64
      %3056 = func.call @cc_cons(%3055, %3054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3056) : (i64) -> ()
      %3057 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3058 = arith.constant 3 : i64
      %3059 = func.call @cc_make_string(%3057, %3058) : (!llvm.ptr, i64) -> i64
      %3060 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3061 = arith.constant 11 : i64
      %3062 = func.call @cc_make_string(%3060, %3061) : (!llvm.ptr, i64) -> i64
      %3063 = func.call @cc_intern(%3059, %3062) : (i64, i64) -> i64
      %3064 = func.call @cc_nil_value() : () -> i64
      %3065 = func.call @cc_cons(%3063, %3064) : (i64, i64) -> i64
      %3066 = func.call @cc_values_pack(%3065) : (i64) -> i64
      func.call @stack_push_pointer(%3063) : (i64) -> ()
      %3067 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3068 = arith.constant 2 : i64
      %3069 = func.call @cc_make_string(%3067, %3068) : (!llvm.ptr, i64) -> i64
      %3070 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3071 = arith.constant 11 : i64
      %3072 = func.call @cc_make_string(%3070, %3071) : (!llvm.ptr, i64) -> i64
      %3073 = func.call @cc_intern(%3069, %3072) : (i64, i64) -> i64
      %3074 = func.call @cc_nil_value() : () -> i64
      %3075 = func.call @cc_cons(%3073, %3074) : (i64, i64) -> i64
      %3076 = func.call @cc_values_pack(%3075) : (i64) -> i64
      func.call @stack_push_pointer(%3073) : (i64) -> ()
      %3077 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3078 = arith.constant 12 : i64
      %3079 = func.call @cc_make_string(%3077, %3078) : (!llvm.ptr, i64) -> i64
      %3080 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3081 = arith.constant 11 : i64
      %3082 = func.call @cc_make_string(%3080, %3081) : (!llvm.ptr, i64) -> i64
      %3083 = func.call @cc_intern(%3079, %3082) : (i64, i64) -> i64
      %3084 = func.call @cc_nil_value() : () -> i64
      %3085 = func.call @cc_cons(%3083, %3084) : (i64, i64) -> i64
      %3086 = func.call @cc_values_pack(%3085) : (i64) -> i64
      func.call @stack_push_pointer(%3083) : (i64) -> ()
      %3087 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3088 = arith.constant 1 : i64
      %3089 = func.call @cc_make_string(%3087, %3088) : (!llvm.ptr, i64) -> i64
      %3090 = func.call @cc_nil_value() : () -> i64
      %3091 = func.call @cc_intern(%3089, %3090) : (i64, i64) -> i64
      %3092 = func.call @cc_nil_value() : () -> i64
      %3093 = func.call @cc_cons(%3091, %3092) : (i64, i64) -> i64
      %3094 = func.call @cc_values_pack(%3093) : (i64) -> i64
      func.call @stack_push_pointer(%3091) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3095 = func.call @stack_pop_pointer() : () -> i64
      %3096 = func.call @stack_pop_pointer() : () -> i64
      %3097 = func.call @cc_cons(%3096, %3095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3098 = arith.addi %3097, %__rlasp_stack_elide_zero_176 : i64
      %3099 = func.call @stack_pop_pointer() : () -> i64
      %3100 = func.call @cc_cons(%3099, %3098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3100) : (i64) -> ()
      %3101 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3102 = arith.constant 5 : i64
      %3103 = func.call @cc_make_string(%3101, %3102) : (!llvm.ptr, i64) -> i64
      %3104 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3105 = arith.constant 11 : i64
      %3106 = func.call @cc_make_string(%3104, %3105) : (!llvm.ptr, i64) -> i64
      %3107 = func.call @cc_intern(%3103, %3106) : (i64, i64) -> i64
      %3108 = func.call @cc_nil_value() : () -> i64
      %3109 = func.call @cc_cons(%3107, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_values_pack(%3109) : (i64) -> i64
      func.call @stack_push_pointer(%3107) : (i64) -> ()
      %3111 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3112 = arith.constant 1 : i64
      %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = func.call @cc_nil_value() : () -> i64
      %3115 = func.call @cc_intern(%3113, %3114) : (i64, i64) -> i64
      %3116 = func.call @cc_nil_value() : () -> i64
      %3117 = func.call @cc_cons(%3115, %3116) : (i64, i64) -> i64
      %3118 = func.call @cc_values_pack(%3117) : (i64) -> i64
      func.call @stack_push_pointer(%3115) : (i64) -> ()
      %3119 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3120 = arith.constant 1 : i64
      %3121 = func.call @cc_make_string(%3119, %3120) : (!llvm.ptr, i64) -> i64
      %3122 = func.call @cc_nil_value() : () -> i64
      %3123 = func.call @cc_intern(%3121, %3122) : (i64, i64) -> i64
      %3124 = func.call @cc_nil_value() : () -> i64
      %3125 = func.call @cc_cons(%3123, %3124) : (i64, i64) -> i64
      %3126 = func.call @cc_values_pack(%3125) : (i64) -> i64
      func.call @stack_push_pointer(%3123) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3127 = func.call @stack_pop_pointer() : () -> i64
      %3128 = func.call @stack_pop_pointer() : () -> i64
      %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3130 = arith.addi %3129, %__rlasp_stack_elide_zero_177 : i64
      %3131 = func.call @stack_pop_pointer() : () -> i64
      %3132 = func.call @cc_cons(%3131, %3130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3133 = arith.addi %3132, %__rlasp_stack_elide_zero_178 : i64
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_cons(%3134, %3133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3135) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3136 = func.call @stack_pop_pointer() : () -> i64
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = func.call @cc_cons(%3137, %3136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3139 = arith.addi %3138, %__rlasp_stack_elide_zero_179 : i64
      %3140 = func.call @stack_pop_pointer() : () -> i64
      %3141 = func.call @cc_cons(%3140, %3139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3142 = arith.addi %3141, %__rlasp_stack_elide_zero_180 : i64
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @cc_cons(%3143, %3142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3144) : (i64) -> ()
      %3145 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3146 = arith.constant 5 : i64
      %3147 = func.call @cc_make_string(%3145, %3146) : (!llvm.ptr, i64) -> i64
      %3148 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3149 = arith.constant 11 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      %3151 = func.call @cc_intern(%3147, %3150) : (i64, i64) -> i64
      %3152 = func.call @cc_nil_value() : () -> i64
      %3153 = func.call @cc_cons(%3151, %3152) : (i64, i64) -> i64
      %3154 = func.call @cc_values_pack(%3153) : (i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      %3155 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3156 = arith.constant 1 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = func.call @cc_nil_value() : () -> i64
      %3159 = func.call @cc_intern(%3157, %3158) : (i64, i64) -> i64
      %3160 = func.call @cc_nil_value() : () -> i64
      %3161 = func.call @cc_cons(%3159, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_values_pack(%3161) : (i64) -> i64
      func.call @stack_push_pointer(%3159) : (i64) -> ()
      %3163 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3164 = arith.constant 13 : i64
      %3165 = func.call @cc_make_string(%3163, %3164) : (!llvm.ptr, i64) -> i64
      %3166 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3167 = arith.constant 11 : i64
      %3168 = func.call @cc_make_string(%3166, %3167) : (!llvm.ptr, i64) -> i64
      %3169 = func.call @cc_intern(%3165, %3168) : (i64, i64) -> i64
      %3170 = func.call @cc_nil_value() : () -> i64
      %3171 = func.call @cc_cons(%3169, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_values_pack(%3171) : (i64) -> i64
      func.call @stack_push_pointer(%3169) : (i64) -> ()
      %3173 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3174 = arith.constant 1 : i64
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
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3184 = arith.addi %3183, %__rlasp_stack_elide_zero_181 : i64
      %3185 = func.call @stack_pop_pointer() : () -> i64
      %3186 = func.call @cc_cons(%3185, %3184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3187 = func.call @stack_pop_pointer() : () -> i64
      %3188 = func.call @stack_pop_pointer() : () -> i64
      %3189 = func.call @cc_cons(%3188, %3187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3190 = arith.addi %3189, %__rlasp_stack_elide_zero_182 : i64
      %3191 = func.call @stack_pop_pointer() : () -> i64
      %3192 = func.call @cc_cons(%3191, %3190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3193 = arith.addi %3192, %__rlasp_stack_elide_zero_183 : i64
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = func.call @cc_cons(%3194, %3193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3195) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3199 = arith.addi %3198, %__rlasp_stack_elide_zero_184 : i64
      %3200 = func.call @stack_pop_pointer() : () -> i64
      %3201 = func.call @cc_cons(%3200, %3199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3202 = arith.addi %3201, %__rlasp_stack_elide_zero_185 : i64
      %3203 = func.call @stack_pop_pointer() : () -> i64
      %3204 = func.call @cc_cons(%3203, %3202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3204) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @stack_pop_pointer() : () -> i64
      %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3208 = arith.addi %3207, %__rlasp_stack_elide_zero_186 : i64
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @cc_cons(%3209, %3208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3211 = arith.addi %3210, %__rlasp_stack_elide_zero_187 : i64
      %3212 = func.call @stack_pop_pointer() : () -> i64
      %3213 = func.call @cc_cons(%3212, %3211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3213) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @cc_cons(%3215, %3214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3217 = arith.addi %3216, %__rlasp_stack_elide_zero_188 : i64
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @cc_cons(%3218, %3217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3220 = arith.addi %3219, %__rlasp_stack_elide_zero_189 : i64
      %3221 = func.call @stack_pop_pointer() : () -> i64
      %3222 = func.call @cc_cons(%3221, %3220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @stack_pop_pointer() : () -> i64
      %3225 = func.call @cc_cons(%3224, %3223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3226 = arith.addi %3225, %__rlasp_stack_elide_zero_190 : i64
      %3227 = func.call @stack_pop_pointer() : () -> i64
      %3228 = func.call @cc_cons(%3227, %3226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3228) : (i64) -> ()
      %3229 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3230 = arith.constant 5 : i64
      %3231 = func.call @cc_make_string(%3229, %3230) : (!llvm.ptr, i64) -> i64
      %3232 = func.call @cc_nil_value() : () -> i64
      %3233 = func.call @cc_intern(%3231, %3232) : (i64, i64) -> i64
      %3234 = func.call @cc_nil_value() : () -> i64
      %3235 = func.call @cc_cons(%3233, %3234) : (i64, i64) -> i64
      %3236 = func.call @cc_values_pack(%3235) : (i64) -> i64
      func.call @stack_push_pointer(%3233) : (i64) -> ()
      %3237 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3238 = arith.constant 4 : i64
      %3239 = func.call @cc_make_string(%3237, %3238) : (!llvm.ptr, i64) -> i64
      %3240 = func.call @cc_nil_value() : () -> i64
      %3241 = func.call @cc_intern(%3239, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_nil_value() : () -> i64
      %3243 = func.call @cc_cons(%3241, %3242) : (i64, i64) -> i64
      %3244 = func.call @cc_values_pack(%3243) : (i64) -> i64
      func.call @stack_push_pointer(%3241) : (i64) -> ()
      %3245 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3246 = arith.constant 15 : i64
      %3247 = func.call @cc_make_string(%3245, %3246) : (!llvm.ptr, i64) -> i64
      %3248 = func.call @cc_nil_value() : () -> i64
      %3249 = func.call @cc_intern(%3247, %3248) : (i64, i64) -> i64
      %3250 = func.call @cc_nil_value() : () -> i64
      %3251 = func.call @cc_cons(%3249, %3250) : (i64, i64) -> i64
      %3252 = func.call @cc_values_pack(%3251) : (i64) -> i64
      func.call @stack_push_pointer(%3249) : (i64) -> ()
      %3253 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3254 = arith.constant 6 : i64
      %3255 = func.call @cc_make_string(%3253, %3254) : (!llvm.ptr, i64) -> i64
      %3256 = func.call @cc_nil_value() : () -> i64
      %3257 = func.call @cc_intern(%3255, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_nil_value() : () -> i64
      %3259 = func.call @cc_cons(%3257, %3258) : (i64, i64) -> i64
      %3260 = func.call @cc_values_pack(%3259) : (i64) -> i64
      func.call @stack_push_pointer(%3257) : (i64) -> ()
      %3261 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3262 = arith.constant 15 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = func.call @cc_nil_value() : () -> i64
      %3265 = func.call @cc_intern(%3263, %3264) : (i64, i64) -> i64
      %3266 = func.call @cc_nil_value() : () -> i64
      %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
      func.call @stack_push_pointer(%3265) : (i64) -> ()
      %3269 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3270 = arith.constant 4 : i64
      %3271 = func.call @cc_make_string(%3269, %3270) : (!llvm.ptr, i64) -> i64
      %3272 = func.call @cc_nil_value() : () -> i64
      %3273 = func.call @cc_intern(%3271, %3272) : (i64, i64) -> i64
      %3274 = func.call @cc_nil_value() : () -> i64
      %3275 = func.call @cc_cons(%3273, %3274) : (i64, i64) -> i64
      %3276 = func.call @cc_values_pack(%3275) : (i64) -> i64
      func.call @stack_push_pointer(%3273) : (i64) -> ()
      %3277 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3278 = arith.constant 4 : i64
      %3279 = func.call @cc_make_string(%3277, %3278) : (!llvm.ptr, i64) -> i64
      %3280 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3281 = arith.constant 11 : i64
      %3282 = func.call @cc_make_string(%3280, %3281) : (!llvm.ptr, i64) -> i64
      %3283 = func.call @cc_intern(%3279, %3282) : (i64, i64) -> i64
      %3284 = func.call @cc_nil_value() : () -> i64
      %3285 = func.call @cc_cons(%3283, %3284) : (i64, i64) -> i64
      %3286 = func.call @cc_values_pack(%3285) : (i64) -> i64
      func.call @stack_push_pointer(%3283) : (i64) -> ()
      %3287 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3288 = arith.constant 1 : i64
      %3289 = func.call @cc_make_string(%3287, %3288) : (!llvm.ptr, i64) -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_intern(%3289, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_nil_value() : () -> i64
      %3293 = func.call @cc_cons(%3291, %3292) : (i64, i64) -> i64
      %3294 = func.call @cc_values_pack(%3293) : (i64) -> i64
      func.call @stack_push_pointer(%3291) : (i64) -> ()
      %3295 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3296 = arith.constant 1 : i64
      %3297 = func.call @cc_make_string(%3295, %3296) : (!llvm.ptr, i64) -> i64
      %3298 = func.call @cc_nil_value() : () -> i64
      %3299 = func.call @cc_intern(%3297, %3298) : (i64, i64) -> i64
      %3300 = func.call @cc_nil_value() : () -> i64
      %3301 = func.call @cc_cons(%3299, %3300) : (i64, i64) -> i64
      %3302 = func.call @cc_values_pack(%3301) : (i64) -> i64
      func.call @stack_push_pointer(%3299) : (i64) -> ()
      %3303 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3304 = arith.constant 9 : i64
      %3305 = func.call @cc_make_string(%3303, %3304) : (!llvm.ptr, i64) -> i64
      %3306 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3307 = arith.constant 11 : i64
      %3308 = func.call @cc_make_string(%3306, %3307) : (!llvm.ptr, i64) -> i64
      %3309 = func.call @cc_intern(%3305, %3308) : (i64, i64) -> i64
      %3310 = func.call @cc_nil_value() : () -> i64
      %3311 = func.call @cc_cons(%3309, %3310) : (i64, i64) -> i64
      %3312 = func.call @cc_values_pack(%3311) : (i64) -> i64
      func.call @stack_push_pointer(%3309) : (i64) -> ()
      %3313 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3314 = arith.constant 1 : i64
      %3315 = func.call @cc_make_string(%3313, %3314) : (!llvm.ptr, i64) -> i64
      %3316 = func.call @cc_nil_value() : () -> i64
      %3317 = func.call @cc_intern(%3315, %3316) : (i64, i64) -> i64
      %3318 = func.call @cc_nil_value() : () -> i64
      %3319 = func.call @cc_cons(%3317, %3318) : (i64, i64) -> i64
      %3320 = func.call @cc_values_pack(%3319) : (i64) -> i64
      func.call @stack_push_pointer(%3317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3321 = func.call @stack_pop_pointer() : () -> i64
      %3322 = func.call @stack_pop_pointer() : () -> i64
      %3323 = func.call @cc_cons(%3322, %3321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3324 = arith.addi %3323, %__rlasp_stack_elide_zero_191 : i64
      %3325 = func.call @stack_pop_pointer() : () -> i64
      %3326 = func.call @cc_cons(%3325, %3324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3327 = func.call @stack_pop_pointer() : () -> i64
      %3328 = func.call @stack_pop_pointer() : () -> i64
      %3329 = func.call @cc_cons(%3328, %3327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3330 = arith.addi %3329, %__rlasp_stack_elide_zero_192 : i64
      %3331 = func.call @stack_pop_pointer() : () -> i64
      %3332 = func.call @cc_cons(%3331, %3330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3333 = arith.addi %3332, %__rlasp_stack_elide_zero_193 : i64
      %3334 = func.call @stack_pop_pointer() : () -> i64
      %3335 = func.call @cc_cons(%3334, %3333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3336 = arith.addi %3335, %__rlasp_stack_elide_zero_194 : i64
      %3337 = func.call @stack_pop_pointer() : () -> i64
      %3338 = func.call @cc_cons(%3337, %3336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3338) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3339 = func.call @stack_pop_pointer() : () -> i64
      %3340 = func.call @stack_pop_pointer() : () -> i64
      %3341 = func.call @cc_cons(%3340, %3339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %3342 = arith.addi %3341, %__rlasp_stack_elide_zero_195 : i64
      %3343 = func.call @stack_pop_pointer() : () -> i64
      %3344 = func.call @cc_cons(%3343, %3342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3345 = func.call @stack_pop_pointer() : () -> i64
      %3346 = func.call @stack_pop_pointer() : () -> i64
      %3347 = func.call @cc_cons(%3346, %3345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %3348 = arith.addi %3347, %__rlasp_stack_elide_zero_196 : i64
      %3349 = func.call @stack_pop_pointer() : () -> i64
      %3350 = func.call @cc_cons(%3349, %3348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %3351 = arith.addi %3350, %__rlasp_stack_elide_zero_197 : i64
      %3352 = func.call @stack_pop_pointer() : () -> i64
      %3353 = func.call @cc_cons(%3352, %3351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3353) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3354 = func.call @stack_pop_pointer() : () -> i64
      %3355 = func.call @stack_pop_pointer() : () -> i64
      %3356 = func.call @cc_cons(%3355, %3354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %3357 = arith.addi %3356, %__rlasp_stack_elide_zero_198 : i64
      %3358 = func.call @stack_pop_pointer() : () -> i64
      %3359 = func.call @cc_cons(%3358, %3357) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %3360 = arith.addi %3359, %__rlasp_stack_elide_zero_199 : i64
      %3361 = func.call @stack_pop_pointer() : () -> i64
      %3362 = func.call @cc_cons(%3361, %3360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3363 = func.call @stack_pop_pointer() : () -> i64
      %3364 = func.call @stack_pop_pointer() : () -> i64
      %3365 = func.call @cc_cons(%3364, %3363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %3366 = arith.addi %3365, %__rlasp_stack_elide_zero_200 : i64
      %3367 = func.call @stack_pop_pointer() : () -> i64
      %3368 = func.call @cc_cons(%3367, %3366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3368) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3369 = func.call @stack_pop_pointer() : () -> i64
      %3370 = func.call @stack_pop_pointer() : () -> i64
      %3371 = func.call @cc_cons(%3370, %3369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %3372 = arith.addi %3371, %__rlasp_stack_elide_zero_201 : i64
      %3373 = func.call @stack_pop_pointer() : () -> i64
      %3374 = func.call @cc_cons(%3373, %3372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %3375 = arith.addi %3374, %__rlasp_stack_elide_zero_202 : i64
      %3376 = func.call @stack_pop_pointer() : () -> i64
      %3377 = func.call @cc_cons(%3376, %3375) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %3378 = arith.addi %3377, %__rlasp_stack_elide_zero_203 : i64
      %3379 = func.call @stack_pop_pointer() : () -> i64
      %3380 = func.call @cc_cons(%3379, %3378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3380) : (i64) -> ()
      %3381 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3382 = arith.constant 4 : i64
      %3383 = func.call @cc_make_string(%3381, %3382) : (!llvm.ptr, i64) -> i64
      %3384 = func.call @cc_nil_value() : () -> i64
      %3385 = func.call @cc_intern(%3383, %3384) : (i64, i64) -> i64
      %3386 = func.call @cc_nil_value() : () -> i64
      %3387 = func.call @cc_cons(%3385, %3386) : (i64, i64) -> i64
      %3388 = func.call @cc_values_pack(%3387) : (i64) -> i64
      func.call @stack_push_pointer(%3385) : (i64) -> ()
      %3389 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3390 = arith.constant 1 : i64
      %3391 = func.call @cc_make_string(%3389, %3390) : (!llvm.ptr, i64) -> i64
      %3392 = func.call @cc_nil_value() : () -> i64
      %3393 = func.call @cc_intern(%3391, %3392) : (i64, i64) -> i64
      %3394 = func.call @cc_nil_value() : () -> i64
      %3395 = func.call @cc_cons(%3393, %3394) : (i64, i64) -> i64
      %3396 = func.call @cc_values_pack(%3395) : (i64) -> i64
      func.call @stack_push_pointer(%3393) : (i64) -> ()
      %3397 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3398 = arith.constant 1 : i64
      %3399 = func.call @cc_make_string(%3397, %3398) : (!llvm.ptr, i64) -> i64
      %3400 = func.call @cc_nil_value() : () -> i64
      %3401 = func.call @cc_intern(%3399, %3400) : (i64, i64) -> i64
      %3402 = func.call @cc_nil_value() : () -> i64
      %3403 = func.call @cc_cons(%3401, %3402) : (i64, i64) -> i64
      %3404 = func.call @cc_values_pack(%3403) : (i64) -> i64
      func.call @stack_push_pointer(%3401) : (i64) -> ()
      %3405 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3406 = arith.constant 1 : i64
      %3407 = func.call @cc_make_string(%3405, %3406) : (!llvm.ptr, i64) -> i64
      %3408 = func.call @cc_nil_value() : () -> i64
      %3409 = func.call @cc_intern(%3407, %3408) : (i64, i64) -> i64
      %3410 = func.call @cc_nil_value() : () -> i64
      %3411 = func.call @cc_cons(%3409, %3410) : (i64, i64) -> i64
      %3412 = func.call @cc_values_pack(%3411) : (i64) -> i64
      func.call @stack_push_pointer(%3409) : (i64) -> ()
      %3413 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%3413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3414 = func.call @stack_pop_pointer() : () -> i64
      %3415 = func.call @stack_pop_pointer() : () -> i64
      %3416 = func.call @cc_cons(%3415, %3414) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %3417 = arith.addi %3416, %__rlasp_stack_elide_zero_204 : i64
      %3418 = func.call @stack_pop_pointer() : () -> i64
      %3419 = func.call @cc_cons(%3418, %3417) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %3420 = arith.addi %3419, %__rlasp_stack_elide_zero_205 : i64
      %3421 = func.call @stack_pop_pointer() : () -> i64
      %3422 = func.call @cc_cons(%3421, %3420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = func.call @stack_pop_pointer() : () -> i64
      %3425 = func.call @cc_cons(%3424, %3423) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %3426 = arith.addi %3425, %__rlasp_stack_elide_zero_206 : i64
      %3427 = func.call @stack_pop_pointer() : () -> i64
      %3428 = func.call @cc_cons(%3427, %3426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %3429 = arith.addi %3428, %__rlasp_stack_elide_zero_207 : i64
      %3430 = func.call @stack_pop_pointer() : () -> i64
      %3431 = func.call @cc_cons(%3430, %3429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3431) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3432 = func.call @stack_pop_pointer() : () -> i64
      %3433 = func.call @stack_pop_pointer() : () -> i64
      %3434 = func.call @cc_cons(%3433, %3432) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %3435 = arith.addi %3434, %__rlasp_stack_elide_zero_208 : i64
      %3436 = func.call @stack_pop_pointer() : () -> i64
      %3437 = func.call @cc_cons(%3436, %3435) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %3438 = arith.addi %3437, %__rlasp_stack_elide_zero_209 : i64
      %3439 = func.call @stack_pop_pointer() : () -> i64
      %3440 = func.call @cc_cons(%3439, %3438) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %3441 = arith.addi %3440, %__rlasp_stack_elide_zero_210 : i64
      %3442 = func.call @stack_pop_pointer() : () -> i64
      %3443 = func.call @cc_cons(%3442, %3441) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %3444 = arith.addi %3443, %__rlasp_stack_elide_zero_211 : i64
      %3445 = func.call @stack_pop_pointer() : () -> i64
      %3446 = func.call @cc_cons(%3445, %3444) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %3447 = arith.addi %3446, %__rlasp_stack_elide_zero_212 : i64
      %3448 = func.call @stack_pop_pointer() : () -> i64
      %3449 = func.call @cc_cons(%3448, %3447) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %3450 = arith.addi %3449, %__rlasp_stack_elide_zero_213 : i64
      %3451 = func.call @stack_pop_pointer() : () -> i64
      %3452 = func.call @cc_cons(%3451, %3450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3452) : (i64) -> ()
      %3453 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3454 = arith.constant 2 : i64
      %3455 = func.call @cc_make_string(%3453, %3454) : (!llvm.ptr, i64) -> i64
      %3456 = func.call @cc_nil_value() : () -> i64
      %3457 = func.call @cc_intern(%3455, %3456) : (i64, i64) -> i64
      %3458 = func.call @cc_nil_value() : () -> i64
      %3459 = func.call @cc_cons(%3457, %3458) : (i64, i64) -> i64
      %3460 = func.call @cc_values_pack(%3459) : (i64) -> i64
      func.call @stack_push_pointer(%3457) : (i64) -> ()
      %3461 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3462 = arith.constant 17 : i64
      %3463 = func.call @cc_make_string(%3461, %3462) : (!llvm.ptr, i64) -> i64
      %3464 = func.call @cc_nil_value() : () -> i64
      %3465 = func.call @cc_intern(%3463, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3470 = arith.constant 5 : i64
      %3471 = func.call @cc_make_string(%3469, %3470) : (!llvm.ptr, i64) -> i64
      %3472 = func.call @cc_nil_value() : () -> i64
      %3473 = func.call @cc_intern(%3471, %3472) : (i64, i64) -> i64
      %3474 = func.call @cc_nil_value() : () -> i64
      %3475 = func.call @cc_cons(%3473, %3474) : (i64, i64) -> i64
      %3476 = func.call @cc_values_pack(%3475) : (i64) -> i64
      func.call @stack_push_pointer(%3473) : (i64) -> ()
      %3477 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3478 = arith.constant 4 : i64
      %3479 = func.call @cc_make_string(%3477, %3478) : (!llvm.ptr, i64) -> i64
      %3480 = func.call @cc_nil_value() : () -> i64
      %3481 = func.call @cc_intern(%3479, %3480) : (i64, i64) -> i64
      %3482 = func.call @cc_nil_value() : () -> i64
      %3483 = func.call @cc_cons(%3481, %3482) : (i64, i64) -> i64
      %3484 = func.call @cc_values_pack(%3483) : (i64) -> i64
      func.call @stack_push_pointer(%3481) : (i64) -> ()
      %3485 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3486 = arith.constant 1 : i64
      %3487 = func.call @cc_make_string(%3485, %3486) : (!llvm.ptr, i64) -> i64
      %3488 = func.call @cc_nil_value() : () -> i64
      %3489 = func.call @cc_intern(%3487, %3488) : (i64, i64) -> i64
      %3490 = func.call @cc_nil_value() : () -> i64
      %3491 = func.call @cc_cons(%3489, %3490) : (i64, i64) -> i64
      %3492 = func.call @cc_values_pack(%3491) : (i64) -> i64
      func.call @stack_push_pointer(%3489) : (i64) -> ()
      %3493 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3494 = arith.constant 19 : i64
      %3495 = func.call @cc_make_string(%3493, %3494) : (!llvm.ptr, i64) -> i64
      %3496 = func.call @cc_nil_value() : () -> i64
      %3497 = func.call @cc_intern(%3495, %3496) : (i64, i64) -> i64
      %3498 = func.call @cc_nil_value() : () -> i64
      %3499 = func.call @cc_cons(%3497, %3498) : (i64, i64) -> i64
      %3500 = func.call @cc_values_pack(%3499) : (i64) -> i64
      func.call @stack_push_pointer(%3497) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3501 = func.call @stack_pop_pointer() : () -> i64
      %3502 = func.call @stack_pop_pointer() : () -> i64
      %3503 = func.call @cc_cons(%3502, %3501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %3504 = arith.addi %3503, %__rlasp_stack_elide_zero_214 : i64
      %3505 = func.call @stack_pop_pointer() : () -> i64
      %3506 = func.call @cc_cons(%3505, %3504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %3507 = arith.addi %3506, %__rlasp_stack_elide_zero_215 : i64
      %3508 = func.call @stack_pop_pointer() : () -> i64
      %3509 = func.call @cc_cons(%3508, %3507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3509) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3510 = func.call @stack_pop_pointer() : () -> i64
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = func.call @cc_cons(%3511, %3510) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %3513 = arith.addi %3512, %__rlasp_stack_elide_zero_216 : i64
      %3514 = func.call @stack_pop_pointer() : () -> i64
      %3515 = func.call @cc_cons(%3514, %3513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3516 = func.call @stack_pop_pointer() : () -> i64
      %3517 = func.call @stack_pop_pointer() : () -> i64
      %3518 = func.call @cc_cons(%3517, %3516) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %3519 = arith.addi %3518, %__rlasp_stack_elide_zero_217 : i64
      %3520 = func.call @stack_pop_pointer() : () -> i64
      %3521 = func.call @cc_cons(%3520, %3519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %3522 = arith.addi %3521, %__rlasp_stack_elide_zero_218 : i64
      %3523 = func.call @stack_pop_pointer() : () -> i64
      %3524 = func.call @cc_cons(%3523, %3522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %3525 = arith.addi %3524, %__rlasp_stack_elide_zero_219 : i64
      %3526 = func.call @stack_pop_pointer() : () -> i64
      %3527 = func.call @cc_cons(%3526, %3525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3527) : (i64) -> ()
      %3528 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3529 = arith.constant 15 : i64
      %3530 = func.call @cc_make_string(%3528, %3529) : (!llvm.ptr, i64) -> i64
      %3531 = func.call @cc_nil_value() : () -> i64
      %3532 = func.call @cc_intern(%3530, %3531) : (i64, i64) -> i64
      %3533 = func.call @cc_nil_value() : () -> i64
      %3534 = func.call @cc_cons(%3532, %3533) : (i64, i64) -> i64
      %3535 = func.call @cc_values_pack(%3534) : (i64) -> i64
      func.call @stack_push_pointer(%3532) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3536 = func.call @stack_pop_pointer() : () -> i64
      %3537 = func.call @stack_pop_pointer() : () -> i64
      %3538 = func.call @cc_cons(%3537, %3536) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %3539 = arith.addi %3538, %__rlasp_stack_elide_zero_220 : i64
      %3540 = func.call @stack_pop_pointer() : () -> i64
      %3541 = func.call @cc_cons(%3540, %3539) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %3542 = arith.addi %3541, %__rlasp_stack_elide_zero_221 : i64
      %3543 = func.call @stack_pop_pointer() : () -> i64
      %3544 = func.call @cc_cons(%3543, %3542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %3545 = arith.addi %3544, %__rlasp_stack_elide_zero_222 : i64
      %3546 = func.call @stack_pop_pointer() : () -> i64
      %3547 = func.call @cc_cons(%3546, %3545) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %3548 = arith.addi %3547, %__rlasp_stack_elide_zero_223 : i64
      %3549 = func.call @stack_pop_pointer() : () -> i64
      %3550 = func.call @cc_cons(%3549, %3548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3550) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3551 = func.call @stack_pop_pointer() : () -> i64
      %3552 = func.call @stack_pop_pointer() : () -> i64
      %3553 = func.call @cc_cons(%3552, %3551) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %3554 = arith.addi %3553, %__rlasp_stack_elide_zero_224 : i64
      %3555 = func.call @stack_pop_pointer() : () -> i64
      %3556 = func.call @cc_cons(%3555, %3554) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %3557 = arith.addi %3556, %__rlasp_stack_elide_zero_225 : i64
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = func.call @cc_cons(%3558, %3557) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %3560 = arith.addi %3559, %__rlasp_stack_elide_zero_226 : i64
      %3897 = arith.constant 271595545296903 : i64
      %3898 = arith.constant 0 : i64
      %3899 = func.call @cc_make_closure(%3897, %3898) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %3900 = arith.addi %3899, %__rlasp_stack_elide_zero_227 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3901 = func.call @stack_pop_pointer() : () -> i64
      %3902 = func.call @stack_pop_pointer() : () -> i64
      %3903 = func.call @cc_cons(%3902, %3901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %3904 = arith.addi %3903, %__rlasp_stack_elide_zero_228 : i64
      %3905 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3906 = arith.constant 11 : i64
      %3907 = func.call @cc_make_string(%3905, %3906) : (!llvm.ptr, i64) -> i64
      %3908 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3909 = arith.constant 7 : i64
      %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
      %3911 = func.call @cc_intern(%3907, %3910) : (i64, i64) -> i64
      %3912 = func.call @cc_nil_value() : () -> i64
      %3913 = func.call @cc_cons(%3911, %3912) : (i64, i64) -> i64
      %3914 = func.call @cc_values_pack(%3913) : (i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3917 = arith.constant 4 : i64
      %3918 = func.call @cc_make_string(%3916, %3917) : (!llvm.ptr, i64) -> i64
      %3919 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3920 = arith.constant 7 : i64
      %3921 = func.call @cc_make_string(%3919, %3920) : (!llvm.ptr, i64) -> i64
      %3922 = func.call @cc_intern(%3918, %3921) : (i64, i64) -> i64
      %3923 = func.call @cc_nil_value() : () -> i64
      %3924 = func.call @cc_cons(%3922, %3923) : (i64, i64) -> i64
      %3925 = func.call @cc_values_pack(%3924) : (i64) -> i64
      %3926 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3927 = arith.constant 6 : i64
      %3928 = func.call @cc_make_string(%3926, %3927) : (!llvm.ptr, i64) -> i64
      %3929 = func.call @cc_nil_value() : () -> i64
      %3930 = func.call @cc_intern(%3928, %3929) : (i64, i64) -> i64
      %3931 = func.call @cc_nil_value() : () -> i64
      %3932 = func.call @cc_cons(%3930, %3931) : (i64, i64) -> i64
      %3933 = func.call @cc_values_pack(%3932) : (i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %3934 = arith.addi %3930, %__rlasp_stack_elide_zero_229 : i64
      %3935 = func.call @cc_nil_value() : () -> i64
      %3936 = func.call @cc_errorp(%2702) : (i64) -> i64
      %3937 = arith.cmpi ne, %3936, %3935 : i64
      %3938 = arith.cmpi eq, %3935, %3935 : i64
      %3939 = arith.andi %3937, %3938 : i1
      %3940 = scf.if %3939 -> (i64) {
        scf.yield %2702 : i64
      } else {
        scf.yield %3935 : i64
      }
      %3941 = func.call @cc_errorp(%3560) : (i64) -> i64
      %3942 = arith.cmpi ne, %3941, %3935 : i64
      %3943 = arith.cmpi eq, %3940, %3935 : i64
      %3944 = arith.andi %3942, %3943 : i1
      %3945 = scf.if %3944 -> (i64) {
        scf.yield %3560 : i64
      } else {
        scf.yield %3940 : i64
      }
      %3946 = func.call @cc_errorp(%3900) : (i64) -> i64
      %3947 = arith.cmpi ne, %3946, %3935 : i64
      %3948 = arith.cmpi eq, %3945, %3935 : i64
      %3949 = arith.andi %3947, %3948 : i1
      %3950 = scf.if %3949 -> (i64) {
        scf.yield %3900 : i64
      } else {
        scf.yield %3945 : i64
      }
      %3951 = func.call @cc_errorp(%3904) : (i64) -> i64
      %3952 = arith.cmpi ne, %3951, %3935 : i64
      %3953 = arith.cmpi eq, %3950, %3935 : i64
      %3954 = arith.andi %3952, %3953 : i1
      %3955 = scf.if %3954 -> (i64) {
        scf.yield %3904 : i64
      } else {
        scf.yield %3950 : i64
      }
      %3956 = func.call @cc_errorp(%3911) : (i64) -> i64
      %3957 = arith.cmpi ne, %3956, %3935 : i64
      %3958 = arith.cmpi eq, %3955, %3935 : i64
      %3959 = arith.andi %3957, %3958 : i1
      %3960 = scf.if %3959 -> (i64) {
        scf.yield %3911 : i64
      } else {
        scf.yield %3955 : i64
      }
      %3961 = func.call @cc_errorp(%3915) : (i64) -> i64
      %3962 = arith.cmpi ne, %3961, %3935 : i64
      %3963 = arith.cmpi eq, %3960, %3935 : i64
      %3964 = arith.andi %3962, %3963 : i1
      %3965 = scf.if %3964 -> (i64) {
        scf.yield %3915 : i64
      } else {
        scf.yield %3960 : i64
      }
      %3966 = func.call @cc_errorp(%3922) : (i64) -> i64
      %3967 = arith.cmpi ne, %3966, %3935 : i64
      %3968 = arith.cmpi eq, %3965, %3935 : i64
      %3969 = arith.andi %3967, %3968 : i1
      %3970 = scf.if %3969 -> (i64) {
        scf.yield %3922 : i64
      } else {
        scf.yield %3965 : i64
      }
      %3971 = func.call @cc_errorp(%3934) : (i64) -> i64
      %3972 = arith.cmpi ne, %3971, %3935 : i64
      %3973 = arith.cmpi eq, %3970, %3935 : i64
      %3974 = arith.andi %3972, %3973 : i1
      %3975 = scf.if %3974 -> (i64) {
        scf.yield %3934 : i64
      } else {
        scf.yield %3970 : i64
      }
      %3976 = arith.cmpi ne, %3975, %3935 : i64
      scf.if %3976 {
        func.call @stack_push_pointer(%3975) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2702) : (i64) -> ()
        func.call @stack_push_pointer(%3560) : (i64) -> ()
        func.call @stack_push_pointer(%3900) : (i64) -> ()
        func.call @stack_push_pointer(%3904) : (i64) -> ()
        func.call @stack_push_pointer(%3911) : (i64) -> ()
        func.call @stack_push_pointer(%3915) : (i64) -> ()
        func.call @stack_push_pointer(%3922) : (i64) -> ()
        func.call @stack_push_pointer(%3934) : (i64) -> ()
        %3977 = llvm.mlir.addressof @str288 : !llvm.ptr
        %3978 = func.call @cc_make_function_ref_const(%3977) : (!llvm.ptr) -> i64
        %3979 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3978, %3979) : (i64, i64) -> ()
      }
      %3980 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3980 : i64
    }
    %3981 = func.call @cc_nil_value() : () -> i64
    %3982 = func.call @cc_errorp(%2693) : (i64) -> i64
    %3983 = arith.cmpi ne, %3982, %3981 : i64
    %3984 = scf.if %3983 -> (i64) {
      scf.yield %2693 : i64
    } else {
      %3985 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3986 = arith.constant 16 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = func.call @cc_nil_value() : () -> i64
      %3989 = func.call @cc_intern(%3987, %3988) : (i64, i64) -> i64
      %3990 = func.call @cc_nil_value() : () -> i64
      %3991 = func.call @cc_cons(%3989, %3990) : (i64, i64) -> i64
      %3992 = func.call @cc_values_pack(%3991) : (i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %3993 = arith.addi %3989, %__rlasp_stack_elide_zero_230 : i64
      %3994 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3995 = arith.constant 4 : i64
      %3996 = func.call @cc_make_string(%3994, %3995) : (!llvm.ptr, i64) -> i64
      %3997 = func.call @cc_nil_value() : () -> i64
      %3998 = func.call @cc_intern(%3996, %3997) : (i64, i64) -> i64
      %3999 = func.call @cc_nil_value() : () -> i64
      %4000 = func.call @cc_cons(%3998, %3999) : (i64, i64) -> i64
      %4001 = func.call @cc_values_pack(%4000) : (i64) -> i64
      func.call @stack_push_pointer(%3998) : (i64) -> ()
      %4002 = llvm.mlir.addressof @str291 : !llvm.ptr
      %4003 = arith.constant 1 : i64
      %4004 = func.call @cc_make_string(%4002, %4003) : (!llvm.ptr, i64) -> i64
      %4005 = func.call @cc_nil_value() : () -> i64
      %4006 = func.call @cc_intern(%4004, %4005) : (i64, i64) -> i64
      %4007 = func.call @cc_nil_value() : () -> i64
      %4008 = func.call @cc_cons(%4006, %4007) : (i64, i64) -> i64
      %4009 = func.call @cc_values_pack(%4008) : (i64) -> i64
      func.call @stack_push_pointer(%4006) : (i64) -> ()
      %4010 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4010) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4011 = func.call @stack_pop_pointer() : () -> i64
      %4012 = func.call @stack_pop_pointer() : () -> i64
      %4013 = func.call @cc_cons(%4012, %4011) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %4014 = arith.addi %4013, %__rlasp_stack_elide_zero_231 : i64
      %4015 = func.call @stack_pop_pointer() : () -> i64
      %4016 = func.call @cc_cons(%4015, %4014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4016) : (i64) -> ()
      %4017 = llvm.mlir.addressof @str292 : !llvm.ptr
      %4018 = arith.constant 19 : i64
      %4019 = func.call @cc_make_string(%4017, %4018) : (!llvm.ptr, i64) -> i64
      %4020 = func.call @cc_nil_value() : () -> i64
      %4021 = func.call @cc_intern(%4019, %4020) : (i64, i64) -> i64
      %4022 = func.call @cc_nil_value() : () -> i64
      %4023 = func.call @cc_cons(%4021, %4022) : (i64, i64) -> i64
      %4024 = func.call @cc_values_pack(%4023) : (i64) -> i64
      func.call @stack_push_pointer(%4021) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4025 = func.call @stack_pop_pointer() : () -> i64
      %4026 = func.call @stack_pop_pointer() : () -> i64
      %4027 = func.call @cc_cons(%4026, %4025) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %4028 = arith.addi %4027, %__rlasp_stack_elide_zero_232 : i64
      %4029 = func.call @stack_pop_pointer() : () -> i64
      %4030 = func.call @cc_cons(%4029, %4028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4030) : (i64) -> ()
      %4031 = llvm.mlir.addressof @str293 : !llvm.ptr
      %4032 = arith.constant 1 : i64
      %4033 = func.call @cc_make_string(%4031, %4032) : (!llvm.ptr, i64) -> i64
      %4034 = func.call @cc_nil_value() : () -> i64
      %4035 = func.call @cc_intern(%4033, %4034) : (i64, i64) -> i64
      %4036 = func.call @cc_nil_value() : () -> i64
      %4037 = func.call @cc_cons(%4035, %4036) : (i64, i64) -> i64
      %4038 = func.call @cc_values_pack(%4037) : (i64) -> i64
      func.call @stack_push_pointer(%4035) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4039 = func.call @stack_pop_pointer() : () -> i64
      %4040 = func.call @stack_pop_pointer() : () -> i64
      %4041 = func.call @cc_cons(%4040, %4039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %4042 = arith.addi %4041, %__rlasp_stack_elide_zero_233 : i64
      %4043 = func.call @stack_pop_pointer() : () -> i64
      %4044 = func.call @cc_cons(%4043, %4042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4044) : (i64) -> ()
      %4045 = llvm.mlir.addressof @str294 : !llvm.ptr
      %4046 = arith.constant 15 : i64
      %4047 = func.call @cc_make_string(%4045, %4046) : (!llvm.ptr, i64) -> i64
      %4048 = func.call @cc_nil_value() : () -> i64
      %4049 = func.call @cc_intern(%4047, %4048) : (i64, i64) -> i64
      %4050 = func.call @cc_nil_value() : () -> i64
      %4051 = func.call @cc_cons(%4049, %4050) : (i64, i64) -> i64
      %4052 = func.call @cc_values_pack(%4051) : (i64) -> i64
      func.call @stack_push_pointer(%4049) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4053 = func.call @stack_pop_pointer() : () -> i64
      %4054 = func.call @stack_pop_pointer() : () -> i64
      %4055 = func.call @cc_cons(%4054, %4053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %4056 = arith.addi %4055, %__rlasp_stack_elide_zero_234 : i64
      %4057 = func.call @stack_pop_pointer() : () -> i64
      %4058 = func.call @cc_cons(%4057, %4056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4058) : (i64) -> ()
      %4059 = llvm.mlir.addressof @str295 : !llvm.ptr
      %4060 = arith.constant 17 : i64
      %4061 = func.call @cc_make_string(%4059, %4060) : (!llvm.ptr, i64) -> i64
      %4062 = func.call @cc_nil_value() : () -> i64
      %4063 = func.call @cc_intern(%4061, %4062) : (i64, i64) -> i64
      %4064 = func.call @cc_nil_value() : () -> i64
      %4065 = func.call @cc_cons(%4063, %4064) : (i64, i64) -> i64
      %4066 = func.call @cc_values_pack(%4065) : (i64) -> i64
      func.call @stack_push_pointer(%4063) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4067 = func.call @stack_pop_pointer() : () -> i64
      %4068 = func.call @stack_pop_pointer() : () -> i64
      %4069 = func.call @cc_cons(%4068, %4067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %4070 = arith.addi %4069, %__rlasp_stack_elide_zero_235 : i64
      %4071 = func.call @stack_pop_pointer() : () -> i64
      %4072 = func.call @cc_cons(%4071, %4070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4072) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4073 = func.call @stack_pop_pointer() : () -> i64
      %4074 = func.call @stack_pop_pointer() : () -> i64
      %4075 = func.call @cc_cons(%4074, %4073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %4076 = arith.addi %4075, %__rlasp_stack_elide_zero_236 : i64
      %4077 = func.call @stack_pop_pointer() : () -> i64
      %4078 = func.call @cc_cons(%4077, %4076) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %4079 = arith.addi %4078, %__rlasp_stack_elide_zero_237 : i64
      %4080 = func.call @stack_pop_pointer() : () -> i64
      %4081 = func.call @cc_cons(%4080, %4079) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %4082 = arith.addi %4081, %__rlasp_stack_elide_zero_238 : i64
      %4083 = func.call @stack_pop_pointer() : () -> i64
      %4084 = func.call @cc_cons(%4083, %4082) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %4085 = arith.addi %4084, %__rlasp_stack_elide_zero_239 : i64
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @cc_cons(%4086, %4085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4087) : (i64) -> ()
      %4088 = llvm.mlir.addressof @str296 : !llvm.ptr
      %4089 = arith.constant 5 : i64
      %4090 = func.call @cc_make_string(%4088, %4089) : (!llvm.ptr, i64) -> i64
      %4091 = func.call @cc_nil_value() : () -> i64
      %4092 = func.call @cc_intern(%4090, %4091) : (i64, i64) -> i64
      %4093 = func.call @cc_nil_value() : () -> i64
      %4094 = func.call @cc_cons(%4092, %4093) : (i64, i64) -> i64
      %4095 = func.call @cc_values_pack(%4094) : (i64) -> i64
      func.call @stack_push_pointer(%4092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4096 = llvm.mlir.addressof @str297 : !llvm.ptr
      %4097 = arith.constant 5 : i64
      %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
      %4099 = llvm.mlir.addressof @str298 : !llvm.ptr
      %4100 = arith.constant 3 : i64
      %4101 = func.call @cc_make_string(%4099, %4100) : (!llvm.ptr, i64) -> i64
      %4102 = func.call @cc_intern(%4098, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_nil_value() : () -> i64
      %4104 = func.call @cc_cons(%4102, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_values_pack(%4104) : (i64) -> i64
      func.call @stack_push_pointer(%4102) : (i64) -> ()
      %4106 = llvm.mlir.addressof @str299 : !llvm.ptr
      %4107 = arith.constant 1 : i64
      %4108 = func.call @cc_make_string(%4106, %4107) : (!llvm.ptr, i64) -> i64
      %4109 = func.call @cc_nil_value() : () -> i64
      %4110 = func.call @cc_intern(%4108, %4109) : (i64, i64) -> i64
      %4111 = func.call @cc_nil_value() : () -> i64
      %4112 = func.call @cc_cons(%4110, %4111) : (i64, i64) -> i64
      %4113 = func.call @cc_values_pack(%4112) : (i64) -> i64
      func.call @stack_push_pointer(%4110) : (i64) -> ()
      %4114 = llvm.mlir.addressof @str300 : !llvm.ptr
      %4115 = arith.constant 1 : i64
      %4116 = func.call @cc_make_string(%4114, %4115) : (!llvm.ptr, i64) -> i64
      %4117 = func.call @cc_nil_value() : () -> i64
      %4118 = func.call @cc_intern(%4116, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_cons(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_values_pack(%4120) : (i64) -> i64
      func.call @stack_push_pointer(%4118) : (i64) -> ()
      %4122 = llvm.mlir.addressof @str301 : !llvm.ptr
      %4123 = arith.constant 15 : i64
      %4124 = func.call @cc_make_string(%4122, %4123) : (!llvm.ptr, i64) -> i64
      %4125 = llvm.mlir.addressof @str302 : !llvm.ptr
      %4126 = arith.constant 11 : i64
      %4127 = func.call @cc_make_string(%4125, %4126) : (!llvm.ptr, i64) -> i64
      %4128 = func.call @cc_intern(%4124, %4127) : (i64, i64) -> i64
      %4129 = func.call @cc_nil_value() : () -> i64
      %4130 = func.call @cc_cons(%4128, %4129) : (i64, i64) -> i64
      %4131 = func.call @cc_values_pack(%4130) : (i64) -> i64
      func.call @stack_push_pointer(%4128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4132 = func.call @stack_pop_pointer() : () -> i64
      %4133 = func.call @stack_pop_pointer() : () -> i64
      %4134 = func.call @cc_cons(%4133, %4132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %4135 = arith.addi %4134, %__rlasp_stack_elide_zero_240 : i64
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = func.call @cc_cons(%4136, %4135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %4138 = arith.addi %4137, %__rlasp_stack_elide_zero_241 : i64
      %4139 = func.call @stack_pop_pointer() : () -> i64
      %4140 = func.call @cc_cons(%4139, %4138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4140) : (i64) -> ()
      %4141 = llvm.mlir.addressof @str303 : !llvm.ptr
      %4142 = arith.constant 4 : i64
      %4143 = func.call @cc_make_string(%4141, %4142) : (!llvm.ptr, i64) -> i64
      %4144 = func.call @cc_nil_value() : () -> i64
      %4145 = func.call @cc_intern(%4143, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_nil_value() : () -> i64
      %4147 = func.call @cc_cons(%4145, %4146) : (i64, i64) -> i64
      %4148 = func.call @cc_values_pack(%4147) : (i64) -> i64
      func.call @stack_push_pointer(%4145) : (i64) -> ()
      %4149 = llvm.mlir.addressof @str304 : !llvm.ptr
      %4150 = arith.constant 17 : i64
      %4151 = func.call @cc_make_string(%4149, %4150) : (!llvm.ptr, i64) -> i64
      %4152 = func.call @cc_nil_value() : () -> i64
      %4153 = func.call @cc_intern(%4151, %4152) : (i64, i64) -> i64
      %4154 = func.call @cc_nil_value() : () -> i64
      %4155 = func.call @cc_cons(%4153, %4154) : (i64, i64) -> i64
      %4156 = func.call @cc_values_pack(%4155) : (i64) -> i64
      func.call @stack_push_pointer(%4153) : (i64) -> ()
      %4157 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4157) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = func.call @stack_pop_pointer() : () -> i64
      %4160 = func.call @cc_cons(%4159, %4158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %4161 = arith.addi %4160, %__rlasp_stack_elide_zero_242 : i64
      %4162 = func.call @stack_pop_pointer() : () -> i64
      %4163 = func.call @cc_cons(%4162, %4161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %4164 = arith.addi %4163, %__rlasp_stack_elide_zero_243 : i64
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @cc_cons(%4165, %4164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4166) : (i64) -> ()
      %4167 = llvm.mlir.addressof @str305 : !llvm.ptr
      %4168 = arith.constant 4 : i64
      %4169 = func.call @cc_make_string(%4167, %4168) : (!llvm.ptr, i64) -> i64
      %4170 = func.call @cc_nil_value() : () -> i64
      %4171 = func.call @cc_intern(%4169, %4170) : (i64, i64) -> i64
      %4172 = func.call @cc_nil_value() : () -> i64
      %4173 = func.call @cc_cons(%4171, %4172) : (i64, i64) -> i64
      %4174 = func.call @cc_values_pack(%4173) : (i64) -> i64
      func.call @stack_push_pointer(%4171) : (i64) -> ()
      %4175 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4176 = arith.constant 19 : i64
      %4177 = func.call @cc_make_string(%4175, %4176) : (!llvm.ptr, i64) -> i64
      %4178 = func.call @cc_nil_value() : () -> i64
      %4179 = func.call @cc_intern(%4177, %4178) : (i64, i64) -> i64
      %4180 = func.call @cc_nil_value() : () -> i64
      %4181 = func.call @cc_cons(%4179, %4180) : (i64, i64) -> i64
      %4182 = func.call @cc_values_pack(%4181) : (i64) -> i64
      func.call @stack_push_pointer(%4179) : (i64) -> ()
      %4183 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4184 = arith.constant 1 : i64
      %4185 = func.call @cc_make_string(%4183, %4184) : (!llvm.ptr, i64) -> i64
      %4186 = func.call @cc_nil_value() : () -> i64
      %4187 = func.call @cc_intern(%4185, %4186) : (i64, i64) -> i64
      %4188 = func.call @cc_nil_value() : () -> i64
      %4189 = func.call @cc_cons(%4187, %4188) : (i64, i64) -> i64
      %4190 = func.call @cc_values_pack(%4189) : (i64) -> i64
      func.call @stack_push_pointer(%4187) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4191 = func.call @stack_pop_pointer() : () -> i64
      %4192 = func.call @stack_pop_pointer() : () -> i64
      %4193 = func.call @cc_cons(%4192, %4191) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %4194 = arith.addi %4193, %__rlasp_stack_elide_zero_244 : i64
      %4195 = func.call @stack_pop_pointer() : () -> i64
      %4196 = func.call @cc_cons(%4195, %4194) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %4197 = arith.addi %4196, %__rlasp_stack_elide_zero_245 : i64
      %4198 = func.call @stack_pop_pointer() : () -> i64
      %4199 = func.call @cc_cons(%4198, %4197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4199) : (i64) -> ()
      %4200 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4201 = arith.constant 4 : i64
      %4202 = func.call @cc_make_string(%4200, %4201) : (!llvm.ptr, i64) -> i64
      %4203 = func.call @cc_nil_value() : () -> i64
      %4204 = func.call @cc_intern(%4202, %4203) : (i64, i64) -> i64
      %4205 = func.call @cc_nil_value() : () -> i64
      %4206 = func.call @cc_cons(%4204, %4205) : (i64, i64) -> i64
      %4207 = func.call @cc_values_pack(%4206) : (i64) -> i64
      func.call @stack_push_pointer(%4204) : (i64) -> ()
      %4208 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4209 = arith.constant 1 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_nil_value() : () -> i64
      %4212 = func.call @cc_intern(%4210, %4211) : (i64, i64) -> i64
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_values_pack(%4214) : (i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4216 = llvm.mlir.addressof @str310 : !llvm.ptr
      %4217 = arith.constant 9 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4220 = arith.constant 11 : i64
      %4221 = func.call @cc_make_string(%4219, %4220) : (!llvm.ptr, i64) -> i64
      %4222 = func.call @cc_intern(%4218, %4221) : (i64, i64) -> i64
      %4223 = func.call @cc_nil_value() : () -> i64
      %4224 = func.call @cc_cons(%4222, %4223) : (i64, i64) -> i64
      %4225 = func.call @cc_values_pack(%4224) : (i64) -> i64
      func.call @stack_push_pointer(%4222) : (i64) -> ()
      %4226 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4227 = arith.constant 1 : i64
      %4228 = func.call @cc_make_string(%4226, %4227) : (!llvm.ptr, i64) -> i64
      %4229 = func.call @cc_nil_value() : () -> i64
      %4230 = func.call @cc_intern(%4228, %4229) : (i64, i64) -> i64
      %4231 = func.call @cc_nil_value() : () -> i64
      %4232 = func.call @cc_cons(%4230, %4231) : (i64, i64) -> i64
      %4233 = func.call @cc_values_pack(%4232) : (i64) -> i64
      func.call @stack_push_pointer(%4230) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4234 = func.call @stack_pop_pointer() : () -> i64
      %4235 = func.call @stack_pop_pointer() : () -> i64
      %4236 = func.call @cc_cons(%4235, %4234) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %4237 = arith.addi %4236, %__rlasp_stack_elide_zero_246 : i64
      %4238 = func.call @stack_pop_pointer() : () -> i64
      %4239 = func.call @cc_cons(%4238, %4237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4239) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4240 = func.call @stack_pop_pointer() : () -> i64
      %4241 = func.call @stack_pop_pointer() : () -> i64
      %4242 = func.call @cc_cons(%4241, %4240) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %4243 = arith.addi %4242, %__rlasp_stack_elide_zero_247 : i64
      %4244 = func.call @stack_pop_pointer() : () -> i64
      %4245 = func.call @cc_cons(%4244, %4243) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %4246 = arith.addi %4245, %__rlasp_stack_elide_zero_248 : i64
      %4247 = func.call @stack_pop_pointer() : () -> i64
      %4248 = func.call @cc_cons(%4247, %4246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4248) : (i64) -> ()
      %4249 = llvm.mlir.addressof @str313 : !llvm.ptr
      %4250 = arith.constant 2 : i64
      %4251 = func.call @cc_make_string(%4249, %4250) : (!llvm.ptr, i64) -> i64
      %4252 = func.call @cc_nil_value() : () -> i64
      %4253 = func.call @cc_intern(%4251, %4252) : (i64, i64) -> i64
      %4254 = func.call @cc_nil_value() : () -> i64
      %4255 = func.call @cc_cons(%4253, %4254) : (i64, i64) -> i64
      %4256 = func.call @cc_values_pack(%4255) : (i64) -> i64
      func.call @stack_push_pointer(%4253) : (i64) -> ()
      %4257 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4258 = arith.constant 3 : i64
      %4259 = func.call @cc_make_string(%4257, %4258) : (!llvm.ptr, i64) -> i64
      %4260 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4261 = arith.constant 11 : i64
      %4262 = func.call @cc_make_string(%4260, %4261) : (!llvm.ptr, i64) -> i64
      %4263 = func.call @cc_intern(%4259, %4262) : (i64, i64) -> i64
      %4264 = func.call @cc_nil_value() : () -> i64
      %4265 = func.call @cc_cons(%4263, %4264) : (i64, i64) -> i64
      %4266 = func.call @cc_values_pack(%4265) : (i64) -> i64
      func.call @stack_push_pointer(%4263) : (i64) -> ()
      %4267 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4268 = arith.constant 1 : i64
      %4269 = func.call @cc_make_string(%4267, %4268) : (!llvm.ptr, i64) -> i64
      %4270 = func.call @cc_nil_value() : () -> i64
      %4271 = func.call @cc_intern(%4269, %4270) : (i64, i64) -> i64
      %4272 = func.call @cc_nil_value() : () -> i64
      %4273 = func.call @cc_cons(%4271, %4272) : (i64, i64) -> i64
      %4274 = func.call @cc_values_pack(%4273) : (i64) -> i64
      func.call @stack_push_pointer(%4271) : (i64) -> ()
      %4275 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4276 = arith.constant 12 : i64
      %4277 = func.call @cc_make_string(%4275, %4276) : (!llvm.ptr, i64) -> i64
      %4278 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4279 = arith.constant 11 : i64
      %4280 = func.call @cc_make_string(%4278, %4279) : (!llvm.ptr, i64) -> i64
      %4281 = func.call @cc_intern(%4277, %4280) : (i64, i64) -> i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_cons(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_values_pack(%4283) : (i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4285 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4286 = arith.constant 1 : i64
      %4287 = func.call @cc_make_string(%4285, %4286) : (!llvm.ptr, i64) -> i64
      %4288 = func.call @cc_nil_value() : () -> i64
      %4289 = func.call @cc_intern(%4287, %4288) : (i64, i64) -> i64
      %4290 = func.call @cc_nil_value() : () -> i64
      %4291 = func.call @cc_cons(%4289, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_values_pack(%4291) : (i64) -> i64
      func.call @stack_push_pointer(%4289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4293 = func.call @stack_pop_pointer() : () -> i64
      %4294 = func.call @stack_pop_pointer() : () -> i64
      %4295 = func.call @cc_cons(%4294, %4293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %4296 = arith.addi %4295, %__rlasp_stack_elide_zero_249 : i64
      %4297 = func.call @stack_pop_pointer() : () -> i64
      %4298 = func.call @cc_cons(%4297, %4296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4298) : (i64) -> ()
      %4299 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4300 = arith.constant 5 : i64
      %4301 = func.call @cc_make_string(%4299, %4300) : (!llvm.ptr, i64) -> i64
      %4302 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4303 = arith.constant 11 : i64
      %4304 = func.call @cc_make_string(%4302, %4303) : (!llvm.ptr, i64) -> i64
      %4305 = func.call @cc_intern(%4301, %4304) : (i64, i64) -> i64
      %4306 = func.call @cc_nil_value() : () -> i64
      %4307 = func.call @cc_cons(%4305, %4306) : (i64, i64) -> i64
      %4308 = func.call @cc_values_pack(%4307) : (i64) -> i64
      func.call @stack_push_pointer(%4305) : (i64) -> ()
      %4309 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4310 = arith.constant 1 : i64
      %4311 = func.call @cc_make_string(%4309, %4310) : (!llvm.ptr, i64) -> i64
      %4312 = func.call @cc_nil_value() : () -> i64
      %4313 = func.call @cc_intern(%4311, %4312) : (i64, i64) -> i64
      %4314 = func.call @cc_nil_value() : () -> i64
      %4315 = func.call @cc_cons(%4313, %4314) : (i64, i64) -> i64
      %4316 = func.call @cc_values_pack(%4315) : (i64) -> i64
      func.call @stack_push_pointer(%4313) : (i64) -> ()
      %4317 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4318 = arith.constant 13 : i64
      %4319 = func.call @cc_make_string(%4317, %4318) : (!llvm.ptr, i64) -> i64
      %4320 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4321 = arith.constant 11 : i64
      %4322 = func.call @cc_make_string(%4320, %4321) : (!llvm.ptr, i64) -> i64
      %4323 = func.call @cc_intern(%4319, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_nil_value() : () -> i64
      %4325 = func.call @cc_cons(%4323, %4324) : (i64, i64) -> i64
      %4326 = func.call @cc_values_pack(%4325) : (i64) -> i64
      func.call @stack_push_pointer(%4323) : (i64) -> ()
      %4327 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4328 = arith.constant 1 : i64
      %4329 = func.call @cc_make_string(%4327, %4328) : (!llvm.ptr, i64) -> i64
      %4330 = func.call @cc_nil_value() : () -> i64
      %4331 = func.call @cc_intern(%4329, %4330) : (i64, i64) -> i64
      %4332 = func.call @cc_nil_value() : () -> i64
      %4333 = func.call @cc_cons(%4331, %4332) : (i64, i64) -> i64
      %4334 = func.call @cc_values_pack(%4333) : (i64) -> i64
      func.call @stack_push_pointer(%4331) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4335 = func.call @stack_pop_pointer() : () -> i64
      %4336 = func.call @stack_pop_pointer() : () -> i64
      %4337 = func.call @cc_cons(%4336, %4335) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %4338 = arith.addi %4337, %__rlasp_stack_elide_zero_250 : i64
      %4339 = func.call @stack_pop_pointer() : () -> i64
      %4340 = func.call @cc_cons(%4339, %4338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4340) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @stack_pop_pointer() : () -> i64
      %4343 = func.call @cc_cons(%4342, %4341) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %4344 = arith.addi %4343, %__rlasp_stack_elide_zero_251 : i64
      %4345 = func.call @stack_pop_pointer() : () -> i64
      %4346 = func.call @cc_cons(%4345, %4344) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %4347 = arith.addi %4346, %__rlasp_stack_elide_zero_252 : i64
      %4348 = func.call @stack_pop_pointer() : () -> i64
      %4349 = func.call @cc_cons(%4348, %4347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4349) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4350 = func.call @stack_pop_pointer() : () -> i64
      %4351 = func.call @stack_pop_pointer() : () -> i64
      %4352 = func.call @cc_cons(%4351, %4350) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %4353 = arith.addi %4352, %__rlasp_stack_elide_zero_253 : i64
      %4354 = func.call @stack_pop_pointer() : () -> i64
      %4355 = func.call @cc_cons(%4354, %4353) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %4356 = arith.addi %4355, %__rlasp_stack_elide_zero_254 : i64
      %4357 = func.call @stack_pop_pointer() : () -> i64
      %4358 = func.call @cc_cons(%4357, %4356) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %4359 = arith.addi %4358, %__rlasp_stack_elide_zero_255 : i64
      %4360 = func.call @stack_pop_pointer() : () -> i64
      %4361 = func.call @cc_cons(%4360, %4359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4361) : (i64) -> ()
      %4362 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4363 = arith.constant 5 : i64
      %4364 = func.call @cc_make_string(%4362, %4363) : (!llvm.ptr, i64) -> i64
      %4365 = func.call @cc_nil_value() : () -> i64
      %4366 = func.call @cc_intern(%4364, %4365) : (i64, i64) -> i64
      %4367 = func.call @cc_nil_value() : () -> i64
      %4368 = func.call @cc_cons(%4366, %4367) : (i64, i64) -> i64
      %4369 = func.call @cc_values_pack(%4368) : (i64) -> i64
      func.call @stack_push_pointer(%4366) : (i64) -> ()
      %4370 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4371 = arith.constant 4 : i64
      %4372 = func.call @cc_make_string(%4370, %4371) : (!llvm.ptr, i64) -> i64
      %4373 = func.call @cc_nil_value() : () -> i64
      %4374 = func.call @cc_intern(%4372, %4373) : (i64, i64) -> i64
      %4375 = func.call @cc_nil_value() : () -> i64
      %4376 = func.call @cc_cons(%4374, %4375) : (i64, i64) -> i64
      %4377 = func.call @cc_values_pack(%4376) : (i64) -> i64
      func.call @stack_push_pointer(%4374) : (i64) -> ()
      %4378 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4379 = arith.constant 15 : i64
      %4380 = func.call @cc_make_string(%4378, %4379) : (!llvm.ptr, i64) -> i64
      %4381 = func.call @cc_nil_value() : () -> i64
      %4382 = func.call @cc_intern(%4380, %4381) : (i64, i64) -> i64
      %4383 = func.call @cc_nil_value() : () -> i64
      %4384 = func.call @cc_cons(%4382, %4383) : (i64, i64) -> i64
      %4385 = func.call @cc_values_pack(%4384) : (i64) -> i64
      func.call @stack_push_pointer(%4382) : (i64) -> ()
      %4386 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4387 = arith.constant 6 : i64
      %4388 = func.call @cc_make_string(%4386, %4387) : (!llvm.ptr, i64) -> i64
      %4389 = func.call @cc_nil_value() : () -> i64
      %4390 = func.call @cc_intern(%4388, %4389) : (i64, i64) -> i64
      %4391 = func.call @cc_nil_value() : () -> i64
      %4392 = func.call @cc_cons(%4390, %4391) : (i64, i64) -> i64
      %4393 = func.call @cc_values_pack(%4392) : (i64) -> i64
      func.call @stack_push_pointer(%4390) : (i64) -> ()
      %4394 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4395 = arith.constant 15 : i64
      %4396 = func.call @cc_make_string(%4394, %4395) : (!llvm.ptr, i64) -> i64
      %4397 = func.call @cc_nil_value() : () -> i64
      %4398 = func.call @cc_intern(%4396, %4397) : (i64, i64) -> i64
      %4399 = func.call @cc_nil_value() : () -> i64
      %4400 = func.call @cc_cons(%4398, %4399) : (i64, i64) -> i64
      %4401 = func.call @cc_values_pack(%4400) : (i64) -> i64
      func.call @stack_push_pointer(%4398) : (i64) -> ()
      %4402 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4403 = arith.constant 4 : i64
      %4404 = func.call @cc_make_string(%4402, %4403) : (!llvm.ptr, i64) -> i64
      %4405 = func.call @cc_nil_value() : () -> i64
      %4406 = func.call @cc_intern(%4404, %4405) : (i64, i64) -> i64
      %4407 = func.call @cc_nil_value() : () -> i64
      %4408 = func.call @cc_cons(%4406, %4407) : (i64, i64) -> i64
      %4409 = func.call @cc_values_pack(%4408) : (i64) -> i64
      func.call @stack_push_pointer(%4406) : (i64) -> ()
      %4410 = llvm.mlir.addressof @str332 : !llvm.ptr
      %4411 = arith.constant 4 : i64
      %4412 = func.call @cc_make_string(%4410, %4411) : (!llvm.ptr, i64) -> i64
      %4413 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4414 = arith.constant 11 : i64
      %4415 = func.call @cc_make_string(%4413, %4414) : (!llvm.ptr, i64) -> i64
      %4416 = func.call @cc_intern(%4412, %4415) : (i64, i64) -> i64
      %4417 = func.call @cc_nil_value() : () -> i64
      %4418 = func.call @cc_cons(%4416, %4417) : (i64, i64) -> i64
      %4419 = func.call @cc_values_pack(%4418) : (i64) -> i64
      func.call @stack_push_pointer(%4416) : (i64) -> ()
      %4420 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4421 = arith.constant 1 : i64
      %4422 = func.call @cc_make_string(%4420, %4421) : (!llvm.ptr, i64) -> i64
      %4423 = func.call @cc_nil_value() : () -> i64
      %4424 = func.call @cc_intern(%4422, %4423) : (i64, i64) -> i64
      %4425 = func.call @cc_nil_value() : () -> i64
      %4426 = func.call @cc_cons(%4424, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_values_pack(%4426) : (i64) -> i64
      func.call @stack_push_pointer(%4424) : (i64) -> ()
      %4428 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4429 = arith.constant 1 : i64
      %4430 = func.call @cc_make_string(%4428, %4429) : (!llvm.ptr, i64) -> i64
      %4431 = func.call @cc_nil_value() : () -> i64
      %4432 = func.call @cc_intern(%4430, %4431) : (i64, i64) -> i64
      %4433 = func.call @cc_nil_value() : () -> i64
      %4434 = func.call @cc_cons(%4432, %4433) : (i64, i64) -> i64
      %4435 = func.call @cc_values_pack(%4434) : (i64) -> i64
      func.call @stack_push_pointer(%4432) : (i64) -> ()
      %4436 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4437 = arith.constant 9 : i64
      %4438 = func.call @cc_make_string(%4436, %4437) : (!llvm.ptr, i64) -> i64
      %4439 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4440 = arith.constant 11 : i64
      %4441 = func.call @cc_make_string(%4439, %4440) : (!llvm.ptr, i64) -> i64
      %4442 = func.call @cc_intern(%4438, %4441) : (i64, i64) -> i64
      %4443 = func.call @cc_nil_value() : () -> i64
      %4444 = func.call @cc_cons(%4442, %4443) : (i64, i64) -> i64
      %4445 = func.call @cc_values_pack(%4444) : (i64) -> i64
      func.call @stack_push_pointer(%4442) : (i64) -> ()
      %4446 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4447 = arith.constant 1 : i64
      %4448 = func.call @cc_make_string(%4446, %4447) : (!llvm.ptr, i64) -> i64
      %4449 = func.call @cc_nil_value() : () -> i64
      %4450 = func.call @cc_intern(%4448, %4449) : (i64, i64) -> i64
      %4451 = func.call @cc_nil_value() : () -> i64
      %4452 = func.call @cc_cons(%4450, %4451) : (i64, i64) -> i64
      %4453 = func.call @cc_values_pack(%4452) : (i64) -> i64
      func.call @stack_push_pointer(%4450) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4454 = func.call @stack_pop_pointer() : () -> i64
      %4455 = func.call @stack_pop_pointer() : () -> i64
      %4456 = func.call @cc_cons(%4455, %4454) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %4457 = arith.addi %4456, %__rlasp_stack_elide_zero_256 : i64
      %4458 = func.call @stack_pop_pointer() : () -> i64
      %4459 = func.call @cc_cons(%4458, %4457) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4460 = func.call @stack_pop_pointer() : () -> i64
      %4461 = func.call @stack_pop_pointer() : () -> i64
      %4462 = func.call @cc_cons(%4461, %4460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %4463 = arith.addi %4462, %__rlasp_stack_elide_zero_257 : i64
      %4464 = func.call @stack_pop_pointer() : () -> i64
      %4465 = func.call @cc_cons(%4464, %4463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %4466 = arith.addi %4465, %__rlasp_stack_elide_zero_258 : i64
      %4467 = func.call @stack_pop_pointer() : () -> i64
      %4468 = func.call @cc_cons(%4467, %4466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %4469 = arith.addi %4468, %__rlasp_stack_elide_zero_259 : i64
      %4470 = func.call @stack_pop_pointer() : () -> i64
      %4471 = func.call @cc_cons(%4470, %4469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4472 = func.call @stack_pop_pointer() : () -> i64
      %4473 = func.call @stack_pop_pointer() : () -> i64
      %4474 = func.call @cc_cons(%4473, %4472) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %4475 = arith.addi %4474, %__rlasp_stack_elide_zero_260 : i64
      %4476 = func.call @stack_pop_pointer() : () -> i64
      %4477 = func.call @cc_cons(%4476, %4475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4478 = func.call @stack_pop_pointer() : () -> i64
      %4479 = func.call @stack_pop_pointer() : () -> i64
      %4480 = func.call @cc_cons(%4479, %4478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %4481 = arith.addi %4480, %__rlasp_stack_elide_zero_261 : i64
      %4482 = func.call @stack_pop_pointer() : () -> i64
      %4483 = func.call @cc_cons(%4482, %4481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %4484 = arith.addi %4483, %__rlasp_stack_elide_zero_262 : i64
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @cc_cons(%4485, %4484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4487 = func.call @stack_pop_pointer() : () -> i64
      %4488 = func.call @stack_pop_pointer() : () -> i64
      %4489 = func.call @cc_cons(%4488, %4487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %4490 = arith.addi %4489, %__rlasp_stack_elide_zero_263 : i64
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @cc_cons(%4491, %4490) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %4493 = arith.addi %4492, %__rlasp_stack_elide_zero_264 : i64
      %4494 = func.call @stack_pop_pointer() : () -> i64
      %4495 = func.call @cc_cons(%4494, %4493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4495) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4496 = func.call @stack_pop_pointer() : () -> i64
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @cc_cons(%4497, %4496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %4499 = arith.addi %4498, %__rlasp_stack_elide_zero_265 : i64
      %4500 = func.call @stack_pop_pointer() : () -> i64
      %4501 = func.call @cc_cons(%4500, %4499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = func.call @stack_pop_pointer() : () -> i64
      %4504 = func.call @cc_cons(%4503, %4502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %4505 = arith.addi %4504, %__rlasp_stack_elide_zero_266 : i64
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @cc_cons(%4506, %4505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %4508 = arith.addi %4507, %__rlasp_stack_elide_zero_267 : i64
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @cc_cons(%4509, %4508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %4511 = arith.addi %4510, %__rlasp_stack_elide_zero_268 : i64
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @cc_cons(%4512, %4511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4513) : (i64) -> ()
      %4514 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4515 = arith.constant 4 : i64
      %4516 = func.call @cc_make_string(%4514, %4515) : (!llvm.ptr, i64) -> i64
      %4517 = func.call @cc_nil_value() : () -> i64
      %4518 = func.call @cc_intern(%4516, %4517) : (i64, i64) -> i64
      %4519 = func.call @cc_nil_value() : () -> i64
      %4520 = func.call @cc_cons(%4518, %4519) : (i64, i64) -> i64
      %4521 = func.call @cc_values_pack(%4520) : (i64) -> i64
      func.call @stack_push_pointer(%4518) : (i64) -> ()
      %4522 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4523 = arith.constant 1 : i64
      %4524 = func.call @cc_make_string(%4522, %4523) : (!llvm.ptr, i64) -> i64
      %4525 = func.call @cc_nil_value() : () -> i64
      %4526 = func.call @cc_intern(%4524, %4525) : (i64, i64) -> i64
      %4527 = func.call @cc_nil_value() : () -> i64
      %4528 = func.call @cc_cons(%4526, %4527) : (i64, i64) -> i64
      %4529 = func.call @cc_values_pack(%4528) : (i64) -> i64
      func.call @stack_push_pointer(%4526) : (i64) -> ()
      %4530 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4531 = arith.constant 1 : i64
      %4532 = func.call @cc_make_string(%4530, %4531) : (!llvm.ptr, i64) -> i64
      %4533 = func.call @cc_nil_value() : () -> i64
      %4534 = func.call @cc_intern(%4532, %4533) : (i64, i64) -> i64
      %4535 = func.call @cc_nil_value() : () -> i64
      %4536 = func.call @cc_cons(%4534, %4535) : (i64, i64) -> i64
      %4537 = func.call @cc_values_pack(%4536) : (i64) -> i64
      func.call @stack_push_pointer(%4534) : (i64) -> ()
      %4538 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4539 = arith.constant 1 : i64
      %4540 = func.call @cc_make_string(%4538, %4539) : (!llvm.ptr, i64) -> i64
      %4541 = func.call @cc_nil_value() : () -> i64
      %4542 = func.call @cc_intern(%4540, %4541) : (i64, i64) -> i64
      %4543 = func.call @cc_nil_value() : () -> i64
      %4544 = func.call @cc_cons(%4542, %4543) : (i64, i64) -> i64
      %4545 = func.call @cc_values_pack(%4544) : (i64) -> i64
      func.call @stack_push_pointer(%4542) : (i64) -> ()
      %4546 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4547 = func.call @stack_pop_pointer() : () -> i64
      %4548 = func.call @stack_pop_pointer() : () -> i64
      %4549 = func.call @cc_cons(%4548, %4547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %4550 = arith.addi %4549, %__rlasp_stack_elide_zero_269 : i64
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = func.call @cc_cons(%4551, %4550) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %4553 = arith.addi %4552, %__rlasp_stack_elide_zero_270 : i64
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = func.call @cc_cons(%4554, %4553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = func.call @stack_pop_pointer() : () -> i64
      %4558 = func.call @cc_cons(%4557, %4556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %4559 = arith.addi %4558, %__rlasp_stack_elide_zero_271 : i64
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_cons(%4560, %4559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %4562 = arith.addi %4561, %__rlasp_stack_elide_zero_272 : i64
      %4563 = func.call @stack_pop_pointer() : () -> i64
      %4564 = func.call @cc_cons(%4563, %4562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4564) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4565 = func.call @stack_pop_pointer() : () -> i64
      %4566 = func.call @stack_pop_pointer() : () -> i64
      %4567 = func.call @cc_cons(%4566, %4565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %4568 = arith.addi %4567, %__rlasp_stack_elide_zero_273 : i64
      %4569 = func.call @stack_pop_pointer() : () -> i64
      %4570 = func.call @cc_cons(%4569, %4568) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %4571 = arith.addi %4570, %__rlasp_stack_elide_zero_274 : i64
      %4572 = func.call @stack_pop_pointer() : () -> i64
      %4573 = func.call @cc_cons(%4572, %4571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %4574 = arith.addi %4573, %__rlasp_stack_elide_zero_275 : i64
      %4575 = func.call @stack_pop_pointer() : () -> i64
      %4576 = func.call @cc_cons(%4575, %4574) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %4577 = arith.addi %4576, %__rlasp_stack_elide_zero_276 : i64
      %4578 = func.call @stack_pop_pointer() : () -> i64
      %4579 = func.call @cc_cons(%4578, %4577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %4580 = arith.addi %4579, %__rlasp_stack_elide_zero_277 : i64
      %4581 = func.call @stack_pop_pointer() : () -> i64
      %4582 = func.call @cc_cons(%4581, %4580) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %4583 = arith.addi %4582, %__rlasp_stack_elide_zero_278 : i64
      %4584 = func.call @stack_pop_pointer() : () -> i64
      %4585 = func.call @cc_cons(%4584, %4583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4585) : (i64) -> ()
      %4586 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4587 = arith.constant 2 : i64
      %4588 = func.call @cc_make_string(%4586, %4587) : (!llvm.ptr, i64) -> i64
      %4589 = func.call @cc_nil_value() : () -> i64
      %4590 = func.call @cc_intern(%4588, %4589) : (i64, i64) -> i64
      %4591 = func.call @cc_nil_value() : () -> i64
      %4592 = func.call @cc_cons(%4590, %4591) : (i64, i64) -> i64
      %4593 = func.call @cc_values_pack(%4592) : (i64) -> i64
      func.call @stack_push_pointer(%4590) : (i64) -> ()
      %4594 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4595 = arith.constant 17 : i64
      %4596 = func.call @cc_make_string(%4594, %4595) : (!llvm.ptr, i64) -> i64
      %4597 = func.call @cc_nil_value() : () -> i64
      %4598 = func.call @cc_intern(%4596, %4597) : (i64, i64) -> i64
      %4599 = func.call @cc_nil_value() : () -> i64
      %4600 = func.call @cc_cons(%4598, %4599) : (i64, i64) -> i64
      %4601 = func.call @cc_values_pack(%4600) : (i64) -> i64
      func.call @stack_push_pointer(%4598) : (i64) -> ()
      %4602 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4603 = arith.constant 5 : i64
      %4604 = func.call @cc_make_string(%4602, %4603) : (!llvm.ptr, i64) -> i64
      %4605 = func.call @cc_nil_value() : () -> i64
      %4606 = func.call @cc_intern(%4604, %4605) : (i64, i64) -> i64
      %4607 = func.call @cc_nil_value() : () -> i64
      %4608 = func.call @cc_cons(%4606, %4607) : (i64, i64) -> i64
      %4609 = func.call @cc_values_pack(%4608) : (i64) -> i64
      func.call @stack_push_pointer(%4606) : (i64) -> ()
      %4610 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4611 = arith.constant 4 : i64
      %4612 = func.call @cc_make_string(%4610, %4611) : (!llvm.ptr, i64) -> i64
      %4613 = func.call @cc_nil_value() : () -> i64
      %4614 = func.call @cc_intern(%4612, %4613) : (i64, i64) -> i64
      %4615 = func.call @cc_nil_value() : () -> i64
      %4616 = func.call @cc_cons(%4614, %4615) : (i64, i64) -> i64
      %4617 = func.call @cc_values_pack(%4616) : (i64) -> i64
      func.call @stack_push_pointer(%4614) : (i64) -> ()
      %4618 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4619 = arith.constant 1 : i64
      %4620 = func.call @cc_make_string(%4618, %4619) : (!llvm.ptr, i64) -> i64
      %4621 = func.call @cc_nil_value() : () -> i64
      %4622 = func.call @cc_intern(%4620, %4621) : (i64, i64) -> i64
      %4623 = func.call @cc_nil_value() : () -> i64
      %4624 = func.call @cc_cons(%4622, %4623) : (i64, i64) -> i64
      %4625 = func.call @cc_values_pack(%4624) : (i64) -> i64
      func.call @stack_push_pointer(%4622) : (i64) -> ()
      %4626 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4627 = arith.constant 19 : i64
      %4628 = func.call @cc_make_string(%4626, %4627) : (!llvm.ptr, i64) -> i64
      %4629 = func.call @cc_nil_value() : () -> i64
      %4630 = func.call @cc_intern(%4628, %4629) : (i64, i64) -> i64
      %4631 = func.call @cc_nil_value() : () -> i64
      %4632 = func.call @cc_cons(%4630, %4631) : (i64, i64) -> i64
      %4633 = func.call @cc_values_pack(%4632) : (i64) -> i64
      func.call @stack_push_pointer(%4630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4634 = func.call @stack_pop_pointer() : () -> i64
      %4635 = func.call @stack_pop_pointer() : () -> i64
      %4636 = func.call @cc_cons(%4635, %4634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %4637 = arith.addi %4636, %__rlasp_stack_elide_zero_279 : i64
      %4638 = func.call @stack_pop_pointer() : () -> i64
      %4639 = func.call @cc_cons(%4638, %4637) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %4640 = arith.addi %4639, %__rlasp_stack_elide_zero_280 : i64
      %4641 = func.call @stack_pop_pointer() : () -> i64
      %4642 = func.call @cc_cons(%4641, %4640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4642) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4643 = func.call @stack_pop_pointer() : () -> i64
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @cc_cons(%4644, %4643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %4646 = arith.addi %4645, %__rlasp_stack_elide_zero_281 : i64
      %4647 = func.call @stack_pop_pointer() : () -> i64
      %4648 = func.call @cc_cons(%4647, %4646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4649 = func.call @stack_pop_pointer() : () -> i64
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @cc_cons(%4650, %4649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %4652 = arith.addi %4651, %__rlasp_stack_elide_zero_282 : i64
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @cc_cons(%4653, %4652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %4655 = arith.addi %4654, %__rlasp_stack_elide_zero_283 : i64
      %4656 = func.call @stack_pop_pointer() : () -> i64
      %4657 = func.call @cc_cons(%4656, %4655) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %4658 = arith.addi %4657, %__rlasp_stack_elide_zero_284 : i64
      %4659 = func.call @stack_pop_pointer() : () -> i64
      %4660 = func.call @cc_cons(%4659, %4658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4660) : (i64) -> ()
      %4661 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4662 = arith.constant 15 : i64
      %4663 = func.call @cc_make_string(%4661, %4662) : (!llvm.ptr, i64) -> i64
      %4664 = func.call @cc_nil_value() : () -> i64
      %4665 = func.call @cc_intern(%4663, %4664) : (i64, i64) -> i64
      %4666 = func.call @cc_nil_value() : () -> i64
      %4667 = func.call @cc_cons(%4665, %4666) : (i64, i64) -> i64
      %4668 = func.call @cc_values_pack(%4667) : (i64) -> i64
      func.call @stack_push_pointer(%4665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4669 = func.call @stack_pop_pointer() : () -> i64
      %4670 = func.call @stack_pop_pointer() : () -> i64
      %4671 = func.call @cc_cons(%4670, %4669) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %4672 = arith.addi %4671, %__rlasp_stack_elide_zero_285 : i64
      %4673 = func.call @stack_pop_pointer() : () -> i64
      %4674 = func.call @cc_cons(%4673, %4672) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %4675 = arith.addi %4674, %__rlasp_stack_elide_zero_286 : i64
      %4676 = func.call @stack_pop_pointer() : () -> i64
      %4677 = func.call @cc_cons(%4676, %4675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %4678 = arith.addi %4677, %__rlasp_stack_elide_zero_287 : i64
      %4679 = func.call @stack_pop_pointer() : () -> i64
      %4680 = func.call @cc_cons(%4679, %4678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %4681 = arith.addi %4680, %__rlasp_stack_elide_zero_288 : i64
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = func.call @cc_cons(%4682, %4681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4684 = func.call @stack_pop_pointer() : () -> i64
      %4685 = func.call @stack_pop_pointer() : () -> i64
      %4686 = func.call @cc_cons(%4685, %4684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %4687 = arith.addi %4686, %__rlasp_stack_elide_zero_289 : i64
      %4688 = func.call @stack_pop_pointer() : () -> i64
      %4689 = func.call @cc_cons(%4688, %4687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %4690 = arith.addi %4689, %__rlasp_stack_elide_zero_290 : i64
      %4691 = func.call @stack_pop_pointer() : () -> i64
      %4692 = func.call @cc_cons(%4691, %4690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %4693 = arith.addi %4692, %__rlasp_stack_elide_zero_291 : i64
      %4992 = arith.constant 271595545296905 : i64
      %4993 = arith.constant 0 : i64
      %4994 = func.call @cc_make_closure(%4992, %4993) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %4995 = arith.addi %4994, %__rlasp_stack_elide_zero_292 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @stack_pop_pointer() : () -> i64
      %4998 = func.call @cc_cons(%4997, %4996) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %4999 = arith.addi %4998, %__rlasp_stack_elide_zero_293 : i64
      %5000 = llvm.mlir.addressof @str360 : !llvm.ptr
      %5001 = arith.constant 11 : i64
      %5002 = func.call @cc_make_string(%5000, %5001) : (!llvm.ptr, i64) -> i64
      %5003 = llvm.mlir.addressof @str361 : !llvm.ptr
      %5004 = arith.constant 7 : i64
      %5005 = func.call @cc_make_string(%5003, %5004) : (!llvm.ptr, i64) -> i64
      %5006 = func.call @cc_intern(%5002, %5005) : (i64, i64) -> i64
      %5007 = func.call @cc_nil_value() : () -> i64
      %5008 = func.call @cc_cons(%5006, %5007) : (i64, i64) -> i64
      %5009 = func.call @cc_values_pack(%5008) : (i64) -> i64
      %5010 = func.call @cc_nil_value() : () -> i64
      %5011 = llvm.mlir.addressof @str362 : !llvm.ptr
      %5012 = arith.constant 4 : i64
      %5013 = func.call @cc_make_string(%5011, %5012) : (!llvm.ptr, i64) -> i64
      %5014 = llvm.mlir.addressof @str363 : !llvm.ptr
      %5015 = arith.constant 7 : i64
      %5016 = func.call @cc_make_string(%5014, %5015) : (!llvm.ptr, i64) -> i64
      %5017 = func.call @cc_intern(%5013, %5016) : (i64, i64) -> i64
      %5018 = func.call @cc_nil_value() : () -> i64
      %5019 = func.call @cc_cons(%5017, %5018) : (i64, i64) -> i64
      %5020 = func.call @cc_values_pack(%5019) : (i64) -> i64
      %5021 = llvm.mlir.addressof @str364 : !llvm.ptr
      %5022 = arith.constant 6 : i64
      %5023 = func.call @cc_make_string(%5021, %5022) : (!llvm.ptr, i64) -> i64
      %5024 = func.call @cc_nil_value() : () -> i64
      %5025 = func.call @cc_intern(%5023, %5024) : (i64, i64) -> i64
      %5026 = func.call @cc_nil_value() : () -> i64
      %5027 = func.call @cc_cons(%5025, %5026) : (i64, i64) -> i64
      %5028 = func.call @cc_values_pack(%5027) : (i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %5029 = arith.addi %5025, %__rlasp_stack_elide_zero_294 : i64
      %5030 = func.call @cc_nil_value() : () -> i64
      %5031 = func.call @cc_errorp(%3993) : (i64) -> i64
      %5032 = arith.cmpi ne, %5031, %5030 : i64
      %5033 = arith.cmpi eq, %5030, %5030 : i64
      %5034 = arith.andi %5032, %5033 : i1
      %5035 = scf.if %5034 -> (i64) {
        scf.yield %3993 : i64
      } else {
        scf.yield %5030 : i64
      }
      %5036 = func.call @cc_errorp(%4693) : (i64) -> i64
      %5037 = arith.cmpi ne, %5036, %5030 : i64
      %5038 = arith.cmpi eq, %5035, %5030 : i64
      %5039 = arith.andi %5037, %5038 : i1
      %5040 = scf.if %5039 -> (i64) {
        scf.yield %4693 : i64
      } else {
        scf.yield %5035 : i64
      }
      %5041 = func.call @cc_errorp(%4995) : (i64) -> i64
      %5042 = arith.cmpi ne, %5041, %5030 : i64
      %5043 = arith.cmpi eq, %5040, %5030 : i64
      %5044 = arith.andi %5042, %5043 : i1
      %5045 = scf.if %5044 -> (i64) {
        scf.yield %4995 : i64
      } else {
        scf.yield %5040 : i64
      }
      %5046 = func.call @cc_errorp(%4999) : (i64) -> i64
      %5047 = arith.cmpi ne, %5046, %5030 : i64
      %5048 = arith.cmpi eq, %5045, %5030 : i64
      %5049 = arith.andi %5047, %5048 : i1
      %5050 = scf.if %5049 -> (i64) {
        scf.yield %4999 : i64
      } else {
        scf.yield %5045 : i64
      }
      %5051 = func.call @cc_errorp(%5006) : (i64) -> i64
      %5052 = arith.cmpi ne, %5051, %5030 : i64
      %5053 = arith.cmpi eq, %5050, %5030 : i64
      %5054 = arith.andi %5052, %5053 : i1
      %5055 = scf.if %5054 -> (i64) {
        scf.yield %5006 : i64
      } else {
        scf.yield %5050 : i64
      }
      %5056 = func.call @cc_errorp(%5010) : (i64) -> i64
      %5057 = arith.cmpi ne, %5056, %5030 : i64
      %5058 = arith.cmpi eq, %5055, %5030 : i64
      %5059 = arith.andi %5057, %5058 : i1
      %5060 = scf.if %5059 -> (i64) {
        scf.yield %5010 : i64
      } else {
        scf.yield %5055 : i64
      }
      %5061 = func.call @cc_errorp(%5017) : (i64) -> i64
      %5062 = arith.cmpi ne, %5061, %5030 : i64
      %5063 = arith.cmpi eq, %5060, %5030 : i64
      %5064 = arith.andi %5062, %5063 : i1
      %5065 = scf.if %5064 -> (i64) {
        scf.yield %5017 : i64
      } else {
        scf.yield %5060 : i64
      }
      %5066 = func.call @cc_errorp(%5029) : (i64) -> i64
      %5067 = arith.cmpi ne, %5066, %5030 : i64
      %5068 = arith.cmpi eq, %5065, %5030 : i64
      %5069 = arith.andi %5067, %5068 : i1
      %5070 = scf.if %5069 -> (i64) {
        scf.yield %5029 : i64
      } else {
        scf.yield %5065 : i64
      }
      %5071 = arith.cmpi ne, %5070, %5030 : i64
      scf.if %5071 {
        func.call @stack_push_pointer(%5070) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3993) : (i64) -> ()
        func.call @stack_push_pointer(%4693) : (i64) -> ()
        func.call @stack_push_pointer(%4995) : (i64) -> ()
        func.call @stack_push_pointer(%4999) : (i64) -> ()
        func.call @stack_push_pointer(%5006) : (i64) -> ()
        func.call @stack_push_pointer(%5010) : (i64) -> ()
        func.call @stack_push_pointer(%5017) : (i64) -> ()
        func.call @stack_push_pointer(%5029) : (i64) -> ()
        %5072 = llvm.mlir.addressof @str365 : !llvm.ptr
        %5073 = func.call @cc_make_function_ref_const(%5072) : (!llvm.ptr) -> i64
        %5074 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5073, %5074) : (i64, i64) -> ()
      }
      %5075 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5075 : i64
    }
    %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
    %5076 = arith.addi %3984, %__rlasp_stack_elide_zero_295 : i64
    %5077 = func.call @cc_multiple_value_list(%5076) : (i64) -> i64
    %5078 = llvm.mlir.addressof @str366 : !llvm.ptr
    %5079 = arith.constant 38 : i64
    %5080 = func.call @cc_make_string(%5078, %5079) : (!llvm.ptr, i64) -> i64
    %5081 = func.call @cc_nil_value() : () -> i64
    %5082 = func.call @cc_intern(%5080, %5081) : (i64, i64) -> i64
    %5083 = func.call @cc_nil_value() : () -> i64
    %5084 = func.call @cc_cons(%5082, %5083) : (i64, i64) -> i64
    %5085 = func.call @cc_values_pack(%5084) : (i64) -> i64
    %5086 = func.call @cc_symbol_value(%5082) : (i64) -> i64
    %5087 = llvm.mlir.addressof @str367 : !llvm.ptr
    %5088 = arith.constant 40 : i64
    %5089 = func.call @cc_make_string(%5087, %5088) : (!llvm.ptr, i64) -> i64
    %5090 = func.call @cc_nil_value() : () -> i64
    %5091 = func.call @cc_intern(%5089, %5090) : (i64, i64) -> i64
    %5092 = func.call @cc_nil_value() : () -> i64
    %5093 = func.call @cc_cons(%5091, %5092) : (i64, i64) -> i64
    %5094 = func.call @cc_values_pack(%5093) : (i64) -> i64
    %5095 = func.call @cc_symbol_value(%5091) : (i64) -> i64
    %5096 = func.call @cc_nil_value() : () -> i64
    %5097 = arith.cmpi ne, %5086, %5096 : i64
    %5098 = scf.if %5097 -> (i64) {
      scf.yield %5095 : i64
    } else {
      scf.yield %5077 : i64
    }
    %5099 = func.call @cc_values_pack(%5098) : (i64) -> i64
    func.call @stack_push_pointer(%5099) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296897"() {
    %84 = func.call @cc_nil_value() : () -> i64
    %85 = func.call @cc_nil_value() : () -> i64
    %86 = func.call @cc_errorp(%84) : (i64) -> i64
    %87 = arith.cmpi ne, %86, %85 : i64
    %88 = scf.if %87 -> (i64) {
      scf.yield %84 : i64
    } else {
      %89 = arith.constant 1024 : i64
      %90 = func.call @cc_box_character(%89) : (i64) -> i64
      %91 = func.call @cc_nil_value() : () -> i64
      %92 = func.call @cc_errorp(%90) : (i64) -> i64
      %93 = arith.cmpi ne, %92, %91 : i64
      %94 = arith.cmpi eq, %91, %91 : i64
      %95 = arith.andi %93, %94 : i1
      %96 = scf.if %95 -> (i64) {
        scf.yield %90 : i64
      } else {
        scf.yield %91 : i64
      }
      %97 = arith.cmpi ne, %96, %91 : i64
      scf.if %97 {
        func.call @stack_push_pointer(%96) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%90) : (i64) -> ()
        %98 = llvm.mlir.addressof @str8 : !llvm.ptr
        %99 = func.call @cc_make_function_ref_const(%98) : (!llvm.ptr) -> i64
        %100 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%99, %100) : (i64, i64) -> ()
      }
      %101 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %101 : i64
    }
    func.call @stack_push_pointer(%88) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296898"() {
    %220 = func.call @cc_nil_value() : () -> i64
    %221 = func.call @cc_nil_value() : () -> i64
    %222 = func.call @cc_errorp(%220) : (i64) -> i64
    %223 = arith.cmpi ne, %222, %221 : i64
    %224 = scf.if %223 -> (i64) {
      scf.yield %220 : i64
    } else {
      %225 = arith.constant 1104 : i64
      %226 = func.call @cc_box_character(%225) : (i64) -> i64
      %227 = func.call @cc_nil_value() : () -> i64
      %228 = func.call @cc_errorp(%226) : (i64) -> i64
      %229 = arith.cmpi ne, %228, %227 : i64
      %230 = arith.cmpi eq, %227, %227 : i64
      %231 = arith.andi %229, %230 : i1
      %232 = scf.if %231 -> (i64) {
        scf.yield %226 : i64
      } else {
        scf.yield %227 : i64
      }
      %233 = arith.cmpi ne, %232, %227 : i64
      scf.if %233 {
        func.call @stack_push_pointer(%232) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%226) : (i64) -> ()
        %234 = llvm.mlir.addressof @str18 : !llvm.ptr
        %235 = func.call @cc_make_function_ref_const(%234) : (!llvm.ptr) -> i64
        %236 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%235, %236) : (i64, i64) -> ()
      }
      %237 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %237 : i64
    }
    func.call @stack_push_pointer(%224) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296899"() {
    %1184 = func.call @cc_nil_value() : () -> i64
    %1185 = func.call @cc_nil_value() : () -> i64
    %1186 = func.call @cc_errorp(%1184) : (i64) -> i64
    %1187 = arith.cmpi ne, %1186, %1185 : i64
    %1188 = scf.if %1187 -> (i64) {
      scf.yield %1184 : i64
    } else {
      %1189 = arith.constant 0 : i64
      %1190 = func.call @cc_box_fixnum(%1189) : (i64) -> i64
      %1191 = func.call @cc_nil_value() : () -> i64
      %1192 = func.call @cc_nil_value() : () -> i64
      %1193 = func.call @cc_nil_value() : () -> i64
      %1194 = func.call @cc_nil_value() : () -> i64
      %1195 = func.call @cc_nil_value() : () -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_errorp(%1195) : (i64) -> i64
      %1198 = arith.cmpi ne, %1197, %1196 : i64
      %1199:6 = scf.if %1198 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %1195, %1194, %1191, %1193, %1190, %1192 : i64, i64, i64, i64, i64, i64
      } else {
        %1200 = func.call @cc_nil_value() : () -> i64
        %1201 = llvm.mlir.addressof @str101 : !llvm.ptr
        %1202 = arith.constant 38 : i64
        %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
        %1204 = func.call @cc_nil_value() : () -> i64
        %1205 = func.call @cc_intern(%1203, %1204) : (i64, i64) -> i64
        %1206 = func.call @cc_nil_value() : () -> i64
        %1207 = func.call @cc_cons(%1205, %1206) : (i64, i64) -> i64
        %1208 = func.call @cc_values_pack(%1207) : (i64) -> i64
        %1209 = func.call @cc_set_symbol_value(%1205, %1200) : (i64, i64) -> i64
        %1210 = llvm.mlir.addressof @str102 : !llvm.ptr
        %1211 = arith.constant 39 : i64
        %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
        %1213 = func.call @cc_nil_value() : () -> i64
        %1214 = func.call @cc_intern(%1212, %1213) : (i64, i64) -> i64
        %1215 = func.call @cc_nil_value() : () -> i64
        %1216 = func.call @cc_cons(%1214, %1215) : (i64, i64) -> i64
        %1217 = func.call @cc_values_pack(%1216) : (i64) -> i64
        %1218 = func.call @cc_set_symbol_value(%1214, %1200) : (i64, i64) -> i64
        %1219 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1220 = arith.constant 40 : i64
        %1221 = func.call @cc_make_string(%1219, %1220) : (!llvm.ptr, i64) -> i64
        %1222 = func.call @cc_nil_value() : () -> i64
        %1223 = func.call @cc_intern(%1221, %1222) : (i64, i64) -> i64
        %1224 = func.call @cc_nil_value() : () -> i64
        %1225 = func.call @cc_cons(%1223, %1224) : (i64, i64) -> i64
        %1226 = func.call @cc_values_pack(%1225) : (i64) -> i64
        %1227 = func.call @cc_set_symbol_value(%1223, %1200) : (i64, i64) -> i64
        %1228:5 = scf.while (%arg0 = %1194, %arg1 = %1191, %arg2 = %1192, %arg3 = %1193, %arg4 = %1190) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
          %1229 = arith.addi %arg4, %__rlasp_stack_elide_zero_296 : i64
          %1230 = arith.constant 55296 : i64
          %1231 = func.call @cc_box_fixnum(%1230) : (i64) -> i64
          %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
          %1232 = arith.addi %1231, %__rlasp_stack_elide_zero_297 : i64
          %1233 = arith.constant 1 : i1
          %1235 = arith.constant 3 : i64
          %1234 = arith.andi %1229, %1235 : i64
          %1236 = arith.constant 0 : i64
          %1237 = arith.cmpi eq, %1234, %1236 : i64
          %1239 = arith.constant 3 : i64
          %1238 = arith.andi %1232, %1239 : i64
          %1240 = arith.constant 0 : i64
          %1241 = arith.cmpi eq, %1238, %1240 : i64
          %1242 = arith.andi %1237, %1241 : i1
          %1243 = scf.if %1242 -> (i1) {
            %1244 = arith.constant 2 : i64
            %1245 = arith.shrsi %1229, %1244 : i64
            %1246 = arith.constant 2 : i64
            %1247 = arith.shrsi %1232, %1246 : i64
            %1248 = arith.cmpi slt, %1245, %1247 : i64
            scf.yield %1248 : i1
          } else {
            %1249 = func.call @cc_lt(%1229, %1232) : (i64, i64) -> i64
            %1250 = func.call @cc_nil_value() : () -> i64
            %1251 = arith.cmpi ne, %1249, %1250 : i64
            scf.yield %1251 : i1
          }
          %1252 = arith.andi %1233, %1243 : i1
          %1253 = func.call @cc_nil_value() : () -> i64
          %1254 = func.call @cc_t_value() : () -> i64
          %1255 = scf.if %1252 -> (i64) {
            scf.yield %1254 : i64
          } else {
            scf.yield %1253 : i64
          }
          %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
          %1256 = arith.addi %1255, %__rlasp_stack_elide_zero_298 : i64
          %1257 = func.call @cc_nil_value() : () -> i64
          %1258 = arith.cmpi ne, %1256, %1257 : i64
          %1259 = func.call @cc_nil_value() : () -> i64
          %1260 = llvm.mlir.addressof @str104 : !llvm.ptr
          %1261 = arith.constant 38 : i64
          %1262 = func.call @cc_make_string(%1260, %1261) : (!llvm.ptr, i64) -> i64
          %1263 = func.call @cc_nil_value() : () -> i64
          %1264 = func.call @cc_intern(%1262, %1263) : (i64, i64) -> i64
          %1265 = func.call @cc_nil_value() : () -> i64
          %1266 = func.call @cc_cons(%1264, %1265) : (i64, i64) -> i64
          %1267 = func.call @cc_values_pack(%1266) : (i64) -> i64
          %1268 = func.call @cc_symbol_value(%1264) : (i64) -> i64
          %1269 = arith.cmpi ne, %1268, %1259 : i64
          %1270 = llvm.mlir.addressof @str105 : !llvm.ptr
          %1271 = arith.constant 38 : i64
          %1272 = func.call @cc_make_string(%1270, %1271) : (!llvm.ptr, i64) -> i64
          %1273 = func.call @cc_nil_value() : () -> i64
          %1274 = func.call @cc_intern(%1272, %1273) : (i64, i64) -> i64
          %1275 = func.call @cc_nil_value() : () -> i64
          %1276 = func.call @cc_cons(%1274, %1275) : (i64, i64) -> i64
          %1277 = func.call @cc_values_pack(%1276) : (i64) -> i64
          %1278 = func.call @cc_symbol_value(%1274) : (i64) -> i64
          %1279 = arith.cmpi ne, %1278, %1259 : i64
          %1280 = arith.ori %1269, %1279 : i1
          %1281 = arith.constant 0 : i1
          %1282 = arith.cmpi eq, %1280, %1281 : i1
          %1283 = arith.andi %1258, %1282 : i1
          scf.condition(%1283) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%1284: i64, %1285: i64, %1286: i64, %1287: i64, %1288: i64):
          %1289 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%1289) : (i64) -> ()
          %1290 = func.call @stack_depth() : () -> i64
          %1291 = arith.constant 0 : i64
          %1292 = arith.cmpi sgt, %1290, %1291 : i64
          scf.if %1292 {
            %1293 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1288) : (i64) -> ()
          %1294 = func.call @stack_depth() : () -> i64
          %1295 = arith.constant 0 : i64
          %1296 = arith.cmpi sgt, %1294, %1295 : i64
          scf.if %1296 {
            %1297 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
          %1298 = arith.addi %1288, %__rlasp_stack_elide_zero_299 : i64
          %1299 = func.call @cc_unbox_fixnum(%1298) : (i64) -> i64
          %1300 = func.call @cc_box_character(%1299) : (i64) -> i64
          %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
          %1301 = arith.addi %1300, %__rlasp_stack_elide_zero_300 : i64
          func.call @stack_push_pointer(%1301) : (i64) -> ()
          %1302 = func.call @stack_depth() : () -> i64
          %1303 = arith.constant 0 : i64
          %1304 = arith.cmpi sgt, %1302, %1303 : i64
          scf.if %1304 {
            %1305 = func.call @stack_pop_pointer() : () -> i64
          }
          %1306 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
          %1307 = arith.addi %1301, %__rlasp_stack_elide_zero_301 : i64
          %1308 = func.call @cc_nil_value() : () -> i64
          %1309 = func.call @cc_cons(%1307, %1308) : (i64, i64) -> i64
          %1310 = func.call @cc_not(%1309) : (i64) -> i64
          %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
          %1311 = arith.addi %1310, %__rlasp_stack_elide_zero_302 : i64
          %1312 = func.call @cc_nil_value() : () -> i64
          %1313 = func.call @cc_errorp(%1301) : (i64) -> i64
          %1314 = arith.cmpi ne, %1313, %1312 : i64
          %1315 = arith.cmpi eq, %1312, %1312 : i64
          %1316 = arith.andi %1314, %1315 : i1
          %1317 = scf.if %1316 -> (i64) {
            scf.yield %1301 : i64
          } else {
            scf.yield %1312 : i64
          }
          %1318 = arith.cmpi ne, %1317, %1312 : i64
          scf.if %1318 {
            func.call @stack_push_pointer(%1317) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1301) : (i64) -> ()
            %1319 = llvm.mlir.addressof @str106 : !llvm.ptr
            %1320 = func.call @cc_make_function_ref_const(%1319) : (!llvm.ptr) -> i64
            %1321 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1320, %1321) : (i64, i64) -> ()
          }
          %1322 = func.call @stack_pop_pointer() : () -> i64
          %1323 = func.call @cc_nil_value() : () -> i64
          %1324 = func.call @cc_nil_value() : () -> i64
          %1325 = func.call @cc_errorp(%1323) : (i64) -> i64
          %1326 = arith.cmpi ne, %1325, %1324 : i64
          %1327 = scf.if %1326 -> (i64) {
            scf.yield %1323 : i64
          } else {
            %1328 = func.call @cc_nil_value() : () -> i64
            %1329 = func.call @cc_nil_value() : () -> i64
            %1330 = func.call @cc_nil_value() : () -> i64
            %1331 = func.call @cc_errorp(%1301) : (i64) -> i64
            %1332 = arith.cmpi ne, %1331, %1330 : i64
            %1333 = arith.cmpi eq, %1330, %1330 : i64
            %1334 = arith.andi %1332, %1333 : i1
            %1335 = scf.if %1334 -> (i64) {
              scf.yield %1301 : i64
            } else {
              scf.yield %1330 : i64
            }
            %1336 = arith.cmpi ne, %1335, %1330 : i64
            scf.if %1336 {
              func.call @stack_push_pointer(%1335) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1301) : (i64) -> ()
              %1337 = llvm.mlir.addressof @str107 : !llvm.ptr
              %1338 = func.call @cc_make_function_ref_const(%1337) : (!llvm.ptr) -> i64
              %1339 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1338, %1339) : (i64, i64) -> ()
            }
            %1340 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1322) : (i64) -> ()
            %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
            %1341 = arith.addi %1301, %__rlasp_stack_elide_zero_303 : i64
            %1342 = func.call @stack_pop_pointer() : () -> i64
            %1343 = func.call @cc_char_eq(%1342, %1341) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
            %1344 = arith.addi %1343, %__rlasp_stack_elide_zero_304 : i64
            %1345 = func.call @cc_cons(%1344, %1329) : (i64, i64) -> i64
            %1346 = func.call @cc_cons(%1340, %1345) : (i64, i64) -> i64
            %1347 = func.call @cc_or(%1346) : (i64) -> i64
            %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
            %1348 = arith.addi %1347, %__rlasp_stack_elide_zero_305 : i64
            func.call @stack_push_pointer(%1322) : (i64) -> ()
            %1349 = func.call @cc_nil_value() : () -> i64
            %1350 = func.call @cc_errorp(%1322) : (i64) -> i64
            %1351 = arith.cmpi ne, %1350, %1349 : i64
            %1352 = arith.cmpi eq, %1349, %1349 : i64
            %1353 = arith.andi %1351, %1352 : i1
            %1354 = scf.if %1353 -> (i64) {
              scf.yield %1322 : i64
            } else {
              scf.yield %1349 : i64
            }
            %1355 = arith.cmpi ne, %1354, %1349 : i64
            scf.if %1355 {
              func.call @stack_push_pointer(%1354) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1322) : (i64) -> ()
              %1356 = llvm.mlir.addressof @str108 : !llvm.ptr
              %1357 = func.call @cc_make_function_ref_const(%1356) : (!llvm.ptr) -> i64
              %1358 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1357, %1358) : (i64, i64) -> ()
            }
            %1359 = func.call @stack_pop_pointer() : () -> i64
            %1360 = func.call @stack_pop_pointer() : () -> i64
            %1361 = func.call @cc_char_eq(%1360, %1359) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
            %1362 = arith.addi %1361, %__rlasp_stack_elide_zero_306 : i64
            %1363 = func.call @cc_cons(%1362, %1328) : (i64, i64) -> i64
            %1364 = func.call @cc_cons(%1348, %1363) : (i64, i64) -> i64
            %1365 = func.call @cc_and(%1364) : (i64) -> i64
            %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
            %1366 = arith.addi %1365, %__rlasp_stack_elide_zero_307 : i64
            scf.yield %1366 : i64
          }
          %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
          %1367 = arith.addi %1327, %__rlasp_stack_elide_zero_308 : i64
          %1368 = func.call @cc_cons(%1367, %1306) : (i64, i64) -> i64
          %1369 = func.call @cc_cons(%1311, %1368) : (i64, i64) -> i64
          %1370 = func.call @cc_or(%1369) : (i64) -> i64
          %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
          %1371 = arith.addi %1370, %__rlasp_stack_elide_zero_309 : i64
          %1372 = func.call @cc_nil_value() : () -> i64
          %1373 = func.call @cc_cons(%1371, %1372) : (i64, i64) -> i64
          %1374 = func.call @cc_not(%1373) : (i64) -> i64
          %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
          %1375 = arith.addi %1374, %__rlasp_stack_elide_zero_310 : i64
          %1376 = func.call @cc_nil_value() : () -> i64
          %1377 = arith.cmpi ne, %1375, %1376 : i64
          %1378:2 = scf.if %1377 -> (i64, i64) {
            %1379 = func.call @cc_nil_value() : () -> i64
            %1380 = func.call @cc_nil_value() : () -> i64
            %1381 = func.call @cc_errorp(%1379) : (i64) -> i64
            %1382 = arith.cmpi ne, %1381, %1380 : i64
            %1383:2 = scf.if %1382 -> (i64, i64) {
              scf.yield %1379, %1287 : i64, i64
            } else {
              func.call @stack_push_pointer(%1287) : (i64) -> ()
              %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
              %1384 = arith.addi %1288, %__rlasp_stack_elide_zero_311 : i64
              %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
              %1385 = arith.addi %1301, %__rlasp_stack_elide_zero_312 : i64
              %1386 = func.call @cc_char_name(%1385) : (i64) -> i64
              %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
              %1387 = arith.addi %1386, %__rlasp_stack_elide_zero_313 : i64
              %1388 = func.call @cc_nil_value() : () -> i64
              %1389 = func.call @cc_errorp(%1384) : (i64) -> i64
              %1390 = arith.cmpi ne, %1389, %1388 : i64
              %1391 = arith.cmpi eq, %1388, %1388 : i64
              %1392 = arith.andi %1390, %1391 : i1
              %1393 = scf.if %1392 -> (i64) {
                scf.yield %1384 : i64
              } else {
                scf.yield %1388 : i64
              }
              %1394 = func.call @cc_errorp(%1387) : (i64) -> i64
              %1395 = arith.cmpi ne, %1394, %1388 : i64
              %1396 = arith.cmpi eq, %1393, %1388 : i64
              %1397 = arith.andi %1395, %1396 : i1
              %1398 = scf.if %1397 -> (i64) {
                scf.yield %1387 : i64
              } else {
                scf.yield %1393 : i64
              }
              %1399 = arith.cmpi ne, %1398, %1388 : i64
              scf.if %1399 {
                func.call @stack_push_pointer(%1398) : (i64) -> ()
              } else {
                %1400 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1400) : (i64) -> ()
                %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
                %1401 = arith.addi %1387, %__rlasp_stack_elide_zero_314 : i64
                %1402 = func.call @stack_pop_pointer() : () -> i64
                %1403 = func.call @cc_cons(%1401, %1402) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1403) : (i64) -> ()
                %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
                %1404 = arith.addi %1384, %__rlasp_stack_elide_zero_315 : i64
                %1405 = func.call @stack_pop_pointer() : () -> i64
                %1406 = func.call @cc_cons(%1404, %1405) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1406) : (i64) -> ()
              }
              %1407 = func.call @stack_pop_pointer() : () -> i64
              %1408 = func.call @cc_nil_value() : () -> i64
              %1409 = func.call @cc_errorp(%1407) : (i64) -> i64
              %1410 = arith.cmpi ne, %1409, %1408 : i64
              %1411 = arith.cmpi eq, %1408, %1408 : i64
              %1412 = arith.andi %1410, %1411 : i1
              %1413 = scf.if %1412 -> (i64) {
                scf.yield %1407 : i64
              } else {
                scf.yield %1408 : i64
              }
              %1414 = arith.cmpi ne, %1413, %1408 : i64
              scf.if %1414 {
                func.call @stack_push_pointer(%1413) : (i64) -> ()
              } else {
                %1415 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1415) : (i64) -> ()
                %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
                %1416 = arith.addi %1407, %__rlasp_stack_elide_zero_316 : i64
                %1417 = func.call @stack_pop_pointer() : () -> i64
                %1418 = func.call @cc_cons(%1416, %1417) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1418) : (i64) -> ()
              }
              %1419 = func.call @stack_pop_pointer() : () -> i64
              %1420 = func.call @stack_pop_pointer() : () -> i64
              %1421 = func.call @cc_append(%1420, %1419) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
              %1422 = arith.addi %1421, %__rlasp_stack_elide_zero_317 : i64
              %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
              %1423 = arith.addi %1422, %__rlasp_stack_elide_zero_318 : i64
              scf.yield %1423, %1422 : i64, i64
            }
            %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
            %1424 = arith.addi %1383#0, %__rlasp_stack_elide_zero_319 : i64
            scf.yield %1424, %1383#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %1425 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1425, %1287 : i64, i64
          }
          func.call @stack_push_pointer(%1378#0) : (i64) -> ()
          %1426 = func.call @stack_depth() : () -> i64
          %1427 = arith.constant 0 : i64
          %1428 = arith.cmpi sgt, %1426, %1427 : i64
          scf.if %1428 {
            %1429 = func.call @stack_pop_pointer() : () -> i64
          }
          %1430 = arith.constant 1 : i64
          %1431 = func.call @cc_box_fixnum(%1430) : (i64) -> i64
          %1433 = arith.constant 3 : i64
          %1432 = arith.andi %1288, %1433 : i64
          %1434 = arith.constant 0 : i64
          %1435 = arith.cmpi eq, %1432, %1434 : i64
          %1437 = arith.constant 3 : i64
          %1436 = arith.andi %1431, %1437 : i64
          %1438 = arith.constant 0 : i64
          %1439 = arith.cmpi eq, %1436, %1438 : i64
          %1440 = arith.andi %1435, %1439 : i1
          %1441 = scf.if %1440 -> (i64) {
            %1442 = arith.constant 2 : i64
            %1443 = arith.shrsi %1288, %1442 : i64
            %1444 = arith.constant 2 : i64
            %1445 = arith.shrsi %1431, %1444 : i64
            %1446 = arith.addi %1443, %1445 : i64
            %1447 = arith.constant -2305843009213693952 : i64
            %1448 = arith.constant 2305843009213693951 : i64
            %1449 = arith.cmpi sge, %1446, %1447 : i64
            %1450 = arith.cmpi sle, %1446, %1448 : i64
            %1451 = arith.andi %1449, %1450 : i1
            %1452 = scf.if %1451 -> (i64) {
              %1453 = arith.constant 2 : i64
              %1454 = arith.shli %1446, %1453 : i64
              scf.yield %1454 : i64
            } else {
              %1455 = func.call @cc_add(%1288, %1431) : (i64, i64) -> i64
              scf.yield %1455 : i64
            }
            scf.yield %1452 : i64
          } else {
            %1456 = func.call @cc_add(%1288, %1431) : (i64, i64) -> i64
            scf.yield %1456 : i64
          }
          %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
          %1457 = arith.addi %1441, %__rlasp_stack_elide_zero_320 : i64
          func.call @stack_push_pointer(%1457) : (i64) -> ()
          %1458 = func.call @stack_depth() : () -> i64
          %1459 = arith.constant 0 : i64
          %1460 = arith.cmpi sgt, %1458, %1459 : i64
          scf.if %1460 {
            %1461 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1289, %1288, %1301, %1378#1, %1457 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1462 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
        %1463 = arith.addi %1228#0, %__rlasp_stack_elide_zero_321 : i64
        %1464 = func.call @cc_nil_value() : () -> i64
        %1465 = arith.cmpi ne, %1463, %1464 : i64
        %1466:2 = scf.if %1465 -> (i64, i64) {
          %1467 = func.call @cc_nil_value() : () -> i64
          %1468 = func.call @cc_nil_value() : () -> i64
          %1469 = func.call @cc_errorp(%1467) : (i64) -> i64
          %1470 = arith.cmpi ne, %1469, %1468 : i64
          %1471:2 = scf.if %1470 -> (i64, i64) {
            scf.yield %1467, %1228#4 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
            %1472 = arith.addi %1228#1, %__rlasp_stack_elide_zero_322 : i64
            scf.yield %1472, %1228#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
          %1473 = arith.addi %1471#0, %__rlasp_stack_elide_zero_323 : i64
          scf.yield %1473, %1471#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %1474 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1474, %1228#4 : i64, i64
        }
        %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
        %1475 = arith.addi %1466#0, %__rlasp_stack_elide_zero_324 : i64
        %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
        %1476 = arith.addi %1228#3, %__rlasp_stack_elide_zero_325 : i64
        %1477 = func.call @cc_multiple_value_list(%1476) : (i64) -> i64
        %1478 = llvm.mlir.addressof @str109 : !llvm.ptr
        %1479 = arith.constant 38 : i64
        %1480 = func.call @cc_make_string(%1478, %1479) : (!llvm.ptr, i64) -> i64
        %1481 = func.call @cc_nil_value() : () -> i64
        %1482 = func.call @cc_intern(%1480, %1481) : (i64, i64) -> i64
        %1483 = func.call @cc_nil_value() : () -> i64
        %1484 = func.call @cc_cons(%1482, %1483) : (i64, i64) -> i64
        %1485 = func.call @cc_values_pack(%1484) : (i64) -> i64
        %1486 = func.call @cc_symbol_value(%1482) : (i64) -> i64
        %1487 = llvm.mlir.addressof @str110 : !llvm.ptr
        %1488 = arith.constant 39 : i64
        %1489 = func.call @cc_make_string(%1487, %1488) : (!llvm.ptr, i64) -> i64
        %1490 = func.call @cc_nil_value() : () -> i64
        %1491 = func.call @cc_intern(%1489, %1490) : (i64, i64) -> i64
        %1492 = func.call @cc_nil_value() : () -> i64
        %1493 = func.call @cc_cons(%1491, %1492) : (i64, i64) -> i64
        %1494 = func.call @cc_values_pack(%1493) : (i64) -> i64
        %1495 = func.call @cc_symbol_value(%1491) : (i64) -> i64
        %1496 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1497 = arith.constant 40 : i64
        %1498 = func.call @cc_make_string(%1496, %1497) : (!llvm.ptr, i64) -> i64
        %1499 = func.call @cc_nil_value() : () -> i64
        %1500 = func.call @cc_intern(%1498, %1499) : (i64, i64) -> i64
        %1501 = func.call @cc_nil_value() : () -> i64
        %1502 = func.call @cc_cons(%1500, %1501) : (i64, i64) -> i64
        %1503 = func.call @cc_values_pack(%1502) : (i64) -> i64
        %1504 = func.call @cc_symbol_value(%1500) : (i64) -> i64
        %1505 = func.call @cc_nil_value() : () -> i64
        %1506 = arith.cmpi ne, %1486, %1505 : i64
        %1507 = scf.if %1506 -> (i64) {
          scf.yield %1504 : i64
        } else {
          scf.yield %1477 : i64
        }
        %1508 = func.call @cc_values_pack(%1507) : (i64) -> i64
        %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
        %1509 = arith.addi %1508, %__rlasp_stack_elide_zero_326 : i64
        scf.yield %1509, %1228#0, %1228#1, %1228#3, %1466#1, %1228#2 : i64, i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %1510 = arith.addi %1199#0, %__rlasp_stack_elide_zero_327 : i64
      scf.yield %1510 : i64
    }
    func.call @stack_push_pointer(%1188) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296901"() {
    %2308 = func.call @cc_nil_value() : () -> i64
    %2309 = func.call @cc_nil_value() : () -> i64
    %2310 = func.call @cc_errorp(%2308) : (i64) -> i64
    %2311 = arith.cmpi ne, %2310, %2309 : i64
    %2312 = scf.if %2311 -> (i64) {
      scf.yield %2308 : i64
    } else {
      %2313 = arith.constant 0 : i64
      %2314 = func.call @cc_box_fixnum(%2313) : (i64) -> i64
      %2315 = func.call @cc_nil_value() : () -> i64
      %2316 = func.call @cc_nil_value() : () -> i64
      %2317 = func.call @cc_nil_value() : () -> i64
      %2318 = func.call @cc_nil_value() : () -> i64
      %2319 = func.call @cc_nil_value() : () -> i64
      %2320 = func.call @cc_nil_value() : () -> i64
      %2321 = func.call @cc_errorp(%2319) : (i64) -> i64
      %2322 = arith.cmpi ne, %2321, %2320 : i64
      %2323:6 = scf.if %2322 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %2319, %2318, %2315, %2317, %2314, %2316 : i64, i64, i64, i64, i64, i64
      } else {
        %2324 = func.call @cc_nil_value() : () -> i64
        %2325 = llvm.mlir.addressof @str179 : !llvm.ptr
        %2326 = arith.constant 38 : i64
        %2327 = func.call @cc_make_string(%2325, %2326) : (!llvm.ptr, i64) -> i64
        %2328 = func.call @cc_nil_value() : () -> i64
        %2329 = func.call @cc_intern(%2327, %2328) : (i64, i64) -> i64
        %2330 = func.call @cc_nil_value() : () -> i64
        %2331 = func.call @cc_cons(%2329, %2330) : (i64, i64) -> i64
        %2332 = func.call @cc_values_pack(%2331) : (i64) -> i64
        %2333 = func.call @cc_set_symbol_value(%2329, %2324) : (i64, i64) -> i64
        %2334 = llvm.mlir.addressof @str180 : !llvm.ptr
        %2335 = arith.constant 39 : i64
        %2336 = func.call @cc_make_string(%2334, %2335) : (!llvm.ptr, i64) -> i64
        %2337 = func.call @cc_nil_value() : () -> i64
        %2338 = func.call @cc_intern(%2336, %2337) : (i64, i64) -> i64
        %2339 = func.call @cc_nil_value() : () -> i64
        %2340 = func.call @cc_cons(%2338, %2339) : (i64, i64) -> i64
        %2341 = func.call @cc_values_pack(%2340) : (i64) -> i64
        %2342 = func.call @cc_set_symbol_value(%2338, %2324) : (i64, i64) -> i64
        %2343 = llvm.mlir.addressof @str181 : !llvm.ptr
        %2344 = arith.constant 40 : i64
        %2345 = func.call @cc_make_string(%2343, %2344) : (!llvm.ptr, i64) -> i64
        %2346 = func.call @cc_nil_value() : () -> i64
        %2347 = func.call @cc_intern(%2345, %2346) : (i64, i64) -> i64
        %2348 = func.call @cc_nil_value() : () -> i64
        %2349 = func.call @cc_cons(%2347, %2348) : (i64, i64) -> i64
        %2350 = func.call @cc_values_pack(%2349) : (i64) -> i64
        %2351 = func.call @cc_set_symbol_value(%2347, %2324) : (i64, i64) -> i64
        %2352:5 = scf.while (%arg0 = %2318, %arg1 = %2315, %arg2 = %2316, %arg3 = %2317, %arg4 = %2314) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
          %2353 = arith.addi %arg4, %__rlasp_stack_elide_zero_328 : i64
          %2354 = arith.constant 55296 : i64
          %2355 = func.call @cc_box_fixnum(%2354) : (i64) -> i64
          %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
          %2356 = arith.addi %2355, %__rlasp_stack_elide_zero_329 : i64
          %2357 = arith.constant 1 : i1
          %2359 = arith.constant 3 : i64
          %2358 = arith.andi %2353, %2359 : i64
          %2360 = arith.constant 0 : i64
          %2361 = arith.cmpi eq, %2358, %2360 : i64
          %2363 = arith.constant 3 : i64
          %2362 = arith.andi %2356, %2363 : i64
          %2364 = arith.constant 0 : i64
          %2365 = arith.cmpi eq, %2362, %2364 : i64
          %2366 = arith.andi %2361, %2365 : i1
          %2367 = scf.if %2366 -> (i1) {
            %2368 = arith.constant 2 : i64
            %2369 = arith.shrsi %2353, %2368 : i64
            %2370 = arith.constant 2 : i64
            %2371 = arith.shrsi %2356, %2370 : i64
            %2372 = arith.cmpi slt, %2369, %2371 : i64
            scf.yield %2372 : i1
          } else {
            %2373 = func.call @cc_lt(%2353, %2356) : (i64, i64) -> i64
            %2374 = func.call @cc_nil_value() : () -> i64
            %2375 = arith.cmpi ne, %2373, %2374 : i64
            scf.yield %2375 : i1
          }
          %2376 = arith.andi %2357, %2367 : i1
          %2377 = func.call @cc_nil_value() : () -> i64
          %2378 = func.call @cc_t_value() : () -> i64
          %2379 = scf.if %2376 -> (i64) {
            scf.yield %2378 : i64
          } else {
            scf.yield %2377 : i64
          }
          %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
          %2380 = arith.addi %2379, %__rlasp_stack_elide_zero_330 : i64
          %2381 = func.call @cc_nil_value() : () -> i64
          %2382 = arith.cmpi ne, %2380, %2381 : i64
          %2383 = func.call @cc_nil_value() : () -> i64
          %2384 = llvm.mlir.addressof @str182 : !llvm.ptr
          %2385 = arith.constant 38 : i64
          %2386 = func.call @cc_make_string(%2384, %2385) : (!llvm.ptr, i64) -> i64
          %2387 = func.call @cc_nil_value() : () -> i64
          %2388 = func.call @cc_intern(%2386, %2387) : (i64, i64) -> i64
          %2389 = func.call @cc_nil_value() : () -> i64
          %2390 = func.call @cc_cons(%2388, %2389) : (i64, i64) -> i64
          %2391 = func.call @cc_values_pack(%2390) : (i64) -> i64
          %2392 = func.call @cc_symbol_value(%2388) : (i64) -> i64
          %2393 = arith.cmpi ne, %2392, %2383 : i64
          %2394 = llvm.mlir.addressof @str183 : !llvm.ptr
          %2395 = arith.constant 38 : i64
          %2396 = func.call @cc_make_string(%2394, %2395) : (!llvm.ptr, i64) -> i64
          %2397 = func.call @cc_nil_value() : () -> i64
          %2398 = func.call @cc_intern(%2396, %2397) : (i64, i64) -> i64
          %2399 = func.call @cc_nil_value() : () -> i64
          %2400 = func.call @cc_cons(%2398, %2399) : (i64, i64) -> i64
          %2401 = func.call @cc_values_pack(%2400) : (i64) -> i64
          %2402 = func.call @cc_symbol_value(%2398) : (i64) -> i64
          %2403 = arith.cmpi ne, %2402, %2383 : i64
          %2404 = arith.ori %2393, %2403 : i1
          %2405 = arith.constant 0 : i1
          %2406 = arith.cmpi eq, %2404, %2405 : i1
          %2407 = arith.andi %2382, %2406 : i1
          scf.condition(%2407) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%2408: i64, %2409: i64, %2410: i64, %2411: i64, %2412: i64):
          %2413 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%2413) : (i64) -> ()
          %2414 = func.call @stack_depth() : () -> i64
          %2415 = arith.constant 0 : i64
          %2416 = arith.cmpi sgt, %2414, %2415 : i64
          scf.if %2416 {
            %2417 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2412) : (i64) -> ()
          %2418 = func.call @stack_depth() : () -> i64
          %2419 = arith.constant 0 : i64
          %2420 = arith.cmpi sgt, %2418, %2419 : i64
          scf.if %2420 {
            %2421 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
          %2422 = arith.addi %2412, %__rlasp_stack_elide_zero_331 : i64
          %2423 = func.call @cc_unbox_fixnum(%2422) : (i64) -> i64
          %2424 = func.call @cc_box_character(%2423) : (i64) -> i64
          %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
          %2425 = arith.addi %2424, %__rlasp_stack_elide_zero_332 : i64
          func.call @stack_push_pointer(%2425) : (i64) -> ()
          %2426 = func.call @stack_depth() : () -> i64
          %2427 = arith.constant 0 : i64
          %2428 = arith.cmpi sgt, %2426, %2427 : i64
          scf.if %2428 {
            %2429 = func.call @stack_pop_pointer() : () -> i64
          }
          %2430 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
          %2431 = arith.addi %2425, %__rlasp_stack_elide_zero_333 : i64
          %2432 = func.call @cc_nil_value() : () -> i64
          %2433 = func.call @cc_errorp(%2425) : (i64) -> i64
          %2434 = arith.cmpi ne, %2433, %2432 : i64
          %2435 = arith.cmpi eq, %2432, %2432 : i64
          %2436 = arith.andi %2434, %2435 : i1
          %2437 = scf.if %2436 -> (i64) {
            scf.yield %2425 : i64
          } else {
            scf.yield %2432 : i64
          }
          %2438 = arith.cmpi ne, %2437, %2432 : i64
          scf.if %2438 {
            func.call @stack_push_pointer(%2437) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2425) : (i64) -> ()
            %2439 = llvm.mlir.addressof @str184 : !llvm.ptr
            %2440 = func.call @cc_make_function_ref_const(%2439) : (!llvm.ptr) -> i64
            %2441 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2440, %2441) : (i64, i64) -> ()
          }
          %2442 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2425) : (i64) -> ()
          %2443 = func.call @cc_nil_value() : () -> i64
          %2444 = func.call @cc_errorp(%2425) : (i64) -> i64
          %2445 = arith.cmpi ne, %2444, %2443 : i64
          %2446 = arith.cmpi eq, %2443, %2443 : i64
          %2447 = arith.andi %2445, %2446 : i1
          %2448 = scf.if %2447 -> (i64) {
            scf.yield %2425 : i64
          } else {
            scf.yield %2443 : i64
          }
          %2449 = arith.cmpi ne, %2448, %2443 : i64
          scf.if %2449 {
            func.call @stack_push_pointer(%2448) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2425) : (i64) -> ()
            %2450 = llvm.mlir.addressof @str185 : !llvm.ptr
            %2451 = func.call @cc_make_function_ref_const(%2450) : (!llvm.ptr) -> i64
            %2452 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2451, %2452) : (i64, i64) -> ()
          }
          %2453 = func.call @stack_pop_pointer() : () -> i64
          %2454 = func.call @stack_pop_pointer() : () -> i64
          %2455 = func.call @cc_char_eq(%2454, %2453) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
          %2456 = arith.addi %2455, %__rlasp_stack_elide_zero_334 : i64
          %2457 = func.call @cc_cons(%2456, %2430) : (i64, i64) -> i64
          %2458 = func.call @cc_cons(%2442, %2457) : (i64, i64) -> i64
          %2459 = func.call @cc_cons(%2431, %2458) : (i64, i64) -> i64
          %2460 = func.call @cc_and(%2459) : (i64) -> i64
          %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
          %2461 = arith.addi %2460, %__rlasp_stack_elide_zero_335 : i64
          %2462 = func.call @cc_nil_value() : () -> i64
          %2463 = arith.cmpi ne, %2461, %2462 : i64
          %2464:2 = scf.if %2463 -> (i64, i64) {
            %2465 = func.call @cc_nil_value() : () -> i64
            %2466 = func.call @cc_nil_value() : () -> i64
            %2467 = func.call @cc_errorp(%2465) : (i64) -> i64
            %2468 = arith.cmpi ne, %2467, %2466 : i64
            %2469:2 = scf.if %2468 -> (i64, i64) {
              scf.yield %2465, %2411 : i64, i64
            } else {
              func.call @stack_push_pointer(%2411) : (i64) -> ()
              %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
              %2470 = arith.addi %2412, %__rlasp_stack_elide_zero_336 : i64
              %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
              %2471 = arith.addi %2425, %__rlasp_stack_elide_zero_337 : i64
              %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
              %2472 = arith.addi %2425, %__rlasp_stack_elide_zero_338 : i64
              %2473 = func.call @cc_char_name(%2472) : (i64) -> i64
              %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
              %2474 = arith.addi %2473, %__rlasp_stack_elide_zero_339 : i64
              %2475 = func.call @cc_nil_value() : () -> i64
              %2476 = func.call @cc_errorp(%2470) : (i64) -> i64
              %2477 = arith.cmpi ne, %2476, %2475 : i64
              %2478 = arith.cmpi eq, %2475, %2475 : i64
              %2479 = arith.andi %2477, %2478 : i1
              %2480 = scf.if %2479 -> (i64) {
                scf.yield %2470 : i64
              } else {
                scf.yield %2475 : i64
              }
              %2481 = func.call @cc_errorp(%2471) : (i64) -> i64
              %2482 = arith.cmpi ne, %2481, %2475 : i64
              %2483 = arith.cmpi eq, %2480, %2475 : i64
              %2484 = arith.andi %2482, %2483 : i1
              %2485 = scf.if %2484 -> (i64) {
                scf.yield %2471 : i64
              } else {
                scf.yield %2480 : i64
              }
              %2486 = func.call @cc_errorp(%2474) : (i64) -> i64
              %2487 = arith.cmpi ne, %2486, %2475 : i64
              %2488 = arith.cmpi eq, %2485, %2475 : i64
              %2489 = arith.andi %2487, %2488 : i1
              %2490 = scf.if %2489 -> (i64) {
                scf.yield %2474 : i64
              } else {
                scf.yield %2485 : i64
              }
              %2491 = arith.cmpi ne, %2490, %2475 : i64
              scf.if %2491 {
                func.call @stack_push_pointer(%2490) : (i64) -> ()
              } else {
                %2492 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%2492) : (i64) -> ()
                %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
                %2493 = arith.addi %2474, %__rlasp_stack_elide_zero_340 : i64
                %2494 = func.call @stack_pop_pointer() : () -> i64
                %2495 = func.call @cc_cons(%2493, %2494) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2495) : (i64) -> ()
                %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
                %2496 = arith.addi %2471, %__rlasp_stack_elide_zero_341 : i64
                %2497 = func.call @stack_pop_pointer() : () -> i64
                %2498 = func.call @cc_cons(%2496, %2497) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2498) : (i64) -> ()
                %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
                %2499 = arith.addi %2470, %__rlasp_stack_elide_zero_342 : i64
                %2500 = func.call @stack_pop_pointer() : () -> i64
                %2501 = func.call @cc_cons(%2499, %2500) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2501) : (i64) -> ()
              }
              %2502 = func.call @stack_pop_pointer() : () -> i64
              %2503 = func.call @cc_nil_value() : () -> i64
              %2504 = func.call @cc_errorp(%2502) : (i64) -> i64
              %2505 = arith.cmpi ne, %2504, %2503 : i64
              %2506 = arith.cmpi eq, %2503, %2503 : i64
              %2507 = arith.andi %2505, %2506 : i1
              %2508 = scf.if %2507 -> (i64) {
                scf.yield %2502 : i64
              } else {
                scf.yield %2503 : i64
              }
              %2509 = arith.cmpi ne, %2508, %2503 : i64
              scf.if %2509 {
                func.call @stack_push_pointer(%2508) : (i64) -> ()
              } else {
                %2510 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%2510) : (i64) -> ()
                %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
                %2511 = arith.addi %2502, %__rlasp_stack_elide_zero_343 : i64
                %2512 = func.call @stack_pop_pointer() : () -> i64
                %2513 = func.call @cc_cons(%2511, %2512) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2513) : (i64) -> ()
              }
              %2514 = func.call @stack_pop_pointer() : () -> i64
              %2515 = func.call @stack_pop_pointer() : () -> i64
              %2516 = func.call @cc_append(%2515, %2514) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
              %2517 = arith.addi %2516, %__rlasp_stack_elide_zero_344 : i64
              %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
              %2518 = arith.addi %2517, %__rlasp_stack_elide_zero_345 : i64
              scf.yield %2518, %2517 : i64, i64
            }
            %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
            %2519 = arith.addi %2469#0, %__rlasp_stack_elide_zero_346 : i64
            scf.yield %2519, %2469#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %2520 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2520, %2411 : i64, i64
          }
          func.call @stack_push_pointer(%2464#0) : (i64) -> ()
          %2521 = func.call @stack_depth() : () -> i64
          %2522 = arith.constant 0 : i64
          %2523 = arith.cmpi sgt, %2521, %2522 : i64
          scf.if %2523 {
            %2524 = func.call @stack_pop_pointer() : () -> i64
          }
          %2525 = arith.constant 1 : i64
          %2526 = func.call @cc_box_fixnum(%2525) : (i64) -> i64
          %2528 = arith.constant 3 : i64
          %2527 = arith.andi %2412, %2528 : i64
          %2529 = arith.constant 0 : i64
          %2530 = arith.cmpi eq, %2527, %2529 : i64
          %2532 = arith.constant 3 : i64
          %2531 = arith.andi %2526, %2532 : i64
          %2533 = arith.constant 0 : i64
          %2534 = arith.cmpi eq, %2531, %2533 : i64
          %2535 = arith.andi %2530, %2534 : i1
          %2536 = scf.if %2535 -> (i64) {
            %2537 = arith.constant 2 : i64
            %2538 = arith.shrsi %2412, %2537 : i64
            %2539 = arith.constant 2 : i64
            %2540 = arith.shrsi %2526, %2539 : i64
            %2541 = arith.addi %2538, %2540 : i64
            %2542 = arith.constant -2305843009213693952 : i64
            %2543 = arith.constant 2305843009213693951 : i64
            %2544 = arith.cmpi sge, %2541, %2542 : i64
            %2545 = arith.cmpi sle, %2541, %2543 : i64
            %2546 = arith.andi %2544, %2545 : i1
            %2547 = scf.if %2546 -> (i64) {
              %2548 = arith.constant 2 : i64
              %2549 = arith.shli %2541, %2548 : i64
              scf.yield %2549 : i64
            } else {
              %2550 = func.call @cc_add(%2412, %2526) : (i64, i64) -> i64
              scf.yield %2550 : i64
            }
            scf.yield %2547 : i64
          } else {
            %2551 = func.call @cc_add(%2412, %2526) : (i64, i64) -> i64
            scf.yield %2551 : i64
          }
          %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
          %2552 = arith.addi %2536, %__rlasp_stack_elide_zero_347 : i64
          func.call @stack_push_pointer(%2552) : (i64) -> ()
          %2553 = func.call @stack_depth() : () -> i64
          %2554 = arith.constant 0 : i64
          %2555 = arith.cmpi sgt, %2553, %2554 : i64
          scf.if %2555 {
            %2556 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %2413, %2412, %2425, %2464#1, %2552 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %2557 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
        %2558 = arith.addi %2352#0, %__rlasp_stack_elide_zero_348 : i64
        %2559 = func.call @cc_nil_value() : () -> i64
        %2560 = arith.cmpi ne, %2558, %2559 : i64
        %2561:2 = scf.if %2560 -> (i64, i64) {
          %2562 = func.call @cc_nil_value() : () -> i64
          %2563 = func.call @cc_nil_value() : () -> i64
          %2564 = func.call @cc_errorp(%2562) : (i64) -> i64
          %2565 = arith.cmpi ne, %2564, %2563 : i64
          %2566:2 = scf.if %2565 -> (i64, i64) {
            scf.yield %2562, %2352#4 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
            %2567 = arith.addi %2352#1, %__rlasp_stack_elide_zero_349 : i64
            scf.yield %2567, %2352#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
          %2568 = arith.addi %2566#0, %__rlasp_stack_elide_zero_350 : i64
          scf.yield %2568, %2566#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %2569 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2569, %2352#4 : i64, i64
        }
        %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
        %2570 = arith.addi %2561#0, %__rlasp_stack_elide_zero_351 : i64
        %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
        %2571 = arith.addi %2352#3, %__rlasp_stack_elide_zero_352 : i64
        %2572 = func.call @cc_multiple_value_list(%2571) : (i64) -> i64
        %2573 = llvm.mlir.addressof @str186 : !llvm.ptr
        %2574 = arith.constant 38 : i64
        %2575 = func.call @cc_make_string(%2573, %2574) : (!llvm.ptr, i64) -> i64
        %2576 = func.call @cc_nil_value() : () -> i64
        %2577 = func.call @cc_intern(%2575, %2576) : (i64, i64) -> i64
        %2578 = func.call @cc_nil_value() : () -> i64
        %2579 = func.call @cc_cons(%2577, %2578) : (i64, i64) -> i64
        %2580 = func.call @cc_values_pack(%2579) : (i64) -> i64
        %2581 = func.call @cc_symbol_value(%2577) : (i64) -> i64
        %2582 = llvm.mlir.addressof @str187 : !llvm.ptr
        %2583 = arith.constant 39 : i64
        %2584 = func.call @cc_make_string(%2582, %2583) : (!llvm.ptr, i64) -> i64
        %2585 = func.call @cc_nil_value() : () -> i64
        %2586 = func.call @cc_intern(%2584, %2585) : (i64, i64) -> i64
        %2587 = func.call @cc_nil_value() : () -> i64
        %2588 = func.call @cc_cons(%2586, %2587) : (i64, i64) -> i64
        %2589 = func.call @cc_values_pack(%2588) : (i64) -> i64
        %2590 = func.call @cc_symbol_value(%2586) : (i64) -> i64
        %2591 = llvm.mlir.addressof @str188 : !llvm.ptr
        %2592 = arith.constant 40 : i64
        %2593 = func.call @cc_make_string(%2591, %2592) : (!llvm.ptr, i64) -> i64
        %2594 = func.call @cc_nil_value() : () -> i64
        %2595 = func.call @cc_intern(%2593, %2594) : (i64, i64) -> i64
        %2596 = func.call @cc_nil_value() : () -> i64
        %2597 = func.call @cc_cons(%2595, %2596) : (i64, i64) -> i64
        %2598 = func.call @cc_values_pack(%2597) : (i64) -> i64
        %2599 = func.call @cc_symbol_value(%2595) : (i64) -> i64
        %2600 = func.call @cc_nil_value() : () -> i64
        %2601 = arith.cmpi ne, %2581, %2600 : i64
        %2602 = scf.if %2601 -> (i64) {
          scf.yield %2599 : i64
        } else {
          scf.yield %2572 : i64
        }
        %2603 = func.call @cc_values_pack(%2602) : (i64) -> i64
        %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
        %2604 = arith.addi %2603, %__rlasp_stack_elide_zero_353 : i64
        scf.yield %2604, %2352#0, %2352#1, %2352#3, %2561#1, %2352#2 : i64, i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %2605 = arith.addi %2323#0, %__rlasp_stack_elide_zero_354 : i64
      scf.yield %2605 : i64
    }
    func.call @stack_push_pointer(%2312) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296903"() {
    %3561 = func.call @cc_nil_value() : () -> i64
    %3562 = func.call @cc_nil_value() : () -> i64
    %3563 = func.call @cc_errorp(%3561) : (i64) -> i64
    %3564 = arith.cmpi ne, %3563, %3562 : i64
    %3565 = scf.if %3564 -> (i64) {
      scf.yield %3561 : i64
    } else {
      %3566 = arith.constant 0 : i64
      %3567 = func.call @cc_box_fixnum(%3566) : (i64) -> i64
      %3568 = func.call @cc_nil_value() : () -> i64
      %3569 = func.call @cc_nil_value() : () -> i64
      %3570 = func.call @cc_nil_value() : () -> i64
      %3571 = func.call @cc_nil_value() : () -> i64
      %3572 = func.call @cc_nil_value() : () -> i64
      %3573 = func.call @cc_nil_value() : () -> i64
      %3574 = func.call @cc_errorp(%3572) : (i64) -> i64
      %3575 = arith.cmpi ne, %3574, %3573 : i64
      %3576:6 = scf.if %3575 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %3572, %3571, %3568, %3570, %3567, %3569 : i64, i64, i64, i64, i64, i64
      } else {
        %3577 = func.call @cc_nil_value() : () -> i64
        %3578 = llvm.mlir.addressof @str272 : !llvm.ptr
        %3579 = arith.constant 38 : i64
        %3580 = func.call @cc_make_string(%3578, %3579) : (!llvm.ptr, i64) -> i64
        %3581 = func.call @cc_nil_value() : () -> i64
        %3582 = func.call @cc_intern(%3580, %3581) : (i64, i64) -> i64
        %3583 = func.call @cc_nil_value() : () -> i64
        %3584 = func.call @cc_cons(%3582, %3583) : (i64, i64) -> i64
        %3585 = func.call @cc_values_pack(%3584) : (i64) -> i64
        %3586 = func.call @cc_set_symbol_value(%3582, %3577) : (i64, i64) -> i64
        %3587 = llvm.mlir.addressof @str273 : !llvm.ptr
        %3588 = arith.constant 39 : i64
        %3589 = func.call @cc_make_string(%3587, %3588) : (!llvm.ptr, i64) -> i64
        %3590 = func.call @cc_nil_value() : () -> i64
        %3591 = func.call @cc_intern(%3589, %3590) : (i64, i64) -> i64
        %3592 = func.call @cc_nil_value() : () -> i64
        %3593 = func.call @cc_cons(%3591, %3592) : (i64, i64) -> i64
        %3594 = func.call @cc_values_pack(%3593) : (i64) -> i64
        %3595 = func.call @cc_set_symbol_value(%3591, %3577) : (i64, i64) -> i64
        %3596 = llvm.mlir.addressof @str274 : !llvm.ptr
        %3597 = arith.constant 40 : i64
        %3598 = func.call @cc_make_string(%3596, %3597) : (!llvm.ptr, i64) -> i64
        %3599 = func.call @cc_nil_value() : () -> i64
        %3600 = func.call @cc_intern(%3598, %3599) : (i64, i64) -> i64
        %3601 = func.call @cc_nil_value() : () -> i64
        %3602 = func.call @cc_cons(%3600, %3601) : (i64, i64) -> i64
        %3603 = func.call @cc_values_pack(%3602) : (i64) -> i64
        %3604 = func.call @cc_set_symbol_value(%3600, %3577) : (i64, i64) -> i64
        %3605:5 = scf.while (%arg0 = %3571, %arg1 = %3568, %arg2 = %3569, %arg3 = %3570, %arg4 = %3567) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
          %3606 = arith.addi %arg4, %__rlasp_stack_elide_zero_355 : i64
          %3607 = arith.constant 55296 : i64
          %3608 = func.call @cc_box_fixnum(%3607) : (i64) -> i64
          %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
          %3609 = arith.addi %3608, %__rlasp_stack_elide_zero_356 : i64
          %3610 = arith.constant 1 : i1
          %3612 = arith.constant 3 : i64
          %3611 = arith.andi %3606, %3612 : i64
          %3613 = arith.constant 0 : i64
          %3614 = arith.cmpi eq, %3611, %3613 : i64
          %3616 = arith.constant 3 : i64
          %3615 = arith.andi %3609, %3616 : i64
          %3617 = arith.constant 0 : i64
          %3618 = arith.cmpi eq, %3615, %3617 : i64
          %3619 = arith.andi %3614, %3618 : i1
          %3620 = scf.if %3619 -> (i1) {
            %3621 = arith.constant 2 : i64
            %3622 = arith.shrsi %3606, %3621 : i64
            %3623 = arith.constant 2 : i64
            %3624 = arith.shrsi %3609, %3623 : i64
            %3625 = arith.cmpi slt, %3622, %3624 : i64
            scf.yield %3625 : i1
          } else {
            %3626 = func.call @cc_lt(%3606, %3609) : (i64, i64) -> i64
            %3627 = func.call @cc_nil_value() : () -> i64
            %3628 = arith.cmpi ne, %3626, %3627 : i64
            scf.yield %3628 : i1
          }
          %3629 = arith.andi %3610, %3620 : i1
          %3630 = func.call @cc_nil_value() : () -> i64
          %3631 = func.call @cc_t_value() : () -> i64
          %3632 = scf.if %3629 -> (i64) {
            scf.yield %3631 : i64
          } else {
            scf.yield %3630 : i64
          }
          %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
          %3633 = arith.addi %3632, %__rlasp_stack_elide_zero_357 : i64
          %3634 = func.call @cc_nil_value() : () -> i64
          %3635 = arith.cmpi ne, %3633, %3634 : i64
          %3636 = func.call @cc_nil_value() : () -> i64
          %3637 = llvm.mlir.addressof @str275 : !llvm.ptr
          %3638 = arith.constant 38 : i64
          %3639 = func.call @cc_make_string(%3637, %3638) : (!llvm.ptr, i64) -> i64
          %3640 = func.call @cc_nil_value() : () -> i64
          %3641 = func.call @cc_intern(%3639, %3640) : (i64, i64) -> i64
          %3642 = func.call @cc_nil_value() : () -> i64
          %3643 = func.call @cc_cons(%3641, %3642) : (i64, i64) -> i64
          %3644 = func.call @cc_values_pack(%3643) : (i64) -> i64
          %3645 = func.call @cc_symbol_value(%3641) : (i64) -> i64
          %3646 = arith.cmpi ne, %3645, %3636 : i64
          %3647 = llvm.mlir.addressof @str276 : !llvm.ptr
          %3648 = arith.constant 38 : i64
          %3649 = func.call @cc_make_string(%3647, %3648) : (!llvm.ptr, i64) -> i64
          %3650 = func.call @cc_nil_value() : () -> i64
          %3651 = func.call @cc_intern(%3649, %3650) : (i64, i64) -> i64
          %3652 = func.call @cc_nil_value() : () -> i64
          %3653 = func.call @cc_cons(%3651, %3652) : (i64, i64) -> i64
          %3654 = func.call @cc_values_pack(%3653) : (i64) -> i64
          %3655 = func.call @cc_symbol_value(%3651) : (i64) -> i64
          %3656 = arith.cmpi ne, %3655, %3636 : i64
          %3657 = arith.ori %3646, %3656 : i1
          %3658 = arith.constant 0 : i1
          %3659 = arith.cmpi eq, %3657, %3658 : i1
          %3660 = arith.andi %3635, %3659 : i1
          scf.condition(%3660) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%3661: i64, %3662: i64, %3663: i64, %3664: i64, %3665: i64):
          %3666 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%3666) : (i64) -> ()
          %3667 = func.call @stack_depth() : () -> i64
          %3668 = arith.constant 0 : i64
          %3669 = arith.cmpi sgt, %3667, %3668 : i64
          scf.if %3669 {
            %3670 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%3665) : (i64) -> ()
          %3671 = func.call @stack_depth() : () -> i64
          %3672 = arith.constant 0 : i64
          %3673 = arith.cmpi sgt, %3671, %3672 : i64
          scf.if %3673 {
            %3674 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
          %3675 = arith.addi %3665, %__rlasp_stack_elide_zero_358 : i64
          %3676 = func.call @cc_unbox_fixnum(%3675) : (i64) -> i64
          %3677 = func.call @cc_box_character(%3676) : (i64) -> i64
          %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
          %3678 = arith.addi %3677, %__rlasp_stack_elide_zero_359 : i64
          func.call @stack_push_pointer(%3678) : (i64) -> ()
          %3679 = func.call @stack_depth() : () -> i64
          %3680 = arith.constant 0 : i64
          %3681 = arith.cmpi sgt, %3679, %3680 : i64
          scf.if %3681 {
            %3682 = func.call @stack_pop_pointer() : () -> i64
          }
          %3683 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
          %3684 = arith.addi %3678, %__rlasp_stack_elide_zero_360 : i64
          %3685 = func.call @cc_nil_value() : () -> i64
          %3686 = func.call @cc_cons(%3684, %3685) : (i64, i64) -> i64
          %3687 = func.call @cc_not(%3686) : (i64) -> i64
          %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
          %3688 = arith.addi %3687, %__rlasp_stack_elide_zero_361 : i64
          %3689 = func.call @cc_nil_value() : () -> i64
          %3690 = func.call @cc_errorp(%3678) : (i64) -> i64
          %3691 = arith.cmpi ne, %3690, %3689 : i64
          %3692 = arith.cmpi eq, %3689, %3689 : i64
          %3693 = arith.andi %3691, %3692 : i1
          %3694 = scf.if %3693 -> (i64) {
            scf.yield %3678 : i64
          } else {
            scf.yield %3689 : i64
          }
          %3695 = arith.cmpi ne, %3694, %3689 : i64
          scf.if %3695 {
            func.call @stack_push_pointer(%3694) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3678) : (i64) -> ()
            %3696 = llvm.mlir.addressof @str277 : !llvm.ptr
            %3697 = func.call @cc_make_function_ref_const(%3696) : (!llvm.ptr) -> i64
            %3698 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3697, %3698) : (i64, i64) -> ()
          }
          %3699 = func.call @stack_pop_pointer() : () -> i64
          %3700 = func.call @cc_nil_value() : () -> i64
          %3701 = func.call @cc_nil_value() : () -> i64
          %3702 = func.call @cc_errorp(%3700) : (i64) -> i64
          %3703 = arith.cmpi ne, %3702, %3701 : i64
          %3704 = scf.if %3703 -> (i64) {
            scf.yield %3700 : i64
          } else {
            %3705 = func.call @cc_nil_value() : () -> i64
            %3706 = func.call @cc_nil_value() : () -> i64
            %3707 = func.call @cc_nil_value() : () -> i64
            %3708 = func.call @cc_errorp(%3678) : (i64) -> i64
            %3709 = arith.cmpi ne, %3708, %3707 : i64
            %3710 = arith.cmpi eq, %3707, %3707 : i64
            %3711 = arith.andi %3709, %3710 : i1
            %3712 = scf.if %3711 -> (i64) {
              scf.yield %3678 : i64
            } else {
              scf.yield %3707 : i64
            }
            %3713 = arith.cmpi ne, %3712, %3707 : i64
            scf.if %3713 {
              func.call @stack_push_pointer(%3712) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3678) : (i64) -> ()
              %3714 = llvm.mlir.addressof @str278 : !llvm.ptr
              %3715 = func.call @cc_make_function_ref_const(%3714) : (!llvm.ptr) -> i64
              %3716 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3715, %3716) : (i64, i64) -> ()
            }
            %3717 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3699) : (i64) -> ()
            %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
            %3718 = arith.addi %3678, %__rlasp_stack_elide_zero_362 : i64
            %3719 = func.call @stack_pop_pointer() : () -> i64
            %3720 = func.call @cc_char_eq(%3719, %3718) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
            %3721 = arith.addi %3720, %__rlasp_stack_elide_zero_363 : i64
            %3722 = func.call @cc_cons(%3721, %3706) : (i64, i64) -> i64
            %3723 = func.call @cc_cons(%3717, %3722) : (i64, i64) -> i64
            %3724 = func.call @cc_or(%3723) : (i64) -> i64
            %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
            %3725 = arith.addi %3724, %__rlasp_stack_elide_zero_364 : i64
            func.call @stack_push_pointer(%3699) : (i64) -> ()
            %3726 = func.call @cc_nil_value() : () -> i64
            %3727 = func.call @cc_errorp(%3699) : (i64) -> i64
            %3728 = arith.cmpi ne, %3727, %3726 : i64
            %3729 = arith.cmpi eq, %3726, %3726 : i64
            %3730 = arith.andi %3728, %3729 : i1
            %3731 = scf.if %3730 -> (i64) {
              scf.yield %3699 : i64
            } else {
              scf.yield %3726 : i64
            }
            %3732 = arith.cmpi ne, %3731, %3726 : i64
            scf.if %3732 {
              func.call @stack_push_pointer(%3731) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3699) : (i64) -> ()
              %3733 = llvm.mlir.addressof @str279 : !llvm.ptr
              %3734 = func.call @cc_make_function_ref_const(%3733) : (!llvm.ptr) -> i64
              %3735 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3734, %3735) : (i64, i64) -> ()
            }
            %3736 = func.call @stack_pop_pointer() : () -> i64
            %3737 = func.call @stack_pop_pointer() : () -> i64
            %3738 = func.call @cc_char_eq(%3737, %3736) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
            %3739 = arith.addi %3738, %__rlasp_stack_elide_zero_365 : i64
            %3740 = func.call @cc_cons(%3739, %3705) : (i64, i64) -> i64
            %3741 = func.call @cc_cons(%3725, %3740) : (i64, i64) -> i64
            %3742 = func.call @cc_and(%3741) : (i64) -> i64
            %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
            %3743 = arith.addi %3742, %__rlasp_stack_elide_zero_366 : i64
            scf.yield %3743 : i64
          }
          %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
          %3744 = arith.addi %3704, %__rlasp_stack_elide_zero_367 : i64
          %3745 = func.call @cc_cons(%3744, %3683) : (i64, i64) -> i64
          %3746 = func.call @cc_cons(%3688, %3745) : (i64, i64) -> i64
          %3747 = func.call @cc_or(%3746) : (i64) -> i64
          %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
          %3748 = arith.addi %3747, %__rlasp_stack_elide_zero_368 : i64
          %3749 = func.call @cc_nil_value() : () -> i64
          %3750 = func.call @cc_cons(%3748, %3749) : (i64, i64) -> i64
          %3751 = func.call @cc_not(%3750) : (i64) -> i64
          %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
          %3752 = arith.addi %3751, %__rlasp_stack_elide_zero_369 : i64
          %3753 = func.call @cc_nil_value() : () -> i64
          %3754 = arith.cmpi ne, %3752, %3753 : i64
          %3755:2 = scf.if %3754 -> (i64, i64) {
            %3756 = func.call @cc_nil_value() : () -> i64
            %3757 = func.call @cc_nil_value() : () -> i64
            %3758 = func.call @cc_errorp(%3756) : (i64) -> i64
            %3759 = arith.cmpi ne, %3758, %3757 : i64
            %3760:2 = scf.if %3759 -> (i64, i64) {
              scf.yield %3756, %3664 : i64, i64
            } else {
              func.call @stack_push_pointer(%3664) : (i64) -> ()
              %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
              %3761 = arith.addi %3665, %__rlasp_stack_elide_zero_370 : i64
              %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
              %3762 = arith.addi %3678, %__rlasp_stack_elide_zero_371 : i64
              %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
              %3763 = arith.addi %3678, %__rlasp_stack_elide_zero_372 : i64
              %3764 = func.call @cc_char_name(%3763) : (i64) -> i64
              %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
              %3765 = arith.addi %3764, %__rlasp_stack_elide_zero_373 : i64
              %3766 = func.call @cc_nil_value() : () -> i64
              %3767 = func.call @cc_errorp(%3761) : (i64) -> i64
              %3768 = arith.cmpi ne, %3767, %3766 : i64
              %3769 = arith.cmpi eq, %3766, %3766 : i64
              %3770 = arith.andi %3768, %3769 : i1
              %3771 = scf.if %3770 -> (i64) {
                scf.yield %3761 : i64
              } else {
                scf.yield %3766 : i64
              }
              %3772 = func.call @cc_errorp(%3762) : (i64) -> i64
              %3773 = arith.cmpi ne, %3772, %3766 : i64
              %3774 = arith.cmpi eq, %3771, %3766 : i64
              %3775 = arith.andi %3773, %3774 : i1
              %3776 = scf.if %3775 -> (i64) {
                scf.yield %3762 : i64
              } else {
                scf.yield %3771 : i64
              }
              %3777 = func.call @cc_errorp(%3765) : (i64) -> i64
              %3778 = arith.cmpi ne, %3777, %3766 : i64
              %3779 = arith.cmpi eq, %3776, %3766 : i64
              %3780 = arith.andi %3778, %3779 : i1
              %3781 = scf.if %3780 -> (i64) {
                scf.yield %3765 : i64
              } else {
                scf.yield %3776 : i64
              }
              %3782 = arith.cmpi ne, %3781, %3766 : i64
              scf.if %3782 {
                func.call @stack_push_pointer(%3781) : (i64) -> ()
              } else {
                %3783 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%3783) : (i64) -> ()
                %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
                %3784 = arith.addi %3765, %__rlasp_stack_elide_zero_374 : i64
                %3785 = func.call @stack_pop_pointer() : () -> i64
                %3786 = func.call @cc_cons(%3784, %3785) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3786) : (i64) -> ()
                %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
                %3787 = arith.addi %3762, %__rlasp_stack_elide_zero_375 : i64
                %3788 = func.call @stack_pop_pointer() : () -> i64
                %3789 = func.call @cc_cons(%3787, %3788) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3789) : (i64) -> ()
                %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
                %3790 = arith.addi %3761, %__rlasp_stack_elide_zero_376 : i64
                %3791 = func.call @stack_pop_pointer() : () -> i64
                %3792 = func.call @cc_cons(%3790, %3791) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3792) : (i64) -> ()
              }
              %3793 = func.call @stack_pop_pointer() : () -> i64
              %3794 = func.call @cc_nil_value() : () -> i64
              %3795 = func.call @cc_errorp(%3793) : (i64) -> i64
              %3796 = arith.cmpi ne, %3795, %3794 : i64
              %3797 = arith.cmpi eq, %3794, %3794 : i64
              %3798 = arith.andi %3796, %3797 : i1
              %3799 = scf.if %3798 -> (i64) {
                scf.yield %3793 : i64
              } else {
                scf.yield %3794 : i64
              }
              %3800 = arith.cmpi ne, %3799, %3794 : i64
              scf.if %3800 {
                func.call @stack_push_pointer(%3799) : (i64) -> ()
              } else {
                %3801 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%3801) : (i64) -> ()
                %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
                %3802 = arith.addi %3793, %__rlasp_stack_elide_zero_377 : i64
                %3803 = func.call @stack_pop_pointer() : () -> i64
                %3804 = func.call @cc_cons(%3802, %3803) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3804) : (i64) -> ()
              }
              %3805 = func.call @stack_pop_pointer() : () -> i64
              %3806 = func.call @stack_pop_pointer() : () -> i64
              %3807 = func.call @cc_append(%3806, %3805) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
              %3808 = arith.addi %3807, %__rlasp_stack_elide_zero_378 : i64
              %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
              %3809 = arith.addi %3808, %__rlasp_stack_elide_zero_379 : i64
              scf.yield %3809, %3808 : i64, i64
            }
            %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
            %3810 = arith.addi %3760#0, %__rlasp_stack_elide_zero_380 : i64
            scf.yield %3810, %3760#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %3811 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3811, %3664 : i64, i64
          }
          func.call @stack_push_pointer(%3755#0) : (i64) -> ()
          %3812 = func.call @stack_depth() : () -> i64
          %3813 = arith.constant 0 : i64
          %3814 = arith.cmpi sgt, %3812, %3813 : i64
          scf.if %3814 {
            %3815 = func.call @stack_pop_pointer() : () -> i64
          }
          %3816 = arith.constant 1 : i64
          %3817 = func.call @cc_box_fixnum(%3816) : (i64) -> i64
          %3819 = arith.constant 3 : i64
          %3818 = arith.andi %3665, %3819 : i64
          %3820 = arith.constant 0 : i64
          %3821 = arith.cmpi eq, %3818, %3820 : i64
          %3823 = arith.constant 3 : i64
          %3822 = arith.andi %3817, %3823 : i64
          %3824 = arith.constant 0 : i64
          %3825 = arith.cmpi eq, %3822, %3824 : i64
          %3826 = arith.andi %3821, %3825 : i1
          %3827 = scf.if %3826 -> (i64) {
            %3828 = arith.constant 2 : i64
            %3829 = arith.shrsi %3665, %3828 : i64
            %3830 = arith.constant 2 : i64
            %3831 = arith.shrsi %3817, %3830 : i64
            %3832 = arith.addi %3829, %3831 : i64
            %3833 = arith.constant -2305843009213693952 : i64
            %3834 = arith.constant 2305843009213693951 : i64
            %3835 = arith.cmpi sge, %3832, %3833 : i64
            %3836 = arith.cmpi sle, %3832, %3834 : i64
            %3837 = arith.andi %3835, %3836 : i1
            %3838 = scf.if %3837 -> (i64) {
              %3839 = arith.constant 2 : i64
              %3840 = arith.shli %3832, %3839 : i64
              scf.yield %3840 : i64
            } else {
              %3841 = func.call @cc_add(%3665, %3817) : (i64, i64) -> i64
              scf.yield %3841 : i64
            }
            scf.yield %3838 : i64
          } else {
            %3842 = func.call @cc_add(%3665, %3817) : (i64, i64) -> i64
            scf.yield %3842 : i64
          }
          %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
          %3843 = arith.addi %3827, %__rlasp_stack_elide_zero_381 : i64
          func.call @stack_push_pointer(%3843) : (i64) -> ()
          %3844 = func.call @stack_depth() : () -> i64
          %3845 = arith.constant 0 : i64
          %3846 = arith.cmpi sgt, %3844, %3845 : i64
          scf.if %3846 {
            %3847 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %3666, %3665, %3678, %3755#1, %3843 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %3848 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
        %3849 = arith.addi %3605#0, %__rlasp_stack_elide_zero_382 : i64
        %3850 = func.call @cc_nil_value() : () -> i64
        %3851 = arith.cmpi ne, %3849, %3850 : i64
        %3852:2 = scf.if %3851 -> (i64, i64) {
          %3853 = func.call @cc_nil_value() : () -> i64
          %3854 = func.call @cc_nil_value() : () -> i64
          %3855 = func.call @cc_errorp(%3853) : (i64) -> i64
          %3856 = arith.cmpi ne, %3855, %3854 : i64
          %3857:2 = scf.if %3856 -> (i64, i64) {
            scf.yield %3853, %3605#4 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
            %3858 = arith.addi %3605#1, %__rlasp_stack_elide_zero_383 : i64
            scf.yield %3858, %3605#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
          %3859 = arith.addi %3857#0, %__rlasp_stack_elide_zero_384 : i64
          scf.yield %3859, %3857#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %3860 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3860, %3605#4 : i64, i64
        }
        %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
        %3861 = arith.addi %3852#0, %__rlasp_stack_elide_zero_385 : i64
        %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
        %3862 = arith.addi %3605#3, %__rlasp_stack_elide_zero_386 : i64
        %3863 = func.call @cc_multiple_value_list(%3862) : (i64) -> i64
        %3864 = llvm.mlir.addressof @str280 : !llvm.ptr
        %3865 = arith.constant 38 : i64
        %3866 = func.call @cc_make_string(%3864, %3865) : (!llvm.ptr, i64) -> i64
        %3867 = func.call @cc_nil_value() : () -> i64
        %3868 = func.call @cc_intern(%3866, %3867) : (i64, i64) -> i64
        %3869 = func.call @cc_nil_value() : () -> i64
        %3870 = func.call @cc_cons(%3868, %3869) : (i64, i64) -> i64
        %3871 = func.call @cc_values_pack(%3870) : (i64) -> i64
        %3872 = func.call @cc_symbol_value(%3868) : (i64) -> i64
        %3873 = llvm.mlir.addressof @str281 : !llvm.ptr
        %3874 = arith.constant 39 : i64
        %3875 = func.call @cc_make_string(%3873, %3874) : (!llvm.ptr, i64) -> i64
        %3876 = func.call @cc_nil_value() : () -> i64
        %3877 = func.call @cc_intern(%3875, %3876) : (i64, i64) -> i64
        %3878 = func.call @cc_nil_value() : () -> i64
        %3879 = func.call @cc_cons(%3877, %3878) : (i64, i64) -> i64
        %3880 = func.call @cc_values_pack(%3879) : (i64) -> i64
        %3881 = func.call @cc_symbol_value(%3877) : (i64) -> i64
        %3882 = llvm.mlir.addressof @str282 : !llvm.ptr
        %3883 = arith.constant 40 : i64
        %3884 = func.call @cc_make_string(%3882, %3883) : (!llvm.ptr, i64) -> i64
        %3885 = func.call @cc_nil_value() : () -> i64
        %3886 = func.call @cc_intern(%3884, %3885) : (i64, i64) -> i64
        %3887 = func.call @cc_nil_value() : () -> i64
        %3888 = func.call @cc_cons(%3886, %3887) : (i64, i64) -> i64
        %3889 = func.call @cc_values_pack(%3888) : (i64) -> i64
        %3890 = func.call @cc_symbol_value(%3886) : (i64) -> i64
        %3891 = func.call @cc_nil_value() : () -> i64
        %3892 = arith.cmpi ne, %3872, %3891 : i64
        %3893 = scf.if %3892 -> (i64) {
          scf.yield %3890 : i64
        } else {
          scf.yield %3863 : i64
        }
        %3894 = func.call @cc_values_pack(%3893) : (i64) -> i64
        %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
        %3895 = arith.addi %3894, %__rlasp_stack_elide_zero_387 : i64
        scf.yield %3895, %3605#0, %3605#1, %3605#3, %3852#1, %3605#2 : i64, i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %3896 = arith.addi %3576#0, %__rlasp_stack_elide_zero_388 : i64
      scf.yield %3896 : i64
    }
    func.call @stack_push_pointer(%3565) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296905"() {
    %4694 = func.call @cc_nil_value() : () -> i64
    %4695 = func.call @cc_nil_value() : () -> i64
    %4696 = func.call @cc_errorp(%4694) : (i64) -> i64
    %4697 = arith.cmpi ne, %4696, %4695 : i64
    %4698 = scf.if %4697 -> (i64) {
      scf.yield %4694 : i64
    } else {
      %4699 = arith.constant 0 : i64
      %4700 = func.call @cc_box_fixnum(%4699) : (i64) -> i64
      %4701 = func.call @cc_nil_value() : () -> i64
      %4702 = func.call @cc_nil_value() : () -> i64
      %4703 = func.call @cc_nil_value() : () -> i64
      %4704 = func.call @cc_nil_value() : () -> i64
      %4705 = func.call @cc_nil_value() : () -> i64
      %4706 = func.call @cc_nil_value() : () -> i64
      %4707 = func.call @cc_errorp(%4705) : (i64) -> i64
      %4708 = arith.cmpi ne, %4707, %4706 : i64
      %4709:6 = scf.if %4708 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %4705, %4704, %4701, %4703, %4700, %4702 : i64, i64, i64, i64, i64, i64
      } else {
        %4710 = func.call @cc_nil_value() : () -> i64
        %4711 = llvm.mlir.addressof @str350 : !llvm.ptr
        %4712 = arith.constant 38 : i64
        %4713 = func.call @cc_make_string(%4711, %4712) : (!llvm.ptr, i64) -> i64
        %4714 = func.call @cc_nil_value() : () -> i64
        %4715 = func.call @cc_intern(%4713, %4714) : (i64, i64) -> i64
        %4716 = func.call @cc_nil_value() : () -> i64
        %4717 = func.call @cc_cons(%4715, %4716) : (i64, i64) -> i64
        %4718 = func.call @cc_values_pack(%4717) : (i64) -> i64
        %4719 = func.call @cc_set_symbol_value(%4715, %4710) : (i64, i64) -> i64
        %4720 = llvm.mlir.addressof @str351 : !llvm.ptr
        %4721 = arith.constant 39 : i64
        %4722 = func.call @cc_make_string(%4720, %4721) : (!llvm.ptr, i64) -> i64
        %4723 = func.call @cc_nil_value() : () -> i64
        %4724 = func.call @cc_intern(%4722, %4723) : (i64, i64) -> i64
        %4725 = func.call @cc_nil_value() : () -> i64
        %4726 = func.call @cc_cons(%4724, %4725) : (i64, i64) -> i64
        %4727 = func.call @cc_values_pack(%4726) : (i64) -> i64
        %4728 = func.call @cc_set_symbol_value(%4724, %4710) : (i64, i64) -> i64
        %4729 = llvm.mlir.addressof @str352 : !llvm.ptr
        %4730 = arith.constant 40 : i64
        %4731 = func.call @cc_make_string(%4729, %4730) : (!llvm.ptr, i64) -> i64
        %4732 = func.call @cc_nil_value() : () -> i64
        %4733 = func.call @cc_intern(%4731, %4732) : (i64, i64) -> i64
        %4734 = func.call @cc_nil_value() : () -> i64
        %4735 = func.call @cc_cons(%4733, %4734) : (i64, i64) -> i64
        %4736 = func.call @cc_values_pack(%4735) : (i64) -> i64
        %4737 = func.call @cc_set_symbol_value(%4733, %4710) : (i64, i64) -> i64
        %4738:5 = scf.while (%arg0 = %4704, %arg1 = %4701, %arg2 = %4702, %arg3 = %4703, %arg4 = %4700) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
          %4739 = arith.addi %arg4, %__rlasp_stack_elide_zero_389 : i64
          %4740 = arith.constant 55296 : i64
          %4741 = func.call @cc_box_fixnum(%4740) : (i64) -> i64
          %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
          %4742 = arith.addi %4741, %__rlasp_stack_elide_zero_390 : i64
          %4743 = arith.constant 1 : i1
          %4745 = arith.constant 3 : i64
          %4744 = arith.andi %4739, %4745 : i64
          %4746 = arith.constant 0 : i64
          %4747 = arith.cmpi eq, %4744, %4746 : i64
          %4749 = arith.constant 3 : i64
          %4748 = arith.andi %4742, %4749 : i64
          %4750 = arith.constant 0 : i64
          %4751 = arith.cmpi eq, %4748, %4750 : i64
          %4752 = arith.andi %4747, %4751 : i1
          %4753 = scf.if %4752 -> (i1) {
            %4754 = arith.constant 2 : i64
            %4755 = arith.shrsi %4739, %4754 : i64
            %4756 = arith.constant 2 : i64
            %4757 = arith.shrsi %4742, %4756 : i64
            %4758 = arith.cmpi slt, %4755, %4757 : i64
            scf.yield %4758 : i1
          } else {
            %4759 = func.call @cc_lt(%4739, %4742) : (i64, i64) -> i64
            %4760 = func.call @cc_nil_value() : () -> i64
            %4761 = arith.cmpi ne, %4759, %4760 : i64
            scf.yield %4761 : i1
          }
          %4762 = arith.andi %4743, %4753 : i1
          %4763 = func.call @cc_nil_value() : () -> i64
          %4764 = func.call @cc_t_value() : () -> i64
          %4765 = scf.if %4762 -> (i64) {
            scf.yield %4764 : i64
          } else {
            scf.yield %4763 : i64
          }
          %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
          %4766 = arith.addi %4765, %__rlasp_stack_elide_zero_391 : i64
          %4767 = func.call @cc_nil_value() : () -> i64
          %4768 = arith.cmpi ne, %4766, %4767 : i64
          %4769 = func.call @cc_nil_value() : () -> i64
          %4770 = llvm.mlir.addressof @str353 : !llvm.ptr
          %4771 = arith.constant 38 : i64
          %4772 = func.call @cc_make_string(%4770, %4771) : (!llvm.ptr, i64) -> i64
          %4773 = func.call @cc_nil_value() : () -> i64
          %4774 = func.call @cc_intern(%4772, %4773) : (i64, i64) -> i64
          %4775 = func.call @cc_nil_value() : () -> i64
          %4776 = func.call @cc_cons(%4774, %4775) : (i64, i64) -> i64
          %4777 = func.call @cc_values_pack(%4776) : (i64) -> i64
          %4778 = func.call @cc_symbol_value(%4774) : (i64) -> i64
          %4779 = arith.cmpi ne, %4778, %4769 : i64
          %4780 = llvm.mlir.addressof @str354 : !llvm.ptr
          %4781 = arith.constant 38 : i64
          %4782 = func.call @cc_make_string(%4780, %4781) : (!llvm.ptr, i64) -> i64
          %4783 = func.call @cc_nil_value() : () -> i64
          %4784 = func.call @cc_intern(%4782, %4783) : (i64, i64) -> i64
          %4785 = func.call @cc_nil_value() : () -> i64
          %4786 = func.call @cc_cons(%4784, %4785) : (i64, i64) -> i64
          %4787 = func.call @cc_values_pack(%4786) : (i64) -> i64
          %4788 = func.call @cc_symbol_value(%4784) : (i64) -> i64
          %4789 = arith.cmpi ne, %4788, %4769 : i64
          %4790 = arith.ori %4779, %4789 : i1
          %4791 = arith.constant 0 : i1
          %4792 = arith.cmpi eq, %4790, %4791 : i1
          %4793 = arith.andi %4768, %4792 : i1
          scf.condition(%4793) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%4794: i64, %4795: i64, %4796: i64, %4797: i64, %4798: i64):
          %4799 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%4799) : (i64) -> ()
          %4800 = func.call @stack_depth() : () -> i64
          %4801 = arith.constant 0 : i64
          %4802 = arith.cmpi sgt, %4800, %4801 : i64
          scf.if %4802 {
            %4803 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%4798) : (i64) -> ()
          %4804 = func.call @stack_depth() : () -> i64
          %4805 = arith.constant 0 : i64
          %4806 = arith.cmpi sgt, %4804, %4805 : i64
          scf.if %4806 {
            %4807 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
          %4808 = arith.addi %4798, %__rlasp_stack_elide_zero_392 : i64
          %4809 = func.call @cc_unbox_fixnum(%4808) : (i64) -> i64
          %4810 = func.call @cc_box_character(%4809) : (i64) -> i64
          %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
          %4811 = arith.addi %4810, %__rlasp_stack_elide_zero_393 : i64
          func.call @stack_push_pointer(%4811) : (i64) -> ()
          %4812 = func.call @stack_depth() : () -> i64
          %4813 = arith.constant 0 : i64
          %4814 = arith.cmpi sgt, %4812, %4813 : i64
          scf.if %4814 {
            %4815 = func.call @stack_pop_pointer() : () -> i64
          }
          %4816 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
          %4817 = arith.addi %4811, %__rlasp_stack_elide_zero_394 : i64
          %4818 = func.call @cc_nil_value() : () -> i64
          %4819 = func.call @cc_errorp(%4811) : (i64) -> i64
          %4820 = arith.cmpi ne, %4819, %4818 : i64
          %4821 = arith.cmpi eq, %4818, %4818 : i64
          %4822 = arith.andi %4820, %4821 : i1
          %4823 = scf.if %4822 -> (i64) {
            scf.yield %4811 : i64
          } else {
            scf.yield %4818 : i64
          }
          %4824 = arith.cmpi ne, %4823, %4818 : i64
          scf.if %4824 {
            func.call @stack_push_pointer(%4823) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4811) : (i64) -> ()
            %4825 = llvm.mlir.addressof @str355 : !llvm.ptr
            %4826 = func.call @cc_make_function_ref_const(%4825) : (!llvm.ptr) -> i64
            %4827 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4826, %4827) : (i64, i64) -> ()
          }
          %4828 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4811) : (i64) -> ()
          %4829 = func.call @cc_nil_value() : () -> i64
          %4830 = func.call @cc_errorp(%4811) : (i64) -> i64
          %4831 = arith.cmpi ne, %4830, %4829 : i64
          %4832 = arith.cmpi eq, %4829, %4829 : i64
          %4833 = arith.andi %4831, %4832 : i1
          %4834 = scf.if %4833 -> (i64) {
            scf.yield %4811 : i64
          } else {
            scf.yield %4829 : i64
          }
          %4835 = arith.cmpi ne, %4834, %4829 : i64
          scf.if %4835 {
            func.call @stack_push_pointer(%4834) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4811) : (i64) -> ()
            %4836 = llvm.mlir.addressof @str356 : !llvm.ptr
            %4837 = func.call @cc_make_function_ref_const(%4836) : (!llvm.ptr) -> i64
            %4838 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4837, %4838) : (i64, i64) -> ()
          }
          %4839 = func.call @stack_pop_pointer() : () -> i64
          %4840 = func.call @stack_pop_pointer() : () -> i64
          %4841 = func.call @cc_char_eq(%4840, %4839) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
          %4842 = arith.addi %4841, %__rlasp_stack_elide_zero_395 : i64
          %4843 = func.call @cc_cons(%4842, %4816) : (i64, i64) -> i64
          %4844 = func.call @cc_cons(%4828, %4843) : (i64, i64) -> i64
          %4845 = func.call @cc_cons(%4817, %4844) : (i64, i64) -> i64
          %4846 = func.call @cc_and(%4845) : (i64) -> i64
          %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
          %4847 = arith.addi %4846, %__rlasp_stack_elide_zero_396 : i64
          %4848 = func.call @cc_nil_value() : () -> i64
          %4849 = arith.cmpi ne, %4847, %4848 : i64
          %4850:2 = scf.if %4849 -> (i64, i64) {
            %4851 = func.call @cc_nil_value() : () -> i64
            %4852 = func.call @cc_nil_value() : () -> i64
            %4853 = func.call @cc_errorp(%4851) : (i64) -> i64
            %4854 = arith.cmpi ne, %4853, %4852 : i64
            %4855:2 = scf.if %4854 -> (i64, i64) {
              scf.yield %4851, %4797 : i64, i64
            } else {
              func.call @stack_push_pointer(%4797) : (i64) -> ()
              %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
              %4856 = arith.addi %4798, %__rlasp_stack_elide_zero_397 : i64
              %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
              %4857 = arith.addi %4811, %__rlasp_stack_elide_zero_398 : i64
              %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
              %4858 = arith.addi %4811, %__rlasp_stack_elide_zero_399 : i64
              %4859 = func.call @cc_char_name(%4858) : (i64) -> i64
              %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
              %4860 = arith.addi %4859, %__rlasp_stack_elide_zero_400 : i64
              %4861 = func.call @cc_nil_value() : () -> i64
              %4862 = func.call @cc_errorp(%4856) : (i64) -> i64
              %4863 = arith.cmpi ne, %4862, %4861 : i64
              %4864 = arith.cmpi eq, %4861, %4861 : i64
              %4865 = arith.andi %4863, %4864 : i1
              %4866 = scf.if %4865 -> (i64) {
                scf.yield %4856 : i64
              } else {
                scf.yield %4861 : i64
              }
              %4867 = func.call @cc_errorp(%4857) : (i64) -> i64
              %4868 = arith.cmpi ne, %4867, %4861 : i64
              %4869 = arith.cmpi eq, %4866, %4861 : i64
              %4870 = arith.andi %4868, %4869 : i1
              %4871 = scf.if %4870 -> (i64) {
                scf.yield %4857 : i64
              } else {
                scf.yield %4866 : i64
              }
              %4872 = func.call @cc_errorp(%4860) : (i64) -> i64
              %4873 = arith.cmpi ne, %4872, %4861 : i64
              %4874 = arith.cmpi eq, %4871, %4861 : i64
              %4875 = arith.andi %4873, %4874 : i1
              %4876 = scf.if %4875 -> (i64) {
                scf.yield %4860 : i64
              } else {
                scf.yield %4871 : i64
              }
              %4877 = arith.cmpi ne, %4876, %4861 : i64
              scf.if %4877 {
                func.call @stack_push_pointer(%4876) : (i64) -> ()
              } else {
                %4878 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%4878) : (i64) -> ()
                %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
                %4879 = arith.addi %4860, %__rlasp_stack_elide_zero_401 : i64
                %4880 = func.call @stack_pop_pointer() : () -> i64
                %4881 = func.call @cc_cons(%4879, %4880) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4881) : (i64) -> ()
                %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
                %4882 = arith.addi %4857, %__rlasp_stack_elide_zero_402 : i64
                %4883 = func.call @stack_pop_pointer() : () -> i64
                %4884 = func.call @cc_cons(%4882, %4883) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4884) : (i64) -> ()
                %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
                %4885 = arith.addi %4856, %__rlasp_stack_elide_zero_403 : i64
                %4886 = func.call @stack_pop_pointer() : () -> i64
                %4887 = func.call @cc_cons(%4885, %4886) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4887) : (i64) -> ()
              }
              %4888 = func.call @stack_pop_pointer() : () -> i64
              %4889 = func.call @cc_nil_value() : () -> i64
              %4890 = func.call @cc_errorp(%4888) : (i64) -> i64
              %4891 = arith.cmpi ne, %4890, %4889 : i64
              %4892 = arith.cmpi eq, %4889, %4889 : i64
              %4893 = arith.andi %4891, %4892 : i1
              %4894 = scf.if %4893 -> (i64) {
                scf.yield %4888 : i64
              } else {
                scf.yield %4889 : i64
              }
              %4895 = arith.cmpi ne, %4894, %4889 : i64
              scf.if %4895 {
                func.call @stack_push_pointer(%4894) : (i64) -> ()
              } else {
                %4896 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%4896) : (i64) -> ()
                %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
                %4897 = arith.addi %4888, %__rlasp_stack_elide_zero_404 : i64
                %4898 = func.call @stack_pop_pointer() : () -> i64
                %4899 = func.call @cc_cons(%4897, %4898) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4899) : (i64) -> ()
              }
              %4900 = func.call @stack_pop_pointer() : () -> i64
              %4901 = func.call @stack_pop_pointer() : () -> i64
              %4902 = func.call @cc_append(%4901, %4900) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
              %4903 = arith.addi %4902, %__rlasp_stack_elide_zero_405 : i64
              %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
              %4904 = arith.addi %4903, %__rlasp_stack_elide_zero_406 : i64
              scf.yield %4904, %4903 : i64, i64
            }
            %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
            %4905 = arith.addi %4855#0, %__rlasp_stack_elide_zero_407 : i64
            scf.yield %4905, %4855#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %4906 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4906, %4797 : i64, i64
          }
          func.call @stack_push_pointer(%4850#0) : (i64) -> ()
          %4907 = func.call @stack_depth() : () -> i64
          %4908 = arith.constant 0 : i64
          %4909 = arith.cmpi sgt, %4907, %4908 : i64
          scf.if %4909 {
            %4910 = func.call @stack_pop_pointer() : () -> i64
          }
          %4911 = arith.constant 1 : i64
          %4912 = func.call @cc_box_fixnum(%4911) : (i64) -> i64
          %4914 = arith.constant 3 : i64
          %4913 = arith.andi %4798, %4914 : i64
          %4915 = arith.constant 0 : i64
          %4916 = arith.cmpi eq, %4913, %4915 : i64
          %4918 = arith.constant 3 : i64
          %4917 = arith.andi %4912, %4918 : i64
          %4919 = arith.constant 0 : i64
          %4920 = arith.cmpi eq, %4917, %4919 : i64
          %4921 = arith.andi %4916, %4920 : i1
          %4922 = scf.if %4921 -> (i64) {
            %4923 = arith.constant 2 : i64
            %4924 = arith.shrsi %4798, %4923 : i64
            %4925 = arith.constant 2 : i64
            %4926 = arith.shrsi %4912, %4925 : i64
            %4927 = arith.addi %4924, %4926 : i64
            %4928 = arith.constant -2305843009213693952 : i64
            %4929 = arith.constant 2305843009213693951 : i64
            %4930 = arith.cmpi sge, %4927, %4928 : i64
            %4931 = arith.cmpi sle, %4927, %4929 : i64
            %4932 = arith.andi %4930, %4931 : i1
            %4933 = scf.if %4932 -> (i64) {
              %4934 = arith.constant 2 : i64
              %4935 = arith.shli %4927, %4934 : i64
              scf.yield %4935 : i64
            } else {
              %4936 = func.call @cc_add(%4798, %4912) : (i64, i64) -> i64
              scf.yield %4936 : i64
            }
            scf.yield %4933 : i64
          } else {
            %4937 = func.call @cc_add(%4798, %4912) : (i64, i64) -> i64
            scf.yield %4937 : i64
          }
          %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
          %4938 = arith.addi %4922, %__rlasp_stack_elide_zero_408 : i64
          func.call @stack_push_pointer(%4938) : (i64) -> ()
          %4939 = func.call @stack_depth() : () -> i64
          %4940 = arith.constant 0 : i64
          %4941 = arith.cmpi sgt, %4939, %4940 : i64
          scf.if %4941 {
            %4942 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %4799, %4798, %4811, %4850#1, %4938 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %4943 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
        %4944 = arith.addi %4738#0, %__rlasp_stack_elide_zero_409 : i64
        %4945 = func.call @cc_nil_value() : () -> i64
        %4946 = arith.cmpi ne, %4944, %4945 : i64
        %4947:2 = scf.if %4946 -> (i64, i64) {
          %4948 = func.call @cc_nil_value() : () -> i64
          %4949 = func.call @cc_nil_value() : () -> i64
          %4950 = func.call @cc_errorp(%4948) : (i64) -> i64
          %4951 = arith.cmpi ne, %4950, %4949 : i64
          %4952:2 = scf.if %4951 -> (i64, i64) {
            scf.yield %4948, %4738#4 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
            %4953 = arith.addi %4738#1, %__rlasp_stack_elide_zero_410 : i64
            scf.yield %4953, %4738#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
          %4954 = arith.addi %4952#0, %__rlasp_stack_elide_zero_411 : i64
          scf.yield %4954, %4952#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %4955 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4955, %4738#4 : i64, i64
        }
        %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
        %4956 = arith.addi %4947#0, %__rlasp_stack_elide_zero_412 : i64
        %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
        %4957 = arith.addi %4738#3, %__rlasp_stack_elide_zero_413 : i64
        %4958 = func.call @cc_multiple_value_list(%4957) : (i64) -> i64
        %4959 = llvm.mlir.addressof @str357 : !llvm.ptr
        %4960 = arith.constant 38 : i64
        %4961 = func.call @cc_make_string(%4959, %4960) : (!llvm.ptr, i64) -> i64
        %4962 = func.call @cc_nil_value() : () -> i64
        %4963 = func.call @cc_intern(%4961, %4962) : (i64, i64) -> i64
        %4964 = func.call @cc_nil_value() : () -> i64
        %4965 = func.call @cc_cons(%4963, %4964) : (i64, i64) -> i64
        %4966 = func.call @cc_values_pack(%4965) : (i64) -> i64
        %4967 = func.call @cc_symbol_value(%4963) : (i64) -> i64
        %4968 = llvm.mlir.addressof @str358 : !llvm.ptr
        %4969 = arith.constant 39 : i64
        %4970 = func.call @cc_make_string(%4968, %4969) : (!llvm.ptr, i64) -> i64
        %4971 = func.call @cc_nil_value() : () -> i64
        %4972 = func.call @cc_intern(%4970, %4971) : (i64, i64) -> i64
        %4973 = func.call @cc_nil_value() : () -> i64
        %4974 = func.call @cc_cons(%4972, %4973) : (i64, i64) -> i64
        %4975 = func.call @cc_values_pack(%4974) : (i64) -> i64
        %4976 = func.call @cc_symbol_value(%4972) : (i64) -> i64
        %4977 = llvm.mlir.addressof @str359 : !llvm.ptr
        %4978 = arith.constant 40 : i64
        %4979 = func.call @cc_make_string(%4977, %4978) : (!llvm.ptr, i64) -> i64
        %4980 = func.call @cc_nil_value() : () -> i64
        %4981 = func.call @cc_intern(%4979, %4980) : (i64, i64) -> i64
        %4982 = func.call @cc_nil_value() : () -> i64
        %4983 = func.call @cc_cons(%4981, %4982) : (i64, i64) -> i64
        %4984 = func.call @cc_values_pack(%4983) : (i64) -> i64
        %4985 = func.call @cc_symbol_value(%4981) : (i64) -> i64
        %4986 = func.call @cc_nil_value() : () -> i64
        %4987 = arith.cmpi ne, %4967, %4986 : i64
        %4988 = scf.if %4987 -> (i64) {
          scf.yield %4985 : i64
        } else {
          scf.yield %4958 : i64
        }
        %4989 = func.call @cc_values_pack(%4988) : (i64) -> i64
        %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
        %4990 = arith.addi %4989, %__rlasp_stack_elide_zero_414 : i64
        scf.yield %4990, %4738#0, %4738#1, %4738#3, %4947#1, %4738#2 : i64, i64, i64, i64, i64, i64
      }
      %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
      %4991 = arith.addi %4709#0, %__rlasp_stack_elide_zero_415 : i64
      scf.yield %4991 : i64
    }
    func.call @stack_push_pointer(%4698) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_271595545296896*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_271595545296896*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("UNICODE-DOWNCASE-1\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str6("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str9("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str15("UNICODE-UPCASE-1\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str16("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str19("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str25("CHAR-UPCASE.2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str26("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str27("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str29("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str30("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str31("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str32("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str33("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str35("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str36("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str37("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str41("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str43("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str44("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str46("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str47("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str48("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str49("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str50("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str51("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str56("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str58("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str61("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str68("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str71("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str72("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str75("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str78("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str81("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str82("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str83("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str87("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str90("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str91("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str92("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str93("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str94("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str95("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str96("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str97("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str99("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str100("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str101("*__MLIR_BLOCK_RETFLAG_271595545296900*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str102("*__MLIR_BLOCK_RETVALUE_271595545296900*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str103("*__MLIR_BLOCK_RETMVLIST_271595545296900*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str104("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str105("*__MLIR_BLOCK_RETFLAG_271595545296900*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str106("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str108("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("*__MLIR_BLOCK_RETFLAG_271595545296900*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str110("*__MLIR_BLOCK_RETVALUE_271595545296900*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str111("*__MLIR_BLOCK_RETMVLIST_271595545296900*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str112("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("CHAR-UPCASE.2A\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str119("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str120("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str121("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str122("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str123("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str124("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str125("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str127("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str129("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str130("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str133("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str134("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str135("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str136("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str137("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str138("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str139("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str142("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str143("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str146("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str149("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str150("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str151("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str152("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str156("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str157("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str158("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str159("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str160("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str162("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str164("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str165("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str168("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str170("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str172("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str173("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str174("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str175("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str176("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str177("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str178("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETFLAG_271595545296902*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETVALUE_271595545296902*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str181("*__MLIR_BLOCK_RETMVLIST_271595545296902*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str182("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str183("*__MLIR_BLOCK_RETFLAG_271595545296902*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str184("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str185("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("*__MLIR_BLOCK_RETFLAG_271595545296902*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str187("*__MLIR_BLOCK_RETVALUE_271595545296902*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str188("*__MLIR_BLOCK_RETMVLIST_271595545296902*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str189("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str193("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str194("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str195("CHAR-DOWNCASE.2\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str196("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str198("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str199("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str200("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str201("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str202("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str203("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str204("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str205("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str207("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str211("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str212("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str213("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str216("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str219("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str220("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str221("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str222("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str224("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str226("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str227("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str228("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str229("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str231("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str234("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str238("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str241("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str242("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str245("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str248("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str250("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str251("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str252("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str253("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str257("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str258("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str259("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str261("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str262("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str263("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str264("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str265("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str266("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str267("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str268("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str269("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str270("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str271("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETFLAG_271595545296904*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str273("*__MLIR_BLOCK_RETVALUE_271595545296904*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str274("*__MLIR_BLOCK_RETMVLIST_271595545296904*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str275("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str276("*__MLIR_BLOCK_RETFLAG_271595545296904*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str277("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str278("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str279("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str280("*__MLIR_BLOCK_RETFLAG_271595545296904*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str281("*__MLIR_BLOCK_RETVALUE_271595545296904*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str282("*__MLIR_BLOCK_RETMVLIST_271595545296904*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str283("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str289("CHAR-DOWNCASE.2A\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str290("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str291("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str292("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str293("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str294("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str295("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str296("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str297("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str298("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str299("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str300("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str301("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str304("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str305("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str306("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str307("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str308("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str309("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str310("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str311("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str312("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str313("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str314("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str315("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str317("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str318("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str320("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str323("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str326("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str327("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str328("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str329("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str330("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str331("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str332("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str335("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str336("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str337("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str338("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str339("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str340("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str341("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str342("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str343("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str344("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str345("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str346("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str347("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str348("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str349("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str350("*__MLIR_BLOCK_RETFLAG_271595545296906*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str351("*__MLIR_BLOCK_RETVALUE_271595545296906*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str352("*__MLIR_BLOCK_RETMVLIST_271595545296906*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str353("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str354("*__MLIR_BLOCK_RETFLAG_271595545296906*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str355("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str356("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str357("*__MLIR_BLOCK_RETFLAG_271595545296906*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str358("*__MLIR_BLOCK_RETVALUE_271595545296906*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str359("*__MLIR_BLOCK_RETMVLIST_271595545296906*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str360("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str362("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str363("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str364("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str365("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str366("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str367("*__MLIR_BLOCK_RETMVLIST_271595545296896*\00") : !llvm.array<41 x i8>
}
