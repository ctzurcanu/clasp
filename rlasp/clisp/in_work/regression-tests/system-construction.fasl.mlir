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
      %76 = arith.constant 21 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = llvm.mlir.addressof @str9 : !llvm.ptr
      %79 = arith.constant 11 : i64
      %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
      %81 = func.call @cc_intern(%77, %80) : (i64, i64) -> i64
      %82 = func.call @cc_nil_value() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      %84 = func.call @cc_values_pack(%83) : (i64) -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      %85 = llvm.mlir.addressof @str10 : !llvm.ptr
      %86 = arith.constant 9 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %88 = llvm.mlir.addressof @str11 : !llvm.ptr
      %89 = arith.constant 11 : i64
      %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
      %91 = llvm.mlir.addressof @str12 : !llvm.ptr
      %92 = arith.constant 7 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = func.call @cc_intern(%90, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %98 = llvm.mlir.addressof @str13 : !llvm.ptr
      %99 = arith.constant 12 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %101 = func.call @stack_pop_pointer() : () -> i64
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @cc_cons(%102, %101) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %104 = arith.addi %103, %__rlasp_stack_elide_zero_3 : i64
      %105 = func.call @stack_pop_pointer() : () -> i64
      %106 = func.call @cc_cons(%105, %104) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %107 = arith.addi %106, %__rlasp_stack_elide_zero_4 : i64
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @cc_cons(%108, %107) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %110 = arith.addi %109, %__rlasp_stack_elide_zero_5 : i64
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @cc_cons(%111, %110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @stack_pop_pointer() : () -> i64
      %115 = func.call @cc_cons(%114, %113) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %116 = arith.addi %115, %__rlasp_stack_elide_zero_6 : i64
      %117 = func.call @stack_pop_pointer() : () -> i64
      %118 = func.call @cc_cons(%117, %116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %119 = arith.addi %118, %__rlasp_stack_elide_zero_7 : i64
      %173 = arith.constant 96094591647745 : i64
      %174 = arith.constant 0 : i64
      %175 = func.call @cc_make_closure(%173, %174) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %176 = arith.addi %175, %__rlasp_stack_elide_zero_8 : i64
      %177 = llvm.mlir.addressof @str20 : !llvm.ptr
      %178 = arith.constant 7 : i64
      %179 = func.call @cc_make_string(%177, %178) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%179) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @cc_cons(%181, %180) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %183 = arith.addi %182, %__rlasp_stack_elide_zero_9 : i64
      %184 = llvm.mlir.addressof @str21 : !llvm.ptr
      %185 = arith.constant 11 : i64
      %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
      %187 = llvm.mlir.addressof @str22 : !llvm.ptr
      %188 = arith.constant 7 : i64
      %189 = func.call @cc_make_string(%187, %188) : (!llvm.ptr, i64) -> i64
      %190 = func.call @cc_intern(%186, %189) : (i64, i64) -> i64
      %191 = func.call @cc_nil_value() : () -> i64
      %192 = func.call @cc_cons(%190, %191) : (i64, i64) -> i64
      %193 = func.call @cc_values_pack(%192) : (i64) -> i64
      %194 = func.call @cc_nil_value() : () -> i64
      %195 = llvm.mlir.addressof @str23 : !llvm.ptr
      %196 = arith.constant 4 : i64
      %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
      %198 = llvm.mlir.addressof @str24 : !llvm.ptr
      %199 = arith.constant 7 : i64
      %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
      %201 = func.call @cc_intern(%197, %200) : (i64, i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_values_pack(%203) : (i64) -> i64
      %205 = llvm.mlir.addressof @str25 : !llvm.ptr
      %206 = arith.constant 6 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_intern(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_cons(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %213 = arith.addi %209, %__rlasp_stack_elide_zero_10 : i64
      %214 = func.call @cc_nil_value() : () -> i64
      %215 = func.call @cc_errorp(%64) : (i64) -> i64
      %216 = arith.cmpi ne, %215, %214 : i64
      %217 = arith.cmpi eq, %214, %214 : i64
      %218 = arith.andi %216, %217 : i1
      %219 = scf.if %218 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %214 : i64
      }
      %220 = func.call @cc_errorp(%119) : (i64) -> i64
      %221 = arith.cmpi ne, %220, %214 : i64
      %222 = arith.cmpi eq, %219, %214 : i64
      %223 = arith.andi %221, %222 : i1
      %224 = scf.if %223 -> (i64) {
        scf.yield %119 : i64
      } else {
        scf.yield %219 : i64
      }
      %225 = func.call @cc_errorp(%176) : (i64) -> i64
      %226 = arith.cmpi ne, %225, %214 : i64
      %227 = arith.cmpi eq, %224, %214 : i64
      %228 = arith.andi %226, %227 : i1
      %229 = scf.if %228 -> (i64) {
        scf.yield %176 : i64
      } else {
        scf.yield %224 : i64
      }
      %230 = func.call @cc_errorp(%183) : (i64) -> i64
      %231 = arith.cmpi ne, %230, %214 : i64
      %232 = arith.cmpi eq, %229, %214 : i64
      %233 = arith.andi %231, %232 : i1
      %234 = scf.if %233 -> (i64) {
        scf.yield %183 : i64
      } else {
        scf.yield %229 : i64
      }
      %235 = func.call @cc_errorp(%190) : (i64) -> i64
      %236 = arith.cmpi ne, %235, %214 : i64
      %237 = arith.cmpi eq, %234, %214 : i64
      %238 = arith.andi %236, %237 : i1
      %239 = scf.if %238 -> (i64) {
        scf.yield %190 : i64
      } else {
        scf.yield %234 : i64
      }
      %240 = func.call @cc_errorp(%194) : (i64) -> i64
      %241 = arith.cmpi ne, %240, %214 : i64
      %242 = arith.cmpi eq, %239, %214 : i64
      %243 = arith.andi %241, %242 : i1
      %244 = scf.if %243 -> (i64) {
        scf.yield %194 : i64
      } else {
        scf.yield %239 : i64
      }
      %245 = func.call @cc_errorp(%201) : (i64) -> i64
      %246 = arith.cmpi ne, %245, %214 : i64
      %247 = arith.cmpi eq, %244, %214 : i64
      %248 = arith.andi %246, %247 : i1
      %249 = scf.if %248 -> (i64) {
        scf.yield %201 : i64
      } else {
        scf.yield %244 : i64
      }
      %250 = func.call @cc_errorp(%213) : (i64) -> i64
      %251 = arith.cmpi ne, %250, %214 : i64
      %252 = arith.cmpi eq, %249, %214 : i64
      %253 = arith.andi %251, %252 : i1
      %254 = scf.if %253 -> (i64) {
        scf.yield %213 : i64
      } else {
        scf.yield %249 : i64
      }
      %255 = arith.cmpi ne, %254, %214 : i64
      scf.if %255 {
        func.call @stack_push_pointer(%254) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%119) : (i64) -> ()
        func.call @stack_push_pointer(%176) : (i64) -> ()
        func.call @stack_push_pointer(%183) : (i64) -> ()
        func.call @stack_push_pointer(%190) : (i64) -> ()
        func.call @stack_push_pointer(%194) : (i64) -> ()
        func.call @stack_push_pointer(%201) : (i64) -> ()
        func.call @stack_push_pointer(%213) : (i64) -> ()
        %256 = llvm.mlir.addressof @str26 : !llvm.ptr
        %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
        %258 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%257, %258) : (i64, i64) -> ()
      }
      %259 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %259 : i64
    }
    %260 = func.call @cc_nil_value() : () -> i64
    %261 = func.call @cc_errorp(%55) : (i64) -> i64
    %262 = arith.cmpi ne, %261, %260 : i64
    %263 = scf.if %262 -> (i64) {
      scf.yield %55 : i64
    } else {
      %264 = llvm.mlir.addressof @str27 : !llvm.ptr
      %265 = arith.constant 21 : i64
      %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_intern(%266, %267) : (i64, i64) -> i64
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
      %271 = func.call @cc_values_pack(%270) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %272 = arith.addi %268, %__rlasp_stack_elide_zero_11 : i64
      %273 = llvm.mlir.addressof @str28 : !llvm.ptr
      %274 = arith.constant 3 : i64
      %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_intern(%275, %276) : (i64, i64) -> i64
      %278 = func.call @cc_nil_value() : () -> i64
      %279 = func.call @cc_cons(%277, %278) : (i64, i64) -> i64
      %280 = func.call @cc_values_pack(%279) : (i64) -> i64
      func.call @stack_push_pointer(%277) : (i64) -> ()
      %281 = llvm.mlir.addressof @str29 : !llvm.ptr
      %282 = arith.constant 3 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_intern(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_nil_value() : () -> i64
      %287 = func.call @cc_cons(%285, %286) : (i64, i64) -> i64
      %288 = func.call @cc_values_pack(%287) : (i64) -> i64
      func.call @stack_push_pointer(%285) : (i64) -> ()
      %289 = llvm.mlir.addressof @str30 : !llvm.ptr
      %290 = arith.constant 3 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_values_pack(%295) : (i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %297 = llvm.mlir.addressof @str31 : !llvm.ptr
      %298 = arith.constant 23 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = llvm.mlir.addressof @str32 : !llvm.ptr
      %301 = arith.constant 3 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = func.call @cc_intern(%299, %302) : (i64, i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = func.call @cc_cons(%303, %304) : (i64, i64) -> i64
      %306 = func.call @cc_values_pack(%305) : (i64) -> i64
      func.call @stack_push_pointer(%303) : (i64) -> ()
      %307 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%307) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %308 = func.call @stack_pop_pointer() : () -> i64
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @cc_cons(%309, %308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %311 = arith.addi %310, %__rlasp_stack_elide_zero_12 : i64
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_cons(%312, %311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      %314 = llvm.mlir.addressof @str33 : !llvm.ptr
      %315 = arith.constant 4 : i64
      %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
      %317 = func.call @cc_nil_value() : () -> i64
      %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
      %319 = func.call @cc_nil_value() : () -> i64
      %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
      %321 = func.call @cc_values_pack(%320) : (i64) -> i64
      func.call @stack_push_pointer(%318) : (i64) -> ()
      %322 = llvm.mlir.addressof @str34 : !llvm.ptr
      %323 = arith.constant 44 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %325 = func.call @stack_pop_pointer() : () -> i64
      %326 = func.call @stack_pop_pointer() : () -> i64
      %327 = func.call @cc_cons(%326, %325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %328 = arith.addi %327, %__rlasp_stack_elide_zero_13 : i64
      %329 = func.call @stack_pop_pointer() : () -> i64
      %330 = func.call @cc_cons(%329, %328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %331 = func.call @stack_pop_pointer() : () -> i64
      %332 = func.call @stack_pop_pointer() : () -> i64
      %333 = func.call @cc_cons(%332, %331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %334 = arith.addi %333, %__rlasp_stack_elide_zero_14 : i64
      %335 = func.call @stack_pop_pointer() : () -> i64
      %336 = func.call @cc_cons(%335, %334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%336) : (i64) -> ()
      %337 = llvm.mlir.addressof @str35 : !llvm.ptr
      %338 = arith.constant 3 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_intern(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_cons(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_values_pack(%343) : (i64) -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %345 = llvm.mlir.addressof @str36 : !llvm.ptr
      %346 = arith.constant 4 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      %348 = func.call @cc_nil_value() : () -> i64
      %349 = func.call @cc_intern(%347, %348) : (i64, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_values_pack(%351) : (i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %353 = llvm.mlir.addressof @str37 : !llvm.ptr
      %354 = arith.constant 12 : i64
      %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
      %356 = llvm.mlir.addressof @str38 : !llvm.ptr
      %357 = arith.constant 11 : i64
      %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
      %359 = func.call @cc_intern(%355, %358) : (i64, i64) -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
      %362 = func.call @cc_values_pack(%361) : (i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      %363 = llvm.mlir.addressof @str39 : !llvm.ptr
      %364 = arith.constant 4 : i64
      %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_intern(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_nil_value() : () -> i64
      %369 = func.call @cc_cons(%367, %368) : (i64, i64) -> i64
      %370 = func.call @cc_values_pack(%369) : (i64) -> i64
      func.call @stack_push_pointer(%367) : (i64) -> ()
      %371 = llvm.mlir.addressof @str40 : !llvm.ptr
      %372 = arith.constant 11 : i64
      %373 = func.call @cc_make_string(%371, %372) : (!llvm.ptr, i64) -> i64
      %374 = llvm.mlir.addressof @str41 : !llvm.ptr
      %375 = arith.constant 7 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = func.call @cc_intern(%373, %376) : (i64, i64) -> i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_cons(%377, %378) : (i64, i64) -> i64
      %380 = func.call @cc_values_pack(%379) : (i64) -> i64
      func.call @stack_push_pointer(%377) : (i64) -> ()
      %381 = llvm.mlir.addressof @str42 : !llvm.ptr
      %382 = arith.constant 13 : i64
      %383 = func.call @cc_make_string(%381, %382) : (!llvm.ptr, i64) -> i64
      %384 = llvm.mlir.addressof @str43 : !llvm.ptr
      %385 = arith.constant 11 : i64
      %386 = func.call @cc_make_string(%384, %385) : (!llvm.ptr, i64) -> i64
      %387 = func.call @cc_intern(%383, %386) : (i64, i64) -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_cons(%387, %388) : (i64, i64) -> i64
      %390 = func.call @cc_values_pack(%389) : (i64) -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %391 = llvm.mlir.addressof @str44 : !llvm.ptr
      %392 = arith.constant 4 : i64
      %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
      %394 = llvm.mlir.addressof @str45 : !llvm.ptr
      %395 = arith.constant 7 : i64
      %396 = func.call @cc_make_string(%394, %395) : (!llvm.ptr, i64) -> i64
      %397 = func.call @cc_intern(%393, %396) : (i64, i64) -> i64
      %398 = func.call @cc_nil_value() : () -> i64
      %399 = func.call @cc_cons(%397, %398) : (i64, i64) -> i64
      %400 = func.call @cc_values_pack(%399) : (i64) -> i64
      func.call @stack_push_pointer(%397) : (i64) -> ()
      %401 = llvm.mlir.addressof @str46 : !llvm.ptr
      %402 = arith.constant 7 : i64
      %403 = func.call @cc_make_string(%401, %402) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %404 = llvm.mlir.addressof @str47 : !llvm.ptr
      %405 = arith.constant 8 : i64
      %406 = func.call @cc_make_string(%404, %405) : (!llvm.ptr, i64) -> i64
      %407 = llvm.mlir.addressof @str48 : !llvm.ptr
      %408 = arith.constant 7 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      %410 = func.call @cc_intern(%406, %409) : (i64, i64) -> i64
      %411 = func.call @cc_nil_value() : () -> i64
      %412 = func.call @cc_cons(%410, %411) : (i64, i64) -> i64
      %413 = func.call @cc_values_pack(%412) : (i64) -> i64
      func.call @stack_push_pointer(%410) : (i64) -> ()
      %414 = llvm.mlir.addressof @str49 : !llvm.ptr
      %415 = arith.constant 4 : i64
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
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %425 = arith.addi %424, %__rlasp_stack_elide_zero_15 : i64
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @cc_cons(%426, %425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %428 = arith.addi %427, %__rlasp_stack_elide_zero_16 : i64
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %431 = arith.addi %430, %__rlasp_stack_elide_zero_17 : i64
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @cc_cons(%432, %431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %434 = arith.addi %433, %__rlasp_stack_elide_zero_18 : i64
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_cons(%435, %434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      %437 = llvm.mlir.addressof @str50 : !llvm.ptr
      %438 = arith.constant 7 : i64
      %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
      %440 = llvm.mlir.addressof @str51 : !llvm.ptr
      %441 = arith.constant 7 : i64
      %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
      %443 = func.call @cc_intern(%439, %442) : (i64, i64) -> i64
      %444 = func.call @cc_nil_value() : () -> i64
      %445 = func.call @cc_cons(%443, %444) : (i64, i64) -> i64
      %446 = func.call @cc_values_pack(%445) : (i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %447 = llvm.mlir.addressof @str52 : !llvm.ptr
      %448 = arith.constant 5 : i64
      %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
      %450 = llvm.mlir.addressof @str53 : !llvm.ptr
      %451 = arith.constant 7 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      %453 = func.call @cc_intern(%449, %452) : (i64, i64) -> i64
      %454 = func.call @cc_nil_value() : () -> i64
      %455 = func.call @cc_cons(%453, %454) : (i64, i64) -> i64
      %456 = func.call @cc_values_pack(%455) : (i64) -> i64
      func.call @stack_push_pointer(%453) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %457 = func.call @stack_pop_pointer() : () -> i64
      %458 = func.call @stack_pop_pointer() : () -> i64
      %459 = func.call @cc_cons(%458, %457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %460 = arith.addi %459, %__rlasp_stack_elide_zero_19 : i64
      %461 = func.call @stack_pop_pointer() : () -> i64
      %462 = func.call @cc_cons(%461, %460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %463 = arith.addi %462, %__rlasp_stack_elide_zero_20 : i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%464, %463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %466 = arith.addi %465, %__rlasp_stack_elide_zero_21 : i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%467, %466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %469 = arith.addi %468, %__rlasp_stack_elide_zero_22 : i64
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%470, %469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %472 = arith.addi %471, %__rlasp_stack_elide_zero_23 : i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %475 = arith.addi %474, %__rlasp_stack_elide_zero_24 : i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %478 = arith.addi %477, %__rlasp_stack_elide_zero_25 : i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%480) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %484 = arith.addi %483, %__rlasp_stack_elide_zero_26 : i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @cc_cons(%488, %487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%489) : (i64) -> ()
      %490 = llvm.mlir.addressof @str54 : !llvm.ptr
      %491 = arith.constant 3 : i64
      %492 = func.call @cc_make_string(%490, %491) : (!llvm.ptr, i64) -> i64
      %493 = llvm.mlir.addressof @str55 : !llvm.ptr
      %494 = arith.constant 11 : i64
      %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
      %496 = func.call @cc_intern(%492, %495) : (i64, i64) -> i64
      %497 = func.call @cc_nil_value() : () -> i64
      %498 = func.call @cc_cons(%496, %497) : (i64, i64) -> i64
      %499 = func.call @cc_values_pack(%498) : (i64) -> i64
      func.call @stack_push_pointer(%496) : (i64) -> ()
      %500 = llvm.mlir.addressof @str56 : !llvm.ptr
      %501 = arith.constant 10 : i64
      %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
      %503 = llvm.mlir.addressof @str57 : !llvm.ptr
      %504 = arith.constant 11 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = func.call @cc_intern(%502, %505) : (i64, i64) -> i64
      %507 = func.call @cc_nil_value() : () -> i64
      %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
      %509 = func.call @cc_values_pack(%508) : (i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %510 = llvm.mlir.addressof @str58 : !llvm.ptr
      %511 = arith.constant 4 : i64
      %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
      %513 = func.call @cc_nil_value() : () -> i64
      %514 = func.call @cc_intern(%512, %513) : (i64, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_values_pack(%516) : (i64) -> i64
      func.call @stack_push_pointer(%514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = func.call @stack_pop_pointer() : () -> i64
      %520 = func.call @cc_cons(%519, %518) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %521 = arith.addi %520, %__rlasp_stack_elide_zero_27 : i64
      %522 = func.call @stack_pop_pointer() : () -> i64
      %523 = func.call @cc_cons(%522, %521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%523) : (i64) -> ()
      %524 = llvm.mlir.addressof @str59 : !llvm.ptr
      %525 = arith.constant 12 : i64
      %526 = func.call @cc_make_string(%524, %525) : (!llvm.ptr, i64) -> i64
      %527 = llvm.mlir.addressof @str60 : !llvm.ptr
      %528 = arith.constant 11 : i64
      %529 = func.call @cc_make_string(%527, %528) : (!llvm.ptr, i64) -> i64
      %530 = func.call @cc_intern(%526, %529) : (i64, i64) -> i64
      %531 = func.call @cc_nil_value() : () -> i64
      %532 = func.call @cc_cons(%530, %531) : (i64, i64) -> i64
      %533 = func.call @cc_values_pack(%532) : (i64) -> i64
      func.call @stack_push_pointer(%530) : (i64) -> ()
      %534 = llvm.mlir.addressof @str61 : !llvm.ptr
      %535 = arith.constant 13 : i64
      %536 = func.call @cc_make_string(%534, %535) : (!llvm.ptr, i64) -> i64
      %537 = llvm.mlir.addressof @str62 : !llvm.ptr
      %538 = arith.constant 11 : i64
      %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
      %540 = func.call @cc_intern(%536, %539) : (i64, i64) -> i64
      %541 = func.call @cc_nil_value() : () -> i64
      %542 = func.call @cc_cons(%540, %541) : (i64, i64) -> i64
      %543 = func.call @cc_values_pack(%542) : (i64) -> i64
      func.call @stack_push_pointer(%540) : (i64) -> ()
      %544 = llvm.mlir.addressof @str63 : !llvm.ptr
      %545 = arith.constant 4 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_intern(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %552 = func.call @stack_pop_pointer() : () -> i64
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = func.call @cc_cons(%553, %552) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %555 = arith.addi %554, %__rlasp_stack_elide_zero_28 : i64
      %556 = func.call @stack_pop_pointer() : () -> i64
      %557 = func.call @cc_cons(%556, %555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %558 = llvm.mlir.addressof @str64 : !llvm.ptr
      %559 = arith.constant 7 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = func.call @cc_cons(%562, %561) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %564 = arith.addi %563, %__rlasp_stack_elide_zero_29 : i64
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @cc_cons(%565, %564) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %567 = arith.addi %566, %__rlasp_stack_elide_zero_30 : i64
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @cc_cons(%568, %567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%569) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @cc_cons(%571, %570) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %573 = arith.addi %572, %__rlasp_stack_elide_zero_31 : i64
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = func.call @cc_cons(%574, %573) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %576 = arith.addi %575, %__rlasp_stack_elide_zero_32 : i64
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = func.call @cc_cons(%577, %576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = func.call @stack_pop_pointer() : () -> i64
      %581 = func.call @cc_cons(%580, %579) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %582 = arith.addi %581, %__rlasp_stack_elide_zero_33 : i64
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @cc_cons(%583, %582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %585 = arith.addi %584, %__rlasp_stack_elide_zero_34 : i64
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @cc_cons(%586, %585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %588 = func.call @stack_pop_pointer() : () -> i64
      %589 = func.call @stack_pop_pointer() : () -> i64
      %590 = func.call @cc_cons(%589, %588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %591 = arith.addi %590, %__rlasp_stack_elide_zero_35 : i64
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = func.call @cc_cons(%592, %591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %594 = arith.addi %593, %__rlasp_stack_elide_zero_36 : i64
      %595 = func.call @stack_pop_pointer() : () -> i64
      %596 = func.call @cc_cons(%595, %594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %597 = func.call @stack_pop_pointer() : () -> i64
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = func.call @cc_cons(%598, %597) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %600 = arith.addi %599, %__rlasp_stack_elide_zero_37 : i64
      %601 = func.call @stack_pop_pointer() : () -> i64
      %602 = func.call @cc_cons(%601, %600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %606 = arith.addi %605, %__rlasp_stack_elide_zero_38 : i64
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @cc_cons(%607, %606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %609 = arith.addi %608, %__rlasp_stack_elide_zero_39 : i64
      %830 = arith.constant 96094591647746 : i64
      %831 = arith.constant 0 : i64
      %832 = func.call @cc_make_closure(%830, %831) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %833 = arith.addi %832, %__rlasp_stack_elide_zero_40 : i64
      %834 = llvm.mlir.addressof @str87 : !llvm.ptr
      %835 = arith.constant 1 : i64
      %836 = func.call @cc_make_string(%834, %835) : (!llvm.ptr, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_intern(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
      %841 = func.call @cc_values_pack(%840) : (i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %842 = func.call @stack_pop_pointer() : () -> i64
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @cc_cons(%843, %842) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %845 = arith.addi %844, %__rlasp_stack_elide_zero_41 : i64
      %846 = llvm.mlir.addressof @str88 : !llvm.ptr
      %847 = arith.constant 11 : i64
      %848 = func.call @cc_make_string(%846, %847) : (!llvm.ptr, i64) -> i64
      %849 = llvm.mlir.addressof @str89 : !llvm.ptr
      %850 = arith.constant 7 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = func.call @cc_intern(%848, %851) : (i64, i64) -> i64
      %853 = func.call @cc_nil_value() : () -> i64
      %854 = func.call @cc_cons(%852, %853) : (i64, i64) -> i64
      %855 = func.call @cc_values_pack(%854) : (i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = llvm.mlir.addressof @str90 : !llvm.ptr
      %858 = arith.constant 4 : i64
      %859 = func.call @cc_make_string(%857, %858) : (!llvm.ptr, i64) -> i64
      %860 = llvm.mlir.addressof @str91 : !llvm.ptr
      %861 = arith.constant 7 : i64
      %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
      %863 = func.call @cc_intern(%859, %862) : (i64, i64) -> i64
      %864 = func.call @cc_nil_value() : () -> i64
      %865 = func.call @cc_cons(%863, %864) : (i64, i64) -> i64
      %866 = func.call @cc_values_pack(%865) : (i64) -> i64
      %867 = llvm.mlir.addressof @str92 : !llvm.ptr
      %868 = arith.constant 6 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = func.call @cc_nil_value() : () -> i64
      %871 = func.call @cc_intern(%869, %870) : (i64, i64) -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_cons(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_values_pack(%873) : (i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %875 = arith.addi %871, %__rlasp_stack_elide_zero_42 : i64
      %876 = func.call @cc_nil_value() : () -> i64
      %877 = func.call @cc_errorp(%272) : (i64) -> i64
      %878 = arith.cmpi ne, %877, %876 : i64
      %879 = arith.cmpi eq, %876, %876 : i64
      %880 = arith.andi %878, %879 : i1
      %881 = scf.if %880 -> (i64) {
        scf.yield %272 : i64
      } else {
        scf.yield %876 : i64
      }
      %882 = func.call @cc_errorp(%609) : (i64) -> i64
      %883 = arith.cmpi ne, %882, %876 : i64
      %884 = arith.cmpi eq, %881, %876 : i64
      %885 = arith.andi %883, %884 : i1
      %886 = scf.if %885 -> (i64) {
        scf.yield %609 : i64
      } else {
        scf.yield %881 : i64
      }
      %887 = func.call @cc_errorp(%833) : (i64) -> i64
      %888 = arith.cmpi ne, %887, %876 : i64
      %889 = arith.cmpi eq, %886, %876 : i64
      %890 = arith.andi %888, %889 : i1
      %891 = scf.if %890 -> (i64) {
        scf.yield %833 : i64
      } else {
        scf.yield %886 : i64
      }
      %892 = func.call @cc_errorp(%845) : (i64) -> i64
      %893 = arith.cmpi ne, %892, %876 : i64
      %894 = arith.cmpi eq, %891, %876 : i64
      %895 = arith.andi %893, %894 : i1
      %896 = scf.if %895 -> (i64) {
        scf.yield %845 : i64
      } else {
        scf.yield %891 : i64
      }
      %897 = func.call @cc_errorp(%852) : (i64) -> i64
      %898 = arith.cmpi ne, %897, %876 : i64
      %899 = arith.cmpi eq, %896, %876 : i64
      %900 = arith.andi %898, %899 : i1
      %901 = scf.if %900 -> (i64) {
        scf.yield %852 : i64
      } else {
        scf.yield %896 : i64
      }
      %902 = func.call @cc_errorp(%856) : (i64) -> i64
      %903 = arith.cmpi ne, %902, %876 : i64
      %904 = arith.cmpi eq, %901, %876 : i64
      %905 = arith.andi %903, %904 : i1
      %906 = scf.if %905 -> (i64) {
        scf.yield %856 : i64
      } else {
        scf.yield %901 : i64
      }
      %907 = func.call @cc_errorp(%863) : (i64) -> i64
      %908 = arith.cmpi ne, %907, %876 : i64
      %909 = arith.cmpi eq, %906, %876 : i64
      %910 = arith.andi %908, %909 : i1
      %911 = scf.if %910 -> (i64) {
        scf.yield %863 : i64
      } else {
        scf.yield %906 : i64
      }
      %912 = func.call @cc_errorp(%875) : (i64) -> i64
      %913 = arith.cmpi ne, %912, %876 : i64
      %914 = arith.cmpi eq, %911, %876 : i64
      %915 = arith.andi %913, %914 : i1
      %916 = scf.if %915 -> (i64) {
        scf.yield %875 : i64
      } else {
        scf.yield %911 : i64
      }
      %917 = arith.cmpi ne, %916, %876 : i64
      scf.if %917 {
        func.call @stack_push_pointer(%916) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%272) : (i64) -> ()
        func.call @stack_push_pointer(%609) : (i64) -> ()
        func.call @stack_push_pointer(%833) : (i64) -> ()
        func.call @stack_push_pointer(%845) : (i64) -> ()
        func.call @stack_push_pointer(%852) : (i64) -> ()
        func.call @stack_push_pointer(%856) : (i64) -> ()
        func.call @stack_push_pointer(%863) : (i64) -> ()
        func.call @stack_push_pointer(%875) : (i64) -> ()
        %918 = llvm.mlir.addressof @str93 : !llvm.ptr
        %919 = func.call @cc_make_function_ref_const(%918) : (!llvm.ptr) -> i64
        %920 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%919, %920) : (i64, i64) -> ()
      }
      %921 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %921 : i64
    }
    %922 = func.call @cc_nil_value() : () -> i64
    %923 = func.call @cc_errorp(%263) : (i64) -> i64
    %924 = arith.cmpi ne, %923, %922 : i64
    %925 = scf.if %924 -> (i64) {
      scf.yield %263 : i64
    } else {
      %926 = llvm.mlir.addressof @str94 : !llvm.ptr
      %927 = arith.constant 19 : i64
      %928 = func.call @cc_make_string(%926, %927) : (!llvm.ptr, i64) -> i64
      %929 = func.call @cc_nil_value() : () -> i64
      %930 = func.call @cc_intern(%928, %929) : (i64, i64) -> i64
      %931 = func.call @cc_nil_value() : () -> i64
      %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
      %933 = func.call @cc_values_pack(%932) : (i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %934 = arith.addi %930, %__rlasp_stack_elide_zero_43 : i64
      %935 = llvm.mlir.addressof @str95 : !llvm.ptr
      %936 = arith.constant 3 : i64
      %937 = func.call @cc_make_string(%935, %936) : (!llvm.ptr, i64) -> i64
      %938 = func.call @cc_nil_value() : () -> i64
      %939 = func.call @cc_intern(%937, %938) : (i64, i64) -> i64
      %940 = func.call @cc_nil_value() : () -> i64
      %941 = func.call @cc_cons(%939, %940) : (i64, i64) -> i64
      %942 = func.call @cc_values_pack(%941) : (i64) -> i64
      func.call @stack_push_pointer(%939) : (i64) -> ()
      %943 = llvm.mlir.addressof @str96 : !llvm.ptr
      %944 = arith.constant 3 : i64
      %945 = func.call @cc_make_string(%943, %944) : (!llvm.ptr, i64) -> i64
      %946 = func.call @cc_nil_value() : () -> i64
      %947 = func.call @cc_intern(%945, %946) : (i64, i64) -> i64
      %948 = func.call @cc_nil_value() : () -> i64
      %949 = func.call @cc_cons(%947, %948) : (i64, i64) -> i64
      %950 = func.call @cc_values_pack(%949) : (i64) -> i64
      func.call @stack_push_pointer(%947) : (i64) -> ()
      %951 = llvm.mlir.addressof @str97 : !llvm.ptr
      %952 = arith.constant 3 : i64
      %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      %959 = llvm.mlir.addressof @str98 : !llvm.ptr
      %960 = arith.constant 23 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = llvm.mlir.addressof @str99 : !llvm.ptr
      %963 = arith.constant 3 : i64
      %964 = func.call @cc_make_string(%962, %963) : (!llvm.ptr, i64) -> i64
      %965 = func.call @cc_intern(%961, %964) : (i64, i64) -> i64
      %966 = func.call @cc_nil_value() : () -> i64
      %967 = func.call @cc_cons(%965, %966) : (i64, i64) -> i64
      %968 = func.call @cc_values_pack(%967) : (i64) -> i64
      func.call @stack_push_pointer(%965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %969 = func.call @stack_pop_pointer() : () -> i64
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @cc_cons(%970, %969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %972 = arith.addi %971, %__rlasp_stack_elide_zero_44 : i64
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @cc_cons(%973, %972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%974) : (i64) -> ()
      %975 = llvm.mlir.addressof @str100 : !llvm.ptr
      %976 = arith.constant 4 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = func.call @cc_nil_value() : () -> i64
      %979 = func.call @cc_intern(%977, %978) : (i64, i64) -> i64
      %980 = func.call @cc_nil_value() : () -> i64
      %981 = func.call @cc_cons(%979, %980) : (i64, i64) -> i64
      %982 = func.call @cc_values_pack(%981) : (i64) -> i64
      func.call @stack_push_pointer(%979) : (i64) -> ()
      %983 = llvm.mlir.addressof @str101 : !llvm.ptr
      %984 = arith.constant 44 : i64
      %985 = func.call @cc_make_string(%983, %984) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%985) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = func.call @cc_cons(%987, %986) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %989 = arith.addi %988, %__rlasp_stack_elide_zero_45 : i64
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @cc_cons(%990, %989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %992 = func.call @stack_pop_pointer() : () -> i64
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @cc_cons(%993, %992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %995 = arith.addi %994, %__rlasp_stack_elide_zero_46 : i64
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = func.call @cc_cons(%996, %995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %998 = llvm.mlir.addressof @str102 : !llvm.ptr
      %999 = arith.constant 3 : i64
      %1000 = func.call @cc_make_string(%998, %999) : (!llvm.ptr, i64) -> i64
      %1001 = func.call @cc_nil_value() : () -> i64
      %1002 = func.call @cc_intern(%1000, %1001) : (i64, i64) -> i64
      %1003 = func.call @cc_nil_value() : () -> i64
      %1004 = func.call @cc_cons(%1002, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_values_pack(%1004) : (i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      %1006 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1007 = arith.constant 4 : i64
      %1008 = func.call @cc_make_string(%1006, %1007) : (!llvm.ptr, i64) -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_intern(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_nil_value() : () -> i64
      %1012 = func.call @cc_cons(%1010, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_values_pack(%1012) : (i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1014 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1015 = arith.constant 12 : i64
      %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
      %1017 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1018 = arith.constant 11 : i64
      %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
      %1020 = func.call @cc_intern(%1016, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_values_pack(%1022) : (i64) -> i64
      func.call @stack_push_pointer(%1020) : (i64) -> ()
      %1024 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1025 = arith.constant 4 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_intern(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_nil_value() : () -> i64
      %1030 = func.call @cc_cons(%1028, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_values_pack(%1030) : (i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      %1032 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1033 = arith.constant 11 : i64
      %1034 = func.call @cc_make_string(%1032, %1033) : (!llvm.ptr, i64) -> i64
      %1035 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1036 = arith.constant 7 : i64
      %1037 = func.call @cc_make_string(%1035, %1036) : (!llvm.ptr, i64) -> i64
      %1038 = func.call @cc_intern(%1034, %1037) : (i64, i64) -> i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_cons(%1038, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_values_pack(%1040) : (i64) -> i64
      func.call @stack_push_pointer(%1038) : (i64) -> ()
      %1042 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1043 = arith.constant 13 : i64
      %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
      %1045 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1046 = arith.constant 11 : i64
      %1047 = func.call @cc_make_string(%1045, %1046) : (!llvm.ptr, i64) -> i64
      %1048 = func.call @cc_intern(%1044, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_nil_value() : () -> i64
      %1050 = func.call @cc_cons(%1048, %1049) : (i64, i64) -> i64
      %1051 = func.call @cc_values_pack(%1050) : (i64) -> i64
      func.call @stack_push_pointer(%1048) : (i64) -> ()
      %1052 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1053 = arith.constant 4 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      %1055 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1056 = arith.constant 7 : i64
      %1057 = func.call @cc_make_string(%1055, %1056) : (!llvm.ptr, i64) -> i64
      %1058 = func.call @cc_intern(%1054, %1057) : (i64, i64) -> i64
      %1059 = func.call @cc_nil_value() : () -> i64
      %1060 = func.call @cc_cons(%1058, %1059) : (i64, i64) -> i64
      %1061 = func.call @cc_values_pack(%1060) : (i64) -> i64
      func.call @stack_push_pointer(%1058) : (i64) -> ()
      %1062 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1063 = arith.constant 7 : i64
      %1064 = func.call @cc_make_string(%1062, %1063) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1065 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1066 = arith.constant 8 : i64
      %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
      %1068 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1069 = arith.constant 7 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = func.call @cc_intern(%1067, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_nil_value() : () -> i64
      %1073 = func.call @cc_cons(%1071, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_values_pack(%1073) : (i64) -> i64
      func.call @stack_push_pointer(%1071) : (i64) -> ()
      %1075 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1076 = arith.constant 4 : i64
      %1077 = func.call @cc_make_string(%1075, %1076) : (!llvm.ptr, i64) -> i64
      %1078 = func.call @cc_nil_value() : () -> i64
      %1079 = func.call @cc_intern(%1077, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_cons(%1079, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_values_pack(%1081) : (i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1083 = func.call @stack_pop_pointer() : () -> i64
      %1084 = func.call @stack_pop_pointer() : () -> i64
      %1085 = func.call @cc_cons(%1084, %1083) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1086 = arith.addi %1085, %__rlasp_stack_elide_zero_47 : i64
      %1087 = func.call @stack_pop_pointer() : () -> i64
      %1088 = func.call @cc_cons(%1087, %1086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1089 = arith.addi %1088, %__rlasp_stack_elide_zero_48 : i64
      %1090 = func.call @stack_pop_pointer() : () -> i64
      %1091 = func.call @cc_cons(%1090, %1089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1092 = arith.addi %1091, %__rlasp_stack_elide_zero_49 : i64
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @cc_cons(%1093, %1092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1095 = arith.addi %1094, %__rlasp_stack_elide_zero_50 : i64
      %1096 = func.call @stack_pop_pointer() : () -> i64
      %1097 = func.call @cc_cons(%1096, %1095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1097) : (i64) -> ()
      %1098 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1099 = arith.constant 7 : i64
      %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
      %1101 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1102 = arith.constant 7 : i64
      %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
      %1104 = func.call @cc_intern(%1100, %1103) : (i64, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_cons(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_values_pack(%1106) : (i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1108 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1109 = arith.constant 5 : i64
      %1110 = func.call @cc_make_string(%1108, %1109) : (!llvm.ptr, i64) -> i64
      %1111 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1112 = arith.constant 7 : i64
      %1113 = func.call @cc_make_string(%1111, %1112) : (!llvm.ptr, i64) -> i64
      %1114 = func.call @cc_intern(%1110, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @stack_pop_pointer() : () -> i64
      %1120 = func.call @cc_cons(%1119, %1118) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1121 = arith.addi %1120, %__rlasp_stack_elide_zero_51 : i64
      %1122 = func.call @stack_pop_pointer() : () -> i64
      %1123 = func.call @cc_cons(%1122, %1121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1124 = arith.addi %1123, %__rlasp_stack_elide_zero_52 : i64
      %1125 = func.call @stack_pop_pointer() : () -> i64
      %1126 = func.call @cc_cons(%1125, %1124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1127 = arith.addi %1126, %__rlasp_stack_elide_zero_53 : i64
      %1128 = func.call @stack_pop_pointer() : () -> i64
      %1129 = func.call @cc_cons(%1128, %1127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1130 = arith.addi %1129, %__rlasp_stack_elide_zero_54 : i64
      %1131 = func.call @stack_pop_pointer() : () -> i64
      %1132 = func.call @cc_cons(%1131, %1130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1133 = arith.addi %1132, %__rlasp_stack_elide_zero_55 : i64
      %1134 = func.call @stack_pop_pointer() : () -> i64
      %1135 = func.call @cc_cons(%1134, %1133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1136 = arith.addi %1135, %__rlasp_stack_elide_zero_56 : i64
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @cc_cons(%1137, %1136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1139 = arith.addi %1138, %__rlasp_stack_elide_zero_57 : i64
      %1140 = func.call @stack_pop_pointer() : () -> i64
      %1141 = func.call @cc_cons(%1140, %1139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @cc_cons(%1143, %1142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1145 = arith.addi %1144, %__rlasp_stack_elide_zero_58 : i64
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @cc_cons(%1146, %1145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @cc_cons(%1149, %1148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1151 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1152 = arith.constant 3 : i64
      %1153 = func.call @cc_make_string(%1151, %1152) : (!llvm.ptr, i64) -> i64
      %1154 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1155 = arith.constant 11 : i64
      %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
      %1157 = func.call @cc_intern(%1153, %1156) : (i64, i64) -> i64
      %1158 = func.call @cc_nil_value() : () -> i64
      %1159 = func.call @cc_cons(%1157, %1158) : (i64, i64) -> i64
      %1160 = func.call @cc_values_pack(%1159) : (i64) -> i64
      func.call @stack_push_pointer(%1157) : (i64) -> ()
      %1161 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1162 = arith.constant 10 : i64
      %1163 = func.call @cc_make_string(%1161, %1162) : (!llvm.ptr, i64) -> i64
      %1164 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1165 = arith.constant 11 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = func.call @cc_intern(%1163, %1166) : (i64, i64) -> i64
      %1168 = func.call @cc_nil_value() : () -> i64
      %1169 = func.call @cc_cons(%1167, %1168) : (i64, i64) -> i64
      %1170 = func.call @cc_values_pack(%1169) : (i64) -> i64
      func.call @stack_push_pointer(%1167) : (i64) -> ()
      %1171 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1172 = arith.constant 4 : i64
      %1173 = func.call @cc_make_string(%1171, %1172) : (!llvm.ptr, i64) -> i64
      %1174 = func.call @cc_nil_value() : () -> i64
      %1175 = func.call @cc_intern(%1173, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_cons(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_values_pack(%1177) : (i64) -> i64
      func.call @stack_push_pointer(%1175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1179 = func.call @stack_pop_pointer() : () -> i64
      %1180 = func.call @stack_pop_pointer() : () -> i64
      %1181 = func.call @cc_cons(%1180, %1179) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1182 = arith.addi %1181, %__rlasp_stack_elide_zero_59 : i64
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @cc_cons(%1183, %1182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      %1185 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1186 = arith.constant 12 : i64
      %1187 = func.call @cc_make_string(%1185, %1186) : (!llvm.ptr, i64) -> i64
      %1188 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1189 = arith.constant 11 : i64
      %1190 = func.call @cc_make_string(%1188, %1189) : (!llvm.ptr, i64) -> i64
      %1191 = func.call @cc_intern(%1187, %1190) : (i64, i64) -> i64
      %1192 = func.call @cc_nil_value() : () -> i64
      %1193 = func.call @cc_cons(%1191, %1192) : (i64, i64) -> i64
      %1194 = func.call @cc_values_pack(%1193) : (i64) -> i64
      func.call @stack_push_pointer(%1191) : (i64) -> ()
      %1195 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1196 = arith.constant 13 : i64
      %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
      %1198 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1199 = arith.constant 11 : i64
      %1200 = func.call @cc_make_string(%1198, %1199) : (!llvm.ptr, i64) -> i64
      %1201 = func.call @cc_intern(%1197, %1200) : (i64, i64) -> i64
      %1202 = func.call @cc_nil_value() : () -> i64
      %1203 = func.call @cc_cons(%1201, %1202) : (i64, i64) -> i64
      %1204 = func.call @cc_values_pack(%1203) : (i64) -> i64
      func.call @stack_push_pointer(%1201) : (i64) -> ()
      %1205 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1206 = arith.constant 4 : i64
      %1207 = func.call @cc_make_string(%1205, %1206) : (!llvm.ptr, i64) -> i64
      %1208 = func.call @cc_nil_value() : () -> i64
      %1209 = func.call @cc_intern(%1207, %1208) : (i64, i64) -> i64
      %1210 = func.call @cc_nil_value() : () -> i64
      %1211 = func.call @cc_cons(%1209, %1210) : (i64, i64) -> i64
      %1212 = func.call @cc_values_pack(%1211) : (i64) -> i64
      func.call @stack_push_pointer(%1209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1213 = func.call @stack_pop_pointer() : () -> i64
      %1214 = func.call @stack_pop_pointer() : () -> i64
      %1215 = func.call @cc_cons(%1214, %1213) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1216 = arith.addi %1215, %__rlasp_stack_elide_zero_60 : i64
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = func.call @cc_cons(%1217, %1216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
      %1219 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1220 = arith.constant 7 : i64
      %1221 = func.call @cc_make_string(%1219, %1220) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1221) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1222 = func.call @stack_pop_pointer() : () -> i64
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @cc_cons(%1223, %1222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1225 = arith.addi %1224, %__rlasp_stack_elide_zero_61 : i64
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1227 = func.call @cc_cons(%1226, %1225) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1228 = arith.addi %1227, %__rlasp_stack_elide_zero_62 : i64
      %1229 = func.call @stack_pop_pointer() : () -> i64
      %1230 = func.call @cc_cons(%1229, %1228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1230) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1231 = func.call @stack_pop_pointer() : () -> i64
      %1232 = func.call @stack_pop_pointer() : () -> i64
      %1233 = func.call @cc_cons(%1232, %1231) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1234 = arith.addi %1233, %__rlasp_stack_elide_zero_63 : i64
      %1235 = func.call @stack_pop_pointer() : () -> i64
      %1236 = func.call @cc_cons(%1235, %1234) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1237 = arith.addi %1236, %__rlasp_stack_elide_zero_64 : i64
      %1238 = func.call @stack_pop_pointer() : () -> i64
      %1239 = func.call @cc_cons(%1238, %1237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1239) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = func.call @cc_cons(%1241, %1240) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1243 = arith.addi %1242, %__rlasp_stack_elide_zero_65 : i64
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = func.call @cc_cons(%1244, %1243) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1246 = arith.addi %1245, %__rlasp_stack_elide_zero_66 : i64
      %1247 = func.call @stack_pop_pointer() : () -> i64
      %1248 = func.call @cc_cons(%1247, %1246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = func.call @stack_pop_pointer() : () -> i64
      %1251 = func.call @cc_cons(%1250, %1249) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1252 = arith.addi %1251, %__rlasp_stack_elide_zero_67 : i64
      %1253 = func.call @stack_pop_pointer() : () -> i64
      %1254 = func.call @cc_cons(%1253, %1252) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1255 = arith.addi %1254, %__rlasp_stack_elide_zero_68 : i64
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1256, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1258 = func.call @stack_pop_pointer() : () -> i64
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = func.call @cc_cons(%1259, %1258) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1261 = arith.addi %1260, %__rlasp_stack_elide_zero_69 : i64
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_cons(%1262, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = func.call @cc_cons(%1265, %1264) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1267 = arith.addi %1266, %__rlasp_stack_elide_zero_70 : i64
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1268, %1267) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1270 = arith.addi %1269, %__rlasp_stack_elide_zero_71 : i64
      %1491 = arith.constant 96094591647747 : i64
      %1492 = arith.constant 0 : i64
      %1493 = func.call @cc_make_closure(%1491, %1492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1494 = arith.addi %1493, %__rlasp_stack_elide_zero_72 : i64
      %1495 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1496 = arith.constant 1 : i64
      %1497 = func.call @cc_make_string(%1495, %1496) : (!llvm.ptr, i64) -> i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_intern(%1497, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_nil_value() : () -> i64
      %1501 = func.call @cc_cons(%1499, %1500) : (i64, i64) -> i64
      %1502 = func.call @cc_values_pack(%1501) : (i64) -> i64
      func.call @stack_push_pointer(%1499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1503 = func.call @stack_pop_pointer() : () -> i64
      %1504 = func.call @stack_pop_pointer() : () -> i64
      %1505 = func.call @cc_cons(%1504, %1503) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1506 = arith.addi %1505, %__rlasp_stack_elide_zero_73 : i64
      %1507 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1508 = arith.constant 11 : i64
      %1509 = func.call @cc_make_string(%1507, %1508) : (!llvm.ptr, i64) -> i64
      %1510 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1511 = arith.constant 7 : i64
      %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
      %1513 = func.call @cc_intern(%1509, %1512) : (i64, i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = func.call @cc_cons(%1513, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_values_pack(%1515) : (i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1519 = arith.constant 4 : i64
      %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
      %1521 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1522 = arith.constant 7 : i64
      %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
      %1524 = func.call @cc_intern(%1520, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_cons(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_values_pack(%1526) : (i64) -> i64
      %1528 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1529 = arith.constant 6 : i64
      %1530 = func.call @cc_make_string(%1528, %1529) : (!llvm.ptr, i64) -> i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_intern(%1530, %1531) : (i64, i64) -> i64
      %1533 = func.call @cc_nil_value() : () -> i64
      %1534 = func.call @cc_cons(%1532, %1533) : (i64, i64) -> i64
      %1535 = func.call @cc_values_pack(%1534) : (i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1536 = arith.addi %1532, %__rlasp_stack_elide_zero_74 : i64
      %1537 = func.call @cc_nil_value() : () -> i64
      %1538 = func.call @cc_errorp(%934) : (i64) -> i64
      %1539 = arith.cmpi ne, %1538, %1537 : i64
      %1540 = arith.cmpi eq, %1537, %1537 : i64
      %1541 = arith.andi %1539, %1540 : i1
      %1542 = scf.if %1541 -> (i64) {
        scf.yield %934 : i64
      } else {
        scf.yield %1537 : i64
      }
      %1543 = func.call @cc_errorp(%1270) : (i64) -> i64
      %1544 = arith.cmpi ne, %1543, %1537 : i64
      %1545 = arith.cmpi eq, %1542, %1537 : i64
      %1546 = arith.andi %1544, %1545 : i1
      %1547 = scf.if %1546 -> (i64) {
        scf.yield %1270 : i64
      } else {
        scf.yield %1542 : i64
      }
      %1548 = func.call @cc_errorp(%1494) : (i64) -> i64
      %1549 = arith.cmpi ne, %1548, %1537 : i64
      %1550 = arith.cmpi eq, %1547, %1537 : i64
      %1551 = arith.andi %1549, %1550 : i1
      %1552 = scf.if %1551 -> (i64) {
        scf.yield %1494 : i64
      } else {
        scf.yield %1547 : i64
      }
      %1553 = func.call @cc_errorp(%1506) : (i64) -> i64
      %1554 = arith.cmpi ne, %1553, %1537 : i64
      %1555 = arith.cmpi eq, %1552, %1537 : i64
      %1556 = arith.andi %1554, %1555 : i1
      %1557 = scf.if %1556 -> (i64) {
        scf.yield %1506 : i64
      } else {
        scf.yield %1552 : i64
      }
      %1558 = func.call @cc_errorp(%1513) : (i64) -> i64
      %1559 = arith.cmpi ne, %1558, %1537 : i64
      %1560 = arith.cmpi eq, %1557, %1537 : i64
      %1561 = arith.andi %1559, %1560 : i1
      %1562 = scf.if %1561 -> (i64) {
        scf.yield %1513 : i64
      } else {
        scf.yield %1557 : i64
      }
      %1563 = func.call @cc_errorp(%1517) : (i64) -> i64
      %1564 = arith.cmpi ne, %1563, %1537 : i64
      %1565 = arith.cmpi eq, %1562, %1537 : i64
      %1566 = arith.andi %1564, %1565 : i1
      %1567 = scf.if %1566 -> (i64) {
        scf.yield %1517 : i64
      } else {
        scf.yield %1562 : i64
      }
      %1568 = func.call @cc_errorp(%1524) : (i64) -> i64
      %1569 = arith.cmpi ne, %1568, %1537 : i64
      %1570 = arith.cmpi eq, %1567, %1537 : i64
      %1571 = arith.andi %1569, %1570 : i1
      %1572 = scf.if %1571 -> (i64) {
        scf.yield %1524 : i64
      } else {
        scf.yield %1567 : i64
      }
      %1573 = func.call @cc_errorp(%1536) : (i64) -> i64
      %1574 = arith.cmpi ne, %1573, %1537 : i64
      %1575 = arith.cmpi eq, %1572, %1537 : i64
      %1576 = arith.andi %1574, %1575 : i1
      %1577 = scf.if %1576 -> (i64) {
        scf.yield %1536 : i64
      } else {
        scf.yield %1572 : i64
      }
      %1578 = arith.cmpi ne, %1577, %1537 : i64
      scf.if %1578 {
        func.call @stack_push_pointer(%1577) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%934) : (i64) -> ()
        func.call @stack_push_pointer(%1270) : (i64) -> ()
        func.call @stack_push_pointer(%1494) : (i64) -> ()
        func.call @stack_push_pointer(%1506) : (i64) -> ()
        func.call @stack_push_pointer(%1513) : (i64) -> ()
        func.call @stack_push_pointer(%1517) : (i64) -> ()
        func.call @stack_push_pointer(%1524) : (i64) -> ()
        func.call @stack_push_pointer(%1536) : (i64) -> ()
        %1579 = llvm.mlir.addressof @str160 : !llvm.ptr
        %1580 = func.call @cc_make_function_ref_const(%1579) : (!llvm.ptr) -> i64
        %1581 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1580, %1581) : (i64, i64) -> ()
      }
      %1582 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1582 : i64
    }
    %1583 = func.call @cc_nil_value() : () -> i64
    %1584 = func.call @cc_errorp(%925) : (i64) -> i64
    %1585 = arith.cmpi ne, %1584, %1583 : i64
    %1586 = scf.if %1585 -> (i64) {
      scf.yield %925 : i64
    } else {
      %1587 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1588 = arith.constant 27 : i64
      %1589 = func.call @cc_make_string(%1587, %1588) : (!llvm.ptr, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_intern(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_cons(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_values_pack(%1593) : (i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1595 = arith.addi %1591, %__rlasp_stack_elide_zero_75 : i64
      %1596 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1597 = arith.constant 3 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_intern(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_nil_value() : () -> i64
      %1602 = func.call @cc_cons(%1600, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_values_pack(%1602) : (i64) -> i64
      func.call @stack_push_pointer(%1600) : (i64) -> ()
      %1604 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1605 = arith.constant 3 : i64
      %1606 = func.call @cc_make_string(%1604, %1605) : (!llvm.ptr, i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = func.call @cc_intern(%1606, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_cons(%1608, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_values_pack(%1610) : (i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      %1612 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1613 = arith.constant 3 : i64
      %1614 = func.call @cc_make_string(%1612, %1613) : (!llvm.ptr, i64) -> i64
      %1615 = func.call @cc_nil_value() : () -> i64
      %1616 = func.call @cc_intern(%1614, %1615) : (i64, i64) -> i64
      %1617 = func.call @cc_nil_value() : () -> i64
      %1618 = func.call @cc_cons(%1616, %1617) : (i64, i64) -> i64
      %1619 = func.call @cc_values_pack(%1618) : (i64) -> i64
      func.call @stack_push_pointer(%1616) : (i64) -> ()
      %1620 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1621 = arith.constant 23 : i64
      %1622 = func.call @cc_make_string(%1620, %1621) : (!llvm.ptr, i64) -> i64
      %1623 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1624 = arith.constant 3 : i64
      %1625 = func.call @cc_make_string(%1623, %1624) : (!llvm.ptr, i64) -> i64
      %1626 = func.call @cc_intern(%1622, %1625) : (i64, i64) -> i64
      %1627 = func.call @cc_nil_value() : () -> i64
      %1628 = func.call @cc_cons(%1626, %1627) : (i64, i64) -> i64
      %1629 = func.call @cc_values_pack(%1628) : (i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1630 = func.call @stack_pop_pointer() : () -> i64
      %1631 = func.call @stack_pop_pointer() : () -> i64
      %1632 = func.call @cc_cons(%1631, %1630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1633 = arith.addi %1632, %__rlasp_stack_elide_zero_76 : i64
      %1634 = func.call @stack_pop_pointer() : () -> i64
      %1635 = func.call @cc_cons(%1634, %1633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1636 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1637 = arith.constant 21 : i64
      %1638 = func.call @cc_make_string(%1636, %1637) : (!llvm.ptr, i64) -> i64
      %1639 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1640 = arith.constant 3 : i64
      %1641 = func.call @cc_make_string(%1639, %1640) : (!llvm.ptr, i64) -> i64
      %1642 = func.call @cc_intern(%1638, %1641) : (i64, i64) -> i64
      %1643 = func.call @cc_nil_value() : () -> i64
      %1644 = func.call @cc_cons(%1642, %1643) : (i64, i64) -> i64
      %1645 = func.call @cc_values_pack(%1644) : (i64) -> i64
      func.call @stack_push_pointer(%1642) : (i64) -> ()
      %1646 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1647 = arith.constant 4 : i64
      %1648 = func.call @cc_make_string(%1646, %1647) : (!llvm.ptr, i64) -> i64
      %1649 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1650 = arith.constant 7 : i64
      %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
      %1652 = func.call @cc_intern(%1648, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      func.call @stack_push_pointer(%1652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1656 = func.call @stack_pop_pointer() : () -> i64
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @cc_cons(%1657, %1656) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1659 = arith.addi %1658, %__rlasp_stack_elide_zero_77 : i64
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @cc_cons(%1660, %1659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1661) : (i64) -> ()
      %1662 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1663 = arith.constant 4 : i64
      %1664 = func.call @cc_make_string(%1662, %1663) : (!llvm.ptr, i64) -> i64
      %1665 = func.call @cc_nil_value() : () -> i64
      %1666 = func.call @cc_intern(%1664, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_nil_value() : () -> i64
      %1668 = func.call @cc_cons(%1666, %1667) : (i64, i64) -> i64
      %1669 = func.call @cc_values_pack(%1668) : (i64) -> i64
      func.call @stack_push_pointer(%1666) : (i64) -> ()
      %1670 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1671 = arith.constant 44 : i64
      %1672 = func.call @cc_make_string(%1670, %1671) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1672) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1673 = func.call @stack_pop_pointer() : () -> i64
      %1674 = func.call @stack_pop_pointer() : () -> i64
      %1675 = func.call @cc_cons(%1674, %1673) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1676 = arith.addi %1675, %__rlasp_stack_elide_zero_78 : i64
      %1677 = func.call @stack_pop_pointer() : () -> i64
      %1678 = func.call @cc_cons(%1677, %1676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1679 = func.call @stack_pop_pointer() : () -> i64
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @cc_cons(%1680, %1679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1682 = arith.addi %1681, %__rlasp_stack_elide_zero_79 : i64
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @cc_cons(%1683, %1682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1685 = arith.addi %1684, %__rlasp_stack_elide_zero_80 : i64
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @cc_cons(%1686, %1685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1687) : (i64) -> ()
      %1688 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1689 = arith.constant 3 : i64
      %1690 = func.call @cc_make_string(%1688, %1689) : (!llvm.ptr, i64) -> i64
      %1691 = func.call @cc_nil_value() : () -> i64
      %1692 = func.call @cc_intern(%1690, %1691) : (i64, i64) -> i64
      %1693 = func.call @cc_nil_value() : () -> i64
      %1694 = func.call @cc_cons(%1692, %1693) : (i64, i64) -> i64
      %1695 = func.call @cc_values_pack(%1694) : (i64) -> i64
      func.call @stack_push_pointer(%1692) : (i64) -> ()
      %1696 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1697 = arith.constant 4 : i64
      %1698 = func.call @cc_make_string(%1696, %1697) : (!llvm.ptr, i64) -> i64
      %1699 = func.call @cc_nil_value() : () -> i64
      %1700 = func.call @cc_intern(%1698, %1699) : (i64, i64) -> i64
      %1701 = func.call @cc_nil_value() : () -> i64
      %1702 = func.call @cc_cons(%1700, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_values_pack(%1702) : (i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1704 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1705 = arith.constant 12 : i64
      %1706 = func.call @cc_make_string(%1704, %1705) : (!llvm.ptr, i64) -> i64
      %1707 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1708 = arith.constant 11 : i64
      %1709 = func.call @cc_make_string(%1707, %1708) : (!llvm.ptr, i64) -> i64
      %1710 = func.call @cc_intern(%1706, %1709) : (i64, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_cons(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_values_pack(%1712) : (i64) -> i64
      func.call @stack_push_pointer(%1710) : (i64) -> ()
      %1714 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1715 = arith.constant 4 : i64
      %1716 = func.call @cc_make_string(%1714, %1715) : (!llvm.ptr, i64) -> i64
      %1717 = func.call @cc_nil_value() : () -> i64
      %1718 = func.call @cc_intern(%1716, %1717) : (i64, i64) -> i64
      %1719 = func.call @cc_nil_value() : () -> i64
      %1720 = func.call @cc_cons(%1718, %1719) : (i64, i64) -> i64
      %1721 = func.call @cc_values_pack(%1720) : (i64) -> i64
      func.call @stack_push_pointer(%1718) : (i64) -> ()
      %1722 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1723 = arith.constant 11 : i64
      %1724 = func.call @cc_make_string(%1722, %1723) : (!llvm.ptr, i64) -> i64
      %1725 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1726 = arith.constant 7 : i64
      %1727 = func.call @cc_make_string(%1725, %1726) : (!llvm.ptr, i64) -> i64
      %1728 = func.call @cc_intern(%1724, %1727) : (i64, i64) -> i64
      %1729 = func.call @cc_nil_value() : () -> i64
      %1730 = func.call @cc_cons(%1728, %1729) : (i64, i64) -> i64
      %1731 = func.call @cc_values_pack(%1730) : (i64) -> i64
      func.call @stack_push_pointer(%1728) : (i64) -> ()
      %1732 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1733 = arith.constant 13 : i64
      %1734 = func.call @cc_make_string(%1732, %1733) : (!llvm.ptr, i64) -> i64
      %1735 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1736 = arith.constant 11 : i64
      %1737 = func.call @cc_make_string(%1735, %1736) : (!llvm.ptr, i64) -> i64
      %1738 = func.call @cc_intern(%1734, %1737) : (i64, i64) -> i64
      %1739 = func.call @cc_nil_value() : () -> i64
      %1740 = func.call @cc_cons(%1738, %1739) : (i64, i64) -> i64
      %1741 = func.call @cc_values_pack(%1740) : (i64) -> i64
      func.call @stack_push_pointer(%1738) : (i64) -> ()
      %1742 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1743 = arith.constant 4 : i64
      %1744 = func.call @cc_make_string(%1742, %1743) : (!llvm.ptr, i64) -> i64
      %1745 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1746 = arith.constant 7 : i64
      %1747 = func.call @cc_make_string(%1745, %1746) : (!llvm.ptr, i64) -> i64
      %1748 = func.call @cc_intern(%1744, %1747) : (i64, i64) -> i64
      %1749 = func.call @cc_nil_value() : () -> i64
      %1750 = func.call @cc_cons(%1748, %1749) : (i64, i64) -> i64
      %1751 = func.call @cc_values_pack(%1750) : (i64) -> i64
      func.call @stack_push_pointer(%1748) : (i64) -> ()
      %1752 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1753 = arith.constant 7 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1754) : (i64) -> ()
      %1755 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1756 = arith.constant 8 : i64
      %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
      %1758 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1759 = arith.constant 7 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = func.call @cc_intern(%1757, %1760) : (i64, i64) -> i64
      %1762 = func.call @cc_nil_value() : () -> i64
      %1763 = func.call @cc_cons(%1761, %1762) : (i64, i64) -> i64
      %1764 = func.call @cc_values_pack(%1763) : (i64) -> i64
      func.call @stack_push_pointer(%1761) : (i64) -> ()
      %1765 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1766 = arith.constant 4 : i64
      %1767 = func.call @cc_make_string(%1765, %1766) : (!llvm.ptr, i64) -> i64
      %1768 = func.call @cc_nil_value() : () -> i64
      %1769 = func.call @cc_intern(%1767, %1768) : (i64, i64) -> i64
      %1770 = func.call @cc_nil_value() : () -> i64
      %1771 = func.call @cc_cons(%1769, %1770) : (i64, i64) -> i64
      %1772 = func.call @cc_values_pack(%1771) : (i64) -> i64
      func.call @stack_push_pointer(%1769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1773 = func.call @stack_pop_pointer() : () -> i64
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = func.call @cc_cons(%1774, %1773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1776 = arith.addi %1775, %__rlasp_stack_elide_zero_81 : i64
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = func.call @cc_cons(%1777, %1776) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1779 = arith.addi %1778, %__rlasp_stack_elide_zero_82 : i64
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @cc_cons(%1780, %1779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1782 = arith.addi %1781, %__rlasp_stack_elide_zero_83 : i64
      %1783 = func.call @stack_pop_pointer() : () -> i64
      %1784 = func.call @cc_cons(%1783, %1782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1785 = arith.addi %1784, %__rlasp_stack_elide_zero_84 : i64
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @cc_cons(%1786, %1785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      %1788 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1789 = arith.constant 7 : i64
      %1790 = func.call @cc_make_string(%1788, %1789) : (!llvm.ptr, i64) -> i64
      %1791 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1792 = arith.constant 7 : i64
      %1793 = func.call @cc_make_string(%1791, %1792) : (!llvm.ptr, i64) -> i64
      %1794 = func.call @cc_intern(%1790, %1793) : (i64, i64) -> i64
      %1795 = func.call @cc_nil_value() : () -> i64
      %1796 = func.call @cc_cons(%1794, %1795) : (i64, i64) -> i64
      %1797 = func.call @cc_values_pack(%1796) : (i64) -> i64
      func.call @stack_push_pointer(%1794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1798 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1799 = arith.constant 5 : i64
      %1800 = func.call @cc_make_string(%1798, %1799) : (!llvm.ptr, i64) -> i64
      %1801 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1802 = arith.constant 7 : i64
      %1803 = func.call @cc_make_string(%1801, %1802) : (!llvm.ptr, i64) -> i64
      %1804 = func.call @cc_intern(%1800, %1803) : (i64, i64) -> i64
      %1805 = func.call @cc_nil_value() : () -> i64
      %1806 = func.call @cc_cons(%1804, %1805) : (i64, i64) -> i64
      %1807 = func.call @cc_values_pack(%1806) : (i64) -> i64
      func.call @stack_push_pointer(%1804) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1808 = func.call @stack_pop_pointer() : () -> i64
      %1809 = func.call @stack_pop_pointer() : () -> i64
      %1810 = func.call @cc_cons(%1809, %1808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1811 = arith.addi %1810, %__rlasp_stack_elide_zero_85 : i64
      %1812 = func.call @stack_pop_pointer() : () -> i64
      %1813 = func.call @cc_cons(%1812, %1811) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1814 = arith.addi %1813, %__rlasp_stack_elide_zero_86 : i64
      %1815 = func.call @stack_pop_pointer() : () -> i64
      %1816 = func.call @cc_cons(%1815, %1814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1817 = arith.addi %1816, %__rlasp_stack_elide_zero_87 : i64
      %1818 = func.call @stack_pop_pointer() : () -> i64
      %1819 = func.call @cc_cons(%1818, %1817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1820 = arith.addi %1819, %__rlasp_stack_elide_zero_88 : i64
      %1821 = func.call @stack_pop_pointer() : () -> i64
      %1822 = func.call @cc_cons(%1821, %1820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1823 = arith.addi %1822, %__rlasp_stack_elide_zero_89 : i64
      %1824 = func.call @stack_pop_pointer() : () -> i64
      %1825 = func.call @cc_cons(%1824, %1823) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1826 = arith.addi %1825, %__rlasp_stack_elide_zero_90 : i64
      %1827 = func.call @stack_pop_pointer() : () -> i64
      %1828 = func.call @cc_cons(%1827, %1826) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1829 = arith.addi %1828, %__rlasp_stack_elide_zero_91 : i64
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @cc_cons(%1830, %1829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1832 = func.call @stack_pop_pointer() : () -> i64
      %1833 = func.call @stack_pop_pointer() : () -> i64
      %1834 = func.call @cc_cons(%1833, %1832) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1835 = arith.addi %1834, %__rlasp_stack_elide_zero_92 : i64
      %1836 = func.call @stack_pop_pointer() : () -> i64
      %1837 = func.call @cc_cons(%1836, %1835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @stack_pop_pointer() : () -> i64
      %1840 = func.call @cc_cons(%1839, %1838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1840) : (i64) -> ()
      %1841 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1842 = arith.constant 3 : i64
      %1843 = func.call @cc_make_string(%1841, %1842) : (!llvm.ptr, i64) -> i64
      %1844 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1845 = arith.constant 11 : i64
      %1846 = func.call @cc_make_string(%1844, %1845) : (!llvm.ptr, i64) -> i64
      %1847 = func.call @cc_intern(%1843, %1846) : (i64, i64) -> i64
      %1848 = func.call @cc_nil_value() : () -> i64
      %1849 = func.call @cc_cons(%1847, %1848) : (i64, i64) -> i64
      %1850 = func.call @cc_values_pack(%1849) : (i64) -> i64
      func.call @stack_push_pointer(%1847) : (i64) -> ()
      %1851 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1852 = arith.constant 10 : i64
      %1853 = func.call @cc_make_string(%1851, %1852) : (!llvm.ptr, i64) -> i64
      %1854 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1855 = arith.constant 11 : i64
      %1856 = func.call @cc_make_string(%1854, %1855) : (!llvm.ptr, i64) -> i64
      %1857 = func.call @cc_intern(%1853, %1856) : (i64, i64) -> i64
      %1858 = func.call @cc_nil_value() : () -> i64
      %1859 = func.call @cc_cons(%1857, %1858) : (i64, i64) -> i64
      %1860 = func.call @cc_values_pack(%1859) : (i64) -> i64
      func.call @stack_push_pointer(%1857) : (i64) -> ()
      %1861 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1862 = arith.constant 4 : i64
      %1863 = func.call @cc_make_string(%1861, %1862) : (!llvm.ptr, i64) -> i64
      %1864 = func.call @cc_nil_value() : () -> i64
      %1865 = func.call @cc_intern(%1863, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_nil_value() : () -> i64
      %1867 = func.call @cc_cons(%1865, %1866) : (i64, i64) -> i64
      %1868 = func.call @cc_values_pack(%1867) : (i64) -> i64
      func.call @stack_push_pointer(%1865) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1869 = func.call @stack_pop_pointer() : () -> i64
      %1870 = func.call @stack_pop_pointer() : () -> i64
      %1871 = func.call @cc_cons(%1870, %1869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1872 = arith.addi %1871, %__rlasp_stack_elide_zero_93 : i64
      %1873 = func.call @stack_pop_pointer() : () -> i64
      %1874 = func.call @cc_cons(%1873, %1872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1874) : (i64) -> ()
      %1875 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1876 = arith.constant 12 : i64
      %1877 = func.call @cc_make_string(%1875, %1876) : (!llvm.ptr, i64) -> i64
      %1878 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1879 = arith.constant 11 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_intern(%1877, %1880) : (i64, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_cons(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_values_pack(%1883) : (i64) -> i64
      func.call @stack_push_pointer(%1881) : (i64) -> ()
      %1885 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1886 = arith.constant 13 : i64
      %1887 = func.call @cc_make_string(%1885, %1886) : (!llvm.ptr, i64) -> i64
      %1888 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1889 = arith.constant 11 : i64
      %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
      %1891 = func.call @cc_intern(%1887, %1890) : (i64, i64) -> i64
      %1892 = func.call @cc_nil_value() : () -> i64
      %1893 = func.call @cc_cons(%1891, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_values_pack(%1893) : (i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      %1895 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1896 = arith.constant 4 : i64
      %1897 = func.call @cc_make_string(%1895, %1896) : (!llvm.ptr, i64) -> i64
      %1898 = func.call @cc_nil_value() : () -> i64
      %1899 = func.call @cc_intern(%1897, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_cons(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_values_pack(%1901) : (i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1903 = func.call @stack_pop_pointer() : () -> i64
      %1904 = func.call @stack_pop_pointer() : () -> i64
      %1905 = func.call @cc_cons(%1904, %1903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1906 = arith.addi %1905, %__rlasp_stack_elide_zero_94 : i64
      %1907 = func.call @stack_pop_pointer() : () -> i64
      %1908 = func.call @cc_cons(%1907, %1906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1909 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1910 = arith.constant 7 : i64
      %1911 = func.call @cc_make_string(%1909, %1910) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1911) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @stack_pop_pointer() : () -> i64
      %1914 = func.call @cc_cons(%1913, %1912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1915 = arith.addi %1914, %__rlasp_stack_elide_zero_95 : i64
      %1916 = func.call @stack_pop_pointer() : () -> i64
      %1917 = func.call @cc_cons(%1916, %1915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1918 = arith.addi %1917, %__rlasp_stack_elide_zero_96 : i64
      %1919 = func.call @stack_pop_pointer() : () -> i64
      %1920 = func.call @cc_cons(%1919, %1918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1921 = func.call @stack_pop_pointer() : () -> i64
      %1922 = func.call @stack_pop_pointer() : () -> i64
      %1923 = func.call @cc_cons(%1922, %1921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1924 = arith.addi %1923, %__rlasp_stack_elide_zero_97 : i64
      %1925 = func.call @stack_pop_pointer() : () -> i64
      %1926 = func.call @cc_cons(%1925, %1924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1927 = arith.addi %1926, %__rlasp_stack_elide_zero_98 : i64
      %1928 = func.call @stack_pop_pointer() : () -> i64
      %1929 = func.call @cc_cons(%1928, %1927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @stack_pop_pointer() : () -> i64
      %1932 = func.call @cc_cons(%1931, %1930) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %1933 = arith.addi %1932, %__rlasp_stack_elide_zero_99 : i64
      %1934 = func.call @stack_pop_pointer() : () -> i64
      %1935 = func.call @cc_cons(%1934, %1933) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %1936 = arith.addi %1935, %__rlasp_stack_elide_zero_100 : i64
      %1937 = func.call @stack_pop_pointer() : () -> i64
      %1938 = func.call @cc_cons(%1937, %1936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %1942 = arith.addi %1941, %__rlasp_stack_elide_zero_101 : i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %1945 = arith.addi %1944, %__rlasp_stack_elide_zero_102 : i64
      %1946 = func.call @stack_pop_pointer() : () -> i64
      %1947 = func.call @cc_cons(%1946, %1945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1947) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @stack_pop_pointer() : () -> i64
      %1950 = func.call @cc_cons(%1949, %1948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %1951 = arith.addi %1950, %__rlasp_stack_elide_zero_103 : i64
      %1952 = func.call @stack_pop_pointer() : () -> i64
      %1953 = func.call @cc_cons(%1952, %1951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @stack_pop_pointer() : () -> i64
      %1956 = func.call @cc_cons(%1955, %1954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %1957 = arith.addi %1956, %__rlasp_stack_elide_zero_104 : i64
      %1958 = func.call @stack_pop_pointer() : () -> i64
      %1959 = func.call @cc_cons(%1958, %1957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %1960 = arith.addi %1959, %__rlasp_stack_elide_zero_105 : i64
      %2197 = arith.constant 96094591647748 : i64
      %2198 = arith.constant 0 : i64
      %2199 = func.call @cc_make_closure(%2197, %2198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2200 = arith.addi %2199, %__rlasp_stack_elide_zero_106 : i64
      %2201 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2202 = arith.constant 1 : i64
      %2203 = func.call @cc_make_string(%2201, %2202) : (!llvm.ptr, i64) -> i64
      %2204 = func.call @cc_nil_value() : () -> i64
      %2205 = func.call @cc_intern(%2203, %2204) : (i64, i64) -> i64
      %2206 = func.call @cc_nil_value() : () -> i64
      %2207 = func.call @cc_cons(%2205, %2206) : (i64, i64) -> i64
      %2208 = func.call @cc_values_pack(%2207) : (i64) -> i64
      func.call @stack_push_pointer(%2205) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2209 = func.call @stack_pop_pointer() : () -> i64
      %2210 = func.call @stack_pop_pointer() : () -> i64
      %2211 = func.call @cc_cons(%2210, %2209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2212 = arith.addi %2211, %__rlasp_stack_elide_zero_107 : i64
      %2213 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2214 = arith.constant 11 : i64
      %2215 = func.call @cc_make_string(%2213, %2214) : (!llvm.ptr, i64) -> i64
      %2216 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2217 = arith.constant 7 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = func.call @cc_intern(%2215, %2218) : (i64, i64) -> i64
      %2220 = func.call @cc_nil_value() : () -> i64
      %2221 = func.call @cc_cons(%2219, %2220) : (i64, i64) -> i64
      %2222 = func.call @cc_values_pack(%2221) : (i64) -> i64
      %2223 = func.call @cc_nil_value() : () -> i64
      %2224 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2225 = arith.constant 4 : i64
      %2226 = func.call @cc_make_string(%2224, %2225) : (!llvm.ptr, i64) -> i64
      %2227 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2228 = arith.constant 7 : i64
      %2229 = func.call @cc_make_string(%2227, %2228) : (!llvm.ptr, i64) -> i64
      %2230 = func.call @cc_intern(%2226, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_nil_value() : () -> i64
      %2232 = func.call @cc_cons(%2230, %2231) : (i64, i64) -> i64
      %2233 = func.call @cc_values_pack(%2232) : (i64) -> i64
      %2234 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2235 = arith.constant 6 : i64
      %2236 = func.call @cc_make_string(%2234, %2235) : (!llvm.ptr, i64) -> i64
      %2237 = func.call @cc_nil_value() : () -> i64
      %2238 = func.call @cc_intern(%2236, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_nil_value() : () -> i64
      %2240 = func.call @cc_cons(%2238, %2239) : (i64, i64) -> i64
      %2241 = func.call @cc_values_pack(%2240) : (i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2242 = arith.addi %2238, %__rlasp_stack_elide_zero_108 : i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_errorp(%1595) : (i64) -> i64
      %2245 = arith.cmpi ne, %2244, %2243 : i64
      %2246 = arith.cmpi eq, %2243, %2243 : i64
      %2247 = arith.andi %2245, %2246 : i1
      %2248 = scf.if %2247 -> (i64) {
        scf.yield %1595 : i64
      } else {
        scf.yield %2243 : i64
      }
      %2249 = func.call @cc_errorp(%1960) : (i64) -> i64
      %2250 = arith.cmpi ne, %2249, %2243 : i64
      %2251 = arith.cmpi eq, %2248, %2243 : i64
      %2252 = arith.andi %2250, %2251 : i1
      %2253 = scf.if %2252 -> (i64) {
        scf.yield %1960 : i64
      } else {
        scf.yield %2248 : i64
      }
      %2254 = func.call @cc_errorp(%2200) : (i64) -> i64
      %2255 = arith.cmpi ne, %2254, %2243 : i64
      %2256 = arith.cmpi eq, %2253, %2243 : i64
      %2257 = arith.andi %2255, %2256 : i1
      %2258 = scf.if %2257 -> (i64) {
        scf.yield %2200 : i64
      } else {
        scf.yield %2253 : i64
      }
      %2259 = func.call @cc_errorp(%2212) : (i64) -> i64
      %2260 = arith.cmpi ne, %2259, %2243 : i64
      %2261 = arith.cmpi eq, %2258, %2243 : i64
      %2262 = arith.andi %2260, %2261 : i1
      %2263 = scf.if %2262 -> (i64) {
        scf.yield %2212 : i64
      } else {
        scf.yield %2258 : i64
      }
      %2264 = func.call @cc_errorp(%2219) : (i64) -> i64
      %2265 = arith.cmpi ne, %2264, %2243 : i64
      %2266 = arith.cmpi eq, %2263, %2243 : i64
      %2267 = arith.andi %2265, %2266 : i1
      %2268 = scf.if %2267 -> (i64) {
        scf.yield %2219 : i64
      } else {
        scf.yield %2263 : i64
      }
      %2269 = func.call @cc_errorp(%2223) : (i64) -> i64
      %2270 = arith.cmpi ne, %2269, %2243 : i64
      %2271 = arith.cmpi eq, %2268, %2243 : i64
      %2272 = arith.andi %2270, %2271 : i1
      %2273 = scf.if %2272 -> (i64) {
        scf.yield %2223 : i64
      } else {
        scf.yield %2268 : i64
      }
      %2274 = func.call @cc_errorp(%2230) : (i64) -> i64
      %2275 = arith.cmpi ne, %2274, %2243 : i64
      %2276 = arith.cmpi eq, %2273, %2243 : i64
      %2277 = arith.andi %2275, %2276 : i1
      %2278 = scf.if %2277 -> (i64) {
        scf.yield %2230 : i64
      } else {
        scf.yield %2273 : i64
      }
      %2279 = func.call @cc_errorp(%2242) : (i64) -> i64
      %2280 = arith.cmpi ne, %2279, %2243 : i64
      %2281 = arith.cmpi eq, %2278, %2243 : i64
      %2282 = arith.andi %2280, %2281 : i1
      %2283 = scf.if %2282 -> (i64) {
        scf.yield %2242 : i64
      } else {
        scf.yield %2278 : i64
      }
      %2284 = arith.cmpi ne, %2283, %2243 : i64
      scf.if %2284 {
        func.call @stack_push_pointer(%2283) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1595) : (i64) -> ()
        func.call @stack_push_pointer(%1960) : (i64) -> ()
        func.call @stack_push_pointer(%2200) : (i64) -> ()
        func.call @stack_push_pointer(%2212) : (i64) -> ()
        func.call @stack_push_pointer(%2219) : (i64) -> ()
        func.call @stack_push_pointer(%2223) : (i64) -> ()
        func.call @stack_push_pointer(%2230) : (i64) -> ()
        func.call @stack_push_pointer(%2242) : (i64) -> ()
        %2285 = llvm.mlir.addressof @str234 : !llvm.ptr
        %2286 = func.call @cc_make_function_ref_const(%2285) : (!llvm.ptr) -> i64
        %2287 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2286, %2287) : (i64, i64) -> ()
      }
      %2288 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2288 : i64
    }
    %2289 = func.call @cc_nil_value() : () -> i64
    %2290 = func.call @cc_errorp(%1586) : (i64) -> i64
    %2291 = arith.cmpi ne, %2290, %2289 : i64
    %2292 = scf.if %2291 -> (i64) {
      scf.yield %1586 : i64
    } else {
      %2293 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2294 = arith.constant 25 : i64
      %2295 = func.call @cc_make_string(%2293, %2294) : (!llvm.ptr, i64) -> i64
      %2296 = func.call @cc_nil_value() : () -> i64
      %2297 = func.call @cc_intern(%2295, %2296) : (i64, i64) -> i64
      %2298 = func.call @cc_nil_value() : () -> i64
      %2299 = func.call @cc_cons(%2297, %2298) : (i64, i64) -> i64
      %2300 = func.call @cc_values_pack(%2299) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2301 = arith.addi %2297, %__rlasp_stack_elide_zero_109 : i64
      %2302 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2303 = arith.constant 21 : i64
      %2304 = func.call @cc_make_string(%2302, %2303) : (!llvm.ptr, i64) -> i64
      %2305 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2306 = arith.constant 11 : i64
      %2307 = func.call @cc_make_string(%2305, %2306) : (!llvm.ptr, i64) -> i64
      %2308 = func.call @cc_intern(%2304, %2307) : (i64, i64) -> i64
      %2309 = func.call @cc_nil_value() : () -> i64
      %2310 = func.call @cc_cons(%2308, %2309) : (i64, i64) -> i64
      %2311 = func.call @cc_values_pack(%2310) : (i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      %2312 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2313 = arith.constant 17 : i64
      %2314 = func.call @cc_make_string(%2312, %2313) : (!llvm.ptr, i64) -> i64
      %2315 = llvm.mlir.addressof @str239 : !llvm.ptr
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
      func.call @stack_push_pointer(%2324) : (i64) -> ()
      %2325 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2326 = arith.constant 12 : i64
      %2327 = func.call @cc_make_string(%2325, %2326) : (!llvm.ptr, i64) -> i64
      %2328 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2329 = arith.constant 11 : i64
      %2330 = func.call @cc_make_string(%2328, %2329) : (!llvm.ptr, i64) -> i64
      %2331 = func.call @cc_intern(%2327, %2330) : (i64, i64) -> i64
      %2332 = func.call @cc_nil_value() : () -> i64
      %2333 = func.call @cc_cons(%2331, %2332) : (i64, i64) -> i64
      %2334 = func.call @cc_values_pack(%2333) : (i64) -> i64
      func.call @stack_push_pointer(%2331) : (i64) -> ()
      %2335 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2336 = arith.constant 44 : i64
      %2337 = func.call @cc_make_string(%2335, %2336) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2337) : (i64) -> ()
      %2338 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2339 = arith.constant 7 : i64
      %2340 = func.call @cc_make_string(%2338, %2339) : (!llvm.ptr, i64) -> i64
      %2341 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2342 = arith.constant 7 : i64
      %2343 = func.call @cc_make_string(%2341, %2342) : (!llvm.ptr, i64) -> i64
      %2344 = func.call @cc_intern(%2340, %2343) : (i64, i64) -> i64
      %2345 = func.call @cc_nil_value() : () -> i64
      %2346 = func.call @cc_cons(%2344, %2345) : (i64, i64) -> i64
      %2347 = func.call @cc_values_pack(%2346) : (i64) -> i64
      func.call @stack_push_pointer(%2344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2348 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2349 = arith.constant 5 : i64
      %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
      %2351 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2352 = arith.constant 7 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_intern(%2350, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_nil_value() : () -> i64
      %2356 = func.call @cc_cons(%2354, %2355) : (i64, i64) -> i64
      %2357 = func.call @cc_values_pack(%2356) : (i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2358 = func.call @stack_pop_pointer() : () -> i64
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @cc_cons(%2359, %2358) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2361 = arith.addi %2360, %__rlasp_stack_elide_zero_110 : i64
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = func.call @cc_cons(%2362, %2361) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2364 = arith.addi %2363, %__rlasp_stack_elide_zero_111 : i64
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @cc_cons(%2365, %2364) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2367 = arith.addi %2366, %__rlasp_stack_elide_zero_112 : i64
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @cc_cons(%2368, %2367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2370 = arith.addi %2369, %__rlasp_stack_elide_zero_113 : i64
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @cc_cons(%2371, %2370) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2373 = arith.addi %2372, %__rlasp_stack_elide_zero_114 : i64
      %2374 = func.call @stack_pop_pointer() : () -> i64
      %2375 = func.call @cc_cons(%2374, %2373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2376 = func.call @stack_pop_pointer() : () -> i64
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = func.call @cc_cons(%2377, %2376) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2379 = arith.addi %2378, %__rlasp_stack_elide_zero_115 : i64
      %2380 = func.call @stack_pop_pointer() : () -> i64
      %2381 = func.call @cc_cons(%2380, %2379) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2382 = arith.addi %2381, %__rlasp_stack_elide_zero_116 : i64
      %2383 = func.call @stack_pop_pointer() : () -> i64
      %2384 = func.call @cc_cons(%2383, %2382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2385 = arith.addi %2384, %__rlasp_stack_elide_zero_117 : i64
      %2466 = arith.constant 96094591647749 : i64
      %2467 = arith.constant 0 : i64
      %2468 = func.call @cc_make_closure(%2466, %2467) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2469 = arith.addi %2468, %__rlasp_stack_elide_zero_118 : i64
      %2470 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2471 = arith.constant 0 : i64
      %2472 = func.call @cc_make_string(%2470, %2471) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2473 = func.call @stack_pop_pointer() : () -> i64
      %2474 = func.call @stack_pop_pointer() : () -> i64
      %2475 = func.call @cc_cons(%2474, %2473) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2476 = arith.addi %2475, %__rlasp_stack_elide_zero_119 : i64
      %2477 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2478 = arith.constant 11 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2481 = arith.constant 7 : i64
      %2482 = func.call @cc_make_string(%2480, %2481) : (!llvm.ptr, i64) -> i64
      %2483 = func.call @cc_intern(%2479, %2482) : (i64, i64) -> i64
      %2484 = func.call @cc_nil_value() : () -> i64
      %2485 = func.call @cc_cons(%2483, %2484) : (i64, i64) -> i64
      %2486 = func.call @cc_values_pack(%2485) : (i64) -> i64
      %2487 = func.call @cc_nil_value() : () -> i64
      %2488 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2489 = arith.constant 4 : i64
      %2490 = func.call @cc_make_string(%2488, %2489) : (!llvm.ptr, i64) -> i64
      %2491 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2492 = arith.constant 7 : i64
      %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
      %2494 = func.call @cc_intern(%2490, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_nil_value() : () -> i64
      %2496 = func.call @cc_cons(%2494, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_values_pack(%2496) : (i64) -> i64
      %2498 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2499 = arith.constant 6 : i64
      %2500 = func.call @cc_make_string(%2498, %2499) : (!llvm.ptr, i64) -> i64
      %2501 = func.call @cc_nil_value() : () -> i64
      %2502 = func.call @cc_intern(%2500, %2501) : (i64, i64) -> i64
      %2503 = func.call @cc_nil_value() : () -> i64
      %2504 = func.call @cc_cons(%2502, %2503) : (i64, i64) -> i64
      %2505 = func.call @cc_values_pack(%2504) : (i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2506 = arith.addi %2502, %__rlasp_stack_elide_zero_120 : i64
      %2507 = func.call @cc_nil_value() : () -> i64
      %2508 = func.call @cc_errorp(%2301) : (i64) -> i64
      %2509 = arith.cmpi ne, %2508, %2507 : i64
      %2510 = arith.cmpi eq, %2507, %2507 : i64
      %2511 = arith.andi %2509, %2510 : i1
      %2512 = scf.if %2511 -> (i64) {
        scf.yield %2301 : i64
      } else {
        scf.yield %2507 : i64
      }
      %2513 = func.call @cc_errorp(%2385) : (i64) -> i64
      %2514 = arith.cmpi ne, %2513, %2507 : i64
      %2515 = arith.cmpi eq, %2512, %2507 : i64
      %2516 = arith.andi %2514, %2515 : i1
      %2517 = scf.if %2516 -> (i64) {
        scf.yield %2385 : i64
      } else {
        scf.yield %2512 : i64
      }
      %2518 = func.call @cc_errorp(%2469) : (i64) -> i64
      %2519 = arith.cmpi ne, %2518, %2507 : i64
      %2520 = arith.cmpi eq, %2517, %2507 : i64
      %2521 = arith.andi %2519, %2520 : i1
      %2522 = scf.if %2521 -> (i64) {
        scf.yield %2469 : i64
      } else {
        scf.yield %2517 : i64
      }
      %2523 = func.call @cc_errorp(%2476) : (i64) -> i64
      %2524 = arith.cmpi ne, %2523, %2507 : i64
      %2525 = arith.cmpi eq, %2522, %2507 : i64
      %2526 = arith.andi %2524, %2525 : i1
      %2527 = scf.if %2526 -> (i64) {
        scf.yield %2476 : i64
      } else {
        scf.yield %2522 : i64
      }
      %2528 = func.call @cc_errorp(%2483) : (i64) -> i64
      %2529 = arith.cmpi ne, %2528, %2507 : i64
      %2530 = arith.cmpi eq, %2527, %2507 : i64
      %2531 = arith.andi %2529, %2530 : i1
      %2532 = scf.if %2531 -> (i64) {
        scf.yield %2483 : i64
      } else {
        scf.yield %2527 : i64
      }
      %2533 = func.call @cc_errorp(%2487) : (i64) -> i64
      %2534 = arith.cmpi ne, %2533, %2507 : i64
      %2535 = arith.cmpi eq, %2532, %2507 : i64
      %2536 = arith.andi %2534, %2535 : i1
      %2537 = scf.if %2536 -> (i64) {
        scf.yield %2487 : i64
      } else {
        scf.yield %2532 : i64
      }
      %2538 = func.call @cc_errorp(%2494) : (i64) -> i64
      %2539 = arith.cmpi ne, %2538, %2507 : i64
      %2540 = arith.cmpi eq, %2537, %2507 : i64
      %2541 = arith.andi %2539, %2540 : i1
      %2542 = scf.if %2541 -> (i64) {
        scf.yield %2494 : i64
      } else {
        scf.yield %2537 : i64
      }
      %2543 = func.call @cc_errorp(%2506) : (i64) -> i64
      %2544 = arith.cmpi ne, %2543, %2507 : i64
      %2545 = arith.cmpi eq, %2542, %2507 : i64
      %2546 = arith.andi %2544, %2545 : i1
      %2547 = scf.if %2546 -> (i64) {
        scf.yield %2506 : i64
      } else {
        scf.yield %2542 : i64
      }
      %2548 = arith.cmpi ne, %2547, %2507 : i64
      scf.if %2548 {
        func.call @stack_push_pointer(%2547) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2301) : (i64) -> ()
        func.call @stack_push_pointer(%2385) : (i64) -> ()
        func.call @stack_push_pointer(%2469) : (i64) -> ()
        func.call @stack_push_pointer(%2476) : (i64) -> ()
        func.call @stack_push_pointer(%2483) : (i64) -> ()
        func.call @stack_push_pointer(%2487) : (i64) -> ()
        func.call @stack_push_pointer(%2494) : (i64) -> ()
        func.call @stack_push_pointer(%2506) : (i64) -> ()
        %2549 = llvm.mlir.addressof @str260 : !llvm.ptr
        %2550 = func.call @cc_make_function_ref_const(%2549) : (!llvm.ptr) -> i64
        %2551 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2550, %2551) : (i64, i64) -> ()
      }
      %2552 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2552 : i64
    }
    %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
    %2553 = arith.addi %2292, %__rlasp_stack_elide_zero_121 : i64
    %2554 = func.call @cc_multiple_value_list(%2553) : (i64) -> i64
    %2555 = llvm.mlir.addressof @str261 : !llvm.ptr
    %2556 = arith.constant 37 : i64
    %2557 = func.call @cc_make_string(%2555, %2556) : (!llvm.ptr, i64) -> i64
    %2558 = func.call @cc_nil_value() : () -> i64
    %2559 = func.call @cc_intern(%2557, %2558) : (i64, i64) -> i64
    %2560 = func.call @cc_nil_value() : () -> i64
    %2561 = func.call @cc_cons(%2559, %2560) : (i64, i64) -> i64
    %2562 = func.call @cc_values_pack(%2561) : (i64) -> i64
    %2563 = func.call @cc_symbol_value(%2559) : (i64) -> i64
    %2564 = llvm.mlir.addressof @str262 : !llvm.ptr
    %2565 = arith.constant 39 : i64
    %2566 = func.call @cc_make_string(%2564, %2565) : (!llvm.ptr, i64) -> i64
    %2567 = func.call @cc_nil_value() : () -> i64
    %2568 = func.call @cc_intern(%2566, %2567) : (i64, i64) -> i64
    %2569 = func.call @cc_nil_value() : () -> i64
    %2570 = func.call @cc_cons(%2568, %2569) : (i64, i64) -> i64
    %2571 = func.call @cc_values_pack(%2570) : (i64) -> i64
    %2572 = func.call @cc_symbol_value(%2568) : (i64) -> i64
    %2573 = func.call @cc_nil_value() : () -> i64
    %2574 = arith.cmpi ne, %2563, %2573 : i64
    %2575 = scf.if %2574 -> (i64) {
      scf.yield %2572 : i64
    } else {
      scf.yield %2554 : i64
    }
    %2576 = func.call @cc_values_pack(%2575) : (i64) -> i64
    func.call @stack_push_pointer(%2576) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647745"() {
    %120 = func.call @cc_nil_value() : () -> i64
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = func.call @cc_errorp(%120) : (i64) -> i64
    %123 = arith.cmpi ne, %122, %121 : i64
    %124 = scf.if %123 -> (i64) {
      scf.yield %120 : i64
    } else {
      %125 = llvm.mlir.addressof @str14 : !llvm.ptr
      %126 = arith.constant 9 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = llvm.mlir.addressof @str15 : !llvm.ptr
      %129 = arith.constant 11 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = llvm.mlir.addressof @str16 : !llvm.ptr
      %132 = arith.constant 7 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      %134 = func.call @cc_intern(%130, %133) : (i64, i64) -> i64
      %135 = func.call @cc_nil_value() : () -> i64
      %136 = func.call @cc_cons(%134, %135) : (i64, i64) -> i64
      %137 = func.call @cc_values_pack(%136) : (i64) -> i64
      %138 = llvm.mlir.addressof @str17 : !llvm.ptr
      %139 = arith.constant 12 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = func.call @cc_nil_value() : () -> i64
      %142 = func.call @cc_errorp(%127) : (i64) -> i64
      %143 = arith.cmpi ne, %142, %141 : i64
      %144 = arith.cmpi eq, %141, %141 : i64
      %145 = arith.andi %143, %144 : i1
      %146 = scf.if %145 -> (i64) {
        scf.yield %127 : i64
      } else {
        scf.yield %141 : i64
      }
      %147 = func.call @cc_errorp(%134) : (i64) -> i64
      %148 = arith.cmpi ne, %147, %141 : i64
      %149 = arith.cmpi eq, %146, %141 : i64
      %150 = arith.andi %148, %149 : i1
      %151 = scf.if %150 -> (i64) {
        scf.yield %134 : i64
      } else {
        scf.yield %146 : i64
      }
      %152 = func.call @cc_errorp(%140) : (i64) -> i64
      %153 = arith.cmpi ne, %152, %141 : i64
      %154 = arith.cmpi eq, %151, %141 : i64
      %155 = arith.andi %153, %154 : i1
      %156 = scf.if %155 -> (i64) {
        scf.yield %140 : i64
      } else {
        scf.yield %151 : i64
      }
      %157 = arith.cmpi ne, %156, %141 : i64
      scf.if %157 {
        func.call @stack_push_pointer(%156) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%127) : (i64) -> ()
        func.call @stack_push_pointer(%134) : (i64) -> ()
        func.call @stack_push_pointer(%140) : (i64) -> ()
        %158 = llvm.mlir.addressof @str18 : !llvm.ptr
        %159 = func.call @cc_make_function_ref_const(%158) : (!llvm.ptr) -> i64
        %160 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%159, %160) : (i64, i64) -> ()
      }
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_errorp(%161) : (i64) -> i64
      %164 = arith.cmpi ne, %163, %162 : i64
      %165 = arith.cmpi eq, %162, %162 : i64
      %166 = arith.andi %164, %165 : i1
      %167 = scf.if %166 -> (i64) {
        scf.yield %161 : i64
      } else {
        scf.yield %162 : i64
      }
      %168 = arith.cmpi ne, %167, %162 : i64
      scf.if %168 {
        func.call @stack_push_pointer(%167) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%161) : (i64) -> ()
        %169 = llvm.mlir.addressof @str19 : !llvm.ptr
        %170 = func.call @cc_make_function_ref_const(%169) : (!llvm.ptr) -> i64
        %171 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%170, %171) : (i64, i64) -> ()
      }
      %172 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %172 : i64
    }
    func.call @stack_push_pointer(%124) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647746"() {
    %610 = func.call @cc_nil_value() : () -> i64
    %611 = func.call @cc_nil_value() : () -> i64
    %612 = func.call @cc_errorp(%610) : (i64) -> i64
    %613 = arith.cmpi ne, %612, %611 : i64
    %614 = scf.if %613 -> (i64) {
      scf.yield %610 : i64
    } else {
      %615 = func.call @cc_t_value() : () -> i64
      %616 = llvm.mlir.addressof @str65 : !llvm.ptr
      %617 = arith.constant 44 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = llvm.mlir.addressof @str66 : !llvm.ptr
      %620 = arith.constant 28 : i64
      %621 = func.call @cc_make_symbol(%619, %620) : (!llvm.ptr, i64) -> i64
      %622 = func.call @cc_symbol_value(%621) : (i64) -> i64
      %623 = func.call @cc_set_symbol_value(%621, %615) : (i64, i64) -> i64
      %624 = func.call @cc_nil_value() : () -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_errorp(%624) : (i64) -> i64
      %627 = arith.cmpi ne, %626, %625 : i64
      %628 = scf.if %627 -> (i64) {
        scf.yield %624 : i64
      } else {
        %629 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%629) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %630 = func.call @stack_pop_pointer() : () -> i64
        %631 = func.call @stack_pop_pointer() : () -> i64
        %632 = func.call @cc_cons(%630, %631) : (i64, i64) -> i64
        func.call @stack_push_pointer(%632) : (i64) -> ()
        %633 = llvm.mlir.addressof @str67 : !llvm.ptr
        %634 = arith.constant 5 : i64
        %635 = func.call @cc_make_string(%633, %634) : (!llvm.ptr, i64) -> i64
        %636 = llvm.mlir.addressof @str68 : !llvm.ptr
        %637 = arith.constant 7 : i64
        %638 = func.call @cc_make_string(%636, %637) : (!llvm.ptr, i64) -> i64
        %639 = func.call @cc_intern(%635, %638) : (i64, i64) -> i64
        %640 = func.call @cc_nil_value() : () -> i64
        %641 = func.call @cc_cons(%639, %640) : (i64, i64) -> i64
        %642 = func.call @cc_values_pack(%641) : (i64) -> i64
        %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
        %643 = arith.addi %639, %__rlasp_stack_elide_zero_122 : i64
        %644 = func.call @stack_pop_pointer() : () -> i64
        %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
        func.call @stack_push_pointer(%645) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %646 = func.call @stack_pop_pointer() : () -> i64
        %647 = func.call @stack_pop_pointer() : () -> i64
        %648 = func.call @cc_cons(%646, %647) : (i64, i64) -> i64
        func.call @stack_push_pointer(%648) : (i64) -> ()
        %649 = llvm.mlir.addressof @str69 : !llvm.ptr
        %650 = arith.constant 7 : i64
        %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
        %652 = llvm.mlir.addressof @str70 : !llvm.ptr
        %653 = arith.constant 7 : i64
        %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
        %655 = func.call @cc_intern(%651, %654) : (i64, i64) -> i64
        %656 = func.call @cc_nil_value() : () -> i64
        %657 = func.call @cc_cons(%655, %656) : (i64, i64) -> i64
        %658 = func.call @cc_values_pack(%657) : (i64) -> i64
        %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
        %659 = arith.addi %655, %__rlasp_stack_elide_zero_123 : i64
        %660 = func.call @stack_pop_pointer() : () -> i64
        %661 = func.call @cc_cons(%659, %660) : (i64, i64) -> i64
        func.call @stack_push_pointer(%661) : (i64) -> ()
        %662 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%662) : (i64) -> ()
        %663 = llvm.mlir.addressof @str71 : !llvm.ptr
        %664 = arith.constant 4 : i64
        %665 = func.call @cc_make_string(%663, %664) : (!llvm.ptr, i64) -> i64
        %666 = func.call @cc_nil_value() : () -> i64
        %667 = func.call @cc_intern(%665, %666) : (i64, i64) -> i64
        %668 = func.call @cc_nil_value() : () -> i64
        %669 = func.call @cc_cons(%667, %668) : (i64, i64) -> i64
        %670 = func.call @cc_values_pack(%669) : (i64) -> i64
        %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
        %671 = arith.addi %667, %__rlasp_stack_elide_zero_124 : i64
        %672 = func.call @stack_pop_pointer() : () -> i64
        %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
        func.call @stack_push_pointer(%673) : (i64) -> ()
        %674 = llvm.mlir.addressof @str72 : !llvm.ptr
        %675 = arith.constant 8 : i64
        %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
        %677 = llvm.mlir.addressof @str73 : !llvm.ptr
        %678 = arith.constant 7 : i64
        %679 = func.call @cc_make_string(%677, %678) : (!llvm.ptr, i64) -> i64
        %680 = func.call @cc_intern(%676, %679) : (i64, i64) -> i64
        %681 = func.call @cc_nil_value() : () -> i64
        %682 = func.call @cc_cons(%680, %681) : (i64, i64) -> i64
        %683 = func.call @cc_values_pack(%682) : (i64) -> i64
        %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
        %684 = arith.addi %680, %__rlasp_stack_elide_zero_125 : i64
        %685 = func.call @stack_pop_pointer() : () -> i64
        %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
        func.call @stack_push_pointer(%686) : (i64) -> ()
        %687 = llvm.mlir.addressof @str74 : !llvm.ptr
        %688 = arith.constant 7 : i64
        %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
        %690 = arith.addi %689, %__rlasp_stack_elide_zero_126 : i64
        %691 = func.call @stack_pop_pointer() : () -> i64
        %692 = func.call @cc_cons(%690, %691) : (i64, i64) -> i64
        func.call @stack_push_pointer(%692) : (i64) -> ()
        %693 = llvm.mlir.addressof @str75 : !llvm.ptr
        %694 = arith.constant 4 : i64
        %695 = func.call @cc_make_string(%693, %694) : (!llvm.ptr, i64) -> i64
        %696 = llvm.mlir.addressof @str76 : !llvm.ptr
        %697 = arith.constant 7 : i64
        %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
        %699 = func.call @cc_intern(%695, %698) : (i64, i64) -> i64
        %700 = func.call @cc_nil_value() : () -> i64
        %701 = func.call @cc_cons(%699, %700) : (i64, i64) -> i64
        %702 = func.call @cc_values_pack(%701) : (i64) -> i64
        %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
        %703 = arith.addi %699, %__rlasp_stack_elide_zero_127 : i64
        %704 = func.call @stack_pop_pointer() : () -> i64
        %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
        func.call @stack_push_pointer(%705) : (i64) -> ()
        %706 = llvm.mlir.addressof @str77 : !llvm.ptr
        %707 = arith.constant 13 : i64
        %708 = func.call @cc_make_string(%706, %707) : (!llvm.ptr, i64) -> i64
        %709 = llvm.mlir.addressof @str78 : !llvm.ptr
        %710 = arith.constant 11 : i64
        %711 = func.call @cc_make_string(%709, %710) : (!llvm.ptr, i64) -> i64
        %712 = func.call @cc_intern(%708, %711) : (i64, i64) -> i64
        %713 = func.call @cc_nil_value() : () -> i64
        %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
        %715 = func.call @cc_values_pack(%714) : (i64) -> i64
        %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
        %716 = arith.addi %712, %__rlasp_stack_elide_zero_128 : i64
        %717 = func.call @stack_pop_pointer() : () -> i64
        %718 = func.call @cc_cons(%716, %717) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
        %719 = arith.addi %718, %__rlasp_stack_elide_zero_129 : i64
        %720 = func.call @stack_pop_pointer() : () -> i64
        %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
        func.call @stack_push_pointer(%721) : (i64) -> ()
        %722 = llvm.mlir.addressof @str79 : !llvm.ptr
        %723 = arith.constant 11 : i64
        %724 = func.call @cc_make_string(%722, %723) : (!llvm.ptr, i64) -> i64
        %725 = llvm.mlir.addressof @str80 : !llvm.ptr
        %726 = arith.constant 7 : i64
        %727 = func.call @cc_make_string(%725, %726) : (!llvm.ptr, i64) -> i64
        %728 = func.call @cc_intern(%724, %727) : (i64, i64) -> i64
        %729 = func.call @cc_nil_value() : () -> i64
        %730 = func.call @cc_cons(%728, %729) : (i64, i64) -> i64
        %731 = func.call @cc_values_pack(%730) : (i64) -> i64
        %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
        %732 = arith.addi %728, %__rlasp_stack_elide_zero_130 : i64
        %733 = func.call @stack_pop_pointer() : () -> i64
        %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
        func.call @stack_push_pointer(%734) : (i64) -> ()
        %735 = llvm.mlir.addressof @str81 : !llvm.ptr
        %736 = arith.constant 4 : i64
        %737 = func.call @cc_make_string(%735, %736) : (!llvm.ptr, i64) -> i64
        %738 = func.call @cc_nil_value() : () -> i64
        %739 = func.call @cc_intern(%737, %738) : (i64, i64) -> i64
        %740 = func.call @cc_nil_value() : () -> i64
        %741 = func.call @cc_cons(%739, %740) : (i64, i64) -> i64
        %742 = func.call @cc_values_pack(%741) : (i64) -> i64
        %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
        %743 = arith.addi %739, %__rlasp_stack_elide_zero_131 : i64
        %744 = func.call @stack_pop_pointer() : () -> i64
        %745 = func.call @cc_cons(%743, %744) : (i64, i64) -> i64
        func.call @stack_push_pointer(%745) : (i64) -> ()
        %746 = llvm.mlir.addressof @str82 : !llvm.ptr
        %747 = arith.constant 12 : i64
        %748 = func.call @cc_make_string(%746, %747) : (!llvm.ptr, i64) -> i64
        %749 = func.call @cc_nil_value() : () -> i64
        %750 = func.call @cc_intern(%748, %749) : (i64, i64) -> i64
        %751 = func.call @cc_nil_value() : () -> i64
        %752 = func.call @cc_cons(%750, %751) : (i64, i64) -> i64
        %753 = func.call @cc_values_pack(%752) : (i64) -> i64
        %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
        %754 = arith.addi %750, %__rlasp_stack_elide_zero_132 : i64
        %755 = func.call @stack_pop_pointer() : () -> i64
        %756 = func.call @cc_cons(%754, %755) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
        %757 = arith.addi %756, %__rlasp_stack_elide_zero_133 : i64
        %758 = func.call @cc_nil_value() : () -> i64
        %759 = func.call @cc_cons(%757, %758) : (i64, i64) -> i64
        %760 = llvm.mlir.addressof @str83 : !llvm.ptr
        %761 = arith.constant 4 : i64
        %762 = func.call @cc_make_string(%760, %761) : (!llvm.ptr, i64) -> i64
        %763 = func.call @cc_nil_value() : () -> i64
        %764 = func.call @cc_intern(%762, %763) : (i64, i64) -> i64
        %765 = func.call @cc_nil_value() : () -> i64
        %766 = func.call @cc_cons(%764, %765) : (i64, i64) -> i64
        %767 = func.call @cc_values_pack(%766) : (i64) -> i64
        %768 = func.call @cc_symbol_value(%764) : (i64) -> i64
        %769 = func.call @cc_set_symbol_value(%764, %618) : (i64, i64) -> i64
        %770 = func.call @cc_eval(%759) : (i64) -> i64
        %771 = func.call @cc_multiple_value_list(%770) : (i64) -> i64
        %772 = func.call @cc_symbol_value(%764) : (i64) -> i64
        %773 = func.call @cc_set_symbol_value(%764, %768) : (i64, i64) -> i64
        %774 = func.call @cc_values_pack(%771) : (i64) -> i64
        %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
        %775 = arith.addi %774, %__rlasp_stack_elide_zero_134 : i64
        %776 = func.call @cc_nil_value() : () -> i64
        %777 = func.call @cc_nil_value() : () -> i64
        %778 = func.call @cc_errorp(%776) : (i64) -> i64
        %779 = arith.cmpi ne, %778, %777 : i64
        %780 = scf.if %779 -> (i64) {
          scf.yield %776 : i64
        } else {
          %781 = func.call @cc_nil_value() : () -> i64
          %782 = func.call @cc_nil_value() : () -> i64
          %783 = func.call @cc_errorp(%775) : (i64) -> i64
          %784 = arith.cmpi ne, %783, %782 : i64
          %785 = arith.cmpi eq, %782, %782 : i64
          %786 = arith.andi %784, %785 : i1
          %787 = scf.if %786 -> (i64) {
            scf.yield %775 : i64
          } else {
            scf.yield %782 : i64
          }
          %788 = arith.cmpi ne, %787, %782 : i64
          scf.if %788 {
            func.call @stack_push_pointer(%787) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%775) : (i64) -> ()
            %789 = llvm.mlir.addressof @str84 : !llvm.ptr
            %790 = func.call @cc_make_function_ref_const(%789) : (!llvm.ptr) -> i64
            %791 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%790, %791) : (i64, i64) -> ()
          }
          %792 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %793 = llvm.mlir.addressof @str85 : !llvm.ptr
          %794 = arith.constant 7 : i64
          %795 = func.call @cc_make_string(%793, %794) : (!llvm.ptr, i64) -> i64
          %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
          %796 = arith.addi %795, %__rlasp_stack_elide_zero_135 : i64
          %797 = func.call @stack_pop_pointer() : () -> i64
          %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
          func.call @stack_push_pointer(%798) : (i64) -> ()
          %799 = func.call @cc_nil_value() : () -> i64
          %800 = func.call @cc_errorp(%775) : (i64) -> i64
          %801 = arith.cmpi ne, %800, %799 : i64
          %802 = arith.cmpi eq, %799, %799 : i64
          %803 = arith.andi %801, %802 : i1
          %804 = scf.if %803 -> (i64) {
            scf.yield %775 : i64
          } else {
            scf.yield %799 : i64
          }
          %805 = arith.cmpi ne, %804, %799 : i64
          scf.if %805 {
            func.call @stack_push_pointer(%804) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%775) : (i64) -> ()
            %806 = llvm.mlir.addressof @str86 : !llvm.ptr
            %807 = func.call @cc_make_function_ref_const(%806) : (!llvm.ptr) -> i64
            %808 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%807, %808) : (i64, i64) -> ()
          }
          %809 = func.call @stack_pop_pointer() : () -> i64
          %810 = func.call @stack_pop_pointer() : () -> i64
          %811 = func.call @cc_cons(%809, %810) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
          %812 = arith.addi %811, %__rlasp_stack_elide_zero_136 : i64
          %813 = func.call @cc_string_equal_full(%812) : (i64) -> i64
          %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
          %814 = arith.addi %813, %__rlasp_stack_elide_zero_137 : i64
          %815 = func.call @cc_cons(%814, %781) : (i64, i64) -> i64
          %816 = func.call @cc_cons(%792, %815) : (i64, i64) -> i64
          %817 = func.call @cc_and(%816) : (i64) -> i64
          %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
          %818 = arith.addi %817, %__rlasp_stack_elide_zero_138 : i64
          scf.yield %818 : i64
        }
        %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
        %819 = arith.addi %780, %__rlasp_stack_elide_zero_139 : i64
        scf.yield %819 : i64
      }
      func.call @stack_push_pointer(%628) : (i64) -> ()
      %820 = func.call @cc_restore_symbol_value(%621, %622) : (i64, i64) -> i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_nil_value() : () -> i64
      %823 = func.call @cc_cons(%821, %822) : (i64, i64) -> i64
      %824 = func.call @cc_not(%823) : (i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %825 = arith.addi %824, %__rlasp_stack_elide_zero_140 : i64
      %826 = func.call @cc_nil_value() : () -> i64
      %827 = func.call @cc_cons(%825, %826) : (i64, i64) -> i64
      %828 = func.call @cc_not(%827) : (i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %829 = arith.addi %828, %__rlasp_stack_elide_zero_141 : i64
      scf.yield %829 : i64
    }
    func.call @stack_push_pointer(%614) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647747"() {
    %1271 = func.call @cc_nil_value() : () -> i64
    %1272 = func.call @cc_nil_value() : () -> i64
    %1273 = func.call @cc_errorp(%1271) : (i64) -> i64
    %1274 = arith.cmpi ne, %1273, %1272 : i64
    %1275 = scf.if %1274 -> (i64) {
      scf.yield %1271 : i64
    } else {
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1278 = arith.constant 44 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1281 = arith.constant 28 : i64
      %1282 = func.call @cc_make_symbol(%1280, %1281) : (!llvm.ptr, i64) -> i64
      %1283 = func.call @cc_symbol_value(%1282) : (i64) -> i64
      %1284 = func.call @cc_set_symbol_value(%1282, %1276) : (i64, i64) -> i64
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = func.call @cc_nil_value() : () -> i64
      %1287 = func.call @cc_errorp(%1285) : (i64) -> i64
      %1288 = arith.cmpi ne, %1287, %1286 : i64
      %1289 = scf.if %1288 -> (i64) {
        scf.yield %1285 : i64
      } else {
        %1290 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1290) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1291 = func.call @stack_pop_pointer() : () -> i64
        %1292 = func.call @stack_pop_pointer() : () -> i64
        %1293 = func.call @cc_cons(%1291, %1292) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1293) : (i64) -> ()
        %1294 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1295 = arith.constant 5 : i64
        %1296 = func.call @cc_make_string(%1294, %1295) : (!llvm.ptr, i64) -> i64
        %1297 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1298 = arith.constant 7 : i64
        %1299 = func.call @cc_make_string(%1297, %1298) : (!llvm.ptr, i64) -> i64
        %1300 = func.call @cc_intern(%1296, %1299) : (i64, i64) -> i64
        %1301 = func.call @cc_nil_value() : () -> i64
        %1302 = func.call @cc_cons(%1300, %1301) : (i64, i64) -> i64
        %1303 = func.call @cc_values_pack(%1302) : (i64) -> i64
        %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
        %1304 = arith.addi %1300, %__rlasp_stack_elide_zero_142 : i64
        %1305 = func.call @stack_pop_pointer() : () -> i64
        %1306 = func.call @cc_cons(%1304, %1305) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1306) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1307 = func.call @stack_pop_pointer() : () -> i64
        %1308 = func.call @stack_pop_pointer() : () -> i64
        %1309 = func.call @cc_cons(%1307, %1308) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1309) : (i64) -> ()
        %1310 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1311 = arith.constant 7 : i64
        %1312 = func.call @cc_make_string(%1310, %1311) : (!llvm.ptr, i64) -> i64
        %1313 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1314 = arith.constant 7 : i64
        %1315 = func.call @cc_make_string(%1313, %1314) : (!llvm.ptr, i64) -> i64
        %1316 = func.call @cc_intern(%1312, %1315) : (i64, i64) -> i64
        %1317 = func.call @cc_nil_value() : () -> i64
        %1318 = func.call @cc_cons(%1316, %1317) : (i64, i64) -> i64
        %1319 = func.call @cc_values_pack(%1318) : (i64) -> i64
        %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
        %1320 = arith.addi %1316, %__rlasp_stack_elide_zero_143 : i64
        %1321 = func.call @stack_pop_pointer() : () -> i64
        %1322 = func.call @cc_cons(%1320, %1321) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1322) : (i64) -> ()
        %1323 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1323) : (i64) -> ()
        %1324 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1325 = arith.constant 4 : i64
        %1326 = func.call @cc_make_string(%1324, %1325) : (!llvm.ptr, i64) -> i64
        %1327 = func.call @cc_nil_value() : () -> i64
        %1328 = func.call @cc_intern(%1326, %1327) : (i64, i64) -> i64
        %1329 = func.call @cc_nil_value() : () -> i64
        %1330 = func.call @cc_cons(%1328, %1329) : (i64, i64) -> i64
        %1331 = func.call @cc_values_pack(%1330) : (i64) -> i64
        %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
        %1332 = arith.addi %1328, %__rlasp_stack_elide_zero_144 : i64
        %1333 = func.call @stack_pop_pointer() : () -> i64
        %1334 = func.call @cc_cons(%1332, %1333) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1334) : (i64) -> ()
        %1335 = llvm.mlir.addressof @str139 : !llvm.ptr
        %1336 = arith.constant 8 : i64
        %1337 = func.call @cc_make_string(%1335, %1336) : (!llvm.ptr, i64) -> i64
        %1338 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1339 = arith.constant 7 : i64
        %1340 = func.call @cc_make_string(%1338, %1339) : (!llvm.ptr, i64) -> i64
        %1341 = func.call @cc_intern(%1337, %1340) : (i64, i64) -> i64
        %1342 = func.call @cc_nil_value() : () -> i64
        %1343 = func.call @cc_cons(%1341, %1342) : (i64, i64) -> i64
        %1344 = func.call @cc_values_pack(%1343) : (i64) -> i64
        %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
        %1345 = arith.addi %1341, %__rlasp_stack_elide_zero_145 : i64
        %1346 = func.call @stack_pop_pointer() : () -> i64
        %1347 = func.call @cc_cons(%1345, %1346) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1347) : (i64) -> ()
        %1348 = llvm.mlir.addressof @str141 : !llvm.ptr
        %1349 = arith.constant 7 : i64
        %1350 = func.call @cc_make_string(%1348, %1349) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
        %1351 = arith.addi %1350, %__rlasp_stack_elide_zero_146 : i64
        %1352 = func.call @stack_pop_pointer() : () -> i64
        %1353 = func.call @cc_cons(%1351, %1352) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1353) : (i64) -> ()
        %1354 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1355 = arith.constant 4 : i64
        %1356 = func.call @cc_make_string(%1354, %1355) : (!llvm.ptr, i64) -> i64
        %1357 = llvm.mlir.addressof @str143 : !llvm.ptr
        %1358 = arith.constant 7 : i64
        %1359 = func.call @cc_make_string(%1357, %1358) : (!llvm.ptr, i64) -> i64
        %1360 = func.call @cc_intern(%1356, %1359) : (i64, i64) -> i64
        %1361 = func.call @cc_nil_value() : () -> i64
        %1362 = func.call @cc_cons(%1360, %1361) : (i64, i64) -> i64
        %1363 = func.call @cc_values_pack(%1362) : (i64) -> i64
        %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
        %1364 = arith.addi %1360, %__rlasp_stack_elide_zero_147 : i64
        %1365 = func.call @stack_pop_pointer() : () -> i64
        %1366 = func.call @cc_cons(%1364, %1365) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1366) : (i64) -> ()
        %1367 = llvm.mlir.addressof @str144 : !llvm.ptr
        %1368 = arith.constant 13 : i64
        %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
        %1370 = llvm.mlir.addressof @str145 : !llvm.ptr
        %1371 = arith.constant 11 : i64
        %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
        %1373 = func.call @cc_intern(%1369, %1372) : (i64, i64) -> i64
        %1374 = func.call @cc_nil_value() : () -> i64
        %1375 = func.call @cc_cons(%1373, %1374) : (i64, i64) -> i64
        %1376 = func.call @cc_values_pack(%1375) : (i64) -> i64
        %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
        %1377 = arith.addi %1373, %__rlasp_stack_elide_zero_148 : i64
        %1378 = func.call @stack_pop_pointer() : () -> i64
        %1379 = func.call @cc_cons(%1377, %1378) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
        %1380 = arith.addi %1379, %__rlasp_stack_elide_zero_149 : i64
        %1381 = func.call @stack_pop_pointer() : () -> i64
        %1382 = func.call @cc_cons(%1380, %1381) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1382) : (i64) -> ()
        %1383 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1384 = arith.constant 11 : i64
        %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
        %1386 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1387 = arith.constant 7 : i64
        %1388 = func.call @cc_make_string(%1386, %1387) : (!llvm.ptr, i64) -> i64
        %1389 = func.call @cc_intern(%1385, %1388) : (i64, i64) -> i64
        %1390 = func.call @cc_nil_value() : () -> i64
        %1391 = func.call @cc_cons(%1389, %1390) : (i64, i64) -> i64
        %1392 = func.call @cc_values_pack(%1391) : (i64) -> i64
        %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
        %1393 = arith.addi %1389, %__rlasp_stack_elide_zero_150 : i64
        %1394 = func.call @stack_pop_pointer() : () -> i64
        %1395 = func.call @cc_cons(%1393, %1394) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1395) : (i64) -> ()
        %1396 = llvm.mlir.addressof @str148 : !llvm.ptr
        %1397 = arith.constant 4 : i64
        %1398 = func.call @cc_make_string(%1396, %1397) : (!llvm.ptr, i64) -> i64
        %1399 = func.call @cc_nil_value() : () -> i64
        %1400 = func.call @cc_intern(%1398, %1399) : (i64, i64) -> i64
        %1401 = func.call @cc_nil_value() : () -> i64
        %1402 = func.call @cc_cons(%1400, %1401) : (i64, i64) -> i64
        %1403 = func.call @cc_values_pack(%1402) : (i64) -> i64
        %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
        %1404 = arith.addi %1400, %__rlasp_stack_elide_zero_151 : i64
        %1405 = func.call @stack_pop_pointer() : () -> i64
        %1406 = func.call @cc_cons(%1404, %1405) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1406) : (i64) -> ()
        %1407 = llvm.mlir.addressof @str149 : !llvm.ptr
        %1408 = arith.constant 12 : i64
        %1409 = func.call @cc_make_string(%1407, %1408) : (!llvm.ptr, i64) -> i64
        %1410 = func.call @cc_nil_value() : () -> i64
        %1411 = func.call @cc_intern(%1409, %1410) : (i64, i64) -> i64
        %1412 = func.call @cc_nil_value() : () -> i64
        %1413 = func.call @cc_cons(%1411, %1412) : (i64, i64) -> i64
        %1414 = func.call @cc_values_pack(%1413) : (i64) -> i64
        %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
        %1415 = arith.addi %1411, %__rlasp_stack_elide_zero_152 : i64
        %1416 = func.call @stack_pop_pointer() : () -> i64
        %1417 = func.call @cc_cons(%1415, %1416) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
        %1418 = arith.addi %1417, %__rlasp_stack_elide_zero_153 : i64
        %1419 = func.call @cc_nil_value() : () -> i64
        %1420 = func.call @cc_cons(%1418, %1419) : (i64, i64) -> i64
        %1421 = llvm.mlir.addressof @str150 : !llvm.ptr
        %1422 = arith.constant 4 : i64
        %1423 = func.call @cc_make_string(%1421, %1422) : (!llvm.ptr, i64) -> i64
        %1424 = func.call @cc_nil_value() : () -> i64
        %1425 = func.call @cc_intern(%1423, %1424) : (i64, i64) -> i64
        %1426 = func.call @cc_nil_value() : () -> i64
        %1427 = func.call @cc_cons(%1425, %1426) : (i64, i64) -> i64
        %1428 = func.call @cc_values_pack(%1427) : (i64) -> i64
        %1429 = func.call @cc_symbol_value(%1425) : (i64) -> i64
        %1430 = func.call @cc_set_symbol_value(%1425, %1279) : (i64, i64) -> i64
        %1431 = func.call @cc_eval(%1420) : (i64) -> i64
        %1432 = func.call @cc_multiple_value_list(%1431) : (i64) -> i64
        %1433 = func.call @cc_symbol_value(%1425) : (i64) -> i64
        %1434 = func.call @cc_set_symbol_value(%1425, %1429) : (i64, i64) -> i64
        %1435 = func.call @cc_values_pack(%1432) : (i64) -> i64
        %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
        %1436 = arith.addi %1435, %__rlasp_stack_elide_zero_154 : i64
        %1437 = func.call @cc_nil_value() : () -> i64
        %1438 = func.call @cc_nil_value() : () -> i64
        %1439 = func.call @cc_errorp(%1437) : (i64) -> i64
        %1440 = arith.cmpi ne, %1439, %1438 : i64
        %1441 = scf.if %1440 -> (i64) {
          scf.yield %1437 : i64
        } else {
          %1442 = func.call @cc_nil_value() : () -> i64
          %1443 = func.call @cc_nil_value() : () -> i64
          %1444 = func.call @cc_errorp(%1436) : (i64) -> i64
          %1445 = arith.cmpi ne, %1444, %1443 : i64
          %1446 = arith.cmpi eq, %1443, %1443 : i64
          %1447 = arith.andi %1445, %1446 : i1
          %1448 = scf.if %1447 -> (i64) {
            scf.yield %1436 : i64
          } else {
            scf.yield %1443 : i64
          }
          %1449 = arith.cmpi ne, %1448, %1443 : i64
          scf.if %1449 {
            func.call @stack_push_pointer(%1448) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1436) : (i64) -> ()
            %1450 = llvm.mlir.addressof @str151 : !llvm.ptr
            %1451 = func.call @cc_make_function_ref_const(%1450) : (!llvm.ptr) -> i64
            %1452 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1451, %1452) : (i64, i64) -> ()
          }
          %1453 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1454 = llvm.mlir.addressof @str152 : !llvm.ptr
          %1455 = arith.constant 7 : i64
          %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
          %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
          %1457 = arith.addi %1456, %__rlasp_stack_elide_zero_155 : i64
          %1458 = func.call @stack_pop_pointer() : () -> i64
          %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1459) : (i64) -> ()
          %1460 = func.call @cc_nil_value() : () -> i64
          %1461 = func.call @cc_errorp(%1436) : (i64) -> i64
          %1462 = arith.cmpi ne, %1461, %1460 : i64
          %1463 = arith.cmpi eq, %1460, %1460 : i64
          %1464 = arith.andi %1462, %1463 : i1
          %1465 = scf.if %1464 -> (i64) {
            scf.yield %1436 : i64
          } else {
            scf.yield %1460 : i64
          }
          %1466 = arith.cmpi ne, %1465, %1460 : i64
          scf.if %1466 {
            func.call @stack_push_pointer(%1465) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1436) : (i64) -> ()
            %1467 = llvm.mlir.addressof @str153 : !llvm.ptr
            %1468 = func.call @cc_make_function_ref_const(%1467) : (!llvm.ptr) -> i64
            %1469 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1468, %1469) : (i64, i64) -> ()
          }
          %1470 = func.call @stack_pop_pointer() : () -> i64
          %1471 = func.call @stack_pop_pointer() : () -> i64
          %1472 = func.call @cc_cons(%1470, %1471) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
          %1473 = arith.addi %1472, %__rlasp_stack_elide_zero_156 : i64
          %1474 = func.call @cc_string_equal_full(%1473) : (i64) -> i64
          %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
          %1475 = arith.addi %1474, %__rlasp_stack_elide_zero_157 : i64
          %1476 = func.call @cc_cons(%1475, %1442) : (i64, i64) -> i64
          %1477 = func.call @cc_cons(%1453, %1476) : (i64, i64) -> i64
          %1478 = func.call @cc_and(%1477) : (i64) -> i64
          %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
          %1479 = arith.addi %1478, %__rlasp_stack_elide_zero_158 : i64
          scf.yield %1479 : i64
        }
        %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
        %1480 = arith.addi %1441, %__rlasp_stack_elide_zero_159 : i64
        scf.yield %1480 : i64
      }
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1481 = func.call @cc_restore_symbol_value(%1282, %1283) : (i64, i64) -> i64
      %1482 = func.call @stack_pop_pointer() : () -> i64
      %1483 = func.call @cc_nil_value() : () -> i64
      %1484 = func.call @cc_cons(%1482, %1483) : (i64, i64) -> i64
      %1485 = func.call @cc_not(%1484) : (i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %1486 = arith.addi %1485, %__rlasp_stack_elide_zero_160 : i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_cons(%1486, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_not(%1488) : (i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %1490 = arith.addi %1489, %__rlasp_stack_elide_zero_161 : i64
      scf.yield %1490 : i64
    }
    func.call @stack_push_pointer(%1275) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647748"() {
    %1961 = func.call @cc_nil_value() : () -> i64
    %1962 = func.call @cc_nil_value() : () -> i64
    %1963 = func.call @cc_errorp(%1961) : (i64) -> i64
    %1964 = arith.cmpi ne, %1963, %1962 : i64
    %1965 = scf.if %1964 -> (i64) {
      scf.yield %1961 : i64
    } else {
      %1966 = func.call @cc_nil_value() : () -> i64
      %1967 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1968 = arith.constant 4 : i64
      %1969 = func.call @cc_make_string(%1967, %1968) : (!llvm.ptr, i64) -> i64
      %1970 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1971 = arith.constant 7 : i64
      %1972 = func.call @cc_make_string(%1970, %1971) : (!llvm.ptr, i64) -> i64
      %1973 = func.call @cc_intern(%1969, %1972) : (i64, i64) -> i64
      %1974 = func.call @cc_nil_value() : () -> i64
      %1975 = func.call @cc_cons(%1973, %1974) : (i64, i64) -> i64
      %1976 = func.call @cc_values_pack(%1975) : (i64) -> i64
      %1977 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1978 = arith.constant 44 : i64
      %1979 = func.call @cc_make_string(%1977, %1978) : (!llvm.ptr, i64) -> i64
      %1980 = llvm.mlir.addressof @str206 : !llvm.ptr
      %1981 = arith.constant 28 : i64
      %1982 = func.call @cc_make_symbol(%1980, %1981) : (!llvm.ptr, i64) -> i64
      %1983 = func.call @cc_symbol_value(%1982) : (i64) -> i64
      %1984 = func.call @cc_set_symbol_value(%1982, %1966) : (i64, i64) -> i64
      %1985 = llvm.mlir.addressof @str207 : !llvm.ptr
      %1986 = arith.constant 25 : i64
      %1987 = func.call @cc_make_symbol(%1985, %1986) : (!llvm.ptr, i64) -> i64
      %1988 = func.call @cc_symbol_value(%1987) : (i64) -> i64
      %1989 = func.call @cc_set_symbol_value(%1987, %1973) : (i64, i64) -> i64
      %1990 = func.call @cc_nil_value() : () -> i64
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_errorp(%1990) : (i64) -> i64
      %1993 = arith.cmpi ne, %1992, %1991 : i64
      %1994 = scf.if %1993 -> (i64) {
        scf.yield %1990 : i64
      } else {
        %1995 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1995) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1996 = func.call @stack_pop_pointer() : () -> i64
        %1997 = func.call @stack_pop_pointer() : () -> i64
        %1998 = func.call @cc_cons(%1996, %1997) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1998) : (i64) -> ()
        %1999 = llvm.mlir.addressof @str208 : !llvm.ptr
        %2000 = arith.constant 5 : i64
        %2001 = func.call @cc_make_string(%1999, %2000) : (!llvm.ptr, i64) -> i64
        %2002 = llvm.mlir.addressof @str209 : !llvm.ptr
        %2003 = arith.constant 7 : i64
        %2004 = func.call @cc_make_string(%2002, %2003) : (!llvm.ptr, i64) -> i64
        %2005 = func.call @cc_intern(%2001, %2004) : (i64, i64) -> i64
        %2006 = func.call @cc_nil_value() : () -> i64
        %2007 = func.call @cc_cons(%2005, %2006) : (i64, i64) -> i64
        %2008 = func.call @cc_values_pack(%2007) : (i64) -> i64
        %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
        %2009 = arith.addi %2005, %__rlasp_stack_elide_zero_162 : i64
        %2010 = func.call @stack_pop_pointer() : () -> i64
        %2011 = func.call @cc_cons(%2009, %2010) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2011) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %2012 = func.call @stack_pop_pointer() : () -> i64
        %2013 = func.call @stack_pop_pointer() : () -> i64
        %2014 = func.call @cc_cons(%2012, %2013) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2014) : (i64) -> ()
        %2015 = llvm.mlir.addressof @str210 : !llvm.ptr
        %2016 = arith.constant 7 : i64
        %2017 = func.call @cc_make_string(%2015, %2016) : (!llvm.ptr, i64) -> i64
        %2018 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2019 = arith.constant 7 : i64
        %2020 = func.call @cc_make_string(%2018, %2019) : (!llvm.ptr, i64) -> i64
        %2021 = func.call @cc_intern(%2017, %2020) : (i64, i64) -> i64
        %2022 = func.call @cc_nil_value() : () -> i64
        %2023 = func.call @cc_cons(%2021, %2022) : (i64, i64) -> i64
        %2024 = func.call @cc_values_pack(%2023) : (i64) -> i64
        %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
        %2025 = arith.addi %2021, %__rlasp_stack_elide_zero_163 : i64
        %2026 = func.call @stack_pop_pointer() : () -> i64
        %2027 = func.call @cc_cons(%2025, %2026) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2027) : (i64) -> ()
        %2028 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2028) : (i64) -> ()
        %2029 = llvm.mlir.addressof @str212 : !llvm.ptr
        %2030 = arith.constant 4 : i64
        %2031 = func.call @cc_make_string(%2029, %2030) : (!llvm.ptr, i64) -> i64
        %2032 = func.call @cc_nil_value() : () -> i64
        %2033 = func.call @cc_intern(%2031, %2032) : (i64, i64) -> i64
        %2034 = func.call @cc_nil_value() : () -> i64
        %2035 = func.call @cc_cons(%2033, %2034) : (i64, i64) -> i64
        %2036 = func.call @cc_values_pack(%2035) : (i64) -> i64
        %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
        %2037 = arith.addi %2033, %__rlasp_stack_elide_zero_164 : i64
        %2038 = func.call @stack_pop_pointer() : () -> i64
        %2039 = func.call @cc_cons(%2037, %2038) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2039) : (i64) -> ()
        %2040 = llvm.mlir.addressof @str213 : !llvm.ptr
        %2041 = arith.constant 8 : i64
        %2042 = func.call @cc_make_string(%2040, %2041) : (!llvm.ptr, i64) -> i64
        %2043 = llvm.mlir.addressof @str214 : !llvm.ptr
        %2044 = arith.constant 7 : i64
        %2045 = func.call @cc_make_string(%2043, %2044) : (!llvm.ptr, i64) -> i64
        %2046 = func.call @cc_intern(%2042, %2045) : (i64, i64) -> i64
        %2047 = func.call @cc_nil_value() : () -> i64
        %2048 = func.call @cc_cons(%2046, %2047) : (i64, i64) -> i64
        %2049 = func.call @cc_values_pack(%2048) : (i64) -> i64
        %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
        %2050 = arith.addi %2046, %__rlasp_stack_elide_zero_165 : i64
        %2051 = func.call @stack_pop_pointer() : () -> i64
        %2052 = func.call @cc_cons(%2050, %2051) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2052) : (i64) -> ()
        %2053 = llvm.mlir.addressof @str215 : !llvm.ptr
        %2054 = arith.constant 7 : i64
        %2055 = func.call @cc_make_string(%2053, %2054) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
        %2056 = arith.addi %2055, %__rlasp_stack_elide_zero_166 : i64
        %2057 = func.call @stack_pop_pointer() : () -> i64
        %2058 = func.call @cc_cons(%2056, %2057) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2058) : (i64) -> ()
        %2059 = llvm.mlir.addressof @str216 : !llvm.ptr
        %2060 = arith.constant 4 : i64
        %2061 = func.call @cc_make_string(%2059, %2060) : (!llvm.ptr, i64) -> i64
        %2062 = llvm.mlir.addressof @str217 : !llvm.ptr
        %2063 = arith.constant 7 : i64
        %2064 = func.call @cc_make_string(%2062, %2063) : (!llvm.ptr, i64) -> i64
        %2065 = func.call @cc_intern(%2061, %2064) : (i64, i64) -> i64
        %2066 = func.call @cc_nil_value() : () -> i64
        %2067 = func.call @cc_cons(%2065, %2066) : (i64, i64) -> i64
        %2068 = func.call @cc_values_pack(%2067) : (i64) -> i64
        %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
        %2069 = arith.addi %2065, %__rlasp_stack_elide_zero_167 : i64
        %2070 = func.call @stack_pop_pointer() : () -> i64
        %2071 = func.call @cc_cons(%2069, %2070) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2071) : (i64) -> ()
        %2072 = llvm.mlir.addressof @str218 : !llvm.ptr
        %2073 = arith.constant 13 : i64
        %2074 = func.call @cc_make_string(%2072, %2073) : (!llvm.ptr, i64) -> i64
        %2075 = llvm.mlir.addressof @str219 : !llvm.ptr
        %2076 = arith.constant 11 : i64
        %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
        %2078 = func.call @cc_intern(%2074, %2077) : (i64, i64) -> i64
        %2079 = func.call @cc_nil_value() : () -> i64
        %2080 = func.call @cc_cons(%2078, %2079) : (i64, i64) -> i64
        %2081 = func.call @cc_values_pack(%2080) : (i64) -> i64
        %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
        %2082 = arith.addi %2078, %__rlasp_stack_elide_zero_168 : i64
        %2083 = func.call @stack_pop_pointer() : () -> i64
        %2084 = func.call @cc_cons(%2082, %2083) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
        %2085 = arith.addi %2084, %__rlasp_stack_elide_zero_169 : i64
        %2086 = func.call @stack_pop_pointer() : () -> i64
        %2087 = func.call @cc_cons(%2085, %2086) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2087) : (i64) -> ()
        %2088 = llvm.mlir.addressof @str220 : !llvm.ptr
        %2089 = arith.constant 11 : i64
        %2090 = func.call @cc_make_string(%2088, %2089) : (!llvm.ptr, i64) -> i64
        %2091 = llvm.mlir.addressof @str221 : !llvm.ptr
        %2092 = arith.constant 7 : i64
        %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
        %2094 = func.call @cc_intern(%2090, %2093) : (i64, i64) -> i64
        %2095 = func.call @cc_nil_value() : () -> i64
        %2096 = func.call @cc_cons(%2094, %2095) : (i64, i64) -> i64
        %2097 = func.call @cc_values_pack(%2096) : (i64) -> i64
        %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
        %2098 = arith.addi %2094, %__rlasp_stack_elide_zero_170 : i64
        %2099 = func.call @stack_pop_pointer() : () -> i64
        %2100 = func.call @cc_cons(%2098, %2099) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2100) : (i64) -> ()
        %2101 = llvm.mlir.addressof @str222 : !llvm.ptr
        %2102 = arith.constant 4 : i64
        %2103 = func.call @cc_make_string(%2101, %2102) : (!llvm.ptr, i64) -> i64
        %2104 = func.call @cc_nil_value() : () -> i64
        %2105 = func.call @cc_intern(%2103, %2104) : (i64, i64) -> i64
        %2106 = func.call @cc_nil_value() : () -> i64
        %2107 = func.call @cc_cons(%2105, %2106) : (i64, i64) -> i64
        %2108 = func.call @cc_values_pack(%2107) : (i64) -> i64
        %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
        %2109 = arith.addi %2105, %__rlasp_stack_elide_zero_171 : i64
        %2110 = func.call @stack_pop_pointer() : () -> i64
        %2111 = func.call @cc_cons(%2109, %2110) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2111) : (i64) -> ()
        %2112 = llvm.mlir.addressof @str223 : !llvm.ptr
        %2113 = arith.constant 12 : i64
        %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
        %2115 = func.call @cc_nil_value() : () -> i64
        %2116 = func.call @cc_intern(%2114, %2115) : (i64, i64) -> i64
        %2117 = func.call @cc_nil_value() : () -> i64
        %2118 = func.call @cc_cons(%2116, %2117) : (i64, i64) -> i64
        %2119 = func.call @cc_values_pack(%2118) : (i64) -> i64
        %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
        %2120 = arith.addi %2116, %__rlasp_stack_elide_zero_172 : i64
        %2121 = func.call @stack_pop_pointer() : () -> i64
        %2122 = func.call @cc_cons(%2120, %2121) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
        %2123 = arith.addi %2122, %__rlasp_stack_elide_zero_173 : i64
        %2124 = func.call @cc_nil_value() : () -> i64
        %2125 = func.call @cc_cons(%2123, %2124) : (i64, i64) -> i64
        %2126 = llvm.mlir.addressof @str224 : !llvm.ptr
        %2127 = arith.constant 4 : i64
        %2128 = func.call @cc_make_string(%2126, %2127) : (!llvm.ptr, i64) -> i64
        %2129 = func.call @cc_nil_value() : () -> i64
        %2130 = func.call @cc_intern(%2128, %2129) : (i64, i64) -> i64
        %2131 = func.call @cc_nil_value() : () -> i64
        %2132 = func.call @cc_cons(%2130, %2131) : (i64, i64) -> i64
        %2133 = func.call @cc_values_pack(%2132) : (i64) -> i64
        %2134 = func.call @cc_symbol_value(%2130) : (i64) -> i64
        %2135 = func.call @cc_set_symbol_value(%2130, %1979) : (i64, i64) -> i64
        %2136 = func.call @cc_eval(%2125) : (i64) -> i64
        %2137 = func.call @cc_multiple_value_list(%2136) : (i64) -> i64
        %2138 = func.call @cc_symbol_value(%2130) : (i64) -> i64
        %2139 = func.call @cc_set_symbol_value(%2130, %2134) : (i64, i64) -> i64
        %2140 = func.call @cc_values_pack(%2137) : (i64) -> i64
        %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
        %2141 = arith.addi %2140, %__rlasp_stack_elide_zero_174 : i64
        %2142 = func.call @cc_nil_value() : () -> i64
        %2143 = func.call @cc_nil_value() : () -> i64
        %2144 = func.call @cc_errorp(%2142) : (i64) -> i64
        %2145 = arith.cmpi ne, %2144, %2143 : i64
        %2146 = scf.if %2145 -> (i64) {
          scf.yield %2142 : i64
        } else {
          %2147 = func.call @cc_nil_value() : () -> i64
          %2148 = func.call @cc_nil_value() : () -> i64
          %2149 = func.call @cc_errorp(%2141) : (i64) -> i64
          %2150 = arith.cmpi ne, %2149, %2148 : i64
          %2151 = arith.cmpi eq, %2148, %2148 : i64
          %2152 = arith.andi %2150, %2151 : i1
          %2153 = scf.if %2152 -> (i64) {
            scf.yield %2141 : i64
          } else {
            scf.yield %2148 : i64
          }
          %2154 = arith.cmpi ne, %2153, %2148 : i64
          scf.if %2154 {
            func.call @stack_push_pointer(%2153) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2141) : (i64) -> ()
            %2155 = llvm.mlir.addressof @str225 : !llvm.ptr
            %2156 = func.call @cc_make_function_ref_const(%2155) : (!llvm.ptr) -> i64
            %2157 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2156, %2157) : (i64, i64) -> ()
          }
          %2158 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %2159 = llvm.mlir.addressof @str226 : !llvm.ptr
          %2160 = arith.constant 7 : i64
          %2161 = func.call @cc_make_string(%2159, %2160) : (!llvm.ptr, i64) -> i64
          %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
          %2162 = arith.addi %2161, %__rlasp_stack_elide_zero_175 : i64
          %2163 = func.call @stack_pop_pointer() : () -> i64
          %2164 = func.call @cc_cons(%2162, %2163) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2164) : (i64) -> ()
          %2165 = func.call @cc_nil_value() : () -> i64
          %2166 = func.call @cc_errorp(%2141) : (i64) -> i64
          %2167 = arith.cmpi ne, %2166, %2165 : i64
          %2168 = arith.cmpi eq, %2165, %2165 : i64
          %2169 = arith.andi %2167, %2168 : i1
          %2170 = scf.if %2169 -> (i64) {
            scf.yield %2141 : i64
          } else {
            scf.yield %2165 : i64
          }
          %2171 = arith.cmpi ne, %2170, %2165 : i64
          scf.if %2171 {
            func.call @stack_push_pointer(%2170) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2141) : (i64) -> ()
            %2172 = llvm.mlir.addressof @str227 : !llvm.ptr
            %2173 = func.call @cc_make_function_ref_const(%2172) : (!llvm.ptr) -> i64
            %2174 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2173, %2174) : (i64, i64) -> ()
          }
          %2175 = func.call @stack_pop_pointer() : () -> i64
          %2176 = func.call @stack_pop_pointer() : () -> i64
          %2177 = func.call @cc_cons(%2175, %2176) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
          %2178 = arith.addi %2177, %__rlasp_stack_elide_zero_176 : i64
          %2179 = func.call @cc_string_equal_full(%2178) : (i64) -> i64
          %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
          %2180 = arith.addi %2179, %__rlasp_stack_elide_zero_177 : i64
          %2181 = func.call @cc_cons(%2180, %2147) : (i64, i64) -> i64
          %2182 = func.call @cc_cons(%2158, %2181) : (i64, i64) -> i64
          %2183 = func.call @cc_and(%2182) : (i64) -> i64
          %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
          %2184 = arith.addi %2183, %__rlasp_stack_elide_zero_178 : i64
          scf.yield %2184 : i64
        }
        %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
        %2185 = arith.addi %2146, %__rlasp_stack_elide_zero_179 : i64
        scf.yield %2185 : i64
      }
      func.call @stack_push_pointer(%1994) : (i64) -> ()
      %2186 = func.call @cc_restore_symbol_value(%1987, %1988) : (i64, i64) -> i64
      %2187 = func.call @cc_restore_symbol_value(%1982, %1983) : (i64, i64) -> i64
      %2188 = func.call @stack_pop_pointer() : () -> i64
      %2189 = func.call @cc_nil_value() : () -> i64
      %2190 = func.call @cc_cons(%2188, %2189) : (i64, i64) -> i64
      %2191 = func.call @cc_not(%2190) : (i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %2192 = arith.addi %2191, %__rlasp_stack_elide_zero_180 : i64
      %2193 = func.call @cc_nil_value() : () -> i64
      %2194 = func.call @cc_cons(%2192, %2193) : (i64, i64) -> i64
      %2195 = func.call @cc_not(%2194) : (i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %2196 = arith.addi %2195, %__rlasp_stack_elide_zero_181 : i64
      scf.yield %2196 : i64
    }
    func.call @stack_push_pointer(%1965) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647749"() {
    %2386 = func.call @cc_nil_value() : () -> i64
    %2387 = func.call @cc_nil_value() : () -> i64
    %2388 = func.call @cc_errorp(%2386) : (i64) -> i64
    %2389 = arith.cmpi ne, %2388, %2387 : i64
    %2390 = scf.if %2389 -> (i64) {
      scf.yield %2386 : i64
    } else {
      %2391 = func.call @cc_make_string_output_stream() : () -> i64
      %2392 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2393 = arith.constant 17 : i64
      %2394 = func.call @cc_make_string(%2392, %2393) : (!llvm.ptr, i64) -> i64
      %2395 = func.call @cc_nil_value() : () -> i64
      %2396 = func.call @cc_intern(%2394, %2395) : (i64, i64) -> i64
      %2397 = func.call @cc_nil_value() : () -> i64
      %2398 = func.call @cc_cons(%2396, %2397) : (i64, i64) -> i64
      %2399 = func.call @cc_values_pack(%2398) : (i64) -> i64
      %2400 = func.call @cc_symbol_value(%2396) : (i64) -> i64
      %2401 = func.call @cc_set_symbol_value(%2396, %2391) : (i64, i64) -> i64
      %2402 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2403 = func.call @stack_pop_pointer() : () -> i64
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = func.call @cc_cons(%2403, %2404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2405) : (i64) -> ()
      %2406 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2407 = arith.constant 5 : i64
      %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
      %2409 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2410 = arith.constant 7 : i64
      %2411 = func.call @cc_make_string(%2409, %2410) : (!llvm.ptr, i64) -> i64
      %2412 = func.call @cc_intern(%2408, %2411) : (i64, i64) -> i64
      %2413 = func.call @cc_nil_value() : () -> i64
      %2414 = func.call @cc_cons(%2412, %2413) : (i64, i64) -> i64
      %2415 = func.call @cc_values_pack(%2414) : (i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %2416 = arith.addi %2412, %__rlasp_stack_elide_zero_182 : i64
      %2417 = func.call @stack_pop_pointer() : () -> i64
      %2418 = func.call @cc_cons(%2416, %2417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2419 = func.call @stack_pop_pointer() : () -> i64
      %2420 = func.call @stack_pop_pointer() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2421) : (i64) -> ()
      %2422 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2423 = arith.constant 7 : i64
      %2424 = func.call @cc_make_string(%2422, %2423) : (!llvm.ptr, i64) -> i64
      %2425 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2426 = arith.constant 7 : i64
      %2427 = func.call @cc_make_string(%2425, %2426) : (!llvm.ptr, i64) -> i64
      %2428 = func.call @cc_intern(%2424, %2427) : (i64, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_cons(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_values_pack(%2430) : (i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %2432 = arith.addi %2428, %__rlasp_stack_elide_zero_183 : i64
      %2433 = func.call @stack_pop_pointer() : () -> i64
      %2434 = func.call @cc_cons(%2432, %2433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2434) : (i64) -> ()
      %2435 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2436 = arith.constant 44 : i64
      %2437 = func.call @cc_make_string(%2435, %2436) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %2438 = arith.addi %2437, %__rlasp_stack_elide_zero_184 : i64
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @cc_cons(%2438, %2439) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2440) : (i64) -> ()
      %2441 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2442 = arith.constant 12 : i64
      %2443 = func.call @cc_make_string(%2441, %2442) : (!llvm.ptr, i64) -> i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_intern(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_nil_value() : () -> i64
      %2447 = func.call @cc_cons(%2445, %2446) : (i64, i64) -> i64
      %2448 = func.call @cc_values_pack(%2447) : (i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %2449 = arith.addi %2445, %__rlasp_stack_elide_zero_185 : i64
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @cc_cons(%2449, %2450) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %2452 = arith.addi %2451, %__rlasp_stack_elide_zero_186 : i64
      %2453 = func.call @cc_nil_value() : () -> i64
      %2454 = func.call @cc_cons(%2452, %2453) : (i64, i64) -> i64
      %2455 = func.call @cc_eval(%2454) : (i64) -> i64
      %2456 = func.call @cc_multiple_value_list(%2455) : (i64) -> i64
      %2457 = func.call @cc_values_pack(%2456) : (i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %2458 = arith.addi %2457, %__rlasp_stack_elide_zero_187 : i64
      %2459 = func.call @cc_nil_value() : () -> i64
      %2460 = func.call @cc_errorp(%2458) : (i64) -> i64
      %2461 = arith.cmpi ne, %2460, %2459 : i64
      %2462 = scf.if %2461 -> (i64) {
        scf.yield %2458 : i64
      } else {
        %2463 = func.call @cc_get_output_stream_string(%2391) : (i64) -> i64
        scf.yield %2463 : i64
      }
      func.call @stack_push_pointer(%2462) : (i64) -> ()
      %2464 = func.call @cc_set_symbol_value(%2396, %2400) : (i64, i64) -> i64
      %2465 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2465 : i64
    }
    func.call @stack_push_pointer(%2390) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_96094591647744*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_96094591647744*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_96094591647744*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("COMPILE-FILE-PATHNAME-1\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str6("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("test.lisp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str11("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("test.newfasl\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("test.lisp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str15("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("test.newfasl\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str18("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str19("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str20("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str27("COMPILE-FILE-PARALLEL\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str28("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str31("*COMPILE-FILE-PARALLEL*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str32("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str33("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str34("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str35("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str36("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str37("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str43("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str48("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str49("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str66("cmp::*compile-file-parallel*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str67("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str73("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str83("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str85("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str87("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str88("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str90("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str91("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str92("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str93("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str94("COMPILE-FILE-SERIAL\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str95("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str96("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str97("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str98("*COMPILE-FILE-PARALLEL*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str99("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str100("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str101("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str102("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str103("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str104("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str107("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str119("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str131("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str133("cmp::*compile-file-parallel*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str134("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str135("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str136("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str138("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str139("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str142("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str149("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str150("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str152("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str153("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str154("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str156("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str157("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str160("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str161("COMPILE-FILE-SERIAL-NO-FASO\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str162("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str163("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str164("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("*COMPILE-FILE-PARALLEL*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str166("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str167("*DEFAULT-OUTPUT-TYPE*\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str168("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str169("FASO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str170("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str171("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str172("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str173("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str174("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str176("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str178("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str183("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str184("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str191("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str192("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str193("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str200("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str202("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str203("FASO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str205("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str206("cmp::*compile-file-parallel*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str207("cmp:*default-output-type*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str208("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str210("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str212("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str213("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str214("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str216("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str218("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str223("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str224("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str226("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str228("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str229("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str231("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str233("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str234("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str235("COMPILE-FILE.1.SIMPLIFIED\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str236("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str237("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str243("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str246("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str247("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str248("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str250("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str251("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str252("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str253("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str254("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str255("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str257("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETFLAG_96094591647744*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str262("*__MLIR_BLOCK_RETMVLIST_96094591647744*\00") : !llvm.array<40 x i8>
}
