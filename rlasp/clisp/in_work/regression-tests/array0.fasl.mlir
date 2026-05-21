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
    %10 = arith.constant 37 : i64
    %11 = func.call @cc_make_string(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_nil_value() : () -> i64
    %13 = func.call @cc_intern(%11, %12) : (i64, i64) -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = func.call @cc_cons(%13, %14) : (i64, i64) -> i64
    %16 = func.call @cc_values_pack(%15) : (i64) -> i64
    %17 = func.call @cc_set_symbol_value(%13, %8) : (i64, i64) -> i64
    %18 = llvm.mlir.addressof @str2 : !llvm.ptr
    %19 = arith.constant 38 : i64
    %20 = func.call @cc_make_string(%18, %19) : (!llvm.ptr, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_intern(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_nil_value() : () -> i64
    %24 = func.call @cc_cons(%22, %23) : (i64, i64) -> i64
    %25 = func.call @cc_values_pack(%24) : (i64) -> i64
    %26 = func.call @cc_set_symbol_value(%22, %8) : (i64, i64) -> i64
    %27 = llvm.mlir.addressof @str3 : !llvm.ptr
    %28 = arith.constant 39 : i64
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
      %57 = arith.constant 16 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_nil_value() : () -> i64
      %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
      %63 = func.call @cc_values_pack(%62) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %64 = arith.addi %60, %__rlasp_stack_elide_zero_2 : i64
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 15 : i64
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
      %76 = arith.constant 10 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = llvm.mlir.addressof @str9 : !llvm.ptr
      %79 = arith.constant 11 : i64
      %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
      %81 = func.call @cc_intern(%77, %80) : (i64, i64) -> i64
      %82 = func.call @cc_nil_value() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      %84 = func.call @cc_values_pack(%83) : (i64) -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      %85 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%85) : (i64) -> ()
      %86 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%86) : (i64) -> ()
      %87 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%87) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = func.call @cc_cons(%89, %88) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %91 = arith.addi %90, %__rlasp_stack_elide_zero_3 : i64
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @cc_cons(%92, %91) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %94 = arith.addi %93, %__rlasp_stack_elide_zero_4 : i64
      %95 = func.call @stack_pop_pointer() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = llvm.mlir.addressof @str10 : !llvm.ptr
      %98 = arith.constant 5 : i64
      %99 = func.call @cc_make_string(%97, %98) : (!llvm.ptr, i64) -> i64
      %100 = func.call @cc_nil_value() : () -> i64
      %101 = func.call @cc_intern(%99, %100) : (i64, i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_cons(%101, %102) : (i64, i64) -> i64
      %104 = func.call @cc_values_pack(%103) : (i64) -> i64
      %105 = func.call @cc_cons(%101, %96) : (i64, i64) -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
      %106 = llvm.mlir.addressof @str11 : !llvm.ptr
      %107 = arith.constant 12 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = llvm.mlir.addressof @str12 : !llvm.ptr
      %110 = arith.constant 7 : i64
      %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
      %112 = func.call @cc_intern(%108, %111) : (i64, i64) -> i64
      %113 = func.call @cc_nil_value() : () -> i64
      %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
      %115 = func.call @cc_values_pack(%114) : (i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %116 = func.call @cc_t_value() : () -> i64
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
      %127 = func.call @stack_pop_pointer() : () -> i64
      %128 = func.call @cc_cons(%127, %126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%128) : (i64) -> ()
      %129 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %130 = func.call @stack_pop_pointer() : () -> i64
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @cc_cons(%131, %130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %133 = arith.addi %132, %__rlasp_stack_elide_zero_8 : i64
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = func.call @cc_cons(%134, %133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %136 = arith.addi %135, %__rlasp_stack_elide_zero_9 : i64
      %137 = func.call @stack_pop_pointer() : () -> i64
      %138 = func.call @cc_cons(%137, %136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %139 = arith.addi %138, %__rlasp_stack_elide_zero_10 : i64
      %204 = arith.constant 15079495958529 : i64
      %205 = arith.constant 0 : i64
      %206 = func.call @cc_make_closure(%204, %205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %207 = arith.addi %206, %__rlasp_stack_elide_zero_11 : i64
      %208 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %209 = func.call @stack_pop_pointer() : () -> i64
      %210 = func.call @stack_pop_pointer() : () -> i64
      %211 = func.call @cc_cons(%210, %209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %212 = arith.addi %211, %__rlasp_stack_elide_zero_12 : i64
      %213 = llvm.mlir.addressof @str17 : !llvm.ptr
      %214 = arith.constant 11 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = llvm.mlir.addressof @str18 : !llvm.ptr
      %217 = arith.constant 7 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = func.call @cc_intern(%215, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      %223 = func.call @cc_nil_value() : () -> i64
      %224 = llvm.mlir.addressof @str19 : !llvm.ptr
      %225 = arith.constant 4 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = llvm.mlir.addressof @str20 : !llvm.ptr
      %228 = arith.constant 7 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = func.call @cc_intern(%226, %229) : (i64, i64) -> i64
      %231 = func.call @cc_nil_value() : () -> i64
      %232 = func.call @cc_cons(%230, %231) : (i64, i64) -> i64
      %233 = func.call @cc_values_pack(%232) : (i64) -> i64
      %234 = llvm.mlir.addressof @str21 : !llvm.ptr
      %235 = arith.constant 6 : i64
      %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
      %237 = func.call @cc_nil_value() : () -> i64
      %238 = func.call @cc_intern(%236, %237) : (i64, i64) -> i64
      %239 = func.call @cc_nil_value() : () -> i64
      %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
      %241 = func.call @cc_values_pack(%240) : (i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %242 = arith.addi %238, %__rlasp_stack_elide_zero_13 : i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = func.call @cc_errorp(%64) : (i64) -> i64
      %245 = arith.cmpi ne, %244, %243 : i64
      %246 = arith.cmpi eq, %243, %243 : i64
      %247 = arith.andi %245, %246 : i1
      %248 = scf.if %247 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %243 : i64
      }
      %249 = func.call @cc_errorp(%139) : (i64) -> i64
      %250 = arith.cmpi ne, %249, %243 : i64
      %251 = arith.cmpi eq, %248, %243 : i64
      %252 = arith.andi %250, %251 : i1
      %253 = scf.if %252 -> (i64) {
        scf.yield %139 : i64
      } else {
        scf.yield %248 : i64
      }
      %254 = func.call @cc_errorp(%207) : (i64) -> i64
      %255 = arith.cmpi ne, %254, %243 : i64
      %256 = arith.cmpi eq, %253, %243 : i64
      %257 = arith.andi %255, %256 : i1
      %258 = scf.if %257 -> (i64) {
        scf.yield %207 : i64
      } else {
        scf.yield %253 : i64
      }
      %259 = func.call @cc_errorp(%212) : (i64) -> i64
      %260 = arith.cmpi ne, %259, %243 : i64
      %261 = arith.cmpi eq, %258, %243 : i64
      %262 = arith.andi %260, %261 : i1
      %263 = scf.if %262 -> (i64) {
        scf.yield %212 : i64
      } else {
        scf.yield %258 : i64
      }
      %264 = func.call @cc_errorp(%219) : (i64) -> i64
      %265 = arith.cmpi ne, %264, %243 : i64
      %266 = arith.cmpi eq, %263, %243 : i64
      %267 = arith.andi %265, %266 : i1
      %268 = scf.if %267 -> (i64) {
        scf.yield %219 : i64
      } else {
        scf.yield %263 : i64
      }
      %269 = func.call @cc_errorp(%223) : (i64) -> i64
      %270 = arith.cmpi ne, %269, %243 : i64
      %271 = arith.cmpi eq, %268, %243 : i64
      %272 = arith.andi %270, %271 : i1
      %273 = scf.if %272 -> (i64) {
        scf.yield %223 : i64
      } else {
        scf.yield %268 : i64
      }
      %274 = func.call @cc_errorp(%230) : (i64) -> i64
      %275 = arith.cmpi ne, %274, %243 : i64
      %276 = arith.cmpi eq, %273, %243 : i64
      %277 = arith.andi %275, %276 : i1
      %278 = scf.if %277 -> (i64) {
        scf.yield %230 : i64
      } else {
        scf.yield %273 : i64
      }
      %279 = func.call @cc_errorp(%242) : (i64) -> i64
      %280 = arith.cmpi ne, %279, %243 : i64
      %281 = arith.cmpi eq, %278, %243 : i64
      %282 = arith.andi %280, %281 : i1
      %283 = scf.if %282 -> (i64) {
        scf.yield %242 : i64
      } else {
        scf.yield %278 : i64
      }
      %284 = arith.cmpi ne, %283, %243 : i64
      scf.if %284 {
        func.call @stack_push_pointer(%283) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%139) : (i64) -> ()
        func.call @stack_push_pointer(%207) : (i64) -> ()
        func.call @stack_push_pointer(%212) : (i64) -> ()
        func.call @stack_push_pointer(%219) : (i64) -> ()
        func.call @stack_push_pointer(%223) : (i64) -> ()
        func.call @stack_push_pointer(%230) : (i64) -> ()
        func.call @stack_push_pointer(%242) : (i64) -> ()
        %285 = llvm.mlir.addressof @str22 : !llvm.ptr
        %286 = func.call @cc_make_function_ref_const(%285) : (!llvm.ptr) -> i64
        %287 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%286, %287) : (i64, i64) -> ()
      }
      %288 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %288 : i64
    }
    %289 = func.call @cc_nil_value() : () -> i64
    %290 = func.call @cc_errorp(%55) : (i64) -> i64
    %291 = arith.cmpi ne, %290, %289 : i64
    %292 = scf.if %291 -> (i64) {
      scf.yield %55 : i64
    } else {
      %293 = llvm.mlir.addressof @str23 : !llvm.ptr
      %294 = arith.constant 27 : i64
      %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
      %296 = func.call @cc_nil_value() : () -> i64
      %297 = func.call @cc_intern(%295, %296) : (i64, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_values_pack(%299) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %301 = arith.addi %297, %__rlasp_stack_elide_zero_14 : i64
      %302 = llvm.mlir.addressof @str24 : !llvm.ptr
      %303 = arith.constant 3 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_intern(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_values_pack(%308) : (i64) -> i64
      func.call @stack_push_pointer(%306) : (i64) -> ()
      %310 = llvm.mlir.addressof @str25 : !llvm.ptr
      %311 = arith.constant 3 : i64
      %312 = func.call @cc_make_string(%310, %311) : (!llvm.ptr, i64) -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_intern(%312, %313) : (i64, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_values_pack(%316) : (i64) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      %318 = llvm.mlir.addressof @str26 : !llvm.ptr
      %319 = arith.constant 8 : i64
      %320 = func.call @cc_make_string(%318, %319) : (!llvm.ptr, i64) -> i64
      %321 = llvm.mlir.addressof @str27 : !llvm.ptr
      %322 = arith.constant 11 : i64
      %323 = func.call @cc_make_string(%321, %322) : (!llvm.ptr, i64) -> i64
      %324 = func.call @cc_intern(%320, %323) : (i64, i64) -> i64
      %325 = func.call @cc_nil_value() : () -> i64
      %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
      %327 = func.call @cc_values_pack(%326) : (i64) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      %328 = llvm.mlir.addressof @str28 : !llvm.ptr
      %329 = arith.constant 7 : i64
      %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
      %331 = llvm.mlir.addressof @str29 : !llvm.ptr
      %332 = arith.constant 11 : i64
      %333 = func.call @cc_make_string(%331, %332) : (!llvm.ptr, i64) -> i64
      %334 = func.call @cc_intern(%330, %333) : (i64, i64) -> i64
      %335 = func.call @cc_nil_value() : () -> i64
      %336 = func.call @cc_cons(%334, %335) : (i64, i64) -> i64
      %337 = func.call @cc_values_pack(%336) : (i64) -> i64
      func.call @stack_push_pointer(%334) : (i64) -> ()
      %338 = llvm.mlir.addressof @str30 : !llvm.ptr
      %339 = arith.constant 13 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = llvm.mlir.addressof @str31 : !llvm.ptr
      %342 = arith.constant 11 : i64
      %343 = func.call @cc_make_string(%341, %342) : (!llvm.ptr, i64) -> i64
      %344 = func.call @cc_intern(%340, %343) : (i64, i64) -> i64
      %345 = func.call @cc_nil_value() : () -> i64
      %346 = func.call @cc_cons(%344, %345) : (i64, i64) -> i64
      %347 = func.call @cc_values_pack(%346) : (i64) -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      %348 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %349 = llvm.mlir.addressof @str32 : !llvm.ptr
      %350 = arith.constant 13 : i64
      %351 = func.call @cc_make_string(%349, %350) : (!llvm.ptr, i64) -> i64
      %352 = llvm.mlir.addressof @str33 : !llvm.ptr
      %353 = arith.constant 11 : i64
      %354 = func.call @cc_make_string(%352, %353) : (!llvm.ptr, i64) -> i64
      %355 = func.call @cc_intern(%351, %354) : (i64, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_values_pack(%357) : (i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %359 = arith.addi %355, %__rlasp_stack_elide_zero_15 : i64
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
      %362 = llvm.mlir.addressof @str34 : !llvm.ptr
      %363 = arith.constant 5 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_intern(%364, %365) : (i64, i64) -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_cons(%366, %367) : (i64, i64) -> i64
      %369 = func.call @cc_values_pack(%368) : (i64) -> i64
      %370 = func.call @cc_cons(%366, %361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%370) : (i64) -> ()
      %371 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%371) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @stack_pop_pointer() : () -> i64
      %374 = func.call @cc_cons(%373, %372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %375 = arith.addi %374, %__rlasp_stack_elide_zero_16 : i64
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = func.call @cc_cons(%376, %375) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %378 = arith.addi %377, %__rlasp_stack_elide_zero_17 : i64
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @cc_cons(%379, %378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%380) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %381 = func.call @stack_pop_pointer() : () -> i64
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @cc_cons(%382, %381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %384 = arith.addi %383, %__rlasp_stack_elide_zero_18 : i64
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @cc_cons(%385, %384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%386) : (i64) -> ()
      %387 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = llvm.mlir.addressof @str35 : !llvm.ptr
      %389 = arith.constant 12 : i64
      %390 = func.call @cc_make_string(%388, %389) : (!llvm.ptr, i64) -> i64
      %391 = llvm.mlir.addressof @str36 : !llvm.ptr
      %392 = arith.constant 11 : i64
      %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
      %394 = func.call @cc_intern(%390, %393) : (i64, i64) -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
      %397 = func.call @cc_values_pack(%396) : (i64) -> i64
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %398 = llvm.mlir.addressof @str37 : !llvm.ptr
      %399 = arith.constant 9 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = llvm.mlir.addressof @str38 : !llvm.ptr
      %402 = arith.constant 11 : i64
      %403 = func.call @cc_make_string(%401, %402) : (!llvm.ptr, i64) -> i64
      %404 = func.call @cc_intern(%400, %403) : (i64, i64) -> i64
      %405 = func.call @cc_nil_value() : () -> i64
      %406 = func.call @cc_cons(%404, %405) : (i64, i64) -> i64
      %407 = func.call @cc_values_pack(%406) : (i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %408 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%408) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %409 = func.call @stack_pop_pointer() : () -> i64
      %410 = func.call @stack_pop_pointer() : () -> i64
      %411 = func.call @cc_cons(%410, %409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%411) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %412 = func.call @stack_pop_pointer() : () -> i64
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = func.call @cc_cons(%413, %412) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %415 = arith.addi %414, %__rlasp_stack_elide_zero_19 : i64
      %416 = func.call @stack_pop_pointer() : () -> i64
      %417 = func.call @cc_cons(%416, %415) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %418 = arith.addi %417, %__rlasp_stack_elide_zero_20 : i64
      %419 = func.call @stack_pop_pointer() : () -> i64
      %420 = func.call @cc_cons(%419, %418) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %421 = arith.addi %420, %__rlasp_stack_elide_zero_21 : i64
      %422 = func.call @stack_pop_pointer() : () -> i64
      %423 = func.call @cc_cons(%421, %422) : (i64, i64) -> i64
      %424 = llvm.mlir.addressof @str39 : !llvm.ptr
      %425 = arith.constant 5 : i64
      %426 = func.call @cc_make_string(%424, %425) : (!llvm.ptr, i64) -> i64
      %427 = func.call @cc_nil_value() : () -> i64
      %428 = func.call @cc_intern(%426, %427) : (i64, i64) -> i64
      %429 = func.call @cc_nil_value() : () -> i64
      %430 = func.call @cc_cons(%428, %429) : (i64, i64) -> i64
      %431 = func.call @cc_values_pack(%430) : (i64) -> i64
      %432 = func.call @cc_cons(%428, %423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%432) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @stack_pop_pointer() : () -> i64
      %435 = func.call @cc_cons(%434, %433) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %436 = arith.addi %435, %__rlasp_stack_elide_zero_22 : i64
      %437 = func.call @stack_pop_pointer() : () -> i64
      %438 = func.call @cc_cons(%437, %436) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %439 = arith.addi %438, %__rlasp_stack_elide_zero_23 : i64
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @cc_cons(%440, %439) : (i64, i64) -> i64
      func.call @stack_push_pointer(%441) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %442 = func.call @stack_pop_pointer() : () -> i64
      %443 = func.call @stack_pop_pointer() : () -> i64
      %444 = func.call @cc_cons(%443, %442) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %445 = arith.addi %444, %__rlasp_stack_elide_zero_24 : i64
      %446 = func.call @stack_pop_pointer() : () -> i64
      %447 = func.call @cc_cons(%446, %445) : (i64, i64) -> i64
      func.call @stack_push_pointer(%447) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %448 = func.call @stack_pop_pointer() : () -> i64
      %449 = func.call @stack_pop_pointer() : () -> i64
      %450 = func.call @cc_cons(%449, %448) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %451 = arith.addi %450, %__rlasp_stack_elide_zero_25 : i64
      %452 = func.call @stack_pop_pointer() : () -> i64
      %453 = func.call @cc_cons(%452, %451) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %454 = arith.addi %453, %__rlasp_stack_elide_zero_26 : i64
      %535 = arith.constant 15079495958530 : i64
      %536 = arith.constant 0 : i64
      %537 = func.call @cc_make_closure(%535, %536) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %538 = arith.addi %537, %__rlasp_stack_elide_zero_27 : i64
      %539 = llvm.mlir.addressof @str47 : !llvm.ptr
      %540 = arith.constant 1 : i64
      %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
      %542 = func.call @cc_nil_value() : () -> i64
      %543 = func.call @cc_intern(%541, %542) : (i64, i64) -> i64
      %544 = func.call @cc_nil_value() : () -> i64
      %545 = func.call @cc_cons(%543, %544) : (i64, i64) -> i64
      %546 = func.call @cc_values_pack(%545) : (i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @cc_cons(%548, %547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %550 = arith.addi %549, %__rlasp_stack_elide_zero_28 : i64
      %551 = llvm.mlir.addressof @str48 : !llvm.ptr
      %552 = arith.constant 11 : i64
      %553 = func.call @cc_make_string(%551, %552) : (!llvm.ptr, i64) -> i64
      %554 = llvm.mlir.addressof @str49 : !llvm.ptr
      %555 = arith.constant 7 : i64
      %556 = func.call @cc_make_string(%554, %555) : (!llvm.ptr, i64) -> i64
      %557 = func.call @cc_intern(%553, %556) : (i64, i64) -> i64
      %558 = func.call @cc_nil_value() : () -> i64
      %559 = func.call @cc_cons(%557, %558) : (i64, i64) -> i64
      %560 = func.call @cc_values_pack(%559) : (i64) -> i64
      %561 = func.call @cc_nil_value() : () -> i64
      %562 = llvm.mlir.addressof @str50 : !llvm.ptr
      %563 = arith.constant 4 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = llvm.mlir.addressof @str51 : !llvm.ptr
      %566 = arith.constant 7 : i64
      %567 = func.call @cc_make_string(%565, %566) : (!llvm.ptr, i64) -> i64
      %568 = func.call @cc_intern(%564, %567) : (i64, i64) -> i64
      %569 = func.call @cc_nil_value() : () -> i64
      %570 = func.call @cc_cons(%568, %569) : (i64, i64) -> i64
      %571 = func.call @cc_values_pack(%570) : (i64) -> i64
      %572 = llvm.mlir.addressof @str52 : !llvm.ptr
      %573 = arith.constant 6 : i64
      %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
      %575 = func.call @cc_nil_value() : () -> i64
      %576 = func.call @cc_intern(%574, %575) : (i64, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_cons(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_values_pack(%578) : (i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %580 = arith.addi %576, %__rlasp_stack_elide_zero_29 : i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = func.call @cc_errorp(%301) : (i64) -> i64
      %583 = arith.cmpi ne, %582, %581 : i64
      %584 = arith.cmpi eq, %581, %581 : i64
      %585 = arith.andi %583, %584 : i1
      %586 = scf.if %585 -> (i64) {
        scf.yield %301 : i64
      } else {
        scf.yield %581 : i64
      }
      %587 = func.call @cc_errorp(%454) : (i64) -> i64
      %588 = arith.cmpi ne, %587, %581 : i64
      %589 = arith.cmpi eq, %586, %581 : i64
      %590 = arith.andi %588, %589 : i1
      %591 = scf.if %590 -> (i64) {
        scf.yield %454 : i64
      } else {
        scf.yield %586 : i64
      }
      %592 = func.call @cc_errorp(%538) : (i64) -> i64
      %593 = arith.cmpi ne, %592, %581 : i64
      %594 = arith.cmpi eq, %591, %581 : i64
      %595 = arith.andi %593, %594 : i1
      %596 = scf.if %595 -> (i64) {
        scf.yield %538 : i64
      } else {
        scf.yield %591 : i64
      }
      %597 = func.call @cc_errorp(%550) : (i64) -> i64
      %598 = arith.cmpi ne, %597, %581 : i64
      %599 = arith.cmpi eq, %596, %581 : i64
      %600 = arith.andi %598, %599 : i1
      %601 = scf.if %600 -> (i64) {
        scf.yield %550 : i64
      } else {
        scf.yield %596 : i64
      }
      %602 = func.call @cc_errorp(%557) : (i64) -> i64
      %603 = arith.cmpi ne, %602, %581 : i64
      %604 = arith.cmpi eq, %601, %581 : i64
      %605 = arith.andi %603, %604 : i1
      %606 = scf.if %605 -> (i64) {
        scf.yield %557 : i64
      } else {
        scf.yield %601 : i64
      }
      %607 = func.call @cc_errorp(%561) : (i64) -> i64
      %608 = arith.cmpi ne, %607, %581 : i64
      %609 = arith.cmpi eq, %606, %581 : i64
      %610 = arith.andi %608, %609 : i1
      %611 = scf.if %610 -> (i64) {
        scf.yield %561 : i64
      } else {
        scf.yield %606 : i64
      }
      %612 = func.call @cc_errorp(%568) : (i64) -> i64
      %613 = arith.cmpi ne, %612, %581 : i64
      %614 = arith.cmpi eq, %611, %581 : i64
      %615 = arith.andi %613, %614 : i1
      %616 = scf.if %615 -> (i64) {
        scf.yield %568 : i64
      } else {
        scf.yield %611 : i64
      }
      %617 = func.call @cc_errorp(%580) : (i64) -> i64
      %618 = arith.cmpi ne, %617, %581 : i64
      %619 = arith.cmpi eq, %616, %581 : i64
      %620 = arith.andi %618, %619 : i1
      %621 = scf.if %620 -> (i64) {
        scf.yield %580 : i64
      } else {
        scf.yield %616 : i64
      }
      %622 = arith.cmpi ne, %621, %581 : i64
      scf.if %622 {
        func.call @stack_push_pointer(%621) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%301) : (i64) -> ()
        func.call @stack_push_pointer(%454) : (i64) -> ()
        func.call @stack_push_pointer(%538) : (i64) -> ()
        func.call @stack_push_pointer(%550) : (i64) -> ()
        func.call @stack_push_pointer(%557) : (i64) -> ()
        func.call @stack_push_pointer(%561) : (i64) -> ()
        func.call @stack_push_pointer(%568) : (i64) -> ()
        func.call @stack_push_pointer(%580) : (i64) -> ()
        %623 = llvm.mlir.addressof @str53 : !llvm.ptr
        %624 = func.call @cc_make_function_ref_const(%623) : (!llvm.ptr) -> i64
        %625 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%624, %625) : (i64, i64) -> ()
      }
      %626 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %626 : i64
    }
    %627 = func.call @cc_nil_value() : () -> i64
    %628 = func.call @cc_errorp(%292) : (i64) -> i64
    %629 = arith.cmpi ne, %628, %627 : i64
    %630 = scf.if %629 -> (i64) {
      scf.yield %292 : i64
    } else {
      %631 = llvm.mlir.addressof @str54 : !llvm.ptr
      %632 = arith.constant 32 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = func.call @cc_nil_value() : () -> i64
      %635 = func.call @cc_intern(%633, %634) : (i64, i64) -> i64
      %636 = func.call @cc_nil_value() : () -> i64
      %637 = func.call @cc_cons(%635, %636) : (i64, i64) -> i64
      %638 = func.call @cc_values_pack(%637) : (i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %639 = arith.addi %635, %__rlasp_stack_elide_zero_30 : i64
      %640 = llvm.mlir.addressof @str55 : !llvm.ptr
      %641 = arith.constant 3 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = func.call @cc_nil_value() : () -> i64
      %644 = func.call @cc_intern(%642, %643) : (i64, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_values_pack(%646) : (i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %648 = llvm.mlir.addressof @str56 : !llvm.ptr
      %649 = arith.constant 3 : i64
      %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_intern(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_nil_value() : () -> i64
      %654 = func.call @cc_cons(%652, %653) : (i64, i64) -> i64
      %655 = func.call @cc_values_pack(%654) : (i64) -> i64
      func.call @stack_push_pointer(%652) : (i64) -> ()
      %656 = llvm.mlir.addressof @str57 : !llvm.ptr
      %657 = arith.constant 8 : i64
      %658 = func.call @cc_make_string(%656, %657) : (!llvm.ptr, i64) -> i64
      %659 = llvm.mlir.addressof @str58 : !llvm.ptr
      %660 = arith.constant 11 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = func.call @cc_intern(%658, %661) : (i64, i64) -> i64
      %663 = func.call @cc_nil_value() : () -> i64
      %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
      %665 = func.call @cc_values_pack(%664) : (i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %666 = llvm.mlir.addressof @str59 : !llvm.ptr
      %667 = arith.constant 7 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = llvm.mlir.addressof @str60 : !llvm.ptr
      %670 = arith.constant 11 : i64
      %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
      %672 = func.call @cc_intern(%668, %671) : (i64, i64) -> i64
      %673 = func.call @cc_nil_value() : () -> i64
      %674 = func.call @cc_cons(%672, %673) : (i64, i64) -> i64
      %675 = func.call @cc_values_pack(%674) : (i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %676 = llvm.mlir.addressof @str61 : !llvm.ptr
      %677 = arith.constant 13 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = llvm.mlir.addressof @str62 : !llvm.ptr
      %680 = arith.constant 11 : i64
      %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
      %682 = func.call @cc_intern(%678, %681) : (i64, i64) -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_cons(%682, %683) : (i64, i64) -> i64
      %685 = func.call @cc_values_pack(%684) : (i64) -> i64
      func.call @stack_push_pointer(%682) : (i64) -> ()
      %686 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%686) : (i64) -> ()
      %687 = llvm.mlir.addressof @str63 : !llvm.ptr
      %688 = arith.constant 18 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = llvm.mlir.addressof @str64 : !llvm.ptr
      %691 = arith.constant 11 : i64
      %692 = func.call @cc_make_string(%690, %691) : (!llvm.ptr, i64) -> i64
      %693 = func.call @cc_intern(%689, %692) : (i64, i64) -> i64
      %694 = func.call @cc_nil_value() : () -> i64
      %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
      %696 = func.call @cc_values_pack(%695) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %697 = arith.addi %693, %__rlasp_stack_elide_zero_31 : i64
      %698 = func.call @stack_pop_pointer() : () -> i64
      %699 = func.call @cc_cons(%697, %698) : (i64, i64) -> i64
      %700 = llvm.mlir.addressof @str65 : !llvm.ptr
      %701 = arith.constant 5 : i64
      %702 = func.call @cc_make_string(%700, %701) : (!llvm.ptr, i64) -> i64
      %703 = func.call @cc_nil_value() : () -> i64
      %704 = func.call @cc_intern(%702, %703) : (i64, i64) -> i64
      %705 = func.call @cc_nil_value() : () -> i64
      %706 = func.call @cc_cons(%704, %705) : (i64, i64) -> i64
      %707 = func.call @cc_values_pack(%706) : (i64) -> i64
      %708 = func.call @cc_cons(%704, %699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%708) : (i64) -> ()
      %709 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %713 = arith.addi %712, %__rlasp_stack_elide_zero_32 : i64
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @cc_cons(%714, %713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %716 = arith.addi %715, %__rlasp_stack_elide_zero_33 : i64
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @cc_cons(%717, %716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%718) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @cc_cons(%720, %719) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %722 = arith.addi %721, %__rlasp_stack_elide_zero_34 : i64
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @cc_cons(%723, %722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%724) : (i64) -> ()
      %725 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      %726 = llvm.mlir.addressof @str66 : !llvm.ptr
      %727 = arith.constant 12 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = llvm.mlir.addressof @str67 : !llvm.ptr
      %730 = arith.constant 11 : i64
      %731 = func.call @cc_make_string(%729, %730) : (!llvm.ptr, i64) -> i64
      %732 = func.call @cc_intern(%728, %731) : (i64, i64) -> i64
      %733 = func.call @cc_nil_value() : () -> i64
      %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
      %735 = func.call @cc_values_pack(%734) : (i64) -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      %736 = llvm.mlir.addressof @str68 : !llvm.ptr
      %737 = arith.constant 9 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = llvm.mlir.addressof @str69 : !llvm.ptr
      %740 = arith.constant 11 : i64
      %741 = func.call @cc_make_string(%739, %740) : (!llvm.ptr, i64) -> i64
      %742 = func.call @cc_intern(%738, %741) : (i64, i64) -> i64
      %743 = func.call @cc_nil_value() : () -> i64
      %744 = func.call @cc_cons(%742, %743) : (i64, i64) -> i64
      %745 = func.call @cc_values_pack(%744) : (i64) -> i64
      func.call @stack_push_pointer(%742) : (i64) -> ()
      %746 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%746) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%748, %747) : (i64, i64) -> i64
      func.call @stack_push_pointer(%749) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %750 = func.call @stack_pop_pointer() : () -> i64
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_cons(%751, %750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %753 = arith.addi %752, %__rlasp_stack_elide_zero_35 : i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%754, %753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %756 = arith.addi %755, %__rlasp_stack_elide_zero_36 : i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%757, %756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %759 = arith.addi %758, %__rlasp_stack_elide_zero_37 : i64
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @cc_cons(%759, %760) : (i64, i64) -> i64
      %762 = llvm.mlir.addressof @str70 : !llvm.ptr
      %763 = arith.constant 5 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = func.call @cc_intern(%764, %765) : (i64, i64) -> i64
      %767 = func.call @cc_nil_value() : () -> i64
      %768 = func.call @cc_cons(%766, %767) : (i64, i64) -> i64
      %769 = func.call @cc_values_pack(%768) : (i64) -> i64
      %770 = func.call @cc_cons(%766, %761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @cc_cons(%772, %771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %774 = arith.addi %773, %__rlasp_stack_elide_zero_38 : i64
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @cc_cons(%775, %774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %777 = arith.addi %776, %__rlasp_stack_elide_zero_39 : i64
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @cc_cons(%778, %777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%779) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = func.call @cc_cons(%781, %780) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %783 = arith.addi %782, %__rlasp_stack_elide_zero_40 : i64
      %784 = func.call @stack_pop_pointer() : () -> i64
      %785 = func.call @cc_cons(%784, %783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%785) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %786 = func.call @stack_pop_pointer() : () -> i64
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @cc_cons(%787, %786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %789 = arith.addi %788, %__rlasp_stack_elide_zero_41 : i64
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @cc_cons(%790, %789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %792 = arith.addi %791, %__rlasp_stack_elide_zero_42 : i64
      %873 = arith.constant 15079495958531 : i64
      %874 = arith.constant 0 : i64
      %875 = func.call @cc_make_closure(%873, %874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %876 = arith.addi %875, %__rlasp_stack_elide_zero_43 : i64
      %877 = llvm.mlir.addressof @str78 : !llvm.ptr
      %878 = arith.constant 1 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_intern(%879, %880) : (i64, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_cons(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_values_pack(%883) : (i64) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %885 = func.call @stack_pop_pointer() : () -> i64
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @cc_cons(%886, %885) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %888 = arith.addi %887, %__rlasp_stack_elide_zero_44 : i64
      %889 = llvm.mlir.addressof @str79 : !llvm.ptr
      %890 = arith.constant 11 : i64
      %891 = func.call @cc_make_string(%889, %890) : (!llvm.ptr, i64) -> i64
      %892 = llvm.mlir.addressof @str80 : !llvm.ptr
      %893 = arith.constant 7 : i64
      %894 = func.call @cc_make_string(%892, %893) : (!llvm.ptr, i64) -> i64
      %895 = func.call @cc_intern(%891, %894) : (i64, i64) -> i64
      %896 = func.call @cc_nil_value() : () -> i64
      %897 = func.call @cc_cons(%895, %896) : (i64, i64) -> i64
      %898 = func.call @cc_values_pack(%897) : (i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = llvm.mlir.addressof @str81 : !llvm.ptr
      %901 = arith.constant 4 : i64
      %902 = func.call @cc_make_string(%900, %901) : (!llvm.ptr, i64) -> i64
      %903 = llvm.mlir.addressof @str82 : !llvm.ptr
      %904 = arith.constant 7 : i64
      %905 = func.call @cc_make_string(%903, %904) : (!llvm.ptr, i64) -> i64
      %906 = func.call @cc_intern(%902, %905) : (i64, i64) -> i64
      %907 = func.call @cc_nil_value() : () -> i64
      %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
      %909 = func.call @cc_values_pack(%908) : (i64) -> i64
      %910 = llvm.mlir.addressof @str83 : !llvm.ptr
      %911 = arith.constant 6 : i64
      %912 = func.call @cc_make_string(%910, %911) : (!llvm.ptr, i64) -> i64
      %913 = func.call @cc_nil_value() : () -> i64
      %914 = func.call @cc_intern(%912, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %918 = arith.addi %914, %__rlasp_stack_elide_zero_45 : i64
      %919 = func.call @cc_nil_value() : () -> i64
      %920 = func.call @cc_errorp(%639) : (i64) -> i64
      %921 = arith.cmpi ne, %920, %919 : i64
      %922 = arith.cmpi eq, %919, %919 : i64
      %923 = arith.andi %921, %922 : i1
      %924 = scf.if %923 -> (i64) {
        scf.yield %639 : i64
      } else {
        scf.yield %919 : i64
      }
      %925 = func.call @cc_errorp(%792) : (i64) -> i64
      %926 = arith.cmpi ne, %925, %919 : i64
      %927 = arith.cmpi eq, %924, %919 : i64
      %928 = arith.andi %926, %927 : i1
      %929 = scf.if %928 -> (i64) {
        scf.yield %792 : i64
      } else {
        scf.yield %924 : i64
      }
      %930 = func.call @cc_errorp(%876) : (i64) -> i64
      %931 = arith.cmpi ne, %930, %919 : i64
      %932 = arith.cmpi eq, %929, %919 : i64
      %933 = arith.andi %931, %932 : i1
      %934 = scf.if %933 -> (i64) {
        scf.yield %876 : i64
      } else {
        scf.yield %929 : i64
      }
      %935 = func.call @cc_errorp(%888) : (i64) -> i64
      %936 = arith.cmpi ne, %935, %919 : i64
      %937 = arith.cmpi eq, %934, %919 : i64
      %938 = arith.andi %936, %937 : i1
      %939 = scf.if %938 -> (i64) {
        scf.yield %888 : i64
      } else {
        scf.yield %934 : i64
      }
      %940 = func.call @cc_errorp(%895) : (i64) -> i64
      %941 = arith.cmpi ne, %940, %919 : i64
      %942 = arith.cmpi eq, %939, %919 : i64
      %943 = arith.andi %941, %942 : i1
      %944 = scf.if %943 -> (i64) {
        scf.yield %895 : i64
      } else {
        scf.yield %939 : i64
      }
      %945 = func.call @cc_errorp(%899) : (i64) -> i64
      %946 = arith.cmpi ne, %945, %919 : i64
      %947 = arith.cmpi eq, %944, %919 : i64
      %948 = arith.andi %946, %947 : i1
      %949 = scf.if %948 -> (i64) {
        scf.yield %899 : i64
      } else {
        scf.yield %944 : i64
      }
      %950 = func.call @cc_errorp(%906) : (i64) -> i64
      %951 = arith.cmpi ne, %950, %919 : i64
      %952 = arith.cmpi eq, %949, %919 : i64
      %953 = arith.andi %951, %952 : i1
      %954 = scf.if %953 -> (i64) {
        scf.yield %906 : i64
      } else {
        scf.yield %949 : i64
      }
      %955 = func.call @cc_errorp(%918) : (i64) -> i64
      %956 = arith.cmpi ne, %955, %919 : i64
      %957 = arith.cmpi eq, %954, %919 : i64
      %958 = arith.andi %956, %957 : i1
      %959 = scf.if %958 -> (i64) {
        scf.yield %918 : i64
      } else {
        scf.yield %954 : i64
      }
      %960 = arith.cmpi ne, %959, %919 : i64
      scf.if %960 {
        func.call @stack_push_pointer(%959) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%639) : (i64) -> ()
        func.call @stack_push_pointer(%792) : (i64) -> ()
        func.call @stack_push_pointer(%876) : (i64) -> ()
        func.call @stack_push_pointer(%888) : (i64) -> ()
        func.call @stack_push_pointer(%895) : (i64) -> ()
        func.call @stack_push_pointer(%899) : (i64) -> ()
        func.call @stack_push_pointer(%906) : (i64) -> ()
        func.call @stack_push_pointer(%918) : (i64) -> ()
        %961 = llvm.mlir.addressof @str84 : !llvm.ptr
        %962 = func.call @cc_make_function_ref_const(%961) : (!llvm.ptr) -> i64
        %963 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%962, %963) : (i64, i64) -> ()
      }
      %964 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %964 : i64
    }
    %965 = func.call @cc_nil_value() : () -> i64
    %966 = func.call @cc_errorp(%630) : (i64) -> i64
    %967 = arith.cmpi ne, %966, %965 : i64
    %968 = scf.if %967 -> (i64) {
      scf.yield %630 : i64
    } else {
      %969 = llvm.mlir.addressof @str85 : !llvm.ptr
      %970 = arith.constant 23 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = func.call @cc_nil_value() : () -> i64
      %973 = func.call @cc_intern(%971, %972) : (i64, i64) -> i64
      %974 = func.call @cc_nil_value() : () -> i64
      %975 = func.call @cc_cons(%973, %974) : (i64, i64) -> i64
      %976 = func.call @cc_values_pack(%975) : (i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %977 = arith.addi %973, %__rlasp_stack_elide_zero_46 : i64
      %978 = llvm.mlir.addressof @str86 : !llvm.ptr
      %979 = arith.constant 6 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_intern(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %986 = llvm.mlir.addressof @str87 : !llvm.ptr
      %987 = arith.constant 10 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = llvm.mlir.addressof @str88 : !llvm.ptr
      %990 = arith.constant 11 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_intern(%988, %991) : (i64, i64) -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_values_pack(%994) : (i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %996 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      %997 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%997) : (i64) -> ()
      %998 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %999 = func.call @stack_pop_pointer() : () -> i64
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = func.call @cc_cons(%1000, %999) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1002 = arith.addi %1001, %__rlasp_stack_elide_zero_47 : i64
      %1003 = func.call @stack_pop_pointer() : () -> i64
      %1004 = func.call @cc_cons(%1003, %1002) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1005 = arith.addi %1004, %__rlasp_stack_elide_zero_48 : i64
      %1006 = func.call @stack_pop_pointer() : () -> i64
      %1007 = func.call @cc_cons(%1005, %1006) : (i64, i64) -> i64
      %1008 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1009 = arith.constant 5 : i64
      %1010 = func.call @cc_make_string(%1008, %1009) : (!llvm.ptr, i64) -> i64
      %1011 = func.call @cc_nil_value() : () -> i64
      %1012 = func.call @cc_intern(%1010, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_nil_value() : () -> i64
      %1014 = func.call @cc_cons(%1012, %1013) : (i64, i64) -> i64
      %1015 = func.call @cc_values_pack(%1014) : (i64) -> i64
      %1016 = func.call @cc_cons(%1012, %1007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1017 = func.call @stack_pop_pointer() : () -> i64
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = func.call @cc_cons(%1018, %1017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1020 = arith.addi %1019, %__rlasp_stack_elide_zero_49 : i64
      %1021 = func.call @stack_pop_pointer() : () -> i64
      %1022 = func.call @cc_cons(%1021, %1020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = func.call @stack_pop_pointer() : () -> i64
      %1025 = func.call @cc_cons(%1024, %1023) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1026 = arith.addi %1025, %__rlasp_stack_elide_zero_50 : i64
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @cc_cons(%1027, %1026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1029 = arith.addi %1028, %__rlasp_stack_elide_zero_51 : i64
      %1060 = arith.constant 15079495958532 : i64
      %1061 = arith.constant 0 : i64
      %1062 = func.call @cc_make_closure(%1060, %1061) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1063 = arith.addi %1062, %__rlasp_stack_elide_zero_52 : i64
      %1064 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1065 = arith.constant 12 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1068 = arith.constant 11 : i64
      %1069 = func.call @cc_make_string(%1067, %1068) : (!llvm.ptr, i64) -> i64
      %1070 = func.call @cc_intern(%1066, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      func.call @stack_push_pointer(%1070) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @stack_pop_pointer() : () -> i64
      %1076 = func.call @cc_cons(%1075, %1074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1077 = arith.addi %1076, %__rlasp_stack_elide_zero_53 : i64
      %1078 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1079 = arith.constant 11 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1082 = arith.constant 7 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = func.call @cc_intern(%1080, %1083) : (i64, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_cons(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_values_pack(%1086) : (i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1090 = arith.constant 4 : i64
      %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
      %1092 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1093 = arith.constant 7 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = func.call @cc_intern(%1091, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_cons(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_values_pack(%1097) : (i64) -> i64
      %1099 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1100 = arith.constant 5 : i64
      %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = func.call @cc_nil_value() : () -> i64
      %1103 = func.call @cc_intern(%1101, %1102) : (i64, i64) -> i64
      %1104 = func.call @cc_nil_value() : () -> i64
      %1105 = func.call @cc_cons(%1103, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_values_pack(%1105) : (i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1107 = arith.addi %1103, %__rlasp_stack_elide_zero_54 : i64
      %1108 = func.call @cc_nil_value() : () -> i64
      %1109 = func.call @cc_errorp(%977) : (i64) -> i64
      %1110 = arith.cmpi ne, %1109, %1108 : i64
      %1111 = arith.cmpi eq, %1108, %1108 : i64
      %1112 = arith.andi %1110, %1111 : i1
      %1113 = scf.if %1112 -> (i64) {
        scf.yield %977 : i64
      } else {
        scf.yield %1108 : i64
      }
      %1114 = func.call @cc_errorp(%1029) : (i64) -> i64
      %1115 = arith.cmpi ne, %1114, %1108 : i64
      %1116 = arith.cmpi eq, %1113, %1108 : i64
      %1117 = arith.andi %1115, %1116 : i1
      %1118 = scf.if %1117 -> (i64) {
        scf.yield %1029 : i64
      } else {
        scf.yield %1113 : i64
      }
      %1119 = func.call @cc_errorp(%1063) : (i64) -> i64
      %1120 = arith.cmpi ne, %1119, %1108 : i64
      %1121 = arith.cmpi eq, %1118, %1108 : i64
      %1122 = arith.andi %1120, %1121 : i1
      %1123 = scf.if %1122 -> (i64) {
        scf.yield %1063 : i64
      } else {
        scf.yield %1118 : i64
      }
      %1124 = func.call @cc_errorp(%1077) : (i64) -> i64
      %1125 = arith.cmpi ne, %1124, %1108 : i64
      %1126 = arith.cmpi eq, %1123, %1108 : i64
      %1127 = arith.andi %1125, %1126 : i1
      %1128 = scf.if %1127 -> (i64) {
        scf.yield %1077 : i64
      } else {
        scf.yield %1123 : i64
      }
      %1129 = func.call @cc_errorp(%1084) : (i64) -> i64
      %1130 = arith.cmpi ne, %1129, %1108 : i64
      %1131 = arith.cmpi eq, %1128, %1108 : i64
      %1132 = arith.andi %1130, %1131 : i1
      %1133 = scf.if %1132 -> (i64) {
        scf.yield %1084 : i64
      } else {
        scf.yield %1128 : i64
      }
      %1134 = func.call @cc_errorp(%1088) : (i64) -> i64
      %1135 = arith.cmpi ne, %1134, %1108 : i64
      %1136 = arith.cmpi eq, %1133, %1108 : i64
      %1137 = arith.andi %1135, %1136 : i1
      %1138 = scf.if %1137 -> (i64) {
        scf.yield %1088 : i64
      } else {
        scf.yield %1133 : i64
      }
      %1139 = func.call @cc_errorp(%1095) : (i64) -> i64
      %1140 = arith.cmpi ne, %1139, %1108 : i64
      %1141 = arith.cmpi eq, %1138, %1108 : i64
      %1142 = arith.andi %1140, %1141 : i1
      %1143 = scf.if %1142 -> (i64) {
        scf.yield %1095 : i64
      } else {
        scf.yield %1138 : i64
      }
      %1144 = func.call @cc_errorp(%1107) : (i64) -> i64
      %1145 = arith.cmpi ne, %1144, %1108 : i64
      %1146 = arith.cmpi eq, %1143, %1108 : i64
      %1147 = arith.andi %1145, %1146 : i1
      %1148 = scf.if %1147 -> (i64) {
        scf.yield %1107 : i64
      } else {
        scf.yield %1143 : i64
      }
      %1149 = arith.cmpi ne, %1148, %1108 : i64
      scf.if %1149 {
        func.call @stack_push_pointer(%1148) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%977) : (i64) -> ()
        func.call @stack_push_pointer(%1029) : (i64) -> ()
        func.call @stack_push_pointer(%1063) : (i64) -> ()
        func.call @stack_push_pointer(%1077) : (i64) -> ()
        func.call @stack_push_pointer(%1084) : (i64) -> ()
        func.call @stack_push_pointer(%1088) : (i64) -> ()
        func.call @stack_push_pointer(%1095) : (i64) -> ()
        func.call @stack_push_pointer(%1107) : (i64) -> ()
        %1150 = llvm.mlir.addressof @str98 : !llvm.ptr
        %1151 = func.call @cc_make_function_ref_const(%1150) : (!llvm.ptr) -> i64
        %1152 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1151, %1152) : (i64, i64) -> ()
      }
      %1153 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1153 : i64
    }
    %1154 = func.call @cc_nil_value() : () -> i64
    %1155 = func.call @cc_errorp(%968) : (i64) -> i64
    %1156 = arith.cmpi ne, %1155, %1154 : i64
    %1157 = scf.if %1156 -> (i64) {
      scf.yield %968 : i64
    } else {
      %1158 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1159 = arith.constant 40 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = func.call @cc_nil_value() : () -> i64
      %1162 = func.call @cc_intern(%1160, %1161) : (i64, i64) -> i64
      %1163 = func.call @cc_nil_value() : () -> i64
      %1164 = func.call @cc_cons(%1162, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_values_pack(%1164) : (i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1166 = arith.addi %1162, %__rlasp_stack_elide_zero_55 : i64
      %1167 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1168 = arith.constant 6 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = func.call @cc_nil_value() : () -> i64
      %1171 = func.call @cc_intern(%1169, %1170) : (i64, i64) -> i64
      %1172 = func.call @cc_nil_value() : () -> i64
      %1173 = func.call @cc_cons(%1171, %1172) : (i64, i64) -> i64
      %1174 = func.call @cc_values_pack(%1173) : (i64) -> i64
      func.call @stack_push_pointer(%1171) : (i64) -> ()
      %1175 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1176 = arith.constant 10 : i64
      %1177 = func.call @cc_make_string(%1175, %1176) : (!llvm.ptr, i64) -> i64
      %1178 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1179 = arith.constant 11 : i64
      %1180 = func.call @cc_make_string(%1178, %1179) : (!llvm.ptr, i64) -> i64
      %1181 = func.call @cc_intern(%1177, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_nil_value() : () -> i64
      %1183 = func.call @cc_cons(%1181, %1182) : (i64, i64) -> i64
      %1184 = func.call @cc_values_pack(%1183) : (i64) -> i64
      func.call @stack_push_pointer(%1181) : (i64) -> ()
      %1185 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1185) : (i64) -> ()
      %1186 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1187 = arith.constant 12 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1190 = arith.constant 7 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = func.call @cc_intern(%1188, %1191) : (i64, i64) -> i64
      %1193 = func.call @cc_nil_value() : () -> i64
      %1194 = func.call @cc_cons(%1192, %1193) : (i64, i64) -> i64
      %1195 = func.call @cc_values_pack(%1194) : (i64) -> i64
      func.call @stack_push_pointer(%1192) : (i64) -> ()
      %1196 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1196) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1197 = func.call @stack_pop_pointer() : () -> i64
      %1198 = func.call @stack_pop_pointer() : () -> i64
      %1199 = func.call @cc_cons(%1198, %1197) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1200 = arith.addi %1199, %__rlasp_stack_elide_zero_56 : i64
      %1201 = func.call @stack_pop_pointer() : () -> i64
      %1202 = func.call @cc_cons(%1201, %1200) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1203 = arith.addi %1202, %__rlasp_stack_elide_zero_57 : i64
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = func.call @cc_cons(%1204, %1203) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1206 = arith.addi %1205, %__rlasp_stack_elide_zero_58 : i64
      %1207 = func.call @stack_pop_pointer() : () -> i64
      %1208 = func.call @cc_cons(%1207, %1206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @stack_pop_pointer() : () -> i64
      %1211 = func.call @cc_cons(%1210, %1209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1212 = arith.addi %1211, %__rlasp_stack_elide_zero_59 : i64
      %1213 = func.call @stack_pop_pointer() : () -> i64
      %1214 = func.call @cc_cons(%1213, %1212) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1215 = arith.addi %1214, %__rlasp_stack_elide_zero_60 : i64
      %1261 = arith.constant 15079495958533 : i64
      %1262 = arith.constant 0 : i64
      %1263 = func.call @cc_make_closure(%1261, %1262) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1264 = arith.addi %1263, %__rlasp_stack_elide_zero_61 : i64
      %1265 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1266 = arith.constant 3 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1269 = arith.constant 11 : i64
      %1270 = func.call @cc_make_string(%1268, %1269) : (!llvm.ptr, i64) -> i64
      %1271 = func.call @cc_intern(%1267, %1270) : (i64, i64) -> i64
      %1272 = func.call @cc_nil_value() : () -> i64
      %1273 = func.call @cc_cons(%1271, %1272) : (i64, i64) -> i64
      %1274 = func.call @cc_values_pack(%1273) : (i64) -> i64
      func.call @stack_push_pointer(%1271) : (i64) -> ()
      %1275 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1276 = arith.constant 12 : i64
      %1277 = func.call @cc_make_string(%1275, %1276) : (!llvm.ptr, i64) -> i64
      %1278 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1279 = arith.constant 11 : i64
      %1280 = func.call @cc_make_string(%1278, %1279) : (!llvm.ptr, i64) -> i64
      %1281 = func.call @cc_intern(%1277, %1280) : (i64, i64) -> i64
      %1282 = func.call @cc_nil_value() : () -> i64
      %1283 = func.call @cc_cons(%1281, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_values_pack(%1283) : (i64) -> i64
      func.call @stack_push_pointer(%1281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1285 = func.call @stack_pop_pointer() : () -> i64
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @cc_cons(%1286, %1285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1288 = arith.addi %1287, %__rlasp_stack_elide_zero_62 : i64
      %1289 = func.call @stack_pop_pointer() : () -> i64
      %1290 = func.call @cc_cons(%1289, %1288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1291 = func.call @stack_pop_pointer() : () -> i64
      %1292 = func.call @stack_pop_pointer() : () -> i64
      %1293 = func.call @cc_cons(%1292, %1291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1294 = arith.addi %1293, %__rlasp_stack_elide_zero_63 : i64
      %1295 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1296 = arith.constant 11 : i64
      %1297 = func.call @cc_make_string(%1295, %1296) : (!llvm.ptr, i64) -> i64
      %1298 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1299 = arith.constant 7 : i64
      %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
      %1301 = func.call @cc_intern(%1297, %1300) : (i64, i64) -> i64
      %1302 = func.call @cc_nil_value() : () -> i64
      %1303 = func.call @cc_cons(%1301, %1302) : (i64, i64) -> i64
      %1304 = func.call @cc_values_pack(%1303) : (i64) -> i64
      %1305 = func.call @cc_nil_value() : () -> i64
      %1306 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1307 = arith.constant 4 : i64
      %1308 = func.call @cc_make_string(%1306, %1307) : (!llvm.ptr, i64) -> i64
      %1309 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1310 = arith.constant 7 : i64
      %1311 = func.call @cc_make_string(%1309, %1310) : (!llvm.ptr, i64) -> i64
      %1312 = func.call @cc_intern(%1308, %1311) : (i64, i64) -> i64
      %1313 = func.call @cc_nil_value() : () -> i64
      %1314 = func.call @cc_cons(%1312, %1313) : (i64, i64) -> i64
      %1315 = func.call @cc_values_pack(%1314) : (i64) -> i64
      %1316 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1317 = arith.constant 5 : i64
      %1318 = func.call @cc_make_string(%1316, %1317) : (!llvm.ptr, i64) -> i64
      %1319 = func.call @cc_nil_value() : () -> i64
      %1320 = func.call @cc_intern(%1318, %1319) : (i64, i64) -> i64
      %1321 = func.call @cc_nil_value() : () -> i64
      %1322 = func.call @cc_cons(%1320, %1321) : (i64, i64) -> i64
      %1323 = func.call @cc_values_pack(%1322) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1324 = arith.addi %1320, %__rlasp_stack_elide_zero_64 : i64
      %1325 = func.call @cc_nil_value() : () -> i64
      %1326 = func.call @cc_errorp(%1166) : (i64) -> i64
      %1327 = arith.cmpi ne, %1326, %1325 : i64
      %1328 = arith.cmpi eq, %1325, %1325 : i64
      %1329 = arith.andi %1327, %1328 : i1
      %1330 = scf.if %1329 -> (i64) {
        scf.yield %1166 : i64
      } else {
        scf.yield %1325 : i64
      }
      %1331 = func.call @cc_errorp(%1215) : (i64) -> i64
      %1332 = arith.cmpi ne, %1331, %1325 : i64
      %1333 = arith.cmpi eq, %1330, %1325 : i64
      %1334 = arith.andi %1332, %1333 : i1
      %1335 = scf.if %1334 -> (i64) {
        scf.yield %1215 : i64
      } else {
        scf.yield %1330 : i64
      }
      %1336 = func.call @cc_errorp(%1264) : (i64) -> i64
      %1337 = arith.cmpi ne, %1336, %1325 : i64
      %1338 = arith.cmpi eq, %1335, %1325 : i64
      %1339 = arith.andi %1337, %1338 : i1
      %1340 = scf.if %1339 -> (i64) {
        scf.yield %1264 : i64
      } else {
        scf.yield %1335 : i64
      }
      %1341 = func.call @cc_errorp(%1294) : (i64) -> i64
      %1342 = arith.cmpi ne, %1341, %1325 : i64
      %1343 = arith.cmpi eq, %1340, %1325 : i64
      %1344 = arith.andi %1342, %1343 : i1
      %1345 = scf.if %1344 -> (i64) {
        scf.yield %1294 : i64
      } else {
        scf.yield %1340 : i64
      }
      %1346 = func.call @cc_errorp(%1301) : (i64) -> i64
      %1347 = arith.cmpi ne, %1346, %1325 : i64
      %1348 = arith.cmpi eq, %1345, %1325 : i64
      %1349 = arith.andi %1347, %1348 : i1
      %1350 = scf.if %1349 -> (i64) {
        scf.yield %1301 : i64
      } else {
        scf.yield %1345 : i64
      }
      %1351 = func.call @cc_errorp(%1305) : (i64) -> i64
      %1352 = arith.cmpi ne, %1351, %1325 : i64
      %1353 = arith.cmpi eq, %1350, %1325 : i64
      %1354 = arith.andi %1352, %1353 : i1
      %1355 = scf.if %1354 -> (i64) {
        scf.yield %1305 : i64
      } else {
        scf.yield %1350 : i64
      }
      %1356 = func.call @cc_errorp(%1312) : (i64) -> i64
      %1357 = arith.cmpi ne, %1356, %1325 : i64
      %1358 = arith.cmpi eq, %1355, %1325 : i64
      %1359 = arith.andi %1357, %1358 : i1
      %1360 = scf.if %1359 -> (i64) {
        scf.yield %1312 : i64
      } else {
        scf.yield %1355 : i64
      }
      %1361 = func.call @cc_errorp(%1324) : (i64) -> i64
      %1362 = arith.cmpi ne, %1361, %1325 : i64
      %1363 = arith.cmpi eq, %1360, %1325 : i64
      %1364 = arith.andi %1362, %1363 : i1
      %1365 = scf.if %1364 -> (i64) {
        scf.yield %1324 : i64
      } else {
        scf.yield %1360 : i64
      }
      %1366 = arith.cmpi ne, %1365, %1325 : i64
      scf.if %1366 {
        func.call @stack_push_pointer(%1365) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1166) : (i64) -> ()
        func.call @stack_push_pointer(%1215) : (i64) -> ()
        func.call @stack_push_pointer(%1264) : (i64) -> ()
        func.call @stack_push_pointer(%1294) : (i64) -> ()
        func.call @stack_push_pointer(%1301) : (i64) -> ()
        func.call @stack_push_pointer(%1305) : (i64) -> ()
        func.call @stack_push_pointer(%1312) : (i64) -> ()
        func.call @stack_push_pointer(%1324) : (i64) -> ()
        %1367 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1368 = func.call @cc_make_function_ref_const(%1367) : (!llvm.ptr) -> i64
        %1369 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1368, %1369) : (i64, i64) -> ()
      }
      %1370 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1370 : i64
    }
    %1371 = func.call @cc_nil_value() : () -> i64
    %1372 = func.call @cc_errorp(%1157) : (i64) -> i64
    %1373 = arith.cmpi ne, %1372, %1371 : i64
    %1374 = scf.if %1373 -> (i64) {
      scf.yield %1157 : i64
    } else {
      %1375 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1376 = arith.constant 47 : i64
      %1377 = func.call @cc_make_string(%1375, %1376) : (!llvm.ptr, i64) -> i64
      %1378 = func.call @cc_nil_value() : () -> i64
      %1379 = func.call @cc_intern(%1377, %1378) : (i64, i64) -> i64
      %1380 = func.call @cc_nil_value() : () -> i64
      %1381 = func.call @cc_cons(%1379, %1380) : (i64, i64) -> i64
      %1382 = func.call @cc_values_pack(%1381) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1383 = arith.addi %1379, %__rlasp_stack_elide_zero_65 : i64
      %1384 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1385 = arith.constant 6 : i64
      %1386 = func.call @cc_make_string(%1384, %1385) : (!llvm.ptr, i64) -> i64
      %1387 = func.call @cc_nil_value() : () -> i64
      %1388 = func.call @cc_intern(%1386, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_nil_value() : () -> i64
      %1390 = func.call @cc_cons(%1388, %1389) : (i64, i64) -> i64
      %1391 = func.call @cc_values_pack(%1390) : (i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1392 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1393 = arith.constant 10 : i64
      %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
      %1395 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1396 = arith.constant 11 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = func.call @cc_intern(%1394, %1397) : (i64, i64) -> i64
      %1399 = func.call @cc_nil_value() : () -> i64
      %1400 = func.call @cc_cons(%1398, %1399) : (i64, i64) -> i64
      %1401 = func.call @cc_values_pack(%1400) : (i64) -> i64
      func.call @stack_push_pointer(%1398) : (i64) -> ()
      %1402 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1402) : (i64) -> ()
      %1403 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1404 = arith.constant 12 : i64
      %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
      %1406 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1407 = arith.constant 7 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = func.call @cc_intern(%1405, %1408) : (i64, i64) -> i64
      %1410 = func.call @cc_nil_value() : () -> i64
      %1411 = func.call @cc_cons(%1409, %1410) : (i64, i64) -> i64
      %1412 = func.call @cc_values_pack(%1411) : (i64) -> i64
      func.call @stack_push_pointer(%1409) : (i64) -> ()
      %1413 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1414 = func.call @stack_pop_pointer() : () -> i64
      %1415 = func.call @stack_pop_pointer() : () -> i64
      %1416 = func.call @cc_cons(%1415, %1414) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1417 = arith.addi %1416, %__rlasp_stack_elide_zero_66 : i64
      %1418 = func.call @stack_pop_pointer() : () -> i64
      %1419 = func.call @cc_cons(%1418, %1417) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1420 = arith.addi %1419, %__rlasp_stack_elide_zero_67 : i64
      %1421 = func.call @stack_pop_pointer() : () -> i64
      %1422 = func.call @cc_cons(%1421, %1420) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1423 = arith.addi %1422, %__rlasp_stack_elide_zero_68 : i64
      %1424 = func.call @stack_pop_pointer() : () -> i64
      %1425 = func.call @cc_cons(%1424, %1423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @stack_pop_pointer() : () -> i64
      %1428 = func.call @cc_cons(%1427, %1426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1429 = arith.addi %1428, %__rlasp_stack_elide_zero_69 : i64
      %1430 = func.call @stack_pop_pointer() : () -> i64
      %1431 = func.call @cc_cons(%1430, %1429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1432 = arith.addi %1431, %__rlasp_stack_elide_zero_70 : i64
      %1478 = arith.constant 15079495958534 : i64
      %1479 = arith.constant 0 : i64
      %1480 = func.call @cc_make_closure(%1478, %1479) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1481 = arith.addi %1480, %__rlasp_stack_elide_zero_71 : i64
      %1482 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1483 = arith.constant 3 : i64
      %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
      %1485 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1486 = arith.constant 11 : i64
      %1487 = func.call @cc_make_string(%1485, %1486) : (!llvm.ptr, i64) -> i64
      %1488 = func.call @cc_intern(%1484, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_nil_value() : () -> i64
      %1490 = func.call @cc_cons(%1488, %1489) : (i64, i64) -> i64
      %1491 = func.call @cc_values_pack(%1490) : (i64) -> i64
      func.call @stack_push_pointer(%1488) : (i64) -> ()
      %1492 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1493 = arith.constant 13 : i64
      %1494 = func.call @cc_make_string(%1492, %1493) : (!llvm.ptr, i64) -> i64
      %1495 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1496 = arith.constant 11 : i64
      %1497 = func.call @cc_make_string(%1495, %1496) : (!llvm.ptr, i64) -> i64
      %1498 = func.call @cc_intern(%1494, %1497) : (i64, i64) -> i64
      %1499 = func.call @cc_nil_value() : () -> i64
      %1500 = func.call @cc_cons(%1498, %1499) : (i64, i64) -> i64
      %1501 = func.call @cc_values_pack(%1500) : (i64) -> i64
      func.call @stack_push_pointer(%1498) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1502 = func.call @stack_pop_pointer() : () -> i64
      %1503 = func.call @stack_pop_pointer() : () -> i64
      %1504 = func.call @cc_cons(%1503, %1502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1505 = arith.addi %1504, %__rlasp_stack_elide_zero_72 : i64
      %1506 = func.call @stack_pop_pointer() : () -> i64
      %1507 = func.call @cc_cons(%1506, %1505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1507) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1508 = func.call @stack_pop_pointer() : () -> i64
      %1509 = func.call @stack_pop_pointer() : () -> i64
      %1510 = func.call @cc_cons(%1509, %1508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1511 = arith.addi %1510, %__rlasp_stack_elide_zero_73 : i64
      %1512 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1513 = arith.constant 11 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1516 = arith.constant 7 : i64
      %1517 = func.call @cc_make_string(%1515, %1516) : (!llvm.ptr, i64) -> i64
      %1518 = func.call @cc_intern(%1514, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_nil_value() : () -> i64
      %1520 = func.call @cc_cons(%1518, %1519) : (i64, i64) -> i64
      %1521 = func.call @cc_values_pack(%1520) : (i64) -> i64
      %1522 = func.call @cc_nil_value() : () -> i64
      %1523 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1524 = arith.constant 4 : i64
      %1525 = func.call @cc_make_string(%1523, %1524) : (!llvm.ptr, i64) -> i64
      %1526 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1527 = arith.constant 7 : i64
      %1528 = func.call @cc_make_string(%1526, %1527) : (!llvm.ptr, i64) -> i64
      %1529 = func.call @cc_intern(%1525, %1528) : (i64, i64) -> i64
      %1530 = func.call @cc_nil_value() : () -> i64
      %1531 = func.call @cc_cons(%1529, %1530) : (i64, i64) -> i64
      %1532 = func.call @cc_values_pack(%1531) : (i64) -> i64
      %1533 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1534 = arith.constant 5 : i64
      %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
      %1536 = func.call @cc_nil_value() : () -> i64
      %1537 = func.call @cc_intern(%1535, %1536) : (i64, i64) -> i64
      %1538 = func.call @cc_nil_value() : () -> i64
      %1539 = func.call @cc_cons(%1537, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_values_pack(%1539) : (i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1541 = arith.addi %1537, %__rlasp_stack_elide_zero_74 : i64
      %1542 = func.call @cc_nil_value() : () -> i64
      %1543 = func.call @cc_errorp(%1383) : (i64) -> i64
      %1544 = arith.cmpi ne, %1543, %1542 : i64
      %1545 = arith.cmpi eq, %1542, %1542 : i64
      %1546 = arith.andi %1544, %1545 : i1
      %1547 = scf.if %1546 -> (i64) {
        scf.yield %1383 : i64
      } else {
        scf.yield %1542 : i64
      }
      %1548 = func.call @cc_errorp(%1432) : (i64) -> i64
      %1549 = arith.cmpi ne, %1548, %1542 : i64
      %1550 = arith.cmpi eq, %1547, %1542 : i64
      %1551 = arith.andi %1549, %1550 : i1
      %1552 = scf.if %1551 -> (i64) {
        scf.yield %1432 : i64
      } else {
        scf.yield %1547 : i64
      }
      %1553 = func.call @cc_errorp(%1481) : (i64) -> i64
      %1554 = arith.cmpi ne, %1553, %1542 : i64
      %1555 = arith.cmpi eq, %1552, %1542 : i64
      %1556 = arith.andi %1554, %1555 : i1
      %1557 = scf.if %1556 -> (i64) {
        scf.yield %1481 : i64
      } else {
        scf.yield %1552 : i64
      }
      %1558 = func.call @cc_errorp(%1511) : (i64) -> i64
      %1559 = arith.cmpi ne, %1558, %1542 : i64
      %1560 = arith.cmpi eq, %1557, %1542 : i64
      %1561 = arith.andi %1559, %1560 : i1
      %1562 = scf.if %1561 -> (i64) {
        scf.yield %1511 : i64
      } else {
        scf.yield %1557 : i64
      }
      %1563 = func.call @cc_errorp(%1518) : (i64) -> i64
      %1564 = arith.cmpi ne, %1563, %1542 : i64
      %1565 = arith.cmpi eq, %1562, %1542 : i64
      %1566 = arith.andi %1564, %1565 : i1
      %1567 = scf.if %1566 -> (i64) {
        scf.yield %1518 : i64
      } else {
        scf.yield %1562 : i64
      }
      %1568 = func.call @cc_errorp(%1522) : (i64) -> i64
      %1569 = arith.cmpi ne, %1568, %1542 : i64
      %1570 = arith.cmpi eq, %1567, %1542 : i64
      %1571 = arith.andi %1569, %1570 : i1
      %1572 = scf.if %1571 -> (i64) {
        scf.yield %1522 : i64
      } else {
        scf.yield %1567 : i64
      }
      %1573 = func.call @cc_errorp(%1529) : (i64) -> i64
      %1574 = arith.cmpi ne, %1573, %1542 : i64
      %1575 = arith.cmpi eq, %1572, %1542 : i64
      %1576 = arith.andi %1574, %1575 : i1
      %1577 = scf.if %1576 -> (i64) {
        scf.yield %1529 : i64
      } else {
        scf.yield %1572 : i64
      }
      %1578 = func.call @cc_errorp(%1541) : (i64) -> i64
      %1579 = arith.cmpi ne, %1578, %1542 : i64
      %1580 = arith.cmpi eq, %1577, %1542 : i64
      %1581 = arith.andi %1579, %1580 : i1
      %1582 = scf.if %1581 -> (i64) {
        scf.yield %1541 : i64
      } else {
        scf.yield %1577 : i64
      }
      %1583 = arith.cmpi ne, %1582, %1542 : i64
      scf.if %1583 {
        func.call @stack_push_pointer(%1582) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1383) : (i64) -> ()
        func.call @stack_push_pointer(%1432) : (i64) -> ()
        func.call @stack_push_pointer(%1481) : (i64) -> ()
        func.call @stack_push_pointer(%1511) : (i64) -> ()
        func.call @stack_push_pointer(%1518) : (i64) -> ()
        func.call @stack_push_pointer(%1522) : (i64) -> ()
        func.call @stack_push_pointer(%1529) : (i64) -> ()
        func.call @stack_push_pointer(%1541) : (i64) -> ()
        %1584 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1585 = func.call @cc_make_function_ref_const(%1584) : (!llvm.ptr) -> i64
        %1586 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1585, %1586) : (i64, i64) -> ()
      }
      %1587 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1587 : i64
    }
    %1588 = func.call @cc_nil_value() : () -> i64
    %1589 = func.call @cc_errorp(%1374) : (i64) -> i64
    %1590 = arith.cmpi ne, %1589, %1588 : i64
    %1591 = scf.if %1590 -> (i64) {
      scf.yield %1374 : i64
    } else {
      %1592 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1593 = arith.constant 27 : i64
      %1594 = func.call @cc_make_string(%1592, %1593) : (!llvm.ptr, i64) -> i64
      %1595 = func.call @cc_nil_value() : () -> i64
      %1596 = func.call @cc_intern(%1594, %1595) : (i64, i64) -> i64
      %1597 = func.call @cc_nil_value() : () -> i64
      %1598 = func.call @cc_cons(%1596, %1597) : (i64, i64) -> i64
      %1599 = func.call @cc_values_pack(%1598) : (i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1600 = arith.addi %1596, %__rlasp_stack_elide_zero_75 : i64
      %1601 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1602 = arith.constant 6 : i64
      %1603 = func.call @cc_make_string(%1601, %1602) : (!llvm.ptr, i64) -> i64
      %1604 = func.call @cc_nil_value() : () -> i64
      %1605 = func.call @cc_intern(%1603, %1604) : (i64, i64) -> i64
      %1606 = func.call @cc_nil_value() : () -> i64
      %1607 = func.call @cc_cons(%1605, %1606) : (i64, i64) -> i64
      %1608 = func.call @cc_values_pack(%1607) : (i64) -> i64
      func.call @stack_push_pointer(%1605) : (i64) -> ()
      %1609 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1610 = arith.constant 10 : i64
      %1611 = func.call @cc_make_string(%1609, %1610) : (!llvm.ptr, i64) -> i64
      %1612 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1613 = arith.constant 11 : i64
      %1614 = func.call @cc_make_string(%1612, %1613) : (!llvm.ptr, i64) -> i64
      %1615 = func.call @cc_intern(%1611, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
      func.call @stack_push_pointer(%1615) : (i64) -> ()
      %1619 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1619) : (i64) -> ()
      %1620 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1620) : (i64) -> ()
      %1621 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @stack_pop_pointer() : () -> i64
      %1624 = func.call @cc_cons(%1623, %1622) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1625 = arith.addi %1624, %__rlasp_stack_elide_zero_76 : i64
      %1626 = func.call @stack_pop_pointer() : () -> i64
      %1627 = func.call @cc_cons(%1626, %1625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1628 = arith.addi %1627, %__rlasp_stack_elide_zero_77 : i64
      %1629 = func.call @stack_pop_pointer() : () -> i64
      %1630 = func.call @cc_cons(%1628, %1629) : (i64, i64) -> i64
      %1631 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1632 = arith.constant 5 : i64
      %1633 = func.call @cc_make_string(%1631, %1632) : (!llvm.ptr, i64) -> i64
      %1634 = func.call @cc_nil_value() : () -> i64
      %1635 = func.call @cc_intern(%1633, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_values_pack(%1637) : (i64) -> i64
      %1639 = func.call @cc_cons(%1635, %1630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1639) : (i64) -> ()
      %1640 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1641 = arith.constant 10 : i64
      %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
      %1643 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1644 = arith.constant 7 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      %1646 = func.call @cc_intern(%1642, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_nil_value() : () -> i64
      %1648 = func.call @cc_cons(%1646, %1647) : (i64, i64) -> i64
      %1649 = func.call @cc_values_pack(%1648) : (i64) -> i64
      func.call @stack_push_pointer(%1646) : (i64) -> ()
      %1650 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1650) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @cc_cons(%1652, %1651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1654 = arith.addi %1653, %__rlasp_stack_elide_zero_78 : i64
      %1655 = func.call @stack_pop_pointer() : () -> i64
      %1656 = func.call @cc_cons(%1655, %1654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1657 = arith.addi %1656, %__rlasp_stack_elide_zero_79 : i64
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @cc_cons(%1658, %1657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1660 = arith.addi %1659, %__rlasp_stack_elide_zero_80 : i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @stack_pop_pointer() : () -> i64
      %1665 = func.call @cc_cons(%1664, %1663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1666 = arith.addi %1665, %__rlasp_stack_elide_zero_81 : i64
      %1667 = func.call @stack_pop_pointer() : () -> i64
      %1668 = func.call @cc_cons(%1667, %1666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1669 = arith.addi %1668, %__rlasp_stack_elide_zero_82 : i64
      %1721 = arith.constant 15079495958535 : i64
      %1722 = arith.constant 0 : i64
      %1723 = func.call @cc_make_closure(%1721, %1722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1724 = arith.addi %1723, %__rlasp_stack_elide_zero_83 : i64
      %1725 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1726 = arith.constant 5 : i64
      %1727 = func.call @cc_make_string(%1725, %1726) : (!llvm.ptr, i64) -> i64
      %1728 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1729 = arith.constant 11 : i64
      %1730 = func.call @cc_make_string(%1728, %1729) : (!llvm.ptr, i64) -> i64
      %1731 = func.call @cc_intern(%1727, %1730) : (i64, i64) -> i64
      %1732 = func.call @cc_nil_value() : () -> i64
      %1733 = func.call @cc_cons(%1731, %1732) : (i64, i64) -> i64
      %1734 = func.call @cc_values_pack(%1733) : (i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @stack_pop_pointer() : () -> i64
      %1737 = func.call @cc_cons(%1736, %1735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1738 = arith.addi %1737, %__rlasp_stack_elide_zero_84 : i64
      %1739 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1740 = arith.constant 11 : i64
      %1741 = func.call @cc_make_string(%1739, %1740) : (!llvm.ptr, i64) -> i64
      %1742 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1743 = arith.constant 7 : i64
      %1744 = func.call @cc_make_string(%1742, %1743) : (!llvm.ptr, i64) -> i64
      %1745 = func.call @cc_intern(%1741, %1744) : (i64, i64) -> i64
      %1746 = func.call @cc_nil_value() : () -> i64
      %1747 = func.call @cc_cons(%1745, %1746) : (i64, i64) -> i64
      %1748 = func.call @cc_values_pack(%1747) : (i64) -> i64
      %1749 = func.call @cc_nil_value() : () -> i64
      %1750 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1751 = arith.constant 4 : i64
      %1752 = func.call @cc_make_string(%1750, %1751) : (!llvm.ptr, i64) -> i64
      %1753 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1754 = arith.constant 7 : i64
      %1755 = func.call @cc_make_string(%1753, %1754) : (!llvm.ptr, i64) -> i64
      %1756 = func.call @cc_intern(%1752, %1755) : (i64, i64) -> i64
      %1757 = func.call @cc_nil_value() : () -> i64
      %1758 = func.call @cc_cons(%1756, %1757) : (i64, i64) -> i64
      %1759 = func.call @cc_values_pack(%1758) : (i64) -> i64
      %1760 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1761 = arith.constant 5 : i64
      %1762 = func.call @cc_make_string(%1760, %1761) : (!llvm.ptr, i64) -> i64
      %1763 = func.call @cc_nil_value() : () -> i64
      %1764 = func.call @cc_intern(%1762, %1763) : (i64, i64) -> i64
      %1765 = func.call @cc_nil_value() : () -> i64
      %1766 = func.call @cc_cons(%1764, %1765) : (i64, i64) -> i64
      %1767 = func.call @cc_values_pack(%1766) : (i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1768 = arith.addi %1764, %__rlasp_stack_elide_zero_85 : i64
      %1769 = func.call @cc_nil_value() : () -> i64
      %1770 = func.call @cc_errorp(%1600) : (i64) -> i64
      %1771 = arith.cmpi ne, %1770, %1769 : i64
      %1772 = arith.cmpi eq, %1769, %1769 : i64
      %1773 = arith.andi %1771, %1772 : i1
      %1774 = scf.if %1773 -> (i64) {
        scf.yield %1600 : i64
      } else {
        scf.yield %1769 : i64
      }
      %1775 = func.call @cc_errorp(%1669) : (i64) -> i64
      %1776 = arith.cmpi ne, %1775, %1769 : i64
      %1777 = arith.cmpi eq, %1774, %1769 : i64
      %1778 = arith.andi %1776, %1777 : i1
      %1779 = scf.if %1778 -> (i64) {
        scf.yield %1669 : i64
      } else {
        scf.yield %1774 : i64
      }
      %1780 = func.call @cc_errorp(%1724) : (i64) -> i64
      %1781 = arith.cmpi ne, %1780, %1769 : i64
      %1782 = arith.cmpi eq, %1779, %1769 : i64
      %1783 = arith.andi %1781, %1782 : i1
      %1784 = scf.if %1783 -> (i64) {
        scf.yield %1724 : i64
      } else {
        scf.yield %1779 : i64
      }
      %1785 = func.call @cc_errorp(%1738) : (i64) -> i64
      %1786 = arith.cmpi ne, %1785, %1769 : i64
      %1787 = arith.cmpi eq, %1784, %1769 : i64
      %1788 = arith.andi %1786, %1787 : i1
      %1789 = scf.if %1788 -> (i64) {
        scf.yield %1738 : i64
      } else {
        scf.yield %1784 : i64
      }
      %1790 = func.call @cc_errorp(%1745) : (i64) -> i64
      %1791 = arith.cmpi ne, %1790, %1769 : i64
      %1792 = arith.cmpi eq, %1789, %1769 : i64
      %1793 = arith.andi %1791, %1792 : i1
      %1794 = scf.if %1793 -> (i64) {
        scf.yield %1745 : i64
      } else {
        scf.yield %1789 : i64
      }
      %1795 = func.call @cc_errorp(%1749) : (i64) -> i64
      %1796 = arith.cmpi ne, %1795, %1769 : i64
      %1797 = arith.cmpi eq, %1794, %1769 : i64
      %1798 = arith.andi %1796, %1797 : i1
      %1799 = scf.if %1798 -> (i64) {
        scf.yield %1749 : i64
      } else {
        scf.yield %1794 : i64
      }
      %1800 = func.call @cc_errorp(%1756) : (i64) -> i64
      %1801 = arith.cmpi ne, %1800, %1769 : i64
      %1802 = arith.cmpi eq, %1799, %1769 : i64
      %1803 = arith.andi %1801, %1802 : i1
      %1804 = scf.if %1803 -> (i64) {
        scf.yield %1756 : i64
      } else {
        scf.yield %1799 : i64
      }
      %1805 = func.call @cc_errorp(%1768) : (i64) -> i64
      %1806 = arith.cmpi ne, %1805, %1769 : i64
      %1807 = arith.cmpi eq, %1804, %1769 : i64
      %1808 = arith.andi %1806, %1807 : i1
      %1809 = scf.if %1808 -> (i64) {
        scf.yield %1768 : i64
      } else {
        scf.yield %1804 : i64
      }
      %1810 = arith.cmpi ne, %1809, %1769 : i64
      scf.if %1810 {
        func.call @stack_push_pointer(%1809) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1600) : (i64) -> ()
        func.call @stack_push_pointer(%1669) : (i64) -> ()
        func.call @stack_push_pointer(%1724) : (i64) -> ()
        func.call @stack_push_pointer(%1738) : (i64) -> ()
        func.call @stack_push_pointer(%1745) : (i64) -> ()
        func.call @stack_push_pointer(%1749) : (i64) -> ()
        func.call @stack_push_pointer(%1756) : (i64) -> ()
        func.call @stack_push_pointer(%1768) : (i64) -> ()
        %1811 = llvm.mlir.addressof @str154 : !llvm.ptr
        %1812 = func.call @cc_make_function_ref_const(%1811) : (!llvm.ptr) -> i64
        %1813 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1812, %1813) : (i64, i64) -> ()
      }
      %1814 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1814 : i64
    }
    %1815 = func.call @cc_nil_value() : () -> i64
    %1816 = func.call @cc_errorp(%1591) : (i64) -> i64
    %1817 = arith.cmpi ne, %1816, %1815 : i64
    %1818 = scf.if %1817 -> (i64) {
      scf.yield %1591 : i64
    } else {
      %1819 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1820 = arith.constant 37 : i64
      %1821 = func.call @cc_make_string(%1819, %1820) : (!llvm.ptr, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_intern(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_cons(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_values_pack(%1825) : (i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1827 = arith.addi %1823, %__rlasp_stack_elide_zero_86 : i64
      %1828 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1829 = arith.constant 6 : i64
      %1830 = func.call @cc_make_string(%1828, %1829) : (!llvm.ptr, i64) -> i64
      %1831 = func.call @cc_nil_value() : () -> i64
      %1832 = func.call @cc_intern(%1830, %1831) : (i64, i64) -> i64
      %1833 = func.call @cc_nil_value() : () -> i64
      %1834 = func.call @cc_cons(%1832, %1833) : (i64, i64) -> i64
      %1835 = func.call @cc_values_pack(%1834) : (i64) -> i64
      func.call @stack_push_pointer(%1832) : (i64) -> ()
      %1836 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1837 = arith.constant 10 : i64
      %1838 = func.call @cc_make_string(%1836, %1837) : (!llvm.ptr, i64) -> i64
      %1839 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1840 = arith.constant 11 : i64
      %1841 = func.call @cc_make_string(%1839, %1840) : (!llvm.ptr, i64) -> i64
      %1842 = func.call @cc_intern(%1838, %1841) : (i64, i64) -> i64
      %1843 = func.call @cc_nil_value() : () -> i64
      %1844 = func.call @cc_cons(%1842, %1843) : (i64, i64) -> i64
      %1845 = func.call @cc_values_pack(%1844) : (i64) -> i64
      func.call @stack_push_pointer(%1842) : (i64) -> ()
      %1846 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      %1847 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1847) : (i64) -> ()
      %1848 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1848) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @cc_cons(%1850, %1849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1852 = arith.addi %1851, %__rlasp_stack_elide_zero_87 : i64
      %1853 = func.call @stack_pop_pointer() : () -> i64
      %1854 = func.call @cc_cons(%1853, %1852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1855 = arith.addi %1854, %__rlasp_stack_elide_zero_88 : i64
      %1856 = func.call @stack_pop_pointer() : () -> i64
      %1857 = func.call @cc_cons(%1855, %1856) : (i64, i64) -> i64
      %1858 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1859 = arith.constant 5 : i64
      %1860 = func.call @cc_make_string(%1858, %1859) : (!llvm.ptr, i64) -> i64
      %1861 = func.call @cc_nil_value() : () -> i64
      %1862 = func.call @cc_intern(%1860, %1861) : (i64, i64) -> i64
      %1863 = func.call @cc_nil_value() : () -> i64
      %1864 = func.call @cc_cons(%1862, %1863) : (i64, i64) -> i64
      %1865 = func.call @cc_values_pack(%1864) : (i64) -> i64
      %1866 = func.call @cc_cons(%1862, %1857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1866) : (i64) -> ()
      %1867 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1868 = arith.constant 10 : i64
      %1869 = func.call @cc_make_string(%1867, %1868) : (!llvm.ptr, i64) -> i64
      %1870 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1871 = arith.constant 7 : i64
      %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
      %1873 = func.call @cc_intern(%1869, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_nil_value() : () -> i64
      %1875 = func.call @cc_cons(%1873, %1874) : (i64, i64) -> i64
      %1876 = func.call @cc_values_pack(%1875) : (i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      %1877 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1877) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1878 = func.call @stack_pop_pointer() : () -> i64
      %1879 = func.call @stack_pop_pointer() : () -> i64
      %1880 = func.call @cc_cons(%1879, %1878) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1881 = arith.addi %1880, %__rlasp_stack_elide_zero_89 : i64
      %1882 = func.call @stack_pop_pointer() : () -> i64
      %1883 = func.call @cc_cons(%1882, %1881) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1884 = arith.addi %1883, %__rlasp_stack_elide_zero_90 : i64
      %1885 = func.call @stack_pop_pointer() : () -> i64
      %1886 = func.call @cc_cons(%1885, %1884) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1887 = arith.addi %1886, %__rlasp_stack_elide_zero_91 : i64
      %1888 = func.call @stack_pop_pointer() : () -> i64
      %1889 = func.call @cc_cons(%1888, %1887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1889) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1890 = func.call @stack_pop_pointer() : () -> i64
      %1891 = func.call @stack_pop_pointer() : () -> i64
      %1892 = func.call @cc_cons(%1891, %1890) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1893 = arith.addi %1892, %__rlasp_stack_elide_zero_92 : i64
      %1894 = func.call @stack_pop_pointer() : () -> i64
      %1895 = func.call @cc_cons(%1894, %1893) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1896 = arith.addi %1895, %__rlasp_stack_elide_zero_93 : i64
      %1948 = arith.constant 15079495958536 : i64
      %1949 = arith.constant 0 : i64
      %1950 = func.call @cc_make_closure(%1948, %1949) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1951 = arith.addi %1950, %__rlasp_stack_elide_zero_94 : i64
      %1952 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1953 = arith.constant 3 : i64
      %1954 = func.call @cc_make_string(%1952, %1953) : (!llvm.ptr, i64) -> i64
      %1955 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1956 = arith.constant 11 : i64
      %1957 = func.call @cc_make_string(%1955, %1956) : (!llvm.ptr, i64) -> i64
      %1958 = func.call @cc_intern(%1954, %1957) : (i64, i64) -> i64
      %1959 = func.call @cc_nil_value() : () -> i64
      %1960 = func.call @cc_cons(%1958, %1959) : (i64, i64) -> i64
      %1961 = func.call @cc_values_pack(%1960) : (i64) -> i64
      func.call @stack_push_pointer(%1958) : (i64) -> ()
      %1962 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1963 = arith.constant 12 : i64
      %1964 = func.call @cc_make_string(%1962, %1963) : (!llvm.ptr, i64) -> i64
      %1965 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1966 = arith.constant 11 : i64
      %1967 = func.call @cc_make_string(%1965, %1966) : (!llvm.ptr, i64) -> i64
      %1968 = func.call @cc_intern(%1964, %1967) : (i64, i64) -> i64
      %1969 = func.call @cc_nil_value() : () -> i64
      %1970 = func.call @cc_cons(%1968, %1969) : (i64, i64) -> i64
      %1971 = func.call @cc_values_pack(%1970) : (i64) -> i64
      func.call @stack_push_pointer(%1968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1972 = func.call @stack_pop_pointer() : () -> i64
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1974 = func.call @cc_cons(%1973, %1972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1975 = arith.addi %1974, %__rlasp_stack_elide_zero_95 : i64
      %1976 = func.call @stack_pop_pointer() : () -> i64
      %1977 = func.call @cc_cons(%1976, %1975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1977) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @stack_pop_pointer() : () -> i64
      %1980 = func.call @cc_cons(%1979, %1978) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1981 = arith.addi %1980, %__rlasp_stack_elide_zero_96 : i64
      %1982 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1983 = arith.constant 11 : i64
      %1984 = func.call @cc_make_string(%1982, %1983) : (!llvm.ptr, i64) -> i64
      %1985 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1986 = arith.constant 7 : i64
      %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
      %1988 = func.call @cc_intern(%1984, %1987) : (i64, i64) -> i64
      %1989 = func.call @cc_nil_value() : () -> i64
      %1990 = func.call @cc_cons(%1988, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_values_pack(%1990) : (i64) -> i64
      %1992 = func.call @cc_nil_value() : () -> i64
      %1993 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1994 = arith.constant 4 : i64
      %1995 = func.call @cc_make_string(%1993, %1994) : (!llvm.ptr, i64) -> i64
      %1996 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1997 = arith.constant 7 : i64
      %1998 = func.call @cc_make_string(%1996, %1997) : (!llvm.ptr, i64) -> i64
      %1999 = func.call @cc_intern(%1995, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      %2003 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2004 = arith.constant 5 : i64
      %2005 = func.call @cc_make_string(%2003, %2004) : (!llvm.ptr, i64) -> i64
      %2006 = func.call @cc_nil_value() : () -> i64
      %2007 = func.call @cc_intern(%2005, %2006) : (i64, i64) -> i64
      %2008 = func.call @cc_nil_value() : () -> i64
      %2009 = func.call @cc_cons(%2007, %2008) : (i64, i64) -> i64
      %2010 = func.call @cc_values_pack(%2009) : (i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2011 = arith.addi %2007, %__rlasp_stack_elide_zero_97 : i64
      %2012 = func.call @cc_nil_value() : () -> i64
      %2013 = func.call @cc_errorp(%1827) : (i64) -> i64
      %2014 = arith.cmpi ne, %2013, %2012 : i64
      %2015 = arith.cmpi eq, %2012, %2012 : i64
      %2016 = arith.andi %2014, %2015 : i1
      %2017 = scf.if %2016 -> (i64) {
        scf.yield %1827 : i64
      } else {
        scf.yield %2012 : i64
      }
      %2018 = func.call @cc_errorp(%1896) : (i64) -> i64
      %2019 = arith.cmpi ne, %2018, %2012 : i64
      %2020 = arith.cmpi eq, %2017, %2012 : i64
      %2021 = arith.andi %2019, %2020 : i1
      %2022 = scf.if %2021 -> (i64) {
        scf.yield %1896 : i64
      } else {
        scf.yield %2017 : i64
      }
      %2023 = func.call @cc_errorp(%1951) : (i64) -> i64
      %2024 = arith.cmpi ne, %2023, %2012 : i64
      %2025 = arith.cmpi eq, %2022, %2012 : i64
      %2026 = arith.andi %2024, %2025 : i1
      %2027 = scf.if %2026 -> (i64) {
        scf.yield %1951 : i64
      } else {
        scf.yield %2022 : i64
      }
      %2028 = func.call @cc_errorp(%1981) : (i64) -> i64
      %2029 = arith.cmpi ne, %2028, %2012 : i64
      %2030 = arith.cmpi eq, %2027, %2012 : i64
      %2031 = arith.andi %2029, %2030 : i1
      %2032 = scf.if %2031 -> (i64) {
        scf.yield %1981 : i64
      } else {
        scf.yield %2027 : i64
      }
      %2033 = func.call @cc_errorp(%1988) : (i64) -> i64
      %2034 = arith.cmpi ne, %2033, %2012 : i64
      %2035 = arith.cmpi eq, %2032, %2012 : i64
      %2036 = arith.andi %2034, %2035 : i1
      %2037 = scf.if %2036 -> (i64) {
        scf.yield %1988 : i64
      } else {
        scf.yield %2032 : i64
      }
      %2038 = func.call @cc_errorp(%1992) : (i64) -> i64
      %2039 = arith.cmpi ne, %2038, %2012 : i64
      %2040 = arith.cmpi eq, %2037, %2012 : i64
      %2041 = arith.andi %2039, %2040 : i1
      %2042 = scf.if %2041 -> (i64) {
        scf.yield %1992 : i64
      } else {
        scf.yield %2037 : i64
      }
      %2043 = func.call @cc_errorp(%1999) : (i64) -> i64
      %2044 = arith.cmpi ne, %2043, %2012 : i64
      %2045 = arith.cmpi eq, %2042, %2012 : i64
      %2046 = arith.andi %2044, %2045 : i1
      %2047 = scf.if %2046 -> (i64) {
        scf.yield %1999 : i64
      } else {
        scf.yield %2042 : i64
      }
      %2048 = func.call @cc_errorp(%2011) : (i64) -> i64
      %2049 = arith.cmpi ne, %2048, %2012 : i64
      %2050 = arith.cmpi eq, %2047, %2012 : i64
      %2051 = arith.andi %2049, %2050 : i1
      %2052 = scf.if %2051 -> (i64) {
        scf.yield %2011 : i64
      } else {
        scf.yield %2047 : i64
      }
      %2053 = arith.cmpi ne, %2052, %2012 : i64
      scf.if %2053 {
        func.call @stack_push_pointer(%2052) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1827) : (i64) -> ()
        func.call @stack_push_pointer(%1896) : (i64) -> ()
        func.call @stack_push_pointer(%1951) : (i64) -> ()
        func.call @stack_push_pointer(%1981) : (i64) -> ()
        func.call @stack_push_pointer(%1988) : (i64) -> ()
        func.call @stack_push_pointer(%1992) : (i64) -> ()
        func.call @stack_push_pointer(%1999) : (i64) -> ()
        func.call @stack_push_pointer(%2011) : (i64) -> ()
        %2054 = llvm.mlir.addressof @str174 : !llvm.ptr
        %2055 = func.call @cc_make_function_ref_const(%2054) : (!llvm.ptr) -> i64
        %2056 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2055, %2056) : (i64, i64) -> ()
      }
      %2057 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2057 : i64
    }
    %2058 = func.call @cc_nil_value() : () -> i64
    %2059 = func.call @cc_errorp(%1818) : (i64) -> i64
    %2060 = arith.cmpi ne, %2059, %2058 : i64
    %2061 = scf.if %2060 -> (i64) {
      scf.yield %1818 : i64
    } else {
      %2062 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2063 = arith.constant 45 : i64
      %2064 = func.call @cc_make_string(%2062, %2063) : (!llvm.ptr, i64) -> i64
      %2065 = func.call @cc_nil_value() : () -> i64
      %2066 = func.call @cc_intern(%2064, %2065) : (i64, i64) -> i64
      %2067 = func.call @cc_nil_value() : () -> i64
      %2068 = func.call @cc_cons(%2066, %2067) : (i64, i64) -> i64
      %2069 = func.call @cc_values_pack(%2068) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2070 = arith.addi %2066, %__rlasp_stack_elide_zero_98 : i64
      %2071 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2072 = arith.constant 6 : i64
      %2073 = func.call @cc_make_string(%2071, %2072) : (!llvm.ptr, i64) -> i64
      %2074 = func.call @cc_nil_value() : () -> i64
      %2075 = func.call @cc_intern(%2073, %2074) : (i64, i64) -> i64
      %2076 = func.call @cc_nil_value() : () -> i64
      %2077 = func.call @cc_cons(%2075, %2076) : (i64, i64) -> i64
      %2078 = func.call @cc_values_pack(%2077) : (i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2079 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2080 = arith.constant 10 : i64
      %2081 = func.call @cc_make_string(%2079, %2080) : (!llvm.ptr, i64) -> i64
      %2082 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2083 = arith.constant 11 : i64
      %2084 = func.call @cc_make_string(%2082, %2083) : (!llvm.ptr, i64) -> i64
      %2085 = func.call @cc_intern(%2081, %2084) : (i64, i64) -> i64
      %2086 = func.call @cc_nil_value() : () -> i64
      %2087 = func.call @cc_cons(%2085, %2086) : (i64, i64) -> i64
      %2088 = func.call @cc_values_pack(%2087) : (i64) -> i64
      func.call @stack_push_pointer(%2085) : (i64) -> ()
      %2089 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2089) : (i64) -> ()
      %2090 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2090) : (i64) -> ()
      %2091 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2091) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2092 = func.call @stack_pop_pointer() : () -> i64
      %2093 = func.call @stack_pop_pointer() : () -> i64
      %2094 = func.call @cc_cons(%2093, %2092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2095 = arith.addi %2094, %__rlasp_stack_elide_zero_99 : i64
      %2096 = func.call @stack_pop_pointer() : () -> i64
      %2097 = func.call @cc_cons(%2096, %2095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2098 = arith.addi %2097, %__rlasp_stack_elide_zero_100 : i64
      %2099 = func.call @stack_pop_pointer() : () -> i64
      %2100 = func.call @cc_cons(%2098, %2099) : (i64, i64) -> i64
      %2101 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2102 = arith.constant 5 : i64
      %2103 = func.call @cc_make_string(%2101, %2102) : (!llvm.ptr, i64) -> i64
      %2104 = func.call @cc_nil_value() : () -> i64
      %2105 = func.call @cc_intern(%2103, %2104) : (i64, i64) -> i64
      %2106 = func.call @cc_nil_value() : () -> i64
      %2107 = func.call @cc_cons(%2105, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_values_pack(%2107) : (i64) -> i64
      %2109 = func.call @cc_cons(%2105, %2100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2109) : (i64) -> ()
      %2110 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2111 = arith.constant 10 : i64
      %2112 = func.call @cc_make_string(%2110, %2111) : (!llvm.ptr, i64) -> i64
      %2113 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2114 = arith.constant 7 : i64
      %2115 = func.call @cc_make_string(%2113, %2114) : (!llvm.ptr, i64) -> i64
      %2116 = func.call @cc_intern(%2112, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_nil_value() : () -> i64
      %2118 = func.call @cc_cons(%2116, %2117) : (i64, i64) -> i64
      %2119 = func.call @cc_values_pack(%2118) : (i64) -> i64
      func.call @stack_push_pointer(%2116) : (i64) -> ()
      %2120 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2121 = func.call @stack_pop_pointer() : () -> i64
      %2122 = func.call @stack_pop_pointer() : () -> i64
      %2123 = func.call @cc_cons(%2122, %2121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2124 = arith.addi %2123, %__rlasp_stack_elide_zero_101 : i64
      %2125 = func.call @stack_pop_pointer() : () -> i64
      %2126 = func.call @cc_cons(%2125, %2124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2127 = arith.addi %2126, %__rlasp_stack_elide_zero_102 : i64
      %2128 = func.call @stack_pop_pointer() : () -> i64
      %2129 = func.call @cc_cons(%2128, %2127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2130 = arith.addi %2129, %__rlasp_stack_elide_zero_103 : i64
      %2131 = func.call @stack_pop_pointer() : () -> i64
      %2132 = func.call @cc_cons(%2131, %2130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2133 = func.call @stack_pop_pointer() : () -> i64
      %2134 = func.call @stack_pop_pointer() : () -> i64
      %2135 = func.call @cc_cons(%2134, %2133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2136 = arith.addi %2135, %__rlasp_stack_elide_zero_104 : i64
      %2137 = func.call @stack_pop_pointer() : () -> i64
      %2138 = func.call @cc_cons(%2137, %2136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2139 = arith.addi %2138, %__rlasp_stack_elide_zero_105 : i64
      %2191 = arith.constant 15079495958537 : i64
      %2192 = arith.constant 0 : i64
      %2193 = func.call @cc_make_closure(%2191, %2192) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2194 = arith.addi %2193, %__rlasp_stack_elide_zero_106 : i64
      %2195 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2196 = arith.constant 3 : i64
      %2197 = func.call @cc_make_string(%2195, %2196) : (!llvm.ptr, i64) -> i64
      %2198 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2199 = arith.constant 11 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = func.call @cc_intern(%2197, %2200) : (i64, i64) -> i64
      %2202 = func.call @cc_nil_value() : () -> i64
      %2203 = func.call @cc_cons(%2201, %2202) : (i64, i64) -> i64
      %2204 = func.call @cc_values_pack(%2203) : (i64) -> i64
      func.call @stack_push_pointer(%2201) : (i64) -> ()
      %2205 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2206 = arith.constant 13 : i64
      %2207 = func.call @cc_make_string(%2205, %2206) : (!llvm.ptr, i64) -> i64
      %2208 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2209 = arith.constant 11 : i64
      %2210 = func.call @cc_make_string(%2208, %2209) : (!llvm.ptr, i64) -> i64
      %2211 = func.call @cc_intern(%2207, %2210) : (i64, i64) -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = func.call @cc_cons(%2211, %2212) : (i64, i64) -> i64
      %2214 = func.call @cc_values_pack(%2213) : (i64) -> i64
      func.call @stack_push_pointer(%2211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2215 = func.call @stack_pop_pointer() : () -> i64
      %2216 = func.call @stack_pop_pointer() : () -> i64
      %2217 = func.call @cc_cons(%2216, %2215) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2218 = arith.addi %2217, %__rlasp_stack_elide_zero_107 : i64
      %2219 = func.call @stack_pop_pointer() : () -> i64
      %2220 = func.call @cc_cons(%2219, %2218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2221 = func.call @stack_pop_pointer() : () -> i64
      %2222 = func.call @stack_pop_pointer() : () -> i64
      %2223 = func.call @cc_cons(%2222, %2221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2224 = arith.addi %2223, %__rlasp_stack_elide_zero_108 : i64
      %2225 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2226 = arith.constant 11 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2229 = arith.constant 7 : i64
      %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
      %2231 = func.call @cc_intern(%2227, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_cons(%2231, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_values_pack(%2233) : (i64) -> i64
      %2235 = func.call @cc_nil_value() : () -> i64
      %2236 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2237 = arith.constant 4 : i64
      %2238 = func.call @cc_make_string(%2236, %2237) : (!llvm.ptr, i64) -> i64
      %2239 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2240 = arith.constant 7 : i64
      %2241 = func.call @cc_make_string(%2239, %2240) : (!llvm.ptr, i64) -> i64
      %2242 = func.call @cc_intern(%2238, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_cons(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_values_pack(%2244) : (i64) -> i64
      %2246 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2247 = arith.constant 5 : i64
      %2248 = func.call @cc_make_string(%2246, %2247) : (!llvm.ptr, i64) -> i64
      %2249 = func.call @cc_nil_value() : () -> i64
      %2250 = func.call @cc_intern(%2248, %2249) : (i64, i64) -> i64
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_cons(%2250, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_values_pack(%2252) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2254 = arith.addi %2250, %__rlasp_stack_elide_zero_109 : i64
      %2255 = func.call @cc_nil_value() : () -> i64
      %2256 = func.call @cc_errorp(%2070) : (i64) -> i64
      %2257 = arith.cmpi ne, %2256, %2255 : i64
      %2258 = arith.cmpi eq, %2255, %2255 : i64
      %2259 = arith.andi %2257, %2258 : i1
      %2260 = scf.if %2259 -> (i64) {
        scf.yield %2070 : i64
      } else {
        scf.yield %2255 : i64
      }
      %2261 = func.call @cc_errorp(%2139) : (i64) -> i64
      %2262 = arith.cmpi ne, %2261, %2255 : i64
      %2263 = arith.cmpi eq, %2260, %2255 : i64
      %2264 = arith.andi %2262, %2263 : i1
      %2265 = scf.if %2264 -> (i64) {
        scf.yield %2139 : i64
      } else {
        scf.yield %2260 : i64
      }
      %2266 = func.call @cc_errorp(%2194) : (i64) -> i64
      %2267 = arith.cmpi ne, %2266, %2255 : i64
      %2268 = arith.cmpi eq, %2265, %2255 : i64
      %2269 = arith.andi %2267, %2268 : i1
      %2270 = scf.if %2269 -> (i64) {
        scf.yield %2194 : i64
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
        func.call @stack_push_pointer(%2070) : (i64) -> ()
        func.call @stack_push_pointer(%2139) : (i64) -> ()
        func.call @stack_push_pointer(%2194) : (i64) -> ()
        func.call @stack_push_pointer(%2224) : (i64) -> ()
        func.call @stack_push_pointer(%2231) : (i64) -> ()
        func.call @stack_push_pointer(%2235) : (i64) -> ()
        func.call @stack_push_pointer(%2242) : (i64) -> ()
        func.call @stack_push_pointer(%2254) : (i64) -> ()
        %2297 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2298 = func.call @cc_make_function_ref_const(%2297) : (!llvm.ptr) -> i64
        %2299 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2298, %2299) : (i64, i64) -> ()
      }
      %2300 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2300 : i64
    }
    %2301 = func.call @cc_nil_value() : () -> i64
    %2302 = func.call @cc_errorp(%2061) : (i64) -> i64
    %2303 = arith.cmpi ne, %2302, %2301 : i64
    %2304 = scf.if %2303 -> (i64) {
      scf.yield %2061 : i64
    } else {
      %2305 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2306 = arith.constant 13 : i64
      %2307 = func.call @cc_make_string(%2305, %2306) : (!llvm.ptr, i64) -> i64
      %2308 = func.call @cc_nil_value() : () -> i64
      %2309 = func.call @cc_intern(%2307, %2308) : (i64, i64) -> i64
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_cons(%2309, %2310) : (i64, i64) -> i64
      %2312 = func.call @cc_values_pack(%2311) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2313 = arith.addi %2309, %__rlasp_stack_elide_zero_110 : i64
      %2314 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2315 = arith.constant 12 : i64
      %2316 = func.call @cc_make_string(%2314, %2315) : (!llvm.ptr, i64) -> i64
      %2317 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2318 = arith.constant 11 : i64
      %2319 = func.call @cc_make_string(%2317, %2318) : (!llvm.ptr, i64) -> i64
      %2320 = func.call @cc_intern(%2316, %2319) : (i64, i64) -> i64
      %2321 = func.call @cc_nil_value() : () -> i64
      %2322 = func.call @cc_cons(%2320, %2321) : (i64, i64) -> i64
      %2323 = func.call @cc_values_pack(%2322) : (i64) -> i64
      func.call @stack_push_pointer(%2320) : (i64) -> ()
      %2324 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2324) : (i64) -> ()
      %2325 = func.call @stack_pop_pointer() : () -> i64
      %2326 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2326) : (i64) -> ()
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @cc_nil_value() : () -> i64
      %2329 = func.call @cc_errorp(%2325) : (i64) -> i64
      %2330 = arith.cmpi ne, %2329, %2328 : i64
      %2331 = arith.cmpi eq, %2328, %2328 : i64
      %2332 = arith.andi %2330, %2331 : i1
      %2333 = scf.if %2332 -> (i64) {
        scf.yield %2325 : i64
      } else {
        scf.yield %2328 : i64
      }
      %2334 = func.call @cc_errorp(%2327) : (i64) -> i64
      %2335 = arith.cmpi ne, %2334, %2328 : i64
      %2336 = arith.cmpi eq, %2333, %2328 : i64
      %2337 = arith.andi %2335, %2336 : i1
      %2338 = scf.if %2337 -> (i64) {
        scf.yield %2327 : i64
      } else {
        scf.yield %2333 : i64
      }
      %2339 = arith.cmpi ne, %2338, %2328 : i64
      scf.if %2339 {
        func.call @stack_push_pointer(%2338) : (i64) -> ()
      } else {
        %2340 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2340) : (i64) -> ()
        %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
        %2341 = arith.addi %2327, %__rlasp_stack_elide_zero_111 : i64
        %2342 = func.call @stack_pop_pointer() : () -> i64
        %2343 = func.call @cc_cons(%2341, %2342) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2343) : (i64) -> ()
        %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
        %2344 = arith.addi %2325, %__rlasp_stack_elide_zero_112 : i64
        %2345 = func.call @stack_pop_pointer() : () -> i64
        %2346 = func.call @cc_cons(%2344, %2345) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2346) : (i64) -> ()
      }
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2349 = arith.constant 16 : i64
      %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
      %2351 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2352 = arith.constant 7 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_intern(%2350, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_nil_value() : () -> i64
      %2356 = func.call @cc_cons(%2354, %2355) : (i64, i64) -> i64
      %2357 = func.call @cc_values_pack(%2356) : (i64) -> i64
      %2358 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2358) : (i64) -> ()
      %2359 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2359) : (i64) -> ()
      %2360 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2360) : (i64) -> ()
      %2361 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%2361) : (i64) -> ()
      %2362 = arith.constant 4 : i64
      %2363 = func.call @cc_box_fixnum(%2362) : (i64) -> i64
      %2364 = func.call @cc_make_vector(%2363) : (i64) -> i64
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = arith.constant 3 : i64
      %2367 = func.call @cc_box_fixnum(%2366) : (i64) -> i64
      %2368 = func.call @cc_svset(%2364, %2367, %2365) : (i64, i64, i64) -> i64
      %2369 = func.call @stack_pop_pointer() : () -> i64
      %2370 = arith.constant 2 : i64
      %2371 = func.call @cc_box_fixnum(%2370) : (i64) -> i64
      %2372 = func.call @cc_svset(%2364, %2371, %2369) : (i64, i64, i64) -> i64
      %2373 = func.call @stack_pop_pointer() : () -> i64
      %2374 = arith.constant 1 : i64
      %2375 = func.call @cc_box_fixnum(%2374) : (i64) -> i64
      %2376 = func.call @cc_svset(%2364, %2375, %2373) : (i64, i64, i64) -> i64
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = arith.constant 0 : i64
      %2379 = func.call @cc_box_fixnum(%2378) : (i64) -> i64
      %2380 = func.call @cc_svset(%2364, %2379, %2377) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2381 = arith.addi %2364, %__rlasp_stack_elide_zero_113 : i64
      %2382 = func.call @cc_nil_value() : () -> i64
      %2383 = func.call @cc_errorp(%2347) : (i64) -> i64
      %2384 = arith.cmpi ne, %2383, %2382 : i64
      %2385 = arith.cmpi eq, %2382, %2382 : i64
      %2386 = arith.andi %2384, %2385 : i1
      %2387 = scf.if %2386 -> (i64) {
        scf.yield %2347 : i64
      } else {
        scf.yield %2382 : i64
      }
      %2388 = func.call @cc_errorp(%2354) : (i64) -> i64
      %2389 = arith.cmpi ne, %2388, %2382 : i64
      %2390 = arith.cmpi eq, %2387, %2382 : i64
      %2391 = arith.andi %2389, %2390 : i1
      %2392 = scf.if %2391 -> (i64) {
        scf.yield %2354 : i64
      } else {
        scf.yield %2387 : i64
      }
      %2393 = func.call @cc_errorp(%2381) : (i64) -> i64
      %2394 = arith.cmpi ne, %2393, %2382 : i64
      %2395 = arith.cmpi eq, %2392, %2382 : i64
      %2396 = arith.andi %2394, %2395 : i1
      %2397 = scf.if %2396 -> (i64) {
        scf.yield %2381 : i64
      } else {
        scf.yield %2392 : i64
      }
      %2398 = arith.cmpi ne, %2397, %2382 : i64
      scf.if %2398 {
        func.call @stack_push_pointer(%2397) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2347) : (i64) -> ()
        func.call @stack_push_pointer(%2354) : (i64) -> ()
        func.call @stack_push_pointer(%2381) : (i64) -> ()
        %2399 = llvm.mlir.addressof @str200 : !llvm.ptr
        %2400 = func.call @cc_make_function_ref_const(%2399) : (!llvm.ptr) -> i64
        %2401 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2400, %2401) : (i64, i64) -> ()
      }
      %2402 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      %2403 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2403) : (i64) -> ()
      %2404 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2404) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = func.call @stack_pop_pointer() : () -> i64
      %2407 = func.call @cc_cons(%2406, %2405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2408 = arith.addi %2407, %__rlasp_stack_elide_zero_114 : i64
      %2409 = func.call @stack_pop_pointer() : () -> i64
      %2410 = func.call @cc_cons(%2409, %2408) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2411 = arith.addi %2410, %__rlasp_stack_elide_zero_115 : i64
      %2412 = func.call @stack_pop_pointer() : () -> i64
      %2413 = func.call @cc_cons(%2411, %2412) : (i64, i64) -> i64
      %2414 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2415 = arith.constant 5 : i64
      %2416 = func.call @cc_make_string(%2414, %2415) : (!llvm.ptr, i64) -> i64
      %2417 = func.call @cc_nil_value() : () -> i64
      %2418 = func.call @cc_intern(%2416, %2417) : (i64, i64) -> i64
      %2419 = func.call @cc_nil_value() : () -> i64
      %2420 = func.call @cc_cons(%2418, %2419) : (i64, i64) -> i64
      %2421 = func.call @cc_values_pack(%2420) : (i64) -> i64
      %2422 = func.call @cc_cons(%2418, %2413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2423 = func.call @stack_pop_pointer() : () -> i64
      %2424 = func.call @stack_pop_pointer() : () -> i64
      %2425 = func.call @cc_cons(%2424, %2423) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2426 = arith.addi %2425, %__rlasp_stack_elide_zero_116 : i64
      %2427 = func.call @stack_pop_pointer() : () -> i64
      %2428 = func.call @cc_cons(%2427, %2426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2429 = arith.addi %2428, %__rlasp_stack_elide_zero_117 : i64
      %2430 = func.call @stack_pop_pointer() : () -> i64
      %2431 = func.call @cc_cons(%2430, %2429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2432 = arith.addi %2431, %__rlasp_stack_elide_zero_118 : i64
      %2542 = arith.constant 15079495958538 : i64
      %2543 = arith.constant 0 : i64
      %2544 = func.call @cc_make_closure(%2542, %2543) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2545 = arith.addi %2544, %__rlasp_stack_elide_zero_119 : i64
      %2546 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2546) : (i64) -> ()
      %2547 = func.call @stack_pop_pointer() : () -> i64
      %2548 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2548) : (i64) -> ()
      %2549 = func.call @stack_pop_pointer() : () -> i64
      %2550 = func.call @cc_nil_value() : () -> i64
      %2551 = func.call @cc_errorp(%2547) : (i64) -> i64
      %2552 = arith.cmpi ne, %2551, %2550 : i64
      %2553 = arith.cmpi eq, %2550, %2550 : i64
      %2554 = arith.andi %2552, %2553 : i1
      %2555 = scf.if %2554 -> (i64) {
        scf.yield %2547 : i64
      } else {
        scf.yield %2550 : i64
      }
      %2556 = func.call @cc_errorp(%2549) : (i64) -> i64
      %2557 = arith.cmpi ne, %2556, %2550 : i64
      %2558 = arith.cmpi eq, %2555, %2550 : i64
      %2559 = arith.andi %2557, %2558 : i1
      %2560 = scf.if %2559 -> (i64) {
        scf.yield %2549 : i64
      } else {
        scf.yield %2555 : i64
      }
      %2561 = arith.cmpi ne, %2560, %2550 : i64
      scf.if %2561 {
        func.call @stack_push_pointer(%2560) : (i64) -> ()
      } else {
        %2562 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2562) : (i64) -> ()
        %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
        %2563 = arith.addi %2549, %__rlasp_stack_elide_zero_120 : i64
        %2564 = func.call @stack_pop_pointer() : () -> i64
        %2565 = func.call @cc_cons(%2563, %2564) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2565) : (i64) -> ()
        %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
        %2566 = arith.addi %2547, %__rlasp_stack_elide_zero_121 : i64
        %2567 = func.call @stack_pop_pointer() : () -> i64
        %2568 = func.call @cc_cons(%2566, %2567) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2568) : (i64) -> ()
      }
      %2569 = func.call @stack_pop_pointer() : () -> i64
      %2570 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2571 = arith.constant 16 : i64
      %2572 = func.call @cc_make_string(%2570, %2571) : (!llvm.ptr, i64) -> i64
      %2573 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2574 = arith.constant 7 : i64
      %2575 = func.call @cc_make_string(%2573, %2574) : (!llvm.ptr, i64) -> i64
      %2576 = func.call @cc_intern(%2572, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_nil_value() : () -> i64
      %2578 = func.call @cc_cons(%2576, %2577) : (i64, i64) -> i64
      %2579 = func.call @cc_values_pack(%2578) : (i64) -> i64
      %2580 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2580) : (i64) -> ()
      %2581 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2582 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2582) : (i64) -> ()
      %2583 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%2583) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2584 = arith.constant 9 : i64
      %2585 = func.call @cc_box_fixnum(%2584) : (i64) -> i64
      %2586 = func.call @cc_make_vector(%2585) : (i64) -> i64
      %2587 = func.call @stack_pop_pointer() : () -> i64
      %2588 = arith.constant 8 : i64
      %2589 = func.call @cc_box_fixnum(%2588) : (i64) -> i64
      %2590 = func.call @cc_svset(%2586, %2589, %2587) : (i64, i64, i64) -> i64
      %2591 = func.call @stack_pop_pointer() : () -> i64
      %2592 = arith.constant 7 : i64
      %2593 = func.call @cc_box_fixnum(%2592) : (i64) -> i64
      %2594 = func.call @cc_svset(%2586, %2593, %2591) : (i64, i64, i64) -> i64
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = arith.constant 6 : i64
      %2597 = func.call @cc_box_fixnum(%2596) : (i64) -> i64
      %2598 = func.call @cc_svset(%2586, %2597, %2595) : (i64, i64, i64) -> i64
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = arith.constant 5 : i64
      %2601 = func.call @cc_box_fixnum(%2600) : (i64) -> i64
      %2602 = func.call @cc_svset(%2586, %2601, %2599) : (i64, i64, i64) -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = arith.constant 4 : i64
      %2605 = func.call @cc_box_fixnum(%2604) : (i64) -> i64
      %2606 = func.call @cc_svset(%2586, %2605, %2603) : (i64, i64, i64) -> i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = arith.constant 3 : i64
      %2609 = func.call @cc_box_fixnum(%2608) : (i64) -> i64
      %2610 = func.call @cc_svset(%2586, %2609, %2607) : (i64, i64, i64) -> i64
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = arith.constant 2 : i64
      %2613 = func.call @cc_box_fixnum(%2612) : (i64) -> i64
      %2614 = func.call @cc_svset(%2586, %2613, %2611) : (i64, i64, i64) -> i64
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = arith.constant 1 : i64
      %2617 = func.call @cc_box_fixnum(%2616) : (i64) -> i64
      %2618 = func.call @cc_svset(%2586, %2617, %2615) : (i64, i64, i64) -> i64
      %2619 = func.call @stack_pop_pointer() : () -> i64
      %2620 = arith.constant 0 : i64
      %2621 = func.call @cc_box_fixnum(%2620) : (i64) -> i64
      %2622 = func.call @cc_svset(%2586, %2621, %2619) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2623 = arith.addi %2586, %__rlasp_stack_elide_zero_122 : i64
      %2624 = func.call @cc_nil_value() : () -> i64
      %2625 = func.call @cc_errorp(%2569) : (i64) -> i64
      %2626 = arith.cmpi ne, %2625, %2624 : i64
      %2627 = arith.cmpi eq, %2624, %2624 : i64
      %2628 = arith.andi %2626, %2627 : i1
      %2629 = scf.if %2628 -> (i64) {
        scf.yield %2569 : i64
      } else {
        scf.yield %2624 : i64
      }
      %2630 = func.call @cc_errorp(%2576) : (i64) -> i64
      %2631 = arith.cmpi ne, %2630, %2624 : i64
      %2632 = arith.cmpi eq, %2629, %2624 : i64
      %2633 = arith.andi %2631, %2632 : i1
      %2634 = scf.if %2633 -> (i64) {
        scf.yield %2576 : i64
      } else {
        scf.yield %2629 : i64
      }
      %2635 = func.call @cc_errorp(%2623) : (i64) -> i64
      %2636 = arith.cmpi ne, %2635, %2624 : i64
      %2637 = arith.cmpi eq, %2634, %2624 : i64
      %2638 = arith.andi %2636, %2637 : i1
      %2639 = scf.if %2638 -> (i64) {
        scf.yield %2623 : i64
      } else {
        scf.yield %2634 : i64
      }
      %2640 = arith.cmpi ne, %2639, %2624 : i64
      scf.if %2640 {
        func.call @stack_push_pointer(%2639) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2569) : (i64) -> ()
        func.call @stack_push_pointer(%2576) : (i64) -> ()
        func.call @stack_push_pointer(%2623) : (i64) -> ()
        %2641 = llvm.mlir.addressof @str208 : !llvm.ptr
        %2642 = func.call @cc_make_function_ref_const(%2641) : (!llvm.ptr) -> i64
        %2643 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2642, %2643) : (i64, i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @stack_pop_pointer() : () -> i64
      %2646 = func.call @cc_cons(%2645, %2644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2647 = arith.addi %2646, %__rlasp_stack_elide_zero_123 : i64
      %2648 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2649 = arith.constant 11 : i64
      %2650 = func.call @cc_make_string(%2648, %2649) : (!llvm.ptr, i64) -> i64
      %2651 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2652 = arith.constant 7 : i64
      %2653 = func.call @cc_make_string(%2651, %2652) : (!llvm.ptr, i64) -> i64
      %2654 = func.call @cc_intern(%2650, %2653) : (i64, i64) -> i64
      %2655 = func.call @cc_nil_value() : () -> i64
      %2656 = func.call @cc_cons(%2654, %2655) : (i64, i64) -> i64
      %2657 = func.call @cc_values_pack(%2656) : (i64) -> i64
      %2658 = func.call @cc_nil_value() : () -> i64
      %2659 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2660 = arith.constant 4 : i64
      %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
      %2662 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2663 = arith.constant 7 : i64
      %2664 = func.call @cc_make_string(%2662, %2663) : (!llvm.ptr, i64) -> i64
      %2665 = func.call @cc_intern(%2661, %2664) : (i64, i64) -> i64
      %2666 = func.call @cc_nil_value() : () -> i64
      %2667 = func.call @cc_cons(%2665, %2666) : (i64, i64) -> i64
      %2668 = func.call @cc_values_pack(%2667) : (i64) -> i64
      %2669 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2670 = arith.constant 6 : i64
      %2671 = func.call @cc_make_string(%2669, %2670) : (!llvm.ptr, i64) -> i64
      %2672 = func.call @cc_nil_value() : () -> i64
      %2673 = func.call @cc_intern(%2671, %2672) : (i64, i64) -> i64
      %2674 = func.call @cc_nil_value() : () -> i64
      %2675 = func.call @cc_cons(%2673, %2674) : (i64, i64) -> i64
      %2676 = func.call @cc_values_pack(%2675) : (i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2677 = arith.addi %2673, %__rlasp_stack_elide_zero_124 : i64
      %2678 = func.call @cc_nil_value() : () -> i64
      %2679 = func.call @cc_errorp(%2313) : (i64) -> i64
      %2680 = arith.cmpi ne, %2679, %2678 : i64
      %2681 = arith.cmpi eq, %2678, %2678 : i64
      %2682 = arith.andi %2680, %2681 : i1
      %2683 = scf.if %2682 -> (i64) {
        scf.yield %2313 : i64
      } else {
        scf.yield %2678 : i64
      }
      %2684 = func.call @cc_errorp(%2432) : (i64) -> i64
      %2685 = arith.cmpi ne, %2684, %2678 : i64
      %2686 = arith.cmpi eq, %2683, %2678 : i64
      %2687 = arith.andi %2685, %2686 : i1
      %2688 = scf.if %2687 -> (i64) {
        scf.yield %2432 : i64
      } else {
        scf.yield %2683 : i64
      }
      %2689 = func.call @cc_errorp(%2545) : (i64) -> i64
      %2690 = arith.cmpi ne, %2689, %2678 : i64
      %2691 = arith.cmpi eq, %2688, %2678 : i64
      %2692 = arith.andi %2690, %2691 : i1
      %2693 = scf.if %2692 -> (i64) {
        scf.yield %2545 : i64
      } else {
        scf.yield %2688 : i64
      }
      %2694 = func.call @cc_errorp(%2647) : (i64) -> i64
      %2695 = arith.cmpi ne, %2694, %2678 : i64
      %2696 = arith.cmpi eq, %2693, %2678 : i64
      %2697 = arith.andi %2695, %2696 : i1
      %2698 = scf.if %2697 -> (i64) {
        scf.yield %2647 : i64
      } else {
        scf.yield %2693 : i64
      }
      %2699 = func.call @cc_errorp(%2654) : (i64) -> i64
      %2700 = arith.cmpi ne, %2699, %2678 : i64
      %2701 = arith.cmpi eq, %2698, %2678 : i64
      %2702 = arith.andi %2700, %2701 : i1
      %2703 = scf.if %2702 -> (i64) {
        scf.yield %2654 : i64
      } else {
        scf.yield %2698 : i64
      }
      %2704 = func.call @cc_errorp(%2658) : (i64) -> i64
      %2705 = arith.cmpi ne, %2704, %2678 : i64
      %2706 = arith.cmpi eq, %2703, %2678 : i64
      %2707 = arith.andi %2705, %2706 : i1
      %2708 = scf.if %2707 -> (i64) {
        scf.yield %2658 : i64
      } else {
        scf.yield %2703 : i64
      }
      %2709 = func.call @cc_errorp(%2665) : (i64) -> i64
      %2710 = arith.cmpi ne, %2709, %2678 : i64
      %2711 = arith.cmpi eq, %2708, %2678 : i64
      %2712 = arith.andi %2710, %2711 : i1
      %2713 = scf.if %2712 -> (i64) {
        scf.yield %2665 : i64
      } else {
        scf.yield %2708 : i64
      }
      %2714 = func.call @cc_errorp(%2677) : (i64) -> i64
      %2715 = arith.cmpi ne, %2714, %2678 : i64
      %2716 = arith.cmpi eq, %2713, %2678 : i64
      %2717 = arith.andi %2715, %2716 : i1
      %2718 = scf.if %2717 -> (i64) {
        scf.yield %2677 : i64
      } else {
        scf.yield %2713 : i64
      }
      %2719 = arith.cmpi ne, %2718, %2678 : i64
      scf.if %2719 {
        func.call @stack_push_pointer(%2718) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2313) : (i64) -> ()
        func.call @stack_push_pointer(%2432) : (i64) -> ()
        func.call @stack_push_pointer(%2545) : (i64) -> ()
        func.call @stack_push_pointer(%2647) : (i64) -> ()
        func.call @stack_push_pointer(%2654) : (i64) -> ()
        func.call @stack_push_pointer(%2658) : (i64) -> ()
        func.call @stack_push_pointer(%2665) : (i64) -> ()
        func.call @stack_push_pointer(%2677) : (i64) -> ()
        %2720 = llvm.mlir.addressof @str214 : !llvm.ptr
        %2721 = func.call @cc_make_function_ref_const(%2720) : (!llvm.ptr) -> i64
        %2722 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2721, %2722) : (i64, i64) -> ()
      }
      %2723 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2723 : i64
    }
    %2724 = func.call @cc_nil_value() : () -> i64
    %2725 = func.call @cc_errorp(%2304) : (i64) -> i64
    %2726 = arith.cmpi ne, %2725, %2724 : i64
    %2727 = scf.if %2726 -> (i64) {
      scf.yield %2304 : i64
    } else {
      %2728 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2729 = arith.constant 12 : i64
      %2730 = func.call @cc_make_string(%2728, %2729) : (!llvm.ptr, i64) -> i64
      %2731 = func.call @cc_nil_value() : () -> i64
      %2732 = func.call @cc_intern(%2730, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_nil_value() : () -> i64
      %2734 = func.call @cc_cons(%2732, %2733) : (i64, i64) -> i64
      %2735 = func.call @cc_values_pack(%2734) : (i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2736 = arith.addi %2732, %__rlasp_stack_elide_zero_125 : i64
      %2737 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2738 = arith.constant 18 : i64
      %2739 = func.call @cc_make_string(%2737, %2738) : (!llvm.ptr, i64) -> i64
      %2740 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2741 = arith.constant 11 : i64
      %2742 = func.call @cc_make_string(%2740, %2741) : (!llvm.ptr, i64) -> i64
      %2743 = func.call @cc_intern(%2739, %2742) : (i64, i64) -> i64
      %2744 = func.call @cc_nil_value() : () -> i64
      %2745 = func.call @cc_cons(%2743, %2744) : (i64, i64) -> i64
      %2746 = func.call @cc_values_pack(%2745) : (i64) -> i64
      func.call @stack_push_pointer(%2743) : (i64) -> ()
      %2747 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2748 = arith.constant 10 : i64
      %2749 = func.call @cc_make_string(%2747, %2748) : (!llvm.ptr, i64) -> i64
      %2750 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2751 = arith.constant 11 : i64
      %2752 = func.call @cc_make_string(%2750, %2751) : (!llvm.ptr, i64) -> i64
      %2753 = func.call @cc_intern(%2749, %2752) : (i64, i64) -> i64
      %2754 = func.call @cc_nil_value() : () -> i64
      %2755 = func.call @cc_cons(%2753, %2754) : (i64, i64) -> i64
      %2756 = func.call @cc_values_pack(%2755) : (i64) -> i64
      func.call @stack_push_pointer(%2753) : (i64) -> ()
      %2757 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2757) : (i64) -> ()
      %2758 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2759 = arith.constant 12 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2762 = arith.constant 7 : i64
      %2763 = func.call @cc_make_string(%2761, %2762) : (!llvm.ptr, i64) -> i64
      %2764 = func.call @cc_intern(%2760, %2763) : (i64, i64) -> i64
      %2765 = func.call @cc_nil_value() : () -> i64
      %2766 = func.call @cc_cons(%2764, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_values_pack(%2766) : (i64) -> i64
      func.call @stack_push_pointer(%2764) : (i64) -> ()
      %2768 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2768) : (i64) -> ()
      %2769 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2770 = arith.constant 9 : i64
      %2771 = func.call @cc_make_string(%2769, %2770) : (!llvm.ptr, i64) -> i64
      %2772 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2773 = arith.constant 11 : i64
      %2774 = func.call @cc_make_string(%2772, %2773) : (!llvm.ptr, i64) -> i64
      %2775 = func.call @cc_intern(%2771, %2774) : (i64, i64) -> i64
      %2776 = func.call @cc_nil_value() : () -> i64
      %2777 = func.call @cc_cons(%2775, %2776) : (i64, i64) -> i64
      %2778 = func.call @cc_values_pack(%2777) : (i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2779 = arith.addi %2775, %__rlasp_stack_elide_zero_126 : i64
      %2780 = func.call @stack_pop_pointer() : () -> i64
      %2781 = func.call @cc_cons(%2779, %2780) : (i64, i64) -> i64
      %2782 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2783 = arith.constant 5 : i64
      %2784 = func.call @cc_make_string(%2782, %2783) : (!llvm.ptr, i64) -> i64
      %2785 = func.call @cc_nil_value() : () -> i64
      %2786 = func.call @cc_intern(%2784, %2785) : (i64, i64) -> i64
      %2787 = func.call @cc_nil_value() : () -> i64
      %2788 = func.call @cc_cons(%2786, %2787) : (i64, i64) -> i64
      %2789 = func.call @cc_values_pack(%2788) : (i64) -> i64
      %2790 = func.call @cc_cons(%2786, %2781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2790) : (i64) -> ()
      %2791 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2792 = arith.constant 15 : i64
      %2793 = func.call @cc_make_string(%2791, %2792) : (!llvm.ptr, i64) -> i64
      %2794 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2795 = arith.constant 7 : i64
      %2796 = func.call @cc_make_string(%2794, %2795) : (!llvm.ptr, i64) -> i64
      %2797 = func.call @cc_intern(%2793, %2796) : (i64, i64) -> i64
      %2798 = func.call @cc_nil_value() : () -> i64
      %2799 = func.call @cc_cons(%2797, %2798) : (i64, i64) -> i64
      %2800 = func.call @cc_values_pack(%2799) : (i64) -> i64
      func.call @stack_push_pointer(%2797) : (i64) -> ()
      %2801 = arith.constant 97 : i64
      %2802 = func.call @cc_box_character(%2801) : (i64) -> i64
      func.call @stack_push_pointer(%2802) : (i64) -> ()
      %2803 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2804 = arith.constant 10 : i64
      %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
      %2806 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2807 = arith.constant 7 : i64
      %2808 = func.call @cc_make_string(%2806, %2807) : (!llvm.ptr, i64) -> i64
      %2809 = func.call @cc_intern(%2805, %2808) : (i64, i64) -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
      func.call @stack_push_pointer(%2809) : (i64) -> ()
      %2813 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @stack_pop_pointer() : () -> i64
      %2816 = func.call @cc_cons(%2815, %2814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2817 = arith.addi %2816, %__rlasp_stack_elide_zero_127 : i64
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = func.call @cc_cons(%2818, %2817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2820 = arith.addi %2819, %__rlasp_stack_elide_zero_128 : i64
      %2821 = func.call @stack_pop_pointer() : () -> i64
      %2822 = func.call @cc_cons(%2821, %2820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2823 = arith.addi %2822, %__rlasp_stack_elide_zero_129 : i64
      %2824 = func.call @stack_pop_pointer() : () -> i64
      %2825 = func.call @cc_cons(%2824, %2823) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2826 = arith.addi %2825, %__rlasp_stack_elide_zero_130 : i64
      %2827 = func.call @stack_pop_pointer() : () -> i64
      %2828 = func.call @cc_cons(%2827, %2826) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2829 = arith.addi %2828, %__rlasp_stack_elide_zero_131 : i64
      %2830 = func.call @stack_pop_pointer() : () -> i64
      %2831 = func.call @cc_cons(%2830, %2829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2832 = arith.addi %2831, %__rlasp_stack_elide_zero_132 : i64
      %2833 = func.call @stack_pop_pointer() : () -> i64
      %2834 = func.call @cc_cons(%2833, %2832) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2835 = arith.addi %2834, %__rlasp_stack_elide_zero_133 : i64
      %2836 = func.call @stack_pop_pointer() : () -> i64
      %2837 = func.call @cc_cons(%2836, %2835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2838 = func.call @stack_pop_pointer() : () -> i64
      %2839 = func.call @stack_pop_pointer() : () -> i64
      %2840 = func.call @cc_cons(%2839, %2838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2841 = arith.addi %2840, %__rlasp_stack_elide_zero_134 : i64
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = func.call @cc_cons(%2842, %2841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2844 = arith.addi %2843, %__rlasp_stack_elide_zero_135 : i64
      %2948 = arith.constant 15079495958539 : i64
      %2949 = arith.constant 0 : i64
      %2950 = func.call @cc_make_closure(%2948, %2949) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2951 = arith.addi %2950, %__rlasp_stack_elide_zero_136 : i64
      func.call @stack_push_nil() : () -> ()
      %2952 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2953 = func.call @stack_pop_pointer() : () -> i64
      %2954 = func.call @stack_pop_pointer() : () -> i64
      %2955 = func.call @cc_cons(%2954, %2953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2956 = arith.addi %2955, %__rlasp_stack_elide_zero_137 : i64
      %2957 = func.call @stack_pop_pointer() : () -> i64
      %2958 = func.call @cc_cons(%2957, %2956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2959 = arith.addi %2958, %__rlasp_stack_elide_zero_138 : i64
      %2960 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2961 = arith.constant 11 : i64
      %2962 = func.call @cc_make_string(%2960, %2961) : (!llvm.ptr, i64) -> i64
      %2963 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2964 = arith.constant 7 : i64
      %2965 = func.call @cc_make_string(%2963, %2964) : (!llvm.ptr, i64) -> i64
      %2966 = func.call @cc_intern(%2962, %2965) : (i64, i64) -> i64
      %2967 = func.call @cc_nil_value() : () -> i64
      %2968 = func.call @cc_cons(%2966, %2967) : (i64, i64) -> i64
      %2969 = func.call @cc_values_pack(%2968) : (i64) -> i64
      %2970 = func.call @cc_nil_value() : () -> i64
      %2971 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2972 = arith.constant 4 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2975 = arith.constant 7 : i64
      %2976 = func.call @cc_make_string(%2974, %2975) : (!llvm.ptr, i64) -> i64
      %2977 = func.call @cc_intern(%2973, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_nil_value() : () -> i64
      %2979 = func.call @cc_cons(%2977, %2978) : (i64, i64) -> i64
      %2980 = func.call @cc_values_pack(%2979) : (i64) -> i64
      %2981 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2982 = arith.constant 6 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      %2984 = func.call @cc_nil_value() : () -> i64
      %2985 = func.call @cc_intern(%2983, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_values_pack(%2987) : (i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2989 = arith.addi %2985, %__rlasp_stack_elide_zero_139 : i64
      %2990 = func.call @cc_nil_value() : () -> i64
      %2991 = func.call @cc_errorp(%2736) : (i64) -> i64
      %2992 = arith.cmpi ne, %2991, %2990 : i64
      %2993 = arith.cmpi eq, %2990, %2990 : i64
      %2994 = arith.andi %2992, %2993 : i1
      %2995 = scf.if %2994 -> (i64) {
        scf.yield %2736 : i64
      } else {
        scf.yield %2990 : i64
      }
      %2996 = func.call @cc_errorp(%2844) : (i64) -> i64
      %2997 = arith.cmpi ne, %2996, %2990 : i64
      %2998 = arith.cmpi eq, %2995, %2990 : i64
      %2999 = arith.andi %2997, %2998 : i1
      %3000 = scf.if %2999 -> (i64) {
        scf.yield %2844 : i64
      } else {
        scf.yield %2995 : i64
      }
      %3001 = func.call @cc_errorp(%2951) : (i64) -> i64
      %3002 = arith.cmpi ne, %3001, %2990 : i64
      %3003 = arith.cmpi eq, %3000, %2990 : i64
      %3004 = arith.andi %3002, %3003 : i1
      %3005 = scf.if %3004 -> (i64) {
        scf.yield %2951 : i64
      } else {
        scf.yield %3000 : i64
      }
      %3006 = func.call @cc_errorp(%2959) : (i64) -> i64
      %3007 = arith.cmpi ne, %3006, %2990 : i64
      %3008 = arith.cmpi eq, %3005, %2990 : i64
      %3009 = arith.andi %3007, %3008 : i1
      %3010 = scf.if %3009 -> (i64) {
        scf.yield %2959 : i64
      } else {
        scf.yield %3005 : i64
      }
      %3011 = func.call @cc_errorp(%2966) : (i64) -> i64
      %3012 = arith.cmpi ne, %3011, %2990 : i64
      %3013 = arith.cmpi eq, %3010, %2990 : i64
      %3014 = arith.andi %3012, %3013 : i1
      %3015 = scf.if %3014 -> (i64) {
        scf.yield %2966 : i64
      } else {
        scf.yield %3010 : i64
      }
      %3016 = func.call @cc_errorp(%2970) : (i64) -> i64
      %3017 = arith.cmpi ne, %3016, %2990 : i64
      %3018 = arith.cmpi eq, %3015, %2990 : i64
      %3019 = arith.andi %3017, %3018 : i1
      %3020 = scf.if %3019 -> (i64) {
        scf.yield %2970 : i64
      } else {
        scf.yield %3015 : i64
      }
      %3021 = func.call @cc_errorp(%2977) : (i64) -> i64
      %3022 = arith.cmpi ne, %3021, %2990 : i64
      %3023 = arith.cmpi eq, %3020, %2990 : i64
      %3024 = arith.andi %3022, %3023 : i1
      %3025 = scf.if %3024 -> (i64) {
        scf.yield %2977 : i64
      } else {
        scf.yield %3020 : i64
      }
      %3026 = func.call @cc_errorp(%2989) : (i64) -> i64
      %3027 = arith.cmpi ne, %3026, %2990 : i64
      %3028 = arith.cmpi eq, %3025, %2990 : i64
      %3029 = arith.andi %3027, %3028 : i1
      %3030 = scf.if %3029 -> (i64) {
        scf.yield %2989 : i64
      } else {
        scf.yield %3025 : i64
      }
      %3031 = arith.cmpi ne, %3030, %2990 : i64
      scf.if %3031 {
        func.call @stack_push_pointer(%3030) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2736) : (i64) -> ()
        func.call @stack_push_pointer(%2844) : (i64) -> ()
        func.call @stack_push_pointer(%2951) : (i64) -> ()
        func.call @stack_push_pointer(%2959) : (i64) -> ()
        func.call @stack_push_pointer(%2966) : (i64) -> ()
        func.call @stack_push_pointer(%2970) : (i64) -> ()
        func.call @stack_push_pointer(%2977) : (i64) -> ()
        func.call @stack_push_pointer(%2989) : (i64) -> ()
        %3032 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3033 = func.call @cc_make_function_ref_const(%3032) : (!llvm.ptr) -> i64
        %3034 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3033, %3034) : (i64, i64) -> ()
      }
      %3035 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3035 : i64
    }
    %3036 = func.call @cc_nil_value() : () -> i64
    %3037 = func.call @cc_errorp(%2727) : (i64) -> i64
    %3038 = arith.cmpi ne, %3037, %3036 : i64
    %3039 = scf.if %3038 -> (i64) {
      scf.yield %2727 : i64
    } else {
      %3040 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3041 = arith.constant 12 : i64
      %3042 = func.call @cc_make_string(%3040, %3041) : (!llvm.ptr, i64) -> i64
      %3043 = func.call @cc_nil_value() : () -> i64
      %3044 = func.call @cc_intern(%3042, %3043) : (i64, i64) -> i64
      %3045 = func.call @cc_nil_value() : () -> i64
      %3046 = func.call @cc_cons(%3044, %3045) : (i64, i64) -> i64
      %3047 = func.call @cc_values_pack(%3046) : (i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3048 = arith.addi %3044, %__rlasp_stack_elide_zero_140 : i64
      %3049 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3050 = arith.constant 18 : i64
      %3051 = func.call @cc_make_string(%3049, %3050) : (!llvm.ptr, i64) -> i64
      %3052 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3053 = arith.constant 11 : i64
      %3054 = func.call @cc_make_string(%3052, %3053) : (!llvm.ptr, i64) -> i64
      %3055 = func.call @cc_intern(%3051, %3054) : (i64, i64) -> i64
      %3056 = func.call @cc_nil_value() : () -> i64
      %3057 = func.call @cc_cons(%3055, %3056) : (i64, i64) -> i64
      %3058 = func.call @cc_values_pack(%3057) : (i64) -> i64
      func.call @stack_push_pointer(%3055) : (i64) -> ()
      %3059 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3060 = arith.constant 10 : i64
      %3061 = func.call @cc_make_string(%3059, %3060) : (!llvm.ptr, i64) -> i64
      %3062 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3063 = arith.constant 11 : i64
      %3064 = func.call @cc_make_string(%3062, %3063) : (!llvm.ptr, i64) -> i64
      %3065 = func.call @cc_intern(%3061, %3064) : (i64, i64) -> i64
      %3066 = func.call @cc_nil_value() : () -> i64
      %3067 = func.call @cc_cons(%3065, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_values_pack(%3067) : (i64) -> i64
      func.call @stack_push_pointer(%3065) : (i64) -> ()
      %3069 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%3069) : (i64) -> ()
      %3070 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3071 = arith.constant 12 : i64
      %3072 = func.call @cc_make_string(%3070, %3071) : (!llvm.ptr, i64) -> i64
      %3073 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3074 = arith.constant 7 : i64
      %3075 = func.call @cc_make_string(%3073, %3074) : (!llvm.ptr, i64) -> i64
      %3076 = func.call @cc_intern(%3072, %3075) : (i64, i64) -> i64
      %3077 = func.call @cc_nil_value() : () -> i64
      %3078 = func.call @cc_cons(%3076, %3077) : (i64, i64) -> i64
      %3079 = func.call @cc_values_pack(%3078) : (i64) -> i64
      func.call @stack_push_pointer(%3076) : (i64) -> ()
      %3080 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3080) : (i64) -> ()
      %3081 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3082 = arith.constant 9 : i64
      %3083 = func.call @cc_make_string(%3081, %3082) : (!llvm.ptr, i64) -> i64
      %3084 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3085 = arith.constant 11 : i64
      %3086 = func.call @cc_make_string(%3084, %3085) : (!llvm.ptr, i64) -> i64
      %3087 = func.call @cc_intern(%3083, %3086) : (i64, i64) -> i64
      %3088 = func.call @cc_nil_value() : () -> i64
      %3089 = func.call @cc_cons(%3087, %3088) : (i64, i64) -> i64
      %3090 = func.call @cc_values_pack(%3089) : (i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3091 = arith.addi %3087, %__rlasp_stack_elide_zero_141 : i64
      %3092 = func.call @stack_pop_pointer() : () -> i64
      %3093 = func.call @cc_cons(%3091, %3092) : (i64, i64) -> i64
      %3094 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3095 = arith.constant 5 : i64
      %3096 = func.call @cc_make_string(%3094, %3095) : (!llvm.ptr, i64) -> i64
      %3097 = func.call @cc_nil_value() : () -> i64
      %3098 = func.call @cc_intern(%3096, %3097) : (i64, i64) -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_cons(%3098, %3099) : (i64, i64) -> i64
      %3101 = func.call @cc_values_pack(%3100) : (i64) -> i64
      %3102 = func.call @cc_cons(%3098, %3093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3102) : (i64) -> ()
      %3103 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3104 = arith.constant 15 : i64
      %3105 = func.call @cc_make_string(%3103, %3104) : (!llvm.ptr, i64) -> i64
      %3106 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3107 = arith.constant 7 : i64
      %3108 = func.call @cc_make_string(%3106, %3107) : (!llvm.ptr, i64) -> i64
      %3109 = func.call @cc_intern(%3105, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_nil_value() : () -> i64
      %3111 = func.call @cc_cons(%3109, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_values_pack(%3111) : (i64) -> i64
      func.call @stack_push_pointer(%3109) : (i64) -> ()
      %3113 = arith.constant 97 : i64
      %3114 = func.call @cc_box_character(%3113) : (i64) -> i64
      func.call @stack_push_pointer(%3114) : (i64) -> ()
      %3115 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3116 = arith.constant 10 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3119 = arith.constant 7 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = func.call @cc_intern(%3117, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_nil_value() : () -> i64
      %3123 = func.call @cc_cons(%3121, %3122) : (i64, i64) -> i64
      %3124 = func.call @cc_values_pack(%3123) : (i64) -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      %3125 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = func.call @stack_pop_pointer() : () -> i64
      %3128 = func.call @cc_cons(%3127, %3126) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3129 = arith.addi %3128, %__rlasp_stack_elide_zero_142 : i64
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @cc_cons(%3130, %3129) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3132 = arith.addi %3131, %__rlasp_stack_elide_zero_143 : i64
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @cc_cons(%3133, %3132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3135 = arith.addi %3134, %__rlasp_stack_elide_zero_144 : i64
      %3136 = func.call @stack_pop_pointer() : () -> i64
      %3137 = func.call @cc_cons(%3136, %3135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3138 = arith.addi %3137, %__rlasp_stack_elide_zero_145 : i64
      %3139 = func.call @stack_pop_pointer() : () -> i64
      %3140 = func.call @cc_cons(%3139, %3138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3141 = arith.addi %3140, %__rlasp_stack_elide_zero_146 : i64
      %3142 = func.call @stack_pop_pointer() : () -> i64
      %3143 = func.call @cc_cons(%3142, %3141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3144 = arith.addi %3143, %__rlasp_stack_elide_zero_147 : i64
      %3145 = func.call @stack_pop_pointer() : () -> i64
      %3146 = func.call @cc_cons(%3145, %3144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3147 = arith.addi %3146, %__rlasp_stack_elide_zero_148 : i64
      %3148 = func.call @stack_pop_pointer() : () -> i64
      %3149 = func.call @cc_cons(%3148, %3147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3150 = func.call @stack_pop_pointer() : () -> i64
      %3151 = func.call @stack_pop_pointer() : () -> i64
      %3152 = func.call @cc_cons(%3151, %3150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3153 = arith.addi %3152, %__rlasp_stack_elide_zero_149 : i64
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3155 = func.call @cc_cons(%3154, %3153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3156 = arith.addi %3155, %__rlasp_stack_elide_zero_150 : i64
      %3260 = arith.constant 15079495958540 : i64
      %3261 = arith.constant 0 : i64
      %3262 = func.call @cc_make_closure(%3260, %3261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3263 = arith.addi %3262, %__rlasp_stack_elide_zero_151 : i64
      func.call @stack_push_nil() : () -> ()
      %3264 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3264) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3265 = func.call @stack_pop_pointer() : () -> i64
      %3266 = func.call @stack_pop_pointer() : () -> i64
      %3267 = func.call @cc_cons(%3266, %3265) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3268 = arith.addi %3267, %__rlasp_stack_elide_zero_152 : i64
      %3269 = func.call @stack_pop_pointer() : () -> i64
      %3270 = func.call @cc_cons(%3269, %3268) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3271 = arith.addi %3270, %__rlasp_stack_elide_zero_153 : i64
      %3272 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3273 = arith.constant 11 : i64
      %3274 = func.call @cc_make_string(%3272, %3273) : (!llvm.ptr, i64) -> i64
      %3275 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3276 = arith.constant 7 : i64
      %3277 = func.call @cc_make_string(%3275, %3276) : (!llvm.ptr, i64) -> i64
      %3278 = func.call @cc_intern(%3274, %3277) : (i64, i64) -> i64
      %3279 = func.call @cc_nil_value() : () -> i64
      %3280 = func.call @cc_cons(%3278, %3279) : (i64, i64) -> i64
      %3281 = func.call @cc_values_pack(%3280) : (i64) -> i64
      %3282 = func.call @cc_nil_value() : () -> i64
      %3283 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3284 = arith.constant 4 : i64
      %3285 = func.call @cc_make_string(%3283, %3284) : (!llvm.ptr, i64) -> i64
      %3286 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3287 = arith.constant 7 : i64
      %3288 = func.call @cc_make_string(%3286, %3287) : (!llvm.ptr, i64) -> i64
      %3289 = func.call @cc_intern(%3285, %3288) : (i64, i64) -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_cons(%3289, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_values_pack(%3291) : (i64) -> i64
      %3293 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3294 = arith.constant 6 : i64
      %3295 = func.call @cc_make_string(%3293, %3294) : (!llvm.ptr, i64) -> i64
      %3296 = func.call @cc_nil_value() : () -> i64
      %3297 = func.call @cc_intern(%3295, %3296) : (i64, i64) -> i64
      %3298 = func.call @cc_nil_value() : () -> i64
      %3299 = func.call @cc_cons(%3297, %3298) : (i64, i64) -> i64
      %3300 = func.call @cc_values_pack(%3299) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3301 = arith.addi %3297, %__rlasp_stack_elide_zero_154 : i64
      %3302 = func.call @cc_nil_value() : () -> i64
      %3303 = func.call @cc_errorp(%3048) : (i64) -> i64
      %3304 = arith.cmpi ne, %3303, %3302 : i64
      %3305 = arith.cmpi eq, %3302, %3302 : i64
      %3306 = arith.andi %3304, %3305 : i1
      %3307 = scf.if %3306 -> (i64) {
        scf.yield %3048 : i64
      } else {
        scf.yield %3302 : i64
      }
      %3308 = func.call @cc_errorp(%3156) : (i64) -> i64
      %3309 = arith.cmpi ne, %3308, %3302 : i64
      %3310 = arith.cmpi eq, %3307, %3302 : i64
      %3311 = arith.andi %3309, %3310 : i1
      %3312 = scf.if %3311 -> (i64) {
        scf.yield %3156 : i64
      } else {
        scf.yield %3307 : i64
      }
      %3313 = func.call @cc_errorp(%3263) : (i64) -> i64
      %3314 = arith.cmpi ne, %3313, %3302 : i64
      %3315 = arith.cmpi eq, %3312, %3302 : i64
      %3316 = arith.andi %3314, %3315 : i1
      %3317 = scf.if %3316 -> (i64) {
        scf.yield %3263 : i64
      } else {
        scf.yield %3312 : i64
      }
      %3318 = func.call @cc_errorp(%3271) : (i64) -> i64
      %3319 = arith.cmpi ne, %3318, %3302 : i64
      %3320 = arith.cmpi eq, %3317, %3302 : i64
      %3321 = arith.andi %3319, %3320 : i1
      %3322 = scf.if %3321 -> (i64) {
        scf.yield %3271 : i64
      } else {
        scf.yield %3317 : i64
      }
      %3323 = func.call @cc_errorp(%3278) : (i64) -> i64
      %3324 = arith.cmpi ne, %3323, %3302 : i64
      %3325 = arith.cmpi eq, %3322, %3302 : i64
      %3326 = arith.andi %3324, %3325 : i1
      %3327 = scf.if %3326 -> (i64) {
        scf.yield %3278 : i64
      } else {
        scf.yield %3322 : i64
      }
      %3328 = func.call @cc_errorp(%3282) : (i64) -> i64
      %3329 = arith.cmpi ne, %3328, %3302 : i64
      %3330 = arith.cmpi eq, %3327, %3302 : i64
      %3331 = arith.andi %3329, %3330 : i1
      %3332 = scf.if %3331 -> (i64) {
        scf.yield %3282 : i64
      } else {
        scf.yield %3327 : i64
      }
      %3333 = func.call @cc_errorp(%3289) : (i64) -> i64
      %3334 = arith.cmpi ne, %3333, %3302 : i64
      %3335 = arith.cmpi eq, %3332, %3302 : i64
      %3336 = arith.andi %3334, %3335 : i1
      %3337 = scf.if %3336 -> (i64) {
        scf.yield %3289 : i64
      } else {
        scf.yield %3332 : i64
      }
      %3338 = func.call @cc_errorp(%3301) : (i64) -> i64
      %3339 = arith.cmpi ne, %3338, %3302 : i64
      %3340 = arith.cmpi eq, %3337, %3302 : i64
      %3341 = arith.andi %3339, %3340 : i1
      %3342 = scf.if %3341 -> (i64) {
        scf.yield %3301 : i64
      } else {
        scf.yield %3337 : i64
      }
      %3343 = arith.cmpi ne, %3342, %3302 : i64
      scf.if %3343 {
        func.call @stack_push_pointer(%3342) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3048) : (i64) -> ()
        func.call @stack_push_pointer(%3156) : (i64) -> ()
        func.call @stack_push_pointer(%3263) : (i64) -> ()
        func.call @stack_push_pointer(%3271) : (i64) -> ()
        func.call @stack_push_pointer(%3278) : (i64) -> ()
        func.call @stack_push_pointer(%3282) : (i64) -> ()
        func.call @stack_push_pointer(%3289) : (i64) -> ()
        func.call @stack_push_pointer(%3301) : (i64) -> ()
        %3344 = llvm.mlir.addressof @str274 : !llvm.ptr
        %3345 = func.call @cc_make_function_ref_const(%3344) : (!llvm.ptr) -> i64
        %3346 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3345, %3346) : (i64, i64) -> ()
      }
      %3347 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3347 : i64
    }
    %3348 = func.call @cc_nil_value() : () -> i64
    %3349 = func.call @cc_errorp(%3039) : (i64) -> i64
    %3350 = arith.cmpi ne, %3349, %3348 : i64
    %3351 = scf.if %3350 -> (i64) {
      scf.yield %3039 : i64
    } else {
      %3352 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3353 = arith.constant 12 : i64
      %3354 = func.call @cc_make_string(%3352, %3353) : (!llvm.ptr, i64) -> i64
      %3355 = func.call @cc_nil_value() : () -> i64
      %3356 = func.call @cc_intern(%3354, %3355) : (i64, i64) -> i64
      %3357 = func.call @cc_nil_value() : () -> i64
      %3358 = func.call @cc_cons(%3356, %3357) : (i64, i64) -> i64
      %3359 = func.call @cc_values_pack(%3358) : (i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3360 = arith.addi %3356, %__rlasp_stack_elide_zero_155 : i64
      %3361 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3362 = arith.constant 6 : i64
      %3363 = func.call @cc_make_string(%3361, %3362) : (!llvm.ptr, i64) -> i64
      %3364 = func.call @cc_nil_value() : () -> i64
      %3365 = func.call @cc_intern(%3363, %3364) : (i64, i64) -> i64
      %3366 = func.call @cc_nil_value() : () -> i64
      %3367 = func.call @cc_cons(%3365, %3366) : (i64, i64) -> i64
      %3368 = func.call @cc_values_pack(%3367) : (i64) -> i64
      func.call @stack_push_pointer(%3365) : (i64) -> ()
      %3369 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3370 = arith.constant 10 : i64
      %3371 = func.call @cc_make_string(%3369, %3370) : (!llvm.ptr, i64) -> i64
      %3372 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3373 = arith.constant 11 : i64
      %3374 = func.call @cc_make_string(%3372, %3373) : (!llvm.ptr, i64) -> i64
      %3375 = func.call @cc_intern(%3371, %3374) : (i64, i64) -> i64
      %3376 = func.call @cc_nil_value() : () -> i64
      %3377 = func.call @cc_cons(%3375, %3376) : (i64, i64) -> i64
      %3378 = func.call @cc_values_pack(%3377) : (i64) -> i64
      func.call @stack_push_pointer(%3375) : (i64) -> ()
      %3379 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3379) : (i64) -> ()
      %3380 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3380) : (i64) -> ()
      %3381 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3382 = func.call @stack_pop_pointer() : () -> i64
      %3383 = func.call @stack_pop_pointer() : () -> i64
      %3384 = func.call @cc_cons(%3383, %3382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3385 = arith.addi %3384, %__rlasp_stack_elide_zero_156 : i64
      %3386 = func.call @stack_pop_pointer() : () -> i64
      %3387 = func.call @cc_cons(%3386, %3385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3388 = arith.addi %3387, %__rlasp_stack_elide_zero_157 : i64
      %3389 = func.call @stack_pop_pointer() : () -> i64
      %3390 = func.call @cc_cons(%3388, %3389) : (i64, i64) -> i64
      %3391 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3392 = arith.constant 5 : i64
      %3393 = func.call @cc_make_string(%3391, %3392) : (!llvm.ptr, i64) -> i64
      %3394 = func.call @cc_nil_value() : () -> i64
      %3395 = func.call @cc_intern(%3393, %3394) : (i64, i64) -> i64
      %3396 = func.call @cc_nil_value() : () -> i64
      %3397 = func.call @cc_cons(%3395, %3396) : (i64, i64) -> i64
      %3398 = func.call @cc_values_pack(%3397) : (i64) -> i64
      %3399 = func.call @cc_cons(%3395, %3390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3399) : (i64) -> ()
      %3400 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3401 = arith.constant 12 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3404 = arith.constant 7 : i64
      %3405 = func.call @cc_make_string(%3403, %3404) : (!llvm.ptr, i64) -> i64
      %3406 = func.call @cc_intern(%3402, %3405) : (i64, i64) -> i64
      %3407 = func.call @cc_nil_value() : () -> i64
      %3408 = func.call @cc_cons(%3406, %3407) : (i64, i64) -> i64
      %3409 = func.call @cc_values_pack(%3408) : (i64) -> i64
      func.call @stack_push_pointer(%3406) : (i64) -> ()
      %3410 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3410) : (i64) -> ()
      %3411 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3412 = arith.constant 7 : i64
      %3413 = func.call @cc_make_string(%3411, %3412) : (!llvm.ptr, i64) -> i64
      %3414 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3415 = arith.constant 11 : i64
      %3416 = func.call @cc_make_string(%3414, %3415) : (!llvm.ptr, i64) -> i64
      %3417 = func.call @cc_intern(%3413, %3416) : (i64, i64) -> i64
      %3418 = func.call @cc_nil_value() : () -> i64
      %3419 = func.call @cc_cons(%3417, %3418) : (i64, i64) -> i64
      %3420 = func.call @cc_values_pack(%3419) : (i64) -> i64
      func.call @stack_push_pointer(%3417) : (i64) -> ()
      %3421 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3421) : (i64) -> ()
      %3422 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%3422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = func.call @stack_pop_pointer() : () -> i64
      %3425 = func.call @cc_cons(%3424, %3423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3426 = func.call @stack_pop_pointer() : () -> i64
      %3427 = func.call @stack_pop_pointer() : () -> i64
      %3428 = func.call @cc_cons(%3427, %3426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3429 = arith.addi %3428, %__rlasp_stack_elide_zero_158 : i64
      %3430 = func.call @stack_pop_pointer() : () -> i64
      %3431 = func.call @cc_cons(%3430, %3429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3432 = arith.addi %3431, %__rlasp_stack_elide_zero_159 : i64
      %3433 = func.call @stack_pop_pointer() : () -> i64
      %3434 = func.call @cc_cons(%3433, %3432) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3435 = arith.addi %3434, %__rlasp_stack_elide_zero_160 : i64
      %3436 = func.call @stack_pop_pointer() : () -> i64
      %3437 = func.call @cc_cons(%3435, %3436) : (i64, i64) -> i64
      %3438 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3439 = arith.constant 5 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = func.call @cc_intern(%3440, %3441) : (i64, i64) -> i64
      %3443 = func.call @cc_nil_value() : () -> i64
      %3444 = func.call @cc_cons(%3442, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_values_pack(%3444) : (i64) -> i64
      %3446 = func.call @cc_cons(%3442, %3437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3446) : (i64) -> ()
      %3447 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3448 = arith.constant 16 : i64
      %3449 = func.call @cc_make_string(%3447, %3448) : (!llvm.ptr, i64) -> i64
      %3450 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3451 = arith.constant 7 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = func.call @cc_intern(%3449, %3452) : (i64, i64) -> i64
      %3454 = func.call @cc_nil_value() : () -> i64
      %3455 = func.call @cc_cons(%3453, %3454) : (i64, i64) -> i64
      %3456 = func.call @cc_values_pack(%3455) : (i64) -> i64
      func.call @stack_push_pointer(%3453) : (i64) -> ()
      %3457 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3457) : (i64) -> ()
      %3458 = arith.constant 34 : i64
      func.call @stack_push_fixnum(%3458) : (i64) -> ()
      %3459 = arith.constant 98 : i64
      func.call @stack_push_fixnum(%3459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3460 = func.call @stack_pop_pointer() : () -> i64
      %3461 = func.call @stack_pop_pointer() : () -> i64
      %3462 = func.call @cc_cons(%3461, %3460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3463 = arith.addi %3462, %__rlasp_stack_elide_zero_161 : i64
      %3464 = func.call @stack_pop_pointer() : () -> i64
      %3465 = func.call @cc_cons(%3464, %3463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3466 = arith.constant 14 : i64
      func.call @stack_push_fixnum(%3466) : (i64) -> ()
      %3467 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%3467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3468 = func.call @stack_pop_pointer() : () -> i64
      %3469 = func.call @stack_pop_pointer() : () -> i64
      %3470 = func.call @cc_cons(%3469, %3468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3471 = arith.addi %3470, %__rlasp_stack_elide_zero_162 : i64
      %3472 = func.call @stack_pop_pointer() : () -> i64
      %3473 = func.call @cc_cons(%3472, %3471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3473) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3474 = func.call @stack_pop_pointer() : () -> i64
      %3475 = func.call @stack_pop_pointer() : () -> i64
      %3476 = func.call @cc_cons(%3475, %3474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3477 = arith.addi %3476, %__rlasp_stack_elide_zero_163 : i64
      %3478 = func.call @stack_pop_pointer() : () -> i64
      %3479 = func.call @cc_cons(%3478, %3477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3480 = arith.addi %3479, %__rlasp_stack_elide_zero_164 : i64
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @cc_cons(%3480, %3481) : (i64, i64) -> i64
      %3483 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3484 = arith.constant 5 : i64
      %3485 = func.call @cc_make_string(%3483, %3484) : (!llvm.ptr, i64) -> i64
      %3486 = func.call @cc_nil_value() : () -> i64
      %3487 = func.call @cc_intern(%3485, %3486) : (i64, i64) -> i64
      %3488 = func.call @cc_nil_value() : () -> i64
      %3489 = func.call @cc_cons(%3487, %3488) : (i64, i64) -> i64
      %3490 = func.call @cc_values_pack(%3489) : (i64) -> i64
      %3491 = func.call @cc_cons(%3487, %3482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3492 = func.call @stack_pop_pointer() : () -> i64
      %3493 = func.call @stack_pop_pointer() : () -> i64
      %3494 = func.call @cc_cons(%3493, %3492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3495 = arith.addi %3494, %__rlasp_stack_elide_zero_165 : i64
      %3496 = func.call @stack_pop_pointer() : () -> i64
      %3497 = func.call @cc_cons(%3496, %3495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3498 = arith.addi %3497, %__rlasp_stack_elide_zero_166 : i64
      %3499 = func.call @stack_pop_pointer() : () -> i64
      %3500 = func.call @cc_cons(%3499, %3498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3501 = arith.addi %3500, %__rlasp_stack_elide_zero_167 : i64
      %3502 = func.call @stack_pop_pointer() : () -> i64
      %3503 = func.call @cc_cons(%3502, %3501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3504 = arith.addi %3503, %__rlasp_stack_elide_zero_168 : i64
      %3505 = func.call @stack_pop_pointer() : () -> i64
      %3506 = func.call @cc_cons(%3505, %3504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3507 = arith.addi %3506, %__rlasp_stack_elide_zero_169 : i64
      %3508 = func.call @stack_pop_pointer() : () -> i64
      %3509 = func.call @cc_cons(%3508, %3507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3509) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3510 = func.call @stack_pop_pointer() : () -> i64
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = func.call @cc_cons(%3511, %3510) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3513 = arith.addi %3512, %__rlasp_stack_elide_zero_170 : i64
      %3514 = func.call @stack_pop_pointer() : () -> i64
      %3515 = func.call @cc_cons(%3514, %3513) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3516 = arith.addi %3515, %__rlasp_stack_elide_zero_171 : i64
      %3635 = arith.constant 15079495958541 : i64
      %3636 = arith.constant 0 : i64
      %3637 = func.call @cc_make_closure(%3635, %3636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3638 = arith.addi %3637, %__rlasp_stack_elide_zero_172 : i64
      %3639 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3640 = arith.constant 5 : i64
      %3641 = func.call @cc_make_string(%3639, %3640) : (!llvm.ptr, i64) -> i64
      %3642 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3643 = arith.constant 11 : i64
      %3644 = func.call @cc_make_string(%3642, %3643) : (!llvm.ptr, i64) -> i64
      %3645 = func.call @cc_intern(%3641, %3644) : (i64, i64) -> i64
      %3646 = func.call @cc_nil_value() : () -> i64
      %3647 = func.call @cc_cons(%3645, %3646) : (i64, i64) -> i64
      %3648 = func.call @cc_values_pack(%3647) : (i64) -> i64
      func.call @stack_push_pointer(%3645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3649 = func.call @stack_pop_pointer() : () -> i64
      %3650 = func.call @stack_pop_pointer() : () -> i64
      %3651 = func.call @cc_cons(%3650, %3649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3652 = arith.addi %3651, %__rlasp_stack_elide_zero_173 : i64
      %3653 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3654 = arith.constant 11 : i64
      %3655 = func.call @cc_make_string(%3653, %3654) : (!llvm.ptr, i64) -> i64
      %3656 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3657 = arith.constant 7 : i64
      %3658 = func.call @cc_make_string(%3656, %3657) : (!llvm.ptr, i64) -> i64
      %3659 = func.call @cc_intern(%3655, %3658) : (i64, i64) -> i64
      %3660 = func.call @cc_nil_value() : () -> i64
      %3661 = func.call @cc_cons(%3659, %3660) : (i64, i64) -> i64
      %3662 = func.call @cc_values_pack(%3661) : (i64) -> i64
      %3663 = func.call @cc_nil_value() : () -> i64
      %3664 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3665 = arith.constant 4 : i64
      %3666 = func.call @cc_make_string(%3664, %3665) : (!llvm.ptr, i64) -> i64
      %3667 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3668 = arith.constant 7 : i64
      %3669 = func.call @cc_make_string(%3667, %3668) : (!llvm.ptr, i64) -> i64
      %3670 = func.call @cc_intern(%3666, %3669) : (i64, i64) -> i64
      %3671 = func.call @cc_nil_value() : () -> i64
      %3672 = func.call @cc_cons(%3670, %3671) : (i64, i64) -> i64
      %3673 = func.call @cc_values_pack(%3672) : (i64) -> i64
      %3674 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3675 = arith.constant 5 : i64
      %3676 = func.call @cc_make_string(%3674, %3675) : (!llvm.ptr, i64) -> i64
      %3677 = func.call @cc_nil_value() : () -> i64
      %3678 = func.call @cc_intern(%3676, %3677) : (i64, i64) -> i64
      %3679 = func.call @cc_nil_value() : () -> i64
      %3680 = func.call @cc_cons(%3678, %3679) : (i64, i64) -> i64
      %3681 = func.call @cc_values_pack(%3680) : (i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3682 = arith.addi %3678, %__rlasp_stack_elide_zero_174 : i64
      %3683 = func.call @cc_nil_value() : () -> i64
      %3684 = func.call @cc_errorp(%3360) : (i64) -> i64
      %3685 = arith.cmpi ne, %3684, %3683 : i64
      %3686 = arith.cmpi eq, %3683, %3683 : i64
      %3687 = arith.andi %3685, %3686 : i1
      %3688 = scf.if %3687 -> (i64) {
        scf.yield %3360 : i64
      } else {
        scf.yield %3683 : i64
      }
      %3689 = func.call @cc_errorp(%3516) : (i64) -> i64
      %3690 = arith.cmpi ne, %3689, %3683 : i64
      %3691 = arith.cmpi eq, %3688, %3683 : i64
      %3692 = arith.andi %3690, %3691 : i1
      %3693 = scf.if %3692 -> (i64) {
        scf.yield %3516 : i64
      } else {
        scf.yield %3688 : i64
      }
      %3694 = func.call @cc_errorp(%3638) : (i64) -> i64
      %3695 = arith.cmpi ne, %3694, %3683 : i64
      %3696 = arith.cmpi eq, %3693, %3683 : i64
      %3697 = arith.andi %3695, %3696 : i1
      %3698 = scf.if %3697 -> (i64) {
        scf.yield %3638 : i64
      } else {
        scf.yield %3693 : i64
      }
      %3699 = func.call @cc_errorp(%3652) : (i64) -> i64
      %3700 = arith.cmpi ne, %3699, %3683 : i64
      %3701 = arith.cmpi eq, %3698, %3683 : i64
      %3702 = arith.andi %3700, %3701 : i1
      %3703 = scf.if %3702 -> (i64) {
        scf.yield %3652 : i64
      } else {
        scf.yield %3698 : i64
      }
      %3704 = func.call @cc_errorp(%3659) : (i64) -> i64
      %3705 = arith.cmpi ne, %3704, %3683 : i64
      %3706 = arith.cmpi eq, %3703, %3683 : i64
      %3707 = arith.andi %3705, %3706 : i1
      %3708 = scf.if %3707 -> (i64) {
        scf.yield %3659 : i64
      } else {
        scf.yield %3703 : i64
      }
      %3709 = func.call @cc_errorp(%3663) : (i64) -> i64
      %3710 = arith.cmpi ne, %3709, %3683 : i64
      %3711 = arith.cmpi eq, %3708, %3683 : i64
      %3712 = arith.andi %3710, %3711 : i1
      %3713 = scf.if %3712 -> (i64) {
        scf.yield %3663 : i64
      } else {
        scf.yield %3708 : i64
      }
      %3714 = func.call @cc_errorp(%3670) : (i64) -> i64
      %3715 = arith.cmpi ne, %3714, %3683 : i64
      %3716 = arith.cmpi eq, %3713, %3683 : i64
      %3717 = arith.andi %3715, %3716 : i1
      %3718 = scf.if %3717 -> (i64) {
        scf.yield %3670 : i64
      } else {
        scf.yield %3713 : i64
      }
      %3719 = func.call @cc_errorp(%3682) : (i64) -> i64
      %3720 = arith.cmpi ne, %3719, %3683 : i64
      %3721 = arith.cmpi eq, %3718, %3683 : i64
      %3722 = arith.andi %3720, %3721 : i1
      %3723 = scf.if %3722 -> (i64) {
        scf.yield %3682 : i64
      } else {
        scf.yield %3718 : i64
      }
      %3724 = arith.cmpi ne, %3723, %3683 : i64
      scf.if %3724 {
        func.call @stack_push_pointer(%3723) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3360) : (i64) -> ()
        func.call @stack_push_pointer(%3516) : (i64) -> ()
        func.call @stack_push_pointer(%3638) : (i64) -> ()
        func.call @stack_push_pointer(%3652) : (i64) -> ()
        func.call @stack_push_pointer(%3659) : (i64) -> ()
        func.call @stack_push_pointer(%3663) : (i64) -> ()
        func.call @stack_push_pointer(%3670) : (i64) -> ()
        func.call @stack_push_pointer(%3682) : (i64) -> ()
        %3725 = llvm.mlir.addressof @str302 : !llvm.ptr
        %3726 = func.call @cc_make_function_ref_const(%3725) : (!llvm.ptr) -> i64
        %3727 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3726, %3727) : (i64, i64) -> ()
      }
      %3728 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3728 : i64
    }
    %3729 = func.call @cc_nil_value() : () -> i64
    %3730 = func.call @cc_errorp(%3351) : (i64) -> i64
    %3731 = arith.cmpi ne, %3730, %3729 : i64
    %3732 = scf.if %3731 -> (i64) {
      scf.yield %3351 : i64
    } else {
      %3733 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3734 = arith.constant 12 : i64
      %3735 = func.call @cc_make_string(%3733, %3734) : (!llvm.ptr, i64) -> i64
      %3736 = func.call @cc_nil_value() : () -> i64
      %3737 = func.call @cc_intern(%3735, %3736) : (i64, i64) -> i64
      %3738 = func.call @cc_nil_value() : () -> i64
      %3739 = func.call @cc_cons(%3737, %3738) : (i64, i64) -> i64
      %3740 = func.call @cc_values_pack(%3739) : (i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3741 = arith.addi %3737, %__rlasp_stack_elide_zero_175 : i64
      %3742 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3743 = arith.constant 3 : i64
      %3744 = func.call @cc_make_string(%3742, %3743) : (!llvm.ptr, i64) -> i64
      %3745 = func.call @cc_nil_value() : () -> i64
      %3746 = func.call @cc_intern(%3744, %3745) : (i64, i64) -> i64
      %3747 = func.call @cc_nil_value() : () -> i64
      %3748 = func.call @cc_cons(%3746, %3747) : (i64, i64) -> i64
      %3749 = func.call @cc_values_pack(%3748) : (i64) -> i64
      func.call @stack_push_pointer(%3746) : (i64) -> ()
      %3750 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3751 = arith.constant 3 : i64
      %3752 = func.call @cc_make_string(%3750, %3751) : (!llvm.ptr, i64) -> i64
      %3753 = func.call @cc_nil_value() : () -> i64
      %3754 = func.call @cc_intern(%3752, %3753) : (i64, i64) -> i64
      %3755 = func.call @cc_nil_value() : () -> i64
      %3756 = func.call @cc_cons(%3754, %3755) : (i64, i64) -> i64
      %3757 = func.call @cc_values_pack(%3756) : (i64) -> i64
      func.call @stack_push_pointer(%3754) : (i64) -> ()
      %3758 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3759 = arith.constant 3 : i64
      %3760 = func.call @cc_make_string(%3758, %3759) : (!llvm.ptr, i64) -> i64
      %3761 = func.call @cc_nil_value() : () -> i64
      %3762 = func.call @cc_intern(%3760, %3761) : (i64, i64) -> i64
      %3763 = func.call @cc_nil_value() : () -> i64
      %3764 = func.call @cc_cons(%3762, %3763) : (i64, i64) -> i64
      %3765 = func.call @cc_values_pack(%3764) : (i64) -> i64
      func.call @stack_push_pointer(%3762) : (i64) -> ()
      %3766 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3767 = arith.constant 5 : i64
      %3768 = func.call @cc_make_string(%3766, %3767) : (!llvm.ptr, i64) -> i64
      %3769 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3770 = arith.constant 11 : i64
      %3771 = func.call @cc_make_string(%3769, %3770) : (!llvm.ptr, i64) -> i64
      %3772 = func.call @cc_intern(%3768, %3771) : (i64, i64) -> i64
      %3773 = func.call @cc_nil_value() : () -> i64
      %3774 = func.call @cc_cons(%3772, %3773) : (i64, i64) -> i64
      %3775 = func.call @cc_values_pack(%3774) : (i64) -> i64
      func.call @stack_push_pointer(%3772) : (i64) -> ()
      %3776 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3777 = arith.constant 12 : i64
      %3778 = func.call @cc_make_string(%3776, %3777) : (!llvm.ptr, i64) -> i64
      %3779 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3780 = arith.constant 11 : i64
      %3781 = func.call @cc_make_string(%3779, %3780) : (!llvm.ptr, i64) -> i64
      %3782 = func.call @cc_intern(%3778, %3781) : (i64, i64) -> i64
      %3783 = func.call @cc_nil_value() : () -> i64
      %3784 = func.call @cc_cons(%3782, %3783) : (i64, i64) -> i64
      %3785 = func.call @cc_values_pack(%3784) : (i64) -> i64
      func.call @stack_push_pointer(%3782) : (i64) -> ()
      %3786 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3787 = arith.constant 4 : i64
      %3788 = func.call @cc_make_string(%3786, %3787) : (!llvm.ptr, i64) -> i64
      %3789 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3790 = arith.constant 11 : i64
      %3791 = func.call @cc_make_string(%3789, %3790) : (!llvm.ptr, i64) -> i64
      %3792 = func.call @cc_intern(%3788, %3791) : (i64, i64) -> i64
      %3793 = func.call @cc_nil_value() : () -> i64
      %3794 = func.call @cc_cons(%3792, %3793) : (i64, i64) -> i64
      %3795 = func.call @cc_values_pack(%3794) : (i64) -> i64
      func.call @stack_push_pointer(%3792) : (i64) -> ()
      %3796 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3797 = arith.constant 10 : i64
      %3798 = func.call @cc_make_string(%3796, %3797) : (!llvm.ptr, i64) -> i64
      %3799 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3800 = arith.constant 11 : i64
      %3801 = func.call @cc_make_string(%3799, %3800) : (!llvm.ptr, i64) -> i64
      %3802 = func.call @cc_intern(%3798, %3801) : (i64, i64) -> i64
      %3803 = func.call @cc_nil_value() : () -> i64
      %3804 = func.call @cc_cons(%3802, %3803) : (i64, i64) -> i64
      %3805 = func.call @cc_values_pack(%3804) : (i64) -> i64
      func.call @stack_push_pointer(%3802) : (i64) -> ()
      %3806 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3806) : (i64) -> ()
      %3807 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3808 = func.call @stack_pop_pointer() : () -> i64
      %3809 = func.call @stack_pop_pointer() : () -> i64
      %3810 = func.call @cc_cons(%3809, %3808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3811 = arith.addi %3810, %__rlasp_stack_elide_zero_176 : i64
      %3812 = func.call @stack_pop_pointer() : () -> i64
      %3813 = func.call @cc_cons(%3811, %3812) : (i64, i64) -> i64
      %3814 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3815 = arith.constant 5 : i64
      %3816 = func.call @cc_make_string(%3814, %3815) : (!llvm.ptr, i64) -> i64
      %3817 = func.call @cc_nil_value() : () -> i64
      %3818 = func.call @cc_intern(%3816, %3817) : (i64, i64) -> i64
      %3819 = func.call @cc_nil_value() : () -> i64
      %3820 = func.call @cc_cons(%3818, %3819) : (i64, i64) -> i64
      %3821 = func.call @cc_values_pack(%3820) : (i64) -> i64
      %3822 = func.call @cc_cons(%3818, %3813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3822) : (i64) -> ()
      %3823 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3824 = arith.constant 12 : i64
      %3825 = func.call @cc_make_string(%3823, %3824) : (!llvm.ptr, i64) -> i64
      %3826 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3827 = arith.constant 7 : i64
      %3828 = func.call @cc_make_string(%3826, %3827) : (!llvm.ptr, i64) -> i64
      %3829 = func.call @cc_intern(%3825, %3828) : (i64, i64) -> i64
      %3830 = func.call @cc_nil_value() : () -> i64
      %3831 = func.call @cc_cons(%3829, %3830) : (i64, i64) -> i64
      %3832 = func.call @cc_values_pack(%3831) : (i64) -> i64
      func.call @stack_push_pointer(%3829) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3833 = func.call @stack_pop_pointer() : () -> i64
      %3834 = func.call @stack_pop_pointer() : () -> i64
      %3835 = func.call @cc_cons(%3834, %3833) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3836 = arith.addi %3835, %__rlasp_stack_elide_zero_177 : i64
      %3837 = func.call @stack_pop_pointer() : () -> i64
      %3838 = func.call @cc_cons(%3837, %3836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3839 = arith.addi %3838, %__rlasp_stack_elide_zero_178 : i64
      %3840 = func.call @stack_pop_pointer() : () -> i64
      %3841 = func.call @cc_cons(%3840, %3839) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3842 = arith.addi %3841, %__rlasp_stack_elide_zero_179 : i64
      %3843 = func.call @stack_pop_pointer() : () -> i64
      %3844 = func.call @cc_cons(%3843, %3842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3844) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3845 = func.call @stack_pop_pointer() : () -> i64
      %3846 = func.call @stack_pop_pointer() : () -> i64
      %3847 = func.call @cc_cons(%3846, %3845) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3848 = arith.addi %3847, %__rlasp_stack_elide_zero_180 : i64
      %3849 = func.call @stack_pop_pointer() : () -> i64
      %3850 = func.call @cc_cons(%3849, %3848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3850) : (i64) -> ()
      %3851 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3852 = arith.constant 5 : i64
      %3853 = func.call @cc_make_string(%3851, %3852) : (!llvm.ptr, i64) -> i64
      %3854 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3855 = arith.constant 11 : i64
      %3856 = func.call @cc_make_string(%3854, %3855) : (!llvm.ptr, i64) -> i64
      %3857 = func.call @cc_intern(%3853, %3856) : (i64, i64) -> i64
      %3858 = func.call @cc_nil_value() : () -> i64
      %3859 = func.call @cc_cons(%3857, %3858) : (i64, i64) -> i64
      %3860 = func.call @cc_values_pack(%3859) : (i64) -> i64
      func.call @stack_push_pointer(%3857) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3861 = func.call @stack_pop_pointer() : () -> i64
      %3862 = func.call @stack_pop_pointer() : () -> i64
      %3863 = func.call @cc_cons(%3862, %3861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3864 = arith.addi %3863, %__rlasp_stack_elide_zero_181 : i64
      %3865 = func.call @stack_pop_pointer() : () -> i64
      %3866 = func.call @cc_cons(%3865, %3864) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3867 = arith.addi %3866, %__rlasp_stack_elide_zero_182 : i64
      %3868 = func.call @stack_pop_pointer() : () -> i64
      %3869 = func.call @cc_cons(%3868, %3867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3869) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3870 = func.call @stack_pop_pointer() : () -> i64
      %3871 = func.call @stack_pop_pointer() : () -> i64
      %3872 = func.call @cc_cons(%3871, %3870) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3873 = arith.addi %3872, %__rlasp_stack_elide_zero_183 : i64
      %3874 = func.call @stack_pop_pointer() : () -> i64
      %3875 = func.call @cc_cons(%3874, %3873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3876 = arith.addi %3875, %__rlasp_stack_elide_zero_184 : i64
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @cc_cons(%3877, %3876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3878) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3879 = func.call @stack_pop_pointer() : () -> i64
      %3880 = func.call @stack_pop_pointer() : () -> i64
      %3881 = func.call @cc_cons(%3880, %3879) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3882 = arith.addi %3881, %__rlasp_stack_elide_zero_185 : i64
      %3883 = func.call @stack_pop_pointer() : () -> i64
      %3884 = func.call @cc_cons(%3883, %3882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3884) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3885 = func.call @stack_pop_pointer() : () -> i64
      %3886 = func.call @stack_pop_pointer() : () -> i64
      %3887 = func.call @cc_cons(%3886, %3885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3887) : (i64) -> ()
      %3888 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3889 = arith.constant 2 : i64
      %3890 = func.call @cc_make_string(%3888, %3889) : (!llvm.ptr, i64) -> i64
      %3891 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3892 = arith.constant 11 : i64
      %3893 = func.call @cc_make_string(%3891, %3892) : (!llvm.ptr, i64) -> i64
      %3894 = func.call @cc_intern(%3890, %3893) : (i64, i64) -> i64
      %3895 = func.call @cc_nil_value() : () -> i64
      %3896 = func.call @cc_cons(%3894, %3895) : (i64, i64) -> i64
      %3897 = func.call @cc_values_pack(%3896) : (i64) -> i64
      func.call @stack_push_pointer(%3894) : (i64) -> ()
      %3898 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3899 = arith.constant 4 : i64
      %3900 = func.call @cc_make_string(%3898, %3899) : (!llvm.ptr, i64) -> i64
      %3901 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3902 = arith.constant 11 : i64
      %3903 = func.call @cc_make_string(%3901, %3902) : (!llvm.ptr, i64) -> i64
      %3904 = func.call @cc_intern(%3900, %3903) : (i64, i64) -> i64
      %3905 = func.call @cc_nil_value() : () -> i64
      %3906 = func.call @cc_cons(%3904, %3905) : (i64, i64) -> i64
      %3907 = func.call @cc_values_pack(%3906) : (i64) -> i64
      func.call @stack_push_pointer(%3904) : (i64) -> ()
      %3908 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3909 = arith.constant 5 : i64
      %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
      %3911 = llvm.mlir.addressof @str325 : !llvm.ptr
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
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3921 = arith.addi %3920, %__rlasp_stack_elide_zero_186 : i64
      %3922 = func.call @stack_pop_pointer() : () -> i64
      %3923 = func.call @cc_cons(%3922, %3921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3923) : (i64) -> ()
      %3924 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3925 = arith.constant 6 : i64
      %3926 = func.call @cc_make_string(%3924, %3925) : (!llvm.ptr, i64) -> i64
      %3927 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3928 = arith.constant 11 : i64
      %3929 = func.call @cc_make_string(%3927, %3928) : (!llvm.ptr, i64) -> i64
      %3930 = func.call @cc_intern(%3926, %3929) : (i64, i64) -> i64
      %3931 = func.call @cc_nil_value() : () -> i64
      %3932 = func.call @cc_cons(%3930, %3931) : (i64, i64) -> i64
      %3933 = func.call @cc_values_pack(%3932) : (i64) -> i64
      func.call @stack_push_pointer(%3930) : (i64) -> ()
      %3934 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3935 = arith.constant 5 : i64
      %3936 = func.call @cc_make_string(%3934, %3935) : (!llvm.ptr, i64) -> i64
      %3937 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3938 = arith.constant 11 : i64
      %3939 = func.call @cc_make_string(%3937, %3938) : (!llvm.ptr, i64) -> i64
      %3940 = func.call @cc_intern(%3936, %3939) : (i64, i64) -> i64
      %3941 = func.call @cc_nil_value() : () -> i64
      %3942 = func.call @cc_cons(%3940, %3941) : (i64, i64) -> i64
      %3943 = func.call @cc_values_pack(%3942) : (i64) -> i64
      func.call @stack_push_pointer(%3940) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3944 = func.call @stack_pop_pointer() : () -> i64
      %3945 = func.call @stack_pop_pointer() : () -> i64
      %3946 = func.call @cc_cons(%3945, %3944) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3947 = arith.addi %3946, %__rlasp_stack_elide_zero_187 : i64
      %3948 = func.call @stack_pop_pointer() : () -> i64
      %3949 = func.call @cc_cons(%3948, %3947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3950 = func.call @stack_pop_pointer() : () -> i64
      %3951 = func.call @stack_pop_pointer() : () -> i64
      %3952 = func.call @cc_cons(%3951, %3950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3953 = arith.addi %3952, %__rlasp_stack_elide_zero_188 : i64
      %3954 = func.call @stack_pop_pointer() : () -> i64
      %3955 = func.call @cc_cons(%3954, %3953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3956 = arith.addi %3955, %__rlasp_stack_elide_zero_189 : i64
      %3957 = func.call @stack_pop_pointer() : () -> i64
      %3958 = func.call @cc_cons(%3957, %3956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3958) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3959 = func.call @stack_pop_pointer() : () -> i64
      %3960 = func.call @stack_pop_pointer() : () -> i64
      %3961 = func.call @cc_cons(%3960, %3959) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3962 = arith.addi %3961, %__rlasp_stack_elide_zero_190 : i64
      %3963 = func.call @stack_pop_pointer() : () -> i64
      %3964 = func.call @cc_cons(%3963, %3962) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3965 = arith.addi %3964, %__rlasp_stack_elide_zero_191 : i64
      %3966 = func.call @stack_pop_pointer() : () -> i64
      %3967 = func.call @cc_cons(%3966, %3965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3968 = func.call @stack_pop_pointer() : () -> i64
      %3969 = func.call @stack_pop_pointer() : () -> i64
      %3970 = func.call @cc_cons(%3969, %3968) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3971 = arith.addi %3970, %__rlasp_stack_elide_zero_192 : i64
      %3972 = func.call @stack_pop_pointer() : () -> i64
      %3973 = func.call @cc_cons(%3972, %3971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3974 = func.call @stack_pop_pointer() : () -> i64
      %3975 = func.call @stack_pop_pointer() : () -> i64
      %3976 = func.call @cc_cons(%3975, %3974) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3977 = arith.addi %3976, %__rlasp_stack_elide_zero_193 : i64
      %3978 = func.call @stack_pop_pointer() : () -> i64
      %3979 = func.call @cc_cons(%3978, %3977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3980 = arith.addi %3979, %__rlasp_stack_elide_zero_194 : i64
      %4085 = arith.constant 15079495958542 : i64
      %4086 = arith.constant 0 : i64
      %4087 = func.call @cc_make_closure(%4085, %4086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4088 = arith.addi %4087, %__rlasp_stack_elide_zero_195 : i64
      %4089 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4090 = arith.constant 1 : i64
      %4091 = func.call @cc_make_string(%4089, %4090) : (!llvm.ptr, i64) -> i64
      %4092 = func.call @cc_nil_value() : () -> i64
      %4093 = func.call @cc_intern(%4091, %4092) : (i64, i64) -> i64
      %4094 = func.call @cc_nil_value() : () -> i64
      %4095 = func.call @cc_cons(%4093, %4094) : (i64, i64) -> i64
      %4096 = func.call @cc_values_pack(%4095) : (i64) -> i64
      func.call @stack_push_pointer(%4093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4097 = func.call @stack_pop_pointer() : () -> i64
      %4098 = func.call @stack_pop_pointer() : () -> i64
      %4099 = func.call @cc_cons(%4098, %4097) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %4100 = arith.addi %4099, %__rlasp_stack_elide_zero_196 : i64
      %4101 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4102 = arith.constant 11 : i64
      %4103 = func.call @cc_make_string(%4101, %4102) : (!llvm.ptr, i64) -> i64
      %4104 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4105 = arith.constant 7 : i64
      %4106 = func.call @cc_make_string(%4104, %4105) : (!llvm.ptr, i64) -> i64
      %4107 = func.call @cc_intern(%4103, %4106) : (i64, i64) -> i64
      %4108 = func.call @cc_nil_value() : () -> i64
      %4109 = func.call @cc_cons(%4107, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_values_pack(%4109) : (i64) -> i64
      %4111 = func.call @cc_nil_value() : () -> i64
      %4112 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4113 = arith.constant 4 : i64
      %4114 = func.call @cc_make_string(%4112, %4113) : (!llvm.ptr, i64) -> i64
      %4115 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4116 = arith.constant 7 : i64
      %4117 = func.call @cc_make_string(%4115, %4116) : (!llvm.ptr, i64) -> i64
      %4118 = func.call @cc_intern(%4114, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_cons(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_values_pack(%4120) : (i64) -> i64
      %4122 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4123 = arith.constant 6 : i64
      %4124 = func.call @cc_make_string(%4122, %4123) : (!llvm.ptr, i64) -> i64
      %4125 = func.call @cc_nil_value() : () -> i64
      %4126 = func.call @cc_intern(%4124, %4125) : (i64, i64) -> i64
      %4127 = func.call @cc_nil_value() : () -> i64
      %4128 = func.call @cc_cons(%4126, %4127) : (i64, i64) -> i64
      %4129 = func.call @cc_values_pack(%4128) : (i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %4130 = arith.addi %4126, %__rlasp_stack_elide_zero_197 : i64
      %4131 = func.call @cc_nil_value() : () -> i64
      %4132 = func.call @cc_errorp(%3741) : (i64) -> i64
      %4133 = arith.cmpi ne, %4132, %4131 : i64
      %4134 = arith.cmpi eq, %4131, %4131 : i64
      %4135 = arith.andi %4133, %4134 : i1
      %4136 = scf.if %4135 -> (i64) {
        scf.yield %3741 : i64
      } else {
        scf.yield %4131 : i64
      }
      %4137 = func.call @cc_errorp(%3980) : (i64) -> i64
      %4138 = arith.cmpi ne, %4137, %4131 : i64
      %4139 = arith.cmpi eq, %4136, %4131 : i64
      %4140 = arith.andi %4138, %4139 : i1
      %4141 = scf.if %4140 -> (i64) {
        scf.yield %3980 : i64
      } else {
        scf.yield %4136 : i64
      }
      %4142 = func.call @cc_errorp(%4088) : (i64) -> i64
      %4143 = arith.cmpi ne, %4142, %4131 : i64
      %4144 = arith.cmpi eq, %4141, %4131 : i64
      %4145 = arith.andi %4143, %4144 : i1
      %4146 = scf.if %4145 -> (i64) {
        scf.yield %4088 : i64
      } else {
        scf.yield %4141 : i64
      }
      %4147 = func.call @cc_errorp(%4100) : (i64) -> i64
      %4148 = arith.cmpi ne, %4147, %4131 : i64
      %4149 = arith.cmpi eq, %4146, %4131 : i64
      %4150 = arith.andi %4148, %4149 : i1
      %4151 = scf.if %4150 -> (i64) {
        scf.yield %4100 : i64
      } else {
        scf.yield %4146 : i64
      }
      %4152 = func.call @cc_errorp(%4107) : (i64) -> i64
      %4153 = arith.cmpi ne, %4152, %4131 : i64
      %4154 = arith.cmpi eq, %4151, %4131 : i64
      %4155 = arith.andi %4153, %4154 : i1
      %4156 = scf.if %4155 -> (i64) {
        scf.yield %4107 : i64
      } else {
        scf.yield %4151 : i64
      }
      %4157 = func.call @cc_errorp(%4111) : (i64) -> i64
      %4158 = arith.cmpi ne, %4157, %4131 : i64
      %4159 = arith.cmpi eq, %4156, %4131 : i64
      %4160 = arith.andi %4158, %4159 : i1
      %4161 = scf.if %4160 -> (i64) {
        scf.yield %4111 : i64
      } else {
        scf.yield %4156 : i64
      }
      %4162 = func.call @cc_errorp(%4118) : (i64) -> i64
      %4163 = arith.cmpi ne, %4162, %4131 : i64
      %4164 = arith.cmpi eq, %4161, %4131 : i64
      %4165 = arith.andi %4163, %4164 : i1
      %4166 = scf.if %4165 -> (i64) {
        scf.yield %4118 : i64
      } else {
        scf.yield %4161 : i64
      }
      %4167 = func.call @cc_errorp(%4130) : (i64) -> i64
      %4168 = arith.cmpi ne, %4167, %4131 : i64
      %4169 = arith.cmpi eq, %4166, %4131 : i64
      %4170 = arith.andi %4168, %4169 : i1
      %4171 = scf.if %4170 -> (i64) {
        scf.yield %4130 : i64
      } else {
        scf.yield %4166 : i64
      }
      %4172 = arith.cmpi ne, %4171, %4131 : i64
      scf.if %4172 {
        func.call @stack_push_pointer(%4171) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3741) : (i64) -> ()
        func.call @stack_push_pointer(%3980) : (i64) -> ()
        func.call @stack_push_pointer(%4088) : (i64) -> ()
        func.call @stack_push_pointer(%4100) : (i64) -> ()
        func.call @stack_push_pointer(%4107) : (i64) -> ()
        func.call @stack_push_pointer(%4111) : (i64) -> ()
        func.call @stack_push_pointer(%4118) : (i64) -> ()
        func.call @stack_push_pointer(%4130) : (i64) -> ()
        %4173 = llvm.mlir.addressof @str341 : !llvm.ptr
        %4174 = func.call @cc_make_function_ref_const(%4173) : (!llvm.ptr) -> i64
        %4175 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4174, %4175) : (i64, i64) -> ()
      }
      %4176 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4176 : i64
    }
    %4177 = func.call @cc_nil_value() : () -> i64
    %4178 = func.call @cc_errorp(%3732) : (i64) -> i64
    %4179 = arith.cmpi ne, %4178, %4177 : i64
    %4180 = scf.if %4179 -> (i64) {
      scf.yield %3732 : i64
    } else {
      %4181 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4182 = arith.constant 12 : i64
      %4183 = func.call @cc_make_string(%4181, %4182) : (!llvm.ptr, i64) -> i64
      %4184 = func.call @cc_nil_value() : () -> i64
      %4185 = func.call @cc_intern(%4183, %4184) : (i64, i64) -> i64
      %4186 = func.call @cc_nil_value() : () -> i64
      %4187 = func.call @cc_cons(%4185, %4186) : (i64, i64) -> i64
      %4188 = func.call @cc_values_pack(%4187) : (i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4189 = arith.addi %4185, %__rlasp_stack_elide_zero_198 : i64
      %4190 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4191 = arith.constant 3 : i64
      %4192 = func.call @cc_make_string(%4190, %4191) : (!llvm.ptr, i64) -> i64
      %4193 = func.call @cc_nil_value() : () -> i64
      %4194 = func.call @cc_intern(%4192, %4193) : (i64, i64) -> i64
      %4195 = func.call @cc_nil_value() : () -> i64
      %4196 = func.call @cc_cons(%4194, %4195) : (i64, i64) -> i64
      %4197 = func.call @cc_values_pack(%4196) : (i64) -> i64
      func.call @stack_push_pointer(%4194) : (i64) -> ()
      %4198 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4199 = arith.constant 13 : i64
      %4200 = func.call @cc_make_string(%4198, %4199) : (!llvm.ptr, i64) -> i64
      %4201 = func.call @cc_nil_value() : () -> i64
      %4202 = func.call @cc_intern(%4200, %4201) : (i64, i64) -> i64
      %4203 = func.call @cc_nil_value() : () -> i64
      %4204 = func.call @cc_cons(%4202, %4203) : (i64, i64) -> i64
      %4205 = func.call @cc_values_pack(%4204) : (i64) -> i64
      func.call @stack_push_pointer(%4202) : (i64) -> ()
      %4206 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4207 = arith.constant 10 : i64
      %4208 = func.call @cc_make_string(%4206, %4207) : (!llvm.ptr, i64) -> i64
      %4209 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4210 = arith.constant 11 : i64
      %4211 = func.call @cc_make_string(%4209, %4210) : (!llvm.ptr, i64) -> i64
      %4212 = func.call @cc_intern(%4208, %4211) : (i64, i64) -> i64
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_values_pack(%4214) : (i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4216 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4216) : (i64) -> ()
      %4217 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4217) : (i64) -> ()
      %4218 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4218) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4219 = func.call @stack_pop_pointer() : () -> i64
      %4220 = func.call @stack_pop_pointer() : () -> i64
      %4221 = func.call @cc_cons(%4220, %4219) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4222 = arith.addi %4221, %__rlasp_stack_elide_zero_199 : i64
      %4223 = func.call @stack_pop_pointer() : () -> i64
      %4224 = func.call @cc_cons(%4223, %4222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4225 = arith.addi %4224, %__rlasp_stack_elide_zero_200 : i64
      %4226 = func.call @stack_pop_pointer() : () -> i64
      %4227 = func.call @cc_cons(%4225, %4226) : (i64, i64) -> i64
      %4228 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4229 = arith.constant 5 : i64
      %4230 = func.call @cc_make_string(%4228, %4229) : (!llvm.ptr, i64) -> i64
      %4231 = func.call @cc_nil_value() : () -> i64
      %4232 = func.call @cc_intern(%4230, %4231) : (i64, i64) -> i64
      %4233 = func.call @cc_nil_value() : () -> i64
      %4234 = func.call @cc_cons(%4232, %4233) : (i64, i64) -> i64
      %4235 = func.call @cc_values_pack(%4234) : (i64) -> i64
      %4236 = func.call @cc_cons(%4232, %4227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4236) : (i64) -> ()
      %4237 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4238 = arith.constant 15 : i64
      %4239 = func.call @cc_make_string(%4237, %4238) : (!llvm.ptr, i64) -> i64
      %4240 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4241 = arith.constant 7 : i64
      %4242 = func.call @cc_make_string(%4240, %4241) : (!llvm.ptr, i64) -> i64
      %4243 = func.call @cc_intern(%4239, %4242) : (i64, i64) -> i64
      %4244 = func.call @cc_nil_value() : () -> i64
      %4245 = func.call @cc_cons(%4243, %4244) : (i64, i64) -> i64
      %4246 = func.call @cc_values_pack(%4245) : (i64) -> i64
      func.call @stack_push_pointer(%4243) : (i64) -> ()
      %4247 = arith.constant 97 : i64
      %4248 = func.call @cc_box_character(%4247) : (i64) -> i64
      func.call @stack_push_pointer(%4248) : (i64) -> ()
      %4249 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4250 = arith.constant 12 : i64
      %4251 = func.call @cc_make_string(%4249, %4250) : (!llvm.ptr, i64) -> i64
      %4252 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4253 = arith.constant 7 : i64
      %4254 = func.call @cc_make_string(%4252, %4253) : (!llvm.ptr, i64) -> i64
      %4255 = func.call @cc_intern(%4251, %4254) : (i64, i64) -> i64
      %4256 = func.call @cc_nil_value() : () -> i64
      %4257 = func.call @cc_cons(%4255, %4256) : (i64, i64) -> i64
      %4258 = func.call @cc_values_pack(%4257) : (i64) -> i64
      func.call @stack_push_pointer(%4255) : (i64) -> ()
      %4259 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4259) : (i64) -> ()
      %4260 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4261 = arith.constant 9 : i64
      %4262 = func.call @cc_make_string(%4260, %4261) : (!llvm.ptr, i64) -> i64
      %4263 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4264 = arith.constant 11 : i64
      %4265 = func.call @cc_make_string(%4263, %4264) : (!llvm.ptr, i64) -> i64
      %4266 = func.call @cc_intern(%4262, %4265) : (i64, i64) -> i64
      %4267 = func.call @cc_nil_value() : () -> i64
      %4268 = func.call @cc_cons(%4266, %4267) : (i64, i64) -> i64
      %4269 = func.call @cc_values_pack(%4268) : (i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4270 = arith.addi %4266, %__rlasp_stack_elide_zero_201 : i64
      %4271 = func.call @stack_pop_pointer() : () -> i64
      %4272 = func.call @cc_cons(%4270, %4271) : (i64, i64) -> i64
      %4273 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4274 = arith.constant 5 : i64
      %4275 = func.call @cc_make_string(%4273, %4274) : (!llvm.ptr, i64) -> i64
      %4276 = func.call @cc_nil_value() : () -> i64
      %4277 = func.call @cc_intern(%4275, %4276) : (i64, i64) -> i64
      %4278 = func.call @cc_nil_value() : () -> i64
      %4279 = func.call @cc_cons(%4277, %4278) : (i64, i64) -> i64
      %4280 = func.call @cc_values_pack(%4279) : (i64) -> i64
      %4281 = func.call @cc_cons(%4277, %4272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4282 = func.call @stack_pop_pointer() : () -> i64
      %4283 = func.call @stack_pop_pointer() : () -> i64
      %4284 = func.call @cc_cons(%4283, %4282) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4285 = arith.addi %4284, %__rlasp_stack_elide_zero_202 : i64
      %4286 = func.call @stack_pop_pointer() : () -> i64
      %4287 = func.call @cc_cons(%4286, %4285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4288 = arith.addi %4287, %__rlasp_stack_elide_zero_203 : i64
      %4289 = func.call @stack_pop_pointer() : () -> i64
      %4290 = func.call @cc_cons(%4289, %4288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4291 = arith.addi %4290, %__rlasp_stack_elide_zero_204 : i64
      %4292 = func.call @stack_pop_pointer() : () -> i64
      %4293 = func.call @cc_cons(%4292, %4291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4294 = arith.addi %4293, %__rlasp_stack_elide_zero_205 : i64
      %4295 = func.call @stack_pop_pointer() : () -> i64
      %4296 = func.call @cc_cons(%4295, %4294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4297 = arith.addi %4296, %__rlasp_stack_elide_zero_206 : i64
      %4298 = func.call @stack_pop_pointer() : () -> i64
      %4299 = func.call @cc_cons(%4298, %4297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4300 = func.call @stack_pop_pointer() : () -> i64
      %4301 = func.call @stack_pop_pointer() : () -> i64
      %4302 = func.call @cc_cons(%4301, %4300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4303 = arith.addi %4302, %__rlasp_stack_elide_zero_207 : i64
      %4304 = func.call @stack_pop_pointer() : () -> i64
      %4305 = func.call @cc_cons(%4304, %4303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4306 = func.call @stack_pop_pointer() : () -> i64
      %4307 = func.call @stack_pop_pointer() : () -> i64
      %4308 = func.call @cc_cons(%4307, %4306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4308) : (i64) -> ()
      %4309 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4310 = arith.constant 4 : i64
      %4311 = func.call @cc_make_string(%4309, %4310) : (!llvm.ptr, i64) -> i64
      %4312 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4313 = arith.constant 11 : i64
      %4314 = func.call @cc_make_string(%4312, %4313) : (!llvm.ptr, i64) -> i64
      %4315 = func.call @cc_intern(%4311, %4314) : (i64, i64) -> i64
      %4316 = func.call @cc_nil_value() : () -> i64
      %4317 = func.call @cc_cons(%4315, %4316) : (i64, i64) -> i64
      %4318 = func.call @cc_values_pack(%4317) : (i64) -> i64
      func.call @stack_push_pointer(%4315) : (i64) -> ()
      %4319 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4320 = arith.constant 13 : i64
      %4321 = func.call @cc_make_string(%4319, %4320) : (!llvm.ptr, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_intern(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_nil_value() : () -> i64
      %4325 = func.call @cc_cons(%4323, %4324) : (i64, i64) -> i64
      %4326 = func.call @cc_values_pack(%4325) : (i64) -> i64
      func.call @stack_push_pointer(%4323) : (i64) -> ()
      %4327 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4327) : (i64) -> ()
      %4328 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4329 = func.call @stack_pop_pointer() : () -> i64
      %4330 = func.call @stack_pop_pointer() : () -> i64
      %4331 = func.call @cc_cons(%4330, %4329) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4332 = arith.addi %4331, %__rlasp_stack_elide_zero_208 : i64
      %4333 = func.call @stack_pop_pointer() : () -> i64
      %4334 = func.call @cc_cons(%4333, %4332) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4335 = arith.addi %4334, %__rlasp_stack_elide_zero_209 : i64
      %4336 = func.call @stack_pop_pointer() : () -> i64
      %4337 = func.call @cc_cons(%4336, %4335) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4338 = arith.addi %4337, %__rlasp_stack_elide_zero_210 : i64
      %4339 = func.call @stack_pop_pointer() : () -> i64
      %4340 = func.call @cc_cons(%4339, %4338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4340) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @stack_pop_pointer() : () -> i64
      %4343 = func.call @cc_cons(%4342, %4341) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4344 = arith.addi %4343, %__rlasp_stack_elide_zero_211 : i64
      %4345 = func.call @stack_pop_pointer() : () -> i64
      %4346 = func.call @cc_cons(%4345, %4344) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4347 = arith.addi %4346, %__rlasp_stack_elide_zero_212 : i64
      %4348 = func.call @stack_pop_pointer() : () -> i64
      %4349 = func.call @cc_cons(%4348, %4347) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4350 = arith.addi %4349, %__rlasp_stack_elide_zero_213 : i64
      %4460 = arith.constant 15079495958543 : i64
      %4461 = arith.constant 0 : i64
      %4462 = func.call @cc_make_closure(%4460, %4461) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4463 = arith.addi %4462, %__rlasp_stack_elide_zero_214 : i64
      %4464 = arith.constant 97 : i64
      %4465 = func.call @cc_box_character(%4464) : (i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4466 = func.call @stack_pop_pointer() : () -> i64
      %4467 = func.call @stack_pop_pointer() : () -> i64
      %4468 = func.call @cc_cons(%4467, %4466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4469 = arith.addi %4468, %__rlasp_stack_elide_zero_215 : i64
      %4470 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4471 = arith.constant 11 : i64
      %4472 = func.call @cc_make_string(%4470, %4471) : (!llvm.ptr, i64) -> i64
      %4473 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4474 = arith.constant 7 : i64
      %4475 = func.call @cc_make_string(%4473, %4474) : (!llvm.ptr, i64) -> i64
      %4476 = func.call @cc_intern(%4472, %4475) : (i64, i64) -> i64
      %4477 = func.call @cc_nil_value() : () -> i64
      %4478 = func.call @cc_cons(%4476, %4477) : (i64, i64) -> i64
      %4479 = func.call @cc_values_pack(%4478) : (i64) -> i64
      %4480 = func.call @cc_nil_value() : () -> i64
      %4481 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4482 = arith.constant 4 : i64
      %4483 = func.call @cc_make_string(%4481, %4482) : (!llvm.ptr, i64) -> i64
      %4484 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4485 = arith.constant 7 : i64
      %4486 = func.call @cc_make_string(%4484, %4485) : (!llvm.ptr, i64) -> i64
      %4487 = func.call @cc_intern(%4483, %4486) : (i64, i64) -> i64
      %4488 = func.call @cc_nil_value() : () -> i64
      %4489 = func.call @cc_cons(%4487, %4488) : (i64, i64) -> i64
      %4490 = func.call @cc_values_pack(%4489) : (i64) -> i64
      %4491 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4492 = arith.constant 6 : i64
      %4493 = func.call @cc_make_string(%4491, %4492) : (!llvm.ptr, i64) -> i64
      %4494 = func.call @cc_nil_value() : () -> i64
      %4495 = func.call @cc_intern(%4493, %4494) : (i64, i64) -> i64
      %4496 = func.call @cc_nil_value() : () -> i64
      %4497 = func.call @cc_cons(%4495, %4496) : (i64, i64) -> i64
      %4498 = func.call @cc_values_pack(%4497) : (i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4499 = arith.addi %4495, %__rlasp_stack_elide_zero_216 : i64
      %4500 = func.call @cc_nil_value() : () -> i64
      %4501 = func.call @cc_errorp(%4189) : (i64) -> i64
      %4502 = arith.cmpi ne, %4501, %4500 : i64
      %4503 = arith.cmpi eq, %4500, %4500 : i64
      %4504 = arith.andi %4502, %4503 : i1
      %4505 = scf.if %4504 -> (i64) {
        scf.yield %4189 : i64
      } else {
        scf.yield %4500 : i64
      }
      %4506 = func.call @cc_errorp(%4350) : (i64) -> i64
      %4507 = arith.cmpi ne, %4506, %4500 : i64
      %4508 = arith.cmpi eq, %4505, %4500 : i64
      %4509 = arith.andi %4507, %4508 : i1
      %4510 = scf.if %4509 -> (i64) {
        scf.yield %4350 : i64
      } else {
        scf.yield %4505 : i64
      }
      %4511 = func.call @cc_errorp(%4463) : (i64) -> i64
      %4512 = arith.cmpi ne, %4511, %4500 : i64
      %4513 = arith.cmpi eq, %4510, %4500 : i64
      %4514 = arith.andi %4512, %4513 : i1
      %4515 = scf.if %4514 -> (i64) {
        scf.yield %4463 : i64
      } else {
        scf.yield %4510 : i64
      }
      %4516 = func.call @cc_errorp(%4469) : (i64) -> i64
      %4517 = arith.cmpi ne, %4516, %4500 : i64
      %4518 = arith.cmpi eq, %4515, %4500 : i64
      %4519 = arith.andi %4517, %4518 : i1
      %4520 = scf.if %4519 -> (i64) {
        scf.yield %4469 : i64
      } else {
        scf.yield %4515 : i64
      }
      %4521 = func.call @cc_errorp(%4476) : (i64) -> i64
      %4522 = arith.cmpi ne, %4521, %4500 : i64
      %4523 = arith.cmpi eq, %4520, %4500 : i64
      %4524 = arith.andi %4522, %4523 : i1
      %4525 = scf.if %4524 -> (i64) {
        scf.yield %4476 : i64
      } else {
        scf.yield %4520 : i64
      }
      %4526 = func.call @cc_errorp(%4480) : (i64) -> i64
      %4527 = arith.cmpi ne, %4526, %4500 : i64
      %4528 = arith.cmpi eq, %4525, %4500 : i64
      %4529 = arith.andi %4527, %4528 : i1
      %4530 = scf.if %4529 -> (i64) {
        scf.yield %4480 : i64
      } else {
        scf.yield %4525 : i64
      }
      %4531 = func.call @cc_errorp(%4487) : (i64) -> i64
      %4532 = arith.cmpi ne, %4531, %4500 : i64
      %4533 = arith.cmpi eq, %4530, %4500 : i64
      %4534 = arith.andi %4532, %4533 : i1
      %4535 = scf.if %4534 -> (i64) {
        scf.yield %4487 : i64
      } else {
        scf.yield %4530 : i64
      }
      %4536 = func.call @cc_errorp(%4499) : (i64) -> i64
      %4537 = arith.cmpi ne, %4536, %4500 : i64
      %4538 = arith.cmpi eq, %4535, %4500 : i64
      %4539 = arith.andi %4537, %4538 : i1
      %4540 = scf.if %4539 -> (i64) {
        scf.yield %4499 : i64
      } else {
        scf.yield %4535 : i64
      }
      %4541 = arith.cmpi ne, %4540, %4500 : i64
      scf.if %4541 {
        func.call @stack_push_pointer(%4540) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4189) : (i64) -> ()
        func.call @stack_push_pointer(%4350) : (i64) -> ()
        func.call @stack_push_pointer(%4463) : (i64) -> ()
        func.call @stack_push_pointer(%4469) : (i64) -> ()
        func.call @stack_push_pointer(%4476) : (i64) -> ()
        func.call @stack_push_pointer(%4480) : (i64) -> ()
        func.call @stack_push_pointer(%4487) : (i64) -> ()
        func.call @stack_push_pointer(%4499) : (i64) -> ()
        %4542 = llvm.mlir.addressof @str371 : !llvm.ptr
        %4543 = func.call @cc_make_function_ref_const(%4542) : (!llvm.ptr) -> i64
        %4544 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4543, %4544) : (i64, i64) -> ()
      }
      %4545 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4545 : i64
    }
    %4546 = func.call @cc_nil_value() : () -> i64
    %4547 = func.call @cc_errorp(%4180) : (i64) -> i64
    %4548 = arith.cmpi ne, %4547, %4546 : i64
    %4549 = scf.if %4548 -> (i64) {
      scf.yield %4180 : i64
    } else {
      %4550 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4551 = arith.constant 12 : i64
      %4552 = func.call @cc_make_string(%4550, %4551) : (!llvm.ptr, i64) -> i64
      %4553 = func.call @cc_nil_value() : () -> i64
      %4554 = func.call @cc_intern(%4552, %4553) : (i64, i64) -> i64
      %4555 = func.call @cc_nil_value() : () -> i64
      %4556 = func.call @cc_cons(%4554, %4555) : (i64, i64) -> i64
      %4557 = func.call @cc_values_pack(%4556) : (i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4558 = arith.addi %4554, %__rlasp_stack_elide_zero_217 : i64
      %4559 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4560 = arith.constant 3 : i64
      %4561 = func.call @cc_make_string(%4559, %4560) : (!llvm.ptr, i64) -> i64
      %4562 = func.call @cc_nil_value() : () -> i64
      %4563 = func.call @cc_intern(%4561, %4562) : (i64, i64) -> i64
      %4564 = func.call @cc_nil_value() : () -> i64
      %4565 = func.call @cc_cons(%4563, %4564) : (i64, i64) -> i64
      %4566 = func.call @cc_values_pack(%4565) : (i64) -> i64
      func.call @stack_push_pointer(%4563) : (i64) -> ()
      %4567 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4568 = arith.constant 13 : i64
      %4569 = func.call @cc_make_string(%4567, %4568) : (!llvm.ptr, i64) -> i64
      %4570 = func.call @cc_nil_value() : () -> i64
      %4571 = func.call @cc_intern(%4569, %4570) : (i64, i64) -> i64
      %4572 = func.call @cc_nil_value() : () -> i64
      %4573 = func.call @cc_cons(%4571, %4572) : (i64, i64) -> i64
      %4574 = func.call @cc_values_pack(%4573) : (i64) -> i64
      func.call @stack_push_pointer(%4571) : (i64) -> ()
      %4575 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4576 = arith.constant 10 : i64
      %4577 = func.call @cc_make_string(%4575, %4576) : (!llvm.ptr, i64) -> i64
      %4578 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4579 = arith.constant 11 : i64
      %4580 = func.call @cc_make_string(%4578, %4579) : (!llvm.ptr, i64) -> i64
      %4581 = func.call @cc_intern(%4577, %4580) : (i64, i64) -> i64
      %4582 = func.call @cc_nil_value() : () -> i64
      %4583 = func.call @cc_cons(%4581, %4582) : (i64, i64) -> i64
      %4584 = func.call @cc_values_pack(%4583) : (i64) -> i64
      func.call @stack_push_pointer(%4581) : (i64) -> ()
      %4585 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4585) : (i64) -> ()
      %4586 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4586) : (i64) -> ()
      %4587 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4588 = func.call @stack_pop_pointer() : () -> i64
      %4589 = func.call @stack_pop_pointer() : () -> i64
      %4590 = func.call @cc_cons(%4589, %4588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4591 = arith.addi %4590, %__rlasp_stack_elide_zero_218 : i64
      %4592 = func.call @stack_pop_pointer() : () -> i64
      %4593 = func.call @cc_cons(%4592, %4591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4594 = arith.addi %4593, %__rlasp_stack_elide_zero_219 : i64
      %4595 = func.call @stack_pop_pointer() : () -> i64
      %4596 = func.call @cc_cons(%4594, %4595) : (i64, i64) -> i64
      %4597 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4598 = arith.constant 5 : i64
      %4599 = func.call @cc_make_string(%4597, %4598) : (!llvm.ptr, i64) -> i64
      %4600 = func.call @cc_nil_value() : () -> i64
      %4601 = func.call @cc_intern(%4599, %4600) : (i64, i64) -> i64
      %4602 = func.call @cc_nil_value() : () -> i64
      %4603 = func.call @cc_cons(%4601, %4602) : (i64, i64) -> i64
      %4604 = func.call @cc_values_pack(%4603) : (i64) -> i64
      %4605 = func.call @cc_cons(%4601, %4596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4605) : (i64) -> ()
      %4606 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4607 = arith.constant 15 : i64
      %4608 = func.call @cc_make_string(%4606, %4607) : (!llvm.ptr, i64) -> i64
      %4609 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4610 = arith.constant 7 : i64
      %4611 = func.call @cc_make_string(%4609, %4610) : (!llvm.ptr, i64) -> i64
      %4612 = func.call @cc_intern(%4608, %4611) : (i64, i64) -> i64
      %4613 = func.call @cc_nil_value() : () -> i64
      %4614 = func.call @cc_cons(%4612, %4613) : (i64, i64) -> i64
      %4615 = func.call @cc_values_pack(%4614) : (i64) -> i64
      func.call @stack_push_pointer(%4612) : (i64) -> ()
      %4616 = arith.constant 97 : i64
      %4617 = func.call @cc_box_character(%4616) : (i64) -> i64
      func.call @stack_push_pointer(%4617) : (i64) -> ()
      %4618 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4619 = arith.constant 12 : i64
      %4620 = func.call @cc_make_string(%4618, %4619) : (!llvm.ptr, i64) -> i64
      %4621 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4622 = arith.constant 7 : i64
      %4623 = func.call @cc_make_string(%4621, %4622) : (!llvm.ptr, i64) -> i64
      %4624 = func.call @cc_intern(%4620, %4623) : (i64, i64) -> i64
      %4625 = func.call @cc_nil_value() : () -> i64
      %4626 = func.call @cc_cons(%4624, %4625) : (i64, i64) -> i64
      %4627 = func.call @cc_values_pack(%4626) : (i64) -> i64
      func.call @stack_push_pointer(%4624) : (i64) -> ()
      %4628 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4628) : (i64) -> ()
      %4629 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4630 = arith.constant 9 : i64
      %4631 = func.call @cc_make_string(%4629, %4630) : (!llvm.ptr, i64) -> i64
      %4632 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4633 = arith.constant 11 : i64
      %4634 = func.call @cc_make_string(%4632, %4633) : (!llvm.ptr, i64) -> i64
      %4635 = func.call @cc_intern(%4631, %4634) : (i64, i64) -> i64
      %4636 = func.call @cc_nil_value() : () -> i64
      %4637 = func.call @cc_cons(%4635, %4636) : (i64, i64) -> i64
      %4638 = func.call @cc_values_pack(%4637) : (i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4639 = arith.addi %4635, %__rlasp_stack_elide_zero_220 : i64
      %4640 = func.call @stack_pop_pointer() : () -> i64
      %4641 = func.call @cc_cons(%4639, %4640) : (i64, i64) -> i64
      %4642 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4643 = arith.constant 5 : i64
      %4644 = func.call @cc_make_string(%4642, %4643) : (!llvm.ptr, i64) -> i64
      %4645 = func.call @cc_nil_value() : () -> i64
      %4646 = func.call @cc_intern(%4644, %4645) : (i64, i64) -> i64
      %4647 = func.call @cc_nil_value() : () -> i64
      %4648 = func.call @cc_cons(%4646, %4647) : (i64, i64) -> i64
      %4649 = func.call @cc_values_pack(%4648) : (i64) -> i64
      %4650 = func.call @cc_cons(%4646, %4641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4650) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4651 = func.call @stack_pop_pointer() : () -> i64
      %4652 = func.call @stack_pop_pointer() : () -> i64
      %4653 = func.call @cc_cons(%4652, %4651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4654 = arith.addi %4653, %__rlasp_stack_elide_zero_221 : i64
      %4655 = func.call @stack_pop_pointer() : () -> i64
      %4656 = func.call @cc_cons(%4655, %4654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4657 = arith.addi %4656, %__rlasp_stack_elide_zero_222 : i64
      %4658 = func.call @stack_pop_pointer() : () -> i64
      %4659 = func.call @cc_cons(%4658, %4657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4660 = arith.addi %4659, %__rlasp_stack_elide_zero_223 : i64
      %4661 = func.call @stack_pop_pointer() : () -> i64
      %4662 = func.call @cc_cons(%4661, %4660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4663 = arith.addi %4662, %__rlasp_stack_elide_zero_224 : i64
      %4664 = func.call @stack_pop_pointer() : () -> i64
      %4665 = func.call @cc_cons(%4664, %4663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4666 = arith.addi %4665, %__rlasp_stack_elide_zero_225 : i64
      %4667 = func.call @stack_pop_pointer() : () -> i64
      %4668 = func.call @cc_cons(%4667, %4666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4669 = func.call @stack_pop_pointer() : () -> i64
      %4670 = func.call @stack_pop_pointer() : () -> i64
      %4671 = func.call @cc_cons(%4670, %4669) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4672 = arith.addi %4671, %__rlasp_stack_elide_zero_226 : i64
      %4673 = func.call @stack_pop_pointer() : () -> i64
      %4674 = func.call @cc_cons(%4673, %4672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4675 = func.call @stack_pop_pointer() : () -> i64
      %4676 = func.call @stack_pop_pointer() : () -> i64
      %4677 = func.call @cc_cons(%4676, %4675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4677) : (i64) -> ()
      %4678 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4679 = arith.constant 4 : i64
      %4680 = func.call @cc_make_string(%4678, %4679) : (!llvm.ptr, i64) -> i64
      %4681 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4682 = arith.constant 11 : i64
      %4683 = func.call @cc_make_string(%4681, %4682) : (!llvm.ptr, i64) -> i64
      %4684 = func.call @cc_intern(%4680, %4683) : (i64, i64) -> i64
      %4685 = func.call @cc_nil_value() : () -> i64
      %4686 = func.call @cc_cons(%4684, %4685) : (i64, i64) -> i64
      %4687 = func.call @cc_values_pack(%4686) : (i64) -> i64
      func.call @stack_push_pointer(%4684) : (i64) -> ()
      %4688 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4689 = arith.constant 13 : i64
      %4690 = func.call @cc_make_string(%4688, %4689) : (!llvm.ptr, i64) -> i64
      %4691 = func.call @cc_nil_value() : () -> i64
      %4692 = func.call @cc_intern(%4690, %4691) : (i64, i64) -> i64
      %4693 = func.call @cc_nil_value() : () -> i64
      %4694 = func.call @cc_cons(%4692, %4693) : (i64, i64) -> i64
      %4695 = func.call @cc_values_pack(%4694) : (i64) -> i64
      func.call @stack_push_pointer(%4692) : (i64) -> ()
      %4696 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4696) : (i64) -> ()
      %4697 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4697) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4698 = func.call @stack_pop_pointer() : () -> i64
      %4699 = func.call @stack_pop_pointer() : () -> i64
      %4700 = func.call @cc_cons(%4699, %4698) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4701 = arith.addi %4700, %__rlasp_stack_elide_zero_227 : i64
      %4702 = func.call @stack_pop_pointer() : () -> i64
      %4703 = func.call @cc_cons(%4702, %4701) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4704 = arith.addi %4703, %__rlasp_stack_elide_zero_228 : i64
      %4705 = func.call @stack_pop_pointer() : () -> i64
      %4706 = func.call @cc_cons(%4705, %4704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %4707 = arith.addi %4706, %__rlasp_stack_elide_zero_229 : i64
      %4708 = func.call @stack_pop_pointer() : () -> i64
      %4709 = func.call @cc_cons(%4708, %4707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4710 = func.call @stack_pop_pointer() : () -> i64
      %4711 = func.call @stack_pop_pointer() : () -> i64
      %4712 = func.call @cc_cons(%4711, %4710) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %4713 = arith.addi %4712, %__rlasp_stack_elide_zero_230 : i64
      %4714 = func.call @stack_pop_pointer() : () -> i64
      %4715 = func.call @cc_cons(%4714, %4713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %4716 = arith.addi %4715, %__rlasp_stack_elide_zero_231 : i64
      %4717 = func.call @stack_pop_pointer() : () -> i64
      %4718 = func.call @cc_cons(%4717, %4716) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %4719 = arith.addi %4718, %__rlasp_stack_elide_zero_232 : i64
      %4829 = arith.constant 15079495958544 : i64
      %4830 = arith.constant 0 : i64
      %4831 = func.call @cc_make_closure(%4829, %4830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %4832 = arith.addi %4831, %__rlasp_stack_elide_zero_233 : i64
      %4833 = arith.constant 97 : i64
      %4834 = func.call @cc_box_character(%4833) : (i64) -> i64
      func.call @stack_push_pointer(%4834) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4835 = func.call @stack_pop_pointer() : () -> i64
      %4836 = func.call @stack_pop_pointer() : () -> i64
      %4837 = func.call @cc_cons(%4836, %4835) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %4838 = arith.addi %4837, %__rlasp_stack_elide_zero_234 : i64
      %4839 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4840 = arith.constant 11 : i64
      %4841 = func.call @cc_make_string(%4839, %4840) : (!llvm.ptr, i64) -> i64
      %4842 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4843 = arith.constant 7 : i64
      %4844 = func.call @cc_make_string(%4842, %4843) : (!llvm.ptr, i64) -> i64
      %4845 = func.call @cc_intern(%4841, %4844) : (i64, i64) -> i64
      %4846 = func.call @cc_nil_value() : () -> i64
      %4847 = func.call @cc_cons(%4845, %4846) : (i64, i64) -> i64
      %4848 = func.call @cc_values_pack(%4847) : (i64) -> i64
      %4849 = func.call @cc_nil_value() : () -> i64
      %4850 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4851 = arith.constant 4 : i64
      %4852 = func.call @cc_make_string(%4850, %4851) : (!llvm.ptr, i64) -> i64
      %4853 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4854 = arith.constant 7 : i64
      %4855 = func.call @cc_make_string(%4853, %4854) : (!llvm.ptr, i64) -> i64
      %4856 = func.call @cc_intern(%4852, %4855) : (i64, i64) -> i64
      %4857 = func.call @cc_nil_value() : () -> i64
      %4858 = func.call @cc_cons(%4856, %4857) : (i64, i64) -> i64
      %4859 = func.call @cc_values_pack(%4858) : (i64) -> i64
      %4860 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4861 = arith.constant 6 : i64
      %4862 = func.call @cc_make_string(%4860, %4861) : (!llvm.ptr, i64) -> i64
      %4863 = func.call @cc_nil_value() : () -> i64
      %4864 = func.call @cc_intern(%4862, %4863) : (i64, i64) -> i64
      %4865 = func.call @cc_nil_value() : () -> i64
      %4866 = func.call @cc_cons(%4864, %4865) : (i64, i64) -> i64
      %4867 = func.call @cc_values_pack(%4866) : (i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %4868 = arith.addi %4864, %__rlasp_stack_elide_zero_235 : i64
      %4869 = func.call @cc_nil_value() : () -> i64
      %4870 = func.call @cc_errorp(%4558) : (i64) -> i64
      %4871 = arith.cmpi ne, %4870, %4869 : i64
      %4872 = arith.cmpi eq, %4869, %4869 : i64
      %4873 = arith.andi %4871, %4872 : i1
      %4874 = scf.if %4873 -> (i64) {
        scf.yield %4558 : i64
      } else {
        scf.yield %4869 : i64
      }
      %4875 = func.call @cc_errorp(%4719) : (i64) -> i64
      %4876 = arith.cmpi ne, %4875, %4869 : i64
      %4877 = arith.cmpi eq, %4874, %4869 : i64
      %4878 = arith.andi %4876, %4877 : i1
      %4879 = scf.if %4878 -> (i64) {
        scf.yield %4719 : i64
      } else {
        scf.yield %4874 : i64
      }
      %4880 = func.call @cc_errorp(%4832) : (i64) -> i64
      %4881 = arith.cmpi ne, %4880, %4869 : i64
      %4882 = arith.cmpi eq, %4879, %4869 : i64
      %4883 = arith.andi %4881, %4882 : i1
      %4884 = scf.if %4883 -> (i64) {
        scf.yield %4832 : i64
      } else {
        scf.yield %4879 : i64
      }
      %4885 = func.call @cc_errorp(%4838) : (i64) -> i64
      %4886 = arith.cmpi ne, %4885, %4869 : i64
      %4887 = arith.cmpi eq, %4884, %4869 : i64
      %4888 = arith.andi %4886, %4887 : i1
      %4889 = scf.if %4888 -> (i64) {
        scf.yield %4838 : i64
      } else {
        scf.yield %4884 : i64
      }
      %4890 = func.call @cc_errorp(%4845) : (i64) -> i64
      %4891 = arith.cmpi ne, %4890, %4869 : i64
      %4892 = arith.cmpi eq, %4889, %4869 : i64
      %4893 = arith.andi %4891, %4892 : i1
      %4894 = scf.if %4893 -> (i64) {
        scf.yield %4845 : i64
      } else {
        scf.yield %4889 : i64
      }
      %4895 = func.call @cc_errorp(%4849) : (i64) -> i64
      %4896 = arith.cmpi ne, %4895, %4869 : i64
      %4897 = arith.cmpi eq, %4894, %4869 : i64
      %4898 = arith.andi %4896, %4897 : i1
      %4899 = scf.if %4898 -> (i64) {
        scf.yield %4849 : i64
      } else {
        scf.yield %4894 : i64
      }
      %4900 = func.call @cc_errorp(%4856) : (i64) -> i64
      %4901 = arith.cmpi ne, %4900, %4869 : i64
      %4902 = arith.cmpi eq, %4899, %4869 : i64
      %4903 = arith.andi %4901, %4902 : i1
      %4904 = scf.if %4903 -> (i64) {
        scf.yield %4856 : i64
      } else {
        scf.yield %4899 : i64
      }
      %4905 = func.call @cc_errorp(%4868) : (i64) -> i64
      %4906 = arith.cmpi ne, %4905, %4869 : i64
      %4907 = arith.cmpi eq, %4904, %4869 : i64
      %4908 = arith.andi %4906, %4907 : i1
      %4909 = scf.if %4908 -> (i64) {
        scf.yield %4868 : i64
      } else {
        scf.yield %4904 : i64
      }
      %4910 = arith.cmpi ne, %4909, %4869 : i64
      scf.if %4910 {
        func.call @stack_push_pointer(%4909) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4558) : (i64) -> ()
        func.call @stack_push_pointer(%4719) : (i64) -> ()
        func.call @stack_push_pointer(%4832) : (i64) -> ()
        func.call @stack_push_pointer(%4838) : (i64) -> ()
        func.call @stack_push_pointer(%4845) : (i64) -> ()
        func.call @stack_push_pointer(%4849) : (i64) -> ()
        func.call @stack_push_pointer(%4856) : (i64) -> ()
        func.call @stack_push_pointer(%4868) : (i64) -> ()
        %4911 = llvm.mlir.addressof @str401 : !llvm.ptr
        %4912 = func.call @cc_make_function_ref_const(%4911) : (!llvm.ptr) -> i64
        %4913 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4912, %4913) : (i64, i64) -> ()
      }
      %4914 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4914 : i64
    }
    %4915 = func.call @cc_nil_value() : () -> i64
    %4916 = func.call @cc_errorp(%4549) : (i64) -> i64
    %4917 = arith.cmpi ne, %4916, %4915 : i64
    %4918 = scf.if %4917 -> (i64) {
      scf.yield %4549 : i64
    } else {
      %4919 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4920 = arith.constant 12 : i64
      %4921 = func.call @cc_make_string(%4919, %4920) : (!llvm.ptr, i64) -> i64
      %4922 = func.call @cc_nil_value() : () -> i64
      %4923 = func.call @cc_intern(%4921, %4922) : (i64, i64) -> i64
      %4924 = func.call @cc_nil_value() : () -> i64
      %4925 = func.call @cc_cons(%4923, %4924) : (i64, i64) -> i64
      %4926 = func.call @cc_values_pack(%4925) : (i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %4927 = arith.addi %4923, %__rlasp_stack_elide_zero_236 : i64
      %4928 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4929 = arith.constant 13 : i64
      %4930 = func.call @cc_make_string(%4928, %4929) : (!llvm.ptr, i64) -> i64
      %4931 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4932 = arith.constant 11 : i64
      %4933 = func.call @cc_make_string(%4931, %4932) : (!llvm.ptr, i64) -> i64
      %4934 = func.call @cc_intern(%4930, %4933) : (i64, i64) -> i64
      %4935 = func.call @cc_nil_value() : () -> i64
      %4936 = func.call @cc_cons(%4934, %4935) : (i64, i64) -> i64
      %4937 = func.call @cc_values_pack(%4936) : (i64) -> i64
      func.call @stack_push_pointer(%4934) : (i64) -> ()
      %4938 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4939 = arith.constant 6 : i64
      %4940 = func.call @cc_make_string(%4938, %4939) : (!llvm.ptr, i64) -> i64
      %4941 = func.call @cc_nil_value() : () -> i64
      %4942 = func.call @cc_intern(%4940, %4941) : (i64, i64) -> i64
      %4943 = func.call @cc_nil_value() : () -> i64
      %4944 = func.call @cc_cons(%4942, %4943) : (i64, i64) -> i64
      %4945 = func.call @cc_values_pack(%4944) : (i64) -> i64
      func.call @stack_push_pointer(%4942) : (i64) -> ()
      %4946 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4947 = arith.constant 19 : i64
      %4948 = func.call @cc_make_string(%4946, %4947) : (!llvm.ptr, i64) -> i64
      %4949 = func.call @cc_nil_value() : () -> i64
      %4950 = func.call @cc_intern(%4948, %4949) : (i64, i64) -> i64
      %4951 = func.call @cc_nil_value() : () -> i64
      %4952 = func.call @cc_cons(%4950, %4951) : (i64, i64) -> i64
      %4953 = func.call @cc_values_pack(%4952) : (i64) -> i64
      func.call @stack_push_pointer(%4950) : (i64) -> ()
      %4954 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4955 = arith.constant 10 : i64
      %4956 = func.call @cc_make_string(%4954, %4955) : (!llvm.ptr, i64) -> i64
      %4957 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4958 = arith.constant 11 : i64
      %4959 = func.call @cc_make_string(%4957, %4958) : (!llvm.ptr, i64) -> i64
      %4960 = func.call @cc_intern(%4956, %4959) : (i64, i64) -> i64
      %4961 = func.call @cc_nil_value() : () -> i64
      %4962 = func.call @cc_cons(%4960, %4961) : (i64, i64) -> i64
      %4963 = func.call @cc_values_pack(%4962) : (i64) -> i64
      func.call @stack_push_pointer(%4960) : (i64) -> ()
      %4964 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%4964) : (i64) -> ()
      %4965 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4966 = arith.constant 12 : i64
      %4967 = func.call @cc_make_string(%4965, %4966) : (!llvm.ptr, i64) -> i64
      %4968 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4969 = arith.constant 7 : i64
      %4970 = func.call @cc_make_string(%4968, %4969) : (!llvm.ptr, i64) -> i64
      %4971 = func.call @cc_intern(%4967, %4970) : (i64, i64) -> i64
      %4972 = func.call @cc_nil_value() : () -> i64
      %4973 = func.call @cc_cons(%4971, %4972) : (i64, i64) -> i64
      %4974 = func.call @cc_values_pack(%4973) : (i64) -> i64
      func.call @stack_push_pointer(%4971) : (i64) -> ()
      %4975 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4976 = arith.constant 18 : i64
      %4977 = func.call @cc_make_string(%4975, %4976) : (!llvm.ptr, i64) -> i64
      %4978 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4979 = arith.constant 11 : i64
      %4980 = func.call @cc_make_string(%4978, %4979) : (!llvm.ptr, i64) -> i64
      %4981 = func.call @cc_intern(%4977, %4980) : (i64, i64) -> i64
      %4982 = func.call @cc_nil_value() : () -> i64
      %4983 = func.call @cc_cons(%4981, %4982) : (i64, i64) -> i64
      %4984 = func.call @cc_values_pack(%4983) : (i64) -> i64
      func.call @stack_push_pointer(%4981) : (i64) -> ()
      %4985 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4986 = arith.constant 0 : i64
      %4987 = func.call @cc_make_string(%4985, %4986) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4987) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4988 = func.call @stack_pop_pointer() : () -> i64
      %4989 = func.call @stack_pop_pointer() : () -> i64
      %4990 = func.call @cc_cons(%4989, %4988) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %4991 = arith.addi %4990, %__rlasp_stack_elide_zero_237 : i64
      %4992 = func.call @stack_pop_pointer() : () -> i64
      %4993 = func.call @cc_cons(%4992, %4991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4993) : (i64) -> ()
      %4994 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4995 = arith.constant 22 : i64
      %4996 = func.call @cc_make_string(%4994, %4995) : (!llvm.ptr, i64) -> i64
      %4997 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4998 = arith.constant 7 : i64
      %4999 = func.call @cc_make_string(%4997, %4998) : (!llvm.ptr, i64) -> i64
      %5000 = func.call @cc_intern(%4996, %4999) : (i64, i64) -> i64
      %5001 = func.call @cc_nil_value() : () -> i64
      %5002 = func.call @cc_cons(%5000, %5001) : (i64, i64) -> i64
      %5003 = func.call @cc_values_pack(%5002) : (i64) -> i64
      func.call @stack_push_pointer(%5000) : (i64) -> ()
      %5004 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%5004) : (i64) -> ()
      %5005 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5006 = arith.constant 12 : i64
      %5007 = func.call @cc_make_string(%5005, %5006) : (!llvm.ptr, i64) -> i64
      %5008 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5009 = arith.constant 7 : i64
      %5010 = func.call @cc_make_string(%5008, %5009) : (!llvm.ptr, i64) -> i64
      %5011 = func.call @cc_intern(%5007, %5010) : (i64, i64) -> i64
      %5012 = func.call @cc_nil_value() : () -> i64
      %5013 = func.call @cc_cons(%5011, %5012) : (i64, i64) -> i64
      %5014 = func.call @cc_values_pack(%5013) : (i64) -> i64
      func.call @stack_push_pointer(%5011) : (i64) -> ()
      %5015 = llvm.mlir.addressof @str418 : !llvm.ptr
      %5016 = arith.constant 0 : i64
      %5017 = func.call @cc_make_string(%5015, %5016) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5017) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5018 = func.call @stack_pop_pointer() : () -> i64
      %5019 = func.call @stack_pop_pointer() : () -> i64
      %5020 = func.call @cc_cons(%5019, %5018) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %5021 = arith.addi %5020, %__rlasp_stack_elide_zero_238 : i64
      %5022 = func.call @stack_pop_pointer() : () -> i64
      %5023 = func.call @cc_cons(%5022, %5021) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %5024 = arith.addi %5023, %__rlasp_stack_elide_zero_239 : i64
      %5025 = func.call @stack_pop_pointer() : () -> i64
      %5026 = func.call @cc_cons(%5025, %5024) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %5027 = arith.addi %5026, %__rlasp_stack_elide_zero_240 : i64
      %5028 = func.call @stack_pop_pointer() : () -> i64
      %5029 = func.call @cc_cons(%5028, %5027) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %5030 = arith.addi %5029, %__rlasp_stack_elide_zero_241 : i64
      %5031 = func.call @stack_pop_pointer() : () -> i64
      %5032 = func.call @cc_cons(%5031, %5030) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %5033 = arith.addi %5032, %__rlasp_stack_elide_zero_242 : i64
      %5034 = func.call @stack_pop_pointer() : () -> i64
      %5035 = func.call @cc_cons(%5034, %5033) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %5036 = arith.addi %5035, %__rlasp_stack_elide_zero_243 : i64
      %5037 = func.call @stack_pop_pointer() : () -> i64
      %5038 = func.call @cc_cons(%5037, %5036) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %5039 = arith.addi %5038, %__rlasp_stack_elide_zero_244 : i64
      %5040 = func.call @stack_pop_pointer() : () -> i64
      %5041 = func.call @cc_cons(%5040, %5039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5041) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5042 = func.call @stack_pop_pointer() : () -> i64
      %5043 = func.call @stack_pop_pointer() : () -> i64
      %5044 = func.call @cc_cons(%5043, %5042) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %5045 = arith.addi %5044, %__rlasp_stack_elide_zero_245 : i64
      %5046 = func.call @stack_pop_pointer() : () -> i64
      %5047 = func.call @cc_cons(%5046, %5045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5047) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5048 = func.call @stack_pop_pointer() : () -> i64
      %5049 = func.call @stack_pop_pointer() : () -> i64
      %5050 = func.call @cc_cons(%5049, %5048) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %5051 = arith.addi %5050, %__rlasp_stack_elide_zero_246 : i64
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @cc_cons(%5052, %5051) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %5054 = arith.addi %5053, %__rlasp_stack_elide_zero_247 : i64
      %5055 = func.call @stack_pop_pointer() : () -> i64
      %5056 = func.call @cc_cons(%5055, %5054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5057 = func.call @stack_pop_pointer() : () -> i64
      %5058 = func.call @stack_pop_pointer() : () -> i64
      %5059 = func.call @cc_cons(%5058, %5057) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %5060 = arith.addi %5059, %__rlasp_stack_elide_zero_248 : i64
      %5061 = func.call @stack_pop_pointer() : () -> i64
      %5062 = func.call @cc_cons(%5061, %5060) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %5063 = arith.addi %5062, %__rlasp_stack_elide_zero_249 : i64
      %5198 = arith.constant 15079495958545 : i64
      %5199 = arith.constant 0 : i64
      %5200 = func.call @cc_make_closure(%5198, %5199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %5201 = arith.addi %5200, %__rlasp_stack_elide_zero_250 : i64
      %5202 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5203 = arith.constant 4 : i64
      %5204 = func.call @cc_make_string(%5202, %5203) : (!llvm.ptr, i64) -> i64
      %5205 = func.call @cc_nil_value() : () -> i64
      %5206 = func.call @cc_intern(%5204, %5205) : (i64, i64) -> i64
      %5207 = func.call @cc_nil_value() : () -> i64
      %5208 = func.call @cc_cons(%5206, %5207) : (i64, i64) -> i64
      %5209 = func.call @cc_values_pack(%5208) : (i64) -> i64
      func.call @stack_push_pointer(%5206) : (i64) -> ()
      %5210 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5211 = arith.constant 12 : i64
      %5212 = func.call @cc_make_string(%5210, %5211) : (!llvm.ptr, i64) -> i64
      %5213 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5214 = arith.constant 11 : i64
      %5215 = func.call @cc_make_string(%5213, %5214) : (!llvm.ptr, i64) -> i64
      %5216 = func.call @cc_intern(%5212, %5215) : (i64, i64) -> i64
      %5217 = func.call @cc_nil_value() : () -> i64
      %5218 = func.call @cc_cons(%5216, %5217) : (i64, i64) -> i64
      %5219 = func.call @cc_values_pack(%5218) : (i64) -> i64
      func.call @stack_push_pointer(%5216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5220 = func.call @stack_pop_pointer() : () -> i64
      %5221 = func.call @stack_pop_pointer() : () -> i64
      %5222 = func.call @cc_cons(%5221, %5220) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %5223 = arith.addi %5222, %__rlasp_stack_elide_zero_251 : i64
      %5224 = func.call @stack_pop_pointer() : () -> i64
      %5225 = func.call @cc_cons(%5224, %5223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %5226 = arith.addi %5225, %__rlasp_stack_elide_zero_252 : i64
      %5227 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5228 = arith.constant 11 : i64
      %5229 = func.call @cc_make_string(%5227, %5228) : (!llvm.ptr, i64) -> i64
      %5230 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5231 = arith.constant 7 : i64
      %5232 = func.call @cc_make_string(%5230, %5231) : (!llvm.ptr, i64) -> i64
      %5233 = func.call @cc_intern(%5229, %5232) : (i64, i64) -> i64
      %5234 = func.call @cc_nil_value() : () -> i64
      %5235 = func.call @cc_cons(%5233, %5234) : (i64, i64) -> i64
      %5236 = func.call @cc_values_pack(%5235) : (i64) -> i64
      %5237 = func.call @cc_nil_value() : () -> i64
      %5238 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5239 = arith.constant 4 : i64
      %5240 = func.call @cc_make_string(%5238, %5239) : (!llvm.ptr, i64) -> i64
      %5241 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5242 = arith.constant 7 : i64
      %5243 = func.call @cc_make_string(%5241, %5242) : (!llvm.ptr, i64) -> i64
      %5244 = func.call @cc_intern(%5240, %5243) : (i64, i64) -> i64
      %5245 = func.call @cc_nil_value() : () -> i64
      %5246 = func.call @cc_cons(%5244, %5245) : (i64, i64) -> i64
      %5247 = func.call @cc_values_pack(%5246) : (i64) -> i64
      %5248 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5249 = arith.constant 5 : i64
      %5250 = func.call @cc_make_string(%5248, %5249) : (!llvm.ptr, i64) -> i64
      %5251 = func.call @cc_nil_value() : () -> i64
      %5252 = func.call @cc_intern(%5250, %5251) : (i64, i64) -> i64
      %5253 = func.call @cc_nil_value() : () -> i64
      %5254 = func.call @cc_cons(%5252, %5253) : (i64, i64) -> i64
      %5255 = func.call @cc_values_pack(%5254) : (i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %5256 = arith.addi %5252, %__rlasp_stack_elide_zero_253 : i64
      %5257 = func.call @cc_nil_value() : () -> i64
      %5258 = func.call @cc_errorp(%4927) : (i64) -> i64
      %5259 = arith.cmpi ne, %5258, %5257 : i64
      %5260 = arith.cmpi eq, %5257, %5257 : i64
      %5261 = arith.andi %5259, %5260 : i1
      %5262 = scf.if %5261 -> (i64) {
        scf.yield %4927 : i64
      } else {
        scf.yield %5257 : i64
      }
      %5263 = func.call @cc_errorp(%5063) : (i64) -> i64
      %5264 = arith.cmpi ne, %5263, %5257 : i64
      %5265 = arith.cmpi eq, %5262, %5257 : i64
      %5266 = arith.andi %5264, %5265 : i1
      %5267 = scf.if %5266 -> (i64) {
        scf.yield %5063 : i64
      } else {
        scf.yield %5262 : i64
      }
      %5268 = func.call @cc_errorp(%5201) : (i64) -> i64
      %5269 = arith.cmpi ne, %5268, %5257 : i64
      %5270 = arith.cmpi eq, %5267, %5257 : i64
      %5271 = arith.andi %5269, %5270 : i1
      %5272 = scf.if %5271 -> (i64) {
        scf.yield %5201 : i64
      } else {
        scf.yield %5267 : i64
      }
      %5273 = func.call @cc_errorp(%5226) : (i64) -> i64
      %5274 = arith.cmpi ne, %5273, %5257 : i64
      %5275 = arith.cmpi eq, %5272, %5257 : i64
      %5276 = arith.andi %5274, %5275 : i1
      %5277 = scf.if %5276 -> (i64) {
        scf.yield %5226 : i64
      } else {
        scf.yield %5272 : i64
      }
      %5278 = func.call @cc_errorp(%5233) : (i64) -> i64
      %5279 = arith.cmpi ne, %5278, %5257 : i64
      %5280 = arith.cmpi eq, %5277, %5257 : i64
      %5281 = arith.andi %5279, %5280 : i1
      %5282 = scf.if %5281 -> (i64) {
        scf.yield %5233 : i64
      } else {
        scf.yield %5277 : i64
      }
      %5283 = func.call @cc_errorp(%5237) : (i64) -> i64
      %5284 = arith.cmpi ne, %5283, %5257 : i64
      %5285 = arith.cmpi eq, %5282, %5257 : i64
      %5286 = arith.andi %5284, %5285 : i1
      %5287 = scf.if %5286 -> (i64) {
        scf.yield %5237 : i64
      } else {
        scf.yield %5282 : i64
      }
      %5288 = func.call @cc_errorp(%5244) : (i64) -> i64
      %5289 = arith.cmpi ne, %5288, %5257 : i64
      %5290 = arith.cmpi eq, %5287, %5257 : i64
      %5291 = arith.andi %5289, %5290 : i1
      %5292 = scf.if %5291 -> (i64) {
        scf.yield %5244 : i64
      } else {
        scf.yield %5287 : i64
      }
      %5293 = func.call @cc_errorp(%5256) : (i64) -> i64
      %5294 = arith.cmpi ne, %5293, %5257 : i64
      %5295 = arith.cmpi eq, %5292, %5257 : i64
      %5296 = arith.andi %5294, %5295 : i1
      %5297 = scf.if %5296 -> (i64) {
        scf.yield %5256 : i64
      } else {
        scf.yield %5292 : i64
      }
      %5298 = arith.cmpi ne, %5297, %5257 : i64
      scf.if %5298 {
        func.call @stack_push_pointer(%5297) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4927) : (i64) -> ()
        func.call @stack_push_pointer(%5063) : (i64) -> ()
        func.call @stack_push_pointer(%5201) : (i64) -> ()
        func.call @stack_push_pointer(%5226) : (i64) -> ()
        func.call @stack_push_pointer(%5233) : (i64) -> ()
        func.call @stack_push_pointer(%5237) : (i64) -> ()
        func.call @stack_push_pointer(%5244) : (i64) -> ()
        func.call @stack_push_pointer(%5256) : (i64) -> ()
        %5299 = llvm.mlir.addressof @str437 : !llvm.ptr
        %5300 = func.call @cc_make_function_ref_const(%5299) : (!llvm.ptr) -> i64
        %5301 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5300, %5301) : (i64, i64) -> ()
      }
      %5302 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5302 : i64
    }
    %5303 = func.call @cc_nil_value() : () -> i64
    %5304 = func.call @cc_errorp(%4918) : (i64) -> i64
    %5305 = arith.cmpi ne, %5304, %5303 : i64
    %5306 = scf.if %5305 -> (i64) {
      scf.yield %4918 : i64
    } else {
      %5307 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5308 = arith.constant 14 : i64
      %5309 = func.call @cc_make_string(%5307, %5308) : (!llvm.ptr, i64) -> i64
      %5310 = func.call @cc_nil_value() : () -> i64
      %5311 = func.call @cc_intern(%5309, %5310) : (i64, i64) -> i64
      %5312 = func.call @cc_nil_value() : () -> i64
      %5313 = func.call @cc_cons(%5311, %5312) : (i64, i64) -> i64
      %5314 = func.call @cc_values_pack(%5313) : (i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %5315 = arith.addi %5311, %__rlasp_stack_elide_zero_254 : i64
      %5316 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5317 = arith.constant 3 : i64
      %5318 = func.call @cc_make_string(%5316, %5317) : (!llvm.ptr, i64) -> i64
      %5319 = func.call @cc_nil_value() : () -> i64
      %5320 = func.call @cc_intern(%5318, %5319) : (i64, i64) -> i64
      %5321 = func.call @cc_nil_value() : () -> i64
      %5322 = func.call @cc_cons(%5320, %5321) : (i64, i64) -> i64
      %5323 = func.call @cc_values_pack(%5322) : (i64) -> i64
      func.call @stack_push_pointer(%5320) : (i64) -> ()
      %5324 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5325 = arith.constant 5 : i64
      %5326 = func.call @cc_make_string(%5324, %5325) : (!llvm.ptr, i64) -> i64
      %5327 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5328 = arith.constant 11 : i64
      %5329 = func.call @cc_make_string(%5327, %5328) : (!llvm.ptr, i64) -> i64
      %5330 = func.call @cc_intern(%5326, %5329) : (i64, i64) -> i64
      %5331 = func.call @cc_nil_value() : () -> i64
      %5332 = func.call @cc_cons(%5330, %5331) : (i64, i64) -> i64
      %5333 = func.call @cc_values_pack(%5332) : (i64) -> i64
      func.call @stack_push_pointer(%5330) : (i64) -> ()
      %5334 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5335 = arith.constant 10 : i64
      %5336 = func.call @cc_make_string(%5334, %5335) : (!llvm.ptr, i64) -> i64
      %5337 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5338 = arith.constant 11 : i64
      %5339 = func.call @cc_make_string(%5337, %5338) : (!llvm.ptr, i64) -> i64
      %5340 = func.call @cc_intern(%5336, %5339) : (i64, i64) -> i64
      %5341 = func.call @cc_nil_value() : () -> i64
      %5342 = func.call @cc_cons(%5340, %5341) : (i64, i64) -> i64
      %5343 = func.call @cc_values_pack(%5342) : (i64) -> i64
      func.call @stack_push_pointer(%5340) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5344 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5345 = arith.constant 15 : i64
      %5346 = func.call @cc_make_string(%5344, %5345) : (!llvm.ptr, i64) -> i64
      %5347 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5348 = arith.constant 7 : i64
      %5349 = func.call @cc_make_string(%5347, %5348) : (!llvm.ptr, i64) -> i64
      %5350 = func.call @cc_intern(%5346, %5349) : (i64, i64) -> i64
      %5351 = func.call @cc_nil_value() : () -> i64
      %5352 = func.call @cc_cons(%5350, %5351) : (i64, i64) -> i64
      %5353 = func.call @cc_values_pack(%5352) : (i64) -> i64
      func.call @stack_push_pointer(%5350) : (i64) -> ()
      %5354 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5354) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5355 = func.call @stack_pop_pointer() : () -> i64
      %5356 = func.call @stack_pop_pointer() : () -> i64
      %5357 = func.call @cc_cons(%5356, %5355) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %5358 = arith.addi %5357, %__rlasp_stack_elide_zero_255 : i64
      %5359 = func.call @stack_pop_pointer() : () -> i64
      %5360 = func.call @cc_cons(%5359, %5358) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %5361 = arith.addi %5360, %__rlasp_stack_elide_zero_256 : i64
      %5362 = func.call @stack_pop_pointer() : () -> i64
      %5363 = func.call @cc_cons(%5362, %5361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %5364 = arith.addi %5363, %__rlasp_stack_elide_zero_257 : i64
      %5365 = func.call @stack_pop_pointer() : () -> i64
      %5366 = func.call @cc_cons(%5365, %5364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5366) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5367 = func.call @stack_pop_pointer() : () -> i64
      %5368 = func.call @stack_pop_pointer() : () -> i64
      %5369 = func.call @cc_cons(%5368, %5367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %5370 = arith.addi %5369, %__rlasp_stack_elide_zero_258 : i64
      %5371 = func.call @stack_pop_pointer() : () -> i64
      %5372 = func.call @cc_cons(%5371, %5370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5372) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5373 = func.call @stack_pop_pointer() : () -> i64
      %5374 = func.call @stack_pop_pointer() : () -> i64
      %5375 = func.call @cc_cons(%5374, %5373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5375) : (i64) -> ()
      %5376 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5377 = arith.constant 4 : i64
      %5378 = func.call @cc_make_string(%5376, %5377) : (!llvm.ptr, i64) -> i64
      %5379 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5380 = arith.constant 11 : i64
      %5381 = func.call @cc_make_string(%5379, %5380) : (!llvm.ptr, i64) -> i64
      %5382 = func.call @cc_intern(%5378, %5381) : (i64, i64) -> i64
      %5383 = func.call @cc_nil_value() : () -> i64
      %5384 = func.call @cc_cons(%5382, %5383) : (i64, i64) -> i64
      %5385 = func.call @cc_values_pack(%5384) : (i64) -> i64
      func.call @stack_push_pointer(%5382) : (i64) -> ()
      %5386 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5387 = arith.constant 5 : i64
      %5388 = func.call @cc_make_string(%5386, %5387) : (!llvm.ptr, i64) -> i64
      %5389 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5390 = arith.constant 11 : i64
      %5391 = func.call @cc_make_string(%5389, %5390) : (!llvm.ptr, i64) -> i64
      %5392 = func.call @cc_intern(%5388, %5391) : (i64, i64) -> i64
      %5393 = func.call @cc_nil_value() : () -> i64
      %5394 = func.call @cc_cons(%5392, %5393) : (i64, i64) -> i64
      %5395 = func.call @cc_values_pack(%5394) : (i64) -> i64
      func.call @stack_push_pointer(%5392) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5396 = func.call @stack_pop_pointer() : () -> i64
      %5397 = func.call @stack_pop_pointer() : () -> i64
      %5398 = func.call @cc_cons(%5397, %5396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %5399 = arith.addi %5398, %__rlasp_stack_elide_zero_259 : i64
      %5400 = func.call @stack_pop_pointer() : () -> i64
      %5401 = func.call @cc_cons(%5400, %5399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5402 = func.call @stack_pop_pointer() : () -> i64
      %5403 = func.call @stack_pop_pointer() : () -> i64
      %5404 = func.call @cc_cons(%5403, %5402) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %5405 = arith.addi %5404, %__rlasp_stack_elide_zero_260 : i64
      %5406 = func.call @stack_pop_pointer() : () -> i64
      %5407 = func.call @cc_cons(%5406, %5405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %5408 = arith.addi %5407, %__rlasp_stack_elide_zero_261 : i64
      %5409 = func.call @stack_pop_pointer() : () -> i64
      %5410 = func.call @cc_cons(%5409, %5408) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %5411 = arith.addi %5410, %__rlasp_stack_elide_zero_262 : i64
      %5468 = arith.constant 15079495958546 : i64
      %5469 = arith.constant 0 : i64
      %5470 = func.call @cc_make_closure(%5468, %5469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %5471 = arith.addi %5470, %__rlasp_stack_elide_zero_263 : i64
      %5472 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5473 = func.call @stack_pop_pointer() : () -> i64
      %5474 = func.call @stack_pop_pointer() : () -> i64
      %5475 = func.call @cc_cons(%5474, %5473) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %5476 = arith.addi %5475, %__rlasp_stack_elide_zero_264 : i64
      %5477 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5478 = arith.constant 11 : i64
      %5479 = func.call @cc_make_string(%5477, %5478) : (!llvm.ptr, i64) -> i64
      %5480 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5481 = arith.constant 7 : i64
      %5482 = func.call @cc_make_string(%5480, %5481) : (!llvm.ptr, i64) -> i64
      %5483 = func.call @cc_intern(%5479, %5482) : (i64, i64) -> i64
      %5484 = func.call @cc_nil_value() : () -> i64
      %5485 = func.call @cc_cons(%5483, %5484) : (i64, i64) -> i64
      %5486 = func.call @cc_values_pack(%5485) : (i64) -> i64
      %5487 = func.call @cc_nil_value() : () -> i64
      %5488 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5489 = arith.constant 4 : i64
      %5490 = func.call @cc_make_string(%5488, %5489) : (!llvm.ptr, i64) -> i64
      %5491 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5492 = arith.constant 7 : i64
      %5493 = func.call @cc_make_string(%5491, %5492) : (!llvm.ptr, i64) -> i64
      %5494 = func.call @cc_intern(%5490, %5493) : (i64, i64) -> i64
      %5495 = func.call @cc_nil_value() : () -> i64
      %5496 = func.call @cc_cons(%5494, %5495) : (i64, i64) -> i64
      %5497 = func.call @cc_values_pack(%5496) : (i64) -> i64
      %5498 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5499 = arith.constant 6 : i64
      %5500 = func.call @cc_make_string(%5498, %5499) : (!llvm.ptr, i64) -> i64
      %5501 = func.call @cc_nil_value() : () -> i64
      %5502 = func.call @cc_intern(%5500, %5501) : (i64, i64) -> i64
      %5503 = func.call @cc_nil_value() : () -> i64
      %5504 = func.call @cc_cons(%5502, %5503) : (i64, i64) -> i64
      %5505 = func.call @cc_values_pack(%5504) : (i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %5506 = arith.addi %5502, %__rlasp_stack_elide_zero_265 : i64
      %5507 = func.call @cc_nil_value() : () -> i64
      %5508 = func.call @cc_errorp(%5315) : (i64) -> i64
      %5509 = arith.cmpi ne, %5508, %5507 : i64
      %5510 = arith.cmpi eq, %5507, %5507 : i64
      %5511 = arith.andi %5509, %5510 : i1
      %5512 = scf.if %5511 -> (i64) {
        scf.yield %5315 : i64
      } else {
        scf.yield %5507 : i64
      }
      %5513 = func.call @cc_errorp(%5411) : (i64) -> i64
      %5514 = arith.cmpi ne, %5513, %5507 : i64
      %5515 = arith.cmpi eq, %5512, %5507 : i64
      %5516 = arith.andi %5514, %5515 : i1
      %5517 = scf.if %5516 -> (i64) {
        scf.yield %5411 : i64
      } else {
        scf.yield %5512 : i64
      }
      %5518 = func.call @cc_errorp(%5471) : (i64) -> i64
      %5519 = arith.cmpi ne, %5518, %5507 : i64
      %5520 = arith.cmpi eq, %5517, %5507 : i64
      %5521 = arith.andi %5519, %5520 : i1
      %5522 = scf.if %5521 -> (i64) {
        scf.yield %5471 : i64
      } else {
        scf.yield %5517 : i64
      }
      %5523 = func.call @cc_errorp(%5476) : (i64) -> i64
      %5524 = arith.cmpi ne, %5523, %5507 : i64
      %5525 = arith.cmpi eq, %5522, %5507 : i64
      %5526 = arith.andi %5524, %5525 : i1
      %5527 = scf.if %5526 -> (i64) {
        scf.yield %5476 : i64
      } else {
        scf.yield %5522 : i64
      }
      %5528 = func.call @cc_errorp(%5483) : (i64) -> i64
      %5529 = arith.cmpi ne, %5528, %5507 : i64
      %5530 = arith.cmpi eq, %5527, %5507 : i64
      %5531 = arith.andi %5529, %5530 : i1
      %5532 = scf.if %5531 -> (i64) {
        scf.yield %5483 : i64
      } else {
        scf.yield %5527 : i64
      }
      %5533 = func.call @cc_errorp(%5487) : (i64) -> i64
      %5534 = arith.cmpi ne, %5533, %5507 : i64
      %5535 = arith.cmpi eq, %5532, %5507 : i64
      %5536 = arith.andi %5534, %5535 : i1
      %5537 = scf.if %5536 -> (i64) {
        scf.yield %5487 : i64
      } else {
        scf.yield %5532 : i64
      }
      %5538 = func.call @cc_errorp(%5494) : (i64) -> i64
      %5539 = arith.cmpi ne, %5538, %5507 : i64
      %5540 = arith.cmpi eq, %5537, %5507 : i64
      %5541 = arith.andi %5539, %5540 : i1
      %5542 = scf.if %5541 -> (i64) {
        scf.yield %5494 : i64
      } else {
        scf.yield %5537 : i64
      }
      %5543 = func.call @cc_errorp(%5506) : (i64) -> i64
      %5544 = arith.cmpi ne, %5543, %5507 : i64
      %5545 = arith.cmpi eq, %5542, %5507 : i64
      %5546 = arith.andi %5544, %5545 : i1
      %5547 = scf.if %5546 -> (i64) {
        scf.yield %5506 : i64
      } else {
        scf.yield %5542 : i64
      }
      %5548 = arith.cmpi ne, %5547, %5507 : i64
      scf.if %5548 {
        func.call @stack_push_pointer(%5547) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5315) : (i64) -> ()
        func.call @stack_push_pointer(%5411) : (i64) -> ()
        func.call @stack_push_pointer(%5471) : (i64) -> ()
        func.call @stack_push_pointer(%5476) : (i64) -> ()
        func.call @stack_push_pointer(%5483) : (i64) -> ()
        func.call @stack_push_pointer(%5487) : (i64) -> ()
        func.call @stack_push_pointer(%5494) : (i64) -> ()
        func.call @stack_push_pointer(%5506) : (i64) -> ()
        %5549 = llvm.mlir.addressof @str459 : !llvm.ptr
        %5550 = func.call @cc_make_function_ref_const(%5549) : (!llvm.ptr) -> i64
        %5551 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5550, %5551) : (i64, i64) -> ()
      }
      %5552 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5552 : i64
    }
    %5553 = func.call @cc_nil_value() : () -> i64
    %5554 = func.call @cc_errorp(%5306) : (i64) -> i64
    %5555 = arith.cmpi ne, %5554, %5553 : i64
    %5556 = scf.if %5555 -> (i64) {
      scf.yield %5306 : i64
    } else {
      %5557 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5558 = arith.constant 19 : i64
      %5559 = func.call @cc_make_string(%5557, %5558) : (!llvm.ptr, i64) -> i64
      %5560 = func.call @cc_nil_value() : () -> i64
      %5561 = func.call @cc_intern(%5559, %5560) : (i64, i64) -> i64
      %5562 = func.call @cc_nil_value() : () -> i64
      %5563 = func.call @cc_cons(%5561, %5562) : (i64, i64) -> i64
      %5564 = func.call @cc_values_pack(%5563) : (i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %5565 = arith.addi %5561, %__rlasp_stack_elide_zero_266 : i64
      %5566 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5567 = arith.constant 3 : i64
      %5568 = func.call @cc_make_string(%5566, %5567) : (!llvm.ptr, i64) -> i64
      %5569 = func.call @cc_nil_value() : () -> i64
      %5570 = func.call @cc_intern(%5568, %5569) : (i64, i64) -> i64
      %5571 = func.call @cc_nil_value() : () -> i64
      %5572 = func.call @cc_cons(%5570, %5571) : (i64, i64) -> i64
      %5573 = func.call @cc_values_pack(%5572) : (i64) -> i64
      func.call @stack_push_pointer(%5570) : (i64) -> ()
      %5574 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5575 = arith.constant 5 : i64
      %5576 = func.call @cc_make_string(%5574, %5575) : (!llvm.ptr, i64) -> i64
      %5577 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5578 = arith.constant 11 : i64
      %5579 = func.call @cc_make_string(%5577, %5578) : (!llvm.ptr, i64) -> i64
      %5580 = func.call @cc_intern(%5576, %5579) : (i64, i64) -> i64
      %5581 = func.call @cc_nil_value() : () -> i64
      %5582 = func.call @cc_cons(%5580, %5581) : (i64, i64) -> i64
      %5583 = func.call @cc_values_pack(%5582) : (i64) -> i64
      func.call @stack_push_pointer(%5580) : (i64) -> ()
      %5584 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5585 = arith.constant 10 : i64
      %5586 = func.call @cc_make_string(%5584, %5585) : (!llvm.ptr, i64) -> i64
      %5587 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5588 = arith.constant 11 : i64
      %5589 = func.call @cc_make_string(%5587, %5588) : (!llvm.ptr, i64) -> i64
      %5590 = func.call @cc_intern(%5586, %5589) : (i64, i64) -> i64
      %5591 = func.call @cc_nil_value() : () -> i64
      %5592 = func.call @cc_cons(%5590, %5591) : (i64, i64) -> i64
      %5593 = func.call @cc_values_pack(%5592) : (i64) -> i64
      func.call @stack_push_pointer(%5590) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5594 = func.call @stack_pop_pointer() : () -> i64
      %5595 = func.call @stack_pop_pointer() : () -> i64
      %5596 = func.call @cc_cons(%5595, %5594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %5597 = arith.addi %5596, %__rlasp_stack_elide_zero_267 : i64
      %5598 = func.call @stack_pop_pointer() : () -> i64
      %5599 = func.call @cc_cons(%5598, %5597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5600 = func.call @stack_pop_pointer() : () -> i64
      %5601 = func.call @stack_pop_pointer() : () -> i64
      %5602 = func.call @cc_cons(%5601, %5600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %5603 = arith.addi %5602, %__rlasp_stack_elide_zero_268 : i64
      %5604 = func.call @stack_pop_pointer() : () -> i64
      %5605 = func.call @cc_cons(%5604, %5603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5605) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5606 = func.call @stack_pop_pointer() : () -> i64
      %5607 = func.call @stack_pop_pointer() : () -> i64
      %5608 = func.call @cc_cons(%5607, %5606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5608) : (i64) -> ()
      %5609 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5610 = arith.constant 4 : i64
      %5611 = func.call @cc_make_string(%5609, %5610) : (!llvm.ptr, i64) -> i64
      %5612 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5613 = arith.constant 11 : i64
      %5614 = func.call @cc_make_string(%5612, %5613) : (!llvm.ptr, i64) -> i64
      %5615 = func.call @cc_intern(%5611, %5614) : (i64, i64) -> i64
      %5616 = func.call @cc_nil_value() : () -> i64
      %5617 = func.call @cc_cons(%5615, %5616) : (i64, i64) -> i64
      %5618 = func.call @cc_values_pack(%5617) : (i64) -> i64
      func.call @stack_push_pointer(%5615) : (i64) -> ()
      %5619 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5620 = arith.constant 4 : i64
      %5621 = func.call @cc_make_string(%5619, %5620) : (!llvm.ptr, i64) -> i64
      %5622 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5623 = arith.constant 11 : i64
      %5624 = func.call @cc_make_string(%5622, %5623) : (!llvm.ptr, i64) -> i64
      %5625 = func.call @cc_intern(%5621, %5624) : (i64, i64) -> i64
      %5626 = func.call @cc_nil_value() : () -> i64
      %5627 = func.call @cc_cons(%5625, %5626) : (i64, i64) -> i64
      %5628 = func.call @cc_values_pack(%5627) : (i64) -> i64
      func.call @stack_push_pointer(%5625) : (i64) -> ()
      %5629 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5630 = arith.constant 5 : i64
      %5631 = func.call @cc_make_string(%5629, %5630) : (!llvm.ptr, i64) -> i64
      %5632 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5633 = arith.constant 11 : i64
      %5634 = func.call @cc_make_string(%5632, %5633) : (!llvm.ptr, i64) -> i64
      %5635 = func.call @cc_intern(%5631, %5634) : (i64, i64) -> i64
      %5636 = func.call @cc_nil_value() : () -> i64
      %5637 = func.call @cc_cons(%5635, %5636) : (i64, i64) -> i64
      %5638 = func.call @cc_values_pack(%5637) : (i64) -> i64
      func.call @stack_push_pointer(%5635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5639 = func.call @stack_pop_pointer() : () -> i64
      %5640 = func.call @stack_pop_pointer() : () -> i64
      %5641 = func.call @cc_cons(%5640, %5639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %5642 = arith.addi %5641, %__rlasp_stack_elide_zero_269 : i64
      %5643 = func.call @stack_pop_pointer() : () -> i64
      %5644 = func.call @cc_cons(%5643, %5642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5644) : (i64) -> ()
      %5645 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5646 = func.call @stack_pop_pointer() : () -> i64
      %5647 = func.call @stack_pop_pointer() : () -> i64
      %5648 = func.call @cc_cons(%5647, %5646) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %5649 = arith.addi %5648, %__rlasp_stack_elide_zero_270 : i64
      %5650 = func.call @stack_pop_pointer() : () -> i64
      %5651 = func.call @cc_cons(%5650, %5649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %5652 = arith.addi %5651, %__rlasp_stack_elide_zero_271 : i64
      %5653 = func.call @stack_pop_pointer() : () -> i64
      %5654 = func.call @cc_cons(%5653, %5652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5654) : (i64) -> ()
      %5655 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5656 = arith.constant 5 : i64
      %5657 = func.call @cc_make_string(%5655, %5656) : (!llvm.ptr, i64) -> i64
      %5658 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5659 = arith.constant 11 : i64
      %5660 = func.call @cc_make_string(%5658, %5659) : (!llvm.ptr, i64) -> i64
      %5661 = func.call @cc_intern(%5657, %5660) : (i64, i64) -> i64
      %5662 = func.call @cc_nil_value() : () -> i64
      %5663 = func.call @cc_cons(%5661, %5662) : (i64, i64) -> i64
      %5664 = func.call @cc_values_pack(%5663) : (i64) -> i64
      func.call @stack_push_pointer(%5661) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5665 = func.call @stack_pop_pointer() : () -> i64
      %5666 = func.call @stack_pop_pointer() : () -> i64
      %5667 = func.call @cc_cons(%5666, %5665) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %5668 = arith.addi %5667, %__rlasp_stack_elide_zero_272 : i64
      %5669 = func.call @stack_pop_pointer() : () -> i64
      %5670 = func.call @cc_cons(%5669, %5668) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %5671 = arith.addi %5670, %__rlasp_stack_elide_zero_273 : i64
      %5672 = func.call @stack_pop_pointer() : () -> i64
      %5673 = func.call @cc_cons(%5672, %5671) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %5674 = arith.addi %5673, %__rlasp_stack_elide_zero_274 : i64
      %5675 = func.call @stack_pop_pointer() : () -> i64
      %5676 = func.call @cc_cons(%5675, %5674) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %5677 = arith.addi %5676, %__rlasp_stack_elide_zero_275 : i64
      %5713 = arith.constant 15079495958547 : i64
      %5714 = arith.constant 0 : i64
      %5715 = func.call @cc_make_closure(%5713, %5714) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %5716 = arith.addi %5715, %__rlasp_stack_elide_zero_276 : i64
      %5717 = func.call @cc_nil_value() : () -> i64
      %5718 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5719 = arith.constant 15 : i64
      %5720 = func.call @cc_make_string(%5718, %5719) : (!llvm.ptr, i64) -> i64
      %5721 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5722 = arith.constant 7 : i64
      %5723 = func.call @cc_make_string(%5721, %5722) : (!llvm.ptr, i64) -> i64
      %5724 = func.call @cc_intern(%5720, %5723) : (i64, i64) -> i64
      %5725 = func.call @cc_nil_value() : () -> i64
      %5726 = func.call @cc_cons(%5724, %5725) : (i64, i64) -> i64
      %5727 = func.call @cc_values_pack(%5726) : (i64) -> i64
      %5728 = arith.constant 23 : i64
      %5729 = func.call @cc_box_fixnum(%5728) : (i64) -> i64
      %5730 = func.call @cc_nil_value() : () -> i64
      %5731 = func.call @cc_errorp(%5717) : (i64) -> i64
      %5732 = arith.cmpi ne, %5731, %5730 : i64
      %5733 = arith.cmpi eq, %5730, %5730 : i64
      %5734 = arith.andi %5732, %5733 : i1
      %5735 = scf.if %5734 -> (i64) {
        scf.yield %5717 : i64
      } else {
        scf.yield %5730 : i64
      }
      %5736 = func.call @cc_errorp(%5724) : (i64) -> i64
      %5737 = arith.cmpi ne, %5736, %5730 : i64
      %5738 = arith.cmpi eq, %5735, %5730 : i64
      %5739 = arith.andi %5737, %5738 : i1
      %5740 = scf.if %5739 -> (i64) {
        scf.yield %5724 : i64
      } else {
        scf.yield %5735 : i64
      }
      %5741 = func.call @cc_errorp(%5729) : (i64) -> i64
      %5742 = arith.cmpi ne, %5741, %5730 : i64
      %5743 = arith.cmpi eq, %5740, %5730 : i64
      %5744 = arith.andi %5742, %5743 : i1
      %5745 = scf.if %5744 -> (i64) {
        scf.yield %5729 : i64
      } else {
        scf.yield %5740 : i64
      }
      %5746 = arith.cmpi ne, %5745, %5730 : i64
      scf.if %5746 {
        func.call @stack_push_pointer(%5745) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5717) : (i64) -> ()
        func.call @stack_push_pointer(%5724) : (i64) -> ()
        func.call @stack_push_pointer(%5729) : (i64) -> ()
        %5747 = llvm.mlir.addressof @str478 : !llvm.ptr
        %5748 = func.call @cc_make_function_ref_const(%5747) : (!llvm.ptr) -> i64
        %5749 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%5748, %5749) : (i64, i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %5750 = func.call @stack_pop_pointer() : () -> i64
      %5751 = func.call @stack_pop_pointer() : () -> i64
      %5752 = func.call @cc_cons(%5751, %5750) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %5753 = arith.addi %5752, %__rlasp_stack_elide_zero_277 : i64
      %5754 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5755 = arith.constant 11 : i64
      %5756 = func.call @cc_make_string(%5754, %5755) : (!llvm.ptr, i64) -> i64
      %5757 = llvm.mlir.addressof @str480 : !llvm.ptr
      %5758 = arith.constant 7 : i64
      %5759 = func.call @cc_make_string(%5757, %5758) : (!llvm.ptr, i64) -> i64
      %5760 = func.call @cc_intern(%5756, %5759) : (i64, i64) -> i64
      %5761 = func.call @cc_nil_value() : () -> i64
      %5762 = func.call @cc_cons(%5760, %5761) : (i64, i64) -> i64
      %5763 = func.call @cc_values_pack(%5762) : (i64) -> i64
      %5764 = func.call @cc_nil_value() : () -> i64
      %5765 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5766 = arith.constant 4 : i64
      %5767 = func.call @cc_make_string(%5765, %5766) : (!llvm.ptr, i64) -> i64
      %5768 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5769 = arith.constant 7 : i64
      %5770 = func.call @cc_make_string(%5768, %5769) : (!llvm.ptr, i64) -> i64
      %5771 = func.call @cc_intern(%5767, %5770) : (i64, i64) -> i64
      %5772 = func.call @cc_nil_value() : () -> i64
      %5773 = func.call @cc_cons(%5771, %5772) : (i64, i64) -> i64
      %5774 = func.call @cc_values_pack(%5773) : (i64) -> i64
      %5775 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5776 = arith.constant 6 : i64
      %5777 = func.call @cc_make_string(%5775, %5776) : (!llvm.ptr, i64) -> i64
      %5778 = func.call @cc_nil_value() : () -> i64
      %5779 = func.call @cc_intern(%5777, %5778) : (i64, i64) -> i64
      %5780 = func.call @cc_nil_value() : () -> i64
      %5781 = func.call @cc_cons(%5779, %5780) : (i64, i64) -> i64
      %5782 = func.call @cc_values_pack(%5781) : (i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %5783 = arith.addi %5779, %__rlasp_stack_elide_zero_278 : i64
      %5784 = func.call @cc_nil_value() : () -> i64
      %5785 = func.call @cc_errorp(%5565) : (i64) -> i64
      %5786 = arith.cmpi ne, %5785, %5784 : i64
      %5787 = arith.cmpi eq, %5784, %5784 : i64
      %5788 = arith.andi %5786, %5787 : i1
      %5789 = scf.if %5788 -> (i64) {
        scf.yield %5565 : i64
      } else {
        scf.yield %5784 : i64
      }
      %5790 = func.call @cc_errorp(%5677) : (i64) -> i64
      %5791 = arith.cmpi ne, %5790, %5784 : i64
      %5792 = arith.cmpi eq, %5789, %5784 : i64
      %5793 = arith.andi %5791, %5792 : i1
      %5794 = scf.if %5793 -> (i64) {
        scf.yield %5677 : i64
      } else {
        scf.yield %5789 : i64
      }
      %5795 = func.call @cc_errorp(%5716) : (i64) -> i64
      %5796 = arith.cmpi ne, %5795, %5784 : i64
      %5797 = arith.cmpi eq, %5794, %5784 : i64
      %5798 = arith.andi %5796, %5797 : i1
      %5799 = scf.if %5798 -> (i64) {
        scf.yield %5716 : i64
      } else {
        scf.yield %5794 : i64
      }
      %5800 = func.call @cc_errorp(%5753) : (i64) -> i64
      %5801 = arith.cmpi ne, %5800, %5784 : i64
      %5802 = arith.cmpi eq, %5799, %5784 : i64
      %5803 = arith.andi %5801, %5802 : i1
      %5804 = scf.if %5803 -> (i64) {
        scf.yield %5753 : i64
      } else {
        scf.yield %5799 : i64
      }
      %5805 = func.call @cc_errorp(%5760) : (i64) -> i64
      %5806 = arith.cmpi ne, %5805, %5784 : i64
      %5807 = arith.cmpi eq, %5804, %5784 : i64
      %5808 = arith.andi %5806, %5807 : i1
      %5809 = scf.if %5808 -> (i64) {
        scf.yield %5760 : i64
      } else {
        scf.yield %5804 : i64
      }
      %5810 = func.call @cc_errorp(%5764) : (i64) -> i64
      %5811 = arith.cmpi ne, %5810, %5784 : i64
      %5812 = arith.cmpi eq, %5809, %5784 : i64
      %5813 = arith.andi %5811, %5812 : i1
      %5814 = scf.if %5813 -> (i64) {
        scf.yield %5764 : i64
      } else {
        scf.yield %5809 : i64
      }
      %5815 = func.call @cc_errorp(%5771) : (i64) -> i64
      %5816 = arith.cmpi ne, %5815, %5784 : i64
      %5817 = arith.cmpi eq, %5814, %5784 : i64
      %5818 = arith.andi %5816, %5817 : i1
      %5819 = scf.if %5818 -> (i64) {
        scf.yield %5771 : i64
      } else {
        scf.yield %5814 : i64
      }
      %5820 = func.call @cc_errorp(%5783) : (i64) -> i64
      %5821 = arith.cmpi ne, %5820, %5784 : i64
      %5822 = arith.cmpi eq, %5819, %5784 : i64
      %5823 = arith.andi %5821, %5822 : i1
      %5824 = scf.if %5823 -> (i64) {
        scf.yield %5783 : i64
      } else {
        scf.yield %5819 : i64
      }
      %5825 = arith.cmpi ne, %5824, %5784 : i64
      scf.if %5825 {
        func.call @stack_push_pointer(%5824) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5565) : (i64) -> ()
        func.call @stack_push_pointer(%5677) : (i64) -> ()
        func.call @stack_push_pointer(%5716) : (i64) -> ()
        func.call @stack_push_pointer(%5753) : (i64) -> ()
        func.call @stack_push_pointer(%5760) : (i64) -> ()
        func.call @stack_push_pointer(%5764) : (i64) -> ()
        func.call @stack_push_pointer(%5771) : (i64) -> ()
        func.call @stack_push_pointer(%5783) : (i64) -> ()
        %5826 = llvm.mlir.addressof @str484 : !llvm.ptr
        %5827 = func.call @cc_make_function_ref_const(%5826) : (!llvm.ptr) -> i64
        %5828 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5827, %5828) : (i64, i64) -> ()
      }
      %5829 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5829 : i64
    }
    %5830 = func.call @cc_nil_value() : () -> i64
    %5831 = func.call @cc_errorp(%5556) : (i64) -> i64
    %5832 = arith.cmpi ne, %5831, %5830 : i64
    %5833 = scf.if %5832 -> (i64) {
      scf.yield %5556 : i64
    } else {
      %5834 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5835 = arith.constant 22 : i64
      %5836 = func.call @cc_make_string(%5834, %5835) : (!llvm.ptr, i64) -> i64
      %5837 = func.call @cc_nil_value() : () -> i64
      %5838 = func.call @cc_intern(%5836, %5837) : (i64, i64) -> i64
      %5839 = func.call @cc_nil_value() : () -> i64
      %5840 = func.call @cc_cons(%5838, %5839) : (i64, i64) -> i64
      %5841 = func.call @cc_values_pack(%5840) : (i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %5842 = arith.addi %5838, %__rlasp_stack_elide_zero_279 : i64
      %5843 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5844 = arith.constant 13 : i64
      %5845 = func.call @cc_make_string(%5843, %5844) : (!llvm.ptr, i64) -> i64
      %5846 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5847 = arith.constant 11 : i64
      %5848 = func.call @cc_make_string(%5846, %5847) : (!llvm.ptr, i64) -> i64
      %5849 = func.call @cc_intern(%5845, %5848) : (i64, i64) -> i64
      %5850 = func.call @cc_nil_value() : () -> i64
      %5851 = func.call @cc_cons(%5849, %5850) : (i64, i64) -> i64
      %5852 = func.call @cc_values_pack(%5851) : (i64) -> i64
      func.call @stack_push_pointer(%5849) : (i64) -> ()
      %5853 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5854 = arith.constant 6 : i64
      %5855 = func.call @cc_make_string(%5853, %5854) : (!llvm.ptr, i64) -> i64
      %5856 = func.call @cc_nil_value() : () -> i64
      %5857 = func.call @cc_intern(%5855, %5856) : (i64, i64) -> i64
      %5858 = func.call @cc_nil_value() : () -> i64
      %5859 = func.call @cc_cons(%5857, %5858) : (i64, i64) -> i64
      %5860 = func.call @cc_values_pack(%5859) : (i64) -> i64
      func.call @stack_push_pointer(%5857) : (i64) -> ()
      %5861 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5862 = arith.constant 19 : i64
      %5863 = func.call @cc_make_string(%5861, %5862) : (!llvm.ptr, i64) -> i64
      %5864 = func.call @cc_nil_value() : () -> i64
      %5865 = func.call @cc_intern(%5863, %5864) : (i64, i64) -> i64
      %5866 = func.call @cc_nil_value() : () -> i64
      %5867 = func.call @cc_cons(%5865, %5866) : (i64, i64) -> i64
      %5868 = func.call @cc_values_pack(%5867) : (i64) -> i64
      func.call @stack_push_pointer(%5865) : (i64) -> ()
      %5869 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5870 = arith.constant 12 : i64
      %5871 = func.call @cc_make_string(%5869, %5870) : (!llvm.ptr, i64) -> i64
      %5872 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5873 = arith.constant 11 : i64
      %5874 = func.call @cc_make_string(%5872, %5873) : (!llvm.ptr, i64) -> i64
      %5875 = func.call @cc_intern(%5871, %5874) : (i64, i64) -> i64
      %5876 = func.call @cc_nil_value() : () -> i64
      %5877 = func.call @cc_cons(%5875, %5876) : (i64, i64) -> i64
      %5878 = func.call @cc_values_pack(%5877) : (i64) -> i64
      func.call @stack_push_pointer(%5875) : (i64) -> ()
      %5879 = func.call @cc_nil_value() : () -> i64
      %5880 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5881 = arith.constant 15 : i64
      %5882 = func.call @cc_make_string(%5880, %5881) : (!llvm.ptr, i64) -> i64
      %5883 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5884 = arith.constant 7 : i64
      %5885 = func.call @cc_make_string(%5883, %5884) : (!llvm.ptr, i64) -> i64
      %5886 = func.call @cc_intern(%5882, %5885) : (i64, i64) -> i64
      %5887 = func.call @cc_nil_value() : () -> i64
      %5888 = func.call @cc_cons(%5886, %5887) : (i64, i64) -> i64
      %5889 = func.call @cc_values_pack(%5888) : (i64) -> i64
      %5890 = func.call @cc_nil_value() : () -> i64
      %5891 = func.call @cc_nil_value() : () -> i64
      %5892 = func.call @cc_errorp(%5879) : (i64) -> i64
      %5893 = arith.cmpi ne, %5892, %5891 : i64
      %5894 = arith.cmpi eq, %5891, %5891 : i64
      %5895 = arith.andi %5893, %5894 : i1
      %5896 = scf.if %5895 -> (i64) {
        scf.yield %5879 : i64
      } else {
        scf.yield %5891 : i64
      }
      %5897 = func.call @cc_errorp(%5886) : (i64) -> i64
      %5898 = arith.cmpi ne, %5897, %5891 : i64
      %5899 = arith.cmpi eq, %5896, %5891 : i64
      %5900 = arith.andi %5898, %5899 : i1
      %5901 = scf.if %5900 -> (i64) {
        scf.yield %5886 : i64
      } else {
        scf.yield %5896 : i64
      }
      %5902 = func.call @cc_errorp(%5890) : (i64) -> i64
      %5903 = arith.cmpi ne, %5902, %5891 : i64
      %5904 = arith.cmpi eq, %5901, %5891 : i64
      %5905 = arith.andi %5903, %5904 : i1
      %5906 = scf.if %5905 -> (i64) {
        scf.yield %5890 : i64
      } else {
        scf.yield %5901 : i64
      }
      %5907 = arith.cmpi ne, %5906, %5891 : i64
      scf.if %5907 {
        func.call @stack_push_pointer(%5906) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5879) : (i64) -> ()
        func.call @stack_push_pointer(%5886) : (i64) -> ()
        func.call @stack_push_pointer(%5890) : (i64) -> ()
        %5908 = llvm.mlir.addressof @str494 : !llvm.ptr
        %5909 = func.call @cc_make_function_ref_const(%5908) : (!llvm.ptr) -> i64
        %5910 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%5909, %5910) : (i64, i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %5911 = func.call @stack_pop_pointer() : () -> i64
      %5912 = func.call @stack_pop_pointer() : () -> i64
      %5913 = func.call @cc_cons(%5912, %5911) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %5914 = arith.addi %5913, %__rlasp_stack_elide_zero_280 : i64
      %5915 = func.call @stack_pop_pointer() : () -> i64
      %5916 = func.call @cc_cons(%5915, %5914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5917 = func.call @stack_pop_pointer() : () -> i64
      %5918 = func.call @stack_pop_pointer() : () -> i64
      %5919 = func.call @cc_cons(%5918, %5917) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %5920 = arith.addi %5919, %__rlasp_stack_elide_zero_281 : i64
      %5921 = func.call @stack_pop_pointer() : () -> i64
      %5922 = func.call @cc_cons(%5921, %5920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5922) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5923 = func.call @stack_pop_pointer() : () -> i64
      %5924 = func.call @stack_pop_pointer() : () -> i64
      %5925 = func.call @cc_cons(%5924, %5923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %5926 = arith.addi %5925, %__rlasp_stack_elide_zero_282 : i64
      %5927 = func.call @stack_pop_pointer() : () -> i64
      %5928 = func.call @cc_cons(%5927, %5926) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %5929 = arith.addi %5928, %__rlasp_stack_elide_zero_283 : i64
      %5930 = func.call @stack_pop_pointer() : () -> i64
      %5931 = func.call @cc_cons(%5930, %5929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5931) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5932 = func.call @stack_pop_pointer() : () -> i64
      %5933 = func.call @stack_pop_pointer() : () -> i64
      %5934 = func.call @cc_cons(%5933, %5932) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %5935 = arith.addi %5934, %__rlasp_stack_elide_zero_284 : i64
      %5936 = func.call @stack_pop_pointer() : () -> i64
      %5937 = func.call @cc_cons(%5936, %5935) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %5938 = arith.addi %5937, %__rlasp_stack_elide_zero_285 : i64
      %6025 = arith.constant 15079495958548 : i64
      %6026 = arith.constant 0 : i64
      %6027 = func.call @cc_make_closure(%6025, %6026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %6028 = arith.addi %6027, %__rlasp_stack_elide_zero_286 : i64
      %6029 = llvm.mlir.addressof @str499 : !llvm.ptr
      %6030 = arith.constant 4 : i64
      %6031 = func.call @cc_make_string(%6029, %6030) : (!llvm.ptr, i64) -> i64
      %6032 = func.call @cc_nil_value() : () -> i64
      %6033 = func.call @cc_intern(%6031, %6032) : (i64, i64) -> i64
      %6034 = func.call @cc_nil_value() : () -> i64
      %6035 = func.call @cc_cons(%6033, %6034) : (i64, i64) -> i64
      %6036 = func.call @cc_values_pack(%6035) : (i64) -> i64
      func.call @stack_push_pointer(%6033) : (i64) -> ()
      %6037 = llvm.mlir.addressof @str500 : !llvm.ptr
      %6038 = arith.constant 10 : i64
      %6039 = func.call @cc_make_string(%6037, %6038) : (!llvm.ptr, i64) -> i64
      %6040 = llvm.mlir.addressof @str501 : !llvm.ptr
      %6041 = arith.constant 11 : i64
      %6042 = func.call @cc_make_string(%6040, %6041) : (!llvm.ptr, i64) -> i64
      %6043 = func.call @cc_intern(%6039, %6042) : (i64, i64) -> i64
      %6044 = func.call @cc_nil_value() : () -> i64
      %6045 = func.call @cc_cons(%6043, %6044) : (i64, i64) -> i64
      %6046 = func.call @cc_values_pack(%6045) : (i64) -> i64
      func.call @stack_push_pointer(%6043) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6047 = func.call @stack_pop_pointer() : () -> i64
      %6048 = func.call @stack_pop_pointer() : () -> i64
      %6049 = func.call @cc_cons(%6048, %6047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %6050 = arith.addi %6049, %__rlasp_stack_elide_zero_287 : i64
      %6051 = func.call @stack_pop_pointer() : () -> i64
      %6052 = func.call @cc_cons(%6051, %6050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %6053 = arith.addi %6052, %__rlasp_stack_elide_zero_288 : i64
      %6054 = llvm.mlir.addressof @str502 : !llvm.ptr
      %6055 = arith.constant 11 : i64
      %6056 = func.call @cc_make_string(%6054, %6055) : (!llvm.ptr, i64) -> i64
      %6057 = llvm.mlir.addressof @str503 : !llvm.ptr
      %6058 = arith.constant 7 : i64
      %6059 = func.call @cc_make_string(%6057, %6058) : (!llvm.ptr, i64) -> i64
      %6060 = func.call @cc_intern(%6056, %6059) : (i64, i64) -> i64
      %6061 = func.call @cc_nil_value() : () -> i64
      %6062 = func.call @cc_cons(%6060, %6061) : (i64, i64) -> i64
      %6063 = func.call @cc_values_pack(%6062) : (i64) -> i64
      %6064 = func.call @cc_nil_value() : () -> i64
      %6065 = llvm.mlir.addressof @str504 : !llvm.ptr
      %6066 = arith.constant 4 : i64
      %6067 = func.call @cc_make_string(%6065, %6066) : (!llvm.ptr, i64) -> i64
      %6068 = llvm.mlir.addressof @str505 : !llvm.ptr
      %6069 = arith.constant 7 : i64
      %6070 = func.call @cc_make_string(%6068, %6069) : (!llvm.ptr, i64) -> i64
      %6071 = func.call @cc_intern(%6067, %6070) : (i64, i64) -> i64
      %6072 = func.call @cc_nil_value() : () -> i64
      %6073 = func.call @cc_cons(%6071, %6072) : (i64, i64) -> i64
      %6074 = func.call @cc_values_pack(%6073) : (i64) -> i64
      %6075 = llvm.mlir.addressof @str506 : !llvm.ptr
      %6076 = arith.constant 5 : i64
      %6077 = func.call @cc_make_string(%6075, %6076) : (!llvm.ptr, i64) -> i64
      %6078 = func.call @cc_nil_value() : () -> i64
      %6079 = func.call @cc_intern(%6077, %6078) : (i64, i64) -> i64
      %6080 = func.call @cc_nil_value() : () -> i64
      %6081 = func.call @cc_cons(%6079, %6080) : (i64, i64) -> i64
      %6082 = func.call @cc_values_pack(%6081) : (i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %6083 = arith.addi %6079, %__rlasp_stack_elide_zero_289 : i64
      %6084 = func.call @cc_nil_value() : () -> i64
      %6085 = func.call @cc_errorp(%5842) : (i64) -> i64
      %6086 = arith.cmpi ne, %6085, %6084 : i64
      %6087 = arith.cmpi eq, %6084, %6084 : i64
      %6088 = arith.andi %6086, %6087 : i1
      %6089 = scf.if %6088 -> (i64) {
        scf.yield %5842 : i64
      } else {
        scf.yield %6084 : i64
      }
      %6090 = func.call @cc_errorp(%5938) : (i64) -> i64
      %6091 = arith.cmpi ne, %6090, %6084 : i64
      %6092 = arith.cmpi eq, %6089, %6084 : i64
      %6093 = arith.andi %6091, %6092 : i1
      %6094 = scf.if %6093 -> (i64) {
        scf.yield %5938 : i64
      } else {
        scf.yield %6089 : i64
      }
      %6095 = func.call @cc_errorp(%6028) : (i64) -> i64
      %6096 = arith.cmpi ne, %6095, %6084 : i64
      %6097 = arith.cmpi eq, %6094, %6084 : i64
      %6098 = arith.andi %6096, %6097 : i1
      %6099 = scf.if %6098 -> (i64) {
        scf.yield %6028 : i64
      } else {
        scf.yield %6094 : i64
      }
      %6100 = func.call @cc_errorp(%6053) : (i64) -> i64
      %6101 = arith.cmpi ne, %6100, %6084 : i64
      %6102 = arith.cmpi eq, %6099, %6084 : i64
      %6103 = arith.andi %6101, %6102 : i1
      %6104 = scf.if %6103 -> (i64) {
        scf.yield %6053 : i64
      } else {
        scf.yield %6099 : i64
      }
      %6105 = func.call @cc_errorp(%6060) : (i64) -> i64
      %6106 = arith.cmpi ne, %6105, %6084 : i64
      %6107 = arith.cmpi eq, %6104, %6084 : i64
      %6108 = arith.andi %6106, %6107 : i1
      %6109 = scf.if %6108 -> (i64) {
        scf.yield %6060 : i64
      } else {
        scf.yield %6104 : i64
      }
      %6110 = func.call @cc_errorp(%6064) : (i64) -> i64
      %6111 = arith.cmpi ne, %6110, %6084 : i64
      %6112 = arith.cmpi eq, %6109, %6084 : i64
      %6113 = arith.andi %6111, %6112 : i1
      %6114 = scf.if %6113 -> (i64) {
        scf.yield %6064 : i64
      } else {
        scf.yield %6109 : i64
      }
      %6115 = func.call @cc_errorp(%6071) : (i64) -> i64
      %6116 = arith.cmpi ne, %6115, %6084 : i64
      %6117 = arith.cmpi eq, %6114, %6084 : i64
      %6118 = arith.andi %6116, %6117 : i1
      %6119 = scf.if %6118 -> (i64) {
        scf.yield %6071 : i64
      } else {
        scf.yield %6114 : i64
      }
      %6120 = func.call @cc_errorp(%6083) : (i64) -> i64
      %6121 = arith.cmpi ne, %6120, %6084 : i64
      %6122 = arith.cmpi eq, %6119, %6084 : i64
      %6123 = arith.andi %6121, %6122 : i1
      %6124 = scf.if %6123 -> (i64) {
        scf.yield %6083 : i64
      } else {
        scf.yield %6119 : i64
      }
      %6125 = arith.cmpi ne, %6124, %6084 : i64
      scf.if %6125 {
        func.call @stack_push_pointer(%6124) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5842) : (i64) -> ()
        func.call @stack_push_pointer(%5938) : (i64) -> ()
        func.call @stack_push_pointer(%6028) : (i64) -> ()
        func.call @stack_push_pointer(%6053) : (i64) -> ()
        func.call @stack_push_pointer(%6060) : (i64) -> ()
        func.call @stack_push_pointer(%6064) : (i64) -> ()
        func.call @stack_push_pointer(%6071) : (i64) -> ()
        func.call @stack_push_pointer(%6083) : (i64) -> ()
        %6126 = llvm.mlir.addressof @str507 : !llvm.ptr
        %6127 = func.call @cc_make_function_ref_const(%6126) : (!llvm.ptr) -> i64
        %6128 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6127, %6128) : (i64, i64) -> ()
      }
      %6129 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6129 : i64
    }
    %6130 = func.call @cc_nil_value() : () -> i64
    %6131 = func.call @cc_errorp(%5833) : (i64) -> i64
    %6132 = arith.cmpi ne, %6131, %6130 : i64
    %6133 = scf.if %6132 -> (i64) {
      scf.yield %5833 : i64
    } else {
      %6134 = llvm.mlir.addressof @str508 : !llvm.ptr
      %6135 = arith.constant 34 : i64
      %6136 = func.call @cc_make_string(%6134, %6135) : (!llvm.ptr, i64) -> i64
      %6137 = func.call @cc_nil_value() : () -> i64
      %6138 = func.call @cc_intern(%6136, %6137) : (i64, i64) -> i64
      %6139 = func.call @cc_nil_value() : () -> i64
      %6140 = func.call @cc_cons(%6138, %6139) : (i64, i64) -> i64
      %6141 = func.call @cc_values_pack(%6140) : (i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %6142 = arith.addi %6138, %__rlasp_stack_elide_zero_290 : i64
      %6143 = llvm.mlir.addressof @str509 : !llvm.ptr
      %6144 = arith.constant 3 : i64
      %6145 = func.call @cc_make_string(%6143, %6144) : (!llvm.ptr, i64) -> i64
      %6146 = func.call @cc_nil_value() : () -> i64
      %6147 = func.call @cc_intern(%6145, %6146) : (i64, i64) -> i64
      %6148 = func.call @cc_nil_value() : () -> i64
      %6149 = func.call @cc_cons(%6147, %6148) : (i64, i64) -> i64
      %6150 = func.call @cc_values_pack(%6149) : (i64) -> i64
      func.call @stack_push_pointer(%6147) : (i64) -> ()
      %6151 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6152 = arith.constant 3 : i64
      %6153 = func.call @cc_make_string(%6151, %6152) : (!llvm.ptr, i64) -> i64
      %6154 = func.call @cc_nil_value() : () -> i64
      %6155 = func.call @cc_intern(%6153, %6154) : (i64, i64) -> i64
      %6156 = func.call @cc_nil_value() : () -> i64
      %6157 = func.call @cc_cons(%6155, %6156) : (i64, i64) -> i64
      %6158 = func.call @cc_values_pack(%6157) : (i64) -> i64
      func.call @stack_push_pointer(%6155) : (i64) -> ()
      %6159 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6160 = arith.constant 3 : i64
      %6161 = func.call @cc_make_string(%6159, %6160) : (!llvm.ptr, i64) -> i64
      %6162 = func.call @cc_nil_value() : () -> i64
      %6163 = func.call @cc_intern(%6161, %6162) : (i64, i64) -> i64
      %6164 = func.call @cc_nil_value() : () -> i64
      %6165 = func.call @cc_cons(%6163, %6164) : (i64, i64) -> i64
      %6166 = func.call @cc_values_pack(%6165) : (i64) -> i64
      func.call @stack_push_pointer(%6163) : (i64) -> ()
      %6167 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6168 = arith.constant 7 : i64
      %6169 = func.call @cc_make_string(%6167, %6168) : (!llvm.ptr, i64) -> i64
      %6170 = func.call @cc_nil_value() : () -> i64
      %6171 = func.call @cc_intern(%6169, %6170) : (i64, i64) -> i64
      %6172 = func.call @cc_nil_value() : () -> i64
      %6173 = func.call @cc_cons(%6171, %6172) : (i64, i64) -> i64
      %6174 = func.call @cc_values_pack(%6173) : (i64) -> i64
      func.call @stack_push_pointer(%6171) : (i64) -> ()
      %6175 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6176 = arith.constant 12 : i64
      %6177 = func.call @cc_make_string(%6175, %6176) : (!llvm.ptr, i64) -> i64
      %6178 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6179 = arith.constant 11 : i64
      %6180 = func.call @cc_make_string(%6178, %6179) : (!llvm.ptr, i64) -> i64
      %6181 = func.call @cc_intern(%6177, %6180) : (i64, i64) -> i64
      %6182 = func.call @cc_nil_value() : () -> i64
      %6183 = func.call @cc_cons(%6181, %6182) : (i64, i64) -> i64
      %6184 = func.call @cc_values_pack(%6183) : (i64) -> i64
      func.call @stack_push_pointer(%6181) : (i64) -> ()
      %6185 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6186 = arith.constant 7 : i64
      %6187 = func.call @cc_make_string(%6185, %6186) : (!llvm.ptr, i64) -> i64
      %6188 = llvm.mlir.addressof @str516 : !llvm.ptr
      %6189 = arith.constant 11 : i64
      %6190 = func.call @cc_make_string(%6188, %6189) : (!llvm.ptr, i64) -> i64
      %6191 = func.call @cc_intern(%6187, %6190) : (i64, i64) -> i64
      %6192 = func.call @cc_nil_value() : () -> i64
      %6193 = func.call @cc_cons(%6191, %6192) : (i64, i64) -> i64
      %6194 = func.call @cc_values_pack(%6193) : (i64) -> i64
      func.call @stack_push_pointer(%6191) : (i64) -> ()
      %6195 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6196 = arith.constant 7 : i64
      %6197 = func.call @cc_make_string(%6195, %6196) : (!llvm.ptr, i64) -> i64
      %6198 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6199 = arith.constant 11 : i64
      %6200 = func.call @cc_make_string(%6198, %6199) : (!llvm.ptr, i64) -> i64
      %6201 = func.call @cc_intern(%6197, %6200) : (i64, i64) -> i64
      %6202 = func.call @cc_nil_value() : () -> i64
      %6203 = func.call @cc_cons(%6201, %6202) : (i64, i64) -> i64
      %6204 = func.call @cc_values_pack(%6203) : (i64) -> i64
      func.call @stack_push_pointer(%6201) : (i64) -> ()
      %6205 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6206 = arith.constant 8 : i64
      %6207 = func.call @cc_make_string(%6205, %6206) : (!llvm.ptr, i64) -> i64
      %6208 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6209 = arith.constant 11 : i64
      %6210 = func.call @cc_make_string(%6208, %6209) : (!llvm.ptr, i64) -> i64
      %6211 = func.call @cc_intern(%6207, %6210) : (i64, i64) -> i64
      %6212 = func.call @cc_nil_value() : () -> i64
      %6213 = func.call @cc_cons(%6211, %6212) : (i64, i64) -> i64
      %6214 = func.call @cc_values_pack(%6213) : (i64) -> i64
      func.call @stack_push_pointer(%6211) : (i64) -> ()
      %6215 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6216 = arith.constant 5 : i64
      %6217 = func.call @cc_make_string(%6215, %6216) : (!llvm.ptr, i64) -> i64
      %6218 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6219 = arith.constant 11 : i64
      %6220 = func.call @cc_make_string(%6218, %6219) : (!llvm.ptr, i64) -> i64
      %6221 = func.call @cc_intern(%6217, %6220) : (i64, i64) -> i64
      %6222 = func.call @cc_nil_value() : () -> i64
      %6223 = func.call @cc_cons(%6221, %6222) : (i64, i64) -> i64
      %6224 = func.call @cc_values_pack(%6223) : (i64) -> i64
      func.call @stack_push_pointer(%6221) : (i64) -> ()
      %6225 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6225) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6226 = func.call @stack_pop_pointer() : () -> i64
      %6227 = func.call @stack_pop_pointer() : () -> i64
      %6228 = func.call @cc_cons(%6227, %6226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %6229 = arith.addi %6228, %__rlasp_stack_elide_zero_291 : i64
      %6230 = func.call @stack_pop_pointer() : () -> i64
      %6231 = func.call @cc_cons(%6230, %6229) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6231) : (i64) -> ()
      %6232 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6233 = arith.constant 6 : i64
      %6234 = func.call @cc_make_string(%6232, %6233) : (!llvm.ptr, i64) -> i64
      %6235 = llvm.mlir.addressof @str524 : !llvm.ptr
      %6236 = arith.constant 11 : i64
      %6237 = func.call @cc_make_string(%6235, %6236) : (!llvm.ptr, i64) -> i64
      %6238 = func.call @cc_intern(%6234, %6237) : (i64, i64) -> i64
      %6239 = func.call @cc_nil_value() : () -> i64
      %6240 = func.call @cc_cons(%6238, %6239) : (i64, i64) -> i64
      %6241 = func.call @cc_values_pack(%6240) : (i64) -> i64
      func.call @stack_push_pointer(%6238) : (i64) -> ()
      %6242 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6242) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6243 = func.call @stack_pop_pointer() : () -> i64
      %6244 = func.call @stack_pop_pointer() : () -> i64
      %6245 = func.call @cc_cons(%6244, %6243) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %6246 = arith.addi %6245, %__rlasp_stack_elide_zero_292 : i64
      %6247 = func.call @stack_pop_pointer() : () -> i64
      %6248 = func.call @cc_cons(%6247, %6246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6248) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6249 = func.call @stack_pop_pointer() : () -> i64
      %6250 = func.call @stack_pop_pointer() : () -> i64
      %6251 = func.call @cc_cons(%6250, %6249) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %6252 = arith.addi %6251, %__rlasp_stack_elide_zero_293 : i64
      %6253 = func.call @stack_pop_pointer() : () -> i64
      %6254 = func.call @cc_cons(%6253, %6252) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %6255 = arith.addi %6254, %__rlasp_stack_elide_zero_294 : i64
      %6256 = func.call @stack_pop_pointer() : () -> i64
      %6257 = func.call @cc_cons(%6256, %6255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6257) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6258 = func.call @stack_pop_pointer() : () -> i64
      %6259 = func.call @stack_pop_pointer() : () -> i64
      %6260 = func.call @cc_cons(%6259, %6258) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %6261 = arith.addi %6260, %__rlasp_stack_elide_zero_295 : i64
      %6262 = func.call @stack_pop_pointer() : () -> i64
      %6263 = func.call @cc_cons(%6262, %6261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6263) : (i64) -> ()
      %6264 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6265 = arith.constant 4 : i64
      %6266 = func.call @cc_make_string(%6264, %6265) : (!llvm.ptr, i64) -> i64
      %6267 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6268 = arith.constant 11 : i64
      %6269 = func.call @cc_make_string(%6267, %6268) : (!llvm.ptr, i64) -> i64
      %6270 = func.call @cc_intern(%6266, %6269) : (i64, i64) -> i64
      %6271 = func.call @cc_nil_value() : () -> i64
      %6272 = func.call @cc_cons(%6270, %6271) : (i64, i64) -> i64
      %6273 = func.call @cc_values_pack(%6272) : (i64) -> i64
      func.call @stack_push_pointer(%6270) : (i64) -> ()
      %6274 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6275 = arith.constant 10 : i64
      %6276 = func.call @cc_make_string(%6274, %6275) : (!llvm.ptr, i64) -> i64
      %6277 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6278 = arith.constant 11 : i64
      %6279 = func.call @cc_make_string(%6277, %6278) : (!llvm.ptr, i64) -> i64
      %6280 = func.call @cc_intern(%6276, %6279) : (i64, i64) -> i64
      %6281 = func.call @cc_nil_value() : () -> i64
      %6282 = func.call @cc_cons(%6280, %6281) : (i64, i64) -> i64
      %6283 = func.call @cc_values_pack(%6282) : (i64) -> i64
      func.call @stack_push_pointer(%6280) : (i64) -> ()
      %6284 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6284) : (i64) -> ()
      %6285 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6286 = arith.constant 15 : i64
      %6287 = func.call @cc_make_string(%6285, %6286) : (!llvm.ptr, i64) -> i64
      %6288 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6289 = arith.constant 7 : i64
      %6290 = func.call @cc_make_string(%6288, %6289) : (!llvm.ptr, i64) -> i64
      %6291 = func.call @cc_intern(%6287, %6290) : (i64, i64) -> i64
      %6292 = func.call @cc_nil_value() : () -> i64
      %6293 = func.call @cc_cons(%6291, %6292) : (i64, i64) -> i64
      %6294 = func.call @cc_values_pack(%6293) : (i64) -> i64
      func.call @stack_push_pointer(%6291) : (i64) -> ()
      %6295 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%6295) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6296 = func.call @stack_pop_pointer() : () -> i64
      %6297 = func.call @stack_pop_pointer() : () -> i64
      %6298 = func.call @cc_cons(%6297, %6296) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %6299 = arith.addi %6298, %__rlasp_stack_elide_zero_296 : i64
      %6300 = func.call @stack_pop_pointer() : () -> i64
      %6301 = func.call @cc_cons(%6300, %6299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %6302 = arith.addi %6301, %__rlasp_stack_elide_zero_297 : i64
      %6303 = func.call @stack_pop_pointer() : () -> i64
      %6304 = func.call @cc_cons(%6303, %6302) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %6305 = arith.addi %6304, %__rlasp_stack_elide_zero_298 : i64
      %6306 = func.call @stack_pop_pointer() : () -> i64
      %6307 = func.call @cc_cons(%6306, %6305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6307) : (i64) -> ()
      %6308 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%6308) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6309 = func.call @stack_pop_pointer() : () -> i64
      %6310 = func.call @stack_pop_pointer() : () -> i64
      %6311 = func.call @cc_cons(%6310, %6309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %6312 = arith.addi %6311, %__rlasp_stack_elide_zero_299 : i64
      %6313 = func.call @stack_pop_pointer() : () -> i64
      %6314 = func.call @cc_cons(%6313, %6312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %6315 = arith.addi %6314, %__rlasp_stack_elide_zero_300 : i64
      %6316 = func.call @stack_pop_pointer() : () -> i64
      %6317 = func.call @cc_cons(%6316, %6315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6317) : (i64) -> ()
      %6318 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6319 = arith.constant 4 : i64
      %6320 = func.call @cc_make_string(%6318, %6319) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6320) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6321 = func.call @stack_pop_pointer() : () -> i64
      %6322 = func.call @stack_pop_pointer() : () -> i64
      %6323 = func.call @cc_cons(%6322, %6321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %6324 = arith.addi %6323, %__rlasp_stack_elide_zero_301 : i64
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @cc_cons(%6325, %6324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %6327 = arith.addi %6326, %__rlasp_stack_elide_zero_302 : i64
      %6328 = func.call @stack_pop_pointer() : () -> i64
      %6329 = func.call @cc_cons(%6328, %6327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %6330 = arith.addi %6329, %__rlasp_stack_elide_zero_303 : i64
      %6331 = func.call @stack_pop_pointer() : () -> i64
      %6332 = func.call @cc_cons(%6331, %6330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6332) : (i64) -> ()
      %6333 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6334 = arith.constant 5 : i64
      %6335 = func.call @cc_make_string(%6333, %6334) : (!llvm.ptr, i64) -> i64
      %6336 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6337 = arith.constant 11 : i64
      %6338 = func.call @cc_make_string(%6336, %6337) : (!llvm.ptr, i64) -> i64
      %6339 = func.call @cc_intern(%6335, %6338) : (i64, i64) -> i64
      %6340 = func.call @cc_nil_value() : () -> i64
      %6341 = func.call @cc_cons(%6339, %6340) : (i64, i64) -> i64
      %6342 = func.call @cc_values_pack(%6341) : (i64) -> i64
      func.call @stack_push_pointer(%6339) : (i64) -> ()
      %6343 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6344 = arith.constant 1 : i64
      %6345 = func.call @cc_make_string(%6343, %6344) : (!llvm.ptr, i64) -> i64
      %6346 = func.call @cc_nil_value() : () -> i64
      %6347 = func.call @cc_intern(%6345, %6346) : (i64, i64) -> i64
      %6348 = func.call @cc_nil_value() : () -> i64
      %6349 = func.call @cc_cons(%6347, %6348) : (i64, i64) -> i64
      %6350 = func.call @cc_values_pack(%6349) : (i64) -> i64
      func.call @stack_push_pointer(%6347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6351 = func.call @stack_pop_pointer() : () -> i64
      %6352 = func.call @stack_pop_pointer() : () -> i64
      %6353 = func.call @cc_cons(%6352, %6351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6353) : (i64) -> ()
      %6354 = llvm.mlir.addressof @str535 : !llvm.ptr
      %6355 = arith.constant 15 : i64
      %6356 = func.call @cc_make_string(%6354, %6355) : (!llvm.ptr, i64) -> i64
      %6357 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6358 = arith.constant 11 : i64
      %6359 = func.call @cc_make_string(%6357, %6358) : (!llvm.ptr, i64) -> i64
      %6360 = func.call @cc_intern(%6356, %6359) : (i64, i64) -> i64
      %6361 = func.call @cc_nil_value() : () -> i64
      %6362 = func.call @cc_cons(%6360, %6361) : (i64, i64) -> i64
      %6363 = func.call @cc_values_pack(%6362) : (i64) -> i64
      func.call @stack_push_pointer(%6360) : (i64) -> ()
      %6364 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6365 = arith.constant 1 : i64
      %6366 = func.call @cc_make_string(%6364, %6365) : (!llvm.ptr, i64) -> i64
      %6367 = func.call @cc_nil_value() : () -> i64
      %6368 = func.call @cc_intern(%6366, %6367) : (i64, i64) -> i64
      %6369 = func.call @cc_nil_value() : () -> i64
      %6370 = func.call @cc_cons(%6368, %6369) : (i64, i64) -> i64
      %6371 = func.call @cc_values_pack(%6370) : (i64) -> i64
      func.call @stack_push_pointer(%6368) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6372 = func.call @stack_pop_pointer() : () -> i64
      %6373 = func.call @stack_pop_pointer() : () -> i64
      %6374 = func.call @cc_cons(%6373, %6372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %6375 = arith.addi %6374, %__rlasp_stack_elide_zero_304 : i64
      %6376 = func.call @stack_pop_pointer() : () -> i64
      %6377 = func.call @cc_cons(%6376, %6375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6378 = func.call @stack_pop_pointer() : () -> i64
      %6379 = func.call @stack_pop_pointer() : () -> i64
      %6380 = func.call @cc_cons(%6379, %6378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %6381 = arith.addi %6380, %__rlasp_stack_elide_zero_305 : i64
      %6382 = func.call @stack_pop_pointer() : () -> i64
      %6383 = func.call @cc_cons(%6382, %6381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %6384 = arith.addi %6383, %__rlasp_stack_elide_zero_306 : i64
      %6385 = func.call @stack_pop_pointer() : () -> i64
      %6386 = func.call @cc_cons(%6385, %6384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6387 = func.call @stack_pop_pointer() : () -> i64
      %6388 = func.call @stack_pop_pointer() : () -> i64
      %6389 = func.call @cc_cons(%6388, %6387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %6390 = arith.addi %6389, %__rlasp_stack_elide_zero_307 : i64
      %6391 = func.call @stack_pop_pointer() : () -> i64
      %6392 = func.call @cc_cons(%6391, %6390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %6393 = arith.addi %6392, %__rlasp_stack_elide_zero_308 : i64
      %6394 = func.call @stack_pop_pointer() : () -> i64
      %6395 = func.call @cc_cons(%6394, %6393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6396 = func.call @stack_pop_pointer() : () -> i64
      %6397 = func.call @stack_pop_pointer() : () -> i64
      %6398 = func.call @cc_cons(%6397, %6396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %6399 = arith.addi %6398, %__rlasp_stack_elide_zero_309 : i64
      %6400 = func.call @stack_pop_pointer() : () -> i64
      %6401 = func.call @cc_cons(%6400, %6399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6402 = func.call @stack_pop_pointer() : () -> i64
      %6403 = func.call @stack_pop_pointer() : () -> i64
      %6404 = func.call @cc_cons(%6403, %6402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6404) : (i64) -> ()
      %6405 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6406 = arith.constant 2 : i64
      %6407 = func.call @cc_make_string(%6405, %6406) : (!llvm.ptr, i64) -> i64
      %6408 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6409 = arith.constant 11 : i64
      %6410 = func.call @cc_make_string(%6408, %6409) : (!llvm.ptr, i64) -> i64
      %6411 = func.call @cc_intern(%6407, %6410) : (i64, i64) -> i64
      %6412 = func.call @cc_nil_value() : () -> i64
      %6413 = func.call @cc_cons(%6411, %6412) : (i64, i64) -> i64
      %6414 = func.call @cc_values_pack(%6413) : (i64) -> i64
      func.call @stack_push_pointer(%6411) : (i64) -> ()
      %6415 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6416 = arith.constant 6 : i64
      %6417 = func.call @cc_make_string(%6415, %6416) : (!llvm.ptr, i64) -> i64
      %6418 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6419 = arith.constant 11 : i64
      %6420 = func.call @cc_make_string(%6418, %6419) : (!llvm.ptr, i64) -> i64
      %6421 = func.call @cc_intern(%6417, %6420) : (i64, i64) -> i64
      %6422 = func.call @cc_nil_value() : () -> i64
      %6423 = func.call @cc_cons(%6421, %6422) : (i64, i64) -> i64
      %6424 = func.call @cc_values_pack(%6423) : (i64) -> i64
      func.call @stack_push_pointer(%6421) : (i64) -> ()
      %6425 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6426 = arith.constant 12 : i64
      %6427 = func.call @cc_make_string(%6425, %6426) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6427) : (i64) -> ()
      %6428 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6429 = arith.constant 7 : i64
      %6430 = func.call @cc_make_string(%6428, %6429) : (!llvm.ptr, i64) -> i64
      %6431 = func.call @cc_nil_value() : () -> i64
      %6432 = func.call @cc_intern(%6430, %6431) : (i64, i64) -> i64
      %6433 = func.call @cc_nil_value() : () -> i64
      %6434 = func.call @cc_cons(%6432, %6433) : (i64, i64) -> i64
      %6435 = func.call @cc_values_pack(%6434) : (i64) -> i64
      func.call @stack_push_pointer(%6432) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6436 = func.call @stack_pop_pointer() : () -> i64
      %6437 = func.call @stack_pop_pointer() : () -> i64
      %6438 = func.call @cc_cons(%6437, %6436) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %6439 = arith.addi %6438, %__rlasp_stack_elide_zero_310 : i64
      %6440 = func.call @stack_pop_pointer() : () -> i64
      %6441 = func.call @cc_cons(%6440, %6439) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %6442 = arith.addi %6441, %__rlasp_stack_elide_zero_311 : i64
      %6443 = func.call @stack_pop_pointer() : () -> i64
      %6444 = func.call @cc_cons(%6443, %6442) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6444) : (i64) -> ()
      %6445 = llvm.mlir.addressof @str544 : !llvm.ptr
      %6446 = arith.constant 6 : i64
      %6447 = func.call @cc_make_string(%6445, %6446) : (!llvm.ptr, i64) -> i64
      %6448 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6449 = arith.constant 11 : i64
      %6450 = func.call @cc_make_string(%6448, %6449) : (!llvm.ptr, i64) -> i64
      %6451 = func.call @cc_intern(%6447, %6450) : (i64, i64) -> i64
      %6452 = func.call @cc_nil_value() : () -> i64
      %6453 = func.call @cc_cons(%6451, %6452) : (i64, i64) -> i64
      %6454 = func.call @cc_values_pack(%6453) : (i64) -> i64
      func.call @stack_push_pointer(%6451) : (i64) -> ()
      %6455 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6456 = arith.constant 15 : i64
      %6457 = func.call @cc_make_string(%6455, %6456) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6457) : (i64) -> ()
      %6458 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6459 = arith.constant 7 : i64
      %6460 = func.call @cc_make_string(%6458, %6459) : (!llvm.ptr, i64) -> i64
      %6461 = func.call @cc_nil_value() : () -> i64
      %6462 = func.call @cc_intern(%6460, %6461) : (i64, i64) -> i64
      %6463 = func.call @cc_nil_value() : () -> i64
      %6464 = func.call @cc_cons(%6462, %6463) : (i64, i64) -> i64
      %6465 = func.call @cc_values_pack(%6464) : (i64) -> i64
      func.call @stack_push_pointer(%6462) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6466 = func.call @stack_pop_pointer() : () -> i64
      %6467 = func.call @stack_pop_pointer() : () -> i64
      %6468 = func.call @cc_cons(%6467, %6466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %6469 = arith.addi %6468, %__rlasp_stack_elide_zero_312 : i64
      %6470 = func.call @stack_pop_pointer() : () -> i64
      %6471 = func.call @cc_cons(%6470, %6469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %6472 = arith.addi %6471, %__rlasp_stack_elide_zero_313 : i64
      %6473 = func.call @stack_pop_pointer() : () -> i64
      %6474 = func.call @cc_cons(%6473, %6472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6475 = func.call @stack_pop_pointer() : () -> i64
      %6476 = func.call @stack_pop_pointer() : () -> i64
      %6477 = func.call @cc_cons(%6476, %6475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %6478 = arith.addi %6477, %__rlasp_stack_elide_zero_314 : i64
      %6479 = func.call @stack_pop_pointer() : () -> i64
      %6480 = func.call @cc_cons(%6479, %6478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %6481 = arith.addi %6480, %__rlasp_stack_elide_zero_315 : i64
      %6482 = func.call @stack_pop_pointer() : () -> i64
      %6483 = func.call @cc_cons(%6482, %6481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6484 = func.call @stack_pop_pointer() : () -> i64
      %6485 = func.call @stack_pop_pointer() : () -> i64
      %6486 = func.call @cc_cons(%6485, %6484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %6487 = arith.addi %6486, %__rlasp_stack_elide_zero_316 : i64
      %6488 = func.call @stack_pop_pointer() : () -> i64
      %6489 = func.call @cc_cons(%6488, %6487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %6490 = arith.addi %6489, %__rlasp_stack_elide_zero_317 : i64
      %6491 = func.call @stack_pop_pointer() : () -> i64
      %6492 = func.call @cc_cons(%6491, %6490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6493 = func.call @stack_pop_pointer() : () -> i64
      %6494 = func.call @stack_pop_pointer() : () -> i64
      %6495 = func.call @cc_cons(%6494, %6493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %6496 = arith.addi %6495, %__rlasp_stack_elide_zero_318 : i64
      %6497 = func.call @stack_pop_pointer() : () -> i64
      %6498 = func.call @cc_cons(%6497, %6496) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6498) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6499 = func.call @stack_pop_pointer() : () -> i64
      %6500 = func.call @stack_pop_pointer() : () -> i64
      %6501 = func.call @cc_cons(%6500, %6499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %6502 = arith.addi %6501, %__rlasp_stack_elide_zero_319 : i64
      %6503 = func.call @stack_pop_pointer() : () -> i64
      %6504 = func.call @cc_cons(%6503, %6502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %6505 = arith.addi %6504, %__rlasp_stack_elide_zero_320 : i64
      %6647 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6648 = arith.constant 29 : i64
      %6649 = func.call @cc_make_symbol(%6647, %6648) : (!llvm.ptr, i64) -> i64
      %6650 = func.call @cc_persistent_root_value(%6649) : (i64) -> i64
      func.call @stack_push_pointer(%6650) : (i64) -> ()
      %6651 = arith.constant 15079495958549 : i64
      %6652 = arith.constant 1 : i64
      %6653 = func.call @cc_make_closure(%6651, %6652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %6654 = arith.addi %6653, %__rlasp_stack_elide_zero_321 : i64
      %6655 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6656 = arith.constant 1 : i64
      %6657 = func.call @cc_make_string(%6655, %6656) : (!llvm.ptr, i64) -> i64
      %6658 = func.call @cc_nil_value() : () -> i64
      %6659 = func.call @cc_intern(%6657, %6658) : (i64, i64) -> i64
      %6660 = func.call @cc_nil_value() : () -> i64
      %6661 = func.call @cc_cons(%6659, %6660) : (i64, i64) -> i64
      %6662 = func.call @cc_values_pack(%6661) : (i64) -> i64
      func.call @stack_push_pointer(%6659) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6663 = func.call @stack_pop_pointer() : () -> i64
      %6664 = func.call @stack_pop_pointer() : () -> i64
      %6665 = func.call @cc_cons(%6664, %6663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %6666 = arith.addi %6665, %__rlasp_stack_elide_zero_322 : i64
      %6667 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6668 = arith.constant 11 : i64
      %6669 = func.call @cc_make_string(%6667, %6668) : (!llvm.ptr, i64) -> i64
      %6670 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6671 = arith.constant 7 : i64
      %6672 = func.call @cc_make_string(%6670, %6671) : (!llvm.ptr, i64) -> i64
      %6673 = func.call @cc_intern(%6669, %6672) : (i64, i64) -> i64
      %6674 = func.call @cc_nil_value() : () -> i64
      %6675 = func.call @cc_cons(%6673, %6674) : (i64, i64) -> i64
      %6676 = func.call @cc_values_pack(%6675) : (i64) -> i64
      %6677 = func.call @cc_nil_value() : () -> i64
      %6678 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6679 = arith.constant 4 : i64
      %6680 = func.call @cc_make_string(%6678, %6679) : (!llvm.ptr, i64) -> i64
      %6681 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6682 = arith.constant 7 : i64
      %6683 = func.call @cc_make_string(%6681, %6682) : (!llvm.ptr, i64) -> i64
      %6684 = func.call @cc_intern(%6680, %6683) : (i64, i64) -> i64
      %6685 = func.call @cc_nil_value() : () -> i64
      %6686 = func.call @cc_cons(%6684, %6685) : (i64, i64) -> i64
      %6687 = func.call @cc_values_pack(%6686) : (i64) -> i64
      %6688 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6689 = arith.constant 6 : i64
      %6690 = func.call @cc_make_string(%6688, %6689) : (!llvm.ptr, i64) -> i64
      %6691 = func.call @cc_nil_value() : () -> i64
      %6692 = func.call @cc_intern(%6690, %6691) : (i64, i64) -> i64
      %6693 = func.call @cc_nil_value() : () -> i64
      %6694 = func.call @cc_cons(%6692, %6693) : (i64, i64) -> i64
      %6695 = func.call @cc_values_pack(%6694) : (i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %6696 = arith.addi %6692, %__rlasp_stack_elide_zero_323 : i64
      %6697 = func.call @cc_nil_value() : () -> i64
      %6698 = func.call @cc_errorp(%6142) : (i64) -> i64
      %6699 = arith.cmpi ne, %6698, %6697 : i64
      %6700 = arith.cmpi eq, %6697, %6697 : i64
      %6701 = arith.andi %6699, %6700 : i1
      %6702 = scf.if %6701 -> (i64) {
        scf.yield %6142 : i64
      } else {
        scf.yield %6697 : i64
      }
      %6703 = func.call @cc_errorp(%6505) : (i64) -> i64
      %6704 = arith.cmpi ne, %6703, %6697 : i64
      %6705 = arith.cmpi eq, %6702, %6697 : i64
      %6706 = arith.andi %6704, %6705 : i1
      %6707 = scf.if %6706 -> (i64) {
        scf.yield %6505 : i64
      } else {
        scf.yield %6702 : i64
      }
      %6708 = func.call @cc_errorp(%6654) : (i64) -> i64
      %6709 = arith.cmpi ne, %6708, %6697 : i64
      %6710 = arith.cmpi eq, %6707, %6697 : i64
      %6711 = arith.andi %6709, %6710 : i1
      %6712 = scf.if %6711 -> (i64) {
        scf.yield %6654 : i64
      } else {
        scf.yield %6707 : i64
      }
      %6713 = func.call @cc_errorp(%6666) : (i64) -> i64
      %6714 = arith.cmpi ne, %6713, %6697 : i64
      %6715 = arith.cmpi eq, %6712, %6697 : i64
      %6716 = arith.andi %6714, %6715 : i1
      %6717 = scf.if %6716 -> (i64) {
        scf.yield %6666 : i64
      } else {
        scf.yield %6712 : i64
      }
      %6718 = func.call @cc_errorp(%6673) : (i64) -> i64
      %6719 = arith.cmpi ne, %6718, %6697 : i64
      %6720 = arith.cmpi eq, %6717, %6697 : i64
      %6721 = arith.andi %6719, %6720 : i1
      %6722 = scf.if %6721 -> (i64) {
        scf.yield %6673 : i64
      } else {
        scf.yield %6717 : i64
      }
      %6723 = func.call @cc_errorp(%6677) : (i64) -> i64
      %6724 = arith.cmpi ne, %6723, %6697 : i64
      %6725 = arith.cmpi eq, %6722, %6697 : i64
      %6726 = arith.andi %6724, %6725 : i1
      %6727 = scf.if %6726 -> (i64) {
        scf.yield %6677 : i64
      } else {
        scf.yield %6722 : i64
      }
      %6728 = func.call @cc_errorp(%6684) : (i64) -> i64
      %6729 = arith.cmpi ne, %6728, %6697 : i64
      %6730 = arith.cmpi eq, %6727, %6697 : i64
      %6731 = arith.andi %6729, %6730 : i1
      %6732 = scf.if %6731 -> (i64) {
        scf.yield %6684 : i64
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
        func.call @stack_push_pointer(%6142) : (i64) -> ()
        func.call @stack_push_pointer(%6505) : (i64) -> ()
        func.call @stack_push_pointer(%6654) : (i64) -> ()
        func.call @stack_push_pointer(%6666) : (i64) -> ()
        func.call @stack_push_pointer(%6673) : (i64) -> ()
        func.call @stack_push_pointer(%6677) : (i64) -> ()
        func.call @stack_push_pointer(%6684) : (i64) -> ()
        func.call @stack_push_pointer(%6696) : (i64) -> ()
        %6739 = llvm.mlir.addressof @str566 : !llvm.ptr
        %6740 = func.call @cc_make_function_ref_const(%6739) : (!llvm.ptr) -> i64
        %6741 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6740, %6741) : (i64, i64) -> ()
      }
      %6742 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6742 : i64
    }
    %6743 = func.call @cc_nil_value() : () -> i64
    %6744 = func.call @cc_errorp(%6133) : (i64) -> i64
    %6745 = arith.cmpi ne, %6744, %6743 : i64
    %6746 = scf.if %6745 -> (i64) {
      scf.yield %6133 : i64
    } else {
      %6747 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6748 = arith.constant 24 : i64
      %6749 = func.call @cc_make_string(%6747, %6748) : (!llvm.ptr, i64) -> i64
      %6750 = func.call @cc_nil_value() : () -> i64
      %6751 = func.call @cc_intern(%6749, %6750) : (i64, i64) -> i64
      %6752 = func.call @cc_nil_value() : () -> i64
      %6753 = func.call @cc_cons(%6751, %6752) : (i64, i64) -> i64
      %6754 = func.call @cc_values_pack(%6753) : (i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %6755 = arith.addi %6751, %__rlasp_stack_elide_zero_324 : i64
      %6756 = llvm.mlir.addressof @str568 : !llvm.ptr
      %6757 = arith.constant 3 : i64
      %6758 = func.call @cc_make_string(%6756, %6757) : (!llvm.ptr, i64) -> i64
      %6759 = func.call @cc_nil_value() : () -> i64
      %6760 = func.call @cc_intern(%6758, %6759) : (i64, i64) -> i64
      %6761 = func.call @cc_nil_value() : () -> i64
      %6762 = func.call @cc_cons(%6760, %6761) : (i64, i64) -> i64
      %6763 = func.call @cc_values_pack(%6762) : (i64) -> i64
      func.call @stack_push_pointer(%6760) : (i64) -> ()
      %6764 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6765 = arith.constant 3 : i64
      %6766 = func.call @cc_make_string(%6764, %6765) : (!llvm.ptr, i64) -> i64
      %6767 = func.call @cc_nil_value() : () -> i64
      %6768 = func.call @cc_intern(%6766, %6767) : (i64, i64) -> i64
      %6769 = func.call @cc_nil_value() : () -> i64
      %6770 = func.call @cc_cons(%6768, %6769) : (i64, i64) -> i64
      %6771 = func.call @cc_values_pack(%6770) : (i64) -> i64
      func.call @stack_push_pointer(%6768) : (i64) -> ()
      %6772 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6773 = arith.constant 3 : i64
      %6774 = func.call @cc_make_string(%6772, %6773) : (!llvm.ptr, i64) -> i64
      %6775 = func.call @cc_nil_value() : () -> i64
      %6776 = func.call @cc_intern(%6774, %6775) : (i64, i64) -> i64
      %6777 = func.call @cc_nil_value() : () -> i64
      %6778 = func.call @cc_cons(%6776, %6777) : (i64, i64) -> i64
      %6779 = func.call @cc_values_pack(%6778) : (i64) -> i64
      func.call @stack_push_pointer(%6776) : (i64) -> ()
      %6780 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6781 = arith.constant 9 : i64
      %6782 = func.call @cc_make_string(%6780, %6781) : (!llvm.ptr, i64) -> i64
      %6783 = func.call @cc_nil_value() : () -> i64
      %6784 = func.call @cc_intern(%6782, %6783) : (i64, i64) -> i64
      %6785 = func.call @cc_nil_value() : () -> i64
      %6786 = func.call @cc_cons(%6784, %6785) : (i64, i64) -> i64
      %6787 = func.call @cc_values_pack(%6786) : (i64) -> i64
      func.call @stack_push_pointer(%6784) : (i64) -> ()
      %6788 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6789 = arith.constant 10 : i64
      %6790 = func.call @cc_make_string(%6788, %6789) : (!llvm.ptr, i64) -> i64
      %6791 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6792 = arith.constant 11 : i64
      %6793 = func.call @cc_make_string(%6791, %6792) : (!llvm.ptr, i64) -> i64
      %6794 = func.call @cc_intern(%6790, %6793) : (i64, i64) -> i64
      %6795 = func.call @cc_nil_value() : () -> i64
      %6796 = func.call @cc_cons(%6794, %6795) : (i64, i64) -> i64
      %6797 = func.call @cc_values_pack(%6796) : (i64) -> i64
      func.call @stack_push_pointer(%6794) : (i64) -> ()
      %6798 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6798) : (i64) -> ()
      %6799 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%6799) : (i64) -> ()
      %6800 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%6800) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6801 = func.call @stack_pop_pointer() : () -> i64
      %6802 = func.call @stack_pop_pointer() : () -> i64
      %6803 = func.call @cc_cons(%6802, %6801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %6804 = arith.addi %6803, %__rlasp_stack_elide_zero_325 : i64
      %6805 = func.call @stack_pop_pointer() : () -> i64
      %6806 = func.call @cc_cons(%6805, %6804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %6807 = arith.addi %6806, %__rlasp_stack_elide_zero_326 : i64
      %6808 = func.call @stack_pop_pointer() : () -> i64
      %6809 = func.call @cc_cons(%6807, %6808) : (i64, i64) -> i64
      %6810 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6811 = arith.constant 5 : i64
      %6812 = func.call @cc_make_string(%6810, %6811) : (!llvm.ptr, i64) -> i64
      %6813 = func.call @cc_nil_value() : () -> i64
      %6814 = func.call @cc_intern(%6812, %6813) : (i64, i64) -> i64
      %6815 = func.call @cc_nil_value() : () -> i64
      %6816 = func.call @cc_cons(%6814, %6815) : (i64, i64) -> i64
      %6817 = func.call @cc_values_pack(%6816) : (i64) -> i64
      %6818 = func.call @cc_cons(%6814, %6809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6818) : (i64) -> ()
      %6819 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6820 = arith.constant 12 : i64
      %6821 = func.call @cc_make_string(%6819, %6820) : (!llvm.ptr, i64) -> i64
      %6822 = llvm.mlir.addressof @str576 : !llvm.ptr
      %6823 = arith.constant 7 : i64
      %6824 = func.call @cc_make_string(%6822, %6823) : (!llvm.ptr, i64) -> i64
      %6825 = func.call @cc_intern(%6821, %6824) : (i64, i64) -> i64
      %6826 = func.call @cc_nil_value() : () -> i64
      %6827 = func.call @cc_cons(%6825, %6826) : (i64, i64) -> i64
      %6828 = func.call @cc_values_pack(%6827) : (i64) -> i64
      func.call @stack_push_pointer(%6825) : (i64) -> ()
      %6829 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6829) : (i64) -> ()
      %6830 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6831 = arith.constant 9 : i64
      %6832 = func.call @cc_make_string(%6830, %6831) : (!llvm.ptr, i64) -> i64
      %6833 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6834 = arith.constant 11 : i64
      %6835 = func.call @cc_make_string(%6833, %6834) : (!llvm.ptr, i64) -> i64
      %6836 = func.call @cc_intern(%6832, %6835) : (i64, i64) -> i64
      %6837 = func.call @cc_nil_value() : () -> i64
      %6838 = func.call @cc_cons(%6836, %6837) : (i64, i64) -> i64
      %6839 = func.call @cc_values_pack(%6838) : (i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %6840 = arith.addi %6836, %__rlasp_stack_elide_zero_327 : i64
      %6841 = func.call @stack_pop_pointer() : () -> i64
      %6842 = func.call @cc_cons(%6840, %6841) : (i64, i64) -> i64
      %6843 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6844 = arith.constant 5 : i64
      %6845 = func.call @cc_make_string(%6843, %6844) : (!llvm.ptr, i64) -> i64
      %6846 = func.call @cc_nil_value() : () -> i64
      %6847 = func.call @cc_intern(%6845, %6846) : (i64, i64) -> i64
      %6848 = func.call @cc_nil_value() : () -> i64
      %6849 = func.call @cc_cons(%6847, %6848) : (i64, i64) -> i64
      %6850 = func.call @cc_values_pack(%6849) : (i64) -> i64
      %6851 = func.call @cc_cons(%6847, %6842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6851) : (i64) -> ()
      %6852 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6853 = arith.constant 16 : i64
      %6854 = func.call @cc_make_string(%6852, %6853) : (!llvm.ptr, i64) -> i64
      %6855 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6856 = arith.constant 7 : i64
      %6857 = func.call @cc_make_string(%6855, %6856) : (!llvm.ptr, i64) -> i64
      %6858 = func.call @cc_intern(%6854, %6857) : (i64, i64) -> i64
      %6859 = func.call @cc_nil_value() : () -> i64
      %6860 = func.call @cc_cons(%6858, %6859) : (i64, i64) -> i64
      %6861 = func.call @cc_values_pack(%6860) : (i64) -> i64
      func.call @stack_push_pointer(%6858) : (i64) -> ()
      %6862 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6862) : (i64) -> ()
      %6863 = arith.constant 97 : i64
      %6864 = func.call @cc_box_character(%6863) : (i64) -> i64
      func.call @stack_push_pointer(%6864) : (i64) -> ()
      %6865 = arith.constant 98 : i64
      %6866 = func.call @cc_box_character(%6865) : (i64) -> i64
      func.call @stack_push_pointer(%6866) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6867 = func.call @stack_pop_pointer() : () -> i64
      %6868 = func.call @stack_pop_pointer() : () -> i64
      %6869 = func.call @cc_cons(%6868, %6867) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %6870 = arith.addi %6869, %__rlasp_stack_elide_zero_328 : i64
      %6871 = func.call @stack_pop_pointer() : () -> i64
      %6872 = func.call @cc_cons(%6871, %6870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6872) : (i64) -> ()
      %6873 = arith.constant 99 : i64
      %6874 = func.call @cc_box_character(%6873) : (i64) -> i64
      func.call @stack_push_pointer(%6874) : (i64) -> ()
      %6875 = arith.constant 100 : i64
      %6876 = func.call @cc_box_character(%6875) : (i64) -> i64
      func.call @stack_push_pointer(%6876) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6877 = func.call @stack_pop_pointer() : () -> i64
      %6878 = func.call @stack_pop_pointer() : () -> i64
      %6879 = func.call @cc_cons(%6878, %6877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %6880 = arith.addi %6879, %__rlasp_stack_elide_zero_329 : i64
      %6881 = func.call @stack_pop_pointer() : () -> i64
      %6882 = func.call @cc_cons(%6881, %6880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6883 = func.call @stack_pop_pointer() : () -> i64
      %6884 = func.call @stack_pop_pointer() : () -> i64
      %6885 = func.call @cc_cons(%6884, %6883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %6886 = arith.addi %6885, %__rlasp_stack_elide_zero_330 : i64
      %6887 = func.call @stack_pop_pointer() : () -> i64
      %6888 = func.call @cc_cons(%6887, %6886) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %6889 = arith.addi %6888, %__rlasp_stack_elide_zero_331 : i64
      %6890 = func.call @stack_pop_pointer() : () -> i64
      %6891 = func.call @cc_cons(%6889, %6890) : (i64, i64) -> i64
      %6892 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6893 = arith.constant 5 : i64
      %6894 = func.call @cc_make_string(%6892, %6893) : (!llvm.ptr, i64) -> i64
      %6895 = func.call @cc_nil_value() : () -> i64
      %6896 = func.call @cc_intern(%6894, %6895) : (i64, i64) -> i64
      %6897 = func.call @cc_nil_value() : () -> i64
      %6898 = func.call @cc_cons(%6896, %6897) : (i64, i64) -> i64
      %6899 = func.call @cc_values_pack(%6898) : (i64) -> i64
      %6900 = func.call @cc_cons(%6896, %6891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6900) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6901 = func.call @stack_pop_pointer() : () -> i64
      %6902 = func.call @stack_pop_pointer() : () -> i64
      %6903 = func.call @cc_cons(%6902, %6901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %6904 = arith.addi %6903, %__rlasp_stack_elide_zero_332 : i64
      %6905 = func.call @stack_pop_pointer() : () -> i64
      %6906 = func.call @cc_cons(%6905, %6904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %6907 = arith.addi %6906, %__rlasp_stack_elide_zero_333 : i64
      %6908 = func.call @stack_pop_pointer() : () -> i64
      %6909 = func.call @cc_cons(%6908, %6907) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %6910 = arith.addi %6909, %__rlasp_stack_elide_zero_334 : i64
      %6911 = func.call @stack_pop_pointer() : () -> i64
      %6912 = func.call @cc_cons(%6911, %6910) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %6913 = arith.addi %6912, %__rlasp_stack_elide_zero_335 : i64
      %6914 = func.call @stack_pop_pointer() : () -> i64
      %6915 = func.call @cc_cons(%6914, %6913) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %6916 = arith.addi %6915, %__rlasp_stack_elide_zero_336 : i64
      %6917 = func.call @stack_pop_pointer() : () -> i64
      %6918 = func.call @cc_cons(%6917, %6916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6918) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6919 = func.call @stack_pop_pointer() : () -> i64
      %6920 = func.call @stack_pop_pointer() : () -> i64
      %6921 = func.call @cc_cons(%6920, %6919) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %6922 = arith.addi %6921, %__rlasp_stack_elide_zero_337 : i64
      %6923 = func.call @stack_pop_pointer() : () -> i64
      %6924 = func.call @cc_cons(%6923, %6922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6924) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6925 = func.call @stack_pop_pointer() : () -> i64
      %6926 = func.call @stack_pop_pointer() : () -> i64
      %6927 = func.call @cc_cons(%6926, %6925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6927) : (i64) -> ()
      %6928 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6929 = arith.constant 5 : i64
      %6930 = func.call @cc_make_string(%6928, %6929) : (!llvm.ptr, i64) -> i64
      %6931 = llvm.mlir.addressof @str584 : !llvm.ptr
      %6932 = arith.constant 11 : i64
      %6933 = func.call @cc_make_string(%6931, %6932) : (!llvm.ptr, i64) -> i64
      %6934 = func.call @cc_intern(%6930, %6933) : (i64, i64) -> i64
      %6935 = func.call @cc_nil_value() : () -> i64
      %6936 = func.call @cc_cons(%6934, %6935) : (i64, i64) -> i64
      %6937 = func.call @cc_values_pack(%6936) : (i64) -> i64
      func.call @stack_push_pointer(%6934) : (i64) -> ()
      %6938 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6939 = arith.constant 10 : i64
      %6940 = func.call @cc_make_string(%6938, %6939) : (!llvm.ptr, i64) -> i64
      %6941 = llvm.mlir.addressof @str586 : !llvm.ptr
      %6942 = arith.constant 11 : i64
      %6943 = func.call @cc_make_string(%6941, %6942) : (!llvm.ptr, i64) -> i64
      %6944 = func.call @cc_intern(%6940, %6943) : (i64, i64) -> i64
      %6945 = func.call @cc_nil_value() : () -> i64
      %6946 = func.call @cc_cons(%6944, %6945) : (i64, i64) -> i64
      %6947 = func.call @cc_values_pack(%6946) : (i64) -> i64
      func.call @stack_push_pointer(%6944) : (i64) -> ()
      %6948 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%6948) : (i64) -> ()
      %6949 = llvm.mlir.addressof @str587 : !llvm.ptr
      %6950 = arith.constant 12 : i64
      %6951 = func.call @cc_make_string(%6949, %6950) : (!llvm.ptr, i64) -> i64
      %6952 = llvm.mlir.addressof @str588 : !llvm.ptr
      %6953 = arith.constant 7 : i64
      %6954 = func.call @cc_make_string(%6952, %6953) : (!llvm.ptr, i64) -> i64
      %6955 = func.call @cc_intern(%6951, %6954) : (i64, i64) -> i64
      %6956 = func.call @cc_nil_value() : () -> i64
      %6957 = func.call @cc_cons(%6955, %6956) : (i64, i64) -> i64
      %6958 = func.call @cc_values_pack(%6957) : (i64) -> i64
      func.call @stack_push_pointer(%6955) : (i64) -> ()
      %6959 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6959) : (i64) -> ()
      %6960 = llvm.mlir.addressof @str589 : !llvm.ptr
      %6961 = arith.constant 9 : i64
      %6962 = func.call @cc_make_string(%6960, %6961) : (!llvm.ptr, i64) -> i64
      %6963 = llvm.mlir.addressof @str590 : !llvm.ptr
      %6964 = arith.constant 11 : i64
      %6965 = func.call @cc_make_string(%6963, %6964) : (!llvm.ptr, i64) -> i64
      %6966 = func.call @cc_intern(%6962, %6965) : (i64, i64) -> i64
      %6967 = func.call @cc_nil_value() : () -> i64
      %6968 = func.call @cc_cons(%6966, %6967) : (i64, i64) -> i64
      %6969 = func.call @cc_values_pack(%6968) : (i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %6970 = arith.addi %6966, %__rlasp_stack_elide_zero_338 : i64
      %6971 = func.call @stack_pop_pointer() : () -> i64
      %6972 = func.call @cc_cons(%6970, %6971) : (i64, i64) -> i64
      %6973 = llvm.mlir.addressof @str591 : !llvm.ptr
      %6974 = arith.constant 5 : i64
      %6975 = func.call @cc_make_string(%6973, %6974) : (!llvm.ptr, i64) -> i64
      %6976 = func.call @cc_nil_value() : () -> i64
      %6977 = func.call @cc_intern(%6975, %6976) : (i64, i64) -> i64
      %6978 = func.call @cc_nil_value() : () -> i64
      %6979 = func.call @cc_cons(%6977, %6978) : (i64, i64) -> i64
      %6980 = func.call @cc_values_pack(%6979) : (i64) -> i64
      %6981 = func.call @cc_cons(%6977, %6972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6981) : (i64) -> ()
      %6982 = llvm.mlir.addressof @str592 : !llvm.ptr
      %6983 = arith.constant 12 : i64
      %6984 = func.call @cc_make_string(%6982, %6983) : (!llvm.ptr, i64) -> i64
      %6985 = llvm.mlir.addressof @str593 : !llvm.ptr
      %6986 = arith.constant 7 : i64
      %6987 = func.call @cc_make_string(%6985, %6986) : (!llvm.ptr, i64) -> i64
      %6988 = func.call @cc_intern(%6984, %6987) : (i64, i64) -> i64
      %6989 = func.call @cc_nil_value() : () -> i64
      %6990 = func.call @cc_cons(%6988, %6989) : (i64, i64) -> i64
      %6991 = func.call @cc_values_pack(%6990) : (i64) -> i64
      func.call @stack_push_pointer(%6988) : (i64) -> ()
      %6992 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6993 = arith.constant 9 : i64
      %6994 = func.call @cc_make_string(%6992, %6993) : (!llvm.ptr, i64) -> i64
      %6995 = func.call @cc_nil_value() : () -> i64
      %6996 = func.call @cc_intern(%6994, %6995) : (i64, i64) -> i64
      %6997 = func.call @cc_nil_value() : () -> i64
      %6998 = func.call @cc_cons(%6996, %6997) : (i64, i64) -> i64
      %6999 = func.call @cc_values_pack(%6998) : (i64) -> i64
      func.call @stack_push_pointer(%6996) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7000 = func.call @stack_pop_pointer() : () -> i64
      %7001 = func.call @stack_pop_pointer() : () -> i64
      %7002 = func.call @cc_cons(%7001, %7000) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %7003 = arith.addi %7002, %__rlasp_stack_elide_zero_339 : i64
      %7004 = func.call @stack_pop_pointer() : () -> i64
      %7005 = func.call @cc_cons(%7004, %7003) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %7006 = arith.addi %7005, %__rlasp_stack_elide_zero_340 : i64
      %7007 = func.call @stack_pop_pointer() : () -> i64
      %7008 = func.call @cc_cons(%7007, %7006) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %7009 = arith.addi %7008, %__rlasp_stack_elide_zero_341 : i64
      %7010 = func.call @stack_pop_pointer() : () -> i64
      %7011 = func.call @cc_cons(%7010, %7009) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %7012 = arith.addi %7011, %__rlasp_stack_elide_zero_342 : i64
      %7013 = func.call @stack_pop_pointer() : () -> i64
      %7014 = func.call @cc_cons(%7013, %7012) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %7015 = arith.addi %7014, %__rlasp_stack_elide_zero_343 : i64
      %7016 = func.call @stack_pop_pointer() : () -> i64
      %7017 = func.call @cc_cons(%7016, %7015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7017) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7018 = func.call @stack_pop_pointer() : () -> i64
      %7019 = func.call @stack_pop_pointer() : () -> i64
      %7020 = func.call @cc_cons(%7019, %7018) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %7021 = arith.addi %7020, %__rlasp_stack_elide_zero_344 : i64
      %7022 = func.call @stack_pop_pointer() : () -> i64
      %7023 = func.call @cc_cons(%7022, %7021) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7023) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7024 = func.call @stack_pop_pointer() : () -> i64
      %7025 = func.call @stack_pop_pointer() : () -> i64
      %7026 = func.call @cc_cons(%7025, %7024) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %7027 = arith.addi %7026, %__rlasp_stack_elide_zero_345 : i64
      %7028 = func.call @stack_pop_pointer() : () -> i64
      %7029 = func.call @cc_cons(%7028, %7027) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %7030 = arith.addi %7029, %__rlasp_stack_elide_zero_346 : i64
      %7031 = func.call @stack_pop_pointer() : () -> i64
      %7032 = func.call @cc_cons(%7031, %7030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7032) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7033 = func.call @stack_pop_pointer() : () -> i64
      %7034 = func.call @stack_pop_pointer() : () -> i64
      %7035 = func.call @cc_cons(%7034, %7033) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %7036 = arith.addi %7035, %__rlasp_stack_elide_zero_347 : i64
      %7037 = func.call @stack_pop_pointer() : () -> i64
      %7038 = func.call @cc_cons(%7037, %7036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7038) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7039 = func.call @stack_pop_pointer() : () -> i64
      %7040 = func.call @stack_pop_pointer() : () -> i64
      %7041 = func.call @cc_cons(%7040, %7039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %7042 = arith.addi %7041, %__rlasp_stack_elide_zero_348 : i64
      %7043 = func.call @stack_pop_pointer() : () -> i64
      %7044 = func.call @cc_cons(%7043, %7042) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %7045 = arith.addi %7044, %__rlasp_stack_elide_zero_349 : i64
      %7237 = arith.constant 15079495958551 : i64
      %7238 = arith.constant 0 : i64
      %7239 = func.call @cc_make_closure(%7237, %7238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %7240 = arith.addi %7239, %__rlasp_stack_elide_zero_350 : i64
      %7241 = llvm.mlir.addressof @str609 : !llvm.ptr
      %7242 = arith.constant 1 : i64
      %7243 = func.call @cc_make_string(%7241, %7242) : (!llvm.ptr, i64) -> i64
      %7244 = func.call @cc_nil_value() : () -> i64
      %7245 = func.call @cc_intern(%7243, %7244) : (i64, i64) -> i64
      %7246 = func.call @cc_nil_value() : () -> i64
      %7247 = func.call @cc_cons(%7245, %7246) : (i64, i64) -> i64
      %7248 = func.call @cc_values_pack(%7247) : (i64) -> i64
      func.call @stack_push_pointer(%7245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7249 = func.call @stack_pop_pointer() : () -> i64
      %7250 = func.call @stack_pop_pointer() : () -> i64
      %7251 = func.call @cc_cons(%7250, %7249) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %7252 = arith.addi %7251, %__rlasp_stack_elide_zero_351 : i64
      %7253 = llvm.mlir.addressof @str610 : !llvm.ptr
      %7254 = arith.constant 11 : i64
      %7255 = func.call @cc_make_string(%7253, %7254) : (!llvm.ptr, i64) -> i64
      %7256 = llvm.mlir.addressof @str611 : !llvm.ptr
      %7257 = arith.constant 7 : i64
      %7258 = func.call @cc_make_string(%7256, %7257) : (!llvm.ptr, i64) -> i64
      %7259 = func.call @cc_intern(%7255, %7258) : (i64, i64) -> i64
      %7260 = func.call @cc_nil_value() : () -> i64
      %7261 = func.call @cc_cons(%7259, %7260) : (i64, i64) -> i64
      %7262 = func.call @cc_values_pack(%7261) : (i64) -> i64
      %7263 = func.call @cc_nil_value() : () -> i64
      %7264 = llvm.mlir.addressof @str612 : !llvm.ptr
      %7265 = arith.constant 4 : i64
      %7266 = func.call @cc_make_string(%7264, %7265) : (!llvm.ptr, i64) -> i64
      %7267 = llvm.mlir.addressof @str613 : !llvm.ptr
      %7268 = arith.constant 7 : i64
      %7269 = func.call @cc_make_string(%7267, %7268) : (!llvm.ptr, i64) -> i64
      %7270 = func.call @cc_intern(%7266, %7269) : (i64, i64) -> i64
      %7271 = func.call @cc_nil_value() : () -> i64
      %7272 = func.call @cc_cons(%7270, %7271) : (i64, i64) -> i64
      %7273 = func.call @cc_values_pack(%7272) : (i64) -> i64
      %7274 = llvm.mlir.addressof @str614 : !llvm.ptr
      %7275 = arith.constant 6 : i64
      %7276 = func.call @cc_make_string(%7274, %7275) : (!llvm.ptr, i64) -> i64
      %7277 = func.call @cc_nil_value() : () -> i64
      %7278 = func.call @cc_intern(%7276, %7277) : (i64, i64) -> i64
      %7279 = func.call @cc_nil_value() : () -> i64
      %7280 = func.call @cc_cons(%7278, %7279) : (i64, i64) -> i64
      %7281 = func.call @cc_values_pack(%7280) : (i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %7282 = arith.addi %7278, %__rlasp_stack_elide_zero_352 : i64
      %7283 = func.call @cc_nil_value() : () -> i64
      %7284 = func.call @cc_errorp(%6755) : (i64) -> i64
      %7285 = arith.cmpi ne, %7284, %7283 : i64
      %7286 = arith.cmpi eq, %7283, %7283 : i64
      %7287 = arith.andi %7285, %7286 : i1
      %7288 = scf.if %7287 -> (i64) {
        scf.yield %6755 : i64
      } else {
        scf.yield %7283 : i64
      }
      %7289 = func.call @cc_errorp(%7045) : (i64) -> i64
      %7290 = arith.cmpi ne, %7289, %7283 : i64
      %7291 = arith.cmpi eq, %7288, %7283 : i64
      %7292 = arith.andi %7290, %7291 : i1
      %7293 = scf.if %7292 -> (i64) {
        scf.yield %7045 : i64
      } else {
        scf.yield %7288 : i64
      }
      %7294 = func.call @cc_errorp(%7240) : (i64) -> i64
      %7295 = arith.cmpi ne, %7294, %7283 : i64
      %7296 = arith.cmpi eq, %7293, %7283 : i64
      %7297 = arith.andi %7295, %7296 : i1
      %7298 = scf.if %7297 -> (i64) {
        scf.yield %7240 : i64
      } else {
        scf.yield %7293 : i64
      }
      %7299 = func.call @cc_errorp(%7252) : (i64) -> i64
      %7300 = arith.cmpi ne, %7299, %7283 : i64
      %7301 = arith.cmpi eq, %7298, %7283 : i64
      %7302 = arith.andi %7300, %7301 : i1
      %7303 = scf.if %7302 -> (i64) {
        scf.yield %7252 : i64
      } else {
        scf.yield %7298 : i64
      }
      %7304 = func.call @cc_errorp(%7259) : (i64) -> i64
      %7305 = arith.cmpi ne, %7304, %7283 : i64
      %7306 = arith.cmpi eq, %7303, %7283 : i64
      %7307 = arith.andi %7305, %7306 : i1
      %7308 = scf.if %7307 -> (i64) {
        scf.yield %7259 : i64
      } else {
        scf.yield %7303 : i64
      }
      %7309 = func.call @cc_errorp(%7263) : (i64) -> i64
      %7310 = arith.cmpi ne, %7309, %7283 : i64
      %7311 = arith.cmpi eq, %7308, %7283 : i64
      %7312 = arith.andi %7310, %7311 : i1
      %7313 = scf.if %7312 -> (i64) {
        scf.yield %7263 : i64
      } else {
        scf.yield %7308 : i64
      }
      %7314 = func.call @cc_errorp(%7270) : (i64) -> i64
      %7315 = arith.cmpi ne, %7314, %7283 : i64
      %7316 = arith.cmpi eq, %7313, %7283 : i64
      %7317 = arith.andi %7315, %7316 : i1
      %7318 = scf.if %7317 -> (i64) {
        scf.yield %7270 : i64
      } else {
        scf.yield %7313 : i64
      }
      %7319 = func.call @cc_errorp(%7282) : (i64) -> i64
      %7320 = arith.cmpi ne, %7319, %7283 : i64
      %7321 = arith.cmpi eq, %7318, %7283 : i64
      %7322 = arith.andi %7320, %7321 : i1
      %7323 = scf.if %7322 -> (i64) {
        scf.yield %7282 : i64
      } else {
        scf.yield %7318 : i64
      }
      %7324 = arith.cmpi ne, %7323, %7283 : i64
      scf.if %7324 {
        func.call @stack_push_pointer(%7323) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6755) : (i64) -> ()
        func.call @stack_push_pointer(%7045) : (i64) -> ()
        func.call @stack_push_pointer(%7240) : (i64) -> ()
        func.call @stack_push_pointer(%7252) : (i64) -> ()
        func.call @stack_push_pointer(%7259) : (i64) -> ()
        func.call @stack_push_pointer(%7263) : (i64) -> ()
        func.call @stack_push_pointer(%7270) : (i64) -> ()
        func.call @stack_push_pointer(%7282) : (i64) -> ()
        %7325 = llvm.mlir.addressof @str615 : !llvm.ptr
        %7326 = func.call @cc_make_function_ref_const(%7325) : (!llvm.ptr) -> i64
        %7327 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7326, %7327) : (i64, i64) -> ()
      }
      %7328 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7328 : i64
    }
    %7329 = func.call @cc_nil_value() : () -> i64
    %7330 = func.call @cc_errorp(%6746) : (i64) -> i64
    %7331 = arith.cmpi ne, %7330, %7329 : i64
    %7332 = scf.if %7331 -> (i64) {
      scf.yield %6746 : i64
    } else {
      %7333 = llvm.mlir.addressof @str616 : !llvm.ptr
      %7334 = arith.constant 13 : i64
      %7335 = func.call @cc_make_string(%7333, %7334) : (!llvm.ptr, i64) -> i64
      %7336 = func.call @cc_nil_value() : () -> i64
      %7337 = func.call @cc_intern(%7335, %7336) : (i64, i64) -> i64
      %7338 = func.call @cc_nil_value() : () -> i64
      %7339 = func.call @cc_cons(%7337, %7338) : (i64, i64) -> i64
      %7340 = func.call @cc_values_pack(%7339) : (i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %7341 = arith.addi %7337, %__rlasp_stack_elide_zero_353 : i64
      %7342 = llvm.mlir.addressof @str617 : !llvm.ptr
      %7343 = arith.constant 13 : i64
      %7344 = func.call @cc_make_string(%7342, %7343) : (!llvm.ptr, i64) -> i64
      %7345 = llvm.mlir.addressof @str618 : !llvm.ptr
      %7346 = arith.constant 11 : i64
      %7347 = func.call @cc_make_string(%7345, %7346) : (!llvm.ptr, i64) -> i64
      %7348 = func.call @cc_intern(%7344, %7347) : (i64, i64) -> i64
      %7349 = func.call @cc_nil_value() : () -> i64
      %7350 = func.call @cc_cons(%7348, %7349) : (i64, i64) -> i64
      %7351 = func.call @cc_values_pack(%7350) : (i64) -> i64
      func.call @stack_push_pointer(%7348) : (i64) -> ()
      %7352 = llvm.mlir.addressof @str619 : !llvm.ptr
      %7353 = arith.constant 6 : i64
      %7354 = func.call @cc_make_string(%7352, %7353) : (!llvm.ptr, i64) -> i64
      %7355 = func.call @cc_nil_value() : () -> i64
      %7356 = func.call @cc_intern(%7354, %7355) : (i64, i64) -> i64
      %7357 = func.call @cc_nil_value() : () -> i64
      %7358 = func.call @cc_cons(%7356, %7357) : (i64, i64) -> i64
      %7359 = func.call @cc_values_pack(%7358) : (i64) -> i64
      func.call @stack_push_pointer(%7356) : (i64) -> ()
      %7360 = llvm.mlir.addressof @str620 : !llvm.ptr
      %7361 = arith.constant 19 : i64
      %7362 = func.call @cc_make_string(%7360, %7361) : (!llvm.ptr, i64) -> i64
      %7363 = func.call @cc_nil_value() : () -> i64
      %7364 = func.call @cc_intern(%7362, %7363) : (i64, i64) -> i64
      %7365 = func.call @cc_nil_value() : () -> i64
      %7366 = func.call @cc_cons(%7364, %7365) : (i64, i64) -> i64
      %7367 = func.call @cc_values_pack(%7366) : (i64) -> i64
      func.call @stack_push_pointer(%7364) : (i64) -> ()
      %7368 = llvm.mlir.addressof @str621 : !llvm.ptr
      %7369 = arith.constant 10 : i64
      %7370 = func.call @cc_make_string(%7368, %7369) : (!llvm.ptr, i64) -> i64
      %7371 = llvm.mlir.addressof @str622 : !llvm.ptr
      %7372 = arith.constant 11 : i64
      %7373 = func.call @cc_make_string(%7371, %7372) : (!llvm.ptr, i64) -> i64
      %7374 = func.call @cc_intern(%7370, %7373) : (i64, i64) -> i64
      %7375 = func.call @cc_nil_value() : () -> i64
      %7376 = func.call @cc_cons(%7374, %7375) : (i64, i64) -> i64
      %7377 = func.call @cc_values_pack(%7376) : (i64) -> i64
      func.call @stack_push_pointer(%7374) : (i64) -> ()
      %7378 = llvm.mlir.addressof @str623 : !llvm.ptr
      %7379 = arith.constant 2 : i64
      %7380 = func.call @cc_make_string(%7378, %7379) : (!llvm.ptr, i64) -> i64
      %7381 = llvm.mlir.addressof @str624 : !llvm.ptr
      %7382 = arith.constant 11 : i64
      %7383 = func.call @cc_make_string(%7381, %7382) : (!llvm.ptr, i64) -> i64
      %7384 = func.call @cc_intern(%7380, %7383) : (i64, i64) -> i64
      %7385 = func.call @cc_nil_value() : () -> i64
      %7386 = func.call @cc_cons(%7384, %7385) : (i64, i64) -> i64
      %7387 = func.call @cc_values_pack(%7386) : (i64) -> i64
      func.call @stack_push_pointer(%7384) : (i64) -> ()
      %7388 = llvm.mlir.addressof @str625 : !llvm.ptr
      %7389 = arith.constant 22 : i64
      %7390 = func.call @cc_make_string(%7388, %7389) : (!llvm.ptr, i64) -> i64
      %7391 = llvm.mlir.addressof @str626 : !llvm.ptr
      %7392 = arith.constant 11 : i64
      %7393 = func.call @cc_make_string(%7391, %7392) : (!llvm.ptr, i64) -> i64
      %7394 = func.call @cc_intern(%7390, %7393) : (i64, i64) -> i64
      %7395 = func.call @cc_nil_value() : () -> i64
      %7396 = func.call @cc_cons(%7394, %7395) : (i64, i64) -> i64
      %7397 = func.call @cc_values_pack(%7396) : (i64) -> i64
      func.call @stack_push_pointer(%7394) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7398 = func.call @stack_pop_pointer() : () -> i64
      %7399 = func.call @stack_pop_pointer() : () -> i64
      %7400 = func.call @cc_cons(%7399, %7398) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %7401 = arith.addi %7400, %__rlasp_stack_elide_zero_354 : i64
      %7402 = func.call @stack_pop_pointer() : () -> i64
      %7403 = func.call @cc_cons(%7402, %7401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7404 = func.call @stack_pop_pointer() : () -> i64
      %7405 = func.call @stack_pop_pointer() : () -> i64
      %7406 = func.call @cc_cons(%7405, %7404) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %7407 = arith.addi %7406, %__rlasp_stack_elide_zero_355 : i64
      %7408 = func.call @stack_pop_pointer() : () -> i64
      %7409 = func.call @cc_cons(%7408, %7407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7410 = func.call @stack_pop_pointer() : () -> i64
      %7411 = func.call @stack_pop_pointer() : () -> i64
      %7412 = func.call @cc_cons(%7411, %7410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %7413 = arith.addi %7412, %__rlasp_stack_elide_zero_356 : i64
      %7414 = func.call @stack_pop_pointer() : () -> i64
      %7415 = func.call @cc_cons(%7414, %7413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7415) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7416 = func.call @stack_pop_pointer() : () -> i64
      %7417 = func.call @stack_pop_pointer() : () -> i64
      %7418 = func.call @cc_cons(%7417, %7416) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %7419 = arith.addi %7418, %__rlasp_stack_elide_zero_357 : i64
      %7420 = func.call @stack_pop_pointer() : () -> i64
      %7421 = func.call @cc_cons(%7420, %7419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %7422 = arith.addi %7421, %__rlasp_stack_elide_zero_358 : i64
      %7423 = func.call @stack_pop_pointer() : () -> i64
      %7424 = func.call @cc_cons(%7423, %7422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7425 = func.call @stack_pop_pointer() : () -> i64
      %7426 = func.call @stack_pop_pointer() : () -> i64
      %7427 = func.call @cc_cons(%7426, %7425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %7428 = arith.addi %7427, %__rlasp_stack_elide_zero_359 : i64
      %7429 = func.call @stack_pop_pointer() : () -> i64
      %7430 = func.call @cc_cons(%7429, %7428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %7431 = arith.addi %7430, %__rlasp_stack_elide_zero_360 : i64
      %7524 = arith.constant 15079495958552 : i64
      %7525 = arith.constant 0 : i64
      %7526 = func.call @cc_make_closure(%7524, %7525) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %7527 = arith.addi %7526, %__rlasp_stack_elide_zero_361 : i64
      %7528 = llvm.mlir.addressof @str630 : !llvm.ptr
      %7529 = arith.constant 4 : i64
      %7530 = func.call @cc_make_string(%7528, %7529) : (!llvm.ptr, i64) -> i64
      %7531 = func.call @cc_nil_value() : () -> i64
      %7532 = func.call @cc_intern(%7530, %7531) : (i64, i64) -> i64
      %7533 = func.call @cc_nil_value() : () -> i64
      %7534 = func.call @cc_cons(%7532, %7533) : (i64, i64) -> i64
      %7535 = func.call @cc_values_pack(%7534) : (i64) -> i64
      func.call @stack_push_pointer(%7532) : (i64) -> ()
      %7536 = llvm.mlir.addressof @str631 : !llvm.ptr
      %7537 = arith.constant 10 : i64
      %7538 = func.call @cc_make_string(%7536, %7537) : (!llvm.ptr, i64) -> i64
      %7539 = llvm.mlir.addressof @str632 : !llvm.ptr
      %7540 = arith.constant 11 : i64
      %7541 = func.call @cc_make_string(%7539, %7540) : (!llvm.ptr, i64) -> i64
      %7542 = func.call @cc_intern(%7538, %7541) : (i64, i64) -> i64
      %7543 = func.call @cc_nil_value() : () -> i64
      %7544 = func.call @cc_cons(%7542, %7543) : (i64, i64) -> i64
      %7545 = func.call @cc_values_pack(%7544) : (i64) -> i64
      func.call @stack_push_pointer(%7542) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7546 = func.call @stack_pop_pointer() : () -> i64
      %7547 = func.call @stack_pop_pointer() : () -> i64
      %7548 = func.call @cc_cons(%7547, %7546) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %7549 = arith.addi %7548, %__rlasp_stack_elide_zero_362 : i64
      %7550 = func.call @stack_pop_pointer() : () -> i64
      %7551 = func.call @cc_cons(%7550, %7549) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %7552 = arith.addi %7551, %__rlasp_stack_elide_zero_363 : i64
      %7553 = llvm.mlir.addressof @str633 : !llvm.ptr
      %7554 = arith.constant 11 : i64
      %7555 = func.call @cc_make_string(%7553, %7554) : (!llvm.ptr, i64) -> i64
      %7556 = llvm.mlir.addressof @str634 : !llvm.ptr
      %7557 = arith.constant 7 : i64
      %7558 = func.call @cc_make_string(%7556, %7557) : (!llvm.ptr, i64) -> i64
      %7559 = func.call @cc_intern(%7555, %7558) : (i64, i64) -> i64
      %7560 = func.call @cc_nil_value() : () -> i64
      %7561 = func.call @cc_cons(%7559, %7560) : (i64, i64) -> i64
      %7562 = func.call @cc_values_pack(%7561) : (i64) -> i64
      %7563 = func.call @cc_nil_value() : () -> i64
      %7564 = llvm.mlir.addressof @str635 : !llvm.ptr
      %7565 = arith.constant 4 : i64
      %7566 = func.call @cc_make_string(%7564, %7565) : (!llvm.ptr, i64) -> i64
      %7567 = llvm.mlir.addressof @str636 : !llvm.ptr
      %7568 = arith.constant 7 : i64
      %7569 = func.call @cc_make_string(%7567, %7568) : (!llvm.ptr, i64) -> i64
      %7570 = func.call @cc_intern(%7566, %7569) : (i64, i64) -> i64
      %7571 = func.call @cc_nil_value() : () -> i64
      %7572 = func.call @cc_cons(%7570, %7571) : (i64, i64) -> i64
      %7573 = func.call @cc_values_pack(%7572) : (i64) -> i64
      %7574 = llvm.mlir.addressof @str637 : !llvm.ptr
      %7575 = arith.constant 5 : i64
      %7576 = func.call @cc_make_string(%7574, %7575) : (!llvm.ptr, i64) -> i64
      %7577 = func.call @cc_nil_value() : () -> i64
      %7578 = func.call @cc_intern(%7576, %7577) : (i64, i64) -> i64
      %7579 = func.call @cc_nil_value() : () -> i64
      %7580 = func.call @cc_cons(%7578, %7579) : (i64, i64) -> i64
      %7581 = func.call @cc_values_pack(%7580) : (i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %7582 = arith.addi %7578, %__rlasp_stack_elide_zero_364 : i64
      %7583 = func.call @cc_nil_value() : () -> i64
      %7584 = func.call @cc_errorp(%7341) : (i64) -> i64
      %7585 = arith.cmpi ne, %7584, %7583 : i64
      %7586 = arith.cmpi eq, %7583, %7583 : i64
      %7587 = arith.andi %7585, %7586 : i1
      %7588 = scf.if %7587 -> (i64) {
        scf.yield %7341 : i64
      } else {
        scf.yield %7583 : i64
      }
      %7589 = func.call @cc_errorp(%7431) : (i64) -> i64
      %7590 = arith.cmpi ne, %7589, %7583 : i64
      %7591 = arith.cmpi eq, %7588, %7583 : i64
      %7592 = arith.andi %7590, %7591 : i1
      %7593 = scf.if %7592 -> (i64) {
        scf.yield %7431 : i64
      } else {
        scf.yield %7588 : i64
      }
      %7594 = func.call @cc_errorp(%7527) : (i64) -> i64
      %7595 = arith.cmpi ne, %7594, %7583 : i64
      %7596 = arith.cmpi eq, %7593, %7583 : i64
      %7597 = arith.andi %7595, %7596 : i1
      %7598 = scf.if %7597 -> (i64) {
        scf.yield %7527 : i64
      } else {
        scf.yield %7593 : i64
      }
      %7599 = func.call @cc_errorp(%7552) : (i64) -> i64
      %7600 = arith.cmpi ne, %7599, %7583 : i64
      %7601 = arith.cmpi eq, %7598, %7583 : i64
      %7602 = arith.andi %7600, %7601 : i1
      %7603 = scf.if %7602 -> (i64) {
        scf.yield %7552 : i64
      } else {
        scf.yield %7598 : i64
      }
      %7604 = func.call @cc_errorp(%7559) : (i64) -> i64
      %7605 = arith.cmpi ne, %7604, %7583 : i64
      %7606 = arith.cmpi eq, %7603, %7583 : i64
      %7607 = arith.andi %7605, %7606 : i1
      %7608 = scf.if %7607 -> (i64) {
        scf.yield %7559 : i64
      } else {
        scf.yield %7603 : i64
      }
      %7609 = func.call @cc_errorp(%7563) : (i64) -> i64
      %7610 = arith.cmpi ne, %7609, %7583 : i64
      %7611 = arith.cmpi eq, %7608, %7583 : i64
      %7612 = arith.andi %7610, %7611 : i1
      %7613 = scf.if %7612 -> (i64) {
        scf.yield %7563 : i64
      } else {
        scf.yield %7608 : i64
      }
      %7614 = func.call @cc_errorp(%7570) : (i64) -> i64
      %7615 = arith.cmpi ne, %7614, %7583 : i64
      %7616 = arith.cmpi eq, %7613, %7583 : i64
      %7617 = arith.andi %7615, %7616 : i1
      %7618 = scf.if %7617 -> (i64) {
        scf.yield %7570 : i64
      } else {
        scf.yield %7613 : i64
      }
      %7619 = func.call @cc_errorp(%7582) : (i64) -> i64
      %7620 = arith.cmpi ne, %7619, %7583 : i64
      %7621 = arith.cmpi eq, %7618, %7583 : i64
      %7622 = arith.andi %7620, %7621 : i1
      %7623 = scf.if %7622 -> (i64) {
        scf.yield %7582 : i64
      } else {
        scf.yield %7618 : i64
      }
      %7624 = arith.cmpi ne, %7623, %7583 : i64
      scf.if %7624 {
        func.call @stack_push_pointer(%7623) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7341) : (i64) -> ()
        func.call @stack_push_pointer(%7431) : (i64) -> ()
        func.call @stack_push_pointer(%7527) : (i64) -> ()
        func.call @stack_push_pointer(%7552) : (i64) -> ()
        func.call @stack_push_pointer(%7559) : (i64) -> ()
        func.call @stack_push_pointer(%7563) : (i64) -> ()
        func.call @stack_push_pointer(%7570) : (i64) -> ()
        func.call @stack_push_pointer(%7582) : (i64) -> ()
        %7625 = llvm.mlir.addressof @str638 : !llvm.ptr
        %7626 = func.call @cc_make_function_ref_const(%7625) : (!llvm.ptr) -> i64
        %7627 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7626, %7627) : (i64, i64) -> ()
      }
      %7628 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7628 : i64
    }
    %7629 = func.call @cc_nil_value() : () -> i64
    %7630 = func.call @cc_errorp(%7332) : (i64) -> i64
    %7631 = arith.cmpi ne, %7630, %7629 : i64
    %7632 = scf.if %7631 -> (i64) {
      scf.yield %7332 : i64
    } else {
      %7633 = llvm.mlir.addressof @str639 : !llvm.ptr
      %7634 = arith.constant 18 : i64
      %7635 = func.call @cc_make_string(%7633, %7634) : (!llvm.ptr, i64) -> i64
      %7636 = func.call @cc_nil_value() : () -> i64
      %7637 = func.call @cc_intern(%7635, %7636) : (i64, i64) -> i64
      %7638 = func.call @cc_nil_value() : () -> i64
      %7639 = func.call @cc_cons(%7637, %7638) : (i64, i64) -> i64
      %7640 = func.call @cc_values_pack(%7639) : (i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %7641 = arith.addi %7637, %__rlasp_stack_elide_zero_365 : i64
      %7642 = llvm.mlir.addressof @str640 : !llvm.ptr
      %7643 = arith.constant 13 : i64
      %7644 = func.call @cc_make_string(%7642, %7643) : (!llvm.ptr, i64) -> i64
      %7645 = llvm.mlir.addressof @str641 : !llvm.ptr
      %7646 = arith.constant 11 : i64
      %7647 = func.call @cc_make_string(%7645, %7646) : (!llvm.ptr, i64) -> i64
      %7648 = func.call @cc_intern(%7644, %7647) : (i64, i64) -> i64
      %7649 = func.call @cc_nil_value() : () -> i64
      %7650 = func.call @cc_cons(%7648, %7649) : (i64, i64) -> i64
      %7651 = func.call @cc_values_pack(%7650) : (i64) -> i64
      func.call @stack_push_pointer(%7648) : (i64) -> ()
      %7652 = llvm.mlir.addressof @str642 : !llvm.ptr
      %7653 = arith.constant 6 : i64
      %7654 = func.call @cc_make_string(%7652, %7653) : (!llvm.ptr, i64) -> i64
      %7655 = func.call @cc_nil_value() : () -> i64
      %7656 = func.call @cc_intern(%7654, %7655) : (i64, i64) -> i64
      %7657 = func.call @cc_nil_value() : () -> i64
      %7658 = func.call @cc_cons(%7656, %7657) : (i64, i64) -> i64
      %7659 = func.call @cc_values_pack(%7658) : (i64) -> i64
      func.call @stack_push_pointer(%7656) : (i64) -> ()
      %7660 = llvm.mlir.addressof @str643 : !llvm.ptr
      %7661 = arith.constant 19 : i64
      %7662 = func.call @cc_make_string(%7660, %7661) : (!llvm.ptr, i64) -> i64
      %7663 = func.call @cc_nil_value() : () -> i64
      %7664 = func.call @cc_intern(%7662, %7663) : (i64, i64) -> i64
      %7665 = func.call @cc_nil_value() : () -> i64
      %7666 = func.call @cc_cons(%7664, %7665) : (i64, i64) -> i64
      %7667 = func.call @cc_values_pack(%7666) : (i64) -> i64
      func.call @stack_push_pointer(%7664) : (i64) -> ()
      %7668 = llvm.mlir.addressof @str644 : !llvm.ptr
      %7669 = arith.constant 10 : i64
      %7670 = func.call @cc_make_string(%7668, %7669) : (!llvm.ptr, i64) -> i64
      %7671 = llvm.mlir.addressof @str645 : !llvm.ptr
      %7672 = arith.constant 11 : i64
      %7673 = func.call @cc_make_string(%7671, %7672) : (!llvm.ptr, i64) -> i64
      %7674 = func.call @cc_intern(%7670, %7673) : (i64, i64) -> i64
      %7675 = func.call @cc_nil_value() : () -> i64
      %7676 = func.call @cc_cons(%7674, %7675) : (i64, i64) -> i64
      %7677 = func.call @cc_values_pack(%7676) : (i64) -> i64
      func.call @stack_push_pointer(%7674) : (i64) -> ()
      %7678 = llvm.mlir.addressof @str646 : !llvm.ptr
      %7679 = arith.constant 4 : i64
      %7680 = func.call @cc_make_string(%7678, %7679) : (!llvm.ptr, i64) -> i64
      %7681 = llvm.mlir.addressof @str647 : !llvm.ptr
      %7682 = arith.constant 11 : i64
      %7683 = func.call @cc_make_string(%7681, %7682) : (!llvm.ptr, i64) -> i64
      %7684 = func.call @cc_intern(%7680, %7683) : (i64, i64) -> i64
      %7685 = func.call @cc_nil_value() : () -> i64
      %7686 = func.call @cc_cons(%7684, %7685) : (i64, i64) -> i64
      %7687 = func.call @cc_values_pack(%7686) : (i64) -> i64
      func.call @stack_push_pointer(%7684) : (i64) -> ()
      %7688 = llvm.mlir.addressof @str648 : !llvm.ptr
      %7689 = arith.constant 2 : i64
      %7690 = func.call @cc_make_string(%7688, %7689) : (!llvm.ptr, i64) -> i64
      %7691 = llvm.mlir.addressof @str649 : !llvm.ptr
      %7692 = arith.constant 11 : i64
      %7693 = func.call @cc_make_string(%7691, %7692) : (!llvm.ptr, i64) -> i64
      %7694 = func.call @cc_intern(%7690, %7693) : (i64, i64) -> i64
      %7695 = func.call @cc_nil_value() : () -> i64
      %7696 = func.call @cc_cons(%7694, %7695) : (i64, i64) -> i64
      %7697 = func.call @cc_values_pack(%7696) : (i64) -> i64
      func.call @stack_push_pointer(%7694) : (i64) -> ()
      %7698 = llvm.mlir.addressof @str650 : !llvm.ptr
      %7699 = arith.constant 22 : i64
      %7700 = func.call @cc_make_string(%7698, %7699) : (!llvm.ptr, i64) -> i64
      %7701 = llvm.mlir.addressof @str651 : !llvm.ptr
      %7702 = arith.constant 11 : i64
      %7703 = func.call @cc_make_string(%7701, %7702) : (!llvm.ptr, i64) -> i64
      %7704 = func.call @cc_intern(%7700, %7703) : (i64, i64) -> i64
      %7705 = func.call @cc_nil_value() : () -> i64
      %7706 = func.call @cc_cons(%7704, %7705) : (i64, i64) -> i64
      %7707 = func.call @cc_values_pack(%7706) : (i64) -> i64
      func.call @stack_push_pointer(%7704) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7708 = func.call @stack_pop_pointer() : () -> i64
      %7709 = func.call @stack_pop_pointer() : () -> i64
      %7710 = func.call @cc_cons(%7709, %7708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %7711 = arith.addi %7710, %__rlasp_stack_elide_zero_366 : i64
      %7712 = func.call @stack_pop_pointer() : () -> i64
      %7713 = func.call @cc_cons(%7712, %7711) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7713) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7714 = func.call @stack_pop_pointer() : () -> i64
      %7715 = func.call @stack_pop_pointer() : () -> i64
      %7716 = func.call @cc_cons(%7715, %7714) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %7717 = arith.addi %7716, %__rlasp_stack_elide_zero_367 : i64
      %7718 = func.call @stack_pop_pointer() : () -> i64
      %7719 = func.call @cc_cons(%7718, %7717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7720 = func.call @stack_pop_pointer() : () -> i64
      %7721 = func.call @stack_pop_pointer() : () -> i64
      %7722 = func.call @cc_cons(%7721, %7720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %7723 = arith.addi %7722, %__rlasp_stack_elide_zero_368 : i64
      %7724 = func.call @stack_pop_pointer() : () -> i64
      %7725 = func.call @cc_cons(%7724, %7723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7725) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7726 = func.call @stack_pop_pointer() : () -> i64
      %7727 = func.call @stack_pop_pointer() : () -> i64
      %7728 = func.call @cc_cons(%7727, %7726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %7729 = arith.addi %7728, %__rlasp_stack_elide_zero_369 : i64
      %7730 = func.call @stack_pop_pointer() : () -> i64
      %7731 = func.call @cc_cons(%7730, %7729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7732 = func.call @stack_pop_pointer() : () -> i64
      %7733 = func.call @stack_pop_pointer() : () -> i64
      %7734 = func.call @cc_cons(%7733, %7732) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %7735 = arith.addi %7734, %__rlasp_stack_elide_zero_370 : i64
      %7736 = func.call @stack_pop_pointer() : () -> i64
      %7737 = func.call @cc_cons(%7736, %7735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %7738 = arith.addi %7737, %__rlasp_stack_elide_zero_371 : i64
      %7739 = func.call @stack_pop_pointer() : () -> i64
      %7740 = func.call @cc_cons(%7739, %7738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7740) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7741 = func.call @stack_pop_pointer() : () -> i64
      %7742 = func.call @stack_pop_pointer() : () -> i64
      %7743 = func.call @cc_cons(%7742, %7741) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %7744 = arith.addi %7743, %__rlasp_stack_elide_zero_372 : i64
      %7745 = func.call @stack_pop_pointer() : () -> i64
      %7746 = func.call @cc_cons(%7745, %7744) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %7747 = arith.addi %7746, %__rlasp_stack_elide_zero_373 : i64
      %7852 = arith.constant 15079495958553 : i64
      %7853 = arith.constant 0 : i64
      %7854 = func.call @cc_make_closure(%7852, %7853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %7855 = arith.addi %7854, %__rlasp_stack_elide_zero_374 : i64
      %7856 = llvm.mlir.addressof @str655 : !llvm.ptr
      %7857 = arith.constant 4 : i64
      %7858 = func.call @cc_make_string(%7856, %7857) : (!llvm.ptr, i64) -> i64
      %7859 = func.call @cc_nil_value() : () -> i64
      %7860 = func.call @cc_intern(%7858, %7859) : (i64, i64) -> i64
      %7861 = func.call @cc_nil_value() : () -> i64
      %7862 = func.call @cc_cons(%7860, %7861) : (i64, i64) -> i64
      %7863 = func.call @cc_values_pack(%7862) : (i64) -> i64
      func.call @stack_push_pointer(%7860) : (i64) -> ()
      %7864 = llvm.mlir.addressof @str656 : !llvm.ptr
      %7865 = arith.constant 10 : i64
      %7866 = func.call @cc_make_string(%7864, %7865) : (!llvm.ptr, i64) -> i64
      %7867 = llvm.mlir.addressof @str657 : !llvm.ptr
      %7868 = arith.constant 11 : i64
      %7869 = func.call @cc_make_string(%7867, %7868) : (!llvm.ptr, i64) -> i64
      %7870 = func.call @cc_intern(%7866, %7869) : (i64, i64) -> i64
      %7871 = func.call @cc_nil_value() : () -> i64
      %7872 = func.call @cc_cons(%7870, %7871) : (i64, i64) -> i64
      %7873 = func.call @cc_values_pack(%7872) : (i64) -> i64
      func.call @stack_push_pointer(%7870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7874 = func.call @stack_pop_pointer() : () -> i64
      %7875 = func.call @stack_pop_pointer() : () -> i64
      %7876 = func.call @cc_cons(%7875, %7874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %7877 = arith.addi %7876, %__rlasp_stack_elide_zero_375 : i64
      %7878 = func.call @stack_pop_pointer() : () -> i64
      %7879 = func.call @cc_cons(%7878, %7877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %7880 = arith.addi %7879, %__rlasp_stack_elide_zero_376 : i64
      %7881 = llvm.mlir.addressof @str658 : !llvm.ptr
      %7882 = arith.constant 11 : i64
      %7883 = func.call @cc_make_string(%7881, %7882) : (!llvm.ptr, i64) -> i64
      %7884 = llvm.mlir.addressof @str659 : !llvm.ptr
      %7885 = arith.constant 7 : i64
      %7886 = func.call @cc_make_string(%7884, %7885) : (!llvm.ptr, i64) -> i64
      %7887 = func.call @cc_intern(%7883, %7886) : (i64, i64) -> i64
      %7888 = func.call @cc_nil_value() : () -> i64
      %7889 = func.call @cc_cons(%7887, %7888) : (i64, i64) -> i64
      %7890 = func.call @cc_values_pack(%7889) : (i64) -> i64
      %7891 = func.call @cc_nil_value() : () -> i64
      %7892 = llvm.mlir.addressof @str660 : !llvm.ptr
      %7893 = arith.constant 4 : i64
      %7894 = func.call @cc_make_string(%7892, %7893) : (!llvm.ptr, i64) -> i64
      %7895 = llvm.mlir.addressof @str661 : !llvm.ptr
      %7896 = arith.constant 7 : i64
      %7897 = func.call @cc_make_string(%7895, %7896) : (!llvm.ptr, i64) -> i64
      %7898 = func.call @cc_intern(%7894, %7897) : (i64, i64) -> i64
      %7899 = func.call @cc_nil_value() : () -> i64
      %7900 = func.call @cc_cons(%7898, %7899) : (i64, i64) -> i64
      %7901 = func.call @cc_values_pack(%7900) : (i64) -> i64
      %7902 = llvm.mlir.addressof @str662 : !llvm.ptr
      %7903 = arith.constant 5 : i64
      %7904 = func.call @cc_make_string(%7902, %7903) : (!llvm.ptr, i64) -> i64
      %7905 = func.call @cc_nil_value() : () -> i64
      %7906 = func.call @cc_intern(%7904, %7905) : (i64, i64) -> i64
      %7907 = func.call @cc_nil_value() : () -> i64
      %7908 = func.call @cc_cons(%7906, %7907) : (i64, i64) -> i64
      %7909 = func.call @cc_values_pack(%7908) : (i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %7910 = arith.addi %7906, %__rlasp_stack_elide_zero_377 : i64
      %7911 = func.call @cc_nil_value() : () -> i64
      %7912 = func.call @cc_errorp(%7641) : (i64) -> i64
      %7913 = arith.cmpi ne, %7912, %7911 : i64
      %7914 = arith.cmpi eq, %7911, %7911 : i64
      %7915 = arith.andi %7913, %7914 : i1
      %7916 = scf.if %7915 -> (i64) {
        scf.yield %7641 : i64
      } else {
        scf.yield %7911 : i64
      }
      %7917 = func.call @cc_errorp(%7747) : (i64) -> i64
      %7918 = arith.cmpi ne, %7917, %7911 : i64
      %7919 = arith.cmpi eq, %7916, %7911 : i64
      %7920 = arith.andi %7918, %7919 : i1
      %7921 = scf.if %7920 -> (i64) {
        scf.yield %7747 : i64
      } else {
        scf.yield %7916 : i64
      }
      %7922 = func.call @cc_errorp(%7855) : (i64) -> i64
      %7923 = arith.cmpi ne, %7922, %7911 : i64
      %7924 = arith.cmpi eq, %7921, %7911 : i64
      %7925 = arith.andi %7923, %7924 : i1
      %7926 = scf.if %7925 -> (i64) {
        scf.yield %7855 : i64
      } else {
        scf.yield %7921 : i64
      }
      %7927 = func.call @cc_errorp(%7880) : (i64) -> i64
      %7928 = arith.cmpi ne, %7927, %7911 : i64
      %7929 = arith.cmpi eq, %7926, %7911 : i64
      %7930 = arith.andi %7928, %7929 : i1
      %7931 = scf.if %7930 -> (i64) {
        scf.yield %7880 : i64
      } else {
        scf.yield %7926 : i64
      }
      %7932 = func.call @cc_errorp(%7887) : (i64) -> i64
      %7933 = arith.cmpi ne, %7932, %7911 : i64
      %7934 = arith.cmpi eq, %7931, %7911 : i64
      %7935 = arith.andi %7933, %7934 : i1
      %7936 = scf.if %7935 -> (i64) {
        scf.yield %7887 : i64
      } else {
        scf.yield %7931 : i64
      }
      %7937 = func.call @cc_errorp(%7891) : (i64) -> i64
      %7938 = arith.cmpi ne, %7937, %7911 : i64
      %7939 = arith.cmpi eq, %7936, %7911 : i64
      %7940 = arith.andi %7938, %7939 : i1
      %7941 = scf.if %7940 -> (i64) {
        scf.yield %7891 : i64
      } else {
        scf.yield %7936 : i64
      }
      %7942 = func.call @cc_errorp(%7898) : (i64) -> i64
      %7943 = arith.cmpi ne, %7942, %7911 : i64
      %7944 = arith.cmpi eq, %7941, %7911 : i64
      %7945 = arith.andi %7943, %7944 : i1
      %7946 = scf.if %7945 -> (i64) {
        scf.yield %7898 : i64
      } else {
        scf.yield %7941 : i64
      }
      %7947 = func.call @cc_errorp(%7910) : (i64) -> i64
      %7948 = arith.cmpi ne, %7947, %7911 : i64
      %7949 = arith.cmpi eq, %7946, %7911 : i64
      %7950 = arith.andi %7948, %7949 : i1
      %7951 = scf.if %7950 -> (i64) {
        scf.yield %7910 : i64
      } else {
        scf.yield %7946 : i64
      }
      %7952 = arith.cmpi ne, %7951, %7911 : i64
      scf.if %7952 {
        func.call @stack_push_pointer(%7951) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7641) : (i64) -> ()
        func.call @stack_push_pointer(%7747) : (i64) -> ()
        func.call @stack_push_pointer(%7855) : (i64) -> ()
        func.call @stack_push_pointer(%7880) : (i64) -> ()
        func.call @stack_push_pointer(%7887) : (i64) -> ()
        func.call @stack_push_pointer(%7891) : (i64) -> ()
        func.call @stack_push_pointer(%7898) : (i64) -> ()
        func.call @stack_push_pointer(%7910) : (i64) -> ()
        %7953 = llvm.mlir.addressof @str663 : !llvm.ptr
        %7954 = func.call @cc_make_function_ref_const(%7953) : (!llvm.ptr) -> i64
        %7955 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7954, %7955) : (i64, i64) -> ()
      }
      %7956 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7956 : i64
    }
    %7957 = func.call @cc_nil_value() : () -> i64
    %7958 = func.call @cc_errorp(%7632) : (i64) -> i64
    %7959 = arith.cmpi ne, %7958, %7957 : i64
    %7960 = scf.if %7959 -> (i64) {
      scf.yield %7632 : i64
    } else {
      %7961 = llvm.mlir.addressof @str664 : !llvm.ptr
      %7962 = arith.constant 28 : i64
      %7963 = func.call @cc_make_string(%7961, %7962) : (!llvm.ptr, i64) -> i64
      %7964 = func.call @cc_nil_value() : () -> i64
      %7965 = func.call @cc_intern(%7963, %7964) : (i64, i64) -> i64
      %7966 = func.call @cc_nil_value() : () -> i64
      %7967 = func.call @cc_cons(%7965, %7966) : (i64, i64) -> i64
      %7968 = func.call @cc_values_pack(%7967) : (i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %7969 = arith.addi %7965, %__rlasp_stack_elide_zero_378 : i64
      %7970 = llvm.mlir.addressof @str665 : !llvm.ptr
      %7971 = arith.constant 13 : i64
      %7972 = func.call @cc_make_string(%7970, %7971) : (!llvm.ptr, i64) -> i64
      %7973 = llvm.mlir.addressof @str666 : !llvm.ptr
      %7974 = arith.constant 11 : i64
      %7975 = func.call @cc_make_string(%7973, %7974) : (!llvm.ptr, i64) -> i64
      %7976 = func.call @cc_intern(%7972, %7975) : (i64, i64) -> i64
      %7977 = func.call @cc_nil_value() : () -> i64
      %7978 = func.call @cc_cons(%7976, %7977) : (i64, i64) -> i64
      %7979 = func.call @cc_values_pack(%7978) : (i64) -> i64
      func.call @stack_push_pointer(%7976) : (i64) -> ()
      %7980 = llvm.mlir.addressof @str667 : !llvm.ptr
      %7981 = arith.constant 6 : i64
      %7982 = func.call @cc_make_string(%7980, %7981) : (!llvm.ptr, i64) -> i64
      %7983 = func.call @cc_nil_value() : () -> i64
      %7984 = func.call @cc_intern(%7982, %7983) : (i64, i64) -> i64
      %7985 = func.call @cc_nil_value() : () -> i64
      %7986 = func.call @cc_cons(%7984, %7985) : (i64, i64) -> i64
      %7987 = func.call @cc_values_pack(%7986) : (i64) -> i64
      func.call @stack_push_pointer(%7984) : (i64) -> ()
      %7988 = llvm.mlir.addressof @str668 : !llvm.ptr
      %7989 = arith.constant 19 : i64
      %7990 = func.call @cc_make_string(%7988, %7989) : (!llvm.ptr, i64) -> i64
      %7991 = func.call @cc_nil_value() : () -> i64
      %7992 = func.call @cc_intern(%7990, %7991) : (i64, i64) -> i64
      %7993 = func.call @cc_nil_value() : () -> i64
      %7994 = func.call @cc_cons(%7992, %7993) : (i64, i64) -> i64
      %7995 = func.call @cc_values_pack(%7994) : (i64) -> i64
      func.call @stack_push_pointer(%7992) : (i64) -> ()
      %7996 = llvm.mlir.addressof @str669 : !llvm.ptr
      %7997 = arith.constant 10 : i64
      %7998 = func.call @cc_make_string(%7996, %7997) : (!llvm.ptr, i64) -> i64
      %7999 = llvm.mlir.addressof @str670 : !llvm.ptr
      %8000 = arith.constant 11 : i64
      %8001 = func.call @cc_make_string(%7999, %8000) : (!llvm.ptr, i64) -> i64
      %8002 = func.call @cc_intern(%7998, %8001) : (i64, i64) -> i64
      %8003 = func.call @cc_nil_value() : () -> i64
      %8004 = func.call @cc_cons(%8002, %8003) : (i64, i64) -> i64
      %8005 = func.call @cc_values_pack(%8004) : (i64) -> i64
      func.call @stack_push_pointer(%8002) : (i64) -> ()
      %8006 = llvm.mlir.addressof @str671 : !llvm.ptr
      %8007 = arith.constant 4 : i64
      %8008 = func.call @cc_make_string(%8006, %8007) : (!llvm.ptr, i64) -> i64
      %8009 = llvm.mlir.addressof @str672 : !llvm.ptr
      %8010 = arith.constant 11 : i64
      %8011 = func.call @cc_make_string(%8009, %8010) : (!llvm.ptr, i64) -> i64
      %8012 = func.call @cc_intern(%8008, %8011) : (i64, i64) -> i64
      %8013 = func.call @cc_nil_value() : () -> i64
      %8014 = func.call @cc_cons(%8012, %8013) : (i64, i64) -> i64
      %8015 = func.call @cc_values_pack(%8014) : (i64) -> i64
      func.call @stack_push_pointer(%8012) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8016 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%8016) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8017 = func.call @stack_pop_pointer() : () -> i64
      %8018 = func.call @stack_pop_pointer() : () -> i64
      %8019 = func.call @cc_cons(%8018, %8017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %8020 = arith.addi %8019, %__rlasp_stack_elide_zero_379 : i64
      %8021 = func.call @stack_pop_pointer() : () -> i64
      %8022 = func.call @cc_cons(%8021, %8020) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %8023 = arith.addi %8022, %__rlasp_stack_elide_zero_380 : i64
      %8024 = func.call @stack_pop_pointer() : () -> i64
      %8025 = func.call @cc_cons(%8024, %8023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8026 = func.call @stack_pop_pointer() : () -> i64
      %8027 = func.call @stack_pop_pointer() : () -> i64
      %8028 = func.call @cc_cons(%8027, %8026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
      %8029 = arith.addi %8028, %__rlasp_stack_elide_zero_381 : i64
      %8030 = func.call @stack_pop_pointer() : () -> i64
      %8031 = func.call @cc_cons(%8030, %8029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8032 = func.call @stack_pop_pointer() : () -> i64
      %8033 = func.call @stack_pop_pointer() : () -> i64
      %8034 = func.call @cc_cons(%8033, %8032) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
      %8035 = arith.addi %8034, %__rlasp_stack_elide_zero_382 : i64
      %8036 = func.call @stack_pop_pointer() : () -> i64
      %8037 = func.call @cc_cons(%8036, %8035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8037) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8038 = func.call @stack_pop_pointer() : () -> i64
      %8039 = func.call @stack_pop_pointer() : () -> i64
      %8040 = func.call @cc_cons(%8039, %8038) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
      %8041 = arith.addi %8040, %__rlasp_stack_elide_zero_383 : i64
      %8042 = func.call @stack_pop_pointer() : () -> i64
      %8043 = func.call @cc_cons(%8042, %8041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
      %8044 = arith.addi %8043, %__rlasp_stack_elide_zero_384 : i64
      %8045 = func.call @stack_pop_pointer() : () -> i64
      %8046 = func.call @cc_cons(%8045, %8044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8046) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8047 = func.call @stack_pop_pointer() : () -> i64
      %8048 = func.call @stack_pop_pointer() : () -> i64
      %8049 = func.call @cc_cons(%8048, %8047) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
      %8050 = arith.addi %8049, %__rlasp_stack_elide_zero_385 : i64
      %8051 = func.call @stack_pop_pointer() : () -> i64
      %8052 = func.call @cc_cons(%8051, %8050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
      %8053 = arith.addi %8052, %__rlasp_stack_elide_zero_386 : i64
      %8130 = arith.constant 15079495958554 : i64
      %8131 = arith.constant 0 : i64
      %8132 = func.call @cc_make_closure(%8130, %8131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
      %8133 = arith.addi %8132, %__rlasp_stack_elide_zero_387 : i64
      %8134 = llvm.mlir.addressof @str674 : !llvm.ptr
      %8135 = arith.constant 4 : i64
      %8136 = func.call @cc_make_string(%8134, %8135) : (!llvm.ptr, i64) -> i64
      %8137 = func.call @cc_nil_value() : () -> i64
      %8138 = func.call @cc_intern(%8136, %8137) : (i64, i64) -> i64
      %8139 = func.call @cc_nil_value() : () -> i64
      %8140 = func.call @cc_cons(%8138, %8139) : (i64, i64) -> i64
      %8141 = func.call @cc_values_pack(%8140) : (i64) -> i64
      func.call @stack_push_pointer(%8138) : (i64) -> ()
      %8142 = llvm.mlir.addressof @str675 : !llvm.ptr
      %8143 = arith.constant 10 : i64
      %8144 = func.call @cc_make_string(%8142, %8143) : (!llvm.ptr, i64) -> i64
      %8145 = llvm.mlir.addressof @str676 : !llvm.ptr
      %8146 = arith.constant 11 : i64
      %8147 = func.call @cc_make_string(%8145, %8146) : (!llvm.ptr, i64) -> i64
      %8148 = func.call @cc_intern(%8144, %8147) : (i64, i64) -> i64
      %8149 = func.call @cc_nil_value() : () -> i64
      %8150 = func.call @cc_cons(%8148, %8149) : (i64, i64) -> i64
      %8151 = func.call @cc_values_pack(%8150) : (i64) -> i64
      func.call @stack_push_pointer(%8148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8152 = func.call @stack_pop_pointer() : () -> i64
      %8153 = func.call @stack_pop_pointer() : () -> i64
      %8154 = func.call @cc_cons(%8153, %8152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %8155 = arith.addi %8154, %__rlasp_stack_elide_zero_388 : i64
      %8156 = func.call @stack_pop_pointer() : () -> i64
      %8157 = func.call @cc_cons(%8156, %8155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
      %8158 = arith.addi %8157, %__rlasp_stack_elide_zero_389 : i64
      %8159 = llvm.mlir.addressof @str677 : !llvm.ptr
      %8160 = arith.constant 11 : i64
      %8161 = func.call @cc_make_string(%8159, %8160) : (!llvm.ptr, i64) -> i64
      %8162 = llvm.mlir.addressof @str678 : !llvm.ptr
      %8163 = arith.constant 7 : i64
      %8164 = func.call @cc_make_string(%8162, %8163) : (!llvm.ptr, i64) -> i64
      %8165 = func.call @cc_intern(%8161, %8164) : (i64, i64) -> i64
      %8166 = func.call @cc_nil_value() : () -> i64
      %8167 = func.call @cc_cons(%8165, %8166) : (i64, i64) -> i64
      %8168 = func.call @cc_values_pack(%8167) : (i64) -> i64
      %8169 = func.call @cc_nil_value() : () -> i64
      %8170 = llvm.mlir.addressof @str679 : !llvm.ptr
      %8171 = arith.constant 4 : i64
      %8172 = func.call @cc_make_string(%8170, %8171) : (!llvm.ptr, i64) -> i64
      %8173 = llvm.mlir.addressof @str680 : !llvm.ptr
      %8174 = arith.constant 7 : i64
      %8175 = func.call @cc_make_string(%8173, %8174) : (!llvm.ptr, i64) -> i64
      %8176 = func.call @cc_intern(%8172, %8175) : (i64, i64) -> i64
      %8177 = func.call @cc_nil_value() : () -> i64
      %8178 = func.call @cc_cons(%8176, %8177) : (i64, i64) -> i64
      %8179 = func.call @cc_values_pack(%8178) : (i64) -> i64
      %8180 = llvm.mlir.addressof @str681 : !llvm.ptr
      %8181 = arith.constant 5 : i64
      %8182 = func.call @cc_make_string(%8180, %8181) : (!llvm.ptr, i64) -> i64
      %8183 = func.call @cc_nil_value() : () -> i64
      %8184 = func.call @cc_intern(%8182, %8183) : (i64, i64) -> i64
      %8185 = func.call @cc_nil_value() : () -> i64
      %8186 = func.call @cc_cons(%8184, %8185) : (i64, i64) -> i64
      %8187 = func.call @cc_values_pack(%8186) : (i64) -> i64
      %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
      %8188 = arith.addi %8184, %__rlasp_stack_elide_zero_390 : i64
      %8189 = func.call @cc_nil_value() : () -> i64
      %8190 = func.call @cc_errorp(%7969) : (i64) -> i64
      %8191 = arith.cmpi ne, %8190, %8189 : i64
      %8192 = arith.cmpi eq, %8189, %8189 : i64
      %8193 = arith.andi %8191, %8192 : i1
      %8194 = scf.if %8193 -> (i64) {
        scf.yield %7969 : i64
      } else {
        scf.yield %8189 : i64
      }
      %8195 = func.call @cc_errorp(%8053) : (i64) -> i64
      %8196 = arith.cmpi ne, %8195, %8189 : i64
      %8197 = arith.cmpi eq, %8194, %8189 : i64
      %8198 = arith.andi %8196, %8197 : i1
      %8199 = scf.if %8198 -> (i64) {
        scf.yield %8053 : i64
      } else {
        scf.yield %8194 : i64
      }
      %8200 = func.call @cc_errorp(%8133) : (i64) -> i64
      %8201 = arith.cmpi ne, %8200, %8189 : i64
      %8202 = arith.cmpi eq, %8199, %8189 : i64
      %8203 = arith.andi %8201, %8202 : i1
      %8204 = scf.if %8203 -> (i64) {
        scf.yield %8133 : i64
      } else {
        scf.yield %8199 : i64
      }
      %8205 = func.call @cc_errorp(%8158) : (i64) -> i64
      %8206 = arith.cmpi ne, %8205, %8189 : i64
      %8207 = arith.cmpi eq, %8204, %8189 : i64
      %8208 = arith.andi %8206, %8207 : i1
      %8209 = scf.if %8208 -> (i64) {
        scf.yield %8158 : i64
      } else {
        scf.yield %8204 : i64
      }
      %8210 = func.call @cc_errorp(%8165) : (i64) -> i64
      %8211 = arith.cmpi ne, %8210, %8189 : i64
      %8212 = arith.cmpi eq, %8209, %8189 : i64
      %8213 = arith.andi %8211, %8212 : i1
      %8214 = scf.if %8213 -> (i64) {
        scf.yield %8165 : i64
      } else {
        scf.yield %8209 : i64
      }
      %8215 = func.call @cc_errorp(%8169) : (i64) -> i64
      %8216 = arith.cmpi ne, %8215, %8189 : i64
      %8217 = arith.cmpi eq, %8214, %8189 : i64
      %8218 = arith.andi %8216, %8217 : i1
      %8219 = scf.if %8218 -> (i64) {
        scf.yield %8169 : i64
      } else {
        scf.yield %8214 : i64
      }
      %8220 = func.call @cc_errorp(%8176) : (i64) -> i64
      %8221 = arith.cmpi ne, %8220, %8189 : i64
      %8222 = arith.cmpi eq, %8219, %8189 : i64
      %8223 = arith.andi %8221, %8222 : i1
      %8224 = scf.if %8223 -> (i64) {
        scf.yield %8176 : i64
      } else {
        scf.yield %8219 : i64
      }
      %8225 = func.call @cc_errorp(%8188) : (i64) -> i64
      %8226 = arith.cmpi ne, %8225, %8189 : i64
      %8227 = arith.cmpi eq, %8224, %8189 : i64
      %8228 = arith.andi %8226, %8227 : i1
      %8229 = scf.if %8228 -> (i64) {
        scf.yield %8188 : i64
      } else {
        scf.yield %8224 : i64
      }
      %8230 = arith.cmpi ne, %8229, %8189 : i64
      scf.if %8230 {
        func.call @stack_push_pointer(%8229) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7969) : (i64) -> ()
        func.call @stack_push_pointer(%8053) : (i64) -> ()
        func.call @stack_push_pointer(%8133) : (i64) -> ()
        func.call @stack_push_pointer(%8158) : (i64) -> ()
        func.call @stack_push_pointer(%8165) : (i64) -> ()
        func.call @stack_push_pointer(%8169) : (i64) -> ()
        func.call @stack_push_pointer(%8176) : (i64) -> ()
        func.call @stack_push_pointer(%8188) : (i64) -> ()
        %8231 = llvm.mlir.addressof @str682 : !llvm.ptr
        %8232 = func.call @cc_make_function_ref_const(%8231) : (!llvm.ptr) -> i64
        %8233 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8232, %8233) : (i64, i64) -> ()
      }
      %8234 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8234 : i64
    }
    %8235 = func.call @cc_nil_value() : () -> i64
    %8236 = func.call @cc_errorp(%7960) : (i64) -> i64
    %8237 = arith.cmpi ne, %8236, %8235 : i64
    %8238 = scf.if %8237 -> (i64) {
      scf.yield %7960 : i64
    } else {
      %8239 = llvm.mlir.addressof @str683 : !llvm.ptr
      %8240 = arith.constant 28 : i64
      %8241 = func.call @cc_make_string(%8239, %8240) : (!llvm.ptr, i64) -> i64
      %8242 = func.call @cc_nil_value() : () -> i64
      %8243 = func.call @cc_intern(%8241, %8242) : (i64, i64) -> i64
      %8244 = func.call @cc_nil_value() : () -> i64
      %8245 = func.call @cc_cons(%8243, %8244) : (i64, i64) -> i64
      %8246 = func.call @cc_values_pack(%8245) : (i64) -> i64
      %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
      %8247 = arith.addi %8243, %__rlasp_stack_elide_zero_391 : i64
      %8248 = llvm.mlir.addressof @str684 : !llvm.ptr
      %8249 = arith.constant 13 : i64
      %8250 = func.call @cc_make_string(%8248, %8249) : (!llvm.ptr, i64) -> i64
      %8251 = llvm.mlir.addressof @str685 : !llvm.ptr
      %8252 = arith.constant 11 : i64
      %8253 = func.call @cc_make_string(%8251, %8252) : (!llvm.ptr, i64) -> i64
      %8254 = func.call @cc_intern(%8250, %8253) : (i64, i64) -> i64
      %8255 = func.call @cc_nil_value() : () -> i64
      %8256 = func.call @cc_cons(%8254, %8255) : (i64, i64) -> i64
      %8257 = func.call @cc_values_pack(%8256) : (i64) -> i64
      func.call @stack_push_pointer(%8254) : (i64) -> ()
      %8258 = llvm.mlir.addressof @str686 : !llvm.ptr
      %8259 = arith.constant 6 : i64
      %8260 = func.call @cc_make_string(%8258, %8259) : (!llvm.ptr, i64) -> i64
      %8261 = func.call @cc_nil_value() : () -> i64
      %8262 = func.call @cc_intern(%8260, %8261) : (i64, i64) -> i64
      %8263 = func.call @cc_nil_value() : () -> i64
      %8264 = func.call @cc_cons(%8262, %8263) : (i64, i64) -> i64
      %8265 = func.call @cc_values_pack(%8264) : (i64) -> i64
      func.call @stack_push_pointer(%8262) : (i64) -> ()
      %8266 = llvm.mlir.addressof @str687 : !llvm.ptr
      %8267 = arith.constant 19 : i64
      %8268 = func.call @cc_make_string(%8266, %8267) : (!llvm.ptr, i64) -> i64
      %8269 = func.call @cc_nil_value() : () -> i64
      %8270 = func.call @cc_intern(%8268, %8269) : (i64, i64) -> i64
      %8271 = func.call @cc_nil_value() : () -> i64
      %8272 = func.call @cc_cons(%8270, %8271) : (i64, i64) -> i64
      %8273 = func.call @cc_values_pack(%8272) : (i64) -> i64
      func.call @stack_push_pointer(%8270) : (i64) -> ()
      %8274 = llvm.mlir.addressof @str688 : !llvm.ptr
      %8275 = arith.constant 10 : i64
      %8276 = func.call @cc_make_string(%8274, %8275) : (!llvm.ptr, i64) -> i64
      %8277 = llvm.mlir.addressof @str689 : !llvm.ptr
      %8278 = arith.constant 11 : i64
      %8279 = func.call @cc_make_string(%8277, %8278) : (!llvm.ptr, i64) -> i64
      %8280 = func.call @cc_intern(%8276, %8279) : (i64, i64) -> i64
      %8281 = func.call @cc_nil_value() : () -> i64
      %8282 = func.call @cc_cons(%8280, %8281) : (i64, i64) -> i64
      %8283 = func.call @cc_values_pack(%8282) : (i64) -> i64
      func.call @stack_push_pointer(%8280) : (i64) -> ()
      %8284 = llvm.mlir.addressof @str690 : !llvm.ptr
      %8285 = arith.constant 4 : i64
      %8286 = func.call @cc_make_string(%8284, %8285) : (!llvm.ptr, i64) -> i64
      %8287 = llvm.mlir.addressof @str691 : !llvm.ptr
      %8288 = arith.constant 11 : i64
      %8289 = func.call @cc_make_string(%8287, %8288) : (!llvm.ptr, i64) -> i64
      %8290 = func.call @cc_intern(%8286, %8289) : (i64, i64) -> i64
      %8291 = func.call @cc_nil_value() : () -> i64
      %8292 = func.call @cc_cons(%8290, %8291) : (i64, i64) -> i64
      %8293 = func.call @cc_values_pack(%8292) : (i64) -> i64
      func.call @stack_push_pointer(%8290) : (i64) -> ()
      %8294 = arith.constant 97 : i64
      %8295 = func.call @cc_box_character(%8294) : (i64) -> i64
      func.call @stack_push_pointer(%8295) : (i64) -> ()
      %8296 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%8296) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8297 = func.call @stack_pop_pointer() : () -> i64
      %8298 = func.call @stack_pop_pointer() : () -> i64
      %8299 = func.call @cc_cons(%8298, %8297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
      %8300 = arith.addi %8299, %__rlasp_stack_elide_zero_392 : i64
      %8301 = func.call @stack_pop_pointer() : () -> i64
      %8302 = func.call @cc_cons(%8301, %8300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
      %8303 = arith.addi %8302, %__rlasp_stack_elide_zero_393 : i64
      %8304 = func.call @stack_pop_pointer() : () -> i64
      %8305 = func.call @cc_cons(%8304, %8303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8306 = func.call @stack_pop_pointer() : () -> i64
      %8307 = func.call @stack_pop_pointer() : () -> i64
      %8308 = func.call @cc_cons(%8307, %8306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
      %8309 = arith.addi %8308, %__rlasp_stack_elide_zero_394 : i64
      %8310 = func.call @stack_pop_pointer() : () -> i64
      %8311 = func.call @cc_cons(%8310, %8309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8312 = func.call @stack_pop_pointer() : () -> i64
      %8313 = func.call @stack_pop_pointer() : () -> i64
      %8314 = func.call @cc_cons(%8313, %8312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %8315 = arith.addi %8314, %__rlasp_stack_elide_zero_395 : i64
      %8316 = func.call @stack_pop_pointer() : () -> i64
      %8317 = func.call @cc_cons(%8316, %8315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8318 = func.call @stack_pop_pointer() : () -> i64
      %8319 = func.call @stack_pop_pointer() : () -> i64
      %8320 = func.call @cc_cons(%8319, %8318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
      %8321 = arith.addi %8320, %__rlasp_stack_elide_zero_396 : i64
      %8322 = func.call @stack_pop_pointer() : () -> i64
      %8323 = func.call @cc_cons(%8322, %8321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
      %8324 = arith.addi %8323, %__rlasp_stack_elide_zero_397 : i64
      %8325 = func.call @stack_pop_pointer() : () -> i64
      %8326 = func.call @cc_cons(%8325, %8324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8327 = func.call @stack_pop_pointer() : () -> i64
      %8328 = func.call @stack_pop_pointer() : () -> i64
      %8329 = func.call @cc_cons(%8328, %8327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
      %8330 = arith.addi %8329, %__rlasp_stack_elide_zero_398 : i64
      %8331 = func.call @stack_pop_pointer() : () -> i64
      %8332 = func.call @cc_cons(%8331, %8330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
      %8333 = arith.addi %8332, %__rlasp_stack_elide_zero_399 : i64
      %8412 = arith.constant 15079495958555 : i64
      %8413 = arith.constant 0 : i64
      %8414 = func.call @cc_make_closure(%8412, %8413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
      %8415 = arith.addi %8414, %__rlasp_stack_elide_zero_400 : i64
      %8416 = llvm.mlir.addressof @str693 : !llvm.ptr
      %8417 = arith.constant 4 : i64
      %8418 = func.call @cc_make_string(%8416, %8417) : (!llvm.ptr, i64) -> i64
      %8419 = func.call @cc_nil_value() : () -> i64
      %8420 = func.call @cc_intern(%8418, %8419) : (i64, i64) -> i64
      %8421 = func.call @cc_nil_value() : () -> i64
      %8422 = func.call @cc_cons(%8420, %8421) : (i64, i64) -> i64
      %8423 = func.call @cc_values_pack(%8422) : (i64) -> i64
      func.call @stack_push_pointer(%8420) : (i64) -> ()
      %8424 = llvm.mlir.addressof @str694 : !llvm.ptr
      %8425 = arith.constant 10 : i64
      %8426 = func.call @cc_make_string(%8424, %8425) : (!llvm.ptr, i64) -> i64
      %8427 = llvm.mlir.addressof @str695 : !llvm.ptr
      %8428 = arith.constant 11 : i64
      %8429 = func.call @cc_make_string(%8427, %8428) : (!llvm.ptr, i64) -> i64
      %8430 = func.call @cc_intern(%8426, %8429) : (i64, i64) -> i64
      %8431 = func.call @cc_nil_value() : () -> i64
      %8432 = func.call @cc_cons(%8430, %8431) : (i64, i64) -> i64
      %8433 = func.call @cc_values_pack(%8432) : (i64) -> i64
      func.call @stack_push_pointer(%8430) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8434 = func.call @stack_pop_pointer() : () -> i64
      %8435 = func.call @stack_pop_pointer() : () -> i64
      %8436 = func.call @cc_cons(%8435, %8434) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
      %8437 = arith.addi %8436, %__rlasp_stack_elide_zero_401 : i64
      %8438 = func.call @stack_pop_pointer() : () -> i64
      %8439 = func.call @cc_cons(%8438, %8437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
      %8440 = arith.addi %8439, %__rlasp_stack_elide_zero_402 : i64
      %8441 = llvm.mlir.addressof @str696 : !llvm.ptr
      %8442 = arith.constant 11 : i64
      %8443 = func.call @cc_make_string(%8441, %8442) : (!llvm.ptr, i64) -> i64
      %8444 = llvm.mlir.addressof @str697 : !llvm.ptr
      %8445 = arith.constant 7 : i64
      %8446 = func.call @cc_make_string(%8444, %8445) : (!llvm.ptr, i64) -> i64
      %8447 = func.call @cc_intern(%8443, %8446) : (i64, i64) -> i64
      %8448 = func.call @cc_nil_value() : () -> i64
      %8449 = func.call @cc_cons(%8447, %8448) : (i64, i64) -> i64
      %8450 = func.call @cc_values_pack(%8449) : (i64) -> i64
      %8451 = func.call @cc_nil_value() : () -> i64
      %8452 = llvm.mlir.addressof @str698 : !llvm.ptr
      %8453 = arith.constant 4 : i64
      %8454 = func.call @cc_make_string(%8452, %8453) : (!llvm.ptr, i64) -> i64
      %8455 = llvm.mlir.addressof @str699 : !llvm.ptr
      %8456 = arith.constant 7 : i64
      %8457 = func.call @cc_make_string(%8455, %8456) : (!llvm.ptr, i64) -> i64
      %8458 = func.call @cc_intern(%8454, %8457) : (i64, i64) -> i64
      %8459 = func.call @cc_nil_value() : () -> i64
      %8460 = func.call @cc_cons(%8458, %8459) : (i64, i64) -> i64
      %8461 = func.call @cc_values_pack(%8460) : (i64) -> i64
      %8462 = llvm.mlir.addressof @str700 : !llvm.ptr
      %8463 = arith.constant 5 : i64
      %8464 = func.call @cc_make_string(%8462, %8463) : (!llvm.ptr, i64) -> i64
      %8465 = func.call @cc_nil_value() : () -> i64
      %8466 = func.call @cc_intern(%8464, %8465) : (i64, i64) -> i64
      %8467 = func.call @cc_nil_value() : () -> i64
      %8468 = func.call @cc_cons(%8466, %8467) : (i64, i64) -> i64
      %8469 = func.call @cc_values_pack(%8468) : (i64) -> i64
      %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
      %8470 = arith.addi %8466, %__rlasp_stack_elide_zero_403 : i64
      %8471 = func.call @cc_nil_value() : () -> i64
      %8472 = func.call @cc_errorp(%8247) : (i64) -> i64
      %8473 = arith.cmpi ne, %8472, %8471 : i64
      %8474 = arith.cmpi eq, %8471, %8471 : i64
      %8475 = arith.andi %8473, %8474 : i1
      %8476 = scf.if %8475 -> (i64) {
        scf.yield %8247 : i64
      } else {
        scf.yield %8471 : i64
      }
      %8477 = func.call @cc_errorp(%8333) : (i64) -> i64
      %8478 = arith.cmpi ne, %8477, %8471 : i64
      %8479 = arith.cmpi eq, %8476, %8471 : i64
      %8480 = arith.andi %8478, %8479 : i1
      %8481 = scf.if %8480 -> (i64) {
        scf.yield %8333 : i64
      } else {
        scf.yield %8476 : i64
      }
      %8482 = func.call @cc_errorp(%8415) : (i64) -> i64
      %8483 = arith.cmpi ne, %8482, %8471 : i64
      %8484 = arith.cmpi eq, %8481, %8471 : i64
      %8485 = arith.andi %8483, %8484 : i1
      %8486 = scf.if %8485 -> (i64) {
        scf.yield %8415 : i64
      } else {
        scf.yield %8481 : i64
      }
      %8487 = func.call @cc_errorp(%8440) : (i64) -> i64
      %8488 = arith.cmpi ne, %8487, %8471 : i64
      %8489 = arith.cmpi eq, %8486, %8471 : i64
      %8490 = arith.andi %8488, %8489 : i1
      %8491 = scf.if %8490 -> (i64) {
        scf.yield %8440 : i64
      } else {
        scf.yield %8486 : i64
      }
      %8492 = func.call @cc_errorp(%8447) : (i64) -> i64
      %8493 = arith.cmpi ne, %8492, %8471 : i64
      %8494 = arith.cmpi eq, %8491, %8471 : i64
      %8495 = arith.andi %8493, %8494 : i1
      %8496 = scf.if %8495 -> (i64) {
        scf.yield %8447 : i64
      } else {
        scf.yield %8491 : i64
      }
      %8497 = func.call @cc_errorp(%8451) : (i64) -> i64
      %8498 = arith.cmpi ne, %8497, %8471 : i64
      %8499 = arith.cmpi eq, %8496, %8471 : i64
      %8500 = arith.andi %8498, %8499 : i1
      %8501 = scf.if %8500 -> (i64) {
        scf.yield %8451 : i64
      } else {
        scf.yield %8496 : i64
      }
      %8502 = func.call @cc_errorp(%8458) : (i64) -> i64
      %8503 = arith.cmpi ne, %8502, %8471 : i64
      %8504 = arith.cmpi eq, %8501, %8471 : i64
      %8505 = arith.andi %8503, %8504 : i1
      %8506 = scf.if %8505 -> (i64) {
        scf.yield %8458 : i64
      } else {
        scf.yield %8501 : i64
      }
      %8507 = func.call @cc_errorp(%8470) : (i64) -> i64
      %8508 = arith.cmpi ne, %8507, %8471 : i64
      %8509 = arith.cmpi eq, %8506, %8471 : i64
      %8510 = arith.andi %8508, %8509 : i1
      %8511 = scf.if %8510 -> (i64) {
        scf.yield %8470 : i64
      } else {
        scf.yield %8506 : i64
      }
      %8512 = arith.cmpi ne, %8511, %8471 : i64
      scf.if %8512 {
        func.call @stack_push_pointer(%8511) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8247) : (i64) -> ()
        func.call @stack_push_pointer(%8333) : (i64) -> ()
        func.call @stack_push_pointer(%8415) : (i64) -> ()
        func.call @stack_push_pointer(%8440) : (i64) -> ()
        func.call @stack_push_pointer(%8447) : (i64) -> ()
        func.call @stack_push_pointer(%8451) : (i64) -> ()
        func.call @stack_push_pointer(%8458) : (i64) -> ()
        func.call @stack_push_pointer(%8470) : (i64) -> ()
        %8513 = llvm.mlir.addressof @str701 : !llvm.ptr
        %8514 = func.call @cc_make_function_ref_const(%8513) : (!llvm.ptr) -> i64
        %8515 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8514, %8515) : (i64, i64) -> ()
      }
      %8516 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8516 : i64
    }
    %8517 = func.call @cc_nil_value() : () -> i64
    %8518 = func.call @cc_errorp(%8238) : (i64) -> i64
    %8519 = arith.cmpi ne, %8518, %8517 : i64
    %8520 = scf.if %8519 -> (i64) {
      scf.yield %8238 : i64
    } else {
      %8521 = llvm.mlir.addressof @str702 : !llvm.ptr
      %8522 = arith.constant 28 : i64
      %8523 = func.call @cc_make_string(%8521, %8522) : (!llvm.ptr, i64) -> i64
      %8524 = func.call @cc_nil_value() : () -> i64
      %8525 = func.call @cc_intern(%8523, %8524) : (i64, i64) -> i64
      %8526 = func.call @cc_nil_value() : () -> i64
      %8527 = func.call @cc_cons(%8525, %8526) : (i64, i64) -> i64
      %8528 = func.call @cc_values_pack(%8527) : (i64) -> i64
      %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
      %8529 = arith.addi %8525, %__rlasp_stack_elide_zero_404 : i64
      %8530 = llvm.mlir.addressof @str703 : !llvm.ptr
      %8531 = arith.constant 13 : i64
      %8532 = func.call @cc_make_string(%8530, %8531) : (!llvm.ptr, i64) -> i64
      %8533 = llvm.mlir.addressof @str704 : !llvm.ptr
      %8534 = arith.constant 11 : i64
      %8535 = func.call @cc_make_string(%8533, %8534) : (!llvm.ptr, i64) -> i64
      %8536 = func.call @cc_intern(%8532, %8535) : (i64, i64) -> i64
      %8537 = func.call @cc_nil_value() : () -> i64
      %8538 = func.call @cc_cons(%8536, %8537) : (i64, i64) -> i64
      %8539 = func.call @cc_values_pack(%8538) : (i64) -> i64
      func.call @stack_push_pointer(%8536) : (i64) -> ()
      %8540 = llvm.mlir.addressof @str705 : !llvm.ptr
      %8541 = arith.constant 6 : i64
      %8542 = func.call @cc_make_string(%8540, %8541) : (!llvm.ptr, i64) -> i64
      %8543 = func.call @cc_nil_value() : () -> i64
      %8544 = func.call @cc_intern(%8542, %8543) : (i64, i64) -> i64
      %8545 = func.call @cc_nil_value() : () -> i64
      %8546 = func.call @cc_cons(%8544, %8545) : (i64, i64) -> i64
      %8547 = func.call @cc_values_pack(%8546) : (i64) -> i64
      func.call @stack_push_pointer(%8544) : (i64) -> ()
      %8548 = llvm.mlir.addressof @str706 : !llvm.ptr
      %8549 = arith.constant 19 : i64
      %8550 = func.call @cc_make_string(%8548, %8549) : (!llvm.ptr, i64) -> i64
      %8551 = func.call @cc_nil_value() : () -> i64
      %8552 = func.call @cc_intern(%8550, %8551) : (i64, i64) -> i64
      %8553 = func.call @cc_nil_value() : () -> i64
      %8554 = func.call @cc_cons(%8552, %8553) : (i64, i64) -> i64
      %8555 = func.call @cc_values_pack(%8554) : (i64) -> i64
      func.call @stack_push_pointer(%8552) : (i64) -> ()
      %8556 = llvm.mlir.addressof @str707 : !llvm.ptr
      %8557 = arith.constant 10 : i64
      %8558 = func.call @cc_make_string(%8556, %8557) : (!llvm.ptr, i64) -> i64
      %8559 = llvm.mlir.addressof @str708 : !llvm.ptr
      %8560 = arith.constant 11 : i64
      %8561 = func.call @cc_make_string(%8559, %8560) : (!llvm.ptr, i64) -> i64
      %8562 = func.call @cc_intern(%8558, %8561) : (i64, i64) -> i64
      %8563 = func.call @cc_nil_value() : () -> i64
      %8564 = func.call @cc_cons(%8562, %8563) : (i64, i64) -> i64
      %8565 = func.call @cc_values_pack(%8564) : (i64) -> i64
      func.call @stack_push_pointer(%8562) : (i64) -> ()
      %8566 = llvm.mlir.addressof @str709 : !llvm.ptr
      %8567 = arith.constant 4 : i64
      %8568 = func.call @cc_make_string(%8566, %8567) : (!llvm.ptr, i64) -> i64
      %8569 = llvm.mlir.addressof @str710 : !llvm.ptr
      %8570 = arith.constant 11 : i64
      %8571 = func.call @cc_make_string(%8569, %8570) : (!llvm.ptr, i64) -> i64
      %8572 = func.call @cc_intern(%8568, %8571) : (i64, i64) -> i64
      %8573 = func.call @cc_nil_value() : () -> i64
      %8574 = func.call @cc_cons(%8572, %8573) : (i64, i64) -> i64
      %8575 = func.call @cc_values_pack(%8574) : (i64) -> i64
      func.call @stack_push_pointer(%8572) : (i64) -> ()
      %8576 = arith.constant -13 : i64
      func.call @stack_push_fixnum(%8576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8577 = func.call @stack_pop_pointer() : () -> i64
      %8578 = func.call @stack_pop_pointer() : () -> i64
      %8579 = func.call @cc_cons(%8578, %8577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
      %8580 = arith.addi %8579, %__rlasp_stack_elide_zero_405 : i64
      %8581 = func.call @stack_pop_pointer() : () -> i64
      %8582 = func.call @cc_cons(%8581, %8580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8582) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8583 = func.call @stack_pop_pointer() : () -> i64
      %8584 = func.call @stack_pop_pointer() : () -> i64
      %8585 = func.call @cc_cons(%8584, %8583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
      %8586 = arith.addi %8585, %__rlasp_stack_elide_zero_406 : i64
      %8587 = func.call @stack_pop_pointer() : () -> i64
      %8588 = func.call @cc_cons(%8587, %8586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8588) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8589 = func.call @stack_pop_pointer() : () -> i64
      %8590 = func.call @stack_pop_pointer() : () -> i64
      %8591 = func.call @cc_cons(%8590, %8589) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
      %8592 = arith.addi %8591, %__rlasp_stack_elide_zero_407 : i64
      %8593 = func.call @stack_pop_pointer() : () -> i64
      %8594 = func.call @cc_cons(%8593, %8592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8594) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8595 = func.call @stack_pop_pointer() : () -> i64
      %8596 = func.call @stack_pop_pointer() : () -> i64
      %8597 = func.call @cc_cons(%8596, %8595) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
      %8598 = arith.addi %8597, %__rlasp_stack_elide_zero_408 : i64
      %8599 = func.call @stack_pop_pointer() : () -> i64
      %8600 = func.call @cc_cons(%8599, %8598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
      %8601 = arith.addi %8600, %__rlasp_stack_elide_zero_409 : i64
      %8602 = func.call @stack_pop_pointer() : () -> i64
      %8603 = func.call @cc_cons(%8602, %8601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8604 = func.call @stack_pop_pointer() : () -> i64
      %8605 = func.call @stack_pop_pointer() : () -> i64
      %8606 = func.call @cc_cons(%8605, %8604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
      %8607 = arith.addi %8606, %__rlasp_stack_elide_zero_410 : i64
      %8608 = func.call @stack_pop_pointer() : () -> i64
      %8609 = func.call @cc_cons(%8608, %8607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
      %8610 = arith.addi %8609, %__rlasp_stack_elide_zero_411 : i64
      %8678 = arith.constant 15079495958556 : i64
      %8679 = arith.constant 0 : i64
      %8680 = func.call @cc_make_closure(%8678, %8679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
      %8681 = arith.addi %8680, %__rlasp_stack_elide_zero_412 : i64
      %8682 = llvm.mlir.addressof @str712 : !llvm.ptr
      %8683 = arith.constant 4 : i64
      %8684 = func.call @cc_make_string(%8682, %8683) : (!llvm.ptr, i64) -> i64
      %8685 = func.call @cc_nil_value() : () -> i64
      %8686 = func.call @cc_intern(%8684, %8685) : (i64, i64) -> i64
      %8687 = func.call @cc_nil_value() : () -> i64
      %8688 = func.call @cc_cons(%8686, %8687) : (i64, i64) -> i64
      %8689 = func.call @cc_values_pack(%8688) : (i64) -> i64
      func.call @stack_push_pointer(%8686) : (i64) -> ()
      %8690 = llvm.mlir.addressof @str713 : !llvm.ptr
      %8691 = arith.constant 10 : i64
      %8692 = func.call @cc_make_string(%8690, %8691) : (!llvm.ptr, i64) -> i64
      %8693 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8694 = arith.constant 11 : i64
      %8695 = func.call @cc_make_string(%8693, %8694) : (!llvm.ptr, i64) -> i64
      %8696 = func.call @cc_intern(%8692, %8695) : (i64, i64) -> i64
      %8697 = func.call @cc_nil_value() : () -> i64
      %8698 = func.call @cc_cons(%8696, %8697) : (i64, i64) -> i64
      %8699 = func.call @cc_values_pack(%8698) : (i64) -> i64
      func.call @stack_push_pointer(%8696) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8700 = func.call @stack_pop_pointer() : () -> i64
      %8701 = func.call @stack_pop_pointer() : () -> i64
      %8702 = func.call @cc_cons(%8701, %8700) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
      %8703 = arith.addi %8702, %__rlasp_stack_elide_zero_413 : i64
      %8704 = func.call @stack_pop_pointer() : () -> i64
      %8705 = func.call @cc_cons(%8704, %8703) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
      %8706 = arith.addi %8705, %__rlasp_stack_elide_zero_414 : i64
      %8707 = llvm.mlir.addressof @str715 : !llvm.ptr
      %8708 = arith.constant 11 : i64
      %8709 = func.call @cc_make_string(%8707, %8708) : (!llvm.ptr, i64) -> i64
      %8710 = llvm.mlir.addressof @str716 : !llvm.ptr
      %8711 = arith.constant 7 : i64
      %8712 = func.call @cc_make_string(%8710, %8711) : (!llvm.ptr, i64) -> i64
      %8713 = func.call @cc_intern(%8709, %8712) : (i64, i64) -> i64
      %8714 = func.call @cc_nil_value() : () -> i64
      %8715 = func.call @cc_cons(%8713, %8714) : (i64, i64) -> i64
      %8716 = func.call @cc_values_pack(%8715) : (i64) -> i64
      %8717 = func.call @cc_nil_value() : () -> i64
      %8718 = llvm.mlir.addressof @str717 : !llvm.ptr
      %8719 = arith.constant 4 : i64
      %8720 = func.call @cc_make_string(%8718, %8719) : (!llvm.ptr, i64) -> i64
      %8721 = llvm.mlir.addressof @str718 : !llvm.ptr
      %8722 = arith.constant 7 : i64
      %8723 = func.call @cc_make_string(%8721, %8722) : (!llvm.ptr, i64) -> i64
      %8724 = func.call @cc_intern(%8720, %8723) : (i64, i64) -> i64
      %8725 = func.call @cc_nil_value() : () -> i64
      %8726 = func.call @cc_cons(%8724, %8725) : (i64, i64) -> i64
      %8727 = func.call @cc_values_pack(%8726) : (i64) -> i64
      %8728 = llvm.mlir.addressof @str719 : !llvm.ptr
      %8729 = arith.constant 5 : i64
      %8730 = func.call @cc_make_string(%8728, %8729) : (!llvm.ptr, i64) -> i64
      %8731 = func.call @cc_nil_value() : () -> i64
      %8732 = func.call @cc_intern(%8730, %8731) : (i64, i64) -> i64
      %8733 = func.call @cc_nil_value() : () -> i64
      %8734 = func.call @cc_cons(%8732, %8733) : (i64, i64) -> i64
      %8735 = func.call @cc_values_pack(%8734) : (i64) -> i64
      %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
      %8736 = arith.addi %8732, %__rlasp_stack_elide_zero_415 : i64
      %8737 = func.call @cc_nil_value() : () -> i64
      %8738 = func.call @cc_errorp(%8529) : (i64) -> i64
      %8739 = arith.cmpi ne, %8738, %8737 : i64
      %8740 = arith.cmpi eq, %8737, %8737 : i64
      %8741 = arith.andi %8739, %8740 : i1
      %8742 = scf.if %8741 -> (i64) {
        scf.yield %8529 : i64
      } else {
        scf.yield %8737 : i64
      }
      %8743 = func.call @cc_errorp(%8610) : (i64) -> i64
      %8744 = arith.cmpi ne, %8743, %8737 : i64
      %8745 = arith.cmpi eq, %8742, %8737 : i64
      %8746 = arith.andi %8744, %8745 : i1
      %8747 = scf.if %8746 -> (i64) {
        scf.yield %8610 : i64
      } else {
        scf.yield %8742 : i64
      }
      %8748 = func.call @cc_errorp(%8681) : (i64) -> i64
      %8749 = arith.cmpi ne, %8748, %8737 : i64
      %8750 = arith.cmpi eq, %8747, %8737 : i64
      %8751 = arith.andi %8749, %8750 : i1
      %8752 = scf.if %8751 -> (i64) {
        scf.yield %8681 : i64
      } else {
        scf.yield %8747 : i64
      }
      %8753 = func.call @cc_errorp(%8706) : (i64) -> i64
      %8754 = arith.cmpi ne, %8753, %8737 : i64
      %8755 = arith.cmpi eq, %8752, %8737 : i64
      %8756 = arith.andi %8754, %8755 : i1
      %8757 = scf.if %8756 -> (i64) {
        scf.yield %8706 : i64
      } else {
        scf.yield %8752 : i64
      }
      %8758 = func.call @cc_errorp(%8713) : (i64) -> i64
      %8759 = arith.cmpi ne, %8758, %8737 : i64
      %8760 = arith.cmpi eq, %8757, %8737 : i64
      %8761 = arith.andi %8759, %8760 : i1
      %8762 = scf.if %8761 -> (i64) {
        scf.yield %8713 : i64
      } else {
        scf.yield %8757 : i64
      }
      %8763 = func.call @cc_errorp(%8717) : (i64) -> i64
      %8764 = arith.cmpi ne, %8763, %8737 : i64
      %8765 = arith.cmpi eq, %8762, %8737 : i64
      %8766 = arith.andi %8764, %8765 : i1
      %8767 = scf.if %8766 -> (i64) {
        scf.yield %8717 : i64
      } else {
        scf.yield %8762 : i64
      }
      %8768 = func.call @cc_errorp(%8724) : (i64) -> i64
      %8769 = arith.cmpi ne, %8768, %8737 : i64
      %8770 = arith.cmpi eq, %8767, %8737 : i64
      %8771 = arith.andi %8769, %8770 : i1
      %8772 = scf.if %8771 -> (i64) {
        scf.yield %8724 : i64
      } else {
        scf.yield %8767 : i64
      }
      %8773 = func.call @cc_errorp(%8736) : (i64) -> i64
      %8774 = arith.cmpi ne, %8773, %8737 : i64
      %8775 = arith.cmpi eq, %8772, %8737 : i64
      %8776 = arith.andi %8774, %8775 : i1
      %8777 = scf.if %8776 -> (i64) {
        scf.yield %8736 : i64
      } else {
        scf.yield %8772 : i64
      }
      %8778 = arith.cmpi ne, %8777, %8737 : i64
      scf.if %8778 {
        func.call @stack_push_pointer(%8777) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8529) : (i64) -> ()
        func.call @stack_push_pointer(%8610) : (i64) -> ()
        func.call @stack_push_pointer(%8681) : (i64) -> ()
        func.call @stack_push_pointer(%8706) : (i64) -> ()
        func.call @stack_push_pointer(%8713) : (i64) -> ()
        func.call @stack_push_pointer(%8717) : (i64) -> ()
        func.call @stack_push_pointer(%8724) : (i64) -> ()
        func.call @stack_push_pointer(%8736) : (i64) -> ()
        %8779 = llvm.mlir.addressof @str720 : !llvm.ptr
        %8780 = func.call @cc_make_function_ref_const(%8779) : (!llvm.ptr) -> i64
        %8781 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8780, %8781) : (i64, i64) -> ()
      }
      %8782 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8782 : i64
    }
    %8783 = func.call @cc_nil_value() : () -> i64
    %8784 = func.call @cc_errorp(%8520) : (i64) -> i64
    %8785 = arith.cmpi ne, %8784, %8783 : i64
    %8786 = scf.if %8785 -> (i64) {
      scf.yield %8520 : i64
    } else {
      %8787 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8788 = arith.constant 24 : i64
      %8789 = func.call @cc_make_string(%8787, %8788) : (!llvm.ptr, i64) -> i64
      %8790 = func.call @cc_nil_value() : () -> i64
      %8791 = func.call @cc_intern(%8789, %8790) : (i64, i64) -> i64
      %8792 = func.call @cc_nil_value() : () -> i64
      %8793 = func.call @cc_cons(%8791, %8792) : (i64, i64) -> i64
      %8794 = func.call @cc_values_pack(%8793) : (i64) -> i64
      %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
      %8795 = arith.addi %8791, %__rlasp_stack_elide_zero_416 : i64
      %8796 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8797 = arith.constant 13 : i64
      %8798 = func.call @cc_make_string(%8796, %8797) : (!llvm.ptr, i64) -> i64
      %8799 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8800 = arith.constant 11 : i64
      %8801 = func.call @cc_make_string(%8799, %8800) : (!llvm.ptr, i64) -> i64
      %8802 = func.call @cc_intern(%8798, %8801) : (i64, i64) -> i64
      %8803 = func.call @cc_nil_value() : () -> i64
      %8804 = func.call @cc_cons(%8802, %8803) : (i64, i64) -> i64
      %8805 = func.call @cc_values_pack(%8804) : (i64) -> i64
      func.call @stack_push_pointer(%8802) : (i64) -> ()
      %8806 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8807 = arith.constant 6 : i64
      %8808 = func.call @cc_make_string(%8806, %8807) : (!llvm.ptr, i64) -> i64
      %8809 = func.call @cc_nil_value() : () -> i64
      %8810 = func.call @cc_intern(%8808, %8809) : (i64, i64) -> i64
      %8811 = func.call @cc_nil_value() : () -> i64
      %8812 = func.call @cc_cons(%8810, %8811) : (i64, i64) -> i64
      %8813 = func.call @cc_values_pack(%8812) : (i64) -> i64
      func.call @stack_push_pointer(%8810) : (i64) -> ()
      %8814 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8815 = arith.constant 19 : i64
      %8816 = func.call @cc_make_string(%8814, %8815) : (!llvm.ptr, i64) -> i64
      %8817 = func.call @cc_nil_value() : () -> i64
      %8818 = func.call @cc_intern(%8816, %8817) : (i64, i64) -> i64
      %8819 = func.call @cc_nil_value() : () -> i64
      %8820 = func.call @cc_cons(%8818, %8819) : (i64, i64) -> i64
      %8821 = func.call @cc_values_pack(%8820) : (i64) -> i64
      func.call @stack_push_pointer(%8818) : (i64) -> ()
      %8822 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8823 = arith.constant 7 : i64
      %8824 = func.call @cc_make_string(%8822, %8823) : (!llvm.ptr, i64) -> i64
      %8825 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8826 = arith.constant 11 : i64
      %8827 = func.call @cc_make_string(%8825, %8826) : (!llvm.ptr, i64) -> i64
      %8828 = func.call @cc_intern(%8824, %8827) : (i64, i64) -> i64
      %8829 = func.call @cc_nil_value() : () -> i64
      %8830 = func.call @cc_cons(%8828, %8829) : (i64, i64) -> i64
      %8831 = func.call @cc_values_pack(%8830) : (i64) -> i64
      func.call @stack_push_pointer(%8828) : (i64) -> ()
      %8832 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8833 = arith.constant 7 : i64
      %8834 = func.call @cc_make_string(%8832, %8833) : (!llvm.ptr, i64) -> i64
      %8835 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8836 = arith.constant 11 : i64
      %8837 = func.call @cc_make_string(%8835, %8836) : (!llvm.ptr, i64) -> i64
      %8838 = func.call @cc_intern(%8834, %8837) : (i64, i64) -> i64
      %8839 = func.call @cc_nil_value() : () -> i64
      %8840 = func.call @cc_cons(%8838, %8839) : (i64, i64) -> i64
      %8841 = func.call @cc_values_pack(%8840) : (i64) -> i64
      func.call @stack_push_pointer(%8838) : (i64) -> ()
      %8842 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8843 = arith.constant 9 : i64
      %8844 = func.call @cc_make_string(%8842, %8843) : (!llvm.ptr, i64) -> i64
      %8845 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8846 = arith.constant 11 : i64
      %8847 = func.call @cc_make_string(%8845, %8846) : (!llvm.ptr, i64) -> i64
      %8848 = func.call @cc_intern(%8844, %8847) : (i64, i64) -> i64
      %8849 = func.call @cc_nil_value() : () -> i64
      %8850 = func.call @cc_cons(%8848, %8849) : (i64, i64) -> i64
      %8851 = func.call @cc_values_pack(%8850) : (i64) -> i64
      func.call @stack_push_pointer(%8848) : (i64) -> ()
      %8852 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8853 = arith.constant 10 : i64
      %8854 = func.call @cc_make_string(%8852, %8853) : (!llvm.ptr, i64) -> i64
      %8855 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8856 = arith.constant 11 : i64
      %8857 = func.call @cc_make_string(%8855, %8856) : (!llvm.ptr, i64) -> i64
      %8858 = func.call @cc_intern(%8854, %8857) : (i64, i64) -> i64
      %8859 = func.call @cc_nil_value() : () -> i64
      %8860 = func.call @cc_cons(%8858, %8859) : (i64, i64) -> i64
      %8861 = func.call @cc_values_pack(%8860) : (i64) -> i64
      func.call @stack_push_pointer(%8858) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8862 = func.call @stack_pop_pointer() : () -> i64
      %8863 = func.call @stack_pop_pointer() : () -> i64
      %8864 = func.call @cc_cons(%8863, %8862) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
      %8865 = arith.addi %8864, %__rlasp_stack_elide_zero_417 : i64
      %8866 = func.call @stack_pop_pointer() : () -> i64
      %8867 = func.call @cc_cons(%8866, %8865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8868 = func.call @stack_pop_pointer() : () -> i64
      %8869 = func.call @stack_pop_pointer() : () -> i64
      %8870 = func.call @cc_cons(%8869, %8868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %8871 = arith.addi %8870, %__rlasp_stack_elide_zero_418 : i64
      %8872 = func.call @stack_pop_pointer() : () -> i64
      %8873 = func.call @cc_cons(%8872, %8871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8873) : (i64) -> ()
      %8874 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8875 = arith.constant 10 : i64
      %8876 = func.call @cc_make_string(%8874, %8875) : (!llvm.ptr, i64) -> i64
      %8877 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8878 = arith.constant 11 : i64
      %8879 = func.call @cc_make_string(%8877, %8878) : (!llvm.ptr, i64) -> i64
      %8880 = func.call @cc_intern(%8876, %8879) : (i64, i64) -> i64
      %8881 = func.call @cc_nil_value() : () -> i64
      %8882 = func.call @cc_cons(%8880, %8881) : (i64, i64) -> i64
      %8883 = func.call @cc_values_pack(%8882) : (i64) -> i64
      func.call @stack_push_pointer(%8880) : (i64) -> ()
      %8884 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8885 = arith.constant 2 : i64
      %8886 = func.call @cc_make_string(%8884, %8885) : (!llvm.ptr, i64) -> i64
      %8887 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8888 = arith.constant 11 : i64
      %8889 = func.call @cc_make_string(%8887, %8888) : (!llvm.ptr, i64) -> i64
      %8890 = func.call @cc_intern(%8886, %8889) : (i64, i64) -> i64
      %8891 = func.call @cc_nil_value() : () -> i64
      %8892 = func.call @cc_cons(%8890, %8891) : (i64, i64) -> i64
      %8893 = func.call @cc_values_pack(%8892) : (i64) -> i64
      func.call @stack_push_pointer(%8890) : (i64) -> ()
      %8894 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8895 = arith.constant 22 : i64
      %8896 = func.call @cc_make_string(%8894, %8895) : (!llvm.ptr, i64) -> i64
      %8897 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8898 = arith.constant 11 : i64
      %8899 = func.call @cc_make_string(%8897, %8898) : (!llvm.ptr, i64) -> i64
      %8900 = func.call @cc_intern(%8896, %8899) : (i64, i64) -> i64
      %8901 = func.call @cc_nil_value() : () -> i64
      %8902 = func.call @cc_cons(%8900, %8901) : (i64, i64) -> i64
      %8903 = func.call @cc_values_pack(%8902) : (i64) -> i64
      func.call @stack_push_pointer(%8900) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8904 = func.call @stack_pop_pointer() : () -> i64
      %8905 = func.call @stack_pop_pointer() : () -> i64
      %8906 = func.call @cc_cons(%8905, %8904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
      %8907 = arith.addi %8906, %__rlasp_stack_elide_zero_419 : i64
      %8908 = func.call @stack_pop_pointer() : () -> i64
      %8909 = func.call @cc_cons(%8908, %8907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8910 = func.call @stack_pop_pointer() : () -> i64
      %8911 = func.call @stack_pop_pointer() : () -> i64
      %8912 = func.call @cc_cons(%8911, %8910) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
      %8913 = arith.addi %8912, %__rlasp_stack_elide_zero_420 : i64
      %8914 = func.call @stack_pop_pointer() : () -> i64
      %8915 = func.call @cc_cons(%8914, %8913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8915) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8916 = func.call @stack_pop_pointer() : () -> i64
      %8917 = func.call @stack_pop_pointer() : () -> i64
      %8918 = func.call @cc_cons(%8917, %8916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
      %8919 = arith.addi %8918, %__rlasp_stack_elide_zero_421 : i64
      %8920 = func.call @stack_pop_pointer() : () -> i64
      %8921 = func.call @cc_cons(%8920, %8919) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %8922 = arith.addi %8921, %__rlasp_stack_elide_zero_422 : i64
      %8923 = func.call @stack_pop_pointer() : () -> i64
      %8924 = func.call @cc_cons(%8923, %8922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8924) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8925 = func.call @stack_pop_pointer() : () -> i64
      %8926 = func.call @stack_pop_pointer() : () -> i64
      %8927 = func.call @cc_cons(%8926, %8925) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %8928 = arith.addi %8927, %__rlasp_stack_elide_zero_423 : i64
      %8929 = func.call @stack_pop_pointer() : () -> i64
      %8930 = func.call @cc_cons(%8929, %8928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8930) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8931 = func.call @stack_pop_pointer() : () -> i64
      %8932 = func.call @stack_pop_pointer() : () -> i64
      %8933 = func.call @cc_cons(%8932, %8931) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %8934 = arith.addi %8933, %__rlasp_stack_elide_zero_424 : i64
      %8935 = func.call @stack_pop_pointer() : () -> i64
      %8936 = func.call @cc_cons(%8935, %8934) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
      %8937 = arith.addi %8936, %__rlasp_stack_elide_zero_425 : i64
      %8938 = func.call @stack_pop_pointer() : () -> i64
      %8939 = func.call @cc_cons(%8938, %8937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8939) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8940 = func.call @stack_pop_pointer() : () -> i64
      %8941 = func.call @stack_pop_pointer() : () -> i64
      %8942 = func.call @cc_cons(%8941, %8940) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
      %8943 = arith.addi %8942, %__rlasp_stack_elide_zero_426 : i64
      %8944 = func.call @stack_pop_pointer() : () -> i64
      %8945 = func.call @cc_cons(%8944, %8943) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
      %8946 = arith.addi %8945, %__rlasp_stack_elide_zero_427 : i64
      %9045 = arith.constant 15079495958557 : i64
      %9046 = arith.constant 0 : i64
      %9047 = func.call @cc_make_closure(%9045, %9046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
      %9048 = arith.addi %9047, %__rlasp_stack_elide_zero_428 : i64
      %9049 = llvm.mlir.addressof @str743 : !llvm.ptr
      %9050 = arith.constant 4 : i64
      %9051 = func.call @cc_make_string(%9049, %9050) : (!llvm.ptr, i64) -> i64
      %9052 = func.call @cc_nil_value() : () -> i64
      %9053 = func.call @cc_intern(%9051, %9052) : (i64, i64) -> i64
      %9054 = func.call @cc_nil_value() : () -> i64
      %9055 = func.call @cc_cons(%9053, %9054) : (i64, i64) -> i64
      %9056 = func.call @cc_values_pack(%9055) : (i64) -> i64
      func.call @stack_push_pointer(%9053) : (i64) -> ()
      %9057 = llvm.mlir.addressof @str744 : !llvm.ptr
      %9058 = arith.constant 10 : i64
      %9059 = func.call @cc_make_string(%9057, %9058) : (!llvm.ptr, i64) -> i64
      %9060 = llvm.mlir.addressof @str745 : !llvm.ptr
      %9061 = arith.constant 11 : i64
      %9062 = func.call @cc_make_string(%9060, %9061) : (!llvm.ptr, i64) -> i64
      %9063 = func.call @cc_intern(%9059, %9062) : (i64, i64) -> i64
      %9064 = func.call @cc_nil_value() : () -> i64
      %9065 = func.call @cc_cons(%9063, %9064) : (i64, i64) -> i64
      %9066 = func.call @cc_values_pack(%9065) : (i64) -> i64
      func.call @stack_push_pointer(%9063) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9067 = func.call @stack_pop_pointer() : () -> i64
      %9068 = func.call @stack_pop_pointer() : () -> i64
      %9069 = func.call @cc_cons(%9068, %9067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
      %9070 = arith.addi %9069, %__rlasp_stack_elide_zero_429 : i64
      %9071 = func.call @stack_pop_pointer() : () -> i64
      %9072 = func.call @cc_cons(%9071, %9070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
      %9073 = arith.addi %9072, %__rlasp_stack_elide_zero_430 : i64
      %9074 = llvm.mlir.addressof @str746 : !llvm.ptr
      %9075 = arith.constant 11 : i64
      %9076 = func.call @cc_make_string(%9074, %9075) : (!llvm.ptr, i64) -> i64
      %9077 = llvm.mlir.addressof @str747 : !llvm.ptr
      %9078 = arith.constant 7 : i64
      %9079 = func.call @cc_make_string(%9077, %9078) : (!llvm.ptr, i64) -> i64
      %9080 = func.call @cc_intern(%9076, %9079) : (i64, i64) -> i64
      %9081 = func.call @cc_nil_value() : () -> i64
      %9082 = func.call @cc_cons(%9080, %9081) : (i64, i64) -> i64
      %9083 = func.call @cc_values_pack(%9082) : (i64) -> i64
      %9084 = func.call @cc_nil_value() : () -> i64
      %9085 = llvm.mlir.addressof @str748 : !llvm.ptr
      %9086 = arith.constant 4 : i64
      %9087 = func.call @cc_make_string(%9085, %9086) : (!llvm.ptr, i64) -> i64
      %9088 = llvm.mlir.addressof @str749 : !llvm.ptr
      %9089 = arith.constant 7 : i64
      %9090 = func.call @cc_make_string(%9088, %9089) : (!llvm.ptr, i64) -> i64
      %9091 = func.call @cc_intern(%9087, %9090) : (i64, i64) -> i64
      %9092 = func.call @cc_nil_value() : () -> i64
      %9093 = func.call @cc_cons(%9091, %9092) : (i64, i64) -> i64
      %9094 = func.call @cc_values_pack(%9093) : (i64) -> i64
      %9095 = llvm.mlir.addressof @str750 : !llvm.ptr
      %9096 = arith.constant 5 : i64
      %9097 = func.call @cc_make_string(%9095, %9096) : (!llvm.ptr, i64) -> i64
      %9098 = func.call @cc_nil_value() : () -> i64
      %9099 = func.call @cc_intern(%9097, %9098) : (i64, i64) -> i64
      %9100 = func.call @cc_nil_value() : () -> i64
      %9101 = func.call @cc_cons(%9099, %9100) : (i64, i64) -> i64
      %9102 = func.call @cc_values_pack(%9101) : (i64) -> i64
      %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
      %9103 = arith.addi %9099, %__rlasp_stack_elide_zero_431 : i64
      %9104 = func.call @cc_nil_value() : () -> i64
      %9105 = func.call @cc_errorp(%8795) : (i64) -> i64
      %9106 = arith.cmpi ne, %9105, %9104 : i64
      %9107 = arith.cmpi eq, %9104, %9104 : i64
      %9108 = arith.andi %9106, %9107 : i1
      %9109 = scf.if %9108 -> (i64) {
        scf.yield %8795 : i64
      } else {
        scf.yield %9104 : i64
      }
      %9110 = func.call @cc_errorp(%8946) : (i64) -> i64
      %9111 = arith.cmpi ne, %9110, %9104 : i64
      %9112 = arith.cmpi eq, %9109, %9104 : i64
      %9113 = arith.andi %9111, %9112 : i1
      %9114 = scf.if %9113 -> (i64) {
        scf.yield %8946 : i64
      } else {
        scf.yield %9109 : i64
      }
      %9115 = func.call @cc_errorp(%9048) : (i64) -> i64
      %9116 = arith.cmpi ne, %9115, %9104 : i64
      %9117 = arith.cmpi eq, %9114, %9104 : i64
      %9118 = arith.andi %9116, %9117 : i1
      %9119 = scf.if %9118 -> (i64) {
        scf.yield %9048 : i64
      } else {
        scf.yield %9114 : i64
      }
      %9120 = func.call @cc_errorp(%9073) : (i64) -> i64
      %9121 = arith.cmpi ne, %9120, %9104 : i64
      %9122 = arith.cmpi eq, %9119, %9104 : i64
      %9123 = arith.andi %9121, %9122 : i1
      %9124 = scf.if %9123 -> (i64) {
        scf.yield %9073 : i64
      } else {
        scf.yield %9119 : i64
      }
      %9125 = func.call @cc_errorp(%9080) : (i64) -> i64
      %9126 = arith.cmpi ne, %9125, %9104 : i64
      %9127 = arith.cmpi eq, %9124, %9104 : i64
      %9128 = arith.andi %9126, %9127 : i1
      %9129 = scf.if %9128 -> (i64) {
        scf.yield %9080 : i64
      } else {
        scf.yield %9124 : i64
      }
      %9130 = func.call @cc_errorp(%9084) : (i64) -> i64
      %9131 = arith.cmpi ne, %9130, %9104 : i64
      %9132 = arith.cmpi eq, %9129, %9104 : i64
      %9133 = arith.andi %9131, %9132 : i1
      %9134 = scf.if %9133 -> (i64) {
        scf.yield %9084 : i64
      } else {
        scf.yield %9129 : i64
      }
      %9135 = func.call @cc_errorp(%9091) : (i64) -> i64
      %9136 = arith.cmpi ne, %9135, %9104 : i64
      %9137 = arith.cmpi eq, %9134, %9104 : i64
      %9138 = arith.andi %9136, %9137 : i1
      %9139 = scf.if %9138 -> (i64) {
        scf.yield %9091 : i64
      } else {
        scf.yield %9134 : i64
      }
      %9140 = func.call @cc_errorp(%9103) : (i64) -> i64
      %9141 = arith.cmpi ne, %9140, %9104 : i64
      %9142 = arith.cmpi eq, %9139, %9104 : i64
      %9143 = arith.andi %9141, %9142 : i1
      %9144 = scf.if %9143 -> (i64) {
        scf.yield %9103 : i64
      } else {
        scf.yield %9139 : i64
      }
      %9145 = arith.cmpi ne, %9144, %9104 : i64
      scf.if %9145 {
        func.call @stack_push_pointer(%9144) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8795) : (i64) -> ()
        func.call @stack_push_pointer(%8946) : (i64) -> ()
        func.call @stack_push_pointer(%9048) : (i64) -> ()
        func.call @stack_push_pointer(%9073) : (i64) -> ()
        func.call @stack_push_pointer(%9080) : (i64) -> ()
        func.call @stack_push_pointer(%9084) : (i64) -> ()
        func.call @stack_push_pointer(%9091) : (i64) -> ()
        func.call @stack_push_pointer(%9103) : (i64) -> ()
        %9146 = llvm.mlir.addressof @str751 : !llvm.ptr
        %9147 = func.call @cc_make_function_ref_const(%9146) : (!llvm.ptr) -> i64
        %9148 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9147, %9148) : (i64, i64) -> ()
      }
      %9149 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9149 : i64
    }
    %9150 = func.call @cc_nil_value() : () -> i64
    %9151 = func.call @cc_errorp(%8786) : (i64) -> i64
    %9152 = arith.cmpi ne, %9151, %9150 : i64
    %9153 = scf.if %9152 -> (i64) {
      scf.yield %8786 : i64
    } else {
      %9154 = llvm.mlir.addressof @str752 : !llvm.ptr
      %9155 = arith.constant 29 : i64
      %9156 = func.call @cc_make_string(%9154, %9155) : (!llvm.ptr, i64) -> i64
      %9157 = func.call @cc_nil_value() : () -> i64
      %9158 = func.call @cc_intern(%9156, %9157) : (i64, i64) -> i64
      %9159 = func.call @cc_nil_value() : () -> i64
      %9160 = func.call @cc_cons(%9158, %9159) : (i64, i64) -> i64
      %9161 = func.call @cc_values_pack(%9160) : (i64) -> i64
      %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
      %9162 = arith.addi %9158, %__rlasp_stack_elide_zero_432 : i64
      %9163 = llvm.mlir.addressof @str753 : !llvm.ptr
      %9164 = arith.constant 13 : i64
      %9165 = func.call @cc_make_string(%9163, %9164) : (!llvm.ptr, i64) -> i64
      %9166 = llvm.mlir.addressof @str754 : !llvm.ptr
      %9167 = arith.constant 11 : i64
      %9168 = func.call @cc_make_string(%9166, %9167) : (!llvm.ptr, i64) -> i64
      %9169 = func.call @cc_intern(%9165, %9168) : (i64, i64) -> i64
      %9170 = func.call @cc_nil_value() : () -> i64
      %9171 = func.call @cc_cons(%9169, %9170) : (i64, i64) -> i64
      %9172 = func.call @cc_values_pack(%9171) : (i64) -> i64
      func.call @stack_push_pointer(%9169) : (i64) -> ()
      %9173 = llvm.mlir.addressof @str755 : !llvm.ptr
      %9174 = arith.constant 6 : i64
      %9175 = func.call @cc_make_string(%9173, %9174) : (!llvm.ptr, i64) -> i64
      %9176 = func.call @cc_nil_value() : () -> i64
      %9177 = func.call @cc_intern(%9175, %9176) : (i64, i64) -> i64
      %9178 = func.call @cc_nil_value() : () -> i64
      %9179 = func.call @cc_cons(%9177, %9178) : (i64, i64) -> i64
      %9180 = func.call @cc_values_pack(%9179) : (i64) -> i64
      func.call @stack_push_pointer(%9177) : (i64) -> ()
      %9181 = llvm.mlir.addressof @str756 : !llvm.ptr
      %9182 = arith.constant 19 : i64
      %9183 = func.call @cc_make_string(%9181, %9182) : (!llvm.ptr, i64) -> i64
      %9184 = func.call @cc_nil_value() : () -> i64
      %9185 = func.call @cc_intern(%9183, %9184) : (i64, i64) -> i64
      %9186 = func.call @cc_nil_value() : () -> i64
      %9187 = func.call @cc_cons(%9185, %9186) : (i64, i64) -> i64
      %9188 = func.call @cc_values_pack(%9187) : (i64) -> i64
      func.call @stack_push_pointer(%9185) : (i64) -> ()
      %9189 = llvm.mlir.addressof @str757 : !llvm.ptr
      %9190 = arith.constant 7 : i64
      %9191 = func.call @cc_make_string(%9189, %9190) : (!llvm.ptr, i64) -> i64
      %9192 = llvm.mlir.addressof @str758 : !llvm.ptr
      %9193 = arith.constant 11 : i64
      %9194 = func.call @cc_make_string(%9192, %9193) : (!llvm.ptr, i64) -> i64
      %9195 = func.call @cc_intern(%9191, %9194) : (i64, i64) -> i64
      %9196 = func.call @cc_nil_value() : () -> i64
      %9197 = func.call @cc_cons(%9195, %9196) : (i64, i64) -> i64
      %9198 = func.call @cc_values_pack(%9197) : (i64) -> i64
      func.call @stack_push_pointer(%9195) : (i64) -> ()
      %9199 = llvm.mlir.addressof @str759 : !llvm.ptr
      %9200 = arith.constant 7 : i64
      %9201 = func.call @cc_make_string(%9199, %9200) : (!llvm.ptr, i64) -> i64
      %9202 = llvm.mlir.addressof @str760 : !llvm.ptr
      %9203 = arith.constant 11 : i64
      %9204 = func.call @cc_make_string(%9202, %9203) : (!llvm.ptr, i64) -> i64
      %9205 = func.call @cc_intern(%9201, %9204) : (i64, i64) -> i64
      %9206 = func.call @cc_nil_value() : () -> i64
      %9207 = func.call @cc_cons(%9205, %9206) : (i64, i64) -> i64
      %9208 = func.call @cc_values_pack(%9207) : (i64) -> i64
      func.call @stack_push_pointer(%9205) : (i64) -> ()
      %9209 = llvm.mlir.addressof @str761 : !llvm.ptr
      %9210 = arith.constant 9 : i64
      %9211 = func.call @cc_make_string(%9209, %9210) : (!llvm.ptr, i64) -> i64
      %9212 = llvm.mlir.addressof @str762 : !llvm.ptr
      %9213 = arith.constant 11 : i64
      %9214 = func.call @cc_make_string(%9212, %9213) : (!llvm.ptr, i64) -> i64
      %9215 = func.call @cc_intern(%9211, %9214) : (i64, i64) -> i64
      %9216 = func.call @cc_nil_value() : () -> i64
      %9217 = func.call @cc_cons(%9215, %9216) : (i64, i64) -> i64
      %9218 = func.call @cc_values_pack(%9217) : (i64) -> i64
      func.call @stack_push_pointer(%9215) : (i64) -> ()
      %9219 = llvm.mlir.addressof @str763 : !llvm.ptr
      %9220 = arith.constant 10 : i64
      %9221 = func.call @cc_make_string(%9219, %9220) : (!llvm.ptr, i64) -> i64
      %9222 = llvm.mlir.addressof @str764 : !llvm.ptr
      %9223 = arith.constant 11 : i64
      %9224 = func.call @cc_make_string(%9222, %9223) : (!llvm.ptr, i64) -> i64
      %9225 = func.call @cc_intern(%9221, %9224) : (i64, i64) -> i64
      %9226 = func.call @cc_nil_value() : () -> i64
      %9227 = func.call @cc_cons(%9225, %9226) : (i64, i64) -> i64
      %9228 = func.call @cc_values_pack(%9227) : (i64) -> i64
      func.call @stack_push_pointer(%9225) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9229 = func.call @stack_pop_pointer() : () -> i64
      %9230 = func.call @stack_pop_pointer() : () -> i64
      %9231 = func.call @cc_cons(%9230, %9229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
      %9232 = arith.addi %9231, %__rlasp_stack_elide_zero_433 : i64
      %9233 = func.call @stack_pop_pointer() : () -> i64
      %9234 = func.call @cc_cons(%9233, %9232) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9234) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9235 = func.call @stack_pop_pointer() : () -> i64
      %9236 = func.call @stack_pop_pointer() : () -> i64
      %9237 = func.call @cc_cons(%9236, %9235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
      %9238 = arith.addi %9237, %__rlasp_stack_elide_zero_434 : i64
      %9239 = func.call @stack_pop_pointer() : () -> i64
      %9240 = func.call @cc_cons(%9239, %9238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9240) : (i64) -> ()
      %9241 = llvm.mlir.addressof @str765 : !llvm.ptr
      %9242 = arith.constant 10 : i64
      %9243 = func.call @cc_make_string(%9241, %9242) : (!llvm.ptr, i64) -> i64
      %9244 = llvm.mlir.addressof @str766 : !llvm.ptr
      %9245 = arith.constant 11 : i64
      %9246 = func.call @cc_make_string(%9244, %9245) : (!llvm.ptr, i64) -> i64
      %9247 = func.call @cc_intern(%9243, %9246) : (i64, i64) -> i64
      %9248 = func.call @cc_nil_value() : () -> i64
      %9249 = func.call @cc_cons(%9247, %9248) : (i64, i64) -> i64
      %9250 = func.call @cc_values_pack(%9249) : (i64) -> i64
      func.call @stack_push_pointer(%9247) : (i64) -> ()
      %9251 = llvm.mlir.addressof @str767 : !llvm.ptr
      %9252 = arith.constant 4 : i64
      %9253 = func.call @cc_make_string(%9251, %9252) : (!llvm.ptr, i64) -> i64
      %9254 = llvm.mlir.addressof @str768 : !llvm.ptr
      %9255 = arith.constant 11 : i64
      %9256 = func.call @cc_make_string(%9254, %9255) : (!llvm.ptr, i64) -> i64
      %9257 = func.call @cc_intern(%9253, %9256) : (i64, i64) -> i64
      %9258 = func.call @cc_nil_value() : () -> i64
      %9259 = func.call @cc_cons(%9257, %9258) : (i64, i64) -> i64
      %9260 = func.call @cc_values_pack(%9259) : (i64) -> i64
      func.call @stack_push_pointer(%9257) : (i64) -> ()
      %9261 = llvm.mlir.addressof @str769 : !llvm.ptr
      %9262 = arith.constant 2 : i64
      %9263 = func.call @cc_make_string(%9261, %9262) : (!llvm.ptr, i64) -> i64
      %9264 = llvm.mlir.addressof @str770 : !llvm.ptr
      %9265 = arith.constant 11 : i64
      %9266 = func.call @cc_make_string(%9264, %9265) : (!llvm.ptr, i64) -> i64
      %9267 = func.call @cc_intern(%9263, %9266) : (i64, i64) -> i64
      %9268 = func.call @cc_nil_value() : () -> i64
      %9269 = func.call @cc_cons(%9267, %9268) : (i64, i64) -> i64
      %9270 = func.call @cc_values_pack(%9269) : (i64) -> i64
      func.call @stack_push_pointer(%9267) : (i64) -> ()
      %9271 = llvm.mlir.addressof @str771 : !llvm.ptr
      %9272 = arith.constant 22 : i64
      %9273 = func.call @cc_make_string(%9271, %9272) : (!llvm.ptr, i64) -> i64
      %9274 = llvm.mlir.addressof @str772 : !llvm.ptr
      %9275 = arith.constant 11 : i64
      %9276 = func.call @cc_make_string(%9274, %9275) : (!llvm.ptr, i64) -> i64
      %9277 = func.call @cc_intern(%9273, %9276) : (i64, i64) -> i64
      %9278 = func.call @cc_nil_value() : () -> i64
      %9279 = func.call @cc_cons(%9277, %9278) : (i64, i64) -> i64
      %9280 = func.call @cc_values_pack(%9279) : (i64) -> i64
      func.call @stack_push_pointer(%9277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9281 = func.call @stack_pop_pointer() : () -> i64
      %9282 = func.call @stack_pop_pointer() : () -> i64
      %9283 = func.call @cc_cons(%9282, %9281) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
      %9284 = arith.addi %9283, %__rlasp_stack_elide_zero_435 : i64
      %9285 = func.call @stack_pop_pointer() : () -> i64
      %9286 = func.call @cc_cons(%9285, %9284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9286) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9287 = func.call @stack_pop_pointer() : () -> i64
      %9288 = func.call @stack_pop_pointer() : () -> i64
      %9289 = func.call @cc_cons(%9288, %9287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %9290 = arith.addi %9289, %__rlasp_stack_elide_zero_436 : i64
      %9291 = func.call @stack_pop_pointer() : () -> i64
      %9292 = func.call @cc_cons(%9291, %9290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9292) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9293 = func.call @stack_pop_pointer() : () -> i64
      %9294 = func.call @stack_pop_pointer() : () -> i64
      %9295 = func.call @cc_cons(%9294, %9293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %9296 = arith.addi %9295, %__rlasp_stack_elide_zero_437 : i64
      %9297 = func.call @stack_pop_pointer() : () -> i64
      %9298 = func.call @cc_cons(%9297, %9296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9299 = func.call @stack_pop_pointer() : () -> i64
      %9300 = func.call @stack_pop_pointer() : () -> i64
      %9301 = func.call @cc_cons(%9300, %9299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %9302 = arith.addi %9301, %__rlasp_stack_elide_zero_438 : i64
      %9303 = func.call @stack_pop_pointer() : () -> i64
      %9304 = func.call @cc_cons(%9303, %9302) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %9305 = arith.addi %9304, %__rlasp_stack_elide_zero_439 : i64
      %9306 = func.call @stack_pop_pointer() : () -> i64
      %9307 = func.call @cc_cons(%9306, %9305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9307) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9308 = func.call @stack_pop_pointer() : () -> i64
      %9309 = func.call @stack_pop_pointer() : () -> i64
      %9310 = func.call @cc_cons(%9309, %9308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %9311 = arith.addi %9310, %__rlasp_stack_elide_zero_440 : i64
      %9312 = func.call @stack_pop_pointer() : () -> i64
      %9313 = func.call @cc_cons(%9312, %9311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9314 = func.call @stack_pop_pointer() : () -> i64
      %9315 = func.call @stack_pop_pointer() : () -> i64
      %9316 = func.call @cc_cons(%9315, %9314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %9317 = arith.addi %9316, %__rlasp_stack_elide_zero_441 : i64
      %9318 = func.call @stack_pop_pointer() : () -> i64
      %9319 = func.call @cc_cons(%9318, %9317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %9320 = arith.addi %9319, %__rlasp_stack_elide_zero_442 : i64
      %9321 = func.call @stack_pop_pointer() : () -> i64
      %9322 = func.call @cc_cons(%9321, %9320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9322) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9323 = func.call @stack_pop_pointer() : () -> i64
      %9324 = func.call @stack_pop_pointer() : () -> i64
      %9325 = func.call @cc_cons(%9324, %9323) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %9326 = arith.addi %9325, %__rlasp_stack_elide_zero_443 : i64
      %9327 = func.call @stack_pop_pointer() : () -> i64
      %9328 = func.call @cc_cons(%9327, %9326) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %9329 = arith.addi %9328, %__rlasp_stack_elide_zero_444 : i64
      %9440 = arith.constant 15079495958558 : i64
      %9441 = arith.constant 0 : i64
      %9442 = func.call @cc_make_closure(%9440, %9441) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %9443 = arith.addi %9442, %__rlasp_stack_elide_zero_445 : i64
      %9444 = llvm.mlir.addressof @str776 : !llvm.ptr
      %9445 = arith.constant 4 : i64
      %9446 = func.call @cc_make_string(%9444, %9445) : (!llvm.ptr, i64) -> i64
      %9447 = func.call @cc_nil_value() : () -> i64
      %9448 = func.call @cc_intern(%9446, %9447) : (i64, i64) -> i64
      %9449 = func.call @cc_nil_value() : () -> i64
      %9450 = func.call @cc_cons(%9448, %9449) : (i64, i64) -> i64
      %9451 = func.call @cc_values_pack(%9450) : (i64) -> i64
      func.call @stack_push_pointer(%9448) : (i64) -> ()
      %9452 = llvm.mlir.addressof @str777 : !llvm.ptr
      %9453 = arith.constant 10 : i64
      %9454 = func.call @cc_make_string(%9452, %9453) : (!llvm.ptr, i64) -> i64
      %9455 = llvm.mlir.addressof @str778 : !llvm.ptr
      %9456 = arith.constant 11 : i64
      %9457 = func.call @cc_make_string(%9455, %9456) : (!llvm.ptr, i64) -> i64
      %9458 = func.call @cc_intern(%9454, %9457) : (i64, i64) -> i64
      %9459 = func.call @cc_nil_value() : () -> i64
      %9460 = func.call @cc_cons(%9458, %9459) : (i64, i64) -> i64
      %9461 = func.call @cc_values_pack(%9460) : (i64) -> i64
      func.call @stack_push_pointer(%9458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9462 = func.call @stack_pop_pointer() : () -> i64
      %9463 = func.call @stack_pop_pointer() : () -> i64
      %9464 = func.call @cc_cons(%9463, %9462) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %9465 = arith.addi %9464, %__rlasp_stack_elide_zero_446 : i64
      %9466 = func.call @stack_pop_pointer() : () -> i64
      %9467 = func.call @cc_cons(%9466, %9465) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %9468 = arith.addi %9467, %__rlasp_stack_elide_zero_447 : i64
      %9469 = llvm.mlir.addressof @str779 : !llvm.ptr
      %9470 = arith.constant 11 : i64
      %9471 = func.call @cc_make_string(%9469, %9470) : (!llvm.ptr, i64) -> i64
      %9472 = llvm.mlir.addressof @str780 : !llvm.ptr
      %9473 = arith.constant 7 : i64
      %9474 = func.call @cc_make_string(%9472, %9473) : (!llvm.ptr, i64) -> i64
      %9475 = func.call @cc_intern(%9471, %9474) : (i64, i64) -> i64
      %9476 = func.call @cc_nil_value() : () -> i64
      %9477 = func.call @cc_cons(%9475, %9476) : (i64, i64) -> i64
      %9478 = func.call @cc_values_pack(%9477) : (i64) -> i64
      %9479 = func.call @cc_nil_value() : () -> i64
      %9480 = llvm.mlir.addressof @str781 : !llvm.ptr
      %9481 = arith.constant 4 : i64
      %9482 = func.call @cc_make_string(%9480, %9481) : (!llvm.ptr, i64) -> i64
      %9483 = llvm.mlir.addressof @str782 : !llvm.ptr
      %9484 = arith.constant 7 : i64
      %9485 = func.call @cc_make_string(%9483, %9484) : (!llvm.ptr, i64) -> i64
      %9486 = func.call @cc_intern(%9482, %9485) : (i64, i64) -> i64
      %9487 = func.call @cc_nil_value() : () -> i64
      %9488 = func.call @cc_cons(%9486, %9487) : (i64, i64) -> i64
      %9489 = func.call @cc_values_pack(%9488) : (i64) -> i64
      %9490 = llvm.mlir.addressof @str783 : !llvm.ptr
      %9491 = arith.constant 5 : i64
      %9492 = func.call @cc_make_string(%9490, %9491) : (!llvm.ptr, i64) -> i64
      %9493 = func.call @cc_nil_value() : () -> i64
      %9494 = func.call @cc_intern(%9492, %9493) : (i64, i64) -> i64
      %9495 = func.call @cc_nil_value() : () -> i64
      %9496 = func.call @cc_cons(%9494, %9495) : (i64, i64) -> i64
      %9497 = func.call @cc_values_pack(%9496) : (i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %9498 = arith.addi %9494, %__rlasp_stack_elide_zero_448 : i64
      %9499 = func.call @cc_nil_value() : () -> i64
      %9500 = func.call @cc_errorp(%9162) : (i64) -> i64
      %9501 = arith.cmpi ne, %9500, %9499 : i64
      %9502 = arith.cmpi eq, %9499, %9499 : i64
      %9503 = arith.andi %9501, %9502 : i1
      %9504 = scf.if %9503 -> (i64) {
        scf.yield %9162 : i64
      } else {
        scf.yield %9499 : i64
      }
      %9505 = func.call @cc_errorp(%9329) : (i64) -> i64
      %9506 = arith.cmpi ne, %9505, %9499 : i64
      %9507 = arith.cmpi eq, %9504, %9499 : i64
      %9508 = arith.andi %9506, %9507 : i1
      %9509 = scf.if %9508 -> (i64) {
        scf.yield %9329 : i64
      } else {
        scf.yield %9504 : i64
      }
      %9510 = func.call @cc_errorp(%9443) : (i64) -> i64
      %9511 = arith.cmpi ne, %9510, %9499 : i64
      %9512 = arith.cmpi eq, %9509, %9499 : i64
      %9513 = arith.andi %9511, %9512 : i1
      %9514 = scf.if %9513 -> (i64) {
        scf.yield %9443 : i64
      } else {
        scf.yield %9509 : i64
      }
      %9515 = func.call @cc_errorp(%9468) : (i64) -> i64
      %9516 = arith.cmpi ne, %9515, %9499 : i64
      %9517 = arith.cmpi eq, %9514, %9499 : i64
      %9518 = arith.andi %9516, %9517 : i1
      %9519 = scf.if %9518 -> (i64) {
        scf.yield %9468 : i64
      } else {
        scf.yield %9514 : i64
      }
      %9520 = func.call @cc_errorp(%9475) : (i64) -> i64
      %9521 = arith.cmpi ne, %9520, %9499 : i64
      %9522 = arith.cmpi eq, %9519, %9499 : i64
      %9523 = arith.andi %9521, %9522 : i1
      %9524 = scf.if %9523 -> (i64) {
        scf.yield %9475 : i64
      } else {
        scf.yield %9519 : i64
      }
      %9525 = func.call @cc_errorp(%9479) : (i64) -> i64
      %9526 = arith.cmpi ne, %9525, %9499 : i64
      %9527 = arith.cmpi eq, %9524, %9499 : i64
      %9528 = arith.andi %9526, %9527 : i1
      %9529 = scf.if %9528 -> (i64) {
        scf.yield %9479 : i64
      } else {
        scf.yield %9524 : i64
      }
      %9530 = func.call @cc_errorp(%9486) : (i64) -> i64
      %9531 = arith.cmpi ne, %9530, %9499 : i64
      %9532 = arith.cmpi eq, %9529, %9499 : i64
      %9533 = arith.andi %9531, %9532 : i1
      %9534 = scf.if %9533 -> (i64) {
        scf.yield %9486 : i64
      } else {
        scf.yield %9529 : i64
      }
      %9535 = func.call @cc_errorp(%9498) : (i64) -> i64
      %9536 = arith.cmpi ne, %9535, %9499 : i64
      %9537 = arith.cmpi eq, %9534, %9499 : i64
      %9538 = arith.andi %9536, %9537 : i1
      %9539 = scf.if %9538 -> (i64) {
        scf.yield %9498 : i64
      } else {
        scf.yield %9534 : i64
      }
      %9540 = arith.cmpi ne, %9539, %9499 : i64
      scf.if %9540 {
        func.call @stack_push_pointer(%9539) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9162) : (i64) -> ()
        func.call @stack_push_pointer(%9329) : (i64) -> ()
        func.call @stack_push_pointer(%9443) : (i64) -> ()
        func.call @stack_push_pointer(%9468) : (i64) -> ()
        func.call @stack_push_pointer(%9475) : (i64) -> ()
        func.call @stack_push_pointer(%9479) : (i64) -> ()
        func.call @stack_push_pointer(%9486) : (i64) -> ()
        func.call @stack_push_pointer(%9498) : (i64) -> ()
        %9541 = llvm.mlir.addressof @str784 : !llvm.ptr
        %9542 = func.call @cc_make_function_ref_const(%9541) : (!llvm.ptr) -> i64
        %9543 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9542, %9543) : (i64, i64) -> ()
      }
      %9544 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9544 : i64
    }
    %9545 = func.call @cc_nil_value() : () -> i64
    %9546 = func.call @cc_errorp(%9153) : (i64) -> i64
    %9547 = arith.cmpi ne, %9546, %9545 : i64
    %9548 = scf.if %9547 -> (i64) {
      scf.yield %9153 : i64
    } else {
      %9549 = llvm.mlir.addressof @str785 : !llvm.ptr
      %9550 = arith.constant 39 : i64
      %9551 = func.call @cc_make_string(%9549, %9550) : (!llvm.ptr, i64) -> i64
      %9552 = func.call @cc_nil_value() : () -> i64
      %9553 = func.call @cc_intern(%9551, %9552) : (i64, i64) -> i64
      %9554 = func.call @cc_nil_value() : () -> i64
      %9555 = func.call @cc_cons(%9553, %9554) : (i64, i64) -> i64
      %9556 = func.call @cc_values_pack(%9555) : (i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %9557 = arith.addi %9553, %__rlasp_stack_elide_zero_449 : i64
      %9558 = llvm.mlir.addressof @str786 : !llvm.ptr
      %9559 = arith.constant 13 : i64
      %9560 = func.call @cc_make_string(%9558, %9559) : (!llvm.ptr, i64) -> i64
      %9561 = llvm.mlir.addressof @str787 : !llvm.ptr
      %9562 = arith.constant 11 : i64
      %9563 = func.call @cc_make_string(%9561, %9562) : (!llvm.ptr, i64) -> i64
      %9564 = func.call @cc_intern(%9560, %9563) : (i64, i64) -> i64
      %9565 = func.call @cc_nil_value() : () -> i64
      %9566 = func.call @cc_cons(%9564, %9565) : (i64, i64) -> i64
      %9567 = func.call @cc_values_pack(%9566) : (i64) -> i64
      func.call @stack_push_pointer(%9564) : (i64) -> ()
      %9568 = llvm.mlir.addressof @str788 : !llvm.ptr
      %9569 = arith.constant 6 : i64
      %9570 = func.call @cc_make_string(%9568, %9569) : (!llvm.ptr, i64) -> i64
      %9571 = func.call @cc_nil_value() : () -> i64
      %9572 = func.call @cc_intern(%9570, %9571) : (i64, i64) -> i64
      %9573 = func.call @cc_nil_value() : () -> i64
      %9574 = func.call @cc_cons(%9572, %9573) : (i64, i64) -> i64
      %9575 = func.call @cc_values_pack(%9574) : (i64) -> i64
      func.call @stack_push_pointer(%9572) : (i64) -> ()
      %9576 = llvm.mlir.addressof @str789 : !llvm.ptr
      %9577 = arith.constant 19 : i64
      %9578 = func.call @cc_make_string(%9576, %9577) : (!llvm.ptr, i64) -> i64
      %9579 = func.call @cc_nil_value() : () -> i64
      %9580 = func.call @cc_intern(%9578, %9579) : (i64, i64) -> i64
      %9581 = func.call @cc_nil_value() : () -> i64
      %9582 = func.call @cc_cons(%9580, %9581) : (i64, i64) -> i64
      %9583 = func.call @cc_values_pack(%9582) : (i64) -> i64
      func.call @stack_push_pointer(%9580) : (i64) -> ()
      %9584 = llvm.mlir.addressof @str790 : !llvm.ptr
      %9585 = arith.constant 7 : i64
      %9586 = func.call @cc_make_string(%9584, %9585) : (!llvm.ptr, i64) -> i64
      %9587 = llvm.mlir.addressof @str791 : !llvm.ptr
      %9588 = arith.constant 11 : i64
      %9589 = func.call @cc_make_string(%9587, %9588) : (!llvm.ptr, i64) -> i64
      %9590 = func.call @cc_intern(%9586, %9589) : (i64, i64) -> i64
      %9591 = func.call @cc_nil_value() : () -> i64
      %9592 = func.call @cc_cons(%9590, %9591) : (i64, i64) -> i64
      %9593 = func.call @cc_values_pack(%9592) : (i64) -> i64
      func.call @stack_push_pointer(%9590) : (i64) -> ()
      %9594 = llvm.mlir.addressof @str792 : !llvm.ptr
      %9595 = arith.constant 7 : i64
      %9596 = func.call @cc_make_string(%9594, %9595) : (!llvm.ptr, i64) -> i64
      %9597 = llvm.mlir.addressof @str793 : !llvm.ptr
      %9598 = arith.constant 11 : i64
      %9599 = func.call @cc_make_string(%9597, %9598) : (!llvm.ptr, i64) -> i64
      %9600 = func.call @cc_intern(%9596, %9599) : (i64, i64) -> i64
      %9601 = func.call @cc_nil_value() : () -> i64
      %9602 = func.call @cc_cons(%9600, %9601) : (i64, i64) -> i64
      %9603 = func.call @cc_values_pack(%9602) : (i64) -> i64
      func.call @stack_push_pointer(%9600) : (i64) -> ()
      %9604 = llvm.mlir.addressof @str794 : !llvm.ptr
      %9605 = arith.constant 9 : i64
      %9606 = func.call @cc_make_string(%9604, %9605) : (!llvm.ptr, i64) -> i64
      %9607 = llvm.mlir.addressof @str795 : !llvm.ptr
      %9608 = arith.constant 11 : i64
      %9609 = func.call @cc_make_string(%9607, %9608) : (!llvm.ptr, i64) -> i64
      %9610 = func.call @cc_intern(%9606, %9609) : (i64, i64) -> i64
      %9611 = func.call @cc_nil_value() : () -> i64
      %9612 = func.call @cc_cons(%9610, %9611) : (i64, i64) -> i64
      %9613 = func.call @cc_values_pack(%9612) : (i64) -> i64
      func.call @stack_push_pointer(%9610) : (i64) -> ()
      %9614 = llvm.mlir.addressof @str796 : !llvm.ptr
      %9615 = arith.constant 10 : i64
      %9616 = func.call @cc_make_string(%9614, %9615) : (!llvm.ptr, i64) -> i64
      %9617 = llvm.mlir.addressof @str797 : !llvm.ptr
      %9618 = arith.constant 11 : i64
      %9619 = func.call @cc_make_string(%9617, %9618) : (!llvm.ptr, i64) -> i64
      %9620 = func.call @cc_intern(%9616, %9619) : (i64, i64) -> i64
      %9621 = func.call @cc_nil_value() : () -> i64
      %9622 = func.call @cc_cons(%9620, %9621) : (i64, i64) -> i64
      %9623 = func.call @cc_values_pack(%9622) : (i64) -> i64
      func.call @stack_push_pointer(%9620) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9624 = func.call @stack_pop_pointer() : () -> i64
      %9625 = func.call @stack_pop_pointer() : () -> i64
      %9626 = func.call @cc_cons(%9625, %9624) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %9627 = arith.addi %9626, %__rlasp_stack_elide_zero_450 : i64
      %9628 = func.call @stack_pop_pointer() : () -> i64
      %9629 = func.call @cc_cons(%9628, %9627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9630 = func.call @stack_pop_pointer() : () -> i64
      %9631 = func.call @stack_pop_pointer() : () -> i64
      %9632 = func.call @cc_cons(%9631, %9630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %9633 = arith.addi %9632, %__rlasp_stack_elide_zero_451 : i64
      %9634 = func.call @stack_pop_pointer() : () -> i64
      %9635 = func.call @cc_cons(%9634, %9633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9635) : (i64) -> ()
      %9636 = llvm.mlir.addressof @str798 : !llvm.ptr
      %9637 = arith.constant 10 : i64
      %9638 = func.call @cc_make_string(%9636, %9637) : (!llvm.ptr, i64) -> i64
      %9639 = llvm.mlir.addressof @str799 : !llvm.ptr
      %9640 = arith.constant 11 : i64
      %9641 = func.call @cc_make_string(%9639, %9640) : (!llvm.ptr, i64) -> i64
      %9642 = func.call @cc_intern(%9638, %9641) : (i64, i64) -> i64
      %9643 = func.call @cc_nil_value() : () -> i64
      %9644 = func.call @cc_cons(%9642, %9643) : (i64, i64) -> i64
      %9645 = func.call @cc_values_pack(%9644) : (i64) -> i64
      func.call @stack_push_pointer(%9642) : (i64) -> ()
      %9646 = llvm.mlir.addressof @str800 : !llvm.ptr
      %9647 = arith.constant 4 : i64
      %9648 = func.call @cc_make_string(%9646, %9647) : (!llvm.ptr, i64) -> i64
      %9649 = llvm.mlir.addressof @str801 : !llvm.ptr
      %9650 = arith.constant 11 : i64
      %9651 = func.call @cc_make_string(%9649, %9650) : (!llvm.ptr, i64) -> i64
      %9652 = func.call @cc_intern(%9648, %9651) : (i64, i64) -> i64
      %9653 = func.call @cc_nil_value() : () -> i64
      %9654 = func.call @cc_cons(%9652, %9653) : (i64, i64) -> i64
      %9655 = func.call @cc_values_pack(%9654) : (i64) -> i64
      func.call @stack_push_pointer(%9652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9656 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%9656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9657 = func.call @stack_pop_pointer() : () -> i64
      %9658 = func.call @stack_pop_pointer() : () -> i64
      %9659 = func.call @cc_cons(%9658, %9657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %9660 = arith.addi %9659, %__rlasp_stack_elide_zero_452 : i64
      %9661 = func.call @stack_pop_pointer() : () -> i64
      %9662 = func.call @cc_cons(%9661, %9660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %9663 = arith.addi %9662, %__rlasp_stack_elide_zero_453 : i64
      %9664 = func.call @stack_pop_pointer() : () -> i64
      %9665 = func.call @cc_cons(%9664, %9663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9666 = func.call @stack_pop_pointer() : () -> i64
      %9667 = func.call @stack_pop_pointer() : () -> i64
      %9668 = func.call @cc_cons(%9667, %9666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %9669 = arith.addi %9668, %__rlasp_stack_elide_zero_454 : i64
      %9670 = func.call @stack_pop_pointer() : () -> i64
      %9671 = func.call @cc_cons(%9670, %9669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9671) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9672 = func.call @stack_pop_pointer() : () -> i64
      %9673 = func.call @stack_pop_pointer() : () -> i64
      %9674 = func.call @cc_cons(%9673, %9672) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %9675 = arith.addi %9674, %__rlasp_stack_elide_zero_455 : i64
      %9676 = func.call @stack_pop_pointer() : () -> i64
      %9677 = func.call @cc_cons(%9676, %9675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %9678 = arith.addi %9677, %__rlasp_stack_elide_zero_456 : i64
      %9679 = func.call @stack_pop_pointer() : () -> i64
      %9680 = func.call @cc_cons(%9679, %9678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9680) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9681 = func.call @stack_pop_pointer() : () -> i64
      %9682 = func.call @stack_pop_pointer() : () -> i64
      %9683 = func.call @cc_cons(%9682, %9681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %9684 = arith.addi %9683, %__rlasp_stack_elide_zero_457 : i64
      %9685 = func.call @stack_pop_pointer() : () -> i64
      %9686 = func.call @cc_cons(%9685, %9684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9687 = func.call @stack_pop_pointer() : () -> i64
      %9688 = func.call @stack_pop_pointer() : () -> i64
      %9689 = func.call @cc_cons(%9688, %9687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %9690 = arith.addi %9689, %__rlasp_stack_elide_zero_458 : i64
      %9691 = func.call @stack_pop_pointer() : () -> i64
      %9692 = func.call @cc_cons(%9691, %9690) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
      %9693 = arith.addi %9692, %__rlasp_stack_elide_zero_459 : i64
      %9694 = func.call @stack_pop_pointer() : () -> i64
      %9695 = func.call @cc_cons(%9694, %9693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9696 = func.call @stack_pop_pointer() : () -> i64
      %9697 = func.call @stack_pop_pointer() : () -> i64
      %9698 = func.call @cc_cons(%9697, %9696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %9699 = arith.addi %9698, %__rlasp_stack_elide_zero_460 : i64
      %9700 = func.call @stack_pop_pointer() : () -> i64
      %9701 = func.call @cc_cons(%9700, %9699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %9702 = arith.addi %9701, %__rlasp_stack_elide_zero_461 : i64
      %9785 = arith.constant 15079495958559 : i64
      %9786 = arith.constant 0 : i64
      %9787 = func.call @cc_make_closure(%9785, %9786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
      %9788 = arith.addi %9787, %__rlasp_stack_elide_zero_462 : i64
      %9789 = llvm.mlir.addressof @str803 : !llvm.ptr
      %9790 = arith.constant 4 : i64
      %9791 = func.call @cc_make_string(%9789, %9790) : (!llvm.ptr, i64) -> i64
      %9792 = func.call @cc_nil_value() : () -> i64
      %9793 = func.call @cc_intern(%9791, %9792) : (i64, i64) -> i64
      %9794 = func.call @cc_nil_value() : () -> i64
      %9795 = func.call @cc_cons(%9793, %9794) : (i64, i64) -> i64
      %9796 = func.call @cc_values_pack(%9795) : (i64) -> i64
      func.call @stack_push_pointer(%9793) : (i64) -> ()
      %9797 = llvm.mlir.addressof @str804 : !llvm.ptr
      %9798 = arith.constant 10 : i64
      %9799 = func.call @cc_make_string(%9797, %9798) : (!llvm.ptr, i64) -> i64
      %9800 = llvm.mlir.addressof @str805 : !llvm.ptr
      %9801 = arith.constant 11 : i64
      %9802 = func.call @cc_make_string(%9800, %9801) : (!llvm.ptr, i64) -> i64
      %9803 = func.call @cc_intern(%9799, %9802) : (i64, i64) -> i64
      %9804 = func.call @cc_nil_value() : () -> i64
      %9805 = func.call @cc_cons(%9803, %9804) : (i64, i64) -> i64
      %9806 = func.call @cc_values_pack(%9805) : (i64) -> i64
      func.call @stack_push_pointer(%9803) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9807 = func.call @stack_pop_pointer() : () -> i64
      %9808 = func.call @stack_pop_pointer() : () -> i64
      %9809 = func.call @cc_cons(%9808, %9807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
      %9810 = arith.addi %9809, %__rlasp_stack_elide_zero_463 : i64
      %9811 = func.call @stack_pop_pointer() : () -> i64
      %9812 = func.call @cc_cons(%9811, %9810) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %9813 = arith.addi %9812, %__rlasp_stack_elide_zero_464 : i64
      %9814 = llvm.mlir.addressof @str806 : !llvm.ptr
      %9815 = arith.constant 11 : i64
      %9816 = func.call @cc_make_string(%9814, %9815) : (!llvm.ptr, i64) -> i64
      %9817 = llvm.mlir.addressof @str807 : !llvm.ptr
      %9818 = arith.constant 7 : i64
      %9819 = func.call @cc_make_string(%9817, %9818) : (!llvm.ptr, i64) -> i64
      %9820 = func.call @cc_intern(%9816, %9819) : (i64, i64) -> i64
      %9821 = func.call @cc_nil_value() : () -> i64
      %9822 = func.call @cc_cons(%9820, %9821) : (i64, i64) -> i64
      %9823 = func.call @cc_values_pack(%9822) : (i64) -> i64
      %9824 = func.call @cc_nil_value() : () -> i64
      %9825 = llvm.mlir.addressof @str808 : !llvm.ptr
      %9826 = arith.constant 4 : i64
      %9827 = func.call @cc_make_string(%9825, %9826) : (!llvm.ptr, i64) -> i64
      %9828 = llvm.mlir.addressof @str809 : !llvm.ptr
      %9829 = arith.constant 7 : i64
      %9830 = func.call @cc_make_string(%9828, %9829) : (!llvm.ptr, i64) -> i64
      %9831 = func.call @cc_intern(%9827, %9830) : (i64, i64) -> i64
      %9832 = func.call @cc_nil_value() : () -> i64
      %9833 = func.call @cc_cons(%9831, %9832) : (i64, i64) -> i64
      %9834 = func.call @cc_values_pack(%9833) : (i64) -> i64
      %9835 = llvm.mlir.addressof @str810 : !llvm.ptr
      %9836 = arith.constant 5 : i64
      %9837 = func.call @cc_make_string(%9835, %9836) : (!llvm.ptr, i64) -> i64
      %9838 = func.call @cc_nil_value() : () -> i64
      %9839 = func.call @cc_intern(%9837, %9838) : (i64, i64) -> i64
      %9840 = func.call @cc_nil_value() : () -> i64
      %9841 = func.call @cc_cons(%9839, %9840) : (i64, i64) -> i64
      %9842 = func.call @cc_values_pack(%9841) : (i64) -> i64
      %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
      %9843 = arith.addi %9839, %__rlasp_stack_elide_zero_465 : i64
      %9844 = func.call @cc_nil_value() : () -> i64
      %9845 = func.call @cc_errorp(%9557) : (i64) -> i64
      %9846 = arith.cmpi ne, %9845, %9844 : i64
      %9847 = arith.cmpi eq, %9844, %9844 : i64
      %9848 = arith.andi %9846, %9847 : i1
      %9849 = scf.if %9848 -> (i64) {
        scf.yield %9557 : i64
      } else {
        scf.yield %9844 : i64
      }
      %9850 = func.call @cc_errorp(%9702) : (i64) -> i64
      %9851 = arith.cmpi ne, %9850, %9844 : i64
      %9852 = arith.cmpi eq, %9849, %9844 : i64
      %9853 = arith.andi %9851, %9852 : i1
      %9854 = scf.if %9853 -> (i64) {
        scf.yield %9702 : i64
      } else {
        scf.yield %9849 : i64
      }
      %9855 = func.call @cc_errorp(%9788) : (i64) -> i64
      %9856 = arith.cmpi ne, %9855, %9844 : i64
      %9857 = arith.cmpi eq, %9854, %9844 : i64
      %9858 = arith.andi %9856, %9857 : i1
      %9859 = scf.if %9858 -> (i64) {
        scf.yield %9788 : i64
      } else {
        scf.yield %9854 : i64
      }
      %9860 = func.call @cc_errorp(%9813) : (i64) -> i64
      %9861 = arith.cmpi ne, %9860, %9844 : i64
      %9862 = arith.cmpi eq, %9859, %9844 : i64
      %9863 = arith.andi %9861, %9862 : i1
      %9864 = scf.if %9863 -> (i64) {
        scf.yield %9813 : i64
      } else {
        scf.yield %9859 : i64
      }
      %9865 = func.call @cc_errorp(%9820) : (i64) -> i64
      %9866 = arith.cmpi ne, %9865, %9844 : i64
      %9867 = arith.cmpi eq, %9864, %9844 : i64
      %9868 = arith.andi %9866, %9867 : i1
      %9869 = scf.if %9868 -> (i64) {
        scf.yield %9820 : i64
      } else {
        scf.yield %9864 : i64
      }
      %9870 = func.call @cc_errorp(%9824) : (i64) -> i64
      %9871 = arith.cmpi ne, %9870, %9844 : i64
      %9872 = arith.cmpi eq, %9869, %9844 : i64
      %9873 = arith.andi %9871, %9872 : i1
      %9874 = scf.if %9873 -> (i64) {
        scf.yield %9824 : i64
      } else {
        scf.yield %9869 : i64
      }
      %9875 = func.call @cc_errorp(%9831) : (i64) -> i64
      %9876 = arith.cmpi ne, %9875, %9844 : i64
      %9877 = arith.cmpi eq, %9874, %9844 : i64
      %9878 = arith.andi %9876, %9877 : i1
      %9879 = scf.if %9878 -> (i64) {
        scf.yield %9831 : i64
      } else {
        scf.yield %9874 : i64
      }
      %9880 = func.call @cc_errorp(%9843) : (i64) -> i64
      %9881 = arith.cmpi ne, %9880, %9844 : i64
      %9882 = arith.cmpi eq, %9879, %9844 : i64
      %9883 = arith.andi %9881, %9882 : i1
      %9884 = scf.if %9883 -> (i64) {
        scf.yield %9843 : i64
      } else {
        scf.yield %9879 : i64
      }
      %9885 = arith.cmpi ne, %9884, %9844 : i64
      scf.if %9885 {
        func.call @stack_push_pointer(%9884) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9557) : (i64) -> ()
        func.call @stack_push_pointer(%9702) : (i64) -> ()
        func.call @stack_push_pointer(%9788) : (i64) -> ()
        func.call @stack_push_pointer(%9813) : (i64) -> ()
        func.call @stack_push_pointer(%9820) : (i64) -> ()
        func.call @stack_push_pointer(%9824) : (i64) -> ()
        func.call @stack_push_pointer(%9831) : (i64) -> ()
        func.call @stack_push_pointer(%9843) : (i64) -> ()
        %9886 = llvm.mlir.addressof @str811 : !llvm.ptr
        %9887 = func.call @cc_make_function_ref_const(%9886) : (!llvm.ptr) -> i64
        %9888 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9887, %9888) : (i64, i64) -> ()
      }
      %9889 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9889 : i64
    }
    %9890 = func.call @cc_nil_value() : () -> i64
    %9891 = func.call @cc_errorp(%9548) : (i64) -> i64
    %9892 = arith.cmpi ne, %9891, %9890 : i64
    %9893 = scf.if %9892 -> (i64) {
      scf.yield %9548 : i64
    } else {
      %9894 = llvm.mlir.addressof @str812 : !llvm.ptr
      %9895 = arith.constant 39 : i64
      %9896 = func.call @cc_make_string(%9894, %9895) : (!llvm.ptr, i64) -> i64
      %9897 = func.call @cc_nil_value() : () -> i64
      %9898 = func.call @cc_intern(%9896, %9897) : (i64, i64) -> i64
      %9899 = func.call @cc_nil_value() : () -> i64
      %9900 = func.call @cc_cons(%9898, %9899) : (i64, i64) -> i64
      %9901 = func.call @cc_values_pack(%9900) : (i64) -> i64
      %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
      %9902 = arith.addi %9898, %__rlasp_stack_elide_zero_466 : i64
      %9903 = llvm.mlir.addressof @str813 : !llvm.ptr
      %9904 = arith.constant 13 : i64
      %9905 = func.call @cc_make_string(%9903, %9904) : (!llvm.ptr, i64) -> i64
      %9906 = llvm.mlir.addressof @str814 : !llvm.ptr
      %9907 = arith.constant 11 : i64
      %9908 = func.call @cc_make_string(%9906, %9907) : (!llvm.ptr, i64) -> i64
      %9909 = func.call @cc_intern(%9905, %9908) : (i64, i64) -> i64
      %9910 = func.call @cc_nil_value() : () -> i64
      %9911 = func.call @cc_cons(%9909, %9910) : (i64, i64) -> i64
      %9912 = func.call @cc_values_pack(%9911) : (i64) -> i64
      func.call @stack_push_pointer(%9909) : (i64) -> ()
      %9913 = llvm.mlir.addressof @str815 : !llvm.ptr
      %9914 = arith.constant 6 : i64
      %9915 = func.call @cc_make_string(%9913, %9914) : (!llvm.ptr, i64) -> i64
      %9916 = func.call @cc_nil_value() : () -> i64
      %9917 = func.call @cc_intern(%9915, %9916) : (i64, i64) -> i64
      %9918 = func.call @cc_nil_value() : () -> i64
      %9919 = func.call @cc_cons(%9917, %9918) : (i64, i64) -> i64
      %9920 = func.call @cc_values_pack(%9919) : (i64) -> i64
      func.call @stack_push_pointer(%9917) : (i64) -> ()
      %9921 = llvm.mlir.addressof @str816 : !llvm.ptr
      %9922 = arith.constant 19 : i64
      %9923 = func.call @cc_make_string(%9921, %9922) : (!llvm.ptr, i64) -> i64
      %9924 = func.call @cc_nil_value() : () -> i64
      %9925 = func.call @cc_intern(%9923, %9924) : (i64, i64) -> i64
      %9926 = func.call @cc_nil_value() : () -> i64
      %9927 = func.call @cc_cons(%9925, %9926) : (i64, i64) -> i64
      %9928 = func.call @cc_values_pack(%9927) : (i64) -> i64
      func.call @stack_push_pointer(%9925) : (i64) -> ()
      %9929 = llvm.mlir.addressof @str817 : !llvm.ptr
      %9930 = arith.constant 7 : i64
      %9931 = func.call @cc_make_string(%9929, %9930) : (!llvm.ptr, i64) -> i64
      %9932 = llvm.mlir.addressof @str818 : !llvm.ptr
      %9933 = arith.constant 11 : i64
      %9934 = func.call @cc_make_string(%9932, %9933) : (!llvm.ptr, i64) -> i64
      %9935 = func.call @cc_intern(%9931, %9934) : (i64, i64) -> i64
      %9936 = func.call @cc_nil_value() : () -> i64
      %9937 = func.call @cc_cons(%9935, %9936) : (i64, i64) -> i64
      %9938 = func.call @cc_values_pack(%9937) : (i64) -> i64
      func.call @stack_push_pointer(%9935) : (i64) -> ()
      %9939 = llvm.mlir.addressof @str819 : !llvm.ptr
      %9940 = arith.constant 7 : i64
      %9941 = func.call @cc_make_string(%9939, %9940) : (!llvm.ptr, i64) -> i64
      %9942 = llvm.mlir.addressof @str820 : !llvm.ptr
      %9943 = arith.constant 11 : i64
      %9944 = func.call @cc_make_string(%9942, %9943) : (!llvm.ptr, i64) -> i64
      %9945 = func.call @cc_intern(%9941, %9944) : (i64, i64) -> i64
      %9946 = func.call @cc_nil_value() : () -> i64
      %9947 = func.call @cc_cons(%9945, %9946) : (i64, i64) -> i64
      %9948 = func.call @cc_values_pack(%9947) : (i64) -> i64
      func.call @stack_push_pointer(%9945) : (i64) -> ()
      %9949 = llvm.mlir.addressof @str821 : !llvm.ptr
      %9950 = arith.constant 9 : i64
      %9951 = func.call @cc_make_string(%9949, %9950) : (!llvm.ptr, i64) -> i64
      %9952 = llvm.mlir.addressof @str822 : !llvm.ptr
      %9953 = arith.constant 11 : i64
      %9954 = func.call @cc_make_string(%9952, %9953) : (!llvm.ptr, i64) -> i64
      %9955 = func.call @cc_intern(%9951, %9954) : (i64, i64) -> i64
      %9956 = func.call @cc_nil_value() : () -> i64
      %9957 = func.call @cc_cons(%9955, %9956) : (i64, i64) -> i64
      %9958 = func.call @cc_values_pack(%9957) : (i64) -> i64
      func.call @stack_push_pointer(%9955) : (i64) -> ()
      %9959 = llvm.mlir.addressof @str823 : !llvm.ptr
      %9960 = arith.constant 10 : i64
      %9961 = func.call @cc_make_string(%9959, %9960) : (!llvm.ptr, i64) -> i64
      %9962 = llvm.mlir.addressof @str824 : !llvm.ptr
      %9963 = arith.constant 11 : i64
      %9964 = func.call @cc_make_string(%9962, %9963) : (!llvm.ptr, i64) -> i64
      %9965 = func.call @cc_intern(%9961, %9964) : (i64, i64) -> i64
      %9966 = func.call @cc_nil_value() : () -> i64
      %9967 = func.call @cc_cons(%9965, %9966) : (i64, i64) -> i64
      %9968 = func.call @cc_values_pack(%9967) : (i64) -> i64
      func.call @stack_push_pointer(%9965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9969 = func.call @stack_pop_pointer() : () -> i64
      %9970 = func.call @stack_pop_pointer() : () -> i64
      %9971 = func.call @cc_cons(%9970, %9969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %9972 = arith.addi %9971, %__rlasp_stack_elide_zero_467 : i64
      %9973 = func.call @stack_pop_pointer() : () -> i64
      %9974 = func.call @cc_cons(%9973, %9972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9975 = func.call @stack_pop_pointer() : () -> i64
      %9976 = func.call @stack_pop_pointer() : () -> i64
      %9977 = func.call @cc_cons(%9976, %9975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
      %9978 = arith.addi %9977, %__rlasp_stack_elide_zero_468 : i64
      %9979 = func.call @stack_pop_pointer() : () -> i64
      %9980 = func.call @cc_cons(%9979, %9978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9980) : (i64) -> ()
      %9981 = llvm.mlir.addressof @str825 : !llvm.ptr
      %9982 = arith.constant 10 : i64
      %9983 = func.call @cc_make_string(%9981, %9982) : (!llvm.ptr, i64) -> i64
      %9984 = llvm.mlir.addressof @str826 : !llvm.ptr
      %9985 = arith.constant 11 : i64
      %9986 = func.call @cc_make_string(%9984, %9985) : (!llvm.ptr, i64) -> i64
      %9987 = func.call @cc_intern(%9983, %9986) : (i64, i64) -> i64
      %9988 = func.call @cc_nil_value() : () -> i64
      %9989 = func.call @cc_cons(%9987, %9988) : (i64, i64) -> i64
      %9990 = func.call @cc_values_pack(%9989) : (i64) -> i64
      func.call @stack_push_pointer(%9987) : (i64) -> ()
      %9991 = llvm.mlir.addressof @str827 : !llvm.ptr
      %9992 = arith.constant 4 : i64
      %9993 = func.call @cc_make_string(%9991, %9992) : (!llvm.ptr, i64) -> i64
      %9994 = llvm.mlir.addressof @str828 : !llvm.ptr
      %9995 = arith.constant 11 : i64
      %9996 = func.call @cc_make_string(%9994, %9995) : (!llvm.ptr, i64) -> i64
      %9997 = func.call @cc_intern(%9993, %9996) : (i64, i64) -> i64
      %9998 = func.call @cc_nil_value() : () -> i64
      %9999 = func.call @cc_cons(%9997, %9998) : (i64, i64) -> i64
      %10000 = func.call @cc_values_pack(%9999) : (i64) -> i64
      func.call @stack_push_pointer(%9997) : (i64) -> ()
      %10001 = arith.constant 97 : i64
      %10002 = func.call @cc_box_character(%10001) : (i64) -> i64
      func.call @stack_push_pointer(%10002) : (i64) -> ()
      %10003 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%10003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10004 = func.call @stack_pop_pointer() : () -> i64
      %10005 = func.call @stack_pop_pointer() : () -> i64
      %10006 = func.call @cc_cons(%10005, %10004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
      %10007 = arith.addi %10006, %__rlasp_stack_elide_zero_469 : i64
      %10008 = func.call @stack_pop_pointer() : () -> i64
      %10009 = func.call @cc_cons(%10008, %10007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
      %10010 = arith.addi %10009, %__rlasp_stack_elide_zero_470 : i64
      %10011 = func.call @stack_pop_pointer() : () -> i64
      %10012 = func.call @cc_cons(%10011, %10010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10012) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10013 = func.call @stack_pop_pointer() : () -> i64
      %10014 = func.call @stack_pop_pointer() : () -> i64
      %10015 = func.call @cc_cons(%10014, %10013) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
      %10016 = arith.addi %10015, %__rlasp_stack_elide_zero_471 : i64
      %10017 = func.call @stack_pop_pointer() : () -> i64
      %10018 = func.call @cc_cons(%10017, %10016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10019 = func.call @stack_pop_pointer() : () -> i64
      %10020 = func.call @stack_pop_pointer() : () -> i64
      %10021 = func.call @cc_cons(%10020, %10019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
      %10022 = arith.addi %10021, %__rlasp_stack_elide_zero_472 : i64
      %10023 = func.call @stack_pop_pointer() : () -> i64
      %10024 = func.call @cc_cons(%10023, %10022) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %10025 = arith.addi %10024, %__rlasp_stack_elide_zero_473 : i64
      %10026 = func.call @stack_pop_pointer() : () -> i64
      %10027 = func.call @cc_cons(%10026, %10025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10028 = func.call @stack_pop_pointer() : () -> i64
      %10029 = func.call @stack_pop_pointer() : () -> i64
      %10030 = func.call @cc_cons(%10029, %10028) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
      %10031 = arith.addi %10030, %__rlasp_stack_elide_zero_474 : i64
      %10032 = func.call @stack_pop_pointer() : () -> i64
      %10033 = func.call @cc_cons(%10032, %10031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10034 = func.call @stack_pop_pointer() : () -> i64
      %10035 = func.call @stack_pop_pointer() : () -> i64
      %10036 = func.call @cc_cons(%10035, %10034) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
      %10037 = arith.addi %10036, %__rlasp_stack_elide_zero_475 : i64
      %10038 = func.call @stack_pop_pointer() : () -> i64
      %10039 = func.call @cc_cons(%10038, %10037) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
      %10040 = arith.addi %10039, %__rlasp_stack_elide_zero_476 : i64
      %10041 = func.call @stack_pop_pointer() : () -> i64
      %10042 = func.call @cc_cons(%10041, %10040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10042) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10043 = func.call @stack_pop_pointer() : () -> i64
      %10044 = func.call @stack_pop_pointer() : () -> i64
      %10045 = func.call @cc_cons(%10044, %10043) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
      %10046 = arith.addi %10045, %__rlasp_stack_elide_zero_477 : i64
      %10047 = func.call @stack_pop_pointer() : () -> i64
      %10048 = func.call @cc_cons(%10047, %10046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
      %10049 = arith.addi %10048, %__rlasp_stack_elide_zero_478 : i64
      %10134 = arith.constant 15079495958560 : i64
      %10135 = arith.constant 0 : i64
      %10136 = func.call @cc_make_closure(%10134, %10135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
      %10137 = arith.addi %10136, %__rlasp_stack_elide_zero_479 : i64
      %10138 = llvm.mlir.addressof @str830 : !llvm.ptr
      %10139 = arith.constant 4 : i64
      %10140 = func.call @cc_make_string(%10138, %10139) : (!llvm.ptr, i64) -> i64
      %10141 = func.call @cc_nil_value() : () -> i64
      %10142 = func.call @cc_intern(%10140, %10141) : (i64, i64) -> i64
      %10143 = func.call @cc_nil_value() : () -> i64
      %10144 = func.call @cc_cons(%10142, %10143) : (i64, i64) -> i64
      %10145 = func.call @cc_values_pack(%10144) : (i64) -> i64
      func.call @stack_push_pointer(%10142) : (i64) -> ()
      %10146 = llvm.mlir.addressof @str831 : !llvm.ptr
      %10147 = arith.constant 10 : i64
      %10148 = func.call @cc_make_string(%10146, %10147) : (!llvm.ptr, i64) -> i64
      %10149 = llvm.mlir.addressof @str832 : !llvm.ptr
      %10150 = arith.constant 11 : i64
      %10151 = func.call @cc_make_string(%10149, %10150) : (!llvm.ptr, i64) -> i64
      %10152 = func.call @cc_intern(%10148, %10151) : (i64, i64) -> i64
      %10153 = func.call @cc_nil_value() : () -> i64
      %10154 = func.call @cc_cons(%10152, %10153) : (i64, i64) -> i64
      %10155 = func.call @cc_values_pack(%10154) : (i64) -> i64
      func.call @stack_push_pointer(%10152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10156 = func.call @stack_pop_pointer() : () -> i64
      %10157 = func.call @stack_pop_pointer() : () -> i64
      %10158 = func.call @cc_cons(%10157, %10156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
      %10159 = arith.addi %10158, %__rlasp_stack_elide_zero_480 : i64
      %10160 = func.call @stack_pop_pointer() : () -> i64
      %10161 = func.call @cc_cons(%10160, %10159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
      %10162 = arith.addi %10161, %__rlasp_stack_elide_zero_481 : i64
      %10163 = llvm.mlir.addressof @str833 : !llvm.ptr
      %10164 = arith.constant 11 : i64
      %10165 = func.call @cc_make_string(%10163, %10164) : (!llvm.ptr, i64) -> i64
      %10166 = llvm.mlir.addressof @str834 : !llvm.ptr
      %10167 = arith.constant 7 : i64
      %10168 = func.call @cc_make_string(%10166, %10167) : (!llvm.ptr, i64) -> i64
      %10169 = func.call @cc_intern(%10165, %10168) : (i64, i64) -> i64
      %10170 = func.call @cc_nil_value() : () -> i64
      %10171 = func.call @cc_cons(%10169, %10170) : (i64, i64) -> i64
      %10172 = func.call @cc_values_pack(%10171) : (i64) -> i64
      %10173 = func.call @cc_nil_value() : () -> i64
      %10174 = llvm.mlir.addressof @str835 : !llvm.ptr
      %10175 = arith.constant 4 : i64
      %10176 = func.call @cc_make_string(%10174, %10175) : (!llvm.ptr, i64) -> i64
      %10177 = llvm.mlir.addressof @str836 : !llvm.ptr
      %10178 = arith.constant 7 : i64
      %10179 = func.call @cc_make_string(%10177, %10178) : (!llvm.ptr, i64) -> i64
      %10180 = func.call @cc_intern(%10176, %10179) : (i64, i64) -> i64
      %10181 = func.call @cc_nil_value() : () -> i64
      %10182 = func.call @cc_cons(%10180, %10181) : (i64, i64) -> i64
      %10183 = func.call @cc_values_pack(%10182) : (i64) -> i64
      %10184 = llvm.mlir.addressof @str837 : !llvm.ptr
      %10185 = arith.constant 5 : i64
      %10186 = func.call @cc_make_string(%10184, %10185) : (!llvm.ptr, i64) -> i64
      %10187 = func.call @cc_nil_value() : () -> i64
      %10188 = func.call @cc_intern(%10186, %10187) : (i64, i64) -> i64
      %10189 = func.call @cc_nil_value() : () -> i64
      %10190 = func.call @cc_cons(%10188, %10189) : (i64, i64) -> i64
      %10191 = func.call @cc_values_pack(%10190) : (i64) -> i64
      %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
      %10192 = arith.addi %10188, %__rlasp_stack_elide_zero_482 : i64
      %10193 = func.call @cc_nil_value() : () -> i64
      %10194 = func.call @cc_errorp(%9902) : (i64) -> i64
      %10195 = arith.cmpi ne, %10194, %10193 : i64
      %10196 = arith.cmpi eq, %10193, %10193 : i64
      %10197 = arith.andi %10195, %10196 : i1
      %10198 = scf.if %10197 -> (i64) {
        scf.yield %9902 : i64
      } else {
        scf.yield %10193 : i64
      }
      %10199 = func.call @cc_errorp(%10049) : (i64) -> i64
      %10200 = arith.cmpi ne, %10199, %10193 : i64
      %10201 = arith.cmpi eq, %10198, %10193 : i64
      %10202 = arith.andi %10200, %10201 : i1
      %10203 = scf.if %10202 -> (i64) {
        scf.yield %10049 : i64
      } else {
        scf.yield %10198 : i64
      }
      %10204 = func.call @cc_errorp(%10137) : (i64) -> i64
      %10205 = arith.cmpi ne, %10204, %10193 : i64
      %10206 = arith.cmpi eq, %10203, %10193 : i64
      %10207 = arith.andi %10205, %10206 : i1
      %10208 = scf.if %10207 -> (i64) {
        scf.yield %10137 : i64
      } else {
        scf.yield %10203 : i64
      }
      %10209 = func.call @cc_errorp(%10162) : (i64) -> i64
      %10210 = arith.cmpi ne, %10209, %10193 : i64
      %10211 = arith.cmpi eq, %10208, %10193 : i64
      %10212 = arith.andi %10210, %10211 : i1
      %10213 = scf.if %10212 -> (i64) {
        scf.yield %10162 : i64
      } else {
        scf.yield %10208 : i64
      }
      %10214 = func.call @cc_errorp(%10169) : (i64) -> i64
      %10215 = arith.cmpi ne, %10214, %10193 : i64
      %10216 = arith.cmpi eq, %10213, %10193 : i64
      %10217 = arith.andi %10215, %10216 : i1
      %10218 = scf.if %10217 -> (i64) {
        scf.yield %10169 : i64
      } else {
        scf.yield %10213 : i64
      }
      %10219 = func.call @cc_errorp(%10173) : (i64) -> i64
      %10220 = arith.cmpi ne, %10219, %10193 : i64
      %10221 = arith.cmpi eq, %10218, %10193 : i64
      %10222 = arith.andi %10220, %10221 : i1
      %10223 = scf.if %10222 -> (i64) {
        scf.yield %10173 : i64
      } else {
        scf.yield %10218 : i64
      }
      %10224 = func.call @cc_errorp(%10180) : (i64) -> i64
      %10225 = arith.cmpi ne, %10224, %10193 : i64
      %10226 = arith.cmpi eq, %10223, %10193 : i64
      %10227 = arith.andi %10225, %10226 : i1
      %10228 = scf.if %10227 -> (i64) {
        scf.yield %10180 : i64
      } else {
        scf.yield %10223 : i64
      }
      %10229 = func.call @cc_errorp(%10192) : (i64) -> i64
      %10230 = arith.cmpi ne, %10229, %10193 : i64
      %10231 = arith.cmpi eq, %10228, %10193 : i64
      %10232 = arith.andi %10230, %10231 : i1
      %10233 = scf.if %10232 -> (i64) {
        scf.yield %10192 : i64
      } else {
        scf.yield %10228 : i64
      }
      %10234 = arith.cmpi ne, %10233, %10193 : i64
      scf.if %10234 {
        func.call @stack_push_pointer(%10233) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9902) : (i64) -> ()
        func.call @stack_push_pointer(%10049) : (i64) -> ()
        func.call @stack_push_pointer(%10137) : (i64) -> ()
        func.call @stack_push_pointer(%10162) : (i64) -> ()
        func.call @stack_push_pointer(%10169) : (i64) -> ()
        func.call @stack_push_pointer(%10173) : (i64) -> ()
        func.call @stack_push_pointer(%10180) : (i64) -> ()
        func.call @stack_push_pointer(%10192) : (i64) -> ()
        %10235 = llvm.mlir.addressof @str838 : !llvm.ptr
        %10236 = func.call @cc_make_function_ref_const(%10235) : (!llvm.ptr) -> i64
        %10237 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10236, %10237) : (i64, i64) -> ()
      }
      %10238 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10238 : i64
    }
    %10239 = func.call @cc_nil_value() : () -> i64
    %10240 = func.call @cc_errorp(%9893) : (i64) -> i64
    %10241 = arith.cmpi ne, %10240, %10239 : i64
    %10242 = scf.if %10241 -> (i64) {
      scf.yield %9893 : i64
    } else {
      %10243 = llvm.mlir.addressof @str839 : !llvm.ptr
      %10244 = arith.constant 39 : i64
      %10245 = func.call @cc_make_string(%10243, %10244) : (!llvm.ptr, i64) -> i64
      %10246 = func.call @cc_nil_value() : () -> i64
      %10247 = func.call @cc_intern(%10245, %10246) : (i64, i64) -> i64
      %10248 = func.call @cc_nil_value() : () -> i64
      %10249 = func.call @cc_cons(%10247, %10248) : (i64, i64) -> i64
      %10250 = func.call @cc_values_pack(%10249) : (i64) -> i64
      %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
      %10251 = arith.addi %10247, %__rlasp_stack_elide_zero_483 : i64
      %10252 = llvm.mlir.addressof @str840 : !llvm.ptr
      %10253 = arith.constant 13 : i64
      %10254 = func.call @cc_make_string(%10252, %10253) : (!llvm.ptr, i64) -> i64
      %10255 = llvm.mlir.addressof @str841 : !llvm.ptr
      %10256 = arith.constant 11 : i64
      %10257 = func.call @cc_make_string(%10255, %10256) : (!llvm.ptr, i64) -> i64
      %10258 = func.call @cc_intern(%10254, %10257) : (i64, i64) -> i64
      %10259 = func.call @cc_nil_value() : () -> i64
      %10260 = func.call @cc_cons(%10258, %10259) : (i64, i64) -> i64
      %10261 = func.call @cc_values_pack(%10260) : (i64) -> i64
      func.call @stack_push_pointer(%10258) : (i64) -> ()
      %10262 = llvm.mlir.addressof @str842 : !llvm.ptr
      %10263 = arith.constant 6 : i64
      %10264 = func.call @cc_make_string(%10262, %10263) : (!llvm.ptr, i64) -> i64
      %10265 = func.call @cc_nil_value() : () -> i64
      %10266 = func.call @cc_intern(%10264, %10265) : (i64, i64) -> i64
      %10267 = func.call @cc_nil_value() : () -> i64
      %10268 = func.call @cc_cons(%10266, %10267) : (i64, i64) -> i64
      %10269 = func.call @cc_values_pack(%10268) : (i64) -> i64
      func.call @stack_push_pointer(%10266) : (i64) -> ()
      %10270 = llvm.mlir.addressof @str843 : !llvm.ptr
      %10271 = arith.constant 19 : i64
      %10272 = func.call @cc_make_string(%10270, %10271) : (!llvm.ptr, i64) -> i64
      %10273 = func.call @cc_nil_value() : () -> i64
      %10274 = func.call @cc_intern(%10272, %10273) : (i64, i64) -> i64
      %10275 = func.call @cc_nil_value() : () -> i64
      %10276 = func.call @cc_cons(%10274, %10275) : (i64, i64) -> i64
      %10277 = func.call @cc_values_pack(%10276) : (i64) -> i64
      func.call @stack_push_pointer(%10274) : (i64) -> ()
      %10278 = llvm.mlir.addressof @str844 : !llvm.ptr
      %10279 = arith.constant 7 : i64
      %10280 = func.call @cc_make_string(%10278, %10279) : (!llvm.ptr, i64) -> i64
      %10281 = llvm.mlir.addressof @str845 : !llvm.ptr
      %10282 = arith.constant 11 : i64
      %10283 = func.call @cc_make_string(%10281, %10282) : (!llvm.ptr, i64) -> i64
      %10284 = func.call @cc_intern(%10280, %10283) : (i64, i64) -> i64
      %10285 = func.call @cc_nil_value() : () -> i64
      %10286 = func.call @cc_cons(%10284, %10285) : (i64, i64) -> i64
      %10287 = func.call @cc_values_pack(%10286) : (i64) -> i64
      func.call @stack_push_pointer(%10284) : (i64) -> ()
      %10288 = llvm.mlir.addressof @str846 : !llvm.ptr
      %10289 = arith.constant 7 : i64
      %10290 = func.call @cc_make_string(%10288, %10289) : (!llvm.ptr, i64) -> i64
      %10291 = llvm.mlir.addressof @str847 : !llvm.ptr
      %10292 = arith.constant 11 : i64
      %10293 = func.call @cc_make_string(%10291, %10292) : (!llvm.ptr, i64) -> i64
      %10294 = func.call @cc_intern(%10290, %10293) : (i64, i64) -> i64
      %10295 = func.call @cc_nil_value() : () -> i64
      %10296 = func.call @cc_cons(%10294, %10295) : (i64, i64) -> i64
      %10297 = func.call @cc_values_pack(%10296) : (i64) -> i64
      func.call @stack_push_pointer(%10294) : (i64) -> ()
      %10298 = llvm.mlir.addressof @str848 : !llvm.ptr
      %10299 = arith.constant 9 : i64
      %10300 = func.call @cc_make_string(%10298, %10299) : (!llvm.ptr, i64) -> i64
      %10301 = llvm.mlir.addressof @str849 : !llvm.ptr
      %10302 = arith.constant 11 : i64
      %10303 = func.call @cc_make_string(%10301, %10302) : (!llvm.ptr, i64) -> i64
      %10304 = func.call @cc_intern(%10300, %10303) : (i64, i64) -> i64
      %10305 = func.call @cc_nil_value() : () -> i64
      %10306 = func.call @cc_cons(%10304, %10305) : (i64, i64) -> i64
      %10307 = func.call @cc_values_pack(%10306) : (i64) -> i64
      func.call @stack_push_pointer(%10304) : (i64) -> ()
      %10308 = llvm.mlir.addressof @str850 : !llvm.ptr
      %10309 = arith.constant 10 : i64
      %10310 = func.call @cc_make_string(%10308, %10309) : (!llvm.ptr, i64) -> i64
      %10311 = llvm.mlir.addressof @str851 : !llvm.ptr
      %10312 = arith.constant 11 : i64
      %10313 = func.call @cc_make_string(%10311, %10312) : (!llvm.ptr, i64) -> i64
      %10314 = func.call @cc_intern(%10310, %10313) : (i64, i64) -> i64
      %10315 = func.call @cc_nil_value() : () -> i64
      %10316 = func.call @cc_cons(%10314, %10315) : (i64, i64) -> i64
      %10317 = func.call @cc_values_pack(%10316) : (i64) -> i64
      func.call @stack_push_pointer(%10314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10318 = func.call @stack_pop_pointer() : () -> i64
      %10319 = func.call @stack_pop_pointer() : () -> i64
      %10320 = func.call @cc_cons(%10319, %10318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
      %10321 = arith.addi %10320, %__rlasp_stack_elide_zero_484 : i64
      %10322 = func.call @stack_pop_pointer() : () -> i64
      %10323 = func.call @cc_cons(%10322, %10321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10323) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10324 = func.call @stack_pop_pointer() : () -> i64
      %10325 = func.call @stack_pop_pointer() : () -> i64
      %10326 = func.call @cc_cons(%10325, %10324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
      %10327 = arith.addi %10326, %__rlasp_stack_elide_zero_485 : i64
      %10328 = func.call @stack_pop_pointer() : () -> i64
      %10329 = func.call @cc_cons(%10328, %10327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10329) : (i64) -> ()
      %10330 = llvm.mlir.addressof @str852 : !llvm.ptr
      %10331 = arith.constant 10 : i64
      %10332 = func.call @cc_make_string(%10330, %10331) : (!llvm.ptr, i64) -> i64
      %10333 = llvm.mlir.addressof @str853 : !llvm.ptr
      %10334 = arith.constant 11 : i64
      %10335 = func.call @cc_make_string(%10333, %10334) : (!llvm.ptr, i64) -> i64
      %10336 = func.call @cc_intern(%10332, %10335) : (i64, i64) -> i64
      %10337 = func.call @cc_nil_value() : () -> i64
      %10338 = func.call @cc_cons(%10336, %10337) : (i64, i64) -> i64
      %10339 = func.call @cc_values_pack(%10338) : (i64) -> i64
      func.call @stack_push_pointer(%10336) : (i64) -> ()
      %10340 = llvm.mlir.addressof @str854 : !llvm.ptr
      %10341 = arith.constant 4 : i64
      %10342 = func.call @cc_make_string(%10340, %10341) : (!llvm.ptr, i64) -> i64
      %10343 = llvm.mlir.addressof @str855 : !llvm.ptr
      %10344 = arith.constant 11 : i64
      %10345 = func.call @cc_make_string(%10343, %10344) : (!llvm.ptr, i64) -> i64
      %10346 = func.call @cc_intern(%10342, %10345) : (i64, i64) -> i64
      %10347 = func.call @cc_nil_value() : () -> i64
      %10348 = func.call @cc_cons(%10346, %10347) : (i64, i64) -> i64
      %10349 = func.call @cc_values_pack(%10348) : (i64) -> i64
      func.call @stack_push_pointer(%10346) : (i64) -> ()
      %10350 = arith.constant -13 : i64
      func.call @stack_push_fixnum(%10350) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10351 = func.call @stack_pop_pointer() : () -> i64
      %10352 = func.call @stack_pop_pointer() : () -> i64
      %10353 = func.call @cc_cons(%10352, %10351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
      %10354 = arith.addi %10353, %__rlasp_stack_elide_zero_486 : i64
      %10355 = func.call @stack_pop_pointer() : () -> i64
      %10356 = func.call @cc_cons(%10355, %10354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10356) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10357 = func.call @stack_pop_pointer() : () -> i64
      %10358 = func.call @stack_pop_pointer() : () -> i64
      %10359 = func.call @cc_cons(%10358, %10357) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
      %10360 = arith.addi %10359, %__rlasp_stack_elide_zero_487 : i64
      %10361 = func.call @stack_pop_pointer() : () -> i64
      %10362 = func.call @cc_cons(%10361, %10360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10363 = func.call @stack_pop_pointer() : () -> i64
      %10364 = func.call @stack_pop_pointer() : () -> i64
      %10365 = func.call @cc_cons(%10364, %10363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
      %10366 = arith.addi %10365, %__rlasp_stack_elide_zero_488 : i64
      %10367 = func.call @stack_pop_pointer() : () -> i64
      %10368 = func.call @cc_cons(%10367, %10366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
      %10369 = arith.addi %10368, %__rlasp_stack_elide_zero_489 : i64
      %10370 = func.call @stack_pop_pointer() : () -> i64
      %10371 = func.call @cc_cons(%10370, %10369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10371) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10372 = func.call @stack_pop_pointer() : () -> i64
      %10373 = func.call @stack_pop_pointer() : () -> i64
      %10374 = func.call @cc_cons(%10373, %10372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
      %10375 = arith.addi %10374, %__rlasp_stack_elide_zero_490 : i64
      %10376 = func.call @stack_pop_pointer() : () -> i64
      %10377 = func.call @cc_cons(%10376, %10375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10378 = func.call @stack_pop_pointer() : () -> i64
      %10379 = func.call @stack_pop_pointer() : () -> i64
      %10380 = func.call @cc_cons(%10379, %10378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
      %10381 = arith.addi %10380, %__rlasp_stack_elide_zero_491 : i64
      %10382 = func.call @stack_pop_pointer() : () -> i64
      %10383 = func.call @cc_cons(%10382, %10381) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
      %10384 = arith.addi %10383, %__rlasp_stack_elide_zero_492 : i64
      %10385 = func.call @stack_pop_pointer() : () -> i64
      %10386 = func.call @cc_cons(%10385, %10384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10387 = func.call @stack_pop_pointer() : () -> i64
      %10388 = func.call @stack_pop_pointer() : () -> i64
      %10389 = func.call @cc_cons(%10388, %10387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
      %10390 = arith.addi %10389, %__rlasp_stack_elide_zero_493 : i64
      %10391 = func.call @stack_pop_pointer() : () -> i64
      %10392 = func.call @cc_cons(%10391, %10390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
      %10393 = arith.addi %10392, %__rlasp_stack_elide_zero_494 : i64
      %10467 = arith.constant 15079495958561 : i64
      %10468 = arith.constant 0 : i64
      %10469 = func.call @cc_make_closure(%10467, %10468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
      %10470 = arith.addi %10469, %__rlasp_stack_elide_zero_495 : i64
      %10471 = llvm.mlir.addressof @str857 : !llvm.ptr
      %10472 = arith.constant 4 : i64
      %10473 = func.call @cc_make_string(%10471, %10472) : (!llvm.ptr, i64) -> i64
      %10474 = func.call @cc_nil_value() : () -> i64
      %10475 = func.call @cc_intern(%10473, %10474) : (i64, i64) -> i64
      %10476 = func.call @cc_nil_value() : () -> i64
      %10477 = func.call @cc_cons(%10475, %10476) : (i64, i64) -> i64
      %10478 = func.call @cc_values_pack(%10477) : (i64) -> i64
      func.call @stack_push_pointer(%10475) : (i64) -> ()
      %10479 = llvm.mlir.addressof @str858 : !llvm.ptr
      %10480 = arith.constant 10 : i64
      %10481 = func.call @cc_make_string(%10479, %10480) : (!llvm.ptr, i64) -> i64
      %10482 = llvm.mlir.addressof @str859 : !llvm.ptr
      %10483 = arith.constant 11 : i64
      %10484 = func.call @cc_make_string(%10482, %10483) : (!llvm.ptr, i64) -> i64
      %10485 = func.call @cc_intern(%10481, %10484) : (i64, i64) -> i64
      %10486 = func.call @cc_nil_value() : () -> i64
      %10487 = func.call @cc_cons(%10485, %10486) : (i64, i64) -> i64
      %10488 = func.call @cc_values_pack(%10487) : (i64) -> i64
      func.call @stack_push_pointer(%10485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10489 = func.call @stack_pop_pointer() : () -> i64
      %10490 = func.call @stack_pop_pointer() : () -> i64
      %10491 = func.call @cc_cons(%10490, %10489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
      %10492 = arith.addi %10491, %__rlasp_stack_elide_zero_496 : i64
      %10493 = func.call @stack_pop_pointer() : () -> i64
      %10494 = func.call @cc_cons(%10493, %10492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
      %10495 = arith.addi %10494, %__rlasp_stack_elide_zero_497 : i64
      %10496 = llvm.mlir.addressof @str860 : !llvm.ptr
      %10497 = arith.constant 11 : i64
      %10498 = func.call @cc_make_string(%10496, %10497) : (!llvm.ptr, i64) -> i64
      %10499 = llvm.mlir.addressof @str861 : !llvm.ptr
      %10500 = arith.constant 7 : i64
      %10501 = func.call @cc_make_string(%10499, %10500) : (!llvm.ptr, i64) -> i64
      %10502 = func.call @cc_intern(%10498, %10501) : (i64, i64) -> i64
      %10503 = func.call @cc_nil_value() : () -> i64
      %10504 = func.call @cc_cons(%10502, %10503) : (i64, i64) -> i64
      %10505 = func.call @cc_values_pack(%10504) : (i64) -> i64
      %10506 = func.call @cc_nil_value() : () -> i64
      %10507 = llvm.mlir.addressof @str862 : !llvm.ptr
      %10508 = arith.constant 4 : i64
      %10509 = func.call @cc_make_string(%10507, %10508) : (!llvm.ptr, i64) -> i64
      %10510 = llvm.mlir.addressof @str863 : !llvm.ptr
      %10511 = arith.constant 7 : i64
      %10512 = func.call @cc_make_string(%10510, %10511) : (!llvm.ptr, i64) -> i64
      %10513 = func.call @cc_intern(%10509, %10512) : (i64, i64) -> i64
      %10514 = func.call @cc_nil_value() : () -> i64
      %10515 = func.call @cc_cons(%10513, %10514) : (i64, i64) -> i64
      %10516 = func.call @cc_values_pack(%10515) : (i64) -> i64
      %10517 = llvm.mlir.addressof @str864 : !llvm.ptr
      %10518 = arith.constant 5 : i64
      %10519 = func.call @cc_make_string(%10517, %10518) : (!llvm.ptr, i64) -> i64
      %10520 = func.call @cc_nil_value() : () -> i64
      %10521 = func.call @cc_intern(%10519, %10520) : (i64, i64) -> i64
      %10522 = func.call @cc_nil_value() : () -> i64
      %10523 = func.call @cc_cons(%10521, %10522) : (i64, i64) -> i64
      %10524 = func.call @cc_values_pack(%10523) : (i64) -> i64
      %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
      %10525 = arith.addi %10521, %__rlasp_stack_elide_zero_498 : i64
      %10526 = func.call @cc_nil_value() : () -> i64
      %10527 = func.call @cc_errorp(%10251) : (i64) -> i64
      %10528 = arith.cmpi ne, %10527, %10526 : i64
      %10529 = arith.cmpi eq, %10526, %10526 : i64
      %10530 = arith.andi %10528, %10529 : i1
      %10531 = scf.if %10530 -> (i64) {
        scf.yield %10251 : i64
      } else {
        scf.yield %10526 : i64
      }
      %10532 = func.call @cc_errorp(%10393) : (i64) -> i64
      %10533 = arith.cmpi ne, %10532, %10526 : i64
      %10534 = arith.cmpi eq, %10531, %10526 : i64
      %10535 = arith.andi %10533, %10534 : i1
      %10536 = scf.if %10535 -> (i64) {
        scf.yield %10393 : i64
      } else {
        scf.yield %10531 : i64
      }
      %10537 = func.call @cc_errorp(%10470) : (i64) -> i64
      %10538 = arith.cmpi ne, %10537, %10526 : i64
      %10539 = arith.cmpi eq, %10536, %10526 : i64
      %10540 = arith.andi %10538, %10539 : i1
      %10541 = scf.if %10540 -> (i64) {
        scf.yield %10470 : i64
      } else {
        scf.yield %10536 : i64
      }
      %10542 = func.call @cc_errorp(%10495) : (i64) -> i64
      %10543 = arith.cmpi ne, %10542, %10526 : i64
      %10544 = arith.cmpi eq, %10541, %10526 : i64
      %10545 = arith.andi %10543, %10544 : i1
      %10546 = scf.if %10545 -> (i64) {
        scf.yield %10495 : i64
      } else {
        scf.yield %10541 : i64
      }
      %10547 = func.call @cc_errorp(%10502) : (i64) -> i64
      %10548 = arith.cmpi ne, %10547, %10526 : i64
      %10549 = arith.cmpi eq, %10546, %10526 : i64
      %10550 = arith.andi %10548, %10549 : i1
      %10551 = scf.if %10550 -> (i64) {
        scf.yield %10502 : i64
      } else {
        scf.yield %10546 : i64
      }
      %10552 = func.call @cc_errorp(%10506) : (i64) -> i64
      %10553 = arith.cmpi ne, %10552, %10526 : i64
      %10554 = arith.cmpi eq, %10551, %10526 : i64
      %10555 = arith.andi %10553, %10554 : i1
      %10556 = scf.if %10555 -> (i64) {
        scf.yield %10506 : i64
      } else {
        scf.yield %10551 : i64
      }
      %10557 = func.call @cc_errorp(%10513) : (i64) -> i64
      %10558 = arith.cmpi ne, %10557, %10526 : i64
      %10559 = arith.cmpi eq, %10556, %10526 : i64
      %10560 = arith.andi %10558, %10559 : i1
      %10561 = scf.if %10560 -> (i64) {
        scf.yield %10513 : i64
      } else {
        scf.yield %10556 : i64
      }
      %10562 = func.call @cc_errorp(%10525) : (i64) -> i64
      %10563 = arith.cmpi ne, %10562, %10526 : i64
      %10564 = arith.cmpi eq, %10561, %10526 : i64
      %10565 = arith.andi %10563, %10564 : i1
      %10566 = scf.if %10565 -> (i64) {
        scf.yield %10525 : i64
      } else {
        scf.yield %10561 : i64
      }
      %10567 = arith.cmpi ne, %10566, %10526 : i64
      scf.if %10567 {
        func.call @stack_push_pointer(%10566) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10251) : (i64) -> ()
        func.call @stack_push_pointer(%10393) : (i64) -> ()
        func.call @stack_push_pointer(%10470) : (i64) -> ()
        func.call @stack_push_pointer(%10495) : (i64) -> ()
        func.call @stack_push_pointer(%10502) : (i64) -> ()
        func.call @stack_push_pointer(%10506) : (i64) -> ()
        func.call @stack_push_pointer(%10513) : (i64) -> ()
        func.call @stack_push_pointer(%10525) : (i64) -> ()
        %10568 = llvm.mlir.addressof @str865 : !llvm.ptr
        %10569 = func.call @cc_make_function_ref_const(%10568) : (!llvm.ptr) -> i64
        %10570 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10569, %10570) : (i64, i64) -> ()
      }
      %10571 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10571 : i64
    }
    %10572 = func.call @cc_nil_value() : () -> i64
    %10573 = func.call @cc_errorp(%10242) : (i64) -> i64
    %10574 = arith.cmpi ne, %10573, %10572 : i64
    %10575 = scf.if %10574 -> (i64) {
      scf.yield %10242 : i64
    } else {
      %10576 = llvm.mlir.addressof @str866 : !llvm.ptr
      %10577 = arith.constant 10 : i64
      %10578 = func.call @cc_make_string(%10576, %10577) : (!llvm.ptr, i64) -> i64
      %10579 = func.call @cc_nil_value() : () -> i64
      %10580 = func.call @cc_intern(%10578, %10579) : (i64, i64) -> i64
      %10581 = func.call @cc_nil_value() : () -> i64
      %10582 = func.call @cc_cons(%10580, %10581) : (i64, i64) -> i64
      %10583 = func.call @cc_values_pack(%10582) : (i64) -> i64
      %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
      %10584 = arith.addi %10580, %__rlasp_stack_elide_zero_499 : i64
      %10585 = llvm.mlir.addressof @str867 : !llvm.ptr
      %10586 = arith.constant 3 : i64
      %10587 = func.call @cc_make_string(%10585, %10586) : (!llvm.ptr, i64) -> i64
      %10588 = func.call @cc_nil_value() : () -> i64
      %10589 = func.call @cc_intern(%10587, %10588) : (i64, i64) -> i64
      %10590 = func.call @cc_nil_value() : () -> i64
      %10591 = func.call @cc_cons(%10589, %10590) : (i64, i64) -> i64
      %10592 = func.call @cc_values_pack(%10591) : (i64) -> i64
      func.call @stack_push_pointer(%10589) : (i64) -> ()
      %10593 = llvm.mlir.addressof @str868 : !llvm.ptr
      %10594 = arith.constant 3 : i64
      %10595 = func.call @cc_make_string(%10593, %10594) : (!llvm.ptr, i64) -> i64
      %10596 = func.call @cc_nil_value() : () -> i64
      %10597 = func.call @cc_intern(%10595, %10596) : (i64, i64) -> i64
      %10598 = func.call @cc_nil_value() : () -> i64
      %10599 = func.call @cc_cons(%10597, %10598) : (i64, i64) -> i64
      %10600 = func.call @cc_values_pack(%10599) : (i64) -> i64
      func.call @stack_push_pointer(%10597) : (i64) -> ()
      %10601 = llvm.mlir.addressof @str869 : !llvm.ptr
      %10602 = arith.constant 7 : i64
      %10603 = func.call @cc_make_string(%10601, %10602) : (!llvm.ptr, i64) -> i64
      %10604 = llvm.mlir.addressof @str870 : !llvm.ptr
      %10605 = arith.constant 11 : i64
      %10606 = func.call @cc_make_string(%10604, %10605) : (!llvm.ptr, i64) -> i64
      %10607 = func.call @cc_intern(%10603, %10606) : (i64, i64) -> i64
      %10608 = func.call @cc_nil_value() : () -> i64
      %10609 = func.call @cc_cons(%10607, %10608) : (i64, i64) -> i64
      %10610 = func.call @cc_values_pack(%10609) : (i64) -> i64
      func.call @stack_push_pointer(%10607) : (i64) -> ()
      %10611 = llvm.mlir.addressof @str871 : !llvm.ptr
      %10612 = arith.constant 3 : i64
      %10613 = func.call @cc_make_string(%10611, %10612) : (!llvm.ptr, i64) -> i64
      %10614 = llvm.mlir.addressof @str872 : !llvm.ptr
      %10615 = arith.constant 11 : i64
      %10616 = func.call @cc_make_string(%10614, %10615) : (!llvm.ptr, i64) -> i64
      %10617 = func.call @cc_intern(%10613, %10616) : (i64, i64) -> i64
      %10618 = func.call @cc_nil_value() : () -> i64
      %10619 = func.call @cc_cons(%10617, %10618) : (i64, i64) -> i64
      %10620 = func.call @cc_values_pack(%10619) : (i64) -> i64
      func.call @stack_push_pointer(%10617) : (i64) -> ()
      %10621 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10621) : (i64) -> ()
      %10622 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10622) : (i64) -> ()
      %10623 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10623) : (i64) -> ()
      %10624 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10624) : (i64) -> ()
      %10625 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10625) : (i64) -> ()
      %10626 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10626) : (i64) -> ()
      %10627 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10627) : (i64) -> ()
      %10628 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10628) : (i64) -> ()
      %10629 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10629) : (i64) -> ()
      %10630 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10630) : (i64) -> ()
      %10631 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10631) : (i64) -> ()
      %10632 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10632) : (i64) -> ()
      %10633 = arith.constant 12 : i64
      %10634 = func.call @cc_box_fixnum(%10633) : (i64) -> i64
      %10635 = func.call @cc_make_vector(%10634) : (i64) -> i64
      %10636 = func.call @stack_pop_pointer() : () -> i64
      %10637 = arith.constant 11 : i64
      %10638 = func.call @cc_box_fixnum(%10637) : (i64) -> i64
      %10639 = func.call @cc_svset(%10635, %10638, %10636) : (i64, i64, i64) -> i64
      %10640 = func.call @stack_pop_pointer() : () -> i64
      %10641 = arith.constant 10 : i64
      %10642 = func.call @cc_box_fixnum(%10641) : (i64) -> i64
      %10643 = func.call @cc_svset(%10635, %10642, %10640) : (i64, i64, i64) -> i64
      %10644 = func.call @stack_pop_pointer() : () -> i64
      %10645 = arith.constant 9 : i64
      %10646 = func.call @cc_box_fixnum(%10645) : (i64) -> i64
      %10647 = func.call @cc_svset(%10635, %10646, %10644) : (i64, i64, i64) -> i64
      %10648 = func.call @stack_pop_pointer() : () -> i64
      %10649 = arith.constant 8 : i64
      %10650 = func.call @cc_box_fixnum(%10649) : (i64) -> i64
      %10651 = func.call @cc_svset(%10635, %10650, %10648) : (i64, i64, i64) -> i64
      %10652 = func.call @stack_pop_pointer() : () -> i64
      %10653 = arith.constant 7 : i64
      %10654 = func.call @cc_box_fixnum(%10653) : (i64) -> i64
      %10655 = func.call @cc_svset(%10635, %10654, %10652) : (i64, i64, i64) -> i64
      %10656 = func.call @stack_pop_pointer() : () -> i64
      %10657 = arith.constant 6 : i64
      %10658 = func.call @cc_box_fixnum(%10657) : (i64) -> i64
      %10659 = func.call @cc_svset(%10635, %10658, %10656) : (i64, i64, i64) -> i64
      %10660 = func.call @stack_pop_pointer() : () -> i64
      %10661 = arith.constant 5 : i64
      %10662 = func.call @cc_box_fixnum(%10661) : (i64) -> i64
      %10663 = func.call @cc_svset(%10635, %10662, %10660) : (i64, i64, i64) -> i64
      %10664 = func.call @stack_pop_pointer() : () -> i64
      %10665 = arith.constant 4 : i64
      %10666 = func.call @cc_box_fixnum(%10665) : (i64) -> i64
      %10667 = func.call @cc_svset(%10635, %10666, %10664) : (i64, i64, i64) -> i64
      %10668 = func.call @stack_pop_pointer() : () -> i64
      %10669 = arith.constant 3 : i64
      %10670 = func.call @cc_box_fixnum(%10669) : (i64) -> i64
      %10671 = func.call @cc_svset(%10635, %10670, %10668) : (i64, i64, i64) -> i64
      %10672 = func.call @stack_pop_pointer() : () -> i64
      %10673 = arith.constant 2 : i64
      %10674 = func.call @cc_box_fixnum(%10673) : (i64) -> i64
      %10675 = func.call @cc_svset(%10635, %10674, %10672) : (i64, i64, i64) -> i64
      %10676 = func.call @stack_pop_pointer() : () -> i64
      %10677 = arith.constant 1 : i64
      %10678 = func.call @cc_box_fixnum(%10677) : (i64) -> i64
      %10679 = func.call @cc_svset(%10635, %10678, %10676) : (i64, i64, i64) -> i64
      %10680 = func.call @stack_pop_pointer() : () -> i64
      %10681 = arith.constant 0 : i64
      %10682 = func.call @cc_box_fixnum(%10681) : (i64) -> i64
      %10683 = func.call @cc_svset(%10635, %10682, %10680) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%10635) : (i64) -> ()
      %10684 = arith.constant 11 : i64
      func.call @stack_push_fixnum(%10684) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10685 = func.call @stack_pop_pointer() : () -> i64
      %10686 = func.call @stack_pop_pointer() : () -> i64
      %10687 = func.call @cc_cons(%10686, %10685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
      %10688 = arith.addi %10687, %__rlasp_stack_elide_zero_500 : i64
      %10689 = func.call @stack_pop_pointer() : () -> i64
      %10690 = func.call @cc_cons(%10689, %10688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
      %10691 = arith.addi %10690, %__rlasp_stack_elide_zero_501 : i64
      %10692 = func.call @stack_pop_pointer() : () -> i64
      %10693 = func.call @cc_cons(%10692, %10691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10693) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10694 = func.call @stack_pop_pointer() : () -> i64
      %10695 = func.call @stack_pop_pointer() : () -> i64
      %10696 = func.call @cc_cons(%10695, %10694) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
      %10697 = arith.addi %10696, %__rlasp_stack_elide_zero_502 : i64
      %10698 = func.call @stack_pop_pointer() : () -> i64
      %10699 = func.call @cc_cons(%10698, %10697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10699) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10700 = func.call @stack_pop_pointer() : () -> i64
      %10701 = func.call @stack_pop_pointer() : () -> i64
      %10702 = func.call @cc_cons(%10701, %10700) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
      %10703 = arith.addi %10702, %__rlasp_stack_elide_zero_503 : i64
      %10704 = func.call @stack_pop_pointer() : () -> i64
      %10705 = func.call @cc_cons(%10704, %10703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10706 = func.call @stack_pop_pointer() : () -> i64
      %10707 = func.call @stack_pop_pointer() : () -> i64
      %10708 = func.call @cc_cons(%10707, %10706) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
      %10709 = arith.addi %10708, %__rlasp_stack_elide_zero_504 : i64
      %10710 = func.call @stack_pop_pointer() : () -> i64
      %10711 = func.call @cc_cons(%10710, %10709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
      %10712 = arith.addi %10711, %__rlasp_stack_elide_zero_505 : i64
      %10810 = arith.constant 15079495958562 : i64
      %10811 = arith.constant 0 : i64
      %10812 = func.call @cc_make_closure(%10810, %10811) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
      %10813 = arith.addi %10812, %__rlasp_stack_elide_zero_506 : i64
      %10814 = llvm.mlir.addressof @str874 : !llvm.ptr
      %10815 = arith.constant 1 : i64
      %10816 = func.call @cc_make_string(%10814, %10815) : (!llvm.ptr, i64) -> i64
      %10817 = func.call @cc_nil_value() : () -> i64
      %10818 = func.call @cc_intern(%10816, %10817) : (i64, i64) -> i64
      %10819 = func.call @cc_nil_value() : () -> i64
      %10820 = func.call @cc_cons(%10818, %10819) : (i64, i64) -> i64
      %10821 = func.call @cc_values_pack(%10820) : (i64) -> i64
      func.call @stack_push_pointer(%10818) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10822 = func.call @stack_pop_pointer() : () -> i64
      %10823 = func.call @stack_pop_pointer() : () -> i64
      %10824 = func.call @cc_cons(%10823, %10822) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
      %10825 = arith.addi %10824, %__rlasp_stack_elide_zero_507 : i64
      %10826 = llvm.mlir.addressof @str875 : !llvm.ptr
      %10827 = arith.constant 11 : i64
      %10828 = func.call @cc_make_string(%10826, %10827) : (!llvm.ptr, i64) -> i64
      %10829 = llvm.mlir.addressof @str876 : !llvm.ptr
      %10830 = arith.constant 7 : i64
      %10831 = func.call @cc_make_string(%10829, %10830) : (!llvm.ptr, i64) -> i64
      %10832 = func.call @cc_intern(%10828, %10831) : (i64, i64) -> i64
      %10833 = func.call @cc_nil_value() : () -> i64
      %10834 = func.call @cc_cons(%10832, %10833) : (i64, i64) -> i64
      %10835 = func.call @cc_values_pack(%10834) : (i64) -> i64
      %10836 = func.call @cc_nil_value() : () -> i64
      %10837 = llvm.mlir.addressof @str877 : !llvm.ptr
      %10838 = arith.constant 4 : i64
      %10839 = func.call @cc_make_string(%10837, %10838) : (!llvm.ptr, i64) -> i64
      %10840 = llvm.mlir.addressof @str878 : !llvm.ptr
      %10841 = arith.constant 7 : i64
      %10842 = func.call @cc_make_string(%10840, %10841) : (!llvm.ptr, i64) -> i64
      %10843 = func.call @cc_intern(%10839, %10842) : (i64, i64) -> i64
      %10844 = func.call @cc_nil_value() : () -> i64
      %10845 = func.call @cc_cons(%10843, %10844) : (i64, i64) -> i64
      %10846 = func.call @cc_values_pack(%10845) : (i64) -> i64
      %10847 = llvm.mlir.addressof @str879 : !llvm.ptr
      %10848 = arith.constant 6 : i64
      %10849 = func.call @cc_make_string(%10847, %10848) : (!llvm.ptr, i64) -> i64
      %10850 = func.call @cc_nil_value() : () -> i64
      %10851 = func.call @cc_intern(%10849, %10850) : (i64, i64) -> i64
      %10852 = func.call @cc_nil_value() : () -> i64
      %10853 = func.call @cc_cons(%10851, %10852) : (i64, i64) -> i64
      %10854 = func.call @cc_values_pack(%10853) : (i64) -> i64
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %10855 = arith.addi %10851, %__rlasp_stack_elide_zero_508 : i64
      %10856 = func.call @cc_nil_value() : () -> i64
      %10857 = func.call @cc_errorp(%10584) : (i64) -> i64
      %10858 = arith.cmpi ne, %10857, %10856 : i64
      %10859 = arith.cmpi eq, %10856, %10856 : i64
      %10860 = arith.andi %10858, %10859 : i1
      %10861 = scf.if %10860 -> (i64) {
        scf.yield %10584 : i64
      } else {
        scf.yield %10856 : i64
      }
      %10862 = func.call @cc_errorp(%10712) : (i64) -> i64
      %10863 = arith.cmpi ne, %10862, %10856 : i64
      %10864 = arith.cmpi eq, %10861, %10856 : i64
      %10865 = arith.andi %10863, %10864 : i1
      %10866 = scf.if %10865 -> (i64) {
        scf.yield %10712 : i64
      } else {
        scf.yield %10861 : i64
      }
      %10867 = func.call @cc_errorp(%10813) : (i64) -> i64
      %10868 = arith.cmpi ne, %10867, %10856 : i64
      %10869 = arith.cmpi eq, %10866, %10856 : i64
      %10870 = arith.andi %10868, %10869 : i1
      %10871 = scf.if %10870 -> (i64) {
        scf.yield %10813 : i64
      } else {
        scf.yield %10866 : i64
      }
      %10872 = func.call @cc_errorp(%10825) : (i64) -> i64
      %10873 = arith.cmpi ne, %10872, %10856 : i64
      %10874 = arith.cmpi eq, %10871, %10856 : i64
      %10875 = arith.andi %10873, %10874 : i1
      %10876 = scf.if %10875 -> (i64) {
        scf.yield %10825 : i64
      } else {
        scf.yield %10871 : i64
      }
      %10877 = func.call @cc_errorp(%10832) : (i64) -> i64
      %10878 = arith.cmpi ne, %10877, %10856 : i64
      %10879 = arith.cmpi eq, %10876, %10856 : i64
      %10880 = arith.andi %10878, %10879 : i1
      %10881 = scf.if %10880 -> (i64) {
        scf.yield %10832 : i64
      } else {
        scf.yield %10876 : i64
      }
      %10882 = func.call @cc_errorp(%10836) : (i64) -> i64
      %10883 = arith.cmpi ne, %10882, %10856 : i64
      %10884 = arith.cmpi eq, %10881, %10856 : i64
      %10885 = arith.andi %10883, %10884 : i1
      %10886 = scf.if %10885 -> (i64) {
        scf.yield %10836 : i64
      } else {
        scf.yield %10881 : i64
      }
      %10887 = func.call @cc_errorp(%10843) : (i64) -> i64
      %10888 = arith.cmpi ne, %10887, %10856 : i64
      %10889 = arith.cmpi eq, %10886, %10856 : i64
      %10890 = arith.andi %10888, %10889 : i1
      %10891 = scf.if %10890 -> (i64) {
        scf.yield %10843 : i64
      } else {
        scf.yield %10886 : i64
      }
      %10892 = func.call @cc_errorp(%10855) : (i64) -> i64
      %10893 = arith.cmpi ne, %10892, %10856 : i64
      %10894 = arith.cmpi eq, %10891, %10856 : i64
      %10895 = arith.andi %10893, %10894 : i1
      %10896 = scf.if %10895 -> (i64) {
        scf.yield %10855 : i64
      } else {
        scf.yield %10891 : i64
      }
      %10897 = arith.cmpi ne, %10896, %10856 : i64
      scf.if %10897 {
        func.call @stack_push_pointer(%10896) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10584) : (i64) -> ()
        func.call @stack_push_pointer(%10712) : (i64) -> ()
        func.call @stack_push_pointer(%10813) : (i64) -> ()
        func.call @stack_push_pointer(%10825) : (i64) -> ()
        func.call @stack_push_pointer(%10832) : (i64) -> ()
        func.call @stack_push_pointer(%10836) : (i64) -> ()
        func.call @stack_push_pointer(%10843) : (i64) -> ()
        func.call @stack_push_pointer(%10855) : (i64) -> ()
        %10898 = llvm.mlir.addressof @str880 : !llvm.ptr
        %10899 = func.call @cc_make_function_ref_const(%10898) : (!llvm.ptr) -> i64
        %10900 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10899, %10900) : (i64, i64) -> ()
      }
      %10901 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10901 : i64
    }
    %10902 = func.call @cc_nil_value() : () -> i64
    %10903 = func.call @cc_errorp(%10575) : (i64) -> i64
    %10904 = arith.cmpi ne, %10903, %10902 : i64
    %10905 = scf.if %10904 -> (i64) {
      scf.yield %10575 : i64
    } else {
      %10906 = llvm.mlir.addressof @str881 : !llvm.ptr
      %10907 = arith.constant 12 : i64
      %10908 = func.call @cc_make_string(%10906, %10907) : (!llvm.ptr, i64) -> i64
      %10909 = func.call @cc_nil_value() : () -> i64
      %10910 = func.call @cc_intern(%10908, %10909) : (i64, i64) -> i64
      %10911 = func.call @cc_nil_value() : () -> i64
      %10912 = func.call @cc_cons(%10910, %10911) : (i64, i64) -> i64
      %10913 = func.call @cc_values_pack(%10912) : (i64) -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %10914 = arith.addi %10910, %__rlasp_stack_elide_zero_509 : i64
      %10915 = llvm.mlir.addressof @str882 : !llvm.ptr
      %10916 = arith.constant 3 : i64
      %10917 = func.call @cc_make_string(%10915, %10916) : (!llvm.ptr, i64) -> i64
      %10918 = func.call @cc_nil_value() : () -> i64
      %10919 = func.call @cc_intern(%10917, %10918) : (i64, i64) -> i64
      %10920 = func.call @cc_nil_value() : () -> i64
      %10921 = func.call @cc_cons(%10919, %10920) : (i64, i64) -> i64
      %10922 = func.call @cc_values_pack(%10921) : (i64) -> i64
      func.call @stack_push_pointer(%10919) : (i64) -> ()
      %10923 = llvm.mlir.addressof @str883 : !llvm.ptr
      %10924 = arith.constant 3 : i64
      %10925 = func.call @cc_make_string(%10923, %10924) : (!llvm.ptr, i64) -> i64
      %10926 = func.call @cc_nil_value() : () -> i64
      %10927 = func.call @cc_intern(%10925, %10926) : (i64, i64) -> i64
      %10928 = func.call @cc_nil_value() : () -> i64
      %10929 = func.call @cc_cons(%10927, %10928) : (i64, i64) -> i64
      %10930 = func.call @cc_values_pack(%10929) : (i64) -> i64
      func.call @stack_push_pointer(%10927) : (i64) -> ()
      %10931 = llvm.mlir.addressof @str884 : !llvm.ptr
      %10932 = arith.constant 7 : i64
      %10933 = func.call @cc_make_string(%10931, %10932) : (!llvm.ptr, i64) -> i64
      %10934 = llvm.mlir.addressof @str885 : !llvm.ptr
      %10935 = arith.constant 11 : i64
      %10936 = func.call @cc_make_string(%10934, %10935) : (!llvm.ptr, i64) -> i64
      %10937 = func.call @cc_intern(%10933, %10936) : (i64, i64) -> i64
      %10938 = func.call @cc_nil_value() : () -> i64
      %10939 = func.call @cc_cons(%10937, %10938) : (i64, i64) -> i64
      %10940 = func.call @cc_values_pack(%10939) : (i64) -> i64
      func.call @stack_push_pointer(%10937) : (i64) -> ()
      %10941 = llvm.mlir.addressof @str886 : !llvm.ptr
      %10942 = arith.constant 3 : i64
      %10943 = func.call @cc_make_string(%10941, %10942) : (!llvm.ptr, i64) -> i64
      %10944 = llvm.mlir.addressof @str887 : !llvm.ptr
      %10945 = arith.constant 11 : i64
      %10946 = func.call @cc_make_string(%10944, %10945) : (!llvm.ptr, i64) -> i64
      %10947 = func.call @cc_intern(%10943, %10946) : (i64, i64) -> i64
      %10948 = func.call @cc_nil_value() : () -> i64
      %10949 = func.call @cc_cons(%10947, %10948) : (i64, i64) -> i64
      %10950 = func.call @cc_values_pack(%10949) : (i64) -> i64
      func.call @stack_push_pointer(%10947) : (i64) -> ()
      %10951 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10951) : (i64) -> ()
      %10952 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10952) : (i64) -> ()
      %10953 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10953) : (i64) -> ()
      %10954 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10954) : (i64) -> ()
      %10955 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10955) : (i64) -> ()
      %10956 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10956) : (i64) -> ()
      %10957 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10957) : (i64) -> ()
      %10958 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10958) : (i64) -> ()
      %10959 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10959) : (i64) -> ()
      %10960 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10960) : (i64) -> ()
      %10961 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10961) : (i64) -> ()
      %10962 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10962) : (i64) -> ()
      %10963 = arith.constant 12 : i64
      %10964 = func.call @cc_box_fixnum(%10963) : (i64) -> i64
      %10965 = func.call @cc_make_vector(%10964) : (i64) -> i64
      %10966 = func.call @stack_pop_pointer() : () -> i64
      %10967 = arith.constant 11 : i64
      %10968 = func.call @cc_box_fixnum(%10967) : (i64) -> i64
      %10969 = func.call @cc_svset(%10965, %10968, %10966) : (i64, i64, i64) -> i64
      %10970 = func.call @stack_pop_pointer() : () -> i64
      %10971 = arith.constant 10 : i64
      %10972 = func.call @cc_box_fixnum(%10971) : (i64) -> i64
      %10973 = func.call @cc_svset(%10965, %10972, %10970) : (i64, i64, i64) -> i64
      %10974 = func.call @stack_pop_pointer() : () -> i64
      %10975 = arith.constant 9 : i64
      %10976 = func.call @cc_box_fixnum(%10975) : (i64) -> i64
      %10977 = func.call @cc_svset(%10965, %10976, %10974) : (i64, i64, i64) -> i64
      %10978 = func.call @stack_pop_pointer() : () -> i64
      %10979 = arith.constant 8 : i64
      %10980 = func.call @cc_box_fixnum(%10979) : (i64) -> i64
      %10981 = func.call @cc_svset(%10965, %10980, %10978) : (i64, i64, i64) -> i64
      %10982 = func.call @stack_pop_pointer() : () -> i64
      %10983 = arith.constant 7 : i64
      %10984 = func.call @cc_box_fixnum(%10983) : (i64) -> i64
      %10985 = func.call @cc_svset(%10965, %10984, %10982) : (i64, i64, i64) -> i64
      %10986 = func.call @stack_pop_pointer() : () -> i64
      %10987 = arith.constant 6 : i64
      %10988 = func.call @cc_box_fixnum(%10987) : (i64) -> i64
      %10989 = func.call @cc_svset(%10965, %10988, %10986) : (i64, i64, i64) -> i64
      %10990 = func.call @stack_pop_pointer() : () -> i64
      %10991 = arith.constant 5 : i64
      %10992 = func.call @cc_box_fixnum(%10991) : (i64) -> i64
      %10993 = func.call @cc_svset(%10965, %10992, %10990) : (i64, i64, i64) -> i64
      %10994 = func.call @stack_pop_pointer() : () -> i64
      %10995 = arith.constant 4 : i64
      %10996 = func.call @cc_box_fixnum(%10995) : (i64) -> i64
      %10997 = func.call @cc_svset(%10965, %10996, %10994) : (i64, i64, i64) -> i64
      %10998 = func.call @stack_pop_pointer() : () -> i64
      %10999 = arith.constant 3 : i64
      %11000 = func.call @cc_box_fixnum(%10999) : (i64) -> i64
      %11001 = func.call @cc_svset(%10965, %11000, %10998) : (i64, i64, i64) -> i64
      %11002 = func.call @stack_pop_pointer() : () -> i64
      %11003 = arith.constant 2 : i64
      %11004 = func.call @cc_box_fixnum(%11003) : (i64) -> i64
      %11005 = func.call @cc_svset(%10965, %11004, %11002) : (i64, i64, i64) -> i64
      %11006 = func.call @stack_pop_pointer() : () -> i64
      %11007 = arith.constant 1 : i64
      %11008 = func.call @cc_box_fixnum(%11007) : (i64) -> i64
      %11009 = func.call @cc_svset(%10965, %11008, %11006) : (i64, i64, i64) -> i64
      %11010 = func.call @stack_pop_pointer() : () -> i64
      %11011 = arith.constant 0 : i64
      %11012 = func.call @cc_box_fixnum(%11011) : (i64) -> i64
      %11013 = func.call @cc_svset(%10965, %11012, %11010) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%10965) : (i64) -> ()
      %11014 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%11014) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11015 = func.call @stack_pop_pointer() : () -> i64
      %11016 = func.call @stack_pop_pointer() : () -> i64
      %11017 = func.call @cc_cons(%11016, %11015) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %11018 = arith.addi %11017, %__rlasp_stack_elide_zero_510 : i64
      %11019 = func.call @stack_pop_pointer() : () -> i64
      %11020 = func.call @cc_cons(%11019, %11018) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %11021 = arith.addi %11020, %__rlasp_stack_elide_zero_511 : i64
      %11022 = func.call @stack_pop_pointer() : () -> i64
      %11023 = func.call @cc_cons(%11022, %11021) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11023) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11024 = func.call @stack_pop_pointer() : () -> i64
      %11025 = func.call @stack_pop_pointer() : () -> i64
      %11026 = func.call @cc_cons(%11025, %11024) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
      %11027 = arith.addi %11026, %__rlasp_stack_elide_zero_512 : i64
      %11028 = func.call @stack_pop_pointer() : () -> i64
      %11029 = func.call @cc_cons(%11028, %11027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11029) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11030 = func.call @stack_pop_pointer() : () -> i64
      %11031 = func.call @stack_pop_pointer() : () -> i64
      %11032 = func.call @cc_cons(%11031, %11030) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
      %11033 = arith.addi %11032, %__rlasp_stack_elide_zero_513 : i64
      %11034 = func.call @stack_pop_pointer() : () -> i64
      %11035 = func.call @cc_cons(%11034, %11033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11035) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11036 = func.call @stack_pop_pointer() : () -> i64
      %11037 = func.call @stack_pop_pointer() : () -> i64
      %11038 = func.call @cc_cons(%11037, %11036) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
      %11039 = arith.addi %11038, %__rlasp_stack_elide_zero_514 : i64
      %11040 = func.call @stack_pop_pointer() : () -> i64
      %11041 = func.call @cc_cons(%11040, %11039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
      %11042 = arith.addi %11041, %__rlasp_stack_elide_zero_515 : i64
      %11140 = arith.constant 15079495958563 : i64
      %11141 = arith.constant 0 : i64
      %11142 = func.call @cc_make_closure(%11140, %11141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
      %11143 = arith.addi %11142, %__rlasp_stack_elide_zero_516 : i64
      %11144 = llvm.mlir.addressof @str889 : !llvm.ptr
      %11145 = arith.constant 1 : i64
      %11146 = func.call @cc_make_string(%11144, %11145) : (!llvm.ptr, i64) -> i64
      %11147 = func.call @cc_nil_value() : () -> i64
      %11148 = func.call @cc_intern(%11146, %11147) : (i64, i64) -> i64
      %11149 = func.call @cc_nil_value() : () -> i64
      %11150 = func.call @cc_cons(%11148, %11149) : (i64, i64) -> i64
      %11151 = func.call @cc_values_pack(%11150) : (i64) -> i64
      func.call @stack_push_pointer(%11148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11152 = func.call @stack_pop_pointer() : () -> i64
      %11153 = func.call @stack_pop_pointer() : () -> i64
      %11154 = func.call @cc_cons(%11153, %11152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
      %11155 = arith.addi %11154, %__rlasp_stack_elide_zero_517 : i64
      %11156 = llvm.mlir.addressof @str890 : !llvm.ptr
      %11157 = arith.constant 11 : i64
      %11158 = func.call @cc_make_string(%11156, %11157) : (!llvm.ptr, i64) -> i64
      %11159 = llvm.mlir.addressof @str891 : !llvm.ptr
      %11160 = arith.constant 7 : i64
      %11161 = func.call @cc_make_string(%11159, %11160) : (!llvm.ptr, i64) -> i64
      %11162 = func.call @cc_intern(%11158, %11161) : (i64, i64) -> i64
      %11163 = func.call @cc_nil_value() : () -> i64
      %11164 = func.call @cc_cons(%11162, %11163) : (i64, i64) -> i64
      %11165 = func.call @cc_values_pack(%11164) : (i64) -> i64
      %11166 = func.call @cc_nil_value() : () -> i64
      %11167 = llvm.mlir.addressof @str892 : !llvm.ptr
      %11168 = arith.constant 4 : i64
      %11169 = func.call @cc_make_string(%11167, %11168) : (!llvm.ptr, i64) -> i64
      %11170 = llvm.mlir.addressof @str893 : !llvm.ptr
      %11171 = arith.constant 7 : i64
      %11172 = func.call @cc_make_string(%11170, %11171) : (!llvm.ptr, i64) -> i64
      %11173 = func.call @cc_intern(%11169, %11172) : (i64, i64) -> i64
      %11174 = func.call @cc_nil_value() : () -> i64
      %11175 = func.call @cc_cons(%11173, %11174) : (i64, i64) -> i64
      %11176 = func.call @cc_values_pack(%11175) : (i64) -> i64
      %11177 = llvm.mlir.addressof @str894 : !llvm.ptr
      %11178 = arith.constant 6 : i64
      %11179 = func.call @cc_make_string(%11177, %11178) : (!llvm.ptr, i64) -> i64
      %11180 = func.call @cc_nil_value() : () -> i64
      %11181 = func.call @cc_intern(%11179, %11180) : (i64, i64) -> i64
      %11182 = func.call @cc_nil_value() : () -> i64
      %11183 = func.call @cc_cons(%11181, %11182) : (i64, i64) -> i64
      %11184 = func.call @cc_values_pack(%11183) : (i64) -> i64
      %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
      %11185 = arith.addi %11181, %__rlasp_stack_elide_zero_518 : i64
      %11186 = func.call @cc_nil_value() : () -> i64
      %11187 = func.call @cc_errorp(%10914) : (i64) -> i64
      %11188 = arith.cmpi ne, %11187, %11186 : i64
      %11189 = arith.cmpi eq, %11186, %11186 : i64
      %11190 = arith.andi %11188, %11189 : i1
      %11191 = scf.if %11190 -> (i64) {
        scf.yield %10914 : i64
      } else {
        scf.yield %11186 : i64
      }
      %11192 = func.call @cc_errorp(%11042) : (i64) -> i64
      %11193 = arith.cmpi ne, %11192, %11186 : i64
      %11194 = arith.cmpi eq, %11191, %11186 : i64
      %11195 = arith.andi %11193, %11194 : i1
      %11196 = scf.if %11195 -> (i64) {
        scf.yield %11042 : i64
      } else {
        scf.yield %11191 : i64
      }
      %11197 = func.call @cc_errorp(%11143) : (i64) -> i64
      %11198 = arith.cmpi ne, %11197, %11186 : i64
      %11199 = arith.cmpi eq, %11196, %11186 : i64
      %11200 = arith.andi %11198, %11199 : i1
      %11201 = scf.if %11200 -> (i64) {
        scf.yield %11143 : i64
      } else {
        scf.yield %11196 : i64
      }
      %11202 = func.call @cc_errorp(%11155) : (i64) -> i64
      %11203 = arith.cmpi ne, %11202, %11186 : i64
      %11204 = arith.cmpi eq, %11201, %11186 : i64
      %11205 = arith.andi %11203, %11204 : i1
      %11206 = scf.if %11205 -> (i64) {
        scf.yield %11155 : i64
      } else {
        scf.yield %11201 : i64
      }
      %11207 = func.call @cc_errorp(%11162) : (i64) -> i64
      %11208 = arith.cmpi ne, %11207, %11186 : i64
      %11209 = arith.cmpi eq, %11206, %11186 : i64
      %11210 = arith.andi %11208, %11209 : i1
      %11211 = scf.if %11210 -> (i64) {
        scf.yield %11162 : i64
      } else {
        scf.yield %11206 : i64
      }
      %11212 = func.call @cc_errorp(%11166) : (i64) -> i64
      %11213 = arith.cmpi ne, %11212, %11186 : i64
      %11214 = arith.cmpi eq, %11211, %11186 : i64
      %11215 = arith.andi %11213, %11214 : i1
      %11216 = scf.if %11215 -> (i64) {
        scf.yield %11166 : i64
      } else {
        scf.yield %11211 : i64
      }
      %11217 = func.call @cc_errorp(%11173) : (i64) -> i64
      %11218 = arith.cmpi ne, %11217, %11186 : i64
      %11219 = arith.cmpi eq, %11216, %11186 : i64
      %11220 = arith.andi %11218, %11219 : i1
      %11221 = scf.if %11220 -> (i64) {
        scf.yield %11173 : i64
      } else {
        scf.yield %11216 : i64
      }
      %11222 = func.call @cc_errorp(%11185) : (i64) -> i64
      %11223 = arith.cmpi ne, %11222, %11186 : i64
      %11224 = arith.cmpi eq, %11221, %11186 : i64
      %11225 = arith.andi %11223, %11224 : i1
      %11226 = scf.if %11225 -> (i64) {
        scf.yield %11185 : i64
      } else {
        scf.yield %11221 : i64
      }
      %11227 = arith.cmpi ne, %11226, %11186 : i64
      scf.if %11227 {
        func.call @stack_push_pointer(%11226) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10914) : (i64) -> ()
        func.call @stack_push_pointer(%11042) : (i64) -> ()
        func.call @stack_push_pointer(%11143) : (i64) -> ()
        func.call @stack_push_pointer(%11155) : (i64) -> ()
        func.call @stack_push_pointer(%11162) : (i64) -> ()
        func.call @stack_push_pointer(%11166) : (i64) -> ()
        func.call @stack_push_pointer(%11173) : (i64) -> ()
        func.call @stack_push_pointer(%11185) : (i64) -> ()
        %11228 = llvm.mlir.addressof @str895 : !llvm.ptr
        %11229 = func.call @cc_make_function_ref_const(%11228) : (!llvm.ptr) -> i64
        %11230 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11229, %11230) : (i64, i64) -> ()
      }
      %11231 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11231 : i64
    }
    %11232 = func.call @cc_nil_value() : () -> i64
    %11233 = func.call @cc_errorp(%10905) : (i64) -> i64
    %11234 = arith.cmpi ne, %11233, %11232 : i64
    %11235 = scf.if %11234 -> (i64) {
      scf.yield %10905 : i64
    } else {
      %11236 = llvm.mlir.addressof @str896 : !llvm.ptr
      %11237 = arith.constant 12 : i64
      %11238 = func.call @cc_make_string(%11236, %11237) : (!llvm.ptr, i64) -> i64
      %11239 = func.call @cc_nil_value() : () -> i64
      %11240 = func.call @cc_intern(%11238, %11239) : (i64, i64) -> i64
      %11241 = func.call @cc_nil_value() : () -> i64
      %11242 = func.call @cc_cons(%11240, %11241) : (i64, i64) -> i64
      %11243 = func.call @cc_values_pack(%11242) : (i64) -> i64
      %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
      %11244 = arith.addi %11240, %__rlasp_stack_elide_zero_519 : i64
      %11245 = llvm.mlir.addressof @str897 : !llvm.ptr
      %11246 = arith.constant 3 : i64
      %11247 = func.call @cc_make_string(%11245, %11246) : (!llvm.ptr, i64) -> i64
      %11248 = func.call @cc_nil_value() : () -> i64
      %11249 = func.call @cc_intern(%11247, %11248) : (i64, i64) -> i64
      %11250 = func.call @cc_nil_value() : () -> i64
      %11251 = func.call @cc_cons(%11249, %11250) : (i64, i64) -> i64
      %11252 = func.call @cc_values_pack(%11251) : (i64) -> i64
      func.call @stack_push_pointer(%11249) : (i64) -> ()
      %11253 = llvm.mlir.addressof @str898 : !llvm.ptr
      %11254 = arith.constant 3 : i64
      %11255 = func.call @cc_make_string(%11253, %11254) : (!llvm.ptr, i64) -> i64
      %11256 = func.call @cc_nil_value() : () -> i64
      %11257 = func.call @cc_intern(%11255, %11256) : (i64, i64) -> i64
      %11258 = func.call @cc_nil_value() : () -> i64
      %11259 = func.call @cc_cons(%11257, %11258) : (i64, i64) -> i64
      %11260 = func.call @cc_values_pack(%11259) : (i64) -> i64
      func.call @stack_push_pointer(%11257) : (i64) -> ()
      %11261 = llvm.mlir.addressof @str899 : !llvm.ptr
      %11262 = arith.constant 7 : i64
      %11263 = func.call @cc_make_string(%11261, %11262) : (!llvm.ptr, i64) -> i64
      %11264 = llvm.mlir.addressof @str900 : !llvm.ptr
      %11265 = arith.constant 11 : i64
      %11266 = func.call @cc_make_string(%11264, %11265) : (!llvm.ptr, i64) -> i64
      %11267 = func.call @cc_intern(%11263, %11266) : (i64, i64) -> i64
      %11268 = func.call @cc_nil_value() : () -> i64
      %11269 = func.call @cc_cons(%11267, %11268) : (i64, i64) -> i64
      %11270 = func.call @cc_values_pack(%11269) : (i64) -> i64
      func.call @stack_push_pointer(%11267) : (i64) -> ()
      %11271 = llvm.mlir.addressof @str901 : !llvm.ptr
      %11272 = arith.constant 4 : i64
      %11273 = func.call @cc_make_string(%11271, %11272) : (!llvm.ptr, i64) -> i64
      %11274 = llvm.mlir.addressof @str902 : !llvm.ptr
      %11275 = arith.constant 11 : i64
      %11276 = func.call @cc_make_string(%11274, %11275) : (!llvm.ptr, i64) -> i64
      %11277 = func.call @cc_intern(%11273, %11276) : (i64, i64) -> i64
      %11278 = func.call @cc_nil_value() : () -> i64
      %11279 = func.call @cc_cons(%11277, %11278) : (i64, i64) -> i64
      %11280 = func.call @cc_values_pack(%11279) : (i64) -> i64
      func.call @stack_push_pointer(%11277) : (i64) -> ()
      %11281 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11281) : (i64) -> ()
      %11282 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11282) : (i64) -> ()
      %11283 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11283) : (i64) -> ()
      %11284 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11284) : (i64) -> ()
      %11285 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11285) : (i64) -> ()
      %11286 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11286) : (i64) -> ()
      %11287 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11287) : (i64) -> ()
      %11288 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11288) : (i64) -> ()
      %11289 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11289) : (i64) -> ()
      %11290 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11290) : (i64) -> ()
      %11291 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11291) : (i64) -> ()
      %11292 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11292) : (i64) -> ()
      %11293 = arith.constant 12 : i64
      %11294 = func.call @cc_box_fixnum(%11293) : (i64) -> i64
      %11295 = func.call @cc_make_vector(%11294) : (i64) -> i64
      %11296 = func.call @stack_pop_pointer() : () -> i64
      %11297 = arith.constant 11 : i64
      %11298 = func.call @cc_box_fixnum(%11297) : (i64) -> i64
      %11299 = func.call @cc_svset(%11295, %11298, %11296) : (i64, i64, i64) -> i64
      %11300 = func.call @stack_pop_pointer() : () -> i64
      %11301 = arith.constant 10 : i64
      %11302 = func.call @cc_box_fixnum(%11301) : (i64) -> i64
      %11303 = func.call @cc_svset(%11295, %11302, %11300) : (i64, i64, i64) -> i64
      %11304 = func.call @stack_pop_pointer() : () -> i64
      %11305 = arith.constant 9 : i64
      %11306 = func.call @cc_box_fixnum(%11305) : (i64) -> i64
      %11307 = func.call @cc_svset(%11295, %11306, %11304) : (i64, i64, i64) -> i64
      %11308 = func.call @stack_pop_pointer() : () -> i64
      %11309 = arith.constant 8 : i64
      %11310 = func.call @cc_box_fixnum(%11309) : (i64) -> i64
      %11311 = func.call @cc_svset(%11295, %11310, %11308) : (i64, i64, i64) -> i64
      %11312 = func.call @stack_pop_pointer() : () -> i64
      %11313 = arith.constant 7 : i64
      %11314 = func.call @cc_box_fixnum(%11313) : (i64) -> i64
      %11315 = func.call @cc_svset(%11295, %11314, %11312) : (i64, i64, i64) -> i64
      %11316 = func.call @stack_pop_pointer() : () -> i64
      %11317 = arith.constant 6 : i64
      %11318 = func.call @cc_box_fixnum(%11317) : (i64) -> i64
      %11319 = func.call @cc_svset(%11295, %11318, %11316) : (i64, i64, i64) -> i64
      %11320 = func.call @stack_pop_pointer() : () -> i64
      %11321 = arith.constant 5 : i64
      %11322 = func.call @cc_box_fixnum(%11321) : (i64) -> i64
      %11323 = func.call @cc_svset(%11295, %11322, %11320) : (i64, i64, i64) -> i64
      %11324 = func.call @stack_pop_pointer() : () -> i64
      %11325 = arith.constant 4 : i64
      %11326 = func.call @cc_box_fixnum(%11325) : (i64) -> i64
      %11327 = func.call @cc_svset(%11295, %11326, %11324) : (i64, i64, i64) -> i64
      %11328 = func.call @stack_pop_pointer() : () -> i64
      %11329 = arith.constant 3 : i64
      %11330 = func.call @cc_box_fixnum(%11329) : (i64) -> i64
      %11331 = func.call @cc_svset(%11295, %11330, %11328) : (i64, i64, i64) -> i64
      %11332 = func.call @stack_pop_pointer() : () -> i64
      %11333 = arith.constant 2 : i64
      %11334 = func.call @cc_box_fixnum(%11333) : (i64) -> i64
      %11335 = func.call @cc_svset(%11295, %11334, %11332) : (i64, i64, i64) -> i64
      %11336 = func.call @stack_pop_pointer() : () -> i64
      %11337 = arith.constant 1 : i64
      %11338 = func.call @cc_box_fixnum(%11337) : (i64) -> i64
      %11339 = func.call @cc_svset(%11295, %11338, %11336) : (i64, i64, i64) -> i64
      %11340 = func.call @stack_pop_pointer() : () -> i64
      %11341 = arith.constant 0 : i64
      %11342 = func.call @cc_box_fixnum(%11341) : (i64) -> i64
      %11343 = func.call @cc_svset(%11295, %11342, %11340) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%11295) : (i64) -> ()
      %11344 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%11344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11345 = func.call @stack_pop_pointer() : () -> i64
      %11346 = func.call @stack_pop_pointer() : () -> i64
      %11347 = func.call @cc_cons(%11346, %11345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
      %11348 = arith.addi %11347, %__rlasp_stack_elide_zero_520 : i64
      %11349 = func.call @stack_pop_pointer() : () -> i64
      %11350 = func.call @cc_cons(%11349, %11348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %11351 = arith.addi %11350, %__rlasp_stack_elide_zero_521 : i64
      %11352 = func.call @stack_pop_pointer() : () -> i64
      %11353 = func.call @cc_cons(%11352, %11351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11353) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11354 = func.call @stack_pop_pointer() : () -> i64
      %11355 = func.call @stack_pop_pointer() : () -> i64
      %11356 = func.call @cc_cons(%11355, %11354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
      %11357 = arith.addi %11356, %__rlasp_stack_elide_zero_522 : i64
      %11358 = func.call @stack_pop_pointer() : () -> i64
      %11359 = func.call @cc_cons(%11358, %11357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11360 = func.call @stack_pop_pointer() : () -> i64
      %11361 = func.call @stack_pop_pointer() : () -> i64
      %11362 = func.call @cc_cons(%11361, %11360) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
      %11363 = arith.addi %11362, %__rlasp_stack_elide_zero_523 : i64
      %11364 = func.call @stack_pop_pointer() : () -> i64
      %11365 = func.call @cc_cons(%11364, %11363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11366 = func.call @stack_pop_pointer() : () -> i64
      %11367 = func.call @stack_pop_pointer() : () -> i64
      %11368 = func.call @cc_cons(%11367, %11366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
      %11369 = arith.addi %11368, %__rlasp_stack_elide_zero_524 : i64
      %11370 = func.call @stack_pop_pointer() : () -> i64
      %11371 = func.call @cc_cons(%11370, %11369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %11372 = arith.addi %11371, %__rlasp_stack_elide_zero_525 : i64
      %11470 = arith.constant 15079495958564 : i64
      %11471 = arith.constant 0 : i64
      %11472 = func.call @cc_make_closure(%11470, %11471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
      %11473 = arith.addi %11472, %__rlasp_stack_elide_zero_526 : i64
      %11474 = llvm.mlir.addressof @str904 : !llvm.ptr
      %11475 = arith.constant 1 : i64
      %11476 = func.call @cc_make_string(%11474, %11475) : (!llvm.ptr, i64) -> i64
      %11477 = func.call @cc_nil_value() : () -> i64
      %11478 = func.call @cc_intern(%11476, %11477) : (i64, i64) -> i64
      %11479 = func.call @cc_nil_value() : () -> i64
      %11480 = func.call @cc_cons(%11478, %11479) : (i64, i64) -> i64
      %11481 = func.call @cc_values_pack(%11480) : (i64) -> i64
      func.call @stack_push_pointer(%11478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11482 = func.call @stack_pop_pointer() : () -> i64
      %11483 = func.call @stack_pop_pointer() : () -> i64
      %11484 = func.call @cc_cons(%11483, %11482) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
      %11485 = arith.addi %11484, %__rlasp_stack_elide_zero_527 : i64
      %11486 = llvm.mlir.addressof @str905 : !llvm.ptr
      %11487 = arith.constant 11 : i64
      %11488 = func.call @cc_make_string(%11486, %11487) : (!llvm.ptr, i64) -> i64
      %11489 = llvm.mlir.addressof @str906 : !llvm.ptr
      %11490 = arith.constant 7 : i64
      %11491 = func.call @cc_make_string(%11489, %11490) : (!llvm.ptr, i64) -> i64
      %11492 = func.call @cc_intern(%11488, %11491) : (i64, i64) -> i64
      %11493 = func.call @cc_nil_value() : () -> i64
      %11494 = func.call @cc_cons(%11492, %11493) : (i64, i64) -> i64
      %11495 = func.call @cc_values_pack(%11494) : (i64) -> i64
      %11496 = func.call @cc_nil_value() : () -> i64
      %11497 = llvm.mlir.addressof @str907 : !llvm.ptr
      %11498 = arith.constant 4 : i64
      %11499 = func.call @cc_make_string(%11497, %11498) : (!llvm.ptr, i64) -> i64
      %11500 = llvm.mlir.addressof @str908 : !llvm.ptr
      %11501 = arith.constant 7 : i64
      %11502 = func.call @cc_make_string(%11500, %11501) : (!llvm.ptr, i64) -> i64
      %11503 = func.call @cc_intern(%11499, %11502) : (i64, i64) -> i64
      %11504 = func.call @cc_nil_value() : () -> i64
      %11505 = func.call @cc_cons(%11503, %11504) : (i64, i64) -> i64
      %11506 = func.call @cc_values_pack(%11505) : (i64) -> i64
      %11507 = llvm.mlir.addressof @str909 : !llvm.ptr
      %11508 = arith.constant 6 : i64
      %11509 = func.call @cc_make_string(%11507, %11508) : (!llvm.ptr, i64) -> i64
      %11510 = func.call @cc_nil_value() : () -> i64
      %11511 = func.call @cc_intern(%11509, %11510) : (i64, i64) -> i64
      %11512 = func.call @cc_nil_value() : () -> i64
      %11513 = func.call @cc_cons(%11511, %11512) : (i64, i64) -> i64
      %11514 = func.call @cc_values_pack(%11513) : (i64) -> i64
      %__rlasp_stack_elide_zero_528 = arith.constant 0 : i64
      %11515 = arith.addi %11511, %__rlasp_stack_elide_zero_528 : i64
      %11516 = func.call @cc_nil_value() : () -> i64
      %11517 = func.call @cc_errorp(%11244) : (i64) -> i64
      %11518 = arith.cmpi ne, %11517, %11516 : i64
      %11519 = arith.cmpi eq, %11516, %11516 : i64
      %11520 = arith.andi %11518, %11519 : i1
      %11521 = scf.if %11520 -> (i64) {
        scf.yield %11244 : i64
      } else {
        scf.yield %11516 : i64
      }
      %11522 = func.call @cc_errorp(%11372) : (i64) -> i64
      %11523 = arith.cmpi ne, %11522, %11516 : i64
      %11524 = arith.cmpi eq, %11521, %11516 : i64
      %11525 = arith.andi %11523, %11524 : i1
      %11526 = scf.if %11525 -> (i64) {
        scf.yield %11372 : i64
      } else {
        scf.yield %11521 : i64
      }
      %11527 = func.call @cc_errorp(%11473) : (i64) -> i64
      %11528 = arith.cmpi ne, %11527, %11516 : i64
      %11529 = arith.cmpi eq, %11526, %11516 : i64
      %11530 = arith.andi %11528, %11529 : i1
      %11531 = scf.if %11530 -> (i64) {
        scf.yield %11473 : i64
      } else {
        scf.yield %11526 : i64
      }
      %11532 = func.call @cc_errorp(%11485) : (i64) -> i64
      %11533 = arith.cmpi ne, %11532, %11516 : i64
      %11534 = arith.cmpi eq, %11531, %11516 : i64
      %11535 = arith.andi %11533, %11534 : i1
      %11536 = scf.if %11535 -> (i64) {
        scf.yield %11485 : i64
      } else {
        scf.yield %11531 : i64
      }
      %11537 = func.call @cc_errorp(%11492) : (i64) -> i64
      %11538 = arith.cmpi ne, %11537, %11516 : i64
      %11539 = arith.cmpi eq, %11536, %11516 : i64
      %11540 = arith.andi %11538, %11539 : i1
      %11541 = scf.if %11540 -> (i64) {
        scf.yield %11492 : i64
      } else {
        scf.yield %11536 : i64
      }
      %11542 = func.call @cc_errorp(%11496) : (i64) -> i64
      %11543 = arith.cmpi ne, %11542, %11516 : i64
      %11544 = arith.cmpi eq, %11541, %11516 : i64
      %11545 = arith.andi %11543, %11544 : i1
      %11546 = scf.if %11545 -> (i64) {
        scf.yield %11496 : i64
      } else {
        scf.yield %11541 : i64
      }
      %11547 = func.call @cc_errorp(%11503) : (i64) -> i64
      %11548 = arith.cmpi ne, %11547, %11516 : i64
      %11549 = arith.cmpi eq, %11546, %11516 : i64
      %11550 = arith.andi %11548, %11549 : i1
      %11551 = scf.if %11550 -> (i64) {
        scf.yield %11503 : i64
      } else {
        scf.yield %11546 : i64
      }
      %11552 = func.call @cc_errorp(%11515) : (i64) -> i64
      %11553 = arith.cmpi ne, %11552, %11516 : i64
      %11554 = arith.cmpi eq, %11551, %11516 : i64
      %11555 = arith.andi %11553, %11554 : i1
      %11556 = scf.if %11555 -> (i64) {
        scf.yield %11515 : i64
      } else {
        scf.yield %11551 : i64
      }
      %11557 = arith.cmpi ne, %11556, %11516 : i64
      scf.if %11557 {
        func.call @stack_push_pointer(%11556) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11244) : (i64) -> ()
        func.call @stack_push_pointer(%11372) : (i64) -> ()
        func.call @stack_push_pointer(%11473) : (i64) -> ()
        func.call @stack_push_pointer(%11485) : (i64) -> ()
        func.call @stack_push_pointer(%11492) : (i64) -> ()
        func.call @stack_push_pointer(%11496) : (i64) -> ()
        func.call @stack_push_pointer(%11503) : (i64) -> ()
        func.call @stack_push_pointer(%11515) : (i64) -> ()
        %11558 = llvm.mlir.addressof @str910 : !llvm.ptr
        %11559 = func.call @cc_make_function_ref_const(%11558) : (!llvm.ptr) -> i64
        %11560 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11559, %11560) : (i64, i64) -> ()
      }
      %11561 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11561 : i64
    }
    %__rlasp_stack_elide_zero_529 = arith.constant 0 : i64
    %11562 = arith.addi %11235, %__rlasp_stack_elide_zero_529 : i64
    %11563 = func.call @cc_multiple_value_list(%11562) : (i64) -> i64
    %11564 = llvm.mlir.addressof @str911 : !llvm.ptr
    %11565 = arith.constant 37 : i64
    %11566 = func.call @cc_make_string(%11564, %11565) : (!llvm.ptr, i64) -> i64
    %11567 = func.call @cc_nil_value() : () -> i64
    %11568 = func.call @cc_intern(%11566, %11567) : (i64, i64) -> i64
    %11569 = func.call @cc_nil_value() : () -> i64
    %11570 = func.call @cc_cons(%11568, %11569) : (i64, i64) -> i64
    %11571 = func.call @cc_values_pack(%11570) : (i64) -> i64
    %11572 = func.call @cc_symbol_value(%11568) : (i64) -> i64
    %11573 = llvm.mlir.addressof @str912 : !llvm.ptr
    %11574 = arith.constant 39 : i64
    %11575 = func.call @cc_make_string(%11573, %11574) : (!llvm.ptr, i64) -> i64
    %11576 = func.call @cc_nil_value() : () -> i64
    %11577 = func.call @cc_intern(%11575, %11576) : (i64, i64) -> i64
    %11578 = func.call @cc_nil_value() : () -> i64
    %11579 = func.call @cc_cons(%11577, %11578) : (i64, i64) -> i64
    %11580 = func.call @cc_values_pack(%11579) : (i64) -> i64
    %11581 = func.call @cc_symbol_value(%11577) : (i64) -> i64
    %11582 = func.call @cc_nil_value() : () -> i64
    %11583 = arith.cmpi ne, %11572, %11582 : i64
    %11584 = scf.if %11583 -> (i64) {
      scf.yield %11581 : i64
    } else {
      scf.yield %11563 : i64
    }
    %11585 = func.call @cc_values_pack(%11584) : (i64) -> i64
    func.call @stack_push_pointer(%11585) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958529"() {
    %140 = func.call @cc_nil_value() : () -> i64
    %141 = func.call @cc_nil_value() : () -> i64
    %142 = func.call @cc_errorp(%140) : (i64) -> i64
    %143 = arith.cmpi ne, %142, %141 : i64
    %144 = scf.if %143 -> (i64) {
      scf.yield %140 : i64
    } else {
      %145 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%145) : (i64) -> ()
      %146 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @cc_cons(%148, %147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_530 = arith.constant 0 : i64
      %150 = arith.addi %149, %__rlasp_stack_elide_zero_530 : i64
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @cc_cons(%151, %150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_531 = arith.constant 0 : i64
      %153 = arith.addi %152, %__rlasp_stack_elide_zero_531 : i64
      %154 = llvm.mlir.addressof @str13 : !llvm.ptr
      %155 = arith.constant 12 : i64
      %156 = func.call @cc_make_string(%154, %155) : (!llvm.ptr, i64) -> i64
      %157 = llvm.mlir.addressof @str14 : !llvm.ptr
      %158 = arith.constant 7 : i64
      %159 = func.call @cc_make_string(%157, %158) : (!llvm.ptr, i64) -> i64
      %160 = func.call @cc_intern(%156, %159) : (i64, i64) -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_cons(%160, %161) : (i64, i64) -> i64
      %163 = func.call @cc_values_pack(%162) : (i64) -> i64
      %164 = func.call @cc_t_value() : () -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      %166 = func.call @cc_errorp(%153) : (i64) -> i64
      %167 = arith.cmpi ne, %166, %165 : i64
      %168 = arith.cmpi eq, %165, %165 : i64
      %169 = arith.andi %167, %168 : i1
      %170 = scf.if %169 -> (i64) {
        scf.yield %153 : i64
      } else {
        scf.yield %165 : i64
      }
      %171 = func.call @cc_errorp(%160) : (i64) -> i64
      %172 = arith.cmpi ne, %171, %165 : i64
      %173 = arith.cmpi eq, %170, %165 : i64
      %174 = arith.andi %172, %173 : i1
      %175 = scf.if %174 -> (i64) {
        scf.yield %160 : i64
      } else {
        scf.yield %170 : i64
      }
      %176 = func.call @cc_errorp(%164) : (i64) -> i64
      %177 = arith.cmpi ne, %176, %165 : i64
      %178 = arith.cmpi eq, %175, %165 : i64
      %179 = arith.andi %177, %178 : i1
      %180 = scf.if %179 -> (i64) {
        scf.yield %164 : i64
      } else {
        scf.yield %175 : i64
      }
      %181 = arith.cmpi ne, %180, %165 : i64
      scf.if %181 {
        func.call @stack_push_pointer(%180) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%153) : (i64) -> ()
        func.call @stack_push_pointer(%160) : (i64) -> ()
        func.call @stack_push_pointer(%164) : (i64) -> ()
        %182 = llvm.mlir.addressof @str15 : !llvm.ptr
        %183 = func.call @cc_make_function_ref_const(%182) : (!llvm.ptr) -> i64
        %184 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%183, %184) : (i64, i64) -> ()
      }
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = arith.constant 0 : i64
      %187 = func.call @cc_box_fixnum(%186) : (i64) -> i64
      %188 = func.call @cc_nil_value() : () -> i64
      %189 = func.call @cc_errorp(%185) : (i64) -> i64
      %190 = arith.cmpi ne, %189, %188 : i64
      %191 = arith.cmpi eq, %188, %188 : i64
      %192 = arith.andi %190, %191 : i1
      %193 = scf.if %192 -> (i64) {
        scf.yield %185 : i64
      } else {
        scf.yield %188 : i64
      }
      %194 = func.call @cc_errorp(%187) : (i64) -> i64
      %195 = arith.cmpi ne, %194, %188 : i64
      %196 = arith.cmpi eq, %193, %188 : i64
      %197 = arith.andi %195, %196 : i1
      %198 = scf.if %197 -> (i64) {
        scf.yield %187 : i64
      } else {
        scf.yield %193 : i64
      }
      %199 = arith.cmpi ne, %198, %188 : i64
      scf.if %199 {
        func.call @stack_push_pointer(%198) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%185) : (i64) -> ()
        func.call @stack_push_pointer(%187) : (i64) -> ()
        %200 = llvm.mlir.addressof @str16 : !llvm.ptr
        %201 = func.call @cc_make_function_ref_const(%200) : (!llvm.ptr) -> i64
        %202 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%201, %202) : (i64, i64) -> ()
      }
      %203 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %203 : i64
    }
    func.call @stack_push_pointer(%144) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958530"() {
    %455 = func.call @cc_nil_value() : () -> i64
    %456 = func.call @cc_nil_value() : () -> i64
    %457 = func.call @cc_errorp(%455) : (i64) -> i64
    %458 = arith.cmpi ne, %457, %456 : i64
    %459 = scf.if %458 -> (i64) {
      scf.yield %455 : i64
    } else {
      %460 = llvm.mlir.addressof @str40 : !llvm.ptr
      %461 = arith.constant 13 : i64
      %462 = func.call @cc_make_string(%460, %461) : (!llvm.ptr, i64) -> i64
      %463 = llvm.mlir.addressof @str41 : !llvm.ptr
      %464 = arith.constant 11 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = func.call @cc_intern(%462, %465) : (i64, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_cons(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_values_pack(%468) : (i64) -> i64
      %__rlasp_stack_elide_zero_532 = arith.constant 0 : i64
      %470 = arith.addi %466, %__rlasp_stack_elide_zero_532 : i64
      %471 = arith.constant 10 : i64
      %472 = func.call @cc_box_fixnum(%471) : (i64) -> i64
      %473 = func.call @cc_nil_value() : () -> i64
      %474 = func.call @cc_errorp(%470) : (i64) -> i64
      %475 = arith.cmpi ne, %474, %473 : i64
      %476 = arith.cmpi eq, %473, %473 : i64
      %477 = arith.andi %475, %476 : i1
      %478 = scf.if %477 -> (i64) {
        scf.yield %470 : i64
      } else {
        scf.yield %473 : i64
      }
      %479 = func.call @cc_errorp(%472) : (i64) -> i64
      %480 = arith.cmpi ne, %479, %473 : i64
      %481 = arith.cmpi eq, %478, %473 : i64
      %482 = arith.andi %480, %481 : i1
      %483 = scf.if %482 -> (i64) {
        scf.yield %472 : i64
      } else {
        scf.yield %478 : i64
      }
      %484 = arith.cmpi ne, %483, %473 : i64
      scf.if %484 {
        func.call @stack_push_pointer(%483) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%470) : (i64) -> ()
        func.call @stack_push_pointer(%472) : (i64) -> ()
        %485 = llvm.mlir.addressof @str42 : !llvm.ptr
        %486 = func.call @cc_make_function_ref_const(%485) : (!llvm.ptr) -> i64
        %487 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%486, %487) : (i64, i64) -> ()
      }
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @cc_type_of(%488) : (i64) -> i64
      func.call @stack_push_pointer(%489) : (i64) -> ()
      %490 = llvm.mlir.addressof @str43 : !llvm.ptr
      %491 = arith.constant 12 : i64
      %492 = func.call @cc_make_string(%490, %491) : (!llvm.ptr, i64) -> i64
      %493 = llvm.mlir.addressof @str44 : !llvm.ptr
      %494 = arith.constant 11 : i64
      %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
      %496 = func.call @cc_intern(%492, %495) : (i64, i64) -> i64
      %497 = func.call @cc_nil_value() : () -> i64
      %498 = func.call @cc_cons(%496, %497) : (i64, i64) -> i64
      %499 = func.call @cc_values_pack(%498) : (i64) -> i64
      func.call @stack_push_pointer(%496) : (i64) -> ()
      %500 = llvm.mlir.addressof @str45 : !llvm.ptr
      %501 = arith.constant 9 : i64
      %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
      %503 = llvm.mlir.addressof @str46 : !llvm.ptr
      %504 = arith.constant 11 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = func.call @cc_intern(%502, %505) : (i64, i64) -> i64
      %507 = func.call @cc_nil_value() : () -> i64
      %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
      %509 = func.call @cc_values_pack(%508) : (i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %510 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @stack_pop_pointer() : () -> i64
      %513 = func.call @cc_cons(%512, %511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %514 = func.call @stack_pop_pointer() : () -> i64
      %515 = func.call @stack_pop_pointer() : () -> i64
      %516 = func.call @cc_cons(%515, %514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_533 = arith.constant 0 : i64
      %517 = arith.addi %516, %__rlasp_stack_elide_zero_533 : i64
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = func.call @cc_cons(%518, %517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_534 = arith.constant 0 : i64
      %520 = arith.addi %519, %__rlasp_stack_elide_zero_534 : i64
      %521 = func.call @stack_pop_pointer() : () -> i64
      %522 = func.call @cc_cons(%521, %520) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_535 = arith.constant 0 : i64
      %523 = arith.addi %522, %__rlasp_stack_elide_zero_535 : i64
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @cc_subtypep(%524, %523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_536 = arith.constant 0 : i64
      %526 = arith.addi %525, %__rlasp_stack_elide_zero_536 : i64
      %527 = func.call @cc_nil_value() : () -> i64
      %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
      %529 = func.call @cc_not(%528) : (i64) -> i64
      %__rlasp_stack_elide_zero_537 = arith.constant 0 : i64
      %530 = arith.addi %529, %__rlasp_stack_elide_zero_537 : i64
      %531 = func.call @cc_nil_value() : () -> i64
      %532 = func.call @cc_cons(%530, %531) : (i64, i64) -> i64
      %533 = func.call @cc_not(%532) : (i64) -> i64
      %__rlasp_stack_elide_zero_538 = arith.constant 0 : i64
      %534 = arith.addi %533, %__rlasp_stack_elide_zero_538 : i64
      scf.yield %534 : i64
    }
    func.call @stack_push_pointer(%459) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958531"() {
    %793 = func.call @cc_nil_value() : () -> i64
    %794 = func.call @cc_nil_value() : () -> i64
    %795 = func.call @cc_errorp(%793) : (i64) -> i64
    %796 = arith.cmpi ne, %795, %794 : i64
    %797 = scf.if %796 -> (i64) {
      scf.yield %793 : i64
    } else {
      %798 = llvm.mlir.addressof @str71 : !llvm.ptr
      %799 = arith.constant 18 : i64
      %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
      %801 = llvm.mlir.addressof @str72 : !llvm.ptr
      %802 = arith.constant 11 : i64
      %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
      %804 = func.call @cc_intern(%800, %803) : (i64, i64) -> i64
      %805 = func.call @cc_nil_value() : () -> i64
      %806 = func.call @cc_cons(%804, %805) : (i64, i64) -> i64
      %807 = func.call @cc_values_pack(%806) : (i64) -> i64
      %__rlasp_stack_elide_zero_539 = arith.constant 0 : i64
      %808 = arith.addi %804, %__rlasp_stack_elide_zero_539 : i64
      %809 = arith.constant 10 : i64
      %810 = func.call @cc_box_fixnum(%809) : (i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_errorp(%808) : (i64) -> i64
      %813 = arith.cmpi ne, %812, %811 : i64
      %814 = arith.cmpi eq, %811, %811 : i64
      %815 = arith.andi %813, %814 : i1
      %816 = scf.if %815 -> (i64) {
        scf.yield %808 : i64
      } else {
        scf.yield %811 : i64
      }
      %817 = func.call @cc_errorp(%810) : (i64) -> i64
      %818 = arith.cmpi ne, %817, %811 : i64
      %819 = arith.cmpi eq, %816, %811 : i64
      %820 = arith.andi %818, %819 : i1
      %821 = scf.if %820 -> (i64) {
        scf.yield %810 : i64
      } else {
        scf.yield %816 : i64
      }
      %822 = arith.cmpi ne, %821, %811 : i64
      scf.if %822 {
        func.call @stack_push_pointer(%821) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%808) : (i64) -> ()
        func.call @stack_push_pointer(%810) : (i64) -> ()
        %823 = llvm.mlir.addressof @str73 : !llvm.ptr
        %824 = func.call @cc_make_function_ref_const(%823) : (!llvm.ptr) -> i64
        %825 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%824, %825) : (i64, i64) -> ()
      }
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = func.call @cc_type_of(%826) : (i64) -> i64
      func.call @stack_push_pointer(%827) : (i64) -> ()
      %828 = llvm.mlir.addressof @str74 : !llvm.ptr
      %829 = arith.constant 12 : i64
      %830 = func.call @cc_make_string(%828, %829) : (!llvm.ptr, i64) -> i64
      %831 = llvm.mlir.addressof @str75 : !llvm.ptr
      %832 = arith.constant 11 : i64
      %833 = func.call @cc_make_string(%831, %832) : (!llvm.ptr, i64) -> i64
      %834 = func.call @cc_intern(%830, %833) : (i64, i64) -> i64
      %835 = func.call @cc_nil_value() : () -> i64
      %836 = func.call @cc_cons(%834, %835) : (i64, i64) -> i64
      %837 = func.call @cc_values_pack(%836) : (i64) -> i64
      func.call @stack_push_pointer(%834) : (i64) -> ()
      %838 = llvm.mlir.addressof @str76 : !llvm.ptr
      %839 = arith.constant 9 : i64
      %840 = func.call @cc_make_string(%838, %839) : (!llvm.ptr, i64) -> i64
      %841 = llvm.mlir.addressof @str77 : !llvm.ptr
      %842 = arith.constant 11 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = func.call @cc_intern(%840, %843) : (i64, i64) -> i64
      %845 = func.call @cc_nil_value() : () -> i64
      %846 = func.call @cc_cons(%844, %845) : (i64, i64) -> i64
      %847 = func.call @cc_values_pack(%846) : (i64) -> i64
      func.call @stack_push_pointer(%844) : (i64) -> ()
      %848 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%848) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_cons(%850, %849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%851) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %852 = func.call @stack_pop_pointer() : () -> i64
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @cc_cons(%853, %852) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_540 = arith.constant 0 : i64
      %855 = arith.addi %854, %__rlasp_stack_elide_zero_540 : i64
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @cc_cons(%856, %855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_541 = arith.constant 0 : i64
      %858 = arith.addi %857, %__rlasp_stack_elide_zero_541 : i64
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @cc_cons(%859, %858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_542 = arith.constant 0 : i64
      %861 = arith.addi %860, %__rlasp_stack_elide_zero_542 : i64
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @cc_subtypep(%862, %861) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_543 = arith.constant 0 : i64
      %864 = arith.addi %863, %__rlasp_stack_elide_zero_543 : i64
      %865 = func.call @cc_nil_value() : () -> i64
      %866 = func.call @cc_cons(%864, %865) : (i64, i64) -> i64
      %867 = func.call @cc_not(%866) : (i64) -> i64
      %__rlasp_stack_elide_zero_544 = arith.constant 0 : i64
      %868 = arith.addi %867, %__rlasp_stack_elide_zero_544 : i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_cons(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_not(%870) : (i64) -> i64
      %__rlasp_stack_elide_zero_545 = arith.constant 0 : i64
      %872 = arith.addi %871, %__rlasp_stack_elide_zero_545 : i64
      scf.yield %872 : i64
    }
    func.call @stack_push_pointer(%797) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958532"() {
    %1030 = func.call @cc_nil_value() : () -> i64
    %1031 = func.call @cc_nil_value() : () -> i64
    %1032 = func.call @cc_errorp(%1030) : (i64) -> i64
    %1033 = arith.cmpi ne, %1032, %1031 : i64
    %1034 = scf.if %1033 -> (i64) {
      scf.yield %1030 : i64
    } else {
      %1035 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1035) : (i64) -> ()
      %1036 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = func.call @cc_cons(%1038, %1037) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_546 = arith.constant 0 : i64
      %1040 = arith.addi %1039, %__rlasp_stack_elide_zero_546 : i64
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = func.call @cc_cons(%1041, %1040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_547 = arith.constant 0 : i64
      %1043 = arith.addi %1042, %__rlasp_stack_elide_zero_547 : i64
      %1044 = func.call @cc_nil_value() : () -> i64
      %1045 = func.call @cc_errorp(%1043) : (i64) -> i64
      %1046 = arith.cmpi ne, %1045, %1044 : i64
      %1047 = arith.cmpi eq, %1044, %1044 : i64
      %1048 = arith.andi %1046, %1047 : i1
      %1049 = scf.if %1048 -> (i64) {
        scf.yield %1043 : i64
      } else {
        scf.yield %1044 : i64
      }
      %1050 = arith.cmpi ne, %1049, %1044 : i64
      scf.if %1050 {
        func.call @stack_push_pointer(%1049) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1043) : (i64) -> ()
        %1051 = llvm.mlir.addressof @str90 : !llvm.ptr
        %1052 = func.call @cc_make_function_ref_const(%1051) : (!llvm.ptr) -> i64
        %1053 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1052, %1053) : (i64, i64) -> ()
      }
      %1054 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = func.call @cc_cons(%1054, %1055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_548 = arith.constant 0 : i64
      %1057 = arith.addi %1056, %__rlasp_stack_elide_zero_548 : i64
      %1058 = func.call @cc_values_pack(%1057) : (i64) -> i64
      %__rlasp_stack_elide_zero_549 = arith.constant 0 : i64
      %1059 = arith.addi %1058, %__rlasp_stack_elide_zero_549 : i64
      scf.yield %1059 : i64
    }
    func.call @stack_push_pointer(%1034) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958533"() {
    %1216 = func.call @cc_nil_value() : () -> i64
    %1217 = func.call @cc_nil_value() : () -> i64
    %1218 = func.call @cc_errorp(%1216) : (i64) -> i64
    %1219 = arith.cmpi ne, %1218, %1217 : i64
    %1220 = scf.if %1219 -> (i64) {
      scf.yield %1216 : i64
    } else {
      %1221 = arith.constant 10 : i64
      %1222 = func.call @cc_box_fixnum(%1221) : (i64) -> i64
      %1223 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1224 = arith.constant 12 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1227 = arith.constant 7 : i64
      %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
      %1229 = func.call @cc_intern(%1225, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = func.call @cc_cons(%1229, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_values_pack(%1231) : (i64) -> i64
      %1233 = arith.constant 3 : i64
      %1234 = func.call @cc_box_fixnum(%1233) : (i64) -> i64
      %1235 = func.call @cc_nil_value() : () -> i64
      %1236 = func.call @cc_errorp(%1222) : (i64) -> i64
      %1237 = arith.cmpi ne, %1236, %1235 : i64
      %1238 = arith.cmpi eq, %1235, %1235 : i64
      %1239 = arith.andi %1237, %1238 : i1
      %1240 = scf.if %1239 -> (i64) {
        scf.yield %1222 : i64
      } else {
        scf.yield %1235 : i64
      }
      %1241 = func.call @cc_errorp(%1229) : (i64) -> i64
      %1242 = arith.cmpi ne, %1241, %1235 : i64
      %1243 = arith.cmpi eq, %1240, %1235 : i64
      %1244 = arith.andi %1242, %1243 : i1
      %1245 = scf.if %1244 -> (i64) {
        scf.yield %1229 : i64
      } else {
        scf.yield %1240 : i64
      }
      %1246 = func.call @cc_errorp(%1234) : (i64) -> i64
      %1247 = arith.cmpi ne, %1246, %1235 : i64
      %1248 = arith.cmpi eq, %1245, %1235 : i64
      %1249 = arith.andi %1247, %1248 : i1
      %1250 = scf.if %1249 -> (i64) {
        scf.yield %1234 : i64
      } else {
        scf.yield %1245 : i64
      }
      %1251 = arith.cmpi ne, %1250, %1235 : i64
      scf.if %1251 {
        func.call @stack_push_pointer(%1250) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1222) : (i64) -> ()
        func.call @stack_push_pointer(%1229) : (i64) -> ()
        func.call @stack_push_pointer(%1234) : (i64) -> ()
        %1252 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1253 = func.call @cc_make_function_ref_const(%1252) : (!llvm.ptr) -> i64
        %1254 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1253, %1254) : (i64, i64) -> ()
      }
      %1255 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_550 = arith.constant 0 : i64
      %1258 = arith.addi %1257, %__rlasp_stack_elide_zero_550 : i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      %__rlasp_stack_elide_zero_551 = arith.constant 0 : i64
      %1260 = arith.addi %1259, %__rlasp_stack_elide_zero_551 : i64
      scf.yield %1260 : i64
    }
    func.call @stack_push_pointer(%1220) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958534"() {
    %1433 = func.call @cc_nil_value() : () -> i64
    %1434 = func.call @cc_nil_value() : () -> i64
    %1435 = func.call @cc_errorp(%1433) : (i64) -> i64
    %1436 = arith.cmpi ne, %1435, %1434 : i64
    %1437 = scf.if %1436 -> (i64) {
      scf.yield %1433 : i64
    } else {
      %1438 = arith.constant 10 : i64
      %1439 = func.call @cc_box_fixnum(%1438) : (i64) -> i64
      %1440 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1441 = arith.constant 12 : i64
      %1442 = func.call @cc_make_string(%1440, %1441) : (!llvm.ptr, i64) -> i64
      %1443 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1444 = arith.constant 7 : i64
      %1445 = func.call @cc_make_string(%1443, %1444) : (!llvm.ptr, i64) -> i64
      %1446 = func.call @cc_intern(%1442, %1445) : (i64, i64) -> i64
      %1447 = func.call @cc_nil_value() : () -> i64
      %1448 = func.call @cc_cons(%1446, %1447) : (i64, i64) -> i64
      %1449 = func.call @cc_values_pack(%1448) : (i64) -> i64
      %1450 = arith.constant 3 : i64
      %1451 = func.call @cc_box_fixnum(%1450) : (i64) -> i64
      %1452 = func.call @cc_nil_value() : () -> i64
      %1453 = func.call @cc_errorp(%1439) : (i64) -> i64
      %1454 = arith.cmpi ne, %1453, %1452 : i64
      %1455 = arith.cmpi eq, %1452, %1452 : i64
      %1456 = arith.andi %1454, %1455 : i1
      %1457 = scf.if %1456 -> (i64) {
        scf.yield %1439 : i64
      } else {
        scf.yield %1452 : i64
      }
      %1458 = func.call @cc_errorp(%1446) : (i64) -> i64
      %1459 = arith.cmpi ne, %1458, %1452 : i64
      %1460 = arith.cmpi eq, %1457, %1452 : i64
      %1461 = arith.andi %1459, %1460 : i1
      %1462 = scf.if %1461 -> (i64) {
        scf.yield %1446 : i64
      } else {
        scf.yield %1457 : i64
      }
      %1463 = func.call @cc_errorp(%1451) : (i64) -> i64
      %1464 = arith.cmpi ne, %1463, %1452 : i64
      %1465 = arith.cmpi eq, %1462, %1452 : i64
      %1466 = arith.andi %1464, %1465 : i1
      %1467 = scf.if %1466 -> (i64) {
        scf.yield %1451 : i64
      } else {
        scf.yield %1462 : i64
      }
      %1468 = arith.cmpi ne, %1467, %1452 : i64
      scf.if %1468 {
        func.call @stack_push_pointer(%1467) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1439) : (i64) -> ()
        func.call @stack_push_pointer(%1446) : (i64) -> ()
        func.call @stack_push_pointer(%1451) : (i64) -> ()
        %1469 = llvm.mlir.addressof @str126 : !llvm.ptr
        %1470 = func.call @cc_make_function_ref_const(%1469) : (!llvm.ptr) -> i64
        %1471 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1470, %1471) : (i64, i64) -> ()
      }
      %1472 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1473 = func.call @stack_pop_pointer() : () -> i64
      %1474 = func.call @cc_cons(%1472, %1473) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_552 = arith.constant 0 : i64
      %1475 = arith.addi %1474, %__rlasp_stack_elide_zero_552 : i64
      %1476 = func.call @cc_values_pack(%1475) : (i64) -> i64
      %__rlasp_stack_elide_zero_553 = arith.constant 0 : i64
      %1477 = arith.addi %1476, %__rlasp_stack_elide_zero_553 : i64
      scf.yield %1477 : i64
    }
    func.call @stack_push_pointer(%1437) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958535"() {
    %1670 = func.call @cc_nil_value() : () -> i64
    %1671 = func.call @cc_nil_value() : () -> i64
    %1672 = func.call @cc_errorp(%1670) : (i64) -> i64
    %1673 = arith.cmpi ne, %1672, %1671 : i64
    %1674 = scf.if %1673 -> (i64) {
      scf.yield %1670 : i64
    } else {
      %1675 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1675) : (i64) -> ()
      %1676 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1677 = func.call @stack_pop_pointer() : () -> i64
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_cons(%1678, %1677) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_554 = arith.constant 0 : i64
      %1680 = arith.addi %1679, %__rlasp_stack_elide_zero_554 : i64
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @cc_cons(%1681, %1680) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_555 = arith.constant 0 : i64
      %1683 = arith.addi %1682, %__rlasp_stack_elide_zero_555 : i64
      %1684 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1685 = arith.constant 10 : i64
      %1686 = func.call @cc_make_string(%1684, %1685) : (!llvm.ptr, i64) -> i64
      %1687 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1688 = arith.constant 7 : i64
      %1689 = func.call @cc_make_string(%1687, %1688) : (!llvm.ptr, i64) -> i64
      %1690 = func.call @cc_intern(%1686, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_nil_value() : () -> i64
      %1692 = func.call @cc_cons(%1690, %1691) : (i64, i64) -> i64
      %1693 = func.call @cc_values_pack(%1692) : (i64) -> i64
      %1694 = func.call @cc_t_value() : () -> i64
      %1695 = func.call @cc_nil_value() : () -> i64
      %1696 = func.call @cc_errorp(%1683) : (i64) -> i64
      %1697 = arith.cmpi ne, %1696, %1695 : i64
      %1698 = arith.cmpi eq, %1695, %1695 : i64
      %1699 = arith.andi %1697, %1698 : i1
      %1700 = scf.if %1699 -> (i64) {
        scf.yield %1683 : i64
      } else {
        scf.yield %1695 : i64
      }
      %1701 = func.call @cc_errorp(%1690) : (i64) -> i64
      %1702 = arith.cmpi ne, %1701, %1695 : i64
      %1703 = arith.cmpi eq, %1700, %1695 : i64
      %1704 = arith.andi %1702, %1703 : i1
      %1705 = scf.if %1704 -> (i64) {
        scf.yield %1690 : i64
      } else {
        scf.yield %1700 : i64
      }
      %1706 = func.call @cc_errorp(%1694) : (i64) -> i64
      %1707 = arith.cmpi ne, %1706, %1695 : i64
      %1708 = arith.cmpi eq, %1705, %1695 : i64
      %1709 = arith.andi %1707, %1708 : i1
      %1710 = scf.if %1709 -> (i64) {
        scf.yield %1694 : i64
      } else {
        scf.yield %1705 : i64
      }
      %1711 = arith.cmpi ne, %1710, %1695 : i64
      scf.if %1711 {
        func.call @stack_push_pointer(%1710) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1683) : (i64) -> ()
        func.call @stack_push_pointer(%1690) : (i64) -> ()
        func.call @stack_push_pointer(%1694) : (i64) -> ()
        %1712 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1713 = func.call @cc_make_function_ref_const(%1712) : (!llvm.ptr) -> i64
        %1714 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1713, %1714) : (i64, i64) -> ()
      }
      %1715 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = func.call @cc_cons(%1715, %1716) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_556 = arith.constant 0 : i64
      %1718 = arith.addi %1717, %__rlasp_stack_elide_zero_556 : i64
      %1719 = func.call @cc_values_pack(%1718) : (i64) -> i64
      %__rlasp_stack_elide_zero_557 = arith.constant 0 : i64
      %1720 = arith.addi %1719, %__rlasp_stack_elide_zero_557 : i64
      scf.yield %1720 : i64
    }
    func.call @stack_push_pointer(%1674) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958536"() {
    %1897 = func.call @cc_nil_value() : () -> i64
    %1898 = func.call @cc_nil_value() : () -> i64
    %1899 = func.call @cc_errorp(%1897) : (i64) -> i64
    %1900 = arith.cmpi ne, %1899, %1898 : i64
    %1901 = scf.if %1900 -> (i64) {
      scf.yield %1897 : i64
    } else {
      %1902 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1902) : (i64) -> ()
      %1903 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1903) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1904 = func.call @stack_pop_pointer() : () -> i64
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @cc_cons(%1905, %1904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_558 = arith.constant 0 : i64
      %1907 = arith.addi %1906, %__rlasp_stack_elide_zero_558 : i64
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @cc_cons(%1908, %1907) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_559 = arith.constant 0 : i64
      %1910 = arith.addi %1909, %__rlasp_stack_elide_zero_559 : i64
      %1911 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1912 = arith.constant 10 : i64
      %1913 = func.call @cc_make_string(%1911, %1912) : (!llvm.ptr, i64) -> i64
      %1914 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1915 = arith.constant 7 : i64
      %1916 = func.call @cc_make_string(%1914, %1915) : (!llvm.ptr, i64) -> i64
      %1917 = func.call @cc_intern(%1913, %1916) : (i64, i64) -> i64
      %1918 = func.call @cc_nil_value() : () -> i64
      %1919 = func.call @cc_cons(%1917, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_values_pack(%1919) : (i64) -> i64
      %1921 = func.call @cc_t_value() : () -> i64
      %1922 = func.call @cc_nil_value() : () -> i64
      %1923 = func.call @cc_errorp(%1910) : (i64) -> i64
      %1924 = arith.cmpi ne, %1923, %1922 : i64
      %1925 = arith.cmpi eq, %1922, %1922 : i64
      %1926 = arith.andi %1924, %1925 : i1
      %1927 = scf.if %1926 -> (i64) {
        scf.yield %1910 : i64
      } else {
        scf.yield %1922 : i64
      }
      %1928 = func.call @cc_errorp(%1917) : (i64) -> i64
      %1929 = arith.cmpi ne, %1928, %1922 : i64
      %1930 = arith.cmpi eq, %1927, %1922 : i64
      %1931 = arith.andi %1929, %1930 : i1
      %1932 = scf.if %1931 -> (i64) {
        scf.yield %1917 : i64
      } else {
        scf.yield %1927 : i64
      }
      %1933 = func.call @cc_errorp(%1921) : (i64) -> i64
      %1934 = arith.cmpi ne, %1933, %1922 : i64
      %1935 = arith.cmpi eq, %1932, %1922 : i64
      %1936 = arith.andi %1934, %1935 : i1
      %1937 = scf.if %1936 -> (i64) {
        scf.yield %1921 : i64
      } else {
        scf.yield %1932 : i64
      }
      %1938 = arith.cmpi ne, %1937, %1922 : i64
      scf.if %1938 {
        func.call @stack_push_pointer(%1937) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1910) : (i64) -> ()
        func.call @stack_push_pointer(%1917) : (i64) -> ()
        func.call @stack_push_pointer(%1921) : (i64) -> ()
        %1939 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1940 = func.call @cc_make_function_ref_const(%1939) : (!llvm.ptr) -> i64
        %1941 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1940, %1941) : (i64, i64) -> ()
      }
      %1942 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1942, %1943) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_560 = arith.constant 0 : i64
      %1945 = arith.addi %1944, %__rlasp_stack_elide_zero_560 : i64
      %1946 = func.call @cc_values_pack(%1945) : (i64) -> i64
      %__rlasp_stack_elide_zero_561 = arith.constant 0 : i64
      %1947 = arith.addi %1946, %__rlasp_stack_elide_zero_561 : i64
      scf.yield %1947 : i64
    }
    func.call @stack_push_pointer(%1901) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958537"() {
    %2140 = func.call @cc_nil_value() : () -> i64
    %2141 = func.call @cc_nil_value() : () -> i64
    %2142 = func.call @cc_errorp(%2140) : (i64) -> i64
    %2143 = arith.cmpi ne, %2142, %2141 : i64
    %2144 = scf.if %2143 -> (i64) {
      scf.yield %2140 : i64
    } else {
      %2145 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2145) : (i64) -> ()
      %2146 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2147 = func.call @stack_pop_pointer() : () -> i64
      %2148 = func.call @stack_pop_pointer() : () -> i64
      %2149 = func.call @cc_cons(%2148, %2147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_562 = arith.constant 0 : i64
      %2150 = arith.addi %2149, %__rlasp_stack_elide_zero_562 : i64
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @cc_cons(%2151, %2150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_563 = arith.constant 0 : i64
      %2153 = arith.addi %2152, %__rlasp_stack_elide_zero_563 : i64
      %2154 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2155 = arith.constant 10 : i64
      %2156 = func.call @cc_make_string(%2154, %2155) : (!llvm.ptr, i64) -> i64
      %2157 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2158 = arith.constant 7 : i64
      %2159 = func.call @cc_make_string(%2157, %2158) : (!llvm.ptr, i64) -> i64
      %2160 = func.call @cc_intern(%2156, %2159) : (i64, i64) -> i64
      %2161 = func.call @cc_nil_value() : () -> i64
      %2162 = func.call @cc_cons(%2160, %2161) : (i64, i64) -> i64
      %2163 = func.call @cc_values_pack(%2162) : (i64) -> i64
      %2164 = func.call @cc_t_value() : () -> i64
      %2165 = func.call @cc_nil_value() : () -> i64
      %2166 = func.call @cc_errorp(%2153) : (i64) -> i64
      %2167 = arith.cmpi ne, %2166, %2165 : i64
      %2168 = arith.cmpi eq, %2165, %2165 : i64
      %2169 = arith.andi %2167, %2168 : i1
      %2170 = scf.if %2169 -> (i64) {
        scf.yield %2153 : i64
      } else {
        scf.yield %2165 : i64
      }
      %2171 = func.call @cc_errorp(%2160) : (i64) -> i64
      %2172 = arith.cmpi ne, %2171, %2165 : i64
      %2173 = arith.cmpi eq, %2170, %2165 : i64
      %2174 = arith.andi %2172, %2173 : i1
      %2175 = scf.if %2174 -> (i64) {
        scf.yield %2160 : i64
      } else {
        scf.yield %2170 : i64
      }
      %2176 = func.call @cc_errorp(%2164) : (i64) -> i64
      %2177 = arith.cmpi ne, %2176, %2165 : i64
      %2178 = arith.cmpi eq, %2175, %2165 : i64
      %2179 = arith.andi %2177, %2178 : i1
      %2180 = scf.if %2179 -> (i64) {
        scf.yield %2164 : i64
      } else {
        scf.yield %2175 : i64
      }
      %2181 = arith.cmpi ne, %2180, %2165 : i64
      scf.if %2181 {
        func.call @stack_push_pointer(%2180) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2153) : (i64) -> ()
        func.call @stack_push_pointer(%2160) : (i64) -> ()
        func.call @stack_push_pointer(%2164) : (i64) -> ()
        %2182 = llvm.mlir.addressof @str184 : !llvm.ptr
        %2183 = func.call @cc_make_function_ref_const(%2182) : (!llvm.ptr) -> i64
        %2184 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2183, %2184) : (i64, i64) -> ()
      }
      %2185 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2186 = func.call @stack_pop_pointer() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_564 = arith.constant 0 : i64
      %2188 = arith.addi %2187, %__rlasp_stack_elide_zero_564 : i64
      %2189 = func.call @cc_values_pack(%2188) : (i64) -> i64
      %__rlasp_stack_elide_zero_565 = arith.constant 0 : i64
      %2190 = arith.addi %2189, %__rlasp_stack_elide_zero_565 : i64
      scf.yield %2190 : i64
    }
    func.call @stack_push_pointer(%2144) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958538"() {
    %2433 = func.call @cc_nil_value() : () -> i64
    %2434 = func.call @cc_nil_value() : () -> i64
    %2435 = func.call @cc_errorp(%2433) : (i64) -> i64
    %2436 = arith.cmpi ne, %2435, %2434 : i64
    %2437 = scf.if %2436 -> (i64) {
      scf.yield %2433 : i64
    } else {
      %2438 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2438) : (i64) -> ()
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2440) : (i64) -> ()
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @cc_nil_value() : () -> i64
      %2443 = func.call @cc_errorp(%2439) : (i64) -> i64
      %2444 = arith.cmpi ne, %2443, %2442 : i64
      %2445 = arith.cmpi eq, %2442, %2442 : i64
      %2446 = arith.andi %2444, %2445 : i1
      %2447 = scf.if %2446 -> (i64) {
        scf.yield %2439 : i64
      } else {
        scf.yield %2442 : i64
      }
      %2448 = func.call @cc_errorp(%2441) : (i64) -> i64
      %2449 = arith.cmpi ne, %2448, %2442 : i64
      %2450 = arith.cmpi eq, %2447, %2442 : i64
      %2451 = arith.andi %2449, %2450 : i1
      %2452 = scf.if %2451 -> (i64) {
        scf.yield %2441 : i64
      } else {
        scf.yield %2447 : i64
      }
      %2453 = arith.cmpi ne, %2452, %2442 : i64
      scf.if %2453 {
        func.call @stack_push_pointer(%2452) : (i64) -> ()
      } else {
        %2454 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2454) : (i64) -> ()
        %__rlasp_stack_elide_zero_566 = arith.constant 0 : i64
        %2455 = arith.addi %2441, %__rlasp_stack_elide_zero_566 : i64
        %2456 = func.call @stack_pop_pointer() : () -> i64
        %2457 = func.call @cc_cons(%2455, %2456) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2457) : (i64) -> ()
        %__rlasp_stack_elide_zero_567 = arith.constant 0 : i64
        %2458 = arith.addi %2439, %__rlasp_stack_elide_zero_567 : i64
        %2459 = func.call @stack_pop_pointer() : () -> i64
        %2460 = func.call @cc_cons(%2458, %2459) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2460) : (i64) -> ()
      }
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2463 = arith.constant 16 : i64
      %2464 = func.call @cc_make_string(%2462, %2463) : (!llvm.ptr, i64) -> i64
      %2465 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2466 = arith.constant 7 : i64
      %2467 = func.call @cc_make_string(%2465, %2466) : (!llvm.ptr, i64) -> i64
      %2468 = func.call @cc_intern(%2464, %2467) : (i64, i64) -> i64
      %2469 = func.call @cc_nil_value() : () -> i64
      %2470 = func.call @cc_cons(%2468, %2469) : (i64, i64) -> i64
      %2471 = func.call @cc_values_pack(%2470) : (i64) -> i64
      %2472 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2472) : (i64) -> ()
      %2473 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2473) : (i64) -> ()
      %2474 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2474) : (i64) -> ()
      %2475 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%2475) : (i64) -> ()
      %2476 = arith.constant 4 : i64
      %2477 = func.call @cc_box_fixnum(%2476) : (i64) -> i64
      %2478 = func.call @cc_make_vector(%2477) : (i64) -> i64
      %2479 = func.call @stack_pop_pointer() : () -> i64
      %2480 = arith.constant 3 : i64
      %2481 = func.call @cc_box_fixnum(%2480) : (i64) -> i64
      %2482 = func.call @cc_svset(%2478, %2481, %2479) : (i64, i64, i64) -> i64
      %2483 = func.call @stack_pop_pointer() : () -> i64
      %2484 = arith.constant 2 : i64
      %2485 = func.call @cc_box_fixnum(%2484) : (i64) -> i64
      %2486 = func.call @cc_svset(%2478, %2485, %2483) : (i64, i64, i64) -> i64
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = arith.constant 1 : i64
      %2489 = func.call @cc_box_fixnum(%2488) : (i64) -> i64
      %2490 = func.call @cc_svset(%2478, %2489, %2487) : (i64, i64, i64) -> i64
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = arith.constant 0 : i64
      %2493 = func.call @cc_box_fixnum(%2492) : (i64) -> i64
      %2494 = func.call @cc_svset(%2478, %2493, %2491) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_568 = arith.constant 0 : i64
      %2495 = arith.addi %2478, %__rlasp_stack_elide_zero_568 : i64
      %2496 = func.call @cc_nil_value() : () -> i64
      %2497 = func.call @cc_errorp(%2461) : (i64) -> i64
      %2498 = arith.cmpi ne, %2497, %2496 : i64
      %2499 = arith.cmpi eq, %2496, %2496 : i64
      %2500 = arith.andi %2498, %2499 : i1
      %2501 = scf.if %2500 -> (i64) {
        scf.yield %2461 : i64
      } else {
        scf.yield %2496 : i64
      }
      %2502 = func.call @cc_errorp(%2468) : (i64) -> i64
      %2503 = arith.cmpi ne, %2502, %2496 : i64
      %2504 = arith.cmpi eq, %2501, %2496 : i64
      %2505 = arith.andi %2503, %2504 : i1
      %2506 = scf.if %2505 -> (i64) {
        scf.yield %2468 : i64
      } else {
        scf.yield %2501 : i64
      }
      %2507 = func.call @cc_errorp(%2495) : (i64) -> i64
      %2508 = arith.cmpi ne, %2507, %2496 : i64
      %2509 = arith.cmpi eq, %2506, %2496 : i64
      %2510 = arith.andi %2508, %2509 : i1
      %2511 = scf.if %2510 -> (i64) {
        scf.yield %2495 : i64
      } else {
        scf.yield %2506 : i64
      }
      %2512 = arith.cmpi ne, %2511, %2496 : i64
      scf.if %2512 {
        func.call @stack_push_pointer(%2511) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2461) : (i64) -> ()
        func.call @stack_push_pointer(%2468) : (i64) -> ()
        func.call @stack_push_pointer(%2495) : (i64) -> ()
        %2513 = llvm.mlir.addressof @str204 : !llvm.ptr
        %2514 = func.call @cc_make_function_ref_const(%2513) : (!llvm.ptr) -> i64
        %2515 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2514, %2515) : (i64, i64) -> ()
      }
      %2516 = func.call @stack_pop_pointer() : () -> i64
      %2517 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2517) : (i64) -> ()
      %2518 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2519 = func.call @stack_pop_pointer() : () -> i64
      %2520 = func.call @stack_pop_pointer() : () -> i64
      %2521 = func.call @cc_cons(%2520, %2519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_569 = arith.constant 0 : i64
      %2522 = arith.addi %2521, %__rlasp_stack_elide_zero_569 : i64
      %2523 = func.call @stack_pop_pointer() : () -> i64
      %2524 = func.call @cc_cons(%2523, %2522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_570 = arith.constant 0 : i64
      %2525 = arith.addi %2524, %__rlasp_stack_elide_zero_570 : i64
      %2526 = func.call @cc_nil_value() : () -> i64
      %2527 = func.call @cc_errorp(%2516) : (i64) -> i64
      %2528 = arith.cmpi ne, %2527, %2526 : i64
      %2529 = arith.cmpi eq, %2526, %2526 : i64
      %2530 = arith.andi %2528, %2529 : i1
      %2531 = scf.if %2530 -> (i64) {
        scf.yield %2516 : i64
      } else {
        scf.yield %2526 : i64
      }
      %2532 = func.call @cc_errorp(%2525) : (i64) -> i64
      %2533 = arith.cmpi ne, %2532, %2526 : i64
      %2534 = arith.cmpi eq, %2531, %2526 : i64
      %2535 = arith.andi %2533, %2534 : i1
      %2536 = scf.if %2535 -> (i64) {
        scf.yield %2525 : i64
      } else {
        scf.yield %2531 : i64
      }
      %2537 = arith.cmpi ne, %2536, %2526 : i64
      scf.if %2537 {
        func.call @stack_push_pointer(%2536) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2516) : (i64) -> ()
        func.call @stack_push_pointer(%2525) : (i64) -> ()
        %2538 = llvm.mlir.addressof @str205 : !llvm.ptr
        %2539 = func.call @cc_make_function_ref_const(%2538) : (!llvm.ptr) -> i64
        %2540 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2539, %2540) : (i64, i64) -> ()
      }
      %2541 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2541 : i64
    }
    func.call @stack_push_pointer(%2437) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958539"() {
    %2845 = func.call @cc_nil_value() : () -> i64
    %2846 = func.call @cc_nil_value() : () -> i64
    %2847 = func.call @cc_errorp(%2845) : (i64) -> i64
    %2848 = arith.cmpi ne, %2847, %2846 : i64
    %2849 = scf.if %2848 -> (i64) {
      scf.yield %2845 : i64
    } else {
      %2850 = arith.constant 5 : i64
      %2851 = func.call @cc_box_fixnum(%2850) : (i64) -> i64
      %2852 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2853 = arith.constant 12 : i64
      %2854 = func.call @cc_make_string(%2852, %2853) : (!llvm.ptr, i64) -> i64
      %2855 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2856 = arith.constant 7 : i64
      %2857 = func.call @cc_make_string(%2855, %2856) : (!llvm.ptr, i64) -> i64
      %2858 = func.call @cc_intern(%2854, %2857) : (i64, i64) -> i64
      %2859 = func.call @cc_nil_value() : () -> i64
      %2860 = func.call @cc_cons(%2858, %2859) : (i64, i64) -> i64
      %2861 = func.call @cc_values_pack(%2860) : (i64) -> i64
      %2862 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2863 = arith.constant 9 : i64
      %2864 = func.call @cc_make_string(%2862, %2863) : (!llvm.ptr, i64) -> i64
      %2865 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2866 = arith.constant 11 : i64
      %2867 = func.call @cc_make_string(%2865, %2866) : (!llvm.ptr, i64) -> i64
      %2868 = func.call @cc_intern(%2864, %2867) : (i64, i64) -> i64
      %2869 = func.call @cc_nil_value() : () -> i64
      %2870 = func.call @cc_cons(%2868, %2869) : (i64, i64) -> i64
      %2871 = func.call @cc_values_pack(%2870) : (i64) -> i64
      %__rlasp_stack_elide_zero_571 = arith.constant 0 : i64
      %2872 = arith.addi %2868, %__rlasp_stack_elide_zero_571 : i64
      %2873 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2874 = arith.constant 15 : i64
      %2875 = func.call @cc_make_string(%2873, %2874) : (!llvm.ptr, i64) -> i64
      %2876 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2877 = arith.constant 7 : i64
      %2878 = func.call @cc_make_string(%2876, %2877) : (!llvm.ptr, i64) -> i64
      %2879 = func.call @cc_intern(%2875, %2878) : (i64, i64) -> i64
      %2880 = func.call @cc_nil_value() : () -> i64
      %2881 = func.call @cc_cons(%2879, %2880) : (i64, i64) -> i64
      %2882 = func.call @cc_values_pack(%2881) : (i64) -> i64
      %2883 = arith.constant 97 : i64
      %2884 = func.call @cc_box_character(%2883) : (i64) -> i64
      %2885 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2886 = arith.constant 10 : i64
      %2887 = func.call @cc_make_string(%2885, %2886) : (!llvm.ptr, i64) -> i64
      %2888 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2889 = arith.constant 7 : i64
      %2890 = func.call @cc_make_string(%2888, %2889) : (!llvm.ptr, i64) -> i64
      %2891 = func.call @cc_intern(%2887, %2890) : (i64, i64) -> i64
      %2892 = func.call @cc_nil_value() : () -> i64
      %2893 = func.call @cc_cons(%2891, %2892) : (i64, i64) -> i64
      %2894 = func.call @cc_values_pack(%2893) : (i64) -> i64
      %2895 = func.call @cc_t_value() : () -> i64
      %2896 = func.call @cc_nil_value() : () -> i64
      %2897 = func.call @cc_errorp(%2851) : (i64) -> i64
      %2898 = arith.cmpi ne, %2897, %2896 : i64
      %2899 = arith.cmpi eq, %2896, %2896 : i64
      %2900 = arith.andi %2898, %2899 : i1
      %2901 = scf.if %2900 -> (i64) {
        scf.yield %2851 : i64
      } else {
        scf.yield %2896 : i64
      }
      %2902 = func.call @cc_errorp(%2858) : (i64) -> i64
      %2903 = arith.cmpi ne, %2902, %2896 : i64
      %2904 = arith.cmpi eq, %2901, %2896 : i64
      %2905 = arith.andi %2903, %2904 : i1
      %2906 = scf.if %2905 -> (i64) {
        scf.yield %2858 : i64
      } else {
        scf.yield %2901 : i64
      }
      %2907 = func.call @cc_errorp(%2872) : (i64) -> i64
      %2908 = arith.cmpi ne, %2907, %2896 : i64
      %2909 = arith.cmpi eq, %2906, %2896 : i64
      %2910 = arith.andi %2908, %2909 : i1
      %2911 = scf.if %2910 -> (i64) {
        scf.yield %2872 : i64
      } else {
        scf.yield %2906 : i64
      }
      %2912 = func.call @cc_errorp(%2879) : (i64) -> i64
      %2913 = arith.cmpi ne, %2912, %2896 : i64
      %2914 = arith.cmpi eq, %2911, %2896 : i64
      %2915 = arith.andi %2913, %2914 : i1
      %2916 = scf.if %2915 -> (i64) {
        scf.yield %2879 : i64
      } else {
        scf.yield %2911 : i64
      }
      %2917 = func.call @cc_errorp(%2884) : (i64) -> i64
      %2918 = arith.cmpi ne, %2917, %2896 : i64
      %2919 = arith.cmpi eq, %2916, %2896 : i64
      %2920 = arith.andi %2918, %2919 : i1
      %2921 = scf.if %2920 -> (i64) {
        scf.yield %2884 : i64
      } else {
        scf.yield %2916 : i64
      }
      %2922 = func.call @cc_errorp(%2891) : (i64) -> i64
      %2923 = arith.cmpi ne, %2922, %2896 : i64
      %2924 = arith.cmpi eq, %2921, %2896 : i64
      %2925 = arith.andi %2923, %2924 : i1
      %2926 = scf.if %2925 -> (i64) {
        scf.yield %2891 : i64
      } else {
        scf.yield %2921 : i64
      }
      %2927 = func.call @cc_errorp(%2895) : (i64) -> i64
      %2928 = arith.cmpi ne, %2927, %2896 : i64
      %2929 = arith.cmpi eq, %2926, %2896 : i64
      %2930 = arith.andi %2928, %2929 : i1
      %2931 = scf.if %2930 -> (i64) {
        scf.yield %2895 : i64
      } else {
        scf.yield %2926 : i64
      }
      %2932 = arith.cmpi ne, %2931, %2896 : i64
      scf.if %2932 {
        func.call @stack_push_pointer(%2931) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2851) : (i64) -> ()
        func.call @stack_push_pointer(%2858) : (i64) -> ()
        func.call @stack_push_pointer(%2872) : (i64) -> ()
        func.call @stack_push_pointer(%2879) : (i64) -> ()
        func.call @stack_push_pointer(%2884) : (i64) -> ()
        func.call @stack_push_pointer(%2891) : (i64) -> ()
        func.call @stack_push_pointer(%2895) : (i64) -> ()
        %2933 = llvm.mlir.addressof @str237 : !llvm.ptr
        %2934 = func.call @cc_make_function_ref_const(%2933) : (!llvm.ptr) -> i64
        %2935 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%2934, %2935) : (i64, i64) -> ()
      }
      %2936 = func.call @stack_pop_pointer() : () -> i64
      %2937 = func.call @cc_nil_value() : () -> i64
      %2938 = func.call @cc_errorp(%2936) : (i64) -> i64
      %2939 = arith.cmpi ne, %2938, %2937 : i64
      %2940 = arith.cmpi eq, %2937, %2937 : i64
      %2941 = arith.andi %2939, %2940 : i1
      %2942 = scf.if %2941 -> (i64) {
        scf.yield %2936 : i64
      } else {
        scf.yield %2937 : i64
      }
      %2943 = arith.cmpi ne, %2942, %2937 : i64
      scf.if %2943 {
        func.call @stack_push_pointer(%2942) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2936) : (i64) -> ()
        %2944 = llvm.mlir.addressof @str238 : !llvm.ptr
        %2945 = func.call @cc_make_function_ref_const(%2944) : (!llvm.ptr) -> i64
        %2946 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2945, %2946) : (i64, i64) -> ()
      }
      %2947 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2947 : i64
    }
    func.call @stack_push_pointer(%2849) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958540"() {
    %3157 = func.call @cc_nil_value() : () -> i64
    %3158 = func.call @cc_nil_value() : () -> i64
    %3159 = func.call @cc_errorp(%3157) : (i64) -> i64
    %3160 = arith.cmpi ne, %3159, %3158 : i64
    %3161 = scf.if %3160 -> (i64) {
      scf.yield %3157 : i64
    } else {
      %3162 = arith.constant 5 : i64
      %3163 = func.call @cc_box_fixnum(%3162) : (i64) -> i64
      %3164 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3165 = arith.constant 12 : i64
      %3166 = func.call @cc_make_string(%3164, %3165) : (!llvm.ptr, i64) -> i64
      %3167 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3168 = arith.constant 7 : i64
      %3169 = func.call @cc_make_string(%3167, %3168) : (!llvm.ptr, i64) -> i64
      %3170 = func.call @cc_intern(%3166, %3169) : (i64, i64) -> i64
      %3171 = func.call @cc_nil_value() : () -> i64
      %3172 = func.call @cc_cons(%3170, %3171) : (i64, i64) -> i64
      %3173 = func.call @cc_values_pack(%3172) : (i64) -> i64
      %3174 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3175 = arith.constant 9 : i64
      %3176 = func.call @cc_make_string(%3174, %3175) : (!llvm.ptr, i64) -> i64
      %3177 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3178 = arith.constant 11 : i64
      %3179 = func.call @cc_make_string(%3177, %3178) : (!llvm.ptr, i64) -> i64
      %3180 = func.call @cc_intern(%3176, %3179) : (i64, i64) -> i64
      %3181 = func.call @cc_nil_value() : () -> i64
      %3182 = func.call @cc_cons(%3180, %3181) : (i64, i64) -> i64
      %3183 = func.call @cc_values_pack(%3182) : (i64) -> i64
      %__rlasp_stack_elide_zero_572 = arith.constant 0 : i64
      %3184 = arith.addi %3180, %__rlasp_stack_elide_zero_572 : i64
      %3185 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3186 = arith.constant 15 : i64
      %3187 = func.call @cc_make_string(%3185, %3186) : (!llvm.ptr, i64) -> i64
      %3188 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3189 = arith.constant 7 : i64
      %3190 = func.call @cc_make_string(%3188, %3189) : (!llvm.ptr, i64) -> i64
      %3191 = func.call @cc_intern(%3187, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_nil_value() : () -> i64
      %3193 = func.call @cc_cons(%3191, %3192) : (i64, i64) -> i64
      %3194 = func.call @cc_values_pack(%3193) : (i64) -> i64
      %3195 = arith.constant 97 : i64
      %3196 = func.call @cc_box_character(%3195) : (i64) -> i64
      %3197 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3198 = arith.constant 10 : i64
      %3199 = func.call @cc_make_string(%3197, %3198) : (!llvm.ptr, i64) -> i64
      %3200 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3201 = arith.constant 7 : i64
      %3202 = func.call @cc_make_string(%3200, %3201) : (!llvm.ptr, i64) -> i64
      %3203 = func.call @cc_intern(%3199, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_nil_value() : () -> i64
      %3205 = func.call @cc_cons(%3203, %3204) : (i64, i64) -> i64
      %3206 = func.call @cc_values_pack(%3205) : (i64) -> i64
      %3207 = func.call @cc_t_value() : () -> i64
      %3208 = func.call @cc_nil_value() : () -> i64
      %3209 = func.call @cc_errorp(%3163) : (i64) -> i64
      %3210 = arith.cmpi ne, %3209, %3208 : i64
      %3211 = arith.cmpi eq, %3208, %3208 : i64
      %3212 = arith.andi %3210, %3211 : i1
      %3213 = scf.if %3212 -> (i64) {
        scf.yield %3163 : i64
      } else {
        scf.yield %3208 : i64
      }
      %3214 = func.call @cc_errorp(%3170) : (i64) -> i64
      %3215 = arith.cmpi ne, %3214, %3208 : i64
      %3216 = arith.cmpi eq, %3213, %3208 : i64
      %3217 = arith.andi %3215, %3216 : i1
      %3218 = scf.if %3217 -> (i64) {
        scf.yield %3170 : i64
      } else {
        scf.yield %3213 : i64
      }
      %3219 = func.call @cc_errorp(%3184) : (i64) -> i64
      %3220 = arith.cmpi ne, %3219, %3208 : i64
      %3221 = arith.cmpi eq, %3218, %3208 : i64
      %3222 = arith.andi %3220, %3221 : i1
      %3223 = scf.if %3222 -> (i64) {
        scf.yield %3184 : i64
      } else {
        scf.yield %3218 : i64
      }
      %3224 = func.call @cc_errorp(%3191) : (i64) -> i64
      %3225 = arith.cmpi ne, %3224, %3208 : i64
      %3226 = arith.cmpi eq, %3223, %3208 : i64
      %3227 = arith.andi %3225, %3226 : i1
      %3228 = scf.if %3227 -> (i64) {
        scf.yield %3191 : i64
      } else {
        scf.yield %3223 : i64
      }
      %3229 = func.call @cc_errorp(%3196) : (i64) -> i64
      %3230 = arith.cmpi ne, %3229, %3208 : i64
      %3231 = arith.cmpi eq, %3228, %3208 : i64
      %3232 = arith.andi %3230, %3231 : i1
      %3233 = scf.if %3232 -> (i64) {
        scf.yield %3196 : i64
      } else {
        scf.yield %3228 : i64
      }
      %3234 = func.call @cc_errorp(%3203) : (i64) -> i64
      %3235 = arith.cmpi ne, %3234, %3208 : i64
      %3236 = arith.cmpi eq, %3233, %3208 : i64
      %3237 = arith.andi %3235, %3236 : i1
      %3238 = scf.if %3237 -> (i64) {
        scf.yield %3203 : i64
      } else {
        scf.yield %3233 : i64
      }
      %3239 = func.call @cc_errorp(%3207) : (i64) -> i64
      %3240 = arith.cmpi ne, %3239, %3208 : i64
      %3241 = arith.cmpi eq, %3238, %3208 : i64
      %3242 = arith.andi %3240, %3241 : i1
      %3243 = scf.if %3242 -> (i64) {
        scf.yield %3207 : i64
      } else {
        scf.yield %3238 : i64
      }
      %3244 = arith.cmpi ne, %3243, %3208 : i64
      scf.if %3244 {
        func.call @stack_push_pointer(%3243) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3163) : (i64) -> ()
        func.call @stack_push_pointer(%3170) : (i64) -> ()
        func.call @stack_push_pointer(%3184) : (i64) -> ()
        func.call @stack_push_pointer(%3191) : (i64) -> ()
        func.call @stack_push_pointer(%3196) : (i64) -> ()
        func.call @stack_push_pointer(%3203) : (i64) -> ()
        func.call @stack_push_pointer(%3207) : (i64) -> ()
        %3245 = llvm.mlir.addressof @str267 : !llvm.ptr
        %3246 = func.call @cc_make_function_ref_const(%3245) : (!llvm.ptr) -> i64
        %3247 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%3246, %3247) : (i64, i64) -> ()
      }
      %3248 = func.call @stack_pop_pointer() : () -> i64
      %3249 = func.call @cc_nil_value() : () -> i64
      %3250 = func.call @cc_errorp(%3248) : (i64) -> i64
      %3251 = arith.cmpi ne, %3250, %3249 : i64
      %3252 = arith.cmpi eq, %3249, %3249 : i64
      %3253 = arith.andi %3251, %3252 : i1
      %3254 = scf.if %3253 -> (i64) {
        scf.yield %3248 : i64
      } else {
        scf.yield %3249 : i64
      }
      %3255 = arith.cmpi ne, %3254, %3249 : i64
      scf.if %3255 {
        func.call @stack_push_pointer(%3254) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3248) : (i64) -> ()
        %3256 = llvm.mlir.addressof @str268 : !llvm.ptr
        %3257 = func.call @cc_make_function_ref_const(%3256) : (!llvm.ptr) -> i64
        %3258 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3257, %3258) : (i64, i64) -> ()
      }
      %3259 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3259 : i64
    }
    func.call @stack_push_pointer(%3161) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958541"() {
    %3517 = func.call @cc_nil_value() : () -> i64
    %3518 = func.call @cc_nil_value() : () -> i64
    %3519 = func.call @cc_errorp(%3517) : (i64) -> i64
    %3520 = arith.cmpi ne, %3519, %3518 : i64
    %3521 = scf.if %3520 -> (i64) {
      scf.yield %3517 : i64
    } else {
      %3522 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3522) : (i64) -> ()
      %3523 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3523) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3524 = func.call @stack_pop_pointer() : () -> i64
      %3525 = func.call @stack_pop_pointer() : () -> i64
      %3526 = func.call @cc_cons(%3525, %3524) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_573 = arith.constant 0 : i64
      %3527 = arith.addi %3526, %__rlasp_stack_elide_zero_573 : i64
      %3528 = func.call @stack_pop_pointer() : () -> i64
      %3529 = func.call @cc_cons(%3528, %3527) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_574 = arith.constant 0 : i64
      %3530 = arith.addi %3529, %__rlasp_stack_elide_zero_574 : i64
      %3531 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3532 = arith.constant 12 : i64
      %3533 = func.call @cc_make_string(%3531, %3532) : (!llvm.ptr, i64) -> i64
      %3534 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3535 = arith.constant 7 : i64
      %3536 = func.call @cc_make_string(%3534, %3535) : (!llvm.ptr, i64) -> i64
      %3537 = func.call @cc_intern(%3533, %3536) : (i64, i64) -> i64
      %3538 = func.call @cc_nil_value() : () -> i64
      %3539 = func.call @cc_cons(%3537, %3538) : (i64, i64) -> i64
      %3540 = func.call @cc_values_pack(%3539) : (i64) -> i64
      %3541 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3542 = arith.constant 7 : i64
      %3543 = func.call @cc_make_string(%3541, %3542) : (!llvm.ptr, i64) -> i64
      %3544 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3545 = arith.constant 11 : i64
      %3546 = func.call @cc_make_string(%3544, %3545) : (!llvm.ptr, i64) -> i64
      %3547 = func.call @cc_intern(%3543, %3546) : (i64, i64) -> i64
      %3548 = func.call @cc_nil_value() : () -> i64
      %3549 = func.call @cc_cons(%3547, %3548) : (i64, i64) -> i64
      %3550 = func.call @cc_values_pack(%3549) : (i64) -> i64
      func.call @stack_push_pointer(%3547) : (i64) -> ()
      %3551 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3551) : (i64) -> ()
      %3552 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%3552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3553 = func.call @stack_pop_pointer() : () -> i64
      %3554 = func.call @stack_pop_pointer() : () -> i64
      %3555 = func.call @cc_cons(%3554, %3553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3556 = func.call @stack_pop_pointer() : () -> i64
      %3557 = func.call @stack_pop_pointer() : () -> i64
      %3558 = func.call @cc_cons(%3557, %3556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_575 = arith.constant 0 : i64
      %3559 = arith.addi %3558, %__rlasp_stack_elide_zero_575 : i64
      %3560 = func.call @stack_pop_pointer() : () -> i64
      %3561 = func.call @cc_cons(%3560, %3559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_576 = arith.constant 0 : i64
      %3562 = arith.addi %3561, %__rlasp_stack_elide_zero_576 : i64
      %3563 = func.call @stack_pop_pointer() : () -> i64
      %3564 = func.call @cc_cons(%3563, %3562) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_577 = arith.constant 0 : i64
      %3565 = arith.addi %3564, %__rlasp_stack_elide_zero_577 : i64
      %3566 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3567 = arith.constant 16 : i64
      %3568 = func.call @cc_make_string(%3566, %3567) : (!llvm.ptr, i64) -> i64
      %3569 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3570 = arith.constant 7 : i64
      %3571 = func.call @cc_make_string(%3569, %3570) : (!llvm.ptr, i64) -> i64
      %3572 = func.call @cc_intern(%3568, %3571) : (i64, i64) -> i64
      %3573 = func.call @cc_nil_value() : () -> i64
      %3574 = func.call @cc_cons(%3572, %3573) : (i64, i64) -> i64
      %3575 = func.call @cc_values_pack(%3574) : (i64) -> i64
      %3576 = arith.constant 34 : i64
      func.call @stack_push_fixnum(%3576) : (i64) -> ()
      %3577 = arith.constant 98 : i64
      func.call @stack_push_fixnum(%3577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3578 = func.call @stack_pop_pointer() : () -> i64
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @cc_cons(%3579, %3578) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_578 = arith.constant 0 : i64
      %3581 = arith.addi %3580, %__rlasp_stack_elide_zero_578 : i64
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @cc_cons(%3582, %3581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3583) : (i64) -> ()
      %3584 = arith.constant 14 : i64
      func.call @stack_push_fixnum(%3584) : (i64) -> ()
      %3585 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%3585) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3586 = func.call @stack_pop_pointer() : () -> i64
      %3587 = func.call @stack_pop_pointer() : () -> i64
      %3588 = func.call @cc_cons(%3587, %3586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_579 = arith.constant 0 : i64
      %3589 = arith.addi %3588, %__rlasp_stack_elide_zero_579 : i64
      %3590 = func.call @stack_pop_pointer() : () -> i64
      %3591 = func.call @cc_cons(%3590, %3589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3592 = func.call @stack_pop_pointer() : () -> i64
      %3593 = func.call @stack_pop_pointer() : () -> i64
      %3594 = func.call @cc_cons(%3593, %3592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_580 = arith.constant 0 : i64
      %3595 = arith.addi %3594, %__rlasp_stack_elide_zero_580 : i64
      %3596 = func.call @stack_pop_pointer() : () -> i64
      %3597 = func.call @cc_cons(%3596, %3595) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_581 = arith.constant 0 : i64
      %3598 = arith.addi %3597, %__rlasp_stack_elide_zero_581 : i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_errorp(%3530) : (i64) -> i64
      %3601 = arith.cmpi ne, %3600, %3599 : i64
      %3602 = arith.cmpi eq, %3599, %3599 : i64
      %3603 = arith.andi %3601, %3602 : i1
      %3604 = scf.if %3603 -> (i64) {
        scf.yield %3530 : i64
      } else {
        scf.yield %3599 : i64
      }
      %3605 = func.call @cc_errorp(%3537) : (i64) -> i64
      %3606 = arith.cmpi ne, %3605, %3599 : i64
      %3607 = arith.cmpi eq, %3604, %3599 : i64
      %3608 = arith.andi %3606, %3607 : i1
      %3609 = scf.if %3608 -> (i64) {
        scf.yield %3537 : i64
      } else {
        scf.yield %3604 : i64
      }
      %3610 = func.call @cc_errorp(%3565) : (i64) -> i64
      %3611 = arith.cmpi ne, %3610, %3599 : i64
      %3612 = arith.cmpi eq, %3609, %3599 : i64
      %3613 = arith.andi %3611, %3612 : i1
      %3614 = scf.if %3613 -> (i64) {
        scf.yield %3565 : i64
      } else {
        scf.yield %3609 : i64
      }
      %3615 = func.call @cc_errorp(%3572) : (i64) -> i64
      %3616 = arith.cmpi ne, %3615, %3599 : i64
      %3617 = arith.cmpi eq, %3614, %3599 : i64
      %3618 = arith.andi %3616, %3617 : i1
      %3619 = scf.if %3618 -> (i64) {
        scf.yield %3572 : i64
      } else {
        scf.yield %3614 : i64
      }
      %3620 = func.call @cc_errorp(%3598) : (i64) -> i64
      %3621 = arith.cmpi ne, %3620, %3599 : i64
      %3622 = arith.cmpi eq, %3619, %3599 : i64
      %3623 = arith.andi %3621, %3622 : i1
      %3624 = scf.if %3623 -> (i64) {
        scf.yield %3598 : i64
      } else {
        scf.yield %3619 : i64
      }
      %3625 = arith.cmpi ne, %3624, %3599 : i64
      scf.if %3625 {
        func.call @stack_push_pointer(%3624) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3530) : (i64) -> ()
        func.call @stack_push_pointer(%3537) : (i64) -> ()
        func.call @stack_push_pointer(%3565) : (i64) -> ()
        func.call @stack_push_pointer(%3572) : (i64) -> ()
        func.call @stack_push_pointer(%3598) : (i64) -> ()
        %3626 = llvm.mlir.addressof @str294 : !llvm.ptr
        %3627 = func.call @cc_make_function_ref_const(%3626) : (!llvm.ptr) -> i64
        %3628 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%3627, %3628) : (i64, i64) -> ()
      }
      %3629 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = func.call @cc_cons(%3629, %3630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_582 = arith.constant 0 : i64
      %3632 = arith.addi %3631, %__rlasp_stack_elide_zero_582 : i64
      %3633 = func.call @cc_values_pack(%3632) : (i64) -> i64
      %__rlasp_stack_elide_zero_583 = arith.constant 0 : i64
      %3634 = arith.addi %3633, %__rlasp_stack_elide_zero_583 : i64
      scf.yield %3634 : i64
    }
    func.call @stack_push_pointer(%3521) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958542"() {
    %3981 = func.call @cc_nil_value() : () -> i64
    %3982 = func.call @cc_nil_value() : () -> i64
    %3983 = func.call @cc_errorp(%3981) : (i64) -> i64
    %3984 = arith.cmpi ne, %3983, %3982 : i64
    %3985 = scf.if %3984 -> (i64) {
      scf.yield %3981 : i64
    } else {
      %3986 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3986) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3987 = func.call @stack_pop_pointer() : () -> i64
      %3988 = func.call @stack_pop_pointer() : () -> i64
      %3989 = func.call @cc_cons(%3988, %3987) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_584 = arith.constant 0 : i64
      %3990 = arith.addi %3989, %__rlasp_stack_elide_zero_584 : i64
      %3991 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3992 = arith.constant 12 : i64
      %3993 = func.call @cc_make_string(%3991, %3992) : (!llvm.ptr, i64) -> i64
      %3994 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3995 = arith.constant 7 : i64
      %3996 = func.call @cc_make_string(%3994, %3995) : (!llvm.ptr, i64) -> i64
      %3997 = func.call @cc_intern(%3993, %3996) : (i64, i64) -> i64
      %3998 = func.call @cc_nil_value() : () -> i64
      %3999 = func.call @cc_cons(%3997, %3998) : (i64, i64) -> i64
      %4000 = func.call @cc_values_pack(%3999) : (i64) -> i64
      %4001 = func.call @cc_nil_value() : () -> i64
      %4002 = func.call @cc_nil_value() : () -> i64
      %4003 = func.call @cc_errorp(%3990) : (i64) -> i64
      %4004 = arith.cmpi ne, %4003, %4002 : i64
      %4005 = arith.cmpi eq, %4002, %4002 : i64
      %4006 = arith.andi %4004, %4005 : i1
      %4007 = scf.if %4006 -> (i64) {
        scf.yield %3990 : i64
      } else {
        scf.yield %4002 : i64
      }
      %4008 = func.call @cc_errorp(%3997) : (i64) -> i64
      %4009 = arith.cmpi ne, %4008, %4002 : i64
      %4010 = arith.cmpi eq, %4007, %4002 : i64
      %4011 = arith.andi %4009, %4010 : i1
      %4012 = scf.if %4011 -> (i64) {
        scf.yield %3997 : i64
      } else {
        scf.yield %4007 : i64
      }
      %4013 = func.call @cc_errorp(%4001) : (i64) -> i64
      %4014 = arith.cmpi ne, %4013, %4002 : i64
      %4015 = arith.cmpi eq, %4012, %4002 : i64
      %4016 = arith.andi %4014, %4015 : i1
      %4017 = scf.if %4016 -> (i64) {
        scf.yield %4001 : i64
      } else {
        scf.yield %4012 : i64
      }
      %4018 = arith.cmpi ne, %4017, %4002 : i64
      scf.if %4018 {
        func.call @stack_push_pointer(%4017) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3990) : (i64) -> ()
        func.call @stack_push_pointer(%3997) : (i64) -> ()
        func.call @stack_push_pointer(%4001) : (i64) -> ()
        %4019 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4020 = func.call @cc_make_function_ref_const(%4019) : (!llvm.ptr) -> i64
        %4021 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4020, %4021) : (i64, i64) -> ()
      }
      %4022 = func.call @stack_pop_pointer() : () -> i64
      %4023 = func.call @cc_nil_value() : () -> i64
      %4024 = func.call @cc_errorp(%4022) : (i64) -> i64
      %4025 = arith.cmpi ne, %4024, %4023 : i64
      %4026 = arith.cmpi eq, %4023, %4023 : i64
      %4027 = arith.andi %4025, %4026 : i1
      %4028 = scf.if %4027 -> (i64) {
        scf.yield %4022 : i64
      } else {
        scf.yield %4023 : i64
      }
      %4029 = arith.cmpi ne, %4028, %4023 : i64
      scf.if %4029 {
        func.call @stack_push_pointer(%4028) : (i64) -> ()
      } else {
        %4030 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4030) : (i64) -> ()
        %__rlasp_stack_elide_zero_585 = arith.constant 0 : i64
        %4031 = arith.addi %4022, %__rlasp_stack_elide_zero_585 : i64
        %4032 = func.call @stack_pop_pointer() : () -> i64
        %4033 = func.call @cc_cons(%4031, %4032) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4033) : (i64) -> ()
      }
      %4034 = func.call @stack_pop_pointer() : () -> i64
      %4035 = func.call @cc_errorp(%4034) : (i64) -> i64
      %4036 = func.call @cc_nil_value() : () -> i64
      %4037 = arith.cmpi ne, %4035, %4036 : i64
      %4038 = scf.if %4037 -> (i64) {
        %4039 = func.call @cc_condition_value(%4034) : (i64) -> i64
        %4040 = llvm.mlir.addressof @str333 : !llvm.ptr
        %4041 = arith.constant 5 : i64
        %4042 = func.call @cc_make_string(%4040, %4041) : (!llvm.ptr, i64) -> i64
        %4043 = llvm.mlir.addressof @str334 : !llvm.ptr
        %4044 = arith.constant 11 : i64
        %4045 = func.call @cc_make_string(%4043, %4044) : (!llvm.ptr, i64) -> i64
        %4046 = func.call @cc_intern(%4042, %4045) : (i64, i64) -> i64
        %4047 = func.call @cc_nil_value() : () -> i64
        %4048 = func.call @cc_cons(%4046, %4047) : (i64, i64) -> i64
        %4049 = func.call @cc_values_pack(%4048) : (i64) -> i64
        %__rlasp_stack_elide_zero_586 = arith.constant 0 : i64
        %4050 = arith.addi %4046, %__rlasp_stack_elide_zero_586 : i64
        %4051 = func.call @cc_typep(%4039, %4050) : (i64, i64) -> i64
        %4052 = func.call @cc_nil_value() : () -> i64
        %4053 = arith.cmpi ne, %4051, %4052 : i64
        %4054 = scf.if %4053 -> (i64) {
          func.call @stack_push_nil() : () -> ()
          %4055 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4055 : i64
        } else {
          scf.yield %4034 : i64
        }
        scf.yield %4054 : i64
      } else {
        scf.yield %4034 : i64
      }
      %__rlasp_stack_elide_zero_587 = arith.constant 0 : i64
      %4056 = arith.addi %4038, %__rlasp_stack_elide_zero_587 : i64
      %4057 = func.call @cc_nil_value() : () -> i64
      %4058 = func.call @cc_nil_value() : () -> i64
      %4059 = func.call @cc_errorp(%4057) : (i64) -> i64
      %4060 = arith.cmpi ne, %4059, %4058 : i64
      %4061 = scf.if %4060 -> (i64) {
        scf.yield %4057 : i64
      } else {
        %4062 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_588 = arith.constant 0 : i64
        %4063 = arith.addi %4056, %__rlasp_stack_elide_zero_588 : i64
        %4064 = func.call @cc_nil_value() : () -> i64
        %4065 = arith.cmpi eq, %4063, %4064 : i64
        %4067 = func.call @cc_t_value() : () -> i64
        %4066 = arith.select %4065, %4067, %4064 : i64
        %__rlasp_stack_elide_zero_589 = arith.constant 0 : i64
        %4068 = arith.addi %4066, %__rlasp_stack_elide_zero_589 : i64
        %__rlasp_stack_elide_zero_590 = arith.constant 0 : i64
        %4069 = arith.addi %4056, %__rlasp_stack_elide_zero_590 : i64
        %4070 = func.call @cc_arrayp(%4069) : (i64) -> i64
        %__rlasp_stack_elide_zero_591 = arith.constant 0 : i64
        %4071 = arith.addi %4070, %__rlasp_stack_elide_zero_591 : i64
        %4072 = func.call @cc_cons(%4071, %4062) : (i64, i64) -> i64
        %4073 = func.call @cc_cons(%4068, %4072) : (i64, i64) -> i64
        %4074 = func.call @cc_or(%4073) : (i64) -> i64
        %__rlasp_stack_elide_zero_592 = arith.constant 0 : i64
        %4075 = arith.addi %4074, %__rlasp_stack_elide_zero_592 : i64
        scf.yield %4075 : i64
      }
      %__rlasp_stack_elide_zero_593 = arith.constant 0 : i64
      %4076 = arith.addi %4061, %__rlasp_stack_elide_zero_593 : i64
      %4077 = func.call @cc_nil_value() : () -> i64
      %4078 = func.call @cc_cons(%4076, %4077) : (i64, i64) -> i64
      %4079 = func.call @cc_not(%4078) : (i64) -> i64
      %__rlasp_stack_elide_zero_594 = arith.constant 0 : i64
      %4080 = arith.addi %4079, %__rlasp_stack_elide_zero_594 : i64
      %4081 = func.call @cc_nil_value() : () -> i64
      %4082 = func.call @cc_cons(%4080, %4081) : (i64, i64) -> i64
      %4083 = func.call @cc_not(%4082) : (i64) -> i64
      %__rlasp_stack_elide_zero_595 = arith.constant 0 : i64
      %4084 = arith.addi %4083, %__rlasp_stack_elide_zero_595 : i64
      scf.yield %4084 : i64
    }
    func.call @stack_push_pointer(%3985) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958543"() {
    %4351 = func.call @cc_nil_value() : () -> i64
    %4352 = func.call @cc_nil_value() : () -> i64
    %4353 = func.call @cc_errorp(%4351) : (i64) -> i64
    %4354 = arith.cmpi ne, %4353, %4352 : i64
    %4355 = scf.if %4354 -> (i64) {
      scf.yield %4351 : i64
    } else {
      %4356 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4356) : (i64) -> ()
      %4357 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4357) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4358 = func.call @stack_pop_pointer() : () -> i64
      %4359 = func.call @stack_pop_pointer() : () -> i64
      %4360 = func.call @cc_cons(%4359, %4358) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_596 = arith.constant 0 : i64
      %4361 = arith.addi %4360, %__rlasp_stack_elide_zero_596 : i64
      %4362 = func.call @stack_pop_pointer() : () -> i64
      %4363 = func.call @cc_cons(%4362, %4361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_597 = arith.constant 0 : i64
      %4364 = arith.addi %4363, %__rlasp_stack_elide_zero_597 : i64
      %4365 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4366 = arith.constant 15 : i64
      %4367 = func.call @cc_make_string(%4365, %4366) : (!llvm.ptr, i64) -> i64
      %4368 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4369 = arith.constant 7 : i64
      %4370 = func.call @cc_make_string(%4368, %4369) : (!llvm.ptr, i64) -> i64
      %4371 = func.call @cc_intern(%4367, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_nil_value() : () -> i64
      %4373 = func.call @cc_cons(%4371, %4372) : (i64, i64) -> i64
      %4374 = func.call @cc_values_pack(%4373) : (i64) -> i64
      %4375 = arith.constant 97 : i64
      %4376 = func.call @cc_box_character(%4375) : (i64) -> i64
      %4377 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4378 = arith.constant 12 : i64
      %4379 = func.call @cc_make_string(%4377, %4378) : (!llvm.ptr, i64) -> i64
      %4380 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4381 = arith.constant 7 : i64
      %4382 = func.call @cc_make_string(%4380, %4381) : (!llvm.ptr, i64) -> i64
      %4383 = func.call @cc_intern(%4379, %4382) : (i64, i64) -> i64
      %4384 = func.call @cc_nil_value() : () -> i64
      %4385 = func.call @cc_cons(%4383, %4384) : (i64, i64) -> i64
      %4386 = func.call @cc_values_pack(%4385) : (i64) -> i64
      %4387 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4388 = arith.constant 9 : i64
      %4389 = func.call @cc_make_string(%4387, %4388) : (!llvm.ptr, i64) -> i64
      %4390 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4391 = arith.constant 11 : i64
      %4392 = func.call @cc_make_string(%4390, %4391) : (!llvm.ptr, i64) -> i64
      %4393 = func.call @cc_intern(%4389, %4392) : (i64, i64) -> i64
      %4394 = func.call @cc_nil_value() : () -> i64
      %4395 = func.call @cc_cons(%4393, %4394) : (i64, i64) -> i64
      %4396 = func.call @cc_values_pack(%4395) : (i64) -> i64
      %__rlasp_stack_elide_zero_598 = arith.constant 0 : i64
      %4397 = arith.addi %4393, %__rlasp_stack_elide_zero_598 : i64
      %4398 = func.call @cc_nil_value() : () -> i64
      %4399 = func.call @cc_errorp(%4364) : (i64) -> i64
      %4400 = arith.cmpi ne, %4399, %4398 : i64
      %4401 = arith.cmpi eq, %4398, %4398 : i64
      %4402 = arith.andi %4400, %4401 : i1
      %4403 = scf.if %4402 -> (i64) {
        scf.yield %4364 : i64
      } else {
        scf.yield %4398 : i64
      }
      %4404 = func.call @cc_errorp(%4371) : (i64) -> i64
      %4405 = arith.cmpi ne, %4404, %4398 : i64
      %4406 = arith.cmpi eq, %4403, %4398 : i64
      %4407 = arith.andi %4405, %4406 : i1
      %4408 = scf.if %4407 -> (i64) {
        scf.yield %4371 : i64
      } else {
        scf.yield %4403 : i64
      }
      %4409 = func.call @cc_errorp(%4376) : (i64) -> i64
      %4410 = arith.cmpi ne, %4409, %4398 : i64
      %4411 = arith.cmpi eq, %4408, %4398 : i64
      %4412 = arith.andi %4410, %4411 : i1
      %4413 = scf.if %4412 -> (i64) {
        scf.yield %4376 : i64
      } else {
        scf.yield %4408 : i64
      }
      %4414 = func.call @cc_errorp(%4383) : (i64) -> i64
      %4415 = arith.cmpi ne, %4414, %4398 : i64
      %4416 = arith.cmpi eq, %4413, %4398 : i64
      %4417 = arith.andi %4415, %4416 : i1
      %4418 = scf.if %4417 -> (i64) {
        scf.yield %4383 : i64
      } else {
        scf.yield %4413 : i64
      }
      %4419 = func.call @cc_errorp(%4397) : (i64) -> i64
      %4420 = arith.cmpi ne, %4419, %4398 : i64
      %4421 = arith.cmpi eq, %4418, %4398 : i64
      %4422 = arith.andi %4420, %4421 : i1
      %4423 = scf.if %4422 -> (i64) {
        scf.yield %4397 : i64
      } else {
        scf.yield %4418 : i64
      }
      %4424 = arith.cmpi ne, %4423, %4398 : i64
      scf.if %4424 {
        func.call @stack_push_pointer(%4423) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4364) : (i64) -> ()
        func.call @stack_push_pointer(%4371) : (i64) -> ()
        func.call @stack_push_pointer(%4376) : (i64) -> ()
        func.call @stack_push_pointer(%4383) : (i64) -> ()
        func.call @stack_push_pointer(%4397) : (i64) -> ()
        %4425 = llvm.mlir.addressof @str364 : !llvm.ptr
        %4426 = func.call @cc_make_function_ref_const(%4425) : (!llvm.ptr) -> i64
        %4427 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%4426, %4427) : (i64, i64) -> ()
      }
      %4428 = func.call @stack_pop_pointer() : () -> i64
      %4429 = func.call @cc_nil_value() : () -> i64
      %4430 = func.call @cc_nil_value() : () -> i64
      %4431 = func.call @cc_errorp(%4429) : (i64) -> i64
      %4432 = arith.cmpi ne, %4431, %4430 : i64
      %4433 = scf.if %4432 -> (i64) {
        scf.yield %4429 : i64
      } else {
        %4434 = arith.constant 0 : i64
        %4435 = func.call @cc_box_fixnum(%4434) : (i64) -> i64
        %4436 = arith.constant 0 : i64
        %4437 = func.call @cc_box_fixnum(%4436) : (i64) -> i64
        %4438 = func.call @cc_nil_value() : () -> i64
        %4439 = func.call @cc_errorp(%4428) : (i64) -> i64
        %4440 = arith.cmpi ne, %4439, %4438 : i64
        %4441 = arith.cmpi eq, %4438, %4438 : i64
        %4442 = arith.andi %4440, %4441 : i1
        %4443 = scf.if %4442 -> (i64) {
          scf.yield %4428 : i64
        } else {
          scf.yield %4438 : i64
        }
        %4444 = func.call @cc_errorp(%4435) : (i64) -> i64
        %4445 = arith.cmpi ne, %4444, %4438 : i64
        %4446 = arith.cmpi eq, %4443, %4438 : i64
        %4447 = arith.andi %4445, %4446 : i1
        %4448 = scf.if %4447 -> (i64) {
          scf.yield %4435 : i64
        } else {
          scf.yield %4443 : i64
        }
        %4449 = func.call @cc_errorp(%4437) : (i64) -> i64
        %4450 = arith.cmpi ne, %4449, %4438 : i64
        %4451 = arith.cmpi eq, %4448, %4438 : i64
        %4452 = arith.andi %4450, %4451 : i1
        %4453 = scf.if %4452 -> (i64) {
          scf.yield %4437 : i64
        } else {
          scf.yield %4448 : i64
        }
        %4454 = arith.cmpi ne, %4453, %4438 : i64
        scf.if %4454 {
          func.call @stack_push_pointer(%4453) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4428) : (i64) -> ()
          func.call @stack_push_pointer(%4435) : (i64) -> ()
          func.call @stack_push_pointer(%4437) : (i64) -> ()
          %4455 = llvm.mlir.addressof @str365 : !llvm.ptr
          %4456 = func.call @cc_make_function_ref_const(%4455) : (!llvm.ptr) -> i64
          %4457 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%4456, %4457) : (i64, i64) -> ()
        }
        %4458 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4458 : i64
      }
      %__rlasp_stack_elide_zero_599 = arith.constant 0 : i64
      %4459 = arith.addi %4433, %__rlasp_stack_elide_zero_599 : i64
      scf.yield %4459 : i64
    }
    func.call @stack_push_pointer(%4355) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958544"() {
    %4720 = func.call @cc_nil_value() : () -> i64
    %4721 = func.call @cc_nil_value() : () -> i64
    %4722 = func.call @cc_errorp(%4720) : (i64) -> i64
    %4723 = arith.cmpi ne, %4722, %4721 : i64
    %4724 = scf.if %4723 -> (i64) {
      scf.yield %4720 : i64
    } else {
      %4725 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4725) : (i64) -> ()
      %4726 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4726) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4727 = func.call @stack_pop_pointer() : () -> i64
      %4728 = func.call @stack_pop_pointer() : () -> i64
      %4729 = func.call @cc_cons(%4728, %4727) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_600 = arith.constant 0 : i64
      %4730 = arith.addi %4729, %__rlasp_stack_elide_zero_600 : i64
      %4731 = func.call @stack_pop_pointer() : () -> i64
      %4732 = func.call @cc_cons(%4731, %4730) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_601 = arith.constant 0 : i64
      %4733 = arith.addi %4732, %__rlasp_stack_elide_zero_601 : i64
      %4734 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4735 = arith.constant 15 : i64
      %4736 = func.call @cc_make_string(%4734, %4735) : (!llvm.ptr, i64) -> i64
      %4737 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4738 = arith.constant 7 : i64
      %4739 = func.call @cc_make_string(%4737, %4738) : (!llvm.ptr, i64) -> i64
      %4740 = func.call @cc_intern(%4736, %4739) : (i64, i64) -> i64
      %4741 = func.call @cc_nil_value() : () -> i64
      %4742 = func.call @cc_cons(%4740, %4741) : (i64, i64) -> i64
      %4743 = func.call @cc_values_pack(%4742) : (i64) -> i64
      %4744 = arith.constant 97 : i64
      %4745 = func.call @cc_box_character(%4744) : (i64) -> i64
      %4746 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4747 = arith.constant 12 : i64
      %4748 = func.call @cc_make_string(%4746, %4747) : (!llvm.ptr, i64) -> i64
      %4749 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4750 = arith.constant 7 : i64
      %4751 = func.call @cc_make_string(%4749, %4750) : (!llvm.ptr, i64) -> i64
      %4752 = func.call @cc_intern(%4748, %4751) : (i64, i64) -> i64
      %4753 = func.call @cc_nil_value() : () -> i64
      %4754 = func.call @cc_cons(%4752, %4753) : (i64, i64) -> i64
      %4755 = func.call @cc_values_pack(%4754) : (i64) -> i64
      %4756 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4757 = arith.constant 9 : i64
      %4758 = func.call @cc_make_string(%4756, %4757) : (!llvm.ptr, i64) -> i64
      %4759 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4760 = arith.constant 11 : i64
      %4761 = func.call @cc_make_string(%4759, %4760) : (!llvm.ptr, i64) -> i64
      %4762 = func.call @cc_intern(%4758, %4761) : (i64, i64) -> i64
      %4763 = func.call @cc_nil_value() : () -> i64
      %4764 = func.call @cc_cons(%4762, %4763) : (i64, i64) -> i64
      %4765 = func.call @cc_values_pack(%4764) : (i64) -> i64
      %__rlasp_stack_elide_zero_602 = arith.constant 0 : i64
      %4766 = arith.addi %4762, %__rlasp_stack_elide_zero_602 : i64
      %4767 = func.call @cc_nil_value() : () -> i64
      %4768 = func.call @cc_errorp(%4733) : (i64) -> i64
      %4769 = arith.cmpi ne, %4768, %4767 : i64
      %4770 = arith.cmpi eq, %4767, %4767 : i64
      %4771 = arith.andi %4769, %4770 : i1
      %4772 = scf.if %4771 -> (i64) {
        scf.yield %4733 : i64
      } else {
        scf.yield %4767 : i64
      }
      %4773 = func.call @cc_errorp(%4740) : (i64) -> i64
      %4774 = arith.cmpi ne, %4773, %4767 : i64
      %4775 = arith.cmpi eq, %4772, %4767 : i64
      %4776 = arith.andi %4774, %4775 : i1
      %4777 = scf.if %4776 -> (i64) {
        scf.yield %4740 : i64
      } else {
        scf.yield %4772 : i64
      }
      %4778 = func.call @cc_errorp(%4745) : (i64) -> i64
      %4779 = arith.cmpi ne, %4778, %4767 : i64
      %4780 = arith.cmpi eq, %4777, %4767 : i64
      %4781 = arith.andi %4779, %4780 : i1
      %4782 = scf.if %4781 -> (i64) {
        scf.yield %4745 : i64
      } else {
        scf.yield %4777 : i64
      }
      %4783 = func.call @cc_errorp(%4752) : (i64) -> i64
      %4784 = arith.cmpi ne, %4783, %4767 : i64
      %4785 = arith.cmpi eq, %4782, %4767 : i64
      %4786 = arith.andi %4784, %4785 : i1
      %4787 = scf.if %4786 -> (i64) {
        scf.yield %4752 : i64
      } else {
        scf.yield %4782 : i64
      }
      %4788 = func.call @cc_errorp(%4766) : (i64) -> i64
      %4789 = arith.cmpi ne, %4788, %4767 : i64
      %4790 = arith.cmpi eq, %4787, %4767 : i64
      %4791 = arith.andi %4789, %4790 : i1
      %4792 = scf.if %4791 -> (i64) {
        scf.yield %4766 : i64
      } else {
        scf.yield %4787 : i64
      }
      %4793 = arith.cmpi ne, %4792, %4767 : i64
      scf.if %4793 {
        func.call @stack_push_pointer(%4792) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4733) : (i64) -> ()
        func.call @stack_push_pointer(%4740) : (i64) -> ()
        func.call @stack_push_pointer(%4745) : (i64) -> ()
        func.call @stack_push_pointer(%4752) : (i64) -> ()
        func.call @stack_push_pointer(%4766) : (i64) -> ()
        %4794 = llvm.mlir.addressof @str394 : !llvm.ptr
        %4795 = func.call @cc_make_function_ref_const(%4794) : (!llvm.ptr) -> i64
        %4796 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%4795, %4796) : (i64, i64) -> ()
      }
      %4797 = func.call @stack_pop_pointer() : () -> i64
      %4798 = func.call @cc_nil_value() : () -> i64
      %4799 = func.call @cc_nil_value() : () -> i64
      %4800 = func.call @cc_errorp(%4798) : (i64) -> i64
      %4801 = arith.cmpi ne, %4800, %4799 : i64
      %4802 = scf.if %4801 -> (i64) {
        scf.yield %4798 : i64
      } else {
        %4803 = arith.constant 0 : i64
        %4804 = func.call @cc_box_fixnum(%4803) : (i64) -> i64
        %4805 = arith.constant 0 : i64
        %4806 = func.call @cc_box_fixnum(%4805) : (i64) -> i64
        %4807 = func.call @cc_nil_value() : () -> i64
        %4808 = func.call @cc_errorp(%4797) : (i64) -> i64
        %4809 = arith.cmpi ne, %4808, %4807 : i64
        %4810 = arith.cmpi eq, %4807, %4807 : i64
        %4811 = arith.andi %4809, %4810 : i1
        %4812 = scf.if %4811 -> (i64) {
          scf.yield %4797 : i64
        } else {
          scf.yield %4807 : i64
        }
        %4813 = func.call @cc_errorp(%4804) : (i64) -> i64
        %4814 = arith.cmpi ne, %4813, %4807 : i64
        %4815 = arith.cmpi eq, %4812, %4807 : i64
        %4816 = arith.andi %4814, %4815 : i1
        %4817 = scf.if %4816 -> (i64) {
          scf.yield %4804 : i64
        } else {
          scf.yield %4812 : i64
        }
        %4818 = func.call @cc_errorp(%4806) : (i64) -> i64
        %4819 = arith.cmpi ne, %4818, %4807 : i64
        %4820 = arith.cmpi eq, %4817, %4807 : i64
        %4821 = arith.andi %4819, %4820 : i1
        %4822 = scf.if %4821 -> (i64) {
          scf.yield %4806 : i64
        } else {
          scf.yield %4817 : i64
        }
        %4823 = arith.cmpi ne, %4822, %4807 : i64
        scf.if %4823 {
          func.call @stack_push_pointer(%4822) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4797) : (i64) -> ()
          func.call @stack_push_pointer(%4804) : (i64) -> ()
          func.call @stack_push_pointer(%4806) : (i64) -> ()
          %4824 = llvm.mlir.addressof @str395 : !llvm.ptr
          %4825 = func.call @cc_make_function_ref_const(%4824) : (!llvm.ptr) -> i64
          %4826 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%4825, %4826) : (i64, i64) -> ()
        }
        %4827 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4827 : i64
      }
      %__rlasp_stack_elide_zero_603 = arith.constant 0 : i64
      %4828 = arith.addi %4802, %__rlasp_stack_elide_zero_603 : i64
      scf.yield %4828 : i64
    }
    func.call @stack_push_pointer(%4724) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958545"() {
    %5064 = func.call @cc_nil_value() : () -> i64
    %5065 = func.call @cc_nil_value() : () -> i64
    %5066 = func.call @cc_errorp(%5064) : (i64) -> i64
    %5067 = arith.cmpi ne, %5066, %5065 : i64
    %5068 = scf.if %5067 -> (i64) {
      scf.yield %5064 : i64
    } else {
      %5069 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5070 = func.call @cc_nil_value() : () -> i64
      %5071 = func.call @cc_nil_value() : () -> i64
      %5072 = func.call @cc_errorp(%5070) : (i64) -> i64
      %5073 = arith.cmpi ne, %5072, %5071 : i64
      %5074 = scf.if %5073 -> (i64) {
        scf.yield %5070 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5075 = arith.constant 5 : i64
        %5076 = func.call @cc_box_fixnum(%5075) : (i64) -> i64
        %5077 = llvm.mlir.addressof @str419 : !llvm.ptr
        %5078 = arith.constant 12 : i64
        %5079 = func.call @cc_make_string(%5077, %5078) : (!llvm.ptr, i64) -> i64
        %5080 = llvm.mlir.addressof @str420 : !llvm.ptr
        %5081 = arith.constant 7 : i64
        %5082 = func.call @cc_make_string(%5080, %5081) : (!llvm.ptr, i64) -> i64
        %5083 = func.call @cc_intern(%5079, %5082) : (i64, i64) -> i64
        %5084 = func.call @cc_nil_value() : () -> i64
        %5085 = func.call @cc_cons(%5083, %5084) : (i64, i64) -> i64
        %5086 = func.call @cc_values_pack(%5085) : (i64) -> i64
        %5087 = llvm.mlir.addressof @str421 : !llvm.ptr
        %5088 = arith.constant 0 : i64
        %5089 = func.call @cc_make_string(%5087, %5088) : (!llvm.ptr, i64) -> i64
        %5090 = func.call @cc_nil_value() : () -> i64
        %5091 = func.call @cc_errorp(%5089) : (i64) -> i64
        %5092 = arith.cmpi ne, %5091, %5090 : i64
        %5093 = arith.cmpi eq, %5090, %5090 : i64
        %5094 = arith.andi %5092, %5093 : i1
        %5095 = scf.if %5094 -> (i64) {
          scf.yield %5089 : i64
        } else {
          scf.yield %5090 : i64
        }
        %5096 = arith.cmpi ne, %5095, %5090 : i64
        scf.if %5096 {
          func.call @stack_push_pointer(%5095) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5089) : (i64) -> ()
          %5097 = llvm.mlir.addressof @str422 : !llvm.ptr
          %5098 = func.call @cc_make_function_ref_const(%5097) : (!llvm.ptr) -> i64
          %5099 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5098, %5099) : (i64, i64) -> ()
        }
        %5100 = func.call @stack_pop_pointer() : () -> i64
        %5101 = llvm.mlir.addressof @str423 : !llvm.ptr
        %5102 = arith.constant 22 : i64
        %5103 = func.call @cc_make_string(%5101, %5102) : (!llvm.ptr, i64) -> i64
        %5104 = llvm.mlir.addressof @str424 : !llvm.ptr
        %5105 = arith.constant 7 : i64
        %5106 = func.call @cc_make_string(%5104, %5105) : (!llvm.ptr, i64) -> i64
        %5107 = func.call @cc_intern(%5103, %5106) : (i64, i64) -> i64
        %5108 = func.call @cc_nil_value() : () -> i64
        %5109 = func.call @cc_cons(%5107, %5108) : (i64, i64) -> i64
        %5110 = func.call @cc_values_pack(%5109) : (i64) -> i64
        %5111 = arith.constant 2 : i64
        %5112 = func.call @cc_box_fixnum(%5111) : (i64) -> i64
        %5113 = llvm.mlir.addressof @str425 : !llvm.ptr
        %5114 = arith.constant 12 : i64
        %5115 = func.call @cc_make_string(%5113, %5114) : (!llvm.ptr, i64) -> i64
        %5116 = llvm.mlir.addressof @str426 : !llvm.ptr
        %5117 = arith.constant 7 : i64
        %5118 = func.call @cc_make_string(%5116, %5117) : (!llvm.ptr, i64) -> i64
        %5119 = func.call @cc_intern(%5115, %5118) : (i64, i64) -> i64
        %5120 = func.call @cc_nil_value() : () -> i64
        %5121 = func.call @cc_cons(%5119, %5120) : (i64, i64) -> i64
        %5122 = func.call @cc_values_pack(%5121) : (i64) -> i64
        %5123 = llvm.mlir.addressof @str427 : !llvm.ptr
        %5124 = arith.constant 0 : i64
        %5125 = func.call @cc_make_string(%5123, %5124) : (!llvm.ptr, i64) -> i64
        %5126 = func.call @cc_nil_value() : () -> i64
        %5127 = func.call @cc_errorp(%5076) : (i64) -> i64
        %5128 = arith.cmpi ne, %5127, %5126 : i64
        %5129 = arith.cmpi eq, %5126, %5126 : i64
        %5130 = arith.andi %5128, %5129 : i1
        %5131 = scf.if %5130 -> (i64) {
          scf.yield %5076 : i64
        } else {
          scf.yield %5126 : i64
        }
        %5132 = func.call @cc_errorp(%5083) : (i64) -> i64
        %5133 = arith.cmpi ne, %5132, %5126 : i64
        %5134 = arith.cmpi eq, %5131, %5126 : i64
        %5135 = arith.andi %5133, %5134 : i1
        %5136 = scf.if %5135 -> (i64) {
          scf.yield %5083 : i64
        } else {
          scf.yield %5131 : i64
        }
        %5137 = func.call @cc_errorp(%5100) : (i64) -> i64
        %5138 = arith.cmpi ne, %5137, %5126 : i64
        %5139 = arith.cmpi eq, %5136, %5126 : i64
        %5140 = arith.andi %5138, %5139 : i1
        %5141 = scf.if %5140 -> (i64) {
          scf.yield %5100 : i64
        } else {
          scf.yield %5136 : i64
        }
        %5142 = func.call @cc_errorp(%5107) : (i64) -> i64
        %5143 = arith.cmpi ne, %5142, %5126 : i64
        %5144 = arith.cmpi eq, %5141, %5126 : i64
        %5145 = arith.andi %5143, %5144 : i1
        %5146 = scf.if %5145 -> (i64) {
          scf.yield %5107 : i64
        } else {
          scf.yield %5141 : i64
        }
        %5147 = func.call @cc_errorp(%5112) : (i64) -> i64
        %5148 = arith.cmpi ne, %5147, %5126 : i64
        %5149 = arith.cmpi eq, %5146, %5126 : i64
        %5150 = arith.andi %5148, %5149 : i1
        %5151 = scf.if %5150 -> (i64) {
          scf.yield %5112 : i64
        } else {
          scf.yield %5146 : i64
        }
        %5152 = func.call @cc_errorp(%5119) : (i64) -> i64
        %5153 = arith.cmpi ne, %5152, %5126 : i64
        %5154 = arith.cmpi eq, %5151, %5126 : i64
        %5155 = arith.andi %5153, %5154 : i1
        %5156 = scf.if %5155 -> (i64) {
          scf.yield %5119 : i64
        } else {
          scf.yield %5151 : i64
        }
        %5157 = func.call @cc_errorp(%5125) : (i64) -> i64
        %5158 = arith.cmpi ne, %5157, %5126 : i64
        %5159 = arith.cmpi eq, %5156, %5126 : i64
        %5160 = arith.andi %5158, %5159 : i1
        %5161 = scf.if %5160 -> (i64) {
          scf.yield %5125 : i64
        } else {
          scf.yield %5156 : i64
        }
        %5162 = arith.cmpi ne, %5161, %5126 : i64
        scf.if %5162 {
          func.call @stack_push_pointer(%5161) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5076) : (i64) -> ()
          func.call @stack_push_pointer(%5083) : (i64) -> ()
          func.call @stack_push_pointer(%5100) : (i64) -> ()
          func.call @stack_push_pointer(%5107) : (i64) -> ()
          func.call @stack_push_pointer(%5112) : (i64) -> ()
          func.call @stack_push_pointer(%5119) : (i64) -> ()
          func.call @stack_push_pointer(%5125) : (i64) -> ()
          %5163 = llvm.mlir.addressof @str428 : !llvm.ptr
          %5164 = func.call @cc_make_function_ref_const(%5163) : (!llvm.ptr) -> i64
          %5165 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%5164, %5165) : (i64, i64) -> ()
        }
        %5166 = func.call @stack_pop_pointer() : () -> i64
        %5167 = func.call @cc_errorp(%5166) : (i64) -> i64
        %5168 = func.call @cc_nil_value() : () -> i64
        %5169 = arith.cmpi ne, %5167, %5168 : i64
        scf.if %5169 {
          func.call @stack_push_pointer(%5166) : (i64) -> ()
        } else {
          %5170 = func.call @cc_multiple_value_list(%5166) : (i64) -> i64
          func.call @stack_push_pointer(%5170) : (i64) -> ()
        }
        %5171 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5172 = func.call @stack_pop_pointer() : () -> i64
        %5173 = func.call @cc_nil_value() : () -> i64
        %5174 = func.call @cc_maybe_error_from_multiple_value_list(%5171) : (i64) -> i64
        %5175 = func.call @cc_errorp(%5174) : (i64) -> i64
        %5176 = arith.cmpi ne, %5175, %5173 : i64
        %5177 = arith.cmpi eq, %5173, %5173 : i64
        %5178 = arith.andi %5176, %5177 : i1
        %5179 = scf.if %5178 -> (i64) {
          scf.yield %5174 : i64
        } else {
          scf.yield %5173 : i64
        }
        %5180 = arith.cmpi ne, %5179, %5173 : i64
        scf.if %5180 {
          func.call @stack_push_pointer(%5179) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5181 = func.call @stack_pop_pointer() : () -> i64
          %5182 = func.call @cc_cons(%5172, %5181) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_604 = arith.constant 0 : i64
          %5183 = arith.addi %5182, %__rlasp_stack_elide_zero_604 : i64
          %5184 = func.call @cc_cons(%5171, %5183) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_605 = arith.constant 0 : i64
          %5185 = arith.addi %5184, %__rlasp_stack_elide_zero_605 : i64
          %5186 = func.call @cc_values_pack(%5185) : (i64) -> i64
          func.call @stack_push_pointer(%5186) : (i64) -> ()
        }
        %5187 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5187 : i64
      }
      %__rlasp_stack_elide_zero_606 = arith.constant 0 : i64
      %5188 = arith.addi %5074, %__rlasp_stack_elide_zero_606 : i64
      %5189 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5190 = func.call @cc_errorp(%5188) : (i64) -> i64
      %5191 = func.call @cc_nil_value() : () -> i64
      %5192 = arith.cmpi ne, %5190, %5191 : i64
      scf.if %5192 {
        %5193 = func.call @cc_condition_value(%5188) : (i64) -> i64
        %5194 = func.call @cc_values2(%5191, %5193) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5194) : (i64) -> ()
      } else {
        %5195 = func.call @cc_multiple_value_list(%5188) : (i64) -> i64
        %5196 = func.call @cc_values_pack(%5195) : (i64) -> i64
        func.call @stack_push_pointer(%5196) : (i64) -> ()
      }
      %5197 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5197 : i64
    }
    func.call @stack_push_pointer(%5068) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958546"() {
    %5412 = func.call @cc_nil_value() : () -> i64
    %5413 = func.call @cc_nil_value() : () -> i64
    %5414 = func.call @cc_errorp(%5412) : (i64) -> i64
    %5415 = arith.cmpi ne, %5414, %5413 : i64
    %5416 = scf.if %5415 -> (i64) {
      scf.yield %5412 : i64
    } else {
      %5417 = func.call @cc_nil_value() : () -> i64
      %5418 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5419 = arith.constant 15 : i64
      %5420 = func.call @cc_make_string(%5418, %5419) : (!llvm.ptr, i64) -> i64
      %5421 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5422 = arith.constant 7 : i64
      %5423 = func.call @cc_make_string(%5421, %5422) : (!llvm.ptr, i64) -> i64
      %5424 = func.call @cc_intern(%5420, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_nil_value() : () -> i64
      %5426 = func.call @cc_cons(%5424, %5425) : (i64, i64) -> i64
      %5427 = func.call @cc_values_pack(%5426) : (i64) -> i64
      %5428 = arith.constant 23 : i64
      %5429 = func.call @cc_box_fixnum(%5428) : (i64) -> i64
      %5430 = func.call @cc_nil_value() : () -> i64
      %5431 = func.call @cc_errorp(%5417) : (i64) -> i64
      %5432 = arith.cmpi ne, %5431, %5430 : i64
      %5433 = arith.cmpi eq, %5430, %5430 : i64
      %5434 = arith.andi %5432, %5433 : i1
      %5435 = scf.if %5434 -> (i64) {
        scf.yield %5417 : i64
      } else {
        scf.yield %5430 : i64
      }
      %5436 = func.call @cc_errorp(%5424) : (i64) -> i64
      %5437 = arith.cmpi ne, %5436, %5430 : i64
      %5438 = arith.cmpi eq, %5435, %5430 : i64
      %5439 = arith.andi %5437, %5438 : i1
      %5440 = scf.if %5439 -> (i64) {
        scf.yield %5424 : i64
      } else {
        scf.yield %5435 : i64
      }
      %5441 = func.call @cc_errorp(%5429) : (i64) -> i64
      %5442 = arith.cmpi ne, %5441, %5430 : i64
      %5443 = arith.cmpi eq, %5440, %5430 : i64
      %5444 = arith.andi %5442, %5443 : i1
      %5445 = scf.if %5444 -> (i64) {
        scf.yield %5429 : i64
      } else {
        scf.yield %5440 : i64
      }
      %5446 = arith.cmpi ne, %5445, %5430 : i64
      scf.if %5446 {
        func.call @stack_push_pointer(%5445) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5417) : (i64) -> ()
        func.call @stack_push_pointer(%5424) : (i64) -> ()
        func.call @stack_push_pointer(%5429) : (i64) -> ()
        %5447 = llvm.mlir.addressof @str452 : !llvm.ptr
        %5448 = func.call @cc_make_function_ref_const(%5447) : (!llvm.ptr) -> i64
        %5449 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%5448, %5449) : (i64, i64) -> ()
      }
      %5450 = func.call @stack_pop_pointer() : () -> i64
      %5451 = func.call @cc_nil_value() : () -> i64
      %5452 = func.call @cc_nil_value() : () -> i64
      %5453 = func.call @cc_errorp(%5451) : (i64) -> i64
      %5454 = arith.cmpi ne, %5453, %5452 : i64
      %5455 = scf.if %5454 -> (i64) {
        scf.yield %5451 : i64
      } else {
        %5456 = func.call @cc_nil_value() : () -> i64
        %5457 = func.call @cc_errorp(%5450) : (i64) -> i64
        %5458 = arith.cmpi ne, %5457, %5456 : i64
        %5459 = arith.cmpi eq, %5456, %5456 : i64
        %5460 = arith.andi %5458, %5459 : i1
        %5461 = scf.if %5460 -> (i64) {
          scf.yield %5450 : i64
        } else {
          scf.yield %5456 : i64
        }
        %5462 = arith.cmpi ne, %5461, %5456 : i64
        scf.if %5462 {
          func.call @stack_push_pointer(%5461) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5450) : (i64) -> ()
          %5463 = llvm.mlir.addressof @str453 : !llvm.ptr
          %5464 = func.call @cc_make_function_ref_const(%5463) : (!llvm.ptr) -> i64
          %5465 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5464, %5465) : (i64, i64) -> ()
        }
        %5466 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5466 : i64
      }
      %__rlasp_stack_elide_zero_607 = arith.constant 0 : i64
      %5467 = arith.addi %5455, %__rlasp_stack_elide_zero_607 : i64
      scf.yield %5467 : i64
    }
    func.call @stack_push_pointer(%5416) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958547"() {
    %5678 = func.call @cc_nil_value() : () -> i64
    %5679 = func.call @cc_nil_value() : () -> i64
    %5680 = func.call @cc_errorp(%5678) : (i64) -> i64
    %5681 = arith.cmpi ne, %5680, %5679 : i64
    %5682 = scf.if %5681 -> (i64) {
      scf.yield %5678 : i64
    } else {
      %5683 = func.call @cc_nil_value() : () -> i64
      %5684 = func.call @cc_nil_value() : () -> i64
      %5685 = func.call @cc_errorp(%5683) : (i64) -> i64
      %5686 = arith.cmpi ne, %5685, %5684 : i64
      %5687 = arith.cmpi eq, %5684, %5684 : i64
      %5688 = arith.andi %5686, %5687 : i1
      %5689 = scf.if %5688 -> (i64) {
        scf.yield %5683 : i64
      } else {
        scf.yield %5684 : i64
      }
      %5690 = arith.cmpi ne, %5689, %5684 : i64
      scf.if %5690 {
        func.call @stack_push_pointer(%5689) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5683) : (i64) -> ()
        %5691 = llvm.mlir.addressof @str474 : !llvm.ptr
        %5692 = func.call @cc_make_function_ref_const(%5691) : (!llvm.ptr) -> i64
        %5693 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5692, %5693) : (i64, i64) -> ()
      }
      %5694 = func.call @stack_pop_pointer() : () -> i64
      %5695 = func.call @cc_nil_value() : () -> i64
      %5696 = func.call @cc_nil_value() : () -> i64
      %5697 = func.call @cc_errorp(%5695) : (i64) -> i64
      %5698 = arith.cmpi ne, %5697, %5696 : i64
      %5699 = scf.if %5698 -> (i64) {
        scf.yield %5695 : i64
      } else {
        func.call @stack_push_pointer(%5694) : (i64) -> ()
        %5700 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%5700) : (i64) -> ()
        %5701 = func.call @stack_pop_pointer() : () -> i64
        %5702 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5701) : (i64) -> ()
        func.call @stack_push_pointer(%5702) : (i64) -> ()
        %5703 = llvm.mlir.addressof @str475 : !llvm.ptr
        %5704 = func.call @cc_make_function_ref_const(%5703) : (!llvm.ptr) -> i64
        %5705 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%5704, %5705) : (i64, i64) -> ()
        %5706 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5706 : i64
      }
      %5707 = func.call @cc_nil_value() : () -> i64
      %5708 = func.call @cc_errorp(%5699) : (i64) -> i64
      %5709 = arith.cmpi ne, %5708, %5707 : i64
      %5710 = scf.if %5709 -> (i64) {
        scf.yield %5699 : i64
      } else {
        %__rlasp_stack_elide_zero_608 = arith.constant 0 : i64
        %5711 = arith.addi %5694, %__rlasp_stack_elide_zero_608 : i64
        scf.yield %5711 : i64
      }
      %__rlasp_stack_elide_zero_609 = arith.constant 0 : i64
      %5712 = arith.addi %5710, %__rlasp_stack_elide_zero_609 : i64
      scf.yield %5712 : i64
    }
    func.call @stack_push_pointer(%5682) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958548"() {
    %5939 = func.call @cc_nil_value() : () -> i64
    %5940 = func.call @cc_nil_value() : () -> i64
    %5941 = func.call @cc_errorp(%5939) : (i64) -> i64
    %5942 = arith.cmpi ne, %5941, %5940 : i64
    %5943 = scf.if %5942 -> (i64) {
      scf.yield %5939 : i64
    } else {
      %5944 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5945 = func.call @cc_nil_value() : () -> i64
      %5946 = func.call @cc_nil_value() : () -> i64
      %5947 = func.call @cc_errorp(%5945) : (i64) -> i64
      %5948 = arith.cmpi ne, %5947, %5946 : i64
      %5949 = scf.if %5948 -> (i64) {
        scf.yield %5945 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5950 = func.call @cc_nil_value() : () -> i64
        %5951 = llvm.mlir.addressof @str495 : !llvm.ptr
        %5952 = arith.constant 15 : i64
        %5953 = func.call @cc_make_string(%5951, %5952) : (!llvm.ptr, i64) -> i64
        %5954 = llvm.mlir.addressof @str496 : !llvm.ptr
        %5955 = arith.constant 7 : i64
        %5956 = func.call @cc_make_string(%5954, %5955) : (!llvm.ptr, i64) -> i64
        %5957 = func.call @cc_intern(%5953, %5956) : (i64, i64) -> i64
        %5958 = func.call @cc_nil_value() : () -> i64
        %5959 = func.call @cc_cons(%5957, %5958) : (i64, i64) -> i64
        %5960 = func.call @cc_values_pack(%5959) : (i64) -> i64
        %5961 = func.call @cc_nil_value() : () -> i64
        %5962 = func.call @cc_nil_value() : () -> i64
        %5963 = func.call @cc_errorp(%5950) : (i64) -> i64
        %5964 = arith.cmpi ne, %5963, %5962 : i64
        %5965 = arith.cmpi eq, %5962, %5962 : i64
        %5966 = arith.andi %5964, %5965 : i1
        %5967 = scf.if %5966 -> (i64) {
          scf.yield %5950 : i64
        } else {
          scf.yield %5962 : i64
        }
        %5968 = func.call @cc_errorp(%5957) : (i64) -> i64
        %5969 = arith.cmpi ne, %5968, %5962 : i64
        %5970 = arith.cmpi eq, %5967, %5962 : i64
        %5971 = arith.andi %5969, %5970 : i1
        %5972 = scf.if %5971 -> (i64) {
          scf.yield %5957 : i64
        } else {
          scf.yield %5967 : i64
        }
        %5973 = func.call @cc_errorp(%5961) : (i64) -> i64
        %5974 = arith.cmpi ne, %5973, %5962 : i64
        %5975 = arith.cmpi eq, %5972, %5962 : i64
        %5976 = arith.andi %5974, %5975 : i1
        %5977 = scf.if %5976 -> (i64) {
          scf.yield %5961 : i64
        } else {
          scf.yield %5972 : i64
        }
        %5978 = arith.cmpi ne, %5977, %5962 : i64
        scf.if %5978 {
          func.call @stack_push_pointer(%5977) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5950) : (i64) -> ()
          func.call @stack_push_pointer(%5957) : (i64) -> ()
          func.call @stack_push_pointer(%5961) : (i64) -> ()
          %5979 = llvm.mlir.addressof @str497 : !llvm.ptr
          %5980 = func.call @cc_make_function_ref_const(%5979) : (!llvm.ptr) -> i64
          %5981 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%5980, %5981) : (i64, i64) -> ()
        }
        %5982 = func.call @stack_pop_pointer() : () -> i64
        %5983 = func.call @cc_nil_value() : () -> i64
        %5984 = func.call @cc_errorp(%5982) : (i64) -> i64
        %5985 = arith.cmpi ne, %5984, %5983 : i64
        %5986 = arith.cmpi eq, %5983, %5983 : i64
        %5987 = arith.andi %5985, %5986 : i1
        %5988 = scf.if %5987 -> (i64) {
          scf.yield %5982 : i64
        } else {
          scf.yield %5983 : i64
        }
        %5989 = arith.cmpi ne, %5988, %5983 : i64
        scf.if %5989 {
          func.call @stack_push_pointer(%5988) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5982) : (i64) -> ()
          %5990 = llvm.mlir.addressof @str498 : !llvm.ptr
          %5991 = func.call @cc_make_function_ref_const(%5990) : (!llvm.ptr) -> i64
          %5992 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5991, %5992) : (i64, i64) -> ()
        }
        %5993 = func.call @stack_pop_pointer() : () -> i64
        %5994 = func.call @cc_errorp(%5993) : (i64) -> i64
        %5995 = func.call @cc_nil_value() : () -> i64
        %5996 = arith.cmpi ne, %5994, %5995 : i64
        scf.if %5996 {
          func.call @stack_push_pointer(%5993) : (i64) -> ()
        } else {
          %5997 = func.call @cc_multiple_value_list(%5993) : (i64) -> i64
          func.call @stack_push_pointer(%5997) : (i64) -> ()
        }
        %5998 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5999 = func.call @stack_pop_pointer() : () -> i64
        %6000 = func.call @cc_nil_value() : () -> i64
        %6001 = func.call @cc_maybe_error_from_multiple_value_list(%5998) : (i64) -> i64
        %6002 = func.call @cc_errorp(%6001) : (i64) -> i64
        %6003 = arith.cmpi ne, %6002, %6000 : i64
        %6004 = arith.cmpi eq, %6000, %6000 : i64
        %6005 = arith.andi %6003, %6004 : i1
        %6006 = scf.if %6005 -> (i64) {
          scf.yield %6001 : i64
        } else {
          scf.yield %6000 : i64
        }
        %6007 = arith.cmpi ne, %6006, %6000 : i64
        scf.if %6007 {
          func.call @stack_push_pointer(%6006) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %6008 = func.call @stack_pop_pointer() : () -> i64
          %6009 = func.call @cc_cons(%5999, %6008) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_610 = arith.constant 0 : i64
          %6010 = arith.addi %6009, %__rlasp_stack_elide_zero_610 : i64
          %6011 = func.call @cc_cons(%5998, %6010) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_611 = arith.constant 0 : i64
          %6012 = arith.addi %6011, %__rlasp_stack_elide_zero_611 : i64
          %6013 = func.call @cc_values_pack(%6012) : (i64) -> i64
          func.call @stack_push_pointer(%6013) : (i64) -> ()
        }
        %6014 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6014 : i64
      }
      %__rlasp_stack_elide_zero_612 = arith.constant 0 : i64
      %6015 = arith.addi %5949, %__rlasp_stack_elide_zero_612 : i64
      %6016 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %6017 = func.call @cc_errorp(%6015) : (i64) -> i64
      %6018 = func.call @cc_nil_value() : () -> i64
      %6019 = arith.cmpi ne, %6017, %6018 : i64
      scf.if %6019 {
        %6020 = func.call @cc_condition_value(%6015) : (i64) -> i64
        %6021 = func.call @cc_values2(%6018, %6020) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6021) : (i64) -> ()
      } else {
        %6022 = func.call @cc_multiple_value_list(%6015) : (i64) -> i64
        %6023 = func.call @cc_values_pack(%6022) : (i64) -> i64
        func.call @stack_push_pointer(%6023) : (i64) -> ()
      }
      %6024 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6024 : i64
    }
    func.call @stack_push_pointer(%5943) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958549"() {
    %6506 = func.call @stack_pop_pointer() : () -> i64
    %6507 = func.call @cc_nil_value() : () -> i64
    %6508 = func.call @cc_nil_value() : () -> i64
    %6509 = func.call @cc_errorp(%6507) : (i64) -> i64
    %6510 = arith.cmpi ne, %6509, %6508 : i64
    %6511 = scf.if %6510 -> (i64) {
      scf.yield %6507 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %6512 = func.call @stack_pop_pointer() : () -> i64
      %6513 = func.call @cc_nil_value() : () -> i64
      %6514 = func.call @cc_errorp(%6512) : (i64) -> i64
      %6515 = arith.cmpi ne, %6514, %6513 : i64
      %6516 = scf.if %6515 -> (i64) {
        scf.yield %6512 : i64
      } else {
        %6517 = arith.constant 3 : i64
        %6518 = func.call @cc_box_fixnum(%6517) : (i64) -> i64
        %6519 = llvm.mlir.addressof @str548 : !llvm.ptr
        %6520 = arith.constant 15 : i64
        %6521 = func.call @cc_make_string(%6519, %6520) : (!llvm.ptr, i64) -> i64
        %6522 = llvm.mlir.addressof @str549 : !llvm.ptr
        %6523 = arith.constant 7 : i64
        %6524 = func.call @cc_make_string(%6522, %6523) : (!llvm.ptr, i64) -> i64
        %6525 = func.call @cc_intern(%6521, %6524) : (i64, i64) -> i64
        %6526 = func.call @cc_nil_value() : () -> i64
        %6527 = func.call @cc_cons(%6525, %6526) : (i64, i64) -> i64
        %6528 = func.call @cc_values_pack(%6527) : (i64) -> i64
        %6529 = arith.constant 5 : i64
        %6530 = func.call @cc_box_fixnum(%6529) : (i64) -> i64
        %6531 = func.call @cc_nil_value() : () -> i64
        %6532 = func.call @cc_errorp(%6518) : (i64) -> i64
        %6533 = arith.cmpi ne, %6532, %6531 : i64
        %6534 = arith.cmpi eq, %6531, %6531 : i64
        %6535 = arith.andi %6533, %6534 : i1
        %6536 = scf.if %6535 -> (i64) {
          scf.yield %6518 : i64
        } else {
          scf.yield %6531 : i64
        }
        %6537 = func.call @cc_errorp(%6525) : (i64) -> i64
        %6538 = arith.cmpi ne, %6537, %6531 : i64
        %6539 = arith.cmpi eq, %6536, %6531 : i64
        %6540 = arith.andi %6538, %6539 : i1
        %6541 = scf.if %6540 -> (i64) {
          scf.yield %6525 : i64
        } else {
          scf.yield %6536 : i64
        }
        %6542 = func.call @cc_errorp(%6530) : (i64) -> i64
        %6543 = arith.cmpi ne, %6542, %6531 : i64
        %6544 = arith.cmpi eq, %6541, %6531 : i64
        %6545 = arith.andi %6543, %6544 : i1
        %6546 = scf.if %6545 -> (i64) {
          scf.yield %6530 : i64
        } else {
          scf.yield %6541 : i64
        }
        %6547 = arith.cmpi ne, %6546, %6531 : i64
        scf.if %6547 {
          func.call @stack_push_pointer(%6546) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6518) : (i64) -> ()
          func.call @stack_push_pointer(%6525) : (i64) -> ()
          func.call @stack_push_pointer(%6530) : (i64) -> ()
          %6548 = llvm.mlir.addressof @str550 : !llvm.ptr
          %6549 = func.call @cc_make_function_ref_const(%6548) : (!llvm.ptr) -> i64
          %6550 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%6549, %6550) : (i64, i64) -> ()
        }
        %6551 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%6551) : (i64) -> ()
        %6552 = func.call @stack_pop_pointer() : () -> i64
        %6553 = func.call @stack_pop_pointer() : () -> i64
        %6554 = func.call @cc_aref(%6553, %6552) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_613 = arith.constant 0 : i64
        %6555 = arith.addi %6554, %__rlasp_stack_elide_zero_613 : i64
        scf.yield %6555 : i64
      }
      %6556 = func.call @cc_nil_value() : () -> i64
      %6557 = func.call @cc_errorp(%6516) : (i64) -> i64
      %6558 = arith.cmpi ne, %6557, %6556 : i64
      %6559 = scf.if %6558 -> (i64) {
        scf.yield %6516 : i64
      } else {
        %6560 = llvm.mlir.addressof @str551 : !llvm.ptr
        %6561 = arith.constant 4 : i64
        %6562 = func.call @cc_make_string(%6560, %6561) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_614 = arith.constant 0 : i64
        %6563 = arith.addi %6562, %__rlasp_stack_elide_zero_614 : i64
        scf.yield %6563 : i64
      }
      %__rlasp_stack_elide_zero_615 = arith.constant 0 : i64
      %6564 = arith.addi %6559, %__rlasp_stack_elide_zero_615 : i64
      %6565 = func.call @cc_errorp(%6564) : (i64) -> i64
      %6566 = func.call @cc_nil_value() : () -> i64
      %6567 = arith.cmpi ne, %6565, %6566 : i64
      %6568 = scf.if %6567 -> (i64) {
        %6569 = func.call @cc_condition_value(%6564) : (i64) -> i64
        %6570 = llvm.mlir.addressof @str552 : !llvm.ptr
        %6571 = arith.constant 5 : i64
        %6572 = func.call @cc_make_string(%6570, %6571) : (!llvm.ptr, i64) -> i64
        %6573 = llvm.mlir.addressof @str553 : !llvm.ptr
        %6574 = arith.constant 11 : i64
        %6575 = func.call @cc_make_string(%6573, %6574) : (!llvm.ptr, i64) -> i64
        %6576 = func.call @cc_intern(%6572, %6575) : (i64, i64) -> i64
        %6577 = func.call @cc_nil_value() : () -> i64
        %6578 = func.call @cc_cons(%6576, %6577) : (i64, i64) -> i64
        %6579 = func.call @cc_values_pack(%6578) : (i64) -> i64
        %__rlasp_stack_elide_zero_616 = arith.constant 0 : i64
        %6580 = arith.addi %6576, %__rlasp_stack_elide_zero_616 : i64
        %6581 = func.call @cc_typep(%6569, %6580) : (i64, i64) -> i64
        %6582 = func.call @cc_nil_value() : () -> i64
        %6583 = arith.cmpi ne, %6581, %6582 : i64
        %6584 = scf.if %6583 -> (i64) {
          func.call @stack_push_pointer(%6569) : (i64) -> ()
          %6585 = llvm.mlir.addressof @str554 : !llvm.ptr
          %6586 = func.call @cc_make_function_ref_const(%6585) : (!llvm.ptr) -> i64
          %6587 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6586, %6587) : (i64, i64) -> ()
          %6588 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %6588 : i64
        } else {
          scf.yield %6564 : i64
        }
        scf.yield %6584 : i64
      } else {
        scf.yield %6564 : i64
      }
      %__rlasp_stack_elide_zero_617 = arith.constant 0 : i64
      %6589 = arith.addi %6568, %__rlasp_stack_elide_zero_617 : i64
      %6590 = func.call @cc_nil_value() : () -> i64
      %6591 = func.call @cc_nil_value() : () -> i64
      %6592 = func.call @cc_errorp(%6590) : (i64) -> i64
      %6593 = arith.cmpi ne, %6592, %6591 : i64
      %6594 = scf.if %6593 -> (i64) {
        scf.yield %6590 : i64
      } else {
        %6595 = func.call @cc_nil_value() : () -> i64
        %6596 = llvm.mlir.addressof @str555 : !llvm.ptr
        %6597 = arith.constant 12 : i64
        %6598 = func.call @cc_make_string(%6596, %6597) : (!llvm.ptr, i64) -> i64
        %6599 = func.call @cc_nil_value() : () -> i64
        %6600 = func.call @cc_errorp(%6598) : (i64) -> i64
        %6601 = arith.cmpi ne, %6600, %6599 : i64
        %6602 = arith.cmpi eq, %6599, %6599 : i64
        %6603 = arith.andi %6601, %6602 : i1
        %6604 = scf.if %6603 -> (i64) {
          scf.yield %6598 : i64
        } else {
          scf.yield %6599 : i64
        }
        %6605 = func.call @cc_errorp(%6589) : (i64) -> i64
        %6606 = arith.cmpi ne, %6605, %6599 : i64
        %6607 = arith.cmpi eq, %6604, %6599 : i64
        %6608 = arith.andi %6606, %6607 : i1
        %6609 = scf.if %6608 -> (i64) {
          scf.yield %6589 : i64
        } else {
          scf.yield %6604 : i64
        }
        %6610 = arith.cmpi ne, %6609, %6599 : i64
        scf.if %6610 {
          func.call @stack_push_pointer(%6609) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6598) : (i64) -> ()
          func.call @stack_push_pointer(%6589) : (i64) -> ()
          %6611 = llvm.mlir.addressof @str556 : !llvm.ptr
          %6612 = func.call @cc_make_function_ref_const(%6611) : (!llvm.ptr) -> i64
          %6613 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%6612, %6613) : (i64, i64) -> ()
        }
        %6614 = func.call @stack_pop_pointer() : () -> i64
        %6615 = llvm.mlir.addressof @str557 : !llvm.ptr
        %6616 = arith.constant 15 : i64
        %6617 = func.call @cc_make_string(%6615, %6616) : (!llvm.ptr, i64) -> i64
        %6618 = func.call @cc_nil_value() : () -> i64
        %6619 = func.call @cc_errorp(%6617) : (i64) -> i64
        %6620 = arith.cmpi ne, %6619, %6618 : i64
        %6621 = arith.cmpi eq, %6618, %6618 : i64
        %6622 = arith.andi %6620, %6621 : i1
        %6623 = scf.if %6622 -> (i64) {
          scf.yield %6617 : i64
        } else {
          scf.yield %6618 : i64
        }
        %6624 = func.call @cc_errorp(%6589) : (i64) -> i64
        %6625 = arith.cmpi ne, %6624, %6618 : i64
        %6626 = arith.cmpi eq, %6623, %6618 : i64
        %6627 = arith.andi %6625, %6626 : i1
        %6628 = scf.if %6627 -> (i64) {
          scf.yield %6589 : i64
        } else {
          scf.yield %6623 : i64
        }
        %6629 = arith.cmpi ne, %6628, %6618 : i64
        scf.if %6629 {
          func.call @stack_push_pointer(%6628) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6617) : (i64) -> ()
          func.call @stack_push_pointer(%6589) : (i64) -> ()
          %6630 = llvm.mlir.addressof @str558 : !llvm.ptr
          %6631 = func.call @cc_make_function_ref_const(%6630) : (!llvm.ptr) -> i64
          %6632 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%6631, %6632) : (i64, i64) -> ()
        }
        %6633 = func.call @stack_pop_pointer() : () -> i64
        %6634 = func.call @cc_cons(%6633, %6595) : (i64, i64) -> i64
        %6635 = func.call @cc_cons(%6614, %6634) : (i64, i64) -> i64
        %6636 = func.call @cc_or(%6635) : (i64) -> i64
        %__rlasp_stack_elide_zero_618 = arith.constant 0 : i64
        %6637 = arith.addi %6636, %__rlasp_stack_elide_zero_618 : i64
        scf.yield %6637 : i64
      }
      %__rlasp_stack_elide_zero_619 = arith.constant 0 : i64
      %6638 = arith.addi %6594, %__rlasp_stack_elide_zero_619 : i64
      %6639 = func.call @cc_nil_value() : () -> i64
      %6640 = func.call @cc_cons(%6638, %6639) : (i64, i64) -> i64
      %6641 = func.call @cc_not(%6640) : (i64) -> i64
      %__rlasp_stack_elide_zero_620 = arith.constant 0 : i64
      %6642 = arith.addi %6641, %__rlasp_stack_elide_zero_620 : i64
      %6643 = func.call @cc_nil_value() : () -> i64
      %6644 = func.call @cc_cons(%6642, %6643) : (i64, i64) -> i64
      %6645 = func.call @cc_not(%6644) : (i64) -> i64
      %__rlasp_stack_elide_zero_621 = arith.constant 0 : i64
      %6646 = arith.addi %6645, %__rlasp_stack_elide_zero_621 : i64
      scf.yield %6646 : i64
    }
    func.call @stack_push_pointer(%6511) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958551"() {
    %7046 = func.call @cc_nil_value() : () -> i64
    %7047 = func.call @cc_nil_value() : () -> i64
    %7048 = func.call @cc_errorp(%7046) : (i64) -> i64
    %7049 = arith.cmpi ne, %7048, %7047 : i64
    %7050 = scf.if %7049 -> (i64) {
      scf.yield %7046 : i64
    } else {
      %7051 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%7051) : (i64) -> ()
      %7052 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%7052) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7053 = func.call @stack_pop_pointer() : () -> i64
      %7054 = func.call @stack_pop_pointer() : () -> i64
      %7055 = func.call @cc_cons(%7054, %7053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_622 = arith.constant 0 : i64
      %7056 = arith.addi %7055, %__rlasp_stack_elide_zero_622 : i64
      %7057 = func.call @stack_pop_pointer() : () -> i64
      %7058 = func.call @cc_cons(%7057, %7056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_623 = arith.constant 0 : i64
      %7059 = arith.addi %7058, %__rlasp_stack_elide_zero_623 : i64
      %7060 = llvm.mlir.addressof @str595 : !llvm.ptr
      %7061 = arith.constant 12 : i64
      %7062 = func.call @cc_make_string(%7060, %7061) : (!llvm.ptr, i64) -> i64
      %7063 = llvm.mlir.addressof @str596 : !llvm.ptr
      %7064 = arith.constant 7 : i64
      %7065 = func.call @cc_make_string(%7063, %7064) : (!llvm.ptr, i64) -> i64
      %7066 = func.call @cc_intern(%7062, %7065) : (i64, i64) -> i64
      %7067 = func.call @cc_nil_value() : () -> i64
      %7068 = func.call @cc_cons(%7066, %7067) : (i64, i64) -> i64
      %7069 = func.call @cc_values_pack(%7068) : (i64) -> i64
      %7070 = llvm.mlir.addressof @str597 : !llvm.ptr
      %7071 = arith.constant 9 : i64
      %7072 = func.call @cc_make_string(%7070, %7071) : (!llvm.ptr, i64) -> i64
      %7073 = llvm.mlir.addressof @str598 : !llvm.ptr
      %7074 = arith.constant 11 : i64
      %7075 = func.call @cc_make_string(%7073, %7074) : (!llvm.ptr, i64) -> i64
      %7076 = func.call @cc_intern(%7072, %7075) : (i64, i64) -> i64
      %7077 = func.call @cc_nil_value() : () -> i64
      %7078 = func.call @cc_cons(%7076, %7077) : (i64, i64) -> i64
      %7079 = func.call @cc_values_pack(%7078) : (i64) -> i64
      %__rlasp_stack_elide_zero_624 = arith.constant 0 : i64
      %7080 = arith.addi %7076, %__rlasp_stack_elide_zero_624 : i64
      %7081 = llvm.mlir.addressof @str599 : !llvm.ptr
      %7082 = arith.constant 16 : i64
      %7083 = func.call @cc_make_string(%7081, %7082) : (!llvm.ptr, i64) -> i64
      %7084 = llvm.mlir.addressof @str600 : !llvm.ptr
      %7085 = arith.constant 7 : i64
      %7086 = func.call @cc_make_string(%7084, %7085) : (!llvm.ptr, i64) -> i64
      %7087 = func.call @cc_intern(%7083, %7086) : (i64, i64) -> i64
      %7088 = func.call @cc_nil_value() : () -> i64
      %7089 = func.call @cc_cons(%7087, %7088) : (i64, i64) -> i64
      %7090 = func.call @cc_values_pack(%7089) : (i64) -> i64
      %7091 = arith.constant 97 : i64
      %7092 = func.call @cc_box_character(%7091) : (i64) -> i64
      func.call @stack_push_pointer(%7092) : (i64) -> ()
      %7093 = arith.constant 98 : i64
      %7094 = func.call @cc_box_character(%7093) : (i64) -> i64
      func.call @stack_push_pointer(%7094) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7095 = func.call @stack_pop_pointer() : () -> i64
      %7096 = func.call @stack_pop_pointer() : () -> i64
      %7097 = func.call @cc_cons(%7096, %7095) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_625 = arith.constant 0 : i64
      %7098 = arith.addi %7097, %__rlasp_stack_elide_zero_625 : i64
      %7099 = func.call @stack_pop_pointer() : () -> i64
      %7100 = func.call @cc_cons(%7099, %7098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7100) : (i64) -> ()
      %7101 = arith.constant 99 : i64
      %7102 = func.call @cc_box_character(%7101) : (i64) -> i64
      func.call @stack_push_pointer(%7102) : (i64) -> ()
      %7103 = arith.constant 100 : i64
      %7104 = func.call @cc_box_character(%7103) : (i64) -> i64
      func.call @stack_push_pointer(%7104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7105 = func.call @stack_pop_pointer() : () -> i64
      %7106 = func.call @stack_pop_pointer() : () -> i64
      %7107 = func.call @cc_cons(%7106, %7105) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_626 = arith.constant 0 : i64
      %7108 = arith.addi %7107, %__rlasp_stack_elide_zero_626 : i64
      %7109 = func.call @stack_pop_pointer() : () -> i64
      %7110 = func.call @cc_cons(%7109, %7108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7111 = func.call @stack_pop_pointer() : () -> i64
      %7112 = func.call @stack_pop_pointer() : () -> i64
      %7113 = func.call @cc_cons(%7112, %7111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_627 = arith.constant 0 : i64
      %7114 = arith.addi %7113, %__rlasp_stack_elide_zero_627 : i64
      %7115 = func.call @stack_pop_pointer() : () -> i64
      %7116 = func.call @cc_cons(%7115, %7114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_628 = arith.constant 0 : i64
      %7117 = arith.addi %7116, %__rlasp_stack_elide_zero_628 : i64
      %7118 = func.call @cc_nil_value() : () -> i64
      %7119 = func.call @cc_errorp(%7059) : (i64) -> i64
      %7120 = arith.cmpi ne, %7119, %7118 : i64
      %7121 = arith.cmpi eq, %7118, %7118 : i64
      %7122 = arith.andi %7120, %7121 : i1
      %7123 = scf.if %7122 -> (i64) {
        scf.yield %7059 : i64
      } else {
        scf.yield %7118 : i64
      }
      %7124 = func.call @cc_errorp(%7066) : (i64) -> i64
      %7125 = arith.cmpi ne, %7124, %7118 : i64
      %7126 = arith.cmpi eq, %7123, %7118 : i64
      %7127 = arith.andi %7125, %7126 : i1
      %7128 = scf.if %7127 -> (i64) {
        scf.yield %7066 : i64
      } else {
        scf.yield %7123 : i64
      }
      %7129 = func.call @cc_errorp(%7080) : (i64) -> i64
      %7130 = arith.cmpi ne, %7129, %7118 : i64
      %7131 = arith.cmpi eq, %7128, %7118 : i64
      %7132 = arith.andi %7130, %7131 : i1
      %7133 = scf.if %7132 -> (i64) {
        scf.yield %7080 : i64
      } else {
        scf.yield %7128 : i64
      }
      %7134 = func.call @cc_errorp(%7087) : (i64) -> i64
      %7135 = arith.cmpi ne, %7134, %7118 : i64
      %7136 = arith.cmpi eq, %7133, %7118 : i64
      %7137 = arith.andi %7135, %7136 : i1
      %7138 = scf.if %7137 -> (i64) {
        scf.yield %7087 : i64
      } else {
        scf.yield %7133 : i64
      }
      %7139 = func.call @cc_errorp(%7117) : (i64) -> i64
      %7140 = arith.cmpi ne, %7139, %7118 : i64
      %7141 = arith.cmpi eq, %7138, %7118 : i64
      %7142 = arith.andi %7140, %7141 : i1
      %7143 = scf.if %7142 -> (i64) {
        scf.yield %7117 : i64
      } else {
        scf.yield %7138 : i64
      }
      %7144 = arith.cmpi ne, %7143, %7118 : i64
      scf.if %7144 {
        func.call @stack_push_pointer(%7143) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7059) : (i64) -> ()
        func.call @stack_push_pointer(%7066) : (i64) -> ()
        func.call @stack_push_pointer(%7080) : (i64) -> ()
        func.call @stack_push_pointer(%7087) : (i64) -> ()
        func.call @stack_push_pointer(%7117) : (i64) -> ()
        %7145 = llvm.mlir.addressof @str601 : !llvm.ptr
        %7146 = func.call @cc_make_function_ref_const(%7145) : (!llvm.ptr) -> i64
        %7147 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%7146, %7147) : (i64, i64) -> ()
      }
      %7148 = func.call @stack_pop_pointer() : () -> i64
      %7149 = func.call @cc_nil_value() : () -> i64
      %7150 = func.call @cc_nil_value() : () -> i64
      %7151 = func.call @cc_errorp(%7149) : (i64) -> i64
      %7152 = arith.cmpi ne, %7151, %7150 : i64
      %7153 = scf.if %7152 -> (i64) {
        scf.yield %7149 : i64
      } else {
        %7154 = arith.constant 4 : i64
        %7155 = func.call @cc_box_fixnum(%7154) : (i64) -> i64
        %7156 = llvm.mlir.addressof @str602 : !llvm.ptr
        %7157 = arith.constant 12 : i64
        %7158 = func.call @cc_make_string(%7156, %7157) : (!llvm.ptr, i64) -> i64
        %7159 = llvm.mlir.addressof @str603 : !llvm.ptr
        %7160 = arith.constant 7 : i64
        %7161 = func.call @cc_make_string(%7159, %7160) : (!llvm.ptr, i64) -> i64
        %7162 = func.call @cc_intern(%7158, %7161) : (i64, i64) -> i64
        %7163 = func.call @cc_nil_value() : () -> i64
        %7164 = func.call @cc_cons(%7162, %7163) : (i64, i64) -> i64
        %7165 = func.call @cc_values_pack(%7164) : (i64) -> i64
        %7166 = llvm.mlir.addressof @str604 : !llvm.ptr
        %7167 = arith.constant 9 : i64
        %7168 = func.call @cc_make_string(%7166, %7167) : (!llvm.ptr, i64) -> i64
        %7169 = llvm.mlir.addressof @str605 : !llvm.ptr
        %7170 = arith.constant 11 : i64
        %7171 = func.call @cc_make_string(%7169, %7170) : (!llvm.ptr, i64) -> i64
        %7172 = func.call @cc_intern(%7168, %7171) : (i64, i64) -> i64
        %7173 = func.call @cc_nil_value() : () -> i64
        %7174 = func.call @cc_cons(%7172, %7173) : (i64, i64) -> i64
        %7175 = func.call @cc_values_pack(%7174) : (i64) -> i64
        %__rlasp_stack_elide_zero_629 = arith.constant 0 : i64
        %7176 = arith.addi %7172, %__rlasp_stack_elide_zero_629 : i64
        %7177 = llvm.mlir.addressof @str606 : !llvm.ptr
        %7178 = arith.constant 12 : i64
        %7179 = func.call @cc_make_string(%7177, %7178) : (!llvm.ptr, i64) -> i64
        %7180 = llvm.mlir.addressof @str607 : !llvm.ptr
        %7181 = arith.constant 7 : i64
        %7182 = func.call @cc_make_string(%7180, %7181) : (!llvm.ptr, i64) -> i64
        %7183 = func.call @cc_intern(%7179, %7182) : (i64, i64) -> i64
        %7184 = func.call @cc_nil_value() : () -> i64
        %7185 = func.call @cc_cons(%7183, %7184) : (i64, i64) -> i64
        %7186 = func.call @cc_values_pack(%7185) : (i64) -> i64
        %7187 = func.call @cc_nil_value() : () -> i64
        %7188 = func.call @cc_errorp(%7155) : (i64) -> i64
        %7189 = arith.cmpi ne, %7188, %7187 : i64
        %7190 = arith.cmpi eq, %7187, %7187 : i64
        %7191 = arith.andi %7189, %7190 : i1
        %7192 = scf.if %7191 -> (i64) {
          scf.yield %7155 : i64
        } else {
          scf.yield %7187 : i64
        }
        %7193 = func.call @cc_errorp(%7162) : (i64) -> i64
        %7194 = arith.cmpi ne, %7193, %7187 : i64
        %7195 = arith.cmpi eq, %7192, %7187 : i64
        %7196 = arith.andi %7194, %7195 : i1
        %7197 = scf.if %7196 -> (i64) {
          scf.yield %7162 : i64
        } else {
          scf.yield %7192 : i64
        }
        %7198 = func.call @cc_errorp(%7176) : (i64) -> i64
        %7199 = arith.cmpi ne, %7198, %7187 : i64
        %7200 = arith.cmpi eq, %7197, %7187 : i64
        %7201 = arith.andi %7199, %7200 : i1
        %7202 = scf.if %7201 -> (i64) {
          scf.yield %7176 : i64
        } else {
          scf.yield %7197 : i64
        }
        %7203 = func.call @cc_errorp(%7183) : (i64) -> i64
        %7204 = arith.cmpi ne, %7203, %7187 : i64
        %7205 = arith.cmpi eq, %7202, %7187 : i64
        %7206 = arith.andi %7204, %7205 : i1
        %7207 = scf.if %7206 -> (i64) {
          scf.yield %7183 : i64
        } else {
          scf.yield %7202 : i64
        }
        %7208 = func.call @cc_errorp(%7148) : (i64) -> i64
        %7209 = arith.cmpi ne, %7208, %7187 : i64
        %7210 = arith.cmpi eq, %7207, %7187 : i64
        %7211 = arith.andi %7209, %7210 : i1
        %7212 = scf.if %7211 -> (i64) {
          scf.yield %7148 : i64
        } else {
          scf.yield %7207 : i64
        }
        %7213 = arith.cmpi ne, %7212, %7187 : i64
        scf.if %7213 {
          func.call @stack_push_pointer(%7212) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7155) : (i64) -> ()
          func.call @stack_push_pointer(%7162) : (i64) -> ()
          func.call @stack_push_pointer(%7176) : (i64) -> ()
          func.call @stack_push_pointer(%7183) : (i64) -> ()
          func.call @stack_push_pointer(%7148) : (i64) -> ()
          %7214 = llvm.mlir.addressof @str608 : !llvm.ptr
          %7215 = func.call @cc_make_function_ref_const(%7214) : (!llvm.ptr) -> i64
          %7216 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%7215, %7216) : (i64, i64) -> ()
        }
        %7217 = func.call @stack_pop_pointer() : () -> i64
        %7218 = func.call @cc_nil_value() : () -> i64
        %7219 = func.call @cc_errorp(%7217) : (i64) -> i64
        %7220 = arith.cmpi ne, %7219, %7218 : i64
        %7221 = arith.cmpi eq, %7218, %7218 : i64
        %7222 = arith.andi %7220, %7221 : i1
        %7223 = scf.if %7222 -> (i64) {
          scf.yield %7217 : i64
        } else {
          scf.yield %7218 : i64
        }
        %7224 = arith.cmpi ne, %7223, %7218 : i64
        scf.if %7224 {
          func.call @stack_push_pointer(%7223) : (i64) -> ()
        } else {
          %7225 = func.call @cc_nil_value() : () -> i64
          %7226 = func.call @cc_cons(%7217, %7225) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7226) : (i64) -> ()
          func.call @cc_print_stack() : () -> ()
        }
        %7227 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7227 : i64
      }
      %__rlasp_stack_elide_zero_630 = arith.constant 0 : i64
      %7228 = arith.addi %7153, %__rlasp_stack_elide_zero_630 : i64
      %7229 = func.call @cc_nil_value() : () -> i64
      %7230 = func.call @cc_cons(%7228, %7229) : (i64, i64) -> i64
      %7231 = func.call @cc_not(%7230) : (i64) -> i64
      %__rlasp_stack_elide_zero_631 = arith.constant 0 : i64
      %7232 = arith.addi %7231, %__rlasp_stack_elide_zero_631 : i64
      %7233 = func.call @cc_nil_value() : () -> i64
      %7234 = func.call @cc_cons(%7232, %7233) : (i64, i64) -> i64
      %7235 = func.call @cc_not(%7234) : (i64) -> i64
      %__rlasp_stack_elide_zero_632 = arith.constant 0 : i64
      %7236 = arith.addi %7235, %__rlasp_stack_elide_zero_632 : i64
      scf.yield %7236 : i64
    }
    func.call @stack_push_pointer(%7050) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958552"() {
    %7432 = func.call @cc_nil_value() : () -> i64
    %7433 = func.call @cc_nil_value() : () -> i64
    %7434 = func.call @cc_errorp(%7432) : (i64) -> i64
    %7435 = arith.cmpi ne, %7434, %7433 : i64
    %7436 = scf.if %7435 -> (i64) {
      scf.yield %7432 : i64
    } else {
      %7437 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %7438 = func.call @cc_nil_value() : () -> i64
      %7439 = func.call @cc_nil_value() : () -> i64
      %7440 = func.call @cc_errorp(%7438) : (i64) -> i64
      %7441 = arith.cmpi ne, %7440, %7439 : i64
      %7442 = scf.if %7441 -> (i64) {
        scf.yield %7438 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %7443 = llvm.mlir.addressof @str627 : !llvm.ptr
        %7444 = arith.constant 22 : i64
        %7445 = func.call @cc_make_string(%7443, %7444) : (!llvm.ptr, i64) -> i64
        %7446 = llvm.mlir.addressof @str628 : !llvm.ptr
        %7447 = arith.constant 11 : i64
        %7448 = func.call @cc_make_string(%7446, %7447) : (!llvm.ptr, i64) -> i64
        %7449 = func.call @cc_intern(%7445, %7448) : (i64, i64) -> i64
        %7450 = func.call @cc_nil_value() : () -> i64
        %7451 = func.call @cc_cons(%7449, %7450) : (i64, i64) -> i64
        %7452 = func.call @cc_values_pack(%7451) : (i64) -> i64
        %7453 = func.call @cc_symbol_value(%7449) : (i64) -> i64
        %7454 = arith.constant 1 : i64
        %7455 = func.call @cc_box_fixnum(%7454) : (i64) -> i64
        %7457 = arith.constant 3 : i64
        %7456 = arith.andi %7453, %7457 : i64
        %7458 = arith.constant 0 : i64
        %7459 = arith.cmpi eq, %7456, %7458 : i64
        %7461 = arith.constant 3 : i64
        %7460 = arith.andi %7455, %7461 : i64
        %7462 = arith.constant 0 : i64
        %7463 = arith.cmpi eq, %7460, %7462 : i64
        %7464 = arith.andi %7459, %7463 : i1
        %7465 = scf.if %7464 -> (i64) {
          %7466 = arith.constant 2 : i64
          %7467 = arith.shrsi %7453, %7466 : i64
          %7468 = arith.constant 2 : i64
          %7469 = arith.shrsi %7455, %7468 : i64
          %7470 = arith.addi %7467, %7469 : i64
          %7471 = arith.constant -2305843009213693952 : i64
          %7472 = arith.constant 2305843009213693951 : i64
          %7473 = arith.cmpi sge, %7470, %7471 : i64
          %7474 = arith.cmpi sle, %7470, %7472 : i64
          %7475 = arith.andi %7473, %7474 : i1
          %7476 = scf.if %7475 -> (i64) {
            %7477 = arith.constant 2 : i64
            %7478 = arith.shli %7470, %7477 : i64
            scf.yield %7478 : i64
          } else {
            %7479 = func.call @cc_add(%7453, %7455) : (i64, i64) -> i64
            scf.yield %7479 : i64
          }
          scf.yield %7476 : i64
        } else {
          %7480 = func.call @cc_add(%7453, %7455) : (i64, i64) -> i64
          scf.yield %7480 : i64
        }
        %__rlasp_stack_elide_zero_633 = arith.constant 0 : i64
        %7481 = arith.addi %7465, %__rlasp_stack_elide_zero_633 : i64
        %7482 = func.call @cc_nil_value() : () -> i64
        %7483 = func.call @cc_errorp(%7481) : (i64) -> i64
        %7484 = arith.cmpi ne, %7483, %7482 : i64
        %7485 = arith.cmpi eq, %7482, %7482 : i64
        %7486 = arith.andi %7484, %7485 : i1
        %7487 = scf.if %7486 -> (i64) {
          scf.yield %7481 : i64
        } else {
          scf.yield %7482 : i64
        }
        %7488 = arith.cmpi ne, %7487, %7482 : i64
        scf.if %7488 {
          func.call @stack_push_pointer(%7487) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7481) : (i64) -> ()
          %7489 = llvm.mlir.addressof @str629 : !llvm.ptr
          %7490 = func.call @cc_make_function_ref_const(%7489) : (!llvm.ptr) -> i64
          %7491 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%7490, %7491) : (i64, i64) -> ()
        }
        %7492 = func.call @stack_pop_pointer() : () -> i64
        %7493 = func.call @cc_errorp(%7492) : (i64) -> i64
        %7494 = func.call @cc_nil_value() : () -> i64
        %7495 = arith.cmpi ne, %7493, %7494 : i64
        scf.if %7495 {
          func.call @stack_push_pointer(%7492) : (i64) -> ()
        } else {
          %7496 = func.call @cc_multiple_value_list(%7492) : (i64) -> i64
          func.call @stack_push_pointer(%7496) : (i64) -> ()
        }
        %7497 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %7498 = func.call @stack_pop_pointer() : () -> i64
        %7499 = func.call @cc_nil_value() : () -> i64
        %7500 = func.call @cc_maybe_error_from_multiple_value_list(%7497) : (i64) -> i64
        %7501 = func.call @cc_errorp(%7500) : (i64) -> i64
        %7502 = arith.cmpi ne, %7501, %7499 : i64
        %7503 = arith.cmpi eq, %7499, %7499 : i64
        %7504 = arith.andi %7502, %7503 : i1
        %7505 = scf.if %7504 -> (i64) {
          scf.yield %7500 : i64
        } else {
          scf.yield %7499 : i64
        }
        %7506 = arith.cmpi ne, %7505, %7499 : i64
        scf.if %7506 {
          func.call @stack_push_pointer(%7505) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %7507 = func.call @stack_pop_pointer() : () -> i64
          %7508 = func.call @cc_cons(%7498, %7507) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_634 = arith.constant 0 : i64
          %7509 = arith.addi %7508, %__rlasp_stack_elide_zero_634 : i64
          %7510 = func.call @cc_cons(%7497, %7509) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_635 = arith.constant 0 : i64
          %7511 = arith.addi %7510, %__rlasp_stack_elide_zero_635 : i64
          %7512 = func.call @cc_values_pack(%7511) : (i64) -> i64
          func.call @stack_push_pointer(%7512) : (i64) -> ()
        }
        %7513 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7513 : i64
      }
      %__rlasp_stack_elide_zero_636 = arith.constant 0 : i64
      %7514 = arith.addi %7442, %__rlasp_stack_elide_zero_636 : i64
      %7515 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %7516 = func.call @cc_errorp(%7514) : (i64) -> i64
      %7517 = func.call @cc_nil_value() : () -> i64
      %7518 = arith.cmpi ne, %7516, %7517 : i64
      scf.if %7518 {
        %7519 = func.call @cc_condition_value(%7514) : (i64) -> i64
        %7520 = func.call @cc_values2(%7517, %7519) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7520) : (i64) -> ()
      } else {
        %7521 = func.call @cc_multiple_value_list(%7514) : (i64) -> i64
        %7522 = func.call @cc_values_pack(%7521) : (i64) -> i64
        func.call @stack_push_pointer(%7522) : (i64) -> ()
      }
      %7523 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7523 : i64
    }
    func.call @stack_push_pointer(%7436) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958553"() {
    %7748 = func.call @cc_nil_value() : () -> i64
    %7749 = func.call @cc_nil_value() : () -> i64
    %7750 = func.call @cc_errorp(%7748) : (i64) -> i64
    %7751 = arith.cmpi ne, %7750, %7749 : i64
    %7752 = scf.if %7751 -> (i64) {
      scf.yield %7748 : i64
    } else {
      %7753 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %7754 = func.call @cc_nil_value() : () -> i64
      %7755 = func.call @cc_nil_value() : () -> i64
      %7756 = func.call @cc_errorp(%7754) : (i64) -> i64
      %7757 = arith.cmpi ne, %7756, %7755 : i64
      %7758 = scf.if %7757 -> (i64) {
        scf.yield %7754 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %7759 = llvm.mlir.addressof @str652 : !llvm.ptr
        %7760 = arith.constant 22 : i64
        %7761 = func.call @cc_make_string(%7759, %7760) : (!llvm.ptr, i64) -> i64
        %7762 = llvm.mlir.addressof @str653 : !llvm.ptr
        %7763 = arith.constant 11 : i64
        %7764 = func.call @cc_make_string(%7762, %7763) : (!llvm.ptr, i64) -> i64
        %7765 = func.call @cc_intern(%7761, %7764) : (i64, i64) -> i64
        %7766 = func.call @cc_nil_value() : () -> i64
        %7767 = func.call @cc_cons(%7765, %7766) : (i64, i64) -> i64
        %7768 = func.call @cc_values_pack(%7767) : (i64) -> i64
        %7769 = func.call @cc_symbol_value(%7765) : (i64) -> i64
        %7770 = arith.constant 1 : i64
        %7771 = func.call @cc_box_fixnum(%7770) : (i64) -> i64
        %7773 = arith.constant 3 : i64
        %7772 = arith.andi %7769, %7773 : i64
        %7774 = arith.constant 0 : i64
        %7775 = arith.cmpi eq, %7772, %7774 : i64
        %7777 = arith.constant 3 : i64
        %7776 = arith.andi %7771, %7777 : i64
        %7778 = arith.constant 0 : i64
        %7779 = arith.cmpi eq, %7776, %7778 : i64
        %7780 = arith.andi %7775, %7779 : i1
        %7781 = scf.if %7780 -> (i64) {
          %7782 = arith.constant 2 : i64
          %7783 = arith.shrsi %7769, %7782 : i64
          %7784 = arith.constant 2 : i64
          %7785 = arith.shrsi %7771, %7784 : i64
          %7786 = arith.addi %7783, %7785 : i64
          %7787 = arith.constant -2305843009213693952 : i64
          %7788 = arith.constant 2305843009213693951 : i64
          %7789 = arith.cmpi sge, %7786, %7787 : i64
          %7790 = arith.cmpi sle, %7786, %7788 : i64
          %7791 = arith.andi %7789, %7790 : i1
          %7792 = scf.if %7791 -> (i64) {
            %7793 = arith.constant 2 : i64
            %7794 = arith.shli %7786, %7793 : i64
            scf.yield %7794 : i64
          } else {
            %7795 = func.call @cc_add(%7769, %7771) : (i64, i64) -> i64
            scf.yield %7795 : i64
          }
          scf.yield %7792 : i64
        } else {
          %7796 = func.call @cc_add(%7769, %7771) : (i64, i64) -> i64
          scf.yield %7796 : i64
        }
        %__rlasp_stack_elide_zero_637 = arith.constant 0 : i64
        %7797 = arith.addi %7781, %__rlasp_stack_elide_zero_637 : i64
        %7798 = func.call @cc_nil_value() : () -> i64
        %7799 = func.call @cc_errorp(%7797) : (i64) -> i64
        %7800 = arith.cmpi ne, %7799, %7798 : i64
        %7801 = arith.cmpi eq, %7798, %7798 : i64
        %7802 = arith.andi %7800, %7801 : i1
        %7803 = scf.if %7802 -> (i64) {
          scf.yield %7797 : i64
        } else {
          scf.yield %7798 : i64
        }
        %7804 = arith.cmpi ne, %7803, %7798 : i64
        scf.if %7804 {
          func.call @stack_push_pointer(%7803) : (i64) -> ()
        } else {
          %7805 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%7805) : (i64) -> ()
          %__rlasp_stack_elide_zero_638 = arith.constant 0 : i64
          %7806 = arith.addi %7797, %__rlasp_stack_elide_zero_638 : i64
          %7807 = func.call @stack_pop_pointer() : () -> i64
          %7808 = func.call @cc_cons(%7806, %7807) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7808) : (i64) -> ()
        }
        %7809 = func.call @stack_pop_pointer() : () -> i64
        %7810 = func.call @cc_nil_value() : () -> i64
        %7811 = func.call @cc_errorp(%7809) : (i64) -> i64
        %7812 = arith.cmpi ne, %7811, %7810 : i64
        %7813 = arith.cmpi eq, %7810, %7810 : i64
        %7814 = arith.andi %7812, %7813 : i1
        %7815 = scf.if %7814 -> (i64) {
          scf.yield %7809 : i64
        } else {
          scf.yield %7810 : i64
        }
        %7816 = arith.cmpi ne, %7815, %7810 : i64
        scf.if %7816 {
          func.call @stack_push_pointer(%7815) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7809) : (i64) -> ()
          %7817 = llvm.mlir.addressof @str654 : !llvm.ptr
          %7818 = func.call @cc_make_function_ref_const(%7817) : (!llvm.ptr) -> i64
          %7819 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%7818, %7819) : (i64, i64) -> ()
        }
        %7820 = func.call @stack_pop_pointer() : () -> i64
        %7821 = func.call @cc_errorp(%7820) : (i64) -> i64
        %7822 = func.call @cc_nil_value() : () -> i64
        %7823 = arith.cmpi ne, %7821, %7822 : i64
        scf.if %7823 {
          func.call @stack_push_pointer(%7820) : (i64) -> ()
        } else {
          %7824 = func.call @cc_multiple_value_list(%7820) : (i64) -> i64
          func.call @stack_push_pointer(%7824) : (i64) -> ()
        }
        %7825 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %7826 = func.call @stack_pop_pointer() : () -> i64
        %7827 = func.call @cc_nil_value() : () -> i64
        %7828 = func.call @cc_maybe_error_from_multiple_value_list(%7825) : (i64) -> i64
        %7829 = func.call @cc_errorp(%7828) : (i64) -> i64
        %7830 = arith.cmpi ne, %7829, %7827 : i64
        %7831 = arith.cmpi eq, %7827, %7827 : i64
        %7832 = arith.andi %7830, %7831 : i1
        %7833 = scf.if %7832 -> (i64) {
          scf.yield %7828 : i64
        } else {
          scf.yield %7827 : i64
        }
        %7834 = arith.cmpi ne, %7833, %7827 : i64
        scf.if %7834 {
          func.call @stack_push_pointer(%7833) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %7835 = func.call @stack_pop_pointer() : () -> i64
          %7836 = func.call @cc_cons(%7826, %7835) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_639 = arith.constant 0 : i64
          %7837 = arith.addi %7836, %__rlasp_stack_elide_zero_639 : i64
          %7838 = func.call @cc_cons(%7825, %7837) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_640 = arith.constant 0 : i64
          %7839 = arith.addi %7838, %__rlasp_stack_elide_zero_640 : i64
          %7840 = func.call @cc_values_pack(%7839) : (i64) -> i64
          func.call @stack_push_pointer(%7840) : (i64) -> ()
        }
        %7841 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7841 : i64
      }
      %__rlasp_stack_elide_zero_641 = arith.constant 0 : i64
      %7842 = arith.addi %7758, %__rlasp_stack_elide_zero_641 : i64
      %7843 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %7844 = func.call @cc_errorp(%7842) : (i64) -> i64
      %7845 = func.call @cc_nil_value() : () -> i64
      %7846 = arith.cmpi ne, %7844, %7845 : i64
      scf.if %7846 {
        %7847 = func.call @cc_condition_value(%7842) : (i64) -> i64
        %7848 = func.call @cc_values2(%7845, %7847) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7848) : (i64) -> ()
      } else {
        %7849 = func.call @cc_multiple_value_list(%7842) : (i64) -> i64
        %7850 = func.call @cc_values_pack(%7849) : (i64) -> i64
        func.call @stack_push_pointer(%7850) : (i64) -> ()
      }
      %7851 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7851 : i64
    }
    func.call @stack_push_pointer(%7752) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958554"() {
    %8054 = func.call @cc_nil_value() : () -> i64
    %8055 = func.call @cc_nil_value() : () -> i64
    %8056 = func.call @cc_errorp(%8054) : (i64) -> i64
    %8057 = arith.cmpi ne, %8056, %8055 : i64
    %8058 = scf.if %8057 -> (i64) {
      scf.yield %8054 : i64
    } else {
      %8059 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8060 = func.call @cc_nil_value() : () -> i64
      %8061 = func.call @cc_nil_value() : () -> i64
      %8062 = func.call @cc_errorp(%8060) : (i64) -> i64
      %8063 = arith.cmpi ne, %8062, %8061 : i64
      %8064 = scf.if %8063 -> (i64) {
        scf.yield %8060 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %8065 = func.call @stack_pop_pointer() : () -> i64
        %8066 = arith.constant 13 : i64
        func.call @stack_push_fixnum(%8066) : (i64) -> ()
        %8067 = func.call @stack_pop_pointer() : () -> i64
        %8068 = func.call @cc_nil_value() : () -> i64
        %8069 = func.call @cc_errorp(%8065) : (i64) -> i64
        %8070 = arith.cmpi ne, %8069, %8068 : i64
        %8071 = arith.cmpi eq, %8068, %8068 : i64
        %8072 = arith.andi %8070, %8071 : i1
        %8073 = scf.if %8072 -> (i64) {
          scf.yield %8065 : i64
        } else {
          scf.yield %8068 : i64
        }
        %8074 = func.call @cc_errorp(%8067) : (i64) -> i64
        %8075 = arith.cmpi ne, %8074, %8068 : i64
        %8076 = arith.cmpi eq, %8073, %8068 : i64
        %8077 = arith.andi %8075, %8076 : i1
        %8078 = scf.if %8077 -> (i64) {
          scf.yield %8067 : i64
        } else {
          scf.yield %8073 : i64
        }
        %8079 = arith.cmpi ne, %8078, %8068 : i64
        scf.if %8079 {
          func.call @stack_push_pointer(%8078) : (i64) -> ()
        } else {
          %8080 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%8080) : (i64) -> ()
          %__rlasp_stack_elide_zero_642 = arith.constant 0 : i64
          %8081 = arith.addi %8067, %__rlasp_stack_elide_zero_642 : i64
          %8082 = func.call @stack_pop_pointer() : () -> i64
          %8083 = func.call @cc_cons(%8081, %8082) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8083) : (i64) -> ()
          %__rlasp_stack_elide_zero_643 = arith.constant 0 : i64
          %8084 = arith.addi %8065, %__rlasp_stack_elide_zero_643 : i64
          %8085 = func.call @stack_pop_pointer() : () -> i64
          %8086 = func.call @cc_cons(%8084, %8085) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8086) : (i64) -> ()
        }
        %8087 = func.call @stack_pop_pointer() : () -> i64
        %8088 = func.call @cc_nil_value() : () -> i64
        %8089 = func.call @cc_errorp(%8087) : (i64) -> i64
        %8090 = arith.cmpi ne, %8089, %8088 : i64
        %8091 = arith.cmpi eq, %8088, %8088 : i64
        %8092 = arith.andi %8090, %8091 : i1
        %8093 = scf.if %8092 -> (i64) {
          scf.yield %8087 : i64
        } else {
          scf.yield %8088 : i64
        }
        %8094 = arith.cmpi ne, %8093, %8088 : i64
        scf.if %8094 {
          func.call @stack_push_pointer(%8093) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8087) : (i64) -> ()
          %8095 = llvm.mlir.addressof @str673 : !llvm.ptr
          %8096 = func.call @cc_make_function_ref_const(%8095) : (!llvm.ptr) -> i64
          %8097 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%8096, %8097) : (i64, i64) -> ()
        }
        %8098 = func.call @stack_pop_pointer() : () -> i64
        %8099 = func.call @cc_errorp(%8098) : (i64) -> i64
        %8100 = func.call @cc_nil_value() : () -> i64
        %8101 = arith.cmpi ne, %8099, %8100 : i64
        scf.if %8101 {
          func.call @stack_push_pointer(%8098) : (i64) -> ()
        } else {
          %8102 = func.call @cc_multiple_value_list(%8098) : (i64) -> i64
          func.call @stack_push_pointer(%8102) : (i64) -> ()
        }
        %8103 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %8104 = func.call @stack_pop_pointer() : () -> i64
        %8105 = func.call @cc_nil_value() : () -> i64
        %8106 = func.call @cc_maybe_error_from_multiple_value_list(%8103) : (i64) -> i64
        %8107 = func.call @cc_errorp(%8106) : (i64) -> i64
        %8108 = arith.cmpi ne, %8107, %8105 : i64
        %8109 = arith.cmpi eq, %8105, %8105 : i64
        %8110 = arith.andi %8108, %8109 : i1
        %8111 = scf.if %8110 -> (i64) {
          scf.yield %8106 : i64
        } else {
          scf.yield %8105 : i64
        }
        %8112 = arith.cmpi ne, %8111, %8105 : i64
        scf.if %8112 {
          func.call @stack_push_pointer(%8111) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %8113 = func.call @stack_pop_pointer() : () -> i64
          %8114 = func.call @cc_cons(%8104, %8113) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_644 = arith.constant 0 : i64
          %8115 = arith.addi %8114, %__rlasp_stack_elide_zero_644 : i64
          %8116 = func.call @cc_cons(%8103, %8115) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_645 = arith.constant 0 : i64
          %8117 = arith.addi %8116, %__rlasp_stack_elide_zero_645 : i64
          %8118 = func.call @cc_values_pack(%8117) : (i64) -> i64
          func.call @stack_push_pointer(%8118) : (i64) -> ()
        }
        %8119 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8119 : i64
      }
      %__rlasp_stack_elide_zero_646 = arith.constant 0 : i64
      %8120 = arith.addi %8064, %__rlasp_stack_elide_zero_646 : i64
      %8121 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %8122 = func.call @cc_errorp(%8120) : (i64) -> i64
      %8123 = func.call @cc_nil_value() : () -> i64
      %8124 = arith.cmpi ne, %8122, %8123 : i64
      scf.if %8124 {
        %8125 = func.call @cc_condition_value(%8120) : (i64) -> i64
        %8126 = func.call @cc_values2(%8123, %8125) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8126) : (i64) -> ()
      } else {
        %8127 = func.call @cc_multiple_value_list(%8120) : (i64) -> i64
        %8128 = func.call @cc_values_pack(%8127) : (i64) -> i64
        func.call @stack_push_pointer(%8128) : (i64) -> ()
      }
      %8129 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8129 : i64
    }
    func.call @stack_push_pointer(%8058) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958555"() {
    %8334 = func.call @cc_nil_value() : () -> i64
    %8335 = func.call @cc_nil_value() : () -> i64
    %8336 = func.call @cc_errorp(%8334) : (i64) -> i64
    %8337 = arith.cmpi ne, %8336, %8335 : i64
    %8338 = scf.if %8337 -> (i64) {
      scf.yield %8334 : i64
    } else {
      %8339 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8340 = func.call @cc_nil_value() : () -> i64
      %8341 = func.call @cc_nil_value() : () -> i64
      %8342 = func.call @cc_errorp(%8340) : (i64) -> i64
      %8343 = arith.cmpi ne, %8342, %8341 : i64
      %8344 = scf.if %8343 -> (i64) {
        scf.yield %8340 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %8345 = arith.constant 97 : i64
        %8346 = func.call @cc_box_character(%8345) : (i64) -> i64
        %__rlasp_stack_elide_zero_647 = arith.constant 0 : i64
        %8347 = arith.addi %8346, %__rlasp_stack_elide_zero_647 : i64
        %8348 = arith.constant 13 : i64
        func.call @stack_push_fixnum(%8348) : (i64) -> ()
        %8349 = func.call @stack_pop_pointer() : () -> i64
        %8350 = func.call @cc_nil_value() : () -> i64
        %8351 = func.call @cc_errorp(%8347) : (i64) -> i64
        %8352 = arith.cmpi ne, %8351, %8350 : i64
        %8353 = arith.cmpi eq, %8350, %8350 : i64
        %8354 = arith.andi %8352, %8353 : i1
        %8355 = scf.if %8354 -> (i64) {
          scf.yield %8347 : i64
        } else {
          scf.yield %8350 : i64
        }
        %8356 = func.call @cc_errorp(%8349) : (i64) -> i64
        %8357 = arith.cmpi ne, %8356, %8350 : i64
        %8358 = arith.cmpi eq, %8355, %8350 : i64
        %8359 = arith.andi %8357, %8358 : i1
        %8360 = scf.if %8359 -> (i64) {
          scf.yield %8349 : i64
        } else {
          scf.yield %8355 : i64
        }
        %8361 = arith.cmpi ne, %8360, %8350 : i64
        scf.if %8361 {
          func.call @stack_push_pointer(%8360) : (i64) -> ()
        } else {
          %8362 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%8362) : (i64) -> ()
          %__rlasp_stack_elide_zero_648 = arith.constant 0 : i64
          %8363 = arith.addi %8349, %__rlasp_stack_elide_zero_648 : i64
          %8364 = func.call @stack_pop_pointer() : () -> i64
          %8365 = func.call @cc_cons(%8363, %8364) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8365) : (i64) -> ()
          %__rlasp_stack_elide_zero_649 = arith.constant 0 : i64
          %8366 = arith.addi %8347, %__rlasp_stack_elide_zero_649 : i64
          %8367 = func.call @stack_pop_pointer() : () -> i64
          %8368 = func.call @cc_cons(%8366, %8367) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8368) : (i64) -> ()
        }
        %8369 = func.call @stack_pop_pointer() : () -> i64
        %8370 = func.call @cc_nil_value() : () -> i64
        %8371 = func.call @cc_errorp(%8369) : (i64) -> i64
        %8372 = arith.cmpi ne, %8371, %8370 : i64
        %8373 = arith.cmpi eq, %8370, %8370 : i64
        %8374 = arith.andi %8372, %8373 : i1
        %8375 = scf.if %8374 -> (i64) {
          scf.yield %8369 : i64
        } else {
          scf.yield %8370 : i64
        }
        %8376 = arith.cmpi ne, %8375, %8370 : i64
        scf.if %8376 {
          func.call @stack_push_pointer(%8375) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8369) : (i64) -> ()
          %8377 = llvm.mlir.addressof @str692 : !llvm.ptr
          %8378 = func.call @cc_make_function_ref_const(%8377) : (!llvm.ptr) -> i64
          %8379 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%8378, %8379) : (i64, i64) -> ()
        }
        %8380 = func.call @stack_pop_pointer() : () -> i64
        %8381 = func.call @cc_errorp(%8380) : (i64) -> i64
        %8382 = func.call @cc_nil_value() : () -> i64
        %8383 = arith.cmpi ne, %8381, %8382 : i64
        scf.if %8383 {
          func.call @stack_push_pointer(%8380) : (i64) -> ()
        } else {
          %8384 = func.call @cc_multiple_value_list(%8380) : (i64) -> i64
          func.call @stack_push_pointer(%8384) : (i64) -> ()
        }
        %8385 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %8386 = func.call @stack_pop_pointer() : () -> i64
        %8387 = func.call @cc_nil_value() : () -> i64
        %8388 = func.call @cc_maybe_error_from_multiple_value_list(%8385) : (i64) -> i64
        %8389 = func.call @cc_errorp(%8388) : (i64) -> i64
        %8390 = arith.cmpi ne, %8389, %8387 : i64
        %8391 = arith.cmpi eq, %8387, %8387 : i64
        %8392 = arith.andi %8390, %8391 : i1
        %8393 = scf.if %8392 -> (i64) {
          scf.yield %8388 : i64
        } else {
          scf.yield %8387 : i64
        }
        %8394 = arith.cmpi ne, %8393, %8387 : i64
        scf.if %8394 {
          func.call @stack_push_pointer(%8393) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %8395 = func.call @stack_pop_pointer() : () -> i64
          %8396 = func.call @cc_cons(%8386, %8395) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_650 = arith.constant 0 : i64
          %8397 = arith.addi %8396, %__rlasp_stack_elide_zero_650 : i64
          %8398 = func.call @cc_cons(%8385, %8397) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_651 = arith.constant 0 : i64
          %8399 = arith.addi %8398, %__rlasp_stack_elide_zero_651 : i64
          %8400 = func.call @cc_values_pack(%8399) : (i64) -> i64
          func.call @stack_push_pointer(%8400) : (i64) -> ()
        }
        %8401 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8401 : i64
      }
      %__rlasp_stack_elide_zero_652 = arith.constant 0 : i64
      %8402 = arith.addi %8344, %__rlasp_stack_elide_zero_652 : i64
      %8403 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %8404 = func.call @cc_errorp(%8402) : (i64) -> i64
      %8405 = func.call @cc_nil_value() : () -> i64
      %8406 = arith.cmpi ne, %8404, %8405 : i64
      scf.if %8406 {
        %8407 = func.call @cc_condition_value(%8402) : (i64) -> i64
        %8408 = func.call @cc_values2(%8405, %8407) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8408) : (i64) -> ()
      } else {
        %8409 = func.call @cc_multiple_value_list(%8402) : (i64) -> i64
        %8410 = func.call @cc_values_pack(%8409) : (i64) -> i64
        func.call @stack_push_pointer(%8410) : (i64) -> ()
      }
      %8411 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8411 : i64
    }
    func.call @stack_push_pointer(%8338) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958556"() {
    %8611 = func.call @cc_nil_value() : () -> i64
    %8612 = func.call @cc_nil_value() : () -> i64
    %8613 = func.call @cc_errorp(%8611) : (i64) -> i64
    %8614 = arith.cmpi ne, %8613, %8612 : i64
    %8615 = scf.if %8614 -> (i64) {
      scf.yield %8611 : i64
    } else {
      %8616 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8617 = func.call @cc_nil_value() : () -> i64
      %8618 = func.call @cc_nil_value() : () -> i64
      %8619 = func.call @cc_errorp(%8617) : (i64) -> i64
      %8620 = arith.cmpi ne, %8619, %8618 : i64
      %8621 = scf.if %8620 -> (i64) {
        scf.yield %8617 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %8622 = arith.constant -13 : i64
        func.call @stack_push_fixnum(%8622) : (i64) -> ()
        %8623 = func.call @stack_pop_pointer() : () -> i64
        %8624 = func.call @cc_nil_value() : () -> i64
        %8625 = func.call @cc_errorp(%8623) : (i64) -> i64
        %8626 = arith.cmpi ne, %8625, %8624 : i64
        %8627 = arith.cmpi eq, %8624, %8624 : i64
        %8628 = arith.andi %8626, %8627 : i1
        %8629 = scf.if %8628 -> (i64) {
          scf.yield %8623 : i64
        } else {
          scf.yield %8624 : i64
        }
        %8630 = arith.cmpi ne, %8629, %8624 : i64
        scf.if %8630 {
          func.call @stack_push_pointer(%8629) : (i64) -> ()
        } else {
          %8631 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%8631) : (i64) -> ()
          %__rlasp_stack_elide_zero_653 = arith.constant 0 : i64
          %8632 = arith.addi %8623, %__rlasp_stack_elide_zero_653 : i64
          %8633 = func.call @stack_pop_pointer() : () -> i64
          %8634 = func.call @cc_cons(%8632, %8633) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8634) : (i64) -> ()
        }
        %8635 = func.call @stack_pop_pointer() : () -> i64
        %8636 = func.call @cc_nil_value() : () -> i64
        %8637 = func.call @cc_errorp(%8635) : (i64) -> i64
        %8638 = arith.cmpi ne, %8637, %8636 : i64
        %8639 = arith.cmpi eq, %8636, %8636 : i64
        %8640 = arith.andi %8638, %8639 : i1
        %8641 = scf.if %8640 -> (i64) {
          scf.yield %8635 : i64
        } else {
          scf.yield %8636 : i64
        }
        %8642 = arith.cmpi ne, %8641, %8636 : i64
        scf.if %8642 {
          func.call @stack_push_pointer(%8641) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8635) : (i64) -> ()
          %8643 = llvm.mlir.addressof @str711 : !llvm.ptr
          %8644 = func.call @cc_make_function_ref_const(%8643) : (!llvm.ptr) -> i64
          %8645 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%8644, %8645) : (i64, i64) -> ()
        }
        %8646 = func.call @stack_pop_pointer() : () -> i64
        %8647 = func.call @cc_errorp(%8646) : (i64) -> i64
        %8648 = func.call @cc_nil_value() : () -> i64
        %8649 = arith.cmpi ne, %8647, %8648 : i64
        scf.if %8649 {
          func.call @stack_push_pointer(%8646) : (i64) -> ()
        } else {
          %8650 = func.call @cc_multiple_value_list(%8646) : (i64) -> i64
          func.call @stack_push_pointer(%8650) : (i64) -> ()
        }
        %8651 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %8652 = func.call @stack_pop_pointer() : () -> i64
        %8653 = func.call @cc_nil_value() : () -> i64
        %8654 = func.call @cc_maybe_error_from_multiple_value_list(%8651) : (i64) -> i64
        %8655 = func.call @cc_errorp(%8654) : (i64) -> i64
        %8656 = arith.cmpi ne, %8655, %8653 : i64
        %8657 = arith.cmpi eq, %8653, %8653 : i64
        %8658 = arith.andi %8656, %8657 : i1
        %8659 = scf.if %8658 -> (i64) {
          scf.yield %8654 : i64
        } else {
          scf.yield %8653 : i64
        }
        %8660 = arith.cmpi ne, %8659, %8653 : i64
        scf.if %8660 {
          func.call @stack_push_pointer(%8659) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %8661 = func.call @stack_pop_pointer() : () -> i64
          %8662 = func.call @cc_cons(%8652, %8661) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_654 = arith.constant 0 : i64
          %8663 = arith.addi %8662, %__rlasp_stack_elide_zero_654 : i64
          %8664 = func.call @cc_cons(%8651, %8663) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_655 = arith.constant 0 : i64
          %8665 = arith.addi %8664, %__rlasp_stack_elide_zero_655 : i64
          %8666 = func.call @cc_values_pack(%8665) : (i64) -> i64
          func.call @stack_push_pointer(%8666) : (i64) -> ()
        }
        %8667 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8667 : i64
      }
      %__rlasp_stack_elide_zero_656 = arith.constant 0 : i64
      %8668 = arith.addi %8621, %__rlasp_stack_elide_zero_656 : i64
      %8669 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %8670 = func.call @cc_errorp(%8668) : (i64) -> i64
      %8671 = func.call @cc_nil_value() : () -> i64
      %8672 = arith.cmpi ne, %8670, %8671 : i64
      scf.if %8672 {
        %8673 = func.call @cc_condition_value(%8668) : (i64) -> i64
        %8674 = func.call @cc_values2(%8671, %8673) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8674) : (i64) -> ()
      } else {
        %8675 = func.call @cc_multiple_value_list(%8668) : (i64) -> i64
        %8676 = func.call @cc_values_pack(%8675) : (i64) -> i64
        func.call @stack_push_pointer(%8676) : (i64) -> ()
      }
      %8677 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8677 : i64
    }
    func.call @stack_push_pointer(%8615) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958557"() {
    %8947 = func.call @cc_nil_value() : () -> i64
    %8948 = func.call @cc_nil_value() : () -> i64
    %8949 = func.call @cc_errorp(%8947) : (i64) -> i64
    %8950 = arith.cmpi ne, %8949, %8948 : i64
    %8951 = scf.if %8950 -> (i64) {
      scf.yield %8947 : i64
    } else {
      %8952 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8953 = func.call @cc_nil_value() : () -> i64
      %8954 = func.call @cc_nil_value() : () -> i64
      %8955 = func.call @cc_errorp(%8953) : (i64) -> i64
      %8956 = arith.cmpi ne, %8955, %8954 : i64
      %8957 = scf.if %8956 -> (i64) {
        scf.yield %8953 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %8958 = func.call @stack_pop_pointer() : () -> i64
        %8959 = func.call @cc_nil_value() : () -> i64
        %8960 = func.call @cc_errorp(%8958) : (i64) -> i64
        %8961 = arith.cmpi ne, %8960, %8959 : i64
        %8962 = scf.if %8961 -> (i64) {
          scf.yield %8958 : i64
        } else {
          %8963 = llvm.mlir.addressof @str740 : !llvm.ptr
          %8964 = arith.constant 22 : i64
          %8965 = func.call @cc_make_string(%8963, %8964) : (!llvm.ptr, i64) -> i64
          %8966 = llvm.mlir.addressof @str741 : !llvm.ptr
          %8967 = arith.constant 11 : i64
          %8968 = func.call @cc_make_string(%8966, %8967) : (!llvm.ptr, i64) -> i64
          %8969 = func.call @cc_intern(%8965, %8968) : (i64, i64) -> i64
          %8970 = func.call @cc_nil_value() : () -> i64
          %8971 = func.call @cc_cons(%8969, %8970) : (i64, i64) -> i64
          %8972 = func.call @cc_values_pack(%8971) : (i64) -> i64
          %8973 = func.call @cc_symbol_value(%8969) : (i64) -> i64
          %8974 = arith.constant 1 : i64
          %8975 = func.call @cc_box_fixnum(%8974) : (i64) -> i64
          %8977 = arith.constant 3 : i64
          %8976 = arith.andi %8973, %8977 : i64
          %8978 = arith.constant 0 : i64
          %8979 = arith.cmpi eq, %8976, %8978 : i64
          %8981 = arith.constant 3 : i64
          %8980 = arith.andi %8975, %8981 : i64
          %8982 = arith.constant 0 : i64
          %8983 = arith.cmpi eq, %8980, %8982 : i64
          %8984 = arith.andi %8979, %8983 : i1
          %8985 = scf.if %8984 -> (i64) {
            %8986 = arith.constant 2 : i64
            %8987 = arith.shrsi %8973, %8986 : i64
            %8988 = arith.constant 2 : i64
            %8989 = arith.shrsi %8975, %8988 : i64
            %8990 = arith.addi %8987, %8989 : i64
            %8991 = arith.constant -2305843009213693952 : i64
            %8992 = arith.constant 2305843009213693951 : i64
            %8993 = arith.cmpi sge, %8990, %8991 : i64
            %8994 = arith.cmpi sle, %8990, %8992 : i64
            %8995 = arith.andi %8993, %8994 : i1
            %8996 = scf.if %8995 -> (i64) {
              %8997 = arith.constant 2 : i64
              %8998 = arith.shli %8990, %8997 : i64
              scf.yield %8998 : i64
            } else {
              %8999 = func.call @cc_add(%8973, %8975) : (i64, i64) -> i64
              scf.yield %8999 : i64
            }
            scf.yield %8996 : i64
          } else {
            %9000 = func.call @cc_add(%8973, %8975) : (i64, i64) -> i64
            scf.yield %9000 : i64
          }
          %__rlasp_stack_elide_zero_657 = arith.constant 0 : i64
          %9001 = arith.addi %8985, %__rlasp_stack_elide_zero_657 : i64
          %9002 = func.call @cc_nil_value() : () -> i64
          %9003 = func.call @cc_errorp(%9001) : (i64) -> i64
          %9004 = arith.cmpi ne, %9003, %9002 : i64
          %9005 = arith.cmpi eq, %9002, %9002 : i64
          %9006 = arith.andi %9004, %9005 : i1
          %9007 = scf.if %9006 -> (i64) {
            scf.yield %9001 : i64
          } else {
            scf.yield %9002 : i64
          }
          %9008 = arith.cmpi ne, %9007, %9002 : i64
          scf.if %9008 {
            func.call @stack_push_pointer(%9007) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%9001) : (i64) -> ()
            %9009 = llvm.mlir.addressof @str742 : !llvm.ptr
            %9010 = func.call @cc_make_function_ref_const(%9009) : (!llvm.ptr) -> i64
            %9011 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%9010, %9011) : (i64, i64) -> ()
          }
          %9012 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9012 : i64
        }
        %__rlasp_stack_elide_zero_658 = arith.constant 0 : i64
        %9013 = arith.addi %8962, %__rlasp_stack_elide_zero_658 : i64
        %9014 = func.call @cc_errorp(%9013) : (i64) -> i64
        %9015 = func.call @cc_nil_value() : () -> i64
        %9016 = arith.cmpi ne, %9014, %9015 : i64
        scf.if %9016 {
          func.call @stack_push_pointer(%9013) : (i64) -> ()
        } else {
          %9017 = func.call @cc_multiple_value_list(%9013) : (i64) -> i64
          func.call @stack_push_pointer(%9017) : (i64) -> ()
        }
        %9018 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9019 = func.call @stack_pop_pointer() : () -> i64
        %9020 = func.call @cc_nil_value() : () -> i64
        %9021 = func.call @cc_maybe_error_from_multiple_value_list(%9018) : (i64) -> i64
        %9022 = func.call @cc_errorp(%9021) : (i64) -> i64
        %9023 = arith.cmpi ne, %9022, %9020 : i64
        %9024 = arith.cmpi eq, %9020, %9020 : i64
        %9025 = arith.andi %9023, %9024 : i1
        %9026 = scf.if %9025 -> (i64) {
          scf.yield %9021 : i64
        } else {
          scf.yield %9020 : i64
        }
        %9027 = arith.cmpi ne, %9026, %9020 : i64
        scf.if %9027 {
          func.call @stack_push_pointer(%9026) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %9028 = func.call @stack_pop_pointer() : () -> i64
          %9029 = func.call @cc_cons(%9019, %9028) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_659 = arith.constant 0 : i64
          %9030 = arith.addi %9029, %__rlasp_stack_elide_zero_659 : i64
          %9031 = func.call @cc_cons(%9018, %9030) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_660 = arith.constant 0 : i64
          %9032 = arith.addi %9031, %__rlasp_stack_elide_zero_660 : i64
          %9033 = func.call @cc_values_pack(%9032) : (i64) -> i64
          func.call @stack_push_pointer(%9033) : (i64) -> ()
        }
        %9034 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9034 : i64
      }
      %__rlasp_stack_elide_zero_661 = arith.constant 0 : i64
      %9035 = arith.addi %8957, %__rlasp_stack_elide_zero_661 : i64
      %9036 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %9037 = func.call @cc_errorp(%9035) : (i64) -> i64
      %9038 = func.call @cc_nil_value() : () -> i64
      %9039 = arith.cmpi ne, %9037, %9038 : i64
      scf.if %9039 {
        %9040 = func.call @cc_condition_value(%9035) : (i64) -> i64
        %9041 = func.call @cc_values2(%9038, %9040) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9041) : (i64) -> ()
      } else {
        %9042 = func.call @cc_multiple_value_list(%9035) : (i64) -> i64
        %9043 = func.call @cc_values_pack(%9042) : (i64) -> i64
        func.call @stack_push_pointer(%9043) : (i64) -> ()
      }
      %9044 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9044 : i64
    }
    func.call @stack_push_pointer(%8951) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958558"() {
    %9330 = func.call @cc_nil_value() : () -> i64
    %9331 = func.call @cc_nil_value() : () -> i64
    %9332 = func.call @cc_errorp(%9330) : (i64) -> i64
    %9333 = arith.cmpi ne, %9332, %9331 : i64
    %9334 = scf.if %9333 -> (i64) {
      scf.yield %9330 : i64
    } else {
      %9335 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %9336 = func.call @cc_nil_value() : () -> i64
      %9337 = func.call @cc_nil_value() : () -> i64
      %9338 = func.call @cc_errorp(%9336) : (i64) -> i64
      %9339 = arith.cmpi ne, %9338, %9337 : i64
      %9340 = scf.if %9339 -> (i64) {
        scf.yield %9336 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %9341 = func.call @stack_pop_pointer() : () -> i64
        %9342 = func.call @cc_nil_value() : () -> i64
        %9343 = func.call @cc_errorp(%9341) : (i64) -> i64
        %9344 = arith.cmpi ne, %9343, %9342 : i64
        %9345 = scf.if %9344 -> (i64) {
          scf.yield %9341 : i64
        } else {
          %9346 = llvm.mlir.addressof @str773 : !llvm.ptr
          %9347 = arith.constant 22 : i64
          %9348 = func.call @cc_make_string(%9346, %9347) : (!llvm.ptr, i64) -> i64
          %9349 = llvm.mlir.addressof @str774 : !llvm.ptr
          %9350 = arith.constant 11 : i64
          %9351 = func.call @cc_make_string(%9349, %9350) : (!llvm.ptr, i64) -> i64
          %9352 = func.call @cc_intern(%9348, %9351) : (i64, i64) -> i64
          %9353 = func.call @cc_nil_value() : () -> i64
          %9354 = func.call @cc_cons(%9352, %9353) : (i64, i64) -> i64
          %9355 = func.call @cc_values_pack(%9354) : (i64) -> i64
          %9356 = func.call @cc_symbol_value(%9352) : (i64) -> i64
          %9357 = arith.constant 1 : i64
          %9358 = func.call @cc_box_fixnum(%9357) : (i64) -> i64
          %9360 = arith.constant 3 : i64
          %9359 = arith.andi %9356, %9360 : i64
          %9361 = arith.constant 0 : i64
          %9362 = arith.cmpi eq, %9359, %9361 : i64
          %9364 = arith.constant 3 : i64
          %9363 = arith.andi %9358, %9364 : i64
          %9365 = arith.constant 0 : i64
          %9366 = arith.cmpi eq, %9363, %9365 : i64
          %9367 = arith.andi %9362, %9366 : i1
          %9368 = scf.if %9367 -> (i64) {
            %9369 = arith.constant 2 : i64
            %9370 = arith.shrsi %9356, %9369 : i64
            %9371 = arith.constant 2 : i64
            %9372 = arith.shrsi %9358, %9371 : i64
            %9373 = arith.addi %9370, %9372 : i64
            %9374 = arith.constant -2305843009213693952 : i64
            %9375 = arith.constant 2305843009213693951 : i64
            %9376 = arith.cmpi sge, %9373, %9374 : i64
            %9377 = arith.cmpi sle, %9373, %9375 : i64
            %9378 = arith.andi %9376, %9377 : i1
            %9379 = scf.if %9378 -> (i64) {
              %9380 = arith.constant 2 : i64
              %9381 = arith.shli %9373, %9380 : i64
              scf.yield %9381 : i64
            } else {
              %9382 = func.call @cc_add(%9356, %9358) : (i64, i64) -> i64
              scf.yield %9382 : i64
            }
            scf.yield %9379 : i64
          } else {
            %9383 = func.call @cc_add(%9356, %9358) : (i64, i64) -> i64
            scf.yield %9383 : i64
          }
          %__rlasp_stack_elide_zero_662 = arith.constant 0 : i64
          %9384 = arith.addi %9368, %__rlasp_stack_elide_zero_662 : i64
          %9385 = func.call @cc_nil_value() : () -> i64
          %9386 = func.call @cc_errorp(%9384) : (i64) -> i64
          %9387 = arith.cmpi ne, %9386, %9385 : i64
          %9388 = arith.cmpi eq, %9385, %9385 : i64
          %9389 = arith.andi %9387, %9388 : i1
          %9390 = scf.if %9389 -> (i64) {
            scf.yield %9384 : i64
          } else {
            scf.yield %9385 : i64
          }
          %9391 = arith.cmpi ne, %9390, %9385 : i64
          scf.if %9391 {
            func.call @stack_push_pointer(%9390) : (i64) -> ()
          } else {
            %9392 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%9392) : (i64) -> ()
            %__rlasp_stack_elide_zero_663 = arith.constant 0 : i64
            %9393 = arith.addi %9384, %__rlasp_stack_elide_zero_663 : i64
            %9394 = func.call @stack_pop_pointer() : () -> i64
            %9395 = func.call @cc_cons(%9393, %9394) : (i64, i64) -> i64
            func.call @stack_push_pointer(%9395) : (i64) -> ()
          }
          %9396 = func.call @stack_pop_pointer() : () -> i64
          %9397 = func.call @cc_nil_value() : () -> i64
          %9398 = func.call @cc_errorp(%9396) : (i64) -> i64
          %9399 = arith.cmpi ne, %9398, %9397 : i64
          %9400 = arith.cmpi eq, %9397, %9397 : i64
          %9401 = arith.andi %9399, %9400 : i1
          %9402 = scf.if %9401 -> (i64) {
            scf.yield %9396 : i64
          } else {
            scf.yield %9397 : i64
          }
          %9403 = arith.cmpi ne, %9402, %9397 : i64
          scf.if %9403 {
            func.call @stack_push_pointer(%9402) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%9396) : (i64) -> ()
            %9404 = llvm.mlir.addressof @str775 : !llvm.ptr
            %9405 = func.call @cc_make_function_ref_const(%9404) : (!llvm.ptr) -> i64
            %9406 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%9405, %9406) : (i64, i64) -> ()
          }
          %9407 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9407 : i64
        }
        %__rlasp_stack_elide_zero_664 = arith.constant 0 : i64
        %9408 = arith.addi %9345, %__rlasp_stack_elide_zero_664 : i64
        %9409 = func.call @cc_errorp(%9408) : (i64) -> i64
        %9410 = func.call @cc_nil_value() : () -> i64
        %9411 = arith.cmpi ne, %9409, %9410 : i64
        scf.if %9411 {
          func.call @stack_push_pointer(%9408) : (i64) -> ()
        } else {
          %9412 = func.call @cc_multiple_value_list(%9408) : (i64) -> i64
          func.call @stack_push_pointer(%9412) : (i64) -> ()
        }
        %9413 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9414 = func.call @stack_pop_pointer() : () -> i64
        %9415 = func.call @cc_nil_value() : () -> i64
        %9416 = func.call @cc_maybe_error_from_multiple_value_list(%9413) : (i64) -> i64
        %9417 = func.call @cc_errorp(%9416) : (i64) -> i64
        %9418 = arith.cmpi ne, %9417, %9415 : i64
        %9419 = arith.cmpi eq, %9415, %9415 : i64
        %9420 = arith.andi %9418, %9419 : i1
        %9421 = scf.if %9420 -> (i64) {
          scf.yield %9416 : i64
        } else {
          scf.yield %9415 : i64
        }
        %9422 = arith.cmpi ne, %9421, %9415 : i64
        scf.if %9422 {
          func.call @stack_push_pointer(%9421) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %9423 = func.call @stack_pop_pointer() : () -> i64
          %9424 = func.call @cc_cons(%9414, %9423) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_665 = arith.constant 0 : i64
          %9425 = arith.addi %9424, %__rlasp_stack_elide_zero_665 : i64
          %9426 = func.call @cc_cons(%9413, %9425) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_666 = arith.constant 0 : i64
          %9427 = arith.addi %9426, %__rlasp_stack_elide_zero_666 : i64
          %9428 = func.call @cc_values_pack(%9427) : (i64) -> i64
          func.call @stack_push_pointer(%9428) : (i64) -> ()
        }
        %9429 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9429 : i64
      }
      %__rlasp_stack_elide_zero_667 = arith.constant 0 : i64
      %9430 = arith.addi %9340, %__rlasp_stack_elide_zero_667 : i64
      %9431 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %9432 = func.call @cc_errorp(%9430) : (i64) -> i64
      %9433 = func.call @cc_nil_value() : () -> i64
      %9434 = arith.cmpi ne, %9432, %9433 : i64
      scf.if %9434 {
        %9435 = func.call @cc_condition_value(%9430) : (i64) -> i64
        %9436 = func.call @cc_values2(%9433, %9435) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9436) : (i64) -> ()
      } else {
        %9437 = func.call @cc_multiple_value_list(%9430) : (i64) -> i64
        %9438 = func.call @cc_values_pack(%9437) : (i64) -> i64
        func.call @stack_push_pointer(%9438) : (i64) -> ()
      }
      %9439 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9439 : i64
    }
    func.call @stack_push_pointer(%9334) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958559"() {
    %9703 = func.call @cc_nil_value() : () -> i64
    %9704 = func.call @cc_nil_value() : () -> i64
    %9705 = func.call @cc_errorp(%9703) : (i64) -> i64
    %9706 = arith.cmpi ne, %9705, %9704 : i64
    %9707 = scf.if %9706 -> (i64) {
      scf.yield %9703 : i64
    } else {
      %9708 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %9709 = func.call @cc_nil_value() : () -> i64
      %9710 = func.call @cc_nil_value() : () -> i64
      %9711 = func.call @cc_errorp(%9709) : (i64) -> i64
      %9712 = arith.cmpi ne, %9711, %9710 : i64
      %9713 = scf.if %9712 -> (i64) {
        scf.yield %9709 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %9714 = func.call @stack_pop_pointer() : () -> i64
        %9715 = func.call @cc_nil_value() : () -> i64
        %9716 = func.call @cc_errorp(%9714) : (i64) -> i64
        %9717 = arith.cmpi ne, %9716, %9715 : i64
        %9718 = scf.if %9717 -> (i64) {
          scf.yield %9714 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %9719 = func.call @stack_pop_pointer() : () -> i64
          %9720 = arith.constant 13 : i64
          func.call @stack_push_fixnum(%9720) : (i64) -> ()
          %9721 = func.call @stack_pop_pointer() : () -> i64
          %9722 = func.call @cc_nil_value() : () -> i64
          %9723 = func.call @cc_errorp(%9719) : (i64) -> i64
          %9724 = arith.cmpi ne, %9723, %9722 : i64
          %9725 = arith.cmpi eq, %9722, %9722 : i64
          %9726 = arith.andi %9724, %9725 : i1
          %9727 = scf.if %9726 -> (i64) {
            scf.yield %9719 : i64
          } else {
            scf.yield %9722 : i64
          }
          %9728 = func.call @cc_errorp(%9721) : (i64) -> i64
          %9729 = arith.cmpi ne, %9728, %9722 : i64
          %9730 = arith.cmpi eq, %9727, %9722 : i64
          %9731 = arith.andi %9729, %9730 : i1
          %9732 = scf.if %9731 -> (i64) {
            scf.yield %9721 : i64
          } else {
            scf.yield %9727 : i64
          }
          %9733 = arith.cmpi ne, %9732, %9722 : i64
          scf.if %9733 {
            func.call @stack_push_pointer(%9732) : (i64) -> ()
          } else {
            %9734 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%9734) : (i64) -> ()
            %__rlasp_stack_elide_zero_668 = arith.constant 0 : i64
            %9735 = arith.addi %9721, %__rlasp_stack_elide_zero_668 : i64
            %9736 = func.call @stack_pop_pointer() : () -> i64
            %9737 = func.call @cc_cons(%9735, %9736) : (i64, i64) -> i64
            func.call @stack_push_pointer(%9737) : (i64) -> ()
            %__rlasp_stack_elide_zero_669 = arith.constant 0 : i64
            %9738 = arith.addi %9719, %__rlasp_stack_elide_zero_669 : i64
            %9739 = func.call @stack_pop_pointer() : () -> i64
            %9740 = func.call @cc_cons(%9738, %9739) : (i64, i64) -> i64
            func.call @stack_push_pointer(%9740) : (i64) -> ()
          }
          %9741 = func.call @stack_pop_pointer() : () -> i64
          %9742 = func.call @cc_nil_value() : () -> i64
          %9743 = func.call @cc_errorp(%9741) : (i64) -> i64
          %9744 = arith.cmpi ne, %9743, %9742 : i64
          %9745 = arith.cmpi eq, %9742, %9742 : i64
          %9746 = arith.andi %9744, %9745 : i1
          %9747 = scf.if %9746 -> (i64) {
            scf.yield %9741 : i64
          } else {
            scf.yield %9742 : i64
          }
          %9748 = arith.cmpi ne, %9747, %9742 : i64
          scf.if %9748 {
            func.call @stack_push_pointer(%9747) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%9741) : (i64) -> ()
            %9749 = llvm.mlir.addressof @str802 : !llvm.ptr
            %9750 = func.call @cc_make_function_ref_const(%9749) : (!llvm.ptr) -> i64
            %9751 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%9750, %9751) : (i64, i64) -> ()
          }
          %9752 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9752 : i64
        }
        %__rlasp_stack_elide_zero_670 = arith.constant 0 : i64
        %9753 = arith.addi %9718, %__rlasp_stack_elide_zero_670 : i64
        %9754 = func.call @cc_errorp(%9753) : (i64) -> i64
        %9755 = func.call @cc_nil_value() : () -> i64
        %9756 = arith.cmpi ne, %9754, %9755 : i64
        scf.if %9756 {
          func.call @stack_push_pointer(%9753) : (i64) -> ()
        } else {
          %9757 = func.call @cc_multiple_value_list(%9753) : (i64) -> i64
          func.call @stack_push_pointer(%9757) : (i64) -> ()
        }
        %9758 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9759 = func.call @stack_pop_pointer() : () -> i64
        %9760 = func.call @cc_nil_value() : () -> i64
        %9761 = func.call @cc_maybe_error_from_multiple_value_list(%9758) : (i64) -> i64
        %9762 = func.call @cc_errorp(%9761) : (i64) -> i64
        %9763 = arith.cmpi ne, %9762, %9760 : i64
        %9764 = arith.cmpi eq, %9760, %9760 : i64
        %9765 = arith.andi %9763, %9764 : i1
        %9766 = scf.if %9765 -> (i64) {
          scf.yield %9761 : i64
        } else {
          scf.yield %9760 : i64
        }
        %9767 = arith.cmpi ne, %9766, %9760 : i64
        scf.if %9767 {
          func.call @stack_push_pointer(%9766) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %9768 = func.call @stack_pop_pointer() : () -> i64
          %9769 = func.call @cc_cons(%9759, %9768) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_671 = arith.constant 0 : i64
          %9770 = arith.addi %9769, %__rlasp_stack_elide_zero_671 : i64
          %9771 = func.call @cc_cons(%9758, %9770) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_672 = arith.constant 0 : i64
          %9772 = arith.addi %9771, %__rlasp_stack_elide_zero_672 : i64
          %9773 = func.call @cc_values_pack(%9772) : (i64) -> i64
          func.call @stack_push_pointer(%9773) : (i64) -> ()
        }
        %9774 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9774 : i64
      }
      %__rlasp_stack_elide_zero_673 = arith.constant 0 : i64
      %9775 = arith.addi %9713, %__rlasp_stack_elide_zero_673 : i64
      %9776 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %9777 = func.call @cc_errorp(%9775) : (i64) -> i64
      %9778 = func.call @cc_nil_value() : () -> i64
      %9779 = arith.cmpi ne, %9777, %9778 : i64
      scf.if %9779 {
        %9780 = func.call @cc_condition_value(%9775) : (i64) -> i64
        %9781 = func.call @cc_values2(%9778, %9780) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9781) : (i64) -> ()
      } else {
        %9782 = func.call @cc_multiple_value_list(%9775) : (i64) -> i64
        %9783 = func.call @cc_values_pack(%9782) : (i64) -> i64
        func.call @stack_push_pointer(%9783) : (i64) -> ()
      }
      %9784 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9784 : i64
    }
    func.call @stack_push_pointer(%9707) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958560"() {
    %10050 = func.call @cc_nil_value() : () -> i64
    %10051 = func.call @cc_nil_value() : () -> i64
    %10052 = func.call @cc_errorp(%10050) : (i64) -> i64
    %10053 = arith.cmpi ne, %10052, %10051 : i64
    %10054 = scf.if %10053 -> (i64) {
      scf.yield %10050 : i64
    } else {
      %10055 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %10056 = func.call @cc_nil_value() : () -> i64
      %10057 = func.call @cc_nil_value() : () -> i64
      %10058 = func.call @cc_errorp(%10056) : (i64) -> i64
      %10059 = arith.cmpi ne, %10058, %10057 : i64
      %10060 = scf.if %10059 -> (i64) {
        scf.yield %10056 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %10061 = func.call @stack_pop_pointer() : () -> i64
        %10062 = func.call @cc_nil_value() : () -> i64
        %10063 = func.call @cc_errorp(%10061) : (i64) -> i64
        %10064 = arith.cmpi ne, %10063, %10062 : i64
        %10065 = scf.if %10064 -> (i64) {
          scf.yield %10061 : i64
        } else {
          %10066 = arith.constant 97 : i64
          %10067 = func.call @cc_box_character(%10066) : (i64) -> i64
          %__rlasp_stack_elide_zero_674 = arith.constant 0 : i64
          %10068 = arith.addi %10067, %__rlasp_stack_elide_zero_674 : i64
          %10069 = arith.constant 13 : i64
          func.call @stack_push_fixnum(%10069) : (i64) -> ()
          %10070 = func.call @stack_pop_pointer() : () -> i64
          %10071 = func.call @cc_nil_value() : () -> i64
          %10072 = func.call @cc_errorp(%10068) : (i64) -> i64
          %10073 = arith.cmpi ne, %10072, %10071 : i64
          %10074 = arith.cmpi eq, %10071, %10071 : i64
          %10075 = arith.andi %10073, %10074 : i1
          %10076 = scf.if %10075 -> (i64) {
            scf.yield %10068 : i64
          } else {
            scf.yield %10071 : i64
          }
          %10077 = func.call @cc_errorp(%10070) : (i64) -> i64
          %10078 = arith.cmpi ne, %10077, %10071 : i64
          %10079 = arith.cmpi eq, %10076, %10071 : i64
          %10080 = arith.andi %10078, %10079 : i1
          %10081 = scf.if %10080 -> (i64) {
            scf.yield %10070 : i64
          } else {
            scf.yield %10076 : i64
          }
          %10082 = arith.cmpi ne, %10081, %10071 : i64
          scf.if %10082 {
            func.call @stack_push_pointer(%10081) : (i64) -> ()
          } else {
            %10083 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%10083) : (i64) -> ()
            %__rlasp_stack_elide_zero_675 = arith.constant 0 : i64
            %10084 = arith.addi %10070, %__rlasp_stack_elide_zero_675 : i64
            %10085 = func.call @stack_pop_pointer() : () -> i64
            %10086 = func.call @cc_cons(%10084, %10085) : (i64, i64) -> i64
            func.call @stack_push_pointer(%10086) : (i64) -> ()
            %__rlasp_stack_elide_zero_676 = arith.constant 0 : i64
            %10087 = arith.addi %10068, %__rlasp_stack_elide_zero_676 : i64
            %10088 = func.call @stack_pop_pointer() : () -> i64
            %10089 = func.call @cc_cons(%10087, %10088) : (i64, i64) -> i64
            func.call @stack_push_pointer(%10089) : (i64) -> ()
          }
          %10090 = func.call @stack_pop_pointer() : () -> i64
          %10091 = func.call @cc_nil_value() : () -> i64
          %10092 = func.call @cc_errorp(%10090) : (i64) -> i64
          %10093 = arith.cmpi ne, %10092, %10091 : i64
          %10094 = arith.cmpi eq, %10091, %10091 : i64
          %10095 = arith.andi %10093, %10094 : i1
          %10096 = scf.if %10095 -> (i64) {
            scf.yield %10090 : i64
          } else {
            scf.yield %10091 : i64
          }
          %10097 = arith.cmpi ne, %10096, %10091 : i64
          scf.if %10097 {
            func.call @stack_push_pointer(%10096) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%10090) : (i64) -> ()
            %10098 = llvm.mlir.addressof @str829 : !llvm.ptr
            %10099 = func.call @cc_make_function_ref_const(%10098) : (!llvm.ptr) -> i64
            %10100 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%10099, %10100) : (i64, i64) -> ()
          }
          %10101 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %10101 : i64
        }
        %__rlasp_stack_elide_zero_677 = arith.constant 0 : i64
        %10102 = arith.addi %10065, %__rlasp_stack_elide_zero_677 : i64
        %10103 = func.call @cc_errorp(%10102) : (i64) -> i64
        %10104 = func.call @cc_nil_value() : () -> i64
        %10105 = arith.cmpi ne, %10103, %10104 : i64
        scf.if %10105 {
          func.call @stack_push_pointer(%10102) : (i64) -> ()
        } else {
          %10106 = func.call @cc_multiple_value_list(%10102) : (i64) -> i64
          func.call @stack_push_pointer(%10106) : (i64) -> ()
        }
        %10107 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %10108 = func.call @stack_pop_pointer() : () -> i64
        %10109 = func.call @cc_nil_value() : () -> i64
        %10110 = func.call @cc_maybe_error_from_multiple_value_list(%10107) : (i64) -> i64
        %10111 = func.call @cc_errorp(%10110) : (i64) -> i64
        %10112 = arith.cmpi ne, %10111, %10109 : i64
        %10113 = arith.cmpi eq, %10109, %10109 : i64
        %10114 = arith.andi %10112, %10113 : i1
        %10115 = scf.if %10114 -> (i64) {
          scf.yield %10110 : i64
        } else {
          scf.yield %10109 : i64
        }
        %10116 = arith.cmpi ne, %10115, %10109 : i64
        scf.if %10116 {
          func.call @stack_push_pointer(%10115) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %10117 = func.call @stack_pop_pointer() : () -> i64
          %10118 = func.call @cc_cons(%10108, %10117) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_678 = arith.constant 0 : i64
          %10119 = arith.addi %10118, %__rlasp_stack_elide_zero_678 : i64
          %10120 = func.call @cc_cons(%10107, %10119) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_679 = arith.constant 0 : i64
          %10121 = arith.addi %10120, %__rlasp_stack_elide_zero_679 : i64
          %10122 = func.call @cc_values_pack(%10121) : (i64) -> i64
          func.call @stack_push_pointer(%10122) : (i64) -> ()
        }
        %10123 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10123 : i64
      }
      %__rlasp_stack_elide_zero_680 = arith.constant 0 : i64
      %10124 = arith.addi %10060, %__rlasp_stack_elide_zero_680 : i64
      %10125 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %10126 = func.call @cc_errorp(%10124) : (i64) -> i64
      %10127 = func.call @cc_nil_value() : () -> i64
      %10128 = arith.cmpi ne, %10126, %10127 : i64
      scf.if %10128 {
        %10129 = func.call @cc_condition_value(%10124) : (i64) -> i64
        %10130 = func.call @cc_values2(%10127, %10129) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10130) : (i64) -> ()
      } else {
        %10131 = func.call @cc_multiple_value_list(%10124) : (i64) -> i64
        %10132 = func.call @cc_values_pack(%10131) : (i64) -> i64
        func.call @stack_push_pointer(%10132) : (i64) -> ()
      }
      %10133 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10133 : i64
    }
    func.call @stack_push_pointer(%10054) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958561"() {
    %10394 = func.call @cc_nil_value() : () -> i64
    %10395 = func.call @cc_nil_value() : () -> i64
    %10396 = func.call @cc_errorp(%10394) : (i64) -> i64
    %10397 = arith.cmpi ne, %10396, %10395 : i64
    %10398 = scf.if %10397 -> (i64) {
      scf.yield %10394 : i64
    } else {
      %10399 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %10400 = func.call @cc_nil_value() : () -> i64
      %10401 = func.call @cc_nil_value() : () -> i64
      %10402 = func.call @cc_errorp(%10400) : (i64) -> i64
      %10403 = arith.cmpi ne, %10402, %10401 : i64
      %10404 = scf.if %10403 -> (i64) {
        scf.yield %10400 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %10405 = func.call @stack_pop_pointer() : () -> i64
        %10406 = func.call @cc_nil_value() : () -> i64
        %10407 = func.call @cc_errorp(%10405) : (i64) -> i64
        %10408 = arith.cmpi ne, %10407, %10406 : i64
        %10409 = scf.if %10408 -> (i64) {
          scf.yield %10405 : i64
        } else {
          %10410 = arith.constant -13 : i64
          func.call @stack_push_fixnum(%10410) : (i64) -> ()
          %10411 = func.call @stack_pop_pointer() : () -> i64
          %10412 = func.call @cc_nil_value() : () -> i64
          %10413 = func.call @cc_errorp(%10411) : (i64) -> i64
          %10414 = arith.cmpi ne, %10413, %10412 : i64
          %10415 = arith.cmpi eq, %10412, %10412 : i64
          %10416 = arith.andi %10414, %10415 : i1
          %10417 = scf.if %10416 -> (i64) {
            scf.yield %10411 : i64
          } else {
            scf.yield %10412 : i64
          }
          %10418 = arith.cmpi ne, %10417, %10412 : i64
          scf.if %10418 {
            func.call @stack_push_pointer(%10417) : (i64) -> ()
          } else {
            %10419 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%10419) : (i64) -> ()
            %__rlasp_stack_elide_zero_681 = arith.constant 0 : i64
            %10420 = arith.addi %10411, %__rlasp_stack_elide_zero_681 : i64
            %10421 = func.call @stack_pop_pointer() : () -> i64
            %10422 = func.call @cc_cons(%10420, %10421) : (i64, i64) -> i64
            func.call @stack_push_pointer(%10422) : (i64) -> ()
          }
          %10423 = func.call @stack_pop_pointer() : () -> i64
          %10424 = func.call @cc_nil_value() : () -> i64
          %10425 = func.call @cc_errorp(%10423) : (i64) -> i64
          %10426 = arith.cmpi ne, %10425, %10424 : i64
          %10427 = arith.cmpi eq, %10424, %10424 : i64
          %10428 = arith.andi %10426, %10427 : i1
          %10429 = scf.if %10428 -> (i64) {
            scf.yield %10423 : i64
          } else {
            scf.yield %10424 : i64
          }
          %10430 = arith.cmpi ne, %10429, %10424 : i64
          scf.if %10430 {
            func.call @stack_push_pointer(%10429) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%10423) : (i64) -> ()
            %10431 = llvm.mlir.addressof @str856 : !llvm.ptr
            %10432 = func.call @cc_make_function_ref_const(%10431) : (!llvm.ptr) -> i64
            %10433 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%10432, %10433) : (i64, i64) -> ()
          }
          %10434 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %10434 : i64
        }
        %__rlasp_stack_elide_zero_682 = arith.constant 0 : i64
        %10435 = arith.addi %10409, %__rlasp_stack_elide_zero_682 : i64
        %10436 = func.call @cc_errorp(%10435) : (i64) -> i64
        %10437 = func.call @cc_nil_value() : () -> i64
        %10438 = arith.cmpi ne, %10436, %10437 : i64
        scf.if %10438 {
          func.call @stack_push_pointer(%10435) : (i64) -> ()
        } else {
          %10439 = func.call @cc_multiple_value_list(%10435) : (i64) -> i64
          func.call @stack_push_pointer(%10439) : (i64) -> ()
        }
        %10440 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %10441 = func.call @stack_pop_pointer() : () -> i64
        %10442 = func.call @cc_nil_value() : () -> i64
        %10443 = func.call @cc_maybe_error_from_multiple_value_list(%10440) : (i64) -> i64
        %10444 = func.call @cc_errorp(%10443) : (i64) -> i64
        %10445 = arith.cmpi ne, %10444, %10442 : i64
        %10446 = arith.cmpi eq, %10442, %10442 : i64
        %10447 = arith.andi %10445, %10446 : i1
        %10448 = scf.if %10447 -> (i64) {
          scf.yield %10443 : i64
        } else {
          scf.yield %10442 : i64
        }
        %10449 = arith.cmpi ne, %10448, %10442 : i64
        scf.if %10449 {
          func.call @stack_push_pointer(%10448) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %10450 = func.call @stack_pop_pointer() : () -> i64
          %10451 = func.call @cc_cons(%10441, %10450) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_683 = arith.constant 0 : i64
          %10452 = arith.addi %10451, %__rlasp_stack_elide_zero_683 : i64
          %10453 = func.call @cc_cons(%10440, %10452) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_684 = arith.constant 0 : i64
          %10454 = arith.addi %10453, %__rlasp_stack_elide_zero_684 : i64
          %10455 = func.call @cc_values_pack(%10454) : (i64) -> i64
          func.call @stack_push_pointer(%10455) : (i64) -> ()
        }
        %10456 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10456 : i64
      }
      %__rlasp_stack_elide_zero_685 = arith.constant 0 : i64
      %10457 = arith.addi %10404, %__rlasp_stack_elide_zero_685 : i64
      %10458 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %10459 = func.call @cc_errorp(%10457) : (i64) -> i64
      %10460 = func.call @cc_nil_value() : () -> i64
      %10461 = arith.cmpi ne, %10459, %10460 : i64
      scf.if %10461 {
        %10462 = func.call @cc_condition_value(%10457) : (i64) -> i64
        %10463 = func.call @cc_values2(%10460, %10462) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10463) : (i64) -> ()
      } else {
        %10464 = func.call @cc_multiple_value_list(%10457) : (i64) -> i64
        %10465 = func.call @cc_values_pack(%10464) : (i64) -> i64
        func.call @stack_push_pointer(%10465) : (i64) -> ()
      }
      %10466 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10466 : i64
    }
    func.call @stack_push_pointer(%10398) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958562"() {
    %10713 = func.call @cc_nil_value() : () -> i64
    %10714 = func.call @cc_nil_value() : () -> i64
    %10715 = func.call @cc_errorp(%10713) : (i64) -> i64
    %10716 = arith.cmpi ne, %10715, %10714 : i64
    %10717 = scf.if %10716 -> (i64) {
      scf.yield %10713 : i64
    } else {
      %10718 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10718) : (i64) -> ()
      %10719 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10719) : (i64) -> ()
      %10720 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10720) : (i64) -> ()
      %10721 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10721) : (i64) -> ()
      %10722 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10722) : (i64) -> ()
      %10723 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10723) : (i64) -> ()
      %10724 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10724) : (i64) -> ()
      %10725 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10725) : (i64) -> ()
      %10726 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10726) : (i64) -> ()
      %10727 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10727) : (i64) -> ()
      %10728 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10728) : (i64) -> ()
      %10729 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10729) : (i64) -> ()
      %10730 = arith.constant 12 : i64
      %10731 = func.call @cc_box_fixnum(%10730) : (i64) -> i64
      %10732 = func.call @cc_make_vector(%10731) : (i64) -> i64
      %10733 = func.call @stack_pop_pointer() : () -> i64
      %10734 = arith.constant 11 : i64
      %10735 = func.call @cc_box_fixnum(%10734) : (i64) -> i64
      %10736 = func.call @cc_svset(%10732, %10735, %10733) : (i64, i64, i64) -> i64
      %10737 = func.call @stack_pop_pointer() : () -> i64
      %10738 = arith.constant 10 : i64
      %10739 = func.call @cc_box_fixnum(%10738) : (i64) -> i64
      %10740 = func.call @cc_svset(%10732, %10739, %10737) : (i64, i64, i64) -> i64
      %10741 = func.call @stack_pop_pointer() : () -> i64
      %10742 = arith.constant 9 : i64
      %10743 = func.call @cc_box_fixnum(%10742) : (i64) -> i64
      %10744 = func.call @cc_svset(%10732, %10743, %10741) : (i64, i64, i64) -> i64
      %10745 = func.call @stack_pop_pointer() : () -> i64
      %10746 = arith.constant 8 : i64
      %10747 = func.call @cc_box_fixnum(%10746) : (i64) -> i64
      %10748 = func.call @cc_svset(%10732, %10747, %10745) : (i64, i64, i64) -> i64
      %10749 = func.call @stack_pop_pointer() : () -> i64
      %10750 = arith.constant 7 : i64
      %10751 = func.call @cc_box_fixnum(%10750) : (i64) -> i64
      %10752 = func.call @cc_svset(%10732, %10751, %10749) : (i64, i64, i64) -> i64
      %10753 = func.call @stack_pop_pointer() : () -> i64
      %10754 = arith.constant 6 : i64
      %10755 = func.call @cc_box_fixnum(%10754) : (i64) -> i64
      %10756 = func.call @cc_svset(%10732, %10755, %10753) : (i64, i64, i64) -> i64
      %10757 = func.call @stack_pop_pointer() : () -> i64
      %10758 = arith.constant 5 : i64
      %10759 = func.call @cc_box_fixnum(%10758) : (i64) -> i64
      %10760 = func.call @cc_svset(%10732, %10759, %10757) : (i64, i64, i64) -> i64
      %10761 = func.call @stack_pop_pointer() : () -> i64
      %10762 = arith.constant 4 : i64
      %10763 = func.call @cc_box_fixnum(%10762) : (i64) -> i64
      %10764 = func.call @cc_svset(%10732, %10763, %10761) : (i64, i64, i64) -> i64
      %10765 = func.call @stack_pop_pointer() : () -> i64
      %10766 = arith.constant 3 : i64
      %10767 = func.call @cc_box_fixnum(%10766) : (i64) -> i64
      %10768 = func.call @cc_svset(%10732, %10767, %10765) : (i64, i64, i64) -> i64
      %10769 = func.call @stack_pop_pointer() : () -> i64
      %10770 = arith.constant 2 : i64
      %10771 = func.call @cc_box_fixnum(%10770) : (i64) -> i64
      %10772 = func.call @cc_svset(%10732, %10771, %10769) : (i64, i64, i64) -> i64
      %10773 = func.call @stack_pop_pointer() : () -> i64
      %10774 = arith.constant 1 : i64
      %10775 = func.call @cc_box_fixnum(%10774) : (i64) -> i64
      %10776 = func.call @cc_svset(%10732, %10775, %10773) : (i64, i64, i64) -> i64
      %10777 = func.call @stack_pop_pointer() : () -> i64
      %10778 = arith.constant 0 : i64
      %10779 = func.call @cc_box_fixnum(%10778) : (i64) -> i64
      %10780 = func.call @cc_svset(%10732, %10779, %10777) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_686 = arith.constant 0 : i64
      %10781 = arith.addi %10732, %__rlasp_stack_elide_zero_686 : i64
      %10782 = arith.constant 11 : i64
      %10783 = func.call @cc_box_fixnum(%10782) : (i64) -> i64
      %10784 = func.call @cc_nil_value() : () -> i64
      %10785 = func.call @cc_errorp(%10781) : (i64) -> i64
      %10786 = arith.cmpi ne, %10785, %10784 : i64
      %10787 = arith.cmpi eq, %10784, %10784 : i64
      %10788 = arith.andi %10786, %10787 : i1
      %10789 = scf.if %10788 -> (i64) {
        scf.yield %10781 : i64
      } else {
        scf.yield %10784 : i64
      }
      %10790 = func.call @cc_errorp(%10783) : (i64) -> i64
      %10791 = arith.cmpi ne, %10790, %10784 : i64
      %10792 = arith.cmpi eq, %10789, %10784 : i64
      %10793 = arith.andi %10791, %10792 : i1
      %10794 = scf.if %10793 -> (i64) {
        scf.yield %10783 : i64
      } else {
        scf.yield %10789 : i64
      }
      %10795 = arith.cmpi ne, %10794, %10784 : i64
      scf.if %10795 {
        func.call @stack_push_pointer(%10794) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10781) : (i64) -> ()
        func.call @stack_push_pointer(%10783) : (i64) -> ()
        %10796 = llvm.mlir.addressof @str873 : !llvm.ptr
        %10797 = func.call @cc_make_function_ref_const(%10796) : (!llvm.ptr) -> i64
        %10798 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%10797, %10798) : (i64, i64) -> ()
      }
      %10799 = func.call @stack_pop_pointer() : () -> i64
      %10800 = func.call @cc_numberp(%10799) : (i64) -> i64
      %__rlasp_stack_elide_zero_687 = arith.constant 0 : i64
      %10801 = arith.addi %10800, %__rlasp_stack_elide_zero_687 : i64
      %10802 = func.call @cc_nil_value() : () -> i64
      %10803 = func.call @cc_cons(%10801, %10802) : (i64, i64) -> i64
      %10804 = func.call @cc_not(%10803) : (i64) -> i64
      %__rlasp_stack_elide_zero_688 = arith.constant 0 : i64
      %10805 = arith.addi %10804, %__rlasp_stack_elide_zero_688 : i64
      %10806 = func.call @cc_nil_value() : () -> i64
      %10807 = func.call @cc_cons(%10805, %10806) : (i64, i64) -> i64
      %10808 = func.call @cc_not(%10807) : (i64) -> i64
      %__rlasp_stack_elide_zero_689 = arith.constant 0 : i64
      %10809 = arith.addi %10808, %__rlasp_stack_elide_zero_689 : i64
      scf.yield %10809 : i64
    }
    func.call @stack_push_pointer(%10717) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958563"() {
    %11043 = func.call @cc_nil_value() : () -> i64
    %11044 = func.call @cc_nil_value() : () -> i64
    %11045 = func.call @cc_errorp(%11043) : (i64) -> i64
    %11046 = arith.cmpi ne, %11045, %11044 : i64
    %11047 = scf.if %11046 -> (i64) {
      scf.yield %11043 : i64
    } else {
      %11048 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11048) : (i64) -> ()
      %11049 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11049) : (i64) -> ()
      %11050 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11050) : (i64) -> ()
      %11051 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11051) : (i64) -> ()
      %11052 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11052) : (i64) -> ()
      %11053 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11053) : (i64) -> ()
      %11054 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11054) : (i64) -> ()
      %11055 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11055) : (i64) -> ()
      %11056 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11056) : (i64) -> ()
      %11057 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11057) : (i64) -> ()
      %11058 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11058) : (i64) -> ()
      %11059 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11059) : (i64) -> ()
      %11060 = arith.constant 12 : i64
      %11061 = func.call @cc_box_fixnum(%11060) : (i64) -> i64
      %11062 = func.call @cc_make_vector(%11061) : (i64) -> i64
      %11063 = func.call @stack_pop_pointer() : () -> i64
      %11064 = arith.constant 11 : i64
      %11065 = func.call @cc_box_fixnum(%11064) : (i64) -> i64
      %11066 = func.call @cc_svset(%11062, %11065, %11063) : (i64, i64, i64) -> i64
      %11067 = func.call @stack_pop_pointer() : () -> i64
      %11068 = arith.constant 10 : i64
      %11069 = func.call @cc_box_fixnum(%11068) : (i64) -> i64
      %11070 = func.call @cc_svset(%11062, %11069, %11067) : (i64, i64, i64) -> i64
      %11071 = func.call @stack_pop_pointer() : () -> i64
      %11072 = arith.constant 9 : i64
      %11073 = func.call @cc_box_fixnum(%11072) : (i64) -> i64
      %11074 = func.call @cc_svset(%11062, %11073, %11071) : (i64, i64, i64) -> i64
      %11075 = func.call @stack_pop_pointer() : () -> i64
      %11076 = arith.constant 8 : i64
      %11077 = func.call @cc_box_fixnum(%11076) : (i64) -> i64
      %11078 = func.call @cc_svset(%11062, %11077, %11075) : (i64, i64, i64) -> i64
      %11079 = func.call @stack_pop_pointer() : () -> i64
      %11080 = arith.constant 7 : i64
      %11081 = func.call @cc_box_fixnum(%11080) : (i64) -> i64
      %11082 = func.call @cc_svset(%11062, %11081, %11079) : (i64, i64, i64) -> i64
      %11083 = func.call @stack_pop_pointer() : () -> i64
      %11084 = arith.constant 6 : i64
      %11085 = func.call @cc_box_fixnum(%11084) : (i64) -> i64
      %11086 = func.call @cc_svset(%11062, %11085, %11083) : (i64, i64, i64) -> i64
      %11087 = func.call @stack_pop_pointer() : () -> i64
      %11088 = arith.constant 5 : i64
      %11089 = func.call @cc_box_fixnum(%11088) : (i64) -> i64
      %11090 = func.call @cc_svset(%11062, %11089, %11087) : (i64, i64, i64) -> i64
      %11091 = func.call @stack_pop_pointer() : () -> i64
      %11092 = arith.constant 4 : i64
      %11093 = func.call @cc_box_fixnum(%11092) : (i64) -> i64
      %11094 = func.call @cc_svset(%11062, %11093, %11091) : (i64, i64, i64) -> i64
      %11095 = func.call @stack_pop_pointer() : () -> i64
      %11096 = arith.constant 3 : i64
      %11097 = func.call @cc_box_fixnum(%11096) : (i64) -> i64
      %11098 = func.call @cc_svset(%11062, %11097, %11095) : (i64, i64, i64) -> i64
      %11099 = func.call @stack_pop_pointer() : () -> i64
      %11100 = arith.constant 2 : i64
      %11101 = func.call @cc_box_fixnum(%11100) : (i64) -> i64
      %11102 = func.call @cc_svset(%11062, %11101, %11099) : (i64, i64, i64) -> i64
      %11103 = func.call @stack_pop_pointer() : () -> i64
      %11104 = arith.constant 1 : i64
      %11105 = func.call @cc_box_fixnum(%11104) : (i64) -> i64
      %11106 = func.call @cc_svset(%11062, %11105, %11103) : (i64, i64, i64) -> i64
      %11107 = func.call @stack_pop_pointer() : () -> i64
      %11108 = arith.constant 0 : i64
      %11109 = func.call @cc_box_fixnum(%11108) : (i64) -> i64
      %11110 = func.call @cc_svset(%11062, %11109, %11107) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_690 = arith.constant 0 : i64
      %11111 = arith.addi %11062, %__rlasp_stack_elide_zero_690 : i64
      %11112 = arith.constant 4 : i64
      %11113 = func.call @cc_box_fixnum(%11112) : (i64) -> i64
      %11114 = func.call @cc_nil_value() : () -> i64
      %11115 = func.call @cc_errorp(%11111) : (i64) -> i64
      %11116 = arith.cmpi ne, %11115, %11114 : i64
      %11117 = arith.cmpi eq, %11114, %11114 : i64
      %11118 = arith.andi %11116, %11117 : i1
      %11119 = scf.if %11118 -> (i64) {
        scf.yield %11111 : i64
      } else {
        scf.yield %11114 : i64
      }
      %11120 = func.call @cc_errorp(%11113) : (i64) -> i64
      %11121 = arith.cmpi ne, %11120, %11114 : i64
      %11122 = arith.cmpi eq, %11119, %11114 : i64
      %11123 = arith.andi %11121, %11122 : i1
      %11124 = scf.if %11123 -> (i64) {
        scf.yield %11113 : i64
      } else {
        scf.yield %11119 : i64
      }
      %11125 = arith.cmpi ne, %11124, %11114 : i64
      scf.if %11125 {
        func.call @stack_push_pointer(%11124) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11111) : (i64) -> ()
        func.call @stack_push_pointer(%11113) : (i64) -> ()
        %11126 = llvm.mlir.addressof @str888 : !llvm.ptr
        %11127 = func.call @cc_make_function_ref_const(%11126) : (!llvm.ptr) -> i64
        %11128 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%11127, %11128) : (i64, i64) -> ()
      }
      %11129 = func.call @stack_pop_pointer() : () -> i64
      %11130 = func.call @cc_numberp(%11129) : (i64) -> i64
      %__rlasp_stack_elide_zero_691 = arith.constant 0 : i64
      %11131 = arith.addi %11130, %__rlasp_stack_elide_zero_691 : i64
      %11132 = func.call @cc_nil_value() : () -> i64
      %11133 = func.call @cc_cons(%11131, %11132) : (i64, i64) -> i64
      %11134 = func.call @cc_not(%11133) : (i64) -> i64
      %__rlasp_stack_elide_zero_692 = arith.constant 0 : i64
      %11135 = arith.addi %11134, %__rlasp_stack_elide_zero_692 : i64
      %11136 = func.call @cc_nil_value() : () -> i64
      %11137 = func.call @cc_cons(%11135, %11136) : (i64, i64) -> i64
      %11138 = func.call @cc_not(%11137) : (i64) -> i64
      %__rlasp_stack_elide_zero_693 = arith.constant 0 : i64
      %11139 = arith.addi %11138, %__rlasp_stack_elide_zero_693 : i64
      scf.yield %11139 : i64
    }
    func.call @stack_push_pointer(%11047) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958564"() {
    %11373 = func.call @cc_nil_value() : () -> i64
    %11374 = func.call @cc_nil_value() : () -> i64
    %11375 = func.call @cc_errorp(%11373) : (i64) -> i64
    %11376 = arith.cmpi ne, %11375, %11374 : i64
    %11377 = scf.if %11376 -> (i64) {
      scf.yield %11373 : i64
    } else {
      %11378 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11378) : (i64) -> ()
      %11379 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11379) : (i64) -> ()
      %11380 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11380) : (i64) -> ()
      %11381 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11381) : (i64) -> ()
      %11382 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11382) : (i64) -> ()
      %11383 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11383) : (i64) -> ()
      %11384 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11384) : (i64) -> ()
      %11385 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11385) : (i64) -> ()
      %11386 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11386) : (i64) -> ()
      %11387 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11387) : (i64) -> ()
      %11388 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11388) : (i64) -> ()
      %11389 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11389) : (i64) -> ()
      %11390 = arith.constant 12 : i64
      %11391 = func.call @cc_box_fixnum(%11390) : (i64) -> i64
      %11392 = func.call @cc_make_vector(%11391) : (i64) -> i64
      %11393 = func.call @stack_pop_pointer() : () -> i64
      %11394 = arith.constant 11 : i64
      %11395 = func.call @cc_box_fixnum(%11394) : (i64) -> i64
      %11396 = func.call @cc_svset(%11392, %11395, %11393) : (i64, i64, i64) -> i64
      %11397 = func.call @stack_pop_pointer() : () -> i64
      %11398 = arith.constant 10 : i64
      %11399 = func.call @cc_box_fixnum(%11398) : (i64) -> i64
      %11400 = func.call @cc_svset(%11392, %11399, %11397) : (i64, i64, i64) -> i64
      %11401 = func.call @stack_pop_pointer() : () -> i64
      %11402 = arith.constant 9 : i64
      %11403 = func.call @cc_box_fixnum(%11402) : (i64) -> i64
      %11404 = func.call @cc_svset(%11392, %11403, %11401) : (i64, i64, i64) -> i64
      %11405 = func.call @stack_pop_pointer() : () -> i64
      %11406 = arith.constant 8 : i64
      %11407 = func.call @cc_box_fixnum(%11406) : (i64) -> i64
      %11408 = func.call @cc_svset(%11392, %11407, %11405) : (i64, i64, i64) -> i64
      %11409 = func.call @stack_pop_pointer() : () -> i64
      %11410 = arith.constant 7 : i64
      %11411 = func.call @cc_box_fixnum(%11410) : (i64) -> i64
      %11412 = func.call @cc_svset(%11392, %11411, %11409) : (i64, i64, i64) -> i64
      %11413 = func.call @stack_pop_pointer() : () -> i64
      %11414 = arith.constant 6 : i64
      %11415 = func.call @cc_box_fixnum(%11414) : (i64) -> i64
      %11416 = func.call @cc_svset(%11392, %11415, %11413) : (i64, i64, i64) -> i64
      %11417 = func.call @stack_pop_pointer() : () -> i64
      %11418 = arith.constant 5 : i64
      %11419 = func.call @cc_box_fixnum(%11418) : (i64) -> i64
      %11420 = func.call @cc_svset(%11392, %11419, %11417) : (i64, i64, i64) -> i64
      %11421 = func.call @stack_pop_pointer() : () -> i64
      %11422 = arith.constant 4 : i64
      %11423 = func.call @cc_box_fixnum(%11422) : (i64) -> i64
      %11424 = func.call @cc_svset(%11392, %11423, %11421) : (i64, i64, i64) -> i64
      %11425 = func.call @stack_pop_pointer() : () -> i64
      %11426 = arith.constant 3 : i64
      %11427 = func.call @cc_box_fixnum(%11426) : (i64) -> i64
      %11428 = func.call @cc_svset(%11392, %11427, %11425) : (i64, i64, i64) -> i64
      %11429 = func.call @stack_pop_pointer() : () -> i64
      %11430 = arith.constant 2 : i64
      %11431 = func.call @cc_box_fixnum(%11430) : (i64) -> i64
      %11432 = func.call @cc_svset(%11392, %11431, %11429) : (i64, i64, i64) -> i64
      %11433 = func.call @stack_pop_pointer() : () -> i64
      %11434 = arith.constant 1 : i64
      %11435 = func.call @cc_box_fixnum(%11434) : (i64) -> i64
      %11436 = func.call @cc_svset(%11392, %11435, %11433) : (i64, i64, i64) -> i64
      %11437 = func.call @stack_pop_pointer() : () -> i64
      %11438 = arith.constant 0 : i64
      %11439 = func.call @cc_box_fixnum(%11438) : (i64) -> i64
      %11440 = func.call @cc_svset(%11392, %11439, %11437) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_694 = arith.constant 0 : i64
      %11441 = arith.addi %11392, %__rlasp_stack_elide_zero_694 : i64
      %11442 = arith.constant 5 : i64
      %11443 = func.call @cc_box_fixnum(%11442) : (i64) -> i64
      %11444 = func.call @cc_nil_value() : () -> i64
      %11445 = func.call @cc_errorp(%11441) : (i64) -> i64
      %11446 = arith.cmpi ne, %11445, %11444 : i64
      %11447 = arith.cmpi eq, %11444, %11444 : i64
      %11448 = arith.andi %11446, %11447 : i1
      %11449 = scf.if %11448 -> (i64) {
        scf.yield %11441 : i64
      } else {
        scf.yield %11444 : i64
      }
      %11450 = func.call @cc_errorp(%11443) : (i64) -> i64
      %11451 = arith.cmpi ne, %11450, %11444 : i64
      %11452 = arith.cmpi eq, %11449, %11444 : i64
      %11453 = arith.andi %11451, %11452 : i1
      %11454 = scf.if %11453 -> (i64) {
        scf.yield %11443 : i64
      } else {
        scf.yield %11449 : i64
      }
      %11455 = arith.cmpi ne, %11454, %11444 : i64
      scf.if %11455 {
        func.call @stack_push_pointer(%11454) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11441) : (i64) -> ()
        func.call @stack_push_pointer(%11443) : (i64) -> ()
        %11456 = llvm.mlir.addressof @str903 : !llvm.ptr
        %11457 = func.call @cc_make_function_ref_const(%11456) : (!llvm.ptr) -> i64
        %11458 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%11457, %11458) : (i64, i64) -> ()
      }
      %11459 = func.call @stack_pop_pointer() : () -> i64
      %11460 = func.call @cc_numberp(%11459) : (i64) -> i64
      %__rlasp_stack_elide_zero_695 = arith.constant 0 : i64
      %11461 = arith.addi %11460, %__rlasp_stack_elide_zero_695 : i64
      %11462 = func.call @cc_nil_value() : () -> i64
      %11463 = func.call @cc_cons(%11461, %11462) : (i64, i64) -> i64
      %11464 = func.call @cc_not(%11463) : (i64) -> i64
      %__rlasp_stack_elide_zero_696 = arith.constant 0 : i64
      %11465 = arith.addi %11464, %__rlasp_stack_elide_zero_696 : i64
      %11466 = func.call @cc_nil_value() : () -> i64
      %11467 = func.call @cc_cons(%11465, %11466) : (i64, i64) -> i64
      %11468 = func.call @cc_not(%11467) : (i64) -> i64
      %__rlasp_stack_elide_zero_697 = arith.constant 0 : i64
      %11469 = arith.addi %11468, %__rlasp_stack_elide_zero_697 : i64
      scf.yield %11469 : i64
    }
    func.call @stack_push_pointer(%11377) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_15079495958528*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_15079495958528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_15079495958528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("ARRAY-DIMENSION0\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str6("ARRAY-DIMENSION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str11("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str16("ARRAY-DIMENSION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str17("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str23("MAKE-SEQUENCE-SIMPLE-STRING\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str24("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str25("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str26("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str35("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str40("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str43("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str48("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str54("MAKE-SEQUENCE-SIMPLE-BASE-STRING\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str55("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str56("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str71("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str74("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str79("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str83("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str84("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str85("TYPEP-MAKE-SIMPLE-ARRAY\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str86("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str91("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str99("TYPEP-MAKE-FILL-POINTER-VECTOR-NONSIMPLE\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str100("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str101("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str108("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str117("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("TYPEP-MAKE-FILL-POINTER-VECTOR-NONSIMPLE-VECTOR\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str119("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str120("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str123("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str127("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str134("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str135("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str136("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str137("TYPEP-MAKE-ADJUSTABLE-ARRAY\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str138("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str142("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str147("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str148("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str151("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str152("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str153("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str154("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str155("TYPEP-MAKE-ADJUSTABLE-ARRAY-NONSIMPLE\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str156("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str157("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str160("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str165("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str168("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str171("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str172("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str173("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str175("TYPEP-MAKE-ADJUSTABLE-ARRAY-NON-SIMPLE-VECTOR\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str176("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str177("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str180("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str181("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str182("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str183("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str184("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str185("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str188("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str193("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str194("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str195("ADJUST-ARRAY0\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str196("ADJUST-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str197("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str198("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str199("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str200("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str201("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str202("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str203("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str204("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str205("ADJUST-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str206("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str207("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str208("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str209("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str210("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str212("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str213("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str214("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str215("MAKE-ARRAY-0\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str216("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str225("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str226("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str228("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str229("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str230("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str231("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str238("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str239("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str241("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str242("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str243("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str244("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str245("MAKE-ARRAY-1\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str246("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str249("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str250("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str251("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str252("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str255("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str256("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str257("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str260("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str261("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str268("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str269("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str271("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str272("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str273("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str274("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str275("MAKE-ARRAY-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str276("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str277("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str280("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str281("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str282("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str285("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str288("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str289("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str290("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str292("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str293("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str294("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str295("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str296("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str299("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str300("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str301("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str302("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str303("MAKE-ARRAY-3\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str304("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str305("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str306("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str307("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str308("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str310("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str312("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str313("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str316("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str317("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str318("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str319("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str323("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str325("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str326("ARRAYP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str331("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str332("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str333("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str334("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str336("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str339("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str340("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str341("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str342("MAKE-ARRAY-4\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str343("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str344("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str345("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str348("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str349("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str350("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str353("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str354("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str355("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str356("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str357("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str358("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str359("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str360("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str361("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str362("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str363("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str364("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str365("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str368("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str369("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str370("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str371("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str372("MAKE-ARRAY-5\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str373("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str374("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str375("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str376("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str377("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str378("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str379("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str380("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str381("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str382("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str385("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str386("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str388("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str389("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str390("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str391("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str392("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str393("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str394("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str395("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str396("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str397("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str398("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str399("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str400("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str401("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str402("MAKE-ARRAY-6\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str403("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str404("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str406("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str407("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str408("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str409("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str410("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str411("ARRAY-ELEMENT-TYPE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str412("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str413("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str414("DISPLACED-INDEX-OFFSET\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str415("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str416("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str417("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str418("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str419("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str420("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str421("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str422("ARRAY-ELEMENT-TYPE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str423("DISPLACED-INDEX-OFFSET\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str424("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str426("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str427("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str428("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str429("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str430("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str431("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str432("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str433("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str434("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str435("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str436("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str437("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str438("AREF-NIL-ARRAY\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str439("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str440("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str441("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str443("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str445("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str446("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str451("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str452("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str453("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str456("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str457("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str458("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str459("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str460("SETF-AREF-NIL-ARRAY\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str461("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str462("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str463("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str464("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str465("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str466("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str470("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str471("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str475("%FN%(setf COMMON-LISP::AREF)\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str476("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str477("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str478("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str479("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str481("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str482("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str483("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str484("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str485("FILL-POINTER-NIL-ARRAY\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str486("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str487("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str489("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str490("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str491("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str492("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str493("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str494("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str495("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str496("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str497("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str498("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str499("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str500("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str501("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str503("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str504("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str505("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str506("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str507("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str508("SIMPLE-ARRAY-OUT-OF-BOUNDS-MESSAGE\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str509("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str510("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str511("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str512("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str513("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str514("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str515("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str516("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str517("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str518("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str519("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str520("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("SPEED\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str522("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str523("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str524("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str525("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str526("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str527("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str528("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str529("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str530("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str531("nada\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str532("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str535("PRINC-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str536("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str538("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str539("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str541("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str542("expected 0-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str543("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str544("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("(INTEGER 0 (3))\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str547("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str548("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str549("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str550("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str551("nada\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str552("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str553("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str554("PRINC-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str555("expected 0-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str556("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str557("(INTEGER 0 (3))\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str558("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str559("#:%%DYN-CELL-15079495958550-E\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str560("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str561("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str562("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str563("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str564("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str565("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str566("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str567("COMPLEX-DISPLACEMENT-ASV\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str568("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str569("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str570("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str571("DISPLACED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str572("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str573("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str574("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str575("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str576("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str577("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str578("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str579("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str580("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str581("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str582("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str583("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str584("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str585("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str586("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str587("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str588("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str589("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str590("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str591("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str592("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str593("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str594("DISPLACED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str595("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str596("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str597("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str598("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str599("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str600("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str601("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str602("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str603("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str604("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str605("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str606("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str607("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str608("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str609("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str610("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str611("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str612("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str613("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str614("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str615("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str616("ARRAY-TOO-BIG\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str617("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str618("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str619("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str620("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str621("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str622("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str623("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str624("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str625("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str626("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str627("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str628("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str630("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str631("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str632("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str633("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str634("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str635("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str636("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str637("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str638("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str639("ARRAY-TOO-BIG-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str640("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str641("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str642("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str643("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str644("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str645("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str646("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str647("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str649("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str650("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str651("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str652("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str655("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str656("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str657("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str658("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str659("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str660("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str661("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str662("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str663("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str664("ARRAY-WRONG-DIMENSION-LIST-A\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str665("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str666("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str667("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str668("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str669("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str670("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str671("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str672("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str673("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str674("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str675("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str676("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str677("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str678("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str679("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str680("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str681("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str682("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str683("ARRAY-WRONG-DIMENSION-LIST-B\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str684("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str685("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str687("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str688("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str689("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str690("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str691("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str693("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str694("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str695("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str696("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str697("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str698("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str699("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str700("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str701("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str702("ARRAY-WRONG-DIMENSION-LIST-C\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str703("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str704("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str705("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str706("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str707("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str708("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str709("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str710("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str711("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str712("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str713("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str714("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str715("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str716("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str717("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str718("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str719("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str720("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str721("ARRAY-TOO-BIG-NOT-INLINE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str722("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str723("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str724("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str725("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str726("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str729("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str730("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str731("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str732("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str733("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str734("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str735("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str736("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str737("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str738("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str739("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str741("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str742("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str743("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str744("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str745("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str746("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str747("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str748("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str749("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str750("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str751("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str752("ARRAY-TOO-BIG-LIST-NOT-INLINE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str753("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str754("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str755("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str756("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str757("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str758("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str759("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str760("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str761("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str762("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str763("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str764("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str765("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str766("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str767("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str768("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str769("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str770("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str771("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str772("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str773("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str774("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str775("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str776("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str777("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str778("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str779("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str780("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str781("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str782("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str783("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str784("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str785("ARRAY-WRONG-DIMENSION-LIST-A-NOT-INLINE\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str786("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str787("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str788("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str789("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str790("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str791("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str792("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str793("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str794("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str795("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str796("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str797("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str798("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str799("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str800("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str801("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str802("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str803("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str804("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str805("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str806("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str807("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str808("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str809("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str810("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str811("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str812("ARRAY-WRONG-DIMENSION-LIST-B-NOT-INLINE\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str813("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str814("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str815("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str816("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str817("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str818("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str819("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str820("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str821("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str822("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str823("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str824("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str825("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str826("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str827("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str828("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str829("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str830("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str831("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str832("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str833("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str834("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str835("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str836("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str837("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str838("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str839("ARRAY-WRONG-DIMENSION-LIST-C-NOT-INLINE\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str840("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str841("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str842("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str843("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str844("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str845("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str846("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str847("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str848("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str849("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str850("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str851("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str852("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str853("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str854("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str855("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str856("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str857("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str858("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str859("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str860("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str861("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str862("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str863("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str864("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str865("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str866("ISSUE-1253\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str867("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str868("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str869("NUMBERP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str870("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str871("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str872("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str873("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str874("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str875("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str876("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str877("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str878("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str879("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str880("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str881("ISSUE-1253-A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str882("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str883("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str884("NUMBERP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str885("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str886("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str887("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str888("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str889("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str890("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str891("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str892("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str893("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str894("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str895("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str896("ISSUE-1253-B\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str897("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str898("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str899("NUMBERP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str900("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str901("SBIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str902("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str903("SBIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str904("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str905("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str906("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str907("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str908("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str909("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str910("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str911("*__MLIR_BLOCK_RETFLAG_15079495958528*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str912("*__MLIR_BLOCK_RETMVLIST_15079495958528*\00") : !llvm.array<40 x i8>
}
