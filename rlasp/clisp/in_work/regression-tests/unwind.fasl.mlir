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
      %57 = arith.constant 22 : i64
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
      %74 = arith.constant 7 : i64
      %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
      %76 = func.call @cc_nil_value() : () -> i64
      %77 = func.call @cc_intern(%75, %76) : (i64, i64) -> i64
      %78 = func.call @cc_nil_value() : () -> i64
      %79 = func.call @cc_cons(%77, %78) : (i64, i64) -> i64
      %80 = func.call @cc_values_pack(%79) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %81 = llvm.mlir.addressof @str8 : !llvm.ptr
      %82 = arith.constant 20 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      %84 = llvm.mlir.addressof @str9 : !llvm.ptr
      %85 = arith.constant 7 : i64
      %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
      %87 = func.call @cc_intern(%83, %86) : (i64, i64) -> i64
      %88 = func.call @cc_nil_value() : () -> i64
      %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
      %90 = func.call @cc_values_pack(%89) : (i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @cc_cons(%92, %91) : (i64, i64) -> i64
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
      func.call @stack_push_pointer(%102) : (i64) -> ()
      %103 = llvm.mlir.addressof @str10 : !llvm.ptr
      %104 = arith.constant 22 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = llvm.mlir.addressof @str11 : !llvm.ptr
      %107 = arith.constant 3 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = func.call @cc_intern(%105, %108) : (i64, i64) -> i64
      %110 = func.call @cc_nil_value() : () -> i64
      %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
      %112 = func.call @cc_values_pack(%111) : (i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      %113 = llvm.mlir.addressof @str12 : !llvm.ptr
      %114 = arith.constant 2 : i64
      %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%115) : (i64) -> ()
      %116 = llvm.mlir.addressof @str13 : !llvm.ptr
      %117 = arith.constant 4 : i64
      %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = func.call @cc_cons(%120, %119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %122 = arith.addi %121, %__rlasp_stack_elide_zero_4 : i64
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @cc_cons(%123, %122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %125 = llvm.mlir.addressof @str14 : !llvm.ptr
      %126 = arith.constant 12 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = llvm.mlir.addressof @str15 : !llvm.ptr
      %129 = arith.constant 11 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = func.call @cc_intern(%127, %130) : (i64, i64) -> i64
      %132 = func.call @cc_nil_value() : () -> i64
      %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
      %134 = func.call @cc_values_pack(%133) : (i64) -> i64
      func.call @stack_push_pointer(%131) : (i64) -> ()
      %135 = llvm.mlir.addressof @str16 : !llvm.ptr
      %136 = arith.constant 36 : i64
      %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%137) : (i64) -> ()
      %138 = llvm.mlir.addressof @str17 : !llvm.ptr
      %139 = arith.constant 9 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = llvm.mlir.addressof @str18 : !llvm.ptr
      %142 = arith.constant 7 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      %144 = func.call @cc_intern(%140, %143) : (i64, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_values_pack(%146) : (i64) -> i64
      func.call @stack_push_pointer(%144) : (i64) -> ()
      %148 = llvm.mlir.addressof @str19 : !llvm.ptr
      %149 = arith.constant 6 : i64
      %150 = func.call @cc_make_string(%148, %149) : (!llvm.ptr, i64) -> i64
      %151 = llvm.mlir.addressof @str20 : !llvm.ptr
      %152 = arith.constant 7 : i64
      %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
      %154 = func.call @cc_intern(%150, %153) : (i64, i64) -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
      %157 = func.call @cc_values_pack(%156) : (i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      %158 = llvm.mlir.addressof @str21 : !llvm.ptr
      %159 = arith.constant 11 : i64
      %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
      %161 = llvm.mlir.addressof @str22 : !llvm.ptr
      %162 = arith.constant 7 : i64
      %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
      %164 = func.call @cc_intern(%160, %163) : (i64, i64) -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
      %167 = func.call @cc_values_pack(%166) : (i64) -> i64
      func.call @stack_push_pointer(%164) : (i64) -> ()
      %168 = llvm.mlir.addressof @str23 : !llvm.ptr
      %169 = arith.constant 13 : i64
      %170 = func.call @cc_make_string(%168, %169) : (!llvm.ptr, i64) -> i64
      %171 = llvm.mlir.addressof @str24 : !llvm.ptr
      %172 = arith.constant 11 : i64
      %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
      %174 = func.call @cc_intern(%170, %173) : (i64, i64) -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_cons(%174, %175) : (i64, i64) -> i64
      %177 = func.call @cc_values_pack(%176) : (i64) -> i64
      func.call @stack_push_pointer(%174) : (i64) -> ()
      %178 = llvm.mlir.addressof @str25 : !llvm.ptr
      %179 = arith.constant 4 : i64
      %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
      %181 = llvm.mlir.addressof @str26 : !llvm.ptr
      %182 = arith.constant 7 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      %184 = func.call @cc_intern(%180, %183) : (i64, i64) -> i64
      %185 = func.call @cc_nil_value() : () -> i64
      %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
      %187 = func.call @cc_values_pack(%186) : (i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %188 = llvm.mlir.addressof @str27 : !llvm.ptr
      %189 = arith.constant 13 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = llvm.mlir.addressof @str28 : !llvm.ptr
      %192 = arith.constant 11 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = func.call @cc_intern(%190, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      %198 = llvm.mlir.addressof @str29 : !llvm.ptr
      %199 = arith.constant 21 : i64
      %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
      %201 = llvm.mlir.addressof @str30 : !llvm.ptr
      %202 = arith.constant 11 : i64
      %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
      %204 = func.call @cc_intern(%200, %203) : (i64, i64) -> i64
      %205 = func.call @cc_nil_value() : () -> i64
      %206 = func.call @cc_cons(%204, %205) : (i64, i64) -> i64
      %207 = func.call @cc_values_pack(%206) : (i64) -> i64
      func.call @stack_push_pointer(%204) : (i64) -> ()
      %208 = llvm.mlir.addressof @str31 : !llvm.ptr
      %209 = arith.constant 8 : i64
      %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %211 = func.call @stack_pop_pointer() : () -> i64
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @cc_cons(%212, %211) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %214 = arith.addi %213, %__rlasp_stack_elide_zero_5 : i64
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = func.call @cc_cons(%215, %214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %217 = func.call @stack_pop_pointer() : () -> i64
      %218 = func.call @stack_pop_pointer() : () -> i64
      %219 = func.call @cc_cons(%218, %217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %220 = arith.addi %219, %__rlasp_stack_elide_zero_6 : i64
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @cc_cons(%221, %220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %223 = llvm.mlir.addressof @str32 : !llvm.ptr
      %224 = arith.constant 8 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str33 : !llvm.ptr
      %227 = arith.constant 7 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %233 = llvm.mlir.addressof @str34 : !llvm.ptr
      %234 = arith.constant 7 : i64
      %235 = func.call @cc_make_string(%233, %234) : (!llvm.ptr, i64) -> i64
      %236 = llvm.mlir.addressof @str35 : !llvm.ptr
      %237 = arith.constant 4 : i64
      %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
      %239 = func.call @cc_intern(%235, %238) : (i64, i64) -> i64
      %240 = func.call @cc_nil_value() : () -> i64
      %241 = func.call @cc_cons(%239, %240) : (i64, i64) -> i64
      %242 = func.call @cc_values_pack(%241) : (i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %243 = llvm.mlir.addressof @str36 : !llvm.ptr
      %244 = arith.constant 12 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @cc_cons(%247, %246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %249 = arith.addi %248, %__rlasp_stack_elide_zero_7 : i64
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @cc_cons(%250, %249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @cc_cons(%253, %252) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %255 = arith.addi %254, %__rlasp_stack_elide_zero_8 : i64
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @cc_cons(%256, %255) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %258 = arith.addi %257, %__rlasp_stack_elide_zero_9 : i64
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @cc_cons(%259, %258) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %261 = arith.addi %260, %__rlasp_stack_elide_zero_10 : i64
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_cons(%262, %261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %264 = arith.addi %263, %__rlasp_stack_elide_zero_11 : i64
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @cc_cons(%265, %264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @cc_cons(%268, %267) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %270 = arith.addi %269, %__rlasp_stack_elide_zero_12 : i64
      %271 = func.call @stack_pop_pointer() : () -> i64
      %272 = func.call @cc_cons(%271, %270) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %273 = arith.addi %272, %__rlasp_stack_elide_zero_13 : i64
      %274 = func.call @stack_pop_pointer() : () -> i64
      %275 = func.call @cc_cons(%274, %273) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %276 = arith.addi %275, %__rlasp_stack_elide_zero_14 : i64
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @cc_cons(%277, %276) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %279 = arith.addi %278, %__rlasp_stack_elide_zero_15 : i64
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @cc_cons(%280, %279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %282 = arith.addi %281, %__rlasp_stack_elide_zero_16 : i64
      %283 = func.call @stack_pop_pointer() : () -> i64
      %284 = func.call @cc_cons(%283, %282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      %285 = llvm.mlir.addressof @str37 : !llvm.ptr
      %286 = arith.constant 1 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = llvm.mlir.addressof @str38 : !llvm.ptr
      %289 = arith.constant 11 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = func.call @cc_intern(%287, %290) : (i64, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_values_pack(%293) : (i64) -> i64
      func.call @stack_push_pointer(%291) : (i64) -> ()
      %295 = llvm.mlir.addressof @str39 : !llvm.ptr
      %296 = arith.constant 20 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = llvm.mlir.addressof @str40 : !llvm.ptr
      %299 = arith.constant 7 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = func.call @cc_intern(%297, %300) : (i64, i64) -> i64
      %302 = func.call @cc_nil_value() : () -> i64
      %303 = func.call @cc_cons(%301, %302) : (i64, i64) -> i64
      %304 = func.call @cc_values_pack(%303) : (i64) -> i64
      func.call @stack_push_pointer(%301) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %305 = func.call @stack_pop_pointer() : () -> i64
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @cc_cons(%306, %305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%307) : (i64) -> ()
      %308 = llvm.mlir.addressof @str41 : !llvm.ptr
      %309 = arith.constant 7 : i64
      %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
      %311 = func.call @cc_nil_value() : () -> i64
      %312 = func.call @cc_intern(%310, %311) : (i64, i64) -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_cons(%312, %313) : (i64, i64) -> i64
      %315 = func.call @cc_values_pack(%314) : (i64) -> i64
      func.call @stack_push_pointer(%312) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %316 = func.call @stack_pop_pointer() : () -> i64
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @cc_cons(%317, %316) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %319 = arith.addi %318, %__rlasp_stack_elide_zero_17 : i64
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = func.call @cc_cons(%320, %319) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %322 = arith.addi %321, %__rlasp_stack_elide_zero_18 : i64
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @cc_cons(%323, %322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %325 = func.call @stack_pop_pointer() : () -> i64
      %326 = func.call @stack_pop_pointer() : () -> i64
      %327 = func.call @cc_cons(%326, %325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %328 = arith.addi %327, %__rlasp_stack_elide_zero_19 : i64
      %329 = func.call @stack_pop_pointer() : () -> i64
      %330 = func.call @cc_cons(%329, %328) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %331 = arith.addi %330, %__rlasp_stack_elide_zero_20 : i64
      %332 = func.call @stack_pop_pointer() : () -> i64
      %333 = func.call @cc_cons(%332, %331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %334 = arith.addi %333, %__rlasp_stack_elide_zero_21 : i64
      %335 = func.call @stack_pop_pointer() : () -> i64
      %336 = func.call @cc_cons(%335, %334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @stack_pop_pointer() : () -> i64
      %339 = func.call @cc_cons(%338, %337) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %340 = arith.addi %339, %__rlasp_stack_elide_zero_22 : i64
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @cc_cons(%341, %340) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %343 = arith.addi %342, %__rlasp_stack_elide_zero_23 : i64
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = func.call @cc_cons(%344, %343) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %346 = arith.addi %345, %__rlasp_stack_elide_zero_24 : i64
      %598 = arith.constant 76042832183297 : i64
      %599 = arith.constant 0 : i64
      %600 = func.call @cc_make_closure(%598, %599) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %601 = arith.addi %600, %__rlasp_stack_elide_zero_25 : i64
      %602 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %606 = arith.addi %605, %__rlasp_stack_elide_zero_26 : i64
      %607 = llvm.mlir.addressof @str69 : !llvm.ptr
      %608 = arith.constant 11 : i64
      %609 = func.call @cc_make_string(%607, %608) : (!llvm.ptr, i64) -> i64
      %610 = llvm.mlir.addressof @str70 : !llvm.ptr
      %611 = arith.constant 7 : i64
      %612 = func.call @cc_make_string(%610, %611) : (!llvm.ptr, i64) -> i64
      %613 = func.call @cc_intern(%609, %612) : (i64, i64) -> i64
      %614 = func.call @cc_nil_value() : () -> i64
      %615 = func.call @cc_cons(%613, %614) : (i64, i64) -> i64
      %616 = func.call @cc_values_pack(%615) : (i64) -> i64
      %617 = func.call @cc_nil_value() : () -> i64
      %618 = llvm.mlir.addressof @str71 : !llvm.ptr
      %619 = arith.constant 4 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = llvm.mlir.addressof @str72 : !llvm.ptr
      %622 = arith.constant 7 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = func.call @cc_intern(%620, %623) : (i64, i64) -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      %627 = func.call @cc_values_pack(%626) : (i64) -> i64
      %628 = llvm.mlir.addressof @str73 : !llvm.ptr
      %629 = arith.constant 6 : i64
      %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_intern(%630, %631) : (i64, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_values_pack(%634) : (i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %636 = arith.addi %632, %__rlasp_stack_elide_zero_27 : i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_errorp(%64) : (i64) -> i64
      %639 = arith.cmpi ne, %638, %637 : i64
      %640 = arith.cmpi eq, %637, %637 : i64
      %641 = arith.andi %639, %640 : i1
      %642 = scf.if %641 -> (i64) {
        scf.yield %64 : i64
      } else {
        scf.yield %637 : i64
      }
      %643 = func.call @cc_errorp(%346) : (i64) -> i64
      %644 = arith.cmpi ne, %643, %637 : i64
      %645 = arith.cmpi eq, %642, %637 : i64
      %646 = arith.andi %644, %645 : i1
      %647 = scf.if %646 -> (i64) {
        scf.yield %346 : i64
      } else {
        scf.yield %642 : i64
      }
      %648 = func.call @cc_errorp(%601) : (i64) -> i64
      %649 = arith.cmpi ne, %648, %637 : i64
      %650 = arith.cmpi eq, %647, %637 : i64
      %651 = arith.andi %649, %650 : i1
      %652 = scf.if %651 -> (i64) {
        scf.yield %601 : i64
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
        func.call @stack_push_pointer(%64) : (i64) -> ()
        func.call @stack_push_pointer(%346) : (i64) -> ()
        func.call @stack_push_pointer(%601) : (i64) -> ()
        func.call @stack_push_pointer(%606) : (i64) -> ()
        func.call @stack_push_pointer(%613) : (i64) -> ()
        func.call @stack_push_pointer(%617) : (i64) -> ()
        func.call @stack_push_pointer(%624) : (i64) -> ()
        func.call @stack_push_pointer(%636) : (i64) -> ()
        %679 = llvm.mlir.addressof @str74 : !llvm.ptr
        %680 = func.call @cc_make_function_ref_const(%679) : (!llvm.ptr) -> i64
        %681 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%680, %681) : (i64, i64) -> ()
      }
      %682 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %682 : i64
    }
    %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
    %683 = arith.addi %55, %__rlasp_stack_elide_zero_28 : i64
    %684 = func.call @cc_multiple_value_list(%683) : (i64) -> i64
    %685 = llvm.mlir.addressof @str75 : !llvm.ptr
    %686 = arith.constant 37 : i64
    %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
    %688 = func.call @cc_nil_value() : () -> i64
    %689 = func.call @cc_intern(%687, %688) : (i64, i64) -> i64
    %690 = func.call @cc_nil_value() : () -> i64
    %691 = func.call @cc_cons(%689, %690) : (i64, i64) -> i64
    %692 = func.call @cc_values_pack(%691) : (i64) -> i64
    %693 = func.call @cc_symbol_value(%689) : (i64) -> i64
    %694 = llvm.mlir.addressof @str76 : !llvm.ptr
    %695 = arith.constant 39 : i64
    %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
    %697 = func.call @cc_nil_value() : () -> i64
    %698 = func.call @cc_intern(%696, %697) : (i64, i64) -> i64
    %699 = func.call @cc_nil_value() : () -> i64
    %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
    %701 = func.call @cc_values_pack(%700) : (i64) -> i64
    %702 = func.call @cc_symbol_value(%698) : (i64) -> i64
    %703 = func.call @cc_nil_value() : () -> i64
    %704 = arith.cmpi ne, %693, %703 : i64
    %705 = scf.if %704 -> (i64) {
      scf.yield %702 : i64
    } else {
      scf.yield %684 : i64
    }
    %706 = func.call @cc_values_pack(%705) : (i64) -> i64
    func.call @stack_push_pointer(%706) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_76042832183297"() {
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = func.call @cc_nil_value() : () -> i64
    %349 = func.call @cc_errorp(%347) : (i64) -> i64
    %350 = arith.cmpi ne, %349, %348 : i64
    %351 = scf.if %350 -> (i64) {
      scf.yield %347 : i64
    } else {
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = arith.cmpi ne, %352, %352 : i64
      scf.if %353 {
        func.call @stack_push_pointer(%352) : (i64) -> ()
      } else {
        %354 = llvm.mlir.addressof @str42 : !llvm.ptr
        %355 = func.call @cc_make_function_ref_const(%354) : (!llvm.ptr) -> i64
        %356 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%355, %356) : (i64, i64) -> ()
      }
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @cc_nil_value() : () -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_errorp(%358) : (i64) -> i64
      %361 = arith.cmpi ne, %360, %359 : i64
      %362 = scf.if %361 -> (i64) {
        scf.yield %358 : i64
      } else {
        %363 = llvm.mlir.addressof @str43 : !llvm.ptr
        %364 = arith.constant 2 : i64
        %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
        %366 = arith.addi %365, %__rlasp_stack_elide_zero_29 : i64
        %367 = llvm.mlir.addressof @str44 : !llvm.ptr
        %368 = arith.constant 4 : i64
        %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%369) : (i64) -> ()
        %370 = arith.constant 4 : i64
        %371 = func.call @cc_collect_args(%370) : (i64) -> i64
        %372 = func.call @cc_funcall(%366, %371) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
        %373 = arith.addi %372, %__rlasp_stack_elide_zero_30 : i64
        %374 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%374) : (i64) -> ()
        %375 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%375) : (i64) -> ()
        %376 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%376) : (i64) -> ()
        %377 = llvm.mlir.addressof @str45 : !llvm.ptr
        %378 = arith.constant 12 : i64
        %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
        %380 = arith.addi %379, %__rlasp_stack_elide_zero_31 : i64
        %381 = func.call @stack_pop_pointer() : () -> i64
        %382 = func.call @cc_cons(%380, %381) : (i64, i64) -> i64
        func.call @stack_push_pointer(%382) : (i64) -> ()
        %383 = llvm.mlir.addressof @str46 : !llvm.ptr
        %384 = arith.constant 7 : i64
        %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
        %386 = llvm.mlir.addressof @str47 : !llvm.ptr
        %387 = arith.constant 4 : i64
        %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
        %389 = func.call @cc_intern(%385, %388) : (i64, i64) -> i64
        %390 = func.call @cc_nil_value() : () -> i64
        %391 = func.call @cc_cons(%389, %390) : (i64, i64) -> i64
        %392 = func.call @cc_values_pack(%391) : (i64) -> i64
        %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
        %393 = arith.addi %389, %__rlasp_stack_elide_zero_32 : i64
        %394 = func.call @stack_pop_pointer() : () -> i64
        %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
        %396 = arith.addi %395, %__rlasp_stack_elide_zero_33 : i64
        %397 = func.call @stack_pop_pointer() : () -> i64
        %398 = func.call @cc_cons(%396, %397) : (i64, i64) -> i64
        func.call @stack_push_pointer(%398) : (i64) -> ()
        %399 = llvm.mlir.addressof @str48 : !llvm.ptr
        %400 = arith.constant 8 : i64
        %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
        %402 = llvm.mlir.addressof @str49 : !llvm.ptr
        %403 = arith.constant 7 : i64
        %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
        %405 = func.call @cc_intern(%401, %404) : (i64, i64) -> i64
        %406 = func.call @cc_nil_value() : () -> i64
        %407 = func.call @cc_cons(%405, %406) : (i64, i64) -> i64
        %408 = func.call @cc_values_pack(%407) : (i64) -> i64
        %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
        %409 = arith.addi %405, %__rlasp_stack_elide_zero_34 : i64
        %410 = func.call @stack_pop_pointer() : () -> i64
        %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
        func.call @stack_push_pointer(%411) : (i64) -> ()
        %412 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%412) : (i64) -> ()
        %413 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %414 = llvm.mlir.addressof @str50 : !llvm.ptr
        %415 = arith.constant 8 : i64
        %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
        %417 = arith.addi %416, %__rlasp_stack_elide_zero_35 : i64
        %418 = func.call @stack_pop_pointer() : () -> i64
        %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
        func.call @stack_push_pointer(%419) : (i64) -> ()
        %420 = llvm.mlir.addressof @str51 : !llvm.ptr
        %421 = arith.constant 21 : i64
        %422 = func.call @cc_make_string(%420, %421) : (!llvm.ptr, i64) -> i64
        %423 = llvm.mlir.addressof @str52 : !llvm.ptr
        %424 = arith.constant 11 : i64
        %425 = func.call @cc_make_string(%423, %424) : (!llvm.ptr, i64) -> i64
        %426 = func.call @cc_intern(%422, %425) : (i64, i64) -> i64
        %427 = func.call @cc_nil_value() : () -> i64
        %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
        %429 = func.call @cc_values_pack(%428) : (i64) -> i64
        %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
        %430 = arith.addi %426, %__rlasp_stack_elide_zero_36 : i64
        %431 = func.call @stack_pop_pointer() : () -> i64
        %432 = func.call @cc_cons(%430, %431) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
        %433 = arith.addi %432, %__rlasp_stack_elide_zero_37 : i64
        %434 = func.call @stack_pop_pointer() : () -> i64
        %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
        func.call @stack_push_pointer(%435) : (i64) -> ()
        %436 = llvm.mlir.addressof @str53 : !llvm.ptr
        %437 = arith.constant 13 : i64
        %438 = func.call @cc_make_string(%436, %437) : (!llvm.ptr, i64) -> i64
        %439 = llvm.mlir.addressof @str54 : !llvm.ptr
        %440 = arith.constant 11 : i64
        %441 = func.call @cc_make_string(%439, %440) : (!llvm.ptr, i64) -> i64
        %442 = func.call @cc_intern(%438, %441) : (i64, i64) -> i64
        %443 = func.call @cc_nil_value() : () -> i64
        %444 = func.call @cc_cons(%442, %443) : (i64, i64) -> i64
        %445 = func.call @cc_values_pack(%444) : (i64) -> i64
        %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
        %446 = arith.addi %442, %__rlasp_stack_elide_zero_38 : i64
        %447 = func.call @stack_pop_pointer() : () -> i64
        %448 = func.call @cc_cons(%446, %447) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
        %449 = arith.addi %448, %__rlasp_stack_elide_zero_39 : i64
        %450 = func.call @stack_pop_pointer() : () -> i64
        %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
        func.call @stack_push_pointer(%451) : (i64) -> ()
        %452 = llvm.mlir.addressof @str55 : !llvm.ptr
        %453 = arith.constant 4 : i64
        %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
        %455 = llvm.mlir.addressof @str56 : !llvm.ptr
        %456 = arith.constant 7 : i64
        %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
        %458 = func.call @cc_intern(%454, %457) : (i64, i64) -> i64
        %459 = func.call @cc_nil_value() : () -> i64
        %460 = func.call @cc_cons(%458, %459) : (i64, i64) -> i64
        %461 = func.call @cc_values_pack(%460) : (i64) -> i64
        %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
        %462 = arith.addi %458, %__rlasp_stack_elide_zero_40 : i64
        %463 = func.call @stack_pop_pointer() : () -> i64
        %464 = func.call @cc_cons(%462, %463) : (i64, i64) -> i64
        func.call @stack_push_pointer(%464) : (i64) -> ()
        %465 = llvm.mlir.addressof @str57 : !llvm.ptr
        %466 = arith.constant 13 : i64
        %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
        %468 = llvm.mlir.addressof @str58 : !llvm.ptr
        %469 = arith.constant 11 : i64
        %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
        %471 = func.call @cc_intern(%467, %470) : (i64, i64) -> i64
        %472 = func.call @cc_nil_value() : () -> i64
        %473 = func.call @cc_cons(%471, %472) : (i64, i64) -> i64
        %474 = func.call @cc_values_pack(%473) : (i64) -> i64
        %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
        %475 = arith.addi %471, %__rlasp_stack_elide_zero_41 : i64
        %476 = func.call @stack_pop_pointer() : () -> i64
        %477 = func.call @cc_cons(%475, %476) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
        %478 = arith.addi %477, %__rlasp_stack_elide_zero_42 : i64
        %479 = func.call @stack_pop_pointer() : () -> i64
        %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
        func.call @stack_push_pointer(%480) : (i64) -> ()
        %481 = llvm.mlir.addressof @str59 : !llvm.ptr
        %482 = arith.constant 11 : i64
        %483 = func.call @cc_make_string(%481, %482) : (!llvm.ptr, i64) -> i64
        %484 = llvm.mlir.addressof @str60 : !llvm.ptr
        %485 = arith.constant 7 : i64
        %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
        %487 = func.call @cc_intern(%483, %486) : (i64, i64) -> i64
        %488 = func.call @cc_nil_value() : () -> i64
        %489 = func.call @cc_cons(%487, %488) : (i64, i64) -> i64
        %490 = func.call @cc_values_pack(%489) : (i64) -> i64
        %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
        %491 = arith.addi %487, %__rlasp_stack_elide_zero_43 : i64
        %492 = func.call @stack_pop_pointer() : () -> i64
        %493 = func.call @cc_cons(%491, %492) : (i64, i64) -> i64
        func.call @stack_push_pointer(%493) : (i64) -> ()
        %494 = llvm.mlir.addressof @str61 : !llvm.ptr
        %495 = arith.constant 6 : i64
        %496 = func.call @cc_make_string(%494, %495) : (!llvm.ptr, i64) -> i64
        %497 = llvm.mlir.addressof @str62 : !llvm.ptr
        %498 = arith.constant 7 : i64
        %499 = func.call @cc_make_string(%497, %498) : (!llvm.ptr, i64) -> i64
        %500 = func.call @cc_intern(%496, %499) : (i64, i64) -> i64
        %501 = func.call @cc_nil_value() : () -> i64
        %502 = func.call @cc_cons(%500, %501) : (i64, i64) -> i64
        %503 = func.call @cc_values_pack(%502) : (i64) -> i64
        %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
        %504 = arith.addi %500, %__rlasp_stack_elide_zero_44 : i64
        %505 = func.call @stack_pop_pointer() : () -> i64
        %506 = func.call @cc_cons(%504, %505) : (i64, i64) -> i64
        func.call @stack_push_pointer(%506) : (i64) -> ()
        %507 = llvm.mlir.addressof @str63 : !llvm.ptr
        %508 = arith.constant 9 : i64
        %509 = func.call @cc_make_string(%507, %508) : (!llvm.ptr, i64) -> i64
        %510 = llvm.mlir.addressof @str64 : !llvm.ptr
        %511 = arith.constant 7 : i64
        %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
        %513 = func.call @cc_intern(%509, %512) : (i64, i64) -> i64
        %514 = func.call @cc_nil_value() : () -> i64
        %515 = func.call @cc_cons(%513, %514) : (i64, i64) -> i64
        %516 = func.call @cc_values_pack(%515) : (i64) -> i64
        %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
        %517 = arith.addi %513, %__rlasp_stack_elide_zero_45 : i64
        %518 = func.call @stack_pop_pointer() : () -> i64
        %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
        func.call @stack_push_pointer(%519) : (i64) -> ()
        %520 = llvm.mlir.addressof @str65 : !llvm.ptr
        %521 = arith.constant 36 : i64
        %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
        %523 = arith.addi %522, %__rlasp_stack_elide_zero_46 : i64
        %524 = func.call @stack_pop_pointer() : () -> i64
        %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
        func.call @stack_push_pointer(%525) : (i64) -> ()
        %526 = llvm.mlir.addressof @str66 : !llvm.ptr
        %527 = arith.constant 12 : i64
        %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
        %529 = func.call @cc_nil_value() : () -> i64
        %530 = func.call @cc_intern(%528, %529) : (i64, i64) -> i64
        %531 = func.call @cc_nil_value() : () -> i64
        %532 = func.call @cc_cons(%530, %531) : (i64, i64) -> i64
        %533 = func.call @cc_values_pack(%532) : (i64) -> i64
        %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
        %534 = arith.addi %530, %__rlasp_stack_elide_zero_47 : i64
        %535 = func.call @stack_pop_pointer() : () -> i64
        %536 = func.call @cc_cons(%534, %535) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
        %537 = arith.addi %536, %__rlasp_stack_elide_zero_48 : i64
        %538 = func.call @cc_nil_value() : () -> i64
        %539 = func.call @cc_cons(%537, %538) : (i64, i64) -> i64
        %540 = func.call @cc_eval(%539) : (i64) -> i64
        %541 = func.call @cc_multiple_value_list(%540) : (i64) -> i64
        %542 = func.call @cc_values_pack(%541) : (i64) -> i64
        %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
        %543 = arith.addi %542, %__rlasp_stack_elide_zero_49 : i64
        %544 = func.call @cc_nil_value() : () -> i64
        %545 = arith.cmpi ne, %544, %544 : i64
        scf.if %545 {
          func.call @stack_push_pointer(%544) : (i64) -> ()
        } else {
          %546 = llvm.mlir.addressof @str67 : !llvm.ptr
          %547 = func.call @cc_make_function_ref_const(%546) : (!llvm.ptr) -> i64
          %548 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%547, %548) : (i64, i64) -> ()
        }
        %549 = func.call @stack_pop_pointer() : () -> i64
        %551 = arith.constant 3 : i64
        %550 = arith.andi %549, %551 : i64
        %552 = arith.constant 0 : i64
        %553 = arith.cmpi eq, %550, %552 : i64
        %555 = arith.constant 3 : i64
        %554 = arith.andi %357, %555 : i64
        %556 = arith.constant 0 : i64
        %557 = arith.cmpi eq, %554, %556 : i64
        %558 = arith.andi %553, %557 : i1
        %559 = scf.if %558 -> (i64) {
          %560 = arith.constant 2 : i64
          %561 = arith.shrsi %549, %560 : i64
          %562 = arith.constant 2 : i64
          %563 = arith.shrsi %357, %562 : i64
          %564 = arith.subi %561, %563 : i64
          %565 = arith.constant -2305843009213693952 : i64
          %566 = arith.constant 2305843009213693951 : i64
          %567 = arith.cmpi sge, %564, %565 : i64
          %568 = arith.cmpi sle, %564, %566 : i64
          %569 = arith.andi %567, %568 : i1
          %570 = scf.if %569 -> (i64) {
            %571 = arith.constant 2 : i64
            %572 = arith.shli %564, %571 : i64
            scf.yield %572 : i64
          } else {
            %573 = func.call @cc_sub(%549, %357) : (i64, i64) -> i64
            scf.yield %573 : i64
          }
          scf.yield %570 : i64
        } else {
          %574 = func.call @cc_sub(%549, %357) : (i64, i64) -> i64
          scf.yield %574 : i64
        }
        %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
        %575 = arith.addi %559, %__rlasp_stack_elide_zero_50 : i64
        %576 = func.call @cc_nil_value() : () -> i64
        %577 = func.call @cc_errorp(%373) : (i64) -> i64
        %578 = arith.cmpi ne, %577, %576 : i64
        %579 = arith.cmpi eq, %576, %576 : i64
        %580 = arith.andi %578, %579 : i1
        %581 = scf.if %580 -> (i64) {
          scf.yield %373 : i64
        } else {
          scf.yield %576 : i64
        }
        %582 = func.call @cc_errorp(%543) : (i64) -> i64
        %583 = arith.cmpi ne, %582, %576 : i64
        %584 = arith.cmpi eq, %581, %576 : i64
        %585 = arith.andi %583, %584 : i1
        %586 = scf.if %585 -> (i64) {
          scf.yield %543 : i64
        } else {
          scf.yield %581 : i64
        }
        %587 = func.call @cc_errorp(%575) : (i64) -> i64
        %588 = arith.cmpi ne, %587, %576 : i64
        %589 = arith.cmpi eq, %586, %576 : i64
        %590 = arith.andi %588, %589 : i1
        %591 = scf.if %590 -> (i64) {
          scf.yield %575 : i64
        } else {
          scf.yield %586 : i64
        }
        %592 = arith.cmpi ne, %591, %576 : i64
        scf.if %592 {
          func.call @stack_push_pointer(%591) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%373) : (i64) -> ()
          func.call @stack_push_pointer(%543) : (i64) -> ()
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %593 = llvm.mlir.addressof @str68 : !llvm.ptr
          %594 = func.call @cc_make_function_ref_const(%593) : (!llvm.ptr) -> i64
          %595 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%594, %595) : (i64, i64) -> ()
        }
        %596 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %596 : i64
      }
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %597 = arith.addi %362, %__rlasp_stack_elide_zero_51 : i64
      scf.yield %597 : i64
    }
    func.call @stack_push_pointer(%351) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_76042832183296*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_76042832183296*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_76042832183296*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("COMPILE-FILE-NO-UNWIND\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("UNWINDS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("THREAD-LOCAL-UNWINDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str9("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("WITH-UNLOCKED-PACKAGES\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str11("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str12("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str13("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("sys:src;lisp;kernel;lsp;predlib.lisp\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str17("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("foo.lisp\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str32("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("MKSTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str36("/tmp/predlib\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str37("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("THREAD-LOCAL-UNWINDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str40("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str41("UNWINDS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("gctools:thread-local-unwinds\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str43("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str44("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("/tmp/predlib\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str46("MKSTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("foo.lisp\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str51("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str57("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("sys:src;lisp;kernel;lsp;predlib.lisp\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str66("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str67("gctools:thread-local-unwinds\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str68("ext:with-unlocked-packages\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str69("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETFLAG_76042832183296*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETMVLIST_76042832183296*\00") : !llvm.array<40 x i8>
}
